sig AccPengguna{}
sig EncryptedText {}



//signature
sig User {
  nama_pelanggan: AccPengguna,
  username_pelanggan: AccPengguna,
  password_pelanggan: EncryptedText,
  verifyUser: some Pembayaran
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


run {} for 4
