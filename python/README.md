# LeetCode Python

Same idea as the sql folder, just python problems instead.

| # | Problem | Difficulty |
|---|---|---|
| 1 | Two Sum | Easy |
| 242 | Valid Anagram | Easy |

1 has two files - did the brute force nested loop version first, then the optimized one. keeping both since the progression itself is worth seeing.

## stuff i want to remember

1 - `1_two_sum_brute_force.py` is the nested loop version, O(n^2). `1_two_sum.py` is the optimized one using a dictionary - for every number, calculate what its "complement" needs to be (target - current number), then check if that complement is already sitting in the dictionary from a previous step. check the complement BEFORE adding the current number into the dictionary, otherwise you could accidentally match a number with itself.

242 - built two dictionaries, one counting letters in each string, then just compared the two dictionaries with ==. python checks dict equality properly, both keys and values, not just length. saw the Counter shortcut afterward (Counter(s) == Counter(t) does the same thing in one line) but made sure i could rebuild the manual dictionary version from memory first before trusting i actually understood it.
