module top
#(parameter param24 = (!(~^{(~(|(8'hba)))})), 
parameter param25 = (((&(&(param24 ? param24 : param24))) ? ((7'h40) * {(^param24), param24}) : (8'hb4)) ? {param24} : {{(param24 ? (param24 >>> param24) : param24), ({param24} + (~&(8'ha6)))}, (param24 >= (|param24))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire17;
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  assign y = {wire22, wire21, wire20, wire19, wire4, wire17, reg23, (1'h0)};
  assign wire4 = (((((wire1 <= (8'ha3)) != (&(8'hb2))) ^~ (^~wire2[(3'h7):(3'h7)])) ?
                     $signed((wire3 << wire0)) : $unsigned(($unsigned(wire2) & (8'hb4)))) ^ wire3);
  module5 #() modinst18 (.wire6(wire2), .y(wire17), .wire7(wire1), .wire10(wire3), .wire8(wire4), .wire9(wire0), .clk(clk));
  assign wire19 = $signed(wire2[(3'h7):(2'h2)]);
  assign wire20 = wire2;
  assign wire21 = $unsigned(wire17[(3'h5):(1'h1)]);
  assign wire22 = $unsigned((^~(8'ha4)));
  always
    @(posedge clk) begin
      reg23 <= ($unsigned((&$signed((wire21 ? wire19 : (8'hb5))))) ~^ wire0);
    end
endmodule

module module5
#(parameter param15 = ((({{(8'hae), (7'h43)}, ((7'h41) ? (8'hb6) : (8'hae))} ? (((8'h9c) | (8'hb1)) ? (^(7'h42)) : ((8'hb1) ? (7'h42) : (8'haa))) : (((8'hb9) ? (8'haa) : (8'hae)) ? (-(8'hbf)) : (~(8'h9c)))) ? ({((7'h44) <<< (8'ha7))} >= (8'h9c)) : ({(8'h9f)} ^ ((^(8'ha3)) * {(8'hab), (7'h40)}))) <= {(({(8'ha7)} * ((8'hb0) ? (7'h40) : (8'hbd))) ? (&((7'h43) + (8'hba))) : (((8'hab) ^ (8'hb9)) ? (!(8'hab)) : (-(8'h9f)))), ((((8'hba) >> (8'hb5)) | ((8'hab) ? (8'hae) : (8'hab))) + (((8'hbc) ? (7'h42) : (8'h9e)) != ((8'hbe) + (8'haf))))}), 
parameter param16 = {param15, (|{((!param15) != (param15 == param15)), (~(param15 == param15))})})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = ($signed($unsigned(($signed(wire8) ~^ wire9[(4'h8):(3'h7)]))) ^~ ($unsigned(wire10) < wire7[(4'he):(4'ha)]));
  assign wire12 = (~^$unsigned((^(wire11[(3'h5):(3'h4)] >>> (~^wire6)))));
  assign wire13 = wire9;
  assign wire14 = (8'hb6);
endmodule
