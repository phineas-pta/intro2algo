#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

"""unique sort: return sorted array without any duplicate value"""

# https://replit.com/@bgando/breadcrumbs-exercise-solution
function uniqSort(arr::Vector{T})::Vector{T} where {T<:Number}
	breadcrumbs = Dict{Int, Bool}()  # cache
	res = [arr[begin]]  # 1st element is not a duplicate
	for i ∈ 2:length(arr)
		tmp = arr[i]
		if !get(breadcrumbs, tmp, false)
			push!(res, tmp)
			breadcrumbs[tmp] = true
		end
	end
	return sort(res)
end

@assert all(uniqSort([4, 2, 2, 3, 2, 2, 2]) .== [2, 3, 4])
