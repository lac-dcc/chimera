module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire121,
                 wire102,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire100,
                 reg120,
                 reg119,
                 reg118,
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
                 reg105,
                 reg104,
                 reg103,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$unsigned(($signed($unsigned(wire1)) ^~ wire1)),
          $unsigned({((|wire0) ? {wire1, wire0} : (wire3 ? wire0 : wire0))})};
      reg6 <= ($signed((+$signed((wire1 ? (8'hb7) : wire0)))) == (&{wire2}));
    end
  assign wire7 = (reg6[(4'h8):(3'h7)] ?
                     (8'hb6) : (reg5 | {$unsigned((^reg5))}));
  assign wire8 = $signed($unsigned(((~wire7) ?
                     {$unsigned(reg5), (wire3 ? wire7 : (8'h9e))} : {(~|wire7),
                         (8'h9c)})));
  assign wire9 = $signed({($signed((&(8'ha4))) ?
                         (~(~&wire4)) : $signed((reg6 ^~ wire4))),
                     reg5[(1'h0):(1'h0)]});
  assign wire10 = ({($unsigned({wire2, (7'h44)}) ?
                          $unsigned(((8'had) << wire0)) : wire2[(1'h1):(1'h1)]),
                      wire3} >= (&$unsigned((+{wire9, wire2}))));
  assign wire11 = (reg5[(2'h2):(1'h1)] <= $signed((($signed(wire1) < (&(8'hb1))) ?
                      (&$signed(wire7)) : (wire3[(2'h3):(1'h0)] ?
                          wire10[(4'hb):(1'h1)] : ((8'ha6) | wire1)))));
  assign wire12 = (reg6 ?
                      ({wire3} - $unsigned((^~wire10))) : wire8[(4'ha):(1'h1)]);
  module13 #() modinst101 (wire100, clk, reg6, wire10, wire8, wire0);
  assign wire102 = $unsigned(((wire1[(4'h8):(2'h2)] ?
                       wire10[(4'h8):(3'h4)] : ((wire11 ?
                           wire9 : reg5) <= $signed(wire10))) <<< (~|({wire12,
                       wire8} >>> (~|wire4)))));
  always
    @(posedge clk) begin
      if ($signed(({($signed(wire7) ? $unsigned(reg6) : (8'hbb)), (~^{wire4})} ?
          (~($signed((8'hb9)) ?
              wire1 : $unsigned(wire11))) : {wire102[(1'h1):(1'h0)]})))
        begin
          reg103 <= ({$unsigned($unsigned($unsigned(wire7)))} ?
              wire102 : $unsigned((+(wire3[(4'h9):(2'h2)] ?
                  $signed(wire11) : $unsigned(wire2)))));
          reg104 <= (!$unsigned((wire3[(1'h1):(1'h0)] ?
              ($unsigned(wire100) >> wire7[(2'h3):(2'h2)]) : ((8'hae) < $unsigned((8'hac))))));
          reg105 <= reg6;
          reg106 <= $unsigned(wire4);
          reg107 <= (wire8[(5'h13):(3'h4)] - (~&wire4));
        end
      else
        begin
          reg103 <= wire4;
          reg104 <= ({$unsigned((-$signed(wire1)))} | ((~^reg104[(4'hf):(2'h2)]) ?
              ($unsigned((wire10 ? reg103 : wire11)) ?
                  wire9[(2'h2):(1'h0)] : (8'h9c)) : reg6[(4'h8):(1'h0)]));
        end
      if ($signed($unsigned($signed(reg6))))
        begin
          reg108 <= $unsigned($signed((wire102 ?
              $unsigned((wire11 <= wire4)) : $signed((wire100 == reg103)))));
          reg109 <= reg6[(4'ha):(4'h9)];
          reg110 <= wire2[(2'h2):(1'h1)];
          reg111 <= $signed(reg106[(5'h10):(4'h8)]);
          if ($signed($signed($unsigned($signed((|wire12))))))
            begin
              reg112 <= $signed((((~&wire4[(1'h0):(1'h0)]) >= ((reg103 ?
                  (8'hac) : reg111) * {wire11})) != (8'ha3)));
              reg113 <= $signed({(|$unsigned((wire11 ? (8'haf) : reg106)))});
            end
          else
            begin
              reg112 <= reg111;
              reg113 <= {reg106};
              reg114 <= $signed($unsigned($signed((-(reg5 ?
                  reg111 : wire12)))));
              reg115 <= (wire11 ?
                  (reg104[(5'h13):(4'h9)] >> {(~|reg103),
                      (-{wire8, reg107})}) : $signed((~^$unsigned(((7'h41) ?
                      (8'hab) : reg113)))));
              reg116 <= wire3;
            end
        end
      else
        begin
          reg108 <= {$signed(wire4)};
          reg109 <= reg5[(1'h0):(1'h0)];
          reg110 <= wire100[(2'h3):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg117 <= $signed((|wire1));
      reg118 <= (8'hac);
      reg119 <= reg111[(2'h2):(1'h0)];
      reg120 <= (!$signed($unsigned(((|wire1) << reg105[(1'h0):(1'h0)]))));
    end
  assign wire121 = ($signed($signed($signed((wire2 ? (8'ha5) : wire7)))) ?
                       reg111[(4'hf):(4'hf)] : (wire102 ?
                           ($signed({wire102, reg105}) << reg104) : ((+(wire0 ?
                               wire0 : reg112)) | ($unsigned(wire8) == reg108))));
endmodule

module module13
#(parameter param99 = (({(((8'hae) && (8'hb5)) ? {(7'h44), (8'hb5)} : {(8'ha5)})} <= ((+((7'h42) ? (8'hb1) : (8'hbc))) ? (~|{(8'ha5)}) : {(8'had)})) ? (^(!({(8'hab)} ? ((7'h41) || (8'hb5)) : (~|(8'ha2))))) : (+((((8'ha6) ? (8'hb5) : (8'ha5)) ? ((7'h42) + (8'hb2)) : ((8'ha2) - (8'hab))) > (((8'hb7) ? (8'haf) : (8'hb8)) ? ((7'h42) >>> (8'h9f)) : (7'h44))))))
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h25e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire96;
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire98,
                 wire30,
                 wire31,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire41,
                 wire42,
                 wire43,
                 wire60,
                 wire81,
                 wire96,
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
                 reg40,
                 reg39,
                 reg38,
                 reg33,
                 reg32,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= ((^(wire17 ?
          $unsigned((wire17 ?
              wire17 : wire17)) : $unsigned((|wire14)))) ^ wire14);
      reg19 <= (8'ha8);
    end
  always
    @(posedge clk) begin
      reg20 <= ((($signed({(8'haa), reg19}) * wire17) ?
          $signed($signed(wire14[(4'h9):(4'h9)])) : (8'ha8)) + $unsigned(wire17));
      reg21 <= (reg19[(3'h5):(3'h5)] ?
          reg19[(3'h5):(3'h5)] : wire17[(1'h1):(1'h0)]);
      reg22 <= wire15[(1'h1):(1'h0)];
      if ($signed({{(~&{wire17, wire15})},
          {($unsigned(reg19) ? {reg18} : reg19), (~&$unsigned(wire17))}}))
        begin
          reg23 <= (reg18[(4'h9):(3'h4)] ?
              $unsigned((wire15[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(wire17)) : reg18[(3'h7):(3'h6)])) : $signed($signed(wire16[(2'h3):(2'h2)])));
          reg24 <= (8'hbc);
          reg25 <= (($unsigned(($unsigned(reg18) ?
                  (~wire16) : $signed(reg21))) ?
              $unsigned($signed((~wire17))) : $unsigned($signed((^~reg18)))) & (+wire16));
          if ($signed($signed((reg21 >>> $unsigned($unsigned(reg19))))))
            begin
              reg26 <= $signed((8'hba));
              reg27 <= reg23;
            end
          else
            begin
              reg26 <= (reg20 ^~ reg21);
              reg27 <= {$signed(reg23)};
              reg28 <= (^(wire17[(3'h4):(2'h3)] && (wire16[(4'he):(4'h8)] <<< {$unsigned(reg23)})));
            end
        end
      else
        begin
          reg23 <= reg18;
          reg24 <= $unsigned((^~$signed((reg21 ?
              (^~reg23) : $unsigned(reg25)))));
          reg25 <= (|(^~reg18[(4'hc):(2'h2)]));
          reg26 <= (8'haa);
        end
      reg29 <= $unsigned((reg21 ?
          (+(^reg24[(1'h0):(1'h0)])) : $unsigned(reg26)));
    end
  assign wire30 = (^($signed($signed($signed((7'h44)))) + (((~&reg18) && ((8'hbc) == wire17)) ?
                      reg20 : reg26)));
  assign wire31 = (~|wire17[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg32 <= {(8'hb7),
          ($unsigned(reg25) ^~ ($unsigned($unsigned(wire16)) ?
              ((|reg26) ? $signed(reg28) : (reg23 ? reg29 : reg26)) : wire17))};
      reg33 <= $unsigned($signed(wire16[(3'h6):(3'h4)]));
    end
  assign wire34 = wire16[(4'he):(1'h0)];
  assign wire35 = reg26[(4'hc):(3'h6)];
  assign wire36 = wire34;
  assign wire37 = $unsigned($unsigned(($unsigned($unsigned(wire16)) ^ (7'h43))));
  always
    @(posedge clk) begin
      reg38 <= reg18[(5'h12):(5'h12)];
      reg39 <= reg29[(4'hd):(3'h7)];
      reg40 <= $unsigned((~|$unsigned(($unsigned(wire37) > wire37[(3'h4):(3'h4)]))));
    end
  assign wire41 = (reg39[(1'h1):(1'h0)] ^ (7'h43));
  assign wire42 = reg19;
  assign wire43 = (reg20 ?
                      (wire31[(2'h3):(2'h3)] << $signed((&reg38[(4'h9):(1'h0)]))) : $unsigned($signed((reg32 << (8'had)))));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed($unsigned(reg28[(5'h15):(4'ha)])))))
        begin
          reg44 <= ((~|{wire17,
              wire36}) >>> (($unsigned(reg22) & (wire14 == $signed(reg29))) && $unsigned(reg29[(3'h5):(2'h2)])));
          reg45 <= ((((~&$signed(wire16)) >> $signed({wire14})) & (reg20[(4'hc):(3'h5)] >>> reg29)) * ({{(wire30 ?
                      reg22 : reg18),
                  $signed(wire34)}} || (($signed(reg27) ?
              (reg18 ? reg18 : wire37) : ((8'hbf) || wire43)) - wire43)));
          reg46 <= $signed(((8'ha7) >> ($unsigned(reg32[(2'h2):(1'h0)]) ?
              wire41 : reg29[(4'h8):(4'h8)])));
          reg47 <= ({(8'h9c)} ?
              $unsigned(reg38[(2'h3):(2'h2)]) : {($unsigned((wire41 ?
                      wire37 : (8'haa))) - (reg45 == (reg24 ?
                      (8'ha7) : reg29))),
                  $signed((~^$unsigned(reg33)))});
          if (reg23[(1'h1):(1'h0)])
            begin
              reg48 <= wire15[(1'h0):(1'h0)];
              reg49 <= wire37[(1'h1):(1'h1)];
              reg50 <= (reg46 >> (!$signed($unsigned((reg18 ?
                  (8'hb2) : wire14)))));
              reg51 <= $unsigned($unsigned(reg26));
              reg52 <= (8'hb7);
            end
          else
            begin
              reg48 <= wire14;
            end
        end
      else
        begin
          reg44 <= $signed($unsigned({reg49}));
          if ($unsigned($signed(((-(~^reg25)) != reg51[(3'h4):(2'h2)]))))
            begin
              reg45 <= wire35[(1'h0):(1'h0)];
            end
          else
            begin
              reg45 <= ($signed($unsigned(((|wire31) ?
                  (reg27 >= reg49) : reg52))) != wire36);
              reg46 <= reg40;
            end
          reg47 <= $unsigned({(8'ha5)});
        end
      reg53 <= $signed(reg47[(1'h0):(1'h0)]);
      reg54 <= reg27[(5'h11):(1'h0)];
      if ((~$signed(((wire36 ? reg40[(3'h4):(1'h1)] : $unsigned(reg50)) ?
          $signed($unsigned(reg25)) : reg46))))
        begin
          if ((!reg29))
            begin
              reg55 <= reg45[(5'h13):(1'h0)];
            end
          else
            begin
              reg55 <= {$unsigned($signed((|$unsigned((8'ha7))))),
                  (reg51 ? wire35 : (-{$unsigned(wire15)}))};
            end
          reg56 <= wire34[(4'h8):(3'h5)];
          reg57 <= ($unsigned(wire14[(3'h4):(2'h3)]) ?
              {$signed(({reg25, reg24} | reg49)),
                  (|$signed((reg46 > wire15)))} : {((reg22[(1'h0):(1'h0)] ~^ ((8'ha0) * reg46)) ?
                      ((reg23 ? reg18 : (8'hbe)) ?
                          (reg50 ?
                              wire17 : wire34) : (^(8'hb1))) : ($unsigned(wire30) ?
                          {wire30, (8'hb0)} : reg52)),
                  wire37});
          reg58 <= reg29;
          reg59 <= ((($unsigned({reg19,
                  reg46}) | reg23[(3'h6):(3'h4)]) >> $signed(($unsigned(reg25) >> (reg46 ?
                  reg48 : (8'ha5))))) ?
              wire17[(2'h3):(1'h1)] : (($signed((reg58 ? reg57 : reg22)) ?
                  (wire15 ? reg46 : reg45) : $signed(((8'ha8) ?
                      reg38 : wire35))) ^~ (~^($signed(reg21) ^~ (wire36 ^ wire17)))));
        end
      else
        begin
          reg55 <= $signed({{{reg59[(3'h4):(2'h3)], (reg54 ^~ (8'hb5))}}});
        end
    end
  assign wire60 = $unsigned((($signed(reg25) ?
                      wire16[(4'hc):(1'h1)] : (^~$unsigned(reg25))) ^~ (reg53 ?
                      wire42 : (^wire41[(2'h3):(2'h2)]))));
  module61 #() modinst82 (wire81, clk, reg52, reg59, reg20, reg48, reg53);
  module83 #() modinst97 (.wire85(reg52), .y(wire96), .wire87(reg49), .clk(clk), .wire86(wire41), .wire84(reg38));
  assign wire98 = ((~$signed(wire81)) ?
                      reg29 : (((^(wire30 <<< (8'hba))) & (reg27[(2'h2):(2'h2)] ?
                              $signed(reg32) : (~^reg21))) ?
                          {((reg45 ? (8'haa) : reg59) ?
                                  reg38 : (reg24 ?
                                      wire31 : reg58))} : ($unsigned((wire30 ?
                              reg46 : (7'h42))) != {$signed(reg33),
                              $signed(reg59)})));
endmodule

module module83
#(parameter param94 = (|(((((8'hb7) ? (8'ha5) : (8'ha2)) ? (~&(8'ha3)) : {(8'hb9)}) != {((8'ha0) <<< (8'hbd))}) ? ((((8'hbc) ? (8'ha7) : (8'hba)) * (-(8'h9d))) ? (((8'hab) ? (7'h41) : (7'h43)) ? ((8'h9f) - (8'hb8)) : ((8'hb4) >= (8'hbe))) : ((~|(8'ha6)) * (^~(8'hb3)))) : ((8'h9c) ? (-((8'hbe) || (8'hbc))) : ((^~(8'hbc)) ? (!(8'hba)) : (8'hbd))))), 
parameter param95 = ((({((8'hae) ? param94 : param94), (8'ha9)} && (~(~^param94))) ? param94 : param94) >>> ((^~{(param94 & (8'ha0))}) ? (param94 & (-(param94 ? param94 : param94))) : (((param94 | (8'hbd)) << (-param94)) ? ((param94 ? param94 : param94) ? {param94} : ((8'haa) ? param94 : (8'hbc))) : (&(8'ha8))))))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire87;
  input wire [(5'h10):(1'h0)] wire86;
  input wire signed [(5'h10):(1'h0)] wire85;
  input wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire88;
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  assign y = {wire93, wire92, wire91, wire90, wire88, reg89, (1'h0)};
  assign wire88 = wire85;
  always
    @(posedge clk) begin
      reg89 <= (^$signed(((wire85 >> wire84) ?
          $unsigned($unsigned(wire86)) : wire85[(4'hb):(3'h5)])));
    end
  assign wire90 = reg89;
  assign wire91 = {$unsigned(wire85)};
  assign wire92 = wire90[(3'h4):(1'h0)];
  assign wire93 = ({wire88[(3'h7):(3'h4)],
                      ($signed((wire87 && wire86)) >>> (wire88[(1'h0):(1'h0)] && wire91))} == $unsigned($unsigned(wire86)));
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire66;
  input wire signed [(4'hf):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 (1'h0)};
  assign wire67 = ((wire62[(3'h7):(3'h5)] && $signed((8'h9f))) ?
                      $signed({wire62[(4'h8):(1'h1)],
                          $unsigned((wire62 > wire64))}) : (~|$unsigned(((^~wire63) ?
                          (~|wire62) : (wire65 ? wire62 : wire63)))));
  assign wire68 = {$signed($unsigned(wire64[(3'h6):(3'h5)]))};
  assign wire69 = (({(+wire68), $unsigned(wire65)} ?
                      (!(^~$signed(wire67))) : $signed($signed((wire64 ^~ wire63)))) << wire63);
  assign wire70 = ((+$unsigned(($unsigned(wire65) ?
                      (wire67 ?
                          wire69 : wire63) : $unsigned((8'hba))))) + wire69[(5'h12):(4'he)]);
  assign wire71 = $signed(wire66);
  assign wire72 = $unsigned({$signed((^(!wire69)))});
  assign wire73 = $unsigned((~^$unsigned((wire70[(1'h0):(1'h0)] ?
                      $unsigned(wire67) : $unsigned(wire62)))));
  assign wire74 = wire63[(5'h10):(3'h4)];
  assign wire75 = (wire63 >> ((-wire62) ?
                      ((^~(wire74 << wire71)) ?
                          wire70[(1'h0):(1'h0)] : ((^wire62) ?
                              wire66 : (wire63 ?
                                  (8'ha3) : wire70))) : (($unsigned(wire73) ?
                          $unsigned(wire71) : wire66[(1'h1):(1'h0)]) == ($unsigned(wire69) ?
                          (wire73 ? wire70 : wire67) : {wire67}))));
  assign wire76 = wire69[(5'h11):(4'h8)];
  assign wire77 = (^(+wire76));
  assign wire78 = {((wire77[(4'hd):(4'hc)] >= $unsigned(wire76[(4'hc):(3'h6)])) && wire68[(4'h9):(1'h1)])};
  assign wire79 = (|wire64);
  assign wire80 = {(8'hb8),
                      ((!wire79[(3'h4):(2'h3)]) ?
                          $unsigned($unsigned((wire67 ?
                              wire63 : (8'hb8)))) : (&{$signed(wire71),
                              (wire68 * wire62)}))};
endmodule
