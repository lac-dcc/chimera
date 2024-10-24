module top
#(parameter param22 = ((8'h9e) ? (8'ha4) : {(~|(^~(^(8'hb9))))}), 
parameter param23 = {{(^(&(-param22)))}, ((^param22) | (~^{{param22}}))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire18;
  assign y = {wire21, wire20, wire5, wire18, (1'h0)};
  assign wire5 = $signed($signed(({$unsigned(wire1), ((8'hb3) <<< wire3)} ?
                     (8'ha8) : ($signed(wire2) ? (8'hb4) : $unsigned(wire4)))));
  module6 #() modinst19 (.wire8(wire0), .wire7(wire1), .wire11(wire5), .wire9(wire2), .y(wire18), .wire10(wire4), .clk(clk));
  assign wire20 = (8'ha7);
  assign wire21 = wire4;
endmodule

module module6
#(parameter param16 = (7'h40), 
parameter param17 = (|{({(param16 ? param16 : (8'h9c)), {param16}} ? ((!param16) | {param16}) : ({param16} ? (param16 ? param16 : param16) : param16)), (((param16 ? param16 : (8'hb1)) ? (^param16) : (~&param16)) & (param16 ? {param16} : (param16 >= param16)))}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = (8'ha8);
  assign wire13 = wire9;
  assign wire14 = wire7[(2'h2):(2'h2)];
  assign wire15 = $signed($unsigned((($signed(wire7) ?
                      {wire12} : $unsigned(wire10)) << wire9[(2'h3):(1'h0)])));
endmodule
