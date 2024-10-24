module top
#(parameter param8 = ({(-(((8'hbf) ? (8'ha4) : (7'h43)) > (+(8'h9f)))), ((~((7'h40) >>> (8'hb5))) ? (&{(8'haa), (8'had)}) : (^~((7'h44) ? (8'h9d) : (8'hac))))} ? (^(&({(8'hba)} >> {(8'ha6), (8'ha0)}))) : (((((8'hb9) ? (8'hb2) : (8'hbb)) ? {(7'h43), (8'h9d)} : (~|(8'haf))) ? (+(~^(8'ha7))) : (^~((8'hb3) >= (7'h42)))) < ((((8'hac) == (8'haa)) ? ((8'hbc) ? (8'h9e) : (8'h9f)) : (^~(8'ha8))) - {((8'hab) ? (8'h9c) : (8'hb5))}))), 
parameter param9 = (param8 ? (|(&(~|(^param8)))) : ((param8 ^ (!{param8, (8'hb1)})) ^~ ((^param8) ^ (((8'hbe) ? param8 : (8'ha0)) ? ((8'ha5) <= param8) : param8)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (^wire3[(1'h1):(1'h1)]);
  assign wire5 = (|$signed((wire0 >>> $signed((wire2 ? wire0 : wire3)))));
  assign wire6 = wire0[(3'h6):(3'h5)];
  assign wire7 = (({$signed(wire4[(2'h2):(1'h1)]),
                         $signed(wire4[(3'h5):(3'h5)])} ?
                     (({wire2, wire5} ? wire3 : (7'h40)) ?
                         $unsigned(wire3[(3'h4):(3'h4)]) : $unsigned(((8'hb5) ?
                             wire1 : wire0))) : {wire1}) < (8'ha4));
endmodule
