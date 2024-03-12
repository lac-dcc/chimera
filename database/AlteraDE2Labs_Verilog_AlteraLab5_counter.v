module counter(clock, reset_n, Q);
  parameter n = 4;

  input clock, reset_n;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge clock or negedge reset_n)
  begin
    if (~reset_n)
      Q <= 'd0;
    else
      Q <= Q + 1'b1;
  end
endmodule

