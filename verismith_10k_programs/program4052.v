module top
#(parameter param38 = (({{((8'hb1) ? (8'hbd) : (8'hb1)), (-(8'hbf))}, (8'ha6)} ? (^~((8'hb9) ? ((8'h9c) ? (8'hb8) : (8'hb1)) : ((8'hbe) ? (8'h9e) : (8'ha2)))) : ({((8'ha3) && (8'hab))} == (~^(~(8'hb4))))) ? (^({{(8'ha3)}} ^ ((~(7'h43)) ? ((8'hb1) ? (8'hb0) : (8'hb4)) : (8'hbd)))) : (&(^(^~((8'hbb) ? (8'hbd) : (8'hab)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
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
                 reg5,
                 (1'h0)};
  assign wire4 = (wire2 ? wire2[(1'h1):(1'h1)] : (+wire0[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4[(2'h3):(2'h3)]);
      reg6 <= ({($signed(wire1) ?
              {{wire3}, $unsigned(wire3)} : ($unsigned((8'haa)) ?
                  wire3[(3'h7):(3'h4)] : $unsigned(wire1)))} << (7'h42));
      reg7 <= reg6[(4'he):(1'h0)];
      reg8 <= (wire3 >>> $unsigned($signed(wire4[(2'h3):(1'h1)])));
      if ((&$unsigned((^$unsigned(((8'hb0) ? wire3 : wire2))))))
        begin
          reg9 <= reg5;
        end
      else
        begin
          if (wire3[(1'h1):(1'h1)])
            begin
              reg9 <= (^($unsigned((!reg9[(3'h7):(3'h5)])) ?
                  reg5[(3'h4):(2'h3)] : wire0[(3'h4):(1'h0)]));
              reg10 <= $unsigned($signed($unsigned($signed((reg8 ?
                  (8'hb0) : wire1)))));
              reg11 <= $signed($signed(($unsigned(reg5[(3'h4):(1'h1)]) | ((-reg8) <<< reg6))));
              reg12 <= (&(wire0[(1'h1):(1'h1)] ^~ $unsigned(($unsigned((8'ha2)) != $signed(wire4)))));
            end
          else
            begin
              reg9 <= reg5[(2'h2):(1'h0)];
              reg10 <= reg12[(1'h0):(1'h0)];
            end
          reg13 <= $signed($signed($unsigned($unsigned((reg9 & reg6)))));
          reg14 <= $unsigned((~^(|reg9[(4'hc):(3'h6)])));
          reg15 <= $signed($unsigned(wire2));
        end
    end
  always
    @(posedge clk) begin
      reg16 <= reg14;
    end
  assign wire17 = (reg8[(2'h3):(2'h3)] != ($signed(((reg16 ? reg9 : wire4) ?
                      reg14 : (|reg15))) >= {$signed((reg12 != wire2)),
                      ((&reg14) && $signed(wire4))}));
  assign wire18 = {reg10[(3'h4):(1'h0)]};
  assign wire19 = reg6;
  assign wire20 = $signed(reg14);
  always
    @(posedge clk) begin
      reg21 <= ((~|$unsigned((^~reg6))) ?
          $signed(reg14) : (wire1 ? $unsigned(wire3) : reg13[(5'h13):(1'h1)]));
      if ((($signed({$signed((8'hb3))}) ?
              wire2[(2'h2):(1'h0)] : (^~$unsigned(wire4[(3'h4):(3'h4)]))) ?
          {({(reg16 || reg7), (reg16 ? reg14 : wire2)} && (+{reg5})),
              $signed(wire4[(3'h7):(3'h7)])} : $signed((wire4[(3'h6):(3'h5)] ?
              (!(~&reg6)) : (wire4 ? {wire17} : wire1)))))
        begin
          if (reg7[(1'h1):(1'h1)])
            begin
              reg22 <= reg12[(2'h2):(1'h0)];
              reg23 <= ({$unsigned($signed((~^reg5)))} & reg9[(4'h9):(3'h4)]);
            end
          else
            begin
              reg22 <= {wire0[(3'h7):(3'h5)]};
              reg23 <= (reg6 ?
                  (&reg14) : ((($unsigned(reg14) ? reg10 : $signed(wire0)) ?
                          {$unsigned(reg12)} : ((~reg15) ? reg7 : {wire20})) ?
                      $unsigned($signed((reg14 && reg11))) : $signed(wire2)));
              reg24 <= $signed(reg16);
              reg25 <= (&$unsigned((($unsigned((8'hb0)) ?
                      $signed(reg5) : ((7'h41) >> (8'hbe))) ?
                  (~|wire4[(1'h1):(1'h1)]) : $signed(((8'hb0) && wire17)))));
              reg26 <= ((^~wire20[(3'h6):(2'h3)]) ?
                  $signed(reg6[(4'hd):(4'h9)]) : (8'ha0));
            end
          reg27 <= wire20[(4'hc):(4'hb)];
          reg28 <= reg25[(5'h10):(4'hb)];
          reg29 <= ((~^{reg21}) ?
              $unsigned((+{(wire0 == reg24)})) : ($signed($unsigned($signed(reg10))) ?
                  (reg15[(3'h5):(1'h1)] ^~ $unsigned((+reg28))) : reg12[(2'h2):(1'h1)]));
        end
      else
        begin
          if ((reg8[(3'h6):(1'h0)] && $unsigned({$signed($unsigned(reg24)),
              (reg15 ^ (wire20 ? reg16 : wire0))})))
            begin
              reg22 <= (8'hb7);
              reg23 <= (($signed((reg13[(5'h15):(4'h9)] ^~ (-reg27))) * (&wire18[(3'h4):(1'h0)])) ?
                  ($unsigned((-((8'h9c) << wire0))) <<< ($signed((~reg16)) > reg5)) : {reg24});
              reg24 <= reg28[(3'h5):(3'h5)];
            end
          else
            begin
              reg22 <= $unsigned(reg16[(2'h2):(1'h0)]);
              reg23 <= (~^({(~&reg15)} != (reg27[(1'h0):(1'h0)] >= ($signed(reg21) ?
                  $unsigned(wire17) : {reg10}))));
            end
          reg25 <= ($unsigned(reg25) ?
              $signed((($unsigned(reg9) | $signed(reg29)) ?
                  ($unsigned(wire18) && $signed(reg21)) : $signed($signed(reg6)))) : (({(^~wire18),
                      (reg5 ? wire0 : reg6)} ?
                  $signed(reg11[(4'he):(4'ha)]) : (~|(~|(8'ha0)))) + {((~reg24) ?
                      $unsigned(reg26) : (reg6 ^ wire0)),
                  reg22}));
          reg26 <= reg28[(1'h0):(1'h0)];
          reg27 <= $unsigned($unsigned($unsigned(wire17)));
          reg28 <= reg9[(4'hb):(3'h6)];
        end
      reg30 <= ($unsigned(wire3[(1'h1):(1'h0)]) >>> $unsigned(wire18));
      if (((~$signed({(^reg22)})) >> ({$unsigned((wire18 >> reg14)),
              ($unsigned((8'had)) ?
                  $signed(reg22) : ((7'h41) ? wire17 : reg6))} ?
          $unsigned($unsigned({wire2, wire4})) : (!{$unsigned(reg11)}))))
        begin
          reg31 <= $signed(reg7);
          reg32 <= $unsigned((~^$unsigned((~$unsigned(reg6)))));
          reg33 <= (-(wire17 ?
              (~reg16) : ($signed({reg32}) >= $signed((reg26 ?
                  reg29 : reg8)))));
          reg34 <= (^~(wire0[(1'h1):(1'h1)] >> ($unsigned((reg30 ?
                  reg7 : wire19)) ?
              ($signed((8'ha8)) ? (wire0 && reg14) : reg6) : (~(~reg16)))));
          if ({{{((reg21 ? reg30 : wire4) ? $unsigned(reg9) : $unsigned(reg22)),
                      reg12}},
              ((~$unsigned((~|reg11))) ?
                  $unsigned((!wire20[(4'h9):(3'h7)])) : ($unsigned((reg27 ?
                          wire3 : (8'hb0))) ?
                      (^(~&reg30)) : ($unsigned(reg27) & reg13[(4'h9):(4'h8)])))})
            begin
              reg35 <= ($signed($signed((~^$signed(reg34)))) & ((|(~^reg6[(4'he):(3'h5)])) ?
                  reg26[(3'h6):(2'h3)] : reg16));
              reg36 <= $signed(($signed((^((8'ha3) ^~ wire17))) ?
                  {(-$unsigned(reg14))} : reg7));
            end
          else
            begin
              reg35 <= wire0;
              reg36 <= wire18;
            end
        end
      else
        begin
          reg31 <= (~$unsigned({reg33[(4'h8):(3'h6)], reg34[(1'h1):(1'h1)]}));
          reg32 <= ((^{({reg30, (8'ha4)} + {reg5})}) != (&($unsigned(reg15) ?
              reg30[(4'h9):(3'h4)] : reg34)));
        end
      reg37 <= (~&$unsigned($signed({(~&reg12)})));
    end
endmodule
