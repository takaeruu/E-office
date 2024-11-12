/*
 Navicat Premium Data Transfer

 Source Server         : yoga
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : eoffice

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 13/11/2024 00:59:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dokumen
-- ----------------------------
DROP TABLE IF EXISTS `dokumen`;
CREATE TABLE `dokumen`  (
  `id_dokumen` int NOT NULL AUTO_INCREMENT,
  `nama_dokumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `id_surat_masuk` int NULL DEFAULT NULL,
  `id_surat_keluar` int NULL DEFAULT NULL,
  `id_surat_keterlambatan` int NULL DEFAULT NULL,
  `id_pengajuan_cuti` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dokumen
-- ----------------------------

-- ----------------------------
-- Table structure for folder
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder`  (
  `id_folder` int NOT NULL AUTO_INCREMENT,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `nama_folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_levels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_folder`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of folder
-- ----------------------------
INSERT INTO `folder` VALUES (1, 1, 'Undangan', 'admin,yayasan,kepsek,wakepsek,kesiswaan,guru');
INSERT INTO `folder` VALUES (2, 2, 'Pemberitahuan', 'admin,yayasan,kepsek,wakepsek,kesiswaan,guru');
INSERT INTO `folder` VALUES (3, 4, 'Keterlambatan', 'admin,hrd,yayasan,kepsek,wakepsek,guru');
INSERT INTO `folder` VALUES (4, 3, 'Permohonan Cuti', 'admin,hrd,yayasan,kepsek,wakepsek,guru');

-- ----------------------------
-- Table structure for jenis_surat
-- ----------------------------
DROP TABLE IF EXISTS `jenis_surat`;
CREATE TABLE `jenis_surat`  (
  `id_jenis_surat` int NOT NULL AUTO_INCREMENT,
  `jenis_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_surat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jenis_surat
-- ----------------------------
INSERT INTO `jenis_surat` VALUES (1, 'Pemberitahuan');
INSERT INTO `jenis_surat` VALUES (2, 'Undangan');
INSERT INTO `jenis_surat` VALUES (3, 'Permohonan Cuti / Izin');
INSERT INTO `jenis_surat` VALUES (4, 'Keterlambatan');

-- ----------------------------
-- Table structure for pengajuan_cuti
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_cuti`;
CREATE TABLE `pengajuan_cuti`  (
  `id_pengajuan_cuti` int NOT NULL AUTO_INCREMENT,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis_pengajuan` enum('Cuti Tahunan','Cuti Khusus','WFH','Sakit Surat Dokter','Sakit Tanpa Surat Dokter','Ijin Tanpa Bayar / ITB') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_mulai_cuti` date NULL DEFAULT NULL,
  `tanggal_terakhir_cuti` date NULL DEFAULT NULL,
  `total_hari_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_kembali_kerja` date NULL DEFAULT NULL,
  `ambil_ahli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alasan_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah_jatah_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ajukan_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `catatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `status` enum('Di Tolak','Pending','Disetujui') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengajuan_cuti`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pengajuan_cuti
-- ----------------------------
INSERT INTO `pengajuan_cuti` VALUES (1, 3, 1, 'admin', '22161010', 'admin', 'SPH Batu Batam', '', '2024-11-11', '2025-01-11', '62 hari', '2024-11-12', 'rijal', 'batu licin batam', 'Lahiran bg', NULL, NULL, '', 'Di Tolak');
INSERT INTO `pengajuan_cuti` VALUES (2, 3, 6, 'admin', '22161010', 'admin', 'SPH Batu Batam Mas', 'Cuti Khusus', '2024-11-11', '2024-11-12', '2 hari', '2030-01-01', 'rijal', 'batu licin batam', 'Lahiran bg', '200', 'kosong bg', 'gapapa bg, GAJI TETAP JALAN ABANGKUHH', 'Pending');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `nama_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tab_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `login_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Permata Harapan School Batu Batam', '1731426995_95a3833555c249f36711.png', '1731426995_60b8c1e583dbc3bf422b.jpg', '1730984717_970a6d7c669cb24e1b01.png', NULL, 1, NULL, NULL, '2024-11-12 09:56:35', NULL);

-- ----------------------------
-- Table structure for surat_keluar
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar`;
CREATE TABLE `surat_keluar`  (
  `id_surat_keluar` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_kirim` date NULL DEFAULT NULL,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `penerima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `perihal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lampiran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of surat_keluar
-- ----------------------------
INSERT INTO `surat_keluar` VALUES (1, '220022', '2024-11-06', 1, 'Kaizenesia Inc', 'Gapapa, kangen aja...', '1731133954_8bfa5096e33633388725.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (2, '220023', '2024-11-06', 1, 'Kaizentopia Inc', NULL, 'KISI-KISI FINAL BLOK KELAS XII.docx', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (3, '220024', '2024-11-06', 1, 'Yayasan Kaizen Peduli', 'bagi sembako', 'KISI-KISI FINAL BLOK KELAS XII.docx', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (4, '220026', '2024-11-06', 1, 'PT Kaizen ', 'mau kasih duit', 'laferrari.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (5, '220027', '2024-11-06', 1, 'Yayasan Takaru', 'Mau collab bg', 'KISI-KISI FINAL BLOK KELAS XII.docx', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (6, '220028', '2024-11-06', 1, 'Takaru Inc', 'Phising', 'SOAL 4.pdf', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (7, '220028', '2024-11-06', 1, 'Takaru Corp', 'oke', 'KISI-KISI FINAL BLOK KELAS XII_1.docx', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (8, '220029', '2024-11-08', NULL, 'takaeru0@gmail.com', 'Pemberitahuan GACORRRRRRR', '1731063994_394de1886be95c9cb446.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (26, '2202324', '2024-11-08', 1, 'takaeru0@gmail.com', 'ad', 'WhatsApp Image 2024-11-07 at 17.57.30_bff389c5_17.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (27, '2202324', '2024-11-08', 1, 'takaeru0@gmail.com', 'ad', 'WhatsApp Image 2024-11-07 at 17.57.30_bff389c5_18.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (28, '2202324', '2024-11-08', 1, 'takaeru0@gmail.com', 'ad', 'WhatsApp Image 2024-11-07 at 17.57.30_bff389c5_20.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (29, '2202324', '2024-11-08', 1, 'takaeru0@gmail.com', 'ad', 'WhatsApp Image 2024-11-07 at 17.57.30_bff389c5_21.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (58, '2202324', '2024-11-09', 2, 'yogagautama12@gmail.com', '12', 'WhatsApp Image 2024-11-07 at 17.57.30_bff389c5_44.jpg', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (59, '2202324', '2024-11-09', 2, 'yogagautama12@gmail.com', 'asdf', '', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (60, '12345', '2024-11-09', 1, 'yogagautama12@gmail.com', 'oke', '1731124298_a8860d7daaba05ec0ddd.pdf', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (61, '2', '2024-11-12', 1, 'takaeru0@gmail.com', 'pemberitahuan masuk sekolah', '1731426632_2b61e49599d103e3c188.pdf', NULL, NULL);
INSERT INTO `surat_keluar` VALUES (62, '220028', '2024-11-12', 1, 'yogagautama12@gmail.com', '1', '1731426734_099a1ea57785f354eef4.pdf', NULL, NULL);

-- ----------------------------
-- Table structure for surat_keterlambatan
-- ----------------------------
DROP TABLE IF EXISTS `surat_keterlambatan`;
CREATE TABLE `surat_keterlambatan`  (
  `id_surat_keterlambatan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jam_kedatangan` time NULL DEFAULT NULL,
  `jumlah_keterlambatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alasan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('disetujui','menunggu persetujuan HRD','ditolak','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat_keterlambatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of surat_keterlambatan
-- ----------------------------
INSERT INTO `surat_keterlambatan` VALUES (1, 1, 4, 'yoga', '2219191', '2024-11-11', '08:00:00', '30', 'Macet pak', 'disetujui');
INSERT INTO `surat_keterlambatan` VALUES (2, 6, 4, 'yogurt', '12345', '2024-11-11', '09:00:00', '1', 'Ban pecah pak', 'disetujui');
INSERT INTO `surat_keterlambatan` VALUES (3, 1, 4, 'elvan chua ng lie', '11111', '2024-11-11', '07:30:00', 'Telat 30 menit', 'Main fifa, tak lihat jam', 'disetujui');

-- ----------------------------
-- Table structure for surat_masuk
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk`;
CREATE TABLE `surat_masuk`  (
  `id_surat_masuk` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_jenis_surat` int NULL DEFAULT NULL,
  `tanggal_terima` date NULL DEFAULT NULL,
  `perihal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lampiran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_levels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of surat_masuk
-- ----------------------------
INSERT INTO `surat_masuk` VALUES (1, '1123', 1, '2024-11-09', '1', '1731134242_7a44bd66ae0c57565ace.jpg', 'admin,yayasan,kepsek,wakepsek,kesiswaan,guru', '0000-00-00 00:00:00', NULL);
INSERT INTO `surat_masuk` VALUES (2, '2202324', 2, '2024-11-09', 'qwe', '1731134242_7a44bd66ae0c57565ace.jpg', 'admin', NULL, NULL);
INSERT INTO `surat_masuk` VALUES (3, '2202324', 1, '2024-11-09', '123', '1731133832_d8a44dd51ea638cc5b10.jpg', 'admin', NULL, NULL);
INSERT INTO `surat_masuk` VALUES (4, '111111', 1, '2024-11-09', '111', '1731133832_d8a44dd51ea638cc5b10.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('admin','yayasan','kepsek','wakepsek','kesiswaan','guru','hrd') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '22161050', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@gmail.com', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, NULL, 'kepsek', 'c4ca4238a0b923820dcc509a6f75849b', 'kepsek@gmail.com', 'kepsek', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, NULL, 'wakepsek', 'c4ca4238a0b923820dcc509a6f75849b', 'wakepsek@gmail.com', 'wakepsek', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, NULL, 'yayasan', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 'yayasan', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, '22161050', 'hrd ', 'c4ca4238a0b923820dcc509a6f75849b', '', 'hrd', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, '1111', 'yoga', '5b7579069280fe8db6f7823769b1094c', 'yogagans@gmail.com', 'guru', NULL, NULL, '2024-11-12 11:55:12', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity`  (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 762 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES (1, '1', 'Masuk ke Log Activity', '2024-11-06 05:44:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (2, '1', 'Masuk ke Log Activity', '2024-11-06 05:44:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (3, '1', 'Masuk ke Setting', '2024-11-06 05:46:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (4, '1', 'Masuk ke Setting', '2024-11-06 05:47:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (5, '1', 'Masuk ke Setting', '2024-11-06 05:48:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (6, '1', 'Masuk ke Dashboard', '2024-11-06 06:32:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (7, '1', 'Masuk ke Dashboard', '2024-11-06 06:46:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (8, '1', 'Masuk ke Dashboard', '2024-11-06 06:46:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (9, '1', 'Masuk ke Tambah Pengeluaran', '2024-11-06 06:55:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (10, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:55:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (11, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:56:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (12, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:56:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (13, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:57:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (14, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:57:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (15, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:57:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (16, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:57:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (17, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:59:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (18, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 06:59:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (19, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:04:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (20, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:05:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (21, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:06:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (22, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:06:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (23, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:07:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (24, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:07:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (25, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:07:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (26, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:07:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (27, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:08:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (28, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:08:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (29, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:08:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (30, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:08:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (31, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:17:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (32, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:18:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (33, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:19:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (34, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:21:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (35, '1', 'Masuk ke Dashboard', '2024-11-06 07:25:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (36, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:25:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (37, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:25:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (38, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:27:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (39, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:27:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (40, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:28:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (41, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:28:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (42, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:42:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (43, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-06 07:43:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (44, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:53:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (45, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:53:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (46, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:53:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (47, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:54:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (48, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:54:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (49, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:54:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (50, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:55:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (51, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:55:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (52, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 07:57:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (53, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:00:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (54, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (55, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (56, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (57, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (58, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (59, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:01:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (60, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:02:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (61, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:02:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (62, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:02:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (63, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:03:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (64, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:03:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (65, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:03:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (66, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:03:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (67, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:03:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (68, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:05:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (69, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:05:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (70, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:06:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (71, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:06:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (72, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:06:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (73, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:06:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (74, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:07:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (75, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:07:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (76, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:08:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (77, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:12:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (78, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:13:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (79, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:13:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (80, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:13:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (81, '1', 'Masuk ke Edit surat_keluar', '2024-11-06 08:14:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (82, '1', 'Masuk ke Dashboard', '2024-11-06 08:15:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (83, NULL, 'Masuk ke Dashboard', '2024-11-07 06:46:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (84, NULL, 'Masuk ke Dashboard', '2024-11-07 06:48:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (85, '1', 'Masuk ke Dashboard', '2024-11-07 07:04:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (86, '1', 'Masuk ke Setting', '2024-11-07 07:04:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (87, '1', 'Masuk ke Setting', '2024-11-07 07:05:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (88, '1', 'Masuk ke Dashboard', '2024-11-07 07:05:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (89, NULL, 'Masuk ke Dashboard', '2024-11-07 07:06:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (90, '1', 'Masuk ke Dashboard', '2024-11-07 07:07:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (91, '1', 'Masuk ke Dashboard', '2024-11-08 03:53:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (92, NULL, 'Masuk ke Dashboard', '2024-11-08 04:01:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (93, '1', 'Masuk ke Dashboard', '2024-11-08 04:01:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (94, '1', 'Masuk ke Dashboard', '2024-11-08 04:02:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (95, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 04:08:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (96, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 04:09:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (97, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 04:10:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (98, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 04:10:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (99, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 05:05:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (100, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 05:19:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (101, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 05:40:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (102, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 05:40:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (103, '1', 'Masuk ke Log Activity', '2024-11-08 05:51:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (104, '1', 'Masuk ke Dashboard', '2024-11-08 05:51:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (105, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 05:52:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (106, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:17:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (107, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:27:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (108, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:30:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (109, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:36:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (110, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:39:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (111, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:42:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (112, '1', 'Masuk ke Edit surat_keluar', '2024-11-08 06:43:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (113, '1', 'Masuk ke Edit surat_keluar', '2024-11-08 06:43:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (114, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:43:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (115, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:47:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (116, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:47:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (117, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 06:48:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (118, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 07:05:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (119, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 07:15:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (120, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 07:18:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (121, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 07:58:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (122, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:05:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (123, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:10:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (124, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:10:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (125, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:10:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (126, '1', 'Masuk ke Dashboard', '2024-11-08 08:12:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (127, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:13:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (128, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:16:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (129, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:16:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (130, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:17:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (131, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:17:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (132, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:22:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (133, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:23:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (134, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 08:49:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (135, '1', 'Masuk ke Dashboard', '2024-11-08 21:18:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (136, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:18:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (137, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:20:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (138, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:23:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (139, '1', 'Masuk ke Dashboard', '2024-11-08 21:28:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (140, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:28:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (141, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:40:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (142, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:40:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (143, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-08 21:51:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (144, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-08 22:44:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (145, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:25:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (146, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:27:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (147, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:27:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (148, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:27:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (149, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:28:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (150, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:29:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (151, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:29:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (152, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-09 00:30:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (153, '1', 'Masuk ke Edit surat_keluar', '2024-11-09 00:32:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (154, '1', 'Masuk ke Edit surat_masuk', '2024-11-09 00:35:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (155, '1', 'Masuk ke Edit surat_masuk', '2024-11-09 00:36:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (156, '1', 'Masuk ke Edit surat_masuk', '2024-11-09 00:36:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (157, '1', 'Masuk ke Edit surat_masuk', '2024-11-09 00:37:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (158, '1', 'Masuk ke Edit surat_masuk', '2024-11-09 00:37:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (159, '1', 'Masuk ke Dashboard', '2024-11-09 03:50:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (160, '1', 'Masuk ke Dashboard', '2024-11-09 03:53:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (161, '1', 'Masuk ke Dashboard', '2024-11-09 03:55:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (162, '1', 'Masuk ke Dashboard', '2024-11-09 03:57:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (163, '1', 'Masuk ke Dashboard', '2024-11-09 04:04:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (164, '2', 'Masuk ke Dashboard', '2024-11-09 04:11:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (165, '1', 'Masuk ke Dashboard', '2024-11-09 04:11:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (166, '2', 'Masuk ke Dashboard', '2024-11-09 04:19:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (167, '1', 'Masuk ke Dashboard', '2024-11-09 04:19:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (168, '1', 'Masuk ke Dashboard', '2024-11-09 04:21:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (169, '1', 'Masuk ke Dashboard', '2024-11-09 04:37:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (170, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-09 04:52:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (171, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-09 04:54:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (172, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-09 04:54:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (173, '1', 'Masuk ke Dashboard', '2024-11-10 07:18:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (174, '1', 'Masuk ke Dashboard', '2024-11-10 07:21:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (175, '1', 'Masuk ke Dashboard', '2024-11-10 07:35:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (176, '1', 'Masuk ke Dashboard', '2024-11-10 07:41:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (177, '1', 'Masuk ke Dashboard', '2024-11-10 21:51:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (178, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:02:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (179, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:09:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (180, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:09:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (181, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:11:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (182, '1', 'Masuk ke Dashboard', '2024-11-10 22:15:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (183, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:17:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (184, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:17:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (185, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:18:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (186, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:19:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (187, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:19:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (188, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:20:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (189, '1', 'Masuk ke Dashboard', '2024-11-10 22:37:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (190, '6', 'Masuk ke Dashboard', '2024-11-10 22:37:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (191, '1', 'Masuk ke Dashboard', '2024-11-10 22:37:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (192, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:45:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (193, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:50:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (194, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:53:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (195, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:53:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (196, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 22:55:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (197, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-10 22:57:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (198, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 23:00:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (199, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-10 23:02:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (200, '1', 'Masuk ke Dashboard', '2024-11-10 23:53:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (201, '1', 'Masuk ke Dashboard', '2024-11-10 23:58:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (202, '2', 'Masuk ke Dashboard', '2024-11-11 00:11:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (203, '1', 'Masuk ke Dashboard', '2024-11-11 00:11:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (204, '2', 'Masuk ke Dashboard', '2024-11-11 00:12:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (205, '7', 'Masuk ke Dashboard', '2024-11-11 00:13:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (206, '1', 'Masuk ke Dashboard', '2024-11-11 00:18:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (207, '1', 'Masuk ke Dashboard', '2024-11-11 00:27:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (208, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-11 00:29:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (209, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:34:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (210, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:35:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (211, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:35:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (212, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:35:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (213, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:36:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (214, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:37:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (215, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:37:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (216, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:39:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (217, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:39:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (218, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:40:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (219, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:42:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (220, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-11 00:43:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (221, '1', 'Masuk ke Dashboard', '2024-11-11 06:04:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (222, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-11 06:15:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (223, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-11 06:34:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (224, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:55:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (225, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:55:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (226, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:56:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (227, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:56:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (228, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:56:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (229, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:56:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (230, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:57:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (231, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:57:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (232, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 06:58:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (233, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:00:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (234, '1', 'Masuk ke Dashboard', '2024-11-11 07:00:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (235, '1', 'Masuk ke Dashboard', '2024-11-11 07:00:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (236, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:01:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (237, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:01:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (238, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:01:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (239, NULL, 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:01:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (240, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:02:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (241, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:03:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (242, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:03:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (243, '1', 'Masuk ke Dashboard', '2024-11-11 07:04:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (244, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:04:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (245, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:07:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (246, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:08:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (247, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:09:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (248, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:17:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (249, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:19:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (250, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-11 07:22:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (251, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:32:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (252, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:33:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (253, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:34:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (254, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:35:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (255, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:36:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (256, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:38:15', NULL, NULL);
INSERT INTO `user_activity` VALUES (257, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:38:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (258, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:38:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (259, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:40:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (260, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:49:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (261, '6', 'Masuk ke Dashboard', '2024-11-11 07:50:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (262, '6', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:50:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (263, '6', 'Masuk ke Edit Pengajuan Cuti', '2024-11-11 07:51:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (264, '1', 'Masuk ke Dashboard', '2024-11-11 07:51:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (265, '1', 'Masuk ke Dashboard', '2024-11-11 08:13:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (266, '1', 'Masuk ke Dashboard', '2024-11-11 08:27:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (267, '6', 'Masuk ke Dashboard', '2024-11-11 09:25:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (268, '1', 'Masuk ke Dashboard', '2024-11-11 09:26:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (269, '1', 'Masuk ke Dashboard', '2024-11-11 20:07:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (270, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-11 21:02:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (271, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-11 21:03:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (272, '1', 'Masuk ke Dashboard', '2024-11-11 23:49:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (273, '1', 'Masuk ke Dashboard', '2024-11-12 00:10:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (274, '1', 'Masuk ke Dashboard', '2024-11-12 00:49:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (275, NULL, 'Masuk ke Dashboard', '2024-11-12 06:26:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (276, '1', 'Masuk ke Dashboard', '2024-11-12 06:27:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (277, '1', 'Masuk ke Dashboard', '2024-11-12 06:27:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (278, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:41:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (279, '1', 'Masuk ke Dokumen', '2024-11-12 06:41:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (280, '1', 'Masuk ke Dokumen', '2024-11-12 06:41:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (281, '1', 'Masuk ke Dokumen', '2024-11-12 06:41:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (282, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:41:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (283, '1', 'Masuk ke Dokumen', '2024-11-12 06:41:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (284, '1', 'Masuk ke Dokumen', '2024-11-12 06:42:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (285, '1', 'Masuk ke Dokumen', '2024-11-12 06:45:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (286, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (287, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (288, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:47:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (289, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (290, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:47:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (291, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (292, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:47:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (293, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (294, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:47:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (295, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (296, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:47:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (297, '1', 'Masuk ke Dokumen', '2024-11-12 06:47:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (298, '1', 'Masuk ke Dokumen', '2024-11-12 06:53:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (299, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:53:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (300, '1', 'Masuk ke Dokumen', '2024-11-12 06:53:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (301, '1', 'Masuk ke Dokumen', '2024-11-12 06:54:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (302, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:54:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (303, '1', 'Masuk ke Dokumen', '2024-11-12 06:54:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (304, '1', 'Masuk ke Dokumen', '2024-11-12 06:55:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (305, '1', 'Masuk ke Dokumen', '2024-11-12 06:55:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (306, '1', 'Masuk ke Dokumen', '2024-11-12 06:55:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (307, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:56:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (308, '1', 'Masuk ke Dokumen', '2024-11-12 06:56:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (309, '1', 'Masuk ke Dokumen', '2024-11-12 06:56:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (310, '1', 'Masuk ke Dokumen', '2024-11-12 06:56:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (311, '1', 'Masuk ke Dokumen', '2024-11-12 06:56:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (312, '1', 'Masuk ke Dokumen', '2024-11-12 06:57:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (313, '1', 'Masuk ke Dokumen', '2024-11-12 06:57:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (314, '1', 'Masuk ke Dokumen', '2024-11-12 06:57:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (315, '1', 'Masuk ke Dokumen', '2024-11-12 06:57:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (316, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:57:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (317, '1', 'Masuk ke Dokumen', '2024-11-12 06:57:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (318, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:58:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (319, '1', 'Masuk ke Dokumen', '2024-11-12 06:58:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (320, '1', 'Masuk ke Dokumen', '2024-11-12 06:58:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (321, '1', 'Masuk ke Lihat Folder', '2024-11-12 06:58:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (322, '1', 'Masuk ke Dokumen', '2024-11-12 06:58:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (323, '1', 'Masuk ke Dokumen', '2024-11-12 07:00:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (324, '1', 'Masuk ke Login', '2024-11-12 07:00:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (325, '1', 'Masuk ke Dashboard', '2024-11-12 07:00:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (326, '1', 'Masuk ke Dokumen', '2024-11-12 07:00:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (327, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:00:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (328, '1', 'Masuk ke Dokumen', '2024-11-12 07:00:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (329, '1', 'Masuk ke Dokumen', '2024-11-12 07:02:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (330, '1', 'Masuk ke Dokumen', '2024-11-12 07:02:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (331, '1', 'Masuk ke Dokumen', '2024-11-12 07:05:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (332, '1', 'Masuk ke Dokumen', '2024-11-12 07:06:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (333, '1', 'Masuk ke Dokumen', '2024-11-12 07:06:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (334, '1', 'Masuk ke Dokumen', '2024-11-12 07:09:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (335, '1', 'Masuk ke Dokumen', '2024-11-12 07:10:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (336, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:10:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (337, '1', 'Masuk ke Dokumen', '2024-11-12 07:10:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (338, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:10:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (339, '1', 'Masuk ke Dokumen', '2024-11-12 07:10:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (340, '1', 'Masuk ke Dokumen', '2024-11-12 07:13:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (341, '1', 'Masuk ke Dokumen', '2024-11-12 07:14:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (342, '1', 'Masuk ke Dokumen', '2024-11-12 07:14:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (343, '1', 'Masuk ke Dokumen', '2024-11-12 07:15:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (344, '1', 'Masuk ke Dokumen', '2024-11-12 07:16:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (345, '1', 'Masuk ke Dokumen', '2024-11-12 07:17:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (346, '1', 'Masuk ke Dokumen', '2024-11-12 07:19:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (347, '1', 'Masuk ke Dokumen', '2024-11-12 07:19:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (348, '1', 'Masuk ke Dokumen', '2024-11-12 07:21:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (349, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:21:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (350, '1', 'Masuk ke Dokumen', '2024-11-12 07:21:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (351, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:21:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (352, '1', 'Masuk ke Dokumen', '2024-11-12 07:21:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (353, '1', 'Masuk ke Dokumen', '2024-11-12 07:21:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (354, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:21:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (355, '1', 'Masuk ke Dokumen', '2024-11-12 07:21:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (356, '1', 'Masuk ke Dokumen', '2024-11-12 07:23:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (357, '1', 'Masuk ke Dokumen', '2024-11-12 07:24:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (358, '1', 'Masuk ke Dokumen', '2024-11-12 07:24:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (359, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (360, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (361, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:25:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (362, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (363, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (364, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (365, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (366, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (367, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (368, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (369, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:25:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (370, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (371, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:25:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (372, '1', 'Masuk ke Dokumen', '2024-11-12 07:25:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (373, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (374, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (375, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (376, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (377, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (378, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (379, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (380, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (381, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (382, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (383, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (384, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (385, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (386, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (387, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (388, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (389, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (390, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:26:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (391, '1', 'Masuk ke Dokumen', '2024-11-12 07:26:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (392, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:27:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (393, '1', 'Masuk ke Dokumen', '2024-11-12 07:27:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (394, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:27:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (395, '1', 'Masuk ke Dokumen', '2024-11-12 07:27:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (396, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:27:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (397, '1', 'Masuk ke Dokumen', '2024-11-12 07:27:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (398, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:27:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (399, '1', 'Masuk ke Dokumen', '2024-11-12 07:29:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (400, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:29:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (401, '1', 'Masuk ke Dokumen', '2024-11-12 07:29:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (402, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:29:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (403, '1', 'Masuk ke Dokumen', '2024-11-12 07:29:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (404, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:29:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (405, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (406, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (407, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (408, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (409, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (410, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (411, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (412, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (413, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (414, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (415, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (416, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (417, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (418, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (419, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (420, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (421, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (422, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (423, '1', 'Masuk ke Dokumen', '2024-11-12 07:30:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (424, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:30:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (425, '1', 'Masuk ke Dokumen', '2024-11-12 07:31:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (426, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:31:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (427, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:31:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (428, '1', 'Masuk ke Dokumen', '2024-11-12 07:32:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (429, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:32:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (430, '1', 'Masuk ke Dokumen', '2024-11-12 07:32:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (431, '1', 'Masuk ke Dokumen', '2024-11-12 07:35:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (432, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:35:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (433, '1', 'Masuk ke Dokumen', '2024-11-12 07:35:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (434, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (435, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (436, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (437, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (438, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (439, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (440, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (441, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (442, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (443, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (444, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (445, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:15', NULL, NULL);
INSERT INTO `user_activity` VALUES (446, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (447, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (448, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (449, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (450, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (451, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (452, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (453, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (454, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:36:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (455, '1', 'Masuk ke Dokumen', '2024-11-12 07:36:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (456, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:37:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (457, '1', 'Masuk ke Dokumen', '2024-11-12 07:37:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (458, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:37:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (459, '1', 'Masuk ke Dokumen', '2024-11-12 07:37:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (460, '1', 'Masuk ke Dokumen', '2024-11-12 07:38:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (461, '1', 'Masuk ke Dokumen', '2024-11-12 07:39:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (462, '1', 'Masuk ke Dokumen', '2024-11-12 07:39:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (463, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:39:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (464, '1', 'Masuk ke Dokumen', '2024-11-12 07:39:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (465, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:39:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (466, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:39:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (467, '1', 'Masuk ke Dokumen', '2024-11-12 07:39:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (468, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:39:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (469, '1', 'Masuk ke Dokumen', '2024-11-12 07:39:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (470, '1', 'Masuk ke Dokumen', '2024-11-12 07:42:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (471, '1', 'Masuk ke Dokumen', '2024-11-12 07:43:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (472, '1', 'Masuk ke Dokumen', '2024-11-12 07:47:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (473, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (474, '1', 'Masuk ke Dokumen', '2024-11-12 07:47:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (475, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (476, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (477, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (478, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (479, '1', 'Masuk ke Dokumen', '2024-11-12 07:47:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (480, '1', 'Masuk ke Dokumen', '2024-11-12 07:47:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (481, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:47:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (482, '1', 'Masuk ke Dokumen', '2024-11-12 07:47:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (483, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (484, '1', 'Masuk ke Dokumen', '2024-11-12 07:48:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (485, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (486, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (487, '1', 'Masuk ke Dokumen', '2024-11-12 07:48:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (488, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (489, '1', 'Masuk ke Dokumen', '2024-11-12 07:48:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (490, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (491, '1', 'Masuk ke Dokumen', '2024-11-12 07:48:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (492, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:48:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (493, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:49:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (494, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:51:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (495, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (496, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (497, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:52:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (498, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (499, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:52:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (500, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (501, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:52:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (502, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (503, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:52:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (504, '1', 'Masuk ke Dokumen', '2024-11-12 07:52:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (505, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:52:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (506, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:54:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (507, '1', 'Masuk ke Lihat Folder', '2024-11-12 07:54:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (508, '1', 'Masuk ke Dokumen', '2024-11-12 07:54:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (509, '1', 'Masuk ke Dokumen', '2024-11-12 07:56:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (510, '1', 'Masuk ke Dokumen', '2024-11-12 07:59:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (511, '1', 'Masuk ke Dokumen', '2024-11-12 07:59:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (512, '1', 'Masuk ke Dokumen', '2024-11-12 07:59:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (513, '1', 'Masuk ke Dokumen', '2024-11-12 08:00:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (514, '1', 'Masuk ke Dokumen', '2024-11-12 08:01:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (515, '1', 'Masuk ke Dokumen', '2024-11-12 08:01:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (516, '1', 'Masuk ke Dokumen', '2024-11-12 08:02:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (517, '1', 'Masuk ke Dokumen', '2024-11-12 08:02:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (518, '1', 'Masuk ke Dokumen', '2024-11-12 08:02:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (519, '1', 'Masuk ke User', '2024-11-12 08:05:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (520, '1', 'Masuk ke User', '2024-11-12 08:09:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (521, '1', 'Masuk ke Tambah User', '2024-11-12 08:10:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (522, '1', 'Masuk ke Tambah User', '2024-11-12 08:10:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (523, '1', 'Masuk ke Tambah User', '2024-11-12 08:12:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (524, '1', 'Masuk ke Tambah User', '2024-11-12 08:12:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (525, '1', 'Masuk ke User', '2024-11-12 08:13:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (526, '1', 'Masuk ke User', '2024-11-12 08:14:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (527, '1', 'Masuk ke Edit user', '2024-11-12 08:14:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (528, '1', 'Masuk ke User', '2024-11-12 08:14:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (529, '1', 'Masuk ke User', '2024-11-12 08:15:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (530, '1', 'Masuk ke User', '2024-11-12 08:16:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (531, '1', 'Masuk ke Edit user', '2024-11-12 08:16:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (532, '1', 'Masuk ke User', '2024-11-12 08:16:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (533, '1', 'Masuk ke User', '2024-11-12 08:21:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (534, '1', 'Masuk ke User', '2024-11-12 08:21:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (535, '1', 'Masuk ke User', '2024-11-12 08:22:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (536, '1', 'Masuk ke User', '2024-11-12 08:26:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (537, '1', 'Masuk ke Restore', '2024-11-12 08:26:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (538, '1', 'Masuk ke Restore', '2024-11-12 08:26:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (539, '1', 'Masuk ke User', '2024-11-12 08:26:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (540, '1', 'Masuk ke User', '2024-11-12 08:31:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (541, '1', 'Masuk ke Edit user', '2024-11-12 08:31:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (542, '1', 'Masuk ke Edit user', '2024-11-12 08:32:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (543, '1', 'Masuk ke User', '2024-11-12 08:33:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (544, '1', 'Masuk ke User', '2024-11-12 08:33:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (545, '1', 'Masuk ke Edit user', '2024-11-12 08:33:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (546, '1', 'Masuk ke Edit user', '2024-11-12 08:33:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (547, '1', 'Masuk ke Edit user', '2024-11-12 08:35:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (548, '1', 'Masuk ke User', '2024-11-12 08:35:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (549, '1', 'Masuk ke Edit user', '2024-11-12 08:35:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (550, '1', 'Masuk ke Edit user', '2024-11-12 08:37:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (551, '1', 'Masuk ke Edit user', '2024-11-12 08:37:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (552, '1', 'Masuk ke User', '2024-11-12 08:37:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (553, '1', 'Masuk ke User', '2024-11-12 08:37:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (554, '1', 'Masuk ke Edit user', '2024-11-12 08:37:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (555, '1', 'Masuk ke User', '2024-11-12 08:40:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (556, '1', 'Masuk ke User', '2024-11-12 08:40:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (557, '1', 'Masuk ke User', '2024-11-12 08:41:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (558, '1', 'Masuk ke Edit user', '2024-11-12 08:41:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (559, '1', 'Masuk ke Edit user', '2024-11-12 08:44:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (560, '1', 'Masuk ke User', '2024-11-12 08:44:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (561, '1', 'Masuk ke User', '2024-11-12 08:44:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (562, '1', 'Masuk ke Edit user', '2024-11-12 08:44:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (563, '1', 'Masuk ke User', '2024-11-12 08:44:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (564, '1', 'Masuk ke Restore', '2024-11-12 08:44:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (565, '1', 'Masuk ke User', '2024-11-12 08:44:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (566, '1', 'Masuk ke User', '2024-11-12 08:47:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (567, '1', 'Masuk ke User', '2024-11-12 08:47:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (568, '1', 'Masuk ke Edit user', '2024-11-12 08:47:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (569, '1', 'Masuk ke User', '2024-11-12 08:48:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (570, '1', 'Masuk ke User', '2024-11-12 08:48:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (571, '1', 'Masuk ke Edit user', '2024-11-12 08:48:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (572, '1', 'Masuk ke Edit user', '2024-11-12 08:48:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (573, '1', 'Masuk ke Edit user', '2024-11-12 08:48:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (574, '1', 'Masuk ke Edit user', '2024-11-12 08:53:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (575, '1', 'Masuk ke User', '2024-11-12 08:53:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (576, '1', 'Masuk ke User', '2024-11-12 08:53:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (577, '1', 'Masuk ke User', '2024-11-12 08:53:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (578, '1', 'Masuk ke User', '2024-11-12 08:53:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (579, '1', 'Masuk ke Dashboard', '2024-11-12 08:53:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (580, '1', 'Masuk ke User', '2024-11-12 08:53:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (581, '1', 'Masuk ke Edit user', '2024-11-12 08:54:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (582, '1', 'Masuk ke Edit user', '2024-11-12 08:54:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (583, '1', 'Masuk ke Edit user', '2024-11-12 08:54:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (584, '1', 'Masuk ke Edit user', '2024-11-12 08:54:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (585, '1', 'Masuk ke Edit user', '2024-11-12 08:54:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (586, '1', 'Masuk ke User', '2024-11-12 08:54:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (587, '1', 'Masuk ke User', '2024-11-12 08:56:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (588, '1', 'Masuk ke Edit user', '2024-11-12 08:56:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (589, '1', 'Masuk ke User', '2024-11-12 08:56:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (590, '1', 'Masuk ke User', '2024-11-12 08:57:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (591, '1', 'Masuk ke Edit user', '2024-11-12 08:57:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (592, '1', 'Masuk ke User', '2024-11-12 08:57:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (593, '1', 'Masuk ke User', '2024-11-12 08:58:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (594, '1', 'Masuk ke Edit user', '2024-11-12 08:58:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (595, '1', 'Masuk ke User', '2024-11-12 08:58:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (596, '1', 'Masuk ke User', '2024-11-12 09:00:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (597, '1', 'Masuk ke Edit user', '2024-11-12 09:00:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (598, '1', 'Masuk ke Edit user', '2024-11-12 09:00:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (599, '1', 'Masuk ke Edit user', '2024-11-12 09:03:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (600, '1', 'Masuk ke User', '2024-11-12 09:03:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (601, '1', 'Masuk ke Edit user', '2024-11-12 09:03:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (602, '1', 'Masuk ke User', '2024-11-12 09:05:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (603, '1', 'Masuk ke User', '2024-11-12 09:05:53', NULL, NULL);
INSERT INTO `user_activity` VALUES (604, '1', 'Masuk ke Edit user', '2024-11-12 09:05:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (605, '1', 'Masuk ke Login', '2024-11-12 09:05:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (606, '1', 'Masuk ke Dashboard', '2024-11-12 09:06:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (607, '1', 'Masuk ke User', '2024-11-12 09:06:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (608, '1', 'Masuk ke Edit user', '2024-11-12 09:06:19', NULL, NULL);
INSERT INTO `user_activity` VALUES (609, '1', 'Masuk ke Login', '2024-11-12 09:06:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (610, '1', 'Masuk ke Login', '2024-11-12 09:07:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (611, '1', 'Masuk ke Dashboard', '2024-11-12 09:07:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (612, '1', 'Masuk ke User', '2024-11-12 09:08:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (613, '1', 'Masuk ke Edit user', '2024-11-12 09:08:07', NULL, NULL);
INSERT INTO `user_activity` VALUES (614, '1', 'Masuk ke Login', '2024-11-12 09:08:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (615, '1', 'Masuk ke Dashboard', '2024-11-12 09:08:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (616, '1', 'Masuk ke Dashboard', '2024-11-12 09:08:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (617, '1', 'Masuk ke User', '2024-11-12 09:08:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (618, '1', 'Masuk ke Edit user', '2024-11-12 09:08:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (619, '1', 'Masuk ke Login', '2024-11-12 09:08:54', NULL, NULL);
INSERT INTO `user_activity` VALUES (620, '1', 'Masuk ke Dashboard', '2024-11-12 09:09:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (621, '1', 'Masuk ke User', '2024-11-12 09:09:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (622, '1', 'Masuk ke Edit user', '2024-11-12 09:09:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (623, '1', 'Masuk ke Login', '2024-11-12 09:09:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (624, '1', 'Masuk ke Dashboard', '2024-11-12 09:09:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (625, '1', 'Masuk ke User', '2024-11-12 09:09:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (626, '1', 'Masuk ke Edit user', '2024-11-12 09:09:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (627, '1', 'Masuk ke Login', '2024-11-12 09:09:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (628, '1', 'Masuk ke Dashboard', '2024-11-12 09:09:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (629, '1', 'Masuk ke User', '2024-11-12 09:09:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (630, '1', 'Masuk ke User', '2024-11-12 09:11:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (631, '1', 'Masuk ke Edit user', '2024-11-12 09:11:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (632, '1', 'Masuk ke Login', '2024-11-12 09:22:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (633, '1', 'Masuk ke Dashboard', '2024-11-12 09:22:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (634, '1', 'Masuk ke User', '2024-11-12 09:23:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (635, '1', 'Masuk ke Edit user', '2024-11-12 09:23:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (636, '1', 'Masuk ke Edit user', '2024-11-12 09:23:47', NULL, NULL);
INSERT INTO `user_activity` VALUES (637, '1', 'Masuk ke Edit user', '2024-11-12 09:29:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (638, '1', 'Masuk ke User', '2024-11-12 09:29:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (639, '1', 'Masuk ke Edit user', '2024-11-12 09:29:05', NULL, NULL);
INSERT INTO `user_activity` VALUES (640, '1', 'Masuk ke User', '2024-11-12 09:29:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (641, '1', 'Masuk ke Edit user', '2024-11-12 09:29:11', NULL, NULL);
INSERT INTO `user_activity` VALUES (642, '1', 'Masuk ke Edit user', '2024-11-12 09:30:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (643, '1', 'Masuk ke User', '2024-11-12 09:30:49', NULL, NULL);
INSERT INTO `user_activity` VALUES (644, '1', 'Masuk ke User', '2024-11-12 09:30:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (645, '1', 'Masuk ke Edit user', '2024-11-12 09:30:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (646, '1', 'Masuk ke User', '2024-11-12 09:30:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (647, '1', 'Masuk ke User', '2024-11-12 09:30:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (648, '1', 'Masuk ke Edit user', '2024-11-12 09:30:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (649, '1', 'Masuk ke Edit user', '2024-11-12 09:31:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (650, '1', 'Masuk ke User', '2024-11-12 09:31:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (651, '1', 'Masuk ke User', '2024-11-12 09:32:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (652, '1', 'Masuk ke Edit user', '2024-11-12 09:32:28', NULL, NULL);
INSERT INTO `user_activity` VALUES (653, '1', 'Masuk ke Edit user', '2024-11-12 09:32:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (654, '1', 'Masuk ke Edit user', '2024-11-12 09:38:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (655, '1', 'Masuk ke User', '2024-11-12 09:38:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (656, '1', 'Masuk ke Edit user', '2024-11-12 09:38:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (657, '1', 'Masuk ke User', '2024-11-12 09:38:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (658, '1', 'Masuk ke User', '2024-11-12 09:40:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (659, '1', 'Masuk ke Edit user', '2024-11-12 09:40:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (660, '1', 'Masuk ke User', '2024-11-12 09:40:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (661, '1', 'Masuk ke User', '2024-11-12 09:43:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (662, '1', 'Masuk ke User', '2024-11-12 09:44:13', NULL, NULL);
INSERT INTO `user_activity` VALUES (663, '1', 'Masuk ke User', '2024-11-12 09:44:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (664, '1', 'Masuk ke Restore Edit', '2024-11-12 09:44:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (665, '1', 'Masuk ke Restore Edit', '2024-11-12 09:44:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (666, '1', 'Masuk ke Restore Edit', '2024-11-12 09:44:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (667, '1', 'Masuk ke User', '2024-11-12 09:46:30', NULL, NULL);
INSERT INTO `user_activity` VALUES (668, '1', 'Masuk ke Restore Edit', '2024-11-12 09:46:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (669, '1', 'Masuk ke Restore Edit', '2024-11-12 09:46:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (670, '1', 'Masuk ke User', '2024-11-12 09:46:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (671, '1', 'Masuk ke Login', '2024-11-12 09:47:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (672, '1', 'Masuk ke Dashboard', '2024-11-12 09:49:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (673, '1', 'Masuk ke Surat Masuk', '2024-11-12 09:49:33', NULL, NULL);
INSERT INTO `user_activity` VALUES (674, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-12 09:49:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (675, '1', 'Masuk ke Surat Masuk', '2024-11-12 09:49:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (676, '1', 'Masuk ke Edit surat_masuk', '2024-11-12 09:49:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (677, '1', 'Masuk ke Surat Masuk', '2024-11-12 09:49:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (678, '1', 'Masuk ke Surat Keluar', '2024-11-12 09:49:59', NULL, NULL);
INSERT INTO `user_activity` VALUES (679, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-12 09:50:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (680, '1', 'Masuk ke Surat Keluar', '2024-11-12 09:50:41', NULL, NULL);
INSERT INTO `user_activity` VALUES (681, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-12 09:52:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (682, '1', 'Masuk ke Surat Keluar', '2024-11-12 09:52:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (683, '1', 'Masuk ke Surat Keterlambatan', '2024-11-12 09:53:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (684, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-12 09:53:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (685, '1', 'Masuk ke Surat Keterlambatan', '2024-11-12 09:53:16', NULL, NULL);
INSERT INTO `user_activity` VALUES (686, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-12 09:53:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (687, '1', 'Masuk ke Surat Keterlambatan', '2024-11-12 09:53:26', NULL, NULL);
INSERT INTO `user_activity` VALUES (688, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:53:39', NULL, NULL);
INSERT INTO `user_activity` VALUES (689, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-12 09:53:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (690, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:53:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (691, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-12 09:54:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (692, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:54:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (693, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:54:17', NULL, NULL);
INSERT INTO `user_activity` VALUES (694, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:54:20', NULL, NULL);
INSERT INTO `user_activity` VALUES (695, '1', 'Masuk ke Dokumen', '2024-11-12 09:54:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (696, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 09:54:29', NULL, NULL);
INSERT INTO `user_activity` VALUES (697, '1', 'Masuk ke Dokumen', '2024-11-12 09:54:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (698, '1', 'Masuk ke Lihat Folder', '2024-11-12 09:54:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (699, '1', 'Masuk ke User', '2024-11-12 09:54:55', NULL, NULL);
INSERT INTO `user_activity` VALUES (700, '1', 'Masuk ke Tambah User', '2024-11-12 09:54:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (701, '1', 'Masuk ke User', '2024-11-12 09:55:10', NULL, NULL);
INSERT INTO `user_activity` VALUES (702, '1', 'Masuk ke Edit user', '2024-11-12 09:55:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (703, '1', 'Masuk ke User', '2024-11-12 09:55:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (704, '1', 'Masuk ke Restore', '2024-11-12 09:55:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (705, '1', 'Masuk ke Restore', '2024-11-12 09:55:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (706, '1', 'Masuk ke Restore Edit', '2024-11-12 09:55:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (707, '1', 'Masuk ke User', '2024-11-12 09:55:38', NULL, NULL);
INSERT INTO `user_activity` VALUES (708, '1', 'Masuk ke User', '2024-11-12 09:55:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (709, '1', 'Masuk ke Restore', '2024-11-12 09:55:46', NULL, NULL);
INSERT INTO `user_activity` VALUES (710, '1', 'Masuk ke User', '2024-11-12 09:55:48', NULL, NULL);
INSERT INTO `user_activity` VALUES (711, '1', 'Masuk ke Log Activity', '2024-11-12 09:55:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (712, '1', 'Masuk ke Log Activity', '2024-11-12 09:56:00', NULL, NULL);
INSERT INTO `user_activity` VALUES (713, '1', 'Masuk ke Log Activity', '2024-11-12 09:56:04', NULL, NULL);
INSERT INTO `user_activity` VALUES (714, '1', 'Masuk ke Setting', '2024-11-12 09:56:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (715, '1', 'Masuk ke Setting', '2024-11-12 09:56:36', NULL, NULL);
INSERT INTO `user_activity` VALUES (716, '1', 'Masuk ke Setting', '2024-11-12 11:20:56', NULL, NULL);
INSERT INTO `user_activity` VALUES (717, '1', 'Masuk ke Login', '2024-11-12 11:20:57', NULL, NULL);
INSERT INTO `user_activity` VALUES (718, '1', 'Masuk ke Dashboard', '2024-11-12 11:21:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (719, '1', 'Masuk ke Dashboard', '2024-11-12 11:21:34', NULL, NULL);
INSERT INTO `user_activity` VALUES (720, '1', 'Masuk ke Dashboard', '2024-11-12 11:21:51', NULL, NULL);
INSERT INTO `user_activity` VALUES (721, '1', 'Masuk ke Dashboard', '2024-11-12 11:22:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (722, '1', 'Masuk ke Dashboard', '2024-11-12 11:22:14', NULL, NULL);
INSERT INTO `user_activity` VALUES (723, '1', 'Masuk ke Dashboard', '2024-11-12 11:22:18', NULL, NULL);
INSERT INTO `user_activity` VALUES (724, '1', 'Masuk ke Dashboard', '2024-11-12 11:22:27', NULL, NULL);
INSERT INTO `user_activity` VALUES (725, '1', 'Masuk ke Surat Masuk', '2024-11-12 11:22:42', NULL, NULL);
INSERT INTO `user_activity` VALUES (726, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-12 11:23:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (727, '1', 'Masuk ke Surat Masuk', '2024-11-12 11:23:35', NULL, NULL);
INSERT INTO `user_activity` VALUES (728, '1', 'Masuk ke Edit surat_masuk', '2024-11-12 11:23:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (729, '1', 'Masuk ke Dokumen', '2024-11-12 11:24:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (730, '1', 'Masuk ke Surat Keluar', '2024-11-12 11:24:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (731, '1', 'Masuk ke Tambah Surat Keluar', '2024-11-12 11:24:50', NULL, NULL);
INSERT INTO `user_activity` VALUES (732, '1', 'Masuk ke Surat Keluar', '2024-11-12 11:25:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (733, '1', 'Masuk ke Edit surat_keluar', '2024-11-12 11:25:23', NULL, NULL);
INSERT INTO `user_activity` VALUES (734, '1', 'Masuk ke Surat Keterlambatan', '2024-11-12 11:26:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (735, '1', 'Masuk ke Tambah Surat Keterlambatan', '2024-11-12 11:26:40', NULL, NULL);
INSERT INTO `user_activity` VALUES (736, '1', 'Masuk ke Surat Keterlambatan', '2024-11-12 11:27:01', NULL, NULL);
INSERT INTO `user_activity` VALUES (737, '1', 'Masuk ke Edit Surat Keterlambatan', '2024-11-12 11:27:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (738, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 11:27:21', NULL, NULL);
INSERT INTO `user_activity` VALUES (739, '1', 'Masuk ke Tambah Surat Pengajuan Cuti', '2024-11-12 11:27:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (740, '1', 'Masuk ke Surat Pengajuan Cuti', '2024-11-12 11:27:43', NULL, NULL);
INSERT INTO `user_activity` VALUES (741, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-12 11:27:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (742, '1', 'Masuk ke Edit Pengajuan Cuti', '2024-11-12 11:27:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (743, '1', 'Masuk ke Dokumen', '2024-11-12 11:28:52', NULL, NULL);
INSERT INTO `user_activity` VALUES (744, '1', 'Masuk ke Dokumen', '2024-11-12 11:31:06', NULL, NULL);
INSERT INTO `user_activity` VALUES (745, '1', 'Masuk ke Lihat Folder', '2024-11-12 11:33:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (746, '1', 'Masuk ke User', '2024-11-12 11:33:44', NULL, NULL);
INSERT INTO `user_activity` VALUES (747, '1', 'Masuk ke Setting', '2024-11-12 11:34:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (748, '1', 'Masuk ke Restore', '2024-11-12 11:34:32', NULL, NULL);
INSERT INTO `user_activity` VALUES (749, '1', 'Masuk ke Restore Edit', '2024-11-12 11:35:08', NULL, NULL);
INSERT INTO `user_activity` VALUES (750, '1', 'Masuk ke Restore Edit', '2024-11-12 11:35:37', NULL, NULL);
INSERT INTO `user_activity` VALUES (751, '1', 'Masuk ke Log Activity', '2024-11-12 11:36:03', NULL, NULL);
INSERT INTO `user_activity` VALUES (752, '1', 'Masuk ke Surat Masuk', '2024-11-12 11:37:45', NULL, NULL);
INSERT INTO `user_activity` VALUES (753, '1', 'Masuk ke Surat Masuk', '2024-11-12 11:39:22', NULL, NULL);
INSERT INTO `user_activity` VALUES (754, '1', 'Masuk ke Tambah Surat Masuk', '2024-11-12 11:39:31', NULL, NULL);
INSERT INTO `user_activity` VALUES (755, '1', 'Masuk ke User', '2024-11-12 11:53:24', NULL, NULL);
INSERT INTO `user_activity` VALUES (756, '1', 'Masuk ke Tambah User', '2024-11-12 11:53:25', NULL, NULL);
INSERT INTO `user_activity` VALUES (757, '1', 'Masuk ke User', '2024-11-12 11:53:58', NULL, NULL);
INSERT INTO `user_activity` VALUES (758, '1', 'Masuk ke Edit user', '2024-11-12 11:54:02', NULL, NULL);
INSERT INTO `user_activity` VALUES (759, '1', 'Masuk ke User', '2024-11-12 11:55:09', NULL, NULL);
INSERT INTO `user_activity` VALUES (760, '1', 'Masuk ke User', '2024-11-12 11:55:12', NULL, NULL);
INSERT INTO `user_activity` VALUES (761, '1', 'Masuk ke Restore', '2024-11-12 11:55:14', NULL, NULL);

-- ----------------------------
-- Table structure for user_backup
-- ----------------------------
DROP TABLE IF EXISTS `user_backup`;
CREATE TABLE `user_backup`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('admin','yayasan','kepsek','wakepsek','kesiswaan','guru','hrd') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_backup
-- ----------------------------
INSERT INTO `user_backup` VALUES (1, '22161050', 'admin', NULL, 'admin@gmail.com', 'admin', 1, '2024-11-12 09:30:54', NULL, NULL);
INSERT INTO `user_backup` VALUES (5, '22161050', 'hrd ', NULL, '', 'hrd', 1, '2024-11-12 09:29:08', NULL, NULL);
INSERT INTO `user_backup` VALUES (13, '1111', 'yoga', NULL, 'yogagans@gmail.com', 'guru', 1, '2024-11-12 09:55:24', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
