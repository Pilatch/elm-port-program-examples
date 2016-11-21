# Input Mangler

The input mangler takes input from the user, mangles that String and send it back to the user. Elm does the mangling, while NodeJS handles the input from, and output to the user.

To see it in action:

    $ ./run.sh

If you're on Windows, read that run.sh file, and manually execute those commands.

## What to expect

    ./run.sh
    Success! Compiled 1 module.
    Successfully generated elm.js
    Ready to mangle text you enter. Press Ctrl + C to stop.
    The quick brown lizard ate my jelly doughnut.
    "/uvoihvpe!zmmfk!zn!fub!esb{jm!oxpsc!ldjvr!fiU"

    Afterwards I was both hungry and perturbed.
    "0fgdtwvtgr\"fpc"{tipwj"jvqd"ucy"K"uftcytgvhC"

    If I ever see that lizard again, I'm eating his tail with hot sauce.
    "1hfxdv#wrk#kwlz#oldw#vlk#jqlwdh#p*L#/qldjd#gud}lo#wdkw#hhv#uhyh#L#iL"

    Not really.
    "2}ppeiv$xsR"