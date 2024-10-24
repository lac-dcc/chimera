module top
#(parameter param112 = ((~|((((8'hb3) ^ (7'h44)) >= ((8'hb6) ? (8'hba) : (8'ha4))) && ({(8'h9d)} & (~&(8'hb5))))) ? ({(((8'hb2) ? (8'ha5) : (8'h9e)) ? {(8'hba)} : ((8'ha2) ? (8'hb7) : (8'hbd))), (((8'ha6) || (8'hbc)) ? ((8'ha9) >= (8'had)) : (~(8'ha5)))} ? (((+(7'h41)) & ((8'h9f) ^ (8'ha8))) ^~ (((7'h44) ? (7'h44) : (8'h9e)) <= ((8'hb4) ? (8'ha6) : (7'h40)))) : ((!((8'hab) ? (8'hbb) : (7'h41))) * (^~(+(8'hb9))))) : ((!(8'hb3)) ? (((~&(8'ha4)) < {(8'ha4)}) | (!{(7'h44), (8'haf)})) : ((~|((8'hae) + (8'hba))) ^~ (((8'ha7) ? (8'hbc) : (8'hb8)) ? (~&(8'hb8)) : ((8'hb4) && (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire108;
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire108,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire0[(4'hd):(4'hc)])))
        begin
          reg4 <= {wire3};
          if ((+$signed($unsigned(({wire0} >> $unsigned(reg4))))))
            begin
              reg5 <= wire3;
            end
          else
            begin
              reg5 <= ((8'ha5) << {reg5[(4'hb):(4'h8)]});
              reg6 <= (8'h9e);
              reg7 <= (!(~^{$signed({wire0, wire2})}));
            end
          reg8 <= (8'hb7);
          if (wire0[(4'hb):(4'hb)])
            begin
              reg9 <= reg4[(5'h10):(5'h10)];
              reg10 <= $signed($signed({reg9, (wire2 ^ {reg4, reg5})}));
              reg11 <= ($unsigned($signed(((reg6 > wire2) ? (-reg6) : wire3))) ?
                  (-(^((reg9 ?
                      reg6 : wire1) == ((8'ha1) != wire1)))) : (-$signed({(&reg10),
                      (-reg10)})));
            end
          else
            begin
              reg9 <= wire3[(2'h3):(1'h0)];
              reg10 <= $signed((($unsigned((reg5 * reg10)) < (wire0[(4'ha):(2'h2)] ?
                      $unsigned(wire1) : $signed(wire0))) ?
                  ({(wire2 ? reg10 : (8'hb3)), $signed(reg11)} ?
                      $unsigned($unsigned(reg6)) : wire0[(4'h8):(3'h6)]) : $signed(reg9)));
              reg11 <= reg8[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg4 <= reg5[(4'hd):(4'hd)];
          reg5 <= reg7[(3'h4):(1'h0)];
          reg6 <= (((((^~(8'hb2)) ? (wire2 && reg6) : reg4) ?
                  (8'hb2) : {$unsigned(wire3)}) >>> reg8) ?
              {(reg10 < reg5[(2'h3):(2'h3)]),
                  $unsigned(((wire2 + reg9) ?
                      (reg10 ? (8'ha1) : wire2) : reg7))} : reg9);
          reg7 <= $unsigned((wire3[(3'h6):(2'h2)] ?
              $signed(($signed(reg7) ?
                  (reg8 <= reg10) : (reg10 * (8'hab)))) : {({reg7} ?
                      $signed(reg6) : $signed(wire2))}));
          reg8 <= reg10;
        end
      reg12 <= $unsigned(reg11);
      reg13 <= ($unsigned((wire1[(4'hc):(1'h0)] ? $signed((|wire0)) : reg8)) ?
          $signed($signed($signed($unsigned(reg6)))) : {((wire2 ^~ wire2[(1'h1):(1'h0)]) ?
                  reg10 : (-((7'h43) ? wire1 : reg5))),
              {reg9, $unsigned((reg10 ? reg8 : (8'ha7)))}});
      reg14 <= (~|($unsigned((&$signed(wire0))) ?
          reg6 : $signed($unsigned($signed((8'hbc))))));
    end
  assign wire15 = reg6;
  assign wire16 = $unsigned($signed((wire15[(4'h8):(3'h4)] ?
                      wire0[(3'h5):(3'h5)] : ((reg9 == (8'hba)) ?
                          (wire0 <<< wire3) : (7'h44)))));
  assign wire17 = $unsigned(reg7[(2'h3):(1'h0)]);
  assign wire18 = $signed((reg4 ?
                      $unsigned($signed($signed(reg14))) : ((^~$unsigned((8'hbf))) ?
                          ((reg5 ~^ reg10) >> ((8'ha8) ?
                              reg4 : wire16)) : ((~|wire3) > $unsigned(reg7)))));
  assign wire19 = (^(reg9 ?
                      (((wire2 >> reg10) ?
                          wire18[(4'ha):(1'h0)] : {(8'ha6),
                              reg11}) ^ (wire1[(4'hd):(4'hb)] < (reg10 ?
                          wire15 : (8'hb6)))) : wire18));
  module20 #() modinst109 (wire108, clk, wire19, reg5, reg10, reg11);
  assign wire110 = $unsigned(({$unsigned((reg8 ? reg6 : reg8)),
                           {((8'ha7) ? wire1 : wire0), reg10[(3'h6):(2'h3)]}} ?
                       wire1[(3'h5):(2'h2)] : (((^~(8'ha0)) && (reg13 | reg5)) ^ ($signed(wire2) ~^ $unsigned(wire16)))));
  assign wire111 = (reg10 == (~^wire3));
endmodule

module module20
#(parameter param106 = ({{(^((8'ha0) != (8'hae)))}} << (((~|((8'haa) < (7'h43))) >>> (8'ha7)) ? {((8'hb6) ? (^~(8'hb2)) : (|(8'hbe))), (((8'hb9) ^ (8'ha3)) + ((8'ha9) * (8'hae)))} : (({(8'hb5)} ~^ ((7'h40) && (8'h9f))) ? (~(+(8'hb7))) : (((8'h9c) ? (8'ha0) : (7'h43)) && {(8'ha7)})))), 
parameter param107 = {(+((!param106) + (&(8'h9c))))})
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire86;
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  assign y = {wire105, wire104, wire102, wire86, reg89, reg88, (1'h0)};
  module25 #() modinst87 (.wire28(wire23), .y(wire86), .clk(clk), .wire27(wire21), .wire29(wire24), .wire26(wire22));
  always
    @(posedge clk) begin
      reg88 <= wire24[(1'h1):(1'h1)];
      reg89 <= wire21[(1'h0):(1'h0)];
    end
  module90 #() modinst103 (.clk(clk), .wire94(wire23), .wire92(wire21), .y(wire102), .wire93(reg88), .wire91(reg89));
  assign wire104 = (~|({reg89[(2'h2):(2'h2)], $signed($unsigned(reg89))} ?
                       (+wire102) : $unsigned(((wire22 ? wire21 : reg88) ?
                           reg88 : $unsigned(reg89)))));
  assign wire105 = $unsigned($unsigned(wire24));
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire94;
  input wire [(5'h15):(1'h0)] wire93;
  input wire [(5'h12):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  assign y = {wire101, wire100, wire99, wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = ((~|{(wire91[(2'h2):(1'h1)] + wire91[(1'h0):(1'h0)])}) ?
                      (({wire93[(5'h10):(4'hf)],
                              wire92[(5'h11):(1'h0)]} ~^ ((wire94 && wire91) ?
                              wire94[(2'h2):(1'h1)] : (wire94 != wire93))) ?
                          (~$unsigned({wire93})) : wire92) : wire93);
  assign wire96 = $unsigned((wire93 + (8'ha6)));
  assign wire97 = wire94;
  assign wire98 = ($signed(((-((7'h42) - wire95)) | $unsigned($signed(wire96)))) ?
                      (wire97 ?
                          ($signed((~wire91)) ?
                              wire94[(1'h0):(1'h0)] : (^~(8'ha1))) : ($signed((~|(8'hbc))) ?
                              wire97 : (8'ha4))) : $signed({$signed({wire94,
                              (8'hb0)})}));
  assign wire99 = ($signed(wire92) > (wire93[(1'h1):(1'h1)] - ($unsigned((wire95 ?
                      wire97 : wire97)) == wire92)));
  assign wire100 = (wire93 ? $unsigned((~&{wire92[(3'h5):(3'h4)]})) : wire94);
  assign wire101 = (wire91[(1'h1):(1'h0)] ?
                       wire100 : $signed((((wire93 | wire97) ~^ $signed(wire92)) >>> $unsigned($unsigned((8'ha9))))));
endmodule

module module25
#(parameter param84 = ({(({(8'hb9), (7'h43)} ? ((8'hb1) ? (8'hb8) : (8'ha2)) : {(7'h43), (8'had)}) ? (8'ha6) : (&(-(8'ha3)))), ({((8'ha1) ? (8'haa) : (8'hba)), ((8'h9c) > (8'ha6))} ? (((8'hb6) == (8'hac)) ? (8'ha0) : (8'hb4)) : ({(8'ha5), (8'ha4)} ? ((8'ha9) <<< (7'h42)) : ((8'ha6) ? (8'hb0) : (8'haa))))} >= (~((!(~^(7'h42))) * {((7'h43) ? (8'ha4) : (8'hb1)), ((8'h9d) ~^ (8'haf))}))), 
parameter param85 = ((~&(~{param84})) ^ (~^(~|((param84 ? param84 : (8'hb9)) ? (-param84) : (param84 ~^ param84))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(4'h9):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  assign y = {wire83,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 wire48,
                 wire47,
                 wire31,
                 wire30,
                 reg82,
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
                 reg69,
                 reg68,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire30 = $signed(wire27[(4'ha):(3'h4)]);
  assign wire31 = $signed({wire26, wire27});
  always
    @(posedge clk) begin
      if ($unsigned(wire26))
        begin
          reg32 <= ((wire27 ?
                  wire28[(4'h8):(3'h6)] : {{wire28[(3'h6):(2'h3)],
                          $unsigned(wire29)},
                      $signed((wire29 ? wire28 : wire30))}) ?
              (-$unsigned((&(~|wire31)))) : (|(wire28 ?
                  ((wire31 ^~ (8'hbf)) > ((8'h9f) ?
                      wire27 : (8'hb3))) : ($unsigned(wire26) <= wire26[(4'h9):(1'h1)]))));
        end
      else
        begin
          if ($signed(wire27))
            begin
              reg32 <= (8'haa);
              reg33 <= wire28;
              reg34 <= reg33;
              reg35 <= $signed(reg34);
              reg36 <= $signed(reg33[(4'he):(4'h9)]);
            end
          else
            begin
              reg32 <= reg35[(1'h0):(1'h0)];
              reg33 <= $signed((((7'h40) ?
                      $signed($signed(reg34)) : ($unsigned(wire31) ?
                          (wire31 > wire30) : {(7'h43), reg34})) ?
                  ((8'hbc) * $unsigned(reg36[(4'h9):(3'h6)])) : reg36));
              reg34 <= $unsigned(((~|$unsigned($unsigned(wire27))) ~^ $signed(($signed(reg32) && wire27[(2'h2):(1'h1)]))));
            end
          reg37 <= (((reg32 ?
              wire29[(1'h0):(1'h0)] : wire30) >> $signed($signed((reg36 * wire26)))) * ((8'hba) ~^ ((|(reg34 & wire26)) << reg33[(5'h11):(2'h3)])));
          reg38 <= ({(+{$unsigned(wire30), $unsigned((8'ha1))}),
                  $signed($signed($signed(reg36)))} ?
              wire29[(1'h0):(1'h0)] : $unsigned(wire31[(2'h2):(1'h1)]));
          if ({(($unsigned(reg38) ~^ ({reg34} && (!reg36))) ?
                  wire26[(1'h0):(1'h0)] : (($unsigned(reg34) ^ wire29) == ((8'ha1) ~^ $unsigned(wire27)))),
              ({reg33, wire28[(1'h1):(1'h0)]} ?
                  reg36 : $signed((^(^~wire29))))})
            begin
              reg39 <= $unsigned($unsigned((($signed(wire27) >> reg33) ?
                  reg34[(4'hb):(2'h2)] : ((wire28 ? wire31 : reg37) ?
                      $unsigned(wire26) : $unsigned(wire27)))));
              reg40 <= reg37;
              reg41 <= $unsigned({(reg37 ?
                      (~&$unsigned(reg35)) : $signed(reg32))});
            end
          else
            begin
              reg39 <= reg33;
              reg40 <= ($unsigned({{reg34}}) & wire30[(3'h7):(2'h3)]);
              reg41 <= (8'haa);
            end
          reg42 <= $signed({wire28, reg34});
        end
      reg43 <= $unsigned(wire26);
      reg44 <= reg38[(3'h6):(2'h2)];
      if ($signed(reg40[(3'h5):(3'h4)]))
        begin
          reg45 <= (^reg44);
          reg46 <= ((($unsigned($signed(reg32)) ?
                      ($unsigned(reg39) ?
                          ((8'ha9) >= reg39) : reg41[(1'h1):(1'h1)]) : ($signed(reg36) && (~|reg39))) ?
                  reg33[(5'h11):(3'h6)] : ((-(reg44 ? reg40 : reg41)) ?
                      $unsigned($signed((7'h42))) : ((reg43 ?
                          wire30 : reg33) & reg33[(1'h1):(1'h0)]))) ?
              ((8'ha3) ?
                  (~((reg33 ? wire31 : (8'hbd)) ?
                      $signed(reg42) : (reg44 ^ reg32))) : reg42) : $signed((+((reg34 ?
                  reg43 : reg35) < $unsigned(wire29)))));
        end
      else
        begin
          reg45 <= wire30[(2'h2):(2'h2)];
        end
    end
  assign wire47 = ($signed($unsigned(reg33[(5'h12):(4'h9)])) ?
                      (8'ha0) : $unsigned(wire27));
  assign wire48 = reg35;
  always
    @(posedge clk) begin
      reg49 <= ({({((7'h42) ? (8'h9f) : reg44)} > ((~^reg34) ?
              (reg34 ?
                  wire48 : reg46) : reg41[(2'h2):(1'h0)]))} == reg37[(1'h0):(1'h0)]);
      reg50 <= (($signed({wire26[(1'h1):(1'h0)]}) ?
              ({(~|reg39), {reg35}} ?
                  ($unsigned((8'ha8)) ?
                      $unsigned(wire26) : (|(8'hba))) : (reg46[(2'h3):(1'h1)] ?
                      (!reg32) : reg41)) : reg42[(4'h9):(2'h3)]) ?
          {(((wire47 ? (7'h41) : reg35) ?
                  $signed((8'hbb)) : $unsigned(reg44)) && reg32)} : (wire26 >> (~|$signed((~|wire28)))));
      reg51 <= (~^(^~$unsigned((reg49 << $unsigned(wire27)))));
      reg52 <= (($unsigned((reg32 * $unsigned(reg49))) ^ $signed(((~reg46) <<< (reg46 ?
              reg43 : reg51)))) ?
          $unsigned($signed($signed((^~reg37)))) : ($signed((~^$signed(reg41))) && $unsigned(reg43)));
    end
  assign wire53 = reg37;
  assign wire54 = $unsigned(((reg38[(3'h7):(3'h5)] ? (~^reg33) : (!reg49)) ?
                      $unsigned((^$unsigned(wire26))) : (wire30 > wire29[(1'h0):(1'h0)])));
  assign wire55 = (((8'h9c) || (~^wire30[(3'h6):(3'h5)])) ?
                      $unsigned(wire47[(1'h1):(1'h1)]) : $unsigned(reg32));
  assign wire56 = $unsigned((&$unsigned((^~$signed(reg41)))));
  assign wire57 = wire29;
  assign wire58 = {wire48[(3'h4):(2'h3)]};
  assign wire59 = $signed(($unsigned(($unsigned(reg40) ?
                      $unsigned(reg39) : (&wire48))) | (~$signed($unsigned((8'h9e))))));
  assign wire60 = (wire54 * (reg40[(3'h4):(3'h4)] ?
                      (~|(&$unsigned(wire57))) : {((reg39 ? wire29 : (8'hb5)) ?
                              reg41[(2'h2):(2'h2)] : $unsigned(reg42)),
                          reg44[(4'h8):(3'h5)]}));
  assign wire61 = {wire26};
  assign wire62 = $signed($signed({({reg51, (8'hb6)} << $unsigned(reg40))}));
  assign wire63 = (+{wire29[(1'h0):(1'h0)],
                      ($unsigned((^wire30)) || {$signed(wire57)})});
  assign wire64 = (+$unsigned(((-$unsigned(reg32)) ?
                      reg36[(4'hb):(1'h1)] : reg52[(2'h2):(2'h2)])));
  assign wire65 = reg41[(1'h1):(1'h1)];
  assign wire66 = ({(~^wire61)} >= {reg43[(4'h9):(4'h8)],
                      (^wire30[(4'h9):(4'h9)])});
  assign wire67 = ($signed(reg38) & wire60);
  always
    @(posedge clk) begin
      reg68 <= ($unsigned($unsigned(reg50[(4'hd):(4'hb)])) - ($unsigned({{wire65},
              {reg42, (8'hb5)}}) ?
          ($unsigned(reg33) != reg45[(3'h7):(1'h0)]) : (8'h9d)));
      reg69 <= reg39[(3'h4):(2'h2)];
      reg70 <= $unsigned($unsigned(wire56));
      if ($signed($signed((reg36[(5'h11):(4'h8)] ?
          reg41 : wire56[(3'h5):(1'h0)]))))
        begin
          reg71 <= $unsigned($signed((wire26 ?
              ((wire53 & wire61) ?
                  (reg34 * reg50) : $unsigned(wire48)) : (|(~^wire53)))));
          reg72 <= wire58;
        end
      else
        begin
          reg71 <= wire47;
          if (reg45[(3'h4):(2'h3)])
            begin
              reg72 <= (((!(&wire56)) ? $signed((~(+wire56))) : wire29) ?
                  reg42[(5'h12):(4'he)] : $unsigned(((wire30 << (reg42 || wire64)) ?
                      ($unsigned((8'ha7)) - (~&reg36)) : ((wire61 ?
                              reg52 : wire29) ?
                          ((8'hbb) & reg42) : $signed(wire31)))));
              reg73 <= $signed($signed($signed(wire27)));
              reg74 <= $signed(wire30);
              reg75 <= wire30;
            end
          else
            begin
              reg72 <= $signed(reg40);
              reg73 <= (8'h9f);
              reg74 <= $unsigned((wire67[(3'h5):(3'h4)] != $signed($unsigned($unsigned(reg52)))));
              reg75 <= ((~^((~|{wire26, reg68}) != {(wire62 ? wire60 : reg44),
                  $signed(wire66)})) ^ $unsigned((-(reg36 ?
                  (wire57 ? (8'ha3) : wire57) : (8'hb8)))));
              reg76 <= (wire58[(2'h3):(1'h0)] ?
                  wire61 : $unsigned(wire30[(3'h5):(1'h1)]));
            end
          if ($signed((8'hbe)))
            begin
              reg77 <= $signed({reg76,
                  ((~^((8'ha3) ? reg51 : wire27)) - ((wire28 - wire48) ?
                      $unsigned(wire57) : (8'hbd)))});
            end
          else
            begin
              reg77 <= wire65[(2'h2):(1'h1)];
              reg78 <= (+$unsigned($unsigned(((reg69 | wire28) || wire47))));
              reg79 <= {$unsigned((8'ha0)), (~&reg46[(4'h9):(4'h9)])};
              reg80 <= ($signed((&$unsigned(reg42))) | wire67);
              reg81 <= $unsigned(reg79);
            end
        end
      reg82 <= reg71;
    end
  assign wire83 = (~^({{$signed(wire57)}, $unsigned($unsigned(wire29))} ?
                      ($signed($signed(reg38)) + (|(reg45 - (8'hb2)))) : reg49[(4'hb):(4'hb)]));
endmodule
