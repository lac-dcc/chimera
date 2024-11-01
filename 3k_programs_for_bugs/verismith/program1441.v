module top
#(parameter param48 = {(((((8'ha8) ? (8'had) : (8'ha9)) ? ((8'hb1) > (8'hb9)) : ((8'hac) - (8'hb3))) <= (~^(^(8'hbf)))) >> (|(~|{(8'hbe)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2[(2'h2):(1'h1)];
  assign wire6 = wire4[(4'h8):(3'h4)];
  assign wire7 = (($signed(wire1) >> (~wire2[(4'hd):(4'ha)])) && $unsigned($unsigned((wire5[(3'h5):(2'h3)] == wire4))));
  assign wire8 = wire4[(3'h6):(3'h4)];
  assign wire9 = $signed($signed((~&(^wire5[(3'h5):(1'h0)]))));
  assign wire10 = ($unsigned(wire1) >= (wire4[(3'h6):(3'h4)] <<< {wire4}));
  assign wire11 = wire7[(3'h4):(2'h3)];
  assign wire12 = $signed((+$unsigned((wire2 >>> (wire1 ? wire3 : (8'hbf))))));
  assign wire13 = wire0[(4'he):(3'h5)];
  module14 #() modinst43 (.wire18(wire5), .y(wire42), .wire15(wire6), .clk(clk), .wire16(wire3), .wire17(wire4));
  assign wire44 = wire0[(1'h1):(1'h0)];
  assign wire45 = ($signed($unsigned(wire9[(3'h6):(1'h1)])) ?
                      (~&((~&wire3[(5'h11):(1'h0)]) && wire3[(4'h8):(2'h3)])) : wire44);
  assign wire46 = ($signed((~{(^~(8'ha3)), wire8[(4'h8):(2'h3)]})) ?
                      wire7 : (wire13[(1'h1):(1'h0)] ? wire7 : wire45));
  assign wire47 = (~&wire13);
endmodule

module module14
#(parameter param41 = ((((!{(7'h43), (8'hbf)}) ? (|((8'hb1) << (8'hb5))) : (((8'haa) <<< (8'hb8)) - (-(8'haa)))) ? (((~(7'h42)) ? {(8'h9c), (8'hba)} : ((7'h43) ? (8'hba) : (8'hbe))) ? ((&(7'h41)) >>> ((8'ha7) & (8'hb1))) : (~&((8'h9d) ~^ (8'hac)))) : ((((8'h9d) & (8'ha6)) ? ((7'h44) ? (8'ha2) : (8'hb0)) : ((8'hb6) <<< (8'hbe))) == (((8'ha4) || (8'ha6)) ^~ ((8'hb1) - (8'h9e))))) ? (((((8'hbc) ? (8'hab) : (8'hb3)) ? ((8'ha0) ? (8'hbd) : (8'hbb)) : (7'h43)) ? (8'ha4) : ((|(8'hbe)) <<< ((8'haa) ? (8'hb8) : (8'haa)))) ~^ (8'ha4)) : (((((8'hbb) << (7'h41)) ? ((8'h9c) != (8'h9f)) : {(8'ha5), (8'ha5)}) ? (((7'h41) ? (8'hbd) : (8'hb1)) ? (&(8'h9c)) : (^~(7'h41))) : (((8'ha8) >> (8'ha7)) > (8'hb9))) ? {{((8'h9c) ~^ (8'had)), ((8'hbf) != (8'ha2))}, (-((8'hbb) ? (8'hb5) : (8'ha4)))} : ({((8'ha4) ? (8'ha5) : (8'hbf)), ((8'hb9) == (8'h9f))} ? (^~((7'h40) >>> (8'hb0))) : (|(^~(8'ha7)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire19 = (((wire15[(5'h10):(4'hc)] | $unsigned({wire15})) ?
                      wire17[(4'h9):(3'h4)] : {($signed(wire18) ~^ wire18),
                          wire16[(4'hc):(3'h4)]}) <<< $signed({({wire17} - wire16),
                      $unsigned(((8'haf) * wire15))}));
  assign wire20 = wire17;
  assign wire21 = wire19;
  assign wire22 = $signed((~$unsigned(wire18)));
  assign wire23 = ($unsigned((((wire17 || wire17) ?
                          ((8'hbe) <<< wire20) : ((8'h9d) <<< wire20)) ?
                      ($unsigned(wire15) ?
                          (wire15 ?
                              wire16 : wire21) : (wire19 <= wire16)) : (wire22 * $signed((8'hb3))))) <<< $signed(wire15[(4'ha):(3'h5)]));
  assign wire24 = (~|($signed($unsigned({wire16,
                      wire23})) & (+(wire15[(5'h11):(1'h0)] ?
                      $signed(wire16) : {wire19, (8'hbf)}))));
  assign wire25 = {$signed((($unsigned(wire23) || $signed(wire20)) ?
                          wire15 : $signed({wire23}))),
                      $unsigned(wire15)};
  always
    @(posedge clk) begin
      reg26 <= wire24[(2'h3):(1'h0)];
      reg27 <= ((8'hb4) & $signed((((wire21 ? wire18 : wire25) ~^ (~^reg26)) ?
          (~(wire17 ^ wire17)) : (^~{wire21}))));
      reg28 <= (~$unsigned(wire15[(4'hd):(3'h5)]));
      reg29 <= (-(+(reg28 ? wire15[(4'hf):(1'h0)] : {(~^wire24)})));
      reg30 <= $unsigned((-((wire16[(4'h8):(3'h5)] && $unsigned((8'hb8))) ?
          {(wire24 ? (8'had) : wire16),
              wire25[(1'h1):(1'h0)]} : ((-wire18) < $signed(wire22)))));
    end
  assign wire31 = (((({reg30, wire20} ?
                          (wire20 ? wire21 : wire16) : {(8'hb3),
                              wire24}) > {(wire24 ? reg30 : reg28),
                          $unsigned(wire22)}) ?
                      $signed(wire24[(3'h4):(3'h4)]) : wire20[(4'h9):(3'h7)]) && ($unsigned((reg29[(2'h2):(1'h1)] != wire19)) ?
                      wire18[(2'h2):(1'h1)] : ((^~(~&reg26)) ?
                          ((wire20 >>> wire19) + $unsigned((8'hbc))) : $unsigned((wire25 ?
                              wire16 : reg30)))));
  assign wire32 = (((8'haa) >> (8'hb4)) ?
                      (wire17[(4'h9):(4'h8)] ?
                          $unsigned(reg27[(1'h1):(1'h1)]) : {(reg30 ?
                                  $unsigned(reg30) : (wire15 ?
                                      wire17 : wire16)),
                              (reg27[(3'h6):(1'h1)] <= $signed(wire31))}) : (~&(-$unsigned($signed(wire22)))));
  assign wire33 = (~^reg29);
  assign wire34 = {$unsigned(reg30), (8'h9d)};
  assign wire35 = (+((wire15 ?
                      {$signed(wire25),
                          $unsigned(reg28)} : $signed(wire33)) ^ {wire19[(1'h1):(1'h1)]}));
  assign wire36 = (wire22[(3'h6):(1'h0)] ?
                      wire24[(1'h0):(1'h0)] : ($unsigned((|wire35[(3'h4):(1'h0)])) && ({(reg30 ?
                              reg30 : wire24)} ~^ (^(8'hb2)))));
  assign wire37 = wire36;
  assign wire38 = $signed(wire22);
  assign wire39 = $signed({(wire15[(5'h10):(4'hc)] > $signed((8'h9c))),
                      ((wire16 > {reg27}) ?
                          {wire15, wire25[(3'h6):(3'h4)]} : (8'haa))});
  assign wire40 = (8'haa);
endmodule
