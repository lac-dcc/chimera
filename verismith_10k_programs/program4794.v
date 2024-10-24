module top
#(parameter param38 = (+(8'hb2)), 
parameter param39 = {(param38 << (((param38 ? param38 : param38) ? param38 : ((8'hb0) ? param38 : param38)) ? (~^param38) : {(param38 & param38), (param38 ? (8'h9e) : param38)}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire14,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = ((wire1[(3'h4):(1'h0)] ?
                     ($unsigned((wire0 == wire0)) ?
                         $unsigned((wire0 ? wire1 : wire3)) : ({wire1,
                             (8'ha1)} ^ wire0[(4'hf):(4'h9)])) : wire3[(2'h3):(1'h1)]) ^~ ($unsigned(((-wire1) + $unsigned(wire1))) ?
                     wire3[(2'h2):(2'h2)] : {($signed(wire3) & wire2)}));
  assign wire5 = $unsigned($signed(wire2));
  assign wire6 = (-$signed(wire1));
  assign wire7 = {wire6};
  assign wire8 = ($signed(wire1) ?
                     $unsigned((~|(&$signed(wire3)))) : wire4[(3'h5):(3'h5)]);
  assign wire9 = {$signed({($unsigned(wire3) ^ $unsigned(wire1))}), (8'hb2)};
  assign wire10 = (wire0 ?
                      $signed((wire7[(1'h1):(1'h1)] >>> (!wire9[(4'hb):(1'h0)]))) : $signed((+((wire4 <= wire6) << wire4))));
  always
    @(posedge clk) begin
      reg11 <= (((~^wire9) ?
          ($signed({wire1}) ?
              ((!wire6) - (wire7 ?
                  wire8 : wire10)) : wire5[(2'h2):(1'h0)]) : $unsigned(wire2)) >= wire7);
      reg12 <= reg11;
      reg13 <= ($unsigned($signed(wire2)) ? $signed($signed(wire0)) : wire7);
    end
  assign wire14 = ((^$unsigned($unsigned(wire10[(1'h0):(1'h0)]))) ?
                      wire4[(4'h8):(2'h3)] : (wire2[(2'h3):(1'h1)] ?
                          (wire1 != reg13) : wire0[(4'hb):(3'h5)]));
  module15 #() modinst31 (wire30, clk, wire3, reg11, wire10, wire5, wire4);
  assign wire32 = (($signed(reg12) << wire30[(2'h2):(1'h0)]) ?
                      wire0 : $signed($signed($unsigned($unsigned(reg11)))));
  assign wire33 = $unsigned(wire8);
  assign wire34 = {(~reg11),
                      (reg13[(3'h6):(2'h2)] ?
                          $unsigned((wire7 ?
                              wire7 : wire6[(1'h1):(1'h0)])) : wire14[(4'ha):(2'h2)])};
  assign wire35 = ($unsigned((reg11 > wire33)) | ((+wire1[(3'h7):(3'h5)]) ^~ (8'hab)));
  assign wire36 = (~|$signed(wire3));
  assign wire37 = ($signed((~^wire10[(4'ha):(4'ha)])) >>> $unsigned(((-$signed(wire32)) ^ $signed(wire32))));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (($signed(wire19[(3'h5):(2'h3)]) ?
                          (~^((~&wire18) && (~wire19))) : (-(|$unsigned(wire16)))) ?
                      wire19 : (((&(|wire19)) >= wire17) <= ({wire16[(1'h1):(1'h1)],
                              wire18} ?
                          $unsigned($unsigned(wire17)) : $signed((wire18 - wire18)))));
  assign wire22 = (($signed($unsigned((^wire21))) && ($signed((wire16 ?
                          wire19 : wire21)) ?
                      (~wire16) : (!(wire19 <= (8'hbd))))) << {$unsigned(wire17[(5'h14):(3'h7)]),
                      wire18});
  assign wire23 = (^wire21);
  assign wire24 = wire18[(3'h7):(1'h1)];
  assign wire25 = ($signed($signed(($signed(wire19) ?
                          ((8'hba) ?
                              wire16 : wire22) : wire22[(4'h9):(3'h4)]))) ?
                      (7'h44) : (wire24 ^ (~|(wire19 ?
                          {wire24} : (+(8'ha2))))));
  assign wire26 = wire22;
  assign wire27 = wire19[(4'ha):(4'ha)];
  assign wire28 = ((^{wire16[(1'h1):(1'h1)]}) ^~ wire23);
  assign wire29 = $unsigned((8'haf));
endmodule
