module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire69;
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire69,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = ((8'haf) > wire0[(2'h2):(2'h2)]);
  assign wire5 = (($unsigned((+$unsigned((7'h41)))) ~^ (~({wire3, wire2} ?
                     wire3 : wire2[(5'h10):(3'h5)]))) > (&$unsigned($unsigned((wire0 ?
                     wire3 : wire0)))));
  assign wire6 = (wire3[(4'hc):(1'h0)] * $unsigned($signed((wire0 ?
                     $unsigned(wire3) : (wire4 & wire0)))));
  assign wire7 = wire2;
  assign wire8 = $unsigned(($unsigned($signed({wire6, wire4})) >> wire2));
  assign wire9 = $unsigned((~|wire3));
  always
    @(posedge clk) begin
      reg10 <= $signed((wire9[(2'h2):(1'h0)] * ((((8'ha7) ? (8'hab) : wire2) ?
              $unsigned(wire0) : (wire9 & wire1)) ?
          $unsigned($unsigned(wire6)) : wire8[(3'h5):(2'h3)])));
      if (((~&wire9) * wire3))
        begin
          reg11 <= (wire3 << $unsigned($signed(wire6)));
          if (((!wire1) || wire1))
            begin
              reg12 <= (8'ha0);
              reg13 <= $unsigned(wire2);
              reg14 <= $signed({$signed({wire6[(4'h8):(2'h3)]})});
            end
          else
            begin
              reg12 <= {{(~&reg11[(3'h6):(3'h4)])},
                  (((^(wire5 <<< wire5)) ?
                      wire7[(2'h3):(2'h2)] : (wire9 <= wire7)) >>> wire3)};
              reg13 <= $signed($unsigned($signed($signed($unsigned(wire7)))));
              reg14 <= $unsigned((~|wire3));
              reg15 <= wire3;
              reg16 <= ({{$signed((wire7 ? wire4 : reg12))}} ?
                  wire7 : $unsigned(($signed(wire7) ?
                      $signed((~|wire6)) : $unsigned($unsigned(wire8)))));
            end
          reg17 <= wire2[(1'h1):(1'h1)];
        end
      else
        begin
          reg11 <= (~^wire1[(1'h0):(1'h0)]);
          reg12 <= (reg14 ? (7'h43) : wire9);
          if ((($signed($unsigned((|reg14))) ?
                  $unsigned((reg14[(3'h4):(1'h1)] != (&wire4))) : (~wire9)) ?
              $signed((^~($signed(reg17) ?
                  (wire1 ?
                      wire3 : wire5) : ((8'had) ^~ reg11)))) : (wire1[(3'h6):(1'h1)] ?
                  (|wire3) : wire0)))
            begin
              reg13 <= reg15;
            end
          else
            begin
              reg13 <= wire8;
              reg14 <= reg16;
            end
        end
      reg18 <= $signed(((((reg12 ? wire5 : wire5) ^ (reg12 ?
              (8'hbf) : wire1)) == reg15) ?
          reg11[(3'h4):(1'h0)] : $signed(((wire9 && reg17) ?
              $signed(reg11) : wire3[(4'he):(4'h8)]))));
    end
  always
    @(posedge clk) begin
      reg19 <= $signed(wire2[(4'h8):(2'h2)]);
      reg20 <= $signed($signed({$unsigned(wire6[(3'h4):(1'h0)]),
          ($unsigned(wire4) ? $signed((7'h41)) : wire4[(3'h5):(1'h0)])}));
    end
  assign wire21 = (~reg10);
  assign wire22 = $signed((+wire2));
  assign wire23 = ($signed(($signed($unsigned(reg14)) ?
                          $unsigned($unsigned(reg18)) : $unsigned($signed(wire0)))) ?
                      reg17[(1'h1):(1'h1)] : $unsigned(wire3));
  assign wire24 = ((((reg12 < (reg19 << wire21)) ?
                          ((8'ha6) ?
                              {reg20,
                                  (8'ha6)} : (!reg18)) : $signed((&reg13))) ?
                      {wire3[(4'hd):(4'ha)],
                          ((wire5 > wire22) == reg10[(3'h4):(3'h4)])} : reg20) != $signed(wire1));
  assign wire25 = wire7;
  assign wire26 = (($unsigned($unsigned($signed(wire0))) > reg20) || reg11[(2'h3):(2'h2)]);
  assign wire27 = wire22[(4'h9):(3'h5)];
  assign wire28 = reg18;
  assign wire29 = (((&$signed((!reg18))) ?
                          wire25[(2'h3):(1'h1)] : ($unsigned((wire0 ?
                                  reg17 : wire25)) ?
                              ({wire22} >>> wire8[(4'hf):(1'h1)]) : $unsigned((^~wire23)))) ?
                      wire28[(4'h9):(3'h7)] : $unsigned((($unsigned(wire28) ?
                          $unsigned(wire24) : (wire24 ^~ (8'ha6))) | $unsigned(wire8[(1'h0):(1'h0)]))));
  module30 #() modinst70 (wire69, clk, wire7, wire9, wire27, reg16, reg14);
endmodule

module module30
#(parameter param67 = (((((+(8'ha2)) & (8'ha0)) ? ((&(8'ha6)) || ((8'hb5) ? (7'h42) : (8'h9f))) : ((8'h9c) << (~(8'hba)))) ? (((8'hae) << (8'ha3)) && ((~^(8'ha6)) ? (~&(8'ha8)) : ((8'hb8) >>> (8'hb4)))) : (~|{{(8'haf), (8'hab)}})) ? {((((8'hae) ? (8'hb4) : (8'hb2)) ? ((8'hab) * (7'h40)) : (~^(8'hb3))) > (7'h43)), (8'hb3)} : (((((8'hb7) || (8'hb6)) ? ((8'ha4) ? (8'ha2) : (8'h9e)) : ((8'hb8) ? (7'h41) : (7'h41))) << (((8'had) ? (8'ha4) : (8'ha8)) ~^ ((7'h43) ? (7'h40) : (8'hb6)))) == ((~^{(8'hb3)}) >> ((^~(7'h44)) & (&(8'hbe)))))), 
parameter param68 = param67)
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = $signed((8'ha4));
  assign wire37 = {((((8'ha2) == (|wire32)) ?
                          $unsigned(wire33[(1'h1):(1'h0)]) : ($signed(wire36) - {wire36,
                              (8'haa)})) <<< wire33[(4'he):(1'h1)])};
  module38 #() modinst54 (wire53, clk, wire35, wire33, wire32, wire37);
  assign wire55 = (((~^wire53[(3'h6):(3'h4)]) != {$unsigned($unsigned(wire32))}) ^ (!((~wire34[(3'h4):(2'h2)]) ?
                      $unsigned(wire36) : $unsigned($signed(wire53)))));
  assign wire56 = $unsigned({wire33,
                      $signed(($signed(wire37) && wire31[(3'h5):(2'h2)]))});
  assign wire57 = wire34;
  assign wire58 = (+wire33[(4'ha):(3'h7)]);
  assign wire59 = ((&(wire32 ? $unsigned((8'hab)) : $signed($signed(wire35)))) ?
                      (~|$unsigned(wire53)) : wire31);
  assign wire60 = (!((wire36 ^~ $unsigned((!wire33))) ?
                      $signed(({wire57} ?
                          $unsigned((7'h42)) : wire58)) : $signed($unsigned(wire35[(3'h6):(3'h6)]))));
  assign wire61 = $unsigned((~|(($unsigned((8'h9f)) < wire37) ?
                      (~^(wire58 ^ wire59)) : ((^wire55) - wire32[(4'hd):(4'hd)]))));
  assign wire62 = (!(wire59 ?
                      ($signed({wire57}) ?
                          wire34 : wire36) : (($unsigned(wire32) ?
                              wire57 : (wire58 ? wire36 : wire57)) ?
                          $signed(wire34[(5'h12):(4'hd)]) : (|{wire32}))));
  assign wire63 = $signed((+$signed((((7'h41) ? wire61 : wire59) ?
                      $signed(wire34) : $signed(wire62)))));
  assign wire64 = wire53;
  assign wire65 = wire33[(5'h10):(2'h2)];
  assign wire66 = $signed($unsigned($signed($unsigned((^wire35)))));
endmodule

module module38
#(parameter param52 = ((!((((8'hb4) ? (8'h9f) : (8'hb3)) | {(8'hb0), (8'hb3)}) ? ((~&(8'ha9)) ~^ ((8'haa) << (7'h42))) : (((8'had) & (8'hb8)) ^~ (8'hba)))) ? (^~({((8'h9e) >> (7'h44)), ((8'hb0) ? (8'h9d) : (8'haf))} + {{(8'ha9)}, ((7'h44) ? (8'hbe) : (8'ha7))})) : (!{(((8'hba) != (8'ha5)) >= ((7'h43) ? (8'ha4) : (8'hb4)))})))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = (((~&{$unsigned(wire42)}) == $unsigned((|(wire40 ?
                          wire39 : wire40)))) ?
                      (^wire39[(3'h7):(1'h1)]) : (&($signed((~|wire42)) ?
                          $signed(wire42[(1'h0):(1'h0)]) : $unsigned($unsigned(wire41)))));
  assign wire44 = {(~wire39),
                      (((^(wire42 ?
                              wire40 : wire42)) * $signed($signed(wire41))) ?
                          wire43 : $unsigned(wire42))};
  assign wire45 = (((((+wire42) & (~&wire41)) ^ (wire39 >> wire43)) ?
                          ((|(!wire44)) + wire41) : (wire39[(4'hf):(4'h9)] ^ (!wire40[(4'he):(4'he)]))) ?
                      (!($unsigned(wire41) ?
                          (8'hb4) : $signed(wire42))) : $unsigned(wire43));
  assign wire46 = $signed(($signed((wire41 * (^~wire40))) ?
                      wire40[(1'h0):(1'h0)] : $signed({$signed(wire41)})));
  assign wire47 = $unsigned(wire45);
  assign wire48 = wire39[(1'h1):(1'h0)];
  assign wire49 = (&($signed({wire42}) == wire45));
  assign wire50 = wire42[(1'h1):(1'h0)];
  assign wire51 = (+wire44[(2'h2):(2'h2)]);
endmodule
