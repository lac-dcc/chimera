module top
#(parameter param8 = ({({((7'h40) <= (8'ha8))} ? (((8'hb2) << (8'hac)) ? (+(8'ha0)) : (~^(8'hba))) : {((8'hbc) ? (8'ha6) : (8'hae)), (~&(8'ha0))}), {(((8'ha7) > (8'hbc)) ? (~&(8'hb6)) : (^(8'hae))), (+{(8'hac)})}} ? {(-((8'ha1) ? (^(8'ha3)) : {(7'h41), (8'hbf)})), (|(|(8'hb3)))} : (-((^((8'ha0) ? (7'h42) : (8'ha9))) && (^((7'h44) ? (8'hae) : (8'ha6)))))), 
parameter param9 = ((^~({{param8, param8}, (param8 ? param8 : param8)} >= ((~^param8) ? ((8'ha7) ? param8 : param8) : param8))) ? param8 : param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (-({$unsigned($signed(wire2))} | (($unsigned(wire1) ^~ wire3[(3'h7):(3'h4)]) ?
                     ((~&wire3) <= (~wire3)) : (~^(wire0 < wire0)))));
  assign wire5 = {$signed($signed($signed(wire3)))};
  assign wire6 = (8'hb1);
  assign wire7 = wire4[(2'h3):(2'h3)];
endmodule
