module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire62;
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire39,
                 wire62,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
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
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg4 <= wire3[(3'h5):(2'h3)];
          if ($signed($signed(wire0)))
            begin
              reg5 <= reg4;
              reg6 <= (^~reg4[(3'h5):(3'h5)]);
              reg7 <= $unsigned((&{$signed(wire3), (~reg5[(2'h2):(1'h0)])}));
              reg8 <= (reg5 ? wire1 : reg7[(4'hd):(4'h9)]);
              reg9 <= ($unsigned((8'hbc)) ?
                  (({(reg6 & (8'hab))} == (wire1 ?
                          (|(7'h43)) : $signed(reg5))) ?
                      (reg8[(2'h2):(1'h0)] ?
                          $signed((wire2 ? reg7 : wire1)) : ({reg7, reg8} ?
                              $signed(reg7) : reg5)) : ((8'ha3) - (8'had))) : (&($signed((wire0 << reg5)) ?
                      ($signed(reg6) ?
                          (8'hae) : $unsigned(reg4)) : $signed($unsigned((8'h9d))))));
            end
          else
            begin
              reg5 <= (^~$signed(wire3[(3'h4):(1'h0)]));
              reg6 <= $signed(reg9[(2'h3):(2'h2)]);
              reg7 <= $unsigned((&{(wire1 ? (reg8 ? reg5 : reg6) : reg7)}));
            end
          reg10 <= reg7;
          if ($unsigned((8'ha7)))
            begin
              reg11 <= reg10[(3'h6):(3'h4)];
              reg12 <= (wire2[(3'h4):(2'h2)] * $signed((wire1 ?
                  reg8 : (&(reg8 ? wire3 : reg6)))));
            end
          else
            begin
              reg11 <= {(((8'ha0) + ({reg12, reg7} ?
                      (reg4 ?
                          wire0 : wire2) : reg7[(5'h11):(3'h4)])) <= reg4[(1'h1):(1'h1)])};
              reg12 <= ((~|reg10) ?
                  wire1[(5'h12):(3'h4)] : (|{$unsigned((reg9 || reg6))}));
              reg13 <= reg5;
              reg14 <= (!($unsigned($unsigned($unsigned((8'hbf)))) ~^ (reg9 == reg13)));
            end
        end
      else
        begin
          reg4 <= ($signed((^~(+reg14))) ? reg12[(4'hd):(4'hd)] : reg11);
          reg5 <= $signed(wire0[(3'h7):(3'h4)]);
          reg6 <= wire1;
          reg7 <= (&$signed({($unsigned((8'hb3)) + (reg7 ? reg14 : reg5)),
              ((~^wire2) | (reg5 ? reg11 : reg13))}));
          reg8 <= reg4[(1'h0):(1'h0)];
        end
      reg15 <= (~|($signed((7'h44)) ?
          reg10[(3'h6):(1'h1)] : ($unsigned((reg7 > reg4)) ?
              $signed((|wire2)) : $unsigned(wire2[(1'h1):(1'h1)]))));
      reg16 <= (~&reg13);
      if (($unsigned($signed(reg4[(1'h0):(1'h0)])) < $unsigned(($signed((wire3 ~^ wire1)) ?
          $unsigned(reg8) : wire3))))
        begin
          if ((($signed($signed((reg9 ? (8'hba) : (8'hb0)))) ?
                  wire2 : ($signed((reg9 != reg7)) - $unsigned((reg12 >> reg5)))) ?
              reg7[(5'h13):(3'h7)] : reg8[(4'h8):(3'h4)]))
            begin
              reg17 <= ((~|$unsigned((8'hbc))) - $signed(({reg16[(3'h7):(2'h2)],
                  ((8'had) ? wire2 : wire2)} != reg15[(4'he):(4'h8)])));
              reg18 <= wire2[(1'h1):(1'h1)];
              reg19 <= (8'haa);
              reg20 <= (~&(reg6 ?
                  $unsigned(((reg8 ?
                      reg17 : reg8) ^ $unsigned(wire2))) : reg16[(3'h7):(3'h5)]));
              reg21 <= reg8[(4'h9):(4'h8)];
            end
          else
            begin
              reg17 <= (8'ha9);
              reg18 <= (8'h9d);
              reg19 <= reg19[(4'h8):(1'h1)];
              reg20 <= ((8'hb6) >= $signed(reg18[(3'h5):(2'h3)]));
            end
          if ($unsigned((^~(^reg6))))
            begin
              reg22 <= wire3[(3'h6):(3'h6)];
              reg23 <= ($unsigned((-reg17)) & $unsigned(reg15));
            end
          else
            begin
              reg22 <= (reg13 == $signed(((8'hbb) <<< $unsigned((reg23 * reg8)))));
              reg23 <= reg14;
              reg24 <= $signed($signed($unsigned($unsigned((8'ha5)))));
              reg25 <= reg5;
            end
          reg26 <= reg19[(4'ha):(3'h7)];
          if (wire3)
            begin
              reg27 <= reg25;
              reg28 <= (($signed($signed(reg12[(2'h3):(1'h0)])) ?
                      reg19[(3'h6):(2'h3)] : {(-$signed((8'hb6)))}) ?
                  wire1[(2'h2):(1'h0)] : {$unsigned(((reg4 >> (7'h41)) ?
                          (~wire3) : (^~wire1)))});
              reg29 <= {(reg19 ~^ reg5)};
              reg30 <= (8'ha7);
            end
          else
            begin
              reg27 <= (^$unsigned((({reg30} ?
                  $unsigned(reg10) : {reg25, reg30}) == ((reg14 ?
                      (8'hba) : reg20) ?
                  (reg9 ^ reg17) : $signed(reg16)))));
              reg28 <= (($unsigned($unsigned($signed(reg20))) + $unsigned((^(!reg20)))) <<< reg17[(3'h6):(2'h3)]);
              reg29 <= reg17;
            end
        end
      else
        begin
          reg17 <= ($unsigned((((~reg5) ? (^reg9) : $unsigned(wire3)) ?
                  $unsigned($signed(reg25)) : ((reg8 ?
                      reg19 : (8'hbf)) >> wire0))) ?
              reg22 : (((|reg27) ?
                  wire0 : reg27[(1'h0):(1'h0)]) ^~ ($unsigned(reg14[(3'h7):(3'h7)]) ^ (+(reg9 ?
                  reg17 : reg9)))));
          reg18 <= reg21[(3'h6):(3'h6)];
          reg19 <= $unsigned(wire2[(1'h0):(1'h0)]);
        end
      reg31 <= (($unsigned((reg25[(2'h2):(2'h2)] ?
              reg9[(1'h1):(1'h1)] : $signed((7'h40)))) * ((~|{(8'ha1), reg27}) ?
              $signed((reg15 ~^ reg12)) : $signed((reg5 != (8'h9d))))) ?
          reg17[(3'h5):(2'h3)] : (!$signed(reg6)));
    end
  always
    @(posedge clk) begin
      reg32 <= ((reg24[(1'h1):(1'h1)] | $unsigned(reg22[(3'h5):(1'h1)])) > (reg6[(3'h7):(3'h4)] * (($unsigned(reg21) ?
          (8'hb2) : (8'hba)) != $unsigned((!(8'hbf))))));
      if ((7'h43))
        begin
          reg33 <= reg6;
          reg34 <= (!reg22[(3'h5):(1'h0)]);
          reg35 <= ({(reg15[(2'h3):(1'h0)] != reg6),
                  ((((8'hb9) & reg13) && reg13) ~^ (((8'h9d) ?
                      reg12 : reg26) >>> (reg10 ? reg25 : reg32)))} ?
              (~|(8'h9d)) : (~^{{$signed(reg20)},
                  $unsigned(reg32[(2'h2):(1'h1)])}));
        end
      else
        begin
          reg33 <= ((8'h9d) ~^ $signed(((wire3 <= $unsigned((8'hba))) <<< reg15[(4'h8):(1'h1)])));
          reg34 <= $signed($signed(reg30));
          if ((reg11 ^~ (reg13 ? reg33 : reg12[(1'h0):(1'h0)])))
            begin
              reg35 <= (^$signed($unsigned(wire1)));
              reg36 <= reg19[(3'h5):(3'h5)];
            end
          else
            begin
              reg35 <= ($unsigned($signed({{(8'ha7), reg8}})) ^ (~reg10));
            end
          reg37 <= {reg14};
          reg38 <= reg5[(2'h2):(2'h2)];
        end
    end
  assign wire39 = ((&({reg11[(4'ha):(1'h0)], reg18[(2'h3):(1'h0)]} ?
                      (~&$signed(reg34)) : reg16[(3'h5):(1'h0)])) >>> $signed(reg23[(1'h1):(1'h1)]));
  module40 #() modinst63 (wire62, clk, reg32, reg24, wire3, reg31);
endmodule

module module40
#(parameter param61 = ((((&(|(8'ha5))) ? (((8'hb3) ? (7'h40) : (8'ha9)) - ((8'h9d) || (7'h42))) : (|((8'ha4) ? (8'haa) : (8'hb8)))) ? (~|(((8'hb6) ? (8'hb6) : (8'ha7)) ? ((8'hb3) ? (8'ha7) : (8'hab)) : ((8'hb4) < (8'hb2)))) : ((7'h41) > (((8'hb7) ? (8'hb6) : (8'hb6)) <<< ((8'h9e) >= (8'hb0))))) | {(((&(8'ha6)) == {(8'ha1), (8'hbb)}) == ({(8'hb1)} ? (+(8'ha5)) : ((8'ha6) < (8'hbe))))}))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(5'h14):(1'h0)] wire43;
  input wire [(3'h5):(1'h0)] wire42;
  input wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  assign y = {wire60, wire58, wire47, wire46, wire45, (1'h0)};
  assign wire45 = ($unsigned(wire44[(2'h2):(1'h1)]) == $unsigned((((wire44 ^~ wire44) ?
                      $signed(wire44) : (^~wire44)) | $unsigned(wire41[(3'h4):(2'h2)]))));
  assign wire46 = (((((wire41 || wire43) ?
                      wire42[(1'h0):(1'h0)] : (wire42 ?
                          wire41 : wire45)) == $unsigned(wire41[(3'h5):(3'h5)])) ^ $unsigned($signed((wire43 > wire44)))) <<< wire43[(3'h4):(2'h3)]);
  assign wire47 = ({(wire46 ?
                              (~|(wire46 ^ wire45)) : ($signed(wire42) >>> {(7'h44),
                                  (8'ha1)})),
                          $unsigned((-$signed(wire42)))} ?
                      (((8'h9f) >>> $unsigned((wire43 ?
                          wire41 : wire43))) <<< (8'hb6)) : (~^wire45));
  module48 #() modinst59 (.wire52(wire41), .y(wire58), .clk(clk), .wire50(wire47), .wire49(wire45), .wire51(wire44));
  assign wire60 = wire46;
endmodule

module module48  (y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire52;
  input wire [(4'h8):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  input wire [(4'hb):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  assign y = {wire57, wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = wire52;
  assign wire54 = (wire52 ?
                      ((-wire52) >>> wire50) : {$unsigned(((wire52 <= wire50) ?
                              $signed(wire52) : {wire52})),
                          $signed((wire50 ? (wire52 >>> wire51) : (&wire50)))});
  assign wire55 = (8'ha9);
  assign wire56 = (-$unsigned($unsigned((((7'h43) * wire55) ?
                      (|wire54) : wire53[(1'h0):(1'h0)]))));
  assign wire57 = wire51[(2'h2):(1'h1)];
endmodule
