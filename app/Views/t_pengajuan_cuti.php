<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">TAMBAH SURAT PENGAJUAN CUTI</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form method="POST" action="<?= base_url('home/aksi_t_pengajuan_cuti') ?>" id="modalForm" enctype="multipart/form-data">
    <div id="form-container">
        <!-- Form Tambah Modal 1 (Form Pertama) -->
        <div class="modal-form">
            <div class="row">
                <div class="col-md-7 mb-3">
                    <label for="nomor_surat">Nama:</label>
                    <input type="text" class="form-control" name="nama" value="<?= session()->get('nama') ?>" readonly>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">NIK:</label>
                    <input type="text" class="form-control" name="nik" value="<?= session()->get('nik') ?>" readonly>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">Jabatan:</label>
                    <input type="text" class="form-control" name="jabatan" value="<?= session()->get('status') ?>" readonly>
                </div>

                <div class="col-md-7 mb-3">
                    <label for="penerima">Cabang SPH:</label>
                    <input type="text" class="form-control" name="cabang" placeholder="Masukkan penerima" required>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="jenis_pengajuan">Jenis Pengajuan:</label>
                    <select class="form-control" name="jenis_pengajuan" required>
                        <option value="" disabled selected>Pilih jenis pengajuan</option>
                        <option value="Cuti Tahunan">Cuti Tahunan</option>
                        <option value="Cuti Khusus">Cuti Khusus</option>
                        <option value="WFH">WFH</option>
                        <option value="Sakit Surat Dokter">Sakit Surat Dokter</option>
                        <option value="Sakit Tanpa Surat Dokter">Sakit Tanpa Surat Dokter</option>
                        <option value="Ijin Tanpa Bayar / ITB">Ijin Tanpa Bayar / ITB</option>
                    </select>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggal_mulai_cuti">Tanggal Mulai Cuti:</label>
                    <input type="date" class="form-control" id="tanggal_mulai_cuti" name="tanggal_mulai_cuti" placeholder="Masukkan penerima" required>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggal_terakhir_cuti">Tanggal Terakhir Cuti:</label>
                    <input type="date" class="form-control" id="tanggal_terakhir_cuti" name="tanggal_terakhir_cuti" placeholder="Masukkan penerima" required>
                </div>

                <div class="col-md-7 mb-3">
                    <label for="total_hari_cuti">Total Hari Cuti:</label>
                    <input type="text" class="form-control"  id="total_hari_cuti" name="total_hari_cuti" placeholder="Total Hari Cuti" readonly>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Tanggal Kembali kerja:</label>
                    <input type="date" class="form-control" name="tanggal_kembali_kerja" placeholder="Masukkan Tanggal Kembali Kerja" required>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Selama Cuti Tugas Diambil Alih Oleh:</label>
                    <input type="text" class="form-control" name="ambil_ahli" placeholder="Selama Cuti Tugas Diambil Alih Oleh" required>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Alamat Cuti:</label>
                    <input type="text" class="form-control" name="alamat_cuti" placeholder="Masukkan Alamat Cuti" required>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Alasan Cuti:</label>
                    <input type="text" class="form-control" name="alasan_cuti" placeholder="Masukkan Alasan Cuti" required>
                </div>




                <div class="col-md-7 mb-3">
                    <label for="penerima">Jumlah Jatah Cuti:</label>
                    <input type="text" class="form-control" name="jumlah_jatah_cuti" placeholder="Akan Diisi Oleh HRD" required readonly>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Cuti Yang Diajukan:</label>
                    <input type="text" class="form-control" name="ajukan_cuti" placeholder="Akan Diisi Oleh HRD" required readonly>
                </div>
                <div class="form-group col-md-7 mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Catatan:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" name="catatan" rows="2" placeholder="Akan Diisi Oleh HRD" required readonly></textarea>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <button type="submit" class="btn btn-success">Save</button>
        </div>
    </div>
</form>

                </div>
            </div>
        </div>
    </div>
</section>
<script>
    // JavaScript function to calculate the difference in days
    document.getElementById("tanggal_mulai_cuti").addEventListener("change", calculateTotalDays);
    document.getElementById("tanggal_terakhir_cuti").addEventListener("change", calculateTotalDays);

    function calculateTotalDays() {
        const startDate = new Date(document.getElementById("tanggal_mulai_cuti").value);
        const endDate = new Date(document.getElementById("tanggal_terakhir_cuti").value);
        
        if (!isNaN(startDate) && !isNaN(endDate)) {
            const diffTime = Math.abs(endDate - startDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1; // +1 to include both start and end dates
            document.getElementById("total_hari_cuti").value = diffDays + " hari";
        } else {
            document.getElementById("total_hari_cuti").value = ""; // Clear if dates are not valid
        }
    }
</script>