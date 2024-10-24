module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = ($signed((7'h41)) && wire3);
  assign wire5 = ({$unsigned(wire2[(2'h2):(1'h0)])} ?
                     wire2[(3'h4):(1'h0)] : (!(((wire2 >= wire2) & ((8'ha5) ?
                             wire3 : wire2)) ?
                         wire2 : ($unsigned((8'hb7)) ?
                             wire2[(1'h0):(1'h0)] : $unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned(wire1));
      reg7 <= (~&{(8'ha5)});
      reg8 <= wire5[(2'h2):(1'h0)];
      reg9 <= wire2;
      reg10 <= (|({($signed((8'hbc)) & wire3[(3'h4):(1'h0)])} >>> reg6[(4'hc):(4'h8)]));
    end
  always
    @(posedge clk) begin
      reg11 <= $unsigned((^~(wire3[(1'h1):(1'h1)] ^ $unsigned((reg9 > wire3)))));
      reg12 <= $unsigned((^~reg9[(2'h2):(1'h0)]));
      reg13 <= $unsigned((^~(($unsigned(wire2) <<< wire1) ?
          $signed(reg8[(1'h0):(1'h0)]) : ((^wire3) ?
              ((8'hae) ? (8'ha3) : wire5) : (|wire3)))));
      reg14 <= $signed(({$unsigned((wire2 || reg7))} < (|(^~(!(8'hbb))))));
    end
  assign wire15 = {wire1[(1'h1):(1'h0)], (!reg10[(3'h6):(2'h3)])};
  assign wire16 = reg13[(2'h2):(2'h2)];
  assign wire17 = (^~$unsigned(($signed((reg7 >>> (8'hbb))) + wire16)));
  assign wire18 = $signed(reg14);
  assign wire19 = wire18[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg20 <= reg8[(2'h3):(1'h1)];
      reg21 <= (^(|$unsigned($signed(wire16[(2'h3):(1'h1)]))));
    end
  module22 #() modinst78 (.wire24(wire18), .wire25(wire0), .wire27(wire17), .clk(clk), .wire23(wire3), .wire26(reg21), .y(wire77));
  assign wire79 = $unsigned(wire0);
  assign wire80 = $signed($unsigned((reg11 ? reg11 : reg7[(4'hc):(2'h2)])));
  assign wire81 = $unsigned({$signed((~|reg13)),
                      $signed((^~(reg13 << (8'had))))});
  assign wire82 = (($unsigned((wire5[(1'h1):(1'h0)] + (wire3 & wire77))) >>> $signed($unsigned({wire79}))) ?
                      (|(wire81[(3'h7):(3'h5)] < (8'hba))) : $signed((-wire1[(2'h3):(2'h3)])));
  assign wire83 = $unsigned(wire82);
  assign wire84 = (&(~{(^(~reg6))}));
  assign wire85 = reg9[(4'ha):(2'h2)];
  assign wire86 = ($unsigned((^$signed($unsigned(wire81)))) ?
                      $signed(wire0) : wire80[(3'h7):(2'h3)]);
  assign wire87 = {(^{$signed(wire3[(4'ha):(2'h3)]), wire3}), $signed((8'hb1))};
  assign wire88 = {$unsigned($signed(wire87[(4'h9):(3'h7)])),
                      $signed((^~((&(8'ha8)) ? (~|wire15) : (^reg8))))};
  assign wire89 = reg6;
endmodule

module module22
#(parameter param75 = ({(8'ha8)} ? (~((~^((7'h43) ^~ (8'hb2))) <= (((8'ha5) ? (8'ha8) : (8'had)) - ((8'ha6) ^~ (8'hb2))))) : ((~^(|((8'ha9) ? (8'haa) : (8'hba)))) <= (({(8'ha9)} ~^ (~|(7'h40))) ~^ (!((8'h9d) ? (8'hb4) : (8'h9e)))))), 
parameter param76 = (+(|param75)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire43;
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  assign y = {wire74,
                 wire72,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 (1'h0)};
  module28 #() modinst44 (.wire31(wire24), .clk(clk), .wire30(wire25), .wire32(wire26), .wire29(wire27), .y(wire43));
  assign wire45 = (wire25[(4'h9):(3'h5)] != wire26);
  assign wire46 = ($unsigned(($unsigned((wire43 ? wire25 : wire24)) ?
                      (wire25[(4'he):(3'h4)] ? {wire43} : (8'ha3)) : ({wire27,
                              wire25} ?
                          {wire27,
                              (7'h43)} : $signed(wire25)))) ^~ $signed($unsigned(wire23[(3'h7):(3'h6)])));
  assign wire47 = ((({$unsigned(wire24),
                      (&wire43)} < $signed(wire27[(3'h4):(3'h4)])) < wire45) || (~$unsigned(($unsigned((8'ha9)) ?
                      wire26 : wire23))));
  assign wire48 = $unsigned($signed({$signed($signed(wire26))}));
  assign wire49 = ((wire23[(4'h8):(4'h8)] != $unsigned(wire25)) ?
                      ((wire47[(3'h4):(2'h3)] ?
                          {wire46[(2'h2):(1'h1)],
                              wire45} : $signed(wire25)) & wire24) : $unsigned((wire23[(3'h4):(1'h0)] ?
                          (~^$signed(wire26)) : wire26)));
  assign wire50 = (wire43 ?
                      wire49[(3'h4):(1'h1)] : (~|$signed($unsigned((wire48 ?
                          wire48 : wire24)))));
  assign wire51 = (wire45 > wire23[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      reg52 <= {$unsigned($signed({wire23, $unsigned((8'h9d))})),
          $unsigned((8'hb8))};
      reg53 <= {{(($signed(wire23) ?
                  (wire23 ? wire43 : (8'ha1)) : $signed(wire27)) && (8'hac))}};
      reg54 <= wire27[(2'h3):(2'h3)];
      reg55 <= $unsigned((!$signed((|$unsigned((8'ha4))))));
      reg56 <= (8'hac);
    end
  module57 #() modinst73 (.clk(clk), .wire62(wire50), .wire60(wire51), .wire58(wire47), .y(wire72), .wire59(reg52), .wire61(wire23));
  assign wire74 = ((7'h40) * (~^wire24));
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire signed [(4'hf):(1'h0)] wire61;
  input wire [(3'h4):(1'h0)] wire60;
  input wire signed [(4'hb):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire63 = $signed(wire59);
  assign wire64 = (($signed((~|$unsigned((8'ha6)))) ?
                          wire58[(3'h7):(2'h2)] : $unsigned($unsigned({wire61,
                              (8'ha2)}))) ?
                      $signed((wire60[(3'h4):(2'h3)] != wire59)) : (wire62 < wire62[(4'h9):(2'h2)]));
  assign wire65 = $signed($unsigned((wire58 ?
                      $signed(wire59) : $signed((wire59 << (8'hbc))))));
  assign wire66 = (wire64[(3'h5):(3'h4)] >> ((($unsigned(wire60) ^ $unsigned(wire65)) == (8'ha4)) ?
                      {((7'h41) ? (wire61 < wire65) : {wire60})} : (wire59 ?
                          (^wire59[(3'h4):(3'h4)]) : (!wire59[(3'h4):(1'h0)]))));
  always
    @(posedge clk) begin
      reg67 <= $signed(wire60[(3'h4):(1'h0)]);
      reg68 <= (wire64 ? reg67[(1'h1):(1'h1)] : $signed((8'ha5)));
    end
  assign wire69 = (&((reg68[(3'h4):(2'h3)] || {{wire62}, $unsigned(wire62)}) ?
                      ($unsigned((&reg68)) >> {(~^(8'hb8)),
                          (~|wire60)}) : (^~($signed(wire59) ?
                          (wire66 ? wire58 : wire60) : ((8'hb0) ?
                              wire64 : wire58)))));
  assign wire70 = (!wire63[(1'h1):(1'h0)]);
  assign wire71 = (wire61[(4'hd):(2'h2)] ?
                      wire58 : ($unsigned((~|$unsigned(reg67))) - wire63));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire32;
  input wire [(4'h9):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  assign y = {wire42,
                 wire40,
                 wire39,
                 wire33,
                 reg41,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = ((&wire29) > (wire29 & wire31));
  always
    @(posedge clk) begin
      reg34 <= $unsigned(($unsigned((+(wire33 ? wire29 : (8'hb3)))) ?
          (+$signed($unsigned(wire32))) : $signed(wire29[(2'h2):(1'h1)])));
      reg35 <= $unsigned($unsigned(((+(&wire33)) ?
          $signed({wire29}) : ((wire33 | wire31) ?
              (reg34 ? wire29 : wire32) : (reg34 == wire31)))));
      reg36 <= reg35[(4'hf):(2'h2)];
      reg37 <= ($unsigned($signed({(reg35 > reg36), $unsigned((8'hbd))})) ?
          {$signed(wire33),
              wire30[(4'hc):(1'h0)]} : $unsigned((wire30[(4'hf):(3'h6)] <<< ($unsigned(wire29) != (wire32 ?
              wire33 : reg34)))));
      reg38 <= reg37[(1'h0):(1'h0)];
    end
  assign wire39 = ((((reg38 - $unsigned((8'ha8))) + {wire33[(1'h0):(1'h0)],
                      {wire31}}) < reg34[(1'h1):(1'h1)]) & {reg38[(3'h6):(2'h3)],
                      wire31});
  assign wire40 = ((wire29 ?
                          wire32 : ($unsigned($signed(reg38)) ?
                              ($unsigned((8'ha6)) ?
                                  $unsigned(wire31) : $signed(wire30)) : $signed(reg38))) ?
                      wire32 : (-$unsigned((((8'hbc) < wire33) >= $signed(reg36)))));
  always
    @(posedge clk) begin
      reg41 <= ({(+$signed(wire29[(2'h3):(2'h2)])),
          ($unsigned(reg34) != $signed(reg35[(4'h8):(3'h4)]))} ~^ reg36[(2'h3):(1'h1)]);
    end
  assign wire42 = $signed(wire29);
endmodule
