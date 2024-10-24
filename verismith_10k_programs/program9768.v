module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h212):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire174;
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire38,
                 wire39,
                 wire40,
                 wire97,
                 wire99,
                 wire100,
                 wire101,
                 wire174,
                 reg178,
                 reg177,
                 reg176,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire5 = (-$unsigned(wire2));
  assign wire6 = $signed(wire1[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(({{wire3, (8'hb8)}, $signed((8'hac))} ?
          wire6[(3'h4):(1'h1)] : $signed((wire1 >= wire0)))) >= {($unsigned($signed(wire3)) || ((wire2 - wire6) ?
              wire4[(1'h0):(1'h0)] : wire0))});
      reg8 <= ($unsigned($signed(($unsigned(wire3) ?
          (~|wire2) : wire5))) >> (~^wire2[(2'h2):(1'h1)]));
      reg9 <= (8'hac);
      reg10 <= reg9[(1'h1):(1'h0)];
    end
  assign wire11 = (reg8 ?
                      $unsigned((((wire6 ? wire0 : wire6) <= (wire4 ?
                          (8'hbe) : wire4)) ^ ($unsigned((8'hb9)) >>> $signed(wire3)))) : (wire0 ?
                          {$unsigned(reg9[(1'h1):(1'h1)])} : {wire0, wire1}));
  assign wire12 = $signed(($unsigned(wire0) ?
                      ($signed(reg9[(2'h2):(1'h0)]) ?
                          $unsigned(reg8[(2'h2):(1'h1)]) : reg10[(3'h4):(1'h0)]) : reg7[(1'h0):(1'h0)]));
  assign wire13 = (|((wire12 < (((7'h41) ? reg8 : wire5) ?
                          wire2[(3'h6):(1'h0)] : wire4[(2'h2):(2'h2)])) ?
                      (((wire1 ? wire5 : wire11) ? wire3 : $unsigned((8'hb0))) ?
                          $unsigned((reg10 ?
                              reg8 : wire2)) : (+wire12[(4'h8):(2'h2)])) : wire4));
  assign wire14 = wire2[(3'h4):(2'h2)];
  assign wire15 = wire0;
  assign wire16 = wire0;
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg17 <= (~^((~wire13) ?
              $signed($signed($unsigned(wire15))) : (((^~wire11) ?
                      reg10[(1'h0):(1'h0)] : $signed(reg7)) ?
                  wire16 : ($unsigned((8'ha1)) && reg8[(3'h5):(3'h5)]))));
          if ($signed((-(($unsigned(wire11) ?
                  $signed((8'hb8)) : $signed(reg8)) ?
              $signed({(8'hb9)}) : reg17[(4'hb):(4'hb)]))))
            begin
              reg18 <= (~(reg17 ?
                  $signed($signed(reg9[(1'h0):(1'h0)])) : (($unsigned(wire5) >= (8'ha2)) ?
                      $unsigned($unsigned(reg17)) : (&(7'h44)))));
              reg19 <= wire11[(2'h3):(2'h2)];
            end
          else
            begin
              reg18 <= ($unsigned((wire11[(4'h8):(3'h4)] ?
                  ($signed((8'hba)) ^ $unsigned(wire3)) : $signed(wire2))) != $signed($unsigned({$signed(wire0)})));
              reg19 <= wire11[(4'ha):(1'h0)];
            end
          reg20 <= (wire5 || ({(+wire5), reg8[(2'h2):(2'h2)]} <<< (~^{(~&reg19),
              (reg17 ? reg19 : wire0)})));
        end
      else
        begin
          if ((7'h43))
            begin
              reg17 <= (^wire2);
              reg18 <= ((8'hb4) ?
                  $signed((~^$unsigned($unsigned(reg17)))) : $unsigned(((~|$signed(wire5)) ?
                      $unsigned($signed(reg8)) : $signed(((8'hb8) & wire3)))));
              reg19 <= reg17;
              reg20 <= $signed(reg10[(2'h3):(1'h0)]);
            end
          else
            begin
              reg17 <= $signed((-reg19[(2'h3):(1'h0)]));
              reg18 <= $unsigned((^~$signed($signed((wire5 >> wire13)))));
              reg19 <= $unsigned($unsigned(reg8));
              reg20 <= ((reg17[(4'h9):(3'h4)] | (8'hb3)) < reg17);
            end
          reg21 <= (!$signed($unsigned(wire12)));
          reg22 <= (wire5 || ($signed(wire13) ?
              ((|$signed(wire14)) ?
                  ((wire5 != wire5) || wire11[(2'h2):(2'h2)]) : {(reg17 ?
                          (8'h9f) : reg20)}) : (wire13 && $unsigned((wire6 ?
                  (8'hb6) : (8'hb6))))));
          reg23 <= $signed(((reg18 ?
              (((8'hac) ?
                  (8'haa) : reg17) >> $unsigned(wire11)) : wire12) >= ($signed(wire13) ?
              {wire6[(3'h4):(3'h4)],
                  (wire15 ?
                      reg10 : (8'hb6))} : ((wire2 - wire12) | $signed(reg7)))));
        end
      reg24 <= ($signed($unsigned((~^$unsigned(wire11)))) ~^ ((wire2[(3'h4):(2'h3)] ?
              $unsigned((^~wire15)) : reg20) ?
          $signed((8'hab)) : wire4));
      reg25 <= reg7[(1'h0):(1'h0)];
      if ((~(~^(($signed(reg9) && {reg7}) <= ($unsigned(reg19) <= wire12[(1'h0):(1'h0)])))))
        begin
          reg26 <= (^$signed(wire14[(4'hc):(4'h9)]));
          if (reg17)
            begin
              reg27 <= reg17[(1'h0):(1'h0)];
            end
          else
            begin
              reg27 <= {reg18, (^~reg27)};
            end
          reg28 <= reg22;
          reg29 <= reg17;
        end
      else
        begin
          reg26 <= (reg20[(3'h4):(1'h1)] ?
              ($signed(wire13) ?
                  (^~(8'had)) : wire6) : {(((reg17 | reg29) & (wire16 ?
                          wire2 : reg22)) ?
                      reg20 : (8'hb7))});
          reg27 <= ($unsigned((8'hb8)) ? (|wire16) : wire13);
          reg28 <= ((~^wire13[(2'h3):(2'h2)]) | wire16);
          reg29 <= reg10[(2'h3):(2'h2)];
          reg30 <= ({wire3} ?
              reg8[(2'h2):(1'h1)] : $unsigned(({(wire11 ?
                      reg20 : wire6)} | (|(wire13 ? (8'ha1) : reg24)))));
        end
      if ((~^reg27[(4'hb):(4'ha)]))
        begin
          reg31 <= $unsigned($signed((&((-reg22) && wire5[(1'h0):(1'h0)]))));
          reg32 <= wire6;
          reg33 <= (8'hb3);
        end
      else
        begin
          reg31 <= wire3;
          if ($signed(reg19))
            begin
              reg32 <= $signed({(-wire15[(4'h8):(2'h2)])});
              reg33 <= reg28[(3'h5):(1'h1)];
              reg34 <= (|(reg18 || wire6[(2'h3):(1'h1)]));
            end
          else
            begin
              reg32 <= ((wire14[(2'h3):(1'h1)] >= ($unsigned(((8'ha4) < wire6)) ?
                      (reg20[(1'h0):(1'h0)] >= $signed(wire12)) : (8'had))) ?
                  $signed($signed(((8'hbe) || $signed((8'h9c))))) : ($unsigned($signed(reg29)) ?
                      (~(^~wire14)) : {{wire13, $unsigned(wire1)},
                          (|(~^wire5))}));
            end
          if ((($unsigned(reg26[(2'h2):(1'h1)]) ?
              (wire12 - (reg31[(3'h5):(1'h1)] ^~ reg23)) : ({(reg8 ?
                      reg30 : reg31)} >> {$unsigned(reg26)})) == (+$unsigned(reg30[(2'h2):(1'h0)]))))
            begin
              reg35 <= (~$signed(($signed((wire11 == (8'haf))) ?
                  $unsigned((~wire14)) : reg8)));
            end
          else
            begin
              reg35 <= $unsigned({({$unsigned(reg7)} ^~ {wire3[(1'h1):(1'h0)],
                      (~wire2)}),
                  (~$signed($signed((8'ha1))))});
              reg36 <= $unsigned({$signed(((^(8'h9f)) <<< (^(8'hbc)))),
                  (~$unsigned((reg33 ? reg9 : reg25)))});
            end
          reg37 <= ($signed((($unsigned((8'ha1)) || (reg24 ? reg18 : wire16)) ?
              {(&wire15)} : {$unsigned(wire4)})) > $unsigned((&reg21[(2'h2):(2'h2)])));
        end
    end
  assign wire38 = reg18[(3'h4):(2'h2)];
  assign wire39 = ((8'haf) ?
                      {$unsigned((reg18 > (reg36 ^ wire1)))} : (~wire15[(2'h3):(1'h0)]));
  assign wire40 = (~|(reg22 && (~&(|(reg22 ? reg34 : (8'hb3))))));
  module41 #() modinst98 (wire97, clk, reg18, wire16, reg33, wire11);
  assign wire99 = reg23[(1'h0):(1'h0)];
  assign wire100 = $unsigned($unsigned((|$unsigned({reg21, (8'hb6)}))));
  assign wire101 = wire15;
  module102 #() modinst175 (.wire103(reg30), .wire105(reg22), .clk(clk), .wire104(wire0), .y(wire174), .wire106(reg35));
  always
    @(posedge clk) begin
      reg176 <= wire174[(1'h1):(1'h0)];
      reg177 <= ($signed((reg28[(3'h5):(1'h1)] ^ (~reg30[(1'h0):(1'h0)]))) ^~ reg32[(4'h8):(3'h4)]);
      reg178 <= (+wire6);
    end
endmodule

module module102  (y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire106;
  input wire [(4'ha):(1'h0)] wire105;
  input wire signed [(4'hc):(1'h0)] wire104;
  input wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  assign y = {wire172,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
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
                 reg113,
                 (1'h0)};
  assign wire107 = $unsigned(({(wire105 >> ((8'hbb) ?
                           wire105 : wire105))} ^ wire105[(3'h5):(3'h4)]));
  assign wire108 = (^wire104);
  assign wire109 = $unsigned((($signed((wire108 ? wire103 : wire104)) ?
                           (~^$unsigned(wire103)) : (((8'ha5) & wire107) & wire104[(2'h2):(1'h1)])) ?
                       wire107[(1'h0):(1'h0)] : wire105[(3'h6):(1'h0)]));
  assign wire110 = wire108[(2'h3):(1'h0)];
  assign wire111 = (7'h43);
  assign wire112 = $signed($signed(wire106));
  always
    @(posedge clk) begin
      reg113 <= wire104;
    end
  assign wire114 = $unsigned($unsigned(wire103));
  assign wire115 = wire114[(1'h1):(1'h0)];
  assign wire116 = ($signed(wire103) * ((+$signed((wire114 ?
                           wire111 : wire115))) ?
                       wire106[(3'h5):(2'h3)] : (8'ha2)));
  always
    @(posedge clk) begin
      if ((((~^($signed(wire112) ?
              (wire111 - wire112) : wire106[(4'hd):(2'h3)])) == wire106) ?
          wire114 : $unsigned(wire104[(4'h8):(2'h2)])))
        begin
          reg117 <= wire109[(2'h2):(2'h2)];
        end
      else
        begin
          reg117 <= (8'ha5);
          reg118 <= ((wire110 >> (~$unsigned(wire103))) ?
              wire107 : $signed({((reg113 + (8'hbd)) ^~ (8'hb5)),
                  wire115[(4'hb):(4'ha)]}));
          reg119 <= reg117;
          reg120 <= $unsigned((~(wire116 ?
              reg117[(1'h0):(1'h0)] : $signed(wire110[(2'h2):(2'h2)]))));
        end
      reg121 <= $signed((-reg118[(3'h6):(1'h1)]));
      reg122 <= $unsigned($signed((&((reg117 ?
          wire112 : wire116) | $unsigned((8'ha1))))));
      reg123 <= $unsigned({wire105});
      if (reg120[(4'h9):(4'h8)])
        begin
          if ((({$unsigned((~wire105))} ?
              {(^{wire104})} : wire112[(3'h7):(3'h5)]) > ($signed($unsigned((+(8'hb6)))) ^~ wire112)))
            begin
              reg124 <= reg119;
              reg125 <= ((~&wire115) ? $unsigned($unsigned((8'had))) : reg121);
              reg126 <= ((~^reg117) ^ {(~$unsigned((wire105 ?
                      wire105 : reg117)))});
              reg127 <= (^{reg118, $signed(reg125)});
              reg128 <= ((wire105 ?
                  $unsigned((7'h44)) : ($signed(((7'h42) ~^ reg125)) ?
                      ($unsigned(wire110) ?
                          (wire109 && wire112) : (+wire108)) : wire114)) ~^ $unsigned(wire111));
            end
          else
            begin
              reg124 <= ((wire104[(1'h0):(1'h0)] << $signed($unsigned(reg125))) >= $signed((reg123 ?
                  $signed(wire110) : ((reg128 ^ wire108) ?
                      $signed(reg128) : $unsigned(wire111)))));
              reg125 <= $signed({$signed($unsigned(reg120[(3'h4):(1'h0)]))});
              reg126 <= ((wire109 ? (8'hab) : (~(&{reg113}))) ?
                  $unsigned({(~^$unsigned((8'hb1))), reg122}) : ((((-(8'ha3)) ?
                      (wire106 != wire104) : wire103) + reg119) && ($signed($signed(reg118)) > (((8'h9c) ?
                          wire106 : reg119) ?
                      (reg125 ^ wire109) : reg125[(2'h2):(1'h1)]))));
              reg127 <= $unsigned($signed($unsigned($signed(wire110[(2'h2):(2'h2)]))));
            end
          reg129 <= reg127[(2'h3):(2'h3)];
          reg130 <= {(reg121 > (wire103 ?
                  wire105[(3'h7):(3'h5)] : wire110[(2'h2):(1'h1)]))};
        end
      else
        begin
          reg124 <= $unsigned((~^(-$signed({wire106}))));
        end
    end
  module131 #() modinst173 (wire172, clk, reg118, reg113, reg120, reg128);
endmodule

module module41
#(parameter param95 = (^~({{((8'ha2) << (8'hb6)), {(8'hbc)}}} << (((&(8'h9c)) || {(8'hb1), (8'ha3)}) ? (((8'hb1) > (8'hb7)) ? (7'h43) : (!(8'ha1))) : {((8'hb3) ? (8'haa) : (8'h9c)), ((8'hb2) ? (7'h43) : (8'hbd))}))), 
parameter param96 = (param95 ? param95 : param95))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire [(4'hd):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire61,
                 wire75,
                 wire90,
                 reg46,
                 reg47,
                 reg48,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= {$signed((8'hb8))};
      if ($signed(wire44))
        begin
          reg47 <= wire44[(3'h4):(2'h2)];
          reg48 <= wire43;
        end
      else
        begin
          reg47 <= (reg48[(1'h1):(1'h1)] ?
              $signed($signed($signed((^~wire42)))) : reg48);
          reg48 <= reg46;
        end
    end
  module49 #() modinst62 (wire61, clk, reg48, wire45, reg46, wire44, wire43);
  always
    @(posedge clk) begin
      if ((~&wire43))
        begin
          reg63 <= (($signed(reg46[(3'h6):(2'h3)]) ?
                  (+((wire45 == (8'hb6)) * wire45)) : ($signed((reg48 & reg47)) ?
                      ($signed(reg48) ?
                          (wire45 ?
                              reg47 : (8'h9f)) : $signed(reg47)) : $signed((wire42 + reg47)))) ?
              (($unsigned($signed(wire42)) + (+(~^reg47))) ?
                  wire45[(4'h9):(3'h7)] : (~^wire44)) : $signed(($signed($signed((8'hb7))) ?
                  (reg46[(4'ha):(4'h9)] ?
                      (reg46 ?
                          wire45 : (7'h43)) : (wire61 ^ (8'h9d))) : (^~(wire61 && wire61)))));
          reg64 <= (~|$unsigned({wire44[(4'h8):(2'h2)],
              wire44[(3'h4):(2'h2)]}));
          reg65 <= (-({($signed(wire43) < (reg64 <<< reg48))} - wire43[(1'h0):(1'h0)]));
          if ((~^{wire43,
              (wire45[(1'h0):(1'h0)] ?
                  ((+reg47) ^~ $unsigned(reg64)) : reg47[(3'h5):(2'h3)])}))
            begin
              reg66 <= wire43;
              reg67 <= (-wire61);
              reg68 <= (wire45[(4'ha):(1'h0)] ?
                  $unsigned($unsigned($unsigned({reg63,
                      reg64}))) : ($signed($unsigned($signed(reg47))) ?
                      {reg46, wire45[(3'h6):(1'h1)]} : reg64[(1'h1):(1'h1)]));
            end
          else
            begin
              reg66 <= $unsigned($unsigned(reg65[(4'hb):(4'hb)]));
            end
        end
      else
        begin
          reg63 <= (-wire44[(4'h8):(4'h8)]);
          if ($unsigned(reg48[(5'h14):(4'h9)]))
            begin
              reg64 <= ($unsigned(wire43) == ((((reg63 - (8'haf)) << wire61) * reg63[(3'h7):(2'h2)]) <<< (-wire43)));
              reg65 <= ({reg48[(4'he):(1'h0)],
                  $unsigned({$unsigned(reg66)})} && $signed((reg48 ?
                  (^~((7'h41) >>> reg66)) : {reg65})));
            end
          else
            begin
              reg64 <= (8'hbb);
              reg65 <= $unsigned({(+((reg47 ? wire44 : (8'ha8)) ?
                      reg63[(3'h5):(1'h0)] : $unsigned((7'h41))))});
              reg66 <= reg66;
            end
          reg67 <= $signed(wire61[(1'h1):(1'h1)]);
          reg68 <= ((+$unsigned(reg66)) ?
              $unsigned(({(+wire44)} ^~ reg47)) : ({(wire44 ?
                          (reg46 ^~ wire43) : reg67)} ?
                  (reg66 ?
                      ((wire43 >>> (8'ha4)) ?
                          $signed(wire42) : $signed(wire42)) : $unsigned((~^(8'hb2)))) : reg46[(5'h10):(5'h10)]));
          reg69 <= (&{$signed(reg47)});
        end
      reg70 <= (+reg68[(3'h5):(3'h4)]);
      reg71 <= {($signed($unsigned($unsigned(wire45))) || (($unsigned(reg63) ^~ reg67) * $unsigned($unsigned(reg63))))};
      reg72 <= (($signed(wire42) >= (!wire61[(2'h2):(2'h2)])) && reg66[(1'h0):(1'h0)]);
      if ((((^reg70) ?
          $unsigned({(^~wire45)}) : $signed(reg48[(5'h13):(5'h10)])) >>> ((-$signed(reg64)) - (&$unsigned($unsigned(reg47))))))
        begin
          if (((reg63 ?
              (^$signed(reg46[(4'he):(4'h8)])) : (-reg71)) >> $signed($unsigned($unsigned(reg47)))))
            begin
              reg73 <= {$unsigned(wire43[(2'h3):(2'h2)]),
                  ((reg48[(5'h12):(5'h11)] ?
                      (^~$unsigned(reg64)) : (8'ha4)) >= $signed(reg67[(4'h9):(4'h9)]))};
              reg74 <= (&$signed((((reg66 >= reg73) != (reg70 << reg47)) - ((-reg46) ?
                  $signed(wire45) : reg48))));
            end
          else
            begin
              reg73 <= {$signed(reg71)};
              reg74 <= (((!reg72[(4'hc):(4'hb)]) ?
                  ((+wire45[(4'hc):(1'h1)]) ?
                      reg71 : reg73[(4'ha):(3'h4)]) : wire45[(4'he):(4'h9)]) >= reg67);
            end
        end
      else
        begin
          reg73 <= $signed($signed(wire43[(4'hf):(3'h5)]));
        end
    end
  assign wire75 = (~((8'hb8) ?
                      (&($unsigned(wire61) < reg71)) : reg64[(3'h4):(1'h0)]));
  module76 #() modinst91 (.wire78(reg71), .wire80(reg47), .wire77(wire43), .wire79(reg73), .y(wire90), .clk(clk));
  assign wire92 = $unsigned(reg67[(1'h1):(1'h1)]);
  assign wire93 = ($unsigned(reg47) + (reg67[(3'h5):(2'h2)] ?
                      $signed(((&reg68) ?
                          $signed((8'ha3)) : $signed((8'hac)))) : {$unsigned(reg73)}));
  assign wire94 = $signed((~^reg70));
endmodule

module module76
#(parameter param89 = ((((^~((8'ha3) & (8'ha9))) ? (((7'h43) ? (8'hba) : (7'h43)) ? ((8'hab) * (8'ha0)) : ((8'haf) ^~ (8'ha4))) : ((8'ha7) ? ((8'hb1) <<< (8'hbc)) : (|(8'hbd)))) ? (((&(8'had)) >> {(8'ha6), (8'ha6)}) >= (8'haa)) : (((~^(8'ha2)) ^ ((8'ha4) != (8'hbc))) > (+(+(8'hb3))))) > {(^((~(8'ha1)) ? (8'ha3) : ((8'ha8) < (8'ha7)))), (&(((8'hbd) <= (8'ha2)) >= (!(7'h43))))}))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 (1'h0)};
  assign wire81 = (wire80[(4'hd):(3'h7)] ? (&wire77[(3'h5):(2'h3)]) : wire79);
  assign wire82 = wire80;
  assign wire83 = (((wire82[(2'h3):(1'h1)] < $unsigned($unsigned((8'ha5)))) + $signed(((wire81 ?
                              (8'hbc) : wire78) ?
                          $signed(wire77) : wire79))) ?
                      $signed((({wire77, wire80} ?
                              (wire81 <= wire77) : wire79) ?
                          (-(~|wire78)) : (&$unsigned(wire78)))) : wire80);
  assign wire84 = wire82;
  assign wire85 = wire84[(2'h3):(1'h0)];
  assign wire86 = (-{$signed(wire81[(2'h3):(1'h1)]),
                      (({wire78} >> wire84) ? (~^$unsigned(wire85)) : wire84)});
  assign wire87 = (wire86[(1'h0):(1'h0)] * wire84[(1'h0):(1'h0)]);
  assign wire88 = (wire83[(4'hc):(2'h3)] <= (wire83 >> $signed(($unsigned((8'hb6)) ?
                      (wire79 ? wire85 : wire78) : wire85))));
endmodule

module module49
#(parameter param60 = ({({(~&(8'ha4))} * (^(~^(8'hae))))} ? (~&((((8'haf) == (8'ha0)) ? ((8'ha7) ? (8'had) : (8'ha1)) : (8'hb8)) <<< {(~(8'hb0))})) : (|(((^(8'hb0)) ? ((8'hbd) && (8'h9d)) : (~&(7'h41))) ? (((7'h40) ^ (8'h9e)) ? ((8'hb7) >>> (8'had)) : {(8'hba)}) : (((8'hb6) <= (8'hbf)) ? ((7'h43) >>> (8'hac)) : (~|(7'h41)))))))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire54;
  input wire signed [(4'hf):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire signed [(4'he):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  assign y = {wire59, wire58, wire57, wire56, wire55, (1'h0)};
  assign wire55 = (~|$unsigned(wire53[(3'h7):(1'h0)]));
  assign wire56 = wire51[(4'h9):(3'h6)];
  assign wire57 = ($signed(wire54[(4'hc):(1'h1)]) ?
                      $signed($signed(wire51)) : $unsigned($unsigned((wire50 - wire54[(2'h2):(1'h1)]))));
  assign wire58 = {wire56, (8'h9e)};
  assign wire59 = (+(^wire51));
endmodule

module module131
#(parameter param170 = {(~{(((7'h42) < (8'haf)) ? ((8'ha0) * (8'ha6)) : ((8'h9d) ? (8'hb4) : (7'h42))), ({(8'hb3), (8'ha3)} ? (8'hb6) : (^~(8'h9f)))}), ({(((8'ha4) ? (8'ha0) : (8'ha2)) == (|(8'hac))), {((8'hb9) ? (8'hb1) : (8'hb3))}} != ((((8'hac) ? (8'hb2) : (8'hbe)) ? ((8'ha5) ? (8'had) : (8'hab)) : {(8'ha6), (8'hbc)}) ? (^~((8'h9d) ? (8'ha2) : (8'ha6))) : (((8'hb1) - (8'hb2)) <<< ((8'had) || (8'h9f)))))}, 
parameter param171 = ((param170 ? ({(param170 ? param170 : param170), {param170}} ? (+(~|param170)) : (^param170)) : param170) ? (|(^{(param170 && param170), (param170 < param170)})) : (8'hbc)))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire135;
  input wire signed [(3'h5):(1'h0)] wire134;
  input wire [(2'h3):(1'h0)] wire133;
  input wire [(3'h4):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire [(4'he):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire136 = (wire132 ?
                       wire135 : (^(((wire134 ^~ wire134) != $signed(wire134)) ?
                           {{wire132, wire132}} : wire135)));
  assign wire137 = {wire135};
  assign wire138 = (~&$signed(wire132[(3'h4):(2'h2)]));
  assign wire139 = ((|(8'hbf)) - $unsigned((wire136[(2'h3):(2'h2)] <<< ($unsigned((8'hb5)) ?
                       $signed((8'had)) : $unsigned(wire135)))));
  assign wire140 = $signed(wire136);
  assign wire141 = wire138;
  assign wire142 = {{wire137[(1'h0):(1'h0)],
                           $unsigned($unsigned(wire139[(4'h8):(2'h2)]))},
                       ((|wire138) <<< wire139[(2'h3):(1'h0)])};
  assign wire143 = $unsigned((|(+(+$unsigned(wire138)))));
  assign wire144 = $signed((^((wire143 ? (-wire138) : (-(8'hb6))) ?
                       ((wire133 ~^ (8'ha6)) ?
                           (wire135 ?
                               wire141 : wire141) : (wire133 <<< wire136)) : wire140)));
  assign wire145 = {wire133[(1'h0):(1'h0)],
                       $unsigned((($signed(wire132) ?
                           (^(7'h42)) : $signed(wire132)) & $unsigned(wire133)))};
  assign wire146 = (wire145 ?
                       {$unsigned((wire137 ?
                               {wire136, wire135} : {wire135, wire139})),
                           wire133[(1'h1):(1'h0)]} : ((-(+wire138[(3'h6):(2'h2)])) >= (({wire144} ?
                           (wire133 ?
                               (8'haf) : (8'ha6)) : (&wire141)) & wire142[(4'h8):(4'h8)])));
  always
    @(posedge clk) begin
      reg147 <= $signed(($unsigned(wire140[(4'h9):(3'h6)]) ?
          wire140[(3'h4):(2'h3)] : (&wire139[(2'h2):(2'h2)])));
      if (((wire142 << wire134) ?
          {wire138, wire142} : ($unsigned(wire142[(2'h3):(2'h3)]) ?
              wire145[(4'hc):(3'h6)] : (~|reg147[(4'ha):(2'h2)]))))
        begin
          reg148 <= wire133[(2'h3):(1'h1)];
          reg149 <= $signed($unsigned(wire136));
          reg150 <= wire137[(2'h3):(2'h3)];
          reg151 <= reg147;
          reg152 <= $unsigned((wire146[(1'h1):(1'h1)] ?
              (wire146 ^~ wire143[(1'h1):(1'h0)]) : ((^~$signed(wire133)) ?
                  (^{reg150, wire140}) : (wire135[(4'he):(3'h6)] != (wire136 ?
                      wire144 : wire140)))));
        end
      else
        begin
          reg148 <= ($signed(wire136[(3'h7):(3'h6)]) ^ wire145[(4'h8):(3'h7)]);
          reg149 <= wire146;
          if ({$signed((wire138 >> {{(8'had), wire146}, (~&wire135)})),
              $unsigned(((^~$signed(reg152)) ^ ($signed(wire133) << (wire142 ?
                  reg148 : wire132))))})
            begin
              reg150 <= (($signed($signed(wire134)) ^ $unsigned((~|(|wire140)))) >= {$signed((8'ha0))});
              reg151 <= (^~wire140[(4'ha):(3'h4)]);
              reg152 <= $unsigned((+((!$signed(reg149)) ?
                  (&$unsigned(wire135)) : reg149)));
            end
          else
            begin
              reg150 <= wire146[(2'h2):(1'h0)];
              reg151 <= ({reg151,
                      (reg150[(4'h8):(1'h1)] <<< wire135[(3'h7):(3'h5)])} ?
                  (^reg148) : $unsigned((~|wire143)));
              reg152 <= wire133[(2'h2):(1'h1)];
              reg153 <= $signed($signed(($signed(wire143) ?
                  ((wire141 & reg151) > $signed(wire140)) : $signed(((8'hac) ^~ wire145)))));
              reg154 <= (+(~&$unsigned(wire139)));
            end
          if ((wire138 <= $unsigned($unsigned((reg153 ^~ $unsigned(wire142))))))
            begin
              reg155 <= reg148[(1'h0):(1'h0)];
              reg156 <= (((^~(~|(wire135 & reg148))) & (~|$signed(((8'hb9) && reg155)))) ?
                  $unsigned((wire136[(3'h7):(2'h3)] ?
                      (^(reg150 ?
                          wire145 : reg147)) : $unsigned(wire138))) : ($unsigned(reg148[(1'h1):(1'h0)]) ?
                      (($unsigned(wire132) || (~&wire134)) < $unsigned(wire143[(3'h6):(2'h2)])) : $signed({((8'hb4) ?
                              reg149 : reg149),
                          {(8'hb2)}})));
              reg157 <= ($signed((wire146 ? wire142[(1'h1):(1'h1)] : (8'ha4))) ?
                  wire146 : (~&({$unsigned(wire137)} | ((wire145 ?
                      wire137 : (8'ha5)) << wire132[(3'h4):(2'h2)]))));
              reg158 <= (reg152 ?
                  wire134[(3'h4):(1'h1)] : (reg149 ?
                      ((~$signed(wire137)) ?
                          (&(-wire137)) : $signed(wire145[(4'h8):(3'h4)])) : {$unsigned((wire140 - reg148))}));
            end
          else
            begin
              reg155 <= reg154;
              reg156 <= ({$unsigned($unsigned((|wire137))),
                  $signed(wire137)} > (reg157 ?
                  (({wire142, reg152} ?
                      (+reg158) : $unsigned((8'hb8))) <<< ($unsigned(reg155) >>> reg157)) : ($signed(wire139[(3'h6):(2'h3)]) < $unsigned((reg152 ^ wire140)))));
              reg157 <= (^~$unsigned(((-(wire139 ?
                  wire145 : wire140)) + $signed(wire138[(4'h9):(2'h2)]))));
              reg158 <= $signed((reg153 <= (+(wire136[(1'h1):(1'h1)] <= $signed(reg149)))));
              reg159 <= wire143[(1'h0):(1'h0)];
            end
        end
      reg160 <= reg157;
      reg161 <= $signed(reg160[(3'h5):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg162 <= $signed((-($signed({(8'hb3),
          reg156}) - (&(wire133 << reg155)))));
      reg163 <= ($signed($unsigned((~^(wire137 && reg153)))) << (~^(^(+$unsigned(wire133)))));
      reg164 <= (|((|$signed(wire145)) ?
          $signed({$signed((8'hb2)), $signed(reg156)}) : $unsigned(({reg150,
              (8'hab)} & $signed(reg148)))));
      reg165 <= (-wire132);
    end
  always
    @(posedge clk) begin
      reg166 <= $signed((~|{(-reg156[(2'h2):(1'h1)]), (!{reg160, wire135})}));
      reg167 <= reg155[(1'h1):(1'h0)];
      reg168 <= $unsigned($unsigned($unsigned({((8'hb5) ? (8'hbe) : reg155),
          $unsigned(wire145)})));
      reg169 <= ({(^~wire142), wire134} ?
          (|((8'ha4) ?
              (~&(reg154 != wire145)) : $unsigned(((8'hbe) && wire139)))) : (($unsigned((reg148 ?
              reg148 : reg162)) >> $unsigned(((8'hba) >> reg147))) || wire135));
    end
endmodule
