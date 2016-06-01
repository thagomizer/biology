# Even though a binary tree can include nodes having degree 2, an
# unrooted binary tree is defined more specifically: all internal
# nodes have degree 3. In turn, a rooted binary tree is such that only
# the root has degree 2 (all other internal nodes have degree 3).

# Given:
# A positive integer n (3 <= n <= 10000).

# Return:
# The number of internal nodes of any unrooted binary tree having n leaves.

# Hint:
# In solving "Completing a Tree", you may have formed the conjecture
# that a graph with no cycles and n nodes is a tree precisely when it
# has n - 1 edges. This is indeed a theorem of graph theory.

n = File.read("inod.txt").strip.to_i

puts n - 2
