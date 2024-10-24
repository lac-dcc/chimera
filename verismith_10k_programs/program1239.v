module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire4,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire4 = wire1[(4'hb):(3'h5)];
  module5 #() modinst118 (wire117, clk, wire4, wire1, wire2, wire3);
  assign wire119 = $signed($unsigned(wire4[(4'hc):(3'h5)]));
  assign wire120 = $unsigned(wire119);
  assign wire121 = wire119;
  assign wire122 = (((~|$unsigned($unsigned(wire4))) ~^ (((wire4 ?
                               wire2 : wire119) <<< (wire1 ?
                               wire117 : wire117)) ?
                           wire4 : wire121)) ?
                       wire0 : ({(wire1[(2'h2):(2'h2)] | $unsigned(wire2)),
                           wire0} + ($signed((wire121 < wire119)) + (~&((8'hb2) <<< wire2)))));
  assign wire123 = ({(wire120 >>> $unsigned($signed((8'hb7)))),
                       wire117[(2'h3):(2'h2)]} != wire0[(3'h6):(3'h5)]);
  assign wire124 = wire2[(1'h1):(1'h1)];
  assign wire125 = wire122[(2'h3):(1'h0)];
  assign wire126 = {{$unsigned(wire3[(3'h6):(1'h1)])}};
  assign wire127 = $signed((~^(((wire123 >> (8'ha3)) > {wire4,
                       wire3}) ^~ (8'h9f))));
  always
    @(posedge clk) begin
      reg128 <= (wire4[(3'h4):(1'h0)] || $unsigned(wire117));
      reg129 <= $signed($signed(wire126[(3'h6):(3'h6)]));
      reg130 <= wire119;
      reg131 <= (wire4 ? $unsigned(wire124[(1'h0):(1'h0)]) : (8'ha0));
    end
  assign wire132 = wire123;
  assign wire133 = {({$signed({reg128}),
                           (wire117[(3'h4):(1'h1)] ?
                               $unsigned(reg129) : (wire120 > wire0))} ^~ ((8'hab) | $unsigned($unsigned(wire3)))),
                       {(8'ha4)}};
  assign wire134 = ($unsigned($unsigned(((wire1 ? wire0 : wire126) ?
                       wire119[(2'h2):(1'h1)] : $signed(wire125)))) + (8'hb1));
  assign wire135 = wire127[(3'h7):(2'h3)];
  assign wire136 = {(|wire2[(5'h14):(1'h1)]),
                       $unsigned(((&{wire119}) ?
                           ((~&(8'hbe)) ?
                               (^wire4) : (wire121 ?
                                   reg129 : reg130)) : $unsigned((wire125 < reg130))))};
  assign wire137 = $signed({wire126[(4'ha):(2'h3)], wire123});
  assign wire138 = ((|(reg131[(4'h9):(1'h0)] ?
                       wire124[(1'h1):(1'h1)] : wire119)) == (~|(wire133[(2'h3):(2'h3)] & reg128[(2'h2):(2'h2)])));
  assign wire139 = wire124;
endmodule

module module5
#(parameter param116 = (|((((~&(8'ha2)) ? (|(7'h43)) : {(8'hac)}) ? ({(8'hb2)} ? (^~(8'h9c)) : ((8'hbf) > (8'haa))) : (((8'ha3) + (8'ha4)) - {(8'hb2), (8'hb8)})) < ({{(7'h44), (8'hb0)}, ((8'haf) ? (7'h41) : (8'hba))} && (^~((8'ha3) ? (8'hb8) : (8'hb4)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire81;
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire102,
                 wire100,
                 wire87,
                 wire66,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire68,
                 wire81,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg69,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 (1'h0)};
  assign wire10 = ($signed((($unsigned(wire9) - (-wire8)) ?
                      wire8 : wire7[(2'h3):(1'h0)])) >>> $signed($unsigned($signed(wire8))));
  assign wire11 = wire10[(4'h9):(1'h1)];
  assign wire12 = $signed($unsigned(($signed($unsigned(wire11)) ?
                      (wire11 ?
                          ((8'hb8) ^ wire10) : wire9[(4'h8):(2'h2)]) : ($unsigned(wire10) ?
                          (wire7 ? wire10 : wire8) : $unsigned((8'hb3))))));
  assign wire13 = wire6;
  assign wire14 = wire8[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned(wire7[(5'h11):(2'h2)]))
        begin
          reg15 <= $unsigned((wire11[(4'he):(1'h0)] ^~ (wire14[(4'hc):(3'h7)] << $unsigned((&wire14)))));
          if (wire9[(4'ha):(3'h4)])
            begin
              reg16 <= (((((wire12 ?
                      wire7 : (8'hb7)) < $signed(wire8)) >= wire7[(4'h8):(3'h4)]) * $unsigned((~^$signed(wire8)))) ?
                  $signed(($signed((~&wire6)) < wire14)) : wire9);
              reg17 <= (8'hb3);
              reg18 <= (-({{(wire9 | wire8),
                      (reg17 ? (8'hb8) : reg15)}} < wire13[(2'h3):(2'h2)]));
              reg19 <= {wire12};
              reg20 <= wire10[(4'h8):(3'h4)];
            end
          else
            begin
              reg16 <= $unsigned(wire8[(1'h1):(1'h0)]);
              reg17 <= {(~(($signed(wire8) ?
                      (wire11 * (8'hbb)) : $unsigned((8'ha8))) + (7'h40))),
                  wire10};
              reg18 <= reg17;
            end
          reg21 <= reg18;
          reg22 <= ($unsigned(({(wire9 ? (8'hab) : reg18)} ? reg21 : reg21)) ?
              (^(reg19[(1'h0):(1'h0)] ?
                  (wire10[(2'h3):(2'h3)] ?
                      reg21[(4'hb):(4'hb)] : $signed(reg18)) : wire12)) : ((~(~$unsigned(reg16))) >> $signed(({wire10} ?
                  (reg20 > wire10) : (|wire13)))));
          if ((!$unsigned($signed({wire12[(5'h10):(4'hf)],
              reg16[(1'h0):(1'h0)]}))))
            begin
              reg23 <= $unsigned(reg16[(1'h0):(1'h0)]);
              reg24 <= ((^~wire14) ?
                  (|$signed({reg21,
                      (wire13 ? reg19 : reg19)})) : reg19[(3'h7):(2'h2)]);
              reg25 <= reg24;
              reg26 <= reg22;
            end
          else
            begin
              reg23 <= $unsigned(((-{(wire9 - wire11), $unsigned(reg17)}) ?
                  (^$signed($signed(reg26))) : ($unsigned((wire8 ?
                          wire12 : wire11)) ?
                      reg17[(3'h7):(1'h1)] : wire9)));
              reg24 <= (reg19 >= ($unsigned($signed((wire10 | reg26))) <<< reg25[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg15 <= reg24;
          reg16 <= (+(+($unsigned(wire11[(1'h1):(1'h1)]) << $signed(reg17[(2'h3):(1'h0)]))));
          if (reg25[(1'h1):(1'h0)])
            begin
              reg17 <= wire6[(5'h14):(4'hd)];
              reg18 <= wire13;
              reg19 <= $signed((&$signed(((reg21 == reg21) < $signed(wire13)))));
            end
          else
            begin
              reg17 <= (~^((-({reg15} >> $signed(wire6))) ?
                  (~|$unsigned($signed(reg26))) : ($unsigned((~reg20)) ?
                      $signed({reg16}) : (reg24 ? $signed((8'hae)) : wire13))));
              reg18 <= (^$unsigned($signed(((reg17 ?
                  wire14 : reg22) ~^ (^~reg24)))));
              reg19 <= (wire10 ? (wire7 ^ wire10) : $unsigned(wire13));
              reg20 <= (~&$unsigned($signed(wire7)));
              reg21 <= $unsigned(((reg18 ?
                  wire12[(3'h7):(3'h6)] : ((reg18 ? wire13 : reg23) ?
                      (reg19 ?
                          reg19 : reg22) : $unsigned((8'hb9)))) + (8'hab)));
            end
          reg22 <= ($unsigned($unsigned((!$signed(reg19)))) ~^ wire6);
          reg23 <= reg20[(2'h3):(2'h3)];
        end
      reg27 <= $signed(reg21[(2'h2):(1'h0)]);
      reg28 <= reg25[(2'h2):(2'h2)];
      reg29 <= $unsigned((wire8[(2'h2):(1'h1)] >>> reg22[(1'h1):(1'h1)]));
      reg30 <= $unsigned(wire7[(4'hc):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg31 <= reg19;
    end
  module32 #() modinst67 (wire66, clk, wire8, wire13, wire9, reg18);
  assign wire68 = wire14[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= wire14[(3'h7):(3'h5)];
    end
  module70 #() modinst82 (wire81, clk, reg25, wire66, wire12, reg30, wire11);
  always
    @(posedge clk) begin
      reg83 <= ((($signed((wire68 ? (8'ha5) : reg29)) ^~ (&(wire11 ?
              reg28 : reg69))) ?
          ((+$unsigned(wire6)) < reg19[(3'h7):(1'h1)]) : $unsigned(($signed(reg23) ?
              (reg17 && wire9) : wire10[(3'h5):(2'h3)]))) * reg23);
      reg84 <= reg30;
      reg85 <= $signed($signed(reg20[(2'h3):(1'h0)]));
      reg86 <= {($signed(((+reg15) ? (wire12 ? reg83 : wire10) : reg20)) ?
              (reg83[(4'h8):(1'h0)] ?
                  ((reg27 ? (7'h44) : reg83) ?
                      (8'hae) : $signed(wire9)) : {wire6[(4'he):(3'h6)],
                      $unsigned(wire12)}) : (!{reg23})),
          $unsigned(reg20[(1'h1):(1'h1)])};
    end
  assign wire87 = reg26;
  module88 #() modinst101 (wire100, clk, reg21, reg17, reg28, reg26, reg29);
  assign wire102 = (|(~reg31));
  always
    @(posedge clk) begin
      if (($unsigned(((reg19 < $unsigned(reg17)) ?
              wire68 : ((wire7 ? wire9 : wire12) ? (~&reg18) : (~wire68)))) ?
          $unsigned((~|$signed((reg20 - reg17)))) : $signed($unsigned($unsigned(reg18[(1'h1):(1'h0)])))))
        begin
          reg103 <= $signed($signed((^~$unsigned($unsigned(reg16)))));
          reg104 <= wire100[(2'h3):(2'h3)];
          reg105 <= (!$signed(((^(wire87 && wire14)) ?
              $unsigned($signed(reg86)) : {(reg25 ? wire9 : reg22),
                  (reg84 & wire10)})));
          reg106 <= (reg86 == reg18);
          reg107 <= (^~(($unsigned($unsigned(wire66)) ?
              {wire11,
                  $unsigned(reg25)} : reg17) >= $unsigned(($unsigned((7'h40)) ?
              $signed(reg21) : ((8'hb5) == wire81)))));
        end
      else
        begin
          if ((!reg16))
            begin
              reg103 <= $unsigned(reg85);
              reg104 <= (-(($signed($unsigned(reg21)) ?
                  $unsigned(wire14) : reg21[(4'hb):(1'h1)]) + (wire14[(3'h6):(1'h1)] ^ (~^reg24[(4'ha):(3'h6)]))));
              reg105 <= wire13[(1'h1):(1'h1)];
              reg106 <= ({(((wire81 ? reg17 : reg15) ?
                          (wire100 >= wire14) : reg85) || {$signed(reg83)})} ?
                  (^({(7'h40)} ?
                      $unsigned(reg24[(1'h0):(1'h0)]) : wire13)) : reg18);
              reg107 <= ($signed(wire10) && reg85);
            end
          else
            begin
              reg103 <= wire68;
              reg104 <= $signed((!$unsigned($signed((-wire14)))));
              reg105 <= {(|{$unsigned((reg31 & reg21)), reg69[(3'h5):(3'h4)]})};
              reg106 <= wire11;
              reg107 <= wire10;
            end
          reg108 <= reg28[(1'h0):(1'h0)];
          reg109 <= wire6[(5'h10):(3'h6)];
          reg110 <= $signed((($signed((wire87 ?
                  (8'hab) : reg23)) && ((|wire14) ?
                  (|(8'ha9)) : (reg30 <<< reg17))) ?
              reg103 : (((reg20 ^ wire14) ?
                  (+(8'hb8)) : reg20[(1'h0):(1'h0)]) == wire9[(3'h4):(1'h1)])));
          reg111 <= (((((wire102 >>> wire81) ?
                  reg23[(4'h9):(1'h1)] : $unsigned(wire6)) ^~ {(reg107 | reg16),
                  wire6}) ~^ {(-(reg103 >>> reg23)), (~^reg84)}) ?
              $signed({$signed((^~wire6))}) : {(reg20 ?
                      $signed($signed(reg25)) : (!$unsigned(reg107)))});
        end
      reg112 <= (wire66 ?
          $unsigned(((wire8 & (wire100 ? reg86 : wire14)) ?
              $signed(reg29[(2'h2):(1'h1)]) : $signed(wire87[(3'h4):(2'h2)]))) : $unsigned($signed(reg26)));
      reg113 <= $unsigned(wire13);
    end
  assign wire114 = ($unsigned($unsigned(reg105[(3'h4):(1'h1)])) >= reg106[(1'h1):(1'h1)]);
  assign wire115 = (~&$unsigned(($unsigned(wire7) >> ($unsigned(reg84) ?
                       (wire7 ? (8'hb0) : (8'ha9)) : $unsigned(reg25)))));
endmodule

module module88
#(parameter param99 = (!(^((((8'hba) ? (8'hb0) : (8'hb1)) ? ((7'h40) ^~ (7'h40)) : (&(8'hb7))) | (((7'h42) * (8'ha3)) ^~ (-(8'hb3)))))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(2'h3):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  assign y = {wire98, wire97, wire96, wire95, wire94, (1'h0)};
  assign wire94 = {$unsigned((8'hb4)), wire92[(3'h6):(3'h5)]};
  assign wire95 = $unsigned((wire91[(1'h0):(1'h0)] ?
                      $signed(({(8'hbe),
                          wire91} + wire89[(1'h0):(1'h0)])) : ($signed((8'ha6)) ^~ (&$signed(wire94)))));
  assign wire96 = {(~|$signed((wire90[(1'h1):(1'h1)] ^~ $unsigned((8'h9c))))),
                      $unsigned(wire93)};
  assign wire97 = (wire95[(4'hb):(3'h4)] > {(!(8'hae))});
  assign wire98 = $unsigned($unsigned($unsigned((((8'h9f) ? wire97 : wire97) ?
                      (wire97 ? (7'h41) : wire91) : wire94[(4'hb):(2'h3)]))));
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire75;
  input wire signed [(3'h5):(1'h0)] wire74;
  input wire [(4'hf):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  assign y = {wire80, wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = $signed(wire71[(3'h7):(2'h3)]);
  assign wire77 = $unsigned($unsigned({wire76[(4'hb):(2'h2)],
                      $signed($signed(wire74))}));
  assign wire78 = (+$unsigned(($unsigned((wire72 <<< (7'h42))) >> ((~|wire74) ?
                      wire72[(2'h3):(1'h1)] : (wire73 ? (8'hab) : wire73)))));
  assign wire79 = $unsigned($unsigned((+($unsigned(wire78) ?
                      (+(8'hb6)) : $signed(wire77)))));
  assign wire80 = wire77[(3'h5):(2'h3)];
endmodule

module module32
#(parameter param65 = (~&(~|((-((7'h44) ? (7'h43) : (8'hb7))) > (((8'hb1) >= (8'h9c)) ? ((8'hba) ^ (8'ha8)) : (~|(7'h43)))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire [(2'h3):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  assign y = {wire64,
                 wire57,
                 wire56,
                 wire55,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg54,
                 reg53,
                 reg52,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire37 = $unsigned(($unsigned((&(wire35 ?
                      (8'hb3) : wire35))) * wire35[(1'h0):(1'h0)]));
  assign wire38 = (^~wire33);
  assign wire39 = wire33[(4'hc):(2'h2)];
  assign wire40 = (8'had);
  assign wire41 = wire33;
  always
    @(posedge clk) begin
      reg42 <= wire37;
      if ((~&((wire35[(2'h3):(2'h3)] ?
              ((reg42 ~^ wire39) < (wire41 && wire41)) : (wire41 ?
                  wire36[(1'h1):(1'h1)] : (wire34 <= wire36))) ?
          ($signed(wire40) <= {$signed(wire39)}) : ((^wire39[(1'h0):(1'h0)]) == $unsigned(wire34[(3'h7):(2'h3)])))))
        begin
          reg43 <= ($unsigned(wire38[(2'h3):(1'h1)]) ?
              (($signed(wire37[(1'h0):(1'h0)]) - $signed({wire39,
                  wire35})) < (wire38[(4'hc):(2'h3)] ?
                  (8'hb0) : wire37[(2'h3):(2'h3)])) : $signed((+wire38[(3'h6):(2'h2)])));
          reg44 <= ($signed((~&reg42[(2'h2):(1'h0)])) ?
              (8'hba) : ($signed((((8'hbf) ? wire34 : wire38) ?
                  wire35[(1'h1):(1'h1)] : $signed((8'haf)))) & wire33[(3'h6):(2'h2)]));
          reg45 <= wire37[(2'h3):(1'h0)];
          reg46 <= (((-$signed(wire37)) ?
              wire41 : ({$signed((8'ha7)), $unsigned((8'ha3))} ?
                  (8'hab) : (+$signed(wire40)))) + ((((wire39 >>> wire36) << (8'hb5)) ~^ ((reg45 ?
              (8'hb1) : (8'hb8)) + $unsigned(reg44))) ^~ (reg44[(1'h0):(1'h0)] <= reg42[(3'h5):(1'h0)])));
        end
      else
        begin
          reg43 <= (reg46 ?
              $signed(($signed(wire41[(4'hb):(4'ha)]) | {{wire41}})) : ($signed(wire33) ?
                  (~^$signed($unsigned((8'h9c)))) : $unsigned($unsigned($signed(wire35)))));
        end
      reg47 <= $signed(wire34[(1'h0):(1'h0)]);
    end
  assign wire48 = $unsigned(reg46);
  assign wire49 = ((~|(reg42[(5'h10):(4'he)] * wire39)) && wire34[(3'h6):(2'h3)]);
  assign wire50 = {((~$unsigned((+(8'haf)))) + wire34)};
  assign wire51 = {{wire35[(2'h2):(1'h1)], wire37}};
  always
    @(posedge clk) begin
      reg52 <= ((reg43 ?
          $unsigned($signed((wire39 ^ (7'h42)))) : ($unsigned((reg46 ?
              wire39 : wire50)) > {{reg46},
              ((8'hb2) | wire48)})) <<< $signed(($signed((8'ha4)) && (~&(~&wire48)))));
      reg53 <= (((reg44[(4'ha):(4'ha)] ?
              wire38[(3'h7):(2'h3)] : ((^~wire36) ?
                  $signed(wire40) : $signed(wire39))) <= wire35[(2'h3):(1'h0)]) ?
          (($signed($signed(wire38)) ?
              wire39 : (+wire36[(3'h6):(2'h3)])) - $unsigned((reg52 ?
              $unsigned(wire34) : (reg45 && (8'hab))))) : (wire35[(2'h3):(2'h3)] | ($signed((wire37 - reg46)) <<< (((8'had) ?
                  wire35 : wire41) ?
              (wire33 ? (8'ha7) : (8'h9e)) : $signed(wire48)))));
      reg54 <= $unsigned(wire37[(1'h0):(1'h0)]);
    end
  assign wire55 = $signed(reg45);
  assign wire56 = (!(reg44[(1'h0):(1'h0)] ?
                      ({(~^reg44)} ?
                          $unsigned($signed(reg52)) : $unsigned(wire55)) : (-$unsigned($signed(wire36)))));
  assign wire57 = (|((^$signed(((7'h42) ? reg43 : (8'ha4)))) ?
                      (reg44 ?
                          {((7'h41) && wire35),
                              reg47[(2'h2):(1'h1)]} : (wire34[(3'h4):(3'h4)] ?
                              reg54 : $signed(reg44))) : reg46));
  always
    @(posedge clk) begin
      reg58 <= $unsigned(reg52);
      if (reg45)
        begin
          reg59 <= reg47[(1'h1):(1'h1)];
        end
      else
        begin
          reg59 <= ({reg42[(1'h1):(1'h0)],
              $unsigned((wire49 ?
                  reg46[(1'h1):(1'h1)] : {wire40, reg42}))} >> reg58);
          reg60 <= (~^{(reg59[(3'h7):(2'h2)] || wire41),
              $signed($unsigned(wire48[(3'h6):(2'h2)]))});
          reg61 <= $signed($unsigned(reg44[(5'h13):(4'h9)]));
          reg62 <= {(8'hbd),
              (((-(wire38 < wire51)) + (+{wire57})) | reg58[(2'h3):(2'h3)])};
          reg63 <= (^$unsigned((reg44[(4'h9):(1'h1)] ?
              (^~(wire39 | wire37)) : wire55[(2'h2):(2'h2)])));
        end
    end
  assign wire64 = (($signed($signed($unsigned(wire33))) ?
                      wire34[(4'hb):(2'h3)] : $signed($signed((8'ha0)))) <= (~|$signed({$unsigned(reg45)})));
endmodule
