module top
#(parameter param10 = (((!(&((8'ha0) <<< (8'hb2)))) ? ((((8'ha2) <= (8'hac)) ? ((8'hb5) ? (8'hbb) : (8'hb8)) : {(8'hae), (8'hba)}) ? (^((7'h43) >> (8'hb9))) : (((7'h41) ? (8'h9c) : (8'hbb)) ? ((8'hb7) == (8'hbd)) : ((8'hab) ? (8'haf) : (8'h9c)))) : (~^{{(8'ha3)}, ((8'ha7) - (8'h9d))})) ? (!(~&(((8'hbe) == (7'h41)) ? ((7'h40) >> (7'h44)) : {(8'h9c), (8'h9e)}))) : (8'hbb)), 
parameter param11 = ((!param10) ? param10 : param10))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (wire3[(4'h8):(2'h2)] > wire1);
  assign wire6 = $signed($unsigned((wire5[(3'h4):(2'h2)] ?
                     (+wire2[(3'h5):(3'h4)]) : ((~wire1) <<< (wire4 ?
                         wire2 : wire0)))));
  assign wire7 = (~^{(wire4[(3'h6):(1'h0)] ?
                         wire6 : $unsigned(((8'ha5) ? wire1 : wire0))),
                     wire4[(3'h5):(3'h4)]});
  assign wire8 = (wire2 ?
                     ($unsigned((!wire5)) ?
                         wire4[(3'h6):(3'h6)] : wire6[(4'ha):(3'h4)]) : $unsigned((wire7[(4'hf):(2'h2)] ^~ $unsigned((~wire1)))));
  assign wire9 = ({(~|((wire3 ? wire8 : wire4) ?
                         ((8'hbf) ? wire3 : (8'hab)) : $signed(wire4))),
                     ($signed($unsigned(wire2)) ?
                         (wire4[(4'hc):(3'h6)] ?
                             {wire3,
                                 wire0} : (wire5 >= wire1)) : $unsigned((wire1 ?
                             wire0 : wire0)))} ^ (wire0 <= wire0[(3'h6):(2'h2)]));
endmodule
