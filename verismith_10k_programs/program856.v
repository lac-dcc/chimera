module top
#(parameter param125 = ((((^((7'h40) ? (8'had) : (7'h44))) ? (((8'hbc) <<< (8'ha7)) ? {(8'hab), (8'ha1)} : ((7'h42) ? (7'h43) : (8'hac))) : {(~&(8'hb8)), {(8'h9f)}}) ^ ((-((7'h42) ? (8'hb5) : (8'hbe))) ? ({(8'hb7), (8'h9d)} >>> ((8'hb8) ? (8'h9d) : (8'ha6))) : (((8'hb8) ~^ (7'h40)) <= (&(8'h9c))))) ^~ (((|(~(8'h9c))) ? (7'h40) : (((8'ha2) ^~ (8'ha7)) <<< ((8'ha9) > (8'h9f)))) || ((((8'hbc) != (8'hb0)) && ((8'had) > (8'hb9))) ^~ (|(+(8'ha0)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire115;
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 (1'h0)};
  module5 #() modinst116 (wire115, clk, wire1, wire4, wire0, wire3, wire2);
  assign wire117 = (-(wire0[(4'he):(4'hc)] + (~$signed((wire4 ^ wire3)))));
  assign wire118 = (wire2 ? (^{(^~(wire3 ? wire115 : wire3))}) : wire0);
  assign wire119 = $unsigned(((8'haa) ?
                       (8'h9c) : $signed(((wire0 - wire3) ?
                           $unsigned(wire2) : $unsigned(wire3)))));
  assign wire120 = (($signed($unsigned(wire118)) ?
                       (((wire4 >> wire2) ~^ {wire0}) * wire1) : wire119) ~^ $unsigned($signed(wire115)));
  assign wire121 = wire3;
  assign wire122 = {(~|({(wire119 ? (8'hb2) : wire2)} ?
                           wire118 : wire115[(4'hf):(2'h2)])),
                       {$signed($signed((wire118 ? wire3 : wire115))),
                           wire121[(1'h0):(1'h0)]}};
  assign wire123 = (&{(8'hb8), $unsigned((8'ha2))});
  assign wire124 = ($unsigned($unsigned({(wire123 ? wire118 : wire1),
                       $signed((8'h9e))})) ~^ $signed((wire3 ?
                       (wire123[(3'h7):(1'h1)] != (!wire0)) : wire121[(1'h0):(1'h0)])));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire113;
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  assign y = {wire11,
                 wire12,
                 wire24,
                 wire25,
                 wire73,
                 wire93,
                 wire94,
                 wire95,
                 wire113,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire11 = (^(wire8 ? wire9 : $signed((&(wire6 * wire8)))));
  assign wire12 = (+wire11[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire8))
        begin
          reg13 <= (~&{((~&wire10[(2'h3):(2'h3)]) || wire10[(1'h0):(1'h0)]),
              wire10[(1'h0):(1'h0)]});
          if (wire7)
            begin
              reg14 <= wire11[(3'h4):(3'h4)];
              reg15 <= $signed(((wire12 && {{(8'hae)}}) ?
                  {wire8[(2'h2):(1'h1)],
                      ((wire10 ^ wire10) >>> reg14[(1'h1):(1'h0)])} : (wire9 ^~ ($signed((8'hae)) && $unsigned(wire6)))));
              reg16 <= (8'ha3);
              reg17 <= reg13;
              reg18 <= {(reg15[(4'ha):(1'h0)] + wire7)};
            end
          else
            begin
              reg14 <= $unsigned(reg17[(1'h1):(1'h1)]);
              reg15 <= $signed(wire9);
              reg16 <= (~&reg14[(5'h13):(1'h1)]);
              reg17 <= {($unsigned(($unsigned(reg13) ?
                      wire6[(3'h5):(1'h0)] : {wire10})) >= ((|(wire8 ?
                      reg16 : wire6)) & $signed({wire7, reg16})))};
            end
          if ($unsigned(wire8))
            begin
              reg19 <= ({reg15[(4'ha):(4'h9)],
                  ((reg13[(3'h7):(3'h5)] > (^~wire6)) == $unsigned((8'ha0)))} < (wire9 | $unsigned($signed((wire10 << (8'hbd))))));
              reg20 <= (|((~{(wire12 >>> reg13), (reg13 * wire11)}) ?
                  $signed(((reg16 ?
                      reg17 : wire6) && $signed(reg18))) : $signed(((reg14 <= reg18) ?
                      (&(8'hbc)) : (wire7 >> (8'hbe))))));
            end
          else
            begin
              reg19 <= $signed(($signed(wire9[(1'h0):(1'h0)]) & $signed((~^(8'hb4)))));
            end
          reg21 <= ({$signed($signed(reg16))} ?
              $signed(reg18[(4'hd):(3'h6)]) : (~^$unsigned($unsigned(wire11))));
          reg22 <= (^(((^~$unsigned(reg20)) > ($unsigned(wire10) ?
                  (|reg20) : reg18)) ?
              ((~(^reg16)) != {$signed(wire11)}) : (wire12[(5'h10):(4'he)] ?
                  {$signed(wire9)} : $signed((8'haa)))));
        end
      else
        begin
          reg13 <= {$unsigned($unsigned(reg17[(1'h1):(1'h0)])),
              ((&(reg22 ? $signed(reg18) : (reg14 & reg17))) <<< wire11)};
          reg14 <= {$unsigned(($signed($signed((8'hb6))) ?
                  $signed((reg19 ? reg14 : reg20)) : wire6[(4'hf):(4'h9)]))};
          reg15 <= ($unsigned((8'ha3)) != reg13);
          if ($unsigned($unsigned(((reg14 ?
                  (reg22 ? wire6 : wire9) : $unsigned(wire7)) ?
              ($unsigned(wire11) ?
                  {reg20, reg19} : reg19[(5'h10):(2'h2)]) : (reg13 ?
                  (reg16 ? (8'h9e) : (8'hbc)) : wire7[(4'h9):(3'h7)])))))
            begin
              reg16 <= (8'had);
              reg17 <= reg18[(3'h7):(3'h7)];
            end
          else
            begin
              reg16 <= reg22[(3'h5):(1'h0)];
              reg17 <= $unsigned($unsigned((~|(8'hb1))));
              reg18 <= wire12;
              reg19 <= (wire10 ?
                  ((!$signed(reg15)) ^ ({$unsigned((8'hbc))} ~^ $unsigned(wire8))) : (7'h41));
              reg20 <= ((wire12 == $unsigned(((wire12 ? reg14 : wire10) ?
                  {wire11} : $unsigned(reg13)))) || wire8[(4'ha):(4'h8)]);
            end
        end
      reg23 <= reg20[(4'ha):(4'h8)];
    end
  assign wire24 = (((((-wire9) ? $signed(reg14) : (reg16 ? wire9 : wire9)) ?
                          (8'h9e) : $signed($unsigned(wire11))) ?
                      $signed(reg23) : $unsigned((reg22[(4'hd):(4'hc)] ?
                          (wire8 || reg17) : {reg21}))) == ({(~|(wire9 << reg14)),
                          (~|(wire6 || (8'hb9)))} ?
                      ($signed({wire12,
                          (8'hb7)}) ^ $signed($signed(wire12))) : reg16[(3'h7):(3'h4)]));
  assign wire25 = $unsigned((^~$signed((~^wire8))));
  module26 #() modinst74 (.wire30(wire8), .y(wire73), .clk(clk), .wire27(reg16), .wire31(reg13), .wire29(reg20), .wire28(wire11));
  always
    @(posedge clk) begin
      if (wire25[(1'h1):(1'h1)])
        begin
          reg75 <= (~|wire7[(4'ha):(1'h1)]);
        end
      else
        begin
          reg75 <= reg15;
        end
      reg76 <= (wire10[(3'h4):(2'h2)] ?
          wire25 : (wire10 - ($signed(reg21) > reg19)));
      reg77 <= wire12;
      reg78 <= (reg21[(4'he):(4'h9)] < {(&reg13[(4'hd):(3'h5)]),
          $signed(($signed((8'hb5)) >> (!reg16)))});
      reg79 <= (+reg16[(3'h4):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg80 <= ((-$unsigned((~(wire12 ? wire10 : wire11)))) ?
          ((wire24[(3'h4):(2'h3)] > ($signed(reg14) ?
              reg17[(1'h1):(1'h0)] : {reg13,
                  (8'hbe)})) << $unsigned(wire24[(2'h2):(1'h0)])) : $unsigned((-$unsigned(reg79[(4'he):(2'h3)]))));
      reg81 <= (^~$signed((reg75[(4'hd):(1'h1)] >= {(~|wire10), wire12})));
      if ((~reg15[(4'h9):(4'h9)]))
        begin
          reg82 <= {reg80};
          reg83 <= reg21[(2'h3):(2'h2)];
          reg84 <= (~(reg14 ?
              $unsigned((~(wire9 ? reg80 : wire24))) : (((reg75 ?
                      wire9 : wire8) ?
                  $signed(wire8) : (reg80 ? reg81 : wire9)) | ($signed(wire73) ?
                  (reg82 == (8'ha0)) : (reg78 ? wire11 : wire24)))));
          reg85 <= $unsigned(($signed(reg77[(5'h12):(4'he)]) ?
              (~|($signed(reg17) ?
                  (wire12 ? reg14 : reg14) : (reg16 ?
                      wire73 : wire25))) : reg77));
          if (reg17[(2'h2):(1'h0)])
            begin
              reg86 <= (^(!$signed(reg14[(4'h8):(2'h2)])));
              reg87 <= wire25;
              reg88 <= reg76[(1'h1):(1'h1)];
            end
          else
            begin
              reg86 <= $unsigned(((-$signed({(8'ha9),
                  reg13})) < wire25[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          if (((~|$unsigned((reg81 ? $signed((8'ha6)) : reg84))) ?
              (~|$unsigned({(~|reg17),
                  (reg16 + reg77)})) : ({$unsigned((8'hb7))} ?
                  $signed($unsigned($unsigned(wire25))) : (8'ha5))))
            begin
              reg82 <= (((reg79 * ($signed(reg87) >> reg21[(1'h1):(1'h1)])) - (reg13[(2'h3):(1'h0)] ?
                      (wire24[(2'h2):(2'h2)] >= (-reg79)) : $unsigned($unsigned(wire8)))) ?
                  (&$unsigned($signed(reg75))) : reg20);
              reg83 <= (-({$signed($unsigned((8'ha7))), wire6} < (((reg82 ?
                          reg17 : (8'hab)) ?
                      (8'hb9) : (reg79 ? (8'ha9) : reg17)) ?
                  $signed((reg18 && reg84)) : ($unsigned(reg15) ?
                      $signed(reg19) : (reg21 > wire11)))));
              reg84 <= (((~&reg15[(4'hc):(4'h8)]) << {{{reg19}}}) <<< {reg84});
              reg85 <= (-((reg16[(3'h7):(2'h3)] ?
                  ((reg88 < wire7) > $unsigned(reg22)) : (reg16 ?
                      (^reg79) : (^~wire8))) ^~ (^reg77[(4'h8):(3'h6)])));
            end
          else
            begin
              reg82 <= (($signed($signed((wire25 ~^ reg20))) + ($signed($unsigned(wire8)) ?
                      $signed((reg77 < (8'hb2))) : reg15)) ?
                  wire25 : $unsigned((8'hb3)));
              reg83 <= (~&(reg15 && $signed((8'hba))));
              reg84 <= reg18[(5'h12):(4'h9)];
              reg85 <= wire12;
              reg86 <= $signed((reg88 ?
                  $unsigned(reg13[(1'h0):(1'h0)]) : ({(reg75 != reg77),
                          (wire7 - wire6)} ?
                      (^$unsigned(wire12)) : reg20[(4'hf):(4'hc)])));
            end
          reg87 <= ($unsigned(reg19) <= (((!$unsigned(reg85)) - reg17[(1'h0):(1'h0)]) ?
              reg79[(4'hb):(3'h7)] : $unsigned($signed($signed(reg82)))));
        end
      reg89 <= reg83[(4'hc):(2'h2)];
      if (((reg16 <<< $unsigned(reg13)) | ((^~reg19) ?
          wire10[(1'h1):(1'h0)] : reg86)))
        begin
          reg90 <= reg85;
          reg91 <= ((($unsigned((reg80 ? reg84 : wire10)) ?
                  wire73[(1'h1):(1'h1)] : $signed((wire11 ? reg83 : reg90))) ?
              ({(reg78 ? wire11 : reg75), (reg20 & reg84)} ?
                  wire73 : (^~(reg77 | wire25))) : $unsigned($unsigned($signed((8'hbf))))) - reg89[(1'h0):(1'h0)]);
          reg92 <= ($signed({{(reg75 + (8'ha9))}}) ?
              $signed((((reg13 ? wire7 : (8'ha2)) || $unsigned(reg82)) ?
                  (~|(reg15 ? reg79 : reg82)) : ((!reg16) ?
                      (-wire12) : wire7[(4'hb):(1'h0)]))) : $unsigned($signed(wire9)));
        end
      else
        begin
          reg90 <= (reg77 * $unsigned((reg84 >>> $unsigned($signed(wire8)))));
          reg91 <= reg92[(4'hc):(3'h7)];
        end
    end
  assign wire93 = $unsigned((~^(-reg15[(4'ha):(2'h3)])));
  assign wire94 = reg15[(2'h3):(1'h1)];
  assign wire95 = reg87[(3'h7):(3'h6)];
  module96 #() modinst114 (.wire97(reg15), .clk(clk), .wire101(reg79), .wire98(reg87), .wire100(wire9), .wire99(reg16), .y(wire113));
endmodule

module module96
#(parameter param111 = (^((^~(~&((8'hb6) ? (7'h44) : (8'had)))) ~^ {(((7'h41) ? (7'h42) : (8'haf)) ~^ (-(8'hb2))), (&(^(7'h41)))})), 
parameter param112 = (param111 - (~&param111)))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire101;
  input wire signed [(2'h3):(1'h0)] wire100;
  input wire [(4'hf):(1'h0)] wire99;
  input wire signed [(5'h11):(1'h0)] wire98;
  input wire [(3'h7):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg102 <= ($signed(wire98[(4'h9):(1'h1)]) && (8'hbc));
    end
  always
    @(posedge clk) begin
      reg103 <= $signed({(((wire99 ? wire101 : (7'h40)) ?
              reg102[(2'h2):(1'h0)] : (reg102 ?
                  reg102 : wire100)) << $signed(wire97[(3'h5):(2'h3)]))});
      reg104 <= (~|((wire100[(1'h1):(1'h1)] ^~ ((wire98 ?
          wire98 : reg102) * $signed(wire99))) << $signed($signed($signed(wire100)))));
    end
  assign wire105 = reg104;
  assign wire106 = ($signed($unsigned($signed((wire101 == (8'ha6))))) ?
                       $unsigned($signed({(&(8'ha5)), reg103})) : wire105);
  assign wire107 = wire106[(4'hd):(4'h9)];
  assign wire108 = (^~(-{((wire106 >> wire98) ? $signed(wire100) : {wire97}),
                       reg104}));
  assign wire109 = {wire107[(2'h2):(1'h0)],
                       (wire105[(4'h8):(3'h7)] ? $signed(wire105) : (8'ha2))};
  assign wire110 = (~&(((!(wire98 >>> reg102)) == (wire106 ?
                           wire100[(2'h2):(2'h2)] : wire105)) ?
                       $unsigned($signed((^~wire107))) : ((8'hbe) ^ {(^wire97)})));
endmodule

module module26
#(parameter param71 = (|((8'ha3) ? (8'hb4) : ({(&(8'hb0)), (|(8'hba))} ^ {((8'hae) <<< (8'hb0))}))), 
parameter param72 = (param71 == (((^~(param71 > (8'hac))) ? ((param71 + param71) ? param71 : ((8'hb4) ? param71 : param71)) : ((~param71) ? param71 : param71)) >>> param71)))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg68,
                 reg67,
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
                 (1'h0)};
  assign wire32 = wire30[(2'h2):(1'h1)];
  assign wire33 = ((wire29[(1'h0):(1'h0)] ?
                      ((((8'ha2) ? wire31 : wire32) ?
                          wire30 : wire28) - $signed($signed(wire28))) : wire30) >>> {wire28,
                      $signed({(wire30 ? wire27 : wire32), {wire30, wire27}})});
  assign wire34 = (wire27[(4'ha):(3'h6)] ?
                      wire27 : {wire28, $unsigned((~(|wire30)))});
  assign wire35 = $signed(wire32[(3'h6):(2'h3)]);
  assign wire36 = $unsigned(wire34);
  always
    @(posedge clk) begin
      reg37 <= (8'h9c);
      if (((~(($unsigned(wire31) ?
              wire29[(3'h5):(1'h1)] : $unsigned(wire34)) & (-(wire35 ?
              wire29 : (8'hae))))) ?
          wire31[(2'h2):(1'h1)] : wire35[(3'h5):(3'h4)]))
        begin
          reg38 <= wire32[(4'h9):(3'h5)];
          reg39 <= wire35;
          reg40 <= (~|wire27[(4'he):(4'hb)]);
        end
      else
        begin
          reg38 <= wire35[(5'h10):(4'hc)];
        end
      if ($signed(((wire31[(4'hb):(1'h1)] ^~ $signed({wire33,
          wire32})) * $unsigned(($unsigned(wire27) ?
          reg40[(4'he):(3'h6)] : (~^reg37))))))
        begin
          reg41 <= wire35[(1'h1):(1'h1)];
          reg42 <= (~|$signed($unsigned((-(wire35 ? reg41 : wire36)))));
        end
      else
        begin
          if (($signed(({(wire34 <<< reg40), wire28} ?
                  reg42 : (wire30 | $unsigned((8'hab))))) ?
              (({wire32} ?
                  (+reg37) : wire27) > ($unsigned((-wire34)) << $signed(wire35[(4'hb):(3'h4)]))) : wire28[(2'h2):(1'h0)]))
            begin
              reg41 <= $unsigned(reg41[(4'ha):(4'h8)]);
              reg42 <= ((~(~|$unsigned((reg39 ? (8'hb5) : wire33)))) ?
                  wire36 : reg40);
              reg43 <= (8'hb1);
            end
          else
            begin
              reg41 <= (wire36[(1'h1):(1'h0)] | {(|(~|wire31[(4'hb):(2'h3)])),
                  {$signed(wire28)}});
              reg42 <= (+$unsigned($unsigned(reg43)));
              reg43 <= $signed(wire35);
            end
          if ((({$signed((wire35 ? reg43 : wire32))} ?
              (7'h42) : {$unsigned((wire28 ? reg38 : wire29)),
                  (^~$signed(wire31))}) >= $signed((reg39[(4'hb):(3'h5)] ?
              ($unsigned((8'hbd)) >= wire32[(1'h0):(1'h0)]) : {(wire31 <= wire28),
                  (reg41 ? reg37 : wire33)}))))
            begin
              reg44 <= $unsigned((~$signed({((7'h44) ? wire29 : wire28)})));
              reg45 <= (-($unsigned(($signed(wire31) ?
                      (~|wire27) : {wire30, wire28})) ?
                  $unsigned($signed(reg39)) : $unsigned((!(^reg42)))));
              reg46 <= {(reg38 && $unsigned($unsigned(wire27)))};
            end
          else
            begin
              reg44 <= ($unsigned($signed(({(8'hbe)} << (+(8'hb2))))) ?
                  $signed($unsigned((~&((8'hbb) ?
                      reg46 : (8'had))))) : ((!$signed($unsigned(wire32))) ?
                      reg37[(3'h4):(1'h1)] : ($unsigned($unsigned((8'ha5))) - (~&(~|(8'hb8))))));
              reg45 <= ({wire28[(3'h6):(2'h2)],
                      (~^{(wire36 < reg37), (reg45 ? reg43 : reg38)})} ?
                  $unsigned({(8'hab),
                      $signed($unsigned(wire32))}) : $signed((^$signed((^~wire31)))));
            end
        end
      reg47 <= $signed($unsigned((~^reg41)));
    end
  always
    @(posedge clk) begin
      reg48 <= reg41;
      if ((&($unsigned(reg44) & reg39[(4'ha):(3'h6)])))
        begin
          reg49 <= (^(~|$unsigned($signed({reg41}))));
          if ((wire34[(4'hd):(3'h6)] ^~ (|$signed((-((8'hbd) ?
              wire35 : reg42))))))
            begin
              reg50 <= ((!wire31) < {(-({reg43} < (-reg37))),
                  (^wire33[(2'h2):(2'h2)])});
            end
          else
            begin
              reg50 <= $unsigned(reg41);
              reg51 <= $signed($unsigned(reg45));
              reg52 <= ({($signed((!(8'ha3))) ?
                          $unsigned((reg47 ?
                              wire31 : reg40)) : $unsigned((reg47 != reg37)))} ?
                  $signed(wire34[(2'h3):(2'h3)]) : wire35[(5'h10):(3'h7)]);
              reg53 <= (({reg51} ^ wire32) > reg43[(4'h9):(1'h1)]);
              reg54 <= reg47;
            end
          reg55 <= (+wire36);
          reg56 <= wire36[(3'h6):(1'h0)];
          reg57 <= $unsigned(wire30[(1'h0):(1'h0)]);
        end
      else
        begin
          reg49 <= ((8'hb0) > reg52[(3'h7):(2'h2)]);
          reg50 <= $unsigned($signed((|(reg55 ? {reg55} : (~^wire27)))));
          if ($signed((~(((&reg48) || (reg39 ? reg40 : reg51)) ?
              ($unsigned(wire35) ?
                  {(8'hb4), (8'ha2)} : (~|reg53)) : $signed((reg54 ?
                  reg57 : reg53))))))
            begin
              reg51 <= $unsigned((wire29[(2'h2):(1'h0)] ?
                  (~|($unsigned(wire30) << $unsigned(wire32))) : (^~reg49)));
              reg52 <= reg40;
              reg53 <= (reg42[(4'he):(4'hc)] >> {{$unsigned({reg47})}});
            end
          else
            begin
              reg51 <= $unsigned(((~&({reg56, (8'hb0)} | ((8'ha6) ?
                      reg44 : (8'hb6)))) ?
                  $signed(wire35[(1'h1):(1'h1)]) : reg37));
              reg52 <= (+{reg37[(2'h2):(2'h2)]});
              reg53 <= (|(wire35[(3'h5):(3'h5)] & wire35[(4'hd):(1'h1)]));
              reg54 <= (8'ha3);
            end
          reg55 <= reg46;
        end
      if (reg48)
        begin
          reg58 <= (8'ha1);
          reg59 <= {(+wire34[(3'h6):(2'h3)]),
              $unsigned(((~^wire30) != $signed($unsigned((8'haf)))))};
          if ((reg51 ?
              $signed($unsigned($unsigned((reg38 ?
                  reg41 : wire27)))) : {wire29}))
            begin
              reg60 <= wire29[(3'h4):(1'h0)];
              reg61 <= reg37[(1'h1):(1'h0)];
              reg62 <= ((((7'h44) ?
                      reg47[(1'h1):(1'h1)] : wire29[(3'h5):(2'h3)]) ?
                  $signed((reg50 * $unsigned((8'hbf)))) : $signed($unsigned(((8'ha3) <= (8'hb8))))) << $unsigned($signed($unsigned(wire34))));
            end
          else
            begin
              reg60 <= reg41;
            end
          reg63 <= wire31[(1'h0):(1'h0)];
        end
      else
        begin
          reg58 <= $unsigned({wire30[(2'h2):(1'h1)]});
        end
    end
  always
    @(posedge clk) begin
      reg64 <= reg43[(4'ha):(4'h9)];
      reg65 <= wire33;
      reg66 <= {wire28,
          (($unsigned((^reg65)) ?
              $signed((wire33 ?
                  reg58 : wire28)) : $signed(reg42)) & wire35[(4'hb):(1'h1)])};
      reg67 <= $signed((reg42[(3'h5):(2'h2)] + (|reg50)));
      reg68 <= (~&(wire35[(4'hf):(4'he)] && reg41));
    end
  assign wire69 = $signed(reg62[(4'he):(4'he)]);
  assign wire70 = $unsigned((reg63 < ($signed((reg40 ? reg37 : wire28)) ?
                      $signed($signed(reg44)) : reg38)));
endmodule
