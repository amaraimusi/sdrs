<?php
App::uses('Model', 'Model');
App::uses('CrudBase', 'Model');

/**
 * 日報のCakePHPモデルクラス
 *
 * @date 2015-9-16 | 2018-10-10
 * @version 3.1.2
 *
 */
class DailyReport extends AppModel {

	public $name='DailyReport';
	
	// 関連付けるテーブル CBBXS-1040
	public $useTable = 'daily_reports';

	// CBBXE


	/// バリデーションはコントローラクラスで定義
	public $validate = null;
	
	
	public function __construct() {
		parent::__construct();
		
		// CrudBaseロジッククラスの生成
		if(empty($this->CrudBase)) $this->CrudBase = new CrudBase();
	}
	
	/**
	 * 日報エンティティを取得
	 *
	 * 日報テーブルからidに紐づくエンティティを取得します。
	 *
	 * @param int $id 日報ID
	 * @return array 日報エンティティ
	 */
	public function findEntity($id){

		$conditions='id = '.$id;

		//DBからデータを取得
		$data = $this->find(
				'first',
				Array(
						'conditions' => $conditions,
				)
		);

		$ent=array();
		if(!empty($data)){
			$ent=$data['DailyReport'];
		}
		



		return $ent;
	}


	
	
	/**
	 * 一覧データを取得する
	 * @return array 日報画面一覧のデータ
	 */
	public function findData(&$crudBaseData){

		$kjs = $crudBaseData['kjs'];//検索条件情報
		$pages = $crudBaseData['pages'];//ページネーション情報


		$page_no = $pages['page_no']; // ページ番号
		$row_limit = $pages['row_limit']; // 表示件数
		$sort_field = $pages['sort_field']; // ソートフィールド
		$sort_desc = $pages['sort_desc']; // ソートタイプ 0:昇順 , 1:降順
		
		
		//条件を作成
		$conditions=$this->createKjConditions($kjs);
		
		// オフセットの組み立て
		$offset=null;
		if(!empty($row_limit)) $offset = $page_no * $row_limit;
		
		// ORDER文の組み立て
		$order = $sort_field;
		if(empty($order)) $order='sort_no';
		if(!empty($sort_desc)) $order .= ' DESC';
		
		$option=array(
				'conditions' => $conditions,
				'limit' =>$row_limit,
				'offset'=>$offset,
				'order' => $order,
		);
		
		//DBからデータを取得
		$data = $this->find('all',$option);
		
		//データ構造を変換（2次元配列化）
		$data2=array();
		foreach($data as $i=>$tbl){
			foreach($tbl as $ent){
				foreach($ent as $key => $v){
					$data2[$i][$key]=$v;
				}
			}
		}
		
		return $data2;
	}

	
	
	/**
	 * SQLのダンプ
	 * @param  $option
	 */
	private function dumpSql($option){
		$dbo = $this->getDataSource();
		
		$option['table']=$dbo->fullTableName($this->DailyReport);
		$option['alias']='DailyReport';
		
		$query = $dbo->buildStatement($option,$this->DailyReport);
		
		Debugger::dump($query);
	}



	/**
	 * 検索条件情報からWHERE情報を作成。
	 * @param array $kjs	検索条件情報
	 * @return string WHERE情報
	 */
	private function createKjConditions($kjs){

		$cnds=null;
		
		$this->CrudBase->sql_sanitize($kjs); // SQLサニタイズ
		
		if(!empty($kjs['kj_main'])){
			$cnds[]="CONCAT( IFNULL(DailyReport.work_date, '') ,IFNULL(DailyReport.work_note, '')) LIKE '%{$kjs['kj_main']}%'";
		}
		
		// CBBXS-1003
		if(!empty($kjs['kj_id']) || $kjs['kj_id'] ==='0' || $kjs['kj_id'] ===0){
			$cnds[]="DailyReport.id = {$kjs['kj_id']}";
		}
		if(!empty($kjs['kj_work_date'])){
			$kj_work_date = $kjs['kj_work_date'];
			$dtInfo = $this->CrudBase->guessDatetimeInfo($kj_work_date);
			$cnds[]="DATE_FORMAT(DailyReport.work_date,'{$dtInfo['format_mysql_a']}') = DATE_FORMAT('{$dtInfo['datetime_b']}','{$dtInfo['format_mysql_a']}')";
		}
		if(!empty($kjs['kj_site_id']) || $kjs['kj_site_id'] ==='0' || $kjs['kj_site_id'] ===0){
			$cnds[]="DailyReport.site_id = {$kjs['kj_site_id']}";
		}
		if(!empty($kjs['kj_site_img_fn'])){
			$cnds[]="DailyReport.site_img_fn LIKE '%{$kjs['kj_site_img_fn']}%'";
		}
		if(!empty($kjs['kj_work_note'])){
			$cnds[]="DailyReport.work_note LIKE '%{$kjs['kj_work_note']}%'";
		}
		if(!empty($kjs['kj_work_category_id']) || $kjs['kj_work_category_id'] ==='0' || $kjs['kj_work_category_id'] ===0){
			$cnds[]="DailyReport.work_category_id = {$kjs['kj_work_category_id']}";
		}
		$kj_check_flg = $kjs['kj_check_flg'];
		if(!empty($kjs['kj_check_flg']) || $kjs['kj_check_flg'] ==='0' || $kjs['kj_check_flg'] ===0){
			if($kjs['kj_check_flg'] != -1){
				$cnds[]="DailyReport.check_flg = {$kjs['kj_check_flg']}";
			}
		}
		if(!empty($kjs['kj_sort_no']) || $kjs['kj_sort_no'] ==='0' || $kjs['kj_sort_no'] ===0){
			$cnds[]="DailyReport.sort_no = {$kjs['kj_sort_no']}";
		}
		$kj_delete_flg = $kjs['kj_delete_flg'];
		if(!empty($kjs['kj_delete_flg']) || $kjs['kj_delete_flg'] ==='0' || $kjs['kj_delete_flg'] ===0){
			if($kjs['kj_delete_flg'] != -1){
			   $cnds[]="DailyReport.delete_flg = {$kjs['kj_delete_flg']}";
			}
		}
		if(!empty($kjs['kj_update_user'])){
			$cnds[]="DailyReport.update_user LIKE '%{$kjs['kj_update_user']}%'";
		}
		if(!empty($kjs['kj_ip_addr'])){
			$cnds[]="DailyReport.ip_addr LIKE '%{$kjs['kj_ip_addr']}%'";
		}
		if(!empty($kjs['kj_created'])){
			$kj_created=$kjs['kj_created'].' 00:00:00';
			$cnds[]="DailyReport.created >= '{$kj_created}'";
		}
		if(!empty($kjs['kj_modified'])){
			$kj_modified=$kjs['kj_modified'].' 00:00:00';
			$cnds[]="DailyReport.modified >= '{$kj_modified}'";
		}

		// CBBXE
		
		$cnd=null;
		if(!empty($cnds)){
			$cnd=implode(' AND ',$cnds);
		}

		return $cnd;

	}

	/**
	 * エンティティをDB保存
	 *
	 * 日報エンティティを日報テーブルに保存します。
	 *
	 * @param array $ent 日報エンティティ
	 * @param array $option オプション
	 *  - form_type フォーム種別  new_inp:新規入力 , copy:複製 , edit:編集
	 *  - ni_tr_place 新規入力追加場所フラグ 0:末尾 , 1:先頭
	 * @return array 日報エンティティ（saveメソッドのレスポンス）
	 */
	public function saveEntity($ent,$option=array()){

		// 新規入力であるなら新しい順番をエンティティにセットする。
		if($option['form_type']=='new_inp' ){
			if(empty($option['ni_tr_place'])){
				$ent['sort_no'] = $this->CrudBase->getLastSortNo($this); // 末尾順番を取得する
			}else{
				$ent['sort_no'] = $this->CrudBase->getFirstSortNo($this); // 先頭順番を取得する
			}
		}
		

		//DBに登録('atomic' => false　トランザクションなし。saveでSQLサニタイズされる）
		$ent = $this->save($ent, array('atomic' => false,'validate'=>false));

		//DBからエンティティを取得
		$ent = $this->find('first',
				array(
						'conditions' => "id={$ent['DailyReport']['id']}"
				));

		$ent=$ent['DailyReport'];
		if(empty($ent['delete_flg'])) $ent['delete_flg'] = 0;

		return $ent;
	}

	


	/**
	 * 全データ件数を取得
	 *
	 * limitによる制限をとりはらった、検索条件に紐づく件数を取得します。
	 *  全データ件数はページネーション生成のために使われています。
	 *
	 * @param array $kjs 検索条件情報
	 * @return int 全データ件数
	 */
	public function findDataCnt($kjs){

		//DBから取得するフィールド
		$fields=array('COUNT(id) AS cnt');
		$conditions=$this->createKjConditions($kjs);

		//DBからデータを取得
		$data = $this->find(
				'first',
				Array(
						'fields'=>$fields,
						'conditions' => $conditions,
				)
		);

		$cnt=$data[0]['cnt'];
		return $cnt;
	}
	
	/**
	 * アップロードファイルの抹消処理
	 * 
	 * @note
	 * 他のレコードが保持しているファイルは抹消対象外
	 * 
	 * @param int $id
	 * @param string $fn_field_strs ファイルフィールド群文字列（複数ある場合はコンマで連結）
	 * @param array $ent エンティティ
	 * @param string $dp_tmpl ディレクトリパス・テンプレート
	 * @param string $viaDpFnMap 中継パスマッピング
	 */
	public function eliminateFiles($id, $fn_field_strs, &$ent, $dp_tmpl, $viaDpFnMap){
		$this->CrudBase->eliminateFiles($this, $id, $fn_field_strs, $ent, $dp_tmpl, $viaDpFnMap);
	}
	
	
	// CBBXS-1021
	/**
	 * 現場リストをDBから取得する
	 */
	public function getSiteIdList(){
		if(empty($this->Site)){
			App::uses('Site','Model');
			$this->Site=ClassRegistry::init('Site');
		}
		$fields=array('id','site_name');//SELECT情報
		$conditions=array("delete_flg = 0");//WHERE情報
		$order=array('sort_no');//ORDER情報
		$option=array(
				'fields'=>$fields,
				'conditions'=>$conditions,
				'order'=>$order,
		);

		$data=$this->Site->find('all',$option); // DBから取得
		
		// 構造変換
		if(!empty($data)){
			$data = Hash::combine($data, '{n}.Site.id','{n}.Site.site_name');
		}
		
		return $data;
	}
	/**
	 * 作業カテゴリリストをDBから取得する
	 */
	public function getWorkCategoryIdList(){
		if(empty($this->WorkCategory)){
			App::uses('WorkCategory','Model');
			$this->WorkCategory=ClassRegistry::init('WorkCategory');
		}
		$fields=array('id','work_category_name');//SELECT情報
		$conditions=array("delete_flg = 0");//WHERE情報
		$order=array('sort_no');//ORDER情報
		$option=array(
				'fields'=>$fields,
				'conditions'=>$conditions,
				'order'=>$order,
		);

		$data=$this->WorkCategory->find('all',$option); // DBから取得
		
		// 構造変換
		if(!empty($data)){
			$data = Hash::combine($data, '{n}.WorkCategory.id','{n}.WorkCategory.work_category_name');
		}
		
		return $data;
	}

	// CBBXE


}