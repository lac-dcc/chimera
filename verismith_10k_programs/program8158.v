module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 wire4,
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
                 reg34,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire1[(4'h9):(2'h2)];
  assign wire6 = (^((wire0 ?
                         ((wire2 ?
                             wire3 : wire4) != wire3[(2'h2):(1'h0)]) : $signed({wire1,
                             wire4})) ?
                     (~^$signed({wire3})) : ((-wire5) ?
                         {$signed((8'ha3))} : (!$unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg7 <= (wire0[(4'hf):(3'h5)] ^~ wire3);
      reg8 <= ($signed({(wire4[(5'h11):(1'h1)] >= wire2[(4'h9):(3'h5)])}) ?
          $unsigned($signed($signed(wire5))) : wire2[(3'h6):(1'h0)]);
    end
  assign wire9 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire10 = $signed((~|($signed(wire4) != $signed($signed(wire1)))));
  assign wire11 = (wire3[(3'h6):(3'h5)] ? reg8 : wire0[(3'h6):(1'h0)]);
  assign wire12 = (~{$signed($signed($signed(reg8))), wire1});
  assign wire13 = ($unsigned(wire6[(3'h6):(2'h3)]) ?
                      ({(+$unsigned(reg7))} || ($signed(((8'haa) != wire2)) ?
                          {wire6} : (~(-wire4)))) : (((~(-wire0)) ?
                          wire1[(1'h1):(1'h0)] : wire2) < ($signed((wire1 != wire3)) ~^ (~|wire4))));
  always
    @(posedge clk) begin
      reg14 <= wire6;
      reg15 <= $unsigned($signed((wire10 && $unsigned($unsigned(wire6)))));
      if ($signed((~&(7'h44))))
        begin
          reg16 <= $unsigned($signed((wire0[(3'h4):(3'h4)] ?
              $unsigned($signed((8'ha6))) : ((wire3 ?
                  wire5 : (8'hb7)) - $unsigned(reg15)))));
          reg17 <= $unsigned((~^($unsigned($signed(reg8)) >>> {(reg15 ?
                  reg8 : wire2)})));
          reg18 <= $signed(wire12);
          if ((~$unsigned((wire0[(2'h3):(1'h0)] ?
              $signed((reg15 ? wire2 : wire13)) : wire0))))
            begin
              reg19 <= wire12[(1'h0):(1'h0)];
              reg20 <= (~^$signed((reg16[(5'h11):(4'hb)] ?
                  $unsigned({wire4, wire6}) : ($unsigned(wire5) ?
                      $unsigned(wire5) : {reg15, (7'h41)}))));
              reg21 <= $unsigned(reg19);
              reg22 <= wire10;
              reg23 <= reg8[(3'h4):(1'h0)];
            end
          else
            begin
              reg19 <= ((wire1[(3'h6):(3'h6)] ?
                      (($unsigned(wire0) + $signed((8'ha1))) || (reg8[(3'h5):(3'h5)] != (reg20 == reg20))) : ($unsigned(reg23[(2'h3):(1'h0)]) ?
                          $signed($signed(reg22)) : $signed((wire1 == (8'ha9))))) ?
                  reg17[(1'h1):(1'h0)] : reg22[(1'h0):(1'h0)]);
            end
          reg24 <= {$signed(wire2), wire13[(1'h1):(1'h0)]};
        end
      else
        begin
          reg16 <= (|$unsigned((wire5 == reg19)));
        end
      reg25 <= (~^{$unsigned($signed(reg15))});
      if (((($signed({(8'ha4), reg16}) ?
                  ($unsigned(wire4) ? ((8'h9f) <= reg23) : (^~wire0)) : reg22) ?
              reg18 : reg17[(5'h13):(5'h13)]) ?
          wire3[(3'h6):(3'h5)] : ({$signed((reg21 >= (8'hb8)))} ?
              {$signed((reg15 ? (8'ha6) : reg14)),
                  (~&wire12)} : (~|$unsigned($unsigned(wire3))))))
        begin
          reg26 <= (~$unsigned((8'hb5)));
          reg27 <= ((8'ha8) ?
              (((|(reg7 ? reg25 : reg17)) > wire11) ?
                  ({(reg23 >= wire12), (~^(8'hb5))} ?
                      $unsigned(wire9) : $signed((wire10 ?
                          reg19 : reg18))) : ((^{wire3, wire11}) ?
                      ($signed(reg15) ?
                          $unsigned(wire6) : (reg18 ^~ reg23)) : reg23)) : ((wire11 - ((~^reg16) ?
                  (wire3 ? wire0 : reg25) : reg26)) >> ($signed((reg21 ?
                      wire2 : wire12)) ?
                  wire6 : {reg26[(1'h0):(1'h0)], (reg15 << reg21)})));
        end
      else
        begin
          if ((!(!wire10)))
            begin
              reg26 <= wire13[(1'h0):(1'h0)];
              reg27 <= ((&(wire6[(1'h1):(1'h0)] < (^(wire0 < reg23)))) ?
                  (wire2 ?
                      (^~$unsigned((reg18 ?
                          reg22 : reg19))) : (&{$unsigned(wire9),
                          (-wire10)})) : ($unsigned((8'hb7)) ?
                      wire11[(3'h7):(2'h2)] : (^~(~^(8'ha8)))));
              reg28 <= reg22;
            end
          else
            begin
              reg26 <= {(wire5[(1'h0):(1'h0)] || $unsigned((~|(wire0 >>> reg7)))),
                  reg7};
              reg27 <= (~$signed($unsigned(reg25[(1'h1):(1'h1)])));
              reg28 <= (reg21 ?
                  wire13[(1'h1):(1'h1)] : {reg20[(1'h1):(1'h0)], wire1});
              reg29 <= {{wire11[(4'hb):(1'h1)]}};
            end
          reg30 <= wire4;
          reg31 <= reg7[(4'he):(3'h7)];
          reg32 <= wire11[(3'h4):(1'h1)];
        end
    end
  assign wire33 = {$unsigned($signed(($signed((7'h41)) ?
                          (wire12 ? reg21 : wire4) : $unsigned(wire9))))};
  always
    @(posedge clk) begin
      reg34 <= (+$signed(({$signed(reg21),
          $unsigned(reg24)} != reg24[(4'hf):(1'h1)])));
    end
  assign wire35 = reg15;
  assign wire36 = ($unsigned($unsigned(wire4[(4'he):(1'h1)])) ~^ $unsigned(reg17[(4'hd):(4'hb)]));
  assign wire37 = $unsigned(($signed(reg17) ?
                      $signed($signed((wire2 ?
                          wire33 : reg8))) : ((8'hb7) == wire35[(1'h0):(1'h0)])));
  assign wire38 = {$signed(wire13[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg39 <= $signed($unsigned($signed(wire11[(4'hc):(3'h6)])));
      if ($unsigned(({$signed((reg29 ? (8'hbc) : wire33)),
          (^$signed((8'h9d)))} > $signed($signed($unsigned(reg8))))))
        begin
          if ({wire6})
            begin
              reg40 <= (|(reg17[(3'h4):(1'h0)] ~^ $signed(wire33)));
              reg41 <= $unsigned((-$unsigned({(reg18 ? reg25 : wire11),
                  $unsigned(wire0)})));
            end
          else
            begin
              reg40 <= (&$unsigned(reg17));
              reg41 <= (((~^reg21[(3'h5):(2'h3)]) ?
                      (reg26 < (7'h42)) : (~^$unsigned(reg27))) ?
                  wire35 : (((reg19 && $unsigned((8'hb5))) <<< ((~&(8'hb2)) < (reg32 >= wire9))) & reg24[(5'h10):(1'h0)]));
              reg42 <= (reg23 ?
                  (reg8[(4'ha):(1'h1)] | ({(reg27 ? wire36 : reg27),
                      (reg15 && reg39)} ^ ({reg34, wire0} ?
                      (wire5 ? reg24 : wire12) : (~&(8'hbd))))) : wire9);
              reg43 <= $unsigned(({(wire6 ^~ reg15)} ?
                  $signed({(reg19 ^ reg8),
                      (reg18 && reg34)}) : $signed(reg30[(1'h0):(1'h0)])));
              reg44 <= reg32[(4'h8):(3'h5)];
            end
          reg45 <= ($unsigned($signed($unsigned((wire9 << wire1)))) ?
              $signed((wire5 ?
                  wire12 : $unsigned(reg25))) : {$unsigned((~$unsigned(reg18))),
                  $unsigned($signed((wire13 ? reg16 : wire37)))});
          reg46 <= wire2;
        end
      else
        begin
          if (($signed((wire4 | $signed(reg44))) != $unsigned((~^(~$unsigned(reg29))))))
            begin
              reg40 <= wire2[(4'h8):(3'h4)];
              reg41 <= ((^reg23) ?
                  (~^($unsigned((wire37 ? reg40 : wire10)) ?
                      ($signed(wire5) == (~|(8'h9f))) : ((wire36 ?
                              wire13 : reg17) ?
                          (-wire5) : $signed(reg22)))) : $unsigned(wire38[(4'ha):(4'h8)]));
            end
          else
            begin
              reg40 <= (($unsigned($unsigned((&wire9))) & reg20[(1'h1):(1'h0)]) ?
                  $unsigned(wire2[(1'h1):(1'h1)]) : (($unsigned((reg32 & reg8)) * reg18[(4'ha):(1'h1)]) << $unsigned($signed((reg41 ?
                      (8'ha6) : wire3)))));
              reg41 <= $signed(($unsigned(reg29) ?
                  $unsigned(wire35[(2'h2):(1'h0)]) : {reg17[(2'h2):(1'h1)],
                      $signed($signed((8'haf)))}));
              reg42 <= $unsigned($unsigned((reg44 ? (8'hab) : reg44)));
              reg43 <= (~|reg16[(4'hb):(3'h6)]);
              reg44 <= ((-((^$signed(reg39)) && $unsigned((|reg26)))) ?
                  wire0 : wire1[(4'h8):(4'h8)]);
            end
          reg45 <= $unsigned($unsigned({($signed(wire0) << ((7'h43) ?
                  reg7 : (8'hba)))}));
          if (reg43)
            begin
              reg46 <= wire5;
              reg47 <= $unsigned((^~(+(^reg45[(1'h0):(1'h0)]))));
              reg48 <= (-((+{$unsigned(reg19)}) ?
                  $signed(($unsigned(wire36) * reg25[(2'h3):(1'h0)])) : $unsigned({$unsigned(wire1)})));
              reg49 <= $unsigned(wire33[(5'h10):(2'h3)]);
              reg50 <= ($signed(wire0) ?
                  ($signed($signed((wire13 ?
                      wire33 : wire33))) || {$signed((7'h41))}) : {$unsigned(reg20)});
            end
          else
            begin
              reg46 <= $unsigned(((^(|(-reg46))) ? {reg43} : (~^(~wire3))));
              reg47 <= ((((-{(8'ha9)}) ?
                          (reg42[(4'h9):(4'h9)] ?
                              (reg19 < reg14) : {reg44, reg29}) : reg50) ?
                      ($signed((-wire10)) << reg49[(3'h4):(2'h3)]) : {reg40,
                          $unsigned((reg30 & reg30))}) ?
                  $signed((~&$unsigned((reg30 ?
                      (8'hb0) : reg47)))) : ({$unsigned($unsigned(wire9))} * wire2));
              reg48 <= (reg48 ?
                  ($unsigned(((~reg29) > reg43)) * $signed(wire37[(2'h3):(2'h2)])) : {reg27});
              reg49 <= ($signed(((reg44[(2'h2):(1'h1)] | $signed(reg22)) ^ ((reg27 || reg21) ?
                  wire11 : $signed(reg31)))) >>> {wire9[(2'h2):(1'h0)],
                  ($unsigned((wire12 + (7'h43))) ?
                      $signed(wire5[(1'h0):(1'h0)]) : reg23)});
            end
          reg51 <= $signed($signed(((^~reg27) ?
              $unsigned(wire36[(1'h0):(1'h0)]) : wire1[(3'h7):(3'h4)])));
          reg52 <= $unsigned(wire3);
        end
    end
  assign wire53 = $signed(((8'ha5) >>> reg23[(1'h0):(1'h0)]));
  assign wire54 = (~^(^~(reg52[(2'h2):(1'h0)] >>> ((wire5 ? (7'h44) : wire35) ?
                      $unsigned(reg40) : $signed(wire36)))));
  assign wire55 = reg47[(4'h8):(3'h7)];
  assign wire56 = (((~^$signed($signed(reg31))) ^ wire35[(4'h9):(4'h8)]) << wire9);
  assign wire57 = $unsigned(reg25[(2'h2):(2'h2)]);
endmodule
