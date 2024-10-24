module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (~wire4);
  assign wire6 = ($signed((~&(wire5[(1'h0):(1'h0)] ?
                     (wire4 >> wire5) : (wire2 ?
                         (8'hb0) : (7'h41))))) * (((wire3[(2'h3):(1'h0)] ?
                     wire5 : wire3[(3'h4):(1'h0)]) | ((wire5 ?
                         (8'h9c) : wire4) ?
                     wire2[(2'h2):(2'h2)] : (wire1 <= wire1))) >= (~|(|(~wire3)))));
  assign wire7 = wire0[(2'h2):(1'h1)];
  assign wire8 = wire3[(2'h2):(1'h0)];
  assign wire9 = $signed(wire1);
  always
    @(posedge clk) begin
      reg10 <= ((wire7 ?
              $unsigned($signed(wire3)) : (wire1 ~^ (~|{wire7, wire8}))) ?
          (({$signed(wire9)} ^ wire8) ?
              $unsigned((~(~wire4))) : (wire7 || $signed(wire4[(4'h8):(2'h2)]))) : $signed({(~&$unsigned(wire1)),
              (wire6 ? (wire0 - wire8) : (8'hb5))}));
      reg11 <= (~^wire8[(5'h11):(4'ha)]);
      reg12 <= {{$signed(wire8[(5'h10):(4'ha)]), (~^(8'h9d))},
          (wire3[(2'h2):(2'h2)] ^~ reg10[(5'h13):(3'h5)])};
      if ($unsigned((!(((wire8 ? wire7 : wire1) <<< $unsigned(wire6)) ?
          wire8 : ($unsigned((8'ha8)) | $signed(wire2))))))
        begin
          reg13 <= $signed($signed(($unsigned(wire4) > (8'hbb))));
        end
      else
        begin
          if (((~|(!(~^wire2))) & $signed(((^~(^wire4)) ^~ $unsigned($unsigned(reg13))))))
            begin
              reg13 <= ({wire5[(2'h2):(1'h0)]} ?
                  ((!(((7'h40) ? reg10 : wire6) && wire1)) ?
                      (~&reg13) : $unsigned((wire4 ?
                          wire0 : wire2))) : $unsigned(reg11[(3'h7):(3'h4)]));
              reg14 <= {(-reg13)};
            end
          else
            begin
              reg13 <= $unsigned($unsigned({wire3[(3'h4):(1'h0)]}));
            end
        end
    end
  assign wire15 = (($unsigned((~&$signed(wire8))) ?
                      ({reg14} || (~^$signed(reg13))) : $unsigned((wire5 ?
                          reg14 : wire0[(1'h0):(1'h0)]))) <= $signed(({(!reg11)} ~^ ((wire2 ?
                      reg11 : reg10) - {reg11, reg10}))));
  assign wire16 = ($signed((~&(^~(wire3 ?
                      wire2 : reg14)))) >> (reg13 ^~ ((wire6 ?
                      reg12 : (wire9 ? wire1 : reg11)) | wire15)));
  assign wire17 = reg12;
  assign wire18 = wire0[(3'h6):(1'h0)];
endmodule
