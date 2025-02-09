// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * Verify that the various non-blocking assignments support a delay
 * that is greater than 32 bits. The top delays are in seconds and
 * the other delays are in ps. The second delays all require more
 * than 32 bits to work correctly. They will use the /d version.
 */

`timescale 1s/1s
module gt32b;
  real rlval;
  reg rval;
  reg aval[1:0];
  reg [7:0] psval;

  initial begin
    $timeformat(-12, 0, " ps", 16);
    #1;
    $display("dl:gt32b- %t", $realtime);
    rlval <= #1 1.0;
    rval <= #2 1'b1;
    aval[0] <= #3 1'b0;
    psval[1] <= #4 1'b1;
  end

  always @(rlval) begin
    $display("rl:gt32b- %t", $realtime);
  end

  always @(rval) begin
    $display("rg:gt32b- %t", $realtime);
  end

  always @(aval[0]) begin
    $display("ar:gt32b- %t", $realtime);
  end

  always @(psval) begin
    $display("ps:gt32b- %t", $realtime);
  end
endmodule

`timescale 1ps/1ps
module ls32b;
  real rlval;
  reg rval;
  reg aval[1:0];
  reg [7:0] psval;

  initial begin
    #1;
    $display("dl:ls32b- %t", $realtime);
    rlval <= #1 1.0;
    rval <= #2 1'b1;
    aval[0] <= #3 1'b0;
    psval[1] <= #4 1'b1;
  end

  always @(rlval) begin
    $display("rl:ls32b- %t", $realtime);
  end

  always @(rval) begin
    $display("rg:ls32b- %t", $realtime);
  end

  always @(aval[0]) begin
    $display("ar:ls32b- %t", $realtime);
  end

  always @(psval) begin
    $display("ps:ls32b- %t", $realtime);
  end
endmodule
