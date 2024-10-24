module top
#(parameter param31 = (8'ha0), 
parameter param32 = (({({param31} > param31)} == (~|(^~(param31 <<< param31)))) && (~^(((param31 < param31) ? (param31 <= param31) : (param31 ? param31 : param31)) != ((param31 != (7'h40)) <= param31)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire6,
                 wire5,
                 reg28,
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
                 (1'h0)};
  assign wire5 = wire4[(4'h8):(2'h3)];
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      if ($signed(wire4))
        begin
          if ({{wire6}})
            begin
              reg7 <= (-{$signed((wire0[(1'h1):(1'h1)] ?
                      wire3[(2'h2):(1'h0)] : wire4[(4'hc):(1'h1)]))});
              reg8 <= $signed($unsigned($signed(((reg7 || wire5) >> $signed(wire4)))));
              reg9 <= (~^wire4[(3'h5):(1'h0)]);
              reg10 <= {reg8, (~^wire0)};
            end
          else
            begin
              reg7 <= $unsigned(reg10[(4'he):(4'hc)]);
              reg8 <= $unsigned(((~($signed(wire6) >> $unsigned(wire4))) <<< (($signed(reg10) ?
                      (wire1 ~^ (8'ha3)) : $unsigned(wire5)) ?
                  wire2[(2'h2):(2'h2)] : {wire4, (~|(8'hac))})));
            end
          if (wire1[(2'h3):(1'h0)])
            begin
              reg11 <= reg7;
              reg12 <= ($signed(($signed((wire0 ? wire5 : wire2)) ?
                      (&$signed(wire6)) : wire6)) ?
                  $signed((wire3[(1'h1):(1'h0)] * reg8)) : {((|(reg9 * wire0)) ?
                          $signed($unsigned(wire2)) : $signed({reg11, wire4})),
                      reg11});
              reg13 <= (8'h9f);
            end
          else
            begin
              reg11 <= wire2;
              reg12 <= {{$signed(((+wire2) >= {wire6, reg13})),
                      $unsigned(reg10[(2'h2):(2'h2)])}};
              reg13 <= {$unsigned(wire5), wire2};
              reg14 <= (~^((reg13[(4'hb):(2'h2)] || $signed((wire6 == reg8))) | ($signed($signed(wire3)) ?
                  wire3 : (~|$signed(wire2)))));
            end
          if (((reg14[(4'h9):(3'h7)] >>> (&wire5)) <= ($signed(($unsigned(reg13) >> (8'ha9))) ?
              $signed(((reg13 * wire1) ?
                  reg14 : {wire2,
                      reg7})) : (($signed(reg11) << reg13) * (!((8'ha0) ^~ wire5))))))
            begin
              reg15 <= reg13;
            end
          else
            begin
              reg15 <= ((8'ha6) ?
                  $unsigned(reg14[(4'hc):(2'h3)]) : wire6[(1'h1):(1'h0)]);
              reg16 <= (&{(($unsigned(reg12) <<< $unsigned(reg15)) ?
                      $signed((8'hb7)) : {$signed(reg12), {(8'h9f)}}),
                  wire5[(1'h1):(1'h0)]});
              reg17 <= (+wire1);
            end
        end
      else
        begin
          reg7 <= {reg16};
          reg8 <= wire0;
          reg9 <= wire6[(3'h5):(3'h5)];
        end
      reg18 <= (^$signed(reg17));
      reg19 <= (&(~^reg15));
      reg20 <= wire1;
      reg21 <= {$unsigned($signed((|reg15))), reg17};
    end
  assign wire22 = wire2[(1'h1):(1'h0)];
  assign wire23 = wire4[(1'h0):(1'h0)];
  assign wire24 = (reg19[(3'h5):(2'h2)] <<< (~^reg10[(3'h4):(1'h1)]));
  assign wire25 = {(^(&reg16))};
  assign wire26 = (8'hb9);
  assign wire27 = ((&$signed((~wire1[(2'h3):(1'h0)]))) * reg21);
  always
    @(posedge clk) begin
      reg28 <= (-(($unsigned(wire24[(5'h13):(3'h5)]) | wire3) ?
          $signed(wire3[(1'h1):(1'h0)]) : (^wire0[(2'h2):(1'h1)])));
    end
  assign wire29 = $signed($unsigned($signed(reg11)));
  assign wire30 = $signed($unsigned((reg20[(3'h4):(3'h4)] >> reg9[(2'h2):(1'h1)])));
endmodule
