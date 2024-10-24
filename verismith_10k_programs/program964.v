module top
#(parameter param16 = (^~(((((8'hbf) ~^ (8'ha6)) == (-(8'hb7))) ? (&((8'hab) ? (8'hb7) : (8'h9d))) : (|{(8'h9d)})) != (((~&(8'hb3)) < ((8'ha2) ? (8'ha1) : (8'hbf))) << (((7'h44) ? (8'ha0) : (8'hac)) && (+(8'hb8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned($signed(({wire4} >>> $unsigned((wire3 >> wire2)))));
  assign wire6 = (~^(wire1[(4'h8):(1'h0)] >> ($unsigned((^(8'ha9))) ?
                     ($unsigned(wire0) >= wire2[(3'h7):(2'h2)]) : (~(!wire2)))));
  assign wire7 = wire5;
  assign wire8 = {$signed(wire4[(4'h9):(3'h4)]),
                     $unsigned(((~{wire6,
                         wire3}) <<< $unsigned($unsigned(wire6))))};
  assign wire9 = (($signed(($unsigned(wire0) ?
                         (^wire4) : (wire8 ? wire1 : wire4))) ?
                     (wire2[(3'h5):(1'h0)] <= ($signed(wire3) != (wire0 | wire2))) : $signed(wire0)) > wire1);
  assign wire10 = ((8'hb7) * (8'h9f));
  assign wire11 = (!(+(({wire8} && (wire3 ?
                      wire10 : wire9)) ^~ (-wire9[(3'h7):(1'h1)]))));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire3);
      reg13 <= wire8;
      reg14 <= ((wire10 >= wire5[(2'h3):(2'h3)]) + $unsigned((&wire5[(1'h1):(1'h1)])));
      reg15 <= (^wire1);
    end
endmodule
