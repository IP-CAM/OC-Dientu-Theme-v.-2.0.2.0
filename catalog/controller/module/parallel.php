<?php
class ControllerModuleParallel extends Controller {
	public function index($setting) {
		$this->load->language('module/parallel');

		$data['heading_title'] =  isset($setting['name'])?$setting['name']:$this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

        $data['link_product'] = $this->url->link('product/product');

        $product_id = $this->request->get['product_id'];

		$this->load->model('catalog/product');

		$this->load->model('tool/image');


		$data['products'] = array();
		$data['products1'] = array();

//        $results = $this->model_catalog_product->getCategory($product_id);
//
//        foreach ($results as $result) {
//
//            $product = $this->model_catalog_product->getProductByCate($result['category_id']);
////            echo '<pre>';
////            print_r($product);
//
//            if ($product) {
//                if ($product['image']) {
//                    $image = $this->model_tool_image->resize($product['image'], $setting['width'], $setting['height']);
//                } else {
//                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
//                }
//
//                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
//                    $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
//                } else {
//                    $price = false;
//                }
//                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
//                    $price_sale = $this->currency->format($this->tax->calculate($product['price_sale'], $product['tax_class_id'], $this->config->get('config_tax')));
//                } else {
//                    $price_sale = false;
//                }
//
//                if ((float)$product['special']) {
//                    $special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
//                } else {
//                    $special = false;
//                }
//
//                if ($this->config->get('config_tax')) {
//                    $tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price']);
//                } else {
//                    $tax = false;
//                }
//
//                if ($this->config->get('config_review_status')) {
//                    $rating = $product['rating'];
//                } else {
//                    $rating = false;
//                }
//                $sale_rate = ($price-$price_sale)/$price*100;
//                $data['product1'][] = array(
//                    'product_id'  => $product['product_id'],
//                    'model'       => $product['model'],
//                    'thumb'       => $image,
//                    'name'        => $product['name'],
//                    'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
//                    'price'       => $price,
//                    'price_sale'  => $price_sale,
//                    'rate_sale'   => (int)$sale_rate,
//                    'color'       => $product['color'],
//                    'material'    => $product['material'],
//                    'made'        => $product['made'],
//                    'guarantee'   => $product['guarantee'],
//                    'length'      => $product['length'],
//                    'height'      => $product['height'],
//                    'width'       => $product['width'],
//                    'special'     => $special,
//                    'tax'         => $tax,
//                    'rating'      => $rating,
//                    'href'        => $this->url->link('product/product', 'product_id=' . $product['product_id'])
//                );
//            }
//
//        }

        if (isset($this->request->get['path'])) {
            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            $category_id = (int)array_pop($parts);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = (int)$path_id;
                } else {
                    $path .= '_' . (int)$path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    $data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path . $url)
                    );
                }
            }
        } else {
            $category_id = 0;
        }
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('limit');
        }
        $filter_data = array(
            'filter_category_id' => $category_id,
            'order'              => $order,
            'start'              => ($page - 1) * $limit,
            'limit'              => (int)$setting['limit']
        );

        $results = $this->model_catalog_product->getProducts($filter_data);

        foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price_sale = $this->currency->format($this->tax->calculate($result['price_sale'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price_sale = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                    if($price) {$specialper = (($result['price'] - $result['special'])/$result['price']) * 100;
                        $specialper = ceil($specialper);
                    }
                } else {
                    $special = false;
                    $specialper = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = $result['rating'];
                } else {
                    $rating = false;
                }
                //$sale_rate = ($price-$price_sale)/$price*100;
                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'model'       => $result['model'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'price'       => $price,
                    'price_sale'  => $price_sale,
                    //'rate_sale'   => (int)$sale_rate,
                    'color'       => $result['color'],
                    'material'    => $result['material'],
                    'made'        => $result['made'],
                    'guarantee'   => $result['guarantee'],
                    'length'      => $result['length'],
                    'height'      => $result['height'],
                    'width'       => $result['width'],
                    'special'     => $special,
                    'specialper'     => $specialper,
                    'tax'         => $tax,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
        }
		/*if (!empty($setting['product'])) {
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

				}
			}
		}*/


		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/parallel.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/parallel.tpl', $data);
			} else {
				return $this->load->view('default/template/module/parallel.tpl', $data);
			}
		}
	}
}