module top
#(parameter param86 = (-(((((8'hae) ? (7'h44) : (8'hb2)) <<< {(7'h41), (8'hac)}) ? ({(8'ha9), (8'hb8)} ? ((8'ha3) ? (7'h40) : (7'h41)) : ((8'ha5) << (8'hb8))) : (((8'hae) && (8'hb5)) ? ((8'ha7) ? (8'ha4) : (8'hac)) : (8'hbe))) ^~ {({(8'ha4)} ~^ (&(8'haf)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire73;
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire85,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire13,
                 wire14,
                 wire73,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg12,
                 (1'h0)};
  assign wire4 = (^~(~&(!$unsigned(wire1))));
  assign wire5 = wire0[(4'h8):(3'h6)];
  assign wire6 = {wire4, (8'hb4)};
  assign wire7 = $unsigned(wire3);
  assign wire8 = $unsigned(($signed(($signed(wire0) < wire2)) ?
                     $signed((wire7 ?
                         wire1 : {wire5})) : wire5[(4'h8):(3'h7)]));
  assign wire9 = (wire1 ? (8'hb0) : $signed(wire6));
  assign wire10 = {$unsigned($signed({$signed(wire5)})), wire5};
  assign wire11 = ($signed($signed($signed(wire9[(2'h2):(2'h2)]))) ?
                      (+$unsigned($unsigned((wire0 ?
                          wire5 : wire4)))) : (wire7 ?
                          wire9[(1'h1):(1'h0)] : (wire5 ?
                              wire8[(3'h6):(3'h5)] : ({wire2} ?
                                  (~|wire4) : (8'hb5)))));
  always
    @(posedge clk) begin
      reg12 <= ({$unsigned((+((8'hb4) <<< (8'ha2)))),
          (-(wire6 ? (!wire10) : (-wire2)))} >>> (~&$unsigned((!wire4))));
    end
  assign wire13 = {$unsigned((!$signed(((8'hbe) > wire6))))};
  assign wire14 = wire3[(1'h1):(1'h1)];
  module15 #() modinst74 (.wire16(wire5), .y(wire73), .wire17(wire13), .wire19(wire2), .wire18(wire14), .clk(clk), .wire20(wire6));
  assign wire75 = (&$signed((wire14 ^ $unsigned({wire1}))));
  assign wire76 = (wire73[(1'h0):(1'h0)] | wire75);
  always
    @(posedge clk) begin
      reg77 <= wire1;
    end
  assign wire78 = (-reg12);
  assign wire79 = wire4[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg80 <= {wire11};
      if ($unsigned((((+(reg12 == wire76)) << (!$unsigned(wire3))) ?
          wire79 : (((~^wire0) ?
              wire3[(2'h2):(2'h2)] : wire3) >> $unsigned((!wire1))))))
        begin
          reg81 <= $signed((wire8[(1'h0):(1'h0)] ?
              wire11 : ($signed($signed(wire10)) | (reg12[(2'h2):(2'h2)] || wire13))));
          reg82 <= (8'hb3);
        end
      else
        begin
          reg81 <= (~&wire73[(1'h1):(1'h0)]);
        end
      reg83 <= (!wire0);
      reg84 <= ($signed(($unsigned({wire79}) ^ wire79)) ?
          (^wire13[(2'h2):(1'h0)]) : ($unsigned({(wire76 ? wire3 : wire0),
                  {wire78, reg80}}) ?
              ($unsigned($unsigned(wire7)) ?
                  $unsigned($unsigned(wire2)) : (reg80[(3'h7):(3'h4)] <<< (~wire73))) : ((wire10 ?
                  (wire2 ?
                      wire1 : wire1) : {wire76}) && $signed((reg83 | (8'hac))))));
    end
  assign wire85 = ($signed(reg84) ?
                      $unsigned($unsigned($signed({wire75,
                          (8'hb9)}))) : $unsigned($unsigned(($unsigned(wire76) <<< reg77))));
endmodule

module module15  (y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire47;
  assign y = {wire72, wire71, wire69, wire50, wire49, wire21, wire47, (1'h0)};
  assign wire21 = wire17[(3'h4):(2'h3)];
  module22 #() modinst48 (.wire27(wire21), .wire25(wire17), .wire24(wire19), .wire26(wire16), .wire23(wire20), .clk(clk), .y(wire47));
  assign wire49 = $signed(wire21[(4'hb):(3'h5)]);
  assign wire50 = wire49[(3'h5):(2'h2)];
  module51 #() modinst70 (.wire52(wire18), .wire53(wire19), .wire54(wire21), .wire55(wire47), .y(wire69), .clk(clk));
  assign wire71 = wire18;
  assign wire72 = wire47;
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire [(3'h5):(1'h0)] wire53;
  input wire signed [(3'h7):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg59,
                 (1'h0)};
  assign wire56 = {wire53[(1'h0):(1'h0)]};
  assign wire57 = (8'hbe);
  assign wire58 = $signed((-wire52));
  always
    @(posedge clk) begin
      reg59 <= (wire58 ?
          wire55 : ($unsigned((-wire52)) - $signed(wire58[(1'h0):(1'h0)])));
    end
  assign wire60 = (~&(8'ha6));
  assign wire61 = reg59;
  assign wire62 = $unsigned((~wire58[(2'h2):(1'h0)]));
  assign wire63 = $signed(wire52[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg64 <= $signed(wire62);
      reg65 <= ((7'h44) ?
          $signed(($signed(wire58) != wire57[(1'h1):(1'h1)])) : $signed((~^((wire53 ?
                  wire52 : wire61) ?
              wire63 : (wire56 >= wire56)))));
      reg66 <= (((~&$unsigned((reg64 ?
              wire56 : reg59))) >>> $signed($signed(wire60[(2'h3):(2'h3)]))) ?
          $signed({wire57}) : $unsigned((~$unsigned((^~wire56)))));
      reg67 <= (~($unsigned({(wire54 == wire55)}) ?
          $signed($unsigned((8'ha0))) : wire53));
      reg68 <= wire52[(1'h1):(1'h0)];
    end
endmodule

module module22
#(parameter param46 = (+({{((8'h9d) * (8'hb4))}, (~{(8'ha9), (8'ha1)})} || (7'h42))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = (wire24 ?
                      ((8'hbb) ~^ {$unsigned(wire23[(1'h0):(1'h0)])}) : $unsigned((+wire23[(3'h5):(1'h0)])));
  assign wire29 = $signed($unsigned($unsigned($unsigned((wire23 < (8'hb5))))));
  assign wire30 = wire27;
  assign wire31 = wire29;
  assign wire32 = (wire30[(5'h11):(4'hb)] ?
                      $signed((wire26[(1'h1):(1'h1)] ?
                          {{wire28,
                                  wire30}} : $signed($signed(wire31)))) : (+$unsigned((-{wire29,
                          wire23}))));
  assign wire33 = {$unsigned($signed(((wire32 >>> wire25) ?
                          (^~wire28) : $unsigned((8'hb5))))),
                      $signed((|($unsigned((8'ha7)) ?
                          {wire32, wire28} : (wire30 + wire23))))};
  assign wire34 = (!(~$signed(wire33[(1'h0):(1'h0)])));
  assign wire35 = $unsigned(wire31[(1'h0):(1'h0)]);
  assign wire36 = $signed($signed(wire29));
  assign wire37 = $signed(({(-(wire34 < (7'h40)))} ?
                      wire30[(4'hf):(3'h6)] : $signed(wire36[(2'h3):(2'h3)])));
  assign wire38 = wire30[(3'h5):(2'h2)];
  assign wire39 = wire29[(4'hf):(3'h7)];
  assign wire40 = $unsigned($signed(wire29[(5'h10):(2'h2)]));
  assign wire41 = (!$unsigned(((wire26 - (~&wire29)) ?
                      (!wire27) : (wire23[(1'h1):(1'h0)] >= $signed((8'ha6))))));
  assign wire42 = (+$unsigned($signed(wire33)));
  assign wire43 = {(wire32 <<< wire25[(4'h8):(2'h3)]),
                      (wire40[(1'h1):(1'h1)] ? $unsigned(wire33) : wire35)};
  assign wire44 = wire24;
  assign wire45 = $signed($signed((~^wire28)));
endmodule
