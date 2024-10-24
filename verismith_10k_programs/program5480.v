module top
#(parameter param136 = (7'h40), 
parameter param137 = ({(param136 ~^ ((param136 ? param136 : (8'ha6)) && (~param136))), (((param136 ? param136 : param136) ? (~^(8'h9f)) : ((8'h9e) ? param136 : param136)) ? (8'hab) : (^~((8'ha6) ? param136 : param136)))} ? ((((~|param136) - ((8'hbc) ? param136 : param136)) ? (~{param136}) : param136) ? (param136 ? (~|param136) : ((~param136) ? ((8'hbb) ? param136 : (8'hb2)) : param136)) : (~&(param136 ? param136 : (~param136)))) : {param136, (!((&(7'h43)) <= param136))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire133;
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire135,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire69,
                 wire133,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = {$signed(wire4[(3'h6):(3'h6)])};
  assign wire6 = wire1[(2'h2):(1'h1)];
  assign wire7 = {wire3};
  always
    @(posedge clk) begin
      reg8 <= (~$signed(wire4[(4'hc):(4'hc)]));
    end
  always
    @(posedge clk) begin
      reg9 <= ($unsigned($unsigned(((|wire5) ?
          wire0 : ((8'hac) != wire6)))) <= $signed(reg8[(4'hb):(3'h5)]));
      reg10 <= (8'h9e);
    end
  always
    @(posedge clk) begin
      if ($signed(((8'ha3) ?
          $unsigned((~reg9[(3'h4):(3'h4)])) : (reg9 ?
              ($signed(reg10) ? {reg9, wire2} : $signed(wire5)) : ({reg9,
                      wire5} ?
                  (wire3 ? (7'h41) : (8'h9f)) : {wire4, reg10})))))
        begin
          reg11 <= (&$signed($unsigned($unsigned((reg9 | wire1)))));
          reg12 <= (($signed($unsigned(((8'ha6) ?
              reg8 : reg9))) <<< wire7[(3'h4):(2'h2)]) >> $unsigned(((!wire0) ?
              (&$unsigned(wire4)) : (^(8'hb4)))));
          reg13 <= wire0;
          reg14 <= wire6[(4'h9):(4'h8)];
          if (({{(reg11[(1'h0):(1'h0)] ? (7'h43) : (wire5 || reg13)),
                      $unsigned(wire4[(4'ha):(4'h9)])},
                  (|((wire1 ? reg9 : wire4) ? {wire0, (8'hb2)} : reg8))} ?
              $unsigned((|$signed((^reg8)))) : reg11))
            begin
              reg15 <= (~|wire7);
            end
          else
            begin
              reg15 <= $signed(($unsigned(((+reg14) ?
                  (|(8'h9f)) : reg15[(2'h2):(1'h0)])) >> ({{(7'h40)}} < ($signed(reg9) ?
                  (reg12 - wire4) : (reg13 ? reg14 : (8'h9f))))));
              reg16 <= ($signed($signed((|(wire5 ? wire1 : reg12)))) ?
                  $signed($signed(wire3)) : $signed($unsigned(reg9)));
              reg17 <= wire6;
              reg18 <= $unsigned($signed((-$signed($unsigned(reg9)))));
            end
        end
      else
        begin
          reg11 <= {((-(|reg12[(2'h2):(1'h1)])) ?
                  $unsigned(((+reg10) ?
                      (reg18 == wire4) : (~|reg15))) : reg13[(2'h3):(1'h0)])};
          reg12 <= $unsigned(wire6[(1'h1):(1'h0)]);
          reg13 <= (|reg9[(3'h5):(1'h1)]);
          reg14 <= {(wire5 ?
                  ((reg12[(2'h3):(2'h2)] >> $signed((8'hb1))) ^~ $signed(wire4[(4'h9):(1'h0)])) : (^~((&wire1) | (wire2 == (8'hae)))))};
        end
    end
  assign wire19 = wire1[(1'h1):(1'h0)];
  module20 #() modinst70 (wire69, clk, reg12, wire3, reg14, wire0, reg11);
  module71 #() modinst134 (.wire75(reg17), .wire72(wire1), .wire74(reg11), .clk(clk), .wire73(reg13), .y(wire133));
  assign wire135 = wire4;
endmodule

module module71  (y, clk, wire72, wire73, wire74, wire75);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire72;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire [(4'hf):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire131;
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  assign y = {wire76,
                 wire77,
                 wire83,
                 wire84,
                 wire131,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire76 = wire74[(4'hc):(3'h7)];
  assign wire77 = ($unsigned(wire73) <= ((8'hbf) > (wire72 <= ($unsigned((8'hbb)) > {(8'ha5)}))));
  always
    @(posedge clk) begin
      if ((~$unsigned(((^(wire73 ? wire74 : wire74)) ?
          wire72[(3'h5):(1'h1)] : {$signed((8'hae))}))))
        begin
          if (($signed(wire73[(2'h2):(1'h0)]) ?
              (^~$signed(wire73[(3'h4):(3'h4)])) : (~|(wire74[(1'h1):(1'h0)] >= $unsigned(wire74[(4'ha):(2'h2)])))))
            begin
              reg78 <= wire77;
              reg79 <= wire73;
              reg80 <= {({(&wire74[(4'hb):(3'h7)])} ^ (((-(8'hab)) <= ((8'hb2) ?
                      reg79 : wire72)) || $signed((wire77 ? reg78 : wire74))))};
            end
          else
            begin
              reg78 <= $unsigned(wire72);
              reg79 <= {$signed((^~(+$unsigned(wire77)))),
                  ($unsigned({wire73[(1'h1):(1'h0)], (!wire76)}) ?
                      (^wire75) : (^$signed($signed(wire72))))};
              reg80 <= reg78[(4'hf):(4'he)];
            end
        end
      else
        begin
          reg78 <= reg80;
          reg79 <= $signed({{wire72}, $signed(reg80[(3'h4):(1'h0)])});
        end
      reg81 <= (8'ha3);
      reg82 <= reg78;
    end
  assign wire83 = ((8'h9d) ? wire74 : $signed($unsigned($unsigned(reg81))));
  assign wire84 = ((wire76 ?
                          (((reg82 ^ wire73) + wire77[(1'h0):(1'h0)]) <<< reg79) : $signed(reg80[(1'h0):(1'h0)])) ?
                      (|((^wire72) >> {((8'hae) ? (8'ha8) : wire76),
                          (wire76 ? wire83 : (8'hb1))})) : wire74);
  module85 #() modinst132 (.clk(clk), .wire89(wire72), .wire87(reg79), .wire90(wire75), .y(wire131), .wire86(wire83), .wire88(reg81));
endmodule

module module20
#(parameter param67 = (!(~|(|(^~(&(8'had)))))), 
parameter param68 = {{(((param67 >= (8'ha8)) ^~ (param67 & param67)) - (|(param67 ? param67 : param67))), param67}})
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  assign y = {wire66, wire62, wire27, wire26, reg65, reg64, (1'h0)};
  assign wire26 = $unsigned((wire25 > wire23));
  assign wire27 = $signed(wire26);
  module28 #() modinst63 (.wire30(wire25), .wire32(wire26), .y(wire62), .clk(clk), .wire29(wire24), .wire31(wire22));
  always
    @(posedge clk) begin
      reg64 <= (|wire21);
      reg65 <= ($signed(reg64) ^ {(wire24 ?
              wire23[(1'h0):(1'h0)] : (wire62[(3'h6):(2'h2)] ?
                  (wire22 ^ wire25) : wire26[(5'h12):(4'h8)])),
          (~$signed($unsigned(wire25)))});
    end
  assign wire66 = (8'hbb);
endmodule

module module28
#(parameter param60 = ((7'h44) ? {((((8'hbf) <= (8'h9e)) ? ((8'haf) ? (7'h41) : (8'ha7)) : ((8'ha4) << (8'hba))) ^~ ((~|(7'h40)) | ((8'ha7) >= (8'hb0)))), ((8'hb1) ? ((+(8'ha0)) || (8'haf)) : (((8'ha4) * (8'haf)) << ((8'ha6) ? (8'hb0) : (8'hb4))))} : ((~&(+(^~(8'hb7)))) || (|(^((8'haa) > (8'h9f)))))), 
parameter param61 = ((~^param60) ? param60 : (+(param60 ? (|(param60 ? param60 : param60)) : {(!param60)}))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire33 = $unsigned(wire31[(4'ha):(4'h8)]);
  assign wire34 = $signed(((wire32[(5'h12):(1'h1)] != wire32) ?
                      $signed((&(!(8'ha6)))) : $unsigned($signed((&wire33)))));
  assign wire35 = $unsigned(wire33);
  assign wire36 = wire29;
  assign wire37 = (~((wire36 && wire31) ? $signed(wire30) : {wire32, wire32}));
  assign wire38 = (({wire33[(1'h0):(1'h0)]} ^ ((8'hb9) ?
                          wire34[(4'hc):(1'h0)] : $signed($signed(wire37)))) ?
                      (((wire34[(5'h12):(4'he)] && (|wire31)) ~^ $unsigned((8'hbb))) < $unsigned(wire29[(2'h2):(1'h0)])) : wire35);
  assign wire39 = wire37[(1'h1):(1'h1)];
  assign wire40 = wire34[(5'h11):(2'h2)];
  assign wire41 = (!((+$signed((wire37 ? wire39 : wire39))) ?
                      (wire36[(4'hb):(3'h4)] ?
                          (wire29[(2'h2):(2'h2)] << $unsigned(wire31)) : $unsigned(wire39[(1'h0):(1'h0)])) : ($signed(wire30[(1'h0):(1'h0)]) + $signed($signed(wire39)))));
  always
    @(posedge clk) begin
      reg42 <= ((8'h9d) ?
          {(8'hb2), wire29} : $signed($unsigned($signed(((8'ha4) < wire30)))));
      if (wire35[(4'h8):(3'h6)])
        begin
          reg43 <= ({$signed((^~$unsigned(wire32))),
                  $unsigned((~^wire33[(2'h3):(2'h2)]))} ?
              {(+wire30),
                  ((~&((8'ha6) ?
                      (7'h43) : wire30)) + ($signed(wire41) <= $unsigned(wire36)))} : $unsigned((((~^wire29) ?
                      wire36 : $signed((8'h9f))) ?
                  wire40 : $unsigned($signed(wire33)))));
          reg44 <= wire31[(2'h2):(1'h0)];
          reg45 <= wire32[(5'h12):(4'h9)];
        end
      else
        begin
          reg43 <= wire31[(3'h6):(2'h2)];
          if ((~^wire31[(3'h5):(2'h3)]))
            begin
              reg44 <= {$signed({reg44[(2'h2):(2'h2)],
                      $signed((wire30 ? wire29 : wire36))}),
                  $signed((~|(^(~^wire31))))};
              reg45 <= $unsigned($unsigned({wire30, (8'h9f)}));
              reg46 <= $unsigned((^{wire37}));
            end
          else
            begin
              reg44 <= {(^wire36)};
              reg45 <= $signed({((&(7'h41)) ?
                      wire34[(5'h11):(3'h5)] : wire41[(1'h1):(1'h0)])});
            end
          if (wire40)
            begin
              reg47 <= {{reg45[(4'hc):(4'ha)]}};
              reg48 <= $signed((~(((reg45 | wire34) || wire37[(3'h6):(1'h0)]) >= wire34[(4'hc):(2'h3)])));
            end
          else
            begin
              reg47 <= wire41;
              reg48 <= ((8'hb4) + ($unsigned($unsigned(reg42)) ?
                  (wire30[(1'h0):(1'h0)] >>> wire31[(4'ha):(1'h1)]) : $unsigned((-wire34))));
              reg49 <= reg47[(3'h6):(2'h3)];
              reg50 <= (&((+(wire36[(2'h3):(1'h1)] >= $signed(reg44))) ?
                  (-wire35[(1'h1):(1'h0)]) : (8'h9e)));
              reg51 <= wire32[(5'h12):(4'hc)];
            end
          if (wire32[(4'ha):(4'ha)])
            begin
              reg52 <= ({(|$unsigned(wire39[(4'ha):(3'h5)])),
                      $unsigned(((reg42 <<< (8'hbf)) ?
                          wire30 : (reg45 ? wire32 : (8'hbc))))} ?
                  (wire39 - (wire37 ?
                      ((wire35 ^~ wire39) ^~ wire32[(1'h0):(1'h0)]) : (^~wire40))) : (reg50 ?
                      wire41[(4'h9):(3'h6)] : ((reg47[(3'h5):(2'h2)] ?
                              (-reg42) : wire34[(3'h7):(3'h6)]) ?
                          $unsigned($signed(wire37)) : reg50[(4'ha):(4'h8)])));
            end
          else
            begin
              reg52 <= $unsigned(reg44);
              reg53 <= wire41;
              reg54 <= {(&wire36), wire38[(4'hb):(2'h2)]};
              reg55 <= $signed({$signed((~|wire38)),
                  $signed(wire33[(2'h3):(1'h1)])});
            end
          reg56 <= reg49[(3'h5):(1'h1)];
        end
      reg57 <= (8'ha7);
      reg58 <= wire32[(2'h2):(1'h0)];
      reg59 <= $signed((($unsigned(wire29[(2'h2):(2'h2)]) == {{wire38},
          reg47}) + $signed(reg44)));
    end
endmodule

module module85
#(parameter param129 = (((~|(8'hb2)) << ((!(|(8'ha2))) && ((~&(8'had)) ? ((7'h41) > (8'ha6)) : (8'ha1)))) > (^~(^~{((8'ha4) & (7'h42))}))), 
parameter param130 = param129)
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire90;
  input wire [(3'h6):(1'h0)] wire89;
  input wire [(3'h4):(1'h0)] wire88;
  input wire signed [(5'h15):(1'h0)] wire87;
  input wire signed [(5'h11):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  assign y = {wire128,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire91 = (((7'h44) ^~ wire90[(4'ha):(4'ha)]) ?
                      $unsigned(wire86) : (-$unsigned((!{(7'h41), wire88}))));
  assign wire92 = wire91;
  assign wire93 = wire88[(3'h4):(1'h1)];
  assign wire94 = $signed((|$signed({wire92, {wire86, wire89}})));
  assign wire95 = $signed(($unsigned(((-wire91) == (wire87 ?
                          wire90 : wire87))) ?
                      ({$signed(wire94)} - ((~^wire86) ^~ $signed(wire86))) : (wire89 ?
                          wire92[(3'h4):(1'h1)] : $signed($unsigned(wire88)))));
  always
    @(posedge clk) begin
      reg96 <= wire91[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg97 <= $unsigned(wire95);
      reg98 <= (&$signed((7'h41)));
      if (wire91)
        begin
          reg99 <= wire92;
          reg100 <= (~|($signed((~^wire86[(4'h9):(4'h8)])) >>> reg98));
          reg101 <= $unsigned($unsigned(($signed((|wire94)) ?
              reg98 : wire86[(4'h8):(1'h0)])));
        end
      else
        begin
          reg99 <= (8'hb1);
          reg100 <= $unsigned(((($signed(reg101) != (8'hac)) ?
                  ((reg100 ? wire86 : reg99) > (reg99 ?
                      wire90 : reg100)) : reg97) ?
              reg97 : ({reg99} * (reg101[(2'h3):(1'h1)] ^~ (wire95 < wire94)))));
          reg101 <= wire93;
          if ((((~wire95) >>> $signed((^~(reg100 | wire91)))) >= (^{wire87[(4'hd):(4'hc)],
              (+wire93[(2'h3):(1'h0)])})))
            begin
              reg102 <= (~|(^(((wire86 ? reg97 : wire95) ?
                  (+wire94) : wire88[(2'h2):(1'h1)]) >= wire90[(2'h2):(1'h1)])));
              reg103 <= $unsigned(((wire94 - ({(8'hb4), reg102} ?
                  $signed((8'hab)) : (reg99 ?
                      wire93 : wire86))) >>> $unsigned(((~reg97) ?
                  wire95 : (|reg101)))));
              reg104 <= $signed(((reg101 ?
                      {(wire86 - wire87), {wire93}} : (&$unsigned(wire89))) ?
                  (8'hb1) : (^$unsigned($unsigned(reg96)))));
              reg105 <= {reg97};
            end
          else
            begin
              reg102 <= wire94[(3'h6):(1'h1)];
              reg103 <= (+(reg100 | ($unsigned((~wire89)) ?
                  $signed($signed((8'hb8))) : $unsigned((reg96 == wire93)))));
            end
          reg106 <= (((reg98[(2'h3):(1'h0)] ?
              reg96[(4'ha):(1'h1)] : wire95[(4'h9):(3'h4)]) ^ (|$unsigned($signed(reg96)))) | wire89[(3'h4):(2'h2)]);
        end
      reg107 <= wire93;
    end
  always
    @(posedge clk) begin
      reg108 <= ((|(wire90[(4'h8):(3'h4)] ^ $unsigned((|(8'ha8))))) ?
          $unsigned(reg103) : {$unsigned(reg104[(4'hb):(3'h7)]),
              ((|{reg107}) ?
                  reg106[(1'h1):(1'h1)] : $unsigned((wire93 - reg106)))});
      reg109 <= $unsigned(($signed($unsigned((^wire90))) ?
          reg102 : (|(-(reg98 >= wire88)))));
    end
  always
    @(posedge clk) begin
      reg110 <= (^~(({(8'hb6)} ^ ((^~wire90) || (reg104 - reg107))) ?
          reg101[(3'h6):(1'h1)] : (~^$signed($signed(reg105)))));
      if ($unsigned(reg96[(4'h9):(1'h0)]))
        begin
          reg111 <= (reg104 ?
              reg107 : ((|$signed((reg97 ? wire94 : wire95))) ?
                  ($signed((&reg105)) ?
                      (~|$unsigned(wire95)) : reg102[(1'h1):(1'h1)]) : reg96[(4'hd):(4'h8)]));
          reg112 <= (^~$unsigned({wire89, (-$unsigned(reg106))}));
        end
      else
        begin
          if ($unsigned((7'h41)))
            begin
              reg111 <= (wire94[(4'h9):(3'h6)] ?
                  (!(reg107 == (wire95 ?
                      reg98[(1'h0):(1'h0)] : (reg107 <= wire89)))) : ((|reg110) ?
                      reg109[(4'ha):(3'h4)] : $unsigned(wire89)));
              reg112 <= ($signed({wire91[(3'h5):(3'h5)],
                      ((~&(7'h43)) ?
                          (reg103 ? reg112 : reg112) : $unsigned(wire95))}) ?
                  (~({((8'hab) <<< reg100),
                      (~&reg102)} == (+(reg104 - wire93)))) : {{reg99,
                          $unsigned($unsigned(wire93))},
                      $signed(wire94[(3'h4):(3'h4)])});
              reg113 <= $unsigned(wire92);
            end
          else
            begin
              reg111 <= $signed(reg100[(5'h13):(4'hd)]);
            end
          reg114 <= $unsigned(($unsigned(reg112[(1'h1):(1'h1)]) & $unsigned(((wire94 > wire94) ?
              {wire87, wire88} : $signed(reg111)))));
          reg115 <= (~^((wire86 >= (^$unsigned(reg101))) ?
              $unsigned(($signed(reg102) ?
                  reg113[(4'h9):(4'h9)] : {reg105})) : wire90));
          reg116 <= $unsigned($unsigned({(!(reg112 ? (8'h9e) : reg102)),
              reg104[(2'h2):(1'h0)]}));
        end
      reg117 <= (8'hbf);
      reg118 <= (reg115 ?
          (~^((^~(reg108 << reg110)) ?
              reg111 : reg110[(3'h7):(3'h5)])) : (^~(reg115 ?
              $unsigned(reg116) : reg103[(1'h0):(1'h0)])));
      if ({$unsigned(($unsigned(reg116[(1'h0):(1'h0)]) ^ (8'ha6)))})
        begin
          reg119 <= (+{(reg102[(5'h13):(3'h4)] ?
                  wire86[(4'hc):(4'hb)] : (~&wire87[(4'h9):(3'h5)]))});
          reg120 <= (((+$signed((reg109 && reg114))) != $signed(wire94[(3'h6):(3'h6)])) && reg113[(4'hb):(3'h6)]);
          reg121 <= (|($signed({$unsigned(reg107),
              reg105[(4'h8):(3'h7)]}) < $signed($signed($signed(reg102)))));
          if (((~|($unsigned((reg103 >> reg116)) <= $unsigned((wire88 ?
                  reg98 : reg118)))) ?
              {(!(reg114[(5'h12):(3'h6)] & reg109[(1'h0):(1'h0)]))} : ((^(reg103 ?
                  (wire95 ?
                      reg113 : reg96) : $unsigned(wire86))) > $unsigned(reg101))))
            begin
              reg122 <= (($unsigned($signed(reg113)) ?
                      $unsigned(((reg104 < wire95) ?
                          wire92 : (reg118 < (8'hb8)))) : $unsigned(($unsigned(reg110) + wire86[(1'h1):(1'h1)]))) ?
                  $unsigned((reg110[(3'h5):(1'h1)] >= ((wire92 ?
                      reg106 : reg100) > (^~reg102)))) : {reg108[(5'h12):(3'h4)]});
              reg123 <= ((~((reg98 ? $signed(wire88) : (-wire88)) ?
                      wire94[(3'h6):(2'h2)] : reg114[(4'hf):(4'h8)])) ?
                  ($signed($unsigned((8'hbf))) ?
                      $signed(reg97) : wire93) : $signed(reg119[(1'h1):(1'h0)]));
              reg124 <= $signed($signed(((~^((8'hb4) ? reg99 : reg100)) ?
                  wire95 : $signed($signed((8'hb6))))));
              reg125 <= (~|(&$unsigned($signed((reg122 > wire95)))));
              reg126 <= {(wire90 >> $unsigned(wire86)), $signed(wire89)};
            end
          else
            begin
              reg122 <= {(($unsigned((~&reg112)) ?
                          $signed($unsigned(reg123)) : reg116) ?
                      {$signed($signed(wire94))} : ($unsigned($unsigned((8'h9c))) ?
                          $signed((+reg102)) : ({reg125} ?
                              {wire94, reg103} : (reg110 ?
                                  (8'hbb) : reg105))))};
            end
          reg127 <= (+reg108);
        end
      else
        begin
          reg119 <= reg124;
        end
    end
  assign wire128 = wire94;
endmodule
