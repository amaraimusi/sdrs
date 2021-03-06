<?php

/**
 * サブ画像集約ライブラリ
 * @author user
 *
 */
class SubImgAgg {
	
	/**
	 * サブ画像集約し、サブ画像リストHTMLを作成
	 * 
	 * @note
	 * ノートが空のフィールドを集約する
	 * @param array $data
	 * @param array $param パラメータ
	 *  - note_field ノートフィールド名
	 *  - img_field 画像フィールド名
	 *  - img_via_dp_field 画像経由パスフィールド名
	 * @return array 集約後のデータ
	 */
	public function agg(&$data, $param){
		
		// パラメータの初期化
		if(empty($param['note_field'])) $param['note_field'] = 'note';
		if(empty($param['img_field'])) $param['img_field'] = 'img_fn';
		if(empty($param['img_via_dp_field'])) $param['img_via_dp_field'] = 'via_dp';
		
		// データを集約する
		$data2 = $this->aggByNote($data,$param);
		
		// サブ画像リストHTMLを作成
		$data2 = $this->makeSubImgListHtml($data2,$param);

		return $data2;
	}
	
	/**
	 * ノートが空のフィールドを集約する
	 * @param array $data
	 * @param array $param パラメータ
	 *  - note_field ノートフィールド名
	 * @return array 集約後のデータ
	 */
	private function aggByNote(&$data,&$param){
		if(empty($data)) return $data;
		
		$note_field = $param['note_field'];
		$data2 = array();
		$data2[0] = $data[0];
		$data2[0]['childs'] = array();
		
		$i2 = 0;
		foreach($data as $i => $ent){
			if($i == 0) continue;
			
			$str = $ent[$note_field];
			$str = trim($str);
			
			// ▼ 対象フィールドが空であるならサブレコード（子要素）として追加。
			if(empty($str)) {
				$data2[$i2]['childs'][] = $ent;
			}else{
				// ▼ 対象フィールドが空でないなら主体レコード（親要素）とする。
				$ent2 = $ent;
				$ent2['childs'] = array();
				$data2[] = $ent2;
				$i2 ++;
			}
		}
		return $data2;
	}
	
	/**
	 * サブ画像リストHTMLを作成
	 * @param array $data
	 * @param array $param パラメータ
	 *  - img_field 画像フィールド名
	 *  - img_via_dp_field 画像経由パスフィールド名
	 * @return array サブ画像リストHTMLをセットした$data
	 */
	private function makeSubImgListHtml(&$data,&$param){
		
		
		foreach($data as &$ent){
			
		}
		unset($ent);
		
		
		return $data;
		
	}
	
	private function debug($v){
		var_dump('<pre>');
		var_dump($v);
		var_dump('</pre>');
	}
}

