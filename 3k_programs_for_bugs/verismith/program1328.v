module top
#(parameter param135 = {(&((((7'h43) == (8'hb5)) <<< ((8'hbd) + (8'hac))) ? (((8'h9c) ? (8'hbf) : (8'hb9)) ? ((8'hb1) == (7'h43)) : ((8'had) << (8'hb4))) : {((8'ha7) ~^ (8'hb6))})), (!({((8'had) ? (8'hb6) : (8'hb4)), ((8'hb6) >= (8'hbb))} >> (8'hab)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  assign y = {wire134,
                 wire122,
                 wire104,
                 wire103,
                 wire102,
                 wire97,
                 wire86,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire4,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg101,
                 reg100,
                 reg99,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 (1'h0)};
  assign wire4 = (^($unsigned($signed($unsigned(wire1))) << {wire1[(4'h9):(1'h0)]}));
  module5 #() modinst70 (.wire8(wire3), .clk(clk), .wire9(wire4), .wire7(wire1), .y(wire69), .wire6(wire0));
  assign wire71 = wire2;
  assign wire72 = $signed(wire2[(4'hb):(3'h7)]);
  assign wire73 = wire3;
  assign wire74 = $unsigned($unsigned(($unsigned(wire3) ^~ wire2)));
  assign wire75 = {(8'had),
                      (wire0[(1'h0):(1'h0)] ? wire69 : wire73[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      if (wire73)
        begin
          if ((!(wire72[(3'h4):(2'h2)] || $unsigned(wire1[(2'h2):(2'h2)]))))
            begin
              reg76 <= wire71;
              reg77 <= ((~({wire0[(1'h0):(1'h0)]} <<< (-$unsigned(reg76)))) ?
                  $signed(($unsigned(wire0) <<< wire0)) : ($signed((+(!(7'h40)))) ~^ (wire69 * $signed(wire72[(5'h10):(4'hc)]))));
              reg78 <= (-{(({(7'h42)} ? wire72 : wire4[(3'h4):(3'h4)]) ?
                      wire3[(4'ha):(3'h4)] : (^~wire3))});
              reg79 <= ((^~$signed((8'hb8))) ?
                  wire71 : {$signed(wire69[(2'h2):(2'h2)]),
                      $signed(wire72[(4'ha):(4'h9)])});
              reg80 <= {$unsigned(reg79),
                  ({(~^wire4[(4'hc):(1'h0)]), $signed(reg78)} ^~ reg79)};
            end
          else
            begin
              reg76 <= (-wire69[(2'h3):(1'h1)]);
              reg77 <= $unsigned(((((reg79 ? wire75 : (8'hbb)) ?
                      (reg80 - wire2) : {wire2, (8'hbe)}) + ((reg80 && wire2) ?
                      $unsigned(wire3) : {wire3, (7'h40)})) ?
                  $signed((wire73 ?
                      $unsigned(wire2) : wire2)) : $unsigned(wire4[(4'hb):(3'h6)])));
              reg78 <= $signed($unsigned((((reg77 <= wire0) + wire72) ?
                  $signed(wire72[(3'h5):(3'h4)]) : $signed(wire0[(3'h4):(1'h0)]))));
              reg79 <= wire4;
              reg80 <= {($signed((((8'ha1) < wire74) ~^ (wire1 < wire1))) ?
                      (wire1 ?
                          $unsigned((reg77 ?
                              (8'hb5) : reg78)) : (|wire75)) : $unsigned((reg77[(3'h5):(1'h1)] ^~ (~|wire4)))),
                  wire71[(4'h9):(2'h2)]};
            end
          reg81 <= (($signed({{wire3,
                  wire74}}) + wire71[(1'h1):(1'h1)]) <= $signed((~&(wire3[(3'h4):(2'h2)] >= $signed(wire2)))));
          reg82 <= $unsigned(($unsigned($unsigned($signed(reg80))) <<< reg77[(3'h4):(2'h2)]));
          reg83 <= (^wire0[(1'h0):(1'h0)]);
          if ((reg83 ?
              wire2[(1'h0):(1'h0)] : (((^~reg80) ?
                  $unsigned({wire3,
                      wire75}) : $signed(wire74)) != (wire75[(3'h6):(2'h3)] >= $signed((wire0 ?
                  (8'ha2) : reg80))))))
            begin
              reg84 <= $signed($signed($signed($signed((-wire4)))));
            end
          else
            begin
              reg84 <= wire2;
              reg85 <= $signed($signed((reg81 >>> (~|reg80[(4'hf):(2'h2)]))));
            end
        end
      else
        begin
          reg76 <= $signed((wire74[(3'h7):(3'h4)] < $signed($signed(wire69[(3'h6):(1'h1)]))));
          reg77 <= (wire74[(1'h1):(1'h1)] << $signed(reg80));
          reg78 <= {$signed((wire0 ^ $unsigned(reg85)))};
          if ($unsigned({wire2, $unsigned((+(wire3 && wire71)))}))
            begin
              reg79 <= $unsigned(wire71[(4'h8):(4'h8)]);
            end
          else
            begin
              reg79 <= (8'ha4);
              reg80 <= reg84;
              reg81 <= wire74[(4'hd):(4'hd)];
              reg82 <= ((&((wire4[(2'h2):(1'h0)] ?
                          wire73[(5'h10):(1'h1)] : $unsigned((8'ha7))) ?
                      $signed((-wire1)) : $unsigned(wire0))) ?
                  (~^$unsigned(reg76[(3'h5):(3'h5)])) : wire75);
            end
        end
    end
  assign wire86 = wire3;
  module87 #() modinst98 (.y(wire97), .clk(clk), .wire91(reg77), .wire88(wire3), .wire89(reg82), .wire92(wire4), .wire90(reg80));
  always
    @(posedge clk) begin
      reg99 <= reg85;
      reg100 <= $unsigned($unsigned(({(wire74 >= reg85)} ^~ $unsigned((~|reg80)))));
      reg101 <= $signed($signed((-$signed($signed(wire97)))));
    end
  assign wire102 = reg84[(3'h5):(3'h4)];
  assign wire103 = $unsigned($signed(wire97));
  assign wire104 = $unsigned($signed(wire3));
  always
    @(posedge clk) begin
      if ($unsigned(((7'h40) ?
          ($signed(reg80) ?
              reg99 : (reg99[(1'h0):(1'h0)] && (wire4 ?
                  reg83 : wire0))) : (&(!(reg77 != wire69))))))
        begin
          reg105 <= (!(((~^$unsigned((8'hac))) ?
              wire97[(1'h0):(1'h0)] : (+reg78[(3'h4):(1'h0)])) ^~ $unsigned($unsigned($unsigned(reg76)))));
          reg106 <= reg99;
          reg107 <= (((((reg85 ~^ reg78) ?
                  wire86[(3'h5):(1'h1)] : wire74[(4'hd):(3'h6)]) ~^ wire71[(1'h1):(1'h0)]) - {$signed(reg83[(3'h4):(2'h2)]),
                  {(wire97 ? wire69 : wire86), (~&wire3)}}) ?
              ((-($signed(wire75) ^~ reg105[(3'h6):(3'h5)])) ?
                  reg82[(3'h7):(2'h2)] : wire104[(1'h0):(1'h0)]) : ((&({(8'ha8),
                          wire4} ?
                      wire73 : wire2[(1'h0):(1'h0)])) ?
                  ({$signed(wire0), {wire71, reg76}} <<< ((wire73 ?
                          (8'hb4) : reg77) ?
                      (wire69 ?
                          wire97 : reg82) : $signed(reg99))) : ($unsigned((reg83 ?
                          wire4 : wire4)) ?
                      wire1 : (8'ha2))));
          if ($unsigned($unsigned($signed(reg99[(4'hb):(4'h8)]))))
            begin
              reg108 <= reg107[(3'h7):(3'h5)];
              reg109 <= $unsigned(({wire86, $signed(reg81)} ?
                  (~|$unsigned({reg107})) : {$signed(reg81)}));
              reg110 <= wire4;
            end
          else
            begin
              reg108 <= $unsigned((8'hac));
              reg109 <= (reg80[(4'h8):(2'h2)] ?
                  ((($signed(wire69) > $unsigned(wire71)) + $unsigned((reg99 ?
                          wire73 : reg85))) ?
                      $signed((reg84[(4'hb):(4'ha)] || wire75)) : $unsigned(wire74[(4'ha):(1'h0)])) : (wire0[(1'h0):(1'h0)] ?
                      $unsigned((8'hb8)) : $unsigned($signed($unsigned(reg79)))));
              reg110 <= wire104[(4'h9):(3'h5)];
              reg111 <= (|(reg108 == $unsigned($unsigned((reg105 * reg77)))));
            end
        end
      else
        begin
          reg105 <= wire104[(3'h6):(1'h0)];
          reg106 <= $signed(wire2[(4'h9):(3'h6)]);
          reg107 <= (&(({$signed(reg78),
                  reg83[(3'h6):(1'h0)]} & $unsigned((~reg77))) ?
              ((reg85 ? (reg99 != reg82) : wire3[(3'h4):(1'h0)]) ?
                  (|{wire4,
                      reg76}) : $signed((wire104 & wire86))) : (((reg76 < reg82) ^ reg85) ?
                  ($unsigned(wire2) > reg100[(4'h8):(3'h5)]) : (reg83[(3'h6):(2'h2)] >= wire3))));
          reg108 <= wire103[(2'h2):(1'h0)];
          reg109 <= reg105[(3'h7):(3'h7)];
        end
      if ($unsigned(reg83[(3'h7):(3'h5)]))
        begin
          reg112 <= (~|reg81[(4'h8):(2'h2)]);
          reg113 <= (-((8'hb7) - $signed((~$signed((8'h9c))))));
          reg114 <= ((^~(8'hbe)) ?
              {((|reg108[(4'hd):(4'ha)]) & ($unsigned((8'ha2)) > reg83))} : wire103[(4'hb):(4'hb)]);
          reg115 <= $signed(((~^(reg81 ?
              ((8'ha5) ? reg110 : wire0) : (^~wire2))) <<< (8'h9c)));
        end
      else
        begin
          if (((wire0 ?
                  ($unsigned({reg82,
                      reg112}) - reg82[(4'h9):(2'h3)]) : reg108[(4'h9):(3'h5)]) ?
              (~wire69) : (~(reg78 ?
                  reg76[(3'h6):(3'h4)] : ((8'ha2) != (wire103 ?
                      wire2 : reg81))))))
            begin
              reg112 <= (8'had);
              reg113 <= wire2;
              reg114 <= {reg83[(1'h0):(1'h0)]};
              reg115 <= $unsigned(reg79[(3'h5):(3'h4)]);
              reg116 <= (reg82 <<< (&$unsigned(((wire72 ?
                  reg112 : (7'h44)) && (8'hbc)))));
            end
          else
            begin
              reg112 <= (($unsigned($signed((8'ha4))) ?
                  (($signed(wire2) ?
                      {reg79, reg112} : (reg100 ?
                          wire74 : reg76)) << $signed($unsigned(wire75))) : {$unsigned($unsigned(reg114)),
                      (^reg76)}) <<< {$signed($unsigned((8'ha5))),
                  (wire73[(3'h7):(3'h7)] ?
                      wire103[(3'h6):(2'h2)] : $unsigned(wire73))});
              reg113 <= wire69;
            end
          reg117 <= reg105[(3'h6):(2'h3)];
          reg118 <= $unsigned(((($signed(wire73) > (^~wire73)) ?
                  (-$signed(wire3)) : (wire4 ^ {wire69})) ?
              $unsigned(({reg81} ?
                  reg81[(3'h5):(3'h4)] : (reg80 > reg79))) : wire75));
          reg119 <= reg101[(2'h2):(2'h2)];
        end
      if ((-(((reg110[(4'h8):(3'h6)] + {wire2, reg109}) <<< {$unsigned(wire2),
          ((8'hb8) >> (8'hb7))}) > $signed((wire75 | reg82)))))
        begin
          reg120 <= $signed((-$signed($signed($signed(wire104)))));
        end
      else
        begin
          reg120 <= (8'hb1);
        end
      reg121 <= $signed(wire0);
    end
  assign wire122 = wire104;
  always
    @(posedge clk) begin
      reg123 <= wire102;
      reg124 <= (|wire86[(3'h6):(3'h6)]);
      if (((^~reg76) << (~^((~|reg83) ?
          ((reg105 ?
              reg106 : reg115) * wire74[(1'h0):(1'h0)]) : wire69[(3'h5):(3'h5)]))))
        begin
          reg125 <= reg119;
          reg126 <= $unsigned($signed(wire122[(3'h4):(3'h4)]));
          reg127 <= reg107[(2'h3):(1'h0)];
          if ((reg109[(4'hf):(4'ha)] << $unsigned({((~^wire73) <= (7'h40)),
              ((reg108 ? (8'h9e) : reg113) ? (wire74 ^~ wire103) : reg126)})))
            begin
              reg128 <= {(((reg118[(2'h3):(2'h3)] ?
                      reg111[(4'hb):(3'h4)] : reg127[(2'h2):(1'h0)]) ~^ ((reg107 ?
                      reg108 : wire104) << (reg119 ?
                      reg111 : (8'hbd)))) >= reg79[(3'h5):(1'h1)])};
              reg129 <= {(reg112 ?
                      reg84[(4'he):(1'h1)] : (~^(~|(wire72 ?
                          (8'hb4) : wire103))))};
              reg130 <= ($signed(wire104[(4'h9):(2'h2)]) ?
                  ($unsigned($signed(((7'h44) ? reg101 : wire2))) ?
                      (|(!reg116[(3'h5):(2'h2)])) : {$signed((reg101 ?
                              reg106 : wire103)),
                          {(reg76 ? (8'ha3) : reg83),
                              ((8'ha2) ?
                                  reg81 : reg120)}}) : (reg115[(3'h7):(3'h4)] > ((reg116 >= (reg118 ?
                          (8'ha7) : reg85)) ?
                      $signed(wire86) : (~{(7'h44), wire71}))));
              reg131 <= (!(-($unsigned((reg100 ? reg116 : reg124)) ?
                  reg127 : {((8'ha0) == reg113)})));
              reg132 <= (^~$unsigned((wire1 == reg118)));
            end
          else
            begin
              reg128 <= reg126;
              reg129 <= reg80;
              reg130 <= reg81;
              reg131 <= (+{$signed($signed((wire86 ? (8'hb6) : reg108)))});
              reg132 <= wire103;
            end
        end
      else
        begin
          if (((wire0[(1'h0):(1'h0)] | $signed(reg84)) ?
              {$unsigned({reg119[(4'hc):(3'h5)],
                      ((7'h43) >> (8'hba))})} : reg111))
            begin
              reg125 <= (~^({(~&(~|reg81)), {(8'ha8)}} > wire1[(4'he):(4'he)]));
              reg126 <= (($unsigned(reg106[(4'ha):(1'h0)]) & reg109[(1'h0):(1'h0)]) <<< (reg107 == ($signed(reg124[(3'h6):(1'h1)]) & (!(|reg100)))));
              reg127 <= wire4[(3'h4):(2'h2)];
              reg128 <= {(8'hac)};
              reg129 <= wire103[(1'h0):(1'h0)];
            end
          else
            begin
              reg125 <= reg77[(3'h4):(3'h4)];
            end
          reg130 <= $unsigned(($unsigned($unsigned({reg100})) != (reg127[(1'h1):(1'h0)] + $unsigned($unsigned(wire74)))));
          reg131 <= $unsigned(reg78[(4'h9):(1'h0)]);
        end
      reg133 <= wire73[(2'h3):(1'h1)];
    end
  assign wire134 = $signed((-$unsigned((^~reg82))));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire [(5'h15):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  input wire signed [(3'h5):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  assign y = {wire96, wire95, wire94, wire93, (1'h0)};
  assign wire93 = ((~&{wire90[(3'h5):(3'h5)]}) ?
                      (~&(wire91[(1'h0):(1'h0)] ?
                          wire89[(4'h9):(3'h5)] : {$unsigned(wire88)})) : wire88);
  assign wire94 = wire92[(1'h1):(1'h1)];
  assign wire95 = (~({{(wire94 ? wire90 : wire94), (!(8'ha1))}, (~|wire93)} ?
                      {$signed((^~wire92))} : (8'hbb)));
  assign wire96 = ({wire90[(4'hf):(3'h5)],
                          $unsigned(((wire89 ? wire91 : wire90) ?
                              ((8'ha6) ?
                                  (8'hb3) : wire94) : $unsigned(wire92)))} ?
                      wire89[(1'h1):(1'h1)] : $unsigned(wire91));
endmodule

module module5
#(parameter param67 = (-(8'hb7)), 
parameter param68 = (param67 ? ((((8'ha0) & ((8'ha2) ? param67 : param67)) && ((8'haf) < {param67, param67})) ? (param67 ? ({param67, param67} ? param67 : (param67 ? param67 : param67)) : (^~param67)) : (!(&(param67 >>> param67)))) : (8'ha5)))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire49;
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire10,
                 wire11,
                 wire17,
                 wire49,
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
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire10 = $signed(wire9[(3'h4):(1'h0)]);
  assign wire11 = wire10;
  always
    @(posedge clk) begin
      reg12 <= wire8;
      reg13 <= $unsigned(wire10);
      reg14 <= (8'haf);
      reg15 <= ({wire11,
          ((~|{wire10}) < $unsigned({wire6, wire6}))} == ({wire11, wire9} ?
          wire11 : (8'hbc)));
      reg16 <= (reg15 ? $signed(reg13) : wire6[(2'h2):(2'h2)]);
    end
  assign wire17 = wire11;
  module18 #() modinst50 (wire49, clk, wire6, wire7, wire10, reg15);
  always
    @(posedge clk) begin
      reg51 <= wire49;
      if ($signed(wire10[(1'h0):(1'h0)]))
        begin
          reg52 <= ($signed((+(!(wire17 && wire7)))) >> ((!($unsigned(wire11) > (reg14 ^~ wire6))) ?
              $signed((wire9 ?
                  wire11 : (wire6 ?
                      reg16 : wire6))) : $signed($signed((!(8'ha2))))));
          reg53 <= wire7[(4'hd):(4'h8)];
          reg54 <= wire8[(2'h2):(1'h0)];
        end
      else
        begin
          reg52 <= $unsigned(reg53[(4'h9):(3'h5)]);
          if ($unsigned(reg52))
            begin
              reg53 <= ((~{{$unsigned(reg14)},
                  ((reg16 > (8'hb0)) ?
                      $signed(reg16) : $unsigned(reg52))}) * ((^~((|wire7) & (~|reg14))) && (($signed(wire11) & (wire11 ?
                      wire6 : reg14)) ?
                  $signed((wire7 ? (8'hbb) : reg53)) : {(|reg15)})));
              reg54 <= $unsigned($unsigned($signed((wire10[(3'h4):(2'h2)] ?
                  $unsigned((8'h9f)) : (reg51 * wire6)))));
              reg55 <= $unsigned((|$unsigned(((wire49 ? (8'hb4) : reg52) ?
                  wire7 : wire49[(3'h7):(3'h7)]))));
              reg56 <= $unsigned(((wire49 ?
                  ({reg53, (8'haa)} ?
                      $unsigned((8'ha9)) : $unsigned(wire49)) : $unsigned(reg12[(4'ha):(1'h0)])) || $signed($unsigned($unsigned(reg14)))));
            end
          else
            begin
              reg53 <= {$signed(($unsigned({(8'ha9)}) ?
                      $signed((reg52 ? reg53 : (8'hbb))) : reg52)),
                  (({(wire10 ? reg55 : wire9),
                          (wire9 >>> reg53)} > ($signed(reg53) && $signed(wire9))) ?
                      reg14[(2'h3):(1'h0)] : $unsigned(reg55[(2'h2):(1'h1)]))};
              reg54 <= wire10[(1'h0):(1'h0)];
              reg55 <= reg14;
            end
        end
      reg57 <= (((~^$unsigned(wire11)) != $signed(reg54[(2'h3):(2'h2)])) - (reg51[(4'h8):(3'h5)] + reg14[(3'h5):(1'h1)]));
      if ($signed((8'hae)))
        begin
          reg58 <= $unsigned(reg12);
          reg59 <= ($unsigned(reg51) >> ($unsigned((^wire9[(4'ha):(2'h2)])) > $unsigned($signed($unsigned(reg55)))));
        end
      else
        begin
          reg58 <= ($unsigned(reg12) ?
              wire11[(2'h3):(1'h1)] : ((reg15 - {(wire10 != (8'hb8))}) ?
                  (reg53 ? (8'hb3) : $unsigned((reg59 - reg57))) : (-wire9)));
          if ({$signed(reg51[(3'h6):(1'h1)])})
            begin
              reg59 <= (reg51 >= wire9);
              reg60 <= (($unsigned({$unsigned(reg14)}) + reg58[(3'h4):(3'h4)]) - $signed((reg57 <= reg59)));
              reg61 <= $unsigned((8'ha6));
            end
          else
            begin
              reg59 <= (($unsigned((reg14 ?
                      reg61[(1'h1):(1'h0)] : $unsigned(reg58))) & ($unsigned($signed((8'ha2))) ?
                      (|(!reg52)) : $signed(reg55))) ?
                  (wire8 ~^ reg56[(1'h1):(1'h0)]) : $unsigned((wire49 ?
                      ((~reg12) <<< wire11[(4'h9):(2'h3)]) : reg56[(5'h14):(3'h7)])));
              reg60 <= reg16;
            end
          reg62 <= (^~($unsigned(({reg12, reg61} | $signed(wire10))) ?
              (8'ha0) : reg13[(4'hd):(4'hc)]));
          reg63 <= (~^(+((+wire6[(1'h0):(1'h0)]) ?
              (wire10 >>> {reg16, reg52}) : reg56[(3'h4):(1'h0)])));
        end
      reg64 <= reg57;
    end
  assign wire65 = $unsigned((reg54 >> wire49[(3'h6):(1'h1)]));
  assign wire66 = ($signed({(wire9 ? (wire6 - (8'h9d)) : wire7)}) ?
                      $signed(({reg13, (|reg52)} ?
                          (^~$signed(reg14)) : reg54[(2'h2):(1'h1)])) : reg57);
endmodule

module module18
#(parameter param47 = (8'h9e), 
parameter param48 = (((8'ha7) ? (param47 - (+(+param47))) : (param47 & param47)) || ((&((param47 >>> param47) ? param47 : param47)) >= (&(~param47)))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire23 = $unsigned(wire21);
  assign wire24 = wire21;
  assign wire25 = $signed((~^(~(+$unsigned(wire21)))));
  assign wire26 = ((~^$signed({wire21,
                      wire22[(1'h0):(1'h0)]})) > ($unsigned({$unsigned(wire25)}) ?
                      (!wire23) : (7'h41)));
  assign wire27 = {$unsigned(wire19)};
  assign wire28 = ({wire19} <= ((~&wire19[(2'h3):(2'h3)]) & $signed((7'h44))));
  assign wire29 = $unsigned($signed((^wire25[(2'h3):(2'h3)])));
  assign wire30 = wire19;
  always
    @(posedge clk) begin
      reg31 <= ((^$unsigned(($signed(wire27) != $signed((8'ha8))))) > ((|((wire20 ?
          wire27 : wire29) + (wire23 ? wire26 : wire29))) << wire23));
      if (reg31)
        begin
          if ((8'h9d))
            begin
              reg32 <= $signed((wire25 ?
                  $signed(wire30) : ({wire24} >> (+(^~wire30)))));
              reg33 <= $signed((wire24 ? (7'h44) : $signed(wire22)));
              reg34 <= (wire24 * $signed(wire23));
            end
          else
            begin
              reg32 <= (~|(+$signed(wire23)));
            end
        end
      else
        begin
          reg32 <= (+wire27);
          reg33 <= ((wire27 ?
                  (wire21 ?
                      $unsigned((wire28 ~^ wire27)) : $signed(wire30[(3'h5):(1'h0)])) : $signed((^~$signed(wire23)))) ?
              {((8'hb2) ? {(~(8'hb8)), wire26} : (+(wire25 <<< wire29))),
                  (!(^(wire23 + reg31)))} : $unsigned(wire28[(2'h2):(2'h2)]));
          if (reg32)
            begin
              reg34 <= $signed((reg34[(4'ha):(1'h0)] == (wire24[(1'h1):(1'h0)] ^~ (wire29[(1'h1):(1'h0)] > reg34))));
              reg35 <= $unsigned((~^$unsigned(wire24[(1'h1):(1'h1)])));
              reg36 <= (wire19[(1'h0):(1'h0)] >>> ((!$unsigned($signed((8'had)))) ?
                  $unsigned(((reg31 ? wire23 : wire22) ?
                      (reg33 - (8'hb2)) : reg32[(3'h5):(1'h1)])) : $signed({wire22,
                      (^~wire29)})));
            end
          else
            begin
              reg34 <= ({($signed({reg36, reg31}) ? reg34 : {(&reg31)}),
                      (wire25 >> wire22)} ?
                  reg33[(2'h2):(1'h0)] : $signed($unsigned(reg31[(4'h8):(1'h0)])));
              reg35 <= reg31;
              reg36 <= $unsigned(wire19);
            end
          reg37 <= wire28;
        end
    end
  assign wire38 = {((|{$signed(wire22),
                          $signed(reg34)}) ~^ $signed((wire21[(4'h9):(3'h6)] ?
                          wire26[(3'h4):(1'h1)] : wire24))),
                      {wire23[(4'ha):(1'h1)], $signed($signed((^~wire27)))}};
  assign wire39 = ($unsigned({$unsigned({wire38})}) ?
                      reg31[(4'h8):(3'h4)] : reg34);
  assign wire40 = (reg33 + (wire28 ?
                      $unsigned($unsigned(wire39[(3'h5):(3'h4)])) : wire19));
  assign wire41 = reg37;
  assign wire42 = $signed(((^~wire38[(1'h0):(1'h0)]) | wire40[(4'hb):(2'h2)]));
  assign wire43 = $unsigned(reg31[(1'h1):(1'h0)]);
  assign wire44 = $unsigned(($unsigned(($signed(wire19) << (~|reg37))) ?
                      wire27 : $unsigned({$signed((8'hbc))})));
  assign wire45 = reg34;
  assign wire46 = (~|(~(({wire44,
                      reg33} ~^ reg37[(1'h1):(1'h1)]) >= (wire23[(1'h1):(1'h0)] ?
                      $signed(reg34) : wire22))));
endmodule
