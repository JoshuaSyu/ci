<?php

class eat_model extends CI_Model {

	public function __construct() {

		$this->load->database();
	}

	public function get_eat($id = false) {

		if ($id === false) {
			$query = $this->db->get('eat');
			return $query->result_array();
		}

		$query = $this->db->get_where('eat', array('eat_id' => $id));

		return $query->row_array();
	}

	public function set_eat($id = false) {
		$data = array(
			'eat_name' => $this->input->post('name'),
			'eat_phone' => $this->input->post('phone'),
			'eat_address' => $this->input->post('address'),
			'eat_weight' => $this->input->post('weight'),
			'eat_note' => $this->input->post('note'),
		);

		if ($id) {
			return $this->db->update('eat', $data, array('eat_id' => $id));
		} else {
			return $this->db->insert('eat', $data);
		}
	}
}