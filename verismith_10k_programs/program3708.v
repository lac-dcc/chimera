module top
#(parameter param108 = (~(|(+(((7'h40) ? (7'h42) : (7'h43)) ? ((8'hb8) << (8'ha2)) : ((8'hb2) * (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire97,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((($unsigned((~wire3)) ?
          {wire3[(3'h7):(3'h5)], (wire2 < wire4)} : (+((8'hbc) ?
              wire4 : (8'haa)))) && (wire1 ^ (8'ha4))) || $unsigned((~(8'ha3))));
      reg6 <= (~wire1);
    end
  assign wire7 = (~(wire1[(2'h2):(1'h1)] >> ({(wire0 << wire4),
                     (wire0 >> wire0)} >> ($signed(wire0) & $signed(reg6)))));
  assign wire8 = ((($signed((wire1 ? wire1 : (8'hbb))) ?
                         (&(wire2 ^~ reg6)) : ($unsigned(wire2) != (wire0 && wire1))) ?
                     (((reg5 <= (8'hb7)) ^ $unsigned(wire7)) + wire4) : (wire3[(4'ha):(1'h0)] ~^ $signed((wire1 ?
                         wire3 : wire2)))) ^~ $signed((((8'hb3) ?
                         (8'hb3) : wire1[(2'h2):(1'h0)]) ?
                     wire1[(1'h1):(1'h1)] : ($signed(wire7) ~^ $unsigned(wire4)))));
  assign wire9 = $unsigned(({$signed(reg5)} ?
                     ((!(wire2 ? wire0 : wire2)) ?
                         (~&wire0) : (wire2[(4'hb):(4'h9)] ?
                             $unsigned(reg5) : (8'hab))) : wire7));
  assign wire10 = $unsigned(((~|$signed($unsigned(wire1))) ?
                      ({(8'hbd),
                          {wire4, (8'hbd)}} >> $signed(wire1)) : (~|wire0)));
  assign wire11 = wire2[(4'hc):(4'ha)];
  assign wire12 = wire3[(1'h0):(1'h0)];
  assign wire13 = $unsigned(($signed($signed(wire8)) ?
                      wire10[(5'h13):(2'h2)] : $unsigned($unsigned($signed(wire12)))));
  module14 #() modinst98 (.y(wire97), .wire18(wire8), .clk(clk), .wire17(wire0), .wire15(reg5), .wire19(wire12), .wire16(wire11));
  assign wire99 = ($signed(wire11) ? wire4 : wire10);
  assign wire100 = ({((~^{wire99, wire11}) ?
                           $unsigned($signed(wire10)) : $signed(wire0))} * $signed((8'h9c)));
  assign wire101 = wire11[(4'h9):(1'h0)];
  assign wire102 = wire3[(3'h4):(1'h0)];
  assign wire103 = (|{wire102});
  assign wire104 = (((((wire103 ? wire4 : wire97) ?
                                   (wire97 <<< wire102) : (wire8 ?
                                       reg5 : wire10)) ?
                               ((wire10 ^ (8'h9d)) ?
                                   wire102[(2'h2):(1'h1)] : {wire12}) : wire12) ?
                           (wire103 | $unsigned((wire103 ?
                               wire7 : wire97))) : $unsigned((^(8'hae)))) ?
                       (~^(wire101 ?
                           wire4[(3'h4):(2'h2)] : wire11[(3'h4):(1'h1)])) : wire97[(4'h8):(3'h7)]);
  assign wire105 = wire9[(1'h0):(1'h0)];
  assign wire106 = ({$unsigned(wire101), $signed($signed(wire2))} ?
                       $unsigned((((|wire4) ? (-wire97) : $signed(wire103)) ?
                           $signed((~|wire7)) : {(|wire97),
                               $unsigned(wire99)})) : {(-wire7[(3'h4):(1'h1)]),
                           wire100[(3'h5):(2'h2)]});
  assign wire107 = (~|$unsigned(wire4[(3'h6):(2'h2)]));
endmodule

module module14
#(parameter param95 = ((((-(~^(8'hb9))) + (((7'h41) ? (8'ha9) : (8'ha3)) >> ((8'hb5) || (8'h9c)))) || (-{(&(8'h9c)), (~|(8'hbb))})) == (((((8'hae) ? (7'h42) : (8'hbc)) * ((8'haa) ? (8'hbf) : (8'hb1))) << (((8'haa) != (8'ha3)) ? ((8'hb2) && (8'hb1)) : ((8'hba) ? (8'ha3) : (8'ha7)))) ? {{{(8'ha0), (8'ha7)}, (~^(8'hbc))}, (((8'hbc) > (7'h42)) != (~&(8'hae)))} : (!(((8'hb5) ? (7'h42) : (8'ha9)) == ((8'ha8) <= (8'hb0)))))), 
parameter param96 = (({(^~((8'hbe) ? param95 : param95)), ((~|param95) == (^param95))} == ((~&param95) ? ((-param95) < (7'h43)) : ((-param95) ? param95 : (param95 + param95)))) ? param95 : param95))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  assign y = {wire94,
                 wire92,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire52,
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
                 reg63,
                 reg62,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire20 = ({wire15[(3'h4):(1'h1)],
                      ((~^$unsigned(wire17)) ?
                          (^~wire16[(4'hd):(4'hc)]) : ($unsigned(wire15) ?
                              (~^(8'hb9)) : $unsigned(wire16)))} > ((^((wire15 * wire15) && (!wire17))) << ($unsigned(wire16[(3'h6):(3'h6)]) ?
                      ((wire15 * wire15) ~^ wire15) : (^$unsigned(wire15)))));
  assign wire21 = wire15;
  assign wire22 = $signed({(($unsigned(wire21) <= $signed(wire16)) ?
                          $signed(wire16[(4'he):(1'h0)]) : $signed((wire18 ?
                              wire18 : (8'hb7)))),
                      wire18});
  assign wire23 = $unsigned($unsigned($signed(wire15[(3'h5):(1'h1)])));
  assign wire24 = wire15[(3'h5):(1'h1)];
  assign wire25 = {$signed(wire22[(2'h2):(2'h2)]),
                      (wire22 ~^ ({(^wire23)} | wire21))};
  assign wire26 = wire15[(3'h5):(1'h0)];
  assign wire27 = $unsigned($unsigned({wire16, ({wire22, wire24} + wire19)}));
  assign wire28 = ($unsigned((&($signed((8'h9f)) ?
                      (~wire21) : ((8'ha2) ~^ wire22)))) - ((($signed((8'hb8)) >>> wire25) | (~^(wire16 ?
                          wire18 : wire16))) ?
                      wire21 : ($signed(wire18[(3'h5):(3'h4)]) < ((^~wire18) < wire27[(4'hc):(4'h8)]))));
  assign wire29 = (((wire25[(2'h3):(1'h1)] ^ (wire21 > (wire21 ?
                          wire26 : (8'ha6)))) <<< $signed($unsigned((~(8'ha0))))) ?
                      wire16 : {$unsigned({$unsigned(wire26),
                              wire22[(1'h0):(1'h0)]}),
                          {$unsigned((wire24 ? (7'h40) : wire18)),
                              (|(wire23 && wire28))}});
  assign wire30 = {(&$signed($signed(wire18[(2'h2):(2'h2)])))};
  always
    @(posedge clk) begin
      if (wire23)
        begin
          reg31 <= $signed(((8'h9d) ? wire29[(3'h6):(3'h6)] : $signed(wire30)));
          if (({(wire18[(1'h0):(1'h0)] ?
                      (-(reg31 ? wire23 : wire20)) : (8'had))} ?
              wire20[(4'h8):(2'h2)] : (wire18 ?
                  $unsigned($signed({wire18})) : {((wire23 ?
                          wire16 : wire16) || (~&wire29))})))
            begin
              reg32 <= (~|$unsigned($unsigned($unsigned(reg31))));
              reg33 <= $signed(($signed($unsigned($signed(wire17))) ^ $unsigned($signed((wire23 * wire19)))));
              reg34 <= wire30;
            end
          else
            begin
              reg32 <= {(8'hb4)};
            end
          reg35 <= (($unsigned($unsigned((~^wire26))) >> (($signed(wire18) ^~ (wire30 && wire29)) | (reg34[(3'h7):(2'h2)] ?
              reg33 : $signed(wire24)))) && $unsigned($unsigned(($signed(reg32) ?
              $unsigned(wire27) : (^~reg33)))));
        end
      else
        begin
          reg31 <= wire18;
          reg32 <= $unsigned((+reg32[(4'h8):(2'h3)]));
          reg33 <= wire29;
          reg34 <= wire22;
          if (($signed({(~&$unsigned(wire20))}) & (($unsigned((reg33 ?
                      (7'h43) : wire24)) ?
                  wire23[(1'h0):(1'h0)] : wire24[(4'ha):(4'h8)]) ?
              (^~wire16[(1'h0):(1'h0)]) : $signed((~&(~&wire22))))))
            begin
              reg35 <= {(wire20[(1'h1):(1'h1)] ?
                      ($signed(wire21) ?
                          ({wire23} & (~|wire17)) : reg33[(4'he):(1'h1)]) : (wire29[(4'ha):(2'h2)] & ((wire24 ?
                          reg32 : (8'hbb)) ^ wire24[(2'h3):(1'h1)]))),
                  ({({reg32} ?
                          (wire16 - wire23) : (7'h40))} || $signed(($signed(wire25) ~^ wire16[(5'h12):(5'h12)])))};
              reg36 <= (~&($unsigned((~&wire29[(4'h8):(3'h6)])) >= {$unsigned((wire18 ?
                      wire21 : wire23)),
                  wire30[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg35 <= (~|wire16);
              reg36 <= $unsigned({($unsigned((~|reg36)) << (wire21 ?
                      (wire17 ? wire15 : wire28) : ((8'hb4) ?
                          (8'h9c) : wire28)))});
              reg37 <= $signed((wire26[(4'hb):(4'ha)] + $unsigned((8'hbe))));
              reg38 <= {(-{(~^(wire24 < wire16)), (-$signed(reg36))})};
              reg39 <= (~|{(~wire19[(2'h3):(2'h2)]),
                  (^$signed(((7'h42) != (8'haf))))});
            end
        end
      reg40 <= (-(+wire26[(1'h1):(1'h0)]));
      if ($unsigned(($unsigned(($signed(reg36) > (wire24 ? wire28 : (8'hba)))) ?
          (($signed(wire27) != wire28) ?
              wire28[(2'h3):(2'h2)] : (|(wire22 ?
                  wire23 : wire30))) : $unsigned(({reg39, reg31} <<< (reg35 ?
              wire27 : reg39))))))
        begin
          if ($signed(($unsigned(reg40) > (($signed(reg36) ?
                  wire26 : $signed((8'ha8))) ?
              {{wire27, (8'ha2)}} : $signed(((8'hae) >= reg32))))))
            begin
              reg41 <= $unsigned($unsigned((wire23 ?
                  (7'h43) : ($unsigned(wire30) * (8'hba)))));
              reg42 <= (($unsigned(wire16) == (~(|(+wire19)))) == (~|wire20));
              reg43 <= $unsigned($signed(wire23));
              reg44 <= ((((~{reg39}) * wire16[(4'hf):(4'hf)]) >>> (wire27[(1'h1):(1'h1)] ?
                      ({wire18} ?
                          $signed(wire18) : (wire20 ?
                              wire29 : (7'h40))) : $signed(wire29[(4'h8):(2'h2)]))) ?
                  wire26 : reg32[(3'h4):(1'h1)]);
              reg45 <= reg38;
            end
          else
            begin
              reg41 <= wire19;
              reg42 <= reg32[(3'h5):(2'h3)];
              reg43 <= reg33;
              reg44 <= {wire24[(4'hf):(1'h0)]};
            end
        end
      else
        begin
          reg41 <= wire17[(1'h0):(1'h0)];
        end
      if ($signed(wire30[(2'h2):(1'h0)]))
        begin
          reg46 <= ((~&(((8'h9c) ?
              (reg43 ? reg35 : reg32) : (wire25 > wire17)) & (reg41 ?
              (reg40 ?
                  reg35 : wire17) : (|wire22)))) ^ $signed($signed(wire30[(2'h2):(1'h1)])));
          reg47 <= $signed({wire24[(4'hb):(4'hb)]});
          reg48 <= {$unsigned((+wire30[(1'h1):(1'h1)])),
              ((($signed(wire26) ?
                  (^wire21) : wire21) ^~ (wire16[(1'h1):(1'h0)] ?
                  (~|wire16) : wire22)) >>> ($signed(wire18[(3'h6):(1'h1)]) ?
                  reg35[(2'h2):(1'h0)] : wire24))};
          reg49 <= (&wire24);
          reg50 <= reg40;
        end
      else
        begin
          reg46 <= (wire30 << $signed((~wire27)));
          if ($signed(({wire26} ?
              (($unsigned(reg35) || (+reg38)) ?
                  reg41 : ((^reg49) && {wire22,
                      reg47})) : ((8'ha9) + wire24[(2'h2):(2'h2)]))))
            begin
              reg47 <= {$unsigned(reg42[(3'h6):(3'h4)]),
                  ((wire20 ? reg47 : wire25) ?
                      $unsigned(($unsigned(reg48) ~^ wire28[(3'h5):(1'h1)])) : reg34)};
              reg48 <= $unsigned(({wire20, (8'hbe)} ?
                  {{(~|wire18),
                          $signed(reg36)}} : $unsigned(wire29[(4'h8):(3'h7)])));
              reg49 <= (reg34 <= $unsigned((~^wire15[(1'h1):(1'h0)])));
            end
          else
            begin
              reg47 <= {(8'h9e), $unsigned(reg43[(3'h5):(3'h4)])};
              reg48 <= $unsigned(wire15);
              reg49 <= $signed(($signed((8'hb3)) ~^ (~{(7'h41)})));
              reg50 <= {wire26[(3'h6):(1'h1)]};
            end
        end
      reg51 <= (^~$signed(reg47[(4'h9):(3'h4)]));
    end
  assign wire52 = (~^$signed((wire20[(4'h8):(1'h0)] >= ($unsigned(reg40) + $unsigned(reg41)))));
  always
    @(posedge clk) begin
      reg53 <= wire18;
      reg54 <= ((~{((reg42 ? reg31 : (8'hac)) ? (wire30 >>> (8'hb9)) : {reg53}),
              wire30}) ?
          ($unsigned($signed($unsigned(reg53))) ?
              reg51[(3'h4):(2'h3)] : {reg50[(4'ha):(3'h7)]}) : ((reg38[(1'h1):(1'h1)] ^ (wire27 ?
                  $unsigned(wire26) : $signed(reg47))) ?
              wire30[(2'h2):(1'h0)] : ((!$unsigned(wire24)) <= reg39[(2'h3):(1'h0)])));
      reg55 <= $signed($signed(reg33));
      reg56 <= ($signed((reg37 ?
          (8'ha1) : $signed($unsigned((8'ha3))))) + (~|wire29[(5'h12):(2'h2)]));
    end
  assign wire57 = (reg40 ? reg54[(5'h11):(4'h8)] : reg51[(3'h4):(1'h0)]);
  assign wire58 = wire27[(4'h9):(1'h0)];
  assign wire59 = (~^$unsigned(((8'h9c) < wire25[(3'h5):(3'h4)])));
  assign wire60 = (&(wire52 ?
                      $signed(({wire25, reg55} ?
                          wire24[(1'h1):(1'h0)] : $unsigned((8'ha2)))) : $signed(wire24)));
  assign wire61 = $unsigned(wire25);
  always
    @(posedge clk) begin
      reg62 <= wire24;
      reg63 <= {wire26[(4'h9):(3'h4)],
          (reg37 >= $unsigned($unsigned((wire24 ? reg42 : (8'ha1)))))};
    end
  module64 #() modinst93 (.wire66(wire29), .wire67(reg36), .wire65(wire19), .y(wire92), .wire68(reg55), .clk(clk));
  assign wire94 = (&(reg42 && (!$signed((+reg47)))));
endmodule

module module64  (y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire68;
  input wire [(4'h8):(1'h0)] wire67;
  input wire [(4'hb):(1'h0)] wire66;
  input wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire81,
                 wire75,
                 wire74,
                 wire70,
                 wire69,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire69 = wire67;
  assign wire70 = $unsigned(wire66);
  always
    @(posedge clk) begin
      reg71 <= wire65;
      reg72 <= wire69[(2'h2):(1'h0)];
      reg73 <= ($signed({({wire70} ^ $unsigned(reg71)),
          (wire65 ? wire70[(1'h1):(1'h0)] : (wire67 - reg71))}) <= {reg71,
          reg71[(4'hd):(4'ha)]});
    end
  assign wire74 = {$unsigned((&(!{wire68, reg73})))};
  assign wire75 = wire70[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg76 <= $signed($signed((wire66 && wire66[(3'h6):(3'h6)])));
      reg77 <= wire74;
      reg78 <= reg77;
      reg79 <= (($signed((8'ha0)) < ($signed($signed(reg72)) - (^$unsigned(reg77)))) ?
          (({{reg73}, wire74[(4'h8):(3'h5)]} + $signed($unsigned(reg78))) ?
              ((|reg77) | reg77) : wire66) : ((8'hba) ?
              ((^~{wire75}) ?
                  wire66[(2'h3):(2'h3)] : $unsigned((reg78 ?
                      reg71 : wire66))) : (wire70[(1'h1):(1'h1)] ?
                  $unsigned(wire75) : ((reg78 + wire74) - (wire66 ?
                      wire75 : wire65)))));
      reg80 <= wire74[(4'hb):(4'h8)];
    end
  assign wire81 = $unsigned($signed($unsigned($unsigned(reg71))));
  always
    @(posedge clk) begin
      reg82 <= $signed($signed(($unsigned(wire67[(1'h1):(1'h0)]) ?
          (^~wire75) : ((+reg71) >>> (wire69 ? reg76 : (8'hbf))))));
      if (({wire81, {(&reg76[(3'h5):(1'h0)])}} && (^~(-wire68[(3'h4):(3'h4)]))))
        begin
          reg83 <= reg77[(3'h4):(1'h0)];
        end
      else
        begin
          reg83 <= $unsigned((&$signed({(reg76 || (8'ha4)), wire81})));
        end
      reg84 <= (wire68 ?
          $signed(reg73[(4'hc):(2'h3)]) : wire65[(5'h13):(3'h7)]);
      reg85 <= (^reg77);
      reg86 <= ($signed(($unsigned($unsigned((8'hb3))) ?
          reg72 : $signed({reg82, reg84}))) | $signed((8'ha7)));
    end
  assign wire87 = $signed((~&(!{(~(8'ha1)), wire66[(2'h3):(1'h1)]})));
  assign wire88 = reg82[(4'ha):(4'ha)];
  assign wire89 = {(wire66[(1'h1):(1'h0)] != ({(|reg72)} || {wire87}))};
  assign wire90 = ({wire68[(3'h6):(3'h5)]} << (+reg84));
  assign wire91 = (&((reg71[(3'h5):(3'h4)] <<< wire88) <= $signed($signed((-(8'hb8))))));
endmodule
