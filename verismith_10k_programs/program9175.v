module top
#(parameter param111 = ((&(!(((8'hba) ? (8'ha1) : (8'h9f)) ? (8'hb3) : ((8'hb1) >> (8'hbf))))) * ((!(((8'hac) ? (8'hb5) : (8'hb2)) || {(8'ha4), (8'hb6)})) + (({(7'h44)} == ((8'hb3) ? (8'hb1) : (8'ha0))) - (|((8'hbf) ? (7'h44) : (7'h44)))))), 
parameter param112 = (~^((~((param111 + param111) > (8'hb3))) ? param111 : (param111 << param111))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire103;
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire5,
                 wire6,
                 wire7,
                 wire16,
                 wire17,
                 wire103,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (+(wire1 ?
                     ($signed((wire5 >>> wire0)) - wire2[(4'h8):(3'h7)]) : $unsigned($unsigned(wire5))));
  assign wire7 = ((wire4[(4'h8):(3'h4)] ?
                     (wire6[(1'h0):(1'h0)] ?
                         {$unsigned((8'h9d))} : ((~^wire4) >= ((8'hac) ?
                             wire0 : wire6))) : (~&$unsigned(wire2[(4'ha):(1'h0)]))) + $signed($signed({(~&wire0)})));
  always
    @(posedge clk) begin
      reg8 <= ((8'h9e) << wire0);
      if (($unsigned(wire6[(1'h1):(1'h1)]) ?
          $unsigned((wire4[(3'h5):(1'h0)] ?
              $signed((reg8 ^ wire1)) : $signed((wire5 && (8'hb0))))) : (|wire7[(1'h1):(1'h0)])))
        begin
          reg9 <= $unsigned(wire6[(2'h3):(2'h3)]);
          reg10 <= (wire5[(5'h10):(4'hc)] >> reg9);
        end
      else
        begin
          reg9 <= ((~&($unsigned((reg10 ? wire3 : wire7)) ?
                  {$signed(reg10), {wire1}} : $signed((8'hbf)))) ?
              {reg10} : wire1);
          reg10 <= wire5[(4'he):(2'h3)];
          reg11 <= ((8'hb2) & (+$unsigned((wire4[(3'h6):(1'h0)] ?
              $unsigned(wire1) : (wire7 || wire4)))));
          if ((((+($unsigned((8'hbc)) == $signed(wire3))) ?
                  $unsigned((reg9[(2'h3):(1'h1)] ?
                      (wire2 ? wire4 : (7'h41)) : wire6)) : reg9) ?
              wire4 : {((!reg11[(3'h7):(3'h7)]) ?
                      $unsigned(wire2) : {(wire2 ^ reg10)}),
                  (8'h9c)}))
            begin
              reg12 <= ((~&$unsigned((&$signed(reg8)))) ?
                  wire4 : (!($unsigned({(7'h42),
                      wire6}) << $unsigned((8'ha6)))));
              reg13 <= $signed(wire4[(1'h1):(1'h1)]);
              reg14 <= $signed($signed(wire5[(4'he):(4'h8)]));
            end
          else
            begin
              reg12 <= (!(-(^~(((8'hae) ? reg12 : wire0) ?
                  wire1[(2'h3):(1'h1)] : (!(8'hac))))));
              reg13 <= {$unsigned(($unsigned((wire4 | wire7)) <<< {(reg8 ?
                          wire3 : reg11),
                      (reg12 ? wire6 : wire7)}))};
            end
        end
      reg15 <= $unsigned({wire0});
    end
  assign wire16 = reg15[(3'h4):(3'h4)];
  assign wire17 = $signed((~|reg13[(4'ha):(3'h5)]));
  module18 #() modinst104 (wire103, clk, wire1, wire0, wire7, reg11);
  assign wire105 = (|{(|$signed((wire3 ? wire103 : reg14))),
                       $unsigned($unsigned((^wire3)))});
  assign wire106 = $unsigned((~&(8'hb7)));
  assign wire107 = wire16;
  assign wire108 = $unsigned({(~wire106[(3'h7):(3'h7)])});
  assign wire109 = (-$signed(wire105));
  assign wire110 = {(-(wire7 >> ((!reg11) ? wire16[(2'h2):(1'h0)] : reg12)))};
endmodule

module module18
#(parameter param102 = (~&(-((((8'hbf) ? (8'h9f) : (7'h40)) < ((8'hb9) ? (8'h9e) : (8'ha3))) ? {((8'ha2) ? (8'hae) : (8'hba))} : (((8'hba) >>> (8'hb9)) != ((8'h9d) << (8'ha5)))))))
(y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire77;
  assign y = {wire101,
                 wire99,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire58,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire77,
                 (1'h0)};
  assign wire23 = ((({wire19} ? wire22[(1'h1):(1'h1)] : wire21[(2'h3):(1'h0)]) ?
                      wire21 : wire19) << $unsigned($signed(wire19)));
  assign wire24 = $signed(wire20[(4'hf):(3'h4)]);
  assign wire25 = wire21;
  assign wire26 = wire24;
  assign wire27 = wire23;
  assign wire28 = ((|(wire24[(1'h0):(1'h0)] == (wire22[(3'h4):(3'h4)] - {wire19,
                      wire19}))) <<< wire20[(4'hf):(3'h4)]);
  assign wire29 = (^~$unsigned($unsigned(wire27)));
  assign wire30 = wire20[(3'h7):(1'h0)];
  assign wire31 = (($unsigned(((8'hb5) ?
                          wire22 : wire30[(1'h0):(1'h0)])) >>> $signed((&$unsigned(wire29)))) ?
                      $unsigned(wire29) : wire27);
  assign wire32 = wire22[(2'h3):(2'h3)];
  assign wire33 = (~^wire20);
  module34 #() modinst59 (wire58, clk, wire32, wire19, wire27, wire28);
  assign wire60 = $signed({$unsigned($signed(((8'hac) + wire25))),
                      $signed(wire21[(2'h3):(1'h1)])});
  assign wire61 = ((~|($unsigned($unsigned(wire33)) ?
                      wire33 : ((wire32 ? (7'h41) : wire32) ?
                          wire60[(4'h8):(1'h1)] : wire31))) * (((wire25[(4'ha):(3'h6)] ?
                          $unsigned(wire23) : (wire58 ?
                              wire32 : wire31)) * (~&$signed(wire22))) ?
                      $unsigned(wire29) : wire24));
  assign wire62 = ((8'ha3) || (wire26 ?
                      (~^({(8'ha8)} ?
                          wire22 : $unsigned(wire30))) : {((^wire25) == $signed(wire58)),
                          $signed({(8'hbd), (8'hba)})}));
  assign wire63 = {{$signed($unsigned($signed((8'hb9))))}};
  assign wire64 = $unsigned($unsigned(((~|(wire31 > wire32)) ?
                      (~&$signed((8'hb2))) : $signed((^~wire27)))));
  module65 #() modinst78 (wire77, clk, wire20, wire32, wire27, wire33, wire23);
  module79 #() modinst100 (.wire80(wire27), .wire83(wire23), .wire82(wire64), .y(wire99), .clk(clk), .wire81(wire20));
  assign wire101 = ($unsigned((wire22[(1'h0):(1'h0)] && {((8'hbe) ?
                           (8'haa) : wire31),
                       $unsigned(wire27)})) + ($unsigned(wire29[(2'h2):(1'h0)]) ?
                       wire23[(3'h6):(3'h6)] : ($unsigned((wire77 ?
                               wire62 : wire31)) ?
                           wire27[(4'he):(3'h7)] : wire32)));
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire83;
  input wire [(5'h15):(1'h0)] wire82;
  input wire [(2'h3):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire84;
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire92,
                 wire91,
                 wire84,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire84 = wire82[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg85 <= $signed(wire83);
      reg86 <= ((&(!wire81)) ^~ (~({(^wire84), $signed(wire83)} - ((wire80 ?
          wire84 : wire84) && (~(8'hae))))));
      if ($unsigned($unsigned(($unsigned($unsigned(wire81)) | $signed($unsigned((8'h9e)))))))
        begin
          reg87 <= ($signed((!$unsigned($signed((8'haf))))) ?
              wire80 : wire81[(1'h1):(1'h1)]);
          reg88 <= {reg87[(2'h2):(2'h2)], reg85};
          reg89 <= ($unsigned((((|reg87) >>> ((8'hb3) ?
                  reg86 : (8'hb7))) > reg87)) ?
              {($signed(wire83) && (^(wire82 ?
                      wire82 : wire82)))} : (|(($signed(reg88) ?
                  (wire83 << wire80) : reg87) & reg87)));
        end
      else
        begin
          reg87 <= (~wire83);
          reg88 <= reg87[(1'h1):(1'h0)];
        end
      reg90 <= $signed($unsigned((((wire81 & wire83) ?
          {reg88, (8'hb7)} : $unsigned((8'ha0))) ^~ reg86[(2'h3):(1'h1)])));
    end
  assign wire91 = $unsigned($unsigned(($unsigned(reg90[(5'h13):(1'h0)]) ?
                      reg86 : (~&(reg88 ? reg85 : wire81)))));
  assign wire92 = (((|(!$signed(wire84))) ^~ ($unsigned($unsigned(wire81)) ?
                          (reg88 ?
                              (|wire80) : (wire84 & (8'haa))) : (|reg87[(2'h2):(2'h2)]))) ?
                      (7'h44) : ($signed($unsigned(wire80)) ?
                          {$signed($unsigned(reg89)),
                              $unsigned((reg90 >= wire82))} : reg85[(4'hc):(4'h8)]));
  always
    @(posedge clk) begin
      reg93 <= reg86[(1'h0):(1'h0)];
      reg94 <= ((&$unsigned($signed($unsigned(wire80)))) > (wire84[(4'hb):(1'h0)] + reg89));
      reg95 <= $signed(((reg86 == ((^wire81) <= (reg86 ?
          wire91 : reg89))) == wire84));
      reg96 <= $unsigned($signed((($unsigned(reg90) ? reg85 : reg88) ?
          (&wire84) : (((7'h40) ? reg86 : wire81) ?
              reg88[(1'h0):(1'h0)] : wire91[(3'h6):(3'h6)]))));
    end
  assign wire97 = ((|(!$unsigned((wire82 || wire84)))) >= (|(~|({wire83} || {wire82}))));
  assign wire98 = {(reg87 >>> reg96)};
endmodule

module module65
#(parameter param75 = (+(({((8'haf) ~^ (8'ha1)), ((8'hbd) == (7'h44))} ? {(~(8'h9f)), ((8'hac) ? (8'hbf) : (8'ha8))} : ((^~(8'ha3)) ? ((8'hb8) ? (7'h43) : (8'hb3)) : (8'ha8))) ? ({(~^(8'hba)), {(8'hb1)}} ? (^~{(8'hbe), (8'hbd)}) : ((|(8'hb4)) | ((8'hbd) ? (7'h40) : (8'ha7)))) : (~|((~&(8'hbb)) ? (~^(8'hbd)) : ((8'hb3) <<< (8'hb8)))))), 
parameter param76 = (8'hb6))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire [(4'h8):(1'h0)] wire67;
  input wire signed [(4'hd):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  assign y = {wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = $signed({wire68[(4'hc):(4'hb)]});
  assign wire72 = ($unsigned(wire67[(3'h4):(2'h3)]) - ((&(wire70 + (wire68 ?
                          wire69 : (8'hb1)))) ?
                      $signed($signed(wire67[(1'h0):(1'h0)])) : wire67));
  assign wire73 = (-$unsigned(wire71));
  assign wire74 = $unsigned($unsigned((+(^(|(8'hb3))))));
endmodule

module module34
#(parameter param56 = (^((&(8'haa)) - (~^(((8'ha0) ^~ (8'ha0)) ? (-(8'hb4)) : ((8'hb0) == (8'hbe)))))), 
parameter param57 = {({((~&param56) && (param56 ? (8'hb5) : param56)), (param56 ? (&param56) : param56)} ~^ param56)})
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire [(5'h10):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  reg [(4'he):(1'h0)] reg42 = (1'h0);
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
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 reg42,
                 (1'h0)};
  assign wire39 = wire36;
  assign wire40 = (-(wire38 ?
                      {((-wire35) ? (wire38 ? wire36 : wire35) : (8'hbf)),
                          $unsigned(wire39[(2'h2):(1'h1)])} : $unsigned(($unsigned(wire36) <= $unsigned(wire36)))));
  assign wire41 = $signed((^$unsigned($unsigned((^wire38)))));
  always
    @(posedge clk) begin
      reg42 <= ({($unsigned((^wire40)) && $signed($unsigned(wire38))),
              (~$unsigned($unsigned(wire39)))} ?
          ($unsigned((8'hac)) ?
              $unsigned(wire36[(1'h1):(1'h1)]) : wire39[(3'h4):(1'h1)]) : $signed((($unsigned(wire38) ?
              (wire39 || wire38) : wire39[(3'h4):(2'h3)]) >>> wire38[(4'hb):(4'ha)])));
    end
  assign wire43 = (((wire35[(4'h8):(2'h3)] | wire37[(3'h6):(2'h3)]) ?
                      reg42 : $unsigned(wire41[(3'h5):(3'h5)])) >>> (~reg42[(4'ha):(3'h4)]));
  assign wire44 = (wire43 ? $unsigned(wire38) : wire41);
  assign wire45 = reg42;
  assign wire46 = (wire43 ?
                      $unsigned(($unsigned((wire39 ?
                          reg42 : (8'hb4))) * wire39)) : (wire41 ?
                          $unsigned((!$signed(wire37))) : wire37));
  assign wire47 = ((!wire39) >> (wire35 & $signed($unsigned(wire40))));
  assign wire48 = $signed(wire45);
  assign wire49 = $signed($unsigned(wire44));
  assign wire50 = (~^((!reg42) == $signed(wire44)));
  assign wire51 = (~&(wire35 ^ wire35[(5'h10):(4'ha)]));
  assign wire52 = $signed($signed($signed((~|$signed(wire49)))));
  assign wire53 = $unsigned((wire39 ^~ wire43[(4'h8):(4'h8)]));
  assign wire54 = {({wire47} ?
                          wire43[(3'h5):(1'h1)] : (wire46 ?
                              $signed(((8'haa) ?
                                  (7'h44) : (8'hae))) : wire41[(3'h4):(1'h1)])),
                      (~($unsigned(wire43[(3'h4):(2'h3)]) ?
                          {$signed(wire38), wire41} : $unsigned((~&wire41))))};
  assign wire55 = wire44[(4'hf):(4'he)];
endmodule
