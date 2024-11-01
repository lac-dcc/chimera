module top
#(parameter param168 = (((8'haa) ? {(^~(~&(8'hbd))), (((8'ha1) > (8'ha4)) ? {(8'ha3), (8'hb4)} : ((8'ha1) || (8'ha3)))} : (~{((8'ha8) && (8'h9c))})) ? (8'ha0) : {((((7'h41) ? (8'hb1) : (8'hb5)) << (|(8'hae))) ? (~|((8'ha9) < (8'hb4))) : (((7'h43) << (8'hb3)) ? ((8'hba) ? (8'had) : (7'h43)) : ((8'ha0) ? (8'hb5) : (8'hb5)))), ((^~((8'hb6) ? (8'hac) : (8'ha9))) ? (((8'hba) ? (7'h44) : (8'ha4)) ? ((8'hb2) | (8'hb1)) : ((8'h9f) ^~ (7'h42))) : ({(8'ha5)} >> (&(8'hbc))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire161;
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire125,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire144,
                 wire145,
                 wire159,
                 wire160,
                 wire161,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  module5 #() modinst126 (.y(wire125), .wire6(wire0), .clk(clk), .wire7(wire1), .wire9(wire2), .wire8(wire4), .wire10(wire3));
  assign wire127 = wire2;
  assign wire128 = wire2[(4'h8):(2'h2)];
  assign wire129 = ($signed(wire125[(3'h4):(2'h2)]) ?
                       ($signed($unsigned(wire2[(4'h8):(3'h7)])) < ($unsigned((wire3 ?
                           wire128 : (8'hbe))) || wire3[(4'h9):(4'h8)])) : (!$unsigned(($signed(wire128) | $signed(wire127)))));
  assign wire130 = wire0[(1'h1):(1'h1)];
  assign wire131 = (-((-($unsigned((8'hbc)) ?
                           wire125[(3'h4):(3'h4)] : {wire4})) ?
                       $unsigned({$signed((7'h44)),
                           wire125}) : $signed(wire125)));
  always
    @(posedge clk) begin
      reg132 <= ((({(wire129 ^~ wire0)} ?
              wire125[(2'h3):(1'h0)] : (wire125 ?
                  $signed(wire129) : wire4)) < $unsigned(wire4[(5'h11):(4'hc)])) ?
          wire2[(2'h2):(1'h0)] : $signed(({(wire131 ? (8'hba) : wire1),
                  ((7'h43) ? wire2 : wire131)} ?
              wire127[(1'h0):(1'h0)] : wire130[(2'h3):(2'h3)])));
      reg133 <= $signed((~wire129));
      reg134 <= ($signed($signed($signed($signed(wire3)))) ?
          wire4[(4'hc):(4'ha)] : $signed(wire1[(2'h2):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg135 <= ({(wire1[(5'h10):(4'hc)] <<< ((^~wire0) + wire128))} ?
          ((&((wire4 ? wire0 : wire0) ? $unsigned(wire3) : $unsigned(reg134))) ?
              wire3[(1'h0):(1'h0)] : reg132) : wire2[(1'h0):(1'h0)]);
      reg136 <= (reg132[(2'h2):(2'h2)] <<< wire128);
      if ((reg135 ?
          $unsigned((^(reg134 || (-wire1)))) : $unsigned($signed($unsigned($signed((8'hb9)))))))
        begin
          reg137 <= {reg134};
        end
      else
        begin
          if ((reg134[(3'h7):(3'h4)] <<< (^$signed($signed(((8'hbb) ?
              reg135 : wire3))))))
            begin
              reg137 <= (+reg132);
              reg138 <= (-reg132[(3'h6):(1'h1)]);
              reg139 <= wire130;
            end
          else
            begin
              reg137 <= $unsigned(reg134);
              reg138 <= {wire0[(4'ha):(1'h1)]};
              reg139 <= wire125[(2'h2):(2'h2)];
            end
        end
      if (wire4[(3'h4):(3'h4)])
        begin
          reg140 <= (wire128 ?
              (~^$signed($unsigned((reg138 > reg138)))) : (8'ha9));
          reg141 <= wire125;
          reg142 <= ($unsigned(reg132) ?
              reg139[(3'h7):(2'h3)] : $signed((+((wire128 - reg132) ?
                  (&reg136) : wire3))));
        end
      else
        begin
          reg140 <= $unsigned(wire128[(4'h9):(4'h8)]);
          if ((^~(((!(wire127 ? wire131 : (8'hbf))) ?
                  (wire0[(2'h3):(2'h2)] ?
                      wire130 : $unsigned(wire131)) : reg139) ?
              (~((&(8'ha8)) ~^ $unsigned(wire4))) : $unsigned((((8'ha6) ?
                  reg133 : reg142) << $unsigned(wire0))))))
            begin
              reg141 <= ((~&$signed(reg139[(3'h7):(2'h3)])) ?
                  ((($signed(reg138) ^ {reg140}) ?
                      wire128[(3'h7):(3'h5)] : ($signed(reg135) ?
                          (wire125 ^~ reg137) : (wire128 ?
                              reg133 : wire3))) ^ wire1) : reg139);
              reg142 <= ($unsigned(wire125[(2'h2):(2'h2)]) ?
                  ($signed($signed(reg133)) ^~ (+wire129)) : reg133);
            end
          else
            begin
              reg141 <= $unsigned(reg132[(4'h9):(1'h1)]);
              reg142 <= (($signed(reg136[(2'h3):(2'h2)]) * {{$unsigned(wire0)},
                  (reg138[(2'h3):(1'h0)] ?
                      $unsigned(reg135) : (wire4 ~^ reg138))}) >>> ($signed(((reg142 ?
                          wire130 : reg135) ?
                      {wire3} : $unsigned(wire127))) ?
                  (!$signed({reg140})) : $unsigned((+reg135))));
              reg143 <= (|wire127);
            end
        end
    end
  assign wire144 = wire130;
  assign wire145 = {wire129,
                       $unsigned(($unsigned((wire127 ? reg139 : reg135)) ?
                           reg140 : wire131[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      reg146 <= $unsigned({wire131});
    end
  always
    @(posedge clk) begin
      reg147 <= (&{({$signed(reg134), (reg142 - (7'h40))} ?
              reg141 : (^~wire129))});
      if (({(reg141[(3'h4):(1'h1)] ?
                  {((8'hb0) ? reg136 : wire145)} : (^~(wire4 ?
                      wire125 : wire145))),
              {(wire127 ? wire145[(1'h1):(1'h0)] : reg147[(5'h10):(3'h5)]),
                  wire129}} ?
          (((wire4 ?
                  (reg146 ?
                      wire2 : wire127) : wire128[(4'hd):(4'h9)]) << ($unsigned((8'ha3)) ?
                  $unsigned(reg141) : (wire128 + wire4))) ?
              wire125[(1'h1):(1'h0)] : wire131[(2'h2):(1'h0)]) : (reg132[(4'h8):(1'h0)] ?
              $signed(((&(8'hbe)) ^~ (~&(8'hb0)))) : $unsigned($unsigned($unsigned((8'ha0)))))))
        begin
          reg148 <= (reg141[(1'h1):(1'h0)] ? {wire125} : $unsigned(wire129));
          reg149 <= $signed(wire0[(2'h3):(1'h0)]);
          reg150 <= (($unsigned($signed((+reg132))) ?
              wire131 : $unsigned(wire131)) ~^ {(wire2 - ((!reg149) <<< (reg134 ?
                  (8'hbf) : wire131)))});
          reg151 <= $unsigned({{$signed({reg141, reg140}),
                  (reg143 ? reg137[(3'h5):(3'h4)] : reg147)}});
        end
      else
        begin
          reg148 <= wire3;
          if ($unsigned(reg141[(3'h7):(1'h1)]))
            begin
              reg149 <= wire2[(3'h6):(3'h5)];
              reg150 <= $unsigned($unsigned($unsigned((~^reg148[(1'h0):(1'h0)]))));
              reg151 <= ((|$unsigned($unsigned((~wire128)))) - $signed($unsigned((wire130[(1'h1):(1'h0)] << (reg142 - (8'hbf))))));
              reg152 <= $signed(wire2[(3'h4):(2'h2)]);
            end
          else
            begin
              reg149 <= ($signed($unsigned((+(wire4 - reg148)))) ?
                  reg143[(4'hc):(2'h3)] : {(~^$unsigned({reg134, wire0})),
                      $unsigned((^~(reg134 <= wire129)))});
              reg150 <= {$unsigned(($signed((&reg146)) < wire2[(2'h2):(1'h0)])),
                  {((8'hae) ? {$signed(wire4), (+wire130)} : (~&(-reg140))),
                      reg135}};
            end
          reg153 <= (~((!$signed($unsigned(reg138))) ?
              $signed((!(wire144 ? (8'hbc) : reg139))) : wire2[(3'h4):(2'h3)]));
          reg154 <= ((|(+wire144[(3'h4):(2'h3)])) ^~ wire130);
        end
      if (((~^(wire144 ?
              ((wire129 ? wire144 : reg147) ?
                  {reg139} : (reg143 ? reg134 : (8'hb3))) : $signed(reg143))) ?
          ($signed(((wire127 ? wire129 : wire125) << (~&wire125))) ?
              (~(^(+wire145))) : ($unsigned((~&reg152)) ?
                  $signed(wire131[(1'h0):(1'h0)]) : (wire145 | (8'hb3)))) : reg135))
        begin
          reg155 <= $unsigned((~|wire131));
          reg156 <= reg139;
          reg157 <= (($signed({$signed(reg132)}) * wire127) & {reg152[(5'h11):(3'h7)]});
        end
      else
        begin
          reg155 <= $unsigned(reg147);
          reg156 <= wire128[(2'h2):(1'h0)];
        end
      reg158 <= reg152;
    end
  assign wire159 = {$signed(((reg149 - (reg146 ?
                           reg157 : (7'h44))) > ((~reg154) >= reg137)))};
  assign wire160 = ($unsigned((wire2 <= $unsigned((wire145 ?
                       (8'ha1) : reg148)))) | $signed($unsigned($unsigned($unsigned(wire128)))));
  module83 #() modinst162 (.clk(clk), .wire88(reg133), .wire84(wire131), .y(wire161), .wire85(reg137), .wire87(wire2), .wire86(wire159));
  assign wire163 = reg141[(3'h7):(1'h0)];
  assign wire164 = (|wire1);
  assign wire165 = reg140[(2'h3):(2'h2)];
  assign wire166 = (~&($signed(wire3[(4'ha):(3'h4)]) << $unsigned((~^(~|wire4)))));
  assign wire167 = reg147[(4'h9):(1'h1)];
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire99;
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire101,
                 wire62,
                 wire37,
                 wire36,
                 wire11,
                 wire15,
                 wire16,
                 wire17,
                 wire34,
                 wire64,
                 wire78,
                 wire80,
                 wire81,
                 wire82,
                 wire99,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $signed(($unsigned($signed((wire6 ? (8'h9d) : (7'h40)))) ?
                      $unsigned({(wire7 < wire6),
                          $signed(wire10)}) : (~&(wire10[(1'h1):(1'h0)] ?
                          $unsigned(wire7) : $unsigned((8'haa))))));
  always
    @(posedge clk) begin
      reg12 <= (-$signed(wire7[(4'h9):(2'h3)]));
      reg13 <= (wire10 ?
          (^((8'ha9) & (wire9[(1'h0):(1'h0)] ?
              $unsigned(wire8) : ((8'ha9) ^ wire8)))) : ((8'ha7) | (((~|wire9) ?
              (reg12 << reg12) : (wire7 >= wire8)) + (^~$unsigned(wire9)))));
      reg14 <= wire11;
    end
  assign wire15 = {(($signed({wire10, wire8}) >>> $unsigned((wire8 ^~ reg14))) ?
                          wire10 : wire6[(1'h0):(1'h0)])};
  assign wire16 = $signed($unsigned(((|(wire9 ^ reg12)) > wire10[(3'h7):(1'h0)])));
  assign wire17 = $signed($signed((wire11[(1'h0):(1'h0)] << wire9[(2'h2):(2'h2)])));
  module18 #() modinst35 (wire34, clk, wire15, wire9, reg13, wire10, reg14);
  assign wire36 = wire34;
  assign wire37 = reg14;
  module38 #() modinst63 (wire62, clk, wire36, reg12, wire6, reg14, wire34);
  assign wire64 = wire37;
  module65 #() modinst79 (.clk(clk), .wire67(wire16), .wire68(wire9), .wire69(wire62), .y(wire78), .wire66(wire64));
  assign wire80 = $signed(($unsigned($signed((~|reg14))) + (~^(8'hb7))));
  assign wire81 = (({wire16} ?
                          (wire17 ?
                              ((wire34 != wire11) ?
                                  wire10[(3'h4):(1'h0)] : {wire17,
                                      wire62}) : $signed(reg12[(3'h5):(3'h5)])) : (wire78 ?
                              wire80 : $signed({wire8, wire11}))) ?
                      reg12[(3'h6):(2'h2)] : reg12[(2'h3):(1'h1)]);
  assign wire82 = (^~({$unsigned($signed(wire9)),
                          {(wire37 > (8'ha9)), (8'hac)}} ?
                      wire36 : wire62[(3'h5):(3'h4)]));
  module83 #() modinst100 (wire99, clk, wire78, wire62, wire15, wire7, wire64);
  assign wire101 = (!$unsigned($unsigned(wire15)));
  module102 #() modinst119 (wire118, clk, wire17, wire34, wire99, wire78);
  assign wire120 = wire6;
  assign wire121 = (-$unsigned((-($unsigned(wire64) ?
                       $unsigned((8'hb8)) : $unsigned((8'hba))))));
  assign wire122 = (wire8[(4'h9):(1'h1)] ?
                       wire99[(2'h3):(1'h1)] : wire36[(1'h1):(1'h0)]);
  assign wire123 = wire62;
  assign wire124 = $unsigned($unsigned($signed(wire99[(4'ha):(3'h5)])));
endmodule

module module102
#(parameter param117 = ((!(~|(((8'h9e) | (8'ha1)) ? {(8'hac)} : (&(8'hab))))) << (((8'haa) <= (^(~(8'hbd)))) ? (((!(7'h40)) ? ((8'ha8) ? (8'ha0) : (8'hb1)) : ((7'h42) <= (8'hbe))) ~^ (|((8'hb5) == (8'hbb)))) : (8'hac))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire106;
  input wire signed [(4'hb):(1'h0)] wire105;
  input wire [(5'h11):(1'h0)] wire104;
  input wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  assign y = {wire116,
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
  assign wire107 = wire104[(4'hb):(1'h1)];
  assign wire108 = wire106[(4'he):(4'ha)];
  assign wire109 = $signed(({((wire107 ?
                               wire107 : wire105) > wire105[(4'h9):(3'h6)]),
                           $signed((wire105 ? wire103 : wire105))} ?
                       ($unsigned((-wire106)) ?
                           ($unsigned((8'hbc)) ?
                               (+wire105) : $signed(wire108)) : (8'ha5)) : (wire106[(4'hc):(2'h3)] ?
                           (8'haf) : (wire105 >>> wire104[(2'h2):(1'h0)]))));
  assign wire110 = (!(((^wire104) ? wire106 : wire106) ?
                       (($unsigned(wire105) << (wire105 ? (8'haa) : wire103)) ?
                           $unsigned($unsigned(wire107)) : (wire109[(4'he):(4'hb)] == (wire106 == wire109))) : (8'hb2)));
  assign wire111 = (wire107 ~^ (~((~^$unsigned(wire110)) ?
                       wire110[(2'h2):(1'h1)] : wire105)));
  assign wire112 = wire111;
  assign wire113 = wire109;
  assign wire114 = (($unsigned(($unsigned(wire104) ?
                           $unsigned(wire105) : $signed(wire111))) <= (8'h9c)) ?
                       ((((^wire113) ?
                               $signed(wire105) : $signed(wire103)) ~^ (8'ha3)) ?
                           (&wire103) : (-((wire111 ?
                               (8'ha2) : wire103) || $signed((8'hbb))))) : ((wire113[(3'h5):(1'h1)] == ({wire110} ?
                           (wire108 <<< wire110) : wire111[(3'h4):(2'h2)])) < (!((wire110 >= wire110) ?
                           (wire111 ?
                               (8'ha4) : wire107) : $unsigned(wire109)))));
  assign wire115 = {wire113[(4'ha):(4'h8)], $signed(wire105[(4'hb):(2'h3)])};
  assign wire116 = (((^~(|$signed(wire108))) ?
                           $unsigned(wire110[(4'h9):(1'h0)]) : {(^~wire109)}) ?
                       (^~{$unsigned($signed(wire107))}) : $unsigned($unsigned(((-(8'hba)) >= wire113[(4'hb):(3'h6)]))));
endmodule

module module83
#(parameter param97 = ((((((8'ha8) <= (8'hbc)) == ((8'ha4) ? (8'hb5) : (8'hb2))) ? (((8'hbe) << (8'ha6)) >= {(8'hb9), (8'hb9)}) : (((8'ha8) ~^ (8'hbc)) ~^ {(8'h9d), (8'hac)})) ? (&{((8'haf) ? (8'haa) : (8'haa)), {(8'hbf), (8'ha7)}}) : ((8'hb8) != {(!(8'hb1)), (~^(8'hb6))})) ? ((|((|(8'haf)) < ((8'hb6) > (8'hb6)))) ? {((^(8'ha6)) >= {(8'ha7)}), ((-(8'hb1)) && ((8'hb7) ? (8'had) : (8'ha1)))} : ({(|(8'ha4))} == (8'ha4))) : ((|(((7'h40) ? (8'h9e) : (8'hae)) <= ((8'h9f) ? (8'hac) : (8'hb4)))) ? {{(!(8'h9d)), {(8'hb1), (8'hb2)}}, {((8'haf) ? (7'h42) : (8'h9f)), (!(8'ha4))}} : (-(~|((7'h41) ? (8'h9c) : (8'ha8)))))), 
parameter param98 = (&(^~(param97 ? ((~^param97) ? {(8'hbd)} : (-param97)) : {param97}))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire88;
  input wire signed [(3'h7):(1'h0)] wire87;
  input wire signed [(4'hc):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire signed [(4'hd):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 (1'h0)};
  assign wire89 = (wire85 ?
                      wire84[(4'h8):(2'h2)] : $unsigned(wire86[(2'h3):(2'h3)]));
  assign wire90 = (&(8'hb6));
  assign wire91 = (~|$unsigned({wire86}));
  assign wire92 = $signed(wire91[(2'h3):(1'h1)]);
  assign wire93 = wire88;
  assign wire94 = {$signed(wire85[(4'he):(4'ha)])};
  assign wire95 = $signed({(wire88[(2'h3):(1'h0)] ?
                          $unsigned((wire90 || wire85)) : $signed((wire87 ?
                              wire84 : wire85))),
                      $signed(($unsigned(wire91) & {wire90}))});
  assign wire96 = wire93;
endmodule

module module65
#(parameter param76 = (((-((~|(8'ha1)) >>> ((8'hb9) ? (8'hac) : (8'hb8)))) ~^ ({{(8'ha7), (8'hb1)}} ^~ ((|(8'hb3)) == {(8'h9c)}))) ? (8'ha5) : (8'hbf)), 
parameter param77 = {(((&param76) ? param76 : ({param76, (7'h40)} ? (|param76) : param76)) >= {(param76 ? (param76 > (8'hb6)) : param76), ((param76 ^~ param76) ~^ (param76 ~^ param76))}), (^(((param76 << param76) == param76) || param76))})
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  input wire [(4'hf):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  assign y = {wire75, wire74, wire73, wire72, wire71, wire70, (1'h0)};
  assign wire70 = $unsigned($signed(((!(wire67 >= wire67)) ?
                      $unsigned((wire67 ?
                          wire68 : (8'hbd))) : $signed(((8'hb9) - wire68)))));
  assign wire71 = {(wire67 ?
                          wire70[(3'h6):(2'h2)] : (~{(wire66 >>> (7'h40))}))};
  assign wire72 = ($signed({$signed(wire69)}) - wire68[(1'h0):(1'h0)]);
  assign wire73 = ($unsigned($signed($unsigned((|wire68)))) >>> ($unsigned(((wire68 + wire66) >= wire67[(4'hb):(3'h7)])) ?
                      $unsigned($signed((-wire71))) : {((&wire70) <= wire71)}));
  assign wire74 = (((wire66 >> ((wire73 ? wire71 : wire72) ?
                      {wire67,
                          (8'hb0)} : (~wire70))) ^~ wire72[(2'h3):(1'h1)]) * ({{wire69[(4'hc):(4'h9)]},
                          ((wire67 ? wire66 : (8'h9f)) ^ (wire68 ?
                              (8'ha0) : (8'h9f)))} ?
                      ({wire72[(3'h6):(2'h3)]} ?
                          $unsigned(wire72) : (((8'ha0) || wire73) <= $unsigned(wire70))) : $signed(((wire68 ?
                              (8'h9e) : wire68) ?
                          wire69[(3'h6):(2'h2)] : wire69[(1'h0):(1'h0)]))));
  assign wire75 = (^~wire66);
endmodule

module module38
#(parameter param60 = {(((((8'hba) >> (8'ha9)) <= {(8'h9d), (8'hb6)}) * (((8'hb8) ? (7'h43) : (8'hb7)) | ((8'hae) ? (7'h44) : (8'had)))) ? (({(8'hba)} ? ((7'h41) - (8'hac)) : ((8'ha8) ? (8'hb8) : (8'hb8))) ? (^((8'hbe) < (8'hb5))) : (((8'hbd) << (8'hbc)) << {(8'h9f)})) : ({((8'ha3) <<< (8'hb0))} >= (&((8'had) ? (8'hb0) : (8'hb7)))))}, 
parameter param61 = (8'hb2))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire43;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire [(4'ha):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire46,
                 wire45,
                 wire44,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire44 = ($unsigned($unsigned(((-wire40) ?
                          (wire41 - wire40) : wire41))) ?
                      (~&($unsigned(wire41[(3'h5):(3'h4)]) << $signed((wire42 <= wire40)))) : wire42[(2'h3):(1'h1)]);
  assign wire45 = (^wire43[(3'h4):(2'h2)]);
  assign wire46 = $signed({(wire42 ?
                          $unsigned($unsigned(wire42)) : wire39[(3'h5):(2'h3)]),
                      {$unsigned((wire43 && wire42))}});
  always
    @(posedge clk) begin
      reg47 <= (^({(wire41 - (wire39 ^ wire43)), wire46} < $unsigned({(wire42 ?
              wire44 : wire44)})));
      reg48 <= $signed(($unsigned((&wire43[(3'h5):(2'h2)])) ?
          (~((wire41 + reg47) ^ wire39[(4'hc):(4'hc)])) : wire39[(3'h5):(2'h3)]));
      reg49 <= $unsigned(($unsigned($unsigned($unsigned(reg48))) ?
          {$unsigned(wire44)} : $signed(({wire40, wire46} ?
              (~wire39) : {(8'hbc), wire46}))));
      reg50 <= reg49;
    end
  always
    @(posedge clk) begin
      reg51 <= ((reg48 ?
              $unsigned((~wire46[(3'h4):(2'h3)])) : ($signed((wire41 ~^ wire43)) <<< $signed(wire39[(3'h7):(2'h2)]))) ?
          (wire45[(3'h5):(2'h2)] ?
              ((wire42[(2'h2):(1'h1)] ?
                  $unsigned(reg50) : $signed(reg50)) | $unsigned((reg47 - wire45))) : $unsigned((|{wire42}))) : reg48[(4'h9):(3'h4)]);
      reg52 <= (8'ha0);
      reg53 <= $unsigned({wire45[(3'h6):(2'h2)]});
      reg54 <= wire42;
      reg55 <= reg54;
    end
  assign wire56 = wire46;
  assign wire57 = wire42[(1'h1):(1'h1)];
  assign wire58 = wire41[(3'h5):(3'h4)];
  assign wire59 = {wire45[(4'h8):(1'h0)]};
endmodule

module module18
#(parameter param32 = (7'h41), 
parameter param33 = ((~^(-(~(param32 ? param32 : param32)))) ? param32 : (param32 + ((((8'ha8) ? param32 : param32) ? (param32 ~^ (8'ha4)) : param32) == (&(~&param32))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire23;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 (1'h0)};
  assign wire24 = {$signed((~|wire22)),
                      $signed((~&(wire20 ?
                          (wire22 << (8'hbd)) : (wire21 <<< wire20))))};
  assign wire25 = (wire19[(1'h0):(1'h0)] * (wire21[(2'h2):(1'h1)] && (~&{wire21[(1'h0):(1'h0)],
                      (wire24 ~^ wire24)})));
  assign wire26 = wire22;
  assign wire27 = wire25;
  assign wire28 = ($signed(({(wire22 ? wire26 : (8'ha8)),
                          (~wire25)} ~^ $signed((wire27 && wire20)))) ?
                      (wire22 < (!wire22)) : wire20[(3'h6):(3'h5)]);
  assign wire29 = $unsigned(wire19[(2'h3):(2'h3)]);
  assign wire30 = wire25;
  assign wire31 = {{((wire25[(4'h9):(3'h6)] ?
                                  {wire28} : wire26[(3'h4):(1'h1)]) ?
                              {(-wire22)} : $unsigned((wire23 ?
                                  wire25 : wire27)))},
                      $unsigned((~&wire25[(4'he):(1'h1)]))};
endmodule
