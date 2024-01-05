#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/memoize-exercise-1-solution

#=
Task 4: Make your memo function generic and accept the times10 function as a callback rather than defining the n * 10 logic inside the if/else or pulling it in from the global scope.
protip: Take advantage of the fact that parameters are saved in the closure as well, just like the cache from the previous example.
=#
function memoize(callback::Function)::Function
	cache = Dict{Number, Number}()

	function memoCallback(n::Number)::Number
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

times10(n::Number) = 10*n
const memoClosureTimes10 = memoize(times10)
# returned function from memoize

@assert memoClosureTimes10(9) == 90  # calculated
@assert memoClosureTimes10(9) == 90  # cached
