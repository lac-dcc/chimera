module top
#(parameter param328 = (|({(-((7'h41) <<< (8'hbc)))} ? (|((^(7'h44)) ? ((8'hbf) ? (8'hbd) : (8'hbb)) : ((8'ha6) || (8'ha1)))) : (~&{((7'h41) || (8'hb7))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire327;
  wire signed [(4'h8):(1'h0)] wire324;
  wire signed [(5'h13):(1'h0)] wire323;
  wire [(4'hf):(1'h0)] wire322;
  wire [(3'h6):(1'h0)] wire315;
  wire [(4'hc):(1'h0)] wire309;
  wire signed [(3'h4):(1'h0)] wire308;
  wire [(4'he):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire298;
  reg [(3'h5):(1'h0)] reg326 = (1'h0);
  reg [(4'ha):(1'h0)] reg325 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg321 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg320 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg319 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg318 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg317 = (1'h0);
  reg [(4'h9):(1'h0)] reg316 = (1'h0);
  reg [(3'h6):(1'h0)] reg314 = (1'h0);
  reg [(3'h6):(1'h0)] reg313 = (1'h0);
  reg [(4'hb):(1'h0)] reg312 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg311 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg310 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg307 = (1'h0);
  reg [(4'he):(1'h0)] reg306 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg305 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg304 = (1'h0);
  reg [(3'h4):(1'h0)] reg303 = (1'h0);
  reg [(4'hb):(1'h0)] reg302 = (1'h0);
  reg [(3'h4):(1'h0)] reg301 = (1'h0);
  reg [(4'hf):(1'h0)] reg300 = (1'h0);
  assign y = {wire327,
                 wire324,
                 wire323,
                 wire322,
                 wire315,
                 wire309,
                 wire308,
                 wire124,
                 wire6,
                 wire5,
                 wire126,
                 wire127,
                 wire298,
                 reg326,
                 reg325,
                 reg321,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg314,
                 reg313,
                 reg312,
                 reg311,
                 reg310,
                 reg307,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 (1'h0)};
  assign wire5 = wire1[(2'h3):(2'h3)];
  assign wire6 = wire0;
  module7 #() modinst125 (wire124, clk, wire3, wire0, wire5, wire1, wire4);
  assign wire126 = wire0;
  assign wire127 = wire6;
  module128 #() modinst299 (.wire133(wire2), .wire129(wire1), .wire132(wire5), .y(wire298), .clk(clk), .wire130(wire126), .wire131(wire0));
  always
    @(posedge clk) begin
      reg300 <= wire3;
      reg301 <= wire298;
      if (((~^$signed(wire5[(5'h10):(3'h6)])) ?
          (((8'ha4) & ((wire5 || wire1) << (wire127 ?
              wire2 : wire298))) * {($signed(reg300) ?
                  wire298[(1'h1):(1'h0)] : {wire0})}) : {$signed($unsigned((wire298 <<< wire0)))}))
        begin
          reg302 <= (($unsigned($signed((wire127 ^ wire298))) ?
              (~^wire6[(3'h6):(1'h1)]) : $signed($signed(wire127))) ^ (^$signed($signed((wire4 | wire5)))));
          reg303 <= $unsigned({(+wire2[(3'h5):(2'h3)]),
              $signed({$signed(wire4), (wire127 * (8'ha5))})});
        end
      else
        begin
          reg302 <= reg302;
          reg303 <= wire298;
          reg304 <= reg301[(3'h4):(1'h0)];
          reg305 <= $signed({wire3});
        end
      reg306 <= wire3[(2'h3):(2'h2)];
      reg307 <= (reg304[(3'h4):(1'h1)] < $signed({$signed({wire124})}));
    end
  assign wire308 = reg305;
  assign wire309 = ($unsigned(reg307[(3'h4):(2'h3)]) ?
                       (~&wire126[(4'h8):(3'h6)]) : $unsigned(reg303[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg310 <= (^$signed(wire126[(4'ha):(3'h5)]));
      reg311 <= {(~^(^(8'hb4))),
          ($signed((~^$signed(wire1))) ? wire0 : wire1[(4'hd):(2'h2)])};
      reg312 <= (!$unsigned({wire308[(2'h3):(2'h3)]}));
      reg313 <= ($signed($unsigned(reg310)) ?
          $unsigned($unsigned(reg300[(4'h8):(2'h2)])) : ((8'ha0) + wire5));
      reg314 <= $signed(reg305);
    end
  assign wire315 = wire124;
  always
    @(posedge clk) begin
      reg316 <= wire127[(1'h1):(1'h0)];
      reg317 <= ((((^(wire298 > wire127)) ? reg311 : {$unsigned(wire0)}) ?
          {((!(7'h44)) >= wire308),
              wire126[(4'hb):(1'h1)]} : $unsigned(wire126)) != (!$unsigned(wire309)));
      if ($unsigned(reg312[(2'h3):(1'h1)]))
        begin
          if (((-(wire298[(2'h2):(2'h2)] ^~ {reg306, $unsigned((8'ha9))})) ?
              $unsigned(reg317) : wire126[(2'h2):(2'h2)]))
            begin
              reg318 <= wire6[(1'h1):(1'h1)];
              reg319 <= {($unsigned((reg302[(3'h6):(2'h3)] | (reg317 & reg313))) == (-reg304)),
                  wire309[(3'h4):(2'h3)]};
            end
          else
            begin
              reg318 <= wire3;
              reg319 <= (^(wire308 & reg313[(2'h3):(2'h3)]));
              reg320 <= wire3[(3'h7):(2'h2)];
              reg321 <= $unsigned({(+{{(8'ha0)}, $unsigned(wire127)}),
                  (7'h44)});
            end
        end
      else
        begin
          reg318 <= {((((wire0 ? reg306 : wire308) ?
                      wire6 : {reg321, reg302}) && {{(8'had), reg318},
                      (!reg321)}) ?
                  (&((reg313 > (8'haf)) ?
                      wire5 : ((8'h9d) ?
                          reg318 : (8'haf)))) : {$unsigned((wire4 ?
                          wire308 : wire5))})};
        end
    end
  assign wire322 = $signed(($signed((wire309[(1'h1):(1'h0)] ?
                           $unsigned(wire124) : (wire4 || reg312))) ?
                       wire3 : (((+reg313) <= $signed(reg319)) ?
                           (|reg305) : {(^wire3), $unsigned(wire315)})));
  assign wire323 = wire124[(4'h8):(1'h0)];
  assign wire324 = $signed($unsigned(($signed($unsigned((8'haa))) ?
                       {reg304, (^~reg304)} : ((wire308 ?
                           wire124 : wire2) > (!(8'h9d))))));
  always
    @(posedge clk) begin
      reg325 <= $signed((~&$unsigned($signed(wire0[(5'h10):(3'h7)]))));
      reg326 <= wire323[(3'h7):(3'h6)];
    end
  assign wire327 = (7'h41);
endmodule

module module128
#(parameter param297 = (!({({(7'h41)} >>> ((8'ha8) ? (8'hb4) : (8'ha3))), {(8'hba)}} <= (~|{(~^(8'hbf))}))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire133;
  input wire [(5'h13):(1'h0)] wire132;
  input wire [(4'he):(1'h0)] wire131;
  input wire [(4'hc):(1'h0)] wire130;
  input wire signed [(5'h10):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire295;
  wire [(3'h6):(1'h0)] wire268;
  wire [(5'h11):(1'h0)] wire267;
  wire signed [(3'h7):(1'h0)] wire266;
  wire [(4'he):(1'h0)] wire265;
  wire signed [(4'ha):(1'h0)] wire264;
  wire [(4'hf):(1'h0)] wire263;
  wire [(4'hb):(1'h0)] wire262;
  wire [(4'hf):(1'h0)] wire261;
  wire [(4'he):(1'h0)] wire260;
  wire [(2'h3):(1'h0)] wire259;
  wire [(4'hc):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire181;
  wire [(4'hf):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire199;
  wire signed [(4'he):(1'h0)] wire255;
  reg [(5'h11):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(4'h8):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg257 = (1'h0);
  reg [(3'h4):(1'h0)] reg258 = (1'h0);
  assign y = {wire295,
                 wire268,
                 wire267,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire197,
                 wire181,
                 wire180,
                 wire179,
                 wire163,
                 wire161,
                 wire199,
                 wire255,
                 reg183,
                 reg182,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg257,
                 reg258,
                 (1'h0)};
  module134 #() modinst162 (wire161, clk, wire130, wire131, wire132, wire133);
  assign wire163 = $unsigned($unsigned((($unsigned(wire161) ?
                           (wire132 >= wire133) : (wire130 * wire133)) ?
                       ((wire131 ? wire161 : (8'hbc)) ?
                           ((8'hb1) ?
                               wire133 : wire161) : $unsigned(wire133)) : wire132[(5'h10):(3'h7)])));
  always
    @(posedge clk) begin
      reg164 <= {wire129};
      reg165 <= (!(|$unsigned((((8'ha8) == wire161) ?
          wire161[(1'h0):(1'h0)] : wire163))));
      if ($signed(((~^(~wire163[(4'hf):(3'h7)])) ?
          wire132[(4'h8):(2'h2)] : wire131[(3'h6):(3'h6)])))
        begin
          reg166 <= ($unsigned((reg165 ?
              (7'h43) : (8'ha5))) ^~ (|wire131[(3'h5):(1'h0)]));
        end
      else
        begin
          reg166 <= ($signed(($signed((wire132 ? wire161 : wire161)) ?
              wire132 : (8'hb5))) <<< ($signed(wire131) ^ $unsigned($unsigned($unsigned(wire129)))));
        end
      if ($unsigned($signed((8'hb4))))
        begin
          reg167 <= ($signed({$signed(wire129[(3'h5):(3'h5)]),
                  (+(wire133 ? (8'hab) : wire129))}) ?
              wire132 : reg166[(1'h0):(1'h0)]);
          if (((8'hbc) ?
              {$unsigned(((reg164 ^~ wire133) == (wire161 ?
                      reg167 : reg166)))} : (+{reg164[(1'h1):(1'h0)],
                  (|(|wire130))})))
            begin
              reg168 <= $unsigned(wire161);
              reg169 <= wire131[(4'h8):(3'h6)];
              reg170 <= {(reg166[(2'h2):(1'h1)] & wire163[(4'ha):(4'h9)]),
                  ({($signed(reg168) * wire161)} + ({$signed(reg169)} ^ $signed((8'ha2))))};
              reg171 <= $unsigned($signed($unsigned($unsigned($unsigned(wire161)))));
              reg172 <= $signed(({(|$signed(reg167)), $unsigned(wire132)} ?
                  reg171[(2'h2):(1'h0)] : {($unsigned(wire133) < {reg169,
                          reg171}),
                      ($signed(wire131) ~^ (~&wire129))}));
            end
          else
            begin
              reg168 <= $unsigned(wire161[(5'h10):(3'h7)]);
              reg169 <= reg169[(4'hb):(4'hb)];
              reg170 <= $signed(reg172);
            end
          reg173 <= (|wire130);
          if (wire132[(4'hf):(1'h0)])
            begin
              reg174 <= {$unsigned((wire129 ?
                      $unsigned((reg170 != wire131)) : {{reg170},
                          (~&(8'hb1))}))};
              reg175 <= ($unsigned({reg170}) < $signed((!wire132)));
              reg176 <= $unsigned((wire161 == reg166[(1'h1):(1'h0)]));
              reg177 <= ((wire132[(3'h6):(1'h1)] ^ reg164[(3'h4):(2'h3)]) > $signed((8'hb2)));
            end
          else
            begin
              reg174 <= ((~|$signed((8'h9c))) ?
                  (8'hbf) : $unsigned($unsigned(((reg173 ?
                      wire161 : reg176) ^ $unsigned(wire130)))));
            end
          reg178 <= reg169[(4'hf):(4'hd)];
        end
      else
        begin
          reg167 <= $unsigned(((reg166[(1'h0):(1'h0)] ^ $signed((~(8'hb7)))) ?
              reg169[(4'hc):(3'h4)] : wire130));
          if (wire133)
            begin
              reg168 <= wire132;
            end
          else
            begin
              reg168 <= (({((~^(8'had)) ? reg176 : $unsigned(reg164))} ?
                  $signed((~&(reg168 ? wire131 : reg170))) : ({(~wire129),
                      (^reg171)} + ({reg169,
                      reg168} < reg174))) > reg172[(3'h6):(3'h4)]);
              reg169 <= $unsigned((($unsigned(reg170) ?
                  ($unsigned(reg178) * ((8'hb2) ~^ reg169)) : ((reg164 - reg172) - ((8'ha4) ?
                      reg177 : reg170))) ^ ({((8'ha9) || reg165)} ?
                  {$signed(wire132)} : $signed({reg168, wire163}))));
            end
        end
    end
  assign wire179 = (reg173 >>> reg176[(2'h3):(1'h0)]);
  assign wire180 = reg171[(4'ha):(2'h2)];
  assign wire181 = wire180[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg182 <= (!{$unsigned(reg172), wire129});
      reg183 <= (-$signed($unsigned(reg166[(2'h3):(1'h0)])));
    end
  module184 #() modinst198 (.wire187(reg169), .wire188(reg183), .y(wire197), .clk(clk), .wire186(wire163), .wire185(reg182));
  assign wire199 = $signed((wire163[(4'hb):(4'hb)] ?
                       {(8'hb3),
                           (~^$signed(reg183))} : (reg165[(3'h4):(1'h1)] > {((8'hb8) & (8'h9f))})));
  module200 #() modinst256 (.wire202(wire129), .wire205(reg164), .clk(clk), .wire204(wire197), .y(wire255), .wire201(reg170), .wire203(wire161));
  always
    @(posedge clk) begin
      if (((~^reg173[(3'h4):(3'h4)]) < (((~(!wire130)) ?
              $unsigned({(8'hbb)}) : (^(wire129 | reg182))) ?
          (|((reg165 >= wire199) && $unsigned(wire129))) : (({(8'hbb),
                  reg170} - reg170) ?
              ($unsigned(reg176) ?
                  wire163 : $unsigned(reg172)) : (wire131[(3'h6):(2'h3)] ?
                  reg172 : $signed(wire199))))))
        begin
          reg257 <= wire161;
          reg258 <= (((^((~wire132) ?
              $unsigned(reg166) : {wire197,
                  wire199})) <<< $unsigned($signed(reg176))) != (~^reg171[(1'h0):(1'h0)]));
        end
      else
        begin
          reg257 <= (8'hb4);
        end
    end
  assign wire259 = reg257;
  assign wire260 = {$signed(($unsigned((~reg168)) ?
                           ($signed(wire180) ?
                               (-reg177) : reg182[(2'h3):(1'h0)]) : {$signed(wire255),
                               (wire131 ? reg169 : wire199)}))};
  assign wire261 = (((reg173[(1'h1):(1'h0)] ?
                           {$signed(reg164)} : reg258) <= reg167[(3'h4):(1'h0)]) ?
                       $signed(({(wire133 ? (8'hb7) : reg183)} >> (wire259 ?
                           (reg166 + wire132) : (|(8'ha1))))) : (!{reg176}));
  assign wire262 = (wire129[(2'h3):(1'h0)] ^~ $signed($signed(reg177[(4'h9):(4'h9)])));
  assign wire263 = wire260;
  assign wire264 = $signed(wire131[(4'hc):(4'hb)]);
  assign wire265 = {($unsigned({(7'h40)}) ^~ $unsigned({(8'haa),
                           (wire181 <<< wire132)}))};
  assign wire266 = (((wire179[(3'h4):(2'h2)] - $signed((|reg166))) ?
                       wire133[(3'h4):(2'h3)] : $unsigned(reg165[(2'h3):(2'h3)])) <<< ($unsigned((!$unsigned(reg169))) ?
                       wire265 : $unsigned($signed(((8'hb1) + reg257)))));
  assign wire267 = (+wire180);
  assign wire268 = (^(~^(8'hb6)));
  module269 #() modinst296 (wire295, clk, wire163, wire199, reg177, wire179, wire180);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire122,
                 wire87,
                 wire85,
                 wire18,
                 wire17,
                 wire14,
                 wire13,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire13 = $unsigned($signed($unsigned(wire9[(4'h9):(3'h4)])));
  assign wire14 = (+(&($unsigned(wire13[(3'h4):(2'h2)]) < wire13)));
  always
    @(posedge clk) begin
      reg15 <= (~$unsigned(wire8));
      reg16 <= ({$unsigned($signed(wire14)),
          wire10[(2'h2):(1'h1)]} + $unsigned(wire8));
    end
  assign wire17 = wire9;
  assign wire18 = $unsigned(($unsigned((8'ha0)) | wire9));
  module19 #() modinst86 (.clk(clk), .wire22(wire9), .y(wire85), .wire24(wire18), .wire21(reg16), .wire23(wire17), .wire20(wire13));
  assign wire87 = wire85[(3'h6):(2'h3)];
  module88 #() modinst123 (.clk(clk), .wire90(wire85), .wire89(wire9), .wire92(wire87), .wire91(wire12), .y(wire122));
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire92;
  input wire [(4'hb):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire115,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire93,
                 reg118,
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
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire93 = $unsigned(((((~^wire91) ? wire92 : $unsigned(wire89)) ?
                      (wire89[(4'hc):(4'h8)] ?
                          (wire92 ?
                              wire90 : wire92) : {wire91}) : wire91[(4'h8):(1'h1)]) || wire92[(4'hb):(2'h3)]));
  assign wire94 = wire90[(4'hf):(4'hf)];
  assign wire95 = wire93;
  always
    @(posedge clk) begin
      reg96 <= ({wire89[(3'h5):(3'h5)]} | ($signed(wire94) || $signed({$unsigned(wire89)})));
      reg97 <= ((~(($unsigned(wire94) > wire93) << $unsigned((^~wire89)))) ?
          wire90[(4'h8):(2'h2)] : $unsigned($unsigned($signed((wire91 | wire90)))));
    end
  assign wire98 = reg96[(5'h14):(3'h7)];
  assign wire99 = {(wire95[(3'h7):(3'h7)] ?
                          wire93 : $signed(($signed(wire92) ?
                              wire98[(3'h5):(3'h5)] : reg97)))};
  always
    @(posedge clk) begin
      reg100 <= {$signed((~&$unsigned((wire89 + wire92)))), (&wire89)};
      reg101 <= reg97;
      reg102 <= wire98[(3'h7):(1'h1)];
      if (($signed(($unsigned($signed(reg102)) ^~ (^(wire98 ?
          reg96 : (8'hbe))))) & reg101[(4'hc):(1'h1)]))
        begin
          if ((wire92 & (!$unsigned(((wire90 ? wire90 : wire95) ?
              (reg100 ? wire95 : wire98) : wire93[(3'h4):(3'h4)])))))
            begin
              reg103 <= $signed(wire94);
              reg104 <= reg103;
              reg105 <= (~$unsigned($unsigned(($signed(wire93) - $unsigned(wire89)))));
              reg106 <= $signed({{reg100[(2'h3):(2'h2)],
                      wire89[(5'h10):(3'h4)]},
                  {((8'hbb) ? (|wire89) : (|wire90)),
                      (((8'hb4) ? wire90 : reg100) ?
                          $signed(reg105) : $unsigned(wire90))}});
            end
          else
            begin
              reg103 <= wire98;
              reg104 <= wire91[(1'h0):(1'h0)];
              reg105 <= (((~(((8'hb4) && reg97) ?
                      reg96 : (~&wire92))) * $signed(({reg97,
                      wire94} * ((8'hac) ? reg100 : wire91)))) ?
                  (reg105 * (-wire89)) : (+(($signed(reg102) ~^ (wire93 ?
                      reg97 : (8'ha4))) >>> ((+(8'ha4)) ^ ((8'h9e) ?
                      reg103 : (8'ha4))))));
              reg106 <= ((^~{(8'hba),
                  {(!wire90), (wire92 ? (8'hbc) : wire98)}}) <= wire93);
              reg107 <= (~|wire98);
            end
          if ({(reg101 ?
                  $unsigned(wire92) : (wire98[(4'h9):(3'h7)] ?
                      reg105 : (wire92 ^ wire91[(3'h5):(3'h4)])))})
            begin
              reg108 <= ((~&(wire94 - {$unsigned(wire90),
                  (wire99 ?
                      reg102 : wire90)})) <<< ({$unsigned($signed(wire93))} ?
                  {$unsigned((wire95 >= wire94)),
                      $signed({(8'h9d), wire90})} : ((7'h41) ?
                      $signed(wire94) : ((reg103 ? reg107 : reg101) ?
                          (reg107 != wire93) : wire95[(1'h1):(1'h1)]))));
              reg109 <= $unsigned({wire92});
              reg110 <= (!(-(~^reg100)));
              reg111 <= ((~^reg106[(1'h1):(1'h1)]) ?
                  {$unsigned(($signed(reg101) ?
                          {wire89, (7'h44)} : {(8'hbf), reg110})),
                      reg105[(5'h12):(4'hc)]} : (&$signed((wire95 ?
                      reg103[(4'h9):(1'h1)] : (7'h41)))));
              reg112 <= (reg104 >= reg103[(4'hb):(3'h7)]);
            end
          else
            begin
              reg108 <= {(-(8'ha2))};
              reg109 <= $unsigned($unsigned((&$unsigned((wire98 | reg109)))));
              reg110 <= reg106;
            end
          reg113 <= (wire98 <<< (~^(~&$unsigned(wire90[(4'he):(3'h7)]))));
          reg114 <= reg104[(2'h3):(2'h2)];
        end
      else
        begin
          reg103 <= $unsigned($signed((((8'h9c) ?
              (^reg101) : $unsigned(reg112)) == reg114[(2'h3):(2'h3)])));
          if (($unsigned(wire92) ?
              ((~^wire93[(4'hb):(3'h7)]) ?
                  reg101 : reg103) : ((reg110[(4'h9):(2'h3)] * $unsigned(reg103[(1'h1):(1'h1)])) ?
                  $signed($unsigned((+reg113))) : wire91)))
            begin
              reg104 <= reg113[(1'h0):(1'h0)];
              reg105 <= $unsigned($signed((|reg109)));
              reg106 <= (wire94[(2'h3):(2'h2)] ?
                  reg106 : $unsigned((-(~&(~|reg106)))));
              reg107 <= (~|$unsigned(wire90));
            end
          else
            begin
              reg104 <= ($signed(($signed((reg103 ?
                  reg104 : (8'hbf))) >>> {reg101[(3'h4):(1'h1)],
                  reg111[(3'h5):(1'h0)]})) && (8'ha9));
            end
        end
    end
  assign wire115 = reg105;
  assign wire116 = (8'hb5);
  assign wire117 = $signed(reg104);
  always
    @(posedge clk) begin
      reg118 <= ($signed((^~(~^$unsigned(reg101)))) ?
          reg104 : (&(~&($unsigned(wire91) ?
              (!(8'hac)) : wire116[(3'h6):(1'h0)]))));
    end
  assign wire119 = ((reg111[(2'h2):(1'h0)] ?
                           $unsigned(((~|wire93) ?
                               $signed(wire92) : (wire116 << reg112))) : $unsigned(reg108)) ?
                       wire98 : ($unsigned((^wire99[(1'h0):(1'h0)])) >>> {(^$unsigned(reg107))}));
  assign wire120 = $signed((8'hb7));
  assign wire121 = $unsigned((((-(-reg106)) ?
                       (((7'h42) ~^ reg107) ?
                           (reg108 < reg101) : {reg118,
                               reg110}) : reg104[(3'h7):(2'h2)]) >> reg114));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h2e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire25;
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire72,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire28,
                 wire25,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire25 = {wire21};
  always
    @(posedge clk) begin
      reg26 <= ($unsigned((&(|(~&(8'hbd))))) < wire20[(1'h0):(1'h0)]);
      reg27 <= ($unsigned(wire25[(4'hc):(4'hb)]) > $unsigned(((~|(wire22 != wire25)) == ((wire22 ?
          wire21 : wire25) < wire22))));
    end
  assign wire28 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg29 <= $signed((~^(reg26[(4'hb):(3'h6)] | wire20[(2'h3):(1'h0)])));
      reg30 <= wire22[(3'h6):(2'h2)];
      reg31 <= $unsigned(reg27[(2'h2):(1'h1)]);
      reg32 <= ($signed($unsigned((~|$unsigned(wire28)))) || (wire21 ?
          {reg27, $unsigned({reg31, wire24})} : (reg29[(2'h3):(2'h3)] ?
              $unsigned({reg29, reg30}) : {wire20, (wire28 & wire20)})));
      if (($signed(wire20[(2'h3):(2'h2)]) ?
          {wire25} : (wire28 ?
              {$unsigned((reg30 != wire23)),
                  $unsigned($unsigned(reg30))} : {$unsigned($unsigned(reg31)),
                  wire28})))
        begin
          reg33 <= wire21;
          reg34 <= ((+wire21[(2'h3):(2'h3)]) ?
              (&$unsigned(($signed((8'hb8)) <<< (~&wire25)))) : reg29);
          if (wire22)
            begin
              reg35 <= $signed($unsigned({$unsigned((&reg29))}));
              reg36 <= ($signed($unsigned($signed(reg29))) ?
                  reg26 : {reg26,
                      ((((8'ha8) ?
                          reg29 : reg27) * $unsigned(wire23)) ^~ $unsigned((wire20 >> wire20)))});
              reg37 <= $unsigned((&reg32[(3'h5):(2'h2)]));
              reg38 <= reg36[(4'hb):(4'h8)];
            end
          else
            begin
              reg35 <= $unsigned({(~&reg38[(4'hd):(2'h2)])});
              reg36 <= (7'h43);
            end
          reg39 <= $signed({($unsigned(reg35[(3'h5):(2'h2)]) ?
                  wire24 : $signed(reg31[(2'h3):(1'h1)])),
              wire24[(2'h2):(1'h1)]});
          reg40 <= ({($unsigned((+reg26)) > (~((8'ha0) ?
                  (8'ha9) : wire20)))} != ($unsigned(reg30) ~^ $signed(reg38[(4'hb):(4'h9)])));
        end
      else
        begin
          reg33 <= (~$unsigned(wire20[(3'h6):(2'h3)]));
          reg34 <= ($unsigned($signed($signed((reg34 ? reg34 : (8'hb1))))) ?
              (($signed((reg27 || (8'hb6))) ?
                      reg29 : {$signed(reg36), (reg36 ? reg36 : reg26)}) ?
                  reg38 : $unsigned(wire21)) : ((~&($unsigned(wire24) <<< (8'ha2))) ?
                  reg33[(4'he):(4'h8)] : wire21[(3'h6):(3'h6)]));
        end
    end
  assign wire41 = (|$signed(reg31[(4'hb):(4'h9)]));
  assign wire42 = $unsigned((({$unsigned(wire23), reg40[(3'h6):(3'h6)]} ?
                      $unsigned({(8'h9e),
                          reg26}) : $signed((~&reg29))) < (&$signed($signed((8'hab))))));
  assign wire43 = ((wire25[(2'h2):(1'h1)] < $signed(($unsigned(reg35) ?
                      $signed(wire21) : reg39[(4'hc):(4'hc)]))) || $unsigned($unsigned($unsigned($signed((7'h44))))));
  assign wire44 = (reg31 ^~ wire42[(4'he):(1'h1)]);
  assign wire45 = $signed((wire21[(4'h9):(3'h7)] ?
                      $signed(reg27[(2'h2):(1'h0)]) : (^~$signed(reg33))));
  assign wire46 = wire42;
  assign wire47 = $unsigned(wire23);
  assign wire48 = (($signed(wire20) ?
                      ($unsigned(wire23[(1'h1):(1'h0)]) >= ((reg40 ~^ wire28) <= (reg26 && wire45))) : wire45[(3'h4):(1'h0)]) <= (reg37[(3'h6):(2'h2)] - (~|$signed((reg38 | reg39)))));
  always
    @(posedge clk) begin
      if ((wire25[(1'h1):(1'h1)] ?
          (wire20 ?
              $unsigned($unsigned({reg39})) : reg39[(1'h0):(1'h0)]) : $unsigned(wire28[(1'h1):(1'h1)])))
        begin
          reg49 <= $unsigned($signed({reg29[(1'h1):(1'h0)], $unsigned(reg27)}));
          reg50 <= (reg38[(4'he):(3'h7)] == reg34);
          reg51 <= reg30;
          if ((~&{(($unsigned(reg27) >= wire44[(4'hb):(2'h2)]) > (~|$signed(reg30))),
              (reg27[(1'h0):(1'h0)] ?
                  $signed($unsigned((7'h42))) : (reg32 ?
                      (~wire44) : ((7'h40) ^ reg37)))}))
            begin
              reg52 <= (reg36 + {wire22, (|wire41)});
              reg53 <= (reg26 == ($signed((-reg30)) ?
                  ($signed((wire47 ? reg32 : (8'had))) - ((reg32 ?
                      wire24 : reg50) && (~|wire47))) : (~^$signed($signed((7'h41))))));
              reg54 <= $unsigned($unsigned(($unsigned((reg31 ?
                      reg36 : wire44)) ?
                  ((reg26 ? (8'had) : (8'hac)) ?
                      (reg50 ~^ reg51) : (reg38 ?
                          wire24 : reg51)) : ((reg39 < (8'hbe)) | wire20[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg52 <= (reg39[(4'hc):(4'ha)] >= (+(8'hbb)));
              reg53 <= wire24[(1'h1):(1'h1)];
              reg54 <= (~|(~(((wire22 ? wire28 : (8'ha8)) * (|wire43)) ?
                  (|{wire20, wire22}) : $unsigned($unsigned((8'had))))));
              reg55 <= reg37[(1'h0):(1'h0)];
            end
          reg56 <= wire22[(2'h2):(1'h0)];
        end
      else
        begin
          reg49 <= reg27[(2'h2):(1'h0)];
        end
      reg57 <= reg40[(4'h9):(2'h3)];
      if ($unsigned(reg31[(4'hc):(3'h7)]))
        begin
          reg58 <= reg33;
          reg59 <= (wire46[(3'h7):(3'h6)] <= (^((+wire25[(4'hb):(1'h1)]) != ({reg29} == $unsigned((8'hbc))))));
        end
      else
        begin
          reg58 <= (reg31[(4'hd):(3'h5)] ?
              reg59[(1'h0):(1'h0)] : ((7'h41) ?
                  ({(reg33 <= (7'h42))} ? reg31 : reg32) : ({$unsigned((8'hb3)),
                      $unsigned(wire21)} || ((^~wire22) ?
                      $unsigned(wire41) : $unsigned(reg27)))));
          reg59 <= reg50;
          reg60 <= wire47[(2'h2):(1'h1)];
          reg61 <= wire25;
        end
      reg62 <= (wire22[(3'h7):(3'h7)] ?
          $unsigned((-wire25[(3'h7):(1'h0)])) : (~^(&reg27[(3'h7):(1'h1)])));
      if ($signed(wire24))
        begin
          reg63 <= reg30;
          if ($unsigned(wire20))
            begin
              reg64 <= {$unsigned({($signed(wire46) ?
                          reg30 : reg60[(2'h3):(1'h0)]),
                      ({reg40, wire42} ? reg63[(3'h7):(3'h5)] : (|reg36))}),
                  (^(((wire48 ? reg59 : reg55) ?
                          (reg35 << reg55) : (reg51 ? wire28 : (8'ha8))) ?
                      wire45 : ({wire23} ?
                          (wire20 && reg55) : (reg32 ? reg59 : reg56))))};
              reg65 <= wire25[(5'h11):(3'h7)];
            end
          else
            begin
              reg64 <= $unsigned($signed($signed((-(wire24 > reg30)))));
              reg65 <= (reg59[(2'h3):(1'h1)] ?
                  $signed((((reg63 >> wire28) > reg60) || reg26[(3'h6):(2'h3)])) : (+(((reg63 <= reg35) ?
                      $signed(reg31) : $signed(reg38)) ~^ $unsigned($signed(reg57)))));
              reg66 <= $signed(reg57[(3'h4):(1'h0)]);
              reg67 <= (8'hb5);
              reg68 <= $unsigned(($signed((7'h44)) < ((8'ha1) ?
                  {reg53[(4'h9):(4'h9)]} : (wire28 ?
                      ((8'hbb) + reg31) : $unsigned(reg65)))));
            end
          reg69 <= ((($signed($unsigned((8'hbb))) + {$signed(wire47), reg56}) ?
              {(wire25 > $unsigned(reg68))} : {(wire45[(4'hc):(4'h9)] ?
                      (reg27 ? reg39 : reg38) : $unsigned(wire41)),
                  ((wire47 ?
                      (8'hb4) : wire42) >= (reg52 & wire42))}) ~^ {(8'h9e),
              $signed((~|reg57))});
          reg70 <= ({$signed({$unsigned(reg62)})} << $unsigned(reg58));
          reg71 <= (reg55 ?
              $signed(($unsigned(reg29[(3'h5):(2'h2)]) == $signed({reg63}))) : reg40[(4'h8):(1'h0)]);
        end
      else
        begin
          reg63 <= $unsigned(reg71);
          reg64 <= (((~&(+{reg51, (8'h9e)})) & {$signed(reg30[(2'h2):(2'h2)]),
              (wire44 ?
                  $signed((8'hb0)) : reg61[(4'hd):(4'h8)])}) * ($signed((+(reg63 ?
                  reg34 : reg57))) ?
              reg64[(1'h0):(1'h0)] : (&(8'hb6))));
        end
    end
  assign wire72 = $signed($unsigned($unsigned((reg69 <<< (~^wire41)))));
  always
    @(posedge clk) begin
      reg73 <= (((&$unsigned({reg52,
              reg63})) ^~ $unsigned($signed((reg52 > reg60)))) ?
          reg66[(2'h2):(1'h1)] : reg36);
      reg74 <= reg62;
      reg75 <= (+($unsigned((~(reg58 >>> wire43))) >= ((!(~reg62)) <<< (^(reg51 + (8'hbb))))));
      reg76 <= (~^{$unsigned($signed(reg67[(3'h7):(1'h1)])), wire72});
      if (wire72)
        begin
          reg77 <= $signed(reg68);
          reg78 <= reg29[(1'h1):(1'h1)];
          reg79 <= wire48;
          reg80 <= $unsigned($unsigned(reg70));
        end
      else
        begin
          reg77 <= reg57[(3'h4):(1'h1)];
          if ({(8'hbc)})
            begin
              reg78 <= $unsigned({reg50[(2'h2):(1'h0)]});
              reg79 <= reg74[(4'hc):(4'hc)];
              reg80 <= {$unsigned(reg79[(3'h6):(1'h0)]), wire23};
              reg81 <= $unsigned($unsigned({reg71}));
            end
          else
            begin
              reg78 <= $signed((($signed(wire28[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(reg39)) : $signed($signed(reg79))) || reg36));
            end
          reg82 <= $unsigned($unsigned((((wire47 ?
                  (7'h43) : reg76) > (wire24 << reg74)) ?
              $unsigned((|reg69)) : $signed(reg36))));
        end
    end
  assign wire83 = wire24;
  assign wire84 = $signed((wire72 <= wire24[(1'h1):(1'h0)]));
endmodule

module module269
#(parameter param293 = ((+{(~(!(7'h40))), {{(8'hb5)}, {(8'hba)}}}) ? (({(~&(8'h9f)), ((8'h9d) ? (8'hbd) : (8'hbf))} << (((8'ha5) ? (8'hbb) : (8'hbe)) >= {(8'hb1)})) ? ((~|(&(8'ha7))) ? (((8'ha9) ? (8'ha1) : (8'hb0)) - (-(8'hb3))) : (^((8'ha0) ? (8'hbe) : (7'h40)))) : ((^~((8'haa) <= (8'hb3))) ? (((8'hbd) ? (8'ha8) : (8'ha9)) <<< {(8'hb2), (8'h9f)}) : {((8'h9c) < (8'ha5))})) : ((({(8'ha5), (8'ha7)} ? ((8'ha5) ? (8'h9e) : (8'ha3)) : ((8'ha3) ? (8'h9c) : (8'hb0))) ? (~&(|(8'haf))) : ((|(8'hb8)) * ((7'h40) <= (8'hb2)))) ? ((((8'hb6) || (8'ha1)) <= ((7'h41) ? (7'h42) : (8'hae))) ? {{(8'hab)}, (~&(8'hb8))} : (((8'hb0) ^~ (8'hae)) ? ((8'hbc) | (8'hb0)) : ((8'h9e) ? (8'ha9) : (8'hb3)))) : ((^((8'ha1) ? (8'hae) : (8'hb3))) >= {((7'h43) == (8'hb6))}))), 
parameter param294 = {{(param293 ? param293 : {{param293, param293}, (param293 ? param293 : param293)}), (&((+param293) != param293))}})
(y, clk, wire274, wire273, wire272, wire271, wire270);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire274;
  input wire [(5'h15):(1'h0)] wire273;
  input wire [(4'he):(1'h0)] wire272;
  input wire signed [(4'he):(1'h0)] wire271;
  input wire [(3'h4):(1'h0)] wire270;
  wire [(4'h8):(1'h0)] wire292;
  wire signed [(5'h15):(1'h0)] wire291;
  wire [(4'hb):(1'h0)] wire290;
  wire signed [(3'h4):(1'h0)] wire289;
  wire signed [(5'h10):(1'h0)] wire288;
  wire signed [(4'h9):(1'h0)] wire287;
  wire [(2'h2):(1'h0)] wire286;
  wire [(4'h9):(1'h0)] wire285;
  wire signed [(3'h7):(1'h0)] wire284;
  wire signed [(5'h12):(1'h0)] wire283;
  wire [(5'h12):(1'h0)] wire282;
  wire signed [(2'h2):(1'h0)] wire281;
  wire signed [(5'h13):(1'h0)] wire280;
  wire signed [(4'hd):(1'h0)] wire279;
  wire signed [(2'h2):(1'h0)] wire278;
  wire [(3'h4):(1'h0)] wire277;
  wire signed [(4'h8):(1'h0)] wire276;
  wire signed [(2'h3):(1'h0)] wire275;
  assign y = {wire292,
                 wire291,
                 wire290,
                 wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire275,
                 (1'h0)};
  assign wire275 = wire274;
  assign wire276 = wire271[(4'hc):(2'h2)];
  assign wire277 = (wire275 < wire270[(1'h0):(1'h0)]);
  assign wire278 = $signed($signed((!((wire274 << wire276) != $unsigned((8'hba))))));
  assign wire279 = (&{(($unsigned(wire275) ?
                           (wire277 ?
                               wire275 : wire274) : wire273) * (wire272 ^~ ((8'hbc) & wire275)))});
  assign wire280 = wire278[(1'h1):(1'h1)];
  assign wire281 = ($unsigned(wire274[(2'h3):(2'h2)]) > (($unsigned(wire279[(2'h3):(2'h3)]) != $unsigned($signed(wire275))) ?
                       wire273 : $signed(($signed(wire275) ?
                           $unsigned(wire276) : ((8'h9e) | wire275)))));
  assign wire282 = {{(wire272[(4'h9):(4'h9)] && wire272[(4'ha):(3'h4)]),
                           ((-((8'hab) ? (8'hb8) : wire274)) ?
                               wire275[(1'h0):(1'h0)] : (-(^wire271)))},
                       wire270[(3'h4):(1'h1)]};
  assign wire283 = (wire274 ? (~{wire281}) : wire270);
  assign wire284 = (~&wire273);
  assign wire285 = {(!wire284[(3'h4):(1'h1)]),
                       (((~&$unsigned(wire271)) ^~ $unsigned(wire276)) ?
                           (~(~|$signed(wire270))) : $signed({wire271[(3'h4):(2'h2)]}))};
  assign wire286 = {(wire270 ?
                           $signed(((wire272 ? wire275 : wire274) ?
                               (wire280 ?
                                   wire285 : wire270) : (8'ha6))) : {(-((8'ha3) << (8'ha2)))})};
  assign wire287 = (wire276 * (wire284 ?
                       $signed($unsigned($unsigned(wire280))) : $signed({$unsigned(wire272)})));
  assign wire288 = $unsigned((8'hbd));
  assign wire289 = $signed(wire277);
  assign wire290 = (wire287 << wire272[(3'h7):(1'h0)]);
  assign wire291 = {$signed(wire283),
                       $signed($unsigned(wire280[(4'h9):(3'h6)]))};
  assign wire292 = $signed((({(^~wire280),
                       $signed(wire276)} >= ((wire271 && wire288) | (wire281 - wire270))) <<< (wire289[(3'h4):(2'h3)] ?
                       $signed(wire274[(4'hf):(1'h1)]) : (^((8'h9d) & wire271)))));
endmodule

module module200
#(parameter param254 = (~&({(+((8'hb4) ? (8'hbc) : (8'ha6)))} ? ((((7'h43) ? (8'hac) : (8'hae)) ^~ ((8'hae) > (8'h9d))) ? (((8'ha4) > (8'hb6)) - (8'had)) : ({(8'h9d), (8'had)} == ((8'ha4) ^ (8'ha6)))) : (!(7'h43)))))
(y, clk, wire205, wire204, wire203, wire202, wire201);
  output wire [(32'h23c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire205;
  input wire signed [(4'hc):(1'h0)] wire204;
  input wire signed [(2'h2):(1'h0)] wire203;
  input wire [(5'h10):(1'h0)] wire202;
  input wire signed [(4'ha):(1'h0)] wire201;
  wire signed [(4'hf):(1'h0)] wire253;
  wire signed [(5'h13):(1'h0)] wire252;
  wire signed [(3'h5):(1'h0)] wire251;
  wire signed [(5'h12):(1'h0)] wire250;
  wire [(4'hd):(1'h0)] wire249;
  wire signed [(4'hf):(1'h0)] wire248;
  wire signed [(4'ha):(1'h0)] wire247;
  wire signed [(5'h10):(1'h0)] wire246;
  wire [(4'hb):(1'h0)] wire245;
  wire signed [(5'h12):(1'h0)] wire236;
  wire signed [(5'h15):(1'h0)] wire233;
  wire [(4'he):(1'h0)] wire212;
  wire signed [(4'hd):(1'h0)] wire211;
  wire [(5'h12):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  wire [(4'hf):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire207;
  wire signed [(4'hb):(1'h0)] wire206;
  reg signed [(3'h6):(1'h0)] reg244 = (1'h0);
  reg [(4'he):(1'h0)] reg243 = (1'h0);
  reg [(4'h9):(1'h0)] reg242 = (1'h0);
  reg [(3'h6):(1'h0)] reg241 = (1'h0);
  reg [(4'he):(1'h0)] reg240 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg239 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg238 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg235 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg234 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg232 = (1'h0);
  reg [(5'h12):(1'h0)] reg231 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg230 = (1'h0);
  reg [(5'h12):(1'h0)] reg229 = (1'h0);
  reg [(3'h4):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg227 = (1'h0);
  reg [(4'h9):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg225 = (1'h0);
  reg [(4'h9):(1'h0)] reg224 = (1'h0);
  reg [(5'h15):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(3'h6):(1'h0)] reg221 = (1'h0);
  reg [(5'h13):(1'h0)] reg220 = (1'h0);
  reg [(4'ha):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg216 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg215 = (1'h0);
  reg [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg213 = (1'h0);
  assign y = {wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire236,
                 wire233,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg235,
                 reg234,
                 reg232,
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
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 (1'h0)};
  assign wire206 = $signed((wire204[(4'h8):(2'h3)] && $signed(({wire205} ?
                       $signed(wire204) : (wire203 ^~ wire204)))));
  assign wire207 = (wire205 << (wire202 ? wire205 : wire203[(2'h2):(1'h0)]));
  assign wire208 = wire206;
  assign wire209 = $unsigned(((~($unsigned(wire207) ?
                           $unsigned(wire204) : (wire204 ?
                               wire208 : wire204))) ?
                       (8'hb5) : (~^wire208[(2'h2):(1'h1)])));
  assign wire210 = (wire202 ? wire209 : wire204[(1'h1):(1'h0)]);
  assign wire211 = (+wire207);
  assign wire212 = wire202;
  always
    @(posedge clk) begin
      if (((^({(wire207 && wire204)} ?
          {(wire209 ? wire207 : wire207)} : ((wire206 & wire205) ?
              (|wire210) : wire210[(2'h3):(2'h2)]))) ^ (wire201[(3'h4):(2'h2)] ?
          (wire204[(2'h2):(1'h1)] ?
              (~&(wire204 ? wire212 : wire206)) : (wire209[(3'h4):(2'h2)] ?
                  (wire212 ?
                      (8'ha4) : wire203) : $signed(wire202))) : wire202)))
        begin
          if ((!wire204))
            begin
              reg213 <= $unsigned(wire204[(3'h4):(3'h4)]);
              reg214 <= $unsigned(wire205[(1'h1):(1'h1)]);
            end
          else
            begin
              reg213 <= $unsigned(wire205[(3'h5):(2'h2)]);
              reg214 <= (wire203 | (~$unsigned($unsigned((&wire202)))));
              reg215 <= (wire212 ?
                  wire203[(2'h2):(2'h2)] : ($unsigned({(wire208 ?
                              wire205 : wire206),
                          wire203[(1'h0):(1'h0)]}) ?
                      wire202 : ({reg213} ?
                          $unsigned((&reg214)) : (~^(~wire205)))));
            end
          reg216 <= reg214[(1'h0):(1'h0)];
          reg217 <= $signed(wire202[(4'hd):(4'ha)]);
          if (wire202)
            begin
              reg218 <= (wire202 ?
                  (($unsigned($signed(wire203)) >>> (wire210[(4'h8):(4'h8)] + $signed(reg217))) << {$unsigned({wire204}),
                      wire210}) : $unsigned(reg214[(1'h0):(1'h0)]));
              reg219 <= (~{((((8'hbd) || wire202) != $signed(wire203)) ?
                      ((-wire202) ? $unsigned(reg214) : {wire203}) : (wire206 ?
                          $unsigned(reg214) : $signed(reg214))),
                  wire209[(4'hc):(3'h4)]});
              reg220 <= ($signed((reg217[(1'h1):(1'h1)] ?
                  wire205 : $signed((~^wire212)))) & ((~&(wire212[(3'h7):(2'h2)] ?
                  wire204 : $unsigned(wire211))) && ($unsigned((8'hb9)) ?
                  reg217[(1'h1):(1'h1)] : ($signed((7'h40)) ^ $unsigned((8'hbb))))));
              reg221 <= ($unsigned(reg214) + $unsigned(($unsigned((wire208 ?
                      wire203 : wire202)) ?
                  ((wire206 ? wire210 : reg216) ?
                      $signed(wire206) : $signed(reg213)) : wire201[(1'h1):(1'h0)])));
              reg222 <= (-wire207[(2'h2):(1'h1)]);
            end
          else
            begin
              reg218 <= $signed((wire202 ?
                  $unsigned((^~(wire201 ?
                      reg220 : (8'h9d)))) : $unsigned(reg220[(5'h13):(3'h6)])));
              reg219 <= $unsigned(wire207);
              reg220 <= $unsigned(wire202[(3'h6):(3'h6)]);
            end
        end
      else
        begin
          reg213 <= {(~(-reg215)), reg214[(2'h2):(1'h0)]};
          reg214 <= wire201;
          reg215 <= $signed({wire210[(3'h6):(2'h3)]});
        end
      if ((~^$signed((($unsigned(wire204) | {reg214}) ?
          (-$unsigned(reg217)) : reg221[(2'h2):(1'h0)]))))
        begin
          reg223 <= reg219[(3'h6):(3'h6)];
          reg224 <= (+reg219[(3'h5):(2'h2)]);
          reg225 <= wire208;
        end
      else
        begin
          reg223 <= $signed(wire208);
          reg224 <= (~reg222);
          reg225 <= wire208;
          reg226 <= (!(reg221 ?
              {(reg215 | reg224),
                  $unsigned((reg219 > wire204))} : $unsigned((!(reg214 ?
                  reg214 : reg215)))));
        end
      if (($unsigned({(!(wire204 ? (7'h40) : wire210))}) ?
          (reg216 ?
              reg215 : (($signed(reg213) ? $unsigned((8'hb0)) : wire208) ?
                  reg222 : reg220[(4'hf):(3'h4)])) : {(((reg217 ?
                  reg224 : wire208) - wire209) * reg214),
              $unsigned($signed((reg219 < reg215)))}))
        begin
          reg227 <= (+$unsigned($signed($signed($signed(wire211)))));
          reg228 <= wire207[(2'h2):(2'h2)];
        end
      else
        begin
          if (wire210[(5'h12):(5'h10)])
            begin
              reg227 <= $unsigned(({((reg216 ?
                      reg216 : wire202) <= (wire210 & reg219))} << wire203));
            end
          else
            begin
              reg227 <= (({(-wire212)} ?
                  (8'ha7) : $signed(($unsigned(wire203) ?
                      {wire205,
                          reg221} : $signed(reg223)))) != {$unsigned(wire210[(5'h11):(4'h9)]),
                  $unsigned(($signed(reg226) < (~&reg224)))});
              reg228 <= (((~{$signed(reg217),
                  reg218[(5'h15):(2'h3)]}) << reg224[(2'h2):(1'h0)]) < (reg226 ?
                  ($signed(reg223[(2'h3):(1'h0)]) ?
                      (reg228[(3'h4):(1'h0)] << reg215) : $unsigned($signed((8'ha6)))) : $signed((|{wire205,
                      (8'hb4)}))));
              reg229 <= {({wire206} ?
                      $unsigned(((!reg227) - ((8'hbe) ?
                          wire205 : wire206))) : wire211),
                  ((wire202 & (reg223 ^ $signed(wire211))) ^~ reg215)};
              reg230 <= $signed((wire207[(1'h1):(1'h1)] ?
                  (((wire203 <= wire209) + (wire201 && wire203)) & $unsigned(reg229)) : {$signed($unsigned(reg224)),
                      $signed(reg217[(4'hb):(2'h3)])}));
            end
          reg231 <= $signed($signed(($signed(reg216[(4'hc):(3'h4)]) ?
              ($unsigned(wire203) <= reg223[(5'h10):(4'hd)]) : reg229[(4'h8):(1'h1)])));
          reg232 <= reg218[(3'h4):(3'h4)];
        end
    end
  assign wire233 = $unsigned($unsigned((7'h42)));
  always
    @(posedge clk) begin
      reg234 <= {$unsigned(wire201),
          (($signed($signed(reg221)) - wire209[(1'h1):(1'h1)]) >= $unsigned($unsigned((8'haf))))};
    end
  always
    @(posedge clk) begin
      reg235 <= {{{((wire202 ? reg232 : reg232) ?
                      reg215[(3'h6):(1'h1)] : (wire212 ? reg226 : wire209))},
              reg222[(3'h6):(2'h2)]}};
    end
  assign wire236 = (~^({(~(~^reg217)), wire210} ?
                       (-{reg223}) : ((8'hb4) < {$signed(reg225)})));
  always
    @(posedge clk) begin
      reg237 <= ({(reg214[(1'h0):(1'h0)] ?
              reg213[(2'h2):(1'h0)] : (wire208[(4'hc):(4'hc)] & (reg232 ^~ wire206))),
          {(8'ha6)}} > {reg228});
      reg238 <= reg220[(3'h7):(1'h1)];
      reg239 <= (-{(reg222[(3'h7):(2'h2)] * ((^wire201) ?
              {reg214} : (~|wire202)))});
      reg240 <= $signed($unsigned(wire233));
      reg241 <= (^((~|(!reg238)) <= (~|reg215[(3'h7):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg242 <= wire212[(1'h1):(1'h0)];
      reg243 <= $unsigned((~|reg219));
      reg244 <= wire211;
    end
  assign wire245 = reg243;
  assign wire246 = reg215[(1'h1):(1'h0)];
  assign wire247 = reg243;
  assign wire248 = {({((~^reg214) ? $unsigned(reg244) : wire205)} ?
                           ((reg238 ?
                                   $unsigned((8'ha8)) : reg215[(1'h1):(1'h0)]) ?
                               ((reg239 ?
                                   wire212 : wire201) ^~ $signed(reg230)) : ($unsigned((8'h9d)) ?
                                   wire211 : wire233)) : $signed(reg220[(3'h6):(3'h6)]))};
  assign wire249 = reg241;
  assign wire250 = (8'ha9);
  assign wire251 = reg225[(4'ha):(4'ha)];
  assign wire252 = ((reg240[(4'h9):(3'h7)] ^~ (wire207 ?
                       reg226 : $signed((wire212 >= reg238)))) >= $unsigned(reg221[(2'h3):(1'h1)]));
  assign wire253 = (8'haa);
endmodule

module module184  (y, clk, wire188, wire187, wire186, wire185);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire188;
  input wire [(4'h9):(1'h0)] wire187;
  input wire [(5'h15):(1'h0)] wire186;
  input wire [(3'h7):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire196;
  wire [(2'h3):(1'h0)] wire192;
  wire signed [(5'h12):(1'h0)] wire191;
  wire signed [(2'h3):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire189;
  reg [(3'h6):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg194 = (1'h0);
  reg [(4'h9):(1'h0)] reg193 = (1'h0);
  assign y = {wire196,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  assign wire189 = wire187;
  assign wire190 = (($signed(wire187) ^~ $unsigned((!wire187[(2'h2):(2'h2)]))) ?
                       wire187[(4'h8):(2'h2)] : wire187);
  assign wire191 = $signed(wire188);
  assign wire192 = (!wire189);
  always
    @(posedge clk) begin
      reg193 <= (!($signed((~|((8'hb6) ?
          wire191 : wire186))) * ($signed(wire188) ?
          ($unsigned(wire189) ?
              $signed(wire187) : $signed((8'ha8))) : ((wire192 >>> (8'ha8)) < (&wire190)))));
      reg194 <= wire192;
      reg195 <= $unsigned($signed(wire190));
    end
  assign wire196 = wire185;
endmodule

module module134
#(parameter param159 = (~|((8'hbe) ? ((&(^(8'hae))) | (~(^(7'h42)))) : (8'hb5))), 
parameter param160 = {((~{(~|param159), ((8'h9e) < param159)}) ? (param159 != (^(param159 ? param159 : param159))) : (~^param159))})
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire138;
  input wire signed [(4'he):(1'h0)] wire137;
  input wire [(4'he):(1'h0)] wire136;
  input wire [(3'h5):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire148;
  wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire139;
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 reg149,
                 (1'h0)};
  assign wire139 = $signed(wire136);
  assign wire140 = {(wire139[(5'h10):(5'h10)] - wire136),
                       wire137[(3'h7):(3'h5)]};
  assign wire141 = ((wire136[(4'he):(3'h6)] << $unsigned(wire137[(4'h9):(1'h1)])) ?
                       wire138 : (wire135 ?
                           wire137[(4'hc):(3'h4)] : (((-wire135) || wire135) ~^ ({(8'ha9)} && wire135))));
  assign wire142 = wire141[(3'h6):(2'h3)];
  assign wire143 = {(wire136[(3'h7):(2'h2)] ?
                           $unsigned((wire140 ?
                               (+wire135) : wire141[(1'h1):(1'h1)])) : (({wire135} != {wire136,
                                   wire137}) ?
                               wire136 : wire136)),
                       {wire141, $signed((8'haa))}};
  assign wire144 = (wire135 ?
                       $unsigned(({$signed(wire136)} ?
                           $signed($unsigned(wire138)) : ((wire139 ?
                               wire135 : wire137) ^~ wire141))) : {(~&{$signed(wire137)})});
  assign wire145 = {(8'hb3)};
  assign wire146 = (^~$unsigned({$signed((wire140 && wire137))}));
  assign wire147 = {(wire145 ?
                           (($unsigned((7'h40)) - wire137) << $signed(wire136)) : wire139[(2'h2):(1'h0)]),
                       ((~&wire138[(1'h0):(1'h0)]) ?
                           (wire136[(2'h2):(2'h2)] ?
                               {(wire143 ? wire136 : wire135),
                                   (wire141 ?
                                       (8'hb1) : (8'ha5))} : wire145[(3'h7):(1'h0)]) : (($unsigned(wire141) ?
                                   wire137[(2'h2):(2'h2)] : wire139) ?
                               {$signed(wire141)} : wire140))};
  assign wire148 = $unsigned((($signed((!(8'ha6))) ?
                           $signed({wire137,
                               wire145}) : (~|$unsigned(wire142))) ?
                       $unsigned($signed(wire145)) : wire145));
  always
    @(posedge clk) begin
      reg149 <= wire141;
    end
  assign wire150 = $signed($unsigned(($signed(wire141) ?
                       wire141 : (wire137[(1'h1):(1'h0)] ?
                           $signed((8'hb6)) : $unsigned(wire148)))));
  assign wire151 = wire150[(4'hc):(3'h7)];
  assign wire152 = wire138[(2'h2):(1'h0)];
  assign wire153 = (wire141 - $signed((+wire152)));
  assign wire154 = {(($signed(wire142[(4'hb):(3'h4)]) ?
                               $unsigned({wire144, wire144}) : ((wire147 ?
                                       wire140 : wire138) ?
                                   $signed(wire153) : (wire140 || wire151))) ?
                           ({(-wire136), (~&wire137)} ?
                               wire136 : $unsigned({wire152})) : ($unsigned((|wire152)) ~^ $unsigned((^~wire141)))),
                       (-({(8'ha3)} ? $signed({wire135, wire145}) : wire139))};
  assign wire155 = wire152;
  assign wire156 = $signed($unsigned(wire139));
  assign wire157 = $signed(((-wire135) ?
                       (^~(wire143[(4'hd):(1'h1)] ?
                           wire143[(4'hd):(1'h0)] : wire156[(4'ha):(3'h4)])) : wire151[(3'h5):(2'h3)]));
  assign wire158 = $signed({wire151[(4'ha):(2'h3)]});
endmodule
