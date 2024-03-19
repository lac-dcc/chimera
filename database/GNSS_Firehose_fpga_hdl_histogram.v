module histogram(
  input clk,
  input [1:0] x,
  output reg [7:0] h0,
  output reg [7:0] h1
);

  reg [18:0] c;
  reg [18:0] c0, c1;

  always @(posedge clk)
    if (c==19'd524287) begin
      c <= 0;
      c0 <= 0;
      c1 <= 0;
      h0 <= c0[18:11];
      h1 <= c1[18:11];
    end else begin
      c <= c + 1;
      c0 <= ( (x==2'b01) || (x==2'b10) ) ? c0+1 : c0;
      c1 <= ( (x==2'b00) || (x==2'b11) ) ? c1+1 : c1;
    end

endmodule

// integrate-and-dump to estimate DC offset.  output is in units of 1/32 LSB

module dc_sum(
  input clk,
  input [7:0] x,
  output reg [7:0] dc
);

  reg [18:0] c;
  reg [26:0] s;

  always @(posedge clk)
    if (c==19'd524287) begin
      c <= 0;
      s <= 0;
      dc <= s[21:14];
    end else begin
      c <= c + 1;
      s <= s + {{19{x[7]}},x};
    end

endmodule
