module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg14,
                 reg13,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ($unsigned((!(|$unsigned(wire3)))) <= wire0);
  assign wire5 = ({($unsigned(wire0) - (~^$unsigned(wire3)))} ?
                     ($unsigned((~$signed(wire4))) ?
                         $signed($unsigned({(8'h9e),
                             (8'hb7)})) : $signed((^(wire2 <= wire1)))) : $unsigned($unsigned($unsigned($signed(wire2)))));
  always
    @(posedge clk) begin
      reg6 <= ($signed(wire3[(1'h0):(1'h0)]) ?
          $unsigned((wire2[(4'hb):(2'h2)] ?
              $signed($signed(wire2)) : wire3)) : wire0[(2'h2):(1'h1)]);
      if ($unsigned((8'hb1)))
        begin
          reg7 <= $unsigned($signed(wire0));
        end
      else
        begin
          reg7 <= ($signed($signed((8'h9f))) ?
              (8'ha5) : (&({(-(8'hbc)),
                  (wire0 >>> wire2)} << (reg6 & (~^wire0)))));
        end
      reg8 <= wire1[(3'h5):(2'h2)];
      reg9 <= ((|($signed(((8'hbb) ? reg6 : wire0)) ?
              $unsigned(wire3[(1'h0):(1'h0)]) : reg7[(1'h0):(1'h0)])) ?
          $unsigned($unsigned({(+wire5),
              $unsigned(wire2)})) : $unsigned({(8'hb1), wire1}));
    end
  assign wire10 = $unsigned(wire1);
  assign wire11 = $signed(wire5[(3'h5):(3'h5)]);
  assign wire12 = (^({(wire0[(3'h4):(2'h3)] ? {reg8} : wire3[(1'h1):(1'h0)])} ?
                      ({$signed((8'hbd))} ~^ (+wire4)) : ($signed((wire5 ~^ wire0)) ?
                          wire3[(1'h0):(1'h0)] : wire0)));
  always
    @(posedge clk) begin
      reg13 <= (reg9[(1'h1):(1'h1)] <= $unsigned(wire5[(3'h6):(3'h6)]));
      reg14 <= $unsigned(wire11[(4'hd):(4'h8)]);
      if (wire0[(1'h0):(1'h0)])
        begin
          if ($unsigned(wire11[(4'hf):(4'hc)]))
            begin
              reg15 <= wire5;
              reg16 <= (wire5 ~^ reg9[(4'hb):(3'h7)]);
              reg17 <= (($signed(((-reg7) ? reg16 : $unsigned(wire11))) ?
                  wire4 : wire4[(3'h6):(1'h1)]) ~^ ($unsigned(reg16[(4'hf):(4'hd)]) <<< ((wire3 - $signed(wire11)) - ((~|wire12) & ((8'ha3) ?
                  reg9 : reg9)))));
              reg18 <= reg6[(3'h5):(2'h2)];
            end
          else
            begin
              reg15 <= (8'ha6);
              reg16 <= reg6[(2'h2):(1'h0)];
              reg17 <= $signed(wire10);
            end
          reg19 <= (($signed({$unsigned(wire5), reg13[(1'h1):(1'h0)]}) ?
              wire2 : $unsigned(({reg6} ?
                  (~|reg6) : (wire4 ?
                      (7'h40) : reg14)))) <= $signed((~$unsigned($unsigned(wire0)))));
          if ({(~^wire2), (+$unsigned((+(wire1 >>> reg7))))})
            begin
              reg20 <= reg17[(3'h7):(3'h5)];
              reg21 <= reg7[(1'h1):(1'h1)];
              reg22 <= (~|(({reg20[(3'h7):(1'h0)],
                      wire2[(3'h5):(2'h3)]} >= ((reg6 ?
                      wire5 : reg6) & $signed(reg6))) ?
                  (|($signed((8'ha0)) ?
                      $unsigned(reg20) : $signed(wire10))) : $unsigned(((reg13 ?
                      wire0 : wire1) <= $unsigned(wire10)))));
              reg23 <= wire5;
              reg24 <= ({wire4[(3'h7):(3'h5)]} ?
                  $signed(wire3[(1'h0):(1'h0)]) : (wire1[(4'he):(4'h8)] ?
                      (reg18 ?
                          $signed((reg22 ^ reg14)) : $unsigned((~^wire12))) : (~&reg15[(1'h1):(1'h1)])));
            end
          else
            begin
              reg20 <= reg23[(4'h8):(2'h3)];
              reg21 <= {(($unsigned($signed(wire10)) << ($unsigned(wire11) ?
                          wire11[(3'h7):(3'h4)] : $signed(reg13))) ?
                      $unsigned((~&(reg14 || reg7))) : $unsigned(({reg17,
                              wire4} ?
                          (wire4 ? wire2 : reg16) : wire1[(3'h4):(2'h3)]))),
                  {$unsigned(wire5)}};
              reg22 <= $signed($unsigned($unsigned($unsigned((reg24 ?
                  reg15 : wire11)))));
              reg23 <= (^~$unsigned({reg20, ({wire2, wire5} + wire12)}));
            end
          reg25 <= (~|(!$signed($signed(reg20))));
          reg26 <= (^~wire0[(2'h2):(1'h1)]);
        end
      else
        begin
          if ({$unsigned((^~$unsigned($signed(reg15)))),
              $signed((((^wire2) ?
                  reg16[(4'hf):(1'h1)] : $signed(reg25)) || $unsigned(reg22)))})
            begin
              reg15 <= ($unsigned($signed(reg7)) ^ $unsigned(reg14));
              reg16 <= (~(+$signed(reg13[(1'h0):(1'h0)])));
              reg17 <= reg9[(1'h1):(1'h0)];
              reg18 <= $unsigned(wire10);
            end
          else
            begin
              reg15 <= {($signed($signed($signed(reg21))) || (($signed(wire4) ?
                          {(8'hae), reg15} : $unsigned(reg14)) ?
                      wire12 : (-reg24[(1'h1):(1'h1)]))),
                  wire11};
              reg16 <= $unsigned($signed((wire4[(2'h3):(2'h3)] <<< (reg16[(2'h3):(2'h3)] ?
                  $unsigned(wire5) : (reg7 ? reg6 : wire1)))));
              reg17 <= reg25[(1'h1):(1'h0)];
              reg18 <= reg17[(5'h10):(3'h5)];
            end
          if (($signed($signed((~^(+reg20)))) >>> (reg24[(1'h0):(1'h0)] >>> $unsigned($signed($unsigned(reg18))))))
            begin
              reg19 <= {$signed(reg25)};
              reg20 <= (^reg24[(1'h0):(1'h0)]);
            end
          else
            begin
              reg19 <= $signed($signed({wire10}));
              reg20 <= (($signed(reg9) >>> (^reg20[(3'h5):(1'h1)])) >= ((&reg14[(5'h10):(1'h0)]) ?
                  reg9 : $unsigned(($unsigned(reg25) || reg26))));
              reg21 <= {reg24};
            end
        end
      reg27 <= ((wire10[(2'h3):(1'h1)] ~^ ((8'haa) ?
          (8'had) : wire1)) & wire3[(1'h0):(1'h0)]);
    end
  assign wire28 = wire12;
  assign wire29 = reg6[(4'ha):(2'h3)];
  assign wire30 = $unsigned(reg25[(2'h2):(2'h2)]);
  assign wire31 = (reg23[(1'h0):(1'h0)] ?
                      $unsigned(wire1[(4'hd):(2'h3)]) : wire10);
  always
    @(posedge clk) begin
      reg32 <= $unsigned((8'ha9));
      reg33 <= $unsigned((~&{reg9}));
      if ((~|(($unsigned($signed(reg14)) >> ($signed(wire30) << (reg18 ^~ reg27))) < (((wire12 ?
              reg24 : reg26) ?
          (reg32 < wire12) : (reg18 ? wire1 : wire31)) <= (~|(reg22 ?
          (8'hbf) : (8'hb2)))))))
        begin
          reg34 <= (!{$unsigned($signed(((8'haa) ? wire10 : reg21)))});
          reg35 <= $signed((~&$signed(reg9[(4'hd):(3'h7)])));
          reg36 <= $signed((((^$signed((7'h41))) >= $signed($unsigned(reg20))) ?
              reg7 : $signed(reg33[(2'h3):(1'h0)])));
          if ($signed((reg8[(4'ha):(4'ha)] < (((reg25 || reg27) ?
              {wire1,
                  wire11} : reg21[(3'h6):(2'h3)]) <<< ($unsigned(reg9) | wire4[(3'h5):(2'h2)])))))
            begin
              reg37 <= $unsigned(($signed(((reg21 ?
                  reg22 : wire31) < $signed(wire0))) ^ ((~|(~|reg27)) ?
                  wire28[(2'h3):(2'h2)] : wire4[(2'h2):(2'h2)])));
            end
          else
            begin
              reg37 <= ((|(~|wire5)) ?
                  ($signed(reg23[(4'h8):(1'h0)]) * reg20[(3'h6):(2'h3)]) : (|wire0));
            end
          reg38 <= ($signed(reg27) | $unsigned($signed(((^~reg22) ~^ {(8'ha1),
              reg34}))));
        end
      else
        begin
          reg34 <= reg37[(2'h2):(1'h0)];
          if (reg8)
            begin
              reg35 <= $signed((8'hb4));
              reg36 <= (7'h44);
            end
          else
            begin
              reg35 <= (^~{reg18, wire3});
              reg36 <= $signed((+((|(wire12 <<< reg9)) ?
                  ((reg8 ? reg7 : (8'hb1)) ^ reg14) : ({(7'h42), reg26} ?
                      reg34 : (wire3 ? reg37 : reg22)))));
              reg37 <= wire0[(1'h1):(1'h0)];
              reg38 <= ({$signed({reg33})} * reg7);
              reg39 <= $signed($unsigned(($signed($signed((7'h40))) * (wire3[(1'h0):(1'h0)] ?
                  wire30[(3'h5):(2'h2)] : wire10[(3'h6):(1'h0)]))));
            end
          if ($signed(reg27))
            begin
              reg40 <= reg14[(5'h10):(3'h4)];
            end
          else
            begin
              reg40 <= reg27[(4'hf):(3'h7)];
              reg41 <= ($unsigned(((&{(8'h9e)}) ?
                      {$signed(reg19), $unsigned(wire11)} : reg17)) ?
                  (($unsigned((8'ha6)) ?
                          (-(reg21 ?
                              reg16 : wire4)) : $signed($signed(wire4))) ?
                      (^~(!$signed(wire31))) : $unsigned((reg36 ?
                          ((8'hb1) ?
                              reg35 : wire11) : $unsigned((8'hae))))) : wire29);
              reg42 <= $unsigned(reg15[(2'h2):(1'h1)]);
            end
        end
      reg43 <= (-(((~reg17) ?
              (((8'ha2) - wire11) ?
                  (reg24 >> (7'h43)) : wire12) : wire0[(3'h4):(3'h4)]) ?
          reg39 : $unsigned($unsigned((reg19 <= reg35)))));
    end
  module44 #() modinst89 (.clk(clk), .wire48(reg42), .wire45(reg8), .wire47(reg36), .y(wire88), .wire46(reg40));
  assign wire90 = (+$signed((~|$unsigned(((8'hb4) << reg18)))));
  assign wire91 = {reg15};
  assign wire92 = {{{$unsigned((~&(8'hbd)))}, reg20},
                      ((reg35[(3'h7):(1'h1)] * $signed(wire31[(2'h2):(1'h1)])) ?
                          (wire4 ?
                              $unsigned($signed(reg39)) : ($signed(reg43) ?
                                  $unsigned((8'ha9)) : wire90)) : (8'hb4))};
  assign wire93 = wire4;
  assign wire94 = $unsigned((((8'ha1) == $signed($signed(wire93))) ?
                      (8'hb0) : ($unsigned(wire12) ?
                          ({(8'ha6)} ~^ ((8'h9c) ?
                              (8'hb8) : reg37)) : $unsigned({(8'ha8),
                              (8'hab)}))));
  assign wire95 = (wire3[(1'h0):(1'h0)] > wire0[(2'h2):(2'h2)]);
endmodule

module module44  (y, clk, wire45, wire46, wire47, wire48);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire [(5'h14):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire85;
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  assign y = {wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire68,
                 wire85,
                 reg87,
                 (1'h0)};
  assign wire49 = ({(-(~(wire48 <= wire47))),
                      (-(~&$signed(wire48)))} < {$unsigned($unsigned((wire48 > wire47)))});
  assign wire50 = wire49[(4'hc):(4'ha)];
  assign wire51 = {$signed(wire48[(1'h1):(1'h0)])};
  assign wire52 = wire47;
  assign wire53 = wire46[(1'h0):(1'h0)];
  assign wire54 = $unsigned((^~(wire50[(2'h3):(2'h2)] - $signed((wire52 != wire50)))));
  module55 #() modinst69 (wire68, clk, wire50, wire48, wire47, wire49);
  module70 #() modinst86 (.clk(clk), .y(wire85), .wire75(wire52), .wire73(wire68), .wire71(wire49), .wire72(wire51), .wire74(wire47));
  always
    @(posedge clk) begin
      reg87 <= wire46[(1'h0):(1'h0)];
    end
endmodule

module module70
#(parameter param84 = (-({(8'hb8), ({(8'hb4)} ? ((8'ha5) <= (8'haf)) : (|(8'hae)))} ? ((((8'ha0) & (8'h9f)) ? ((8'hb3) == (7'h40)) : ((7'h42) <= (7'h43))) ? (((8'ha4) >= (7'h43)) & ((8'ha7) & (7'h44))) : {((8'hab) ? (8'h9c) : (7'h42)), ((8'hba) ? (8'ha1) : (8'ha3))}) : ((((8'hb6) ? (8'ha4) : (8'hb5)) && ((8'hbe) ? (7'h43) : (8'hbb))) ? (^~((8'ha5) & (8'hb2))) : (((8'hb7) ? (8'hab) : (8'hba)) ? ((8'hb2) || (7'h43)) : {(7'h44)})))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire75;
  input wire [(4'hb):(1'h0)] wire74;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire signed [(2'h2):(1'h0)] wire72;
  input wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg76 <= $signed(wire74);
    end
  always
    @(posedge clk) begin
      reg77 <= wire73;
      reg78 <= wire72;
    end
  assign wire79 = (|$signed(($unsigned(wire74) ?
                      $signed((~(8'hac))) : {((8'ha3) ? wire71 : wire74)})));
  assign wire80 = wire73[(3'h4):(2'h2)];
  assign wire81 = ((8'hab) ?
                      ((&reg78) ?
                          (8'hb9) : ($signed($signed(wire73)) ?
                              reg76 : wire72)) : ((reg78 ?
                          {{(8'hbf), reg78},
                              $signed(reg76)} : wire71) | (^({wire80, reg76} ?
                          (&wire79) : wire75))));
  assign wire82 = (~|wire79[(4'hb):(2'h3)]);
  assign wire83 = (((((wire81 >>> (7'h41)) ?
                      (^~(8'ha6)) : (wire79 ?
                          (8'h9c) : wire79)) >>> (-reg76)) & {$signed($signed(wire80))}) && $signed(($signed($signed((8'hbc))) ^ wire80[(3'h4):(3'h4)])));
endmodule

module module55
#(parameter param67 = (({(((8'haf) ? (8'ha9) : (8'ha8)) && ((8'hbb) ? (8'h9e) : (8'hb8)))} ? {((~(7'h43)) ? (|(8'ha0)) : (^(8'hb7)))} : ({(|(8'h9d))} >= (&((8'hb0) | (8'hbc))))) <<< (((~^(~^(7'h42))) ? {((8'hab) << (8'hb6))} : ({(8'hb4), (8'hae)} > ((7'h42) == (8'hbc)))) ^~ (^(8'h9f)))))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  input wire signed [(4'h9):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  assign y = {wire66, wire64, wire63, wire62, wire61, wire60, reg65, (1'h0)};
  assign wire60 = wire58;
  assign wire61 = $unsigned((({$signed(wire58),
                      {wire56}} ^~ $unsigned(wire56)) ~^ (wire58[(4'h8):(3'h4)] ?
                      wire59[(3'h4):(2'h2)] : (wire57[(1'h0):(1'h0)] ?
                          $signed(wire56) : (wire56 ^~ wire56)))));
  assign wire62 = (&$signed($signed(($signed(wire59) - (wire61 - wire59)))));
  assign wire63 = {{($unsigned(wire60[(3'h5):(1'h1)]) >> (wire58[(4'h8):(3'h7)] ~^ $unsigned((7'h43))))}};
  assign wire64 = (wire59[(4'hb):(4'h9)] ? wire57 : (8'h9d));
  always
    @(posedge clk) begin
      reg65 <= wire58;
    end
  assign wire66 = ($signed($unsigned(wire57[(3'h6):(3'h5)])) ~^ wire63);
endmodule
