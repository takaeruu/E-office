<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">EDIT USER</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form action="<?= base_url('home/aksi_e_user') ?>" method="POST" >
    <div id="form-container">
        <div class="modal-form">
            <div class="row">
                <div class="col-md-7 mb-3">
                    <label for="nomor_surat">Username:</label>
                    <input type="text" class="form-control" name="username" placeholder="Masukkan Username" value="<?= $satu->username ?>">
                </div>
                
                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">NIK:</label>
                    <input type="text" class="form-control" name="nik" placeholder="Masukkan NIK" value="<?= $satu->nik ?>">
                </div>

                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">Email:</label>
                    <input type="email" class="form-control" name="email" placeholder="Masukkan Email" value="<?= $satu->email ?>">
                </div>

                <div class="col-md-7 mb-3">
                    <label for="jenis_pengajuan">Status:</label>
                    <select class="form-control" name="status">
                        <option value="" disabled <?= empty($satu->status) ? 'selected' : '' ?>>Pilih Status</option>
                        <option value="yayasan" <?= $satu->status === 'yayasan' ? 'selected' : '' ?>>Yayasan</option>
                        <option value="hrd" <?= $satu->status === 'hrd' ? 'selected' : '' ?>>HRD</option>
                        <option value="kepsek" <?= $satu->status === 'kepsek' ? 'selected' : '' ?>>Kepala Sekolah</option>
                        <option value="wakepsek" <?= $satu->status === 'wakepsek' ? 'selected' : '' ?>>Wakil Kepala Sekolah</option>
                        <option value="guru" <?= $satu->status === 'guru' ? 'selected' : '' ?>>Guru</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <input type="hidden" name="id" value="<?= $satu->id_user ?>">
            <button type="submit" class="btn btn-success">Save</button>
        </div>
    </div>
</form>


                </div>
            </div>
        </div>
    </div>
</section>
