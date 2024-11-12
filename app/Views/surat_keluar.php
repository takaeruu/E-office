<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">SURAT KELUAR</h4>
                </div>
                <a class="nav-link text-Headings my-2" href="<?= base_url('home/t_surat_keluar') ?>">
                    <span class="btn btn-warning">Tambah Surat</span>
                </a>
                <div class="card-content">
                    <div class="card-body">
                        <!-- Table with outer spacing -->
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Nomor Surat</th>
                                    <th>Jenis Surat</th>
                                    <th>Tanggal Kirim</th>
                                    <th>Penerima</th>
                                    <th>Perihal</th>
                                    <th>Lampiran</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                foreach ($oke as $key) {
                                ?>
                                    <tr>
                                        <td><?= $no++ ?></td>
                                        <td><?= $key->nomor_surat ?></td>
                                        <td><?= $key->jenis_surat?></td>
                                        <td><?= $key->tanggal_kirim ?></td>
                                        <td><?= $key->penerima ?></td>
                                        <td><?= $key->perihal ?></td>
                                        <td>
                                            <?php if (!empty($key->lampiran)): ?>
                                                <!-- Jika ada file, tampilkan link untuk melihat atau mengunduh -->
                                                <a href="<?= base_url('uploads/' . $key->lampiran) ?>" target="_blank">
                                                    <button class="btn btn-primary">Lihat Lampiran</button>
                                                </a>
                                            <?php else: ?>
                                                <span>No Lampiran</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <a href="<?= base_url('home/edit_surat_keluar/' . $key->id_surat_keluar) ?>">
                                                <button class="btn btn-secondary">
                                                    <i class="now-ui-icons ui-1_check"></i> Edit
                                                </button>
                                            </a>
                                            <a href="<?= base_url('home/hapus_surat_keluar/' . $key->id_surat_keluar) ?>">
                                                <button class="btn btn-danger">
                                                    <i class="now-ui-icons ui-1_check"></i> Delete
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
