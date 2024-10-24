module top
#(parameter param11 = (((^{((8'ha8) - (8'hbf)), (!(8'ha2))}) ? (~^(-((8'h9c) ? (8'ha9) : (8'hab)))) : ((+((7'h43) ? (8'ha3) : (8'ha0))) ? {{(8'hb1)}} : ((!(8'hb4)) ? (^~(8'hb2)) : ((8'ha1) || (8'ha7))))) ^ {((((8'ha8) <= (8'hbd)) ? (~(8'ha3)) : {(8'hae)}) ? (((8'ha0) ? (8'hab) : (8'haf)) ? ((8'ha9) + (8'ha5)) : ((8'h9d) >>> (8'hac))) : {{(7'h44)}, {(8'hb2), (8'hac)}})}), 
parameter param12 = (~{{((param11 << param11) ? (param11 ? param11 : (8'ha0)) : (param11 && param11)), ((param11 ? param11 : param11) ? param11 : param11)}, param11}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire4, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = ({wire0[(3'h7):(2'h2)]} ?
                     $signed(((8'ha7) ?
                         wire3 : wire3[(4'hc):(4'hb)])) : ($unsigned(($signed((7'h40)) <= $unsigned(wire2))) < {($unsigned(wire2) << (wire0 ?
                             (8'ha7) : wire1)),
                         ((wire0 ? wire3 : wire3) ?
                             ((8'ha3) ^ wire0) : {wire0})}));
  always
    @(posedge clk) begin
      reg5 <= wire4;
      reg6 <= $unsigned($signed((wire4[(4'h9):(4'h8)] ?
          (wire2[(2'h3):(2'h3)] || (~|reg5)) : reg5[(2'h2):(2'h2)])));
      reg7 <= $unsigned((+reg6[(4'hb):(3'h5)]));
      reg8 <= wire2[(2'h2):(2'h2)];
    end
  assign wire9 = (reg8[(3'h6):(1'h0)] || $unsigned($unsigned((-(reg5 ?
                     wire1 : (8'ha4))))));
  assign wire10 = wire4;
endmodule
