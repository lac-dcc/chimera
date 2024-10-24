module top
#(parameter param212 = ((&((&((8'haa) > (8'ha9))) ? (((7'h43) * (8'ha0)) != ((8'hb7) ? (8'ha4) : (8'ha1))) : (7'h42))) ? ((~^((^(8'hb4)) ? (-(8'ha3)) : (^~(7'h43)))) >= ((~|(8'hb8)) >> ({(8'hbe), (8'haf)} ? (~(8'hb8)) : ((8'h9e) ? (8'ha3) : (8'hac))))) : (({((8'hb8) >>> (8'hb2)), {(8'hb4)}} ? (~{(8'hb3)}) : (((8'h9d) ? (8'ha7) : (8'hb3)) <<< {(8'ha8), (8'ha9)})) <<< ((((8'h9e) && (8'hb1)) >>> (-(8'ha0))) ? (((7'h43) ? (8'hb8) : (8'hbd)) + ((8'h9f) ? (8'hbf) : (8'hba))) : {{(8'hb5), (8'haa)}}))), 
parameter param213 = {param212, {param212}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire209;
  wire [(4'h9):(1'h0)] wire208;
  wire [(4'hf):(1'h0)] wire207;
  wire [(3'h4):(1'h0)] wire206;
  wire [(3'h4):(1'h0)] wire205;
  wire [(4'hf):(1'h0)] wire204;
  wire signed [(4'ha):(1'h0)] wire203;
  wire [(2'h2):(1'h0)] wire202;
  wire signed [(5'h13):(1'h0)] wire199;
  wire signed [(2'h3):(1'h0)] wire198;
  wire [(2'h2):(1'h0)] wire197;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire195;
  reg signed [(5'h11):(1'h0)] reg201 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire199,
                 wire198,
                 wire197,
                 wire82,
                 wire84,
                 wire85,
                 wire125,
                 wire127,
                 wire128,
                 wire195,
                 reg201,
                 (1'h0)};
  module5 #() modinst83 (wire82, clk, wire3, wire4, wire2, wire0, wire1);
  assign wire84 = $signed(((&wire3[(4'ha):(4'ha)]) ^~ (7'h43)));
  assign wire85 = $unsigned((~|$unsigned(($unsigned(wire0) ?
                      (wire84 ? wire82 : wire3) : ((7'h42) ?
                          (8'hb7) : wire1)))));
  module86 #() modinst126 (wire125, clk, wire84, wire1, wire82, wire3);
  assign wire127 = ($unsigned($signed({(wire1 + (8'hbd))})) ?
                       (wire3[(3'h4):(2'h3)] ?
                           $signed(wire4) : $unsigned($signed({wire4,
                               wire1}))) : $unsigned(wire4));
  assign wire128 = (&($signed(wire2[(4'h9):(2'h3)]) ?
                       (^($signed(wire85) >>> (wire1 ?
                           (8'hb4) : wire4))) : wire0[(5'h13):(3'h5)]));
  module129 #() modinst196 (wire195, clk, wire4, wire85, wire125, wire82, wire127);
  assign wire197 = {wire82,
                       (wire82 ?
                           wire128[(1'h1):(1'h0)] : (($signed(wire2) ?
                               wire127[(5'h10):(4'he)] : wire127) * (wire2 ?
                               $unsigned(wire3) : $signed((8'hba)))))};
  assign wire198 = $unsigned($unsigned(wire195));
  module86 #() modinst200 (wire199, clk, wire128, wire0, wire1, wire195);
  always
    @(posedge clk) begin
      reg201 <= (~&(8'ha8));
    end
  assign wire202 = wire127[(1'h1):(1'h1)];
  assign wire203 = (~|(!($unsigned((wire202 != (8'hac))) ?
                       $unsigned((wire128 >>> wire198)) : ((wire202 <= wire82) > wire82))));
  assign wire204 = wire1;
  assign wire205 = $signed((((+(wire195 >>> wire127)) > ($signed(wire85) < $unsigned(wire82))) - $signed({(wire199 ?
                           wire82 : wire198)})));
  assign wire206 = $signed(((|$unsigned($unsigned(wire204))) ?
                       (wire204[(3'h5):(2'h3)] ?
                           $signed((wire3 != wire195)) : ({wire0, wire203} ?
                               $unsigned(wire202) : $unsigned(wire125))) : (($signed(wire85) ?
                               {wire3, wire202} : (8'hbc)) ?
                           wire127 : wire1[(5'h14):(3'h6)])));
  assign wire207 = wire127[(2'h2):(2'h2)];
  assign wire208 = (wire3[(3'h4):(1'h0)] ? wire2 : wire202[(2'h2):(2'h2)]);
  assign wire209 = wire0[(1'h0):(1'h0)];
  assign wire210 = $unsigned((~wire3[(5'h14):(4'hb)]));
  assign wire211 = (~(^wire204));
endmodule

module module129  (y, clk, wire130, wire131, wire132, wire133, wire134);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire130;
  input wire signed [(5'h15):(1'h0)] wire131;
  input wire signed [(3'h6):(1'h0)] wire132;
  input wire signed [(3'h4):(1'h0)] wire133;
  input wire signed [(4'ha):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire186;
  wire signed [(3'h6):(1'h0)] wire183;
  wire signed [(4'ha):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire179;
  reg signed [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  assign y = {wire186,
                 wire183,
                 wire182,
                 wire181,
                 wire135,
                 wire136,
                 wire137,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire179,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg185,
                 reg184,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 (1'h0)};
  assign wire135 = $unsigned((wire131[(3'h7):(1'h0)] ?
                       (~wire132[(3'h4):(2'h2)]) : $unsigned(($signed(wire130) ?
                           wire133[(2'h3):(2'h3)] : {wire134}))));
  assign wire136 = (~&$signed($signed($signed($signed(wire134)))));
  assign wire137 = {wire130[(4'hb):(3'h5)]};
  always
    @(posedge clk) begin
      reg138 <= wire130;
      if ((~^{{{wire137, $unsigned(wire130)}}, (!{$unsigned(wire131)})}))
        begin
          if (({{(+$signed(wire133)), wire130[(1'h0):(1'h0)]},
                  wire135[(4'hc):(1'h1)]} ?
              $signed(($signed((wire132 ?
                  wire136 : wire137)) << ($unsigned(wire136) && wire131))) : (-wire130[(3'h5):(3'h5)])))
            begin
              reg139 <= wire136[(4'ha):(1'h0)];
              reg140 <= $signed($unsigned(wire134));
              reg141 <= ({{($unsigned(wire131) + (wire137 ? wire137 : wire134)),
                      (~|$signed(wire135))},
                  wire137[(4'h9):(2'h2)]} << (&$unsigned(((wire135 ?
                      wire132 : wire131) ?
                  (wire133 ? (8'haa) : wire132) : (-wire133)))));
              reg142 <= ($signed({wire131[(5'h12):(1'h0)], reg138}) ?
                  reg141[(3'h7):(3'h7)] : wire132);
              reg143 <= (~^(~|((~&(reg140 ? reg139 : wire135)) ?
                  (~&reg141) : $unsigned((-reg138)))));
            end
          else
            begin
              reg139 <= ((8'hae) ?
                  wire137[(3'h4):(1'h0)] : $unsigned($unsigned(wire136[(4'h8):(3'h4)])));
              reg140 <= reg142;
              reg141 <= (^~$unsigned((-$unsigned((wire134 ?
                  wire136 : wire132)))));
              reg142 <= (~(~&(^{(wire130 ? (8'hb3) : reg139)})));
              reg143 <= (($unsigned(reg138[(3'h5):(1'h0)]) - {(^$signed(wire136)),
                      ($unsigned(wire135) >>> wire135)}) ?
                  reg142 : {$unsigned({reg140}),
                      ($signed((wire135 ?
                          (8'hb7) : wire134)) < {$signed((7'h41))})});
            end
        end
      else
        begin
          reg139 <= $unsigned(reg142);
          reg140 <= (wire130 + (wire130 <= $unsigned($signed({reg141}))));
        end
      reg144 <= (~&((~^$signed(reg142[(1'h0):(1'h0)])) ?
          $unsigned($unsigned((wire132 <= (8'hb7)))) : {reg139,
              $unsigned((|wire136))}));
    end
  always
    @(posedge clk) begin
      reg145 <= $unsigned($signed({($signed(reg144) || (-reg143))}));
    end
  assign wire146 = $unsigned($signed({((~^reg142) ~^ wire132[(3'h5):(3'h5)]),
                       {reg139[(3'h7):(2'h2)]}}));
  assign wire147 = reg141;
  assign wire148 = ((8'hb8) == (((&$unsigned(wire134)) ?
                       ($signed(wire136) ?
                           (wire137 ^~ (8'ha6)) : $signed(reg140)) : $signed(reg139[(1'h1):(1'h0)])) || wire147));
  assign wire149 = $signed($signed((^(~&(reg143 > wire136)))));
  assign wire150 = reg140;
  module151 #() modinst180 (.clk(clk), .wire155(wire148), .y(wire179), .wire154(reg144), .wire153(wire134), .wire152(wire131));
  assign wire181 = ($signed((reg140 && (&wire179))) ?
                       ({(~&(reg141 ~^ wire148)), $signed($signed(wire148))} ?
                           $signed(wire136[(3'h5):(3'h5)]) : $unsigned(((wire137 >= wire132) & (wire136 ?
                               wire134 : wire133)))) : ($unsigned(wire133[(2'h2):(1'h0)]) ?
                           wire148[(2'h2):(1'h1)] : ({(wire147 ?
                                       wire146 : wire179),
                                   $unsigned((8'hac))} ?
                               $signed((~|(8'hb0))) : (^reg145[(3'h4):(2'h3)]))));
  assign wire182 = reg139[(4'ha):(2'h3)];
  assign wire183 = reg139;
  always
    @(posedge clk) begin
      reg184 <= wire135[(3'h4):(3'h4)];
      reg185 <= ((+wire149) ?
          (((wire133 | ((8'ha2) ? wire183 : wire135)) ?
              ($unsigned(wire137) <<< wire130[(4'hc):(2'h3)]) : $unsigned((^~reg144))) && (($signed(reg184) ?
              $signed(wire179) : wire146) <<< wire150[(4'hb):(3'h7)])) : $unsigned(((8'hbe) ?
              (^~$signed(wire130)) : {(+reg139)})));
    end
  assign wire186 = $signed((wire149[(2'h2):(2'h2)] ?
                       $signed($unsigned((~wire182))) : (&((~&wire130) ?
                           (wire146 ?
                               reg144 : wire150) : (reg185 - wire137)))));
  always
    @(posedge clk) begin
      reg187 <= (wire134 << wire131);
      reg188 <= (wire179[(2'h3):(2'h2)] != wire133[(2'h2):(1'h0)]);
      if (({reg184, (7'h41)} << (((^$signed((8'haf))) ?
          {wire179, (reg144 <<< wire130)} : (reg188 ?
              (wire183 >= wire148) : $signed(reg140))) - $unsigned((^(wire136 ?
          wire179 : wire186))))))
        begin
          reg189 <= ((wire186[(4'hc):(3'h7)] <<< reg185) ^~ $unsigned(((~&$unsigned(reg140)) >> $unsigned($signed(reg138)))));
          reg190 <= ($signed(reg141[(1'h0):(1'h0)]) == (^~wire183));
          reg191 <= reg143;
          reg192 <= {((reg188[(3'h6):(3'h4)] ?
                  $signed($signed(reg189)) : wire186[(3'h6):(1'h1)]) > wire146[(4'hd):(2'h3)])};
          reg193 <= ($unsigned((((^~(8'haf)) ?
              (!reg188) : wire183[(1'h1):(1'h1)]) & wire136[(3'h5):(3'h4)])) != $signed((~|$signed((wire186 ?
              reg184 : wire132)))));
        end
      else
        begin
          reg189 <= wire135[(5'h12):(5'h11)];
          reg190 <= wire134;
          reg191 <= (~&reg142);
          reg192 <= (^(&$signed({(wire181 >= wire179), (&reg192)})));
        end
      reg194 <= (((reg188 << (reg184[(2'h2):(2'h2)] ?
          reg145 : (^~reg190))) & $unsigned(wire134)) >>> (^wire181[(2'h3):(1'h0)]));
    end
endmodule

module module86
#(parameter param124 = {(!((|(!(8'h9e))) + (((8'ha3) != (8'hbf)) < ((8'hbf) >> (8'hab)))))})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire [(5'h12):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire118,
                 wire92,
                 wire91,
                 reg123,
                 reg120,
                 (1'h0)};
  assign wire91 = wire89;
  assign wire92 = (8'hb1);
  module93 #() modinst119 (wire118, clk, wire90, wire89, wire87, wire91);
  always
    @(posedge clk) begin
      reg120 <= {wire118[(4'h8):(4'h8)],
          (|$signed(($unsigned((8'ha1)) ? wire91 : wire90)))};
    end
  assign wire121 = wire87;
  assign wire122 = $signed(((wire90[(1'h0):(1'h0)] ?
                           $unsigned($signed(wire92)) : (reg120[(2'h3):(2'h2)] ?
                               $signed(wire118) : (&(8'hb2)))) ?
                       ((+(~reg120)) ?
                           $unsigned((wire88 ?
                               wire87 : wire89)) : (~(^wire92))) : $signed({wire118[(4'h9):(3'h6)]})));
  always
    @(posedge clk) begin
      reg123 <= (^~(8'hbb));
    end
endmodule

module module5
#(parameter param81 = ({(|(((8'ha6) ? (7'h44) : (8'h9d)) ? ((8'hb6) ? (8'hac) : (8'ha4)) : (|(8'ha5)))), {(((7'h43) ^~ (8'hb2)) ? (^~(8'hb6)) : ((8'hb2) << (8'had))), (((8'hb0) ? (8'hb3) : (8'hb4)) & (~(8'ha4)))}} * (~(((|(8'ha1)) ? ((7'h43) ? (8'hbb) : (8'hbb)) : {(8'ha6)}) ? (+((7'h42) ? (8'hbd) : (8'ha5))) : (8'ha5)))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire75;
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire75,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire11 = $signed((wire8 + wire7));
  assign wire12 = {$unsigned((wire10[(3'h5):(2'h2)] >> (&(wire9 ?
                          (8'hbe) : wire10))))};
  assign wire13 = ((($signed(((8'hb1) ? wire9 : wire9)) && ((wire6 > wire7) ?
                          (+wire9) : $unsigned(wire9))) & (((^wire7) ?
                          (wire10 >> wire6) : $signed(wire10)) <<< ($unsigned((7'h41)) == $signed(wire10)))) ?
                      (^wire7) : $signed(({wire6[(4'hb):(1'h0)],
                              wire8[(2'h2):(2'h2)]} ?
                          ((wire10 * wire12) ?
                              {wire9, wire6} : (~|wire12)) : (((7'h40) ?
                              (7'h42) : wire9) != (wire11 ? wire7 : wire9)))));
  assign wire14 = $signed($unsigned($unsigned($signed(wire6[(3'h6):(3'h6)]))));
  always
    @(posedge clk) begin
      reg15 <= wire14;
      reg16 <= ((!$signed(wire12)) ?
          ((~|$signed(wire7)) ^ (~|((wire10 <= wire9) ?
              (wire9 ?
                  wire6 : (7'h40)) : wire11[(4'hb):(4'ha)]))) : {(-$signed(wire13)),
              {(-$unsigned((7'h42)))}});
      reg17 <= ($signed(($signed((~&(8'h9f))) >>> (~&$unsigned(reg16)))) ?
          (^($signed((wire9 ? wire10 : wire14)) ?
              (+$unsigned(wire9)) : wire8[(1'h0):(1'h0)])) : (~|((wire13[(3'h6):(2'h3)] ?
                  (wire11 ^ wire7) : (wire6 | wire13)) ?
              (|(~^wire9)) : ((~^wire6) ?
                  (reg15 ^ reg16) : $unsigned((8'hbd))))));
    end
  assign wire18 = (($unsigned(wire12[(3'h6):(2'h2)]) ?
                      $signed({{reg16,
                              (8'hb5)}}) : wire14[(3'h4):(2'h2)]) >= (wire9[(2'h2):(1'h1)] < $unsigned(((wire8 ?
                          (8'hbf) : wire13) ?
                      wire12[(2'h2):(2'h2)] : (|reg15)))));
  assign wire19 = wire7[(4'ha):(4'h8)];
  assign wire20 = wire19;
  assign wire21 = ($unsigned((wire20[(4'hd):(2'h3)] ?
                          wire10[(3'h7):(3'h5)] : $signed((7'h44)))) ?
                      ((reg15 >= (^~$unsigned(wire6))) ?
                          wire10 : wire19) : (&$signed($signed(wire13[(4'he):(2'h2)]))));
  assign wire22 = ({((|(8'ha5)) < reg16[(2'h2):(2'h2)]), wire7[(4'hd):(4'hc)]} ?
                      {((-(wire20 >>> wire19)) ?
                              (!wire6[(3'h7):(3'h7)]) : (~wire12))} : $unsigned(wire13));
  assign wire23 = $signed((~^(((wire7 ? wire19 : (8'hba)) ?
                      (|(8'ha4)) : (8'hb5)) & reg16[(1'h1):(1'h0)])));
  module24 #() modinst76 (wire75, clk, wire20, reg15, wire22, wire6);
  assign wire77 = ((wire23 < (&(~{(8'ha8), wire6}))) ?
                      $unsigned((^(-$unsigned(wire12)))) : ({{wire12},
                          $signed(wire8)} & wire9));
  assign wire78 = ((8'hab) < (|$unsigned((((8'hb8) << wire23) ?
                      (+wire18) : ((8'hb6) ? wire21 : wire9)))));
  assign wire79 = (|($signed({{wire77}}) ?
                      wire19 : $signed(wire22[(4'hc):(2'h3)])));
  assign wire80 = (&(((+(~|wire22)) ^ wire11[(3'h6):(1'h1)]) * (wire13 ?
                      ((wire7 <= (8'ha3)) ^ (wire79 ~^ (8'h9d))) : wire10)));
endmodule

module module24
#(parameter param74 = (((({(8'hb0), (8'ha5)} ^~ {(8'ha8), (8'hb7)}) + ({(8'hb6)} & ((8'h9e) ? (8'hb5) : (8'hbd)))) - (|{((8'hb2) ? (7'h41) : (8'hac)), ((8'hb8) ? (8'ha4) : (8'had))})) ? {((~^{(7'h44), (8'hb8)}) || ((&(8'ha3)) ? ((8'ha2) <<< (8'haa)) : ((8'ha1) + (8'ha7))))} : (^~((((8'hbc) - (8'haa)) ? ((8'hac) >= (8'ha7)) : {(8'hb5)}) <= (+(+(8'hb5)))))))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(3'h7):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire46,
                 wire45,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
  assign wire29 = ($signed((~^(8'ha3))) && (wire27 ?
                      ((wire25[(3'h4):(1'h0)] >>> wire28[(4'hb):(3'h6)]) <= $signed({wire26,
                          wire28})) : wire27));
  assign wire30 = ((8'ha8) ?
                      (8'ha4) : ((wire28 ?
                          $signed({wire28}) : {wire25[(3'h6):(1'h1)],
                              (wire26 ? wire25 : wire25)}) << wire28));
  assign wire31 = wire27[(1'h0):(1'h0)];
  assign wire32 = wire25[(2'h3):(1'h0)];
  assign wire33 = $unsigned(($signed(((&wire25) << {wire25})) <= wire31[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg34 <= wire28;
      if ((8'h9c))
        begin
          reg35 <= wire28;
          reg36 <= (+reg34[(4'hb):(4'hb)]);
        end
      else
        begin
          if ({({$signed({reg34, (8'haa)}), $unsigned((+(8'h9e)))} ?
                  $signed(reg36) : $unsigned(((wire30 ? wire27 : wire28) ?
                      (8'ha0) : $signed(wire27)))),
              $unsigned($unsigned({wire26}))})
            begin
              reg35 <= (reg35 ?
                  (-(wire25[(3'h4):(3'h4)] - ((wire29 ? wire28 : wire25) ?
                      {wire31, wire30} : (wire29 ?
                          (8'ha3) : reg34)))) : wire26);
            end
          else
            begin
              reg35 <= wire30;
            end
          reg36 <= wire33;
          if ({$signed((wire30 == $unsigned($signed(wire25)))),
              ($unsigned(($signed(wire27) ?
                  (reg35 < wire30) : wire32)) >= {(~&reg35)})})
            begin
              reg37 <= ((+{(((8'hb2) != reg35) ?
                      $unsigned(wire31) : $signed(wire26))}) < ((!reg35) != $signed(wire30)));
              reg38 <= wire28;
            end
          else
            begin
              reg37 <= wire25[(3'h7):(1'h1)];
              reg38 <= $unsigned({{wire26[(1'h1):(1'h0)], (+$signed(wire33))},
                  {$unsigned((!wire31))}});
              reg39 <= reg37[(4'hd):(3'h7)];
            end
          if ($unsigned(reg38[(4'hb):(4'hb)]))
            begin
              reg40 <= wire28[(4'h8):(1'h0)];
              reg41 <= reg35[(4'ha):(3'h6)];
              reg42 <= $unsigned((-$unsigned({(7'h43)})));
              reg43 <= ($signed(wire32[(2'h2):(1'h1)]) <<< {reg41[(2'h2):(1'h0)],
                  $signed(reg34[(3'h4):(2'h2)])});
            end
          else
            begin
              reg40 <= (~|(^reg38[(4'h8):(3'h5)]));
              reg41 <= reg42;
              reg42 <= ($unsigned(wire33[(4'hb):(4'ha)]) | ((8'hbf) * (8'hb5)));
              reg43 <= reg34;
            end
          reg44 <= (^($unsigned($signed(wire29)) ? wire31 : wire28));
        end
    end
  assign wire45 = $unsigned((7'h41));
  assign wire46 = reg44[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg47 <= wire33;
      reg48 <= (reg38[(2'h3):(2'h3)] != {$signed($signed($signed(reg35))),
          $signed({(wire30 ? reg36 : wire46)})});
      reg49 <= $signed(reg35);
      if ({$signed($unsigned((~$signed((8'ha9))))),
          (reg41 << (reg38[(1'h0):(1'h0)] ?
              ((reg49 + reg34) <= (reg48 != reg37)) : $unsigned(((8'h9c) ?
                  reg35 : wire25))))})
        begin
          reg50 <= reg48;
          if (((($signed((reg39 != (8'hb9))) >>> {{reg48},
                  reg38}) != wire30[(1'h0):(1'h0)]) ?
              {$signed(((~reg40) << (!reg34))),
                  $unsigned($unsigned(wire29))} : wire27[(3'h6):(3'h4)]))
            begin
              reg51 <= $unsigned($unsigned((!$unsigned((reg49 ?
                  wire32 : wire27)))));
            end
          else
            begin
              reg51 <= (!(^({(!reg35), (!wire31)} ?
                  $signed(wire28) : $signed((wire26 ? wire29 : reg43)))));
              reg52 <= (~|(wire32 | $signed(((^wire30) ?
                  (8'hbd) : (reg42 ? reg42 : wire28)))));
              reg53 <= ((~^(-(+(wire30 ? wire30 : reg35)))) ?
                  $signed($unsigned(reg51[(1'h0):(1'h0)])) : reg37[(3'h4):(2'h2)]);
            end
          reg54 <= $signed({$unsigned((^~$signed(reg49)))});
          if ((reg34[(4'h8):(1'h1)] ? reg37 : reg53[(3'h4):(3'h4)]))
            begin
              reg55 <= wire26[(2'h2):(2'h2)];
            end
          else
            begin
              reg55 <= wire29[(3'h5):(3'h4)];
              reg56 <= (8'h9d);
              reg57 <= (~|(!$unsigned((7'h43))));
              reg58 <= {wire31[(4'h9):(2'h3)]};
            end
          reg59 <= $signed(wire25);
        end
      else
        begin
          if (reg43[(5'h12):(3'h7)])
            begin
              reg50 <= $signed(reg49[(3'h7):(1'h0)]);
              reg51 <= (|$unsigned((reg51[(1'h1):(1'h1)] - (reg38[(1'h1):(1'h1)] ?
                  wire32[(1'h1):(1'h0)] : $unsigned(wire30)))));
              reg52 <= reg36;
              reg53 <= (($signed($signed(reg55[(2'h3):(1'h0)])) ?
                  (&(reg48 >= $unsigned(wire25))) : $unsigned(reg40)) != {reg42[(3'h7):(3'h5)]});
              reg54 <= (!{(reg34[(3'h7):(3'h4)] >= ((reg39 ? (7'h43) : wire32) ?
                      $unsigned(reg48) : $signed((8'ha2)))),
                  reg58});
            end
          else
            begin
              reg50 <= reg50;
              reg51 <= $unsigned(reg51[(4'hd):(4'hd)]);
            end
        end
      if (($signed({$signed($signed(wire25)), $unsigned($unsigned(reg59))}) ?
          {(~^($unsigned(reg44) ? $signed(wire27) : $signed(reg47))),
              wire28} : reg41))
        begin
          if (({$signed(reg49[(4'h9):(3'h4)])} ?
              ((((reg54 <= reg40) + {wire33, wire30}) | ((+reg38) ?
                      (reg54 ? reg34 : reg57) : (reg50 << (8'hb1)))) ?
                  $signed({reg38,
                      $unsigned(reg41)}) : $unsigned($unsigned((wire32 ?
                      (8'hb0) : wire26)))) : ((^reg59[(1'h1):(1'h0)]) ?
                  wire32 : ($signed(reg51[(3'h5):(2'h2)]) ?
                      reg50 : $signed(reg52[(2'h2):(2'h2)])))))
            begin
              reg60 <= reg56;
            end
          else
            begin
              reg60 <= (+(8'hb3));
              reg61 <= (&(($unsigned((wire33 == reg43)) ?
                  {$unsigned(reg37)} : reg49[(4'h8):(1'h1)]) ^ $signed(((8'h9d) == {reg50,
                  (8'hb3)}))));
              reg62 <= $unsigned($signed((reg60[(2'h3):(2'h3)] >>> $signed((reg47 == reg38)))));
              reg63 <= {{(((reg39 ?
                          reg53 : reg57) ^ (wire30 ~^ reg54)) < ($unsigned(reg51) * wire28))}};
            end
          reg64 <= reg50;
          if (reg39[(3'h4):(2'h3)])
            begin
              reg65 <= (~&reg40);
              reg66 <= $unsigned((~((!reg42) ?
                  (~&(reg55 ?
                      wire26 : wire32)) : $unsigned(reg58[(1'h0):(1'h0)]))));
              reg67 <= ((({$signed(wire46), wire30[(2'h2):(1'h1)]} ?
                  $unsigned($unsigned(reg65)) : ((reg36 * (8'h9c)) ?
                      (reg65 <<< reg54) : (+(7'h44)))) >= $signed(reg52)) > {(reg64 <= reg59[(1'h1):(1'h1)]),
                  ((7'h41) ? (&(^~wire31)) : wire26[(1'h1):(1'h0)])});
              reg68 <= $signed(reg53);
            end
          else
            begin
              reg65 <= (((~($unsigned(reg49) * reg63)) ?
                  $signed($signed((reg37 <<< (8'h9d)))) : reg48[(2'h2):(2'h2)]) - $signed(reg43[(5'h10):(2'h2)]));
              reg66 <= (~{(^~$signed($signed(reg43)))});
              reg67 <= $unsigned(($unsigned(($unsigned(reg60) ?
                      $unsigned(reg49) : (reg52 && reg61))) ?
                  $signed(reg56) : ($unsigned({wire46}) - (&$signed(reg65)))));
              reg68 <= $signed({$unsigned(((-reg40) ? (~&reg35) : (^(8'ha1)))),
                  wire32});
              reg69 <= reg48[(2'h3):(1'h0)];
            end
          reg70 <= wire27[(2'h3):(1'h1)];
        end
      else
        begin
          reg60 <= $signed($unsigned(($unsigned($signed(reg64)) * (((8'hb3) ?
                  reg35 : reg44) ?
              (reg38 > wire26) : $unsigned(reg55)))));
          if (((8'hac) - $unsigned(reg35)))
            begin
              reg61 <= reg34;
            end
          else
            begin
              reg61 <= ($signed((wire25[(4'h8):(2'h3)] ?
                  $unsigned(reg66[(1'h0):(1'h0)]) : reg70)) <<< reg53[(5'h13):(4'hb)]);
              reg62 <= $signed(({$signed((reg52 ? wire27 : reg64)),
                      {reg50, (8'ha6)}} ?
                  reg50[(1'h0):(1'h0)] : $signed(({reg65} ?
                      (~|(8'hb3)) : (wire27 ? reg43 : wire25)))));
            end
          reg63 <= reg53[(4'h8):(3'h4)];
          reg64 <= $unsigned(reg43[(4'hb):(1'h1)]);
        end
    end
  assign wire71 = {(+reg60), reg48};
  assign wire72 = (reg62 > wire25[(3'h7):(2'h3)]);
  assign wire73 = ($unsigned((~&($unsigned(reg59) || (^~(8'hab))))) << (wire28 ?
                      ((~&{reg67}) ^~ $signed((~^reg70))) : reg55));
endmodule

module module93
#(parameter param116 = ((^~((((8'h9d) ? (8'hb6) : (8'hae)) ? ((8'haa) == (8'h9c)) : ((8'ha6) ? (8'haf) : (8'h9e))) - (((8'hb3) ~^ (8'ha4)) <= ((8'hae) ? (8'hbb) : (8'hbe))))) == (&((((8'hb2) | (7'h40)) || ((8'hb3) + (8'had))) ? (!((8'hac) ? (7'h41) : (8'h9f))) : (&(~&(7'h42)))))), 
parameter param117 = param116)
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire97;
  input wire [(5'h10):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  assign y = {wire115,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
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
                 (1'h0)};
  assign wire98 = wire96;
  assign wire99 = $unsigned(({$signed($signed(wire96))} >= wire94[(2'h2):(1'h0)]));
  assign wire100 = ($signed($signed((wire96[(2'h2):(1'h1)] ?
                       (8'hbf) : $unsigned(wire97)))) & wire94[(2'h2):(2'h2)]);
  assign wire101 = (~^(-wire97[(2'h3):(2'h3)]));
  assign wire102 = $unsigned((8'hb7));
  assign wire103 = (|(~^($signed((wire99 & wire100)) ?
                       ($unsigned((8'ha2)) == wire97) : $signed($signed(wire99)))));
  always
    @(posedge clk) begin
      reg104 <= wire94[(3'h4):(2'h2)];
      reg105 <= wire102;
      reg106 <= wire99;
      if ((+{wire94[(1'h0):(1'h0)]}))
        begin
          reg107 <= $signed(($signed(((~|wire95) ?
              (~^wire97) : (wire100 ?
                  wire94 : wire102))) - $signed((&(wire94 | reg105)))));
          if (wire101[(3'h5):(1'h1)])
            begin
              reg108 <= $signed((8'ha7));
            end
          else
            begin
              reg108 <= $signed({$signed({(!wire103),
                      ((8'had) ? (8'ha8) : wire102)})});
              reg109 <= wire95[(3'h5):(3'h5)];
              reg110 <= wire98[(3'h7):(1'h1)];
            end
          reg111 <= {{(((+wire97) ?
                      $unsigned(wire98) : $unsigned(wire97)) >>> reg105),
                  wire102[(3'h4):(2'h3)]},
              (~($signed($unsigned(wire97)) > (wire99[(1'h1):(1'h0)] ?
                  wire94 : ((8'hb9) ? wire101 : reg104))))};
          reg112 <= $unsigned(wire100);
          reg113 <= (((|$signed($signed(wire100))) ?
                  $signed((^~{reg107, wire94})) : ({$signed(reg111),
                          {(8'hb0), reg111}} ?
                      wire102[(3'h6):(3'h6)] : ((wire100 ?
                          wire101 : reg107) - reg108))) ?
              wire98 : (reg108[(3'h7):(3'h6)] ?
                  (~|(wire98[(4'hc):(4'hb)] ?
                      ((7'h41) ?
                          wire96 : (8'hb7)) : wire97[(2'h3):(1'h0)])) : $signed($signed($signed((7'h41))))));
        end
      else
        begin
          reg107 <= (^~(!$unsigned(wire102[(3'h7):(3'h6)])));
          reg108 <= $signed(reg108);
          reg109 <= $unsigned($unsigned(((~^wire95) ?
              ((~reg107) ^ (-reg105)) : reg106[(1'h1):(1'h0)])));
          reg110 <= $signed((+(((^wire98) && (&reg113)) ?
              $signed($signed((8'h9e))) : {(wire103 ? wire97 : wire103)})));
        end
      reg114 <= wire98;
    end
  assign wire115 = $unsigned(wire103[(4'he):(3'h7)]);
endmodule

module module151  (y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire155;
  input wire [(3'h6):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  input wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire [(3'h6):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire172;
  reg [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire172,
                 reg175,
                 reg174,
                 reg173,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg156 <= $unsigned($signed(wire154[(1'h0):(1'h0)]));
      reg157 <= (~&(^~$unsigned(({wire155, wire154} ?
          (^~wire155) : {wire152, wire154}))));
      if (wire154[(3'h5):(3'h5)])
        begin
          reg158 <= wire152[(3'h4):(1'h1)];
          reg159 <= (wire155[(1'h1):(1'h0)] >>> $unsigned({reg158[(2'h3):(2'h2)]}));
          reg160 <= {{(8'hb4)}};
          reg161 <= (!$signed(wire154[(2'h3):(2'h2)]));
          reg162 <= ((^reg161[(3'h6):(3'h5)]) ^ reg160);
        end
      else
        begin
          if (({$signed($unsigned((reg156 - wire153))),
              $signed({(8'hae), $unsigned(reg162)})} ^ wire152))
            begin
              reg158 <= (!$unsigned({(!reg156)}));
              reg159 <= (8'ha1);
            end
          else
            begin
              reg158 <= (+$signed(reg157));
              reg159 <= $signed(reg160);
              reg160 <= (^(reg159 * ((((8'hb9) ?
                  wire153 : reg159) || wire155) && (^~reg162))));
            end
        end
      if (reg158[(1'h1):(1'h0)])
        begin
          reg163 <= reg158[(2'h3):(2'h2)];
          reg164 <= ($signed(wire152) ?
              (reg158[(2'h3):(1'h1)] * ($signed($unsigned(reg157)) ?
                  (wire154 != (reg158 * (8'hab))) : (reg159[(3'h6):(2'h3)] >= $unsigned(reg161)))) : ($signed(({(8'ha6),
                      (8'hab)} ?
                  (8'haf) : $unsigned(reg162))) - (reg159[(1'h1):(1'h0)] ?
                  reg161[(4'h9):(2'h2)] : $unsigned($unsigned(wire152)))));
          reg165 <= (-$signed((wire152 ^~ (^~((8'ha3) - reg159)))));
        end
      else
        begin
          reg163 <= ((((~$signed(reg160)) >= wire154[(3'h5):(3'h5)]) != (wire153 + (7'h44))) << $signed($signed(($signed(wire155) ^ $unsigned(wire153)))));
          reg164 <= $unsigned((~|reg162));
          reg165 <= wire153;
        end
      if ((~|reg159))
        begin
          if ((!($unsigned($unsigned((+wire153))) ?
              $unsigned(((~(8'ha4)) && $signed(reg164))) : $unsigned($unsigned((reg162 & reg159))))))
            begin
              reg166 <= $signed(($signed(((reg157 != wire152) * {reg161})) | $signed((+$signed(reg156)))));
              reg167 <= (^~reg166);
              reg168 <= reg163;
              reg169 <= $unsigned(wire153);
            end
          else
            begin
              reg166 <= (reg169[(1'h0):(1'h0)] || (!{wire154}));
            end
          reg170 <= reg169[(2'h2):(2'h2)];
          reg171 <= reg166[(5'h10):(4'hd)];
        end
      else
        begin
          reg166 <= $unsigned($unsigned($signed(reg171[(3'h4):(1'h1)])));
          reg167 <= (&(~&(((wire152 + reg169) ?
                  {reg160, wire155} : (reg170 ? reg158 : reg169)) ?
              reg166 : ($unsigned(reg165) | (reg159 | (8'had))))));
          reg168 <= $unsigned($unsigned((~((^~(8'hbe)) ?
              reg168[(3'h7):(3'h5)] : $unsigned(reg167)))));
        end
    end
  assign wire172 = (|(reg165 == ($signed((~&reg158)) ?
                       (reg163 ?
                           (!reg167) : (reg169 >> (7'h43))) : {$unsigned(reg159),
                           ((8'haf) ? reg169 : reg171)})));
  always
    @(posedge clk) begin
      reg173 <= $unsigned(((!($unsigned(reg158) ^ {reg164})) & ({$signed((8'hac)),
          (-reg160)} - (8'hbf))));
      reg174 <= (-reg173);
      reg175 <= $signed(reg158[(2'h3):(1'h1)]);
    end
  assign wire176 = reg164[(2'h3):(2'h3)];
  assign wire177 = $unsigned($signed($signed((+(reg167 & (8'haa))))));
  assign wire178 = reg168;
endmodule
