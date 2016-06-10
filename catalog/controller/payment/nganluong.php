<?php
class ControllerPaymentNganLuong extends Controller {
		public function index() {
				$this->language->load('payment/nganluong');
				$data['button_confirm'] = $this->language->get('button_confirm');
				$this->load->model('checkout/order');
				$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
				$this->load->library('encryption');
				$receiver = $this->config->get('nganluong_receiver');
				$secure_pass = $this->config->get('nganluong_security');
				$merchant_site_code = $this->config->get('nganluong_merchant');
				$return_url = $this->config->get('nganluong_callback');
				$order_code = $this->session->data['order_id'];
				//$price = preg_replace('/[\D]+/', '', $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false));
				$price = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
				$_SESSION['link_pay'] = $this->buildCheckoutUrlNew('https://www.nganluong.vn/checkout.php', $merchant_site_code, $secure_pass, trim($return_url), $receiver, '', $order_code, $price, 'usd', 1, 0, 0, 0, 0, '', '', '');
				
				$data['continue'] = $this->url->link('checkout/success');
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/nganluong.tpl')) {
						//$this->template = $this->config->get('config_template') . '/template/payment/nganluong.tpl';
						return $this->load->view($this->config->get('config_template') . '/template/payment/nganluong.tpl', $data);
				}
				else {
						//$this->template = 'default/template/payment/nganluong.tpl';
						return $this->load->view('default/template/payment/nganluong.tpl', $data);
				}
		}
		public function confirm() {
				$this->load->model('checkout/order');
				$this->model_checkout_order->confirm($this->session->data['order_id'], 2);
		}

		public function callback() {
				$receiver = $this->config->get('nganluong_receiver');
				$secure_pass = $this->config->get('nganluong_security');
				$merchant_site_code = $this->config->get('nganluong_merchant');
				$verify = $this->verifyPaymentUrl($merchant_site_code, $secure_pass, $_REQUEST['transaction_info'], $_REQUEST['order_code'], $_REQUEST['price'], $_REQUEST['payment_id'], $_REQUEST['payment_type'], $_REQUEST['error_text'], $_REQUEST['secure_code']);
				if ($verify) {
						$this->load->model('checkout/order');
						$order_info = $this->model_checkout_order->getOrder($_REQUEST['order_code']);
						$this->model_checkout_order->update($_REQUEST['order_code'], $this->config->get('nganluong_order_status_id'));
						$this->cart->clear();
				}
		}
		public function buildCheckoutUrlNew($nganluong_url,$merchant_site_code,$secure_pass,$return_url, $receiver, $transaction_info, $order_code, $price, $currency = 'usd', $quantity = 1, $tax = 0, $discount = 0, $fee_cal = 0, $fee_shipping = 0, $order_description = '', $buyer_info = '', $affiliate_code = ''){	
		$arr_param = array(
			'merchant_site_code'=>	strval($merchant_site_code),
			'return_url'		=>	strval($return_url),
			'receiver'			=>	strval($receiver),//tài khoản ngân lượng
			'transaction_info'	=>	strval($transaction_info),
			'order_code'		=>	strval($order_code),
			'price'				=>	strval($price),
			'currency'			=>	strval($currency),//hỗ trợ 2 loại tiền tệ currency usd,vnd
			'quantity'			=>	strval($quantity),//số lượng mặc định 1
			'tax'				=>	strval($tax),
			'discount'			=>	strval($discount),
			'fee_cal'			=>	strval($fee_cal),
			'fee_shipping'		=>	strval($fee_shipping),
			'order_description'	=>	strval($order_description),
			'buyer_info'		=>	strval($buyer_info),//Họ tên người mua *|* Địa chỉ Email *|* Điện thoại *|* Địa chỉ nhận hàng format có dạng
			'affiliate_code'	=>	strval($affiliate_code)
		);
		$secure_code ='';
		$secure_code = implode(' ', $arr_param) . ' ' . $secure_pass;
		$arr_param['secure_code'] = md5($secure_code);
		/* */
		$redirect_url = $nganluong_url;
		if (strpos($redirect_url, '?') === false) {
			$redirect_url .= '?';
		} else if (substr($redirect_url, strlen($redirect_url)-1, 1) != '?' && strpos($redirect_url, '&') === false) {
			$redirect_url .= '&';			
		}
				
		/* */
		$url = '';
		$url = 'currency='.$arr_param['currency'];
		unset($arr_param['currency']);
		foreach ($arr_param as $key=>$value) {
			$value = urlencode($value);
			if ($url == '') {
				$url .= $key . '=' . $value;
			} else {
				$url .= '&' . $key . '=' . $value;
			}
		}
		
		return $redirect_url.$url;
	}
		 

		/*Hàm thực hiện xác minh tính đúng đắn của các tham số trả về từ nganluong.vn*/
		
		public function verifyPaymentUrl($merchant_site_code,$secure_pass,$transaction_info, $order_code, $price, $payment_id, $payment_type, $error_text, $secure_code)
		{
			// Tạo mã xác thực từ chủ web
			$str = '';
			$str .= ' ' . strval($transaction_info);
			$str .= ' ' . strval($order_code);
			$str .= ' ' . strval($price);
			$str .= ' ' . strval($payment_id);
			$str .= ' ' . strval($payment_type);
			$str .= ' ' . strval($error_text);
			$str .= ' ' . strval($merchant_site_code);
			$str .= ' ' . strval($secure_pass);
	
			// Mã hóa các tham số
			$verify_secure_code = '';
			$verify_secure_code = md5($str);
			
			// Xác thực mã của chủ web với mã trả về từ nganluong.vn
			if ($verify_secure_code === $secure_code) return true;
			
			return false;
		}
}

?>