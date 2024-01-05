#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/memoize-factorial-solution

# Task 1: Without peeking, write your own recursive factorial method
# execute `memoize(computeFactorial)` doesn’t give cached result !!!
# proper way is below

# Task 2: Use your memo function from the previous exercise to memoize your factorial method
function memoize(callback::Function)::Function
	cache = Dict{Integer, Integer}()

	function memoCallback(n::Integer)::Integer
		if haskey(cache, n)
			println("Fetching from cache: $n")
		else
			println("Calcuting result")
			cache[n] = callback(n)
		end
		return cache[n]
	end

	return memoCallback
end

const factorial = memoize() do num
	if num == 1  # base case
		println("factorial done")
		return 1
	else  # recurse
		println("calculate $(num-1)!")
		return num * factorial(num-1)  # pass the memoized fx !!!
	end
end

@assert factorial(5) == 120  # calculated
@assert factorial(6) == 720  # calculated for 6-7 and cached for 5
