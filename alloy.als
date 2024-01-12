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



// Predicates
pred NonEmptyUserCredentials {
  all u: User | u.nama_pelanggan != none and u.username_pelanggan != none and u.password_pelanggan != none
}

pred PositivePaymentNominal {
  all p: Pembayaran | p.nominal > 0
}

pred UniquePCNumber {
  all pc1, pc2: Halaman_reservasi_PC | pc1 != pc2 => pc1.nomorPC != pc2.nomorPC
}

// Assertions
assert UserHasReservation {
  all u: User | some r: u.verifyUser | r in Halaman_reservasi_PC
}

assert ReceiptLinkedToPayment {
  all r: Resi | one p: Pembayaran | r.pembayaran = p
}

// run
run NonEmptyUserCredentials for 2
run PositivePaymentNominal for 2
run UniquePCNumber for 2

//check
check UserHasReservation for 2

