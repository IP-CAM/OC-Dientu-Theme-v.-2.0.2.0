<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
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
			$limit = $this->config->get('config_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

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
		$data['category_id'] = $category_id;
		if($category_id!=0){
			$category_info = $this->model_catalog_category->getCategory($category_id);
		}else{
			
			$category_info = array ( 
			'category_id' => 0,
			'image' =>'',
			'parent_id' => 0 ,
			'name' => $this->language->get('heading_title'),
			'description' =>'',
			'meta_title' =>'',
			'meta_description' => '',
			'meta_keyword' => '' );
		}
		
		if ($category_info) {
			 //  Ultimate Seo Package
            if (isset($category_info['u_title']) && !empty($category_info['u_title'] ) ) {
                $this->document->setTitle(trim($category_info['u_title']) );
            }
            else {
                $this->document->setTitle($category_info['meta_title']);
            }
            //  END Ultimate Seo Package
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path']), 'canonical');

			//   Ultimate Seo Package
            if (isset($category_info['u_h1']) && !empty($category_info['u_h1'] ) ) { 
                $data['heading_title'] = $category_info['u_h1'];
            }
            else {
                $data['heading_title'] = $category_info['name'];
            }
            if (isset($category_info['u_h2']) && !empty($category_info['u_h2'] ) ) { 
                $data['useo_heading_title2'] = $category_info['u_h2'];
            }
            //  END Ultimate Seo Package

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$data['thumb'] = '';
			}
			$data['descriptions'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}



			$data['categories'] = array();
            $data['filters_data'] = array();
            $data['product'] = array();
			$resultscat = $this->model_catalog_category->getCategories($category_id);


            if ($resultscat){

                foreach ($resultscat as $resultcat) {
                    $data['filters_data'][] = array(
                        'category_id'  => $resultcat['category_id']
                    );
                    $data['products'] = array();
//                    $resultcat = $this->model_catalog_category->getCategories($resultcat['category_id']);
                    $filter_data = array(
                        'filter_category_id' => $category_id,
                        'sort'               => $sort,
                        'order'              => $order,
                        'start'              => ($page - 1) * $limit,
                        'limit'              => $limit
                    );

                    $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

                    $results = $this->model_catalog_product->getProducts($filter_data);
					//var_dump($results);
                    foreach ($results as $result) {
                        if ($result['image']) {
                            $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
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
							$specialper =false;
                        }

                        if ($this->config->get('config_tax')) {
                            $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                        } else {
                            $tax = false;
                        }

                        if ($this->config->get('config_review_status')) {
                            $rating = (int)$result['rating'];
                        } else {
                            $rating = false;
                        }
                        if($price!=0){
                            $sale_rate = ($price-$price_sale)/$price*100;
                        }else {
                            $sale_rate = 0;
                        }


                        $data['products'][] = array(
                            'product_id'  => $result['product_id'],
                            'model'       => $result['model'],
                            'thumb'       => $image,
                            'name'        => $result['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                            'price'       => $price,
                            'price_sale'  => $price_sale,
                            'rate_sale'   => (int)$sale_rate,
                            'color'       => $result['color'],
                            'material'    => $result['material'],
                            'made'        => $result['made'],
                            'guarantee'   => $result['guarantee'],
                            'length'      => $result['length'],
                            'width'       => $result['width'],
                            'height'       => $result['height'],
                            'special'     => $special,
							'specialper'     => $specialper,
                            'tax'         => $tax,
                            'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                            'rating'      => $result['rating'],
                            'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
                        );
                    }

                    $data['categories'][] = array(
                        'name'  => $resultcat['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'products'  => $data['products'],
                        'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $resultcat['category_id'] . $url)
                    );
                }
            } else {

                $data['filters_data'][] = array(
                    'category_id'  => $category_id
                );

                $data['products'] = array();
                $filter_data = array(
                    'filter_category_id' => $category_id,
                    'sort'               => $sort,
                    'order'              => $order,
                    'start'              => ($page - 1) * $limit,
                    'limit'              => $limit
                );

                $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

                    $category_name = $this->model_catalog_category->getCategory($category_id);

                    $results = $this->model_catalog_product->getProducts($filter_data);


                    foreach ($results as $result) {
                        if ($result['image']) {
                            $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
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
                            $rating = (int)$result['rating'];
                        } else {
                            $rating = false;
                        }
                        if($price!=0){
                            $sale_rate = ($price-$price_sale)/$price*100;
                        }else {
                            $sale_rate = 0;
                        }

                        $data['products'][] = array(
                            'product_id'  => $result['product_id'],
                            'model'       => $result['model'],
                            'thumb'       => $image,
                            'name'        => $result['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                            'price'       => $price,
                            'price_sale'  => $price_sale,
                            'rate_sale'   => (int)$sale_rate,
                            'color'       => $result['color'],
                            'material'    => $result['material'],
                            'made'        => $result['made'],
                            'guarantee'   => $result['guarantee'],
                            'length'      => $result['length'],
                            'width'       => $result['width'],
                            'height'       => $result['height'],
                            'special'     => $special,
							'specialper'     => $specialper,
                            'tax'         => $tax,
                            'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                            'rating'      => $result['rating'],
                            'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
                        );
                    }
                    if (empty($results)) {
                        $data['categories'][] = array(
                            'thongbao'  => 'Không có sản phẩm.'
                        );
                    }else {
                        $data['categories'][] = array(
                            'name'  => $category_name['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                            'products'  => $data['products'],
                            'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $url)
                        );
                    }
            }


			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url),
				'class' =>''
			);

//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_name_asc'),
//				'value' => 'pd.name-ASC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_name_desc'),
//				'value' => 'pd.name-DESC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
//			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url),
				'class' =>'asc'
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url),
				'class' =>''
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url),
					'class' =>''
				);

//				$data['sorts'][] = array(
//					'text'  => $this->language->get('text_rating_asc'),
//					'value' => 'rating-ASC',
//					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
//				);
			}

//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_model_asc'),
//				'value' => 'p.model-ASC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_model_desc'),
//				'value' => 'p.model-DESC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
//			);

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
foreach (unserialize(positions) as $key => $position){$data[$key] = $this->load->controller('common/positions', $key);}
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
foreach (unserialize(positions) as $key => $position){$data[$key] = $this->load->controller('common/positions', $key);}
			
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
}