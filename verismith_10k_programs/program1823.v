module top
#(parameter param168 = {(((-(8'hb0)) ? (~((7'h44) >>> (7'h40))) : {((8'hb7) ? (7'h44) : (8'hb8))}) <= (({(8'hbb)} & (~(7'h42))) == (!((8'ha7) ^~ (8'hb6)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(5'h12):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire156;
  wire signed [(4'h8):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire158;
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire154,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire65,
                 wire156,
                 wire157,
                 wire158,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire5 = (~wire0);
  assign wire6 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire7 = $unsigned($unsigned((wire0 ? wire5 : $signed((+wire1)))));
  assign wire8 = {(~^$signed($unsigned((-wire6))))};
  always
    @(posedge clk) begin
      reg9 <= (8'hbc);
      reg10 <= (8'ha7);
      if (reg10)
        begin
          reg11 <= $signed((~|wire8[(1'h0):(1'h0)]));
          reg12 <= (+$unsigned(wire1[(4'h9):(1'h0)]));
          reg13 <= (+(+$signed($signed((wire7 ? (8'haf) : (8'ha4))))));
          reg14 <= $unsigned($signed({((wire4 ~^ wire0) ?
                  (wire0 != wire1) : reg12),
              reg11[(1'h1):(1'h0)]}));
          reg15 <= $signed(reg10[(1'h0):(1'h0)]);
        end
      else
        begin
          reg11 <= {wire1};
          reg12 <= (wire8 <= reg12[(4'hd):(4'hb)]);
          reg13 <= (^$unsigned(reg15));
          reg14 <= (&$unsigned((-$signed(wire8))));
        end
      reg16 <= (!reg12[(2'h3):(2'h2)]);
    end
  module17 #() modinst66 (wire65, clk, wire6, reg14, wire5, wire8);
  assign wire67 = ($unsigned($signed(((reg11 && reg14) * (~&wire2)))) ?
                      ((wire65 ?
                              ((wire3 != wire5) ?
                                  (reg15 ?
                                      wire6 : reg12) : (~&wire7)) : (((8'ha7) | reg11) ?
                                  reg14 : reg15)) ?
                          ({wire6[(4'hb):(1'h0)],
                              (wire2 ? (8'hab) : reg9)} <= ((~&wire6) ?
                              (~reg15) : wire4[(3'h4):(2'h3)])) : $signed(wire2[(2'h3):(2'h3)])) : ($signed({(wire5 << wire0)}) | reg16[(3'h7):(1'h0)]));
  assign wire68 = $signed(($signed({(reg11 <<< wire7), $unsigned(reg14)}) ?
                      (wire4 ?
                          wire1[(4'hc):(2'h2)] : wire4) : (~(|reg13[(3'h7):(3'h6)]))));
  assign wire69 = $unsigned({$unsigned(((reg16 & wire4) ?
                          (~wire5) : (-(8'ha3)))),
                      wire7});
  assign wire70 = reg16;
  always
    @(posedge clk) begin
      if ((wire5[(4'h9):(3'h7)] * $signed({wire2})))
        begin
          reg71 <= reg12[(3'h7):(1'h0)];
          reg72 <= ((reg71[(3'h4):(2'h2)] ?
              reg16 : $unsigned($unsigned((wire69 ?
                  wire7 : (8'hb9))))) | (~{wire8}));
          reg73 <= ((^{$unsigned({wire2, reg72})}) ?
              (wire70 ?
                  {(8'hba)} : reg12[(4'h8):(1'h1)]) : reg14[(3'h7):(1'h1)]);
        end
      else
        begin
          reg71 <= (~|$signed(wire65[(1'h1):(1'h0)]));
          reg72 <= (({$unsigned((wire4 && (8'hba))), {((8'hb7) >>> (8'hb1))}} ?
              (&((reg72 != reg71) ?
                  wire2[(1'h1):(1'h1)] : (reg14 > wire6))) : $unsigned(reg9)) && $signed((+((^wire1) ?
              (reg16 ? wire70 : wire8) : ((7'h43) ? (8'hbd) : wire7)))));
          reg73 <= reg9;
        end
      reg74 <= wire68[(2'h3):(1'h1)];
      if ((({$signed($signed(wire67))} <= wire69[(4'he):(4'h9)]) * $unsigned($unsigned($signed((wire1 ?
          wire7 : reg11))))))
        begin
          if (wire6[(3'h5):(1'h1)])
            begin
              reg75 <= wire8[(3'h5):(2'h3)];
              reg76 <= (wire68[(4'hd):(3'h7)] ^ {(8'hb2)});
            end
          else
            begin
              reg75 <= ((^{$signed((wire67 == reg15))}) ?
                  wire0[(1'h0):(1'h0)] : (+reg74[(1'h1):(1'h1)]));
              reg76 <= ((reg9[(2'h3):(2'h3)] >>> (+(reg71 ?
                      $signed((8'had)) : {(8'ha4), (7'h41)}))) ?
                  (~^$unsigned(reg10)) : $unsigned($unsigned((wire6 ?
                      (8'hb2) : (wire4 == reg14)))));
            end
        end
      else
        begin
          reg75 <= (~^((wire65[(1'h0):(1'h0)] | reg15[(2'h2):(2'h2)]) ?
              $unsigned($signed($signed(reg11))) : wire1));
          reg76 <= $unsigned($signed((reg13[(5'h12):(1'h1)] + wire65[(2'h2):(1'h1)])));
          reg77 <= reg75[(3'h6):(1'h1)];
        end
    end
  module78 #() modinst155 (.wire79(wire6), .y(wire154), .wire80(wire67), .wire82(reg12), .wire81(wire4), .clk(clk));
  assign wire156 = $unsigned(reg77[(3'h6):(2'h3)]);
  assign wire157 = {{reg9, wire154[(5'h11):(4'hd)]},
                       ((8'ha6) ?
                           reg76 : ((((8'hb3) ^~ wire154) | reg13[(3'h7):(2'h3)]) && {wire6[(4'h9):(4'h9)]}))};
  module24 #() modinst159 (.wire28(wire5), .wire26(wire4), .wire29(wire154), .wire25(wire70), .wire27(wire7), .y(wire158), .clk(clk));
  assign wire160 = wire157[(3'h4):(1'h0)];
  assign wire161 = (+((8'h9d) < (wire70[(4'hd):(1'h0)] ?
                       (~|$unsigned(wire67)) : ((reg10 > wire160) ?
                           $unsigned(wire3) : $signed(wire0)))));
  assign wire162 = wire1[(4'hd):(3'h4)];
  assign wire163 = wire67[(1'h1):(1'h0)];
  assign wire164 = $unsigned(wire5[(2'h3):(2'h3)]);
  assign wire165 = ($unsigned((^(+reg10[(2'h2):(1'h1)]))) != reg14[(1'h1):(1'h0)]);
  assign wire166 = (+wire160[(3'h7):(3'h4)]);
  assign wire167 = reg10;
endmodule

module module78  (y, clk, wire79, wire80, wire81, wire82);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire80;
  input wire [(4'h9):(1'h0)] wire81;
  input wire [(5'h15):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire109;
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire109,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire83 = $unsigned($unsigned((^~wire79)));
  assign wire84 = $signed(wire81);
  assign wire85 = $signed(wire79[(4'hf):(2'h2)]);
  assign wire86 = (|$unsigned({wire80}));
  assign wire87 = $signed($unsigned($unsigned($unsigned((^~wire80)))));
  assign wire88 = $signed((|($signed($signed(wire86)) ?
                      (8'hbc) : $unsigned($unsigned(wire85)))));
  module89 #() modinst110 (wire109, clk, wire87, wire86, wire85, wire88, wire82);
  always
    @(posedge clk) begin
      reg111 <= (!wire84[(3'h5):(1'h1)]);
      reg112 <= (^(^$signed((&{wire85}))));
      reg113 <= {($signed({wire86}) & $signed(($unsigned(wire84) == wire79[(1'h1):(1'h1)]))),
          wire80[(4'ha):(3'h6)]};
      reg114 <= (~&$unsigned(wire109));
      reg115 <= $signed({(($unsigned(wire80) ?
                  $unsigned(wire109) : wire79[(4'h9):(3'h4)]) ?
              $unsigned(reg114[(1'h0):(1'h0)]) : $signed(wire85[(2'h2):(1'h1)]))});
    end
  assign wire116 = $signed(reg111);
  assign wire117 = $signed((($signed($unsigned(wire87)) <<< reg111[(1'h1):(1'h0)]) != wire84));
  assign wire118 = wire82[(2'h3):(1'h1)];
  assign wire119 = wire87;
  assign wire120 = ($signed(wire118) ? (-wire109) : wire83[(1'h1):(1'h0)]);
  assign wire121 = (~&$signed(wire83[(1'h0):(1'h0)]));
  module122 #() modinst142 (.wire123(wire81), .wire126(reg111), .clk(clk), .y(wire141), .wire125(wire119), .wire124(reg114));
  assign wire143 = ((wire117 ?
                           {(+(wire87 ? wire83 : reg111)),
                               {(wire87 <= wire84)}} : wire85[(2'h3):(2'h3)]) ?
                       $signed(({(8'hac)} + wire83)) : wire141);
  assign wire144 = $unsigned($unsigned((reg111 || (8'hb1))));
  assign wire145 = $signed($unsigned($signed(((~^wire88) ?
                       (wire117 ? wire109 : reg113) : (wire119 | wire88)))));
  assign wire146 = (^~(~&(((~|wire83) >> $unsigned(wire117)) == wire119)));
  assign wire147 = $signed((8'h9f));
  assign wire148 = (wire118 ?
                       (((~&reg114[(3'h4):(1'h0)]) - (~&{reg111})) <= wire87) : wire109);
  assign wire149 = ($signed((wire85[(4'h9):(3'h6)] ?
                       wire86[(2'h2):(2'h2)] : $unsigned((wire143 <<< reg114)))) <= (-(8'hb6)));
  always
    @(posedge clk) begin
      reg150 <= (((~|((wire119 | wire83) ?
              (reg113 ? wire121 : (8'hb6)) : $unsigned(wire85))) == {reg111}) ?
          wire83 : $signed({$unsigned(reg112)}));
      reg151 <= $signed((7'h44));
      reg152 <= ($unsigned((~^{{wire147}})) ?
          (^~$unsigned((~$unsigned((8'h9e))))) : ($unsigned($unsigned((~|wire118))) ?
              wire84[(2'h2):(1'h0)] : (&(8'ha4))));
      reg153 <= $signed((~^$signed($unsigned($unsigned((7'h44))))));
    end
endmodule

module module17
#(parameter param64 = (^({(((7'h40) < (8'hb5)) ? ((8'ha9) ~^ (8'haa)) : ((8'hbb) >>> (8'haa))), (((8'ha1) ? (8'ha9) : (8'hbb)) < (^~(8'ha3)))} < (8'ha0))))
(y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire52;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire22,
                 wire23,
                 wire52,
                 (1'h0)};
  assign wire22 = (wire19[(2'h2):(2'h2)] ?
                      ($signed($unsigned($unsigned(wire19))) ?
                          ((|$unsigned(wire18)) ?
                              {$unsigned(wire18),
                                  (wire20 ?
                                      (8'h9d) : wire20)} : ($unsigned(wire19) ?
                                  $signed(wire19) : wire20[(4'h8):(3'h4)])) : $signed((8'hac))) : (-wire19[(2'h2):(1'h0)]));
  assign wire23 = wire21;
  module24 #() modinst53 (wire52, clk, wire21, wire23, wire19, wire20, wire18);
  assign wire54 = wire18[(4'h8):(3'h5)];
  assign wire55 = wire19;
  assign wire56 = {$signed((wire23 ? {wire20[(4'he):(2'h2)]} : (~&{wire18})))};
  assign wire57 = (7'h43);
  assign wire58 = (~^$unsigned(wire56[(2'h2):(1'h0)]));
  assign wire59 = (wire19 ~^ {wire52, {wire56}});
  assign wire60 = wire19;
  assign wire61 = (wire60 >= ((~&(&{(7'h41)})) <<< $unsigned(wire56)));
  assign wire62 = $signed(wire57);
  assign wire63 = $unsigned($unsigned({(+(wire60 ^~ wire20)),
                      $unsigned((~&wire61))}));
endmodule

module module24
#(parameter param50 = ((~&(((~^(8'ha9)) > {(8'hbb)}) ? ((-(8'hbe)) ? ((8'hb9) > (8'hbf)) : ((7'h42) ^~ (8'hb2))) : ((8'haf) << ((7'h40) ? (8'hb8) : (8'ha9))))) & ((((^(8'h9d)) ? ((8'hac) < (8'ha6)) : ((8'ha6) - (8'hb4))) ? ((+(8'ha0)) ? {(8'hac)} : ((8'hbc) ? (8'ha3) : (8'hb8))) : (((8'hbd) ? (8'hbd) : (8'ha2)) ? (+(8'hac)) : ((8'hae) - (8'hb9)))) ? ((^~(~(8'hb6))) * ((8'hb3) && {(7'h43)})) : ({(+(8'hab)), (-(8'hb6))} ? ((~&(8'hb9)) ? (^~(7'h44)) : ((8'haa) ? (8'hb3) : (8'hae))) : (((8'hb4) && (8'hbd)) + {(8'ha3)})))), 
parameter param51 = (~param50))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire28;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire [(3'h7):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire49,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 wire30,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg32,
                 (1'h0)};
  assign wire30 = wire26[(4'hd):(2'h3)];
  assign wire31 = wire29[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg32 <= wire25;
    end
  assign wire33 = wire28;
  assign wire34 = wire33[(3'h4):(2'h3)];
  assign wire35 = reg32[(1'h1):(1'h0)];
  assign wire36 = (&(8'ha8));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((8'h9f))))
        begin
          reg37 <= (^$unsigned((7'h44)));
          if ($unsigned($signed($signed(((-wire34) ?
              ((8'had) ? wire28 : reg32) : $unsigned(wire31))))))
            begin
              reg38 <= {$signed((&wire29[(2'h3):(2'h2)]))};
              reg39 <= (&$signed($unsigned($unsigned($unsigned(wire30)))));
              reg40 <= (|$signed(({{reg38, wire33}} ^ ((wire36 ?
                      wire29 : wire28) ?
                  reg37[(3'h7):(2'h3)] : $unsigned(wire33)))));
              reg41 <= reg39[(1'h1):(1'h0)];
              reg42 <= $signed($unsigned(wire31[(2'h2):(1'h0)]));
            end
          else
            begin
              reg38 <= $unsigned(wire34);
              reg39 <= {(($signed(wire26[(4'h9):(3'h4)]) <<< (+$signed((8'hb9)))) ^ reg42)};
              reg40 <= $unsigned($unsigned($signed(reg41)));
              reg41 <= (+$unsigned($unsigned({((8'hbe) ? wire26 : wire36),
                  $unsigned(wire35)})));
            end
          reg43 <= wire35;
          reg44 <= (wire25 ?
              ((~$unsigned({wire35})) ?
                  (~{{wire34},
                      {wire33,
                          reg42}}) : $unsigned((reg32 != reg40[(4'hd):(4'ha)]))) : (!(reg41 ?
                  reg37[(1'h0):(1'h0)] : (~|reg43[(4'h8):(2'h3)]))));
          reg45 <= ((wire28 ^~ $signed($signed($signed(wire27)))) <= wire27);
        end
      else
        begin
          if (reg32[(1'h1):(1'h0)])
            begin
              reg37 <= $unsigned(((8'ha4) ^~ reg38));
              reg38 <= (-$signed((wire29[(3'h7):(1'h0)] || (wire35 ?
                  (reg40 ? reg38 : wire30) : $unsigned(reg40)))));
              reg39 <= $signed((^wire29[(4'ha):(1'h1)]));
              reg40 <= ({(|($signed(reg41) < (reg42 ^~ (8'ha7)))),
                  reg40} != ((reg32[(1'h1):(1'h1)] ?
                      wire34 : $unsigned(wire34[(5'h12):(4'h8)])) ?
                  $unsigned($signed($signed(wire30))) : {$signed((|reg37)),
                      ($unsigned(reg41) > reg44)}));
            end
          else
            begin
              reg37 <= wire28;
              reg38 <= (wire29 ? $unsigned(wire34) : wire30);
              reg39 <= ((|(~&$unsigned({(8'h9f),
                  wire25}))) ~^ ({reg32[(1'h1):(1'h1)], (!(^~wire25))} ?
                  (((8'h9e) ?
                      (~|(8'h9f)) : (8'h9f)) ^ (8'hb0)) : reg44[(5'h11):(1'h1)]));
            end
          if (wire29[(3'h5):(1'h1)])
            begin
              reg41 <= (((((reg44 ? wire27 : wire31) > reg44[(4'he):(4'he)]) ?
                      {reg39[(3'h4):(2'h2)]} : reg42) >= wire34) ?
                  ($signed($signed({reg39,
                      reg38})) << {(&$unsigned(reg45))}) : wire29[(2'h2):(1'h0)]);
              reg42 <= $signed($unsigned((~|$signed((-(8'ha1))))));
              reg43 <= (~$signed(wire35));
              reg44 <= $unsigned(reg42[(4'hb):(4'h8)]);
            end
          else
            begin
              reg41 <= $unsigned((wire35[(2'h3):(2'h2)] | (~&(&(^wire29)))));
            end
        end
      reg46 <= ($signed($unsigned(reg43[(5'h14):(3'h7)])) ?
          (wire27 * $signed($unsigned($unsigned(wire27)))) : $unsigned(wire25[(2'h3):(2'h3)]));
      reg47 <= wire36[(3'h4):(1'h1)];
      reg48 <= $signed($signed(($unsigned({wire35}) >> $signed(wire29[(3'h5):(1'h0)]))));
    end
  assign wire49 = (~$unsigned($unsigned((-{reg48, wire25}))));
endmodule

module module122
#(parameter param139 = (({(~&((8'hb6) ? (8'ha5) : (8'hb2)))} ? (|(~((8'hab) << (8'ha2)))) : ((!((8'hab) ? (8'hbc) : (8'hb1))) ? (((8'ha0) ? (7'h41) : (8'ha8)) ? (~|(8'hb8)) : ((8'hb9) > (8'haf))) : (8'hb6))) ? ((({(8'haa), (8'hb4)} - ((8'ha8) >= (8'h9d))) >= ((^(8'hbe)) <<< ((8'ha0) ? (7'h43) : (8'hae)))) ? ((|((8'h9d) ? (8'hb8) : (8'hb8))) + {((8'had) <<< (8'ha2))}) : ((((8'hb8) ? (8'had) : (7'h44)) ? ((8'haa) ? (8'hb9) : (8'ha3)) : {(8'hb7), (8'hb2)}) ? (~((7'h40) ? (8'had) : (8'hb5))) : (!((8'hab) ? (8'ha7) : (8'h9d))))) : (-(((~(8'hab)) ? (^~(8'hb2)) : ((8'hb6) ? (8'ha3) : (8'ha9))) | {((8'hb5) ~^ (8'h9f)), {(8'h9e), (8'hb8)}}))), 
parameter param140 = ((param139 ? (^~(param139 ? param139 : ((8'ha4) ? param139 : param139))) : param139) ? param139 : param139))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire126;
  input wire signed [(4'hc):(1'h0)] wire125;
  input wire signed [(4'he):(1'h0)] wire124;
  input wire [(4'h9):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire127 = wire124;
  assign wire128 = ($unsigned({$unsigned(wire125[(4'hb):(3'h5)])}) + $unsigned($unsigned($unsigned(wire127))));
  assign wire129 = wire124[(4'hb):(1'h0)];
  assign wire130 = wire123;
  assign wire131 = wire125[(1'h0):(1'h0)];
  assign wire132 = ((8'hab) ?
                       ({(!(wire129 ? (8'hac) : wire127)),
                               ((~^wire129) || (wire125 ? (8'hb0) : wire124))} ?
                           (-(+{wire130, wire128})) : ({(wire131 ~^ (8'haa)),
                               $signed(wire124)} + ((-wire131) ?
                               (wire130 >>> wire124) : ((8'h9d) | wire123)))) : {$signed((~^$signed(wire130)))});
  always
    @(posedge clk) begin
      reg133 <= ($signed((+(8'ha1))) << wire126);
      reg134 <= (($signed(wire123) * reg133) ?
          $unsigned($unsigned(wire129)) : wire132);
      reg135 <= (+{(wire124[(4'h9):(3'h7)] ?
              $unsigned(wire123[(3'h5):(3'h4)]) : wire124[(1'h1):(1'h0)])});
      reg136 <= wire124[(2'h2):(1'h1)];
    end
  assign wire137 = $signed(($unsigned((8'ha0)) ?
                       reg134 : wire129[(4'hb):(4'ha)]));
  assign wire138 = reg134;
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire94;
  input wire [(4'ha):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire [(2'h3):(1'h0)] wire91;
  input wire [(5'h15):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 (1'h0)};
  assign wire95 = $unsigned(wire90[(4'h9):(1'h1)]);
  assign wire96 = $unsigned(($signed((~(wire95 ?
                      wire95 : wire91))) + $unsigned(wire94)));
  assign wire97 = {wire90,
                      ({(8'hac),
                          wire93[(3'h5):(3'h5)]} - ((~^$signed(wire91)) | wire94[(2'h2):(1'h1)]))};
  assign wire98 = ((wire91[(2'h2):(1'h0)] ?
                          $unsigned(wire90[(3'h6):(2'h3)]) : ((^~(wire95 ?
                                  wire97 : wire93)) ?
                              (!wire94[(2'h2):(2'h2)]) : $unsigned((~^(8'ha2))))) ?
                      ({$signed(wire90[(2'h3):(2'h3)]),
                              $signed($signed(wire93))} ?
                          (((wire91 ? wire92 : (8'hb5)) ^~ $unsigned(wire93)) ?
                              ((wire96 <= wire97) ?
                                  ((8'hae) == wire91) : (^wire92)) : $signed((wire95 + wire90))) : wire94) : $unsigned({(8'hb0)}));
  assign wire99 = ((!wire93[(1'h1):(1'h0)]) ?
                      wire91[(2'h3):(1'h0)] : (~&$unsigned($signed((wire94 >= (8'hbe))))));
  assign wire100 = wire96[(3'h6):(2'h3)];
  assign wire101 = wire91;
  assign wire102 = $signed($unsigned(wire94));
  assign wire103 = {$unsigned(wire94)};
  assign wire104 = $signed(($signed(wire90[(5'h10):(3'h7)]) ?
                       (wire97[(3'h5):(3'h5)] ?
                           $unsigned($unsigned(wire91)) : ($signed(wire99) && (^~wire98))) : (wire101 ~^ (wire93 ?
                           (wire97 ? wire95 : wire94) : (wire93 != (8'ha4))))));
  assign wire105 = ((((8'had) > (~|(wire102 ?
                           wire93 : wire104))) * wire92[(3'h6):(1'h0)]) ?
                       {wire102} : ((&{$unsigned(wire102), wire96}) ?
                           wire101[(1'h1):(1'h1)] : (((&wire91) ~^ ((8'ha6) ?
                                   wire92 : wire100)) ?
                               wire93 : ($signed(wire94) ?
                                   (8'h9c) : (wire100 ? wire103 : (8'h9c))))));
  assign wire106 = wire103;
  assign wire107 = (+wire103[(2'h2):(1'h0)]);
  assign wire108 = ($unsigned($unsigned($signed((^~wire98)))) ~^ (($signed((8'ha7)) ?
                       (~wire91[(1'h0):(1'h0)]) : ($signed(wire94) != wire91[(2'h3):(1'h0)])) - {wire91}));
endmodule
