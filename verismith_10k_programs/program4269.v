module top
#(parameter param162 = (+((~(~((8'h9e) ? (7'h44) : (8'ha9)))) ? (((~^(8'ha5)) ? {(8'hb8)} : ((8'hb4) ^ (7'h43))) ? (((8'hb5) ? (7'h40) : (8'hbb)) < (^(8'haf))) : (((8'hb5) - (8'ha5)) ? ((8'h9e) && (8'hb2)) : {(8'hae)})) : (({(8'ha2), (8'hb7)} ? {(8'h9e)} : {(8'h9f), (8'ha0)}) ? ((&(8'hb5)) ? (&(8'ha8)) : ((7'h44) >> (8'hab))) : {((8'hbb) ? (8'hb4) : (8'hb9)), ((8'h9c) ? (8'ha7) : (8'ha7))}))), 
parameter param163 = ((((((8'ha6) ^ param162) - param162) ? (-(^(8'ha5))) : ((8'ha7) ? {param162, (8'h9e)} : (~&(8'hb8)))) ? ((param162 ^~ ((8'had) ? param162 : param162)) - ((~&(8'hba)) ^~ param162)) : param162) || param162))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire147;
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  assign y = {wire161,
                 wire4,
                 wire40,
                 wire42,
                 wire43,
                 wire66,
                 wire67,
                 wire147,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
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
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire4 = ($unsigned(wire2) >= ((8'ha4) ?
                     wire3[(2'h2):(2'h2)] : (+(~((7'h40) ? wire2 : wire2)))));
  module5 #() modinst41 (.wire7(wire1), .wire8(wire2), .wire9(wire3), .clk(clk), .wire6(wire4), .y(wire40));
  assign wire42 = (wire4 ?
                      $signed($unsigned(wire40)) : (({(wire0 ^ wire0),
                              (wire40 > wire3)} ?
                          ((wire4 != (8'haf)) <= (!wire2)) : {wire3,
                              (wire40 ?
                                  wire3 : wire2)}) < $unsigned($signed(wire0[(2'h2):(1'h1)]))));
  assign wire43 = $unsigned((7'h41));
  always
    @(posedge clk) begin
      reg44 <= wire3;
    end
  always
    @(posedge clk) begin
      reg45 <= ((wire42[(4'hb):(2'h2)] ?
          wire2 : (wire42 + wire40[(1'h0):(1'h0)])) == ((wire0 ?
              (~wire43[(2'h3):(2'h2)]) : $signed((~^wire2))) ?
          {$unsigned((wire3 ? wire43 : wire3))} : (&wire2[(2'h2):(1'h0)])));
      if (wire0[(1'h0):(1'h0)])
        begin
          if ($signed($unsigned((~^$unsigned($signed(wire2))))))
            begin
              reg46 <= {({$signed((wire43 ? reg45 : (8'ha2)))} ?
                      $unsigned(((~^wire3) ~^ wire42)) : $unsigned((reg44[(3'h5):(2'h3)] ?
                          (reg45 - wire40) : (!reg44))))};
              reg47 <= $unsigned(reg46);
            end
          else
            begin
              reg46 <= {(wire2[(2'h3):(2'h2)] >> $unsigned(reg44[(5'h12):(3'h6)]))};
              reg47 <= reg47;
            end
          reg48 <= $unsigned($unsigned(wire0));
          reg49 <= $signed({((|(-wire0)) * (wire1[(1'h0):(1'h0)] >> (wire2 & (8'h9d)))),
              (&$signed((!wire3)))});
          if (wire0)
            begin
              reg50 <= reg49;
              reg51 <= (-wire4);
            end
          else
            begin
              reg50 <= (&wire2);
            end
        end
      else
        begin
          reg46 <= $unsigned((&($unsigned((wire43 ? wire2 : wire3)) ?
              wire1[(2'h2):(1'h1)] : (^(reg51 - reg50)))));
          if ((~|$signed((reg45[(3'h6):(3'h4)] ?
              $unsigned($signed(reg49)) : {(8'hbe), $signed((8'hae))}))))
            begin
              reg47 <= (($signed((wire0[(2'h2):(2'h2)] - $unsigned(reg46))) ?
                      $signed(wire42) : (8'haf)) ?
                  ((~|((reg46 ^ wire2) ?
                      (8'ha5) : (wire40 >>> (8'ha0)))) | $signed(((reg50 ?
                      reg44 : (8'ha9)) == $unsigned(reg46)))) : (^(~|$unsigned((reg47 ^~ reg46)))));
              reg48 <= $unsigned($signed(reg46));
              reg49 <= $unsigned(reg49);
            end
          else
            begin
              reg47 <= (wire2[(4'hc):(1'h1)] ^ ($unsigned($unsigned($signed(wire4))) ?
                  wire0[(1'h0):(1'h0)] : ($unsigned((wire42 ^ wire1)) ?
                      ((+(8'hb2)) < (&wire43)) : (8'hbf))));
              reg48 <= (8'h9e);
              reg49 <= {reg47,
                  {((^~(wire3 ? reg44 : reg48)) ?
                          $signed($unsigned(wire42)) : $unsigned({reg44,
                              wire4}))}};
              reg50 <= (-((^~reg44[(3'h6):(2'h2)]) ?
                  ((+wire4[(4'he):(2'h3)]) ?
                      $signed(wire4[(4'he):(3'h6)]) : (|(wire42 >= reg49))) : $signed(reg46[(4'hf):(3'h6)])));
              reg51 <= $signed($unsigned(((^wire2) ~^ ($signed(reg46) ?
                  reg44 : $signed(reg44)))));
            end
          reg52 <= $signed((reg51 <= {((|(8'hac)) ?
                  (^wire3) : wire1[(1'h1):(1'h0)]),
              {$unsigned(reg47)}}));
          reg53 <= $unsigned(($unsigned($signed(wire1[(1'h1):(1'h1)])) ?
              $signed({$signed((7'h41)),
                  ((7'h44) ? reg45 : reg48)}) : $unsigned((8'h9e))));
        end
    end
  always
    @(posedge clk) begin
      reg54 <= (^wire4);
      reg55 <= $signed(wire4);
      reg56 <= {$signed(((+{reg45}) ?
              $unsigned(((7'h42) ? reg52 : reg48)) : $unsigned((8'hbe))))};
      if (wire2[(3'h6):(3'h4)])
        begin
          reg57 <= $unsigned((~|{($unsigned(reg54) ?
                  $unsigned(reg49) : {reg44}),
              (reg52 < wire1)}));
          reg58 <= ($signed($signed((~&(~^reg46)))) ?
              $signed((reg55 ?
                  ((reg50 ? reg53 : (8'hbf)) >= {reg46}) : (((8'hbb) ^ reg45) ?
                      $signed(reg54) : ((8'haf) ? reg54 : wire4)))) : reg51);
          reg59 <= $signed($signed($unsigned((7'h41))));
        end
      else
        begin
          reg57 <= wire4;
          if ((~|(((|(~&reg45)) > (((8'hbe) ? reg58 : reg46) || {wire0})) ?
              $signed($unsigned((wire4 || reg55))) : wire2)))
            begin
              reg58 <= (!reg45);
              reg59 <= $signed($unsigned($unsigned($unsigned((!reg58)))));
            end
          else
            begin
              reg58 <= ($signed((~^($signed(wire42) >= $signed(reg46)))) + (wire4 << reg44[(3'h5):(3'h4)]));
              reg59 <= $signed((~&{($signed((8'hac)) + {wire2, reg50}),
                  (!(wire0 >= wire3))}));
            end
          reg60 <= ({reg54} <<< reg46[(4'h9):(3'h7)]);
          reg61 <= {reg53};
        end
      if ((({(&{(8'h9e),
              (8'hb1)})} >>> (|$unsigned(reg45[(3'h5):(3'h5)]))) <= $unsigned(($signed(((8'ha7) ~^ wire4)) ?
          (^(^wire43)) : {reg54, reg61}))))
        begin
          reg62 <= reg47[(1'h1):(1'h0)];
          reg63 <= {((($unsigned(reg60) >>> (8'hb7)) ?
                      (reg55 ? (reg48 + reg49) : (reg47 <= reg48)) : reg55) ?
                  reg54 : $signed(reg45)),
              (-{(reg58 >> $unsigned((8'ha2)))})};
          reg64 <= ((reg52 ?
              ($signed((~reg44)) | (-reg58)) : $signed(((~^wire0) > $signed(reg55)))) >>> $signed($unsigned({reg51[(1'h1):(1'h1)],
              (wire4 != reg46)})));
          reg65 <= ($unsigned(reg64[(1'h1):(1'h1)]) ?
              reg59[(4'hd):(1'h1)] : $unsigned(reg47[(1'h0):(1'h0)]));
        end
      else
        begin
          reg62 <= reg58[(3'h4):(1'h1)];
          reg63 <= (((!(+(reg64 ? wire1 : reg64))) > ((wire42 ?
                  reg54[(3'h4):(2'h2)] : (~|wire40)) >> (^~reg64))) ?
              (&{(|(&reg58)), {{(8'ha1)}, (|(8'h9c))}}) : ((({reg50, reg51} ?
                      $unsigned((8'haf)) : $signed(wire0)) - (reg48 - wire0)) ?
                  reg55 : {reg46}));
          reg64 <= {((wire43 ?
                  $signed($unsigned((8'hb1))) : (((8'ha6) ? reg62 : reg50) ?
                      (!reg55) : (reg44 ? wire42 : wire1))) >>> ((8'hb2) ?
                  ($signed(reg63) ~^ (^reg49)) : reg61[(3'h6):(2'h2)])),
              reg51[(1'h1):(1'h1)]};
          reg65 <= wire3;
        end
    end
  assign wire66 = $unsigned(reg48[(3'h6):(2'h3)]);
  assign wire67 = $signed($unsigned($signed($signed((reg59 ?
                      (8'ha9) : reg61)))));
  module68 #() modinst148 (.y(wire147), .wire71(reg47), .wire72(reg49), .wire70(wire67), .clk(clk), .wire69(reg54));
  always
    @(posedge clk) begin
      reg149 <= (wire1 ?
          $unsigned((8'h9d)) : (wire40[(1'h0):(1'h0)] ?
              {(&$signed(reg56))} : reg50[(3'h4):(3'h4)]));
      reg150 <= ((|$unsigned((wire147[(4'h8):(3'h5)] == (reg50 ?
          reg57 : reg53)))) <<< {reg44});
      if (reg62[(2'h2):(2'h2)])
        begin
          reg151 <= reg50[(3'h6):(3'h4)];
        end
      else
        begin
          reg151 <= $unsigned((reg53[(4'h8):(3'h6)] && ($signed(reg48[(2'h2):(1'h1)]) * reg63[(3'h6):(1'h0)])));
          reg152 <= $unsigned((reg50 ?
              $unsigned(reg45) : (reg47 == $signed((~^wire0)))));
          if ($signed($unsigned({$signed((8'hac))})))
            begin
              reg153 <= $signed((reg54[(3'h4):(1'h1)] | (~&$signed((~&reg44)))));
            end
          else
            begin
              reg153 <= $unsigned($signed($unsigned($unsigned((wire3 ~^ reg59)))));
              reg154 <= $unsigned({$unsigned(reg151)});
            end
          reg155 <= $unsigned($signed((reg58 ?
              (-(reg56 >= reg55)) : $unsigned((reg55 ? wire42 : (8'hbe))))));
          if (((({$unsigned(wire147)} != (reg49 ?
                  {reg155, reg59} : (wire67 ?
                      reg65 : reg45))) ^~ (&reg149[(4'hf):(2'h3)])) ?
              ($signed(reg51) * $signed(reg47)) : (+wire1[(2'h3):(2'h3)])))
            begin
              reg156 <= ((reg60[(3'h4):(1'h1)] ?
                  $unsigned((|(reg46 && reg150))) : $signed($signed($signed(reg51)))) >> $signed(({(reg61 ?
                      reg58 : wire0),
                  wire66[(3'h5):(2'h3)]} ~^ reg155)));
              reg157 <= (~|$signed(reg153[(2'h2):(1'h1)]));
              reg158 <= $unsigned(wire43);
              reg159 <= wire1;
            end
          else
            begin
              reg156 <= ((!reg151) ?
                  $unsigned((~|$signed(reg50))) : $signed(reg47[(1'h0):(1'h0)]));
              reg157 <= ((~(reg53 <<< reg56)) ^ {(reg158[(4'ha):(3'h5)] && reg52),
                  wire4[(4'he):(4'h9)]});
              reg158 <= ($unsigned($unsigned((~|(~|(8'ha5))))) ?
                  ($signed($unsigned({wire147})) ? reg152 : (&reg57)) : reg60);
              reg159 <= reg52[(1'h1):(1'h0)];
            end
        end
      reg160 <= $unsigned(reg44[(4'he):(4'h9)]);
    end
  assign wire161 = {$signed($signed(reg52[(2'h2):(2'h2)]))};
endmodule

module module68
#(parameter param146 = (((8'hac) * (&(^((8'hbb) - (8'ha4))))) ? (((~&{(7'h44)}) ? (((8'ha9) ? (8'haa) : (8'ha5)) >= (~^(7'h43))) : {((8'hb1) - (8'hb8)), (^(8'hb4))}) ? (^{(!(8'hb3))}) : ((((7'h41) ? (8'h9d) : (8'ha3)) ? (~(8'h9c)) : (^(8'ha1))) ^~ (!(|(8'ha7))))) : (^~((((8'ha5) - (8'ha3)) & (8'ha6)) != (^~{(8'hb3)})))))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h29e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire72;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire145;
  wire signed [(3'h7):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  assign y = {wire145,
                 wire143,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire101,
                 wire100,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg128,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg73 <= (8'ha2);
      if (((~&(reg73 ~^ ((wire71 >= wire72) ?
          wire71[(4'h9):(3'h4)] : wire71))) >= wire70[(5'h10):(4'he)]))
        begin
          reg74 <= $unsigned((&(~&(|(reg73 ? wire69 : wire72)))));
          if ((&$unsigned(wire69[(3'h6):(3'h4)])))
            begin
              reg75 <= (wire70[(4'hf):(1'h1)] ?
                  (^~wire69) : ((wire69 ?
                          {(wire70 - wire69), $signed(reg73)} : wire69) ?
                      $unsigned(reg73) : wire70));
              reg76 <= wire70;
              reg77 <= wire69[(3'h4):(2'h2)];
              reg78 <= (reg76 ? reg73 : (~$signed(reg76)));
            end
          else
            begin
              reg75 <= {$unsigned((-((reg73 ? reg76 : reg75) ?
                      reg76[(2'h2):(1'h0)] : {reg76}))),
                  reg76[(1'h0):(1'h0)]};
              reg76 <= (8'hb7);
              reg77 <= (-reg77[(4'ha):(3'h4)]);
              reg78 <= (-reg76[(3'h6):(1'h1)]);
            end
          reg79 <= wire72[(4'ha):(3'h4)];
          reg80 <= (8'ha5);
        end
      else
        begin
          reg74 <= {wire70[(1'h1):(1'h0)]};
        end
      if (reg75[(2'h2):(2'h2)])
        begin
          if (($unsigned((((~|reg80) ^~ reg77) + wire69[(4'hb):(3'h7)])) > wire70))
            begin
              reg81 <= $unsigned((~^$unsigned((&((8'haa) ? (8'haa) : reg80)))));
            end
          else
            begin
              reg81 <= ((($signed($unsigned(reg77)) | ((reg75 >= reg75) ?
                          $unsigned((7'h40)) : $signed(wire69))) ?
                      reg77 : $signed(reg74)) ?
                  ((~^({(7'h42)} >= $signed((8'hbd)))) ?
                      $signed(reg74) : (($signed(wire70) <= reg81[(2'h2):(1'h1)]) ^~ reg73)) : $unsigned(reg73[(1'h0):(1'h0)]));
            end
          reg82 <= {(wire69[(4'he):(1'h1)] ?
                  ({(reg77 ? wire72 : (8'hbc)),
                      $unsigned((8'hbc))} >>> ((reg77 ? reg76 : reg79) ?
                      {reg74, (8'ha1)} : (reg77 ?
                          wire72 : (7'h40)))) : (reg78[(4'ha):(4'h9)] + (reg77[(4'ha):(3'h6)] && (reg78 ?
                      wire69 : wire70))))};
          if ($signed($unsigned(reg75)))
            begin
              reg83 <= ($signed($signed(((+reg77) ? (|reg78) : reg77))) ?
                  ((~^reg74[(1'h1):(1'h0)]) ?
                      (reg79 >= {$unsigned((7'h44)),
                          wire72[(4'hd):(3'h4)]}) : reg81[(5'h12):(4'h8)]) : wire69);
              reg84 <= ((^~reg79[(2'h2):(1'h1)]) & ((|reg73) | reg81[(4'hd):(3'h6)]));
              reg85 <= reg81[(2'h3):(2'h2)];
              reg86 <= $signed({($unsigned((reg79 != reg83)) ^ $signed($unsigned(reg75)))});
            end
          else
            begin
              reg83 <= reg76;
              reg84 <= $signed(({reg85} | reg77));
              reg85 <= wire72[(5'h12):(4'hf)];
              reg86 <= ($signed(wire70[(4'hd):(1'h0)]) ?
                  ($signed(reg86) | reg78[(4'he):(1'h0)]) : reg82);
            end
          reg87 <= {reg77[(4'ha):(3'h4)]};
        end
      else
        begin
          reg81 <= $unsigned(wire72);
          reg82 <= ({$unsigned(wire71[(3'h7):(2'h2)]),
                  (reg77[(4'hb):(4'ha)] <<< $signed((reg73 ?
                      wire69 : (8'hbd))))} ?
              wire69[(3'h5):(2'h3)] : (^reg76[(1'h1):(1'h1)]));
        end
      if ($signed($signed((((+reg79) ?
              $unsigned(reg86) : wire69[(3'h6):(3'h6)]) ?
          $signed($signed(reg77)) : $signed(reg82)))))
        begin
          reg88 <= (wire70 ? reg85[(4'hc):(4'hb)] : $signed(wire72));
          reg89 <= (($signed((((8'hb6) ? (8'had) : wire70) ?
                  $signed(wire69) : (reg80 ? reg87 : reg73))) ?
              (&reg76) : reg86) & ((|($unsigned(reg73) - $unsigned(reg79))) * wire69));
        end
      else
        begin
          reg88 <= reg74;
          reg89 <= (-$unsigned($signed(((reg76 ? (8'hb3) : reg84) ~^ (wire71 ?
              reg73 : reg81)))));
          reg90 <= wire72[(3'h4):(3'h4)];
        end
    end
  always
    @(posedge clk) begin
      reg91 <= (~&(8'ha9));
      if (reg85)
        begin
          reg92 <= reg88[(1'h0):(1'h0)];
          reg93 <= {(~^$unsigned(reg73))};
          reg94 <= (reg74[(4'hb):(4'h9)] && {(reg89[(1'h0):(1'h0)] > {reg77,
                  (reg84 ? reg83 : wire71)}),
              $signed(reg92)});
          if ((wire72[(3'h5):(3'h5)] ?
              {($signed(reg85[(4'h9):(2'h3)]) + ((~(8'hbf)) != {wire70,
                      (7'h43)})),
                  reg87[(1'h0):(1'h0)]} : wire69))
            begin
              reg95 <= reg81[(1'h0):(1'h0)];
            end
          else
            begin
              reg95 <= $unsigned($signed((8'h9e)));
              reg96 <= $signed($signed(reg92));
              reg97 <= (^~$unsigned((&$signed((reg90 ? wire72 : reg74)))));
            end
        end
      else
        begin
          reg92 <= reg93[(1'h0):(1'h0)];
        end
      if (reg75)
        begin
          reg98 <= reg82;
        end
      else
        begin
          reg98 <= reg88[(2'h3):(1'h0)];
        end
      reg99 <= reg98[(2'h2):(1'h0)];
    end
  assign wire100 = $unsigned($signed(($unsigned(((8'hb6) ? reg89 : reg75)) ?
                       {$unsigned(reg74),
                           reg87[(2'h3):(1'h1)]} : (|(+reg80)))));
  assign wire101 = ((&(~(~^(reg99 << (8'hae))))) << reg73[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      if ($signed(((&($signed(reg90) ^~ $unsigned(reg99))) ?
          reg73[(3'h7):(3'h5)] : reg78)))
        begin
          reg102 <= ((7'h43) + {reg88,
              $unsigned(($unsigned(reg78) ?
                  $signed(reg98) : $signed(wire71)))});
          reg103 <= wire100;
          if (wire101[(4'ha):(3'h6)])
            begin
              reg104 <= reg103;
              reg105 <= {$signed(reg88[(2'h3):(2'h3)])};
              reg106 <= $unsigned(($signed(reg92[(3'h7):(2'h2)]) * ($unsigned(reg80) || ((reg85 ?
                  reg73 : reg78) != (&(8'ha1))))));
            end
          else
            begin
              reg104 <= $signed((reg99[(2'h2):(1'h1)] ?
                  (((^reg106) ?
                      (+reg106) : (!reg79)) | {(reg88 | reg93)}) : $unsigned((~wire71))));
              reg105 <= reg86[(4'hc):(4'hb)];
            end
          reg107 <= $unsigned($unsigned((&$unsigned((+(8'hb8))))));
          reg108 <= {{(!$signed({(8'hb8), wire101}))},
              $unsigned((reg84[(4'h9):(3'h7)] + ((reg98 ?
                  reg99 : reg86) >= reg98[(2'h3):(1'h0)])))};
        end
      else
        begin
          if (reg73[(1'h0):(1'h0)])
            begin
              reg102 <= $signed($unsigned((~|$unsigned({reg98, wire100}))));
            end
          else
            begin
              reg102 <= ($signed(wire71[(5'h11):(3'h4)]) * (reg82[(1'h1):(1'h0)] ?
                  ($unsigned({reg92, reg99}) && {{reg76},
                      (reg96 ? wire69 : reg96)}) : reg94));
            end
          if (({$signed($signed($unsigned(reg81))),
                  ((&reg102) ? $unsigned($unsigned(reg75)) : wire70)} ?
              (&$signed((|$unsigned((8'hbe))))) : (8'h9c)))
            begin
              reg103 <= {($unsigned((8'hbe)) & (((reg78 && reg73) ?
                          reg95[(1'h1):(1'h0)] : wire72[(5'h11):(4'hf)]) ?
                      $unsigned($signed(reg99)) : ({reg102, reg106} ?
                          (8'ha1) : (!reg83)))),
                  $signed(reg107[(4'hf):(4'hf)])};
              reg104 <= reg77;
              reg105 <= (reg79[(4'hb):(4'h8)] ?
                  {{(-(~|reg89))},
                      reg106[(2'h3):(2'h2)]} : ((|$signed($signed(reg108))) == reg74));
            end
          else
            begin
              reg103 <= (reg103 == ($unsigned({(reg94 <= reg82),
                  (reg87 ? (8'hab) : reg90)}) ~^ ($signed(reg106) ?
                  $unsigned($signed(reg90)) : $unsigned((reg90 >= wire71)))));
              reg104 <= (^reg97[(3'h6):(2'h2)]);
              reg105 <= $unsigned(reg84[(2'h2):(1'h0)]);
              reg106 <= {reg90[(4'h9):(3'h4)], (+$signed((!(reg92 && reg73))))};
              reg107 <= ((($unsigned(reg98[(2'h3):(1'h1)]) ~^ reg81) ~^ {wire71}) < reg75[(1'h1):(1'h1)]);
            end
          reg108 <= (reg80[(1'h0):(1'h0)] ?
              (wire100 ?
                  $signed(({reg105, reg90} ^~ (reg73 ?
                      reg106 : (8'hae)))) : $signed(reg108[(1'h0):(1'h0)])) : (8'hb0));
          if ($signed(reg91))
            begin
              reg109 <= reg91[(4'hb):(4'ha)];
              reg110 <= $unsigned(reg108[(3'h7):(3'h5)]);
              reg111 <= ({reg79} ?
                  (reg94 ^~ {reg78[(4'hb):(3'h6)],
                      ((reg87 ? (8'hb4) : reg90) != (reg110 ?
                          reg110 : reg98))}) : ($unsigned($unsigned((8'ha6))) ?
                      reg99[(3'h5):(2'h2)] : (^~(+(+(7'h41))))));
              reg112 <= reg94[(4'hb):(3'h6)];
              reg113 <= $signed($unsigned((~reg97[(1'h0):(1'h0)])));
            end
          else
            begin
              reg109 <= $unsigned((($signed((reg108 ?
                      wire70 : reg85)) >= $unsigned($signed(reg98))) ?
                  (reg112 ? reg98 : (^~$unsigned(reg81))) : reg108));
              reg110 <= (~&($signed(((reg112 ? reg98 : (8'had)) ?
                  reg73[(1'h0):(1'h0)] : (reg74 ?
                      reg87 : reg79))) ^~ (($unsigned(reg91) <<< (&reg83)) ?
                  $unsigned((reg89 ? reg89 : reg75)) : {reg76[(4'h8):(2'h3)],
                      $unsigned(wire70)})));
            end
        end
      if (wire72[(4'hf):(4'hd)])
        begin
          reg114 <= $unsigned(((+(reg104[(3'h4):(2'h2)] ?
                  (reg96 ? reg90 : reg88) : $signed(reg112))) ?
              ($unsigned($unsigned(reg84)) ?
                  ((reg108 ? reg106 : reg82) ?
                      (wire71 >> reg86) : {(8'ha8)}) : $unsigned(((8'hac) ?
                      reg88 : reg92))) : {(^~{reg102, (8'hae)})}));
          if (wire72[(1'h1):(1'h0)])
            begin
              reg115 <= reg108;
            end
          else
            begin
              reg115 <= (^~{$unsigned(($unsigned(reg104) * wire100)),
                  {(!((8'h9e) - reg86)), $unsigned((reg112 || reg74))}});
              reg116 <= (-(reg89 ?
                  reg88[(1'h1):(1'h0)] : (~|(reg77 << ((8'hb5) && (7'h44))))));
              reg117 <= reg111[(3'h7):(3'h5)];
              reg118 <= reg113[(1'h0):(1'h0)];
              reg119 <= {reg113[(2'h3):(2'h3)]};
            end
          reg120 <= $unsigned(reg73);
        end
      else
        begin
          reg114 <= wire72[(4'hc):(3'h6)];
        end
      reg121 <= $unsigned(($signed((~$signed(reg81))) * {$unsigned($signed(reg88))}));
      reg122 <= (reg91 <<< ($unsigned($signed({wire72,
          wire100})) == (((~|reg78) && reg108[(1'h0):(1'h0)]) ?
          $unsigned(reg87[(2'h2):(2'h2)]) : (8'haf))));
      reg123 <= $signed(reg107[(4'h9):(3'h5)]);
    end
  assign wire124 = reg109;
  assign wire125 = ((!(reg82[(2'h2):(2'h2)] ^~ $unsigned((reg106 & reg99)))) << (&$unsigned(((reg118 | wire101) <= {wire101}))));
  assign wire126 = $unsigned((+wire72[(5'h11):(5'h11)]));
  assign wire127 = (~^($signed(((reg92 <= reg73) ^ reg120)) ?
                       ((&reg75[(1'h1):(1'h0)]) ^ $signed((|reg105))) : reg88[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg128 <= $unsigned({reg78[(5'h12):(4'hc)],
          $unsigned(($unsigned(wire101) - (reg97 ? reg82 : reg113)))});
    end
  assign wire129 = ((reg78 ? reg92 : $signed(($unsigned(wire125) ^ reg83))) ?
                       (($signed(reg98[(1'h0):(1'h0)]) >= $unsigned((reg122 ?
                               reg97 : reg76))) ?
                           reg96 : $signed((reg89 && (~|reg98)))) : wire72);
  assign wire130 = $signed((!(reg88[(1'h0):(1'h0)] ?
                       $unsigned({wire125, (8'ha7)}) : ({reg114,
                           wire72} > reg93[(2'h2):(1'h1)]))));
  assign wire131 = wire129[(4'hc):(2'h2)];
  module132 #() modinst144 (.wire135(reg112), .clk(clk), .y(wire143), .wire134(reg128), .wire136(reg104), .wire137(reg73), .wire133(reg110));
  assign wire145 = reg77[(3'h4):(1'h1)];
endmodule

module module5
#(parameter param38 = ((+(|{((7'h44) ? (8'ha9) : (8'ha0))})) * (((((8'hbf) ^ (8'hb4)) >= (+(8'ha6))) ? (-((8'ha3) & (8'hab))) : (~^((8'hb9) * (7'h40)))) ? (|(((8'hb0) < (8'h9f)) - ((8'hb1) == (7'h40)))) : ({((8'hb2) >> (8'hbf)), (~|(7'h44))} ? (((8'hb9) ? (8'hb8) : (8'ha7)) ? (8'had) : ((8'hbe) ? (8'hb9) : (8'hb6))) : ((~^(8'hbd)) ? (^~(8'hb1)) : ((8'hbe) ? (8'hb7) : (8'ha1)))))), 
parameter param39 = (&(~^(((param38 | param38) ~^ (!param38)) ? (param38 ~^ param38) : ((^~(7'h43)) ? (8'haa) : (!(8'hb3)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire32,
                 wire17,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 reg34,
                 reg33,
                 reg31,
                 reg30,
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
                 reg16,
                 reg15,
                 reg13,
                 (1'h0)};
  assign wire10 = $signed($unsigned((wire9 ?
                      ($signed((7'h41)) ?
                          wire8[(1'h1):(1'h1)] : (wire7 ~^ wire9)) : wire9[(1'h0):(1'h0)])));
  assign wire11 = ((+(($unsigned(wire9) < wire9[(1'h1):(1'h0)]) ?
                      (wire8 ?
                          (wire6 && wire8) : $unsigned((7'h40))) : ($signed(wire10) ?
                          (~wire8) : $signed(wire6)))) >= (+$signed((wire6[(3'h5):(2'h2)] >= $unsigned(wire8)))));
  assign wire12 = wire8;
  always
    @(posedge clk) begin
      reg13 <= $signed($signed((8'ha6)));
    end
  assign wire14 = ({({wire10} | ((~wire7) ?
                          reg13[(4'hb):(4'h9)] : ((8'had) ?
                              wire10 : (8'hb3))))} >> (wire10 - (wire11[(1'h0):(1'h0)] ?
                      (reg13 ? wire7 : {wire7}) : ({wire10} ?
                          {wire11, wire8} : $signed((8'hab))))));
  always
    @(posedge clk) begin
      reg15 <= ((|wire7[(2'h2):(1'h0)]) ?
          $unsigned((~^wire12[(3'h5):(3'h5)])) : ({{(wire6 ? (8'hb2) : wire8),
                  ((8'ha8) | wire12)}} >> ({wire9,
              $signed(wire10)} || (+reg13[(4'h8):(4'h8)]))));
      reg16 <= (({{wire8, (wire6 && reg15)},
                  $unsigned(((8'hb3) ? wire8 : (8'haa)))} ?
              (&wire10) : wire7) ?
          (wire6[(4'hb):(4'h8)] | $unsigned((~^(wire10 ?
              wire10 : reg13)))) : wire14);
    end
  assign wire17 = (wire11 << (~|$unsigned($signed($signed(wire8)))));
  always
    @(posedge clk) begin
      if (wire9[(2'h2):(1'h0)])
        begin
          reg18 <= wire17[(2'h2):(2'h2)];
          reg19 <= {($signed({wire17}) || (8'haa)),
              ($signed(reg18[(2'h3):(2'h3)]) ?
                  wire12 : ((wire10[(3'h4):(1'h1)] ?
                      (!(8'ha9)) : $signed(reg13)) || (^~wire6)))};
          if ({$unsigned($signed($unsigned((wire14 - reg16)))),
              $unsigned({($signed(reg19) - wire10),
                  $unsigned(((8'ha7) <= reg16))})})
            begin
              reg20 <= reg19[(5'h10):(3'h4)];
              reg21 <= (|$unsigned((+$signed((~|wire6)))));
              reg22 <= (7'h40);
            end
          else
            begin
              reg20 <= (|{$signed((^~(wire17 ? wire12 : (8'ha7)))),
                  ($unsigned($signed(reg20)) + reg22)});
              reg21 <= wire6;
              reg22 <= ((~|(8'ha2)) ? wire10[(4'h9):(1'h1)] : wire14);
            end
          reg23 <= ($unsigned($unsigned((reg13 < (~|wire11)))) ?
              wire12 : ((^~({reg13, wire14} ?
                  (~^(8'hb1)) : $signed(wire14))) <<< $signed($unsigned(reg18[(2'h2):(1'h1)]))));
          if (($signed(wire9[(3'h4):(3'h4)]) ?
              (~&$signed($signed((7'h44)))) : ((~^(!$unsigned(wire6))) >>> (^~(&$signed(wire11))))))
            begin
              reg24 <= $signed(reg20);
              reg25 <= wire17;
            end
          else
            begin
              reg24 <= ((^($unsigned((wire9 ? wire11 : reg18)) ?
                  {(wire14 && wire12)} : (|(reg22 > wire8)))) <<< $unsigned((~(|(wire7 >= wire17)))));
              reg25 <= reg21[(3'h4):(2'h2)];
              reg26 <= wire6;
            end
        end
      else
        begin
          reg18 <= (($signed($unsigned(reg24[(5'h11):(5'h11)])) || reg22[(4'hf):(4'he)]) ?
              reg13 : wire11[(1'h1):(1'h0)]);
          if ({reg20[(1'h0):(1'h0)]})
            begin
              reg19 <= (((({reg22} * reg18[(2'h3):(1'h0)]) == {$signed((8'h9d))}) < (({wire8} << ((8'ha4) >= (8'hb5))) ?
                  $unsigned((wire6 + reg16)) : (wire10[(3'h6):(1'h1)] >>> (reg20 * (8'hbc))))) < wire9);
              reg20 <= ($signed({{reg18[(4'h9):(3'h7)]}, (8'h9d)}) ?
                  reg23 : (|$unsigned((|(8'h9f)))));
              reg21 <= $signed(reg20[(1'h1):(1'h0)]);
              reg22 <= reg20;
            end
          else
            begin
              reg19 <= $signed({((~|wire8) ?
                      (reg18[(4'h8):(1'h0)] ? {reg19} : (~^reg21)) : {(!wire17),
                          (wire10 ? (8'h9d) : wire14)})});
              reg20 <= wire14[(3'h5):(3'h4)];
              reg21 <= $unsigned($unsigned($unsigned((8'ha5))));
              reg22 <= ($signed(reg20[(2'h2):(2'h2)]) - {(^($signed(reg15) || $signed(reg13))),
                  (wire14 << reg20[(2'h3):(2'h3)])});
              reg23 <= $unsigned(({((wire11 >= reg19) == reg22),
                  (^~(reg18 ? reg15 : wire17))} == reg13[(4'h8):(4'h8)]));
            end
          if (((((8'hac) ?
                  $unsigned((wire10 ? reg18 : wire11)) : reg21) | wire17) ?
              reg13[(4'ha):(2'h3)] : wire8))
            begin
              reg24 <= $signed(wire17[(3'h5):(1'h1)]);
              reg25 <= $unsigned($unsigned($unsigned($unsigned($signed(reg22)))));
            end
          else
            begin
              reg24 <= reg13;
              reg25 <= $signed((({(!reg19), $signed(reg26)} ?
                  reg23[(3'h4):(3'h4)] : reg13) << reg15[(4'ha):(2'h3)]));
              reg26 <= $signed((wire11 ?
                  (|reg15[(4'ha):(3'h6)]) : $signed($signed((~^(8'hb3))))));
              reg27 <= $signed($signed(reg22));
              reg28 <= $unsigned({({(^~reg16)} <= wire11)});
            end
          reg29 <= ((8'hbb) < reg23);
        end
      reg30 <= reg16[(4'ha):(3'h7)];
      reg31 <= (~^wire14);
    end
  assign wire32 = $unsigned(wire12[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg33 <= reg25;
      reg34 <= $unsigned($signed({reg13[(4'h8):(3'h4)],
          (^reg15[(4'ha):(3'h4)])}));
    end
  assign wire35 = {({reg21[(2'h3):(2'h3)], (+$unsigned(wire6))} ?
                          $signed(wire6[(3'h4):(2'h3)]) : (^~{(&reg34)})),
                      wire14};
  assign wire36 = ({$unsigned(reg21)} ?
                      (reg18 ?
                          (^wire6) : $signed($unsigned((!wire11)))) : wire6[(4'h9):(4'h8)]);
  assign wire37 = (&($signed(reg33) != $signed(((wire35 != wire17) <= (wire9 >>> wire8)))));
endmodule

module module132  (y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire137;
  input wire signed [(2'h2):(1'h0)] wire136;
  input wire [(4'hf):(1'h0)] wire135;
  input wire signed [(4'h8):(1'h0)] wire134;
  input wire signed [(4'ha):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(3'h5):(1'h0)] wire138;
  assign y = {wire142, wire141, wire140, wire139, wire138, (1'h0)};
  assign wire138 = wire135;
  assign wire139 = ($signed(wire133[(2'h3):(1'h0)]) != (~(^(!(7'h42)))));
  assign wire140 = (wire139[(4'h8):(1'h0)] ?
                       {$unsigned({wire133, wire134}),
                           (($signed((8'h9d)) ~^ $signed(wire135)) ?
                               $unsigned(((8'h9d) + (8'ha0))) : wire137)} : wire134[(1'h1):(1'h1)]);
  assign wire141 = ((wire138 ?
                       wire137[(4'h8):(4'h8)] : (~^((wire138 ?
                               wire135 : wire139) ?
                           wire138[(1'h0):(1'h0)] : $signed(wire139)))) <= wire137[(4'hb):(3'h6)]);
  assign wire142 = (wire137 | $signed($unsigned(((wire140 >> wire140) ?
                       (~^wire139) : wire134[(1'h0):(1'h0)]))));
endmodule
