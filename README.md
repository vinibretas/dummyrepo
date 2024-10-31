# essay_writter

## Things it MUST do

1. Receive input on how the user writes to serve as template
    1. Possible implementation:
        - Have files with text written by the user
        - If there are more than 1 file, write alg to concatenate them
        - If no file is present, fallback to default instructions such as
            - Write an essay with x lines
        - Label the text with theme, what the user was trying to imply, etc.
            - That information should be inside the text file with something to indicate it
              like some characters to surround it etc
            - I could use AI to parse the files and see what the user meant, wanted to
              write when the file doesnt have that stored, or even if it does, do it
              anyway for better prompt
    2. What to do with that input
        - Provide to the ai call, as system instructions
