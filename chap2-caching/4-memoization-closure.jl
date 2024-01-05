#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/memoize-exercise-1-solution

#=
Task 3: Clean up your global scope by moving your cache inside your function.
protip: Use a closure to return a function that you can call later.
=#
function memoizedClosureTimes10()::Function
	cache = Dict{Number, Number}()

	function memoTimes10(n::Number)::Number
		if haskey(cache, n)
			println("Fetching from cache: $n")
		else
			println("Calcuting result")
			cache[n] = 10 * n
		end
		return cache[n]
	end

	return memoTimes10
end

const memoClosureTimes10 = memoizedClosureTimes10()
# Saves the return statement of memoizedClosureTimes10 NOT the cache obj

@assert memoClosureTimes10(9) == 90  # calculated
@assert memoClosureTimes10(9) == 90  # cached

# bonus: generalized version
function memoizedClosureTimesM(m::Number)::Function
	cache = Dict{Number, Number}()

	function memoTimesM(n::Number)::Number
		if !haskey(cache, n)
			cache[n] = m * n
		end
		return cache[n]
	end

	return memoTimesM
end
