module top
#(parameter param25 = (+(((~^{(8'hbb)}) == (((8'h9f) ? (7'h42) : (8'ha9)) + ((8'hbd) + (8'hab)))) <<< {(~|((8'h9c) ? (8'hac) : (8'h9d))), (((8'hb5) ? (8'had) : (8'ha3)) | (^(8'ha0)))})), 
parameter param26 = (~|{{(8'hba)}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($unsigned({(|wire0), (8'hbe)})));
  always
    @(posedge clk) begin
      reg6 <= ($unsigned(wire1) * ($signed((8'hbb)) ?
          ($unsigned(((8'hb9) ?
              wire2 : (8'hb2))) - wire3[(2'h3):(2'h3)]) : (~|wire4[(3'h7):(1'h0)])));
    end
  assign wire7 = wire5[(2'h2):(1'h0)];
  assign wire8 = wire0[(3'h4):(1'h0)];
  assign wire9 = ((^{reg6[(1'h0):(1'h0)], wire1}) ?
                     ($unsigned((~&wire5)) ?
                         wire1[(1'h0):(1'h0)] : wire5[(4'h9):(3'h5)]) : ($signed($unsigned((8'hb6))) ?
                         (8'ha1) : (!$signed($unsigned(wire0)))));
  assign wire10 = {{(&wire8[(3'h6):(3'h6)]),
                          {$unsigned((^~wire3)),
                              ((wire5 ~^ wire5) ? wire5 : (^~wire1))}}};
  assign wire11 = {$unsigned({((&(8'hae)) ?
                              (wire4 ? (7'h40) : (8'hbd)) : $signed((8'ha6))),
                          (!{wire5, wire7})}),
                      wire3[(1'h1):(1'h0)]};
  assign wire12 = $signed((8'hb8));
  always
    @(posedge clk) begin
      reg13 <= wire1[(4'hf):(4'hc)];
      reg14 <= ((wire9 ? $signed(wire8) : (7'h41)) ?
          ((+(+$signed(wire11))) | reg6) : ($unsigned(wire7) ?
              $unsigned({wire0[(2'h2):(2'h2)]}) : wire12));
    end
  assign wire15 = (~|{(wire10[(3'h4):(1'h1)] ^~ (~(~|wire7)))});
  always
    @(posedge clk) begin
      reg16 <= wire12[(4'hc):(3'h4)];
      reg17 <= $unsigned($unsigned($signed(reg13)));
    end
  assign wire18 = $unsigned(wire3);
  assign wire19 = wire11[(2'h2):(2'h2)];
  assign wire20 = wire18[(4'hb):(3'h7)];
  assign wire21 = $unsigned((~&($unsigned((reg17 ? wire0 : wire5)) ?
                      (~&wire3[(1'h0):(1'h0)]) : (^wire1[(4'ha):(4'h9)]))));
  assign wire22 = $unsigned({wire11});
  assign wire23 = (wire1[(3'h4):(3'h4)] >= wire7);
  assign wire24 = (^$unsigned(((!wire23) ^ reg6)));
endmodule
