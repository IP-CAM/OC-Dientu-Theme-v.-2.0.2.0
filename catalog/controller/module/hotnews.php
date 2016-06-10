<?php
class ControllerModuleHotnews extends Controller {
	public function index($setting) {
		$this->load->language('module/hotnews');
		
		$data['heading_title'] = isset($setting['name'])?$setting['name']:$this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

        $data['link_product'] = $this->url->link('product/product');

		$this->load->model('catalog/news');

		$this->load->model('tool/image');

		$data['results'] = array();
		$data['module_id'] = $setting['layout_module_id'];
		if (!$setting['limit']) {
			$setting['limit'] = 9;
		}
		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_news->getNews($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
					$data['results'][] = array(
						'product_id'  => $product_info['news_id'],
						'thumb'       => $image,
						'name'        => $product_info['title'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'href'        => $this->url->link('information/news','&news_id=' . $product_info['news_id'])
						//'href'        => $this->url->link('news/news', 'news_id=' . $product_info['news_id'])
					);
				}
			}
		}

		if ($data['results']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/hotnews.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/hotnews.tpl', $data);
			} else {
				return $this->load->view('default/template/module/hotnews.tpl', $data);
			}
		}
	}
}