module top
#(parameter param8 = (((((~&(8'h9f)) <<< {(8'ha6), (8'hbf)}) ? (^~(!(8'hb6))) : (((8'ha5) ? (8'ha8) : (8'ha5)) ? (!(8'hb3)) : ((8'h9e) ? (8'ha5) : (8'ha6)))) < (^(^~((8'ha4) ? (8'hb4) : (7'h43))))) ? (((7'h41) + (8'hbb)) ? ({((8'h9e) ? (8'had) : (8'hab)), (8'h9c)} ? ((+(8'hb5)) << {(8'hb7)}) : ({(8'hab), (7'h44)} << (~|(8'haa)))) : (!(~|((8'ha2) ? (8'hb0) : (8'hb8))))) : ({(((8'hac) < (8'ha5)) - ((8'ha3) ? (8'hb1) : (8'hbf)))} ? (+(((8'ha6) ? (7'h43) : (8'ha5)) ? (~^(8'ha9)) : ((8'hb0) ? (8'ha7) : (7'h40)))) : ((((8'hb4) ? (8'hae) : (8'ha5)) ? ((8'hab) ? (8'hb4) : (8'hb6)) : ((8'ha7) ? (7'h40) : (8'ha8))) ? {((8'ha2) ? (8'ha6) : (8'hba)), ((8'h9d) ? (7'h43) : (8'ha1))} : (~(~^(7'h42)))))), 
parameter param9 = ((~|((8'hb0) != (!(param8 ^~ param8)))) + ((|param8) ? (~&param8) : param8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ({(^~(8'hb0)),
                     $unsigned($signed(wire1))} >>> {$unsigned((^~(wire0 != wire0)))});
  assign wire5 = $unsigned((~&$unsigned((~&$unsigned(wire4)))));
  assign wire6 = (((((wire3 <<< wire5) ? $unsigned((8'hbb)) : wire3) ?
                     ($signed(wire5) >= (wire1 + wire1)) : wire2[(4'hc):(3'h5)]) >> $unsigned(wire2)) == $unsigned({wire3}));
  assign wire7 = ((~($unsigned($signed(wire5)) || wire4[(4'hc):(2'h3)])) - $signed($signed((~|{wire0}))));
endmodule
