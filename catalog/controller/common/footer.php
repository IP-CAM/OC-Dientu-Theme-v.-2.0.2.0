<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
        $data['text_calender'] = $this->language->get('text_calender');
        $data['text_about'] = $this->language->get('text_about');
        $data['text_dichvu'] = $this->language->get('text_dichvu');
        $data['text_support1'] = $this->language->get('text_support1');
        $data['text_support2'] = $this->language->get('text_support2');
        $data['text_support3'] = $this->language->get('text_support3');
        $data['text_support4'] = $this->language->get('text_support4');

		$data['name']=$this->config->get('config_owner');
		$data['address'] = $this->config->get('config_address');
        $data['phone'] = $this->config->get('config_telephone');
        $data['email'] = $this->config->get('config_email');
        $data['fax'] = $this->config->get('config_fax');
        $data['link_facebook'] = $this->config->get('config_facebook');
        $data['link_youtube'] = $this->config->get('config_youtube');
        $data['link_google'] = $this->config->get('config_google');
        $data['link_pinterest']= $this->config->get('config_pinterest');
        $data['timeopen'] = $this->config->get('config_open');
        $data['addressvp'] = $this->config->get('config_addressvp');
        $data['addressdd'] = $this->config->get('config_addressdd');
        $data['telesr2'] = $this->config->get('config_telesr2');
        $data['televp'] = $this->config->get('config_televp');
        $data['teledd'] = $this->config->get('config_teledd');
        $data['nametk'] = $this->config->get('config_nametk');
        $data['nametk2'] = $this->config->get('config_nametk2');
        $data['nametk3'] = $this->config->get('config_nametk3');
        $data['hotline'] = $this->config->get('config_hotline');
        $data['email2'] = $this->config->get('config_email2');

        if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		if (is_file(DIR_IMAGE . $this->config->get('config_hinhface'))) {
			$data['hinhface'] = $server . 'image/' . $this->config->get('config_hinhface');
		} else {
			$data['hinhface'] = '';
		}
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
        $server = HTTPS_IMAGE;

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $data['phuongthucvanchuyen'] = $this->url->link('information/information', 'information_id=' . '3');
        $data['gioithieu'] = $this->url->link('information/information', 'information_id=' . '4');
        $data['phuongthucthanhtoan'] = $this->url->link('information/information', 'information_id=' . '5');
        $data['huongdanmuahang'] = $this->url->link('information/information', 'information_id=' . '6');
        $data['chinhsachdoihang'] = $this->url->link('information/information', 'information_id=' . '7');
        $data['lichlamviec'] = $this->url->link('information/information', 'information_id=' . '8');
        $data['dichvu'] = $this->url->link('information/information', 'information_id=' . '9');

        $data['youtube'] = $server . 'youtube.png';
        $data['facebook'] = $server . 'face.png';
        $data['google'] = $server . 'gl.png';
        $data['layer'] = $server . 'twitter.png';

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}