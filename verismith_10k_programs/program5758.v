module top
#(parameter param10 = ({((+((8'ha4) <= (7'h42))) ? ((^(8'hbb)) ? (~|(8'hb9)) : (^~(8'hb2))) : (+((8'hbd) << (8'h9f)))), ({((8'ha1) ? (8'h9e) : (8'ha2))} != ((8'hae) && (+(8'hba))))} ? {((|((8'ha6) ? (8'hb4) : (8'ha2))) ? (^((8'hb1) >>> (8'hb7))) : (!((8'hb6) ? (8'had) : (7'h43)))), ((-{(8'haf), (8'hab)}) ? {((8'hb4) ? (7'h40) : (8'ha0)), ((8'ha7) & (8'haf))} : ((7'h43) ? ((8'hbf) ^~ (8'hbe)) : (+(8'ha8))))} : ((((|(8'hb4)) ? (|(8'hbb)) : ((8'hb1) ? (8'hb6) : (8'ha0))) >>> (^~((8'hb4) ? (8'had) : (8'had)))) ? (~&(^(~|(8'haf)))) : ({((8'ha8) ^~ (8'hbd)), {(8'ha3), (8'hb2)}} ? (|((8'hba) >= (7'h41))) : (((8'hbd) >> (8'hb2)) >>> (8'haa))))), 
parameter param11 = ((-(param10 - ((param10 - param10) >>> param10))) & param10))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {$signed($unsigned(((8'hb0) ^~ (8'hab))))};
  assign wire5 = $unsigned(({wire4[(4'he):(3'h6)],
                     $unsigned(wire1[(1'h0):(1'h0)])} >> wire4));
  assign wire6 = $unsigned(((&wire0) ?
                     (+wire4[(5'h10):(5'h10)]) : $signed($signed($unsigned(wire0)))));
  assign wire7 = (~^wire4);
  assign wire8 = wire3[(4'hc):(2'h2)];
  assign wire9 = ($unsigned((wire0 ?
                         $unsigned((wire2 ^~ wire2)) : (~$signed(wire0)))) ?
                     $signed(($signed($signed(wire5)) <= $unsigned(wire5[(4'h9):(3'h5)]))) : (!((~{wire2}) ?
                         wire4[(3'h5):(3'h5)] : $signed(wire3[(3'h5):(2'h3)]))));
endmodule
