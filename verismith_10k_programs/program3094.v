module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire100;
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  assign y = {wire114,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire4,
                 wire5,
                 wire6,
                 wire100,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire4 = ($unsigned((+$unsigned($unsigned(wire2)))) ?
                     $unsigned((8'hb3)) : $unsigned(wire3[(4'hd):(4'ha)]));
  assign wire5 = wire3;
  assign wire6 = wire4[(1'h1):(1'h1)];
  module7 #() modinst101 (wire100, clk, wire5, wire6, wire2, wire3, wire0);
  assign wire102 = wire2[(4'h8):(2'h3)];
  assign wire103 = $signed(wire102[(2'h3):(1'h0)]);
  assign wire104 = (wire3[(3'h6):(1'h1)] >= {wire4[(4'h8):(4'h8)]});
  assign wire105 = $signed(((-(^(^~(7'h42)))) ?
                       wire5 : $unsigned((((8'ha6) ? wire6 : wire104) ?
                           $unsigned((8'hba)) : (wire4 ? wire4 : (8'h9c))))));
  assign wire106 = $signed(((+wire1) ?
                       (~wire1) : (wire5 ?
                           (+{wire105, wire0}) : (~^$signed((8'hac))))));
  always
    @(posedge clk) begin
      if (((wire106 ?
              {$unsigned(wire4[(3'h7):(3'h6)])} : ($signed($unsigned((8'hae))) ?
                  $signed(wire104[(3'h6):(3'h5)]) : $signed($unsigned(wire3)))) ?
          wire102[(2'h2):(1'h1)] : {{(wire3 ?
                      wire0[(5'h13):(4'he)] : {(8'h9c)}),
                  wire3},
              (($signed(wire1) > (!wire1)) + wire105[(3'h4):(1'h0)])}))
        begin
          reg107 <= $unsigned($signed(wire0));
          reg108 <= wire104;
          reg109 <= $unsigned($signed($unsigned(wire102[(2'h2):(2'h2)])));
          reg110 <= wire6[(4'hf):(1'h1)];
          if ($unsigned(wire6[(5'h10):(3'h4)]))
            begin
              reg111 <= $signed(wire103);
              reg112 <= $unsigned(((~&wire4[(3'h5):(1'h1)]) && wire1[(4'h9):(4'h8)]));
              reg113 <= $signed(reg112);
            end
          else
            begin
              reg111 <= wire100;
              reg112 <= (~|wire106[(4'h9):(2'h2)]);
              reg113 <= $signed($signed((~wire104[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg107 <= (wire104 ?
              reg111 : $unsigned($unsigned((wire106 >= {reg110, (8'haf)}))));
          reg108 <= (^~(~&reg113[(2'h3):(1'h0)]));
          reg109 <= (~^reg110[(3'h4):(1'h0)]);
          reg110 <= wire3;
        end
    end
  assign wire114 = $signed($unsigned(($signed({reg112, (7'h43)}) ^~ reg113)));
endmodule

module module7
#(parameter param98 = (((~|(|((8'hb5) ? (8'hae) : (8'hba)))) ? (-(((8'hbe) ? (8'had) : (8'hb5)) * (~(8'hac)))) : (&((~&(8'ha2)) > ((8'h9f) ~^ (8'hba))))) ? {{{((8'h9e) ? (7'h41) : (8'hbb)), ((8'hb6) != (8'hbc))}, (^(~&(8'hb6)))}, ({(~^(8'hb2))} >= (((8'hb8) << (8'hae)) | {(8'hb6), (7'h41)}))} : (((((8'hb0) || (8'hbc)) ? (|(8'hb6)) : {(8'ha6)}) ? {((7'h44) >= (8'hbb))} : (^(-(7'h44)))) == {(^~(~|(8'ha7)))})), 
parameter param99 = ({(param98 ? {param98, (param98 ? param98 : param98)} : ((param98 ? param98 : param98) ? param98 : param98)), (param98 ? (param98 ? (~&param98) : (param98 ? param98 : param98)) : (param98 + {param98, (8'ha9)}))} != (param98 ? (-(param98 ? (8'haf) : (~&param98))) : param98)))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire88;
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire60,
                 wire88,
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
                 reg38,
                 (1'h0)};
  assign wire13 = ($signed({{(wire10 ? wire12 : wire10), $signed(wire10)},
                      (wire10 ?
                          $signed(wire10) : $signed((8'hae)))}) >= $unsigned((wire12[(5'h13):(2'h3)] ?
                      ((wire11 ^ wire10) < (wire8 << wire8)) : (|(wire11 ^ wire9)))));
  assign wire14 = (wire11[(3'h6):(3'h4)] ?
                      $unsigned($signed(wire13)) : (+({(~&wire12),
                              $unsigned(wire8)} ?
                          $unsigned((8'ha0)) : (wire12[(4'h9):(4'h9)] < (wire12 ?
                              wire8 : wire10)))));
  assign wire15 = wire10;
  assign wire16 = $signed((wire15 ?
                      {$unsigned(wire8[(1'h0):(1'h0)]),
                          wire12[(4'h9):(2'h3)]} : (+(~wire13))));
  assign wire17 = ($unsigned(wire13) ?
                      $signed((wire9[(3'h6):(3'h6)] != ($unsigned(wire12) ?
                          {wire8, wire9} : wire14))) : $unsigned({wire8,
                          wire16[(2'h2):(1'h0)]}));
  always
    @(posedge clk) begin
      if ($signed((|(((wire10 ? wire13 : wire12) ?
          (|wire9) : {(7'h44), (8'ha4)}) | $signed((^~(7'h44)))))))
        begin
          reg18 <= ((!wire14) ? wire16 : wire16);
        end
      else
        begin
          reg18 <= wire11;
          reg19 <= (wire8[(2'h2):(1'h1)] >>> wire15[(3'h5):(3'h5)]);
          reg20 <= (^{$signed($signed((~&wire11))), wire15[(4'hb):(4'ha)]});
          reg21 <= wire8[(1'h0):(1'h0)];
          reg22 <= (&(!(^(^wire12))));
        end
      reg23 <= $signed((~(~($unsigned((8'hac)) > (wire9 + reg22)))));
      reg24 <= $signed((reg18[(1'h1):(1'h0)] ~^ (~&(wire17 ?
          (reg22 * reg20) : $signed((8'ha1))))));
      if ((reg18[(3'h6):(2'h3)] & reg20[(2'h2):(1'h0)]))
        begin
          if (reg20[(4'h8):(2'h3)])
            begin
              reg25 <= ((^~reg24[(2'h3):(2'h2)]) ?
                  wire16[(4'ha):(3'h6)] : (-$unsigned({wire10,
                      $signed(wire16)})));
              reg26 <= wire9[(3'h7):(3'h7)];
              reg27 <= $signed({$unsigned($signed($signed(wire9))),
                  {((&wire12) ?
                          $signed(wire11) : (wire17 ? (8'hbf) : (8'h9f)))}});
              reg28 <= (|(wire16[(5'h11):(3'h7)] ?
                  ({(wire10 && wire15)} ?
                      ($signed(reg22) ?
                          wire14 : ((8'hb4) | wire16)) : $unsigned((~&reg26))) : wire10[(4'hb):(4'h9)]));
              reg29 <= ((+(^~$signed((wire12 ? reg21 : reg18)))) ?
                  ((($signed(wire9) >> $signed((8'hac))) ?
                          $signed(reg27[(5'h11):(5'h10)]) : ({wire9, wire9} ?
                              (wire17 ? reg21 : wire16) : (reg27 ?
                                  wire17 : reg18))) ?
                      {({(8'hb9),
                              wire13} << (wire10 || (8'hb1)))} : $signed((-((8'h9f) ?
                          reg25 : reg28)))) : wire17[(5'h10):(4'h9)]);
            end
          else
            begin
              reg25 <= $signed({(-$unsigned((wire11 ? reg27 : (8'hb0))))});
              reg26 <= ((^(!((reg22 ? reg29 : (8'hbf)) ?
                  {wire16} : (reg28 == reg29)))) | $signed(wire13));
              reg27 <= (!reg20);
              reg28 <= $signed((wire15 ^~ $signed($signed($unsigned(reg25)))));
            end
          reg30 <= $unsigned((((8'ha7) ?
              wire8[(3'h5):(2'h2)] : reg27) < $unsigned(reg25)));
          if ((({((~|wire11) || $signed(wire9))} ?
                  (&wire14[(2'h2):(1'h0)]) : reg29[(4'hf):(3'h5)]) ?
              $signed($unsigned(($unsigned(reg25) ?
                  reg28 : (~^reg28)))) : (($signed($unsigned(reg26)) > $signed((reg26 != wire9))) ^~ (^~{(+reg27)}))))
            begin
              reg31 <= $unsigned(reg20[(5'h11):(5'h10)]);
              reg32 <= $signed($signed(($signed($unsigned(reg21)) + $signed((wire17 ?
                  reg26 : (8'ha0))))));
            end
          else
            begin
              reg31 <= reg26;
              reg32 <= (reg32[(3'h5):(3'h5)] > (-$unsigned(reg28[(4'he):(2'h2)])));
              reg33 <= $signed(reg25[(2'h2):(2'h2)]);
              reg34 <= $unsigned($signed(reg31[(4'hc):(4'ha)]));
              reg35 <= reg25[(1'h1):(1'h1)];
            end
          reg36 <= ((~&((8'ha8) ?
              (~|wire9[(3'h4):(2'h3)]) : (wire16[(2'h2):(2'h2)] && $signed(reg29)))) ~^ $unsigned($signed({$unsigned(wire15),
              (~^reg32)})));
          reg37 <= {wire12, wire15};
        end
      else
        begin
          reg25 <= ({$signed((|(^~wire16))),
              $unsigned(wire14[(3'h6):(2'h3)])} ^~ wire10[(4'he):(3'h7)]);
          reg26 <= $signed($signed($signed(reg26[(4'h8):(3'h7)])));
          reg27 <= (8'hbb);
          reg28 <= (($unsigned($signed($unsigned(reg18))) ?
                  (~^reg26) : (|(^(reg30 ? wire11 : reg26)))) ?
              $unsigned($unsigned(($unsigned(wire10) << $unsigned(reg31)))) : $signed($signed($signed((reg20 ?
                  (8'ha1) : reg36)))));
        end
      if (reg26)
        begin
          reg38 <= (($signed({(reg33 ? wire9 : wire14)}) ?
              (~&(8'hae)) : reg19[(2'h3):(2'h2)]) >> $signed((reg25 < {((8'hb0) ?
                  wire8 : (8'ha4)),
              reg22[(4'hf):(3'h5)]})));
        end
      else
        begin
          reg38 <= $unsigned((reg26 ?
              (reg32 ?
                  ($unsigned(reg31) < {wire11}) : ((reg31 && reg21) ?
                      reg19 : {reg18, reg33})) : (reg34 > (|reg23))));
        end
    end
  assign wire39 = {((reg35 || ((^wire17) * (reg31 ? reg35 : (7'h41)))) ?
                          reg22 : (wire13 ?
                              $signed($unsigned(reg24)) : {reg28[(3'h6):(1'h0)]}))};
  assign wire40 = $signed(({((wire9 ? wire39 : reg20) ?
                          {reg28} : (reg28 ?
                              reg28 : reg37))} << $signed($signed((wire9 ?
                      reg19 : reg21)))));
  assign wire41 = ((wire13 ?
                          (reg26[(3'h5):(2'h2)] ?
                              (~^(reg33 != wire17)) : $signed($signed(reg37))) : $signed({(~&reg27),
                              wire15[(2'h3):(1'h0)]})) ?
                      reg30[(1'h0):(1'h0)] : {reg26[(3'h5):(1'h0)]});
  assign wire42 = (reg34 || $unsigned((!$signed($unsigned(reg27)))));
  module43 #() modinst61 (wire60, clk, wire16, reg32, wire13, reg38);
  module62 #() modinst89 (wire88, clk, wire13, reg18, reg23, reg38);
  assign wire90 = (7'h41);
  assign wire91 = reg30;
  assign wire92 = wire39;
  assign wire93 = $signed(reg19);
  assign wire94 = (((|$signed($signed(wire14))) <= (((wire39 ? reg19 : wire91) ?
                      (|(8'hbb)) : $unsigned(wire40)) <<< ((-(8'ha2)) ?
                      {wire39} : (wire10 ?
                          (8'hba) : reg23)))) >> wire16[(4'hb):(2'h3)]);
  assign wire95 = reg38;
  assign wire96 = (reg21[(3'h6):(1'h1)] ?
                      (($unsigned({wire9,
                          (8'hbc)}) & wire14[(1'h0):(1'h0)]) | ($unsigned({reg28}) <<< ($signed((8'h9e)) ?
                          $unsigned(reg24) : wire42[(5'h10):(1'h1)]))) : ((~|$unsigned((wire15 <<< wire91))) ?
                          (&(8'hb3)) : ((reg19[(4'h8):(4'h8)] ?
                              (8'ha0) : wire41[(1'h1):(1'h1)]) < $unsigned((^reg36)))));
  assign wire97 = $unsigned(wire90);
endmodule

module module62
#(parameter param86 = (~&(^{(((8'hb2) ? (8'ha2) : (8'hb6)) << ((8'hbf) ? (8'hbc) : (7'h42))), (^~((8'ha3) < (8'haf)))})), 
parameter param87 = ((param86 && (8'h9f)) - param86))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire66;
  input wire [(5'h13):(1'h0)] wire65;
  input wire [(4'hd):(1'h0)] wire64;
  input wire [(2'h2):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire67 = wire66;
  assign wire68 = (wire65 ?
                      ($signed(((8'hac) ?
                              (wire66 ? wire67 : (8'hae)) : $signed(wire65))) ?
                          wire66 : wire63) : (8'hab));
  assign wire69 = (~|wire63[(1'h1):(1'h1)]);
  assign wire70 = ({(wire65 ~^ $signed(((8'ha8) || wire69))),
                      wire65[(4'hf):(3'h7)]} != $signed(wire63));
  assign wire71 = wire63;
  assign wire72 = ((^~{$signed({wire66, (8'ha9)}),
                      {(~^wire64)}}) < (wire70[(2'h2):(1'h0)] == (wire71[(4'hf):(3'h5)] == (-{wire69,
                      (8'hb5)}))));
  assign wire73 = (($unsigned(wire64[(4'hb):(2'h2)]) ^~ ((wire72[(1'h1):(1'h0)] ?
                          $unsigned(wire69) : $signed(wire71)) ^~ {$signed(wire71)})) ?
                      $unsigned({$unsigned(((8'ha1) ? (7'h41) : wire69)),
                          (8'hb5)}) : (wire72 ?
                          $signed(wire70) : wire63[(2'h2):(1'h0)]));
  assign wire74 = ({((wire63 ?
                          $signed(wire66) : $unsigned(wire63)) ~^ (|wire68[(3'h7):(2'h3)]))} >> (&$unsigned(((~|wire70) ?
                      (~^(8'h9c)) : (wire71 ^ wire70)))));
  assign wire75 = (~^((((8'hbd) ?
                          $signed(wire70) : $signed(wire63)) ^~ {wire65[(2'h3):(1'h1)]}) ?
                      wire71[(4'hc):(2'h2)] : (~&(7'h43))));
  assign wire76 = wire63[(1'h0):(1'h0)];
  assign wire77 = wire69[(2'h3):(2'h2)];
  assign wire78 = wire66[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg79 <= wire73;
      reg80 <= wire65[(3'h4):(1'h0)];
      reg81 <= {$signed(wire67)};
      reg82 <= $signed(wire66[(2'h3):(1'h0)]);
    end
  assign wire83 = $unsigned($signed({$unsigned($signed((8'hb8)))}));
  assign wire84 = ({(~&($signed(wire76) ?
                          (wire78 < wire68) : (wire67 <<< wire71))),
                      reg82[(3'h4):(1'h0)]} ^~ $unsigned(reg81));
  assign wire85 = $unsigned({$signed({$unsigned(wire69),
                          wire66[(1'h1):(1'h1)]}),
                      wire78[(2'h2):(1'h0)]});
endmodule

module module43
#(parameter param58 = (~&((7'h40) ? {{((8'had) * (8'h9c)), ((7'h44) ? (8'hb3) : (8'h9f))}, (~|(-(8'hb8)))} : {(^~(&(8'haf)))})), 
parameter param59 = ((((~|(param58 ? (8'h9f) : param58)) ? (param58 ^~ param58) : {(param58 & param58)}) ^~ ({param58, {param58, param58}} <<< ({(8'ha4), param58} ? param58 : (param58 ? param58 : param58)))) ? ((param58 >= {param58}) == ((~^{param58, param58}) ? param58 : param58)) : ((^param58) ? ({(!param58)} ? ((~&(8'ha1)) ~^ (param58 ~^ param58)) : (+(param58 ? param58 : param58))) : param58)))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire47;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire [(5'h12):(1'h0)] wire45;
  input wire signed [(5'h15):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire48 = $signed({wire45[(5'h10):(4'hb)],
                      ((-$signed(wire46)) ? wire46 : ({wire46} + (~^wire45)))});
  assign wire49 = wire47;
  assign wire50 = wire46;
  always
    @(posedge clk) begin
      reg51 <= ((wire44[(4'hf):(1'h1)] <= {(&wire50)}) || (^$signed($signed((wire46 - wire49)))));
      reg52 <= {reg51[(3'h5):(1'h0)]};
    end
  assign wire53 = wire49[(4'ha):(2'h2)];
  assign wire54 = (!($signed((reg51 ?
                      (wire49 ?
                          wire49 : wire45) : (reg51 | reg51))) || wire44));
  assign wire55 = (~&(~$unsigned(wire53[(3'h6):(3'h4)])));
  assign wire56 = (wire49 ?
                      (8'ha5) : ((8'hb4) ^~ (((wire45 ? wire53 : reg51) ?
                          ((8'h9f) ?
                              (8'ha1) : wire45) : reg52) ~^ wire49[(4'hc):(3'h5)])));
  assign wire57 = ({$signed((~^wire45)),
                      ((-(wire55 ? wire53 : wire48)) ?
                          wire46[(3'h5):(3'h4)] : $signed((^wire54)))} | wire46);
endmodule
