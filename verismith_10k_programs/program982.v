module top
#(parameter param102 = {(((^~((8'hb3) ? (8'hb0) : (8'h9f))) ? (((8'ha7) ? (8'hae) : (8'hbd)) >>> ((8'hbb) == (8'hb0))) : (-((8'hbc) ? (8'haf) : (8'hb1)))) != (((~(8'ha1)) * ((8'h9d) ? (8'ha1) : (7'h43))) ? ((^~(8'h9f)) <<< ((8'hb0) ? (8'had) : (8'h9f))) : ({(8'h9c), (8'hbc)} ^~ {(7'h40)}))), ((((~^(8'hb1)) <<< ((8'haa) ? (8'hb1) : (8'hbe))) <<< (8'ha0)) > {(((8'h9e) << (8'hbc)) ? {(7'h43), (8'ha1)} : {(8'hb0)})})}, 
parameter param103 = ((((|(param102 > param102)) ? (8'had) : ((|param102) != (^~param102))) >> ({(param102 >>> param102)} ? (-(~&param102)) : (-((8'h9c) * param102)))) >= {(!((param102 ^~ (8'hb7)) - param102))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire100, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire0[(1'h1):(1'h0)];
  assign wire6 = wire2[(3'h6):(3'h6)];
  assign wire7 = ((~&$unsigned((+wire0[(1'h1):(1'h1)]))) ?
                     ($unsigned(wire0) ?
                         wire2[(3'h6):(2'h3)] : $unsigned($signed(((8'ha7) >> wire6)))) : (wire3 ?
                         $unsigned((((8'ha4) ?
                             wire0 : wire4) << wire6[(3'h4):(1'h0)])) : $signed($unsigned($unsigned(wire6)))));
  assign wire8 = (((wire2 ^ (wire5 && {wire4})) ?
                     (~wire4[(3'h4):(2'h2)]) : ({$signed((7'h44)),
                             $unsigned(wire1)} ?
                         (wire5[(2'h3):(2'h3)] ?
                             (wire4 == wire6) : wire5) : wire1[(3'h5):(2'h3)])) * (~(8'ha2)));
  assign wire9 = $signed($signed(((^~(wire5 | wire8)) ?
                     $signed($unsigned((8'ha0))) : ((wire0 | wire4) ?
                         $unsigned((8'ha9)) : wire4))));
  module10 #() modinst101 (wire100, clk, wire7, wire8, wire2, wire1);
endmodule

module module10
#(parameter param98 = (~|((!({(8'hb7), (8'hb7)} ? ((8'hb6) ? (8'haf) : (8'hb9)) : ((8'hbc) <<< (8'hb5)))) ? (((!(8'had)) * ((8'hb6) >= (8'ha7))) ? {((8'hb5) ? (8'ha9) : (8'had)), ((7'h40) ? (8'ha6) : (8'hba))} : ((-(8'hae)) ? (8'ha1) : ((8'hab) <= (8'haa)))) : ((8'ha3) ? (~&((8'h9e) && (8'hb3))) : ((!(8'ha2)) ? (|(8'hae)) : ((8'hb0) ? (8'ha8) : (8'hbc)))))), 
parameter param99 = (^((8'h9e) >> ((~(8'hbd)) >>> (!(param98 ? param98 : param98))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h3eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire73,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire29,
                 wire28,
                 wire27,
                 reg93,
                 reg92,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire13[(1'h0):(1'h0)] >>> ({($unsigned((8'hbe)) - $unsigned(wire11))} >= wire13[(3'h5):(1'h0)])))
        begin
          if (wire13[(3'h7):(3'h6)])
            begin
              reg15 <= ($unsigned((~|(8'hbc))) ?
                  wire13[(3'h5):(2'h2)] : wire14[(4'hc):(2'h3)]);
              reg16 <= ($unsigned((|$signed($signed(wire11)))) != (($signed($signed(wire12)) ?
                  {wire13} : {$signed(wire11)}) ^ $signed(wire14)));
            end
          else
            begin
              reg15 <= reg15[(4'h9):(1'h1)];
            end
          reg17 <= (|(-reg16));
          reg18 <= $signed(wire12[(3'h6):(2'h2)]);
        end
      else
        begin
          reg15 <= (8'ha8);
          if ((^({(^(reg18 + reg17)),
                  ((reg17 ? reg15 : wire14) ?
                      {reg16, (7'h40)} : (reg16 ? wire11 : (8'hbe)))} ?
              (((8'hb0) ?
                  ((8'ha6) ?
                      wire11 : wire13) : wire14[(2'h3):(2'h2)]) & $unsigned($signed(reg18))) : {$unsigned($signed(reg16))})))
            begin
              reg16 <= reg17[(5'h11):(2'h2)];
              reg17 <= reg15;
              reg18 <= (&(!wire12[(1'h1):(1'h0)]));
              reg19 <= $signed(((($unsigned(wire12) ?
                      (wire14 && wire12) : $unsigned(reg15)) ?
                  $signed(((8'ha5) ? reg18 : wire12)) : ((reg15 ~^ wire11) ?
                      wire11 : ((7'h40) != reg16))) != wire14));
            end
          else
            begin
              reg16 <= ((~^(8'h9c)) + ($signed($unsigned($signed(reg18))) ?
                  (~&wire14) : (((reg16 >= wire14) ^ $unsigned(reg16)) - $signed(reg17[(1'h1):(1'h1)]))));
              reg17 <= ($signed((!reg16)) * reg16[(3'h4):(2'h3)]);
              reg18 <= $unsigned((^$signed(wire11)));
              reg19 <= ($signed((reg15 ?
                  $unsigned($signed(reg17)) : ((reg17 || wire12) >> reg15[(2'h3):(2'h2)]))) >>> ($unsigned($signed(reg19[(3'h7):(3'h7)])) ?
                  wire14[(2'h2):(2'h2)] : {(~|$signed((7'h41))),
                      ((^~reg19) ? (reg19 ? reg19 : (8'ha1)) : (~|wire14))}));
            end
          reg20 <= ((((wire12[(2'h2):(2'h2)] ? {wire13} : (~wire12)) ~^ reg17) ?
              $signed(($unsigned((8'hac)) ?
                  {reg16} : (7'h42))) : {{(+reg16)}}) < ($unsigned($signed((!reg18))) ?
              $signed((!reg16[(4'hf):(1'h0)])) : $unsigned(wire14[(3'h6):(3'h4)])));
          if ((+(~^reg18)))
            begin
              reg21 <= wire11;
              reg22 <= $unsigned(reg15[(2'h2):(1'h1)]);
              reg23 <= reg22[(1'h1):(1'h1)];
            end
          else
            begin
              reg21 <= $signed($unsigned({$unsigned(((8'hb7) ?
                      reg17 : reg19))}));
              reg22 <= (~^(~|$signed({((8'ha6) ? wire12 : wire12)})));
              reg23 <= $unsigned(reg22);
            end
        end
      reg24 <= reg20;
      if ($signed((reg22 > (-((wire12 & reg20) < (wire11 ? reg19 : reg24))))))
        begin
          reg25 <= ((((-(reg20 << (8'hab))) ?
                  (^~{reg21, reg24}) : {$unsigned(reg15),
                      (~wire13)}) <<< wire11) ?
              $signed({reg22}) : (reg24 >>> reg23[(4'ha):(1'h0)]));
        end
      else
        begin
          reg25 <= ((+$unsigned((reg17[(3'h6):(1'h1)] ?
                  (~|reg20) : {reg19, reg23}))) ?
              {(($unsigned(reg21) ? {reg17, wire12} : $signed(wire14)) ?
                      $signed(reg23[(1'h0):(1'h0)]) : ({wire12, reg25} ?
                          reg16 : $unsigned(reg22))),
                  wire11[(4'h9):(3'h5)]} : $unsigned({($unsigned(reg21) ?
                      $signed(reg19) : reg21),
                  wire12[(2'h3):(2'h3)]}));
          reg26 <= ({(reg15[(2'h2):(2'h2)] < $unsigned(reg17[(3'h4):(2'h3)]))} ^ $unsigned($unsigned(((~^reg21) ?
              reg16[(3'h7):(1'h1)] : (~&wire13)))));
        end
    end
  assign wire27 = $signed($unsigned((-($unsigned(reg19) && $unsigned(wire12)))));
  assign wire28 = (-(!wire13[(3'h5):(2'h2)]));
  assign wire29 = (8'ha6);
  always
    @(posedge clk) begin
      reg30 <= $signed((&{$signed({reg22}),
          $unsigned((reg17 ? (7'h42) : reg17))}));
      reg31 <= {(((~&$unsigned(wire11)) ?
                  reg25 : ((reg17 ? wire11 : reg24) ?
                      $unsigned(reg23) : reg20[(1'h1):(1'h0)])) ?
              {wire27} : $unsigned(($signed(wire12) ?
                  $unsigned(reg26) : reg23))),
          reg20[(3'h5):(3'h5)]};
      if ((~^{reg18}))
        begin
          reg32 <= ($signed(($signed((reg31 & reg16)) && (reg30[(2'h2):(1'h1)] ?
                  (!(7'h43)) : (reg18 ? wire27 : reg16)))) ?
              reg16 : {(|({wire11} && $unsigned(wire27)))});
        end
      else
        begin
          reg32 <= $signed(reg26);
          reg33 <= reg26[(2'h3):(2'h3)];
          if (((~$signed(((wire13 ? reg22 : reg17) | (wire11 ?
                  reg33 : (8'hbf))))) ?
              reg15[(1'h0):(1'h0)] : (~wire11[(1'h0):(1'h0)])))
            begin
              reg34 <= (~^reg30[(2'h3):(1'h0)]);
              reg35 <= $signed($unsigned(($unsigned($signed(reg22)) ?
                  wire27 : (^~$unsigned(reg30)))));
              reg36 <= $unsigned($unsigned(reg18[(1'h1):(1'h1)]));
            end
          else
            begin
              reg34 <= ($signed($signed({(reg35 ? (8'hb4) : reg32),
                  {wire13}})) ^~ $signed($signed((!(reg20 < (8'ha5))))));
              reg35 <= (8'h9c);
              reg36 <= ((($unsigned((&reg34)) && $unsigned((^wire28))) || $unsigned($unsigned(wire11[(3'h6):(3'h6)]))) ?
                  ($signed(($unsigned(reg33) & $signed(reg23))) ?
                      (-reg23[(3'h5):(1'h0)]) : $unsigned(($unsigned(wire14) ?
                          {reg31} : $unsigned((8'hbe))))) : wire12[(1'h1):(1'h0)]);
              reg37 <= (^$unsigned(reg17[(3'h4):(1'h1)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg38 <= $unsigned({reg35,
          (((reg25 | reg22) ? (reg32 <= (8'hba)) : ((8'ha9) ? reg31 : reg15)) ?
              {wire12, (reg35 ? wire11 : (8'hbb))} : (~^$unsigned(reg30)))});
    end
  assign wire39 = {((~&(^reg37[(5'h13):(4'h8)])) == (reg35 ?
                          $signed(reg34) : (8'hba))),
                      $unsigned(($unsigned(reg31[(3'h5):(3'h4)]) || ($unsigned(reg26) == (reg20 > (8'ha2)))))};
  assign wire40 = ({$unsigned((&reg26))} == $unsigned($signed(reg25[(3'h7):(3'h6)])));
  assign wire41 = reg18[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg42 <= wire28;
      reg43 <= {(|(~&wire28[(2'h3):(1'h1)]))};
      reg44 <= {wire29, reg38};
      reg45 <= (^$unsigned(((+reg23[(4'hd):(1'h1)]) ?
          (~^((8'haf) && reg43)) : $signed($unsigned(reg42)))));
    end
  assign wire46 = $unsigned((($signed($signed(reg22)) <<< {(~&reg35)}) ?
                      (8'haa) : ({reg15, reg35[(3'h6):(1'h1)]} ?
                          ($unsigned(reg16) ?
                              (-reg25) : $signed(wire41)) : $signed((wire28 >>> reg21)))));
  assign wire47 = $signed(((reg34 ? $signed((|wire11)) : reg23) ?
                      ($unsigned(reg15) ^ ((reg42 | reg23) ?
                          $unsigned(reg37) : (!reg15))) : ((+(^~reg38)) ?
                          (reg45[(4'hf):(3'h4)] <= $unsigned((8'hae))) : {{reg16,
                                  (8'hb7)}})));
  assign wire48 = (reg42 || (-(reg33[(4'ha):(1'h0)] ?
                      (+reg26[(3'h5):(3'h4)]) : (8'hbf))));
  assign wire49 = (-reg31);
  always
    @(posedge clk) begin
      if ({$signed(((reg30 && (reg34 ^~ reg17)) ?
              (reg31 ? (^(8'hac)) : $unsigned(reg25)) : $signed(reg26)))})
        begin
          reg50 <= (wire48 - ($unsigned($signed(reg15)) - wire48[(3'h4):(1'h1)]));
          reg51 <= $unsigned({{$signed((^reg20)), wire40},
              ($unsigned((wire40 >> reg44)) && (~&((7'h40) ?
                  (8'ha7) : reg34)))});
        end
      else
        begin
          reg50 <= wire40[(4'ha):(4'ha)];
          reg51 <= $signed(($signed((8'ha1)) ?
              $unsigned(reg51) : ($unsigned(reg34) * (-wire48[(3'h4):(1'h1)]))));
          reg52 <= ($signed($signed($signed($signed(reg43)))) >> {(wire27[(3'h5):(1'h0)] ?
                  $unsigned((reg16 > (8'hbf))) : ((-wire49) ?
                      $unsigned((8'h9c)) : (-wire39)))});
        end
      if ($unsigned($unsigned(({(^~(8'had))} ?
          (+reg16[(5'h10):(5'h10)]) : reg37))))
        begin
          reg53 <= $unsigned($unsigned($unsigned(((wire48 <<< reg15) + $unsigned(reg52)))));
          reg54 <= $signed($signed(({reg36, {wire13}} ? reg32 : reg31)));
        end
      else
        begin
          reg53 <= $signed(((reg35 ?
              (&$unsigned(reg43)) : (^~(&reg42))) < $unsigned($unsigned($unsigned((8'hbf))))));
          if (((|((&(!reg18)) ?
                  reg23 : ((^wire40) ? reg38 : (reg33 >= reg32)))) ?
              wire41[(4'h8):(1'h1)] : ({reg21[(2'h2):(1'h0)]} ?
                  $unsigned(wire13[(2'h2):(1'h1)]) : {wire49[(3'h7):(3'h5)],
                      ($signed((8'ha4)) ? reg36[(4'h9):(4'h9)] : reg22)})))
            begin
              reg54 <= $signed(((reg36 ?
                      $signed(wire48[(2'h2):(1'h0)]) : reg42[(4'ha):(3'h6)]) ?
                  (wire11 > (wire27[(1'h1):(1'h0)] ^~ {wire28})) : $unsigned(($signed(reg52) ?
                      $signed(reg21) : (~^wire11)))));
              reg55 <= $signed(((wire27 ^ (~|(wire39 ? reg34 : (8'hb9)))) ?
                  (8'h9e) : $unsigned($signed({reg31, reg34}))));
              reg56 <= (({(reg25 ? wire41 : $unsigned(wire13)), reg33} ?
                  {($signed(reg25) - (wire14 ?
                          reg30 : wire49))} : wire47[(3'h7):(3'h4)]) || $signed(({(reg19 ?
                      reg50 : reg54),
                  (|(7'h41))} >>> $signed(reg45))));
              reg57 <= (($signed((reg38[(4'he):(4'h8)] != reg44)) * {(8'ha9)}) ?
                  {((+(-reg51)) ?
                          (wire48[(2'h3):(1'h1)] != $unsigned(reg24)) : wire49),
                      wire49[(4'h9):(3'h4)]} : wire28[(1'h1):(1'h1)]);
              reg58 <= reg50[(1'h0):(1'h0)];
            end
          else
            begin
              reg54 <= (8'hba);
              reg55 <= ((7'h41) - reg43[(1'h0):(1'h0)]);
              reg56 <= reg31[(3'h5):(2'h3)];
            end
        end
      if (reg20[(2'h2):(1'h0)])
        begin
          reg59 <= ((^($unsigned((wire49 <<< wire47)) || (-$signed((8'h9f))))) ?
              reg50[(3'h4):(3'h4)] : (-(($unsigned(reg18) ?
                  (wire49 ?
                      reg32 : wire48) : (wire12 >> reg17)) > $signed({reg34,
                  reg32}))));
          reg60 <= ($unsigned((7'h41)) ?
              $signed($unsigned($unsigned($unsigned(reg51)))) : (($unsigned((wire46 ?
                      wire41 : (8'ha4))) == ((^~wire27) ?
                      wire11[(3'h4):(1'h1)] : wire49[(4'he):(2'h3)])) ?
                  (-(reg26[(3'h4):(2'h2)] >>> (wire47 ?
                      reg53 : reg34))) : $signed(((+(8'hb8)) ?
                      {reg37} : (~&reg33)))));
        end
      else
        begin
          reg59 <= $signed(reg22[(3'h4):(3'h4)]);
          if ($unsigned(((((~(8'ha8)) ?
              ((8'h9d) >> reg42) : $unsigned(reg30)) >> wire14[(4'h9):(3'h6)]) >>> $signed($signed((~|reg19))))))
            begin
              reg60 <= (~(^reg22[(4'hd):(4'hd)]));
              reg61 <= reg30;
              reg62 <= $signed((&wire41));
              reg63 <= $signed(reg54);
              reg64 <= $unsigned((~|(8'ha4)));
            end
          else
            begin
              reg60 <= reg37;
              reg61 <= ((!(reg30[(3'h4):(2'h2)] >>> $signed((~^wire27)))) - reg63);
            end
          if ($signed((reg22[(4'hb):(4'h8)] + ((&(wire14 ? reg26 : reg55)) ?
              $unsigned(reg23[(4'hf):(4'h9)]) : ((reg60 + wire12) ?
                  (reg31 ? reg54 : reg23) : $signed((8'ha0)))))))
            begin
              reg65 <= $signed($unsigned(reg56));
              reg66 <= reg22[(4'ha):(3'h4)];
              reg67 <= (wire41[(3'h5):(2'h3)] && reg43);
              reg68 <= $unsigned($unsigned($unsigned((+(reg51 ?
                  wire46 : reg17)))));
              reg69 <= reg16;
            end
          else
            begin
              reg65 <= ((wire12[(3'h6):(3'h4)] + $unsigned(reg52)) ?
                  $signed({$unsigned({wire11, reg18}),
                      wire39}) : $unsigned(reg59[(1'h0):(1'h0)]));
            end
          reg70 <= reg23;
        end
      reg71 <= (((reg21[(3'h7):(3'h7)] ?
              {(^~reg35),
                  $unsigned(reg19)} : ((reg69 <<< reg18) ^~ (!reg21))) << {$unsigned($unsigned(reg26)),
              (~|(reg55 << reg31))}) ?
          reg56 : ($unsigned(((~|reg25) ?
              (wire13 ?
                  reg35 : (7'h42)) : reg67[(3'h6):(2'h3)])) >= $unsigned(wire29[(1'h0):(1'h0)])));
      reg72 <= ($signed(reg15) != reg32[(3'h4):(3'h4)]);
    end
  assign wire73 = reg38;
  always
    @(posedge clk) begin
      reg74 <= {$unsigned((wire73[(2'h2):(1'h0)] ?
              (~&$signed(reg22)) : reg67[(1'h0):(1'h0)]))};
      reg75 <= $unsigned(reg57);
      if ($signed((7'h40)))
        begin
          if (reg74[(4'ha):(3'h4)])
            begin
              reg76 <= (&{((^reg61[(3'h4):(1'h0)]) ?
                      (&(^~(8'hbc))) : $unsigned((reg69 ? reg32 : reg66))),
                  $unsigned($signed((~|reg32)))});
              reg77 <= {{(|(~^(|reg19)))}};
              reg78 <= $unsigned((wire12[(3'h6):(3'h4)] <<< $unsigned(reg35[(2'h2):(1'h1)])));
              reg79 <= reg15;
              reg80 <= $unsigned((-(8'had)));
            end
          else
            begin
              reg76 <= ($unsigned((&wire47)) ?
                  reg36[(3'h4):(1'h0)] : {(~|$signed(wire12))});
            end
        end
      else
        begin
          reg76 <= {$signed((({reg80} == reg21[(3'h4):(3'h4)]) && reg76))};
          reg77 <= ($unsigned(wire49) && $unsigned($signed(((+reg38) >= (8'hb9)))));
          reg78 <= $unsigned((((|reg79[(3'h4):(1'h1)]) ?
              ({wire14} & reg74[(1'h0):(1'h0)]) : ((reg58 ^ reg57) ?
                  ((8'ha6) << reg76) : {reg75})) == (reg19[(4'h9):(1'h1)] ?
              ((reg55 ?
                  reg36 : reg55) <<< reg35[(3'h4):(1'h1)]) : (!(~&reg63)))));
          reg79 <= (~^(^reg57));
          if ((-(reg63 ? reg57 : reg53)))
            begin
              reg80 <= $signed((-$unsigned({reg68[(1'h0):(1'h0)]})));
            end
          else
            begin
              reg80 <= reg56[(4'h8):(3'h7)];
              reg81 <= {$signed($signed(((reg17 ?
                      reg74 : reg53) >>> $unsigned(reg75)))),
                  reg22[(3'h6):(3'h6)]};
              reg82 <= (^((reg53[(1'h1):(1'h0)] - (-reg63[(3'h6):(3'h4)])) ?
                  $unsigned(((~^reg72) ?
                      (wire73 ?
                          reg76 : reg35) : ((8'hbc) && reg51))) : (-reg64)));
              reg83 <= {(&($unsigned((wire39 ? reg50 : reg59)) ?
                      (|{reg25, (8'hb0)}) : (wire39 <<< (wire14 ?
                          reg79 : reg81))))};
            end
        end
      if ($unsigned(reg71[(1'h1):(1'h0)]))
        begin
          reg84 <= reg44;
        end
      else
        begin
          reg84 <= $unsigned(wire48[(3'h4):(2'h2)]);
          if ({reg76[(4'hd):(3'h6)]})
            begin
              reg85 <= reg52[(1'h1):(1'h0)];
              reg86 <= $signed(reg32);
              reg87 <= {{($unsigned(reg53) ~^ (reg57 ?
                          (reg74 ? reg59 : reg57) : {reg72})),
                      ((^~reg42) <= $signed((~&reg45)))}};
              reg88 <= (($unsigned($signed((|(8'ha8)))) ?
                  reg78 : reg18[(4'hf):(4'he)]) ^~ (reg68[(4'hc):(4'hc)] ?
                  reg77 : $signed(wire39)));
              reg89 <= (~|(wire49[(5'h10):(4'h8)] * ((reg68 >= reg16[(3'h7):(3'h5)]) == $signed($signed(reg19)))));
            end
          else
            begin
              reg85 <= $unsigned($unsigned((^~$unsigned($unsigned(wire40)))));
              reg86 <= reg38;
              reg87 <= $unsigned(reg37[(1'h0):(1'h0)]);
              reg88 <= (reg18 ? reg63 : reg45);
              reg89 <= ($signed(reg71[(3'h5):(1'h0)]) - ((~|wire40[(3'h6):(3'h6)]) ?
                  reg83 : (^(reg56[(1'h1):(1'h0)] ?
                      $signed(reg77) : (reg79 && reg87)))));
            end
          reg90 <= (+reg61[(2'h3):(2'h2)]);
          reg91 <= ((+reg45[(5'h10):(1'h1)]) < (-(^~$signed((reg75 ?
              wire39 : reg70)))));
          reg92 <= $unsigned($signed((&{wire12[(3'h6):(3'h4)],
              wire48[(3'h5):(3'h4)]})));
        end
      reg93 <= reg62[(4'he):(4'hd)];
    end
  assign wire94 = $unsigned($unsigned(({(reg74 >>> reg23),
                      $unsigned(reg31)} << $signed((~^reg61)))));
  assign wire95 = $signed((8'hbd));
  assign wire96 = (~^reg23[(3'h7):(3'h6)]);
  assign wire97 = (-(reg63[(2'h2):(2'h2)] * reg90));
endmodule
