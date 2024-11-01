module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire204;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire204, wire48, wire46, wire5, wire4, (1'h0)};
  assign wire4 = (wire2[(4'h9):(2'h3)] < $unsigned((wire2 ?
                     $unsigned($signed(wire0)) : {(wire3 ? (8'ha9) : wire0)})));
  assign wire5 = wire4;
  module6 #() modinst47 (wire46, clk, wire4, wire0, wire2, wire5);
  assign wire48 = ((~|(wire0[(3'h4):(1'h1)] ^ $unsigned($unsigned(wire0)))) ?
                      {wire0, (7'h41)} : (wire46 || ((8'hb1) ~^ ((wire0 ?
                          wire3 : (8'hb7)) >> (wire1 ? wire46 : wire46)))));
  module49 #() modinst205 (wire204, clk, wire2, wire48, wire4, wire5);
endmodule

module module49
#(parameter param203 = (^{((((8'ha8) ^~ (8'h9e)) ? {(7'h40)} : {(8'ha6)}) <<< (~&{(8'hab), (8'ha4)}))}))
(y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'h44f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire51;
  input wire signed [(4'h9):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire193;
  wire signed [(5'h10):(1'h0)] wire192;
  wire [(5'h14):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire139;
  reg [(3'h5):(1'h0)] reg202 = (1'h0);
  reg [(4'h8):(1'h0)] reg201 = (1'h0);
  reg [(4'he):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  reg [(3'h4):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'hd):(1'h0)] reg189 = (1'h0);
  reg [(5'h14):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire172,
                 wire150,
                 wire149,
                 wire148,
                 wire54,
                 wire55,
                 wire74,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire139,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg191,
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
                 reg176,
                 reg175,
                 reg174,
                 reg105,
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
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 (1'h0)};
  assign wire54 = wire50[(1'h0):(1'h0)];
  assign wire55 = ((wire50 ?
                      $unsigned((~|wire50[(4'ha):(1'h0)])) : wire54[(1'h1):(1'h0)]) + wire52);
  always
    @(posedge clk) begin
      if ($unsigned(wire51[(4'h8):(2'h2)]))
        begin
          reg56 <= (wire50[(1'h0):(1'h0)] - ($signed((wire55 ?
              {wire53, wire51} : $signed(wire50))) ^~ wire50));
          if ({{(~wire51)}, $signed($signed($unsigned((&(8'hba)))))})
            begin
              reg57 <= wire52;
              reg58 <= reg57;
              reg59 <= $unsigned(($signed((8'hb8)) ?
                  (((~|wire54) - ((7'h42) ? reg56 : reg57)) ?
                      $signed({wire51}) : $unsigned(wire53)) : (8'hac)));
              reg60 <= (+$unsigned(wire50[(3'h7):(1'h0)]));
              reg61 <= (({$signed({wire52}), $unsigned((!wire54))} ?
                      wire51 : reg57[(1'h1):(1'h1)]) ?
                  {(~&$unsigned($signed(reg59)))} : reg58[(4'h8):(2'h2)]);
            end
          else
            begin
              reg57 <= $signed(wire52);
              reg58 <= $signed((8'hbc));
            end
          reg62 <= $signed(($signed(($unsigned(wire51) ?
                  reg58[(3'h7):(1'h0)] : reg58)) ?
              reg59[(3'h6):(1'h0)] : (8'ha2)));
        end
      else
        begin
          if ($signed(((8'hb3) ?
              reg60[(4'hc):(3'h7)] : $signed((~|(wire51 >>> wire53))))))
            begin
              reg56 <= ((-$signed($unsigned(reg57[(1'h0):(1'h0)]))) ?
                  (!(&reg56[(4'hf):(4'h8)])) : wire53);
              reg57 <= wire51;
            end
          else
            begin
              reg56 <= reg62[(3'h4):(1'h0)];
            end
          reg58 <= (wire51[(2'h3):(2'h2)] ? wire50 : reg58);
          if ((-(~wire54[(1'h1):(1'h1)])))
            begin
              reg59 <= reg57;
              reg60 <= (&(reg62[(2'h3):(2'h3)] | $signed(wire50[(3'h4):(1'h0)])));
            end
          else
            begin
              reg59 <= $signed(($signed(($unsigned(reg58) ?
                  ((8'hac) ?
                      wire50 : reg60) : wire53[(3'h5):(2'h3)])) <= reg57[(2'h2):(1'h1)]));
              reg60 <= $signed((reg56[(2'h3):(2'h3)] < wire53));
              reg61 <= (~&$unsigned(($signed($signed(reg61)) ?
                  ((reg59 || reg62) ?
                      (&(8'hb0)) : $signed(wire53)) : wire54[(1'h1):(1'h1)])));
              reg62 <= ($signed({((!wire50) <<< (reg58 ? wire50 : (8'ha7))),
                  wire50}) << {(($signed((8'h9c)) - {(7'h44)}) || $unsigned(wire50)),
                  $signed((~^(reg59 || wire52)))});
            end
          if ($unsigned($signed(wire54[(1'h0):(1'h0)])))
            begin
              reg63 <= wire50[(4'hc):(4'h8)];
              reg64 <= {($signed($unsigned($unsigned(wire51))) ?
                      reg57 : ((^$signed(reg63)) ?
                          ((^wire53) <<< (reg62 ?
                              wire55 : reg60)) : reg60[(1'h1):(1'h1)]))};
              reg65 <= $signed(wire50);
              reg66 <= ((({$unsigned(wire52), $unsigned(wire53)} ?
                  $signed($signed(reg57)) : (+$unsigned(wire51))) <= (+((wire53 ?
                      reg62 : reg63) ?
                  (!reg65) : reg61))) <<< $unsigned((^~((reg60 ?
                  (8'ha9) : reg60) ^~ (reg60 ~^ reg58)))));
            end
          else
            begin
              reg63 <= $unsigned(reg65);
              reg64 <= $unsigned(reg59[(3'h4):(1'h1)]);
              reg65 <= wire50[(3'h6):(1'h1)];
              reg66 <= $signed(({($signed(reg61) - reg60[(2'h2):(1'h1)])} ?
                  reg56 : {(reg62 ? (8'hb6) : $signed(wire55)),
                      reg61[(4'hd):(4'h9)]}));
              reg67 <= $unsigned($unsigned(((wire51[(4'h8):(2'h3)] ?
                  (wire53 >> reg65) : (wire55 ? reg65 : wire55)) || {wire55})));
            end
          if ($unsigned(((~(~^(^(8'hbd)))) ?
              ($unsigned({(8'ha9), reg59}) ?
                  reg57 : $unsigned($signed(reg65))) : $unsigned(reg61))))
            begin
              reg68 <= $unsigned(reg61[(1'h0):(1'h0)]);
              reg69 <= (($signed(({reg67, reg61} ?
                      (~(8'hb8)) : (reg65 ?
                          wire53 : reg58))) && (reg61 ^ $unsigned($unsigned((8'hbf))))) ?
                  ($signed((reg59 ?
                      $unsigned(wire55) : $unsigned(reg61))) * $signed((-(8'ha7)))) : reg58[(4'h9):(2'h3)]);
              reg70 <= (({reg65} <<< wire55[(4'hc):(3'h7)]) ? reg65 : reg65);
              reg71 <= wire50[(4'h9):(1'h0)];
              reg72 <= ((~^(7'h44)) > $unsigned($signed(reg66[(2'h2):(1'h1)])));
            end
          else
            begin
              reg68 <= $unsigned({(((wire50 != reg56) ?
                          $signed(reg66) : $unsigned((8'hb5))) ?
                      wire54[(2'h2):(1'h1)] : reg59),
                  ($unsigned((~|reg60)) ~^ (8'haf))});
              reg69 <= (($unsigned({((8'hac) >> reg58)}) == reg59[(4'he):(4'he)]) & $unsigned(reg57[(1'h1):(1'h1)]));
              reg70 <= $signed(wire53);
            end
        end
      reg73 <= {(((^~$signed(reg61)) ^ {(reg69 ? reg59 : reg68), reg66}) ?
              ($signed((wire53 <= reg64)) ?
                  (~|(^~reg63)) : $signed($signed(wire52))) : $signed(wire52))};
    end
  assign wire74 = ($unsigned($unsigned($signed($signed(wire54)))) & (|$unsigned(wire54)));
  always
    @(posedge clk) begin
      if ((((~^(wire50[(4'h9):(3'h7)] ?
          ((8'haa) ?
              wire54 : reg57) : $signed(reg60))) >> $unsigned(reg72)) >= reg66[(1'h0):(1'h0)]))
        begin
          reg75 <= (reg73[(4'h9):(2'h2)] ?
              ({wire52, (reg67[(1'h0):(1'h0)] <<< reg70)} ?
                  $signed(((+wire53) << (|reg61))) : $unsigned(($signed(reg58) > {(8'hb1),
                      wire50}))) : ($signed(reg70) ?
                  (reg59[(1'h0):(1'h0)] ?
                      ($unsigned(wire55) * $unsigned(wire54)) : $signed((reg69 == wire55))) : $unsigned(($unsigned(reg72) ?
                      reg66 : {reg59, reg62}))));
          if ((8'hb4))
            begin
              reg76 <= $unsigned(reg58[(3'h4):(2'h3)]);
              reg77 <= $unsigned(((8'ha4) ?
                  (&$signed({(8'ha0), reg70})) : {$signed((reg63 ^ reg65))}));
            end
          else
            begin
              reg76 <= (($unsigned((~(reg72 <= wire55))) ?
                      $signed(reg65) : (7'h40)) ?
                  $unsigned((((^~(7'h43)) && (reg77 >>> reg65)) ?
                      reg57[(2'h2):(1'h1)] : $unsigned(wire54))) : ((+reg72[(4'h8):(2'h2)]) ?
                      reg71 : $unsigned($unsigned($signed(reg63)))));
              reg77 <= reg64[(3'h4):(3'h4)];
              reg78 <= $signed({reg66[(1'h0):(1'h0)]});
              reg79 <= $unsigned((((wire52 >= (reg73 ? reg56 : wire52)) ?
                      {(^~reg68), (|(8'ha3))} : (+wire53)) ?
                  $signed(reg59) : $signed($signed($signed(reg72)))));
              reg80 <= (reg73 ?
                  ($unsigned(reg56[(4'h8):(3'h7)]) || reg59[(1'h0):(1'h0)]) : reg77[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          reg75 <= $unsigned(reg60);
          reg76 <= (^(~|(~^((reg71 ?
              wire53 : wire50) >= reg76[(3'h4):(1'h1)]))));
        end
      reg81 <= $signed($signed(reg70));
      if ((+reg62[(1'h0):(1'h0)]))
        begin
          reg82 <= $signed(reg67);
          reg83 <= reg60[(3'h5):(2'h3)];
          reg84 <= $unsigned({$signed($signed($unsigned(reg66))),
              reg61[(3'h7):(1'h0)]});
          reg85 <= (~&(8'hb0));
        end
      else
        begin
          reg82 <= (|$signed(reg70[(1'h0):(1'h0)]));
          reg83 <= ($unsigned($unsigned(reg73[(3'h4):(3'h4)])) * $signed($unsigned((8'hb5))));
          reg84 <= ((^(~&($unsigned(reg57) || (7'h40)))) ~^ reg62[(1'h1):(1'h1)]);
          reg85 <= reg68;
          if (wire74[(4'he):(4'hc)])
            begin
              reg86 <= (^~($unsigned(reg71) ?
                  reg75 : (($unsigned(wire50) > $signed(reg76)) < (&(^(8'hb0))))));
            end
          else
            begin
              reg86 <= $signed(wire55[(3'h5):(3'h4)]);
              reg87 <= reg72[(3'h4):(1'h0)];
            end
        end
      reg88 <= (reg57[(1'h1):(1'h1)] && reg75);
      reg89 <= reg59;
    end
  assign wire90 = ((~reg78) & $signed((&(8'hac))));
  assign wire91 = $signed(reg80[(2'h2):(2'h2)]);
  assign wire92 = ($unsigned(reg77[(3'h7):(1'h1)]) ? reg64 : reg61);
  assign wire93 = {(~|(reg59 ? (~{reg65, (8'hbd)}) : {((8'hb3) * reg69)}))};
  assign wire94 = $unsigned((reg89 != (^$unsigned(reg87[(4'he):(3'h6)]))));
  always
    @(posedge clk) begin
      if ($signed($signed(({reg67[(3'h7):(2'h2)], reg58} ?
          {wire50[(4'hc):(4'hb)]} : $signed(reg58[(2'h3):(2'h2)])))))
        begin
          if (({$signed((reg69[(4'h8):(3'h6)] || ((8'ha9) * wire92))),
                  {$unsigned($unsigned(reg72))}} ?
              $unsigned($signed(((|reg87) ?
                  wire55[(4'ha):(1'h1)] : reg66[(3'h5):(3'h5)]))) : reg88[(1'h1):(1'h0)]))
            begin
              reg95 <= $signed(reg81[(4'ha):(3'h6)]);
            end
          else
            begin
              reg95 <= ((&reg67) >> reg64);
              reg96 <= (reg75 ?
                  reg72 : ((~^reg76) < (&$signed((reg87 ? reg82 : wire53)))));
            end
          if ($signed((~^((~|reg83[(3'h4):(2'h3)]) >= (reg76 ?
              $unsigned((8'h9d)) : {(8'hae)})))))
            begin
              reg97 <= $signed((({((8'hb0) ? reg82 : reg79),
                          (wire92 >>> wire90)} ?
                      reg58 : (reg72 ^~ (wire74 ? (8'ha4) : reg76))) ?
                  $signed($signed((reg76 >= reg89))) : {$unsigned($unsigned(wire93)),
                      $signed(reg58[(3'h5):(3'h5)])}));
              reg98 <= reg69;
              reg99 <= (^~$unsigned((reg95 >> (reg70 ^~ ((8'hbe) ?
                  (8'ha0) : (8'ha0))))));
            end
          else
            begin
              reg97 <= {reg89};
              reg98 <= reg61;
              reg99 <= reg83[(2'h2):(1'h0)];
              reg100 <= (+((+((reg73 ? (7'h44) : reg58) > (8'ha6))) ?
                  $unsigned((-reg78[(1'h1):(1'h0)])) : wire92[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ((~|((&reg98) <<< $unsigned($signed((wire52 ? wire94 : wire51))))))
            begin
              reg95 <= (~$unsigned(reg98));
            end
          else
            begin
              reg95 <= reg71[(2'h2):(2'h2)];
              reg96 <= wire54[(1'h1):(1'h0)];
              reg97 <= (reg86[(4'h9):(2'h3)] ?
                  $unsigned(wire91) : (reg77[(3'h6):(1'h0)] >> (~&(~|$unsigned(reg88)))));
              reg98 <= $signed($unsigned({$signed((reg88 ^~ reg57)),
                  reg69[(5'h13):(2'h2)]}));
              reg99 <= (((^$unsigned(wire74)) ~^ (+($unsigned(wire74) ?
                      reg98[(4'hb):(3'h6)] : reg96[(3'h6):(2'h2)]))) ?
                  (wire54 << (reg86 < wire90)) : wire54[(1'h1):(1'h0)]);
            end
          if ((reg81 ?
              $signed(wire51[(4'h8):(1'h1)]) : ((^~reg80) > $unsigned((reg80 > {wire53,
                  reg79})))))
            begin
              reg100 <= (8'h9d);
              reg101 <= {($unsigned(({reg68, wire50} != (reg57 ?
                          (7'h42) : (8'h9d)))) ?
                      $signed($unsigned((~|reg86))) : (reg80[(3'h4):(1'h1)] ?
                          reg64[(1'h0):(1'h0)] : $signed($signed(reg83))))};
              reg102 <= (8'hb7);
              reg103 <= reg62[(1'h0):(1'h0)];
            end
          else
            begin
              reg100 <= wire51;
              reg101 <= $unsigned(reg79[(1'h0):(1'h0)]);
            end
        end
      reg104 <= reg76[(4'hc):(4'h9)];
      reg105 <= wire74[(4'hf):(4'h9)];
    end
  module106 #() modinst140 (.wire107(reg98), .wire108(wire74), .wire110(reg103), .clk(clk), .wire109(reg63), .y(wire139));
  always
    @(posedge clk) begin
      reg141 <= reg63[(5'h13):(3'h5)];
      if ($unsigned({wire52, $unsigned($unsigned(((8'hb8) ? reg102 : reg99)))}))
        begin
          if (wire50[(3'h6):(1'h1)])
            begin
              reg142 <= (reg97[(2'h3):(1'h1)] != (|{wire93[(4'ha):(3'h4)],
                  ((wire92 ? wire54 : reg64) + (-reg57))}));
              reg143 <= wire93[(2'h2):(1'h0)];
              reg144 <= (^~(-$signed($unsigned((~^wire91)))));
              reg145 <= reg95;
              reg146 <= (wire93[(1'h0):(1'h0)] && reg61);
            end
          else
            begin
              reg142 <= wire52;
            end
        end
      else
        begin
          reg142 <= $signed($signed((~^$signed($signed(reg88)))));
          reg143 <= reg79[(2'h3):(1'h1)];
          reg144 <= (^$unsigned($unsigned(($signed((8'h9d)) > (reg70 ?
              reg83 : (8'hb4))))));
        end
      reg147 <= reg69;
    end
  assign wire148 = reg102[(3'h5):(1'h0)];
  assign wire149 = (((~^reg98[(3'h4):(1'h0)]) | reg81) ^~ ((8'h9e) ^~ $unsigned(reg146[(4'he):(2'h2)])));
  assign wire150 = ((^~reg104[(4'ha):(4'h8)]) ? reg60 : (8'ha1));
  module151 #() modinst173 (.clk(clk), .wire153(reg86), .wire154(wire53), .wire156(reg79), .wire155(wire92), .wire152(reg97), .y(wire172));
  always
    @(posedge clk) begin
      if ((-(~|(8'hb8))))
        begin
          reg174 <= reg57[(1'h1):(1'h1)];
          if ((~|{wire150, (reg101[(1'h1):(1'h0)] << wire52[(3'h6):(2'h3)])}))
            begin
              reg175 <= (~&reg174[(3'h5):(3'h5)]);
              reg176 <= (&reg68[(4'hd):(4'h9)]);
              reg177 <= $signed(reg102);
            end
          else
            begin
              reg175 <= $unsigned((8'hbd));
              reg176 <= {$signed(($unsigned($signed(reg76)) ?
                      $unsigned((~^reg57)) : reg174))};
              reg177 <= reg177[(4'he):(2'h3)];
              reg178 <= $signed(wire139);
              reg179 <= reg88[(1'h1):(1'h0)];
            end
          reg180 <= $unsigned((+(&((~^wire55) ?
              $signed((8'h9c)) : (reg146 ? reg73 : (8'ha2))))));
          reg181 <= (+$signed((-($unsigned(reg73) == reg70))));
          reg182 <= (|$signed(reg68[(3'h6):(1'h0)]));
        end
      else
        begin
          if ($unsigned(((~reg86) ?
              $signed((^$signed((8'ha3)))) : ($signed(reg100) <= reg181))))
            begin
              reg174 <= (^reg101[(1'h1):(1'h1)]);
              reg175 <= (reg58[(2'h3):(1'h0)] ?
                  (reg87[(4'hf):(4'h8)] ?
                      reg89 : $signed(wire148[(1'h0):(1'h0)])) : (&$signed($unsigned((8'hb3)))));
              reg176 <= (reg81[(4'h8):(4'h8)] ?
                  $unsigned({reg82[(1'h1):(1'h0)]}) : $unsigned(((^~reg79) ?
                      (reg84 <<< $unsigned(reg67)) : (-(reg182 + reg98)))));
            end
          else
            begin
              reg174 <= reg61;
              reg175 <= (((reg86 ?
                  $unsigned(((8'hbc) && reg101)) : $signed($signed((8'hb8)))) <= $unsigned({$signed(reg100)})) <= $unsigned(reg175));
              reg176 <= (reg86[(4'h9):(2'h2)] ?
                  (8'haf) : (!$signed(((reg71 ? (8'hac) : reg85) ?
                      (!reg71) : reg88[(1'h1):(1'h1)]))));
            end
          reg177 <= ($unsigned((((reg87 ? (8'h9f) : wire148) ^~ (reg105 ?
                      (8'ha2) : reg86)) ?
                  ((reg72 != (8'ha1)) ?
                      $unsigned(reg142) : $unsigned(reg73)) : reg182[(2'h3):(2'h3)])) ?
              (-reg84) : $signed($unsigned((reg78 ?
                  (^~reg62) : {(8'ha1), reg68}))));
        end
      if ({reg182[(3'h7):(2'h3)]})
        begin
          reg183 <= $signed((^(~&reg143[(4'ha):(3'h6)])));
          reg184 <= {(-reg89)};
          if ((reg63 ?
              wire93 : (($unsigned(reg180) >> reg104) ?
                  reg58 : ((^~(|reg103)) ?
                      (~&(reg59 >= wire91)) : reg145[(2'h2):(1'h1)]))))
            begin
              reg185 <= reg67[(4'he):(2'h2)];
            end
          else
            begin
              reg185 <= reg71;
              reg186 <= {$signed(wire149), (~&(~&$unsigned((8'h9f))))};
            end
        end
      else
        begin
          reg183 <= $unsigned(reg64);
          if ((8'h9c))
            begin
              reg184 <= $signed($unsigned($signed(wire149[(4'h9):(1'h0)])));
              reg185 <= (((~|$unsigned($unsigned(reg67))) ?
                      $unsigned((!$signed(reg100))) : $unsigned({{reg186,
                              reg104},
                          reg104})) ?
                  (~&{reg60,
                      (-reg58)}) : ($signed((reg83[(2'h2):(1'h0)] & reg95[(4'h8):(3'h6)])) <= reg73[(3'h5):(2'h2)]));
            end
          else
            begin
              reg184 <= (+(wire74 ?
                  $signed(reg72[(1'h1):(1'h1)]) : reg175[(3'h7):(3'h4)]));
              reg185 <= $signed(reg180);
              reg186 <= ($signed({wire92[(3'h7):(3'h6)]}) ?
                  (-((~reg63) ?
                      wire50[(3'h5):(3'h5)] : ((^~reg79) <<< reg79[(2'h3):(1'h1)]))) : {(8'ha5)});
              reg187 <= $signed({(^$signed($signed(wire74)))});
              reg188 <= (((!(reg82 ^~ $unsigned(reg71))) ?
                  reg88[(3'h4):(2'h2)] : reg98) | reg63[(5'h14):(3'h7)]);
            end
          reg189 <= ($signed(($signed((reg88 ? reg186 : reg184)) ?
                  (+(reg141 && (7'h44))) : (~^(wire55 > wire149)))) ?
              $unsigned($signed(reg63[(3'h4):(1'h0)])) : (~reg77));
          reg190 <= $unsigned(reg73[(3'h7):(1'h0)]);
          if ($signed((reg104[(2'h2):(2'h2)] ^~ (-((reg175 - wire148) ?
              (|reg178) : (reg81 ? reg80 : wire139))))))
            begin
              reg191 <= $unsigned(reg147[(2'h2):(1'h0)]);
            end
          else
            begin
              reg191 <= (((({wire52} && $signed(wire139)) ?
                      reg89 : $unsigned(reg101[(2'h2):(1'h0)])) >= wire139[(1'h1):(1'h0)]) ?
                  ({{$unsigned((8'ha9))}} ?
                      (({reg68, reg188} - {reg71,
                          (8'h9e)}) | (~|$signed(reg175))) : wire53) : reg99);
            end
        end
    end
  assign wire192 = (&$signed((~(~^reg61))));
  assign wire193 = wire91[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg194 <= $unsigned($unsigned(((!(~&reg181)) ?
          ((reg68 ? reg189 : (7'h40)) ?
              (reg71 <= reg175) : $signed(reg85)) : $unsigned((^~(8'haa))))));
      if (wire55)
        begin
          if ((reg63[(4'hb):(4'h8)] ?
              {((-(reg86 ? (8'hb6) : reg80)) || ($unsigned(wire193) ?
                      $unsigned(reg71) : (reg62 ? (8'hbd) : reg185)))} : reg59))
            begin
              reg195 <= ($unsigned(reg68[(4'ha):(3'h7)]) * wire53[(5'h12):(5'h10)]);
              reg196 <= $signed($signed(($signed($unsigned(reg188)) & reg81)));
              reg197 <= ($signed($signed(((reg105 << reg59) == wire51[(3'h7):(2'h3)]))) >= reg79);
              reg198 <= reg79;
              reg199 <= (~&reg56);
            end
          else
            begin
              reg195 <= wire92[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg195 <= $signed(($signed(reg59) ?
              $unsigned($unsigned($signed(reg79))) : $signed({(reg176 || reg188)})));
          reg196 <= $signed($signed({((reg176 ? reg105 : reg184) != ((8'hba) ?
                  reg64 : wire92))}));
        end
      reg200 <= reg57[(1'h0):(1'h0)];
      reg201 <= (wire55 <= $unsigned((((!reg147) ? (8'h9e) : (~reg181)) ?
          reg175[(3'h7):(3'h5)] : (+wire149[(3'h4):(3'h4)]))));
      reg202 <= reg81[(3'h6):(3'h5)];
    end
endmodule

module module6
#(parameter param44 = (7'h44), 
parameter param45 = (~^param44))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire11;
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire43,
                 wire40,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire13,
                 wire11,
                 reg42,
                 reg15,
                 reg14,
                 reg12,
                 (1'h0)};
  assign wire11 = (wire10[(4'hb):(3'h4)] >= {(wire10 ?
                          {$unsigned(wire9)} : $unsigned($unsigned(wire10)))});
  always
    @(posedge clk) begin
      reg12 <= (({$signed((~wire8))} ?
              wire11[(3'h6):(3'h4)] : $unsigned(((wire11 > wire10) ?
                  $unsigned(wire9) : wire11[(2'h2):(1'h1)]))) ?
          wire8 : (!{(+(wire11 ? wire10 : wire8))}));
    end
  assign wire13 = (|wire7[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg14 <= ((&(({wire13, wire7} ? $unsigned(wire13) : (8'hb0)) ?
              wire13[(1'h1):(1'h1)] : (~^wire8))) ?
          wire7[(1'h1):(1'h0)] : wire8[(2'h2):(1'h0)]);
      reg15 <= $unsigned((~(($signed(wire7) ? (|(8'ha1)) : (wire8 || wire7)) ?
          (~|{wire8, (8'hb2)}) : {wire8[(4'hd):(4'hb)],
              (wire10 ? wire11 : wire7)})));
    end
  assign wire16 = (~|($signed($signed((|(8'hb1)))) && (!$unsigned(wire8))));
  assign wire17 = (wire11 ?
                      (({$signed(wire11)} ?
                          (wire16[(5'h11):(3'h4)] < wire10[(5'h10):(2'h3)]) : (~&(wire8 <<< wire8))) >= wire11) : reg14);
  assign wire18 = $unsigned(((($unsigned((8'hbc)) ?
                          reg15[(3'h5):(1'h0)] : wire8[(4'he):(4'hc)]) ?
                      (reg12[(2'h3):(2'h2)] && (~^wire8)) : wire11) ^~ (wire8[(4'hd):(3'h5)] > (~$signed(wire10)))));
  assign wire19 = (~^(wire9 < (~&reg12[(1'h1):(1'h1)])));
  module20 #() modinst41 (wire40, clk, wire8, wire17, wire13, wire11);
  always
    @(posedge clk) begin
      reg42 <= {(wire11[(4'hb):(1'h1)] > {(+(+wire9)),
              ({wire11} ? (~^wire10) : wire17[(2'h2):(2'h2)])}),
          $unsigned(reg15)};
    end
  assign wire43 = $unsigned(((wire8 ?
                          wire16[(4'hf):(3'h4)] : (reg14[(3'h4):(3'h4)] ?
                              (&wire16) : (reg15 ? wire8 : wire7))) ?
                      (~wire40[(4'ha):(3'h5)]) : (wire9[(2'h3):(1'h0)] ?
                          (~&(wire40 ^ wire13)) : (&wire7))));
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire25;
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire25 = (wire24 ?
                      ((wire24[(4'hc):(4'hc)] ?
                          ((wire22 <= wire23) ^~ wire22) : ((wire23 ?
                                  (8'ha3) : (8'hae)) ?
                              {wire21} : wire23[(4'hc):(3'h6)])) + (((8'hb4) ?
                              $unsigned(wire23) : {wire22}) ?
                          wire21 : $unsigned($unsigned(wire24)))) : {wire21,
                          $signed(((wire21 ? wire23 : wire22) ?
                              (!wire24) : $unsigned((8'ha6))))});
  always
    @(posedge clk) begin
      reg26 <= $signed((-(wire25[(2'h2):(1'h1)] ?
          (-(wire24 ? wire25 : (8'h9c))) : wire25[(3'h7):(3'h6)])));
      reg27 <= (wire21[(4'h9):(3'h5)] != ((wire21[(3'h6):(1'h0)] << wire25[(4'h8):(1'h0)]) ^ ((wire22 ?
              $unsigned(wire25) : (wire22 ? wire23 : reg26)) ?
          $unsigned($signed((8'hb2))) : $unsigned((wire24 ?
              wire25 : wire22)))));
      reg28 <= ((((~^(wire25 ? wire23 : wire23)) ?
                  ((wire22 * wire23) ? wire25 : ((7'h42) - wire25)) : wire25) ?
              (wire23[(3'h5):(3'h5)] >>> (8'h9d)) : (~|(wire24[(1'h1):(1'h0)] ?
                  (wire23 ~^ wire21) : {wire25}))) ?
          (((reg27 < (wire22 ? reg26 : wire23)) ^ reg26[(2'h2):(2'h2)]) ?
              (reg26 <<< ($unsigned(wire25) <= wire24)) : (~(~(&reg26)))) : ({$unsigned($signed(wire25))} ?
              ($unsigned({reg27, wire23}) ?
                  $unsigned(wire24[(3'h7):(3'h7)]) : (wire21[(4'hd):(3'h5)] - ((8'ha8) != reg26))) : wire22[(4'h8):(2'h3)]));
      reg29 <= (!$signed((|$signed((-wire22)))));
      if (reg28[(2'h3):(1'h0)])
        begin
          reg30 <= $unsigned(wire21[(2'h3):(1'h1)]);
          reg31 <= $signed($signed($signed(($signed(wire23) ?
              (~&wire22) : (wire25 <= wire25)))));
        end
      else
        begin
          reg30 <= $unsigned($signed((wire25[(1'h1):(1'h0)] && (~&$unsigned(reg26)))));
          reg31 <= $unsigned($signed(reg29[(1'h1):(1'h0)]));
          if (reg29[(3'h4):(2'h2)])
            begin
              reg32 <= $unsigned(((((|wire23) ?
                      {wire23} : (reg26 ? wire22 : reg31)) ?
                  reg26[(2'h2):(2'h2)] : wire21) > (reg29[(2'h2):(2'h2)] ?
                  (wire24[(3'h4):(2'h3)] != reg30[(4'he):(2'h3)]) : reg27)));
              reg33 <= wire25;
            end
          else
            begin
              reg32 <= (~^$unsigned(reg33));
              reg33 <= wire23;
              reg34 <= (&{$unsigned(reg32),
                  ((~^(reg27 ?
                      reg30 : wire24)) ^ ($signed(reg28) | (reg29 >>> wire21)))});
              reg35 <= $signed({(($unsigned((8'hb5)) >= (wire25 <<< reg31)) & reg29[(1'h1):(1'h1)])});
            end
        end
    end
  assign wire36 = $unsigned($signed(wire24[(3'h4):(1'h0)]));
  assign wire37 = (~reg28[(3'h4):(2'h2)]);
  assign wire38 = $unsigned(reg29);
  assign wire39 = {(!{(reg28[(4'he):(4'hd)] * $signed(wire37)),
                          ((~|reg26) * (reg27 >> reg26))}),
                      (reg31[(4'hb):(2'h2)] ?
                          $signed(((wire21 * reg30) ?
                              (reg29 != (8'hbf)) : $unsigned((8'haf)))) : $unsigned({wire22,
                              $unsigned(reg29)}))};
endmodule

module module151  (y, clk, wire156, wire155, wire154, wire153, wire152);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire156;
  input wire signed [(3'h4):(1'h0)] wire155;
  input wire [(5'h15):(1'h0)] wire154;
  input wire [(4'hf):(1'h0)] wire153;
  input wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire157;
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  assign y = {wire171,
                 wire160,
                 wire157,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire157 = {(!($unsigned((wire155 || (8'hbd))) ?
                           wire154 : $signed((~|wire154)))),
                       (!$unsigned(((wire156 <= wire152) ?
                           (wire152 - wire155) : $signed((8'hb3)))))};
  always
    @(posedge clk) begin
      reg158 <= {$signed($unsigned(wire155)), wire156};
      reg159 <= {$signed(wire156), wire156};
    end
  assign wire160 = $unsigned({{wire154}});
  always
    @(posedge clk) begin
      reg161 <= {(($unsigned((&wire157)) & $unsigned($unsigned(wire155))) << (({wire154,
              (8'hb0)} <= (wire154 ?
              (8'hac) : (8'hac))) || ({wire153} >>> wire155[(2'h2):(1'h0)]))),
          wire155};
      reg162 <= ((((~|$unsigned((8'ha0))) ?
              (+(~^wire156)) : ($unsigned(wire160) ^ $signed(reg158))) ?
          reg161 : $unsigned(wire156[(2'h3):(2'h2)])) || (reg159[(3'h5):(2'h3)] ?
          $unsigned(wire160) : ($signed((reg159 ? wire153 : reg159)) ?
              ((reg159 ? wire156 : reg159) ?
                  (!reg159) : (wire154 | wire160)) : reg161[(2'h3):(1'h1)])));
      if (((wire156[(2'h3):(1'h1)] ?
              wire154[(4'hf):(1'h1)] : $unsigned(reg158)) ?
          $signed(wire160[(3'h5):(2'h3)]) : wire153[(3'h7):(3'h5)]))
        begin
          reg163 <= {wire156, $signed(wire160)};
          reg164 <= reg159[(2'h3):(1'h1)];
          reg165 <= wire160;
          if ($signed((reg165 <= (wire154 >> ((&reg162) || wire154[(5'h12):(4'he)])))))
            begin
              reg166 <= ((~|(+{wire155, $signed(reg164)})) ?
                  reg162[(2'h3):(1'h0)] : $unsigned((($unsigned(reg164) ?
                      $signed((8'ha6)) : (8'ha5)) != $signed(reg162[(1'h0):(1'h0)]))));
              reg167 <= ((&(~(wire155[(3'h4):(2'h2)] ^ (wire156 > wire154)))) ?
                  ((^(|{wire157,
                      reg162})) || wire157) : (reg164[(2'h2):(2'h2)] ?
                      (^$unsigned({reg164, reg163})) : reg161));
            end
          else
            begin
              reg166 <= ($signed((^(reg165[(5'h11):(1'h0)] | ((8'h9d) ?
                  (8'ha8) : (7'h44))))) ^ ($unsigned(((reg166 ?
                      (7'h42) : wire155) ?
                  reg165[(3'h7):(3'h5)] : $unsigned(reg164))) < $signed(($unsigned((8'ha4)) ?
                  reg162 : reg166[(3'h4):(1'h1)]))));
              reg167 <= {$unsigned(reg167), wire155[(3'h4):(1'h1)]};
              reg168 <= ((wire155 ? (~&reg159[(2'h3):(1'h1)]) : reg165) ?
                  (8'hba) : reg163[(2'h2):(2'h2)]);
              reg169 <= reg161[(1'h0):(1'h0)];
              reg170 <= $signed(wire153[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg163 <= (7'h40);
          reg164 <= $signed((&reg170[(5'h12):(5'h10)]));
        end
    end
  assign wire171 = reg164;
endmodule

module module106
#(parameter param137 = {(&{(((8'hbd) ? (8'hb5) : (8'hbd)) ? {(8'ha7), (8'hbf)} : ((8'hb9) ? (8'haa) : (8'hae)))}), (~^{(((8'ha2) ? (8'hb6) : (8'ha7)) - (~^(8'ha2)))})}, 
parameter param138 = ({{(~param137), (param137 ? {(8'hb7)} : param137)}, ((8'had) ? (|((8'ha5) ? param137 : param137)) : param137)} ? ((param137 << param137) | ((param137 ^ {(7'h40), param137}) ? (param137 ? (|param137) : param137) : ((param137 ^ (8'hac)) ? (param137 >> param137) : (~&param137)))) : {(({param137, (8'ha2)} ~^ (param137 ? param137 : param137)) <= {{param137}})}))
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire110;
  input wire [(4'hd):(1'h0)] wire109;
  input wire [(3'h7):(1'h0)] wire108;
  input wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  assign y = {wire136,
                 wire122,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg121,
                 reg120,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg111 <= $signed({wire110[(3'h4):(3'h4)], wire108});
      reg112 <= reg111[(4'hb):(2'h2)];
      reg113 <= $signed(wire110);
    end
  assign wire114 = {$unsigned((|(&((8'hb7) + reg112))))};
  assign wire115 = {(wire107[(2'h2):(2'h2)] ?
                           ({{wire110},
                               (!wire109)} >= $unsigned(wire107)) : $signed(wire109)),
                       (wire107 && (~((~&(7'h40)) ?
                           $signed(reg113) : (^~wire108))))};
  assign wire116 = (~(8'hac));
  assign wire117 = $signed($unsigned(reg112));
  assign wire118 = {((+{wire114}) ?
                           ((~^(wire117 ? (8'hbc) : (8'hba))) && (!(wire117 ?
                               wire117 : wire110))) : (wire114 ^ ({wire109} ?
                               wire114[(4'ha):(4'h8)] : {(8'hb2), wire108})))};
  assign wire119 = $signed(reg113[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg120 <= (reg111 < (8'hb8));
      reg121 <= wire107[(4'h8):(1'h1)];
    end
  assign wire122 = wire116[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      if ({(~((&wire114[(4'h9):(4'h8)]) ? reg120 : $unsigned($signed(reg112)))),
          $signed($signed($unsigned(((8'hb2) ? (8'ha7) : wire108))))})
        begin
          reg123 <= wire119[(5'h14):(2'h3)];
          reg124 <= (((reg111 <<< reg120) ? $unsigned((8'h9e)) : wire110) ?
              $unsigned(({$unsigned((8'hb1))} | ((&reg112) ?
                  $signed(wire107) : wire108))) : (+$unsigned(reg112)));
          if ((-$unsigned(wire110)))
            begin
              reg125 <= (reg120 ?
                  (wire110 ?
                      $unsigned(wire108) : $unsigned($signed({wire119}))) : $signed(reg120));
              reg126 <= wire114[(4'h9):(1'h1)];
              reg127 <= wire116;
              reg128 <= $unsigned($signed((+$unsigned($signed(wire108)))));
              reg129 <= wire110[(3'h4):(1'h0)];
            end
          else
            begin
              reg125 <= (~|wire110[(4'he):(4'he)]);
              reg126 <= ((wire115[(5'h10):(4'h9)] >> (+((reg121 == reg129) ?
                  wire116[(2'h2):(1'h1)] : reg120[(2'h2):(2'h2)]))) < wire118[(5'h12):(4'hc)]);
            end
          reg130 <= wire109[(2'h2):(2'h2)];
          if (({reg123[(1'h0):(1'h0)]} ?
              {$signed($signed({wire119, wire118}))} : (wire114[(3'h6):(2'h2)] ?
                  $signed($signed(reg124[(3'h5):(3'h5)])) : reg113[(4'hb):(4'h9)])))
            begin
              reg131 <= wire116;
            end
          else
            begin
              reg131 <= reg127;
              reg132 <= ((^~(-(+wire108))) ?
                  ((wire108[(3'h5):(1'h0)] ~^ $unsigned(reg124[(4'ha):(4'h8)])) ?
                      reg112[(3'h5):(1'h0)] : ({$unsigned(wire118),
                              $signed(reg124)} ?
                          (7'h40) : reg125[(2'h3):(1'h0)])) : (~&($unsigned((reg129 ?
                      reg130 : reg123)) != (~|(reg113 ? (8'hb7) : reg111)))));
              reg133 <= (reg128 ?
                  (($unsigned(((8'hb1) ?
                      reg127 : reg131)) > $signed((reg132 >= (8'ha3)))) << (wire116[(4'h9):(2'h2)] ^~ reg123)) : wire107);
              reg134 <= (((reg132 >>> wire114) - {($signed(wire115) ?
                          (-wire110) : (reg132 | reg130))}) ?
                  $unsigned(reg130[(4'h9):(2'h3)]) : (8'hab));
              reg135 <= (((|((wire108 == (8'hb4)) ?
                  $unsigned(reg124) : $unsigned(wire108))) * reg113[(2'h3):(1'h1)]) ^ reg113);
            end
        end
      else
        begin
          if (((8'hb7) ?
              ($signed((!wire108[(3'h6):(3'h5)])) & (~(|(reg125 ?
                  wire114 : wire115)))) : (~(reg135[(1'h1):(1'h1)] > reg124))))
            begin
              reg123 <= reg113[(2'h2):(2'h2)];
              reg124 <= (8'haf);
              reg125 <= {(&reg135[(2'h3):(1'h0)]), reg131[(4'hd):(3'h6)]};
            end
          else
            begin
              reg123 <= reg133[(3'h5):(2'h3)];
            end
          reg126 <= (((!reg132[(5'h13):(4'he)]) - ((reg132 & (~|wire108)) <= (wire122 * reg123[(3'h5):(2'h2)]))) <<< ($unsigned((reg134 ?
              (~reg120) : (reg133 >>> reg132))) & {wire117}));
        end
    end
  assign wire136 = $signed((reg121 ?
                       reg128 : $unsigned(reg133[(3'h5):(3'h5)])));
endmodule
