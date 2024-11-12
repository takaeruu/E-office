<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">TAMBAH SURAT KETERLAMBATAN</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form method="POST" action="<?= base_url('home/aksi_t_surat_keterlambatan') ?>" id="modalForm" enctype="multipart/form-data">
                        <div id="form-container">
                            <!-- Form Tambah Modal 1 (Form Pertama) -->
                            <div class="modal-form">
                                <div class="row">
                                    <div class="col-md-7 mb-3">
                                        <label for="nomor_surat">Nama:</label>
                                        <input type="text" class="form-control" name="nama" placeholder="Masukkan nomor surat" required>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="nomor_surat">NIK:</label>
                                        <input type="text" class="form-control" name="nik" placeholder="Masukkan nomor surat" required>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="tanggalkirim">Tanggal:</label>
                                        <input type="date" class="form-control" name="tanggal" required>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="jam_kedatangan">Jam Kedatangan:</label>
                                        <input type="time" class="form-control" id="jam_kedatangan" name="jam_kedatangan" required>
                                    </div>
                                    <div class="col-md-7 mb-3">
                                        <label for="jumlah_keterlambatan">Jumlah Keterlambatan:</label>
                                        <input type="text" class="form-control" id="jumlah_keterlambatan" name="jumlah_keterlambatan" readonly>
                                    </div>
                                    <div class="form-group col-md-7 mb-3">
                                        <label for="exampleFormControlTextarea1" class="form-label">Alasan:</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="alasan" rows="2" placeholder="Masukkan Alasan" required></textarea>
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

<script>
    document.getElementById('jam_kedatangan').addEventListener('input', function () {
        const defaultStartTime = '07:00';
        const arrivalTime = this.value;
        const [startHour, startMinute] = defaultStartTime.split(':').map(Number);
        const [arrivalHour, arrivalMinute] = arrivalTime.split(':').map(Number);
        
        const startInMinutes = startHour * 60 + startMinute;
        const arrivalInMinutes = arrivalHour * 60 + arrivalMinute;
        
        let delayMinutes = 0;
        let delayMessage = '';
        
        if (arrivalInMinutes > startInMinutes) {
            delayMinutes = arrivalInMinutes - startInMinutes;
            const delayHours = Math.floor(delayMinutes / 60);
            const remainingMinutes = delayMinutes % 60;
            
            if (delayHours > 0 && remainingMinutes > 0) {
                delayMessage = `Telat ${delayHours} jam ${remainingMinutes} menit`;
            } else if (delayHours > 0) {
                delayMessage = `Telat ${delayHours} jam`;
            } else {
                delayMessage = `Telat ${remainingMinutes} menit`;
            }
        }
        
        document.getElementById('jumlah_keterlambatan').value = delayMessage;
    });
</script>
