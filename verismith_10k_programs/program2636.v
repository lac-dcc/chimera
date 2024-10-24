module top
#(parameter param8 = ((!(~&(((8'ha8) ? (8'hb5) : (8'ha3)) ? ((8'hb4) ^ (8'haf)) : {(7'h44), (8'hbb)}))) ? ((~^(((8'hb1) >> (7'h44)) << (8'ha6))) ? {(&(^(8'ha1)))} : (!((~&(8'hb3)) <= ((8'haa) ? (8'ha4) : (8'haf))))) : (({(-(8'hbd))} ? (((8'ha0) ? (8'hab) : (8'hab)) + ((8'hbe) ~^ (8'hb7))) : (((8'hb0) ^~ (8'hbc)) ? {(8'hba), (8'hb3)} : ((8'h9c) ? (8'hb6) : (7'h41)))) && (-({(8'haa)} ^~ {(8'hbe)})))), 
parameter param9 = ((((~(param8 || (8'ha3))) + (!(^param8))) ? ({(param8 ? param8 : param8), (param8 >= param8)} ? {param8, param8} : ((param8 | param8) && (+param8))) : (param8 ? (param8 ^~ ((8'haf) ? param8 : param8)) : (8'ha3))) == param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((^$signed((!(-wire0)))));
  assign wire5 = $unsigned($unsigned($unsigned(((wire2 <<< (8'ha5)) - (wire1 << wire2)))));
  assign wire6 = {(((~((8'hb5) <= wire3)) ?
                             $signed(wire0) : wire3[(1'h1):(1'h1)]) ?
                         $signed($unsigned($signed(wire2))) : (^~{(wire2 ?
                                 wire2 : wire1)}))};
  assign wire7 = ((8'ha0) & ((&(-(~|(8'h9c)))) && (-$unsigned(wire4))));
endmodule
