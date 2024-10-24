module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire54;
  reg signed [(3'h4):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire12,
                 wire13,
                 wire14,
                 wire54,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({wire3[(5'h11):(4'h8)],
          ($signed($signed(wire1)) ?
              (^$signed((8'ha2))) : (~^(wire3 ? (8'hb9) : wire3)))});
      reg5 <= (8'hb4);
      if ($unsigned((wire0[(1'h0):(1'h0)] & ((~(wire1 ? reg4 : wire3)) ?
          ((~&(8'hbf)) | {wire0, wire3}) : wire2[(4'ha):(3'h5)]))))
        begin
          if (wire0)
            begin
              reg6 <= (^~($signed($signed((&wire0))) || reg4));
            end
          else
            begin
              reg6 <= ((8'ha4) | {($unsigned(reg5[(2'h2):(1'h0)]) || (8'ha5)),
                  $signed($signed(wire0[(5'h11):(4'hd)]))});
            end
          reg7 <= {(~|reg5[(3'h5):(3'h4)]), reg4[(3'h4):(2'h2)]};
        end
      else
        begin
          reg6 <= ({$signed($signed($signed(reg5))), wire0[(4'hb):(1'h0)]} ?
              ((&wire1) ?
                  wire0 : (reg4 ?
                      {(wire2 ^ reg6),
                          wire2[(3'h4):(3'h4)]} : $unsigned((wire3 ?
                          reg7 : reg6)))) : $unsigned((((~(8'hb5)) + wire1) | reg6)));
          reg7 <= {($unsigned((+$unsigned((7'h43)))) < reg6[(4'hd):(4'h8)])};
          reg8 <= (-(~^$unsigned($signed((|reg7)))));
          reg9 <= ((wire2[(4'he):(4'hc)] ? reg7 : (~&wire2)) >= $signed(wire2));
        end
      reg10 <= {(reg8 ? reg8 : $signed($signed($signed(reg6)))),
          wire0[(3'h4):(3'h4)]};
      reg11 <= {$signed({((!wire1) ?
                  (reg8 ? (8'ha1) : wire0) : wire3[(3'h7):(3'h7)])})};
    end
  assign wire12 = wire0;
  assign wire13 = (~&(+(($signed(wire0) ?
                          $signed(wire12) : reg6[(1'h1):(1'h1)]) ?
                      $unsigned(reg10) : ((reg10 ? reg8 : wire3) ^~ {reg7}))));
  assign wire14 = {{{wire12[(4'ha):(3'h5)], $signed((reg11 ^~ (8'haf)))}},
                      $signed(wire3[(5'h13):(4'hb)])};
  module15 #() modinst55 (.wire18(wire2), .wire19(wire13), .y(wire54), .wire16(reg10), .wire17(wire3), .clk(clk));
  assign wire56 = ((reg4 ?
                      (8'hbe) : reg10[(3'h5):(1'h0)]) - ((reg9[(2'h2):(1'h0)] >> $unsigned((8'hb4))) ?
                      (!(reg5[(4'hb):(3'h4)] >> wire12)) : (reg11 ?
                          (reg10 ?
                              {wire2, reg10} : (reg8 ?
                                  reg10 : wire14)) : (~^{reg10}))));
  assign wire57 = wire54;
  assign wire58 = wire2;
  assign wire59 = wire56[(1'h0):(1'h0)];
endmodule

module module15
#(parameter param52 = ((({(|(8'hbc)), ((8'hb3) ? (8'hbe) : (8'h9e))} >= (((8'hae) && (8'hba)) ? (-(8'ha6)) : {(8'hb9), (8'hbc)})) || (({(7'h42), (8'ha0)} ? ((8'hbd) >> (8'hbd)) : ((8'hba) >= (8'ha7))) <= ((!(8'hbc)) ? (~(8'hb9)) : ((8'had) & (8'h9d))))) + (({(~^(8'hab))} ? {(^~(8'ha3))} : (((8'hb2) >> (8'h9e)) ? ((8'hb4) && (8'ha6)) : {(8'h9f), (8'ha8)})) ? ((((8'hb5) ~^ (7'h41)) <<< ((8'ha1) ? (8'ha7) : (8'h9f))) ? (((8'h9e) << (8'hbd)) ? ((8'hb1) <= (8'hbe)) : ((8'hbb) ? (8'ha4) : (8'h9f))) : {((8'hb4) ? (8'ha7) : (8'ha2)), (8'hb2)}) : (8'hbf))), 
parameter param53 = ((param52 ~^ (^~param52)) || {(-param52), (8'ha5)}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire51,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire20 = {{wire18[(1'h1):(1'h1)]}};
  assign wire21 = (wire16[(3'h6):(1'h0)] ?
                      $signed($unsigned($unsigned(wire18))) : ((($signed(wire17) ?
                                  (wire16 ? wire16 : wire20) : (~|wire20)) ?
                              ((wire18 != wire17) ?
                                  wire20[(1'h0):(1'h0)] : (wire18 ^~ wire16)) : ((wire17 <<< wire20) ?
                                  $unsigned(wire18) : (wire17 && wire17))) ?
                          {wire18} : (7'h44)));
  assign wire22 = wire17;
  assign wire23 = {wire20[(2'h2):(2'h2)], wire18};
  assign wire24 = (wire19[(2'h3):(2'h3)] & ($unsigned(($unsigned(wire19) ?
                          $signed(wire17) : (+wire21))) ?
                      ({wire17} ?
                          $signed((wire20 >= (8'ha8))) : (wire22[(1'h1):(1'h0)] == (wire19 ?
                              wire16 : wire17))) : (wire21[(1'h0):(1'h0)] < ((!(8'had)) ?
                          wire22 : $unsigned(wire17)))));
  assign wire25 = $signed((wire16[(4'h8):(4'h8)] ?
                      $unsigned((~^wire24)) : wire17[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      if ((-wire17))
        begin
          if ((wire16 ?
              (((wire22 || {wire23, wire18}) ?
                      $unsigned((wire18 ? wire25 : wire21)) : (((8'ha5) ?
                          wire23 : wire25) ^ (~|wire17))) ?
                  wire19[(2'h2):(2'h2)] : {(&$unsigned(wire21)),
                      ((wire16 * wire17) < (wire16 < wire22))}) : $unsigned($signed({wire16[(3'h6):(1'h1)]}))))
            begin
              reg26 <= (wire24 < ((^~($signed(wire25) - (wire20 >> wire19))) == wire24));
            end
          else
            begin
              reg26 <= (($signed((((8'hae) ^ (8'ha6)) ?
                      wire17 : (wire23 >> reg26))) ?
                  wire16[(4'hc):(3'h6)] : (~|$unsigned(wire19))) > $signed((!$unsigned({(7'h40),
                  wire23}))));
              reg27 <= {((^(((8'hb1) - wire22) << (^wire22))) ?
                      wire16[(3'h5):(2'h2)] : wire23),
                  $signed($unsigned(wire23))};
            end
          reg28 <= (wire18 != wire17);
          if ((wire17 ? wire22[(3'h5):(1'h1)] : wire19[(1'h0):(1'h0)]))
            begin
              reg29 <= (wire19 >> (wire23 ?
                  $signed(wire24) : (~&((~^(8'hbd)) ?
                      wire25 : (wire23 ? wire16 : wire18)))));
              reg30 <= (reg27 ?
                  (-$signed(reg26[(3'h7):(3'h6)])) : $signed(($unsigned($unsigned(wire19)) ?
                      ($signed(wire24) ?
                          (wire21 << wire24) : (-reg26)) : $unsigned(wire18[(1'h1):(1'h1)]))));
              reg31 <= {(^~wire23[(1'h0):(1'h0)]),
                  ((^~(reg28 & wire23[(3'h6):(1'h1)])) * ((^$signed(reg30)) ?
                      wire23[(1'h0):(1'h0)] : wire23))};
              reg32 <= wire23[(1'h1):(1'h1)];
              reg33 <= (&$unsigned($unsigned($signed((wire18 ?
                  reg30 : wire24)))));
            end
          else
            begin
              reg29 <= $signed((wire21 <<< $signed(((wire24 ^ reg26) > {wire23,
                  reg26}))));
              reg30 <= (~|(8'h9d));
              reg31 <= (~&$unsigned((~&(~wire19[(3'h4):(1'h0)]))));
              reg32 <= ((((wire19[(2'h3):(2'h3)] + (reg26 ? (8'hb3) : wire20)) ?
                      ($signed(reg28) >> wire17[(3'h4):(2'h3)]) : (((8'hac) ?
                          (8'ha4) : wire18) ^ (reg32 ?
                          reg26 : wire25))) ^ (^(|(~^wire22)))) ?
                  reg33 : (^reg27));
            end
          if ((^~wire25[(3'h7):(2'h3)]))
            begin
              reg34 <= (((wire16[(4'hc):(1'h1)] == {wire21, $unsigned(reg29)}) ?
                      reg28 : (~reg28[(1'h0):(1'h0)])) ?
                  $unsigned(reg31[(4'hd):(2'h3)]) : (~^wire16[(1'h1):(1'h0)]));
            end
          else
            begin
              reg34 <= (~($signed(((wire18 << reg28) ?
                  wire21[(2'h2):(1'h0)] : $signed(wire24))) * (|wire19)));
              reg35 <= wire20[(3'h7):(1'h1)];
            end
        end
      else
        begin
          reg26 <= (^$signed(($signed({reg34, (8'h9c)}) << (8'hb1))));
          reg27 <= ((({wire20[(4'h8):(3'h5)],
                  $unsigned(reg27)} && wire18) & {$signed($signed(wire22))}) ?
              $signed(wire21) : (^{($unsigned(wire25) >>> wire23[(3'h5):(1'h0)])}));
          reg28 <= ($unsigned(reg29) ?
              ($signed($unsigned((wire16 > reg34))) || $signed((~&(wire23 ?
                  wire23 : (8'ha0))))) : (^~$signed($unsigned(wire16[(1'h0):(1'h0)]))));
          reg29 <= {$signed((reg28 ?
                  $signed((^wire21)) : $signed((wire24 | (8'ha6))))),
              wire22};
        end
      if ((8'hae))
        begin
          if ((~^reg27))
            begin
              reg36 <= (|$unsigned(reg27));
            end
          else
            begin
              reg36 <= wire17[(1'h0):(1'h0)];
              reg37 <= ((8'hb8) > $unsigned($signed((~^wire17))));
              reg38 <= $unsigned(((reg26 ?
                  ($unsigned(wire18) < (|reg32)) : wire24[(3'h5):(2'h3)]) <= (8'hb6)));
              reg39 <= $unsigned(wire18);
              reg40 <= $signed({{wire25[(1'h1):(1'h0)]},
                  ({{wire21}, reg33} ?
                      {(wire20 ^ reg39)} : $unsigned(wire17))});
            end
          reg41 <= ({{{$unsigned(reg36)},
                  $signed($unsigned((8'h9e)))}} << ((8'hae) ?
              wire25 : {wire25[(3'h6):(2'h3)], $signed($unsigned(reg37))}));
          reg42 <= reg26;
          if ((($signed(($unsigned((8'ha0)) <= $unsigned(reg33))) ?
              (~|((~^wire18) ? reg35[(1'h1):(1'h0)] : (-wire25))) : (~&((reg29 ?
                      reg39 : reg39) ?
                  reg38[(2'h2):(1'h0)] : (reg27 - (7'h41))))) < wire19))
            begin
              reg43 <= reg27[(2'h2):(1'h0)];
              reg44 <= (8'had);
            end
          else
            begin
              reg43 <= $unsigned(((^((reg34 ^~ (8'ha4)) ?
                  (reg35 | wire16) : $unsigned(reg34))) < (8'ha1)));
              reg44 <= (reg44 > ((reg32[(5'h10):(4'ha)] != $signed($signed(reg27))) && (((~|(7'h44)) ?
                  $signed(reg44) : wire20) | $signed(reg39))));
              reg45 <= $unsigned(reg44[(2'h2):(2'h2)]);
              reg46 <= ((reg32 ?
                  (-(wire21[(2'h3):(1'h0)] < $unsigned(reg31))) : (reg27[(4'ha):(1'h1)] || $unsigned($signed(wire19)))) * ({(((8'ha3) == (7'h41)) & $unsigned((8'had))),
                  reg28[(3'h4):(2'h2)]} <= reg43));
            end
        end
      else
        begin
          reg36 <= wire23[(3'h6):(1'h0)];
          if ((reg44[(3'h6):(2'h2)] & (-{{$signed((8'hb6)),
                  ((8'hbf) ? wire21 : wire16)}})))
            begin
              reg37 <= $signed(reg31[(4'hd):(4'hb)]);
              reg38 <= $signed((8'ha5));
              reg39 <= reg30[(2'h3):(1'h1)];
            end
          else
            begin
              reg37 <= $unsigned((reg40[(5'h10):(3'h7)] ?
                  (wire23[(1'h1):(1'h1)] || ($signed(reg34) < reg32[(5'h10):(3'h4)])) : {$unsigned(wire23[(1'h0):(1'h0)]),
                      (8'had)}));
              reg38 <= reg45;
              reg39 <= reg37[(2'h3):(2'h3)];
            end
          reg40 <= $signed((reg31 || {$unsigned(((8'had) ? (8'ha1) : reg40))}));
          if ($unsigned((^(!(~^(^~reg37))))))
            begin
              reg41 <= (~^(~^reg31));
              reg42 <= $signed(wire20[(4'h9):(3'h4)]);
              reg43 <= {(^~wire21), $unsigned($signed((|$signed(reg34))))};
            end
          else
            begin
              reg41 <= $unsigned($unsigned($signed($signed((reg31 ?
                  (8'ha8) : wire24)))));
              reg42 <= $signed(reg43);
              reg43 <= $unsigned(wire18);
            end
          reg44 <= $signed((8'hab));
        end
    end
  always
    @(posedge clk) begin
      if (((+$unsigned(($unsigned(reg43) ? (~^reg26) : reg28))) ?
          reg30 : {reg27}))
        begin
          if ({(~&(wire23[(1'h1):(1'h1)] ?
                  $unsigned((wire25 ? reg26 : reg39)) : (^reg35))),
              $signed($unsigned(wire17))})
            begin
              reg47 <= $signed(reg30[(3'h6):(3'h6)]);
            end
          else
            begin
              reg47 <= $signed((^(|$unsigned($unsigned(reg38)))));
            end
          reg48 <= (-$signed((~&wire22[(2'h3):(2'h3)])));
        end
      else
        begin
          if ($signed($signed((~&(-((7'h43) ? reg41 : (8'h9c)))))))
            begin
              reg47 <= reg26[(4'h8):(2'h2)];
            end
          else
            begin
              reg47 <= $signed({$unsigned(reg38)});
              reg48 <= $unsigned(wire23[(3'h5):(3'h5)]);
              reg49 <= ($unsigned($unsigned($unsigned(wire18[(3'h4):(1'h0)]))) <<< $signed($signed(reg46)));
            end
          reg50 <= $unsigned(reg31);
        end
    end
  assign wire51 = reg44[(3'h5):(3'h4)];
endmodule
