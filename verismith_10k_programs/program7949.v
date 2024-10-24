module top
#(parameter param19 = (((8'hbe) ? ((((8'haa) << (8'hb4)) ? ((8'hb5) >> (8'hb2)) : {(8'h9f)}) ? (8'haa) : {((7'h41) + (8'ha0)), ((8'ha7) ? (8'hb0) : (8'hb3))}) : (({(8'h9e), (8'ha8)} ? (&(8'h9e)) : (~^(8'hb0))) + (8'h9c))) + {({((8'hb4) * (7'h40))} <= (~^(|(8'hb9))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
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
                 reg14,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = ((7'h42) || (~|$unsigned(wire5)));
  assign wire7 = ((($unsigned((wire3 ? wire0 : wire0)) >> ((wire0 ?
                             wire3 : wire0) ?
                         ((8'ha0) ^ wire2) : $unsigned(wire4))) && wire6) ?
                     $signed(wire5[(1'h0):(1'h0)]) : (wire3[(1'h0):(1'h0)] != $signed($signed($signed(wire2)))));
  assign wire8 = (wire2 * wire0);
  assign wire9 = ($unsigned($unsigned(wire2)) == ({((~&wire7) ?
                         $signed(wire0) : wire1),
                     wire7[(2'h2):(1'h0)]} <= wire3));
  assign wire10 = ($unsigned($unsigned({{(8'h9d)}, (wire2 ? wire0 : wire5)})) ?
                      (&(wire9[(3'h6):(1'h0)] ?
                          (|(wire9 + wire4)) : (((8'ha6) ? wire5 : wire4) ?
                              (8'hbd) : $unsigned(wire0)))) : ($unsigned(wire3[(3'h6):(3'h6)]) < (((wire7 && (8'ha0)) ?
                          (~wire8) : (wire2 + wire2)) >> (-wire2[(4'ha):(4'ha)]))));
  assign wire11 = ((7'h44) ?
                      (^$signed(wire9[(4'hf):(3'h6)])) : (|$signed({wire5[(1'h1):(1'h0)]})));
  assign wire12 = ($unsigned($signed((^(+wire2)))) >= $unsigned(wire4));
  assign wire13 = wire0;
  always
    @(posedge clk) begin
      reg14 <= $unsigned($unsigned($unsigned(wire11[(1'h0):(1'h0)])));
      reg15 <= ((^($signed((8'hae)) != wire4)) + (^((reg14[(5'h11):(4'hd)] ?
          wire7 : (wire7 ? wire13 : wire4)) > (^wire10))));
      reg16 <= $unsigned(($signed({(|(8'haf))}) ?
          ((~|$signed(wire6)) ?
              (wire11 == wire9[(1'h0):(1'h0)]) : reg15[(4'h8):(2'h3)]) : (|$signed(wire10[(5'h11):(4'hd)]))));
      reg17 <= reg15;
      reg18 <= (wire6[(3'h4):(1'h0)] > (wire6 && $unsigned((&{wire3}))));
    end
endmodule
