module top
#(parameter param130 = ({{(~&((8'hbc) && (8'hb9)))}} ? ((|({(8'hac), (8'ha2)} >>> (^(8'hb0)))) ? (((^(8'ha4)) == (^(8'haa))) ? (|{(8'hbd), (8'h9d)}) : (((8'hba) ^~ (8'ha7)) ? (+(8'hb7)) : {(8'had)})) : (({(8'ha1)} < ((8'ha6) ? (8'hbc) : (8'h9e))) ? {{(8'ha2), (8'ha4)}, ((8'hbb) ? (8'ha7) : (8'h9e))} : {((8'h9d) <= (8'hbd))})) : (((-((8'hbb) > (8'h9f))) ? (|((8'h9f) ^ (7'h43))) : ((~(8'h9f)) ? ((8'hb5) < (8'hb3)) : (&(8'h9c)))) >> ((((8'ha3) >= (8'hb8)) ? ((8'h9d) ? (8'hbc) : (8'hb3)) : (~|(8'hb7))) <= (8'ha5)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire123;
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({(($unsigned(wire0) ?
                  (^wire1) : (wire1 ? wire3 : wire2)) ?
              (8'hb2) : ($unsigned(wire1) ? wire3 : {wire3, wire3})),
          wire1});
      reg5 <= ($signed(wire1[(2'h2):(1'h1)]) ?
          ({wire3} ?
              $unsigned(((~&wire3) - wire0)) : wire0[(2'h2):(2'h2)]) : wire1);
    end
  module6 #() modinst124 (wire123, clk, wire3, wire2, wire0, reg5, reg4);
  assign wire125 = (((wire2 ? wire3[(4'ha):(4'h9)] : wire0[(3'h7):(3'h6)]) ?
                           $unsigned($unsigned({wire123})) : wire3[(2'h3):(1'h0)]) ?
                       {(($signed(wire1) * reg4) ?
                               ($signed(wire3) ?
                                   $signed((8'hb0)) : (&wire0)) : (|wire1[(2'h2):(2'h2)]))} : $signed(wire1[(1'h0):(1'h0)]));
  assign wire126 = $signed($signed((~|$unsigned((reg4 ? wire2 : reg5)))));
  assign wire127 = $signed(($signed(wire123[(3'h6):(1'h1)]) ^ wire0[(3'h6):(3'h4)]));
  assign wire128 = wire125[(1'h1):(1'h0)];
  assign wire129 = wire1[(2'h2):(1'h1)];
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire67;
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire121,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 wire13,
                 wire15,
                 wire16,
                 wire67,
                 reg75,
                 reg74,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg14,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire10[(4'hf):(3'h6)];
    end
  assign wire13 = wire10;
  always
    @(posedge clk) begin
      reg14 <= (^($unsigned(wire8) - wire10));
    end
  assign wire15 = wire7;
  assign wire16 = reg14[(2'h2):(1'h1)];
  module17 #() modinst68 (wire67, clk, reg12, reg14, wire10, wire15, wire8);
  always
    @(posedge clk) begin
      reg69 <= (8'hb1);
      reg70 <= ($unsigned((|$unsigned({wire7}))) ?
          $signed($unsigned({(-wire10),
              $unsigned(reg69)})) : ($unsigned({$signed(wire16)}) >> $unsigned((^{wire10,
              wire8}))));
      reg71 <= $unsigned(wire11[(3'h4):(3'h4)]);
      reg72 <= reg71[(1'h1):(1'h0)];
    end
  assign wire73 = (($unsigned((8'hb9)) ? reg69[(2'h2):(1'h0)] : reg72) ?
                      wire9[(1'h0):(1'h0)] : ((8'hbb) >>> $signed(($signed(wire13) >>> (&wire15)))));
  always
    @(posedge clk) begin
      reg74 <= wire67;
      reg75 <= (!($unsigned(wire7[(1'h0):(1'h0)]) != reg70));
    end
  assign wire76 = wire13;
  assign wire77 = $unsigned($unsigned(({((8'hb7) ? reg70 : wire10),
                          $unsigned(wire15)} ?
                      (8'hb2) : (wire13 ? wire10 : reg71[(3'h5):(2'h2)]))));
  assign wire78 = $signed(reg71);
  assign wire79 = $signed($signed($unsigned(((!wire67) ? reg12 : reg12))));
  assign wire80 = $signed({{(+(reg74 <<< reg72))}, reg69});
  assign wire81 = wire8[(4'hf):(3'h4)];
  module82 #() modinst122 (wire121, clk, reg70, wire15, wire78, reg12);
endmodule

module module82
#(parameter param119 = ((({{(8'ha5)}, (8'hbe)} << (((8'hb5) + (8'haa)) * (-(8'hbd)))) ? ((((8'ha1) ? (8'ha3) : (8'hb8)) ? (7'h41) : ((8'hb8) ^~ (8'hbe))) ? (&(!(8'hba))) : (~|((8'ha3) ? (8'hbc) : (8'h9c)))) : ({((8'hba) ? (8'h9f) : (8'hb6))} ? (((8'haa) | (8'hba)) >> (8'ha4)) : (&((7'h43) - (8'hbd))))) <<< (|((8'h9d) ? ({(8'had)} ? ((8'hb9) ? (8'hbd) : (8'ha9)) : ((8'ha1) || (8'ha1))) : (((8'ha8) ? (8'ha7) : (8'hb2)) ? ((8'hb4) > (8'hbc)) : {(8'ha1), (8'hb7)})))), 
parameter param120 = param119)
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire86;
  input wire signed [(4'h8):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  input wire [(4'ha):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire89,
                 wire88,
                 wire87,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire87 = wire85;
  assign wire88 = wire85;
  assign wire89 = wire84;
  always
    @(posedge clk) begin
      reg90 <= ((+wire86) ~^ $signed($signed(($signed(wire84) + $signed((8'had))))));
      reg91 <= wire85[(4'h8):(2'h3)];
      reg92 <= (reg90[(1'h0):(1'h0)] ?
          wire88[(4'h8):(3'h5)] : $unsigned(((~^$signed(wire85)) ?
              $signed($signed((8'hb6))) : {$signed(wire83),
                  $signed((7'h40))})));
      reg93 <= (~^(wire87 ?
          $unsigned((!(reg91 && wire85))) : (~|$signed(reg90[(2'h3):(1'h1)]))));
      reg94 <= {(+$signed(reg90[(3'h4):(1'h1)]))};
    end
  always
    @(posedge clk) begin
      if ($signed(reg90[(2'h3):(2'h2)]))
        begin
          reg95 <= (wire84[(3'h7):(2'h2)] & (~reg92));
          reg96 <= ($unsigned((~&reg93)) ?
              (wire84 & reg93[(1'h0):(1'h0)]) : ((reg93[(3'h5):(3'h4)] & (&(reg95 ?
                  reg92 : (8'h9c)))) + $unsigned(reg91[(4'hd):(4'hc)])));
          reg97 <= (8'had);
          reg98 <= {reg97, (~reg93[(4'hb):(3'h6)])};
        end
      else
        begin
          reg95 <= $signed(((8'hb2) ? (-(~^{(8'hb2), reg90})) : reg94));
        end
    end
  assign wire99 = {({$signed($unsigned(reg92))} <= (^reg98))};
  assign wire100 = wire99;
  assign wire101 = (($signed((!(~|wire86))) ?
                       $unsigned(wire100[(4'he):(4'h8)]) : (wire99 ~^ $unsigned((wire86 ?
                           reg94 : (8'ha8))))) < $unsigned((|reg93[(2'h2):(2'h2)])));
  assign wire102 = wire101[(3'h4):(1'h1)];
  assign wire103 = wire100;
  assign wire104 = (~&((wire89[(1'h0):(1'h0)] > (reg95[(1'h0):(1'h0)] != (8'hb8))) && (|$signed((wire86 == reg93)))));
  assign wire105 = ((reg92[(4'h8):(1'h1)] >> reg92) <= $signed(reg96[(2'h2):(1'h0)]));
  assign wire106 = $unsigned((~^({(8'hba)} ?
                       wire86 : ($unsigned(wire101) | wire99))));
  assign wire107 = (wire100 ? $unsigned(wire99) : (&reg91));
  assign wire108 = $unsigned($signed(wire105));
  assign wire109 = $unsigned((~|wire105[(4'hf):(4'h9)]));
  always
    @(posedge clk) begin
      reg110 <= $signed(wire87[(1'h1):(1'h0)]);
      if (reg93)
        begin
          reg111 <= (($unsigned(({reg92, reg97} ?
                  {reg93, wire109} : $unsigned(wire109))) ?
              reg97[(2'h2):(1'h1)] : reg90[(3'h4):(1'h0)]) <= $unsigned($signed($signed($signed(reg90)))));
        end
      else
        begin
          reg111 <= (reg90[(2'h2):(1'h1)] ?
              $signed($unsigned($unsigned(wire84))) : wire83);
          reg112 <= reg92[(3'h4):(2'h3)];
          if (wire104)
            begin
              reg113 <= wire86[(1'h1):(1'h1)];
              reg114 <= (8'hb9);
            end
          else
            begin
              reg113 <= reg113[(3'h4):(1'h1)];
            end
          reg115 <= (!$signed(wire99[(4'hb):(3'h7)]));
        end
    end
  assign wire116 = ($unsigned((!{(|(8'hac)),
                       $signed((8'hab))})) | {{wire100[(5'h10):(4'ha)],
                           {reg94[(3'h7):(2'h2)]}},
                       ((&{reg90}) ?
                           {$signed((8'h9d)),
                               reg91[(4'hd):(4'hd)]} : reg90[(2'h3):(2'h3)])});
  assign wire117 = {{reg92,
                           $unsigned((wire100[(1'h1):(1'h1)] >= (wire84 ?
                               (8'h9f) : reg112)))}};
  assign wire118 = $unsigned(($unsigned(reg94) == {(~wire86[(3'h7):(3'h6)])}));
endmodule

module module17
#(parameter param66 = (~^({(&((8'ha9) << (8'hae)))} ? ({{(8'haf)}} <<< (((8'ha1) ? (7'h41) : (8'hb5)) - (~(8'ha8)))) : (~(-(~|(7'h44)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h22e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire42,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire23 = $unsigned(({wire21[(3'h7):(3'h5)],
                      $unsigned((wire22 ? wire21 : wire20))} ^ wire22));
  assign wire24 = (~&wire19[(4'hb):(2'h2)]);
  assign wire25 = $signed((8'ha5));
  assign wire26 = (wire23[(2'h3):(2'h3)] ?
                      (-wire19[(4'h8):(1'h1)]) : (~&{((+wire19) ?
                              $signed(wire23) : $signed(wire24)),
                          (^wire19)}));
  assign wire27 = (7'h44);
  always
    @(posedge clk) begin
      if ((!wire20))
        begin
          reg28 <= wire19[(4'hd):(3'h4)];
          reg29 <= $signed($unsigned(((~wire23) ?
              $signed($unsigned(wire24)) : {(wire22 ? wire18 : wire21)})));
          reg30 <= {{$signed(wire18), reg28},
              ((wire23[(1'h1):(1'h1)] ?
                  wire20 : $signed($unsigned(wire19))) == ((&wire23) ?
                  (|(+wire19)) : ({wire27} > (~&wire24))))};
        end
      else
        begin
          reg28 <= ((((^~(wire22 >> wire24)) > (+wire23[(1'h0):(1'h0)])) ?
              wire27 : $unsigned(((wire21 ?
                  reg30 : wire19) && reg29[(2'h3):(2'h2)]))) == (-$signed($unsigned((wire24 ?
              wire23 : (7'h44))))));
          if (($signed($unsigned($unsigned($unsigned(wire19)))) || ((8'ha2) > $signed((+reg28)))))
            begin
              reg29 <= $signed($unsigned(wire18));
              reg30 <= (^~$signed({$signed(wire21[(3'h5):(2'h3)]),
                  (-(!wire22))}));
              reg31 <= {wire23,
                  ((((~^wire26) ?
                          wire25[(3'h5):(2'h2)] : (wire19 ? wire25 : wire24)) ?
                      wire26[(1'h0):(1'h0)] : wire21) << $signed($signed($unsigned(wire18))))};
            end
          else
            begin
              reg29 <= wire19[(3'h7):(3'h7)];
              reg30 <= wire21[(3'h5):(1'h0)];
              reg31 <= (wire21 ? wire27[(4'ha):(4'h8)] : wire23);
              reg32 <= ((reg31 ?
                  wire25[(1'h0):(1'h0)] : $signed((^wire20))) - (~(!($signed(wire19) ?
                  (reg30 ? wire23 : wire25) : (wire21 ? wire18 : wire25)))));
            end
          reg33 <= ((|wire21[(4'hd):(4'h8)]) ?
              (wire18 ?
                  $signed(($signed(wire18) ?
                      wire25[(3'h5):(2'h3)] : (7'h40))) : $unsigned($unsigned($unsigned(wire22)))) : ({(^(^~reg32)),
                  $signed((8'hac))} ^ (((^wire21) ?
                  (wire18 ?
                      wire19 : wire27) : (~wire18)) >= $unsigned(wire19[(4'he):(2'h2)]))));
          reg34 <= wire23[(2'h2):(2'h2)];
        end
      if ({((((&wire23) + {reg30, reg28}) ? reg32[(3'h4):(3'h4)] : wire18) ?
              wire22[(1'h0):(1'h0)] : reg31[(1'h1):(1'h1)]),
          reg30[(3'h5):(2'h2)]})
        begin
          reg35 <= (reg33 ?
              {($signed(wire25[(4'hc):(1'h1)]) ~^ $signed($unsigned(wire21))),
                  (reg34[(3'h4):(2'h3)] ?
                      $unsigned((~reg28)) : (wire18 ?
                          (reg33 ?
                              (8'hb8) : wire19) : $unsigned(reg30)))} : ((~&wire23[(2'h2):(1'h1)]) <= $signed(reg29[(4'hc):(3'h6)])));
          reg36 <= (wire25[(1'h0):(1'h0)] ? reg28 : wire27);
          reg37 <= {(reg36[(4'h8):(3'h7)] >> $signed((7'h41))),
              reg34[(3'h4):(2'h2)]};
          reg38 <= reg35[(4'h9):(3'h6)];
          reg39 <= $signed($unsigned({wire20}));
        end
      else
        begin
          reg35 <= ($unsigned(wire25) || (($unsigned((^reg35)) || {reg33,
                  (8'hb9)}) ?
              ($signed(((7'h42) ?
                  reg31 : wire20)) ^~ ($signed(wire20) != $signed(wire19))) : wire22[(4'he):(2'h3)]));
          reg36 <= $signed(($signed($unsigned((~|wire21))) >= (reg32 ?
              reg37[(5'h11):(4'hd)] : (8'ha9))));
        end
      reg40 <= (+($signed(({reg37} <<< $unsigned(reg30))) ?
          ((((7'h43) < reg31) ?
              (+wire25) : $signed(reg34)) | $unsigned((reg39 & reg28))) : {$signed((wire26 ?
                  reg33 : reg38)),
              ((wire27 ? wire23 : wire24) ?
                  {reg35, reg34} : (reg32 & reg32))}));
      reg41 <= reg31;
    end
  assign wire42 = wire24;
  always
    @(posedge clk) begin
      reg43 <= $unsigned($signed(reg28));
      reg44 <= wire27;
      reg45 <= wire18;
      reg46 <= $unsigned($unsigned(reg40[(4'h8):(1'h0)]));
    end
  assign wire47 = reg41[(2'h3):(2'h3)];
  assign wire48 = $signed($unsigned((reg30[(2'h2):(2'h2)] ?
                      reg41[(2'h2):(1'h1)] : $signed({wire21, (8'hb9)}))));
  assign wire49 = reg35[(3'h6):(2'h2)];
  assign wire50 = $signed($signed(((|(8'haa)) ?
                      wire49 : {reg38[(2'h2):(2'h2)], reg34[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg51 <= $signed((~wire24[(4'h8):(2'h3)]));
      reg52 <= wire20;
      reg53 <= reg45;
      reg54 <= reg45[(4'h9):(3'h4)];
      reg55 <= ($unsigned({(|$signed(reg33)), $unsigned(wire25)}) ?
          wire19[(4'h8):(3'h6)] : (~&reg46));
    end
  assign wire56 = (+wire21);
  assign wire57 = $signed(wire47);
  assign wire58 = reg54[(4'h9):(3'h7)];
  assign wire59 = (((&reg54[(3'h6):(3'h6)]) <= wire26[(1'h0):(1'h0)]) ?
                      $unsigned($signed(reg45)) : $signed((^reg46[(5'h13):(3'h5)])));
  assign wire60 = wire20;
  assign wire61 = $signed(((!(~^(&reg53))) - reg35[(3'h4):(3'h4)]));
  assign wire62 = $signed($unsigned(wire61[(4'ha):(1'h0)]));
  assign wire63 = ($signed(reg31) < ({wire24, (~(~|reg31))} + ((~^(wire47 ?
                      (8'ha8) : reg34)) * wire21)));
  assign wire64 = $unsigned((wire23[(2'h2):(1'h0)] ?
                      $signed(wire49) : ((((8'hb6) * reg30) ?
                          wire22[(4'he):(1'h0)] : (~^reg34)) ^~ {$unsigned(reg55)})));
  assign wire65 = reg53;
endmodule
