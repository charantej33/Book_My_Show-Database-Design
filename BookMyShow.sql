-- City
CREATE TABLE city (
  city_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL,
  state VARCHAR(120),
  country VARCHAR(120) NOT NULL DEFAULT 'India',
  UNIQUE KEY uq_city (name, state, country)
);

-- Theatre
CREATE TABLE theatre (
  theatre_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(180) NOT NULL,
  address_line VARCHAR(255),
  city_id BIGINT NOT NULL,
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Auditorium
CREATE TABLE auditorium (
  auditorium_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  theatre_id BIGINT NOT NULL,
  name VARCHAR(120) NOT NULL,
  capacity INT NOT NULL,
  FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
);

-- Movie
CREATE TABLE movie (
  movie_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  duration_min INT NOT NULL,
  certificate VARCHAR(10),
  language VARCHAR(50),
  format VARCHAR(50),
  release_date DATE
);

-- SeatType
CREATE TABLE seat_type (
  seat_type_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL UNIQUE
);

-- Seat
CREATE TABLE seat (
  seat_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  auditorium_id BIGINT NOT NULL,
  row_label VARCHAR(5) NOT NULL,
  seat_number INT NOT NULL,
  seat_type_id BIGINT NOT NULL,
  FOREIGN KEY (auditorium_id) REFERENCES auditorium(auditorium_id),
  FOREIGN KEY (seat_type_id) REFERENCES seat_type(seat_type_id),
  UNIQUE KEY uq_seat (auditorium_id, row_label, seat_number)
);

-- Showtime
CREATE TABLE showtime (
  show_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  movie_id BIGINT NOT NULL,
  auditorium_id BIGINT NOT NULL,
  show_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (auditorium_id) REFERENCES auditorium(auditorium_id)
);

