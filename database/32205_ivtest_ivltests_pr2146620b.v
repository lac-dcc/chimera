// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

localparam Size = 24;

reg [2:0] Value;

integer n;

initial begin
  for (n = 0; n < (Size/4); n = n + 1) begin
    Value = (Size/4) - n - 1;
    $display(Value);
  end
end

endmodule
