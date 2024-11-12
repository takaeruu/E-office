<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">EDIT SURAT KELUAR</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form method="POST" action="<?= base_url('home/aksi_e_surat_keluar') ?>" id="modalForm" enctype="multipart/form-data">
        <!-- Form Tambah Modal 1 (Form Pertama) -->
        <div class="modal-form">
            <div class="row">
                <div class="col-md-7 mb-3">
                    <label for="nomor_surat">Nomor Surat:</label>
                    <input type="text" class="form-control" name="nomor_surat" placeholder="Masukkan nomor surat" value ="<?= $satu->nomor_surat ?>">
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">Tanggal Kirim:</label>
                    <input type="date" class="form-control" name="tanggal_kirim" value ="<?= $satu->tanggal_kirim ?>">
                </div>
                <div class="col-md-7 mb-3">
                    <label for="penerima">Penerima:</label>
                    <input type="text" class="form-control" name="penerima" placeholder="Masukkan penerima" value ="<?= $satu->penerima ?>">
                </div>
                <div class="form-group col-md-7 mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Perihal:</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" name="perihal" rows="2" placeholder="Masukkan perihal surat"><?= $satu->perihal ?></textarea>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="lampiran">Lampiran:</label>
                    <input type="file" class="form-control" name="lampiran" value ="<?= $satu->lampiran ?>">
                </div>
            </div>
        </div>
        <div class="col-sm-12">
        <input type="hidden" name="id" value="<?= $satu->id_surat_keluar ?>">
            <button type="submit" class="btn btn-success">Save</button>
        </div>
</form>

                </div>
            </div>
        </div>
    </div>
</section>
