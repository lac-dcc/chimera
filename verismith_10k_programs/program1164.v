module top
#(parameter param82 = (^(({((8'ha6) * (8'ha2)), ((8'hb2) ? (8'hbb) : (8'had))} ~^ ({(8'hb9)} | ((8'ha1) ? (8'ha6) : (8'h9e)))) ? ((^~(8'ha4)) >>> ((~^(7'h40)) ? (|(8'ha8)) : ((8'h9c) & (8'hb1)))) : ((((8'ha0) ? (8'hb0) : (8'ha6)) >>> ((8'hb6) >= (8'hbe))) ^~ {(&(8'hb2))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire72;
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire74,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire14,
                 wire15,
                 wire72,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = ((+wire3[(3'h6):(2'h3)]) ?
                     (-((|(wire1 == wire2)) ?
                         {{wire3},
                             (wire2 <= wire3)} : wire2[(3'h5):(1'h0)])) : $signed(($signed((wire0 ?
                             wire2 : wire2)) ?
                         (^~(!(8'hbf))) : ((wire3 | wire3) ?
                             wire1 : $unsigned((8'haf))))));
  assign wire6 = $signed(wire2[(3'h4):(2'h3)]);
  assign wire7 = $signed(wire0[(3'h5):(2'h3)]);
  assign wire8 = (wire4[(4'h9):(2'h3)] >>> (8'ha8));
  assign wire9 = wire2[(3'h4):(3'h4)];
  assign wire10 = wire8[(4'hc):(4'hc)];
  assign wire11 = (wire8[(4'hd):(3'h4)] < $signed(($signed((+wire1)) ?
                      wire3[(3'h5):(3'h4)] : ($signed(wire4) >>> (~^wire2)))));
  always
    @(posedge clk) begin
      reg12 <= ($unsigned($unsigned($signed((8'ha5)))) != wire9);
      reg13 <= $signed($unsigned($signed($signed((~|wire9)))));
    end
  assign wire14 = wire3;
  assign wire15 = $signed(wire0[(1'h1):(1'h1)]);
  module16 #() modinst73 (wire72, clk, wire2, wire1, wire9, wire0, wire4);
  assign wire74 = ($unsigned(($unsigned(wire72) >>> wire72)) ?
                      (&wire72) : wire11);
  always
    @(posedge clk) begin
      reg75 <= wire8;
      reg76 <= (8'h9e);
      reg77 <= ((^~(~&$signed($unsigned(wire3)))) ? (8'had) : (8'hb4));
      reg78 <= (~wire1[(5'h10):(2'h3)]);
    end
  assign wire79 = (~^$unsigned($signed($unsigned((reg75 ? wire14 : wire8)))));
  assign wire80 = $signed($unsigned($signed(($signed((8'hb0)) ?
                      wire7[(4'hd):(3'h7)] : wire11[(4'h9):(3'h4)]))));
  assign wire81 = {(({(wire4 ? wire4 : wire2), $signed(wire4)} ?
                              $signed((wire15 ?
                                  (8'hbc) : wire5)) : {$unsigned(wire10),
                                  (wire80 ^~ (8'ha0))}) ?
                          $signed((!$unsigned(wire5))) : {wire1[(4'h9):(1'h0)]}),
                      wire1};
endmodule

module module16
#(parameter param71 = (8'hbf))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire68;
  assign y = {wire70,
                 wire43,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire68,
                 (1'h0)};
  module22 #() modinst44 (wire43, clk, wire17, wire21, wire19, wire18, wire20);
  assign wire45 = wire43[(4'hb):(4'h8)];
  assign wire46 = $signed($unsigned((+wire19)));
  assign wire47 = $signed(((~wire19) >>> {$signed(wire17),
                      wire46[(4'hd):(4'hb)]}));
  assign wire48 = $signed({(wire47[(2'h2):(1'h0)] ?
                          ((wire43 ? wire20 : wire20) != wire17) : wire20)});
  assign wire49 = (^~((+$unsigned($signed(wire43))) ~^ ((~^(wire46 << wire48)) ?
                      {{wire21}} : (+$unsigned(wire47)))));
  module50 #() modinst69 (.clk(clk), .wire53(wire45), .wire54(wire43), .y(wire68), .wire51(wire46), .wire52(wire17), .wire55(wire20));
  assign wire70 = wire47[(4'hb):(2'h2)];
endmodule

module module50
#(parameter param66 = {(|((8'hbc) ? (+((8'hbf) >>> (8'hac))) : {(^~(8'ha7))}))}, 
parameter param67 = param66)
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire signed [(3'h6):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 (1'h0)};
  assign wire56 = $unsigned((($signed((7'h43)) ?
                          ((wire52 && wire51) ?
                              (wire53 ? (8'ha3) : wire55) : ((8'hb5) ?
                                  wire54 : wire51)) : $unsigned((~^wire54))) ?
                      (^~wire55[(2'h3):(1'h0)]) : wire51[(1'h1):(1'h1)]));
  assign wire57 = $unsigned((-(wire56[(3'h7):(1'h0)] | wire54[(1'h1):(1'h1)])));
  assign wire58 = (wire51 ?
                      wire56[(3'h7):(3'h6)] : {(&($signed(wire53) ?
                              (|wire57) : wire53))});
  assign wire59 = ((-$signed(wire58)) | {(~((~^(8'ha5)) ?
                          ((8'hb7) ? wire58 : (8'hae)) : (wire51 ?
                              wire55 : wire54))),
                      (wire55 >>> $unsigned($unsigned(wire51)))});
  assign wire60 = wire59;
  assign wire61 = (((^~$signed((wire52 ? (8'hba) : wire57))) != {({wire52} ?
                          (^wire55) : $unsigned(wire53))}) + ({($unsigned(wire55) >> $signed(wire56))} * wire52));
  assign wire62 = (wire54 ?
                      $signed(((wire59[(2'h3):(1'h1)] ^~ (~&wire60)) ?
                          wire54 : (~^((7'h40) >= wire51)))) : $signed(wire53[(1'h1):(1'h1)]));
  assign wire63 = ($signed(wire61) ?
                      (&$unsigned($unsigned((&(8'hb7))))) : $unsigned($signed((wire51 ?
                          (wire62 | wire56) : {wire57, wire52}))));
  assign wire64 = $unsigned({((^~$unsigned(wire59)) & (!(wire53 ?
                          wire59 : wire62))),
                      wire60});
  assign wire65 = {$signed(wire64[(2'h2):(1'h1)]),
                      $unsigned(wire54[(1'h0):(1'h0)])};
endmodule

module module22
#(parameter param41 = {((({(8'hae)} & (8'hbd)) ? {{(8'hb9)}} : ((~&(8'ha4)) ? (~|(8'hb9)) : {(8'hbc), (8'hbb)})) ? ((^(-(8'hb6))) ^ (((8'hb7) ? (8'hbc) : (8'hb3)) >>> ((8'hba) ? (8'h9c) : (8'hab)))) : (^~{((8'hac) != (8'hbe)), ((8'ha9) ^~ (8'ha4))})), {((((8'ha6) ? (8'hbd) : (8'ha1)) ? ((8'hab) * (8'ha1)) : ((8'hb3) ? (8'hab) : (8'hb6))) ~^ (~^((8'hbb) ? (8'ha6) : (8'h9d))))}}, 
parameter param42 = (^~(+param41)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(2'h3):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
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
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $unsigned({(($unsigned((8'hb7)) ?
              (wire25 ?
                  (8'ha5) : wire26) : $unsigned(wire27)) ^~ $unsigned($unsigned((8'ha4)))),
          ($signed($signed(wire27)) * (|$signed(wire27)))});
      reg29 <= wire25[(2'h2):(1'h0)];
      reg30 <= $signed({reg28});
    end
  assign wire31 = ($signed((~&(reg28[(2'h3):(2'h2)] <= (wire24 || wire23)))) ?
                      $signed($signed(wire27[(3'h4):(2'h2)])) : ((!$unsigned($signed(reg29))) ?
                          $unsigned($signed($signed(reg29))) : ({(wire23 && wire23),
                              {(8'hb2),
                                  wire23}} ^ (reg30[(3'h6):(3'h4)] | (wire24 > reg30)))));
  assign wire32 = wire24[(1'h1):(1'h1)];
  assign wire33 = (~&wire26[(4'ha):(3'h7)]);
  assign wire34 = (+$signed($signed($unsigned((&wire26)))));
  assign wire35 = wire32[(5'h12):(4'he)];
  assign wire36 = wire31[(1'h1):(1'h0)];
  assign wire37 = $unsigned(wire33[(5'h11):(4'hc)]);
  assign wire38 = wire33;
  assign wire39 = (~&reg29);
  assign wire40 = wire25[(2'h3):(1'h0)];
endmodule
