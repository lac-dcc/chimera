module top
#(parameter param101 = (+(|(({(8'h9c), (8'hab)} && ((8'ha0) > (8'ha0))) ? {(^~(7'h41)), ((8'ha0) ? (8'hb8) : (7'h41))} : (((8'ha1) ? (8'hb4) : (8'hac)) >> ((8'hbf) ? (8'h9f) : (8'hae)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire100, wire99, wire98, wire97, wire95, wire6, wire5, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (wire2[(4'he):(4'ha)] ~^ wire3);
  module7 #() modinst96 (.clk(clk), .wire10(wire4), .wire11(wire6), .wire8(wire5), .y(wire95), .wire9(wire1));
  assign wire97 = $signed(($unsigned((+wire3[(4'h8):(3'h5)])) * wire1[(3'h7):(1'h0)]));
  assign wire98 = (($signed((8'hbc)) ?
                          (!$signed($unsigned(wire5))) : $unsigned(wire1[(3'h5):(2'h3)])) ?
                      (~(wire97 || ($signed(wire97) == wire3))) : $signed($unsigned(wire2)));
  assign wire99 = $signed($signed({($signed(wire6) < $unsigned((8'h9f)))}));
  assign wire100 = wire99[(1'h1):(1'h0)];
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire86;
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire86,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
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
                 (1'h0)};
  assign wire12 = wire9;
  assign wire13 = ($unsigned(wire9) ?
                      $signed((&{(wire10 & wire9), {wire10, wire12}})) : wire9);
  assign wire14 = wire8[(1'h0):(1'h0)];
  assign wire15 = wire14[(3'h6):(3'h6)];
  assign wire16 = ((((~|$signed(wire10)) * {wire14[(1'h0):(1'h0)]}) | (^~$unsigned({(8'h9f),
                      wire10}))) >= (wire8 < wire10));
  assign wire17 = $signed(wire14[(4'h8):(3'h5)]);
  assign wire18 = $signed(wire12[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg19 <= (~|$unsigned(wire9[(3'h6):(3'h4)]));
      reg20 <= wire12;
      reg21 <= (~&(+(((wire11 ? wire14 : wire11) || {wire18}) >>> ({wire18,
          wire16} <<< $signed(wire14)))));
      if (wire14)
        begin
          reg22 <= $unsigned({($unsigned(wire17) ?
                  wire15[(3'h4):(1'h1)] : wire9[(1'h0):(1'h0)]),
              {reg21}});
        end
      else
        begin
          reg22 <= wire10;
          if (wire17)
            begin
              reg23 <= {((~|$signed(wire14)) ?
                      (^(-$unsigned(reg21))) : $signed($unsigned((&reg21))))};
              reg24 <= wire14[(5'h10):(4'hb)];
            end
          else
            begin
              reg23 <= {(($signed($unsigned(reg24)) >= wire13) ?
                      ($unsigned(reg22) == (((8'had) ?
                          (8'haa) : wire11) ~^ ((8'hb3) ?
                          wire9 : wire14))) : wire13),
                  $unsigned($signed((~^(reg23 ? (8'hb3) : (8'h9d)))))};
              reg24 <= (wire18 >>> wire12);
            end
          if (({$signed({(wire15 != wire10), (^wire13)}),
              $signed(((wire15 < wire9) ?
                  wire8 : {wire17}))} ~^ (($unsigned((!wire14)) ?
                  wire17[(2'h3):(1'h0)] : $signed($signed(reg20))) ?
              wire11[(4'hf):(4'hd)] : reg20)))
            begin
              reg25 <= reg19;
              reg26 <= (wire15[(4'h9):(1'h1)] * wire14[(1'h0):(1'h0)]);
              reg27 <= $signed($signed((~^{$signed(wire16)})));
            end
          else
            begin
              reg25 <= (($signed(wire8) >= (8'ha8)) ^ ($signed($signed($signed((8'ha9)))) ?
                  reg27 : $unsigned($unsigned(reg24[(4'hc):(3'h7)]))));
              reg26 <= $unsigned({$unsigned(((^wire14) ? (~|wire18) : wire17)),
                  ($signed((wire10 | reg27)) ? (^~(^~reg26)) : reg22)});
              reg27 <= $unsigned(reg21[(1'h0):(1'h0)]);
            end
          reg28 <= ((&wire13) >> $unsigned(($signed({wire8}) ?
              ((reg24 ? wire12 : reg27) ?
                  {wire15} : $signed(wire8)) : $unsigned($unsigned(reg19)))));
        end
    end
  assign wire29 = (wire10 ?
                      ($unsigned((8'ha9)) ?
                          (($signed(reg26) ^~ {reg21}) ?
                              {(~^reg24), (reg26 >= reg25)} : $unsigned((reg22 ?
                                  reg24 : reg25))) : $signed($signed((wire13 ?
                              (8'hb1) : wire8)))) : (8'hb8));
  assign wire30 = (^$unsigned((reg26 > ($unsigned(wire16) == {wire9}))));
  assign wire31 = reg21;
  assign wire32 = wire16;
  assign wire33 = ((($unsigned(wire16) >> $unsigned((reg24 > reg25))) ?
                          ((8'hb8) & (~&((8'ha2) || reg23))) : (wire29 | ((8'hb9) != {wire30,
                              wire29}))) ?
                      $unsigned((~($unsigned(reg19) <= $unsigned((8'hb3))))) : (({$signed(reg23)} >= wire15) ~^ ((8'ha6) ?
                          ($signed(wire18) | (!wire16)) : $signed((reg23 != (8'hbe))))));
  module34 #() modinst87 (wire86, clk, wire11, wire8, reg23, reg27, wire32);
  assign wire88 = $unsigned((wire31 && ($unsigned((|reg20)) ?
                      ($signed(reg22) ^ $signed(wire17)) : reg28[(1'h1):(1'h1)])));
  assign wire89 = {wire15[(3'h6):(1'h1)],
                      $unsigned({reg27[(3'h5):(3'h4)], $signed(wire32)})};
  always
    @(posedge clk) begin
      if ($unsigned((|(~|(8'hb1)))))
        begin
          if ($signed(wire17))
            begin
              reg90 <= ((({(reg28 ? wire86 : (8'h9e))} ?
                      (~^$unsigned(reg22)) : $signed($unsigned((8'h9e)))) ?
                  (($signed(wire86) ?
                      reg26 : (+wire89)) && wire18) : $unsigned(wire88[(2'h2):(1'h1)])) || wire30);
              reg91 <= $unsigned(wire17[(3'h5):(1'h0)]);
              reg92 <= ((($signed({(8'ha7), wire17}) ?
                      wire30 : wire31[(4'ha):(2'h3)]) ?
                  $signed(reg26) : wire11[(4'he):(4'h9)]) >> $signed((((wire15 <<< wire89) ?
                  wire89[(1'h1):(1'h1)] : wire14) <<< (wire88[(3'h5):(1'h1)] - (~^wire17)))));
              reg93 <= (7'h41);
              reg94 <= wire8[(4'hc):(2'h2)];
            end
          else
            begin
              reg90 <= $signed(($signed(wire86[(4'hf):(1'h0)]) ?
                  $signed(wire86[(5'h11):(4'h8)]) : (!$signed((wire9 ?
                      wire11 : wire12)))));
              reg91 <= wire8;
            end
        end
      else
        begin
          reg90 <= $unsigned($signed($signed(wire86[(3'h4):(3'h4)])));
          reg91 <= wire9;
          reg92 <= (^~$signed(wire13));
          reg93 <= $signed({(($unsigned(reg91) ^~ (reg26 ?
                  reg28 : reg92)) + ({wire18} > (wire12 + (8'hbb)))),
              wire16});
        end
    end
endmodule

module module34
#(parameter param85 = ((((+(~&(8'hba))) ^ (((8'hb0) ? (8'had) : (8'hb3)) >= ((7'h40) << (8'ha2)))) ? {(~((8'hb5) >= (8'hac))), (((8'ha9) ~^ (8'h9c)) * ((8'h9f) > (8'hb6)))} : ((+((8'hbd) ? (7'h42) : (8'ha4))) ^ (-((8'ha5) == (7'h42))))) | (((((8'haf) <= (8'h9f)) ? {(8'hb0), (8'hab)} : (|(8'h9c))) ? (^(~(8'hab))) : {((8'hb9) ~^ (8'h9c)), (~&(8'hba))}) ? ((((7'h43) >= (8'had)) ? ((8'hba) < (8'hbc)) : ((8'ha1) ? (7'h44) : (8'hbe))) == (~|((8'hb1) | (8'h9d)))) : (!(&{(7'h43)})))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  input wire [(3'h4):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  assign y = {wire84,
                 wire76,
                 wire62,
                 wire61,
                 wire53,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire40 = $signed($unsigned($unsigned($signed((wire39 ?
                      wire37 : wire36)))));
  assign wire41 = wire40[(3'h4):(2'h2)];
  assign wire42 = $signed($unsigned(((8'haf) == (-wire41[(1'h1):(1'h1)]))));
  assign wire43 = $signed($signed((((wire40 << wire36) + (~^wire37)) + $unsigned(((8'ha6) & (8'haf))))));
  assign wire44 = (wire35 ^ ((wire36 || (~|$signed((8'ha2)))) - $unsigned((~&(wire36 ?
                      (8'haa) : wire39)))));
  always
    @(posedge clk) begin
      reg45 <= (^~({$unsigned($unsigned((8'ha7)))} << ($signed((8'haf)) ?
          ((wire35 ^~ wire38) ?
              wire43[(4'h9):(4'h8)] : wire38[(4'ha):(3'h4)]) : $unsigned({wire41,
              wire43}))));
      if (({(^wire37)} ?
          (({$unsigned(reg45), {wire41}} ?
                  ((^reg45) ? wire38 : (^wire36)) : wire37[(2'h2):(1'h0)]) ?
              wire39[(3'h6):(2'h3)] : ($signed($signed(wire37)) == ($unsigned(wire40) ?
                  $signed(wire44) : wire38[(3'h7):(3'h5)]))) : ($signed(((wire39 ?
                  wire41 : wire38) ?
              (wire38 >= (7'h42)) : $unsigned(wire35))) >>> $unsigned(wire38))))
        begin
          reg46 <= wire36[(2'h2):(1'h0)];
          reg47 <= $unsigned(wire38);
          if (($signed(wire37) ?
              $signed(reg47[(3'h4):(2'h3)]) : $unsigned(wire36[(2'h2):(1'h1)])))
            begin
              reg48 <= ({wire41} * {wire40});
              reg49 <= ((wire37 ?
                      reg46 : ($unsigned($unsigned(wire37)) ^~ ((wire41 > wire43) & $unsigned(wire39)))) ?
                  wire37[(3'h6):(2'h2)] : (~^(8'hae)));
              reg50 <= $unsigned((wire37[(2'h3):(2'h3)] ?
                  reg46[(2'h2):(1'h1)] : wire43));
            end
          else
            begin
              reg48 <= reg45;
            end
        end
      else
        begin
          reg46 <= reg49;
          reg47 <= reg50;
          reg48 <= wire36;
          reg49 <= (^wire36[(1'h1):(1'h1)]);
        end
      reg51 <= (~&$unsigned((((wire38 ? (7'h41) : wire43) ?
              (wire40 ? reg47 : wire38) : (wire38 ? (8'hb5) : wire43)) ?
          ((~^wire44) ^~ (wire42 != wire36)) : $signed($unsigned((8'ha7))))));
      reg52 <= wire39[(3'h4):(2'h3)];
    end
  assign wire53 = (reg45 <<< (8'hb9));
  always
    @(posedge clk) begin
      if (((8'ha6) < {wire35}))
        begin
          if ((8'haa))
            begin
              reg54 <= (~($signed($signed($unsigned(reg45))) ?
                  ((|$unsigned(reg48)) ?
                      $signed((wire42 ?
                          reg50 : reg50)) : wire38[(4'ha):(4'ha)]) : wire39));
            end
          else
            begin
              reg54 <= {{(8'ha9), $unsigned(reg54[(3'h4):(2'h2)])},
                  ((~&($signed((8'hac)) ?
                          (reg47 > wire37) : (wire53 >> wire44))) ?
                      (wire37 >= ($unsigned(wire42) ?
                          reg51[(4'hf):(2'h3)] : (reg52 <= reg52))) : ((~&wire44) ?
                          (wire42 >> $signed(wire37)) : wire36[(2'h3):(1'h1)]))};
              reg55 <= (((!wire43[(3'h7):(2'h3)]) ^~ ({{(8'ha1)}} ?
                      $unsigned($unsigned((8'ha7))) : (8'hb6))) ?
                  {$unsigned((reg49 | wire43))} : wire41[(1'h1):(1'h0)]);
              reg56 <= (wire35 <= wire39);
            end
          reg57 <= ($signed((&(((7'h41) ? reg52 : (8'ha7)) ?
              wire36 : ((8'haa) * reg54)))) && reg49);
        end
      else
        begin
          reg54 <= reg48;
          reg55 <= (~$unsigned((!(!(reg50 > wire35)))));
          reg56 <= reg46[(4'h8):(3'h4)];
        end
      reg58 <= (+$signed($unsigned(reg56)));
      reg59 <= reg58[(1'h0):(1'h0)];
      reg60 <= (+reg49[(4'hc):(4'h9)]);
    end
  assign wire61 = $signed({wire37[(3'h7):(1'h1)],
                      $unsigned((|$signed(wire43)))});
  assign wire62 = ({(^~$signed($signed(reg54)))} == ($signed((reg55[(2'h2):(2'h2)] & (wire39 ?
                      reg51 : reg54))) < $unsigned(reg55[(5'h13):(3'h4)])));
  always
    @(posedge clk) begin
      reg63 <= $signed(({((reg46 ? wire42 : reg54) - wire62)} ?
          (wire39 ~^ $unsigned({reg45,
              reg52})) : $unsigned((reg57[(2'h3):(2'h3)] == $unsigned(reg52)))));
      reg64 <= wire37[(3'h7):(1'h0)];
      reg65 <= $unsigned(({($unsigned((8'ha4)) ?
              (reg52 ? wire35 : reg64) : reg63),
          (8'hba)} ^ ($signed($signed((7'h40))) && reg60[(2'h2):(1'h0)])));
      if (((^~(($signed(reg60) ?
          reg56 : $unsigned((8'had))) ~^ ($signed(reg65) >= (reg60 * reg65)))) >>> reg60[(2'h2):(1'h1)]))
        begin
          reg66 <= ((wire37[(3'h7):(3'h4)] + ($unsigned((wire61 ^ reg45)) <<< {reg47[(2'h3):(2'h2)],
              (wire35 ? reg60 : reg63)})) << wire35);
          reg67 <= $unsigned(reg50[(3'h7):(2'h2)]);
          if ($signed(((8'hbe) && reg64)))
            begin
              reg68 <= (((reg49[(3'h7):(2'h2)] >> ($unsigned((8'hb6)) && reg56[(1'h1):(1'h1)])) * wire42[(3'h4):(1'h1)]) ?
                  wire36 : {((~^(wire53 ?
                          (8'hae) : reg65)) != reg51[(3'h6):(1'h1)])});
              reg69 <= {reg68[(3'h7):(3'h6)]};
              reg70 <= (wire42 ?
                  (wire39[(1'h0):(1'h0)] ?
                      reg45 : $signed({(wire37 ^~ wire40)})) : (+((+((8'ha9) ?
                          wire44 : (8'hb9))) ?
                      ((reg57 ? reg68 : wire36) ?
                          $signed(wire38) : (reg49 ?
                              (8'hb7) : reg47)) : $signed(((8'ha3) | (8'hb7))))));
            end
          else
            begin
              reg68 <= (wire39[(3'h6):(3'h5)] - (7'h43));
              reg69 <= (reg55[(1'h0):(1'h0)] ?
                  ({$unsigned({reg48}),
                      ((^~(8'ha6)) ?
                          (wire42 ?
                              (8'ha2) : wire53) : {wire35})} || (reg50[(3'h5):(3'h5)] == $signed((wire39 ?
                      wire41 : (8'ha7))))) : ((~^(|(reg50 ? (8'ha4) : reg45))) ?
                      {$signed($unsigned(wire42)),
                          ($signed(reg67) == reg66)} : {reg48}));
              reg70 <= (8'haf);
              reg71 <= ($signed(reg46) ^ reg54[(4'ha):(4'ha)]);
              reg72 <= (8'hab);
            end
          reg73 <= wire39[(1'h0):(1'h0)];
          reg74 <= (&reg65);
        end
      else
        begin
          reg66 <= $unsigned($signed($unsigned($unsigned(reg57))));
        end
      reg75 <= (reg67[(4'h8):(1'h0)] ?
          {(~^(reg59[(3'h4):(1'h1)] >> ((8'h9c) ^~ reg63)))} : $unsigned(wire44));
    end
  assign wire76 = ($signed(($signed(reg55) ?
                          $unsigned(wire62) : reg70[(3'h4):(1'h1)])) ?
                      (~^reg48[(3'h4):(2'h3)]) : wire42[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg77 <= (^~$signed((~|$signed(reg48[(2'h2):(1'h0)]))));
      reg78 <= {$unsigned((8'ha2)), $signed(reg67)};
      reg79 <= wire62[(3'h5):(3'h4)];
      if ((wire35[(2'h2):(1'h0)] >> $unsigned($unsigned((wire76 | ((8'hbc) ?
          wire62 : wire35))))))
        begin
          reg80 <= $unsigned((reg57[(4'h8):(3'h4)] ?
              $signed(wire38) : $unsigned({(wire53 == reg77)})));
        end
      else
        begin
          reg80 <= reg72;
          reg81 <= wire39[(4'h8):(2'h3)];
          reg82 <= $signed(reg81);
          reg83 <= wire76[(1'h1):(1'h1)];
        end
    end
  assign wire84 = (~&(8'haa));
endmodule
