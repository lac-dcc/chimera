module top
#(parameter param143 = ({(-(((7'h43) ? (8'ha1) : (8'hbf)) ^ ((7'h44) ? (8'ha5) : (8'ha3))))} | (~|((((7'h40) ? (8'hb3) : (8'ha2)) || {(8'h9c)}) * (((8'ha6) < (8'hb9)) >> (-(8'ha8)))))), 
parameter param144 = ((((~^{param143}) ? (8'hb3) : param143) * ({param143} ? {(!(8'hb4))} : ((param143 + param143) ? {param143, param143} : (~|param143)))) || param143))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire5,
                 wire4,
                 reg140,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (($signed(wire4[(2'h2):(1'h1)]) - (wire1 == ((wire3 ?
                             (8'ha9) : wire0) ?
                         ((8'haa) ? wire4 : (8'had)) : wire0[(3'h7):(3'h6)]))) ?
                     $unsigned((wire4[(3'h6):(3'h5)] ?
                         $unsigned((&wire1)) : ($signed(wire4) ?
                             $unsigned(wire1) : wire1))) : $signed(((+wire0) ?
                         (8'hbb) : ($unsigned(wire0) != $signed(wire2)))));
  module6 #() modinst135 (wire134, clk, wire0, wire4, wire1, wire3);
  assign wire136 = (wire3 ^ wire134);
  assign wire137 = (wire0[(5'h13):(5'h10)] <<< $signed((wire136[(5'h11):(4'h9)] ?
                       (~|$unsigned(wire134)) : wire3)));
  assign wire138 = wire0[(5'h12):(1'h1)];
  assign wire139 = $signed((8'hb8));
  always
    @(posedge clk) begin
      reg140 <= $signed(wire139[(1'h1):(1'h0)]);
    end
  assign wire141 = {{wire1[(1'h0):(1'h0)]},
                       ({wire134[(1'h1):(1'h0)],
                           ($signed(wire2) ?
                               (wire138 ?
                                   reg140 : (8'hbf)) : wire2)} - (($signed(wire0) ?
                               (wire134 << wire136) : wire137[(1'h1):(1'h1)]) ?
                           (~^(wire1 && wire137)) : ($signed(wire0) ?
                               (wire136 ?
                                   wire137 : wire137) : $signed(wire139))))};
  assign wire142 = $unsigned(({(wire139[(3'h5):(3'h4)] ^~ $signed(wire138))} > wire0));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire107;
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  assign y = {wire132,
                 wire111,
                 wire110,
                 wire109,
                 wire83,
                 wire43,
                 wire42,
                 wire41,
                 wire11,
                 wire39,
                 wire85,
                 wire107,
                 reg112,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire11 = $signed({(wire9 != wire10[(3'h4):(1'h1)])});
  module12 #() modinst40 (.wire17(wire10), .clk(clk), .wire13(wire9), .wire16(wire7), .wire14(wire8), .y(wire39), .wire15(wire11));
  assign wire41 = (^(($signed((wire8 <= wire7)) ?
                      $unsigned((wire7 != wire8)) : $unsigned(wire9)) <<< $signed((8'h9e))));
  assign wire42 = wire41;
  assign wire43 = ((~^($unsigned($signed(wire10)) == (~^(&wire8)))) & {(-$signed({wire41})),
                      wire10[(2'h2):(1'h0)]});
  module44 #() modinst84 (wire83, clk, wire43, wire11, wire42, wire10, wire39);
  assign wire85 = $unsigned(wire9);
  always
    @(posedge clk) begin
      reg86 <= ((8'haa) * $unsigned(wire85[(1'h0):(1'h0)]));
      reg87 <= reg86[(1'h1):(1'h0)];
      reg88 <= wire7;
    end
  module89 #() modinst108 (wire107, clk, wire83, wire7, wire11, wire42, wire9);
  assign wire109 = wire11[(2'h3):(2'h3)];
  assign wire110 = (wire107 <<< $unsigned(wire43));
  assign wire111 = wire85[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      reg112 <= wire109[(1'h0):(1'h0)];
    end
  module113 #() modinst133 (wire132, clk, wire109, wire83, wire39, wire8);
endmodule

module module113
#(parameter param131 = (((((8'h9e) > ((8'ha8) == (8'ha7))) ? (|(^~(7'h43))) : (~&((8'hba) & (8'ha2)))) << (^~(8'hbd))) >= ((~(((8'hb2) ? (8'hb8) : (8'ha8)) >= {(8'haf)})) >> ((|{(8'h9d)}) ? (~((8'hb6) >>> (8'hb8))) : ({(8'hab), (8'hac)} <= ((7'h44) << (8'haf)))))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire117;
  input wire signed [(3'h5):(1'h0)] wire116;
  input wire signed [(4'h9):(1'h0)] wire115;
  input wire [(4'hf):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire125;
  wire [(3'h4):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 (1'h0)};
  assign wire118 = $signed((8'ha7));
  assign wire119 = ((wire115 <<< {(wire114 <<< (-wire118)),
                           ((~&wire117) ? wire115 : wire115)}) ?
                       wire115[(1'h0):(1'h0)] : $signed(wire116));
  assign wire120 = $signed((~^$unsigned((|(wire117 ? wire119 : wire114)))));
  assign wire121 = wire120[(4'hf):(4'h8)];
  assign wire122 = $signed((wire121[(2'h3):(2'h3)] & wire120[(4'hf):(2'h3)]));
  assign wire123 = wire115;
  assign wire124 = (^(^~(~(wire117 + $unsigned(wire121)))));
  assign wire125 = {((($signed(wire120) ^~ (wire124 ? wire123 : wire117)) ?
                               (wire115 >= wire121[(2'h2):(1'h0)]) : ({wire114} ?
                                   wire114 : (8'had))) ?
                           (+($unsigned(wire120) ?
                               $unsigned(wire121) : wire114[(2'h2):(2'h2)])) : wire123),
                       {wire123[(4'h8):(4'h8)],
                           ($unsigned((wire123 != (8'h9c))) ?
                               $signed((8'hb3)) : $unsigned(wire118[(1'h1):(1'h0)]))}};
  assign wire126 = $unsigned(wire124);
  assign wire127 = $signed(({$unsigned($unsigned(wire123))} && ((!$unsigned(wire117)) >= ((wire117 == wire122) ?
                       $unsigned(wire118) : (wire123 || wire124)))));
  assign wire128 = wire118;
  assign wire129 = $signed({$signed((~&(8'ha1))), wire114[(3'h6):(2'h2)]});
  assign wire130 = wire129[(2'h3):(2'h2)];
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire94;
  input wire [(5'h13):(1'h0)] wire93;
  input wire [(4'hf):(1'h0)] wire92;
  input wire signed [(2'h2):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= (wire94[(2'h3):(2'h2)] != (((wire93[(4'h8):(3'h4)] ?
              {(8'hb2), wire90} : $signed(wire90)) ?
          ((wire92 >>> wire91) >= {wire91,
              (8'hb6)}) : $signed((~|wire90))) >> $signed($unsigned((wire90 != (8'hbb))))));
      reg96 <= $signed($unsigned(((reg95 ? (~(7'h42)) : wire90) <= wire90)));
      reg97 <= ((((wire90[(4'h8):(3'h4)] ?
                      (wire90 ? wire94 : wire92) : $unsigned((8'hb5))) ?
                  wire91 : ((wire92 || wire94) ?
                      (&(8'hb5)) : wire91[(2'h2):(1'h0)])) ?
              wire90[(3'h7):(3'h6)] : $signed((~(~(8'hb9))))) ?
          wire92[(3'h4):(2'h2)] : wire92);
      reg98 <= (wire94[(1'h0):(1'h0)] << $unsigned(wire93));
      reg99 <= reg96[(1'h1):(1'h1)];
    end
  assign wire100 = {($signed($unsigned(reg95)) ?
                           wire92 : {$unsigned((wire91 ? (7'h41) : reg97))}),
                       ({{$unsigned((7'h42))},
                           reg98[(1'h1):(1'h0)]} + (wire94[(1'h0):(1'h0)] ^~ $unsigned(reg96[(2'h2):(1'h1)])))};
  assign wire101 = $unsigned((reg95[(4'hb):(1'h1)] != (&wire100)));
  assign wire102 = wire91;
  assign wire103 = (8'ha9);
  assign wire104 = reg95[(5'h10):(4'hc)];
  assign wire105 = (($unsigned((reg96[(1'h0):(1'h0)] & (wire92 ?
                               reg99 : (7'h43)))) ?
                           (+$unsigned((reg98 != wire102))) : reg96[(1'h0):(1'h0)]) ?
                       wire101 : (reg96[(2'h2):(2'h2)] ?
                           $unsigned((~|$unsigned(wire104))) : reg97));
  assign wire106 = (~(~^(((reg98 && wire92) ? (|reg98) : $signed(reg99)) ?
                       $signed(wire100[(3'h5):(3'h4)]) : ($unsigned(wire100) > ((8'ha9) && wire94)))));
endmodule

module module44
#(parameter param81 = (^((8'hb9) ? (~{(^(8'hb3))}) : (~{((8'hbc) ? (7'h43) : (8'h9f))}))), 
parameter param82 = (+((((param81 ? param81 : param81) ? (param81 ^ param81) : (param81 + param81)) ? (param81 | param81) : (|{param81, param81})) >> (((param81 <= param81) ^ {param81}) ? param81 : {(~|param81)}))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire50 = ($unsigned(wire45[(4'hd):(1'h0)]) ?
                      $unsigned($unsigned(((wire48 ? (8'hae) : wire46) ?
                          $signed(wire49) : (|wire45)))) : wire48);
  assign wire51 = wire49;
  assign wire52 = ($unsigned({$unsigned(wire47)}) ?
                      $unsigned($unsigned((+$signed(wire51)))) : wire45);
  assign wire53 = wire49;
  assign wire54 = ((wire47 - $unsigned((wire49 >>> wire49[(4'h9):(4'h8)]))) ?
                      wire46 : ((8'ha1) ?
                          ($unsigned((wire49 ?
                              (8'haa) : wire52)) & ((wire45 || (8'hb6)) || $unsigned(wire49))) : ((-$unsigned(wire53)) ^~ ((wire51 || wire50) ?
                              (wire51 ?
                                  wire53 : (8'ha9)) : $unsigned(wire51)))));
  assign wire55 = $signed(wire49[(2'h2):(1'h1)]);
  assign wire56 = wire55[(2'h2):(1'h0)];
  assign wire57 = wire53[(1'h0):(1'h0)];
  assign wire58 = $unsigned($unsigned($unsigned((8'hbc))));
  always
    @(posedge clk) begin
      reg59 <= (wire50 ?
          wire52[(2'h2):(1'h1)] : (^~{($unsigned(wire53) | (wire56 ?
                  wire48 : wire54)),
              (wire47 * {wire56, wire51})}));
      reg60 <= wire49[(3'h5):(3'h4)];
      reg61 <= $signed(wire51[(4'h8):(2'h3)]);
    end
  assign wire62 = (wire46 ?
                      wire57 : $signed($unsigned((reg60[(3'h4):(2'h2)] <<< (reg61 < wire58)))));
  assign wire63 = $signed(wire48[(2'h3):(2'h2)]);
  assign wire64 = wire53[(4'hb):(3'h7)];
  assign wire65 = wire52[(2'h3):(1'h1)];
  assign wire66 = ((~(((+wire49) ?
                      wire56[(4'hf):(2'h3)] : (wire56 >= wire56)) >> wire49)) < (wire62 ?
                      (-(8'hac)) : (((wire52 + (8'hb5)) ?
                          (wire58 ?
                              reg61 : wire64) : wire54[(1'h1):(1'h0)]) >>> (8'hb7))));
  assign wire67 = (7'h40);
  assign wire68 = wire62;
  always
    @(posedge clk) begin
      reg69 <= wire54;
      if (wire55[(4'h8):(4'h8)])
        begin
          reg70 <= $signed(wire45);
          reg71 <= reg61;
          if ((reg61[(4'hf):(1'h1)] <<< {(-($unsigned(wire63) ?
                  (wire52 != wire67) : (wire49 == wire47))),
              (&wire49[(1'h0):(1'h0)])}))
            begin
              reg72 <= (|wire56);
              reg73 <= wire55[(3'h6):(3'h5)];
              reg74 <= (wire56 ^~ wire68[(4'ha):(3'h5)]);
              reg75 <= (wire56 ?
                  $signed((($unsigned(reg60) ?
                      $signed(wire46) : {reg69}) ^ $signed((reg61 ?
                      reg70 : wire65)))) : {$unsigned((!(^~reg61)))});
              reg76 <= (^$signed(reg71[(4'ha):(3'h6)]));
            end
          else
            begin
              reg72 <= wire53;
              reg73 <= wire57[(4'h8):(3'h7)];
              reg74 <= {wire67[(5'h10):(3'h5)]};
            end
        end
      else
        begin
          if (reg74)
            begin
              reg70 <= ((((((8'ha7) ? wire65 : reg72) ?
                          (~|(8'hbf)) : (wire64 ? wire64 : wire47)) ?
                      reg74[(3'h6):(1'h1)] : ({wire66, wire66} < (reg74 ?
                          (8'ha7) : wire48))) && wire65[(1'h0):(1'h0)]) ?
                  (!$unsigned(reg74[(4'h9):(1'h1)])) : $unsigned($signed((wire57 > $unsigned(wire49)))));
              reg71 <= $signed(($unsigned((~$unsigned(wire67))) ?
                  wire63 : wire45));
            end
          else
            begin
              reg70 <= {$signed($signed(((wire58 ? (8'hbe) : wire50) ?
                      wire48[(3'h4):(1'h0)] : (&wire48)))),
                  (~&wire47[(1'h1):(1'h1)])};
              reg71 <= (^{($signed(wire52) ?
                      (~|$signed(wire49)) : reg70[(4'h8):(4'h8)]),
                  $unsigned((^wire66[(4'hd):(3'h5)]))});
            end
          reg72 <= $unsigned($signed(wire56[(5'h13):(4'ha)]));
          if ($signed({$unsigned((reg73[(5'h12):(4'h9)] < wire52))}))
            begin
              reg73 <= reg72[(2'h2):(2'h2)];
              reg74 <= wire48;
              reg75 <= wire63;
              reg76 <= {reg61,
                  (~^(($unsigned((8'hbb)) ?
                      (wire68 >= (8'hae)) : {reg69, wire54}) + ((wire46 ?
                          wire48 : wire68) ?
                      {wire63} : $signed(wire54))))};
            end
          else
            begin
              reg73 <= (^(wire65[(1'h0):(1'h0)] ?
                  ($unsigned({wire58, reg76}) ?
                      (8'hb2) : ((wire57 << wire53) * reg71)) : (~|(^~(~reg72)))));
              reg74 <= wire66;
            end
        end
      reg77 <= wire51[(2'h3):(1'h1)];
      reg78 <= ((!($unsigned((+reg72)) <= $signed(wire51[(4'ha):(2'h3)]))) ?
          wire57 : wire68);
    end
  assign wire79 = (-wire54[(2'h3):(1'h1)]);
  assign wire80 = $unsigned((^~(+$unsigned((~wire47)))));
endmodule

module module12
#(parameter param37 = ((&((((7'h41) ? (8'hb9) : (8'ha3)) ? ((8'hab) ? (8'hb0) : (8'hb8)) : {(8'hbe)}) >> (~&((8'hae) <<< (8'ha3))))) + {((|((8'hbb) ? (7'h44) : (8'ha6))) != ((|(8'hb7)) ? (!(7'h41)) : ((8'hac) <<< (8'h9c))))}), 
parameter param38 = param37)
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire18 = (&(wire13[(1'h1):(1'h0)] ? wire17[(4'ha):(4'ha)] : wire17));
  assign wire19 = (7'h41);
  assign wire20 = {$unsigned(wire19[(3'h4):(2'h2)]), (~|wire19)};
  assign wire21 = ((wire15[(4'hf):(1'h1)] ?
                          ((^~(~&wire16)) ?
                              wire17 : (|(^wire17))) : $signed(($signed(wire13) ?
                              (wire15 ?
                                  wire20 : wire19) : wire14[(4'he):(4'he)]))) ?
                      wire19 : $signed({((wire14 | wire18) | $unsigned(wire16))}));
  assign wire22 = (-((((wire16 ? (8'haf) : wire18) ?
                              (wire16 ? wire14 : wire17) : (wire15 & wire20)) ?
                          wire19[(2'h3):(2'h2)] : ({wire17} && $signed(wire14))) ?
                      (~|(8'hbb)) : ($signed(wire21) * wire15)));
  assign wire23 = $unsigned((^wire13[(4'hc):(1'h1)]));
  assign wire24 = (~&(-($signed(wire16[(1'h0):(1'h0)]) & $signed($unsigned(wire13)))));
  assign wire25 = ((8'ha0) > wire14);
  assign wire26 = (~^$unsigned(wire15));
  assign wire27 = wire17[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg28 <= ((wire24 ?
              $unsigned((((8'ha7) >= wire14) ?
                  wire13 : $signed(wire17))) : (&(~|$signed(wire16)))) ?
          wire22[(2'h2):(1'h1)] : wire26);
      if (wire14[(4'h8):(3'h6)])
        begin
          if ($unsigned(wire27))
            begin
              reg29 <= (|wire13);
              reg30 <= (+(|(wire19 ?
                  ({wire27} ?
                      ((7'h42) ? wire17 : wire21) : {wire26,
                          wire20}) : $signed($unsigned((8'haf))))));
              reg31 <= (~|$unsigned($signed(((reg29 >> wire20) ?
                  ((7'h44) ? reg28 : wire23) : (wire21 ? reg30 : wire23)))));
            end
          else
            begin
              reg29 <= (($signed($signed(wire13)) ?
                      reg31[(4'h8):(4'h8)] : $unsigned(reg28[(3'h7):(2'h2)])) ?
                  wire23 : $unsigned(($signed((wire21 | reg30)) ^ $signed((wire20 ^ reg29)))));
              reg30 <= ((8'hba) ^ ((wire26 >= {$signed(wire13)}) + wire25));
              reg31 <= wire20;
            end
        end
      else
        begin
          reg29 <= (~&(8'ha3));
        end
      reg32 <= (($signed((wire16[(3'h4):(1'h0)] ?
              $unsigned(wire15) : (-reg30))) ?
          (((8'h9e) ~^ $signed((8'hb6))) ?
              $signed(wire25) : ((~&wire19) ?
                  (+wire22) : (wire19 ?
                      wire26 : reg31))) : wire14[(3'h6):(3'h4)]) & $signed(wire22));
      reg33 <= $signed({(8'hbf)});
    end
  assign wire34 = wire18[(3'h4):(1'h0)];
  assign wire35 = wire13[(5'h12):(3'h7)];
  assign wire36 = wire23;
endmodule
