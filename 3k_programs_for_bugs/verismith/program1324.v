module top
#(parameter param162 = ((8'ha0) ? (~|((~&((8'hab) != (8'had))) != {((8'hb5) ? (8'ha1) : (8'h9d)), (-(8'ha3))})) : ((((+(7'h43)) << ((7'h41) >= (8'hbe))) || ((~^(8'ha0)) < ((8'ha5) >= (8'hbc)))) == ({(!(7'h40))} ? {((8'haa) ? (8'hb6) : (8'ha2)), ((8'had) ? (8'ha1) : (8'hb8))} : ((^~(8'ha3)) ? (^(8'ha2)) : {(8'hb9)})))), 
parameter param163 = ((~|param162) ? (~^({(param162 ? (7'h43) : param162), (8'hb9)} ? {param162} : (~|{(7'h41), (8'hab)}))) : ({(&(param162 ? param162 : (8'hb0))), ((param162 <= param162) <= (param162 ? param162 : param162))} ? (^((param162 ? param162 : param162) << (param162 ? param162 : param162))) : (~|param162))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire155;
  wire signed [(4'hf):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire32;
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire142,
                 wire34,
                 wire32,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 (1'h0)};
  module4 #() modinst33 (.wire5(wire2), .wire6(wire1), .wire8(wire0), .y(wire32), .clk(clk), .wire7(wire3));
  assign wire34 = (^~{wire2});
  always
    @(posedge clk) begin
      reg35 <= {((+(^wire34[(2'h3):(1'h0)])) << ({(&wire1)} >= wire0[(1'h0):(1'h0)]))};
      if ({{{reg35[(2'h3):(2'h2)]}}, $unsigned((^~$signed(wire32)))})
        begin
          reg36 <= $signed(((8'hb9) * ((~wire2) ? reg35 : $unsigned(wire34))));
          reg37 <= $unsigned(reg35[(3'h4):(3'h4)]);
          reg38 <= reg36;
          if ($unsigned($signed((((reg38 - wire1) ?
                  wire3 : reg35[(3'h7):(2'h3)]) ?
              (-(reg38 >> (8'hb5))) : wire2[(4'h9):(1'h0)]))))
            begin
              reg39 <= wire3;
              reg40 <= (!((~wire1) < (({wire3} <<< $signed(reg39)) ?
                  (8'hb1) : (~|(reg36 ? reg37 : wire3)))));
              reg41 <= {(~&((!{reg39, wire34}) <<< $signed((~(7'h43)))))};
              reg42 <= reg41;
              reg43 <= (((((reg39 ? reg35 : (8'hbb)) ?
                  (wire0 >>> reg42) : (reg36 ?
                      (8'haf) : reg35)) * reg40[(1'h1):(1'h0)]) > {(~|(reg41 & wire0))}) + (~&$unsigned(reg36)));
            end
          else
            begin
              reg39 <= reg42[(5'h11):(2'h3)];
              reg40 <= $signed($unsigned($signed(({reg38} ?
                  (reg37 || reg42) : (reg40 | (7'h41))))));
              reg41 <= ($signed($signed((-(reg39 ? reg42 : reg39)))) ?
                  ((~$signed({reg42})) ?
                      wire34 : {{wire2,
                              (wire34 + reg36)}}) : $unsigned(wire2[(4'h8):(4'h8)]));
              reg42 <= $signed($signed($signed((|$signed(wire2)))));
            end
          reg44 <= ((8'ha2) ?
              ($signed($unsigned({reg39, wire1})) ?
                  reg43 : (~$signed(reg36))) : (+{(8'hbd),
                  $signed((reg36 ? reg37 : wire34))}));
        end
      else
        begin
          reg36 <= ((^reg41) ?
              {{(reg35[(3'h6):(2'h2)] ?
                          (reg35 >> wire3) : {wire32,
                              reg41})}} : (wire32[(1'h1):(1'h1)] < $signed(({(8'hbc),
                  (8'ha9)} != (~reg37)))));
          if ($unsigned(({$signed((reg40 ~^ wire32))} >= $unsigned(reg36[(3'h4):(2'h2)]))))
            begin
              reg37 <= ((reg43 ?
                      $signed(($signed(reg39) ?
                          (reg42 ? (8'h9d) : wire1) : (reg36 ?
                              reg39 : wire1))) : $signed(wire3)) ?
                  {({reg44} ?
                          $unsigned($unsigned((7'h41))) : reg37[(1'h0):(1'h0)]),
                      reg36[(4'h8):(4'h8)]} : (~(|(reg39[(3'h6):(3'h5)] ?
                      ((8'hbd) ? wire34 : (8'h9c)) : wire32))));
              reg38 <= (^~(((8'hbd) << $unsigned(reg39[(4'h9):(3'h4)])) ?
                  (wire2[(1'h1):(1'h0)] ?
                      $signed(reg40[(4'ha):(1'h0)]) : ((wire0 ?
                              wire2 : wire34) ?
                          $unsigned(wire32) : $unsigned((8'hb4)))) : $signed(((8'ha1) ~^ $unsigned(reg36)))));
              reg39 <= wire32[(2'h2):(1'h1)];
              reg40 <= reg40;
            end
          else
            begin
              reg37 <= (((((wire34 * wire32) ?
                          $unsigned(wire32) : ((8'ha6) ?
                              reg35 : (7'h43))) ~^ ((reg42 > wire1) ?
                          wire0 : $signed(reg38))) ?
                      reg43[(4'h9):(1'h1)] : (reg38[(1'h0):(1'h0)] - ($signed(reg44) - reg38))) ?
                  $unsigned(($signed(reg41[(2'h2):(1'h0)]) >= (reg40[(4'he):(4'ha)] ^ (reg41 << reg38)))) : ((&reg38) + {{$signed(wire32),
                          wire0[(2'h2):(1'h1)]}}));
              reg38 <= $unsigned($unsigned($unsigned($unsigned($unsigned((8'hbd))))));
              reg39 <= (^~{wire1});
              reg40 <= ($signed($unsigned((8'hb8))) >>> reg42);
              reg41 <= reg40;
            end
        end
      if ({(8'h9d), {{$signed((8'hb1))}}})
        begin
          reg45 <= {reg42[(4'h9):(4'h8)], wire3[(4'he):(3'h4)]};
        end
      else
        begin
          reg45 <= ((~$signed(((reg39 | wire2) ?
                  reg36[(4'ha):(4'h8)] : wire32[(3'h4):(1'h1)]))) ?
              $unsigned((((reg45 ? reg45 : wire3) ?
                      $unsigned(reg44) : (8'ha7)) ?
                  (((7'h44) ^~ reg45) ?
                      {reg42} : $unsigned(reg37)) : $signed(reg44))) : {$unsigned((wire3 ?
                      (wire32 ? wire1 : reg41) : (8'ha2)))});
          reg46 <= ($unsigned(wire3[(5'h14):(2'h2)]) ?
              (($unsigned((wire2 >>> wire1)) || ({wire34} ?
                  (+(8'had)) : ((8'haf) ?
                      wire0 : reg37))) && (!$signed($signed(wire34)))) : (wire0[(1'h1):(1'h0)] <<< reg43[(2'h3):(2'h3)]));
          reg47 <= (+(((|reg42) ?
              (reg44[(2'h2):(1'h0)] < ((8'hb4) ^~ (8'hbe))) : ($signed(reg38) <<< $unsigned((8'hb5)))) & wire32[(1'h0):(1'h0)]));
          if ($unsigned(($unsigned({(reg37 >= (8'ha7))}) ?
              ({$signed(reg38),
                  (-reg45)} >> wire0[(3'h4):(1'h1)]) : ($signed((reg43 & reg35)) ?
                  {(reg43 | reg47), $signed(reg41)} : reg42))))
            begin
              reg48 <= $signed($unsigned(({$signed(reg45)} >= $unsigned((reg45 >>> reg40)))));
              reg49 <= $signed(wire3);
            end
          else
            begin
              reg48 <= ((~^($signed({wire32}) ?
                  (wire3 ?
                      reg38[(3'h4):(2'h2)] : $unsigned((8'hbe))) : (8'hba))) << reg37[(1'h0):(1'h0)]);
              reg49 <= reg37[(3'h5):(2'h2)];
              reg50 <= (!{$unsigned({(&wire0)})});
            end
        end
    end
  module51 #() modinst143 (wire142, clk, reg36, reg49, reg35, reg47);
  always
    @(posedge clk) begin
      reg144 <= wire1;
      if ({(reg47 ?
              {(~^reg42)} : (reg47[(3'h4):(1'h1)] ^ $signed((reg36 == (8'haa)))))})
        begin
          reg145 <= $signed((&(({wire32, reg44} > (wire1 + reg144)) ?
              ({reg35} >= (~|reg48)) : $unsigned((reg41 ? reg41 : reg39)))));
        end
      else
        begin
          reg145 <= $signed($unsigned((((~^reg46) ?
              (-reg41) : wire0[(1'h1):(1'h1)]) <= reg39[(4'he):(4'ha)])));
        end
      reg146 <= reg46;
      reg147 <= $signed($signed($signed(reg50)));
    end
  always
    @(posedge clk) begin
      reg148 <= $unsigned((^$signed((reg146 - reg48))));
      reg149 <= reg147;
      reg150 <= reg46[(4'hc):(1'h1)];
      reg151 <= reg48;
    end
  assign wire152 = (8'hbd);
  assign wire153 = (8'hb2);
  assign wire154 = reg42;
  assign wire155 = ({$unsigned(reg39),
                       ($signed((reg48 << reg148)) & $unsigned({(8'ha7),
                           (8'hb1)}))} < ((^~((wire152 && reg45) > $unsigned(reg150))) - wire1[(4'hf):(1'h1)]));
  assign wire156 = reg45;
  module12 #() modinst158 (wire157, clk, reg37, wire2, reg40, reg146, wire142);
  assign wire159 = (&(!$unsigned({reg35[(3'h7):(1'h1)], (reg38 | reg150)})));
  assign wire160 = $unsigned((!(|($signed((8'h9d)) ?
                       (^wire152) : reg43[(3'h5):(2'h2)]))));
  assign wire161 = reg145;
endmodule

module module51  (y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire53;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire140;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  assign y = {wire93,
                 wire95,
                 wire96,
                 wire97,
                 wire140,
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
                 (1'h0)};
  module56 #() modinst94 (wire93, clk, wire52, wire55, wire53, wire54, (8'hb6));
  assign wire95 = {$unsigned((((wire52 >> wire54) >> (~^wire55)) < (~wire55[(2'h3):(1'h1)]))),
                      $signed({$signed((wire53 ? (7'h44) : wire55))})};
  assign wire96 = wire54[(1'h1):(1'h1)];
  assign wire97 = ({$unsigned((!(^~wire52))), wire95} ?
                      ((!{(8'hba)}) ?
                          {$signed(wire53[(1'h1):(1'h0)]),
                              $signed((8'haf))} : (8'haa)) : (+($signed((wire96 ?
                          wire96 : (8'hb3))) ^ ((wire95 ? wire96 : wire96) ?
                          {wire55, wire53} : $unsigned((8'hb9))))));
  always
    @(posedge clk) begin
      reg98 <= $signed((~^{$signed((wire54 ? wire93 : wire95))}));
      if ((wire55[(1'h1):(1'h0)] ?
          (+$unsigned($unsigned($signed(wire52)))) : {(~&$signed($signed(wire55))),
              (wire55[(3'h4):(3'h4)] + $unsigned($signed(wire93)))}))
        begin
          reg99 <= wire52[(4'hb):(3'h4)];
        end
      else
        begin
          if ((8'ha1))
            begin
              reg99 <= reg98;
              reg100 <= ($unsigned($unsigned(wire96)) ?
                  $signed(reg98) : (&(wire96 ?
                      $signed(wire95[(2'h2):(2'h2)]) : wire55)));
              reg101 <= wire97;
              reg102 <= $signed(wire53);
              reg103 <= ($signed((8'hbe)) * wire53);
            end
          else
            begin
              reg99 <= ((^~reg102) || reg98[(4'hd):(2'h2)]);
            end
          reg104 <= wire97[(1'h1):(1'h0)];
          reg105 <= {(~(((reg99 ?
                  wire55 : wire53) == wire95[(1'h0):(1'h0)]) ^ $unsigned({(8'ha2)})))};
        end
      reg106 <= wire54;
      reg107 <= $unsigned((reg105 + $unsigned(wire96)));
      reg108 <= (reg102[(3'h4):(2'h2)] & $signed($signed((|wire54[(1'h0):(1'h0)]))));
    end
  module109 #() modinst141 (wire140, clk, reg99, wire95, wire53, reg104, wire96);
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire5;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire25;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire9,
                 wire10,
                 wire11,
                 wire25,
                 (1'h0)};
  assign wire9 = {wire7[(4'hd):(2'h3)]};
  assign wire10 = wire9;
  assign wire11 = (8'ha5);
  module12 #() modinst26 (wire25, clk, wire6, wire9, wire10, wire7, wire5);
  assign wire27 = (wire5 ? wire25 : wire7[(4'hb):(4'h9)]);
  assign wire28 = ($signed(((!(+wire10)) ?
                      ((+wire10) ?
                          wire7 : ((7'h40) ?
                              wire5 : wire8)) : wire27[(2'h2):(2'h2)])) > (!(wire6[(5'h10):(4'h9)] << {((8'hb5) - wire10),
                      wire7[(4'hf):(4'h9)]})));
  assign wire29 = (7'h41);
  assign wire30 = $unsigned($signed($unsigned({$signed(wire5), wire5})));
  assign wire31 = ($unsigned((!wire27[(1'h1):(1'h0)])) ?
                      $unsigned((+$unsigned(wire10))) : {$signed($unsigned({wire27,
                              wire10})),
                          $unsigned($signed((wire7 < wire7)))});
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = ((+$unsigned(wire14[(2'h2):(2'h2)])) ? wire14 : wire14);
  assign wire19 = $unsigned((|wire14[(3'h7):(2'h2)]));
  assign wire20 = wire14;
  assign wire21 = {wire20[(3'h6):(1'h1)],
                      $unsigned($unsigned(wire15[(1'h1):(1'h1)]))};
  assign wire22 = $signed((+(((wire14 == wire14) ~^ wire19[(3'h4):(3'h4)]) < wire14)));
  assign wire23 = $unsigned(((wire19[(3'h6):(3'h5)] ? wire21 : {wire13}) ?
                      $unsigned($unsigned((-wire16))) : (&wire14[(3'h5):(2'h2)])));
  assign wire24 = (^~{$unsigned(wire15)});
endmodule

module module109
#(parameter param138 = {((({(8'hbe), (8'hbf)} ? ((8'hab) ? (8'ha6) : (8'ha1)) : ((8'ha8) > (8'ha8))) | (((8'ha1) ? (8'hae) : (8'h9c)) << (~|(8'hb0)))) <<< (+({(8'h9e)} | (~|(8'ha1))))), {((((8'ha0) ~^ (8'haa)) ? (-(8'had)) : ((8'ha5) & (7'h42))) ? ((~^(7'h43)) ? ((8'hab) || (8'h9f)) : (~^(8'haa))) : {((8'hb5) ? (8'hb9) : (8'ha3)), {(8'hb2), (8'hb9)}})}}, 
parameter param139 = (~&((^~((param138 ~^ param138) ? (^~param138) : (8'hba))) ? (((param138 ? param138 : param138) ? {param138} : param138) || param138) : (!((param138 ^ param138) >>> (param138 ? (8'haa) : param138))))))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire114;
  input wire [(5'h10):(1'h0)] wire113;
  input wire [(4'ha):(1'h0)] wire112;
  input wire signed [(3'h6):(1'h0)] wire111;
  input wire [(5'h10):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(3'h4):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire115;
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire117,
                 wire116,
                 wire115,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire115 = (8'hbb);
  assign wire116 = wire113;
  assign wire117 = $unsigned(wire111[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg118 <= (wire110[(2'h3):(1'h1)] ?
          $unsigned((wire117[(1'h1):(1'h1)] <= ($unsigned((8'hbc)) != (~wire116)))) : wire112);
      reg119 <= $signed((&wire111));
      reg120 <= (&wire117[(4'hc):(1'h1)]);
      reg121 <= ((^((wire116 ? wire117 : $signed(reg118)) ?
          $unsigned($unsigned(wire112)) : $signed(reg120[(3'h7):(3'h7)]))) >> (reg120[(3'h6):(3'h5)] <<< (~^(~|reg120[(2'h3):(1'h1)]))));
      reg122 <= $signed(wire114);
    end
  assign wire123 = (wire112 - $signed((wire112 ?
                       $unsigned((~wire116)) : (wire112 ?
                           (wire115 < reg121) : reg118))));
  assign wire124 = (((($signed((8'ha9)) == reg118) != $unsigned((~^wire123))) <= $signed(({(7'h41)} * (reg119 >>> reg119)))) ?
                       ($unsigned(((wire116 <= wire117) | ((8'h9f) ?
                           wire114 : wire123))) >= {reg118,
                           $signed((wire116 ? wire116 : wire110))}) : wire111);
  assign wire125 = wire110[(3'h7):(1'h0)];
  assign wire126 = $signed(((~|((wire124 ? wire124 : wire124) ?
                           (&wire125) : (wire114 - wire123))) ?
                       (($signed(wire123) ?
                           (reg119 ?
                               wire125 : wire111) : (reg120 >= wire124)) ~^ ((wire115 - wire114) ?
                           reg121 : (wire125 ? wire115 : reg121))) : wire110));
  assign wire127 = wire124;
  assign wire128 = reg120[(3'h6):(3'h4)];
  assign wire129 = $signed(wire112[(3'h4):(2'h2)]);
  assign wire130 = (reg120 >>> $signed(wire113));
  assign wire131 = $signed(wire113);
  assign wire132 = $unsigned((wire113[(4'he):(4'he)] >>> ((wire124[(3'h4):(3'h4)] ?
                           wire111[(3'h5):(3'h5)] : reg118) ?
                       $unsigned($signed(wire111)) : wire110[(4'hc):(4'h9)])));
  assign wire133 = $signed((&reg119[(4'he):(1'h0)]));
  assign wire134 = $signed({(~|{(~|wire117), ((8'haf) ? wire116 : wire115)})});
  assign wire135 = wire128;
  assign wire136 = wire110[(5'h10):(4'hf)];
  assign wire137 = $signed(((wire110 > wire135) ?
                       (((wire123 ? wire129 : wire133) ?
                               wire129 : $unsigned(wire126)) ?
                           reg121[(2'h3):(2'h2)] : ({wire133, wire114} ?
                               reg122 : (!reg122))) : wire128[(4'h9):(2'h3)]));
endmodule

module module56
#(parameter param91 = (((!({(8'hb9)} >= {(7'h44)})) ? (((+(8'hb1)) * (&(8'hab))) >> (^~(+(8'ha3)))) : ((~((8'hb6) && (8'hb8))) ? (((8'ha9) ? (8'hbe) : (8'ha8)) ^ (~^(8'h9f))) : (|((8'hae) && (8'hba))))) ^~ (~^((((8'hbb) ? (8'haf) : (8'hae)) ? ((8'ha2) ? (7'h40) : (8'hb6)) : (~^(8'ha0))) ? (((8'hae) ? (8'h9d) : (8'hb0)) ? (~|(8'hbd)) : ((8'h9e) ? (8'haf) : (8'had))) : (((8'hb9) | (8'ha1)) >>> (^~(8'ha5)))))), 
parameter param92 = (~&((((8'hac) ^~ (8'hb2)) ? ((param91 ? param91 : param91) ? (param91 ? param91 : param91) : (^~param91)) : ((param91 <= param91) >= {param91, param91})) != {param91})))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire61;
  input wire signed [(3'h6):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire [(3'h4):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire80,
                 wire68,
                 wire67,
                 wire63,
                 wire62,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire62 = (($unsigned(wire57[(1'h0):(1'h0)]) ?
                          {(((8'h9d) * wire61) > $unsigned(wire60)),
                              $signed(((8'haf) ? (7'h42) : wire59))} : wire59) ?
                      wire58[(4'h9):(3'h4)] : (!wire60));
  assign wire63 = ((($signed($signed(wire58)) ?
                          wire61[(5'h12):(3'h7)] : wire59) - $signed($unsigned({wire60,
                          wire60}))) ?
                      $unsigned(((^wire60) | {wire57[(3'h4):(2'h3)]})) : {(&wire59),
                          ($signed($signed(wire62)) < $unsigned({wire60}))});
  always
    @(posedge clk) begin
      reg64 <= ($signed(({(wire62 ? wire58 : wire58),
                  (wire63 ? wire61 : (8'ha2))} ?
              $signed((wire57 ? wire61 : wire61)) : ((wire61 >>> wire59) ?
                  (wire63 ? wire63 : wire58) : wire59))) ?
          $unsigned((wire61 | ({wire58} ?
              {(8'ha7),
                  wire63} : wire59))) : $unsigned($unsigned($signed(wire63))));
      reg65 <= (reg64 ?
          {$signed((wire61[(5'h14):(4'ha)] ?
                  (~^(8'had)) : (wire62 ? reg64 : wire58))),
              $unsigned((8'ha9))} : (-wire60[(2'h3):(2'h2)]));
      reg66 <= $unsigned(reg65[(2'h3):(2'h2)]);
    end
  assign wire67 = (8'hb2);
  assign wire68 = (!$signed({($unsigned((8'hbf)) < $unsigned(wire57))}));
  always
    @(posedge clk) begin
      reg69 <= $unsigned(wire68);
    end
  always
    @(posedge clk) begin
      reg70 <= $signed(reg66);
      reg71 <= $signed(((~^wire63[(3'h4):(1'h0)]) ? (~{wire57}) : wire63));
      if ($signed($unsigned(wire59[(2'h2):(1'h1)])))
        begin
          reg72 <= wire59;
          reg73 <= $signed($signed($signed($unsigned(reg66))));
          reg74 <= (&($signed(wire68[(3'h6):(1'h1)]) + ((wire62 ?
                  reg69 : wire59) ?
              (reg70 ~^ (^reg71)) : wire67)));
          reg75 <= $signed(($signed((~|(wire58 >>> wire61))) ?
              ((reg64[(4'he):(3'h4)] ~^ $unsigned((8'hba))) ?
                  wire58 : $unsigned({wire57})) : (~&reg69)));
        end
      else
        begin
          reg72 <= (~|reg73);
        end
    end
  always
    @(posedge clk) begin
      reg76 <= (|(((~^(reg73 ? wire62 : wire59)) || (~|(wire63 ~^ wire58))) ?
          wire60 : wire57[(3'h4):(3'h4)]));
      reg77 <= (wire58[(1'h1):(1'h0)] & (({(wire68 ? (8'hb4) : wire62),
              $signed((8'hb6))} ?
          (wire63[(3'h6):(3'h5)] ?
              (~&wire62) : wire60[(3'h6):(3'h4)]) : $unsigned((-reg74))) & (reg65 ?
          ((reg71 && wire63) >= reg76[(1'h0):(1'h0)]) : ($signed(reg72) ?
              reg75[(4'hb):(4'h9)] : (reg64 ^~ reg75)))));
      reg78 <= (($signed($signed(((8'h9c) ?
              (8'hac) : reg64))) && reg71[(3'h5):(1'h0)]) ?
          (&(&$signed((8'hb7)))) : $signed({((^~wire61) ?
                  $unsigned(reg71) : {wire57}),
              reg69[(2'h3):(1'h1)]}));
      reg79 <= $signed(wire67);
    end
  assign wire80 = (($unsigned((~$unsigned(reg74))) ?
                          (^((8'ha8) >= $signed(wire61))) : (($signed(reg72) ~^ $signed(wire68)) - reg76)) ?
                      wire63 : reg70[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (($signed(wire60) ?
          wire57[(1'h0):(1'h0)] : $signed($signed($signed((wire60 ?
              wire60 : wire61))))))
        begin
          reg81 <= $unsigned($signed($unsigned((&(~|wire60)))));
        end
      else
        begin
          reg81 <= {{($signed({reg75, reg66}) ?
                      wire58[(3'h6):(3'h4)] : $signed((~^wire80))),
                  wire58[(3'h6):(3'h6)]}};
          reg82 <= (reg75 ? reg78[(4'h9):(3'h5)] : reg71[(1'h1):(1'h0)]);
          reg83 <= $unsigned(wire58);
        end
      reg84 <= $signed($unsigned(reg64[(3'h6):(2'h2)]));
      reg85 <= $signed(wire61);
      reg86 <= {$signed(((~{(8'hb2), reg70}) ~^ (^~(^~reg84)))),
          (wire68[(2'h3):(2'h2)] ?
              $signed({$unsigned(wire80), (&reg64)}) : reg81)};
      reg87 <= $signed((~&reg78[(1'h0):(1'h0)]));
    end
  assign wire88 = (reg83 ?
                      $unsigned((~|((wire68 <<< wire80) > (reg82 ?
                          reg77 : wire80)))) : reg64[(4'h8):(2'h3)]);
  assign wire89 = ($unsigned(($unsigned($signed(reg69)) ?
                          (reg75[(4'hd):(2'h3)] && $signed((8'hb1))) : ((reg72 ~^ reg79) << reg71))) ?
                      (+((wire88[(2'h2):(1'h0)] ?
                          wire60[(1'h1):(1'h0)] : ((8'h9d) > wire58)) ^~ {{wire59,
                              wire67},
                          $signed((7'h44))})) : wire59);
  assign wire90 = wire88;
endmodule
