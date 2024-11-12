<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Hak Akses Surat Masuk</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <!-- Form untuk menambahkan hak akses -->
                        <form action="<?= base_url('home/simpan_hak_akses_surat') ?>" method="post">
                            <input type="hidden" name="id_surat_masuk" value="<?= $surat->id_surat_masuk ?>">

                            <div class="form-group">
                                <label for="users">Pilih User</label>
                                <select name="id_user" class="form-control">
                                    <?php foreach ($users as $user): ?>
                                        <option value="<?= $user->id_user ?>"><?= $user->username ?> (<?= $user->status ?>)</option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="status">Pilih status</label>
                                <select name="status" class="form-control">
                                    <option value="admin">Admin</option>
                                    <option value="yayasan">Yayasan</option>
                                    <option value="kepsek">Kepsek</option>
                                    <option value="wakepsek">Wakepsek</option>
                                    <option value="kesiswaan">Kesiswaan</option>
                                    <option value="guru">Guru</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-success">Simpan</button>
                        </form>

                        <!-- Menampilkan data hak akses yang sudah ada -->
                        <h5>Daftar Hak Akses</h5>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>status</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($hak_akses as $akses): ?>
                                    <tr>
                                        <td><?= $akses->username ?></td>
                                        <td><?= $akses->status ?></td>
                                        <td><?= $akses->status ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
