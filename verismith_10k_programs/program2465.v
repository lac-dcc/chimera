module top
#(parameter param39 = ({((~|(-(8'ha2))) >>> (((8'hb1) && (7'h41)) ? ((8'h9c) + (8'ha4)) : (-(8'hbb)))), ((((7'h41) ? (8'hb4) : (7'h42)) ? {(8'hb7)} : (~&(8'h9d))) ? ({(8'h9c)} != (-(8'hb6))) : (~|(+(7'h44))))} ? (-{({(8'ha1), (8'had)} ? (^~(8'h9f)) : (^(8'hb3)))}) : {{(8'hb0)}}), 
parameter param40 = param39)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire0[(3'h4):(1'h1)];
  assign wire6 = $signed((wire0[(2'h2):(2'h2)] << wire3));
  assign wire7 = {(wire5 ? $signed($signed((wire2 > wire5))) : wire2),
                     $unsigned($signed((wire4 ? (7'h44) : $signed(wire2))))};
  always
    @(posedge clk) begin
      if ((wire5 ?
          wire1 : {$signed((~(wire1 ? wire0 : wire5))),
              $signed($signed(wire6[(2'h3):(2'h3)]))}))
        begin
          reg8 <= ((~($unsigned(wire7[(2'h2):(1'h1)]) ^~ wire7[(3'h6):(2'h2)])) ?
              wire6[(3'h4):(2'h3)] : ($signed($signed({wire0, wire0})) ?
                  wire6[(2'h3):(1'h0)] : $unsigned($signed((^wire7)))));
          reg9 <= $signed($signed($signed((~|$signed(wire3)))));
          if ($unsigned((|wire2)))
            begin
              reg10 <= wire4[(1'h1):(1'h1)];
            end
          else
            begin
              reg10 <= reg9;
              reg11 <= wire0[(3'h7):(3'h4)];
            end
          if ($unsigned((($unsigned((wire6 ^~ reg9)) ?
              {wire5} : wire5[(3'h7):(3'h4)]) ^ reg8)))
            begin
              reg12 <= wire4[(2'h2):(1'h1)];
            end
          else
            begin
              reg12 <= $unsigned(wire1);
              reg13 <= ((^{$unsigned(wire3),
                      ($signed((7'h42)) ?
                          wire1[(2'h2):(2'h2)] : $unsigned((8'ha5)))}) ?
                  (~^(((reg12 ? reg10 : wire4) ?
                      (reg11 | reg10) : (wire6 ?
                          reg9 : wire5)) <= ((wire0 | wire1) ?
                      $unsigned(reg12) : (8'hb9)))) : $unsigned(wire5[(1'h1):(1'h1)]));
            end
          reg14 <= wire0;
        end
      else
        begin
          if ($unsigned(wire3[(2'h3):(2'h3)]))
            begin
              reg8 <= (reg8 ^~ (8'hb5));
            end
          else
            begin
              reg8 <= ({wire3, reg14[(4'hb):(3'h5)]} ?
                  (|(~(reg9 >> (reg10 | wire0)))) : ((~&(^~$signed((8'hac)))) >> wire1));
              reg9 <= wire2;
            end
          reg10 <= $unsigned($signed(reg14));
        end
      if (wire0[(3'h7):(1'h1)])
        begin
          reg15 <= (+(+$signed(wire5[(1'h1):(1'h0)])));
        end
      else
        begin
          reg15 <= ($signed(($signed(wire2[(1'h1):(1'h0)]) < (~&reg13))) <= ((~&$unsigned((reg15 ?
                  reg12 : wire7))) ?
              ($unsigned({reg8, (8'hbf)}) ?
                  $signed(wire0[(2'h2):(1'h1)]) : ((8'ha3) ?
                      $unsigned((8'hbc)) : (-reg8))) : {wire2}));
          reg16 <= wire2[(1'h1):(1'h0)];
          reg17 <= wire6[(1'h0):(1'h0)];
          reg18 <= ((&reg14[(5'h14):(3'h6)]) >>> $signed($signed($unsigned($unsigned(wire7)))));
          if ((wire0 ?
              reg17[(5'h13):(4'h9)] : ($signed(((~^wire5) ?
                      (|wire7) : (&reg11))) ?
                  (&(8'hbc)) : wire7)))
            begin
              reg19 <= ((~wire5) ^ {($signed(wire2) ?
                      ({wire2} * {wire4}) : ({reg13, reg13} <<< reg10)),
                  $unsigned(((reg12 ? wire7 : reg9) + (8'h9f)))});
              reg20 <= $signed((8'h9f));
              reg21 <= (|$signed($signed($unsigned((reg16 * reg17)))));
            end
          else
            begin
              reg19 <= ((~^($signed((-reg18)) ^ $unsigned($signed(reg15)))) ?
                  {(wire2[(1'h0):(1'h0)] ?
                          ((wire1 ?
                              wire0 : reg13) << wire4) : (^~$signed(wire3))),
                      $signed($signed((^(8'hb9))))} : ({reg12,
                          $unsigned((reg16 || (7'h41)))} ?
                      wire4[(3'h6):(3'h5)] : {$signed(wire7)}));
              reg20 <= reg21;
              reg21 <= (~^({reg17,
                  $signed(reg21[(1'h1):(1'h1)])} >> $unsigned((reg13[(4'h9):(3'h7)] ?
                  reg16[(3'h7):(1'h1)] : reg8))));
              reg22 <= (~|$unsigned(reg9[(1'h0):(1'h0)]));
            end
        end
      reg23 <= ({((reg12 >>> $signed((7'h43))) ?
              $unsigned((|reg17)) : (~{wire2})),
          ($signed(reg20) ?
              ((wire2 == wire7) ?
                  (~|reg12) : reg20[(2'h3):(2'h3)]) : (^~reg21))} != $signed((^wire1[(1'h0):(1'h0)])));
      reg24 <= (~reg11[(4'hb):(3'h5)]);
      if ({wire6,
          $unsigned((reg24[(4'ha):(4'h9)] ?
              (reg18 ? wire3[(2'h2):(1'h1)] : reg22) : (((8'ha4) ?
                  reg17 : wire6) >= (reg18 ~^ reg10))))})
        begin
          reg25 <= (^~({($signed((8'hb5)) == ((8'hb9) ~^ reg24))} ?
              (^reg23[(2'h3):(1'h1)]) : wire1));
          if ($signed((^$signed((reg22 ?
              $unsigned((8'hbc)) : (reg13 > wire2))))))
            begin
              reg26 <= reg14[(1'h0):(1'h0)];
              reg27 <= $unsigned(((wire5 ?
                      $unsigned($signed(wire0)) : ((|reg9) & $unsigned(reg23))) ?
                  wire0 : reg23));
            end
          else
            begin
              reg26 <= $unsigned(wire3[(2'h2):(1'h0)]);
              reg27 <= $signed((8'hba));
              reg28 <= $unsigned(reg14[(4'h8):(1'h0)]);
            end
          if ((($signed((|(8'had))) ?
                  reg27[(1'h0):(1'h0)] : ((^$unsigned(wire3)) ?
                      (~^reg27) : (8'hb1))) ?
              {$unsigned(((reg19 + (8'hb5)) ?
                      {reg17} : (~&reg14)))} : (&reg19[(2'h3):(1'h1)])))
            begin
              reg29 <= wire2[(1'h0):(1'h0)];
              reg30 <= ((8'hb6) >>> $unsigned(reg22[(4'h9):(3'h4)]));
              reg31 <= (reg10[(1'h1):(1'h1)] ~^ $signed(($signed((wire5 ?
                      reg24 : wire0)) ?
                  reg18[(1'h0):(1'h0)] : wire6)));
            end
          else
            begin
              reg29 <= wire0[(3'h4):(3'h4)];
              reg30 <= reg9;
            end
        end
      else
        begin
          reg25 <= wire3;
          reg26 <= wire5[(3'h7):(3'h6)];
        end
    end
  assign wire32 = $unsigned(reg12[(3'h4):(3'h4)]);
  assign wire33 = $unsigned((reg30[(2'h2):(1'h1)] != $signed($signed($unsigned((8'haa))))));
  always
    @(posedge clk) begin
      reg34 <= ((&(wire32 + reg23[(1'h1):(1'h1)])) ?
          ($signed({$unsigned(reg14), reg14}) < wire33) : $unsigned(wire6));
      reg35 <= (8'hb2);
    end
  assign wire36 = wire6;
  assign wire37 = ((+{reg16, (~^(reg30 | (8'hac)))}) << $unsigned({wire5}));
  assign wire38 = $signed($unsigned($unsigned($signed((!wire32)))));
endmodule
