module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire298;
  wire signed [(4'h8):(1'h0)] wire297;
  wire signed [(2'h3):(1'h0)] wire296;
  wire [(4'h8):(1'h0)] wire295;
  wire [(4'hb):(1'h0)] wire294;
  wire [(3'h6):(1'h0)] wire281;
  wire [(4'hf):(1'h0)] wire280;
  wire signed [(4'hd):(1'h0)] wire279;
  wire signed [(4'he):(1'h0)] wire277;
  wire [(3'h5):(1'h0)] wire276;
  wire [(2'h3):(1'h0)] wire275;
  wire signed [(5'h13):(1'h0)] wire268;
  wire [(5'h13):(1'h0)] wire267;
  wire [(4'hd):(1'h0)] wire265;
  reg signed [(4'he):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg291 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg290 = (1'h0);
  reg [(4'ha):(1'h0)] reg289 = (1'h0);
  reg [(2'h2):(1'h0)] reg288 = (1'h0);
  reg [(5'h11):(1'h0)] reg287 = (1'h0);
  reg [(4'he):(1'h0)] reg286 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg285 = (1'h0);
  reg [(4'he):(1'h0)] reg284 = (1'h0);
  reg [(5'h11):(1'h0)] reg283 = (1'h0);
  reg [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(2'h2):(1'h0)] reg274 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg271 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg270 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg269 = (1'h0);
  assign y = {wire298,
                 wire297,
                 wire296,
                 wire295,
                 wire294,
                 wire281,
                 wire280,
                 wire279,
                 wire277,
                 wire276,
                 wire275,
                 wire268,
                 wire267,
                 wire265,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 (1'h0)};
  module4 #() modinst266 (wire265, clk, wire2, wire3, wire0, wire1);
  assign wire267 = wire3;
  assign wire268 = (wire1[(1'h1):(1'h0)] * ((((wire267 == wire2) >= wire1) - ((wire265 ?
                           wire1 : wire2) ?
                       wire265[(2'h2):(2'h2)] : ((7'h42) ?
                           wire267 : wire267))) ^~ (-(&$unsigned(wire265)))));
  always
    @(posedge clk) begin
      reg269 <= $signed((~&{($unsigned(wire2) ?
              (~^wire2) : wire3[(4'hf):(3'h7)]),
          $signed((wire0 ? wire2 : wire265))}));
      if (wire265)
        begin
          reg270 <= $unsigned($signed(($unsigned(wire267[(4'hb):(1'h1)]) ?
              {{wire2}} : $unsigned($signed(wire265)))));
          reg271 <= reg270;
        end
      else
        begin
          if ($unsigned(wire265))
            begin
              reg270 <= $unsigned((!($unsigned((^wire268)) == {wire1[(4'h9):(2'h2)]})));
              reg271 <= (8'hae);
              reg272 <= {$signed(wire2[(5'h11):(2'h2)]),
                  $unsigned((reg271[(4'hc):(1'h0)] <= $signed((8'hbc))))};
              reg273 <= wire3[(5'h10):(4'hf)];
            end
          else
            begin
              reg270 <= $signed(wire268);
              reg271 <= {(reg270[(3'h6):(1'h1)] > reg269)};
              reg272 <= (reg269[(1'h0):(1'h0)] ?
                  {reg271} : reg272[(2'h2):(1'h1)]);
              reg273 <= $signed(((reg270[(2'h3):(2'h3)] ^ ($signed(wire268) ?
                      $signed(wire3) : (8'ha5))) ?
                  (wire267 ?
                      $signed($signed(reg273)) : (wire2[(4'ha):(4'h9)] > (reg273 ?
                          (8'h9f) : reg272))) : ((~|(~reg269)) ?
                      wire1[(2'h3):(2'h3)] : (wire3[(4'h9):(3'h6)] ?
                          wire2 : wire0[(5'h10):(4'h8)]))));
              reg274 <= $unsigned(wire268);
            end
        end
    end
  assign wire275 = wire268;
  assign wire276 = $unsigned(($unsigned({(+wire0), wire268}) ?
                       reg272[(2'h2):(1'h0)] : wire268[(4'hd):(4'hb)]));
  module4 #() modinst278 (.clk(clk), .wire5(wire267), .y(wire277), .wire8(wire265), .wire6(wire268), .wire7(wire3));
  assign wire279 = (~&$unsigned((^$signed($unsigned(reg270)))));
  assign wire280 = wire279;
  assign wire281 = (~^$signed(({(wire267 ^ reg272),
                       reg270[(1'h0):(1'h0)]} >= $signed($signed(wire265)))));
  always
    @(posedge clk) begin
      if ($unsigned(((8'h9d) ?
          {(reg272[(4'ha):(2'h2)] ?
                  (7'h41) : (wire267 ?
                      reg270 : reg270))} : reg270[(3'h5):(1'h0)])))
        begin
          reg282 <= (~(wire276 ? wire0[(2'h3):(1'h0)] : wire279));
          reg283 <= $unsigned(wire277[(4'hb):(3'h5)]);
          reg284 <= ($signed(wire265[(1'h0):(1'h0)]) ?
              $unsigned({(reg270[(3'h4):(2'h2)] ?
                      $unsigned(wire276) : wire277)}) : reg271);
          if ((|(((|$unsigned(wire0)) ?
              wire275[(2'h3):(1'h0)] : (wire275 - wire279)) + {$unsigned($signed(reg269))})))
            begin
              reg285 <= reg274[(1'h0):(1'h0)];
              reg286 <= wire265;
            end
          else
            begin
              reg285 <= ((($unsigned(reg269) || wire1) ?
                      $signed(((wire279 ~^ reg270) ?
                          {(8'hb4), reg269} : $unsigned(reg273))) : (reg274 ?
                          ((~&wire268) ?
                              (wire279 && reg282) : (wire0 || (8'hab))) : ($signed((8'h9c)) ?
                              {reg273} : wire3[(5'h11):(4'h9)]))) ?
                  ($signed(reg273) ?
                      reg269 : (reg272[(4'hc):(4'h8)] ^ $unsigned(reg282))) : ($signed(((reg271 ?
                          wire277 : reg283) ?
                      (reg269 ?
                          reg283 : wire276) : (|wire281))) || (&(+$unsigned(reg272)))));
              reg286 <= wire268;
              reg287 <= reg286[(3'h5):(2'h2)];
            end
        end
      else
        begin
          reg282 <= $signed((~|(((+wire281) ?
              (&wire267) : reg273) + $signed((reg269 - reg270)))));
          if ($unsigned($unsigned(({$signed(reg287)} ?
              {(wire276 ?
                      (8'hb0) : (8'hac))} : ((reg274 && wire268) == ((7'h40) ?
                  wire279 : wire2))))))
            begin
              reg283 <= {$signed($unsigned(((wire3 - reg284) ?
                      wire0[(1'h1):(1'h1)] : $signed(reg271))))};
              reg284 <= (reg283[(4'hc):(3'h5)] ?
                  ((-wire280) ?
                      ($signed((wire281 ? (8'hb3) : wire268)) ?
                          {wire265,
                              $unsigned(reg287)} : wire280) : $signed((&(reg286 ?
                          wire281 : reg272)))) : ((wire3[(3'h4):(1'h0)] ?
                          (|$signed(reg282)) : {(+wire268)}) ?
                      $unsigned(((+reg271) ?
                          (^~(8'h9d)) : (+(8'hb7)))) : wire0[(2'h3):(2'h2)]));
              reg285 <= (+(wire281 ?
                  reg284 : ((wire267 >= (+wire280)) ?
                      ((reg286 && wire267) ?
                          $unsigned(reg283) : {wire276, (8'hac)}) : ((wire281 ?
                          reg270 : wire280) ~^ (!reg272)))));
            end
          else
            begin
              reg283 <= {($signed(wire279) ~^ (wire280[(4'ha):(3'h6)] >> ((wire268 ?
                      wire3 : wire268) >> (+reg269))))};
              reg284 <= $unsigned($unsigned(((wire1[(4'h8):(1'h0)] && reg284) >= wire3[(4'hf):(4'ha)])));
              reg285 <= ({reg282[(3'h4):(1'h0)]} ?
                  wire3 : $signed((wire2[(3'h7):(3'h7)] == wire1)));
              reg286 <= wire276;
              reg287 <= reg282;
            end
          reg288 <= (8'ha2);
          if ((wire275 >> $unsigned({($unsigned(wire280) ?
                  (reg286 ? wire276 : reg288) : wire268),
              $signed($signed(wire3))})))
            begin
              reg289 <= ($signed((wire280[(4'h8):(3'h7)] && ((-wire2) ^~ (8'hb2)))) > (&(($unsigned(wire2) <<< (~&reg271)) ?
                  (reg287 ?
                      (8'ha3) : (-reg286)) : $unsigned((wire277 <= (8'hb4))))));
              reg290 <= {reg288};
              reg291 <= (~{reg284});
            end
          else
            begin
              reg289 <= reg271;
              reg290 <= $unsigned(wire281[(3'h6):(3'h4)]);
            end
        end
      reg292 <= $unsigned($unsigned((($unsigned(wire275) > reg273) <<< (|$signed(reg290)))));
      reg293 <= $signed(((wire281 ~^ (reg271 << {reg272,
          wire279})) <= (((reg269 - reg288) < $unsigned(wire3)) | ($signed(wire3) << ((8'hb5) >> (8'hba))))));
    end
  assign wire294 = wire268;
  assign wire295 = $unsigned(wire1);
  assign wire296 = (+$signed(wire3[(2'h2):(1'h1)]));
  assign wire297 = $unsigned(((8'h9f) ?
                       $signed($unsigned({(8'hb7),
                           wire0})) : $signed({(wire265 ?
                               wire276 : (8'hb4))})));
  assign wire298 = reg274[(2'h2):(2'h2)];
endmodule

module module4
#(parameter param263 = ({((|{(8'hbb), (8'ha1)}) < (!((8'hb6) ? (8'hbc) : (8'had))))} ? ((((~|(8'ha8)) ? ((8'ha8) + (8'ha2)) : ((8'h9c) ? (7'h43) : (8'ha1))) >> ((~&(8'ha9)) ? {(8'hac)} : ((7'h41) && (8'h9d)))) ? (+(((8'ha3) >= (8'ha5)) ? ((8'h9f) ? (7'h41) : (8'hb6)) : ((8'hb7) ? (8'ha8) : (8'h9e)))) : (|({(8'ha2), (7'h44)} <<< (~^(8'haf))))) : ((^(((8'ha6) && (7'h44)) >> ((7'h44) ? (8'ha0) : (8'ha5)))) && (~|({(8'ha2)} >= ((8'hb8) >> (7'h43)))))), 
parameter param264 = (+(~|(param263 << (((8'hab) || param263) ^~ (param263 >>> param263))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h34d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire261;
  wire [(4'h8):(1'h0)] wire260;
  wire signed [(5'h14):(1'h0)] wire259;
  wire [(4'ha):(1'h0)] wire240;
  wire [(5'h10):(1'h0)] wire193;
  wire signed [(5'h14):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire238;
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg242 = (1'h0);
  reg [(5'h13):(1'h0)] reg243 = (1'h0);
  reg [(3'h5):(1'h0)] reg244 = (1'h0);
  reg [(4'he):(1'h0)] reg245 = (1'h0);
  reg [(2'h3):(1'h0)] reg246 = (1'h0);
  reg [(4'hd):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg249 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg250 = (1'h0);
  reg [(5'h11):(1'h0)] reg251 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg252 = (1'h0);
  reg [(3'h6):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg254 = (1'h0);
  reg [(5'h11):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg256 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg257 = (1'h0);
  reg [(2'h3):(1'h0)] reg258 = (1'h0);
  assign y = {wire261,
                 wire260,
                 wire259,
                 wire240,
                 wire193,
                 wire146,
                 wire145,
                 wire143,
                 wire95,
                 wire78,
                 wire32,
                 wire21,
                 wire20,
                 wire11,
                 wire10,
                 wire9,
                 wire34,
                 wire76,
                 wire238,
                 reg148,
                 reg147,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg241,
                 reg242,
                 reg243,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg251,
                 reg252,
                 reg253,
                 reg254,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 (1'h0)};
  assign wire9 = (wire5 ? wire8[(3'h5):(1'h0)] : wire8[(1'h0):(1'h0)]);
  assign wire10 = wire5;
  assign wire11 = {$unsigned(((wire8 ? wire7 : (~&wire7)) > wire7))};
  always
    @(posedge clk) begin
      reg12 <= (^~(~|$signed($unsigned(wire6))));
      if ((~^$signed(reg12)))
        begin
          reg13 <= $unsigned(wire5[(3'h5):(1'h1)]);
          if (wire10[(4'ha):(2'h3)])
            begin
              reg14 <= ($signed(reg12[(1'h1):(1'h0)]) ?
                  $unsigned(($signed(reg12[(3'h4):(2'h2)]) ?
                      $unsigned($unsigned(wire11)) : $unsigned((+wire11)))) : {wire5,
                      (|reg13)});
              reg15 <= $signed({(wire9 ? (~^(reg12 ~^ wire7)) : (&(+wire5))),
                  $unsigned(wire7[(3'h4):(1'h0)])});
              reg16 <= $signed(((~&reg15[(3'h6):(1'h0)]) ?
                  (^~(~&wire9)) : (reg12 > $unsigned(wire8))));
              reg17 <= wire8[(3'h5):(1'h0)];
              reg18 <= (($signed((^~reg15[(4'h8):(3'h6)])) ?
                      wire8[(1'h1):(1'h0)] : wire10) ?
                  (wire8[(3'h7):(1'h0)] ?
                      wire9 : ({wire5[(2'h3):(2'h2)]} & (~wire7))) : $unsigned(((|(^~reg17)) != reg17)));
            end
          else
            begin
              reg14 <= $signed(((reg14[(2'h2):(1'h1)] ?
                  (((8'h9d) ? reg18 : wire9) * {reg15,
                      (8'hb8)}) : reg18[(3'h4):(3'h4)]) <= reg13));
              reg15 <= wire5[(2'h2):(2'h2)];
              reg16 <= ((8'hbd) ?
                  $unsigned((8'hb3)) : (wire9 ?
                      $signed($signed($signed(wire9))) : wire6));
              reg17 <= $unsigned($unsigned(wire11));
              reg18 <= (8'ha4);
            end
          reg19 <= ((~(((~&(8'ha2)) ? (wire10 ? reg17 : wire6) : reg16) ?
              $unsigned(((8'hb2) >= wire11)) : wire11[(4'h8):(2'h3)])) >> $signed($unsigned((wire5 ^ (wire9 || reg12)))));
        end
      else
        begin
          reg13 <= ($signed($unsigned($unsigned((~&wire6)))) ?
              $unsigned({(wire8 << reg15[(5'h11):(4'hf)]),
                  {$signed(reg17),
                      (8'ha5)}}) : ((8'hbf) + $unsigned($signed(reg16[(1'h1):(1'h0)]))));
          reg14 <= ({(8'had)} != $signed(wire10));
        end
    end
  assign wire20 = ($unsigned(wire6) < (reg18[(5'h10):(4'hf)] || wire7[(1'h0):(1'h0)]));
  assign wire21 = {$unsigned($signed((8'had)))};
  module22 #() modinst33 (.y(wire32), .wire26(wire6), .clk(clk), .wire23(wire9), .wire25(wire10), .wire24(reg17));
  assign wire34 = (~^(reg18 + (-($unsigned(wire20) == $unsigned(wire32)))));
  module35 #() modinst77 (wire76, clk, wire7, reg13, wire10, wire32);
  assign wire78 = (&$unsigned(($unsigned(wire11) > wire76[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if ($unsigned(((wire7 - reg14[(3'h5):(3'h4)]) << $signed(wire21))))
        begin
          reg79 <= reg13;
          reg80 <= reg12;
        end
      else
        begin
          if (wire21[(4'hc):(3'h7)])
            begin
              reg79 <= {reg79};
            end
          else
            begin
              reg79 <= $unsigned($signed((~$unsigned($unsigned(wire21)))));
              reg80 <= (reg19[(3'h5):(1'h1)] == ($signed({$signed(reg13)}) ^ $unsigned(wire7[(4'h9):(2'h2)])));
              reg81 <= reg80;
              reg82 <= $unsigned((&reg17[(3'h4):(2'h3)]));
            end
          reg83 <= $signed(($signed(reg79) <<< {wire11[(4'hb):(1'h0)],
              (&reg17)}));
          reg84 <= ((~(&{(wire32 >= reg14), reg17[(2'h3):(1'h0)]})) ?
              $unsigned($signed(reg17)) : (-(~&$unsigned($signed(wire5)))));
          reg85 <= ((^$signed(((~^wire10) ^~ $unsigned(reg12)))) != ($signed((((7'h44) ?
                  reg81 : wire6) ?
              (-wire76) : (wire76 ^ wire32))) >= wire8[(1'h0):(1'h0)]));
          if ($signed((~{((!reg85) ? (&(8'hb3)) : {wire6, reg14}),
              $signed($signed(reg19))})))
            begin
              reg86 <= (8'h9f);
              reg87 <= $unsigned((^$signed($signed($signed(reg17)))));
            end
          else
            begin
              reg86 <= $signed((wire32 ?
                  ($unsigned($unsigned(reg13)) != reg16) : $unsigned(reg13)));
              reg87 <= (|reg82);
              reg88 <= reg83[(5'h10):(3'h4)];
              reg89 <= (($unsigned(reg80[(3'h5):(3'h4)]) ?
                  wire7[(4'ha):(4'h8)] : wire11[(3'h6):(3'h6)]) ^~ {reg88});
              reg90 <= $unsigned(((|reg83) ? wire7[(4'ha):(4'ha)] : (!reg85)));
            end
        end
      reg91 <= $unsigned($unsigned(((8'had) ? (8'hbb) : reg80)));
      reg92 <= ((7'h43) ^~ {wire5, reg13});
      reg93 <= $signed((($unsigned((|reg13)) || $unsigned((reg82 & reg19))) ?
          $unsigned($unsigned((reg16 ?
              wire8 : wire32))) : (($unsigned(wire21) > $signed(reg84)) ?
              $signed($signed(wire76)) : (wire34 ?
                  $unsigned(reg15) : (~(8'hbd))))));
      reg94 <= wire76;
    end
  assign wire95 = $signed((reg86 - $signed((reg83 ?
                      (!wire6) : (wire32 && reg18)))));
  module96 #() modinst144 (.wire99(wire11), .wire97(reg15), .y(wire143), .wire98(reg90), .wire100(wire76), .wire101(reg12), .clk(clk));
  assign wire145 = reg12[(1'h0):(1'h0)];
  assign wire146 = wire7[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg147 <= $unsigned({$signed(wire146[(5'h14):(5'h12)])});
      reg148 <= ((~|wire21[(3'h4):(2'h2)]) << (($signed((8'ha5)) ?
              {(reg87 ? reg82 : reg12)} : $signed(wire76)) ?
          wire9[(3'h7):(2'h3)] : (reg84[(4'h8):(3'h5)] ~^ $signed((wire143 && wire34)))));
    end
  module149 #() modinst194 (wire193, clk, wire10, wire7, reg85, wire76);
  module195 #() modinst239 (.wire196(reg92), .wire199(wire32), .wire197(reg148), .clk(clk), .wire200(reg82), .y(wire238), .wire198(reg94));
  assign wire240 = $signed(reg85[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire145)
        begin
          reg241 <= wire78[(2'h2):(2'h2)];
          if (reg89)
            begin
              reg242 <= ((reg79 ? $signed(reg17) : $signed($unsigned(wire9))) ?
                  $unsigned($signed({(+wire10),
                      (wire76 ? reg92 : reg147)})) : wire8);
              reg243 <= ($unsigned(($signed($signed(reg148)) ^ $signed((^reg242)))) ?
                  (8'hbe) : (wire9 ~^ $unsigned((^~wire143[(5'h10):(4'hc)]))));
              reg244 <= $signed($signed($signed((8'h9d))));
              reg245 <= reg82;
              reg246 <= ({reg16} < (^~$signed($unsigned({reg82}))));
            end
          else
            begin
              reg242 <= reg91[(5'h11):(4'he)];
              reg243 <= wire95;
              reg244 <= (!(reg80 <= (wire9[(4'hc):(4'hc)] ?
                  ($signed(wire21) ? (8'hbf) : $signed(reg85)) : {(~^wire5)})));
              reg245 <= wire193[(4'hb):(1'h1)];
              reg246 <= $unsigned(reg148);
            end
        end
      else
        begin
          reg241 <= (reg87[(2'h3):(1'h0)] ?
              $signed({(((7'h42) != wire240) && (wire32 != reg93)),
                  ((wire240 ? reg92 : wire78) ?
                      $signed(reg83) : (^reg93))}) : (reg245[(1'h1):(1'h1)] == ((^(&wire11)) ?
                  (+$signed((8'hba))) : (^$unsigned(wire193)))));
          if (reg241[(4'hf):(4'hb)])
            begin
              reg242 <= $signed({(8'ha2),
                  ($signed(reg90) ?
                      $unsigned(reg17) : ($unsigned(wire238) == (~^wire20)))});
              reg243 <= $unsigned($signed($signed(wire146)));
            end
          else
            begin
              reg242 <= $unsigned((($signed((~reg245)) ?
                      reg12[(2'h3):(2'h3)] : {(reg85 ? reg19 : reg244),
                          wire193[(4'h8):(3'h4)]}) ?
                  (^($unsigned(reg244) ?
                      {reg93} : $signed(reg17))) : wire9[(4'hf):(4'hd)]));
              reg243 <= ($unsigned({((~|reg15) && $signed(reg80)), wire143}) ?
                  wire20[(2'h2):(1'h1)] : reg81);
            end
        end
      reg247 <= $signed((~^($unsigned(reg244) && reg79)));
      if ($signed(wire34[(4'hd):(4'h8)]))
        begin
          reg248 <= $unsigned($unsigned($unsigned(((wire5 | reg85) ~^ reg90[(4'ha):(3'h5)]))));
          reg249 <= reg82;
          reg250 <= ({wire146} ?
              (((8'ha3) | $unsigned(reg80[(4'h9):(3'h5)])) ?
                  (wire10 >> wire95) : (~|$unsigned($signed(wire21)))) : $unsigned($unsigned(($unsigned(reg88) + $signed(wire146)))));
          reg251 <= reg81;
          if ($signed(($unsigned(reg88) != (8'hb3))))
            begin
              reg252 <= reg90[(3'h4):(1'h1)];
              reg253 <= (|reg16[(1'h1):(1'h1)]);
              reg254 <= (8'hbb);
              reg255 <= (8'hba);
              reg256 <= ($unsigned($unsigned(((reg254 ?
                  (8'hb7) : reg88) <= reg147))) <<< reg254[(1'h1):(1'h1)]);
            end
          else
            begin
              reg252 <= ((8'hbb) + (!(-$signed((wire20 ? wire11 : reg248)))));
              reg253 <= (($signed((wire95[(3'h7):(3'h4)] ?
                      (^wire20) : wire193)) <<< $signed(reg256[(3'h6):(2'h3)])) ?
                  (-{{wire143[(1'h1):(1'h1)],
                          reg79[(3'h4):(3'h4)]}}) : $signed($unsigned(reg12[(2'h3):(1'h0)])));
              reg254 <= (reg251[(4'hb):(3'h7)] ~^ (($signed({wire5}) ?
                      wire76 : $signed(reg241)) ?
                  $unsigned($signed((wire193 >>> reg18))) : wire146));
            end
        end
      else
        begin
          reg248 <= $signed((+reg80));
          reg249 <= {reg256};
          reg250 <= (~((^wire78[(1'h1):(1'h0)]) * $signed(reg256)));
          if ($signed(({reg80} ? reg241 : {({wire7} & wire5)})))
            begin
              reg251 <= wire9[(1'h1):(1'h0)];
              reg252 <= reg252;
              reg253 <= $signed(wire21);
              reg254 <= reg89[(2'h2):(1'h1)];
              reg255 <= reg87[(3'h7):(1'h0)];
            end
          else
            begin
              reg251 <= $unsigned($signed(reg13));
              reg252 <= ($signed((reg148 ?
                      $signed((reg245 ? reg17 : (8'h9d))) : (8'ha4))) ?
                  (!(^(!$signed(reg242)))) : reg79[(1'h0):(1'h0)]);
              reg253 <= {(~^reg18)};
              reg254 <= reg87[(2'h2):(1'h1)];
              reg255 <= $signed(wire9);
            end
        end
      reg257 <= (8'h9f);
      reg258 <= ((reg87[(3'h5):(3'h5)] ?
          (reg249[(4'ha):(2'h3)] ?
              ((wire238 >>> wire193) ?
                  $signed(reg245) : $unsigned(reg15)) : reg253) : (({reg80} ?
              $signed(wire146) : ((8'hae) | reg248)) ~^ $signed($signed(reg13)))) == $unsigned(((^(reg241 ?
          reg16 : wire78)) - $unsigned(wire10))));
    end
  assign wire259 = reg17[(3'h4):(2'h3)];
  assign wire260 = $unsigned((|{$unsigned((reg255 ? wire9 : reg79)),
                       {wire11[(3'h5):(2'h2)]}}));
  module195 #() modinst262 (.y(wire261), .wire198(reg248), .wire197(reg19), .wire196(reg14), .wire200(reg91), .wire199(reg89), .clk(clk));
endmodule

module module195
#(parameter param237 = {(~(~(((8'hb9) | (8'hb3)) ? (8'hb4) : ((8'hb5) ? (8'hb4) : (8'hbe))))), ({{((7'h40) ? (8'hbc) : (8'ha8)), ((8'ha2) ? (8'hbe) : (8'hbd))}} ? (&({(8'had), (7'h44)} <<< ((8'h9f) || (8'hba)))) : (((~^(8'h9f)) ? ((8'hae) ? (7'h44) : (8'hb7)) : {(8'hbc)}) || (((8'h9d) ? (7'h43) : (8'haf)) & ((8'hb0) + (8'h9f)))))})
(y, clk, wire200, wire199, wire198, wire197, wire196);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire200;
  input wire [(5'h13):(1'h0)] wire199;
  input wire [(3'h7):(1'h0)] wire198;
  input wire signed [(4'ha):(1'h0)] wire197;
  input wire signed [(5'h12):(1'h0)] wire196;
  wire [(4'ha):(1'h0)] wire236;
  wire signed [(4'ha):(1'h0)] wire235;
  wire [(5'h14):(1'h0)] wire234;
  wire signed [(5'h11):(1'h0)] wire229;
  wire [(5'h15):(1'h0)] wire228;
  wire [(3'h4):(1'h0)] wire227;
  wire [(5'h11):(1'h0)] wire226;
  wire [(4'he):(1'h0)] wire225;
  wire [(5'h14):(1'h0)] wire224;
  wire [(3'h5):(1'h0)] wire204;
  reg [(5'h13):(1'h0)] reg233 = (1'h0);
  reg [(5'h10):(1'h0)] reg232 = (1'h0);
  reg signed [(4'he):(1'h0)] reg231 = (1'h0);
  reg [(5'h14):(1'h0)] reg230 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg219 = (1'h0);
  reg [(4'hc):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg217 = (1'h0);
  reg [(2'h2):(1'h0)] reg216 = (1'h0);
  reg [(3'h5):(1'h0)] reg215 = (1'h0);
  reg [(5'h15):(1'h0)] reg214 = (1'h0);
  reg [(5'h15):(1'h0)] reg213 = (1'h0);
  reg [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(4'ha):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg201 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire234,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire204,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
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
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg201 <= (wire198 << $signed(wire199));
      reg202 <= ((($signed(wire200) - (~(8'h9f))) ?
              $unsigned((!$signed(wire198))) : (^(wire198 ?
                  wire200[(3'h7):(2'h2)] : $unsigned(wire196)))) ?
          $signed(wire197) : reg201[(4'hc):(2'h3)]);
      reg203 <= (~^((~&$unsigned($signed(wire197))) ?
          (($unsigned(wire197) ? wire199 : (wire196 & wire197)) ?
              {$unsigned(wire200),
                  (~|reg202)} : {wire198[(2'h3):(1'h1)]}) : wire196[(4'h9):(1'h1)]));
    end
  assign wire204 = $unsigned($signed((^~((~reg201) < wire197))));
  always
    @(posedge clk) begin
      reg205 <= $unsigned({wire198[(3'h7):(3'h7)], {(~&(~^wire204))}});
      if (wire200)
        begin
          if ((|wire204))
            begin
              reg206 <= ({$unsigned((((8'ha6) ? wire199 : reg202) < (wire196 ?
                          (8'hbf) : reg202))),
                      (^$signed(wire204))} ?
                  (7'h44) : wire199[(2'h3):(1'h1)]);
              reg207 <= wire200;
              reg208 <= $unsigned(wire204[(1'h1):(1'h1)]);
            end
          else
            begin
              reg206 <= $unsigned((~&(+($signed(wire204) ?
                  $signed(reg207) : $unsigned(reg206)))));
              reg207 <= reg201;
              reg208 <= $unsigned((wire197 != (+wire196[(4'hc):(4'ha)])));
              reg209 <= (~|((reg202 ?
                  ((wire196 ? wire198 : (8'h9d)) ^ ((8'ha9) ?
                      (8'hb6) : wire197)) : reg201[(5'h11):(4'ha)]) < $unsigned(($unsigned(wire199) ?
                  $unsigned(reg203) : (reg202 ? wire197 : reg203)))));
            end
          reg210 <= {(~^$unsigned((|wire196))), reg206[(2'h2):(1'h0)]};
          reg211 <= ((&{reg210}) < wire204[(1'h1):(1'h0)]);
          reg212 <= $unsigned($unsigned({($unsigned(wire196) ?
                  ((7'h44) ~^ wire200) : (reg208 ? wire204 : reg201))}));
          if ((wire200[(3'h5):(3'h4)] ?
              reg202 : (($unsigned($signed(reg206)) - wire204[(2'h2):(1'h0)]) ?
                  (((wire204 ? reg201 : reg201) && reg203) ?
                      (reg205 > reg212[(3'h5):(2'h2)]) : $unsigned((^~reg202))) : reg208[(3'h4):(1'h0)])))
            begin
              reg213 <= reg205;
              reg214 <= (((reg213[(4'hb):(4'ha)] ?
                      $unsigned(wire198) : $unsigned((wire200 <= reg208))) == ((~|{reg213,
                      reg205}) != (((7'h40) <= wire197) ?
                      $unsigned(reg211) : $signed(reg202)))) ?
                  reg201[(4'he):(4'hd)] : $signed((~|reg209[(1'h1):(1'h1)])));
              reg215 <= (($unsigned($unsigned({reg207,
                      wire196})) <= ((|reg211) ?
                      ((reg201 >>> reg207) ?
                          reg211 : $unsigned(wire198)) : $unsigned($signed(reg202)))) ?
                  $unsigned(reg206[(3'h6):(3'h6)]) : (({$signed(reg212),
                          (reg210 <<< wire199)} + (reg210[(2'h2):(2'h2)] ?
                          $signed(reg205) : (~&reg202))) ?
                      reg209[(3'h4):(2'h2)] : (&(!{reg212, reg205}))));
              reg216 <= $unsigned(reg210);
            end
          else
            begin
              reg213 <= ($unsigned((($signed((8'hbe)) << reg202) ?
                      reg209[(2'h3):(1'h1)] : $unsigned(reg202[(3'h5):(1'h1)]))) ?
                  ({{{wire204}, (-wire197)}, (^~wire199)} ?
                      reg207[(3'h5):(3'h4)] : $unsigned($signed((wire198 ?
                          reg212 : reg206)))) : {(^$unsigned(reg215[(2'h2):(2'h2)]))});
            end
        end
      else
        begin
          reg206 <= $unsigned({({(wire200 & (8'hbe)),
                  $signed(reg202)} << {reg212, (8'haa)}),
              ({(wire197 || (8'ha4)),
                  (wire200 ? (8'hb2) : (8'hb8))} <<< {reg211[(3'h6):(2'h3)]})});
          reg207 <= (~&(~(&((reg205 * (8'hac)) ?
              reg203[(3'h6):(1'h1)] : $signed((8'ha7))))));
          reg208 <= reg210;
          reg209 <= ({(8'hb5)} ?
              $unsigned(($unsigned((reg214 ?
                  reg211 : reg209)) | {$signed(reg211)})) : $signed(wire198));
        end
      reg217 <= $unsigned($unsigned(reg205[(4'ha):(4'h8)]));
      if ((~|$unsigned(reg211)))
        begin
          reg218 <= (~&$unsigned($signed(wire197[(3'h5):(2'h3)])));
          reg219 <= $signed((~($unsigned($unsigned((8'ha7))) + $unsigned(reg203))));
          reg220 <= (7'h42);
          reg221 <= ($unsigned(reg216[(2'h2):(2'h2)]) * reg220);
        end
      else
        begin
          if (reg206[(3'h4):(2'h3)])
            begin
              reg218 <= (|{reg208[(2'h2):(2'h2)]});
              reg219 <= wire199[(5'h10):(4'hc)];
              reg220 <= {$signed(reg216[(2'h2):(2'h2)]), $signed((7'h44))};
            end
          else
            begin
              reg218 <= ((^~{((reg211 ? reg201 : reg205) ?
                      {wire197} : reg206[(3'h4):(1'h1)]),
                  $unsigned($unsigned(reg207))}) && ((^~((&reg207) ?
                      (~wire199) : $signed(wire199))) ?
                  (^$unsigned((|wire200))) : reg212[(3'h6):(3'h6)]));
              reg219 <= reg221;
            end
          reg221 <= {{$unsigned(reg217[(3'h4):(2'h2)]),
                  $unsigned((-$signed((8'hb2))))}};
          reg222 <= ((^{$unsigned($unsigned(reg207)),
              ((^reg201) ?
                  (reg218 | reg215) : reg211)}) && {$unsigned($signed(reg209)),
              (|wire196[(1'h0):(1'h0)])});
        end
      reg223 <= $signed((($unsigned($signed((8'hb1))) + {$unsigned(wire198)}) ?
          ((~|wire200) ?
              $signed(reg206) : ($unsigned(wire198) ?
                  (reg212 || reg222) : $signed(wire197))) : $unsigned((~reg206[(4'h8):(4'h8)]))));
    end
  assign wire224 = wire204;
  assign wire225 = ({$unsigned((~^(reg220 || reg221)))} << reg219);
  assign wire226 = (wire204[(2'h2):(1'h0)] >> ($signed(reg203[(5'h13):(4'ha)]) ~^ ($unsigned((reg212 <<< wire204)) ^~ $unsigned($unsigned((7'h40))))));
  assign wire227 = ((($signed((8'ha4)) ?
                       (reg208[(3'h7):(1'h0)] ?
                           $unsigned(wire224) : {reg220}) : $unsigned($unsigned(reg218))) <= (&(reg221 >= $signed(reg220)))) ^ (-(!({reg202,
                           reg203} ?
                       (-reg209) : ((8'h9d) ? reg212 : reg219)))));
  assign wire228 = (~reg203);
  assign wire229 = wire204[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned((^(-reg202))))))
        begin
          reg230 <= $unsigned((reg205 || {{(+reg209), $unsigned(reg205)},
              $unsigned(((8'hb5) ? reg211 : reg219))}));
        end
      else
        begin
          reg230 <= reg211;
          reg231 <= (~^(reg221[(1'h1):(1'h0)] ?
              (~&$unsigned(wire204)) : (wire224[(5'h13):(4'hf)] == $unsigned({reg223,
                  reg201}))));
        end
      reg232 <= (((wire225 << $signed((~|wire229))) ?
          $unsigned({((8'had) ? (8'ha3) : reg213)}) : (reg220 ?
              ((reg201 ? reg220 : reg201) >= (reg218 ?
                  reg221 : wire229)) : reg217)) >> reg220);
      reg233 <= {$signed(wire225[(3'h6):(1'h0)])};
    end
  assign wire234 = wire228;
  assign wire235 = ($unsigned((reg221[(4'hb):(3'h4)] ^~ $signed((&reg207)))) <<< reg212[(3'h5):(3'h4)]);
  assign wire236 = (~^$signed(($unsigned({reg201,
                       wire234}) | (~$signed((8'hbb))))));
endmodule

module module149
#(parameter param192 = (({(((8'haf) ? (8'ha1) : (8'hb1)) <<< (^(8'haa)))} ? ((~&(8'hb8)) >>> (((8'hb8) ? (8'hac) : (8'had)) ? ((8'h9c) & (8'hba)) : (8'hae))) : (~^((!(8'h9d)) ? ((8'haf) <= (7'h44)) : ((8'hba) && (8'hb1))))) ? (((|((7'h44) && (8'h9c))) ? (((8'hae) ? (8'hb0) : (8'ha1)) ? {(8'hb8)} : ((8'ha6) ? (8'hab) : (8'hb6))) : ({(8'ha5), (8'haa)} + ((8'hbc) ? (8'hab) : (8'ha4)))) ? (8'h9d) : (8'hbd)) : ((({(7'h41), (8'hb4)} && (8'h9e)) << (((8'hb7) ~^ (8'hb5)) != (8'ha8))) ? (|({(8'hb9), (8'ha2)} ? ((8'hb4) ? (8'ha3) : (7'h42)) : ((8'hb7) ? (8'hbe) : (8'hbc)))) : ((~|((8'hab) ~^ (8'haf))) << {(~|(8'hbe))}))))
(y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire153;
  input wire signed [(5'h11):(1'h0)] wire152;
  input wire [(3'h7):(1'h0)] wire151;
  input wire [(3'h7):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire191;
  wire [(4'h8):(1'h0)] wire190;
  wire [(4'ha):(1'h0)] wire189;
  wire signed [(2'h3):(1'h0)] wire188;
  wire [(4'h9):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  reg [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(4'hf):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
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
                 (1'h0)};
  assign wire154 = wire153;
  assign wire155 = {wire153};
  assign wire156 = wire150[(3'h4):(3'h4)];
  assign wire157 = $signed($unsigned({(8'hb3)}));
  assign wire158 = $unsigned($unsigned((wire157 ^~ $unsigned($signed((8'hbc))))));
  assign wire159 = (-$signed(wire155[(1'h1):(1'h0)]));
  assign wire160 = ($signed(($unsigned($signed(wire151)) ?
                       $signed($unsigned(wire157)) : wire156[(4'ha):(3'h4)])) <<< (($signed((wire157 >= (8'hb7))) ?
                           wire151 : wire151) ?
                       wire153[(3'h4):(2'h3)] : $unsigned(wire151[(1'h0):(1'h0)])));
  assign wire161 = (wire160[(1'h0):(1'h0)] ?
                       $signed((wire152[(2'h2):(2'h2)] ?
                           (wire156 << (wire151 ?
                               wire151 : wire159)) : ($signed(wire159) && $signed(wire152)))) : $signed($signed($signed($unsigned(wire151)))));
  assign wire162 = (($unsigned((wire154 ?
                           (wire155 ?
                               wire158 : wire157) : $unsigned((8'ha6)))) - ((|(-wire161)) != $signed(wire161))) ?
                       $unsigned($unsigned($unsigned((wire152 + wire154)))) : $signed(((&$signed(wire161)) ?
                           {wire155[(1'h1):(1'h0)]} : wire156)));
  assign wire163 = wire161;
  assign wire164 = $signed(wire153[(4'hc):(3'h4)]);
  assign wire165 = {{(8'ha6),
                           (wire158[(3'h5):(3'h4)] ?
                               (wire152 ?
                                   wire154[(4'he):(4'hd)] : (wire152 == wire157)) : ((~|(8'haf)) ?
                                   (~|(8'h9e)) : $unsigned(wire150)))},
                       (-(-(8'ha0)))};
  always
    @(posedge clk) begin
      if ((wire160 ?
          wire158 : ({$unsigned(wire165)} ?
              (((wire150 << (7'h40)) ?
                  $signed(wire159) : wire153) >> {wire154}) : $unsigned($signed((wire158 ?
                  wire157 : wire162))))))
        begin
          reg166 <= $unsigned(((^~(-(~wire156))) > (+wire163)));
          reg167 <= (wire154[(4'he):(4'hc)] ?
              ((&reg166) >> wire158) : (wire162[(2'h2):(1'h1)] ?
                  $unsigned($unsigned($signed(wire157))) : (^~(&$signed(wire157)))));
        end
      else
        begin
          reg166 <= (wire153 ?
              $signed($signed($signed($signed(reg167)))) : wire150);
          reg167 <= wire160[(5'h13):(2'h3)];
        end
      reg168 <= $unsigned((($signed({(8'hb1)}) ?
              ((-wire153) ?
                  {reg167, wire164} : (wire155 ?
                      wire156 : wire162)) : ((wire156 ^ wire157) ?
                  (wire157 ^~ wire159) : $unsigned(reg167))) ?
          $signed(wire157) : $unsigned((^wire154))));
      if (($signed((+wire162)) ?
          ((~&$signed((^(7'h41)))) < $signed(wire154)) : (^(wire150 <= ($signed(wire161) ?
              wire159 : reg168[(2'h3):(1'h0)])))))
        begin
          if ((-reg166))
            begin
              reg169 <= wire157[(3'h4):(1'h1)];
              reg170 <= (8'haa);
              reg171 <= wire160;
            end
          else
            begin
              reg169 <= wire160[(4'hb):(3'h5)];
            end
          if ((($signed({wire151}) != $unsigned(wire160[(4'hc):(4'ha)])) ?
              (wire158 ^ wire155) : wire156[(4'h8):(1'h1)]))
            begin
              reg172 <= $signed((!wire151[(3'h5):(1'h0)]));
              reg173 <= ($signed(reg168) && wire159[(3'h4):(3'h4)]);
            end
          else
            begin
              reg172 <= wire165;
            end
          reg174 <= (((^~$signed($signed(reg168))) ?
              (^~$signed((reg170 ?
                  wire160 : reg168))) : $unsigned($signed($signed((8'hb0))))) >= {wire165[(4'h8):(3'h5)],
              $signed(wire158)});
          reg175 <= wire151;
        end
      else
        begin
          reg169 <= {$signed(wire161), reg172[(2'h2):(2'h2)]};
          reg170 <= ((&(((wire159 ? wire165 : wire163) ?
                      (&reg173) : ((8'ha5) >= wire150)) ?
                  ({wire163} - wire160[(1'h1):(1'h0)]) : (^~wire151))) ?
              ((~^(~wire158[(2'h2):(1'h0)])) ?
                  $unsigned($unsigned((^wire150))) : (+{$signed(wire151)})) : (reg172 < (wire158 ?
                  ((wire156 | reg171) << reg168) : (8'hb1))));
          reg171 <= wire161[(4'hd):(4'hb)];
          reg172 <= ((((reg174[(2'h2):(1'h0)] * (+wire158)) ?
                      wire163[(4'hb):(1'h0)] : reg174[(1'h0):(1'h0)]) ?
                  (&reg168[(3'h4):(3'h4)]) : reg171) ?
              $unsigned((^~(reg168 ?
                  (wire162 ? wire153 : wire150) : (wire165 ?
                      (8'ha5) : reg167)))) : $signed($signed((wire162[(1'h1):(1'h1)] ?
                  wire152 : reg166))));
          reg173 <= ($unsigned((^~((wire165 ? reg175 : wire161) >> reg173))) ?
              (&(^~$signed($unsigned(wire150)))) : ((reg168[(4'ha):(3'h4)] ?
                      (((8'hb5) << (8'hbe)) >>> reg169[(3'h6):(3'h5)]) : wire164[(3'h7):(1'h0)]) ?
                  ((^~$signed(reg173)) ?
                      (&reg175) : ((wire150 << reg171) ?
                          reg166 : reg171)) : ($signed((wire157 ?
                      wire155 : (8'ha9))) ^ ((!wire165) <<< wire154))));
        end
    end
  always
    @(posedge clk) begin
      if (reg174[(1'h1):(1'h1)])
        begin
          if (wire158[(2'h3):(1'h0)])
            begin
              reg176 <= $unsigned({wire156});
              reg177 <= ($unsigned((reg172 ? reg167 : $unsigned((~^wire151)))) ?
                  $signed(reg176) : ({(wire159[(3'h4):(2'h2)] == (wire159 | reg166))} ?
                      $signed(wire165) : $signed(wire164[(3'h4):(2'h3)])));
              reg178 <= wire151;
            end
          else
            begin
              reg176 <= (({reg171,
                      (reg170[(3'h7):(3'h6)] ?
                          reg175[(2'h2):(2'h2)] : $unsigned(reg166))} ?
                  {((reg168 ? wire152 : reg166) ?
                          {reg177, (8'hbb)} : reg172)} : {reg177[(4'hc):(4'ha)],
                      wire162}) != (8'hae));
            end
          reg179 <= ($signed((&(~&(wire156 == reg174)))) ^~ reg173[(3'h4):(1'h1)]);
          reg180 <= $signed(wire150);
          reg181 <= reg167[(2'h3):(1'h1)];
        end
      else
        begin
          if (reg176)
            begin
              reg176 <= (reg167[(5'h12):(4'hd)] | reg174[(3'h5):(2'h2)]);
            end
          else
            begin
              reg176 <= $unsigned(((wire158[(3'h5):(3'h5)] ?
                  (reg166[(4'hb):(3'h7)] || ((8'ha5) | wire157)) : $unsigned(wire161)) << ($unsigned($signed(reg166)) ?
                  (8'hb5) : $signed((&(8'hb4))))));
            end
          reg177 <= (({(reg172[(3'h6):(1'h1)] ?
                  (reg175 < wire164) : wire154[(3'h5):(2'h2)])} & $signed(($signed(wire164) ?
              wire164[(3'h7):(3'h5)] : reg174))) >> $unsigned($unsigned(reg176)));
          reg178 <= ({(-wire156)} * $signed($signed((~&(reg175 && (7'h43))))));
          reg179 <= wire165;
          reg180 <= ($unsigned((wire160[(1'h0):(1'h0)] ?
                  reg167[(1'h0):(1'h0)] : reg167)) ?
              wire157 : ($unsigned(wire151[(1'h1):(1'h0)]) | wire154[(5'h11):(4'h9)]));
        end
      if ((($signed(wire156[(2'h3):(2'h3)]) ?
          wire151 : wire152) >>> wire159[(3'h4):(1'h0)]))
        begin
          reg182 <= $signed(reg180[(1'h0):(1'h0)]);
          if (wire164)
            begin
              reg183 <= (|$signed($signed(($unsigned(reg175) < wire151))));
              reg184 <= ((~|$unsigned((7'h41))) ?
                  $unsigned(((|$signed(wire159)) ~^ ($signed(wire152) && wire153[(5'h12):(2'h2)]))) : (|$unsigned($signed({(8'hb1)}))));
              reg185 <= $signed($signed((8'hb1)));
              reg186 <= ($unsigned((($signed(reg185) & wire155[(3'h7):(3'h7)]) ?
                  $unsigned((wire156 ?
                      reg185 : wire163)) : wire162)) == reg183[(4'hf):(3'h6)]);
              reg187 <= $signed(reg181[(2'h3):(2'h2)]);
            end
          else
            begin
              reg183 <= $signed($unsigned(($unsigned((reg172 ?
                  reg181 : wire151)) - reg178)));
              reg184 <= ((^~wire151[(1'h1):(1'h1)]) ?
                  (+(reg173[(4'ha):(3'h5)] > {reg183[(5'h13):(4'ha)]})) : (reg181 + $signed(reg171)));
            end
        end
      else
        begin
          reg182 <= $unsigned($signed($signed({{(7'h40)}, (8'hbb)})));
        end
    end
  assign wire188 = $unsigned(wire165[(4'h8):(3'h7)]);
  assign wire189 = $signed(reg185[(1'h1):(1'h1)]);
  assign wire190 = reg184;
  assign wire191 = {((~($signed(reg167) ?
                               $unsigned(wire188) : (wire159 != reg183))) ?
                           wire163 : reg185[(2'h3):(2'h2)]),
                       reg179[(4'ha):(1'h1)]};
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire [(4'ha):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  assign y = {wire142,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
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
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire102 = $unsigned({$unsigned(wire98[(3'h4):(1'h0)])});
  assign wire103 = wire99[(4'ha):(2'h3)];
  assign wire104 = wire102;
  assign wire105 = wire100;
  assign wire106 = wire97;
  assign wire107 = {wire103[(3'h7):(2'h3)],
                       ((!($unsigned((8'hbd)) * (wire101 ? wire97 : wire102))) ?
                           {wire97[(4'ha):(4'ha)],
                               wire106[(2'h3):(2'h2)]} : {wire98})};
  assign wire108 = (wire102[(4'ha):(3'h5)] ?
                       $unsigned((8'hbc)) : $unsigned((((wire97 >>> wire99) < $unsigned((8'haf))) >> wire99)));
  assign wire109 = $signed((^~($signed(wire98) ?
                       wire101[(1'h0):(1'h0)] : $signed((&wire99)))));
  assign wire110 = {{$unsigned($signed((wire103 <= wire104)))},
                       $signed((~|((wire106 >>> (7'h42)) != (8'hbf))))};
  assign wire111 = $signed({{((wire97 ? wire103 : wire105) ?
                               (wire104 ? (7'h40) : wire104) : (&wire100))},
                       (^~((wire107 ? wire101 : (8'hbb)) ?
                           (^~wire104) : {wire101}))});
  always
    @(posedge clk) begin
      reg112 <= $signed(wire106);
      reg113 <= ($unsigned(wire104[(4'hb):(3'h7)]) > ({(~$signed(reg112)),
          (-(+wire98))} | (reg112 ?
          {(!wire103), (wire99 ? (8'h9e) : wire101)} : wire101)));
      reg114 <= ($signed({wire98,
          reg113}) && ((+wire108[(1'h0):(1'h0)]) << ($signed((wire101 ?
          wire105 : (8'hac))) >= {$unsigned(wire100), wire105})));
    end
  assign wire115 = reg114;
  assign wire116 = (+($signed(wire106[(4'he):(4'hb)]) ?
                       $unsigned($signed({wire110})) : wire101[(3'h4):(2'h3)]));
  assign wire117 = ((wire99[(4'hc):(3'h7)] >>> {wire105,
                       (-(wire115 ?
                           wire101 : (7'h43)))}) <= $signed((^~wire116[(4'h8):(2'h2)])));
  assign wire118 = $unsigned((^(~$signed($signed(wire105)))));
  assign wire119 = ($signed({wire101}) == $signed((((wire106 || wire101) >>> wire99[(2'h3):(1'h1)]) >>> $signed((wire118 ?
                       wire106 : wire108)))));
  assign wire120 = ($signed(wire99) ?
                       (~|reg114) : {$signed($signed($signed(wire98)))});
  assign wire121 = (|(~(((wire100 >> wire98) ?
                           (reg113 ? wire100 : wire108) : {(8'had)}) ?
                       wire109[(3'h4):(1'h1)] : $signed($unsigned(wire99)))));
  assign wire122 = ($signed($unsigned($signed($signed(wire120)))) | reg114[(4'hc):(4'hb)]);
  always
    @(posedge clk) begin
      reg123 <= wire107;
      if (((wire105[(4'hb):(3'h7)] >>> (-((^~wire100) | (reg114 ?
              wire102 : wire105)))) ?
          wire119[(2'h3):(2'h2)] : (wire115 || wire99)))
        begin
          if (({$signed(wire101[(1'h0):(1'h0)])} ?
              (wire111 ?
                  $unsigned(wire110[(3'h5):(1'h1)]) : wire119) : (^~(8'hbc))))
            begin
              reg124 <= wire101;
              reg125 <= wire120;
              reg126 <= wire122[(2'h2):(1'h1)];
            end
          else
            begin
              reg124 <= ($unsigned(wire109) <<< $signed($unsigned((~&wire99[(3'h6):(1'h1)]))));
              reg125 <= (($unsigned($unsigned(reg125)) != wire100[(3'h7):(3'h4)]) ?
                  $unsigned((~&({(8'ha8), wire107} - {wire122,
                      wire108}))) : reg114);
            end
          if ((reg125[(2'h3):(2'h3)] == wire110))
            begin
              reg127 <= wire119;
              reg128 <= wire100;
              reg129 <= $unsigned(((8'ha2) <<< wire108[(3'h6):(1'h1)]));
            end
          else
            begin
              reg127 <= $signed({(~$unsigned((8'ha1))), (8'ha3)});
              reg128 <= (wire108[(1'h0):(1'h0)] << wire120);
              reg129 <= (8'hb0);
              reg130 <= ($signed(reg125[(3'h5):(1'h0)]) ?
                  (~$unsigned(($signed((8'hae)) == reg112))) : $signed((((|wire108) & wire108[(3'h4):(2'h3)]) ?
                      (reg112[(3'h6):(3'h4)] >= reg129[(4'hc):(1'h1)]) : $signed((^wire120)))));
            end
        end
      else
        begin
          reg124 <= $signed($unsigned($unsigned($unsigned($signed(wire109)))));
          reg125 <= {((&wire121[(3'h5):(3'h4)]) != (~&(&$signed(wire121))))};
          reg126 <= reg114[(3'h5):(2'h3)];
          reg127 <= wire97[(4'he):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      if ((!($unsigned(wire111[(3'h6):(2'h3)]) ?
          (!(+$unsigned(wire103))) : (8'hab))))
        begin
          reg131 <= reg125[(3'h5):(3'h5)];
          reg132 <= wire100;
        end
      else
        begin
          reg131 <= $signed($unsigned($unsigned(({wire115} ?
              {(8'hb7)} : (reg132 || wire106)))));
          if ($unsigned((~&$unsigned((|reg112[(4'hb):(2'h2)])))))
            begin
              reg132 <= (wire108[(2'h3):(2'h2)] & {(8'hb5)});
              reg133 <= $signed(reg127[(3'h4):(2'h3)]);
              reg134 <= ($signed(wire106) ?
                  $signed(($unsigned({wire106,
                      wire107}) * reg131[(1'h1):(1'h0)])) : ($unsigned(wire98[(4'hb):(3'h7)]) ?
                      ($unsigned((wire119 ~^ wire104)) ?
                          {(wire103 && wire106),
                              (&wire102)} : $unsigned($unsigned((8'hba)))) : $signed((!(7'h41)))));
              reg135 <= $unsigned((+$unsigned(wire119)));
            end
          else
            begin
              reg132 <= ($unsigned({{(~wire122)},
                      ((wire104 >>> (8'hbd)) ? wire121 : (8'hbc))}) ?
                  $unsigned((((wire104 ? wire103 : wire115) ?
                      (8'hb8) : (wire109 ?
                          wire109 : (8'hbe))) + (8'had))) : wire99[(5'h12):(4'he)]);
            end
          if (((~|$unsigned(($unsigned(wire104) & $signed(wire102)))) ^ reg135[(1'h0):(1'h0)]))
            begin
              reg136 <= $signed(($signed(wire101) ?
                  $signed($signed($signed(wire108))) : (+(^wire118[(2'h2):(2'h2)]))));
              reg137 <= $unsigned((($signed($signed(wire103)) ?
                      wire116 : {wire118}) ?
                  wire106[(3'h4):(1'h0)] : $signed($unsigned((wire122 * wire110)))));
            end
          else
            begin
              reg136 <= $unsigned((wire107 ?
                  ($signed($unsigned((8'ha2))) ?
                      wire119 : $unsigned($signed(wire115))) : wire102[(4'ha):(4'ha)]));
              reg137 <= wire116;
              reg138 <= $unsigned(((((reg134 ? reg129 : (8'hb0)) && wire111) ?
                  ($signed(reg112) && (-reg136)) : (~(reg128 <<< wire100))) >> wire121));
            end
          reg139 <= (-$unsigned($unsigned(reg138)));
          reg140 <= ($signed({(^(wire110 ? wire98 : wire119)),
                  wire99[(5'h12):(3'h7)]}) ?
              $unsigned((|{wire111[(4'ha):(4'ha)],
                  wire111})) : (wire105[(5'h10):(4'h8)] == {(&wire121[(3'h4):(1'h0)])}));
        end
      reg141 <= ((8'hbb) ?
          ({{(reg114 ? reg113 : reg113)},
              {((8'haa) ? wire110 : (7'h41))}} | reg127) : reg136);
    end
  assign wire142 = (^($unsigned((!$signed(reg128))) >= {$unsigned(reg125[(1'h1):(1'h1)])}));
endmodule

module module35
#(parameter param75 = (((((8'hb5) && (+(8'hb4))) ? (((8'hb9) ? (8'hb0) : (8'hb9)) ? (~(7'h40)) : {(8'ha6)}) : {((8'hab) * (7'h44))}) ? ({(!(8'ha9))} >>> (((8'hb4) ? (8'ha7) : (8'hbc)) <<< ((8'ha6) ? (7'h41) : (8'hac)))) : {(((8'h9d) ? (8'ha4) : (8'hac)) ? ((8'ha9) ? (8'hb9) : (8'hb1)) : (-(8'hba))), (!(!(7'h41)))}) > {(^~(&((8'ha3) ? (8'hb2) : (8'h9e))))}))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire39;
  input wire [(5'h13):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  input wire [(3'h5):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= $signed($signed({(~$unsigned((8'hac)))}));
      reg41 <= (^wire37);
      reg42 <= {{wire36[(1'h1):(1'h0)], $signed(wire39[(3'h4):(2'h2)])},
          wire36[(1'h0):(1'h0)]};
    end
  always
    @(posedge clk) begin
      if ($signed(reg40))
        begin
          if (((({(reg42 ? reg40 : wire38), $signed((8'ha7))} ?
                  (~^(~reg40)) : (!{wire38, wire37})) >= (((wire39 ?
                      reg42 : reg40) && reg40) ?
                  wire39 : ((~^wire37) ?
                      $unsigned(reg42) : $unsigned((8'ha0))))) ?
              wire39[(4'ha):(4'h9)] : $unsigned((($signed(reg41) ?
                      $signed((8'hb2)) : $unsigned(reg42)) ?
                  reg40 : $signed((|(8'ha5)))))))
            begin
              reg43 <= ($signed($signed($signed($signed(reg40)))) ?
                  ($signed($signed($unsigned(wire36))) ?
                      reg42 : wire38[(1'h0):(1'h0)]) : (^$signed(($unsigned(wire36) ?
                      reg40[(1'h1):(1'h1)] : wire39[(4'h8):(3'h4)]))));
              reg44 <= $unsigned($signed($signed(reg43)));
              reg45 <= reg40;
            end
          else
            begin
              reg43 <= (-((reg45 + wire39) >> ($unsigned(reg40[(4'h9):(2'h2)]) ^~ (reg44[(2'h3):(1'h1)] >> wire39))));
              reg44 <= ((|($unsigned(reg41[(4'hb):(3'h7)]) < $signed((8'hb7)))) ?
                  (~^$signed((wire37[(2'h2):(2'h2)] ?
                      $signed(wire36) : $signed(reg42)))) : (((^~(~|wire39)) <= (8'hae)) * ({(&reg43),
                      $unsigned(reg40)} < (8'hb2))));
            end
          reg46 <= $unsigned({wire38[(4'h8):(3'h5)]});
          reg47 <= $signed((8'hbb));
          reg48 <= (&{reg45,
              ((~|{reg47, reg47}) ?
                  (|$unsigned((8'ha6))) : ({wire38,
                      wire36} || $signed(reg40)))});
        end
      else
        begin
          reg43 <= ((~^$signed(reg45)) ?
              {{(~&reg48), $signed($unsigned(reg42))},
                  $signed($unsigned($unsigned(wire38)))} : (reg41 ?
                  $unsigned($unsigned((wire38 ? wire36 : reg44))) : reg42));
          if ({(&$unsigned(((!reg42) || {reg43, reg42})))})
            begin
              reg44 <= reg48;
              reg45 <= wire36;
            end
          else
            begin
              reg44 <= $signed(wire37);
            end
          reg46 <= reg41;
          reg47 <= reg46[(1'h1):(1'h1)];
          reg48 <= $signed({$unsigned($signed((|reg47)))});
        end
    end
  assign wire49 = $signed(((($unsigned(reg44) ?
                              {wire38} : reg43[(3'h5):(1'h0)]) ?
                          {reg42[(4'he):(1'h1)]} : {$unsigned(reg47),
                              $signed(wire37)}) ?
                      {(~^(wire36 - wire37)),
                          $signed((reg42 ?
                              reg43 : reg44))} : reg44[(3'h6):(3'h6)]));
  assign wire50 = (^((8'ha4) == reg43));
  assign wire51 = (^~$unsigned((($unsigned(reg44) >> $unsigned(reg48)) >> reg48)));
  assign wire52 = wire38;
  assign wire53 = ($signed(reg44) ?
                      ({($signed(wire52) && (!(8'ha0)))} < ((!$signed(reg44)) ?
                          (reg44 ?
                              $unsigned(wire51) : $signed(reg47)) : $unsigned($signed(wire51)))) : $signed((~&($unsigned(reg41) >> {reg48}))));
  always
    @(posedge clk) begin
      reg54 <= (8'h9e);
      if ((~^(~^(wire49[(3'h7):(1'h0)] ~^ ((&wire50) ?
          ((8'ha2) ? wire36 : reg44) : $unsigned(wire51))))))
        begin
          reg55 <= ((|($unsigned((reg46 ? reg43 : reg46)) << $unsigned((wire49 ?
                  wire39 : (8'ha4))))) ?
              (wire49 >>> {reg40[(4'h9):(3'h4)],
                  $signed((!wire38))}) : (|$unsigned((wire37 ?
                  (reg40 ? wire51 : reg43) : (8'ha0)))));
          reg56 <= ((~&$signed((^~$unsigned(reg45)))) ?
              reg46[(3'h5):(2'h3)] : reg46[(5'h11):(4'h9)]);
        end
      else
        begin
          reg55 <= wire39[(4'h9):(4'h9)];
          reg56 <= $signed($unsigned((reg45[(4'hf):(1'h1)] ?
              (wire38[(1'h1):(1'h1)] ?
                  $signed(reg44) : (reg42 ^~ wire39)) : ($unsigned(wire38) ?
                  $unsigned(reg40) : (reg44 <<< reg44)))));
          reg57 <= reg46[(4'ha):(3'h5)];
        end
      reg58 <= $signed((reg46 ^ wire37[(3'h7):(1'h0)]));
      reg59 <= $unsigned((~|{$signed(wire51[(1'h0):(1'h0)]),
          reg42[(3'h5):(1'h1)]}));
      reg60 <= $signed(wire38);
    end
  assign wire61 = wire37;
  assign wire62 = $signed(reg40);
  assign wire63 = (($unsigned($unsigned($signed(reg60))) ?
                          reg40[(4'h9):(4'h8)] : (~{((7'h43) ? reg47 : wire51),
                              reg47})) ?
                      (!(reg55 ?
                          wire39[(1'h0):(1'h0)] : ((reg41 - reg41) ?
                              (wire53 * reg54) : $unsigned((7'h43))))) : (+$unsigned($signed(((8'h9e) & reg47)))));
  assign wire64 = $signed($signed(((~&reg44[(3'h6):(3'h5)]) ?
                      {(&reg45)} : ((reg42 >>> reg42) ?
                          $signed(reg44) : {(8'hac), reg44}))));
  assign wire65 = (((!$signed({wire50})) <<< $signed((~((8'ha8) ?
                          reg46 : wire49)))) ?
                      ((~wire51) ?
                          (($signed(reg56) ~^ $unsigned(reg56)) ?
                              (reg45 ?
                                  $signed(wire51) : reg57[(3'h5):(2'h2)]) : $unsigned((wire52 <= (8'h9f)))) : $signed($signed((reg42 - reg56)))) : wire36);
  assign wire66 = $signed(((($signed(reg40) == $unsigned(wire53)) << ((wire36 ?
                              reg59 : wire52) ?
                          wire64[(2'h3):(1'h0)] : $signed(reg56))) ?
                      {$unsigned({(7'h42), reg45}),
                          {{reg43, reg57}, $signed(reg57)}} : wire63));
  assign wire67 = wire64[(4'hd):(2'h2)];
  assign wire68 = $unsigned((((&(8'ha8)) ~^ (~&(wire62 ^ wire37))) ?
                      ((!{wire63}) ?
                          $signed((wire64 <= (7'h43))) : reg56[(4'ha):(2'h3)]) : $unsigned($unsigned((reg57 << reg45)))));
  assign wire69 = $signed(($signed(reg56) ?
                      (((reg41 ^~ wire36) ?
                          {(8'hb4)} : reg58) ~^ reg58) : $signed((|$signed(reg56)))));
  assign wire70 = $signed(reg48[(3'h7):(3'h6)]);
  assign wire71 = (((reg57 * $signed((reg45 <<< (8'ha6)))) ?
                          ((reg55[(3'h5):(3'h4)] ?
                                  (reg47 ? reg57 : wire70) : (~(8'h9e))) ?
                              {(8'hbd)} : ((+reg56) >= {(8'hbb)})) : reg48[(1'h0):(1'h0)]) ?
                      (~$signed({(wire51 == (8'ha6))})) : ((wire52 ?
                              $signed((wire65 ~^ (8'ha0))) : reg40[(1'h0):(1'h0)]) ?
                          (~(8'hb2)) : $unsigned((^$unsigned(reg60)))));
  assign wire72 = ($signed(($signed($unsigned(wire67)) == $signed($signed(wire68)))) ?
                      reg57[(3'h6):(2'h2)] : (((!(~^wire51)) ?
                          ((~|reg41) ^ (~&wire38)) : (reg45[(3'h6):(3'h4)] ^ reg60[(4'ha):(4'h9)])) >= ($unsigned((~wire64)) ?
                          wire53 : wire69)));
  assign wire73 = wire52[(2'h3):(1'h0)];
  assign wire74 = wire65;
endmodule

module module22
#(parameter param31 = (^(^~{({(7'h43), (8'hb8)} ? {(8'ha2)} : ((8'ha4) ? (8'hb5) : (8'ha9))), ((8'hb7) ? ((8'hac) <= (8'hb0)) : ((8'hb6) ? (8'h9e) : (8'ha1)))})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  assign y = {wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = ((~|wire26) + wire25[(1'h1):(1'h0)]);
  assign wire28 = (|(wire23[(3'h5):(3'h5)] && (8'hba)));
  assign wire29 = wire25;
  assign wire30 = $unsigned($signed((-{$signed((8'ha9)),
                      (wire26 ^~ (8'hb5))})));
endmodule
