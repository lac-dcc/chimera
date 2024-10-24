module top
#(parameter param42 = ({(^~(((8'ha8) == (8'ha3)) | {(8'hbf), (8'hb7)}))} || (((((8'hbc) ? (8'ha0) : (8'ha1)) <<< (~&(8'ha4))) ? (~&((8'hab) <= (8'hb8))) : (((8'hb5) ? (8'h9f) : (7'h44)) ? ((8'hb5) == (8'hb3)) : (!(8'hae)))) ? {{((8'hac) <= (7'h43))}, ((+(8'ha9)) ? ((8'ha4) >>> (7'h42)) : (~&(8'hb7)))} : ((~&((8'hb9) ? (8'ha8) : (7'h41))) ? (+((8'ha5) ? (8'hb1) : (8'hac))) : (^~{(8'ha3)})))), 
parameter param43 = ((((-(param42 >= param42)) << param42) ? (~|(-(^param42))) : {((param42 * param42) >> {param42}), param42}) || param42))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $unsigned(({wire1} >= $signed((wire1[(3'h7):(2'h2)] ?
                     $signed(wire2) : {wire1}))));
  assign wire6 = wire2[(3'h6):(3'h4)];
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      reg8 <= (~^{(($unsigned(wire6) & (wire1 && wire1)) ~^ wire2[(4'hb):(3'h4)]),
          wire2[(4'hc):(3'h4)]});
      reg9 <= (|$signed($unsigned(($unsigned(reg8) ?
          wire2 : wire7[(1'h0):(1'h0)]))));
    end
  assign wire10 = $unsigned(({$signed(wire4)} - wire6[(2'h3):(1'h1)]));
  assign wire11 = (|wire10);
  always
    @(posedge clk) begin
      reg12 <= wire7;
      reg13 <= $signed(({wire6, $signed({wire5})} ?
          $unsigned((!(wire4 | wire3))) : ($unsigned(wire5[(2'h2):(2'h2)]) <= (^~$unsigned(reg12)))));
      reg14 <= wire11[(2'h2):(1'h0)];
    end
  assign wire15 = {($unsigned(wire11[(3'h4):(1'h0)]) < $unsigned((^~reg9)))};
  assign wire16 = (wire4[(1'h1):(1'h0)] == reg13[(3'h6):(1'h0)]);
  assign wire17 = $unsigned({wire1[(2'h2):(2'h2)], (reg9 <<< wire11)});
  assign wire18 = ((~|$unsigned(wire10)) ?
                      wire10[(1'h1):(1'h0)] : (+($signed(wire16[(3'h4):(3'h4)]) >= $unsigned((wire2 <<< (8'hb5))))));
  assign wire19 = $signed(($unsigned(((wire18 ?
                      wire0 : wire1) || $signed(wire16))) >> (~|(~^{wire15}))));
  always
    @(posedge clk) begin
      reg20 <= (reg12[(1'h1):(1'h0)] ? wire17 : (-$signed((8'hb3))));
      reg21 <= $signed((&(reg12 < wire15[(2'h3):(2'h3)])));
      if ($unsigned({($signed(((8'hbd) <= wire6)) < wire17[(1'h0):(1'h0)]),
          (^~($unsigned(reg13) ? {wire1} : $unsigned(reg21)))}))
        begin
          if ($unsigned(wire4))
            begin
              reg22 <= $signed(((^reg13) ? (+(~|$unsigned(reg9))) : wire2));
              reg23 <= $unsigned((+$unsigned((~^$signed(wire19)))));
              reg24 <= wire1;
              reg25 <= wire3;
            end
          else
            begin
              reg22 <= ($signed((reg13[(1'h1):(1'h1)] ? (8'hb7) : reg14)) ?
                  (reg21 + wire7[(2'h2):(2'h2)]) : $unsigned(((8'hb6) ?
                      {$signed(reg24)} : ((8'hb6) | (reg25 ? reg21 : reg22)))));
              reg23 <= ($unsigned((^$unsigned(wire0[(2'h2):(2'h2)]))) & ((~^wire7[(2'h3):(2'h3)]) ?
                  ($signed((wire18 ?
                      wire17 : wire2)) ~^ (8'hbd)) : (wire1[(3'h5):(2'h3)] ?
                      {$signed(reg13)} : ($signed(wire16) ?
                          wire3 : (reg14 ? reg9 : reg8)))));
            end
          if ({(~^wire5), reg12[(1'h0):(1'h0)]})
            begin
              reg26 <= wire7;
              reg27 <= {$signed({(8'h9f)}),
                  (wire17 >= ($signed({reg13, wire11}) ?
                      ((&reg26) < (reg12 <= reg22)) : ((reg20 ^~ reg25) ?
                          (reg9 ? reg26 : wire15) : (^~reg24))))};
              reg28 <= wire19;
              reg29 <= (-(($unsigned({reg12,
                  reg14}) < reg23[(1'h0):(1'h0)]) ~^ $signed(($unsigned(wire19) || $unsigned(reg8)))));
            end
          else
            begin
              reg26 <= wire0[(3'h4):(2'h3)];
              reg27 <= (8'hb6);
            end
          if (reg28[(5'h13):(5'h12)])
            begin
              reg30 <= (reg21 - ($signed($signed({(7'h41),
                  (8'hb1)})) >>> $signed(reg27[(3'h6):(2'h3)])));
              reg31 <= ((&{($unsigned((8'h9f)) == $signed(wire7))}) ~^ reg29);
            end
          else
            begin
              reg30 <= ((~reg14[(3'h7):(3'h5)]) != ({reg21[(5'h11):(4'ha)]} ?
                  $signed(($unsigned(wire4) ?
                      reg25[(4'ha):(3'h4)] : (wire6 ?
                          wire5 : reg24))) : $unsigned((~(wire7 ?
                      (8'hab) : wire11)))));
              reg31 <= reg22;
              reg32 <= {($unsigned(((-wire4) ?
                      $signed(reg9) : {wire6})) && wire7),
                  (^~((-(wire5 ^ wire15)) ^ wire7))};
              reg33 <= wire16[(1'h1):(1'h0)];
              reg34 <= reg28[(4'hb):(2'h3)];
            end
          reg35 <= (($signed(wire4[(3'h7):(2'h2)]) << reg12) ^~ {reg26[(1'h0):(1'h0)],
              $signed($unsigned($signed(reg31)))});
          reg36 <= {(8'hb6), reg35};
        end
      else
        begin
          reg22 <= wire4[(3'h5):(2'h2)];
          if (($signed((~^(wire5 ?
              $signed(wire15) : (|reg28)))) * (|{((~&reg31) ^ (wire16 + wire0))})))
            begin
              reg23 <= $unsigned(wire3);
              reg24 <= (8'ha4);
              reg25 <= $signed($unsigned(((|(wire17 ?
                  wire15 : reg20)) <<< $unsigned(wire7[(3'h6):(2'h3)]))));
              reg26 <= (reg22[(3'h7):(3'h7)] ?
                  ((^~($signed(wire2) * (&(8'hbf)))) - reg29) : wire7);
            end
          else
            begin
              reg23 <= $signed($signed((-(7'h44))));
              reg24 <= (($signed((wire16[(3'h4):(1'h1)] ?
                      (wire16 ^~ reg21) : (8'had))) ?
                  (($signed(reg14) ?
                      (wire3 - wire4) : wire2) && wire0) : $unsigned($unsigned((reg12 >> reg30)))) ~^ ((|$signed(reg26)) ?
                  wire19[(4'h9):(3'h7)] : wire15[(3'h4):(1'h1)]));
            end
          reg27 <= (!$unsigned((+(8'hb0))));
        end
      reg37 <= reg14;
    end
  assign wire38 = reg25;
  assign wire39 = wire16;
  assign wire40 = {$signed($signed(wire0)),
                      (reg27[(3'h6):(1'h1)] > $signed(((^~reg30) ?
                          reg36[(2'h3):(1'h1)] : (wire7 - reg35))))};
  assign wire41 = reg29;
endmodule
