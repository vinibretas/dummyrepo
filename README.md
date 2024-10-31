# essay_writter

## Feature goals
These features are the basic ones, that will have to be implemented

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
  1. What to do with that input file
    - Provide to the ai call, as system instructions
    - Tell it to analyse the writting pattern
    - Maybe pass it to another assistant to highlight the writting patterns
      and only then sending it to the main assistant

1. Generate the final text in a PDF file
  - I should be with a specific font and size so it tries to match the amount of 
    lines it will have when manually written
  - Current tested size and font is: Liberation Serif 16pt
  - Font and size should be easily changeable later

1. Make script run in the background of server of laptop

## Other features
These features will have its feasability evaluated later

1. Automatically read the email sent by the teacher
  1. Parse its contents with AI
    - TR#
    - Due date
    - Source (book pdf, url)
    - Theme and/or pages of book
  1. If the content is a video, send some alert to the user to either analyse it with sider
     or maybe implement video support later

1. Notify the user that the input (or email from teacher) has been successfully parsed. Sending to
   the user via email, information and relevant attachments (pdfs generated etc)

1. Logging






