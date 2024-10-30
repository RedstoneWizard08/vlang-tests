module util

import log

pub fn make_logger() log.Log {
	mut logger := log.Log{}

	logger.set_custom_time_format('')
	logger.set_level(.debug)

	return logger
}
