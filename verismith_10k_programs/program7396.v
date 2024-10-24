module top
#(parameter param115 = ((((((8'hae) <<< (8'ha9)) ? ((8'had) ? (8'ha1) : (8'ha2)) : (-(8'hb4))) && {((7'h42) ^ (8'ha7))}) >= ((&((7'h44) >>> (8'hb7))) >> ((^(8'hab)) && {(8'hb2)}))) ? ((((~(8'haa)) ? (^~(8'ha9)) : (!(8'hb9))) ? ((8'h9d) + (~(8'hbc))) : (|((8'hb2) ? (8'hbb) : (8'haf)))) ? (~({(8'hb4), (8'hb2)} ? {(8'ha5), (8'hbb)} : ((7'h40) ? (7'h41) : (8'ha7)))) : (!{((7'h40) | (8'ha9))})) : (!(^(^~(~(7'h42)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire114,
                 wire112,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed((^~((8'ha9) ?
                     {$signed(wire3),
                         (wire1 ^ wire2)} : wire3[(3'h4):(1'h1)])));
  assign wire5 = wire0;
  assign wire6 = ($signed(((wire4 != $signed(wire0)) ?
                     wire3[(2'h2):(2'h2)] : wire5[(2'h2):(2'h2)])) || $signed($signed(wire3[(3'h6):(3'h4)])));
  module7 #() modinst78 (.y(wire77), .clk(clk), .wire10(wire0), .wire9(wire2), .wire11(wire5), .wire8(wire1));
  assign wire79 = (~|(wire2 ?
                      wire2[(4'hd):(4'h8)] : ($signed((wire4 & wire4)) >> wire1)));
  assign wire80 = $unsigned((^$unsigned(($unsigned(wire6) >>> (~|wire79)))));
  assign wire81 = wire1;
  assign wire82 = wire80[(4'ha):(4'h8)];
  module83 #() modinst113 (wire112, clk, wire6, wire79, wire2, wire77);
  assign wire114 = $signed({$signed($unsigned((wire80 ? wire5 : wire6))),
                       $signed(wire77[(4'hd):(4'hc)])});
endmodule

module module83
#(parameter param111 = (((({(7'h42), (8'ha2)} - (7'h40)) ? (((8'hb9) ^~ (8'ha9)) ? {(8'ha8), (7'h40)} : ((8'h9f) <= (8'haf))) : (((8'hb7) != (8'ha5)) ? {(8'ha7)} : ((8'hbb) ^~ (8'ha6)))) << (~(~^((7'h44) - (8'ha2))))) ? (((|{(8'ha9), (8'hb3)}) < (+{(8'ha1)})) ? ({((8'had) == (8'h9c))} ? (((8'ha3) && (8'hb4)) + ((8'had) ? (8'ha5) : (8'ha5))) : (((8'hbc) ? (8'ha0) : (8'hb5)) & {(8'hbc), (8'h9c)})) : (((^(8'had)) ? {(7'h40), (8'ha2)} : ((7'h42) != (7'h44))) ? (((8'hb8) >= (8'ha5)) ? {(8'hb1)} : ((8'hb5) * (8'hbc))) : (&((8'hba) << (8'hb4))))) : (!((((8'hbd) ? (8'hb2) : (8'ha5)) ~^ ((8'hb9) < (8'hac))) ? {(^(8'ha7)), (~|(8'hbf))} : ({(8'hb6), (8'hb3)} ? ((8'ha6) ? (8'hb1) : (8'h9f)) : (&(8'ha6)))))))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire87;
  input wire [(3'h7):(1'h0)] wire86;
  input wire [(5'h10):(1'h0)] wire85;
  input wire [(5'h13):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg88 <= ($signed((((8'haf) >= (wire86 >>> wire85)) | wire85)) >= {wire84,
          wire85[(2'h2):(1'h1)]});
      reg89 <= wire86;
      if ($signed($unsigned(wire87)))
        begin
          reg90 <= wire85[(3'h4):(3'h4)];
          reg91 <= $signed(((-reg89) ?
              {wire86[(2'h3):(2'h2)]} : (|$unsigned($signed(reg89)))));
          reg92 <= $unsigned($signed(wire86));
          reg93 <= wire85;
        end
      else
        begin
          reg90 <= wire86;
          if (reg92)
            begin
              reg91 <= $signed(($unsigned((~&(reg92 ? reg91 : wire86))) ?
                  {$signed(reg93),
                      $signed({wire85, wire85})} : (+((wire85 - reg93) ?
                      $unsigned((8'ha6)) : wire84))));
              reg92 <= (wire84[(5'h10):(1'h0)] ?
                  ($unsigned({reg93}) * $unsigned((8'hbb))) : $unsigned((^~$unsigned((8'haf)))));
              reg93 <= ((($unsigned((reg91 || wire87)) ?
                      (^reg92[(1'h0):(1'h0)]) : (8'hbf)) ?
                  $signed({$unsigned(wire85),
                      reg89[(2'h2):(1'h1)]}) : ($signed($unsigned((8'hb5))) ?
                      ($signed((8'h9f)) ^ (reg89 & wire86)) : reg91)) & (~&wire84[(3'h6):(3'h5)]));
              reg94 <= $unsigned(($signed(wire86) << reg92));
              reg95 <= wire84[(4'he):(4'h9)];
            end
          else
            begin
              reg91 <= (~&wire87);
              reg92 <= {$unsigned(((reg90 ?
                      $unsigned(reg93) : reg89[(3'h6):(1'h1)]) > $unsigned(reg91[(3'h7):(2'h2)])))};
              reg93 <= ($signed($unsigned($signed({reg90}))) < reg88);
              reg94 <= reg93;
              reg95 <= $unsigned((reg94[(4'he):(4'hc)] ?
                  reg89[(3'h7):(3'h5)] : $unsigned((~reg94))));
            end
          reg96 <= wire84[(4'ha):(3'h6)];
        end
    end
  assign wire97 = $signed($unsigned(((-(reg90 ?
                      wire84 : reg91)) ^~ $unsigned(reg96))));
  assign wire98 = (({reg90[(1'h0):(1'h0)]} >= reg92[(1'h0):(1'h0)]) >= ((reg95 ?
                      ((wire85 ?
                          (7'h43) : (8'hac)) < (~^reg93)) : (~reg94)) < {({reg91,
                              (8'hab)} ?
                          (~|(8'hb8)) : reg92)}));
  assign wire99 = reg96;
  assign wire100 = $signed((wire99 ?
                       ((8'hbb) ?
                           $unsigned(reg91) : $unsigned((wire97 ?
                               reg88 : wire97))) : (reg90[(4'h8):(1'h0)] ^ $unsigned(reg96[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg101 <= (^~((wire100 + reg92[(1'h1):(1'h1)]) ^ reg95));
      reg102 <= {(reg92[(1'h0):(1'h0)] ?
              ((wire84 ~^ $signed(reg89)) ?
                  {{reg94}, (~&wire98)} : reg95[(4'he):(3'h7)]) : {wire100})};
      reg103 <= (-reg89[(2'h2):(1'h1)]);
      reg104 <= (reg101 >= $signed((~^{(8'hba), (~reg88)})));
      reg105 <= (($unsigned(reg90[(1'h0):(1'h0)]) ?
              $unsigned(wire86) : (((^wire84) ?
                  reg103 : {(8'hb4), reg90}) + reg96[(2'h3):(1'h1)])) ?
          reg91 : $unsigned((wire87 ^~ ($unsigned(reg90) || $signed(reg104)))));
    end
  assign wire106 = wire87;
  assign wire107 = $unsigned(wire87);
  assign wire108 = $signed((($signed(wire107) | reg96[(1'h0):(1'h0)]) ?
                       (~|$signed($signed(reg92))) : $signed($unsigned({(8'ha7)}))));
  assign wire109 = ((8'ha2) ~^ wire107);
  assign wire110 = wire107;
endmodule

module module7
#(parameter param76 = (((({(8'hb4)} < ((8'hb9) ? (8'hac) : (8'ha4))) && (((8'hbc) ? (8'hac) : (8'haa)) || {(8'hb2), (8'ha8)})) ^ {(((8'hb6) | (7'h43)) != ((8'hbe) ? (8'hb5) : (8'h9c))), (~((8'ha2) & (8'ha7)))}) <<< ((({(8'ha7), (8'hbc)} ? (~(7'h41)) : ((8'h9d) ? (8'hac) : (8'h9e))) * ((^~(8'hae)) < ((8'hba) ? (8'hb4) : (8'h9e)))) <= ((((8'hae) ? (8'hb3) : (8'hb9)) ? ((8'h9d) ? (8'hba) : (8'had)) : {(8'haf)}) ? (~&(!(8'ha1))) : (((8'hbd) != (8'hab)) ? ((8'ha7) >= (8'had)) : ((7'h41) - (8'hbc)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire70;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire33,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire35,
                 wire70,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = (7'h43);
  assign wire14 = ($unsigned($signed(wire8)) ? wire9[(5'h10):(1'h0)] : (8'h9f));
  assign wire15 = ({$signed((wire10[(3'h4):(2'h2)] ? {wire9, wire12} : wire13)),
                      wire13[(3'h5):(2'h3)]} == $signed((wire8 ?
                      (~^wire14[(4'h9):(3'h5)]) : {$signed(wire9)})));
  assign wire16 = ($signed(wire12) ?
                      $signed(($unsigned(((8'hab) == wire13)) ?
                          {$unsigned(wire14)} : ($signed(wire15) ?
                              $unsigned(wire12) : (~^wire8)))) : $unsigned((~wire8)));
  module17 #() modinst34 (.wire21(wire12), .wire20(wire9), .clk(clk), .wire19(wire16), .wire22(wire10), .wire18(wire13), .y(wire33));
  assign wire35 = wire15[(4'h8):(1'h1)];
  module36 #() modinst71 (wire70, clk, wire9, wire35, wire13, wire16, wire12);
  assign wire72 = (|$unsigned(wire70[(3'h5):(1'h1)]));
  assign wire73 = wire15;
  assign wire74 = $signed($signed((~&({(8'hb5), (8'haf)} ?
                      $signed(wire15) : (wire14 ? (8'hbf) : wire73)))));
  assign wire75 = (&(-wire9));
endmodule

module module36
#(parameter param68 = (|(^((((7'h40) ? (8'hb6) : (8'hb2)) > ((8'ha9) - (8'hb4))) & (((8'had) ? (7'h40) : (8'hb6)) ? (~|(8'hb1)) : (+(8'hab)))))), 
parameter param69 = (((((param68 ~^ param68) ? (^~param68) : (param68 ? param68 : param68)) <<< ({param68} ? param68 : (param68 - param68))) ? param68 : param68) << (~param68)))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire41;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 wire42,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire42 = $signed($signed((wire41[(1'h0):(1'h0)] & wire38[(4'he):(4'hd)])));
  assign wire43 = (7'h42);
  assign wire44 = wire37[(3'h4):(1'h1)];
  assign wire45 = wire44[(4'hd):(1'h1)];
  assign wire46 = $signed(wire39[(2'h2):(1'h1)]);
  assign wire47 = wire41[(2'h3):(2'h3)];
  assign wire48 = {(~&wire42)};
  assign wire49 = (&({(8'ha7)} & $signed(((wire40 ^ wire47) < (wire45 >>> wire48)))));
  assign wire50 = {wire39[(2'h2):(1'h0)],
                      $signed(((!$unsigned(wire47)) ?
                          ($unsigned(wire41) ?
                              (wire43 >> wire40) : wire40) : ($signed(wire46) ^~ (8'hbb))))};
  assign wire51 = (wire43[(3'h5):(1'h1)] ? (|wire40) : wire42);
  assign wire52 = ($unsigned($unsigned(wire45[(4'hd):(1'h1)])) ?
                      (^~wire43[(1'h1):(1'h0)]) : (wire51 << {($signed(wire39) ?
                              (wire37 ^ wire45) : (^~wire49))}));
  assign wire53 = $unsigned(wire50);
  assign wire54 = wire52;
  assign wire55 = (~^wire37);
  assign wire56 = $signed(((wire53 ?
                      wire42 : (~|(wire41 + wire54))) ^~ wire42));
  assign wire57 = $unsigned($signed({$unsigned($unsigned(wire48)),
                      wire42[(1'h1):(1'h1)]}));
  assign wire58 = {$signed((^~wire53[(4'hb):(4'h9)])), wire42[(3'h4):(1'h1)]};
  assign wire59 = ((7'h44) ? (8'hb3) : wire38);
  assign wire60 = (|({wire57, wire59[(1'h0):(1'h0)]} <<< wire45));
  assign wire61 = wire50[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg62 <= $signed(wire40);
      reg63 <= {$signed((wire50 >> {{(8'hb7), wire51}}))};
      if (wire61)
        begin
          reg64 <= wire41;
        end
      else
        begin
          reg64 <= $signed(wire37);
          reg65 <= $signed($unsigned(wire45));
          reg66 <= {$unsigned(({wire37[(2'h3):(2'h3)]} != (wire56 > wire41[(1'h0):(1'h0)]))),
              wire49};
          reg67 <= wire50;
        end
    end
endmodule

module module17
#(parameter param31 = ({({((8'hb1) && (8'hb2)), ((8'haf) ? (8'hbd) : (8'hb3))} ? {(~&(7'h41)), ((8'hb7) ? (8'ha7) : (8'hbf))} : (((7'h44) ? (8'ha5) : (8'had)) ~^ ((8'hbc) != (8'h9c))))} == (8'hb4)), 
parameter param32 = ((((param31 ? (&(8'ha6)) : (param31 ? param31 : param31)) - {param31}) >>> (((~&param31) ? param31 : (param31 && param31)) ~^ param31)) <= (((^(param31 ? param31 : param31)) ~^ (^~(param31 ? param31 : param31))) ? param31 : (param31 ? (param31 ^~ param31) : {(!(8'hb9))}))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg27,
                 (1'h0)};
  assign wire23 = $signed(wire19[(4'he):(4'h9)]);
  assign wire24 = (wire23 ?
                      (wire22 ?
                          {(wire19 ? (~|wire20) : (wire23 <= wire19)),
                              $unsigned(wire18[(4'hb):(1'h1)])} : ((wire18[(2'h3):(2'h2)] ^~ wire22) ?
                              wire19 : wire19[(1'h0):(1'h0)])) : wire20[(2'h3):(1'h0)]);
  assign wire25 = ((wire24 || $unsigned(wire21)) ?
                      ((wire21[(1'h0):(1'h0)] ?
                              ((~wire19) ?
                                  wire18 : wire22[(2'h2):(1'h0)]) : $unsigned((wire20 ?
                                  wire20 : (8'haa)))) ?
                          wire21 : wire22[(1'h1):(1'h1)]) : (wire24 ~^ (~^$unsigned((wire22 ?
                          wire24 : wire22)))));
  assign wire26 = (~$signed((|(wire25 ? (wire24 ? wire21 : wire23) : wire23))));
  always
    @(posedge clk) begin
      reg27 <= ({($unsigned($signed(wire24)) ?
              wire24[(3'h6):(3'h4)] : wire23)} && wire18);
    end
  assign wire28 = $signed(wire23);
  assign wire29 = $unsigned(wire25);
  assign wire30 = wire18;
endmodule
