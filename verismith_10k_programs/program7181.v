module top
#(parameter param128 = ((((((8'ha2) ? (8'hab) : (8'hb2)) ? (|(8'hbc)) : ((8'hb4) ? (7'h44) : (8'ha7))) + (+((8'ha7) && (8'haa)))) ^ (((&(8'hbe)) ? (^~(8'ha2)) : ((8'hb6) & (8'ha8))) ? ({(8'ha5), (8'ha1)} <<< {(7'h42), (8'h9e)}) : (((8'had) ? (8'hb4) : (8'h9c)) << ((7'h43) ? (8'hbe) : (8'hbe))))) ? ((((8'h9c) || {(8'hb3), (8'h9c)}) * (^((8'ha6) ? (8'ha5) : (8'had)))) ? (+{(^~(8'hb4))}) : (!{((8'hb6) ? (8'ha4) : (8'ha0)), ((8'hb4) ? (8'ha4) : (8'hbe))})) : {((((7'h44) ? (8'hb1) : (8'h9e)) ? ((7'h44) ? (7'h40) : (8'hbb)) : {(8'hbc), (7'h41)}) & ((~&(8'hbc)) ? (8'hbc) : ((8'ha2) < (8'ha9))))}), 
parameter param129 = ((param128 <<< (((param128 + param128) ? (param128 ? param128 : param128) : (^~param128)) ? {{param128, param128}, ((8'ha0) || (8'hb0))} : param128)) ^~ ((8'hac) > (-(&(param128 ? param128 : param128))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  assign y = {wire110,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire79,
                 wire77,
                 wire33,
                 wire31,
                 wire30,
                 wire16,
                 wire15,
                 wire5,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 reg97,
                 reg96,
                 reg95,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
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
                 reg28,
                 reg29,
                 reg32,
                 (1'h0)};
  assign wire5 = $signed(wire4);
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire4[(1'h1):(1'h1)])))
        begin
          reg6 <= (!(|wire3));
          if ($unsigned((~&$unsigned(({reg6} ^~ wire5)))))
            begin
              reg7 <= wire0;
            end
          else
            begin
              reg7 <= wire3[(2'h2):(2'h2)];
              reg8 <= ($signed(($unsigned((+wire3)) ?
                      ($signed(wire3) ? (reg7 >= wire5) : wire1) : ((wire5 ?
                              (8'had) : reg7) ?
                          (wire5 * wire2) : {wire2, reg7}))) ?
                  {(&wire0)} : (^wire3[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          if (wire3)
            begin
              reg6 <= reg8[(2'h3):(2'h3)];
            end
          else
            begin
              reg6 <= reg7[(3'h4):(2'h2)];
            end
          if ($unsigned($unsigned($unsigned(((wire1 ?
              wire3 : wire4) == $unsigned(wire2))))))
            begin
              reg7 <= (reg8[(4'ha):(4'h8)] ?
                  {((|$unsigned(wire0)) | $unsigned({reg6, wire4})),
                      $signed(wire5[(2'h2):(1'h0)])} : $unsigned((wire4[(3'h5):(2'h2)] ?
                      reg8[(1'h1):(1'h0)] : $unsigned($signed(reg6)))));
              reg8 <= ($unsigned($signed(wire1)) || $signed((((wire3 ?
                      wire0 : reg7) ?
                  (8'hb9) : (wire1 >> wire3)) > {$signed(reg6)})));
              reg9 <= (reg7[(4'hc):(3'h4)] == wire5[(3'h6):(1'h0)]);
              reg10 <= $signed(((&wire2) ^~ wire0[(2'h2):(1'h0)]));
              reg11 <= ($signed($signed({reg6[(3'h5):(2'h2)]})) && reg9);
            end
          else
            begin
              reg7 <= reg8[(3'h7):(2'h2)];
            end
        end
      reg12 <= ((($unsigned($signed(reg10)) << (&(wire5 >= reg7))) ?
              ($unsigned((~wire3)) == wire4[(4'h8):(1'h0)]) : $signed(reg7[(4'h8):(1'h1)])) ?
          ({wire3} ?
              wire0 : $signed(reg6)) : $unsigned(($unsigned((~wire2)) & {reg9[(1'h1):(1'h0)]})));
      reg13 <= ($unsigned(wire3[(1'h0):(1'h0)]) * (wire3 <<< $unsigned(wire0[(4'hc):(3'h5)])));
      reg14 <= reg6;
    end
  assign wire15 = $signed($unsigned(wire1[(1'h0):(1'h0)]));
  assign wire16 = ({wire4[(3'h4):(3'h4)]} < reg7);
  always
    @(posedge clk) begin
      reg17 <= reg6;
      if ((^reg7))
        begin
          reg18 <= $unsigned((8'ha2));
          reg19 <= (wire3[(3'h4):(1'h1)] ?
              $signed((wire3 ?
                  ((!wire16) ?
                      reg17 : (~|wire4)) : wire0[(2'h3):(2'h3)])) : reg11);
          reg20 <= $unsigned($signed((((reg8 < reg12) ?
              ((8'hae) ? wire16 : (8'ha0)) : (&reg17)) ^~ (~|(wire16 ?
              reg9 : reg10)))));
          if ((+(~(8'ha2))))
            begin
              reg21 <= $unsigned(wire4);
              reg22 <= (reg8[(4'h8):(1'h1)] ?
                  (~(~^{$signed(wire0), {wire4, reg11}})) : (!reg8));
              reg23 <= $unsigned((wire15[(4'hc):(3'h5)] || $unsigned(reg7[(4'ha):(2'h2)])));
            end
          else
            begin
              reg21 <= {($signed($unsigned({reg21,
                      reg10})) != $unsigned($unsigned({reg11, (8'hb2)}))),
                  $unsigned(((&$unsigned(reg21)) <= $unsigned($unsigned(reg22))))};
              reg22 <= $signed(reg14);
              reg23 <= $unsigned($signed(reg20[(4'h9):(2'h2)]));
              reg24 <= wire16;
              reg25 <= $signed($unsigned($unsigned((reg22[(3'h4):(1'h0)] << (reg14 == reg13)))));
            end
          reg26 <= {reg11[(3'h7):(3'h6)]};
        end
      else
        begin
          reg18 <= reg26[(2'h3):(1'h0)];
          reg19 <= $signed((reg25 ?
              reg23[(4'h8):(4'h8)] : $unsigned(((reg17 ? wire1 : reg20) ?
                  reg6 : (^reg6)))));
          reg20 <= wire16[(3'h4):(1'h1)];
        end
      reg27 <= $unsigned(reg24[(4'h9):(4'h8)]);
      reg28 <= reg23;
      reg29 <= ($unsigned((((reg8 ? reg11 : reg13) ?
                  (!reg21) : $unsigned(reg7)) ?
              ((reg27 * reg8) ?
                  reg9 : (reg7 ? reg25 : reg6)) : $signed($unsigned(reg8)))) ?
          (reg20 ?
              reg7 : ((^(reg21 & reg10)) ?
                  ((reg14 & reg19) ?
                      (reg17 >> reg12) : (wire4 ?
                          wire15 : reg19)) : ($signed((8'hb1)) != wire15))) : $unsigned(($signed($unsigned((7'h41))) ~^ $unsigned((reg23 <<< wire16)))));
    end
  assign wire30 = reg18;
  assign wire31 = ($signed(wire16) - reg12);
  always
    @(posedge clk) begin
      reg32 <= $signed(($unsigned($unsigned((^~reg6))) ?
          (&({reg18} ?
              (^~reg21) : wire3[(1'h0):(1'h0)])) : (~$signed($signed(reg7)))));
    end
  assign wire33 = (8'hbb);
  module34 #() modinst78 (wire77, clk, reg24, wire15, reg20, reg8, wire33);
  assign wire79 = {{reg28,
                          ($unsigned(((8'hb7) ?
                              reg27 : wire15)) ^~ ($signed(wire30) + (~&reg20)))},
                      reg9};
  always
    @(posedge clk) begin
      if ($signed($signed(($signed(((8'h9c) ? wire79 : reg20)) && ((reg22 ?
          wire30 : wire3) == wire31)))))
        begin
          reg80 <= reg28;
          reg81 <= (!$unsigned($signed(reg19[(2'h2):(1'h0)])));
          reg82 <= wire16;
          reg83 <= ((~|{$signed(((8'ha5) <= reg81))}) ?
              $signed($unsigned(((^wire1) - $unsigned(reg8)))) : {(reg14[(4'h9):(3'h4)] < reg80[(3'h5):(1'h1)])});
        end
      else
        begin
          reg80 <= (($signed((8'ha8)) | $signed(reg20[(1'h1):(1'h1)])) ?
              ({(reg26 ? reg11[(3'h4):(3'h4)] : (wire16 ? (8'hbb) : reg29))} ?
                  (~&(^reg81)) : (~|($unsigned((8'ha1)) + reg29[(1'h1):(1'h0)]))) : wire30[(4'h8):(3'h7)]);
          reg81 <= reg23[(1'h0):(1'h0)];
          reg82 <= (^~{($signed(reg14[(1'h1):(1'h0)]) ?
                  $signed($signed(reg26)) : (!reg6))});
          reg83 <= $signed(wire1);
        end
      reg84 <= wire33[(5'h10):(4'he)];
      reg85 <= reg81;
      reg86 <= ((($signed((~^reg21)) >>> $unsigned(wire2[(2'h2):(2'h2)])) == reg9[(1'h1):(1'h0)]) ?
          $unsigned(reg11[(3'h6):(2'h3)]) : $signed({((reg29 ^ reg6) ?
                  (wire77 ? (8'hb0) : wire30) : (reg11 ? wire33 : reg85))}));
    end
  assign wire87 = $unsigned({$unsigned((+(reg24 * wire3))),
                      ($unsigned(wire77[(2'h3):(1'h0)]) == $unsigned((~|wire77)))});
  assign wire88 = reg32;
  assign wire89 = (reg27[(4'ha):(2'h2)] ?
                      (-(wire1[(2'h3):(1'h1)] >> $unsigned(wire33))) : wire15);
  assign wire90 = reg17;
  assign wire91 = reg84[(3'h4):(2'h3)];
  assign wire92 = (^($unsigned(reg8) <= (reg7[(1'h1):(1'h0)] ?
                      $signed((8'ha7)) : ((!(8'ha9)) ?
                          wire87[(2'h2):(1'h1)] : (reg81 ? (8'hbb) : reg19)))));
  assign wire93 = wire4[(3'h6):(2'h2)];
  assign wire94 = reg11[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ((8'hb3))
        begin
          reg95 <= (8'ha1);
          reg96 <= $signed($unsigned(({$unsigned(reg7),
                  (wire91 ? reg9 : reg22)} ?
              ((reg26 <= wire16) ?
                  reg85[(2'h2):(2'h2)] : (wire33 >= wire0)) : wire5)));
          reg97 <= (reg28[(2'h3):(2'h2)] ?
              $signed(wire87) : ((wire0[(4'he):(3'h4)] ?
                  wire88 : $unsigned(wire88[(1'h0):(1'h0)])) | reg12));
          reg98 <= ($unsigned($unsigned((|(reg22 ?
              reg86 : wire91)))) - reg17[(4'hc):(2'h3)]);
          reg99 <= ((reg9 << reg82[(4'hb):(2'h3)]) == $signed($unsigned(reg85)));
        end
      else
        begin
          if (wire89)
            begin
              reg95 <= (reg80 >>> ((~|$signed($signed(reg20))) - $unsigned(({(8'ha1)} >>> (7'h41)))));
              reg96 <= ($unsigned((((reg14 ? wire16 : (8'hae)) ?
                      $unsigned(reg84) : reg99) ?
                  $signed($signed((8'hb3))) : reg82)) | ({reg26[(1'h1):(1'h0)]} != ({(reg20 >= reg32)} ?
                  reg85[(3'h5):(1'h1)] : (8'hb9))));
              reg97 <= ((!$signed((-reg99[(3'h6):(3'h6)]))) == reg25[(4'hd):(3'h5)]);
            end
          else
            begin
              reg95 <= $signed((+(8'haa)));
              reg96 <= $unsigned(((reg12 + wire79[(3'h4):(1'h1)]) ?
                  {($signed(wire79) != (reg83 ? reg27 : reg22)),
                      (-$signed(reg24))} : (~|reg17)));
              reg97 <= {({reg25[(1'h1):(1'h0)], reg83[(3'h4):(1'h0)]} ?
                      ($signed(wire5[(2'h3):(2'h3)]) != reg84[(4'he):(4'hc)]) : $unsigned((~wire3))),
                  (^(^~wire4))};
            end
          reg98 <= (~reg28);
          reg99 <= wire89[(3'h5):(2'h3)];
          reg100 <= $signed((^$signed(wire5[(3'h7):(2'h3)])));
          if (reg25[(4'h8):(3'h5)])
            begin
              reg101 <= $signed($signed($signed((wire88[(2'h2):(1'h1)] ?
                  $unsigned(reg23) : $unsigned(reg10)))));
              reg102 <= (((8'hac) ?
                  (reg82 ?
                      (^reg19) : (reg20 != reg82[(2'h3):(2'h2)])) : (+wire77)) < $unsigned(wire1[(2'h3):(2'h2)]));
            end
          else
            begin
              reg101 <= $signed(wire15);
              reg102 <= ($signed(wire94) <= (8'hae));
              reg103 <= $unsigned(reg7[(3'h4):(2'h3)]);
              reg104 <= ($unsigned($unsigned($unsigned(reg7))) <<< $signed(reg25));
              reg105 <= $unsigned(wire88[(2'h2):(2'h2)]);
            end
        end
      reg106 <= (wire4 <<< ($unsigned(wire30) ?
          ($unsigned((wire94 ? wire87 : reg83)) ? wire15 : reg10) : (wire93 ?
              reg18[(2'h3):(1'h1)] : $unsigned($unsigned(wire93)))));
      reg107 <= (reg7[(2'h2):(1'h1)] ? wire79 : $signed($signed(reg14)));
      reg108 <= $signed((&$unsigned(($signed(wire15) << reg98[(2'h3):(1'h1)]))));
      reg109 <= {$unsigned((~$unsigned((reg18 ^ reg104))))};
    end
  assign wire110 = reg84;
  always
    @(posedge clk) begin
      if ($signed(((reg18 ~^ wire15) | (reg27 ?
          $unsigned($unsigned(reg28)) : (~^(wire87 ? wire33 : wire15))))))
        begin
          reg111 <= $signed(((reg108 * (~&wire87[(3'h4):(3'h4)])) ?
              wire5 : reg108));
          reg112 <= wire31;
          reg113 <= ({$signed((reg9 * (~&reg82)))} <= $signed(({(reg84 ?
                      wire31 : wire79)} ?
              $unsigned(reg7) : (reg19[(2'h2):(1'h0)] ?
                  (8'haa) : reg12[(1'h0):(1'h0)]))));
          if ($unsigned((~&(~|{{reg18}}))))
            begin
              reg114 <= $unsigned((reg19 & {reg24}));
              reg115 <= $signed($signed(reg108));
              reg116 <= ({(wire94[(2'h2):(2'h2)] && (reg8[(4'h8):(4'h8)] ?
                      {reg82, (7'h40)} : reg107[(4'h9):(1'h0)]))} > ({wire1,
                  (reg8 ~^ reg29[(2'h2):(1'h1)])} * wire110[(3'h4):(2'h3)]));
              reg117 <= $signed($signed($unsigned((!$signed(reg103)))));
              reg118 <= reg84;
            end
          else
            begin
              reg114 <= ((((reg20 ? reg11 : (reg7 ? wire90 : wire91)) ?
                      wire77 : {{reg29, reg25}, (reg82 ? reg7 : (7'h43))}) ?
                  reg104 : reg80[(1'h1):(1'h1)]) <<< (~^reg99));
              reg115 <= wire33[(3'h4):(2'h2)];
              reg116 <= $unsigned($signed((-(wire0[(3'h7):(3'h5)] ?
                  reg116 : reg82[(2'h3):(2'h3)]))));
              reg117 <= wire90;
            end
        end
      else
        begin
          reg111 <= $signed(wire88);
          reg112 <= reg109;
        end
      reg119 <= wire31;
      reg120 <= reg82;
      reg121 <= ((^~reg103[(3'h4):(1'h1)]) ?
          wire88[(3'h4):(3'h4)] : $unsigned($signed((((7'h42) ?
              reg18 : (8'hac)) <= $unsigned(wire91)))));
      if (reg109[(4'ha):(2'h3)])
        begin
          reg122 <= $unsigned((($unsigned((~&wire87)) >>> $unsigned($unsigned(reg100))) >> reg119[(4'h8):(1'h0)]));
          reg123 <= wire93[(5'h10):(3'h4)];
          if (({($signed($signed(reg14)) ?
                  (reg118[(3'h6):(1'h0)] ~^ $signed(reg99)) : (~^$signed(reg108))),
              {$signed((reg121 ? reg8 : reg95)),
                  $unsigned(wire33)}} << (!reg95)))
            begin
              reg124 <= (reg32[(4'h9):(1'h1)] ?
                  $signed(((reg21 ? reg28 : (8'h9d)) ?
                      (^(wire15 == reg108)) : ((reg80 ? reg101 : reg119) ?
                          {wire5} : reg120))) : reg27);
              reg125 <= reg95;
              reg126 <= $signed(((($signed(reg86) ?
                  ((8'h9d) ?
                      reg11 : (8'h9f)) : reg124) < (~((8'hbd) == wire90))) * reg99[(2'h2):(1'h0)]));
            end
          else
            begin
              reg124 <= reg20[(1'h0):(1'h0)];
              reg125 <= (8'hbd);
              reg126 <= (-wire90[(1'h1):(1'h0)]);
            end
          reg127 <= $signed($signed(((+$unsigned(reg12)) ?
              (+(reg10 <= reg28)) : $signed((reg24 * wire0)))));
        end
      else
        begin
          reg122 <= $signed({(^(~|(reg112 | wire88))),
              {$unsigned(wire15[(4'he):(2'h3)]), wire90[(3'h4):(3'h4)]}});
          reg123 <= reg6;
          reg124 <= reg96[(1'h0):(1'h0)];
          reg125 <= reg106[(4'hb):(4'ha)];
        end
    end
endmodule

module module34
#(parameter param75 = (8'haf), 
parameter param76 = (param75 < (param75 == param75)))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
                 reg49,
                 (1'h0)};
  assign wire40 = $signed($unsigned(((-(!wire39)) >>> (~$unsigned(wire38)))));
  assign wire41 = {(wire37[(1'h1):(1'h1)] + wire35)};
  assign wire42 = (&$signed((((wire40 ?
                      wire39 : (7'h42)) || $unsigned(wire36)) && wire38[(1'h1):(1'h1)])));
  assign wire43 = wire41;
  assign wire44 = ($unsigned((!wire43[(4'hb):(4'hb)])) && $signed(wire42[(1'h0):(1'h0)]));
  assign wire45 = (^wire42);
  assign wire46 = {(^$signed(wire35[(3'h7):(2'h3)])), (7'h44)};
  assign wire47 = wire40;
  assign wire48 = $signed($signed($unsigned(((-wire37) < {wire38}))));
  always
    @(posedge clk) begin
      reg49 <= $unsigned(wire48);
      reg50 <= (!wire39);
      if ({$signed(wire46[(2'h2):(2'h2)])})
        begin
          reg51 <= $signed(wire40[(3'h4):(2'h2)]);
          reg52 <= (8'ha7);
          if ((~|($unsigned(wire36[(2'h3):(1'h1)]) | {{wire44,
                  (reg51 ? wire47 : wire47)},
              ({wire44} ? $signed((8'h9c)) : reg52[(4'hc):(4'ha)])})))
            begin
              reg53 <= wire35;
              reg54 <= $unsigned({wire44, (wire46 ^~ (|$unsigned(wire37)))});
            end
          else
            begin
              reg53 <= ((^~{($unsigned(reg53) ?
                      $signed(wire37) : wire39[(1'h0):(1'h0)])}) <= $unsigned(wire47));
              reg54 <= wire36[(4'he):(1'h1)];
              reg55 <= $unsigned(wire45[(4'hd):(3'h7)]);
              reg56 <= $unsigned(wire48[(3'h6):(3'h4)]);
            end
          reg57 <= (-$unsigned($unsigned((reg50 == (wire47 ~^ wire44)))));
          reg58 <= (8'ha3);
        end
      else
        begin
          reg51 <= reg49;
        end
      if ({($unsigned($unsigned(reg52)) || {({reg56} >= wire38),
              wire36[(3'h7):(3'h4)]})})
        begin
          if (wire40)
            begin
              reg59 <= ($signed((($signed(wire43) ^ (reg52 ?
                      wire41 : wire38)) || wire46)) ?
                  ((($signed(reg51) <<< (+reg50)) && ({(8'hb7)} - (reg58 ?
                      reg54 : reg52))) ~^ $signed(((8'hb0) < (8'hb4)))) : $signed($signed(wire45)));
              reg60 <= $signed(wire37[(2'h2):(2'h2)]);
              reg61 <= $signed((!reg59));
              reg62 <= wire39;
            end
          else
            begin
              reg59 <= {$unsigned((~|(!(wire40 - reg60))))};
              reg60 <= ((reg49 != wire42) ?
                  (($signed(((8'ha7) ? reg55 : wire37)) ?
                      $unsigned((~|(8'h9f))) : $signed((!reg50))) ^~ (&(wire36 ?
                      $signed(reg57) : $signed((7'h41))))) : (wire38 <= (7'h41)));
            end
          reg63 <= $unsigned(wire46);
          reg64 <= wire35[(1'h1):(1'h1)];
        end
      else
        begin
          reg59 <= (wire42 ^ $signed(($signed(reg55) ?
              $signed($signed(reg64)) : ($signed(wire40) ?
                  (&reg49) : (wire40 ? reg52 : reg56)))));
          reg60 <= wire39[(1'h1):(1'h1)];
          reg61 <= $signed($unsigned(((reg52[(4'ha):(4'ha)] ?
              $unsigned(reg50) : reg49) ^~ (reg51 ?
              $signed(reg56) : wire43[(2'h2):(1'h1)]))));
        end
      if (reg64)
        begin
          reg65 <= $signed(reg63);
          reg66 <= {(($signed((reg55 > reg61)) && (^$signed((8'hb1)))) ^ (!({(8'hb7),
                      reg49} ?
                  reg53 : $signed(reg52)))),
              (((8'hb3) ?
                  ((~&(7'h40)) + (wire41 <= reg62)) : (-(-reg55))) + ((-(^wire36)) ?
                  reg54 : reg55))};
          reg67 <= wire40[(2'h3):(1'h0)];
          if (($unsigned((reg55 ?
              ($signed(reg63) ?
                  (!reg49) : $signed(reg56)) : ((wire38 >>> wire35) << (~^(8'ha3))))) || ({($signed(wire44) ?
                      reg59[(2'h2):(2'h2)] : reg62[(2'h3):(2'h2)]),
                  ((^wire45) & (^reg53))} ?
              ((^~(reg55 ? reg53 : wire41)) ?
                  wire44 : $signed(((8'hac) + wire43))) : reg56[(2'h2):(2'h2)])))
            begin
              reg68 <= $unsigned((!$signed(((^~reg54) == {wire47}))));
              reg69 <= $unsigned(wire40);
            end
          else
            begin
              reg68 <= ($unsigned((8'ha9)) != $unsigned(($unsigned(((8'ha6) ?
                      reg57 : wire42)) ?
                  $signed(reg62) : (((8'haf) < wire44) ?
                      $unsigned((8'haa)) : ((8'hbf) || wire45)))));
              reg69 <= $signed(wire44[(1'h0):(1'h0)]);
              reg70 <= ($unsigned((~&((|(8'hb4)) <<< (~(8'ha4))))) ?
                  ($signed($signed($unsigned(reg63))) >>> $unsigned((reg51[(4'h8):(3'h4)] ?
                      $unsigned(wire46) : reg65[(4'he):(1'h0)]))) : $unsigned($unsigned((wire47[(2'h2):(1'h1)] + (reg59 ?
                      reg51 : reg63)))));
              reg71 <= reg64;
            end
        end
      else
        begin
          reg65 <= reg53;
          reg66 <= {$signed($signed($signed($unsigned((8'h9f))))), (7'h40)};
          reg67 <= (($unsigned($unsigned({wire39})) ^~ ({wire44,
                  (reg60 == reg67)} ?
              {wire35} : (wire37[(4'ha):(1'h0)] ?
                  wire39[(2'h2):(1'h1)] : wire48[(1'h0):(1'h0)]))) || ((|$unsigned(wire36[(2'h3):(1'h0)])) ?
              (~|{(~^wire45), $unsigned(wire35)}) : (!$unsigned((wire38 ?
                  wire39 : (8'hb8))))));
        end
    end
  assign wire72 = (wire40 != ($signed($unsigned((!reg69))) << $unsigned(reg59)));
  assign wire73 = (~^(|($signed($signed(reg62)) ~^ $signed(reg63[(2'h2):(1'h0)]))));
  assign wire74 = {reg63[(1'h0):(1'h0)],
                      (({$signed(reg59), (wire35 * reg49)} ?
                          wire42 : (8'ha8)) >> {$unsigned($unsigned(wire73)),
                          (^~wire46[(4'hb):(2'h2)])})};
endmodule
