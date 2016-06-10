<?php
class ControllerModuleParallel extends Controller {
	public function index($setting) {
		$this->load->language('module/parallel');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

        $data['link_product'] = $this->url->link('product/product');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();



		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price_sale = $this->currency->format($this->tax->calculate($product_info['price_sale'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price_sale = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
                    $sale_rate = ($price-$price_sale)/$price*100;
					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
                        'model'       => $product_info['model'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'price_sale'  => $price_sale,
                        'rate_sale'   => (int)$sale_rate,
						'color'       => $product_info['color'],
						'material'    => $product_info['material'],
						'made'        => $product_info['made'],
						'guarantee'   => $product_info['guarantee'],
						'length'      => $product_info['length'],
						'height'      => $product_info['height'],
						'width'       => $product_info['width'],
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
//                    echo '<pre>';
//                    print_r($data['products']); exit;
				}
			}
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/parallel.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/parallel.tpl', $data);
			} else {
				return $this->load->view('default/template/module/parallel.tpl', $data);
			}
		}
	}
}