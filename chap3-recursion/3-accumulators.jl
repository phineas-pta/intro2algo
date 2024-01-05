#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/recursion-accumulator

function joinElementsRecurse(array::Vector{String}, joinString::String)::String
	function recurse(index::Integer, resultSoFar::String)
		resultSoFar *= array[index]
		if index == length(array)  # base case
			return resultSoFar
		else  # recurse
			return recurse(index + 1, resultSoFar * joinString)
		end
	end
	return recurse(1, "")
end

@assert joinElementsRecurse(["s", "cr", "t cod", " :) :)"], "e") == "secret code :) :)"

# Task: rewrite function so that it uses a loop rather than recursion
function joinElementsLoop(array::Vector{String}, joinString::String)::String
	resultSoFar = ""
	for i ∈ array
		resultSoFar *= i * joinString
	end
	return chop(resultSoFar, tail=length(joinString))  # must remove extra
end

@assert joinElementsLoop(["s", "cr", "t cod", " :) :)"], "e") == "secret code :) :)"
