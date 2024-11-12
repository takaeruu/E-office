<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">SURAT MASUK</h4>
                </div>
                <a class="nav-link text-Headings my-2" href="<?= base_url('home/t_surat_masuk') ?>">
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
                                    <th>Tanggal Terima</th>
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
                                        <td><?= $key->jenis_surat ?></td>
                                        <td><?= $key->tanggal_terima ?></td>
                                        <td><?= $key->perihal ?></td>
                                        <td>
                                            <?php if (!empty($key->lampiran)): ?>
                                                <a href="<?= base_url('uploads/' . $key->lampiran) ?>" target="_blank">
                                                    <button class="btn btn-primary">Lihat Lampiran</button>
                                                </a>
                                            <?php else: ?>
                                                <span>No Lampiran</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <a href="<?= base_url('home/edit_surat_masuk/' . $key->id_surat_masuk) ?>">
                                                <button class="btn btn-secondary">
                                                    <i class="now-ui-icons ui-1_check"></i> Edit
                                                </button>
                                            </a>
                                            <a href="<?= base_url('home/hapus_surat_masuk/' . $key->id_surat_masuk) ?>">
                                                <button class="btn btn-danger">
                                                    <i class="now-ui-icons ui-1_check"></i> Delete
                                                </button>
                                            </a>

                                            <!-- Check if user is an admin before showing the Hak Akses button -->
                                            
                                        </td>
                                    </tr>

                                    <!-- Modal for Hak Akses -->
                                    
                                    </div>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
