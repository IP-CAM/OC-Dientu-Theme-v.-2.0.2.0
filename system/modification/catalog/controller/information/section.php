<?php
class ControllerInformationSection extends Controller {
    public function index() {
        $this->language->load('information/section');
        $this->load->model('catalog/section');
        $this->load->model('catalog/news');
        $this->load->model('tool/image');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_catalog_limit');
        }
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
		$data['text_empty'] = $this->language->get('text_empty');
        if (isset($this->request->get['section_id'])) {
            $newspath = '';
            $parts = explode('_', (string)$this->request->get['section_id']);
            foreach ($parts as $newspath_id) {
                if (!$newspath) {
                    $newspath = $newspath_id;
                } else {
                    $newspath .= '_' . $newspath_id;
                }
                $section_info = $this->model_catalog_section->getSection1($newspath_id);
                if ($section_info) {
                    $data['breadcrumbs'][] = array(
                        'text'      => $section_info['name'],
                        'href'      => $this->url->link('information/section', 'newspath=' . $newspath),
                        'separator' => false
                    );
                }
            }
            $section_id = array_pop($parts);
        } else {
            $section_id = 0;
        }
        $section_info = $this->model_catalog_section->getSection1($section_id);
        if ($section_info) {					
			$sections = $this->model_catalog_section->getSections11($section_id);
            $this->document->setTitle($section_info['name'] . ' - ' . $this->config->get('config_title'));
            $this->document->setDescription($section_info['meta_description']);
            $this->document->setKeywords($section_info['meta_keyword']);
            $data['heading_title'] = $section_info['name'];            
            $data['button_continue'] = $this->language->get('button_continue');
            $url = '';
            $data['description'] = html_entity_decode($section_info['description'], ENT_QUOTES, 'UTF-8');          
			foreach ($sections as $item) {                
				$data1 = array(
					'filter_section_id'  => $item['section_id'],
					'sort'               => 'n.news_id',
					'order'              => 'DESC',
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit
				);
				$news = array();
				$results = $this->model_catalog_news->getNewss($data1);
				foreach ($results as $result) {
					if (is_file(DIR_IMAGE . $result['image'])) {
						$image = $this->model_tool_image->resize($result['image'], 200, 200);
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', 200, 200);
					}
					$news[] = array(
						'news_id'  => $result['news_id'],
						'thumb'       => $image,
						'title'       => $result['title'],
						'date_added'  => date('d/m/Y' , strtotime($result['date_added'])),
						'description' => mb_substr(strip_tags(html_entity_decode($result['meta_description'], ENT_QUOTES, 'UTF-8')), 0, 150) . '..',
						'href'        => $this->url->link('information/news', 'newspath=' . $this->request->get['section_id'] . '&news_id=' . $result['news_id'])
					);
				}
				if (is_file(DIR_IMAGE . $item['image'])) {
                    $image = $this->model_tool_image->resize($item['image'], 200, 200);
                } else {
                    $image = $this->model_tool_image->resize('no_image.jpg', 200, 200);
                }
                $data['sections'][] = array(
                    'section_id'  => $item['section_id'],
                    'thumb'       => $image,
                    'name'       => $item['name'],
                    'date_added'  => date('d/m/Y' , strtotime($item['date_added'])),
                    'meta_description' =>html_entity_decode($item['meta_description'], ENT_QUOTES, 'UTF-8'),
                    'description' => mb_substr(strip_tags(html_entity_decode($item['description'], ENT_QUOTES, 'UTF-8')), 0, 250) . '..',
                    'href'        => $this->url->link('information/section', 'section_id=' . $item['section_id']),
					'chidren' => $news,

                );
			}
			$datan = array(
				'filter_section_id'  => $section_id,
				'sort'               => 'n.news_id',
				'order'              => 'DESC',
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
			$data['newss'] = array();
			$news_total = $this->model_catalog_news->getTotalNewss($datan);
			$resultsn = $this->model_catalog_news->getNewss($datan);
			foreach ($resultsn as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 200, 200);
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', 200, 200);
				}
				$data['newss'][] = array(
					'news_id'  => $result['news_id'],
					'thumb'       => $image,
					'title'       => $result['title'],
					'date_added'  => date('d/m/Y' , strtotime($result['date_added'])),
					'description' => mb_substr(strip_tags(html_entity_decode($result['meta_description'], ENT_QUOTES, 'UTF-8')), 0, 150) . '..',
					'href'        => $this->url->link('information/news', 'newspath=' . $this->request->get['section_id'] . '&news_id=' . $result['news_id'])
				);
			}
			if (is_file(DIR_IMAGE . $section_info['image'])) {
				$image = $this->model_tool_image->resize($section_info['image'], 200, 200);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 200, 200);
			}
			$data['section'] = array(
				'section_id'  => $section_info['section_id'],
				'thumb'       => $image,
				'name'       => $section_info['name'],
				'date_added'  => date('d/m/Y' , strtotime($section_info['date_added'])),
				'meta_description' =>html_entity_decode($section_info['meta_description'], ENT_QUOTES, 'UTF-8'),
				'description' => mb_substr(strip_tags(html_entity_decode($section_info['description'], ENT_QUOTES, 'UTF-8')), 0, 250) . '..',
				'href'        => $this->url->link('information/section', 'newspath=' . $section_info['section_id']),
				'chidren' => $data['newss'],

			);
			
			$pagination = new Pagination();
			$pagination->total = $news_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('information/section', 'newspath=' . $this->request->get['section_id'] . $url . '&page={page}');
			
			$data['pagination'] = $pagination->render();
            $data['continue'] = $this->url->link('common/home');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
foreach (unserialize(positions) as $key => $position){$data[$key] = $this->load->controller('common/positions', $key);}
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/section.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/section.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/information/section.tpl', $data));
            }
        } else {
            $url = '';
            if (isset($this->request->get['newspath'])) {
                $url .= '&newspath=' . $this->request->get['newspath'];
            }
            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_error'),
                'href'      => $this->url->link('information/section', $url),
                'separator' => $this->language->get('text_separator')
            );
            $this->document->setTitle($this->language->get('text_error'));
            $data['heading_title'] = $this->language->get('text_error');            $data['text_error'] = $this->language->get('text_error');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['continue'] = $this->url->link('common/home');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
foreach (unserialize(positions) as $key => $position){$data[$key] = $this->load->controller('common/positions', $key);}
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/section.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/section.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/information/section.tpl', $data));
            }
        }
    }
}
?>