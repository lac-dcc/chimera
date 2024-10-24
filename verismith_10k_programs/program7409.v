module top
#(parameter param46 = ({((((7'h40) ? (8'ha9) : (8'hae)) != ((8'ha4) + (8'hba))) ? {((8'hbe) >= (8'had))} : (~&(&(8'hb3))))} | {((-((8'hb1) ? (8'haa) : (8'ha3))) > (-((7'h44) << (8'hb8)))), (((!(8'hbe)) ? ((8'h9c) != (8'haa)) : (~(8'ha0))) & (((8'hbb) ~^ (8'ha0)) == (|(8'hbd))))}), 
parameter param47 = (param46 * (((~^(param46 ? param46 : param46)) ? ({(8'hbb)} >= (param46 ? param46 : param46)) : {param46, param46}) <= (param46 && ({(8'ha1), param46} + {param46, param46})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire39;
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire45, wire44, wire41, wire39, reg43, reg42, (1'h0)};
  module5 #() modinst40 (wire39, clk, wire0, wire1, wire3, wire2, wire4);
  assign wire41 = ($unsigned(($unsigned($signed(wire39)) ?
                          $unsigned((~&(8'h9e))) : ((wire1 | (8'ha6)) >= wire4))) ?
                      (+wire2[(5'h15):(4'hc)]) : (^$signed(((8'hbb) ?
                          (wire3 ? (8'ha6) : wire1) : (7'h44)))));
  always
    @(posedge clk) begin
      reg42 <= wire0[(4'ha):(1'h0)];
      reg43 <= $signed($signed(($signed((wire4 ? wire2 : (8'hb3))) ^ wire2)));
    end
  assign wire44 = reg43;
  assign wire45 = $signed((8'had));
endmodule

module module5
#(parameter param37 = ((({((8'hbe) ? (8'hbd) : (8'hbe)), ((8'hb4) ~^ (7'h43))} ? (+(+(8'had))) : {((8'h9e) ? (8'hba) : (8'hb1)), ((8'ha2) ? (8'hac) : (8'ha1))}) != (((8'hb1) ^ (+(8'hb3))) ? (+((7'h41) || (8'h9e))) : ((8'hb7) ? (|(8'hac)) : ((8'hab) ~^ (8'ha8))))) - (~((|{(8'hbb)}) ? (((8'hb9) | (8'ha5)) ? {(8'hbf)} : ((7'h41) ? (8'ha9) : (8'hb3))) : (-((8'h9d) != (7'h41)))))), 
parameter param38 = param37)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire11;
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire19,
                 wire17,
                 wire15,
                 wire14,
                 wire11,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg16,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = wire10;
  always
    @(posedge clk) begin
      reg12 <= wire7[(5'h15):(5'h11)];
      reg13 <= wire10;
    end
  assign wire14 = ($unsigned($signed((~^{reg13, wire8}))) ?
                      (8'ha4) : (((~^$unsigned(wire10)) ?
                              wire9[(2'h3):(1'h1)] : $unsigned((wire10 <= wire7))) ?
                          wire8 : {$unsigned((&wire9)),
                              wire10[(2'h3):(2'h3)]}));
  assign wire15 = wire9;
  always
    @(posedge clk) begin
      reg16 <= $unsigned((!({(wire8 ?
              (8'hac) : wire11)} >> (wire7[(4'hf):(4'h9)] ?
          (^~wire14) : (~&wire11)))));
    end
  assign wire17 = ((~|wire8[(4'h9):(2'h2)]) ?
                      $unsigned(reg13[(1'h0):(1'h0)]) : ($signed((wire6 <<< (&(8'ha4)))) * $unsigned($signed(wire6[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg18 <= $unsigned(reg13[(1'h1):(1'h0)]);
    end
  assign wire19 = reg18[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg20 <= (~^(~^(((reg13 << wire10) ?
          {(8'h9d), wire15} : (wire9 ?
              (8'hb1) : reg12)) ~^ (|$unsigned(wire19)))));
      if (reg16[(2'h2):(1'h0)])
        begin
          reg21 <= $unsigned((&wire9[(4'h8):(1'h0)]));
          reg22 <= wire6[(1'h0):(1'h0)];
        end
      else
        begin
          reg21 <= ((-$signed($unsigned($unsigned(wire19)))) ?
              {$unsigned(wire15),
                  ((8'hb6) ?
                      {$signed(reg13)} : (8'hb0))} : {(($unsigned(wire8) && (wire19 ?
                      (8'hbb) : reg21)) && {wire17[(3'h4):(2'h2)]})});
        end
      reg23 <= wire10[(2'h3):(2'h3)];
      reg24 <= ($signed(wire10[(4'hf):(2'h2)]) >= ({((|wire14) & (+(8'hac))),
          $signed((wire19 - wire6))} == (^(~wire7[(4'hd):(2'h3)]))));
    end
  assign wire25 = (~wire8[(3'h4):(2'h3)]);
  assign wire26 = (($unsigned($signed(reg22[(1'h0):(1'h0)])) << (((reg22 != wire9) ?
                      reg13 : $signed(reg21)) - $signed((reg23 ?
                      wire9 : wire9)))) - $signed((wire7 ?
                      (|{reg21}) : (((8'hb9) ? (8'hb8) : wire9) ?
                          (reg16 >> reg20) : (wire19 ? wire11 : wire9)))));
  assign wire27 = ($unsigned({((wire9 && reg20) >> $unsigned(wire15))}) ?
                      (({(reg12 ? reg12 : reg24), wire6} - (reg12 ?
                          $unsigned((8'h9f)) : $signed(wire14))) ~^ reg18) : reg23[(4'hf):(4'hd)]);
  assign wire28 = wire6;
  assign wire29 = (wire9 <= $unsigned($signed($unsigned((wire8 ~^ wire10)))));
  assign wire30 = (reg12 ?
                      $unsigned(((((8'haa) ? reg18 : reg22) ?
                              reg23[(5'h10):(4'hb)] : wire25[(4'ha):(4'h8)]) ?
                          $signed((~wire29)) : $signed(reg16))) : $signed((wire17 | wire17[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg31 <= $signed(($signed((~^$signed(wire19))) ^~ reg23[(1'h0):(1'h0)]));
      reg32 <= reg18;
      reg33 <= $signed($unsigned((((wire7 <<< (8'ha9)) + (wire25 ~^ reg24)) <<< reg18[(3'h7):(3'h4)])));
      reg34 <= ((~^(((reg23 + reg13) ?
              (reg31 ? reg22 : wire27) : $signed(wire29)) ?
          (^wire30) : (wire27 ?
              {(8'hbe), wire30} : wire7))) > {reg24[(2'h3):(2'h3)],
          reg23[(3'h6):(1'h1)]});
    end
  assign wire35 = ((~(+wire30[(3'h4):(2'h3)])) ?
                      $signed(((-wire14) ?
                          wire29 : ($signed(wire9) ?
                              {(8'hb4), reg24} : ((8'h9e) ?
                                  reg12 : wire17)))) : $unsigned($unsigned((reg13[(1'h0):(1'h0)] ?
                          (wire6 ? (8'hb7) : wire25) : (8'ha8)))));
  assign wire36 = $signed(wire27);
endmodule
