module top
#(parameter param188 = (~&(~^(8'hab))), 
parameter param189 = param188)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  wire [(5'h15):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire183;
  wire signed [(3'h7):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire175;
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire101,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire28,
                 wire103,
                 wire171,
                 wire173,
                 wire174,
                 wire175,
                 reg104,
                 reg105,
                 (1'h0)};
  assign wire5 = ({(wire2[(1'h0):(1'h0)] ?
                         wire3[(3'h5):(2'h2)] : {(wire3 ? (7'h44) : wire3),
                             (~|wire2)}),
                     (&(^(wire2 ?
                         (8'ha0) : wire4)))} & (!wire0[(4'ha):(1'h1)]));
  assign wire6 = (-wire3);
  assign wire7 = (^~(($unsigned((wire2 && wire5)) || wire3[(2'h2):(2'h2)]) ?
                     $unsigned($unsigned({wire0})) : ((wire0 ?
                         wire4[(3'h5):(1'h1)] : $unsigned(wire6)) + (wire2 ?
                         $signed(wire1) : wire5))));
  assign wire8 = wire1;
  module9 #() modinst29 (.wire10(wire6), .y(wire28), .wire14(wire8), .wire11(wire0), .wire13(wire2), .wire12(wire1), .clk(clk));
  module30 #() modinst102 (wire101, clk, wire1, wire3, wire28, wire7, wire2);
  assign wire103 = ($unsigned(wire2[(4'ha):(2'h3)]) >> (&{((wire6 << wire8) <<< (wire6 ?
                           wire0 : wire3))}));
  always
    @(posedge clk) begin
      reg104 <= (wire8[(4'hf):(4'h8)] <= (~|(+$unsigned($unsigned(wire0)))));
      reg105 <= ($signed($signed($unsigned(wire7))) - ((wire5[(3'h5):(1'h1)] << (wire4[(1'h0):(1'h0)] >= ((8'hbd) ?
              wire6 : wire28))) ?
          (+wire3[(5'h12):(4'h9)]) : ({(^~wire5)} ?
              wire101[(1'h1):(1'h0)] : wire8[(4'hb):(2'h2)])));
    end
  module106 #() modinst172 (wire171, clk, wire0, wire3, wire28, wire101);
  assign wire173 = $unsigned({{(^~wire2), $signed((&wire28))},
                       (-(+$signed(wire101)))});
  assign wire174 = (+(&$unsigned(((wire3 || wire3) ^~ $unsigned(wire0)))));
  module9 #() modinst176 (.wire12(wire174), .y(wire175), .wire13(wire6), .wire14(wire7), .clk(clk), .wire10(wire171), .wire11(wire8));
  assign wire177 = $signed(wire5);
  assign wire178 = (8'h9c);
  assign wire179 = $signed((-$unsigned(wire178[(2'h2):(1'h1)])));
  assign wire180 = wire28[(4'h8):(2'h3)];
  assign wire181 = wire174[(4'hb):(3'h5)];
  assign wire182 = (^~reg105);
  assign wire183 = wire103[(2'h3):(2'h2)];
  assign wire184 = $unsigned((~|reg104[(1'h1):(1'h0)]));
  assign wire185 = wire183;
  module9 #() modinst187 (wire186, clk, wire8, wire5, wire185, reg104, wire171);
endmodule

module module106  (y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire110;
  input wire signed [(3'h6):(1'h0)] wire109;
  input wire [(4'he):(1'h0)] wire108;
  input wire [(4'h9):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  assign y = {wire167, wire112, wire111, reg170, reg169, (1'h0)};
  assign wire111 = $unsigned(wire110[(1'h0):(1'h0)]);
  assign wire112 = $unsigned($signed(wire107[(3'h6):(2'h2)]));
  module113 #() modinst168 (wire167, clk, wire110, wire112, wire111, wire108);
  always
    @(posedge clk) begin
      reg169 <= {(+(~^((wire107 ^ wire107) || (8'hb3))))};
      reg170 <= ({(($unsigned((8'hb1)) <= wire111) >>> {{wire108, wire110}}),
          ((wire108 * {(8'hb0)}) ?
              (7'h44) : wire108)} & wire108[(3'h4):(1'h1)]);
    end
endmodule

module module30
#(parameter param100 = (&(8'haf)))
(y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire88;
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire99,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire36,
                 wire37,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire88,
                 reg98,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = $unsigned(wire33[(3'h7):(3'h6)]);
  assign wire37 = (wire31[(4'h8):(4'h8)] ? wire32 : (+wire36));
  always
    @(posedge clk) begin
      reg38 <= (|$unsigned(wire32));
      reg39 <= ((^~$signed({{wire37, wire33}, reg38})) ^ wire36[(3'h4):(2'h2)]);
    end
  assign wire40 = $unsigned(wire36);
  assign wire41 = (((8'hbf) >= $signed((((8'hba) ? wire31 : wire34) ?
                      $unsigned(wire36) : {wire40}))) >>> {reg39[(1'h1):(1'h0)]});
  assign wire42 = wire34;
  assign wire43 = (~(wire40 ^~ (-$signed(wire41))));
  assign wire44 = $signed($signed($signed((8'had))));
  assign wire45 = (^~$unsigned($signed((~|reg39))));
  assign wire46 = ($signed(((|{reg39}) - $unsigned(wire40))) < ((^~(^(~wire35))) & wire44));
  assign wire47 = $unsigned((~^((^(&wire44)) ?
                      $signed(((8'ha5) ?
                          reg38 : wire33)) : $unsigned($unsigned(reg38)))));
  module48 #() modinst89 (.wire50(wire47), .wire52(wire34), .clk(clk), .wire53(wire31), .wire51(wire41), .wire49(wire44), .y(wire88));
  assign wire90 = ((wire47 ?
                      ({$unsigned(wire40), {(8'hb7), wire47}} ?
                          (wire35 ?
                              wire36 : $signed(wire36)) : (&$signed(wire44))) : ($unsigned($unsigned((8'h9d))) ?
                          wire35 : reg39)) == wire46[(3'h6):(1'h1)]);
  assign wire91 = wire41[(4'ha):(4'h9)];
  assign wire92 = $unsigned($unsigned($unsigned($signed({wire34}))));
  assign wire93 = wire42;
  assign wire94 = wire41[(3'h5):(3'h5)];
  assign wire95 = $unsigned($unsigned((({reg38} ?
                      $signed(wire35) : $unsigned(wire44)) * $unsigned({wire92}))));
  assign wire96 = $signed(reg39[(3'h6):(2'h3)]);
  assign wire97 = (~$signed(wire94[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg98 <= $unsigned(((~wire97[(3'h4):(2'h3)]) ?
          {$signed((~^wire47))} : {wire36[(2'h2):(1'h0)],
              ($unsigned(wire94) ? wire44 : (wire31 ? (7'h43) : wire47))}));
    end
  assign wire99 = (~(8'hb9));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire16,
                 wire15,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire15 = wire14;
  assign wire16 = wire15;
  always
    @(posedge clk) begin
      reg17 <= $unsigned((wire16[(2'h2):(1'h0)] ?
          wire14 : $signed({(^(7'h43)), {wire15}})));
      reg18 <= $unsigned((^~wire10));
      reg19 <= (reg17 ?
          ((((wire16 ? reg18 : wire13) ?
                  (wire11 - wire10) : (wire11 << wire14)) ?
              wire10[(1'h0):(1'h0)] : ({wire14, reg17} ?
                  (!wire10) : $unsigned((8'haa)))) - $unsigned((&(8'ha7)))) : (({((8'ha0) ?
                          wire14 : wire10)} ?
                  $unsigned(((8'hae) ? (8'hb0) : reg17)) : wire13) ?
              (($unsigned(wire10) ? $unsigned((8'ha9)) : (~&wire14)) ?
                  $signed($unsigned((8'hb3))) : $unsigned((+reg18))) : ((-((8'ha1) - reg18)) ?
                  (8'ha2) : (wire12 <= wire15[(2'h3):(2'h3)]))));
      if (wire11[(3'h4):(2'h2)])
        begin
          reg20 <= {wire14,
              ($unsigned(reg18) >>> $signed(wire14[(4'hb):(2'h2)]))};
          reg21 <= {$signed(wire12[(3'h4):(2'h2)]), (7'h40)};
          if (((((8'ha1) ?
                  $signed($unsigned((8'ha6))) : (&$signed(wire15))) - (^(wire11 & ((8'ha3) | wire12)))) ?
              $unsigned((~&wire15)) : {{$unsigned($signed(reg17))},
                  (~^$unsigned((reg19 ? (8'h9f) : wire11)))}))
            begin
              reg22 <= wire12;
              reg23 <= ((^($unsigned((reg19 ?
                  reg21 : wire16)) - (wire15 <<< reg22))) | ($unsigned(wire12) <<< $signed(reg19[(5'h11):(1'h0)])));
              reg24 <= ($signed(($signed(wire16[(3'h4):(3'h4)]) ^~ ((^wire14) ~^ ((8'hab) ?
                      (7'h41) : wire15)))) ?
                  (reg21 ?
                      $signed((((8'ha8) >>> (8'hb9)) ?
                          reg23 : (8'hb6))) : $unsigned($unsigned($signed(wire12)))) : wire10[(4'h8):(3'h5)]);
            end
          else
            begin
              reg22 <= $unsigned(({{(reg22 & (8'ha6)), reg21},
                  (wire16 + {reg20, wire11})} <= (|reg24)));
              reg23 <= {{reg24[(3'h6):(3'h5)],
                      ({{reg24, reg17}} ?
                          (!(wire11 ?
                              wire11 : (8'hb2))) : wire10[(3'h6):(2'h3)])}};
              reg24 <= (reg17[(3'h5):(3'h5)] >> $unsigned($unsigned(((^~reg24) ?
                  wire14 : ((8'ha5) ? reg19 : reg23)))));
            end
        end
      else
        begin
          reg20 <= $signed($unsigned(((~|$signed(reg21)) && {(8'hb2)})));
          if (wire14[(5'h14):(4'hf)])
            begin
              reg21 <= reg23;
              reg22 <= (reg19[(3'h4):(3'h4)] ?
                  ({reg20, $signed((wire11 > wire15))} ?
                      {($signed(reg19) * (wire16 ? reg19 : wire14)),
                          {((8'ha0) <<< (7'h43)),
                              (7'h44)}} : ({$unsigned(wire13)} || ((reg21 & reg17) >>> (reg24 ?
                          wire16 : wire14)))) : $signed(wire15[(4'h9):(4'h9)]));
            end
          else
            begin
              reg21 <= (^$signed((~|(8'h9d))));
              reg22 <= reg23[(5'h15):(4'he)];
              reg23 <= $unsigned((8'ha0));
            end
          reg24 <= (wire11[(3'h4):(3'h4)] ?
              {{$signed((reg19 ? wire12 : reg20)),
                      $unsigned((reg24 ? reg24 : wire10))},
                  (reg23 ?
                      ((reg18 ? wire11 : reg18) ?
                          $signed(reg24) : reg21) : (!(reg23 ?
                          wire14 : reg23)))} : reg23);
        end
    end
  assign wire25 = ($unsigned($signed({$unsigned(wire14)})) > (8'hbc));
  assign wire26 = ((^(wire25[(2'h2):(1'h1)] <= $unsigned(((8'h9d) | wire25)))) ?
                      $signed({wire12}) : wire15);
  assign wire27 = (reg17[(4'h8):(2'h3)] ~^ wire13[(3'h5):(2'h3)]);
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire53;
  input wire [(2'h2):(1'h0)] wire52;
  input wire signed [(4'h8):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire [(5'h14):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire54;
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire54,
                 reg86,
                 reg80,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire54 = (wire51 ? wire49[(5'h10):(4'hf)] : (8'ha0));
  always
    @(posedge clk) begin
      if (wire54[(3'h6):(1'h0)])
        begin
          reg55 <= $signed($signed(((8'hb6) ^~ (wire52 ?
              $unsigned(wire52) : $unsigned(wire52)))));
          reg56 <= (-((~|(wire51[(1'h1):(1'h1)] ?
              $signed(reg55) : (wire53 ?
                  wire49 : (8'hb5)))) > (wire54 > (wire49 - $signed(wire50)))));
          if (($unsigned(($unsigned($unsigned(wire50)) ?
              $signed(reg55[(4'h9):(1'h0)]) : $unsigned(wire52))) > ($signed(wire54[(1'h0):(1'h0)]) ?
              ($unsigned((wire50 <= wire51)) ?
                  $unsigned((reg55 ?
                      wire49 : (8'hbc))) : $signed(wire50[(3'h7):(3'h5)])) : reg56)))
            begin
              reg57 <= ($unsigned(($signed(wire54[(2'h3):(2'h2)]) << wire52)) < (wire52 > $unsigned(wire49[(5'h13):(3'h5)])));
              reg58 <= reg57[(1'h0):(1'h0)];
              reg59 <= (^$unsigned(wire54));
              reg60 <= ({$signed($signed(wire54))} << $signed((^((wire53 >= reg59) && {wire51}))));
            end
          else
            begin
              reg57 <= (~|(~|{((+(8'h9c)) ^~ wire50[(4'hd):(3'h5)])}));
              reg58 <= ($unsigned((~&((wire49 <= reg58) ^~ (!reg57)))) <= reg60[(5'h10):(4'hc)]);
              reg59 <= $unsigned($unsigned({(~|reg55), wire54}));
              reg60 <= reg56;
              reg61 <= $signed(($signed(((wire52 ?
                  reg55 : wire52) >= (wire53 && wire53))) >>> {((reg57 ?
                          wire54 : (8'hbb)) ?
                      wire53[(5'h14):(2'h3)] : (8'hac))}));
            end
        end
      else
        begin
          if ($signed(reg61))
            begin
              reg55 <= wire54;
              reg56 <= reg57[(2'h3):(2'h3)];
              reg57 <= (!{{(|wire54), reg55[(2'h2):(2'h2)]}});
              reg58 <= (((8'hb5) ^ {{(reg60 - reg57)},
                  $unsigned($signed(reg60))}) <<< $unsigned(wire49));
              reg59 <= ({$unsigned((~&(~&reg55)))} ?
                  wire53 : reg55[(4'hb):(3'h6)]);
            end
          else
            begin
              reg55 <= $unsigned($unsigned($signed(wire49[(4'hb):(4'ha)])));
              reg56 <= wire50;
              reg57 <= (&(($unsigned((reg61 ^~ reg56)) + wire52[(2'h2):(2'h2)]) != ((reg57 << reg56) <= ((reg58 ~^ wire53) ?
                  $unsigned(wire49) : (^wire52)))));
              reg58 <= $signed(wire53[(2'h2):(1'h0)]);
              reg59 <= (wire54[(1'h0):(1'h0)] >= ($signed(($signed(reg61) ^~ $signed(reg60))) ?
                  ((wire50[(4'hb):(1'h1)] < reg56[(4'hd):(4'hc)]) >> (~{reg60,
                      (7'h44)})) : $unsigned($unsigned(reg61[(3'h7):(1'h0)]))));
            end
          reg60 <= ((wire49[(3'h7):(1'h1)] ?
                  wire50 : ($unsigned($signed(wire52)) >= ({reg61} ?
                      {wire51, (8'hb9)} : reg55[(5'h14):(1'h1)]))) ?
              $unsigned((({wire50} != wire53) ~^ (7'h40))) : {$signed($unsigned(wire49)),
                  wire49[(3'h5):(3'h4)]});
          reg61 <= wire54[(4'h8):(1'h1)];
          reg62 <= $signed(wire49[(1'h1):(1'h1)]);
        end
      reg63 <= (-$signed(((!(^~reg61)) < (reg58[(4'h8):(3'h6)] ?
          reg56[(4'hb):(2'h3)] : (8'haa)))));
      reg64 <= $signed((|({reg59[(4'hb):(1'h0)], {reg63}} ?
          (8'hb7) : (8'ha4))));
      if ($unsigned((wire52[(1'h0):(1'h0)] ?
          ((^{wire54}) ?
              (^~(reg55 ?
                  wire53 : reg55)) : reg63[(2'h2):(2'h2)]) : (reg59 & reg59))))
        begin
          if ({((reg55 ?
                  ($signed(reg60) ?
                      {reg56,
                          (8'ha3)} : $signed((7'h41))) : ((reg58 >> reg64) & (8'ha5))) ~^ $signed(reg62)),
              (!(~{reg61[(4'hb):(3'h4)], {wire49}}))})
            begin
              reg65 <= (&$unsigned(reg60[(1'h1):(1'h0)]));
              reg66 <= {reg59[(4'h8):(3'h5)]};
            end
          else
            begin
              reg65 <= reg66[(1'h1):(1'h0)];
              reg66 <= wire50;
              reg67 <= ($signed(reg59[(1'h0):(1'h0)]) && wire53[(5'h14):(5'h14)]);
              reg68 <= reg64[(4'hc):(4'h9)];
              reg69 <= (8'ha7);
            end
          reg70 <= ((-$unsigned(($unsigned(wire50) ?
                  (-reg62) : reg60[(5'h12):(4'he)]))) ?
              ((8'hae) ?
                  wire52[(1'h0):(1'h0)] : (reg67[(1'h0):(1'h0)] == ($unsigned(reg67) == $signed(reg64)))) : (^($unsigned({wire54}) ?
                  ((reg61 * (8'hab)) || $signed(reg65)) : (8'hb5))));
          reg71 <= ((|wire51[(2'h2):(1'h1)]) ?
              (|(~|((wire50 ? reg58 : (7'h43)) ?
                  (~wire52) : $signed(wire51)))) : (reg56 && (($unsigned(reg56) << (reg66 ^~ reg57)) * ($signed(reg57) & (&(8'h9e))))));
          reg72 <= $signed($signed(wire49));
          reg73 <= ((($unsigned((^~reg66)) < reg60[(4'he):(4'hd)]) & (~|$unsigned($signed(reg57)))) ?
              reg68[(3'h4):(2'h2)] : (reg60 ?
                  reg60[(3'h7):(3'h7)] : (wire51[(3'h4):(3'h4)] <= reg70)));
        end
      else
        begin
          reg65 <= {(~|reg55[(4'h9):(3'h4)]),
              (reg57 ?
                  (reg72[(3'h5):(3'h4)] ?
                      reg69[(3'h6):(1'h0)] : (^{reg58,
                          reg61})) : (~&(reg57[(1'h0):(1'h0)] ?
                      (reg66 <<< reg57) : (reg72 ? reg65 : reg61))))};
          if ($signed($unsigned(reg59)))
            begin
              reg66 <= (-({reg61[(2'h2):(2'h2)]} == (wire49 ?
                  ($signed(reg73) == reg62) : ((^reg62) <= (&reg73)))));
              reg67 <= $signed(reg58[(4'hc):(4'h8)]);
            end
          else
            begin
              reg66 <= {reg66[(4'h9):(1'h0)]};
            end
        end
      reg74 <= reg61[(4'h8):(2'h3)];
    end
  assign wire75 = reg69;
  assign wire76 = reg68;
  assign wire77 = (~&$unsigned((+$unsigned(wire52))));
  assign wire78 = reg70;
  assign wire79 = (({{reg71}, {reg59, (8'hbb)}} && wire52[(1'h1):(1'h1)]) ?
                      $unsigned(((~^(&wire50)) ?
                          wire50 : (|(wire76 != reg61)))) : (-reg74));
  always
    @(posedge clk) begin
      reg80 <= (((reg67[(4'h9):(3'h4)] * $signed(wire52[(1'h0):(1'h0)])) ?
              wire53 : ($unsigned(reg69) ^ (8'hab))) ?
          (~^(-{(reg71 && (8'hb7)),
              (!reg56)})) : $signed((^(^$signed(reg60)))));
    end
  assign wire81 = (~&$signed($unsigned($signed($unsigned(wire77)))));
  assign wire82 = ($signed(((&reg58) ? reg57 : reg64)) < reg67[(2'h2):(1'h1)]);
  assign wire83 = ($signed((~^wire79[(3'h5):(1'h1)])) ?
                      (reg73[(4'h9):(3'h7)] ?
                          (+({reg64, reg73} ?
                              $signed(reg59) : $unsigned(reg69))) : (wire49[(3'h4):(1'h1)] ?
                              (8'ha0) : wire53)) : wire79[(3'h5):(2'h2)]);
  assign wire84 = (wire81 != (^wire49[(5'h13):(1'h0)]));
  assign wire85 = {$signed(wire75), (~^wire78)};
  always
    @(posedge clk) begin
      reg86 <= $signed(reg68);
    end
  assign wire87 = reg66;
endmodule

module module113
#(parameter param166 = (((8'haa) >>> ({(~|(8'hb7))} ? (^~(!(8'hb0))) : (((8'hb3) != (8'hb0)) ^~ ((8'haf) ? (8'hb7) : (8'hae))))) ? ((((!(8'ha4)) ? {(8'hbf), (8'ha2)} : (&(8'hb1))) <<< (((7'h42) >= (8'ha5)) > (+(8'hba)))) != (({(8'hbe), (7'h43)} ? ((8'h9f) ? (8'hac) : (8'h9d)) : ((8'ha5) ? (8'ha6) : (8'h9d))) > ((^~(8'hbd)) <<< ((8'haa) ? (8'h9e) : (8'had))))) : ({(+((8'hb4) != (8'hb2)))} ? ((!{(8'ha2), (8'hb6)}) ~^ ((|(8'hb6)) >> {(8'hbe)})) : (^~(|{(8'ha1), (7'h41)})))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire117;
  input wire signed [(5'h13):(1'h0)] wire116;
  input wire [(4'hb):(1'h0)] wire115;
  input wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire163;
  wire signed [(3'h5):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg161,
                 reg160,
                 reg159,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire118 = wire117[(2'h2):(1'h0)];
  assign wire119 = (wire116 ? $signed(wire115) : wire118[(1'h0):(1'h0)]);
  assign wire120 = ((($unsigned((+wire115)) ?
                       (8'h9e) : wire115) >= {(+(wire119 ? wire118 : wire116)),
                       (wire118[(2'h2):(1'h0)] ?
                           (wire118 & wire115) : wire118[(2'h3):(1'h1)])}) | wire115);
  assign wire121 = wire116;
  assign wire122 = $unsigned(((|$unsigned(wire115[(4'h9):(3'h4)])) ^ (^~$signed((wire121 & wire117)))));
  assign wire123 = wire121;
  always
    @(posedge clk) begin
      reg124 <= wire119[(4'he):(3'h5)];
      reg125 <= (|({(~^(8'haf))} * $signed($signed(wire118[(3'h4):(1'h1)]))));
      if (reg125[(2'h2):(1'h1)])
        begin
          reg126 <= $signed((wire118 ?
              wire120 : ($signed((|wire115)) ?
                  (wire114 > $signed(reg124)) : ((reg124 ?
                      (8'hbd) : wire122) != wire123[(4'ha):(3'h6)]))));
          reg127 <= ({($unsigned((wire118 ?
                  reg126 : (7'h43))) | $unsigned((wire116 > wire114)))} >>> $signed($signed((8'h9c))));
          reg128 <= $unsigned(reg124[(1'h1):(1'h0)]);
          reg129 <= ((wire118[(2'h2):(1'h0)] + $unsigned({reg125[(1'h0):(1'h0)]})) ?
              wire122 : $unsigned(wire118[(3'h4):(3'h4)]));
          reg130 <= ($signed((|$signed(((8'hbd) ? reg125 : wire115)))) ?
              (((wire123[(4'hb):(2'h3)] ?
                      ((8'h9e) - wire123) : (reg127 ? wire114 : reg128)) ?
                  (wire120[(3'h6):(3'h6)] <= wire115) : wire123[(3'h4):(2'h3)]) >= $signed(reg125[(1'h0):(1'h0)])) : ($signed($unsigned(((8'hb5) & (8'ha9)))) ?
                  ($unsigned((wire120 ^ reg128)) ?
                      (wire123 ?
                          (|reg124) : (reg129 || reg127)) : (8'hbe)) : $unsigned(((~^reg124) ^~ wire123[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg126 <= (wire115[(2'h3):(2'h3)] ?
              $signed((!wire121)) : $signed(reg129[(1'h1):(1'h1)]));
          if ({($unsigned(((&(8'h9c)) > $unsigned((8'hb8)))) >= (reg130[(4'ha):(4'h8)] ?
                  (((7'h40) ?
                      reg130 : wire115) < reg128[(1'h0):(1'h0)]) : wire119[(1'h1):(1'h0)]))})
            begin
              reg127 <= $signed(($unsigned($signed((reg130 ?
                      reg125 : wire118))) ?
                  $unsigned({$unsigned(wire122),
                      wire123[(4'h9):(2'h2)]}) : (wire119[(1'h1):(1'h1)] == (wire115 ?
                      (!wire116) : $unsigned(reg127)))));
              reg128 <= (reg126[(2'h3):(1'h0)] + $unsigned((&(&(reg128 ?
                  wire123 : (8'h9c))))));
              reg129 <= wire114[(4'ha):(3'h4)];
            end
          else
            begin
              reg127 <= reg126[(1'h0):(1'h0)];
            end
          reg130 <= (reg129[(4'h8):(3'h5)] ?
              $signed($unsigned(wire121[(2'h2):(1'h0)])) : $signed($unsigned($signed($signed((8'hac))))));
          if ((wire117 >>> (!wire119[(2'h3):(2'h2)])))
            begin
              reg131 <= $unsigned(wire115[(2'h3):(2'h2)]);
              reg132 <= ($signed($unsigned(((reg130 ?
                  wire115 : wire119) <<< $unsigned(wire123)))) >= $signed(($unsigned(wire115) ?
                  {wire119, $signed(wire122)} : $signed((^reg127)))));
              reg133 <= ($unsigned($signed((wire115[(4'h9):(4'h8)] >= (wire123 ?
                      reg132 : reg131)))) ?
                  reg125[(2'h3):(2'h3)] : reg125[(2'h2):(1'h1)]);
              reg134 <= $unsigned($unsigned(reg126[(3'h5):(2'h3)]));
              reg135 <= reg132[(3'h7):(1'h1)];
            end
          else
            begin
              reg131 <= $unsigned($unsigned((8'hae)));
              reg132 <= (reg127[(1'h1):(1'h0)] ?
                  $signed($unsigned(reg132[(2'h2):(2'h2)])) : {($unsigned($unsigned((8'hbe))) ?
                          wire123 : (!wire122)),
                      reg128[(2'h2):(1'h0)]});
              reg133 <= wire121;
            end
          reg136 <= (8'hb6);
        end
      if ($unsigned(((7'h40) ? wire114 : (^wire119[(1'h0):(1'h0)]))))
        begin
          if (wire116[(4'hb):(4'ha)])
            begin
              reg137 <= $unsigned(reg126[(3'h5):(3'h4)]);
              reg138 <= $signed(({reg127[(1'h1):(1'h0)]} ?
                  $unsigned(wire123) : reg136));
              reg139 <= (!({(~|$unsigned(wire119)), (|wire121)} - (8'h9d)));
            end
          else
            begin
              reg137 <= (reg133 ?
                  {reg124[(1'h0):(1'h0)]} : $unsigned($signed({(reg127 <<< reg124)})));
              reg138 <= (!(wire120[(2'h3):(1'h1)] ?
                  $signed(($unsigned((8'hbc)) ?
                      (reg133 ? (8'hb8) : reg129) : {wire117,
                          reg126})) : wire117[(4'h8):(1'h0)]));
              reg139 <= (&{$signed((^~(reg131 < reg133)))});
            end
          reg140 <= ($unsigned((~^(~wire115[(1'h0):(1'h0)]))) == ($signed(((8'ha9) ?
              reg126[(3'h6):(1'h0)] : $signed(reg133))) | (wire115[(4'hb):(4'ha)] ^~ (8'hae))));
          if (($unsigned((-$unsigned(reg126))) || $unsigned(reg131[(2'h2):(1'h1)])))
            begin
              reg141 <= $signed((8'hbc));
              reg142 <= (wire116 ?
                  {$unsigned(reg131)} : $signed(($signed($unsigned(reg132)) ?
                      {$signed(reg132)} : $unsigned({reg135, reg139}))));
              reg143 <= reg128;
              reg144 <= (({(7'h43)} ?
                      (~|(&$signed(wire123))) : $signed(($unsigned(reg142) ?
                          {(8'ha1), reg133} : (wire119 ? (8'hb3) : reg133)))) ?
                  wire117 : (reg136 ? $signed({$signed(reg125)}) : reg135));
              reg145 <= wire117[(2'h3):(1'h1)];
            end
          else
            begin
              reg141 <= reg137[(5'h10):(3'h6)];
              reg142 <= $signed(reg128);
            end
          reg146 <= (|(^~reg140[(1'h1):(1'h1)]));
          reg147 <= ($signed($unsigned((-reg124[(1'h1):(1'h1)]))) && $unsigned(wire115));
        end
      else
        begin
          reg137 <= reg137;
          reg138 <= (wire122[(4'hb):(4'hb)] + (&$unsigned(reg136)));
          if ((8'ha4))
            begin
              reg139 <= (!reg138[(4'h8):(2'h3)]);
            end
          else
            begin
              reg139 <= reg134[(2'h3):(1'h1)];
              reg140 <= $unsigned($unsigned($unsigned((+reg135[(3'h5):(2'h2)]))));
              reg141 <= $signed($signed($unsigned((reg140 * (reg126 ?
                  reg136 : reg126)))));
              reg142 <= $signed({((&$unsigned(reg141)) ?
                      {(reg133 * reg127)} : $unsigned($unsigned(reg138)))});
            end
          if (reg127[(1'h0):(1'h0)])
            begin
              reg143 <= ((^reg128) ?
                  (8'had) : $signed(((|(!reg135)) >> $unsigned(reg146))));
            end
          else
            begin
              reg143 <= $signed(((&((reg138 <= reg133) ?
                  {(8'ha0),
                      reg125} : (&reg136))) || $unsigned((wire115[(3'h7):(2'h2)] >>> {reg130}))));
              reg144 <= ({reg147,
                  ((((7'h44) ? wire114 : reg135) ?
                          wire116[(4'he):(4'h9)] : $signed(wire123)) ?
                      reg125[(2'h2):(1'h1)] : (8'hb5))} - ((((reg133 ?
                          wire117 : reg139) ?
                      (reg133 ? reg131 : reg131) : $unsigned(reg126)) ?
                  ((~^wire122) ?
                      reg138 : $signed(reg139)) : $signed(reg139)) || $signed($signed($unsigned(wire119)))));
              reg145 <= $unsigned({(&(reg139 ? {(8'ha2), reg125} : (~|reg140))),
                  $unsigned(reg129)});
            end
        end
    end
  always
    @(posedge clk) begin
      reg148 <= ((~|(~^($unsigned(reg131) ?
          (8'hbb) : $unsigned((8'hb2))))) < ($signed($unsigned(reg146)) ?
          reg141[(1'h1):(1'h1)] : $signed(((reg128 ?
              reg127 : reg130) | (reg126 - reg146)))));
      reg149 <= ($signed(wire119[(4'h9):(3'h4)]) ?
          ({reg131[(3'h6):(3'h5)]} * (!(+{reg125}))) : reg127);
      reg150 <= (&$unsigned($unsigned(((reg148 >>> reg127) | $signed(wire119)))));
      reg151 <= ((({(reg125 != reg143)} ? {wire118} : (~&$unsigned((8'hb2)))) ?
              (&$unsigned($signed(reg136))) : $unsigned($signed(reg127[(2'h3):(1'h1)]))) ?
          (^~(~|(~reg124[(2'h2):(1'h1)]))) : (reg128[(1'h1):(1'h0)] ?
              (((reg141 ? reg127 : reg128) && $signed(reg133)) ?
                  ((reg135 ? wire118 : reg124) ?
                      (8'ha5) : (reg138 ?
                          reg139 : (8'had))) : $unsigned((~&reg148))) : ($unsigned($unsigned(reg134)) ?
                  reg137 : $signed($signed((8'hbe))))));
      reg152 <= wire122;
    end
  assign wire153 = wire115[(1'h1):(1'h0)];
  assign wire154 = wire115[(4'ha):(4'ha)];
  assign wire155 = reg144;
  assign wire156 = $signed((wire121 ?
                       $unsigned({$signed(wire115),
                           (~&(8'hbe))}) : $unsigned(((-(8'hbf)) ?
                           $unsigned(reg126) : $unsigned((8'hbe))))));
  assign wire157 = reg127;
  assign wire158 = $unsigned($signed({(+$signed(wire118)),
                       ({(8'hb4), wire123} == $unsigned((8'h9c)))}));
  always
    @(posedge clk) begin
      reg159 <= reg126[(4'h8):(3'h4)];
      reg160 <= $signed((((reg135 ? wire116 : (&wire114)) ?
          $unsigned($unsigned(reg132)) : wire114[(3'h5):(2'h2)]) - wire118[(2'h3):(1'h1)]));
      reg161 <= ({$unsigned(reg141[(2'h2):(2'h2)])} ?
          $unsigned($signed(wire118)) : (((reg126[(1'h1):(1'h1)] ?
                  (8'ha4) : wire154) ?
              ({reg136} ?
                  reg135[(3'h6):(2'h3)] : (reg151 ?
                      wire119 : (8'haf))) : reg138[(3'h6):(2'h3)]) >= reg124));
    end
  assign wire162 = ((+(|((+reg124) ?
                       $signed(wire123) : $signed(wire157)))) << ((~&$signed($signed(wire155))) * $signed($signed((^wire157)))));
  assign wire163 = reg145[(4'hb):(3'h6)];
  assign wire164 = reg152;
  assign wire165 = reg141[(4'h9):(2'h3)];
endmodule
