module top
#(parameter param225 = (~&(((((8'ha0) ? (7'h40) : (8'hac)) - {(8'hac), (8'ha1)}) ? (8'had) : (((8'ha5) != (8'h9f)) ? ((8'ha4) <= (8'hbf)) : ((8'hbc) > (8'hab)))) <<< ((((8'hb0) ? (8'h9e) : (8'ha6)) > (|(8'ha7))) ? ((~&(8'ha4)) <<< (~^(8'ha9))) : ({(8'haa), (8'hbf)} ? ((8'hb1) ? (8'hac) : (8'ha9)) : ((8'h9c) ? (7'h40) : (8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire224;
  wire signed [(4'hc):(1'h0)] wire210;
  wire signed [(5'h13):(1'h0)] wire208;
  wire signed [(5'h11):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire206;
  wire signed [(4'hb):(1'h0)] wire205;
  wire signed [(5'h15):(1'h0)] wire204;
  wire [(3'h4):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire141;
  wire [(5'h13):(1'h0)] wire197;
  wire [(5'h13):(1'h0)] wire212;
  wire [(3'h5):(1'h0)] wire213;
  wire [(5'h11):(1'h0)] wire214;
  wire [(3'h6):(1'h0)] wire215;
  wire [(3'h4):(1'h0)] wire216;
  wire signed [(4'he):(1'h0)] wire217;
  wire [(4'hc):(1'h0)] wire218;
  wire signed [(4'he):(1'h0)] wire219;
  wire [(3'h5):(1'h0)] wire220;
  wire signed [(4'hb):(1'h0)] wire221;
  wire signed [(4'ha):(1'h0)] wire222;
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  assign y = {wire224,
                 wire210,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire141,
                 wire197,
                 wire212,
                 wire213,
                 wire214,
                 wire215,
                 wire216,
                 wire217,
                 wire218,
                 wire219,
                 wire220,
                 wire221,
                 wire222,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 (1'h0)};
  module4 #() modinst142 (.wire6(wire2), .wire5(wire0), .wire8(wire1), .clk(clk), .y(wire141), .wire7(wire3));
  module143 #() modinst198 (wire197, clk, wire1, wire0, wire2, wire3, wire141);
  always
    @(posedge clk) begin
      reg199 <= (~$signed(wire2));
      reg200 <= ({(~^$unsigned((+wire1))),
          (((wire3 ? wire197 : wire141) ? $signed(wire0) : wire1) ?
              ($unsigned(wire1) ?
                  (wire1 >= reg199) : wire141[(2'h3):(1'h0)]) : (wire197 ^ wire3[(3'h5):(2'h3)]))} > $signed(({$unsigned(wire197)} ?
          (~(wire0 <<< wire141)) : ($signed(wire197) ?
              (wire0 ? wire0 : wire197) : $unsigned(wire2)))));
      reg201 <= ((&(wire3 & $unsigned(((8'ha8) >>> (8'h9f))))) && $signed(((~^$signed(wire0)) | reg199[(3'h7):(3'h6)])));
      reg202 <= wire0;
    end
  assign wire203 = $unsigned(wire0[(5'h14):(1'h1)]);
  assign wire204 = reg201[(5'h12):(4'h8)];
  assign wire205 = (^wire0[(4'he):(2'h3)]);
  assign wire206 = (~$signed(reg202[(1'h1):(1'h1)]));
  assign wire207 = {{$unsigned((~&wire0[(4'hd):(4'hd)]))}};
  module4 #() modinst209 (.wire6(reg199), .y(wire208), .clk(clk), .wire8(wire3), .wire5(wire204), .wire7(reg202));
  module4 #() modinst211 (.y(wire210), .wire6(wire207), .wire5(wire0), .wire7(reg199), .clk(clk), .wire8(wire208));
  assign wire212 = {($signed(wire203[(3'h4):(2'h3)]) ? wire205 : wire203)};
  assign wire213 = {wire197};
  assign wire214 = (reg201[(3'h7):(2'h3)] ?
                       ($unsigned(($unsigned(wire212) ?
                               (~&wire213) : $unsigned(wire208))) ?
                           (wire3 == $unsigned((8'hbf))) : (((wire204 >>> wire197) ?
                                   $signed(wire204) : ((8'ha4) <= reg201)) ?
                               wire206 : (8'haa))) : ((~$signed((wire1 ?
                               wire212 : wire208))) ?
                           reg202 : reg199));
  assign wire215 = wire2[(3'h5):(3'h4)];
  assign wire216 = (-({$signed((wire206 ? (8'hb7) : wire197)),
                       $unsigned($unsigned(wire205))} ^~ (((wire208 ?
                           wire2 : wire208) ?
                       (wire212 + reg200) : (!wire2)) > (^{(8'hbc)}))));
  assign wire217 = $signed((wire207 < {$unsigned({wire216})}));
  assign wire218 = wire210[(4'h8):(1'h1)];
  assign wire219 = {$signed($unsigned((wire206[(5'h10):(5'h10)] >> $unsigned(wire0))))};
  assign wire220 = reg201[(1'h1):(1'h0)];
  assign wire221 = ((+$signed({$unsigned(wire2),
                       $signed(wire1)})) == reg202[(4'h8):(2'h2)]);
  module161 #() modinst223 (wire222, clk, wire204, wire141, wire218, wire221, wire210);
  assign wire224 = {(+{((-wire3) - wire213[(1'h0):(1'h0)]),
                           (wire203 >= wire2[(2'h3):(2'h3)])})};
endmodule

module module143  (y, clk, wire144, wire145, wire146, wire147, wire148);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire144;
  input wire [(5'h15):(1'h0)] wire145;
  input wire [(3'h6):(1'h0)] wire146;
  input wire [(5'h13):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire196;
  wire signed [(5'h15):(1'h0)] wire195;
  wire signed [(3'h4):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire192;
  wire signed [(4'he):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire [(5'h11):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire183;
  wire [(4'he):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire181;
  reg signed [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(3'h5):(1'h0)] reg186 = (1'h0);
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire184,
                 wire183,
                 wire149,
                 wire150,
                 wire151,
                 wire158,
                 wire159,
                 wire160,
                 wire181,
                 reg187,
                 reg186,
                 reg185,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire149 = (({$unsigned(wire146)} + wire145) & $unsigned(wire144));
  assign wire150 = (((8'hab) ?
                           (8'ha3) : ($signed(wire148[(3'h4):(3'h4)]) ?
                               (^(+wire149)) : $signed(wire145[(4'h8):(1'h1)]))) ?
                       (wire146 ?
                           $signed($unsigned(wire147)) : wire144) : (~(8'ha8)));
  assign wire151 = $unsigned(wire149[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      if ((+$signed(wire150[(1'h0):(1'h0)])))
        begin
          reg152 <= (-(!($signed(wire148[(2'h3):(2'h3)]) ?
              wire149[(1'h0):(1'h0)] : wire149)));
          if (wire146[(1'h1):(1'h0)])
            begin
              reg153 <= ((~^$unsigned($unsigned((+wire151)))) >> $signed($unsigned(wire145[(3'h4):(2'h2)])));
              reg154 <= reg152[(2'h3):(2'h3)];
              reg155 <= {wire148};
              reg156 <= wire145;
              reg157 <= wire144[(3'h5):(1'h1)];
            end
          else
            begin
              reg153 <= $signed(wire147);
              reg154 <= (~&$unsigned(wire149[(3'h5):(1'h1)]));
              reg155 <= wire148[(3'h5):(2'h2)];
            end
        end
      else
        begin
          reg152 <= (^~$signed(wire147[(5'h11):(4'h8)]));
          reg153 <= $unsigned(reg154);
        end
    end
  assign wire158 = ((((^wire148[(1'h1):(1'h1)]) >>> (!reg153)) || wire150[(4'he):(4'h9)]) != $unsigned((((8'hb5) ?
                           $unsigned(wire144) : reg157[(4'ha):(3'h5)]) ?
                       $signed((^reg155)) : $signed(wire144))));
  assign wire159 = $signed((wire147 ?
                       (~|((+wire145) ?
                           (wire148 ?
                               wire147 : wire146) : reg157[(4'hb):(4'h8)])) : reg154));
  assign wire160 = $unsigned(wire158);
  module161 #() modinst182 (wire181, clk, wire145, reg154, wire144, wire149, reg155);
  assign wire183 = {{$unsigned(((~|(8'ha7)) ? (~&reg152) : $signed((8'had))))}};
  assign wire184 = wire181;
  always
    @(posedge clk) begin
      reg185 <= ((wire160 ?
              wire160 : (({wire184, wire151} ?
                      $signed(wire146) : (wire149 ? reg154 : wire183)) ?
                  reg152 : $signed(wire159))) ?
          $unsigned((($unsigned((8'h9d)) <<< {reg154}) ?
              reg152 : (8'hb0))) : wire150);
      reg186 <= wire147;
      reg187 <= $unsigned($unsigned($unsigned(wire160)));
    end
  assign wire188 = ($signed($signed(wire183[(2'h3):(1'h1)])) != ($unsigned((^reg185[(1'h0):(1'h0)])) << $unsigned((!(wire147 ?
                       wire184 : reg185)))));
  assign wire189 = $signed({$signed(($unsigned((8'h9f)) ?
                           $unsigned(wire149) : reg154))});
  assign wire190 = $signed(($unsigned($signed(wire188[(1'h1):(1'h0)])) + $unsigned(($signed(reg155) ?
                       (~&reg152) : $unsigned(reg154)))));
  assign wire191 = wire181;
  assign wire192 = {$unsigned($unsigned(wire149[(4'hd):(3'h6)])),
                       reg157[(4'hb):(3'h5)]};
  assign wire193 = (wire144 ? wire159[(1'h1):(1'h0)] : (reg185 <= wire149));
  assign wire194 = {(&(~(wire148 ? (~&wire148) : (~&reg186)))),
                       $unsigned($unsigned((wire147 <<< wire183[(2'h3):(1'h1)])))};
  assign wire195 = (((~&$signed(wire160)) < (reg153 << (reg154[(4'h9):(2'h2)] != (wire160 ?
                           reg156 : wire184)))) ?
                       $unsigned((reg153[(1'h0):(1'h0)] == ((8'ha4) - reg185))) : (reg186[(2'h3):(1'h1)] ?
                           $signed(reg186[(1'h1):(1'h1)]) : wire159[(1'h1):(1'h1)]));
  assign wire196 = (^$unsigned($unsigned((reg152 < (!reg153)))));
endmodule

module module4
#(parameter param139 = ((^{((&(8'ha4)) ? ((8'hbb) ? (8'hb7) : (8'hb4)) : {(8'hab), (8'hbd)})}) >> {((-((8'hb2) != (8'h9f))) ? (((8'hab) <<< (7'h43)) ? ((8'hb5) ? (8'ha0) : (7'h44)) : (^~(8'hb6))) : (((8'ha8) ? (8'h9c) : (8'ha4)) ^ (~|(8'hb1))))}), 
parameter param140 = ((((~(param139 ? param139 : param139)) & (param139 ? (8'hb3) : (param139 ~^ param139))) > (((^~param139) ? {param139} : (!param139)) + param139)) ? (-(+param139)) : {(8'ha7)}))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(3'h4):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire132;
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire82,
                 wire9,
                 wire132,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire9 = wire6[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg10 <= $unsigned({wire7});
      if ((&($signed({wire5}) ?
          $unsigned((+$unsigned(wire7))) : ((^(reg10 || wire9)) ?
              (wire8 ?
                  $signed(reg10) : $unsigned(wire9)) : $unsigned($unsigned(wire6))))))
        begin
          reg11 <= (!(wire8[(1'h1):(1'h1)] ^ (reg10 | $unsigned((wire9 ?
              wire7 : wire6)))));
          reg12 <= $unsigned(reg10[(2'h2):(1'h0)]);
          if ({($unsigned($unsigned((wire9 <= reg10))) ?
                  reg10[(1'h0):(1'h0)] : reg12)})
            begin
              reg13 <= ($signed($unsigned(($signed(reg10) >> (wire5 + wire9)))) >> {wire9});
            end
          else
            begin
              reg13 <= (((~^reg12[(3'h4):(2'h2)]) ^~ reg10) ?
                  reg11 : {$signed(wire9)});
              reg14 <= ((~$unsigned((wire5[(1'h0):(1'h0)] ^ wire5))) ^~ ($signed((|$signed(wire5))) ?
                  $signed($unsigned((reg13 >>> (7'h40)))) : ($signed($signed(wire8)) == reg11[(5'h14):(3'h6)])));
            end
          reg15 <= (({{(&(8'hbe))}} != reg12[(4'hc):(3'h4)]) ?
              ((reg13[(2'h2):(1'h0)] + wire5[(1'h1):(1'h1)]) ?
                  $unsigned({(reg10 ^ wire9),
                      $signed(reg13)}) : $unsigned($signed((wire6 ?
                      wire7 : reg12)))) : wire9[(3'h4):(3'h4)]);
        end
      else
        begin
          reg11 <= ((|((((8'hb8) ?
              wire8 : (8'ha3)) << reg10[(2'h3):(1'h0)]) <= (~(reg15 || (7'h40))))) >>> $signed(wire7));
          reg12 <= $signed($unsigned(reg15[(3'h4):(1'h0)]));
          if ($signed((wire9[(4'hc):(3'h4)] ? (7'h42) : (8'ha6))))
            begin
              reg13 <= reg15;
              reg14 <= (|reg10);
              reg15 <= $signed(($signed(reg15) <<< $signed($unsigned($unsigned(wire9)))));
              reg16 <= (((!(8'ha5)) ?
                  {$unsigned((~reg12))} : $unsigned((|(^~reg10)))) >> (~^(~&reg12[(4'hc):(4'h8)])));
            end
          else
            begin
              reg13 <= {reg15};
              reg14 <= ((~|reg13) && reg10[(4'he):(3'h5)]);
              reg15 <= {$signed($unsigned(reg13)),
                  (($signed($unsigned(wire9)) <= reg15[(2'h2):(1'h0)]) ?
                      {$unsigned((reg12 - wire9)),
                          wire8} : (&$signed($unsigned(reg10))))};
            end
        end
      reg17 <= reg11[(4'hc):(2'h2)];
    end
  module18 #() modinst83 (wire82, clk, wire5, reg15, reg14, reg17);
  module84 #() modinst133 (wire132, clk, wire9, reg11, reg16, reg15, reg17);
  assign wire134 = (~&wire82[(4'h8):(1'h0)]);
  assign wire135 = (8'h9c);
  assign wire136 = wire9;
  assign wire137 = {(reg10[(4'hb):(4'h8)] ?
                           wire7[(4'ha):(1'h0)] : $signed(reg11[(1'h0):(1'h0)]))};
  assign wire138 = $unsigned({reg11,
                       (~|((reg15 ? (8'hb0) : (8'ha0)) ?
                           $signed(reg12) : (!reg12)))});
endmodule

module module84  (y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire89;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire [(4'h9):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire90;
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  assign y = {wire131,
                 wire130,
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
                 wire117,
                 wire116,
                 wire90,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire90 = $signed({wire89, wire89});
  always
    @(posedge clk) begin
      if (wire89[(2'h2):(2'h2)])
        begin
          reg91 <= (wire89 ? wire89[(2'h2):(1'h0)] : wire87);
          if (((reg91[(1'h0):(1'h0)] | $signed((^~wire90[(1'h1):(1'h0)]))) ?
              (|(~((~wire87) ?
                  $unsigned(wire86) : wire87[(1'h1):(1'h0)]))) : (wire88[(1'h0):(1'h0)] != (wire86 ?
                  (-$signed(wire88)) : $unsigned($unsigned((8'ha5)))))))
            begin
              reg92 <= (wire85 ?
                  $unsigned((+(8'haf))) : (((8'hb5) <= $signed(wire87)) ^ $unsigned(wire87[(2'h2):(2'h2)])));
              reg93 <= wire87[(4'h8):(1'h1)];
              reg94 <= {$unsigned($unsigned(($unsigned(wire87) ?
                      (wire85 == wire87) : $unsigned(reg93)))),
                  (wire87[(1'h1):(1'h1)] ?
                      {wire87[(4'h9):(2'h3)],
                          ((wire85 ? wire87 : wire88) ?
                              (+(8'hbb)) : $unsigned(wire88))} : $unsigned(wire87))};
              reg95 <= (($signed($signed($signed(reg91))) ?
                      $signed($unsigned({reg91})) : reg93) ?
                  (8'hb2) : reg91);
              reg96 <= (({$signed(wire86[(3'h5):(2'h3)])} ?
                  reg95 : reg91) + $unsigned((reg93[(2'h3):(2'h2)] < ((reg93 ?
                      reg91 : (8'hbe)) ?
                  (reg93 ? (8'hbd) : reg93) : $unsigned((8'hb1))))));
            end
          else
            begin
              reg92 <= reg94;
              reg93 <= $signed((8'ha5));
            end
          reg97 <= reg95;
        end
      else
        begin
          reg91 <= wire87;
          reg92 <= $signed($signed($signed(({reg96} ?
              reg91[(1'h1):(1'h0)] : $signed((8'hb6))))));
          reg93 <= ($unsigned(wire86) ^ ($unsigned(wire88[(3'h4):(1'h0)]) ~^ (^{$unsigned(reg95)})));
          reg94 <= wire90;
        end
      reg98 <= $signed($signed((({wire87} ~^ (reg94 ?
          reg93 : reg93)) <= (wire90[(3'h4):(2'h2)] ? (|reg92) : (^~wire90)))));
      reg99 <= ((~^((!(~^wire90)) < ((wire88 ^ (8'hb5)) ?
              {(8'hba), reg94} : (wire86 < wire85)))) ?
          {reg91} : wire87);
      if (((~(&$signed({(8'ha3)}))) ^~ {(reg97 & reg99)}))
        begin
          reg100 <= (-reg92[(4'hd):(4'hd)]);
          if ($unsigned($unsigned($unsigned(reg91))))
            begin
              reg101 <= {(~|$signed(((~reg100) ?
                      $signed(wire90) : (reg97 > wire90)))),
                  $signed(wire88)};
              reg102 <= ($unsigned((wire86 ?
                      ((reg92 | reg94) ~^ (reg92 ? reg91 : reg101)) : wire90)) ?
                  (~wire88) : $signed((~reg97)));
              reg103 <= wire85[(3'h4):(2'h2)];
              reg104 <= ({((reg96[(4'hf):(4'h8)] ?
                          (!(8'hb3)) : {(8'ha8),
                              reg94}) >>> $unsigned(wire89[(1'h0):(1'h0)])),
                      (~$signed($unsigned(reg93)))} ?
                  wire90 : (8'hb3));
              reg105 <= reg104;
            end
          else
            begin
              reg101 <= ((reg92[(4'hf):(4'hb)] ?
                  reg105 : reg93[(2'h2):(1'h0)]) || (reg93[(2'h3):(1'h1)] ?
                  $unsigned($unsigned((8'hb7))) : $signed(reg95)));
              reg102 <= $signed($unsigned($unsigned((!{reg97, (8'hb2)}))));
              reg103 <= reg100;
            end
          reg106 <= $unsigned($unsigned((~^(|((8'ha8) ? wire89 : wire85)))));
          if ((!reg93[(2'h2):(1'h1)]))
            begin
              reg107 <= (&reg94[(5'h12):(4'he)]);
              reg108 <= reg92[(5'h12):(4'h9)];
              reg109 <= ($signed((&(~|$unsigned(reg97)))) ?
                  ($signed(reg94[(5'h14):(3'h7)]) ?
                      $signed(($unsigned((7'h44)) > reg97[(1'h0):(1'h0)])) : (|(wire90[(3'h4):(3'h4)] ?
                          reg101[(1'h0):(1'h0)] : {reg108}))) : (^~$unsigned((~|(-wire87)))));
              reg110 <= reg91[(3'h4):(1'h0)];
              reg111 <= $unsigned($signed((!($signed(reg99) > $signed(reg103)))));
            end
          else
            begin
              reg107 <= $signed((8'hba));
              reg108 <= (((~^reg93) && reg98[(3'h5):(2'h3)]) ?
                  (~(wire90 || ((reg110 * reg106) ?
                      reg108 : wire88))) : ($unsigned((^reg107)) ?
                      wire89 : $unsigned((+{reg103}))));
              reg109 <= (^~$signed($signed(wire90)));
              reg110 <= ({reg92} ? (&wire86) : reg108);
            end
          reg112 <= {({wire85[(3'h7):(3'h5)]} ?
                  ($unsigned(((8'hbc) ^~ reg107)) <<< reg98) : (((wire87 * (8'hbb)) - $signed(wire90)) ?
                      (~^wire85) : $signed(reg92[(3'h4):(1'h1)])))};
        end
      else
        begin
          reg100 <= $signed(($unsigned(reg110) - $unsigned(wire90[(3'h4):(1'h0)])));
          reg101 <= wire90[(2'h2):(1'h1)];
          reg102 <= ($signed(($signed(((8'ha3) ? reg111 : reg111)) ?
              (reg111[(4'hd):(4'ha)] ?
                  reg99[(3'h4):(1'h0)] : (wire89 ?
                      reg105 : reg112)) : $signed((reg110 * reg99)))) | reg107);
          reg103 <= reg100;
        end
      if (reg102[(5'h15):(5'h11)])
        begin
          reg113 <= (+(!($signed((reg109 ? wire85 : reg111)) ?
              $unsigned(((8'hb0) != reg94)) : reg94[(1'h1):(1'h1)])));
          reg114 <= reg102;
          reg115 <= reg111;
        end
      else
        begin
          reg113 <= wire90;
        end
    end
  assign wire116 = {({reg110,
                           ($signed(reg95) ?
                               wire90 : (reg106 && reg115))} << $signed(reg104))};
  assign wire117 = (((~|(8'ha9)) ?
                           $unsigned(reg91[(3'h5):(2'h2)]) : $signed($signed((reg91 ?
                               (8'hab) : reg106)))) ?
                       reg107[(3'h4):(1'h1)] : (^(($signed(reg92) != ((8'hbb) * (8'h9e))) < (reg94[(5'h11):(3'h6)] << {(8'hb8)}))));
  assign wire118 = $unsigned((-($signed((wire90 ? wire117 : reg108)) ?
                       {$signed(reg105), (+reg104)} : $unsigned(wire117))));
  assign wire119 = ($signed((+({(8'hb7)} ?
                           (wire88 ? wire86 : reg114) : $signed(reg104)))) ?
                       (reg109 * wire85[(3'h7):(3'h4)]) : reg99[(3'h5):(1'h1)]);
  assign wire120 = $unsigned(((^reg109[(2'h2):(1'h1)]) ~^ $signed($signed({reg105}))));
  assign wire121 = ({reg115[(2'h2):(1'h0)]} ?
                       ({$signed(((8'h9d) && reg97))} ?
                           wire89 : {(~^$signed(wire120))}) : ((reg114 ?
                           reg100 : (reg101 == (wire89 ?
                               reg108 : wire89))) != (({(8'hbd), reg98} ?
                           {reg100,
                               reg106} : $signed(wire116)) >>> reg92[(5'h11):(4'he)])));
  assign wire122 = reg112[(4'ha):(1'h0)];
  assign wire123 = $signed(wire121[(4'hb):(1'h1)]);
  assign wire124 = ((-$signed((-reg98))) + {(((reg108 >>> wire119) >>> (reg102 == reg91)) != $signed(reg91)),
                       ($unsigned((wire117 ? reg108 : reg93)) ^ (+((8'h9d) ?
                           reg114 : reg102)))});
  assign wire125 = (((reg104 ?
                           reg112 : ((wire121 ?
                               wire122 : wire121) <<< wire122)) ~^ $unsigned(wire124)) ?
                       {reg91} : $unsigned({(reg92 ?
                               wire121 : (wire123 ~^ reg94))}));
  assign wire126 = $unsigned(reg110[(4'hb):(3'h7)]);
  assign wire127 = ($signed(reg103[(2'h3):(1'h1)]) ?
                       reg95 : (($signed({reg105}) ?
                           (^(wire121 + reg113)) : (8'hae)) < {(~(&reg95)),
                           {reg109[(2'h2):(2'h2)], {reg101, wire118}}}));
  assign wire128 = $signed(reg91[(3'h7):(2'h3)]);
  assign wire129 = ((^reg95) ? $signed((8'ha8)) : (+(^~reg95)));
  assign wire130 = reg104;
  assign wire131 = wire124[(3'h6):(2'h2)];
endmodule

module module18
#(parameter param81 = (-{{(~((8'hb7) + (8'hbf))), ((~|(8'haf)) ^~ ((8'hbd) ? (8'ha2) : (8'ha5)))}}))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h2a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire23 = (wire19[(2'h2):(1'h0)] == ($unsigned((((8'hbd) ~^ (8'ha4)) ?
                      $unsigned((8'ha1)) : (wire19 == wire21))) - $unsigned((wire19 + wire20))));
  assign wire24 = $signed(wire23);
  assign wire25 = $signed($unsigned(wire24[(5'h10):(2'h3)]));
  assign wire26 = $signed($unsigned(wire25));
  assign wire27 = (~|wire21);
  assign wire28 = wire22;
  assign wire29 = ($signed({$unsigned(wire23), $unsigned({wire27})}) ?
                      $unsigned($unsigned(((wire22 * wire27) < (~|wire25)))) : wire28[(4'h9):(1'h1)]);
  assign wire30 = wire28;
  assign wire31 = ($signed(wire27[(4'h8):(3'h7)]) || (|$unsigned((wire20[(5'h14):(1'h0)] ?
                      (wire20 < wire30) : (8'hbc)))));
  assign wire32 = $signed((8'hab));
  assign wire33 = $unsigned({(&wire21[(2'h2):(2'h2)])});
  always
    @(posedge clk) begin
      reg34 <= ($signed((~&(wire31[(4'h8):(3'h5)] ?
          (8'hb4) : (wire33 << wire27)))) & $unsigned(wire23));
      reg35 <= $signed(wire32[(4'h8):(1'h0)]);
      if ($unsigned(wire27))
        begin
          reg36 <= (wire28 ?
              wire22 : $signed($signed(($unsigned(wire28) ?
                  wire23[(2'h2):(1'h1)] : wire33))));
          if (($unsigned($unsigned($unsigned((reg34 ?
              (8'hbd) : wire27)))) ~^ reg36))
            begin
              reg37 <= {($unsigned(wire26) ?
                      $signed($signed(wire27[(1'h0):(1'h0)])) : (-{{wire19}})),
                  $signed(($unsigned((wire28 <= wire20)) >= wire22))};
              reg38 <= (~^wire33);
              reg39 <= ({$signed($unsigned($signed(wire23))),
                      ($unsigned($unsigned(wire20)) ?
                          ((&(8'hba)) << (|wire25)) : $unsigned($unsigned(wire26)))} ?
                  $signed($signed((~^(^~wire24)))) : wire26[(3'h4):(2'h2)]);
              reg40 <= $unsigned($unsigned($unsigned($unsigned($signed(reg34)))));
              reg41 <= wire24;
            end
          else
            begin
              reg37 <= reg38[(4'hd):(4'h8)];
              reg38 <= reg41[(3'h5):(1'h1)];
            end
          if ($unsigned($signed($signed(wire31))))
            begin
              reg42 <= $unsigned(((((reg36 ? (7'h42) : wire26) ?
                          (reg41 + wire31) : (wire23 | wire29)) ?
                      wire19 : ((reg35 ? wire21 : (8'hba)) < (|wire20))) ?
                  $signed(($signed(reg34) && (~&reg35))) : wire21));
              reg43 <= (8'hb0);
              reg44 <= (wire29 ?
                  (reg42 < (((wire23 >= (8'hbd)) ^ (+reg41)) ?
                      $signed({reg39,
                          wire28}) : (8'ha9))) : reg41[(4'h8):(1'h0)]);
            end
          else
            begin
              reg42 <= (reg44[(2'h2):(2'h2)] != (wire27 & (!$unsigned($unsigned((8'hb2))))));
            end
          reg45 <= $signed(wire24);
          if (($signed(reg38[(3'h5):(2'h3)]) <= wire22[(4'hb):(2'h3)]))
            begin
              reg46 <= reg43[(3'h6):(1'h1)];
              reg47 <= $signed($unsigned((-$signed($unsigned(wire22)))));
            end
          else
            begin
              reg46 <= $signed((($unsigned($unsigned(wire30)) | $unsigned(wire20)) > (!(!(wire20 * wire20)))));
              reg47 <= $signed((wire19[(3'h5):(3'h5)] << $signed(reg40)));
              reg48 <= $signed((($signed($signed(wire21)) ?
                  (reg41 < $unsigned(wire28)) : {(|reg45)}) & {reg38[(3'h5):(2'h2)]}));
            end
        end
      else
        begin
          reg36 <= (reg39 ?
              {(8'ha8), $signed(reg35)} : $signed((&($signed(wire22) ?
                  $unsigned(wire30) : reg36))));
          if (reg42)
            begin
              reg37 <= (+$signed({reg41,
                  ($unsigned(reg35) ? (8'h9f) : wire25)}));
            end
          else
            begin
              reg37 <= ($unsigned(($unsigned((8'ha0)) < ((reg37 ?
                          wire30 : (8'hbc)) ?
                      $unsigned(wire31) : (~^wire24)))) ?
                  wire24[(2'h2):(1'h1)] : (|reg48[(1'h1):(1'h1)]));
              reg38 <= wire23[(2'h2):(2'h2)];
              reg39 <= (~^$unsigned($unsigned(((wire29 ?
                  reg38 : reg45) || (wire28 || reg44)))));
            end
          reg40 <= wire32;
        end
      reg49 <= $signed((!reg34[(1'h0):(1'h0)]));
      if (((reg34 & $unsigned($unsigned($signed(wire33)))) != ({$unsigned($unsigned((8'hbc)))} <= $signed({(-wire22),
          reg41[(2'h3):(1'h1)]}))))
        begin
          reg50 <= $unsigned(wire33);
        end
      else
        begin
          if ($unsigned($unsigned(reg38)))
            begin
              reg50 <= (wire33 != reg38[(1'h1):(1'h0)]);
              reg51 <= $signed(($signed($unsigned($signed((8'ha3)))) ?
                  ($unsigned((reg42 < wire27)) ?
                      wire20[(3'h5):(2'h2)] : $signed(reg46)) : {$signed(wire22[(1'h1):(1'h0)]),
                      wire23}));
              reg52 <= $unsigned({($signed(wire21[(5'h15):(5'h10)]) && $signed((+wire32))),
                  reg44[(2'h3):(2'h2)]});
              reg53 <= reg46[(1'h0):(1'h0)];
            end
          else
            begin
              reg50 <= {$signed(((8'hb7) > $unsigned((!(8'hac)))))};
              reg51 <= ($unsigned(($signed($unsigned(reg47)) & wire33[(1'h0):(1'h0)])) ?
                  reg42 : $signed((8'ha0)));
              reg52 <= reg35;
              reg53 <= $unsigned(({($unsigned(reg40) ^~ wire24[(5'h10):(4'hc)]),
                  $unsigned($signed(wire21))} == ($signed((~^wire28)) >= $unsigned(reg51[(4'h8):(3'h5)]))));
            end
        end
    end
  assign wire54 = $signed((reg35 ?
                      (-((wire28 ? reg50 : reg40) ?
                          $unsigned(wire30) : $unsigned(reg34))) : (^~$unsigned(((8'ha3) > reg44)))));
  assign wire55 = wire33[(1'h0):(1'h0)];
  assign wire56 = reg48[(1'h1):(1'h1)];
  assign wire57 = $signed((~|{$signed({reg39})}));
  always
    @(posedge clk) begin
      if ((~^(($signed((~|wire55)) || ({wire27, reg44} ?
          (reg36 ?
              reg43 : reg46) : (|wire27))) ^ ((!$signed(reg47)) >= (^(8'ha3))))))
        begin
          if ((~{{$signed(reg45), (~^$signed(reg52))}}))
            begin
              reg58 <= $signed(reg51);
              reg59 <= $signed($unsigned(({wire29,
                  $unsigned((8'hac))} << (wire22[(3'h7):(3'h4)] ?
                  reg43[(4'ha):(2'h2)] : ((7'h42) < wire26)))));
              reg60 <= (reg37[(3'h6):(1'h1)] ?
                  (((((7'h41) ?
                      reg45 : reg53) || reg52) && (reg44[(1'h1):(1'h0)] ?
                      reg38[(4'h8):(2'h3)] : $unsigned(wire20))) * (+reg45[(3'h4):(3'h4)])) : $signed(($signed((reg34 ?
                      wire24 : reg42)) >>> $signed((-reg47)))));
              reg61 <= $unsigned(reg44[(2'h2):(1'h1)]);
              reg62 <= $unsigned({((reg60[(4'hd):(4'hc)] > $signed(wire23)) | ($unsigned(wire31) ^~ {reg49,
                      wire31}))});
            end
          else
            begin
              reg58 <= ((reg34 != ((+$signed(reg51)) ?
                      $signed($signed(reg47)) : wire20[(4'h9):(3'h5)])) ?
                  (^((wire54[(1'h0):(1'h0)] ?
                      $unsigned(reg41) : wire28[(2'h2):(2'h2)]) < $signed(wire30[(2'h3):(1'h1)]))) : (~|(~|$unsigned((wire32 * reg49)))));
              reg59 <= reg47;
              reg60 <= $unsigned((8'hb8));
              reg61 <= (({$unsigned(wire55[(3'h6):(3'h6)]),
                      reg48} ^~ (((7'h44) >>> $unsigned(reg60)) || wire25[(2'h2):(2'h2)])) ?
                  (reg52 ?
                      $unsigned(reg38[(2'h2):(1'h0)]) : ($unsigned((-wire30)) > wire30[(3'h5):(3'h4)])) : reg37);
            end
          if ((^~reg49))
            begin
              reg63 <= reg40[(1'h1):(1'h0)];
              reg64 <= $unsigned(reg61[(2'h2):(1'h1)]);
              reg65 <= reg47[(3'h5):(2'h2)];
              reg66 <= reg52;
            end
          else
            begin
              reg63 <= {wire31[(4'hc):(4'h9)], reg36};
            end
          reg67 <= $unsigned($unsigned(reg45));
        end
      else
        begin
          reg58 <= reg44[(2'h3):(1'h0)];
          reg59 <= ((($unsigned((reg59 > wire20)) || (&(~&wire26))) ?
              reg60[(5'h10):(2'h3)] : $unsigned(reg49)) > reg47);
          reg60 <= (+$signed($signed(({reg67, reg60} ?
              reg60 : reg67[(1'h1):(1'h1)]))));
          reg61 <= reg41;
          reg62 <= ($unsigned((~^((reg35 ? wire26 : reg43) ?
              reg51[(2'h2):(1'h1)] : reg49))) < $signed((reg66[(1'h0):(1'h0)] != reg53)));
        end
      reg68 <= ($unsigned(((wire27 ?
              reg64 : {reg42}) >= $signed(wire22[(5'h11):(2'h3)]))) ?
          reg60[(5'h11):(1'h0)] : wire20);
      if (reg48)
        begin
          if ({reg34[(2'h2):(1'h1)], wire54})
            begin
              reg69 <= ((^{($signed(reg35) + $signed(wire23)),
                      reg50[(1'h0):(1'h0)]}) ?
                  (&($unsigned((reg43 ?
                      (8'hae) : wire24)) != ($signed(reg67) && $unsigned(wire25)))) : wire23);
              reg70 <= {($signed(wire27[(1'h0):(1'h0)]) ?
                      wire32[(1'h1):(1'h0)] : reg66),
                  reg62[(4'h8):(1'h0)]};
              reg71 <= $signed(((+reg66[(3'h6):(3'h5)]) > ((~&(8'hb4)) ?
                  (((7'h43) + reg39) ?
                      (wire19 < reg46) : (|reg40)) : wire21[(5'h12):(3'h5)])));
            end
          else
            begin
              reg69 <= $signed(((($signed(reg50) != (8'haa)) ?
                      ($unsigned(wire57) != $signed((8'hbf))) : $signed(reg71)) ?
                  wire30 : ($unsigned($signed(reg38)) || $unsigned(reg71[(1'h1):(1'h1)]))));
              reg70 <= wire19;
              reg71 <= (reg42[(1'h1):(1'h1)] << reg41[(3'h4):(2'h2)]);
              reg72 <= {(($unsigned((wire19 <= reg66)) ?
                          reg45 : {(8'hba), $signed(reg65)}) ?
                      (-{reg35[(3'h6):(2'h2)]}) : $signed($signed((&reg69))))};
              reg73 <= ($unsigned(reg50) << $unsigned($unsigned(((reg44 ?
                  reg40 : (8'ha0)) ^~ $signed(wire24)))));
            end
        end
      else
        begin
          reg69 <= (reg52[(1'h0):(1'h0)] * wire54);
          if (($signed((wire20[(4'hd):(4'h8)] ?
              reg43[(1'h1):(1'h0)] : ($signed(reg52) ?
                  reg63[(5'h10):(4'ha)] : (!reg53)))) == $unsigned(({wire22,
                  (|(7'h43))} ?
              (+reg73) : ((wire33 ? wire23 : reg73) && {wire56})))))
            begin
              reg70 <= wire32[(1'h0):(1'h0)];
              reg71 <= ((+(($unsigned(wire56) ^~ $unsigned((8'ha9))) + reg36)) | ((~^reg72) ~^ reg66));
              reg72 <= reg69;
            end
          else
            begin
              reg70 <= wire57;
              reg71 <= {$signed((reg40[(4'he):(4'he)] ~^ wire20[(2'h3):(2'h3)]))};
              reg72 <= (~^(~^(((&reg36) || wire25[(1'h1):(1'h0)]) << reg38)));
              reg73 <= $unsigned(wire57[(1'h0):(1'h0)]);
            end
          reg74 <= $unsigned(reg38);
        end
      reg75 <= $signed(wire19);
    end
  assign wire76 = $signed((($unsigned(wire22[(4'h8):(1'h1)]) ?
                          ((!wire28) >>> (-(8'hb3))) : (8'hbf)) ?
                      (((~&reg69) ^ {reg72}) * reg67) : (($signed(reg37) ?
                          {wire55} : (wire24 <= reg49)) >>> (reg69 ?
                          wire32[(1'h0):(1'h0)] : $signed((8'hbd))))));
  assign wire77 = $signed($unsigned((^~reg49)));
  assign wire78 = (reg45[(1'h1):(1'h1)] - (reg73 ?
                      reg63[(2'h3):(1'h1)] : (~reg66)));
  assign wire79 = (wire27[(3'h7):(3'h6)] != $signed(reg53[(2'h2):(1'h0)]));
  assign wire80 = ((wire79[(3'h7):(2'h3)] ?
                      $unsigned(wire22) : $unsigned(({(8'h9e), (7'h40)} ?
                          $signed(wire32) : $signed(wire20)))) ~^ $signed((({wire78,
                          wire19} ?
                      (reg46 ^ wire21) : reg71) ^ (~((8'hb6) ?
                      wire26 : reg48)))));
endmodule

module module161
#(parameter param179 = (((~^(~(8'ha3))) + (({(8'hba)} > ((8'ha9) ~^ (8'hac))) && {{(8'had)}})) >> (({{(8'haf), (8'hba)}, ((8'hb6) < (8'hac))} ? ((~(8'hb9)) ? {(8'h9f), (8'hbc)} : (8'hb8)) : ({(8'ha2), (8'hb4)} || ((8'ha1) >= (8'h9f)))) ? {((|(8'hbf)) ? ((8'hb3) ? (8'ha9) : (8'hb3)) : ((8'hb0) != (8'hac)))} : (~(!((7'h40) != (8'hbb)))))), 
parameter param180 = ((-param179) <<< {param179}))
(y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire166;
  input wire [(4'hd):(1'h0)] wire165;
  input wire [(4'h8):(1'h0)] wire164;
  input wire [(4'hb):(1'h0)] wire163;
  input wire signed [(4'hc):(1'h0)] wire162;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire [(4'he):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire175;
  wire [(3'h7):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire171;
  wire [(4'hb):(1'h0)] wire170;
  wire [(4'h8):(1'h0)] wire169;
  wire signed [(3'h4):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire167;
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg172,
                 (1'h0)};
  assign wire167 = (wire162[(4'h9):(1'h0)] && $signed($unsigned(wire163)));
  assign wire168 = wire165[(3'h4):(3'h4)];
  assign wire169 = ($signed(wire164) ?
                       $signed(wire167) : {((^~(|wire162)) ?
                               wire167[(3'h7):(3'h4)] : wire166[(5'h14):(4'ha)])});
  assign wire170 = $signed((wire163[(4'h8):(1'h0)] & (8'hab)));
  assign wire171 = $unsigned((((wire170 && $unsigned(wire163)) ?
                           wire170[(1'h0):(1'h0)] : wire168[(1'h0):(1'h0)]) ?
                       {(wire165 << wire165[(4'h9):(3'h7)])} : (&$signed((wire169 ?
                           wire162 : wire164)))));
  always
    @(posedge clk) begin
      reg172 <= ((wire164[(1'h1):(1'h0)] == $signed(($signed(wire163) ?
          $signed((8'hb1)) : (~wire164)))) ^ wire162);
    end
  assign wire173 = $unsigned($signed($signed($unsigned($unsigned(wire165)))));
  assign wire174 = (-(+wire163));
  assign wire175 = wire170[(3'h7):(2'h2)];
  assign wire176 = wire165;
  assign wire177 = reg172;
  assign wire178 = ($unsigned($signed(wire176[(4'h9):(2'h3)])) && $unsigned(wire170));
endmodule
