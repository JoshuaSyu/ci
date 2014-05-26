<?php

class News extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('news_model');
	}

	public function index() {
		$smarty =& $this->smarty;

		$smarty->assign(array(
			'news'			=> $this->news_model->get_news(),
			'u_news_create'	=> sprintf('%s/create', $this->u_class),
		));

		$smarty->display('news_list.tpl');
	}

	public function view($slug) {
		$smarty =& $this->smarty;

		$smarty->assign(array(
			'news'			=> $this->news_model->get_news($slug),
			'u_news_list'	=> $this->u_class,
		));

		$smarty->display('news.tpl');
	}

	public function create() {
		$smarty =& $this->smarty;

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('title', '標題', 'required');
		$this->form_validation->set_rules('text', '內文', 'required');

		if ($this->form_validation->run() === FALSE) {
			$form_attr = array(
				'class'	=>'form-horizontal',
				'role'	=>'form',
			);

			$smarty->assign(array(
				'validation_errors'	=> validation_errors(),
				'form_open'			=> form_open('news/create', $form_attr),
				'u_news_list'		=> $this->u_class,
			));

			$smarty->display('news_create.tpl');
		} else {
			$this->news_model->set_news();
			$this->load->helper('url');
			redirect($this->u_class);
		}
	}
}