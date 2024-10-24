module top
#(parameter param100 = (((|(+((8'hab) <= (8'hb4)))) < (&(|((8'hb4) ? (8'h9f) : (8'hb9))))) ? ((&{((8'hb4) ? (7'h44) : (8'hac)), {(8'h9c)}}) | (|{{(8'h9e), (8'hbc)}})) : ((~&(8'hb1)) >= ({(~(8'hb6)), (~(8'haf))} ? (~|{(8'ha3)}) : (((8'hbe) ? (8'hbf) : (8'ha3)) <<< ((8'hb5) ^ (8'hb8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire25,
                 wire24,
                 wire6,
                 wire5,
                 wire4,
                 reg96,
                 reg95,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~|wire0[(4'h8):(1'h0)]);
  assign wire5 = ({((wire0 ? (wire1 ? wire4 : wire0) : wire4[(5'h10):(4'hf)]) ?
                         wire3[(4'ha):(4'h8)] : (wire4 ?
                             $signed(wire0) : (wire0 ? wire4 : wire4))),
                     $signed((^$unsigned(wire1)))} == wire1);
  assign wire6 = $signed((8'hb1));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(((wire3[(4'hc):(4'hc)] <<< $unsigned((+wire6))) ^~ (~&(wire4[(4'h8):(3'h7)] ?
          ((7'h42) ? wire5 : (7'h40)) : (wire3 ? wire5 : wire6)))));
      reg8 <= $unsigned(wire2);
      if ($signed((^~$unsigned($signed({wire1, (8'hb9)})))))
        begin
          if ((8'hb8))
            begin
              reg9 <= (~&(~$signed($signed($signed((8'ha8))))));
              reg10 <= ({((wire5[(1'h1):(1'h0)] ?
                          (wire1 >> wire6) : (wire2 ?
                              wire6 : wire3)) && $unsigned((~|wire0))),
                      $signed(wire1[(4'hf):(4'ha)])} ?
                  wire0[(2'h2):(1'h0)] : reg8);
              reg11 <= wire4[(2'h3):(1'h1)];
            end
          else
            begin
              reg9 <= {(((^$unsigned(wire5)) ?
                          (^~$signed(reg8)) : reg10[(4'h9):(3'h6)]) ?
                      (wire3[(1'h0):(1'h0)] - ($signed(reg10) ~^ (reg7 || reg7))) : $signed(reg8[(2'h2):(2'h2)])),
                  ({$unsigned((reg10 ^~ wire4)), reg9[(2'h2):(2'h2)]} ?
                      ((!$signed(reg9)) ?
                          wire1 : $signed((wire4 && reg9))) : reg9)};
              reg10 <= $signed(((!(wire5 | reg11[(4'h9):(4'h8)])) >= {$signed($unsigned((8'hb6))),
                  ((~|wire0) ? wire1 : (8'ha0))}));
              reg11 <= $unsigned(((+wire0) * $unsigned(reg10)));
              reg12 <= wire2[(1'h1):(1'h1)];
              reg13 <= (((($signed(wire6) ? {reg10} : wire5) ?
                      $unsigned($signed(wire0)) : $signed(reg10[(1'h0):(1'h0)])) < (+$signed(wire2[(1'h1):(1'h1)]))) ?
                  {{{reg8[(1'h0):(1'h0)], {reg9, wire0}}},
                      {($signed(wire3) ?
                              $signed(wire0) : $signed(reg8))}} : wire5);
            end
        end
      else
        begin
          reg9 <= (($signed($unsigned($unsigned(reg8))) ?
              (!(^~(wire1 ? reg8 : reg13))) : ($unsigned($unsigned(reg10)) ?
                  ($unsigned(reg11) ?
                      wire2 : $unsigned(wire5)) : $signed(reg12[(3'h4):(1'h1)]))) >>> (($unsigned((reg12 >>> reg11)) & $unsigned($signed(wire2))) ?
              reg12 : reg7[(2'h2):(1'h0)]));
          reg10 <= ($unsigned(($unsigned(reg13) & $signed($unsigned((7'h44))))) ?
              (+{reg10[(3'h7):(2'h3)],
                  reg10[(2'h3):(1'h0)]}) : (reg8[(2'h2):(1'h1)] ?
                  reg13[(3'h5):(3'h5)] : $signed($signed(reg9[(2'h2):(1'h0)]))));
          reg11 <= wire1[(4'hc):(3'h7)];
          reg12 <= (!(reg10 || {(wire5 ? reg12[(3'h6):(3'h5)] : (8'hab)),
              $signed(wire1[(2'h2):(2'h2)])}));
        end
      reg14 <= ({$signed(((wire2 ? reg11 : wire2) == $unsigned(reg11))),
          ((7'h44) ^~ $signed(reg7))} == (!wire3[(1'h1):(1'h1)]));
      if ($signed(wire4[(1'h0):(1'h0)]))
        begin
          reg15 <= wire5[(2'h2):(2'h2)];
          if ($signed((reg11 ^~ ((wire3 >>> reg10[(3'h6):(2'h2)]) <= $signed((wire3 + reg13))))))
            begin
              reg16 <= (!{(wire2[(2'h2):(1'h0)] > (~&(~reg8)))});
              reg17 <= ({{reg7[(1'h1):(1'h0)], (7'h43)}} ?
                  (((~reg7) ? $unsigned(reg16) : $unsigned((8'ha5))) ?
                      (((reg9 * reg9) ?
                              (reg13 ? (8'hba) : (8'hbc)) : (reg13 ?
                                  (8'hb9) : wire0)) ?
                          ($unsigned(wire0) ?
                              (~&reg16) : wire5) : {(^wire3)}) : $unsigned($signed((-reg14)))) : (8'hb6));
              reg18 <= (!$signed(wire0));
            end
          else
            begin
              reg16 <= (~&$signed(reg14));
              reg17 <= (-$signed(reg18));
              reg18 <= (~reg9);
              reg19 <= (&((reg18[(4'h8):(4'h8)] ?
                      $unsigned($unsigned(reg9)) : $unsigned(reg10[(3'h4):(1'h1)])) ?
                  (((reg13 <<< (8'ha6)) != (reg7 == wire0)) <= reg16[(5'h12):(4'hb)]) : (reg7[(2'h2):(2'h2)] ?
                      $signed(reg17) : (-$unsigned(reg14)))));
              reg20 <= wire3;
            end
          reg21 <= (((($unsigned(reg9) ?
                      wire5[(3'h4):(1'h1)] : $unsigned(reg11)) ?
                  $unsigned(reg11) : (&(reg12 & reg15))) ?
              (~&($signed((8'hac)) ?
                  (~|reg15) : (reg17 ?
                      reg17 : reg12))) : wire0[(1'h1):(1'h0)]) && $unsigned(($unsigned(reg11) ?
              (!(reg14 ?
                  reg8 : reg15)) : (reg15[(4'h8):(2'h3)] & (reg8 * reg11)))));
          reg22 <= (($unsigned(wire2[(1'h0):(1'h0)]) ?
                  wire5[(1'h1):(1'h1)] : wire6[(1'h0):(1'h0)]) ?
              $unsigned($signed($signed($signed((8'h9c))))) : $unsigned(wire6[(2'h2):(1'h1)]));
          reg23 <= $unsigned(((wire0[(4'h8):(2'h2)] <<< $unsigned((~^reg10))) != reg9));
        end
      else
        begin
          reg15 <= (-((($signed(reg8) ?
                  $unsigned(reg23) : ((8'hac) ? wire4 : reg14)) ?
              $signed($unsigned(reg9)) : (wire3[(3'h6):(2'h2)] ?
                  $signed(wire6) : (!wire1))) >= ((((8'hb3) ?
              reg12 : reg19) || (reg13 | reg10)) < reg14[(1'h1):(1'h1)])));
        end
    end
  assign wire24 = wire5[(1'h1):(1'h1)];
  assign wire25 = (({((~|wire2) != $unsigned(reg8)), (^wire6)} * ((8'ha0) ?
                          ((wire4 + wire2) + reg23) : $signed($unsigned(reg14)))) ?
                      (+(+reg9[(1'h1):(1'h0)])) : $unsigned($unsigned(($signed((8'ha1)) > reg16))));
  module26 #() modinst91 (wire90, clk, reg14, wire2, wire24, reg13);
  assign wire92 = (8'ha2);
  assign wire93 = $unsigned($signed(((7'h44) && wire92[(4'hc):(3'h4)])));
  assign wire94 = (+(reg12[(3'h6):(1'h0)] ? $signed($unsigned(reg21)) : wire2));
  always
    @(posedge clk) begin
      reg95 <= reg8;
      reg96 <= (~^(^(wire6[(3'h6):(1'h1)] + $signed($signed((8'ha2))))));
    end
  assign wire97 = ((~reg7) ?
                      ($signed({wire4[(4'hb):(3'h7)],
                          $signed((8'ha8))}) | (^{reg22[(3'h5):(3'h5)],
                          reg16})) : reg21[(2'h2):(1'h1)]);
  assign wire98 = {(^$signed((~|(reg19 ? reg18 : reg95)))), wire25};
  assign wire99 = reg14[(2'h3):(2'h2)];
endmodule

module module26
#(parameter param88 = ({((((8'haa) ? (8'hb5) : (8'ha5)) ^~ ((8'ha4) ? (8'hb4) : (7'h43))) ? ((~(8'ha8)) ? (~(7'h40)) : (~^(7'h41))) : (((8'had) <<< (8'ha7)) ? {(8'hbb)} : (~|(8'hbe))))} - ((((8'ha0) >>> (~&(8'haf))) ? ({(8'hac), (8'hac)} ? ((8'hb3) ~^ (7'h42)) : ((8'hb3) ^~ (8'hbb))) : {((7'h40) || (8'hb9))}) ? {(~^((8'h9c) > (8'hb7)))} : ((((8'hac) ? (8'hb8) : (8'hae)) >> {(7'h40)}) >= ((^(7'h43)) ? (~|(7'h43)) : ((8'ha8) >>> (8'hb6)))))), 
parameter param89 = {(~^param88)})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire31 = ((+$signed({(~^wire29)})) >= $signed((|((~|wire30) ?
                      (wire27 ? (8'ha2) : wire29) : ((7'h42) ?
                          wire27 : (8'ha1))))));
  assign wire32 = $signed(wire30);
  assign wire33 = (~|($signed(wire28) == wire28));
  assign wire34 = wire31[(5'h11):(1'h1)];
  assign wire35 = $unsigned(({$unsigned($unsigned(wire32)), wire33} ?
                      (-(((8'haf) >>> wire28) & (wire31 ?
                          (8'haa) : (8'hb6)))) : wire33));
  assign wire36 = wire34;
  assign wire37 = {(({wire31[(5'h11):(2'h3)],
                          wire28[(2'h2):(1'h1)]} >= wire34) <<< ({$signed((8'ha4)),
                          (^wire35)} < $signed((wire36 ? wire27 : wire36)))),
                      (~wire36[(4'ha):(4'h9)])};
  assign wire38 = ((^$unsigned($unsigned(wire28))) ~^ $signed((-$signed((+wire28)))));
  assign wire39 = ((($signed((^wire36)) ?
                          (|wire32) : ((-wire31) ?
                              (wire36 != wire32) : {(8'ha1)})) || ($unsigned(((8'h9f) ?
                              wire29 : (7'h41))) ?
                          $signed(wire30) : $unsigned(wire38[(4'hb):(1'h1)]))) ?
                      (wire37[(3'h5):(3'h4)] ?
                          ((^(wire31 < (8'hb1))) >> ($unsigned(wire35) <<< $signed(wire38))) : $unsigned(($signed(wire38) ?
                              wire37 : wire34))) : (!$signed((8'ha0))));
  assign wire40 = ($signed(wire28[(3'h5):(1'h1)]) < ($signed($unsigned(wire33)) ?
                      $unsigned(wire27) : $signed(((wire33 ? wire27 : wire34) ?
                          (~^wire30) : wire39))));
  assign wire41 = $unsigned(($unsigned((!(&(8'hb2)))) ? wire32 : (~^wire36)));
  assign wire42 = wire39[(2'h2):(2'h2)];
  assign wire43 = wire36;
  module44 #() modinst65 (wire64, clk, wire40, wire33, wire37, wire43);
  assign wire66 = (((($signed(wire28) + (wire42 ?
                      (8'hac) : wire30)) ^~ wire38) ^ (((wire39 * wire33) ?
                          wire42 : $signed(wire40)) ?
                      wire27[(2'h3):(2'h3)] : (~&{wire64}))) < wire31);
  assign wire67 = $signed({(wire41[(2'h3):(2'h2)] ?
                          {$signed((8'haa))} : wire37[(4'hb):(1'h0)])});
  assign wire68 = $unsigned($unsigned((+wire28)));
  assign wire69 = (($signed(((~wire40) ?
                          $signed(wire28) : (^~wire41))) & (^~$signed(wire67[(2'h2):(1'h1)]))) ?
                      {$unsigned($signed(wire40[(2'h2):(1'h0)]))} : {wire30[(2'h3):(1'h0)],
                          wire67});
  assign wire70 = (wire34 ?
                      (($signed((wire40 ?
                          wire67 : wire27)) + $signed({wire29})) >>> $signed(((wire43 && (8'h9c)) ?
                          wire38[(4'h8):(2'h2)] : (~^wire69)))) : (!{(~$signed(wire31)),
                          wire29}));
  always
    @(posedge clk) begin
      reg71 <= (($unsigned((~&(wire69 ? wire30 : wire70))) ?
              (wire67[(1'h0):(1'h0)] ?
                  (-(^~(8'hae))) : ((wire66 || wire39) ?
                      (wire66 ^ wire64) : wire28[(2'h2):(1'h0)])) : (+$unsigned((~|wire69)))) ?
          ((^~wire41[(1'h1):(1'h1)]) ?
              $unsigned((wire35[(3'h7):(3'h6)] ?
                  $unsigned(wire69) : wire29[(2'h2):(1'h1)])) : {wire36}) : wire68);
      reg72 <= wire30;
      if (wire28[(3'h5):(1'h0)])
        begin
          reg73 <= wire33[(2'h2):(2'h2)];
          reg74 <= $unsigned({(^($unsigned(wire69) >= wire64)), wire41});
        end
      else
        begin
          reg73 <= (wire68[(3'h4):(2'h3)] ?
              $signed({$unsigned($unsigned(wire42))}) : reg71[(3'h4):(2'h2)]);
          reg74 <= (+wire37);
          reg75 <= (wire27 - $signed(wire43));
        end
      reg76 <= (8'hb7);
      reg77 <= ((~$unsigned({$signed(wire39)})) <= (reg76 ?
          (~^reg76) : $signed((+reg74[(2'h2):(1'h0)]))));
    end
  assign wire78 = ($unsigned({reg74[(2'h2):(2'h2)]}) | wire37);
  assign wire79 = (~&(^~(reg73[(4'he):(3'h5)] <<< {wire66[(3'h6):(2'h2)]})));
  always
    @(posedge clk) begin
      reg80 <= ($signed((^wire33)) ?
          wire29[(2'h3):(2'h3)] : $signed(({$unsigned(reg74)} & $signed((wire66 ?
              reg71 : wire69)))));
      if ({{$unsigned(((wire68 ? wire33 : (8'haf)) <= (wire28 ?
                  wire70 : reg71))),
              {($unsigned(reg72) ? $signed(reg80) : (reg72 && wire68)),
                  wire79}},
          (~&$signed(wire32[(4'he):(2'h3)]))})
        begin
          reg81 <= $unsigned(reg77);
          reg82 <= (wire66 >= reg71[(3'h5):(1'h1)]);
          reg83 <= {$unsigned(($signed({wire69, wire34}) ?
                  reg72[(2'h3):(2'h2)] : reg71[(3'h7):(3'h6)]))};
          reg84 <= $unsigned(((!(wire70[(3'h4):(2'h3)] != $signed((8'hb4)))) < (~&reg83[(4'ha):(3'h7)])));
          reg85 <= $unsigned(reg83[(4'ha):(1'h1)]);
        end
      else
        begin
          reg81 <= (^$unsigned($unsigned($unsigned((~|wire27)))));
          reg82 <= ($signed(($unsigned({reg72}) * (^~((8'hb3) ?
              wire67 : wire64)))) != $signed($unsigned(wire69)));
          reg83 <= (-$signed($signed(((-(8'ha6)) >>> (^wire67)))));
          reg84 <= wire34[(4'hc):(4'h9)];
        end
      reg86 <= (wire30 ^~ wire39);
      reg87 <= $signed((($signed(wire27) ?
          $unsigned($unsigned(reg83)) : reg74[(2'h3):(2'h2)]) || (!((-(8'had)) | (^reg83)))));
    end
endmodule

module module44
#(parameter param62 = ((({(^~(8'ha7))} ? {(8'hb9), ((8'hbf) ? (8'hba) : (8'h9d))} : (((8'ha5) | (8'h9e)) ? {(8'hae)} : ((8'hb2) <<< (8'hbb)))) <<< ((((8'ha1) || (8'had)) ? ((8'hae) ? (8'hb5) : (8'hb8)) : ((8'hb2) ? (7'h41) : (8'hb5))) > (+(~&(8'hae))))) ? ({((!(8'h9c)) ? ((8'hac) - (8'ha5)) : ((8'ha9) ? (7'h43) : (8'hbe)))} << {(-(~&(8'ha8)))}) : (((((8'hb9) >> (8'h9d)) ? {(8'hb9)} : ((8'ha8) <<< (8'hbb))) ? (((7'h41) | (8'hb5)) ? (~|(8'hae)) : {(8'h9f)}) : (((8'ha0) && (8'hbf)) ? ((8'ha7) * (8'hbe)) : (~^(8'hb7)))) ? (~|((7'h41) ? ((7'h42) ? (8'hab) : (8'ha4)) : ((7'h40) - (8'hb1)))) : {{(8'ha5)}, (!((8'hbe) ? (8'ha3) : (8'ha0)))})), 
parameter param63 = {{((~(param62 ? param62 : param62)) ? param62 : (8'hb2)), ((!(param62 ? param62 : param62)) ? (param62 ^ (param62 ? param62 : param62)) : ((param62 ? param62 : param62) << (param62 & param62)))}})
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  input wire [(3'h4):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire49 = ($unsigned(wire48[(2'h3):(1'h0)]) <<< (wire46[(1'h0):(1'h0)] > $unsigned(wire45)));
  assign wire50 = wire45;
  assign wire51 = $unsigned(((~&(+(!wire48))) <<< ($signed($unsigned(wire49)) ^ $signed((wire49 ?
                      wire48 : wire48)))));
  assign wire52 = ($signed($signed((wire49 > {(8'ha2)}))) != (|$unsigned((8'ha0))));
  assign wire53 = {wire51, {(~^(&$unsigned(wire51)))}};
  assign wire54 = $signed(($unsigned(((-wire45) > wire49[(3'h4):(3'h4)])) >>> $unsigned({$signed(wire51),
                      wire48[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg55 <= $signed((wire53[(1'h1):(1'h0)] ?
          (($unsigned(wire53) ^~ (!(8'ha4))) ?
              (+(8'hb7)) : $signed(wire45[(3'h4):(1'h1)])) : wire45[(4'h9):(2'h3)]));
      reg56 <= $signed(($signed({wire46, (reg55 << wire53)}) | wire48));
    end
  assign wire57 = {((reg55[(4'h8):(3'h4)] ?
                              $signed(wire49[(2'h3):(1'h1)]) : wire46[(2'h3):(1'h0)]) ?
                          $signed(wire51[(4'h9):(2'h3)]) : ($unsigned((~wire46)) ?
                              wire48 : wire54[(1'h0):(1'h0)])),
                      wire48[(1'h0):(1'h0)]};
  assign wire58 = (~^$unsigned((wire51 << wire52)));
  assign wire59 = (!{wire58[(4'ha):(4'h8)]});
  assign wire60 = (~|wire58[(4'he):(3'h4)]);
  assign wire61 = (wire45[(4'ha):(3'h6)] <<< (~|wire54[(1'h0):(1'h0)]));
endmodule
