module top
#(parameter param45 = ((-(^((+(8'h9c)) * ((8'h9d) ? (8'hba) : (8'hab))))) ? ((~&{((7'h41) << (7'h44))}) ? (8'hba) : ((8'had) >> (((8'h9c) ? (8'ha8) : (8'ha9)) ? (~(8'ha1)) : ((8'hb7) >> (8'ha4))))) : ((8'ha9) < ((((8'ha4) == (8'hbe)) ? (~^(8'ha4)) : ((8'ha6) && (8'hb6))) ? (~&{(8'hb5)}) : ((~|(8'hbf)) ? {(8'hbc), (8'hb9)} : ((8'ha1) >> (8'h9d)))))), 
parameter param46 = {((~&(-((7'h44) > param45))) <= (-((param45 ? (8'hae) : param45) && param45))), (8'hb5)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire41;
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire41,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(1'h0):(1'h0)];
      reg5 <= ({(wire0[(1'h0):(1'h0)] * (^{wire3, wire2}))} ?
          $signed((wire3 ?
              {$signed(wire0), {wire0, wire3}} : ((wire1 ? wire1 : (8'hbb)) ?
                  (wire1 ?
                      wire3 : wire3) : $signed(wire3)))) : ($unsigned((wire2[(3'h6):(2'h2)] != $unsigned(wire3))) < ($unsigned((&wire2)) ?
              (|$unsigned(wire2)) : reg4[(1'h0):(1'h0)])));
      if ({{((wire1[(1'h0):(1'h0)] ? {reg5} : (wire2 && wire0)) ?
                  $signed((wire0 ^ (7'h40))) : $unsigned(reg4[(2'h2):(2'h2)])),
              reg5}})
        begin
          reg6 <= reg5;
          reg7 <= wire1[(1'h1):(1'h1)];
          reg8 <= ($unsigned(($signed(reg5) ^ (&wire2))) - (reg4 ?
              {wire1[(2'h2):(2'h2)]} : (~&$unsigned(((8'hb7) && reg4)))));
          reg9 <= (7'h42);
        end
      else
        begin
          reg6 <= $unsigned(reg9);
          if ({(reg4 && {reg5, {$unsigned((8'ha2)), $signed(reg5)}})})
            begin
              reg7 <= $signed({(^~$unsigned($signed(reg9)))});
              reg8 <= (((~&{$unsigned(wire2), (reg7 ? reg5 : reg4)}) ?
                  (wire1[(1'h1):(1'h0)] ^~ (((7'h41) <= wire1) ?
                      (wire3 >= reg6) : {wire2,
                          wire0})) : wire0[(1'h0):(1'h0)]) == (~^reg5));
              reg9 <= reg4;
              reg10 <= reg4;
            end
          else
            begin
              reg7 <= $unsigned(wire2);
              reg8 <= $signed(reg7);
            end
          reg11 <= (wire0[(3'h4):(2'h3)] >>> reg4);
        end
    end
  module12 #() modinst42 (.clk(clk), .wire13(reg8), .wire14(wire2), .wire16(reg10), .wire15(wire3), .y(wire41));
  assign wire43 = (8'ha5);
  assign wire44 = $unsigned((~|$signed($signed($unsigned(reg5)))));
endmodule

module module12
#(parameter param39 = (~(((&(|(8'hb6))) ~^ {((8'ha4) <= (7'h41)), ((8'hbc) > (8'ha1))}) << (({(8'ha6)} ? ((8'hac) & (8'hb2)) : {(8'hb8)}) >= (^~(~|(8'haa)))))), 
parameter param40 = (^~(+((+param39) || param39))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  assign y = {wire37, wire22, wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = {(((wire13[(3'h5):(3'h4)] != wire14) ?
                              (!wire14[(4'h8):(4'h8)]) : ($unsigned(wire16) ?
                                  wire15[(1'h1):(1'h0)] : (wire13 == wire13))) ?
                          $signed((wire14 ?
                              (8'hbf) : $signed(wire14))) : $unsigned((~|wire13)))};
  assign wire18 = $signed($unsigned(((wire14[(4'h8):(4'h8)] ?
                      $unsigned(wire14) : wire17[(4'hb):(2'h2)]) > $signed((8'haf)))));
  assign wire19 = wire18;
  assign wire20 = wire17[(3'h5):(1'h1)];
  assign wire21 = wire16;
  assign wire22 = (+{(!(8'hae)), wire19[(3'h5):(3'h5)]});
  module23 #() modinst38 (.wire27(wire16), .wire24(wire19), .wire26(wire18), .wire25(wire14), .clk(clk), .y(wire37));
endmodule

module module23
#(parameter param36 = {(((&((8'hb6) ? (8'hb8) : (8'hae))) != (((8'ha7) ^ (8'hb9)) ? ((8'had) ? (8'h9e) : (8'h9f)) : {(7'h44)})) - ((!(-(7'h43))) & ((8'ha8) <<< ((8'hab) ? (7'h41) : (7'h44)))))})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(3'h7):(1'h0)] wire25;
  input wire [(3'h6):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = $unsigned(wire25);
  assign wire29 = wire28;
  assign wire30 = (wire27 > (wire29 * ((~|(wire24 ^~ wire28)) || (&wire28))));
  assign wire31 = (^~(+$signed((-(!wire24)))));
  assign wire32 = (wire30 << (wire27 ?
                      wire27[(1'h1):(1'h1)] : $unsigned(($unsigned(wire28) > wire30[(1'h0):(1'h0)]))));
  assign wire33 = $signed(wire24);
  assign wire34 = (({$unsigned(wire30[(4'hd):(3'h6)]),
                      ((&wire33) ^~ (~&wire33))} | {$signed((8'hbf)),
                      {$unsigned(wire31)}}) >> $unsigned(wire25[(3'h5):(3'h5)]));
  assign wire35 = (~$signed($signed({{(8'hb9), wire30}})));
endmodule
