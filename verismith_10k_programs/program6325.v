module top
#(parameter param14 = {((!{((8'h9e) ? (8'haa) : (8'hb0)), (8'h9e)}) == ((7'h41) ? {(~(8'hb9))} : ((8'hba) ? ((8'hae) ^~ (8'ha7)) : (+(8'hbc)))))}, 
parameter param15 = (^~(({(param14 ? (8'h9e) : param14)} ? (~&{param14, param14}) : ((^(8'ha0)) ? (8'hae) : (param14 ? param14 : param14))) ? (((param14 <<< param14) != param14) ? param14 : param14) : {param14, {param14}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2[(4'ha):(2'h3)];
  assign wire6 = wire5[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= (|wire2);
      reg8 <= (($unsigned($unsigned($unsigned(wire1))) ?
              reg7[(2'h3):(1'h0)] : (($signed(wire5) ?
                  $unsigned((8'hb4)) : wire6[(4'hc):(3'h5)]) != wire0)) ?
          (&(~&{wire3[(3'h4):(2'h2)], (wire1 <= wire3)})) : wire0);
      reg9 <= wire1;
    end
  assign wire10 = ($signed(wire5) << (wire2 ?
                      ({(wire5 << reg7)} != wire6[(5'h11):(4'hd)]) : wire6));
  assign wire11 = $signed(wire10[(3'h4):(1'h1)]);
  assign wire12 = wire0[(4'hd):(4'hd)];
  assign wire13 = wire3;
endmodule
