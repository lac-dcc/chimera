module top
#(parameter param168 = (((8'h9f) >>> {((~|(8'ha2)) * ((8'hb6) == (8'hb0))), {((8'h9d) ? (8'hb9) : (8'hbb))}}) ? {(!(&((8'hab) ? (8'h9c) : (8'ha8))))} : ((~&(~|((8'ha0) ? (8'hae) : (7'h40)))) ? ((((7'h44) ? (8'ha3) : (8'ha5)) >= (7'h41)) ? ((~&(8'hb7)) ? (^~(8'hbd)) : {(8'hae)}) : {((8'hb8) ? (8'hb6) : (8'h9f)), ((8'h9c) ^ (8'hac))}) : (|((~|(8'hb1)) <= (+(8'ha3)))))), 
parameter param169 = ({(8'haf), param168} <= param168))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(2'h3):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire156;
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  assign y = {wire167,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire5,
                 wire88,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire156,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire5 = $unsigned($signed($signed(((wire0 > wire4) >>> (wire3 >>> wire4)))));
  module6 #() modinst89 (.wire10(wire2), .clk(clk), .wire8(wire3), .wire7(wire4), .wire9(wire1), .y(wire88));
  assign wire90 = {(wire3[(4'hf):(4'ha)] & wire1)};
  assign wire91 = ($signed($unsigned(((wire4 > wire5) >>> (wire5 >> (8'ha6))))) ?
                      wire1[(4'h8):(1'h1)] : $unsigned(wire0[(3'h4):(3'h4)]));
  assign wire92 = $signed(wire2);
  assign wire93 = $signed($signed(wire3));
  assign wire94 = wire2[(5'h14):(5'h13)];
  module95 #() modinst157 (.wire99(wire90), .wire97(wire92), .wire96(wire0), .wire100(wire88), .wire98(wire4), .y(wire156), .clk(clk));
  assign wire158 = (^~wire0[(3'h5):(2'h2)]);
  assign wire159 = ((+(((~|wire91) ? $unsigned((8'hb6)) : (-wire90)) ?
                           $signed(wire2) : ($signed(wire91) || $signed(wire93)))) ?
                       (8'ha4) : $signed({{(-wire91), (~^wire4)}}));
  assign wire160 = (-($unsigned(wire159[(1'h0):(1'h0)]) ?
                       wire90 : wire158[(3'h5):(3'h4)]));
  assign wire161 = {{$unsigned((~wire158[(4'h9):(1'h1)]))}};
  assign wire162 = (+($unsigned((((8'haf) ? wire88 : wire4) ?
                       (wire88 ?
                           wire93 : wire92) : (&wire92))) & ($signed((wire1 > wire158)) ^~ $signed((wire2 ?
                       wire0 : wire2)))));
  assign wire163 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg164 <= wire159[(4'ha):(2'h2)];
      reg165 <= wire156;
      reg166 <= ($signed($signed((wire2[(3'h7):(1'h1)] ?
          ((8'ha6) > wire161) : wire92[(3'h6):(2'h2)]))) <= $signed(wire162));
    end
  assign wire167 = (~{wire1});
endmodule

module module95
#(parameter param154 = ((8'h9d) == ((((~|(8'hba)) * (~^(8'hb8))) != {(^(8'hbf))}) >= ({((8'hb5) ? (8'hb7) : (8'had)), ((8'hb4) ? (8'ha1) : (8'ha0))} ? (~((8'hb0) == (8'hb0))) : (((8'had) ^~ (8'h9e)) >> ((7'h40) ? (8'ha3) : (8'hbe)))))), 
parameter param155 = param154)
(y, clk, wire96, wire97, wire98, wire99, wire100);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire signed [(3'h4):(1'h0)] wire97;
  input wire [(5'h11):(1'h0)] wire98;
  input wire signed [(5'h15):(1'h0)] wire99;
  input wire [(5'h13):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire145;
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire145,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire101 = {(($signed((wire96 != wire98)) ?
                               $signed(wire100[(2'h3):(1'h1)]) : (8'hb9)) ?
                           (wire96[(4'hb):(4'hb)] ~^ wire96[(4'ha):(4'ha)]) : (~wire98)),
                       ((((wire98 ?
                           wire97 : wire97) * (wire99 > wire98)) <<< $signed($signed(wire99))) | wire97[(2'h3):(1'h0)])};
  assign wire102 = $signed(wire100[(1'h1):(1'h1)]);
  assign wire103 = $unsigned($signed(wire99[(1'h1):(1'h0)]));
  assign wire104 = wire97;
  assign wire105 = wire104;
  module106 #() modinst146 (.wire107(wire98), .wire110(wire100), .y(wire145), .wire108(wire105), .clk(clk), .wire111(wire102), .wire109(wire96));
  assign wire147 = wire102;
  assign wire148 = (wire100[(2'h3):(2'h2)] ?
                       (~^(wire98[(4'hc):(3'h6)] ?
                           ((wire102 <<< wire97) <<< wire147[(1'h1):(1'h0)]) : (~(wire101 ^~ wire98)))) : ((((wire100 ?
                                   wire105 : wire147) <<< (wire100 ?
                                   wire102 : (8'hb6))) ?
                               ((wire100 > wire145) >= $signed(wire101)) : $unsigned((wire103 ?
                                   wire105 : wire145))) ?
                           wire96 : wire98));
  assign wire149 = wire148;
  assign wire150 = $signed((+(7'h41)));
  assign wire151 = (((^~((wire101 || wire101) ?
                           wire105 : (wire103 << wire100))) ?
                       wire148[(4'h8):(1'h0)] : wire96[(3'h4):(2'h2)]) || (($unsigned($unsigned(wire104)) ?
                       (wire101 ?
                           wire149 : (~^wire147)) : ((+wire150) | wire96)) - wire149));
  always
    @(posedge clk) begin
      reg152 <= (^~$unsigned($unsigned(wire97[(3'h4):(2'h3)])));
      reg153 <= (wire98 ?
          (&$signed((wire105[(2'h3):(1'h0)] > $unsigned(wire100)))) : ((+$unsigned({wire97})) | wire105[(3'h6):(2'h3)]));
    end
endmodule

module module6
#(parameter param87 = (^~{(8'ha4)}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire11;
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire11,
                 (1'h0)};
  assign wire11 = wire10[(3'h6):(2'h3)];
  module12 #() modinst44 (.wire16(wire8), .clk(clk), .y(wire43), .wire14(wire7), .wire13(wire11), .wire15(wire9));
  assign wire45 = $unsigned(wire9);
  assign wire46 = {wire9[(1'h1):(1'h0)]};
  assign wire47 = {wire9};
  module48 #() modinst81 (wire80, clk, wire7, wire10, wire11, wire47);
  assign wire82 = wire46;
  assign wire83 = wire8[(2'h2):(1'h1)];
  assign wire84 = (~^{wire46[(1'h1):(1'h0)]});
  assign wire85 = (wire43 ?
                      wire43 : $unsigned((wire8 << $signed($signed(wire84)))));
  assign wire86 = $signed($signed(wire10));
endmodule

module module48
#(parameter param79 = ({(^~((&(8'ha6)) ? ((8'hba) ? (8'hba) : (8'ha4)) : (~^(8'h9e)))), ((((8'hbd) ~^ (7'h42)) ? (~^(8'hbc)) : ((8'ha7) >= (8'ha9))) << (((8'hb1) ? (8'ha2) : (8'ha3)) ? {(8'hab)} : (&(7'h42))))} && (((&((8'ha8) ? (7'h40) : (8'hbf))) ? (8'hbe) : (((8'h9e) != (8'hb0)) || ((8'ha2) >> (7'h40)))) ? ((((8'hb8) ? (8'ha4) : (8'hb7)) ^~ ((8'h9d) ? (8'hae) : (8'ha7))) << ((~(8'hac)) && {(8'hba)})) : {((^~(8'ha6)) || (~|(8'ha7)))})))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  input wire [(5'h11):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire73,
                 wire72,
                 wire70,
                 wire62,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg75,
                 reg74,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire53 = wire51;
  assign wire54 = $unsigned((^~{($unsigned((8'hbf)) ~^ ((8'had) ?
                          wire52 : wire49)),
                      wire51}));
  assign wire55 = $unsigned({{wire54[(3'h6):(2'h2)]},
                      ((wire52 * (wire52 ?
                          wire52 : wire52)) == wire50[(4'hc):(3'h7)])});
  assign wire56 = (wire50 > ($signed($signed($unsigned((8'hbf)))) ?
                      ($unsigned({wire52}) < $unsigned((^wire51))) : ($unsigned(wire50) ~^ ($signed(wire54) ^~ (wire54 ?
                          (8'ha1) : wire52)))));
  assign wire57 = $unsigned(wire53);
  assign wire58 = ($unsigned((wire49[(1'h0):(1'h0)] ?
                      ((wire55 <= wire55) == (wire51 ?
                          wire49 : wire56)) : (wire53 ?
                          (wire53 ?
                              wire55 : wire53) : wire49))) < {(~^wire55[(3'h5):(3'h4)])});
  assign wire59 = $signed((8'ha1));
  always
    @(posedge clk) begin
      reg60 <= wire55[(2'h2):(2'h2)];
      reg61 <= ($unsigned($signed((~&((8'ha5) ? wire55 : wire53)))) ?
          (wire50 || $signed(wire59)) : (wire51[(4'he):(4'h8)] ?
              ({wire57} ?
                  ($unsigned(wire51) ?
                      $signed(wire52) : wire49[(1'h1):(1'h1)]) : (wire54[(4'hd):(4'hb)] < $signed(wire54))) : (~^$signed($signed(wire58)))));
    end
  assign wire62 = (wire50 - (wire51[(5'h10):(4'h9)] ?
                      (~^($unsigned(wire56) <<< (8'hb9))) : ((~$unsigned(reg61)) ~^ reg60[(5'h10):(3'h7)])));
  always
    @(posedge clk) begin
      reg63 <= {{wire59}};
      reg64 <= {(^(|$unsigned($signed(wire51))))};
      reg65 <= (8'haf);
      if (reg64)
        begin
          reg66 <= wire52;
          reg67 <= ({(!$unsigned(wire50)),
                  $unsigned({(wire51 ? wire62 : (7'h44)), (reg66 ^ wire58)})} ?
              $signed((wire50 ?
                  {(wire51 ^~ wire53)} : (~|(wire56 ?
                      wire55 : (8'ha8))))) : {({(wire49 ? wire56 : (8'h9c))} ?
                      ($unsigned((8'hbd)) ?
                          $unsigned(wire62) : reg63) : $signed($signed(wire57)))});
          reg68 <= (~$signed((wire57[(2'h3):(2'h3)] + (reg63[(3'h4):(2'h2)] ?
              {wire54} : {reg63, wire53}))));
        end
      else
        begin
          reg66 <= (^({(^$signed((8'hb4)))} - $signed((8'hb9))));
        end
      reg69 <= $unsigned(($unsigned((8'hb5)) & {(^(reg66 ?
              wire62 : (8'ha9)))}));
    end
  assign wire70 = ((!(((~reg64) ? wire52 : (!(8'hbc))) ?
                      wire56 : (wire59 * (wire56 << reg68)))) ^ $unsigned(($unsigned($signed(reg63)) ?
                      {(&reg67),
                          $signed((7'h42))} : $signed(wire55[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg71 <= ((($unsigned(wire51) <<< (8'had)) ?
              $unsigned((!{wire53})) : {((+wire56) ? reg67 : (+wire50))}) ?
          reg67[(3'h4):(1'h1)] : wire56[(3'h6):(3'h6)]);
    end
  assign wire72 = ($signed({$signed(wire55[(4'hc):(4'h8)]),
                      (reg61 == $unsigned(wire62))}) <= $signed($signed(((wire57 ?
                      reg60 : wire70) >> $unsigned(wire52)))));
  assign wire73 = $signed($unsigned((-(&(8'hb4)))));
  always
    @(posedge clk) begin
      reg74 <= (&wire59[(3'h4):(2'h3)]);
      reg75 <= ((&$unsigned((8'had))) ?
          reg68[(2'h3):(2'h2)] : $signed($signed(reg65[(3'h5):(3'h4)])));
    end
  assign wire76 = (($signed((wire53[(4'h8):(4'h8)] && wire72)) <<< ($unsigned(reg63) ?
                          reg63[(4'hb):(3'h7)] : wire54[(4'hc):(4'hc)])) ?
                      reg60[(5'h12):(4'hc)] : $unsigned(reg69));
  assign wire77 = ((((((8'hb9) == wire73) ?
                      (!wire72) : reg68[(2'h2):(1'h1)]) <<< $signed(reg66)) - $unsigned((!(wire53 ?
                      wire59 : wire50)))) == $unsigned((~($signed(reg66) << reg68))));
  assign wire78 = (^wire77);
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = $signed((wire13 <= ($signed(wire16[(4'hd):(3'h6)]) ?
                      $unsigned((-wire14)) : $signed(wire15[(2'h2):(1'h0)]))));
  assign wire18 = $unsigned(({wire15[(4'hb):(2'h2)]} && wire13[(3'h5):(3'h4)]));
  assign wire19 = wire13[(2'h3):(2'h2)];
  assign wire20 = (wire17 <<< (~^wire14[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg21 <= (~|(8'hbc));
      if ((^~(wire20 >>> $unsigned({wire17[(3'h7):(2'h2)],
          (wire15 << (8'hb5))}))))
        begin
          reg22 <= {wire17[(1'h1):(1'h0)]};
        end
      else
        begin
          if (({$signed($signed((^(8'hac)))),
              ((+{wire15}) ?
                  wire19[(4'hd):(3'h7)] : (wire15 | wire20))} ^~ (~^$unsigned((wire18[(4'hc):(4'h9)] >= (!(8'hae)))))))
            begin
              reg22 <= wire19[(3'h4):(3'h4)];
              reg23 <= wire20[(1'h0):(1'h0)];
              reg24 <= (((((wire13 ? wire13 : wire17) >>> $signed(wire16)) ?
                  {{wire13}} : reg21[(4'hb):(3'h6)]) >= $signed($unsigned((^wire20)))) ^~ $signed(wire18));
              reg25 <= wire15[(4'h9):(1'h1)];
            end
          else
            begin
              reg22 <= (^(~|{(&{wire13}),
                  ((wire17 ? wire14 : wire15) > wire16[(4'hc):(4'h9)])}));
              reg23 <= $signed((~$unsigned(((wire16 < wire16) ?
                  (~reg25) : $signed((7'h43))))));
            end
          reg26 <= {$unsigned(wire19)};
          reg27 <= ({((!(wire14 | wire15)) ?
                  (!wire16[(4'hc):(4'hb)]) : (wire16[(3'h7):(3'h5)] < $signed(wire14))),
              (wire14[(4'he):(3'h4)] ?
                  (8'ha3) : reg21[(1'h0):(1'h0)])} ^ reg23[(1'h0):(1'h0)]);
          reg28 <= $signed({wire19});
          reg29 <= ($unsigned({$signed($unsigned(wire13)),
              ($signed(reg23) | (~reg27))}) ^ (reg22 ?
              $signed($unsigned($signed(wire13))) : reg25));
        end
      reg30 <= (($signed((~$unsigned((8'hb6)))) ?
          {$signed($unsigned(wire17))} : (^~reg24)) >= (-{(!{reg29, reg26}),
          (7'h43)}));
    end
  assign wire31 = ($unsigned($unsigned(((^reg24) || $signed((8'ha7))))) + reg25[(1'h0):(1'h0)]);
  assign wire32 = (~|{(wire31 | (-((8'hbf) ? reg28 : reg21))),
                      $signed((!$unsigned((8'hbd))))});
  assign wire33 = ($unsigned(reg26[(3'h6):(1'h1)]) || {{($signed(reg25) - (wire32 * wire32)),
                          reg25}});
  assign wire34 = $signed($unsigned(((~(wire19 == (8'hb3))) <<< ($unsigned(wire15) ?
                      (reg29 ? wire16 : reg26) : (&(8'hb7))))));
  always
    @(posedge clk) begin
      reg35 <= $signed($unsigned((|($signed(reg29) << $unsigned(wire34)))));
      reg36 <= (-$unsigned($signed($unsigned(reg24))));
      reg37 <= ($signed((~|(wire20 >> reg25))) >>> $signed((-((reg21 ?
          reg36 : reg35) <= reg36[(4'h8):(2'h2)]))));
      reg38 <= ((~|$signed((reg35 + reg35))) >= ((wire19 ~^ $signed({reg21,
              wire20})) ?
          {reg21[(3'h6):(1'h1)]} : $signed({$signed((8'hbb)),
              reg37[(2'h3):(2'h2)]})));
    end
  assign wire39 = (((($signed(reg25) > wire34) >= reg35) ?
                          reg23 : (^$signed($unsigned(reg35)))) ?
                      wire31 : wire18[(2'h2):(1'h1)]);
  assign wire40 = ($unsigned((~|$unsigned((wire34 ? wire13 : (8'hb5))))) ?
                      reg29[(4'hc):(1'h1)] : (((-{reg28}) ?
                              $unsigned((reg36 << reg28)) : wire32) ?
                          (~{(8'hb0)}) : (!reg36)));
  assign wire41 = ((^~reg37) ?
                      wire17[(4'hb):(3'h6)] : (+$unsigned((reg38 << (8'hae)))));
  assign wire42 = (wire34[(4'hc):(1'h0)] != wire13[(3'h5):(3'h4)]);
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire signed [(3'h7):(1'h0)] wire108;
  input wire [(5'h11):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg144,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire112 = wire111;
  assign wire113 = $unsigned($signed((&wire110[(4'hb):(4'hb)])));
  assign wire114 = wire107;
  assign wire115 = (((|(8'ha3)) ?
                       $signed(({wire114} ?
                           $signed(wire108) : (^~wire110))) : ($unsigned((wire114 ?
                               wire107 : wire110)) ?
                           $unsigned((wire113 ?
                               wire107 : (8'had))) : (wire109[(4'hc):(1'h0)] ?
                               (wire112 ?
                                   wire108 : wire111) : (~&wire108)))) & (8'ha5));
  assign wire116 = wire113[(3'h4):(1'h0)];
  assign wire117 = wire112;
  assign wire118 = (8'ha0);
  assign wire119 = (!$signed($signed($signed({(8'ha6), wire108}))));
  always
    @(posedge clk) begin
      reg120 <= {wire111, (wire117 > $signed($signed(wire117[(3'h4):(1'h0)])))};
      reg121 <= $unsigned(($signed(((wire115 > wire119) ?
              wire119 : $unsigned(reg120))) ?
          (wire109 * ((8'ha7) ?
              (wire114 >= wire118) : ((8'hbc) ^ wire111))) : (reg120 ?
              reg120 : wire115[(3'h5):(2'h2)])));
      reg122 <= wire118;
      if ($unsigned(($unsigned(((wire113 ?
              wire118 : wire107) ^ $unsigned(wire107))) ?
          (~^wire108) : (~({(8'hbb)} - $unsigned(reg122))))))
        begin
          reg123 <= $signed($unsigned($unsigned(((wire112 <<< wire112) ^ $signed((8'hb4))))));
        end
      else
        begin
          reg123 <= (~&((wire115 ?
                  (~&(8'hb3)) : ((wire110 ?
                      (8'hb1) : (8'hb7)) != (wire108 >> wire112))) ?
              (~^(&(~(8'haf)))) : wire111));
        end
    end
  assign wire124 = reg121;
  assign wire125 = ((($unsigned({reg122, wire116}) ?
                           wire109 : $signed({wire115})) ?
                       ((8'hbd) << (~&(reg120 >>> wire109))) : wire115) <<< $signed($unsigned($signed((~^wire119)))));
  assign wire126 = $unsigned(($unsigned(($signed((8'hb6)) ?
                       $unsigned(wire112) : (wire110 >= wire114))) < $unsigned({(-(8'hb4))})));
  assign wire127 = (($signed(($signed(wire111) ?
                               {wire116, (8'ha2)} : $signed(wire112))) ?
                           wire110[(2'h2):(1'h1)] : wire109[(1'h0):(1'h0)]) ?
                       wire125[(2'h3):(2'h2)] : ((^(reg123[(1'h0):(1'h0)] ?
                               wire110 : wire112)) ?
                           $signed(reg123) : $signed($unsigned(wire107))));
  assign wire128 = $unsigned($unsigned($unsigned((wire124[(2'h2):(1'h1)] ?
                       wire116 : (~|wire114)))));
  assign wire129 = {wire113,
                       (~&$signed(({wire116,
                           (8'hb6)} != (wire126 * wire115))))};
  assign wire130 = wire116;
  assign wire131 = $signed((($signed(((8'ha7) ?
                       wire108 : (8'hb8))) > (wire117[(3'h4):(2'h3)] ?
                       (+(7'h40)) : reg120)) ~^ $signed(reg123[(4'h8):(1'h0)])));
  always
    @(posedge clk) begin
      reg132 <= (8'haf);
      reg133 <= wire129[(2'h3):(2'h2)];
      reg134 <= $signed((($signed({wire114}) ?
              ((-wire112) ?
                  $unsigned(wire130) : wire127[(1'h1):(1'h1)]) : (!(~&wire128))) ?
          $unsigned(((wire116 ^ wire108) ?
              (wire107 ?
                  reg123 : wire126) : (reg123 >= wire117))) : $unsigned($signed($unsigned(wire114)))));
      reg135 <= (!((wire125 ?
          (~reg133[(3'h5):(2'h3)]) : $unsigned($unsigned((8'ha6)))) >= (({wire129,
              wire108} ?
          {wire108, wire115} : (^~wire109)) - $signed(reg121))));
      if (reg132[(1'h1):(1'h1)])
        begin
          reg136 <= ($signed($signed(((reg133 ?
              wire131 : reg135) - (~&(8'hbe))))) | (wire115[(3'h5):(3'h4)] | (((8'hb0) || $unsigned(reg132)) ?
              wire131 : wire129)));
          reg137 <= (~reg135[(4'hc):(4'ha)]);
          reg138 <= wire125;
          reg139 <= $unsigned(wire129);
          if (wire126)
            begin
              reg140 <= ((~|(wire126[(3'h7):(3'h6)] ~^ wire117)) * wire125);
              reg141 <= reg122[(4'ha):(2'h2)];
            end
          else
            begin
              reg140 <= $signed((8'ha9));
              reg141 <= $signed((((|$signed(reg120)) ?
                  (~|(wire131 <<< wire119)) : $signed(wire127)) ~^ $unsigned((reg135[(3'h7):(1'h0)] - (wire115 ?
                  (8'hbb) : (8'hbf))))));
              reg142 <= wire118[(4'h9):(3'h7)];
              reg143 <= reg139[(1'h0):(1'h0)];
              reg144 <= (~|wire115[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg136 <= (~^(8'h9c));
          reg137 <= ((reg141 ? (8'h9f) : reg144) ?
              (reg137[(3'h5):(2'h3)] != ((!(wire126 ? wire128 : reg141)) ?
                  wire114 : $unsigned($unsigned(reg132)))) : $signed($unsigned(wire116)));
          reg138 <= $unsigned($signed((|reg120[(4'hc):(3'h6)])));
        end
    end
endmodule
