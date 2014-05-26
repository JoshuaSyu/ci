<?php

class Eat extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('eat_model');
	}

	public function index() {
		$smarty =& $this->smarty;

		$smarty->assign(array(
			'eat'			=> $this->eat_model->get_eat(),
			'u_eat_create'	=> sprintf('%s/create', $this->u_class),
		));

		$smarty->display('eat.tpl');
	}

	public function view($slug) {
		$smarty =& $this->smarty;

		$smarty->assign(array(
			'eat'			=> $this->eat_model->get_eat($slug),
			'u_eat_list'	=> $this->u_class,
		));

		$smarty->display('eat.tpl');
	}

	public function create() {
		$smarty =& $this->smarty;

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('name', '店家名稱', 'required');

		if ($this->form_validation->run() === FALSE) {
			$form_attr = array(
				'class'	=>'form-horizontal',
				'role'	=>'form',
			);

			$smarty->assign(array(
				'validation_errors'	=> validation_errors(),
				'form_open'			=> form_open('eat/create', $form_attr),
				'u_eat'				=> $this->u_class,
			));

			$smarty->display('eat_create.tpl');
		} else {
			$this->eat_model->set_eat();
			$this->load->helper('url');
			redirect($this->u_class);
		}
	}
}