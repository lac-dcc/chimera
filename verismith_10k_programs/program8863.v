module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire138;
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire21,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire138,
                 (1'h0)};
  assign wire4 = $signed((~wire1));
  assign wire5 = ($signed($signed((wire3[(3'h4):(1'h1)] ? wire4 : wire4))) ?
                     $unsigned(wire2) : (({$signed(wire1)} <<< wire4[(4'h8):(1'h1)]) ?
                         (!((~wire1) * (8'hb3))) : (wire3[(3'h5):(2'h3)] + $signed(((8'haa) & wire4)))));
  assign wire6 = (-$unsigned((wire0[(3'h4):(1'h0)] - ({wire1, wire4} ?
                     $signed(wire1) : wire3[(4'hf):(2'h3)]))));
  module7 #() modinst22 (wire21, clk, wire3, wire0, wire2, wire1);
  assign wire23 = ($unsigned(wire0[(4'hc):(4'hc)]) ?
                      $signed(wire5) : $unsigned(((+$unsigned(wire21)) != wire2[(2'h2):(2'h2)])));
  assign wire24 = (-$unsigned(wire6[(4'hb):(2'h3)]));
  assign wire25 = ($unsigned(wire0[(1'h0):(1'h0)]) ?
                      wire0 : {$unsigned(($unsigned(wire24) ?
                              (wire0 && wire2) : $signed(wire0)))});
  assign wire26 = wire24[(3'h5):(1'h0)];
  module27 #() modinst139 (.wire32(wire5), .wire31(wire3), .y(wire138), .clk(clk), .wire29(wire0), .wire30(wire26), .wire28(wire2));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire128;
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  assign y = {wire130,
                 wire33,
                 wire34,
                 wire98,
                 wire100,
                 wire128,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire33 = $unsigned(wire28[(4'h8):(2'h3)]);
  assign wire34 = wire30;
  module35 #() modinst99 (.clk(clk), .wire39(wire34), .wire36(wire29), .wire37(wire30), .wire38(wire31), .y(wire98));
  assign wire100 = (wire31[(1'h0):(1'h0)] ?
                       $unsigned((+$unsigned($unsigned(wire31)))) : wire32[(5'h10):(3'h5)]);
  module101 #() modinst129 (.wire104(wire34), .wire105(wire33), .wire102(wire32), .y(wire128), .wire106(wire29), .clk(clk), .wire103(wire98));
  assign wire130 = (({wire100,
                       $signed($unsigned(wire30))} <<< $signed((~|(~wire33)))) >>> (&wire29));
  always
    @(posedge clk) begin
      if ($signed(wire34[(4'hd):(3'h6)]))
        begin
          reg131 <= (wire29[(2'h3):(1'h0)] ~^ (($unsigned(wire32) > $signed((wire128 >>> wire30))) ?
              $unsigned((&$signed((8'ha3)))) : (~&(&wire98))));
          reg132 <= wire29[(2'h3):(2'h2)];
          reg133 <= $signed($unsigned(((reg131[(1'h1):(1'h1)] ?
                  wire32 : wire98) ?
              {wire31, (wire34 ? wire100 : wire130)} : {$signed(wire29),
                  wire32})));
          if (wire100[(1'h0):(1'h0)])
            begin
              reg134 <= reg131[(2'h3):(1'h1)];
              reg135 <= (~|((($unsigned(wire28) >= (wire28 - (8'ha0))) ?
                      $unsigned($unsigned(reg134)) : wire32[(5'h13):(3'h5)]) ?
                  $signed(wire128) : (wire31 >> wire130)));
              reg136 <= $unsigned((~|$signed(wire33[(3'h7):(3'h4)])));
            end
          else
            begin
              reg134 <= $signed({($signed({reg131}) + $unsigned((-wire32))),
                  ({$unsigned(reg136),
                      wire30[(3'h4):(3'h4)]} + $unsigned($unsigned(wire31)))});
              reg135 <= $signed({((reg134[(4'he):(4'h9)] == (!(8'hae))) >= ((wire31 ?
                          reg136 : wire32) ?
                      (wire32 ^~ wire34) : (wire34 < wire29)))});
              reg136 <= (-$signed($unsigned($unsigned((wire33 <<< wire128)))));
            end
        end
      else
        begin
          reg131 <= wire30;
          reg132 <= ($signed($unsigned((!$signed(reg136)))) ?
              wire29 : $unsigned(($signed((wire29 && wire100)) ?
                  (8'hb8) : (((7'h41) == reg136) >>> wire128[(4'ha):(2'h2)]))));
          reg133 <= reg134;
          reg134 <= $signed($unsigned($unsigned((~&$unsigned(reg135)))));
        end
      reg137 <= (wire130[(2'h3):(2'h3)] ?
          (8'ha9) : (^~$unsigned(((reg136 >> wire100) * reg132))));
    end
endmodule

module module7
#(parameter param20 = (((({(8'hac), (8'haa)} ? (8'hb3) : (+(8'h9c))) ? (((8'hbe) != (8'ha0)) >> (-(8'hae))) : (((8'haa) ? (8'h9e) : (8'ha6)) ~^ ((8'hb3) ? (8'hbd) : (8'ha5)))) && (8'hbf)) >> (8'hbb)))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg16,
                 (1'h0)};
  assign wire12 = $signed((^wire10[(3'h4):(1'h0)]));
  assign wire13 = $signed((8'hac));
  assign wire14 = (-wire9[(2'h2):(1'h1)]);
  assign wire15 = wire14[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= (wire13 >= wire12);
    end
  assign wire17 = wire13;
  assign wire18 = (^$unsigned($unsigned(wire14)));
  assign wire19 = wire13;
endmodule

module module101
#(parameter param126 = (((~^{((8'hbb) << (8'hbc)), {(8'hbf)}}) ? ((7'h43) ? (((8'ha3) > (7'h44)) ? (+(8'ha9)) : ((8'hb0) <<< (8'hb5))) : ((+(8'hb5)) ^~ (~(8'hba)))) : {(~|((8'ha6) ~^ (8'hba)))}) ? (8'ha6) : (((!(8'hb6)) >>> (^~{(8'ha9)})) ? ((7'h44) * (~&(^(7'h42)))) : {(~&{(8'ha5)})})), 
parameter param127 = param126)
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire106;
  input wire signed [(4'h8):(1'h0)] wire105;
  input wire signed [(2'h2):(1'h0)] wire104;
  input wire [(3'h6):(1'h0)] wire103;
  input wire [(5'h14):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 (1'h0)};
  assign wire107 = $unsigned($signed(((-(wire106 ? wire106 : (8'h9c))) ?
                       $signed(wire104[(1'h0):(1'h0)]) : ((&wire103) ?
                           wire106 : wire104[(1'h1):(1'h0)]))));
  assign wire108 = (~(wire105[(2'h3):(2'h2)] ?
                       wire104 : $unsigned($signed(wire106))));
  assign wire109 = wire103;
  assign wire110 = ((wire102 <= wire108) ?
                       $signed((((wire109 < (8'ha2)) << {wire102}) ^~ ((wire103 ?
                               (7'h40) : wire108) ?
                           $signed(wire105) : (~&wire103)))) : wire104);
  assign wire111 = (((|wire106[(1'h0):(1'h0)]) & ($unsigned(wire108[(4'ha):(3'h4)]) ?
                           wire108[(4'hd):(2'h2)] : wire110)) ?
                       wire109[(3'h6):(3'h6)] : (&wire108));
  assign wire112 = (8'hb4);
  assign wire113 = $unsigned($signed($signed($signed($signed(wire108)))));
  assign wire114 = wire102[(5'h12):(4'ha)];
  assign wire115 = {(^~$unsigned((wire105 ? (8'hbc) : (wire104 | wire111))))};
  assign wire116 = (&$signed(((~|(~&wire114)) ?
                       wire111[(2'h3):(1'h0)] : $signed($signed(wire110)))));
  assign wire117 = {$unsigned((~&$unsigned($signed((8'ha2)))))};
  assign wire118 = {wire102};
  assign wire119 = ($signed(($unsigned({wire105}) ?
                           (~&$unsigned((8'hb4))) : $unsigned(wire115[(1'h1):(1'h0)]))) ?
                       ($unsigned({(wire116 ? wire111 : wire116),
                               (wire116 < wire112)}) ?
                           $unsigned(wire115[(2'h3):(2'h2)]) : {wire104}) : wire115[(2'h3):(1'h0)]);
  assign wire120 = wire108;
  assign wire121 = $unsigned(wire104);
  assign wire122 = $unsigned((wire117[(4'hc):(4'ha)] | $signed(wire104)));
  assign wire123 = wire121[(2'h2):(2'h2)];
  assign wire124 = $signed($unsigned((8'hb4)));
  assign wire125 = wire110;
endmodule

module module35
#(parameter param96 = (^{(-{(^~(8'hb5)), (^(8'haf))}), ((+(~&(8'hb8))) ? (((8'hb8) ? (8'hba) : (8'hac)) >= (~^(8'hb8))) : (((8'hae) < (8'ha5)) ? ((8'hbf) - (8'hb6)) : {(8'ha7), (8'hae)}))}), 
parameter param97 = param96)
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h29c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(3'h4):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  input wire [(4'hf):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire40;
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire92,
                 wire73,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire40,
                 reg93,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire40 = wire39[(5'h10):(4'he)];
  always
    @(posedge clk) begin
      reg41 <= wire36[(4'hb):(1'h1)];
      if (wire37)
        begin
          reg42 <= (-wire39[(2'h2):(1'h0)]);
        end
      else
        begin
          reg42 <= $unsigned({wire40});
          if ((~|(wire37 ? (^~reg42) : wire38[(2'h3):(2'h2)])))
            begin
              reg43 <= $signed($unsigned(wire36));
              reg44 <= reg43;
            end
          else
            begin
              reg43 <= ((8'h9f) ?
                  $unsigned(({$unsigned(wire39)} & wire37)) : $unsigned($unsigned($signed(((8'h9e) ^ reg41)))));
            end
          reg45 <= {wire37[(4'he):(2'h2)]};
        end
      reg46 <= $unsigned((8'hac));
      if ((!(wire36 && (+$unsigned((wire36 != (8'haf)))))))
        begin
          reg47 <= reg44[(2'h2):(1'h0)];
          reg48 <= (wire38[(2'h2):(2'h2)] ?
              $signed((wire36[(3'h7):(2'h3)] & ($unsigned(wire37) ?
                  $signed(wire40) : (8'hbc)))) : wire39);
          reg49 <= reg41[(1'h0):(1'h0)];
          reg50 <= reg49;
          reg51 <= wire39[(5'h11):(4'hc)];
        end
      else
        begin
          if ($unsigned(({wire38[(1'h0):(1'h0)],
                  ({(8'hb8)} ? $unsigned((8'ha4)) : (reg41 && reg49))} ?
              ($signed($signed(reg42)) >>> (~^$signed((8'hb6)))) : {reg41})))
            begin
              reg47 <= ((+reg48) >> reg45[(2'h3):(2'h3)]);
              reg48 <= ((wire38[(1'h0):(1'h0)] ?
                      $unsigned($signed((reg49 ? reg47 : reg46))) : reg45) ?
                  (&$unsigned(reg48)) : {(reg51 != (|wire39[(4'hc):(4'h8)]))});
              reg49 <= reg48;
            end
          else
            begin
              reg47 <= reg43[(2'h2):(1'h1)];
              reg48 <= reg50;
            end
          if ($signed({$signed(reg47),
              ({$unsigned(wire39), $signed(wire39)} & wire39[(4'ha):(3'h5)])}))
            begin
              reg50 <= ($signed(($unsigned(reg50[(2'h2):(1'h1)]) ?
                      wire36[(4'hc):(4'h8)] : (reg48[(4'hc):(2'h2)] > reg45[(3'h5):(3'h5)]))) ?
                  (!reg42[(4'hf):(2'h2)]) : reg47);
              reg51 <= ((reg47[(2'h3):(2'h3)] >>> $signed(reg43)) ?
                  reg51[(2'h2):(1'h1)] : {(reg44 * ($signed(reg51) ?
                          $signed((8'hb1)) : $signed(reg45))),
                      $unsigned($unsigned((reg42 ? wire40 : wire38)))});
              reg52 <= $unsigned(({(+wire40[(3'h6):(2'h3)]),
                  (wire36 != wire40)} >> {reg49[(1'h1):(1'h1)],
                  $unsigned($unsigned((8'hb6)))}));
            end
          else
            begin
              reg50 <= (wire39 >> reg52);
              reg51 <= $signed($signed((~|$unsigned((reg43 >> reg47)))));
              reg52 <= $unsigned((($signed($signed(wire37)) ?
                      wire40[(3'h4):(3'h4)] : ((reg50 ? wire36 : reg47) ?
                          $signed(reg45) : $unsigned(wire38))) ?
                  reg50[(1'h1):(1'h1)] : $signed((~|(wire40 >> reg46)))));
              reg53 <= (reg46[(4'ha):(4'ha)] >= reg51[(3'h5):(2'h3)]);
            end
          reg54 <= (((8'hb4) >= reg53) ? (^reg51) : (^~reg46));
          reg55 <= ((~&reg48) & (~|({$signed(reg41)} ?
              (8'hbc) : $signed((reg42 ? reg43 : reg45)))));
        end
      reg56 <= (((8'ha7) ?
          $unsigned((8'hb1)) : reg51) << (~$unsigned((-$signed(reg46)))));
    end
  assign wire57 = (~|$signed(reg44));
  assign wire58 = $unsigned((reg41 ?
                      $unsigned(($signed(reg51) >> $unsigned(reg46))) : $unsigned((!(reg48 && (8'ha3))))));
  assign wire59 = $unsigned(wire38);
  assign wire60 = reg53[(1'h1):(1'h0)];
  assign wire61 = $unsigned((+$signed(reg42)));
  assign wire62 = ((&$signed((~^$unsigned(wire39)))) ^ (~$unsigned(((reg48 ^~ reg41) < {reg47,
                      reg43}))));
  assign wire63 = wire39[(4'hf):(3'h6)];
  assign wire64 = wire40;
  always
    @(posedge clk) begin
      reg65 <= $signed(reg55[(3'h6):(1'h1)]);
      if ($signed(wire63))
        begin
          reg66 <= wire61[(2'h2):(1'h1)];
          reg67 <= ($unsigned($signed((|(wire64 == (8'hb8))))) ?
              wire59[(1'h0):(1'h0)] : ({wire39[(5'h13):(4'h9)],
                  reg47[(3'h5):(3'h4)]} ^ $unsigned((^~(wire40 ?
                  (8'haf) : wire39)))));
          reg68 <= reg44;
        end
      else
        begin
          if ((reg49 ?
              ($signed(reg66) ?
                  ({reg49} != {(reg44 ? reg56 : reg51),
                      ((7'h42) ?
                          reg68 : wire39)}) : $signed($signed(wire62))) : $unsigned((~|((wire61 ?
                  wire62 : wire63) >> (wire62 ^~ (8'h9c)))))))
            begin
              reg66 <= ({{(&$unsigned(reg45)), $signed((wire64 | reg50))},
                  {$unsigned(reg53)}} == wire40);
              reg67 <= ($unsigned(reg49) ?
                  reg66 : $unsigned(reg45[(2'h3):(2'h2)]));
              reg68 <= ((((reg49[(5'h12):(4'hd)] || (reg41 ? reg48 : wire38)) ?
                          reg45[(2'h2):(1'h0)] : ((reg65 ? (8'ha4) : wire64) ?
                              (~&reg48) : wire39)) ?
                      $signed((wire57[(3'h6):(1'h1)] ?
                          reg46[(4'hc):(3'h7)] : $signed(reg42))) : {reg51,
                          wire40[(1'h0):(1'h0)]}) ?
                  {reg51} : (8'ha1));
              reg69 <= $unsigned($unsigned(wire61));
            end
          else
            begin
              reg66 <= ((|(-wire37)) ?
                  ((($unsigned(wire62) ?
                          (reg54 ?
                              wire60 : (8'hac)) : ((8'ha8) * wire40)) && $signed($signed(reg67))) ?
                      ((wire64[(3'h7):(1'h1)] & (reg54 << reg44)) == $signed(wire58[(2'h2):(1'h1)])) : $signed(($signed(reg69) ~^ (reg53 ?
                          (8'haa) : reg43)))) : ((wire37[(4'hf):(4'he)] & reg45) << (reg42[(1'h1):(1'h1)] > ($unsigned((7'h43)) && (reg47 + (8'hbc))))));
            end
          reg70 <= reg47;
          reg71 <= reg54[(4'h8):(1'h1)];
          reg72 <= {reg50[(2'h3):(1'h0)],
              ($signed(reg50[(3'h5):(3'h4)]) ?
                  ((reg47[(4'ha):(4'ha)] ?
                      wire64[(2'h2):(2'h2)] : ((8'ha2) * reg68)) ^ reg43[(1'h0):(1'h0)]) : ((+$signed(wire40)) ?
                      wire62[(5'h11):(5'h11)] : reg48[(4'hf):(1'h1)]))};
        end
    end
  assign wire73 = (wire58 * {({(!wire64), (+(8'hac))} ?
                          $unsigned({reg46}) : (reg54[(3'h6):(2'h3)] <<< $signed(reg56)))});
  always
    @(posedge clk) begin
      reg74 <= ($unsigned((($signed((8'hba)) ?
              reg46 : $unsigned(reg54)) & ($unsigned((8'hae)) & (wire38 | (8'hba))))) ?
          (wire63[(1'h1):(1'h0)] | $signed({$signed(reg67),
              reg69[(3'h6):(1'h1)]})) : $unsigned($unsigned(reg41[(3'h7):(3'h7)])));
      if ($signed($signed($signed({$signed(reg46)}))))
        begin
          reg75 <= reg56;
          reg76 <= wire36;
          reg77 <= reg47[(4'ha):(1'h1)];
        end
      else
        begin
          reg75 <= $signed({{(^$unsigned(wire57)),
                  ((~reg72) ? (^~reg49) : $unsigned(reg77))}});
          if (wire63[(2'h3):(2'h3)])
            begin
              reg76 <= wire73[(1'h0):(1'h0)];
              reg77 <= ((reg77 > wire36[(4'hc):(3'h7)]) <= wire39);
              reg78 <= $unsigned(reg47[(4'ha):(1'h1)]);
              reg79 <= $unsigned(($signed((~&(reg75 >= reg41))) >= $signed({$signed(wire64),
                  (~^wire73)})));
              reg80 <= wire37[(2'h2):(1'h1)];
            end
          else
            begin
              reg76 <= reg53[(1'h1):(1'h1)];
              reg77 <= reg56;
              reg78 <= (($unsigned($unsigned($unsigned(wire64))) < reg72[(5'h14):(4'hf)]) ?
                  reg55[(3'h6):(1'h1)] : wire57);
            end
          reg81 <= reg46;
          reg82 <= {(^~($signed((~^reg78)) * ($signed(wire62) ?
                  $signed(wire37) : (reg53 ? wire59 : (8'ha6)))))};
          reg83 <= (~^wire59[(1'h1):(1'h1)]);
        end
      reg84 <= reg70;
      if ((~wire60))
        begin
          if (wire59)
            begin
              reg85 <= $signed(((!((-reg84) * $unsigned(wire37))) <= ($signed({reg75,
                  reg56}) ^ reg52)));
            end
          else
            begin
              reg85 <= wire61[(2'h2):(1'h0)];
              reg86 <= {$unsigned((-(~wire40))),
                  ((-(8'h9c)) ?
                      $signed(wire57[(3'h5):(1'h0)]) : $unsigned($unsigned((reg43 ?
                          reg66 : reg42))))};
              reg87 <= reg71[(4'h8):(4'h8)];
              reg88 <= reg44;
            end
          reg89 <= $unsigned((~^(($signed(wire37) - wire64) <= reg71)));
          reg90 <= (^~reg48);
          reg91 <= reg50;
        end
      else
        begin
          reg85 <= {$unsigned((7'h40)),
              $signed((reg90[(5'h13):(4'hf)] ?
                  ((reg46 ? wire58 : wire73) ?
                      reg77[(1'h0):(1'h0)] : reg72) : $unsigned(reg90)))};
          reg86 <= ((reg70 ?
                  reg45[(3'h4):(3'h4)] : (^~$signed($unsigned(wire61)))) ?
              ((8'hb0) ?
                  (~^(!(reg69 | wire37))) : {{(-wire40)}}) : (reg72[(4'hc):(4'hb)] ?
                  (8'ha5) : (((!(8'ha2)) ?
                      (8'hba) : (wire73 + (8'h9c))) << (~$unsigned(reg80)))));
        end
    end
  assign wire92 = {($signed({(wire58 + (8'had)), $signed(reg67)}) ?
                          $unsigned(wire60) : $unsigned({{(8'ha7), reg50}})),
                      $signed((-$signed(reg79)))};
  always
    @(posedge clk) begin
      reg93 <= $unsigned((!$signed(reg47)));
    end
  assign wire94 = ({wire57[(3'h6):(1'h1)],
                      reg89[(4'hb):(4'hb)]} < $signed((($unsigned(reg42) * $unsigned((8'h9f))) ?
                      (-{reg70}) : $signed(reg78))));
  assign wire95 = {(8'h9f), wire38};
endmodule
