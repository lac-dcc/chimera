module top
#(parameter param26 = (&((8'haa) ? (&(8'ha6)) : {{((8'hb8) | (8'ha9)), {(8'hb6), (8'hac)}}})), 
parameter param27 = (~&(~&(&(param26 | (+(8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  assign y = {wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire5 = ($signed($unsigned(((wire4 & wire1) ?
                         $signed(wire4) : $unsigned(wire0)))) ?
                     wire4[(4'hc):(4'ha)] : (wire0[(1'h0):(1'h0)] == wire2[(3'h4):(2'h3)]));
  assign wire6 = $signed(((8'haa) ~^ $unsigned($unsigned({wire3, wire3}))));
  assign wire7 = ($unsigned($unsigned((~&wire2[(3'h7):(1'h1)]))) ?
                     $signed((({wire5, wire6} ?
                         wire2 : wire6[(1'h0):(1'h0)]) >>> wire3[(1'h1):(1'h0)])) : $signed($signed(({wire6} ?
                         wire0 : $unsigned((8'ha2))))));
  assign wire8 = $unsigned((~|($unsigned((8'hba)) && (+$unsigned(wire7)))));
  assign wire9 = (8'h9e);
  module10 #() modinst22 (.wire11(wire3), .y(wire21), .wire14(wire9), .wire12(wire2), .clk(clk), .wire13(wire5));
  always
    @(posedge clk) begin
      reg23 <= (8'hbf);
      reg24 <= wire1;
      reg25 <= (+(wire2[(3'h5):(3'h4)] ?
          {(wire9 ?
                  $signed(wire3) : (wire2 + wire1))} : (reg23[(2'h3):(1'h1)] | (((8'haa) ?
              wire4 : reg24) & (wire21 & wire9)))));
    end
endmodule

module module10
#(parameter param19 = {((({(8'hbf)} <<< ((8'ha1) ? (8'ha5) : (8'ha6))) ? ((~(8'haa)) >= (&(8'hac))) : (((8'hb9) ? (7'h43) : (8'ha8)) < ((8'ha2) ? (7'h41) : (8'hac)))) <= {(((8'hb9) ? (8'had) : (8'hab)) >>> (~|(8'hb5)))}), ((+(8'hac)) ? {(~^((8'hb5) ^~ (8'hb6))), {{(8'ha8)}}} : ({((8'ha4) ? (8'hb5) : (8'hb4))} ? (((8'ha8) ? (7'h41) : (8'haf)) >= (~|(8'hb2))) : (((8'hbd) ^~ (8'hb4)) ? ((8'hbd) * (8'hbf)) : (~^(7'h44)))))}, 
parameter param20 = (param19 ? param19 : (((|(~|param19)) ? (8'hbd) : (+{param19})) - (((+param19) ? ((7'h41) ? param19 : (8'had)) : (~&param19)) * ((param19 << param19) ? param19 : (8'had))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  assign y = {wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = {{wire14[(3'h5):(1'h1)], $signed((&wire12[(1'h1):(1'h0)]))}};
  assign wire16 = $unsigned(({wire12[(3'h4):(1'h0)], {wire12}} ?
                      wire12[(1'h1):(1'h1)] : (-((-wire15) ?
                          wire12 : $unsigned(wire15)))));
  assign wire17 = {(((+wire16[(4'hf):(4'he)]) == $unsigned($signed((8'hb1)))) ^~ wire12)};
  assign wire18 = wire15[(1'h1):(1'h1)];
endmodule
