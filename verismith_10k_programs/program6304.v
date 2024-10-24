module top
#(parameter param142 = ({{(((8'hae) ? (8'ha0) : (8'hb7)) + ((8'hbc) ^~ (7'h43)))}, ((~&(7'h43)) ? (((8'hb4) ? (8'hb2) : (8'hbd)) ? ((8'hba) ? (7'h43) : (8'hb3)) : ((8'h9d) ? (8'hb5) : (8'ha6))) : {((8'hb3) * (8'ha2)), (+(8'h9e))})} + (|((((8'hbc) <<< (7'h41)) & {(8'hbc), (8'ha6)}) ? {(~&(8'had)), {(8'hbc), (8'hac)}} : (((8'hac) ? (8'hbd) : (8'h9c)) ? (8'ha1) : ((8'hb2) ? (8'h9c) : (8'hbb)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire135;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire67,
                 wire69,
                 wire135,
                 (1'h0)};
  module5 #() modinst68 (.wire6(wire1), .wire9(wire4), .wire8(wire0), .wire10(wire3), .clk(clk), .y(wire67), .wire7(wire2));
  assign wire69 = (((($unsigned(wire3) | wire67) ?
                      $unsigned($unsigned(wire0)) : $unsigned((~wire3))) || wire1[(1'h1):(1'h1)]) < (~&(~|$signed({wire3,
                      wire1}))));
  module70 #() modinst136 (wire135, clk, wire67, wire2, wire3, wire69, wire4);
  assign wire137 = $unsigned((!($unsigned(wire135[(3'h5):(3'h4)]) >= wire1)));
  assign wire138 = {{{(~&wire0)}, $unsigned(wire3)}, (7'h44)};
  assign wire139 = wire137;
  assign wire140 = {$unsigned(wire139[(3'h7):(1'h1)]), (~&$signed((8'h9c)))};
  assign wire141 = $signed(wire3[(5'h15):(5'h14)]);
endmodule

module module70
#(parameter param134 = ({(^({(8'hbd), (8'ha2)} >>> ((8'hbe) ? (8'ha5) : (8'hb1)))), ((+{(8'hb8), (8'hba)}) <= (~((8'ha2) < (8'hba))))} ? (~&{{((8'ha7) < (8'ha4))}}) : (~^(|(((8'ha0) ^~ (7'h40)) ? ((8'ha2) ? (8'hb5) : (8'ha2)) : ((7'h44) != (7'h44)))))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire74;
  input wire [(4'hb):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire130;
  assign y = {wire133, wire132, wire91, wire76, wire130, (1'h0)};
  assign wire76 = wire75;
  module77 #() modinst92 (wire91, clk, wire71, wire73, wire74, wire72, wire75);
  module93 #() modinst131 (wire130, clk, wire76, wire75, wire73, wire74, wire71);
  assign wire132 = wire130;
  assign wire133 = $unsigned((wire91[(2'h2):(2'h2)] <<< wire73[(4'ha):(3'h7)]));
endmodule

module module5
#(parameter param66 = (~|((~^(&((8'had) ^~ (8'h9f)))) ? ((((8'hb7) == (8'hbd)) * ((8'hae) ^~ (8'hb8))) && (((8'hbf) ? (8'ha4) : (8'hb8)) * {(8'haa)})) : (8'hb7))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire56;
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire56,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  module11 #() modinst57 (wire56, clk, wire7, wire8, wire10, wire6);
  assign wire58 = (!({wire6[(2'h3):(2'h2)], $signed(wire9[(3'h4):(1'h1)])} ?
                      (&(8'h9d)) : $unsigned((^{wire9}))));
  assign wire59 = $signed(wire6[(3'h6):(3'h4)]);
  assign wire60 = wire56[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      if (((wire59 <<< (^(~^(wire9 ?
          wire56 : wire58)))) << wire7[(4'h9):(3'h6)]))
        begin
          reg61 <= $signed((8'hba));
        end
      else
        begin
          reg61 <= wire60[(4'h8):(2'h3)];
          reg62 <= {{$unsigned(({(8'hab)} ?
                      wire56[(4'h9):(3'h6)] : (wire59 ? (8'hbe) : wire9)))},
              {$unsigned(wire58[(2'h2):(2'h2)])}};
        end
      reg63 <= (-(wire8[(4'hf):(4'he)] || reg61));
      reg64 <= wire9;
      reg65 <= {(($unsigned(wire8) ? (^~(7'h43)) : $unsigned(wire8)) ?
              wire58[(4'hd):(4'ha)] : {(wire10[(4'hc):(3'h7)] <= wire10[(3'h6):(3'h5)]),
                  $unsigned((8'hbd))}),
          (^$signed(wire58[(5'h12):(3'h4)]))};
    end
endmodule

module module11
#(parameter param55 = (({(8'ha2), (8'ha4)} << ((~|((8'hb3) == (8'hba))) ? (((8'ha9) ? (8'h9d) : (8'hbd)) & ((8'ha0) ? (8'h9d) : (8'hae))) : (~|((7'h41) ? (8'hb6) : (7'h41))))) ? ((~|(((8'ha3) ? (8'h9d) : (8'ha2)) || {(8'hb9)})) << ({{(8'ha2)}} ? (((8'ha8) == (8'hb9)) && ((8'ha2) ? (8'hbb) : (8'hbd))) : (&(!(8'hbd))))) : ({{(|(8'hbf)), ((8'hb0) ? (8'ha3) : (8'ha9))}} >> {{((8'ha3) ? (8'hb5) : (7'h43))}})))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  assign y = {wire54,
                 wire43,
                 wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed((wire12 | $unsigned({wire12})))))
        begin
          reg16 <= wire14;
          reg17 <= wire14[(3'h4):(3'h4)];
          reg18 <= ((wire14[(1'h0):(1'h0)] ?
                  wire14 : $signed({$signed(wire14)})) ?
              wire14 : $unsigned(reg17));
          reg19 <= ((~|(!wire15)) ?
              ($unsigned(reg16) ? wire14[(4'h8):(2'h2)] : (8'ha1)) : reg17);
        end
      else
        begin
          if ($signed(wire15[(2'h3):(1'h0)]))
            begin
              reg16 <= ($unsigned(($signed($signed(wire12)) ?
                  ((^wire15) + (wire15 ?
                      reg19 : wire15)) : (+(reg19 ^ reg16)))) >> $unsigned((wire13[(1'h1):(1'h1)] ?
                  $signed((~&wire13)) : ({wire12} ?
                      {wire13, reg17} : $unsigned(reg18)))));
              reg17 <= {wire14[(4'hd):(3'h4)],
                  $signed((($unsigned((8'ha2)) < {reg17,
                      wire14}) != $signed((~wire13))))};
              reg18 <= wire12[(3'h5):(2'h2)];
            end
          else
            begin
              reg16 <= ((wire15[(3'h6):(1'h1)] == ((^(reg16 && wire14)) && $signed(reg19[(2'h2):(2'h2)]))) ?
                  $signed($unsigned(wire12[(2'h3):(1'h1)])) : ($unsigned($unsigned(reg18[(4'h9):(4'h8)])) ^~ reg19));
            end
          reg19 <= (wire13 && $signed(((((7'h44) ? (8'hb6) : wire12) ?
              wire15 : wire13) << reg18[(1'h0):(1'h0)])));
          reg20 <= (+(-reg17[(3'h7):(3'h5)]));
          reg21 <= wire15[(4'h9):(3'h4)];
          reg22 <= $signed((($unsigned(wire13) ^ $unsigned($signed(wire12))) || $unsigned((~|(wire12 ?
              reg20 : wire15)))));
        end
    end
  assign wire23 = $unsigned((^~wire14));
  assign wire24 = ($signed((reg20[(2'h3):(1'h1)] & {((7'h43) ?
                              wire15 : reg21)})) ?
                      $unsigned(({(wire15 <= (8'haa)), $signed(reg18)} ?
                          $unsigned(wire15) : wire12[(1'h1):(1'h1)])) : {$unsigned((((8'hab) * (8'hbc)) << (wire14 ?
                              wire14 : wire15)))});
  assign wire25 = (-wire12);
  assign wire26 = (|(^{(+$unsigned(reg18))}));
  assign wire27 = reg21[(3'h7):(2'h3)];
  assign wire28 = $unsigned($signed(reg20));
  assign wire29 = reg22[(4'h9):(4'h9)];
  assign wire30 = ((!reg22[(4'h8):(3'h4)]) && $signed((^(^$unsigned(wire25)))));
  always
    @(posedge clk) begin
      reg31 <= $unsigned(wire30);
      reg32 <= (~reg31[(2'h2):(2'h2)]);
      reg33 <= reg22;
      reg34 <= ($unsigned($unsigned($unsigned((reg32 * wire14)))) ?
          (&(~^$signed(wire12[(3'h4):(1'h0)]))) : reg31[(1'h1):(1'h1)]);
    end
  assign wire35 = ((8'h9d) ? (!(8'ha8)) : $signed((8'hbf)));
  assign wire36 = $signed({({$signed(reg17)} == {(8'hb0)}),
                      wire28[(2'h2):(1'h1)]});
  assign wire37 = $signed((!($unsigned({wire29, (8'ha9)}) ?
                      (^~(wire13 ~^ wire14)) : $signed((wire25 ?
                          wire36 : reg19)))));
  always
    @(posedge clk) begin
      reg38 <= $unsigned(($unsigned((+wire24[(2'h3):(1'h1)])) ?
          $signed((+{wire26, reg17})) : $signed((^~(reg18 ?
              wire35 : wire26)))));
      if ((~((({(7'h40),
          wire29} <= (^~wire14)) << $unsigned((+wire37))) || (!(^~wire29[(3'h7):(2'h3)])))))
        begin
          reg39 <= $unsigned((reg17 ?
              {((reg34 - wire23) && (reg31 ? reg21 : (8'h9e))),
                  $unsigned({wire27,
                      (8'hbd)})} : ((~$unsigned((8'ha7))) < reg20[(3'h5):(2'h3)])));
        end
      else
        begin
          reg39 <= $unsigned($signed($signed($signed($signed(reg18)))));
          reg40 <= (^~(8'hbb));
        end
      reg41 <= $unsigned(wire12[(3'h4):(1'h0)]);
      reg42 <= (wire23 ?
          $unsigned((wire24[(2'h3):(1'h0)] ?
              wire26[(1'h0):(1'h0)] : wire14)) : $unsigned($unsigned(((!reg33) ?
              (reg22 ? wire36 : reg31) : $unsigned(reg31)))));
    end
  assign wire43 = reg42;
  always
    @(posedge clk) begin
      if (wire14)
        begin
          if (wire36[(4'h8):(4'h8)])
            begin
              reg44 <= $unsigned($unsigned((~^(~|wire37[(2'h2):(1'h1)]))));
              reg45 <= $unsigned((reg34 <= (($unsigned((8'hb0)) ?
                  $signed(reg39) : wire26[(2'h2):(1'h1)]) <= $unsigned((wire28 < reg31)))));
              reg46 <= (~|(reg31[(1'h0):(1'h0)] < ($signed((reg38 ?
                      reg19 : reg41)) ?
                  (~^wire15[(1'h1):(1'h0)]) : $signed((^~wire12)))));
              reg47 <= $unsigned($unsigned(($signed($signed((8'hba))) ?
                  $signed((~&reg21)) : (wire28[(3'h7):(3'h6)] ?
                      (reg42 && wire14) : wire29[(4'ha):(3'h7)]))));
            end
          else
            begin
              reg44 <= {(8'hbf),
                  {(wire13[(2'h2):(1'h1)] ?
                          reg45[(1'h1):(1'h0)] : ((~(8'hb8)) ?
                              (reg33 ? wire29 : wire26) : reg34))}};
              reg45 <= (!{($unsigned(reg42[(3'h5):(3'h4)]) == (reg21 ?
                      (wire24 ? reg42 : reg45) : (8'h9e))),
                  (|(~^$unsigned((8'h9f))))});
              reg46 <= (!wire15[(3'h7):(2'h2)]);
            end
          if ({(8'hb2),
              {($unsigned((reg17 >> reg38)) ?
                      reg33 : ((|wire29) ? (~wire26) : reg41))}})
            begin
              reg48 <= ((~^$unsigned($unsigned($signed((8'hae))))) ^ $unsigned(reg19[(1'h0):(1'h0)]));
              reg49 <= (&(~wire23));
              reg50 <= (((8'haf) ?
                  (8'hbb) : reg18[(2'h2):(2'h2)]) != (~&((8'ha5) || $unsigned({reg49,
                  wire12}))));
              reg51 <= ($unsigned(($signed((+wire13)) < (8'hb8))) ?
                  ({(-(reg45 ? wire35 : reg22)), reg18} || ((8'ha7) ?
                      $signed($signed(reg32)) : reg42[(3'h4):(2'h2)])) : ((reg40[(5'h11):(2'h2)] << $unsigned(wire25)) ?
                      ({(+wire29)} + $unsigned((~^reg17))) : reg20[(3'h4):(2'h3)]));
            end
          else
            begin
              reg48 <= ((-wire28[(2'h3):(2'h3)]) ?
                  $signed(($signed($unsigned((8'hbe))) ?
                      (~^reg50) : (+$signed(reg20)))) : (~|reg17[(4'hb):(4'ha)]));
              reg49 <= $unsigned((reg16[(1'h1):(1'h1)] ?
                  (^($unsigned((8'ha0)) ?
                      $unsigned(wire15) : wire30)) : (8'hbe)));
              reg50 <= wire15[(3'h7):(3'h7)];
            end
          if (($unsigned((((wire26 ^ wire26) ?
              ((8'haa) << reg18) : (reg50 ? reg46 : (8'ha6))) - ((reg46 ?
              reg21 : wire43) & reg51[(3'h5):(3'h5)]))) * $signed((&$unsigned(((8'hb8) ?
              (8'hb8) : (8'ha6)))))))
            begin
              reg52 <= (&((({reg19} + reg16) ?
                      {(-reg17),
                          (reg18 ? wire13 : reg20)} : $signed((-reg42))) ?
                  reg16[(2'h2):(1'h1)] : ($unsigned($unsigned(reg47)) <= ({(8'ha2)} ?
                      (&(8'hbf)) : $signed(wire13)))));
            end
          else
            begin
              reg52 <= ($signed(reg38[(5'h12):(2'h2)]) - $unsigned($signed((((8'ha1) != wire28) ?
                  (~|wire30) : (8'h9f)))));
            end
        end
      else
        begin
          reg44 <= {($signed((|reg51)) ?
                  $signed($unsigned($unsigned(reg19))) : reg32[(1'h0):(1'h0)]),
              wire27};
        end
      reg53 <= $unsigned(reg16[(2'h2):(1'h1)]);
    end
  assign wire54 = {$signed(wire28), (-{wire36})};
endmodule

module module93
#(parameter param128 = (!(((^~((8'had) ? (8'ha2) : (8'hb1))) <= (~|((8'hab) != (8'hbd)))) <= ((&((8'hba) + (8'hb7))) ? (((8'hb4) >= (8'ha6)) * (~(8'haf))) : (|((8'had) ~^ (8'ha0)))))), 
parameter param129 = (+((({param128, param128} ? ((8'had) <<< param128) : (8'hba)) ? (+((8'hb2) < param128)) : (param128 ? (param128 == (8'hbb)) : {param128, param128})) + (param128 || ((!(8'ha4)) ? (8'hbd) : param128)))))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire [(3'h4):(1'h0)] wire96;
  input wire signed [(5'h13):(1'h0)] wire95;
  input wire [(4'h9):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire99 = wire95;
  assign wire100 = wire98;
  assign wire101 = ($unsigned((wire95[(5'h11):(4'h8)] >>> wire98)) && $unsigned({$signed(wire99[(2'h3):(1'h1)])}));
  assign wire102 = $signed($signed(wire100[(4'hb):(2'h2)]));
  assign wire103 = (|$unsigned($unsigned($unsigned($signed(wire99)))));
  assign wire104 = ($unsigned(wire101[(2'h3):(1'h0)]) ?
                       $unsigned((&($signed(wire94) * (!(7'h43))))) : wire103);
  assign wire105 = (-{{wire99}, (8'hab)});
  assign wire106 = wire105;
  assign wire107 = ($unsigned($signed((^~wire104))) ?
                       wire102[(1'h1):(1'h1)] : (^wire95[(1'h1):(1'h1)]));
  assign wire108 = $unsigned($signed(($unsigned((wire94 ?
                       wire104 : wire100)) < (+{wire94}))));
  assign wire109 = ($signed(((wire103 ?
                           wire96[(2'h2):(2'h2)] : {wire102, wire94}) ?
                       (^~$unsigned(wire104)) : ($signed(wire108) ?
                           (wire102 * wire96) : (wire106 ?
                               wire104 : (8'ha3))))) || wire100[(5'h11):(4'hb)]);
  assign wire110 = wire109;
  assign wire111 = (~&$signed((-$signed((~|wire98)))));
  assign wire112 = $unsigned($unsigned($signed({(wire108 >>> wire95),
                       {wire94, wire111}})));
  assign wire113 = ($unsigned($signed((^~$unsigned(wire103)))) ?
                       wire97[(2'h3):(2'h3)] : (^~((~(~wire94)) ?
                           (&wire107) : (+(wire102 > wire102)))));
  assign wire114 = (((+($signed(wire105) ?
                               (^~wire106) : (wire95 ? wire101 : wire102))) ?
                           wire106 : {wire103}) ?
                       ((-((wire102 ? wire108 : wire104) - (^wire107))) ?
                           wire105[(2'h2):(1'h0)] : (((wire101 ^~ wire113) ?
                                   wire101 : (wire104 >= wire100)) ?
                               {$signed((8'ha4)), (^~wire110)} : ((7'h40) ?
                                   (wire113 ?
                                       wire110 : wire94) : (|wire110)))) : (wire108 - $signed($unsigned((wire103 >>> wire97)))));
  assign wire115 = (~|$signed(wire108[(4'he):(4'ha)]));
  assign wire116 = (((8'hab) ?
                       (wire106 ^ ((-wire113) ^ wire113[(3'h6):(3'h5)])) : wire102[(3'h5):(3'h4)]) >> ((wire112[(4'he):(1'h1)] ^ $signed($unsigned(wire99))) ^ (!(wire99[(2'h3):(1'h0)] > (8'hbe)))));
  assign wire117 = $signed($signed($unsigned(((wire107 ?
                       wire109 : wire109) == (^(8'ha6))))));
  assign wire118 = {($signed(((wire94 ? wire95 : wire97) ?
                           $unsigned(wire110) : (8'h9f))) <= ($unsigned((8'hbe)) >> {wire95[(4'h9):(3'h6)]})),
                       wire100[(4'hc):(4'hb)]};
  assign wire119 = ((wire106 ?
                       $signed((wire116 ?
                           wire111[(3'h4):(2'h2)] : wire106[(4'h8):(3'h5)])) : wire112) >>> ($unsigned((~^(~|(8'hb3)))) & wire118[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg120 <= wire102;
      if (($signed((wire97[(3'h4):(3'h4)] ?
              wire112 : $signed(wire105[(3'h6):(3'h6)]))) ?
          wire111 : wire102))
        begin
          reg121 <= (($unsigned((8'h9f)) && wire94) > $signed(wire107[(1'h1):(1'h1)]));
          reg122 <= ((^~$signed((~|wire108))) ?
              ($unsigned($signed($unsigned((8'hb4)))) ~^ (wire95[(4'he):(3'h7)] ^~ wire99)) : ((&wire95[(5'h10):(3'h6)]) << wire107));
          reg123 <= reg121[(1'h1):(1'h0)];
          reg124 <= (7'h42);
          reg125 <= {(($unsigned((wire110 ?
                  (7'h44) : wire101)) | ({wire110} & ((8'hbe) ^ wire111))) ^~ $signed(reg120[(4'he):(4'ha)])),
              {wire105[(2'h2):(2'h2)]}};
        end
      else
        begin
          reg121 <= $signed(wire114[(4'hc):(4'h9)]);
        end
      reg126 <= (-(~^($unsigned((wire111 ? reg121 : wire115)) ?
          $unsigned(wire96) : $signed(wire119))));
      reg127 <= (^(reg122[(1'h1):(1'h0)] == wire109));
    end
endmodule

module module77
#(parameter param90 = ({(({(8'hbb), (8'ha3)} ? ((8'hb8) | (8'hb0)) : {(8'hab)}) & (((8'ha6) <= (8'hb4)) ? ((8'hb9) ? (8'hba) : (7'h41)) : ((7'h42) ? (8'ha0) : (8'h9e)))), {{((8'ha5) ? (8'hab) : (8'h9d))}}} < ((((+(8'ha7)) < ((8'ha3) != (8'hb9))) - (((8'hac) ? (8'h9e) : (8'h9d)) <<< ((8'ha0) ? (8'h9f) : (7'h44)))) ? (({(7'h41), (8'hb0)} ? ((8'ha0) ^~ (8'hb4)) : {(8'hbc), (8'hbb)}) ? (((8'hb4) & (8'h9e)) ? ((8'ha4) ? (8'haf) : (8'ha4)) : ((8'ha2) < (8'haf))) : (((8'hb6) ? (7'h40) : (8'ha5)) == (~^(8'ha7)))) : {(&((8'h9f) ? (8'hb2) : (8'h9e))), (~((8'hb7) ? (8'ha6) : (8'ha4)))})))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire81;
  input wire [(5'h10):(1'h0)] wire80;
  input wire signed [(3'h7):(1'h0)] wire79;
  input wire signed [(5'h14):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  assign y = {wire89, wire88, wire87, wire86, wire85, wire84, wire83, (1'h0)};
  assign wire83 = ((((8'hba) ?
                      (((8'hbe) ?
                          wire79 : wire82) ~^ $unsigned(wire81)) : wire78[(4'hf):(4'hf)]) ^ ($unsigned($unsigned(wire80)) * {(wire78 & wire79),
                      (wire79 >>> wire80)})) + (^$unsigned(wire81[(2'h2):(2'h2)])));
  assign wire84 = ($signed((8'hbf)) > wire79);
  assign wire85 = wire78;
  assign wire86 = ((~^wire79[(3'h6):(1'h1)]) >>> wire81[(2'h3):(2'h3)]);
  assign wire87 = {{{{wire81[(1'h1):(1'h0)]}}, wire80[(5'h10):(4'hc)]}};
  assign wire88 = wire87;
  assign wire89 = (~&({$signed((wire85 <<< wire80))} ?
                      {((wire78 ? wire88 : wire78) >>> {wire78}),
                          ($signed(wire83) ?
                              {wire82,
                                  wire78} : $signed(wire84))} : $unsigned($signed(wire85[(5'h10):(2'h3)]))));
endmodule
