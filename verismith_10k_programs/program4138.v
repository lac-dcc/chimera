module top
#(parameter param9 = {{(8'haa), (~(((8'h9e) ? (8'hb9) : (8'hb6)) ? ((7'h42) > (8'hbd)) : ((8'ha5) + (8'ha2))))}, (8'ha1)}, 
parameter param10 = (8'hb5))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire2[(4'h9):(4'h9)],
          ((wire3 ^~ {wire2[(3'h6):(3'h6)],
              (wire2 == wire2)}) * ($unsigned((8'hba)) ?
              $unsigned((wire1 << wire1)) : $unsigned($unsigned(wire2))))};
    end
  assign wire5 = (($unsigned(((!(8'hbf)) | wire0[(2'h2):(1'h1)])) ?
                         ($unsigned((^~wire0)) <<< ((wire0 && wire1) ?
                             wire1[(2'h3):(2'h3)] : (~^reg4))) : reg4[(1'h0):(1'h0)]) ?
                     {$unsigned((wire3 ?
                             wire0[(3'h4):(1'h1)] : wire0[(4'h8):(4'h8)]))} : (wire2 >= $signed({(wire2 ?
                             (8'ha7) : reg4)})));
  assign wire6 = wire5[(2'h2):(1'h0)];
  assign wire7 = ($signed(($unsigned(wire6) ^~ reg4)) << $unsigned(wire3[(5'h10):(4'h9)]));
  assign wire8 = wire7[(5'h12):(2'h3)];
endmodule
