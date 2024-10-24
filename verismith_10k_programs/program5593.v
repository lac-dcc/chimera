module top
#(parameter param150 = (~(8'hb1)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire147;
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire149,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire13,
                 wire14,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire147,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = ({wire4[(1'h0):(1'h0)]} == wire4[(2'h3):(1'h1)]);
  assign wire6 = {$unsigned((8'ha9))};
  assign wire7 = wire6;
  assign wire8 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg9 <= (wire4[(1'h0):(1'h0)] && $unsigned(($signed($unsigned(wire4)) ?
          wire8[(2'h2):(2'h2)] : $signed($signed(wire0)))));
      reg10 <= wire3[(1'h0):(1'h0)];
      reg11 <= {(+($signed($signed(wire0)) ?
              ((wire5 ?
                  reg10 : (8'haa)) > (+wire7)) : $signed($signed((8'hbf))))),
          $unsigned($signed((+wire1[(5'h10):(4'hb)])))};
      reg12 <= ({$unsigned((^$unsigned(wire4)))} >>> (((reg10[(1'h1):(1'h0)] ?
                  $unsigned(reg11) : (wire7 ? (8'ha2) : reg10)) ?
              wire5[(3'h5):(1'h0)] : $unsigned(wire5[(4'hb):(1'h0)])) ?
          wire1[(2'h2):(1'h0)] : (8'hab)));
    end
  assign wire13 = (($signed(((~|reg12) - wire5)) ?
                          $signed(wire4[(3'h4):(3'h4)]) : {$unsigned((wire7 >= wire0)),
                              ((reg11 ? wire5 : wire7) ~^ (reg11 >>> wire0))}) ?
                      $unsigned((($signed(wire3) >= wire4[(3'h4):(1'h0)]) ?
                          (((8'hb9) ?
                              wire0 : wire4) + $unsigned((8'ha2))) : wire0[(2'h2):(2'h2)])) : $unsigned($unsigned((((8'h9f) ?
                          wire5 : reg12) - wire2[(1'h0):(1'h0)]))));
  assign wire14 = (~($unsigned(($unsigned(reg10) ?
                          (^wire8) : ((8'h9d) + reg9))) ?
                      $signed((wire7 >>> (wire5 ? (8'hb0) : wire3))) : wire2));
  always
    @(posedge clk) begin
      reg15 <= $unsigned(reg12);
      reg16 <= ($unsigned(((+(~^wire4)) ~^ wire7[(4'ha):(1'h0)])) ?
          {(wire3[(1'h0):(1'h0)] ?
                  $unsigned((+wire13)) : {wire13[(1'h0):(1'h0)]}),
              wire5[(4'he):(3'h6)]} : wire14[(1'h1):(1'h0)]);
      if (reg16[(4'hf):(4'he)])
        begin
          reg17 <= $unsigned(((wire5 ?
                  ($signed(wire14) ?
                      (reg11 | wire2) : (^~reg11)) : (wire0[(2'h2):(1'h1)] | wire2[(1'h1):(1'h1)])) ?
              ((reg16[(3'h7):(2'h3)] <= reg15[(2'h3):(2'h3)]) ?
                  {$signed(reg9)} : ((wire4 >>> wire2) ~^ $unsigned(reg11))) : wire1));
          reg18 <= {$unsigned(reg16), wire13[(2'h2):(2'h2)]};
        end
      else
        begin
          reg17 <= (8'ha5);
          reg18 <= wire13;
          reg19 <= $signed(reg16);
        end
      if (((|wire5[(4'h8):(1'h1)]) <= (+reg11)))
        begin
          reg20 <= $unsigned(wire2);
        end
      else
        begin
          reg20 <= ($signed((((8'ha6) > (reg18 ~^ reg15)) ^ $signed(wire14[(4'ha):(3'h6)]))) ?
              wire13[(2'h2):(1'h1)] : (reg20[(4'hb):(4'hb)] ?
                  $signed(((reg17 ? reg20 : wire7) ?
                      (8'ha5) : $signed((8'hac)))) : ({wire13[(1'h0):(1'h0)]} ?
                      wire2 : (&{wire7, wire13}))));
        end
    end
  assign wire21 = (($signed(($unsigned(reg11) - wire4[(3'h5):(2'h3)])) << (reg19 ~^ wire8)) ?
                      (wire7[(3'h5):(2'h2)] ^~ (wire6[(4'h8):(2'h2)] ?
                          ({reg19} ?
                              wire1[(2'h2):(1'h0)] : $signed(wire13)) : {wire14[(4'ha):(4'ha)]})) : (&$unsigned(wire7[(3'h5):(3'h5)])));
  assign wire22 = wire8[(2'h2):(1'h0)];
  assign wire23 = $unsigned(reg9);
  assign wire24 = $unsigned($unsigned(wire4));
  assign wire25 = $signed((((~|$signed(reg18)) ?
                      reg20 : $unsigned($unsigned(wire2))) >= (wire22 < {wire13[(1'h0):(1'h0)]})));
  assign wire26 = ((8'hbb) ^ reg12[(3'h4):(1'h0)]);
  assign wire27 = wire24[(4'hb):(4'h8)];
  module28 #() modinst148 (wire147, clk, reg10, reg15, wire7, reg20);
  assign wire149 = (wire0[(1'h0):(1'h0)] ^ $signed({reg12[(4'hd):(4'h8)],
                       wire0}));
endmodule

module module28
#(parameter param145 = (8'hbe), 
parameter param146 = (8'hb5))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire signed [(4'ha):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire63;
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 reg138,
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
                 (1'h0)};
  module33 #() modinst64 (wire63, clk, wire31, wire32, wire30, wire29);
  assign wire65 = wire31;
  assign wire66 = $unsigned(wire30[(3'h6):(3'h5)]);
  assign wire67 = $signed((~$signed((^~(wire66 + (8'hb3))))));
  module68 #() modinst107 (wire106, clk, wire65, wire32, wire67, wire29);
  assign wire108 = wire32[(3'h6):(2'h3)];
  assign wire109 = {((wire31[(4'hc):(2'h3)] ?
                               ({wire65,
                                   wire30} <<< $unsigned(wire32)) : (^~wire63[(2'h2):(1'h0)])) ?
                           $signed($signed($unsigned(wire67))) : wire29),
                       $unsigned({wire67})};
  assign wire110 = $signed(($signed((~^wire67)) ? (~|wire67) : (8'haa)));
  always
    @(posedge clk) begin
      if ((wire110[(5'h10):(4'hc)] ?
          ($signed(wire108[(3'h4):(2'h3)]) ?
              (~&wire65[(4'hb):(3'h7)]) : $unsigned((wire106[(1'h0):(1'h0)] < wire30))) : wire108))
        begin
          reg111 <= wire32[(2'h2):(1'h1)];
          reg112 <= (~^wire66);
          if (reg111[(1'h1):(1'h0)])
            begin
              reg113 <= wire106[(4'h8):(3'h5)];
              reg114 <= wire109[(4'hf):(1'h0)];
              reg115 <= {$signed(((&$signed(wire65)) && $signed($unsigned((8'hac)))))};
              reg116 <= ($unsigned($unsigned($unsigned($unsigned(wire109)))) | (^({(&wire66),
                  wire63[(3'h5):(2'h2)]} > $unsigned(wire109[(5'h12):(5'h10)]))));
              reg117 <= $signed(wire108);
            end
          else
            begin
              reg113 <= {$signed((reg117 ?
                      (^((8'hbb) && (8'hbf))) : ({wire29} ^ reg115)))};
              reg114 <= $signed(wire29);
              reg115 <= {wire67[(1'h0):(1'h0)], (^~reg116[(5'h11):(1'h0)])};
              reg116 <= (wire106[(3'h4):(2'h2)] < ((8'ha9) ^ $unsigned((reg113[(3'h5):(2'h3)] << reg114[(3'h6):(3'h4)]))));
            end
        end
      else
        begin
          if (reg117)
            begin
              reg111 <= $signed($signed(reg116[(2'h2):(2'h2)]));
              reg112 <= ($signed((wire63[(3'h5):(2'h2)] ^ wire66[(1'h0):(1'h0)])) ?
                  reg115[(4'he):(4'h8)] : $signed(wire65));
              reg113 <= (($unsigned(({reg112} ?
                      (reg115 != wire31) : (~&wire67))) ?
                  {({reg115, wire29} ?
                          (wire63 <= wire31) : (reg115 || reg113))} : (-($signed(wire32) & (wire30 ?
                      reg112 : wire31)))) >>> (+(|reg112)));
              reg114 <= {$signed($unsigned($signed(wire108[(3'h6):(1'h0)]))),
                  $unsigned($signed({{wire66, wire29}}))};
            end
          else
            begin
              reg111 <= (reg117[(4'ha):(3'h7)] <<< wire65[(4'hc):(4'ha)]);
              reg112 <= (wire63 < reg113[(2'h3):(1'h1)]);
              reg113 <= $unsigned(((($unsigned(wire66) ?
                          ((8'ha0) | reg116) : (~wire67)) ?
                      ($signed(wire29) ?
                          {wire65, wire66} : {reg111}) : {$unsigned(reg114)}) ?
                  (^$signed($signed(wire65))) : wire65));
            end
          if ({$signed((~(^~(wire32 ? wire63 : reg114))))})
            begin
              reg115 <= wire29[(3'h5):(2'h3)];
            end
          else
            begin
              reg115 <= $signed(({wire29} || $signed(((wire108 ^ reg115) ?
                  (wire108 == wire108) : wire65[(3'h5):(2'h3)]))));
            end
          reg116 <= $unsigned(reg111[(1'h1):(1'h0)]);
        end
      if (((wire65 ~^ $unsigned(((^wire67) || (!wire31)))) ?
          {({{wire109}, (+(8'ha8))} ? $unsigned($unsigned(wire67)) : wire63),
              {$signed($unsigned(wire32)),
                  wire66[(2'h3):(1'h0)]}} : wire110[(4'hd):(3'h6)]))
        begin
          reg118 <= (^~$signed((!(wire65[(4'he):(1'h1)] << (+wire67)))));
          if ($unsigned(($unsigned(wire29) ?
              ((+(reg112 < wire110)) & reg113) : (wire31[(2'h2):(1'h1)] ^~ wire29[(4'hf):(1'h0)]))))
            begin
              reg119 <= {($signed($unsigned((reg112 ? reg118 : reg116))) ?
                      (reg115 ?
                          wire63[(3'h5):(2'h3)] : $signed(reg113)) : $signed((~{wire108,
                          wire30})))};
              reg120 <= ($unsigned(wire109) | (~^(({reg117,
                      wire67} && ((8'hac) ? reg111 : reg113)) ?
                  reg112 : ($signed((8'hbd)) ?
                      (wire65 ? wire108 : reg111) : reg117))));
              reg121 <= wire32[(3'h7):(3'h4)];
            end
          else
            begin
              reg119 <= $signed({(&$signed((+wire29)))});
              reg120 <= ((^~{wire32, reg121[(2'h3):(1'h1)]}) ?
                  (&$unsigned((^~$signed((8'hac))))) : (wire109 ?
                      $signed(wire29[(3'h4):(2'h3)]) : reg111[(4'hb):(2'h2)]));
              reg121 <= ((({wire32[(1'h1):(1'h0)]} & wire29[(4'hd):(4'h9)]) ?
                      (^(wire106[(2'h2):(1'h1)] ?
                          (reg115 ^~ wire31) : $signed(wire106))) : wire63) ?
                  $unsigned(reg114) : (~|(^((wire65 ?
                      reg112 : reg121) < (reg112 >> reg116)))));
              reg122 <= reg115;
              reg123 <= $signed($unsigned($unsigned({$unsigned((8'ha4))})));
            end
          if (reg117)
            begin
              reg124 <= reg114;
              reg125 <= (~&$unsigned(wire110[(2'h3):(1'h1)]));
              reg126 <= reg113[(4'h8):(2'h3)];
              reg127 <= ({$unsigned(((wire30 >= wire109) ?
                      ((8'hb9) && reg118) : {wire108,
                          wire32}))} <= $unsigned($signed((^~reg111[(4'hf):(1'h0)]))));
              reg128 <= reg122[(4'he):(4'he)];
            end
          else
            begin
              reg124 <= ($signed(((~^(~reg120)) ?
                      ((wire31 * reg126) ?
                          $signed(reg125) : (8'ha3)) : $signed(reg121))) ?
                  $signed(reg118[(2'h3):(2'h2)]) : (wire65[(3'h7):(1'h1)] >> $signed({wire32})));
              reg125 <= wire110[(4'h8):(2'h3)];
            end
        end
      else
        begin
          reg118 <= reg124;
          reg119 <= reg120[(2'h2):(1'h1)];
        end
      if (reg111[(5'h10):(3'h4)])
        begin
          if ((wire63[(1'h0):(1'h0)] ~^ (&reg115[(2'h2):(1'h1)])))
            begin
              reg129 <= $signed((~|reg126));
            end
          else
            begin
              reg129 <= reg111[(1'h1):(1'h1)];
            end
          reg130 <= $signed({$signed($unsigned(reg125[(3'h5):(3'h4)]))});
        end
      else
        begin
          if ((8'haf))
            begin
              reg129 <= $unsigned((^$unsigned(reg125)));
              reg130 <= ($unsigned((((8'hb6) & ((8'hbd) ?
                      wire66 : wire109)) ^ wire63)) ?
                  wire63[(1'h0):(1'h0)] : ($signed((((7'h42) ?
                              reg112 : reg122) ?
                          $signed(reg115) : $unsigned(reg113))) ?
                      ({$signed(reg112), reg120} ?
                          (wire66[(2'h2):(1'h1)] <<< ((8'hb4) ?
                              reg122 : wire65)) : {wire29[(4'h8):(3'h7)],
                              wire32}) : $signed((^reg119))));
              reg131 <= reg124;
              reg132 <= ($signed(reg122) ?
                  reg127 : (&($signed((wire110 ?
                      wire106 : (7'h44))) != (reg129 + reg116[(4'ha):(4'h9)]))));
            end
          else
            begin
              reg129 <= reg122;
              reg130 <= ((&({(~|reg112), $signed(reg123)} ?
                  $signed($unsigned(wire108)) : {((8'hb3) == reg124),
                      (8'ha7)})) > wire29);
            end
        end
      reg133 <= $signed(wire66);
      if ($unsigned(wire65[(3'h5):(2'h2)]))
        begin
          reg134 <= ($unsigned(wire63) ?
              $unsigned((reg133[(4'hb):(4'hb)] >> $unsigned(wire66[(2'h2):(1'h0)]))) : $signed($unsigned($unsigned({wire65}))));
          reg135 <= (($signed((reg123 ?
              $unsigned(reg116) : (reg131 ?
                  (8'h9d) : wire67))) != $unsigned(reg113)) > reg129);
          reg136 <= $signed(reg112[(3'h4):(3'h4)]);
          reg137 <= $unsigned((&$unsigned((~|(^(7'h44))))));
          reg138 <= $signed(($signed(({wire106} == reg118[(3'h7):(3'h4)])) ?
              ($signed((^~reg112)) ?
                  {reg132} : reg116[(1'h1):(1'h0)]) : reg131));
        end
      else
        begin
          reg134 <= $unsigned($unsigned((8'h9d)));
          reg135 <= wire106;
        end
    end
  assign wire139 = (($unsigned($unsigned((|(8'hb7)))) ?
                           ($signed($signed(reg137)) ?
                               $signed((^~wire65)) : (^~(reg126 != reg127))) : $signed(reg120)) ?
                       $signed((((reg122 ? wire66 : wire32) ?
                           (^wire63) : (reg138 >> wire65)) != wire109[(2'h3):(2'h2)])) : wire30);
  assign wire140 = ($unsigned({(~&reg130[(4'hd):(3'h7)]),
                       (~|reg118[(2'h3):(2'h2)])}) || $signed((reg123 ?
                       reg126 : reg136[(2'h2):(1'h1)])));
  assign wire141 = (!$unsigned($unsigned($unsigned($unsigned(reg134)))));
  assign wire142 = $unsigned({(wire108[(1'h1):(1'h1)] ?
                           $unsigned({wire30,
                               reg118}) : (&(reg133 - wire29)))});
  assign wire143 = (reg123 != ((~^$unsigned((~&reg112))) & reg134));
  assign wire144 = {wire63[(1'h0):(1'h0)], $signed($unsigned((8'hb9)))};
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire72;
  input wire [(4'hc):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire98,
                 wire90,
                 wire89,
                 wire88,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg73 <= wire71;
      reg74 <= ((wire69[(1'h1):(1'h0)] ?
          $unsigned((~^(reg73 >= wire71))) : wire71) * wire71[(3'h7):(2'h2)]);
      if (($signed($signed($unsigned({(8'h9f)}))) <= wire71[(4'h9):(3'h5)]))
        begin
          reg75 <= {((~|reg73[(2'h2):(2'h2)]) ^ ($signed($signed(wire70)) ^ wire69))};
          reg76 <= (wire71[(3'h7):(2'h2)] ?
              reg74[(1'h1):(1'h1)] : (wire72 != (-$unsigned($unsigned((7'h41))))));
          reg77 <= reg73;
          if ((wire72[(5'h10):(1'h1)] ?
              (reg74[(4'he):(3'h5)] ?
                  $signed($signed(reg76)) : reg75) : ($signed({$signed(wire70)}) ?
                  wire70 : reg75)))
            begin
              reg78 <= ((|$signed(({wire70, reg74} & (~^(8'h9f))))) <<< wire69);
              reg79 <= reg76;
              reg80 <= $signed(wire70[(2'h2):(2'h2)]);
              reg81 <= $signed(wire69);
              reg82 <= (reg78 ?
                  ($signed(wire71) ?
                      $unsigned((8'ha2)) : (~^$signed((reg79 ?
                          reg78 : reg77)))) : reg77);
            end
          else
            begin
              reg78 <= reg78[(1'h1):(1'h0)];
              reg79 <= ((!((reg75[(3'h7):(2'h3)] <= $signed(reg74)) ^ ($signed((7'h40)) == (|reg79)))) ?
                  (((((8'hbd) ? wire69 : wire69) ?
                      (reg82 ?
                          reg74 : reg75) : (reg73 | reg75)) >> {$signed(reg76),
                      $unsigned(wire69)}) <= reg80) : reg77);
              reg80 <= $unsigned((!{$unsigned(wire70), $unsigned(wire70)}));
              reg81 <= ($unsigned($signed(reg81)) + reg79);
              reg82 <= (({(8'ha8)} - reg75) ?
                  (^~(($signed(reg74) ?
                      {wire70} : ((8'ha7) <<< reg73)) & {{wire70,
                          wire70}})) : reg73[(3'h5):(2'h3)]);
            end
        end
      else
        begin
          if ($unsigned((~&(~&(~^$unsigned(reg74))))))
            begin
              reg75 <= ((reg79 ?
                      (((~|reg82) ?
                          $signed(reg76) : $signed(reg82)) + reg78[(1'h0):(1'h0)]) : (reg75[(5'h10):(3'h4)] ^ (~|(^wire72)))) ?
                  ($signed($signed(wire72[(3'h6):(3'h5)])) ?
                      (~&((~wire70) ?
                          wire70[(1'h0):(1'h0)] : (&wire70))) : reg73[(2'h2):(1'h1)]) : $signed((^(reg77 <<< reg78[(2'h2):(1'h0)]))));
              reg76 <= ($unsigned((^~(8'hbd))) > $unsigned(($signed((reg73 || reg80)) ?
                  (((8'had) ? reg75 : wire69) ^ reg77) : $unsigned(reg76))));
              reg77 <= (reg79[(3'h7):(3'h6)] > (((^~$unsigned(reg82)) != $unsigned(wire70)) ?
                  {reg79[(4'hf):(4'hd)]} : $signed(reg81[(3'h6):(1'h0)])));
              reg78 <= $unsigned(reg75);
            end
          else
            begin
              reg75 <= reg81[(2'h2):(2'h2)];
              reg76 <= (~reg77);
              reg77 <= ($unsigned({$signed($signed(reg74)),
                      {$signed(wire70), (+wire69)}}) ?
                  (reg76[(5'h11):(5'h10)] ^ (reg79[(2'h3):(1'h0)] | $unsigned((reg76 ?
                      reg73 : reg81)))) : ({(&(wire70 < reg76))} ?
                      $signed(($unsigned((8'ha2)) ?
                          (reg76 ^ (8'ha4)) : reg80[(1'h1):(1'h1)])) : wire70));
            end
        end
    end
  always
    @(posedge clk) begin
      reg83 <= reg77;
      if ((^reg77[(4'h8):(4'h8)]))
        begin
          reg84 <= reg75[(4'hd):(4'h9)];
          reg85 <= $unsigned((reg75[(2'h3):(1'h1)] >> ($signed((~&reg78)) >> (~(reg84 ?
              reg81 : reg83)))));
          reg86 <= reg74;
        end
      else
        begin
          if (({(^~$signed((~|(8'hb8))))} ?
              $unsigned(reg73) : (reg76 ? (7'h42) : (8'ha5))))
            begin
              reg84 <= ($unsigned(({$unsigned(wire70), $signed(reg81)} ?
                  $unsigned({reg85}) : (((8'ha5) ^ wire71) > reg84[(3'h5):(2'h2)]))) != {reg77[(2'h3):(1'h1)]});
            end
          else
            begin
              reg84 <= $unsigned(($signed((~|reg80[(2'h2):(1'h1)])) ?
                  (reg75 - reg73) : (^reg84)));
              reg85 <= reg78[(2'h2):(2'h2)];
            end
          reg86 <= reg82[(3'h7):(2'h2)];
        end
      reg87 <= (|(8'ha9));
    end
  assign wire88 = (wire70[(2'h2):(1'h0)] - $signed((!((reg86 + (8'ha2)) ?
                      (reg79 ? reg85 : (8'ha2)) : $unsigned(reg84)))));
  assign wire89 = ($signed($unsigned(reg82[(2'h3):(2'h3)])) <= (^(~{reg75,
                      $signed(reg79)})));
  assign wire90 = $unsigned($unsigned(wire69));
  always
    @(posedge clk) begin
      reg91 <= $unsigned(reg76);
      if (($unsigned((8'ha0)) >> {$unsigned($signed(wire89[(2'h3):(1'h1)])),
          $signed(wire70)}))
        begin
          reg92 <= reg91;
          reg93 <= (wire88 ? reg81[(4'h8):(2'h2)] : wire89);
          if (reg78[(2'h2):(1'h0)])
            begin
              reg94 <= (wire88[(3'h5):(1'h0)] ^ (+(^~(-$signed(reg77)))));
              reg95 <= $unsigned((&$unsigned($unsigned(reg94[(4'hc):(2'h2)]))));
              reg96 <= reg91[(2'h3):(2'h2)];
            end
          else
            begin
              reg94 <= ((-reg75) ~^ reg81);
              reg95 <= $signed(($signed(wire72[(5'h10):(3'h6)]) ?
                  wire90 : $signed($unsigned(reg85[(1'h1):(1'h0)]))));
              reg96 <= (!reg74);
              reg97 <= (reg92 < $signed($signed(wire69)));
            end
        end
      else
        begin
          reg92 <= ((^~$unsigned((+reg93[(4'hf):(4'he)]))) + (reg78 ?
              (~reg75[(4'h8):(4'h8)]) : ($signed((~&reg80)) > ((reg73 ~^ reg75) ?
                  $signed(reg87) : (reg84 ? reg84 : (8'hbe))))));
          reg93 <= (^~$unsigned($signed(wire89[(2'h2):(1'h1)])));
        end
    end
  assign wire98 = $signed(reg75[(4'h9):(3'h5)]);
  always
    @(posedge clk) begin
      reg99 <= ((~^(|reg94)) ?
          $unsigned(($unsigned((~^(8'hb7))) ?
              reg82[(3'h6):(1'h0)] : $unsigned((8'ha5)))) : wire90[(3'h6):(3'h5)]);
      reg100 <= wire90[(1'h0):(1'h0)];
      reg101 <= ((&$unsigned((reg99[(4'h8):(3'h4)] ?
              reg95 : reg75[(4'hc):(2'h3)]))) ?
          ({(|$unsigned(reg87)), reg93} ?
              reg75[(5'h12):(4'hc)] : ((!$unsigned(reg75)) << $signed(reg82[(3'h5):(2'h2)]))) : ($signed(reg74) ?
              ($unsigned((reg99 ? reg82 : (8'hbe))) ?
                  (((8'ha8) ?
                      reg81 : reg87) != (~reg73)) : wire72[(3'h7):(3'h4)]) : (8'h9f)));
      reg102 <= (wire90 >> $unsigned($signed($unsigned((reg76 ?
          (8'hb3) : (8'hb6))))));
    end
  assign wire103 = $unsigned($signed((($unsigned(reg78) >>> $signed(reg83)) ?
                       {(+wire71),
                           (wire69 ? wire90 : reg77)} : reg78[(2'h2):(1'h1)])));
  assign wire104 = reg81[(2'h2):(1'h1)];
  assign wire105 = wire72;
endmodule

module module33
#(parameter param61 = {(~&{(((8'hb6) ? (8'ha7) : (8'hbf)) ? (~|(8'ha3)) : ((8'haf) ? (8'haa) : (8'hba)))}), (({{(8'hbf), (7'h43)}, ((8'hb8) ^~ (8'ha0))} * (((8'hb4) - (8'hbe)) ? (!(8'hb1)) : {(8'hb4)})) >> ((-((8'ha3) == (8'hb9))) > (-(8'hb0))))}, 
parameter param62 = ((|(^((param61 ? param61 : param61) ? (param61 <= param61) : (param61 ? param61 : param61)))) ? ((((8'hbe) ? param61 : param61) >>> (|{param61, param61})) - (!({param61} || (~param61)))) : (-((~|param61) - (param61 & param61)))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire [(5'h14):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire40,
                 wire39,
                 wire38,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire38 = $unsigned(wire36);
  assign wire39 = $unsigned((~|(8'ha1)));
  assign wire40 = $unsigned((~^$signed(wire38[(5'h10):(3'h7)])));
  always
    @(posedge clk) begin
      reg41 <= wire36[(1'h1):(1'h0)];
      if (wire38)
        begin
          reg42 <= $signed((reg41[(2'h3):(2'h2)] >>> (~|((wire37 ?
                  wire40 : wire38) ?
              wire35[(1'h1):(1'h1)] : (^wire34)))));
          reg43 <= $unsigned(reg41[(3'h4):(1'h0)]);
          reg44 <= wire35[(4'hd):(3'h4)];
          if ({($signed((wire35[(5'h11):(4'h9)] ?
                  reg41[(1'h1):(1'h1)] : {reg44,
                      wire40})) && ((-(8'ha5)) * ((wire38 ? (7'h44) : wire35) ?
                  $signed((8'ha8)) : {wire38})))})
            begin
              reg45 <= wire39;
              reg46 <= wire38[(3'h7):(1'h0)];
            end
          else
            begin
              reg45 <= (((wire36[(1'h0):(1'h0)] ?
                      $unsigned((~|(8'hb7))) : ((wire36 >>> wire36) ?
                          reg42 : (reg46 ~^ wire35))) >= $unsigned($signed((^~wire40)))) ?
                  (wire34 ?
                      ((^(~|reg45)) ?
                          wire40[(1'h0):(1'h0)] : (|{(8'h9d),
                              reg41})) : ((8'hbc) ?
                          $signed((~|wire37)) : (((8'hb0) ?
                              wire38 : reg43) >= $unsigned(wire40)))) : $signed($unsigned($unsigned(((8'hb7) < wire36)))));
              reg46 <= $unsigned(($unsigned((((8'hb8) + reg41) ?
                      wire38[(5'h11):(3'h7)] : wire37)) ?
                  wire38 : ((~(^(8'h9e))) ?
                      $signed({reg46, wire39}) : $unsigned((!(8'hb5))))));
            end
        end
      else
        begin
          reg42 <= ($signed(($signed(wire35[(5'h12):(3'h7)]) ?
              reg46 : wire36[(1'h1):(1'h1)])) >> reg41);
        end
      reg47 <= $unsigned(reg42[(1'h1):(1'h1)]);
      reg48 <= $unsigned($signed((~$signed($signed(reg41)))));
    end
  assign wire49 = {wire39[(2'h3):(2'h3)]};
  assign wire50 = (&{(reg48[(2'h3):(1'h0)] ?
                          $unsigned(wire34[(4'h9):(3'h6)]) : $unsigned($unsigned(wire37))),
                      {$signed(reg48[(3'h6):(3'h6)])}});
  assign wire51 = wire50;
  assign wire52 = wire50[(5'h10):(1'h0)];
  assign wire53 = (^wire38[(4'hf):(2'h3)]);
  assign wire54 = ($signed(reg41) <<< {(wire37 ?
                          (wire53[(4'hb):(3'h6)] || $signed((8'hac))) : ({wire51,
                                  wire35} ?
                              {wire34} : {wire53, reg46})),
                      wire53[(4'h9):(4'h9)]});
  assign wire55 = (wire40[(1'h1):(1'h1)] ?
                      ({reg45[(1'h0):(1'h0)]} * reg43) : wire35[(4'hd):(4'hd)]);
  assign wire56 = (&{(^wire50)});
  assign wire57 = $unsigned(reg48);
  assign wire58 = ((&wire57) ?
                      $signed($signed(wire56[(2'h3):(1'h0)])) : wire53);
  assign wire59 = wire56;
  assign wire60 = wire59;
endmodule
