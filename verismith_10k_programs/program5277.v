module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire89;
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire89,
                 reg98,
                 (1'h0)};
  assign wire5 = $signed((8'hb8));
  assign wire6 = (^(^($unsigned((!wire4)) - $unsigned(wire3))));
  assign wire7 = ((^wire3) < $signed({$unsigned((wire1 ? (8'ha8) : wire1))}));
  assign wire8 = (^wire7[(4'he):(3'h5)]);
  assign wire9 = ((~(8'hb0)) >= $unsigned($unsigned({$unsigned(wire5),
                     wire1[(4'hf):(4'he)]})));
  assign wire10 = wire0;
  assign wire11 = wire8[(3'h4):(2'h3)];
  assign wire12 = wire3[(1'h1):(1'h1)];
  assign wire13 = wire11;
  assign wire14 = wire2;
  assign wire15 = (|$signed((^~$signed(((8'hbb) ? wire4 : (8'ha7))))));
  assign wire16 = (^$unsigned($unsigned(($unsigned(wire3) ?
                      ((8'haf) == (8'h9d)) : $signed(wire13)))));
  module17 #() modinst90 (.wire20(wire10), .clk(clk), .wire22(wire12), .wire21(wire1), .wire18(wire0), .wire19(wire9), .y(wire89));
  assign wire91 = $unsigned((~|($unsigned((wire3 ^~ wire4)) ?
                      (wire9[(4'ha):(1'h0)] ^~ $unsigned(wire14)) : $signed(((7'h44) == wire13)))));
  assign wire92 = wire12;
  assign wire93 = (~|wire4);
  assign wire94 = (wire6 + wire2);
  assign wire95 = (wire12[(3'h4):(3'h4)] ?
                      $signed(((wire8[(4'ha):(3'h4)] ?
                              $signed((8'hbf)) : (wire91 ? wire93 : wire13)) ?
                          wire91 : (wire94 ?
                              {wire92} : (wire9 ^~ wire10)))) : $unsigned($unsigned(wire92[(1'h1):(1'h1)])));
  assign wire96 = wire6;
  assign wire97 = (8'hb2);
  always
    @(posedge clk) begin
      reg98 <= wire96[(3'h7):(3'h5)];
    end
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire27,
                 wire24,
                 wire23,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire23 = ({(wire19[(4'hb):(2'h3)] && {(8'haf)}),
                          (&$unsigned({wire21}))} ?
                      wire21[(4'ha):(4'h8)] : wire21);
  assign wire24 = {wire19[(1'h1):(1'h0)], wire19[(4'ha):(4'h8)]};
  always
    @(posedge clk) begin
      reg25 <= $signed(wire19);
      reg26 <= (!(~{$unsigned(wire21[(3'h6):(1'h0)])}));
    end
  assign wire27 = reg26[(2'h2):(2'h2)];
  module28 #() modinst85 (wire84, clk, reg25, wire18, wire27, wire21, wire24);
  assign wire86 = $unsigned(reg26);
  assign wire87 = (^$signed((((wire22 != wire18) < reg25[(3'h4):(2'h2)]) - (8'ha2))));
  assign wire88 = (wire24[(1'h1):(1'h1)] ?
                      (~^(+wire84)) : (($signed(wire86[(3'h5):(1'h0)]) >= ($signed((8'haf)) ?
                          (wire18 * (8'hbc)) : (wire24 ?
                              wire22 : wire22))) > (-(~|$signed(wire21)))));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h22f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire76,
                 wire56,
                 wire55,
                 wire54,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 (1'h0)};
  assign wire34 = {{(wire30 ?
                              (wire31 ?
                                  wire33[(4'hf):(3'h4)] : (~&wire31)) : ((wire32 ^~ wire30) ?
                                  $signed(wire31) : wire31)),
                          (((~&(7'h41)) ?
                              ((8'ha1) ?
                                  wire29 : wire31) : (wire32 == wire29)) < {(8'h9c)})},
                      $signed((wire30 - {(wire29 ? wire31 : wire32)}))};
  assign wire35 = ((wire33[(4'ha):(1'h1)] < $signed({(!(8'ha0)),
                          (wire31 ? (7'h40) : wire29)})) ?
                      (^~wire32) : $signed(($unsigned(wire33) ?
                          (!(wire33 ? wire31 : wire34)) : ((wire33 ?
                                  wire34 : (8'had)) ?
                              wire29[(5'h10):(3'h6)] : $signed(wire34)))));
  assign wire36 = $unsigned($signed($signed($unsigned($unsigned((8'hb3))))));
  assign wire37 = (~^wire34[(3'h4):(1'h0)]);
  assign wire38 = wire36;
  always
    @(posedge clk) begin
      if ({{(((wire35 ? wire34 : (7'h40)) >> (wire32 | wire29)) ?
                  ((wire31 >> wire34) ?
                      $unsigned(wire30) : ((8'haf) & wire36)) : (^~$unsigned(wire32))),
              wire36[(3'h7):(3'h5)]},
          wire36})
        begin
          reg39 <= $signed((~&$unsigned((&{wire30, wire36}))));
          if ((^~wire30))
            begin
              reg40 <= (^~(^$signed(((wire37 >> wire32) ?
                  wire33[(4'h8):(3'h4)] : wire31[(4'h8):(3'h6)]))));
              reg41 <= wire37[(1'h0):(1'h0)];
            end
          else
            begin
              reg40 <= wire34;
              reg41 <= $unsigned($signed(({(wire30 >>> (8'ha3))} ?
                  {{(8'haa)}} : reg41[(2'h2):(2'h2)])));
              reg42 <= (((($signed(wire36) >= $unsigned(wire31)) ^~ $signed(((8'hb4) >>> wire35))) ?
                      {((wire35 ? wire36 : reg41) ?
                              $signed(wire29) : (wire35 ? wire29 : (8'hb1))),
                          wire30[(1'h0):(1'h0)]} : (|$signed(wire37[(1'h0):(1'h0)]))) ?
                  wire37[(1'h0):(1'h0)] : wire30[(3'h7):(2'h2)]);
            end
          if ($unsigned(wire32))
            begin
              reg43 <= (($signed((|(reg39 & (8'ha7)))) ?
                  wire36[(3'h6):(3'h5)] : (-wire32[(3'h5):(2'h2)])) && $unsigned($unsigned($signed(((8'ha6) ?
                  wire35 : wire32)))));
              reg44 <= reg41;
              reg45 <= $signed(wire35[(5'h10):(4'hd)]);
            end
          else
            begin
              reg43 <= ((((8'ha4) ?
                          $unsigned(wire32) : {wire33[(5'h10):(4'he)],
                              reg39[(2'h2):(2'h2)]}) ?
                      (((reg45 ? reg45 : wire31) < (wire33 <<< wire33)) ?
                          (!(reg45 ~^ (8'ha2))) : wire35) : ({wire30} >> ((reg40 <<< wire31) && (reg44 ?
                          wire34 : wire38)))) ?
                  $signed((8'h9e)) : wire38[(4'hd):(3'h6)]);
              reg44 <= ((-($signed(reg40[(3'h6):(1'h1)]) ^ wire29[(1'h1):(1'h0)])) ?
                  $unsigned($unsigned((~$unsigned(wire38)))) : wire32[(2'h3):(2'h2)]);
              reg45 <= ((($signed((7'h41)) ?
                          {$unsigned(reg41), (!(7'h41))} : {wire36}) ?
                      (+(wire38[(3'h7):(3'h5)] ?
                          (reg45 != wire34) : (reg45 << wire37))) : ($signed((8'ha1)) ?
                          ((reg40 + (7'h43)) <= wire33) : ((~&reg41) * wire34))) ?
                  ({($signed(wire32) & $unsigned(wire31))} ~^ {reg44[(3'h6):(2'h3)]}) : $signed((~^reg44[(3'h6):(3'h4)])));
            end
          if ($signed({((reg39[(1'h1):(1'h0)] + (~|(8'hbf))) ?
                  ((reg39 ?
                      reg40 : wire32) & {wire29}) : wire30[(3'h7):(3'h4)]),
              reg40[(1'h1):(1'h0)]}))
            begin
              reg46 <= ((8'hae) ?
                  wire36[(4'h8):(3'h5)] : ({(~(reg44 ?
                          reg42 : reg39))} < (~&$signed($unsigned(wire35)))));
              reg47 <= (reg45 > (~((wire32[(1'h1):(1'h1)] >>> (~&wire38)) != reg43)));
              reg48 <= (~&wire38[(3'h5):(3'h4)]);
              reg49 <= ($unsigned((8'hb8)) ^ ((8'hb9) ?
                  $unsigned((~|reg42)) : $unsigned((|(reg44 == reg47)))));
            end
          else
            begin
              reg46 <= (wire36 < (~{((wire36 <= reg41) == wire33[(3'h7):(1'h0)])}));
              reg47 <= {$signed((^({wire33, wire34} + $signed(reg44))))};
              reg48 <= $signed($signed(reg42[(1'h1):(1'h0)]));
              reg49 <= (-$unsigned(($signed((^wire33)) ?
                  $unsigned((^~reg47)) : (!{reg42, reg44}))));
            end
          reg50 <= (8'ha4);
        end
      else
        begin
          reg39 <= $unsigned((-(wire38[(4'ha):(2'h3)] && (8'hb5))));
          reg40 <= reg43;
        end
      reg51 <= ($unsigned($signed($unsigned((wire31 >= wire30)))) >> reg41);
      reg52 <= ({$signed((~^(+wire35)))} >> ($signed(($unsigned(reg42) + $signed(wire29))) ^~ {(^~wire29),
          $signed(((8'hba) ? reg40 : reg43))}));
      reg53 <= (8'hbf);
    end
  assign wire54 = (+wire32[(2'h3):(2'h2)]);
  assign wire55 = (({wire29[(3'h5):(3'h5)],
                          {wire30[(3'h7):(2'h3)], {reg39}}} & wire33) ?
                      $signed(reg51[(1'h1):(1'h0)]) : {$signed((!{wire36,
                              reg51}))});
  assign wire56 = wire32;
  always
    @(posedge clk) begin
      if (reg52)
        begin
          reg57 <= (!(reg47 ? $signed((reg45 >> {reg50, wire36})) : wire31));
        end
      else
        begin
          reg57 <= (reg57[(3'h4):(2'h2)] ? wire33 : (+wire36[(4'ha):(3'h7)]));
        end
      if (reg43)
        begin
          reg58 <= ($signed((!$unsigned((!reg50)))) ?
              (({reg46, reg52} ?
                      reg53[(1'h0):(1'h0)] : ($signed(wire55) * $unsigned(reg43))) ?
                  $signed((!$signed(wire29))) : (8'hae)) : $unsigned(($unsigned((reg40 ?
                  reg49 : reg50)) <= $unsigned(((8'hba) >> wire29)))));
          reg59 <= {$unsigned($signed($signed(reg57)))};
          reg60 <= {($unsigned(wire34[(3'h4):(2'h2)]) ?
                  {$signed({(8'hb0)}),
                      {(reg47 ? wire29 : reg39)}} : reg48[(4'h8):(3'h4)]),
              {{$unsigned($unsigned(wire56))}}};
          reg61 <= ($unsigned(($unsigned($signed(wire37)) > wire34[(2'h2):(2'h2)])) >>> (-reg59[(1'h0):(1'h0)]));
        end
      else
        begin
          reg58 <= reg58;
          if (reg43)
            begin
              reg59 <= reg42[(4'h9):(2'h3)];
            end
          else
            begin
              reg59 <= (!($unsigned(wire38) && (reg45[(2'h3):(1'h1)] ?
                  (!$unsigned((8'ha5))) : {(+wire35)})));
              reg60 <= reg60;
              reg61 <= {reg40[(3'h7):(3'h7)],
                  (+($signed({wire56}) ?
                      wire36[(4'h9):(1'h1)] : wire29[(4'h9):(3'h6)]))};
              reg62 <= (&$signed(wire38));
            end
          reg63 <= (~&(wire32 - reg45));
          reg64 <= reg43[(1'h1):(1'h1)];
          reg65 <= $unsigned((~reg48));
        end
      reg66 <= (reg65[(5'h15):(3'h6)] != wire38);
      if (($unsigned((((-reg46) ? {reg63} : $signed(wire38)) ?
          (((8'hb1) != reg46) <<< (reg49 ?
              reg61 : wire30)) : {$signed(reg64)})) <<< {reg43}))
        begin
          if (($signed(reg45[(1'h1):(1'h0)]) > ($unsigned((^((8'hba) * reg47))) >>> $unsigned((wire54[(4'hb):(4'hb)] >> (reg45 ?
              reg66 : reg53))))))
            begin
              reg67 <= $signed((~&{$signed((reg60 ? reg60 : reg44)),
                  $signed($signed(reg51))}));
              reg68 <= reg44;
              reg69 <= ((^(~&((reg59 ? reg67 : reg41) ?
                  (wire55 ? reg53 : reg65) : reg59))) ^~ (reg67 & reg52));
              reg70 <= (~|wire30[(3'h5):(2'h3)]);
              reg71 <= wire30;
            end
          else
            begin
              reg67 <= $unsigned($signed((wire34 >>> (~|$unsigned(reg52)))));
              reg68 <= ($unsigned(($unsigned({(8'haf),
                  reg50}) ^~ $signed({reg47}))) <= $unsigned(({$unsigned(reg61)} ?
                  (~&$signed((8'hab))) : ((reg49 ^~ wire30) + (8'h9d)))));
              reg69 <= $signed($signed((~&($signed(reg66) ?
                  (wire35 + reg70) : wire32[(3'h5):(2'h2)]))));
              reg70 <= ($unsigned((|(reg65[(4'hb):(3'h6)] || (reg43 ?
                  wire33 : wire30)))) && reg67[(3'h6):(1'h1)]);
            end
          reg72 <= $signed(wire29[(3'h5):(3'h5)]);
          reg73 <= $signed({(!$unsigned($unsigned(wire55)))});
        end
      else
        begin
          reg67 <= wire37[(1'h0):(1'h0)];
          reg68 <= $unsigned((reg62 ?
              reg51[(3'h7):(1'h1)] : ((+(reg71 << wire34)) ^~ ($unsigned(reg57) ?
                  $signed(reg50) : wire33[(4'h9):(1'h1)]))));
          if (((reg68[(2'h2):(1'h0)] && ({{wire37,
                      reg44}} << $unsigned((reg66 && reg53)))) ?
              (~^reg67[(2'h2):(2'h2)]) : (^~$signed(({reg67} < wire31[(4'h8):(3'h7)])))))
            begin
              reg69 <= ($signed({(reg63 ? ((8'ha8) || wire30) : $signed(reg72)),
                  $unsigned({wire55, (8'hbe)})}) >= (&$signed(reg67)));
              reg70 <= (({(&(reg69 << reg51)),
                      {((8'h9f) <= wire54)}} >= $signed($unsigned(reg39))) ?
                  {(((^reg39) >> $unsigned(reg61)) ~^ (~|$signed(reg39)))} : (8'hb7));
              reg71 <= ($signed(($unsigned(reg65[(3'h5):(3'h5)]) || ($unsigned(reg63) ?
                      wire29 : $unsigned(reg52)))) ?
                  $signed((reg39[(3'h4):(1'h0)] | reg72)) : wire36[(4'hb):(4'hb)]);
              reg72 <= reg58;
              reg73 <= wire32;
            end
          else
            begin
              reg69 <= $unsigned(((((reg57 ?
                  wire36 : (8'ha2)) & (reg62 > reg60)) ~^ {(reg45 + reg65),
                  $unsigned(reg53)}) >> reg46[(4'h8):(1'h0)]));
            end
          reg74 <= reg45;
          reg75 <= (reg72[(3'h6):(2'h2)] ?
              ((|$unsigned((reg48 >= reg40))) >> (((reg69 ? reg63 : reg41) ?
                      (reg41 ^~ reg53) : reg72) ?
                  ($signed((8'had)) & $unsigned(reg60)) : ($unsigned((8'ha0)) ?
                      ((8'hbb) ? wire32 : wire55) : {reg48,
                          wire29}))) : ((+wire36[(4'h8):(2'h3)]) ?
                  $signed(reg71[(3'h5):(1'h1)]) : {$signed($signed(reg41)),
                      $signed((reg71 ? wire37 : reg70))}));
        end
    end
  assign wire76 = (^$signed((reg58[(2'h3):(2'h2)] <= reg70)));
  always
    @(posedge clk) begin
      reg77 <= (wire37[(1'h0):(1'h0)] ?
          ($signed(wire30[(1'h1):(1'h0)]) ^~ $signed($unsigned({reg58,
              wire76}))) : (wire56 ? ($unsigned((-reg73)) ^~ reg48) : wire29));
      reg78 <= {$signed(((reg65 ?
              $signed(reg47) : reg61[(2'h2):(1'h1)]) >>> (&$unsigned((8'hba)))))};
      reg79 <= (^~reg75);
      reg80 <= $signed(((8'hbf) || $unsigned(($signed(reg61) ?
          (+wire30) : $signed((8'hbe))))));
      reg81 <= $unsigned((reg67[(4'hd):(3'h5)] ?
          $unsigned($unsigned(((8'haa) << wire76))) : (((reg79 ?
              wire36 : wire30) != $signed(reg52)) ^~ (|{reg78}))));
    end
  assign wire82 = $signed((^$unsigned(wire56)));
  assign wire83 = reg52;
endmodule
