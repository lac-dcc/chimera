module top
#(parameter param10 = ((((^(^~(8'haf))) ? (-((7'h41) ? (8'hb3) : (8'h9d))) : (~|{(8'ha3)})) ? ((~|((8'hb2) | (8'hb3))) >= ((^(8'hb9)) != (~|(8'hb9)))) : {(((8'h9f) ? (8'hac) : (8'ha5)) ? ((8'hba) - (7'h42)) : ((8'ha8) ? (7'h41) : (8'h9f)))}) ^ (((((8'hb1) ? (8'ha9) : (8'hb4)) ? ((8'hb8) >= (8'hbc)) : (!(8'hb0))) ? (((8'hbd) ? (8'hbb) : (8'hae)) <= ((8'hbd) ? (7'h40) : (8'hb2))) : {((8'hb7) ? (8'hbf) : (8'h9f)), {(8'ha1), (8'hb5)}}) ^ ((((8'had) ? (8'hb0) : (8'ha6)) <= (~|(7'h42))) >= (((8'hbe) ? (8'hb3) : (8'hb8)) ? ((8'haa) >= (8'hbd)) : (~&(7'h40)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = $signed(wire0[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg6 <= ((({$signed((8'ha2))} ?
              ((8'hbc) >>> (-wire5)) : (wire5[(4'ha):(1'h0)] ?
                  {(8'hae)} : $signed(wire4))) ?
          $signed((+(wire1 ?
              wire5 : wire2))) : (8'ha3)) * ((wire0[(4'h9):(4'h9)] >> (|$unsigned((8'h9c)))) ?
          $unsigned(((wire5 >> wire4) && $unsigned(wire4))) : wire1[(2'h2):(1'h1)]));
    end
  assign wire7 = reg6[(3'h4):(1'h0)];
  assign wire8 = $signed($unsigned((~^(8'hbf))));
  assign wire9 = $signed(wire5);
endmodule
