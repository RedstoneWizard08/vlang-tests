module main

import os
import cli
import arrays
import electron { ElectronInfo }
import orbit
import util { make_logger }

fn run(cmd cli.Command) ! {
	mut logger := make_logger()

	if cmd.args.len < 1 {
		logger.error('Missing argument: number')
		exit(1)
	}

	num_str := cmd.args[0]

	if !num_str.is_int() {
		logger.error('Value "${num_str}" is not an integer!')
		exit(1)
	}

	mut num := num_str.int()
	mut parts := []string{}
	mut cur := 1
	mut kind := orbit.OrbitalKind.s

	for {
		if num <= 0 {
			break
		}

		parts = arrays.append(parts, [ElectronInfo(kind.try_grab(cur, mut &num)).format()])
		kind = kind.next(mut &cur)
	}

	println(parts)
}

pub fn main() {
	mut app := cli.Command{
		name:        'ecconv'
		description: 'Converts numbers into electron configurations!'
		execute:     run
		usage:       '<number>'
	}

	app.setup()
	app.parse(os.args)
}
