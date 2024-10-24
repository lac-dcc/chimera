module top
#(parameter param22 = (~{((((8'h9d) ? (7'h41) : (7'h42)) ? (!(8'haa)) : ((8'h9d) ? (8'ha1) : (8'ha9))) <<< ((^~(8'hb6)) >>> (~|(8'hb6))))}), 
parameter param23 = {((~&((param22 & param22) ~^ {(8'ha0), param22})) ? (({param22} ? {(8'hb3)} : ((8'ha8) >>> param22)) ? ({(8'ha8), (8'h9e)} != (param22 ? param22 : param22)) : (param22 || ((7'h42) <<< param22))) : {param22})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $signed((|$signed(wire3)));
  assign wire6 = wire0;
  assign wire7 = $unsigned($unsigned((!(wire6[(5'h10):(1'h0)] && wire1))));
  assign wire8 = (wire1[(3'h4):(3'h4)] ?
                     {({wire3[(4'hf):(4'ha)], wire3} ?
                             ($unsigned(wire6) ?
                                 (~wire6) : wire0) : wire7[(3'h4):(3'h4)])} : wire4[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg9 <= {(wire1 << ((wire4 ? $signed(wire2) : {wire6}) << wire7))};
      reg10 <= (($unsigned(wire5) ?
          {wire3,
              ({wire6} ?
                  (wire5 ?
                      wire1 : wire7) : $unsigned(wire0))} : (($unsigned(wire3) ?
                  ((8'haa) * (8'hae)) : (-(8'ha8))) ?
              $signed((~|wire4)) : wire1)) - $signed($unsigned($signed((wire1 ?
          wire5 : wire7)))));
      reg11 <= (wire6[(1'h0):(1'h0)] ?
          wire2[(1'h0):(1'h0)] : (-$signed({((8'h9e) && reg10)})));
      reg12 <= reg11;
      reg13 <= (wire0[(5'h12):(1'h1)] ^ reg10[(4'hd):(4'h8)]);
    end
  assign wire14 = (!(reg13[(4'ha):(3'h6)] ?
                      {$unsigned(reg12)} : ($signed($unsigned(wire3)) ?
                          (reg13 < (reg11 ?
                              wire2 : wire1)) : $unsigned(((8'hac) ?
                              reg12 : wire8)))));
  assign wire15 = (wire7[(2'h2):(2'h2)] > (!(((+wire1) ?
                          (wire4 && wire6) : wire6) ?
                      (^~reg12) : ({wire3} ? reg9[(2'h3):(1'h0)] : wire2))));
  assign wire16 = ((-(!wire8)) << (($signed($unsigned(reg9)) ?
                          ({reg9, (8'h9d)} ?
                              $signed(wire2) : (wire7 ?
                                  (7'h44) : (8'haa))) : wire3[(4'hc):(4'h9)]) ?
                      $unsigned((~^(wire0 ^ wire0))) : $unsigned($signed((wire8 ?
                          wire15 : wire15)))));
  assign wire17 = ({wire1[(2'h2):(1'h1)], (wire3 >= $unsigned(wire16))} ?
                      (wire7[(2'h2):(1'h1)] ?
                          wire14 : wire1) : (~&(($unsigned(wire6) ~^ $signed(wire15)) ?
                          ($unsigned(wire2) ?
                              (8'ha9) : {reg11,
                                  reg9}) : (-wire8[(2'h2):(2'h2)]))));
  assign wire18 = wire3[(3'h6):(3'h6)];
  assign wire19 = ($signed((~($signed(wire0) >= $signed(reg11)))) > (~wire2));
  assign wire20 = (&$unsigned($unsigned(wire5)));
  assign wire21 = {(8'ha8), (^wire17[(5'h10):(4'hb)])};
endmodule
