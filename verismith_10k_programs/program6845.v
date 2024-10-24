module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire41,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire20,
                 wire19,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire4 ?
          ($unsigned(((|wire3) ? wire2 : {wire2, wire2})) ?
              (~&{(wire0 ? (8'hbf) : wire2), $unsigned(wire1)}) : (wire2 ?
                  $signed((^wire4)) : {wire4[(2'h3):(1'h1)],
                      (wire4 ?
                          wire1 : wire1)})) : {$signed(((^wire4) <= $unsigned(wire3)))});
      reg6 <= wire1;
      if (((8'hbb) ?
          (8'hbb) : ($unsigned(((wire4 ? wire3 : wire0) >> {reg6, reg6})) ?
              $unsigned(wire3) : $unsigned(wire0[(1'h1):(1'h1)]))))
        begin
          reg7 <= ($signed(wire1[(5'h10):(3'h6)]) && wire2);
          if ((({reg7[(4'ha):(3'h6)], (~&wire0)} ?
              ($signed((wire2 || reg5)) ?
                  (wire0 ^ (reg5 ? (8'ha6) : wire1)) : (-(reg7 ?
                      wire4 : reg6))) : reg6[(4'h9):(3'h5)]) >>> (($unsigned((wire4 > wire1)) ?
              (8'hbc) : (+(!reg6))) || wire4[(4'h9):(2'h3)])))
            begin
              reg8 <= ({($signed(wire3) ? wire1 : wire4[(4'h9):(2'h3)]),
                      {$unsigned(reg6)}} ?
                  ({{reg7}, $unsigned({wire2, wire3})} ?
                      {{(wire3 ? wire4 : wire2),
                              {reg6,
                                  reg6}}} : wire0[(3'h5):(1'h0)]) : $unsigned(({$signed(wire1),
                      {wire1, wire3}} >= ((wire3 + wire0) >>> wire3))));
              reg9 <= ($signed($unsigned((8'hb4))) ?
                  (~|$signed(reg8)) : {$signed((reg8 == reg7))});
              reg10 <= reg8;
              reg11 <= $unsigned(($signed(($unsigned(wire1) << $unsigned(wire3))) ?
                  (|$signed($signed(reg7))) : reg5));
              reg12 <= (!(wire3 ?
                  (!$signed((|reg7))) : ($unsigned($unsigned(wire4)) * wire1)));
            end
          else
            begin
              reg8 <= (8'ha6);
              reg9 <= wire1;
              reg10 <= $signed($signed((~^$unsigned($unsigned(reg9)))));
              reg11 <= $signed($unsigned(reg12));
              reg12 <= (-$unsigned({$unsigned((reg9 ^ wire4))}));
            end
          if ({$signed(reg12[(2'h2):(2'h2)]),
              ($unsigned($unsigned(wire3[(3'h7):(3'h7)])) >>> (7'h40))})
            begin
              reg13 <= (^reg6);
            end
          else
            begin
              reg13 <= {(reg8[(1'h0):(1'h0)] <= ((&(reg13 ?
                      wire0 : reg11)) != wire2[(3'h5):(1'h1)]))};
              reg14 <= (reg5 ? $signed(reg7) : reg5[(4'hb):(2'h2)]);
              reg15 <= (8'ha6);
              reg16 <= ($unsigned((!$signed({reg15, wire1}))) <= (8'ha0));
              reg17 <= {reg13[(3'h5):(2'h2)], reg5[(1'h0):(1'h0)]};
            end
          reg18 <= (|$unsigned((&reg6)));
        end
      else
        begin
          reg7 <= ({$signed((reg14 ? reg8[(2'h3):(2'h3)] : wire4)),
                  $unsigned(reg8)} ?
              $signed((reg5[(4'hd):(4'hb)] ?
                  (~^wire3) : reg7[(4'hc):(3'h4)])) : $unsigned((~^$signed(reg11))));
        end
    end
  assign wire19 = $unsigned(($signed(((reg5 == reg5) >> (!wire3))) >>> (({reg10} ?
                          $unsigned((8'hb5)) : (8'h9d)) ?
                      ($unsigned(wire3) ^~ (wire3 ?
                          (8'hb7) : reg9)) : ((reg7 && reg15) | $signed(wire1)))));
  assign wire20 = ($signed($unsigned(reg17)) ?
                      ($signed($signed($unsigned((8'hab)))) ?
                          ($unsigned((wire0 ? wire4 : (8'hb2))) ?
                              reg13[(1'h1):(1'h0)] : reg7) : wire3[(4'h9):(3'h4)]) : reg15[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      if (((((^~$signed(wire19)) ?
                  (((8'ha0) - (8'haf)) | {reg16,
                      reg14}) : wire0[(1'h0):(1'h0)]) ?
              (-reg7) : reg11[(3'h5):(2'h3)]) ?
          reg14 : ($signed((&(wire2 ^ reg5))) || wire19)))
        begin
          reg21 <= $signed({(+$signed($signed(reg13))),
              $signed({(wire0 ? reg16 : wire0)})});
        end
      else
        begin
          reg21 <= reg17;
          reg22 <= ($unsigned((reg15[(4'hb):(3'h6)] ~^ ({reg8, reg6} ?
              (wire2 | reg13) : $signed(reg13)))) && $unsigned({wire2}));
          reg23 <= $unsigned(((|$unsigned((wire1 ? wire0 : reg11))) << reg14));
          reg24 <= $signed((8'ha1));
        end
    end
  assign wire25 = {$unsigned($signed((-(~&wire19)))),
                      (~((-$signed(reg23)) ?
                          ($signed(reg24) ?
                              $unsigned(reg6) : $signed(reg24)) : ((!wire20) ?
                              reg9 : {wire3})))};
  assign wire26 = ((reg18 ?
                          $signed((reg13 ?
                              {wire25,
                                  wire2} : $signed(reg13))) : $unsigned(reg16)) ?
                      {(($signed(reg15) ?
                              wire19[(3'h7):(1'h0)] : (~|reg9)) - $unsigned($unsigned(reg6)))} : wire4);
  assign wire27 = $unsigned(reg16);
  assign wire28 = reg21[(1'h0):(1'h0)];
  assign wire29 = ($signed($unsigned($signed((&reg13)))) | $unsigned(($unsigned($unsigned((8'h9d))) ?
                      {(wire27 != wire4)} : (&(reg5 > reg6)))));
  assign wire30 = ($signed(reg10) ? wire0[(2'h3):(2'h2)] : reg5[(3'h6):(1'h1)]);
  assign wire31 = $signed(reg9);
  always
    @(posedge clk) begin
      reg32 <= reg10[(2'h2):(1'h0)];
      reg33 <= (reg18[(3'h4):(3'h4)] << $unsigned($signed(reg24)));
      reg34 <= $unsigned($signed((!reg12)));
      reg35 <= reg9;
    end
  assign wire36 = reg24[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ({(^~(wire28 ^~ wire26[(1'h0):(1'h0)])),
          $signed((&$signed($signed(reg16))))})
        begin
          reg37 <= reg7;
        end
      else
        begin
          if (wire26)
            begin
              reg37 <= $signed(((($unsigned(wire26) ?
                      (~^reg33) : $signed(wire4)) <<< {$unsigned(reg17),
                      $signed(reg7)}) ?
                  reg7[(5'h11):(4'h8)] : reg37[(2'h2):(1'h1)]));
              reg38 <= reg18;
              reg39 <= {((wire25 && (reg15[(3'h6):(1'h1)] >> reg18)) > reg22)};
            end
          else
            begin
              reg37 <= (8'hb3);
              reg38 <= ($unsigned(wire28[(3'h4):(1'h0)]) ?
                  $unsigned(wire26[(4'h9):(3'h7)]) : (&wire26[(3'h6):(3'h5)]));
              reg39 <= $unsigned($signed(((wire29 ?
                  (reg15 ? (7'h44) : (8'hbf)) : (wire29 ?
                      reg10 : wire25)) != (8'ha7))));
            end
          reg40 <= $signed({(^~$signed((reg17 ? reg15 : reg6)))});
        end
    end
  assign wire41 = reg24;
endmodule
