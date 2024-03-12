module counter_modk(clock, reset_n, Q);
  parameter n = 4;
  parameter k = 16;

  input clock, reset_n;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge clock or negedge reset_n)
  begin
    if (~reset_n)
      Q <= 'd0;
    else begin
      Q <= Q + 1'b1;
      if (Q == k-1)
        Q <= 'd0;
    end
  end
endmodule

