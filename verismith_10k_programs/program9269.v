module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned(wire2[(3'h7):(3'h4)]);
  assign wire6 = wire5;
  assign wire7 = (~(wire0 ?
                     (^($signed(wire4) ?
                         wire2[(2'h3):(1'h0)] : wire0)) : ((7'h42) & ((~^wire4) ?
                         wire2[(2'h3):(1'h1)] : $unsigned(wire5)))));
  assign wire8 = (8'ha1);
  assign wire9 = (8'ha3);
  assign wire10 = $signed($signed($unsigned($signed((wire0 ? wire4 : wire7)))));
  assign wire11 = $unsigned((wire7[(1'h0):(1'h0)] ?
                      $unsigned(wire1[(4'h9):(2'h2)]) : (~^wire1[(4'hd):(3'h6)])));
  assign wire12 = $unsigned($unsigned(wire10));
  always
    @(posedge clk) begin
      reg13 <= (~^wire7);
      reg14 <= $unsigned((wire3 | wire1));
      if ($signed(((~|((reg13 ? wire1 : wire9) ?
              $signed(wire11) : $unsigned((8'h9e)))) ?
          {wire8} : (&wire5[(1'h0):(1'h0)]))))
        begin
          reg15 <= ($unsigned($unsigned($unsigned((reg13 ?
              wire2 : (8'hbe))))) == wire5);
          if ((wire1[(2'h3):(1'h1)] ?
              (^($unsigned(wire5) ~^ ($signed(wire11) ?
                  (wire10 * wire11) : (wire1 - wire8)))) : ($unsigned(($unsigned(wire12) != (wire9 ?
                  reg15 : wire9))) - {$unsigned({wire0})})))
            begin
              reg16 <= $unsigned($unsigned((&(wire6 == $signed(wire12)))));
              reg17 <= (8'hbe);
            end
          else
            begin
              reg16 <= (8'h9c);
            end
          reg18 <= wire10[(5'h10):(2'h2)];
          reg19 <= ($unsigned((~wire11[(1'h1):(1'h0)])) ? (7'h42) : wire10);
        end
      else
        begin
          reg15 <= $signed($signed(wire4[(4'hf):(3'h4)]));
          if (wire5[(3'h7):(3'h4)])
            begin
              reg16 <= (~|$unsigned($signed(wire0[(3'h6):(2'h2)])));
              reg17 <= {$signed($unsigned((8'haf)))};
              reg18 <= (($unsigned({(wire11 ?
                      wire3 : wire10)}) ^~ (-wire2[(3'h4):(1'h1)])) ^~ (wire5[(3'h7):(3'h6)] == (!wire6)));
            end
          else
            begin
              reg16 <= ((8'ha3) ? reg16 : $unsigned(wire8[(1'h1):(1'h0)]));
              reg17 <= (~^($unsigned(wire12[(3'h7):(3'h5)]) ^ $signed($signed((-wire5)))));
              reg18 <= (~{reg13});
              reg19 <= ((|{wire7,
                  $unsigned($signed(reg14))}) >= {($unsigned((+reg19)) ?
                      wire10[(4'he):(1'h0)] : ((wire3 ?
                          reg15 : reg16) <<< $signed(wire8))),
                  (^(reg19 && (reg16 <= reg18)))});
              reg20 <= wire5[(3'h5):(3'h4)];
            end
          reg21 <= $unsigned($unsigned((|$unsigned((reg16 ? wire7 : wire2)))));
          if ($signed(reg20[(1'h0):(1'h0)]))
            begin
              reg22 <= $unsigned(wire5[(3'h5):(3'h4)]);
              reg23 <= $signed((+wire3));
              reg24 <= wire10;
              reg25 <= reg17[(4'hc):(4'h9)];
            end
          else
            begin
              reg22 <= reg14;
              reg23 <= $signed(({(reg14[(3'h6):(3'h4)] <= $unsigned(wire10))} >= (wire3 ?
                  (~|(&(8'ha8))) : ((wire3 || reg22) + (reg21 ^ (8'ha5))))));
              reg24 <= $signed($signed((((~wire6) ?
                      (wire5 || reg16) : $unsigned(wire9)) ?
                  $signed((reg17 ? wire0 : reg21)) : (~|$unsigned((7'h43))))));
              reg25 <= (((reg13[(4'hf):(4'hb)] ?
                      ((~|wire0) <= (~|reg13)) : {(wire1 <<< reg18)}) <<< $unsigned(reg18[(1'h1):(1'h0)])) ?
                  $unsigned($unsigned(((&reg14) > $unsigned(wire12)))) : (wire10[(3'h5):(2'h2)] ?
                      (wire3 ?
                          $signed(reg24[(2'h2):(2'h2)]) : $signed((|wire2))) : wire3[(3'h7):(1'h0)]));
              reg26 <= reg20[(4'h9):(2'h2)];
            end
        end
      if ($signed($signed($signed($unsigned((wire1 ? wire1 : (7'h44)))))))
        begin
          if ((^~$unsigned({(wire3[(3'h4):(1'h0)] ?
                  (&wire5) : $signed(wire6))})))
            begin
              reg27 <= $signed(((wire5[(3'h4):(1'h1)] ~^ wire7) ^~ reg16));
              reg28 <= $unsigned((reg18 ? reg16 : (8'ha8)));
              reg29 <= reg14[(3'h4):(3'h4)];
            end
          else
            begin
              reg27 <= wire10[(5'h12):(4'hd)];
              reg28 <= ($signed(($signed((reg26 ^~ reg21)) ?
                      {(reg18 * (8'hb7)), {wire8}} : ((reg25 ?
                          reg29 : (8'hb9)) << ((8'hbc) ? reg23 : reg16)))) ?
                  wire10 : (^$signed($signed({reg28, (8'hb3)}))));
              reg29 <= (7'h42);
              reg30 <= ($signed((wire2[(4'ha):(3'h6)] ?
                  $signed((8'hbd)) : $unsigned($unsigned(reg17)))) == $signed($unsigned(reg23[(2'h2):(1'h0)])));
              reg31 <= $unsigned((reg26 ?
                  (~&((reg19 ? (8'hb0) : reg18) ?
                      $unsigned(wire4) : (!reg13))) : reg24));
            end
          reg32 <= wire10[(4'h9):(4'h8)];
          if ($signed(reg19))
            begin
              reg33 <= ($unsigned($signed((~^(reg18 >= (8'h9f))))) <= (~|(&(^~(reg29 ~^ reg20)))));
            end
          else
            begin
              reg33 <= $unsigned((8'hb4));
              reg34 <= $unsigned($unsigned((reg31 >> $signed($signed(wire6)))));
              reg35 <= reg30;
              reg36 <= wire11;
            end
        end
      else
        begin
          reg27 <= (((~&(!$signed(reg21))) ?
              (reg16 == $unsigned((~|(8'hac)))) : (($signed(reg18) ?
                  reg17[(3'h6):(2'h3)] : reg16) & $unsigned(reg19[(2'h3):(1'h1)]))) << wire10[(5'h11):(1'h1)]);
          reg28 <= (~^$signed($unsigned((^((8'h9f) ? (8'hbe) : reg21)))));
          reg29 <= $signed({reg23, reg21});
          if (reg15)
            begin
              reg30 <= (~^$unsigned(((reg20 ?
                      (wire8 ? reg13 : reg17) : (~|reg27)) ?
                  ((reg28 ? reg15 : reg31) ?
                      ((8'hb1) ?
                          wire1 : reg32) : reg31[(3'h6):(3'h4)]) : ($signed((7'h40)) ?
                      $signed(reg25) : (~&reg27)))));
              reg31 <= (reg36 && ($signed((8'h9c)) ?
                  $signed(wire7) : (wire1[(4'h9):(1'h0)] > $signed(reg30[(2'h3):(2'h2)]))));
              reg32 <= (reg36[(3'h5):(1'h1)] ?
                  reg14[(1'h0):(1'h0)] : $unsigned(($signed((reg34 ?
                      reg35 : wire11)) ~^ (wire11 ?
                      wire8[(1'h0):(1'h0)] : ((8'hb7) || wire5)))));
            end
          else
            begin
              reg30 <= $signed($unsigned((reg25 >= reg30)));
              reg31 <= reg36;
              reg32 <= $signed(wire2);
              reg33 <= ((((^~$signed(wire9)) ?
                      $unsigned($unsigned(wire10)) : (~|$signed(wire8))) & reg31[(1'h0):(1'h0)]) ?
                  {($unsigned(reg23[(2'h3):(2'h3)]) && wire12[(4'hb):(3'h5)])} : ((wire7[(5'h12):(2'h2)] < $unsigned((reg32 ?
                          wire12 : reg13))) ?
                      (!{$signed(reg31)}) : ((~|(reg34 == reg28)) ?
                          reg16[(4'he):(2'h2)] : wire9)));
            end
        end
    end
  always
    @(posedge clk) begin
      if ((8'ha8))
        begin
          reg37 <= ($unsigned(wire8[(3'h4):(1'h0)]) ?
              (-$signed(wire11[(2'h2):(2'h2)])) : ($signed($signed({wire8,
                      wire0})) ?
                  ($signed((wire5 == reg14)) + {((7'h41) ?
                          reg25 : wire10)}) : {(^~$signed(reg23))}));
        end
      else
        begin
          reg37 <= {reg16[(4'hc):(4'hc)]};
          reg38 <= ($unsigned({(+(wire5 ? reg17 : reg15)),
              (~^reg15)}) == (reg33 ?
              (wire12 != ((!reg31) - (-reg14))) : ($signed($unsigned(reg14)) || $signed((|wire5)))));
          if ($signed(reg30[(4'h8):(3'h7)]))
            begin
              reg39 <= {reg26};
              reg40 <= ((8'hb6) != (reg27 ?
                  ({(reg13 & reg24), $signed((8'ha8))} ?
                      $unsigned((~|reg39)) : reg24) : ($signed(reg34[(2'h2):(2'h2)]) ?
                      ($unsigned((8'ha1)) ?
                          $signed(reg38) : reg22[(1'h1):(1'h1)]) : ((reg27 ?
                              wire8 : wire10) ?
                          ((8'h9e) | reg31) : reg17))));
              reg41 <= $unsigned(wire1[(3'h5):(3'h5)]);
            end
          else
            begin
              reg39 <= $unsigned({($signed(reg35) * (|wire4[(3'h6):(2'h2)])),
                  (($unsigned(reg28) ?
                      $signed((7'h40)) : (wire10 != reg18)) + ($signed(reg13) ?
                      (wire5 ? (8'hb3) : reg33) : (reg41 != reg36)))});
              reg40 <= (8'haf);
            end
        end
    end
  always
    @(posedge clk) begin
      reg42 <= reg21[(1'h1):(1'h1)];
    end
endmodule
