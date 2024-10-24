module top
#(parameter param31 = {((!(((8'ha6) ? (8'hb3) : (8'ha1)) ? (!(8'h9d)) : ((8'hb2) <<< (8'haa)))) ? (-(8'h9c)) : (({(8'hae)} ? ((8'ha5) || (7'h44)) : ((8'hb9) ? (8'ha2) : (8'haf))) < (((8'h9f) ? (8'hba) : (8'haa)) || (+(8'ha0))))), ((({(8'ha0)} ? {(8'hb7)} : ((8'hac) || (8'hb3))) ^~ ((|(8'hbb)) != ((8'ha5) ? (8'ha9) : (8'ha2)))) < {(~((8'h9e) ^~ (8'hb6))), {((8'h9e) << (8'hae))}})}, 
parameter param32 = param31)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire28;
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire30,
                 wire5,
                 wire6,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire28,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = (-((-wire4[(1'h0):(1'h0)]) ?
                     wire0 : (^~($signed((7'h42)) <= wire2[(5'h12):(3'h6)]))));
  assign wire6 = $signed((!(-($signed(wire4) ?
                     $unsigned(wire4) : $signed(wire0)))));
  always
    @(posedge clk) begin
      reg7 <= (($signed((wire3 ? $signed(wire2) : wire5)) - (-$unsigned((wire6 ?
          wire5 : (8'h9c))))) == wire3);
      reg8 <= $signed((((-wire2[(4'hd):(3'h5)]) >= ($unsigned(wire2) ?
              $signed(wire6) : (|wire4))) ?
          $signed(wire1) : {(wire4 <= $unsigned(wire4))}));
      reg9 <= (~&wire1[(4'h8):(2'h2)]);
      reg10 <= (&(8'hb5));
    end
  assign wire11 = $signed((^(((wire3 ?
                      (8'hb5) : (8'hb3)) ^~ (wire0 > reg7)) <= $unsigned($signed(wire3)))));
  assign wire12 = (wire6[(3'h7):(3'h6)] ? reg9[(3'h4):(1'h0)] : wire11);
  assign wire13 = (^~$signed((((wire12 > reg10) > (-wire12)) ?
                      (~^wire6) : wire0)));
  assign wire14 = (!$signed(reg7));
  assign wire15 = ((~^((8'hb3) ?
                          ($signed(wire1) * $unsigned(wire12)) : ((~|reg8) != wire1[(4'hc):(2'h3)]))) ?
                      wire0 : $signed((!wire3)));
  assign wire16 = $signed(wire0);
  module17 #() modinst29 (.y(wire28), .clk(clk), .wire19(reg9), .wire21(wire11), .wire18(wire14), .wire20(wire4));
  assign wire30 = ((~|{($unsigned(wire2) ~^ $unsigned(wire28))}) << (^~wire14[(4'h8):(3'h5)]));
endmodule

module module17
#(parameter param26 = (({(((8'hae) ~^ (8'hae)) <<< ((8'ha4) > (8'ha4)))} ? {(~{(8'ha4)}), ({(8'hbd), (8'hbf)} >> ((8'hba) < (7'h41)))} : (-(^(-(8'h9c))))) ? (8'hac) : {{(((8'ha2) == (8'hbc)) ? ((8'hbb) ? (7'h43) : (7'h44)) : ((8'hb6) ~^ (8'ha9))), (((8'hbf) ? (8'hab) : (8'hac)) ? (~|(8'haa)) : ((8'ha7) ? (8'hae) : (8'hb6)))}, ({{(8'haa), (8'hb2)}} ? (|((8'ha1) ? (8'ha6) : (8'hb4))) : (((8'hbd) ^ (8'hba)) & {(8'hbf)}))}), 
parameter param27 = (~((~({(8'hab)} ? (param26 ? (8'hb2) : param26) : {param26, param26})) - param26)))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  assign y = {wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = wire20[(1'h1):(1'h1)];
  assign wire23 = (wire21 ? wire18[(3'h5):(1'h1)] : wire20[(2'h3):(2'h3)]);
  assign wire24 = {$unsigned((&($unsigned(wire19) <= (~|wire18))))};
  assign wire25 = $signed({(((wire23 <<< wire23) ^ (~|wire22)) && wire20[(1'h0):(1'h0)])});
endmodule
