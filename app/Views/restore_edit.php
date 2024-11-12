<section class="section">
                    <div class="row" id="basic-table">
                        <div class="col-12 col-md-10">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">RESTORE EDIT</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <!-- Table with outer spacing -->
                                            <table class="table table-lg">
                                                <thead>
                                                    <tr>
                                                        <th>NO</th>
                                                        <th>Username</th>
                                                        <th>NIK</th>
                                                        <th>Email</th>
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
                <td><?= $key->username ?></td>
                <td><?= $key->nik ?></td>
                <td><?= $key->email ?></td>
                <td><?= $key->status ?></td>
            <td>
                <a href="<?= base_url('home/aksi_restore_edit_user/' . $key->id_user) ?>">
                    <button class="btn btn-secondary">
                      <i class="now-ui-icons ui-1_check"></i> Restore
                    </button>
                  </a>
                  <a href="<?= base_url('home/hapus_user_permanent/' . $key->id_user) ?>">
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
                    </div>
                </section>