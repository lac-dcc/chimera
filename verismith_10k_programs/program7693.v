module top
#(parameter param167 = (!(8'h9e)), 
parameter param168 = param167)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire162;
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire4,
                 wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire162,
                 reg15,
                 reg6,
                 (1'h0)};
  assign wire4 = (&(^~wire3[(4'h9):(2'h3)]));
  assign wire5 = (wire0[(4'h9):(3'h7)] ?
                     (($unsigned({wire1}) ? wire3[(3'h4):(2'h2)] : wire3) ?
                         $unsigned({$unsigned(wire3)}) : wire4) : wire4[(4'hd):(4'ha)]);
  always
    @(posedge clk) begin
      reg6 <= (~|$signed((~((wire1 ~^ wire0) ? wire0 : (wire3 ^ wire1)))));
    end
  assign wire7 = (8'h9e);
  assign wire8 = $unsigned(((wire7 ^~ wire7) ?
                     wire3[(4'h8):(3'h5)] : (($unsigned(wire7) ?
                             (reg6 ~^ (8'hb2)) : (wire3 >= (8'ha7))) ?
                         ({wire2} ?
                             $signed((8'hbc)) : $signed((8'ha3))) : wire1)));
  assign wire9 = wire8;
  assign wire10 = (~$signed((~^($signed(wire7) ? (8'ha0) : $unsigned(wire2)))));
  assign wire11 = (-wire8);
  assign wire12 = wire8[(2'h3):(1'h0)];
  assign wire13 = ((~|$signed((wire11 ?
                      wire10 : (wire10 <<< wire2)))) ~^ ((~&wire10[(5'h13):(4'hb)]) ?
                      wire4 : (wire12 ?
                          $unsigned({wire7, wire5}) : $unsigned(wire0))));
  assign wire14 = (wire4[(4'hb):(3'h4)] ?
                      ((|{{wire5, wire13}}) ~^ {($signed(wire3) ?
                              (+wire2) : wire7[(4'hd):(4'h9)]),
                          ((~&wire2) ?
                              $signed(wire2) : $signed(wire9))}) : (wire1[(2'h2):(1'h1)] >>> (wire0 ?
                          (wire5[(1'h0):(1'h0)] ?
                              $signed(wire9) : wire8[(3'h4):(2'h2)]) : {(-wire7),
                              (8'hac)})));
  always
    @(posedge clk) begin
      reg15 <= wire0[(4'ha):(3'h5)];
    end
  assign wire16 = wire1[(1'h0):(1'h0)];
  assign wire17 = (~^(((&(reg6 < reg15)) <<< {$unsigned(wire4)}) ?
                      wire1[(1'h0):(1'h0)] : (^~wire0)));
  assign wire18 = wire16;
  assign wire19 = wire1[(2'h2):(1'h1)];
  module20 #() modinst163 (wire162, clk, wire14, wire11, wire1, wire7, wire9);
  assign wire164 = (($signed((wire17[(3'h7):(1'h1)] && reg6[(4'h9):(4'h8)])) * ($signed($signed(wire14)) >>> $unsigned(wire19))) & wire0);
  assign wire165 = $signed(({$signed($unsigned(reg6))} ?
                       (((wire17 == (8'hbb)) >= $unsigned(wire4)) && (((8'hb5) || wire3) ?
                           (8'hb0) : (wire1 < wire9))) : (!wire3[(3'h5):(1'h1)])));
  assign wire166 = wire4;
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire95;
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire155,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire64,
                 wire27,
                 wire26,
                 wire66,
                 wire67,
                 wire95,
                 reg158,
                 (1'h0)};
  assign wire26 = wire25[(3'h7):(3'h5)];
  assign wire27 = (8'hb0);
  module28 #() modinst65 (.clk(clk), .wire33(wire26), .wire31(wire21), .wire30(wire24), .wire29(wire27), .wire32(wire22), .y(wire64));
  assign wire66 = {((~$unsigned($signed(wire23))) || $unsigned((~(wire24 ?
                          wire22 : wire25)))),
                      ({wire27[(4'ha):(2'h2)],
                          $unsigned($unsigned(wire64))} >>> ($unsigned($signed(wire21)) ?
                          (wire64 ?
                              wire27[(4'ha):(3'h5)] : (wire24 >>> wire27)) : wire27[(3'h6):(1'h0)]))};
  assign wire67 = (+wire26[(1'h0):(1'h0)]);
  module68 #() modinst96 (wire95, clk, wire27, wire23, wire22, wire26, wire67);
  assign wire97 = {wire66[(2'h2):(1'h0)],
                      ($signed((&wire21[(5'h12):(4'h8)])) ?
                          wire27[(3'h7):(3'h7)] : $signed($signed((^wire23))))};
  assign wire98 = (((!wire67[(3'h6):(3'h4)]) ~^ $signed(wire22)) ?
                      $unsigned(wire67[(4'hd):(1'h1)]) : wire27[(5'h10):(2'h2)]);
  assign wire99 = wire21;
  assign wire100 = (((!$unsigned(wire22)) ?
                           $signed(((-(8'hb9)) ?
                               (wire26 ?
                                   wire26 : wire24) : (8'ha3))) : (8'hb1)) ?
                       ($signed((+(wire99 ? wire24 : wire98))) ?
                           ($unsigned((wire66 ? wire24 : wire98)) ?
                               (~{wire27}) : ($signed(wire24) <<< wire26)) : (wire21 ?
                               wire21[(5'h10):(2'h2)] : {$unsigned(wire98),
                                   $signed(wire98)})) : $unsigned((wire23 < $unsigned(wire98[(5'h10):(2'h3)]))));
  assign wire101 = $unsigned($unsigned($signed((wire21[(1'h0):(1'h0)] + wire23))));
  assign wire102 = wire22;
  assign wire103 = (-$unsigned((+(^(wire95 & wire66)))));
  assign wire104 = $unsigned(((wire100 >>> wire23) ?
                       $signed(wire64) : {$unsigned($signed(wire101)),
                           wire102[(3'h5):(2'h3)]}));
  assign wire105 = wire66[(2'h2):(2'h2)];
  assign wire106 = (wire97 ?
                       ($unsigned(wire26[(4'hc):(4'h9)]) ?
                           $unsigned(({wire23} << (^wire95))) : wire104[(3'h5):(2'h2)]) : (wire22[(4'h9):(4'h8)] ?
                           wire102 : (wire97[(2'h3):(2'h3)] ?
                               (((8'h9c) ? wire64 : wire26) & {wire22,
                                   wire27}) : ((wire100 >> wire99) ?
                                   wire22 : wire27))));
  assign wire107 = wire67[(3'h4):(1'h1)];
  module108 #() modinst156 (wire155, clk, wire107, wire22, wire67, wire98);
  assign wire157 = ({(8'haf), (^($signed(wire99) << wire101))} ?
                       {wire26[(3'h5):(3'h4)],
                           $signed(wire64[(1'h1):(1'h1)])} : wire66);
  always
    @(posedge clk) begin
      reg158 <= wire104;
    end
  assign wire159 = {$unsigned(({(8'ha9), $unsigned((8'ha9))} ?
                           $signed(wire23) : {wire104}))};
  assign wire160 = (~wire66[(1'h0):(1'h0)]);
  assign wire161 = ($unsigned($unsigned((wire100[(1'h0):(1'h0)] ?
                       wire97[(2'h2):(2'h2)] : ((8'hb3) ?
                           (8'h9e) : wire157)))) > (~^wire25));
endmodule

module module108
#(parameter param154 = ((^~(((~&(8'hbc)) ? ((8'hbd) * (8'hbe)) : ((8'h9d) ? (8'hbe) : (7'h42))) ? (((7'h44) < (8'ha8)) - {(8'h9c)}) : {(+(8'ha2)), {(8'ha2)}})) ? (!(+(~|(&(7'h41))))) : ((^{{(8'ha9)}}) ? ((!(^(8'hb4))) > (((8'haf) ? (8'h9e) : (8'ha3)) ? {(8'hba)} : ((8'h9e) >>> (8'hac)))) : ((~|(~&(8'hb8))) | (+((8'hb5) ? (8'hbf) : (8'hb5)))))))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire112;
  input wire signed [(5'h11):(1'h0)] wire111;
  input wire [(5'h15):(1'h0)] wire110;
  input wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire113;
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire149,
                 wire114,
                 wire113,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
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
                 (1'h0)};
  assign wire113 = (wire110 ?
                       $unsigned(wire112[(1'h0):(1'h0)]) : $unsigned((wire111[(4'hd):(2'h2)] ?
                           $signed(wire112[(2'h3):(2'h3)]) : $signed({wire112}))));
  assign wire114 = wire110[(5'h11):(4'hc)];
  always
    @(posedge clk) begin
      if (wire114[(4'he):(4'hc)])
        begin
          reg115 <= (~&$signed(((wire114[(2'h3):(1'h0)] >>> wire114) ?
              wire109[(3'h5):(3'h5)] : (wire109[(3'h5):(2'h2)] ?
                  $unsigned(wire112) : (wire112 ? wire113 : wire112)))));
          reg116 <= (-($unsigned(wire109[(3'h6):(3'h5)]) == (wire111[(1'h0):(1'h0)] < $unsigned(wire111[(4'hc):(1'h0)]))));
          reg117 <= (((~|$signed(wire114)) & (~|((^~wire112) == {wire112,
                  reg115}))) ?
              $signed((+wire111)) : $unsigned(($unsigned(wire110) ?
                  (wire114[(4'h8):(4'h8)] ?
                      $unsigned(wire109) : $signed(reg116)) : (7'h44))));
          reg118 <= (wire109[(3'h6):(1'h0)] ?
              (wire111[(2'h3):(1'h0)] != $signed(reg117)) : $signed((~wire110)));
        end
      else
        begin
          if ($unsigned(wire111))
            begin
              reg115 <= $signed($unsigned($signed({wire113})));
              reg116 <= reg115[(1'h0):(1'h0)];
            end
          else
            begin
              reg115 <= {wire111[(1'h1):(1'h0)]};
            end
          reg117 <= (!(($signed($signed(reg116)) || reg115) ?
              (!(8'hab)) : {reg117[(1'h0):(1'h0)], (8'ha4)}));
          reg118 <= {({$signed({wire110})} >> $signed((((8'hac) == (8'hbd)) ?
                  (wire111 & (8'ha6)) : $signed(wire113))))};
          reg119 <= ($signed(reg115) ?
              (reg115[(2'h2):(1'h1)] ?
                  ($signed((wire114 * wire114)) & reg117[(2'h2):(1'h1)]) : (wire113 <<< reg118[(3'h5):(1'h1)])) : $unsigned($signed(({wire109,
                      reg118} ?
                  (wire114 ? reg118 : wire112) : (wire114 ?
                      reg117 : wire109)))));
          reg120 <= (($signed(($unsigned(wire113) <= (~^reg117))) >>> $unsigned(reg119)) ?
              $signed(($signed($unsigned(wire114)) ?
                  wire110[(4'h8):(3'h7)] : (wire111 ?
                      wire110[(5'h12):(2'h3)] : {reg117,
                          reg118}))) : reg116[(2'h3):(1'h0)]);
        end
      reg121 <= reg117;
    end
  always
    @(posedge clk) begin
      reg122 <= ((wire114 ^ {$signed($signed(reg121)),
              $unsigned(wire110[(2'h3):(1'h0)])}) ?
          (!(8'hbf)) : reg121);
      reg123 <= reg116;
      if (wire113)
        begin
          reg124 <= $unsigned((^reg116[(1'h0):(1'h0)]));
          reg125 <= wire113;
          reg126 <= $signed(wire111);
          reg127 <= $signed($signed(reg126));
        end
      else
        begin
          reg124 <= (~|$unsigned((+{$unsigned(reg121), {wire113}})));
          reg125 <= ($unsigned((wire112[(3'h5):(2'h3)] ?
              $unsigned((&reg117)) : $signed($unsigned(reg126)))) && ($signed(((reg121 << reg119) <<< (reg126 ^~ reg121))) ?
              wire111[(3'h5):(1'h0)] : wire112));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire113))
        begin
          reg128 <= $unsigned({($signed((wire111 ?
                  reg125 : reg124)) <<< ($signed(reg119) ?
                  (reg116 + (8'hac)) : (reg121 <= reg125))),
              reg118[(2'h2):(1'h0)]});
          reg129 <= ((^reg125) ?
              ($signed(reg123[(2'h3):(2'h3)]) ?
                  ((wire114 < (reg115 ^ wire112)) ?
                      (wire109[(3'h6):(2'h2)] ?
                          {reg118,
                              reg123} : (+reg122)) : $unsigned(reg124[(1'h0):(1'h0)])) : {reg117[(1'h0):(1'h0)]}) : {{$unsigned((wire110 ~^ reg125)),
                      reg124}});
          reg130 <= ($unsigned({wire114}) ?
              reg115[(1'h1):(1'h1)] : (reg120 > $unsigned(reg120[(2'h3):(2'h3)])));
        end
      else
        begin
          reg128 <= (+(~&{reg119[(3'h5):(3'h4)]}));
          reg129 <= (~|(8'hbe));
        end
      if ((reg115 - reg119))
        begin
          reg131 <= reg123[(3'h5):(2'h3)];
          if ((&reg127))
            begin
              reg132 <= (reg127 << ($unsigned((&(reg130 << reg121))) ?
                  $signed(wire109[(3'h6):(1'h1)]) : reg124));
              reg133 <= $unsigned(reg127[(3'h4):(3'h4)]);
              reg134 <= (&{{$signed(reg126),
                      ($unsigned((8'hb6)) < (reg115 >>> (8'ha5)))}});
              reg135 <= reg128[(2'h3):(1'h1)];
            end
          else
            begin
              reg132 <= $signed(({reg116,
                  reg135} > $signed((reg134 ^ $unsigned((7'h40))))));
              reg133 <= reg128;
            end
          reg136 <= {$unsigned(wire113),
              ({$signed((+wire112))} ?
                  $unsigned((reg135 >> (reg124 <<< reg125))) : reg132[(1'h1):(1'h0)])};
          reg137 <= {((^~reg117[(1'h0):(1'h0)]) ~^ $signed(((reg136 & wire113) ?
                  $unsigned(reg130) : reg129))),
              ((~&{(reg115 ? wire109 : wire113),
                  reg131}) | $unsigned($signed((reg116 ? reg134 : (8'hb6)))))};
          if (($signed(($signed((&reg134)) ? {{reg133, reg137}} : reg119)) ?
              ((~$unsigned(reg124)) <= reg119[(1'h1):(1'h1)]) : $unsigned($unsigned((~&$unsigned(reg120))))))
            begin
              reg138 <= $signed(reg130[(4'hd):(4'h8)]);
              reg139 <= $signed((&$unsigned(($unsigned(reg130) ?
                  (~&reg128) : (wire110 <<< wire111)))));
              reg140 <= $unsigned((~|reg139));
              reg141 <= (reg136[(4'h9):(4'h9)] <<< ({$unsigned(reg124[(4'h8):(2'h2)])} <<< (!reg138)));
              reg142 <= $unsigned(reg132[(3'h4):(1'h0)]);
            end
          else
            begin
              reg138 <= ((^$signed(reg141[(2'h2):(1'h0)])) << reg124[(4'ha):(3'h6)]);
              reg139 <= (^~reg125[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg131 <= $unsigned((((|(reg138 ^ (8'hb7))) ?
              (+{wire111}) : {((8'hbf) < reg135),
                  reg128}) < $signed(reg126[(3'h4):(2'h2)])));
          reg132 <= wire112[(3'h5):(2'h3)];
          reg133 <= reg121;
        end
      reg143 <= ((^((!$signed(reg142)) ?
          (+$unsigned(reg141)) : ({reg142} < reg123))) - reg126);
      if ($signed($signed((reg117[(1'h0):(1'h0)] ?
          ((reg142 ? reg133 : reg142) ?
              $unsigned(reg132) : (~|reg138)) : $unsigned(reg143[(1'h1):(1'h0)])))))
        begin
          reg144 <= $signed(($unsigned(reg137[(4'he):(4'ha)]) ?
              (((~&reg137) != $unsigned(reg137)) ? wire111 : reg125) : reg132));
          reg145 <= ((reg117[(1'h1):(1'h1)] > $unsigned((reg120[(3'h4):(1'h1)] >> $unsigned(reg144)))) ?
              ($unsigned($unsigned({reg115})) & reg141[(1'h1):(1'h1)]) : {((~|(reg139 ?
                      reg126 : reg115)) - (&reg144[(2'h3):(2'h3)])),
                  reg135[(3'h5):(2'h2)]});
          reg146 <= reg135[(1'h0):(1'h0)];
          reg147 <= (8'hb9);
          reg148 <= (-(~(~|(8'had))));
        end
      else
        begin
          reg144 <= ((reg147[(3'h4):(3'h4)] && (7'h43)) ?
              ((&((wire113 ? wire110 : (7'h41)) << ((8'ha7) ?
                  reg130 : reg138))) << $signed((reg141 ^~ (reg119 << reg137)))) : ({(&{reg135})} <<< $signed($signed((~reg146)))));
        end
    end
  assign wire149 = (8'h9f);
  always
    @(posedge clk) begin
      reg150 <= wire111;
      reg151 <= ((~($signed({reg150}) ?
              reg131[(1'h1):(1'h1)] : reg115[(2'h2):(1'h0)])) ?
          reg119 : ($signed($signed($signed(reg120))) ?
              {reg141,
                  $unsigned(reg150[(1'h0):(1'h0)])} : ($unsigned(reg138[(1'h0):(1'h0)]) ?
                  reg136[(2'h2):(1'h0)] : (reg134[(5'h10):(3'h7)] | (+reg133)))));
      reg152 <= reg140[(1'h1):(1'h0)];
      reg153 <= $signed((~$signed(($signed(reg147) ?
          $unsigned(reg131) : (wire112 ^ wire112)))));
    end
endmodule

module module68
#(parameter param93 = ((((!{(8'hbf)}) ^~ (((8'ha1) ~^ (8'hb2)) ~^ ((8'hab) << (8'hb7)))) ? {((+(8'ha2)) ? ((8'ha2) ? (7'h41) : (8'hb0)) : (8'hac))} : ((~^{(8'hb9), (8'ha3)}) >> (((8'ha3) ? (8'hb9) : (8'hb0)) ? ((8'hab) ? (8'had) : (8'hb8)) : (8'haf)))) > ((^~({(8'hac)} * (+(8'hb6)))) && {(((7'h41) != (7'h41)) ? ((8'hb2) ? (7'h42) : (7'h40)) : {(8'hbf), (8'h9d)})})), 
parameter param94 = (^{param93}))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire73;
  input wire [(5'h15):(1'h0)] wire72;
  input wire [(5'h15):(1'h0)] wire71;
  input wire [(4'hd):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire74 = {$unsigned($signed(wire72[(5'h14):(5'h14)])),
                      $signed(((8'hab) | wire72[(4'ha):(4'h9)]))};
  assign wire75 = (((|$unsigned(wire70)) >= ($signed({wire73,
                      wire71}) - wire69[(1'h1):(1'h1)])) >> $unsigned(wire70));
  assign wire76 = ($signed({(|wire69)}) >>> (8'hab));
  assign wire77 = $signed((!wire69[(3'h4):(2'h3)]));
  assign wire78 = (wire69[(1'h1):(1'h0)] ?
                      $unsigned(wire74[(3'h6):(3'h6)]) : (wire72 << wire74[(4'hc):(3'h4)]));
  assign wire79 = (wire77 != (+$unsigned(((wire77 ? (8'ha0) : wire76) ?
                      $signed(wire75) : $unsigned(wire69)))));
  assign wire80 = $unsigned(((wire79 != wire69[(3'h7):(1'h0)]) >= wire75[(1'h1):(1'h0)]));
  assign wire81 = {(~((^~(~^wire79)) ?
                          ((8'hbc) ?
                              $unsigned(wire73) : $unsigned(wire80)) : ($unsigned(wire78) ?
                              $signed(wire72) : (+wire80))))};
  assign wire82 = $unsigned((~&(8'hac)));
  assign wire83 = $signed($unsigned($signed((wire73 == $unsigned((8'hb6))))));
  always
    @(posedge clk) begin
      if (wire73[(3'h7):(3'h6)])
        begin
          reg84 <= $unsigned(wire75[(2'h2):(1'h1)]);
        end
      else
        begin
          reg84 <= ($unsigned($signed(((wire73 ? wire74 : wire76) ?
                  (~|wire81) : wire80))) ?
              wire72 : wire73);
          reg85 <= $unsigned(((7'h41) ~^ (wire71 ?
              (~&(^~wire69)) : {$unsigned(wire83)})));
          reg86 <= wire79[(1'h0):(1'h0)];
          reg87 <= $unsigned((^((-(~^wire73)) ?
              {(wire77 <= wire83)} : $unsigned({wire71}))));
        end
      reg88 <= (!(^~((8'hbf) <<< wire73)));
    end
  assign wire89 = ($unsigned(wire80[(2'h3):(1'h1)]) ~^ {{reg87}});
  assign wire90 = (^~(|$unsigned(($unsigned(wire82) || (~&wire69)))));
  assign wire91 = ($signed(wire72) ?
                      $signed($unsigned($unsigned((~wire79)))) : ((($signed(wire72) << wire90[(4'hb):(3'h6)]) - (~{wire83,
                              wire73})) ?
                          ($unsigned(reg88) ^ wire76[(4'h8):(3'h4)]) : (-(wire81 < wire70))));
  assign wire92 = {{(+($unsigned((8'hb8)) > $signed(wire82))),
                          wire82[(4'ha):(4'h9)]},
                      wire78};
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
  assign wire34 = wire29;
  assign wire35 = ({(8'hb8),
                          ($unsigned({wire32, wire32}) ?
                              $unsigned((-wire33)) : $unsigned((wire30 != wire31)))} ?
                      $unsigned($signed((-$unsigned((7'h41))))) : wire33[(2'h2):(1'h1)]);
  assign wire36 = ((wire35 > (wire34[(1'h1):(1'h0)] ?
                          ($unsigned(wire35) ?
                              wire32 : $signed(wire35)) : ((wire33 * wire35) ?
                              wire35[(2'h2):(1'h1)] : $signed((7'h44))))) ?
                      wire35 : (({$signed(wire34)} ?
                              wire32[(4'ha):(3'h6)] : wire29) ?
                          wire33[(2'h3):(1'h0)] : (^wire33[(2'h3):(1'h0)])));
  assign wire37 = (-((~&wire34) ?
                      $signed((wire33 ?
                          $unsigned(wire35) : {wire30})) : ($signed((!(8'hb2))) ?
                          wire32[(3'h6):(2'h3)] : ((wire34 < wire30) || (wire33 ?
                              wire30 : wire33)))));
  always
    @(posedge clk) begin
      if (($signed((|(wire33 ? $unsigned(wire36) : wire37))) ?
          (8'hb8) : wire37))
        begin
          reg38 <= $unsigned({$signed(wire37[(4'ha):(3'h6)]), wire33});
          reg39 <= $signed(wire33[(2'h2):(1'h0)]);
          if ((~&$signed(((wire34 ? (+(8'ha3)) : (wire33 ? wire36 : reg38)) ?
              $signed(wire30[(2'h3):(1'h0)]) : (~^(wire31 < (8'hbe)))))))
            begin
              reg40 <= {((8'hb1) ?
                      wire30 : (wire37[(3'h4):(1'h1)] | wire32[(4'h8):(3'h4)])),
                  (($unsigned((wire36 - (7'h40))) || ((wire31 <= wire34) ?
                          $unsigned((8'hb5)) : (wire30 ^ reg38))) ?
                      ($signed(reg39[(3'h5):(3'h4)]) ?
                          (+(wire33 | wire35)) : wire30[(1'h0):(1'h0)]) : $unsigned($signed($signed(wire31))))};
              reg41 <= $unsigned(wire29[(4'ha):(4'h8)]);
              reg42 <= ($signed($unsigned($unsigned((wire33 ?
                  (8'haa) : wire33)))) && wire34[(1'h0):(1'h0)]);
              reg43 <= $signed(wire37[(2'h3):(2'h3)]);
            end
          else
            begin
              reg40 <= reg39;
              reg41 <= $signed(wire36[(3'h6):(3'h5)]);
              reg42 <= wire36[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg38 <= ($signed(({$unsigned(reg39), (wire32 ^ (8'hb6))} ?
                  $signed($signed(reg43)) : wire37)) ?
              $signed(wire32[(1'h1):(1'h1)]) : reg43);
          reg39 <= {($signed((((8'ha6) * reg38) <= ((8'ha3) ?
                  wire32 : wire29))) <= wire29[(3'h4):(1'h0)])};
          reg40 <= wire29;
          if ((~&(~^{reg40[(1'h0):(1'h0)], $signed($unsigned(wire37))})))
            begin
              reg41 <= wire35;
              reg42 <= (8'ha6);
              reg43 <= (wire31[(1'h1):(1'h1)] ?
                  (~|$signed(((wire34 ?
                      wire34 : wire31) * (wire32 | reg38)))) : $signed((|$signed((~&reg43)))));
              reg44 <= $signed($unsigned((&reg43[(4'h9):(2'h3)])));
              reg45 <= wire29[(3'h7):(2'h3)];
            end
          else
            begin
              reg41 <= $signed($unsigned({reg45,
                  {(wire33 + (8'ha2)), (reg39 ? reg38 : wire33)}}));
              reg42 <= {(7'h41), $signed(reg39)};
              reg43 <= $signed(wire37);
            end
          reg46 <= wire30;
        end
      reg47 <= reg38;
      reg48 <= $unsigned($unsigned((+{wire29[(2'h2):(1'h1)],
          wire30[(3'h4):(1'h1)]})));
      if ($signed($unsigned($signed((((8'ha3) ? (8'h9c) : wire35) ?
          reg48[(3'h4):(1'h1)] : $unsigned(wire32))))))
        begin
          if (reg47[(4'hc):(2'h2)])
            begin
              reg49 <= ((!(&reg45[(1'h0):(1'h0)])) ~^ {{(wire33[(2'h2):(2'h2)] ?
                          $signed(reg43) : (reg42 <= (8'ha2))),
                      (|reg38[(4'h8):(2'h3)])}});
              reg50 <= (^~(+$signed(reg42)));
              reg51 <= ((^(^{reg44})) ?
                  (($unsigned({reg42}) == reg49) & ((!reg48[(3'h4):(1'h1)]) | reg41)) : wire33);
              reg52 <= (~|reg41[(1'h0):(1'h0)]);
            end
          else
            begin
              reg49 <= $unsigned($signed($signed(((^~(8'hbe)) <<< $unsigned(reg51)))));
            end
          reg53 <= reg52;
          reg54 <= ($unsigned((!$signed((~|reg53)))) << wire35);
          if ($unsigned(((^~reg43) * wire29[(2'h3):(2'h2)])))
            begin
              reg55 <= (~reg54);
              reg56 <= $unsigned(reg46);
              reg57 <= (^reg41[(1'h1):(1'h1)]);
            end
          else
            begin
              reg55 <= (({(reg55[(2'h2):(1'h0)] >= ((8'h9d) <<< reg44)),
                  (^$unsigned(wire34))} & (wire32[(4'h9):(2'h2)] <= $unsigned(reg40))) < $signed($unsigned(wire37[(3'h4):(2'h2)])));
              reg56 <= (((reg52[(4'h9):(2'h2)] < ((reg38 & reg52) ?
                      (~wire29) : (8'hbb))) ?
                  (((reg47 ? reg57 : reg44) ?
                          $signed(reg42) : reg54[(1'h0):(1'h0)]) ?
                      (+$unsigned(reg46)) : $signed((wire33 < reg49))) : $unsigned(wire32)) - reg57[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg49 <= $signed({((~(^~wire32)) ?
                  $unsigned(wire30[(1'h1):(1'h1)]) : (reg53 ?
                      (reg55 <= reg40) : (~|reg56)))});
          reg50 <= (((~&(8'hbc)) ^ $signed((-$signed(reg50)))) ?
              (^((~&reg51[(3'h5):(2'h3)]) ?
                  reg56[(1'h1):(1'h0)] : $signed((wire29 ?
                      reg38 : reg46)))) : reg42);
        end
    end
  assign wire58 = reg51[(3'h4):(1'h1)];
  assign wire59 = reg49;
  assign wire60 = reg51[(1'h1):(1'h0)];
  assign wire61 = {((reg42[(1'h0):(1'h0)] * (^~reg57[(3'h4):(3'h4)])) <<< reg51)};
  assign wire62 = (8'hb7);
  assign wire63 = wire59;
endmodule
