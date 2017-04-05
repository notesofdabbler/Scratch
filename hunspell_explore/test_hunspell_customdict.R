#
# Attempt at using a custom dictionary
# Created a small custom dictionary called test.dic with 4 words
# Created an empty file call test.aff
#

# load library hunspell
library(hunspell)

# set test dictionary
test = dictionary("test.dic")
test

# when I run this command it shows FALSE FALSE where I would have expected TRUE TRUE
hunspell_check(c("methanol", "ethanol"), dict = test)

# when I run this I would have thought it would suggest methanol
hunspell_suggest(c("methnol","eth_alchohol"), dict = test)

sessionInfo()
