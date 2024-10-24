module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire45,
                 wire40,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire0;
  assign wire6 = wire1[(2'h2):(1'h0)];
  assign wire7 = $signed(wire1);
  assign wire8 = (((~(^((8'hbf) < wire3))) ?
                         (|({wire0,
                             wire3} >> (+(8'hbd)))) : (&(~$unsigned((8'hb7))))) ?
                     wire2 : wire1[(2'h3):(1'h0)]);
  assign wire9 = $signed({wire1});
  assign wire10 = (wire4 == (+(7'h41)));
  assign wire11 = (8'hb4);
  always
    @(posedge clk) begin
      if ($signed((!{(wire3[(1'h1):(1'h0)] > $signed(wire1)),
          ({wire10, wire6} ? $unsigned(wire2) : ((7'h43) <<< wire4))})))
        begin
          reg12 <= $unsigned(((wire0[(1'h1):(1'h0)] ?
              ($signed(wire8) < $unsigned(wire2)) : (+$signed((8'hbd)))) > ((((8'hb5) ?
                      wire11 : (8'hb4)) ?
                  wire11[(3'h4):(3'h4)] : {wire10, wire9}) ?
              wire11[(5'h13):(4'h8)] : $signed($unsigned(wire5)))));
          if (wire9[(4'ha):(4'ha)])
            begin
              reg13 <= wire8;
              reg14 <= (^~$signed($signed(wire3)));
              reg15 <= wire11;
              reg16 <= (8'hb9);
              reg17 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg13 <= wire8[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg12 <= (~^$unsigned($signed($unsigned((~|wire4)))));
          if (((reg13[(2'h3):(1'h0)] - reg12[(3'h5):(3'h5)]) ?
              wire10[(4'hd):(4'hc)] : wire1[(1'h1):(1'h1)]))
            begin
              reg13 <= wire9[(2'h2):(1'h0)];
              reg14 <= $signed(wire3);
              reg15 <= $signed(($signed($signed((wire8 << wire11))) ?
                  wire8[(4'h8):(1'h0)] : reg16[(1'h0):(1'h0)]));
              reg16 <= ($unsigned($signed({(reg17 < reg13)})) ?
                  $signed(($signed($unsigned((8'hac))) ?
                      $signed((8'hbe)) : wire5)) : {reg12[(2'h2):(1'h0)],
                      wire5[(1'h1):(1'h0)]});
            end
          else
            begin
              reg13 <= wire9[(3'h5):(1'h1)];
              reg14 <= (&wire5[(2'h2):(1'h1)]);
              reg15 <= reg15;
            end
        end
      if (wire9[(4'ha):(1'h1)])
        begin
          reg18 <= ({((wire10[(5'h14):(3'h4)] * (wire3 ?
                  wire7 : reg14)) <= ((|reg13) << (reg14 ?
                  wire5 : wire10)))} <<< (((8'hbf) ~^ $signed(reg17[(3'h6):(1'h1)])) ^ wire10));
          reg19 <= {$signed((+((wire0 ? wire2 : wire10) ?
                  $unsigned(reg18) : $unsigned((8'ha4))))),
              ($signed({reg15, (^wire3)}) >= wire3[(1'h0):(1'h0)])};
          if ((8'ha0))
            begin
              reg20 <= wire0;
            end
          else
            begin
              reg20 <= (~^wire0);
              reg21 <= (^~((-(~&$unsigned(reg15))) + wire9));
              reg22 <= (!{(^$unsigned(reg18[(3'h4):(2'h3)])),
                  (~&{(wire10 ? wire0 : (8'hb6)), $signed(wire7)})});
              reg23 <= wire3[(1'h1):(1'h0)];
              reg24 <= reg23[(3'h7):(2'h2)];
            end
          reg25 <= wire2[(2'h3):(1'h0)];
          reg26 <= ((($unsigned((!wire6)) ?
                      $unsigned($unsigned((8'ha5))) : $signed({reg18, reg23})) ?
                  (~{(reg14 ? reg12 : wire7)}) : (~|($signed(wire6) ?
                      (^~(8'hba)) : (-wire11)))) ?
              reg23 : ((wire8[(1'h1):(1'h0)] != $signed((|reg18))) ?
                  $unsigned(($unsigned((7'h43)) ?
                      (wire1 ?
                          reg16 : reg20) : wire9[(1'h1):(1'h0)])) : reg13));
        end
      else
        begin
          reg18 <= $signed((($signed({wire5, reg22}) < $unsigned(reg18)) ?
              $unsigned(wire2) : $unsigned({reg18})));
          reg19 <= $signed($unsigned(reg16));
          reg20 <= $signed(($unsigned(wire8) != reg24[(4'ha):(2'h2)]));
          reg21 <= (wire1[(1'h1):(1'h1)] ?
              (|reg17) : ($signed(wire11[(5'h12):(4'hb)]) ?
                  {wire5[(2'h2):(1'h1)]} : ($unsigned($signed(reg26)) ?
                      ({reg18} ?
                          $unsigned(wire7) : reg20) : reg17[(2'h3):(2'h3)])));
        end
      if ((reg24[(1'h0):(1'h0)] ~^ (((reg19 ? wire11 : (wire4 >>> reg16)) ?
              $unsigned(reg13[(3'h4):(3'h4)]) : $unsigned(wire0[(1'h0):(1'h0)])) ?
          (($signed(wire8) ?
              $unsigned(reg17) : (+reg20)) ^ $signed(reg17)) : ((8'ha6) ?
              $signed(reg17[(3'h5):(2'h3)]) : wire0[(2'h3):(1'h1)]))))
        begin
          reg27 <= reg12[(2'h3):(1'h0)];
          if ($signed((^~(&reg12))))
            begin
              reg28 <= (|reg13);
            end
          else
            begin
              reg28 <= {reg27};
            end
          reg29 <= wire7[(1'h0):(1'h0)];
          if (((~(~&(~(reg13 ? reg14 : wire7)))) ?
              {$signed(($unsigned(wire10) < reg21[(3'h6):(3'h4)]))} : wire6))
            begin
              reg30 <= wire6;
            end
          else
            begin
              reg30 <= (!((~&$unsigned((^(8'hbd)))) ?
                  (~|$signed({reg15})) : (!wire6[(4'h8):(3'h4)])));
              reg31 <= ((8'ha9) >> (~&reg16));
              reg32 <= ((wire6[(3'h5):(1'h0)] ?
                  reg12 : (~&{$unsigned(wire10)})) && ((~^reg26) < wire2[(3'h6):(3'h5)]));
              reg33 <= wire7[(4'h8):(3'h4)];
            end
          if (reg15)
            begin
              reg34 <= $signed(($signed(($unsigned(reg32) > $unsigned(reg25))) ?
                  wire4 : $unsigned(($unsigned(reg29) | {(8'hb1)}))));
              reg35 <= ($signed((reg29 < ((~&wire5) >>> $signed(reg18)))) ?
                  $signed(reg16[(3'h6):(2'h2)]) : $unsigned(reg26));
              reg36 <= $signed($unsigned((8'hbe)));
              reg37 <= $unsigned(reg31[(1'h1):(1'h0)]);
            end
          else
            begin
              reg34 <= wire9;
              reg35 <= $signed(((~(!(reg25 ? wire7 : reg23))) ?
                  (+$unsigned($unsigned((8'ha9)))) : wire9));
              reg36 <= reg31;
              reg37 <= ($signed(reg32[(2'h3):(1'h1)]) ?
                  wire2[(4'h8):(3'h7)] : ($unsigned((&(wire4 < wire8))) ?
                      (!(~&reg31[(1'h1):(1'h1)])) : reg20[(3'h7):(3'h7)]));
              reg38 <= reg36;
            end
        end
      else
        begin
          if ($signed((((reg14 ?
              wire10 : $signed(reg27)) <<< $signed($signed(wire3))) || reg26)))
            begin
              reg27 <= ($signed(reg36) ?
                  (7'h40) : ((reg16[(4'hb):(3'h4)] | {reg15,
                          reg18[(3'h4):(1'h1)]}) ?
                      (reg30[(2'h2):(1'h0)] || (^$unsigned(reg12))) : reg27[(1'h0):(1'h0)]));
              reg28 <= reg19[(4'hf):(4'hb)];
            end
          else
            begin
              reg27 <= (^wire1);
            end
          reg29 <= (({{(reg12 || reg22), $signed(reg16)}} ?
              {(!$unsigned(reg37))} : $signed(($signed(reg32) + (&reg29)))) | reg38[(4'ha):(1'h0)]);
          if (((+{((wire8 * reg38) ? $unsigned(reg13) : (reg37 << reg36)),
              {((8'hb1) > reg12), $signed(reg28)}}) > (reg32 ?
              {reg18[(3'h6):(1'h1)]} : (&wire3))))
            begin
              reg30 <= (^~{(reg25 >>> (reg19[(5'h11):(4'ha)] ?
                      $unsigned(reg27) : ((8'haf) < wire4)))});
              reg31 <= (reg18[(5'h10):(4'ha)] != ($unsigned($signed((reg27 | wire9))) ?
                  wire3 : ((~|(-reg18)) ?
                      $signed((reg35 <= reg37)) : (^$unsigned(reg27)))));
              reg32 <= (reg20[(2'h3):(1'h0)] >= (~($unsigned((8'hac)) && (~wire5[(1'h0):(1'h0)]))));
              reg33 <= (!reg29);
              reg34 <= $signed(reg25);
            end
          else
            begin
              reg30 <= reg36;
              reg31 <= $unsigned(($unsigned($signed(reg17)) ?
                  reg15 : ((reg21 >> (reg32 | wire2)) >= reg15)));
              reg32 <= ($signed(({(reg29 ? wire11 : wire6),
                  {wire3, reg16}} ~^ $signed($signed((8'ha8))))) * wire6);
            end
          reg35 <= $unsigned((wire3 ?
              (~|{$signed(reg33),
                  $signed(wire8)}) : ($unsigned($unsigned(reg20)) ?
                  reg31 : (+reg32[(2'h2):(1'h0)]))));
          reg36 <= wire11;
        end
      reg39 <= (~^(($signed($signed(reg32)) & $signed((8'hb9))) ?
          (reg27 ?
              $unsigned(reg33) : reg23[(3'h5):(2'h2)]) : ((8'h9e) & (~&(wire11 ?
              wire9 : wire2)))));
    end
  assign wire40 = {{reg13[(3'h6):(3'h6)], (!(~^reg15))},
                      $signed(($signed((8'ha6)) ?
                          wire10[(4'h8):(2'h2)] : $signed(reg16)))};
  always
    @(posedge clk) begin
      reg41 <= wire3[(2'h2):(1'h0)];
      reg42 <= $unsigned((~|wire8));
      reg43 <= wire5;
    end
  always
    @(posedge clk) begin
      reg44 <= (~|$unsigned((|($unsigned(reg19) ? (+reg27) : $signed(reg12)))));
    end
  assign wire45 = $unsigned(reg30[(1'h1):(1'h0)]);
endmodule
