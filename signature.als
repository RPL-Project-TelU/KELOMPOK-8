// Signature
sig AccPengguna {}

sig User {
  nama_pelanggan: String,
  username_pelanggan: String,
  password_pelanggan: String,
}

sig Halaman_reservasi_PC {
  nomorPC: Int,
  spekPC: AccPengguna
}

sig Pembayaran {
  jenis_bank: AccPengguna,
  nominal: Int
}

sig PC {
  infoPC: Halaman_reservasi_PC
}

sig Resi {
  nominal: Int,
  buktiBeli: Pembayaran,
}
