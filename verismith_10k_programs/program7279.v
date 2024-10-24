module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed($unsigned((-(~(wire1 & wire0)))));
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = ((+($signed($signed(wire5)) | {(wire2 != wire0),
                     wire6})) <= (7'h40));
  assign wire8 = $signed((+wire0[(2'h2):(1'h1)]));
  assign wire9 = (~&{(~{$unsigned((8'hab))})});
  always
    @(posedge clk) begin
      reg10 <= wire8;
    end
  always
    @(posedge clk) begin
      if (($signed(wire2) >= wire0[(2'h2):(2'h2)]))
        begin
          reg11 <= wire7;
          if (wire9[(3'h6):(3'h5)])
            begin
              reg12 <= {(^((!wire9[(1'h0):(1'h0)]) >= $signed((reg11 || (8'hb0))))),
                  $unsigned($unsigned({$signed(reg10), $signed(wire3)}))};
              reg13 <= (~&($signed(wire9) <<< (reg10[(2'h2):(2'h2)] ?
                  $signed(wire6[(4'h9):(2'h2)]) : {wire5[(3'h6):(1'h0)],
                      (wire7 <= wire1)})));
              reg14 <= wire5[(4'h9):(2'h2)];
              reg15 <= (wire4[(4'he):(3'h4)] > (~&wire0));
            end
          else
            begin
              reg12 <= wire4[(1'h0):(1'h0)];
              reg13 <= $signed($unsigned(reg14[(3'h7):(2'h2)]));
              reg14 <= reg13[(2'h2):(2'h2)];
              reg15 <= {({wire7[(4'ha):(3'h4)], (~|(~|wire2))} ?
                      wire3[(3'h5):(2'h2)] : wire5[(1'h1):(1'h0)])};
              reg16 <= {wire6[(4'h8):(1'h0)], $unsigned(wire0[(1'h0):(1'h0)])};
            end
        end
      else
        begin
          reg11 <= $signed({reg13[(2'h3):(1'h0)], $unsigned({{wire1}})});
          reg12 <= (-$unsigned(reg10[(3'h4):(2'h2)]));
          if (wire2[(2'h3):(2'h2)])
            begin
              reg13 <= ($unsigned($signed(wire5)) & wire8);
              reg14 <= reg13;
              reg15 <= (8'ha3);
              reg16 <= $signed($unsigned(wire2[(4'hd):(3'h5)]));
            end
          else
            begin
              reg13 <= (reg11 ? $unsigned(reg10[(1'h1):(1'h1)]) : wire4);
            end
          reg17 <= wire8;
        end
      reg18 <= (8'hb1);
      reg19 <= (~&((((~&reg17) ?
              $unsigned((8'hbc)) : wire4[(2'h3):(2'h2)]) + {(reg14 > wire1),
              $signed(reg18)}) ?
          wire6[(3'h4):(2'h2)] : $unsigned(($unsigned(wire9) >>> (^~(7'h42))))));
      reg20 <= (~&({$unsigned((wire0 ? (8'haa) : wire7))} * (&(^reg18))));
    end
  assign wire21 = reg11[(3'h7):(1'h0)];
  assign wire22 = wire9[(4'h9):(1'h0)];
  assign wire23 = $signed($signed(reg14[(4'hc):(4'ha)]));
  assign wire24 = {wire3};
  assign wire25 = (!{($unsigned((wire6 ? (8'ha3) : wire8)) ?
                          $unsigned({(8'ha4), reg11}) : wire2),
                      wire3});
endmodule
