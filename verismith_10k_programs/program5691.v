module top
#(parameter param98 = ({({(~(8'hb7))} ? (~&{(8'h9f), (8'hbf)}) : {(+(8'hb3))})} <= {((~&((7'h40) ^ (8'h9e))) ? (!((8'h9d) ? (8'hbf) : (8'ha0))) : (&(|(8'hb4)))), (~((&(8'hbc)) ? ((8'ha9) - (8'hae)) : ((8'ha1) - (7'h40))))}), 
parameter param99 = param98)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire85;
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire87,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire85,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned($signed((!wire1))) ^ ((wire1 ^~ wire3) << $unsigned(((wire1 <<< wire2) ?
          (wire1 >> (8'hbe)) : $signed(wire2)))));
      reg5 <= $unsigned((((reg4[(4'hd):(3'h7)] ?
              (wire1 ?
                  wire0 : wire0) : wire0[(2'h3):(1'h1)]) ^ wire0[(3'h6):(1'h1)]) ?
          ((-$signed(wire3)) | $unsigned(reg4[(4'hd):(4'hd)])) : (wire2 | wire0[(3'h6):(3'h5)])));
      reg6 <= {$unsigned(wire1[(5'h10):(3'h6)])};
    end
  assign wire7 = ({($unsigned((wire3 ? wire0 : reg5)) >> $signed({reg6})),
                         reg6} ?
                     ($signed((|$unsigned(wire2))) ?
                         (({(7'h42)} ? (wire3 & (8'ha4)) : (&reg6)) ?
                             {(reg5 ? reg5 : reg6),
                                 $signed(wire2)} : $signed(((8'h9d) ?
                                 reg4 : wire3))) : reg4[(1'h0):(1'h0)]) : $signed($unsigned(($signed((8'hbd)) ^~ $signed(wire1)))));
  assign wire8 = $unsigned({(reg4[(3'h5):(3'h4)] ?
                         ($unsigned(wire1) * $signed(reg4)) : (^wire1))});
  assign wire9 = wire8[(3'h5):(1'h0)];
  assign wire10 = (&reg4);
  assign wire11 = (wire3[(3'h5):(2'h2)] ?
                      $unsigned(((&(reg4 && wire1)) ?
                          wire3[(3'h7):(3'h6)] : reg5[(2'h3):(2'h3)])) : $unsigned($signed(({wire2,
                              wire2} ?
                          (reg5 ? wire10 : wire1) : wire9[(2'h3):(1'h0)]))));
  assign wire12 = (!(&(&(wire3 ?
                      ((8'ha8) ? wire2 : wire11) : $unsigned(wire3)))));
  assign wire13 = (wire9 ?
                      $signed((wire2 * $signed(wire8))) : $signed(((8'haa) < wire9)));
  assign wire14 = reg4;
  module15 #() modinst86 (.wire20(wire12), .y(wire85), .wire19(wire7), .clk(clk), .wire18(reg6), .wire16(wire0), .wire17(reg4));
  assign wire87 = wire13;
  always
    @(posedge clk) begin
      reg88 <= {(({(-wire8), $signed(reg6)} ?
              (wire12[(3'h7):(2'h3)] ?
                  (reg6 > wire11) : ((8'ha6) ? reg6 : wire9)) : {wire10,
                  (wire14 ? reg5 : wire13)}) - (8'ha1)),
          ($signed(wire87[(4'hc):(2'h2)]) ?
              wire14 : ($signed({wire9}) ? reg4[(4'he):(1'h0)] : reg5))};
      if (reg6[(3'h4):(2'h3)])
        begin
          reg89 <= reg4[(5'h11):(3'h4)];
          reg90 <= $signed(((~$signed(wire14[(3'h4):(1'h1)])) ?
              ((~^(wire11 > (8'ha7))) ?
                  $unsigned((!(8'ha5))) : ($signed(wire2) ^~ (~wire85))) : (wire7[(2'h2):(1'h0)] >> $signed((reg88 ^~ wire87)))));
          reg91 <= $unsigned(wire1[(3'h7):(3'h7)]);
          reg92 <= ($signed($signed((reg89[(4'h9):(4'h9)] ^ $signed(wire9)))) != (|(wire2 * $signed(wire3))));
          reg93 <= ($unsigned($signed(((wire14 ? wire85 : reg90) ?
                  (8'ha5) : wire9))) ?
              (~|wire85) : (wire14[(2'h3):(1'h1)] | ((~(8'hb7)) > wire12)));
        end
      else
        begin
          reg89 <= (wire12 < reg5);
          reg90 <= $signed(reg93);
          reg91 <= $unsigned($unsigned($unsigned((~^reg93))));
        end
      reg94 <= $signed($signed($unsigned((8'hbb))));
    end
  always
    @(posedge clk) begin
      reg95 <= (8'hb2);
      reg96 <= $unsigned($signed($signed($signed($unsigned(wire9)))));
      reg97 <= (~|(!wire85[(1'h1):(1'h1)]));
    end
endmodule

module module15
#(parameter param84 = {((({(8'hac), (8'haf)} <<< (^(8'ha3))) ? (((8'hb4) > (8'hbe)) ? ((7'h44) ? (8'hb7) : (8'hba)) : (+(8'hb2))) : {(~|(8'hbf))}) > ((((8'hb4) ? (8'had) : (8'hb9)) * ((8'ha0) ? (7'h43) : (8'hb8))) ? ({(8'hab)} & {(8'ha3), (8'ha5)}) : (((8'h9d) - (8'haa)) << {(8'ha5), (8'ha4)})))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire82;
  assign y = {wire51, wire21, wire53, wire54, wire55, wire82, (1'h0)};
  assign wire21 = wire20[(4'h8):(3'h4)];
  module22 #() modinst52 (.clk(clk), .wire24(wire17), .wire25(wire21), .wire27(wire19), .wire26(wire18), .wire23(wire16), .y(wire51));
  assign wire53 = wire21[(4'hd):(4'h8)];
  assign wire54 = ($signed((~((wire16 ? (8'hb9) : wire51) ?
                      $signed(wire19) : wire17))) * $unsigned({((wire21 ~^ wire16) ?
                          (wire16 ? wire17 : (8'h9f)) : (!wire17)),
                      (+$signed(wire17))}));
  assign wire55 = $signed($unsigned($unsigned($signed((wire20 ?
                      wire17 : wire17)))));
  module56 #() modinst83 (.wire57(wire16), .wire59(wire17), .clk(clk), .y(wire82), .wire58(wire19), .wire60(wire18), .wire61(wire53));
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire61;
  input wire [(4'ha):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire62;
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire62,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire62 = {$signed({wire58,
                          ($unsigned(wire58) ? {wire61} : $signed(wire59))})};
  always
    @(posedge clk) begin
      reg63 <= $unsigned(wire61);
      reg64 <= $unsigned((^$unsigned((wire61 ? {wire59} : (|(8'hb7))))));
      reg65 <= $unsigned(wire57);
    end
  assign wire66 = (^~wire60);
  assign wire67 = ((+(&wire62[(4'ha):(3'h4)])) ^ (~|(^{((8'hbb) ?
                          (8'hb0) : wire59),
                      wire62})));
  assign wire68 = (wire59 ?
                      (wire58 | {(~&$unsigned(wire57)),
                          wire66[(4'hb):(3'h7)]}) : wire60[(4'h9):(3'h5)]);
  assign wire69 = $unsigned($signed($unsigned(wire60)));
  assign wire70 = ($signed(((wire58[(3'h4):(1'h1)] >>> wire59[(3'h6):(3'h5)]) << {(reg65 ?
                          (8'hab) : wire68),
                      (!(8'hbe))})) + wire67);
  assign wire71 = (reg64[(3'h7):(3'h6)] ?
                      ({$unsigned($signed(wire58))} | $signed((!(reg63 ?
                          wire58 : wire60)))) : $signed($unsigned((!{wire61,
                          wire67}))));
  assign wire72 = (8'ha1);
  assign wire73 = $signed($signed((+wire62)));
  assign wire74 = $signed(wire70);
  assign wire75 = {$signed($signed(wire67))};
  assign wire76 = ($unsigned(wire69) ?
                      $signed(reg65[(2'h2):(2'h2)]) : (((wire58 < {wire66}) ?
                              wire59 : ((|wire60) >> (+wire57))) ?
                          {($signed(wire73) ?
                                  (wire57 ? wire74 : (8'ha8)) : (8'ha4)),
                              (^~(wire72 <<< wire61))} : wire72));
  assign wire77 = (wire58 ? (8'had) : (~^wire70));
  assign wire78 = $signed(($unsigned((!((8'hb6) << reg63))) * $unsigned($unsigned(reg64[(3'h4):(2'h3)]))));
  assign wire79 = wire61[(5'h13):(4'hd)];
  assign wire80 = reg64[(2'h2):(1'h1)];
  assign wire81 = {wire62[(4'h8):(2'h3)]};
endmodule

module module22
#(parameter param49 = {((~|(((8'ha1) ^~ (8'hba)) ? ((8'hac) <= (8'hb6)) : ((8'hb2) ? (8'hb9) : (8'ha2)))) - ({((8'hbc) ? (7'h43) : (8'h9c)), ((8'hbd) <= (8'hb9))} && (((8'ha5) ~^ (7'h41)) != ((7'h43) ? (8'ha8) : (8'hb8)))))}, 
parameter param50 = param49)
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  input wire [(4'h9):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg48,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= (wire24[(2'h2):(1'h1)] ?
          (~&$signed({$signed(wire24),
              $signed(wire24)})) : (($unsigned({wire25}) ^ ((8'hbd) ?
                  wire27[(3'h4):(2'h2)] : $unsigned(wire24))) ?
              ($signed($signed((8'hba))) >>> wire23) : (~^((wire26 ?
                  wire26 : (8'ha2)) * (|wire25)))));
      reg29 <= (^((($unsigned(wire27) >>> (|wire25)) ?
          $unsigned((wire24 ?
              wire23 : (8'ha4))) : $signed((&wire24))) | $signed(($signed(wire25) >> (wire23 ?
          (8'hba) : wire26)))));
    end
  always
    @(posedge clk) begin
      reg30 <= $unsigned((&$unsigned(wire24[(2'h2):(2'h2)])));
      reg31 <= wire24[(3'h4):(3'h4)];
    end
  assign wire32 = {(($unsigned($signed(reg30)) ?
                          ($unsigned(reg28) ?
                              (reg31 - wire25) : $unsigned(reg31)) : $signed((wire25 != (8'hac)))) ~^ {((wire25 ?
                              wire23 : reg31) && (wire23 ?
                              (8'had) : wire25))})};
  assign wire33 = wire32[(2'h3):(2'h3)];
  assign wire34 = wire27[(1'h0):(1'h0)];
  assign wire35 = $unsigned($unsigned((((wire25 || wire26) ?
                      (wire24 < reg31) : $unsigned((8'hb3))) << $unsigned($signed(wire26)))));
  always
    @(posedge clk) begin
      reg36 <= (~|wire26[(3'h4):(3'h4)]);
    end
  assign wire37 = reg30[(1'h1):(1'h1)];
  assign wire38 = wire35[(4'ha):(3'h4)];
  assign wire39 = {(8'hac)};
  assign wire40 = ($signed(wire25[(1'h0):(1'h0)]) ?
                      $unsigned(($signed(wire34[(4'hc):(4'ha)]) ?
                          $signed($signed(wire38)) : (wire26[(1'h1):(1'h1)] <<< reg31))) : (~^(($unsigned((8'hb7)) - ((7'h43) ?
                          wire26 : wire24)) >> $signed((reg30 | wire37)))));
  assign wire41 = wire35[(4'ha):(3'h5)];
  assign wire42 = (({$signed(wire35)} + ($unsigned(((8'ha3) ?
                              wire41 : wire27)) ?
                          $signed(((8'ha6) <<< wire23)) : ((wire41 && wire26) <<< (reg30 ^~ (8'hab))))) ?
                      (&wire38) : wire37);
  assign wire43 = wire35[(4'ha):(4'ha)];
  assign wire44 = $unsigned({$unsigned(wire37[(4'hd):(4'ha)]),
                      wire26[(1'h1):(1'h1)]});
  assign wire45 = (wire23[(5'h11):(4'hb)] || wire35[(3'h6):(1'h1)]);
  assign wire46 = (8'hb8);
  assign wire47 = wire24[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg48 <= (8'ha4);
    end
endmodule
