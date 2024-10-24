module top
#(parameter param73 = (((^~(^~((7'h43) ? (8'hb5) : (8'hbe)))) > (~&({(8'hbe), (8'hbb)} ? {(8'ha0)} : ((8'hb4) <<< (8'hab))))) ? (|(|(((8'hb9) ? (8'hb6) : (8'hb2)) ? (^~(8'hbd)) : (+(8'ha6))))) : ((^((8'h9c) - ((8'hb4) ? (8'had) : (8'hb3)))) ? (8'hbf) : {((+(8'ha2)) ? (|(8'ha7)) : ((8'hb2) ? (8'ha1) : (8'ha2)))})), 
parameter param74 = (param73 + param73))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire68;
  assign y = {wire72, wire71, wire70, wire68, (1'h0)};
  module4 #() modinst69 (.wire7(wire3), .clk(clk), .wire5(wire2), .y(wire68), .wire6(wire1), .wire8(wire0));
  assign wire70 = wire0[(4'h8):(3'h7)];
  assign wire71 = $signed($signed(wire3[(4'ha):(4'h8)]));
  assign wire72 = $unsigned((!wire68));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire5;
  input wire [(3'h6):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire32;
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire34,
                 wire10,
                 wire11,
                 wire12,
                 wire32,
                 reg64,
                 reg63,
                 reg62,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= (wire6 < wire6);
    end
  assign wire10 = wire8[(4'hd):(4'h8)];
  assign wire11 = (!({((wire5 & wire8) <= (wire5 >>> wire7)),
                          {wire7[(1'h1):(1'h1)]}} ?
                      wire8[(4'hf):(1'h1)] : (^(~&(&wire10)))));
  assign wire12 = ((($unsigned((&(8'ha6))) >> $unsigned((!wire10))) ?
                          {((~wire6) & wire11[(3'h4):(1'h1)]),
                              $unsigned($unsigned(wire8))} : $signed(wire5)) ?
                      {{{wire10[(3'h4):(2'h3)]}}} : (8'hb7));
  module13 #() modinst33 (.wire15(wire6), .y(wire32), .wire16(reg9), .wire14(wire5), .clk(clk), .wire17(wire7));
  assign wire34 = ($unsigned({wire11}) ?
                      wire6[(2'h3):(2'h3)] : $signed($unsigned((((8'ha4) ?
                              (8'ha1) : wire6) ?
                          (wire10 ? (7'h41) : wire10) : {(8'h9f)}))));
  module35 #() modinst55 (.wire37(wire8), .y(wire54), .wire39(wire32), .clk(clk), .wire38(wire12), .wire36(wire7));
  assign wire56 = $signed({(^~(~^$signed(wire5))),
                      (~&(((8'ha8) & wire12) <= (~|wire11)))});
  assign wire57 = (((8'haf) < wire32) * $unsigned({wire10[(2'h3):(2'h2)],
                      wire32}));
  assign wire58 = wire56[(3'h6):(3'h6)];
  assign wire59 = wire5;
  assign wire60 = (wire12[(2'h2):(2'h2)] ?
                      (((((8'hb4) ? wire58 : wire58) ?
                              $unsigned((7'h41)) : wire10) ~^ (~$unsigned((8'ha7)))) ?
                          {({wire5} > (wire5 > wire32))} : $signed((+$signed((8'hba))))) : (|$signed(reg9)));
  assign wire61 = ((|wire12[(1'h0):(1'h0)]) ?
                      ((8'hbb) >>> ($unsigned($unsigned(wire56)) >> $unsigned({wire60}))) : (wire57[(5'h11):(4'he)] && wire6));
  always
    @(posedge clk) begin
      reg62 <= (^((~$signed((|(8'h9c)))) ?
          wire60[(2'h2):(1'h1)] : {{wire60, ((8'ha4) << (8'hbd))},
              ((wire10 ^~ wire6) ? (wire11 < wire61) : (+wire58))}));
      reg63 <= $unsigned(wire34[(3'h7):(2'h2)]);
      reg64 <= (8'ha5);
    end
  assign wire65 = reg62;
  assign wire66 = $unsigned({$unsigned((~|(!wire57))),
                      $signed({$unsigned(wire5)})});
  assign wire67 = $unsigned(((&wire12[(1'h0):(1'h0)]) ?
                      ($signed(wire66[(2'h3):(1'h0)]) ?
                          wire54 : reg9[(3'h6):(1'h1)]) : (wire5[(4'he):(3'h5)] != (((7'h42) ^ reg62) ?
                          wire54[(3'h4):(3'h4)] : (reg62 ^ wire8)))));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = wire37[(4'h8):(3'h6)];
  assign wire41 = $signed((~&{$unsigned((wire38 || wire36))}));
  always
    @(posedge clk) begin
      reg42 <= (^wire36);
      reg43 <= ((wire39[(2'h3):(1'h0)] << wire36) ^~ ($signed(wire39) ?
          wire37 : wire36[(5'h12):(5'h10)]));
    end
  assign wire44 = (~|(({(wire39 < wire36)} || ((8'hba) ?
                          $unsigned(wire41) : $unsigned((8'hb5)))) ?
                      wire36[(3'h5):(2'h2)] : wire36[(4'hf):(1'h0)]));
  assign wire45 = $signed(wire36);
  always
    @(posedge clk) begin
      reg46 <= wire44;
      reg47 <= $unsigned(($unsigned(($signed(wire37) - wire38)) ?
          reg43[(4'hb):(1'h1)] : wire44));
    end
  assign wire48 = (^~{(((wire45 ? wire45 : (7'h42)) ~^ wire38) ?
                          $unsigned((reg47 >>> wire40)) : $unsigned((wire37 ~^ wire40)))});
  assign wire49 = wire40[(1'h1):(1'h1)];
  assign wire50 = wire40;
  assign wire51 = ($unsigned((^~$signed(wire50[(4'h9):(3'h6)]))) - wire40);
  assign wire52 = ($signed($unsigned($unsigned((wire39 ?
                      wire44 : wire36)))) & reg46[(4'hf):(4'hb)]);
  assign wire53 = wire50;
endmodule

module module13
#(parameter param31 = (!({({(8'hb4)} ? {(8'ha4)} : (|(8'h9c)))} <= ((((8'hb6) | (8'ha3)) * ((8'ha2) ? (8'hb7) : (8'hb1))) >>> {(^~(8'h9e))}))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  assign y = {wire30,
                 wire20,
                 wire19,
                 wire18,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = wire15;
  assign wire19 = (({$unsigned((~&wire16))} ^~ wire14) ?
                      $unsigned($unsigned(wire18[(2'h3):(1'h1)])) : (wire18[(4'h9):(4'h8)] ?
                          $signed($unsigned($unsigned(wire14))) : {(((8'hb4) < wire17) >> (+(8'hb6))),
                              (^(~&wire17))}));
  assign wire20 = wire17;
  always
    @(posedge clk) begin
      reg21 <= wire17[(3'h4):(1'h0)];
      reg22 <= ((~|(~&wire19[(2'h2):(1'h1)])) ?
          ((|((~wire19) ?
              wire20 : (|wire20))) >= ((^~wire20[(1'h0):(1'h0)]) - ((wire16 - wire17) ?
              (!reg21) : wire14[(2'h2):(2'h2)]))) : ($unsigned((wire17[(1'h0):(1'h0)] <= wire17)) ?
              (reg21 ?
                  (~&wire14[(3'h6):(2'h3)]) : {(wire14 ? reg21 : (7'h44)),
                      wire20[(2'h3):(1'h0)]}) : $signed((^~{wire16}))));
      reg23 <= $signed(wire19[(3'h7):(3'h5)]);
      reg24 <= (($unsigned(((reg21 ? wire18 : wire14) ?
              $signed((8'ha1)) : {wire14})) ~^ (((wire17 && (8'hbc)) ?
                  wire16[(2'h2):(1'h1)] : wire16) ?
              ((wire16 ? wire18 : wire18) <<< (^wire17)) : wire19)) ?
          $signed((wire14 ? reg22 : reg22[(4'hc):(3'h6)])) : (8'haf));
      if (wire15[(1'h0):(1'h0)])
        begin
          reg25 <= ($signed(wire14) ?
              {((8'ha8) ?
                      (+wire15[(2'h2):(2'h2)]) : $unsigned($signed(wire17)))} : $signed((($signed(reg22) ?
                      (^~(8'hbf)) : $unsigned(wire19)) ?
                  reg22 : $signed({(8'had)}))));
        end
      else
        begin
          reg25 <= (~&wire14);
          reg26 <= $unsigned(reg24[(4'h8):(3'h6)]);
          reg27 <= reg26;
          reg28 <= reg26[(1'h1):(1'h1)];
          reg29 <= (reg27[(4'h8):(3'h4)] >= {$signed(((wire19 ?
                      wire14 : reg25) ?
                  reg28 : $signed(reg22)))});
        end
    end
  assign wire30 = reg21;
endmodule
