#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/recursive-loop-wrapper

function wrapperFnLoop(start::Integer, endd::Integer)::Nothing
	println("wrapperFnLoop from $start until $endd")
	function recurse(i::Integer)
		println("hitting index $i")
		if i < endd
			recurse(i + 1)
		end
	end
	recurse(start)
end

wrapperFnLoop(1, 5)

function MemoFnLoop(i::Integer, endd::Integer)::Nothing
	println("MemoFnLoop from $i until $endd")
	if i < endd
		MemoFnLoop(i + 1, endd)
	end
end

MemoFnLoop(1, 6)
