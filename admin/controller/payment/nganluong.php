<?php
class ControllerPaymentNganLuong extends Controller {
		private $error = array();
		public function index() {
				$this->load->language('payment/nganluong');
				$this->document->setTitle($this->language->get('heading_title'));
				$this->load->model('setting/setting');
				$this->load->model('extension/extension');
				//$this->load->model('payment/nganluong');
				if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
						$this->model_setting_setting->editSetting('nganluong', $this->request->post);
						$this->session->data['success'] = $this->language->get('text_success');
						$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
						//$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
				}
				$data['heading_title'] = $this->language->get('heading_title');
				$data['text_enabled'] = $this->language->get('text_enabled');
				$data['text_disabled'] = $this->language->get('text_disabled');
				$data['entry_receiver'] = $this->language->get('entry_receiver');
				$data['entry_order_status'] = $this->language->get('entry_order_status');
				$data['entry_status'] = $this->language->get('entry_status');
				$data['entry_sort_order'] = $this->language->get('entry_sort_order');
				$data['button_save'] = $this->language->get('button_save');
				$data['button_cancel'] = $this->language->get('button_cancel');
				$data['tab_general'] = $this->language->get('tab_general');
				$data['entry_merchant'] = $this->language->get('entry_merchant');
				$data['entry_security'] = $this->language->get('entry_security');
				$data['entry_callback'] = $this->language->get('entry_callback');
				if (isset($this->error['warning'])) {
						$data['error_warning'] = $this->error['warning'];
				}
				else {
						$data['error_warning'] = '';
				}
				if (isset($this->error['receiver'])) {
						$data['error_receiver'] = $this->error['receiver'];
				}
				else {
						$data['error_receiver'] = '';
				}
				if (isset($this->error['callback'])) {
						$data['error_callback'] = $this->error['callback'];
				}
				else {
						$data['error_callback'] = '';
				}
				if (isset($this->error['merchant'])) {
						$data['error_merchant'] = $this->error['merchant'];
				}
				else {
						$data['error_merchant'] = '';
				}
				if (isset($this->error['security'])) {
						$data['error_security'] = $this->error['security'];
				}
				else {
						$data['error_security'] = '';
				}
				$data['breadcrumbs'] = array();
				$data['breadcrumbs'][] = array(
						'text' => $this->language->get('text_home'),
						'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => false);
				$data['breadcrumbs'][] = array(
						'text' => $this->language->get('text_payment'),
						'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => ' :: ');
				$data['breadcrumbs'][] = array(
						'text' => $this->language->get('heading_title'),
						'href' => $this->url->link('payment/nganluong', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => ' :: ');
				$data['action'] = $this->url->link('payment/nganluong', 'token=' . $this->session->data['token'], 'SSL');
				$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
				if (isset($this->request->post['nganluong_total'])) {
						$data['nganluong_total'] = $this->request->post['nganluong_total'];
				}
				else {
						$data['nganluong_total'] = $this->config->get('nganluong_total');
				}
				if (isset($this->request->post['nganluong_receiver'])) {
						$data['nganluong_receiver'] = $this->request->post['nganluong_receiver'];
				}
				else {
						$data['nganluong_receiver'] = $this->config->get('nganluong_receiver');
				}
				if (isset($this->request->post['nganluong_callback'])) {
						$data['nganluong_callback'] = $this->request->post['nganluong_callback'];
				}
				else {
						$data['nganluong_callback'] = $this->config->get('nganluong_callback');
				}
				if (isset($this->request->post['nganluong_merchant'])) {
						$data['nganluong_merchant'] = $this->request->post['nganluong_merchant'];
				}
				else {
						$data['nganluong_merchant'] = $this->config->get('nganluong_merchant');
				}
				if (isset($this->request->post['nganluong_security'])) {
						$data['nganluong_security'] = $this->request->post['nganluong_security'];
				}
				else {
						$data['nganluong_security'] = $this->config->get('nganluong_security');
				}
				if (isset($this->request->post['nganluong_order_status_id'])) {
						$data['nganluong_order_status_id'] = $this->request->post['nganluong_order_status_id'];
				}
				else {
						$data['nganluong_order_status_id'] = $this->config->get('nganluong_order_status_id');
				}
				//$this->data['callback'] = HTTP_CATALOG . 'index.php?route=payment/nganluong/callback';
				$this->load->model('localisation/order_status');
				$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
				if (isset($this->request->post['nganluong_status'])) {
						$data['nganluong_status'] = $this->request->post['nganluong_status'];
				}
				else {
						$data['nganluong_status'] = $this->config->get('nganluong_status');
				}
				if (isset($this->request->post['nganluong_sort_order'])) {
						$data['nganluong_sort_order'] = $this->request->post['nganluong_sort_order'];
				}
				else {
						$data['nganluong_sort_order'] = $this->config->get('nganluong_sort_order');
				}
				//$this->template = 'payment/nganluong.tpl';
				$data['token'] = $this->session->data['token'];
				$data['header'] = $this->load->controller('common/header');
				$data['column_left'] = $this->load->controller('common/column_left');
				$data['footer'] = $this->load->controller('common/footer');
				$this->response->setOutput($this->load->view('payment/nganluong.tpl', $data));
		}
		private function validate() {
				if (!$this->user->hasPermission('modify', 'payment/nganluong')) {
						$this->error['warning'] = $this->language->get('error_permission');
				}
				if (!$this->request->post['nganluong_merchant']) {
						$this->error['merchant'] = $this->language->get('error_merchant');
				}
				if (!$this->request->post['nganluong_security']) {
						$this->error['security'] = $this->language->get('error_security');
				}
				if (!$this->request->post['nganluong_receiver']) {
						$this->error['receiver'] = $this->language->get('error_receiver');
				}
				if (!$this->error) {
						return true;
				}
				else {
						return false;
				}
		}
}

?>