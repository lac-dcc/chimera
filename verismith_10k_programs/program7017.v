module top
#(parameter param119 = {(((~(8'hab)) ? (((8'haf) <<< (7'h40)) < ((8'hb1) <= (7'h41))) : {{(8'ha1)}}) ? ((((8'ha3) ^ (8'hb9)) >>> (~^(7'h40))) + {((8'ha4) == (8'ha5)), ((8'hbb) ? (8'ha7) : (8'ha7))}) : ((|((8'h9d) ? (8'hb9) : (8'hbe))) ? ((8'hb9) ? ((8'ha0) ? (8'ha9) : (8'h9c)) : (!(8'h9d))) : (^((8'hb6) < (8'hb3)))))}, 
parameter param120 = ((8'h9e) ^ (^~(((~|param119) ? (param119 ? param119 : param119) : (|param119)) || {(param119 ? param119 : param119), {param119, param119}}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire75;
  assign y = {wire118,
                 wire117,
                 wire115,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire75,
                 (1'h0)};
  assign wire4 = (~&(8'hb0));
  assign wire5 = (+{{(((8'h9c) ? wire2 : wire4) ? (~wire4) : {wire3})}});
  assign wire6 = (+(8'hbb));
  assign wire7 = (+wire5);
  module8 #() modinst76 (wire75, clk, wire5, wire0, wire3, wire4, wire2);
  module77 #() modinst116 (.wire81(wire75), .wire80(wire5), .wire79(wire1), .clk(clk), .y(wire115), .wire78(wire4));
  assign wire117 = wire5[(4'ha):(3'h6)];
  assign wire118 = ((wire75 ? (8'hba) : wire2[(2'h2):(1'h0)]) ?
                       ($unsigned(wire115[(3'h7):(3'h5)]) < (wire75 ~^ $signed($unsigned(wire2)))) : (wire115 >> $unsigned($signed({wire75}))));
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire signed [(3'h7):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire106;
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire106,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  module82 #() modinst107 (wire106, clk, wire79, wire80, wire81, wire78);
  assign wire108 = $signed($unsigned(((wire81 * (wire79 ~^ wire81)) >>> $unsigned((^~wire106)))));
  assign wire109 = (~&wire79[(3'h4):(3'h4)]);
  assign wire110 = wire79;
  always
    @(posedge clk) begin
      reg111 <= (wire108[(1'h0):(1'h0)] << {($signed($signed(wire109)) >>> ((wire79 ?
              wire106 : wire79) == ((8'hb3) ? wire108 : (8'hb4))))});
      reg112 <= wire80[(4'hb):(3'h5)];
      reg113 <= $signed((((+wire81[(4'h8):(1'h1)]) ? (7'h41) : wire106) ?
          $signed(($unsigned(wire109) <= (&wire108))) : wire79[(3'h4):(2'h2)]));
      reg114 <= (-wire109);
    end
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire72;
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  assign y = {wire74,
                 wire14,
                 wire15,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire26,
                 wire27,
                 wire28,
                 wire72,
                 reg25,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = $signed(((&($unsigned(wire11) ?
                      ((8'ha2) != (8'hb0)) : wire9)) <= (~&(+$unsigned(wire11)))));
  assign wire15 = ((-(((wire11 > wire12) + (wire14 << (8'haf))) & (^$signed(wire13)))) <= wire13[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg16 <= $signed(($unsigned($signed((wire10 ? wire9 : wire15))) ?
          (^$signed(wire12[(2'h3):(2'h3)])) : {(~&$unsigned((8'hb9)))}));
      reg17 <= $unsigned((-$signed((~&(^wire9)))));
      reg18 <= wire9;
    end
  assign wire19 = wire15[(3'h5):(3'h4)];
  assign wire20 = $unsigned(wire9[(2'h2):(2'h2)]);
  assign wire21 = (8'ha9);
  assign wire22 = (wire19[(2'h3):(2'h2)] >= (~|$signed(((wire10 != wire9) && $signed(wire21)))));
  assign wire23 = reg17[(3'h5):(1'h1)];
  assign wire24 = ($signed((8'had)) || ((~(~|wire10[(3'h7):(3'h4)])) >= $unsigned((wire15[(2'h3):(1'h1)] >> (^~wire22)))));
  always
    @(posedge clk) begin
      reg25 <= ((~{reg18,
          ((wire24 == wire23) ?
              {wire12} : $signed(reg16))}) < ($unsigned((reg17 ?
          (wire22 ? wire14 : wire12) : (wire22 ? reg17 : reg18))) && wire12));
    end
  assign wire26 = {wire9};
  assign wire27 = wire21;
  assign wire28 = (({wire11[(1'h1):(1'h0)],
                      ((+reg18) ?
                          wire23 : wire22)} || wire22[(4'h8):(1'h0)]) && wire21);
  module29 #() modinst73 (.wire33(reg18), .wire32(reg16), .wire34(wire10), .clk(clk), .y(wire72), .wire30(wire27), .wire31(wire22));
  assign wire74 = {reg16[(4'ha):(3'h5)], (wire13[(3'h5):(2'h2)] != wire14)};
endmodule

module module29
#(parameter param70 = (|{{(-((8'ha9) ? (8'h9c) : (8'h9d))), (+((8'h9f) <= (7'h44)))}, ((((8'hb5) ? (8'ha3) : (8'had)) ? ((8'ha7) ? (8'h9f) : (8'h9f)) : (8'hbe)) ? (!((7'h43) >= (8'ha8))) : (^~{(8'haf), (8'h9f)}))}), 
parameter param71 = ({(((param70 ? param70 : param70) ? param70 : (param70 >>> param70)) ? ((param70 < param70) ? ((8'ha1) > param70) : {param70, param70}) : param70)} ? ((param70 ? param70 : {param70}) << (((8'hbb) > (param70 || param70)) ? (param70 || (-param70)) : (param70 ? (param70 ? param70 : param70) : ((8'hbb) & param70)))) : (&(+param70))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire49,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire35 = {wire30};
  assign wire36 = (({($signed(wire33) ?
                                  (wire31 ?
                                      wire32 : wire32) : (wire31 & wire31))} ?
                          (8'ha7) : wire31) ?
                      wire31 : wire30[(2'h2):(2'h2)]);
  assign wire37 = (~|(8'hbb));
  assign wire38 = wire34[(4'h9):(2'h3)];
  assign wire39 = wire33[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg40 <= $unsigned((8'ha9));
      reg41 <= (({$unsigned((reg40 ?
              wire33 : wire31))} * wire36[(2'h3):(1'h0)]) < wire36);
      if ($signed({$signed(wire37[(1'h1):(1'h1)])}))
        begin
          reg42 <= wire34[(3'h5):(2'h2)];
          reg43 <= reg41;
          reg44 <= wire30;
        end
      else
        begin
          if ((~^(^~{reg41})))
            begin
              reg42 <= $signed($signed((wire38 ?
                  (8'ha7) : ((8'h9d) <<< $signed((8'hbf))))));
              reg43 <= $unsigned({(($unsigned(wire30) ?
                      (reg43 ? wire35 : wire35) : $signed(reg42)) >= ((reg43 ?
                          wire39 : wire31) ?
                      wire38 : wire32[(4'h8):(2'h2)]))});
              reg44 <= wire35;
              reg45 <= (^~wire35);
            end
          else
            begin
              reg42 <= wire34;
              reg43 <= (~|wire33[(3'h6):(2'h3)]);
            end
          reg46 <= (|{{(~&(wire37 ? wire33 : reg40)), (&wire32)}});
          reg47 <= {{wire30}, (^~(wire37 > reg46[(4'h9):(3'h4)]))};
          reg48 <= ($signed(wire38[(1'h0):(1'h0)]) ?
              ($unsigned($signed(reg44[(4'h8):(2'h3)])) > wire30[(3'h4):(1'h0)]) : wire33[(2'h3):(2'h2)]);
        end
    end
  assign wire49 = wire37;
  always
    @(posedge clk) begin
      if ((~&wire36))
        begin
          reg50 <= {$unsigned($signed(((-reg41) ?
                  $signed(wire36) : {wire39, reg41})))};
          if ({{wire34, $unsigned((^~(wire38 ~^ reg50)))}, reg40})
            begin
              reg51 <= (($unsigned((~|(~^wire30))) ?
                      (reg48 == reg43[(3'h6):(1'h0)]) : $unsigned(reg48)) ?
                  {$signed({(reg47 >> (8'h9c)), (reg42 > (8'hb7))}),
                      $unsigned(wire35)} : $unsigned((8'hab)));
              reg52 <= ($signed(wire30[(1'h1):(1'h1)]) ?
                  ($unsigned((~(8'ha5))) >= reg51[(2'h2):(2'h2)]) : ($signed((|reg48[(2'h3):(1'h1)])) * $unsigned((|((8'hb4) ?
                      (8'hbb) : wire32)))));
              reg53 <= ($unsigned($unsigned(reg45[(4'hc):(3'h7)])) && ($signed($signed($signed(wire31))) ?
                  reg42 : (reg42[(4'h9):(3'h4)] >> {$unsigned(reg46)})));
            end
          else
            begin
              reg51 <= (((wire34 ? wire34 : wire30) > reg52[(2'h3):(2'h2)]) ?
                  wire31 : reg45);
              reg52 <= $unsigned($unsigned(((wire32 ?
                  wire36[(4'ha):(3'h5)] : reg42) << $signed((wire39 ?
                  reg44 : wire49)))));
              reg53 <= (-reg46);
              reg54 <= ((!reg42[(4'h9):(3'h6)]) > wire37[(3'h7):(2'h3)]);
            end
          reg55 <= ((8'ha6) ^ (~reg42));
          reg56 <= reg41;
          if (((wire49 >>> (((reg54 ? reg44 : wire35) ?
              (reg47 ?
                  wire36 : wire37) : reg46[(1'h1):(1'h1)]) ^~ (wire49[(4'h8):(3'h5)] ?
              $unsigned(wire49) : reg51[(2'h3):(1'h1)]))) != ($signed((^{wire34,
              reg45})) && reg52)))
            begin
              reg57 <= $unsigned(reg47[(2'h2):(2'h2)]);
              reg58 <= wire49[(2'h3):(1'h0)];
              reg59 <= (~$unsigned((wire36[(4'h9):(3'h4)] >= ((~(8'haa)) != $signed(wire39)))));
              reg60 <= reg43[(4'ha):(4'h8)];
              reg61 <= ((~$signed(reg52)) ?
                  (^~$unsigned((wire34[(1'h1):(1'h1)] ?
                      (wire31 | wire31) : (~&reg42)))) : (^~$signed(wire36)));
            end
          else
            begin
              reg57 <= (8'had);
              reg58 <= reg50;
              reg59 <= $signed($signed(reg57));
            end
        end
      else
        begin
          if ((($signed({(reg60 ? wire38 : reg58)}) ?
              (reg40[(4'h9):(3'h5)] ^~ ((wire38 ? reg51 : (8'h9e)) ?
                  $signed((8'ha4)) : {wire32, wire34})) : {reg46,
                  (~^((7'h43) | reg43))}) != (^~((~^(wire38 - wire30)) <<< reg47[(2'h2):(1'h1)]))))
            begin
              reg50 <= $signed((reg59 ?
                  wire38[(2'h2):(2'h2)] : {(wire34 >= $signed(wire34)),
                      reg42[(4'ha):(4'h9)]}));
              reg51 <= wire30[(3'h4):(2'h2)];
              reg52 <= $unsigned($unsigned($unsigned({(wire36 || wire33)})));
              reg53 <= (8'had);
              reg54 <= (8'hae);
            end
          else
            begin
              reg50 <= (reg42[(3'h4):(1'h0)] ?
                  $unsigned($unsigned($signed(wire31[(2'h3):(2'h3)]))) : (~(((reg51 + reg40) >= (~&wire39)) ^~ $signed($unsigned(wire38)))));
              reg51 <= $unsigned((^~reg50));
              reg52 <= (|reg50);
              reg53 <= {($signed(wire32) > $signed($signed({wire36}))),
                  $unsigned((~^reg54[(1'h0):(1'h0)]))};
              reg54 <= $unsigned(({$unsigned($signed(wire36)),
                      ((wire35 ? reg55 : wire36) << ((7'h40) < reg50))} ?
                  {$signed({reg41, reg43}),
                      wire36} : $signed(wire37[(3'h4):(3'h4)])));
            end
          reg55 <= $signed(reg40[(3'h5):(1'h0)]);
        end
    end
  assign wire62 = ({($signed((~^reg59)) - ((reg43 >> reg42) <= (reg42 ?
                              wire37 : reg54)))} ?
                      (reg59[(3'h6):(2'h2)] ?
                          $unsigned((~&(reg42 >>> (8'ha2)))) : wire37[(2'h3):(2'h2)]) : wire31[(3'h4):(2'h2)]);
  assign wire63 = (reg46 ?
                      $signed($unsigned(wire32)) : (~|$signed($unsigned(reg50))));
  assign wire64 = reg58[(4'hd):(3'h4)];
  assign wire65 = wire33;
  assign wire66 = (~((wire64 < (~&(-(7'h42)))) ?
                      $unsigned($signed(reg60)) : ($signed($signed(reg46)) ?
                          (reg44[(3'h7):(3'h4)] ?
                              reg50 : (wire65 >>> wire38)) : ((wire39 ^ wire65) ?
                              $signed((8'hb9)) : (wire30 ^~ wire62)))));
  assign wire67 = $unsigned((^~$unsigned($unsigned((wire64 > reg40)))));
  assign wire68 = (($unsigned(reg47) | $signed(wire65[(4'he):(3'h6)])) ?
                      $signed(({$unsigned(wire39)} << (-reg59[(3'h5):(2'h3)]))) : (~^(7'h41)));
  assign wire69 = ($signed(((~&$signed((8'hac))) ?
                      (~|$signed(reg40)) : wire37)) < reg56[(2'h3):(2'h2)]);
endmodule

module module82
#(parameter param104 = (&(7'h43)), 
parameter param105 = {(^(+(param104 < (param104 << param104)))), (!(^~((~^param104) != (param104 ~^ param104))))})
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire86;
  input wire [(4'h9):(1'h0)] wire85;
  input wire [(3'h5):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire87 = wire86;
  assign wire88 = ($unsigned($signed((+$signed(wire84)))) ?
                      wire85[(1'h1):(1'h1)] : ((wire85 ?
                          (&$signed(wire84)) : wire85[(1'h0):(1'h0)]) != {wire86[(2'h2):(1'h1)]}));
  assign wire89 = wire85;
  assign wire90 = (($unsigned((-$unsigned(wire85))) ?
                          ((wire89 > {(8'hac)}) < (^~{wire86})) : (-$signed((wire88 ?
                              wire83 : wire87)))) ?
                      wire87[(2'h2):(1'h1)] : wire83);
  assign wire91 = wire87[(2'h2):(1'h1)];
  assign wire92 = wire90[(1'h0):(1'h0)];
  assign wire93 = ((&$signed(wire84)) ?
                      (~^(~&wire90)) : ((((wire90 ? wire89 : wire84) ^ (wire89 ?
                                  wire89 : wire86)) ?
                              (-wire85) : ($signed(wire83) ?
                                  $unsigned((8'hba)) : {wire92, wire89})) ?
                          {$unsigned((wire86 ? wire89 : wire86)),
                              wire83} : (|($signed(wire85) ?
                              wire91 : $signed(wire86)))));
  assign wire94 = wire93[(4'he):(3'h5)];
  assign wire95 = $signed((~(~wire85)));
  always
    @(posedge clk) begin
      reg96 <= $unsigned($signed(wire95[(1'h0):(1'h0)]));
      reg97 <= ((~&($unsigned($signed(wire88)) ?
              wire95 : $unsigned($signed(wire89)))) ?
          wire90 : (+wire83[(2'h3):(2'h3)]));
      reg98 <= ({($unsigned((8'hb9)) ?
              ((wire92 ? wire87 : wire93) >>> $signed(wire85)) : (wire87 ?
                  (wire90 ? (8'hb2) : reg97) : (^(8'hbe)))),
          (({wire87, wire87} << reg96[(1'h1):(1'h1)]) ?
              wire92 : $unsigned((&wire89)))} < $unsigned((((wire88 || (8'hb7)) >> (reg96 ?
              reg96 : wire87)) ?
          ($unsigned(wire85) ?
              ((8'haf) ~^ (8'hb5)) : wire90) : wire85[(3'h4):(1'h1)])));
      reg99 <= $unsigned($signed((-(wire90[(1'h1):(1'h1)] ?
          {(8'ha9), wire94} : (wire84 >> wire88)))));
    end
  assign wire100 = $unsigned($unsigned($signed((reg98[(2'h2):(1'h1)] ?
                       wire85 : reg98))));
  assign wire101 = (((&wire84[(3'h5):(1'h1)]) << $unsigned(wire86[(3'h5):(1'h1)])) ?
                       {(!($signed(wire93) ?
                               (wire85 && reg96) : {wire100, wire89})),
                           ($unsigned($unsigned(wire100)) + wire91[(4'hc):(4'h8)])} : $signed(($signed((wire95 ~^ (8'hb1))) * $signed(wire94[(4'ha):(4'h8)]))));
  assign wire102 = $unsigned({wire92[(1'h0):(1'h0)], {wire86}});
  assign wire103 = reg99[(1'h1):(1'h1)];
endmodule
