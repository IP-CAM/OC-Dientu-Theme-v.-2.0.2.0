<?php
class ControllerModuleNewslatest extends Controller {
	public function index($setting) {
		$this->load->language('module/newslatest');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);
        $results = $this->model_catalog_news->getLatestNewss($setting['limit']);
//        echo '<pre>';
//        print_r($results); exit;
        if ($results) {
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                }

                $data['news'][] = array(
                    'name'        => $result['title'],
                    'product_id'  => $result['news_id'],
                    'thumb'       => $image,
                    'title'        => $result['title'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'href'        => $this->url->link('information/news', 'news_id=' . $result['news_id']),
                );
            }
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newslatest.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/newslatest.tpl', $data);
        } else {
            return $this->load->view('default/template/module/newslatest.tpl', $data);
        }
	}
}