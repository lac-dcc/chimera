module top
#(parameter param154 = (^(8'hb0)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire152,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (wire0[(1'h0):(1'h0)] ?
                     {($unsigned((wire3 ? wire2 : wire1)) ?
                             ((wire3 ? wire3 : wire3) ?
                                 wire1[(4'h9):(2'h2)] : (~&wire0)) : wire0)} : {wire1[(1'h0):(1'h0)],
                         $unsigned(((wire0 && wire2) ?
                             (wire2 == wire1) : (wire3 ? wire0 : (8'haa))))});
  assign wire5 = (8'hbf);
  module6 #() modinst78 (wire77, clk, wire3, wire1, wire5, wire2);
  assign wire79 = (~&(&$signed((wire4 ? $unsigned((8'ha1)) : wire3))));
  assign wire80 = {($signed((wire1 & (wire2 | wire2))) ?
                          ($signed((|wire77)) ?
                              ($signed(wire2) ~^ (wire4 >> wire5)) : ($unsigned(wire79) ?
                                  (wire4 <= wire5) : ((8'hb5) < wire3))) : $signed((wire77[(1'h0):(1'h0)] <<< (wire4 != wire0))))};
  assign wire81 = (|((~&(8'haf)) ?
                      wire4[(4'h9):(1'h1)] : ($signed((wire0 <<< (8'hb6))) ?
                          ($signed(wire2) << $unsigned(wire2)) : wire80)));
  assign wire82 = (((^~wire3[(5'h15):(2'h2)]) ?
                          $signed($unsigned($signed((8'hbb)))) : (8'ha3)) ?
                      $unsigned(wire4) : wire80);
  assign wire83 = (wire3 << (~wire1));
  assign wire84 = $unsigned(wire80);
  assign wire85 = (~|$unsigned((8'hab)));
  assign wire86 = ((&(~&$signed((^~wire2)))) ?
                      $unsigned(wire81) : (wire85[(4'hb):(3'h5)] ?
                          $unsigned($unsigned(wire77)) : {wire1[(5'h11):(5'h10)]}));
  module87 #() modinst153 (wire152, clk, wire81, wire0, wire82, wire86);
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  assign y = {wire151,
                 wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire92 = (8'h9f);
  assign wire93 = wire90[(4'h9):(1'h1)];
  assign wire94 = (wire91 ?
                      ($unsigned($signed({wire88, wire90})) ?
                          (^wire93[(1'h0):(1'h0)]) : ({$unsigned(wire89)} ~^ $signed($signed(wire90)))) : wire91);
  assign wire95 = $signed(({wire88, wire89[(4'h9):(2'h2)]} ?
                      $signed($unsigned((wire91 ~^ (7'h41)))) : $signed((8'hbf))));
  assign wire96 = ((^~wire92[(4'ha):(3'h5)]) <<< (~&wire88));
  assign wire97 = $signed(($unsigned($signed((wire91 ? wire95 : (8'ha4)))) ?
                      wire95[(3'h5):(3'h5)] : $unsigned((&(^(8'hb9))))));
  assign wire98 = ({wire92,
                      (wire97[(2'h3):(1'h0)] ?
                          (wire91[(4'hf):(4'he)] + $unsigned(wire96)) : ((wire97 ?
                              wire93 : wire93) ^~ wire94[(4'hb):(1'h1)]))} || $signed($unsigned((+((7'h42) ?
                      wire90 : wire95)))));
  assign wire99 = ($unsigned((8'hbb)) ?
                      $signed($unsigned($signed((wire88 >= wire89)))) : wire92);
  assign wire100 = wire98;
  module101 #() modinst142 (.wire105(wire90), .wire102(wire98), .y(wire141), .wire104(wire89), .wire103(wire92), .clk(clk));
  assign wire143 = {$unsigned($signed(wire94[(1'h1):(1'h0)]))};
  assign wire144 = $unsigned(wire91[(4'hc):(3'h4)]);
  assign wire145 = {$signed(({wire92} <= ((wire91 ?
                           wire88 : (8'hb6)) * {wire144, wire99})))};
  always
    @(posedge clk) begin
      if ({$unsigned(wire100[(1'h0):(1'h0)]), (^~wire94)})
        begin
          reg146 <= wire90;
        end
      else
        begin
          reg146 <= $signed(wire92[(3'h5):(3'h5)]);
        end
      reg147 <= (+wire88);
      reg148 <= wire144;
      reg149 <= {($unsigned($unsigned(wire94[(4'h9):(2'h2)])) ?
              $signed(wire90[(4'hb):(3'h6)]) : $signed((wire95[(3'h5):(3'h5)] ?
                  (~|reg148) : reg146)))};
      reg150 <= ((&wire88[(3'h4):(1'h1)]) ?
          $unsigned((wire141 ?
              $signed($signed((8'ha2))) : (^$signed(wire88)))) : $signed((wire99 - {$signed(wire95)})));
    end
  assign wire151 = {$unsigned((($unsigned(wire144) ?
                               {wire97, wire99} : (wire144 > (8'hb5))) ?
                           $signed(wire91[(5'h12):(4'he)]) : $unsigned($signed(wire93))))};
endmodule

module module6
#(parameter param76 = (({{((8'ha0) ? (7'h40) : (7'h43))}, (+((8'hb2) * (8'ha1)))} >> (~&(((8'hb4) - (8'hb9)) >= ((8'hab) != (8'haf))))) ? (((((8'hac) ? (8'hbf) : (8'hb5)) ? {(8'hb1)} : ((7'h43) > (8'hb4))) <= ({(8'h9f), (8'hae)} ? ((8'ha2) ? (8'hab) : (8'hbf)) : (!(8'h9f)))) ? ({((8'ha7) ? (8'h9e) : (8'h9f)), (~&(8'hb8))} ? ({(8'ha4)} ? ((8'hb3) ? (8'hbd) : (8'ha0)) : {(8'ha5), (8'hb2)}) : {((8'hb8) ? (8'h9d) : (8'hb8))}) : ((~|{(8'ha9)}) + (&((8'ha1) ~^ (7'h41))))) : ((~|(8'h9e)) ? (~^(-((7'h44) ? (7'h43) : (8'h9c)))) : ((&((8'h9f) >= (7'h42))) >> (((8'hbe) ? (8'ha7) : (8'hbc)) | ((7'h43) + (8'haa)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire28;
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  assign y = {wire75,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire31,
                 wire30,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire28,
                 reg74,
                 reg73,
                 reg72,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire11 = wire8[(2'h3):(1'h1)];
  assign wire12 = ((8'hba) ?
                      (wire11 ?
                          (wire11[(5'h10):(4'h8)] < ((wire7 ?
                              wire11 : wire8) & (-wire10))) : ($signed($unsigned((8'hb7))) >>> $unsigned((^~wire8)))) : $signed((((wire8 ?
                              wire10 : wire7) ?
                          ((8'hb5) > wire11) : $signed(wire10)) >= ((wire11 ^~ wire10) ?
                          $unsigned(wire8) : wire11))));
  assign wire13 = (^~wire10[(3'h4):(1'h0)]);
  assign wire14 = wire10;
  module15 #() modinst29 (wire28, clk, wire7, wire12, wire8, wire13, wire9);
  assign wire30 = {$signed({((8'ha9) ? (wire12 <= wire11) : {(8'ha7)}),
                          (&(wire14 < wire28))})};
  assign wire31 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((8'ha0)))
        begin
          if ((~wire30))
            begin
              reg32 <= $signed((~|$unsigned(wire10[(3'h4):(1'h0)])));
              reg33 <= {(~|(&$signed((~^(7'h40))))),
                  (-($signed((wire14 ? wire8 : (8'hb8))) ?
                      wire13[(3'h5):(2'h2)] : ($signed(reg32) < wire7)))};
              reg34 <= (wire7[(3'h5):(1'h0)] ?
                  ($unsigned(wire31[(4'ha):(3'h5)]) ?
                      $unsigned(wire13) : $signed($signed(reg33[(2'h2):(2'h2)]))) : reg33);
              reg35 <= wire14[(4'hc):(3'h5)];
            end
          else
            begin
              reg32 <= reg35;
              reg33 <= (+reg33);
            end
        end
      else
        begin
          reg32 <= $signed(wire30);
        end
    end
  module36 #() modinst68 (.wire40(reg33), .wire39(wire13), .wire37(reg34), .y(wire67), .wire38(wire9), .clk(clk));
  assign wire69 = $unsigned((!wire12));
  assign wire70 = (8'haf);
  assign wire71 = wire12;
  always
    @(posedge clk) begin
      reg72 <= ((^(((reg33 >= reg33) ?
              wire31[(3'h7):(1'h0)] : (~(8'ha2))) + ((~&wire12) ?
              wire28[(3'h7):(3'h6)] : (reg35 * wire12)))) ?
          (~wire8[(3'h6):(3'h5)]) : ((~(~^$unsigned(wire12))) == (&wire67[(4'h9):(3'h6)])));
      reg73 <= {($unsigned(((wire71 >> wire9) ? (~wire70) : (~|wire7))) ?
              wire30[(3'h4):(3'h4)] : $signed(($signed(reg34) ?
                  $signed(reg32) : wire31)))};
      reg74 <= $unsigned($unsigned((reg35 >= ($unsigned(wire67) ?
          wire13 : (wire11 <<< reg73)))));
    end
  assign wire75 = (wire8[(4'h9):(3'h6)] ?
                      {$unsigned({$unsigned(wire71)})} : wire13[(1'h1):(1'h1)]);
endmodule

module module36
#(parameter param65 = (|(~&(!{(|(7'h41)), {(8'ha0), (8'hbf)}}))), 
parameter param66 = (((~|{(param65 <<< param65), param65}) ? ((~((8'ha0) ? (8'hbb) : param65)) ? ((param65 == param65) ? (param65 | param65) : ((7'h43) ~^ param65)) : {param65, param65}) : ((~^param65) ~^ (((8'hac) ? (8'hae) : (8'h9c)) || param65))) ? (^(~((param65 ? param65 : param65) ? (~^param65) : (~^param65)))) : (param65 ? ((8'ha4) ? param65 : {param65}) : {((param65 ? param65 : param65) ? (param65 + param65) : (-param65)), param65})))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire40;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire [(4'h8):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire41;
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
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
                 wire41,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire41 = {({(((8'ha9) ?
                              wire38 : wire38) < (wire37 && wire40))} <<< $unsigned($unsigned(wire38))),
                      $unsigned(($unsigned(wire38) < (^$unsigned(wire40))))};
  always
    @(posedge clk) begin
      reg42 <= (~&$unsigned(wire37[(2'h3):(1'h0)]));
      reg43 <= $unsigned(wire37);
      reg44 <= ($signed($unsigned(wire41[(3'h4):(2'h3)])) ?
          $unsigned((~|(&(!wire38)))) : $signed((($signed(wire39) ?
              reg43[(3'h7):(3'h7)] : wire41[(3'h4):(2'h3)]) && $unsigned($signed(wire37)))));
      reg45 <= {((&$signed((wire41 + wire40))) >>> $signed(({reg44} ?
              {wire40, wire39} : reg42)))};
    end
  assign wire46 = (wire38[(1'h0):(1'h0)] ?
                      $unsigned((|(wire41[(1'h0):(1'h0)] && $unsigned(wire37)))) : ($unsigned(((~wire39) ?
                          (~&wire37) : wire41)) - (8'hb9)));
  assign wire47 = wire38;
  assign wire48 = ($signed(($signed($unsigned(wire41)) >>> ({(8'h9d)} != $signed(wire46)))) ?
                      (($unsigned($signed(wire46)) ?
                              (+$signed(reg44)) : {wire40[(3'h4):(2'h2)]}) ?
                          $unsigned(wire40) : wire40) : {(((wire46 ?
                                      reg42 : wire46) ?
                                  (wire39 ?
                                      (8'h9d) : wire39) : $signed(reg43)) ?
                              ($signed(wire39) && $unsigned(wire37)) : $unsigned((wire47 ?
                                  wire46 : wire39))),
                          $unsigned((8'hbd))});
  assign wire49 = $signed($signed($unsigned($signed({wire37, wire41}))));
  assign wire50 = (wire46 * (((-{wire39}) << ($signed(reg42) ?
                      wire40 : wire41)) < (~|{$unsigned(wire37), wire41})));
  assign wire51 = ($signed((&$signed((!wire50)))) ?
                      (~^reg42[(2'h3):(2'h2)]) : (8'hbc));
  assign wire52 = $unsigned((~^$unsigned($signed(reg44[(2'h2):(1'h1)]))));
  assign wire53 = (8'haa);
  assign wire54 = ({(~^$unsigned({wire48})),
                      $unsigned($unsigned(reg43))} | $unsigned((wire47 ?
                      (-wire41[(2'h3):(2'h2)]) : reg42[(2'h3):(2'h2)])));
  assign wire55 = ($signed(({((8'h9f) == reg44),
                      $unsigned(wire39)} > ($unsigned(wire53) - ((8'h9d) > wire52)))) & (reg42[(3'h7):(1'h0)] ?
                      (((reg45 || reg45) ^~ wire39) * reg45) : (reg44[(3'h5):(3'h5)] ?
                          (7'h42) : (wire54 - reg42[(4'h9):(1'h1)]))));
  assign wire56 = ({($signed($signed(wire37)) - (-wire51))} == wire38[(1'h0):(1'h0)]);
  assign wire57 = (wire48 + wire55[(3'h6):(1'h0)]);
  assign wire58 = wire41[(1'h1):(1'h0)];
  assign wire59 = $unsigned(wire52[(2'h2):(1'h1)]);
  assign wire60 = $unsigned(wire48[(1'h0):(1'h0)]);
  assign wire61 = wire50[(1'h0):(1'h0)];
  assign wire62 = (({(^((8'ha6) ? reg45 : (8'hab)))} ?
                          wire38[(1'h0):(1'h0)] : wire54) ?
                      ((8'h9f) ?
                          $unsigned({(~reg44)}) : ($signed($signed(wire54)) & ((wire51 ?
                                  wire47 : wire52) ?
                              $signed((7'h43)) : $unsigned(wire49)))) : wire55);
  assign wire63 = wire47;
  assign wire64 = ((|({(wire47 | wire59),
                      (~^wire61)} >> $signed(wire39))) == {wire38[(1'h0):(1'h0)],
                      $signed({(|wire56)})});
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  assign y = {wire27, wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $signed($signed((wire17 <<< ($unsigned(wire20) >>> (~|wire18)))));
  assign wire22 = (^~$signed(wire19));
  assign wire23 = $unsigned($signed((&wire19[(5'h13):(4'h9)])));
  assign wire24 = (($signed(wire18) ?
                          $unsigned((((8'hb7) ? wire23 : wire18) ?
                              wire20[(4'h9):(2'h2)] : (~wire19))) : (-$signed((wire22 ?
                              wire21 : (8'ha3))))) ?
                      $unsigned($unsigned(wire19[(5'h11):(2'h3)])) : ((8'hbf) || ($unsigned(wire20[(3'h7):(3'h5)]) ~^ $signed((wire22 ?
                          wire16 : (8'ha3))))));
  assign wire25 = $unsigned(wire20[(1'h1):(1'h0)]);
  assign wire26 = (~|{(|{(~|wire20), {wire20, wire20}})});
  assign wire27 = $signed(wire23[(2'h3):(2'h2)]);
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire105;
  input wire signed [(5'h10):(1'h0)] wire104;
  input wire [(2'h3):(1'h0)] wire103;
  input wire [(4'hc):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
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
                 (1'h0)};
  assign wire106 = {(&wire102)};
  assign wire107 = wire105;
  assign wire108 = (|((({wire104, (8'hbc)} ?
                               (~&(7'h41)) : (wire104 ? wire105 : wire104)) ?
                           ($unsigned((8'hb3)) ?
                               wire102[(4'hc):(1'h1)] : $signed(wire106)) : $unsigned($unsigned((8'hb0)))) ?
                       (wire106 >= (~|$unsigned(wire102))) : wire107[(1'h1):(1'h1)]));
  assign wire109 = ({{$signed(wire105[(5'h12):(4'h9)])}} ?
                       (wire104 - (+wire103[(2'h2):(1'h1)])) : ($unsigned({(wire105 <= wire104)}) ?
                           (8'hb6) : $signed(wire103)));
  assign wire110 = wire107;
  assign wire111 = (~^wire106[(2'h3):(2'h3)]);
  assign wire112 = wire109;
  always
    @(posedge clk) begin
      if ($signed($signed(wire105)))
        begin
          if ({($signed(wire103) ? wire102 : (|{{wire111}, $signed(wire111)})),
              (~&($signed($signed(wire107)) | $unsigned((wire104 ?
                  wire104 : wire104))))})
            begin
              reg113 <= wire112;
              reg114 <= $unsigned(((8'hb5) ?
                  (wire110[(1'h1):(1'h0)] >>> wire111[(1'h1):(1'h1)]) : ((^~{wire104,
                          wire102}) ?
                      ((wire106 + wire109) ?
                          (wire103 >> wire109) : (8'haf)) : $unsigned((~wire109)))));
              reg115 <= {wire109[(5'h14):(5'h12)],
                  (!$unsigned($signed($signed(wire112))))};
              reg116 <= ((&($unsigned({wire112,
                      wire111}) >= $unsigned((~|wire107)))) ?
                  $unsigned($unsigned($signed($unsigned(wire110)))) : (~^$signed(((wire111 ?
                          wire109 : (8'ha7)) ?
                      (~wire107) : $signed(wire106)))));
              reg117 <= $signed({(!(~^wire110)),
                  ($unsigned($unsigned(wire112)) ?
                      wire103[(1'h1):(1'h1)] : ((wire105 ? wire110 : wire108) ?
                          $unsigned(wire108) : (8'hbe)))});
            end
          else
            begin
              reg113 <= reg116[(2'h3):(1'h0)];
              reg114 <= (8'ha0);
              reg115 <= $unsigned((~reg117[(3'h5):(2'h2)]));
              reg116 <= $signed((~(^~wire111)));
            end
          if (reg113)
            begin
              reg118 <= {wire106[(2'h3):(2'h3)]};
              reg119 <= wire106;
              reg120 <= (reg119 == reg116[(2'h2):(1'h1)]);
              reg121 <= ($unsigned($unsigned($signed($signed(wire109)))) ?
                  $signed((|(^(8'hab)))) : wire111);
              reg122 <= reg114[(3'h5):(3'h4)];
            end
          else
            begin
              reg118 <= (^(^($unsigned($signed(wire102)) ?
                  ({reg119,
                      (8'hba)} != wire110[(1'h0):(1'h0)]) : ((wire108 ^~ wire108) <= $unsigned(reg119)))));
              reg119 <= wire110[(2'h3):(1'h1)];
              reg120 <= (($signed($signed({wire106})) ^~ $unsigned((~^wire107[(3'h4):(2'h3)]))) <<< $unsigned(reg116));
            end
          reg123 <= ((~$signed(wire106)) ?
              $signed(((~|(~^reg120)) >= wire109[(1'h0):(1'h0)])) : $signed((wire108 >> reg118)));
          reg124 <= ($signed({((reg114 ^~ (8'hac)) ?
                  $unsigned((8'hbf)) : (wire110 ? (8'hb8) : reg121)),
              wire109}) <= (~^(~$unsigned((!wire104)))));
          reg125 <= ($signed($signed($signed((wire104 <= wire111)))) < $unsigned(reg114[(1'h1):(1'h0)]));
        end
      else
        begin
          reg113 <= (~(+reg113[(3'h4):(1'h0)]));
          reg114 <= wire105[(5'h15):(4'hc)];
          if ({($unsigned(wire104) <<< $unsigned($unsigned(reg118))),
              $unsigned(($unsigned($unsigned(reg122)) < {reg114}))})
            begin
              reg115 <= $signed((^~reg123[(4'h9):(3'h5)]));
              reg116 <= wire105[(2'h2):(1'h1)];
            end
          else
            begin
              reg115 <= reg113;
              reg116 <= $signed((reg113 > ((8'ha3) ^ ((!wire112) ?
                  (reg118 ? wire102 : reg123) : $signed(reg117)))));
              reg117 <= reg124[(3'h4):(1'h1)];
              reg118 <= ($signed((wire112 ? reg118 : $unsigned((|wire107)))) ?
                  (~|(&((wire109 ? (8'hbc) : reg116) ?
                      (reg122 >> (8'hb6)) : (reg123 == reg119)))) : ($unsigned((((8'hae) ?
                              (8'hbe) : wire102) ?
                          wire109[(4'h9):(1'h0)] : (wire109 ?
                              reg117 : reg123))) ?
                      (wire104[(3'h6):(1'h1)] ^~ $unsigned((wire104 | reg122))) : $signed(($signed(reg124) && ((8'hbe) ?
                          reg113 : (8'ha2))))));
            end
        end
      reg126 <= $unsigned((((7'h44) ?
          $signed({wire109,
              reg124}) : (reg120[(1'h0):(1'h0)] | $unsigned(reg119))) == $signed((reg118[(2'h2):(1'h0)] < {reg123,
          reg115}))));
    end
  always
    @(posedge clk) begin
      reg127 <= (((8'hae) >>> ($signed(wire110[(1'h0):(1'h0)]) ?
          {$signed((7'h40)),
              (~wire112)} : ({wire107} == (~reg125)))) >>> $unsigned(wire112[(5'h14):(4'hd)]));
      if ((wire106 & ($signed(((wire103 ?
              reg114 : (8'ha9)) > $signed(reg113))) ?
          $unsigned(wire103) : $signed($signed((+wire111))))))
        begin
          reg128 <= $signed(wire104[(3'h5):(1'h1)]);
          reg129 <= $unsigned($signed((~^reg125[(4'hf):(4'hc)])));
          reg130 <= reg116[(3'h4):(1'h0)];
        end
      else
        begin
          if (reg115[(2'h2):(1'h0)])
            begin
              reg128 <= $signed($unsigned($signed(reg125)));
              reg129 <= wire107;
              reg130 <= (($unsigned((|$unsigned(wire109))) ?
                  ($signed((reg119 == wire111)) ?
                      wire107 : ((~|wire108) ?
                          (reg118 ?
                              reg118 : (7'h40)) : $unsigned(reg127))) : {wire108,
                      {((8'hac) & reg128),
                          reg128[(4'hf):(3'h6)]}}) <= ((reg113 ?
                  reg128 : reg126[(3'h5):(1'h0)]) < reg116));
            end
          else
            begin
              reg128 <= (reg130 << reg120[(2'h2):(1'h1)]);
              reg129 <= reg115;
              reg130 <= (reg129 ?
                  (~|$signed(reg117)) : $unsigned((reg116 ?
                      (reg127 ?
                          reg129[(5'h12):(1'h0)] : $signed(wire108)) : {((8'hb6) ?
                              wire110 : (8'hb5)),
                          (reg116 ? reg124 : reg115)})));
            end
          reg131 <= reg125[(2'h3):(2'h3)];
          reg132 <= wire106;
        end
      reg133 <= (!$signed($signed((wire109 ? reg126 : $signed(reg128)))));
      reg134 <= reg119;
      reg135 <= $signed({reg120});
    end
  assign wire136 = reg133;
  assign wire137 = reg126[(4'hb):(4'h9)];
  assign wire138 = wire137[(1'h1):(1'h1)];
  assign wire139 = $unsigned(reg127[(3'h6):(3'h6)]);
  assign wire140 = wire102;
endmodule
