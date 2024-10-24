module top
#(parameter param10 = ((((((8'ha4) ? (8'hb0) : (7'h41)) ^~ (&(8'h9d))) ? {(^~(8'hb5))} : (^~((8'ha9) ? (7'h41) : (8'ha2)))) ? ((((8'ha2) < (8'hb5)) ~^ (+(8'hab))) < (((8'ha1) ? (8'ha7) : (7'h43)) && ((8'hb6) ? (7'h42) : (8'hb4)))) : (8'hae)) >> {{(~^(-(7'h41))), ((|(8'ha8)) ? (~^(8'ha5)) : ((8'hbb) ? (8'hb9) : (7'h41)))}, ((!((8'ha6) ? (8'h9f) : (8'hb8))) ? (((8'hb1) ? (7'h43) : (8'ha2)) ? {(8'haa), (8'hbc)} : (|(8'hac))) : {(8'ha2)})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (((wire3 << wire4[(4'hb):(4'h8)]) ?
                     wire2 : $signed(wire3)) >= wire0[(5'h15):(5'h12)]);
  assign wire6 = $unsigned(wire4);
  assign wire7 = (wire2 ?
                     ((8'ha3) ?
                         wire6[(2'h2):(2'h2)] : wire3[(5'h12):(2'h2)]) : $signed(wire1));
  assign wire8 = $unsigned(($unsigned(wire3) ?
                     ((wire1 ?
                         (!(8'hae)) : wire4[(4'hb):(2'h2)]) << wire5[(4'he):(1'h0)]) : ({wire1} ?
                         wire7[(2'h3):(1'h0)] : $unsigned((wire4 != wire4)))));
  assign wire9 = ({({(~^wire2),
                             (wire7 ^~ wire7)} << ((wire1 >>> wire4) || $unsigned(wire8))),
                         (^~({wire0, wire8} ?
                             {(8'hb3)} : wire2[(4'h9):(4'h9)]))} ?
                     ($signed(($signed(wire6) ?
                             (wire7 < wire1) : $unsigned(wire4))) ?
                         $signed((((8'h9d) < wire5) + ((7'h44) < (7'h42)))) : {wire6[(1'h0):(1'h0)]}) : {wire1,
                         wire2});
endmodule
