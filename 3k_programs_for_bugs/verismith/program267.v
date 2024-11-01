module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire109;
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire61,
                 wire63,
                 wire109,
                 reg11,
                 (1'h0)};
  assign wire5 = (wire4[(4'ha):(2'h3)] != (~|$signed((!$unsigned(wire0)))));
  assign wire6 = ($signed(((8'hab) ?
                     (-(wire4 ?
                         wire1 : wire1)) : $unsigned(wire2[(4'he):(3'h4)]))) < (|$unsigned($signed($signed((8'hba))))));
  assign wire7 = (~^{((-$signed(wire6)) ?
                         $signed((wire3 ?
                             wire4 : wire0)) : (|(wire5 * (8'ha4)))),
                     wire4[(5'h14):(1'h1)]});
  assign wire8 = wire5[(2'h3):(1'h0)];
  assign wire9 = ((^(-$unsigned($unsigned(wire6)))) >= (8'hb5));
  assign wire10 = (|(wire8 && (wire0 ?
                      ($unsigned(wire4) || {wire4,
                          wire1}) : wire7[(4'ha):(4'h8)])));
  always
    @(posedge clk) begin
      reg11 <= {(~&$unsigned(wire0[(5'h13):(5'h13)])),
          ((((+wire6) ~^ $signed(wire5)) ?
                  (wire2[(4'hd):(1'h0)] ?
                      (&wire1) : (wire5 ?
                          (8'hbd) : wire6)) : $signed($unsigned((7'h42)))) ?
              (~($signed(wire3) & {wire6})) : {(^~(wire6 & wire6)),
                  $unsigned($signed(wire10))})};
    end
  assign wire12 = $unsigned($unsigned($signed(wire7)));
  assign wire13 = wire9[(4'h9):(2'h2)];
  assign wire14 = (wire8 ?
                      wire7 : $unsigned($signed($signed((wire3 ^~ wire7)))));
  assign wire15 = (8'h9e);
  module16 #() modinst62 (.wire17(wire7), .y(wire61), .wire21(reg11), .wire18(wire4), .wire20(wire9), .clk(clk), .wire19(wire12));
  assign wire63 = wire3[(2'h2):(1'h1)];
  module64 #() modinst110 (wire109, clk, wire4, wire0, wire10, wire6, wire12);
  assign wire111 = ($unsigned(((8'hac) ?
                           $signed({wire10}) : $signed({wire12}))) ?
                       wire5[(3'h4):(2'h3)] : $unsigned(($unsigned({wire63}) ?
                           (&wire5) : $unsigned(wire12))));
  assign wire112 = $signed(((8'h9f) ? reg11 : wire10[(1'h0):(1'h0)]));
  assign wire113 = $unsigned(($signed(((~&wire4) == {wire10})) > $unsigned(($unsigned(wire61) ?
                       (~^wire14) : {(8'h9d), wire3}))));
  assign wire114 = $unsigned((wire113[(3'h4):(2'h3)] ?
                       {$unsigned(wire4[(2'h2):(1'h1)])} : (&wire61[(1'h0):(1'h0)])));
  assign wire115 = wire111;
  assign wire116 = (reg11[(3'h4):(1'h1)] == (^~(^~(wire9[(5'h12):(4'ha)] ?
                       {wire14} : (!wire61)))));
endmodule

module module64
#(parameter param107 = {(((^(~|(8'hb0))) ? (~|(^~(7'h43))) : (((7'h44) ? (8'hbd) : (8'haf)) ? (&(8'h9c)) : (+(8'hba)))) ? (|(((8'ha5) && (8'hb6)) & ((8'hbe) | (8'hbd)))) : (((~(8'h9d)) ? ((8'hb9) ^ (8'hac)) : {(8'h9c)}) + ({(8'hb5)} <<< ((8'hbe) <= (8'hb2))))), ({(8'hb0)} ? {({(8'ha8), (8'hbe)} >>> ((8'ha0) ? (7'h44) : (7'h40)))} : (((8'hbc) ? ((8'haa) == (8'ha0)) : {(8'hb6), (7'h44)}) ? (((7'h40) ? (8'hae) : (8'hbe)) <<< (+(8'hbe))) : ({(8'haa), (8'haa)} & (8'hbb))))}, 
parameter param108 = (param107 ? param107 : {({(&param107), (param107 ? param107 : param107)} < ((8'ha8) ? (param107 ~^ param107) : (!param107))), (((param107 != (7'h41)) <<< (~|param107)) ^~ (param107 >= (|(8'hb6))))}))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  assign y = {wire106,
                 wire104,
                 wire71,
                 wire70,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire70 = $signed((wire69[(3'h6):(3'h6)] - (((wire66 < wire65) ?
                          ((8'h9c) == (8'hbb)) : $signed(wire65)) ?
                      ((8'hbc) ?
                          (wire67 < wire67) : (wire66 ?
                              wire67 : wire67)) : ($unsigned(wire66) && {wire66,
                          wire67}))));
  assign wire71 = {(-{((8'ha3) != $signed(wire70)), wire65})};
  always
    @(posedge clk) begin
      reg72 <= $signed(($signed((-wire71[(2'h2):(1'h0)])) == wire69[(4'hc):(4'h8)]));
      if ($signed($signed(((wire65[(4'hb):(2'h2)] ? wire71 : $signed(wire70)) ?
          (wire71[(4'he):(3'h5)] ?
              (wire67 & (8'hae)) : (wire69 > (8'hbf))) : ($signed(wire65) - (!wire66))))))
        begin
          reg73 <= $signed((&wire66));
          reg74 <= (8'haa);
          reg75 <= $unsigned(wire71[(4'h8):(3'h6)]);
          reg76 <= $signed(wire69);
          reg77 <= ({($signed((^~wire68)) * $signed(reg74[(4'ha):(4'h9)]))} ?
              reg72 : {wire66[(3'h4):(2'h2)]});
        end
      else
        begin
          reg73 <= reg72;
          reg74 <= $unsigned(wire66);
        end
    end
  module78 #() modinst105 (wire104, clk, wire67, reg77, wire71, reg73);
  assign wire106 = $unsigned($signed((|(8'ha1))));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire47;
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire52,
                 wire47,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  module22 #() modinst48 (.wire25(wire20), .wire23(wire19), .y(wire47), .clk(clk), .wire26(wire21), .wire24(wire17));
  always
    @(posedge clk) begin
      reg49 <= (wire20[(1'h0):(1'h0)] ?
          $signed((8'ha4)) : (($signed((~&(8'h9f))) ?
              wire19 : wire19[(2'h2):(1'h1)]) + (~(((7'h40) < wire20) ?
              $signed(wire19) : wire17))));
      reg50 <= $unsigned(((&$unsigned($unsigned(wire17))) < $unsigned($unsigned((8'hb4)))));
      reg51 <= $unsigned((!$unsigned({$signed((8'hb4))})));
    end
  assign wire52 = $signed($signed(wire47[(4'hf):(4'h9)]));
  always
    @(posedge clk) begin
      reg53 <= (~^({(~&reg50),
          (^~(wire17 >> wire18))} > wire19[(2'h2):(2'h2)]));
    end
  assign wire54 = (!wire18[(1'h1):(1'h1)]);
  assign wire55 = reg50[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg56 <= $unsigned({$unsigned({$signed(wire55),
              (wire17 ? wire55 : wire54)}),
          (+(~$unsigned(wire47)))});
      if (($signed(((-((8'hbe) <= wire17)) ?
          reg51[(3'h5):(2'h2)] : $unsigned(wire52[(1'h0):(1'h0)]))) ^ $unsigned(({(~^(7'h44))} << $signed($unsigned(wire55))))))
        begin
          reg57 <= ({reg50[(4'ha):(4'ha)],
              reg50} == $signed(wire18[(1'h0):(1'h0)]));
          reg58 <= $unsigned(reg57[(2'h3):(2'h2)]);
          reg59 <= {wire19[(3'h5):(3'h4)],
              (~|{((&reg56) ^~ $unsigned(wire21))})};
        end
      else
        begin
          reg57 <= reg51;
          reg58 <= ({(wire52[(2'h2):(1'h1)] < (&$unsigned(wire19))),
              reg58} ^~ reg53);
        end
      reg60 <= ((+wire55[(5'h11):(3'h7)]) == reg49[(4'h8):(1'h0)]);
    end
endmodule

module module22
#(parameter param46 = (+{((((8'ha4) * (8'ha0)) ? (!(8'ha4)) : (&(8'hb9))) ? ((~|(8'h9e)) ? {(8'ha2)} : ((7'h44) & (8'hb2))) : (((8'hb6) <<< (8'hb2)) ? ((8'hb7) ? (8'hab) : (8'ha6)) : {(8'hbb), (8'hac)}))}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
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
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg31,
                 (1'h0)};
  assign wire27 = ($unsigned(wire25) & (wire23 >> wire26[(1'h1):(1'h1)]));
  assign wire28 = (^wire26);
  assign wire29 = {wire26[(4'ha):(3'h5)], wire27};
  assign wire30 = wire25[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg31 <= (wire29[(1'h1):(1'h1)] == ((8'ha1) ?
          wire25[(4'hd):(3'h7)] : wire26[(4'hf):(4'h9)]));
    end
  assign wire32 = wire26;
  assign wire33 = $signed({wire29[(2'h3):(1'h1)]});
  assign wire34 = ((~&(^{wire23[(1'h1):(1'h0)]})) || (~reg31));
  assign wire35 = $unsigned((|(wire23[(1'h0):(1'h0)] - (^~(wire24 <<< (8'hbf))))));
  assign wire36 = wire27[(2'h2):(1'h1)];
  assign wire37 = wire36[(1'h1):(1'h1)];
  assign wire38 = wire25[(4'h9):(3'h7)];
  assign wire39 = (((wire36 ?
                      wire25[(2'h2):(1'h0)] : (+$signed((8'had)))) >>> (-$signed($unsigned(wire33)))) >= reg31);
  assign wire40 = wire36;
  assign wire41 = $unsigned($signed(wire26));
  assign wire42 = reg31[(2'h3):(2'h3)];
  assign wire43 = wire23;
  assign wire44 = (!wire38[(1'h0):(1'h0)]);
  assign wire45 = {{((wire28[(4'h8):(2'h2)] ?
                                  wire39[(2'h2):(1'h0)] : $unsigned(wire42)) ?
                              {wire23[(1'h0):(1'h0)],
                                  $signed((8'haa))} : wire42)},
                      ($signed((~$unsigned(wire26))) ?
                          $unsigned(((wire43 && wire29) ?
                              $signed(wire37) : (wire35 ?
                                  wire41 : wire44))) : wire35[(5'h12):(4'h8)])};
endmodule

module module78
#(parameter param103 = (-({(((8'ha0) ? (8'hbf) : (7'h40)) * ((7'h41) ~^ (8'hb1))), (((8'hb8) & (8'hab)) | ((8'hb0) ? (8'hb0) : (8'hb6)))} ? (((7'h40) ~^ (&(8'hbc))) ? (8'hb6) : ((|(8'hb0)) ? (~|(8'hb7)) : ((8'haa) ? (8'hba) : (8'hbb)))) : (((+(8'haa)) * ((8'h9e) == (8'hb9))) ^ (!(^~(7'h44)))))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire81;
  input wire signed [(4'ha):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire89;
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire89,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= (!(~wire79));
      reg84 <= reg83[(5'h15):(3'h7)];
      reg85 <= $signed($unsigned(wire80[(1'h0):(1'h0)]));
      if ((^~$unsigned(reg85[(1'h1):(1'h0)])))
        begin
          reg86 <= (((({(7'h43), (8'ha4)} ?
                  (^~wire79) : wire80[(1'h1):(1'h1)]) != (wire82[(4'he):(4'h8)] ?
                  wire81 : $signed(wire82))) ?
              $unsigned($unsigned(reg84[(3'h5):(1'h0)])) : wire81[(4'h9):(4'h8)]) ^~ (wire79 || $unsigned(reg85[(2'h2):(1'h1)])));
          reg87 <= $unsigned((wire81 ?
              ($signed($signed(reg83)) != ((+wire79) ?
                  $signed(reg86) : reg86)) : ($signed((reg86 - (8'ha1))) > wire80)));
        end
      else
        begin
          reg86 <= $unsigned((7'h41));
        end
      reg88 <= {($unsigned((|wire79)) | $signed(((reg85 || reg83) ^ reg85[(2'h2):(2'h2)])))};
    end
  assign wire89 = (((+reg84[(3'h6):(3'h5)]) ?
                      $unsigned((&(wire81 > reg87))) : $signed((reg83 >= $unsigned(reg87)))) != (reg85[(3'h4):(1'h0)] > $unsigned((&(|(8'haa))))));
  always
    @(posedge clk) begin
      if (reg86[(1'h0):(1'h0)])
        begin
          reg90 <= (+((|wire81) || reg84));
          reg91 <= reg90;
        end
      else
        begin
          if ((~&wire82))
            begin
              reg90 <= $unsigned({$signed(reg91[(1'h0):(1'h0)])});
            end
          else
            begin
              reg90 <= {(~^reg86), (8'had)};
              reg91 <= wire89;
              reg92 <= $signed((7'h42));
            end
          reg93 <= $unsigned(({reg83[(5'h15):(2'h2)]} != {({wire80} << reg90)}));
          reg94 <= (~^$signed(wire82[(4'hf):(3'h5)]));
        end
      reg95 <= {$signed((((reg91 ~^ reg87) ^~ {(8'ha1)}) ?
              $signed((|reg92)) : $signed({reg86, reg84}))),
          $signed((($unsigned(reg83) ?
              (~&reg94) : $unsigned((8'ha8))) ~^ (reg90[(2'h2):(2'h2)] ?
              (reg94 == reg93) : $unsigned((8'hac)))))};
      reg96 <= reg90;
    end
  assign wire97 = wire80;
  assign wire98 = $unsigned(wire89);
  assign wire99 = $signed((8'ha4));
  assign wire100 = reg87[(1'h0):(1'h0)];
  assign wire101 = ($unsigned((&(8'ha7))) ~^ $signed(reg93));
  assign wire102 = ({reg93[(3'h4):(1'h1)]} ? reg91 : reg83);
endmodule
