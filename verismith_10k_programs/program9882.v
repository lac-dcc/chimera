module top
#(parameter param122 = ((8'ha7) >= ((8'h9f) ? (({(7'h42)} ? (~(8'hb8)) : (+(8'ha8))) <= (((7'h42) | (8'ha8)) ? ((8'ha1) ? (8'hb6) : (8'ha0)) : ((8'hbd) ? (8'had) : (8'ha7)))) : (|(((8'hbe) <= (8'ha6)) ? {(8'hbe)} : ((8'ha6) ? (8'hbc) : (8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire119;
  assign y = {wire121,
                 wire94,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire96,
                 wire119,
                 (1'h0)};
  assign wire4 = {$signed(((-$unsigned(wire0)) ?
                         ({wire2, wire2} ?
                             $unsigned(wire3) : wire3[(5'h10):(4'h8)]) : $unsigned((~|wire3)))),
                     {$signed(wire2[(5'h12):(4'hc)]),
                         $signed($unsigned((~^wire1)))}};
  assign wire5 = (&{wire4[(3'h6):(2'h2)]});
  assign wire6 = wire2;
  assign wire7 = $signed((($unsigned((~&wire1)) ?
                     $unsigned($signed((8'h9e))) : wire4) == (~|(~|(wire6 ?
                     wire1 : wire4)))));
  assign wire8 = ((8'h9d) ?
                     (wire4 ~^ ($unsigned(wire6) != $signed($unsigned(wire2)))) : (-$signed((wire1 ?
                         (wire3 >= wire7) : wire4))));
  module9 #() modinst95 (.wire11(wire0), .wire10(wire3), .wire12(wire2), .clk(clk), .y(wire94), .wire14(wire7), .wire13(wire1));
  assign wire96 = $signed(wire94[(2'h3):(1'h0)]);
  module97 #() modinst120 (wire119, clk, wire3, wire5, wire4, wire1, wire8);
  assign wire121 = (wire119 << {$signed($signed((-wire3))),
                       (|$unsigned($unsigned(wire7)))});
endmodule

module module97  (y, clk, wire98, wire99, wire100, wire101, wire102);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire99;
  input wire signed [(4'hb):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire101;
  input wire [(5'h10):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire116;
  assign y = {wire118, wire103, wire104, wire116, (1'h0)};
  assign wire103 = ((((8'h9c) << (~|(wire99 >= wire100))) * $signed((^(wire100 < wire101)))) ?
                       {($signed($unsigned(wire99)) ?
                               wire101 : (!((8'hb9) << wire101))),
                           wire98[(4'h8):(3'h6)]} : $signed({($unsigned(wire99) ?
                               $unsigned(wire101) : (wire101 ?
                                   wire102 : wire98))}));
  assign wire104 = (|wire102[(3'h6):(1'h1)]);
  module105 #() modinst117 (.wire106(wire103), .y(wire116), .wire110(wire102), .wire107(wire100), .wire108(wire98), .clk(clk), .wire109(wire104));
  assign wire118 = $unsigned(wire102[(3'h6):(3'h5)]);
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire57;
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  assign y = {wire82,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire27,
                 wire29,
                 wire30,
                 wire31,
                 wire57,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 (1'h0)};
  module15 #() modinst28 (.clk(clk), .wire19(wire14), .y(wire27), .wire16(wire11), .wire17(wire13), .wire20(wire10), .wire18(wire12));
  assign wire29 = (wire10[(3'h6):(2'h2)] ?
                      (~|wire14[(1'h0):(1'h0)]) : wire11[(3'h7):(2'h3)]);
  assign wire30 = wire12;
  assign wire31 = wire14;
  module32 #() modinst58 (.wire37(wire10), .wire35(wire11), .y(wire57), .clk(clk), .wire34(wire31), .wire33(wire12), .wire36(wire13));
  assign wire59 = $signed($signed((~($unsigned(wire29) ?
                      $unsigned(wire13) : wire27))));
  assign wire60 = $signed(wire59[(3'h6):(3'h4)]);
  assign wire61 = (wire13[(4'hb):(3'h6)] ? (&wire60) : wire60);
  assign wire62 = wire30;
  assign wire63 = wire10[(4'h9):(2'h2)];
  assign wire64 = (8'ha2);
  assign wire65 = $unsigned(wire29);
  assign wire66 = {{wire65[(4'h8):(1'h1)]}};
  assign wire67 = wire14[(3'h4):(1'h1)];
  assign wire68 = (&wire57);
  assign wire69 = (($signed($unsigned({wire65})) > (((wire65 ?
                          wire14 : wire60) != (wire29 ? wire64 : (8'hb3))) ?
                      $unsigned($unsigned(wire57)) : ($signed(wire62) < wire30[(1'h0):(1'h0)]))) * (8'hb2));
  always
    @(posedge clk) begin
      reg70 <= (wire63[(1'h1):(1'h0)] ^~ {{($signed(wire31) ?
                  (&(8'hb6)) : $signed((8'ha4))),
              wire65}});
      reg71 <= (~$signed(wire11[(4'h8):(3'h6)]));
    end
  always
    @(posedge clk) begin
      reg72 <= (wire62 ?
          wire31 : {({(^~wire10)} >= $signed($unsigned(wire31)))});
      reg73 <= $unsigned(((~(^{wire61, wire66})) ?
          (~^(~|wire29)) : (wire57[(1'h1):(1'h0)] || wire11[(4'he):(1'h0)])));
      reg74 <= (8'hab);
      reg75 <= {(8'hb8)};
      if ((($signed(wire31[(4'h8):(1'h0)]) < {$signed((!wire14)),
          ((~|wire60) ?
              $unsigned(wire12) : ((8'hb3) ?
                  reg75 : reg74))}) >> $signed((~($unsigned(wire11) << wire67[(3'h6):(3'h6)])))))
        begin
          reg76 <= wire13[(5'h14):(2'h3)];
          reg77 <= (wire64[(4'h8):(1'h1)] ? (|reg76) : (&reg72));
          reg78 <= ((($signed(((7'h42) ? wire65 : wire57)) <<< {(~reg71)}) ?
              ($unsigned(wire67[(2'h2):(1'h0)]) ^~ $unsigned((~^wire66))) : wire66) == $signed($unsigned($unsigned((+reg74)))));
          reg79 <= wire67;
          reg80 <= (-((wire62 && wire14[(1'h0):(1'h0)]) | ((reg79[(3'h5):(3'h4)] ~^ $signed(wire29)) ?
              ($signed(wire63) ?
                  {reg70,
                      (8'hba)} : (wire29 <<< wire69)) : wire29[(4'hb):(1'h1)])));
        end
      else
        begin
          if ((~$unsigned($signed((wire68 - {wire29, wire57})))))
            begin
              reg76 <= ((({(wire57 ^ wire30), (wire68 + reg72)} ?
                  (wire66[(2'h3):(1'h1)] - wire29) : wire13) >= $signed(wire11)) <<< $unsigned($signed({(8'ha9)})));
              reg77 <= (~(($unsigned(wire68) ?
                      (wire57[(1'h1):(1'h0)] - (8'haf)) : wire68) ?
                  (-($signed(reg72) && (~|reg80))) : $signed(($unsigned(wire62) ?
                      wire69[(3'h4):(3'h4)] : $unsigned(wire12)))));
              reg78 <= $unsigned($unsigned($unsigned(($signed(wire59) >>> $signed(reg70)))));
              reg79 <= {reg76[(2'h2):(2'h2)], wire11};
            end
          else
            begin
              reg76 <= $unsigned(($unsigned(($signed(wire27) ?
                  $signed(reg74) : wire60)) > $unsigned(((reg73 ?
                  reg75 : (8'hbc)) == (wire30 ? reg80 : reg70)))));
              reg77 <= $signed($signed(wire14));
              reg78 <= $unsigned({($signed($unsigned(wire11)) ?
                      reg80 : (+(wire64 ? (8'ha1) : wire59))),
                  ((|(wire67 ? wire65 : wire65)) ^ $signed((reg73 ?
                      reg79 : reg75)))});
              reg79 <= (^(~(^~$signed((reg73 <= (8'hbb))))));
            end
          reg80 <= ({reg74[(2'h3):(1'h1)], (-wire57)} >= reg73);
          reg81 <= $signed((8'haf));
        end
    end
  assign wire82 = $signed(($signed(wire11) ?
                      {$signed((~&(8'hae))),
                          ((wire63 + wire69) | (reg79 + reg74))} : (reg79 + $unsigned(reg73))));
  always
    @(posedge clk) begin
      reg83 <= $unsigned((reg71[(4'h8):(2'h3)] < $signed((-(wire11 ?
          reg76 : (8'hb0))))));
      if ($signed($unsigned($signed(($signed(wire63) & (8'hb9))))))
        begin
          if ($signed(reg73[(3'h4):(2'h3)]))
            begin
              reg84 <= (^~wire59[(4'hb):(4'h8)]);
              reg85 <= (|reg76[(2'h2):(2'h2)]);
              reg86 <= ((7'h43) ?
                  (wire12[(4'h9):(3'h4)] ?
                      $unsigned(reg71) : reg73) : ($unsigned(wire61) ?
                      (~($signed(reg78) ?
                          wire61[(3'h6):(3'h5)] : $signed((8'h9e)))) : {$unsigned($unsigned(wire67))}));
              reg87 <= ((-$unsigned($signed((reg77 < wire64)))) ?
                  wire11[(5'h11):(3'h5)] : (^$signed($unsigned(reg81))));
            end
          else
            begin
              reg84 <= $signed(wire61[(2'h2):(1'h1)]);
              reg85 <= reg79[(4'h9):(1'h0)];
            end
          if ($signed($signed((~$signed(wire10)))))
            begin
              reg88 <= reg87;
              reg89 <= $unsigned($signed(((wire57[(1'h1):(1'h1)] ?
                  $signed(wire57) : (reg71 && reg83)) & ($unsigned(reg72) | {wire68}))));
              reg90 <= wire82;
              reg91 <= {reg86};
            end
          else
            begin
              reg88 <= $signed(((~{(~|(8'ha8)), (~^wire82)}) ?
                  (8'hae) : ((~$unsigned((8'hb2))) >> ((reg83 < wire65) ?
                      (&wire13) : {wire11}))));
              reg89 <= $unsigned(reg81[(3'h7):(3'h5)]);
              reg90 <= reg86[(3'h7):(3'h6)];
              reg91 <= (~|$unsigned({reg84}));
              reg92 <= wire66[(4'ha):(1'h0)];
            end
          reg93 <= wire82[(3'h4):(2'h3)];
        end
      else
        begin
          reg84 <= wire29[(5'h11):(1'h1)];
          if (wire68[(2'h2):(2'h2)])
            begin
              reg85 <= reg89[(2'h3):(1'h0)];
            end
          else
            begin
              reg85 <= (wire27 ^~ wire62[(3'h5):(1'h1)]);
              reg86 <= wire57;
              reg87 <= $unsigned(($unsigned($unsigned((8'hab))) && (+((wire12 + reg79) + wire31[(3'h4):(3'h4)]))));
              reg88 <= wire64[(4'hf):(4'hb)];
            end
        end
    end
endmodule

module module32
#(parameter param55 = ((((+((8'hb1) ? (8'hb7) : (8'hbd))) >> ((~&(8'hbe)) ? ((8'h9d) ? (8'hbb) : (8'ha7)) : (~|(8'hb8)))) ? (|(((8'ha1) << (8'hb3)) >= (-(8'hb1)))) : {((~&(8'hb7)) << {(8'hae)}), ((~|(8'ha3)) || ((8'ha1) <= (8'hb3)))}) > (^~(((~|(8'haf)) >> ((8'had) ? (7'h43) : (7'h44))) ? ({(8'hb7), (8'ha7)} ? ((8'had) ? (8'h9d) : (8'ha3)) : ((7'h44) <= (8'hbf))) : (((7'h40) ? (8'hbf) : (8'hba)) ? ((8'hb7) ? (7'h40) : (8'h9e)) : (7'h44))))), 
parameter param56 = (({(!(param55 ? param55 : param55))} ? param55 : (8'ha0)) ? ((~((param55 ? param55 : param55) > (param55 + param55))) ? param55 : (({param55, param55} ? {param55} : (param55 >= (8'hb4))) >>> (param55 <<< (^param55)))) : (~|param55)))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire37;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire [(5'h11):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  assign y = {wire54,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire38 = $unsigned(({$signed($signed((8'ha8)))} ?
                      $signed(wire36) : ((^~$unsigned(wire34)) ?
                          $unsigned(wire34) : $unsigned(wire36))));
  assign wire39 = (wire33[(4'hf):(2'h3)] == ($signed((wire37[(1'h0):(1'h0)] >= wire34)) == $signed({$signed(wire34)})));
  assign wire40 = $signed((8'ha7));
  assign wire41 = $unsigned(wire40);
  assign wire42 = $unsigned(((($unsigned(wire35) ?
                              (wire36 ? wire33 : wire36) : ((8'hbf) ?
                                  (8'ha6) : wire36)) ?
                          $signed($unsigned(wire38)) : wire35) ?
                      (!wire40) : wire36));
  assign wire43 = wire40[(3'h5):(1'h0)];
  assign wire44 = $signed((-($signed(wire38) < (~^wire42))));
  assign wire45 = (^wire35);
  assign wire46 = (&(((7'h42) << {(8'hb8)}) ~^ (~$signed((^~wire42)))));
  always
    @(posedge clk) begin
      reg47 <= $signed(wire46[(1'h1):(1'h0)]);
      reg48 <= (+wire34[(5'h11):(1'h0)]);
      if (wire41)
        begin
          reg49 <= {wire34[(4'he):(3'h7)], reg48};
          reg50 <= wire42;
        end
      else
        begin
          reg49 <= (wire37[(1'h0):(1'h0)] ?
              {((reg49 ? $unsigned(wire37) : reg47[(2'h2):(2'h2)]) ?
                      {wire36[(3'h5):(1'h0)],
                          $unsigned(reg47)} : ($unsigned(wire36) ?
                          (wire40 ? wire35 : wire34) : (wire35 ?
                              (8'hb0) : reg49))),
                  {wire35,
                      $signed(reg47)}} : $unsigned((wire38[(2'h3):(1'h1)] >>> (-$signed(wire33)))));
          reg50 <= ($signed((~(wire46 ?
                  $signed((7'h43)) : (wire35 ? wire37 : wire41)))) ?
              $signed({($unsigned((7'h44)) ?
                      (^(8'hb5)) : $signed((7'h40)))}) : (~^(8'hab)));
          reg51 <= $unsigned(((&(^~(|wire34))) ?
              wire39[(4'he):(3'h4)] : ($signed($signed(wire42)) | $signed((^wire38)))));
          reg52 <= (reg50 ~^ (($unsigned($unsigned(wire43)) ?
                  (reg47[(3'h4):(2'h3)] + ((7'h43) << wire43)) : ($unsigned(wire45) || (wire38 >>> wire43))) ?
              ($signed({wire37,
                  wire45}) > $unsigned($signed(wire45))) : (~|(wire36 ?
                  wire42[(4'hd):(4'hb)] : (wire44 ? wire41 : wire42)))));
        end
      reg53 <= (~^{((+(reg50 ? wire35 : reg47)) ^~ $signed(reg48))});
    end
  assign wire54 = reg48;
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire16[(2'h3):(2'h2)];
  assign wire22 = {(wire19[(1'h0):(1'h0)] ?
                          (-$unsigned(wire19)) : $unsigned($unsigned(wire17)))};
  assign wire23 = (|(8'hb4));
  assign wire24 = (wire21 << $unsigned(wire19));
  assign wire25 = (({({(8'hbc), (7'h40)} || $signed(wire16))} ?
                      (-wire19) : {((8'hb8) > (wire21 + wire20))}) >>> wire23);
  assign wire26 = (wire22 ^ wire25);
endmodule

module module105
#(parameter param115 = (~&((~^((^(8'hae)) ? ((8'ha9) ? (8'ha4) : (8'hb4)) : ((7'h43) ? (7'h40) : (8'hab)))) | (8'had))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire110;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire [(4'hf):(1'h0)] wire108;
  input wire signed [(2'h3):(1'h0)] wire107;
  input wire signed [(4'he):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  assign y = {wire114, wire113, wire112, wire111, (1'h0)};
  assign wire111 = $signed($unsigned((&$signed($signed(wire106)))));
  assign wire112 = wire109;
  assign wire113 = (wire111[(2'h2):(1'h0)] ^ wire112);
  assign wire114 = $unsigned(wire111[(2'h3):(1'h0)]);
endmodule
