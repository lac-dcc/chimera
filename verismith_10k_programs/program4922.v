module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed(wire3[(3'h5):(3'h5)]);
  assign wire5 = (wire1 == $unsigned(($unsigned($signed((7'h43))) + wire4)));
  assign wire6 = ({wire0[(2'h3):(2'h2)]} >>> (wire3 ?
                     wire0 : (wire3 < (~&wire3))));
  assign wire7 = ($unsigned((wire3[(1'h0):(1'h0)] <<< $signed((wire3 << wire5)))) != (((wire4[(3'h5):(2'h3)] ?
                     wire6 : wire2) >>> ((~wire6) || $unsigned(wire5))) <<< wire4));
  assign wire8 = wire5;
  assign wire9 = ($signed($signed(wire6[(3'h5):(2'h2)])) <<< $unsigned((wire6 ?
                     wire6[(2'h2):(1'h0)] : $unsigned($unsigned(wire3)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire1))
        begin
          reg10 <= {$unsigned(wire0)};
          if ($unsigned(((+wire8) <<< $unsigned(wire6[(3'h5):(1'h0)]))))
            begin
              reg11 <= (((reg10 ?
                  $signed((^~wire6)) : ((wire8 && (8'h9c)) ~^ $unsigned(wire7))) || (wire4 >>> wire3)) <<< {$signed(wire5[(1'h1):(1'h1)])});
            end
          else
            begin
              reg11 <= (reg10 ?
                  (~{(wire6[(1'h0):(1'h0)] ? (reg10 < wire3) : (wire1 > wire5)),
                      (^(^~reg11))}) : $unsigned(reg10[(2'h2):(1'h1)]));
              reg12 <= $unsigned(wire9);
              reg13 <= $unsigned((~|wire8));
              reg14 <= $signed({(-wire1[(2'h2):(2'h2)])});
            end
          reg15 <= reg13;
        end
      else
        begin
          reg10 <= ((&reg14[(3'h7):(3'h6)]) ?
              wire0[(1'h0):(1'h0)] : $unsigned((((wire2 ? wire4 : wire5) ?
                      ((8'hab) ? wire4 : wire8) : ((8'ha0) ? reg11 : (8'ha0))) ?
                  wire9 : wire8[(4'h8):(4'h8)])));
          reg11 <= $unsigned(reg13);
        end
      reg16 <= wire0[(1'h1):(1'h0)];
      reg17 <= $signed((^(~|$signed($signed((8'hb8))))));
    end
endmodule
