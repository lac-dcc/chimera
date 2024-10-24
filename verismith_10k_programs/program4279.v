module top
#(parameter param17 = (~^((({(8'ha0)} >> ((8'hb8) ? (8'hb7) : (8'ha6))) ? (((7'h41) >>> (8'ha8)) << {(7'h43)}) : ((^~(7'h42)) <<< ((8'hac) ? (8'hb8) : (7'h41)))) >= (^~({(8'hbd)} ? ((8'hb3) ? (8'ha5) : (8'hb1)) : ((8'had) ? (8'hab) : (8'hbc)))))), 
parameter param18 = {{(~{param17})}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  always
    @(posedge clk) begin
      reg6 <= (({wire1[(4'h8):(3'h4)]} ?
          (7'h40) : $unsigned($unsigned($unsigned(wire4)))) && $signed(wire5[(1'h1):(1'h0)]));
    end
  assign wire7 = $signed($signed(((!wire0[(4'hd):(4'h8)]) ?
                     ((~^wire3) ? $signed((8'h9d)) : wire0) : wire5)));
  assign wire8 = wire5;
  assign wire9 = wire5[(4'hd):(4'ha)];
  assign wire10 = wire8[(3'h6):(1'h0)];
  assign wire11 = $unsigned((~^((~|wire3) ?
                      wire2[(1'h0):(1'h0)] : {(wire10 ? wire8 : wire5)})));
  always
    @(posedge clk) begin
      reg12 <= {((wire3 ? wire5 : (~|(!(8'hbe)))) ?
              (reg6[(5'h10):(4'hb)] | $unsigned((|wire8))) : (~^$unsigned((wire1 ?
                  wire1 : (8'ha9))))),
          $signed(wire1[(3'h5):(2'h2)])};
    end
  always
    @(posedge clk) begin
      reg13 <= reg12;
      reg14 <= ((wire4[(2'h3):(1'h0)] ?
              (+$signed((^reg13))) : {$unsigned((^~reg12)), wire10}) ?
          reg13 : ($unsigned(wire8[(5'h10):(3'h7)]) - $unsigned(wire9)));
      reg15 <= {((wire1[(3'h6):(1'h1)] >>> (wire9[(4'hb):(1'h1)] ?
                  (wire9 ~^ wire11) : (wire9 ? wire8 : wire5))) ?
              reg13[(3'h6):(3'h5)] : reg6),
          wire10};
      reg16 <= (~wire1[(3'h5):(2'h3)]);
    end
endmodule
