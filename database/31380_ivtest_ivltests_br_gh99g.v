// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

wire [7:0] value1;
wire [7:0] value2;

assign value1[3:0] = 4'd2;

buf buffer[7:0](value2, value1);

initial begin
  #2 $display("%b %b", value1, value2);
  if (value2 === 8'bxxxx0010)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
