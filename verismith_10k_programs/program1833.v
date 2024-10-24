module top
#(parameter param106 = ((((7'h43) ? (^~((8'h9c) & (8'hbf))) : (((8'hbf) ? (8'hbd) : (8'hb8)) ? (~&(8'hba)) : (~(8'hac)))) ? ({((8'hb9) ? (8'hbe) : (8'ha6))} ? ((8'hb9) ~^ ((8'hae) >> (8'hbc))) : (8'hb2)) : {((!(7'h43)) != {(7'h42), (8'ha7)})}) >= (((!(|(8'hb5))) ? (((8'hb6) <<< (8'hbd)) * {(8'hb0), (7'h42)}) : {{(8'ha5), (8'hb0)}}) ? {((|(8'hba)) & ((8'hb3) ? (8'ha4) : (8'h9d))), (8'hb0)} : ((((8'hb7) ? (8'hab) : (8'ha6)) ? ((8'hb0) <<< (8'h9e)) : ((8'ha0) ? (8'hb7) : (8'h9c))) ? (&(&(8'ha5))) : ((|(8'hbc)) - ((8'had) ^~ (8'hab)))))), 
parameter param107 = ((param106 ? param106 : param106) ? ((~^{(param106 ^~ param106), param106}) == (&param106)) : param106))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  assign y = {wire104,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~|$signed({$signed($signed(wire0)), $unsigned(wire3)})))
        begin
          reg5 <= wire4;
          reg6 <= {wire3};
          if ($signed($signed((~|{(+(8'ha0))}))))
            begin
              reg7 <= wire2[(1'h0):(1'h0)];
            end
          else
            begin
              reg7 <= $signed((~^($unsigned({wire1, reg5}) ?
                  wire2 : (((8'hb4) - wire3) ?
                      $signed(reg5) : (reg7 ? wire3 : reg7)))));
              reg8 <= $signed($signed($unsigned((~(reg6 >= reg7)))));
              reg9 <= (|(reg5 << {(wire0 ? $signed(reg8) : (^~wire2))}));
              reg10 <= (~&((~&reg6[(3'h4):(3'h4)]) >= (wire2[(2'h2):(1'h0)] - (~|(wire4 ?
                  reg5 : wire0)))));
              reg11 <= (+reg8[(4'h9):(3'h5)]);
            end
          reg12 <= ($signed(wire3[(4'he):(4'he)]) < $unsigned((^$signed((reg8 ?
              reg8 : wire3)))));
          reg13 <= {reg5};
        end
      else
        begin
          reg5 <= (-$unsigned((8'hb9)));
          reg6 <= (~&reg12[(1'h1):(1'h0)]);
          reg7 <= wire3[(4'hc):(3'h4)];
          reg8 <= ({$unsigned((&wire3[(4'ha):(2'h2)])),
              {($unsigned(reg13) == (reg10 <= wire0)),
                  reg5[(5'h10):(4'h8)]}} | ((!{{(8'h9c), reg13}, (&reg12)}) ?
              $signed($unsigned((~reg8))) : reg12[(2'h2):(1'h1)]));
          reg9 <= reg13[(1'h0):(1'h0)];
        end
      reg14 <= (({{$signed((7'h44))}, reg13[(1'h1):(1'h1)]} ?
          $unsigned($signed($signed(wire4))) : $signed($unsigned(wire1[(4'ha):(4'ha)]))) >> $unsigned({reg5,
          ($signed((8'h9d)) ? (wire2 ^~ reg12) : reg8)}));
    end
  assign wire15 = ($unsigned(wire0) != $signed((~reg14[(2'h2):(1'h0)])));
  assign wire16 = reg7;
  assign wire17 = (7'h43);
  assign wire18 = wire16;
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire1[(1'h1):(1'h0)]);
      reg20 <= (^$signed($unsigned((^$signed(reg6)))));
      if ($signed((~&reg20[(2'h3):(1'h0)])))
        begin
          reg21 <= (+$signed(wire15[(5'h11):(2'h2)]));
          if ($unsigned((wire17 ?
              {wire4[(4'h9):(2'h2)]} : (-$signed($unsigned(reg10))))))
            begin
              reg22 <= ((8'hb6) ?
                  $unsigned((-($unsigned(reg12) ?
                      {reg12,
                          reg7} : $unsigned((8'hba))))) : reg11[(2'h3):(2'h2)]);
              reg23 <= (~&(!(8'hba)));
              reg24 <= {reg19[(2'h2):(2'h2)],
                  ($signed(reg7[(4'hb):(4'h8)]) ?
                      ((8'hba) ^ $unsigned((|reg23))) : ((-reg13[(2'h2):(2'h2)]) ?
                          $signed($signed(reg5)) : {(wire0 <= wire3),
                              ((8'h9f) ~^ reg8)}))};
              reg25 <= (reg20[(3'h7):(3'h6)] ^~ $unsigned(reg8[(3'h6):(2'h3)]));
              reg26 <= ({reg13,
                  $signed((reg5 ?
                      (^~(8'had)) : $signed(wire4)))} >>> (reg8[(4'hc):(3'h7)] && ($unsigned($signed((8'ha0))) * (reg14[(3'h4):(1'h1)] ?
                  $unsigned(reg9) : reg6))));
            end
          else
            begin
              reg22 <= $unsigned($unsigned($unsigned(({reg13} ?
                  (reg7 || wire18) : (reg24 >> reg23)))));
            end
          reg27 <= wire3[(4'ha):(3'h5)];
        end
      else
        begin
          reg21 <= ((~|reg7[(5'h11):(5'h11)]) << (reg12[(3'h6):(3'h4)] << (~^(!$signed((8'hbe))))));
          reg22 <= $unsigned(reg27[(3'h4):(2'h3)]);
          reg23 <= ($signed((wire17 ?
                  ($signed(reg25) ? (reg8 | (8'hab)) : (8'ha3)) : (8'hb8))) ?
              {(reg24 >= reg22[(1'h0):(1'h0)]),
                  {wire0, wire17}} : reg21[(1'h1):(1'h1)]);
          if (reg8)
            begin
              reg24 <= (!$unsigned((wire1[(4'hb):(2'h2)] ?
                  (^(reg23 ? reg11 : wire18)) : ({wire15, reg21} ?
                      reg6[(3'h5):(2'h2)] : (+(8'h9f))))));
              reg25 <= {wire2};
              reg26 <= (reg6 << {$unsigned($signed($signed(wire0))),
                  ($signed(wire16[(5'h11):(3'h6)]) < $signed($signed(wire18)))});
              reg27 <= (-reg20);
            end
          else
            begin
              reg24 <= reg19[(4'ha):(4'ha)];
              reg25 <= {{(({reg21} ? (reg20 <= reg11) : (^~(8'ha7))) >> {reg26,
                          wire1})}};
              reg26 <= reg27[(3'h4):(3'h4)];
            end
          reg28 <= ((~&$signed((^((8'hb3) * (8'ha6))))) ?
              $signed(reg19) : (reg5[(5'h11):(4'hb)] >> (((7'h42) ?
                      reg19 : ((8'hbd) & reg23)) ?
                  $unsigned(reg9) : $unsigned(reg11[(2'h2):(1'h1)]))));
        end
      reg29 <= {(+$signed(({wire4} << (~|wire3)))),
          {reg10[(1'h1):(1'h1)], (^reg26[(3'h5):(1'h1)])}};
      reg30 <= (^((reg8[(1'h0):(1'h0)] < $unsigned(reg12[(1'h0):(1'h0)])) > wire17));
    end
  assign wire31 = wire16;
  assign wire32 = ($unsigned({$unsigned((reg24 >= reg5)), (~&(|reg7))}) ?
                      (~&($signed(((8'ha2) >> reg6)) ?
                          (reg30[(5'h13):(1'h1)] ?
                              $signed(reg27) : reg26[(3'h5):(3'h5)]) : (~(7'h43)))) : reg11);
  assign wire33 = ($signed($unsigned(wire17[(1'h0):(1'h0)])) ?
                      reg21[(1'h0):(1'h0)] : $signed($unsigned(((wire2 ?
                          reg30 : (8'ha6)) != (reg14 >> reg25)))));
  module34 #() modinst105 (wire104, clk, reg9, reg26, reg24, wire1, wire3);
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire39;
  input wire signed [(3'h4):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 (1'h0)};
  assign wire40 = wire39[(5'h11):(5'h10)];
  assign wire41 = $unsigned((wire40 ?
                      wire38[(2'h3):(2'h3)] : wire38[(1'h1):(1'h0)]));
  assign wire42 = ((7'h40) ?
                      wire37[(3'h5):(3'h5)] : $unsigned($unsigned(wire35[(5'h12):(3'h7)])));
  assign wire43 = (wire41[(2'h3):(1'h0)] <<< wire40[(4'hb):(3'h7)]);
  assign wire44 = (-(($unsigned({wire42}) ^~ (-{wire36, wire39})) ?
                      wire42[(3'h4):(1'h0)] : (~^wire38[(1'h1):(1'h1)])));
  module45 #() modinst96 (.wire49(wire37), .y(wire95), .clk(clk), .wire48(wire39), .wire47(wire43), .wire46(wire41));
  assign wire97 = $signed(wire41[(4'he):(4'h8)]);
  assign wire98 = wire42[(1'h1):(1'h1)];
  assign wire99 = (wire97 ? wire38[(3'h4):(1'h1)] : (-wire44));
  assign wire100 = wire43;
  assign wire101 = (~^{wire37[(4'hf):(3'h5)], wire100});
  assign wire102 = $signed({wire36});
  assign wire103 = $signed(wire100[(3'h7):(2'h2)]);
endmodule

module module45
#(parameter param94 = ((((!((8'ha0) ? (8'hb8) : (8'hb0))) ? ((~^(7'h43)) ? ((8'hb2) >>> (8'h9d)) : ((7'h44) + (8'ha5))) : ((^(8'hb6)) - (~|(8'ha0)))) | {(+((8'hb0) & (8'ha8)))}) & ((((8'hb9) ^ (|(8'ha5))) ^ (~&(8'hbf))) || ((((8'hbf) ? (8'hb3) : (7'h41)) >> (8'hae)) ? (+{(8'hb6), (8'hbb)}) : ((~(8'hb2)) & ((7'h44) ? (8'hbf) : (8'hb0)))))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire49;
  input wire signed [(4'he):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire62,
                 wire61,
                 wire53,
                 wire51,
                 wire50,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 (1'h0)};
  assign wire50 = $unsigned(wire48[(2'h3):(2'h2)]);
  assign wire51 = (wire46 ?
                      $unsigned(($signed(wire50) < wire46)) : wire48[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg52 <= ($unsigned(wire51) ?
          ((($signed(wire48) ?
                  ((8'hab) ?
                      wire51 : wire47) : (wire46 * wire48)) && ((8'hb0) + (&wire50))) ?
              ((~|$unsigned(wire46)) && $unsigned($signed(wire46))) : $signed(wire50[(2'h3):(1'h1)])) : (($signed(((8'ha3) ?
              wire51 : wire46)) >> $unsigned($unsigned((8'ha7)))) == (($unsigned(wire46) ?
                  wire51 : $signed(wire49)) ?
              (|wire51) : {wire49[(5'h11):(4'hc)]})));
    end
  assign wire53 = (((wire47 ?
                              $unsigned(wire48[(4'he):(2'h3)]) : $signed(wire51[(1'h0):(1'h0)])) ?
                          (^~{(wire49 || (8'h9f)),
                              ((7'h41) ? wire46 : wire50)}) : wire50) ?
                      (~&((-$signed(reg52)) ?
                          $signed($unsigned((8'had))) : wire51)) : (!($unsigned(reg52) ?
                          (8'hbf) : $signed({wire50}))));
  always
    @(posedge clk) begin
      if ($signed(wire46[(4'hc):(1'h1)]))
        begin
          if ((~$signed(wire50[(3'h4):(2'h2)])))
            begin
              reg54 <= (~^(^~(wire49 <<< $signed($unsigned(wire46)))));
              reg55 <= ((7'h41) == wire50);
              reg56 <= ($signed(wire49[(4'hc):(4'ha)]) | $signed(wire47));
            end
          else
            begin
              reg54 <= wire47;
              reg55 <= ($unsigned($unsigned(reg54[(4'hf):(4'h8)])) ?
                  {{$unsigned(wire48[(3'h5):(3'h4)])},
                      wire46[(3'h6):(1'h1)]} : (|(reg56[(4'hb):(4'hb)] ^ (reg56[(4'ha):(4'h8)] - $signed(wire49)))));
              reg56 <= ({(-(|(wire49 ? wire47 : wire47)))} ?
                  (((reg52 ?
                      wire53[(1'h0):(1'h0)] : reg56) <= ($unsigned(reg54) > wire53[(2'h2):(1'h1)])) <= reg56[(4'hb):(3'h5)]) : ($unsigned(($unsigned(wire51) == (|wire47))) || wire49));
            end
        end
      else
        begin
          reg54 <= ($signed((((wire49 ^ reg56) ^~ $signed((8'hbb))) & reg55)) ?
              (&{($unsigned(reg54) ? (reg52 * reg54) : (wire48 >>> wire53)),
                  (&$unsigned((8'hbb)))}) : $signed(wire51));
          reg55 <= ((wire53 ?
                  ($unsigned($unsigned((8'ha7))) ?
                      {$unsigned(wire53)} : (~(^~wire51))) : reg56[(3'h6):(2'h2)]) ?
              wire49[(4'h8):(2'h2)] : reg54);
          reg56 <= ($unsigned($unsigned((-(8'had)))) ?
              (~wire48) : (+(wire50[(1'h1):(1'h1)] ?
                  ((~&wire50) * (reg55 ^~ reg55)) : (-(+wire50)))));
          reg57 <= wire50;
          reg58 <= $unsigned(reg56[(4'hb):(4'h9)]);
        end
      reg59 <= reg55;
      reg60 <= wire50[(2'h3):(1'h0)];
    end
  assign wire61 = $unsigned((reg52 ?
                      (reg55[(2'h2):(1'h0)] != ((reg58 - reg52) != (!reg52))) : $signed(((~&reg55) ?
                          reg57[(3'h7):(3'h4)] : (&reg54)))));
  assign wire62 = $unsigned((8'ha9));
  always
    @(posedge clk) begin
      if ($unsigned({reg60}))
        begin
          reg63 <= ({{$signed((^(8'ha9))),
                  $signed((~^reg60))}} | reg60[(3'h4):(1'h0)]);
          if ({{$signed(wire46),
                  ((reg57 ? (wire62 == (8'ha9)) : wire49) ?
                      ((reg54 ? reg55 : wire53) ?
                          (wire48 ?
                              wire48 : reg60) : (wire48 && reg55)) : reg55)},
              wire48[(4'hc):(3'h4)]})
            begin
              reg64 <= (~$unsigned(reg57[(4'hb):(3'h5)]));
              reg65 <= (wire61[(4'hc):(1'h0)] != wire53);
              reg66 <= wire50[(1'h1):(1'h1)];
              reg67 <= {reg65[(2'h2):(1'h0)],
                  {($signed($unsigned(wire48)) >>> wire47)}};
              reg68 <= $unsigned((^reg56));
            end
          else
            begin
              reg64 <= $signed(reg64[(1'h0):(1'h0)]);
              reg65 <= (&{($unsigned($signed(reg60)) ?
                      ((8'hb9) || {reg54, reg59}) : reg52)});
              reg66 <= (|$unsigned(wire46));
            end
          reg69 <= reg63;
          reg70 <= reg69;
          reg71 <= (^((&((8'ha4) >> (~|wire49))) >= (-(^~reg56[(4'hc):(4'ha)]))));
        end
      else
        begin
          reg63 <= $unsigned($unsigned((wire53[(1'h0):(1'h0)] ?
              (reg69 | $signed((8'hb8))) : wire46[(2'h2):(1'h1)])));
        end
      reg72 <= reg65[(4'h9):(3'h6)];
      if (({(+((~&(8'ha3)) ^~ $unsigned(reg66)))} ?
          (wire61[(5'h11):(4'hd)] ?
              $unsigned(((wire48 <= reg68) ?
                  (reg57 ^~ wire61) : $signed(wire50))) : $unsigned(wire49[(4'he):(3'h6)])) : wire47[(3'h4):(3'h4)]))
        begin
          reg73 <= ((8'ha8) ?
              (~|$signed($unsigned($unsigned(wire49)))) : {($signed((+reg64)) >> ($unsigned((8'hba)) & $signed(wire51))),
                  reg69});
        end
      else
        begin
          reg73 <= $signed($unsigned($signed(reg73)));
          if (reg58)
            begin
              reg74 <= (^~(wire61[(4'h9):(4'h8)] ?
                  reg60[(1'h0):(1'h0)] : $unsigned(reg72[(3'h4):(2'h2)])));
            end
          else
            begin
              reg74 <= reg74[(4'h9):(4'h9)];
            end
        end
    end
  assign wire75 = ($signed(({$signed(reg58), {reg68, (8'ha3)}} <<< (8'hac))) ?
                      wire53[(1'h0):(1'h0)] : (8'ha5));
  assign wire76 = ((8'hab) >> (^~$signed(reg55[(4'he):(4'hd)])));
  assign wire77 = $unsigned(reg70);
  assign wire78 = $signed((-$unsigned((^~{(8'hbf), wire61}))));
  assign wire79 = reg56[(3'h7):(3'h6)];
  assign wire80 = reg69;
  assign wire81 = $signed((+$signed($signed((~reg65)))));
  always
    @(posedge clk) begin
      reg82 <= (-(+wire51[(2'h2):(1'h1)]));
      reg83 <= $unsigned($unsigned(($unsigned($unsigned(wire51)) ?
          $signed((wire48 >= (8'hbb))) : $unsigned({reg73}))));
      reg84 <= wire47[(2'h3):(1'h1)];
      if ($unsigned((~&{$signed(wire47)})))
        begin
          if (($signed({{reg56[(3'h4):(2'h2)]}}) ^ {(8'ha1)}))
            begin
              reg85 <= (&reg84[(3'h6):(1'h0)]);
              reg86 <= $unsigned($unsigned(wire53[(2'h3):(1'h1)]));
            end
          else
            begin
              reg85 <= reg55;
              reg86 <= wire79;
              reg87 <= (-(reg57[(4'h8):(3'h4)] ?
                  $unsigned(reg86) : (~&$unsigned((reg58 ? reg59 : reg58)))));
            end
          reg88 <= ((-((&(wire46 >>> reg67)) ?
                  ({wire49, reg70} ^~ wire61) : {$signed(reg83), reg70})) ?
              ($signed($unsigned($unsigned(reg57))) - (((reg63 <= reg73) ?
                      $signed(wire62) : $signed(reg85)) ?
                  (8'ha1) : wire50)) : ($unsigned(reg84) << $unsigned((|(!reg83)))));
          reg89 <= (($unsigned((+(reg57 ? (8'hbc) : wire46))) ?
                  (!((reg63 ? reg74 : (8'ha5)) ?
                      $signed(reg57) : (-wire49))) : $unsigned(reg60[(2'h3):(2'h2)])) ?
              {$unsigned(reg67), reg60[(3'h4):(1'h0)]} : reg64);
        end
      else
        begin
          if (($unsigned((~^((~&wire47) != reg74[(4'h8):(3'h7)]))) ?
              reg57[(4'h8):(3'h7)] : (^(reg67[(4'he):(3'h4)] <= {wire76}))))
            begin
              reg85 <= (8'ha6);
            end
          else
            begin
              reg85 <= reg72[(3'h7):(3'h6)];
              reg86 <= {(|((~&wire48) ? (|$unsigned(wire46)) : wire49)),
                  {(8'haa), wire53}};
              reg87 <= reg67[(4'h9):(3'h7)];
              reg88 <= {reg57};
              reg89 <= reg63;
            end
          reg90 <= {(^~{((reg60 << reg74) ?
                      (wire46 ? (8'ha4) : reg74) : (reg59 ? reg68 : reg57)),
                  $unsigned((-wire77))}),
              reg85[(4'h9):(1'h1)]};
        end
      reg91 <= (&wire76);
    end
  assign wire92 = $unsigned(wire46);
  assign wire93 = $signed(((~(|reg91)) ^~ $unsigned((-((8'hb4) ?
                      wire50 : reg83)))));
endmodule
