module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  assign y = {wire142,
                 wire140,
                 wire107,
                 wire106,
                 wire100,
                 wire4,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire4 = $signed(wire0[(5'h13):(4'hc)]);
  module5 #() modinst101 (.wire9(wire4), .clk(clk), .wire8(wire0), .y(wire100), .wire6(wire2), .wire7(wire3));
  always
    @(posedge clk) begin
      if ($signed((~wire4)))
        begin
          reg102 <= $signed((~&((wire1[(4'hf):(3'h7)] && (wire2 ?
              wire0 : wire3)) >= wire100[(1'h1):(1'h1)])));
          reg103 <= wire4;
          reg104 <= ((wire1[(1'h0):(1'h0)] ?
                  (~{$unsigned(wire100)}) : (wire100[(3'h5):(1'h1)] ?
                      reg102 : (8'hb0))) ?
              (^~($unsigned({wire4, wire3}) > (((8'ha9) ? (8'hb7) : (8'had)) ?
                  (~&wire4) : (reg102 || wire3)))) : (reg103 ?
                  wire100 : wire3));
          reg105 <= $unsigned($unsigned(((8'h9e) | wire2)));
        end
      else
        begin
          reg102 <= $unsigned((~$unsigned($unsigned(wire2))));
          reg103 <= (((+($unsigned(wire100) ?
                      reg105[(1'h0):(1'h0)] : (reg102 ? (7'h43) : reg104))) ?
                  ((((8'ha7) * wire0) ? (wire0 >= wire3) : $signed(wire100)) ?
                      reg104 : $unsigned((reg104 ?
                          (8'ha6) : (8'hba)))) : (8'h9c)) ?
              reg103 : (~|(8'hb7)));
          reg104 <= reg104;
          reg105 <= $signed($unsigned($signed({(reg102 ? reg102 : wire3),
              $signed(wire4)})));
        end
    end
  assign wire106 = ($signed((wire4 ?
                           ((~&reg102) || wire4) : wire0[(4'hb):(4'h8)])) ?
                       (wire0[(5'h13):(4'hc)] >> (8'h9c)) : (wire1[(4'he):(1'h1)] << (reg103[(3'h4):(1'h0)] ?
                           (wire4[(3'h6):(3'h5)] + $signed((8'hbd))) : wire1)));
  assign wire107 = wire100;
  module108 #() modinst141 (.wire111(wire106), .y(wire140), .wire109(reg104), .clk(clk), .wire110(wire1), .wire112(reg103));
  assign wire142 = wire2[(5'h12):(3'h5)];
endmodule

module module108
#(parameter param139 = (({({(8'h9f)} ? (~&(8'hb5)) : {(8'hbe), (8'h9e)}), (!((8'ha4) ? (8'haf) : (8'haa)))} >> ((^(~(8'hbc))) ? (!(&(8'haa))) : {((8'hb0) - (7'h41))})) <= {((^((8'ha5) & (7'h42))) ^ (~^(~^(8'hbc)))), (8'h9c)}))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire112;
  input wire [(4'hc):(1'h0)] wire111;
  input wire signed [(3'h7):(1'h0)] wire110;
  input wire [(5'h11):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire134;
  assign y = {wire138, wire137, wire136, wire134, (1'h0)};
  module113 #() modinst135 (.wire117(wire111), .clk(clk), .wire114(wire110), .y(wire134), .wire116(wire112), .wire115(wire109));
  assign wire136 = (8'hbc);
  assign wire137 = ($signed(wire111) ?
                       $signed({(wire136[(1'h0):(1'h0)] ?
                               $unsigned((8'ha7)) : ((8'hbd) ?
                                   wire109 : wire136))}) : {wire111});
  assign wire138 = wire110[(1'h1):(1'h1)];
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire94;
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire54,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire94,
                 reg96,
                 reg23,
                 reg22,
                 reg21,
                 reg16,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ($unsigned($signed($unsigned((wire8 ? (7'h41) : (7'h42))))) ?
          $signed(wire9[(3'h4):(3'h4)]) : $signed((((-wire7) ~^ {(8'ha5),
                  wire6}) ?
              ($unsigned(wire7) >>> wire6[(3'h6):(2'h3)]) : wire6)));
      reg11 <= $signed((8'ha6));
      reg12 <= $signed(wire8);
      reg13 <= {wire9[(2'h3):(1'h0)]};
    end
  assign wire14 = $signed(((reg10 != (((8'haf) ? (8'hae) : reg10) << {reg10,
                      wire6})) | {wire9}));
  assign wire15 = (+$unsigned($signed(wire9[(3'h5):(2'h2)])));
  always
    @(posedge clk) begin
      reg16 <= ((^~wire14) ?
          $signed(reg11[(1'h0):(1'h0)]) : {{(reg11 >>> $signed(wire14))},
              wire8[(3'h7):(3'h6)]});
    end
  assign wire17 = (((~|(^~(reg12 < reg16))) - (~&(reg13[(3'h4):(1'h1)] ?
                          (~reg13) : (reg11 == reg16)))) ?
                      wire9 : (^wire14));
  assign wire18 = reg16[(1'h1):(1'h0)];
  assign wire19 = ({$signed(wire8[(4'hf):(4'hf)]),
                      wire6} << $unsigned($unsigned($signed($signed(wire17)))));
  assign wire20 = (8'hab);
  always
    @(posedge clk) begin
      reg21 <= ($signed((($signed(reg12) ?
                  (wire14 ? wire17 : wire8) : $unsigned(reg13)) ?
              $signed(wire15) : $unsigned((reg13 ? reg16 : wire6)))) ?
          wire6 : wire6[(3'h4):(2'h3)]);
      reg22 <= wire15[(4'h8):(3'h5)];
      reg23 <= $signed($unsigned($signed(((7'h40) || (reg12 * reg11)))));
    end
  assign wire24 = ((((+(wire18 && wire6)) >> wire19) && (wire19 * ($signed((8'hb0)) ?
                      (wire9 | (8'hb0)) : $signed((8'hb6))))) >> $signed((((!wire14) << reg22) > (wire20[(3'h5):(3'h5)] >> reg21))));
  assign wire25 = $signed($unsigned((^~wire24)));
  assign wire26 = $unsigned($unsigned({(wire20[(4'h8):(2'h3)] < wire7)}));
  module27 #() modinst55 (.wire29(wire25), .wire30(wire14), .wire31(reg12), .wire28(wire20), .wire32(reg22), .y(wire54), .clk(clk));
  module56 #() modinst95 (wire94, clk, wire24, wire26, reg12, reg13, wire19);
  always
    @(posedge clk) begin
      reg96 <= {(((!{wire18}) | $unsigned($unsigned((8'h9e)))) - $signed(($signed(wire15) >>> wire24[(4'h8):(2'h2)]))),
          $signed((-(8'hb0)))};
    end
  assign wire97 = ((~^(+$unsigned((&reg22)))) ^ ((~|wire25[(4'hd):(4'hd)]) >= wire20[(3'h7):(3'h5)]));
  assign wire98 = reg10[(1'h1):(1'h0)];
  assign wire99 = (~^wire97[(5'h10):(3'h4)]);
endmodule

module module56
#(parameter param93 = (7'h43))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire61;
  input wire signed [(5'h11):(1'h0)] wire60;
  input wire signed [(4'h9):(1'h0)] wire59;
  input wire [(3'h7):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg87,
                 reg86,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire62 = $signed(((-$signed({wire57})) ~^ ({(wire60 ^~ wire58)} ?
                      (^~wire61[(1'h0):(1'h0)]) : (wire57 ?
                          (~&wire60) : wire61))));
  assign wire63 = (wire61[(1'h0):(1'h0)] == (-((~^wire57) ?
                      (^(wire61 ? (8'hbf) : wire57)) : ((wire62 ?
                              wire57 : (8'haa)) ?
                          ((7'h43) ? wire57 : wire59) : (~&wire57)))));
  assign wire64 = ((wire63 == (~^(!$signed(wire62)))) | (({$signed(wire60),
                          wire59[(3'h5):(3'h5)]} ?
                      wire62 : ($unsigned(wire62) ^ wire59[(3'h4):(2'h2)])) >> (|wire59)));
  assign wire65 = ({$signed(wire57[(3'h5):(3'h5)])} ^ (~(((-wire61) << $signed((8'ha2))) != ({wire57,
                      wire59} ~^ wire60[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      reg66 <= {{$signed((wire61 * wire65[(1'h1):(1'h0)])),
              $signed(({(8'haa)} ?
                  (wire59 > (8'hb2)) : (wire59 ? wire65 : wire65)))}};
      reg67 <= {wire60, (8'h9f)};
      reg68 <= wire57[(4'h9):(3'h6)];
    end
  always
    @(posedge clk) begin
      if (reg67[(2'h3):(2'h3)])
        begin
          reg69 <= $signed(((~|wire64[(5'h10):(4'he)]) >> $signed(wire61)));
          if ($unsigned($unsigned((($signed(wire63) - reg67[(1'h0):(1'h0)]) && $signed((wire60 && reg66))))))
            begin
              reg70 <= ((~&wire60[(1'h0):(1'h0)]) ?
                  $unsigned({((wire61 ?
                          (8'hba) : reg69) < (reg67 && (8'hb3)))}) : (!({{reg68,
                          reg68},
                      $unsigned(wire65)} == $unsigned($unsigned(wire60)))));
              reg71 <= reg69;
              reg72 <= (^~reg69[(4'ha):(4'h9)]);
              reg73 <= ((wire61[(2'h2):(2'h2)] > (^~((|reg68) ?
                  $unsigned(reg70) : {wire65,
                      (8'hbd)}))) >>> reg66[(1'h0):(1'h0)]);
              reg74 <= $signed((((+$signed(reg66)) ?
                  (wire57 >= wire65[(3'h4):(1'h1)]) : reg66) <= (reg73[(2'h2):(2'h2)] ?
                  $unsigned($signed(wire61)) : $signed((~&reg68)))));
            end
          else
            begin
              reg70 <= (~|((^$unsigned((reg68 ?
                  wire59 : wire63))) >> (((wire64 ?
                  reg69 : wire63) & reg73) - wire64)));
              reg71 <= wire62[(2'h3):(2'h3)];
              reg72 <= ($unsigned((~|{wire62})) != $unsigned((|{reg72})));
              reg73 <= $unsigned(($signed(($unsigned((8'ha5)) ?
                      reg73[(2'h2):(1'h1)] : reg74[(1'h1):(1'h0)])) ?
                  $unsigned(((wire60 != wire58) < reg73[(2'h2):(2'h2)])) : ($unsigned($signed(reg71)) ?
                      $signed((wire64 ?
                          wire57 : reg72)) : (wire65[(3'h7):(2'h2)] <<< (wire60 ?
                          reg67 : wire62)))));
            end
          reg75 <= $unsigned((!$signed((!(reg68 ? (8'hb8) : wire65)))));
          reg76 <= reg72;
          reg77 <= reg66[(1'h0):(1'h0)];
        end
      else
        begin
          if ((wire62[(1'h0):(1'h0)] ?
              (~&$unsigned((((8'hae) ?
                  reg67 : (8'haf)) && (~&reg68)))) : $signed((((reg70 || reg70) ?
                  (reg72 ? (8'ha1) : reg77) : $signed(wire63)) || (8'ha5)))))
            begin
              reg69 <= {reg76};
            end
          else
            begin
              reg69 <= (($unsigned($unsigned(reg76)) ?
                  wire61[(1'h0):(1'h0)] : (8'ha9)) >>> reg68);
              reg70 <= (reg75 ? (~^$unsigned(wire58)) : wire62);
              reg71 <= wire60;
              reg72 <= $unsigned($unsigned(reg73));
              reg73 <= (reg70[(3'h4):(1'h0)] ?
                  wire65[(2'h3):(1'h1)] : $signed({(^~$unsigned(reg77))}));
            end
          reg74 <= ($signed($unsigned(wire58)) + (~(8'hbe)));
          reg75 <= wire62[(1'h0):(1'h0)];
          if ({(wire62 << $unsigned($unsigned((wire63 ? reg67 : wire61))))})
            begin
              reg76 <= $unsigned(reg76);
            end
          else
            begin
              reg76 <= wire63;
              reg77 <= reg67;
              reg78 <= ($unsigned(wire61) ?
                  (-(((wire57 >> reg73) != $signed(reg75)) ?
                      {(reg77 < reg66)} : wire59[(2'h3):(1'h1)])) : $signed({(+{reg68,
                          reg67}),
                      (~&(wire64 ? reg75 : wire58))}));
              reg79 <= ($signed((reg68 ~^ $unsigned((reg72 || wire63)))) * reg78);
            end
          reg80 <= reg77[(4'hb):(1'h0)];
        end
      reg81 <= reg68[(2'h2):(1'h1)];
      reg82 <= $unsigned((^(reg81[(3'h6):(2'h2)] ?
          (reg77[(5'h13):(5'h12)] && (reg68 ?
              reg75 : reg68)) : (-$unsigned(wire60)))));
    end
  assign wire83 = wire58[(3'h7):(1'h1)];
  assign wire84 = $signed(((+$signed(wire58)) >> $unsigned(reg69)));
  assign wire85 = reg80;
  always
    @(posedge clk) begin
      reg86 <= {reg73[(4'h8):(2'h3)]};
      reg87 <= (~(reg75 >= $unsigned(((wire84 < wire62) >> $signed(reg70)))));
    end
  assign wire88 = $signed($unsigned($unsigned((reg66[(3'h4):(3'h4)] ?
                      (reg76 <<< reg68) : reg68))));
  assign wire89 = reg72;
  assign wire90 = {((|(~&(wire85 ? wire59 : wire60))) ?
                          reg72 : $unsigned(wire60)),
                      (~^$signed(((wire62 * reg75) ?
                          (wire57 ? reg72 : wire60) : reg86)))};
  assign wire91 = {$signed(((-reg76) == $unsigned((-wire62)))),
                      (reg73[(4'ha):(3'h5)] - $signed((((7'h43) | wire84) ?
                          $signed(reg80) : $unsigned(reg77))))};
  assign wire92 = reg86[(1'h1):(1'h1)];
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  assign y = {wire53,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg41,
                 (1'h0)};
  assign wire33 = wire28;
  assign wire34 = ($signed(((wire30[(1'h1):(1'h0)] ?
                          $signed(wire33) : (wire31 ^ wire29)) >= $signed((~&wire29)))) ?
                      ($signed(wire28) ~^ ($unsigned({wire29,
                          wire33}) ^~ (~(wire32 ^~ wire33)))) : (8'ha4));
  assign wire35 = wire30;
  assign wire36 = $signed({$signed((+((8'hb7) == wire31)))});
  assign wire37 = wire31;
  assign wire38 = (($unsigned(wire37) ^ wire31[(2'h3):(1'h1)]) >> wire33[(1'h0):(1'h0)]);
  assign wire39 = ((^~wire38) ^~ (~^(8'hbf)));
  assign wire40 = (wire35 ? (wire32[(3'h5):(3'h5)] >>> wire36) : wire37);
  always
    @(posedge clk) begin
      reg41 <= (^$signed(($unsigned((~&wire36)) > (+(8'hae)))));
      reg42 <= wire37[(3'h4):(2'h3)];
      reg43 <= $signed($unsigned(({(wire36 ?
              wire32 : (8'hbb))} == wire29[(4'hc):(2'h3)])));
      if ({wire32[(3'h4):(1'h1)], $signed((8'ha4))})
        begin
          reg44 <= reg41[(1'h0):(1'h0)];
          reg45 <= (wire38[(1'h0):(1'h0)] ?
              reg43[(2'h2):(1'h1)] : ((-wire31) ?
                  wire36 : ((!wire34[(3'h5):(2'h3)]) <<< ({reg41, wire40} ?
                      (-wire37) : (wire34 * reg43)))));
        end
      else
        begin
          reg44 <= ($unsigned(reg43) ?
              {(((^wire29) < ((8'ha6) ? (8'hb4) : wire40)) ?
                      ($unsigned(wire32) * wire29[(4'hc):(4'h9)]) : (~|$unsigned(reg45))),
                  wire35} : wire31);
          reg45 <= wire39;
          reg46 <= wire39;
          if (wire38)
            begin
              reg47 <= wire33[(1'h0):(1'h0)];
              reg48 <= (wire34 ?
                  $unsigned($signed(((wire40 ?
                      wire39 : (8'hbd)) || $signed(reg46)))) : (wire38[(1'h0):(1'h0)] ?
                      (~|(wire31[(1'h0):(1'h0)] ?
                          (^reg41) : (^wire34))) : $signed($signed(reg45[(4'he):(3'h5)]))));
              reg49 <= $signed(reg47);
              reg50 <= $signed($unsigned($signed($unsigned((~&wire39)))));
            end
          else
            begin
              reg47 <= reg47[(2'h2):(1'h0)];
            end
          if ($signed(reg47[(2'h3):(1'h1)]))
            begin
              reg51 <= (($signed($unsigned($unsigned(wire33))) ?
                      $signed(wire28) : (reg43[(3'h4):(1'h0)] - ($signed(reg50) ?
                          wire33[(1'h0):(1'h0)] : reg42[(3'h5):(3'h4)]))) ?
                  $unsigned($unsigned({((8'hb3) > wire33),
                      (reg43 * wire38)})) : reg45);
            end
          else
            begin
              reg51 <= {($unsigned({(reg41 ? wire32 : reg43)}) ?
                      (((wire30 <<< (8'had)) < (8'ha3)) ?
                          $unsigned(reg42[(4'ha):(1'h0)]) : $unsigned((wire35 ?
                              reg50 : reg45))) : wire40[(3'h6):(2'h3)]),
                  ((|$signed((reg46 ?
                      (8'hb8) : (8'hb7)))) & $unsigned($unsigned($unsigned(reg49))))};
              reg52 <= (^wire36);
            end
        end
    end
  assign wire53 = (+$signed(reg47[(1'h0):(1'h0)]));
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire117;
  input wire signed [(3'h6):(1'h0)] wire116;
  input wire signed [(4'he):(1'h0)] wire115;
  input wire signed [(3'h7):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(5'h11):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire118;
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 (1'h0)};
  assign wire118 = $signed(($signed(($unsigned(wire116) ?
                           (wire115 ? wire115 : wire116) : {wire115})) ?
                       $unsigned((~^$unsigned(wire116))) : ((wire114[(2'h3):(1'h0)] != (wire116 ?
                           wire117 : wire115)) && $signed($unsigned(wire117)))));
  assign wire119 = {$unsigned((wire115[(4'he):(4'h9)] ?
                           (((8'h9e) ? wire116 : wire115) ?
                               wire114[(1'h1):(1'h1)] : $unsigned(wire116)) : wire116[(3'h5):(3'h5)]))};
  assign wire120 = wire115[(2'h3):(1'h0)];
  assign wire121 = wire116;
  assign wire122 = wire121[(4'he):(3'h4)];
  assign wire123 = (wire120[(3'h4):(1'h1)] < {wire120,
                       $signed($unsigned((wire121 < wire122)))});
  assign wire124 = {{(-{(wire120 <<< (7'h44))})},
                       (|(^~(~^wire119[(3'h5):(3'h4)])))};
  assign wire125 = ({(($signed((8'ha1)) < wire116[(3'h5):(2'h2)]) == wire120),
                           {(wire121 ? wire122[(2'h2):(1'h1)] : (~^wire122))}} ?
                       {wire117[(3'h6):(3'h6)],
                           {wire116[(1'h1):(1'h1)],
                               wire115[(4'hb):(4'hb)]}} : $signed(wire122));
  assign wire126 = (($unsigned((^(wire122 ?
                       wire117 : (8'hb4)))) ^ wire125[(3'h7):(3'h6)]) ^ {$unsigned(((~^wire119) || ((8'ha5) ?
                           (8'ha5) : (8'hbb))))});
  assign wire127 = wire118;
  assign wire128 = $unsigned(wire115);
  assign wire129 = (!$unsigned($signed(wire126)));
  assign wire130 = $unsigned($unsigned(($unsigned(wire122) >> wire122)));
  assign wire131 = wire119[(4'hf):(2'h2)];
  assign wire132 = ({(~{((8'ha4) <<< wire118), (~wire116)})} ?
                       wire122 : wire119);
  assign wire133 = wire126[(3'h4):(1'h1)];
endmodule
