#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# naive solution
# https://replit.com/@bgando/linear-search-exercise-prompt
# TASK: Implement linear search.
function linearSearch(list::Vector{T}, item::T)::Integer where {T<:Number}
	index = -1
	for i ∈ eachindex(list)
		if list[i] == item
			index = i
		end
	end
	return index
end

@assert linearSearch([2,6,7,90,103], 90) == 4

# “divide & conquer” solution
# https://replit.com/@bgando/binary-search-exercise-prompt
# TASK: Implement binary search
function binarySearch(list::Vector{T}, item::T)::Integer where {T<:Number}
	lo, hi = 1, length(list)
	while lo < hi
		guess = fld(hi + lo, 2)
		if list[guess] == item
			return guess
		elseif list[guess] > item
			hi = guess - 1
		else
			lo = guess + 1
		end
	end
	return -1
end

@assert binarySearch([2,6,7,90,103], 90) == 4
