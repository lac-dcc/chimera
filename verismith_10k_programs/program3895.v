module top
#(parameter param129 = (~^((+(((8'h9c) + (7'h44)) ^ (-(7'h44)))) ? ((((8'hb8) ? (8'hbb) : (8'haa)) ^~ {(7'h41), (8'hae)}) - ({(7'h44)} > (~(8'hb8)))) : (!((8'h9d) ? ((8'ha3) ^~ (8'h9f)) : (+(8'hb7)))))), 
parameter param130 = (^(-{(param129 >> (^param129))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire126;
  assign y = {wire128,
                 wire4,
                 wire5,
                 wire6,
                 wire21,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire126,
                 (1'h0)};
  assign wire4 = ($unsigned((-$unsigned((+wire1)))) & (wire1 <= ($signed(wire3[(2'h2):(1'h1)]) ?
                     wire3 : (wire1[(4'hc):(4'hb)] | wire0))));
  assign wire5 = ($unsigned(((|wire0) <= ($signed(wire3) + (-wire4)))) ?
                     $unsigned((wire3[(4'ha):(3'h6)] <<< $unsigned($signed((8'hb4))))) : (-wire0));
  assign wire6 = wire4;
  module7 #() modinst22 (.wire11(wire4), .wire9(wire3), .wire10(wire0), .wire8(wire6), .clk(clk), .y(wire21));
  assign wire23 = (wire6[(2'h3):(1'h1)] == wire6);
  assign wire24 = $unsigned((wire3[(3'h4):(2'h3)] >> (-(|(wire5 ?
                      wire0 : (8'hb8))))));
  assign wire25 = ((((wire23 > (wire4 | wire23)) ?
                              $unsigned($unsigned(wire21)) : wire2[(2'h3):(1'h0)]) ?
                          (&(-$unsigned((8'ha1)))) : $signed(($signed(wire0) ?
                              ((8'hb9) ? wire0 : wire24) : (^(8'hb6))))) ?
                      wire4[(2'h3):(1'h1)] : (($signed($signed(wire1)) >>> wire24) ?
                          wire21 : wire0));
  assign wire26 = ($unsigned(($signed(wire23) ?
                          ((wire3 ? wire5 : wire5) ?
                              (wire24 | wire2) : (wire0 & wire23)) : (!wire24[(1'h0):(1'h0)]))) ?
                      (|wire5) : (~^((wire23 ? $signed(wire21) : (^wire6)) ?
                          $unsigned(wire5[(3'h7):(3'h5)]) : (^wire3[(4'hb):(4'h8)]))));
  assign wire27 = wire25[(2'h3):(2'h2)];
  assign wire28 = $unsigned(wire21);
  assign wire29 = wire4[(4'hd):(4'hb)];
  assign wire30 = wire4[(3'h4):(2'h2)];
  assign wire31 = $unsigned((|(~|$signed($unsigned(wire6)))));
  assign wire32 = wire28[(3'h5):(3'h4)];
  assign wire33 = wire21[(4'he):(4'ha)];
  assign wire34 = ((~|$signed(wire24[(1'h1):(1'h0)])) ?
                      $signed((&{wire33})) : {$unsigned((^~wire0)),
                          ({((8'hbc) ^~ wire25), (wire21 ^~ wire1)} ?
                              wire28[(3'h6):(2'h2)] : {{wire28}})});
  assign wire35 = $signed($signed(($unsigned(wire4) | ((wire29 ?
                          wire27 : wire34) ?
                      $unsigned(wire30) : $signed(wire26)))));
  module36 #() modinst127 (.y(wire126), .wire40(wire1), .wire39(wire34), .wire38(wire28), .clk(clk), .wire41(wire5), .wire37(wire33));
  assign wire128 = wire33[(4'hd):(4'hd)];
endmodule

module module36  (y, clk, wire37, wire38, wire39, wire40, wire41);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire37;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire39;
  input wire [(4'h9):(1'h0)] wire40;
  input wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire123;
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  assign y = {wire125,
                 wire58,
                 wire60,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire123,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  module42 #() modinst59 (wire58, clk, wire40, wire39, wire38, wire37);
  assign wire60 = ({(wire39[(1'h1):(1'h1)] <= ((~|wire37) ?
                          (wire37 && wire38) : (wire39 - wire37)))} >= ($unsigned($unsigned((wire41 != wire38))) ?
                      $signed($signed(wire41[(2'h2):(2'h2)])) : ($unsigned((wire40 == wire40)) ?
                          ({wire41} ?
                              (wire37 != wire58) : {wire58}) : ($unsigned(wire58) + $signed(wire39)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed($unsigned(wire40[(2'h3):(2'h3)])))))
        begin
          reg61 <= (wire41[(4'he):(4'h8)] ^~ wire58[(1'h0):(1'h0)]);
          reg62 <= wire37;
          reg63 <= $signed({wire39,
              (reg62 ?
                  (reg61 || wire39[(3'h7):(3'h6)]) : (~^reg61[(3'h7):(1'h1)]))});
        end
      else
        begin
          reg61 <= $signed(wire41[(4'ha):(4'h8)]);
          reg62 <= wire39;
          if (wire60[(4'ha):(3'h5)])
            begin
              reg63 <= (wire39 + reg62[(3'h6):(3'h6)]);
              reg64 <= $unsigned((reg62 ^ {(~&$signed(reg62))}));
              reg65 <= $unsigned((!(($signed(reg61) - reg64[(1'h0):(1'h0)]) ?
                  $signed((^wire60)) : (wire40[(1'h1):(1'h1)] ?
                      $signed((8'hb7)) : (wire40 + wire41)))));
              reg66 <= (~^$unsigned(wire40[(2'h2):(1'h1)]));
            end
          else
            begin
              reg63 <= ($signed((~|($unsigned(reg65) >> (reg63 ?
                      wire60 : reg64)))) ?
                  $signed($unsigned((7'h40))) : {$signed(reg64[(1'h1):(1'h1)])});
              reg64 <= wire38[(3'h6):(1'h1)];
              reg65 <= wire41[(5'h12):(3'h6)];
              reg66 <= ($signed((((~&wire58) ?
                  (wire58 ^ wire41) : wire40) >= $unsigned(((7'h44) && wire37)))) >> reg63[(1'h0):(1'h0)]);
              reg67 <= {(-$unsigned((8'hb7))),
                  $unsigned((~(&(reg64 ? wire40 : wire37))))};
            end
          if (reg63)
            begin
              reg68 <= ($unsigned((~&(~^reg63[(2'h2):(1'h1)]))) ?
                  wire37 : (reg64[(1'h0):(1'h0)] > (~|(^(|wire40)))));
              reg69 <= $signed(wire40[(2'h2):(2'h2)]);
              reg70 <= ({{reg61[(4'hd):(2'h2)]}} >>> (wire40 ?
                  (reg62 ?
                      $unsigned((reg66 ?
                          wire38 : reg66)) : reg64[(2'h2):(1'h0)]) : (wire60 ?
                      {$unsigned(reg65), (reg64 <<< (8'ha4))} : wire58)));
              reg71 <= ((~|wire38[(3'h7):(3'h7)]) < {(~|{(wire60 ?
                          reg68 : wire37),
                      reg70})});
            end
          else
            begin
              reg68 <= ((((wire38[(1'h0):(1'h0)] ?
                      $unsigned(wire39) : $signed(reg70)) * reg68[(1'h1):(1'h0)]) == $unsigned($unsigned({reg66,
                      (8'hbb)}))) ?
                  reg66[(4'hc):(4'h9)] : $signed($unsigned($signed($signed(reg62)))));
              reg69 <= $signed($signed((&(~reg65))));
              reg70 <= $signed((^~$signed((^~(reg66 ? reg70 : reg63)))));
              reg71 <= ({(reg68 ?
                          (~|(reg62 ?
                              wire58 : wire41)) : wire40[(3'h7):(2'h2)]),
                      $signed(($unsigned((8'hb3)) >= reg65))} ?
                  $unsigned(({$unsigned(wire38),
                      $unsigned((8'h9d))} || ($unsigned((8'hab)) ?
                      $signed(reg62) : (wire39 ?
                          reg61 : reg61)))) : (^{$unsigned({wire38, wire60}),
                      reg61[(2'h3):(2'h3)]}));
            end
          if ((^reg62[(3'h7):(3'h5)]))
            begin
              reg72 <= $signed($unsigned((!{(wire58 ^ reg70)})));
              reg73 <= (($unsigned(({wire41,
                      wire39} << reg70[(3'h4):(3'h4)])) << wire60) ?
                  $signed($signed(((^reg68) ?
                      wire58[(1'h0):(1'h0)] : (reg68 ?
                          reg61 : wire37)))) : wire37[(3'h4):(1'h1)]);
              reg74 <= $unsigned(reg70[(2'h3):(1'h0)]);
            end
          else
            begin
              reg72 <= {wire37[(4'hb):(4'h8)]};
            end
        end
      reg75 <= $signed($unsigned(reg72));
      reg76 <= $unsigned(wire58[(2'h3):(2'h2)]);
    end
  assign wire77 = (~|reg65);
  assign wire78 = reg67[(2'h3):(1'h1)];
  assign wire79 = reg74[(4'hb):(4'h9)];
  assign wire80 = wire60[(4'hc):(4'ha)];
  assign wire81 = $signed(wire79[(1'h0):(1'h0)]);
  module82 #() modinst124 (.wire84(reg63), .wire85(wire58), .wire86(reg67), .clk(clk), .wire83(reg76), .y(wire123));
  assign wire125 = reg73;
endmodule

module module7
#(parameter param20 = {((-(((8'hb5) ? (8'haa) : (8'ha7)) ~^ ((8'h9d) >= (8'ha1)))) || (((~|(8'h9f)) ? (|(8'ha7)) : ((8'ha1) ? (8'ha6) : (8'hbd))) >> (((8'had) ? (8'haf) : (8'ha2)) << (-(7'h44))))), (({((8'hb6) + (8'hb0)), (!(7'h41))} ? (^~((8'haa) && (8'hbb))) : ((~&(8'hbc)) <= (&(8'hb6)))) ? ((((8'ha0) >> (8'ha2)) | ((7'h42) > (8'hba))) == (((8'hb2) ? (8'hb1) : (8'haf)) ? {(8'ha3)} : ((8'h9d) ? (7'h43) : (8'hb0)))) : (({(8'hb2), (8'hae)} ^~ ((8'h9d) ? (8'hac) : (8'hac))) ? (((8'ha9) ? (8'h9d) : (8'ha0)) < {(8'h9e)}) : ((8'hb9) == ((8'hbb) + (8'hae)))))})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= $signed(($unsigned(wire10) ?
          wire9 : ($unsigned($unsigned(wire8)) ?
              $signed((wire9 && wire11)) : (~^$unsigned(wire10)))));
      reg13 <= {wire9};
      if (wire10)
        begin
          reg14 <= (&($signed(wire9) | reg13[(3'h5):(1'h0)]));
          reg15 <= (-(&wire10[(4'h9):(2'h3)]));
        end
      else
        begin
          reg14 <= wire10;
          reg15 <= (8'haf);
        end
      reg16 <= $signed((|$unsigned(wire9[(3'h4):(2'h3)])));
    end
  assign wire17 = ((8'haa) <<< reg14[(4'h8):(4'h8)]);
  assign wire18 = ((&$unsigned($signed(reg16))) && $signed((!((wire11 ?
                      reg15 : wire17) >> reg13[(4'hc):(2'h3)]))));
  assign wire19 = ($signed((wire18 <= (&(reg16 & reg14)))) ?
                      ({$signed({reg13, reg16})} ^~ (~^{(wire9 > reg14),
                          (wire17 ^~ reg13)})) : $signed($signed($signed((wire11 ?
                          reg15 : reg14)))));
endmodule

module module82
#(parameter param121 = ((8'ha9) ? {(7'h41)} : (&((((8'hab) ? (8'hb8) : (8'hb8)) >= {(8'hb7), (8'h9d)}) || (((8'hb5) ? (8'had) : (8'ha4)) ? ((7'h40) << (8'haa)) : ((8'hb4) | (8'h9d)))))), 
parameter param122 = ((~|(&{param121, (8'ha1)})) || ({((param121 ? param121 : param121) ? param121 : (param121 ? param121 : param121)), (^~param121)} * ((((8'ha4) ? param121 : param121) | ((8'hb1) ? param121 : param121)) ? (~&(8'ha3)) : (8'h9f)))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire86;
  input wire signed [(4'ha):(1'h0)] wire85;
  input wire signed [(4'ha):(1'h0)] wire84;
  input wire [(3'h6):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire87 = (((&{(wire85 == wire83), {wire86}}) ?
                          {$unsigned(wire85[(1'h0):(1'h0)])} : (wire85[(4'h9):(4'h9)] == ((wire86 & wire85) << {wire85,
                              wire84}))) ?
                      {wire84, (^(8'ha9))} : (wire85[(4'h8):(3'h7)] ?
                          (!$unsigned(wire86[(3'h4):(1'h0)])) : {(^$unsigned((8'hb2))),
                              $unsigned((^~wire84))}));
  assign wire88 = (|($signed($unsigned($unsigned((8'hbd)))) ?
                      (wire83 ?
                          {(wire84 ? wire84 : wire87),
                              $signed(wire86)} : wire86[(3'h6):(2'h2)]) : {wire87[(3'h4):(3'h4)]}));
  assign wire89 = $signed(((wire87[(4'h9):(3'h7)] ?
                          (wire84 ?
                              $signed((8'ha4)) : $signed(wire87)) : (wire85[(3'h4):(3'h4)] || (^~wire86))) ?
                      (($signed((8'hb1)) ^ wire88) ?
                          wire86 : $unsigned((wire84 ?
                              wire84 : wire85))) : ({$signed(wire88)} + $unsigned({wire85}))));
  assign wire90 = (wire87[(4'ha):(3'h5)] ?
                      $unsigned((~^$signed({wire83}))) : (&wire83));
  assign wire91 = {{($signed((~^(8'hbf))) ?
                              wire84 : ($unsigned(wire85) | (wire88 ?
                                  wire84 : wire84))),
                          ((((8'ha4) ? wire83 : wire89) && (wire86 ?
                                  wire88 : wire88)) ?
                              wire84 : $unsigned($signed(wire88)))}};
  always
    @(posedge clk) begin
      reg92 <= (wire85[(3'h7):(2'h3)] >= (&($signed(wire84) ?
          $unsigned(((8'haa) <<< wire90)) : ((!wire83) | (wire88 << wire84)))));
      reg93 <= (&wire91[(4'ha):(1'h1)]);
      reg94 <= $unsigned((wire86 ?
          $signed(((wire88 ? wire83 : wire86) ?
              wire86[(1'h0):(1'h0)] : (wire88 != wire90))) : (~|$unsigned(wire83[(2'h3):(1'h1)]))));
      reg95 <= (($signed({(+wire86)}) ?
          {((!wire86) >> (!wire90))} : (~^$signed(wire86[(3'h4):(1'h1)]))) < (((+(wire88 ~^ reg92)) > (((8'hb9) * (8'hb2)) ?
          (|wire85) : ((8'ha4) | (7'h40)))) & ($signed((wire85 & wire85)) ?
          $signed(reg94[(3'h4):(1'h1)]) : ((wire89 ? reg92 : wire88) ?
              $signed((8'h9c)) : wire91))));
      if ((($signed(reg95[(4'h9):(3'h7)]) ?
          ($signed(wire91[(1'h0):(1'h0)]) <= (|(wire89 ?
              wire85 : wire87))) : ((reg94[(2'h2):(2'h2)] == $signed(reg94)) ?
              ($unsigned((8'hb8)) ?
                  wire88[(4'h8):(3'h5)] : {wire84, wire85}) : $unsigned({wire90,
                  reg95}))) && $unsigned($signed(wire87[(4'ha):(4'h8)]))))
        begin
          reg96 <= (((^$signed({reg93})) <= ({$unsigned(wire91)} ~^ wire87[(3'h6):(3'h5)])) + (+{((wire84 ?
                      (8'ha7) : wire89) ?
                  reg95 : $signed(wire90))}));
          if ({(~^(~&({wire86} ? (-wire85) : (wire91 ? wire85 : wire91))))})
            begin
              reg97 <= ($unsigned($signed((wire89[(5'h12):(3'h7)] && $signed(wire90)))) ~^ $unsigned(wire85));
              reg98 <= $signed((8'hb0));
              reg99 <= $signed(({$signed(wire88[(1'h1):(1'h0)]),
                      ($signed(reg92) ? wire90[(1'h0):(1'h0)] : (&(8'ha9)))} ?
                  ($unsigned($signed(wire87)) ?
                      (~&(8'hac)) : wire86) : ((^~(reg96 >> wire91)) ?
                      reg96 : $signed(wire83[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg97 <= (reg97 + $signed($signed($signed($unsigned(wire89)))));
              reg98 <= $signed(($unsigned(((wire88 ? wire85 : reg94) ?
                  wire90[(3'h6):(1'h1)] : (8'ha0))) << $unsigned(wire91)));
              reg99 <= (reg92[(2'h3):(2'h2)] >>> (|$signed(reg93)));
            end
          reg100 <= wire88[(3'h7):(1'h0)];
          reg101 <= $unsigned({(reg100 ?
                  {(+reg96), reg92[(2'h2):(1'h1)]} : (~&{reg99, wire84}))});
          if (reg92[(3'h7):(2'h3)])
            begin
              reg102 <= (~&$signed(($signed((reg101 ? wire86 : reg101)) ?
                  (8'h9e) : wire84[(1'h1):(1'h0)])));
              reg103 <= (!(+$unsigned({(reg98 ? reg100 : wire91),
                  (wire87 ^~ reg96)})));
              reg104 <= reg97;
              reg105 <= wire87;
            end
          else
            begin
              reg102 <= $unsigned((8'ha7));
              reg103 <= $unsigned((~&reg98));
              reg104 <= (($unsigned($unsigned($unsigned(wire86))) << (reg95[(1'h1):(1'h0)] ?
                  $signed((reg95 << reg102)) : ((~&wire86) ?
                      (&wire84) : {reg99}))) + ((^((~&wire84) << reg100)) + wire84[(3'h4):(3'h4)]));
            end
        end
      else
        begin
          if ($signed((reg101 ?
              (~$signed(reg105[(2'h3):(1'h1)])) : (wire91 ^~ $unsigned(wire88)))))
            begin
              reg96 <= reg103[(3'h5):(3'h5)];
              reg97 <= $signed((-((reg103 ? $unsigned(reg98) : reg101) ?
                  reg99[(4'h8):(3'h4)] : ($signed(reg105) >= {reg96,
                      wire91}))));
              reg98 <= reg103;
              reg99 <= reg96[(3'h5):(2'h3)];
            end
          else
            begin
              reg96 <= wire91[(4'hd):(2'h3)];
            end
          reg100 <= reg96[(2'h2):(1'h0)];
        end
    end
  assign wire106 = $signed((reg101 || wire88[(3'h4):(2'h2)]));
  assign wire107 = (8'had);
  assign wire108 = ((reg96[(1'h1):(1'h1)] >> wire90[(3'h6):(3'h4)]) > ((($signed(reg99) >> $unsigned(reg102)) ?
                           (wire89[(5'h12):(3'h6)] ?
                               reg103[(2'h3):(1'h1)] : (!(8'ha7))) : $signed(reg97)) ?
                       reg104 : (($signed(reg98) ?
                               (~&wire91) : (reg92 ? wire87 : wire84)) ?
                           ({(8'ha9),
                               reg101} != wire84) : wire83[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg109 <= (((((wire88 ? (8'hbf) : (8'hb2)) <= $unsigned((7'h42))) ?
              ($signed(wire108) ?
                  (wire90 ?
                      reg104 : reg100) : reg97) : $unsigned((~|(8'h9c)))) ?
          ((wire89[(4'hf):(4'h9)] || $signed(reg93)) | $signed((reg97 <<< reg101))) : (8'ha5)) == $signed($unsigned(reg92[(2'h2):(1'h1)])));
      reg110 <= reg101[(5'h12):(4'ha)];
      if ((wire106 & {$unsigned($unsigned(reg109[(1'h1):(1'h1)]))}))
        begin
          reg111 <= wire107[(2'h3):(1'h0)];
          if ({reg93, $signed($signed((~(&wire86))))})
            begin
              reg112 <= $signed(wire87);
            end
          else
            begin
              reg112 <= ($unsigned(($unsigned((reg97 ? wire84 : reg96)) ?
                  ($signed(reg109) >= $unsigned(wire106)) : (7'h42))) >> reg102);
            end
        end
      else
        begin
          reg111 <= $unsigned(wire89);
          if ((reg103[(4'hc):(4'hc)] > ({((wire87 != wire88) ?
                      $signed((8'h9c)) : (~|(7'h41))),
                  reg112} ?
              $signed((8'ha6)) : $unsigned((!reg93[(5'h11):(2'h3)])))))
            begin
              reg112 <= ((({(wire108 ? (8'hbc) : reg98)} ?
                      $unsigned({reg110}) : reg95[(2'h2):(1'h1)]) | ($signed($unsigned((8'ha0))) ^ (reg101[(1'h1):(1'h1)] ?
                      (reg97 > reg94) : $signed((8'h9f))))) ?
                  $unsigned(((~&(7'h44)) ?
                      reg94 : {(^wire108),
                          reg103[(4'hb):(4'hb)]})) : $signed((~|$unsigned($unsigned(wire86)))));
            end
          else
            begin
              reg112 <= $unsigned((~|($signed($signed((8'hab))) != reg99)));
              reg113 <= (8'hbc);
              reg114 <= $unsigned(reg109);
              reg115 <= (~reg113[(4'ha):(4'ha)]);
            end
          reg116 <= {$signed(($unsigned($signed(wire91)) || ((reg93 ^ reg109) ^ (~^reg111)))),
              wire90};
          reg117 <= reg111;
          if (($unsigned({wire86, reg114}) || $signed(wire90)))
            begin
              reg118 <= $unsigned(($unsigned((reg94[(4'h8):(2'h2)] ?
                      $unsigned(wire84) : reg109[(3'h7):(3'h5)])) ?
                  wire87 : (8'hb8)));
            end
          else
            begin
              reg118 <= ({(($unsigned(reg98) < wire86) ^~ $signed({(8'had),
                          reg115}))} ?
                  (&(~$signed((wire84 && reg111)))) : {reg113[(1'h0):(1'h0)]});
              reg119 <= reg95;
              reg120 <= $unsigned(wire107[(1'h1):(1'h0)]);
            end
        end
    end
endmodule

module module42
#(parameter param56 = {{{(((8'hbc) ? (8'ha7) : (8'h9f)) >> (~(8'ha3)))}, (~^(8'haa))}}, 
parameter param57 = param56)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 (1'h0)};
  assign wire47 = {wire44[(2'h2):(1'h0)], $signed(wire46)};
  assign wire48 = $unsigned($signed($unsigned(wire43)));
  assign wire49 = (($unsigned($unsigned($unsigned(wire43))) <= $unsigned(wire47)) ?
                      wire46 : $unsigned($unsigned($unsigned($signed(wire45)))));
  assign wire50 = (+(&((wire48[(4'hb):(3'h6)] & (+(7'h43))) ?
                      wire45[(1'h0):(1'h0)] : $unsigned(((7'h40) ?
                          wire43 : wire46)))));
  assign wire51 = (~^wire43[(4'hd):(3'h7)]);
  assign wire52 = wire49;
  assign wire53 = (wire47[(5'h10):(3'h7)] ^~ ($unsigned(wire49[(4'h8):(1'h1)]) ?
                      (^{(wire51 <<< wire45)}) : ((+(8'hb4)) ~^ {{(8'h9d),
                              wire50},
                          wire50})));
  assign wire54 = wire53;
  assign wire55 = $unsigned(wire46);
endmodule
