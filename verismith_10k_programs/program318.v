module top
#(parameter param61 = ({(-(((7'h41) ? (8'ha0) : (8'hbd)) ^ ((8'hbb) ? (8'ha8) : (8'hab)))), (8'haa)} || ((((~|(8'h9e)) >> ((8'hbe) ? (8'ha5) : (8'hbf))) ? (((8'hb1) != (8'hbb)) >>> ((8'haa) && (8'ha9))) : (((8'hb4) ? (8'h9d) : (8'hb9)) ? (|(8'hbc)) : ((8'hb5) ? (7'h41) : (7'h42)))) ? (|((8'hbd) ? (~&(7'h42)) : ((8'ha0) >= (7'h40)))) : ((((8'h9d) || (8'hae)) <<< ((8'ha1) ? (8'haf) : (8'hbf))) ? ({(7'h40)} | (8'ha6)) : (+(8'ha1))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire13;
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire57,
                 wire13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((~|((8'hbf) ? wire0 : (+wire2))) ?
          (wire0 ^ (-$unsigned(wire3[(3'h5):(1'h0)]))) : $signed((^wire0[(4'hc):(4'h9)])));
      if ({(($unsigned({wire1, wire1}) != (~^(wire3 > reg4))) ?
              (((^(8'hb0)) == wire3) * wire0) : (8'ha3)),
          (reg4[(3'h6):(3'h4)] || ($signed($unsigned((8'ha9))) ?
              wire0 : (wire3 < (wire0 - wire0))))})
        begin
          reg5 <= (+((^((wire0 * (8'ha3)) > $unsigned((8'hb1)))) ?
              (wire3 ? wire1 : (~&((8'hab) ? wire2 : wire2))) : (wire2 ?
                  (&wire3) : ((!(8'hba)) ?
                      wire2[(5'h11):(1'h1)] : (wire1 ? wire3 : wire2)))));
          reg6 <= wire2[(5'h13):(5'h13)];
          reg7 <= $signed({($unsigned((&reg5)) ? wire1 : $unsigned(reg6))});
        end
      else
        begin
          reg5 <= $signed(wire2);
          reg6 <= ((!(^(wire3 ?
              $unsigned((7'h43)) : (reg5 < wire1)))) >> (8'hb6));
        end
      if ({$unsigned(wire2), (|(^(~^(8'h9c))))})
        begin
          reg8 <= {(&wire3[(3'h6):(2'h2)])};
          reg9 <= (!reg5);
        end
      else
        begin
          reg8 <= $unsigned((+$unsigned($unsigned({reg9, reg7}))));
          reg9 <= reg8[(4'hb):(2'h2)];
          reg10 <= {($signed(((8'hb4) ? (reg5 ^~ (8'hb2)) : {wire1, wire0})) ?
                  ($signed($signed(wire1)) ?
                      (^(reg5 << wire2)) : {wire1}) : $signed(reg4))};
        end
      reg11 <= (~$signed($unsigned(reg10)));
      reg12 <= $signed(reg6[(4'hc):(2'h3)]);
    end
  assign wire13 = $signed((reg8[(3'h7):(3'h4)] ?
                      $unsigned($unsigned((&reg12))) : $unsigned(($signed(reg11) != reg12))));
  module14 #() modinst58 (.wire17(reg9), .clk(clk), .wire18(reg10), .wire16(reg6), .y(wire57), .wire15(reg12));
  assign wire59 = {$unsigned($signed(wire13[(5'h11):(3'h7)]))};
  assign wire60 = (reg10[(5'h10):(3'h5)] >>> ($unsigned(((reg10 ?
                              wire1 : wire1) ?
                          (|wire0) : $signed(reg10))) ?
                      reg4 : ((wire57[(3'h5):(3'h5)] & $signed(reg10)) ?
                          $unsigned((wire0 ?
                              reg11 : (8'ha5))) : ((reg6 == wire57) | (wire1 <= reg7)))));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire54;
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire56,
                 wire19,
                 wire20,
                 wire21,
                 wire54,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $unsigned(wire15[(2'h3):(1'h1)]);
  assign wire20 = (wire15 ?
                      (wire18[(3'h5):(2'h3)] ?
                          (({wire19, wire18} ?
                                  $unsigned(wire15) : (wire15 - wire17)) ?
                              $signed($signed(wire16)) : ({wire18,
                                  wire17} - wire18[(3'h7):(1'h1)])) : $unsigned(($unsigned(wire19) ?
                              wire19 : $unsigned(wire17)))) : {(~wire17[(1'h1):(1'h1)])});
  assign wire21 = wire16[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg22 <= {(wire18 ?
              wire18 : ((8'ha5) ?
                  (wire19 ? (wire18 ? (7'h42) : wire16) : wire19) : wire20)),
          wire21[(2'h2):(2'h2)]};
      if ((wire15[(3'h4):(1'h1)] ? $unsigned(wire16) : $unsigned(reg22)))
        begin
          reg23 <= (|($signed($signed(reg22[(3'h4):(2'h2)])) ?
              (wire18 ? $signed((8'hb7)) : wire21) : reg22));
          reg24 <= {(~|((^~wire21) ^ (~reg23[(2'h2):(1'h1)]))),
              wire20[(1'h1):(1'h0)]};
          reg25 <= (wire16 < $signed(((reg22 <= (&wire21)) ?
              $unsigned(wire15[(3'h4):(2'h2)]) : {wire15[(2'h3):(2'h3)],
                  $unsigned(wire18)})));
        end
      else
        begin
          if ($signed($unsigned(wire19[(2'h3):(2'h2)])))
            begin
              reg23 <= {(^~{wire17})};
            end
          else
            begin
              reg23 <= wire17[(2'h2):(1'h0)];
              reg24 <= (((-(8'h9e)) ?
                  (8'ha6) : (reg24[(3'h6):(2'h2)] ^~ wire16[(4'hd):(4'h8)])) <= $unsigned(wire15[(2'h3):(2'h2)]));
            end
        end
      reg26 <= (!$unsigned(({wire19[(3'h4):(1'h0)]} ?
          $unsigned(((8'hac) ? wire15 : reg22)) : (wire19 ? reg24 : reg25))));
    end
  module27 #() modinst55 (wire54, clk, wire18, wire16, reg22, wire19, reg25);
  assign wire56 = $signed($signed($signed(((reg23 ?
                      reg22 : (8'haa)) < wire16))));
endmodule

module module27
#(parameter param53 = {(~&((~&(8'hbc)) ? (((8'hae) < (8'h9d)) ? (+(8'h9e)) : (|(8'hbd))) : (((8'hb4) ? (8'ha7) : (8'hb0)) || ((8'hbd) ? (8'hb9) : (8'hb6)))))})
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire33;
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  assign y = {wire52,
                 wire33,
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
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = wire29;
  always
    @(posedge clk) begin
      reg34 <= ($signed((wire28[(3'h5):(3'h5)] ?
              ($signed(wire29) * $unsigned((8'ha9))) : wire28)) ?
          wire33 : $unsigned(((wire32[(3'h6):(1'h1)] >> (wire31 ?
              wire28 : wire28)) ^~ ($unsigned(wire32) ?
              wire28[(3'h7):(3'h7)] : $unsigned(wire33)))));
      reg35 <= ($signed(({wire30,
              (wire33 * wire33)} ^~ $signed(wire30[(4'hc):(4'h8)]))) ?
          wire29[(1'h1):(1'h0)] : wire32);
      reg36 <= $signed({$signed($unsigned((reg35 > (8'ha2))))});
      reg37 <= (wire28[(4'h9):(3'h6)] ^~ wire32);
      if ($signed(((|((reg37 ? (8'ha0) : wire29) & reg36)) ~^ wire32)))
        begin
          reg38 <= (^~(~^(8'ha5)));
          if (((|reg34) ?
              ((wire33[(2'h2):(1'h1)] ?
                      wire31[(4'h9):(1'h1)] : $unsigned((wire28 ?
                          wire29 : reg34))) ?
                  wire29[(1'h1):(1'h1)] : $unsigned(reg34)) : $unsigned({(((8'hac) != reg34) ?
                      (reg34 ? reg34 : wire31) : (^~wire31))})))
            begin
              reg39 <= ((~$unsigned(({wire28,
                      reg35} * wire28[(1'h0):(1'h0)]))) ?
                  $unsigned({(reg34[(3'h5):(2'h2)] ?
                          (wire33 ? reg35 : reg38) : (-reg37)),
                      ((|(8'hb5)) >> $unsigned(wire33))}) : $unsigned(($signed($signed(wire32)) != ($unsigned(wire28) >= $unsigned(wire30)))));
              reg40 <= $signed(($signed($unsigned((7'h42))) ?
                  (~(reg36 ?
                      (8'ha2) : (reg39 > wire31))) : (~&wire29[(2'h2):(1'h1)])));
              reg41 <= (~|wire31[(4'hc):(2'h2)]);
              reg42 <= $signed(reg41[(1'h0):(1'h0)]);
            end
          else
            begin
              reg39 <= $unsigned($signed(reg38));
              reg40 <= wire31[(5'h11):(4'h8)];
            end
          reg43 <= reg41;
          reg44 <= wire29;
        end
      else
        begin
          if (reg36)
            begin
              reg38 <= {(-reg42),
                  $signed($unsigned(((8'hb2) > $signed(reg43))))};
              reg39 <= {$unsigned((~(((8'hbb) > reg42) ? reg39 : (~^reg39)))),
                  $unsigned(($signed($unsigned(wire30)) < ($signed((7'h44)) ?
                      $unsigned(wire33) : (reg44 || (8'ha6)))))};
              reg40 <= $unsigned((!(reg39 & (reg37 << (wire33 ?
                  reg40 : wire33)))));
            end
          else
            begin
              reg38 <= reg39[(2'h3):(1'h1)];
              reg39 <= ((((|(wire33 ? (8'hbd) : reg40)) ?
                  ((reg41 ?
                      wire29 : (8'ha3)) >> (!wire30)) : ($unsigned(wire31) ?
                      $signed(reg40) : $signed((8'h9d)))) <= (($unsigned((7'h41)) | {wire33}) >>> reg36)) * wire28);
              reg40 <= $unsigned(((wire33[(1'h1):(1'h1)] >> (~|$signed(reg44))) || wire28));
            end
          if ((8'ha9))
            begin
              reg41 <= {$signed($unsigned((^wire30))), (~&(~(-(-(8'hba)))))};
            end
          else
            begin
              reg41 <= $signed($signed($signed(wire30)));
              reg42 <= $signed(reg41[(2'h2):(2'h2)]);
            end
          reg43 <= {reg35};
          reg44 <= $unsigned(((reg42[(4'h8):(1'h0)] & {(wire29 + wire32),
                  (reg37 ? wire29 : reg39)}) ?
              {({(8'hb3)} ? $signed(wire31) : {reg44}),
                  $unsigned($unsigned(reg38))} : $unsigned((~&$signed(reg37)))));
          reg45 <= (reg40[(5'h10):(4'hf)] ?
              reg42[(3'h7):(2'h2)] : reg35[(3'h6):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg46 <= ((7'h44) ?
          (^~(|reg45[(3'h6):(2'h3)])) : $signed(($unsigned(reg40) ?
              reg40[(2'h3):(2'h3)] : (^~{reg44}))));
      reg47 <= reg34;
      if (reg37[(5'h13):(2'h2)])
        begin
          reg48 <= (-(reg41[(2'h3):(1'h0)] ?
              (((|reg34) ?
                  $unsigned((8'ha9)) : reg39[(1'h0):(1'h0)]) != ((~&(8'ha7)) << (~&wire31))) : {reg45,
                  reg47}));
          reg49 <= {reg48[(4'h9):(1'h1)],
              $unsigned({((!wire29) ? wire31[(3'h4):(1'h1)] : (+(8'hab)))})};
          reg50 <= reg42[(5'h13):(1'h0)];
        end
      else
        begin
          reg48 <= {($signed((+reg42[(4'h9):(4'h9)])) <<< $unsigned((~|reg40)))};
        end
      reg51 <= (($signed($signed((~|reg50))) ?
              $unsigned((reg45 != $signed(reg41))) : $signed((~&reg40[(4'ha):(2'h2)]))) ?
          wire29[(2'h2):(2'h2)] : $signed(wire28[(3'h7):(1'h1)]));
    end
  assign wire52 = $signed($unsigned((reg44 ?
                      (reg35 && {(8'ha5), wire31}) : reg49)));
endmodule
