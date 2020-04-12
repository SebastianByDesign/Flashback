<?php
    require_once 'load.php';

    if(isset($_GET['id'])){
        $movie_table = 'tbl_movies';
        $id = $_GET['id'];
        $col = 'movies_id';

        $getMovies = getSingleMovie($movie_table, $col, $id);
    }
