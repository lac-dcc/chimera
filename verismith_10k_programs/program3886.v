module top
#(parameter param16 = ({(&(((7'h40) ? (8'ha7) : (8'hb3)) ~^ ((8'hbb) | (8'haa))))} << (~&(^{((7'h42) ~^ (7'h42)), ((8'hb4) ^~ (8'ha2))}))), 
parameter param17 = (^{(((param16 ? param16 : param16) > ((8'hb3) ? param16 : (8'ha6))) ? ((8'hb9) ? {param16, param16} : (~|param16)) : (param16 ? (8'hbd) : (|param16)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire4,
                 reg14,
                 reg13,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      reg5 <= {(wire1[(1'h1):(1'h0)] <= (wire3[(3'h4):(2'h2)] ?
              wire0 : wire0))};
      reg6 <= $signed(wire1);
      reg7 <= $unsigned(wire4[(4'hc):(4'ha)]);
    end
  assign wire8 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg9 <= reg7[(1'h0):(1'h0)];
    end
  assign wire10 = reg9[(1'h1):(1'h1)];
  assign wire11 = wire4;
  assign wire12 = (reg7[(4'ha):(4'h8)] ?
                      (!{$unsigned(wire11[(1'h0):(1'h0)])}) : wire4[(5'h10):(4'h8)]);
  always
    @(posedge clk) begin
      reg13 <= $unsigned(($unsigned((wire12 & ((8'h9f) ?
          wire8 : wire10))) == {{$signed((8'had))}}));
      reg14 <= {$signed(reg13[(3'h4):(2'h3)])};
    end
  assign wire15 = reg5[(2'h2):(1'h1)];
endmodule
