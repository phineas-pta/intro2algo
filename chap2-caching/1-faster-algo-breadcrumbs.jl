#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

"""function that determines if every element in array is unique"""

# https://replit.com/@bgando/isUnique-example-loops
# bad: 𝒪(n²)
function isUnique1(arr::Vector{<:Number})::Bool
	res = true
	for i ∈ eachindex(arr), j ∈ eachindex(arr)
		if i ≠ j && arr[i] == arr[j]
			res = false
		end
	end
	return res
end

@assert isUnique1([1, 2, 3])
@assert !isUnique1([1, 1, 3])

# https://replit.com/@bgando/isUnique-example-breadcrumbs
# better: 𝒪(n) by caching (save objects already seen)
function isUnique2(arr::Vector{<:Number})::Bool
	breadcrumbs = Dict{Int, Bool}()  # cache
	res = true
	for i ∈ eachindex(arr)
		tmp = arr[i]
		if get(breadcrumbs, tmp, false)
			res = false
		else
			breadcrumbs[tmp] = true
		end
	end
	return res
end

@assert isUnique2([1, 2, 3])
@assert !isUnique2([1, 1, 3])
