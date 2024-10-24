module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed($signed(($unsigned(wire3[(4'hf):(4'hc)]) == wire4)));
  assign wire6 = (((~&(&$signed((8'hb1)))) ?
                         $unsigned(($signed(wire3) ?
                             (wire5 ?
                                 wire4 : wire5) : (wire3 == wire3))) : $unsigned((^~$signed(wire2)))) ?
                     {$unsigned(wire1[(1'h0):(1'h0)])} : $unsigned(wire1));
  assign wire7 = (&(~^wire5));
  assign wire8 = (!(((~(|wire3)) ?
                         (^(wire3 >= wire0)) : ((+wire7) ?
                             $signed(wire0) : $unsigned((8'hbc)))) ?
                     (^~wire2) : (!wire1)));
  assign wire9 = (wire0[(2'h2):(1'h1)] ?
                     {$unsigned((~(~&wire5))), wire6} : wire1[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(wire4[(4'ha):(1'h0)] ?
              $signed((+$unsigned(wire9))) : $signed(wire6))})
        begin
          reg10 <= wire6[(2'h3):(1'h1)];
        end
      else
        begin
          reg10 <= reg10;
          if (wire6)
            begin
              reg11 <= wire6[(3'h5):(1'h1)];
              reg12 <= reg10[(2'h3):(1'h0)];
              reg13 <= $unsigned($signed((reg12[(4'hc):(3'h7)] ?
                  wire5[(1'h1):(1'h1)] : wire5)));
              reg14 <= $unsigned($signed(($signed((8'ha8)) ?
                  ((!(8'ha3)) ?
                      wire3[(1'h1):(1'h1)] : $signed(wire4)) : ((!(7'h41)) ?
                      {reg11, reg11} : ((7'h43) ? (8'hbc) : (8'ha1))))));
            end
          else
            begin
              reg11 <= {wire9[(2'h2):(1'h0)], $signed(wire1)};
              reg12 <= $unsigned(($signed(reg13[(2'h3):(1'h1)]) || $unsigned((^~$unsigned((8'hac))))));
            end
        end
      reg15 <= wire9;
      reg16 <= (~|{$signed($signed($unsigned((8'ha9)))), reg15});
    end
endmodule
