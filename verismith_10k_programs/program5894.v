module top
#(parameter param47 = {(~^(|({(8'h9e), (8'hac)} == ((8'hbe) ? (8'hb7) : (8'hba))))), (((^~((8'hab) ? (8'hbc) : (8'hb2))) == {(~|(8'hbb)), ((8'ha7) < (8'hbf))}) && (((|(8'hab)) ? (8'ha6) : ((7'h40) ? (8'hb6) : (8'ha3))) ? {(+(7'h42))} : {((8'ha0) ? (8'ha9) : (7'h44))}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire35,
                 wire21,
                 wire20,
                 wire7,
                 wire6,
                 wire5,
                 reg44,
                 reg43,
                 reg37,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = ((7'h44) ?
                     {wire3} : {wire2, $unsigned(($signed((7'h40)) != wire3))});
  assign wire6 = $unsigned(wire1[(4'h8):(2'h2)]);
  assign wire7 = wire1;
  always
    @(posedge clk) begin
      reg8 <= wire1[(3'h6):(1'h1)];
      if (wire1)
        begin
          reg9 <= wire5[(4'hc):(1'h0)];
        end
      else
        begin
          reg9 <= (($signed((reg8[(2'h3):(2'h3)] ?
                  (reg9 >> wire5) : $unsigned(wire1))) ?
              {{(~reg8)},
                  (wire0 | {wire3})} : $unsigned($unsigned((8'hab)))) < $signed(($unsigned((~|reg9)) ?
              $signed($unsigned(wire1)) : wire7)));
          reg10 <= $signed((8'hb3));
          if (wire5[(1'h1):(1'h0)])
            begin
              reg11 <= $signed(wire6);
              reg12 <= (|((($signed(reg11) - (~reg9)) >> ((reg11 - reg10) ?
                  {wire3} : $unsigned(wire4))) ~^ $unsigned((~^$unsigned(reg8)))));
              reg13 <= $signed({(reg11 > (wire3[(1'h0):(1'h0)] ?
                      (~|reg12) : (wire2 ? wire1 : (8'h9f))))});
            end
          else
            begin
              reg11 <= reg9;
              reg12 <= wire2[(1'h1):(1'h1)];
              reg13 <= (^~((+wire4[(3'h4):(1'h1)]) ?
                  (reg10 ?
                      ($signed(wire6) ?
                          (wire4 <<< wire6) : (+reg11)) : reg13[(2'h3):(2'h2)]) : $signed(((wire0 ?
                      wire1 : wire2) + reg12))));
              reg14 <= {(~wire0[(3'h6):(1'h1)]),
                  (^~$signed($unsigned($unsigned(wire3))))};
            end
          if ((reg11[(3'h4):(1'h1)] ?
              ((~$unsigned(reg13[(3'h5):(1'h0)])) ?
                  {(~reg13[(4'he):(3'h5)]),
                      reg8[(3'h6):(3'h5)]} : (+$signed((wire2 ?
                      wire1 : reg10)))) : $signed(reg8[(1'h0):(1'h0)])))
            begin
              reg15 <= ((~^(wire5 == ((reg11 ? reg11 : wire6) ?
                  {wire5,
                      wire4} : $unsigned(wire5)))) || (reg11[(3'h6):(2'h3)] >>> ((~^(wire0 + wire4)) & $signed((wire5 > wire2)))));
              reg16 <= $unsigned(reg15);
              reg17 <= ((reg16 ? wire0 : reg14) ?
                  ($signed($signed((^reg10))) ?
                      {$unsigned((~|reg15)),
                          (8'ha2)} : ((~^$unsigned(wire6)) ~^ ($signed(wire4) ~^ $unsigned(reg8)))) : (wire5[(5'h10):(1'h1)] ?
                      $signed(wire4) : {wire0[(1'h1):(1'h1)]}));
              reg18 <= $signed(($signed((reg17[(2'h2):(1'h1)] && (wire1 ?
                  reg16 : wire2))) - reg13));
              reg19 <= (((~|((~&(8'hb2)) ?
                      reg8[(1'h1):(1'h1)] : reg13[(4'hd):(4'ha)])) ?
                  ({$unsigned((8'hb4))} ?
                      wire0 : (reg8[(3'h5):(3'h4)] != reg15[(2'h2):(2'h2)])) : $unsigned($unsigned(wire6))) == $signed((((reg10 < reg10) ?
                  (wire7 >= wire5) : {(8'hbc), reg16}) != {$signed(reg18)})));
            end
          else
            begin
              reg15 <= {{(|(reg16[(3'h5):(2'h3)] ?
                          (reg18 | (8'hb5)) : $unsigned(wire3)))},
                  (~(|reg19))};
              reg16 <= (~&(($unsigned((wire4 << wire1)) << (reg18[(2'h3):(2'h2)] == {reg8,
                  reg18})) & (reg15[(3'h5):(2'h2)] ?
                  reg19 : {$signed(reg11), (~^reg15)})));
            end
        end
    end
  assign wire20 = ((^~reg14) ?
                      $signed(({reg14[(3'h5):(2'h2)]} >> ($signed(reg8) ?
                          reg11[(2'h3):(2'h2)] : ((7'h41) >= wire2)))) : $signed(reg16));
  assign wire21 = $signed(wire1);
  module22 #() modinst36 (wire35, clk, reg8, reg16, reg18, reg15, reg10);
  always
    @(posedge clk) begin
      reg37 <= (+(~&$signed(wire35[(3'h6):(2'h3)])));
    end
  assign wire38 = $unsigned(($unsigned((-$signed((8'hbe)))) > $signed((reg9[(2'h2):(2'h2)] ^~ (reg8 ?
                      wire5 : wire4)))));
  assign wire39 = (8'h9e);
  assign wire40 = (~&((~&(+reg13[(2'h2):(2'h2)])) - (7'h43)));
  assign wire41 = (wire6 ?
                      $signed($signed(reg10[(3'h6):(1'h0)])) : {$unsigned($signed($unsigned(wire4)))});
  assign wire42 = $signed($signed((&reg10[(4'h9):(3'h4)])));
  always
    @(posedge clk) begin
      reg43 <= $signed(reg14);
      reg44 <= reg13;
    end
  assign wire45 = wire21;
  assign wire46 = $unsigned(($unsigned($signed((wire21 ^~ reg44))) ?
                      $signed(wire2) : (-($signed(reg14) ?
                          {(8'hb6), wire1} : $signed(wire21)))));
endmodule

module module22
#(parameter param33 = (~{({((8'h9d) ? (8'ha9) : (7'h44)), ((8'haf) ? (8'ha9) : (8'h9c))} << (8'ha1)), (-(((7'h43) ^ (8'haf)) >> {(8'hbe), (8'ha2)}))}), 
parameter param34 = param33)
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  assign y = {wire32, wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = $signed(wire25[(3'h5):(3'h4)]);
  assign wire29 = $signed(((|$unsigned((wire23 ?
                      wire23 : wire23))) > (wire28[(2'h3):(1'h0)] ?
                      $signed($unsigned(wire23)) : ((~wire26) << wire26))));
  assign wire30 = (wire26 ?
                      $unsigned((wire25 > $signed((~^wire24)))) : $unsigned((~^$signed($signed(wire27)))));
  assign wire31 = {$signed(wire26[(5'h10):(4'h8)]), $signed((8'h9c))};
  assign wire32 = wire30;
endmodule
