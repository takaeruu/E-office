<section class="section">
    <div class="row" id="documents-table">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title fw-bold">Folder: <?= $folder['nama_folder'] ?></h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <?php if (!empty($documents)): ?>
                            <?php if (in_array($id_jenis_surat, [1, 2])): // Tabel untuk surat masuk, surat keluar ?>
                                <table class="table table-lg">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>Nomor Surat</th>
                                            <th>Perihal</th>
                                            <th>Lampiran</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $no = 1; ?>
                                        <?php foreach ($documents as $key): ?>
                                            <tr>
                                                <td><?= $no++ ?></td>
                                                <td><?= $key->nomor_surat ?></td>
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

                                                
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php elseif ($id_jenis_surat == 4): // Tabel untuk surat keterlambatan ?>
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
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $no = 1; ?>
                                        <?php foreach ($documents as $key): ?>
                                            <tr>
                                                <td><?= $no++ ?></td>
                                                <td><?= $key->nama ?></td>
                                                <td><?= $key->nik ?></td>
                                                <td><?= $key->tanggal ?></td>
                                                <td><?= $key->jam_kedatangan ?></td>
                                                <td><?= $key->jumlah_keterlambatan ?></td>
                                                <td><?= $key->alasan ?></td>
                                                
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php elseif ($id_jenis_surat == 3): // Tabel untuk pengajuan cuti ?>
                                <table class="table table-lg">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>Nama</th>
                                            <th>NIK</th>
                                            <th>Jenis Cuti</th>
                                            <th>Tanggal Mulai Cuti</th>
                                            <th>Tanggal Terakhir Cuti</th>
                                            <th>Total Hari Cuti</th>
                                            <th>Tanggal Kembali Kerja</th>
                                            <th>Yang Ambil Ahli</th>
                                            <th>Alamat Cuti</th>
                                            <th>Alasan Cuti</th>


                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $no = 1; ?>
                                        <?php foreach ($documents as $key): ?>
                                            <tr>
                                                <td><?= $no++ ?></td>
                                                <td><?= $key->nama ?></td>
                                                <td><?= $key->nik ?></td>
                                                <td><?= $key->jenis_pengajuan ?></td>
                                                <td><?= $key->tanggal_mulai_cuti ?></td>
                                                <td><?= $key->tanggal_terakhir_cuti ?></td>
                                                <td><?= $key->total_hari_cuti ?></td>
                                                <td><?= $key->tanggal_kembali_kerja ?></td>
                                                <td><?= $key->ambil_ahli ?></td>
                                                <td><?= $key->alamat_cuti ?></td>
                                                <td><?= $key->alasan_cuti ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php else: // Default jika id_jenis_surat lain ?>
                                <p class="text-center">Tabel tidak tersedia untuk jenis surat ini.</p>
                            <?php endif; ?>
                        <?php else: ?>
                            <p class="text-center">Tidak ada dokumen tersedia untuk jenis surat ini.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
