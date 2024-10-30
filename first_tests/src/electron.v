module electron

import types { ElectronInfoBase }

pub type ElectronInfo = ElectronInfoBase

pub fn (info ElectronInfo) format() string {
	return '${info.index}${info.kind}${info.filled}'
}
