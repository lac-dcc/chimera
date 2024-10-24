module top
#(parameter param26 = (-(((~{(8'hae), (8'ha3)}) ? {(&(8'hb9)), ((8'ha3) >> (8'haa))} : (((8'h9e) == (8'h9f)) ? ((8'hb0) || (8'hba)) : ((8'hb0) <= (8'h9c)))) ? {((~|(8'h9c)) >>> ((8'hbe) ? (8'hbe) : (8'had))), {(^(8'h9c))}} : ({(-(8'hb9))} && (!((8'hac) && (8'ha5)))))), 
parameter param27 = param26)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (8'ha6);
  assign wire7 = ((wire5 || (((wire6 <= wire5) ?
                     (&wire5) : wire4) + $signed(wire3))) <= $signed((|$unsigned(wire6[(1'h1):(1'h1)]))));
  assign wire8 = ((wire7 ?
                     wire2 : $signed(wire1[(1'h1):(1'h0)])) || $unsigned($unsigned($unsigned((!(8'hb2))))));
  assign wire9 = ($unsigned((wire1[(4'hf):(4'hc)] ^~ wire3)) ?
                     $signed((~wire7)) : $unsigned($signed((|(|wire5)))));
  assign wire10 = $signed(wire8[(1'h0):(1'h0)]);
  assign wire11 = ((((wire5[(2'h2):(2'h2)] ?
                          $unsigned(wire9) : {(8'hb9)}) <= (|{wire7, wire2})) ?
                      (wire6 + {(|wire2)}) : $unsigned(wire10[(4'hc):(3'h7)])) ^~ ($unsigned((wire9[(5'h11):(3'h6)] ^ {wire2,
                          wire6})) ?
                      $unsigned(wire8) : $signed((^$unsigned(wire2)))));
  assign wire12 = $signed($signed($signed(((&wire1) ?
                      (wire0 ? wire4 : (8'hb6)) : (~|wire3)))));
  assign wire13 = $unsigned($unsigned(wire8));
  assign wire14 = ({{wire12, (~|$unsigned(wire6))},
                      ((wire4 || $signed(wire6)) >= ((wire9 ? wire3 : wire2) ?
                          (wire3 ?
                              wire7 : wire12) : wire8))} + (~^($unsigned($signed(wire10)) ?
                      $signed(wire13[(1'h0):(1'h0)]) : ((wire5 < wire13) << $unsigned(wire12)))));
  always
    @(posedge clk) begin
      reg15 <= $signed({wire11[(4'hd):(3'h5)],
          ((wire7 + (wire13 ? wire3 : wire0)) == $signed((wire8 ?
              wire13 : wire10)))});
      reg16 <= wire8;
      reg17 <= $unsigned($unsigned(((8'h9d) ?
          reg16[(4'hd):(4'hd)] : $unsigned(wire7))));
      reg18 <= reg15;
    end
  assign wire19 = reg17;
  assign wire20 = wire4;
  assign wire21 = wire11[(2'h3):(2'h2)];
  assign wire22 = wire7[(4'he):(2'h2)];
  assign wire23 = $unsigned((7'h42));
  assign wire24 = $unsigned((wire23 && ($signed($unsigned(wire11)) != $signed(reg18))));
  assign wire25 = wire13[(1'h0):(1'h0)];
endmodule
