<?php

class eat_model extends CI_Model {

	public function __construct() {

		$this->load->database();
	}

	public function get_eat($slug = FALSE) {

		if ($slug === FALSE) {
			$query = $this->db->get('eat');
			return $query->result_array();
		}

		$query = $this->db->get_where('eat', array('slug' => $slug));

		return $query->row_array();
	}

	public function set_eat() {
		$data = array(
			'eat_name' => $this->input->post('name'),
		);

		return $this->db->insert('eat', $data);
	}
}