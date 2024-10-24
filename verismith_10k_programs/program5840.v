module top
#(parameter param14 = (&(((((8'hb7) ? (8'ha5) : (8'hae)) ? (^(7'h44)) : {(7'h40)}) ? (((7'h41) ? (8'hb9) : (8'hb1)) ? ((8'ha7) ? (8'ha3) : (8'hb7)) : (^~(8'ha1))) : (&{(8'ha2), (8'hab)})) >= (8'ha7))), 
parameter param15 = ((((param14 ? (param14 ? param14 : param14) : (param14 && param14)) ? param14 : ((^param14) ? (param14 ? param14 : param14) : ((8'hbe) >>> param14))) ^ param14) ^ ((8'hbb) ? ({(param14 <<< param14)} >>> {param14}) : (|(^~(-param14))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ((8'h9d) ?
                     {(!wire0[(3'h7):(1'h0)])} : (((^$signed(wire0)) ?
                         $unsigned(wire2) : {wire1[(4'hc):(2'h3)]}) ~^ wire0));
  assign wire5 = (~|$signed((&$signed((wire3 || wire0)))));
  assign wire6 = (~|(((wire0 ?
                         $unsigned(wire4) : (|wire5)) ~^ $signed($signed(wire0))) ?
                     $signed(wire4[(4'h9):(4'h9)]) : (wire3 ?
                         wire4 : ((wire4 ? wire2 : wire4) ?
                             (wire5 >>> wire5) : (|wire4)))));
  assign wire7 = {wire2[(4'hd):(3'h6)],
                     $unsigned(($signed(wire2) ?
                         {wire2, ((7'h41) ~^ wire2)} : $signed({(8'ha2)})))};
  assign wire8 = (8'ha3);
  assign wire9 = ($signed(wire1) > wire6);
  assign wire10 = $signed(wire8[(2'h3):(1'h0)]);
  assign wire11 = (|((|(wire6[(5'h12):(4'hd)] * (wire8 ?
                      wire0 : wire2))) > ((7'h43) ?
                      $unsigned($unsigned(wire6)) : $signed(wire7))));
  assign wire12 = $unsigned(wire5[(3'h4):(2'h2)]);
  assign wire13 = $unsigned((|(-(8'hb0))));
endmodule
