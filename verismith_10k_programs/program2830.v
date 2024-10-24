module top
#(parameter param19 = (((^(((8'hb2) ? (8'hb4) : (8'h9e)) ^~ {(8'hb3)})) ? (~(~|(|(8'hbb)))) : ((8'hb6) ? (+((8'hb4) ? (8'hb5) : (8'hb6))) : (8'hbf))) >>> {(-(((8'hbe) | (8'ha3)) ? (~^(8'hb4)) : ((8'hb0) ? (8'hb6) : (8'ha7)))), (({(8'haf), (8'hae)} ? (~^(8'hac)) : ((8'ha5) ? (7'h44) : (8'hb5))) ? (((8'ha9) ? (8'ha0) : (8'hbd)) + (^~(8'hbd))) : ((8'hac) ^ ((8'h9d) ? (8'h9f) : (7'h44))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = $unsigned(wire1);
  assign wire6 = (wire5[(3'h5):(1'h1)] ?
                     $signed((|(wire1[(2'h3):(2'h2)] >>> $unsigned(wire4)))) : ((^$signed(wire0)) + ($unsigned(wire0[(1'h1):(1'h1)]) ?
                         {wire0} : wire5)));
  assign wire7 = $unsigned(({wire6} == (8'ha2)));
  assign wire8 = (wire2 ?
                     $signed(((wire0 ?
                         (wire0 ?
                             wire5 : wire2) : wire6[(4'he):(4'hd)]) * (&{wire2}))) : $signed((~|wire4[(2'h2):(2'h2)])));
  assign wire9 = {$unsigned(wire0)};
  assign wire10 = ($unsigned($unsigned(wire8)) ?
                      $signed($signed(($unsigned((8'ha2)) ?
                          (wire5 ?
                              wire6 : wire3) : wire7))) : $unsigned(wire9[(1'h1):(1'h0)]));
  assign wire11 = wire9;
  assign wire12 = ($unsigned($unsigned(((wire6 ? wire2 : (8'haf)) ?
                          (wire11 ? wire0 : wire5) : $signed(wire2)))) ?
                      (wire8 ?
                          ($signed((wire2 ?
                              wire2 : wire1)) <<< $unsigned((^wire2))) : ((^~$signed(wire7)) ?
                              wire6[(3'h7):(3'h5)] : wire9)) : $signed(((&wire5) ?
                          ($unsigned(wire11) ?
                              wire8[(3'h4):(2'h2)] : (wire3 >= wire2)) : ((wire10 ?
                                  wire0 : (8'h9c)) ?
                              wire10[(1'h1):(1'h1)] : $signed(wire3)))));
  assign wire13 = wire1[(3'h4):(3'h4)];
  assign wire14 = (wire7[(3'h6):(3'h5)] ? (&(!(8'ha3))) : wire6);
  always
    @(posedge clk) begin
      reg15 <= ({$signed(wire10),
              (!((wire6 ? (7'h41) : wire4) + wire9[(1'h0):(1'h0)]))} ?
          $signed({wire14[(2'h3):(1'h0)],
              $unsigned((^~wire3))}) : wire2[(1'h0):(1'h0)]);
      reg16 <= (&(wire11[(3'h6):(3'h4)] ?
          $unsigned(wire7[(3'h4):(2'h2)]) : $unsigned(wire0[(4'hd):(3'h5)])));
    end
  assign wire17 = (~|wire11);
  assign wire18 = $unsigned(wire9[(1'h0):(1'h0)]);
endmodule
