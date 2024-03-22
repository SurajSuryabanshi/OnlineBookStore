-- Question no 1 
-- 1. Users Table (data)
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL
);

-- 2. Categories Table (lookup)
CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL
);

-- 3. Books Table (data)
CREATE TABLE books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    author VARCHAR2(100) NOT NULL,
    price NUMBER(10, 2) NOT NULL,
    publication_date DATE,
    category_id NUMBER,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


-- 4. Orders Table (data)
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    book_id NUMBER,
    order_date DATE,
    quantity NUMBER,
    total_price NUMBER(10, 2),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- 5. Order_Items Table (data, to store individual items in an order)
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    book_id NUMBER,
    quantity NUMBER,
    CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_order_item_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);


-- 6. Audit_Log Table (audit/log)
CREATE TABLE audit_log (
    log_id NUMBER PRIMARY KEY,
    timestamp TIMESTAMP,
    user_id NUMBER,
    action_description VARCHAR2(200),
    CONSTRAINT fk_audit_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 7. Reviews Table (data, to store book reviews)
CREATE TABLE reviews (
    review_id NUMBER PRIMARY KEY,
    book_id NUMBER,
    user_id NUMBER,
    review_text CLOB,
    rating NUMBER(2, 1),
    review_date DATE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_review_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);





-- Insertaion of data in some tables
-- Insert sample data into the categories table
INSERT INTO categories (category_id, category_name) VALUES (1, 'Fiction');
INSERT INTO categories (category_id, category_name) VALUES (2, 'Non-Fiction');
INSERT INTO categories (category_id, category_name) VALUES (3, 'Science Fiction');
INSERT INTO categories (category_id, category_name) VALUES (4, 'Mystery');
INSERT INTO categories (category_id, category_name) VALUES (5, 'Biography');

-- Insert sample data into the orders table
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (1, 1, 16, SYSTIMESTAMP, 2, 149.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (2, 2, 17, SYSTIMESTAMP, 1, 79.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (3, 3, 18, SYSTIMESTAMP, 3, 230.97);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (4, 4, 19, SYSTIMESTAMP, 1, 86.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (5, 5, 20, SYSTIMESTAMP, 2, 169.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (6, 1, 21, SYSTIMESTAMP, 1, 88.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (7, 2, 22, SYSTIMESTAMP, 2, 175.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (8, 3, 23, SYSTIMESTAMP, 1, 87.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (9, 4, 24, SYSTIMESTAMP, 3, 287.97);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (10, 5, 25, SYSTIMESTAMP, 2, 179.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (11, 1, 26, SYSTIMESTAMP, 1, 94.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (12, 2, 27, SYSTIMESTAMP, 2, 197.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (13, 3, 28, SYSTIMESTAMP, 1, 108.99);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (14, 4, 29, SYSTIMESTAMP, 2, 209.98);
INSERT INTO orders (order_id, user_id, book_id, order_date, quantity, total_price) VALUES (15, 5, 30, SYSTIMESTAMP, 1, 109.99);

--Insert sample data into order_items table
-- Insert sample data into the order_items table
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (1, 1, 16, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (2, 2, 17, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (3, 3, 18, 3);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (4, 4, 19, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (5, 5, 20, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (6, 6, 21, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (7, 7, 22, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (8, 8, 23, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (9, 9, 24, 3);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (10, 10, 25, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (11, 11, 26, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (12, 12, 27, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (13, 13, 28, 1);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (14, 14, 29, 2);
INSERT INTO order_items (order_item_id, order_id, book_id, quantity) VALUES (15, 15, 30, 1);


-- Insert sample data into the audit_log table
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (1, SYSTIMESTAMP, 1, 'User John Toronto placed an order (Order ID: 1)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (2, SYSTIMESTAMP, 2, 'User Jane Smith placed an order (Order ID: 2)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (3, SYSTIMESTAMP, 3, 'User Alice Paris placed an order (Order ID: 3)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (4, SYSTIMESTAMP, 4, 'User Bob Smith placed an order (Order ID: 4)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (5, SYSTIMESTAMP, 5, 'User Emily Wilson placed an order (Order ID: 5)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (6, SYSTIMESTAMP, 1, 'User John Toronto placed an order (Order ID: 6)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (7, SYSTIMESTAMP, 2, 'User Jane Smith placed an order (Order ID: 7)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (8, SYSTIMESTAMP, 3, 'User Alice Paris placed an order (Order ID: 8)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (9, SYSTIMESTAMP, 4, 'User Bob Smith placed an order (Order ID: 9)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (10, SYSTIMESTAMP, 5, 'User Emily Wilson placed an order (Order ID: 10)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (11, SYSTIMESTAMP, 1, 'User John Toronto placed an order (Order ID: 11)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (12, SYSTIMESTAMP, 2, 'User Jane Smith placed an order (Order ID: 12)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (13, SYSTIMESTAMP, 3, 'User Alice Paris placed an order (Order ID: 13)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (14, SYSTIMESTAMP, 4, 'User Bob Smith placed an order (Order ID: 14)');
INSERT INTO audit_log (log_id, timestamp, user_id, action_description) VALUES (15, SYSTIMESTAMP, 5, 'User Emily Wilson placed an order (Order ID: 15)');

-- Insert sample data into the reviews table
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (1, 16, 1, 'A fantastic read! Highly recommended.', 4.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (2, 17, 2, 'Captivating storyline and well-written.', 4.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (3, 18, 3, 'Couldnt put it down! Amazing.', 5.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (4, 19, 4, 'Intriguing plot twists. Loved it!', 4.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (5, 20, 5, 'Great insights into the subject. Well done.', 4.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (6, 21, 2, 'Interesting characters and plot development.', 3.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (7, 22, 3, 'A classic that stands the test of time.', 4.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (8, 23, 4, 'Mind-bending and thought-provoking.', 5.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (9, 24, 5, 'Keeps you on the edge of your seat!', 4.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (10, 25, 1, 'A must-read for everyone.', 4.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (11, 26, 3, 'Well-crafted and beautifully written.', 3.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (12, 27, 4, 'Engaging from start to finish.', 4.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (13, 28, 5, 'An absolute page-turner!', 4.0, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (14, 29, 1, 'Compelling and rich storytelling.', 4.5, SYSTIMESTAMP);
INSERT INTO reviews (review_id, book_id, user_id, review_text, rating, review_date) VALUES (15, 30, 2, 'Highly recommended for all readers.', 4.0, SYSTIMESTAMP);







--Question no 2 
--a)
CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    
-- Create a sequence for user_id
CREATE SEQUENCE user_id_seq 
    START WITH 1 
    INCREMENT BY 1 
    NOCACHE 
    NOCYCLE;


--b)
-- Insert sample data into the books table using the sequence
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Great Gatsby', 'F. Scott Fitzgerald', 12.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 1);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'To Kill a Mockingbird', 'Harper Lee', 15.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 2);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, '1984', 'George Orwell', 10.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 3);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Da Vinci Code', 'Dan Brown', 18.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 4);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'Steve Jobs', 'Walter Isaacson', 14.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 5);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Hobbit', 'J.R.R. Tolkien', 16.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 1);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'Pride and Prejudice', 'Jane Austen', 13.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 2);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Catcher in the Rye', 'J.D. Salinger', 11.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 3);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Shining', 'Stephen King', 17.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 4);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Art of War', 'Sun Tzu', 9.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 5);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Alchemist', 'Paulo Coelho', 12.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 1);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'Brave New World', 'Aldous Huxley', 14.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 2);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Lord of the Rings', 'J.R.R. Tolkien', 22.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 3);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Hunger Games', 'Suzanne Collins', 16.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 4);
INSERT INTO books (book_id, title, author, price, publication_date, category_id) VALUES (book_id_seq.NEXTVAL, 'The Road', 'Cormac McCarthy', 19.99, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), 5);

--Inserting sample data into users table 
-- Insert sample data into the users table using the sequence
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'john_toronto', 'password123', 'john.toronto@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'jane_smith', 'securepass', 'jane.smith@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'alice_paris', 'alicepass', 'alice.paris@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'bob_smith', 'bobpass', 'bob.smith@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'emily_wilson', 'emilypass', 'emily.wilson@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'david_cando', 'davidpass', 'david.cando@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'lisa_paudel', 'lisapass', 'lisa.paudel@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'mark_jackson', 'markpass', 'mark.jackson@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'susan_regmi', 'susanpass', 'susan.regmi@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'michael_lee', 'michaelpass', 'michael.lee@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'laura_davis', 'laurapass', 'laura.davis@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'kevin_glen', 'kevinpass', 'kevin.glen@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'natalie_hilton', 'nataliepass', 'natalie.hilton@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'ryan_hill', 'ryanpass', 'ryan.hill@gmail.com');
INSERT INTO users (user_id, username, password, email) VALUES (user_id_seq.NEXTVAL, 'olivia_ryan', 'oliviapass', 'olivia.ryan@gmail.com');


--c) use it to update the table
UPDATE books
SET price = price + (book_id_seq.NEXTVAL * 2); 

-- Verify the updated data
SELECT * FROM books;


--Question no 3
-- Indexes for the Books Table
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_books_author ON books(author);
CREATE INDEX idx_books_category_id ON books(category_id);

-- Indexes for the Orders Table
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_book_id ON orders(book_id);

-- Indexes for the Reviews Table
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_reviews_book_id ON reviews(book_id);

-- Indexes for the Order_Items Table
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_book_id ON order_items(book_id);






