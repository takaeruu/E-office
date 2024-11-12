<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">EDIT SURAT PENGAJUAN CUTI</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form method="POST" action="<?= base_url('home/aksi_e_pengajuan_cuti') ?>" id="modalForm" enctype="multipart/form-data">
                        <div id="form-container">
                            <div class="modal-form">
                                <div class="row">
                                    <!-- Nama, NIK, and Jabatan Fields -->
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

                                    <!-- Cabang SPH Field -->
                                    <div class="col-md-7 mb-3">
                                        <label for="penerima">Cabang SPH:</label>
                                        <input type="text" class="form-control" name="cabang" placeholder="Masukkan Cabang SPH" value="<?= $satu->cabang ?>">
                                    </div>

                                    <!-- Jenis Pengajuan Field -->
                                    <div class="col-md-7 mb-3">
                                        <label for="jenis_pengajuan">Jenis Pengajuan:</label>
                                        <select class="form-control" name="jenis_pengajuan">
                                            <option value="" disabled <?= empty($satu->jenis_pengajuan) ? 'selected' : '' ?>>Pilih jenis pengajuan</option>
                                            <option value="Cuti Tahunan" <?= $satu->jenis_pengajuan == "Cuti Tahunan" ? 'selected' : '' ?>>Cuti Tahunan</option>
                                            <option value="Cuti Khusus" <?= $satu->jenis_pengajuan == "Cuti Khusus" ? 'selected' : '' ?>>Cuti Khusus</option>
                                            <option value="WFH" <?= $satu->jenis_pengajuan == "WFH" ? 'selected' : '' ?>>WFH</option>
                                            <option value="Sakit Surat Dokter" <?= $satu->jenis_pengajuan == "Sakit Surat Dokter" ? 'selected' : '' ?>>Sakit Surat Dokter</option>
                                            <option value="Sakit Tanpa Surat Dokter" <?= $satu->jenis_pengajuan == "Sakit Tanpa Surat Dokter" ? 'selected' : '' ?>>Sakit Tanpa Surat Dokter</option>
                                            <option value="Ijin Tanpa Bayar / ITB" <?= $satu->jenis_pengajuan == "Ijin Tanpa Bayar / ITB" ? 'selected' : '' ?>>Ijin Tanpa Bayar / ITB</option>
                                        </select>
                                    </div>

                                    <!-- Date Fields -->
                                    <div class="col-md-7 mb-3">
                                        <label for="tanggal_mulai_cuti">Tanggal Mulai Cuti:</label>
                                        <input type="date" class="form-control" id="tanggal_mulai_cuti" name="tanggal_mulai_cuti" value="<?= $satu->tanggal_mulai_cuti ?>">
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="tanggal_terakhir_cuti">Tanggal Terakhir Cuti:</label>
                                        <input type="date" class="form-control" id="tanggal_terakhir_cuti" name="tanggal_terakhir_cuti" value="<?= $satu->tanggal_terakhir_cuti ?>">
                                    </div>

                                    <!-- Total Hari Cuti Field (Read-only) -->
                                    <div class="col-md-7 mb-3">
                                        <label for="total_hari_cuti">Total Hari Cuti:</label>
                                        <input type="text" class="form-control" id="total_hari_cuti" name="total_hari_cuti" value="<?= $satu->total_hari_cuti ?>" readonly>
                                    </div>

                                    <!-- Tanggal Kembali Kerja Field -->
                                    <div class="col-md-7 mb-3">
                                        <label for="tanggal_kembali_kerja">Tanggal Kembali Kerja:</label>
                                        <input type="date" class="form-control" name="tanggal_kembali_kerja" value="<?= $satu->tanggal_kembali_kerja ?>">
                                    </div>

                                    <!-- Additional Fields -->
                                    <div class="col-md-7 mb-3">
                                        <label for="ambil_ahli">Selama Cuti Tugas Diambil Alih Oleh:</label>
                                        <input type="text" class="form-control" name="ambil_ahli" placeholder="Selama Cuti Tugas Diambil Alih Oleh" value="<?= $satu->ambil_ahli ?>">
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="alamat_cuti">Alamat Cuti:</label>
                                        <input type="text" class="form-control" name="alamat_cuti" placeholder="Masukkan Alamat Cuti" value="<?= $satu->alamat_cuti ?>">
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="alasan_cuti">Alasan Cuti:</label>
                                        <input type="text" class="form-control" name="alasan_cuti" placeholder="Masukkan Alasan Cuti" value="<?= $satu->alasan_cuti ?>">
                                    </div>

                                    <!-- HRD Editable Fields -->
                                    <?php $userRole = session()->get('status'); ?>
                                    <div class="col-md-7 mb-3">
                                        <label for="jumlah_jatah_cuti">Jumlah Jatah Cuti:</label>
                                        <input type="text" class="form-control" name="jumlah_jatah_cuti" placeholder="Akan Diisi Oleh HRD" value="<?= $satu->jumlah_jatah_cuti ?>" <?= ($userRole == 'admin' || $userRole == 'hrd') ? '' : 'readonly' ?>>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="ajukan_cuti">Cuti Yang Diajukan:</label>
                                        <input type="text" class="form-control" name="ajukan_cuti" placeholder="Akan Diisi Oleh HRD" value="<?= $satu->ajukan_cuti ?>" <?= ($userRole == 'admin' || $userRole == 'hrd') ? '' : 'readonly' ?>>
                                    </div>
                                    <div class="form-group col-md-7 mb-3">
                                        <label for="catatan" class="form-label">Catatan:</label>
                                        <textarea class="form-control" id="catatan" name="catatan" rows="2" placeholder="Akan Diisi Oleh HRD" <?= ($userRole == 'admin' || $userRole == 'hrd') ? '' : 'readonly' ?>><?= $satu->catatan ?></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <input type="hidden" name="id" value="<?= $satu->id_pengajuan_cuti ?>">
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
            document.getElementById("total_hari_cuti").value = ""; // Clear if dates are invalid
        }
    }
</script>
