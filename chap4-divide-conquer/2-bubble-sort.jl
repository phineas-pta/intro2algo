#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/bubble-sort-exercise-solution
# TASK: Implement bubblesort!

# sample of arrays to sort
const arrayRandom = [9, 2, 5, 6, 4, 3, 7, 10, 1, 8]
const arrayOrdered = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
const arrayReversed = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

function bubbleSortBasic(array::Vector{T})::Vector{T} where {T<:Number}
	countOuter = countInner = countSwap = 0
	arr = copy(array)
	N = length(arr)
	for i ∈ 1:N
		countOuter += 1
		for j ∈ 2:N
			countInner += 1
			if arr[j-1] > arr[j]
				countSwap += 1
				arr[j-1], arr[j] = arr[j], arr[j-1]
			end
		end
	end
	println("outer: $countOuter, inner: $countInner, swap: $countSwap")
	return arr
end

println("        BASIC        ")
println("~~~ basic: arrayRandom ~~~")
@assert all(bubbleSortBasic(arrayRandom) .== arrayOrdered)
println("~~~ basic: arrayOrdered ~~~")
@assert all(bubbleSortBasic(arrayOrdered) .== arrayOrdered)
println("~~~ basic: arrayReversed ~~~")
@assert all(bubbleSortBasic(arrayReversed) .== arrayOrdered)

# optimized: will short-circuit out after it’s sorted
function bubbleSort(array::Vector{T})::Vector{T} where {T<:Number}
	countOuter = countInner = countSwap = 0
	arr = copy(array)
	N = length(arr)
	swapped = true
	while swapped
		countOuter += 1
		swapped = false
		for i ∈ 1:N
			countInner += 1
			if i < N && arr[i] > arr[i+1]
				countSwap += 1
				arr[i], arr[i+1] = arr[i+1], arr[i]
				swapped = true
			end
		end
	end
	println("outer: $countOuter, inner: $countInner, swap: $countSwap")
	return arr
end

println("        OPTIMIZED        ")
println("~~~ optimized: arrayRandom ~~~")
@assert all(bubbleSort(arrayRandom) .== arrayOrdered)
println("~~~ optimized: arrayOrdered ~~~")
@assert all(bubbleSort(arrayOrdered) .== arrayOrdered)
println("~~~ optimized: arrayReversed ~~~")
@assert all(bubbleSort(arrayReversed) .== arrayOrdered)
