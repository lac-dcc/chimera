module top
#(parameter param133 = ({(((~(7'h42)) ? {(8'ha0)} : (~^(8'hbc))) == (|((8'hb2) - (8'hb4))))} ? ({(~{(8'hb0), (8'hb8)}), {((8'hb8) ? (8'h9e) : (8'h9e)), ((8'haa) ? (7'h41) : (8'ha7))}} != (^~((^(8'hbe)) ? (^~(8'ha2)) : {(8'ha4)}))) : (({((8'had) ? (8'hbe) : (8'hb0)), ((8'hba) ^~ (8'ha3))} + ((8'hb1) ? (8'ha7) : (^~(7'h44)))) & ((((8'hb0) || (8'hb8)) || ((8'hbd) ? (8'haf) : (8'hb4))) ~^ (((7'h43) ? (8'hb7) : (7'h44)) - ((8'ha2) * (8'hbb)))))), 
parameter param134 = {((param133 ? (8'hb2) : (~&(param133 ? param133 : param133))) ^~ param133)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  assign y = {wire132,
                 wire130,
                 wire129,
                 wire127,
                 wire7,
                 wire6,
                 wire5,
                 reg131,
                 (1'h0)};
  assign wire5 = (|(~^(~&$signed(wire3))));
  assign wire6 = $unsigned(wire2[(2'h3):(2'h3)]);
  assign wire7 = (wire1 << wire1[(2'h3):(2'h2)]);
  module8 #() modinst128 (wire127, clk, wire4, wire3, wire7, wire6);
  assign wire129 = wire7[(3'h7):(3'h5)];
  assign wire130 = (^$unsigned(wire5[(4'hb):(4'h9)]));
  always
    @(posedge clk) begin
      reg131 <= wire129[(1'h1):(1'h0)];
    end
  assign wire132 = (((((~^wire130) || wire5) ?
                           (wire5[(3'h7):(3'h6)] ?
                               $unsigned(wire6) : {wire130}) : (!wire3[(1'h1):(1'h0)])) >> {$unsigned({reg131,
                               wire0}),
                           $unsigned({wire129, wire7})}) ?
                       $signed((8'hb3)) : $unsigned((($signed(wire4) && $unsigned(wire0)) ?
                           $signed(reg131) : wire127)));
endmodule

module module8
#(parameter param126 = ({(&({(8'hb1)} ? ((8'hb4) ? (8'hb0) : (7'h41)) : ((8'hb3) ? (8'ha4) : (8'hae)))), (^(+{(8'hae), (8'hb5)}))} | ((-(8'h9c)) ? ((&((8'hb8) | (8'ha5))) >>> (8'hb9)) : (7'h44))))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire123;
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  assign y = {wire125,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire52,
                 wire81,
                 wire123,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire13 = (((8'hb6) ^ wire11) + {wire9});
  assign wire14 = (wire13[(4'h8):(4'h8)] >> wire13);
  assign wire15 = (&wire11[(4'ha):(3'h5)]);
  assign wire16 = (($unsigned((7'h40)) > (wire14[(3'h5):(3'h5)] ?
                      ((wire15 ? wire12 : wire13) ?
                          $signed(wire15) : (~(8'hab))) : $unsigned(wire10[(4'ha):(3'h7)]))) | $signed(wire10[(5'h14):(5'h12)]));
  module17 #() modinst40 (.clk(clk), .wire21(wire14), .y(wire39), .wire20(wire16), .wire18(wire10), .wire19(wire13));
  assign wire41 = (&(~|$signed($unsigned((&wire15)))));
  assign wire42 = ($unsigned((((wire14 | (8'ha1)) ?
                          $unsigned(wire13) : wire16) ?
                      wire11 : ((wire14 ? wire41 : wire9) ?
                          (wire12 <= wire12) : $signed((7'h43))))) <<< $signed(((~(wire41 ?
                      (8'hab) : wire15)) ^~ $signed({(8'hb9), wire39}))));
  assign wire43 = wire9;
  assign wire44 = wire15[(1'h1):(1'h0)];
  assign wire45 = ({wire11[(4'h9):(3'h6)],
                      ((wire11[(1'h0):(1'h0)] < ((8'hbd) ?
                          wire43 : wire15)) ^ wire42)} >> (~|wire44));
  always
    @(posedge clk) begin
      reg46 <= $unsigned(((wire43 >= ($signed(wire9) ^~ $signed(wire43))) ?
          (($unsigned(wire10) + $signed(wire16)) <<< wire16) : $signed(wire9[(1'h0):(1'h0)])));
      if ($signed(((wire15[(1'h0):(1'h0)] ? (^wire42[(1'h1):(1'h0)]) : wire16) ?
          wire45 : (&(~|(-(8'hbf)))))))
        begin
          reg47 <= {wire43};
          if ($unsigned($signed(wire45[(3'h4):(2'h2)])))
            begin
              reg48 <= wire41;
              reg49 <= (wire41[(2'h2):(1'h0)] ?
                  $unsigned($signed((~wire12[(3'h4):(1'h1)]))) : wire12);
              reg50 <= (~&reg46[(1'h0):(1'h0)]);
            end
          else
            begin
              reg48 <= $signed($unsigned(wire13));
              reg49 <= (&$signed(({$signed((7'h42))} ?
                  ({wire42, wire13} & reg49) : (~^(~&reg46)))));
              reg50 <= ($signed((wire13 ?
                  $unsigned((wire45 ^~ reg47)) : (~^(~^wire41)))) != {reg47[(3'h4):(3'h4)],
                  (~(^(reg47 ? reg46 : wire15)))});
            end
          reg51 <= {(|$unsigned($signed((wire13 ? wire41 : (8'ha7))))), wire13};
        end
      else
        begin
          reg47 <= $unsigned((~((~|(reg46 >= wire13)) * ($unsigned(wire14) ?
              $signed(reg49) : $signed(wire39)))));
          if (wire12)
            begin
              reg48 <= $signed((~$unsigned($signed((wire42 ?
                  wire39 : (8'ha9))))));
              reg49 <= wire13[(2'h3):(1'h0)];
              reg50 <= $signed((~&reg48[(1'h1):(1'h1)]));
            end
          else
            begin
              reg48 <= (wire44 ?
                  (8'hb5) : $signed((((reg51 ? reg50 : wire11) >> ((7'h43) ?
                          (8'ha0) : reg50)) ?
                      wire10[(5'h15):(3'h7)] : wire10[(5'h12):(3'h4)])));
              reg49 <= ({(((~&wire13) <= $unsigned((8'hb9))) ^ {((8'hac) | (8'ha7))})} >>> $signed(wire13[(2'h3):(2'h2)]));
              reg50 <= wire14[(4'hd):(2'h3)];
            end
        end
    end
  assign wire52 = wire43[(3'h5):(1'h1)];
  module53 #() modinst82 (wire81, clk, wire14, reg48, wire44, wire39, wire16);
  module83 #() modinst124 (wire123, clk, wire42, reg47, wire43, wire13);
  assign wire125 = {(wire44 && ((wire14 ?
                               ((8'hb0) ? (8'hb4) : wire39) : (wire42 ?
                                   wire41 : reg47)) ?
                           $unsigned($unsigned((8'ha1))) : $unsigned(wire41[(3'h6):(2'h2)])))};
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h1c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire87;
  input wire [(4'h8):(1'h0)] wire86;
  input wire [(3'h4):(1'h0)] wire85;
  input wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
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
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire88 = (~(&$signed(({wire87} * $signed(wire84)))));
  assign wire89 = $signed(($signed({wire85, (wire84 ? wire86 : (8'hac))}) ?
                      {(&{wire87}), wire88[(4'h9):(3'h4)]} : wire88));
  assign wire90 = $unsigned((({$signed(wire86),
                      ((8'had) << wire88)} || ({wire84,
                      wire89} <= wire89)) + $unsigned((~&$signed((7'h43))))));
  assign wire91 = $signed(wire87);
  assign wire92 = wire90;
  assign wire93 = {({$unsigned((wire87 ^~ wire92))} ?
                          $unsigned(($unsigned((8'hb9)) || (~|wire88))) : $unsigned((-((7'h42) ?
                              wire91 : wire92)))),
                      wire89};
  assign wire94 = {(^~$signed($unsigned($unsigned(wire88))))};
  assign wire95 = $unsigned($signed(wire93[(2'h3):(1'h0)]));
  assign wire96 = ({wire91[(3'h5):(2'h2)]} ?
                      (+$signed(({wire94} ?
                          wire94 : $unsigned(wire84)))) : (($unsigned($signed(wire93)) ?
                          $unsigned((wire88 ?
                              wire92 : (8'hb4))) : wire89) ^ (!wire88[(4'h8):(4'h8)])));
  assign wire97 = $unsigned((~|(($signed(wire91) ^ $unsigned(wire94)) ?
                      wire93 : $unsigned($unsigned((7'h43))))));
  assign wire98 = $unsigned((|$unsigned(wire87)));
  always
    @(posedge clk) begin
      reg99 <= (($unsigned(wire94[(3'h4):(1'h0)]) >>> $signed($signed((&wire84)))) ?
          {((-wire95[(3'h7):(1'h1)]) >> (+wire92[(2'h2):(1'h0)]))} : (wire93[(1'h0):(1'h0)] ?
              ($signed(wire91[(2'h2):(1'h0)]) ^ {wire95[(5'h14):(2'h3)],
                  wire85}) : wire87[(2'h2):(2'h2)]));
      reg100 <= $signed($unsigned(($signed(wire88[(2'h2):(1'h0)]) <= (wire90[(2'h3):(1'h0)] ?
          $unsigned(wire93) : ((8'hb1) ~^ wire92)))));
      reg101 <= ((~|((wire84[(4'he):(4'h9)] <<< $signed((8'h9c))) <<< (+wire85[(1'h1):(1'h1)]))) ?
          {$unsigned($signed($unsigned(wire94))),
              ($unsigned($unsigned(wire92)) ?
                  $signed($unsigned((8'hb4))) : (8'ha1))} : (!({$unsigned(wire86),
                  {wire94, wire96}} ?
              ((^reg99) ? {wire85} : (^(7'h41))) : {$signed(wire93),
                  (!wire98)})));
      reg102 <= wire88[(4'h9):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg103 <= (wire88[(2'h2):(1'h0)] << $signed($unsigned((wire93 ?
          $signed(wire89) : wire96))));
      reg104 <= $unsigned((~|((8'h9e) ?
          {$signed((8'ha1))} : $unsigned(wire85))));
      if ({$signed($signed((~|(|wire91))))})
        begin
          reg105 <= $unsigned(((&wire97) != wire94[(4'h9):(3'h6)]));
          reg106 <= $unsigned((reg99[(3'h7):(3'h4)] ? wire97 : (8'hb1)));
          reg107 <= wire86[(3'h5):(1'h0)];
        end
      else
        begin
          if ((^~{$unsigned($unsigned(((8'haa) ? wire89 : wire89)))}))
            begin
              reg105 <= reg107;
              reg106 <= (wire96 ?
                  (8'hba) : $signed((reg102 ?
                      (!{wire95}) : ((wire86 || reg107) != $unsigned((7'h40))))));
              reg107 <= ((+wire91) ?
                  ((^$signed(reg103[(2'h2):(1'h0)])) < {wire95,
                      reg103}) : ((&($unsigned((8'haa)) <<< $signed(wire89))) ?
                      $unsigned(((!reg102) <= (reg106 ?
                          (8'ha9) : wire95))) : wire94));
            end
          else
            begin
              reg105 <= wire97[(2'h3):(2'h3)];
              reg106 <= (reg100[(2'h2):(2'h2)] ?
                  (($signed($signed(wire91)) ?
                          (~&wire94[(4'ha):(3'h6)]) : wire92[(2'h2):(1'h0)]) ?
                      $signed($unsigned($signed((8'hb1)))) : reg102) : ((wire94 << wire87) ?
                      wire97[(3'h5):(1'h1)] : (~&wire92[(2'h2):(1'h1)])));
              reg107 <= ($unsigned($signed(($unsigned(wire87) & (8'hb6)))) ?
                  $signed((^($signed((8'hb6)) && (wire84 ?
                      wire92 : wire96)))) : $unsigned(((&(8'hb5)) ^~ reg105[(1'h0):(1'h0)])));
              reg108 <= $signed((reg104[(4'hd):(4'hb)] ?
                  (8'hbf) : (~&$signed((wire95 ? wire85 : (8'h9d))))));
              reg109 <= (((-(8'h9d)) * $unsigned(((wire98 ? (8'h9e) : wire85) ?
                      {wire89} : reg103[(5'h10):(4'hd)]))) ?
                  reg106[(1'h1):(1'h1)] : ((((~^reg104) == (~&wire98)) == (~&(wire90 && reg105))) ?
                      $unsigned((^$signed(reg102))) : wire91));
            end
          reg110 <= (+(($signed(reg99) * $unsigned((~^reg106))) ?
              reg101 : (!wire94[(4'h8):(2'h2)])));
        end
      if ($unsigned(reg100))
        begin
          reg111 <= wire96[(3'h6):(1'h1)];
          if (({(($unsigned(reg107) + wire89) ?
                  ($unsigned((8'hbd)) ?
                      (wire97 < wire94) : (wire90 == reg100)) : reg109),
              reg102} + ((|$unsigned((wire87 ? (7'h44) : wire98))) ?
              (($signed(reg106) != (wire94 ?
                  reg100 : (8'haf))) > (&(~^wire94))) : $signed(wire93))))
            begin
              reg112 <= (^~wire87[(2'h2):(1'h0)]);
              reg113 <= reg104[(4'hd):(1'h0)];
              reg114 <= wire93[(1'h1):(1'h1)];
              reg115 <= $signed(reg106);
            end
          else
            begin
              reg112 <= (8'hbd);
              reg113 <= {$unsigned(reg111), $unsigned(wire86[(4'h8):(1'h1)])};
              reg114 <= ($unsigned(($signed((-reg113)) ?
                  $signed(reg105[(1'h1):(1'h1)]) : ((reg105 >= reg113) - reg104[(4'hc):(1'h1)]))) | $signed({(&$signed(reg104))}));
              reg115 <= $unsigned(reg115);
              reg116 <= $unsigned(wire97[(4'h8):(3'h7)]);
            end
        end
      else
        begin
          reg111 <= ({wire91[(3'h5):(3'h5)],
              (^~({reg115, wire95} ?
                  ((7'h44) < wire95) : (^~wire86)))} << $unsigned($signed(($unsigned(wire91) && $signed((8'hb4))))));
          reg112 <= $signed((^(-wire92)));
          reg113 <= ($signed(wire92[(3'h4):(1'h0)]) ?
              ($signed($signed({reg115})) + (~^$signed((reg106 ?
                  wire87 : reg110)))) : {$unsigned($signed(reg114))});
          if (wire90[(4'hb):(3'h7)])
            begin
              reg114 <= {$unsigned($signed($unsigned($unsigned(wire98))))};
              reg115 <= ($unsigned($unsigned((wire89[(2'h2):(2'h2)] ?
                      $signed((8'hba)) : reg108[(4'h9):(3'h5)]))) ?
                  (~{$unsigned((reg101 - reg105))}) : (((^(reg99 ?
                              reg100 : wire88)) ?
                          $signed((wire84 <<< reg106)) : reg111) ?
                      reg113[(4'hd):(2'h2)] : (~|$signed(wire91[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg114 <= reg114[(3'h7):(2'h2)];
              reg115 <= reg112;
              reg116 <= (((+reg116) <<< ($signed($unsigned(reg113)) <<< (((8'hb9) ?
                      reg110 : (8'h9d)) ?
                  (|reg105) : $unsigned(reg99)))) >>> $signed({{reg114,
                      wire98[(3'h4):(2'h3)]}}));
              reg117 <= reg114[(4'hd):(4'h9)];
            end
          reg118 <= ((~|({reg100} >>> {reg109,
              (reg112 ? wire88 : (8'hac))})) < (^~wire84));
        end
    end
  assign wire119 = $signed((!((^~(~wire86)) ?
                       ((|reg111) ? {wire86} : (^~(8'hb7))) : (&wire88))));
  assign wire120 = ((wire91 && (8'ha3)) ?
                       $unsigned((+(reg103 <<< (|wire98)))) : ($unsigned((&(wire94 <= wire95))) + wire90[(4'h9):(3'h4)]));
  assign wire121 = wire119[(5'h12):(1'h0)];
  assign wire122 = ((^~{reg116,
                       wire120[(1'h1):(1'h0)]}) & ($signed((~^$unsigned(wire90))) ?
                       ($signed(wire97) ?
                           (wire120 ?
                               {reg109,
                                   reg117} : $unsigned(reg105)) : $unsigned((|reg109))) : (~&($signed(reg108) ?
                           (^reg111) : ((8'hb6) < reg99)))));
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  input wire [(3'h4):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg80,
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
                 reg64,
                 (1'h0)};
  assign wire59 = $signed(((((8'hba) ?
                          $unsigned(wire54) : (wire58 ? wire56 : (8'ha1))) ?
                      wire54 : $signed(wire55[(3'h6):(3'h4)])) ^ wire55[(4'h8):(1'h1)]));
  assign wire60 = $signed(wire59);
  assign wire61 = (wire60[(3'h6):(1'h1)] ? wire56[(2'h2):(1'h0)] : (^wire54));
  assign wire62 = wire59;
  assign wire63 = $unsigned((-({wire61, (8'hbe)} & (+$signed((8'h9d))))));
  always
    @(posedge clk) begin
      if ((wire54 == (($signed((wire59 ? wire56 : wire61)) ?
          $unsigned($signed(wire58)) : ((wire58 ? wire61 : wire54) ?
              (wire62 ? wire55 : wire59) : (wire63 ?
                  wire63 : (8'hb9)))) || wire55[(2'h2):(1'h0)])))
        begin
          reg64 <= wire62;
          reg65 <= $unsigned((~&(8'hb0)));
          reg66 <= $unsigned($signed($signed(($unsigned((8'hb7)) ?
              $unsigned(wire58) : (|reg65)))));
          if ($unsigned(wire55[(4'hb):(2'h3)]))
            begin
              reg67 <= wire62;
              reg68 <= $unsigned((wire56[(2'h2):(2'h2)] ?
                  $signed($signed((8'hb4))) : (~&wire54[(3'h4):(2'h3)])));
            end
          else
            begin
              reg67 <= $signed(reg66);
              reg68 <= (8'ha9);
              reg69 <= wire59;
              reg70 <= (wire58[(3'h4):(1'h1)] <<< $signed((~|wire55[(2'h2):(1'h1)])));
              reg71 <= wire60;
            end
        end
      else
        begin
          reg64 <= $signed((((-(reg67 >= reg67)) ^~ reg68) == ({{(8'hbe)}} ?
              $signed(reg64) : ((~wire54) || wire61))));
        end
      reg72 <= (~|(reg64[(2'h3):(2'h3)] ?
          reg66[(3'h7):(3'h6)] : $signed(((wire55 >> (8'hac)) ?
              (~|(8'h9d)) : $signed(wire59)))));
      reg73 <= (&$unsigned((~|reg72[(1'h0):(1'h0)])));
      reg74 <= wire60[(3'h7):(3'h6)];
    end
  assign wire75 = $unsigned((^(~&$signed($signed(wire62)))));
  assign wire76 = ((^$signed(($signed(wire55) * wire63[(3'h6):(2'h2)]))) ?
                      ((((reg66 > wire54) ?
                          (~&(8'hb6)) : {reg68}) <= ($signed(wire60) ?
                          {reg74} : (|(8'hb4)))) > reg70[(4'hb):(1'h0)]) : ((+{reg70}) || {{$signed(reg72)}}));
  assign wire77 = ($signed($unsigned(reg69)) <= wire58);
  assign wire78 = wire58[(1'h0):(1'h0)];
  assign wire79 = $signed({$unsigned((8'ha6))});
  always
    @(posedge clk) begin
      reg80 <= (((8'hb0) >> (~&($unsigned(reg73) ?
              $unsigned(wire59) : (wire76 ? wire55 : wire76)))) ?
          {{$signed((~(8'ha1))), (wire63 < $unsigned(wire60))},
              reg69[(3'h7):(1'h0)]} : $unsigned((((^reg68) >= wire75) >>> reg74[(4'h9):(3'h5)])));
    end
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = (8'hbd);
  assign wire23 = wire22[(5'h10):(4'hd)];
  assign wire24 = wire19[(1'h0):(1'h0)];
  assign wire25 = wire20;
  assign wire26 = ($signed(wire24) <= {wire21,
                      {$signed((wire25 ? wire22 : (8'hb3)))}});
  assign wire27 = wire19[(3'h4):(1'h0)];
  assign wire28 = wire20;
  assign wire29 = wire18;
  assign wire30 = $signed(wire29[(2'h3):(2'h2)]);
  assign wire31 = ($signed((-$signed(wire29[(1'h1):(1'h0)]))) * wire21);
  assign wire32 = ((wire31 ?
                      ($unsigned((wire27 == wire19)) ?
                          (8'h9f) : wire21) : (-$signed($unsigned(wire26)))) >> {$signed(($unsigned(wire29) ?
                          (wire19 ? (8'ha8) : wire31) : $unsigned(wire30)))});
  assign wire33 = wire18[(4'h8):(4'h8)];
  assign wire34 = ((($signed({wire29}) ?
                          $unsigned((wire29 | wire28)) : ((wire33 ?
                              wire21 : wire30) == wire28[(4'h9):(3'h7)])) ^ ((8'hbb) ?
                          {(-wire19)} : $signed((wire18 ? (8'haf) : wire29)))) ?
                      (8'hae) : (({(&wire22), (&wire19)} ?
                              wire28 : ($signed(wire23) ?
                                  wire26[(2'h2):(1'h0)] : wire33)) ?
                          {$signed(wire30[(2'h2):(1'h0)])} : $signed($unsigned((wire30 ?
                              wire21 : (8'hb5))))));
  assign wire35 = $unsigned((wire26 >>> {wire22, wire28[(3'h6):(3'h6)]}));
  assign wire36 = (((-wire27) < wire18[(2'h3):(2'h3)]) ?
                      $signed((+{wire31[(1'h1):(1'h0)]})) : ({($signed(wire20) >> (^(8'haf))),
                          {(wire31 ?
                                  wire20 : wire21)}} != ($unsigned((~&wire27)) ?
                          (-(wire30 ?
                              wire19 : wire28)) : wire29[(2'h3):(2'h2)])));
  assign wire37 = $signed((wire32[(5'h11):(5'h11)] != ($signed((wire20 ?
                          wire26 : wire30)) ?
                      ((^~wire29) & (wire33 >> wire24)) : wire26)));
  assign wire38 = (wire30[(1'h0):(1'h0)] ?
                      $signed(wire37) : (~(wire35[(2'h3):(2'h2)] << (^wire22[(3'h6):(3'h6)]))));
endmodule
