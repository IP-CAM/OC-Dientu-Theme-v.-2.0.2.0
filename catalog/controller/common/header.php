<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['banner_top'] = $this->load->controller('module/banner');
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		// form
		$this->load->language('common/header');
//		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
//			$mail = new Mail();
//			$mail->protocol = $this->config->get('config_mail_protocol');
//			$mail->parameter = $this->config->get('config_mail_parameter');
//			$mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
//			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
//			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
//			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
//			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
//
//			$mail->setTo($this->config->get('config_email'));
//			$mail->setFrom($this->request->post['emailhome']);
//			$mail->setSender($this->request->post['namehome']);
//			$mail->setSubject(sprintf($this->language->get('email_subject'), $this->request->post['namehome']));
//			$mail->setText($this->request->post['enquiryhome'] . $mail->newline . 'Telephone: ' . $this->request->post['phonehome']);
//			$mail->send();
//
//			$this->response->redirect($this->url->link('information/contact/success'));
//		}
		// end form
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['phone'] = $this->config->get('config_telephone');
		$data['zalo'] = $this->config->get('config_zalo');
        $data['skype'] = $this->config->get('config_skype');
        $data['viber'] = $this->config->get('config_viber');
        $data['email'] = $this->config->get('config_email');
        $data['telephone'] = $this->config->get('config_telephone');
        $data['hotline'] = $this->config->get('config_hotline');
        $data['link_facebook'] = $this->config->get('config_facebook');
        $data['link_youtube'] = $this->config->get('config_youtube');
        $data['link_google'] = $this->config->get('config_google');
        
		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		if ($this->config->get('config_google_adword_status')) {
			$data['google_adword'] = html_entity_decode($this->config->get('config_google_adword'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_adword'] = '';
		}

		if ($this->config->get('config_google_webmaster_status')) {
			$data['google_webmaster'] = html_entity_decode($this->config->get('config_google_webmaster'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_webmaster'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
        $data['text_1'] = $this->language->get('text_1');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

        $data['product'] = $this->url->link('product/category&path=0', '', 'SSL');
        $data['bed'] = $this->url->link('product/category&path=59', '', 'SSL');
        $data['bedroom'] = $this->url->link('product/category&path=60', '', 'SSL');
        $data['tubep'] = $this->url->link('product/category&path=61', '', 'SSL');
        $data['kitchen'] = $this->url->link('product/category&path=62', '', 'SSL');
        $data['sofa'] = $this->url->link('product/category&path=63', '', 'SSL');
        $data['phongkhach'] = $this->url->link('product/category&path=64', '', 'SSL');
        $data['vanphong'] = $this->url->link('product/category&path=65', '', 'SSL');
        $data['tutho'] = $this->url->link('product/category&path=66', '', 'SSL');
        $data['sango'] = $this->url->link('product/category&path=67', '', 'SSL');
        $data['kid'] = $this->url->link('product/category&path=68', '', 'SSL');
        $data['noithat'] = $this->url->link('product/category&path=70', '', 'SSL');
        $data['thicong'] = $this->url->link('product/category&path=69', '', 'SSL');

        $data['phuongthucvanchuyen'] = $this->url->link('information/information', 'information_id=' . '3');
        $data['gioithieu'] = $this->url->link('information/information', 'information_id=' . '4');
        $data['phuongthucthanhtoan'] = $this->url->link('information/information', 'information_id=' . '5');
        $data['huongdanmuahang'] = $this->url->link('information/information', 'information_id=' . '6');
        $data['tintuc'] = $this->url->link('information/section', 'section_id=' . '6');
        $data['tuyendung'] = $this->url->link('information/section', 'section_id=' . '7');
        $data['khuyenmai'] = $this->url->link('information/section', 'section_id=' . '8');
        $data['baogia'] = $this->url->link('information/section', 'section_id=' . '9');
        $data['huongdan'] = $this->url->link('information/section', 'section_id=' . '10');
        $data['suutap'] = $this->url->link('information/section', 'section_id=' . '11');


		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}
		// form
		$data['entry_namehome'] = $this->language->get('entry_namehome');
		$data['entry_emailhome'] = $this->language->get('entry_emailhome');
		$data['entry_phonehome'] = $this->language->get('entry_phonehome');
		$data['entry_enquiryhome'] = $this->language->get('entry_enquiryhome');

		if (isset($this->error['namehome'])) {
			$data['error_namehome'] = $this->error['namehome'];
		} else {
			$data['error_namehome'] = '';
		}

		if (isset($this->error['emailhome'])) {
			$data['error_emailhome'] = $this->error['emailhome'];
		} else {
			$data['error_emailhome'] = '';
		}

		if (isset($this->error['phonehome'])) {
			$data['error_phonehome'] = $this->error['phonehome'];
		} else {
			$data['error_phonehome'] = '';
		}

		if (isset($this->error['enquiryhome'])) {
			$data['error_enquiryhome'] = $this->error['enquiryhome'];
		} else {
			$data['error_enquiryhome'] = '';
		}

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('common/header');

		if (isset($this->request->post['namehome'])) {
			$data['namehome'] = $this->request->post['namehome'];
		} else {
			$data['namehome'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['emailhome'])) {
			$data['emailhome'] = $this->request->post['emailhome'];
		} else {
			$data['emailhome'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['phonehome'])) {
			$data['phonehome'] = $this->request->post['phonehome'];
		} else {
			$data['phonehome'] = '';
		}

		if (isset($this->request->post['enquiryhome'])) {
			$data['enquiryhome'] = $this->request->post['enquiryhome'];
		} else {
			$data['enquiryhome'] = '';
		}
		// end form

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

        $this->load->model('catalog/section');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
                    $children_data1 = array();

                    $children1 = $this->model_catalog_category->getCategories($child['category_id']);

                    foreach ($children1 as $child1) {
                        $filter_data1 = array(
                            'filter_category_id'  => $child1['category_id'],
                            'filter_sub_category' => true
                        );

                        $children_data1[] = array(

                            'name'  => $child1['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data1) . ')' : ''),
                            'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' .$child1['category_id']),

                        );
                    }

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                        'children' => $children_data1,
                        'meta_description'  => $child['meta_description'],
                        'column'   => $child['column'] ? $child['column'] : 1
					);

//                            echo '<pre>';
//        print_r($children_data); exit;
				}




				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
                    'meta_description'  => $category['meta_description'],
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);


			}
		}
        $data['sections'] = array();
        $newss = $this->model_catalog_section->getSections11(6);
        foreach($newss as $news) {
            $data['news'][] = array(
                'name'      => $news['name'],
                'href'      => $this->url->link('information/section', 'section_id=' . $news['section_id'])
            );
        }
        $sections = $this->model_catalog_section->getSections11(11);

        foreach($sections as $section) {
            $data['sections'][] = array(
                'name'      => $section['name'],
                'href'      => $this->url->link('information/section', 'section_id=' . $section['section_id'])
            );
        }


		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');

		$data['live_search_ajax_status'] = $this->config->get('live_search_ajax_status');
		$data['live_search_show_image'] = $this->config->get('live_search_show_image');
		$data['live_search_show_price'] = $this->config->get('live_search_show_price');
		$data['live_search_show_description'] = $this->config->get('live_search_show_description');

		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}

	// form
	public function success() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}

//	protected function validate() {
//		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
//			$this->error['name'] = $this->language->get('error_name');
//		}
//
//		if ((utf8_strlen($this->request->post['phone']) < 1)) {
//        	$this->error['phone'] = $this->language->get('error_phone');
//    	}
//
//		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
//			$this->error['email'] = $this->language->get('error_email');
//		}
//
//		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
//			$this->error['enquiry'] = $this->language->get('error_enquiry');
//		}
//
//		return !$this->error;
//	}
	// end form
}