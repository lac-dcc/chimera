// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1 ps / 1 ps

module example;
    time    delay;
    initial begin
//      delay = 64'bx;
        $display( "%T %b", $time, delay );
//      #(64'bx)
        #delay
        $display( "%T", $time );
    end
endmodule
