module top
#(parameter param10 = ((+(7'h44)) ? (-((((8'ha8) ~^ (8'hb5)) & (~&(8'h9c))) > (((8'h9f) ? (7'h40) : (8'ha3)) ? {(8'hb0)} : ((8'ha0) ? (8'h9f) : (8'hbc))))) : (((-{(8'hae), (8'hb5)}) ~^ {((8'haa) ? (8'haf) : (8'ha3)), ((7'h41) ? (8'hbc) : (8'ha3))}) ? (^~(((8'hbb) * (8'ha3)) ? ((8'hb2) >= (8'ha2)) : {(8'ha9), (8'hb9)})) : ((((8'haa) ? (8'had) : (7'h40)) ? ((8'hba) ? (8'hbf) : (8'hb3)) : {(8'hbe), (8'ha6)}) ^~ ((8'haa) ? ((7'h43) ? (8'ha5) : (7'h42)) : (&(8'hae)))))), 
parameter param11 = (~^(~|(param10 <<< (~(param10 << param10))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = $signed((wire4[(2'h3):(1'h1)] ~^ $signed(wire3)));
  assign wire6 = (8'hac);
  always
    @(posedge clk) begin
      reg7 <= {((~&$unsigned($signed(wire5))) > $signed((wire4[(1'h1):(1'h1)] ~^ $unsigned((8'hb3))))),
          ((((+wire4) | wire4[(2'h3):(2'h2)]) <= wire4) ^ wire6[(2'h2):(2'h2)])};
      reg8 <= wire5;
    end
  assign wire9 = ($unsigned((wire0 ?
                     wire3[(4'hd):(4'hd)] : (((8'hac) ? reg7 : wire3) ?
                         wire6[(2'h3):(2'h2)] : (!reg7)))) >> $signed(((wire0[(4'h9):(1'h1)] ?
                     wire3[(3'h4):(1'h0)] : wire3) + wire0[(4'h8):(4'h8)])));
endmodule
