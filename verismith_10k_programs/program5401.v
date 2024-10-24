module top
#(parameter param179 = {{({((7'h42) <= (8'hb2)), (!(8'ha6))} >>> (^~(~&(8'ha1)))), {((~&(8'h9f)) && ((8'had) || (8'had))), ((!(8'hab)) * ((8'ha4) != (8'haf)))}}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire [(2'h2):(1'h0)] wire170;
  wire signed [(4'hb):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(5'h14):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg171 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire36,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire5 = $signed((~|((+(-(8'hb0))) ~^ ($signed(wire2) ?
                     wire1[(5'h13):(4'hb)] : $signed(wire2)))));
  assign wire6 = ($unsigned((~^$unsigned((+wire0)))) ?
                     $unsigned(wire5[(2'h3):(1'h0)]) : $signed(wire0[(3'h6):(1'h1)]));
  assign wire7 = wire1[(4'ha):(3'h5)];
  assign wire8 = wire6;
  assign wire9 = wire2;
  assign wire10 = wire9[(3'h4):(2'h2)];
  assign wire11 = $signed(($unsigned($signed((wire6 ? wire4 : wire7))) ?
                      wire7[(4'h9):(3'h7)] : (-$unsigned($unsigned((8'h9d))))));
  assign wire12 = (wire5[(2'h3):(1'h1)] ?
                      $signed((wire3[(2'h2):(2'h2)] >>> wire10[(3'h7):(3'h5)])) : $unsigned($unsigned(wire2[(3'h6):(1'h1)])));
  assign wire13 = (&(~{$unsigned(wire3[(1'h0):(1'h0)]),
                      (wire6[(3'h5):(3'h4)] >> wire10[(3'h4):(1'h1)])}));
  module14 #() modinst37 (.wire18(wire3), .y(wire36), .wire16(wire10), .clk(clk), .wire17(wire2), .wire15(wire6));
  module38 #() modinst167 (.wire42(wire3), .wire40(wire8), .y(wire166), .clk(clk), .wire41(wire6), .wire39(wire13));
  assign wire168 = ((~&wire7[(5'h12):(4'h8)]) ?
                       $signed(($unsigned({wire5}) ?
                           ($unsigned(wire166) ?
                               (wire36 ? wire8 : wire36) : (wire4 ?
                                   wire13 : wire12)) : $unsigned($unsigned(wire11)))) : {wire9[(4'hb):(1'h0)],
                           wire1[(3'h6):(3'h6)]});
  assign wire169 = (~&($signed($unsigned((wire168 ? wire8 : wire5))) ?
                       $unsigned(wire168[(4'h9):(2'h3)]) : (~(-(~wire168)))));
  assign wire170 = (~|wire9);
  always
    @(posedge clk) begin
      reg171 <= $signed(wire7[(4'hf):(4'hf)]);
      reg172 <= wire2[(5'h13):(2'h3)];
      reg173 <= {(8'h9d), $unsigned($unsigned((~&{wire5})))};
      reg174 <= wire2[(4'ha):(3'h5)];
    end
  assign wire175 = wire9;
  assign wire176 = wire8[(3'h7):(3'h6)];
  assign wire177 = reg171;
  assign wire178 = wire13[(4'h9):(1'h0)];
endmodule

module module38
#(parameter param165 = (~(((+((8'hb8) ? (8'ha6) : (8'ha2))) + {(-(8'hbd))}) ? (((8'hba) ~^ ((8'haa) ^ (7'h44))) ? {(~&(8'hb4))} : (((8'hbc) ? (8'h9c) : (8'hb3)) >= (~^(8'hb6)))) : (~&{((8'hb5) ? (8'ha0) : (8'hbb)), ((7'h43) ? (8'h9c) : (7'h40))}))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire signed [(5'h11):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire143;
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire99,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire143,
                 reg164,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire42[(1'h1):(1'h1)])
        begin
          reg43 <= $signed(wire41[(4'he):(2'h2)]);
          reg44 <= $unsigned((-(-{$signed(reg43), wire41[(4'hd):(2'h3)]})));
          reg45 <= (wire41 ?
              ($signed((wire42 > (~&(8'hb5)))) ?
                  $signed(reg44[(3'h4):(1'h1)]) : (^{reg43})) : reg44);
        end
      else
        begin
          reg43 <= {($signed($signed(reg44[(2'h3):(2'h2)])) ?
                  wire41[(5'h11):(3'h6)] : (+wire39[(3'h5):(1'h0)])),
              $signed($unsigned($unsigned((wire39 || wire40))))};
          if (((wire39 ?
              ((reg44 ?
                  (+reg43) : wire41[(4'h9):(3'h5)]) < $unsigned($signed(reg45))) : (~&$unsigned((8'hbd)))) ^~ wire39))
            begin
              reg44 <= reg44[(3'h7):(1'h1)];
            end
          else
            begin
              reg44 <= {$unsigned($unsigned(wire40[(1'h1):(1'h0)]))};
              reg45 <= (wire42 ?
                  ($unsigned($unsigned($unsigned(reg45))) + (-(!$unsigned(wire39)))) : (8'hb8));
              reg46 <= ($unsigned({$unsigned((8'hbd)),
                  ({reg45, (8'hb1)} >> reg43)}) * reg43[(4'hd):(1'h1)]);
              reg47 <= ($signed($signed((+(~^wire39)))) ?
                  (wire41 <<< $unsigned((~|reg45[(3'h7):(2'h2)]))) : ((((wire42 && (8'hb7)) >>> $signed(reg44)) ?
                      $signed($signed(wire40)) : reg43) + (-wire42[(1'h0):(1'h0)])));
              reg48 <= (reg46 ?
                  {(({reg44} != (reg44 ? reg44 : reg43)) ?
                          $unsigned(reg47[(3'h4):(2'h2)]) : {$unsigned(reg43),
                              (wire41 || wire42)})} : $unsigned(reg45));
            end
          if (reg47[(3'h5):(2'h3)])
            begin
              reg49 <= wire41[(4'hb):(3'h7)];
              reg50 <= (~|($signed((wire40 ? reg45[(4'hd):(4'hd)] : wire39)) ?
                  wire39[(2'h2):(1'h0)] : ((~(|reg43)) ?
                      wire41[(3'h6):(3'h6)] : ($unsigned(reg47) ?
                          $signed(reg46) : reg47[(4'hb):(1'h0)]))));
              reg51 <= ((($unsigned((reg43 == wire41)) ?
                  (~|(!reg48)) : (reg50[(3'h4):(2'h3)] ?
                      $signed(reg50) : (reg44 ?
                          reg47 : reg49))) << reg43) < (wire40[(1'h1):(1'h1)] ?
                  (((-reg44) ? wire41 : (~(8'hbf))) ?
                      (8'haa) : $signed({wire40,
                          reg48})) : ({((8'h9c) ^ (8'ha8))} ?
                      $signed(((8'hbb) ? wire40 : reg46)) : (~(reg50 ?
                          wire42 : reg44)))));
            end
          else
            begin
              reg49 <= ((^$signed($signed(wire42[(3'h5):(3'h4)]))) ?
                  (~{{$signed(wire40)}}) : reg51);
              reg50 <= $signed($signed(reg44[(1'h0):(1'h0)]));
              reg51 <= reg43[(3'h7):(3'h6)];
            end
          reg52 <= wire41;
        end
      reg53 <= ($signed(wire40[(1'h0):(1'h0)]) ?
          (reg43 || wire42) : ($signed(($unsigned(reg45) + (reg49 ?
                  (8'hb6) : reg48))) ?
              (+$signed(((8'hbe) && (8'hac)))) : ((!reg43[(4'hb):(4'h8)]) ?
                  $unsigned(reg47[(4'ha):(4'h8)]) : {(~&reg44)})));
    end
  assign wire54 = $unsigned((~|$signed($signed($signed(wire41)))));
  assign wire55 = (^wire42);
  assign wire56 = $signed({(reg44[(3'h5):(3'h4)] ?
                          (wire55 ? reg43 : $signed(reg48)) : ({reg53,
                              wire42} << (reg48 ? (8'hb8) : wire55))),
                      ((~&reg53) ?
                          (reg52 ?
                              (~|reg50) : reg53[(1'h1):(1'h0)]) : (-wire41))});
  assign wire57 = reg45;
  assign wire58 = ((~|$unsigned($signed($unsigned(reg46)))) ^~ wire39[(2'h3):(1'h1)]);
  assign wire59 = $unsigned($signed($unsigned(reg45[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg60 <= wire55;
      reg61 <= {wire58[(2'h2):(2'h2)]};
      reg62 <= (((~|reg61[(1'h0):(1'h0)]) ?
              {(reg43[(5'h11):(1'h1)] > reg51[(3'h7):(3'h7)])} : $unsigned(reg61)) ?
          $signed($unsigned($unsigned((reg52 ?
              reg48 : reg60)))) : (reg52[(3'h5):(1'h1)] ?
              {wire41[(4'h9):(3'h5)]} : {reg48}));
      if (wire41)
        begin
          reg63 <= $unsigned(reg49);
          reg64 <= (~|($unsigned($signed((!reg49))) | (((~wire40) ?
              $signed(wire57) : $unsigned(wire57)) + reg50)));
          reg65 <= reg46[(5'h12):(5'h11)];
          reg66 <= $signed((wire40[(1'h1):(1'h1)] ?
              $unsigned(reg53[(4'hc):(1'h1)]) : $unsigned((^reg53))));
        end
      else
        begin
          reg63 <= reg43[(1'h0):(1'h0)];
          reg64 <= ((reg64[(2'h3):(1'h0)] ?
                  ($signed((reg63 ? reg45 : reg47)) ?
                      (wire42 ?
                          $signed(reg66) : (wire55 ~^ (8'ha9))) : ((8'ha7) ?
                          $signed(wire59) : {reg63,
                              reg64})) : {($signed((7'h44)) ~^ (~&(8'h9d)))}) ?
              reg62 : (!$unsigned(wire55[(2'h2):(1'h0)])));
          reg65 <= reg64[(3'h7):(2'h3)];
          reg66 <= (8'ha0);
        end
    end
  module67 #() modinst100 (wire99, clk, wire40, wire41, wire39, wire58, wire54);
  module101 #() modinst144 (wire143, clk, reg46, wire42, reg47, reg65, reg53);
  assign wire145 = {((-(((8'hb3) ? reg53 : (8'h9d)) ?
                           wire58 : reg50[(2'h3):(2'h2)])) + $signed($signed($signed(reg49)))),
                       wire55[(4'h8):(3'h7)]};
  assign wire146 = $unsigned((8'hbe));
  assign wire147 = (reg45[(4'hb):(3'h4)] <<< {(reg51 * $unsigned((reg44 <= wire54))),
                       $unsigned(reg44)});
  assign wire148 = ($signed($unsigned({(!reg47)})) - $signed(wire147));
  assign wire149 = wire42[(1'h1):(1'h1)];
  assign wire150 = (7'h43);
  always
    @(posedge clk) begin
      reg151 <= ((8'haa) & wire147[(1'h0):(1'h0)]);
      reg152 <= {{$signed($signed((reg49 * reg47))), reg62[(1'h1):(1'h1)]},
          wire42[(3'h7):(3'h5)]};
      if ((((~|(wire39 ? (+wire143) : $signed(wire147))) ^~ reg52) * (|reg152)))
        begin
          if ($signed(reg65))
            begin
              reg153 <= wire99[(3'h6):(3'h6)];
              reg154 <= (8'hb8);
              reg155 <= (-$unsigned($unsigned(((reg49 ? reg61 : reg64) ?
                  (reg47 ^ wire147) : reg52))));
              reg156 <= ({{$unsigned(wire58[(5'h12):(4'hc)])}} && {$unsigned(reg153)});
            end
          else
            begin
              reg153 <= wire40[(4'hc):(1'h0)];
              reg154 <= (|reg64[(1'h1):(1'h0)]);
              reg155 <= $signed(reg154);
            end
          reg157 <= wire146;
          reg158 <= (reg52 ?
              ({{(&wire39),
                      $unsigned((7'h42))}} >> $unsigned(((wire146 <= reg43) ?
                  wire150[(4'hf):(1'h0)] : wire59[(5'h10):(3'h6)]))) : reg157);
          reg159 <= reg151[(3'h6):(2'h2)];
        end
      else
        begin
          if ((reg159[(2'h2):(1'h1)] ?
              $signed(reg153[(4'h9):(4'h9)]) : $unsigned((reg51 ?
                  reg159[(4'hc):(4'hc)] : wire54))))
            begin
              reg153 <= $unsigned($unsigned($unsigned($unsigned(reg159[(3'h6):(1'h1)]))));
              reg154 <= wire40;
            end
          else
            begin
              reg153 <= (($unsigned($signed(reg43[(2'h3):(1'h0)])) ?
                  $signed(($unsigned(reg153) ?
                      ((8'hb3) ?
                          reg61 : wire150) : (reg159 >= reg159))) : reg66) <<< wire149[(2'h2):(1'h1)]);
              reg154 <= {(($unsigned(reg44[(3'h6):(1'h0)]) ?
                          {(|wire148)} : ({reg65} - wire59)) ?
                      (^((reg52 >> wire57) ^~ (wire58 | reg155))) : $unsigned($signed(((8'hb3) < wire40)))),
                  (!wire57)};
              reg155 <= (^$signed((+($signed(reg159) ?
                  (!reg47) : $signed(wire150)))));
            end
          reg156 <= wire57[(3'h6):(3'h4)];
        end
      reg160 <= (wire99[(1'h0):(1'h0)] <<< wire59[(3'h5):(2'h3)]);
    end
  assign wire161 = wire39;
  assign wire162 = ($unsigned({{(reg52 - reg155)}, (-$signed(reg151))}) ?
                       $signed(reg62) : (~reg65));
  assign wire163 = $unsigned(((~|(~((7'h43) <= wire58))) ?
                       reg64[(4'hb):(4'hb)] : reg43));
  always
    @(posedge clk) begin
      reg164 <= {{{reg152, {(wire39 ^~ reg53)}}}};
    end
endmodule

module module14
#(parameter param35 = (!((((^(8'ha3)) ? (+(8'hbb)) : (^~(8'hbe))) ~^ (^(-(8'h9e)))) ? ((((8'hb8) | (7'h41)) + (+(8'hbe))) && (((7'h40) ? (8'ha5) : (8'ha1)) - ((8'ha4) - (8'ha4)))) : (~^((8'hbc) << (8'haa))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire19;
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = wire18[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= $unsigned(((~$unsigned($signed(wire16))) ?
          ((wire15 ?
              (wire15 - (7'h40)) : (~wire15)) < $signed((wire17 == wire18))) : wire15));
      reg21 <= {($signed({wire17}) ?
              ({$unsigned((7'h42)), wire19} ?
                  wire15[(3'h5):(1'h0)] : (~wire16)) : {wire16[(2'h2):(1'h0)]})};
      reg22 <= wire16[(3'h5):(3'h4)];
      if ((reg20[(1'h1):(1'h0)] != (|{$signed(wire19)})))
        begin
          reg23 <= ((8'hb2) > $signed(wire18));
        end
      else
        begin
          reg23 <= (~(!wire16));
        end
      if (reg22[(2'h3):(2'h2)])
        begin
          reg24 <= reg21;
          reg25 <= (^wire16);
          reg26 <= {(+(^{$unsigned(reg23)}))};
        end
      else
        begin
          reg24 <= ($signed($unsigned($unsigned((wire17 ?
              wire17 : reg26)))) ~^ wire17);
        end
    end
  assign wire27 = {((+(~&$signed(wire16))) >= $unsigned((wire16 >= (^~reg25)))),
                      $unsigned((($signed((8'ha1)) >> reg24[(1'h1):(1'h0)]) >= ((~reg20) ~^ (8'hb3))))};
  assign wire28 = (~^wire17);
  assign wire29 = (~^reg25[(3'h7):(2'h2)]);
  assign wire30 = $signed(wire28[(1'h0):(1'h0)]);
  assign wire31 = (~&wire16[(2'h3):(1'h1)]);
  assign wire32 = ((($unsigned((^(8'ha6))) - reg25) * wire31) >= $unsigned(wire15));
  assign wire33 = $signed(((wire31 ? wire30 : wire30) ?
                      {wire15, $signed($signed(reg22))} : $signed(((|(8'hbe)) ?
                          $unsigned(wire17) : (reg22 ? wire19 : wire30)))));
  assign wire34 = ($signed(reg23) | reg23[(1'h1):(1'h0)]);
endmodule

module module101
#(parameter param142 = (((~(!((8'h9e) && (8'ha3)))) & (^(((8'ha3) != (8'had)) ? ((8'haf) ? (8'ha5) : (8'hb9)) : ((8'ha1) + (7'h43))))) >>> ((((8'hb5) <<< {(8'hb0)}) < {(|(8'had))}) ? (({(8'hb9), (8'hb2)} ? ((8'ha8) ^ (8'hb6)) : ((8'ha7) >= (8'hb2))) ? (((8'ha7) ? (8'had) : (8'h9f)) && (~^(8'haf))) : (((8'hb7) ^ (8'hbc)) ? ((8'hb1) || (8'hb5)) : (|(8'hb3)))) : (~^(8'h9c)))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire106;
  input wire signed [(4'hf):(1'h0)] wire105;
  input wire [(3'h6):(1'h0)] wire104;
  input wire [(3'h5):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire123,
                 wire122,
                 wire121,
                 wire108,
                 wire107,
                 reg137,
                 reg136,
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
                 (1'h0)};
  assign wire107 = wire105;
  assign wire108 = $unsigned((8'hab));
  always
    @(posedge clk) begin
      if (((+(wire104[(2'h2):(1'h1)] ?
          $signed((wire108 ? wire108 : wire106)) : ((wire105 != (8'haf)) ?
              {wire105, (8'hb5)} : (wire107 ?
                  wire105 : (8'hbc))))) + (~|wire107[(3'h4):(1'h1)])))
        begin
          reg109 <= (~^wire107[(3'h7):(3'h6)]);
          reg110 <= wire108[(4'hc):(3'h6)];
        end
      else
        begin
          reg109 <= wire106;
          reg110 <= {(^~wire105), $signed($unsigned(wire102))};
          if ((!wire104))
            begin
              reg111 <= {(wire103 | ({{wire104}, {reg110}} ?
                      wire103[(2'h3):(1'h1)] : $signed(wire104[(3'h5):(3'h4)]))),
                  ($unsigned(((wire107 + wire105) <= wire105)) ?
                      (~wire106) : $unsigned(wire105))};
              reg112 <= reg110[(1'h1):(1'h1)];
              reg113 <= ((wire102 || (8'had)) >= $unsigned(reg110[(1'h0):(1'h0)]));
              reg114 <= $unsigned({(&((8'hab) ? wire105 : (|(8'haf))))});
            end
          else
            begin
              reg111 <= {$unsigned(($signed(reg112) < $unsigned($unsigned(reg112))))};
              reg112 <= reg113[(3'h4):(1'h0)];
              reg113 <= (!(&(^~(^{reg109, (7'h42)}))));
              reg114 <= (~(reg114 ?
                  (~(~&(wire106 ? wire107 : wire102))) : (($unsigned(wire103) ?
                      (~(8'ha5)) : (^~wire104)) >= {(^~(8'h9c)),
                      wire105[(4'h8):(3'h7)]})));
            end
          reg115 <= (+reg109[(4'h8):(3'h5)]);
        end
      reg116 <= ((~&(((wire104 ? reg112 : (8'ha5)) ^ wire104) >> (-wire107))) ?
          {$unsigned(reg110[(1'h0):(1'h0)]),
              ($unsigned((!reg111)) ?
                  {(wire105 ?
                          reg115 : (8'ha3))} : $unsigned((wire105 >= wire105)))} : wire103[(2'h2):(1'h0)]);
      if ($signed(reg114))
        begin
          reg117 <= ($unsigned((&($unsigned(reg114) ?
              (-wire108) : $unsigned((8'ha0))))) < ($unsigned($unsigned($unsigned(wire102))) && reg116));
          reg118 <= (reg115[(3'h6):(2'h3)] ?
              (reg111 <= (8'hb8)) : $signed($unsigned((|$signed((8'had))))));
        end
      else
        begin
          reg117 <= reg115[(3'h5):(1'h1)];
          reg118 <= reg115;
          reg119 <= reg118[(3'h4):(3'h4)];
        end
      reg120 <= reg118[(4'h9):(3'h4)];
    end
  assign wire121 = (((8'hb5) > ((8'haf) > ({wire103} ~^ {(8'hbb), reg120}))) ?
                       (($unsigned((~^reg113)) == ((^~(7'h40)) ?
                               ((8'haa) ? wire107 : reg117) : {wire106,
                                   reg120})) ?
                           ({(reg115 * reg117), (reg109 ? (8'hac) : wire102)} ?
                               $unsigned($unsigned(reg116)) : (~^(reg112 ^ reg119))) : $unsigned(($signed(reg113) ?
                               (8'hb9) : (~|reg109)))) : ($unsigned($signed($signed(wire102))) ?
                           ((reg118 && (8'haa)) ?
                               ((^~(8'haa)) <<< {reg114, reg115}) : (wire104 ?
                                   $unsigned(wire104) : $unsigned(reg109))) : {$signed({wire106})}));
  assign wire122 = ({$signed($unsigned((wire108 ? reg119 : (8'hb4)))),
                           {reg117}} ?
                       reg115[(2'h3):(2'h3)] : $signed(reg112[(4'hf):(4'ha)]));
  assign wire123 = reg116;
  always
    @(posedge clk) begin
      if ($unsigned((reg112 ?
          (wire107 ^~ $signed((7'h40))) : ($unsigned({wire106, wire102}) ?
              ((reg109 ? reg114 : reg112) ?
                  $unsigned((8'ha1)) : (reg112 ?
                      (8'h9e) : reg115)) : $unsigned($signed((8'hba)))))))
        begin
          reg124 <= $unsigned($unsigned(reg112));
          reg125 <= $unsigned((($signed(reg113[(4'ha):(2'h3)]) ?
              (~&(wire107 != (8'hb9))) : ($unsigned((8'hba)) * {reg112,
                  reg120})) || (((reg115 ~^ reg113) - $unsigned((8'ha2))) ?
              ($unsigned(reg111) ~^ $signed(wire107)) : reg120[(2'h3):(1'h0)])));
        end
      else
        begin
          reg124 <= {{(+(reg115[(2'h3):(2'h2)] ?
                      $unsigned(reg110) : (reg117 ? reg116 : wire108)))},
              $signed(((reg117[(1'h0):(1'h0)] ?
                  (reg111 * wire104) : reg109[(4'h9):(1'h1)]) * (7'h41)))};
          reg125 <= $unsigned((reg113 ?
              {reg120, $unsigned((+(8'hb2)))} : (^~(~(wire104 == reg117)))));
          reg126 <= wire105[(2'h2):(1'h1)];
        end
      reg127 <= (|reg110[(2'h3):(1'h0)]);
      reg128 <= ((reg111 || (^(wire107 ^~ {wire103, reg120}))) ?
          ((&(~|((8'ha7) ?
              reg118 : reg126))) >= $signed(reg126[(1'h1):(1'h1)])) : ($signed({(reg118 != (8'hb3)),
                  (~|reg115)}) ?
              $signed((((8'haf) ?
                  reg110 : wire121) | reg124[(4'h9):(3'h7)])) : (wire122 ?
                  wire108 : (wire121 - (~|(8'had))))));
    end
  always
    @(posedge clk) begin
      reg129 <= (~(|(+(wire103 ? (~&wire105) : (8'h9f)))));
      if ((^~(&(wire103 << $unsigned((reg116 && reg111))))))
        begin
          reg130 <= ($signed(reg113[(3'h4):(1'h0)]) ?
              (~^wire105) : $unsigned(($signed((reg118 ?
                  wire102 : reg110)) || (^~$signed(reg113)))));
          reg131 <= ($unsigned($signed(reg113[(4'hc):(1'h1)])) * $unsigned((reg120[(1'h1):(1'h0)] >= (reg127 & wire108))));
        end
      else
        begin
          reg130 <= wire103[(2'h3):(2'h2)];
          if (((wire104 ~^ wire104[(3'h6):(3'h6)]) ^ $unsigned({$signed((wire105 ?
                  reg111 : reg119))})))
            begin
              reg131 <= ((reg131[(1'h0):(1'h0)] ?
                  $unsigned($unsigned($unsigned(wire123))) : {$unsigned(reg125),
                      $unsigned((reg131 >= wire105))}) << wire122);
            end
          else
            begin
              reg131 <= $signed(reg112);
              reg132 <= reg129;
              reg133 <= $signed((8'hb4));
            end
          if ((reg115 ?
              reg124[(5'h11):(2'h2)] : (($signed((~&reg117)) << reg129[(4'ha):(3'h5)]) - (^((wire102 ?
                  wire102 : reg130) > wire104)))))
            begin
              reg134 <= (&(^reg130[(1'h1):(1'h1)]));
            end
          else
            begin
              reg134 <= (reg115[(4'h9):(4'h9)] ?
                  $unsigned(((wire103 - $signed(wire108)) ?
                      (wire107 ?
                          (reg115 - (7'h42)) : (7'h43)) : reg117)) : (~^(((!wire102) ?
                      $unsigned(reg110) : $signed(wire108)) <= (reg118 ?
                      (reg109 ? reg127 : reg134) : ((7'h41) * wire123)))));
              reg135 <= (wire106[(3'h4):(2'h2)] ?
                  ($unsigned($unsigned({wire123})) ?
                      $signed((~&$unsigned((8'hb0)))) : wire106[(5'h10):(5'h10)]) : (^~$signed(reg117[(2'h3):(1'h1)])));
            end
          reg136 <= reg124;
          reg137 <= wire107[(4'h9):(3'h7)];
        end
    end
  assign wire138 = $signed($unsigned($unsigned(wire103)));
  assign wire139 = $unsigned(wire123[(4'hb):(3'h7)]);
  assign wire140 = reg119;
  assign wire141 = (~&(+($signed(reg128) + $signed(reg128))));
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire signed [(4'he):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire [(5'h14):(1'h0)] wire69;
  input wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 reg84,
                 reg83,
                 reg82,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire73 = (~&(~|wire72[(4'h9):(3'h7)]));
  assign wire74 = {{(^{(wire71 ? wire69 : wire70), wire72[(3'h5):(2'h2)]}),
                          wire73[(3'h4):(1'h1)]}};
  always
    @(posedge clk) begin
      reg75 <= ({(wire70 ?
              ((^wire72) << $unsigned(wire73)) : ((7'h40) * $signed(wire69)))} << {(~^$unsigned(wire68))});
      reg76 <= wire72[(4'hd):(2'h2)];
      reg77 <= {reg75[(2'h2):(2'h2)]};
    end
  assign wire78 = wire71[(4'ha):(3'h6)];
  assign wire79 = ($unsigned(wire74[(2'h3):(2'h2)]) >> $signed((8'h9f)));
  assign wire80 = $unsigned({(reg77 & wire72[(4'ha):(1'h0)])});
  assign wire81 = (wire78 | (wire71[(1'h0):(1'h0)] ?
                      reg77[(3'h4):(1'h0)] : ((~&{wire78, wire68}) ?
                          (wire68 >>> (|wire69)) : wire72)));
  always
    @(posedge clk) begin
      reg82 <= $signed($signed($unsigned(((wire73 ?
          (8'hbb) : wire73) == (wire80 ? wire69 : (8'hae))))));
      reg83 <= (|$signed($unsigned(((+wire68) < ((8'haa) << wire81)))));
      reg84 <= reg82[(1'h0):(1'h0)];
    end
  assign wire85 = $signed((wire69 > {(~((8'h9d) ? wire74 : wire80))}));
  assign wire86 = $unsigned({(^wire71[(3'h4):(1'h0)]),
                      {$signed($signed(reg83)),
                          ((~&wire73) ^~ reg84[(1'h1):(1'h0)])}});
  assign wire87 = ((8'hb2) ~^ wire73[(3'h5):(3'h4)]);
  assign wire88 = (wire87[(2'h2):(1'h0)] < ((7'h43) >= reg75));
  assign wire89 = (8'hb0);
  assign wire90 = ((~&$unsigned(reg77[(3'h7):(1'h0)])) <= ((~&$unsigned((reg76 ?
                      wire89 : (8'had)))) | (|wire87[(4'h9):(1'h1)])));
  assign wire91 = (~^(^((~^$signed(wire80)) ^~ wire90)));
  assign wire92 = $signed({wire87});
  assign wire93 = reg76;
  assign wire94 = (^~((8'ha9) ?
                      (8'ha4) : (-$unsigned(((8'hba) ? wire91 : wire78)))));
  assign wire95 = (($signed({(^wire78),
                      (wire72 ?
                          reg77 : wire85)}) | reg84[(4'h9):(1'h0)]) && (+($unsigned(((8'ha5) ?
                          reg82 : wire89)) ?
                      wire72[(3'h7):(3'h6)] : wire89)));
  assign wire96 = $unsigned($unsigned((|(~(^wire69)))));
  assign wire97 = wire69[(4'h8):(3'h5)];
  assign wire98 = (((($unsigned(reg76) - (wire68 > (8'ha1))) || wire85[(4'h8):(2'h3)]) ?
                      (((^wire79) & wire90[(2'h2):(2'h2)]) ?
                          wire94 : wire87[(3'h7):(2'h2)]) : (!{reg84,
                          (wire68 ?
                              (8'hab) : wire74)})) + (+((wire68 ~^ $unsigned((8'hb8))) ?
                      wire70 : wire96)));
endmodule
