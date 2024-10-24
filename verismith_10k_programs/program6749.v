module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg6 <= ((wire4[(3'h7):(1'h0)] ?
          (($unsigned((7'h44)) ? (~|wire2) : wire3) ?
              wire0 : (wire1 ?
                  wire3 : (wire4 ?
                      wire4 : (8'had)))) : (8'hbc)) && wire2[(1'h0):(1'h0)]);
      reg7 <= (wire1 - ((^(|(~wire2))) ?
          {$signed((wire3 <<< (8'hbc)))} : (~(^$signed(reg6)))));
      reg8 <= (8'hb1);
      reg9 <= ((~^$unsigned($signed($unsigned((8'had))))) ~^ (8'hbb));
      reg10 <= wire2;
    end
  assign wire11 = (+(^reg6));
  assign wire12 = $signed({(~|wire2[(2'h2):(2'h2)]),
                      (reg9[(4'hb):(2'h3)] ^~ $signed((-(8'ha9))))});
  assign wire13 = $unsigned(wire1[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg14 <= reg6;
      reg15 <= reg9[(4'hc):(4'ha)];
      reg16 <= $signed((^reg9));
      if ((reg8 ~^ $signed(reg15[(1'h0):(1'h0)])))
        begin
          reg17 <= ($signed(wire0) || $unsigned(reg9[(4'h8):(1'h1)]));
        end
      else
        begin
          reg17 <= $signed(((&reg9[(4'hb):(2'h3)]) ?
              (((reg8 & wire13) == (wire5 <= reg17)) < ((wire13 < wire0) ?
                  reg6 : wire2[(2'h2):(1'h1)])) : (~$signed({(8'ha3),
                  wire5}))));
        end
    end
  assign wire18 = $unsigned((reg8 ? (!(^$signed(wire3))) : (8'hb5)));
  assign wire19 = $unsigned((~&wire12[(4'hb):(4'h8)]));
  assign wire20 = {$unsigned(((&(wire13 ? wire3 : wire1)) ?
                          (wire18[(4'h9):(3'h6)] ?
                              wire19 : ((8'hb4) >>> wire11)) : (-reg14)))};
  always
    @(posedge clk) begin
      reg21 <= ((-$unsigned({reg10, (wire3 | reg6)})) ?
          $unsigned($signed(($signed(reg14) ?
              $unsigned(reg6) : {reg14, (8'hb5)}))) : (wire18[(3'h4):(1'h0)] ?
              wire13[(5'h10):(3'h4)] : reg14));
      if (reg15[(1'h0):(1'h0)])
        begin
          reg22 <= $signed(wire2);
          reg23 <= reg17[(4'hb):(2'h3)];
          if ($signed($signed(reg8)))
            begin
              reg24 <= $signed($signed((^{{wire19}})));
              reg25 <= ((($unsigned($unsigned((8'h9d))) ?
                      $unsigned((reg23 == reg22)) : reg16) ?
                  (((wire4 > reg7) - (wire3 ?
                      wire0 : reg8)) << ($signed((8'hb3)) ?
                      wire18[(4'hb):(4'ha)] : (~&reg15))) : reg7) < $unsigned((reg8 ?
                  wire3 : (reg23 ^~ (reg22 <= wire3)))));
              reg26 <= (^~$signed(reg25));
              reg27 <= reg14[(4'ha):(4'h9)];
            end
          else
            begin
              reg24 <= ((^~$signed(((~^wire20) ?
                  (wire0 ?
                      reg24 : wire20) : wire3[(3'h5):(1'h0)]))) ~^ (8'hb4));
            end
          if ((((&(reg26[(4'he):(3'h7)] < wire4)) ?
                  $unsigned(reg8) : (+(reg23 >> {reg16}))) ?
              wire0[(2'h2):(1'h1)] : reg10))
            begin
              reg28 <= $signed(reg25);
              reg29 <= reg22;
            end
          else
            begin
              reg28 <= $unsigned(({$unsigned({wire5})} != (~&$unsigned((wire19 ?
                  reg21 : reg17)))));
              reg29 <= reg14;
            end
        end
      else
        begin
          reg22 <= (($unsigned($unsigned(reg7[(3'h6):(3'h6)])) ?
                  $signed(reg25[(3'h6):(1'h0)]) : {wire11}) ?
              wire1[(2'h2):(1'h0)] : $signed($signed(($unsigned(wire0) <= (~|wire11)))));
          if ($unsigned((reg9 & {$signed((~(7'h43)))})))
            begin
              reg23 <= (~^(8'hb7));
              reg24 <= reg21;
              reg25 <= reg16[(3'h7):(3'h5)];
              reg26 <= {($signed(({reg24} ?
                      {reg24} : (reg26 ? wire18 : (8'hb0)))) != {(~|(+reg10))}),
                  reg29[(3'h5):(3'h5)]};
            end
          else
            begin
              reg23 <= (!$signed($unsigned($unsigned(reg21))));
            end
          reg27 <= {(wire20[(1'h1):(1'h1)] & (^((wire20 ?
                  wire0 : wire19) + $unsigned((8'h9e))))),
              $signed(reg17)};
          reg28 <= $unsigned($signed((((+reg26) <<< (+reg10)) ~^ $unsigned(reg25[(1'h0):(1'h0)]))));
        end
      if (reg15[(3'h5):(2'h2)])
        begin
          reg30 <= $unsigned(($unsigned(({(8'ha3),
              wire20} ~^ $unsigned(reg23))) | {$unsigned(reg16[(2'h2):(1'h1)]),
              $signed((reg28 ? wire2 : wire18))}));
          reg31 <= (~wire2[(1'h0):(1'h0)]);
        end
      else
        begin
          if (((~^(|wire0)) - (reg8 ?
              wire3[(2'h3):(2'h3)] : $unsigned(((^reg28) ?
                  wire18[(4'hd):(4'hd)] : (^reg24))))))
            begin
              reg30 <= $unsigned(reg27[(3'h4):(3'h4)]);
              reg31 <= (~(wire2 >>> ((wire5 & $unsigned((8'ha6))) >>> (wire5[(3'h7):(1'h0)] ?
                  {(8'ha8)} : $unsigned(reg8)))));
              reg32 <= (reg6 ^~ $signed($unsigned((~$unsigned(reg17)))));
              reg33 <= ((reg23[(3'h7):(2'h2)] ?
                  (^~wire12[(3'h4):(3'h4)]) : wire3) < reg8[(3'h6):(1'h0)]);
            end
          else
            begin
              reg30 <= $signed({$signed(reg30[(3'h6):(3'h6)]), wire13});
              reg31 <= wire11[(2'h3):(1'h0)];
            end
        end
      reg34 <= $unsigned({(^~$signed({reg33, reg32})),
          ((~&reg23) ^~ $unsigned((&reg22)))});
    end
  assign wire35 = {wire12};
  always
    @(posedge clk) begin
      if (reg9)
        begin
          reg36 <= ((+wire19) ?
              $unsigned({((reg21 ? (8'hbd) : wire12) ^~ (reg17 ?
                      wire11 : wire1))}) : (~|(-{(&(8'hb4))})));
          reg37 <= $unsigned($signed($unsigned(reg14[(4'hb):(3'h4)])));
          reg38 <= $signed(wire13);
          reg39 <= (($unsigned((8'h9c)) ?
                  ((reg32[(3'h7):(3'h4)] <= (reg38 <<< (8'hb6))) && (|(reg9 >>> reg23))) : (wire2 == wire19[(4'hb):(1'h1)])) ?
              ((|($unsigned(reg36) >= $unsigned(wire12))) ?
                  $unsigned(reg30) : $unsigned((8'hb9))) : $signed(wire35));
        end
      else
        begin
          if (((+$signed((((8'hae) ?
              wire19 : (8'h9f)) ^ (reg8 <= reg32)))) ~^ reg10))
            begin
              reg36 <= $unsigned({reg7[(5'h10):(3'h5)]});
              reg37 <= $signed(((~|(&reg27)) ?
                  (~&(&$signed(reg32))) : $signed(reg31[(2'h3):(1'h1)])));
              reg38 <= (|($unsigned((reg14 - (-reg31))) <<< reg36));
              reg39 <= $signed($signed($unsigned(reg33)));
            end
          else
            begin
              reg36 <= (reg29[(1'h1):(1'h1)] ?
                  {$signed((((8'ha9) ? reg22 : (7'h41)) ?
                          wire12[(1'h0):(1'h0)] : wire20)),
                      $signed(reg39)} : (~$signed(reg39[(3'h5):(2'h2)])));
              reg37 <= ($signed(($signed(reg15) - ($unsigned(reg7) ?
                  reg32 : reg16[(2'h2):(1'h0)]))) ~^ $signed(reg38[(2'h2):(1'h0)]));
            end
          reg40 <= $signed(($signed($signed($signed((8'hb7)))) ~^ wire5));
          reg41 <= ($signed((reg34[(4'ha):(3'h4)] ?
              (8'had) : wire19[(2'h2):(2'h2)])) >= (~^($signed((reg27 >> (8'ha8))) == $signed($unsigned((8'h9f))))));
        end
      reg42 <= reg31[(1'h0):(1'h0)];
      if (wire18[(3'h7):(3'h6)])
        begin
          if ((^($signed($signed(wire35)) ?
              $signed({reg22}) : $unsigned(reg28[(1'h0):(1'h0)]))))
            begin
              reg43 <= $signed({(reg34 ? reg29 : (&reg16)), $signed(wire1)});
              reg44 <= (^($signed((^~wire4)) ? reg7 : (!$signed((7'h42)))));
              reg45 <= {reg17};
            end
          else
            begin
              reg43 <= reg22;
              reg44 <= reg9[(2'h2):(1'h1)];
            end
          reg46 <= reg43;
          reg47 <= $unsigned(reg15);
          reg48 <= ({reg32, (&$signed($signed(reg15)))} ?
              {$unsigned(((wire11 ? reg32 : reg16) & $unsigned((8'h9e)))),
                  $unsigned((wire3 ^ reg34[(4'hf):(2'h2)]))} : $signed({reg6[(1'h0):(1'h0)]}));
        end
      else
        begin
          if ({(reg30 ?
                  (~^(^~$unsigned(reg26))) : $unsigned($unsigned((wire4 ?
                      wire19 : reg15))))})
            begin
              reg43 <= $unsigned($unsigned(reg16));
              reg44 <= ($unsigned((reg21[(1'h0):(1'h0)] && (~|(wire19 ?
                      (8'hb8) : reg15)))) ?
                  ($unsigned($signed($signed(reg25))) ?
                      (-($unsigned(wire18) <= (wire19 >> reg6))) : reg40) : (~&($signed((reg31 - reg32)) + ((reg37 ?
                          (7'h43) : reg48) ?
                      (wire2 == wire35) : reg10[(3'h6):(3'h6)]))));
              reg45 <= wire4[(1'h1):(1'h0)];
              reg46 <= ((-(~&$unsigned((^~reg48)))) >> $signed(($unsigned((^~reg42)) << $signed($unsigned(reg8)))));
            end
          else
            begin
              reg43 <= $signed((&(wire4 ?
                  (-reg46[(3'h4):(1'h1)]) : reg46[(4'he):(4'ha)])));
              reg44 <= $unsigned({({{reg38, (8'hb0)}} ?
                      ((~&wire13) | $unsigned(reg47)) : reg9[(1'h1):(1'h0)])});
              reg45 <= {(wire11[(1'h1):(1'h0)] ?
                      $signed(reg41) : {reg26[(1'h1):(1'h0)],
                          ($unsigned(reg24) ?
                              reg6[(2'h3):(1'h0)] : (^~reg34))}),
                  $unsigned((wire2[(2'h2):(1'h1)] + reg41[(4'hf):(4'hb)]))};
            end
        end
    end
  assign wire49 = $signed($unsigned($signed($unsigned(((8'hb6) && wire12)))));
  assign wire50 = $signed($signed(($signed(wire18[(4'he):(4'h9)]) >>> reg16)));
  assign wire51 = (!($signed(((wire0 ? reg16 : reg14) ?
                      wire20[(4'hd):(3'h5)] : (~&wire11))) << (~((+wire2) ?
                      (wire3 * reg21) : (reg25 ? (8'ha1) : wire20)))));
  assign wire52 = reg14[(3'h6):(3'h4)];
endmodule
