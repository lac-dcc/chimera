module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire218;
  wire [(3'h7):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire216;
  wire [(5'h11):(1'h0)] wire214;
  wire [(4'hb):(1'h0)] wire213;
  wire [(2'h2):(1'h0)] wire212;
  wire [(3'h5):(1'h0)] wire209;
  wire signed [(2'h3):(1'h0)] wire208;
  wire [(3'h6):(1'h0)] wire207;
  wire signed [(3'h7):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire202;
  wire signed [(5'h10):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire205;
  reg signed [(3'h4):(1'h0)] reg231 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg230 = (1'h0);
  reg [(4'h8):(1'h0)] reg229 = (1'h0);
  reg signed [(4'he):(1'h0)] reg228 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg227 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg226 = (1'h0);
  reg [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg222 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(5'h14):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg210 = (1'h0);
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire214,
                 wire213,
                 wire212,
                 wire209,
                 wire208,
                 wire207,
                 wire199,
                 wire201,
                 wire202,
                 wire203,
                 wire204,
                 wire205,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg210,
                 reg211,
                 (1'h0)};
  module4 #() modinst200 (.wire9((8'hb3)), .wire8(wire2), .y(wire199), .clk(clk), .wire5(wire3), .wire6(wire0), .wire7(wire1));
  assign wire201 = ($unsigned(wire0) + {wire1[(4'hc):(3'h6)]});
  assign wire202 = $unsigned($signed({((^wire2) >= (wire0 == wire2))}));
  assign wire203 = wire201;
  assign wire204 = {$signed({(wire2[(1'h0):(1'h0)] >>> $signed(wire3))})};
  module180 #() modinst206 (wire205, clk, wire1, wire203, wire0, wire204, wire201);
  assign wire207 = wire205;
  assign wire208 = ($unsigned((8'hbf)) ^~ (~^$unsigned(wire199)));
  assign wire209 = {$signed((wire203[(1'h0):(1'h0)] == ((wire1 ?
                           wire199 : wire204) >>> (~(8'h9e))))),
                       $unsigned(wire0)};
  always
    @(posedge clk) begin
      reg210 <= wire208[(2'h3):(1'h0)];
      reg211 <= ((-$signed(wire203[(4'ha):(4'h8)])) ?
          (&{wire201, $signed({wire209})}) : $unsigned(wire203[(4'hd):(4'hc)]));
    end
  assign wire212 = ((~|reg211[(2'h3):(2'h3)]) ^~ {$signed($signed(wire1))});
  assign wire213 = $unsigned(wire212[(2'h2):(1'h1)]);
  module147 #() modinst215 (wire214, clk, wire205, wire0, reg210, wire2, wire209);
  assign wire216 = ($unsigned(wire3) >>> (wire209 >> {(~^{wire3}), (-wire3)}));
  assign wire217 = ((~($signed((^~wire207)) >>> wire2)) ?
                       wire202 : $unsigned((&wire0)));
  assign wire218 = (-wire205[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire201[(3'h6):(1'h1)])
        begin
          reg219 <= (~$unsigned(wire214));
          reg220 <= $unsigned({wire1[(5'h13):(4'he)], wire209});
          reg221 <= $signed(reg219[(5'h13):(3'h7)]);
        end
      else
        begin
          if (($signed((8'ha8)) == $signed($unsigned(reg219[(4'hc):(4'hb)]))))
            begin
              reg219 <= ($unsigned((&$unsigned((wire201 || reg211)))) | wire0);
            end
          else
            begin
              reg219 <= reg210;
              reg220 <= wire207[(3'h5):(3'h4)];
              reg221 <= $signed(wire204[(3'h5):(3'h5)]);
              reg222 <= ($signed((({wire1} && (-reg221)) ?
                      ((reg219 > wire213) ?
                          $unsigned(wire209) : (~&wire205)) : $signed($unsigned(wire214)))) ?
                  wire212 : ({($signed((7'h40)) ?
                          $signed(wire204) : (reg221 ?
                              wire214 : reg210))} ^ wire199[(1'h0):(1'h0)]));
              reg223 <= reg219;
            end
          reg224 <= $signed((wire217[(3'h7):(2'h3)] | $signed((wire216[(1'h1):(1'h0)] < reg222[(3'h6):(2'h2)]))));
          reg225 <= $unsigned(wire201[(4'ha):(4'h8)]);
          if ($unsigned(({($signed(wire0) ?
                      (reg223 ^~ wire203) : ((8'ha7) * (8'hae))),
                  ($unsigned(reg223) ?
                      wire207[(3'h4):(3'h4)] : $unsigned(wire218))} ?
              (~|(^(+(8'hb8)))) : $signed(reg222[(4'hc):(3'h7)]))))
            begin
              reg226 <= reg225[(4'hb):(4'hb)];
            end
          else
            begin
              reg226 <= ((^~$signed(wire201[(4'h8):(4'h8)])) ?
                  ($unsigned(((wire217 == wire208) <= $unsigned(wire2))) > $unsigned($unsigned({reg211,
                      wire207}))) : (((8'hbc) >> $signed(wire204[(1'h1):(1'h0)])) ?
                      ($signed(reg226) * reg211[(4'hf):(4'ha)]) : (^~$unsigned($signed(wire209)))));
              reg227 <= ({reg219, (8'hbb)} ? (~wire209) : wire217);
            end
        end
      reg228 <= ((~&reg210[(2'h2):(1'h0)]) + ((~|$signed({wire207, reg226})) ?
          wire207[(3'h5):(2'h2)] : ($signed({reg219, wire214}) ?
              reg226 : (^~reg222))));
      reg229 <= (~&wire209[(1'h1):(1'h1)]);
      reg230 <= (8'ha5);
      reg231 <= (((+reg228) ?
              ($unsigned($unsigned(wire203)) ?
                  ((reg224 ?
                      reg223 : wire204) >>> reg210[(3'h6):(3'h4)]) : $unsigned($unsigned(wire1))) : {(reg220[(2'h2):(1'h0)] ?
                      reg211[(1'h0):(1'h0)] : wire218[(3'h6):(1'h1)])}) ?
          $unsigned({{reg223}}) : {(~&((reg226 * reg225) >= {wire218, reg228})),
              ({(reg224 ? reg228 : reg211),
                  ((8'haf) ? reg229 : reg229)} != wire205)});
    end
endmodule

module module4
#(parameter param198 = ({((((8'haa) >> (8'hbc)) ? ((8'hab) || (8'hb1)) : ((8'hab) ? (8'hb1) : (7'h44))) ? (((8'hb6) ? (8'ha2) : (8'h9c)) ? {(8'hbd)} : {(8'hac)}) : (^~(-(8'hbb))))} ? ({{((8'hb5) ? (8'h9e) : (8'hb6)), (~^(8'ha1))}, ({(8'h9e)} || (^~(8'h9e)))} ? (|(^(^(8'hbd)))) : ((-((7'h41) >> (8'hbd))) << (~|{(8'ha3)}))) : (((((8'haa) ? (8'hb4) : (7'h40)) ? ((8'hb6) < (8'haf)) : ((8'h9e) * (8'hb4))) ? {((8'haf) ? (8'haa) : (8'ha3))} : ((8'ha3) >>> ((7'h43) ? (8'hb9) : (8'hb7)))) ? (((|(8'hba)) >= ((8'ha5) && (8'hab))) ^~ (+(+(8'had)))) : (!((8'h9d) ? ((7'h41) ? (8'ha5) : (8'h9f)) : ((8'haa) ? (8'hb8) : (8'hbb)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire5;
  input wire [(4'h9):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire177;
  wire signed [(5'h13):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire194;
  wire [(3'h4):(1'h0)] wire196;
  reg signed [(5'h15):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  assign y = {wire173,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire85,
                 wire99,
                 wire101,
                 wire102,
                 wire112,
                 wire145,
                 wire175,
                 wire177,
                 wire178,
                 wire179,
                 wire194,
                 wire196,
                 reg176,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire10 = $unsigned($unsigned((~^$signed((wire8 + wire8)))));
  assign wire11 = ($unsigned($signed(wire8[(2'h2):(1'h0)])) ^~ {(7'h43)});
  assign wire12 = $signed(wire9[(4'hd):(4'hc)]);
  assign wire13 = wire8[(1'h1):(1'h0)];
  assign wire14 = (($unsigned(((wire7 ~^ wire9) && (wire5 ^ wire12))) ?
                      $signed((wire10 ?
                          (!wire9) : wire13)) : wire12) == {((~|$signed(wire9)) ?
                          wire8 : $unsigned((wire7 ? wire5 : wire7))),
                      (^(wire7[(3'h5):(3'h5)] ?
                          (wire13 && (8'hb9)) : $signed(wire7)))});
  assign wire15 = {((wire14 & (((7'h40) | wire6) ?
                          (^~(8'hbe)) : $unsigned(wire8))) ^~ $signed($signed(wire14[(1'h0):(1'h0)])))};
  assign wire16 = ((7'h42) | (($signed(wire13) ?
                          ($unsigned(wire15) ?
                              (8'hbf) : (~(8'haf))) : $unsigned(wire15)) ?
                      {(|$unsigned(wire14)), wire10} : (^~wire8)));
  always
    @(posedge clk) begin
      if (($signed($unsigned($unsigned(wire12))) ^ wire15))
        begin
          if ((7'h44))
            begin
              reg17 <= $signed(($unsigned($signed(wire13)) ?
                  wire9 : wire16[(4'ha):(3'h6)]));
              reg18 <= $unsigned(wire9[(4'he):(3'h7)]);
            end
          else
            begin
              reg17 <= $unsigned(($signed(((wire11 ?
                      wire12 : (7'h43)) & wire15[(3'h4):(2'h2)])) ?
                  $unsigned(wire14) : {$unsigned((wire7 != reg18)),
                      wire16[(3'h5):(2'h2)]}));
              reg18 <= ($unsigned($signed((wire15[(3'h5):(2'h3)] == wire12[(3'h6):(3'h5)]))) ?
                  $signed((!wire10[(1'h1):(1'h0)])) : wire12[(4'h8):(1'h1)]);
              reg19 <= ((&(~&$signed((~&reg18)))) < ((~|wire15) + wire7));
              reg20 <= $signed((-(-(wire8[(1'h0):(1'h0)] ?
                  (reg17 ? (8'hb9) : (8'ha0)) : ((8'hbc) ? (8'hb2) : wire8)))));
            end
          reg21 <= (~|{$signed(wire10[(2'h2):(1'h1)])});
          reg22 <= ($signed(wire7) ?
              $unsigned(((^~wire15[(1'h0):(1'h0)]) <= (~^$unsigned(wire5)))) : $signed(wire6));
          reg23 <= ((((&(wire9 ? (8'hbe) : wire10)) ~^ wire9) ^ reg20) ?
              $unsigned((!$signed(reg17))) : (~^(({(8'hab),
                      (7'h44)} >> $unsigned(reg18)) ?
                  $unsigned(((8'hb7) <<< wire8)) : (+$signed(wire6)))));
        end
      else
        begin
          reg17 <= wire7[(3'h5):(2'h2)];
        end
      reg24 <= $signed((($unsigned($unsigned(wire10)) <<< ({reg20,
          wire11} << (|reg22))) >>> ($signed({reg17}) ?
          reg17[(3'h7):(3'h7)] : wire13[(1'h0):(1'h0)])));
    end
  module25 #() modinst86 (.y(wire85), .wire28(wire7), .wire29(reg17), .wire30(wire8), .wire27(reg18), .clk(clk), .wire26(reg21));
  module87 #() modinst100 (wire99, clk, wire13, wire12, wire10, reg21, wire6);
  assign wire101 = (-$signed(((~|(8'hb6)) ?
                       {(reg24 * wire13), (~^(8'ha3))} : {$signed(wire5)})));
  assign wire102 = $signed(reg23);
  always
    @(posedge clk) begin
      reg103 <= $unsigned(($signed({(~wire9), (^(8'hb3))}) != ($signed({wire9,
              wire99}) ?
          reg20[(1'h0):(1'h0)] : {wire102[(5'h12):(2'h3)], reg21})));
      reg104 <= $unsigned(reg18);
      reg105 <= $signed(reg22);
      reg106 <= ($signed($signed($signed(wire101))) ?
          (wire11 - (wire11[(4'ha):(3'h7)] ?
              ({reg19} < (reg19 ?
                  (8'ha1) : reg24)) : (reg23[(1'h0):(1'h0)] ^ $unsigned((8'hbc))))) : {(wire99[(4'ha):(4'h9)] ?
                  reg18 : $unsigned($unsigned(wire7)))});
      if ({reg104[(2'h2):(1'h1)]})
        begin
          reg107 <= wire5;
          reg108 <= $signed(reg19[(3'h7):(2'h2)]);
        end
      else
        begin
          reg107 <= $signed($signed(wire102[(3'h7):(3'h5)]));
          reg108 <= $unsigned(((^$unsigned((reg107 ? reg105 : reg21))) ?
              (+wire14[(3'h6):(3'h6)]) : (8'ha2)));
          reg109 <= (wire14[(4'h8):(2'h2)] + ($unsigned((|$signed(wire5))) || (((|reg17) != reg106) ?
              reg21[(4'h9):(1'h0)] : ((reg20 >>> (8'hae)) ?
                  {reg21} : (~wire11)))));
          reg110 <= ($signed((^((wire13 ^ wire13) ?
              reg109 : $unsigned(reg17)))) ^~ (-$signed(wire15[(1'h1):(1'h1)])));
          reg111 <= $signed((reg18 ?
              $signed(($unsigned(wire7) ^~ $unsigned(wire101))) : $signed((^~(^wire99)))));
        end
    end
  assign wire112 = wire13;
  module113 #() modinst146 (wire145, clk, reg19, wire99, wire5, wire101);
  module147 #() modinst174 (wire173, clk, reg111, wire8, wire12, wire85, reg24);
  assign wire175 = ((8'hbc) ? reg104 : $unsigned(wire8));
  always
    @(posedge clk) begin
      reg176 <= (^~$signed((reg110[(4'he):(4'h8)] ?
          ((wire112 ? wire99 : reg107) ?
              $unsigned(wire145) : {wire101,
                  reg18}) : (|wire5[(1'h1):(1'h1)]))));
    end
  assign wire177 = wire16[(3'h7):(3'h5)];
  assign wire178 = $signed((wire11[(4'ha):(4'ha)] ?
                       (((8'hbb) ~^ (^wire177)) ~^ (~&(wire10 ?
                           wire15 : wire177))) : (reg105 || ((^~wire13) ?
                           reg109 : $signed((8'hb7))))));
  assign wire179 = wire8[(3'h5):(1'h1)];
  module180 #() modinst195 (.clk(clk), .y(wire194), .wire181(reg111), .wire183(wire7), .wire184(reg19), .wire182(wire10), .wire185(reg22));
  module113 #() modinst197 (.wire117(reg22), .y(wire196), .clk(clk), .wire114(wire179), .wire116(wire13), .wire115(wire101));
endmodule

module module180
#(parameter param192 = ((^~((((8'h9d) + (8'hb1)) ^~ ((7'h42) ? (7'h40) : (8'hb3))) >= ({(8'h9d), (8'hbb)} ? ((8'hb5) && (8'hab)) : ((8'ha1) ? (7'h42) : (8'ha5))))) ? (8'hba) : (-((8'hac) < (^((7'h40) ? (8'hae) : (8'hbf)))))), 
parameter param193 = ((~|(&((param192 ^ param192) || (param192 <= (7'h43))))) >= (param192 ? ((7'h44) ? ((param192 && param192) != (param192 ? param192 : param192)) : (((8'hb9) <= param192) ? (|param192) : (8'hae))) : (^~param192))))
(y, clk, wire185, wire184, wire183, wire182, wire181);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire185;
  input wire signed [(4'h9):(1'h0)] wire184;
  input wire [(5'h11):(1'h0)] wire183;
  input wire [(4'hf):(1'h0)] wire182;
  input wire signed [(3'h6):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire191;
  wire [(5'h14):(1'h0)] wire190;
  wire [(3'h7):(1'h0)] wire189;
  wire signed [(2'h3):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire187;
  wire signed [(4'h8):(1'h0)] wire186;
  assign y = {wire191, wire190, wire189, wire188, wire187, wire186, (1'h0)};
  assign wire186 = (($unsigned((8'ha3)) - (((8'hbe) ?
                           $unsigned(wire184) : $signed(wire182)) ?
                       wire182[(4'hf):(4'h8)] : ((~^wire183) << wire184))) - $signed(wire184));
  assign wire187 = {$unsigned($signed($signed(wire181[(3'h6):(1'h1)]))),
                       (((8'hb4) ?
                           $signed((^(8'hb2))) : $signed($signed((8'h9f)))) ^ wire181)};
  assign wire188 = wire187;
  assign wire189 = {wire188};
  assign wire190 = ((~^((~{wire182, wire187}) ?
                       $signed(wire184[(4'h9):(2'h2)]) : wire181[(3'h6):(3'h5)])) <= $unsigned((+(8'hab))));
  assign wire191 = {wire184};
endmodule

module module147
#(parameter param172 = {(&(~(!{(8'ha8), (8'hb8)})))})
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire152;
  input wire [(5'h10):(1'h0)] wire151;
  input wire signed [(3'h4):(1'h0)] wire150;
  input wire [(4'he):(1'h0)] wire149;
  input wire signed [(3'h5):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(2'h2):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire153;
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg157,
                 (1'h0)};
  assign wire153 = $signed(wire148[(2'h2):(2'h2)]);
  assign wire154 = $signed($unsigned($unsigned($signed($signed(wire151)))));
  assign wire155 = $unsigned(wire154[(3'h5):(1'h1)]);
  assign wire156 = (+($unsigned(wire150[(3'h4):(3'h4)]) ?
                       (&$signed((^~wire148))) : wire155));
  always
    @(posedge clk) begin
      reg157 <= (+wire154[(2'h2):(1'h0)]);
    end
  assign wire158 = (|(wire150[(3'h4):(3'h4)] <= {$unsigned((reg157 ?
                           wire155 : reg157))}));
  assign wire159 = (7'h41);
  assign wire160 = (~|$signed((((~|wire149) * (wire149 ?
                       wire156 : (8'hb6))) < wire151)));
  assign wire161 = wire153[(2'h2):(1'h1)];
  assign wire162 = (reg157[(1'h1):(1'h0)] ?
                       wire154 : $unsigned(($unsigned((wire158 ^ wire149)) ?
                           (~|wire155) : wire161)));
  assign wire163 = wire158[(1'h1):(1'h1)];
  assign wire164 = (8'hb9);
  assign wire165 = $signed((~&wire155[(4'h8):(1'h0)]));
  assign wire166 = $signed(wire150[(2'h2):(2'h2)]);
  assign wire167 = wire160;
  assign wire168 = $signed(wire161[(2'h2):(1'h0)]);
  assign wire169 = ($unsigned(((^~(^~wire153)) ~^ ((wire167 ?
                               wire163 : wire161) ?
                           {wire149, (8'hba)} : (^wire165)))) ?
                       wire162[(4'hc):(3'h4)] : ((~&$unsigned(wire165[(4'hc):(4'h8)])) ~^ (wire156 > wire164[(4'ha):(4'h8)])));
  assign wire170 = (&wire153[(1'h1):(1'h1)]);
  assign wire171 = ((!$unsigned(($unsigned(wire152) << wire165[(1'h0):(1'h0)]))) << (~&wire152[(4'hb):(3'h6)]));
endmodule

module module113
#(parameter param144 = ({(~^(^((7'h40) <<< (8'hb6))))} != (~(-{((8'ha9) >> (8'ha2)), {(8'ha5)}}))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire117;
  input wire signed [(2'h2):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  input wire [(4'hc):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(3'h4):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire signed [(5'h11):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire133,
                 wire132,
                 wire131,
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
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg130,
                 (1'h0)};
  assign wire118 = $signed($unsigned($signed($unsigned((~wire117)))));
  assign wire119 = (wire117 ?
                       $unsigned($unsigned($signed(wire115[(3'h7):(2'h3)]))) : $unsigned(((!(+wire118)) ?
                           (8'hbc) : $unsigned(wire118[(2'h3):(1'h1)]))));
  assign wire120 = ($unsigned(wire116) ?
                       ($unsigned($signed($unsigned(wire117))) < (wire119[(4'he):(1'h0)] ?
                           $signed({wire114}) : {$signed(wire115),
                               ((8'ha8) ?
                                   wire117 : wire116)})) : $signed(((wire119 ^~ wire118[(4'hb):(4'hb)]) ?
                           ((~wire116) ?
                               wire117[(2'h2):(2'h2)] : (wire116 ?
                                   wire114 : (7'h44))) : (wire115[(4'ha):(3'h5)] && (wire115 ^~ wire115)))));
  assign wire121 = $signed(($signed(wire114[(3'h4):(2'h3)]) ?
                       wire120[(2'h3):(2'h2)] : (wire120[(1'h0):(1'h0)] - wire116)));
  assign wire122 = (~^(wire120 >= (+$signed(wire115))));
  assign wire123 = wire119[(2'h2):(1'h0)];
  assign wire124 = wire115[(4'h9):(1'h1)];
  assign wire125 = {{(wire122 ?
                               $unsigned((wire115 ?
                                   wire124 : wire120)) : (&(~^wire122))),
                           wire123},
                       (wire116 ?
                           {{{wire120}},
                               ($signed(wire121) ?
                                   (^~wire121) : $signed(wire119))} : $signed(((wire116 ~^ wire114) ?
                               wire118 : (wire114 ? wire118 : wire114))))};
  assign wire126 = (|$signed(wire116[(1'h0):(1'h0)]));
  assign wire127 = (wire118 < (|(((wire114 ?
                           wire115 : (8'hb9)) <= wire117[(1'h1):(1'h0)]) ?
                       wire119[(4'h9):(4'h9)] : ($signed(wire119) < (wire124 ^ wire120)))));
  assign wire128 = (($signed(wire116[(1'h1):(1'h0)]) ?
                       wire123[(1'h0):(1'h0)] : {$signed(wire119)}) ^~ $unsigned(wire123[(3'h4):(1'h1)]));
  assign wire129 = wire118;
  always
    @(posedge clk) begin
      reg130 <= $unsigned((&((^~(+wire128)) ?
          wire129[(3'h5):(3'h5)] : ((-wire117) ?
              (wire117 ? wire125 : wire128) : wire126[(4'hb):(3'h6)]))));
    end
  assign wire131 = wire121;
  assign wire132 = {{$signed((~&(wire122 * wire122))),
                           (wire115 ? $signed({(7'h42)}) : $signed(wire114))},
                       (~^{$unsigned((wire116 ? wire115 : wire127))})};
  assign wire133 = ($unsigned($unsigned((~&(wire124 ? wire116 : wire116)))) ?
                       (wire114[(4'hb):(3'h7)] ?
                           (^wire116[(1'h0):(1'h0)]) : (($unsigned(wire119) ^~ (wire119 >= wire115)) >= $unsigned($unsigned(reg130)))) : (wire121 ?
                           $unsigned(wire120[(2'h3):(1'h0)]) : ({wire129,
                                   $unsigned(wire117)} ?
                               $unsigned({(8'hbb)}) : wire124)));
  always
    @(posedge clk) begin
      reg134 <= $signed((wire119[(2'h2):(2'h2)] <<< wire131[(2'h3):(2'h2)]));
      reg135 <= ({wire127,
          (wire133 <<< $unsigned({wire119}))} & (reg130[(4'hf):(2'h2)] ?
          ((&(wire125 || wire124)) ?
              {$unsigned(wire126),
                  $unsigned(wire121)} : wire125) : (wire127[(4'he):(4'ha)] >> wire125)));
      reg136 <= (wire120[(1'h1):(1'h0)] - wire129);
      reg137 <= (wire114[(1'h1):(1'h1)] ?
          (^(wire114 ?
              $signed(((8'hb1) ?
                  reg136 : wire114)) : wire126[(2'h3):(1'h0)])) : $unsigned($signed((|$unsigned(wire131)))));
    end
  assign wire138 = $unsigned($signed({wire121[(2'h2):(1'h0)]}));
  assign wire139 = wire115[(3'h6):(2'h3)];
  assign wire140 = (~^$signed((!$signed(wire127))));
  assign wire141 = wire128[(3'h6):(2'h3)];
  assign wire142 = $signed((-$unsigned($signed((&wire120)))));
  assign wire143 = (wire131 || $unsigned((~{{reg135, wire141}})));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire92;
  input wire [(4'h8):(1'h0)] wire91;
  input wire [(4'hb):(1'h0)] wire90;
  input wire [(5'h12):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  assign y = {wire98, wire97, wire94, wire93, reg96, reg95, (1'h0)};
  assign wire93 = wire91[(2'h3):(1'h1)];
  assign wire94 = wire91;
  always
    @(posedge clk) begin
      reg95 <= (wire94 ?
          ($unsigned(wire91) ?
              wire91[(1'h1):(1'h1)] : wire93) : wire91[(3'h5):(3'h5)]);
      reg96 <= (wire91[(3'h6):(3'h4)] - (^wire88[(2'h2):(1'h0)]));
    end
  assign wire97 = wire93;
  assign wire98 = wire92;
endmodule

module module25
#(parameter param83 = ((~&((((8'hb1) ? (8'ha2) : (8'ha6)) < ((7'h43) ? (8'hae) : (8'hb4))) ? (8'hae) : (((7'h40) ? (8'ha0) : (8'hba)) ? {(8'haa), (8'h9c)} : (-(8'haa))))) ? (~^((~{(8'hb2)}) ? ((8'ha5) | ((8'haf) ? (8'hbf) : (8'ha8))) : (~^{(8'hb2), (8'h9d)}))) : (&{(((8'ha6) ? (8'hbc) : (8'hb4)) ? (~^(8'ha1)) : ((8'hbe) != (8'hb5))), (|(~(8'hb9)))})), 
parameter param84 = (((param83 ? (~(~|param83)) : param83) ? {((+param83) >= (param83 ? param83 : param83))} : param83) ? ((param83 ? (-param83) : {(^~param83)}) >= (((param83 ? param83 : param83) ? (!param83) : {param83}) ? ((param83 ~^ (8'hb6)) <= (param83 ? param83 : param83)) : (param83 >>> {param83}))) : (param83 ? ((8'haa) >= {(param83 ^~ param83), (param83 ? param83 : param83)}) : ({(param83 << param83)} ? ((param83 ^ (8'hb2)) ? {param83} : {param83}) : {(param83 >= param83)}))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h25e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  assign y = {wire82,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
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
                 (1'h0)};
  assign wire31 = (&$signed((|wire30[(2'h2):(1'h0)])));
  assign wire32 = wire26;
  assign wire33 = $unsigned((|(-wire27[(4'hd):(4'ha)])));
  assign wire34 = (8'ha9);
  assign wire35 = $unsigned($unsigned($signed($signed((~(8'ha5))))));
  assign wire36 = wire26;
  assign wire37 = {wire32[(2'h3):(1'h0)]};
  assign wire38 = {wire27[(5'h12):(3'h7)], $unsigned((8'hb8))};
  always
    @(posedge clk) begin
      if (((8'hae) ?
          (wire38 < $signed(((wire31 ?
              (8'hb9) : wire36) & wire26[(1'h1):(1'h1)]))) : wire36[(4'hd):(2'h3)]))
        begin
          reg39 <= $signed((-$unsigned({(+wire34), (&(8'hb9))})));
          if (wire37[(1'h0):(1'h0)])
            begin
              reg40 <= (-$signed((({wire31} ?
                  (wire35 >>> wire38) : (&wire27)) ^~ ({wire38} > (wire30 ?
                  (7'h43) : wire27)))));
              reg41 <= $signed((~$unsigned(((^wire29) & wire30))));
              reg42 <= reg41;
              reg43 <= $unsigned(wire35[(2'h2):(1'h1)]);
              reg44 <= wire30;
            end
          else
            begin
              reg40 <= wire35;
              reg41 <= (wire29 ^~ ($unsigned(wire26) ?
                  {(reg42 && wire29[(5'h10):(4'hd)])} : $signed((wire34 != wire34[(3'h7):(1'h1)]))));
              reg42 <= ($signed((8'ha4)) ?
                  $signed(((8'ha3) << (wire30 ?
                      $signed(reg44) : (wire30 ? reg44 : wire32)))) : wire38);
              reg43 <= $unsigned($signed(wire33[(1'h1):(1'h0)]));
              reg44 <= ((({(reg44 > wire31), $signed(wire32)} ?
                      $unsigned(wire27[(4'hb):(3'h5)]) : wire36[(3'h5):(3'h4)]) << ($signed($signed(wire28)) ?
                      wire32 : $signed($signed(reg40)))) ?
                  ($unsigned((((8'haf) <<< reg41) - wire30)) * reg43[(3'h6):(1'h0)]) : wire31[(4'hb):(4'h9)]);
            end
        end
      else
        begin
          reg39 <= $signed(wire27[(5'h13):(4'hb)]);
          if (wire35[(5'h10):(3'h4)])
            begin
              reg40 <= $signed(wire27);
              reg41 <= (!$signed($signed($unsigned((~&reg39)))));
              reg42 <= $unsigned(((~$unsigned((~&reg43))) ?
                  (wire35 ?
                      ({wire38} - (|wire26)) : $signed({wire34})) : (&wire37[(2'h3):(1'h0)])));
              reg43 <= (~^$signed(wire36));
            end
          else
            begin
              reg40 <= {$signed(wire37)};
              reg41 <= ($signed(wire30) & $unsigned(reg39[(1'h1):(1'h1)]));
              reg42 <= wire28;
              reg43 <= $unsigned(($signed((~&$unsigned(wire37))) ?
                  $signed((~wire27[(4'h9):(4'h9)])) : wire30));
              reg44 <= $unsigned(($signed($unsigned(reg39)) ?
                  $unsigned(wire34[(4'h9):(4'h8)]) : $unsigned((8'hba))));
            end
          reg45 <= $signed(wire30);
          reg46 <= reg44[(5'h10):(1'h0)];
        end
      if (($signed(wire35) && wire35))
        begin
          reg47 <= wire37[(3'h6):(1'h1)];
        end
      else
        begin
          if (wire38[(1'h0):(1'h0)])
            begin
              reg47 <= reg39[(3'h5):(2'h2)];
              reg48 <= ((^~((^((8'hb2) && wire33)) ?
                      $unsigned({reg43}) : {(wire27 != reg47), (^~reg45)})) ?
                  ({($signed(reg47) > (wire37 <<< wire33))} ~^ (^~((~^reg39) <= (!(8'hab))))) : ((8'hb1) ?
                      reg46 : wire34[(4'he):(4'ha)]));
              reg49 <= reg39[(2'h2):(1'h0)];
              reg50 <= (((($unsigned(reg39) << (+wire36)) ?
                          (wire33[(2'h2):(2'h2)] << $unsigned(reg48)) : wire37[(2'h2):(1'h0)]) ?
                      wire28[(3'h4):(2'h2)] : reg44[(3'h5):(2'h3)]) ?
                  ((($unsigned(reg42) <<< $unsigned(wire27)) ?
                          wire29[(3'h6):(3'h6)] : $signed($unsigned(reg49))) ?
                      $signed(reg47[(3'h5):(3'h5)]) : (((wire35 ^~ reg43) > (reg40 & wire37)) ?
                          ((~&wire38) ?
                              (-reg44) : (wire29 ?
                                  wire35 : reg39)) : ((reg39 >>> (8'hb9)) ?
                              {reg45,
                                  wire37} : $unsigned(reg46)))) : wire30[(2'h3):(1'h1)]);
            end
          else
            begin
              reg47 <= reg45[(4'ha):(4'h9)];
              reg48 <= {$unsigned((((|wire38) ^~ reg49) >= wire27[(3'h7):(2'h2)])),
                  (wire28 ^~ (+((|wire31) ? (|reg49) : (~wire27))))};
            end
          if ($signed((-(8'h9c))))
            begin
              reg51 <= reg46;
              reg52 <= (8'hb1);
              reg53 <= ({{((wire37 ? wire34 : reg47) ?
                              (wire36 - reg40) : (wire30 ? wire32 : reg52)),
                          $unsigned((~&wire34))},
                      $signed($unsigned(wire27))} ?
                  (+(&reg45[(4'h8):(1'h0)])) : $unsigned($unsigned(($unsigned(reg50) ?
                      (8'ha3) : wire35[(1'h1):(1'h1)]))));
              reg54 <= ($unsigned(({reg49} != reg49[(1'h0):(1'h0)])) || (8'hbb));
            end
          else
            begin
              reg51 <= (+$signed((((reg44 ?
                  wire30 : wire33) == (+(8'hab))) + (8'ha4))));
              reg52 <= ($signed($unsigned(wire36[(1'h0):(1'h0)])) != (reg51 ?
                  $unsigned(reg41) : {wire28}));
              reg53 <= reg44;
            end
          reg55 <= reg50[(2'h2):(1'h0)];
          reg56 <= $signed(((~|$signed(reg41[(2'h2):(1'h1)])) ?
              $signed(reg54) : $unsigned({reg42})));
        end
      reg57 <= $signed((!reg39));
      if ((^((reg54[(2'h3):(1'h0)] ? wire31[(4'hb):(3'h4)] : wire37) ?
          reg48 : (^~({reg44, (8'h9c)} ? (~^reg45) : wire29)))))
        begin
          if ($unsigned($signed((~^({reg47} | $unsigned((8'ha2)))))))
            begin
              reg58 <= ((!($signed((reg46 >> reg45)) ?
                      $unsigned($signed(wire36)) : ((~|reg45) > $unsigned(reg55)))) ?
                  (~|reg54) : $unsigned($unsigned(reg44[(1'h0):(1'h0)])));
              reg59 <= (wire27 ?
                  ($signed(((reg42 ? reg46 : reg54) ?
                          (wire29 ? reg40 : wire27) : $unsigned(reg52))) ?
                      ({$unsigned(reg55)} ?
                          reg56 : reg41[(1'h1):(1'h1)]) : reg44[(4'h8):(3'h7)]) : ($unsigned(wire38) - (8'h9c)));
              reg60 <= reg54[(4'hd):(2'h3)];
              reg61 <= ({reg52[(3'h4):(2'h2)],
                  wire32[(5'h11):(2'h3)]} == ($unsigned((!$signed(reg59))) <<< (^~$unsigned($signed(reg57)))));
            end
          else
            begin
              reg58 <= ((&(+wire35)) ?
                  (reg42[(1'h1):(1'h0)] << ((reg41 ?
                      reg49[(2'h2):(1'h1)] : ((8'haf) - reg44)) ~^ (8'hb9))) : $signed(wire34[(3'h7):(2'h2)]));
              reg59 <= {$unsigned((($unsigned((8'ha4)) ? (!reg41) : (-reg45)) ?
                      (!$unsigned(reg50)) : reg57))};
              reg60 <= $signed(($unsigned(($signed(wire38) - (+wire26))) == wire33[(3'h4):(1'h1)]));
              reg61 <= $unsigned((-(reg41[(2'h3):(1'h1)] ?
                  (reg48[(1'h1):(1'h1)] >> $signed(wire33)) : wire27)));
            end
          reg62 <= wire26[(2'h3):(2'h2)];
        end
      else
        begin
          reg58 <= {(((wire35 == {reg40}) ?
                  $signed(reg56[(1'h0):(1'h0)]) : $unsigned($signed(wire31))) ^ {wire27})};
          reg59 <= ({(reg58[(2'h2):(1'h0)] ?
                  $unsigned(wire28) : reg49[(1'h0):(1'h0)]),
              ((~|$unsigned(reg42)) ?
                  (8'hbc) : {$signed(wire32),
                      {reg59}})} <<< reg51[(3'h5):(2'h3)]);
          reg60 <= (({{$signed(reg53)}} ?
                  ($signed((reg60 & wire30)) * ($unsigned(reg50) ?
                      reg57 : (wire34 >>> reg60))) : reg43[(4'h8):(3'h4)]) ?
              {(reg62[(4'hf):(4'hb)] ?
                      $signed((^reg55)) : reg40[(3'h5):(2'h2)]),
                  (!((+reg51) ?
                      reg41[(3'h4):(2'h3)] : (wire30 ?
                          (8'h9e) : wire37)))} : $signed($unsigned((reg50[(1'h0):(1'h0)] != {wire26,
                  reg50}))));
        end
    end
  assign wire63 = (+(&(~&(reg43[(3'h5):(2'h2)] != (reg40 ? reg50 : wire33)))));
  assign wire64 = $signed((~(|$signed($unsigned((8'hba))))));
  assign wire65 = $signed($unsigned((8'h9c)));
  assign wire66 = ($unsigned(((~^(wire27 ? wire36 : wire35)) ?
                          {(reg43 <<< (7'h40))} : (((8'ha0) ? reg57 : (8'ha1)) ?
                              $signed(reg43) : {wire65}))) ?
                      ($signed($unsigned(reg45[(4'h8):(2'h3)])) == {$signed(((8'hab) >>> wire38)),
                          reg47}) : $signed((8'hb9)));
  assign wire67 = reg56;
  assign wire68 = (~(|{(reg55[(2'h3):(2'h2)] * reg45[(1'h0):(1'h0)]),
                      (wire67[(4'ha):(4'h8)] + reg39)}));
  assign wire69 = $signed(reg57);
  always
    @(posedge clk) begin
      reg70 <= ($signed($unsigned({$unsigned(reg54)})) ?
          {(reg41 ? (8'had) : ((^reg49) ? $signed(wire34) : wire26)),
              reg55} : (($signed((wire30 ? reg41 : reg62)) ?
              $signed((wire35 ?
                  reg47 : wire38)) : $signed((-wire63))) >= (wire34 ?
              wire66[(2'h3):(1'h0)] : ((reg45 ? reg53 : (8'ha9)) ?
                  ((8'hb0) ? wire29 : reg43) : reg54))));
      if ((~&wire30[(1'h0):(1'h0)]))
        begin
          reg71 <= $unsigned(wire64[(4'hc):(4'hc)]);
          reg72 <= wire64;
          reg73 <= reg40;
          reg74 <= $signed($unsigned($unsigned((reg48 ?
              {reg56, reg61} : ((8'ha1) ^ wire36)))));
        end
      else
        begin
          reg71 <= $signed(wire37[(1'h0):(1'h0)]);
          reg72 <= (reg60 ?
              reg59[(4'h8):(3'h4)] : $signed((^$signed({(8'had)}))));
          reg73 <= $unsigned(({wire28} == (&$signed(wire27))));
          if ((($unsigned(((|wire69) ?
                  reg48[(4'hd):(4'h9)] : (reg51 > reg42))) ?
              $unsigned($unsigned(wire32)) : ((reg48[(1'h0):(1'h0)] - {(8'hb4),
                  wire67}) | (-$unsigned(wire35)))) >>> (8'hbe)))
            begin
              reg74 <= reg73;
              reg75 <= reg47;
              reg76 <= reg52[(4'ha):(3'h4)];
              reg77 <= ((~^wire28[(4'ha):(2'h2)]) ^ wire31[(4'h9):(2'h3)]);
              reg78 <= reg77;
            end
          else
            begin
              reg74 <= (8'hb2);
              reg75 <= (($unsigned(((reg42 ?
                  (8'ha7) : wire37) || wire38)) << $signed($unsigned(wire33))) & $signed($signed(reg48)));
              reg76 <= reg75[(3'h4):(3'h4)];
              reg77 <= $unsigned($signed((~&(8'had))));
            end
        end
      reg79 <= wire38;
      reg80 <= {$unsigned({$unsigned($signed(reg62))})};
      reg81 <= $unsigned(wire68);
    end
  assign wire82 = ($signed(reg77[(1'h1):(1'h1)]) ~^ {$signed($signed($signed((8'ha0)))),
                      (^~$unsigned($unsigned(wire65)))});
endmodule
