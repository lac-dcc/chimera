module top
#(parameter param184 = ({(((~|(8'haf)) >>> ((8'hb2) ? (8'hb4) : (8'hb8))) ? (~&{(8'h9f), (8'hb3)}) : ({(8'hb8), (8'h9f)} ? ((8'hbe) >>> (8'hb5)) : ((8'ha6) | (8'hae))))} || ((((+(8'h9c)) <= ((7'h43) <= (8'hb0))) > (((8'ha5) >>> (8'hb4)) ? ((8'hbb) ? (8'ha4) : (8'hae)) : ((8'ha6) * (7'h44)))) && ((((7'h40) ^ (8'ha4)) >> ((8'hbf) ? (8'hb4) : (8'ha1))) << (&((8'h9c) ? (8'hb3) : (7'h44)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire160;
  wire signed [(4'h9):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire179;
  wire [(4'h9):(1'h0)] wire181;
  wire [(4'hb):(1'h0)] wire182;
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire4,
                 wire5,
                 wire152,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire179,
                 wire181,
                 wire182,
                 reg154,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(1'h0)];
  assign wire5 = ($unsigned((8'h9e)) ? wire3[(3'h5):(2'h3)] : $signed(wire3));
  module6 #() modinst153 (.wire11(wire0), .wire7(wire4), .wire8(wire2), .y(wire152), .wire10(wire5), .clk(clk), .wire9(wire1));
  always
    @(posedge clk) begin
      reg154 <= wire152[(1'h0):(1'h0)];
    end
  assign wire155 = (+$unsigned((!wire2)));
  assign wire156 = $unsigned((~&$signed(wire3[(1'h1):(1'h0)])));
  assign wire157 = {$signed((wire5 ?
                           (~^wire1[(1'h0):(1'h0)]) : (wire156 ~^ (wire3 ?
                               wire152 : wire152)))),
                       ($signed({wire4[(1'h1):(1'h1)]}) >= $unsigned($unsigned(wire0[(4'he):(4'h9)])))};
  module17 #() modinst159 (.y(wire158), .wire20(wire5), .wire19(wire0), .wire21(wire2), .clk(clk), .wire18(wire3), .wire22(wire157));
  assign wire160 = wire157[(3'h7):(2'h2)];
  assign wire161 = $signed($unsigned(wire155));
  assign wire162 = $unsigned(($unsigned(wire160) == (~{(~&(8'hab))})));
  assign wire163 = $unsigned(wire155[(3'h6):(1'h1)]);
  assign wire164 = ((^~({wire156[(2'h3):(2'h2)],
                           wire1[(4'ha):(2'h3)]} + wire157[(3'h4):(2'h3)])) ?
                       $signed(wire160[(4'h8):(3'h4)]) : (($signed((wire161 ?
                               wire162 : wire3)) ?
                           ({(8'hb1), wire152} ?
                               (wire157 ?
                                   wire158 : wire155) : (8'haf)) : {((7'h44) >= (8'hbd))}) && (wire1 ?
                           (wire1 ?
                               (~|wire5) : reg154[(4'h9):(4'h8)]) : ((!reg154) ?
                               $unsigned(wire1) : (^wire152)))));
  always
    @(posedge clk) begin
      reg165 <= ((^$unsigned(wire160)) ~^ (($signed($unsigned((8'hae))) ?
              ($signed(wire156) < wire155[(3'h4):(2'h3)]) : wire158[(2'h2):(2'h2)]) ?
          (8'hb9) : wire5));
      reg166 <= (!wire4);
    end
  always
    @(posedge clk) begin
      reg167 <= (wire155[(1'h0):(1'h0)] ?
          (wire0 ?
              (8'ha0) : ($unsigned(wire5) ?
                  reg166 : $unsigned((wire157 ~^ wire156)))) : ({($unsigned(reg166) && $signed((8'hba)))} <<< (~&(8'haa))));
      reg168 <= {{reg165[(2'h2):(2'h2)]}, $signed(wire156)};
      reg169 <= (~&($unsigned(wire156) ?
          (~((wire1 >= wire0) ?
              reg165[(1'h0):(1'h0)] : wire163)) : $signed($unsigned($unsigned(wire0)))));
      if ($unsigned(((({wire157, reg165} ?
          wire156 : {wire5}) ^ (reg166 > (wire160 ?
          (8'h9c) : wire0))) ^~ ($unsigned((wire2 * reg169)) ?
          {{reg166}} : ($unsigned(wire163) ?
              wire157[(4'ha):(1'h1)] : (~|(8'h9e)))))))
        begin
          reg170 <= $unsigned($signed(($unsigned(((8'haf) ?
              wire2 : wire0)) * reg167[(4'h9):(2'h3)])));
          reg171 <= $signed(wire2[(1'h1):(1'h0)]);
        end
      else
        begin
          if ($unsigned(($signed($unsigned((~&reg170))) | ((wire157 * $unsigned(wire156)) ^ ((reg169 ?
                  reg165 : reg167) ?
              (8'hbd) : (wire2 ? wire161 : wire158))))))
            begin
              reg170 <= wire164;
              reg171 <= wire161[(1'h0):(1'h0)];
            end
          else
            begin
              reg170 <= ($signed((!(wire2 != (wire152 < wire162)))) < ($signed(wire5[(3'h7):(2'h3)]) + ($unsigned(wire162[(4'hd):(4'h8)]) && reg166[(4'ha):(4'ha)])));
              reg171 <= (reg165 <<< $signed((|(8'h9d))));
              reg172 <= $unsigned(((~^wire162[(3'h6):(2'h2)]) ?
                  (wire158[(3'h5):(2'h3)] + {wire162}) : (~|((reg170 - wire156) < (reg171 * wire4)))));
            end
          reg173 <= $unsigned((|$signed((reg168 ? (~|reg168) : wire152))));
          if ((((((wire160 >>> wire158) ?
                  reg170 : ((8'hbf) ? wire160 : wire2)) ?
              (wire162 ?
                  (wire160 ?
                      wire158 : (8'hbd)) : (|reg167)) : $signed(wire156[(3'h5):(3'h4)])) << wire5) == (-{$unsigned((8'hbe)),
              (wire152 ? (wire5 ^~ wire5) : {(8'h9c), reg171})})))
            begin
              reg174 <= $signed({wire157});
              reg175 <= wire160[(4'hc):(3'h5)];
            end
          else
            begin
              reg174 <= reg171;
              reg175 <= (^{{($signed(reg154) ?
                          $signed(wire161) : reg169[(2'h2):(1'h1)])}});
            end
          reg176 <= wire1[(3'h4):(2'h2)];
          reg177 <= $unsigned(((~^{$unsigned((8'hb2)),
              (^~wire3)}) * reg176[(4'hb):(2'h3)]));
        end
      reg178 <= wire4[(2'h2):(1'h0)];
    end
  module133 #() modinst180 (.wire137(reg166), .wire134(reg171), .wire135(wire155), .wire136(reg174), .wire138(wire162), .y(wire179), .clk(clk));
  assign wire181 = $signed($unsigned({{reg168}}));
  module133 #() modinst183 (wire182, clk, reg173, wire163, wire1, reg169, wire158);
endmodule

module module6
#(parameter param151 = ((((((8'ha3) >> (8'h9f)) ? ((8'hb2) ? (8'h9c) : (8'ha6)) : (&(8'had))) || {(&(8'hb0))}) == {({(8'ha1)} <= ((8'hb9) * (7'h42)))}) ? ({(^~(~^(8'hb8))), (((8'h9d) ^~ (8'ha2)) ? {(8'hba)} : ((8'hb9) & (8'hba)))} ? {(!((8'hb8) ? (8'hbf) : (8'hba))), ((~|(8'ha0)) ^~ ((8'hb0) ^~ (8'ha4)))} : (({(8'haf), (8'hb8)} ? {(8'hb5)} : ((8'hb3) ? (8'ha6) : (8'ha3))) && (~((8'h9e) ~^ (8'hb9))))) : ({{(~(8'hb8))}, (~^{(7'h43), (8'ha5)})} ~^ (((~|(8'hb3)) ? ((8'hb8) < (8'hb7)) : ((8'h9c) ? (8'ha1) : (7'h43))) << (^~((8'hb2) ? (8'ha0) : (8'ha1)))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire145;
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire150,
                 wire127,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire40,
                 wire78,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire145,
                 reg149,
                 reg148,
                 reg147,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({$signed((wire11[(1'h0):(1'h0)] << (^~wire11)))} >= wire9[(3'h4):(1'h0)]))
        begin
          if ((~|$signed(({$signed((8'hb9))} ?
              (-$unsigned(wire9)) : wire8[(4'h9):(1'h1)]))))
            begin
              reg12 <= (~^$unsigned($signed((8'hb7))));
              reg13 <= {(|wire8)};
            end
          else
            begin
              reg12 <= (wire8 * ($unsigned(($unsigned(reg12) ?
                  wire8 : $signed(reg12))) - (reg13[(1'h1):(1'h1)] ?
                  $unsigned(wire8) : (reg13 ?
                      ((7'h40) >= wire11) : $unsigned((8'hb1))))));
              reg13 <= (($unsigned({(wire11 ? (7'h41) : wire9),
                  (wire8 ?
                      wire10 : wire11)}) << wire9) <<< {((8'hae) > (wire11 ^~ ((8'hb5) <= reg13))),
                  reg13});
            end
        end
      else
        begin
          reg12 <= $signed({$signed($unsigned((wire8 ? wire9 : (7'h43)))),
              wire9});
          reg13 <= wire11;
        end
      reg14 <= (wire9 ~^ (reg12[(4'hb):(3'h4)] ?
          reg12 : (~|(^wire8[(3'h4):(2'h2)]))));
      reg15 <= (^~((~&{$signed(wire9), reg13[(3'h4):(2'h3)]}) ?
          ((~&(8'had)) - ((~|wire11) ?
              wire11[(3'h6):(3'h5)] : $signed((8'hac)))) : $unsigned({(8'h9d)})));
      reg16 <= $signed(((wire8[(5'h14):(5'h11)] ?
              {$unsigned(reg12), {(7'h44)}} : (!(reg12 ? wire8 : reg12))) ?
          (^wire10) : ((reg12 ? $signed(wire11) : wire8[(4'h9):(2'h3)]) ?
              ((wire8 ? wire7 : wire10) & (~|reg14)) : ($unsigned(wire10) ?
                  reg12 : wire11))));
    end
  module17 #() modinst41 (wire40, clk, wire11, reg15, wire8, reg14, wire10);
  module42 #() modinst79 (wire78, clk, wire8, wire10, wire7, reg14, reg16);
  assign wire80 = (~^$unsigned(wire10));
  assign wire81 = $unsigned(wire80);
  assign wire82 = ((-(8'ha8)) ^~ {wire81[(3'h7):(1'h0)],
                      wire80[(4'hc):(4'h9)]});
  assign wire83 = wire7;
  assign wire84 = wire7;
  assign wire85 = wire82[(4'hc):(4'hc)];
  assign wire86 = $signed({wire8[(5'h13):(2'h3)]});
  module87 #() modinst128 (.clk(clk), .wire88(wire86), .wire89(wire84), .wire91(wire80), .y(wire127), .wire92(wire7), .wire90(wire83));
  assign wire129 = (~wire86);
  assign wire130 = wire78;
  assign wire131 = (wire7 ?
                       ((^(reg12 - wire8[(4'hb):(3'h7)])) * (~^reg13)) : wire85[(4'h9):(1'h0)]);
  assign wire132 = ($signed($unsigned(reg14)) << $signed($unsigned({(-(8'h9d))})));
  module133 #() modinst146 (wire145, clk, wire81, wire131, wire11, wire130, wire83);
  always
    @(posedge clk) begin
      reg147 <= wire80[(4'hd):(4'hd)];
      reg148 <= wire78[(4'h9):(2'h3)];
      reg149 <= $signed((wire10[(4'hd):(3'h4)] <= {{wire8[(5'h13):(1'h0)],
              (reg15 ? wire84 : (8'hbd))},
          (reg14 != (8'hae))}));
    end
  assign wire150 = (reg12 ?
                       ((~^$signed((reg147 <<< wire78))) ^ wire85[(3'h6):(1'h1)]) : (^~wire86));
endmodule

module module133  (y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire138;
  input wire [(3'h6):(1'h0)] wire137;
  input wire signed [(3'h6):(1'h0)] wire136;
  input wire signed [(4'hf):(1'h0)] wire135;
  input wire [(4'h9):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire signed [(3'h4):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire139;
  assign y = {wire144, wire143, wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = wire135;
  assign wire140 = (($unsigned((wire137[(2'h3):(1'h1)] | $unsigned((8'hb7)))) ?
                           ((!((8'hb8) <<< wire138)) > (^$signed(wire135))) : $unsigned(((wire137 != wire136) ?
                               wire134 : wire138[(4'hd):(3'h7)]))) ?
                       $signed((wire138[(4'ha):(3'h4)] >>> wire139[(3'h6):(1'h1)])) : $signed({$unsigned($unsigned(wire137)),
                           $unsigned((wire135 ? wire136 : wire136))}));
  assign wire141 = ((~|({$signed(wire140)} ?
                       {(wire136 ? wire137 : wire138),
                           (wire138 || wire138)} : {wire134[(3'h6):(1'h1)]})) ^ (($unsigned((^~(7'h40))) ?
                           (wire136[(2'h3):(2'h3)] ~^ $unsigned(wire137)) : $signed(wire139)) ?
                       $signed($signed($unsigned(wire135))) : {{$signed(wire136),
                               (wire137 <<< wire139)}}));
  assign wire142 = (~$unsigned(((!(wire136 ? wire141 : (8'haf))) ?
                       wire134 : $signed($signed(wire140)))));
  assign wire143 = $signed($signed(wire141));
  assign wire144 = wire137;
endmodule

module module87
#(parameter param126 = (~&(&(^~(~&(|(8'hb7)))))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(5'h15):(1'h0)] wire91;
  input wire signed [(5'h11):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire [(4'h8):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire106,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 reg108,
                 reg107,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= (^$unsigned($unsigned($unsigned($unsigned(wire92)))));
      reg94 <= wire88[(1'h0):(1'h0)];
    end
  assign wire95 = $unsigned($unsigned(((~|reg93) ?
                      reg94[(4'h8):(3'h5)] : ($unsigned(reg94) ?
                          ((8'hb3) < reg93) : $unsigned(wire89)))));
  assign wire96 = $unsigned(wire92);
  assign wire97 = ($signed($unsigned(wire91)) << wire96[(4'he):(3'h7)]);
  assign wire98 = {$unsigned({((wire89 ? wire89 : reg93) ?
                              wire89[(2'h3):(2'h3)] : wire97)})};
  assign wire99 = (-reg93[(1'h1):(1'h0)]);
  assign wire100 = {(+(~wire98[(2'h3):(1'h0)])),
                       {(-(wire99[(3'h5):(1'h0)] ?
                               $unsigned((8'hba)) : (wire96 ?
                                   wire99 : wire90)))}};
  assign wire101 = ($unsigned((^~$signed((wire99 ?
                       (8'haa) : wire90)))) > $unsigned(({$unsigned(reg94),
                       wire99[(1'h0):(1'h0)]} >> ((8'h9f) ?
                       $signed(wire89) : (7'h44)))));
  assign wire102 = ($unsigned((7'h44)) > $unsigned((reg93 >> ((~&wire92) ?
                       {(8'had), wire101} : wire100))));
  assign wire103 = {wire91, {$signed(wire90[(4'hc):(3'h7)])}};
  assign wire104 = wire103[(2'h2):(1'h0)];
  assign wire105 = (reg94 ?
                       wire100 : (((8'hb4) ?
                               {wire88, wire100} : $unsigned((wire103 ?
                                   wire91 : wire92))) ?
                           wire97 : ((|(wire97 ^~ wire95)) ?
                               (~(wire96 ?
                                   reg93 : wire91)) : $unsigned((^wire104)))));
  assign wire106 = wire91;
  always
    @(posedge clk) begin
      if (((wire97[(2'h3):(1'h0)] ?
              {{wire103[(4'h9):(3'h7)]}} : ((&(!(8'ha0))) >> {(wire91 ?
                      wire95 : wire98)})) ?
          (|$signed(((8'h9c) != (^wire89)))) : (wire98[(2'h2):(1'h1)] ?
              ($unsigned((wire99 ? wire102 : reg94)) ?
                  $unsigned((^~wire97)) : $unsigned(((8'ha7) && wire90))) : wire96[(4'ha):(4'h9)])))
        begin
          if ((~(^~(wire89 ? wire105[(3'h5):(1'h0)] : (+{wire89})))))
            begin
              reg107 <= (^~wire98);
              reg108 <= $unsigned(({(8'h9d)} ?
                  (+wire89) : $unsigned((wire97[(3'h4):(1'h0)] ?
                      $signed(wire102) : (7'h44)))));
              reg109 <= {$signed((+$unsigned((8'ha1))))};
              reg110 <= $unsigned(($signed((!$unsigned(reg107))) >> ($unsigned((wire97 >> wire90)) ?
                  $unsigned((wire104 <= (8'hb8))) : wire92[(2'h2):(1'h0)])));
            end
          else
            begin
              reg107 <= wire102;
              reg108 <= wire104;
              reg109 <= wire92;
            end
          reg111 <= ({((!wire95[(2'h2):(1'h1)]) ?
                      (+{reg93}) : ((~^wire100) ?
                          $signed(reg110) : (wire103 ? wire92 : wire104))),
                  wire100} ?
              (~|wire90) : $signed($signed($unsigned((wire100 ~^ wire92)))));
        end
      else
        begin
          reg107 <= reg111[(2'h3):(1'h1)];
        end
      reg112 <= (~^(reg108[(2'h3):(2'h3)] * $signed((~|{(8'ha3), wire105}))));
      reg113 <= ((~|($unsigned((|wire95)) <= ($signed(wire88) ?
          (reg94 ?
              reg110 : (8'h9d)) : $unsigned(reg111)))) > $signed(wire96[(4'he):(2'h3)]));
      reg114 <= ((wire105[(3'h7):(1'h1)] ? wire90[(3'h4):(3'h4)] : wire96) ?
          wire89[(1'h1):(1'h1)] : $signed((7'h42)));
    end
  always
    @(posedge clk) begin
      reg115 <= $signed($unsigned($unsigned(($signed(wire104) >= {wire99,
          wire96}))));
      reg116 <= $signed({(wire89 >= (~reg107[(3'h4):(2'h3)]))});
      if (wire98[(2'h2):(2'h2)])
        begin
          reg117 <= ({(((!wire95) ? $signed(reg93) : $unsigned(reg94)) ?
                  wire95 : wire89),
              (7'h40)} - wire97[(1'h0):(1'h0)]);
          if (({(8'hbf)} ?
              (wire92 ?
                  wire89 : $unsigned($unsigned((reg109 ?
                      wire106 : wire105)))) : $signed((|(&wire101)))))
            begin
              reg118 <= $unsigned((~&wire102[(3'h7):(3'h7)]));
              reg119 <= (8'hb4);
              reg120 <= $unsigned(($signed(((reg93 >= reg110) ?
                  ((8'ha3) ?
                      reg112 : reg94) : (!(7'h42)))) >= {(~|reg113[(4'h8):(3'h7)])}));
              reg121 <= $unsigned(reg120);
              reg122 <= $unsigned(($unsigned($signed({reg114,
                  (8'hb4)})) & $signed((~(^~reg108)))));
            end
          else
            begin
              reg118 <= wire103;
              reg119 <= (|$signed({$unsigned($unsigned(wire105))}));
            end
          reg123 <= ((reg94[(2'h2):(2'h2)] ?
              $unsigned(wire105[(4'h9):(1'h1)]) : (reg111[(4'hc):(3'h7)] ?
                  wire98 : reg111)) <= wire90[(4'hd):(4'ha)]);
          reg124 <= ($unsigned($signed(({reg115,
              wire103} <<< (~reg107)))) ^ reg123);
          reg125 <= (reg113 ?
              reg112 : ((wire105[(1'h0):(1'h0)] > (wire90[(4'h9):(4'h8)] ?
                  $signed(wire103) : $unsigned(reg123))) ~^ $signed($unsigned((!reg121)))));
        end
      else
        begin
          reg117 <= wire95[(1'h0):(1'h0)];
          reg118 <= $signed((^($unsigned((reg123 ? (8'ha4) : reg107)) ?
              (+wire104) : reg94)));
        end
    end
endmodule

module module42
#(parameter param77 = {(!({(+(8'hb1)), ((8'hb0) ? (8'had) : (8'ha6))} ? (~|(|(8'hab))) : (+{(8'hb0), (8'ha5)}))), ((~(-((8'ha7) ? (8'hb3) : (8'hb2)))) ? ((~|(^(8'ha4))) ~^ ({(7'h44), (8'haa)} << ((8'ha8) > (8'ha2)))) : ({((8'hb4) | (8'hb2))} ? (((7'h44) ? (8'hb1) : (8'hbb)) ? (~^(8'ha9)) : ((8'hb5) << (8'haa))) : ((|(8'hb0)) > {(8'ha5), (8'hb1)})))})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire signed [(5'h15):(1'h0)] wire44;
  input wire [(3'h5):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire50,
                 wire49,
                 wire48,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
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
                 (1'h0)};
  assign wire48 = (~^$signed(($signed((-wire45)) ?
                      ((wire46 ^ wire43) ?
                          (wire47 << wire46) : ((8'h9d) | wire47)) : ($unsigned(wire45) > (wire45 < (8'had))))));
  assign wire49 = (!wire44[(3'h7):(3'h6)]);
  assign wire50 = wire43;
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          reg51 <= (wire47 ? wire48 : wire44);
          reg52 <= wire43;
          if ($signed({(8'ha4),
              (($unsigned(wire50) ?
                  (wire49 ^ wire49) : $unsigned(reg51)) >> wire45[(3'h4):(1'h0)])}))
            begin
              reg53 <= ((~($unsigned(wire50[(3'h6):(2'h2)]) ?
                  {wire43[(3'h5):(2'h3)],
                      {reg51}} : $unsigned({wire49}))) | (~^wire50[(3'h6):(3'h4)]));
            end
          else
            begin
              reg53 <= (reg53[(4'hd):(3'h5)] ?
                  $signed($unsigned(reg53)) : (((~&$signed(wire43)) << $signed((~(8'ha4)))) ?
                      wire46 : wire46));
              reg54 <= wire49;
            end
          reg55 <= (&{wire49[(3'h4):(2'h3)], reg51});
          if (($signed((($unsigned(reg55) ? $signed(wire50) : reg54) ?
                  ($signed((8'hbc)) ?
                      (|wire45) : $unsigned(reg54)) : (-((8'hbe) ?
                      wire47 : wire43)))) ?
              wire48 : $unsigned($unsigned(wire47))))
            begin
              reg56 <= {wire45};
              reg57 <= $signed($signed(wire46[(1'h0):(1'h0)]));
            end
          else
            begin
              reg56 <= reg53[(3'h5):(1'h0)];
              reg57 <= wire45;
              reg58 <= $unsigned($signed(reg55));
              reg59 <= $signed((+(~&reg58[(4'ha):(3'h5)])));
              reg60 <= wire47[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg51 <= wire45;
          reg52 <= $signed((8'hba));
          reg53 <= $signed(((^~$signed(reg55)) + $unsigned(((reg53 >>> wire47) ~^ (~&wire44)))));
          reg54 <= $signed($unsigned(reg60));
        end
      reg61 <= (~&$signed((&reg57)));
      reg62 <= $signed((8'h9c));
      if ({(&wire47)})
        begin
          if ((-$unsigned((|(reg56 || (wire48 + reg54))))))
            begin
              reg63 <= $unsigned(reg53[(1'h0):(1'h0)]);
            end
          else
            begin
              reg63 <= $signed((~wire48[(2'h3):(1'h1)]));
              reg64 <= reg60;
              reg65 <= reg60[(1'h1):(1'h1)];
              reg66 <= (^~(((reg58[(3'h6):(1'h1)] >= {reg62}) ?
                  ($signed(wire48) || (8'ha7)) : $unsigned((reg55 ?
                      reg53 : reg65))) << reg52));
            end
          if (wire48)
            begin
              reg67 <= $unsigned(wire44[(3'h5):(2'h2)]);
              reg68 <= ((($signed(wire43[(3'h4):(1'h0)]) ^ wire43[(2'h3):(2'h3)]) ?
                  (^(~|(~wire48))) : $unsigned($signed(reg60[(3'h6):(1'h0)]))) << (reg54[(4'hb):(2'h3)] ?
                  (reg64 ?
                      wire43[(3'h4):(1'h0)] : reg53[(2'h2):(2'h2)]) : wire47[(1'h0):(1'h0)]));
              reg69 <= wire48;
            end
          else
            begin
              reg67 <= {{{($signed(reg54) ? (~&(8'hbf)) : $signed(wire49)),
                          ($signed(wire45) ? {reg57} : wire44)},
                      $unsigned({wire50})}};
              reg68 <= ($unsigned(($signed(reg59[(1'h1):(1'h0)]) ?
                  ({(7'h42),
                      reg67} < $unsigned(reg67)) : wire43)) != {$unsigned({(reg63 ?
                          wire48 : reg58),
                      {(8'ha3), wire47}})});
            end
        end
      else
        begin
          reg63 <= ({$signed(reg52)} ?
              reg64 : $signed(((^$signed(reg62)) ?
                  {(wire49 ? reg67 : reg55)} : $signed((wire44 ?
                      wire43 : wire43)))));
          reg64 <= reg57[(4'hb):(3'h4)];
          reg65 <= $unsigned($signed((|((reg65 ? reg60 : wire49) ?
              reg67[(3'h7):(3'h6)] : {reg69}))));
        end
    end
  assign wire70 = ($signed(reg67[(4'ha):(4'h9)]) < $signed(wire48[(3'h4):(1'h1)]));
  assign wire71 = $signed(($signed(wire70[(4'hc):(2'h3)]) <<< (^~reg55[(3'h4):(1'h0)])));
  assign wire72 = $signed($unsigned($signed(reg67)));
  assign wire73 = $unsigned($unsigned((~reg63[(4'ha):(2'h2)])));
  assign wire74 = (reg67[(4'ha):(4'h8)] ~^ $unsigned((&$unsigned($unsigned((8'h9f))))));
  assign wire75 = $signed(((reg52 <= ($signed((8'ha6)) ?
                          (wire49 ? reg65 : wire71) : (|wire43))) ?
                      wire71 : (wire72[(1'h0):(1'h0)] ?
                          {(wire48 >= wire71)} : (+$unsigned(reg62)))));
  assign wire76 = (wire47[(2'h3):(2'h2)] ?
                      wire72 : $signed(($signed(((8'ha6) <<< wire43)) ?
                          $signed(reg51[(1'h1):(1'h0)]) : $unsigned((8'ha1)))));
endmodule

module module17
#(parameter param38 = ((~^(8'hbb)) - (~^((^~((8'hb3) * (7'h43))) ? (((8'hab) != (8'ha9)) ? ((8'ha6) ? (8'ha2) : (8'hae)) : ((7'h40) ? (8'ha1) : (8'hb7))) : ((~(8'h9f)) & ((8'haa) ? (8'hb3) : (8'ha0)))))), 
parameter param39 = param38)
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire23;
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire23,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = wire18;
  always
    @(posedge clk) begin
      if ($signed(wire20))
        begin
          if ((8'hae))
            begin
              reg24 <= ($signed($unsigned($unsigned(wire20))) ?
                  wire22[(3'h7):(3'h7)] : wire20);
              reg25 <= ((&$unsigned(reg24[(4'h9):(1'h0)])) << (|wire22));
              reg26 <= {(wire18[(3'h5):(3'h4)] ?
                      (+(~(wire23 * wire21))) : $unsigned(($unsigned(wire20) ~^ (&reg24)))),
                  ($unsigned(wire23) ?
                      (($unsigned((8'hbe)) <= wire22[(3'h4):(3'h4)]) | (reg24[(3'h4):(1'h1)] ?
                          (wire22 ?
                              reg25 : wire20) : $signed(wire18))) : $unsigned((~&(wire22 ?
                          reg25 : wire21))))};
              reg27 <= wire20[(2'h2):(1'h0)];
              reg28 <= (wire20 ?
                  ((&(wire22[(1'h0):(1'h0)] ?
                      (wire21 << wire20) : reg24)) != wire22[(3'h4):(3'h4)]) : (!$unsigned(((-wire23) ?
                      (^wire22) : (|wire23)))));
            end
          else
            begin
              reg24 <= (($signed({$signed(wire18)}) ?
                  $unsigned({(-wire18),
                      (&(8'haa))}) : $signed({$unsigned(wire19)})) - wire22);
            end
        end
      else
        begin
          reg24 <= reg28;
          reg25 <= $unsigned(((&{$unsigned((8'hba))}) <= $unsigned($signed((reg25 ^ reg24)))));
          reg26 <= wire22[(2'h2):(1'h1)];
          reg27 <= reg28;
          reg28 <= {($signed((~|wire20[(2'h3):(1'h0)])) || $unsigned(reg28[(1'h1):(1'h1)])),
              {$signed(wire21)}};
        end
      if ($unsigned((&$signed($unsigned((wire18 < wire18))))))
        begin
          reg29 <= $signed(reg24);
          reg30 <= ((^reg25) ?
              (reg29[(4'h8):(1'h1)] ?
                  $signed($signed({wire19,
                      reg29})) : wire20) : wire18[(2'h2):(1'h0)]);
          if ((|(^(|(reg30[(4'hb):(3'h7)] * reg29[(3'h5):(3'h5)])))))
            begin
              reg31 <= ($unsigned({$unsigned(reg24[(2'h3):(1'h1)]),
                      (^(wire18 ? reg28 : wire23))}) ?
                  (reg25[(3'h6):(3'h6)] ?
                      reg24 : ({{(8'hb4)}} <= {(~|wire21)})) : ((!$unsigned($unsigned((8'hb8)))) >>> wire23));
              reg32 <= wire21[(2'h2):(2'h2)];
              reg33 <= ((-(|$unsigned((+wire21)))) < (^~reg29));
              reg34 <= $unsigned($signed($signed(reg27)));
            end
          else
            begin
              reg31 <= reg28[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg29 <= reg27[(3'h6):(3'h6)];
          reg30 <= $unsigned(reg29[(3'h6):(2'h3)]);
          reg31 <= (&reg28);
          reg32 <= wire18[(1'h0):(1'h0)];
          reg33 <= (8'hb5);
        end
      reg35 <= (|$unsigned({wire20}));
    end
  assign wire36 = (+$signed((8'hb7)));
  assign wire37 = wire19;
endmodule
