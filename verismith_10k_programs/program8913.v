module top
#(parameter param73 = ({(~&({(8'hbc)} ? (&(8'haf)) : ((8'h9d) ? (7'h40) : (8'hbb)))), (^(((8'hb4) + (8'hbd)) & (|(8'hae))))} ? {{(((8'hb4) >= (8'h9d)) ? ((8'hb8) ? (8'h9d) : (8'h9c)) : ((8'hb8) ? (8'haf) : (8'ha2)))}} : (((((8'hb0) ? (8'ha7) : (8'hbe)) ? ((8'had) ? (8'ha6) : (8'hab)) : (&(8'hb2))) ? (((8'hb6) ^ (8'hb2)) ? {(8'h9d), (7'h41)} : (~&(8'had))) : (((8'hab) != (8'hbe)) || (~(7'h41)))) > (&(^~((8'ha5) != (8'hba)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire54;
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire5,
                 wire6,
                 wire7,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire54,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg57,
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
                 reg8,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = $unsigned($signed((~^(-(wire3 ? wire1 : wire0)))));
  assign wire7 = {{(wire4[(3'h5):(2'h2)] & wire6)}, wire0[(3'h7):(3'h7)]};
  always
    @(posedge clk) begin
      if ($unsigned((&$unsigned(((~^wire7) - (wire1 ? wire4 : wire6))))))
        begin
          reg8 <= ($unsigned({$signed((wire5 && wire2)),
              wire7[(4'ha):(3'h4)]}) == ($signed((wire5 >>> wire2)) <= (8'hb3)));
          if (wire2)
            begin
              reg9 <= wire6;
            end
          else
            begin
              reg9 <= wire6;
              reg10 <= reg9[(1'h0):(1'h0)];
              reg11 <= $unsigned((~&{$signed(reg10[(1'h1):(1'h0)])}));
              reg12 <= wire1[(3'h4):(2'h3)];
            end
        end
      else
        begin
          if ($signed($signed(wire2[(3'h6):(3'h6)])))
            begin
              reg8 <= ($signed((|$unsigned($unsigned(wire1)))) == (^$unsigned($signed((wire5 ^ wire0)))));
              reg9 <= ($unsigned({($unsigned(wire0) ?
                          (|(8'had)) : (reg9 != reg11)),
                      (reg8[(4'hf):(4'ha)] ?
                          $unsigned(wire2) : wire7[(4'he):(4'h8)])}) ?
                  (wire6[(4'hd):(1'h0)] ?
                      (($unsigned(wire1) ?
                          (wire0 ? reg8 : (7'h42)) : {(8'hae),
                              wire4}) < ((reg9 * reg9) ?
                          (reg9 || wire5) : wire4)) : (($unsigned(wire1) ?
                              $unsigned(reg10) : {wire7, reg8}) ?
                          $unsigned(wire6) : (!wire4[(3'h6):(1'h0)]))) : ({$signed((^~(8'ha4))),
                          {reg9[(1'h1):(1'h0)], ((8'ha5) ? wire0 : wire3)}} ?
                      (8'hb3) : $signed(reg8[(1'h0):(1'h0)])));
            end
          else
            begin
              reg8 <= $signed($signed({((wire2 << reg8) + (8'h9c)),
                  {(wire2 ? wire4 : wire3)}}));
              reg9 <= {(($signed({wire3, reg11}) ?
                          $signed((~&wire4)) : $unsigned({(8'hbd), reg10})) ?
                      (wire1 << (&reg11[(3'h6):(1'h1)])) : (-reg11)),
                  {(~^($unsigned(wire7) != {wire7}))}};
              reg10 <= (+(reg8 <<< wire1[(3'h4):(2'h3)]));
              reg11 <= (~^wire0[(4'hc):(4'h9)]);
            end
        end
      reg13 <= $signed(($signed({{(7'h41)}}) ?
          wire4 : (($signed(wire3) * $unsigned(reg8)) ?
              wire6[(4'hb):(4'hb)] : $unsigned(wire0[(4'h9):(3'h4)]))));
      reg14 <= (wire2 ?
          (~$signed(($unsigned((8'h9e)) ?
              wire4 : (wire6 > reg11)))) : (reg8[(5'h14):(3'h7)] ?
              (reg11[(3'h7):(1'h1)] ?
                  wire0 : $signed($signed(reg8))) : ($unsigned((-wire4)) ?
                  $unsigned((wire2 * wire0)) : {((8'hb1) ? reg13 : wire0),
                      wire7[(4'hf):(4'he)]})));
      reg15 <= $signed(wire4);
      if ((((wire7 || reg10) ?
          $signed($signed((reg10 >= wire2))) : $signed($signed(reg10[(1'h0):(1'h0)]))) >= $signed($unsigned(reg14))))
        begin
          reg16 <= wire6;
          reg17 <= ((~($unsigned(wire3[(2'h3):(1'h0)]) == $signed((^~wire6)))) ?
              ($signed(($unsigned(reg14) >> $unsigned(reg8))) <= (|$signed((reg8 <<< wire2)))) : ((reg15 ?
                  (^~(wire5 && wire3)) : {wire4, wire0}) != $signed((wire6 ?
                  (reg14 ? reg12 : wire7) : $unsigned(reg13)))));
          reg18 <= ((8'ha3) > reg12);
          if ($unsigned(wire7))
            begin
              reg19 <= $unsigned((+reg17));
              reg20 <= $signed($signed((({reg8,
                  reg9} & $unsigned(reg19)) - $signed((8'hb8)))));
              reg21 <= $unsigned((reg18[(4'hc):(3'h7)] ?
                  wire6 : $signed(wire1[(3'h6):(1'h0)])));
              reg22 <= wire0;
              reg23 <= ((~|$signed((wire5 != (~|reg8)))) < reg14);
            end
          else
            begin
              reg19 <= $unsigned(reg17[(4'hf):(2'h2)]);
              reg20 <= $signed((~^$unsigned((!(wire7 ? wire5 : (8'hb1))))));
              reg21 <= ((~^($unsigned($signed(wire0)) ^~ (((8'ha4) ~^ (8'h9d)) << (reg9 ?
                  wire6 : (8'hb6))))) * reg11[(4'hb):(3'h6)]);
            end
        end
      else
        begin
          reg16 <= ((8'h9c) << $signed($unsigned($signed({reg19}))));
          if ($unsigned((($unsigned(wire4) > (wire1[(2'h2):(1'h1)] ^ (reg11 >>> (8'hb9)))) ?
              (wire7 ?
                  (~&$unsigned((8'hbd))) : reg20[(1'h0):(1'h0)]) : {reg9[(1'h0):(1'h0)]})))
            begin
              reg17 <= $unsigned(reg20[(1'h1):(1'h1)]);
              reg18 <= (~|(|reg10[(2'h3):(1'h1)]));
            end
          else
            begin
              reg17 <= $unsigned($unsigned(($signed(((8'hbb) ?
                  reg19 : wire1)) >> wire6[(2'h3):(2'h2)])));
              reg18 <= $signed({reg13, (8'ha2)});
              reg19 <= $unsigned($unsigned(reg10));
              reg20 <= reg19;
            end
          reg21 <= $signed(reg8[(5'h14):(1'h1)]);
          reg22 <= $signed(wire5);
          if ((reg13 ?
              (&{reg19, $unsigned($signed(wire2))}) : (~&(~&({(8'h9f), reg9} ?
                  (reg14 ^~ wire6) : wire6[(4'hf):(1'h0)])))))
            begin
              reg23 <= reg8;
            end
          else
            begin
              reg23 <= ($unsigned({{reg12[(3'h6):(3'h4)], wire0},
                      (-$unsigned(wire4))}) ?
                  wire4[(3'h5):(3'h4)] : $unsigned($signed($signed($unsigned(reg8)))));
            end
        end
    end
  assign wire24 = $signed(((~^reg16) ?
                      $unsigned((|{wire1})) : $unsigned(($signed(reg8) >>> (~wire3)))));
  assign wire25 = ((!(^~wire5[(4'hd):(1'h1)])) ?
                      reg10[(2'h2):(1'h0)] : ($unsigned((reg9 >>> ((8'hb4) ?
                          reg18 : reg10))) ^ reg19));
  assign wire26 = (wire24[(4'hb):(3'h4)] ~^ ($signed(reg15) | reg21));
  assign wire27 = ((^~reg18) ^~ reg15[(1'h0):(1'h0)]);
  assign wire28 = wire6;
  assign wire29 = ($unsigned($unsigned((reg17[(2'h2):(1'h1)] ?
                      wire25[(3'h6):(1'h1)] : reg23[(3'h6):(3'h6)]))) == $signed(wire26));
  module30 #() modinst55 (wire54, clk, wire25, wire26, reg17, reg12, wire7);
  assign wire56 = ((|$signed(wire2)) << ($signed($signed((wire54 ?
                          reg11 : reg10))) ?
                      ((+$unsigned(wire27)) ?
                          $unsigned(wire25) : $signed($signed(reg20))) : $unsigned((~&reg10))));
  always
    @(posedge clk) begin
      reg57 <= (~(reg22 ? reg20 : (-$unsigned((reg21 ? reg10 : wire6)))));
    end
  assign wire58 = wire3[(4'hf):(3'h6)];
  assign wire59 = (wire27[(3'h7):(3'h5)] << $unsigned($signed(wire3)));
  assign wire60 = {reg15[(1'h0):(1'h0)], reg57[(2'h2):(1'h0)]};
  assign wire61 = wire2;
  assign wire62 = wire61;
  assign wire63 = $unsigned(($unsigned((reg12 >= (reg20 <<< wire61))) == (((wire54 != reg12) && (wire61 ?
                          reg22 : wire27)) ?
                      wire3[(4'hb):(4'hb)] : (~&$signed(reg9)))));
  assign wire64 = reg17[(4'hf):(4'ha)];
  assign wire65 = (reg19[(1'h1):(1'h0)] != reg16[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      if ($signed(wire24))
        begin
          reg66 <= $unsigned(reg23[(1'h0):(1'h0)]);
          reg67 <= wire7;
        end
      else
        begin
          reg66 <= (8'had);
          reg67 <= $signed($unsigned($unsigned((8'ha0))));
          reg68 <= (((-(~^$signed((8'hb4)))) ?
              (wire63 != {{reg10}}) : ((reg17[(4'he):(4'h8)] & $signed(wire26)) ?
                  wire24 : {$signed((8'ha7)),
                      (wire2 - wire61)})) ^ reg12[(1'h0):(1'h0)]);
        end
      reg69 <= (~|{$unsigned(wire24), wire5});
      reg70 <= wire2;
      reg71 <= (^~(~|(reg21 ~^ ($unsigned(reg68) ?
          wire59[(3'h5):(2'h2)] : $signed(wire54)))));
      reg72 <= ($unsigned(wire65) <<< (^{(reg18 ? reg11 : {reg20, reg67}),
          {(+wire28), {(8'hb9)}}}));
    end
endmodule

module module30
#(parameter param53 = (+(~^((((8'had) ? (7'h42) : (8'h9f)) ? ((8'ha0) ? (8'hba) : (8'hbf)) : ((7'h44) ? (8'hbe) : (8'hae))) ? (((8'ha1) * (8'ha3)) ? ((8'hb6) ? (8'hb1) : (8'hbb)) : (^~(8'ha6))) : (~|(~(8'h9d)))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(4'he):(1'h0)] wire33;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire41;
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire41,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= (+({(^~(8'hb5))} ?
          $unsigned((~^wire33)) : $signed($unsigned(wire35[(3'h4):(2'h3)]))));
      reg37 <= {(({(wire31 - wire34), $signed(wire35)} - ($signed(wire34) ?
              (reg36 ? wire33 : (8'ha4)) : (~^wire35))) != ((|(^~wire35)) ?
              wire34[(5'h14):(4'ha)] : ($unsigned(wire35) ?
                  (8'had) : wire32)))};
      reg38 <= $unsigned(wire35);
      reg39 <= $unsigned((wire31 == $unsigned({(reg36 && reg36),
          wire34[(4'he):(4'h9)]})));
      reg40 <= {$signed($unsigned(((reg39 && wire31) | $signed(reg36)))),
          $signed((reg36[(4'h9):(1'h1)] ?
              reg38[(1'h1):(1'h1)] : $unsigned(((7'h44) ? reg38 : reg39))))};
    end
  assign wire41 = ((+(~(reg38 ?
                      $unsigned(wire32) : (|wire35)))) <= $unsigned((~^$unsigned((wire32 - wire34)))));
  always
    @(posedge clk) begin
      if (wire33)
        begin
          if ($signed(reg40))
            begin
              reg42 <= (~^$unsigned((reg39[(3'h5):(2'h3)] ?
                  $signed($unsigned(wire31)) : (wire31[(1'h0):(1'h0)] <= (|reg40)))));
              reg43 <= $signed({($unsigned(wire31[(5'h13):(3'h6)]) == (~^(wire31 * wire32))),
                  ($signed($unsigned(wire35)) ?
                      ($unsigned(wire33) >= {(8'h9d),
                          wire34}) : wire31[(5'h11):(4'he)])});
            end
          else
            begin
              reg42 <= ((~&reg38[(4'hb):(4'h8)]) >> {$signed((((8'hbf) - wire32) ?
                      reg38 : reg39)),
                  reg40});
              reg43 <= $unsigned({$unsigned(((wire35 ?
                      reg36 : reg42) < reg42[(3'h6):(1'h1)])),
                  $unsigned($unsigned(((8'h9f) ? wire41 : reg42)))});
            end
        end
      else
        begin
          reg42 <= (wire33 ?
              $signed($unsigned((-$unsigned(wire35)))) : $unsigned(reg38));
          if ((&{$signed($unsigned((!(7'h40))))}))
            begin
              reg43 <= $signed(((8'hb7) ?
                  {$signed({reg42}),
                      $signed(reg43[(3'h5):(3'h4)])} : (!wire33[(4'hc):(2'h2)])));
            end
          else
            begin
              reg43 <= $unsigned(wire41);
              reg44 <= ((-((reg36 ?
                  $signed(wire41) : (reg38 ?
                      wire41 : (8'hbb))) == reg37)) | {(wire33[(1'h0):(1'h0)] && (8'haf))});
              reg45 <= reg43;
            end
          reg46 <= (((&$signed({wire41})) & $unsigned(($unsigned(wire33) ~^ {reg39}))) ?
              (^~reg37) : wire41[(1'h1):(1'h1)]);
        end
      reg47 <= ((~|reg46) ? wire33 : $unsigned(wire32));
      reg48 <= $unsigned((8'hb4));
    end
  assign wire49 = (wire32[(3'h5):(1'h0)] <= $unsigned($unsigned((&(^~reg46)))));
  assign wire50 = (^~(-wire34[(1'h0):(1'h0)]));
  assign wire51 = $signed((8'ha4));
  assign wire52 = $unsigned(({reg40[(4'h9):(1'h0)],
                          (((8'hb7) >>> reg42) ? (reg44 <= wire41) : wire32)} ?
                      $signed($signed(wire51)) : wire51[(4'hc):(2'h2)]));
endmodule
