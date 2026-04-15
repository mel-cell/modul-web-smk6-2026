-- ============================================
-- ERD Database: SMK Negeri 6 Malang
-- Generated: April 2026
-- ============================================

DROP DATABASE IF EXISTS erd_temp;
CREATE DATABASE erd_temp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE erd_temp;

-- ═══════════════════════════════════════
-- REFERENSI & MEDIA
-- ═══════════════════════════════════════

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  availability VARCHAR(255) COMMENT 'news, extracurricular, partners, achievements, gallery, jobs, calendar'
) COMMENT='Kategori multi-purpose';

CREATE TABLE competencies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE
) COMMENT='Kompetensi keahlian';

CREATE TABLE media (
  id INT PRIMARY KEY AUTO_INCREMENT,
  filename VARCHAR(255),
  url TEXT,
  mime_type VARCHAR(100),
  filesize INT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
) COMMENT='Upload gambar/file umum';

CREATE TABLE tour_media (
  id INT PRIMARY KEY AUTO_INCREMENT,
  filename VARCHAR(255),
  url TEXT,
  mime_type VARCHAR(100),
  width INT,
  height INT
) COMMENT='Media khusus panorama 360°';

CREATE TABLE documents (
  id INT PRIMARY KEY AUTO_INCREMENT,
  filename VARCHAR(255),
  url TEXT
) COMMENT='Dokumen resmi';

-- ═══════════════════════════════════════
-- PENGGUNA
-- ═══════════════════════════════════════

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  role ENUM('admin', 'developer', 'user') DEFAULT 'user'
) COMMENT='Akun pengguna sistem';

-- ═══════════════════════════════════════
-- AKADEMIK
-- ═══════════════════════════════════════

CREATE TABLE majors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  short_desc TEXT,
  image_id INT,
  layout JSON COMMENT 'Block layout CMS',
  FOREIGN KEY (image_id) REFERENCES media(id) ON DELETE SET NULL
) COMMENT='10 Kompetensi Keahlian / Jurusan';

CREATE TABLE major_competencies (
  major_id INT NOT NULL,
  competency_id INT NOT NULL,
  PRIMARY KEY (major_id, competency_id),
  FOREIGN KEY (major_id) REFERENCES majors(id) ON DELETE CASCADE,
  FOREIGN KEY (competency_id) REFERENCES competencies(id) ON DELETE CASCADE
) COMMENT='Relasi M-N: Jurusan ↔ Kompetensi';

CREATE TABLE classes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  grade VARCHAR(10),
  major_id INT,
  FOREIGN KEY (major_id) REFERENCES majors(id) ON DELETE SET NULL
) COMMENT='Kelas (XII RPL 1, dll)';

CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  nis VARCHAR(50),
  nisn VARCHAR(50),
  photo_id INT,
  major_id INT,
  class_id INT,
  user_id INT UNIQUE,
  FOREIGN KEY (photo_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (major_id) REFERENCES majors(id) ON DELETE SET NULL,
  FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE SET NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) COMMENT='Data siswa';

CREATE TABLE curriculum_vitae (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  student_id INT UNIQUE,
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
) COMMENT='CV siswa';

-- ═══════════════════════════════════════
-- KONTEN UTAMA
-- ═══════════════════════════════════════

CREATE TABLE pages (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  hero JSON,
  layout JSON COMMENT 'Block layout CMS',
  hero_media_id INT,
  FOREIGN KEY (hero_media_id) REFERENCES media(id) ON DELETE SET NULL
) COMMENT='Halaman CMS dinamis';

CREATE TABLE news (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  content JSON COMMENT 'Lexical richtext',
  published_at DATETIME,
  status ENUM('draft', 'published') DEFAULT 'draft',
  hero_image_id INT,
  category_id INT,
  author_id INT,
  related_news_id INT,
  FOREIGN KEY (hero_image_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
  FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE SET NULL,
  FOREIGN KEY (related_news_id) REFERENCES news(id) ON DELETE SET NULL
) COMMENT='Berita & artikel';

CREATE TABLE extracurriculars (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  short_desc TEXT,
  layout JSON COMMENT 'Block layout CMS',
  image_id INT,
  category_id INT,
  FOREIGN KEY (image_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
) COMMENT='Kegiatan ekstrakurikuler';

CREATE TABLE about (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  created_by INT,
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
) COMMENT='Profil sekolah';

-- ═══════════════════════════════════════
-- PRESTASI
-- ═══════════════════════════════════════

CREATE TABLE achievements (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  description JSON COMMENT 'Lexical richtext',
  date DATETIME,
  image_id INT,
  category_id INT,
  extracurricular_id INT,
  FOREIGN KEY (image_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
  FOREIGN KEY (extracurricular_id) REFERENCES extracurriculars(id) ON DELETE SET NULL
) COMMENT='Prestasi siswa & guru';

CREATE TABLE achievement_competencies (
  achievement_id INT NOT NULL,
  competency_id INT NOT NULL,
  PRIMARY KEY (achievement_id, competency_id),
  FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE,
  FOREIGN KEY (competency_id) REFERENCES competencies(id) ON DELETE CASCADE
) COMMENT='Relasi M-N: Prestasi ↔ Kompetensi';

CREATE TABLE achievement_students (
  achievement_id INT NOT NULL,
  student_id INT NOT NULL,
  PRIMARY KEY (achievement_id, student_id),
  FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE,
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
) COMMENT='Relasi M-N: Prestasi ↔ Siswa';

-- ═══════════════════════════════════════
-- HUBUNGAN INDUSTRI
-- ═══════════════════════════════════════

CREATE TABLE industry_partners (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  description TEXT,
  logo_id INT,
  category_id INT,
  created_by INT,
  FOREIGN KEY (logo_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
) COMMENT='Mitra industri / DUDI';

CREATE TABLE partner_competencies (
  partner_id INT NOT NULL,
  competency_id INT NOT NULL,
  PRIMARY KEY (partner_id, competency_id),
  FOREIGN KEY (partner_id) REFERENCES industry_partners(id) ON DELETE CASCADE,
  FOREIGN KEY (competency_id) REFERENCES competencies(id) ON DELETE CASCADE
) COMMENT='Relasi M-N: Partner ↔ Kompetensi';

-- Tambahkan FK student → partner (PKL)
ALTER TABLE students
  ADD COLUMN pkl_partner_id INT AFTER user_id,
  ADD FOREIGN KEY (pkl_partner_id) REFERENCES industry_partners(id) ON DELETE SET NULL;

-- Link user → partner
ALTER TABLE users
  ADD COLUMN partner_id INT,
  ADD FOREIGN KEY (partner_id) REFERENCES industry_partners(id) ON DELETE SET NULL;

CREATE TABLE job_vacancies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  company VARCHAR(255),
  location VARCHAR(255),
  image_id INT,
  category_id INT,
  FOREIGN KEY (image_id) REFERENCES media(id) ON DELETE SET NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
) COMMENT='Bursa kerja khusus';

CREATE TABLE job_majors (
  job_id INT NOT NULL,
  major_id INT NOT NULL,
  PRIMARY KEY (job_id, major_id),
  FOREIGN KEY (job_id) REFERENCES job_vacancies(id) ON DELETE CASCADE,
  FOREIGN KEY (major_id) REFERENCES majors(id) ON DELETE CASCADE
) COMMENT='Relasi M-N: Lowongan ↔ Jurusan';

-- ═══════════════════════════════════════
-- KALENDER AKADEMIK
-- ═══════════════════════════════════════

CREATE TABLE academic_calendars (
  id INT PRIMARY KEY AUTO_INCREMENT,
  academic_year VARCHAR(20) NOT NULL UNIQUE,
  slug VARCHAR(255) UNIQUE,
  document_image_id INT,
  semesters JSON COMMENT 'Nested: semesters → months → events',
  FOREIGN KEY (document_image_id) REFERENCES media(id) ON DELETE SET NULL
) COMMENT='Kalender akademik';

-- ═══════════════════════════════════════
-- SMART TOUR 360°
-- ═══════════════════════════════════════

CREATE TABLE smart_tour (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE,
  status ENUM('draft', 'published') DEFAULT 'draft',
  entry_room_id VARCHAR(100) COMMENT 'ID ruangan pertama',
  seo_image_id INT,
  FOREIGN KEY (seo_image_id) REFERENCES media(id) ON DELETE SET NULL
) COMMENT='Virtual tour 360°';

CREATE TABLE smart_tour_rooms (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tour_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255),
  description JSON COMMENT 'Lexical richtext',
  image360_id INT,
  FOREIGN KEY (tour_id) REFERENCES smart_tour(id) ON DELETE CASCADE,
  FOREIGN KEY (image360_id) REFERENCES tour_media(id) ON DELETE SET NULL
) COMMENT='Ruangan dalam tour';

CREATE TABLE smart_tour_hotspots (
  id INT PRIMARY KEY AUTO_INCREMENT,
  room_id INT NOT NULL,
  label VARCHAR(255),
  yaw DECIMAL(10,4) DEFAULT 0,
  pitch DECIMAL(10,4) DEFAULT 0,
  scale DECIMAL(3,1) DEFAULT 1,
  info_text JSON COMMENT 'Popup richtext',
  target_room_id INT COMMENT 'Navigasi ke room lain',
  FOREIGN KEY (room_id) REFERENCES smart_tour_rooms(id) ON DELETE CASCADE,
  FOREIGN KEY (target_room_id) REFERENCES smart_tour_rooms(id) ON DELETE SET NULL
) COMMENT='Hotspot navigasi/info di panorama';

-- ═══════════════════════════════════════
-- GLOBALS (Config tunggal)
-- ═══════════════════════════════════════

CREATE TABLE globals (
  id INT PRIMARY KEY AUTO_INCREMENT,
  slug VARCHAR(50) UNIQUE NOT NULL,
  label VARCHAR(100),
  data JSON COMMENT 'Konfigurasi global'
) COMMENT='Header, Footer, Templates';

INSERT INTO globals (slug, label) VALUES
  ('header', 'Navigasi Utama'),
  ('footer', 'Footer Website'),
  ('news-template', 'Template Halaman Berita'),
  ('news-index-template', 'Template Arsip Berita'),
  ('job-template', 'Template Halaman Lowongan');
