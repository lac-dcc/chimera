module top
#(parameter param128 = (~&({((&(7'h40)) > ((7'h41) || (8'haf))), {((8'h9f) >= (7'h40)), ((7'h43) * (8'hbf))}} ? ((~|((7'h42) ^~ (8'ha4))) >>> {((7'h44) ? (8'hb1) : (8'hb7))}) : {({(8'hb4), (8'hb9)} * ((8'ha4) <= (8'h9d))), ((^~(7'h42)) ? (-(8'ha7)) : (~(8'hb9)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire107;
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire127,
                 wire122,
                 wire111,
                 wire110,
                 wire109,
                 wire90,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire107,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
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
                 reg13,
                 (1'h0)};
  assign wire5 = (8'hb9);
  assign wire6 = (wire1[(4'h8):(3'h4)] > ((wire5[(1'h0):(1'h0)] ?
                     wire5[(1'h1):(1'h1)] : wire4[(2'h3):(1'h1)]) || ($signed((+wire4)) ?
                     $unsigned((wire4 ?
                         wire3 : (8'ha2))) : $unsigned((^~wire0)))));
  assign wire7 = $signed((~^wire4));
  assign wire8 = wire5[(1'h0):(1'h0)];
  assign wire9 = {($signed($unsigned((wire6 ?
                         wire3 : wire2))) != ($signed((wire2 ?
                         wire3 : wire5)) < wire8))};
  assign wire10 = {$signed({wire8[(5'h11):(4'he)]}),
                      ($signed((~&wire7[(3'h6):(3'h4)])) >> $signed($unsigned(((8'hb6) > wire4))))};
  assign wire11 = (wire5[(2'h2):(1'h1)] && {((~^(wire6 ? wire9 : (8'ha7))) ?
                          $unsigned((wire0 | wire9)) : $unsigned(((8'hb6) ?
                              (8'hbc) : wire3))),
                      ({(~^wire1)} ? $signed(wire2) : $signed((+wire0)))});
  assign wire12 = wire11[(5'h12):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= wire5[(1'h0):(1'h0)];
    end
  assign wire14 = $signed((wire0[(2'h2):(1'h1)] ?
                      {$unsigned(wire5),
                          {$signed(wire5)}} : $signed($signed((wire12 ?
                          wire0 : wire8)))));
  module15 #() modinst91 (.y(wire90), .wire19(wire0), .wire20(wire9), .wire18(wire14), .wire17(wire6), .wire16(wire3), .clk(clk));
  module92 #() modinst108 (.clk(clk), .y(wire107), .wire94(wire90), .wire96(wire2), .wire93(reg13), .wire95(wire3));
  assign wire109 = {(~|$signed(wire3[(5'h12):(1'h1)])), {wire8[(3'h6):(3'h4)]}};
  assign wire110 = wire1[(3'h6):(3'h5)];
  assign wire111 = wire1[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg112 <= (8'hbb);
      reg113 <= (-($signed($signed(wire3[(2'h2):(1'h0)])) > wire107));
      reg114 <= $signed(wire9);
      reg115 <= ({wire90[(4'h8):(3'h5)], $signed(wire110[(5'h12):(4'h9)])} ?
          (^{(~$signed(wire0))}) : {wire8[(3'h6):(3'h5)]});
      if (wire111)
        begin
          reg116 <= (wire4 ?
              (8'hb2) : ($signed($unsigned((wire90 ? (8'hba) : wire10))) ?
                  wire10[(2'h2):(2'h2)] : wire5[(1'h0):(1'h0)]));
          if ((wire5 ?
              (+wire109[(2'h2):(1'h0)]) : $signed(wire11[(4'hb):(3'h4)])))
            begin
              reg117 <= wire107[(3'h4):(1'h1)];
            end
          else
            begin
              reg117 <= (($signed($unsigned((reg114 ? reg114 : (8'hab)))) ?
                  wire8 : $signed($signed($unsigned(wire109)))) >>> {(wire12[(3'h4):(2'h3)] ?
                      $signed($signed(reg13)) : wire14[(4'hd):(4'hd)])});
            end
          reg118 <= $signed(wire12[(4'hc):(4'hc)]);
          reg119 <= wire107;
        end
      else
        begin
          reg116 <= (wire11 + {(&wire7[(3'h5):(3'h4)]),
              $signed(reg112[(2'h3):(1'h1)])});
          reg117 <= (wire10[(4'ha):(3'h6)] < (~((7'h42) ^~ reg113)));
          reg118 <= $signed($signed(wire0));
        end
    end
  always
    @(posedge clk) begin
      reg120 <= $signed((7'h43));
      reg121 <= wire8;
    end
  assign wire122 = ((({wire4[(2'h3):(2'h2)]} ?
                       ((wire1 << wire90) ?
                           (reg121 ?
                               reg113 : wire4) : (reg115 ^ wire8)) : $signed((8'ha8))) ^~ wire1[(4'ha):(2'h2)]) <= ({((wire111 ?
                               wire12 : wire109) != wire10[(4'hf):(4'hf)]),
                           $unsigned((reg115 ^ reg115))} ?
                       $signed(((8'hbd) ?
                           (wire5 ? wire14 : reg115) : (^reg120))) : wire14));
  always
    @(posedge clk) begin
      reg123 <= $unsigned(wire110);
      reg124 <= $unsigned((+$signed(($unsigned((8'ha4)) >>> (!reg120)))));
      reg125 <= wire3[(5'h12):(4'hb)];
      reg126 <= ({((~(wire12 ?
              wire90 : reg114)) ^~ ($unsigned(wire4) != $unsigned(reg117))),
          (^~(~^wire1[(1'h0):(1'h0)]))} + $unsigned($unsigned($unsigned((wire4 ?
          (8'h9f) : reg113)))));
    end
  assign wire127 = $signed(wire1);
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  input wire [(4'h8):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  assign y = {wire106,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire97 = (((wire94[(3'h5):(2'h3)] == (^~(&wire93))) * ((~|(wire96 ?
                              wire96 : wire94)) ?
                          wire94[(3'h4):(2'h2)] : (&(wire94 & (8'hbf))))) ?
                      (~^(8'hbc)) : wire96);
  assign wire98 = $unsigned(({$unsigned(wire97[(3'h7):(3'h7)])} ?
                      wire95 : wire94));
  assign wire99 = $unsigned($signed($unsigned(wire94)));
  assign wire100 = (^(~|(wire93 && ({wire98, wire98} ?
                       ((8'ha3) | wire94) : $unsigned(wire94)))));
  assign wire101 = (+$unsigned(($signed((wire98 >= wire98)) == ($signed(wire100) * $unsigned(wire93)))));
  assign wire102 = (wire99 >> ($signed((|(wire93 ? wire95 : wire97))) ?
                       (|(-wire93[(2'h2):(1'h0)])) : wire99[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg103 <= (wire95[(1'h0):(1'h0)] >> {(^~$unsigned(wire95[(3'h7):(3'h5)]))});
      reg104 <= (wire99[(2'h2):(1'h0)] <= wire102);
      reg105 <= {reg103[(5'h11):(3'h4)],
          ($signed($signed($signed(wire99))) ? wire95 : wire98)};
    end
  assign wire106 = $unsigned(reg105[(4'hb):(3'h4)]);
endmodule

module module15  (y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire83;
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire26,
                 wire83,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $unsigned(wire16);
    end
  always
    @(posedge clk) begin
      reg22 <= wire18;
      reg23 <= ((~|(-$unsigned((~(8'hb2))))) && $unsigned(wire16));
      reg24 <= ($unsigned($unsigned((reg21 || (reg22 >>> wire18)))) ^ wire20[(1'h0):(1'h0)]);
      reg25 <= (wire19[(2'h2):(2'h2)] ~^ $signed((&((-reg22) ?
          (reg21 ~^ wire20) : ((8'ha4) >>> wire20)))));
    end
  assign wire26 = (~|$signed($signed((((8'haf) ?
                      (8'hb9) : reg25) <<< (reg23 <<< (8'hbd))))));
  module27 #() modinst84 (.wire28(reg21), .wire30(reg23), .wire31(wire17), .y(wire83), .clk(clk), .wire29(reg24));
  assign wire85 = $unsigned(reg22);
  assign wire86 = wire18;
  assign wire87 = ((&(($signed(wire16) ?
                      (wire17 - (8'hb1)) : (^~wire85)) >= (^(wire85 ?
                      wire19 : wire83)))) == $unsigned(wire16[(5'h10):(3'h4)]));
  assign wire88 = $unsigned((|(8'hb0)));
  assign wire89 = wire19[(2'h2):(1'h1)];
endmodule

module module27
#(parameter param81 = (((~|(&(~(8'h9e)))) | (8'h9d)) < ({(&(!(8'hbe)))} ? (((~(8'ha7)) >= (~&(8'haa))) ? ((~^(7'h44)) ? {(8'hb1), (8'ha5)} : ((8'hb9) ? (8'ha6) : (8'hb3))) : {((8'hb5) > (8'hbe))}) : (~|((!(8'hb6)) >> ((8'hac) ? (8'hbf) : (8'ha8)))))), 
parameter param82 = {((+(-(param81 ? param81 : param81))) ? param81 : (((+param81) || (~^param81)) ? (param81 ? (param81 || param81) : (&param81)) : ((param81 + (8'h9d)) ~^ (param81 ? param81 : param81)))), {(-(+(!param81)))}})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire70,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire32 = (!{$signed(($unsigned(wire30) ?
                          wire29 : wire28[(2'h3):(1'h0)]))});
  assign wire33 = (((((wire31 ? wire28 : wire28) >> (wire32 ?
                              wire28 : wire29)) - {(wire31 >= (8'hb2))}) ?
                          $unsigned(wire32[(1'h1):(1'h1)]) : wire30) ?
                      $unsigned(((~|(^~wire32)) <= (^(wire32 ~^ wire30)))) : (!(8'hb1)));
  assign wire34 = (!((wire33 && {{wire28},
                      (^~wire33)}) < {{wire32[(1'h1):(1'h0)]},
                      wire32[(1'h1):(1'h0)]}));
  assign wire35 = (^~(!$unsigned($signed(wire30[(1'h0):(1'h0)]))));
  assign wire36 = wire29[(2'h3):(2'h3)];
  assign wire37 = {wire28};
  assign wire38 = wire36[(4'h8):(3'h6)];
  assign wire39 = ((wire28 > $unsigned((&(^~wire34)))) > $unsigned({((8'ha5) ^ {wire31,
                          wire28}),
                      {$signed(wire30), wire29}}));
  assign wire40 = wire37;
  assign wire41 = wire39;
  assign wire42 = $signed(wire34);
  always
    @(posedge clk) begin
      reg43 <= $unsigned($unsigned(wire32));
      reg44 <= wire35;
      if (wire42[(2'h3):(2'h2)])
        begin
          reg45 <= wire30;
          if ((((8'hb8) * (reg44 ?
                  $unsigned(((8'ha5) ? (8'hb5) : wire37)) : $signed(wire29))) ?
              $unsigned($unsigned($signed($unsigned(wire28)))) : (reg44 < $signed((wire28[(3'h6):(1'h0)] ?
                  (8'hab) : {wire28})))))
            begin
              reg46 <= wire41;
            end
          else
            begin
              reg46 <= $unsigned(wire35);
              reg47 <= wire29;
              reg48 <= ({reg45[(1'h0):(1'h0)]} - (~($unsigned($unsigned(wire39)) ?
                  wire42 : ((reg45 ? (8'hb1) : (8'hbb)) ?
                      ((8'hb0) ~^ wire33) : $signed(wire33)))));
            end
          if (wire28[(1'h0):(1'h0)])
            begin
              reg49 <= (wire30[(4'h8):(1'h0)] ?
                  $signed((8'h9f)) : (((|$unsigned(wire28)) << ((wire36 ?
                              wire39 : wire34) ?
                          (8'hb3) : (reg46 ? wire28 : reg47))) ?
                      ((wire37 ? (^~(8'hb5)) : wire35) ?
                          ((~^(8'hb7)) <= {wire38}) : $unsigned(reg46)) : {$signed($signed(reg48))}));
              reg50 <= $unsigned($signed((((|wire32) ?
                  (8'h9f) : ((8'haa) ?
                      reg46 : (8'ha3))) <= $signed($signed((8'hb1))))));
            end
          else
            begin
              reg49 <= wire40[(4'hc):(1'h1)];
              reg50 <= (($signed((&$signed(wire37))) ?
                      {($signed(reg48) - (wire36 ? wire31 : wire36)),
                          (reg45 ?
                              wire36 : wire38[(2'h3):(2'h2)])} : ({wire37} ?
                          wire37 : (!reg48))) ?
                  $unsigned((8'haa)) : (((-$unsigned(wire33)) ^ reg43[(3'h4):(1'h0)]) ?
                      (-($signed((8'hbe)) ?
                          reg50[(4'h8):(3'h6)] : (+(8'hb1)))) : (+$unsigned({wire32}))));
              reg51 <= wire28;
              reg52 <= ($signed((wire31 ?
                  ($unsigned(wire37) ?
                      reg45 : (wire42 ?
                          reg44 : reg47)) : $signed($signed((8'hbf))))) * $signed(({reg48,
                      {reg51}} ?
                  ($signed(reg51) ?
                      $unsigned(reg46) : (^~wire37)) : $signed($unsigned(wire35)))));
              reg53 <= wire30;
            end
        end
      else
        begin
          reg45 <= (&({(~|(wire34 <= wire37)),
              {(~reg44), (wire34 ? wire40 : wire41)}} ~^ reg53[(3'h5):(3'h4)]));
        end
      reg54 <= wire40;
      if (($unsigned($signed({reg54,
          ((8'h9c) ? (8'hb7) : wire36)})) < ({(8'hb6),
              $signed(reg43[(1'h0):(1'h0)])} ?
          {reg45[(1'h1):(1'h0)],
              reg44[(1'h1):(1'h1)]} : {(wire39[(4'h9):(1'h1)] ?
                  reg52 : wire39)})))
        begin
          if (reg50[(3'h4):(2'h2)])
            begin
              reg55 <= wire42[(1'h1):(1'h0)];
              reg56 <= wire38;
              reg57 <= (&reg51[(4'hc):(4'ha)]);
              reg58 <= (^~((+wire28[(3'h7):(3'h5)]) ?
                  $unsigned($signed((reg55 ?
                      (8'ha1) : wire32))) : wire32[(2'h2):(1'h0)]));
              reg59 <= $signed(wire35);
            end
          else
            begin
              reg55 <= (reg55[(4'ha):(2'h2)] ?
                  wire33 : (((~&$signed(wire30)) ?
                      (-wire41[(4'h9):(2'h2)]) : {wire40[(4'ha):(4'h8)],
                          (reg45 ? (8'ha3) : reg52)}) & $signed(wire28)));
              reg56 <= $signed((|$unsigned(($unsigned(wire33) ?
                  {reg43} : ((8'hb1) ? reg49 : reg50)))));
            end
          reg60 <= wire29;
          if ((wire38[(1'h0):(1'h0)] && (reg46[(2'h3):(2'h2)] ?
              $signed((reg43 != (wire36 ?
                  wire36 : wire35))) : {($unsigned(wire36) ?
                      $unsigned((7'h44)) : reg58),
                  (|$signed(reg57))})))
            begin
              reg61 <= wire42;
              reg62 <= reg45[(3'h4):(2'h3)];
            end
          else
            begin
              reg61 <= reg58;
            end
          reg63 <= $signed(reg49);
        end
      else
        begin
          reg55 <= (~$signed(reg60[(2'h2):(1'h1)]));
          reg56 <= $unsigned(wire39[(2'h2):(1'h0)]);
          reg57 <= $signed({$unsigned((+reg44[(3'h6):(2'h3)])),
              {(~|wire39[(4'hc):(3'h6)])}});
        end
    end
  always
    @(posedge clk) begin
      reg64 <= ((8'hb7) ?
          ((+$signed((^~wire40))) ?
              $signed(($signed(reg51) & $signed(reg63))) : (-$signed((reg50 ?
                  wire28 : reg57)))) : {(8'hb0)});
      if ((^($unsigned(((wire31 || reg55) ?
              (wire41 ? reg60 : reg46) : (wire41 ? (8'h9c) : wire28))) ?
          $unsigned(reg49[(1'h0):(1'h0)]) : {(((8'ha6) <<< wire31) == reg55[(3'h4):(2'h2)]),
              $signed((8'ha2))})))
        begin
          if ((($unsigned(reg57[(2'h2):(2'h2)]) ?
                  $signed($signed((~^reg53))) : wire35[(4'ha):(1'h0)]) ?
              $signed(wire38[(3'h5):(3'h5)]) : reg54))
            begin
              reg65 <= $signed($unsigned($unsigned($signed((wire33 ?
                  reg60 : wire40)))));
            end
          else
            begin
              reg65 <= $signed($unsigned((({wire39} - {(7'h42), reg59}) ?
                  reg52[(1'h0):(1'h0)] : (!(8'h9f)))));
              reg66 <= {($unsigned(((|wire28) * $unsigned(reg63))) ?
                      $unsigned((((8'hbe) ?
                          wire41 : wire33) || (wire28 >>> wire42))) : (!(reg65[(4'ha):(3'h5)] & {wire35,
                          reg47}))),
                  (~$signed({$signed(reg56)}))};
            end
        end
      else
        begin
          reg65 <= (({reg65[(4'hc):(4'h8)]} ?
                  ((~|(reg59 && wire30)) * $signed($signed(reg44))) : wire42) ?
              (&wire29[(3'h6):(2'h2)]) : (~&reg55[(5'h12):(4'he)]));
        end
      reg67 <= $unsigned(($unsigned((~|(~(7'h43)))) ?
          ($signed((~|reg56)) ?
              reg64 : reg55[(5'h11):(5'h10)]) : $unsigned(({reg52} ?
              (reg64 > reg46) : (reg58 ? reg46 : reg52)))));
      reg68 <= {$unsigned(((~|{reg45}) < wire38[(2'h3):(2'h2)])),
          {(&(wire35 ? (wire37 ? wire37 : wire32) : (-(8'hb6)))),
              (!$unsigned(reg64))}};
      reg69 <= (wire39 & {(wire29 ~^ {(wire29 ? (8'hb8) : reg53),
              (reg46 ? wire31 : reg65)})});
    end
  assign wire70 = reg61[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg71 <= reg47[(1'h0):(1'h0)];
      if ((8'ha6))
        begin
          reg72 <= (~^(~|$signed((~^$unsigned(reg45)))));
          reg73 <= wire37;
          reg74 <= reg72[(4'ha):(3'h5)];
        end
      else
        begin
          reg72 <= (8'hae);
        end
      reg75 <= (|((((^wire37) ^~ (reg58 ? reg59 : reg69)) ?
          (8'h9f) : ($signed(reg64) ?
              $unsigned(wire33) : $signed((8'ha9)))) > (+$unsigned((reg58 ?
          reg44 : (7'h44))))));
      reg76 <= (8'hbf);
      reg77 <= {(wire38[(3'h5):(2'h3)] ?
              wire30[(1'h0):(1'h0)] : $unsigned($signed(wire28[(4'h9):(2'h3)]))),
          reg50};
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned(($unsigned(wire32) ?
          $unsigned(((reg49 ^~ wire29) ?
              (reg68 ? reg61 : wire40) : wire41[(5'h10):(4'hc)])) : {(reg51 ?
                  {reg64, reg71} : (^~reg43)),
              $unsigned((7'h41))}));
    end
  assign wire79 = wire41[(1'h0):(1'h0)];
  assign wire80 = ($signed(reg53[(4'h8):(2'h3)]) ?
                      $signed(reg44[(1'h0):(1'h0)]) : (reg78 ?
                          wire41 : $signed($signed((|(8'ha4))))));
endmodule
