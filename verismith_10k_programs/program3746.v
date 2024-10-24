module top
#(parameter param146 = ((((8'hb3) ? {(|(8'hae))} : (8'hb1)) ? ((((8'h9f) << (8'ha0)) ? {(8'hbf), (8'h9c)} : ((8'ha7) ? (8'hb1) : (8'hb8))) << (((8'ha3) ? (8'hb4) : (8'haf)) ^~ (~|(8'hbd)))) : (&{((8'hb9) ? (8'hb5) : (8'ha0)), (^~(8'ha6))})) & {((((8'ha6) ? (8'hae) : (7'h43)) && ((8'hb2) ^~ (8'hb6))) <<< (|((8'ha6) <<< (7'h44))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire121;
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire5,
                 wire121,
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
                 reg123,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire5 = ((7'h40) ? $signed((8'hb3)) : {wire0[(4'ha):(4'h8)]});
  always
    @(posedge clk) begin
      if ((8'haf))
        begin
          reg6 <= (8'hb6);
        end
      else
        begin
          reg6 <= $signed({(!((wire0 - wire5) <= (&wire4))),
              $signed((~$signed(wire3)))});
          if ($signed($signed((|(-wire2)))))
            begin
              reg7 <= ((wire1[(3'h7):(2'h3)] ?
                  $unsigned((8'hbc)) : ({(+wire5),
                      wire3} - wire4[(3'h4):(2'h3)])) | ((~|(~|$signed(wire3))) ?
                  $signed(wire2) : wire1[(4'hb):(2'h3)]));
              reg8 <= (wire4 ?
                  $unsigned($signed({(wire1 ? wire0 : (8'had)),
                      (wire4 ~^ wire3)})) : {(|$signed((wire3 <= wire5)))});
              reg9 <= {(^~$signed(wire1[(2'h2):(2'h2)]))};
            end
          else
            begin
              reg7 <= ((($signed(wire0) >>> (((8'h9d) ?
                      reg7 : (8'hae)) ^~ reg7[(5'h10):(4'he)])) ?
                  (wire4[(4'h9):(1'h0)] ?
                      (^{wire0}) : wire3[(3'h5):(2'h2)]) : {$signed($signed(wire4)),
                      {reg8, wire4[(3'h6):(1'h0)]}}) ^ wire3);
              reg8 <= $unsigned((~({{reg7}} >= {reg6[(2'h3):(1'h0)],
                  (!reg6)})));
              reg9 <= ((+(-(wire1 + (~|wire3)))) > {{wire2[(1'h1):(1'h1)],
                      wire5[(4'h8):(1'h1)]},
                  $unsigned((^reg8))});
            end
        end
      reg10 <= (8'hb4);
      if ({$signed(reg8[(1'h1):(1'h1)]), reg8})
        begin
          reg11 <= ({$unsigned((8'hac)),
                  $unsigned(($signed((8'ha5)) ^ (wire0 ~^ (8'h9d))))} ?
              (reg6 ?
                  ((-(wire4 ? wire1 : reg7)) ?
                      $signed((wire0 << (8'hbc))) : ((8'ha5) <<< (wire1 <= (7'h42)))) : (^~$signed((wire5 ?
                      reg7 : wire5)))) : ((((reg6 ?
                      wire3 : (8'h9e)) <<< (wire3 ?
                      wire3 : reg7)) ^ $unsigned((wire5 ? reg10 : (8'hba)))) ?
                  wire5[(2'h2):(1'h0)] : (~(+((8'h9e) ? wire3 : reg10)))));
          reg12 <= (~^((($unsigned(wire5) && $signed(reg10)) ?
              (~&wire5[(3'h7):(1'h1)]) : $signed({reg8})) && reg11[(2'h2):(1'h1)]));
          reg13 <= (~|wire4[(2'h2):(2'h2)]);
          reg14 <= wire4[(2'h3):(2'h3)];
        end
      else
        begin
          reg11 <= $signed(wire4[(1'h1):(1'h0)]);
          reg12 <= (((~&{$signed((8'hb6)), (reg10 ? reg13 : wire1)}) ?
                  (((7'h41) + $signed(reg13)) ?
                      wire1 : (8'ha7)) : (&$signed((wire0 >>> (8'ha4))))) ?
              $signed(reg7) : (8'hbc));
          reg13 <= (($unsigned($unsigned(reg11[(3'h5):(1'h1)])) ?
              $unsigned($signed((wire1 <<< wire5))) : ((+reg13) ?
                  wire5 : $unsigned((~(8'haf))))) != ({{(reg11 != wire3)},
              reg13} >= reg14));
          reg14 <= $unsigned((8'ha7));
        end
    end
  module15 #() modinst122 (wire121, clk, reg9, reg10, wire3, reg14);
  always
    @(posedge clk) begin
      if (reg14[(4'he):(3'h6)])
        begin
          reg123 <= (+((+$signed((reg7 << reg12))) ^ (^~(wire5[(1'h0):(1'h0)] ?
              (reg7 ? (8'hb7) : reg12) : $unsigned(wire4)))));
          reg124 <= reg14[(5'h15):(4'h8)];
          reg125 <= (|wire1);
          reg126 <= {$unsigned(wire121[(3'h6):(3'h6)]),
              ($signed(wire0) && {{reg13[(4'ha):(4'h8)]},
                  $signed((reg125 ? reg10 : wire5))})};
          reg127 <= ($unsigned(reg10[(2'h2):(1'h0)]) + $unsigned(reg13));
        end
      else
        begin
          if (((({$unsigned(reg11)} ?
                  wire4[(4'h8):(3'h6)] : $signed(((8'ha5) ? wire3 : reg127))) ?
              (((~&reg13) >= reg14[(4'h8):(2'h3)]) ?
                  (^$unsigned(reg11)) : $signed(reg6)) : (~&wire121[(4'h9):(1'h0)])) >>> reg6[(2'h2):(1'h0)]))
            begin
              reg123 <= ((8'hb8) ?
                  $signed(({reg123[(2'h2):(1'h0)], (wire121 >> reg126)} ?
                      (reg126 ?
                          $unsigned(reg9) : $unsigned((8'ha0))) : reg7[(1'h0):(1'h0)])) : $signed($unsigned((^~reg13[(4'hb):(3'h4)]))));
              reg124 <= reg6;
              reg125 <= reg10;
            end
          else
            begin
              reg123 <= $signed((((^$unsigned((8'hb3))) ?
                  wire4[(3'h4):(1'h0)] : (~^reg10)) - {((|wire5) ?
                      $signed(reg127) : $unsigned(reg125))}));
              reg124 <= (reg12[(2'h3):(2'h3)] ?
                  (^$signed(($signed(wire1) | reg14[(3'h7):(3'h6)]))) : {(((~|wire121) < (reg11 ?
                              reg124 : wire1)) ?
                          reg8 : wire2[(4'h9):(3'h6)])});
            end
          if ($unsigned((((7'h43) | (^~(reg127 ? wire121 : reg123))) ?
              (~|((reg126 ^ wire0) ?
                  $unsigned(reg125) : wire5)) : $signed((8'hb1)))))
            begin
              reg126 <= (!({$unsigned($unsigned(reg127)),
                  {$unsigned(wire1),
                      (wire1 + (8'hb4))}} + (~(~reg7[(3'h5):(1'h0)]))));
              reg127 <= $signed(((wire1[(2'h2):(2'h2)] ?
                  $signed(reg11) : (|$unsigned(reg9))) | $signed({$unsigned(wire4),
                  {reg13}})));
              reg128 <= wire4;
              reg129 <= (|(|reg125));
              reg130 <= reg127;
            end
          else
            begin
              reg126 <= ((|((reg129 - (reg8 >= (8'hb1))) ?
                  (wire121[(2'h3):(1'h0)] ?
                      (wire2 ?
                          (8'ha1) : reg11) : (wire5 >>> reg12)) : reg128[(1'h0):(1'h0)])) * (reg126 ?
                  {$signed(reg8[(4'hc):(4'hc)]),
                      reg11[(2'h2):(2'h2)]} : (8'h9e)));
              reg127 <= reg127[(4'hb):(4'h9)];
            end
          if ($signed((+$unsigned((reg126 < (reg123 ? wire0 : (8'hac)))))))
            begin
              reg131 <= $signed($unsigned($unsigned(reg125[(3'h7):(3'h7)])));
              reg132 <= $signed($signed((|$signed(reg131))));
              reg133 <= ($signed($unsigned($unsigned(wire5[(3'h4):(1'h0)]))) ?
                  $signed(reg123[(1'h1):(1'h0)]) : ((((8'h9f) ?
                          wire121[(4'ha):(2'h2)] : {reg8,
                              wire0}) >= $signed(((8'h9f) == reg127))) ?
                      (|(reg8 ?
                          (reg13 | wire2) : reg126[(4'h8):(1'h1)])) : (reg10 ?
                          wire121[(4'ha):(4'h8)] : $unsigned((reg125 ^ reg132)))));
              reg134 <= (8'h9d);
              reg135 <= ((($signed((wire0 ? reg124 : wire0)) ?
                      reg8 : $unsigned({wire4})) ?
                  $unsigned((^~(&reg124))) : reg133) || (!(8'ha5)));
            end
          else
            begin
              reg131 <= $signed((8'ha6));
              reg132 <= (((+$signed(wire121[(2'h3):(2'h2)])) ?
                      wire1 : (8'hbf)) ?
                  (-(((reg134 * reg127) >>> wire2[(3'h4):(1'h1)]) >= ($unsigned(reg14) && (~|reg126)))) : (reg6 ?
                      $unsigned(reg131) : $unsigned($unsigned(reg130))));
              reg133 <= wire5;
              reg134 <= (-$signed((~|$signed(reg12[(1'h1):(1'h0)]))));
            end
          reg136 <= (wire2 ?
              wire4 : $signed({((reg129 - reg134) ?
                      ((8'hab) < wire2) : (~^wire5)),
                  reg13[(4'ha):(3'h5)]}));
          if ((({reg136[(2'h3):(1'h0)], $signed($unsigned(wire1))} ?
                  (reg132 ?
                      reg14[(5'h11):(3'h6)] : (|{reg10,
                          wire2})) : reg134[(4'ha):(3'h4)]) ?
              (~|reg7) : (|{($unsigned(reg132) >> (~&wire1))})))
            begin
              reg137 <= (8'h9e);
              reg138 <= (reg11[(3'h4):(2'h3)] >>> (reg127[(4'ha):(2'h2)] ?
                  $signed(wire2[(3'h4):(2'h2)]) : $signed(wire3[(3'h5):(3'h4)])));
              reg139 <= (~&(~&$signed(reg8[(1'h0):(1'h0)])));
              reg140 <= ((~&{$signed(reg6[(3'h4):(2'h3)]),
                      wire0[(2'h3):(2'h3)]}) ?
                  (&$signed(wire0)) : (|$signed((~^(&reg139)))));
            end
          else
            begin
              reg137 <= (^~reg125);
              reg138 <= ((reg126 && $unsigned(((reg138 ?
                  reg9 : reg133) >>> wire5[(4'ha):(1'h1)]))) != $signed((&$unsigned(reg9))));
              reg139 <= $signed((reg140 << ($signed($unsigned(reg137)) ?
                  ((reg135 ? reg12 : wire4) ?
                      (wire5 ?
                          reg124 : reg131) : $signed(reg7)) : (reg132[(3'h5):(1'h1)] || $unsigned(reg9)))));
              reg140 <= $unsigned($signed(($unsigned($unsigned(reg130)) >= ($unsigned((8'ha6)) ?
                  (reg9 ? reg6 : reg127) : $signed((7'h42))))));
              reg141 <= $signed({(!{$unsigned((8'hb5)), {(8'haa), reg123}}),
                  $signed(reg137)});
            end
        end
      reg142 <= $unsigned((+(~(&(wire0 & reg10)))));
      reg143 <= (+$signed({$signed(reg11)}));
      reg144 <= $unsigned($unsigned({reg125,
          {reg139[(3'h5):(3'h4)], reg137[(2'h3):(2'h2)]}}));
      reg145 <= reg144;
    end
endmodule

module module15  (y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire45;
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire119,
                 wire100,
                 wire99,
                 wire97,
                 wire20,
                 wire21,
                 wire45,
                 reg22,
                 (1'h0)};
  assign wire20 = (wire16 ^ (wire19 << ((wire17[(4'h9):(4'h8)] ?
                      (!wire18) : $unsigned(wire17)) || $unsigned(wire18))));
  assign wire21 = wire16[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg22 <= ($signed(wire16[(3'h7):(1'h1)]) ? wire21 : wire21);
    end
  module23 #() modinst46 (.wire26(wire17), .clk(clk), .wire27(reg22), .wire24(wire19), .y(wire45), .wire25(wire18));
  module47 #() modinst98 (.wire52(reg22), .wire50(wire21), .wire49(wire45), .wire51(wire18), .y(wire97), .clk(clk), .wire48(wire19));
  assign wire99 = wire16;
  assign wire100 = {$signed($signed(wire19[(4'h9):(4'h8)]))};
  module101 #() modinst120 (.y(wire119), .wire104(wire17), .wire103(wire99), .clk(clk), .wire105(wire20), .wire102(wire18));
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire105;
  input wire signed [(3'h7):(1'h0)] wire104;
  input wire [(5'h12):(1'h0)] wire103;
  input wire signed [(3'h7):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire106;
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire106 = $unsigned((~&wire105[(3'h4):(2'h3)]));
  assign wire107 = ($signed($signed($unsigned(wire103[(5'h11):(3'h6)]))) <= (8'hb6));
  assign wire108 = $signed($unsigned(wire107[(4'he):(4'he)]));
  assign wire109 = (&wire108);
  always
    @(posedge clk) begin
      reg110 <= $signed((~&(((wire107 ?
          wire105 : wire106) && (wire105 >= wire104)) != (^~(8'ha7)))));
      reg111 <= {$signed((wire106[(5'h11):(4'ha)] & {(wire107 ?
                  wire107 : wire103),
              (!wire102)})),
          $signed((!((+wire102) && $signed(wire103))))};
    end
  assign wire112 = wire102;
  assign wire113 = (-wire105[(3'h5):(1'h1)]);
  assign wire114 = (^$unsigned($unsigned(wire107[(4'hb):(1'h1)])));
  always
    @(posedge clk) begin
      reg115 <= $signed((|$signed((8'hbd))));
      reg116 <= wire105;
      reg117 <= $unsigned((^wire114[(2'h2):(2'h2)]));
      reg118 <= $signed((7'h43));
    end
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire signed [(4'h8):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire signed [(4'he):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire80,
                 wire79,
                 wire78,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 reg65,
                 reg64,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= $unsigned($signed({(^(&wire49)),
          ((~wire50) ? (wire49 ? wire48 : wire50) : $unsigned(wire52))}));
    end
  assign wire54 = (reg53[(5'h11):(5'h11)] ?
                      ((!$unsigned(wire52)) >>> (wire50[(3'h5):(1'h0)] << wire48)) : $signed(wire48[(2'h3):(2'h3)]));
  assign wire55 = wire49[(2'h3):(2'h2)];
  assign wire56 = ($unsigned($signed($unsigned(((8'hb5) ~^ (8'haa))))) ?
                      (-$unsigned($signed((wire55 > reg53)))) : wire51[(1'h0):(1'h0)]);
  assign wire57 = (7'h44);
  assign wire58 = {(({$unsigned(wire52)} * {$unsigned(wire54)}) ^ $signed((!$signed((8'ha4))))),
                      wire51[(4'h8):(2'h2)]};
  assign wire59 = $signed(((|$unsigned($unsigned(wire50))) ?
                      {(((8'h9c) != wire55) ?
                              reg53[(4'h8):(4'h8)] : $unsigned(wire55)),
                          wire51} : wire58));
  assign wire60 = $unsigned($signed({{wire58[(4'hc):(3'h6)],
                          (wire54 == wire48)},
                      wire58[(3'h5):(3'h5)]}));
  assign wire61 = wire56[(1'h1):(1'h1)];
  assign wire62 = (^$signed((&{$signed((8'ha6)), (wire51 ? wire55 : reg53)})));
  assign wire63 = (((((wire58 >= wire49) | $unsigned(wire57)) && ($unsigned(wire54) ?
                          wire62 : ((8'hae) <= wire55))) == wire55) ?
                      (wire57 != $signed($unsigned(wire61[(2'h3):(2'h3)]))) : $signed(((^(!reg53)) ?
                          (wire54 >> $signed(wire54)) : (~^wire60))));
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire56[(1'h1):(1'h0)])) ?
          wire58[(2'h2):(1'h1)] : wire50))
        begin
          reg64 <= (-$signed(wire48[(4'hc):(2'h3)]));
          reg65 <= ($unsigned(($unsigned((wire63 ? wire62 : wire57)) ?
                  (wire62[(3'h6):(1'h0)] << {wire59}) : wire54[(2'h2):(1'h1)])) ?
              ({$unsigned(wire63)} ?
                  $unsigned(wire59[(1'h1):(1'h0)]) : $unsigned((wire51 ?
                      (-wire58) : (wire52 ?
                          wire49 : wire63)))) : ((-(+wire52)) ?
                  $signed((&wire55[(1'h1):(1'h1)])) : $unsigned((!(&wire63)))));
          reg66 <= wire50[(2'h2):(1'h1)];
        end
      else
        begin
          reg64 <= $signed($signed(reg66));
          reg65 <= wire56[(1'h0):(1'h0)];
          reg66 <= $signed($unsigned((!wire51)));
        end
      reg67 <= reg66;
      reg68 <= $signed($unsigned(reg64[(3'h6):(3'h4)]));
      reg69 <= $signed(reg66);
      if (wire58[(4'h8):(3'h7)])
        begin
          reg70 <= $unsigned((((!$signed(wire61)) ?
              reg53[(1'h1):(1'h1)] : $signed((wire49 ^~ wire50))) && wire55[(1'h1):(1'h1)]));
          reg71 <= (($signed(($signed(reg53) | wire52[(3'h4):(1'h0)])) || wire48[(4'h9):(4'h8)]) <<< $unsigned({$unsigned(reg70),
              reg64}));
          if (((~^(&(+(~^(8'hba))))) == ((((wire54 & wire54) ?
                  {wire55,
                      wire59} : $signed(wire49)) || $signed((reg71 | wire60))) ?
              wire49 : $signed({$unsigned(wire59), {reg70, wire50}}))))
            begin
              reg72 <= $signed(((!wire55) * $signed({(~^wire48),
                  (reg65 * wire63)})));
              reg73 <= wire52;
              reg74 <= $signed($unsigned($signed((((8'ha3) > (8'hba)) || (reg69 ?
                  wire49 : reg67)))));
              reg75 <= ($signed($unsigned(wire58)) ?
                  $unsigned($signed(((8'ha8) ?
                      reg74 : $signed(reg66)))) : $signed((-wire59[(1'h1):(1'h0)])));
            end
          else
            begin
              reg72 <= $signed(reg68[(3'h5):(3'h5)]);
            end
          reg76 <= ((+wire55[(1'h1):(1'h0)]) ?
              wire58[(4'he):(4'hd)] : (-{wire59[(2'h2):(1'h1)],
                  reg71[(4'hc):(1'h0)]}));
          reg77 <= {$signed((-$signed((~^reg74)))),
              ((wire54[(2'h2):(2'h2)] || reg74[(2'h2):(1'h0)]) ?
                  reg74[(2'h2):(1'h0)] : wire63[(2'h2):(1'h1)])};
        end
      else
        begin
          reg70 <= {$signed($unsigned(reg74[(1'h1):(1'h0)])),
              (&($signed((!(8'hac))) ? wire55 : $signed(reg71)))};
        end
    end
  assign wire78 = reg72;
  assign wire79 = $signed((~|(~|$signed((reg64 ? wire52 : (8'ha1))))));
  assign wire80 = (^$signed(wire78[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg81 <= (^wire79);
      if (reg66[(1'h1):(1'h0)])
        begin
          if ((8'h9d))
            begin
              reg82 <= (((^wire79) ?
                  (&(8'hb2)) : (wire79[(1'h0):(1'h0)] <= $unsigned($signed(wire60)))) << {($unsigned(reg70[(3'h4):(1'h0)]) ~^ {((8'ha9) ?
                          reg81 : (8'ha5))})});
              reg83 <= ((^~(^$signed((reg65 || wire60)))) ?
                  ({wire48} ~^ $unsigned(((^~reg77) ?
                      (~^(8'hb2)) : (wire56 ~^ reg82)))) : wire60);
              reg84 <= reg76;
            end
          else
            begin
              reg82 <= ((~$signed(((~wire78) ? (!wire61) : (~|reg82)))) ?
                  (&($unsigned($signed(reg53)) ?
                      wire60[(2'h3):(1'h1)] : (~&$unsigned(reg83)))) : ($signed(reg67[(5'h10):(5'h10)]) ?
                      $unsigned(((^~(8'haa)) ^ wire63)) : (($unsigned(wire55) == $unsigned(reg66)) != {((8'ha3) ?
                              reg82 : reg53),
                          $unsigned(wire59)})));
              reg83 <= wire51;
              reg84 <= $signed($signed(reg53[(4'hc):(2'h3)]));
            end
          reg85 <= $unsigned(wire57[(3'h4):(1'h0)]);
          if (reg65)
            begin
              reg86 <= (~&($signed(wire54[(2'h3):(1'h1)]) ?
                  $unsigned(reg64) : wire78[(2'h3):(2'h3)]));
              reg87 <= (reg75[(4'hf):(4'hc)] > $unsigned(reg77));
              reg88 <= ((~|{reg81}) ?
                  $unsigned(reg81) : $signed((wire54[(1'h1):(1'h0)] ?
                      ($unsigned(reg65) ?
                          $signed(reg71) : reg65[(3'h7):(3'h7)]) : (wire57 && (!reg70)))));
              reg89 <= $signed(reg84[(3'h6):(1'h1)]);
            end
          else
            begin
              reg86 <= reg66;
              reg87 <= (^~$unsigned($signed($unsigned($signed(reg85)))));
              reg88 <= ({($unsigned(wire78[(2'h3):(1'h0)]) ~^ ((wire50 ?
                      reg86 : (8'hb1)) != (reg66 > wire57)))} || reg86);
            end
          reg90 <= (((~^({wire62} ^~ (reg66 ?
                  wire48 : wire62))) ^~ ({wire49[(1'h1):(1'h0)], wire49} ?
                  reg53[(5'h11):(4'hd)] : (reg64 && $signed(wire56)))) ?
              ((&wire48[(2'h2):(1'h1)]) >> (~^$signed($unsigned(reg53)))) : ((((reg71 ?
                      wire62 : reg76) - (wire50 ? reg71 : reg87)) ?
                  wire52 : $signed($signed(wire48))) - reg82));
          reg91 <= (wire59 ^ $unsigned($unsigned((wire62[(1'h0):(1'h0)] * reg71[(3'h7):(1'h0)]))));
        end
      else
        begin
          reg82 <= $signed(($signed($unsigned($unsigned(reg71))) ?
              ($unsigned((reg75 >= (8'ha4))) << {((7'h43) ?
                      (8'ha5) : reg86)}) : wire62[(4'hb):(1'h0)]));
        end
      reg92 <= reg75;
      reg93 <= (+$signed(reg73[(4'h8):(4'h8)]));
      reg94 <= {$unsigned((8'hb4))};
    end
  assign wire95 = ({reg93} | (({(wire48 ? wire59 : reg67), reg68} ?
                      $unsigned((wire56 != reg70)) : (^((8'hba) ?
                          reg89 : reg70))) == wire51));
  assign wire96 = $signed(wire51);
endmodule

module module23
#(parameter param44 = ((~((((8'hbc) ? (8'ha5) : (7'h44)) ? (^~(7'h44)) : (^~(8'hb9))) >= (+(+(7'h44))))) && {(+(((8'ha7) == (8'ha7)) ? ((8'hb9) ? (8'ha6) : (8'h9f)) : ((7'h41) ? (8'hb7) : (8'ha0))))}))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= wire26[(2'h3):(2'h2)];
      reg29 <= $signed(($signed({wire26,
          (wire25 || wire27)}) >>> $unsigned((~&$signed(wire25)))));
      reg30 <= $unsigned(({reg28[(4'h9):(2'h3)],
              (wire24 & reg28[(3'h4):(3'h4)])} ?
          (8'hb7) : wire24));
      reg31 <= reg30;
      reg32 <= {$unsigned($signed((reg31[(3'h6):(3'h5)] ?
              reg30 : (wire26 ~^ reg30))))};
    end
  always
    @(posedge clk) begin
      if ((8'haf))
        begin
          reg33 <= (!(^~(reg31[(2'h3):(1'h0)] ?
              $unsigned({(8'ha6), (8'hb6)}) : $signed(reg28[(2'h3):(1'h1)]))));
          reg34 <= (($signed($unsigned((wire25 ? wire24 : wire25))) ?
              $unsigned($signed(reg31)) : reg32) - $signed((~(~&reg28[(3'h6):(3'h4)]))));
        end
      else
        begin
          reg33 <= $unsigned((^~($signed((^~wire27)) ?
              wire26[(2'h3):(2'h2)] : (8'hac))));
        end
      reg35 <= ((^reg34) <<< (($unsigned((^~(8'h9e))) ?
              ($unsigned((8'hb4)) ?
                  $signed(reg31) : reg31[(3'h6):(2'h2)]) : (^~((7'h44) ?
                  reg28 : (8'had)))) ?
          (($unsigned(wire24) ? $signed(reg30) : $unsigned(wire26)) ?
              (~|reg32) : (~^reg28)) : (((reg32 ? (8'ha1) : reg34) ?
              reg33[(3'h7):(1'h1)] : reg28[(2'h2):(2'h2)]) >= $unsigned(reg33))));
    end
  assign wire36 = $signed(reg28[(4'h9):(2'h2)]);
  assign wire37 = ($signed($signed($signed(reg30))) || reg33);
  assign wire38 = $signed($signed({(+$unsigned(reg35))}));
  assign wire39 = $signed(reg28);
  assign wire40 = {reg32[(3'h5):(2'h3)]};
  assign wire41 = ((wire39[(2'h2):(2'h2)] ?
                      wire26 : ($unsigned((wire40 == (8'ha0))) == (wire27[(2'h2):(2'h2)] ?
                          reg31[(3'h4):(1'h1)] : {reg35}))) >>> (reg28[(3'h6):(2'h2)] ?
                      $signed(({wire25} ?
                          (wire26 + wire27) : $unsigned(reg29))) : $signed($signed((reg30 ?
                          wire24 : reg28)))));
  assign wire42 = $unsigned((&(!wire26[(1'h1):(1'h1)])));
  assign wire43 = {(~^(~(8'haf))), wire36[(1'h1):(1'h1)]};
endmodule
