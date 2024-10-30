module orbit

import types { ElectronInfoBase, OrbitalKindBase }

pub type OrbitalKind = OrbitalKindBase

pub fn (kind OrbitalKind) next(mut cur &int) OrbitalKind {
	match kind {
		.s {
			if cur == 1 {
				cur += 1
				return .s
			}
			return .p
		}
		.p {
			if cur == 2 {
				cur += 1
				return .s
			}
			return .d
		}
		.d {
			if cur == 3 {
				cur += 1
				return .s
			}
			return .f
		}
		.f {
			cur += 1
			return .s
		}
		else {
			panic("Something isn't right... Kind: ${kind}")
		}
	}
}

pub fn (kind OrbitalKind) slots() int {
	match kind {
		.s {
			return 1
		}
		.p {
			return 3
		}
		.d {
			return 5
		}
		.f {
			return 7
		}
		else {
			panic("Something isn't right... Kind: ${kind}")
		}
	}
}

pub fn (kind OrbitalKind) try_grab(cur int, mut num &int) ElectronInfoBase {
	mut value := 0

	for _ in 0 .. (kind.slots() * 2) {
		if num >= 1 {
			value += 1
			num -= 1
		}
	}

	return ElectronInfoBase{
		index:  cur
		kind:   kind
		filled: value
	}
}
