// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  parameter wid = 9;

  reg [31:0] rpass;
  reg [31:0] rfail;

  initial begin
    rpass = {(wid-8){ 8'b0}}; // This will pass
    rfail = {(wid-16){8'b0}}; // and this will fail.
  end
endmodule
