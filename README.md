# essay_writter

## Things it MUST do

<ol type="1">
1. Receive input on how the user writes to serve as template
      <ul>
        <li>Possible implementation:</li>
      </ul>
            <ul>
                <li>Have files with text written by the user</li>
                <li>If there are more than 1 file, write alg to concatenate them</li>
                <li>If no file is present, fallback to default instructions such as
                    <ul>
                        <li>Write an essay with x lines</li>
                    </ul>
                </li>
                <li>Label the text with theme, what the user was trying to imply, etc.
                    <ul>
                        <li>That information should be inside the text file with something to indicate it like some characters to surround it etc</li>
                        <li>I could use AI to parse the files and see what the user meant, wanted to write when the file doesn’t have that stored, or even if it does, do it anyway for better prompt</li>
                    </ul>
                </li>
            </ul>
        <li>What to do with that input file</li>
            <ul>
                <li>Provide to the AI call, as system instructions</li>
                <li>Tell it to analyze the writing pattern</li>
                <li>Maybe pass it to another assistant to highlight the writing patterns and only then send it to the main assistant</li>
            </ul>
  </ol>


