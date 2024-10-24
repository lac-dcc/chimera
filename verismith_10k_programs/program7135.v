module top
#(parameter param63 = (~(~^{{(+(8'hb4))}})), 
parameter param64 = ((+(|(|param63))) ~^ param63))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire53;
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  module4 #() modinst54 (.clk(clk), .wire6(wire1), .y(wire53), .wire8(wire3), .wire7(wire2), .wire5(wire0));
  assign wire55 = (!wire2);
  assign wire56 = (-{$unsigned(((wire55 ? (7'h41) : wire53) > (~|wire1))),
                      wire3[(3'h7):(1'h0)]});
  assign wire57 = (($signed({$signed(wire53)}) ?
                          (({wire53, wire55} ? (wire53 ^~ wire53) : (~|wire1)) ?
                              ($unsigned(wire0) | wire3[(2'h3):(1'h1)]) : $signed(wire56[(1'h1):(1'h1)])) : (-({wire1,
                                  wire1} ?
                              (~^wire53) : $signed(wire56)))) ?
                      (8'hb5) : ($signed($unsigned((wire55 << wire55))) ?
                          (&wire3) : (((wire56 && (8'haf)) ?
                                  wire2 : (wire53 ? wire0 : wire1)) ?
                              wire53 : (~^{wire0}))));
  assign wire58 = (($signed($unsigned((~|wire56))) ?
                          (|$signed({(8'hbd)})) : wire55[(1'h0):(1'h0)]) ?
                      (-(wire56 + $signed(wire57))) : (~^wire3));
  assign wire59 = (~|(^~wire55[(4'h9):(4'h9)]));
  always
    @(posedge clk) begin
      reg60 <= $unsigned(($signed($unsigned((wire58 ?
          (8'hbf) : wire55))) >> ($unsigned(((8'hb6) ?
          wire56 : wire53)) <= ((wire59 ? wire53 : wire1) ?
          wire0[(3'h4):(2'h3)] : (|wire59)))));
      reg61 <= wire55;
    end
  always
    @(posedge clk) begin
      reg62 <= ($unsigned($signed((wire1[(4'ha):(3'h4)] * ((8'ha7) != wire55)))) ~^ $unsigned(wire56));
    end
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire5;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire44;
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire9,
                 wire10,
                 wire11,
                 wire29,
                 wire44,
                 reg49,
                 (1'h0)};
  assign wire9 = {(wire8[(1'h0):(1'h0)] >> $signed($unsigned(wire6))),
                     $signed($signed({wire5[(2'h2):(1'h0)]}))};
  assign wire10 = $signed((8'hae));
  assign wire11 = wire7;
  module12 #() modinst30 (wire29, clk, wire10, wire9, wire6, wire7);
  module31 #() modinst45 (.wire33(wire29), .wire34(wire8), .y(wire44), .clk(clk), .wire35(wire10), .wire36(wire11), .wire32(wire9));
  assign wire46 = wire9;
  assign wire47 = wire44;
  assign wire48 = {wire44,
                      ($unsigned((wire29 ? (!(8'ha1)) : ((8'h9e) ^~ wire46))) ?
                          {wire29[(4'he):(3'h6)]} : {((wire29 ?
                                      wire11 : (8'h9c)) ?
                                  (|wire7) : ((8'hbc) & wire6)),
                              {wire8, $signed(wire5)}})};
  always
    @(posedge clk) begin
      reg49 <= (8'hab);
    end
  assign wire50 = $unsigned(wire46[(3'h7):(3'h5)]);
  assign wire51 = (wire7 && (wire46[(3'h4):(2'h2)] ?
                      ({wire9} ~^ (8'hb4)) : wire9[(3'h4):(2'h3)]));
  assign wire52 = wire29[(5'h14):(5'h12)];
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(4'h8):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  assign y = {wire43, wire42, wire41, wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = (wire32[(3'h7):(3'h6)] ?
                      (wire33 ?
                          (wire34 + wire32[(5'h11):(4'hc)]) : (~&($signed(wire34) == $signed(wire36)))) : (8'hb0));
  assign wire38 = $signed(wire37[(4'h8):(2'h2)]);
  assign wire39 = (($unsigned(wire38[(3'h4):(2'h3)]) ?
                          (~&(wire38[(3'h7):(1'h0)] < $unsigned(wire37))) : ((^(wire32 ?
                                  wire38 : (8'ha0))) ?
                              (^~(wire36 ?
                                  wire32 : wire37)) : {$signed(wire34)})) ?
                      wire33 : $unsigned((&wire32[(5'h11):(2'h2)])));
  assign wire40 = (-$unsigned($signed(wire33[(3'h6):(1'h0)])));
  assign wire41 = wire39;
  assign wire42 = {{(((-wire39) <<< (wire41 < wire40)) == (~^$signed(wire33))),
                          ($unsigned(wire35[(3'h7):(3'h4)]) ?
                              $unsigned((!wire36)) : $unsigned((~wire32)))},
                      {wire36[(3'h7):(2'h3)],
                          $signed(($signed((8'hbb)) ?
                              (wire38 * wire34) : $unsigned(wire41)))}};
  assign wire43 = wire42;
endmodule

module module12
#(parameter param27 = ((-({((8'ha0) ? (7'h41) : (8'ha8))} ? (+((8'hab) ~^ (8'haf))) : (((8'haa) <= (8'hb1)) ? {(8'h9f)} : ((8'haf) >>> (8'hb4))))) ~^ (&{{{(8'hb8)}}})), 
parameter param28 = (((~^(~{param27, param27})) & {((param27 == param27) ? (param27 ^ param27) : (8'h9e))}) < (((param27 >>> (|param27)) ? param27 : ((param27 ? param27 : (8'hb3)) >= (-param27))) - ((~&{param27}) ? (^(^param27)) : ((param27 ? param27 : param27) + (^~(8'h9e)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 (1'h0)};
  assign wire17 = $unsigned(wire13[(1'h1):(1'h0)]);
  assign wire18 = (wire14[(3'h7):(1'h0)] ?
                      (~($unsigned((~&wire15)) ?
                          $unsigned((wire16 ?
                              wire14 : (8'ha7))) : wire16[(3'h6):(1'h1)])) : (wire14 ?
                          ((wire15[(2'h2):(1'h1)] ?
                                  (|wire17) : $signed(wire17)) ?
                              (((8'hb0) && wire16) ?
                                  wire17 : wire15) : (~wire13[(1'h0):(1'h0)])) : (wire13[(1'h0):(1'h0)] * ($unsigned(wire16) | ((8'hba) << wire13)))));
  assign wire19 = $signed(wire16);
  assign wire20 = ((~|(&wire16[(2'h2):(1'h0)])) ?
                      wire14[(3'h6):(2'h2)] : (wire13 ?
                          wire16[(1'h0):(1'h0)] : $signed($unsigned((8'hb0)))));
  assign wire21 = ((wire14[(3'h5):(1'h1)] ?
                      (($unsigned((8'ha0)) ? wire14 : (wire17 <<< (8'ha8))) ?
                          (wire19 > $unsigned((8'ha3))) : wire18[(1'h0):(1'h0)]) : wire18) == $unsigned($unsigned($unsigned((wire17 - wire14)))));
  assign wire22 = $signed(wire14);
  assign wire23 = wire13[(1'h0):(1'h0)];
  assign wire24 = (-(+($signed((wire22 ? wire22 : wire14)) ?
                      wire18 : (|(^~wire16)))));
  assign wire25 = $unsigned($unsigned((&$signed((wire24 ^~ wire14)))));
  assign wire26 = wire25[(4'h9):(4'h8)];
endmodule
