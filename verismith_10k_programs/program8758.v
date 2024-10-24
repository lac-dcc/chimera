module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire179;
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire75,
                 wire5,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire179,
                 reg183,
                 reg182,
                 reg181,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  module6 #() modinst76 (.wire9(wire2), .wire7(wire5), .clk(clk), .wire10(wire4), .y(wire75), .wire11(wire3), .wire8(wire1));
  assign wire77 = ($signed($signed($signed(wire1[(3'h4):(2'h3)]))) ?
                      $signed($signed(((wire75 + wire4) > (!wire1)))) : ((|wire2) ?
                          $signed($unsigned($unsigned((8'h9c)))) : wire5));
  assign wire78 = (((!(~^$unsigned(wire77))) ?
                          (8'ha6) : $unsigned(($signed((8'ha7)) ?
                              $unsigned(wire75) : $unsigned(wire0)))) ?
                      wire77[(4'h8):(2'h2)] : wire4);
  assign wire79 = $unsigned($signed((~&{wire75[(4'hc):(3'h4)]})));
  assign wire80 = (wire2[(2'h2):(1'h1)] ?
                      $unsigned(wire1[(4'ha):(4'h9)]) : $signed(({$unsigned(wire2),
                              wire4} ?
                          $unsigned($unsigned(wire5)) : $unsigned({wire79,
                              wire0}))));
  assign wire81 = $unsigned(wire75);
  assign wire82 = wire75;
  assign wire83 = {$signed({(|(wire4 & wire80)), wire4})};
  assign wire84 = {$signed({(8'hb3)}),
                      (wire5 < {$unsigned($unsigned(wire77))})};
  assign wire85 = ($signed($signed(($unsigned(wire78) >>> {wire82}))) ?
                      ((wire3 ? (8'ha2) : wire1) ?
                          wire1 : (wire1 >> (8'ha2))) : $signed(((^$unsigned(wire2)) && $unsigned(wire83))));
  always
    @(posedge clk) begin
      reg86 <= (|wire80);
      reg87 <= wire79;
      if ($unsigned((wire78[(3'h4):(1'h0)] * (8'hb0))))
        begin
          reg88 <= {(({wire5} ~^ $unsigned($signed(wire5))) ?
                  ($signed($unsigned(wire0)) ?
                      (+{wire4, reg86}) : ((reg86 ? wire81 : wire77) ?
                          wire1 : wire75[(4'ha):(3'h4)])) : (wire84[(4'he):(1'h0)] * $unsigned($signed(wire82)))),
              $unsigned((((reg86 && (8'hb0)) ?
                  wire78[(2'h3):(1'h0)] : wire85[(3'h5):(1'h0)]) >= ((wire0 ~^ wire84) ?
                  (wire75 << wire78) : $signed(wire75))))};
          if (wire77)
            begin
              reg89 <= ($unsigned($unsigned({wire3})) ?
                  reg86[(4'hd):(4'hb)] : reg88[(2'h2):(1'h1)]);
            end
          else
            begin
              reg89 <= $unsigned(wire2);
              reg90 <= wire79;
              reg91 <= $unsigned(wire79[(1'h0):(1'h0)]);
              reg92 <= (~^({$unsigned($unsigned(wire85))} ?
                  ({$unsigned(wire5), (^~(8'hbe))} - ((~|reg91) ?
                      (reg89 ?
                          wire77 : reg89) : $unsigned(wire2))) : wire84[(4'h8):(4'h8)]));
              reg93 <= reg91[(3'h5):(2'h2)];
            end
          reg94 <= $unsigned({wire5[(3'h4):(2'h3)]});
        end
      else
        begin
          if ((wire84[(5'h13):(2'h3)] ?
              $signed(reg88[(1'h1):(1'h1)]) : (&((reg94[(2'h2):(2'h2)] == {(7'h44),
                  reg91}) <<< wire84[(5'h12):(4'hf)]))))
            begin
              reg88 <= (-wire82[(2'h3):(1'h0)]);
              reg89 <= wire85;
            end
          else
            begin
              reg88 <= reg93[(3'h5):(2'h3)];
              reg89 <= (!wire80);
            end
          reg90 <= {reg87[(2'h2):(1'h0)]};
        end
    end
  module95 #() modinst180 (wire179, clk, wire85, reg86, reg92, wire2, wire83);
  always
    @(posedge clk) begin
      reg181 <= wire2;
      if ((wire82 | ($unsigned(wire179) ?
          wire77[(5'h14):(3'h6)] : $unsigned({(wire82 > reg87),
              (wire83 ? wire3 : wire5)}))))
        begin
          reg182 <= $signed(reg181[(1'h1):(1'h1)]);
        end
      else
        begin
          reg182 <= ((reg182[(3'h4):(2'h3)] ?
              (~(~|$signed(wire5))) : $signed((~&(wire77 || wire4)))) ^ (8'hb3));
          reg183 <= ((&((wire3 <= wire78[(2'h3):(2'h3)]) ?
              ((wire82 | wire2) ?
                  $unsigned(reg94) : $unsigned(wire2)) : $signed(((8'hb3) <<< reg90)))) - wire75);
        end
    end
endmodule

module module95  (y, clk, wire96, wire97, wire98, wire99, wire100);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire [(3'h5):(1'h0)] wire98;
  input wire [(4'h8):(1'h0)] wire99;
  input wire [(4'hb):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire177;
  wire signed [(5'h10):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire157;
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(4'hf):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(4'h9):(1'h0)] reg160 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire166,
                 wire165,
                 wire159,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire157,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire101 = (~(wire100[(1'h0):(1'h0)] ?
                       wire99[(3'h5):(2'h3)] : $signed(((wire96 + wire99) >= $unsigned(wire99)))));
  assign wire102 = wire100[(3'h5):(3'h4)];
  assign wire103 = $signed((wire102 > wire99));
  assign wire104 = (wire101 ?
                       {(-$unsigned($signed(wire97))),
                           ((wire98[(1'h1):(1'h1)] && wire97[(4'hb):(4'h8)]) ?
                               $signed(wire101) : ((wire97 == wire101) ?
                                   (wire102 >> wire100) : ((8'hb3) && wire96)))} : $signed($unsigned($unsigned((wire102 < wire102)))));
  assign wire105 = (((^~wire100[(2'h2):(1'h1)]) <<< (wire103 ?
                           $unsigned($unsigned((7'h40))) : wire102[(4'he):(3'h4)])) ?
                       $unsigned($unsigned(((wire99 ? wire98 : wire99) ?
                           {wire101,
                               wire99} : $unsigned(wire99)))) : wire99[(2'h3):(1'h1)]);
  module106 #() modinst158 (.wire108(wire103), .wire111(wire105), .clk(clk), .wire110(wire100), .y(wire157), .wire107(wire97), .wire109(wire96));
  assign wire159 = ((!$unsigned($signed({(8'had)}))) ?
                       (wire103[(4'hc):(2'h2)] < ($signed(wire105) ?
                           wire103 : wire101)) : $unsigned($signed(($signed(wire102) ?
                           wire103 : $unsigned(wire101)))));
  always
    @(posedge clk) begin
      reg160 <= wire97;
      if ((~&((wire96 ? $unsigned($unsigned(wire104)) : wire100) <<< {((wire99 ?
              wire157 : (8'hbd)) && $unsigned((8'h9f))),
          (wire101[(3'h4):(1'h1)] ? (~|wire97) : (wire102 - reg160))})))
        begin
          reg161 <= (wire101[(3'h5):(2'h2)] ?
              (|$unsigned(($signed(wire105) ?
                  $unsigned(wire98) : $signed(wire159)))) : wire159[(1'h0):(1'h0)]);
          reg162 <= wire159[(1'h0):(1'h0)];
        end
      else
        begin
          reg161 <= (+(wire98[(3'h4):(1'h1)] ?
              (~&(|(reg161 ? wire104 : wire96))) : {reg161[(1'h1):(1'h1)],
                  (((8'hb9) ? wire96 : wire98) >>> (wire159 >> wire97))}));
          reg162 <= (7'h43);
          reg163 <= ($unsigned($unsigned(wire101[(3'h4):(2'h3)])) ?
              (({{wire101, wire99}, wire101[(3'h6):(2'h3)]} ?
                      wire101 : wire97[(4'hb):(3'h7)]) ?
                  (&reg162) : $signed((8'hb2))) : wire102[(4'he):(3'h4)]);
          reg164 <= wire103[(4'he):(1'h1)];
        end
    end
  assign wire165 = (((($unsigned((8'ha2)) ?
                       wire102[(2'h2):(2'h2)] : reg163[(5'h11):(1'h0)]) - {reg162[(2'h2):(1'h1)]}) < (~^(~$unsigned(wire100)))) >= ((($signed(wire105) | reg162[(1'h1):(1'h1)]) ?
                       $unsigned((|reg163)) : $signed(wire99[(3'h5):(2'h3)])) > {((wire96 << reg163) ?
                           {wire96} : $signed((8'hb3))),
                       $signed((wire105 < wire99))}));
  assign wire166 = $signed(((~^$unsigned((~^reg162))) ?
                       (wire96 >= $unsigned((^~wire102))) : {wire97}));
  always
    @(posedge clk) begin
      if (reg162)
        begin
          reg167 <= $signed(wire165);
          reg168 <= $signed(((&((|reg161) ?
                  (-reg164) : wire98[(3'h4):(1'h0)])) ?
              {(reg167 ? $signed(reg167) : (wire100 ^~ wire166)),
                  $signed(wire157[(2'h2):(1'h0)])} : $signed(($unsigned(wire101) * reg164))));
          reg169 <= ((wire159[(1'h0):(1'h0)] ?
              reg163 : $signed(wire98)) == ($unsigned(wire165) ?
              wire97 : (~&((~reg168) ?
                  (wire102 <<< wire159) : ((7'h41) ? (8'ha8) : wire104)))));
          reg170 <= wire157[(1'h1):(1'h0)];
          reg171 <= $unsigned(wire104);
        end
      else
        begin
          reg167 <= {wire104,
              $signed($unsigned((|(reg170 ? reg170 : reg168))))};
        end
      reg172 <= wire165[(4'h9):(1'h1)];
      reg173 <= {$unsigned($signed($unsigned(wire159[(3'h4):(1'h1)])))};
      reg174 <= wire101;
      reg175 <= (^(reg168 ?
          (($unsigned(wire99) + wire165) >>> wire159[(3'h4):(1'h0)]) : (~^($unsigned((8'hb7)) ?
              (wire104 ? (8'ha6) : wire102) : reg162[(3'h4):(3'h4)]))));
    end
  assign wire176 = ((8'hb4) != wire159[(2'h2):(1'h0)]);
  assign wire177 = (reg167[(4'h8):(1'h0)] ? (|(+$signed((^(7'h44))))) : wire98);
  assign wire178 = {(((8'ha8) && (wire159[(3'h4):(1'h1)] <<< reg164)) >>> wire166[(2'h3):(2'h3)]),
                       wire96};
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire67;
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire25,
                 wire12,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire67,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire12 = wire11;
  module13 #() modinst26 (wire25, clk, wire10, wire11, wire7, wire12, wire8);
  assign wire27 = ((~^$unsigned(($unsigned((8'hac)) * {wire7}))) <= wire7);
  assign wire28 = (-wire10[(4'he):(4'hc)]);
  assign wire29 = $unsigned(wire11);
  assign wire30 = $signed((wire11 ^~ ({(~|wire7)} ^ (wire8 <<< $unsigned(wire12)))));
  assign wire31 = wire7[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      reg32 <= (&wire31[(1'h1):(1'h0)]);
      reg33 <= wire8;
    end
  assign wire34 = (-(~|$signed($unsigned(wire11))));
  assign wire35 = ({wire9} ?
                      (wire11 >> $signed(wire9)) : (~$signed($unsigned(wire30))));
  assign wire36 = $signed((wire7 ?
                      ($signed(wire27[(3'h5):(1'h0)]) <= (((8'had) ?
                          wire28 : (7'h41)) > wire35[(2'h3):(2'h3)])) : $signed($signed((~|wire8)))));
  assign wire37 = wire28;
  module38 #() modinst68 (.wire39(wire10), .wire40(wire30), .clk(clk), .y(wire67), .wire41(wire27), .wire43(wire11), .wire42(wire36));
  assign wire69 = ($signed($unsigned(wire34[(4'hb):(3'h5)])) >> $signed($unsigned(wire34[(2'h2):(1'h0)])));
  assign wire70 = (!wire12);
  assign wire71 = wire7[(4'h9):(1'h1)];
  assign wire72 = $unsigned(wire29[(3'h6):(2'h3)]);
  assign wire73 = (-(-((+((8'hb0) ? wire31 : wire12)) ?
                      wire37[(4'h8):(2'h3)] : wire67)));
  assign wire74 = (($signed($signed((wire25 > (8'ha9)))) ?
                      $unsigned(((wire8 == (8'hab)) & wire70[(3'h4):(3'h4)])) : $signed(reg32[(4'ha):(1'h1)])) * ($signed($signed((+wire9))) ?
                      $unsigned($signed(wire73[(5'h11):(5'h11)])) : $signed((^~wire9[(3'h6):(3'h5)]))));
endmodule

module module38
#(parameter param65 = (&(((((8'hb8) || (8'hbd)) - ((7'h41) ^ (8'hba))) ? (((7'h43) || (8'hbd)) ~^ (~|(8'hb7))) : (((8'hbe) ? (8'ha3) : (8'ha2)) ? (!(8'hb4)) : ((8'ha4) ? (8'haf) : (8'hbe)))) ? (^{(|(8'ha7)), ((8'hac) ? (8'hb1) : (8'hbb))}) : (^~(((8'ha1) ? (8'ha8) : (8'hb0)) ? ((8'hbe) ? (7'h42) : (8'hb2)) : (8'hab))))), 
parameter param66 = ({(!param65), (&((param65 ? (8'ha7) : param65) * param65))} ? (~&{(|{param65, param65}), param65}) : (~|({(param65 < (7'h42)), ((8'ha8) < param65)} ? (!(!param65)) : ((!param65) < (param65 ? param65 : (7'h42)))))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire40;
  input wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg51,
                 (1'h0)};
  assign wire44 = $signed(wire43[(1'h0):(1'h0)]);
  assign wire45 = wire44;
  assign wire46 = (wire42[(4'he):(3'h4)] ?
                      wire45[(1'h1):(1'h0)] : $signed((({wire45} && $signed(wire41)) ?
                          $signed(wire40) : ($signed((8'hbf)) >>> $unsigned(wire40)))));
  assign wire47 = ((~wire44[(4'ha):(4'h9)]) >= (((|(wire45 * (8'h9d))) != wire42[(3'h7):(2'h3)]) ^~ ($unsigned((~&wire39)) || (wire39[(3'h6):(2'h2)] ?
                      (wire43 || wire45) : (wire45 ? (7'h41) : wire43)))));
  assign wire48 = $signed(((8'h9c) ?
                      $unsigned(wire40) : (wire42 ?
                          {$signed(wire41),
                              $unsigned(wire45)} : {(wire45 ^ wire46)})));
  assign wire49 = ((|$unsigned((-((8'hac) + wire40)))) ?
                      $unsigned(wire44[(2'h3):(2'h3)]) : ((+{$signed(wire44),
                          wire48[(4'hd):(4'h9)]}) < wire45[(2'h3):(2'h3)]));
  assign wire50 = (^(wire43[(3'h7):(2'h2)] ?
                      $unsigned(wire45[(3'h4):(1'h1)]) : $unsigned(wire44)));
  always
    @(posedge clk) begin
      reg51 <= (&$unsigned((wire45 == $unsigned((wire42 ? wire45 : wire46)))));
    end
  assign wire52 = wire44;
  assign wire53 = (|(8'hbb));
  assign wire54 = ((!$signed((&(wire48 ? wire49 : wire50)))) + (~|(8'ha6)));
  assign wire55 = (&wire40);
  assign wire56 = $signed((wire42 ^~ $unsigned((wire54 ?
                      wire50[(4'h8):(1'h1)] : $unsigned(wire50)))));
  assign wire57 = (~&($signed((((8'hb5) ? wire39 : wire46) ?
                      $signed(wire48) : (+wire42))) != $unsigned((wire42[(3'h5):(1'h1)] ?
                      wire41[(4'h9):(3'h4)] : (|(8'ha2))))));
  assign wire58 = (^~$unsigned((((wire57 ? (7'h42) : wire41) ?
                          (~^wire56) : $unsigned(wire47)) ?
                      (~|wire46[(4'hf):(4'hf)]) : (((8'hba) ? wire45 : wire45) ?
                          (wire52 ? wire49 : wire56) : {wire47, wire53}))));
  assign wire59 = $unsigned(((^$signed($signed((8'ha2)))) ?
                      (reg51[(2'h2):(1'h0)] ?
                          $unsigned($signed(wire54)) : ($unsigned(wire41) >>> $unsigned((8'hb6)))) : wire46[(4'h8):(1'h1)]));
  assign wire60 = $signed($signed(wire42));
  assign wire61 = $unsigned($signed((!((wire53 <= wire44) & (wire49 && wire57)))));
  assign wire62 = (~|wire58[(1'h0):(1'h0)]);
  assign wire63 = {$signed((!reg51)),
                      (wire58[(4'h9):(3'h7)] ?
                          $signed($signed((wire39 < wire46))) : (-(~^$signed(wire54))))};
  assign wire64 = ((~^$signed($unsigned((wire39 ^~ wire46)))) ?
                      wire49[(3'h4):(1'h0)] : $signed($unsigned($signed($unsigned(wire52)))));
endmodule

module module13
#(parameter param23 = (!(~(8'ha8))), 
parameter param24 = param23)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire15;
  assign wire20 = $signed(((^(wire14[(3'h5):(1'h1)] ?
                      $unsigned(wire14) : $signed(wire15))) || wire18));
  assign wire21 = wire17[(1'h1):(1'h1)];
  assign wire22 = (!$signed(((&(wire19 >> (8'hb7))) >>> $signed(wire14[(1'h0):(1'h0)]))));
endmodule

module module106
#(parameter param156 = (((((~|(8'ha1)) ? ((8'hbb) ? (8'hb6) : (8'hb1)) : {(8'h9f), (7'h43)}) ^ (^~(~|(8'h9e)))) & ((7'h40) ? (|((8'ha1) ? (8'h9c) : (8'ha4))) : ({(8'hac)} ? ((8'h9e) ~^ (8'ha7)) : {(8'h9e), (8'hbf)}))) ? ({(((8'hb3) < (8'h9e)) >>> {(7'h42), (8'hb6)})} & ((((8'h9c) ? (8'hba) : (8'hb6)) - (^~(8'hb4))) ? (^~((8'ha1) >> (8'hac))) : ((-(8'ha7)) + (~^(8'hb0))))) : (((((8'hb7) ? (8'h9f) : (8'ha6)) != ((8'hb1) ^~ (8'ha4))) ? ((-(8'hb6)) <= ((8'hb8) + (8'hb7))) : (((7'h42) + (8'hae)) >> ((8'h9e) && (8'hb2)))) ? (7'h41) : (-(((8'h9f) || (8'ha5)) <<< (&(8'ha2)))))))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire111;
  input wire signed [(4'hb):(1'h0)] wire110;
  input wire signed [(3'h5):(1'h0)] wire109;
  input wire [(3'h5):(1'h0)] wire108;
  input wire [(4'hb):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire112;
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire112,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
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
                 (1'h0)};
  assign wire112 = $signed($unsigned(wire109));
  always
    @(posedge clk) begin
      reg113 <= $unsigned((wire108[(2'h3):(1'h1)] ?
          (^$signed({wire108})) : wire112));
      if ({(~$signed($signed((wire107 ? wire110 : wire108)))),
          $signed(($unsigned((reg113 || (8'hbd))) & (wire109[(1'h1):(1'h1)] > wire111)))})
        begin
          reg114 <= $signed((8'hb5));
          reg115 <= reg113[(1'h0):(1'h0)];
          reg116 <= $signed(((~|(~(wire107 >= reg114))) ?
              ($signed((&wire109)) ?
                  ((^~reg115) ?
                      $unsigned(reg114) : (wire111 < wire107)) : {wire112,
                      (~|reg114)}) : ($unsigned(wire109[(1'h0):(1'h0)]) ?
                  ((~&(7'h43)) | (reg113 ?
                      wire109 : wire109)) : $unsigned($unsigned(reg114)))));
          reg117 <= ((-(~&($unsigned(reg113) ^~ ((8'ha9) >= wire109)))) - wire112);
          if ($signed($signed({{$signed(wire110)}})))
            begin
              reg118 <= (&($signed(wire107) >= $signed((wire108 ?
                  (~&reg113) : (wire109 ? reg117 : (8'ha4))))));
              reg119 <= ((^~(&(!$unsigned(reg116)))) ?
                  (~(|wire112[(1'h1):(1'h0)])) : (~$unsigned(wire112[(2'h2):(2'h2)])));
              reg120 <= $unsigned($unsigned((~&$unsigned((|wire110)))));
              reg121 <= ($unsigned(reg117) > (~&$unsigned(($unsigned((8'h9e)) ?
                  {(7'h40)} : $signed((8'ha1))))));
              reg122 <= ($unsigned(wire110) - $signed(($unsigned($signed(reg120)) < reg113)));
            end
          else
            begin
              reg118 <= $signed((reg117 ?
                  $unsigned(((reg114 ? reg119 : reg116) ?
                      ((8'hb8) >= reg120) : $unsigned((8'ha5)))) : reg122));
              reg119 <= $unsigned({wire112[(2'h2):(1'h0)], {wire109, (8'ha2)}});
            end
        end
      else
        begin
          if ($unsigned((8'haf)))
            begin
              reg114 <= $signed({wire110});
              reg115 <= (~&((+(!$unsigned(reg118))) ?
                  $unsigned(wire110) : {{(~^reg114)}}));
              reg116 <= $signed({$unsigned($unsigned($signed(reg114)))});
            end
          else
            begin
              reg114 <= reg117;
            end
        end
      if (reg116)
        begin
          reg123 <= reg114[(1'h0):(1'h0)];
          reg124 <= $signed({(((8'hb1) << (+reg119)) ?
                  (reg123[(2'h2):(1'h1)] >= reg118[(4'ha):(3'h5)]) : {(reg121 != reg121)})});
          reg125 <= (&(8'hae));
          if ($signed(reg116[(4'hd):(1'h1)]))
            begin
              reg126 <= $signed(wire111);
              reg127 <= reg117;
              reg128 <= (^~$signed(reg119));
              reg129 <= wire107;
              reg130 <= reg114[(3'h6):(3'h4)];
            end
          else
            begin
              reg126 <= (~$unsigned(reg114));
              reg127 <= wire107[(2'h2):(2'h2)];
              reg128 <= wire107[(1'h0):(1'h0)];
            end
          reg131 <= $signed((~(~&(wire109[(2'h2):(1'h0)] > (reg120 >>> wire111)))));
        end
      else
        begin
          reg123 <= reg125[(1'h1):(1'h1)];
          reg124 <= $unsigned((&(!$unsigned((reg128 ? wire107 : wire110)))));
          reg125 <= (reg123 ?
              {$unsigned($signed((reg127 ? wire107 : wire107))),
                  (~$unsigned((reg119 ?
                      wire107 : reg113)))} : $unsigned({(&(~(8'hab))),
                  (&(reg116 ~^ reg115))}));
        end
      reg132 <= ($signed($signed(((reg131 * reg125) || (wire111 ^ reg118)))) | $unsigned(wire112[(1'h0):(1'h0)]));
    end
  assign wire133 = (-{(7'h43)});
  assign wire134 = $signed({reg121, (~reg126[(3'h7):(3'h7)])});
  assign wire135 = ((wire107 < $signed(reg116)) != reg126[(4'hd):(4'hd)]);
  assign wire136 = ($signed(wire133[(4'hf):(3'h6)]) == (-reg120));
  assign wire137 = (!reg116[(4'hb):(4'h8)]);
  always
    @(posedge clk) begin
      reg138 <= (8'hb1);
      reg139 <= reg118[(2'h2):(1'h0)];
      reg140 <= {wire109[(2'h2):(1'h1)]};
      if (reg130[(4'h9):(2'h3)])
        begin
          reg141 <= {$signed(reg120), (~|(^$signed(reg139[(3'h7):(3'h5)])))};
          if (reg141)
            begin
              reg142 <= (+$unsigned($signed(({(7'h41),
                  wire137} >>> (wire134 && reg115)))));
            end
          else
            begin
              reg142 <= (&(&((wire111[(4'h9):(2'h3)] | reg130) >> ((reg125 ^~ (8'hb8)) ^ (reg120 ?
                  reg128 : wire109)))));
              reg143 <= reg141;
            end
          reg144 <= $unsigned(($unsigned((((8'ha2) >>> wire136) ?
              (-reg123) : {reg126, wire107})) - (~|(-wire112))));
        end
      else
        begin
          reg141 <= reg125[(1'h1):(1'h0)];
          if (wire107[(3'h4):(1'h0)])
            begin
              reg142 <= (!$signed((reg140[(2'h2):(2'h2)] >> (+$signed(reg127)))));
              reg143 <= $unsigned($signed((((8'hb9) >> $signed((8'hac))) ?
                  $signed(((8'haf) ? reg125 : (7'h41))) : (~&(~^wire136)))));
              reg144 <= reg144[(2'h2):(1'h0)];
              reg145 <= reg139[(2'h3):(2'h2)];
              reg146 <= (8'ha8);
            end
          else
            begin
              reg142 <= (((^~$unsigned((reg113 | reg145))) ?
                      wire134 : (8'hb2)) ?
                  (reg122[(1'h1):(1'h0)] ?
                      $unsigned(((wire133 << wire136) << {reg131})) : reg124[(4'hc):(4'ha)]) : ((reg115[(1'h0):(1'h0)] && reg144) ?
                      wire134 : $signed((^~reg145[(4'h8):(1'h1)]))));
              reg143 <= (($signed($unsigned((8'h9c))) ?
                      {($unsigned(reg117) < $unsigned((8'hb0))),
                          reg125[(1'h0):(1'h0)]} : (({reg115} && $unsigned(reg146)) - ($signed(reg126) ?
                          $signed(reg114) : $signed(wire135)))) ?
                  $unsigned($signed(($signed(wire136) >> reg115))) : $signed(reg126));
            end
          reg147 <= $unsigned(($unsigned((((8'hbd) > reg142) ?
              (!(8'ha4)) : reg121)) | (~((reg143 ? reg118 : reg113) ?
              $signed(reg123) : reg144[(1'h1):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      reg148 <= $signed(reg139);
      reg149 <= reg142;
      reg150 <= ($signed((reg148 + $unsigned(reg141[(3'h4):(2'h3)]))) < (^reg148[(3'h4):(3'h4)]));
      reg151 <= ($signed(reg115[(1'h0):(1'h0)]) ?
          wire110 : (|$unsigned($unsigned(wire134))));
      reg152 <= {$unsigned($unsigned((8'hbc)))};
    end
  assign wire153 = $unsigned({(|reg142), {reg118}});
  assign wire154 = (reg114[(2'h2):(2'h2)] << (&wire112));
  assign wire155 = reg116[(1'h1):(1'h1)];
endmodule
