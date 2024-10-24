module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire97;
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire36,
                 wire38,
                 wire39,
                 wire40,
                 wire97,
                 reg110,
                 reg109,
                 reg108,
                 reg104,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 (1'h0)};
  module4 #() modinst37 (.wire7(wire0), .wire9(wire2), .y(wire36), .wire6(wire1), .clk(clk), .wire5((8'h9f)), .wire8(wire3));
  assign wire38 = {(wire2[(2'h3):(1'h1)] ?
                          (8'hb1) : $signed((wire36 ?
                              wire36[(4'h8):(1'h1)] : (wire2 ?
                                  wire1 : wire2)))),
                      wire0};
  assign wire39 = ($signed(wire0[(3'h4):(1'h0)]) ?
                      {$signed((wire38[(4'ha):(2'h2)] ?
                              $unsigned(wire2) : $unsigned(wire1)))} : $unsigned(wire38));
  assign wire40 = wire2[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg41 <= wire3;
      if ($unsigned((~&(~^{wire36}))))
        begin
          if ((wire38 ?
              (wire40 ^~ ((~|(wire3 ? reg41 : wire3)) ?
                  ((wire40 + wire40) << wire0) : $signed({(8'ha3)}))) : (~&(8'ha4))))
            begin
              reg42 <= {((wire2 != ({wire2} == $signed(wire38))) > (((^wire36) < {wire39}) <<< $signed($unsigned(wire3))))};
              reg43 <= ($unsigned($unsigned(reg42[(3'h6):(1'h1)])) >= (({reg42,
                      $signed((8'ha5))} <<< ((wire3 <<< wire1) ?
                      (wire1 ~^ wire0) : wire0)) ?
                  $signed($signed(wire38[(3'h5):(1'h1)])) : ((~|(&reg41)) ?
                      wire0[(1'h1):(1'h0)] : $signed({wire1}))));
              reg44 <= {{((wire40[(5'h10):(3'h5)] || $unsigned(reg41)) ?
                          ((wire0 ? wire38 : (7'h41)) ?
                              (&wire40) : $signed(wire1)) : (+(reg43 <= wire38)))},
                  ((^reg42) ^ $signed(wire1[(5'h13):(3'h4)]))};
              reg45 <= (|$unsigned($unsigned($signed((wire1 ?
                  reg42 : wire38)))));
            end
          else
            begin
              reg42 <= wire2[(3'h5):(2'h3)];
              reg43 <= wire2;
            end
          if ($unsigned(wire39))
            begin
              reg46 <= $unsigned(wire39);
              reg47 <= wire39;
              reg48 <= ($unsigned(wire0[(2'h2):(2'h2)]) ?
                  $unsigned($unsigned(wire2)) : $unsigned(wire2));
              reg49 <= ((^$unsigned(((reg43 != reg46) ?
                      reg48 : $unsigned((8'ha1))))) ?
                  $unsigned(((^~reg47[(3'h7):(2'h2)]) != ($unsigned((8'ha5)) <<< (reg45 ?
                      (7'h42) : wire38)))) : $signed((~(~(reg45 >> (8'hb6))))));
              reg50 <= {$unsigned(wire39)};
            end
          else
            begin
              reg46 <= $signed($signed(wire39));
              reg47 <= reg45;
              reg48 <= $signed((-(+reg50)));
              reg49 <= reg41[(2'h3):(1'h0)];
              reg50 <= $unsigned(((~|wire3) ^~ $signed((8'ha7))));
            end
          if ((($signed(($unsigned(reg44) >= reg41)) ?
              reg45 : reg49) & ((wire38 ?
              $unsigned({(8'hb7),
                  reg42}) : (wire36[(4'hb):(4'h8)] != {wire39})) ~^ (|$unsigned(reg46)))))
            begin
              reg51 <= {($unsigned(((wire38 ? wire40 : reg46) ?
                      (8'ha8) : reg45[(1'h1):(1'h0)])) != (reg48 ?
                      $unsigned($signed(wire40)) : wire39))};
              reg52 <= reg46[(2'h3):(2'h3)];
              reg53 <= ((reg45[(1'h0):(1'h0)] >>> wire0[(3'h5):(2'h3)]) ?
                  (^~$signed({reg41, (wire0 - wire3)})) : ({(+(wire1 > reg49)),
                      reg48[(3'h6):(1'h0)]} < (wire38[(2'h3):(2'h2)] ?
                      (~^(wire1 ? wire39 : reg51)) : (^~(reg46 ^ wire39)))));
            end
          else
            begin
              reg51 <= ($signed(($unsigned(wire2[(4'hd):(4'h9)]) >>> reg45)) ?
                  reg41 : (+($unsigned({reg42}) ?
                      ($unsigned(wire40) < $signed(reg44)) : (|$signed(wire0)))));
              reg52 <= reg50[(2'h3):(1'h1)];
              reg53 <= $signed((^(((reg45 ? reg46 : reg45) ?
                      reg52[(3'h6):(3'h6)] : reg52) ?
                  (~^(reg45 ? reg52 : reg50)) : $unsigned({reg47}))));
              reg54 <= ((^(~^reg50)) ?
                  (^{($unsigned(reg42) ? (&wire38) : {wire36, reg43}),
                      {wire2,
                          wire1}}) : (~&$unsigned($signed($signed((8'hb9))))));
              reg55 <= reg47;
            end
        end
      else
        begin
          reg42 <= wire1;
          reg43 <= ($unsigned({reg55[(4'h8):(2'h3)]}) ?
              $signed((wire3[(2'h2):(1'h1)] ?
                  $signed($unsigned(reg47)) : (wire40 <= reg50))) : $unsigned(reg52[(3'h7):(3'h6)]));
          if (wire40)
            begin
              reg44 <= $signed($unsigned(reg47[(3'h5):(1'h0)]));
              reg45 <= reg45[(1'h1):(1'h0)];
            end
          else
            begin
              reg44 <= $signed($signed((-(!reg48))));
            end
          if (reg53)
            begin
              reg46 <= reg44[(4'hc):(4'hb)];
              reg47 <= $signed((^~$unsigned({reg51})));
              reg48 <= reg49[(1'h1):(1'h1)];
              reg49 <= ($signed((8'hab)) ?
                  $unsigned(($unsigned(wire3[(2'h2):(2'h2)]) ?
                      (^{reg43}) : $unsigned((~&(8'ha5))))) : (|$signed(((wire3 ?
                      wire0 : reg53) != wire0[(3'h5):(1'h1)]))));
              reg50 <= ({reg55[(3'h5):(1'h0)]} > $signed($signed(reg41)));
            end
          else
            begin
              reg46 <= reg41[(2'h2):(2'h2)];
              reg47 <= $signed(($unsigned($signed($signed(reg50))) ?
                  reg45 : $unsigned(wire0[(3'h4):(3'h4)])));
            end
          reg51 <= reg47;
        end
      reg56 <= $signed((&({$signed(wire39)} && $signed({reg45, reg45}))));
    end
  module57 #() modinst98 (.wire61(wire36), .clk(clk), .wire60(wire3), .y(wire97), .wire59(wire38), .wire58(reg46));
  assign wire99 = (~|(|(^($signed((8'hbc)) ?
                      ((8'hae) ? (8'hb6) : wire40) : (!wire97)))));
  assign wire100 = $signed($signed($unsigned(reg56)));
  assign wire101 = (($signed(reg41[(1'h1):(1'h0)]) ?
                       ($unsigned($unsigned(reg45)) >>> (-(reg44 ~^ reg47))) : (~&wire2[(2'h3):(1'h1)])) >> (^($signed(reg53[(4'hd):(3'h7)]) ^ ((reg44 ?
                           (8'hbf) : (8'ha0)) ?
                       ((8'had) - reg47) : $unsigned(wire3)))));
  assign wire102 = ($unsigned(wire0[(3'h6):(1'h0)]) ?
                       ($signed($signed({reg48, reg42})) ?
                           wire99 : wire39[(2'h3):(2'h2)]) : (wire97 == (~|(8'haa))));
  assign wire103 = $signed(reg49);
  always
    @(posedge clk) begin
      reg104 <= $signed($signed(reg53));
    end
  assign wire105 = wire97;
  assign wire106 = reg41[(2'h3):(1'h0)];
  assign wire107 = $signed((((wire1 ?
                       (wire100 ?
                           wire106 : wire101) : reg42[(2'h3):(2'h3)]) ^ (reg43[(2'h2):(1'h0)] ?
                       (+(8'hbc)) : ((8'hb4) ?
                           (8'hb4) : reg51))) <<< ($unsigned((wire99 ?
                       (7'h40) : reg47)) < wire97[(5'h11):(3'h6)])));
  always
    @(posedge clk) begin
      reg108 <= (8'had);
      reg109 <= reg104;
      reg110 <= $signed((~|((+reg42[(3'h7):(2'h2)]) | wire107)));
    end
  assign wire111 = {wire106[(1'h1):(1'h0)]};
  assign wire112 = $signed(wire97[(4'ha):(4'h9)]);
  assign wire113 = $signed(wire100[(2'h3):(2'h2)]);
  assign wire114 = wire38[(4'h9):(1'h1)];
endmodule

module module57
#(parameter param96 = (!((~|(((8'ha9) ? (8'hb4) : (8'hba)) ? (-(8'hbd)) : ((8'ha3) + (7'h40)))) >= ((((8'hae) ? (8'hb9) : (7'h43)) ? ((8'hb8) == (8'hbe)) : {(8'h9e)}) ? (8'h9c) : (^~(!(8'hbd)))))))
(y, clk, wire58, wire59, wire60, wire61);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire59;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire signed [(5'h11):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire87;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire62,
                 wire63,
                 wire64,
                 wire87,
                 (1'h0)};
  assign wire62 = $signed(wire60);
  assign wire63 = {{wire60[(3'h6):(3'h4)],
                          (!((wire61 ? wire58 : wire58) ?
                              wire62 : $signed(wire60)))},
                      (!((^~$signed((8'hb5))) ?
                          $signed((wire62 ? wire58 : wire59)) : (^(wire58 ?
                              wire61 : wire60))))};
  assign wire64 = ((8'hb1) || (wire58 | (+$unsigned((wire59 ?
                      wire59 : (8'ha0))))));
  module65 #() modinst88 (wire87, clk, wire61, wire59, wire60, wire64, wire62);
  assign wire89 = $unsigned(wire64[(4'ha):(3'h7)]);
  assign wire90 = $signed(wire58[(4'h8):(4'h8)]);
  assign wire91 = (wire87 > $unsigned({(wire61[(3'h5):(2'h2)] ?
                          wire87[(1'h1):(1'h1)] : ((8'ha7) == wire58)),
                      $unsigned((wire59 ? wire64 : wire62))}));
  assign wire92 = ({$signed($signed((wire87 ~^ (8'ha7)))),
                          wire63[(5'h11):(4'hd)]} ?
                      $signed(((~(!wire91)) ?
                          (((8'ha3) << wire87) ?
                              {wire87} : (8'hbe)) : (!(wire87 ?
                              wire64 : (8'hb1))))) : (-(~(wire91 > (wire58 > wire87)))));
  assign wire93 = (~&$signed((&($unsigned(wire63) >>> wire90[(1'h0):(1'h0)]))));
  assign wire94 = (^$signed($unsigned(((wire61 - wire61) ?
                      (wire60 ? wire59 : wire87) : {wire87, wire58}))));
  assign wire95 = ((((wire93 ?
                          (wire94 ?
                              wire94 : wire61) : wire92) && wire89[(4'h9):(2'h3)]) ^ ((~^(^~wire64)) ?
                          (~|(wire60 ? wire59 : wire58)) : wire92)) ?
                      wire64 : ((^$unsigned((~^wire92))) ?
                          wire59 : $unsigned(wire62[(4'hb):(4'ha)])));
endmodule

module module4
#(parameter param34 = ({((^(^~(8'h9d))) | (~&(~|(8'ha1))))} & {{{((8'h9d) ? (8'ha6) : (8'hb5)), ((8'hbb) ? (8'hb2) : (8'hb0))}}, ((8'hb1) ^~ ({(8'hb6), (8'hae)} << ((8'hb9) ? (8'hae) : (8'hb5))))}), 
parameter param35 = ((|param34) <<< param34))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire10;
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire10,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = {(wire7 * $unsigned(wire8[(1'h1):(1'h0)])),
                      (^~(({wire6, wire5} ?
                              $signed(wire7) : (wire7 ? wire9 : wire8)) ?
                          $signed((+(7'h43))) : wire8))};
  always
    @(posedge clk) begin
      reg11 <= $signed($signed((~&$unsigned(((7'h41) ? wire6 : wire5)))));
      reg12 <= wire6[(4'he):(4'ha)];
      if ((-($unsigned(((~(8'hbe)) ?
          ((8'hb9) ? wire9 : wire10) : $unsigned(wire8))) > wire5)))
        begin
          reg13 <= (-(~&((|(wire5 ? wire9 : (8'hbf))) ?
              $signed($signed(reg12)) : (!$unsigned(wire7)))));
          reg14 <= $signed({wire5[(3'h6):(1'h1)]});
          reg15 <= (-$signed((+reg14)));
          reg16 <= ($unsigned((&{$signed(wire9), wire10[(3'h4):(3'h4)]})) ?
              (wire7[(3'h4):(3'h4)] | $unsigned({(8'ha3)})) : {(8'ha2),
                  {$unsigned(((8'had) ? reg12 : (8'ha6)))}});
        end
      else
        begin
          reg13 <= reg13;
          if ({reg14[(3'h6):(1'h1)]})
            begin
              reg14 <= $unsigned({({wire8, $signed(reg12)} ?
                      (wire5 ?
                          (~^(7'h42)) : ((7'h41) << (8'hb0))) : $signed(((8'hb4) ?
                          wire7 : wire7)))});
              reg15 <= wire5;
            end
          else
            begin
              reg14 <= $signed($unsigned($unsigned((wire9 ?
                  wire10[(4'hc):(3'h7)] : wire8[(1'h0):(1'h0)]))));
              reg15 <= (reg11[(1'h0):(1'h0)] ?
                  (~|reg15[(2'h2):(2'h2)]) : ((reg15 >>> (&(|wire10))) ?
                      (((reg16 ? reg11 : reg12) << $signed(wire9)) ?
                          wire8 : (~|(!(8'hb9)))) : reg13));
              reg16 <= reg16[(1'h1):(1'h0)];
              reg17 <= $unsigned(((($unsigned((8'hbd)) != $signed((8'hb0))) ?
                  {reg11} : $signed(wire6[(3'h7):(3'h7)])) & $signed(wire5[(4'h8):(3'h4)])));
              reg18 <= $unsigned(($unsigned(wire9) ?
                  $unsigned((8'hbd)) : wire8));
            end
          reg19 <= wire6;
          if ((wire8[(1'h1):(1'h1)] ?
              $signed((^reg18[(2'h3):(1'h1)])) : $signed((!$signed(reg16)))))
            begin
              reg20 <= wire8[(2'h2):(1'h0)];
              reg21 <= {wire8[(2'h2):(1'h0)]};
              reg22 <= {$unsigned(wire5), reg18[(1'h1):(1'h1)]};
              reg23 <= $unsigned(reg21);
              reg24 <= (($unsigned(wire6[(4'ha):(2'h2)]) != ($unsigned(reg13[(3'h6):(3'h6)]) ?
                  (reg14 >> (reg22 ? wire8 : wire6)) : (((8'hb8) ?
                      (8'hb4) : wire10) <<< reg23[(3'h5):(2'h3)]))) & $signed($signed(((8'hbf) ?
                  reg14 : $signed((8'h9c))))));
            end
          else
            begin
              reg20 <= $unsigned($signed({reg18[(3'h7):(1'h0)],
                  $signed($signed(reg17))}));
              reg21 <= (reg13 << $unsigned($unsigned($signed(wire5))));
              reg22 <= (reg23 ?
                  ((wire7[(3'h6):(3'h4)] || (|(wire5 >> reg16))) + $signed(($unsigned(reg19) ?
                      $signed(wire8) : (reg19 >>> reg23)))) : (($unsigned($signed((8'had))) && {(&reg16)}) ?
                      $signed(reg21[(3'h4):(1'h1)]) : $signed((reg13 ?
                          $signed(reg17) : reg11))));
              reg23 <= (&(^~wire7));
            end
        end
      reg25 <= $signed($signed($unsigned($unsigned($unsigned(reg20)))));
    end
  assign wire26 = (~^$unsigned($signed($unsigned(wire10[(5'h12):(4'hb)]))));
  assign wire27 = $unsigned($unsigned($unsigned((~^(reg21 ? wire10 : wire7)))));
  assign wire28 = (8'hb1);
  assign wire29 = $signed($unsigned({$unsigned(wire28),
                      ((8'hb9) ? (wire9 ? (8'ha4) : reg20) : (~|wire28))}));
  assign wire30 = wire7[(3'h6):(3'h5)];
  assign wire31 = (reg19[(4'hc):(3'h4)] > reg11);
  assign wire32 = (~($signed((-((8'h9f) ? reg19 : (8'ha9)))) ?
                      (-(&(reg25 > wire5))) : wire10));
  assign wire33 = wire7;
endmodule

module module65
#(parameter param86 = ((~^((((8'hba) != (8'ha2)) | (^~(8'hb2))) <= (((7'h43) ? (8'h9c) : (7'h43)) ? ((7'h44) ? (8'h9f) : (8'hba)) : ((8'ha2) ? (8'hb6) : (8'hb0))))) ? (-{({(8'hbe), (8'hb4)} < ((8'haf) ? (8'haf) : (8'ha9))), ((^(8'hb2)) ? ((8'hb9) ? (8'hb0) : (8'hb6)) : ((8'hab) ? (8'ha6) : (8'ha8)))}) : (({{(8'ha9)}} ? (7'h42) : (|(~^(8'hbd)))) << (-({(8'hb1)} ? ((8'hb7) + (8'hb9)) : ((8'hb8) ? (8'h9d) : (8'hb1)))))))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire signed [(4'h9):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg80,
                 (1'h0)};
  assign wire71 = {$unsigned($signed(wire68)),
                      $signed((&$unsigned($signed(wire69))))};
  assign wire72 = (wire70 ?
                      $unsigned($signed($signed((|wire66)))) : $unsigned(wire69[(2'h2):(2'h2)]));
  assign wire73 = (^~wire67);
  assign wire74 = $signed(wire72[(4'h8):(2'h3)]);
  assign wire75 = {$signed({(~(wire74 >>> wire72)), (~^wire73)})};
  assign wire76 = wire69[(1'h1):(1'h1)];
  assign wire77 = $signed((-(-{(&wire67), (~&wire69)})));
  assign wire78 = (8'hb5);
  assign wire79 = ($unsigned((~^wire76)) - ((|($unsigned(wire66) ?
                          (wire77 ? (8'hb7) : wire75) : wire75)) ?
                      ($signed($unsigned(wire73)) ?
                          ($unsigned((8'hbb)) - (wire67 & wire70)) : wire72[(2'h2):(1'h0)]) : wire75[(4'h9):(2'h2)]));
  always
    @(posedge clk) begin
      reg80 <= {(^~(~&wire76))};
    end
  assign wire81 = $unsigned($unsigned(($signed(wire76[(3'h5):(2'h3)]) <<< (wire78 && (wire73 ^~ wire69)))));
  assign wire82 = ((8'h9f) ?
                      wire66[(2'h3):(1'h1)] : (~&$unsigned($signed($signed((8'hbe))))));
  assign wire83 = $signed(wire75[(3'h6):(1'h1)]);
  assign wire84 = (wire75[(5'h10):(4'he)] ^~ wire70);
  assign wire85 = (~(wire79[(2'h2):(1'h1)] ?
                      wire82[(1'h0):(1'h0)] : reg80[(2'h2):(1'h1)]));
endmodule
