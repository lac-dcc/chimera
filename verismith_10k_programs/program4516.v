module top
#(parameter param18 = (+(((((8'hab) < (7'h43)) <<< ((8'ha7) ? (8'hb4) : (7'h44))) ? (((8'hba) ? (8'ha9) : (8'hb4)) * ((8'ha9) & (7'h40))) : {((8'ha9) || (8'hbc))}) ? (~{(~^(8'ha9))}) : ({{(8'hb9)}, (^(8'hac))} - (((7'h41) ? (8'hb5) : (8'hb1)) <= ((8'ha1) ? (8'h9f) : (8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg5 <= wire4[(3'h7):(1'h1)];
    end
  assign wire6 = {(($signed(reg5[(4'hb):(4'ha)]) != reg5[(4'h8):(1'h0)]) ~^ wire0[(3'h5):(1'h0)])};
  assign wire7 = ((wire2 ?
                     {((wire1 >= (8'hbe)) ?
                             (wire4 ?
                                 wire3 : wire1) : wire1[(3'h4):(2'h2)])} : wire3) + $signed($unsigned($unsigned($unsigned(wire3)))));
  assign wire8 = (~^((((wire2 ?
                     wire7 : wire7) >= (|wire0)) & wire1) | (wire1[(2'h3):(1'h0)] > (~$signed(wire4)))));
  assign wire9 = wire1;
  assign wire10 = $unsigned(wire0[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ((~^$unsigned($unsigned((((8'hbe) ^ (8'ha0)) + {wire0})))))
        begin
          reg11 <= ((~&$signed({$signed(wire2)})) ?
              ($signed(wire2[(1'h1):(1'h0)]) ?
                  ((-(&wire9)) ?
                      wire10 : wire4[(1'h1):(1'h0)]) : $unsigned(wire9[(3'h6):(1'h0)])) : (((~((8'ha3) | wire2)) >> (!(wire4 ?
                  reg5 : wire3))) > (((wire9 || wire7) ?
                  $unsigned(wire9) : $signed(wire10)) && wire0[(4'h8):(3'h5)])));
          reg12 <= wire7[(1'h0):(1'h0)];
          reg13 <= wire6[(4'h9):(3'h4)];
          reg14 <= (($unsigned((8'ha2)) ?
                  $unsigned((~reg11[(4'he):(4'hc)])) : wire6) ?
              reg11 : $signed(wire6));
          reg15 <= (!(($unsigned(wire7) ?
              wire2[(1'h1):(1'h1)] : $unsigned(reg11[(3'h7):(3'h4)])) == wire0[(4'hc):(3'h4)]));
        end
      else
        begin
          reg11 <= wire8[(1'h0):(1'h0)];
        end
    end
  assign wire16 = $unsigned(reg12);
  assign wire17 = $signed(((($unsigned((8'h9c)) ?
                              (reg15 >= wire3) : (wire9 ? reg12 : (8'hb7))) ?
                          ({wire9} ?
                              wire2 : (~^wire9)) : (~^$unsigned(wire16))) ?
                      wire3[(2'h3):(2'h2)] : wire4));
endmodule
