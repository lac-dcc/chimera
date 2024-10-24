module top
#(parameter param80 = (^(-(|((~|(7'h41)) | ((8'h9d) << (8'hae)))))), 
parameter param81 = (({param80, (param80 ~^ {param80, param80})} ~^ {(param80 ? param80 : (8'h9f)), (~^(param80 ? param80 : param80))}) && (~(param80 ? {(param80 >>> param80), (-param80)} : (^~((8'hb8) == param80))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire78;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire78,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($unsigned(wire3) < (($signed(wire3) != $unsigned((8'hbc))) ?
          $signed(wire3[(1'h0):(1'h0)]) : (~^$signed((8'hbd))))) > $signed((((wire2 & wire1) != wire2[(1'h0):(1'h0)]) != wire3)));
    end
  assign wire5 = wire1;
  assign wire6 = {wire1[(4'h9):(3'h4)]};
  assign wire7 = ((((^(~|wire0)) * (((8'ha4) ? reg4 : wire5) ?
                         wire0[(2'h3):(1'h0)] : $signed((8'ha2)))) && wire0) ?
                     ((~&(~|(wire6 >>> (8'h9e)))) ?
                         $unsigned($signed(reg4[(4'h9):(4'h9)])) : $unsigned({$unsigned(wire1)})) : wire3);
  assign wire8 = (((~$unsigned(wire1[(3'h5):(3'h5)])) ?
                     (~{wire2, (wire1 != wire2)}) : (((7'h40) ?
                         (wire3 ~^ wire2) : (^wire0)) >= (((8'haa) > wire0) ?
                         wire5 : (8'hb5)))) && wire0[(2'h3):(2'h3)]);
  assign wire9 = $signed(({(!(reg4 ? wire2 : reg4)), ($signed(wire3) - wire8)} ?
                     wire5 : $unsigned({$signed(wire0), (wire7 ^ wire2)})));
  assign wire10 = wire8[(3'h6):(2'h2)];
  assign wire11 = (^~$signed(wire6));
  assign wire12 = wire5;
  assign wire13 = $signed($signed({wire11, ($signed(wire1) > wire9)}));
  assign wire14 = wire9;
  assign wire15 = $unsigned({$signed(($unsigned(wire9) ?
                          $unsigned(wire14) : (8'ha4)))});
  assign wire16 = (-wire3[(1'h0):(1'h0)]);
  assign wire17 = ((~&$signed($signed($signed(wire13)))) ?
                      ($signed($unsigned((wire8 - wire15))) ?
                          wire0 : ($unsigned($signed(wire10)) < ((-wire8) ?
                              wire15 : {wire10,
                                  wire11}))) : (-$signed((^(wire11 ?
                          wire7 : wire9)))));
  assign wire18 = ($signed($signed(((^~wire2) ?
                      $signed(wire3) : (wire14 ?
                          reg4 : wire10)))) & $signed((+$unsigned($signed(wire8)))));
  assign wire19 = (^($signed($signed($signed((8'hb0)))) ?
                      wire5[(3'h7):(3'h5)] : $unsigned(wire5)));
  module20 #() modinst79 (wire78, clk, wire14, wire5, wire8, wire10, wire11);
endmodule

module module20
#(parameter param76 = (({((-(8'ha7)) != {(8'hbf), (8'hb0)})} ? (8'hab) : {(~(!(8'ha5))), (((8'hbb) - (8'hac)) ? (~|(7'h41)) : (|(8'hbc)))}) ? (((|(8'hbb)) * (~^((7'h42) != (8'hbd)))) ? ({(-(7'h40)), ((8'ha1) ? (8'hab) : (8'hb1))} > ((!(7'h43)) ? ((8'haf) << (7'h42)) : ((8'hab) ? (8'ha4) : (8'hbe)))) : ((~|((8'h9d) ? (8'hbc) : (8'ha2))) & ((8'hbf) * ((8'hab) ^ (8'haf))))) : ((^~(((8'hbe) ? (7'h40) : (7'h44)) ? ((8'h9f) ? (8'ha2) : (8'hbb)) : (~|(8'hb3)))) >= ((((7'h44) ? (8'hb5) : (8'h9e)) ? ((8'hbf) ? (8'hba) : (8'hb6)) : ((8'ha4) | (8'ha9))) ? (((8'hbb) ? (8'hbe) : (8'h9e)) ~^ ((7'h43) ? (8'hb1) : (8'h9d))) : (|{(8'hb9)})))), 
parameter param77 = {((param76 ? (param76 ^~ param76) : ((param76 | param76) ? (param76 ? param76 : param76) : (-param76))) ~^ (|(8'hae)))})
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire73;
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire75,
                 wire32,
                 wire34,
                 wire35,
                 wire48,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire73,
                 reg33,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= {(^~{((wire21 << wire25) || wire23)}),
          (~(((~wire23) >>> (wire25 ?
              wire23 : wire24)) || (wire22[(1'h0):(1'h0)] ?
              {wire21} : wire21[(4'h8):(1'h0)])))};
      reg27 <= (($unsigned(wire23) ?
          (8'haa) : (((wire25 ?
              (8'hbd) : wire24) | wire25[(5'h14):(4'h9)]) >= ((wire23 ?
                  wire22 : wire24) ?
              wire23[(2'h2):(1'h0)] : (~|wire22)))) >>> wire25[(5'h12):(4'h8)]);
      reg28 <= ($signed(reg26[(3'h4):(1'h0)]) ? reg26[(4'h8):(3'h6)] : (8'hb4));
      if (reg27[(2'h2):(2'h2)])
        begin
          reg29 <= $unsigned((8'had));
          reg30 <= ($unsigned(reg27[(1'h1):(1'h0)]) & reg28);
          reg31 <= $unsigned({reg30[(2'h3):(1'h1)]});
        end
      else
        begin
          reg29 <= ((reg28[(1'h1):(1'h0)] ?
                  (({(7'h40)} < reg27[(2'h3):(1'h1)]) & $signed((8'ha2))) : wire25) ?
              $unsigned($unsigned(reg27[(1'h1):(1'h1)])) : (-$signed(reg27[(2'h3):(2'h3)])));
        end
    end
  assign wire32 = reg26[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg33 <= {{(&$unsigned((wire22 + reg30))), (&wire24[(1'h1):(1'h1)])},
          $signed((^{$signed(reg27), ((7'h43) ~^ wire25)}))};
    end
  assign wire34 = reg31;
  assign wire35 = reg28[(2'h3):(1'h1)];
  module36 #() modinst49 (wire48, clk, wire23, reg28, wire21, reg29);
  assign wire50 = ((~|(^~wire25)) ?
                      ($signed($signed((8'ha5))) < (&reg27[(1'h0):(1'h0)])) : (-$unsigned(reg29)));
  assign wire51 = (^(-wire25));
  assign wire52 = (wire48[(4'h8):(1'h1)] ?
                      wire24[(3'h6):(1'h1)] : {$signed($signed($signed(wire48)))});
  assign wire53 = (-{$signed((|wire35[(3'h6):(2'h3)])),
                      ({$signed(wire23), (wire23 ? wire22 : wire34)} ?
                          reg26 : ((|wire25) >> $unsigned(wire50)))});
  assign wire54 = ($unsigned($unsigned(wire52[(1'h0):(1'h0)])) + wire34[(1'h0):(1'h0)]);
  assign wire55 = (8'ha9);
  assign wire56 = wire51;
  assign wire57 = ((((wire34[(3'h4):(1'h0)] ?
                                  (reg33 && (8'ha9)) : {reg27, wire35}) ?
                              ((wire48 <<< wire23) > wire54) : reg30[(2'h3):(1'h1)]) ?
                          (((reg26 ?
                              wire25 : wire34) ^~ (wire22 != wire56)) ^~ wire52[(3'h5):(2'h2)]) : {({wire52,
                                      wire54} ?
                                  wire52[(2'h3):(2'h2)] : {wire53, reg26})}) ?
                      (reg30 != {reg26}) : (($signed((reg31 != wire52)) + $signed(wire23[(4'h8):(2'h3)])) << (^~$unsigned((wire22 ?
                          wire24 : (8'hb3))))));
  assign wire58 = ((&(~|(((8'ha5) * (8'hbc)) ?
                      {wire32} : (reg31 ?
                          reg33 : wire57)))) < $signed(((~&$signed(wire51)) ?
                      {$unsigned(wire35)} : (wire34 <= (+(8'h9c))))));
  assign wire59 = wire34;
  module60 #() modinst74 (.y(wire73), .wire65(reg31), .wire63(wire51), .wire62(wire58), .clk(clk), .wire61(reg29), .wire64(wire22));
  assign wire75 = wire32[(5'h12):(1'h1)];
endmodule

module module60
#(parameter param71 = (&((8'hbf) ? ((~|(~^(8'hb0))) ? {((8'ha8) ? (8'hb3) : (8'ha6))} : ((^~(8'h9c)) < (+(8'ha1)))) : (((&(7'h41)) ? (~(8'h9f)) : ((8'hb0) || (8'hbd))) ? ((8'ha5) ? ((7'h42) >>> (8'ha6)) : (-(8'haf))) : (((8'ha5) ? (8'hba) : (8'had)) ? {(8'h9e)} : ((8'h9f) ? (8'hb1) : (8'ha3)))))), 
parameter param72 = (-(7'h40)))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire [(4'hc):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire62;
  input wire [(4'hb):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  assign y = {wire70, wire69, wire68, wire67, wire66, (1'h0)};
  assign wire66 = (wire64[(4'h9):(3'h6)] ?
                      {wire62[(3'h5):(1'h0)]} : wire64[(2'h3):(2'h3)]);
  assign wire67 = $unsigned(((wire65 <<< $signed(wire61)) ?
                      wire65[(2'h2):(1'h1)] : wire65));
  assign wire68 = (((&$signed(((8'hb9) ? wire64 : wire63))) ?
                      ($unsigned((wire61 >>> wire63)) ?
                          (~^$unsigned(wire64)) : (&$unsigned(wire67))) : {$unsigned(wire66[(4'ha):(4'h9)])}) >= wire65);
  assign wire69 = (((~|wire64[(2'h3):(2'h2)]) ?
                      wire61 : ((~&wire63) == wire62)) && (-$signed(wire67)));
  assign wire70 = wire69[(3'h4):(2'h2)];
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire [(2'h3):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  assign y = {wire47, wire46, wire45, wire44, wire43, wire42, wire41, (1'h0)};
  assign wire41 = ($signed({((wire38 ?
                          wire39 : wire39) > ((8'h9f) == wire39))}) >> $unsigned((~$unsigned((wire40 ?
                      (8'hb8) : wire37)))));
  assign wire42 = (8'had);
  assign wire43 = (+$signed((((8'hbe) ?
                      wire37 : {(8'hbf), wire39}) && ((wire37 ~^ wire37) ?
                      $signed(wire39) : wire42[(4'h9):(3'h5)]))));
  assign wire44 = {$signed(wire42[(3'h6):(3'h5)]),
                      (wire42 ?
                          $signed((&wire40[(1'h1):(1'h0)])) : (~|wire39))};
  assign wire45 = $signed({wire40});
  assign wire46 = $signed($unsigned({wire43[(4'h9):(1'h0)]}));
  assign wire47 = wire45;
endmodule
