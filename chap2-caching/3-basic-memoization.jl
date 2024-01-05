#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/memoize-exercise-1-solution

# Task 1: Write a function, times10, that takes an argument, n, and multiples n times 10
times10(n::Number) = 10*n

@assert times10(9) == 90

#=
Task 2: Use an object to cache the results of your times10 function.
- protip 1: Create a function that checks if the value for n has been calculated before.
- protip 2: If the value for n has not been calculated, calculate and then save the result in the cache object.
=#
const cache = Dict{Number, Number}()
function memoTimes10(n::Number)::Number
	if haskey(cache, n)
		println("Fetching from cache: $n")
		return cache[n]
	else
		println("Calcuting result")
		cache[n] = res = times10(n)
		return res
	end
end

@assert memoTimes10(9) == 90  # calculated
@assert memoTimes10(9) == 90  # cached
