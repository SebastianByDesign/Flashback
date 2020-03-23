<?php
    require_once 'load.php';

    if(isset($_GET['filter'])){
        $args = array(
            'tbl'=>'tbl_movies',
            'tbl2'=>'tbl_genres',
            'tbl3'=>'tbl_mov_genre',
            'col'=>'movie_id',
            'col2'=>'genre_id',
            'col3'=>'genre_name',
            'filter'=>$_GET['filter']
        );

        $getMovies = getMoviesByFilter($args);
        $rows = array();
        while($r = $getMovies->fetch(PDO::FETCH_ASSOC)){
            $rows[] = $r;
        }
        echo json_encode($rows);
    }else{
        $movie_table = 'tbl_movies';
        $getMovies = getAll($movie_table);
        $rows = array();
        while($r = $getMovies->fetch(PDO::FETCH_ASSOC)){
            $rows[] = $r;
        }
        echo json_encode($rows);
    }
?>