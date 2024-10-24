module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire125;
  wire signed [(5'h11):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire122;
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire22,
                 wire7,
                 wire6,
                 wire5,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire122,
                 reg24,
                 (1'h0)};
  assign wire5 = ((&$signed(wire4)) | ((wire0[(2'h2):(2'h2)] ?
                         (wire4[(4'hf):(4'h8)] ?
                             (wire1 ? wire2 : wire2) : {wire3,
                                 wire0}) : wire2[(3'h6):(1'h1)]) ?
                     wire0[(1'h1):(1'h0)] : $signed(wire0)));
  assign wire6 = wire4[(1'h0):(1'h0)];
  assign wire7 = ((~^$signed(((wire4 > wire0) ?
                     $signed(wire0) : (wire5 ?
                         wire1 : wire0)))) <= (wire4 && $unsigned({(wire3 ?
                         wire6 : (8'hb1)),
                     (~wire2)})));
  module8 #() modinst23 (.clk(clk), .wire10(wire2), .wire13(wire1), .wire9(wire0), .y(wire22), .wire11(wire3), .wire12(wire4));
  always
    @(posedge clk) begin
      reg24 <= wire4;
    end
  assign wire25 = wire4[(3'h7):(2'h3)];
  assign wire26 = (wire7 == $unsigned(wire22));
  assign wire27 = wire6;
  assign wire28 = wire7[(4'h8):(4'h8)];
  module29 #() modinst123 (.clk(clk), .y(wire122), .wire33(wire1), .wire31(wire6), .wire32(wire25), .wire30(reg24));
  assign wire124 = wire2;
  assign wire125 = wire28;
endmodule

module module29  (y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire117;
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire34,
                 wire93,
                 wire95,
                 wire96,
                 wire117,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg97,
                 (1'h0)};
  assign wire34 = (|$signed($signed(wire33[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire30[(1'h0):(1'h0)])
        begin
          reg35 <= {$signed(($unsigned($signed(wire31)) ?
                  (wire33[(2'h3):(2'h3)] ?
                      (wire30 ?
                          (7'h44) : (8'ha8)) : $unsigned(wire30)) : wire32[(2'h3):(2'h3)])),
              wire33};
          reg36 <= wire32[(1'h0):(1'h0)];
          reg37 <= $unsigned({(wire30 ^~ $unsigned((-(8'hb9))))});
        end
      else
        begin
          if (wire32)
            begin
              reg35 <= (~&(wire31[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(reg37)) : (+$signed(reg36[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg35 <= {$unsigned($signed($unsigned($signed(reg37))))};
              reg36 <= wire31;
            end
          reg37 <= $unsigned((+(wire33 ?
              $signed($signed(wire31)) : (^reg35[(4'hb):(3'h4)]))));
          if (({({$unsigned(wire33), wire30[(1'h1):(1'h1)]} ?
                      wire32[(3'h4):(1'h0)] : wire34)} ?
              ((wire31 ?
                  wire33 : $unsigned($unsigned(wire30))) <<< $signed($unsigned(reg36))) : $signed(((^~(reg37 ?
                      reg37 : wire31)) ?
                  wire31[(2'h3):(2'h3)] : $unsigned((-wire30))))))
            begin
              reg38 <= $unsigned(($signed(({reg37} ?
                  $unsigned(reg36) : (reg35 ~^ wire33))) - (reg35 ?
                  {(reg35 ? reg36 : wire33)} : wire34[(4'hf):(4'hc)])));
              reg39 <= reg36[(1'h0):(1'h0)];
            end
          else
            begin
              reg38 <= $unsigned((reg36 ?
                  wire33 : (wire32[(3'h4):(2'h2)] ?
                      ($unsigned(wire30) || $unsigned((8'hb3))) : ((wire32 >>> wire32) ?
                          reg35[(4'hc):(4'h8)] : $signed(reg39)))));
              reg39 <= reg38[(1'h1):(1'h0)];
              reg40 <= (|$signed($signed(reg38[(1'h1):(1'h1)])));
              reg41 <= ((reg35[(1'h1):(1'h1)] ?
                  $unsigned((^reg39[(3'h7):(1'h0)])) : reg35) != reg38);
            end
          if (((+(reg36[(4'ha):(2'h3)] ?
                  $signed((wire32 <= reg41)) : $unsigned($unsigned(reg35)))) ?
              (^((reg41[(1'h0):(1'h0)] ?
                      (wire30 << reg39) : $unsigned(wire31)) ?
                  $signed(reg40) : reg37)) : (reg38 + reg40[(4'hd):(4'h9)])))
            begin
              reg42 <= (&(^~reg40));
              reg43 <= (-{wire31});
              reg44 <= (^$unsigned((reg39 + ((wire33 ~^ reg38) ^~ $signed(reg42)))));
              reg45 <= ($unsigned(wire32) ?
                  (reg42[(1'h0):(1'h0)] || (^($unsigned(reg43) ?
                      reg42 : wire32[(1'h0):(1'h0)]))) : (~^$signed({reg35[(4'ha):(3'h7)],
                      (reg37 != wire34)})));
              reg46 <= ((((!(^~wire34)) || (reg45 ? $signed(reg45) : reg36)) ?
                  wire33 : (^$signed($signed(reg45)))) && ({$signed(wire30)} ?
                  {(wire31 ?
                          $signed(reg40) : $unsigned(reg37))} : ((^$signed(reg40)) ?
                      reg44 : reg37)));
            end
          else
            begin
              reg42 <= wire33;
              reg43 <= $signed(reg35);
              reg44 <= (7'h43);
              reg45 <= $unsigned(reg35);
              reg46 <= (~|{wire33[(1'h0):(1'h0)], reg45});
            end
          reg47 <= $unsigned((~&(~&$unsigned({(8'h9c), wire30}))));
        end
      reg48 <= reg44[(1'h0):(1'h0)];
    end
  module49 #() modinst94 (wire93, clk, reg48, reg37, reg45, reg35);
  assign wire95 = ($signed(wire31[(2'h3):(1'h0)]) ?
                      ((8'hb3) < reg35) : ($unsigned(({wire32,
                              reg36} + $signed(reg43))) ?
                          $signed(wire32) : (reg40 >= reg37)));
  assign wire96 = wire32[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg97 <= ($unsigned($unsigned({(~|reg38), $unsigned(reg40)})) ?
          (reg42[(1'h1):(1'h0)] ?
              $signed((-{reg43, reg41})) : $unsigned(wire95)) : wire30);
    end
  module98 #() modinst118 (.wire102(wire93), .wire101(wire33), .clk(clk), .wire100(wire96), .wire99(reg42), .y(wire117));
  assign wire119 = {wire32};
  assign wire120 = reg48;
  assign wire121 = ((^~$signed($signed((reg43 ? wire95 : (8'hab))))) ?
                       (~^$unsigned(wire120[(3'h6):(2'h3)])) : (-(reg45[(1'h0):(1'h0)] ?
                           ((reg97 ? wire117 : reg43) ?
                               ((8'ha4) <<< reg38) : {reg40,
                                   (8'hb6)}) : $unsigned($signed(wire117)))));
endmodule

module module8
#(parameter param21 = ((!((~&(|(8'haa))) - (8'hbc))) != (((((8'hb1) || (8'haa)) * ((8'haa) > (8'hb4))) ? ({(8'hb9), (8'ha6)} * ((8'hb3) ? (8'hb0) : (8'hae))) : {((8'hbb) ^ (8'hb6))}) ? (8'hbd) : {(((8'hb6) >> (8'ha5)) ? ((8'hb7) ? (8'haf) : (8'hbb)) : ((8'hb7) & (8'hb3))), (((7'h41) ? (8'hac) : (8'ha2)) ? {(8'hb9), (8'hb6)} : (-(8'ha0)))})))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  assign y = {wire20, wire17, wire16, wire15, wire14, reg19, reg18, (1'h0)};
  assign wire14 = (wire12[(3'h4):(2'h3)] != $unsigned((((wire9 ?
                          wire9 : wire13) && (+wire10)) ?
                      (wire13 ?
                          $unsigned(wire10) : $signed(wire11)) : $signed((wire10 ?
                          wire10 : (8'ha8))))));
  assign wire15 = wire13[(2'h3):(1'h1)];
  assign wire16 = ((-(|($signed(wire10) & wire11[(3'h4):(1'h0)]))) ?
                      $signed($unsigned(((wire14 < (8'h9e)) >>> (wire15 ?
                          (8'hb5) : wire12)))) : (wire15[(1'h1):(1'h0)] ?
                          (wire11[(4'hb):(2'h2)] ?
                              ((wire13 && wire13) + wire12[(5'h10):(1'h1)]) : (wire11 ?
                                  (^~wire11) : $signed(wire15))) : $unsigned($signed($signed(wire10)))));
  assign wire17 = (^wire12[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg18 <= wire13;
      reg19 <= ($unsigned($unsigned(($signed((8'ha4)) << (wire12 ?
              wire17 : wire10)))) ?
          $unsigned((8'ha4)) : ((wire15 >>> wire11) ?
              $unsigned(((reg18 >= wire17) > wire15)) : (~^((wire15 != wire10) - (~^wire16)))));
    end
  assign wire20 = wire12;
endmodule

module module98
#(parameter param115 = ((((&((8'h9c) ? (8'hb8) : (8'hbc))) ? (^~(^(8'hb0))) : (~|((7'h41) <= (8'h9c)))) ? ({(^~(8'hb8)), ((8'hb1) ? (8'hbc) : (8'hbf))} ? {(+(8'h9f))} : (((8'hac) ? (8'hb2) : (8'hbd)) + (~(8'hae)))) : (-(((7'h40) & (8'h9e)) || (~^(8'ha1))))) != ({(((7'h43) == (8'hbc)) ? {(8'hbb)} : ((8'h9d) ? (8'h9f) : (8'ha3))), (((8'hb0) << (8'ha8)) ? ((8'hb7) ? (8'hab) : (8'hb5)) : ((8'ha5) * (7'h40)))} ? ((((8'hb2) ? (8'had) : (8'haf)) ? ((8'h9d) >> (8'hbb)) : ((8'hbf) ? (8'ha4) : (8'hb2))) ? (~((8'hb2) | (8'ha7))) : {((8'haf) ? (8'hb0) : (8'ha8)), ((8'hb6) == (7'h44))}) : {(((8'h9d) < (8'hb6)) < ((8'hbb) == (8'ha4)))})), 
parameter param116 = (~|((param115 <= param115) ? (+param115) : (~^((param115 >> param115) == {param115, (7'h42)})))))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(4'h8):(1'h0)] wire101;
  input wire [(5'h11):(1'h0)] wire100;
  input wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 (1'h0)};
  assign wire103 = (7'h42);
  assign wire104 = {(($signed(wire100) ?
                           {{wire102,
                                   wire101}} : wire103) >>> {($unsigned(wire100) >= (wire101 <= wire102))}),
                       wire101[(3'h7):(3'h5)]};
  assign wire105 = ((({wire102[(4'hd):(1'h1)]} == ((wire104 ?
                               wire104 : wire102) ?
                           (wire99 != wire99) : wire101)) && $signed(((wire99 * wire102) ?
                           $unsigned((8'ha4)) : ((7'h40) + (8'hb7))))) ?
                       (((~^(7'h44)) ? wire104 : ((|wire102) < (^wire104))) ?
                           (wire99 ?
                               {(wire99 ? wire104 : wire102),
                                   (wire102 - wire102)} : ($signed(wire103) >= (wire102 & wire100))) : (+wire103)) : (8'hb2));
  assign wire106 = $signed((+wire101[(3'h6):(2'h3)]));
  assign wire107 = (wire101[(2'h3):(2'h3)] >= $unsigned($unsigned($signed($signed((8'ha2))))));
  assign wire108 = (^($unsigned(wire104[(5'h10):(2'h2)]) ^~ wire106[(1'h1):(1'h0)]));
  assign wire109 = {(($signed((&wire99)) * wire101) ?
                           (~&wire100) : $unsigned($unsigned((wire104 >> wire108))))};
  assign wire110 = $unsigned($signed(wire99));
  assign wire111 = $unsigned($unsigned($signed({wire105[(4'hb):(3'h7)]})));
  assign wire112 = $unsigned($signed({($unsigned(wire104) ?
                           wire102[(3'h4):(2'h2)] : $unsigned(wire109))}));
  assign wire113 = $signed($signed(((~&$signed(wire100)) ?
                       wire108 : {$signed(wire109), (wire112 ^ wire110)})));
  assign wire114 = (^~(((~^{wire109, (8'hb7)}) >> $signed((wire99 ?
                       wire109 : wire112))) ~^ $signed(wire99)));
endmodule

module module49
#(parameter param91 = ({(^~(((8'hb0) ? (8'h9d) : (8'hae)) ? ((8'hab) >= (8'hb1)) : (~|(8'h9e))))} ? ((8'hae) ? ((((8'h9c) ? (8'haa) : (8'hbb)) - {(8'hb5)}) + ((&(8'hbe)) ? (^(8'hae)) : {(8'hb2), (8'hab)})) : (^{((8'hbe) << (8'hbd))})) : ({(((8'haf) ? (8'hba) : (8'ha5)) < (~^(8'h9c)))} ? (~&(((8'ha3) ? (7'h40) : (8'hb1)) ? ((8'ha3) ? (8'hb9) : (8'hb1)) : (-(8'ha7)))) : (~|(((8'ha4) ? (8'h9d) : (8'hbe)) ? ((8'hbd) ? (8'ha7) : (8'hb8)) : ((8'haa) & (8'hb3)))))), 
parameter param92 = ({{((&param91) == (+param91)), param91}, param91} ? param91 : param91))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(2'h2):(1'h0)] wire51;
  input wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire64,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 reg88,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg63,
                 reg62,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= $signed((($unsigned(wire52) ^~ $unsigned((wire53 ?
          wire52 : (8'hb6)))) ~^ $signed(wire52[(3'h6):(3'h5)])));
      reg55 <= ((((^~wire51[(2'h2):(1'h0)]) || ({(8'ha7)} ?
              $unsigned(reg54) : wire51)) ?
          $signed($signed($unsigned(wire50))) : wire51[(2'h2):(1'h1)]) <<< $unsigned(((8'hb1) > wire51)));
    end
  assign wire56 = (!($signed(wire52[(1'h1):(1'h1)]) ?
                      (8'haa) : $signed(({(8'h9c), reg55} ?
                          reg55[(2'h2):(1'h0)] : (!(8'ha5))))));
  always
    @(posedge clk) begin
      reg57 <= wire53;
      reg58 <= wire53;
    end
  assign wire59 = $signed(reg55);
  assign wire60 = (wire51[(1'h0):(1'h0)] >> $signed($unsigned((~&$unsigned(reg55)))));
  assign wire61 = $unsigned(($unsigned({wire51[(2'h2):(2'h2)]}) ?
                      (~wire56) : (reg55[(1'h0):(1'h0)] ?
                          $unsigned($unsigned(reg54)) : wire59)));
  always
    @(posedge clk) begin
      reg62 <= {wire52};
      reg63 <= reg58;
    end
  assign wire64 = reg57[(4'hd):(4'hd)];
  always
    @(posedge clk) begin
      if (reg55)
        begin
          if ((7'h43))
            begin
              reg65 <= $signed({{wire59[(1'h0):(1'h0)]},
                  $unsigned($signed((!reg57)))});
              reg66 <= (|reg54);
              reg67 <= reg66;
            end
          else
            begin
              reg65 <= $signed(reg65[(3'h4):(3'h4)]);
              reg66 <= $signed($signed(((reg54[(3'h4):(1'h0)] ?
                  wire51[(1'h1):(1'h1)] : (^wire50)) > ($signed(reg54) ?
                  reg67 : (reg63 >>> (8'ha6))))));
              reg67 <= (-(&wire61[(4'h9):(2'h3)]));
              reg68 <= $unsigned((wire60 ?
                  ((wire52[(3'h5):(3'h4)] ?
                          $signed(wire52) : ((8'ha7) >= wire59)) ?
                      wire52[(1'h1):(1'h0)] : $unsigned(wire60)) : ({wire60} > (reg54 ?
                      $unsigned(wire53) : (wire59 ? reg66 : wire61)))));
              reg69 <= $signed(($signed(reg55[(2'h3):(2'h3)]) < (~((wire60 && wire56) ^ wire59))));
            end
          reg70 <= $signed((wire61 ?
              ($unsigned((^(8'ha2))) ~^ reg68) : $unsigned((reg63[(1'h1):(1'h0)] << (+wire64)))));
          reg71 <= (($unsigned($unsigned(reg70[(2'h2):(1'h1)])) << (~^{reg67})) == reg67);
          reg72 <= (reg69 <= (($signed((7'h41)) ?
              wire64 : ($signed(wire50) ?
                  (reg58 ~^ reg67) : wire51)) >>> (~&((reg69 ?
                  (8'hbf) : wire60) ?
              $unsigned(wire64) : {wire60}))));
          reg73 <= ({(~&(~^{reg58}))} <<< wire52[(3'h5):(3'h5)]);
        end
      else
        begin
          if (($signed($signed($signed($unsigned(reg71)))) >> reg66))
            begin
              reg65 <= {($signed(reg55[(1'h1):(1'h0)]) ?
                      (wire50[(1'h0):(1'h0)] ^~ $signed($unsigned(reg68))) : $signed({$unsigned(reg54),
                          (!wire52)}))};
              reg66 <= (&wire60[(1'h0):(1'h0)]);
            end
          else
            begin
              reg65 <= ($unsigned((reg55[(2'h3):(1'h1)] <<< reg69[(5'h12):(4'h9)])) ?
                  (~^reg68[(2'h2):(2'h2)]) : ((~|{{reg68}}) ?
                      ({(reg68 & reg69)} ?
                          wire53 : {(wire60 || reg65)}) : {(+{reg68,
                              wire52})}));
              reg66 <= ((~^$unsigned($signed(reg67[(1'h0):(1'h0)]))) <<< $unsigned(((^~$unsigned((8'haa))) <<< ($unsigned(reg70) || (reg65 ?
                  reg58 : reg55)))));
              reg67 <= reg72;
              reg68 <= reg71;
              reg69 <= ($signed($signed((^~(7'h42)))) ?
                  ($unsigned(({reg58, wire61} ?
                      $unsigned(reg54) : $signed(wire50))) != ((wire61[(4'hf):(4'hd)] == reg57) ?
                      $unsigned($signed(wire59)) : (!wire51[(1'h1):(1'h0)]))) : ((reg73[(5'h14):(4'hb)] < (+(wire53 - (8'hac)))) ?
                      $unsigned(reg57[(4'he):(3'h4)]) : $unsigned($unsigned((reg68 ^ wire52)))));
            end
          reg70 <= reg65[(3'h5):(1'h0)];
          reg71 <= $unsigned(wire64);
          reg72 <= $signed($signed(reg54));
          if ({reg72[(1'h1):(1'h0)], wire64[(2'h2):(2'h2)]})
            begin
              reg73 <= {(8'h9c)};
            end
          else
            begin
              reg73 <= {$unsigned((7'h43))};
            end
        end
      reg74 <= {wire52[(3'h5):(2'h3)],
          $signed((((~^reg62) == (reg65 ? reg69 : reg57)) ?
              ($unsigned(reg62) >>> (wire59 ?
                  reg68 : reg63)) : (-(reg71 >> wire60))))};
      reg75 <= $signed({(7'h41), reg65[(3'h4):(2'h3)]});
      reg76 <= $unsigned(reg57);
      reg77 <= (&$signed(reg75[(4'ha):(3'h4)]));
    end
  assign wire78 = reg77;
  assign wire79 = ((reg74[(1'h1):(1'h1)] && (wire59 ?
                          reg69[(5'h14):(4'h9)] : ((reg57 >= reg66) ?
                              (reg75 ? reg57 : wire50) : (!reg54)))) ?
                      $signed($unsigned(((~&(8'hab)) < (8'hb8)))) : ($signed($signed($unsigned(reg57))) ?
                          $signed(reg70) : ((wire53[(2'h2):(1'h1)] ?
                              ((7'h40) >>> (8'haf)) : $unsigned(reg69)) <= ($signed(reg63) ?
                              (&(8'ha2)) : (7'h40)))));
  assign wire80 = (~(~{(reg73 ? wire51[(1'h1):(1'h1)] : (8'ha7))}));
  assign wire81 = (&((~&$unsigned($unsigned(wire53))) ?
                      $unsigned((+$unsigned(wire56))) : (~|($signed(reg75) ?
                          $unsigned(reg74) : $unsigned(wire52)))));
  assign wire82 = (!$signed((|(&(reg67 ? reg74 : (8'ha7))))));
  assign wire83 = reg57[(2'h2):(1'h1)];
  assign wire84 = reg58;
  assign wire85 = {(reg69 * reg71)};
  assign wire86 = reg70[(3'h4):(3'h4)];
  assign wire87 = $signed($signed(wire60));
  always
    @(posedge clk) begin
      reg88 <= ({{(+$signed(reg71))},
          wire86[(4'ha):(2'h3)]} >> ($signed(((wire87 ? reg55 : reg58) ?
          reg72[(4'h8):(3'h7)] : reg66[(1'h1):(1'h0)])) >= ((!$unsigned((8'ha9))) ?
          $signed(wire82) : wire85[(5'h10):(1'h1)])));
    end
  assign wire89 = (8'hbe);
  assign wire90 = ($signed((((wire86 && reg88) ?
                          (~&wire60) : (^~wire51)) >>> wire52[(3'h4):(2'h2)])) ?
                      (8'ha0) : $unsigned(($unsigned(reg66) & wire60)));
endmodule
