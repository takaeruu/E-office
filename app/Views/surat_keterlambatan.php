<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">SURAT KETERLAMBATAN</h4>
                </div>
                <a class="nav-link text-Headings my-2" href="<?= base_url('home/t_surat_keterlambatan') ?>">
                    <span class="btn btn-warning">Tambah Surat Keterlambatan</span>
                </a>
                <div class="card-content">
                    <div class="card-body">
                        <!-- Table with outer spacing -->
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Nama</th>
                                    <th>NIK</th>
                                    <th>Tanggal</th>
                                    <th>Jam Kedatangan</th>
                                    <th>Jumlah Keterlambatan</th>
                                    <th>Alasan</th>
                                    <th>Status</th>
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
            <td><?= $key->nama ?></td>
            <td><?= $key->nik ?></td>
            <td><?= $key->tanggal ?></td>
            <td><?= $key->jam_kedatangan ?></td>
            <td><?= $key->jumlah_keterlambatan ?></td>
            <td><?= $key->alasan ?></td>
            <td><?= $key->status ?></td>
            <td>
    <a href="<?= base_url('home/edit_surat_keterlambatan/' . $key->id_surat_keterlambatan) ?>">
        <button class="btn btn-secondary">Edit</button>
    </a>
    <a href="<?= base_url('home/hapus_surat_keterlambatan/' . $key->id_surat_keterlambatan) ?>">
        <button class="btn btn-danger">Delete</button>
    </a>
    <?php 
    // Display 'Setuju' and 'Tolak' buttons only for 'admin', 'kepsek', or 'hrd'
    if (in_array(session()->get('status'), ['admin', 'kepsek', 'hrd'])): 
        // Check user role and set the appropriate approval link
        if (session()->get('status') === 'kepsek' || 'admin'): ?>
            <a href="<?= base_url('home/setuju_kepsek_surat_keterlambatan/' . $key->id_surat_keterlambatan) ?>">
                <button class="btn btn-success">Setuju</button>
            </a>
        <?php elseif (session()->get('status') === 'hrd' || 'admin'): ?>
            <a href="<?= base_url('home/setuju_surat_keterlambatan/' . $key->id_surat_keterlambatan) ?>">
                <button class="btn btn-success">Setuju</button>
            </a>
        <?php endif; ?>
        <a href="<?= base_url('home/tolak_surat_keterlambatan/' . $key->id_surat_keterlambatan) ?>">
            <button class="btn btn-warning">Tolak</button>
        </a>
    <?php endif; ?>
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
