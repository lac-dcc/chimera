// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Use the default timescale.
module top;
  initial begin
    $printtimescale(top);
    $printtimescale(other);
    $printtimescale(other2);
  end
endmodule

`timescale 1ms/1ms

// Use the given timescale.
module other;
endmodule

`resetall

// Use the default timescale.
module other2;
endmodule
