module top
#(parameter param9 = (8'hbf), 
parameter param10 = (^(|{param9, param9})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(1'h1):(1'h0)];
  assign wire6 = $unsigned((!($signed(wire1[(1'h1):(1'h0)]) ?
                     ((wire1 ?
                         wire2 : wire4) > (+wire3)) : $unsigned($signed(wire5)))));
  assign wire7 = $signed($signed($unsigned(wire0[(3'h5):(1'h1)])));
  assign wire8 = ({(wire5 ?
                         $signed($signed(wire0)) : $signed(wire6[(2'h3):(1'h0)])),
                     (!$signed(wire5[(5'h13):(5'h10)]))} >>> ($unsigned($signed((+wire7))) > ($signed($signed(wire7)) ~^ ($signed((8'h9f)) ?
                     $signed(wire7) : $unsigned(wire6)))));
endmodule
