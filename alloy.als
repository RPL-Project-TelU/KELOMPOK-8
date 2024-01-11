open util/boolean as Bool

// Signatures
sig User {
  nama_pelanggan: String,
  username_pelanggan: String,
  password_pelanggan: String,
  verifyUser: Bool
}

sig Halaman_reservasi_PC {
  nomorPC: Int,
  spekPC: String
}

sig Pembayaran {
  jenis_bank: String,
  nominal: Int
}

sig Resi {
  nominal: Int,
  buktiBeli: String,
  pembayaran: Pembayaran
}

// Facts
fact PaymentResiRelation {
  // Relasi antara pembayaran dan Resi
  Resi.pembayaran.nominal = Pembayaran.nominal
}

// Predicates
pred show {
  // Menunjukkan constraint yang relevan
  all r: Resi | r.nominal > 0
  all p: Pembayaran | p.nominal > 0
}

// System Signature
sig System {
  users: set User,
  reservations: set Halaman_reservasi_PC,
  payments: set Pembayaran,
  receipts: set Resi
}

// System Facts
fact PaymentReceiptRelation {
  // Pembayaran dan Resi terhubung melalui nominal
  all r: System.receipts | one p: System.payments | p.nominal = r.nominal
}

// Constraints
fact UniqueUser {
  // Constraint: Setiap User memiliki nama, username, dan password yang unik
  all u1, u2: User | u1 != u2 => (u1.nama_pelanggan != u2.nama_pelanggan) && (u1.username_pelanggan != u2.username_pelanggan) && (u1.password_pelanggan != u2.password_pelanggan)
}

fact UniquePCNumber {
  // Constraint: Setiap PC dalam reservasi memiliki nomor PC yang unik
  all pc1, pc2: Halaman_reservasi_PC | pc1 != pc2 => pc1.nomorPC != pc2.nomorPC
}

fact PositivePaymentNominal {
  // Constraint: Setiap pembayaran memiliki nominal positif
  all p: System.payments | p.nominal > 0
}

fact PositiveReceiptNominal {
  // Constraint: Setiap resi memiliki nominal positif
  all r: System.receipts | r.nominal > 0
}

fact PositivePCNumber {
  // Constraint: Setiap reservasi PC memiliki nomor PC positif
  all pc: System.reservations | pc.nomorPC > 0
}

fact NonEmptyBankType {
  // Constraint: Setiap pembayaran memiliki jenis bank yang tidak kosong
  all p: System.payments | some s: String | s in p.jenis_bank && s != ""
}

fact NonEmptyReceiptProof {
  // Constraint: Setiap resi memiliki bukti beli yang tidak kosong
  all r: System.receipts | some s: String | s in r.buktiBeli && s != ""
}

fact UserVerification {
  // Constraint: Setiap user harus terverifikasi atau belum terverifikasi
  all u: System.users | u.verifyUser = True or u.verifyUser = False
}




run show for 5 but 3 User, 3 Halaman_reservasi_PC, 3 Pembayaran, 3 Resi, 3 System
