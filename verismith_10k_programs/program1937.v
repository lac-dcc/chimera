module top
#(parameter param13 = (((({(8'hb5), (8'h9e)} ? (~&(8'ha8)) : ((8'h9e) ^~ (8'hb8))) ? (((8'ha6) > (8'hae)) ? ((8'hb2) ? (8'ha7) : (8'hb7)) : ((8'hb4) ? (8'haf) : (7'h41))) : (((8'haf) & (8'hae)) ? (8'hb7) : ((8'ha3) ? (8'h9c) : (8'ha1)))) + (^((~(8'hae)) ^~ ((7'h41) ? (7'h42) : (8'ha7))))) ^ {((!((8'hac) ? (8'ha2) : (8'hb9))) ? (((8'ha2) ? (8'h9f) : (8'ha2)) ? ((7'h42) ^~ (8'hb1)) : (~^(8'hbb))) : {(^~(8'h9e))})}), 
parameter param14 = (~^param13))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg12, reg11, reg10, reg9, reg8, (1'h0)};
  assign wire5 = (-$unsigned((wire1 ?
                     $unsigned($signed(wire1)) : (+$unsigned(wire3)))));
  assign wire6 = wire5;
  assign wire7 = $signed($unsigned(wire3));
  always
    @(posedge clk) begin
      reg8 <= (-wire0[(1'h1):(1'h0)]);
      reg9 <= (^~(^$unsigned((wire7[(3'h5):(1'h1)] ?
          (+wire0) : {wire3, reg8}))));
      reg10 <= $unsigned(wire5);
      reg11 <= (!($unsigned((wire7 ? {wire6} : $signed(wire1))) << (wire6 ?
          {reg10[(4'ha):(4'h9)], $unsigned(wire2)} : $signed((reg8 ?
              (8'hbb) : wire2)))));
      reg12 <= reg11;
    end
endmodule
