<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header text-center">
                    <h4 class="card-title fw-bold fs-1">DOKUMEN</h4>
                </div>

                <div class="card-content">
                    <div class="card-body">
                        <!-- Button to open create folder modal -->
                        <button type="button" class="btn btn-warning mb-3" data-bs-toggle="modal" data-bs-target="#createFolderModal">
                            Buat Folder Baru
                        </button>

                        <hr>

                        <!-- Display folders -->
                        <div class="row mt-3">
                            <?php foreach ($folders as $folder): ?>
                                <div class="col-md-4 mb-4">
                                    <!-- Card to show folder info with a button for viewing folder -->
                                    <div class="card bg-light shadow-sm border-primary">
                                        <div class="card-body text-center">
                                            <!-- Folder Icon and Name -->
                                            <div class="d-flex justify-content-center align-items-center">
                                                <i class="fa fa-folder fs-1 me-3"></i>
                                                <h5 class="card-title mb-0"><?= htmlspecialchars($folder['nama_folder']) ?></h5>
                                            </div>
                                            <!-- View Folder Button -->
                                            <a href="<?= base_url('home/view_folder/' . $folder['id_jenis_surat']) ?>" class="btn btn-success mt-2">
                                                Lihat Folder
                                            </a>

                                            <!-- Set Access Button (optional) -->
                                            <?php if ($_SESSION['status'] === 'admin'): ?>
    <!-- Set Access Button (tampil hanya untuk admin) -->
    <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#accessModal<?= $folder['id_folder'] ?>">
        Set Hak Akses
    </button>
<?php endif; ?>


                                            <!-- Dropdown Menu for Edit and Delete -->
                                            <div class="btn-group mt-2">
                                                <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                    &#x2026;
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                    <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#editFolderModal<?= $folder['id_folder'] ?>">Edit</a>

                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item text-danger" href="#" data-bs-toggle="modal" data-bs-target="#deleteFolderModal<?= $folder['id_folder'] ?>">Delete</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal for Set Hak Akses -->
                                <div class="modal fade" id="accessModal<?= $folder['id_folder'] ?>" tabindex="-1" aria-labelledby="accessModalLabel<?= $folder['id_folder'] ?>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="accessModalLabel<?= $folder['id_folder'] ?>">Hak Akses - <?= htmlspecialchars($folder['nama_folder']) ?></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Form for Updating Access Levels -->
                                                <form action="<?= base_url('home/update_hak_akses_dokumen/' . $folder['id_folder']) ?>" method="post">
                                                    <!-- Checkbox access options -->
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="admin" 
                                                                <?php if (isset($folder['access_levels']) && in_array('admin', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            Admin
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="hrd" 
                                                                <?php if (isset($folder['access_levels']) && in_array('hrd', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            HRD
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="yayasan" 
                                                                <?php if (isset($folder['access_levels']) && in_array('yayasan', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            Yayasan
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="kepsek" 
                                                                <?php if (isset($folder['access_levels']) && in_array('kepsek', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            Kepsek
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="wakepsek" 
                                                                <?php if (isset($folder['access_levels']) && in_array('wakepsek', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            Wakepsek
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>
                                                            <input type="checkbox" name="access_level[]" value="guru" 
                                                                <?php if (isset($folder['access_levels']) && in_array('guru', explode(',', $folder['access_levels']))) echo 'checked'; ?>>
                                                            Guru
                                                        </label>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Modal for Creating New Folder -->
<div class="modal fade" id="createFolderModal" tabindex="-1" aria-labelledby="createFolderModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createFolderModalLabel">Buat Folder Baru</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('home/tambah_folder') ?>" method="post">
                    <div class="mb-3">
                        <label for="folder_name" class="form-label">Nama Folder:</label>
                        <input type="text" class="form-control" id="folder_name" name="folder_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="jenis_surat" class="form-label">Jenis Surat:</label>
                        <select class="form-control" id="jenis_surat" name="jenis_surat">
                            <?php foreach ($yoga as $item): ?>
                                <option value="<?= $item->id_jenis_surat ?>"><?= $item->jenis_surat ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


                                <div class="modal fade" id="editFolderModal<?= $folder['id_folder'] ?>" tabindex="-1" aria-labelledby="editFolderModalLabel<?= $folder['id_folder'] ?>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editFolderModalLabel<?= $folder['id_folder'] ?>">Edit Folder - <?= htmlspecialchars($folder['nama_folder']) ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form for Editing Folder -->
                <form action="<?= base_url('home/aksi_e_folder/' . $folder['id_folder']) ?>" method="post">
                    <div class="mb-3">
                        <label for="folder_name_edit" class="form-label">Nama Folder:</label>
                        <input type="text" class="form-control" id="folder_name_edit" name="folder_name" value="<?= htmlspecialchars($folder['nama_folder']) ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="jenis_surat_edit" class="form-label">Jenis Surat:</label>
                        <select class="form-control" id="jenis_surat_edit" name="jenis_surat">
                            <?php foreach ($yoga as $item): ?>
                                <option value="<?= $item->id_jenis_surat ?>" <?= ($item->id_jenis_surat == $folder['id_jenis_surat']) ? 'selected' : '' ?>>
                                    <?= $item->jenis_surat ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Delete Confirmation -->
<div class="modal fade" id="deleteFolderModal<?= $folder['id_folder'] ?>" tabindex="-1" aria-labelledby="deleteFolderModalLabel<?= $folder['id_folder'] ?>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteFolderModalLabel<?= $folder['id_folder'] ?>">Delete Folder - <?= htmlspecialchars($folder['nama_folder']) ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete the folder "<strong><?= htmlspecialchars($folder['nama_folder']) ?></strong>"? This action cannot be undone.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="<?= base_url('home/hapus_folder/' . $folder['id_folder']) ?>" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

                                <!-- Modal for Delete Confirmation -->
                                <div class="modal fade" id="deleteFolderModal<?= $folder['id_folder'] ?>" tabindex="-1" aria-labelledby="deleteFolderModalLabel<?= $folder['id_folder'] ?>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteFolderModalLabel<?= $folder['id_folder'] ?>">Delete Folder - <?= htmlspecialchars($folder['nama_folder']) ?></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to delete the folder "<strong><?= htmlspecialchars($folder['nama_folder']) ?></strong>"? This action cannot be undone.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <a href="<?= base_url('home/hapus_folder/' . $folder['id_folder']) ?>" class="btn btn-danger">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
