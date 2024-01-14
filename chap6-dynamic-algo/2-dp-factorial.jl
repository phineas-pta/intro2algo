#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/dp-factorial-solution
"""dead link, no mirror found"""
# implement factorial in dynamic programming

# replace with Fibonacci (materials from GeeksForGreeks)
# - https://www.geeksforgeeks.org/overlapping-subproblems-property-in-dynamic-programming-dp-1/
# - https://www.geeksforgeeks.org/optimal-substructure-property-in-dynamic-programming-dp-2/

"""naive solution: iteration: time 𝒪(n) - space 𝒪(1)"""
function fib_iter(n::Integer)::Integer
	a, b = 0, 1
	if n < 0
		error("oh no")
	elseif n == 0
		return a
	elseif n == 1
		return b
	else
		for _ ∈ 2:n
			a, b = b, a+b
		end
		return b
	end
end

@assert fib_iter(10) == 55

"""naive solution: recursion: time 𝒪(2ⁿ) - space 𝒪(1)"""
function fib_recurse(n::Integer)::Integer
	if n < 0
		error("oh no")
	elseif n ∈ [0, 1]
		return n
	else
		return fib_recurse(n-1) + fib_recurse(n-2)
	end
end

@assert fib_recurse(7) == 13

"""Memoization (Top Down): time & space both 𝒪(n)"""
function fib_memo(n::Integer)::Integer
	if n < 0 error("oh no") end
	lookup_fib_memo = Dict{Integer, Integer}(0 => 0, 1 => 1)
	function recurse(k::Integer)::Integer
		if !haskey(lookup_fib_memo, k)
			lookup_fib_memo[k] = recurse(k-1) + recurse(k-2)
		end
		return lookup_fib_memo[k]
	end
	return recurse(n)
end

@assert fib_memo(40) == 102334155

"""Tabulation (Bottom Up): time & space both 𝒪(n)"""
function fib_tab(n::Integer)::Integer
	if n < 0 error("oh no") end
	table_fib_tab = [0; 1; fill(0, n-1)]
	for i ∈ 1:(n-1)
		table_fib_tab[i+2] = table_fib_tab[i+1] + table_fib_tab[i]
	end
	return table_fib_tab[n+1]
end

@assert fib_tab(9) == 34
