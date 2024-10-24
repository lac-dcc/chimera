module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire5,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((~|(^(wire0 + wire2[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ({($unsigned((-wire3[(4'h9):(2'h3)])) ?
                  $signed((~&wire4)) : $signed(({(8'h9e)} | wire2[(4'h9):(2'h2)]))),
              $signed((~$unsigned($unsigned((8'h9d)))))})
            begin
              reg6 <= ($signed($signed(wire2)) ? (+wire1) : (-(8'hb5)));
              reg7 <= wire2[(3'h5):(3'h5)];
            end
          else
            begin
              reg6 <= (wire2[(3'h7):(2'h2)] ? (^(^~(^(+wire0)))) : wire5);
            end
          if ((((+(-$unsigned(reg6))) <<< ($signed(wire1[(1'h1):(1'h1)]) ?
                  ((~wire0) ?
                      (~wire3) : (wire3 ?
                          (8'ha9) : (8'hb7))) : (|wire1[(4'hc):(4'h9)]))) ?
              ($unsigned(wire0) ?
                  $signed((reg7 ?
                      reg7[(2'h2):(1'h0)] : (wire1 >> wire0))) : $signed(wire1[(5'h15):(3'h6)])) : ((~(~$signed(reg7))) ?
                  ($unsigned($unsigned(wire4)) ?
                      (~&wire5) : ($unsigned(wire5) ?
                          {wire5,
                              wire1} : (wire3 || reg7))) : ($unsigned((wire4 ?
                      (8'h9e) : reg7)) ~^ ((wire0 + wire1) <= $unsigned((8'hb5)))))))
            begin
              reg8 <= wire1;
            end
          else
            begin
              reg8 <= {$signed($signed((~^((8'haf) ? wire3 : (8'hb0)))))};
            end
          if (($signed(($unsigned(wire0[(2'h2):(1'h0)]) | (!$signed((8'ha6))))) ?
              (~(^~((^~wire1) ^~ (wire2 <= (8'hae))))) : $signed({($unsigned(reg8) * {reg8})})))
            begin
              reg9 <= {(-(~|$unsigned(reg8)))};
              reg10 <= reg7[(3'h5):(1'h1)];
              reg11 <= reg6[(1'h1):(1'h0)];
              reg12 <= wire3;
              reg13 <= wire1[(4'hd):(4'hc)];
            end
          else
            begin
              reg9 <= ($unsigned(reg12) | (~|(~wire2[(4'h9):(3'h7)])));
              reg10 <= reg6[(2'h3):(1'h1)];
              reg11 <= $signed(((wire5 + wire0[(1'h0):(1'h0)]) & {$signed($unsigned(reg8))}));
            end
          if ((&(-wire2[(1'h1):(1'h0)])))
            begin
              reg14 <= reg11[(3'h7):(3'h7)];
              reg15 <= $unsigned($signed({reg8, $unsigned($signed(reg14))}));
              reg16 <= (wire0 ?
                  reg12 : $unsigned($signed($signed((reg15 ? wire3 : wire2)))));
              reg17 <= ($signed(reg16[(4'h8):(3'h6)]) ?
                  $signed({(~&(8'h9f)),
                      {reg10[(2'h3):(1'h1)],
                          (reg13 && reg10)}}) : (wire0[(1'h0):(1'h0)] <= reg15[(3'h7):(1'h0)]));
              reg18 <= ($unsigned($unsigned((!(reg10 && reg12)))) ?
                  {reg10[(2'h3):(2'h2)]} : reg14);
            end
          else
            begin
              reg14 <= ($signed(reg7) == wire5);
              reg15 <= ((!(&($unsigned((8'hbc)) ?
                      (~&reg15) : (reg16 ? reg15 : (8'hb5))))) ?
                  $unsigned(reg15) : reg9);
              reg16 <= (~$unsigned($unsigned($signed({reg7, reg7}))));
              reg17 <= ($signed((8'hb0)) ?
                  reg6[(2'h2):(1'h1)] : (~$signed($signed((reg8 ?
                      (8'hae) : reg16)))));
              reg18 <= reg16;
            end
          reg19 <= $signed(reg18[(5'h11):(2'h3)]);
        end
      else
        begin
          reg6 <= (~((wire0[(1'h0):(1'h0)] >= $signed(((7'h43) && (8'ha7)))) ?
              ($unsigned(wire1) ?
                  wire5[(3'h4):(1'h0)] : $signed((!wire4))) : (&$unsigned($signed(wire2)))));
          reg7 <= wire5[(1'h0):(1'h0)];
          reg8 <= $signed($unsigned(reg12));
        end
    end
  assign wire20 = ((|(reg12 ?
                      $signed($signed(wire2)) : (~&$signed(wire4)))) * $unsigned(reg16));
  assign wire21 = {$unsigned(($unsigned((reg9 > reg18)) && reg14[(1'h1):(1'h0)])),
                      wire4[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg22 <= (reg15[(3'h5):(2'h2)] ?
          reg6 : $unsigned($signed($signed($unsigned((8'h9c))))));
      reg23 <= {{$unsigned(reg18), $signed((~&{reg7}))}};
      reg24 <= wire4[(4'hb):(3'h6)];
      reg25 <= reg10;
      reg26 <= reg16;
    end
  assign wire27 = ((&$signed(wire3)) ?
                      wire4 : (reg15 <<< (|({wire21} ?
                          ((8'hb7) ? reg9 : reg6) : (reg11 ?
                              wire20 : wire5)))));
  assign wire28 = (!$signed(((8'hbd) < (~((7'h41) ? wire1 : wire20)))));
  assign wire29 = $unsigned(((|$signed((reg14 >>> wire27))) >>> wire21[(1'h0):(1'h0)]));
  assign wire30 = $signed(($unsigned((reg18[(1'h0):(1'h0)] & $unsigned((8'ha1)))) ?
                      (reg22 <= (reg15 == reg22)) : (wire0 ?
                          reg25[(1'h1):(1'h1)] : ((+reg16) ? reg7 : wire0))));
  assign wire31 = ($unsigned((8'hbf)) ?
                      ($signed({(wire0 ~^ reg24),
                          $unsigned(reg6)}) << reg25) : $unsigned(((~^{reg16}) < $signed({reg13,
                          (8'h9f)}))));
  assign wire32 = reg11[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg33 <= $signed({{{reg6[(1'h1):(1'h0)], $signed(wire4)},
              (~&reg17[(3'h4):(2'h3)])},
          (&$signed(wire29))});
      reg34 <= {{reg33[(3'h4):(1'h0)], {$signed({(8'ha1), reg19})}},
          reg17[(3'h7):(3'h7)]};
      reg35 <= $unsigned({$signed({((8'hb1) || (8'h9c)), reg16})});
      if (((^$unsigned($signed((+reg22)))) ?
          (~(^~((~&reg22) ^ $signed(wire32)))) : (^~($signed($unsigned(wire27)) - ($signed(wire1) ?
              {wire31, wire32} : reg17[(2'h2):(2'h2)])))))
        begin
          reg36 <= $signed($unsigned((^~(~|reg15[(4'h9):(4'h9)]))));
        end
      else
        begin
          reg36 <= reg17[(2'h3):(1'h1)];
          if (($unsigned($signed(wire3)) && wire29[(3'h5):(1'h1)]))
            begin
              reg37 <= wire28;
              reg38 <= reg11[(3'h5):(3'h5)];
              reg39 <= (wire21[(4'h8):(3'h7)] ^ $signed(reg18[(2'h3):(1'h0)]));
              reg40 <= reg36;
            end
          else
            begin
              reg37 <= $signed(((8'ha9) ?
                  (wire21[(2'h3):(1'h1)] ?
                      (reg40 + $signed(wire31)) : $unsigned((+reg36))) : ($unsigned({wire32}) ?
                      (+(&reg9)) : $signed(reg39[(3'h4):(3'h4)]))));
            end
        end
      reg41 <= ((~^((~|$signed(reg9)) ^~ ($unsigned(wire30) ?
              $signed(wire29) : {reg18}))) ?
          reg35[(3'h7):(3'h6)] : (($unsigned((wire20 > wire29)) ?
              reg16[(4'hb):(2'h3)] : wire4) ~^ (~|(^(~|(8'ha6))))));
    end
endmodule
