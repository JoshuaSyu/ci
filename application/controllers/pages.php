<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends CI_Controller {

	public function view($page = 'index') {

		if (!file_exists(sprintf('%sviews/%s.tpl', APPPATH, $page))) {
			show_404();
		}

		$smarty =& $this->smarty;

		$smarty->assign('string', 'Hello World!!!');
		$smarty->assign(array(
			'str1'	=> 'Hello',
			'str2'	=> 'World',
			'str3'	=> '!!!',
		));

		// $timesTable = array();
		// for ($i = 1; $i < 10; $i++) {
		// 	$timesTable[$i] = array();
		// 	for ($j = 1; $j < 10; $j++) {
		// 		$timesTable[$i][$j] = $i * $j;
		// 	}
		// }
		// $smarty->assign('timesTable', $timesTable);

		// $colorTable = array();
		// for ($i = 0; $i <= 360; $i++) {
		// 	$colorTable[] = $i;
		// }
		// $smarty->assign('colorTable', $colorTable);

		$smarty->display(sprintf('%s.tpl', $page));

	}
}