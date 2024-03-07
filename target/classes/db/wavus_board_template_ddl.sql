-- users: 사용자 정보를 저장하는 테이블로, 각 사용자의 ID, 사용자 이름, 이메일 주소 및 비밀번호를 저장합니다.
CREATE TABLE users (
                       user_id SERIAL PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(100) NOT NULL
);

-- posts: 게시물을 저장하는 테이블로, 각 게시물의 ID, 작성자의 사용자 ID, 제목, 내용 및 작성일을 저장합니다.
CREATE TABLE posts (
                       post_id SERIAL PRIMARY KEY,
                       user_id INT REFERENCES users(user_id),
                       title VARCHAR(255) NOT NULL,
                       content TEXT NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- comments: 댓글을 저장하는 테이블로, 각 댓글의 ID, 해당 댓글이 속한 게시물의 ID, 댓글을 작성한 사용자의 ID, 내용 및 작성일을 저장합니다.
CREATE TABLE comments (
                          comment_id SERIAL PRIMARY KEY,
                          post_id INT REFERENCES posts(post_id),
                          user_id INT REFERENCES users(user_id),
                          content TEXT NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);