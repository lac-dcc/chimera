module top
#(parameter param100 = ((8'haf) ~^ (((!((8'ha2) ? (8'ha1) : (8'h9f))) ? (((8'h9c) ? (8'haf) : (8'ha1)) ? ((8'hb4) ? (8'had) : (8'hba)) : (8'hbc)) : (((8'had) & (8'hab)) != {(8'ha1), (7'h41)})) && (&{((8'h9f) != (7'h41))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire7,
                 wire5,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg6,
                 (1'h0)};
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      reg6 <= wire5;
    end
  assign wire7 = ($unsigned(({$unsigned(wire5)} ? wire4 : {wire4, (&wire2)})) ?
                     $signed(((&(wire0 ^ wire2)) ?
                         $signed($signed(reg6)) : $signed((~&wire5)))) : $signed(reg6));
  module8 #() modinst89 (.wire9(wire2), .y(wire88), .wire11(wire1), .wire12(wire0), .wire10(wire3), .clk(clk));
  assign wire90 = $signed({reg6[(4'h9):(3'h7)]});
  assign wire91 = (wire5 <<< wire5[(1'h0):(1'h0)]);
  assign wire92 = $unsigned((wire88[(4'h9):(1'h1)] ?
                      reg6[(3'h4):(1'h0)] : wire4[(2'h2):(1'h1)]));
  assign wire93 = (&reg6);
  assign wire94 = (-{{$signed($signed(wire88))}, wire5});
  always
    @(posedge clk) begin
      reg95 <= $unsigned((^((+((8'ha9) ~^ wire93)) ?
          $unsigned(((8'hbe) ? wire2 : (8'ha4))) : ((wire92 ?
              wire0 : wire94) + $signed((8'hab))))));
      reg96 <= wire88[(3'h4):(2'h3)];
      reg97 <= (|wire94[(2'h3):(2'h3)]);
      reg98 <= {$unsigned(($signed(wire92[(1'h0):(1'h0)]) ~^ (wire88 * wire7[(4'he):(2'h3)])))};
      reg99 <= {reg6, (wire4 << wire5)};
    end
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire67;
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire28,
                 wire67,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg15,
                 (1'h0)};
  assign wire13 = (-$signed((wire9[(4'hd):(4'h9)] != $unsigned(wire9[(3'h5):(2'h3)]))));
  assign wire14 = $signed((wire12[(3'h6):(3'h5)] <<< ((wire13 > wire9) || ($signed(wire9) && wire9[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      reg15 <= wire10[(2'h2):(1'h1)];
    end
  assign wire16 = wire14[(3'h5):(2'h3)];
  assign wire17 = ((($unsigned((^~wire14)) ?
                          $signed((wire12 ?
                              wire10 : reg15)) : $unsigned($unsigned(wire9))) ?
                      $unsigned($unsigned((wire12 - reg15))) : (((wire10 | wire14) ?
                          (wire9 ? reg15 : reg15) : {reg15,
                              reg15}) || reg15[(4'hc):(3'h6)])) + (|(wire11[(3'h5):(3'h4)] >= wire16[(4'ha):(1'h0)])));
  assign wire18 = (-((+{(-wire16)}) & $signed(($signed(wire17) ?
                      (wire14 ^~ wire9) : $unsigned(wire12)))));
  assign wire19 = (wire12 >>> ($unsigned(($unsigned(wire18) ?
                      (wire17 ?
                          wire9 : reg15) : $unsigned(wire18))) != ({(reg15 ?
                              (8'hbc) : wire14)} ?
                      (^~{wire9, (8'hb2)}) : $signed($unsigned(wire11)))));
  assign wire20 = (^(((wire12 ?
                          $signed(wire10) : (wire13 != wire19)) >>> $signed(reg15[(2'h3):(2'h3)])) ?
                      ($signed((wire10 * wire10)) >>> reg15[(4'hd):(3'h5)]) : wire17));
  assign wire21 = wire12;
  assign wire22 = wire9;
  always
    @(posedge clk) begin
      reg23 <= wire18[(4'h8):(4'h8)];
      if (wire20[(1'h1):(1'h1)])
        begin
          reg24 <= {(-wire16)};
          reg25 <= $unsigned((reg24[(1'h1):(1'h0)] ?
              $unsigned((((8'h9d) * wire13) ?
                  $signed(wire20) : $signed(wire12))) : (8'hac)));
          reg26 <= wire12[(4'hb):(3'h4)];
        end
      else
        begin
          reg24 <= $unsigned((^(8'hae)));
          reg25 <= $unsigned((~&$unsigned($unsigned((wire18 ?
              wire17 : reg15)))));
        end
      reg27 <= (+wire9[(1'h1):(1'h0)]);
    end
  assign wire28 = $unsigned({($signed(reg23[(3'h4):(2'h3)]) ?
                          ($signed(wire10) >>> (wire11 ?
                              wire22 : wire17)) : $unsigned($unsigned((8'hb6)))),
                      $signed(($unsigned((8'haf)) ?
                          $unsigned(wire22) : reg23))});
  module29 #() modinst68 (.wire32(wire17), .wire31(reg27), .wire30(wire13), .wire34(wire21), .y(wire67), .clk(clk), .wire33(reg25));
  always
    @(posedge clk) begin
      reg69 <= (^($signed((reg26 >>> wire21)) > ((&{wire28}) ?
          $signed((|wire21)) : $unsigned({reg23}))));
      if ((((((8'ha2) >> (wire17 << (8'hba))) ?
              ((wire18 ? wire12 : (7'h44)) | reg25[(4'ha):(2'h2)]) : {wire18,
                  (|(8'ha2))}) ?
          (wire14 ?
              reg24[(3'h5):(2'h3)] : (~&wire9)) : wire19[(1'h1):(1'h0)]) ^~ (wire13 ?
          $unsigned(wire9[(4'hd):(4'hc)]) : (!(~|(wire10 * (8'ha5)))))))
        begin
          reg70 <= (!(wire28 ?
              {wire14, (&(wire11 ? wire12 : wire19))} : (wire13 == wire22)));
          if (reg24)
            begin
              reg71 <= (~$signed($unsigned($unsigned($unsigned(wire21)))));
              reg72 <= $unsigned(reg27);
              reg73 <= reg25[(3'h7):(2'h3)];
              reg74 <= wire18;
            end
          else
            begin
              reg71 <= reg69[(4'ha):(3'h7)];
              reg72 <= (~reg15);
              reg73 <= ($unsigned((reg24 + (((8'hbf) ^ (8'h9f)) ?
                  (+wire14) : {(7'h41),
                      wire28}))) + (~^(~&(-(reg25 ^ (8'hb8))))));
            end
          reg75 <= (wire14 ?
              ($unsigned((^~{(8'h9d)})) < reg69[(2'h2):(1'h1)]) : $unsigned((!(~(|(8'haa))))));
          reg76 <= (~^reg72[(1'h0):(1'h0)]);
          reg77 <= $unsigned((($unsigned((wire10 ? (7'h44) : reg73)) ?
              wire19[(4'h9):(3'h7)] : $signed(((8'ha4) && reg24))) || (^wire20[(1'h1):(1'h1)])));
        end
      else
        begin
          if (reg74)
            begin
              reg70 <= $unsigned((wire20[(4'h8):(3'h7)] ?
                  reg15 : {(+(reg72 ? reg26 : reg71))}));
              reg71 <= ($unsigned(wire21) * ((wire16 >= ((reg77 ^ wire67) ?
                  wire21 : reg76)) * $signed(reg70[(4'he):(3'h5)])));
              reg72 <= (wire18 ^ $signed(reg24));
            end
          else
            begin
              reg70 <= reg77[(4'hd):(4'ha)];
              reg71 <= reg77;
            end
          if ($unsigned($unsigned($signed($signed((+reg26))))))
            begin
              reg73 <= (8'h9d);
              reg74 <= $unsigned(((|reg72) ? wire20 : $unsigned(wire13)));
              reg75 <= ((reg75[(1'h1):(1'h1)] | (reg70[(3'h4):(1'h0)] << $unsigned($signed(wire16)))) ?
                  $unsigned(reg23[(1'h1):(1'h0)]) : $signed(reg74));
            end
          else
            begin
              reg73 <= wire13[(1'h1):(1'h1)];
              reg74 <= reg23;
              reg75 <= {wire21, $unsigned($signed(reg23))};
              reg76 <= {$unsigned((wire21 ?
                      ($unsigned(wire16) ~^ reg23[(2'h3):(1'h1)]) : $signed(reg25))),
                  wire21};
              reg77 <= wire12[(2'h3):(2'h3)];
            end
        end
      if ($unsigned(($unsigned(wire19[(4'h8):(2'h3)]) ?
          $unsigned($unsigned((8'ha3))) : $signed($signed(reg75[(1'h0):(1'h0)])))))
        begin
          reg78 <= ((($signed(wire12[(2'h2):(1'h1)]) ?
                  ($unsigned(wire14) << (~reg72)) : {((8'hae) << (8'hb9)),
                      reg23}) ?
              wire12[(3'h6):(1'h0)] : ({((8'hb2) >= wire18), reg69} ?
                  (reg69[(1'h1):(1'h1)] & reg74[(1'h0):(1'h0)]) : $unsigned(((8'hbe) * wire11)))) - (($signed(wire9[(3'h6):(1'h1)]) <<< reg25) + $unsigned((+(wire13 & reg23)))));
          if ($signed((wire17[(4'hd):(3'h5)] <<< $unsigned((&$signed(reg75))))))
            begin
              reg79 <= {$signed((~&($signed(reg75) ?
                      (reg69 ? wire18 : (8'hac)) : {wire18})))};
              reg80 <= reg75;
              reg81 <= $signed(($signed($signed($signed((8'hb9)))) < {$unsigned(wire11),
                  ((reg77 ? reg25 : reg15) ? $unsigned(wire13) : reg70)}));
              reg82 <= ({(8'hb3)} >= reg72);
            end
          else
            begin
              reg79 <= ($signed(reg23) ~^ (wire14[(4'he):(1'h0)] <= wire19[(3'h4):(1'h0)]));
              reg80 <= reg82;
            end
          reg83 <= reg25;
        end
      else
        begin
          reg78 <= {(~&reg76), $signed(wire20)};
          if ($unsigned($unsigned({reg69})))
            begin
              reg79 <= ((((8'ha7) ?
                      (~reg80[(4'hf):(1'h1)]) : wire17[(4'h9):(2'h3)]) ?
                  $signed(reg78) : (-$unsigned(reg75))) & ($signed((-reg81)) ?
                  reg23 : $unsigned(reg26)));
              reg80 <= ({$unsigned(reg75[(2'h3):(1'h0)])} ?
                  reg26[(4'h8):(2'h3)] : $signed((^~wire9)));
              reg81 <= wire16;
              reg82 <= ({$signed(wire20[(3'h4):(3'h4)]),
                  (~(wire13 >>> (reg71 ?
                      wire14 : wire21)))} == ((~^(~|reg24[(3'h4):(1'h1)])) >>> {$signed((wire9 << reg69))}));
            end
          else
            begin
              reg79 <= $unsigned({(~|{(wire10 ? reg26 : (8'hb4)),
                      $unsigned(reg76)})});
              reg80 <= {$unsigned($signed($signed($signed(reg82))))};
              reg81 <= (~(reg70[(4'h8):(3'h5)] ?
                  wire17 : $unsigned($signed((wire14 + wire10)))));
              reg82 <= wire67;
              reg83 <= ((wire18[(4'h8):(2'h2)] ?
                      reg73[(3'h5):(2'h3)] : (|((wire13 || (8'haa)) <<< (~(8'ha8))))) ?
                  $signed($unsigned($unsigned(wire21))) : ((~$unsigned($signed((8'hb4)))) ?
                      (reg74[(4'he):(3'h5)] ^ $unsigned((wire14 >> reg15))) : ($signed((reg15 ?
                              (8'ha4) : reg83)) ?
                          $signed(wire19[(3'h7):(2'h2)]) : reg76[(4'hb):(4'h8)])));
            end
          if ($unsigned((&(!$signed((wire20 ? wire14 : wire14))))))
            begin
              reg84 <= reg70;
            end
          else
            begin
              reg84 <= $unsigned({(8'ha5)});
              reg85 <= $unsigned($unsigned((~^((reg81 ?
                  (8'h9e) : reg76) ~^ (reg23 + reg24)))));
              reg86 <= reg80;
            end
        end
      reg87 <= reg15;
    end
endmodule

module module29
#(parameter param65 = ({{((~(8'h9e)) ? (^(8'hb1)) : ((8'had) >= (8'hb9))), (((8'haa) ? (8'ha1) : (8'hab)) + ((8'hba) ? (8'hb8) : (7'h44)))}, (&((~^(8'hb0)) ? (&(8'ha0)) : (+(8'ha6))))} ? ((+(((7'h43) ? (7'h43) : (8'hba)) ? (~|(8'h9e)) : ((8'hb5) << (8'hb1)))) ~^ ((8'had) == (7'h41))) : ({(!((8'hb1) ^~ (8'hb3)))} ? ((((8'ha2) ? (8'h9c) : (8'hb4)) ? ((8'ha5) ? (8'h9c) : (8'hbd)) : (~&(8'hb4))) ? (+(!(8'ha2))) : (~&((8'haa) | (8'hb6)))) : (~&(((8'hbf) <<< (8'hb1)) > ((8'had) ? (8'hbd) : (8'hbd)))))), 
parameter param66 = (((~^param65) ~^ ((~{param65, param65}) ? ((param65 ? param65 : param65) * (&param65)) : {(^param65)})) <= (!(param65 | {(param65 == param65), (^param65)}))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire52,
                 wire50,
                 wire49,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 (1'h0)};
  assign wire35 = (8'ha4);
  assign wire36 = (!(8'ha4));
  assign wire37 = wire35[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= wire31[(3'h7):(1'h0)];
    end
  assign wire39 = wire35;
  always
    @(posedge clk) begin
      reg40 <= wire36;
      if (((wire36 < wire30) ? wire34 : wire39[(2'h3):(1'h0)]))
        begin
          reg41 <= $signed(wire32[(2'h2):(1'h1)]);
          reg42 <= {((wire30 ? {(~|reg40), wire35[(2'h2):(1'h1)]} : (!wire30)) ?
                  $unsigned(wire39[(1'h1):(1'h0)]) : (!((wire39 ?
                          wire31 : wire30) ?
                      (-wire32) : $unsigned(wire31))))};
          if ($signed($signed(wire34)))
            begin
              reg43 <= wire34[(4'h9):(2'h2)];
              reg44 <= wire30;
            end
          else
            begin
              reg43 <= $signed(wire30[(2'h3):(2'h2)]);
              reg44 <= reg38;
              reg45 <= (+(+$signed((wire35 <= $unsigned(wire30)))));
              reg46 <= ($unsigned((reg44 & (~|$signed(wire30)))) > $unsigned((wire30 ?
                  $unsigned((reg38 ^~ reg44)) : ({reg40,
                      wire32} == $unsigned(reg44)))));
              reg47 <= (~^$unsigned($signed((^wire35[(3'h4):(2'h2)]))));
            end
        end
      else
        begin
          reg41 <= reg42;
        end
      reg48 <= ((^wire36) - (!$signed(reg47)));
    end
  assign wire49 = reg38;
  assign wire50 = reg48;
  always
    @(posedge clk) begin
      reg51 <= (~{$unsigned(($unsigned(reg45) ?
              wire31 : (reg40 ? reg45 : wire37))),
          (((reg40 ^ wire30) != wire34) && $unsigned(((7'h40) ?
              reg43 : wire33)))});
    end
  assign wire52 = wire50;
  always
    @(posedge clk) begin
      reg53 <= $signed(wire49);
      reg54 <= (!wire39);
      reg55 <= ($signed((^~wire31[(4'hc):(4'h9)])) ?
          $signed($signed(reg53)) : wire37);
      reg56 <= ((wire50[(3'h4):(2'h2)] ?
          $unsigned(wire52) : $unsigned((reg51 < reg43[(2'h3):(1'h0)]))) || wire50);
    end
  assign wire57 = (^~reg47[(3'h6):(3'h5)]);
  assign wire58 = ((|(~|$signed((wire49 + reg51)))) <<< $unsigned($signed(reg51)));
  assign wire59 = {($signed($signed((~|reg45))) ?
                          $unsigned($signed((wire50 ?
                              wire52 : wire31))) : (((!reg42) ?
                              $unsigned(reg48) : $unsigned(reg45)) ^~ (8'h9e))),
                      $unsigned({($unsigned(reg54) ?
                              (reg55 && reg48) : (reg38 ^~ (8'ha4))),
                          reg48[(1'h1):(1'h0)]})};
  assign wire60 = wire30;
  assign wire61 = (reg46[(3'h4):(1'h1)] * (!($unsigned($signed(reg42)) <= ({reg40,
                      (8'h9f)} ~^ {reg45}))));
  assign wire62 = {reg44, (((8'ha9) ~^ (8'hab)) ? (~&(~{wire57})) : reg43)};
  assign wire63 = reg51[(4'h9):(3'h5)];
  assign wire64 = $signed(reg43);
endmodule
