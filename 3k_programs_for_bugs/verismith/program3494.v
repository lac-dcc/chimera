module top
#(parameter param133 = (8'hb8), 
parameter param134 = (8'ha2))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire112;
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire132,
                 wire116,
                 wire115,
                 wire114,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire112,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned($signed((($unsigned(wire4) ?
                         $unsigned(wire3) : (~&wire3)) ?
                     wire1 : ($signed(wire2) ~^ {wire2}))));
  assign wire6 = $signed((~|$signed((8'ha2))));
  assign wire7 = ({$unsigned({(|wire3)})} ?
                     ($signed($unsigned((wire3 || wire1))) && $signed((((8'h9e) & wire6) == (^wire6)))) : $signed($signed({$signed(wire6),
                         $unsigned(wire0)})));
  assign wire8 = $signed((wire6 >= {$signed(wire1),
                     (wire1[(4'h9):(4'h8)] << wire0[(3'h5):(3'h5)])}));
  always
    @(posedge clk) begin
      if ((~|(+$unsigned(wire6))))
        begin
          reg9 <= wire4;
          reg10 <= $signed(wire3);
          reg11 <= ((~^wire0[(1'h1):(1'h0)]) ?
              $unsigned(wire2[(3'h6):(3'h4)]) : $unsigned({((wire0 | wire8) ?
                      $signed(wire3) : $unsigned(wire2))}));
          reg12 <= {wire4};
          reg13 <= (reg10 ?
              $unsigned((reg10 ?
                  (~|(wire0 & wire6)) : ($unsigned((7'h41)) ?
                      wire2[(4'h9):(1'h0)] : (^~wire4)))) : (&(~^$unsigned((wire1 ?
                  reg10 : (8'ha6))))));
        end
      else
        begin
          reg9 <= $signed({(($unsigned(wire8) ?
                  wire7[(5'h11):(4'he)] : $unsigned(wire1)) < wire5),
              (8'hae)});
          reg10 <= wire4;
          reg11 <= $signed(($unsigned(($signed(wire3) ? reg13 : wire8)) ?
              ((wire2[(3'h4):(1'h1)] > reg9[(1'h0):(1'h0)]) ?
                  (8'haf) : ((reg9 + wire8) ?
                      (-(8'h9d)) : $unsigned(wire7))) : ({wire8} ?
                  (~$unsigned((8'ha6))) : ((&wire0) ?
                      (^(8'hae)) : (reg9 || reg12)))));
          if ((($unsigned((~(wire7 >>> (8'haa)))) ?
              (reg9[(1'h0):(1'h0)] <<< ($signed(reg12) ^~ wire8[(1'h1):(1'h0)])) : (wire3 ?
                  reg9 : (~(8'hb2)))) ^~ {wire2[(3'h6):(3'h5)],
              $unsigned($signed(reg13))}))
            begin
              reg12 <= (wire6[(3'h4):(2'h3)] ?
                  {{$unsigned(((8'ha4) ? reg11 : reg9))},
                      $signed(((8'hb6) ?
                          $signed((8'hbe)) : $unsigned(wire3)))} : (&wire6[(2'h3):(2'h2)]));
              reg13 <= wire2[(1'h0):(1'h0)];
              reg14 <= $signed((8'haa));
            end
          else
            begin
              reg12 <= (((($signed(reg10) ? (|reg12) : {wire2}) ?
                          wire6 : ((8'hbb) ?
                              (wire6 ? (8'ha6) : (8'hbd)) : ((8'ha2) ?
                                  (7'h41) : wire2))) ?
                      {$signed((~^reg9))} : (($signed((7'h41)) < wire7[(5'h14):(5'h10)]) ?
                          reg14[(1'h0):(1'h0)] : reg10)) ?
                  $unsigned((+$signed((8'hbf)))) : {(-$signed((^wire2)))});
              reg13 <= wire8;
              reg14 <= ((8'haa) + wire0[(4'hb):(3'h5)]);
            end
          reg15 <= wire5[(4'h8):(3'h4)];
        end
      reg16 <= ({$unsigned($unsigned(wire2)),
              (-((wire0 <= reg9) && (reg12 ? wire4 : wire8)))} ?
          ((^({wire7} ?
              (8'hae) : $unsigned((8'ha4)))) + ($signed($unsigned((8'hb3))) ?
              ($signed(wire6) ?
                  wire1[(4'h8):(1'h1)] : $signed(wire0)) : wire5[(3'h5):(2'h3)])) : (~|wire6[(3'h4):(2'h2)]));
      if ((|{$signed(reg16[(4'hf):(3'h6)]),
          $unsigned((((8'hb9) ^~ reg9) ?
              (wire4 ? (8'ha3) : wire8) : $signed(reg9)))}))
        begin
          reg17 <= $signed((((reg12 && (&wire2)) <= $signed($signed(wire3))) ?
              reg12[(2'h2):(1'h0)] : wire6));
          reg18 <= wire1[(4'hd):(2'h3)];
          reg19 <= (($signed($unsigned((|wire6))) ?
              reg18[(5'h10):(4'h8)] : ((((8'hbc) ?
                  reg14 : reg15) & $unsigned(reg18)) << ((~&reg11) ?
                  (wire6 >> wire3) : (wire0 ?
                      wire4 : reg10)))) != $signed((reg13[(4'he):(1'h1)] ?
              $signed(wire0) : ((reg18 ? wire5 : reg14) ^~ $unsigned(reg11)))));
          reg20 <= $unsigned(wire8[(3'h4):(1'h0)]);
          reg21 <= (-wire6[(1'h0):(1'h0)]);
        end
      else
        begin
          if (wire8[(2'h2):(1'h1)])
            begin
              reg17 <= (!reg9);
              reg18 <= {((reg16[(1'h0):(1'h0)] ?
                          $signed(((8'ha8) ? (8'ha8) : wire5)) : (8'hb3)) ?
                      $signed(reg18) : reg18[(1'h1):(1'h0)])};
              reg19 <= $unsigned(wire6[(3'h4):(2'h3)]);
              reg20 <= wire8;
              reg21 <= {($signed(reg20) + $signed(reg9)),
                  $signed((({wire8} ?
                      (reg16 << wire3) : $signed(wire8)) | reg11[(4'h9):(3'h7)]))};
            end
          else
            begin
              reg17 <= (^~reg13[(3'h4):(1'h0)]);
            end
          reg22 <= $signed(wire3);
        end
      reg23 <= (reg14[(2'h2):(2'h2)] | reg16);
    end
  module24 #() modinst113 (wire112, clk, reg16, reg15, wire2, reg18, reg23);
  assign wire114 = (~&reg18);
  assign wire115 = ($signed($unsigned((~^wire3[(4'h9):(4'h9)]))) ?
                       $unsigned(reg16) : {reg9});
  assign wire116 = reg22;
  always
    @(posedge clk) begin
      reg117 <= reg18[(4'he):(1'h0)];
      if ($signed(wire2))
        begin
          reg118 <= reg20[(2'h2):(1'h0)];
        end
      else
        begin
          reg118 <= reg16[(4'hb):(3'h5)];
          reg119 <= $signed(($signed(($unsigned(reg22) <<< (reg11 ?
                  reg20 : wire112))) ?
              (~^reg22[(2'h2):(2'h2)]) : ($signed((reg9 ^~ wire0)) & ((reg17 != reg118) >>> reg19))));
          reg120 <= (wire7[(5'h11):(3'h6)] ?
              wire8 : {((8'hac) <= $unsigned($signed(reg9)))});
        end
      reg121 <= wire116[(5'h14):(5'h11)];
      if ((&(-wire5[(3'h5):(3'h5)])))
        begin
          if ($signed({((^~(reg9 ? wire2 : reg14)) ?
                  ((8'hae) ?
                      reg9[(3'h7):(2'h3)] : $unsigned(wire114)) : ((~&reg121) - {wire3,
                      wire2}))}))
            begin
              reg122 <= ($signed(reg14[(1'h1):(1'h0)]) ?
                  ({(^$unsigned(wire4))} ?
                      ($signed(wire7[(4'hb):(3'h5)]) || (reg13[(4'hc):(3'h4)] ?
                          wire3 : reg22)) : wire5) : reg14);
              reg123 <= wire6[(3'h6):(1'h0)];
            end
          else
            begin
              reg122 <= reg21;
              reg123 <= (wire112[(4'hc):(2'h2)] ^ wire114[(1'h0):(1'h0)]);
            end
          reg124 <= (~($signed($signed(reg121)) - {({reg11} ?
                  (wire4 ? reg119 : wire6) : (wire3 ? reg13 : wire7)),
              $unsigned((reg121 - wire1))}));
          if (wire6)
            begin
              reg125 <= reg9;
              reg126 <= $unsigned({reg12[(1'h1):(1'h1)]});
              reg127 <= (!((reg13 + (^~wire0[(3'h4):(1'h1)])) ?
                  {(reg14[(2'h2):(2'h2)] || ((8'hbc) ? reg20 : reg119)),
                      reg22[(2'h3):(2'h2)]} : reg14[(3'h5):(2'h2)]));
            end
          else
            begin
              reg125 <= reg125;
              reg126 <= wire114;
              reg127 <= $signed(reg9[(1'h1):(1'h0)]);
              reg128 <= $signed((~|wire115[(1'h1):(1'h0)]));
              reg129 <= reg126[(4'hb):(1'h0)];
            end
          reg130 <= wire115[(4'hb):(4'h9)];
        end
      else
        begin
          if ($unsigned(wire7[(4'ha):(2'h2)]))
            begin
              reg122 <= ($signed($unsigned({{reg11}})) <<< ($signed(wire1) < wire5[(4'ha):(1'h0)]));
              reg123 <= $unsigned((8'hbe));
              reg124 <= $unsigned($signed((^{reg11})));
              reg125 <= wire1[(3'h4):(1'h0)];
            end
          else
            begin
              reg122 <= {{$signed($unsigned(((8'ha1) == reg18)))}, reg23};
              reg123 <= (^~$signed((~&(wire8 ? reg125 : {wire6, reg15}))));
            end
          reg126 <= ($unsigned($signed((&{wire2}))) <<< (~&$unsigned(reg12[(1'h1):(1'h1)])));
        end
      reg131 <= wire1[(4'hc):(4'h9)];
    end
  assign wire132 = {reg17[(3'h6):(3'h4)]};
endmodule

module module24
#(parameter param110 = (~^(^(!((8'hbb) == {(8'ha2)})))), 
parameter param111 = {((param110 ? (param110 | (param110 ? param110 : param110)) : param110) ? (param110 & param110) : param110)})
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire108;
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  assign y = {wire60,
                 wire62,
                 wire63,
                 wire64,
                 wire108,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire28[(3'h4):(3'h4)] >>> $unsigned($unsigned(wire29[(1'h0):(1'h0)]))))
        begin
          reg30 <= wire26[(1'h1):(1'h1)];
          reg31 <= (+$signed((~^wire28[(2'h2):(2'h2)])));
        end
      else
        begin
          reg30 <= ($unsigned(wire27[(3'h5):(3'h4)]) | wire25[(1'h0):(1'h0)]);
          if ({(-(~(wire25[(4'he):(3'h4)] ?
                  $signed((8'haf)) : (reg30 || wire28)))),
              (~|wire26)})
            begin
              reg31 <= $unsigned($signed(((wire28[(1'h0):(1'h0)] >> (wire29 ?
                      reg31 : wire29)) ?
                  {(reg31 ? reg31 : wire28),
                      (reg30 ? (8'had) : wire26)} : reg30)));
              reg32 <= wire27[(3'h7):(3'h5)];
              reg33 <= (reg31 ?
                  (~wire25[(4'ha):(4'h8)]) : (+((~^(wire27 ?
                          wire27 : (8'hb0))) ?
                      $signed(wire25) : (wire25[(3'h4):(2'h3)] & ((8'ha3) ?
                          wire29 : wire25)))));
              reg34 <= $unsigned((~wire26));
            end
          else
            begin
              reg31 <= ($unsigned((reg30 >>> ((8'haf) ?
                  wire28[(2'h3):(2'h2)] : $unsigned(reg34)))) & (^~(($unsigned((8'hba)) ?
                  ((8'hba) >>> wire26) : ((8'hb8) && wire29)) >> $signed($signed(wire27)))));
              reg32 <= (wire25 ^ ((8'hae) ?
                  ($unsigned((reg32 - reg33)) ^~ (&$unsigned(wire25))) : (-(^~wire27))));
            end
          reg35 <= (^~$signed((+(8'hbe))));
          reg36 <= $signed($unsigned(({(^reg34),
              $signed(wire28)} <<< ({(8'hbf)} <= reg34[(1'h0):(1'h0)]))));
        end
      reg37 <= reg36;
      reg38 <= wire25[(4'hc):(3'h6)];
      reg39 <= $unsigned(wire25[(3'h5):(1'h1)]);
      if ($signed(reg37[(3'h6):(3'h6)]))
        begin
          reg40 <= wire29;
        end
      else
        begin
          reg40 <= $signed((({(reg32 || reg30)} ?
              reg38 : ((reg31 ?
                  (8'hb0) : reg34) != (8'ha9))) * $unsigned((|(wire29 <= reg40)))));
          reg41 <= $signed($signed(reg30[(1'h1):(1'h1)]));
        end
    end
  module42 #() modinst61 (wire60, clk, reg30, reg34, wire27, wire28);
  assign wire62 = (^~wire25);
  assign wire63 = reg38;
  assign wire64 = (|(({{reg30}} > $unsigned(wire26)) ?
                      ((^~reg37[(3'h4):(1'h0)]) < ((~wire27) ?
                          (reg31 ?
                              wire63 : reg34) : reg32)) : $signed($signed($signed(reg35)))));
  module65 #() modinst109 (wire108, clk, wire29, wire26, reg30, wire28);
endmodule

module module65  (y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire68;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire100,
                 wire88,
                 wire73,
                 wire72,
                 wire71,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg70 <= (~wire67);
    end
  assign wire71 = wire69;
  assign wire72 = (wire67[(4'h8):(1'h1)] ?
                      ((-wire71) <<< reg70) : ((~|wire67[(3'h6):(2'h2)]) ?
                          wire66[(1'h0):(1'h0)] : $signed(((reg70 ?
                                  wire71 : wire69) ?
                              (~&wire69) : wire69[(1'h1):(1'h0)]))));
  assign wire73 = ({(((wire72 || reg70) ?
                              (reg70 ? wire69 : wire71) : (|wire66)) ?
                          (~|$signed(wire71)) : (!(wire71 ?
                              wire66 : wire67)))} & wire66[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (($signed(wire72[(1'h0):(1'h0)]) ?
          $unsigned(wire72[(4'hc):(1'h0)]) : ((~($unsigned(wire66) <<< wire72)) ?
              (&$signed($signed(wire73))) : wire66)))
        begin
          reg74 <= (wire66 < (|wire71));
          reg75 <= ((reg70 > (&(+(wire66 >= wire73)))) << (~|$unsigned(wire69)));
          reg76 <= {((wire66 != ((!wire72) | wire72)) + (^(wire68 > $unsigned(wire72)))),
              wire66};
        end
      else
        begin
          if (wire73)
            begin
              reg74 <= (((~{reg70}) >= wire67) ?
                  ($signed(wire72) && reg74) : ((~wire69) == (8'h9e)));
              reg75 <= reg74[(2'h3):(1'h1)];
              reg76 <= wire73;
              reg77 <= $unsigned($unsigned(reg75[(1'h0):(1'h0)]));
            end
          else
            begin
              reg74 <= ($unsigned(wire72) | $signed(reg75[(1'h1):(1'h0)]));
              reg75 <= wire68;
              reg76 <= (($unsigned(($unsigned(wire72) != {reg76})) * wire66[(1'h1):(1'h0)]) ?
                  wire67[(3'h4):(2'h2)] : ((wire71[(3'h5):(1'h0)] * reg70[(4'hd):(1'h0)]) ?
                      wire69 : {((^wire67) == wire66)}));
              reg77 <= (~|(wire67 <= ($signed((8'ha4)) ~^ ((wire68 ^~ reg77) >>> $unsigned(wire73)))));
            end
          reg78 <= reg70;
          if ($unsigned(reg70))
            begin
              reg79 <= wire67;
              reg80 <= ({(~reg79),
                      $unsigned(({reg70, reg76} == {(7'h44), wire69}))} ?
                  {wire69, wire69} : reg70[(1'h0):(1'h0)]);
              reg81 <= wire71[(2'h2):(2'h2)];
            end
          else
            begin
              reg79 <= (reg77 - $signed(((wire68 < wire71[(3'h6):(1'h0)]) < ((~^reg78) << $unsigned(reg79)))));
              reg80 <= ((8'ha8) || {reg81, $signed($signed($signed((7'h40))))});
            end
          if ($unsigned($unsigned(wire68)))
            begin
              reg82 <= (|$unsigned(((~&(-reg81)) < wire67[(3'h5):(2'h2)])));
            end
          else
            begin
              reg82 <= $signed((~|$signed(wire72[(3'h5):(2'h3)])));
              reg83 <= $unsigned({reg78[(4'h9):(2'h2)],
                  $signed((reg70 ? reg78[(3'h4):(3'h4)] : {wire68, reg82}))});
              reg84 <= ((&$signed(wire67[(3'h6):(1'h0)])) ?
                  $signed((((reg78 | reg83) ?
                      {reg70, reg74} : (reg82 || (8'hb5))) << (!(reg76 ?
                      (8'ha5) : wire69)))) : (~&(reg81 | $unsigned(reg70[(1'h0):(1'h0)]))));
              reg85 <= $signed(($unsigned($signed(wire67[(2'h3):(1'h0)])) ?
                  $signed(reg74) : {{$unsigned(reg77), (~|reg83)}, reg76}));
              reg86 <= (8'ha6);
            end
        end
      reg87 <= $signed((^~$signed($unsigned($unsigned(wire73)))));
    end
  assign wire88 = ($unsigned(($unsigned(wire71) >= $signed((reg74 | wire66)))) ?
                      {$unsigned(($signed((8'ha2)) <= $signed(reg80))),
                          $unsigned(reg70[(1'h0):(1'h0)])} : $unsigned(reg76));
  always
    @(posedge clk) begin
      if ($unsigned({(((reg82 ? wire69 : reg77) ? reg86 : ((8'ha6) * reg70)) ?
              ((|reg84) || (|reg79)) : ({reg84, reg87} ?
                  (&reg78) : (reg81 ? reg79 : reg78))),
          ((reg83[(1'h0):(1'h0)] ?
              (wire67 * wire72) : (wire67 ? reg86 : wire72)) > reg79)}))
        begin
          reg89 <= (7'h42);
          if ($signed((^$signed(reg84[(3'h6):(3'h6)]))))
            begin
              reg90 <= wire88[(3'h6):(1'h1)];
              reg91 <= {(^({(8'hb8)} ?
                      ((|reg85) - reg79) : ($unsigned(reg81) ?
                          $signed(reg90) : (!reg70))))};
              reg92 <= {$signed((^~((reg84 ? reg77 : reg82) ?
                      reg83 : ((8'h9d) <<< reg74)))),
                  reg90};
              reg93 <= (~$signed(($unsigned({reg77, reg89}) << (8'hb7))));
            end
          else
            begin
              reg90 <= {(~(-$signed(wire67))),
                  (reg85 ?
                      $unsigned($signed($signed(wire67))) : {((!wire71) == $signed(reg83))})};
            end
          if (reg75[(2'h2):(1'h1)])
            begin
              reg94 <= {{reg70,
                      ($signed((!reg93)) ~^ ({reg85} ?
                          (reg92 ? reg74 : reg89) : $unsigned((8'hb6))))},
                  reg78[(3'h7):(1'h1)]};
              reg95 <= $signed(($signed(reg92[(3'h7):(2'h3)]) ?
                  (^~($signed(reg79) ?
                      $signed(reg92) : (reg83 << reg89))) : {$signed(reg87),
                      $signed(wire73)}));
              reg96 <= (($unsigned(reg82) ?
                  (-$unsigned(reg76)) : reg74[(4'h8):(2'h2)]) | (~^{((~^wire73) + {reg83}),
                  wire88}));
              reg97 <= (~|reg93[(1'h0):(1'h0)]);
              reg98 <= reg80;
            end
          else
            begin
              reg94 <= $unsigned((&(^~{(wire71 ? reg77 : reg81)})));
              reg95 <= wire68[(5'h12):(2'h2)];
              reg96 <= wire66[(2'h2):(1'h0)];
              reg97 <= $unsigned((^(^(((8'h9f) * wire68) >> (~&reg70)))));
              reg98 <= $signed($signed($unsigned($signed((~|reg81)))));
            end
          reg99 <= ($unsigned(reg77[(1'h0):(1'h0)]) ^~ (^~$unsigned(((reg96 ?
                  reg98 : reg83) ?
              $unsigned(wire72) : (|reg81)))));
        end
      else
        begin
          reg89 <= $signed({$signed($unsigned($unsigned(wire68))),
              {($unsigned(reg92) ? $signed(reg97) : $signed(wire72))}});
          reg90 <= {wire73};
          reg91 <= (|reg90);
        end
    end
  assign wire100 = (~|reg74);
  assign wire101 = (((reg85 ?
                       wire68 : (-$signed(wire71))) >>> (reg77[(2'h3):(1'h1)] != $signed(wire100))) <= (^($unsigned((reg97 ?
                           reg99 : wire69)) ?
                       ({reg99,
                           reg99} == $signed((8'hac))) : reg89[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg102 <= $unsigned($unsigned((((^reg74) ?
          (~^reg80) : reg80[(1'h1):(1'h0)]) != reg78)));
    end
  assign wire103 = {$unsigned(reg83)};
  assign wire104 = ($signed((reg78[(2'h2):(1'h1)] ?
                           ((+wire66) ? (|wire88) : $signed(reg91)) : ({reg81} ?
                               (reg84 >> wire72) : $signed(reg95)))) ?
                       wire66[(1'h0):(1'h0)] : {reg91[(2'h2):(2'h2)]});
  assign wire105 = (reg102 ? (!{$signed((^~reg99)), reg81}) : $unsigned(reg96));
  assign wire106 = reg75;
  assign wire107 = reg92;
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  assign y = {wire59,
                 wire48,
                 wire47,
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
                 (1'h0)};
  assign wire47 = ({(wire46 ?
                          (&$unsigned((8'hb0))) : {{wire45, wire44},
                              {wire44}})} <<< wire46);
  assign wire48 = (~^{(!($unsigned(wire46) ?
                          $signed(wire46) : (wire47 ? wire47 : wire47))),
                      (^~wire45[(5'h13):(4'ha)])});
  always
    @(posedge clk) begin
      reg49 <= $unsigned($signed($unsigned((~(wire43 == wire43)))));
      reg50 <= $signed($signed($signed(((wire47 | wire44) ?
          (^wire45) : $signed(wire45)))));
    end
  always
    @(posedge clk) begin
      if ((({($signed((8'ha0)) >>> $unsigned(wire46))} ?
          reg49[(1'h0):(1'h0)] : (8'hbe)) - wire45[(3'h5):(1'h0)]))
        begin
          reg51 <= (|$signed($signed($signed((wire47 < wire44)))));
        end
      else
        begin
          reg51 <= reg51[(1'h0):(1'h0)];
          if ($signed($unsigned({reg50[(4'hd):(2'h2)],
              ((reg50 ? reg50 : wire43) * {wire44})})))
            begin
              reg52 <= {{reg49[(4'hb):(2'h2)]}, wire48[(1'h1):(1'h0)]};
              reg53 <= (8'h9e);
            end
          else
            begin
              reg52 <= $unsigned($signed((&(wire43 ?
                  {wire45, reg50} : $unsigned(wire44)))));
              reg53 <= wire43;
              reg54 <= $signed((|(((wire46 << wire47) ?
                      wire43 : reg53[(1'h1):(1'h1)]) ?
                  (-wire46) : {$signed(reg51)})));
              reg55 <= $signed(((($signed(reg53) > $unsigned(wire45)) < $signed(wire46)) ?
                  (~&wire46) : wire48[(3'h5):(3'h4)]));
              reg56 <= reg52[(3'h7):(3'h4)];
            end
        end
      reg57 <= {$unsigned({$signed($signed(reg53)), (~$unsigned(reg50))})};
      reg58 <= $signed($signed(($signed(wire48) == $signed((reg55 > (8'hbd))))));
    end
  assign wire59 = ($unsigned(($unsigned({wire44}) < ($unsigned(reg54) ?
                      $signed(wire47) : (reg55 ?
                          wire47 : reg56)))) != $unsigned((!((8'haf) ?
                      reg57[(2'h3):(2'h2)] : wire46[(4'ha):(4'h9)]))));
endmodule
