module top
#(parameter param36 = (-({{(~(8'h9c)), ((8'ha7) ? (8'hb2) : (8'hae))}, ({(8'ha8)} ? ((8'hbc) ? (8'haf) : (8'ha3)) : ((8'hb2) ? (7'h42) : (8'ha5)))} < (({(8'hb1), (8'haa)} > ((8'ha4) == (8'hb8))) ? {(8'hbb), (&(8'hbe))} : {{(8'hbb)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ($signed({wire3, (~^$signed($unsigned(wire2)))}))
            begin
              reg5 <= {($unsigned($signed(wire3)) >>> wire0[(4'hd):(1'h0)]),
                  (+wire3[(3'h5):(3'h4)])};
              reg6 <= wire4;
              reg7 <= wire2;
              reg8 <= wire4[(1'h0):(1'h0)];
              reg9 <= wire1;
            end
          else
            begin
              reg5 <= $signed($signed($unsigned((!(wire1 ? reg6 : reg5)))));
              reg6 <= ($signed($signed(reg7)) >> reg9[(2'h2):(2'h2)]);
              reg7 <= $unsigned((&reg6));
              reg8 <= (~|$unsigned((($signed(wire1) <<< $signed(reg9)) ?
                  {$signed(wire1), wire1[(1'h0):(1'h0)]} : {{wire2,
                          (8'hb9)}})));
              reg9 <= (^~(^$signed((+$unsigned(reg6)))));
            end
          if ((reg7 ?
              (8'hb3) : (($signed((^~(8'haf))) * $unsigned((wire0 ^ (8'ha6)))) ?
                  {{reg7[(2'h2):(2'h2)]}} : $signed((((8'hac) >> reg5) ?
                      $signed(reg5) : (~^(7'h44)))))))
            begin
              reg10 <= (reg8 - $signed((((~(8'ha8)) ?
                  reg7[(2'h3):(2'h2)] : {wire4}) * ((8'ha5) ?
                  $signed(reg6) : (wire4 ? (8'hbd) : reg9)))));
              reg11 <= reg7;
              reg12 <= (((reg11[(2'h3):(2'h3)] ^~ ($unsigned(reg8) ^ wire4[(1'h0):(1'h0)])) ?
                  {wire1[(1'h1):(1'h1)]} : $unsigned((reg8[(2'h2):(2'h2)] ^ (reg8 >>> reg8)))) == ($unsigned($unsigned($unsigned(reg11))) <<< $signed($signed($unsigned(wire1)))));
            end
          else
            begin
              reg10 <= $unsigned(reg10);
              reg11 <= (|(8'hab));
              reg12 <= (8'haa);
              reg13 <= (reg10[(4'h9):(2'h2)] ?
                  $signed($signed($signed(wire3[(3'h5):(2'h2)]))) : $signed(($signed(reg8[(2'h2):(1'h1)]) >= reg8[(2'h2):(1'h0)])));
            end
          reg14 <= {$signed($unsigned($unsigned(wire1)))};
          reg15 <= (((~|$signed(reg12[(1'h0):(1'h0)])) != (((&reg5) ?
              ((8'hb4) << reg9) : ((8'hb3) ?
                  (8'ha9) : wire1)) > wire0)) | (reg11 ?
              $unsigned(reg5) : (reg14 - ((~reg12) <= (reg13 ? reg5 : reg5)))));
        end
      else
        begin
          reg5 <= (^~(reg10[(2'h3):(2'h2)] ?
              (($unsigned(reg15) ? wire0[(3'h5):(3'h5)] : (!(8'hb9))) ?
                  (reg12 | (8'ha0)) : (wire0 ?
                      (reg8 ?
                          reg5 : (8'hb0)) : $unsigned(reg11))) : reg15[(1'h0):(1'h0)]));
          reg6 <= ($unsigned($signed((~|$unsigned(reg5)))) ?
              ({$signed(reg8[(1'h0):(1'h0)])} + (reg14 < $signed((reg8 ?
                  wire0 : wire0)))) : $signed({{reg8},
                  $unsigned($signed(reg12))}));
        end
      reg16 <= reg12[(1'h0):(1'h0)];
      if (($unsigned((~({wire2,
          reg8} && wire4[(1'h1):(1'h1)]))) != {$signed(reg16[(2'h2):(1'h0)]),
          $unsigned($signed($signed(reg12)))}))
        begin
          reg17 <= ((reg16[(1'h1):(1'h0)] > ((reg14 ^ reg6) ?
              reg5 : $signed((^reg5)))) > reg6[(2'h3):(1'h1)]);
          reg18 <= ((8'h9e) ? (&$unsigned((~^(^reg14)))) : reg5);
          reg19 <= ({{reg16, $signed((~|reg10))},
                  $unsigned(((reg15 >= reg8) && $signed(reg6)))} ?
              (8'h9d) : {(~$unsigned(reg7))});
        end
      else
        begin
          reg17 <= reg17[(2'h2):(1'h0)];
        end
      reg20 <= {({($signed(reg8) <= reg10[(4'he):(1'h0)])} * $unsigned((~|((8'hb1) ~^ wire3))))};
      if (reg20[(3'h7):(2'h3)])
        begin
          reg21 <= reg14;
        end
      else
        begin
          reg21 <= (((~&((wire2 ? reg21 : reg10) ?
                      reg6[(3'h6):(2'h3)] : $unsigned(wire3))) ?
                  $unsigned(reg19) : wire2[(3'h6):(1'h1)]) ?
              (reg13 ?
                  (wire4[(1'h1):(1'h1)] >>> ($signed((8'ha4)) != (reg10 >> wire1))) : {$unsigned((reg19 ?
                          wire1 : reg7))}) : ($signed(reg5[(4'h9):(1'h1)]) ?
                  ($signed(wire2) ?
                      $signed((wire2 <<< reg13)) : $unsigned((reg20 <= reg7))) : ($signed({reg21,
                          reg18}) ?
                      reg18[(4'ha):(1'h1)] : reg14)));
          reg22 <= reg15[(4'hf):(4'hc)];
          reg23 <= $signed(reg13[(4'hc):(4'hb)]);
          if ($signed($signed((^~{{reg23, reg14}}))))
            begin
              reg24 <= wire0[(4'hd):(4'ha)];
            end
          else
            begin
              reg24 <= ($unsigned($signed({(reg8 <= reg18)})) * (((&reg17[(1'h1):(1'h1)]) ?
                  ($unsigned(reg24) ?
                      $unsigned(reg13) : ((8'hb1) ?
                          (7'h43) : reg5)) : wire4[(2'h2):(2'h2)]) >> (^(reg19 | $unsigned(reg18)))));
              reg25 <= (~(reg14 + reg18[(3'h6):(1'h0)]));
              reg26 <= $unsigned(((reg25 ?
                  (^(8'ha3)) : reg10[(2'h2):(2'h2)]) >>> (((reg21 ?
                      reg15 : (8'hbd)) ?
                  $unsigned(wire3) : (reg18 + (8'ha3))) >> reg18[(3'h4):(2'h2)])));
            end
          if (wire3)
            begin
              reg27 <= (~|(~$unsigned($signed(reg18))));
            end
          else
            begin
              reg27 <= {reg18, $signed(reg7[(2'h2):(2'h2)])};
              reg28 <= $unsigned((~^({(8'hb9)} ?
                  (wire0[(3'h6):(3'h5)] ?
                      {reg14, wire2} : reg8) : $signed(((8'ha8) ^ wire4)))));
              reg29 <= (reg28 ?
                  $unsigned((wire2 <<< ((+reg16) & ((8'hb0) ?
                      reg18 : reg17)))) : reg21[(2'h3):(2'h2)]);
              reg30 <= $signed($signed((reg6[(3'h6):(3'h4)] & reg15[(2'h2):(1'h1)])));
              reg31 <= wire3[(1'h0):(1'h0)];
            end
        end
    end
  assign wire32 = (({((|wire0) == $signed((8'ha7))),
                          $unsigned((wire3 ? (8'hbb) : wire0))} ?
                      reg8[(1'h1):(1'h1)] : {reg22[(1'h1):(1'h0)]}) + ((({reg26,
                              reg20} ?
                          $unsigned((8'ha2)) : (reg31 ~^ reg13)) && wire4[(2'h2):(1'h0)]) ?
                      $signed(reg29[(2'h3):(1'h0)]) : reg13[(3'h6):(2'h2)]));
  assign wire33 = reg25;
  assign wire34 = $unsigned(($signed(reg13[(4'he):(4'hb)]) << $signed(reg25[(4'he):(4'he)])));
  assign wire35 = reg16;
endmodule
