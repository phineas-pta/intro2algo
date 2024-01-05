#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/mergesort-exercise-solution
# TASK: Implement mergesort!

"""Split the array into halves and merge them recursively"""
function mergeSort(array::Vector{T})::Vector{T} where {T<:Number}
	arr = copy(array)
	N = length(arr)

	# return once we hit an array with a single item
	if N == 1 return arr end

	middle = fld(N, 2)
	sortedLeft = mergeSort(arr[begin:middle])  # use `begin:(middle-1)` cause 0-length array
	sortedRight = mergeSort(arr[(middle+1):end])
	return mergeSubArrays(sortedLeft, sortedRight)
end

# avoid override Base.merge()
function mergeSubArrays(left::Vector{T}, right::Vector{T})::Vector{T} where {T<:Number}
	res = T[]
	indexLeft = indexRight = 1
	while indexLeft ≤ length(left) && indexRight ≤ length(right)
		if left[indexLeft] < right[indexRight]
			push!(res, left[indexLeft])
			indexLeft += 1
		else
			push!(res, right[indexRight])
			indexRight += 1
		end
	end
	return [res; left[indexLeft:end]; right[indexRight:end]]
end

const list = [2, 5, 1, 3, 7, 2, 3, 8, 6, 3]
@assert all(mergeSort(list) .== [1, 2, 2, 3, 3, 3, 5, 6, 7, 8])
