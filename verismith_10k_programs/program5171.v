module top
#(parameter param122 = {(8'hac), (!(^~(((8'hb5) >= (8'ha7)) >>> ((8'ha9) & (8'ha0)))))}, 
parameter param123 = param122)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire95;
  assign y = {wire121, wire119, wire59, wire5, wire4, wire61, wire95, (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h1)];
  assign wire5 = (|$unsigned(wire4));
  module6 #() modinst60 (wire59, clk, wire4, wire2, wire1, wire3, wire0);
  assign wire61 = (wire4 << wire1);
  module62 #() modinst96 (.wire64(wire2), .clk(clk), .y(wire95), .wire65(wire3), .wire63(wire0), .wire67(wire61), .wire66(wire1));
  module97 #() modinst120 (wire119, clk, wire95, wire3, wire1, wire2);
  assign wire121 = $unsigned((wire95[(3'h6):(3'h5)] <= (({(7'h43)} ?
                       (wire61 & wire5) : (wire0 ?
                           wire5 : (8'h9d))) - wire95)));
endmodule

module module97  (y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire101;
  input wire signed [(3'h5):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  input wire [(5'h10):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  assign y = {wire118,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire102 = $unsigned((-wire99[(4'h8):(1'h0)]));
  assign wire103 = (!wire101);
  assign wire104 = {(~&(^~($unsigned(wire98) ?
                           $unsigned(wire100) : (+wire101))))};
  assign wire105 = (^~wire101);
  always
    @(posedge clk) begin
      reg106 <= wire99[(5'h12):(4'hd)];
      if ($unsigned((reg106 >= ($signed($unsigned(reg106)) ?
          $unsigned(wire102[(1'h1):(1'h0)]) : $signed(reg106[(3'h4):(1'h0)])))))
        begin
          reg107 <= ($signed((wire104[(2'h2):(1'h0)] ?
                  (8'hb4) : (-$signed(wire103)))) ?
              wire99 : (&{(!$unsigned(wire101)), wire101[(1'h0):(1'h0)]}));
          reg108 <= (&(($unsigned(((8'hbe) != (7'h44))) ?
              wire104[(3'h6):(2'h3)] : wire101) <= ((^~(wire101 ?
              wire104 : (8'had))) << $unsigned({wire99}))));
          if (wire99)
            begin
              reg109 <= wire101[(2'h2):(2'h2)];
              reg110 <= $signed((^(((reg109 ? reg109 : wire105) ?
                      reg106[(3'h4):(3'h4)] : (8'haa)) ?
                  {(8'hb7)} : (reg108 ?
                      (reg109 ? reg109 : reg106) : (reg107 ?
                          wire102 : wire104)))));
              reg111 <= wire104;
              reg112 <= (wire99 ?
                  (({$signed(wire101), reg106} ?
                          ($unsigned((7'h44)) < (wire102 ?
                              wire98 : wire104)) : $signed($signed(wire98))) ?
                      ($unsigned($unsigned(reg107)) ?
                          wire103 : (wire103[(2'h3):(2'h3)] & ((8'ha6) ?
                              wire99 : wire99))) : {(+$unsigned(reg109)),
                          ((8'haf) && {reg111,
                              reg108})}) : $signed(((-reg110[(1'h0):(1'h0)]) <<< reg108)));
              reg113 <= wire105;
            end
          else
            begin
              reg109 <= (+((($unsigned(wire98) ?
                          (wire101 ? wire99 : (8'hb7)) : {reg108, wire99}) ?
                      reg108 : $signed(reg108[(3'h7):(3'h5)])) ?
                  $signed(reg109[(5'h12):(4'ha)]) : $unsigned($signed(wire103))));
              reg110 <= wire102[(1'h0):(1'h0)];
              reg111 <= reg110[(4'ha):(3'h6)];
              reg112 <= $signed((8'hb6));
            end
          reg114 <= $signed(wire102[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((~(!(&((wire103 != reg113) ?
              reg107[(2'h3):(1'h0)] : (reg109 == reg107))))))
            begin
              reg107 <= ($signed({(reg113[(1'h0):(1'h0)] >>> $unsigned(wire104)),
                  wire102[(3'h4):(3'h4)]}) & ((($unsigned(reg106) << $signed(reg109)) ?
                  (!$unsigned(wire99)) : (8'h9d)) >> reg109));
              reg108 <= ($signed((|((wire103 ?
                  wire104 : reg111) <= wire103))) == wire103[(3'h5):(2'h2)]);
              reg109 <= ((!({reg110,
                  {reg114,
                      reg110}} + reg107)) && $unsigned($unsigned($signed(reg110[(2'h2):(1'h1)]))));
              reg110 <= (~|(($signed($unsigned(wire101)) << wire98[(3'h7):(1'h0)]) && ((wire105[(2'h3):(2'h3)] >>> (reg107 ?
                  reg113 : reg113)) < $unsigned({wire98}))));
              reg111 <= $signed($unsigned($unsigned(reg108)));
            end
          else
            begin
              reg107 <= $unsigned($unsigned((&(8'ha3))));
              reg108 <= (^~wire98);
              reg109 <= (8'ha0);
            end
        end
      reg115 <= $signed({wire100[(3'h4):(2'h3)], wire98[(3'h6):(1'h0)]});
      reg116 <= $unsigned(wire105);
      reg117 <= (8'h9d);
    end
  assign wire118 = (&$signed(reg110[(5'h10):(2'h2)]));
endmodule

module module62
#(parameter param94 = ((~^((((8'hb2) ~^ (8'hb1)) ? ((7'h40) ~^ (8'hb9)) : ((7'h42) ? (8'ha6) : (8'hbf))) ? (((8'hba) ? (8'hb1) : (8'hba)) ? ((8'hba) ? (8'hb9) : (8'ha3)) : ((8'hac) ? (8'hb6) : (8'hb7))) : ({(8'had)} >= {(8'hab), (8'hbb)}))) ? {(^~(-((8'hbd) ? (8'ha1) : (8'hbc))))} : (^~((&((8'hbf) & (8'haa))) & (((8'ha8) ^~ (7'h44)) == ((8'hb8) <= (8'hbe)))))))
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire67;
  input wire signed [(4'h9):(1'h0)] wire66;
  input wire [(4'h9):(1'h0)] wire65;
  input wire signed [(5'h15):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  assign y = {wire93, wire91, wire69, wire68, (1'h0)};
  assign wire68 = (((^~wire65) ^~ wire63[(1'h0):(1'h0)]) > (((wire64 ?
                          (wire65 ?
                              wire63 : wire64) : wire67) ^~ $signed((wire66 ?
                          (8'ha4) : wire66))) ?
                      $signed(((wire65 ?
                          wire64 : wire66) - wire64[(2'h3):(1'h0)])) : wire65));
  assign wire69 = wire68;
  module70 #() modinst92 (wire91, clk, wire67, wire65, wire69, wire68);
  assign wire93 = (wire64[(5'h12):(4'hb)] ?
                      ((~^(wire65[(3'h7):(3'h4)] ?
                              (wire63 ? wire68 : wire69) : (~|wire65))) ?
                          (-{{wire68, wire66},
                              (wire65 << wire69)}) : (wire64[(3'h6):(1'h1)] || wire65)) : (8'hac));
endmodule

module module6
#(parameter param57 = (|({(((8'hb8) != (8'hae)) ? (~(8'ha1)) : (|(8'ha2)))} ? ((^~{(8'hbe), (8'ha5)}) ? (((8'hae) != (8'haf)) >> {(8'hbc)}) : ((^~(8'ha9)) & (~&(8'hb9)))) : (({(8'hac)} ? {(8'hbd), (8'hb7)} : (^(8'hbf))) ? (((8'hae) > (8'hb5)) == ((8'h9e) & (8'haa))) : ({(8'ha4), (8'h9f)} ? (-(8'ha7)) : (&(8'hbb)))))), 
parameter param58 = param57)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  assign y = {wire56,
                 wire54,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = $signed(($unsigned(wire10[(3'h6):(2'h3)]) ?
                      {(^wire11),
                          wire7[(2'h2):(1'h0)]} : (((wire9 <= wire11) | {wire10}) ?
                          (+wire11) : $signed($unsigned(wire9)))));
  assign wire13 = wire9[(4'ha):(4'h9)];
  assign wire14 = ({(8'ha7)} ?
                      $signed(((^(wire11 < wire10)) + (!(wire11 ?
                          wire9 : (7'h43))))) : ((wire10[(5'h11):(4'h8)] ?
                          wire11 : (^(^wire9))) ~^ (({wire8, wire12} ?
                          (wire9 > wire10) : wire8[(1'h0):(1'h0)]) ~^ (8'hba))));
  assign wire15 = $signed((wire12 && $signed((~|wire10))));
  assign wire16 = ((~(($unsigned(wire8) == wire7[(4'hc):(4'ha)]) ?
                          (+(wire13 ? wire13 : wire15)) : wire10)) ?
                      wire7[(4'ha):(1'h1)] : $unsigned((((~&wire14) <<< wire9) ^ $signed(wire11))));
  assign wire17 = $unsigned({(8'hb7)});
  module18 #() modinst55 (.clk(clk), .wire21(wire9), .wire19(wire15), .wire22(wire16), .y(wire54), .wire20(wire12));
  assign wire56 = $signed(((~|wire14[(1'h0):(1'h0)]) != wire7[(4'h9):(1'h1)]));
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire35,
                 wire34,
                 wire33,
                 wire23,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = $signed(($unsigned($unsigned($signed(wire21))) <= $unsigned((((8'hb2) ?
                      wire21 : wire22) ^~ $signed(wire19)))));
  always
    @(posedge clk) begin
      reg24 <= $unsigned($signed(($signed((wire23 == (8'hb9))) ?
          wire22 : ((wire19 | wire21) ?
              $unsigned(wire22) : $signed((8'hbf))))));
      reg25 <= ((~&wire22) ?
          $signed(wire20[(4'h9):(3'h6)]) : {{wire22[(1'h1):(1'h1)],
                  $unsigned((+wire19))}});
      if ({$signed(wire20[(3'h6):(1'h0)])})
        begin
          reg26 <= $signed(wire23);
          reg27 <= (~^reg25);
          reg28 <= ($signed($unsigned((wire23 ~^ (reg25 - reg25)))) ?
              $signed(wire22[(4'he):(1'h0)]) : $signed($signed($unsigned($unsigned((8'hbe))))));
          reg29 <= {(^$unsigned(reg24)), $unsigned(reg24)};
        end
      else
        begin
          if ($unsigned((8'ha4)))
            begin
              reg26 <= (({reg27,
                      $unsigned($signed(wire20))} + reg29[(3'h5):(3'h4)]) ?
                  ((^($unsigned(wire22) >>> (+(8'hab)))) ?
                      $unsigned(reg25) : wire22) : ($signed(reg26) ?
                      reg24[(2'h2):(1'h0)] : (wire21[(3'h4):(1'h1)] ?
                          wire21[(1'h1):(1'h1)] : $unsigned($unsigned(wire23)))));
            end
          else
            begin
              reg26 <= (((+(((8'h9f) ? reg24 : (8'hba)) | $unsigned(reg28))) ?
                      {$unsigned((wire21 << wire21))} : {reg26[(4'hd):(4'hd)]}) ?
                  (wire23 << wire22[(3'h7):(3'h5)]) : (wire21 ?
                      $signed((|(&wire21))) : (({reg28} ?
                          (reg24 <= reg25) : (8'hb3)) | reg28)));
              reg27 <= (+$signed({wire22[(4'hb):(4'h8)]}));
            end
          if ($signed((&((-wire19) ?
              reg27[(3'h5):(2'h2)] : reg29[(2'h2):(1'h1)]))))
            begin
              reg28 <= (~|reg27);
              reg29 <= (~&(reg28[(4'h8):(3'h7)] ~^ reg28[(2'h3):(1'h1)]));
            end
          else
            begin
              reg28 <= $unsigned((&{$unsigned(wire19)}));
            end
          reg30 <= (8'hb8);
        end
      reg31 <= ((reg28[(5'h11):(4'h9)] <= wire19[(3'h6):(1'h1)]) ?
          reg27 : wire22[(4'h9):(4'h8)]);
      reg32 <= wire21;
    end
  assign wire33 = reg31;
  assign wire34 = $unsigned(($signed((8'hb5)) | ($unsigned(((8'hb4) >= reg32)) ~^ (wire23 ?
                      (-reg25) : (reg24 ? reg28 : reg25)))));
  assign wire35 = $unsigned($signed((~^$signed($unsigned(wire33)))));
  always
    @(posedge clk) begin
      reg36 <= reg28[(4'hc):(1'h1)];
      reg37 <= ($signed({$unsigned($unsigned(reg36))}) + (8'hbd));
      reg38 <= ((((^~((8'hbf) ?
          wire20 : reg26)) << reg37[(4'hd):(4'ha)]) ~^ $unsigned((wire33[(5'h13):(4'h8)] ^~ $signed(wire21)))) <= reg28);
      if ($unsigned($signed((wire35[(1'h1):(1'h1)] <<< (~reg32[(2'h3):(1'h0)])))))
        begin
          if (wire23[(3'h7):(1'h0)])
            begin
              reg39 <= {$unsigned(((((8'hae) ? wire21 : reg37) | (reg31 ?
                          reg25 : reg32)) ?
                      (((8'hb8) == wire20) <= {reg26, (8'hb8)}) : {wire35}))};
              reg40 <= {((wire20[(5'h11):(1'h0)] != wire21[(1'h1):(1'h1)]) ?
                      {$unsigned($unsigned(wire33))} : wire22[(4'he):(4'h9)])};
              reg41 <= reg32[(3'h7):(2'h2)];
              reg42 <= $signed(((8'hb0) ? reg30 : wire33));
              reg43 <= {(reg42 ? wire22[(4'hb):(4'h9)] : reg26[(4'hc):(3'h4)])};
            end
          else
            begin
              reg39 <= $signed(reg26[(4'h8):(1'h1)]);
              reg40 <= ($unsigned(wire19[(4'h8):(3'h4)]) - $unsigned(reg26));
            end
        end
      else
        begin
          reg39 <= (~&(reg36[(5'h10):(3'h4)] | {$signed((~&reg41)), reg42}));
          reg40 <= reg30[(4'h9):(1'h0)];
        end
    end
  assign wire44 = $unsigned((($signed($signed(reg41)) ?
                          {$unsigned(wire21)} : {reg29}) ?
                      wire21 : reg40[(2'h3):(2'h2)]));
  assign wire45 = reg37[(5'h12):(4'h9)];
  assign wire46 = {(($unsigned({reg42}) ?
                              reg37[(4'h8):(2'h2)] : ((-reg32) & reg40[(3'h6):(1'h1)])) ?
                          (wire44[(2'h2):(2'h2)] ?
                              reg32 : ((reg36 + wire35) ?
                                  $signed(wire35) : reg39)) : wire20[(4'hb):(3'h6)]),
                      ($signed(((reg42 == reg24) ?
                          $signed(reg32) : $unsigned((8'hae)))) >>> (($unsigned(reg39) ?
                              $unsigned(reg39) : (~|reg38)) ?
                          (reg24 != ((8'hbd) ?
                              reg43 : wire22)) : (-(~&wire33))))};
  assign wire47 = {(^({$unsigned(wire19)} == wire44[(2'h3):(2'h3)]))};
  assign wire48 = (~&({wire23[(4'hb):(2'h2)], $signed($unsigned(reg38))} ?
                      (reg25 ?
                          ((wire20 + reg24) < $signed((8'h9f))) : (8'hb3)) : {(~|(^~wire34)),
                          wire44}));
  assign wire49 = reg24[(1'h1):(1'h1)];
  assign wire50 = (~$unsigned($signed((~&(reg39 ? reg42 : wire49)))));
  assign wire51 = (reg38 ?
                      $unsigned(wire44[(1'h0):(1'h0)]) : ($unsigned($unsigned($signed(wire49))) ?
                          (~|$unsigned(wire20[(4'hd):(3'h4)])) : ((8'hb8) == $unsigned(wire44))));
  assign wire52 = (!wire51);
  assign wire53 = ((~reg24) || (&$signed({$unsigned(wire46)})));
endmodule

module module70
#(parameter param90 = (!(~&((((8'hbf) ? (8'h9e) : (8'hba)) ? ((8'hbb) ? (8'haf) : (8'ha5)) : (~^(8'hb6))) ? (((8'ha5) ? (8'ha3) : (8'ha9)) >> ((7'h44) ? (8'hbf) : (8'hb5))) : ((~(8'haa)) ? (8'ha7) : ((7'h44) ? (8'hbd) : (8'ha8)))))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire signed [(4'ha):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire75;
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 reg86,
                 reg85,
                 reg84,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = (~^(~^(((wire72 | wire71) | wire71[(3'h4):(3'h4)]) - $signed($unsigned(wire74)))));
  always
    @(posedge clk) begin
      reg76 <= (wire73 ?
          wire71[(3'h4):(3'h4)] : $signed($signed(wire74[(3'h7):(3'h7)])));
      reg77 <= (((&(+(reg76 - wire73))) ?
          (~&wire75[(3'h4):(1'h1)]) : ({reg76[(4'ha):(3'h4)],
              reg76} <<< reg76)) <<< ((wire74 || ($unsigned(reg76) | wire72)) ?
          (^~($signed((8'ha6)) > wire75[(3'h5):(3'h4)])) : wire74[(2'h3):(2'h3)]));
      reg78 <= $signed(((((wire74 * wire73) << $signed(reg76)) != (-(wire72 < (7'h44)))) && (8'hb6)));
      reg79 <= $signed((7'h40));
    end
  assign wire80 = ({(~&reg76)} ?
                      wire72[(2'h3):(2'h3)] : $unsigned($unsigned(reg78)));
  assign wire81 = $unsigned(($unsigned((-(-reg77))) - ($unsigned((wire71 ?
                          (8'hb7) : (8'ha9))) ?
                      wire72 : $signed((wire74 ^~ reg78)))));
  assign wire82 = (((~^($unsigned(reg77) ?
                      {reg78} : ((8'hae) ?
                          reg79 : wire75))) | wire73) - $unsigned((~&(&(reg79 ?
                      wire80 : wire74)))));
  assign wire83 = $signed(($signed((reg79[(1'h0):(1'h0)] ~^ ((7'h44) <<< wire72))) ?
                      $signed(wire71[(3'h6):(1'h1)]) : $signed($unsigned({wire72,
                          wire72}))));
  always
    @(posedge clk) begin
      if (wire83)
        begin
          reg84 <= ($unsigned(reg77) ~^ $unsigned($unsigned({wire75[(1'h0):(1'h0)]})));
          reg85 <= {(reg78 ?
                  $unsigned(reg84) : (~|(wire82 | ((8'hb2) ?
                      wire75 : (8'hb3)))))};
        end
      else
        begin
          reg84 <= (-(wire80[(1'h1):(1'h0)] | reg85[(4'h8):(3'h5)]));
          reg85 <= reg84;
        end
      reg86 <= reg84;
    end
  assign wire87 = wire72[(4'h9):(3'h6)];
  assign wire88 = wire81;
  assign wire89 = (~^wire73);
endmodule
