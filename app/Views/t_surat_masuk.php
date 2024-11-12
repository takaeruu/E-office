<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">TAMBAH SURAT MASUK</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form method="POST" action="<?= base_url('home/aksi_t_surat_masuk') ?>" id="modalForm" enctype="multipart/form-data">
    <div id="form-container">
        <!-- Form Tambah Modal 1 (Form Pertama) -->
        <div class="modal-form">
            <div class="row">
                <div class="col-md-7 mb-3">
                    <label for="nomor_surat">Nomor Surat:</label>
                    <input type="text" class="form-control" name="nomor_surat" placeholder="Masukkan nomor surat" required>
                </div>
                <div class="col-md-7 mb-3">
                    <div class="form-group">
                        <label for="email-id-vertical">Jenis Surat:</label>
                        <select class="form-control" name="jenis_surat">
                            <option value="">Pilih</option>
                            <?php foreach ($yoga as $item): ?>
                                <option value="<?= $item->id_jenis_surat ?>"><?= $item->jenis_surat ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-7 mb-3">
                    <label for="tanggalkirim">Tanggal terima:</label>
                    <input type="date" class="form-control" name="tanggal_terima" required>
                </div>
                <div class="form-group col-md-7 mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Perihal:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" name="perihal" rows="2" placeholder="Masukkan perihal surat" required></textarea>
                </div>

                <div class="col-md-7 mb-3">
                    <label for="lampiran">Lampiran:</label>
                    <input type="file" class="form-control" name="lampiran" >
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
