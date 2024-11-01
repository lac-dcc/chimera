module top
#(parameter param8 = ((((~((8'hb8) < (8'hbb))) ? ((8'had) ^~ ((8'hbf) < (8'ha3))) : ((^(8'hb9)) ? ((8'hbc) ? (8'ha4) : (8'hb3)) : ((8'hb8) >>> (8'ha4)))) * ((((8'hbe) ? (8'h9c) : (8'ha0)) && ((8'ha5) <= (8'ha5))) + (+(~|(8'ha8))))) && (({{(8'ha8)}, {(8'ha1)}} + (!((8'ha3) ? (8'hb7) : (8'hbc)))) < ({((7'h41) > (8'hb7))} ? (8'hb5) : {((8'hb5) ? (8'ha4) : (7'h43))}))), 
parameter param9 = ((|(((~|param8) ? ((7'h43) ? param8 : param8) : (param8 & param8)) ? (~|{param8, param8}) : ({param8} ? param8 : (param8 ? param8 : param8)))) & ({((~&param8) | (|(8'ha1)))} > (((param8 - param8) ? ((8'ha1) ? (8'hb4) : param8) : param8) * {{(8'hbf), param8}, (~&(8'h9e))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = (wire0 || $signed({(wire1[(2'h3):(1'h0)] ?
                         $signed(wire2) : $signed(wire0))}));
  always
    @(posedge clk) begin
      reg5 <= ({(^~$signed(((8'ha2) ? (8'hbd) : wire4))),
              ((((8'hb1) >>> (8'hb9)) ?
                  wire4[(3'h4):(1'h1)] : (8'ha7)) - ($unsigned(wire4) ^~ $unsigned(wire0)))} ?
          (wire3[(3'h7):(3'h7)] ~^ (7'h42)) : wire4[(3'h7):(3'h7)]);
    end
  assign wire6 = (~|$unsigned($unsigned(((8'hb3) ?
                     {wire1, reg5} : $unsigned(wire2)))));
  assign wire7 = (($signed(((wire4 < wire3) ^~ (|wire4))) << $signed(((&(8'hbd)) + (~^wire1)))) & (wire0[(2'h3):(2'h2)] ?
                     (|$unsigned($unsigned(wire1))) : (($signed(reg5) >= wire6[(2'h2):(1'h1)]) * $unsigned($unsigned(wire0)))));
endmodule
