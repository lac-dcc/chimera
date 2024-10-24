module top
#(parameter param14 = ((((|(~^(8'haa))) < ((7'h41) ? ((8'hb7) ? (8'hb9) : (8'ha4)) : (^(7'h44)))) ? (~&(((8'ha8) ? (8'hbb) : (8'hac)) < {(8'had)})) : {(((7'h42) ? (8'h9f) : (8'hb8)) ? ((8'hab) >> (8'ha8)) : (-(8'hb6))), ({(8'hb7)} ? ((8'ha3) ? (7'h43) : (8'h9e)) : (+(8'h9c)))}) | (((((8'h9d) <= (8'ha9)) ? ((8'hbe) ? (8'hbc) : (8'hb4)) : {(8'hb5), (8'h9f)}) && (-(^~(8'ha8)))) <= ({((8'hb4) ? (8'ha1) : (7'h43)), (^(7'h42))} ? (8'hb4) : ((8'hba) - {(8'hb6)})))), 
parameter param15 = ((param14 ~^ (&(~^((8'h9d) ? param14 : param14)))) ? ({param14} ? ((^~{param14, param14}) <<< (param14 <<< ((8'hab) ^~ (8'ha2)))) : param14) : param14))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire2);
      reg5 <= reg4[(1'h1):(1'h1)];
      reg6 <= {(&wire2),
          ($unsigned($signed((wire3 != reg5))) || ((-(wire0 ? wire3 : wire1)) ?
              $unsigned(wire0[(1'h0):(1'h0)]) : $unsigned((+wire0))))};
    end
  assign wire7 = wire2;
  assign wire8 = $unsigned(wire1);
  assign wire9 = wire1[(3'h7):(1'h0)];
  assign wire10 = (+$signed(reg6[(3'h6):(3'h6)]));
  assign wire11 = $unsigned({$signed({(^wire8)}),
                      (|$signed($unsigned(wire3)))});
  assign wire12 = wire9;
  assign wire13 = wire2[(3'h7):(2'h3)];
endmodule
