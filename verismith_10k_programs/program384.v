module top
#(parameter param177 = (8'ha1), 
parameter param178 = ({(((param177 <<< param177) ^~ (param177 ? param177 : param177)) > param177), (param177 ? param177 : param177)} == param177))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire85;
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire172,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire85,
                 (1'h0)};
  assign wire4 = $signed((&(!$signed($unsigned(wire1)))));
  assign wire5 = $unsigned({(|wire2)});
  assign wire6 = ((-{(~wire3), ($signed(wire3) << (!wire3))}) ?
                     $signed((wire0[(3'h7):(3'h6)] ?
                         ($unsigned(wire1) | wire0) : wire1)) : {$signed(wire4)});
  assign wire7 = $signed({wire4});
  assign wire8 = wire1[(3'h4):(1'h1)];
  module9 #() modinst86 (wire85, clk, wire2, wire8, wire3, wire0, wire4);
  module87 #() modinst173 (wire172, clk, wire8, wire1, wire2, wire6);
  assign wire174 = {($signed(((wire0 ? wire172 : wire4) ?
                           (wire6 ? wire5 : wire2) : (wire172 ?
                               (8'hb0) : wire8))) ^~ ({$signed(wire8)} ?
                           wire4 : ($unsigned((8'hbd)) ?
                               (wire1 << wire3) : wire2)))};
  assign wire175 = wire85[(3'h7):(1'h1)];
  assign wire176 = {({((~&wire6) + wire172[(3'h5):(2'h3)])} ?
                           ({(wire174 == wire7), $unsigned(wire0)} ?
                               ((wire175 ? wire8 : wire5) ?
                                   (wire6 & wire3) : (wire4 ?
                                       wire7 : wire6)) : $signed(wire174[(1'h1):(1'h0)])) : $unsigned($signed($unsigned(wire4)))),
                       ($signed((|wire2[(4'hd):(4'ha)])) ? wire8 : wire3)};
endmodule

module module87
#(parameter param171 = ({(~&(^~{(8'hae), (7'h43)})), {{((8'hb6) ^ (8'hbc)), (+(8'hb2))}}} <= (^~((&(7'h42)) ? (8'hbd) : (((8'hb1) ? (8'ha9) : (8'hb2)) << (~&(8'h9f)))))))
(y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire90;
  input wire [(5'h15):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire156;
  reg signed [(2'h2):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  assign y = {wire170,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire156,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire92 = $unsigned(wire90[(1'h0):(1'h0)]);
  assign wire93 = (8'hbb);
  assign wire94 = wire93[(3'h5):(3'h4)];
  assign wire95 = $unsigned(((8'ha1) || (&((wire89 ? wire94 : wire93) * {wire91,
                      wire91}))));
  module96 #() modinst157 (wire156, clk, wire92, wire88, wire93, wire91, wire95);
  always
    @(posedge clk) begin
      reg158 <= wire156;
      reg159 <= (~|$unsigned(($unsigned(wire95[(1'h1):(1'h0)]) < wire156)));
      reg160 <= $unsigned(wire94[(2'h3):(2'h3)]);
      reg161 <= wire90[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg162 <= (8'hb9);
      reg163 <= wire94[(4'ha):(4'h9)];
      if (((($signed((reg159 ? wire93 : (8'hb5))) > wire91) ?
              (|((|wire90) ? $signed(wire89) : (|wire91))) : reg162) ?
          ((&($unsigned(wire95) == (wire91 * reg159))) ~^ reg158[(4'hc):(3'h6)]) : $signed($unsigned(((wire95 - wire95) ?
              $signed(reg159) : $signed(wire89))))))
        begin
          if (((^($unsigned(wire92[(4'h9):(3'h7)]) ?
                  $signed($unsigned((8'hb2))) : $signed(wire88[(4'h9):(3'h5)]))) ?
              $unsigned(((|(wire156 ?
                  reg163 : wire156)) ^ $unsigned($signed((7'h40))))) : ($signed({(reg158 >>> reg162)}) ?
                  $signed(({reg162,
                      wire92} || wire92)) : (+((wire94 ~^ reg160) ?
                      ((8'ha5) ? reg161 : wire91) : $signed(wire91))))))
            begin
              reg164 <= (~&($signed(wire156[(2'h3):(1'h1)]) ?
                  $unsigned(reg162[(4'hc):(4'ha)]) : (wire92 < (reg159[(1'h0):(1'h0)] ?
                      wire90[(2'h3):(1'h0)] : (reg159 | (7'h42))))));
            end
          else
            begin
              reg164 <= (wire94 ?
                  (~^((^(^wire92)) || $unsigned($unsigned(wire91)))) : {$signed((~^(~|reg161))),
                      ($signed((reg161 >= (8'hbf))) ?
                          ((|reg163) ?
                              (^wire94) : $unsigned(reg159)) : $signed(((8'ha8) + reg160)))});
              reg165 <= ((reg160[(1'h0):(1'h0)] ?
                      wire90 : (-$signed($unsigned(wire91)))) ?
                  {wire93[(1'h1):(1'h0)], {wire93}} : ($signed((+(reg158 ?
                          wire95 : reg158))) ?
                      wire88[(3'h4):(1'h1)] : {($unsigned(wire89) - (reg162 - wire94)),
                          {(reg161 || (8'hb1))}}));
              reg166 <= wire90;
            end
          reg167 <= ((+$unsigned($unsigned($signed(reg164)))) ?
              reg158[(2'h3):(2'h3)] : reg159[(5'h10):(3'h7)]);
          reg168 <= reg160[(1'h0):(1'h0)];
        end
      else
        begin
          if ((^~(wire156[(2'h2):(1'h1)] >> wire89[(3'h7):(3'h7)])))
            begin
              reg164 <= (!$unsigned({$unsigned((wire90 <<< reg162)),
                  $unsigned(reg164[(5'h13):(4'ha)])}));
            end
          else
            begin
              reg164 <= ($unsigned(reg158[(2'h3):(1'h0)]) || $signed((!$unsigned(wire92))));
              reg165 <= ((8'ha9) >>> $unsigned($signed($unsigned($unsigned(wire92)))));
              reg166 <= ($signed($signed(reg168)) * reg159[(4'hb):(4'h8)]);
              reg167 <= (|($unsigned((8'ha7)) ?
                  reg159[(4'he):(3'h6)] : wire92));
            end
        end
      reg169 <= {((^~(~&(^~reg165))) ?
              (7'h43) : $signed((reg167[(4'hd):(3'h5)] ^ (8'ha6)))),
          {$unsigned(((reg158 ? reg164 : wire94) ?
                  (reg160 >= reg160) : ((8'hab) && (8'h9c))))}};
    end
  assign wire170 = wire156[(1'h0):(1'h0)];
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire63;
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire15,
                 wire16,
                 wire17,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire63,
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
                 reg73,
                 reg72,
                 reg71,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire15 = $signed($signed(wire12[(4'hc):(1'h0)]));
  assign wire16 = wire10;
  assign wire17 = (~wire12[(4'h9):(4'h8)]);
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg18 <= {($unsigned((~^(wire15 ? wire14 : wire14))) ?
                  {wire15} : wire16[(1'h0):(1'h0)]),
              ((wire17[(2'h3):(1'h1)] ?
                  (wire10 ?
                      $unsigned(wire10) : $unsigned(wire12)) : wire15) != $signed(wire11))};
          reg19 <= $signed((~|wire13));
          reg20 <= ($unsigned($signed((wire13 ?
              wire14[(4'h8):(2'h3)] : $signed(wire17)))) << (~^$signed($signed(wire14[(4'h8):(3'h4)]))));
        end
      else
        begin
          if ($signed(reg18[(3'h4):(1'h0)]))
            begin
              reg18 <= ({($signed((wire15 ? wire12 : wire12)) ?
                      wire12[(3'h7):(1'h1)] : $signed(wire16[(3'h7):(3'h6)]))} * $signed((^~reg18)));
              reg19 <= wire12;
              reg20 <= $signed($signed(($signed($signed(wire12)) ?
                  $signed({wire17, wire15}) : wire16)));
              reg21 <= (reg19 ?
                  (reg18[(1'h1):(1'h0)] ?
                      $signed({wire12[(3'h7):(3'h7)],
                          (-wire10)}) : $signed(wire11)) : $unsigned(wire11));
              reg22 <= $unsigned($signed((^~($unsigned(wire15) ?
                  wire10 : (~&wire12)))));
            end
          else
            begin
              reg18 <= ($signed({((wire14 <= reg18) > $unsigned(reg21))}) ?
                  $unsigned({(~|(reg20 >= wire16)),
                      {{wire10, wire15},
                          (reg22 << reg22)}}) : ($signed(($signed(wire16) >>> $unsigned(reg22))) ?
                      $signed((^(wire15 || wire12))) : $unsigned((-wire11))));
              reg19 <= $signed(($unsigned(({wire13, wire16} ?
                  (wire15 ?
                      wire13 : reg21) : (wire10 + wire15))) != ($signed((wire11 < wire11)) ~^ reg22[(4'h8):(1'h0)])));
              reg20 <= wire14;
              reg21 <= reg22[(4'h9):(1'h1)];
              reg22 <= {{$unsigned($signed(reg21))},
                  (~&(-$unsigned((wire17 ? wire15 : reg20))))};
            end
          reg23 <= ($unsigned((8'ha6)) ?
              (wire10 - $signed((-wire15))) : {$unsigned(wire11),
                  $signed((reg20[(1'h1):(1'h0)] ? wire10 : reg18))});
        end
      reg24 <= {($signed($unsigned($signed(reg22))) <<< (-reg22)),
          ($unsigned({$unsigned(reg18), (wire16 ? (8'hb8) : reg22)}) ?
              $signed(((reg20 - reg20) ?
                  reg18[(2'h2):(1'h0)] : (wire15 ?
                      reg22 : wire14))) : $unsigned($signed((^wire11))))};
      reg25 <= reg22[(4'hf):(4'hd)];
    end
  assign wire26 = (($signed(wire11) ?
                          wire13[(1'h0):(1'h0)] : ((reg21 ?
                              (wire11 << wire11) : ((7'h42) + reg24)) && {reg22,
                              $signed((7'h41))})) ?
                      (~^$signed($signed(reg18[(2'h2):(1'h1)]))) : {$unsigned((-(reg25 <<< wire14))),
                          (reg21 ?
                              ((reg18 ? reg20 : (8'hab)) + (reg22 ?
                                  wire16 : wire11)) : (+reg23[(3'h4):(2'h2)]))});
  assign wire27 = (((&(+wire15[(3'h4):(3'h4)])) ?
                      ({{(8'hb6),
                              reg20}} > $signed(wire14)) : {reg25[(1'h0):(1'h0)],
                          $unsigned($unsigned((8'h9c)))}) * (reg23[(3'h6):(3'h6)] ?
                      ((8'hba) <<< (wire12 ~^ wire11)) : (!($signed(reg19) ?
                          (^~wire17) : (+wire15)))));
  assign wire28 = $signed((&(reg22 ?
                      ((wire27 ? reg24 : wire15) ?
                          $signed(wire12) : $unsigned((8'hb4))) : (wire10[(2'h2):(1'h1)] ?
                          {wire13} : {wire11}))));
  assign wire29 = (reg20 ? reg24 : wire13);
  module30 #() modinst64 (wire63, clk, wire29, reg25, reg21, reg22);
  assign wire65 = reg18[(4'hd):(4'hd)];
  assign wire66 = ($signed((reg25 ^ (&reg18[(4'h9):(2'h2)]))) ?
                      ($signed($signed(reg19)) <= wire65[(1'h0):(1'h0)]) : $unsigned(wire63[(1'h0):(1'h0)]));
  assign wire67 = wire15[(3'h6):(3'h4)];
  assign wire68 = reg24;
  assign wire69 = $signed(wire14[(4'hd):(3'h6)]);
  assign wire70 = (reg23[(1'h1):(1'h1)] < $signed(((reg20 ?
                          (wire10 >> wire26) : (reg22 ? wire14 : reg18)) ?
                      ((8'haa) || (wire11 || reg21)) : reg19[(4'h8):(3'h6)])));
  always
    @(posedge clk) begin
      reg71 <= (($unsigned(wire67[(2'h2):(2'h2)]) > $unsigned($signed((wire16 ?
              (8'ha3) : (8'hb5))))) ?
          $signed((+(~^(~&wire15)))) : wire12);
      if ((-reg23))
        begin
          reg72 <= reg18;
          reg73 <= reg18;
          if (reg24[(4'ha):(1'h1)])
            begin
              reg74 <= {wire14[(4'hd):(4'hd)], $signed($unsigned(wire16))};
              reg75 <= $unsigned(($signed({(reg20 ? reg19 : (8'ha3)),
                      {wire68}}) ?
                  $signed(((~reg20) + $signed((8'hb1)))) : ($unsigned((~&(8'hb7))) & $signed((reg74 ?
                      wire17 : wire12)))));
              reg76 <= $unsigned($unsigned(wire14[(5'h14):(4'ha)]));
              reg77 <= (!((-($signed(reg71) ?
                      $signed(wire67) : (reg74 ? reg21 : wire66))) ?
                  ({(~^wire68)} ?
                      (8'hb4) : (wire66 ?
                          reg72[(4'hf):(2'h3)] : (-wire28))) : ($signed((wire29 ?
                      reg18 : wire14)) | ({reg21, reg21} ?
                      (^wire13) : $unsigned(reg72)))));
            end
          else
            begin
              reg74 <= wire63[(1'h0):(1'h0)];
              reg75 <= $unsigned(wire14[(4'hd):(3'h5)]);
              reg76 <= ($unsigned(((reg24 + (&reg71)) != reg74[(4'h8):(2'h2)])) ?
                  (~|wire70) : wire70[(2'h2):(1'h1)]);
              reg77 <= {((+wire70) >= {$unsigned((~^(7'h41))),
                      (wire63[(3'h4):(3'h4)] ?
                          (reg24 != (8'ha6)) : $signed(reg20))})};
              reg78 <= $signed(reg74[(4'ha):(1'h1)]);
            end
          if (((wire27 <= reg78[(4'he):(2'h2)]) ?
              (&{wire15[(3'h7):(2'h2)],
                  ((&(8'hac)) ?
                      (wire27 ? reg76 : reg19) : (wire12 ?
                          wire15 : wire28))}) : $unsigned((7'h44))))
            begin
              reg79 <= wire70;
              reg80 <= reg24;
              reg81 <= ($unsigned((7'h40)) ?
                  {$unsigned((|(reg73 >> (8'hb2)))),
                      wire67[(2'h2):(2'h2)]} : reg78[(1'h0):(1'h0)]);
            end
          else
            begin
              reg79 <= (reg19[(4'he):(4'hc)] ?
                  (((8'hae) ?
                          reg77[(3'h5):(1'h1)] : $unsigned($signed(wire11))) ?
                      (reg20[(1'h0):(1'h0)] * reg19[(3'h7):(2'h2)]) : ((~{wire11}) < (~^reg79[(1'h1):(1'h0)]))) : reg19[(2'h2):(2'h2)]);
              reg80 <= (~&$unsigned((&reg76)));
              reg81 <= ({reg75} ?
                  wire12[(1'h1):(1'h0)] : ((({reg79} != (reg19 || wire29)) + (wire67 ?
                          $unsigned(wire70) : wire10[(4'hd):(2'h3)])) ?
                      (^~(~&reg72)) : {((&wire69) ?
                              (wire27 ? reg79 : wire11) : (wire70 & reg80))}));
              reg82 <= $signed(reg73);
              reg83 <= (!$unsigned({(~&wire28[(2'h3):(1'h0)])}));
            end
        end
      else
        begin
          reg72 <= reg82[(4'h8):(4'h8)];
        end
      reg84 <= (~|$unsigned((-$signed($signed(reg19)))));
    end
endmodule

module module30
#(parameter param62 = (((({(8'ha3)} <= ((7'h41) ? (8'h9f) : (8'hbc))) ? (((8'hba) + (8'hb1)) ~^ (^(8'ha1))) : (((8'ha3) ? (8'hbb) : (8'h9f)) ? ((8'hba) ? (8'ha1) : (8'ha0)) : ((8'h9d) || (8'ha9)))) & (^~(^((8'hba) > (8'hb8))))) <= (((((7'h41) << (8'hac)) ? ((8'h9f) <= (8'h9f)) : {(8'hb2), (8'ha1)}) ? ((|(8'hac)) ? ((8'hab) ? (8'hb9) : (8'ha5)) : ((8'haf) << (8'hbe))) : (-((8'ha7) ? (8'hb7) : (8'hb3)))) ? ({((8'hb1) ? (8'ha3) : (8'hb9)), ((8'ha9) ? (8'hb5) : (8'h9c))} + (((8'hba) ? (8'hbe) : (8'haf)) && (-(7'h42)))) : ({{(8'hb5)}, (^(7'h42))} | (((7'h41) <= (7'h40)) ? ((8'hb5) ? (8'ha5) : (8'ha3)) : ((8'hae) ? (8'hb6) : (8'hb3)))))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(2'h2):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= wire33;
      if (reg35)
        begin
          reg36 <= ((+$unsigned(reg35)) >= (~^wire32));
        end
      else
        begin
          reg36 <= wire32;
          if ((8'haf))
            begin
              reg37 <= ((wire31 >> wire31) ?
                  $unsigned(wire31) : (!wire32[(2'h2):(2'h2)]));
              reg38 <= wire34;
              reg39 <= ({(~(&{reg37, reg38}))} ? (8'ha5) : wire32);
            end
          else
            begin
              reg37 <= wire33[(3'h4):(1'h0)];
            end
          reg40 <= {reg35[(3'h7):(3'h5)], $signed((^~reg35))};
          if (((^~(((^wire33) ? $signed(wire33) : reg40) ?
              $unsigned((wire32 ?
                  reg38 : reg38)) : $signed(((8'hb8) ~^ (8'hbb))))) < $unsigned((reg36[(4'hb):(2'h2)] ~^ $unsigned($signed(reg39))))))
            begin
              reg41 <= reg38;
              reg42 <= (+({{(reg35 ? wire31 : reg39)},
                  ((reg37 ?
                      (8'hb7) : wire34) <= reg39)} >= $unsigned($unsigned((8'ha2)))));
              reg43 <= {(-((~&$unsigned((8'had))) > $signed(wire34[(3'h7):(1'h0)])))};
              reg44 <= $signed(($signed(reg41) * (-reg39)));
              reg45 <= reg44[(4'hc):(3'h4)];
            end
          else
            begin
              reg41 <= (($unsigned(reg45[(4'h9):(3'h6)]) ?
                  {(8'hba),
                      {((8'ha9) | reg43)}} : $unsigned({(8'hbe)})) & wire31);
              reg42 <= (8'hac);
              reg43 <= $signed((-reg36));
              reg44 <= (((~reg40) ?
                      ((~^$signed((8'ha0))) - $unsigned(reg40)) : $signed($unsigned((wire32 ?
                          reg42 : reg36)))) ?
                  {reg45[(1'h0):(1'h0)]} : reg43[(3'h6):(2'h3)]);
            end
        end
      if ((8'hab))
        begin
          if ($signed((~reg35)))
            begin
              reg46 <= ((~(|{reg44})) ?
                  (wire32 ^~ reg39[(2'h2):(1'h0)]) : reg36);
              reg47 <= wire33;
              reg48 <= (+(reg36 == reg43));
            end
          else
            begin
              reg46 <= $unsigned((reg45 ?
                  $unsigned((~&(reg36 ? reg47 : wire34))) : reg47));
              reg47 <= {{({$signed((7'h44))} <<< (^$signed(reg48))),
                      $signed($signed($signed(wire34)))}};
              reg48 <= ((~&wire33[(1'h0):(1'h0)]) ?
                  {(^$signed(wire34))} : (wire34[(3'h6):(3'h6)] ^~ reg44));
              reg49 <= $signed($signed(reg46));
              reg50 <= reg36[(3'h5):(2'h2)];
            end
          if ((7'h41))
            begin
              reg51 <= reg37[(1'h0):(1'h0)];
              reg52 <= ($signed(wire32[(1'h1):(1'h1)]) ?
                  reg47[(3'h4):(3'h4)] : reg43[(4'hb):(2'h3)]);
              reg53 <= reg47[(3'h6):(3'h5)];
              reg54 <= $unsigned((~|$signed($unsigned(((8'ha4) && reg41)))));
            end
          else
            begin
              reg51 <= wire34[(3'h7):(3'h7)];
              reg52 <= (&$unsigned((reg54 ?
                  ($signed(reg45) >> $unsigned(reg41)) : ((|reg35) ?
                      reg44[(4'h8):(1'h0)] : reg42))));
            end
          reg55 <= (!reg43[(4'ha):(4'h9)]);
          if ({$unsigned($unsigned(((&wire32) > wire33))),
              ($unsigned((reg52 <<< (~&reg55))) ?
                  ($signed((reg49 ? reg41 : reg46)) ?
                      reg35[(4'hc):(3'h4)] : $unsigned($unsigned(wire33))) : $unsigned((wire32[(2'h2):(1'h1)] * (reg53 ?
                      reg47 : reg55))))})
            begin
              reg56 <= reg41[(3'h5):(3'h4)];
            end
          else
            begin
              reg56 <= ((+(($signed(reg40) ^ wire33[(1'h1):(1'h1)]) && ({reg51,
                      reg46} > $unsigned(reg39)))) ?
                  reg35[(3'h4):(2'h3)] : $unsigned(reg40));
              reg57 <= (((^~$unsigned($unsigned(reg53))) ?
                  reg46[(3'h6):(3'h5)] : $unsigned($unsigned($signed(reg38)))) + $signed(((~|(|wire32)) ^ reg49[(2'h2):(1'h0)])));
            end
        end
      else
        begin
          if ($unsigned($signed($signed(reg46))))
            begin
              reg46 <= $signed(wire34);
            end
          else
            begin
              reg46 <= (~|reg50);
              reg47 <= (~&$unsigned(($signed(reg55[(4'hd):(1'h0)]) > $signed(reg52[(3'h6):(1'h1)]))));
              reg48 <= (^~(reg40[(4'h9):(3'h7)] != (reg44 ?
                  ($signed(reg47) >= $unsigned(reg40)) : $signed({reg40,
                      reg42}))));
            end
          reg49 <= reg42;
          reg50 <= $signed($signed(reg45[(4'h8):(3'h7)]));
        end
    end
  always
    @(posedge clk) begin
      reg58 <= (!((8'hb9) + (~^$unsigned(reg52[(4'h9):(2'h2)]))));
    end
  assign wire59 = reg55;
  assign wire60 = (((8'hb4) ?
                          (wire59[(3'h4):(3'h4)] ?
                              reg50[(3'h4):(1'h1)] : $signed(reg43)) : (&{reg54,
                              reg38})) ?
                      {{(|(reg39 ? reg57 : reg58)),
                              $unsigned($signed((7'h41)))}} : reg49);
  assign wire61 = $unsigned((8'hba));
endmodule

module module96
#(parameter param154 = (^~((^((~^(8'hbd)) ? {(8'ha9), (7'h43)} : ((8'hbd) - (7'h42)))) < (^~{(8'ha6)}))), 
parameter param155 = ((((7'h42) <= ((param154 <= param154) + (^param154))) ? ({(param154 ? param154 : param154)} ? (8'hbb) : (|(^param154))) : (param154 ? {(param154 ? param154 : param154), param154} : param154)) > (param154 >>> param154)))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire101;
  input wire signed [(4'h9):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire signed [(5'h11):(1'h0)] wire98;
  input wire [(2'h2):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire102;
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire131,
                 wire130,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire102,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire102 = {{wire97}, $unsigned($signed(wire101[(4'h9):(3'h7)]))};
  always
    @(posedge clk) begin
      if ((|$unsigned((8'h9c))))
        begin
          reg103 <= ($signed(wire102) ^~ $signed({((wire100 ?
                  wire100 : (8'hb6)) == (!wire100)),
              $unsigned((~|(8'ha0)))}));
          reg104 <= {$unsigned($unsigned(wire102[(1'h0):(1'h0)])),
              {$unsigned((wire100 ~^ wire100[(3'h7):(3'h7)]))}};
          reg105 <= $unsigned((($signed((wire97 ^~ (7'h40))) ?
              (((8'ha5) == reg104) ?
                  (wire100 != reg103) : (^~wire97)) : ((wire101 ~^ wire99) ?
                  wire99 : $signed(reg104))) >>> wire97[(1'h1):(1'h1)]));
          reg106 <= ((+wire99[(2'h3):(2'h3)]) ^ $signed((!((!wire101) >= wire100))));
        end
      else
        begin
          reg103 <= (^~reg105[(4'hb):(4'h8)]);
          reg104 <= $signed((7'h43));
          reg105 <= {((wire97 ? wire99 : {reg106[(3'h6):(1'h0)]}) <<< {(reg103 ?
                      (wire100 ? wire100 : reg106) : {reg104, (7'h41)})}),
              wire97[(2'h2):(1'h1)]};
          reg106 <= ({$signed($signed(wire99[(3'h5):(1'h0)]))} ?
              $unsigned((|$unsigned({reg106, wire100}))) : wire99);
        end
      reg107 <= ((^~($signed((wire101 ? reg103 : (8'ha6))) ?
          (reg104[(4'hb):(4'hb)] ?
              wire98 : (8'hb2)) : (~&$unsigned(wire101)))) < reg105[(3'h7):(1'h0)]);
      reg108 <= {(($signed($signed(wire101)) ?
                  {{reg107, reg106}} : (wire97[(1'h1):(1'h1)] ?
                      $signed(reg105) : ((8'had) ? wire100 : reg106))) ?
              $unsigned((&wire100)) : reg106),
          (wire99 || $signed(({wire102} & reg103)))};
      reg109 <= {$signed((^~(((8'hbb) <<< wire100) << $unsigned(reg108))))};
    end
  assign wire110 = (8'ha3);
  assign wire111 = $signed((~&$signed((reg109[(2'h3):(1'h1)] <= (8'ha5)))));
  assign wire112 = {$unsigned((wire102 ?
                           ($unsigned(reg103) & (wire111 - reg104)) : $signed((reg106 ?
                               wire111 : wire110)))),
                       reg103[(3'h4):(2'h3)]};
  assign wire113 = (+((~^reg104) ?
                       $unsigned(((wire102 ?
                           (8'hbc) : reg103) <<< $signed(wire101))) : (reg105 > (wire99[(3'h6):(3'h6)] >> reg105[(4'h9):(3'h7)]))));
  assign wire114 = (reg109[(1'h1):(1'h0)] ? (8'h9c) : (|reg108));
  assign wire115 = (wire100[(1'h0):(1'h0)] >> $unsigned($signed((+{(8'hb2),
                       reg104}))));
  assign wire116 = $unsigned(($unsigned(reg103[(3'h5):(2'h3)]) ?
                       (((wire113 ? wire113 : reg108) ~^ (8'ha4)) ?
                           {$unsigned((8'hb8)),
                               reg103} : (wire99[(3'h6):(2'h2)] ?
                               (reg104 ?
                                   reg108 : reg106) : wire112)) : $signed((wire114 == $unsigned(reg109)))));
  assign wire117 = ((|$unsigned($unsigned($signed(wire115)))) | $unsigned($signed(reg108[(1'h0):(1'h0)])));
  assign wire118 = ((wire116 ?
                       wire114[(1'h0):(1'h0)] : ((reg106[(3'h6):(3'h6)] ?
                           (reg104 ? reg109 : wire100) : {wire114,
                               wire115}) ~^ ({(8'hb7), (8'hb8)} ?
                           (^~reg109) : (reg107 & (8'ha2))))) & $unsigned({($unsigned(reg107) << (reg105 & reg107))}));
  assign wire119 = (!{(((wire99 ^~ wire111) ?
                           {reg109,
                               reg103} : $signed(wire115)) == $signed(((8'haa) * wire99)))});
  assign wire120 = reg103;
  always
    @(posedge clk) begin
      reg121 <= wire100[(3'h7):(3'h7)];
      if ($signed(reg109))
        begin
          reg122 <= ((!$signed(wire97[(1'h0):(1'h0)])) ?
              wire100 : (wire98[(3'h6):(1'h1)] ?
                  (wire116 * wire115[(4'hd):(3'h7)]) : ($unsigned($unsigned(wire97)) ^ (~|(8'hb1)))));
          if (wire120[(4'hb):(3'h6)])
            begin
              reg123 <= (^$signed(reg103[(2'h2):(2'h2)]));
              reg124 <= $unsigned((((&wire102[(3'h4):(2'h2)]) ?
                  ($unsigned(wire114) * {reg107}) : ({reg106,
                      wire113} || $signed(reg108))) >= $unsigned(wire114[(1'h1):(1'h0)])));
              reg125 <= (+(|(~|($unsigned((8'hb3)) ?
                  ((8'ha1) ? wire110 : wire110) : reg107))));
              reg126 <= (!((!(-wire120[(4'hc):(4'h9)])) ?
                  {reg125, reg107} : wire97));
              reg127 <= wire101[(4'he):(4'hc)];
            end
          else
            begin
              reg123 <= ((wire120[(2'h3):(2'h3)] ^~ reg103) ?
                  wire111[(3'h4):(2'h2)] : $unsigned((wire119 ^ (8'ha6))));
              reg124 <= wire111;
              reg125 <= (reg127[(4'he):(3'h6)] << (({$signed(reg125),
                      (!reg127)} ?
                  (|(^reg105)) : ($unsigned((8'ha2)) * (wire112 ^~ reg103))) != reg122));
              reg126 <= (~^wire118);
            end
          reg128 <= {$unsigned(wire114),
              $signed($signed(($signed(reg109) ?
                  (reg108 ? reg121 : reg124) : (reg126 ^~ wire114))))};
        end
      else
        begin
          reg122 <= $signed((~|$signed((reg109 ^ $unsigned(wire119)))));
          reg123 <= ($signed((wire100 ?
              (~&(~&reg125)) : {(^~(8'hb1))})) >> $unsigned((~&wire101[(4'ha):(1'h0)])));
          if (($unsigned(wire114[(2'h2):(2'h2)]) ?
              (reg121[(2'h2):(1'h0)] ?
                  ($signed((wire113 << wire110)) <<< (~|reg105)) : ((wire120[(4'hc):(3'h5)] ?
                          ((8'haa) & (8'h9c)) : (reg104 & wire113)) ?
                      ($unsigned(wire110) ?
                          (reg125 >> wire97) : reg127) : reg122[(3'h5):(1'h0)])) : wire110[(3'h6):(1'h1)]))
            begin
              reg124 <= reg122[(4'h9):(1'h0)];
              reg125 <= (!wire113[(3'h5):(1'h0)]);
              reg126 <= {$unsigned((&$unsigned((!wire119)))),
                  ($unsigned(wire99[(3'h5):(1'h1)]) ?
                      ((~^(reg103 >= reg106)) <<< reg123[(1'h0):(1'h0)]) : $signed((reg125[(3'h5):(3'h5)] == (reg105 ?
                          wire118 : (8'ha7)))))};
            end
          else
            begin
              reg124 <= (((~|(wire117 ? wire117 : $unsigned(reg109))) ?
                  reg121 : (($unsigned(wire116) ?
                      reg127 : (wire116 > wire115)) << reg124)) || $signed((($unsigned(reg127) ?
                      {reg104} : ((8'hbf) ? wire116 : wire116)) ?
                  (~(8'ha3)) : ((~|reg108) ^~ $unsigned(reg128)))));
            end
          if ($unsigned(reg107[(3'h6):(3'h5)]))
            begin
              reg127 <= $signed($signed(reg122));
              reg128 <= (($signed((^(&wire100))) >>> $signed(wire102)) ?
                  {(~reg105),
                      (&({reg106, reg122} - {wire97,
                          wire110}))} : {(~|wire118[(3'h7):(3'h6)])});
              reg129 <= (~&$unsigned((((reg108 ~^ wire100) ?
                      (~|reg106) : reg107[(2'h2):(2'h2)]) ?
                  ($signed((8'hb0)) ?
                      reg128[(1'h1):(1'h1)] : $unsigned(reg122)) : wire117)));
            end
          else
            begin
              reg127 <= reg104[(3'h6):(3'h5)];
              reg128 <= (({wire117, (|$signed(reg109))} ?
                      $unsigned(reg123) : (8'hb5)) ?
                  ((wire115[(3'h6):(3'h6)] ?
                          (~^((8'ha5) != (8'hbb))) : ($signed(reg107) ?
                              wire114[(1'h0):(1'h0)] : $signed(reg103))) ?
                      reg104[(1'h0):(1'h0)] : reg106[(5'h10):(4'h9)]) : wire110[(2'h3):(1'h0)]);
            end
        end
    end
  assign wire130 = (reg127 >= reg108[(5'h10):(3'h4)]);
  assign wire131 = wire101[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if (($signed($signed(wire131)) ? wire120[(2'h2):(1'h1)] : (8'ha6)))
        begin
          if ((wire119[(3'h4):(1'h1)] >> (8'ha8)))
            begin
              reg132 <= ($unsigned((^~$unsigned($unsigned(wire117)))) && {(reg127 ?
                      reg106[(4'h9):(4'h9)] : wire101)});
              reg133 <= $unsigned($signed($unsigned({(-reg105)})));
              reg134 <= $unsigned(({$unsigned($unsigned(reg105)),
                  (^~(wire112 || wire130))} == $signed(((wire113 ?
                      reg107 : wire99) ?
                  (^~wire100) : (^wire119)))));
              reg135 <= wire115[(1'h1):(1'h0)];
            end
          else
            begin
              reg132 <= ($signed($unsigned(wire130)) < $unsigned((((reg132 >= wire118) ?
                  (wire100 ?
                      reg104 : wire115) : $unsigned(wire101)) == ((wire130 ?
                  reg107 : wire101) < (wire98 <= wire101)))));
              reg133 <= (8'hab);
              reg134 <= $signed((~$unsigned($signed($unsigned(reg103)))));
              reg135 <= $signed({(8'hb0), (!$signed((8'hab)))});
            end
          reg136 <= ($unsigned($signed(reg125[(4'hc):(2'h2)])) ^ (wire117[(3'h5):(2'h3)] || wire114));
          reg137 <= $signed({reg107[(4'hc):(3'h7)], wire111[(2'h3):(2'h3)]});
        end
      else
        begin
          reg132 <= reg124[(3'h5):(2'h3)];
        end
      if (wire120[(3'h7):(3'h5)])
        begin
          reg138 <= reg128[(2'h2):(2'h2)];
          reg139 <= wire97[(2'h2):(2'h2)];
        end
      else
        begin
          if (((reg121[(3'h6):(2'h2)] ?
              ((|$unsigned(reg122)) > (((8'h9d) << wire118) && wire98[(4'hd):(4'hd)])) : reg134[(4'h8):(3'h7)]) ^~ reg133))
            begin
              reg138 <= $unsigned((~(8'hba)));
              reg139 <= $signed(reg137);
              reg140 <= $unsigned(((8'hab) <<< ({(wire115 >>> wire112)} ?
                  {(~^wire119),
                      (wire101 ^ (8'hbc))} : (wire110 < wire116[(2'h3):(1'h1)]))));
              reg141 <= wire112;
              reg142 <= (7'h44);
            end
          else
            begin
              reg138 <= ({(~&(wire111 >> $signed(wire101)))} ?
                  (&$unsigned((~|(wire110 << wire120)))) : reg134[(4'hc):(3'h6)]);
              reg139 <= (reg128 | reg125);
            end
          if ((reg124 + reg124[(3'h5):(2'h2)]))
            begin
              reg143 <= $unsigned(reg141[(5'h14):(5'h12)]);
              reg144 <= $unsigned((wire114 ^~ (-$signed($signed(wire98)))));
              reg145 <= (+wire98[(5'h11):(4'ha)]);
              reg146 <= reg140;
              reg147 <= (^~(~&reg135[(1'h1):(1'h0)]));
            end
          else
            begin
              reg143 <= reg122[(1'h0):(1'h0)];
              reg144 <= ((reg136[(4'hb):(4'h9)] ?
                      reg145 : (^~(wire114 ?
                          {reg145} : reg140[(5'h12):(5'h10)]))) ?
                  $signed((wire100 ?
                      wire111[(3'h4):(3'h4)] : $signed((~^wire119)))) : wire101);
              reg145 <= $unsigned(((((wire130 ? reg107 : wire118) ?
                      reg146[(3'h6):(1'h1)] : (~^wire130)) <= (7'h40)) ?
                  wire111[(4'h9):(2'h2)] : {((&wire97) ? (!reg124) : reg105)}));
            end
        end
      reg148 <= $signed(wire98);
      reg149 <= $signed($unsigned($signed(($unsigned(reg145) & (reg107 ?
          wire99 : wire120)))));
      reg150 <= ($unsigned($unsigned(($unsigned(reg145) ?
          $unsigned(reg105) : wire131[(4'h9):(3'h5)]))) ^ reg107);
    end
  assign wire151 = (8'hb8);
  assign wire152 = (^reg129);
  assign wire153 = $unsigned($signed((reg103 ?
                       reg126 : $unsigned($unsigned(wire130)))));
endmodule
