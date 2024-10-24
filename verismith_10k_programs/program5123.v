module top
#(parameter param99 = (8'had), 
parameter param100 = param99)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire88;
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire88,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($unsigned($signed($signed(wire4)))));
  assign wire6 = $signed({$unsigned(wire0),
                     ((~$signed(wire2)) ? (^wire3) : (^(+wire0)))});
  assign wire7 = (|{($unsigned(((8'hab) ^~ (8'hb8))) >>> ($signed(wire5) ?
                         (wire0 ? wire1 : wire6) : (wire6 == (8'hb7)))),
                     $signed((wire5 == (wire6 ? wire1 : wire3)))});
  assign wire8 = {$signed($unsigned(($signed(wire1) - wire1))),
                     $unsigned($unsigned((^~{wire0})))};
  assign wire9 = ({$unsigned((((8'ha6) >>> wire4) < $unsigned(wire2)))} ?
                     (!wire2[(2'h3):(2'h3)]) : ({$unsigned((wire8 ?
                             wire6 : wire3)),
                         ((^wire3) ?
                             (wire1 ?
                                 wire7 : wire2) : (!wire3))} == $unsigned(wire6[(2'h3):(1'h1)])));
  assign wire10 = wire7;
  always
    @(posedge clk) begin
      reg11 <= (((-wire4[(1'h1):(1'h0)]) ~^ ($unsigned((wire9 * wire9)) ?
              ((wire10 > wire4) * $signed(wire7)) : ((wire2 != wire5) <<< $signed(wire9)))) ?
          ($signed(($unsigned(wire3) ? (^~wire1) : $signed(wire9))) ?
              (((^wire1) <= (!wire5)) ?
                  wire7[(4'hf):(4'hf)] : $signed(wire7[(2'h3):(1'h1)])) : $unsigned($unsigned(wire7[(5'h13):(2'h2)]))) : wire6);
      reg12 <= (~{wire6, wire9});
    end
  assign wire13 = ({(+$unsigned(wire8))} ?
                      (wire4[(4'h9):(3'h7)] ?
                          (wire3[(1'h1):(1'h1)] ?
                              $signed(((8'hb7) ?
                                  wire0 : wire0)) : $unsigned($signed(wire8))) : (^$unsigned($signed(wire6)))) : (reg12[(4'h9):(4'h8)] ?
                          {(^~(^~wire8))} : {(~^(wire7 ? reg11 : (7'h42)))}));
  assign wire14 = wire6[(4'h8):(1'h1)];
  assign wire15 = (8'hbc);
  assign wire16 = reg11;
  module17 #() modinst89 (.wire18(wire4), .wire19(reg11), .y(wire88), .wire20(wire2), .wire21(wire1), .clk(clk));
  always
    @(posedge clk) begin
      if (wire13[(3'h4):(1'h1)])
        begin
          reg90 <= {((-wire7[(1'h0):(1'h0)]) < $unsigned({{wire7, wire14}}))};
        end
      else
        begin
          reg90 <= reg12[(3'h7):(3'h5)];
          reg91 <= (~|$signed(wire15[(5'h12):(5'h12)]));
          if (wire88[(2'h3):(2'h3)])
            begin
              reg92 <= (wire3[(1'h0):(1'h0)] ~^ $signed(wire88[(1'h0):(1'h0)]));
              reg93 <= {(wire10 ?
                      (+{(8'hbf)}) : $unsigned($unsigned((|wire10))))};
              reg94 <= (wire8 - ((($signed((8'haa)) <<< wire15[(1'h1):(1'h0)]) ?
                      $signed($unsigned(wire5)) : wire9[(3'h7):(2'h3)]) ?
                  ((((8'hbe) ^~ wire16) * wire4[(1'h0):(1'h0)]) ^ $unsigned(wire2)) : wire0[(4'he):(3'h6)]));
              reg95 <= (~($signed($signed($signed(reg91))) ?
                  reg91 : reg90[(5'h12):(5'h12)]));
            end
          else
            begin
              reg92 <= $signed($signed(reg11[(4'h9):(1'h0)]));
              reg93 <= reg93[(2'h3):(2'h2)];
              reg94 <= ($signed(reg93[(3'h5):(3'h5)]) ?
                  reg95[(1'h0):(1'h0)] : (wire16 << $unsigned(reg91)));
              reg95 <= wire8;
            end
        end
      reg96 <= $signed(wire16[(3'h5):(3'h5)]);
      reg97 <= (reg90[(2'h3):(1'h1)] ?
          (wire10[(4'h9):(1'h0)] + (((reg90 < wire6) * $signed(wire14)) ?
              {$signed(reg11),
                  wire9[(2'h3):(2'h2)]} : (~^((8'hb2) && reg91)))) : $signed(($unsigned(wire0[(3'h6):(3'h6)]) ?
              (wire5 ? (reg96 || reg96) : (~^wire7)) : (+wire2))));
      reg98 <= $signed((7'h44));
    end
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire49;
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire22,
                 wire49,
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
                 (1'h0)};
  assign wire22 = (((((wire19 | wire18) ?
                          $signed((7'h41)) : wire18) && (~^$unsigned(wire20))) <<< $signed(wire20[(3'h5):(2'h3)])) ?
                      wire21[(1'h0):(1'h0)] : (wire21[(4'hb):(1'h0)] * ((8'hb8) ?
                          (&(wire19 ?
                              wire19 : wire18)) : $signed((wire20 <<< wire19)))));
  module23 #() modinst50 (.wire28(wire21), .wire25(wire22), .y(wire49), .clk(clk), .wire27(wire18), .wire26(wire19), .wire24(wire20));
  always
    @(posedge clk) begin
      reg51 <= ($signed(wire21[(3'h4):(3'h4)]) ~^ $signed(($unsigned((wire20 ?
          (8'hb7) : wire20)) - $unsigned($signed(wire18)))));
      reg52 <= wire19[(4'ha):(2'h2)];
      if ($unsigned(($signed(($signed((8'hae)) ?
              (wire20 ? wire21 : wire18) : (!wire20))) ?
          wire19 : wire21)))
        begin
          reg53 <= wire18;
          if ($signed(((~|wire22) ^ (wire49[(1'h0):(1'h0)] ?
              {(wire20 ~^ (8'ha1))} : $signed((8'hae))))))
            begin
              reg54 <= $unsigned((7'h40));
            end
          else
            begin
              reg54 <= wire49[(2'h3):(1'h1)];
              reg55 <= (({reg53[(3'h5):(3'h5)]} <= $signed($unsigned((reg52 ?
                  (8'h9d) : wire19)))) << (8'hb7));
              reg56 <= reg54;
              reg57 <= ($unsigned({{$signed((7'h44)),
                      (~(8'hb0))}}) <<< ((~^(^~$unsigned(reg54))) <<< ((8'hb2) ?
                  wire18[(1'h0):(1'h0)] : wire22[(4'hd):(4'ha)])));
            end
          reg58 <= {wire19, (&$unsigned($signed($unsigned(wire19))))};
          reg59 <= wire19[(3'h7):(3'h5)];
        end
      else
        begin
          reg53 <= ({($signed({reg57, (8'hbb)}) ?
                  ($unsigned(reg55) >> (reg55 + reg59)) : reg57)} < (8'hbf));
        end
      reg60 <= {reg58};
      if ({reg55})
        begin
          if (((8'hbc) >>> wire49[(1'h1):(1'h1)]))
            begin
              reg61 <= wire18[(4'ha):(2'h2)];
            end
          else
            begin
              reg61 <= wire49[(3'h5):(1'h0)];
              reg62 <= reg60;
              reg63 <= wire22;
            end
        end
      else
        begin
          reg61 <= reg61;
          reg62 <= (reg52[(3'h5):(3'h4)] ?
              (~&{wire19[(2'h2):(1'h0)]}) : (^(wire49 <= wire21[(4'hf):(4'h9)])));
          reg63 <= (~&wire21[(4'hb):(1'h0)]);
          if (wire49[(2'h2):(1'h1)])
            begin
              reg64 <= $unsigned(reg52[(3'h4):(3'h4)]);
              reg65 <= $signed((+$signed((((8'ha9) << reg63) ?
                  (reg52 <= wire20) : (reg51 ? (8'hba) : wire21)))));
              reg66 <= reg65;
              reg67 <= $signed({reg57, $unsigned((~&reg65))});
            end
          else
            begin
              reg64 <= reg59[(5'h14):(3'h6)];
              reg65 <= reg55;
            end
          reg68 <= {(~|(^(~^reg60[(2'h2):(1'h0)]))),
              ($unsigned((reg62[(2'h2):(2'h2)] + $unsigned(reg65))) ?
                  (|$signed($unsigned(reg67))) : (&{((8'hb7) > reg51)}))};
        end
    end
  always
    @(posedge clk) begin
      reg69 <= reg66;
      reg70 <= $signed({(~|(~^((7'h43) ? reg56 : wire19)))});
      reg71 <= reg64;
      if (((8'ha1) - $signed(reg62)))
        begin
          reg72 <= ($signed({(~reg51), ((~reg69) ? {(8'hbb)} : reg58)}) ?
              reg52[(3'h4):(1'h0)] : {{reg65[(4'h9):(3'h5)]}, (-{reg60})});
          if (($signed((^reg57[(1'h0):(1'h0)])) > (($signed(((8'ha3) ?
                  reg56 : wire21)) || (^{reg69})) ?
              $unsigned(reg63) : (~&((reg57 ? reg54 : reg63) ?
                  (^reg60) : wire21[(3'h5):(2'h3)])))))
            begin
              reg73 <= $unsigned((^($signed(reg57[(1'h0):(1'h0)]) <<< reg55[(4'h8):(4'h8)])));
              reg74 <= ({($signed((wire18 ? reg61 : reg64)) ?
                          $unsigned({reg68,
                              reg59}) : $unsigned($unsigned(reg56))),
                      (((reg64 ? (7'h42) : reg62) < {wire49}) ?
                          ((reg57 ^ reg59) * (reg61 ?
                              (8'hb9) : reg72)) : {reg67[(5'h10):(2'h3)]})} ?
                  $signed($unsigned($signed($unsigned(reg52)))) : $signed((wire20 >= ((wire49 - wire18) ?
                      $unsigned((8'hab)) : (reg55 | (8'had))))));
              reg75 <= ((~^{$signed((reg57 ?
                      reg74 : reg56))}) ~^ reg55[(1'h1):(1'h1)]);
            end
          else
            begin
              reg73 <= (^(({$signed(reg51)} ?
                  ($signed(wire18) ?
                      (reg56 ?
                          reg53 : reg66) : {reg63}) : ((~&(8'ha5)) == reg65)) >>> (($signed((8'ha4)) ?
                  $unsigned(wire18) : reg54) ^~ reg66)));
              reg74 <= ((~|(reg73 ?
                  ($signed((8'hba)) >= (+wire21)) : ($unsigned(wire19) - ((8'hac) ?
                      reg61 : (8'ha2))))) <<< ((((wire21 ?
                      reg64 : reg70) - (~reg52)) ?
                  reg63 : {(reg69 << reg63),
                      wire20}) ^ (&($unsigned(reg75) ^ (wire20 != reg52)))));
              reg75 <= reg55[(1'h0):(1'h0)];
              reg76 <= reg55[(2'h3):(2'h2)];
              reg77 <= ($unsigned((($unsigned(reg72) && $signed(reg58)) ?
                  $signed((wire18 ?
                      (8'hb5) : reg54)) : $signed($signed(reg59)))) || $unsigned(($unsigned((wire49 ?
                  reg66 : reg56)) & (-$signed(reg76)))));
            end
          if ($signed($signed((|$signed(reg68)))))
            begin
              reg78 <= reg63;
              reg79 <= $signed($unsigned((~^((reg74 + (8'ha2)) ?
                  (reg78 - (8'hbb)) : (!reg71)))));
              reg80 <= ((reg51 ?
                      reg73[(2'h3):(1'h1)] : ({$unsigned((8'ha0))} ?
                          {(reg53 + reg77),
                              $unsigned((8'haf))} : $unsigned(reg67[(4'hf):(3'h4)]))) ?
                  reg66[(2'h3):(2'h2)] : reg58);
              reg81 <= {((reg70 ?
                          $signed(reg75[(4'hd):(1'h0)]) : ((&(8'hbc)) == $signed(reg72))) ?
                      ($unsigned((reg61 * reg67)) | (reg77 * reg77)) : {(reg73 ?
                              {(8'hb3), reg61} : (reg77 ? reg65 : reg69))})};
            end
          else
            begin
              reg78 <= $unsigned($signed(reg52[(3'h6):(3'h4)]));
              reg79 <= $signed($signed(($unsigned((reg57 * reg51)) ?
                  reg74 : (-reg68))));
              reg80 <= reg80;
              reg81 <= reg59;
            end
          reg82 <= ($signed(($signed({wire49}) << (((8'hac) - reg75) >>> (reg64 ?
              reg80 : wire20)))) && (~$signed((-{reg76, reg67}))));
        end
      else
        begin
          reg72 <= (8'ha3);
          if ($unsigned(reg54))
            begin
              reg73 <= $signed($unsigned((reg63[(1'h0):(1'h0)] == (8'ha2))));
              reg74 <= (+(((8'ha3) >= ($signed(reg71) <<< (reg58 ?
                      (8'hb6) : reg64))) ?
                  $unsigned(reg52[(1'h1):(1'h1)]) : $unsigned(reg54)));
              reg75 <= (reg74 >> (-reg67[(4'h9):(2'h3)]));
              reg76 <= ((-$signed((reg80 ?
                  $unsigned(reg67) : (reg80 ? reg74 : (8'hb2))))) - reg71);
              reg77 <= (~&$signed((~&$unsigned((|reg53)))));
            end
          else
            begin
              reg73 <= {$unsigned($unsigned((reg70[(4'h9):(3'h4)] ?
                      (8'hb8) : $signed((7'h43)))))};
              reg74 <= reg64[(3'h4):(1'h1)];
              reg75 <= reg54[(1'h1):(1'h0)];
            end
          reg78 <= reg62[(3'h5):(3'h4)];
          reg79 <= (8'ha6);
          reg80 <= reg81;
        end
      reg83 <= reg68[(3'h4):(1'h0)];
    end
  assign wire84 = $unsigned(((($unsigned((7'h42)) >= (8'h9d)) ?
                          wire20[(4'hd):(4'h8)] : reg75) ?
                      {reg67, wire19} : $unsigned({(|reg59), reg56})));
  assign wire85 = (reg56[(4'hb):(1'h1)] ?
                      $signed((((~|reg64) ?
                          $unsigned((8'hac)) : (reg78 ?
                              reg59 : wire84)) == $signed(wire84))) : $unsigned(reg65));
  assign wire86 = reg73;
  assign wire87 = $signed((|reg71[(2'h3):(2'h3)]));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 wire30,
                 wire29,
                 (1'h0)};
  assign wire29 = ($signed((wire26 ^ (wire27 ?
                          $unsigned(wire27) : $signed(wire26)))) ?
                      $unsigned((wire26[(4'h8):(3'h6)] ?
                          {wire26, (8'hba)} : ((wire24 ? wire25 : wire26) ?
                              $unsigned(wire24) : wire26))) : wire24);
  assign wire30 = (~^wire26[(3'h4):(2'h3)]);
  assign wire31 = $unsigned($unsigned(wire30));
  assign wire32 = wire26;
  assign wire33 = ($unsigned(wire24[(3'h7):(1'h1)]) && $unsigned((7'h40)));
  assign wire34 = (|((wire33[(1'h1):(1'h0)] ?
                          ($signed(wire31) ?
                              {(7'h44), (8'h9c)} : {wire25,
                                  wire33}) : (-$unsigned(wire33))) ?
                      ((((8'hab) >= wire29) ?
                          wire24 : (~wire32)) ^~ ($unsigned((7'h41)) + wire26)) : ({$signed(wire33)} ?
                          {wire25[(4'ha):(3'h4)],
                              ((8'hbc) - wire33)} : (~^(wire30 ?
                              wire26 : (8'haf))))));
  assign wire35 = (($unsigned($signed((-wire28))) ?
                      (~|($signed((8'hb9)) ?
                          $unsigned(wire34) : {wire28,
                              wire24})) : (!(8'ha5))) - $unsigned({(wire29[(5'h14):(4'h9)] ?
                          (wire32 ? wire26 : wire34) : $signed(wire34))}));
  assign wire36 = (!(wire31 | ((^(+wire25)) ? (~^(^wire31)) : (~|wire32))));
  assign wire37 = wire31;
  assign wire38 = wire33;
  assign wire39 = wire25[(4'hd):(4'ha)];
  assign wire40 = wire30[(1'h1):(1'h1)];
  assign wire41 = (-$unsigned(wire38));
  assign wire42 = (-wire30);
  assign wire43 = ((wire30[(1'h1):(1'h0)] ^ {wire26, $signed(wire42)}) ?
                      (!(((wire32 && (7'h43)) & wire29) * wire41[(2'h2):(2'h2)])) : ({(8'h9d),
                          (8'ha7)} && ($unsigned(wire39[(1'h0):(1'h0)]) ?
                          {(~|wire38),
                              (wire42 ? wire28 : wire34)} : $signed(wire24))));
  assign wire44 = (wire27 ?
                      ($signed(wire29) ?
                          $unsigned((wire40[(2'h3):(2'h2)] ?
                              $signed(wire35) : (wire25 ~^ (7'h41)))) : $signed((wire40[(2'h3):(1'h1)] ?
                              (wire30 && (8'ha4)) : {wire39}))) : $signed((($unsigned(wire39) < (wire32 && wire38)) ?
                          $unsigned((^~wire36)) : $unsigned((|wire39)))));
  assign wire45 = ((wire41[(2'h2):(1'h0)] ?
                          {wire26[(5'h10):(3'h7)],
                              {(wire42 < wire32),
                                  (|wire37)}} : ({(|(8'hb5))} ~^ wire34[(4'hf):(1'h0)])) ?
                      wire37 : (^($unsigned(wire25) == wire36)));
  assign wire46 = $unsigned($unsigned(wire40[(1'h1):(1'h0)]));
  assign wire47 = $signed($signed({((wire42 ? wire32 : wire26) ?
                          $unsigned(wire37) : (!wire44))}));
  assign wire48 = (|(~^wire41[(2'h2):(1'h1)]));
endmodule
