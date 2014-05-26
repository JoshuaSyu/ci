<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CI_Smarty {
	private static $SMARTY = null;

	/**
	* Smarty Singleton
	*/
	static function smarty()
	{
		if (null === self::$SMARTY)
		{
			require_once SMARTY_DIR . 'Smarty.class.php';

			$smarty = new Smarty();

			// 設定 Smarty 參數
			$smarty->left_delimiter = '{';
			$smarty->right_delimiter = '}';

			$smarty->setTemplateDir(APPPATH . 'views');
			$smarty->setCompileDir(APPPATH . 'views/templates_c');
			$smarty->setCacheDir(APPPATH . 'views/cache');
			$smarty->setConfigDir(APPPATH . 'views/config');
			$smarty->compile_check = true;
			$smarty->force_compile = true;
			$smarty->caching = true;
			$smarty->cache_lifetime = 86400;

			if( ! file_exists($smarty->compile_dir))
			{
				mkdir($smarty->compile_dir, 0777, true);
			}
			if( ! file_exists($smarty->cache_dir))
			{
				mkdir($smarty->cache_dir, 0777, true);
			}

			self::$SMARTY = $smarty;
		}

		return self::$SMARTY;
	}
}