module top
#(parameter param117 = ((((~|((8'hbc) && (8'ha1))) ^ (((8'ha3) >> (8'ha1)) ? {(7'h40)} : ((8'hba) > (8'ha5)))) >>> ((-((8'hb8) ? (8'haf) : (8'hba))) ? (((8'hbd) >>> (8'hbf)) != (|(8'hbe))) : (((8'hbe) ~^ (8'haa)) ? ((8'hb3) != (8'hab)) : (-(8'hac))))) << (((((8'hb6) ? (7'h42) : (8'hb8)) < ((8'ha2) > (7'h44))) ? ((|(8'ha8)) ? {(8'hae), (8'hb9)} : (8'ha5)) : ({(8'ha7), (8'ha0)} | (+(8'ha1)))) && ((((8'ha1) >= (8'hb7)) & {(8'hb8), (8'hb3)}) <= ((^(8'hbf)) ? ((8'hab) ? (8'had) : (8'hbe)) : {(8'h9d), (8'ha5)})))), 
parameter param118 = ((({param117} ^ (+(param117 <<< param117))) << ({param117, (param117 ? param117 : param117)} || (|(~param117)))) ? (param117 ? (((param117 && param117) ? (param117 >= (8'hab)) : (+param117)) && {(param117 ? param117 : param117)}) : ((^~(param117 < param117)) ? param117 : ((~^param117) ? ((8'hbf) < param117) : (~param117)))) : (({(~param117)} & (!{param117})) ? (param117 <= ({(8'hba), param117} ? (param117 ? param117 : param117) : (&param117))) : ((~(~^param117)) > (!((8'h9f) ? (8'h9f) : (7'h43)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire96;
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  assign y = {wire71,
                 wire54,
                 wire53,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire51,
                 wire78,
                 wire79,
                 wire96,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg4,
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
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($signed((wire0 && $unsigned(wire1))) >= (8'haf)) != wire1[(1'h0):(1'h0)]);
      reg5 <= {$unsigned((($unsigned(wire0) ? {wire3} : ((8'hac) == wire0)) ?
              $unsigned((~&wire0)) : $unsigned($unsigned(reg4))))};
      reg6 <= $signed(wire2[(4'ha):(4'h9)]);
      if (((^~(+(+$unsigned(wire1)))) ? wire3 : $unsigned(reg5[(3'h4):(2'h3)])))
        begin
          reg7 <= reg5;
          reg8 <= wire2[(4'he):(4'h9)];
          if (reg6)
            begin
              reg9 <= (8'ha0);
              reg10 <= wire3;
              reg11 <= {$signed(reg4)};
              reg12 <= (8'ha1);
            end
          else
            begin
              reg9 <= reg6;
              reg10 <= $unsigned($unsigned($unsigned({(reg9 ? wire2 : wire0),
                  {wire3}})));
              reg11 <= (((-reg9) <<< $signed($signed($signed((8'hb1))))) ?
                  (|$unsigned({reg4, reg7})) : $signed((8'hb4)));
              reg12 <= (~^(~(8'ha6)));
            end
          if ((((($signed((8'hbb)) ? reg11 : (~&wire3)) & ((wire1 ?
                      wire3 : (8'hb6)) ?
                  (&reg6) : (wire1 | (8'hb6)))) >= (7'h42)) ?
              {{{(8'hab)},
                      $unsigned({reg4,
                          wire0})}} : $unsigned({$signed($signed(reg8))})))
            begin
              reg13 <= ($signed(reg4[(2'h3):(1'h0)]) ?
                  $signed(reg11) : $unsigned((8'haa)));
              reg14 <= ((^~(!(8'h9f))) ?
                  (~(reg12 && (-(reg9 ?
                      reg7 : wire2)))) : (reg4[(2'h3):(1'h1)] | {reg4,
                      (!{(8'ha7), reg4})}));
              reg15 <= {$unsigned((!$unsigned(((8'hb7) != (8'h9c)))))};
            end
          else
            begin
              reg13 <= wire1[(4'he):(4'hc)];
              reg14 <= ((^~wire3[(3'h6):(3'h4)]) ? $signed(reg11) : (8'hbf));
              reg15 <= reg12;
            end
        end
      else
        begin
          if ($signed({(($unsigned(reg14) ? (reg7 ? reg6 : reg12) : {reg10}) ?
                  $unsigned(((8'h9c) ^~ reg10)) : ((reg6 ?
                      (8'hba) : reg10) && reg8))}))
            begin
              reg7 <= (((wire2 ? $signed(reg13) : reg15) != {({reg7, (8'hbe)} ?
                      (^reg8) : {wire0, reg8})}) ^ reg10);
              reg8 <= reg4[(3'h4):(2'h2)];
              reg9 <= ((&reg4) ?
                  $unsigned((reg7[(1'h0):(1'h0)] ?
                      $unsigned(wire3[(2'h2):(1'h1)]) : {$signed(reg4)})) : (($signed(((8'hb3) >>> reg8)) ?
                      reg9 : $signed($signed((7'h42)))) || $signed($unsigned((wire1 ?
                      reg9 : reg8)))));
              reg10 <= $signed(reg9);
            end
          else
            begin
              reg7 <= ($unsigned((&(^~{reg9}))) | ((8'ha1) ?
                  (^(-reg13[(3'h6):(2'h3)])) : $signed($unsigned(reg15))));
              reg8 <= (^$signed($unsigned({$unsigned(reg7),
                  reg4[(2'h2):(1'h0)]})));
              reg9 <= ({{wire1[(4'he):(3'h6)], $signed({wire3, reg9})}} ?
                  ($unsigned((&(|wire3))) <<< wire2) : reg4[(2'h2):(1'h0)]);
              reg10 <= $signed($unsigned(reg11));
            end
          reg11 <= $signed((~|{reg6, ((-reg15) ? (reg13 != reg4) : wire2)}));
          reg12 <= reg9;
        end
      reg16 <= reg12;
    end
  assign wire17 = (8'haf);
  assign wire18 = wire3;
  assign wire19 = {wire3};
  assign wire20 = wire17[(3'h4):(1'h1)];
  assign wire21 = $signed(((wire20 | $signed((reg13 ?
                      (8'ha6) : (8'had)))) ^ (wire17[(2'h3):(1'h0)] ^~ $signed((reg7 == (8'ha8))))));
  assign wire22 = (((!(~|wire1[(4'hb):(3'h7)])) & $signed((reg14 && (^~reg13)))) | (($signed(reg4[(2'h2):(2'h2)]) ?
                          $signed($unsigned(wire21)) : (^((8'h9f) ?
                              reg15 : reg5))) ?
                      reg4[(1'h1):(1'h1)] : $signed((~|reg10[(5'h10):(4'hc)]))));
  assign wire23 = $signed({({$signed(reg11), $unsigned(reg16)} ?
                          (&(^reg4)) : (+{wire2, (8'ha2)}))});
  assign wire24 = (reg8 ? reg5 : reg16[(4'h9):(2'h3)]);
  assign wire25 = $unsigned($unsigned((|wire1[(4'hb):(3'h6)])));
  module26 #() modinst52 (wire51, clk, wire22, reg13, reg16, reg4);
  assign wire53 = $unsigned(({wire1, (~^reg5[(2'h3):(1'h1)])} ?
                      $signed(reg7) : ($signed($unsigned(reg11)) == ((wire1 >> reg12) * (wire23 << reg11)))));
  assign wire54 = ((+$unsigned({{wire23, (8'hb5)}, (&wire2)})) ?
                      $signed($unsigned($unsigned((wire24 ~^ wire3)))) : wire20);
  module55 #() modinst72 (wire71, clk, reg5, reg12, reg8, wire1);
  always
    @(posedge clk) begin
      reg73 <= ($unsigned((-$signed((wire2 <= wire21)))) - $unsigned((-reg13[(4'hc):(3'h4)])));
      reg74 <= ((-(($signed(wire20) ? wire22 : $signed(wire1)) ?
          wire71 : (!(&reg9)))) >>> ($unsigned({$unsigned(reg4)}) ?
          $unsigned($unsigned((8'ha4))) : (&$signed($unsigned(reg15)))));
      if (reg16)
        begin
          if (reg8)
            begin
              reg75 <= (^$signed({$unsigned($unsigned(wire1)),
                  (~(wire18 ? wire51 : wire1))}));
            end
          else
            begin
              reg75 <= $unsigned(reg9);
            end
          reg76 <= (reg74 + wire18);
        end
      else
        begin
          reg75 <= ((~|$signed((~(wire20 && (7'h41))))) ?
              wire18[(3'h4):(3'h4)] : (((wire23 ?
                          (reg12 ? wire1 : reg75) : $unsigned(reg74)) ?
                      ($unsigned(reg14) ?
                          (8'ha1) : $signed(reg13)) : $unsigned($signed((8'hb6)))) ?
                  $signed($signed(reg14[(4'ha):(4'h8)])) : (^~($signed((8'ha3)) | reg14))));
          reg76 <= $unsigned(wire71[(2'h3):(1'h0)]);
          reg77 <= wire24[(2'h3):(2'h3)];
        end
    end
  assign wire78 = ($signed($signed($signed((^~reg14)))) ?
                      $unsigned(reg75[(3'h5):(1'h1)]) : $signed(wire24[(1'h1):(1'h1)]));
  assign wire79 = wire24[(2'h2):(1'h1)];
  module80 #() modinst97 (.wire82(wire17), .clk(clk), .y(wire96), .wire81(reg14), .wire83(reg4), .wire84(reg8));
  always
    @(posedge clk) begin
      reg98 <= ((~|(~^$unsigned((~^reg75)))) - ($unsigned({wire1[(3'h7):(2'h3)]}) ?
          reg4 : $unsigned(wire96[(3'h5):(1'h1)])));
      reg99 <= reg74;
      if ($unsigned($unsigned(wire20)))
        begin
          reg100 <= (8'had);
          reg101 <= ((~&(wire79[(5'h10):(4'hc)] ^ ((reg6 >>> wire21) ?
                  (reg98 ? wire79 : wire71) : (!reg15)))) ?
              (8'hab) : wire22[(3'h6):(3'h6)]);
          if ($signed(reg74))
            begin
              reg102 <= $unsigned(wire20);
              reg103 <= reg77[(1'h0):(1'h0)];
              reg104 <= (|{$signed($signed($signed(reg74)))});
              reg105 <= ($unsigned($unsigned(($unsigned(reg99) ?
                      (wire78 ? reg102 : reg4) : wire3))) ?
                  $signed(reg74) : reg7[(5'h13):(1'h0)]);
              reg106 <= (wire21[(1'h1):(1'h0)] ?
                  $unsigned(($signed($unsigned(wire0)) > $signed(reg103[(4'h9):(4'h9)]))) : (((^~reg7[(3'h4):(1'h1)]) | wire96) & ((reg14 | wire1) & (+{reg11,
                      wire0}))));
            end
          else
            begin
              reg102 <= reg105;
              reg103 <= $unsigned(wire19[(2'h2):(1'h1)]);
              reg104 <= reg102[(4'hd):(4'hb)];
              reg105 <= reg10;
              reg106 <= $signed(($signed(((reg10 > reg101) - $unsigned((8'haa)))) ^ ($signed(wire2) * (8'h9e))));
            end
          if ((8'hab))
            begin
              reg107 <= (!($unsigned(wire17) ?
                  {({wire18} <= $unsigned(reg15)),
                      (wire71 ?
                          (8'hb5) : wire0)} : $unsigned($unsigned(reg98))));
              reg108 <= reg104;
              reg109 <= (wire1 - $unsigned((+$unsigned((wire22 | reg15)))));
            end
          else
            begin
              reg107 <= $unsigned(reg14[(2'h3):(1'h1)]);
              reg108 <= (!(((8'hb5) ?
                      (reg5 ? (^~reg107) : {reg103, wire24}) : reg74) ?
                  (+{$signed(wire51), wire79[(4'hd):(4'hd)]}) : reg75));
              reg109 <= (~|(8'ha6));
            end
        end
      else
        begin
          reg100 <= ($unsigned(($unsigned(reg109[(1'h1):(1'h0)]) ?
              ((reg10 - reg109) ?
                  (reg16 ?
                      reg14 : reg6) : (wire20 <= reg8)) : ((reg15 != reg75) << (reg4 ^ (8'ha1))))) < (~&$unsigned(reg103)));
          reg101 <= {reg13[(1'h0):(1'h0)]};
          reg102 <= (+reg105[(1'h0):(1'h0)]);
          reg103 <= reg101[(2'h2):(2'h2)];
          reg104 <= $unsigned((reg73[(2'h2):(1'h1)] ?
              {{$signed(wire19)}} : $signed(reg9[(3'h6):(3'h6)])));
        end
      if (((reg102 <<< (($signed(reg11) ? wire79 : (reg102 & reg15)) ?
              (8'ha7) : ($unsigned(reg104) ? $signed(reg14) : reg6))) ?
          $signed($unsigned({(reg98 * reg9)})) : reg108[(4'h9):(1'h1)]))
        begin
          reg110 <= $unsigned(reg102[(1'h1):(1'h1)]);
          reg111 <= wire51[(3'h7):(3'h6)];
        end
      else
        begin
          reg110 <= ($unsigned((~reg103)) <<< $unsigned(wire3));
        end
      reg112 <= reg15[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg113 <= (~&((-({wire18} - $unsigned(reg101))) ?
          wire24[(1'h1):(1'h1)] : (reg107[(3'h6):(2'h3)] ?
              $unsigned($signed((8'hbe))) : (7'h43))));
      reg114 <= reg11;
      reg115 <= (&(~(&wire17)));
      reg116 <= wire96[(3'h6):(3'h6)];
    end
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire84;
  input wire signed [(5'h10):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= (8'ha8);
      reg86 <= wire84;
    end
  assign wire87 = $unsigned($signed($unsigned($unsigned(wire84[(4'h9):(1'h0)]))));
  assign wire88 = wire83;
  assign wire89 = {$signed(wire83), $signed($unsigned(wire84[(4'hc):(4'h8)]))};
  always
    @(posedge clk) begin
      if (reg85)
        begin
          reg90 <= ((^reg86[(5'h12):(5'h11)]) && {wire81[(5'h12):(4'hb)],
              wire82[(4'h9):(3'h4)]});
          if ((-reg90))
            begin
              reg91 <= $unsigned(((($signed(wire89) ?
                      wire83[(3'h6):(2'h3)] : $unsigned(reg90)) ^ $unsigned(wire81[(5'h12):(4'hf)])) ?
                  wire81 : (+$unsigned(wire81[(5'h10):(2'h2)]))));
              reg92 <= {($signed($unsigned({wire82,
                      (7'h41)})) | ($unsigned((~^reg85)) ?
                      (reg91 + $signed(wire87)) : ((-wire88) ?
                          wire84 : (8'hab))))};
              reg93 <= {reg91, $signed(reg91)};
            end
          else
            begin
              reg91 <= (wire87[(3'h4):(1'h0)] <= {(wire88[(4'he):(2'h3)] >= (reg90[(1'h0):(1'h0)] + (wire83 ?
                      wire89 : (8'ha5)))),
                  wire81});
            end
          reg94 <= (wire87 - (~{wire88[(4'hd):(4'hd)]}));
        end
      else
        begin
          reg90 <= $signed((8'hac));
          reg91 <= ({(($unsigned((8'hbe)) ?
                          reg92[(1'h0):(1'h0)] : (wire83 ^~ reg92)) ?
                      ((~^reg86) * $signed(wire81)) : ($signed(reg92) ?
                          $signed(reg90) : (wire88 ? wire84 : reg94)))} ?
              $unsigned({reg93,
                  ($signed((8'ha2)) ?
                      $unsigned(reg86) : reg93[(2'h3):(2'h2)])}) : reg94);
        end
      reg95 <= reg93;
    end
endmodule

module module55
#(parameter param70 = {((-((^~(8'h9d)) ? ((8'ha5) & (8'hb6)) : (!(8'ha2)))) - (~^(((8'haf) ? (8'hbf) : (8'hbd)) * ((7'h40) ? (8'ha3) : (8'ha8)))))})
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire59;
  input wire signed [(3'h6):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire60;
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire60,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = ((($signed($signed(wire57)) < {wire58[(3'h4):(1'h0)],
                          {wire59}}) ?
                      ((wire56[(2'h2):(1'h1)] ?
                              (wire58 ? wire58 : wire57) : $unsigned(wire57)) ?
                          ({wire58} ?
                              (wire56 >> (8'hb7)) : $signed(wire57)) : $unsigned((wire59 ?
                              wire57 : (8'hb9)))) : wire57[(4'hc):(3'h5)]) * $unsigned($signed(($unsigned(wire57) - (wire57 ?
                      (8'hb8) : wire59)))));
  always
    @(posedge clk) begin
      if ({wire57,
          ({$unsigned($unsigned(wire56))} >>> (~&(^~(wire57 <= wire59))))})
        begin
          reg61 <= $signed((+$unsigned(({wire59,
              wire59} ^~ $unsigned(wire56)))));
          reg62 <= $signed((!reg61[(1'h0):(1'h0)]));
        end
      else
        begin
          reg61 <= $signed($signed({$signed($unsigned((7'h40)))}));
          reg62 <= wire58[(2'h2):(2'h2)];
          reg63 <= wire60[(2'h3):(2'h2)];
          reg64 <= (wire56[(2'h2):(2'h2)] ?
              $signed(({(wire60 > reg63), $unsigned(wire58)} ?
                  $unsigned((wire59 ?
                      reg61 : reg62)) : (((8'hb0) == wire56) <= reg62[(1'h1):(1'h0)]))) : ((((reg63 * wire58) != wire59) ?
                      wire59 : ($signed((8'hae)) ? wire56 : $signed(wire60))) ?
                  reg62[(1'h0):(1'h0)] : reg63));
        end
    end
  assign wire65 = wire56[(1'h1):(1'h1)];
  assign wire66 = {reg62, $signed((-reg62))};
  assign wire67 = ($signed($signed(wire58[(1'h1):(1'h1)])) * reg63[(1'h0):(1'h0)]);
  assign wire68 = $signed((!(((wire57 <<< reg64) ? {wire56} : (^~reg62)) ?
                      ((|wire56) >= {wire56,
                          wire59}) : $unsigned(wire65[(2'h3):(2'h2)]))));
  assign wire69 = wire59[(3'h5):(3'h5)];
endmodule

module module26
#(parameter param50 = ((((7'h41) >> (^~{(7'h41)})) ? (^(~((8'hbd) * (8'hae)))) : {{(!(7'h42)), (~|(8'haf))}, (8'ha4)}) ? (((8'hb9) >>> (((8'hb2) == (8'ha6)) <<< ((8'ha6) ? (7'h40) : (8'hb0)))) ? {((|(8'haa)) + {(7'h43)}), ((^(8'ha5)) ? (~^(8'hbf)) : ((7'h44) * (8'had)))} : (+({(8'h9d), (8'ha0)} ? ((8'hb4) ? (8'ha3) : (8'h9d)) : ((8'ha1) | (8'hb4))))) : (((~|((8'hac) ^~ (7'h43))) ? (^((8'ha9) ? (8'h9c) : (8'hb2))) : ({(8'hb1), (8'hb4)} - ((8'ha8) - (8'ha0)))) * (~^(-(~(8'had)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire31;
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire36,
                 wire31,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = $unsigned(wire28);
  always
    @(posedge clk) begin
      reg32 <= (&wire27[(3'h5):(2'h2)]);
      reg33 <= $unsigned({(~^wire30), reg32[(3'h6):(3'h6)]});
      reg34 <= wire28;
      reg35 <= $signed((((reg32[(4'ha):(3'h4)] ?
          $unsigned(reg34) : reg33[(4'hc):(3'h5)]) | reg33) || {reg33}));
    end
  assign wire36 = $signed($signed(wire31[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg37 <= $signed(wire31[(4'h9):(3'h7)]);
      reg38 <= ($signed((wire30 ?
              wire27[(4'ha):(1'h0)] : ((wire29 > reg34) ?
                  wire27 : (reg37 ? wire27 : reg35)))) ?
          wire27[(4'hd):(3'h4)] : wire29);
      if ((~|$unsigned($unsigned(wire28))))
        begin
          reg39 <= $unsigned(reg37[(4'hc):(4'h9)]);
        end
      else
        begin
          reg39 <= (!(-$unsigned({{reg32}})));
        end
      reg40 <= (reg37 ?
          $unsigned($signed(($unsigned(wire27) >= $signed(wire29)))) : $signed(($signed($unsigned(wire30)) ~^ wire27[(4'hd):(3'h7)])));
    end
  always
    @(posedge clk) begin
      if ((($unsigned($signed({reg33, wire28})) ?
              (((wire36 ? reg34 : wire29) * (wire29 ?
                  wire28 : reg32)) | reg39) : (7'h43)) ?
          ((reg35[(1'h0):(1'h0)] ?
              reg34[(4'hc):(4'ha)] : wire31) != (wire31[(3'h7):(3'h5)] ?
              reg40 : wire31[(4'h9):(3'h6)])) : (~&wire30[(4'h8):(4'h8)])))
        begin
          reg41 <= ($signed($signed(wire30)) ?
              wire29 : (wire27 <<< $unsigned($signed((reg37 > reg35)))));
          reg42 <= wire36;
          reg43 <= $signed((wire30[(1'h1):(1'h1)] <= $signed($signed((wire36 ~^ (8'hb8))))));
        end
      else
        begin
          reg41 <= ((8'hab) ?
              {{reg37[(3'h7):(2'h2)],
                      $signed(((7'h43) <<< wire29))}} : $signed($signed(wire29[(4'hc):(1'h0)])));
          reg42 <= (+wire31);
          reg43 <= (|wire31);
          reg44 <= $unsigned((&(reg39[(4'h9):(3'h6)] ?
              ($signed(reg41) ? $signed((7'h43)) : {reg42}) : reg34)));
          reg45 <= (reg38 ?
              {(-((reg37 >>> wire27) ?
                      (reg42 ?
                          reg33 : reg32) : reg43))} : $unsigned(($unsigned((8'hb6)) ?
                  $signed($unsigned(reg33)) : ((8'hb3) ?
                      {reg40} : {reg40, reg42}))));
        end
      reg46 <= reg45[(2'h2):(1'h0)];
      reg47 <= ((({{wire27, reg40}} ?
          $signed(wire28[(5'h13):(3'h6)]) : reg35[(2'h2):(1'h0)]) < $unsigned(reg38)) >>> $signed($unsigned((8'ha1))));
    end
  assign wire48 = wire27[(4'h8):(4'h8)];
  assign wire49 = $unsigned($unsigned((8'hb8)));
endmodule
