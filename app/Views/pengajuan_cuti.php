<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Pengajuan Cuti</h4>
                </div>
                <a class="nav-link text-Headings my-2" href="<?= base_url('home/t_pengajuan_cuti') ?>">
                    <span class="btn btn-warning">Tambah Pengajuan Cuti</span>
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
                                    <th>Jenis Cuti</th>
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
            <td><?= $key->jenis_pengajuan ?></td>
            <td><?= $key->status ?></td>
            <td>
    <a href="<?= base_url('home/edit_pengajuan_cuti/' . $key->id_pengajuan_cuti) ?>">
        <button class="btn btn-warning">Edit / Detail</button>
    </a>
    <a href="<?= base_url('home/hapus_pengajuan_cuti/' . $key->id_pengajuan_cuti) ?>">
        <button class="btn btn-danger">Delete</button>
    </a>
    <a href="<?= base_url('home/setuju_pengajuan_cuti/' . $key->id_pengajuan_cuti) ?>">
        <button class="btn btn-success">Setuju</button>
    </a>
    <a href="<?= base_url('home/tolak_pengajuan_cuti/' . $key->id_pengajuan_cuti) ?>">
        <button class="btn btn-danger">Tolak</button>
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
