# Reverse the sentence's word order

sentence = "Humpty Dumpty sat on a wall."

sentence.split(/\W/).reverse!.join(' ') << "."