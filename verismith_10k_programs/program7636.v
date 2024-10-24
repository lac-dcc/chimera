module top
#(parameter param35 = (|(-{(((8'hb1) + (7'h43)) ? ((7'h43) && (8'hbf)) : (+(8'hb0))), (^(~|(8'ha7)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire4,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire4 = $signed(((wire0 ?
                     wire3[(3'h7):(3'h6)] : (((8'hb7) ? (8'hb2) : wire1) ?
                         (wire0 ?
                             wire0 : wire2) : (wire2 - wire3))) != (({(8'hab),
                         (8'hb1)} ?
                     (wire1 ?
                         wire3 : wire0) : (8'haf)) <<< $unsigned($signed((8'hab))))));
  module5 #() modinst19 (.y(wire18), .wire9(wire3), .clk(clk), .wire7(wire1), .wire8(wire0), .wire6(wire2));
  assign wire20 = (7'h44);
  assign wire21 = $signed(($signed(wire20) ^~ $signed({(wire18 | wire3),
                      (wire0 >>> wire20)})));
  assign wire22 = (wire21[(3'h4):(1'h0)] <<< ($signed(wire0[(1'h1):(1'h1)]) != wire20[(4'ha):(3'h5)]));
  always
    @(posedge clk) begin
      reg23 <= {(wire3 ? {wire18, wire4[(3'h5):(2'h3)]} : wire1),
          $signed(wire3)};
      reg24 <= ((~&(8'hb4)) || (wire3[(1'h1):(1'h1)] ?
          wire3[(4'ha):(3'h7)] : ((^(~|wire20)) ? wire22 : $signed(wire3))));
      reg25 <= wire20[(1'h0):(1'h0)];
      reg26 <= ($unsigned($signed(wire20[(4'hc):(3'h5)])) ?
          wire4 : reg23[(4'hd):(4'ha)]);
      reg27 <= wire18[(2'h2):(1'h0)];
    end
  assign wire28 = wire21;
  assign wire29 = wire1;
  assign wire30 = (^$unsigned($unsigned(wire29)));
  assign wire31 = ({(~&{(wire30 ? (8'hb9) : (8'hbb)),
                          wire3})} + wire22[(3'h6):(1'h0)]);
  assign wire32 = (~&(wire28 >>> (^wire2)));
  assign wire33 = ((wire32 != $signed({wire29[(3'h6):(3'h6)]})) <= wire1);
  assign wire34 = reg27[(4'ha):(2'h2)];
endmodule

module module5
#(parameter param17 = {((+(8'hb0)) <<< (^~((8'hba) ? (^~(7'h40)) : {(8'hbc), (8'haf)}))), (({((8'hbd) ? (8'hb7) : (8'haf))} << {((8'h9e) != (7'h43))}) ? ((((8'hb0) != (8'hb0)) ? ((8'ha0) < (8'hbd)) : ((8'h9c) ? (7'h41) : (8'hb4))) | (^((8'hb7) ? (8'ha0) : (8'hbe)))) : ((((8'hb6) >> (8'haf)) >= ((8'ha1) ? (8'hb7) : (7'h44))) >>> (^{(8'hba)})))})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = (wire6[(3'h7):(3'h6)] ?
                      ((($unsigned(wire8) << {wire8}) != ((~wire9) * (^wire7))) ?
                          (&wire7) : wire7[(1'h1):(1'h1)]) : ((&wire6[(3'h5):(2'h2)]) ?
                          (wire7 <= (8'ha6)) : $signed(wire9)));
  assign wire11 = {$signed((wire6 >= wire6[(4'h9):(4'h9)]))};
  assign wire12 = ((-wire7[(2'h2):(1'h0)]) ?
                      (|{wire9[(3'h6):(3'h5)]}) : wire7[(1'h1):(1'h1)]);
  assign wire13 = (wire7[(3'h4):(1'h1)] & wire7[(2'h3):(2'h2)]);
  assign wire14 = (($unsigned({{wire6, wire12}, $unsigned(wire11)}) ?
                      $unsigned(wire10) : $signed($unsigned(wire6[(1'h1):(1'h1)]))) >> (^$unsigned($unsigned($signed(wire6)))));
  assign wire15 = $signed({($unsigned(wire6[(4'hc):(2'h2)]) ?
                          ($unsigned(wire6) ?
                              wire7 : {wire11, wire14}) : {(wire11 >= (8'hb9)),
                              wire11}),
                      (wire6[(4'hf):(4'hc)] >>> wire10)});
  assign wire16 = ($unsigned((+($signed(wire12) + (wire7 ~^ wire8)))) <= $unsigned({{(8'haf),
                          wire14[(4'h9):(1'h1)]},
                      $unsigned((+(8'h9f)))}));
endmodule
