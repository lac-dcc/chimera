module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = {$unsigned((($signed(wire0) ?
                         $signed(wire2) : {wire3}) >>> wire2[(1'h0):(1'h0)]))};
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      reg6 <= ((~^($signed($signed(wire0)) ?
              ({wire0} - {wire2,
                  wire0}) : (wire0[(2'h2):(1'h0)] >= $signed(wire5)))) ?
          (wire4[(1'h0):(1'h0)] ?
              wire2 : (wire3 ?
                  ($unsigned(wire4) ? wire5 : (wire2 >> (8'had))) : {(-wire2),
                      $signed(wire2)})) : ((&$signed($signed(wire3))) ?
              ((wire3 >= (~&wire0)) ^ (wire4[(1'h1):(1'h1)] ?
                  wire1 : (wire3 >> wire5))) : $unsigned((wire0[(4'hc):(2'h2)] ?
                  (wire0 ? wire3 : wire1) : wire5[(1'h0):(1'h0)]))));
      reg7 <= {wire0[(4'hb):(3'h6)]};
      reg8 <= (-(8'hb5));
    end
  assign wire9 = $unsigned($signed(((|(reg7 ? wire5 : reg7)) ?
                     $unsigned((reg6 ? (8'hb8) : wire3)) : $signed((wire4 ?
                         wire4 : wire4)))));
  assign wire10 = wire3;
  assign wire11 = (|reg6[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg12 <= $unsigned(reg8[(3'h5):(2'h3)]);
      reg13 <= ($signed($unsigned((reg7 ?
          (wire10 | wire9) : (wire10 ? wire2 : reg12)))) > {(((^~wire5) ?
              $unsigned(reg8) : $unsigned((8'ha1))) - ($unsigned(wire2) ?
              wire2[(3'h6):(1'h0)] : (~reg12))),
          (-$signed($signed(wire0)))});
      reg14 <= $signed(wire1);
    end
  assign wire15 = $unsigned(wire10[(1'h1):(1'h0)]);
  assign wire16 = reg14[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if ((wire4[(1'h0):(1'h0)] ?
          (~&$unsigned((~^(wire2 ? wire4 : wire10)))) : ((wire2 ?
              wire2 : (wire4 ? wire5 : wire4[(1'h1):(1'h0)])) | reg6)))
        begin
          reg17 <= (wire5 ? (^(!(8'hbe))) : $signed(wire16[(3'h4):(1'h0)]));
          if (($signed($unsigned($unsigned({reg14, wire9}))) ?
              $signed($signed((-wire11[(2'h2):(2'h2)]))) : $unsigned((+(~((8'h9d) && wire15))))))
            begin
              reg18 <= $unsigned(((~&(reg8[(3'h7):(2'h3)] ?
                  $unsigned(wire10) : (reg6 || wire11))) & reg6));
              reg19 <= $signed(($unsigned(($signed(wire16) != {reg8, reg7})) ?
                  reg12 : ($unsigned($unsigned(reg18)) && $signed({wire4}))));
              reg20 <= ((8'ha2) ?
                  reg8 : ($unsigned((+(-reg6))) ?
                      wire10[(1'h1):(1'h0)] : $unsigned((&$signed(reg7)))));
              reg21 <= (reg20 ?
                  (reg20 && reg18[(4'h9):(4'h9)]) : {$unsigned(((^~(8'hbd)) - (wire16 << reg20)))});
              reg22 <= ((~^{wire3[(4'h8):(1'h0)],
                  $unsigned($signed(wire5))}) << (((^~$unsigned((8'hbe))) ~^ reg6) ?
                  $signed($unsigned((reg12 ?
                      wire1 : wire0))) : ($unsigned({wire3, (8'hac)}) ?
                      ($unsigned(wire3) ?
                          $signed(wire9) : $unsigned(reg14)) : wire0)));
            end
          else
            begin
              reg18 <= (~$signed(reg8[(5'h10):(3'h4)]));
              reg19 <= (wire2[(1'h1):(1'h0)] >>> ($unsigned($signed({reg19,
                      reg19})) ?
                  $signed((8'ha4)) : reg17));
              reg20 <= $signed({(|$unsigned($unsigned(reg12)))});
              reg21 <= $signed($signed($unsigned((&$unsigned(reg12)))));
              reg22 <= (~(($unsigned((reg19 ? wire0 : reg6)) ?
                  reg13 : $signed($unsigned((8'ha0)))) < $unsigned(({reg7,
                  reg21} >> (~&reg13)))));
            end
          if ({{((((8'hb5) < wire4) >>> reg13[(2'h2):(1'h0)]) || (wire11 >= $unsigned((8'h9c)))),
                  wire3[(4'hf):(3'h6)]}})
            begin
              reg23 <= reg21[(4'hc):(4'h8)];
              reg24 <= (~&$signed(wire15[(2'h3):(2'h2)]));
              reg25 <= {$unsigned(({((8'h9e) & wire16)} ?
                      $signed(((8'hbd) << reg12)) : reg21)),
                  ((reg20 ?
                      (^(wire16 ? wire15 : wire5)) : (!(reg13 ?
                          wire4 : wire9))) ^ $unsigned($unsigned((^reg6))))};
              reg26 <= wire0;
            end
          else
            begin
              reg23 <= $signed($signed((((|reg25) ?
                  reg22 : wire4) >> reg19[(1'h0):(1'h0)])));
            end
          reg27 <= (-reg18[(3'h7):(2'h2)]);
        end
      else
        begin
          if ((wire4[(1'h0):(1'h0)] ? wire4[(2'h2):(1'h1)] : wire0))
            begin
              reg17 <= ((((&(+(8'hb8))) << wire15[(2'h3):(2'h3)]) >>> wire0) ?
                  wire10[(2'h2):(2'h2)] : (((reg8[(3'h5):(1'h0)] < (|(8'hba))) ?
                          {$unsigned((8'ha3))} : (^~(reg13 ? reg25 : reg21))) ?
                      $signed($unsigned($signed(wire2))) : $unsigned(({reg13} ?
                          $unsigned(wire9) : reg27))));
              reg18 <= (8'hbd);
            end
          else
            begin
              reg17 <= (8'ha3);
              reg18 <= wire0;
              reg19 <= (reg7[(3'h7):(2'h3)] ? wire11 : reg13);
            end
          reg20 <= wire2;
        end
      reg28 <= ((wire15[(1'h0):(1'h0)] ^~ (~&{(reg22 ? wire11 : wire10),
              $signed(wire15)})) ?
          wire9[(1'h1):(1'h0)] : $signed((~^(((8'hbc) ? reg22 : reg12) ?
              (reg8 ? reg24 : reg19) : reg12[(5'h11):(3'h6)]))));
    end
  assign wire29 = (^reg26);
  always
    @(posedge clk) begin
      reg30 <= (^~((^~reg20[(4'hc):(2'h2)]) ?
          {(-reg27[(1'h0):(1'h0)]), (^wire1[(2'h3):(1'h1)])} : $signed(reg23)));
      reg31 <= reg26;
      reg32 <= wire15[(1'h1):(1'h1)];
      reg33 <= (wire29 || ({((reg31 ? reg26 : (8'ha1)) ?
                  (wire9 >> reg14) : ((8'h9d) == reg13))} ?
          (8'had) : (reg24[(3'h4):(2'h3)] < (((8'hb9) - reg31) >>> wire10[(1'h1):(1'h1)]))));
      reg34 <= wire16;
    end
  assign wire35 = (+$unsigned(reg32[(2'h3):(2'h3)]));
  assign wire36 = {({{(reg18 >> reg8), $signed(reg27)}} ?
                          ($unsigned((reg12 ? wire29 : (8'hb3))) ?
                              reg27 : ((reg12 ?
                                  reg18 : wire9) ~^ $unsigned(wire15))) : $signed($signed((wire1 ?
                              reg24 : reg30)))),
                      $unsigned((+wire2[(4'h8):(2'h2)]))};
  assign wire37 = wire36[(3'h7):(3'h4)];
  assign wire38 = wire16;
  assign wire39 = reg34[(2'h2):(1'h1)];
  assign wire40 = $signed({((+$signed(reg30)) ?
                          {(reg31 + (8'hbd)), (8'hba)} : (reg24[(3'h4):(1'h0)] ?
                              reg12[(4'hf):(1'h1)] : ((8'ha4) <= wire10))),
                      $signed(reg22)});
  assign wire41 = $signed(reg33[(5'h10):(4'h8)]);
  assign wire42 = (reg8 << $unsigned(((+reg28[(3'h5):(2'h3)]) ?
                      $signed($signed(wire9)) : $signed(wire40))));
endmodule
