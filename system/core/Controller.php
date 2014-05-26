<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * CodeIgniter Application Controller Class
 *
 * This class object is the super class that every library in
 * CodeIgniter will be assigned to.
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		ExpressionEngine Dev Team
 * @link		http://codeigniter.com/user_guide/general/controllers.html
 */
class CI_Controller {

	private static $instance;

	/**
	 * Constructor
	 */
	public function __construct()
	{
		self::$instance =& $this;

		// Assign all the class objects that were instantiated by the
		// bootstrap file (CodeIgniter.php) to local class variables
		// so that CI can run as one big super object.
		foreach (is_loaded() as $var => $class)
		{
			$this->$var =& load_class($class);
		}

		$this->load =& load_class('Loader', 'core');

		$this->load->initialize();

		log_message('debug', "Controller Class Initialized");

		$this->load->library('CI_Smarty');

		$this->smarty =& CI_Smarty::smarty();

		log_message('debug', "Smarty Class Initialized");

		$this->load->helper('url');
		$RTR =& load_class('Router', 'core');

		$this->base_url = base_url();
		$this->class = $RTR->fetch_class();
		$this->method = $RTR->fetch_method();
		$this->u_class = sprintf('%s%s', $this->base_url, $this->class);
		$this->u_method = sprintf('%s/%s', $this->u_class, $this->method);

		// when a call is made to:
		// 		http://example.com/news/latest/10
		//
		// 		$this->base_url	= http://example.com/
		// 		$this->class	= news
		// 		$this->method	= latest
		// 		$this->u_class	= http://example.com/news
		// 		$this->u_method	= http://example.com/news/latest
		//
		// http://example.com/[controller-class]/[controller-method]/[arguments]

		unset($RTR);

		$this->smarty->assign(array(
			'assset'	=> $this->base_url . ASSPATH,
			'js'		=> $this->base_url . ASSPATH . 'js/',
			'css'		=> $this->base_url . ASSPATH . 'css/',
			'jquery'	=> $this->base_url . ASSPATH . 'jquery/',
			'bootstrap'	=> $this->base_url . ASSPATH . 'bootstrap/',
		));
	}

	public static function &get_instance()
	{
		return self::$instance;
	}
}
// END Controller class

/* End of file Controller.php */
/* Location: ./system/core/Controller.php */