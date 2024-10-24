module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire2[(4'hd):(3'h6)];
  assign wire7 = ($signed(wire3) ? (^~wire1) : wire5[(4'h8):(3'h4)]);
  assign wire8 = (wire3[(1'h0):(1'h0)] * ($signed(wire7) >> $unsigned(wire4[(3'h5):(1'h0)])));
  assign wire9 = $unsigned($signed(wire5));
  assign wire10 = $signed(wire4);
  always
    @(posedge clk) begin
      reg11 <= wire1[(1'h0):(1'h0)];
      reg12 <= (!$signed(wire6));
      reg13 <= wire8;
      if ($unsigned($signed({reg11})))
        begin
          reg14 <= $signed(((wire5 != (wire9[(3'h6):(1'h0)] & wire4[(3'h6):(3'h5)])) < wire5[(3'h7):(1'h1)]));
          reg15 <= reg13[(1'h1):(1'h0)];
        end
      else
        begin
          reg14 <= $signed(($unsigned(wire1) ?
              $unsigned((~^(&(8'hbe)))) : wire1[(3'h5):(2'h2)]));
          reg15 <= reg15[(4'hc):(3'h5)];
          reg16 <= reg12;
        end
      if ((wire1[(1'h0):(1'h0)] > ({$unsigned(wire1[(3'h7):(2'h3)])} < {($signed(reg11) || reg11)})))
        begin
          if (wire10)
            begin
              reg17 <= wire7;
            end
          else
            begin
              reg17 <= reg14[(1'h1):(1'h1)];
              reg18 <= ({wire3[(1'h0):(1'h0)]} - ((^$signed((~^reg12))) ?
                  $signed({reg17[(4'he):(2'h3)]}) : wire6[(4'h8):(3'h7)]));
              reg19 <= (reg15 ?
                  $signed(({(&(8'haa)), $unsigned(reg13)} ?
                      {$unsigned(reg13), {reg11}} : {(-reg17)})) : wire9);
            end
        end
      else
        begin
          reg17 <= (+($signed({{reg16}, $unsigned(reg12)}) ?
              {((wire2 << wire4) ? (reg19 ^~ (7'h42)) : (-reg11))} : wire2));
          reg18 <= $signed($signed(reg13[(4'hf):(3'h7)]));
        end
    end
endmodule
