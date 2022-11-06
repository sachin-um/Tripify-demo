<?php
    class Pages extends Controller{
        public function __construct(){
            // echo 'This is the pages controller';
        }
        public function index(){
            $this->view('v_home');
        }

        public function home(){
            $this->view('v_home');
        }
        public function about($name,$age){
            $data=[
                'userName'=>$name,
                'userAge'=>$age
            ];
            $this->view('v_about',$data);
        }
    }

?>