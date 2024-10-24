module top
#(parameter param11 = {(((((8'ha1) ~^ (8'hb7)) << (-(8'h9f))) ? ({(8'ha2)} ? ((8'hb0) ^~ (8'hbd)) : ((8'h9e) ? (8'hb5) : (8'hbf))) : (!((8'ha6) ? (7'h40) : (8'had)))) || ((((8'ha3) && (8'h9e)) >= ((8'ha4) <= (8'hba))) ? {(^~(8'hbf))} : (~((8'hb7) >= (7'h42))))), {({((8'hbc) * (8'hbb))} + (((8'hba) == (8'ha9)) ^ ((8'hb3) ? (8'hba) : (8'hbe))))}}, 
parameter param12 = (param11 ? (((((7'h44) > param11) ? {param11} : (param11 >= param11)) ? param11 : {{param11, param11}}) ? (~^(~^{param11, param11})) : (~|(!(param11 ? param11 : param11)))) : {param11, (((7'h43) >= {param11, param11}) | {(param11 ? param11 : param11)})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire6, wire5, wire4, reg9, reg8, reg7, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire0;
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire2);
      reg8 <= reg7;
      reg9 <= (8'hb9);
    end
  assign wire10 = (!wire0);
endmodule
