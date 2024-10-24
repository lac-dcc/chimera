module top
#(parameter param106 = (&{(((^~(8'haa)) - (^~(8'ha7))) ? {(-(8'had)), ((8'hae) ? (8'had) : (7'h43))} : ((8'ha9) ? ((8'ha2) ? (8'had) : (8'h9d)) : ((8'hb6) ? (8'ha0) : (8'hae))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire97;
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire37,
                 wire5,
                 wire4,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire97,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire4 = $signed({((wire0 & (^wire3)) ? (8'h9f) : wire2),
                     wire2[(4'he):(3'h5)]});
  assign wire5 = $signed((wire2 ?
                     (wire2 ?
                         ((8'ha7) != (^wire1)) : {(wire1 ? wire3 : wire4),
                             {wire2, wire4}}) : $unsigned((&(~|wire3)))));
  module6 #() modinst38 (wire37, clk, wire2, wire1, wire4, wire5, wire3);
  assign wire39 = wire2[(2'h3):(2'h2)];
  assign wire40 = {wire1[(3'h7):(3'h7)],
                      $unsigned(((wire39 ?
                          (wire1 && wire37) : $unsigned(wire39)) && wire39[(5'h14):(4'hd)]))};
  assign wire41 = wire37;
  assign wire42 = ($signed((^wire5[(4'he):(3'h4)])) ~^ $signed($signed($unsigned(wire4))));
  assign wire43 = wire3;
  assign wire44 = (wire39 < $unsigned((wire42[(4'h9):(4'h8)] ?
                      $signed($signed((8'h9e))) : ((wire2 * wire39) ?
                          (wire4 ^~ (8'hb8)) : (wire3 && wire39)))));
  module45 #() modinst98 (.wire48(wire40), .wire47(wire44), .clk(clk), .wire49(wire1), .wire46(wire39), .wire50(wire41), .y(wire97));
  assign wire99 = (^wire3[(3'h5):(2'h2)]);
  assign wire100 = wire41[(4'h8):(3'h5)];
  assign wire101 = ($unsigned((8'h9c)) ~^ ({(^~(wire3 ?
                           wire97 : wire37))} ~^ $unsigned(((~&wire3) ?
                       $signed(wire3) : wire3[(3'h4):(2'h2)]))));
  assign wire102 = (wire4 ?
                       $signed({$unsigned(wire44)}) : (!(wire0 ?
                           wire0[(4'hf):(4'hb)] : (wire1[(2'h3):(1'h0)] & (wire42 ?
                               wire99 : wire1)))));
  always
    @(posedge clk) begin
      reg103 <= (($signed({$unsigned(wire41)}) ^ (($unsigned(wire100) ?
              wire2 : (^~wire102)) ?
          $unsigned(wire41[(1'h0):(1'h0)]) : {wire101})) > {wire1,
          $signed({(wire39 < wire3)})});
      reg104 <= ((!(+(wire101[(3'h6):(1'h1)] ?
          (wire41 ?
              wire39 : wire43) : $signed(wire4)))) - (wire40[(1'h0):(1'h0)] ?
          $signed({$unsigned(wire37)}) : (wire0 ?
              $signed({wire102, wire4}) : wire43)));
      reg105 <= (wire43[(3'h5):(1'h0)] <= ($signed(wire101[(1'h1):(1'h1)]) < {{wire43[(3'h6):(2'h2)],
              (wire3 << wire44)}}));
    end
endmodule

module module45
#(parameter param95 = {(((((7'h42) | (8'ha9)) + (~(7'h44))) - (((8'h9c) ? (7'h40) : (8'ha5)) ~^ (8'ha2))) ? ((~^((7'h40) ? (8'ha1) : (8'hb3))) > (~|((8'ha8) ? (8'h9c) : (8'hb1)))) : ({{(8'hb7)}} ? (^~((7'h43) | (8'hae))) : (((8'ha8) ? (8'ha1) : (8'hbb)) == (+(8'ha4)))))}, 
parameter param96 = (param95 ? {((8'hb6) ? (!{param95}) : param95), ((~|(param95 ? (8'haf) : param95)) ? (((7'h43) && (8'h9d)) ? (|param95) : (param95 << param95)) : (((8'hae) ? param95 : param95) ? (^~(8'ha2)) : ((8'hb1) ? (8'ha3) : param95)))} : ((^~(((8'hae) ? param95 : param95) ^ (8'h9c))) ? (((param95 ? (8'haf) : param95) ? (^~param95) : (8'hb5)) | (|(~&(8'hbd)))) : param95)))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire [(5'h12):(1'h0)] wire48;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg55,
                 (1'h0)};
  assign wire51 = ((+$signed({{wire48}, $signed(wire47)})) ?
                      wire47[(4'hc):(1'h1)] : wire46[(2'h2):(1'h1)]);
  assign wire52 = $unsigned($unsigned({wire49,
                      ($unsigned(wire46) ?
                          (wire51 ? wire47 : wire51) : $unsigned(wire49))}));
  assign wire53 = ((wire50 ?
                          $unsigned(wire51[(4'hb):(3'h7)]) : $unsigned(({wire50} ^~ wire47[(4'hc):(4'h9)]))) ?
                      (!(&(-wire46))) : (&wire52));
  assign wire54 = wire52[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg55 <= $unsigned(((+(wire48 ^ (wire50 ? wire49 : wire48))) ?
          $unsigned(wire54[(2'h3):(1'h1)]) : ($signed($signed(wire46)) ?
              ((wire47 ? wire51 : wire46) >= $unsigned(wire47)) : (wire50 ?
                  {wire48} : (^wire47)))));
    end
  module56 #() modinst81 (.wire60(wire54), .wire58(wire49), .clk(clk), .y(wire80), .wire59(wire47), .wire57(wire48));
  assign wire82 = $signed(wire47[(3'h5):(2'h3)]);
  assign wire83 = ($signed({wire46[(1'h1):(1'h0)],
                      ((!wire82) ?
                          (+wire49) : (reg55 <= wire54))}) <= ($signed(wire53[(3'h6):(2'h3)]) ?
                      wire50 : $unsigned(wire48[(4'hf):(4'h8)])));
  assign wire84 = $unsigned($unsigned((~|wire83)));
  always
    @(posedge clk) begin
      if ($signed(wire83[(4'ha):(3'h7)]))
        begin
          if (wire51)
            begin
              reg85 <= $signed({$signed(($signed(wire48) ?
                      (wire48 >= wire53) : (reg55 >= wire51)))});
              reg86 <= $signed(wire51[(2'h2):(1'h0)]);
            end
          else
            begin
              reg85 <= $signed((|(!wire48[(2'h2):(1'h0)])));
            end
          reg87 <= $signed((&wire46[(2'h3):(2'h3)]));
        end
      else
        begin
          reg85 <= (($unsigned($signed((8'had))) > wire50) ?
              reg55[(1'h1):(1'h0)] : (~^(!$unsigned(wire51[(4'h8):(2'h3)]))));
          reg86 <= wire82[(5'h11):(4'h8)];
          reg87 <= wire84;
          reg88 <= $signed(wire46[(1'h1):(1'h0)]);
          reg89 <= $signed((8'h9c));
        end
      reg90 <= ($unsigned($unsigned($signed({reg55, reg86}))) ^ wire83);
      reg91 <= (8'h9c);
      reg92 <= wire54;
    end
  assign wire93 = ((({(~reg89)} ?
                          wire50[(2'h2):(1'h1)] : ($unsigned(reg86) ?
                              wire52 : wire82)) << wire80) ?
                      wire46 : ($signed({wire52[(5'h10):(1'h0)],
                          (wire50 ? wire50 : reg89)}) & ({wire48,
                              $unsigned((8'hbb))} ?
                          (+((8'hbb) + wire54)) : ((+reg86) ^ $unsigned(reg91)))));
  assign wire94 = $unsigned((wire50 ?
                      ($signed(wire52) - ($signed(reg91) ?
                          wire93[(3'h5):(1'h1)] : wire54[(3'h5):(3'h4)])) : (wire93 ?
                          (8'h9d) : (!$unsigned(reg92)))));
endmodule

module module6
#(parameter param35 = (8'hb8), 
parameter param36 = param35)
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire29;
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire12,
                 wire13,
                 wire16,
                 wire29,
                 reg32,
                 reg31,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire12 = ($signed(((wire10 == wire9[(2'h2):(1'h0)]) + (wire9[(3'h5):(2'h3)] <= (wire8 >> wire8)))) & ((^(~^$unsigned(wire11))) ?
                      wire9 : (((wire9 ?
                          wire7 : wire11) && $unsigned(wire11)) ^ (wire10[(5'h13):(3'h7)] - wire9[(3'h5):(1'h1)]))));
  assign wire13 = {{$signed({(wire9 * wire11), (8'ha0)})}};
  always
    @(posedge clk) begin
      reg14 <= wire10[(5'h10):(3'h4)];
      reg15 <= ((~&($unsigned(wire12) ?
              ($unsigned(wire8) ? reg14 : (wire12 > reg14)) : wire10)) ?
          (~|wire8) : $signed({{(|wire13)},
              ((!wire9) < (reg14 ? wire11 : wire12))}));
    end
  assign wire16 = wire13;
  module17 #() modinst30 (wire29, clk, reg14, reg15, wire9, wire13, wire11);
  always
    @(posedge clk) begin
      reg31 <= (reg14[(4'h8):(1'h1)] || $signed((({wire11} ?
          (wire12 ?
              wire29 : wire8) : wire7[(1'h1):(1'h1)]) >= wire7[(1'h1):(1'h1)])));
      reg32 <= $signed(((+wire7) ?
          ({$unsigned(wire13)} ?
              (~wire16[(1'h0):(1'h0)]) : ($signed(reg14) ?
                  (|reg31) : wire7)) : $signed((~((8'h9c) <= reg31)))));
    end
  assign wire33 = (^wire29[(4'he):(3'h4)]);
  assign wire34 = (|$signed({wire10}));
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  assign y = {wire28, wire24, wire23, reg27, reg26, reg25, (1'h0)};
  assign wire23 = {(wire18[(2'h2):(2'h2)] - wire21)};
  assign wire24 = $unsigned(wire18);
  always
    @(posedge clk) begin
      if (wire20)
        begin
          reg25 <= ($signed({$signed((&(8'haa)))}) * ((~(!(^(8'hb4)))) ?
              $signed((~&$signed((8'had)))) : ({$signed(wire21)} ?
                  $unsigned((wire23 >= wire19)) : ($signed(wire22) & (~|wire19)))));
          reg26 <= wire18[(1'h0):(1'h0)];
          reg27 <= (|((!(reg26[(1'h1):(1'h0)] * (reg25 ? reg26 : reg26))) ?
              (($signed((8'hb8)) ? $signed((8'hb6)) : (wire21 - wire24)) ?
                  ((wire20 << wire20) != (~^wire19)) : wire22[(3'h6):(1'h0)]) : {({reg25} ?
                      $signed(reg25) : (wire23 ? (7'h43) : wire19))}));
        end
      else
        begin
          reg25 <= $signed((((~|wire20[(5'h13):(4'he)]) <= wire21[(4'h9):(2'h2)]) ?
              (wire19 ?
                  ((reg25 == reg27) ?
                      ((8'ha7) ?
                          wire20 : wire21) : $unsigned(wire21)) : ($unsigned(wire18) ?
                      (wire20 ?
                          reg26 : wire18) : (wire23 <= wire22))) : wire21));
        end
    end
  assign wire28 = {$signed($signed(wire19))};
endmodule

module module56
#(parameter param79 = {{((|(~^(8'hbc))) < (((8'hb9) == (8'ha3)) || ((8'h9f) ? (8'ha9) : (8'hb7)))), (&(((8'hb0) ? (8'hb3) : (8'hbb)) ? {(8'ha3), (8'hac)} : ((8'hbf) != (8'hac))))}})
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire60;
  input wire [(5'h11):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
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
                 (1'h0)};
  assign wire61 = $unsigned((~&{((!wire59) < $unsigned(wire59)),
                      $signed($unsigned(wire59))}));
  assign wire62 = $signed(((&((wire58 ? wire61 : (8'hb4)) ?
                      (wire59 ?
                          (8'hb5) : wire57) : (wire60 ^~ wire59))) <= $signed(wire61[(3'h4):(1'h0)])));
  assign wire63 = wire61[(2'h3):(2'h2)];
  assign wire64 = (!(~&wire63[(2'h2):(1'h1)]));
  assign wire65 = (($signed(wire57) >> (8'h9d)) <= $signed($unsigned($unsigned((wire61 ?
                      wire59 : wire62)))));
  assign wire66 = $signed(wire63[(2'h2):(1'h0)]);
  assign wire67 = wire66;
  assign wire68 = wire63;
  assign wire69 = wire60;
  assign wire70 = wire67;
  assign wire71 = (8'hb0);
  assign wire72 = {(|({$signed(wire60)} ? wire62[(3'h5):(1'h1)] : wire59))};
  assign wire73 = (wire63[(2'h2):(1'h1)] - $unsigned((wire59 ?
                      $unsigned((wire57 ^ wire67)) : ((wire59 ?
                              wire60 : wire72) ?
                          wire67[(2'h2):(2'h2)] : (wire70 ?
                              wire71 : wire57)))));
  assign wire74 = $unsigned($unsigned($unsigned(wire73[(3'h4):(3'h4)])));
  assign wire75 = ({(|wire66), $unsigned(wire57)} ?
                      wire73[(1'h0):(1'h0)] : ($signed(wire73[(1'h1):(1'h1)]) ?
                          ((!wire73[(3'h5):(3'h4)]) ?
                              ((~&wire67) > $signed(wire64)) : (&$unsigned(wire57))) : {$unsigned($unsigned(wire71))}));
  assign wire76 = ((wire59[(3'h7):(1'h0)] >> (8'h9d)) != (|$unsigned(({wire73} ?
                      (&wire73) : $signed((8'hba))))));
  assign wire77 = wire62[(1'h1):(1'h1)];
  assign wire78 = $signed($unsigned($signed(wire75[(4'ha):(3'h4)])));
endmodule
