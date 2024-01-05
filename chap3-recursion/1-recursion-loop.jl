#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/recursive-loop-simple
function loopNTimes(n::Integer)
	println("n = $n")
	if n ≤ 1  # base case
		return nothing
	else  # recurse
		return loopNTimes(n-1)
	end
end

loopNTimes(3)  # go from 3 to 1

# https://replit.com/@bgando/factorial-iterative-example
function computeFactorialLoop(num::Integer)::Integer
	res = 1
	for i ∈ 2:num
		res *= i
	end
	return res
end

@assert computeFactorialLoop(5) == 120

# https://replit.com/@bgando/factorial-recursion
function computeFactorialRecurse(num::Integer)::Integer
	if num == 1  # base case
		return 1
	else  # recurse
		return num * computeFactorialRecurse(num-1)
	end
end

@assert computeFactorialRecurse(5) == 120

# https://replit.com/@bgando/recursion-to-loop-example
function logNumbersRecursively(start::Integer, endd::Integer)
	println("recursively looping from $start until $endd")
	function recurse(i::Integer)
		println("hitting index $i")
		if i < endd
			recurse(i + 1)
		end
	end
	recurse(start)
end

logNumbersRecursively(1, 3)  # go from 1 to 3
