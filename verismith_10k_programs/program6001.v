module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
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
                 reg11,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (&wire2);
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= $signed(wire4);
      reg7 <= (~wire2[(1'h1):(1'h1)]);
    end
  assign wire8 = ((~reg6) ?
                     (($unsigned(reg6) ?
                             ((~|wire3) ~^ (~&wire5)) : ((reg7 << wire0) ?
                                 {reg7} : (wire0 ? (8'hb2) : wire4))) ?
                         $signed($unsigned($unsigned(reg6))) : wire0) : $signed((-{$unsigned((8'h9d)),
                         reg7[(3'h4):(3'h4)]})));
  assign wire9 = {($unsigned(reg7[(4'h8):(3'h7)]) * ((^~(!reg6)) * ((8'hb6) ?
                         (wire1 ? wire8 : wire3) : wire8))),
                     $unsigned((+(&(7'h40))))};
  assign wire10 = $signed((wire8[(3'h4):(1'h1)] + $unsigned(((wire2 | wire3) ?
                      wire9[(4'hf):(4'hf)] : $unsigned(wire4)))));
  always
    @(posedge clk) begin
      if ((wire0 ?
          (((~^$unsigned(wire1)) ?
                  $unsigned($unsigned(wire4)) : ({wire4} ~^ (wire4 || wire10))) ?
              wire3 : (^~wire5)) : {$signed(wire2)}))
        begin
          reg11 <= $signed((~wire5));
          reg12 <= ((^$signed((-wire0))) <<< wire3);
        end
      else
        begin
          reg11 <= reg7[(3'h5):(2'h3)];
          reg12 <= (-wire0[(4'h9):(4'h9)]);
          if ($signed($signed($unsigned((wire2[(2'h2):(1'h1)] < {reg12,
              wire4})))))
            begin
              reg13 <= wire8[(1'h0):(1'h0)];
              reg14 <= wire9[(4'h9):(4'h8)];
              reg15 <= $unsigned(reg7);
            end
          else
            begin
              reg13 <= reg14;
              reg14 <= {(wire8 * (~&reg12)),
                  {wire8, ($signed({reg15}) ? reg12 : (~^(reg7 != reg6)))}};
            end
        end
      if (wire3)
        begin
          reg16 <= ((reg6[(1'h0):(1'h0)] ?
                  $signed(reg12) : $signed(($signed(reg11) * $signed(wire8)))) ?
              (^(~^({(8'hac), (8'hbf)} ?
                  $unsigned(wire5) : reg11))) : $unsigned({$signed(wire2)}));
        end
      else
        begin
          if ((({($unsigned((8'ha8)) << (wire3 << (8'hb2)))} && ((-wire2[(2'h2):(1'h1)]) && wire0)) < $unsigned(reg6[(2'h2):(2'h2)])))
            begin
              reg16 <= (~|wire8);
              reg17 <= ($signed(reg16) - reg16);
              reg18 <= $signed((reg11 - $signed({$signed((8'hb4)),
                  $unsigned(wire9)})));
              reg19 <= (8'hbd);
              reg20 <= (|((&reg12) || (~|$signed((reg19 ? wire8 : wire2)))));
            end
          else
            begin
              reg16 <= $unsigned($signed(((wire5[(2'h2):(2'h2)] ?
                      reg13[(2'h3):(2'h2)] : (~^reg14)) ?
                  {(~^reg16), (+reg19)} : $unsigned((wire10 == wire3)))));
              reg17 <= $signed($unsigned(($unsigned(((8'hb7) ? reg17 : reg12)) ?
                  (8'ha3) : $unsigned((wire10 <<< wire4)))));
            end
          reg21 <= (reg11 >= $signed({wire9}));
          reg22 <= {(8'ha1), $unsigned(wire2[(1'h1):(1'h0)])};
          reg23 <= (((~|$signed((reg7 ?
              wire10 : reg14))) && $signed(reg18[(4'he):(3'h4)])) | reg16[(4'h8):(3'h7)]);
          reg24 <= ($signed((((wire10 ? reg20 : wire0) ?
                  $unsigned(wire5) : {(8'ha8)}) << ($signed(reg19) ?
                  (reg21 << (8'ha7)) : (wire5 ? reg22 : wire0)))) ?
              $unsigned(reg19[(3'h7):(3'h5)]) : ($signed(({(8'haf)} ~^ (8'hb4))) ?
                  ((8'h9e) ?
                      reg17[(3'h5):(1'h1)] : (!(reg14 ?
                          wire9 : reg23))) : $unsigned(($unsigned(reg13) ?
                      reg19[(1'h0):(1'h0)] : (wire1 ? reg11 : reg17)))));
        end
      reg25 <= (reg22 ?
          $unsigned($unsigned($unsigned($signed(wire1)))) : reg23[(1'h1):(1'h0)]);
      reg26 <= ((&$unsigned($unsigned(reg19))) ^~ ((7'h41) * $unsigned(reg23[(4'h9):(4'h9)])));
    end
  assign wire27 = $signed({(((reg17 != reg11) ?
                          $signed((7'h41)) : $signed(reg23)) * reg26)});
  assign wire28 = reg15[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      reg29 <= {($signed(((reg14 >>> wire5) ?
              ((8'hb6) ? reg24 : reg14) : $signed(reg21))) == ($signed((wire8 ?
                  reg16 : wire8)) ?
              reg25[(5'h10):(4'h8)] : wire2[(2'h2):(2'h2)])),
          (~((~^(wire28 + reg11)) ?
              reg25[(3'h4):(1'h1)] : (+(reg13 ? wire4 : wire10))))};
      reg30 <= (((reg11[(1'h1):(1'h0)] >= (reg21[(3'h4):(1'h1)] - reg18)) ?
              wire9 : (^~(~&(reg21 ? wire1 : (7'h42))))) ?
          {$signed({(+wire4), reg11[(3'h7):(3'h4)]}),
              reg7} : (&$unsigned($unsigned($signed(reg22)))));
      if (reg25)
        begin
          reg31 <= $unsigned($unsigned(reg29));
        end
      else
        begin
          if ((~&{{$signed(wire4[(2'h2):(2'h2)]), $unsigned((|reg23))}, reg24}))
            begin
              reg31 <= reg14[(4'hb):(4'h8)];
              reg32 <= $unsigned(reg16[(3'h7):(3'h5)]);
            end
          else
            begin
              reg31 <= {$unsigned($unsigned(reg22)),
                  ((&$signed((~&wire4))) ?
                      (reg21[(2'h3):(2'h2)] ?
                          (|reg30) : reg15[(4'hc):(1'h1)]) : {((-(8'hb9)) - (wire2 & reg17)),
                          (^~(|wire0))})};
              reg32 <= (((($unsigned(reg11) || {reg22}) ?
                          $unsigned(reg14[(1'h0):(1'h0)]) : (~$unsigned(wire27))) ?
                      ($signed($signed(reg18)) < (reg29[(2'h3):(1'h1)] ?
                          reg16[(4'h8):(3'h5)] : reg22)) : ({(reg19 - wire3)} << ($signed(reg19) >> (reg20 ?
                          reg13 : reg30)))) ?
                  reg14 : (8'hab));
              reg33 <= (7'h44);
              reg34 <= ($signed({{reg31}}) ?
                  reg33[(3'h6):(3'h5)] : (~^(($signed(reg12) ?
                      ((8'hb8) ? reg6 : reg14) : (wire8 ?
                          wire3 : reg32)) >= (8'hb7))));
            end
          if (wire9)
            begin
              reg35 <= reg29[(2'h2):(1'h1)];
              reg36 <= (-$signed($signed((^~$signed((8'hb6))))));
              reg37 <= reg22;
              reg38 <= reg34[(3'h4):(1'h1)];
            end
          else
            begin
              reg35 <= ({reg20[(4'h8):(3'h4)], reg16} << (reg25[(4'hc):(3'h5)] ?
                  $signed($signed(reg7[(3'h4):(2'h3)])) : reg19[(3'h4):(3'h4)]));
              reg36 <= wire10[(2'h2):(1'h1)];
            end
          reg39 <= ($unsigned((~&(|(^reg12)))) >= wire4[(1'h1):(1'h1)]);
          reg40 <= {($unsigned(($unsigned(reg26) - $signed(wire9))) != (|wire10))};
        end
      reg41 <= (&$unsigned((~^(&$signed(wire10)))));
      reg42 <= reg32;
    end
endmodule
