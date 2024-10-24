module top
#(parameter param22 = ((((^((8'hb2) ? (7'h44) : (8'hb9))) ? (~|((8'hb8) == (8'hb2))) : {((8'haf) || (8'hb6)), ((7'h44) * (8'hae))}) ? ((^~((8'hae) ? (8'hbb) : (7'h40))) & (&(|(7'h44)))) : {{{(8'hbe), (7'h40)}, ((7'h43) && (8'hb0))}}) ? ((({(8'h9c), (8'hbd)} ? (~|(8'ha6)) : (!(7'h44))) ? {{(8'ha5), (8'ha6)}, (^~(8'ha9))} : {{(8'hb2), (8'haa)}, ((8'hbf) < (8'hab))}) ^ ((^((8'hb6) ? (8'had) : (8'hb6))) <<< {(+(8'hbb)), (~^(8'hbb))})) : {(((8'hb7) ^ {(8'ha7), (8'hbe)}) ? (((8'haa) * (7'h41)) ? {(8'h9f), (8'hb4)} : ((8'hb7) ? (7'h44) : (8'hab))) : ((^~(8'ha7)) >> (&(7'h41))))}), 
parameter param23 = param22)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire19;
  assign y = {wire21, wire5, wire6, wire7, wire19, (1'h0)};
  assign wire5 = {wire0[(4'h8):(1'h0)]};
  assign wire6 = $unsigned((~|$signed((!wire5))));
  assign wire7 = ((!wire0) > wire0);
  module8 #() modinst20 (.wire10(wire3), .y(wire19), .clk(clk), .wire13(wire2), .wire9(wire5), .wire11(wire0), .wire12(wire7));
  assign wire21 = ($unsigned(wire2) ? (7'h43) : $signed(wire6[(5'h11):(2'h2)]));
endmodule

module module8
#(parameter param18 = (((|(8'hb4)) ? ((((8'hb9) != (8'ha5)) ? ((8'hbf) ? (8'hbc) : (8'hb2)) : ((7'h43) ? (8'h9d) : (8'hbc))) ? (^~((8'hb7) > (8'haf))) : (~|((8'ha9) ^~ (8'h9c)))) : (7'h40)) ~^ ({((&(8'ha0)) ? (~(8'hbb)) : (-(7'h40)))} + ((((8'hb3) ^ (8'haf)) && ((8'hb3) << (8'hb5))) ? {((8'hab) ? (8'hae) : (8'hb4))} : (|(~|(8'hb0)))))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire17, wire15, wire14, reg16, (1'h0)};
  assign wire14 = $unsigned({$signed($unsigned((wire9 == wire13)))});
  assign wire15 = wire14[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= $unsigned((^(wire15 ?
          {(wire11 ? wire15 : wire10),
              wire12[(4'hb):(3'h4)]} : ((wire9 >>> wire11) || (wire11 ?
              wire14 : wire12)))));
    end
  assign wire17 = (~(8'hab));
endmodule
