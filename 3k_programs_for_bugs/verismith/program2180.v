module top
#(parameter param307 = ({{((8'ha5) ? (^(8'h9f)) : ((8'hae) > (8'hbf)))}} ? ((((^(8'haf)) || ((8'hab) >>> (8'ha5))) ? {{(8'hb6)}} : (((8'hbe) > (8'h9d)) ? {(8'hb2)} : ((8'ha5) ? (7'h43) : (8'haa)))) ? {{((8'hab) ? (8'hbe) : (8'h9e)), {(8'ha7), (8'had)}}, (((8'hbb) - (8'ha2)) ? {(8'hb6)} : ((8'ha2) ? (8'h9f) : (8'ha6)))} : ({(+(8'ha6))} ? (^((8'had) ? (8'hb7) : (8'ha0))) : (((8'hb5) & (8'ha3)) ^~ {(8'ha5)}))) : (((((8'hb8) || (8'haa)) <= (|(8'ha3))) << {(~&(7'h44)), {(8'ha0), (8'ha4)}}) >= {{((8'ha6) ^~ (8'hb8)), ((8'hac) ? (8'ha8) : (8'hb8))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire306;
  wire [(4'hd):(1'h0)] wire305;
  wire signed [(5'h15):(1'h0)] wire304;
  wire signed [(3'h6):(1'h0)] wire298;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire300;
  wire signed [(4'hb):(1'h0)] wire301;
  wire [(4'hb):(1'h0)] wire302;
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire306,
                 wire305,
                 wire304,
                 wire298,
                 wire113,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire300,
                 wire301,
                 wire302,
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
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ({{$signed((wire2 | wire1)),
              ($signed(wire2) && $signed(wire0))}} == {$signed(((wire1 >= wire1) <= (wire2 + wire3)))});
      reg5 <= $unsigned($unsigned((wire3[(4'hb):(4'h8)] ?
          ((~wire0) ?
              (reg4 ?
                  wire3 : reg4) : wire0[(2'h2):(1'h1)]) : $signed($signed((7'h43))))));
      reg6 <= reg4;
      reg7 <= wire1;
    end
  always
    @(posedge clk) begin
      reg8 <= (|{$signed((7'h41))});
      reg9 <= (~&$signed($unsigned(wire2)));
      if ((~$unsigned(((~$unsigned((8'hb6))) != (wire0 | reg4)))))
        begin
          reg10 <= ($signed(($signed({reg5, reg6}) ?
              (|reg4[(3'h4):(2'h3)]) : (reg5 == (~(8'ha8))))) ~^ wire2);
          reg11 <= $unsigned(($signed(wire0) >> reg4));
          reg12 <= (reg5[(3'h5):(2'h3)] ~^ $unsigned($signed(reg10)));
          reg13 <= (reg5[(2'h2):(1'h0)] ?
              {{$signed(reg6), wire0[(1'h1):(1'h0)]},
                  $unsigned((8'hba))} : (($unsigned($unsigned(reg5)) || ((8'hb5) ?
                  (reg10 ?
                      wire2 : reg4) : $signed(reg7))) > $signed(wire1[(3'h4):(2'h3)])));
          if ((reg13 ?
              {{$unsigned($unsigned(wire1))},
                  $unsigned($signed(reg13))} : wire0[(5'h12):(2'h2)]))
            begin
              reg14 <= $signed((~^{(^reg8)}));
              reg15 <= $unsigned(((7'h44) * $unsigned(reg6)));
              reg16 <= ((((^~$signed(wire1)) + $signed((wire2 <<< (8'hbe)))) * $signed($unsigned($signed(reg11)))) ?
                  (!(8'h9e)) : reg13[(3'h5):(3'h4)]);
              reg17 <= {$unsigned($signed($unsigned((reg10 - reg5)))),
                  {wire0[(4'h8):(3'h7)], (-reg8[(4'hb):(3'h6)])}};
              reg18 <= $unsigned(($signed((reg4[(1'h1):(1'h1)] ?
                      reg15[(1'h1):(1'h0)] : (reg5 ? reg14 : wire1))) ?
                  (($signed(reg8) - (reg17 <<< reg8)) ^~ $signed($unsigned(reg12))) : reg4));
            end
          else
            begin
              reg14 <= reg5[(3'h5):(2'h3)];
            end
        end
      else
        begin
          reg10 <= (wire3 ?
              {$signed(($unsigned(reg5) + $signed(reg8))),
                  (((reg13 ?
                      reg13 : reg16) + $signed(reg15)) == (+(reg7 ^ reg7)))} : reg18);
        end
      reg19 <= (~wire3[(4'hf):(2'h3)]);
    end
  assign wire20 = {$signed(reg16),
                      $unsigned($unsigned(({wire2, reg17} ?
                          $signed(reg13) : (reg18 ? wire0 : reg13))))};
  assign wire21 = (~(wire2 < $signed((~^$unsigned(wire3)))));
  assign wire22 = (^$signed((reg9[(3'h4):(2'h2)] >= (-wire21))));
  assign wire23 = (reg7 ^~ $signed((reg7 ?
                      ((^reg9) ?
                          ((8'ha8) >> reg9) : reg7) : (!(wire3 || reg18)))));
  assign wire24 = $unsigned((reg6[(2'h3):(2'h3)] ?
                      {((-wire23) ~^ $signed((8'h9d))),
                          reg14[(4'hf):(4'hb)]} : (!$unsigned(reg12[(3'h6):(2'h2)]))));
  assign wire25 = (reg5[(4'h8):(3'h5)] < $unsigned((((reg8 - reg8) < (reg6 * reg12)) ?
                      ($signed((7'h41)) | wire23[(4'hd):(4'hb)]) : reg12[(3'h7):(3'h7)])));
  assign wire26 = (8'hac);
  assign wire27 = (((&((reg14 == reg9) && (8'ha4))) ?
                      (reg18[(1'h1):(1'h0)] == (+reg13[(2'h2):(1'h1)])) : (8'ha0)) <= (8'ha6));
  assign wire28 = $signed($signed(reg9));
  assign wire29 = (~reg12[(4'hf):(4'hf)]);
  assign wire30 = (^~(8'hac));
  assign wire31 = $signed((!wire2[(4'hb):(1'h1)]));
  module32 #() modinst114 (wire113, clk, reg4, reg10, wire27, wire21);
  module115 #() modinst299 (wire298, clk, wire23, reg7, wire0, wire20);
  assign wire300 = $unsigned((~^(wire20 != {(~|reg5), {wire20, reg13}})));
  assign wire301 = $unsigned(wire2[(4'h8):(1'h1)]);
  module138 #() modinst303 (wire302, clk, wire29, wire2, wire26, wire31, wire24);
  assign wire304 = (8'ha1);
  assign wire305 = ($signed((&((~|reg13) ?
                       {reg13, reg14} : reg10))) >= (~(((wire1 ?
                               wire31 : wire2) ?
                           $unsigned(wire25) : (~^wire26)) ?
                       ({wire1, reg12} & reg12[(4'hb):(4'hb)]) : wire3)));
  assign wire306 = (({(^((8'ha7) ? wire0 : wire28)),
                               $signed(wire305[(3'h6):(2'h3)])} ?
                           (~|$signed($signed(wire22))) : ((wire30[(1'h1):(1'h0)] ?
                                   (reg10 == (8'h9d)) : ((7'h40) ?
                                       wire301 : reg7)) ?
                               (reg18[(3'h5):(1'h0)] <<< $unsigned(wire24)) : $signed({reg9}))) ?
                       $unsigned(wire22[(1'h1):(1'h0)]) : wire31);
endmodule

module module115
#(parameter param296 = (~&(((((8'hbf) <= (8'ha6)) <<< ((8'hb5) ? (8'hae) : (8'hae))) ~^ ((+(8'hac)) && ((7'h44) ? (7'h44) : (8'hb2)))) ? ((((8'hae) ? (8'hba) : (8'ha8)) ? {(7'h44), (8'ha7)} : {(8'ha5), (8'hac)}) ^ (|(&(8'hab)))) : ((((7'h41) ? (8'hbe) : (7'h42)) << {(8'haa), (8'hba)}) ? (((8'ha6) >= (8'h9e)) << {(8'hbc)}) : {((8'ha4) ? (8'ha1) : (8'hac)), {(8'ha7), (7'h42)}}))), 
parameter param297 = ((|param296) * {param296, (^~(!(param296 << param296)))}))
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire119;
  input wire [(5'h13):(1'h0)] wire118;
  input wire signed [(4'hc):(1'h0)] wire117;
  input wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire295;
  wire signed [(5'h12):(1'h0)] wire267;
  wire signed [(5'h11):(1'h0)] wire205;
  wire signed [(5'h15):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire202;
  wire signed [(3'h7):(1'h0)] wire293;
  assign y = {wire295,
                 wire267,
                 wire205,
                 wire204,
                 wire163,
                 wire137,
                 wire135,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire202,
                 wire293,
                 (1'h0)};
  module120 #() modinst136 (.clk(clk), .wire123(wire118), .wire124(wire116), .wire122(wire119), .y(wire135), .wire121(wire117));
  assign wire137 = $unsigned((($signed(((8'hb4) + wire116)) || (^~(wire118 ~^ wire116))) - (((wire135 - wire118) ?
                       $unsigned((8'hb4)) : wire117[(2'h3):(2'h3)]) + ({wire119,
                           wire119} ?
                       $unsigned(wire119) : $unsigned((8'hb8))))));
  module138 #() modinst164 (.y(wire163), .wire141(wire119), .wire142(wire117), .wire139(wire137), .clk(clk), .wire143(wire135), .wire140(wire116));
  assign wire165 = $signed((-{(~|((8'ha3) ? wire119 : wire163)), wire119}));
  assign wire166 = wire119;
  assign wire167 = $signed(wire135[(3'h5):(2'h3)]);
  assign wire168 = wire165[(3'h7):(3'h6)];
  module169 #() modinst203 (.wire173(wire117), .y(wire202), .wire174(wire167), .wire172(wire168), .wire170(wire118), .wire171(wire163), .clk(clk));
  assign wire204 = ($unsigned(wire119) | wire117);
  assign wire205 = (!(^~({((8'hb8) + wire163)} ?
                       {(^wire116), (wire168 ^~ wire119)} : ((wire202 ?
                           wire166 : wire202) ^~ wire117[(4'h8):(2'h2)]))));
  module206 #() modinst268 (wire267, clk, wire117, wire119, wire116, wire204, wire205);
  module269 #() modinst294 (.wire270(wire116), .wire272(wire135), .wire274(wire119), .wire271(wire204), .clk(clk), .y(wire293), .wire273(wire165));
  assign wire295 = (8'hb9);
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h2ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire signed [(3'h5):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire37;
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire37,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg80,
                 reg79,
                 reg78,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire37 = wire33;
  always
    @(posedge clk) begin
      reg38 <= $unsigned($signed((wire36[(3'h6):(2'h3)] & ((wire35 ?
              wire34 : wire36) ?
          (wire34 ~^ (8'hae)) : $signed(wire35)))));
      if (((wire37[(3'h6):(1'h0)] != (($unsigned(wire36) ^ (-wire35)) ?
              $signed((wire36 + (7'h43))) : $signed($signed(wire37)))) ?
          {$signed($signed($unsigned(wire34))),
              (-wire34[(3'h4):(1'h1)])} : reg38))
        begin
          reg39 <= reg38[(3'h5):(3'h4)];
          reg40 <= $signed((wire34[(2'h2):(1'h1)] ?
              {($unsigned(wire36) ?
                      (reg39 ? reg38 : wire35) : wire36[(3'h6):(2'h3)]),
                  $signed((reg39 ?
                      wire35 : wire35))} : ((8'ha4) >= $unsigned($signed(wire33)))));
          reg41 <= $signed((~^wire36));
          reg42 <= (^wire36);
        end
      else
        begin
          if ((+$signed(({$unsigned(wire34)} & $unsigned(reg39[(1'h1):(1'h1)])))))
            begin
              reg39 <= ($signed(wire37[(3'h7):(2'h2)]) <<< reg39);
              reg40 <= ((~&wire33[(1'h1):(1'h1)]) && ({($unsigned((8'hac)) && (wire36 <<< reg39))} ?
                  $unsigned(reg40) : $signed({$signed((8'had))})));
            end
          else
            begin
              reg39 <= reg39;
              reg40 <= (8'hb7);
            end
          if (reg38[(3'h6):(1'h0)])
            begin
              reg41 <= reg41[(3'h4):(3'h4)];
              reg42 <= wire37;
              reg43 <= (~|$unsigned($signed((+{wire36, reg40}))));
            end
          else
            begin
              reg41 <= (-(^~({$unsigned(wire34), wire33} ?
                  wire36 : ((reg43 * wire37) ?
                      reg38[(2'h2):(1'h1)] : wire37))));
              reg42 <= ($signed(wire37) >>> $unsigned(reg39));
            end
          reg44 <= wire35;
          reg45 <= $signed((8'hae));
        end
      if ((^$unsigned(reg42[(5'h10):(3'h4)])))
        begin
          if ((((wire36[(3'h4):(2'h3)] ?
                  reg43 : reg39) & wire34[(1'h0):(1'h0)]) ?
              $unsigned((~|($unsigned(reg39) ?
                  (8'h9e) : wire33[(4'hc):(4'hb)]))) : ($signed(reg39[(1'h0):(1'h0)]) ?
                  (reg42[(2'h2):(1'h1)] ?
                      ((reg42 | wire35) <<< $unsigned(wire33)) : ((reg38 ?
                              wire34 : (8'hb8)) ?
                          (wire33 ^~ reg41) : $signed(reg40))) : wire37[(3'h7):(3'h7)])))
            begin
              reg46 <= reg44[(1'h1):(1'h1)];
              reg47 <= wire37;
              reg48 <= (~|(wire36[(2'h3):(2'h2)] ?
                  (reg47[(3'h5):(3'h5)] ?
                      (|$unsigned((8'hba))) : $signed($signed(reg44))) : (&($unsigned(reg42) ?
                      (8'h9d) : $signed((8'hb5))))));
              reg49 <= $unsigned($unsigned($signed(reg47)));
            end
          else
            begin
              reg46 <= reg46[(4'he):(4'h8)];
              reg47 <= {(($unsigned(((8'ha9) ? reg41 : reg42)) ?
                          {(&reg48)} : reg42) ?
                      (reg41[(2'h3):(2'h3)] << $unsigned((~^reg38))) : reg48[(4'h9):(4'h8)]),
                  (^(~&(&$unsigned(reg41))))};
            end
          reg50 <= $unsigned((~&$unsigned((wire37[(1'h0):(1'h0)] != $unsigned((8'ha4))))));
          reg51 <= (&$signed(({(reg43 >>> (8'ha7)),
              $unsigned(wire37)} | reg44[(2'h3):(1'h0)])));
          if (((7'h40) ?
              (reg43 <= ($signed(reg51) | (~(wire35 ?
                  reg40 : reg46)))) : $signed(reg47[(3'h7):(2'h2)])))
            begin
              reg52 <= (($signed(reg41) >= reg40) - (8'hb5));
              reg53 <= {(({(reg44 ? (7'h44) : wire34)} ?
                          (+(reg46 ?
                              reg45 : (8'hb7))) : (~|(reg38 == wire35))) ?
                      $unsigned($signed(reg47[(4'h9):(2'h2)])) : {($signed(reg42) ?
                              reg47[(2'h2):(1'h1)] : $signed((8'hb3)))})};
            end
          else
            begin
              reg52 <= (~|($unsigned($unsigned({reg42,
                  wire36})) != (~|$signed((8'hbc)))));
              reg53 <= reg39[(3'h6):(1'h1)];
              reg54 <= (({reg46[(4'hf):(1'h0)]} || reg44[(4'h9):(3'h4)]) ?
                  reg43[(1'h1):(1'h0)] : $unsigned(reg46));
              reg55 <= $unsigned($signed($unsigned((wire34[(3'h5):(2'h2)] ?
                  (-reg47) : (&wire34)))));
            end
        end
      else
        begin
          reg46 <= ((($unsigned($signed(wire35)) != (reg42[(4'h8):(3'h5)] ?
                  $signed((8'hb2)) : $signed(wire35))) * (((^~(8'hb8)) == $signed((8'ha9))) ?
                  wire35[(1'h0):(1'h0)] : $signed(reg51))) ?
              reg51[(1'h0):(1'h0)] : ($signed(reg42) ?
                  (~&$signed((8'hbe))) : ((&$unsigned((8'hb7))) ?
                      wire33 : reg49)));
          if ((reg40 ?
              wire37 : $signed($unsigned(($unsigned(reg42) ?
                  {wire36} : (reg49 <= reg38))))))
            begin
              reg47 <= ($unsigned(wire33) > {($unsigned($signed(reg53)) * $signed(reg44[(3'h4):(3'h4)])),
                  ($unsigned(reg51) ? $unsigned({reg40}) : {(^~reg47)})});
              reg48 <= ((~((reg43 ?
                  $signed(reg54) : $unsigned(reg46)) >= (reg43[(1'h1):(1'h1)] > reg54))) != $signed(({(wire35 >>> reg43),
                      $unsigned(wire36)} ?
                  reg50[(1'h1):(1'h0)] : ((wire35 & wire36) != {reg38}))));
            end
          else
            begin
              reg47 <= (~((~&(8'hab)) ?
                  (^($unsigned(reg54) ?
                      (&(8'ha8)) : $unsigned(wire34))) : (8'hbc)));
            end
          reg49 <= reg39;
          reg50 <= {reg42[(4'he):(3'h5)],
              $signed($signed(((&reg53) ?
                  reg46[(3'h6):(1'h0)] : wire34[(2'h2):(1'h0)])))};
        end
      if ($signed((-(^reg38[(1'h1):(1'h0)]))))
        begin
          if (wire36)
            begin
              reg56 <= wire34[(1'h0):(1'h0)];
              reg57 <= $unsigned((~^reg41[(1'h0):(1'h0)]));
              reg58 <= $unsigned(($signed((8'hb9)) <<< ((~&$signed(reg46)) * $unsigned((reg54 ?
                  reg54 : wire35)))));
            end
          else
            begin
              reg56 <= ($signed(reg47) ~^ (((reg50 ?
                      (reg39 ? reg40 : wire35) : $unsigned(reg49)) ?
                  wire36 : $signed((~&reg50))) <<< (8'hab)));
              reg57 <= {($signed(($signed(reg40) > (|reg57))) ?
                      reg44[(2'h2):(2'h2)] : (({reg51} ?
                          (reg43 ?
                              reg54 : reg57) : (wire37 <<< reg43)) <= ($signed(reg55) ?
                          reg57[(3'h6):(2'h2)] : reg53[(2'h2):(1'h1)])))};
              reg58 <= ($unsigned(reg39) == ((reg44[(2'h3):(2'h2)] ?
                  $signed(wire36[(3'h5):(1'h0)]) : $unsigned(reg41)) ^ {(~|$signed(reg57))}));
              reg59 <= $unsigned({reg38, $unsigned({$signed(reg48)})});
              reg60 <= $signed(reg39);
            end
          if (($signed(((((8'haf) ?
              reg49 : reg41) ^~ reg48[(4'h8):(2'h2)]) <<< ($unsigned((8'h9c)) ?
              (|reg54) : $unsigned(wire33)))) ^ (reg44[(4'h8):(3'h4)] != {($signed(reg50) ?
                  (wire34 ? reg58 : (8'ha4)) : $unsigned(wire35))})))
            begin
              reg61 <= reg53[(1'h1):(1'h0)];
              reg62 <= $unsigned((~|$unsigned(wire36)));
              reg63 <= (((({reg48, reg53} < (reg40 ? wire35 : wire33)) ?
                      $unsigned((reg57 && reg41)) : (((8'hbd) > (8'hb3)) | (-reg55))) ?
                  {$signed($unsigned(reg57)),
                      {$signed(reg45), {wire34, (8'hb8)}}} : (((reg40 * reg53) ?
                          (reg52 ? wire33 : reg40) : $unsigned(reg58)) ?
                      wire34[(3'h5):(3'h5)] : reg62)) || reg51);
            end
          else
            begin
              reg61 <= (($signed($signed(reg52)) > reg62) & reg44);
              reg62 <= (({$unsigned((8'hb9))} ?
                      wire34 : {{(reg49 ? wire33 : reg53), (^~wire36)},
                          $signed(reg45)}) ?
                  $unsigned((~|reg50[(4'ha):(2'h2)])) : (wire33 > reg61[(2'h2):(2'h2)]));
              reg63 <= {wire33[(4'hb):(2'h2)]};
            end
          if ((+$unsigned($unsigned(($signed(reg38) ?
              reg44[(4'h9):(3'h5)] : (!wire33))))))
            begin
              reg64 <= $unsigned({((~$unsigned(reg53)) && $signed((~reg47))),
                  reg63[(4'hb):(1'h0)]});
              reg65 <= (8'ha0);
            end
          else
            begin
              reg64 <= reg44;
              reg65 <= (^reg40);
              reg66 <= (~|(|reg41[(1'h0):(1'h0)]));
              reg67 <= (~($unsigned((!(reg42 ?
                  reg41 : reg62))) + $unsigned((reg45 == (reg52 ~^ reg62)))));
              reg68 <= $unsigned({(((reg47 ?
                      reg46 : reg48) > reg62[(1'h0):(1'h0)]) < $unsigned((reg40 < reg66)))});
            end
          reg69 <= {((reg67[(4'hc):(3'h6)] ?
                  reg40 : {(reg54 ? reg38 : reg52),
                      ((8'hba) + reg60)}) + ($unsigned(reg54[(5'h14):(5'h14)]) || ((~|reg59) >> (reg57 ?
                  reg55 : reg59)))),
              (&$unsigned($unsigned((~&reg54))))};
          reg70 <= $signed({(^reg47[(3'h4):(2'h2)]), wire33});
        end
      else
        begin
          reg56 <= (reg62 ?
              reg66[(3'h7):(2'h3)] : {(reg54[(4'he):(4'h9)] <<< reg59[(3'h5):(2'h2)]),
                  {$unsigned((reg45 ? (7'h44) : reg67)),
                      $signed(((8'h9d) >= reg61))}});
          reg57 <= reg58;
          reg58 <= (^reg41);
        end
      reg71 <= $signed(((({reg66} - (7'h40)) && ({reg67} <<< (8'ha1))) ^ (reg63 ?
          reg40 : (reg50 <= (|reg61)))));
    end
  assign wire72 = $signed(wire34[(3'h5):(3'h5)]);
  assign wire73 = ($unsigned(reg65[(1'h0):(1'h0)]) ?
                      reg60[(3'h4):(2'h2)] : $signed(reg59));
  assign wire74 = (8'ha9);
  assign wire75 = {reg40, $signed((+$unsigned((-wire72))))};
  assign wire76 = ($unsigned((wire37[(4'h9):(1'h1)] > (|((8'had) < wire72)))) ^ (~^(((reg51 && reg38) ^ (reg51 <<< reg50)) ?
                      (-(-wire74)) : $unsigned({wire72, reg65}))));
  assign wire77 = $unsigned($unsigned((&({wire74} | (reg67 & reg60)))));
  always
    @(posedge clk) begin
      reg78 <= ((($unsigned((reg50 <= (8'ha6))) ^ ($signed(wire77) || {reg47,
              reg56})) ?
          reg51[(1'h1):(1'h0)] : $signed($signed($unsigned(reg68)))) < reg46[(4'hd):(4'hd)]);
      reg79 <= reg64;
      reg80 <= $unsigned((^~(8'ha4)));
    end
  module81 #() modinst95 (.wire84(reg52), .y(wire94), .wire82(reg56), .clk(clk), .wire83(reg40), .wire85(reg38));
  assign wire96 = reg79[(2'h2):(1'h0)];
  assign wire97 = (-((+wire33) != (!{reg55})));
  assign wire98 = (-$unsigned(((wire37[(4'ha):(4'h8)] ?
                      (reg80 == reg48) : {reg78}) >>> ($signed(reg64) ^~ (!wire76)))));
  assign wire99 = wire94;
  assign wire100 = reg80;
  always
    @(posedge clk) begin
      reg101 <= $signed($signed(reg71[(1'h1):(1'h0)]));
      reg102 <= reg60;
      if (reg45)
        begin
          if (reg69[(1'h1):(1'h0)])
            begin
              reg103 <= wire37;
            end
          else
            begin
              reg103 <= (~((((|reg67) ^~ ((8'ha5) >= wire100)) << ((~^wire100) ?
                      {wire36} : (reg46 < reg103))) ?
                  $signed({$signed(reg102)}) : ((&(+wire72)) ^~ $unsigned($signed(reg64)))));
              reg104 <= (~$signed(((8'ha7) ?
                  ($unsigned(reg54) ?
                      $unsigned(reg39) : (wire33 ?
                          reg63 : (7'h42))) : $signed((-reg44)))));
              reg105 <= (wire72[(4'h8):(3'h4)] <<< (^~{$signed(((8'ha5) || reg39))}));
              reg106 <= reg105[(3'h5):(1'h0)];
            end
          if ((($unsigned($signed(reg71[(4'he):(4'he)])) <= ({(^(8'hba)),
                  $unsigned(wire77)} >> $unsigned((reg53 ? reg40 : reg58)))) ?
              (wire77 & ({$signed(reg64)} & wire34[(1'h1):(1'h1)])) : ((~^reg55) ?
                  (((reg58 ? reg106 : wire96) >= reg41[(3'h6):(1'h0)]) ?
                      $unsigned($unsigned(reg62)) : $unsigned((8'hb4))) : reg48)))
            begin
              reg107 <= ($unsigned($signed({(reg46 ?
                      reg51 : (8'ha3))})) && $unsigned((^(+(reg49 ~^ reg40)))));
              reg108 <= (reg66[(5'h14):(4'hb)] | (~|reg48[(2'h2):(2'h2)]));
              reg109 <= $signed((((!(reg101 + reg49)) ?
                  (|reg106) : $unsigned((reg71 ?
                      reg47 : reg63))) || (^(+(reg50 <= wire36)))));
            end
          else
            begin
              reg107 <= $signed(({$unsigned($signed(reg39))} << ((~^{(8'hbe),
                      wire94}) ?
                  $unsigned(reg61[(2'h2):(1'h0)]) : reg39[(4'h8):(3'h6)])));
              reg108 <= reg63;
              reg109 <= (^~($unsigned(reg42) | $signed({reg39[(4'h8):(3'h6)],
                  (8'hb1)})));
            end
          reg110 <= (reg61[(2'h2):(1'h0)] ? $signed({(8'haf)}) : (+{reg70}));
        end
      else
        begin
          if ($signed(reg55[(2'h2):(1'h0)]))
            begin
              reg103 <= $signed($unsigned($signed(($unsigned(reg102) ?
                  (wire76 <= reg58) : wire96[(4'ha):(4'ha)]))));
            end
          else
            begin
              reg103 <= ($signed($unsigned(($unsigned(reg52) <= reg52[(4'h8):(1'h0)]))) ?
                  $signed(reg59) : reg106[(5'h12):(3'h6)]);
              reg104 <= ({(~^(wire76 <= (reg58 ? reg40 : reg39)))} ?
                  reg103 : reg108[(1'h0):(1'h0)]);
            end
        end
      reg111 <= reg66;
      reg112 <= {reg103};
    end
endmodule

module module81
#(parameter param93 = ((((((8'h9c) >> (8'had)) && ((8'hbe) ? (8'h9f) : (8'hb9))) ? ((8'hb6) | ((8'hae) && (8'hbd))) : ((-(8'ha6)) ? {(8'ha6)} : ((7'h43) ? (8'hbc) : (8'hb8)))) & {(((7'h41) == (8'hbd)) ? ((8'ha9) - (8'hbb)) : {(8'haa)}), (!(~(8'ha6)))}) ? (!{(~(-(8'hb4)))}) : (((8'ha0) * (+{(8'ha8)})) ? (+(+(8'hb2))) : (~|(((8'hba) >> (8'hb9)) != {(8'hb6)})))))
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire85;
  input wire [(4'ha):(1'h0)] wire84;
  input wire [(3'h6):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  assign y = {wire88, wire87, wire86, reg92, reg91, reg90, reg89, (1'h0)};
  assign wire86 = $unsigned((^~$unsigned(wire84)));
  assign wire87 = wire82[(1'h0):(1'h0)];
  assign wire88 = wire85[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg89 <= $unsigned(wire87);
      reg90 <= (~|wire82);
      reg91 <= (~|{({((8'ha7) && wire88)} ?
              $signed(wire82) : $unsigned($signed(wire87))),
          $signed((~reg90[(1'h1):(1'h0)]))});
      reg92 <= (&wire82[(3'h5):(3'h4)]);
    end
endmodule

module module269  (y, clk, wire274, wire273, wire272, wire271, wire270);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire274;
  input wire [(5'h15):(1'h0)] wire273;
  input wire [(4'h9):(1'h0)] wire272;
  input wire [(3'h6):(1'h0)] wire271;
  input wire signed [(5'h15):(1'h0)] wire270;
  wire signed [(5'h11):(1'h0)] wire292;
  wire signed [(4'he):(1'h0)] wire283;
  wire [(5'h12):(1'h0)] wire279;
  wire signed [(5'h14):(1'h0)] wire278;
  wire signed [(4'hc):(1'h0)] wire277;
  wire signed [(5'h14):(1'h0)] wire276;
  wire signed [(4'ha):(1'h0)] wire275;
  reg [(4'hc):(1'h0)] reg291 = (1'h0);
  reg [(2'h3):(1'h0)] reg290 = (1'h0);
  reg [(4'hf):(1'h0)] reg289 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg288 = (1'h0);
  reg signed [(4'he):(1'h0)] reg287 = (1'h0);
  reg [(4'h8):(1'h0)] reg286 = (1'h0);
  reg [(4'hf):(1'h0)] reg285 = (1'h0);
  reg [(4'hf):(1'h0)] reg284 = (1'h0);
  reg [(5'h12):(1'h0)] reg282 = (1'h0);
  reg [(4'hf):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg280 = (1'h0);
  assign y = {wire292,
                 wire283,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire275,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg282,
                 reg281,
                 reg280,
                 (1'h0)};
  assign wire275 = wire270;
  assign wire276 = ($unsigned((&$signed({wire272}))) + wire272);
  assign wire277 = wire270[(5'h12):(4'ha)];
  assign wire278 = {wire271[(3'h5):(1'h1)],
                       (wire271 && {$unsigned((wire271 * wire277))})};
  assign wire279 = (~&{(^(8'hb8))});
  always
    @(posedge clk) begin
      reg280 <= (wire275 | wire270);
      reg281 <= ({$signed((~|$signed((8'hb1))))} ?
          (!(-{(wire271 << (8'hb2))})) : (+reg280[(5'h11):(4'hf)]));
      reg282 <= wire278;
    end
  assign wire283 = ($signed(wire278[(4'h9):(3'h7)]) ?
                       {(wire273[(4'h8):(1'h1)] - $unsigned($signed(wire275))),
                           (7'h41)} : (+{(~reg282[(2'h2):(1'h1)]),
                           wire271[(2'h2):(1'h1)]}));
  always
    @(posedge clk) begin
      reg284 <= $unsigned((~^wire271));
      if ((((~(reg280 ?
          $unsigned(reg281) : wire275[(1'h1):(1'h1)])) || $signed($unsigned($unsigned(reg284)))) - ((^wire278[(3'h6):(3'h5)]) ?
          ($unsigned(wire271) + (!wire283[(1'h1):(1'h0)])) : {$unsigned((reg281 ?
                  wire272 : reg282)),
              (reg280[(3'h4):(3'h4)] ? wire272 : wire273)})))
        begin
          reg285 <= ((8'hbe) > reg284);
          if ($signed((|$unsigned(wire277[(4'h9):(2'h3)]))))
            begin
              reg286 <= wire278[(4'h8):(3'h7)];
            end
          else
            begin
              reg286 <= ({(reg284 ?
                          (wire272 ?
                              $unsigned((8'hb4)) : {reg280,
                                  reg285}) : wire272)} ?
                  (^~wire283) : wire274);
              reg287 <= (!$signed({(8'ha6)}));
            end
          reg288 <= {wire270, $unsigned((~|$signed((^wire279))))};
          reg289 <= ($signed({(^(+wire277)), (&(wire277 ^~ reg286))}) ?
              $unsigned(reg287) : reg285);
        end
      else
        begin
          reg285 <= ((&wire275) ?
              (wire276 ?
                  (wire278[(4'hb):(4'h8)] ?
                      (&$unsigned(reg282)) : wire278[(4'hc):(4'h9)]) : (~$signed(((8'hb4) ?
                      (8'hb1) : reg284)))) : (^(8'haf)));
          reg286 <= wire276[(5'h11):(1'h1)];
          reg287 <= (wire277 < wire274[(1'h1):(1'h1)]);
        end
      reg290 <= reg284[(1'h1):(1'h1)];
      reg291 <= $unsigned((~^(~$signed(wire279))));
    end
  assign wire292 = (((8'hac) ?
                       $unsigned($signed($unsigned(reg282))) : (-wire271)) > (7'h42));
endmodule

module module206  (y, clk, wire211, wire210, wire209, wire208, wire207);
  output wire [(32'h2a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire211;
  input wire signed [(5'h15):(1'h0)] wire210;
  input wire [(2'h2):(1'h0)] wire209;
  input wire [(5'h15):(1'h0)] wire208;
  input wire [(4'ha):(1'h0)] wire207;
  wire signed [(4'he):(1'h0)] wire266;
  wire [(5'h14):(1'h0)] wire265;
  wire [(2'h2):(1'h0)] wire260;
  wire signed [(5'h15):(1'h0)] wire259;
  wire signed [(4'he):(1'h0)] wire246;
  wire signed [(4'hf):(1'h0)] wire245;
  wire signed [(5'h15):(1'h0)] wire244;
  wire [(4'h9):(1'h0)] wire243;
  wire [(2'h2):(1'h0)] wire242;
  wire [(3'h4):(1'h0)] wire241;
  wire signed [(5'h12):(1'h0)] wire240;
  wire signed [(4'hf):(1'h0)] wire222;
  wire signed [(4'he):(1'h0)] wire221;
  wire signed [(3'h5):(1'h0)] wire215;
  wire signed [(3'h4):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire213;
  wire [(5'h10):(1'h0)] wire212;
  reg [(5'h10):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg263 = (1'h0);
  reg [(3'h7):(1'h0)] reg262 = (1'h0);
  reg [(4'he):(1'h0)] reg261 = (1'h0);
  reg [(5'h15):(1'h0)] reg258 = (1'h0);
  reg [(4'hb):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg252 = (1'h0);
  reg [(4'he):(1'h0)] reg251 = (1'h0);
  reg [(5'h12):(1'h0)] reg250 = (1'h0);
  reg [(3'h4):(1'h0)] reg249 = (1'h0);
  reg [(5'h11):(1'h0)] reg248 = (1'h0);
  reg [(4'h9):(1'h0)] reg247 = (1'h0);
  reg [(4'ha):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg238 = (1'h0);
  reg [(3'h6):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg236 = (1'h0);
  reg [(4'he):(1'h0)] reg235 = (1'h0);
  reg [(4'hc):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg232 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg228 = (1'h0);
  reg [(4'h9):(1'h0)] reg227 = (1'h0);
  reg [(5'h13):(1'h0)] reg226 = (1'h0);
  reg [(4'hc):(1'h0)] reg225 = (1'h0);
  reg [(4'hc):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg220 = (1'h0);
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg218 = (1'h0);
  reg [(5'h12):(1'h0)] reg217 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg216 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire260,
                 wire259,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire222,
                 wire221,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 (1'h0)};
  assign wire212 = $signed(((!(wire210 != (8'hb6))) ?
                       $signed(wire208[(4'h9):(3'h6)]) : $signed($signed(wire211))));
  assign wire213 = ($unsigned(wire211) ? (8'hae) : wire209);
  assign wire214 = ($unsigned(wire207[(3'h7):(3'h4)]) ?
                       wire212[(4'h8):(3'h4)] : (8'hac));
  assign wire215 = wire207;
  always
    @(posedge clk) begin
      reg216 <= $signed({wire209, wire212});
      reg217 <= $signed(((^~wire215[(3'h5):(1'h0)]) ?
          reg216[(3'h7):(3'h4)] : ((^~(&wire211)) || $signed((~wire207)))));
      reg218 <= $signed({((+(wire215 ?
              wire212 : wire215)) << ((wire207 < reg217) == (|wire212)))});
      reg219 <= wire213[(4'ha):(4'h8)];
      reg220 <= ($signed($signed($unsigned((wire210 ^~ reg219)))) != reg216);
    end
  assign wire221 = ($unsigned($signed(wire213)) ?
                       $unsigned(reg219) : (!(8'hb7)));
  assign wire222 = wire208[(4'hf):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed(wire207[(4'h9):(3'h4)]))
        begin
          reg223 <= $signed((&$signed(wire208[(3'h7):(3'h6)])));
        end
      else
        begin
          if (reg223)
            begin
              reg223 <= reg217;
            end
          else
            begin
              reg223 <= wire209[(2'h2):(1'h1)];
            end
          reg224 <= (wire210 > {reg217});
          reg225 <= ((($signed((reg217 ? (7'h40) : wire207)) ?
              {((8'ha2) ? reg216 : wire213), wire222} : ((wire214 || wire208) ?
                  {reg218, wire207} : (-(8'ha4)))) * $unsigned((!(wire212 ?
              reg216 : reg219)))) >>> {{(reg217[(4'hd):(3'h4)] == (!(8'hb5))),
                  ($unsigned((7'h44)) ^ $signed(wire221))},
              ((+wire214) ^ ($signed(wire222) ? reg219 : $signed(wire207)))});
          reg226 <= $unsigned($signed((reg220 ? reg220 : reg218)));
          reg227 <= wire221[(4'h9):(3'h6)];
        end
      if (reg219[(1'h0):(1'h0)])
        begin
          reg228 <= $unsigned($signed($unsigned(((wire222 ? reg220 : (8'hac)) ?
              $unsigned(reg217) : (wire222 > (8'hab))))));
        end
      else
        begin
          reg228 <= (^~(reg218[(2'h3):(1'h0)] < {{((8'h9c) ?
                      wire208 : wire212)},
              reg228}));
          reg229 <= ((|(8'hb4)) >>> (^~wire222));
          reg230 <= {$unsigned(reg227),
              ({$signed((reg217 ~^ reg224))} >> ({(^~reg220), wire221} ?
                  $signed($unsigned(wire214)) : $unsigned((wire212 ?
                      wire209 : (8'ha1)))))};
          reg231 <= ($unsigned($signed(wire207)) >= (wire211[(3'h4):(3'h4)] * ($signed($unsigned(wire207)) | (reg224 + reg229))));
        end
      if ((-wire214[(3'h4):(3'h4)]))
        begin
          reg232 <= $signed(({(reg228 ?
                  ((7'h41) ? reg223 : wire213) : (^reg219))} ^~ (~&reg228)));
          reg233 <= ($signed(wire214) ?
              (^~$unsigned($unsigned((reg223 <= (7'h41))))) : wire210);
          reg234 <= (|(wire207[(4'ha):(3'h6)] | $unsigned((8'h9c))));
          reg235 <= (^~wire221[(4'h8):(3'h5)]);
          reg236 <= wire221;
        end
      else
        begin
          reg232 <= reg232[(1'h1):(1'h1)];
          reg233 <= $unsigned(wire209[(1'h1):(1'h1)]);
          if ($unsigned($unsigned(reg232[(2'h3):(2'h3)])))
            begin
              reg234 <= $unsigned(reg226[(1'h0):(1'h0)]);
              reg235 <= $signed(wire214);
            end
          else
            begin
              reg234 <= ((reg234 ?
                  $signed(($signed(reg219) ?
                      (&(8'ha8)) : wire221[(4'h8):(2'h2)])) : reg219[(1'h1):(1'h0)]) ^~ wire212[(3'h6):(3'h5)]);
              reg235 <= (((|$unsigned(reg236[(2'h3):(2'h3)])) ?
                  $unsigned((~^(reg220 ?
                      reg236 : reg219))) : (&$signed(reg224[(4'h8):(3'h7)]))) * $unsigned($signed(((reg220 < wire214) ?
                  ((7'h42) ? reg235 : reg228) : reg219[(1'h0):(1'h0)]))));
              reg236 <= $unsigned(($signed(reg227[(4'h9):(2'h2)]) ?
                  (+reg232) : ($unsigned(reg236[(4'hd):(4'ha)]) + $signed(reg228[(2'h2):(1'h1)]))));
              reg237 <= $signed((reg234[(3'h4):(3'h4)] ?
                  {(^~wire222[(4'hf):(4'h8)]),
                      {(reg225 && wire221)}} : reg217[(5'h11):(4'hb)]));
              reg238 <= $unsigned($unsigned($signed(($signed(wire208) ?
                  reg226[(1'h1):(1'h1)] : reg228[(2'h2):(1'h1)]))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg239 <= ({$unsigned(({reg223} ? (~|wire214) : $signed((8'ha0)))),
          $signed($unsigned((+reg229)))} & $signed({$signed($signed(wire213))}));
    end
  assign wire240 = $unsigned(reg218);
  assign wire241 = $unsigned($unsigned((({reg220} ?
                           reg231[(2'h2):(2'h2)] : (wire213 ?
                               wire214 : (7'h44))) ?
                       reg224 : $unsigned($unsigned((8'hab))))));
  assign wire242 = {((|({(8'ha7), reg237} + (wire221 ?
                           (7'h42) : (8'hb1)))) == $signed((wire215[(2'h3):(2'h2)] | $signed(wire214)))),
                       $unsigned(reg220[(4'h8):(3'h5)])};
  assign wire243 = reg232[(2'h2):(1'h0)];
  assign wire244 = reg234;
  assign wire245 = (!($unsigned(reg225) ?
                       (-$signed($unsigned((8'had)))) : (reg235 != {(~reg219)})));
  assign wire246 = (^($unsigned(wire243[(3'h5):(3'h5)]) << $signed(($unsigned(reg237) - reg236[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned(((wire221 - (8'hab)) ?
          ((8'hae) >>> reg234) : (-(8'ha4)))))))
        begin
          if ({wire222[(4'h9):(3'h7)]})
            begin
              reg247 <= ((~&$unsigned(((!wire241) ?
                      {reg220, reg230} : $signed(reg225)))) ?
                  $signed({$signed({(8'hbd),
                          reg228})}) : $signed(((wire221[(4'ha):(3'h4)] ?
                      (wire212 << wire211) : $signed(wire211)) * $unsigned((!reg232)))));
              reg248 <= reg216[(2'h2):(1'h0)];
              reg249 <= $signed(($unsigned((~(reg235 ?
                  reg233 : reg239))) && (reg237[(1'h0):(1'h0)] ?
                  (reg223[(4'hb):(1'h0)] >= reg237[(1'h1):(1'h0)]) : ((~&wire243) ?
                      reg216[(2'h2):(2'h2)] : {reg224}))));
              reg250 <= (wire221[(3'h6):(2'h3)] & {reg233[(1'h1):(1'h0)]});
            end
          else
            begin
              reg247 <= ($signed({$unsigned((~^wire210)),
                      ((&wire243) ? {wire241, reg228} : reg219)}) ?
                  (($unsigned(((8'ha5) ?
                      reg230 : wire222)) - {(wire211 - reg237),
                      (wire241 ?
                          reg223 : reg217)}) < $unsigned((reg227[(1'h1):(1'h1)] <<< (~^reg217)))) : wire244);
              reg248 <= {((+(((8'haf) ? wire240 : wire212) ?
                      ((8'hbd) && (8'h9c)) : reg235)) ^ wire213[(4'ha):(3'h7)]),
                  $unsigned(reg217)};
            end
          reg251 <= (^(reg233 ?
              wire210[(4'hd):(1'h1)] : $unsigned((+(wire240 ~^ reg225)))));
          if ($signed((~|(reg234 + ((&reg224) ~^ (wire222 >>> reg229))))))
            begin
              reg252 <= wire210[(4'he):(2'h3)];
              reg253 <= reg224;
              reg254 <= $unsigned((-$signed((~^reg231))));
              reg255 <= (8'hb9);
              reg256 <= wire215[(3'h5):(2'h2)];
            end
          else
            begin
              reg252 <= wire242[(2'h2):(2'h2)];
              reg253 <= reg227[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg247 <= ($signed(reg233) ?
              reg256 : $signed((~^($signed(reg251) ?
                  reg230 : $signed(wire207)))));
          if ({((~reg252) ?
                  {((reg234 ? reg219 : wire222) - wire214),
                      ($unsigned(reg236) | (reg230 == (7'h43)))} : $unsigned({$unsigned(reg219)}))})
            begin
              reg248 <= (({({(8'hbc)} ?
                          wire214 : reg236)} >> wire242[(1'h1):(1'h1)]) ?
                  reg227 : {(((8'ha8) >= reg234) ?
                          (~^{wire221, reg227}) : $unsigned($signed(wire244))),
                      $signed($unsigned((reg238 ~^ reg229)))});
              reg249 <= {({($signed((8'haf)) & (wire213 ? reg255 : (8'ha5)))} ?
                      (~^$unsigned($signed(reg247))) : ((~|reg234[(2'h2):(1'h1)]) ?
                          wire215[(2'h3):(2'h2)] : ((wire209 ?
                                  reg220 : (7'h43)) ?
                              (&(8'hb5)) : (reg236 ? reg251 : reg230)))),
                  (&$signed($signed((wire214 ? reg237 : reg232))))};
            end
          else
            begin
              reg248 <= (-{(^~(-$signed(wire207)))});
              reg249 <= $signed($signed(reg237[(1'h1):(1'h1)]));
            end
          if ((reg237 ? ((8'hbf) <<< $signed(reg236)) : wire222[(4'h9):(2'h3)]))
            begin
              reg250 <= $signed(wire211[(3'h7):(3'h4)]);
              reg251 <= wire246[(3'h4):(1'h1)];
            end
          else
            begin
              reg250 <= $signed(reg239);
              reg251 <= (+wire241[(1'h0):(1'h0)]);
            end
          reg252 <= reg249;
        end
      reg257 <= reg247;
      reg258 <= reg219[(3'h4):(3'h4)];
    end
  assign wire259 = (+(reg249 ? $signed((+((8'ha3) & reg254))) : wire214));
  assign wire260 = (8'hbd);
  always
    @(posedge clk) begin
      reg261 <= wire208[(4'he):(4'ha)];
      reg262 <= $signed(((reg230 & reg231) >>> reg235));
      reg263 <= $signed((reg236 ?
          {$signed((wire215 <<< reg238)),
              ((reg223 ? wire211 : reg227) ?
                  (reg217 ?
                      reg231 : reg237) : reg228[(1'h1):(1'h1)])} : $unsigned($unsigned(wire240))));
      reg264 <= ({(~^{reg257[(1'h1):(1'h1)]})} ?
          $signed(reg247[(3'h7):(3'h6)]) : $unsigned((~^(~reg262[(3'h7):(1'h0)]))));
    end
  assign wire265 = reg218[(5'h13):(4'ha)];
  assign wire266 = wire207[(3'h6):(2'h2)];
endmodule

module module169  (y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire174;
  input wire signed [(2'h3):(1'h0)] wire173;
  input wire signed [(3'h7):(1'h0)] wire172;
  input wire signed [(3'h6):(1'h0)] wire171;
  input wire [(4'h9):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire201;
  wire signed [(4'hd):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire199;
  wire [(5'h11):(1'h0)] wire198;
  wire [(5'h13):(1'h0)] wire197;
  wire signed [(4'hd):(1'h0)] wire196;
  wire signed [(4'h9):(1'h0)] wire195;
  wire [(2'h3):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire193;
  wire [(4'h8):(1'h0)] wire191;
  wire [(4'ha):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire175;
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg188 = (1'h0);
  reg [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(3'h7):(1'h0)] reg186 = (1'h0);
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire191,
                 wire176,
                 wire175,
                 reg192,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 (1'h0)};
  assign wire175 = ((wire171[(2'h3):(2'h3)] & ((&(wire174 >>> wire170)) ?
                           wire171 : $signed((~|wire174)))) ?
                       $unsigned($signed(wire173[(2'h3):(2'h2)])) : (|wire173[(2'h3):(1'h0)]));
  assign wire176 = ({wire173} ?
                       $unsigned((~(wire174[(2'h2):(1'h0)] ?
                           $signed((8'ha4)) : (^wire173)))) : wire175);
  always
    @(posedge clk) begin
      reg177 <= (-(wire175 ?
          ((wire175 <<< (wire175 ^~ (8'ha2))) >>> ((wire171 ?
                  wire174 : wire170) ?
              $signed(wire173) : (7'h40))) : (&wire170)));
      if ($unsigned(((((wire176 + wire175) ?
          wire172 : wire175[(4'ha):(4'ha)]) >= wire175[(2'h3):(2'h2)]) ~^ wire171[(2'h2):(2'h2)])))
        begin
          reg178 <= (~^wire175[(2'h3):(2'h2)]);
          reg179 <= $unsigned($signed($signed(((8'hb9) & $unsigned(wire172)))));
          if ({(|(+wire172[(3'h4):(1'h0)])),
              {(!(8'h9e)), reg179[(2'h3):(2'h2)]}})
            begin
              reg180 <= (8'h9e);
              reg181 <= reg180;
              reg182 <= (~&(wire173[(2'h3):(1'h1)] ?
                  ($signed((wire173 > (8'hb2))) >= ($unsigned((8'ha3)) & $signed(reg181))) : (wire174 << ($signed(wire172) - (reg180 ?
                      (8'hbc) : wire175)))));
              reg183 <= (($signed(reg178[(5'h11):(3'h5)]) == wire173) != reg180);
            end
          else
            begin
              reg180 <= (+reg179);
            end
          reg184 <= reg183[(2'h3):(2'h3)];
          reg185 <= (!wire173[(2'h2):(2'h2)]);
        end
      else
        begin
          if (wire175)
            begin
              reg178 <= wire171[(1'h0):(1'h0)];
              reg179 <= wire170;
              reg180 <= ((reg178 ?
                      ((~|{reg183,
                          reg184}) - reg177[(2'h3):(2'h2)]) : $unsigned(wire174)) ?
                  wire175 : (!((~^{wire175, wire176}) <= ({reg178, reg180} ?
                      reg177 : reg180))));
            end
          else
            begin
              reg178 <= $unsigned(($signed($signed((wire170 ?
                      reg182 : wire171))) ?
                  (8'h9d) : reg178[(3'h7):(1'h1)]));
              reg179 <= $unsigned(reg179[(1'h0):(1'h0)]);
            end
          if ($signed($unsigned(reg181[(5'h10):(4'h9)])))
            begin
              reg181 <= (+reg183[(2'h2):(2'h2)]);
            end
          else
            begin
              reg181 <= (!{wire174[(4'hd):(4'h8)]});
              reg182 <= wire173[(2'h3):(2'h3)];
              reg183 <= reg181;
              reg184 <= (+{wire175[(4'h8):(2'h2)],
                  ((~&(reg179 ?
                      wire171 : wire175)) && $unsigned(reg185[(2'h2):(2'h2)]))});
              reg185 <= wire170[(3'h5):(2'h2)];
            end
          reg186 <= (($signed($unsigned((reg184 * wire174))) ?
              $signed({$unsigned((8'hb0)),
                  (8'h9c)}) : reg178) >= (reg178[(4'he):(2'h2)] ?
              ({$signed(wire176), wire171[(3'h6):(1'h1)]} ?
                  $signed((-reg185)) : $signed((reg179 ?
                      reg181 : wire175))) : $unsigned($unsigned(reg182[(2'h3):(2'h3)]))));
          reg187 <= wire175[(4'h8):(2'h2)];
          if ((reg182[(5'h12):(3'h4)] ?
              (!(+(~^((8'h9f) ? reg182 : (8'h9c))))) : reg186))
            begin
              reg188 <= $unsigned(($signed(wire173) > $signed(reg177)));
            end
          else
            begin
              reg188 <= $signed((wire176 != ($signed($signed(reg181)) ?
                  ({wire175} ? reg185 : $unsigned(reg187)) : wire175)));
              reg189 <= $unsigned({{wire170[(1'h1):(1'h1)]}});
            end
        end
      reg190 <= $signed({$signed({(7'h42)}), reg185[(4'he):(4'ha)]});
    end
  assign wire191 = ($unsigned(reg190[(4'hb):(4'h9)]) ?
                       (^(&$signed(reg188[(1'h0):(1'h0)]))) : $signed({$signed({wire171,
                               (8'hbd)}),
                           (+reg188)}));
  always
    @(posedge clk) begin
      reg192 <= $unsigned($signed(wire175[(2'h3):(2'h2)]));
    end
  assign wire193 = $unsigned({(|wire175[(4'ha):(4'h8)])});
  assign wire194 = (((|reg181[(3'h5):(1'h1)]) ?
                           {(~&{wire172, reg185}),
                               (((8'hb7) ?
                                   wire170 : reg179) & (reg190 || wire191))} : reg186[(3'h5):(3'h5)]) ?
                       $signed({wire170[(3'h7):(2'h2)],
                           reg182[(5'h10):(4'hd)]}) : (^~reg190));
  assign wire195 = reg187;
  assign wire196 = (((((wire175 << reg178) ?
                           (~wire174) : (reg190 ?
                               wire193 : (8'h9f))) < (&reg183)) && ($signed((^reg188)) ?
                           {$unsigned(wire193)} : ({wire191} ~^ wire195))) ?
                       reg190 : wire170);
  assign wire197 = reg179;
  assign wire198 = ((reg183[(1'h1):(1'h0)] ?
                           ($unsigned({reg182}) + $unsigned(reg185[(4'he):(1'h0)])) : ($signed((8'hb4)) | $unsigned(reg184))) ?
                       (^~(^~(^{wire174}))) : wire194);
  assign wire199 = reg183;
  assign wire200 = (wire193[(1'h1):(1'h1)] ?
                       $unsigned($signed((-(^wire191)))) : $signed($signed(($signed(reg185) >= $unsigned((8'ha7))))));
  assign wire201 = (|reg178[(5'h10):(3'h7)]);
endmodule

module module138
#(parameter param162 = (7'h42))
(y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire143;
  input wire signed [(2'h2):(1'h0)] wire142;
  input wire [(4'hb):(1'h0)] wire141;
  input wire signed [(3'h7):(1'h0)] wire140;
  input wire signed [(4'he):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire [(4'h9):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire144;
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire146,
                 wire145,
                 wire144,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire144 = (~(8'h9f));
  assign wire145 = wire144;
  assign wire146 = ({(~^$signed((wire141 > wire144))),
                       (&$unsigned(wire142[(1'h0):(1'h0)]))} + {wire140[(2'h3):(1'h1)],
                       (($unsigned(wire142) ?
                           wire141 : (wire141 ?
                               wire140 : wire144)) && $signed(wire141[(4'h8):(1'h0)]))});
  always
    @(posedge clk) begin
      reg147 <= $signed($signed($signed((wire139[(4'h8):(3'h6)] ?
          $signed((8'had)) : (wire144 >> wire144)))));
      reg148 <= wire146[(3'h4):(2'h2)];
      reg149 <= wire139;
      reg150 <= $unsigned(wire142[(1'h0):(1'h0)]);
      reg151 <= $signed((-$signed((!$signed(wire142)))));
    end
  assign wire152 = (wire139[(2'h3):(1'h0)] ?
                       (((~&(|wire144)) ?
                           reg151[(1'h0):(1'h0)] : (~(wire139 >> wire142))) >> ((~{wire145}) ?
                           reg150 : $unsigned(wire146[(1'h1):(1'h1)]))) : $unsigned($unsigned(reg147)));
  assign wire153 = (~(wire142 && wire146));
  assign wire154 = (~|$unsigned((+(8'ha7))));
  assign wire155 = (({wire153} ?
                           ($unsigned({reg151, reg151}) > ($unsigned(wire142) ?
                               wire154[(1'h1):(1'h1)] : $signed((8'hb7)))) : (wire146 || reg151[(1'h0):(1'h0)])) ?
                       (7'h43) : wire140[(1'h0):(1'h0)]);
  assign wire156 = $signed(reg151);
  assign wire157 = (!(8'hae));
  assign wire158 = (((8'ha8) < $unsigned((^~wire156))) ^~ $unsigned(($signed((reg149 ?
                           wire155 : wire141)) ?
                       (!{wire141,
                           (8'hbc)}) : (wire143[(1'h1):(1'h0)] >= wire143[(2'h3):(1'h0)]))));
  assign wire159 = (~$unsigned({$signed(reg147),
                       ((wire152 <<< (8'hae)) ? $signed(wire158) : wire156)}));
  assign wire160 = reg148;
  assign wire161 = $signed({wire140});
endmodule

module module120  (y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire [(3'h5):(1'h0)] wire123;
  input wire signed [(4'hf):(1'h0)] wire122;
  input wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire125 = wire122;
  assign wire126 = wire121;
  assign wire127 = (^(((((8'ha5) <<< wire124) ?
                       {wire121,
                           wire124} : $signed(wire121)) ~^ {(-wire123)}) && $signed($unsigned($unsigned(wire121)))));
  assign wire128 = ($unsigned($unsigned(((wire127 ~^ wire121) + wire122))) ~^ (|$signed($unsigned({wire123,
                       wire124}))));
  assign wire129 = wire127;
  assign wire130 = $signed(wire129[(1'h0):(1'h0)]);
  assign wire131 = $unsigned($unsigned($signed($signed((wire130 ?
                       wire125 : wire123)))));
  always
    @(posedge clk) begin
      reg132 <= ((wire127[(3'h5):(3'h5)] ?
          ($unsigned(wire128[(3'h4):(2'h3)]) >>> (wire121[(1'h1):(1'h1)] ?
              $unsigned((8'hb7)) : wire126)) : $signed((wire121[(2'h2):(1'h1)] | wire123))) ^ $unsigned(wire131));
      reg133 <= (!$signed((~wire121[(3'h7):(1'h0)])));
      reg134 <= (-$signed($unsigned({(|reg132), $unsigned(reg132)})));
    end
endmodule
