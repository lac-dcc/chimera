module top
#(parameter param58 = {(((^~((8'hb0) ? (8'haa) : (7'h44))) ? (!{(8'haa)}) : (((8'hbf) || (8'ha2)) ? ((8'hb4) | (8'hb7)) : ((8'h9f) ? (8'ha0) : (8'hb3)))) >= ((((7'h42) && (8'hbc)) ? ((8'hb1) ^~ (8'hb4)) : (!(8'hb5))) >>> {((8'hac) >>> (7'h42)), ((8'hbe) ? (8'hb2) : (7'h40))}))}, 
parameter param59 = ((param58 - (param58 ? (((8'hb7) ? param58 : param58) ? (~|param58) : param58) : (~|(~(8'hae))))) ? ((((^param58) | (param58 ? (8'hb1) : (8'ha7))) << (param58 ? (param58 >= (8'haf)) : param58)) ? (8'haa) : {((~|param58) >= {(8'ha8), (8'hbf)}), (param58 ? param58 : (param58 ? param58 : param58))}) : ((({(8'ha9), param58} * (param58 - param58)) ? {(|param58), (param58 <<< param58)} : {param58, (param58 >= param58)}) ? (-(!(param58 ? param58 : (8'haf)))) : param58)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire45;
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire50,
                 wire47,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire45,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire0 ? ((~&wire2) << (~wire3)) : wire3[(3'h5):(2'h3)]);
  assign wire6 = (wire3[(3'h5):(3'h5)] ? (wire0 ~^ wire1) : {wire4});
  assign wire7 = {{(^($unsigned(wire3) ?
                             (wire0 ? wire3 : (8'h9f)) : (!wire1)))},
                     ((+(wire4 ?
                         wire6[(3'h4):(1'h1)] : wire3[(2'h3):(1'h0)])) || ($signed($signed(wire4)) >= (wire1[(4'h9):(1'h1)] ?
                         wire4[(4'hb):(4'h9)] : $unsigned((8'h9e)))))};
  assign wire8 = (~&wire1[(4'hc):(3'h7)]);
  module9 #() modinst46 (.clk(clk), .wire11(wire0), .wire12(wire7), .wire14(wire3), .wire10(wire8), .wire13(wire2), .y(wire45));
  assign wire47 = wire6;
  always
    @(posedge clk) begin
      reg48 <= {wire4[(4'h8):(1'h1)]};
      reg49 <= ($signed((^~(wire1[(5'h11):(3'h7)] ?
              (wire5 ~^ (7'h44)) : ((7'h43) ? wire1 : wire47)))) ?
          {({$unsigned(wire45), (8'ha0)} ?
                  ((&wire45) << reg48[(3'h7):(3'h7)]) : $signed($unsigned(wire4))),
              (&{((8'haa) ? wire6 : reg48),
                  $unsigned(reg48)})} : ($signed(({wire4} ?
              $signed(wire4) : (wire45 && wire4))) | wire7));
    end
  assign wire50 = (wire1[(2'h2):(1'h0)] ?
                      ($signed((-wire6)) - ((~(wire1 <= wire5)) ?
                          reg48 : $signed($unsigned((8'hb0))))) : wire8[(5'h13):(4'ha)]);
  always
    @(posedge clk) begin
      reg51 <= (wire3[(2'h2):(2'h2)] > ($signed({$unsigned((7'h42))}) ?
          (~^$signed(wire4)) : ((~^(wire4 << wire50)) || ((wire3 ?
              (8'hbe) : wire5) <= $unsigned((8'ha0))))));
      reg52 <= (^$unsigned(reg51));
    end
  always
    @(posedge clk) begin
      reg53 <= $unsigned((wire47 <= (wire3[(5'h10):(4'hc)] <= ((wire3 ?
          reg48 : wire6) & (wire47 ? wire7 : wire45)))));
      reg54 <= (!wire4[(1'h0):(1'h0)]);
    end
  assign wire55 = (8'haf);
  assign wire56 = $unsigned((wire6 ~^ wire55));
  assign wire57 = $signed($unsigned((reg48 ?
                      wire45[(4'h8):(3'h6)] : ($signed((8'haa)) >> (^~reg54)))));
endmodule

module module9
#(parameter param43 = (~&(~&(-({(8'h9c), (8'hb5)} >>> {(8'hb7), (8'hb4)})))), 
parameter param44 = (((~|((&param43) || (param43 + (8'haf)))) ? (((param43 - param43) >= param43) + (^~(param43 ? param43 : param43))) : param43) ? ((~^((param43 ? param43 : (8'hb9)) ? (~param43) : (param43 ? param43 : param43))) ? ((&{param43, param43}) == (((8'hbe) | param43) ? param43 : (param43 ? (8'had) : param43))) : {(&(~|(8'hbc))), {(param43 != param43)}}) : param43))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire26;
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 reg41,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  module15 #() modinst27 (wire26, clk, wire14, wire13, wire12, wire11);
  assign wire28 = $signed($signed(wire10[(1'h0):(1'h0)]));
  assign wire29 = $signed(wire11);
  assign wire30 = {$signed($unsigned(wire28[(2'h3):(1'h0)]))};
  always
    @(posedge clk) begin
      reg31 <= (wire30[(4'hf):(3'h5)] ?
          wire30[(3'h5):(3'h4)] : (wire28 <<< wire12[(2'h2):(1'h0)]));
      reg32 <= $unsigned($signed((8'ha6)));
      reg33 <= $unsigned(($signed({$signed(wire26)}) ?
          ($signed((!wire30)) < $signed($unsigned(wire10))) : ((((8'hb3) | (8'hb1)) ?
                  reg32[(1'h0):(1'h0)] : $unsigned(wire13)) ?
              $unsigned({reg32, wire13}) : (reg31 - {(8'ha0), (8'hb7)}))));
      reg34 <= $unsigned(((+$signed(reg33[(1'h1):(1'h0)])) ?
          (|wire13) : {(wire29 || (reg32 ? wire12 : wire12)),
              $unsigned(wire29[(1'h1):(1'h1)])}));
      reg35 <= (~^$signed({$signed(wire11)}));
    end
  assign wire36 = wire10[(3'h5):(3'h5)];
  assign wire37 = (~^$unsigned(($signed($signed(reg32)) ?
                      ($unsigned(wire30) ^ (wire36 ?
                          reg34 : wire29)) : $signed(wire28))));
  assign wire38 = ((+reg33) ?
                      $signed(wire13[(3'h5):(2'h2)]) : (~|((-(wire12 << wire13)) ?
                          $unsigned((wire11 << wire14)) : (~&(!(8'hb1))))));
  assign wire39 = $unsigned((+(reg34 & $signed(reg33))));
  always
    @(posedge clk) begin
      reg40 <= (reg31[(2'h2):(2'h2)] ?
          wire26 : ({(wire28[(3'h5):(2'h2)] >> {wire26}),
                  (reg32 ? (-wire14) : (^wire30))} ?
              ($unsigned(reg34[(5'h11):(5'h11)]) ?
                  ($signed(wire14) >> $signed(wire13)) : ((wire28 ?
                      wire39 : wire38) <<< (~(8'h9d)))) : (^~$unsigned((wire11 << wire26)))));
      reg41 <= reg35;
    end
  assign wire42 = reg35;
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire20;
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  assign y = {wire25, wire24, wire23, wire22, wire20, reg21, (1'h0)};
  assign wire20 = $signed((wire18 ?
                      (~wire17) : $unsigned($signed($signed(wire18)))));
  always
    @(posedge clk) begin
      reg21 <= wire20;
    end
  assign wire22 = {wire19[(2'h3):(1'h0)], $signed(wire17[(2'h2):(2'h2)])};
  assign wire23 = wire20[(1'h0):(1'h0)];
  assign wire24 = (wire19[(1'h0):(1'h0)] ? $unsigned($signed(wire16)) : wire18);
  assign wire25 = wire20[(3'h4):(2'h3)];
endmodule
