module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 reg9,
                 reg8,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
    end
  assign wire5 = wire3[(3'h6):(3'h6)];
  assign wire6 = {({((~&(8'hac)) ? (wire3 <<< reg4) : (8'hbc))} ?
                         (8'ha2) : wire2)};
  assign wire7 = $unsigned(((-(-(wire5 ^ wire1))) > (~((wire0 >> wire1) ?
                     $unsigned(wire1) : wire3))));
  always
    @(posedge clk) begin
      if ({(^~reg4),
          $unsigned((($signed((8'ha2)) ? (wire0 > wire2) : (~|reg4)) ?
              wire2 : wire0))})
        begin
          if (wire1[(1'h0):(1'h0)])
            begin
              reg8 <= (-((~^((-wire1) == (+wire2))) ?
                  (^(~&wire1)) : (|$unsigned(wire0))));
              reg9 <= (|reg4[(4'hb):(1'h1)]);
              reg10 <= $signed((~|$signed(wire0)));
              reg11 <= wire6[(3'h6):(3'h4)];
              reg12 <= ($unsigned(wire0) < $signed($signed(reg4[(3'h4):(1'h0)])));
            end
          else
            begin
              reg8 <= (!$signed((((-(8'h9f)) ?
                  (8'ha2) : reg9[(1'h1):(1'h1)]) ^ (^reg9[(2'h3):(1'h0)]))));
              reg9 <= $signed($unsigned(reg11));
            end
          if (({{(wire1 ? wire6[(4'h8):(2'h3)] : $unsigned(reg10)),
                      $unsigned((wire2 ? wire1 : reg8))},
                  $signed(reg12[(3'h6):(2'h3)])} ?
              $unsigned($unsigned(($unsigned((8'hb6)) ~^ wire5[(2'h3):(1'h0)]))) : $unsigned(reg9[(1'h0):(1'h0)])))
            begin
              reg13 <= ((reg11 ?
                  wire7 : $signed((~{wire0, wire1}))) <= ((^($signed(reg8) ?
                  ((7'h44) < wire0) : ((8'ha4) == wire3))) | (wire7 ?
                  {{wire5}} : $unsigned(wire5[(2'h3):(1'h1)]))));
              reg14 <= reg8;
              reg15 <= (~|{($signed($unsigned(wire5)) ?
                      (8'ha6) : ($signed(wire1) ?
                          (reg10 ^ wire2) : $signed(reg13))),
                  reg4});
              reg16 <= wire3;
              reg17 <= reg10;
            end
          else
            begin
              reg13 <= (!reg16);
              reg14 <= $unsigned((^~{reg12}));
              reg15 <= (8'hb2);
            end
          reg18 <= ((!reg17) ?
              {reg9[(2'h2):(1'h0)],
                  (reg13 && ($signed(reg4) >> $unsigned(wire3)))} : $signed($unsigned((reg13[(4'hb):(4'hb)] ?
                  (wire2 ? reg14 : wire5) : (+(8'hb6))))));
          if (reg12)
            begin
              reg19 <= reg11[(3'h4):(3'h4)];
              reg20 <= ((wire3[(4'hf):(4'hf)] ?
                      {(8'ha8)} : {(wire7 >= ((8'hbf) ^ wire1)), wire5}) ?
                  $unsigned(reg16[(1'h1):(1'h1)]) : wire3[(4'he):(3'h7)]);
            end
          else
            begin
              reg19 <= ($signed((8'hb4)) & $signed(((~(reg19 & reg10)) ?
                  $signed((reg14 ? wire6 : reg18)) : $unsigned({reg4,
                      reg16}))));
              reg20 <= (wire6 ? (-wire1[(2'h3):(2'h2)]) : $signed(reg4));
              reg21 <= $signed($signed(reg19[(1'h0):(1'h0)]));
            end
          reg22 <= ((^~reg12[(3'h5):(1'h0)]) ?
              $signed($unsigned($signed((reg16 && wire6)))) : $signed(((!wire1[(2'h3):(2'h2)]) && reg13)));
        end
      else
        begin
          if ($signed(((wire3 ?
              {(^wire6),
                  $unsigned(reg18)} : wire5) != {$unsigned((^(8'h9c)))})))
            begin
              reg8 <= (wire5[(1'h1):(1'h1)] > $signed(((~|(wire3 >= wire1)) ?
                  $unsigned(reg20[(4'h8):(3'h5)]) : $unsigned(((8'hb8) << reg16)))));
              reg9 <= $unsigned({(reg21[(3'h5):(3'h4)] ?
                      (reg18 ?
                          (wire5 ?
                              reg21 : reg22) : (^~(8'h9f))) : $signed($signed(reg10)))});
              reg10 <= (~|$unsigned($signed($signed((reg14 ? wire3 : wire0)))));
              reg11 <= reg4[(4'ha):(2'h3)];
            end
          else
            begin
              reg8 <= (~^reg20[(3'h4):(1'h1)]);
              reg9 <= (8'hac);
              reg10 <= $signed((-reg11));
            end
          reg12 <= $signed(wire3[(2'h2):(2'h2)]);
          reg13 <= $unsigned($unsigned((|(~$signed(wire7)))));
          if ({$signed((^$unsigned($signed(reg21))))})
            begin
              reg14 <= $signed($unsigned($unsigned(((8'hb8) ^ reg17[(1'h0):(1'h0)]))));
              reg15 <= (($signed(reg10[(4'h9):(1'h0)]) - $signed(reg14[(4'he):(4'h9)])) < (reg14 == wire2[(1'h0):(1'h0)]));
              reg16 <= $signed($signed(($signed({(8'ha2), reg13}) ?
                  ((wire3 || wire3) != (!(8'hb4))) : ({wire5} | wire0))));
              reg17 <= (^~$unsigned(((-$signed(reg18)) >> (reg15 == $unsigned(reg12)))));
            end
          else
            begin
              reg14 <= (reg13 | $unsigned(($unsigned((wire5 <<< reg19)) ?
                  $unsigned($signed(wire0)) : $signed((reg19 ?
                      (8'haa) : reg12)))));
            end
          reg18 <= ((($signed($signed(reg17)) >> wire6) || (~(+$signed(reg22)))) ?
              $signed(reg20[(4'hb):(1'h0)]) : (~reg22));
        end
      reg23 <= ($unsigned((^~{wire5[(2'h3):(2'h3)],
          (reg22 ^~ (8'hb9))})) >= $signed(reg12[(2'h2):(1'h1)]));
      reg24 <= $unsigned(wire2);
      reg25 <= wire0[(3'h5):(3'h5)];
    end
  assign wire26 = (wire1 ^ (reg14 ?
                      (reg18[(3'h6):(1'h1)] > $signed((-wire1))) : $signed(($unsigned(wire5) & wire5[(1'h0):(1'h0)]))));
  assign wire27 = (+$unsigned((|reg8[(3'h4):(3'h4)])));
endmodule
