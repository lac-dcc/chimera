module top
#(parameter param185 = ((((((8'hbe) ? (8'ha3) : (7'h42)) ? ((8'hbc) ? (7'h40) : (8'hb2)) : (7'h41)) ? ({(8'hbe)} * ((8'ha9) + (7'h44))) : ({(8'ha6)} * ((8'hbf) != (8'hae)))) != (|(((8'hb2) ? (8'haa) : (8'hbc)) > ((8'ha8) != (7'h43))))) ? ((&(^~((8'hb0) && (8'hb8)))) || (~(^~(~^(8'hac))))) : {(!(((7'h41) & (7'h44)) ? (8'ha2) : ((8'h9e) ? (8'hbb) : (8'hbc)))), ((((8'hb3) ? (8'h9c) : (8'ha6)) ? ((8'haf) ? (8'hbb) : (8'hb6)) : (~&(8'h9d))) >= (~|((8'haa) ? (8'hbf) : (8'hb1))))}), 
parameter param186 = ((8'ha3) ? (^(((param185 ? (8'haf) : param185) ? (param185 ? param185 : param185) : (param185 ? (8'h9f) : (8'hbc))) != ((param185 ? param185 : param185) == param185))) : (({(^~param185), (param185 ? param185 : param185)} ? ((param185 != param185) ? (|param185) : {param185}) : ((param185 ? param185 : param185) == {param185, (8'hba)})) ? (8'hbf) : param185)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire182;
  wire [(3'h6):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire106;
  assign y = {wire184,
                 wire182,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire106,
                 (1'h0)};
  assign wire4 = ({$signed(((wire0 ~^ wire0) ?
                             $unsigned(wire0) : (wire2 >> wire3)))} ?
                     (~&(~&{wire2[(4'h9):(4'h8)],
                         wire2[(3'h6):(1'h1)]})) : $unsigned(wire0));
  assign wire5 = $signed((wire0[(2'h2):(1'h1)] != $unsigned((~|$signed(wire1)))));
  assign wire6 = (^~wire0);
  assign wire7 = $signed($signed(wire2));
  assign wire8 = wire1;
  assign wire9 = $signed(wire5);
  assign wire10 = (wire8 ?
                      ($signed({wire4, (+wire4)}) ?
                          $signed((&(wire2 ?
                              wire7 : wire6))) : wire7[(4'hc):(4'hc)]) : {($signed(wire2) ?
                              $signed(wire8[(3'h5):(2'h3)]) : wire6[(3'h4):(1'h1)])});
  assign wire11 = ((&({wire4} ? (^~wire10) : wire9[(4'hc):(4'ha)])) ?
                      $unsigned((^~$unsigned(wire4[(2'h3):(1'h1)]))) : $unsigned(({wire7[(4'he):(4'hd)]} & ((^wire6) ?
                          (8'hb7) : wire2))));
  assign wire12 = wire9;
  assign wire13 = $unsigned((+(wire5[(2'h2):(1'h1)] << wire7[(4'hc):(4'ha)])));
  assign wire14 = $signed(($unsigned(wire6) & wire6[(3'h6):(2'h2)]));
  assign wire15 = $signed((wire7[(3'h6):(1'h1)] <= ($unsigned(wire13[(5'h12):(3'h6)]) != wire13[(4'hd):(3'h6)])));
  assign wire16 = ((wire14[(1'h0):(1'h0)] ?
                          (wire15 ^ wire7[(5'h15):(4'h9)]) : wire4[(2'h2):(1'h0)]) ?
                      (($unsigned({(8'ha0), wire4}) ?
                              (+wire6[(3'h5):(3'h4)]) : ($signed((8'hba)) ?
                                  $signed(wire3) : $signed(wire6))) ?
                          (+$signed(((8'hbc) ? wire10 : wire4))) : {((wire14 ?
                                  wire11 : wire0) << $unsigned(wire4)),
                              wire14[(1'h1):(1'h0)]}) : (^~wire12));
  assign wire17 = {wire6[(3'h5):(1'h1)],
                      (~$signed($unsigned(wire15[(2'h2):(1'h1)])))};
  assign wire18 = wire6;
  assign wire19 = $signed(wire18[(3'h4):(2'h2)]);
  module20 #() modinst107 (wire106, clk, wire5, wire15, wire11, wire3, wire1);
  module108 #() modinst183 (.wire110(wire13), .y(wire182), .clk(clk), .wire111(wire17), .wire112(wire4), .wire109(wire15));
  assign wire184 = $unsigned($signed(($unsigned((~wire19)) ?
                       ((wire4 && wire0) ?
                           (wire18 ? wire17 : wire1) : (wire182 ?
                               wire106 : wire13)) : (^~((8'hb6) ?
                           wire19 : wire11)))));
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire112;
  input wire [(5'h10):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(4'hb):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(4'hb):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire173,
                 wire172,
                 wire170,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 (1'h0)};
  assign wire113 = wire112;
  assign wire114 = $signed(wire111);
  assign wire115 = ($signed(($unsigned((wire110 ? wire111 : wire113)) ?
                           (~(&wire109)) : $unsigned((wire113 * wire114)))) ?
                       (~&{$signed(wire113[(1'h1):(1'h0)])}) : wire112);
  assign wire116 = wire112[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg117 <= $signed(wire112);
      reg118 <= (((wire110 || (&(|wire110))) > (~^(-$unsigned((8'h9f))))) ?
          wire116 : $unsigned((~|(!wire112))));
      if (reg117)
        begin
          reg119 <= (^~wire112);
          if (($signed(reg119) || wire116))
            begin
              reg120 <= wire111;
              reg121 <= ($unsigned($unsigned($unsigned((+wire116)))) | (wire115[(5'h12):(4'he)] ?
                  wire115[(4'hd):(3'h5)] : $signed(wire115[(5'h10):(1'h0)])));
            end
          else
            begin
              reg120 <= {wire112,
                  (~(reg121 ?
                      (!reg118[(1'h0):(1'h0)]) : wire109[(1'h1):(1'h1)]))};
            end
        end
      else
        begin
          reg119 <= $unsigned((^~$unsigned({wire111, {reg118, reg117}})));
          reg120 <= $signed($unsigned(wire114));
          reg121 <= (~wire110[(4'h9):(1'h1)]);
        end
    end
  assign wire122 = $unsigned({wire112[(1'h0):(1'h0)]});
  assign wire123 = $unsigned(($signed(($unsigned((8'ha9)) * (~&wire115))) ?
                       ($unsigned({wire111}) ?
                           (wire114 >> {wire111,
                               (8'hb7)}) : reg120) : {($unsigned((8'hb0)) ?
                               (^wire122) : reg120[(2'h3):(2'h2)])}));
  assign wire124 = ((&({$signed(wire111), {reg120, wire114}} ?
                       wire110[(2'h3):(1'h0)] : $signed((^wire113)))) >>> $signed((^~reg119)));
  assign wire125 = wire110[(5'h12):(1'h0)];
  assign wire126 = (~^reg117);
  assign wire127 = ($unsigned((wire123 ?
                       ($unsigned((8'hb5)) ?
                           $signed(wire122) : (~wire125)) : wire110)) > {$signed($unsigned((reg117 ?
                           (7'h41) : wire125))),
                       (7'h40)});
  assign wire128 = (((!wire125[(2'h3):(1'h1)]) < $unsigned(($unsigned(wire126) <= $signed(wire127)))) | (!{$signed(wire123)}));
  assign wire129 = (|(+$unsigned($signed($signed(wire122)))));
  assign wire130 = (~|wire126[(2'h3):(2'h3)]);
  module131 #() modinst171 (.wire135(wire116), .wire134(wire129), .y(wire170), .wire136(wire109), .wire133(wire115), .wire132(reg117), .clk(clk));
  assign wire172 = (reg119[(2'h2):(1'h0)] < (($signed((~reg119)) ?
                           wire112[(2'h2):(1'h0)] : ({(8'h9c), wire127} ?
                               (wire116 ?
                                   wire129 : wire170) : $unsigned((8'hbf)))) ?
                       $unsigned(wire115[(4'h8):(3'h5)]) : ($signed($signed(wire116)) ?
                           wire130 : (wire123 != $signed((8'hb2))))));
  assign wire173 = ((wire170[(3'h4):(2'h2)] << wire128[(4'hc):(3'h5)]) << $signed(wire125));
  always
    @(posedge clk) begin
      reg174 <= (8'ha6);
      reg175 <= ({(~^(^~(~&wire126)))} <<< ($signed($signed($unsigned(wire112))) | wire109[(4'ha):(1'h0)]));
      reg176 <= wire114[(3'h4):(1'h0)];
      reg177 <= $unsigned($unsigned((^((8'hb3) && $signed(wire109)))));
      reg178 <= reg118[(2'h2):(2'h2)];
    end
  assign wire179 = $unsigned($signed((wire122 ?
                       reg119 : $unsigned(reg117[(3'h6):(3'h5)]))));
  assign wire180 = (wire127 ?
                       $unsigned($signed(({reg118} ?
                           wire129[(1'h0):(1'h0)] : (~&wire124)))) : $signed($signed(wire173[(4'h8):(4'h8)])));
  assign wire181 = $signed({$signed(reg121)});
endmodule

module module20
#(parameter param104 = ((!(~&(((7'h40) | (8'hb1)) ? ((8'ha6) ? (7'h44) : (8'h9f)) : (&(8'h9d))))) || (~((((8'h9e) ^ (8'ha7)) <= ((8'h9c) >> (8'hb9))) ? (((8'h9e) ? (8'hb5) : (8'hab)) & ((7'h41) & (8'hb4))) : (((8'haf) << (8'h9f)) == ((8'hb4) ? (8'ha6) : (8'hb1)))))), 
parameter param105 = (param104 >= (((~^(param104 >>> (8'hb1))) - param104) ^~ {(8'ha7), (param104 != (param104 ^ param104))})))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire94;
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire72,
                 wire94,
                 (1'h0)};
  module26 #() modinst73 (wire72, clk, wire21, wire23, wire24, wire22);
  module74 #() modinst95 (.wire75(wire24), .wire78(wire21), .wire79(wire25), .clk(clk), .wire77(wire23), .wire76(wire72), .y(wire94));
  assign wire96 = (wire94 - wire23[(5'h11):(3'h7)]);
  assign wire97 = ($unsigned((^$signed(((8'hb4) << wire23)))) ?
                      ({($signed(wire22) ~^ $unsigned((7'h42))),
                              $signed((wire24 ? wire23 : wire96))} ?
                          wire24[(4'hf):(4'hb)] : $signed($signed(wire22))) : (wire21[(1'h1):(1'h1)] ?
                          (((wire25 <<< wire21) ^~ $unsigned(wire22)) ?
                              ((^~wire24) ?
                                  (wire72 ?
                                      wire96 : wire96) : wire96) : $unsigned({wire24})) : (~^wire22[(5'h12):(2'h3)])));
  assign wire98 = (+$unsigned((8'ha2)));
  assign wire99 = ((7'h42) || wire96[(2'h3):(1'h0)]);
  assign wire100 = ((wire97[(2'h3):(1'h0)] ?
                           wire25 : $unsigned((~&wire99[(3'h6):(2'h2)]))) ?
                       wire72[(4'hf):(2'h2)] : ($signed($unsigned((~|(8'hb6)))) ?
                           wire23 : wire25[(3'h5):(1'h1)]));
  assign wire101 = (wire98 ?
                       $signed((~^(wire99 ?
                           (~|(8'hb9)) : wire22[(4'hb):(3'h6)]))) : (^(7'h42)));
  assign wire102 = (-$unsigned((^~(~&(wire25 ? wire101 : (8'hbf))))));
  assign wire103 = wire102;
endmodule

module module74
#(parameter param92 = ({((8'hb9) || {((8'hbb) ^~ (7'h42))}), (8'hae)} | ((|(((8'hab) ? (8'hb6) : (7'h41)) < (^~(8'ha7)))) ? (&({(7'h42), (8'h9f)} && ((8'hbd) * (8'hbb)))) : (^~{((8'hb4) ? (8'hb9) : (8'hac)), (8'ha9)}))), 
parameter param93 = ({({param92, (param92 ? param92 : param92)} ? param92 : ((param92 ^ param92) ? param92 : (^(8'ha5)))), (-((param92 ? param92 : param92) ? (&(8'hba)) : (~param92)))} != param92))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire79;
  input wire signed [(3'h4):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire [(4'hd):(1'h0)] wire76;
  input wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  assign y = {wire91,
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
  assign wire80 = ((&($signed((~|wire77)) ?
                      wire78 : ($signed(wire79) ?
                          $signed(wire77) : (&wire76)))) ^ (8'ha6));
  assign wire81 = ({($unsigned(wire75[(1'h0):(1'h0)]) ?
                              (wire77[(2'h3):(1'h1)] ?
                                  $unsigned(wire75) : $signed(wire77)) : ({wire76} ?
                                  (wire76 ^~ wire80) : $unsigned(wire79))),
                          $signed($unsigned(wire75))} ?
                      $unsigned(wire77) : $signed($unsigned((((8'h9e) ?
                              wire76 : wire79) ?
                          (|wire79) : (wire78 ? wire78 : (8'ha1))))));
  assign wire82 = (8'h9d);
  assign wire83 = ($signed(wire77) ~^ wire82[(4'he):(4'hc)]);
  assign wire84 = (&(&$signed((wire82 ? wire78[(1'h0):(1'h0)] : {(7'h44)}))));
  assign wire85 = ($unsigned($signed(wire76)) ?
                      {$signed((((7'h40) << wire80) >> wire76)),
                          ({{wire82}, (wire82 ? (8'hb0) : wire84)} ?
                              wire75[(1'h1):(1'h0)] : wire84[(3'h6):(3'h4)])} : $signed($unsigned(wire81)));
  assign wire86 = wire78;
  assign wire87 = $unsigned($unsigned((wire82[(5'h12):(2'h2)] >= (^$unsigned(wire76)))));
  assign wire88 = $unsigned(wire85);
  assign wire89 = {{$signed(($signed(wire76) ?
                              (wire79 & wire83) : $signed(wire86))),
                          wire77[(3'h5):(1'h0)]}};
  assign wire90 = (+wire89);
  assign wire91 = $unsigned($unsigned(wire80));
endmodule

module module26
#(parameter param71 = (|(~^(({(8'hb4), (8'hb7)} ^ {(8'ha0), (8'hb4)}) >> (((8'ha5) || (8'ha8)) ? (~|(8'ha8)) : (~|(8'h9f)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire31;
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire31,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = (~wire28[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned((!wire29[(3'h7):(2'h3)])))))
        begin
          reg32 <= wire30;
          reg33 <= $signed((($unsigned($signed(wire27)) ~^ {reg32[(3'h4):(3'h4)]}) ^~ wire27));
          if ((((-wire30) << {(|wire31)}) ^~ $signed({wire27[(4'hf):(4'ha)],
              (((7'h42) ? reg32 : wire27) && {wire29})})))
            begin
              reg34 <= (wire30 ?
                  (((-(wire29 + wire30)) >>> ($signed(wire31) | (wire27 * (8'had)))) ?
                      (reg33[(1'h0):(1'h0)] ?
                          ({wire29} ?
                              reg33[(2'h2):(1'h1)] : (8'ha7)) : (wire31 || (wire27 ?
                              (7'h42) : (8'h9e)))) : $signed($unsigned(reg32[(1'h0):(1'h0)]))) : (wire27[(4'h8):(1'h1)] ?
                      $unsigned((reg32 ?
                          $unsigned((8'hb3)) : $signed(wire27))) : reg33));
              reg35 <= reg33[(2'h2):(1'h1)];
              reg36 <= $unsigned(((($signed(wire31) ?
                      (wire27 ? reg35 : (8'ha1)) : (|wire31)) ?
                  ((~&reg32) << wire30[(3'h4):(1'h1)]) : ($unsigned(wire30) * (7'h41))) < (8'hba)));
            end
          else
            begin
              reg34 <= wire27[(2'h3):(1'h1)];
              reg35 <= (wire29[(3'h4):(3'h4)] > $signed({(|reg32[(1'h1):(1'h0)])}));
              reg36 <= (|$signed(((~^wire28) + wire28)));
              reg37 <= reg33;
              reg38 <= {$signed((($signed(wire30) * (!wire28)) ?
                      (~&((7'h42) ^~ reg33)) : reg36[(1'h0):(1'h0)]))};
            end
          reg39 <= (($unsigned(reg33) >>> wire30[(3'h4):(3'h4)]) <= (~$unsigned($unsigned((wire31 ?
              reg37 : wire31)))));
          reg40 <= (reg37[(1'h0):(1'h0)] ?
              $unsigned((~&reg39[(5'h11):(4'h8)])) : ($signed($signed({wire30,
                  reg39})) & (+$signed((reg35 ? reg35 : wire28)))));
        end
      else
        begin
          reg32 <= ($signed($unsigned(reg32[(4'h9):(3'h4)])) != $unsigned(reg34[(2'h3):(2'h3)]));
          reg33 <= $signed(((8'hb4) ^~ $unsigned(reg39[(5'h13):(3'h7)])));
          reg34 <= $unsigned((wire30[(1'h0):(1'h0)] ?
              ({{reg39, reg32}} ?
                  reg37[(4'h8):(4'h8)] : (~|(wire30 != reg40))) : $unsigned(reg35[(1'h0):(1'h0)])));
        end
      reg41 <= ((~^wire28) + (reg35 <<< $unsigned({{reg35, wire30},
          $signed(reg38)})));
      reg42 <= reg40;
      if (wire29)
        begin
          if ((8'hab))
            begin
              reg43 <= reg34[(1'h1):(1'h0)];
              reg44 <= ((&((reg43 && wire30[(1'h0):(1'h0)]) + $unsigned((wire27 <<< (8'hb8))))) >> $unsigned($unsigned(($signed(reg37) <= reg37[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg43 <= (+$unsigned(wire27));
              reg44 <= (8'hb6);
              reg45 <= reg34[(3'h4):(1'h0)];
            end
          reg46 <= (((8'hab) >= ($signed(reg43) ?
              (wire28[(3'h5):(3'h4)] ?
                  (~|(8'ha3)) : wire29) : $unsigned((wire29 ?
                  reg39 : reg34)))) << (^reg45[(2'h3):(1'h1)]));
          reg47 <= (8'ha3);
        end
      else
        begin
          reg43 <= (((($unsigned(wire27) || {wire31}) * (reg37[(4'h9):(2'h3)] >> $signed((8'hb5)))) ?
              $unsigned($unsigned((~&reg41))) : $unsigned({(!reg45),
                  $unsigned(reg32)})) + reg44[(5'h10):(3'h7)]);
          if (reg39)
            begin
              reg44 <= (~|reg40);
              reg45 <= (((~|(~{wire30})) * $signed(({reg42,
                  reg45} || reg36[(4'h9):(3'h5)]))) >> ($signed($signed($unsigned(wire29))) <<< {(reg42 ?
                      $unsigned(reg35) : wire27)}));
              reg46 <= reg38;
            end
          else
            begin
              reg44 <= {$signed(wire28[(3'h7):(2'h2)]),
                  $unsigned($signed((~|wire31[(1'h1):(1'h0)])))};
              reg45 <= reg47;
              reg46 <= (+$signed($signed($signed($unsigned(wire30)))));
              reg47 <= reg36;
              reg48 <= $signed(reg39[(4'h9):(2'h3)]);
            end
        end
      if ($signed(reg45[(3'h5):(1'h1)]))
        begin
          reg49 <= reg38[(2'h2):(2'h2)];
          reg50 <= (~|(~^wire31[(1'h1):(1'h1)]));
        end
      else
        begin
          reg49 <= reg36;
          reg50 <= $signed($signed((wire28 ?
              $unsigned(reg47[(2'h3):(2'h2)]) : $signed($unsigned((7'h40))))));
          reg51 <= (reg35 ?
              (reg37[(4'hc):(3'h4)] ?
                  reg44[(4'he):(2'h3)] : $unsigned($unsigned((!reg32)))) : reg39);
          reg52 <= $signed($unsigned((^(&(|reg37)))));
        end
    end
  always
    @(posedge clk) begin
      reg53 <= (wire31[(3'h5):(3'h4)] & (^~$unsigned(($signed(reg52) | (&wire28)))));
      reg54 <= reg47;
      reg55 <= reg50[(1'h1):(1'h1)];
      if ($unsigned(reg40[(4'ha):(4'h9)]))
        begin
          reg56 <= {$unsigned(reg34), (-reg44)};
          reg57 <= (^~reg53);
          reg58 <= (wire28[(4'he):(3'h5)] <<< $unsigned((reg54[(3'h5):(1'h0)] ~^ {(reg45 & reg44)})));
        end
      else
        begin
          reg56 <= $unsigned(reg44);
          reg57 <= $signed(reg40[(4'he):(1'h0)]);
          if (reg43[(2'h3):(2'h2)])
            begin
              reg58 <= (~&({{$signed(reg54), reg33},
                      ($signed(wire30) >> (|reg43))} ?
                  {{((8'hb7) && reg39)}, $signed(reg39)} : reg34));
              reg59 <= reg44[(1'h0):(1'h0)];
              reg60 <= $unsigned(reg33[(1'h0):(1'h0)]);
              reg61 <= (reg52[(1'h1):(1'h1)] & ($unsigned(((~^reg45) > $signed(reg52))) != reg43[(3'h7):(2'h2)]));
            end
          else
            begin
              reg58 <= reg36;
            end
          reg62 <= ($unsigned(reg43) ^~ reg51[(4'he):(4'he)]);
          if ($signed(((reg39 ?
                  $unsigned(reg55[(3'h6):(3'h6)]) : ((reg42 ~^ (8'haf)) ?
                      {(8'haa), reg60} : $signed(reg54))) ?
              reg40[(1'h1):(1'h1)] : $unsigned({(reg57 ? reg32 : wire30),
                  $unsigned((7'h44))}))))
            begin
              reg63 <= reg54;
              reg64 <= (+reg54);
              reg65 <= $signed($signed($signed($unsigned(reg63[(2'h3):(1'h1)]))));
              reg66 <= (8'hb2);
            end
          else
            begin
              reg63 <= reg48;
              reg64 <= {((8'h9d) == $signed((7'h42)))};
            end
        end
    end
  assign wire67 = $unsigned((reg45[(4'h8):(3'h7)] ?
                      (^(reg65[(3'h6):(2'h3)] >> reg35)) : reg38));
  assign wire68 = reg44;
  assign wire69 = $unsigned(wire31);
  assign wire70 = (((($signed(reg42) ? (~reg36) : (reg32 ? reg57 : (8'ha5))) ?
                      $signed((reg45 ?
                          wire29 : reg49)) : ($unsigned((8'ha5)) ^~ $signed(wire69))) > reg47) * (~^reg36));
endmodule

module module131
#(parameter param168 = (&{(~|(8'hb6))}), 
parameter param169 = (!(param168 - (((param168 <<< param168) * {param168, param168}) | ({param168, param168} >= (param168 ? (8'hb7) : param168))))))
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire136;
  input wire signed [(5'h12):(1'h0)] wire135;
  input wire signed [(3'h6):(1'h0)] wire134;
  input wire signed [(5'h12):(1'h0)] wire133;
  input wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire167;
  wire [(3'h5):(1'h0)] wire166;
  wire signed [(5'h13):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire158;
  wire [(4'h8):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire143,
                 wire138,
                 wire137,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire137 = $unsigned(({((|(8'hb3)) ?
                               wire132 : wire133[(3'h6):(2'h3)])} ?
                       ($signed($signed((8'ha7))) < wire136) : $unsigned($signed($unsigned((8'hb4))))));
  assign wire138 = ({($unsigned((~^wire133)) ~^ (wire137[(1'h1):(1'h0)] + wire133))} ?
                       $unsigned((&(&$unsigned(wire136)))) : $signed(wire134));
  always
    @(posedge clk) begin
      reg139 <= {($signed((^(&(8'hbc)))) ^ (wire134 ?
              wire135 : wire134[(2'h2):(1'h1)])),
          ($unsigned($unsigned({(8'hba)})) ~^ {wire133,
              ($signed((8'ha1)) >>> (8'hbe))})};
      reg140 <= $signed(reg139);
      reg141 <= (reg140 ?
          wire134[(3'h6):(2'h3)] : (($unsigned(wire133) ?
              $signed(wire134[(2'h2):(1'h0)]) : ((reg139 ? wire138 : wire134) ?
                  wire134[(3'h4):(1'h1)] : (wire137 ?
                      wire137 : (8'ha2)))) - {(&$unsigned(wire133))}));
      reg142 <= (wire138[(2'h2):(2'h2)] ?
          $signed(wire134[(3'h4):(2'h3)]) : (8'hb5));
    end
  assign wire143 = $signed($signed((&(reg142[(1'h1):(1'h1)] ?
                       (~&wire133) : $unsigned(reg139)))));
  always
    @(posedge clk) begin
      reg144 <= $unsigned($signed($signed(reg140[(2'h2):(1'h1)])));
      if ((reg142[(1'h1):(1'h0)] ?
          {((-(^~reg139)) ?
                  {$signed(reg144)} : wire138[(2'h2):(1'h1)])} : (+(reg142 ?
              ($unsigned(wire132) ?
                  wire136 : {wire138}) : {((8'hb1) >= wire137),
                  $signed(wire133)}))))
        begin
          if ((($signed($signed({wire138})) != (^$unsigned(((8'hb6) ?
              wire132 : wire134)))) ^~ wire143))
            begin
              reg145 <= ((&{$signed(reg139)}) ?
                  (~$signed(reg140[(4'h8):(2'h2)])) : wire133[(4'he):(2'h2)]);
              reg146 <= {$signed(((^~(wire143 ?
                      (8'hbe) : wire132)) & (~&$signed(reg140))))};
              reg147 <= $signed((reg139 ?
                  reg140[(4'h9):(3'h5)] : $unsigned(wire138[(4'hb):(3'h6)])));
              reg148 <= {((8'hb2) ?
                      ((reg142[(2'h2):(1'h1)] * (^~wire133)) ?
                          $unsigned($signed(wire134)) : (~&reg141)) : reg146),
                  ((reg142[(2'h2):(1'h1)] ?
                          $unsigned((wire137 * (8'h9d))) : reg147[(1'h0):(1'h0)]) ?
                      $unsigned(((7'h40) >> (wire133 <= wire134))) : ((((8'hbe) ?
                                  (8'hbe) : wire136) ?
                              ((8'hab) ? (7'h41) : reg142) : (~^wire135)) ?
                          {(reg139 ? reg144 : (8'hbd)),
                              (wire137 ?
                                  wire134 : reg147)} : {(reg139 < wire143),
                              (&wire133)}))};
              reg149 <= reg145[(2'h2):(1'h0)];
            end
          else
            begin
              reg145 <= ({(wire133[(3'h5):(3'h4)] ?
                      $signed(wire133) : ((reg145 ^~ reg141) ?
                          (^~reg142) : wire138[(4'h9):(4'h8)])),
                  {reg149}} != (^($signed(wire135) > (!$signed(reg149)))));
            end
          reg150 <= (~^$signed($unsigned($signed((reg139 ?
              wire134 : reg147)))));
        end
      else
        begin
          reg145 <= {((-wire136) ?
                  (-(wire136 ?
                      (reg147 << reg140) : wire137)) : ($signed((~^wire132)) ?
                      ((!wire132) ?
                          $unsigned(wire137) : ((8'h9c) <<< reg140)) : reg140)),
              ($unsigned((~&((8'hb2) < wire135))) ?
                  (((-wire143) >> $signed(wire133)) * $unsigned(reg141)) : (!(&(reg145 ?
                      wire134 : reg150))))};
          if (reg145)
            begin
              reg146 <= (reg146 ? wire132 : (^~{$signed($signed(wire135))}));
            end
          else
            begin
              reg146 <= $signed(reg150);
              reg147 <= ((reg142 ?
                  ((&(wire134 == wire135)) != $unsigned($signed(wire143))) : {((wire132 ?
                          reg142 : reg139) ^ (~|wire132))}) <= $signed($unsigned(reg146)));
              reg148 <= (wire134[(3'h5):(1'h0)] << ($signed((~&$signed(wire138))) - $unsigned(reg139)));
            end
          reg149 <= $unsigned((!wire132));
        end
      reg151 <= $unsigned($signed((reg144[(2'h2):(1'h1)] ?
          ($signed(wire132) ?
              $signed(wire135) : (reg145 ?
                  reg144 : (8'hbb))) : $signed((^~wire134)))));
      reg152 <= reg147[(1'h1):(1'h0)];
      reg153 <= $unsigned(reg147[(2'h2):(2'h2)]);
    end
  assign wire154 = (8'ha5);
  assign wire155 = (((((~^(7'h43)) ?
                               $signed(reg149) : {wire132,
                                   (7'h40)}) != wire154) ?
                           (8'hb7) : {(^~$signed(reg141)),
                               $unsigned((+(8'ha6)))}) ?
                       ((~$unsigned(((8'hba) ? wire133 : wire154))) ?
                           (reg149 ~^ reg140) : $signed($signed((wire154 ?
                               wire135 : wire136)))) : (&$signed(reg144[(3'h5):(2'h2)])));
  assign wire156 = $unsigned(((reg146[(1'h0):(1'h0)] ?
                       wire133[(4'hf):(4'h8)] : reg144[(4'ha):(3'h4)]) && reg147));
  assign wire157 = wire137[(3'h6):(3'h5)];
  assign wire158 = (reg150 != reg153);
  always
    @(posedge clk) begin
      reg159 <= (wire132 * $signed(reg141[(1'h1):(1'h0)]));
      reg160 <= (((reg139 >= wire156) >> (~^reg149)) << (~|reg145[(4'hf):(4'he)]));
      reg161 <= ($signed((((wire132 << reg146) <<< $unsigned(wire155)) >> wire134[(1'h0):(1'h0)])) && $signed((^~(!wire158))));
      reg162 <= $signed(((~|(~$signed(reg161))) + reg150));
      reg163 <= reg150;
    end
  assign wire164 = (({($unsigned(wire156) >> $unsigned(reg144)),
                       (8'ha1)} != $signed($signed(reg151))) | ((($unsigned(wire155) ?
                               (reg150 ?
                                   wire135 : reg152) : $unsigned(reg146)) ?
                           $unsigned(reg151) : (^~wire156[(2'h2):(2'h2)])) ?
                       (^$signed($unsigned(reg146))) : (($signed(reg163) | $signed(reg152)) ?
                           {wire135} : (reg161[(1'h1):(1'h1)] ?
                               wire155 : (wire154 != reg161)))));
  assign wire165 = ({$unsigned({(reg159 ? reg152 : reg145), (reg161 * reg144)}),
                       {reg160,
                           (reg160 <<< $unsigned(wire137))}} < wire134[(3'h6):(3'h6)]);
  assign wire166 = (8'had);
  assign wire167 = {(-wire133[(5'h11):(2'h2)])};
endmodule
