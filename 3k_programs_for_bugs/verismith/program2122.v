module top
#(parameter param17 = {{(~^(^((8'hbf) ? (8'hab) : (8'h9e))))}, ((~&((+(7'h42)) ? ((8'haa) || (7'h41)) : {(8'hba)})) ? ((((8'ha2) >>> (8'hb3)) ? ((8'hb9) > (7'h44)) : {(8'ha4)}) ? (&((8'ha6) >> (8'h9c))) : ((8'h9e) >>> (!(8'haa)))) : (({(8'hb1)} ? ((7'h42) ? (8'ha2) : (8'hbe)) : ((8'hb5) ? (8'hb2) : (8'ha8))) ? (-((8'ha6) - (7'h43))) : ((-(7'h42)) + ((8'ha1) ? (8'hb3) : (8'ha7)))))}, 
parameter param18 = param17)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire16,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = ((^~wire4[(3'h7):(3'h6)]) ? wire0 : wire1[(1'h1):(1'h1)]);
  assign wire6 = $signed(wire3);
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= $signed($unsigned((~&reg7[(3'h6):(2'h3)])));
      reg9 <= ((wire6[(4'ha):(3'h4)] ?
          ({$signed(reg7), (wire1 ? (8'hb2) : wire5)} ?
              wire1 : $signed(wire6[(3'h7):(3'h6)])) : wire2) | (&(wire6[(1'h0):(1'h0)] != {(~|wire5),
          wire4})));
      reg10 <= wire1[(2'h2):(1'h0)];
    end
  assign wire11 = (reg10[(3'h5):(1'h1)] ?
                      ($signed((8'ha2)) ?
                          (+(&((7'h42) - wire5))) : wire4) : ($signed(wire5[(3'h5):(1'h0)]) | ($signed($unsigned(reg8)) ?
                          (^~(~&wire1)) : wire4)));
  always
    @(posedge clk) begin
      reg12 <= {$signed($signed($unsigned(((8'h9f) ? (8'ha1) : wire11)))),
          ({(!(wire1 ? wire2 : reg7)), ($unsigned((8'h9c)) || (^reg10))} ?
              $signed(reg9[(5'h10):(4'h9)]) : $signed({$unsigned(wire2)}))};
      reg13 <= $unsigned($signed($signed($signed(wire3[(3'h6):(3'h4)]))));
      reg14 <= {$signed(wire6[(2'h2):(1'h0)])};
      reg15 <= wire1;
    end
  assign wire16 = $signed(wire1[(2'h3):(2'h3)]);
endmodule
