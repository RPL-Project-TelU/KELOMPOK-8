sig AccPengguna{}


//signature
sig User {
  nama_pelanggan: AccPengguna,
  username_pelanggan: AccPengguna,
  password_pelanggan: AccPengguna,
  verifyUser: some Halaman_reservasi_PC
}

sig Halaman_reservasi_PC {
  nomorPC: Int,
  spekPC: AccPengguna
}

sig Pembayaran {
  jenis_bank: AccPengguna,
  nominal: Int
}

sig Resi {
  nominal: Int,
  buktiBeli: AccPengguna,
  pembayaran: Pembayaran
}

