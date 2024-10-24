module top
#(parameter param88 = (((^({(8'h9f)} ? (8'hb5) : ((8'hb8) ? (8'hb2) : (8'ha6)))) ? ((+((8'h9e) > (8'hbd))) ? (((8'hae) >= (8'ha9)) ? ((8'h9f) ? (8'h9c) : (8'hb8)) : ((8'hae) < (8'had))) : (-{(8'hb0)})) : ((|(~|(8'hbf))) ? (((8'ha1) || (8'ha9)) ? {(8'ha0)} : {(8'h9e), (8'h9e)}) : {((8'h9d) ? (8'ha2) : (7'h41))})) & {({((8'hbc) < (8'ha4)), (-(8'hb8))} ? (((8'hb7) ? (8'ha1) : (8'ha1)) ? ((8'hb0) & (8'ha8)) : (!(8'hb1))) : ((~(8'ha5)) * ((7'h43) ? (8'hb1) : (8'h9c))))}), 
parameter param89 = {(^(8'hbd)), {(-(((8'ha4) ? param88 : param88) ^ (~|param88))), ({(param88 != param88)} ? {(param88 ^~ param88), (param88 >>> (8'h9f))} : {(+param88), {param88, param88}})}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire65;
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire68,
                 wire67,
                 wire4,
                 wire65,
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
                 (1'h0)};
  assign wire4 = ((-$signed($signed((|wire1)))) + wire1);
  module5 #() modinst66 (wire65, clk, wire0, wire1, wire4, wire3, wire2);
  assign wire67 = wire2;
  assign wire68 = {wire0};
  always
    @(posedge clk) begin
      if (wire2[(4'he):(2'h2)])
        begin
          reg69 <= (&wire3[(3'h7):(3'h6)]);
          reg70 <= wire4;
          if (((wire4[(2'h3):(2'h3)] ?
              wire3 : {reg70[(2'h3):(2'h3)],
                  $unsigned(wire68[(2'h2):(1'h0)])}) || (($unsigned($unsigned(wire0)) | (!$signed(reg69))) ?
              ($signed($signed(wire68)) ?
                  reg69 : (wire3 ? $unsigned((8'hb1)) : (+wire65))) : wire3)))
            begin
              reg71 <= wire68;
              reg72 <= (&(+reg71[(4'h8):(3'h7)]));
              reg73 <= ($signed($unsigned((!(wire0 < wire68)))) != (($unsigned((+(8'h9d))) ?
                      $unsigned($signed(wire3)) : reg71[(3'h6):(3'h5)]) ?
                  $unsigned(wire0[(2'h3):(1'h0)]) : wire3));
              reg74 <= $unsigned(wire0);
            end
          else
            begin
              reg71 <= reg69[(1'h1):(1'h0)];
              reg72 <= (-$unsigned($signed($signed((~(8'hb4))))));
              reg73 <= (((8'hb0) ?
                  wire68 : (wire2 ?
                      $signed($signed(wire2)) : reg74[(2'h2):(2'h2)])) & $unsigned(((-(reg73 ^~ reg70)) && $unsigned((~|wire4)))));
              reg74 <= (($signed(($unsigned((7'h40)) ?
                      wire4[(4'h9):(2'h2)] : {(8'ha2),
                          reg72})) ~^ $signed((((8'hb3) ?
                      (8'hb2) : wire4) * (wire65 ? wire65 : wire2)))) ?
                  $signed({wire65[(3'h5):(3'h5)],
                      ((wire3 ? reg72 : (7'h41)) ?
                          (!reg74) : ((8'ha7) != wire2))}) : (~^($signed($signed(wire68)) < wire4[(3'h5):(2'h3)])));
              reg75 <= wire65;
            end
          reg76 <= (+($unsigned(((reg70 ? reg73 : wire3) <<< (reg73 ?
                  (7'h43) : wire4))) ?
              $signed(reg74[(2'h2):(1'h0)]) : wire2));
          reg77 <= reg75;
        end
      else
        begin
          reg69 <= (wire4 >> (!(|wire65[(3'h7):(3'h4)])));
          reg70 <= reg77[(4'he):(2'h3)];
          reg71 <= (($signed($signed({(8'hb9)})) ?
                  (8'hac) : $unsigned((+$signed(wire68)))) ?
              $unsigned(($unsigned((8'ha5)) ?
                  ($unsigned(reg76) <<< $unsigned(reg69)) : wire67)) : wire0);
          reg72 <= wire67[(1'h1):(1'h1)];
        end
      reg78 <= (~(-{$unsigned(wire65), (&{wire68, wire4})}));
      if ($signed({(~$signed(wire3))}))
        begin
          reg79 <= $signed($signed($unsigned(($signed(reg77) ?
              wire1 : {reg77}))));
        end
      else
        begin
          reg79 <= $unsigned(((8'haa) ^ $unsigned((&(wire65 - (8'hb8))))));
          reg80 <= wire1[(3'h6):(3'h5)];
          reg81 <= {(&((~|wire0) - (8'hac))),
              {{$signed(wire0), (+(reg69 | reg76))},
                  (~((reg75 ? (8'h9c) : wire2) >> (8'hb6)))}};
        end
      reg82 <= reg80[(3'h6):(3'h4)];
    end
  assign wire83 = wire68;
  assign wire84 = (wire65[(2'h2):(2'h2)] ?
                      $signed((reg70[(3'h6):(3'h5)] >> ((wire65 ?
                              wire65 : wire83) ?
                          $signed(reg80) : $signed((8'ha0))))) : (($signed($signed(reg80)) ?
                          ((wire67 ? wire4 : reg79) ?
                              {reg81} : (|wire83)) : $unsigned((reg80 ?
                              wire67 : (8'ha1)))) ^~ $signed(({reg71, reg69} ?
                          $signed(reg75) : $unsigned(wire2)))));
  assign wire85 = $unsigned({(($signed(reg74) ^ reg82) || $unsigned(((8'hbf) ?
                          wire4 : reg70))),
                      $signed(reg77)});
  assign wire86 = reg74;
  assign wire87 = $signed($unsigned((!((reg70 ? reg75 : reg79) ?
                      reg75[(2'h2):(1'h0)] : {wire2, wire1}))));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h1b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire60;
  assign y = {wire64, wire63, wire62, wire60, (1'h0)};
  module11 #() modinst61 (.clk(clk), .wire12(wire6), .wire14(wire10), .wire15(wire7), .y(wire60), .wire16(wire8), .wire13(wire9));
  assign wire62 = ($unsigned((&$unsigned((wire8 && wire9)))) | ($unsigned({(!(8'ha2))}) ?
                      (+(wire10 ?
                          $signed(wire8) : wire10)) : $signed(($unsigned(wire9) ~^ wire6[(3'h4):(1'h1)]))));
  assign wire63 = wire9[(4'h9):(4'h9)];
  assign wire64 = $unsigned($signed($signed(wire63[(3'h5):(1'h1)])));
endmodule

module module11
#(parameter param58 = ((((^(~^(7'h43))) ^ ({(8'hbc)} ? (+(8'h9d)) : ((8'hae) > (7'h43)))) <= (&(|(!(8'ha7))))) ? ((^(^~{(8'hac)})) ? {(((8'hac) < (8'hac)) ^ ((8'ha3) ? (8'hac) : (7'h43))), (((8'haa) ? (8'hb1) : (8'ha6)) ? ((7'h42) ~^ (8'h9d)) : ((8'hb5) | (7'h41)))} : ((^((8'ha4) && (8'hab))) ? {(~&(7'h40))} : {(!(7'h43))})) : (+(((8'ha4) & (!(8'hba))) >= (^{(8'ha5), (8'hac)})))), 
parameter param59 = {{param58, {param58, ((param58 != (8'ha4)) <= (param58 == param58))}}, {(({param58, param58} == {param58, param58}) < (param58 ? (param58 ? param58 : param58) : (~|param58))), (param58 ? {(param58 | param58)} : ((+param58) ? (|param58) : param58))}})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire17;
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire17,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
  assign wire17 = ($signed(wire14[(1'h0):(1'h0)]) ?
                      (-wire12) : $signed($signed(({wire15,
                          wire13} ~^ (wire14 << (8'hbd))))));
  always
    @(posedge clk) begin
      reg18 <= wire14[(3'h6):(3'h5)];
      reg19 <= $unsigned($signed({reg18}));
    end
  always
    @(posedge clk) begin
      if (wire13)
        begin
          if ((^$unsigned(({(wire13 ? (7'h43) : (7'h44)),
                  (wire13 ? wire14 : wire16)} ?
              ($signed(wire12) - (wire15 ? wire12 : wire16)) : {(~|reg18)}))))
            begin
              reg20 <= wire16;
              reg21 <= wire12[(1'h0):(1'h0)];
              reg22 <= reg19[(4'hc):(3'h6)];
              reg23 <= (~^($unsigned(((-reg19) ~^ $signed(wire13))) ?
                  (|((wire15 ? wire13 : (8'ha2)) ?
                      $signed(reg19) : (wire16 ?
                          reg18 : wire12))) : (reg19[(5'h14):(4'hf)] ?
                      $signed($signed((8'hbf))) : (~$unsigned(wire13)))));
              reg24 <= reg21[(3'h5):(3'h4)];
            end
          else
            begin
              reg20 <= {(!$signed({(|reg23), $signed(wire16)}))};
              reg21 <= $unsigned((~&((~(~&wire12)) ?
                  $unsigned($unsigned(reg20)) : $signed((~&wire14)))));
            end
          reg25 <= wire14[(4'h8):(2'h3)];
          reg26 <= wire14;
          reg27 <= wire17[(4'h8):(3'h4)];
          reg28 <= $signed($unsigned((wire14 ?
              (reg21 >>> {reg24}) : $signed(wire13[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg20 <= ((wire16 < wire17) || $signed(wire12));
          reg21 <= $unsigned((~wire13));
        end
    end
  assign wire29 = wire13[(2'h2):(1'h1)];
  assign wire30 = wire15[(2'h3):(2'h2)];
  assign wire31 = (^$signed(wire14[(1'h0):(1'h0)]));
  assign wire32 = $unsigned((~&(reg22[(1'h1):(1'h1)] <= $unsigned(reg22[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      if (reg18)
        begin
          reg33 <= (wire30 ^~ $unsigned((wire30 ?
              ((reg28 ?
                  (8'ha6) : wire14) ^ wire29[(1'h0):(1'h0)]) : $signed((~^(8'hab))))));
          reg34 <= $unsigned(reg19);
          reg35 <= wire13[(3'h4):(1'h0)];
        end
      else
        begin
          if ((~(~&$unsigned((-reg33)))))
            begin
              reg33 <= {$unsigned(reg33), (^~((~{wire16}) <<< wire13))};
              reg34 <= ((wire14 ?
                  $signed(((wire15 ^ (8'h9e)) ?
                      $signed(reg26) : (reg22 + wire32))) : ($signed((reg33 | wire17)) ?
                      ($signed((8'hba)) && wire12) : $signed({reg35}))) && ((|(^~$signed(wire12))) > $signed(((8'hbd) ?
                  reg33[(1'h1):(1'h1)] : $signed(reg34)))));
              reg35 <= $unsigned(reg19);
              reg36 <= reg20[(4'h9):(4'h8)];
            end
          else
            begin
              reg33 <= wire30;
              reg34 <= wire15[(3'h4):(2'h3)];
              reg35 <= wire31[(1'h0):(1'h0)];
              reg36 <= (^(~$signed(((reg35 ? wire29 : reg25) ?
                  $signed((8'hbf)) : wire14))));
            end
          reg37 <= (&{$unsigned($signed($signed(wire15))),
              (({reg24} + (~^(8'hbf))) ?
                  $signed(reg25[(4'h9):(4'h9)]) : $unsigned((reg36 - wire14)))});
          if ((8'hbf))
            begin
              reg38 <= reg36[(4'hb):(2'h3)];
              reg39 <= ($signed($signed((8'hb3))) << $signed($unsigned(($signed((8'hb2)) ?
                  $unsigned((8'ha0)) : $signed(reg19)))));
            end
          else
            begin
              reg38 <= reg18;
              reg39 <= $signed(wire30[(2'h3):(1'h1)]);
            end
          reg40 <= ((8'hae) <<< {(&reg33),
              ($signed($unsigned((8'ha7))) ? (8'hac) : reg20)});
          reg41 <= (!$signed((((wire30 ? reg21 : reg39) <<< (^~reg22)) ?
              wire17[(4'hc):(3'h6)] : {reg40})));
        end
      if ($unsigned(((({reg38, wire14} ?
              $unsigned(reg39) : $signed(wire13)) >= $signed(((8'hbe) && reg20))) ?
          $unsigned(((8'ha4) & wire15[(1'h1):(1'h0)])) : ($signed($unsigned(reg33)) ?
              $unsigned(wire17[(5'h10):(4'hb)]) : $unsigned((&reg40))))))
        begin
          reg42 <= reg26[(3'h7):(3'h4)];
          reg43 <= ($signed(reg37) ?
              (!$signed((&(reg36 * (8'ha1))))) : (reg36 ?
                  reg21[(3'h5):(1'h1)] : wire12));
          reg44 <= $unsigned((~&wire29));
          reg45 <= (^reg38[(2'h3):(2'h2)]);
        end
      else
        begin
          reg42 <= $signed(({wire17[(4'hf):(4'hf)], (8'ha5)} | reg21));
          if (reg40[(2'h3):(2'h2)])
            begin
              reg43 <= wire32[(3'h7):(3'h6)];
            end
          else
            begin
              reg43 <= (-$signed((($signed(reg40) - $signed((8'h9c))) >= $unsigned((|wire30)))));
              reg44 <= (~&(~|$unsigned(($signed(wire30) ?
                  (reg24 ? wire31 : reg19) : (wire29 && wire17)))));
              reg45 <= reg36[(2'h3):(1'h1)];
              reg46 <= ($unsigned(reg22[(1'h0):(1'h0)]) >> {$signed(reg23)});
            end
          reg47 <= (-$signed(($unsigned({reg41, wire17}) <= (8'h9f))));
          reg48 <= ($unsigned((~&((reg33 - reg39) ?
              (wire29 | wire16) : wire32[(3'h4):(1'h0)]))) ^~ (8'h9d));
          reg49 <= $signed((~|$signed(wire31[(1'h0):(1'h0)])));
        end
      if (reg44[(3'h6):(1'h1)])
        begin
          reg50 <= (reg23 ^ ($signed(((reg46 == reg18) ?
                  reg20[(4'hb):(4'h9)] : (-reg39))) ?
              $unsigned(((reg18 ? reg41 : wire29) ?
                  reg36 : $signed(wire15))) : (~|{reg25[(3'h7):(3'h7)]})));
          reg51 <= $signed((~(~^$unsigned((reg33 < (7'h44))))));
          reg52 <= ((-(($signed(reg51) | (reg38 & (8'haf))) ?
                  $signed($unsigned(reg49)) : reg22)) ?
              ((~^reg44) >= ((-(reg41 ?
                  (8'hac) : reg49)) * (~|(reg20 >>> (8'hae))))) : (+$unsigned((reg20[(3'h5):(1'h1)] ?
                  reg24[(2'h3):(1'h1)] : (!reg42)))));
          reg53 <= reg18;
          reg54 <= (((reg38[(1'h1):(1'h0)] >> ((reg46 || reg36) ?
                  $signed(reg44) : (^reg34))) != reg41[(3'h5):(1'h0)]) ?
              (~|reg44) : ({{(reg39 ? reg46 : reg26), (+wire16)},
                  ((8'hb1) ?
                      (reg48 ?
                          (8'hba) : reg28) : $unsigned(wire13))} > reg43[(3'h4):(1'h0)]));
        end
      else
        begin
          reg50 <= reg21;
          reg51 <= reg37;
          if ((~^(^~(reg33[(3'h7):(2'h3)] ^~ $unsigned($unsigned(reg38))))))
            begin
              reg52 <= reg48;
              reg53 <= wire29[(4'ha):(4'ha)];
              reg54 <= ((reg27 || reg24) >>> ($signed(($unsigned(reg28) <= {reg21})) ?
                  (&$unsigned($signed(reg39))) : $signed(wire15[(4'hd):(1'h1)])));
            end
          else
            begin
              reg52 <= (~|$signed($signed($unsigned((|reg54)))));
              reg53 <= $unsigned($unsigned(reg20));
              reg54 <= reg20;
              reg55 <= $unsigned((^~$unsigned($unsigned($signed(wire31)))));
              reg56 <= ((|reg25[(4'ha):(4'h9)]) ?
                  (reg55 ?
                      $signed(($unsigned(reg34) ?
                          $signed(reg23) : wire13)) : $signed(((reg35 ?
                              reg36 : reg54) ?
                          $unsigned(reg41) : (8'ha7)))) : (&($unsigned((-reg52)) ?
                      reg20 : reg53)));
            end
        end
      reg57 <= {{$signed(reg53)}};
    end
endmodule
