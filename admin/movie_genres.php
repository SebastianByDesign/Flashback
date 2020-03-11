<?php
    require_once '../load.php';

    $pdo = Database::getInstance()->getConnection();
    $mov_genres_query = 'SELECT * FROM tbl_genres ORDER BY genre_name';
    $movie_get = $pdo->prepare($mov_genres_query);
    $movie_get->execute();

    $rows = array();

    while($r = $movie_get->fetch(PDO::FETCH_ASSOC)){
      $rows[] = $r;
    }

    echo json_encode($rows);