module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
      reg5 <= $unsigned($unsigned(wire3[(5'h10):(4'h9)]));
      reg6 <= {$signed($signed(wire2)),
          {($signed(wire2) >> (|(~&wire2))),
              ($unsigned(wire0[(3'h4):(2'h2)]) ?
                  wire3[(3'h7):(3'h4)] : ((~|reg5) ?
                      (+(8'ha4)) : (wire0 + reg5)))}};
      reg7 <= wire1[(2'h3):(1'h1)];
      if ({wire2, $unsigned(wire0[(1'h1):(1'h1)])})
        begin
          reg8 <= wire4[(4'hb):(4'h9)];
          if (reg5[(2'h2):(2'h2)])
            begin
              reg9 <= (^(^~reg6[(1'h1):(1'h0)]));
              reg10 <= reg6;
              reg11 <= $unsigned($signed((-($unsigned(wire0) >= wire3))));
              reg12 <= (8'ha8);
              reg13 <= (|reg5[(2'h2):(1'h0)]);
            end
          else
            begin
              reg9 <= (^{$signed(reg7), reg12});
              reg10 <= $unsigned(((^~((~^reg11) << (~&(8'h9f)))) ?
                  $signed(reg5[(1'h1):(1'h0)]) : wire4[(3'h4):(2'h3)]));
              reg11 <= $unsigned($signed($signed((reg8 ?
                  {reg7, wire3} : reg13[(3'h7):(2'h2)]))));
            end
          reg14 <= (+((+wire2[(4'hc):(1'h1)]) ?
              $signed((~|(^~wire1))) : reg9[(3'h7):(3'h7)]));
          reg15 <= (~&wire3[(2'h2):(1'h1)]);
        end
      else
        begin
          reg8 <= $unsigned(reg8);
          reg9 <= ((((reg11[(2'h3):(2'h3)] <<< {reg11, (8'ha9)}) ^ (8'hb2)) ?
                  $signed($signed((+(8'hbd)))) : $unsigned($unsigned((~&wire3)))) ?
              (-(7'h40)) : reg15[(4'hd):(2'h3)]);
          reg10 <= $signed($unsigned(($signed($signed((8'hb4))) ?
              wire2[(2'h2):(2'h2)] : (reg12 < $signed(reg5)))));
          if (reg11)
            begin
              reg11 <= (($signed(reg13[(4'hf):(4'hd)]) ?
                      {$unsigned((reg11 ?
                              reg7 : wire2))} : ((reg10[(5'h11):(5'h10)] & $unsigned(reg6)) - $unsigned(reg14[(4'h8):(3'h6)]))) ?
                  $signed(wire1) : $unsigned($unsigned(((wire4 ?
                          (8'ha1) : reg6) ?
                      (~&reg6) : {(8'hba), (8'hb4)}))));
              reg12 <= (reg13[(1'h0):(1'h0)] ?
                  $unsigned((8'hb3)) : wire0[(2'h2):(1'h0)]);
            end
          else
            begin
              reg11 <= reg6[(4'h8):(3'h4)];
              reg12 <= $signed(({$unsigned(reg8[(1'h0):(1'h0)])} << $unsigned(($signed(reg12) ?
                  ((8'ha2) ? reg9 : wire4) : ((8'h9d) * (8'h9d))))));
            end
        end
      if ({reg7[(2'h2):(1'h0)]})
        begin
          if (wire3)
            begin
              reg16 <= (((^~((^~wire3) ^~ wire0)) >>> (((reg11 ?
                              reg5 : (7'h40)) ?
                          reg15[(4'hf):(2'h2)] : (~wire4)) ?
                      $signed(wire1[(1'h1):(1'h0)]) : (8'hba))) ?
                  reg13[(4'hb):(2'h2)] : (-$unsigned(((reg5 ? wire1 : (8'hbd)) ?
                      (|reg6) : wire1))));
              reg17 <= reg15;
              reg18 <= $unsigned((|((-(reg7 - (8'haa))) <<< reg8[(1'h0):(1'h0)])));
              reg19 <= $signed(reg7);
            end
          else
            begin
              reg16 <= $signed(((~^((reg7 < reg13) <= (wire4 && reg18))) ?
                  (&((+reg14) ?
                      (reg16 + (8'hb8)) : wire0)) : reg8[(2'h3):(2'h3)]));
              reg17 <= (((|(reg6 ? reg9 : reg6)) ?
                  {{(reg8 ? reg8 : reg16)}} : {(~|$signed((8'haf))),
                      {(wire2 ? wire3 : reg6),
                          $unsigned(reg6)}}) ^ reg5[(2'h2):(1'h0)]);
              reg18 <= $unsigned((~reg7[(1'h1):(1'h1)]));
              reg19 <= {reg16[(4'h8):(4'h8)]};
              reg20 <= (^~((reg9 >>> $signed($unsigned((8'hb7)))) <= (^~$signed({reg15}))));
            end
          if ((reg15 ?
              {(~&$signed($unsigned((8'hbf))))} : reg16[(3'h7):(3'h7)]))
            begin
              reg21 <= (~(~{reg8, (~|(~^wire1))}));
              reg22 <= (~reg16);
              reg23 <= $signed(reg20);
              reg24 <= (^~(~^(reg11 ~^ reg6)));
              reg25 <= reg18[(3'h6):(3'h6)];
            end
          else
            begin
              reg21 <= (($signed(($unsigned(wire4) ?
                          {reg11} : ((8'hb6) ? reg12 : (8'hbe)))) ?
                      reg16[(2'h3):(1'h1)] : reg12[(1'h1):(1'h0)]) ?
                  reg20 : {(reg10[(3'h4):(2'h2)] >= ($unsigned(reg22) ?
                          (~^reg8) : (reg16 ? (8'ha4) : reg17))),
                      ($signed((reg25 ? reg18 : reg12)) ^~ ($signed(reg7) ?
                          (8'ha4) : reg19[(3'h7):(3'h4)]))});
            end
          reg26 <= ((8'hb0) ?
              (~&reg25[(4'hd):(1'h1)]) : (reg6[(3'h6):(3'h4)] > wire1));
          reg27 <= (((((^~reg19) ?
                      reg15[(5'h11):(3'h6)] : (~reg6)) ^ reg15[(4'hc):(4'hb)]) ?
                  (^$signed(reg6[(4'hd):(4'hc)])) : reg11[(2'h2):(2'h2)]) ?
              $signed(wire3[(4'h9):(4'h8)]) : reg20[(2'h2):(1'h0)]);
          reg28 <= $signed($signed(reg20));
        end
      else
        begin
          reg16 <= $signed(reg16[(4'hb):(2'h3)]);
          if (reg11)
            begin
              reg17 <= wire1[(1'h0):(1'h0)];
              reg18 <= $signed((reg18 ?
                  $unsigned(reg23[(2'h3):(2'h3)]) : reg18[(3'h7):(3'h4)]));
              reg19 <= wire3;
            end
          else
            begin
              reg17 <= $unsigned(($signed(reg27[(4'hb):(3'h7)]) >= reg12));
              reg18 <= ((^~$unsigned(reg23)) * (wire1[(1'h1):(1'h0)] ?
                  reg8 : $signed((reg15[(5'h11):(4'hb)] ?
                      reg14[(4'hf):(4'hf)] : (reg23 ? reg17 : reg27)))));
              reg19 <= $signed(reg22[(2'h3):(2'h3)]);
              reg20 <= (~^(reg21 >> {wire0}));
            end
          reg21 <= (reg11[(5'h10):(2'h2)] | {$signed($signed((~^reg23)))});
          reg22 <= $unsigned($signed($signed($unsigned(((8'ha5) - reg18)))));
        end
    end
  assign wire29 = reg24[(2'h2):(1'h0)];
  assign wire30 = $signed($signed(($signed($signed(reg22)) ?
                      reg16 : (^$unsigned(reg14)))));
  assign wire31 = (({(8'ha7),
                      (reg21 ?
                          reg23[(1'h0):(1'h0)] : reg5)} << $signed((8'hbc))) >>> (!(($unsigned(reg18) ?
                      $signed((7'h41)) : reg5) > ((reg23 << reg9) ?
                      reg11[(2'h2):(1'h1)] : (reg12 ? reg14 : reg19)))));
  assign wire32 = {(8'hb4)};
  assign wire33 = reg28[(4'h9):(1'h0)];
  assign wire34 = {(-{((^(8'hb1)) ? (&reg6) : $unsigned(wire3)),
                          (((8'ha7) + (8'ha6)) - $unsigned(wire29))})};
  assign wire35 = (8'hbd);
  assign wire36 = wire29;
endmodule
