module top
#(parameter param110 = ((((!((8'hbb) * (8'h9c))) ? {{(7'h42), (8'hb8)}} : (8'ha5)) ? (&((-(8'hbe)) ? (|(8'hbe)) : ((7'h41) == (8'hbd)))) : (((~(8'hbc)) > ((8'h9e) ? (8'hbe) : (8'hb5))) ? (~((8'ha4) ? (8'hae) : (8'hb4))) : (((8'hb4) ^ (8'hb7)) ? {(8'hb9)} : ((8'hb8) ^~ (8'hb6))))) ? ((~(~|(^(7'h44)))) ? ((~^((8'hbe) == (8'ha3))) ? ({(8'ha3)} - ((8'h9e) ? (8'had) : (8'hb5))) : (((8'hae) - (8'hb4)) ? {(8'hb2)} : ((8'hbe) ^~ (8'hb0)))) : ((((8'ha1) >>> (8'hae)) ? (8'hb4) : {(8'hbb), (8'hb4)}) ? (((7'h42) ? (7'h41) : (8'hbc)) ? {(7'h42), (8'hb6)} : ((8'hb6) ? (8'hac) : (8'hbc))) : (((7'h40) | (8'hbe)) ? ((8'hb3) ? (7'h41) : (8'hb3)) : ((8'ha1) ? (8'ha0) : (7'h40))))) : (|(^~(!((8'ha8) ~^ (7'h43)))))), 
parameter param111 = {param110, param110})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire109,
                 wire107,
                 wire24,
                 wire15,
                 wire14,
                 wire13,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg5 <= $signed({$unsigned((wire4[(4'hf):(2'h2)] ?
                  (~|(8'haa)) : (+(8'h9f))))});
          reg6 <= ({(^~(~&{(8'ha1)}))} != reg5);
          if ({$unsigned($signed(wire2[(3'h6):(3'h4)])), $unsigned(reg6)})
            begin
              reg7 <= $signed((+{(|(wire2 >> reg5))}));
              reg8 <= reg7;
              reg9 <= $signed((reg6[(5'h10):(1'h1)] ?
                  $signed(($signed(reg8) ? wire2 : wire1)) : wire0));
              reg10 <= (reg6 ?
                  reg5[(2'h3):(2'h3)] : ($unsigned(wire1[(3'h7):(2'h2)]) + wire2[(4'h8):(3'h4)]));
              reg11 <= $unsigned($signed({{reg9, (wire0 ^ reg6)},
                  reg6[(3'h4):(1'h1)]}));
            end
          else
            begin
              reg7 <= (8'ha9);
            end
        end
      else
        begin
          reg5 <= $unsigned(wire1[(3'h4):(2'h3)]);
          if ($signed($unsigned($unsigned((|$signed((8'hba)))))))
            begin
              reg6 <= wire2;
              reg7 <= (+(8'hae));
            end
          else
            begin
              reg6 <= wire2;
              reg7 <= $unsigned(((|(wire2 ~^ wire3[(1'h0):(1'h0)])) == reg9));
            end
        end
      reg12 <= {($unsigned((8'hba)) << wire4)};
    end
  assign wire13 = $unsigned(wire2[(4'h8):(1'h1)]);
  assign wire14 = wire2[(1'h0):(1'h0)];
  assign wire15 = {(~$signed($unsigned({wire2, reg6})))};
  always
    @(posedge clk) begin
      reg16 <= $unsigned(reg10[(4'ha):(3'h4)]);
      if ({((wire13[(4'h8):(4'h8)] ? wire15 : ($signed(reg10) >>> (~|reg6))) ?
              (~^$signed($unsigned((8'hbc)))) : {($unsigned(reg11) ?
                      wire1[(4'he):(3'h6)] : $signed(reg12)),
                  $signed((reg12 ? reg16 : wire15))}),
          $signed($signed(reg5[(1'h0):(1'h0)]))})
        begin
          reg17 <= $unsigned($signed(({reg10[(1'h0):(1'h0)],
                  ((7'h40) ? wire0 : reg6)} ?
              {$unsigned(reg11)} : ($unsigned(wire3) * (reg16 != (7'h42))))));
          reg18 <= $signed(reg16[(3'h5):(1'h0)]);
          reg19 <= ((-((wire0[(4'hc):(2'h2)] ?
                  (reg8 ? wire14 : wire0) : (^wire15)) ?
              reg18 : (^{wire14}))) == (~&wire3));
          reg20 <= (^$unsigned((~&reg5)));
        end
      else
        begin
          reg17 <= $unsigned(wire4[(4'he):(3'h5)]);
          if (($signed(reg7[(4'ha):(3'h7)]) ?
              $unsigned((((~wire13) == (reg9 < reg11)) ?
                  ({wire15} ?
                      (^~reg16) : wire4) : $unsigned((!reg20)))) : $unsigned(((~&(8'hb3)) - $signed(reg18[(3'h7):(3'h5)])))))
            begin
              reg18 <= $signed((-(&$unsigned((8'ha2)))));
              reg19 <= $signed((reg19 << wire1[(4'h8):(1'h0)]));
              reg20 <= {$unsigned(wire0)};
              reg21 <= reg6;
              reg22 <= $unsigned(($signed($unsigned(wire15[(1'h1):(1'h0)])) ?
                  $unsigned(($signed(reg5) ?
                      reg12[(3'h4):(1'h1)] : (reg20 ?
                          (8'hb5) : wire3))) : $signed($signed($signed(wire1)))));
            end
          else
            begin
              reg18 <= reg8;
              reg19 <= reg10;
              reg20 <= {((&{$signed(reg9)}) <= $signed($signed($unsigned(wire4)))),
                  ({$unsigned($signed(wire14)), reg16} ?
                      reg9 : {wire0, wire15})};
            end
        end
    end
  always
    @(posedge clk) begin
      reg23 <= (reg5 && $signed((reg19 ?
          $unsigned((reg6 << wire4)) : $signed(wire15[(5'h10):(3'h4)]))));
    end
  assign wire24 = ((^(reg9 >> reg17)) ?
                      ((~|wire15) ?
                          (reg16 ?
                              (8'ha4) : (reg12[(3'h4):(2'h2)] ?
                                  (~reg10) : (reg10 <= reg11))) : reg9[(4'he):(3'h4)]) : (wire4 ?
                          wire14[(4'h9):(4'h8)] : {(^~$unsigned(reg17))}));
  always
    @(posedge clk) begin
      reg25 <= {$unsigned((8'ha0))};
      reg26 <= (|(+((&(reg17 >> wire1)) ~^ wire24)));
    end
  module27 #() modinst108 (wire107, clk, reg12, reg20, wire24, wire14);
  assign wire109 = {reg12, (~^wire4)};
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire32;
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire90,
                 wire32,
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
                 (1'h0)};
  assign wire32 = (wire29 ?
                      (~{((wire31 - wire28) ? wire30 : {wire31}),
                          ((wire30 + wire29) ?
                              (8'hb7) : {(8'hbf), (8'hb5)})}) : {wire29,
                          wire28[(1'h1):(1'h0)]});
  module33 #() modinst91 (wire90, clk, wire30, wire29, wire32, wire31);
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg92 <= {wire28};
          reg93 <= $signed({$signed(wire30)});
        end
      else
        begin
          if ($unsigned($unsigned(wire28)))
            begin
              reg92 <= reg93[(3'h5):(1'h0)];
              reg93 <= (8'haa);
              reg94 <= (wire90[(1'h0):(1'h0)] ? wire31 : wire31[(3'h7):(3'h7)]);
              reg95 <= $unsigned((({$unsigned(reg92),
                      $unsigned(wire90)} != (&(wire32 <<< reg92))) ?
                  {$signed({(8'h9e), wire29})} : {(&$unsigned(reg92))}));
            end
          else
            begin
              reg92 <= {$unsigned($signed(wire32))};
              reg93 <= wire90;
            end
          reg96 <= (wire28[(1'h0):(1'h0)] ?
              wire30 : $unsigned({($unsigned(reg92) < (&wire90)),
                  $signed($signed(reg92))}));
        end
      reg97 <= wire28;
      if (($signed(wire28[(2'h2):(1'h1)]) ?
          wire90 : (|(~{$signed(wire30), (wire31 ? wire31 : (8'ha9))}))))
        begin
          if ((reg92 ?
              $signed(((((8'hae) ? wire32 : (8'hab)) ?
                      wire29 : ((8'hbf) > (8'ha4))) ?
                  reg92[(3'h5):(2'h2)] : $signed(((8'ha5) ?
                      reg92 : wire31)))) : ({$signed($signed(reg97))} && (wire28 ?
                  $unsigned(wire29) : $unsigned((reg96 * reg97))))))
            begin
              reg98 <= wire28[(1'h1):(1'h0)];
              reg99 <= $signed(((~&($signed((8'hb3)) ?
                  wire29[(4'h9):(4'h8)] : wire30[(1'h0):(1'h0)])) <= (((wire32 < wire29) ?
                      $unsigned(reg95) : (wire30 ? (8'hb3) : wire90)) ?
                  $signed((wire30 ? reg96 : reg93)) : ((!wire28) ?
                      ((8'hb5) ? reg92 : reg93) : reg98))));
              reg100 <= wire29;
            end
          else
            begin
              reg98 <= $signed({$unsigned($signed((wire29 ?
                      (8'haf) : wire90)))});
              reg99 <= {{(reg97 ? (~|wire30) : {$signed(wire90)})}};
              reg100 <= $signed(reg97);
            end
          reg101 <= (wire30 * (~&($unsigned((reg96 ?
              reg95 : reg97)) != ((reg98 ? wire28 : wire32) + wire90))));
          reg102 <= ($signed($unsigned(($signed(reg99) > (reg97 ?
                  reg92 : reg101)))) ?
              {$signed($signed($signed(reg96)))} : reg92);
          reg103 <= $signed((((((8'hb1) <<< reg97) ?
                  $signed((8'hb6)) : $signed((8'hac))) >> (7'h43)) ?
              ((^~(!(8'ha7))) ?
                  ((^~reg93) ?
                      (reg98 ~^ reg97) : {reg97,
                          wire29}) : wire28) : $signed({reg97[(4'hc):(4'hc)]})));
        end
      else
        begin
          reg98 <= (8'hb0);
          reg99 <= $signed(((reg99[(2'h2):(1'h0)] ^ $unsigned((&wire30))) ?
              reg99[(1'h0):(1'h0)] : ((-$unsigned(reg100)) ?
                  $unsigned((!reg101)) : (^~(reg103 ? reg99 : reg98)))));
          reg100 <= (+$unsigned($signed($signed($unsigned(reg96)))));
          reg101 <= ({(^reg94[(2'h2):(2'h2)])} != $unsigned($signed($signed((|reg101)))));
        end
      reg104 <= {{($signed(reg92) ?
                  (~&$unsigned(reg101)) : (~^(reg97 ~^ wire28)))},
          ($signed(((~|reg103) ? {wire28, reg96} : reg96)) ?
              reg95[(1'h0):(1'h0)] : {reg94[(2'h3):(1'h1)],
                  $unsigned((reg95 ? reg99 : reg101))})};
    end
  assign wire105 = reg103[(4'h8):(1'h0)];
  assign wire106 = $signed($unsigned(reg93));
endmodule

module module33
#(parameter param89 = (!(|(+(((8'ha6) ? (8'ha0) : (8'hbe)) - {(8'hbc), (8'h9d)})))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h259):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire66,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire45,
                 wire40,
                 wire39,
                 wire38,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire38 = ({wire34[(4'h9):(4'h9)]} ?
                      (wire34 == (~&((8'h9c) ?
                          {(8'hb9),
                              wire35} : $unsigned(wire35)))) : (^~wire37[(3'h4):(1'h0)]));
  assign wire39 = wire37[(3'h6):(2'h3)];
  assign wire40 = wire39[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg41 <= $signed(($signed((~wire34)) && $signed(wire37[(2'h2):(2'h2)])));
      reg42 <= wire38;
      reg43 <= wire35;
      reg44 <= ($signed(wire39[(3'h7):(1'h1)]) << (((^~reg41) != $unsigned($signed(wire35))) ?
          (~&{(wire36 < wire37),
              wire40[(3'h6):(3'h5)]}) : $signed(wire34[(2'h2):(1'h1)])));
    end
  assign wire45 = ($unsigned(wire36[(2'h2):(2'h2)]) != wire39);
  always
    @(posedge clk) begin
      reg46 <= ($unsigned((&wire45)) ?
          $unsigned((~^$signed($unsigned((8'ha7))))) : $unsigned({(+wire34),
              reg42}));
      reg47 <= wire45[(4'hb):(2'h2)];
      reg48 <= $signed((wire45 ?
          (wire34 >> (&(~reg47))) : $signed((~^(wire34 ? reg47 : wire40)))));
      reg49 <= ((((reg48 << wire34) >= wire45[(4'hc):(4'hc)]) || $signed((+(8'had)))) ?
          reg44 : {($signed($unsigned(reg42)) << ({reg43} != wire35))});
      if ($unsigned(((($signed(reg47) ?
          (wire34 == wire38) : reg47[(1'h0):(1'h0)]) | (8'haf)) || ($signed($signed((8'ha1))) ?
          $unsigned($signed(wire45)) : wire37[(3'h4):(2'h3)]))))
        begin
          reg50 <= reg44;
          reg51 <= (^(($signed({(8'hb0), reg43}) || $signed(wire34)) ?
              wire45 : $unsigned(reg50[(4'hc):(4'h8)])));
          if ($unsigned((-reg47)))
            begin
              reg52 <= reg51[(2'h3):(1'h0)];
              reg53 <= reg50[(3'h6):(3'h5)];
              reg54 <= {{(({wire34, wire35} ?
                          {reg43} : (|(8'had))) | wire35[(4'h9):(3'h5)])}};
            end
          else
            begin
              reg52 <= ($signed((wire36 < {$signed(reg47)})) ?
                  (($signed((|reg42)) < (!wire38)) >>> reg41) : $signed($unsigned({(~reg41),
                      {reg44}})));
              reg53 <= $signed(($signed($unsigned($unsigned(reg42))) || $unsigned(reg49[(4'h9):(4'h8)])));
              reg54 <= {($signed(reg49[(4'h8):(2'h2)]) > $signed($unsigned(((8'h9f) >>> reg50))))};
              reg55 <= reg54;
            end
        end
      else
        begin
          reg50 <= reg52;
          reg51 <= (-$unsigned((~^wire39)));
          reg52 <= (8'hb4);
        end
    end
  assign wire56 = $unsigned({reg42[(3'h4):(1'h1)]});
  assign wire57 = ((~|((&$unsigned(reg43)) ?
                          (wire56 ?
                              (|wire56) : $unsigned(wire56)) : (~&reg44[(1'h1):(1'h0)]))) ?
                      $unsigned(reg44) : (+(((^~wire40) >= reg55) ?
                          (~&(wire56 ~^ reg49)) : {(reg41 ?
                                  wire37 : wire34)})));
  assign wire58 = wire36;
  assign wire59 = {($unsigned($signed((-wire58))) + ($signed({(8'ha9)}) ?
                          $unsigned(((8'ha0) ?
                              reg48 : wire36)) : (reg54[(3'h5):(1'h1)] ~^ (~reg55)))),
                      ($signed($signed(wire45)) ?
                          $signed($signed($signed((8'h9f)))) : $signed({$unsigned(wire37),
                              (!(8'ha3))}))};
  always
    @(posedge clk) begin
      reg60 <= $unsigned(reg55);
      reg61 <= (+reg50[(3'h4):(2'h3)]);
      reg62 <= reg43;
      if ($signed((~|wire37[(2'h2):(1'h0)])))
        begin
          reg63 <= (reg50[(4'h8):(1'h1)] - reg60);
        end
      else
        begin
          if (((+(-reg46[(5'h12):(3'h5)])) ?
              $unsigned(($signed((-wire35)) ?
                  reg54 : ((reg44 << wire35) ?
                      (reg61 <<< reg42) : (wire36 ?
                          wire34 : wire38)))) : $signed($signed({reg62}))))
            begin
              reg63 <= (7'h42);
            end
          else
            begin
              reg63 <= (^(((-$signed(reg55)) > (reg46[(5'h12):(3'h5)] ?
                      $signed(reg52) : (|wire37))) ?
                  (8'h9e) : (8'hb4)));
              reg64 <= $signed(($unsigned($signed(wire40[(3'h7):(1'h1)])) ?
                  (!reg50) : $unsigned(($signed(wire38) >>> ((8'hb1) - reg41)))));
              reg65 <= $unsigned(reg43);
            end
        end
    end
  assign wire66 = (~|(wire57[(1'h0):(1'h0)] ?
                      (~wire35[(2'h2):(1'h1)]) : (wire56[(2'h2):(1'h1)] ?
                          $unsigned(((8'hb6) ?
                              wire38 : reg60)) : $signed($signed(reg52)))));
  always
    @(posedge clk) begin
      reg67 <= reg48[(4'h8):(2'h2)];
      reg68 <= $signed($unsigned(((|reg52) || reg51[(2'h3):(1'h1)])));
      reg69 <= $signed({$signed(($unsigned((8'ha8)) >= {reg50, wire40})),
          ((~|(wire40 ? reg49 : reg43)) ?
              {reg53} : {wire40[(2'h3):(2'h3)], reg51[(1'h0):(1'h0)]})});
      reg70 <= (!(|reg42));
      if (reg41)
        begin
          reg71 <= reg54[(3'h7):(3'h6)];
          if ((8'hb1))
            begin
              reg72 <= (((((reg46 ? (8'hac) : (8'hbc)) ?
                          (reg43 ? (8'hb6) : wire56) : reg69) ?
                      reg54 : (~&$unsigned((8'hac)))) && $signed($signed($signed(wire34)))) ?
                  $signed((reg49[(3'h5):(3'h4)] ?
                      reg65[(3'h4):(2'h3)] : reg67)) : $signed($unsigned($signed($unsigned((8'hb8))))));
              reg73 <= ($signed((((wire45 ? wire57 : wire58) ?
                      wire34[(2'h3):(2'h2)] : (reg67 ? reg64 : reg41)) ?
                  reg64 : {wire58[(4'h9):(1'h0)],
                      (wire37 || reg43)})) & $unsigned(wire45[(4'ha):(2'h2)]));
              reg74 <= {reg70[(5'h12):(4'he)]};
            end
          else
            begin
              reg72 <= wire45[(4'hb):(4'h9)];
              reg73 <= $signed(reg64[(3'h6):(3'h5)]);
              reg74 <= reg50[(3'h4):(1'h0)];
            end
        end
      else
        begin
          if (((8'ha1) > reg44[(3'h4):(2'h3)]))
            begin
              reg71 <= (~|$signed((~&(&$signed(reg53)))));
            end
          else
            begin
              reg71 <= (8'ha4);
              reg72 <= $unsigned({$unsigned((~|$signed(reg69))),
                  (reg61 >> ($unsigned(reg54) * (8'ha7)))});
              reg73 <= reg42[(2'h3):(2'h3)];
            end
          reg74 <= ($signed({(~(reg74 ? reg72 : reg63))}) ?
              $unsigned((7'h40)) : reg72[(3'h4):(1'h1)]);
          reg75 <= wire37[(3'h6):(1'h0)];
          reg76 <= $signed((|wire34));
          reg77 <= $signed($unsigned(wire66[(1'h0):(1'h0)]));
        end
    end
  assign wire78 = $unsigned((reg65[(1'h1):(1'h1)] ?
                      (($signed((8'hbc)) <= wire35[(1'h0):(1'h0)]) ?
                          reg43 : (reg73 ?
                              reg48[(4'ha):(3'h5)] : $unsigned(reg63))) : (^(|$signed(wire40)))));
  always
    @(posedge clk) begin
      reg79 <= ($unsigned($signed($signed((~(8'h9e))))) ?
          reg41[(1'h0):(1'h0)] : $unsigned(reg69[(4'he):(3'h5)]));
      reg80 <= wire56[(3'h4):(1'h1)];
      reg81 <= wire35[(3'h5):(3'h4)];
      reg82 <= $unsigned($signed($signed((&(8'haf)))));
    end
  assign wire83 = {(reg65 ~^ $unsigned((~(wire38 ? (7'h40) : reg47))))};
  assign wire84 = (reg81[(2'h3):(1'h1)] ^ reg51[(2'h2):(2'h2)]);
  assign wire85 = reg48[(4'h8):(3'h6)];
  assign wire86 = (reg80[(3'h6):(2'h3)] || {{($unsigned(wire59) ?
                              reg54[(3'h5):(1'h0)] : wire59[(2'h3):(2'h3)])},
                      reg61[(5'h11):(2'h2)]});
  assign wire87 = (~((+((~&(8'hb2)) ?
                      reg52 : $unsigned(reg60))) > (!($signed((8'haa)) ^ (|reg46)))));
  assign wire88 = {($unsigned($unsigned($unsigned(wire35))) != (|(&wire57[(1'h1):(1'h0)]))),
                      (wire35[(4'ha):(3'h5)] & $unsigned({((8'h9e) * reg47),
                          $unsigned(wire85)}))};
endmodule
