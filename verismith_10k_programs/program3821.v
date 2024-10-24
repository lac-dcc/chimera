module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed(wire1[(5'h10):(5'h10)]);
  assign wire6 = $unsigned((((!wire1[(4'h8):(2'h3)]) >>> ($signed(wire5) & (wire0 || wire4))) >= wire4));
  assign wire7 = wire5;
  assign wire8 = ((wire0[(4'hf):(2'h3)] && $signed(wire3[(4'ha):(4'h8)])) ^~ $signed($unsigned(wire0[(3'h7):(3'h7)])));
  assign wire9 = wire4;
  assign wire10 = ((wire8 <<< ($signed($signed(wire6)) ?
                          $unsigned($signed(wire9)) : wire6)) ?
                      wire2[(3'h5):(2'h2)] : (($signed(wire8[(1'h0):(1'h0)]) ?
                              (|wire9[(1'h1):(1'h0)]) : (~|$unsigned(wire3))) ?
                          $unsigned(wire0[(3'h7):(3'h4)]) : $unsigned($unsigned(wire2))));
  assign wire11 = (wire8 ?
                      (!{(~^(wire10 ? wire9 : wire1)),
                          ((~^wire4) ?
                              wire9 : (wire9 & wire10))}) : $unsigned((^(+$unsigned(wire7)))));
  assign wire12 = $signed(wire3);
  assign wire13 = {{(wire10 ?
                              {wire12,
                                  {wire3}} : ($signed((8'haf)) && (8'hb2))),
                          $unsigned($unsigned($unsigned(wire3)))}};
  assign wire14 = wire4;
  module15 #() modinst71 (wire70, clk, wire5, wire10, wire8, wire13);
  assign wire72 = wire3[(4'hd):(4'h9)];
  assign wire73 = wire10;
  assign wire74 = (~&$signed(wire6[(1'h0):(1'h0)]));
  assign wire75 = $signed($unsigned($signed(((-wire72) << (!wire4)))));
endmodule

module module15
#(parameter param68 = ((&{{(+(8'ha1))}}) ? (&((((8'ha2) > (8'had)) >>> (~&(8'hbb))) ^~ ((8'hac) ? (8'hba) : ((8'hab) * (8'hac))))) : {({(~^(8'hba))} << (((7'h42) ? (8'hbf) : (8'h9d)) != ((7'h42) ? (8'ha4) : (8'hb2)))), {((~&(8'ha2)) ? ((7'h40) >= (8'hbb)) : ((8'h9c) ? (8'hb3) : (8'h9d)))}}), 
parameter param69 = {(^{(param68 >= (param68 ? param68 : param68))})})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire40;
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire64,
                 wire40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $signed(wire19);
    end
  always
    @(posedge clk) begin
      if ($unsigned(((~|(~&(wire16 > wire19))) ?
          $signed($unsigned((&wire18))) : $signed({wire18}))))
        begin
          reg21 <= ((-(({wire17} ? wire19 : (7'h43)) ^~ $signed((reg20 ?
                  wire18 : wire17)))) ?
              wire17[(2'h3):(2'h2)] : {(wire19[(3'h6):(2'h2)] <= (^~(wire19 - wire16)))});
          reg22 <= $unsigned(reg20);
          if ($signed(reg20[(5'h12):(4'hf)]))
            begin
              reg23 <= {$signed(wire16)};
            end
          else
            begin
              reg23 <= reg20[(1'h0):(1'h0)];
              reg24 <= $unsigned((!$unsigned(((reg21 == wire18) & $signed(reg21)))));
              reg25 <= reg23;
              reg26 <= (|{(reg20 - $unsigned($unsigned(reg20)))});
            end
          if (($signed((($signed((8'ha1)) == (wire19 < (8'hbb))) ?
                  reg25[(4'he):(4'h8)] : wire16[(2'h3):(1'h0)])) ?
              reg23[(1'h0):(1'h0)] : {($signed(wire19) < (8'hb7)),
                  {wire19[(2'h2):(2'h2)]}}))
            begin
              reg27 <= ($unsigned($unsigned($unsigned($signed(reg20)))) ?
                  $signed({reg25}) : ($signed(((~|reg21) | $signed((8'hb1)))) & wire17));
              reg28 <= ($unsigned(reg20[(2'h2):(2'h2)]) & reg24[(1'h1):(1'h1)]);
              reg29 <= reg28[(4'h9):(3'h6)];
            end
          else
            begin
              reg27 <= {{$unsigned({reg21, (wire19 << (8'hbf))})},
                  $unsigned(reg24)};
              reg28 <= (+reg27[(4'hc):(2'h2)]);
              reg29 <= wire17[(1'h1):(1'h0)];
            end
          reg30 <= (({wire16[(3'h6):(1'h0)]} ?
                  $signed({(wire16 == (8'hac)),
                      $unsigned(wire19)}) : reg21[(1'h1):(1'h0)]) ?
              ((reg29 - (reg28[(4'h8):(2'h2)] + $unsigned((8'hbf)))) <= $signed(($unsigned((7'h42)) ?
                  $signed(reg25) : $unsigned(reg20)))) : ((|reg29[(4'h9):(2'h3)]) && $unsigned(reg25)));
        end
      else
        begin
          reg21 <= $unsigned($signed($unsigned((!reg29))));
        end
      if (reg27)
        begin
          if ((^~wire16[(3'h6):(1'h0)]))
            begin
              reg31 <= reg26;
            end
          else
            begin
              reg31 <= {(-wire19[(4'ha):(3'h6)]),
                  ($unsigned(($unsigned(reg29) >>> wire18[(1'h1):(1'h0)])) ?
                      $unsigned(reg28[(4'hb):(2'h3)]) : ($unsigned($unsigned(reg24)) << ($signed(reg21) <= ((8'hab) ?
                          reg24 : wire17))))};
            end
          if ((((!(8'ha7)) ?
              $signed(($unsigned(reg25) ?
                  reg30 : $unsigned((8'ha9)))) : reg28) >= {$signed((^~(+reg24)))}))
            begin
              reg32 <= reg27[(2'h3):(1'h1)];
              reg33 <= reg24;
              reg34 <= {(^~$unsigned((reg28 ? reg28 : wire18[(1'h0):(1'h0)]))),
                  ($signed(wire16) ?
                      {(reg22 ?
                              (!reg28) : $unsigned(reg22))} : ($signed(wire18[(2'h3):(2'h3)]) ?
                          (8'hbf) : $signed(reg25[(3'h7):(3'h7)])))};
              reg35 <= ((reg25[(5'h12):(3'h5)] ?
                  $signed(((-reg20) <= reg20)) : ($signed(reg23[(2'h3):(1'h0)]) ^ ((reg29 ?
                          wire17 : reg34) ?
                      $unsigned(reg31) : (reg20 - wire16)))) ~^ (reg20[(4'hd):(1'h0)] ?
                  ($signed(wire17) - (-$unsigned(reg21))) : $signed((!reg21))));
              reg36 <= reg28[(4'h9):(2'h2)];
            end
          else
            begin
              reg32 <= ((8'hb0) >>> (&(wire17[(2'h2):(2'h2)] ?
                  (^~reg28[(3'h6):(1'h0)]) : (~&$signed((8'hb6))))));
              reg33 <= $signed($signed(($unsigned($unsigned(reg21)) >= $signed({reg35}))));
              reg34 <= $unsigned(((wire17[(1'h0):(1'h0)] > (wire17[(2'h3):(2'h3)] ?
                  (wire17 & reg20) : {reg35})) - ((reg32 ?
                      (reg22 ? wire17 : reg33) : (reg32 == reg28)) ?
                  reg26 : ((reg33 >>> reg26) - {reg34}))));
              reg35 <= $unsigned((reg27 ~^ (reg23 ?
                  {(reg27 ? reg30 : reg30),
                      (reg24 ? (8'hb9) : wire17)} : {$signed(reg21),
                      $unsigned(wire19)})));
            end
          reg37 <= ((~$unsigned(reg25[(4'hb):(4'hb)])) >= reg22[(2'h3):(1'h1)]);
        end
      else
        begin
          reg31 <= {reg30,
              (reg29[(4'ha):(3'h6)] ?
                  $signed(((reg23 ? (8'ha4) : reg35) ?
                      $unsigned((8'hbc)) : (reg30 ?
                          wire18 : reg30))) : (!{(wire17 & reg32)}))};
          if ($signed(reg29))
            begin
              reg32 <= $signed($signed($unsigned($unsigned((reg21 ?
                  reg23 : (8'ha1))))));
              reg33 <= (reg27[(3'h7):(3'h4)] ~^ $unsigned($unsigned(((-reg21) ?
                  $signed((8'hb0)) : {reg20, reg33}))));
              reg34 <= {(~|($unsigned(reg20[(5'h10):(4'hc)]) <<< ($unsigned(reg30) && $signed(reg22))))};
            end
          else
            begin
              reg32 <= {$signed((wire17 ?
                      ($unsigned(reg36) >>> (+(8'haf))) : $signed(wire16)))};
              reg33 <= (-$unsigned((reg28[(4'hf):(4'hc)] ?
                  ((reg24 >= reg27) ^ {reg27}) : (reg37[(2'h3):(1'h0)] || (|reg37)))));
              reg34 <= ($unsigned(($unsigned((wire16 ?
                      reg24 : wire17)) & reg28)) ?
                  $unsigned((reg32 ^ $unsigned(((8'haa) ?
                      reg27 : reg24)))) : $signed((~|$unsigned($signed(reg26)))));
              reg35 <= reg21;
            end
          reg36 <= $unsigned(reg34[(2'h3):(2'h3)]);
          reg37 <= reg20;
        end
      reg38 <= (-(7'h41));
      reg39 <= ($unsigned(reg20[(4'h9):(2'h2)]) ?
          reg26[(4'hd):(4'h8)] : $unsigned(reg38));
    end
  assign wire40 = (((!(+(^~wire16))) >= $unsigned((~(|reg34)))) ?
                      $unsigned(reg20[(3'h7):(3'h4)]) : (^($unsigned($unsigned(reg28)) ?
                          $unsigned({reg23, reg32}) : ((reg30 ?
                                  reg32 : (8'hbc)) ?
                              (reg30 ? reg33 : reg28) : (+(8'ha0))))));
  module41 #() modinst65 (wire64, clk, reg26, reg35, reg36, reg22);
  assign wire66 = $signed(((reg23[(1'h0):(1'h0)] ?
                      $signed(((8'had) ?
                          wire40 : wire16)) : $unsigned($unsigned(reg24))) <= (8'hbc)));
  assign wire67 = ((8'hbf) * (($unsigned(reg33) << $signed(reg31)) ?
                      ($unsigned($signed((8'hb4))) ?
                          $unsigned($signed(reg26)) : {(wire66 && reg27)}) : {$signed(reg28[(4'h8):(3'h6)]),
                          (~&(reg30 ? reg31 : reg34))}));
endmodule

module module41
#(parameter param63 = (^~(8'hac)))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  input wire [(5'h14):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg62,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire46 = ($signed((((~^wire45) && {wire42}) ?
                      (!$unsigned(wire45)) : ($signed(wire44) ?
                          wire44[(1'h0):(1'h0)] : wire44))) ^ ($signed(($signed(wire45) && (wire43 == wire45))) ?
                      wire42[(4'h8):(3'h7)] : (-wire45)));
  assign wire47 = $signed(wire46);
  assign wire48 = wire43;
  assign wire49 = wire44;
  assign wire50 = $unsigned(($unsigned(((~^wire44) ?
                      {wire42} : (^wire43))) || $unsigned($unsigned((wire47 ?
                      wire42 : wire48)))));
  assign wire51 = {({wire48[(4'ha):(3'h6)]} >> ({$signed((8'hb9))} ?
                          $signed((~&(8'hb4))) : wire42))};
  assign wire52 = {wire46};
  assign wire53 = (^~($signed(((wire46 ? wire48 : (8'hae)) ?
                      $signed((8'had)) : (-wire51))) >>> wire45[(4'ha):(3'h4)]));
  always
    @(posedge clk) begin
      reg54 <= (~|$signed(wire52));
      reg55 <= (wire46 ?
          {(&wire42[(2'h2):(1'h1)]),
              (($signed(wire46) + $unsigned(reg54)) ?
                  ((wire42 | reg54) ?
                      wire49[(2'h3):(1'h1)] : (wire53 ?
                          wire53 : wire53)) : ((wire53 ?
                      wire49 : wire45) << (|wire42)))} : wire51[(3'h5):(1'h0)]);
    end
  assign wire56 = $unsigned((wire47[(3'h6):(3'h4)] ?
                      ({{wire45}, (wire44 != reg55)} ?
                          reg54 : (wire51[(3'h7):(1'h0)] ^ (wire43 ?
                              (8'hb1) : wire51))) : $unsigned(wire52[(1'h1):(1'h0)])));
  assign wire57 = {$signed(({wire51, (wire44 ? wire56 : (7'h44))} ?
                          ((wire52 + wire53) * $signed((8'hb2))) : reg54))};
  assign wire58 = wire53;
  assign wire59 = $signed((wire51 >> (~wire57[(2'h2):(2'h2)])));
  assign wire60 = ($unsigned(wire51) ?
                      $unsigned(((+(wire57 < wire58)) >= $unsigned(wire48))) : $unsigned($signed($unsigned(wire50[(2'h2):(1'h0)]))));
  assign wire61 = reg54;
  always
    @(posedge clk) begin
      reg62 <= (wire59[(2'h3):(1'h0)] <= (|(|wire49)));
    end
endmodule
