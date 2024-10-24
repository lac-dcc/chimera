module top
#(parameter param100 = {((7'h40) ? ((^{(8'hbe)}) + (((8'h9f) ? (8'hac) : (8'h9c)) ? (8'had) : (&(8'hb7)))) : {(&((8'hb9) ? (8'hba) : (7'h41))), ((8'ha6) ? {(7'h41), (8'hba)} : (~^(8'haf)))}), ((+{(~|(7'h43)), {(8'hbc), (7'h43)}}) ? (8'haa) : (|(((8'hb0) ? (8'h9d) : (8'hb5)) >> ((8'hb6) <<< (8'ha7)))))}, 
parameter param101 = {(&{(param100 != param100)})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire90;
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire93,
                 wire92,
                 wire4,
                 wire5,
                 wire6,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire90,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire4 = (~|(~^((^~{wire0}) >= (wire1 >= wire0))));
  assign wire5 = wire1;
  assign wire6 = (wire5[(1'h0):(1'h0)] ?
                     {(-{(wire4 || wire4), wire1}),
                         (wire1 > (wire2[(2'h3):(1'h1)] ?
                             (wire0 ?
                                 wire2 : (7'h41)) : (wire5 - wire2)))} : ((((wire5 <<< wire0) <<< (+wire4)) ?
                             wire1[(5'h14):(5'h13)] : (wire3 > (wire4 > wire4))) ?
                         $unsigned(($unsigned(wire3) ?
                             $unsigned(wire3) : (wire5 ?
                                 wire5 : wire4))) : (wire3 ?
                             (~|(wire1 <= wire5)) : $unsigned((wire1 != wire4)))));
  always
    @(posedge clk) begin
      reg7 <= (wire5[(2'h3):(1'h0)] ?
          ($unsigned($unsigned(wire1[(3'h7):(2'h2)])) << wire3) : wire0[(1'h1):(1'h1)]);
      reg8 <= wire0;
      reg9 <= wire1;
      reg10 <= (|wire3);
    end
  assign wire11 = {$signed(reg10)};
  assign wire12 = ($unsigned(($signed($signed(reg8)) > wire3)) ?
                      (^~$unsigned((^~wire5[(3'h5):(3'h4)]))) : $unsigned(wire0));
  assign wire13 = {$unsigned((wire1 ?
                          $signed((wire0 - wire2)) : (&(reg8 >= wire1)))),
                      wire5[(3'h6):(3'h4)]};
  assign wire14 = ($signed(wire1[(3'h7):(3'h7)]) + wire11[(4'ha):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= {(-(((wire6 ? reg7 : (8'hb3)) != $unsigned(wire4)) ?
              (wire14 ?
                  {wire1} : (reg9 ? wire1 : wire0)) : (^(wire3 ^~ wire3)))),
          $signed($signed(($unsigned(wire11) ? $signed(wire6) : wire14)))};
      reg16 <= wire3[(3'h7):(3'h5)];
      reg17 <= (wire4 ?
          (wire5 <<< (wire1[(4'hc):(4'ha)] >> $unsigned($unsigned(wire13)))) : wire12);
    end
  module18 #() modinst91 (.wire22(reg16), .wire21(wire4), .y(wire90), .clk(clk), .wire20(wire6), .wire19(wire5));
  assign wire92 = {$unsigned((^~(~^(wire5 ^ reg9)))),
                      $signed($unsigned((~&reg17)))};
  assign wire93 = ($unsigned(wire5) - (8'hb9));
  always
    @(posedge clk) begin
      reg94 <= ((!$unsigned((wire5 ?
              reg15[(3'h5):(2'h3)] : wire13[(1'h0):(1'h0)]))) ?
          (~&(^(wire3 ? wire11 : (wire1 ? (8'hae) : reg10)))) : {wire1});
      reg95 <= (^$unsigned($signed((~&wire3))));
      reg96 <= wire5;
      reg97 <= ((+reg96) ?
          (~&$unsigned((~|(wire4 ?
              wire1 : wire6)))) : $unsigned(({wire13} * wire11[(3'h6):(1'h0)])));
    end
  assign wire98 = $signed(($unsigned(reg97) ?
                      (^~$signed(wire93[(3'h6):(3'h5)])) : (|{$unsigned(reg9),
                          reg96})));
  assign wire99 = $signed(reg15);
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire47;
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire81,
                 wire80,
                 wire78,
                 wire49,
                 wire47,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  module23 #() modinst48 (wire47, clk, wire20, wire19, wire21, wire22, (8'ha9));
  assign wire49 = wire47;
  module50 #() modinst79 (.wire51(wire47), .wire52(wire21), .y(wire78), .wire54(wire19), .clk(clk), .wire53(wire20));
  assign wire80 = (~&wire21);
  assign wire81 = $signed((~(!($unsigned((8'ha4)) ?
                      wire20[(1'h0):(1'h0)] : wire19[(4'hc):(4'hc)]))));
  always
    @(posedge clk) begin
      if (((+$signed($signed($signed(wire22)))) ?
          (8'ha7) : (wire20 == $signed(wire21))))
        begin
          reg82 <= $signed(($signed((wire22[(1'h0):(1'h0)] + wire20[(5'h11):(4'hc)])) < wire20));
          reg83 <= wire78[(3'h4):(2'h3)];
          reg84 <= ((8'haa) >= (((^$signed(reg82)) ^ (!wire81[(1'h0):(1'h0)])) >> {(reg83[(1'h1):(1'h0)] ?
                  $unsigned(wire22) : $signed(wire19)),
              ((+wire47) && (reg83 || wire47))}));
          reg85 <= (!((^(reg82[(3'h5):(3'h5)] ?
              $signed(wire47) : (wire19 ? wire49 : wire19))) ^~ reg82));
        end
      else
        begin
          reg82 <= ($signed(wire80) << reg83[(2'h2):(1'h1)]);
          reg83 <= ((&reg82[(3'h6):(1'h1)]) && wire81[(2'h2):(2'h2)]);
          reg84 <= $signed($unsigned(wire80[(2'h3):(2'h3)]));
        end
      reg86 <= $signed(wire80);
    end
  always
    @(posedge clk) begin
      reg87 <= wire22;
    end
  assign wire88 = (~$unsigned($unsigned(wire49)));
  assign wire89 = $unsigned({(((~|wire20) <= (reg85 >> wire81)) >> $signed(reg87)),
                      {(((7'h41) && wire20) <<< (reg85 ? wire47 : (7'h42)))}});
endmodule

module module50
#(parameter param76 = (((^~((~|(8'hbb)) >> (|(8'hb5)))) ~^ (~&(((8'h9c) ? (8'h9e) : (8'hb8)) ~^ (~&(8'h9d))))) <= {((7'h40) ? ((^~(8'h9f)) ? ((8'ha8) & (8'h9f)) : ((8'hab) <= (7'h40))) : {((8'hab) ? (8'hbc) : (8'hb8))}), (-(8'ha5))}), 
parameter param77 = (^~param76))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire signed [(5'h11):(1'h0)] wire53;
  input wire [(4'h9):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 (1'h0)};
  assign wire55 = wire52;
  assign wire56 = (+wire53[(4'he):(4'he)]);
  assign wire57 = (wire56 | ($unsigned(((^wire51) == ((8'hbe) == (8'h9c)))) ?
                      (8'ha3) : wire52));
  assign wire58 = wire51;
  assign wire59 = wire56[(2'h2):(2'h2)];
  assign wire60 = $unsigned((^~wire51[(4'hd):(4'ha)]));
  assign wire61 = $unsigned(wire53[(3'h6):(2'h3)]);
  assign wire62 = $signed($unsigned(wire56[(1'h1):(1'h1)]));
  assign wire63 = $signed($signed(wire60));
  assign wire64 = (($unsigned((|$unsigned(wire57))) != (~&(~|{wire60,
                      wire56}))) & wire57[(4'hd):(4'hb)]);
  assign wire65 = $signed(({$unsigned($unsigned(wire58))} ?
                      (8'ha0) : (wire59 ?
                          (~&(wire64 >>> wire51)) : ($signed(wire53) ?
                              (wire56 == wire62) : (^~wire53)))));
  assign wire66 = (~$signed(((wire52[(3'h6):(3'h6)] ?
                      $signed((7'h42)) : (wire60 ?
                          wire58 : wire56)) << (8'hb2))));
  assign wire67 = (($unsigned(wire51[(4'h8):(4'h8)]) || $unsigned($signed($signed(wire54)))) << {(wire61[(4'h8):(3'h6)] ?
                          ((wire65 ? wire61 : (8'hb3)) ?
                              $signed(wire66) : $signed((7'h41))) : (8'ha0)),
                      wire54});
  assign wire68 = (&wire52[(1'h0):(1'h0)]);
  assign wire69 = (wire65[(3'h5):(2'h2)] ^ ({((wire57 ?
                          wire53 : wire62) | $signed(wire60)),
                      wire52[(3'h5):(2'h3)]} & wire54[(1'h0):(1'h0)]));
  assign wire70 = (7'h42);
  assign wire71 = {wire64};
  assign wire72 = $signed((8'h9d));
  assign wire73 = $signed((~^wire64[(4'hd):(3'h5)]));
  assign wire74 = wire52[(4'h9):(2'h2)];
  assign wire75 = (-(wire65 >= ((~wire57) ?
                      (~^$signed((8'hab))) : ($unsigned(wire65) | {(8'hb7),
                          wire66}))));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  assign y = {wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg45,
                 reg41,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire29 = (~^$signed((|({wire26} >> wire26))));
  assign wire30 = wire29[(4'hb):(3'h4)];
  assign wire31 = (8'haf);
  assign wire32 = (+wire26[(4'hd):(4'hc)]);
  assign wire33 = wire24;
  assign wire34 = $signed($unsigned(wire31[(1'h0):(1'h0)]));
  assign wire35 = (((-wire32) <<< (($signed(wire26) ?
                          wire34[(2'h3):(1'h0)] : wire25) ?
                      $unsigned($unsigned(wire31)) : (~|(-wire30)))) >= ({(wire28 != $signed(wire31))} ?
                      $unsigned($unsigned((wire29 ^ wire30))) : $unsigned($unsigned((~^wire33)))));
  always
    @(posedge clk) begin
      reg36 <= (wire33[(3'h7):(1'h0)] >>> (^$unsigned(((~|wire35) ?
          $signed(wire26) : $signed((8'haf))))));
      reg37 <= (|wire35);
      reg38 <= (wire28[(3'h7):(1'h1)] | (~|$unsigned(((~|wire35) >= $unsigned(wire31)))));
      reg39 <= wire31;
    end
  assign wire40 = ($signed((wire29 <<< $unsigned((~&wire30)))) >> $signed((8'hae)));
  always
    @(posedge clk) begin
      reg41 <= ((reg37[(2'h2):(1'h0)] != wire35) + {$unsigned($signed($signed(wire30))),
          $unsigned(reg37)});
    end
  assign wire42 = (wire25 ? {reg38} : wire30);
  assign wire43 = (~^{$unsigned((+{reg39})),
                      ((reg38 | wire25[(1'h0):(1'h0)]) ^~ $unsigned((+wire25)))});
  assign wire44 = $unsigned($signed((wire35[(1'h1):(1'h1)] ?
                      {$unsigned(reg41),
                          (&wire42)} : (wire40[(2'h2):(1'h1)] <<< (wire32 < wire27)))));
  always
    @(posedge clk) begin
      reg45 <= reg41;
    end
  assign wire46 = ($unsigned($signed(wire32)) >> (8'hbb));
endmodule
