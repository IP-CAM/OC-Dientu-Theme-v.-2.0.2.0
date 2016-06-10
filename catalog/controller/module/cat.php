<?php  

class ControllerModulecat extends Controller {

	protected function index($setting) {

		$this->language->load('module/cat');

    	$this->data['heading_title'] = $this->language->get('heading_title');

		

		if (isset($this->request->get['catid'])) {

			$parts = explode('_', (string)$this->request->get['catid']);

		} else {

			$parts = array();

		}

		

		if (isset($parts[0])) {

			$this->data['cat_id'] = $parts[0];

		} else {

			$this->data['cat_id'] = 0;

		}

		

		if (isset($parts[1])) {

			$this->data['child_id'] = $parts[1];

		} else {

			$this->data['child_id'] = 0;

		}

        

        $this->data['route'] = $this->request->get['route'];

       

        

        if(isset($this->request->get['news_id'])){

            $this->data['newid'] = $this->request->get['news_id'];

        }else{

            $this->data['newid'] =0;

        }					

		$this->load->model('content/cat');

		$this->load->model('content/news');

		

		$this->data['categories'] = array();

					

		$categories = $this->model_content_cat->getCategories(84);

		

		foreach ($categories as $cat) {

			$children_data = array();

			$data = array(

                    'filter_cat_id'  => $cat['cat_id'],

                    'filter_sub_cat' => true,

                    'start'=>0,

                    'limit'=>100,

                   

                );    

			$children = $this->model_content_news->getnewss($data);

			foreach ($children as $child) {

					$children_data[] = array(

						'news_id' => $child['news_id'],

						'name'        => $child['name'],

						'href'        => $this->url->link('news/news','&catid=' . $cat['cat_id'] .'&news_id=' . $child['news_id'])

                        

					);								

			}

			if ($setting['count']) {

				$news_total = $this->model_content_news->getTotalnewss($data);

			

				$this->data['categories'][] = array(

					'cat_id' => $cat['cat_id'],

					'name'        => $cat['name'] ,//. ' (' . $news_total . ')',

					'children'    => $children_data,

					'href'        => $this->url->link('news/cat', 'catid=' . $cat['cat_id'])

				);				

			} else {

				$this->data['categories'][] = array(

					'cat_id' => $cat['cat_id'],

					'name'        => $cat['name'],

					'children'    => $children_data,

					'href'        => $this->url->link('news/cat', 'catid=' . $cat['cat_id'])

				);			

			}

		}

		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cat.tpl')) {

			$this->template = $this->config->get('config_template') . '/template/module/cat.tpl';

		} else {

			$this->template = 'default/template/module/cat.tpl';

		}

		

		$this->render();

  	}

}

?>