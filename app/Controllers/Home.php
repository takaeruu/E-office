<?php

namespace App\Controllers;
use App\Models\M_eoffice;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Home extends BaseController
{
	public function dashboard()
{
    $model = new M_eoffice();
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

    // Ambil nama pengguna dari session
    $session = session();
    $data['username'] = $session->get('username');

    // Get current month and year
    // $currentMonth = date('m');
    // $currentYear = date('Y');

    // // Fetch financial data for current month and year
    // $data['chartData'] = $model->getFinancialData($currentMonth, $currentYear);

    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Dashboard',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    echo view('header', $data);
    echo view('menu');
    echo view('dashboard', $data);
    echo view('footer');
}


public function login()
	{
		$model= new M_eoffice();
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke Login',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
	echo view('header', $data);
	echo view('login');
	}




public function aksi_login()
{
    // Periksa koneksi internet
    if (!$this->checkInternetConnection()) {
        // Jika tidak ada koneksi, cek CAPTCHA gambar
        $captcha_code = $this->request->getPost('captcha_code');
        if (session()->get('captcha_code') !== $captcha_code) {
            session()->setFlashdata('toast_message', 'Invalid CAPTCHA');
            session()->setFlashdata('toast_type', 'danger');
            return redirect()->to('home/login');
        }
    } else {
        // Jika ada koneksi, cek Google reCAPTCHA
        $recaptchaResponse = trim($this->request->getPost('g-recaptcha-response'));
        $secret = '6Lep6XYqAAAAAJyz3a_XHRx5GmR70_Q-k_rWs6Vd'; // Ganti dengan Secret Key Anda
        $credential = array(
            'secret' => $secret,
            'response' => $recaptchaResponse
        );

        $verify = curl_init();
        curl_setopt($verify, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
        curl_setopt($verify, CURLOPT_POST, true);
        curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($credential));
        curl_setopt($verify, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($verify);
        curl_close($verify);

        $status = json_decode($response, true);

        if (!$status['success']) {
            session()->setFlashdata('toast_message', 'Captcha validation failed');
            session()->setFlashdata('toast_type', 'danger');
            return redirect()->to('home/login');
        }
    }


    
    // Proses login seperti biasa
    $u = $this->request->getPost('username');
    $p = $this->request->getPost('password');

    $where = array(
        'username' => $u,
        'password' => md5($p),
    );
    $model = new M_eoffice;
    $cek = $model->getWhere('user', $where);

    if ($cek) {
        session()->set('nama', $cek->username);
        session()->set('id', $cek->id_user);
        session()->set('nik', $cek->nik);
        session()->set('status', $cek->status);
        return redirect()->to('home/dashboard');
    } else {
        session()->setFlashdata('toast_message', 'Invalid login credentials');
        session()->setFlashdata('toast_type', 'danger');
        return redirect()->to('home/login');
    }
}



public function generateCaptcha()
{
    // Create a string of possible characters
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    $captcha_code = '';
    
    // Generate a random CAPTCHA code with letters and numbers
    for ($i = 0; $i < 6; $i++) {
        $captcha_code .= $characters[rand(0, strlen($characters) - 1)];
    }
    
    // Store CAPTCHA code in session
    session()->set('captcha_code', $captcha_code);
    
    // Create an image for CAPTCHA
    $image = imagecreate(120, 40); // Increased size for better readability
    $background = imagecolorallocate($image, 200, 200, 200);
    $text_color = imagecolorallocate($image, 0, 0, 0);
    $line_color = imagecolorallocate($image, 64, 64, 64);
    
    imagefilledrectangle($image, 0, 0, 120, 40, $background);
    
    // Add some random lines to the CAPTCHA image for added complexity
    for ($i = 0; $i < 5; $i++) {
        imageline($image, rand(0, 120), rand(0, 40), rand(0, 120), rand(0, 40), $line_color);
    }
    
    // Add the CAPTCHA code to the image
    imagestring($image, 5, 20, 10, $captcha_code, $text_color);
    
    // Output the CAPTCHA image
    header('Content-type: image/png');
    imagepng($image);
    imagedestroy($image);
}




public function checkInternetConnection()
{
    $connected = @fsockopen("www.google.com", 80);
    if ($connected) {
        fclose($connected);
        return true;
    } else {
        return false;
    }
}


public function surat_keluar(){

	$model = new M_eoffice;
	$where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $data['oke'] = $model->join2('surat_keluar', 'jenis_surat', 'surat_keluar.id_jenis_surat=jenis_surat.id_jenis_surat');

    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Surat Keluar',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
	echo view('header', $data);
	echo view ('menu');
	echo view ('surat_keluar', $data);
	echo view ('footer');
	
}







public function t_surat_keluar(){

	$model = new M_eoffice;
	$where = array('id_setting' => '1');
	$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $data['yoga'] = $model->tampil('jenis_surat');
	$id_user = session()->get('id');
$activityLog = [
	'id_user' => $id_user,
	'menu' => 'Masuk ke Tambah Surat Keluar',
	'time' => date('Y-m-d H:i:s')
];
$model->logActivity($activityLog);
	echo view('header', $data);
	echo view('menu');
	echo view('t_surat_keluar', $data);
	echo view('footer');
}


public function aksi_t_surat_keluar()
{
    if (session()->get('id') > 0) {
        // Ambil data dari form
        $nomor_surat = $this->request->getPost('nomor_surat');
        $jenis_surat = $this->request->getPost('jenis_surat');
        $tanggal_kirim = $this->request->getPost('tanggal_kirim');
        $penerima = $this->request->getPost('penerima');  // Email penerima
        $perihal = $this->request->getPost('perihal');

        // Proses lampiran PDF (jika ada)
        $fileLampiran = $this->request->getFile('lampiran');
        $lampiran = '';

        if ($fileLampiran->isValid() && !$fileLampiran->hasMoved()) {
            // Validasi ekstensi file
            $allowedExtensions = ['pdf'];
            $fileExt = $fileLampiran->getExtension();
            
            if (in_array(strtolower($fileExt), $allowedExtensions)) {
                // Generate nama file unik untuk PDF
                $newFileName = $fileLampiran->getRandomName();
                
                // Pindahkan file ke folder uploads
                $fileLampiran->move('uploads', $newFileName);
                $lampiran = $newFileName;
            } else {
                // File bukan PDF
                return redirect()->back()->with('error', 'Hanya file PDF yang diizinkan');
            }
        }

        // Simpan data surat keluar ke database
        $darren = [
            'nomor_surat' => $nomor_surat,
            'id_jenis_surat' => $jenis_surat,
            'tanggal_kirim' => $tanggal_kirim,
            'penerima' => $penerima,
            'perihal' => $perihal,
            'lampiran' => $lampiran,
        ];

        // Masukkan data ke database
        $model = new M_eoffice;
        $model->tambah('surat_keluar', $darren);

        // Persiapkan data pengumuman
        $pengumuman = (object)[
            'nomor_surat' => $nomor_surat,
            'perihal' => $perihal,
            'file' => $lampiran, // Lampiran jika ada
            'penerima' => $penerima // Email penerima
        ];

        // Kirim pengumuman (email)
        $send_to_email = true;
        $this->kirimPengumuman($pengumuman, $send_to_email);

        // Subjek dan pesan email utama
        $subject = 'Surat Keluar: ' . $nomor_surat;
        $message = "Nomor Surat: $nomor_surat\nTanggal Kirim: $tanggal_kirim\nPerihal: $perihal\n\nLampiran: " . ($lampiran ? 'Terlampir' : 'Tidak ada lampiran');

        // Path lampiran
        $attachmentPath = $lampiran ? $lampiran : null;

        // Kirim email ke penerima utama
        $emailSent = $this->sendEmail($penerima, $subject, $message, $attachmentPath);

        // Cek status pengiriman email
        if ($emailSent) {
            return redirect()->to('home/surat_keluar')->with('success', 'Surat keluar berhasil dikirim dan email terkirim');
        } else {
            return redirect()->to('home/surat_keluar')->with('error', 'Surat keluar berhasil dikirim, tetapi email gagal dikirim');
        }
    } else {
        return redirect()->to('home/login');
    }
}


public function hapus_surat_keluar($id)
{
    $model = new M_eoffice();
    // $this->logUserActivity('Menghapus Pemesanan Permanent');
    $where = array('id_surat_keluar' => $id);
    $model->hapus('surat_keluar', $where);

    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Menghapus Surat Keluar',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    return redirect()->to('Home/surat_keluar');
}


private function kirimPengumuman($pengumuman, $send_to_email)
{
    if ($send_to_email) {
        // Ambil data dari objek pengumuman
        $nomor_surat = $pengumuman->nomor_surat;
        $perihal = $pengumuman->perihal;
        $lampiran = $pengumuman->file;
        $penerima = $pengumuman->penerima;  // Penerima email langsung dari objek

        // Tentukan subjek dan pesan untuk email
        $subject = 'Pengumuman: Surat Keluar - ' . $nomor_surat;
        $message = "Nomor Surat: $nomor_surat\nPerihal: $perihal\n\nSilakan periksa lampiran untuk detail lebih lanjut.";

        // Tentukan path lampiran jika ada
        $attachmentPath = $lampiran ? $lampiran : null;

        // Kirim email menggunakan fungsi sendEmail
        $emailSent = $this->sendEmail($penerima, $subject, $message, $attachmentPath);

        // Log jika email gagal dikirim
        if (!$emailSent) {
            log_message('error', 'Gagal mengirim email ke: ' . $penerima);
        }
    }
}




private function sendEmail($to, $subject, $body, $pdfFilePath = null)
{
    $mail = new PHPMailer(true);
    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'kaizenesia@gmail.com';
        $mail->Password = 'olrg tfse vglu wzun'; // Gunakan password aplikasi
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Recipients
        $mail->setFrom('kaizenesia@gmail.com', 'Sekolah Permata Harapan');
        $mail->addAddress($to);

        // Content
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = nl2br($body);

        // Tambahkan lampiran PDF jika ada
        if ($pdfFilePath) {
            // Pastikan path file lengkap dan file ada
            $fullPdfPath = 'uploads/' . $pdfFilePath;
            
            if (file_exists($fullPdfPath)) {
                // Periksa ekstensi file
                $fileExtension = strtolower(pathinfo($fullPdfPath, PATHINFO_EXTENSION));
                
                if ($fileExtension === 'pdf') {
                    $mail->addAttachment($fullPdfPath);
                } else {
                    log_message('error', 'File bukan PDF: ' . $fullPdfPath);
                    return false;
                }
            } else {
                log_message('error', 'File PDF tidak ditemukan: ' . $fullPdfPath);
                return false;
            }
        }

        // Kirim email
        $mail->send();
        return true;
    } catch (Exception $e) {
        log_message('error', 'Email gagal dikirim: ' . $mail->ErrorInfo);
        return false;
    }
}



public function edit_surat_keluar($id)
	{
		if(session()->get('id')>0){
		$model = new M_eoffice();
		$where=array('id_surat_keluar'=>$id);
		
		$data['satu']=$model->getWhere('surat_keluar',$where);

        $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Edit surat_keluar',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
		echo view ('header', $data);
		echo view ('menu');
		echo view('e_surat_keluar',$data);
		echo view('footer');
		}else{
		return redirect()->to('home/login');
		}
	}

	public function aksi_e_surat_keluar()
{
    if(session()->get('id')>0) {
        $model = new M_eoffice();
        
        // Ambil data form
        $id = $this->request->getPost('id');
        $nomor_surat = $this->request->getPost('nomor_surat');
        $tanggal_kirim = $this->request->getPost('tanggal_kirim');
        $penerima = $this->request->getPost('penerima');
        $perihal = $this->request->getPost('perihal');
        
        // Handle file upload
        $lampiran = $this->request->getFile('lampiran');
        $lampiran_existing = $this->request->getPost('lampiran_existing');
        
        // Jika ada file baru diupload
        if ($lampiran->isValid() && !$lampiran->hasMoved()) {
            // Generate nama file baru
            $newName = $lampiran->getRandomName();
            
            // Pindahkan file ke folder uploads
            $lampiran->move('./uploads', $newName);
            
            // Hapus file lama jika ada
            if (!empty($lampiran_existing) && file_exists('./uploads/' . $lampiran_existing)) {
                unlink('./uploads/' . $lampiran_existing);
            }
            
            $nama_lampiran = $newName;
        } else {
            // Jika tidak ada file baru, gunakan file yang existing
            $nama_lampiran = $lampiran_existing;
        }
        
        $where = array('id_surat_keluar' => $id);
        
        $isi = array(
            'nomor_surat' => $nomor_surat,
            'tanggal_kirim' => $tanggal_kirim,
            'penerima' => $penerima,
            'perihal' => $perihal,
            'lampiran' => $nama_lampiran
        );
        $model->edit('surat_keluar', $isi, $where);
        
        return redirect()->to('home/surat_keluar');
    } else {
        return redirect()->to('home/login');
    }
}



public function surat_masuk()
{
    $model = new M_eoffice;

    // Ambil data pengguna yang sedang login (misalnya dari session)
    $status = session()->get('status');  // Contoh: "admin"
    
    // Ambil data surat masuk
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $data['oke'] = $model->join1('surat_masuk', 'jenis_surat', 'surat_masuk.id_jenis_surat=jenis_surat.id_jenis_surat');

    // Filter surat masuk berdasarkan hak akses pengguna (skip filter for admin)
    if ($status !== 'admin') {
        $data['oke'] = array_filter($data['oke'], function ($surat) use ($status) {
            // Pecahkan hak akses dari surat masuk ke dalam array
            $access_levels = explode(',', $surat->access_levels);
            // Periksa apakah peran pengguna ada di dalam hak akses surat
            return in_array($status, $access_levels);
        });
    }
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Surat Masuk',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    // Get other data (users, etc.)
    $data['users'] = $model->tampil('user');
    
    // Load views
    echo view('header', $data);
    echo view('menu');
    echo view('surat_masuk', $data);
    echo view('footer');
}



public function update_hak_akses($id_surat_masuk)
{
    // Load model
    $model = new M_eoffice;

    // Ambil data yang dikirim dari form
    $access_levels = $this->request->getPost('access_level');

    // Ubah array akses level ke format string, dipisahkan dengan koma
    $access_levels_str = is_array($access_levels) ? implode(',', $access_levels) : '';

    // Buat data array untuk diupdate ke database
    $data = [
        'access_levels' => $access_levels_str,
    ];

    // Update data di tabel surat_masuk
    $model->db->table('surat_masuk')
        ->where('id_surat_masuk', $id_surat_masuk)
        ->update($data);

    // Redirect kembali ke halaman utama dengan pesan sukses
    return redirect()->to(base_url('home/surat_masuk'))->with('success', 'Hak akses berhasil diperbarui!');
}



public function t_surat_masuk(){

	$model = new M_eoffice;
	$where = array('id_setting' => '1');
	$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $data['yoga'] = $model->tampil('jenis_surat');
	$id_user = session()->get('id');
$activityLog = [
	'id_user' => $id_user,
	'menu' => 'Masuk ke Tambah Surat Masuk',
	'time' => date('Y-m-d H:i:s')
];
$model->logActivity($activityLog);
	echo view('header', $data);
	echo view('menu');
	echo view('t_surat_masuk', $data);
	echo view('footer');
}


public function aksi_t_surat_masuk()
{
    if(session()->get('id') > 0) {
        // Ambil data dari form
        $nomor_surat = $this->request->getPost('nomor_surat');
        $jenis_surat = $this->request->getPost('jenis_surat');
        $tanggal_terima = $this->request->getPost('tanggal_terima');
        $perihal = $this->request->getPost('perihal');
        
        // Menangani file lampiran
        $fileLampiran = $this->request->getFile('lampiran');
        $lampiran = ''; // Inisialisasi lampiran kosong

        if ($fileLampiran->isValid() && !$fileLampiran->hasMoved()) {
            // Validasi ekstensi file (misalnya pdf, doc, jpg, dll)
            $allowedExtensions = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'jpg', 'jpeg', 'png', 'gif'];
            $fileExt = $fileLampiran->getExtension();

            if (in_array(strtolower($fileExt), $allowedExtensions)) {
                // Generate nama file unik
                $newFileName = $fileLampiran->getRandomName();

                // Pindahkan file ke folder 'uploads'
                $fileLampiran->move('uploads', $newFileName);
                $lampiran = $newFileName; // Simpan nama file yang telah dipindahkan
            } else {
                // Jika ekstensi file tidak diperbolehkan
                return redirect()->back()->with('error', 'Ekstensi file tidak diizinkan. Hanya file PDF, Word, Excel, dan Gambar yang diizinkan.');
            }
        }

        // Menyimpan data surat masuk ke database
        $darren = [
            'nomor_surat' => $nomor_surat,
            'id_jenis_surat' => $jenis_surat,
            'tanggal_terima' => $tanggal_terima,
            'perihal' => $perihal,
            'lampiran' => $lampiran, // Simpan nama file lampiran
        ];

        $model = new M_eoffice();
        $model->tambah('surat_masuk', $darren); // Simpan data ke tabel surat_masuk

        // Redirect setelah berhasil
        return redirect()->to('home/surat_masuk')->with('success', 'Surat masuk berhasil ditambahkan');
    } else {
        return redirect()->to('home/login');
    }
}



public function edit_surat_masuk($id)
	{
		if(session()->get('id')>0){
		$model = new M_eoffice();
		$where=array('id_surat_masuk'=>$id);
		
		$data['satu']=$model->getWhere('surat_masuk',$where);

        $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Edit surat_masuk',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
		echo view ('header', $data);
		echo view ('menu');
		echo view('e_surat_masuk',$data);
		echo view('footer');
		}else{
		return redirect()->to('home/login');
		}
	}


    public function aksi_e_surat_masuk()
{
    if(session()->get('id')>0) {
        $model = new M_eoffice();
        
        // Ambil data form
        $id = $this->request->getPost('id');
        $nomor_surat = $this->request->getPost('nomor_surat');
        $tanggal_terima = $this->request->getPost('tanggal_terima');
        $perihal = $this->request->getPost('perihal');
        
        // Handle file upload
        $lampiran = $this->request->getFile('lampiran');
        $lampiran_existing = $this->request->getPost('lampiran_existing');
        
        // Jika ada file baru diupload
        if ($lampiran->isValid() && !$lampiran->hasMoved()) {
            // Generate nama file baru
            $newName = $lampiran->getRandomName();
            
            // Pindahkan file ke folder uploads
            $lampiran->move('./uploads', $newName);
            
            // Hapus file lama jika ada
            if (!empty($lampiran_existing) && file_exists('./uploads/' . $lampiran_existing)) {
                unlink('./uploads/' . $lampiran_existing);
            }
            
            $nama_lampiran = $newName;
        } else {
            // Jika tidak ada file baru, gunakan file yang existing
            $nama_lampiran = $lampiran_existing;
        }
        
        $where = array('id_surat_masuk' => $id);
        
        $isi = array(
            'nomor_surat' => $nomor_surat,
            'tanggal_terima' => $tanggal_terima,
            'perihal' => $perihal,
            'lampiran' => $nama_lampiran
        );
        $model->edit('surat_masuk', $isi, $where);
        
        return redirect()->to('home/surat_masuk');
    } else {
        return redirect()->to('home/login');
    }
}

public function hapus_surat_masuk($id)
{
    $model = new M_eoffice();
    // $this->logUserActivity('Menghapus Pemesanan Permanent');
    $where = array('id_surat_masuk' => $id);
    $model->hapus('surat_masuk', $where);
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Menghapus Surat Masuk',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    return redirect()->to('Home/surat_masuk');
}

public function surat_keterlambatan() {
    $model = new M_eoffice;

    // Check the user's status from the session
    $userStatus = session()->get('status');

    // Define the query condition based on the user's status
    if (in_array($userStatus, ['admin', 'kepsek', 'hrd', 'wakepsek', 'yayasan'])) {
        // If the user is an admin, kepsek, or hrd, get all records
        $data['oke'] = $model->tampil('surat_keterlambatan');
    } else {
        // Otherwise, get only the records created by the logged-in user
        $where1 = array('id_user' => session()->get('id'));
        $data['oke'] = $model->tampilwhere('surat_keterlambatan', $where1);
    }

    // Fetch additional setting data
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Surat Keterlambatan',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    
    // Load the views with the data
    echo view('header', $data);
    echo view('menu');
    echo view('surat_keterlambatan', $data);
    echo view('footer');
}



public function t_surat_keterlambatan(){

	$model = new M_eoffice;
	$where = array('id_setting' => '1');
	$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
	$id_user = session()->get('id');
$activityLog = [
	'id_user' => $id_user,
	'menu' => 'Masuk ke Tambah Surat Keterlambatan',
	'time' => date('Y-m-d H:i:s')
];
$model->logActivity($activityLog);
	echo view('header', $data);
	echo view('menu');
	echo view('t_surat_keterlambatan', $data);
	echo view('footer');
}


public function aksi_t_surat_keterlambatan()
	{
		if(session()->get('id')>0){
		$nama = $this -> request ->getPost('nama');
		$nik = $this -> request ->getPost('nik');
		$tanggal = $this -> request ->getPost('tanggal');
		$jam_kedatangan = $this -> request ->getPost('jam_kedatangan');
        $jumlah_keterlambatan = $this -> request ->getPost('jumlah_keterlambatan');
        $alasan = $this -> request ->getPost('alasan');

		

		$darren=array(
            'id_user' => session()->get('id'), 
			'nama'=>$nama,
			'nik'=>$nik,
			'tanggal'=>$tanggal,
			'jam_kedatangan'=>$jam_kedatangan,
            'jumlah_keterlambatan'=>$jumlah_keterlambatan,
            'alasan'=>$alasan,
            'id_jenis_surat'=>4,
            'status'=>'pending',
		);

		$model=new M_eoffice;
		$model->tambah('surat_keterlambatan',$darren);
		return redirect()->to('home/surat_keterlambatan');
	}else{
		return redirect()->to('home/login');
		}
	}

    public function edit_surat_keterlambatan($id){

        $model = new M_eoffice;
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $where=array('id_surat_keterlambatan'=>$id);
		
		$data['satu']=$model->getWhere('surat_keterlambatan',$where);
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Edit Surat Keterlambatan',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
        echo view('header', $data);
        echo view('menu');
        echo view('e_surat_keterlambatan', $data);
        echo view('footer');
    }

    public function aksi_e_surat_keterlambatan()
	{
		if(session()->get('id')>0){
		$nama = $this -> request ->getPost('nama');
		$nik = $this -> request ->getPost('nik');
		$tanggal = $this -> request ->getPost('tanggal');
		$jam_kedatangan = $this -> request ->getPost('jam_kedatangan');
        $jumlah_keterlambatan = $this -> request ->getPost('jumlah_keterlambatan');
        $alasan = $this -> request ->getPost('alasan');
        $id = $this->request->getPost('id');

        $where = array('id_surat_keterlambatan' => $id);

		

		$darren=array(
			'nama'=>$nama,
			'nik'=>$nik,
			'tanggal'=>$tanggal,
			'jam_kedatangan'=>$jam_kedatangan,
            'jumlah_keterlambatan'=>$jumlah_keterlambatan,
            'alasan'=>$alasan,
		);

		$model=new M_eoffice;
        $model->edit('surat_keterlambatan', $darren, $where);
		return redirect()->to('home/surat_keterlambatan');
	}else{
		return redirect()->to('home/login');
		}
	}


    public function hapus_surat_keterlambatan($id)
{
    $model = new M_eoffice();
    // $this->logUserActivity('Menghapus Pemesanan Permanent');
    $where = array('id_surat_keterlambatan' => $id);
    $model->hapus('surat_keterlambatan', $where);
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Menghapus Surat Keterlambatan',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    return redirect()->to('Home/surat_keterlambatan');
}
    public function setuju_surat_keterlambatan($id)
    {
        $model = new M_eoffice();
        $where = array('id_surat_keterlambatan' => $id);
        $array = array(
            'status' => 'disetujui',
        );
        $model->edit('surat_keterlambatan', $array, $where);

        return redirect()->to('Home/surat_keterlambatan');
    }
    public function setuju_kepsek_surat_keterlambatan($id)
    {
        $model = new M_eoffice();
        $where = array('id_surat_keterlambatan' => $id);
        $array = array(
            'status' => 'menunggu persetujuan HRD',
        );
        $model->edit('surat_keterlambatan', $array, $where);

        return redirect()->to('Home/surat_keterlambatan');
    }
    public function tolak_surat_keterlambatan($id)
    {
        $model = new M_eoffice();
        $where = array('id_surat_keterlambatan' => $id);
        $array = array(
            'status' => 'ditolak',
        );
        $model->edit('surat_keterlambatan', $array, $where);

        return redirect()->to('Home/surat_keterlambatan');
    }

    public function setuju_pengajuan_cuti($id)
    {
        $model = new M_eoffice();
        $where = array('id_pengajuan_cuti' => $id);
        $array = array(
            'status' => 'Disetujui',
        );
        $model->edit('pengajuan_cuti', $array, $where);

        return redirect()->to('Home/pengajuan_cuti');
    }

    public function tolak_pengajuan_cuti($id)
    {
        $model = new M_eoffice();
        $where = array('id_pengajuan_cuti' => $id);
        $array = array(
            'status' => 'Di Tolak',
        );
        $model->edit('pengajuan_cuti', $array, $where);

        return redirect()->to('Home/pengajuan_cuti');
    }


    // public function pengajuan_cuti(){

    //     $model = new M_eoffice;
    //     $where = array('id_setting' => '1');
    //     $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    //     $where1 = array('id_user' => session()->get('id'));
    //     $data['oke'] = $model->tampilwhere('pengajuan_cuti', $where1);
    //     echo view('header', $data);
    //     echo view ('menu');
    //     echo view ('pengajuan_cuti', $data);
    //     echo view ('footer');
        
    // }

    public function pengajuan_cuti() {
        $model = new M_eoffice;
    
        // Check the user's status from the session
        $userStatus = session()->get('status');
    
        // Define the query condition based on the user's status
        if (in_array($userStatus, ['admin', 'hrd', 'yayasan'])) {
            // If the user is an admin, kepsek, or hrd, get all records
            $data['oke'] = $model->tampil('pengajuan_cuti');
        } else {
            // Otherwise, get only the records created by the logged-in user
            $where1 = array('id_user' => session()->get('id'));
            $data['oke'] = $model->tampilwhere('pengajuan_cuti', $where1);
        }
    
        // Fetch additional setting data
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Surat Pengajuan Cuti',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
        
        // Load the views with the data
        echo view('header', $data);
        echo view('menu');
        echo view('pengajuan_cuti', $data);
        echo view('footer');
    }


    public function t_pengajuan_cuti()
    {
        $model = new M_eoffice;
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $data['yoga'] = $model->tampil('pengajuan_cuti');
        
        // Log the activity
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke Tambah Surat Pengajuan Cuti',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
        
        echo view('header', $data);
        echo view('menu');
        echo view('t_pengajuan_cuti', $data);
        echo view('footer');
    }
    

    public function aksi_t_pengajuan_cuti()
	{
		if(session()->get('id')>0){
		$nama = $this -> request ->getPost('nama');
		$nik = $this -> request ->getPost('nik');
		$jabatan = $this -> request ->getPost('jabatan');
		$cabang = $this -> request ->getPost('cabang');
        $jenis_pengajuan = $this -> request ->getPost('jenis_pengajuan');
        $tanggal_mulai_cuti = $this -> request ->getPost('tanggal_mulai_cuti');
        $tanggal_terakhir_cuti = $this -> request ->getPost('tanggal_terakhir_cuti');
        $total_hari_cuti = $this -> request ->getPost('total_hari_cuti');
        $tanggal_kembali_kerja = $this -> request ->getPost('tanggal_kembali_kerja');
        $ambil_ahli = $this -> request ->getPost('ambil_ahli');
        $alamat_cuti = $this -> request ->getPost('alamat_cuti');
        $alasan_cuti = $this -> request ->getPost('alasan_cuti');
        $alasan = $this -> request ->getPost('alasan');

		

		$darren=array(
            'id_user' => session()->get('id'), 
			'nama'=>$nama,
			'nik'=>$nik,
			'jabatan'=>$jabatan,
			'cabang'=>$cabang,
            'jenis_pengajuan'=>$jenis_pengajuan,
            'tanggal_mulai_cuti'=>$tanggal_mulai_cuti,
            'tanggal_terakhir_cuti'=>$tanggal_terakhir_cuti,
            'total_hari_cuti'=>$total_hari_cuti,
            'tanggal_kembali_kerja'=>$tanggal_kembali_kerja,
            'ambil_ahli'=>$ambil_ahli,
            'alamat_cuti'=>$alamat_cuti,
            'alasan_cuti'=>$alasan_cuti,
            'status'=>'pending',
            'id_jenis_surat'=>3,
		);

		$model=new M_eoffice;
		$model->tambah('pengajuan_cuti',$darren);
		return redirect()->to('home/pengajuan_cuti');
	}else{
		return redirect()->to('home/login');
		}
	}

    public function edit_pengajuan_cuti($id){

        $model = new M_eoffice;
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $where=array('id_pengajuan_cuti'=>$id);
		
		$data['satu']=$model->getWhere('pengajuan_cuti',$where);
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Edit Pengajuan Cuti',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
        echo view('header', $data);
        echo view('menu');
        echo view('e_pengajuan_cuti', $data);
        echo view('footer');
    }


    public function aksi_e_pengajuan_cuti()
	{
		if(session()->get('id')>0){
		
		$cabang = $this -> request ->getPost('cabang');
        $jenis_pengajuan = $this -> request ->getPost('jenis_pengajuan');
        $tanggal_mulai_cuti = $this -> request ->getPost('tanggal_mulai_cuti');
        $tanggal_terakhir_cuti = $this -> request ->getPost('tanggal_terakhir_cuti');
        $total_hari_cuti = $this -> request ->getPost('total_hari_cuti');
        $tanggal_kembali_kerja = $this -> request ->getPost('tanggal_kembali_kerja');
        $ambil_ahli = $this -> request ->getPost('ambil_ahli');
        $alamat_cuti = $this -> request ->getPost('alamat_cuti');
        $alasan_cuti = $this -> request ->getPost('alasan_cuti');
        $id = $this->request->getPost('id');

        $where = array('id_pengajuan_cuti' => $id);

		

		$darren=array(
			'cabang'=>$cabang,
            'jenis_pengajuan'=>$jenis_pengajuan,
            'tanggal_mulai_cuti'=>$tanggal_mulai_cuti,
            'tanggal_terakhir_cuti'=>$tanggal_terakhir_cuti,
            'total_hari_cuti'=>$total_hari_cuti,
            'tanggal_kembali_kerja'=>$tanggal_kembali_kerja,
            'ambil_ahli'=>$ambil_ahli,
            'alamat_cuti'=>$alamat_cuti,
            'alasan_cuti'=>$alasan_cuti,
		);

		$model=new M_eoffice;
        $model->edit('pengajuan_cuti', $darren, $where);
		return redirect()->to('home/pengajuan_cuti');
	}else{
		return redirect()->to('home/login');
		}
	}


    public function user(){

        $model = new M_eoffice;
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $data['oke'] = $model->tampilActive('user');
    
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke User',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
        echo view('header', $data);
        echo view ('menu');
        echo view ('user', $data);
        echo view ('footer');
        
    }

    public function soft_delete(){

        $model = new M_eoffice;
        $data['oke'] = $model->tampilrestore('user');
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke Restore',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
        echo view('header', $data);
        echo view('menu');
        echo view('soft_delete', $data);
        echo view('footer');
    }
    public function restore_user($id)
    {
        $model = new M_eoffice();
        $where = array('id_user' => $id);
        $array = array(
            'deleted_at' => NULL, // Mengatur deleted_at menjadi null
        );
        $model->edit('user', $array, $where);
    
        return redirect()->to('Home/user');
    }

    public function hapus_user_permanent($id)
{
    $model = new M_eoffice();
    // $this->logUserActivity('Menghapus Pemesanan Permanent');
    $where = array('id_user' => $id);
    $model->hapus('user', $where);

    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Menghapus User',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    return redirect()->to('Home/user');
}

    public function t_user(){

        $model = new M_eoffice;
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $data['yoga'] = $model->tampil('user');
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Tambah User',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
        echo view('header', $data);
        echo view('menu');
        echo view('t_user', $data);
        echo view('footer');
    }
    

    public function aksi_t_user()
{
    if(session()->get('id') > 0){
        $username = $this->request->getPost('username');
        $nik = $this->request->getPost('nik');
        $email = $this->request->getPost('email');
        $status = $this->request->getPost('status');

        // Menggunakan MD5 untuk hash password "sph"
        $password = md5('sph');

        $darren = array(
            'username' => $username,
            'nik' => $nik,
            'password' => $password,  // Menyimpan password yang telah di-hash
            'email' => $email,
            'status' => $status,
        );

        $model = new M_eoffice;
        $model->tambah('user', $darren); // Menyimpan data user ke database
        return redirect()->to('home/user');
    } else {
        return redirect()->to('home/login');
    }
}



    public function edit_user($id)
	{
		if(session()->get('id')>0){
		$model = new M_eoffice();
		$where=array('id_user'=>$id);
		
		$data['satu']=$model->getWhere('user',$where);

        $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Edit user',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
		echo view ('header', $data);
		echo view ('menu');
		echo view('e_user',$data);
		echo view('footer');
		}else{
		return redirect()->to('home/login');
		}
	}

    public function aksi_e_user()
    {
        if (session()->get('id') > 0) {
            $username = $this->request->getPost('username');
            $nik = $this->request->getPost('nik');
            $email = $this->request->getPost('email');
            $status = $this->request->getPost('status');
            $id = $this->request->getPost('id');
    
            $model = new M_eoffice();
            $where = ['id_user' => $id];
    
            // Step 1: Retrieve the existing user data
            $oldData = $model->getWhere1('user', $where)->getRow();
    
            if ($oldData) {
                // Step 2: Insert the old data into `user_backup`
                $backupData = [
                    'id_user' => $oldData->id_user,
                    'username' => $oldData->username,
                    'nik' => $oldData->nik,
                    'email' => $oldData->email,
                    'status' => $oldData->status,
                    'backup_at' => date('Y-m-d H:i:s'),
                    'backup_by' => session()->get('id'), // ID of the user creating the backup
                ];
                
                $model->tambah('user_backup', $backupData);
            }
    
            // Step 3: Update the `user` table with the new data
            $newData = [
                'username' => $username,
                'nik' => $nik,
                'email' => $email,
                'status' => $status,
                'updated_at' => date('Y-m-d H:i:s'),
                'updated_by' => session()->get('id'),
            ];
    
            $model->edit('user', $newData, $where);
    
            return redirect()->to('home/user');
        } else {
            return redirect()->to('home/login');
        }
    }
    

    public function aksi_restore_edit_user($id)
    {
        $model = new M_eoffice();
        
        $backupData = $model->getWhere('user_backup', ['id_user' => $id]);
    
        if ($backupData) {
           
            $restoreData = [
                'username' => $backupData->username,
                'nik' => $backupData->nik,
                'email' => $backupData->email,
                'status' => $backupData->status,
                // tambahkan field lainnya sesuai dengan struktur tabel user
            ];
            unset($restoreData['id_user']);
            $model->edit('user', $restoreData, ['id_user' => $id]);
        }
        
        return redirect()->to('home/user');
    }


public function restore_edit_user(){

    $model = new M_eoffice;
    $data['oke'] = $model->tampil('user_backup');
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Restore Edit',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    echo view('header', $data);
    echo view('menu');
    echo view('restore_edit', $data);
    echo view('footer');
}

    public function hapus_user($id)
    {
        $model = new M_eoffice();
        $where = array('id_user' => $id);
        $array = array(
            'deleted_at' => date('Y-m-d H:i:s'),
        );
        $model->edit('user', $array, $where);
        // $this->logUserActivity('Menghapus Pemesanan');

        return redirect()->to('Home/user');
    }


// Misalnya saat menampilkan folder
public function dokumen() {
    $model = new M_eoffice;
    
    // Ambil data folder
    $folders = $model->getAllFolders(); 
    
    // Ambil status pengguna saat ini
    $userStatus = session()->get('status'); 
    
    // Filter folder berdasarkan akses pengguna
    $filteredFolders = [];
    foreach ($folders as $folder) {
        $accessLevels = explode(',', $folder['access_levels']);
        
        // Cek jika status pengguna ada dalam daftar akses folder
        if (in_array($userStatus, $accessLevels)) {
            $filteredFolders[] = $folder;
        }
    }

    $data['folders'] = $filteredFolders;
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $data['yoga'] = $model->tampil('jenis_surat');
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Dokumen',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);

    // Menampilkan views
    echo view('header', $data);
    echo view('menu');
    echo view('dokumen', $data);
    echo view('footer');
}


public function view_folder($id_jenis_surat) {
    $model = new M_eoffice();
    
    // Ambil data dokumen berdasarkan id_jenis_surat
    $documents = $model->getDocumentsByJenisSurat($id_jenis_surat);

    // Ambil data folder berdasarkan id_jenis_surat
    $folder = $model->getFolderByJenisSurat($id_jenis_surat);

    if (!$folder) {
        return redirect()->to(base_url('home/dokumen'))->with('error', 'Folder tidak ditemukan untuk jenis surat ini');
    }

    // Pass data ke view
    $data['folder'] = $folder;
    $data['documents'] = $documents;
    $data['id_jenis_surat'] = $id_jenis_surat; // Add this line
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Lihat Folder',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    // Load view dengan data folder dan dokumen
    echo view('header', $data);
    echo view('menu');
    echo view('lihat_dokumen', $data);  // View untuk menampilkan dokumen dalam folder
    echo view('footer');
}










public function update_hak_akses_dokumen($id_folder)
{
    // Load model
    $model = new M_eoffice;

    // Ambil data yang dikirim dari form
    $access_levels = $this->request->getPost('access_level');

    // Ubah array akses level ke format string, dipisahkan dengan koma
    $access_levels_str = is_array($access_levels) ? implode(',', $access_levels) : '';

    // Buat data array untuk diupdate ke database
    $data = [
        'access_levels' => $access_levels_str,
        
    ];

    // Update data di tabel folder
    $model->db->table('folder')  // Pastikan ini sesuai dengan nama tabel yang benar
        ->where('id_folder', $id_folder)  // Gunakan id_surat_masuk, bukan id_folder
        ->update($data);

    // Redirect kembali ke halaman utama dengan pesan sukses
    return redirect()->to(base_url('home/dokumen'))->with('success', 'Hak akses berhasil diperbarui!');
}


    
public function aksi_t_folder()
{
    // Get folder name and jenis_surat from the form
    $folder_name = $this->request->getPost('folder_name');
    $jenis_surat = $this->request->getPost('jenis_surat');

    // Define all statuses that should have access to the new folder by default
    $allAccessLevels = 'admin,hrd,yayasan,kepsek,wakepsek,guru'; // Add or modify statuses as needed

    // Prepare data to insert into the folder table
    $model = new M_eoffice();
    $isi = [
        'nama_folder' => $folder_name,
        'id_jenis_surat' => $jenis_surat,
        'access_levels' => $allAccessLevels, // Set all statuses for access
    ];

    // Call method to add the new folder
    $model->tambah('folder', $isi);

    // Redirect back to the dokumen page after adding the folder
    return redirect()->to('home/dokumen');
}
public function aksi_e_folder()
{
    // Get folder name and jenis_surat from the form
    $folder_name = $this->request->getPost('folder_name');
    $jenis_surat = $this->request->getPost('jenis_surat');
    $id = $this->request->getPost('id');

        $where = array('id_folder' => $id);

    // Define all statuses that should have access to the new folder by default
    $allAccessLevels = 'admin,hrd,yayasan,kepsek,wakepsek,guru'; // Add or modify statuses as needed

    // Prepare data to insert into the folder table
    $model = new M_eoffice();
    $isi = [
        'nama_folder' => $folder_name,
        'id_jenis_surat' => $jenis_surat,
        'access_levels' => $allAccessLevels, // Set all statuses for access
    ];

    // Call method to add the new folder
    $model->edit('folder', $isi, $where);

    // Redirect back to the dokumen page after adding the folder
    return redirect()->to('home/dokumen');
}

public function hapus_folder($id_folder)
{
    $model = new M_eoffice(); // Pastikan model ini sudah betul dan sesuai
    $where = array('id_folder' => $id_folder); // Syarat penghapusan berdasarkan ID folder
    $model->hapus('folder', $where); // Ganti 'folder' dengan nama tabel folder di database Anda

    return redirect()->to('Home/dokumen')->with('success', 'Folder berhasil dihapus.'); // Redirect ke halaman dokumen dengan pesan sukses
}


    
    
    
    // Fungsi untuk menambah folder baru
    // public function tambah_folder() {
    //     $folder_name = $this->request->getPost('folder_name');
    //     $table_name = $this->request->getPost('table_name');
        
    //     // Periksa apakah folder sudah ada (untuk menghindari duplikasi)
    //     $data_folder = [
    //         'name' => $folder_name,
    //         'table' => $table_name,
    //     ];
    
    //     // Biasanya, Anda akan menyimpan folder baru ini ke dalam database
    //     // Misalnya kita bisa menambahkannya ke array atau database
    //     // Berikut ini hanya contoh array yang dapat diproses lebih lanjut
    //     // Menambahkan folder baru ke data folder
    //     array_push($data['folders'], $data_folder);
        
    //     // Redirect atau tampilkan kembali halaman dokumen dengan folder baru
    //     return redirect()->to(base_url('dokumen'));
    // }
    

    
    
    

public function setting()
    {
      
                $model = new M_eoffice;
                $where = array('id_setting' => '1');
                $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

                $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Setting',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
                echo view('header', $data);
                echo view('menu');
                echo view('setting', $data);
                echo view('footer');
           
    }

    public function aksi_e_setting()
    {
        $model = new M_eoffice();
        // $this->logUserActivity('Melakukan Setting');
        $namaWebsite = $this->request->getPost('namawebsite');
        $id = $this->request->getPost('id');
        $id_user = session()->get('id');
        $where = array('id_setting' => '1');

        $data = array(
            'nama_website' => $namaWebsite,
            'update_by' => $id_user,
            'update_at' => date('Y-m-d H:i:s')
        );

        // Cek apakah ada file yang diupload untuk favicon
        $favicon = $this->request->getFile('img');
        if ($favicon && $favicon->isValid() && !$favicon->hasMoved()) {
            // Beri nama file unik
            $faviconNewName = $favicon->getRandomName();
            // Pindahkan file ke direktori public/images
            $favicon->move(WRITEPATH . '../public/images', $faviconNewName);

            // Tambahkan nama file ke dalam array data
            $data['tab_icon'] = $faviconNewName;
        }

        // Cek apakah ada file yang diupload untuk logo
        $logo = $this->request->getFile('logo');
        if ($logo && $logo->isValid() && !$logo->hasMoved()) {
            // Beri nama file unik
            $logoNewName = $logo->getRandomName();
            // Pindahkan file ke direktori public/images
            $logo->move(WRITEPATH . '../public/images', $logoNewName);

            // Tambahkan nama file ke dalam array data
            $data['logo_website'] = $logoNewName;
        }

        // Cek apakah ada file yang diupload untuk logo
        $login = $this->request->getFile('login');
        if ($login && $login->isValid() && !$login->hasMoved()) {
            // Beri nama file unik
            $loginNewName = $login->getRandomName();
            // Pindahkan file ke direktori public/images
            $login->move(WRITEPATH . '../public/images', $loginNewName);

            // Tambahkan nama file ke dalam array data
            $data['login_icon'] = $loginNewName;
        }

        $model->edit('setting', $data, $where);

        // Optionally set a flash message here
        return redirect()->to('home/setting');
    }

	public function log_activity(){

		$model = new M_eoffice;
		$data['users'] = $model->getAllUsers();
	
		$userId = $this->request->getGet('user_id');
	
		// Fetch logs with optional filtering
		if (!empty($userId)) {
			$data['logs'] = $model->getLogsByUser($userId);
		} else {
			$data['logs'] = $model->getLogs();
		}
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
		$id_user = session()->get('id');
		$activityLog = [
			'id_user' => $id_user,
			'menu' => 'Masuk ke Log Activity',
			'time' => date('Y-m-d H:i:s')
		];
		$model->logActivity($activityLog);
		echo view('header', $data);
		echo view('menu');
		echo view('log_activity', $data);
		echo view('footer');
	}
}
