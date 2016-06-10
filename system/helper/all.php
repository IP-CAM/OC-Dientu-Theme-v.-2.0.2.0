<?php

function utf8_to_ascii($str){

    //huydang1920

    if(!$str) return false;

    $unicode = array(

        'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',

        'a' => 'á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ',

        'D' => 'Đ',

        'd' => 'đ',

        'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',

        'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',

        'I' => 'Í|Ì|Ỉ|Ĩ|Ị',

        'i' => 'í|ì|ỉ|ĩ|ị',

        'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',

        'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',

        'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',

        'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',

        'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',

        'y' => 'ý|ỳ|ỷ|ỹ|ỵ',

        '' => '́|̉|̀|̣|̃',);

    foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);

    return  strtolower($str);

}

function TrimAll($str) {

    $cach = false;

    $returnstr = "";



    $str = trim($str);

    $strlen = strlen($str);

    for($i = 0;$i<$strlen;$i++){

        if($str[$i] == " "){

            if(!$cach){

                $returnstr .= " ";

                $cach = true;

            }

        }else{

            $returnstr .= $str[$i];

            $cach = false;

        }

    }

    return $returnstr;

}



function getSEOstr($str){

    $str =  strtolower(TrimAll(utf8_to_ascii($str)));

    $strt = "";

    $str = str_split($str,1);

    //echo ord('a') . "--";//97

    //echo ord('z'). "--";//122

    //echo ord('A'). "--";//65

    //echo ord('Z'). "--";//90

    //echo ord('0'). "--";//48

    //echo ord('9'). "--";//57

    $i = 0;

    $dacach = true;

    foreach($str as $char){

        $i = ord($char);

        if(($i >= 97 && $i <= 122) || ($i >= 48 && $i <= 57) || ($i == 45)){

            $strt .= $char;

            $dacach = false;

        }

        else if($char == ' ' && $dacach == false){

            $strt .= '-';

            $dacach = true;

        }

    }

    return $strt;

}



function bbcode_format ($str) {

    //$str = html_entity_decode($str, ENT_QUOTES, 'UTF-8');

    //$str = htmlentities($str, ENT_QUOTES, 'UTF-8'); 



    $simple_search = array(

        //added line break

        '/\[br\]/is',

        '/\[b\](.*?)\[\/b\]/is',

        '/\[i\](.*?)\[\/i\]/is',

        '/\[u\](.*?)\[\/u\]/is',

        '/\[url\=(.*?)\](.*?)\[\/url\]/is',

        '/\[url\](.*?)\[\/url\]/is',

        '/\[align\=(left|center|right)\](.*?)\[\/align\]/is',

        '/\[img\](.*?)\[\/img\]/is',

        '/\[mail\=(.*?)\](.*?)\[\/mail\]/is',

        '/\[mail\](.*?)\[\/mail\]/is',

        '/\[font\=(.*?)\](.*?)\[\/font\]/is',

        '/\[size\=(.*?)\](.*?)\[\/size\]/is',

        '/\[color\=(.*?)\](.*?)\[\/color\]/is',

        //added textarea for code presentation

        '/\[codearea\](.*?)\[\/codearea\]/is',

        //added pre class for code presentation

        '/\[code\](.*?)\[\/code\]/is',

        //added paragraph

        '/\[p\](.*?)\[\/p\]/is',

    );



    $simple_replace = array(

        //added line break

        '<br />',

        '<strong>$1</strong>',

        '<em>$1</em>',

        '<u>$1</u>',

        // added nofollow to prevent spam

        '<a href="$1" rel="nofollow" title="$2 - $1">$2</a>',

        '<a href="$1" rel="nofollow" title="$1">$1</a>',

        '<div style="text-align: $1;">$2</div>',

        //added alt attribute for validation

        '<img src="$1" alt="" />',

        '<a href="mailto:$1">$2</a>',

        '<a href="mailto:$1">$1</a>',

        '<span style="font-family: $1;">$2</span>',

        '<span style="font-size: $1;">$2</span>',

        '<span style="color: $1;">$2</span>',

        //added textarea for code presentation

        '<textarea class="code_container" rows="30" cols="70">$1</textarea>',

        //added pre class for code presentation

        '<pre class="code">$1</pre>',

        //added paragraph

        '<p>$1</p>',

    );



    // Do simple BBCode's  

    $str = preg_replace ($simple_search, $simple_replace, $str);



    // Do <blockquote> BBCode  

    //$str = bbcode_quote ($str);  



    return $str;

}



function bbcode_quote ($str) {

    //added div and class for quotes

    $open = '<blockquote><div class="quote">';

    $close = '</div></blockquote>';



    // How often is the open tag?  

    preg_match_all ('/\[quote\]/i', $str, $matches);

    $opentags = count($matches['0']);



    // How often is the close tag?  

    preg_match_all ('/\[\/quote\]/i', $str, $matches);

    $closetags = count($matches['0']);



    // Check how many tags have been unclosed  

    // And add the unclosing tag at the end of the message  

    $unclosed = $opentags - $closetags;

    for ($i = 0; $i < $unclosed; $i++) {

        $str .= '</div></blockquote>';

    }



    // Do replacement  

    $str = str_replace ('[' . 'quote]', $open, $str);

    $str = str_replace ('[/' . 'quote]', $close, $str);



    return $str;

}



?>