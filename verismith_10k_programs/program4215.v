module top
#(parameter param104 = ((-((^~((8'ha3) * (8'ha2))) * (((8'hbc) ? (8'hb6) : (8'hb2)) ? ((8'hb1) ? (8'h9f) : (8'haf)) : (+(8'ha9))))) ? ({{((8'hbb) ~^ (8'ha0))}, (+{(8'hbb), (8'hb0)})} ~^ (((^~(8'hb0)) ? (^(8'ha3)) : (|(8'haf))) ? (+(~|(8'hbe))) : ((^~(8'hb6)) ? ((8'hb5) ? (8'hb7) : (8'h9e)) : ((8'hb3) ? (8'had) : (8'hbf))))) : ((8'hac) ^~ (((&(8'ha2)) << (&(8'haa))) ? (((8'ha7) ? (8'hbd) : (8'hb9)) ? ((8'ha3) ? (8'had) : (8'h9c)) : {(8'hba)}) : (((7'h43) ? (8'hba) : (8'ha9)) || (+(8'ha0)))))), 
parameter param105 = (+(param104 ? (~&(8'hbf)) : (!(~^{param104})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire98;
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire4,
                 wire5,
                 wire13,
                 wire14,
                 wire61,
                 wire63,
                 wire64,
                 wire98,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (^wire3);
  assign wire5 = ({($signed({wire4}) ?
                         $signed((^wire2)) : wire2[(4'h9):(3'h5)])} && (($signed($unsigned((8'haf))) - $signed((~wire3))) ?
                     $unsigned(wire0[(3'h4):(2'h2)]) : (((-(8'hb9)) & (^wire1)) ?
                         wire1[(1'h1):(1'h1)] : (wire3[(2'h2):(1'h1)] || $signed(wire0)))));
  always
    @(posedge clk) begin
      reg6 <= ((^(^~($signed(wire1) ?
              wire0[(4'h8):(1'h0)] : (wire4 ? wire3 : wire4)))) ?
          $signed(wire3) : (wire5 ?
              ($signed(wire4) ?
                  {{wire4,
                          wire2}} : $unsigned($signed((8'hbf)))) : ({wire2[(2'h2):(1'h1)],
                  (wire1 < wire4)} && ((wire5 ?
                  wire1 : (8'ha7)) >>> $unsigned(wire3)))));
      reg7 <= (|wire4[(1'h0):(1'h0)]);
      if (wire3[(2'h3):(1'h1)])
        begin
          reg8 <= (^(({{(8'ha3)}} ?
              ((reg6 >> (8'hac)) ?
                  (reg7 >= wire1) : (~^wire5)) : $unsigned($signed(wire0))) != {$unsigned((wire4 ?
                  (8'had) : wire0))}));
          reg9 <= $unsigned($signed((&((wire5 & wire5) ?
              (+wire2) : wire2[(4'hc):(4'ha)]))));
          reg10 <= (7'h41);
          reg11 <= (~&(((^{wire0}) & $unsigned((~|wire1))) ?
              $signed({wire4[(4'he):(4'hc)]}) : ($signed((^~wire2)) == $unsigned((reg8 << wire2)))));
          reg12 <= $signed(wire3[(3'h4):(1'h1)]);
        end
      else
        begin
          reg8 <= $signed($signed(({$unsigned(wire0)} ?
              wire3[(2'h3):(1'h1)] : (~(wire1 ~^ wire2)))));
          reg9 <= ((8'ha7) ?
              reg8[(2'h3):(1'h1)] : ($signed((!(8'hb0))) >>> (reg8[(4'ha):(4'h9)] >>> wire1[(2'h3):(1'h1)])));
        end
    end
  assign wire13 = (8'ha9);
  assign wire14 = (($signed((~|(wire13 ?
                          reg12 : wire4))) << reg9[(1'h0):(1'h0)]) ?
                      {(7'h41)} : wire1[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg15 <= (~{wire2});
      if (reg10[(4'he):(2'h2)])
        begin
          reg16 <= {($signed(reg8) ?
                  $unsigned(reg10[(2'h3):(2'h3)]) : $signed(($unsigned(wire1) >= (reg10 <<< wire0))))};
          reg17 <= reg7;
        end
      else
        begin
          reg16 <= reg15[(5'h12):(4'he)];
          reg17 <= $unsigned((reg9[(4'h8):(3'h6)] < wire3));
          reg18 <= $unsigned($unsigned(reg9[(4'ha):(1'h1)]));
          reg19 <= reg7;
        end
      reg20 <= (reg10 <= $signed(reg6));
      reg21 <= ((reg19 ?
              (((-reg16) ? reg6 : $unsigned(wire14)) ?
                  wire13 : wire1[(1'h1):(1'h1)]) : reg8) ?
          {$signed(reg17), wire1[(1'h0):(1'h0)]} : reg19[(4'h8):(2'h3)]);
    end
  module22 #() modinst62 (.wire26(reg7), .wire25(reg9), .wire23(reg21), .clk(clk), .y(wire61), .wire24(reg6));
  assign wire63 = $unsigned(((~&($signed(reg8) ^~ (wire4 ?
                      reg7 : (8'hbe)))) >>> reg12));
  assign wire64 = $signed(($signed($signed($unsigned(reg10))) <<< ($signed((&reg10)) | $unsigned($unsigned(wire14)))));
  module65 #() modinst99 (.wire68(reg10), .wire67(wire1), .clk(clk), .y(wire98), .wire70(wire14), .wire69(wire63), .wire66(reg7));
  assign wire100 = wire2;
  assign wire101 = wire2;
  assign wire102 = (^~$signed(reg18[(2'h3):(2'h2)]));
  assign wire103 = $unsigned(wire98);
endmodule

module module65  (y, clk, wire66, wire67, wire68, wire69, wire70);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire67;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire95;
  assign y = {wire97, wire71, wire72, wire73, wire95, (1'h0)};
  assign wire71 = ($unsigned(((((8'ha1) ~^ wire67) < (wire68 - wire67)) ?
                          (|wire66[(4'ha):(4'h8)]) : wire67[(4'hd):(4'hb)])) ?
                      (+{$unsigned((wire66 ^~ wire68)), wire69}) : (wire66 ?
                          (~^$unsigned(wire69[(2'h3):(2'h3)])) : wire69[(3'h7):(3'h4)]));
  assign wire72 = ($unsigned($signed((!$unsigned((7'h41))))) & ((&(8'hb9)) ?
                      {((wire67 ? wire69 : wire68) ? wire66 : (7'h43)),
                          ((^wire69) < wire71)} : (wire71 + (^~(wire70 ?
                          wire67 : (8'h9f))))));
  assign wire73 = wire66[(3'h6):(1'h0)];
  module74 #() modinst96 (wire95, clk, wire66, wire68, wire73, wire70, wire69);
  assign wire97 = wire69[(2'h3):(1'h1)];
endmodule

module module22
#(parameter param59 = (~((&(((8'hbd) - (7'h43)) ? ((8'hbd) < (8'hb8)) : ((8'ha7) ? (8'hb6) : (8'hbb)))) & ({(~(8'hac))} >= (((8'hbd) ? (8'ha3) : (8'hbd)) ? ((8'hb8) ~^ (8'ha7)) : (+(8'ha3)))))), 
parameter param60 = (~&{param59, param59}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  assign y = {wire57, wire32, wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $unsigned((~^wire25[(2'h3):(2'h2)]));
  assign wire28 = wire23;
  assign wire29 = {(8'hbf)};
  assign wire30 = wire24[(4'hd):(4'hc)];
  assign wire31 = $signed($signed(wire29));
  assign wire32 = (wire24[(5'h10):(4'h8)] ?
                      $signed((wire24[(4'ha):(4'h8)] ?
                          (7'h43) : wire24[(4'hd):(1'h1)])) : (wire26[(3'h7):(1'h1)] >> $unsigned($unsigned($signed(wire30)))));
  module33 #() modinst58 (wire57, clk, wire27, wire31, wire32, wire25);
endmodule

module module33
#(parameter param56 = {((~(((8'ha1) ? (8'ha3) : (8'hac)) ? ((8'hae) >>> (8'haf)) : ((8'hae) ~^ (8'hb3)))) + (|({(7'h40)} ? ((8'hb3) ? (7'h44) : (8'hb8)) : {(8'hbd), (8'hb3)}))), (+(8'hab))})
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire37;
  input wire [(5'h14):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire35;
  input wire [(4'hd):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg44,
                 (1'h0)};
  assign wire38 = wire35;
  assign wire39 = wire37[(1'h1):(1'h1)];
  assign wire40 = {($unsigned(wire39) ^ (wire37[(3'h6):(3'h6)] & (wire39[(3'h6):(1'h0)] ?
                          $signed(wire34) : {(8'h9f), wire38}))),
                      {(wire38 ?
                              (~^$unsigned(wire38)) : (&$unsigned(wire36)))}};
  assign wire41 = wire34[(3'h6):(3'h4)];
  assign wire42 = wire40[(3'h6):(3'h5)];
  assign wire43 = wire35[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg44 <= wire35;
    end
  assign wire45 = (~$signed($unsigned((((8'h9e) ^ (8'hab)) ^~ wire36[(1'h0):(1'h0)]))));
  assign wire46 = wire35[(3'h6):(3'h5)];
  assign wire47 = $unsigned(wire37[(4'hc):(2'h3)]);
  assign wire48 = ({$unsigned((wire45[(3'h7):(3'h6)] || $unsigned(wire45)))} ?
                      $signed((wire42[(3'h4):(2'h2)] != (wire45 ?
                          wire37 : wire41[(2'h3):(1'h0)]))) : (wire34 ?
                          reg44[(4'hd):(3'h4)] : $unsigned($signed((^wire47)))));
  assign wire49 = (~^($signed($signed(wire43[(3'h4):(3'h4)])) ?
                      wire34[(3'h7):(2'h3)] : (8'hac)));
  assign wire50 = ($unsigned($signed($signed(wire49))) ?
                      $signed(wire46) : wire34);
  assign wire51 = ({(8'ha0),
                          ((~&(wire35 ?
                              wire42 : wire37)) <<< $signed($unsigned(wire36)))} ?
                      (wire35 ~^ wire48) : $signed((~^$signed((8'hb9)))));
  assign wire52 = wire36;
  assign wire53 = wire52;
  assign wire54 = (8'haf);
  assign wire55 = $signed($signed({wire50, $unsigned((wire39 ^ wire46))}));
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire79;
  input wire [(3'h4):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  input wire signed [(5'h14):(1'h0)] wire76;
  input wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 (1'h0)};
  assign wire80 = (((wire77[(2'h2):(1'h1)] > ((wire78 ?
                      wire75 : wire75) ^ (wire76 == wire75))) > wire79) ^~ {$unsigned((^wire78[(1'h1):(1'h1)])),
                      $unsigned(($unsigned((8'hbf)) ?
                          wire79[(3'h7):(3'h4)] : (~wire75)))});
  assign wire81 = (~^$signed($signed((((8'had) * (8'h9c)) ?
                      $signed((8'ha5)) : $unsigned(wire80)))));
  assign wire82 = (wire80[(4'ha):(4'ha)] ?
                      (wire80[(4'ha):(4'h8)] ?
                          wire81[(3'h7):(3'h4)] : ((wire75 ^~ wire79[(2'h2):(1'h0)]) * wire75[(2'h3):(1'h1)])) : (+$unsigned((~wire75[(2'h2):(1'h1)]))));
  assign wire83 = (^$signed($unsigned((((8'ha4) && (8'ha8)) == wire76))));
  assign wire84 = ($signed($unsigned(((wire77 ? wire82 : wire77) ?
                      (wire79 ? wire81 : wire78) : (wire83 ?
                          (8'haf) : wire81)))) ~^ $unsigned(($signed($unsigned(wire83)) ?
                      ($signed((8'h9c)) || wire80) : ($signed(wire75) & (wire77 & wire76)))));
  assign wire85 = wire77;
  assign wire86 = (wire85[(1'h1):(1'h0)] ?
                      ($signed((wire77[(1'h1):(1'h1)] ?
                          (wire80 + wire79) : wire78)) & (wire76 ?
                          (~$unsigned((8'ha1))) : (~|$signed(wire81)))) : $signed(wire75));
  assign wire87 = $signed($signed($signed((-(wire76 ? wire77 : wire79)))));
  assign wire88 = $signed(wire77);
  assign wire89 = ($unsigned((~|$signed($signed((8'hb6))))) ?
                      $signed(wire79) : wire77);
  assign wire90 = (((^~$unsigned((wire78 ^~ wire85))) >> $unsigned($unsigned((wire87 != (8'h9c))))) < $unsigned($unsigned(wire78[(2'h2):(1'h0)])));
  assign wire91 = (~&(8'h9d));
  assign wire92 = ($unsigned(($unsigned((+(8'hb7))) ^ wire77[(2'h2):(2'h2)])) & ($signed(((wire79 ?
                          wire78 : wire86) ^ wire89[(3'h4):(2'h3)])) ?
                      wire75 : (((8'hb6) ^ (wire90 ? wire77 : wire80)) ?
                          {{(8'hb2)}} : (wire89[(4'ha):(2'h2)] | $unsigned(wire84)))));
  assign wire93 = $unsigned(((wire84 ? wire80 : wire85) ?
                      $unsigned({$unsigned(wire84),
                          $unsigned(wire82)}) : (-{((8'ha3) ^~ (8'hb5)),
                          wire84[(4'hf):(3'h4)]})));
  assign wire94 = $unsigned((|$unsigned(((wire85 | wire83) ?
                      (wire83 ? wire85 : wire76) : ((7'h43) ^ wire83)))));
endmodule
