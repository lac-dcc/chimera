module top
#(parameter param123 = (^(~^((~&((8'hb9) > (8'hae))) ? (((8'h9d) < (8'hb5)) && ((8'hb2) >>> (8'hb2))) : ((&(8'hba)) != (~&(8'ha6)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire121;
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire121,
                 reg5,
                 reg6,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ({(wire4 ? wire1 : ($unsigned(wire1) ? wire0 : $signed(wire2))),
          (($signed(wire3) ?
              wire0[(1'h0):(1'h0)] : $unsigned((8'h9f))) <= wire0[(2'h2):(1'h0)])} != $signed($unsigned((+(wire4 ?
          wire4 : (8'ha2))))));
      reg6 <= ((((-$unsigned(wire2)) ?
                  ($unsigned(reg5) * (8'ha4)) : (+wire4[(3'h6):(1'h1)])) ?
              (wire0[(2'h3):(1'h0)] ? $unsigned(wire0) : reg5) : reg5) ?
          (~&reg5[(2'h3):(1'h0)]) : $unsigned($signed(((reg5 ? wire3 : wire0) ?
              (wire4 | wire0) : $unsigned(reg5)))));
    end
  assign wire7 = ($signed((~|$signed($unsigned((7'h41))))) ?
                     (reg6 ?
                         (8'hac) : $signed($signed(((8'hb4) ?
                             reg6 : wire3)))) : $unsigned($signed(wire3)));
  assign wire8 = {$signed({$unsigned((wire3 ? (8'had) : wire4)),
                         $signed(wire0)})};
  assign wire9 = ((($unsigned(wire7[(2'h3):(1'h1)]) ?
                     $signed((^~wire1)) : (wire8[(1'h1):(1'h0)] ?
                         $signed(wire3) : (wire4 ?
                             wire2 : reg5))) & $signed((~|(~&(8'hbc))))) ^~ (-(|wire4[(3'h7):(3'h5)])));
  assign wire10 = (-$signed($unsigned(((wire2 ? wire0 : wire9) ?
                      $unsigned((8'h9f)) : (wire8 || wire8)))));
  assign wire11 = $unsigned(reg5[(3'h4):(1'h0)]);
  assign wire12 = $unsigned($unsigned(wire7));
  assign wire13 = (($unsigned(wire2[(4'hf):(1'h1)]) ~^ ($unsigned((wire3 ?
                          wire9 : wire7)) >> (^~(reg5 != (8'ha8))))) ?
                      $signed(((8'hae) ?
                          {(wire1 ? wire1 : wire3),
                              $unsigned((8'hbf))} : (+wire11[(1'h1):(1'h1)]))) : $unsigned($signed(reg6[(2'h2):(2'h2)])));
  assign wire14 = $unsigned($unsigned(wire8));
  assign wire15 = wire11;
  assign wire16 = $signed((!wire7));
  always
    @(posedge clk) begin
      reg17 <= (^~$signed(wire13[(1'h1):(1'h1)]));
      reg18 <= $signed((reg17 < (!$signed(wire13))));
      if (reg18)
        begin
          reg19 <= $signed($signed((&wire3)));
          reg20 <= {(($unsigned((wire9 != wire12)) || ((~^reg17) || (~|wire15))) ?
                  wire9 : $signed($unsigned(((7'h41) ? wire11 : reg5)))),
              $signed(wire7[(1'h0):(1'h0)])};
          reg21 <= $signed($signed(wire2[(2'h2):(1'h1)]));
        end
      else
        begin
          reg19 <= $signed((~^(($unsigned(wire11) ?
              (wire14 ? reg19 : wire7) : $unsigned(wire9)) & ((8'ha0) ?
              $signed(wire7) : wire10[(3'h7):(2'h3)]))));
          reg20 <= (~&({{(wire11 << wire3)}, $unsigned(wire13)} ?
              reg5 : (&{((7'h44) <<< reg18)})));
          reg21 <= (^~(-(8'hb4)));
          reg22 <= wire2[(4'h9):(4'h8)];
        end
    end
  assign wire23 = $unsigned((((((8'hb3) <= wire10) & (reg22 == (8'hb7))) ?
                      {$unsigned(reg22)} : $signed(wire13)) * reg20));
  assign wire24 = (reg20 ?
                      (wire7[(2'h3):(1'h0)] << reg19[(2'h3):(1'h1)]) : (^(((wire1 < wire11) << wire10[(4'hd):(3'h6)]) + $signed((~wire12)))));
  assign wire25 = $signed($unsigned(($signed((8'ha8)) >>> $unsigned($signed(wire4)))));
  assign wire26 = wire14[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg27 <= $signed((&(($signed((8'hb4)) >> $unsigned((8'ha2))) != $signed((^reg21)))));
    end
  module28 #() modinst122 (wire121, clk, reg6, wire4, reg27, reg21);
endmodule

module module28
#(parameter param119 = (({(((8'hbf) ~^ (8'ha5)) ? ((8'hb2) == (7'h40)) : ((8'h9c) - (8'haa)))} >> ((8'h9f) ? (+(~&(8'hba))) : ((!(7'h43)) ? (|(8'had)) : (~(8'h9d))))) != ((({(8'ha6), (8'hb9)} > {(8'ha4), (8'haf)}) ? (((8'hb0) < (8'h9e)) ? ((7'h43) << (7'h41)) : ((8'ha2) > (8'hab))) : (((8'hb9) - (7'h40)) ? ((8'haf) == (8'hba)) : (!(8'haf)))) ? (((|(7'h43)) << ((8'ha3) | (7'h42))) ? (+((7'h43) ^~ (8'hb1))) : (+{(8'hbb), (7'h44)})) : ((&{(8'hbc), (8'hb3)}) ? (~^((8'hb8) ? (8'hb0) : (8'hbe))) : (((8'hb5) ? (8'hb1) : (8'hb7)) >= ((8'h9e) == (8'hb0)))))), 
parameter param120 = ((|(param119 ? param119 : (&(^~param119)))) ? (8'ha5) : (((^(param119 ? param119 : param119)) <<< ((param119 | (8'hb3)) ? (param119 ? param119 : param119) : (-(8'hbe)))) * (!((param119 < param119) ? param119 : param119)))))
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire [(4'hb):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire75;
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  assign y = {wire117,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire33,
                 wire34,
                 wire35,
                 wire39,
                 wire75,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire33 = wire29[(4'he):(3'h4)];
  assign wire34 = (wire30 == ((wire32 && $unsigned((~wire31))) ?
                      ($signed((wire33 ?
                          wire33 : wire30)) != wire32[(3'h6):(3'h6)]) : $unsigned(wire31)));
  assign wire35 = ((~(wire33[(3'h6):(1'h1)] == (~^(wire32 ?
                          wire33 : wire33)))) ?
                      wire29[(1'h1):(1'h1)] : (((-wire30[(4'hb):(1'h0)]) ?
                              $unsigned((wire34 && wire29)) : wire29[(3'h6):(3'h4)]) ?
                          (!{$unsigned(wire34),
                              $signed(wire32)}) : (wire33[(3'h6):(3'h5)] ?
                              wire29 : ((!(7'h42)) ~^ (!wire33)))));
  always
    @(posedge clk) begin
      reg36 <= $signed({(~^$signed($unsigned(wire30))), wire32[(4'h8):(2'h3)]});
      reg37 <= {wire35[(1'h1):(1'h0)],
          $signed({$unsigned((~^wire31)), wire34[(3'h7):(3'h4)]})};
      reg38 <= ((&wire32) ~^ {wire29[(3'h6):(3'h5)], wire31});
    end
  assign wire39 = wire33[(2'h2):(2'h2)];
  module40 #() modinst76 (wire75, clk, wire39, reg36, wire33, wire34);
  assign wire77 = $signed(((&wire30[(4'h9):(1'h1)]) ?
                      wire34 : $unsigned(((wire31 <<< wire29) ?
                          {reg36, (8'hbe)} : (wire34 ? reg38 : wire31)))));
  assign wire78 = wire31[(2'h3):(1'h1)];
  assign wire79 = $unsigned(wire30[(4'h8):(3'h4)]);
  assign wire80 = {wire34[(4'ha):(4'h8)],
                      $signed($signed(($unsigned(wire77) ?
                          $signed(wire39) : (+wire77))))};
  assign wire81 = (8'haf);
  assign wire82 = ($unsigned(wire80[(4'hd):(1'h1)]) ?
                      reg38 : $unsigned((8'h9e)));
  assign wire83 = wire39;
  assign wire84 = $unsigned(wire31);
  assign wire85 = (+$signed(((wire83[(4'h8):(3'h4)] >>> (wire35 ?
                      reg37 : wire34)) ~^ (+(~|wire39)))));
  module86 #() modinst118 (.wire90(reg38), .wire91(wire30), .y(wire117), .wire87(wire83), .wire89(wire79), .wire88(wire85), .clk(clk));
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire91;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire signed [(4'hb):(1'h0)] wire89;
  input wire [(2'h3):(1'h0)] wire88;
  input wire signed [(5'h15):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire92 = $unsigned(wire87);
  assign wire93 = wire90;
  assign wire94 = (wire90 ^~ (~&(-$signed(((8'hb0) ? wire89 : wire93)))));
  assign wire95 = ($signed((^$signed(wire93[(4'hb):(1'h0)]))) ?
                      {wire90[(4'h8):(3'h7)]} : wire92[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg96 <= (wire91 < (($signed($signed(wire95)) ^ (~|(wire89 ?
              wire93 : wire89))) ?
          (^~$signed($unsigned(wire88))) : $unsigned($unsigned(wire94[(4'hc):(2'h3)]))));
      reg97 <= (wire91[(3'h5):(2'h2)] ?
          (&(+(8'hb6))) : $unsigned(($unsigned(wire94[(2'h2):(1'h0)]) ?
              (~&wire88) : $signed((wire93 ? wire95 : wire93)))));
    end
  assign wire98 = $unsigned((($unsigned(wire89) ?
                      {$signed(wire87)} : wire88) & wire90[(1'h0):(1'h0)]));
  assign wire99 = $unsigned((~^wire90[(4'ha):(3'h7)]));
  assign wire100 = $signed(((wire93[(4'hb):(4'h8)] >> (~((8'h9c) ?
                       wire99 : wire88))) ~^ (wire91 + ($unsigned(wire99) ?
                       wire93[(2'h2):(2'h2)] : wire94))));
  assign wire101 = $signed(($unsigned(wire90[(3'h6):(3'h6)]) ?
                       $unsigned((wire88 ?
                           $signed(wire95) : $unsigned(wire90))) : (&wire100)));
  always
    @(posedge clk) begin
      if ((|$signed((+$signed(wire94)))))
        begin
          reg102 <= wire95;
        end
      else
        begin
          reg102 <= ((8'hbe) ?
              (^~(~^$signed((-(8'hb5))))) : $unsigned($signed(($signed((8'hbc)) ^~ (wire92 <= (8'h9c))))));
          if (wire101)
            begin
              reg103 <= ((wire87 == ((+((8'ha7) <= reg102)) ?
                  ((reg96 >>> (8'ha7)) ?
                      (wire98 ? wire90 : wire93) : wire87) : ({reg96,
                      (8'h9c)} | (reg96 != wire93)))) >> wire92[(1'h0):(1'h0)]);
              reg104 <= ((^(~&($signed(wire100) ? $unsigned(wire94) : reg97))) ?
                  wire90 : wire100[(3'h5):(2'h2)]);
              reg105 <= wire90[(2'h3):(2'h3)];
            end
          else
            begin
              reg103 <= wire87[(3'h4):(2'h3)];
              reg104 <= $unsigned({(8'hb8), (~$unsigned(reg103))});
              reg105 <= {{$signed(wire101), wire92[(2'h3):(2'h3)]}, (8'hac)};
            end
          reg106 <= reg97[(3'h4):(2'h2)];
          reg107 <= ($signed(wire98) + wire91);
        end
      reg108 <= $signed($signed((~&wire100[(3'h7):(3'h5)])));
      reg109 <= (((&{(^reg103)}) ?
          $unsigned((((8'h9e) == (8'hae)) * (wire90 && reg104))) : reg104[(1'h0):(1'h0)]) << {(-wire87),
          (~(wire95 ? wire87 : (^reg108)))});
    end
  assign wire110 = $unsigned($signed(((~&(+reg102)) ?
                       $signed((reg105 | reg97)) : {((8'hbe) ?
                               reg97 : wire98)})));
  assign wire111 = wire88[(2'h3):(2'h3)];
  assign wire112 = wire98;
  assign wire113 = $unsigned(wire90[(1'h1):(1'h0)]);
  assign wire114 = reg106;
  assign wire115 = (+$unsigned($unsigned(($signed(wire98) > $signed(wire110)))));
  assign wire116 = (!{wire110, (!reg96[(2'h3):(1'h1)])});
endmodule

module module40
#(parameter param73 = ((^~(+(((8'ha9) ~^ (8'ha6)) >= ((8'ha9) & (8'hb0))))) <<< (8'hb8)), 
parameter param74 = param73)
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  input wire [(3'h5):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg68,
                 reg67,
                 reg66,
                 reg61,
                 reg60,
                 reg59,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= ({$signed(((+wire44) ?
              wire41 : (wire44 ? (8'ha0) : wire44)))} << wire43);
      reg46 <= (^~(~^((|(reg45 + wire44)) ?
          reg45 : $signed((reg45 != wire41)))));
      reg47 <= (!($signed((+reg46[(4'h8):(3'h4)])) ?
          {{(wire44 ? reg46 : (8'ha0))}} : ((+(|wire42)) ?
              ((~&wire44) | (reg45 ?
                  reg46 : reg45)) : $unsigned((wire43 * reg45)))));
    end
  assign wire48 = wire43;
  assign wire49 = wire44[(3'h6):(1'h0)];
  assign wire50 = wire41;
  assign wire51 = {(~^$signed(wire42[(2'h3):(1'h0)]))};
  assign wire52 = {((-($unsigned(reg47) ?
                              (wire43 ? wire41 : wire42) : $signed(wire41))) ?
                          (+$unsigned((~|(7'h43)))) : (wire43 << $signed((~&wire50)))),
                      wire51[(5'h13):(4'hc)]};
  always
    @(posedge clk) begin
      reg53 <= reg45;
      reg54 <= (-$unsigned($signed((^$signed(wire42)))));
      reg55 <= (^{(wire52[(4'hb):(3'h4)] ?
              $unsigned({wire50, (8'hb9)}) : (&wire41))});
      reg56 <= $signed((~((8'h9d) <= (!((8'hac) ? (8'hbe) : wire49)))));
      reg57 <= (&((8'ha4) ^ (^~((&wire51) <= $unsigned(reg46)))));
    end
  assign wire58 = reg45;
  always
    @(posedge clk) begin
      reg59 <= reg47[(4'h9):(2'h3)];
      reg60 <= $unsigned($signed(reg57));
      reg61 <= $unsigned({(($unsigned(wire41) << (wire44 & wire48)) ?
              $signed(wire44) : $unsigned(reg57))});
    end
  assign wire62 = wire44;
  assign wire63 = reg59[(4'hb):(2'h2)];
  assign wire64 = $signed(reg54);
  assign wire65 = reg53;
  always
    @(posedge clk) begin
      reg66 <= {((!$unsigned(wire41[(2'h2):(1'h0)])) >> $signed($signed(wire49))),
          (~&$signed({$signed(reg61), $unsigned(wire49)}))};
      reg67 <= (reg46[(3'h6):(3'h4)] ?
          (wire64[(4'hb):(2'h3)] ?
              (wire52[(4'ha):(3'h6)] ?
                  ((wire64 * wire48) ? reg61 : $signed(reg66)) : ({wire64,
                          reg66} ?
                      (~&reg56) : (|wire65))) : $unsigned(wire48)) : (|wire51[(3'h7):(1'h0)]));
      reg68 <= (+$unsigned(reg47));
    end
  assign wire69 = ($signed($unsigned($unsigned({reg66,
                      reg46}))) | {{reg68[(3'h4):(2'h3)]}});
  assign wire70 = ((~&{(8'hb3), ((wire43 << wire43) + (+reg45))}) ?
                      $signed($signed(wire41)) : reg68);
  assign wire71 = {($signed(((wire69 ? reg46 : reg55) + $unsigned(wire62))) ?
                          reg47[(2'h3):(1'h0)] : reg46)};
  assign wire72 = $signed(wire43[(3'h7):(3'h4)]);
endmodule
