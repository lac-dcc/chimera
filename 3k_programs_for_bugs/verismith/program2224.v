module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire18,
                 wire17,
                 wire16,
                 wire7,
                 wire6,
                 wire5,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg19,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($signed($signed((wire2[(2'h2):(1'h1)] + $signed(wire2)))) ?
                     wire0 : $signed(($unsigned((wire0 <<< wire1)) ?
                         wire4 : $signed((~|wire4)))));
  assign wire6 = (&(wire5[(4'he):(4'hb)] + ((wire5 == $signed((8'hbb))) == $signed($unsigned(wire2)))));
  assign wire7 = ({wire3} ~^ $signed((8'had)));
  always
    @(posedge clk) begin
      reg8 <= (|($unsigned(((~&wire3) && ((7'h43) > wire5))) ?
          (({wire4} ? (wire3 && wire7) : wire5[(1'h1):(1'h0)]) ?
              (~|$unsigned(wire4)) : $unsigned((!wire0))) : $signed($signed(wire2[(3'h4):(1'h1)]))));
      reg9 <= wire3;
      if ((~^wire3))
        begin
          reg10 <= {$unsigned({wire2[(3'h5):(1'h1)], (|(8'hb2))})};
          reg11 <= (($signed($unsigned((~^reg8))) ?
                  wire3[(2'h3):(2'h3)] : reg9[(1'h0):(1'h0)]) ?
              (~(8'hbd)) : $unsigned((wire0 ?
                  ({(8'hab), reg8} >>> $signed(wire7)) : $unsigned((reg10 ?
                      wire0 : (8'ha7))))));
          if (wire4)
            begin
              reg12 <= (&$signed(((~&((8'ha0) ? wire4 : wire7)) <= (8'ha2))));
              reg13 <= (-(wire7[(4'hc):(3'h7)] & $signed((~&reg11))));
              reg14 <= $signed(reg12[(4'hd):(2'h3)]);
            end
          else
            begin
              reg12 <= wire6[(4'h9):(4'h9)];
              reg13 <= $unsigned(((wire2 ? (7'h42) : $signed(wire1)) ?
                  ($unsigned(reg14) ?
                      ((~|wire3) + {(7'h44),
                          reg9}) : {$unsigned(reg14)}) : $unsigned(((wire6 != (7'h40)) ?
                      $signed((7'h41)) : $unsigned(wire0)))));
              reg14 <= $unsigned((((-(wire5 ? wire6 : wire1)) - $signed({reg12,
                      reg10})) ?
                  reg8 : $signed({(reg11 ? wire5 : reg10),
                      ((8'ha6) || wire7)})));
            end
          reg15 <= ($unsigned(reg12) <= (8'haa));
        end
      else
        begin
          reg10 <= $signed(wire3);
          reg11 <= $unsigned(((((reg14 ? wire0 : wire5) * {wire6}) ?
              reg13[(3'h7):(3'h5)] : ((wire7 ?
                  reg8 : (8'ha3)) & wire3[(5'h12):(5'h12)])) <= reg10));
        end
    end
  assign wire16 = (reg9[(2'h3):(1'h1)] ?
                      $unsigned(((wire7[(4'hb):(4'ha)] - $signed(wire5)) << $signed($unsigned(wire3)))) : $unsigned(wire1[(4'hb):(4'hb)]));
  assign wire17 = $signed($unsigned({$unsigned(wire6[(3'h4):(2'h3)]),
                      $unsigned((wire0 + wire5))}));
  assign wire18 = (wire4 <= wire2[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg19 <= wire4;
    end
  assign wire20 = reg15;
  assign wire21 = $signed($unsigned(wire3[(5'h12):(4'h8)]));
  always
    @(posedge clk) begin
      reg22 <= (wire3[(4'hc):(4'hb)] ?
          (8'hb7) : ((((^reg10) ^~ wire4) ?
              {(^wire6)} : wire7) && $signed(((~&wire21) ? (8'hbd) : wire7))));
      reg23 <= $signed(reg15[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($signed((((^reg12[(5'h13):(2'h3)]) >>> (~|wire0)) >>> (&(+$signed(wire6))))))
        begin
          reg24 <= (~(reg13[(3'h5):(1'h1)] ? reg13 : reg8[(3'h4):(2'h3)]));
          reg25 <= $unsigned(reg15[(5'h10):(5'h10)]);
          reg26 <= $unsigned(($unsigned(wire7[(4'hb):(1'h1)]) ?
              reg11[(2'h2):(1'h1)] : ({(wire1 > (8'hbf))} ?
                  (^~$signed(reg24)) : (wire0[(5'h11):(4'ha)] ?
                      ((8'ha6) <= wire4) : (wire6 == (8'ha2))))));
          if ($unsigned($signed($unsigned($unsigned((&wire1))))))
            begin
              reg27 <= $signed(wire4);
            end
          else
            begin
              reg27 <= (7'h42);
            end
          reg28 <= ((8'h9c) ?
              reg8[(3'h6):(1'h0)] : $unsigned((|$unsigned({wire16}))));
        end
      else
        begin
          if ((($unsigned({{wire16,
                  reg14}}) != wire17) <<< {$signed(wire1[(3'h6):(3'h4)])}))
            begin
              reg24 <= wire0[(5'h12):(4'hc)];
              reg25 <= reg19;
            end
          else
            begin
              reg24 <= reg27[(4'hb):(4'ha)];
              reg25 <= (wire20[(1'h0):(1'h0)] << (($unsigned(((8'hb6) ?
                      wire17 : wire3)) && ((-wire5) ?
                      reg19 : reg24[(3'h6):(3'h5)])) ?
                  $signed(reg27) : wire21));
              reg26 <= reg11;
              reg27 <= (($signed(wire20[(1'h1):(1'h0)]) ?
                      wire21[(4'h8):(2'h3)] : (^~wire4)) ?
                  reg25 : (($unsigned((wire1 ? reg9 : reg24)) ?
                          (reg13[(3'h5):(1'h1)] | $signed(reg27)) : $signed(reg22[(5'h12):(1'h0)])) ?
                      (~&wire6) : wire0[(4'hf):(1'h0)]));
              reg28 <= (~|reg15[(4'hc):(3'h6)]);
            end
        end
      reg29 <= $signed($signed({((reg15 > reg11) || (wire17 ? reg22 : wire3)),
          $signed(wire4[(3'h4):(3'h4)])}));
    end
endmodule
