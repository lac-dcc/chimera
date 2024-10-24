module top
#(parameter param94 = (~&((~(((7'h42) ? (8'ha5) : (8'hab)) ? {(8'ha1)} : ((8'h9d) ? (8'had) : (8'h9c)))) ~^ ({{(8'hb6), (8'ha3)}, (+(8'ha5))} ^~ (8'h9d)))), 
parameter param95 = (8'ha1))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire79;
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire4,
                 wire79,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(((^wire2) != $unsigned(wire3)));
  always
    @(posedge clk) begin
      reg5 <= $unsigned((((+(wire4 ?
          wire0 : wire0)) * $signed((+wire3))) >>> (wire3[(3'h4):(2'h3)] > {(wire4 + wire3)})));
      if ($signed((($signed((wire2 ? wire2 : reg5)) + ($unsigned(wire1) ?
          wire3[(4'h9):(1'h0)] : $unsigned(wire2))) >= wire0)))
        begin
          reg6 <= ({$unsigned($unsigned(wire4))} == {((^~(wire0 <<< wire4)) ?
                  wire2 : ($signed(wire3) ? {wire2} : wire4))});
          if (wire2)
            begin
              reg7 <= ({((~|(wire1 ? reg5 : wire2)) ^~ ((wire3 ?
                          (7'h40) : wire3) ?
                      (reg5 ? wire1 : wire1) : {(8'ha9), wire4})),
                  $signed(wire4[(2'h3):(1'h0)])} << (reg5[(3'h6):(3'h5)] ?
                  ({wire4, (!wire0)} ?
                      $signed($unsigned(wire0)) : ((&wire1) ?
                          (reg6 == wire3) : wire2[(5'h12):(2'h2)])) : $unsigned(wire0[(4'hc):(1'h1)])));
              reg8 <= $signed(reg7);
              reg9 <= {((8'hbf) ?
                      (reg7 && reg6[(1'h1):(1'h1)]) : (reg7[(4'he):(4'hb)] != (|wire0))),
                  $unsigned(wire4[(2'h2):(2'h2)])};
              reg10 <= (~(wire0[(4'hc):(1'h0)] ?
                  reg6[(2'h2):(2'h2)] : $unsigned($signed($unsigned(wire1)))));
              reg11 <= reg7[(1'h1):(1'h0)];
            end
          else
            begin
              reg7 <= ((~$signed({(reg10 ?
                      wire3 : reg8)})) >> ($unsigned(reg8[(2'h3):(1'h0)]) ?
                  ((8'hbc) != reg10) : wire3[(1'h1):(1'h0)]));
              reg8 <= (~^wire0);
            end
          reg12 <= (8'hb8);
        end
      else
        begin
          reg6 <= reg12;
          reg7 <= {$unsigned(($unsigned(reg12[(5'h13):(2'h3)]) ?
                  $signed($signed(wire0)) : ($unsigned(wire1) ?
                      $signed(wire4) : (reg5 ~^ reg5))))};
          reg8 <= (&(((wire4[(3'h7):(3'h5)] <= $signed(wire3)) ?
              wire0 : $unsigned($unsigned(wire2))) < $unsigned(reg8)));
          if ((~|reg6))
            begin
              reg9 <= wire0[(1'h0):(1'h0)];
              reg10 <= (8'hb4);
              reg11 <= (~|$unsigned(wire0));
              reg12 <= reg11;
            end
          else
            begin
              reg9 <= reg5[(2'h3):(1'h1)];
              reg10 <= {{$unsigned((^reg8[(4'ha):(2'h2)]))}};
              reg11 <= (wire0[(4'hd):(1'h0)] << (+{reg6}));
              reg12 <= (~|$unsigned(($unsigned(reg7) ?
                  (wire2[(5'h10):(4'hb)] ?
                      $unsigned(reg12) : ((8'hab) ?
                          wire4 : reg11)) : (wire3 ^ (&reg5)))));
              reg13 <= (8'hb2);
            end
        end
    end
  module14 #() modinst80 (wire79, clk, reg9, wire4, reg11, reg5, reg10);
  always
    @(posedge clk) begin
      reg81 <= (8'hac);
      reg82 <= (reg10[(4'he):(4'h9)] ?
          (((((7'h42) ?
              (8'hb6) : reg6) & $unsigned(wire3)) + $unsigned($unsigned(reg13))) & $unsigned(wire0)) : (wire0[(2'h3):(2'h2)] || $unsigned({wire79[(4'h8):(1'h0)]})));
      if (reg12[(4'hd):(3'h6)])
        begin
          reg83 <= (^$signed($signed(reg10[(5'h10):(4'h8)])));
          reg84 <= (~&{(!(7'h41))});
          if (((reg12[(1'h1):(1'h0)] ?
              (reg6 ?
                  ((&reg12) ^ (&reg6)) : wire4[(4'hf):(3'h5)]) : $unsigned((~^reg6))) - (wire3[(2'h3):(2'h3)] ?
              ((((8'ha9) ?
                  reg7 : reg5) || $unsigned(reg81)) >>> $unsigned((~reg11))) : reg9[(1'h1):(1'h0)])))
            begin
              reg85 <= (~^(reg6[(2'h3):(1'h1)] * $unsigned(reg11)));
              reg86 <= reg12[(5'h12):(4'hb)];
              reg87 <= (-($unsigned(((reg12 ? (7'h41) : reg81) ?
                      (reg84 ? reg81 : reg5) : $signed(reg9))) ?
                  (8'hab) : $unsigned(reg86)));
              reg88 <= ((~(reg82[(1'h1):(1'h1)] ?
                  (reg82 ?
                      reg10 : reg7[(2'h3):(1'h0)]) : ($signed(reg86) * $unsigned(reg81)))) ~^ $signed($unsigned(((reg81 << reg82) ?
                  reg5[(1'h0):(1'h0)] : (reg9 && reg82)))));
            end
          else
            begin
              reg85 <= $unsigned($signed($unsigned($signed((~reg10)))));
              reg86 <= reg9[(3'h5):(2'h3)];
              reg87 <= {(reg13 <= $signed(((reg85 + reg88) ?
                      $unsigned(reg9) : reg83[(3'h4):(2'h2)])))};
              reg88 <= $signed($unsigned(reg11));
              reg89 <= reg81;
            end
        end
      else
        begin
          if ($signed($unsigned($signed(($signed(wire1) ?
              (&reg12) : reg86[(1'h1):(1'h0)])))))
            begin
              reg83 <= (~^(8'hba));
              reg84 <= reg6;
              reg85 <= reg10;
            end
          else
            begin
              reg83 <= ($unsigned((!$signed((&wire2)))) ^~ reg82[(3'h4):(2'h3)]);
            end
          reg86 <= $signed(reg12[(1'h0):(1'h0)]);
        end
    end
  assign wire90 = ({(~^reg87[(3'h4):(2'h3)])} * $unsigned((reg88[(4'ha):(2'h3)] == ($unsigned(wire1) ?
                      (reg6 ? reg81 : reg12) : {reg8, (8'hb4)}))));
  assign wire91 = reg86;
  assign wire92 = wire90[(3'h5):(1'h0)];
  assign wire93 = $signed((wire2[(4'h9):(3'h6)] ?
                      {(8'hb6)} : {$signed($unsigned(wire0)),
                          wire2[(5'h13):(4'hc)]}));
endmodule

module module14
#(parameter param78 = (({(((7'h43) ? (8'hb3) : (8'ha6)) ? ((7'h40) ? (8'ha8) : (8'h9e)) : (&(7'h41))), ((-(8'hb0)) == ((7'h43) & (8'hae)))} && {{(+(8'ha9)), (8'ha0)}}) ? ((~^(+((8'hb9) > (8'ha3)))) ? {((+(7'h41)) ? (+(8'hbb)) : ((8'hb3) ^~ (8'haa))), ({(8'ha2)} >>> ((8'hb3) ? (8'hb2) : (8'haf)))} : (^(((7'h43) + (8'had)) ? (&(8'hbc)) : ((8'ha4) << (8'hb1))))) : {(~({(8'hb5), (8'hbe)} ? ((8'had) ? (7'h42) : (8'hba)) : (-(8'hbd))))}))
(y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire53;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire77,
                 wire75,
                 wire38,
                 wire39,
                 wire40,
                 wire53,
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
  always
    @(posedge clk) begin
      if (($unsigned(wire19[(1'h1):(1'h0)]) >>> $signed(wire16[(3'h4):(2'h3)])))
        begin
          reg20 <= wire18;
        end
      else
        begin
          reg20 <= (+($signed(wire17) ?
              $signed(wire18[(2'h3):(1'h1)]) : (~&{$unsigned((8'h9c))})));
          reg21 <= wire15;
          reg22 <= $signed(({reg21, wire16[(2'h2):(2'h2)]} ?
              (wire19[(5'h14):(5'h12)] ?
                  wire16[(1'h0):(1'h0)] : (+wire17)) : {{(wire16 ?
                          wire18 : wire18)}}));
          reg23 <= reg20[(4'hc):(3'h6)];
          if ({wire19[(3'h6):(2'h2)], $unsigned(reg23[(4'h9):(2'h2)])})
            begin
              reg24 <= $signed(reg23[(2'h3):(1'h1)]);
              reg25 <= (({reg22} > (~^wire15)) ?
                  wire15 : ($unsigned((reg20 <= (-wire18))) + ($signed($signed((8'ha8))) ?
                      ((wire19 >>> wire19) > wire18) : {$unsigned(reg20)})));
            end
          else
            begin
              reg24 <= $signed(reg23[(4'h9):(3'h4)]);
              reg25 <= $signed($signed(reg25[(4'h8):(3'h5)]));
            end
        end
      reg26 <= wire18[(2'h3):(2'h2)];
      if (($signed(wire19[(4'hd):(1'h0)]) << {wire15, reg20[(5'h13):(5'h10)]}))
        begin
          if ((!$unsigned(($signed((-reg24)) & reg25[(1'h0):(1'h0)]))))
            begin
              reg27 <= ($unsigned(reg21) && reg25[(4'h8):(3'h6)]);
              reg28 <= (~^(((|(wire17 == reg21)) >>> wire16) ?
                  (wire19 ?
                      $unsigned((!(8'hbb))) : ((reg22 ~^ reg24) <= (wire19 <= wire18))) : (7'h42)));
              reg29 <= reg23[(5'h12):(1'h1)];
              reg30 <= $unsigned(reg27[(5'h12):(3'h6)]);
              reg31 <= reg27[(5'h13):(5'h11)];
            end
          else
            begin
              reg27 <= $signed(reg25);
              reg28 <= $signed({(reg27[(1'h1):(1'h1)] ?
                      $signed(wire18) : reg25[(4'ha):(3'h4)])});
              reg29 <= reg31;
              reg30 <= reg22;
            end
          if ((^{reg21[(3'h4):(2'h2)]}))
            begin
              reg32 <= ($signed($unsigned((~|$signed(wire19)))) ?
                  $unsigned({(!reg21[(3'h6):(2'h3)]),
                      $signed((!reg22))}) : ($unsigned((!(~|reg23))) ?
                      (8'hb1) : ($unsigned((8'hbb)) >= reg20[(5'h11):(4'h9)])));
              reg33 <= $unsigned(reg23[(5'h13):(5'h10)]);
              reg34 <= reg29;
              reg35 <= wire17[(3'h7):(3'h6)];
            end
          else
            begin
              reg32 <= $unsigned((8'ha4));
              reg33 <= ($signed({({reg23, wire15} == (8'ha2)), reg24}) ?
                  $unsigned($signed((!(&reg34)))) : $signed(($signed((reg35 * (8'had))) <<< (~{reg32}))));
              reg34 <= reg24;
              reg35 <= $unsigned(reg28);
            end
          reg36 <= wire19;
        end
      else
        begin
          reg27 <= $signed($signed({{$signed(reg25)}, $unsigned((~^reg26))}));
          if ((reg28 ?
              (((!wire16[(1'h0):(1'h0)]) ? (!$unsigned(reg23)) : reg31) ?
                  $signed((reg34 == reg29)) : (($signed(reg23) < reg23[(3'h7):(1'h1)]) ?
                      reg20[(1'h0):(1'h0)] : (+{reg21,
                          (7'h44)}))) : (!$unsigned((^~(8'hb2))))))
            begin
              reg28 <= (+$unsigned({reg27[(3'h6):(2'h2)]}));
            end
          else
            begin
              reg28 <= $unsigned(wire16[(2'h3):(2'h3)]);
              reg29 <= {{(($unsigned(reg32) == $unsigned(reg23)) ?
                          $unsigned($unsigned(wire17)) : (^$signed(reg27))),
                      (~&$unsigned(reg24))}};
            end
          reg30 <= {$unsigned((wire17[(4'h9):(3'h5)] <= ((^~wire15) & reg23))),
              ((reg30 >>> (reg24[(3'h6):(2'h2)] ?
                  $signed(reg27) : $signed(wire16))) <<< ((~reg34[(3'h5):(2'h3)]) <<< $signed((-wire19))))};
          if ((!reg28))
            begin
              reg31 <= (((reg34[(3'h4):(3'h4)] && (|(wire17 ^~ reg24))) ?
                  ((reg26 ? {reg29} : reg21[(1'h1):(1'h0)]) ?
                      $signed((+reg34)) : $unsigned($unsigned(reg35))) : (reg24[(4'hf):(4'h8)] * $signed((wire19 >>> reg27)))) | ($unsigned(reg36[(1'h1):(1'h1)]) * $unsigned({$signed(reg32),
                  reg26})));
              reg32 <= ({$signed((^~reg36[(2'h2):(1'h0)])),
                  ((~(reg23 ? reg31 : reg36)) ?
                      {(wire17 ^~ reg32)} : reg21[(4'ha):(4'h9)])} * (+wire19[(5'h14):(4'he)]));
            end
          else
            begin
              reg31 <= wire16[(2'h3):(1'h0)];
            end
        end
      reg37 <= $signed(reg33);
    end
  assign wire38 = $unsigned($signed({((reg25 - reg32) << (reg25 > reg31))}));
  assign wire39 = $unsigned($signed(wire15));
  assign wire40 = ($unsigned((reg28[(4'h9):(1'h1)] == {$signed(reg32),
                          reg29})) ?
                      (+((^~(wire38 ?
                          wire15 : (8'hba))) | ($signed((8'ha0)) >> $signed(reg23)))) : reg24);
  module41 #() modinst54 (.wire42(reg26), .wire44(reg33), .wire46(wire40), .wire43(wire16), .wire45(wire17), .y(wire53), .clk(clk));
  module55 #() modinst76 (.y(wire75), .clk(clk), .wire60(reg33), .wire56(reg25), .wire57(reg27), .wire58(reg26), .wire59(reg23));
  assign wire77 = ($signed($signed($unsigned($unsigned(wire39)))) ?
                      (~^reg29) : $unsigned((~{$signed(reg36),
                          (wire53 ? wire38 : (8'haf))})));
endmodule

module module55
#(parameter param74 = (!((^~(~^((8'hba) > (7'h40)))) ? ((((8'hb4) ~^ (8'haa)) >>> ((8'ha3) >> (8'ha9))) != ((8'hb4) <<< {(8'hb1)})) : ((((8'hb8) + (7'h42)) ? ((7'h42) ? (8'hb7) : (8'haa)) : ((8'h9e) | (8'ha7))) ^~ {(-(8'ha1))}))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire59;
  input wire [(4'he):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire [(5'h12):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire61 = (($unsigned(wire58) ?
                          $unsigned((|(7'h43))) : $unsigned((^$unsigned(wire57)))) ?
                      wire59[(3'h7):(2'h2)] : (^~($signed($signed(wire59)) ?
                          $signed((+wire58)) : $signed(wire60[(2'h2):(2'h2)]))));
  assign wire62 = $unsigned((wire58 & ($signed(wire58[(4'hb):(2'h2)]) ^ (wire58 >>> ((8'h9f) ?
                      (8'hbf) : wire60)))));
  assign wire63 = wire61;
  assign wire64 = (~|(&(&({wire57, (8'ha1)} ?
                      (wire60 ? wire56 : wire63) : (8'ha2)))));
  assign wire65 = wire56;
  assign wire66 = $unsigned($unsigned(wire62[(4'h9):(3'h6)]));
  assign wire67 = (!wire56);
  assign wire68 = wire58[(1'h0):(1'h0)];
  assign wire69 = wire63[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg70 <= (~|($signed((((8'hb6) ? wire67 : wire67) ?
          {wire57, wire59} : $signed(wire64))) ^ wire60[(4'h9):(4'h9)]));
      reg71 <= ($unsigned((!(|$unsigned((8'hb2))))) ?
          ($unsigned(wire63) ?
              {((wire69 << wire62) ?
                      $signed(wire64) : wire69)} : (&($signed(wire64) == $unsigned(wire65)))) : $signed(wire65));
      reg72 <= ((8'hb5) >= wire60[(3'h7):(1'h1)]);
      reg73 <= wire69[(5'h12):(4'hb)];
    end
endmodule

module module41  (y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  assign y = {wire52, wire51, wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = (^(({$signed(wire42)} + (8'hba)) > wire45));
  assign wire48 = $unsigned({(wire46[(4'hb):(4'ha)] ?
                          ({wire42,
                              wire44} >= (wire47 & wire43)) : $signed((!wire44)))});
  assign wire49 = wire42;
  assign wire50 = wire47;
  assign wire51 = (^wire49[(5'h10):(3'h7)]);
  assign wire52 = (-wire43);
endmodule
