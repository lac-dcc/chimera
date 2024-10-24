module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire110;
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire106,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire66,
                 wire108,
                 wire110,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 (1'h0)};
  module5 #() modinst67 (wire66, clk, wire0, wire2, wire3, wire1);
  always
    @(posedge clk) begin
      reg68 <= wire2;
    end
  always
    @(posedge clk) begin
      reg69 <= {$unsigned($unsigned(wire4[(4'hf):(4'hc)])),
          ((((wire0 * reg68) && $signed(wire3)) != ((wire66 + wire2) ?
              (+reg68) : (^~wire4))) <<< $unsigned(wire2[(4'h9):(3'h4)]))};
      reg70 <= (($unsigned(wire3[(5'h13):(2'h2)]) * ({wire66} ^~ reg69[(2'h2):(1'h0)])) > $unsigned(wire2));
      reg71 <= reg68;
      reg72 <= reg68[(3'h5):(1'h1)];
      reg73 <= $unsigned(($unsigned(wire4[(2'h2):(2'h2)]) ?
          (reg71 ? wire2[(1'h0):(1'h0)] : wire1) : $unsigned(($signed(reg70) ?
              (reg72 ? (8'ha1) : wire2) : (wire3 ? wire4 : wire3)))));
    end
  assign wire74 = {wire1};
  assign wire75 = ((wire2[(4'hd):(1'h1)] ?
                          reg73 : $signed($unsigned((wire0 ?
                              wire74 : wire4)))) ?
                      $signed($unsigned({$signed((8'hbe))})) : $unsigned($unsigned(((wire2 ?
                          reg71 : wire3) * (wire4 >> (8'hb5))))));
  assign wire76 = ((~({wire74, $signed(reg70)} >> reg70)) ?
                      (~$unsigned((8'ha6))) : $signed(reg71[(4'hb):(2'h2)]));
  assign wire77 = (+$signed((~&reg69[(1'h1):(1'h0)])));
  assign wire78 = wire76;
  assign wire79 = ({(!reg68[(2'h2):(2'h2)]), wire78} && $signed(reg70));
  assign wire80 = wire74[(4'h8):(3'h6)];
  module81 #() modinst107 (.wire86(wire76), .wire83(wire75), .clk(clk), .wire85(wire80), .y(wire106), .wire82(wire1), .wire84(wire77));
  module14 #() modinst109 (wire108, clk, wire74, wire106, wire80, wire75);
  module92 #() modinst111 (.wire94(wire2), .wire96(wire108), .y(wire110), .wire95(reg69), .clk(clk), .wire93(wire1));
  module5 #() modinst113 (.wire6(wire0), .wire8(wire4), .wire7(wire79), .clk(clk), .wire9(wire108), .y(wire112));
  assign wire114 = $unsigned($signed(wire76[(4'h8):(3'h4)]));
  assign wire115 = $unsigned(wire114);
  assign wire116 = wire76[(3'h4):(3'h4)];
  module14 #() modinst118 (.wire16(wire4), .y(wire117), .wire17(reg69), .wire18(wire114), .clk(clk), .wire15(reg68));
  always
    @(posedge clk) begin
      reg119 <= (((wire0 == ((wire80 + wire112) ?
              wire66[(3'h7):(3'h7)] : (wire3 <= reg68))) ?
          $signed((~|$unsigned(wire117))) : (({wire66,
              reg68} >>> wire3) <= $signed($signed(wire106)))) || $signed($signed(($unsigned(wire3) ?
          (reg70 * wire112) : (reg69 ^~ (8'ha4))))));
      if ($unsigned((8'ha8)))
        begin
          reg120 <= (($signed(wire77[(2'h3):(2'h3)]) >= (reg119[(3'h6):(3'h6)] == {$unsigned(reg71),
                  (wire80 ? wire75 : reg69)})) ?
              $unsigned((~|((wire66 <= wire66) ?
                  (~^wire114) : wire79))) : wire74);
          reg121 <= wire115[(4'ha):(3'h7)];
        end
      else
        begin
          reg120 <= wire74[(2'h2):(1'h0)];
          reg121 <= wire4[(5'h11):(4'ha)];
          reg122 <= wire76;
          if (wire1[(1'h1):(1'h1)])
            begin
              reg123 <= $signed(wire66[(4'h9):(4'h8)]);
              reg124 <= ($unsigned((^~$signed(wire115[(4'h9):(1'h1)]))) <<< (($signed(((8'ha7) ?
                      wire80 : reg68)) > $unsigned(wire77[(1'h1):(1'h1)])) ?
                  $signed(wire78[(3'h7):(2'h2)]) : {wire0,
                      wire2[(3'h5):(2'h3)]}));
              reg125 <= $unsigned(((!(+wire116)) ?
                  ({wire75[(4'h8):(3'h4)], reg120} ?
                      ((|(8'ha2)) ?
                          $signed(wire78) : {wire0,
                              wire116}) : wire78[(3'h6):(2'h3)]) : wire80[(4'hd):(4'hb)]));
            end
          else
            begin
              reg123 <= {reg71};
              reg124 <= (&($signed(((~wire110) >> $unsigned(wire75))) ?
                  {{{reg122, (8'hab)}, (^~wire75)}} : reg71));
              reg125 <= $unsigned(wire0[(2'h3):(2'h2)]);
            end
        end
      if ((wire80[(4'hb):(3'h4)] != (wire108[(1'h0):(1'h0)] ?
          {reg119[(2'h3):(1'h0)]} : (-(+wire110[(3'h4):(2'h2)])))))
        begin
          reg126 <= $signed((~&($signed((wire74 >>> (8'hbf))) ~^ $unsigned(wire116[(2'h3):(2'h2)]))));
          if (((-$signed(reg70[(1'h0):(1'h0)])) ?
              (|(~^((^~(8'hb4)) ^~ ((8'ha6) ?
                  wire79 : wire112)))) : ($signed(wire4) ?
                  (reg122[(4'hd):(1'h1)] | $signed($unsigned(wire0))) : (^~$signed((wire78 ^ wire76))))))
            begin
              reg127 <= $unsigned($unsigned(reg126));
            end
          else
            begin
              reg127 <= ($unsigned(reg69[(2'h3):(1'h0)]) ?
                  (|(wire75 < wire75)) : (reg127 ?
                      reg73 : (~&$unsigned((~^(8'hb3))))));
              reg128 <= ({(((^(8'hba)) || wire2) >>> (^~(reg124 ?
                      (8'hb6) : wire2))),
                  ({(^wire114), (|(8'ha8))} ?
                      $unsigned((reg126 - wire116)) : $signed(wire74))} != $signed($signed(wire116[(2'h3):(2'h3)])));
              reg129 <= $unsigned(wire78);
              reg130 <= {reg123[(3'h4):(1'h0)], $signed(wire0[(2'h2):(1'h0)])};
            end
          reg131 <= {wire106};
          if ($unsigned($signed({(((8'hb3) ? reg68 : wire115) ?
                  (~&reg131) : ((8'hb8) >= wire78)),
              reg124})))
            begin
              reg132 <= $signed(wire77);
            end
          else
            begin
              reg132 <= ($signed(($signed($signed(wire106)) ?
                      (&$unsigned(wire4)) : $unsigned((reg72 << wire106)))) ?
                  reg123[(2'h3):(1'h0)] : $unsigned($unsigned($unsigned($signed(reg129)))));
              reg133 <= (!(&(-$unsigned($unsigned(reg129)))));
              reg134 <= (~&wire4[(3'h4):(2'h3)]);
              reg135 <= (({$unsigned((wire75 ? wire0 : reg70))} ?
                  ($unsigned({(8'hae)}) * reg70[(3'h4):(3'h4)]) : ($unsigned(reg133[(4'hc):(1'h1)]) >= (+$unsigned(wire1)))) ~^ {(!$unsigned($unsigned(wire114))),
                  wire77[(1'h1):(1'h1)]});
              reg136 <= $signed(reg122);
            end
        end
      else
        begin
          reg126 <= reg124;
          reg127 <= $unsigned({(8'ha5)});
          if ((-(!{($signed(reg136) ? (reg132 == wire115) : {reg71, reg72}),
              reg123[(1'h0):(1'h0)]})))
            begin
              reg128 <= $signed($unsigned(reg134[(1'h1):(1'h0)]));
              reg129 <= (&(+$signed($signed(((8'hab) + reg126)))));
              reg130 <= wire115[(3'h5):(2'h3)];
              reg131 <= reg129;
              reg132 <= $unsigned(wire4[(2'h2):(1'h1)]);
            end
          else
            begin
              reg128 <= (~^$signed($signed((|(wire4 ? wire78 : reg120)))));
            end
        end
    end
endmodule

module module81  (y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire86;
  input wire signed [(5'h14):(1'h0)] wire85;
  input wire signed [(2'h2):(1'h0)] wire84;
  input wire signed [(4'ha):(1'h0)] wire83;
  input wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  assign y = {wire105, wire103, wire91, wire90, wire89, wire88, wire87, (1'h0)};
  assign wire87 = ($signed($unsigned($unsigned((wire83 || wire84)))) ?
                      wire84 : $unsigned((wire85 >> wire83)));
  assign wire88 = {{$unsigned((^~(^wire85))),
                          ((&wire82[(3'h4):(3'h4)]) ?
                              wire87[(2'h3):(1'h0)] : wire86[(3'h4):(1'h1)])}};
  assign wire89 = ($unsigned(($unsigned(wire82) || $signed($unsigned((8'hae))))) ?
                      (~wire84[(2'h2):(2'h2)]) : wire87);
  assign wire90 = wire85[(4'hb):(1'h0)];
  assign wire91 = wire85;
  module92 #() modinst104 (wire103, clk, wire82, wire86, wire88, wire85);
  assign wire105 = $unsigned((wire103[(1'h0):(1'h0)] ?
                       $unsigned(wire87) : (~^$signed(wire90))));
endmodule

module module5
#(parameter param64 = (~{(+{((8'ha5) << (7'h43)), ((7'h40) - (8'had))}), (|({(8'h9f)} != {(8'hbb), (8'hbb)}))}), 
parameter param65 = {(((-(param64 >> param64)) ? (((8'hbf) ? param64 : param64) ^ (param64 ? param64 : param64)) : {param64, param64}) >> (-(((8'hbc) >= (7'h40)) ? (param64 ? param64 : param64) : (^param64))))})
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire46;
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire28,
                 wire30,
                 wire46,
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
                 (1'h0)};
  assign wire10 = (8'hba);
  assign wire11 = $unsigned((~wire8));
  assign wire12 = wire9[(2'h2):(1'h0)];
  assign wire13 = ($signed(((-{wire11, wire11}) ?
                          $unsigned((wire9 ?
                              (8'hbe) : wire9)) : ($unsigned(wire7) ?
                              (8'ha2) : (wire7 | wire6)))) ?
                      wire6 : ($unsigned(($unsigned(wire6) ?
                          (wire6 - wire12) : (wire8 ?
                              wire8 : wire8))) ^~ (8'h9f)));
  module14 #() modinst29 (.wire15(wire8), .wire16(wire6), .wire17(wire7), .clk(clk), .wire18(wire13), .y(wire28));
  assign wire30 = $unsigned((-(($signed(wire10) ? wire8 : $signed((8'hbf))) ?
                      (wire11 ?
                          wire9[(1'h0):(1'h0)] : $unsigned((8'ha4))) : (wire13[(1'h1):(1'h1)] ^~ (wire9 >>> (8'ha5))))));
  module31 #() modinst47 (wire46, clk, wire7, wire28, wire6, wire30, wire13);
  always
    @(posedge clk) begin
      reg48 <= (&(^wire13));
      if ($unsigned((+wire11)))
        begin
          reg49 <= wire6[(4'hc):(3'h4)];
        end
      else
        begin
          if (((8'ha4) != {($signed((wire11 >> wire9)) ?
                  (wire7 ? $unsigned(wire7) : wire10) : (-wire6)),
              wire28}))
            begin
              reg49 <= ($signed((wire13 ^~ (~&((7'h44) ? reg49 : wire11)))) ?
                  wire46 : (wire8[(3'h6):(3'h4)] >>> wire13));
            end
          else
            begin
              reg49 <= {wire46};
              reg50 <= {wire46, (~&$signed(wire46))};
              reg51 <= wire28[(4'h8):(4'h8)];
              reg52 <= ($signed(((wire13 ?
                      $signed(wire6) : $unsigned(wire11)) ^ ($signed(reg48) > $signed(reg48)))) ?
                  wire12 : (reg49 ?
                      $signed((7'h43)) : {$unsigned((reg50 & (8'ha5))),
                          (wire7 ~^ reg49[(2'h2):(2'h2)])}));
              reg53 <= (^$unsigned((8'hb9)));
            end
          reg54 <= (~&$unsigned($unsigned(reg51)));
          if ($unsigned((!({(8'hb3), $signed((8'ha2))} * ((wire6 ?
              reg52 : wire8) - reg51)))))
            begin
              reg55 <= (7'h41);
              reg56 <= $signed($signed($signed(((~wire11) || wire10[(1'h1):(1'h0)]))));
              reg57 <= reg56;
              reg58 <= reg50[(1'h1):(1'h0)];
            end
          else
            begin
              reg55 <= ($unsigned($signed(wire10)) ?
                  ((reg56[(4'h9):(1'h0)] ?
                          reg52 : (wire8[(4'hd):(3'h7)] ?
                              $signed(reg51) : (reg53 & wire7))) ?
                      (wire12[(5'h13):(2'h3)] ?
                          $unsigned($signed(wire11)) : (+$unsigned(wire8))) : (reg58[(3'h5):(2'h3)] ?
                          ($unsigned(wire8) || (+reg53)) : {(8'hb2)})) : (((reg48[(2'h3):(2'h3)] == $unsigned(reg52)) ?
                      ((reg49 ^ wire28) ?
                          $signed(wire11) : wire6[(4'h9):(1'h0)]) : {(reg54 ?
                              wire8 : reg48),
                          wire7[(1'h1):(1'h1)]}) != {reg57,
                      (wire30[(3'h7):(1'h0)] ?
                          (reg48 < (8'ha0)) : (reg55 > wire30))}));
              reg56 <= wire9[(1'h0):(1'h0)];
              reg57 <= reg53;
              reg58 <= (reg55 <<< (($unsigned((~&reg56)) ^~ $unsigned((wire9 ?
                      wire6 : (8'hb9)))) ?
                  (^((+reg57) == $signed(wire9))) : $unsigned(reg56[(1'h1):(1'h0)])));
            end
          reg59 <= $signed(($unsigned(wire6[(4'hc):(2'h3)]) - (wire6 <= reg52[(1'h0):(1'h0)])));
          reg60 <= ($unsigned((wire8 ?
                  {$signed(reg57), $signed(wire28)} : ((wire12 ?
                          wire11 : wire46) ?
                      wire46[(1'h1):(1'h0)] : (reg58 ? wire9 : wire10)))) ?
              (+wire28) : $unsigned($signed(({(8'hb7),
                  reg56} == $unsigned(reg50)))));
        end
      reg61 <= (((wire6 ?
          (reg60[(2'h3):(1'h1)] ?
              (reg60 ? reg59 : reg54) : {reg49, wire9}) : ((~reg48) ?
              (~wire9) : reg60[(1'h1):(1'h1)])) != (~|$signed({(7'h40),
          reg55}))) != ($unsigned(((~^wire9) >> $signed(reg54))) * ($unsigned((&reg49)) ?
          ((reg49 ? wire10 : reg51) >= reg59[(5'h12):(1'h1)]) : ((~wire8) ?
              wire12[(4'hd):(1'h0)] : (reg52 ? (8'hbc) : reg52)))));
    end
  assign wire62 = reg57;
  assign wire63 = (^~(+(reg59 ?
                      $signed((reg51 ? (8'hb0) : (8'hb4))) : {(reg56 ?
                              reg55 : (8'ha5))})));
endmodule

module module31
#(parameter param44 = (((((8'ha4) ? {(8'hb7)} : (&(8'ha8))) ? (((8'hb1) <<< (7'h44)) ? ((8'ha9) ^ (8'hbf)) : (+(8'hae))) : (-((8'ha8) >= (8'ha6)))) - ((^(!(8'hab))) * ({(8'ha9)} ? ((8'ha1) ? (8'hb7) : (8'hbf)) : ((8'hb2) == (8'ha4))))) ? ((~&({(8'hac)} >= (^(8'hb4)))) ? {((-(8'haa)) && ((8'hb8) ? (8'hbf) : (8'ha0)))} : (^~((+(8'hbe)) ^ ((8'ha1) <= (8'hae))))) : (~&((~^(7'h43)) > (((8'hbe) ? (8'h9e) : (8'hbe)) || ((7'h43) ? (8'hb9) : (8'h9f)))))), 
parameter param45 = (param44 ? param44 : ({{(~&(8'haf))}} < param44)))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire36;
  input wire [(3'h4):(1'h0)] wire35;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  assign y = {wire43, wire42, wire41, wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = {wire35,
                      (wire36 ?
                          $signed(((+wire34) ?
                              $signed(wire34) : wire35)) : wire35)};
  assign wire38 = $unsigned((wire35 ?
                      ((^wire36) ?
                          wire36 : {$signed(wire36)}) : $unsigned(wire35[(2'h3):(1'h1)])));
  assign wire39 = (~($unsigned(((wire35 >= wire32) | (wire35 || wire32))) ?
                      wire35 : wire37));
  assign wire40 = wire35;
  assign wire41 = wire34[(1'h1):(1'h1)];
  assign wire42 = wire40;
  assign wire43 = {(+wire37[(1'h0):(1'h0)]), wire42[(3'h5):(3'h5)]};
endmodule

module module14
#(parameter param26 = (((~(-(~&(8'haf)))) <<< ((((8'haf) ? (8'h9c) : (8'h9c)) ? ((8'hb2) ? (8'ha8) : (8'hac)) : ((8'haa) ? (8'hb3) : (8'hab))) >> (&(-(8'ha9))))) ? (((-((8'haf) - (8'hb8))) ^~ ((^~(7'h43)) ? (&(8'ha9)) : ((7'h42) & (7'h43)))) <<< (~(^((8'hbe) >= (8'hbb))))) : (((8'haa) ~^ {(-(8'hb9))}) | ((((8'had) ? (8'hbc) : (8'had)) ? ((8'hb6) && (7'h44)) : ((7'h44) ? (8'ha6) : (8'h9d))) * (-{(8'hb0), (7'h44)})))), 
parameter param27 = (((((param26 ? param26 : param26) ? (param26 ? (7'h43) : param26) : (^~param26)) ? (~&(^param26)) : (-(param26 ? (8'h9f) : param26))) != ({(param26 ? param26 : param26)} ^~ {{param26, param26}, (param26 ? param26 : param26)})) ^ (|param26)))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire25, wire21, wire20, wire19, reg24, reg23, reg22, (1'h0)};
  assign wire19 = ((($signed($signed(wire16)) ?
                          (wire18 ?
                              wire16[(1'h0):(1'h0)] : $unsigned(wire18)) : (wire18[(4'h8):(3'h7)] * $signed(wire18))) ?
                      (~&$unsigned(wire17)) : wire15) & $signed($unsigned((wire18[(2'h3):(1'h1)] < (wire17 ?
                      wire17 : wire17)))));
  assign wire20 = $unsigned(((($signed((8'ha6)) ~^ {wire17, wire17}) ?
                          $signed((wire18 <= wire18)) : ($signed(wire19) ?
                              {(8'hb9), wire18} : $signed(wire17))) ?
                      wire19[(4'he):(2'h3)] : (8'hb5)));
  assign wire21 = (wire16 ?
                      (~&(wire15 ^~ $signed({wire18}))) : {(wire17 ?
                              $signed((-wire16)) : (~|wire17[(2'h3):(1'h0)])),
                          $signed($signed($signed(wire18)))});
  always
    @(posedge clk) begin
      reg22 <= wire20;
      reg23 <= (8'hb9);
      reg24 <= ((^~wire19) ?
          ((((wire20 ? wire21 : (8'ha7)) & wire19) ?
              ((&reg22) ?
                  wire17 : (wire20 != (8'haf))) : $signed(reg23[(1'h0):(1'h0)])) <<< $signed({(wire21 ?
                  wire16 : reg22),
              wire15[(4'hb):(3'h6)]})) : (~(^~(8'hb5))));
    end
  assign wire25 = ($signed($unsigned(wire18[(2'h3):(1'h0)])) ?
                      $signed((wire21[(1'h0):(1'h0)] >> {{wire20, reg22},
                          $signed((7'h42))})) : (-((wire16[(1'h0):(1'h0)] >> $signed((8'hbd))) - (8'hb3))));
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire signed [(3'h5):(1'h0)] wire94;
  input wire [(2'h2):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire97;
  assign y = {wire102, wire101, wire100, wire99, wire98, wire97, (1'h0)};
  assign wire97 = $unsigned(((~$signed(wire94)) >>> $signed(wire95)));
  assign wire98 = wire94[(2'h3):(2'h3)];
  assign wire99 = wire97;
  assign wire100 = {wire93[(1'h1):(1'h1)]};
  assign wire101 = (~&{$signed(wire96[(1'h1):(1'h0)])});
  assign wire102 = $signed((wire94[(3'h4):(1'h1)] <= (~|{{wire93},
                       wire95[(2'h2):(2'h2)]})));
endmodule
