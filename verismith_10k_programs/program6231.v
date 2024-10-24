module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire203;
  wire signed [(2'h3):(1'h0)] wire201;
  wire signed [(4'hd):(1'h0)] wire200;
  wire [(4'he):(1'h0)] wire199;
  wire [(4'hf):(1'h0)] wire198;
  wire signed [(5'h12):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire194;
  reg signed [(5'h14):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg [(5'h10):(1'h0)] reg206 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire196,
                 wire194,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
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
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((~{$unsigned($signed((8'hb2)))}) ?
          wire2[(4'he):(1'h0)] : $unsigned((-((wire3 ? wire1 : wire4) ?
              wire1 : wire4))));
      reg6 <= $signed(wire0);
      reg7 <= wire4;
      reg8 <= $signed({$unsigned(($unsigned((8'hbf)) ? $signed(reg7) : reg6))});
    end
  always
    @(posedge clk) begin
      reg9 <= wire1[(4'hc):(4'h9)];
      if (wire0)
        begin
          reg10 <= (~&$unsigned($unsigned((wire2[(5'h10):(2'h2)] >> (wire2 ?
              wire0 : reg9)))));
          if (($signed($signed(reg6[(2'h2):(1'h0)])) <= $signed($unsigned(((reg5 ?
                  reg9 : wire4) ?
              wire0 : $signed(reg7))))))
            begin
              reg11 <= ($unsigned((((reg8 == reg6) ?
                  (7'h43) : (reg9 | wire1)) <= (reg7 ^~ $unsigned(reg10)))) <= $signed(reg5));
              reg12 <= ((({wire0[(2'h2):(1'h0)]} ?
                          $signed((reg6 <<< wire2)) : $signed((wire0 + reg6))) ?
                      {{$signed(wire1)}} : $signed(($unsigned(wire4) ?
                          reg11[(3'h7):(2'h2)] : (reg8 ? (8'hb3) : reg5)))) ?
                  ($signed(wire4) - $unsigned(((8'hac) ?
                      reg6[(1'h1):(1'h1)] : wire4[(1'h0):(1'h0)]))) : $unsigned((|((wire1 ?
                      wire1 : (8'hb2)) && (wire3 <<< wire3)))));
              reg13 <= (^((reg9 - $unsigned(reg6)) & (((reg7 != (8'hb6)) <<< $signed(reg11)) >> ((reg12 ?
                      reg12 : reg11) ?
                  reg5 : (reg8 << reg6)))));
              reg14 <= ((+reg6[(3'h4):(1'h1)]) < (^~{($signed(reg10) > (reg9 ?
                      (8'ha5) : (8'hb5))),
                  reg7[(3'h7):(1'h1)]}));
              reg15 <= (7'h40);
            end
          else
            begin
              reg11 <= {reg11, reg11};
              reg12 <= (^(|$signed($unsigned(((8'hbf) ~^ reg15)))));
              reg13 <= reg5;
            end
          reg16 <= $signed((reg5 >= {$unsigned((reg13 ? reg6 : reg12)),
              wire4}));
          reg17 <= (~|(reg6[(2'h2):(2'h2)] > reg16));
        end
      else
        begin
          reg10 <= reg7[(1'h0):(1'h0)];
          reg11 <= ((+$signed(reg16)) && $signed(reg7[(4'h9):(1'h1)]));
        end
      if ($signed(($signed($unsigned($signed(reg15))) ?
          reg12 : $signed({reg14[(3'h4):(2'h3)], $unsigned(wire0)}))))
        begin
          reg18 <= (($unsigned($signed(wire3[(1'h1):(1'h1)])) ~^ {(|reg16)}) ?
              $signed({$unsigned((wire1 ^~ reg13)),
                  {reg14[(1'h0):(1'h0)]}}) : $signed((~|((reg5 + reg9) << {wire4,
                  wire2}))));
          if ($signed(({(|{reg17, wire0}), $signed($signed(reg8))} ?
              $signed($signed(reg12)) : $signed($unsigned($unsigned(reg12))))))
            begin
              reg19 <= reg14;
            end
          else
            begin
              reg19 <= ((~^((|reg5[(2'h2):(1'h1)]) - wire2[(5'h11):(4'hd)])) || ((reg11[(4'h9):(4'h8)] >>> $signed((~^reg6))) ?
                  (((^reg14) ?
                      $signed(reg11) : $unsigned((8'ha0))) > reg16) : $signed((((8'ha5) ?
                          (8'hbf) : (8'hbe)) ?
                      $signed(reg12) : wire2[(5'h12):(3'h4)]))));
              reg20 <= ($signed($signed(reg15[(3'h5):(1'h1)])) << ($signed(reg10[(2'h2):(1'h0)]) ?
                  reg10[(1'h1):(1'h1)] : ({$unsigned(reg13), reg14} ?
                      $unsigned((reg15 >= reg17)) : {reg5[(1'h0):(1'h0)]})));
            end
          reg21 <= (reg11[(4'h8):(1'h0)] | $unsigned({$signed(wire2[(5'h11):(1'h0)]),
              wire3}));
          reg22 <= $unsigned(wire0[(1'h1):(1'h0)]);
          reg23 <= $signed(reg6[(4'hc):(3'h4)]);
        end
      else
        begin
          if ((+(reg22 ~^ $unsigned($unsigned(reg13)))))
            begin
              reg18 <= (8'hb6);
              reg19 <= (8'ha9);
              reg20 <= ($signed((~(!(~^(8'hb9))))) == reg15);
            end
          else
            begin
              reg18 <= $signed($unsigned((((reg23 ? reg23 : reg22) ?
                      (8'hbc) : reg22) ?
                  $unsigned((!wire3)) : reg10)));
            end
          reg21 <= $unsigned($signed($unsigned($signed({reg11, (8'ha2)}))));
        end
      reg24 <= reg11;
    end
  always
    @(posedge clk) begin
      reg25 <= wire3[(1'h0):(1'h0)];
      reg26 <= (((reg23 ? wire3 : $unsigned((^reg14))) + (~&$unsigned((reg22 ?
              wire0 : reg12)))) ?
          ({((reg17 != reg24) ? reg16[(2'h2):(1'h0)] : (reg11 * reg23)),
              {(reg8 ? reg9 : reg7)}} || (((^reg19) ? reg7 : (7'h44)) ?
              (~|$unsigned(reg22)) : (reg7[(3'h6):(3'h4)] + $unsigned(reg14)))) : $signed(($signed(reg6[(1'h0):(1'h0)]) <<< {$signed(reg20)})));
      reg27 <= $unsigned(reg18[(1'h0):(1'h0)]);
    end
  module28 #() modinst195 (wire194, clk, wire4, reg7, reg8, wire0, reg12);
  module144 #() modinst197 (wire196, clk, wire3, reg18, reg24, reg25, wire0);
  assign wire198 = reg18;
  assign wire199 = $unsigned({wire4[(1'h0):(1'h0)],
                       $unsigned($unsigned($signed(reg13)))});
  assign wire200 = wire196[(4'h9):(3'h4)];
  module62 #() modinst202 (wire201, clk, wire3, wire1, reg6, reg24, reg22);
  assign wire203 = $signed(wire0[(4'h8):(3'h6)]);
  assign wire204 = ({(7'h44), wire199[(3'h6):(3'h4)]} ?
                       $signed({($unsigned(reg26) && (!wire2)),
                           $signed($unsigned(reg12))}) : {(~&wire201),
                           $signed((!(&wire2)))});
  always
    @(posedge clk) begin
      reg205 <= ((reg13[(3'h5):(3'h4)] == $unsigned(reg14)) <<< (reg26 ?
          $unsigned(((&(8'ha0)) ?
              $unsigned(reg10) : ((7'h43) ?
                  reg5 : reg5))) : reg18[(5'h13):(4'hc)]));
      reg206 <= {(^~(8'h9d))};
      reg207 <= reg205[(3'h6):(3'h6)];
      reg208 <= wire194;
    end
endmodule

module module28
#(parameter param192 = (&(~({((8'h9e) ? (8'hb0) : (8'ha4))} + ((!(8'ha6)) ? {(8'hbb)} : (~&(8'had)))))), 
parameter param193 = ((^((-param192) ? (~^(param192 ? param192 : param192)) : ((param192 ? param192 : param192) >= (param192 ? param192 : param192)))) ? param192 : (-param192)))
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire190;
  wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire73;
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  assign y = {wire190,
                 wire168,
                 wire166,
                 wire142,
                 wire88,
                 wire87,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire61,
                 wire73,
                 reg171,
                 reg170,
                 reg169,
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
                 (1'h0)};
  assign wire34 = (~|wire33[(1'h0):(1'h0)]);
  assign wire35 = ($signed($signed((~$unsigned(wire31)))) << {wire32[(3'h4):(2'h3)],
                      wire34[(4'hf):(4'he)]});
  assign wire36 = $signed(wire29);
  assign wire37 = $unsigned((~&(wire35[(3'h4):(3'h4)] ?
                      (~wire35) : (~|{(8'ha0)}))));
  always
    @(posedge clk) begin
      if ((+(wire36[(3'h4):(3'h4)] || $signed($unsigned((-wire30))))))
        begin
          reg38 <= $unsigned($unsigned(wire36[(3'h5):(2'h2)]));
          if (reg38[(4'hd):(4'h9)])
            begin
              reg39 <= (~^wire30[(4'hb):(3'h5)]);
              reg40 <= (~&reg39);
              reg41 <= wire33;
              reg42 <= $unsigned((|(~&$signed((wire30 ? wire32 : wire34)))));
              reg43 <= $unsigned(((wire33 * $signed($signed(wire37))) ?
                  wire36 : (!(-wire33))));
            end
          else
            begin
              reg39 <= ((^~reg38) | {$signed(((wire30 && (8'h9d)) ?
                      (^reg40) : $signed(wire36))),
                  $unsigned((^~$signed(wire35)))});
              reg40 <= ($unsigned($unsigned($signed(reg39))) <<< reg41);
            end
          reg44 <= {reg41, reg40[(2'h2):(1'h0)]};
          reg45 <= (~&$signed({{(wire30 ^~ (8'h9d))},
              ((wire30 ? (8'hb1) : wire36) ?
                  $signed(wire30) : {reg41, wire35})}));
        end
      else
        begin
          reg38 <= (~^{(8'hb4)});
          reg39 <= ($signed(wire29) != ((+(+wire32[(1'h1):(1'h1)])) ?
              ((~&(8'ha6)) | $unsigned((8'hb1))) : reg38[(3'h7):(2'h2)]));
          if ({(8'ha5),
              $unsigned({$unsigned($signed(reg39)),
                  ((8'hb9) ? $signed(wire36) : $unsigned((7'h43)))})})
            begin
              reg40 <= wire34[(3'h7):(3'h5)];
              reg41 <= reg43[(4'ha):(4'h9)];
            end
          else
            begin
              reg40 <= $signed((~|(((reg38 | (8'ha7)) >= wire34[(4'h8):(4'h8)]) & {$signed(wire31),
                  $signed(wire35)})));
              reg41 <= (8'ha9);
            end
          reg42 <= reg41[(4'hc):(3'h7)];
          if ($unsigned(wire33[(2'h2):(2'h2)]))
            begin
              reg43 <= (~|(8'hb2));
              reg44 <= $signed((^~$signed(($signed(wire35) ?
                  $unsigned(wire37) : wire31[(3'h5):(1'h1)]))));
              reg45 <= $unsigned(($unsigned($unsigned((&wire32))) ?
                  $signed(($signed((8'hb2)) ?
                      (wire30 ?
                          wire31 : (8'hab)) : (reg40 >>> reg38))) : ($unsigned($signed(reg41)) << {reg43[(2'h3):(2'h3)]})));
              reg46 <= ($signed(($unsigned(((7'h40) ?
                  reg44 : reg43)) != wire29)) >= (8'ha0));
              reg47 <= ($unsigned(reg44[(4'h8):(2'h3)]) * wire35);
            end
          else
            begin
              reg43 <= wire34[(5'h10):(4'hb)];
            end
        end
      reg48 <= {$unsigned((((wire37 ? reg41 : reg42) ?
              (8'h9d) : (!(7'h42))) != reg47))};
      reg49 <= $unsigned(($signed($unsigned($signed((8'ha4)))) < $signed($unsigned((reg41 ?
          wire33 : (8'h9e))))));
      reg50 <= ($signed($unsigned({(wire32 ~^ reg38)})) ?
          reg46 : (+$unsigned(wire33)));
      reg51 <= (8'h9d);
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire31[(4'h8):(3'h6)]))
        begin
          if (($unsigned({(wire29[(3'h5):(3'h4)] ?
                      wire33[(2'h2):(2'h2)] : (wire29 >> wire30))}) ?
              reg47 : (((~|{reg42,
                  reg47}) >>> $signed(reg43[(4'hb):(3'h6)])) ^ reg38)))
            begin
              reg52 <= $signed(reg49[(3'h4):(1'h0)]);
              reg53 <= $unsigned((!wire30));
              reg54 <= $signed(reg49);
              reg55 <= ($unsigned(wire31[(2'h2):(2'h2)]) ~^ reg51[(1'h1):(1'h1)]);
              reg56 <= (~|($unsigned({(reg43 ?
                      (8'hbe) : reg52)}) * wire32[(1'h0):(1'h0)]));
            end
          else
            begin
              reg52 <= (reg41 ^ ({{$signed((8'hb7)), $unsigned((8'hb4))}} ?
                  $signed($unsigned($unsigned(wire34))) : (!(~$unsigned(reg54)))));
              reg53 <= reg41[(4'hf):(2'h3)];
              reg54 <= reg56;
              reg55 <= $unsigned(wire32[(2'h2):(2'h2)]);
            end
          reg57 <= reg43;
          if ((reg38 > (~^$signed((((8'ha7) && reg56) ?
              (reg55 << wire33) : (7'h43))))))
            begin
              reg58 <= reg46[(1'h0):(1'h0)];
              reg59 <= (&({$unsigned($signed((8'hb8)))} ?
                  $signed(reg44[(4'hc):(2'h2)]) : reg55[(1'h1):(1'h0)]));
            end
          else
            begin
              reg58 <= $unsigned($unsigned({wire36, reg48[(1'h0):(1'h0)]}));
            end
          reg60 <= wire31[(4'ha):(2'h3)];
        end
      else
        begin
          reg52 <= ($unsigned(((^((8'haf) - wire36)) ?
              (~|((8'ha8) ?
                  reg53 : wire31)) : (|reg43))) ^~ reg49[(4'hd):(4'hb)]);
          reg53 <= wire29;
        end
    end
  assign wire61 = reg59[(4'ha):(1'h1)];
  module62 #() modinst74 (.wire64(reg56), .wire66(reg55), .wire65(reg42), .y(wire73), .clk(clk), .wire63(wire30), .wire67(reg54));
  always
    @(posedge clk) begin
      reg75 <= $signed((&reg56));
    end
  always
    @(posedge clk) begin
      reg76 <= reg46;
      reg77 <= reg49[(3'h5):(3'h4)];
      if ((reg54 && ($signed(reg49) < (~|(~(reg49 ? wire35 : (8'hb9)))))))
        begin
          reg78 <= ((+$signed(reg59)) ?
              ((8'ha2) ^ reg41[(1'h0):(1'h0)]) : $signed($unsigned((^~(^reg53)))));
          if (reg55[(4'hc):(3'h4)])
            begin
              reg79 <= (($unsigned((!reg43[(4'hc):(3'h6)])) ?
                      (!reg49) : $unsigned(($signed(reg47) + $signed((8'h9d))))) ?
                  (8'hbb) : (^((~^reg58) != $signed({(8'ha9)}))));
              reg80 <= (&{wire34[(3'h4):(2'h3)],
                  (reg57[(1'h1):(1'h1)] == (((8'hba) ?
                      reg75 : reg45) >= (reg57 ? reg57 : wire37)))});
              reg81 <= ($signed({reg60}) ?
                  ($unsigned(wire36) << $unsigned(($unsigned(reg78) >= $signed((8'ha7))))) : $unsigned(reg39));
              reg82 <= {reg49[(4'hd):(3'h4)]};
            end
          else
            begin
              reg79 <= ({(~$unsigned($signed(wire37))),
                  $signed(reg44)} == reg79[(5'h14):(4'h8)]);
              reg80 <= $signed({$unsigned(((reg58 >> (8'hb7)) >> (wire33 - wire34)))});
              reg81 <= $signed({reg51});
              reg82 <= (|reg77);
              reg83 <= (~$signed($unsigned(reg82)));
            end
          reg84 <= $signed(reg41);
          if (wire73)
            begin
              reg85 <= reg75[(1'h1):(1'h0)];
              reg86 <= wire30;
            end
          else
            begin
              reg85 <= ((|({wire30,
                  $unsigned(reg76)} ^~ {(+reg42)})) ^~ $unsigned(wire29[(3'h6):(1'h0)]));
            end
        end
      else
        begin
          if (reg51[(3'h4):(1'h0)])
            begin
              reg78 <= {reg59[(4'hc):(1'h0)]};
              reg79 <= $signed($unsigned(($signed((reg85 >> reg81)) > ((reg45 ^ reg54) ?
                  (wire36 ? reg48 : reg52) : $unsigned(reg53)))));
            end
          else
            begin
              reg78 <= (reg47[(4'ha):(1'h0)] ?
                  $unsigned((8'h9d)) : $signed(reg39));
              reg79 <= {($signed({(|reg76), reg83}) ?
                      (reg55 ?
                          (reg83 ?
                              $unsigned((7'h43)) : {wire29}) : wire32[(2'h3):(2'h3)]) : {$unsigned(wire36),
                          (((8'hb4) ? reg44 : reg82) ?
                              $unsigned(wire61) : (reg43 * reg82))})};
              reg80 <= reg84[(2'h2):(1'h1)];
            end
          reg81 <= $signed(reg55);
          reg82 <= ($signed($signed($signed((reg50 ? reg44 : reg45)))) ?
              (($unsigned((|wire32)) ?
                      ($signed(wire33) ?
                          $unsigned(reg47) : (reg59 ?
                              reg46 : reg41)) : (8'h9d)) ?
                  (wire34[(4'hc):(3'h6)] && ((reg48 ?
                      reg49 : reg81) > (reg49 >> (8'hba)))) : (reg39 ?
                      (wire32 * reg55[(4'ha):(2'h2)]) : $signed(wire30[(4'h9):(3'h4)]))) : reg46);
        end
    end
  assign wire87 = (7'h44);
  assign wire88 = (|wire32);
  module89 #() modinst143 (wire142, clk, reg59, wire61, reg43, reg60, wire30);
  module144 #() modinst167 (.clk(clk), .wire147(reg57), .wire145(reg55), .wire148(reg83), .wire149(reg43), .wire146(reg80), .y(wire166));
  assign wire168 = (({$unsigned($signed((8'had))),
                           (8'haf)} - ($unsigned(((8'hbb) ^~ reg79)) ?
                           ((|reg55) & (wire37 - reg42)) : $unsigned((!reg52)))) ?
                       wire29[(3'h4):(1'h1)] : (reg45 ?
                           {reg54,
                               $signed($signed((7'h41)))} : (~^((-reg86) > (!reg46)))));
  always
    @(posedge clk) begin
      reg169 <= reg82;
      reg170 <= ($signed(((reg59[(1'h0):(1'h0)] > (wire29 ? (8'hbe) : reg38)) ?
              reg60[(1'h1):(1'h1)] : {(reg41 <<< wire87), $unsigned(reg86)})) ?
          (~reg38) : wire31[(2'h2):(1'h1)]);
      reg171 <= reg48;
    end
  module172 #() modinst191 (wire190, clk, reg49, wire88, wire35, reg76);
endmodule

module module172
#(parameter param189 = (~(((((8'hb9) ? (8'hb5) : (8'hac)) ? {(8'haa), (8'hb2)} : {(8'hac)}) ? (((8'ha4) ? (8'hbb) : (8'hb6)) <<< {(8'h9e), (8'haf)}) : ({(8'ha3), (8'h9e)} - (8'hbf))) ? ((|((8'haf) != (8'hab))) <= (~^((8'hbb) ~^ (7'h43)))) : ((^((7'h41) ? (8'hb4) : (7'h44))) ^ {((8'h9c) >= (7'h40))}))))
(y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire176;
  input wire [(5'h11):(1'h0)] wire175;
  input wire [(3'h6):(1'h0)] wire174;
  input wire signed [(3'h5):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire signed [(2'h2):(1'h0)] wire181;
  wire signed [(5'h10):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire signed [(2'h3):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire177;
  reg [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire177 = ((wire174 ?
                           (&wire176) : (((wire176 ?
                                   wire173 : wire174) >= wire175[(5'h11):(1'h0)]) ?
                               wire176 : wire173)) ?
                       (!(8'h9c)) : wire173);
  assign wire178 = wire173;
  assign wire179 = (-((wire177[(5'h12):(4'he)] || (8'hb0)) ?
                       ({(wire178 ? wire176 : wire177)} ^ ((~^wire178) ?
                           (wire176 - wire178) : (~^wire174))) : $unsigned((~|(^(8'h9f))))));
  assign wire180 = (wire175 && (($signed($unsigned(wire175)) > ($signed((7'h44)) != ((8'ha9) && wire177))) ?
                       ($signed(((8'h9c) ?
                           wire174 : wire176)) ~^ $unsigned((wire179 < wire179))) : $unsigned(wire177)));
  assign wire181 = wire179;
  assign wire182 = ((~(+$signed($unsigned(wire176)))) <= ($unsigned((~(wire177 ?
                       wire179 : wire179))) ^~ wire180));
  assign wire183 = (+wire180[(4'he):(3'h6)]);
  always
    @(posedge clk) begin
      reg184 <= wire181;
      reg185 <= (wire178 ?
          ({wire180, (~{wire182, wire177})} ?
              (~(reg184 == {wire174})) : $signed((^wire181))) : (((^~(wire181 ?
                  wire174 : (8'ha9))) ?
              ((+wire183) - $unsigned(wire181)) : wire179[(5'h11):(4'hf)]) > (8'hbd)));
      reg186 <= ((^~(&wire178)) ^ ($signed($signed(wire178[(2'h3):(1'h1)])) > ({(wire183 ?
              reg184 : wire180)} < wire174)));
      reg187 <= (^~((^~{wire177[(3'h7):(3'h6)], wire174}) ?
          $unsigned(wire177) : {($unsigned((8'hbd)) ?
                  (^~(8'hb3)) : ((8'had) ? reg185 : wire177))}));
      reg188 <= $unsigned($unsigned($unsigned((~^(reg184 <<< wire176)))));
    end
endmodule

module module144  (y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire149;
  input wire signed [(5'h14):(1'h0)] wire148;
  input wire signed [(3'h4):(1'h0)] wire147;
  input wire [(5'h12):(1'h0)] wire146;
  input wire signed [(4'he):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(5'h10):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire [(4'hc):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire signed [(3'h7):(1'h0)] wire150;
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  assign wire150 = {(^~(~^$signed($signed(wire148))))};
  assign wire151 = ($signed({(&(wire148 != wire147))}) * (~|$signed((-(wire149 ?
                       wire150 : wire146)))));
  assign wire152 = (^~wire145[(1'h0):(1'h0)]);
  assign wire153 = (wire146 <= ($unsigned({((8'ha2) || wire147)}) < wire146[(1'h1):(1'h1)]));
  assign wire154 = $unsigned(wire148);
  assign wire155 = (-$unsigned((!(~&(^wire148)))));
  always
    @(posedge clk) begin
      reg156 <= $unsigned(wire149[(4'hc):(4'h8)]);
      reg157 <= wire147;
      if (wire147)
        begin
          reg158 <= wire153;
          reg159 <= $unsigned((((((8'hab) ?
                      wire150 : wire154) >>> $signed(wire151)) ?
                  ($unsigned(wire154) >> $unsigned(wire148)) : $unsigned((~&wire153))) ?
              (wire149[(2'h3):(1'h0)] >> $signed(((8'hbd) > (8'ha6)))) : reg158[(4'hc):(4'ha)]));
          reg160 <= {wire153};
          reg161 <= $signed(wire150[(1'h1):(1'h1)]);
        end
      else
        begin
          reg158 <= ($signed(($unsigned((~&wire153)) && (((8'hac) ?
                  wire147 : wire151) ?
              {reg156} : $unsigned((8'ha4))))) && ($unsigned(((reg161 ?
                  reg157 : reg156) ?
              wire154 : (reg161 ?
                  wire155 : reg160))) != $signed({wire153[(4'hc):(1'h1)]})));
          reg159 <= $signed(wire155);
          reg160 <= (!wire147);
        end
      reg162 <= (|((wire153 != $unsigned((8'ha2))) ^~ $unsigned({$unsigned((8'ha9)),
          (wire145 <<< reg156)})));
    end
  assign wire163 = $signed(reg158);
  assign wire164 = reg158;
  assign wire165 = (^~$signed((|$signed(wire148))));
endmodule

module module89
#(parameter param141 = ({((~&((8'hb6) ? (8'hb9) : (8'had))) ? (((8'hb7) ? (8'hbc) : (8'hab)) ? ((8'ha2) ? (8'ha0) : (7'h43)) : ((8'ha9) != (7'h43))) : (((8'hba) ? (8'hb5) : (8'hbf)) | {(8'ha0)}))} ^ (!(~|((~|(8'hb6)) ? (|(8'hbf)) : ((8'hb1) + (8'h9e)))))))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire94;
  input wire [(5'h14):(1'h0)] wire93;
  input wire signed [(5'h11):(1'h0)] wire92;
  input wire signed [(4'ha):(1'h0)] wire91;
  input wire signed [(4'hd):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire95;
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire108,
                 wire107,
                 wire102,
                 wire96,
                 wire95,
                 reg140,
                 reg139,
                 reg138,
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
                 reg122,
                 reg121,
                 reg120,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = wire94[(4'hb):(4'ha)];
  assign wire96 = ($unsigned(wire95[(1'h0):(1'h0)]) | wire92);
  always
    @(posedge clk) begin
      reg97 <= ((^~$unsigned(wire95[(4'h9):(4'h8)])) ?
          wire96[(2'h2):(1'h0)] : (~&({$unsigned((8'h9e)),
              (7'h40)} <<< {wire93})));
      reg98 <= reg97;
      reg99 <= $unsigned(((wire93[(5'h14):(5'h13)] & ($signed((8'hb0)) ?
          $signed(wire96) : reg98)) <<< wire90));
      reg100 <= (wire93 ?
          wire94[(3'h7):(2'h3)] : $signed($unsigned((~$signed(wire92)))));
      reg101 <= $unsigned((!{(reg97[(2'h3):(1'h0)] + (7'h41))}));
    end
  assign wire102 = (!$unsigned((~|$signed((~reg98)))));
  always
    @(posedge clk) begin
      if ((wire93[(2'h2):(2'h2)] | reg97))
        begin
          reg103 <= (8'hbc);
          reg104 <= (($unsigned(reg103[(2'h3):(2'h2)]) >>> reg103[(3'h5):(2'h2)]) ?
              wire92[(1'h0):(1'h0)] : {(8'ha4)});
          reg105 <= (!(wire90[(3'h6):(2'h2)] - wire96[(2'h2):(1'h0)]));
        end
      else
        begin
          reg103 <= (reg99 ?
              (^(&(wire91 ? $signed(reg103) : (8'hbd)))) : ($unsigned((7'h40)) ?
                  $unsigned((+(-reg105))) : ($unsigned((8'ha3)) >>> ((!reg98) << wire93[(5'h11):(4'h9)]))));
        end
      if ((^~$unsigned({wire92, ((^~reg101) != $signed(reg104))})))
        begin
          reg106 <= ((~&wire102) ?
              $unsigned(wire96[(2'h2):(2'h2)]) : (|reg100[(4'h8):(1'h1)]));
        end
      else
        begin
          reg106 <= $signed(reg99[(4'hb):(4'hb)]);
        end
    end
  assign wire107 = $unsigned(reg97);
  assign wire108 = $signed({reg104[(5'h13):(2'h3)],
                       ($signed((reg99 ?
                           reg97 : wire91)) != $signed((wire107 != reg99)))});
  always
    @(posedge clk) begin
      if (($signed(reg101[(2'h2):(1'h0)]) <<< wire92[(5'h11):(4'h8)]))
        begin
          if ({$signed($signed(({wire92} >= $signed(wire93)))),
              reg106[(2'h3):(2'h2)]})
            begin
              reg109 <= $signed(wire92);
              reg110 <= reg97;
            end
          else
            begin
              reg109 <= $signed(((+$signed(reg109)) ?
                  (wire108 ?
                      $signed($unsigned(reg101)) : ((-reg101) ?
                          (reg97 >> reg105) : reg109[(4'h8):(3'h7)])) : ($unsigned(reg105[(1'h0):(1'h0)]) ?
                      wire92[(4'he):(4'hb)] : wire90[(3'h7):(3'h4)])));
            end
        end
      else
        begin
          if (((7'h44) > wire107[(3'h6):(1'h1)]))
            begin
              reg109 <= ((8'hbb) ?
                  (wire92 & $signed(((reg110 < (8'hbd)) >> (reg101 ?
                      reg110 : reg110)))) : reg110[(1'h0):(1'h0)]);
              reg110 <= (&(^~reg97));
            end
          else
            begin
              reg109 <= reg98[(4'hd):(3'h6)];
            end
          reg111 <= wire94;
        end
      reg112 <= ($unsigned(reg111[(4'hf):(3'h5)]) ~^ $signed({((!reg110) ?
              reg109[(1'h0):(1'h0)] : {wire90, reg101}),
          ($signed(wire107) & (~wire92))}));
      reg113 <= reg105[(1'h0):(1'h0)];
      reg114 <= (reg99 >>> ($unsigned(reg99[(2'h3):(2'h2)]) & (wire91[(1'h1):(1'h0)] || ((wire95 ^ reg104) <= wire107[(4'ha):(1'h1)]))));
    end
  assign wire115 = {(~^({((8'h9c) && reg105)} ? reg97 : wire108)),
                       $unsigned($unsigned($signed({reg104, wire108})))};
  assign wire116 = (!reg103[(3'h7):(3'h7)]);
  assign wire117 = ((|$signed(($signed(reg112) <<< reg114[(4'h8):(1'h1)]))) ^ (!(^(-(^reg106)))));
  assign wire118 = reg111[(4'hb):(3'h5)];
  assign wire119 = (-(~&$unsigned(wire102)));
  always
    @(posedge clk) begin
      reg120 <= (8'hb3);
      if (wire95[(2'h3):(1'h0)])
        begin
          if ((&reg112))
            begin
              reg121 <= (~wire119);
              reg122 <= {(|{(8'haa)})};
              reg123 <= (8'hb4);
              reg124 <= ({wire93} == (~|($signed((8'ha0)) < (|(reg122 ?
                  wire91 : wire119)))));
            end
          else
            begin
              reg121 <= wire119[(1'h0):(1'h0)];
            end
          if (wire108)
            begin
              reg125 <= $unsigned($unsigned((^~((~wire95) ?
                  $unsigned((8'ha6)) : wire96[(3'h6):(2'h2)]))));
            end
          else
            begin
              reg125 <= {(&(+(wire94[(3'h5):(2'h3)] - reg109[(1'h0):(1'h0)])))};
              reg126 <= $signed(((((reg100 ? wire93 : (8'ha0)) ?
                  $unsigned(reg114) : $signed(reg113)) >> ((wire94 ?
                      wire116 : reg112) ?
                  wire93 : (~^wire94))) ~^ $unsigned((-(+reg112)))));
              reg127 <= ((+reg113) <<< ((wire115[(5'h10):(4'hd)] ?
                  ((reg122 == (8'hbc)) < (wire102 | reg112)) : wire118[(1'h1):(1'h0)]) ~^ $unsigned($unsigned(wire107))));
              reg128 <= reg103[(3'h5):(1'h1)];
            end
          reg129 <= reg121;
          reg130 <= (~$signed((~&$signed((reg124 ? wire92 : reg120)))));
        end
      else
        begin
          if ((reg120[(1'h1):(1'h1)] != (8'ha2)))
            begin
              reg121 <= $unsigned({(^$unsigned(wire96))});
              reg122 <= (~&$unsigned(((~|$signed(reg112)) + $unsigned((reg103 | wire95)))));
            end
          else
            begin
              reg121 <= ($signed($unsigned($unsigned((!(8'hb9))))) > (($signed($signed(reg106)) >> (reg129 >> (~^(8'h9d)))) ?
                  $signed({(reg123 | (8'hb4)),
                      (wire90 == wire91)}) : $unsigned((8'hae))));
              reg122 <= ($unsigned(((~reg123) && ((reg111 >= wire95) ?
                  $signed(wire102) : $unsigned(wire108)))) >> $signed($signed({$unsigned((8'h9d)),
                  wire116})));
            end
          reg123 <= reg128;
        end
      reg131 <= wire118;
      reg132 <= reg114[(4'hd):(3'h7)];
    end
  assign wire133 = ((|$signed({(~reg129),
                       (wire119 ?
                           reg112 : (8'h9c))})) & $unsigned(reg99[(4'hb):(4'h8)]));
  assign wire134 = (~(~|reg114));
  assign wire135 = $unsigned(((~$unsigned((|(7'h41)))) && wire94));
  assign wire136 = wire95;
  assign wire137 = reg129[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg138 <= {$signed($unsigned({wire90}))};
      if (reg100[(4'ha):(3'h5)])
        begin
          reg139 <= (({reg129} ?
              reg131[(3'h7):(2'h2)] : $unsigned((~^reg127[(1'h1):(1'h0)]))) <= $signed(reg110[(1'h0):(1'h0)]));
        end
      else
        begin
          reg139 <= $unsigned($unsigned(reg132[(1'h1):(1'h0)]));
          reg140 <= reg131;
        end
    end
endmodule

module module62
#(parameter param72 = (&((({(8'ha8), (8'hb9)} ~^ (-(8'hb1))) ^~ ((-(8'hb2)) ? (!(8'ha3)) : {(8'ha8)})) ? {{((8'h9f) ? (7'h44) : (8'hb5))}, (((8'ha8) ? (8'ha6) : (7'h41)) ^ ((7'h42) ? (8'hbe) : (8'hb1)))} : {(((7'h42) || (8'h9c)) ? ((7'h42) & (8'hb8)) : (8'h9c)), (((8'hb4) ? (8'ha0) : (8'hbf)) ? (~&(7'h42)) : (~|(7'h40)))})))
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire [(2'h3):(1'h0)] wire64;
  input wire [(5'h14):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  assign y = {wire71, wire70, wire69, wire68, (1'h0)};
  assign wire68 = (wire67 ~^ (~wire64));
  assign wire69 = (8'ha1);
  assign wire70 = (wire66[(4'hc):(2'h2)] < ($unsigned({(wire63 + wire66)}) ?
                      {((wire67 ? wire69 : wire63) ?
                              (wire68 ?
                                  wire68 : wire66) : wire68[(5'h11):(2'h2)]),
                          (7'h43)} : (-((wire65 | wire63) ?
                          (wire67 | wire69) : (~^wire69)))));
  assign wire71 = ({$signed((((8'ha9) ? wire65 : wire64) * $signed(wire69)))} ?
                      wire69[(1'h0):(1'h0)] : $signed(wire63[(4'ha):(2'h2)]));
endmodule
