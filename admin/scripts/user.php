<?php 
function createUser($fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();

    $create_user_query = 'INSERT INTO tbl_user(user_fname, user_name, user_pass, user_email)';
    $create_user_query .= ' VALUES(:fname, :username, :password, :email)';
    $create_user_set = $pdo->prepare($create_user_query);
    $create_user_result = $create_user_set->execute(
        array(
            ':fname'=>$fname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email
        )
    );

    if($create_user_result){
        redirect_to('index.php');
    }else{
        return 'This individual sucks!';
    }
}

function getSingleUser($id){
    $pdo = Database::getInstance()->getConnection();

    $fetch_user_query = 'SELECT * FROM tbl_user WHERE user_id =:id';
    $fetch_user_set = $pdo->prepare($fetch_user_query);
    $fetch_user_set->execute(
        array(
            ':id'=>$id
        )
    );

    if($fetch_user_set){
        return $fetch_user_set;
    } else {
        return false;
    }
}

function editUser($fname, $username, $password, $email){
    $pdo = Database::getInstance()->getConnection();

    $edit_user_query = 'UPDATE tbl_user SET user_fname = :fname, user_lname = :lname, user_uname = :username, user_pass = :password, user_email = :email';
    $edit_user_set = $pdo->prepare($create_user_query);
    $edit_user_set->execute(
        array(
            ':fname'=>$fname,
            ':lname'=>$lname,
            ':username'=>$username,
            ':password'=>$password,
            ':email'=>$email
        )
    );

    if($create_user_result){
        redirect_to('index.php');
    }else{
        return 'There was an error in updating your information';
    }
}

function createMovie($cover, $title, $genres, $rating, $director_first, $director_last, 
                    $cast_first, $cast_last, $cast_role, $year, $runtime, $synopsis, $trailer, $release){

    $pdo = Database::getInstance()->getConnection();

    $create_movie_query = 'INSERT INTO tbl_movies(movie_cover, movie_title, movie_year, movie_runtime, movie_synopsis, movie_trailer, movie_release)';
    $create_movie_query .= ' VALUES(:cover, :title, :year, :runtime, :synopsis, :trailer, :release)';
    $create_movie_set = $pdo->prepare($create_movie_query);
    $create_movie_result = $create_movie_set->execute(
        array(
            ':cover'=>$cover,
            ':title'=>$title,
            ':year'=>$year,
            ':runtime'=>$runtime,
            ':synopsis'=>$synopsis,
            ':trailer'=>$trailer,
            ':release'=>$release
        )
    );

    $last_mov_id = $pdo->lastInsertId();

    foreach($genres as $genre){
        $add_genres_query = 'INSERT INTO tbl_mov_genre(movie_id, genre_id) VALUES (:id, :genre)';
        $add_genres_set = $pdo->prepare($add_genres_query);
        $add_genres_result = $add_genres_set->execute(
            array(
                ':id'=>$last_mov_id,
                ':genre'=>$genre
            )
        );
    }

    $add_rating_query = 'INSERT INTO tbl_mov_arating(movie_id, arating_id) VALUES (:id, :rating)';
    $add_rating_set = $pdo->prepare($add_rating_query);
    $add_rating_result = $add_rating_set->execute(
        array(
            ':id'=>$last_mov_id,
            ':rating'=>$rating
        )
    );

    $dir_exist_query = 'SELECT * FROM tbl_directors WHERE (director_fname = :dir_first AND director_lname = :dir_last)';
    $dir_match = $pdo->prepare($dir_exist_query);
    $dir_match->execute(
        array(
            ':dir_first'=>$director_first,
            ':dir_last'=>$director_last
        )
    );

    if($dir_match->fetchColumn()>0){

        while($found_dir = $dir_match->fetch(PDO::FETCH_ASSOC)){
            $found_dir_id = $found_dir['director_id'];

            $add_mov_dir_query = 'INSERT INTO tbl_mov_director(movie_id, director_id) VALUES (:mov_id, :dir_id)';
            $add_mov_dir_set = $pdo->prepare($add_mov_dir_query);
            $add_mov_dir_result = $add_mov_dir_set->execute(
                array(
                    ':mov_id'=>$last_mov_id,
                    ':dir_id'=>$found_dir_id
                )
            );
        }

    } else {

        $add_director_query = 'INSERT INTO tbl_directors(director_fname, director_lname) VALUES (:dir_first, :dir_last)';
        $add_director_set = $pdo->prepare($add_director_query);
        $add_director_result = $add_director_set->execute(
            array(
                ':dir_first'=>$director_first,
                ':dir_last'=>$director_last
            )
        );

        $last_dir_id = $pdo->lastInsertId();

        $add_mov_dir_query = 'INSERT INTO tbl_mov_director(movie_id, director_id) VALUES (:mov_id, :dir_id)';
        $add_mov_dir_set = $pdo->prepare($add_mov_dir_query);
        $add_mov_dir_result = $add_mov_dir_set->execute(
            array(
                ':mov_id'=>$last_mov_id,
                ':dir_id'=>$last_dir_id
            )
        );
    }

    $cast_exist_query = 'SELECT * FROM tbl_cast WHERE (cast_fname = :c_fname AND cast_lname = :c_lname)';

    $add_cast_query = 'INSERT INTO tbl_cast(cast_fname, cast_lname) VALUES (:c_fname, :c_lname)';
    $add_role_query = 'INSERT INTO tbl_mov_cast(movie_id, cast_id, cast_role) VALUES (:mov_id, :cast_id, :c_role)';

    for($count = 0; $count<count($cast_first); $count++) {
        $data = array(
            ':c_fname' => $cast_first[$count],
            ':c_lname' => $cast_last[$count]
        );

        $cast_match = $pdo->prepare($cast_exist_query);
        $cast_match->execute($data);

        if($cast_match->fetchColumn()>0){
            
            while($found_cast = $cast_match->fetch(PDO::FETCH_ASSOC)){
                $found_cast_id = $found_cast['cast_id'];

                $data2 = array(
                    ':mov_id' => $last_mov_id,
                    ':cast_id' => $found_cast_id,
                    ':c_role' => $cast_role[$count]
                );
            }

            $add_role_set = $pdo->prepare($add_role_query);
            $add_role_result = $add_role_set->execute($data2);

        } else {

            $add_cast_set = $pdo->prepare($add_cast_query);
            $add_cast_result = $add_cast_set->execute($data);

            $last_cast_id = $pdo->lastInsertId();

            $data3 = array(
                ':mov_id' => $last_mov_id,
                ':cast_id' => $last_cast_id,
                ':c_role' => $cast_role[$count]
            );

            $add_role_set = $pdo->prepare($add_role_query);
            $add_role_result = $add_role_set->execute($data3);

        }
    }
}