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
			'u_eat_edit'	=> sprintf('%s/edit', $this->u_class),
			'u_eat_create'	=> sprintf('%s/create', $this->u_class),
		));

		$smarty->display('eat.tpl');
	}

	public function view($id) {
		$smarty =& $this->smarty;

		$smarty->assign(array(
			'eat'			=> $this->eat_model->get_eat($id),
			'u_eat_list'	=> $this->u_class,
		));

		$smarty->display('eat.tpl');
	}

	public function create($id = false) {
		$smarty =& $this->smarty;

		$this->load->helper('form');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('name', '店名', 'required');
		$this->form_validation->set_rules('weight', '權重', 'required');

		if ($id) {
			$smarty->assign(array(
				'eat'			=> $this->eat_model->get_eat($id),
			));
		}

		if ($this->form_validation->run() === FALSE) {
			$form_attr = array(
				'class'	=>'form-horizontal',
				'role'	=>'form',
			);

			$smarty->assign(array(
				'validation_errors'	=> validation_errors(),
				'form_open'			=> !$id ? form_open('eat/create', $form_attr) : form_open('eat/edit/' . $id, $form_attr),
				'u_eat'				=> $this->u_class,
				's_eat_edit'		=> !!$id,
			));

			$smarty->display('eat_create.tpl');
		} else {
			$this->eat_model->set_eat($id);
			$this->load->helper('url');
			redirect($this->u_class);
		}
	}
}