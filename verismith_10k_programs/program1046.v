module top
#(parameter param8 = ({((((8'h9f) <= (8'hb0)) == ((7'h40) ? (8'hb0) : (7'h43))) ? (8'hbf) : (((7'h43) ? (8'hb9) : (7'h42)) ? ((8'hb9) ? (8'ha6) : (8'haa)) : {(8'hb5)})), ((((8'hb9) > (7'h44)) < ((8'hb8) ? (8'hb3) : (8'ha5))) + (-(-(8'hac))))} ? (~^(+{{(8'ha0)}, ((8'hbb) && (8'ha6))})) : ({(^((8'hb6) | (8'h9d))), (((8'hb6) ? (7'h40) : (8'h9c)) ? (~(8'hae)) : (!(8'hae)))} ? (+(((8'hb4) ? (8'ha9) : (8'hbb)) ? (-(8'hb7)) : (~|(8'hba)))) : (((~|(8'hb2)) ? (8'hbd) : (8'ha8)) ? {(^(8'hb7)), (8'hae)} : (((8'ha9) ? (7'h42) : (8'ha0)) ^ ((7'h41) * (8'hbe)))))), 
parameter param9 = (param8 + (param8 >= {(|(param8 ^~ param8)), (!(param8 || param8))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
    end
  assign wire5 = (+($unsigned($unsigned(wire0[(4'h8):(3'h6)])) >> ({((8'hae) & wire1),
                     (reg4 ? wire3 : reg4)} <<< $unsigned({wire0, wire1}))));
  assign wire6 = (8'hb5);
  assign wire7 = $signed(wire3[(4'h8):(3'h5)]);
endmodule
