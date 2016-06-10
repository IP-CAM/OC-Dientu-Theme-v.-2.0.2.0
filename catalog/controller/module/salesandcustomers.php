<?php
class ControllerModuleSalesAndCustomers extends Controller {
	public function index($setting) {

		$this->load->language('module/salesandcustomers');

		$data['heading_title'] = isset($setting['name'])?$setting['name']:$this->language->get('heading_title');
		$data['module_id'] = $setting['layout_module_id'];

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['salesandcustomers'] = $this->config->get('config_salesandcustomers');

		$this->load->model('catalog/news');

		$this->load->model('tool/image');

		$data['newss'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 9;
		}

		if (!empty($setting['news'])) {
			$newss = array_slice($setting['news'], 0, (int)$setting['limit']);
			foreach ($newss as $news_id) {
				$news_info = $this->model_catalog_news->getNews($news_id);

				if ($news_info) {
					if ($news_info['image']) {
						$image = $this->model_tool_image->resize($news_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					$data['newss'][] = array(
						'news_id'  => $news_info['news_id'],
						'thumb'       => $image,
						'title'        => $news_info['title'],
						'description' => utf8_substr(strip_tags(html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '.',
						'href'        => $this->url->link('information/news', 'news_id=' . $news_info['news_id'])
					);
				}
			}
		}

		if ($data['newss']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/salesandcustomers.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/salesandcustomers.tpl', $data);
			} else {
				return $this->load->view('default/template/module/salesandcustomers.tpl', $data);
			}
		}
	}
}