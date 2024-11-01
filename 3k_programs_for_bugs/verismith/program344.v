module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire121;
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire25,
                 wire121,
                 reg124,
                 reg123,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  module4 #() modinst26 (wire25, clk, wire3, wire1, wire0, wire2, (8'ha6));
  always
    @(posedge clk) begin
      if ((8'hb3))
        begin
          reg27 <= wire2;
          if (wire3[(3'h6):(2'h2)])
            begin
              reg28 <= {(&wire1)};
              reg29 <= $signed((reg27[(4'he):(2'h3)] << $unsigned($signed(reg27[(4'h8):(4'h8)]))));
              reg30 <= $signed((+((wire25[(3'h4):(3'h4)] ?
                  (wire25 ?
                      wire1 : reg28) : wire1[(3'h4):(1'h1)]) ~^ (|wire0))));
              reg31 <= ((((~reg30) ?
                          {(&reg30), $signed(wire3)} : wire1[(2'h2):(2'h2)]) ?
                      reg30 : reg30[(2'h3):(1'h1)]) ?
                  (8'h9d) : wire25);
            end
          else
            begin
              reg28 <= (8'hba);
            end
          reg32 <= $signed(reg30);
          reg33 <= ($unsigned(((wire25[(3'h6):(1'h0)] ?
                  $signed(wire1) : $unsigned(reg31)) * $unsigned((^reg28)))) ?
              $unsigned({($signed(reg28) ?
                      (wire0 >>> reg30) : wire1[(3'h5):(3'h5)])}) : $signed(((&wire25[(1'h0):(1'h0)]) - (+(reg29 ?
                  (8'ha8) : wire3)))));
        end
      else
        begin
          reg27 <= wire3[(3'h7):(2'h2)];
          if ($unsigned(reg31))
            begin
              reg28 <= reg27;
            end
          else
            begin
              reg28 <= (~^wire0);
              reg29 <= wire0;
              reg30 <= $signed($signed($signed($signed({reg28}))));
            end
          if (($signed({$signed(reg30[(4'hf):(4'hf)]), wire3[(1'h0):(1'h0)]}) ?
              (&((wire0[(4'he):(4'hc)] ^~ wire2[(3'h4):(1'h1)]) ?
                  $unsigned((~&wire3)) : ((wire1 | reg33) & $unsigned(reg31)))) : reg28[(3'h6):(2'h2)]))
            begin
              reg31 <= $unsigned((wire3[(3'h5):(2'h3)] << ($unsigned({reg28,
                  reg32}) || (reg30[(3'h4):(1'h0)] - $signed(reg29)))));
            end
          else
            begin
              reg31 <= $unsigned(reg30[(3'h5):(2'h2)]);
              reg32 <= $signed(((wire1 >= {((7'h40) < wire2)}) ?
                  reg27 : $unsigned((~|(reg31 ? reg30 : reg28)))));
            end
          reg33 <= (wire1[(3'h7):(3'h7)] & ($unsigned((reg33[(3'h7):(3'h7)] >>> (-reg28))) | (^wire2)));
          reg34 <= (!(((~|reg29) ?
                  wire3[(3'h4):(2'h2)] : ($signed((8'h9c)) ?
                      $unsigned(wire25) : (^~wire1))) ?
              $unsigned((wire2 ?
                  $signed(reg32) : $signed((8'haa)))) : $unsigned(wire2[(3'h7):(3'h6)])));
        end
      reg35 <= $unsigned((&{wire0[(2'h3):(1'h1)],
          ({wire1, reg31} ? $signed(reg27) : $unsigned(reg33))}));
      reg36 <= $unsigned($signed(reg29[(4'h9):(4'h9)]));
      reg37 <= reg36[(2'h3):(1'h0)];
    end
  module38 #() modinst122 (wire121, clk, reg28, reg27, reg36, wire2);
  always
    @(posedge clk) begin
      reg123 <= reg28;
      reg124 <= {reg27};
    end
  assign wire125 = $unsigned((reg28 - $unsigned(reg33[(3'h4):(2'h3)])));
  assign wire126 = $signed(reg37[(1'h0):(1'h0)]);
endmodule

module module38
#(parameter param119 = ((~&(~|((8'hb9) ? ((8'hb2) ~^ (7'h43)) : ((7'h41) ? (8'hbf) : (8'ha9))))) == {((8'ha8) ? ((|(8'ha0)) ? (!(8'hb0)) : (|(8'hb2))) : {(~&(8'hbb))}), ((((8'hb3) ? (8'hb0) : (8'ha7)) ? ((8'h9e) ? (8'hb5) : (8'ha8)) : (8'h9e)) ? (^(^(8'ha6))) : ({(8'h9d)} < {(8'hac), (7'h40)}))}), 
parameter param120 = (((param119 >= ((param119 ? param119 : param119) ? {param119, param119} : {param119})) ^ param119) ~^ ((param119 | ((param119 & param119) | (param119 <= param119))) | param119)))
(y, clk, wire39, wire40, wire41, wire42);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire107;
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire112,
                 wire110,
                 wire109,
                 wire44,
                 wire73,
                 wire75,
                 wire79,
                 wire107,
                 reg115,
                 reg114,
                 reg113,
                 reg111,
                 reg78,
                 reg77,
                 reg76,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= (|$signed($signed((((7'h42) && wire39) && wire42))));
    end
  assign wire44 = reg43;
  module45 #() modinst74 (.wire46(reg43), .clk(clk), .wire49(wire41), .wire48(wire44), .wire47(wire40), .y(wire73), .wire50(wire42));
  assign wire75 = wire40[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg76 <= wire75;
      reg77 <= $signed(wire42);
      reg78 <= ($unsigned(wire73) >= wire73);
    end
  assign wire79 = $unsigned(((($unsigned(wire73) ?
                          $signed(wire44) : ((7'h43) ?
                              (8'had) : reg76)) & reg77) ?
                      $unsigned((wire40 ^~ reg43)) : (wire75[(3'h7):(1'h1)] ?
                          (wire73[(3'h7):(1'h0)] ?
                              reg76[(3'h5):(3'h5)] : reg77[(4'hc):(4'ha)]) : (|((8'hbe) > wire39)))));
  module80 #() modinst108 (wire107, clk, wire75, wire44, wire40, reg43, reg76);
  assign wire109 = ((~^wire44) >>> {{($unsigned(wire39) <= wire40[(5'h11):(4'hd)]),
                           $signed((wire44 ? wire75 : reg78))},
                       $unsigned(((wire40 ? wire42 : wire107) ?
                           (reg78 ? reg77 : wire75) : $signed(wire73)))});
  assign wire110 = ((&wire107) > ((($unsigned((8'ha2)) <= $signed((8'ha6))) <= $signed(wire79[(3'h5):(1'h0)])) ?
                       $unsigned(wire73) : reg43));
  always
    @(posedge clk) begin
      reg111 <= $unsigned($unsigned(wire109[(1'h1):(1'h0)]));
    end
  assign wire112 = $signed((wire42[(1'h0):(1'h0)] ?
                       ($signed(wire40) ?
                           $signed($signed(wire107)) : wire79) : (-wire73)));
  always
    @(posedge clk) begin
      reg113 <= {((wire39 ?
                  (wire44[(5'h12):(4'h9)] ?
                      $unsigned(reg78) : $unsigned(wire75)) : (wire75[(4'h9):(1'h0)] < wire107[(3'h7):(1'h1)])) ?
              ($signed({wire75}) >= (wire39 && $signed(reg77))) : {reg76[(3'h4):(2'h3)]})};
      reg114 <= ((reg77 ?
              $unsigned(wire107) : $signed({$unsigned((8'hba)),
                  $unsigned((8'h9c))})) ?
          reg78 : (|((!$unsigned(reg113)) ?
              $signed($signed(reg113)) : wire109[(1'h0):(1'h0)])));
      reg115 <= ((!wire75[(4'h8):(3'h6)]) * wire41);
    end
  assign wire116 = reg43[(2'h2):(1'h1)];
  assign wire117 = $unsigned($signed($signed(((wire75 ? wire75 : (8'h9e)) ?
                       $signed(reg113) : (wire41 >>> wire41)))));
  assign wire118 = $unsigned(reg114);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire10;
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire10,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (wire6[(4'h9):(3'h5)] - (~&(~^$signed(wire8))));
  always
    @(posedge clk) begin
      reg11 <= $unsigned((!((|$unsigned(wire7)) - (8'ha9))));
      if ((($unsigned((^$signed(wire7))) | {$signed({wire5}),
          wire8[(2'h3):(1'h0)]}) * wire9[(1'h1):(1'h1)]))
        begin
          reg12 <= (wire5[(3'h6):(2'h2)] | ({{(wire10 >> wire7)}} ?
              $unsigned(wire7) : $unsigned(wire5)));
          reg13 <= $signed((~&$unsigned(wire9[(3'h4):(1'h1)])));
          if ($unsigned(({($unsigned(reg12) ?
                  wire9 : (|wire7))} >> (~^($signed(wire6) <<< (&reg12))))))
            begin
              reg14 <= (+wire8);
            end
          else
            begin
              reg14 <= {(~($signed($signed(reg13)) + $signed($unsigned(wire8))))};
              reg15 <= ($unsigned($unsigned(reg12)) ?
                  (-$signed(($unsigned(wire7) || $unsigned(wire8)))) : (wire9[(1'h0):(1'h0)] ?
                      wire6 : $signed(reg13)));
              reg16 <= (~^(+$unsigned($unsigned($signed(reg11)))));
              reg17 <= (reg13[(3'h6):(3'h4)] ?
                  ((^(&reg15[(4'h8):(3'h6)])) ?
                      wire5 : $signed($signed($signed(reg15)))) : wire10[(4'h9):(3'h4)]);
            end
          reg18 <= wire5[(2'h2):(1'h1)];
        end
      else
        begin
          if (($unsigned((((reg15 ^~ (8'hb6)) ?
                  {reg15, wire10} : (wire10 ?
                      wire7 : reg15)) ~^ (reg16[(1'h0):(1'h0)] << (reg17 ?
                  reg12 : wire6)))) ?
              (8'ha1) : (wire8[(2'h2):(2'h2)] >> $unsigned((+$signed(reg13))))))
            begin
              reg12 <= ((reg16 ?
                      ((+reg13[(4'he):(2'h2)]) ?
                          ((wire7 ^~ reg13) ?
                              {reg12,
                                  wire8} : (&(8'hb5))) : reg14[(2'h2):(1'h0)]) : (wire8 ?
                          (reg13 + $signed((8'hbd))) : (~&{reg17}))) ?
                  $signed(reg15) : reg11);
              reg13 <= (^~((8'hac) ?
                  ($signed((8'hba)) ?
                      ($signed((7'h43)) == {reg14}) : wire7) : {$unsigned((wire8 ?
                          reg18 : wire8))}));
              reg14 <= $signed((~^$unsigned(wire7[(1'h1):(1'h1)])));
              reg15 <= (wire10 ?
                  (reg15 ?
                      ($unsigned((reg13 ? reg15 : wire5)) ?
                          ((reg16 >>> (7'h43)) <= wire5[(2'h3):(1'h1)]) : (~&$unsigned((8'haa)))) : $unsigned(({reg16} && $signed((8'hb5))))) : $unsigned({$unsigned(wire5[(3'h4):(2'h3)]),
                      ($signed(reg13) || reg14)}));
            end
          else
            begin
              reg12 <= reg14;
              reg13 <= (7'h40);
              reg14 <= $signed((reg14 ?
                  (~&wire9[(1'h1):(1'h1)]) : $signed($unsigned((wire10 >= wire8)))));
              reg15 <= ((wire8 ?
                  $unsigned(wire5) : reg11[(2'h2):(2'h2)]) || (((reg16[(3'h5):(1'h0)] ?
                  (reg12 ?
                      (8'hbc) : (8'ha3)) : $unsigned((8'ha8))) ~^ (wire8 ^ $unsigned(wire8))) != (+(!wire10))));
              reg16 <= reg13;
            end
          reg17 <= (8'ha7);
        end
    end
  assign wire19 = $signed($unsigned(reg13));
  assign wire20 = (~^wire10);
  assign wire21 = $unsigned(({$signed(reg14),
                      {((8'ha6) ? wire9 : wire19)}} & ({$unsigned(wire7),
                      (~wire19)} ^ (!(~&reg14)))));
  assign wire22 = ($signed(($signed((&wire9)) ?
                      ((!wire6) ? reg13 : (^~reg13)) : wire8)) || {wire8,
                      $signed($unsigned(wire20[(5'h13):(2'h2)]))});
  assign wire23 = (((wire8 ? $unsigned($signed((8'hbe))) : (~(8'ha9))) ?
                          ((reg13[(3'h6):(1'h0)] >>> reg15[(4'hd):(3'h6)]) ?
                              reg11 : {$unsigned(wire20),
                                  (reg12 ^~ (8'had))}) : ({((8'ha6) - (8'hb6)),
                              (+reg13)} >>> {(wire6 == wire5)})) ?
                      $signed($signed($unsigned(reg15))) : (~|wire6));
  assign wire24 = (reg13 * $signed((8'ha0)));
endmodule

module module80
#(parameter param106 = {(~^{{((8'hb1) ? (8'hb1) : (8'ha3)), ((8'hb5) - (8'ha0))}, ({(8'h9f), (8'had)} << ((7'h40) ? (8'hb9) : (8'ha5)))}), (((8'hb1) ? {((8'hb6) ? (8'hac) : (8'hb4))} : (~((8'hb3) - (8'hbc)))) != (~^({(8'ha9), (8'hbd)} ? ((8'hb6) ? (8'hab) : (8'ha7)) : (&(8'h9c)))))})
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 (1'h0)};
  assign wire86 = $signed((!wire85[(4'h8):(3'h7)]));
  assign wire87 = (((((wire86 ? wire81 : wire86) ^~ $signed(wire81)) ?
                      (!wire82) : {$signed((8'h9f)), wire86}) ^~ (wire86 ?
                      wire83 : (wire84[(4'ha):(3'h4)] ^~ (+wire83)))) != wire81);
  assign wire88 = (wire82[(3'h6):(1'h1)] * (((~&((8'ha3) - wire87)) | $unsigned($unsigned((8'ha0)))) && {$unsigned(wire83[(4'hb):(4'ha)])}));
  assign wire89 = ($unsigned($signed((8'ha5))) && (wire81[(3'h4):(2'h2)] ?
                      (~|$signed(((8'hb1) >= wire82))) : {(~&wire83),
                          wire88[(1'h0):(1'h0)]}));
  assign wire90 = (wire86[(3'h4):(1'h1)] ^~ ($signed(({(8'hb5), wire81} ?
                          $unsigned((8'h9c)) : (wire87 >= (8'hab)))) ?
                      (((wire87 ? (8'hb7) : wire87) > (wire81 ^~ wire89)) ?
                          $unsigned((|wire84)) : $unsigned((wire82 ?
                              (8'hb4) : wire81))) : wire86[(4'hc):(3'h6)]));
  assign wire91 = wire89;
  assign wire92 = wire84;
  assign wire93 = ($signed(wire89[(4'h9):(3'h6)]) ?
                      (($unsigned({wire86, wire87}) ?
                          $unsigned($signed(wire84)) : ((wire84 ?
                                  wire88 : wire91) ?
                              {wire92} : $unsigned(wire90))) == (~&(^$signed(wire82)))) : $signed($signed(wire84[(3'h4):(1'h0)])));
  assign wire94 = $unsigned($signed(($unsigned((wire81 ?
                      wire81 : (8'ha1))) >>> ($unsigned(wire82) ?
                      {(8'ha7), (8'hbd)} : wire82[(3'h6):(2'h3)]))));
  assign wire95 = ($signed((wire87[(1'h1):(1'h1)] ?
                      {wire89,
                          (~|wire91)} : (wire86[(4'h9):(1'h1)] && wire83[(4'h9):(4'h8)]))) | $unsigned(wire90));
  assign wire96 = (&wire90[(2'h2):(1'h0)]);
  assign wire97 = $unsigned(wire86);
  assign wire98 = (~$signed((~{wire95[(3'h6):(3'h5)], $unsigned(wire89)})));
  assign wire99 = $signed((-(-wire98[(1'h0):(1'h0)])));
  assign wire100 = $unsigned({wire85});
  assign wire101 = ($signed(wire85) ?
                       $unsigned((^~{(wire87 ? wire87 : wire87),
                           wire86[(4'h8):(3'h5)]})) : ($signed(((wire92 ?
                               wire90 : wire87) ?
                           (wire81 ?
                               wire91 : (8'hae)) : wire84)) + (wire82[(4'h8):(3'h4)] ?
                           (^~wire89[(1'h0):(1'h0)]) : $signed(wire82))));
  assign wire102 = $unsigned((($signed(wire87) ?
                       $unsigned(wire99) : ((wire82 < wire81) >= (~&(8'ha1)))) + (-$signed($unsigned((8'hab))))));
  assign wire103 = ((8'ha1) - wire95[(2'h3):(2'h3)]);
  assign wire104 = (($signed($signed(((8'ha8) >> wire90))) ?
                       $unsigned({(wire92 >>> wire93),
                           $signed(wire100)}) : wire92[(2'h3):(2'h2)]) <<< (&(+($signed(wire81) ?
                       $signed((8'hb1)) : {wire97}))));
  assign wire105 = wire89;
endmodule

module module45
#(parameter param71 = (-(((((8'ha7) << (8'hb0)) != {(8'ha2)}) ? (((8'had) ? (8'h9d) : (7'h41)) <<< ((8'ha7) >> (8'ha5))) : ({(8'hb3)} < ((8'h9e) <<< (8'hb9)))) | {((8'hb1) << ((8'hb7) ? (8'ha2) : (8'hb3)))})), 
parameter param72 = param71)
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire [(5'h11):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= (wire49[(3'h6):(2'h2)] ^ $unsigned((!$unsigned($unsigned(wire49)))));
      reg52 <= (^($unsigned($unsigned((~wire49))) ?
          $unsigned($signed(((8'hb6) ?
              wire48 : wire47))) : $unsigned($unsigned($unsigned(wire49)))));
    end
  assign wire53 = {(|$unsigned(((wire50 ? wire46 : (8'hb3)) ?
                          {wire50} : (7'h42)))),
                      $unsigned(wire48[(1'h1):(1'h0)])};
  assign wire54 = (($unsigned($signed((wire50 && wire47))) ?
                          $unsigned(wire48) : $signed((~$signed(wire46)))) ?
                      (|$signed(wire53)) : wire53[(3'h4):(2'h2)]);
  assign wire55 = {$signed({$unsigned((wire46 >= (8'haf))),
                          {$signed((8'hbf)), (8'ha6)}}),
                      $unsigned(($signed((|wire48)) - {(reg51 ?
                              reg52 : wire50)}))};
  assign wire56 = (({(~^wire47[(2'h2):(1'h1)]), wire55[(1'h0):(1'h0)]} ?
                          reg51[(3'h4):(3'h4)] : ((&$unsigned(wire53)) ?
                              (wire55 ~^ (wire47 ?
                                  wire55 : wire47)) : (wire47[(2'h3):(2'h3)] ?
                                  (wire47 || wire50) : $unsigned(reg51)))) ?
                      wire49[(4'ha):(2'h2)] : $signed({wire53[(2'h2):(1'h0)]}));
  assign wire57 = reg52[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg58 <= (wire53[(3'h6):(3'h6)] ^ (8'hbb));
      reg59 <= ({reg52, (!$unsigned(wire46[(4'ha):(2'h2)]))} + wire54);
      reg60 <= reg59;
      reg61 <= (~^($signed(((wire50 ^ wire53) ?
              wire56[(1'h1):(1'h1)] : $signed((8'hb5)))) ?
          (^{wire49}) : (($unsigned(wire56) & (wire50 != reg59)) ?
              $signed(reg60) : ({wire54} <<< (wire50 >> reg52)))));
      reg62 <= (wire56 < (reg61[(1'h0):(1'h0)] ?
          (^~$unsigned(((8'hb9) ? wire49 : reg61))) : wire49[(2'h2):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg63 <= reg52;
      reg64 <= wire56;
    end
  assign wire65 = (|reg58);
  assign wire66 = $unsigned((reg60 ? wire55 : wire46));
  assign wire67 = $unsigned(($signed(((^~reg51) ?
                          $unsigned(reg52) : (wire50 >= (8'hac)))) ?
                      wire53 : (((+(8'haa)) ?
                              (wire47 ? reg51 : wire50) : (~|wire49)) ?
                          (&(reg59 < reg64)) : $unsigned($signed(reg64)))));
  assign wire68 = ($unsigned((^reg51[(1'h1):(1'h1)])) - ((~|($signed(wire56) ?
                      (wire67 ?
                          wire55 : (8'hb4)) : (-wire55))) < ((~$signed(reg59)) ?
                      (reg63[(1'h0):(1'h0)] <<< (~wire65)) : reg64[(1'h0):(1'h0)])));
  assign wire69 = (($unsigned((~(reg59 >>> reg63))) ?
                      $signed($signed(wire57)) : $signed(((wire66 | (8'ha0)) ?
                          (wire55 > wire67) : $signed(reg59)))) ^ wire67[(2'h3):(2'h2)]);
  assign wire70 = (8'hb9);
endmodule
