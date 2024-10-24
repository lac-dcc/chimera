module top
#(parameter param52 = ({{(((8'hb3) >>> (8'haa)) ? (^(8'ha5)) : (!(8'hb9)))}, ((&((8'hbe) ? (8'hba) : (8'hb0))) ? {(!(8'hb0))} : ((~&(8'hba)) <<< (~(8'hb0))))} * (+{(((8'hb7) | (8'ha1)) ? (|(8'hb9)) : ((7'h44) ? (8'h9e) : (8'hac)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire43;
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire43,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire5 = (wire4[(1'h0):(1'h0)] ? wire4 : (!wire0));
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = $signed(wire3[(1'h1):(1'h0)]);
  assign wire8 = $unsigned($unsigned(wire3[(2'h3):(2'h3)]));
  module9 #() modinst44 (wire43, clk, wire5, wire2, wire4, wire7, wire0);
  always
    @(posedge clk) begin
      reg45 <= $unsigned($unsigned({$signed((wire0 ? wire5 : wire3))}));
      reg46 <= wire0;
      reg47 <= $signed((|wire3[(2'h2):(1'h0)]));
      reg48 <= $signed((-wire7[(4'he):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg49 <= (|wire2);
      reg50 <= (^~$unsigned((^~{$unsigned((8'hb6)), reg48})));
      reg51 <= (!(~&reg50));
    end
endmodule

module module9
#(parameter param41 = {((&{((8'hb2) << (8'hb5)), {(8'hbd), (8'ha4)}}) ? ((~|(~(8'h9d))) ? ((~^(8'hbf)) > (+(8'hbe))) : (((8'hb3) ? (8'hbf) : (8'hb3)) | {(8'hac), (8'hb0)})) : ((((8'hbc) >= (8'hb1)) ? {(8'hae)} : ((8'hb1) > (8'hb4))) == (8'hb4)))}, 
parameter param42 = ((8'hb2) << (!{param41})))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire32;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 (1'h0)};
  module15 #() modinst33 (wire32, clk, wire13, wire10, wire14, wire11);
  assign wire34 = wire11;
  assign wire35 = wire32[(3'h6):(3'h4)];
  assign wire36 = $signed((8'h9f));
  assign wire37 = wire11[(3'h5):(1'h1)];
  assign wire38 = $signed((~$unsigned($unsigned((wire14 ? (8'hb1) : wire14)))));
  assign wire39 = wire32;
  assign wire40 = wire12[(3'h4):(3'h4)];
endmodule

module module15
#(parameter param30 = (~^(~|((((8'hbd) ? (8'hb4) : (7'h41)) ^~ {(8'hab)}) ? {(8'ha3), (~|(8'hbe))} : ((!(8'hbc)) ? ((8'ha1) ? (8'hb0) : (8'h9c)) : (~^(8'ha7)))))), 
parameter param31 = (&{param30, {(8'hb1), (^~param30)}}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 wire20,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = $unsigned($signed((((~&wire18) + $signed(wire17)) * $unsigned(wire17))));
  assign wire21 = wire18;
  assign wire22 = $unsigned((&$unsigned((~^(wire16 ? wire20 : wire16)))));
  always
    @(posedge clk) begin
      reg23 <= (!((($unsigned(wire22) ?
              wire19[(1'h1):(1'h0)] : $unsigned(wire19)) & (~&(^~wire20))) ?
          (-($unsigned(wire16) ^ wire20)) : {(8'ha0), (wire17 + (~|wire18))}));
      reg24 <= wire16[(2'h2):(1'h0)];
    end
  assign wire25 = $unsigned((~|(-wire21[(4'h9):(1'h0)])));
  assign wire26 = $signed($signed($signed(wire25)));
  assign wire27 = (|{wire22, wire21});
  assign wire28 = {($unsigned($signed(wire25)) ?
                          (^wire22[(1'h0):(1'h0)]) : $unsigned($unsigned((wire16 ?
                              (8'hb7) : wire26)))),
                      wire27[(4'hf):(3'h5)]};
  assign wire29 = (~|$signed(((|(wire25 ? wire20 : wire28)) ?
                      {$signed(wire21)} : $unsigned((wire27 >>> (8'hb5))))));
endmodule
