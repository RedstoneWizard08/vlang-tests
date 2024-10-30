module types

pub enum OrbitalKindBase {
	s = 1
	p = 3
	d = 5
	f = 7
}

pub struct ElectronInfoBase {
pub:
	index  int
	kind   OrbitalKindBase
	filled int
}
