module top
#(parameter param33 = {{((((8'hb0) ? (8'hbf) : (8'hb1)) ? ((8'haf) ? (8'ha0) : (8'haf)) : {(7'h43), (8'hbc)}) >= ({(8'hb3)} ? ((7'h43) ? (8'had) : (8'ha7)) : (~(7'h41)))), (({(8'ha4), (8'hb9)} ? (8'haf) : ((8'ha9) ? (8'hbd) : (8'haf))) == (((7'h41) ? (8'hac) : (8'hb6)) ? ((8'h9c) ? (8'hbe) : (8'h9f)) : ((7'h44) > (8'hb7))))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire14,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = (~|wire3[(1'h0):(1'h0)]);
  assign wire5 = (|({wire3[(2'h3):(2'h2)],
                     (8'hb0)} && ($signed($signed(wire2)) * {(7'h40),
                     $unsigned(wire0)})));
  assign wire6 = $signed({(8'ha6), (8'ha2)});
  assign wire7 = ((~&$unsigned(wire1[(2'h3):(2'h3)])) ~^ $unsigned(wire5));
  always
    @(posedge clk) begin
      if (($signed((((wire7 ? wire0 : wire1) ?
          (wire3 ?
              wire6 : (8'haa)) : $signed(wire1)) || $unsigned(wire4))) && $signed((((wire2 >= wire1) && (wire5 < wire6)) & ((wire1 ?
          (8'hbc) : wire5) && (~&wire3))))))
        begin
          reg8 <= {wire3[(1'h0):(1'h0)]};
        end
      else
        begin
          reg8 <= (wire4 || ($unsigned((wire5 ?
                  (wire5 * wire0) : {wire0, wire6})) ?
              (8'ha3) : wire2[(1'h1):(1'h1)]));
        end
      reg9 <= (&(($signed($signed(wire2)) ?
          (~^$unsigned(reg8)) : wire3) ^~ wire4[(4'he):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg10 <= $signed(((($unsigned(wire7) ^~ $signed(wire5)) ?
          {{reg8, (8'hbc)},
              (-wire7)} : wire0[(3'h4):(1'h0)]) * $signed(wire1[(2'h2):(2'h2)])));
      reg11 <= $signed((~|$signed({(-wire4)})));
      reg12 <= $unsigned(wire3);
      reg13 <= ((wire1 ?
          reg10 : (&(wire2[(3'h6):(3'h4)] ?
              ((8'h9f) >> reg12) : {wire2}))) << (wire6 ?
          (($unsigned(wire1) ? wire1 : wire0) ?
              $signed(reg8) : (|$signed((8'hb0)))) : $signed((&$signed(wire5)))));
    end
  assign wire14 = $unsigned(((^~(~&wire1[(2'h3):(1'h0)])) > wire2[(3'h6):(3'h6)]));
  module15 #() modinst29 (.y(wire28), .wire16(reg10), .wire18(reg8), .wire20(wire3), .wire19(wire2), .clk(clk), .wire17(reg9));
  assign wire30 = ($unsigned(wire5[(4'h9):(3'h4)]) ?
                      {({$unsigned(reg11), {wire4, reg10}} != ((wire6 ?
                                  reg9 : wire7) ?
                              $unsigned(wire7) : (wire3 ? wire28 : reg12))),
                          (^~reg11)} : wire1[(2'h3):(1'h0)]);
  assign wire31 = (({({wire1, reg9} ? reg8 : (reg8 ? reg8 : wire7)),
                              ((+wire2) <<< $unsigned(reg8))} ?
                          (8'h9e) : (+wire5)) ?
                      {$unsigned(((wire1 == reg8) ? (8'ha8) : (~^wire1))),
                          (wire3[(3'h5):(1'h1)] ?
                              ((wire28 ? wire5 : reg10) ?
                                  wire4 : (wire4 ?
                                      reg13 : (8'hb0))) : wire4[(2'h2):(1'h1)])} : wire30);
  assign wire32 = wire28[(2'h3):(1'h1)];
endmodule

module module15
#(parameter param27 = ((({{(8'hb5), (8'hb0)}, (~(8'hb9))} >= (((8'hbf) ? (8'ha0) : (8'ha7)) >>> {(8'hbb), (8'hb9)})) ? (({(8'hb7), (8'hae)} ? (~(8'hae)) : ((8'hb2) ? (8'ha4) : (8'hb3))) >> (^(+(8'hb4)))) : {{((8'ha2) != (8'had))}}) ^~ ({((^(8'h9f)) ? ((7'h41) && (7'h43)) : {(8'hb8)}), ({(7'h40)} * ((8'ha0) ? (8'h9d) : (8'had)))} && (~^(((8'hbf) + (8'hbf)) ? (|(8'ha2)) : ((8'hbe) && (8'h9f)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire24, wire23, reg26, reg25, reg22, reg21, (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= (($unsigned($unsigned((wire18 ?
              wire20 : wire18))) > wire18[(4'h8):(4'h8)]) ?
          $unsigned(wire16[(1'h1):(1'h1)]) : $signed($signed($unsigned(wire18[(4'h8):(1'h0)]))));
      reg22 <= (($signed(wire17) >>> reg21) & $signed(wire16));
    end
  assign wire23 = wire17[(4'hd):(1'h1)];
  assign wire24 = $unsigned($unsigned(wire17));
  always
    @(posedge clk) begin
      reg25 <= (~^(($signed($signed(wire19)) ?
              $unsigned((7'h41)) : ($signed(wire20) < (wire16 << wire16))) ?
          ($unsigned($unsigned(wire18)) - ($signed(wire18) ?
              (^~wire19) : $unsigned(reg21))) : $unsigned(reg22)));
      reg26 <= wire17[(3'h4):(1'h0)];
    end
endmodule
