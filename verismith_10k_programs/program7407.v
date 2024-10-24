module top
#(parameter param120 = ({(((!(8'h9f)) == ((7'h44) ? (8'hbf) : (8'hb7))) && (~^{(7'h42)}))} ^ ({((~^(8'ha6)) >>> {(8'haf), (7'h43)})} ? ({(~^(8'ha0)), ((8'h9e) ? (8'ha1) : (8'hb0))} <= (&((8'hbb) >>> (7'h41)))) : ((+((8'hb8) * (8'hb4))) ? (((8'h9e) >>> (8'h9e)) ? (&(7'h43)) : (~|(8'ha8))) : (~&((8'ha1) ? (8'ha6) : (8'hb5)))))), 
parameter param121 = ((8'hae) ? (-(^(&(param120 ^~ param120)))) : ((^~(&param120)) ? param120 : {(~|(param120 ? param120 : (8'hb7))), param120})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  assign y = {wire119, wire116, wire6, wire5, reg118, (1'h0)};
  assign wire5 = $unsigned($signed(wire1[(4'h9):(3'h4)]));
  assign wire6 = (~&$unsigned(($unsigned((&wire4)) ?
                     $unsigned(wire4[(3'h5):(2'h3)]) : wire4)));
  module7 #() modinst117 (.wire10(wire3), .wire9(wire2), .clk(clk), .wire11(wire5), .wire8(wire4), .y(wire116));
  always
    @(posedge clk) begin
      reg118 <= (8'hbd);
    end
  assign wire119 = wire116;
endmodule

module module7
#(parameter param114 = ({{(((8'ha8) ~^ (8'ha0)) * {(8'h9e), (8'hb6)}), (~^{(8'hb8)})}, (+(((8'hba) ? (7'h40) : (7'h42)) ? {(8'ha7)} : (^(8'hb4))))} ? (((((8'hb0) ? (8'h9d) : (8'hb0)) ? ((7'h43) ? (8'hb7) : (7'h43)) : (+(8'h9c))) ? (8'hb4) : ((^(8'hb6)) ? ((8'h9d) <<< (8'haa)) : ((8'ha4) >>> (8'h9e)))) + {(((8'hab) >= (8'haa)) ? ((8'hba) ? (8'ha3) : (8'hb2)) : ((8'hbd) ? (8'hbe) : (8'hbe))), (~|((7'h40) * (8'hb6)))}) : (&(^~(((8'hba) * (8'ha2)) ^~ (+(8'hb0)))))), 
parameter param115 = param114)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire29;
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire33,
                 wire32,
                 wire31,
                 wire12,
                 wire13,
                 wire14,
                 wire29,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire12 = (wire11[(1'h0):(1'h0)] ?
                      (((8'hb3) == wire8[(3'h4):(1'h0)]) < {wire9[(2'h2):(1'h0)],
                          (&{wire9})}) : (~|wire8[(4'hb):(4'h9)]));
  assign wire13 = wire10;
  assign wire14 = ($unsigned($unsigned((8'hb7))) ?
                      $signed($unsigned((&wire10))) : (&wire9[(3'h6):(1'h0)]));
  module15 #() modinst30 (.wire20(wire11), .wire18(wire12), .wire16(wire10), .wire19(wire8), .y(wire29), .wire17(wire9), .clk(clk));
  assign wire31 = ((wire12[(1'h0):(1'h0)] << (8'hb8)) ~^ ((($signed(wire12) ?
                          (^~wire11) : (wire14 - wire9)) ?
                      ($signed(wire10) ?
                          (~|wire10) : {wire13,
                              wire10}) : wire14[(1'h1):(1'h0)]) && ($signed($unsigned(wire8)) + $unsigned(wire8))));
  assign wire32 = ($unsigned(($signed({(8'hbf), wire8}) ?
                          (wire12[(4'h9):(1'h1)] ?
                              {wire8,
                                  wire12} : (wire9 ^~ wire10)) : (~(^wire8)))) ?
                      $signed(wire14[(2'h2):(2'h2)]) : ((wire29[(3'h6):(1'h1)] ^~ (wire29[(3'h7):(1'h1)] || wire31)) <<< wire8[(4'hd):(4'hb)]));
  assign wire33 = (wire9[(3'h6):(2'h2)] >>> wire32[(3'h4):(1'h0)]);
  module34 #() modinst77 (wire76, clk, wire29, wire10, wire8, wire13);
  assign wire78 = $unsigned(wire14);
  assign wire79 = $signed(wire33[(1'h1):(1'h0)]);
  assign wire80 = $unsigned(($signed(wire29) ? $signed(wire9) : (8'hb5)));
  assign wire81 = {$signed((&$signed(wire80[(4'ha):(2'h2)])))};
  assign wire82 = $unsigned(wire76);
  assign wire83 = {(8'ha8)};
  assign wire84 = {({wire10, $unsigned(wire14)} ?
                          {(~&{wire78, wire29})} : $unsigned($unsigned({wire79,
                              wire11})))};
  assign wire85 = (wire76[(1'h0):(1'h0)] ?
                      ((^~{{wire31}}) >>> wire31[(4'h9):(2'h3)]) : {((!$unsigned(wire84)) == $unsigned((~wire33))),
                          (($unsigned(wire10) + (~^(8'h9c))) | ((wire83 >= wire10) ^ {wire32,
                              wire8}))});
  always
    @(posedge clk) begin
      if ($signed($unsigned((|$unsigned($signed((8'ha6)))))))
        begin
          reg86 <= ({{(8'hb3), $unsigned($unsigned(wire78))},
                  wire83[(4'ha):(4'ha)]} ?
              $unsigned(((((8'h9c) ? (8'hbb) : wire11) != (wire82 ?
                      (8'hb2) : wire78)) ?
                  wire78[(1'h1):(1'h0)] : wire80)) : {(wire83 == ((7'h42) ?
                      $signed(wire84) : ((8'h9f) ? wire32 : wire32)))});
          reg87 <= (+wire76);
          reg88 <= ((8'ha5) == $signed((8'hb9)));
          reg89 <= wire33[(1'h1):(1'h1)];
        end
      else
        begin
          reg86 <= wire31;
          if ((-$unsigned({$signed(wire79)})))
            begin
              reg87 <= reg86;
              reg88 <= $unsigned(wire12[(2'h2):(2'h2)]);
            end
          else
            begin
              reg87 <= $unsigned(wire8[(4'hf):(1'h0)]);
              reg88 <= $signed((~&$unsigned(wire12)));
              reg89 <= wire10;
              reg90 <= wire76[(1'h1):(1'h1)];
            end
          reg91 <= $unsigned((~(wire32[(2'h2):(2'h2)] <= $unsigned($signed(wire33)))));
          if (wire79[(2'h2):(2'h2)])
            begin
              reg92 <= wire32[(2'h2):(2'h2)];
            end
          else
            begin
              reg92 <= (reg90 ~^ $signed(reg87[(3'h6):(2'h3)]));
            end
          if (reg90)
            begin
              reg93 <= $signed((wire9 * (wire80[(4'h8):(1'h1)] ?
                  (&(wire82 ?
                      wire84 : wire12)) : (((8'h9f) != reg88) << {wire8}))));
              reg94 <= $signed($signed({(reg89 + reg89[(1'h1):(1'h0)]),
                  $unsigned((reg86 + wire81))}));
            end
          else
            begin
              reg93 <= (+$signed((~^reg90[(1'h0):(1'h0)])));
            end
        end
      if (((&wire85[(1'h1):(1'h1)]) ? $signed(reg92) : wire11[(2'h3):(2'h3)]))
        begin
          if (($signed((&(+reg92))) ?
              $signed((((~wire9) ? (!wire14) : reg92) ?
                  $signed((wire80 ?
                      wire76 : (8'hbc))) : $unsigned($signed(wire33)))) : (^(~^$unsigned(wire8)))))
            begin
              reg95 <= wire9;
              reg96 <= wire78[(3'h5):(2'h3)];
              reg97 <= reg92;
            end
          else
            begin
              reg95 <= $unsigned((+(+wire31)));
            end
          reg98 <= wire84[(4'ha):(1'h0)];
        end
      else
        begin
          if (wire85)
            begin
              reg95 <= (reg91 ?
                  (^($unsigned(wire82) ?
                      (wire31 ?
                          $signed((8'ha8)) : $signed(wire11)) : (8'ha1))) : ($unsigned(reg97[(1'h1):(1'h0)]) ?
                      {(|$signed(reg93))} : $signed({$unsigned((8'had))})));
              reg96 <= reg96[(2'h3):(1'h0)];
              reg97 <= $signed($signed((~&$unsigned(wire83[(4'h9):(4'h8)]))));
              reg98 <= reg97[(1'h1):(1'h0)];
              reg99 <= {($signed(((reg93 ~^ (8'h9d)) ?
                      {wire8} : reg93[(1'h0):(1'h0)])) || ({((8'hb2) ?
                              reg92 : reg90),
                          ((8'hb7) & wire82)} ?
                      {(reg96 ? wire11 : reg97)} : wire32[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg95 <= $signed($signed((~&(&((8'h9e) ^~ wire85)))));
            end
          reg100 <= wire8[(3'h6):(3'h6)];
          reg101 <= reg99[(2'h3):(1'h1)];
          if ((&((~|(~(reg96 << (8'ha5)))) >> reg94[(4'hc):(2'h2)])))
            begin
              reg102 <= (!$unsigned(wire12));
              reg103 <= $unsigned(((reg91 * wire32) <= reg93));
              reg104 <= reg99;
              reg105 <= reg94;
              reg106 <= ($unsigned(reg95[(3'h4):(2'h2)]) ?
                  reg96 : (wire78 ?
                      $signed(({(8'h9c)} ?
                          wire12 : (^~wire84))) : ($unsigned($signed(wire81)) ^ reg105[(3'h4):(3'h4)])));
            end
          else
            begin
              reg102 <= {($signed($unsigned(wire31[(2'h3):(1'h0)])) < (~&$unsigned((reg91 ^ reg93)))),
                  wire78[(3'h6):(3'h6)]};
              reg103 <= ((^wire8[(4'hb):(2'h3)]) ?
                  $unsigned({(8'hab),
                      ((wire32 == reg106) >= reg93)}) : ($signed(reg93) - $unsigned($signed(reg98[(5'h10):(1'h1)]))));
            end
          reg107 <= (reg93[(2'h2):(1'h1)] >>> $unsigned(($signed($signed(reg87)) ?
              ({(8'h9f), wire85} && $signed(reg96)) : (~^{(8'h9e)}))));
        end
      if ((({((!(7'h40)) && $unsigned((8'h9f)))} >= (reg102 + (((8'hbb) != wire10) >>> $signed(reg96)))) && wire32[(2'h2):(1'h1)]))
        begin
          reg108 <= $signed($unsigned((~&$unsigned($unsigned(wire12)))));
          reg109 <= ($unsigned(($unsigned((reg95 ^~ wire29)) ?
              {(|reg100),
                  reg89[(4'hc):(1'h1)]} : $unsigned((reg90 + wire78)))) < $signed(({$unsigned(wire13)} ^~ (~$signed(reg89)))));
        end
      else
        begin
          if (wire83[(3'h4):(1'h1)])
            begin
              reg108 <= wire8[(4'hc):(4'h9)];
              reg109 <= $signed(reg101[(4'he):(1'h0)]);
            end
          else
            begin
              reg108 <= wire32;
            end
        end
    end
  assign wire110 = $signed(((!wire8) ? $unsigned(wire78) : (-reg100)));
  assign wire111 = $unsigned(reg101);
  assign wire112 = (~^$signed($unsigned({(-reg86)})));
  assign wire113 = wire81;
endmodule

module module34
#(parameter param74 = ((~((((8'hbb) ? (8'hb7) : (7'h42)) ~^ {(8'hb4)}) ? (((7'h40) ? (8'hb3) : (8'haa)) >> ((8'hb6) <<< (8'hbf))) : (((8'ha7) ? (8'ha7) : (8'hbe)) ? {(8'haf)} : (&(8'hbb))))) && ((^{((8'ha5) >> (8'hb4)), (|(8'h9f))}) ? {(|{(7'h43), (7'h43)})} : {(~^((8'haa) || (8'hb8)))})), 
parameter param75 = ((|(param74 ^ param74)) + {param74, ((|(param74 & param74)) ? ((7'h43) ? (param74 ? param74 : param74) : (param74 ? param74 : param74)) : (&(^param74)))}))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire41,
                 wire40,
                 wire39,
                 reg73,
                 reg67,
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
                 (1'h0)};
  assign wire39 = $unsigned((wire38[(2'h2):(2'h2)] | $signed(wire35[(3'h7):(3'h4)])));
  assign wire40 = $unsigned(wire36[(3'h5):(3'h5)]);
  assign wire41 = wire40;
  always
    @(posedge clk) begin
      reg42 <= $signed($signed($unsigned(($signed(wire39) ?
          (wire41 ? wire38 : (8'haf)) : $unsigned(wire35)))));
      if ((!$signed(wire36[(4'h9):(4'h8)])))
        begin
          reg43 <= (wire36 ? wire38 : (wire40[(4'h8):(3'h7)] ~^ reg42));
        end
      else
        begin
          reg43 <= ((^(~&wire37[(2'h3):(2'h3)])) + (^~(|($signed(wire37) >> wire35))));
          reg44 <= $signed((8'h9c));
        end
      if ($signed($signed((+$signed({wire36})))))
        begin
          if ({(wire41[(4'hc):(2'h3)] ? $signed($signed((^wire38))) : wire39),
              wire37[(4'ha):(3'h4)]})
            begin
              reg45 <= ((&(~(reg44[(4'h9):(4'h9)] ?
                  wire35[(1'h1):(1'h1)] : (^~wire41)))) | wire39[(3'h6):(3'h5)]);
              reg46 <= {((+(8'ha9)) ?
                      ((+reg45[(4'hd):(1'h1)]) ?
                          wire36 : reg43[(3'h4):(2'h2)]) : ((reg44 ?
                              wire38 : reg44) ?
                          (~(reg43 > (8'ha6))) : $signed((reg45 ?
                              wire36 : reg43)))),
                  {{$unsigned(wire36[(1'h1):(1'h0)]),
                          $unsigned(wire35[(3'h4):(3'h4)])}}};
            end
          else
            begin
              reg45 <= (|reg46);
              reg46 <= $signed(wire36);
              reg47 <= wire35;
            end
          reg48 <= wire38[(4'hd):(2'h3)];
        end
      else
        begin
          reg45 <= $unsigned((wire41 >>> ((7'h42) ?
              reg42[(4'ha):(1'h1)] : $signed($signed(reg45)))));
          reg46 <= (&(&wire36));
          if (wire37)
            begin
              reg47 <= wire36;
            end
          else
            begin
              reg47 <= wire41;
            end
          reg48 <= (8'ha1);
        end
      reg49 <= (wire38[(3'h4):(2'h2)] ^ $unsigned((!$unsigned((^wire37)))));
      if (reg43[(4'ha):(1'h1)])
        begin
          reg50 <= {$signed((8'hb4))};
          reg51 <= {((wire38 != wire36[(5'h11):(4'he)]) >>> $signed($signed(wire39[(3'h4):(1'h0)])))};
          reg52 <= (!reg48);
          reg53 <= {$unsigned(reg48)};
          reg54 <= ($unsigned((((wire41 >> wire38) ?
                  wire38[(4'h8):(3'h6)] : (8'haa)) ?
              wire41[(2'h3):(1'h0)] : ($signed(wire35) * (-wire36)))) > (wire36[(3'h6):(3'h6)] ?
              $signed($unsigned($signed(reg53))) : $signed(reg46[(4'hc):(1'h1)])));
        end
      else
        begin
          reg50 <= (-wire39);
          reg51 <= (~&reg44);
          reg52 <= (^~$unsigned($signed($signed($unsigned(reg47)))));
          if ((!reg50[(4'h9):(1'h1)]))
            begin
              reg53 <= reg48;
              reg54 <= reg49[(4'h9):(1'h1)];
              reg55 <= (~|wire36);
            end
          else
            begin
              reg53 <= {($signed((wire39[(2'h2):(2'h2)] ?
                      $signed(reg51) : $signed(reg43))) | ($unsigned($signed(reg50)) ?
                      $unsigned((reg46 ?
                          wire37 : wire37)) : $signed(((7'h42) & (8'hb1))))),
                  ((^((reg48 ^~ wire37) ?
                      $unsigned(wire40) : wire35[(1'h0):(1'h0)])) | (~($signed(wire36) * {reg52})))};
              reg54 <= {(+(8'h9d)), (-{wire38})};
              reg55 <= (($signed(wire38[(4'hc):(4'h9)]) ?
                  $unsigned(reg50) : $unsigned((&$unsigned(reg51)))) <= (($signed($unsigned(wire39)) ^~ wire41[(4'ha):(4'h9)]) ?
                  reg52[(4'h8):(1'h1)] : ((reg53 != (reg45 ? wire37 : wire41)) ?
                      $signed(((8'ha6) != wire35)) : ((wire38 ?
                          reg52 : wire35) >>> (~(7'h44))))));
              reg56 <= {reg43};
            end
        end
    end
  always
    @(posedge clk) begin
      reg57 <= ((~|{(~^(reg56 ? reg51 : reg54)),
              ((reg55 + reg45) << (reg48 & reg53))}) ?
          ((($unsigned((7'h43)) != reg43) ?
                  ((~&reg44) > (wire35 ?
                      reg47 : (8'ha7))) : ({reg52} || {wire36})) ?
              (reg52[(3'h7):(3'h6)] || $signed((reg56 + wire41))) : $signed(reg50)) : $unsigned({reg42,
              ($signed(wire36) ? (reg45 ? reg49 : reg48) : $signed(reg55))}));
    end
  always
    @(posedge clk) begin
      reg58 <= reg55[(1'h0):(1'h0)];
    end
  assign wire59 = reg49;
  assign wire60 = (&reg45[(3'h6):(3'h5)]);
  assign wire61 = $unsigned(reg47[(3'h7):(2'h2)]);
  assign wire62 = ($unsigned(reg45[(2'h3):(1'h1)]) ?
                      $signed(reg53) : $signed((!wire61)));
  assign wire63 = (8'ha8);
  assign wire64 = $signed($unsigned({wire38,
                      ($signed(wire63) && (reg42 ^ reg57))}));
  assign wire65 = reg56[(3'h4):(1'h0)];
  assign wire66 = ((($signed((reg49 || wire40)) > wire36[(2'h3):(1'h1)]) ?
                      (~&reg44) : $signed(((reg46 + (8'hb9)) ?
                          ((8'ha7) & reg44) : $unsigned(wire41)))) ~^ (~|wire65));
  always
    @(posedge clk) begin
      reg67 <= reg53[(3'h5):(3'h5)];
    end
  assign wire68 = {wire40,
                      (wire65 >> (($unsigned((8'ha4)) ?
                              (~|reg55) : $signed(reg49)) ?
                          $signed((reg50 > reg55)) : $unsigned($unsigned(wire64))))};
  assign wire69 = $unsigned((~^{(~|$unsigned(wire38)), reg50[(4'hb):(3'h5)]}));
  assign wire70 = reg51[(3'h4):(2'h2)];
  assign wire71 = reg55;
  assign wire72 = $unsigned(($unsigned($signed($unsigned(wire68))) || $unsigned(reg46)));
  always
    @(posedge clk) begin
      if (({$signed((reg51 ? wire35 : (&wire36))),
          reg67} & $signed($signed($unsigned($signed((8'haa)))))))
        begin
          reg73 <= reg56[(3'h6):(2'h2)];
        end
      else
        begin
          reg73 <= {($signed($unsigned((^~reg53))) ?
                  reg56[(2'h3):(1'h0)] : $signed($signed((8'ha2)))),
              $signed($signed(wire65))};
        end
    end
endmodule

module module15
#(parameter param28 = ((~|{{((7'h44) + (8'hbb)), (~|(7'h43))}}) ? {((-((8'hbe) < (8'hb5))) >>> ((~|(8'hb5)) >> ((8'h9d) ? (8'hab) : (7'h41))))} : (((~^((8'hb4) ? (7'h43) : (8'hb6))) ? ((8'hb9) ? (^(8'hbc)) : ((8'ha5) ^~ (7'h44))) : (8'h9f)) ? ({(+(8'h9e)), (~&(8'hb2))} < (((8'hac) ? (7'h41) : (8'hb1)) * ((8'ha0) ? (8'h9f) : (8'ha2)))) : {(-((8'hbb) ? (7'h42) : (8'hbf)))})))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire27, wire25, wire22, wire21, reg26, reg24, reg23, (1'h0)};
  assign wire21 = (^(wire18[(3'h6):(3'h5)] ?
                      $signed({wire17[(4'hf):(1'h0)],
                          wire19[(3'h6):(1'h1)]}) : ({{wire17, wire20},
                              (wire20 ? wire17 : wire18)} ?
                          (+(wire20 ? wire17 : wire19)) : (wire18 && (wire19 ?
                              wire18 : wire19)))));
  assign wire22 = wire18[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg23 <= wire17[(3'h4):(1'h0)];
      reg24 <= ($unsigned(($signed($signed(wire18)) & $unsigned((wire22 ?
          wire16 : wire16)))) | (($unsigned((^wire19)) <<< ((wire21 < wire19) ?
              (wire17 ^ wire16) : wire20[(1'h0):(1'h0)])) ?
          wire21 : {{wire22[(4'h8):(2'h3)], $signed((8'hbb))}}));
    end
  assign wire25 = wire18;
  always
    @(posedge clk) begin
      reg26 <= $signed(reg23);
    end
  assign wire27 = reg26[(1'h1):(1'h0)];
endmodule
