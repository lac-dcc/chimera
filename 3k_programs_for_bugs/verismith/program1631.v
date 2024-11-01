module top
#(parameter param167 = ({{{((8'hbd) <<< (8'hbc))}, (8'hbd)}, (((|(8'hbc)) ? ((8'hae) ? (8'h9f) : (8'hb6)) : (~|(8'haa))) | (((8'had) >>> (8'hab)) >= {(8'ha8), (8'hba)}))} - {((~&{(8'h9e)}) + (((8'ha5) >> (8'hb8)) ? (|(8'h9f)) : (&(7'h43)))), ({(|(8'h9e))} <<< (+((8'hb0) ? (8'hb5) : (8'hbf))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire164;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire166, wire164, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed((((~(wire4 && wire1)) != (8'hb6)) ?
                     wire3 : wire0[(3'h4):(3'h4)]));
  assign wire6 = $signed(wire2);
  assign wire7 = ($signed($unsigned(((wire0 & (8'ha5)) ?
                         wire6[(3'h4):(3'h4)] : $signed(wire2)))) ?
                     $signed({wire6}) : ($signed((8'hb3)) ?
                         (($signed(wire5) ?
                             wire1 : $signed(wire0)) >> wire6) : (~&(wire3 ?
                             (wire1 ? wire5 : wire3) : wire2[(3'h7):(3'h6)]))));
  assign wire8 = $signed(wire6);
  module9 #() modinst165 (.wire10(wire5), .wire11(wire8), .wire12(wire0), .y(wire164), .wire13(wire3), .clk(clk));
  assign wire166 = ($signed((&wire7)) ?
                       wire164 : ((|({wire7} ?
                               (wire2 - wire7) : (wire164 || wire5))) ?
                           (~($unsigned(wire5) ?
                               $unsigned((8'h9e)) : $signed(wire2))) : $unsigned(wire2)));
endmodule

module module9
#(parameter param162 = ((((((8'ha5) <<< (8'ha3)) ~^ ((8'hba) & (8'hb6))) ? (((8'had) && (8'ha2)) >= (8'haa)) : (+{(8'hb2), (8'h9d)})) ? (8'hac) : {(((8'h9d) ? (8'hb0) : (8'hac)) == (8'ha0)), (((8'hbc) >= (8'hba)) != ((8'ha1) ? (8'ha6) : (8'hb9)))}) ? ((~^(!(~&(8'hba)))) * (-(7'h42))) : ((!(((8'hbc) ? (8'hb8) : (8'ha8)) ^~ (~&(8'hb8)))) ? ((-((8'hb7) ? (8'ha4) : (8'hac))) ? (8'hb3) : {(!(8'h9c))}) : {(!((8'ha5) ? (8'ha5) : (8'hb0)))})), 
parameter param163 = ((param162 & (param162 ? param162 : param162)) ? (~|(((param162 ? param162 : param162) < (param162 ? param162 : (8'hb9))) ? (^~(|param162)) : ((!(8'hb7)) ? (~param162) : (param162 > param162)))) : (~(~&(param162 ? (param162 == param162) : (param162 ? (8'hb3) : param162))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire signed [(4'h8):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire156;
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire137,
                 wire98,
                 wire96,
                 wire35,
                 wire34,
                 wire32,
                 wire15,
                 wire14,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire156,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire14 = ($signed({$signed((wire10 & wire12)),
                          wire12[(2'h3):(1'h0)]}) ?
                      wire10 : ((^(~^(wire13 ? wire12 : wire12))) ?
                          wire10 : ((wire13 ~^ (wire11 ? wire10 : wire11)) ?
                              ((&wire10) ?
                                  $unsigned(wire13) : wire12[(4'hd):(3'h4)]) : $signed(((8'hb3) ?
                                  wire11 : wire11)))));
  assign wire15 = $signed(($signed({(wire13 >> wire14),
                          wire14[(5'h11):(2'h3)]}) ?
                      wire11 : {wire12[(4'hd):(4'hd)]}));
  module16 #() modinst33 (wire32, clk, wire11, wire12, wire14, wire13);
  assign wire34 = $unsigned(wire32[(4'ha):(3'h7)]);
  assign wire35 = $signed($signed(wire10[(4'he):(2'h2)]));
  module36 #() modinst97 (wire96, clk, wire13, wire15, wire34, wire11);
  assign wire98 = ($unsigned((wire35 * wire96[(3'h7):(3'h5)])) ?
                      (&(8'ha3)) : wire10);
  always
    @(posedge clk) begin
      reg99 <= wire10[(4'h8):(2'h3)];
      reg100 <= $signed(wire32);
      reg101 <= wire98[(3'h7):(2'h2)];
    end
  module102 #() modinst138 (.wire107(wire34), .y(wire137), .wire104(reg100), .clk(clk), .wire103(wire35), .wire105(wire15), .wire106(reg101));
  assign wire139 = ($signed((^~wire32[(3'h7):(3'h7)])) ?
                       ((+reg100[(2'h2):(1'h1)]) - ((~|(wire10 >= reg99)) <<< (~&(~^wire10)))) : (($unsigned($signed(wire11)) * {$unsigned(wire10),
                               reg101[(4'hb):(3'h6)]}) ?
                           (reg99 && {{wire15, (8'hb1)}}) : $signed(wire32)));
  assign wire140 = wire10;
  assign wire141 = ((($signed((^~wire137)) < $unsigned($signed(wire14))) ^~ $signed(((^wire11) ?
                           $unsigned((7'h40)) : (wire139 ^ (8'hb1))))) ?
                       (|(8'ha6)) : $unsigned((~&{wire96[(1'h0):(1'h0)],
                           $signed(reg100)})));
  assign wire142 = $unsigned($unsigned(((((8'h9c) ? wire139 : wire140) ?
                       wire137 : (^~wire98)) || (^~(wire98 > wire15)))));
  module143 #() modinst157 (wire156, clk, reg99, reg100, wire96, wire13, wire139);
  assign wire158 = (($signed(((^wire35) || (wire142 << reg101))) && {(8'ha1),
                       $signed(reg101)}) * ((-(^~$unsigned((8'ha9)))) << {wire96}));
  assign wire159 = $unsigned((8'ha0));
  assign wire160 = wire142;
  assign wire161 = ({(+(|$signed(wire156)))} != $unsigned(((^$signed(wire141)) ?
                       ((wire139 != (8'haa)) ?
                           wire142 : (reg100 ?
                               wire15 : wire15)) : $unsigned(wire32))));
endmodule

module module143
#(parameter param155 = {((+({(8'ha9), (8'hbf)} ? ((8'h9f) >> (8'ha6)) : ((8'ha3) ? (8'hb1) : (7'h41)))) < ((^~(8'hac)) ? (((8'hbe) || (8'hbd)) ? ((8'hb6) ? (8'hb7) : (8'hbc)) : ((8'h9c) ^ (8'hb0))) : ((-(8'hbc)) >= {(8'ha7), (8'hb8)}))), (8'haa)})
(y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire148;
  input wire [(2'h3):(1'h0)] wire147;
  input wire signed [(2'h3):(1'h0)] wire146;
  input wire signed [(2'h2):(1'h0)] wire145;
  input wire [(2'h3):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  assign y = {wire154, wire153, wire152, wire151, wire150, wire149, (1'h0)};
  assign wire149 = wire146[(2'h3):(2'h2)];
  assign wire150 = $signed($signed(wire147));
  assign wire151 = (({((!(7'h44)) ? (|wire145) : $unsigned((8'hae))),
                               (wire144[(1'h0):(1'h0)] ?
                                   $unsigned(wire145) : $unsigned(wire150))} ?
                           (8'ha3) : (wire145 ?
                               ((wire144 ?
                                   wire150 : wire148) & $unsigned(wire150)) : wire150)) ?
                       $signed((8'ha9)) : (((+(wire150 < wire145)) ?
                           $signed((-(8'haa))) : ($unsigned(wire147) ?
                               wire144 : wire148)) >>> (~|{{wire144},
                           wire146})));
  assign wire152 = (wire150 ? $signed(wire151) : wire150[(4'hf):(4'hc)]);
  assign wire153 = ((wire148 ?
                           (~&(((7'h42) | wire152) >> (wire144 < wire150))) : wire147[(2'h2):(2'h2)]) ?
                       $unsigned(wire152[(2'h2):(1'h0)]) : ((((wire151 ?
                                   (8'ha9) : wire148) << wire152) ?
                               ($unsigned(wire152) > $signed(wire147)) : (~|$unsigned(wire145))) ?
                           ((wire150[(3'h7):(3'h5)] ?
                                   $signed(wire150) : wire150[(4'hc):(4'hb)]) ?
                               (~^(wire150 | (8'hb6))) : wire147[(1'h1):(1'h0)]) : (~&$unsigned((-wire152)))));
  assign wire154 = wire149;
endmodule

module module102  (y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire [(3'h5):(1'h0)] wire105;
  input wire signed [(3'h7):(1'h0)] wire104;
  input wire [(3'h4):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
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
                 (1'h0)};
  assign wire108 = (|wire103[(1'h1):(1'h0)]);
  assign wire109 = $signed(wire105[(2'h3):(1'h1)]);
  assign wire110 = (($unsigned(($signed((8'haf)) ?
                       (wire106 ? (8'ha5) : wire107) : {wire104,
                           wire104})) | {(+wire105[(2'h3):(1'h1)])}) != (!(wire109 ?
                       (!(wire103 > (8'hba))) : (~^(wire109 ?
                           wire103 : wire106)))));
  assign wire111 = wire108;
  always
    @(posedge clk) begin
      reg112 <= $unsigned((wire111 * ($unsigned({wire107}) | $signed((~wire110)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned((~wire104[(1'h0):(1'h0)])))
        begin
          reg113 <= (wire107[(4'hd):(2'h3)] <<< ($unsigned(wire110[(4'h8):(1'h0)]) << (wire111 << {{wire106,
                  reg112}})));
          reg114 <= $unsigned($signed($unsigned(wire109[(1'h0):(1'h0)])));
          reg115 <= (({((wire110 >>> wire111) ?
                      wire105 : (|wire106))} == $unsigned(((reg113 ?
                      wire108 : wire110) ?
                  (wire105 < wire104) : (|reg114)))) ?
              ($unsigned((reg113[(4'h9):(3'h5)] * (wire107 != (8'hb1)))) ?
                  reg114[(4'hf):(4'h9)] : (((~^wire107) == ((8'h9e) ?
                      wire111 : wire111)) > $unsigned(wire105[(2'h2):(1'h1)]))) : $signed((wire103 ?
                  ($signed(wire104) ?
                      (!wire103) : ((8'ha5) ?
                          (8'h9f) : reg112)) : {$signed(wire109)})));
          reg116 <= (^$signed((~&{$unsigned(wire109),
              (wire103 ? wire106 : reg114)})));
        end
      else
        begin
          reg113 <= {(({(+wire108)} >> $unsigned(((7'h43) >> (8'hb0)))) ?
                  (|$signed($signed((8'hbc)))) : (&wire103)),
              ((~|$unsigned($unsigned(reg114))) | (~$signed($unsigned(reg112))))};
          reg114 <= $signed((^~(^~(+{wire104, wire107}))));
          if (wire104[(2'h2):(1'h0)])
            begin
              reg115 <= (~(wire107 ^~ $signed(($signed((8'hb8)) ?
                  {reg113, wire108} : $unsigned(wire105)))));
              reg116 <= $signed(wire110[(4'ha):(4'h9)]);
              reg117 <= ((reg114[(4'he):(1'h1)] < ($unsigned(wire108[(3'h6):(3'h6)]) & $signed($signed(reg114)))) ^ reg113);
              reg118 <= $signed(({$signed((reg115 | wire110)),
                  ((wire109 << wire106) & wire110)} <= ((+$unsigned(reg114)) ?
                  (^(^wire108)) : {wire107, wire109[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg115 <= ($unsigned(wire110[(2'h3):(1'h1)]) ?
                  wire105[(3'h5):(1'h1)] : ($unsigned(($signed(wire110) & ((8'hb6) ?
                      wire103 : wire108))) << $unsigned(reg112[(4'hb):(4'ha)])));
              reg116 <= (&(({wire110} << (-(wire109 ? reg113 : reg112))) ?
                  $signed(reg116) : $signed(($unsigned(wire106) ?
                      wire104[(2'h3):(2'h2)] : wire107))));
              reg117 <= $signed((((|{reg112}) == (reg118[(4'he):(3'h5)] ?
                  wire108 : (reg112 != wire109))) * (^(~&(reg116 == wire107)))));
            end
          reg119 <= (wire106[(2'h2):(2'h2)] ?
              (~|{wire106,
                  $unsigned($signed(wire110))}) : $unsigned(reg116[(4'he):(3'h4)]));
          if (($signed(((((8'hbe) & wire103) ?
                  $signed(wire107) : $unsigned(reg115)) ?
              ((~&wire108) - $unsigned(wire103)) : $signed(reg116[(2'h2):(2'h2)]))) ^ reg116))
            begin
              reg120 <= wire107;
              reg121 <= (^~$unsigned({reg119, (|(wire111 | wire106))}));
              reg122 <= ($signed($unsigned($unsigned(wire104[(1'h0):(1'h0)]))) ?
                  ({(+(reg120 ? reg112 : reg117)),
                          {(^~(8'hac)), {reg118, wire109}}} ?
                      ((&(~^reg121)) ?
                          wire108 : (~&wire106[(1'h0):(1'h0)])) : $unsigned(reg115)) : {(|($signed((8'hba)) ^~ $signed(reg112))),
                      {((+(8'haa)) ? (-reg113) : (reg112 - reg113)),
                          (reg113 ? ((8'hbe) <= reg121) : $signed(wire108))}});
            end
          else
            begin
              reg120 <= (((reg122[(2'h3):(1'h0)] ?
                  $unsigned(((7'h42) ?
                      reg120 : wire103)) : $signed(wire103)) != (~$unsigned($unsigned(wire106)))) - $signed(wire105[(1'h0):(1'h0)]));
              reg121 <= reg120[(4'h8):(3'h7)];
            end
        end
      reg123 <= {reg113[(3'h6):(1'h1)]};
      if (reg115[(1'h1):(1'h0)])
        begin
          reg124 <= ($unsigned((reg117[(4'h9):(3'h5)] ?
                  wire103[(2'h3):(2'h3)] : {{wire106},
                      reg120[(4'ha):(3'h6)]})) ?
              ($signed($unsigned((reg112 >>> reg113))) + ((wire103[(3'h4):(3'h4)] ?
                  (^(8'hb7)) : wire110) << reg116[(1'h0):(1'h0)])) : (($signed((8'hba)) >> reg119[(3'h7):(3'h5)]) ^ $unsigned((-$signed(reg114)))));
          if ((^~((8'hb8) && (+{reg112[(3'h5):(3'h4)]}))))
            begin
              reg125 <= reg120;
              reg126 <= wire105;
              reg127 <= $signed($unsigned($unsigned(((reg121 ?
                      wire106 : wire107) ?
                  {reg121} : $signed((8'hbb))))));
            end
          else
            begin
              reg125 <= {$signed({{reg112}, $signed((!reg115))})};
              reg126 <= ($signed(reg118) ?
                  (reg119 ?
                      ((((8'haf) == wire107) ?
                          (~|(8'hae)) : (reg124 + wire105)) == $signed((reg120 ?
                          reg122 : (8'h9d)))) : (~|{reg112})) : $signed(reg123));
              reg127 <= reg112;
              reg128 <= {(wire103[(2'h3):(2'h2)] ? reg118 : wire103),
                  $unsigned($signed($signed((reg123 && wire107))))};
              reg129 <= {($signed((7'h42)) ?
                      reg119 : $unsigned((!reg126[(1'h0):(1'h0)])))};
            end
        end
      else
        begin
          reg124 <= (reg119 + $signed($unsigned(($signed(reg113) ?
              $signed(reg122) : wire109[(3'h6):(3'h4)]))));
          reg125 <= (-$signed({$signed(reg128), $unsigned($signed(wire107))}));
          reg126 <= reg126[(3'h7):(1'h0)];
        end
      if ((((-(|$signed(wire106))) ?
              ({reg116[(4'h9):(3'h5)]} ?
                  (wire107[(1'h0):(1'h0)] + (wire110 ?
                      wire107 : reg114)) : ($signed(wire105) != (reg124 < (8'hb8)))) : wire107[(4'hc):(1'h0)]) ?
          reg125[(1'h1):(1'h1)] : (reg124[(3'h4):(2'h2)] ?
              (~reg117[(2'h2):(1'h1)]) : ((reg112[(2'h2):(2'h2)] + reg121) ?
                  ((reg127 ? reg125 : wire110) ?
                      ((8'hb7) <<< reg127) : {reg126, reg129}) : reg118))))
        begin
          reg130 <= $unsigned((8'h9c));
          reg131 <= wire110;
          reg132 <= reg123[(4'ha):(4'ha)];
          reg133 <= (+(reg118 ?
              ((|reg123[(2'h2):(1'h0)]) | $signed($unsigned(reg112))) : (reg119 ?
                  ($unsigned((7'h42)) + reg113) : reg115[(3'h5):(3'h5)])));
          reg134 <= ((wire105 ?
              {$signed((-wire110)),
                  wire105} : (7'h40)) && (($unsigned((~&reg112)) ^ $unsigned((wire109 > reg128))) <<< $unsigned(reg117[(4'h8):(3'h5)])));
        end
      else
        begin
          reg130 <= $unsigned($unsigned((($unsigned(reg124) || wire103[(2'h3):(1'h1)]) ?
              (reg121[(3'h4):(2'h2)] <= reg133[(1'h1):(1'h1)]) : ($signed(reg116) > (wire109 == wire104)))));
        end
    end
  assign wire135 = $unsigned((^$unsigned($unsigned(((8'hb2) ?
                       reg128 : reg119)))));
  assign wire136 = (((-$signed($unsigned(reg113))) ?
                           (&(!reg130)) : (-($signed(reg116) ?
                               ((8'ha4) ^~ (8'ha9)) : (-wire135)))) ?
                       (~&$unsigned((|wire104[(3'h5):(2'h3)]))) : (reg114[(5'h11):(3'h6)] ^~ reg120));
endmodule

module module36
#(parameter param95 = {({(^((8'hb3) ? (7'h41) : (8'ha0)))} & (-(~|((8'hb5) ~^ (8'hb3))))), (({(&(7'h44))} ^ (&(8'hb6))) ? ((-{(8'ha3), (8'hb5)}) ^ {(~(8'hb7))}) : (((!(7'h41)) == (^(8'hb7))) ? ((~|(8'h9c)) ? ((8'ha4) ? (8'hbe) : (7'h41)) : ((8'hae) ? (8'h9c) : (8'ha7))) : (|(~(7'h41)))))})
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire40;
  input wire signed [(3'h4):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire42,
                 wire41,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 reg65,
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
                 (1'h0)};
  assign wire41 = wire39[(1'h0):(1'h0)];
  assign wire42 = wire40;
  always
    @(posedge clk) begin
      if (wire42[(3'h5):(3'h5)])
        begin
          reg43 <= (~&wire37[(1'h0):(1'h0)]);
          reg44 <= $unsigned($unsigned(((~&(!wire40)) > {{reg43, wire42}})));
          reg45 <= $signed({(^(wire38[(1'h0):(1'h0)] ?
                  (~&wire39) : $signed(reg44))),
              reg44[(3'h6):(3'h4)]});
          reg46 <= {((~&((^wire38) ?
                  $signed(wire37) : {wire41})) ^~ $unsigned((^~((8'hbb) & reg43))))};
          if ($unsigned({($unsigned($signed(wire39)) * reg43)}))
            begin
              reg47 <= (reg43[(3'h5):(1'h0)] >>> (~^{(~|(~wire41))}));
              reg48 <= reg46;
              reg49 <= wire40;
              reg50 <= ({reg47, $signed($unsigned(reg45))} ?
                  {$signed((reg44 ?
                          reg48 : $signed(wire40)))} : (($unsigned(reg48[(2'h3):(2'h2)]) ?
                      wire38 : reg43[(3'h5):(3'h5)]) >= (((+wire38) >> (^wire39)) ?
                      $signed($signed(reg49)) : $unsigned({wire42, wire38}))));
            end
          else
            begin
              reg47 <= (-wire38[(3'h7):(1'h1)]);
              reg48 <= (($signed((^~{reg48})) ~^ ((wire42 >= $signed(reg46)) ?
                  (~^$signed(reg43)) : (~|$unsigned(wire40)))) & (!{((~&wire37) ?
                      wire38[(3'h5):(2'h3)] : $signed((8'ha7)))}));
              reg49 <= ($signed({(wire39[(2'h3):(2'h3)] & (~&(8'ha5))),
                      ((wire39 ? reg50 : (8'hba)) + $signed(reg45))}) ?
                  reg48[(2'h2):(2'h2)] : (~&reg44));
            end
        end
      else
        begin
          if ((-$unsigned(($unsigned(wire40[(2'h3):(1'h0)]) ?
              ((^~wire39) ~^ $signed(reg50)) : reg50))))
            begin
              reg43 <= reg49;
              reg44 <= wire41;
              reg45 <= (7'h41);
            end
          else
            begin
              reg43 <= (~^$signed($signed($unsigned((wire38 ?
                  wire42 : reg44)))));
            end
          reg46 <= $signed(reg45);
        end
      reg51 <= (((-(^{reg48})) ?
              reg46[(2'h3):(1'h1)] : ({(wire39 >= wire39)} == ($unsigned(reg47) ^ reg43))) ?
          {(~|wire41[(4'h8):(3'h5)]),
              $signed((reg50 ?
                  reg50 : wire40))} : $signed(reg49[(3'h5):(3'h4)]));
      reg52 <= ($unsigned($signed(($unsigned(wire37) ?
              (|(8'ha8)) : (+wire40)))) ?
          {wire38,
              ($signed(((8'ha4) - reg48)) && wire41[(1'h1):(1'h0)])} : $signed((wire42[(4'h8):(1'h0)] ?
              ({wire38, wire40} || $signed(wire42)) : wire39)));
    end
  always
    @(posedge clk) begin
      reg53 <= $unsigned((($signed((reg44 ? reg44 : wire42)) ?
          reg50 : (-wire42)) - ($signed(wire41) ?
          $signed($unsigned(reg52)) : (^~reg44[(1'h0):(1'h0)]))));
      reg54 <= $signed($signed($unsigned(reg47[(5'h13):(4'h8)])));
      reg55 <= (-({wire41[(4'hc):(4'ha)], $unsigned($unsigned(wire42))} ?
          reg47 : $unsigned(($signed(wire41) >= reg49[(1'h0):(1'h0)]))));
      reg56 <= $unsigned((^(~(!reg46[(1'h1):(1'h0)]))));
      if (((reg43 ? wire42[(1'h0):(1'h0)] : $unsigned({reg43[(3'h6):(1'h1)]})) ?
          {$unsigned($unsigned(((8'ha6) <<< (8'hb9)))),
              reg53[(2'h3):(2'h2)]} : $signed($unsigned($unsigned($signed(reg45))))))
        begin
          reg57 <= (~^reg45);
          reg58 <= (&$signed($unsigned(({reg54} ? (reg54 - reg56) : {reg52}))));
        end
      else
        begin
          reg57 <= $unsigned($unsigned(wire39));
          reg58 <= reg50;
        end
    end
  assign wire59 = $unsigned((wire39[(3'h4):(2'h2)] ?
                      $unsigned({(reg46 <<< reg55)}) : $unsigned($signed((~reg58)))));
  assign wire60 = $signed($unsigned((reg55[(3'h4):(1'h1)] ?
                      $unsigned(reg57[(2'h2):(1'h1)]) : $unsigned((~&(8'h9d))))));
  assign wire61 = (((8'hb2) ?
                      wire41 : $signed($unsigned($signed(wire59)))) ~^ reg54);
  assign wire62 = (reg44 ?
                      $signed($signed(reg54)) : $unsigned(($unsigned(((8'ha8) ?
                          (8'hba) : reg48)) < ({reg43, reg48} ?
                          (-wire37) : reg48))));
  assign wire63 = (8'ha7);
  assign wire64 = (8'hbd);
  always
    @(posedge clk) begin
      reg65 <= wire38[(2'h2):(1'h1)];
    end
  assign wire66 = wire39;
  always
    @(posedge clk) begin
      reg67 <= $signed((^$signed(reg65)));
    end
  always
    @(posedge clk) begin
      reg68 <= reg47[(5'h13):(4'hf)];
      reg69 <= $unsigned((reg67[(3'h4):(1'h1)] != wire39[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg70 <= $unsigned(reg67);
      if (wire41)
        begin
          if ((wire60[(3'h6):(2'h3)] ?
              ($unsigned((-{reg65,
                  wire42})) ^~ reg46[(3'h4):(1'h0)]) : reg54[(2'h2):(1'h1)]))
            begin
              reg71 <= {(^reg54[(3'h5):(1'h0)])};
              reg72 <= $signed(((8'hbd) ?
                  ((reg50[(4'h9):(4'h9)] != (reg68 & reg56)) & wire42) : $unsigned($signed((wire39 < wire38)))));
              reg73 <= (wire66[(3'h5):(2'h3)] ?
                  (^$unsigned(((~^reg53) == (8'hb5)))) : {reg56});
            end
          else
            begin
              reg71 <= (~reg45[(3'h6):(3'h5)]);
              reg72 <= $signed((^~((~(reg67 ?
                  reg69 : reg46)) <<< (reg65 <<< $unsigned(wire37)))));
              reg73 <= (8'hb2);
              reg74 <= (+reg65);
            end
          if (($signed((($unsigned((8'haa)) && wire63[(3'h5):(3'h4)]) ?
              reg70[(4'he):(1'h0)] : $unsigned((+reg45)))) - $unsigned((reg47 || reg58[(3'h4):(1'h1)]))))
            begin
              reg75 <= ($signed(wire41[(3'h4):(2'h3)]) ?
                  ((((&wire62) != $unsigned(wire39)) & (8'hb5)) ?
                      (reg48 ?
                          $signed((-wire59)) : $unsigned((reg53 ?
                              reg69 : wire62))) : wire61[(2'h2):(1'h1)]) : ((-({(8'hb2),
                          wire42} ?
                      (reg55 > reg43) : (!(8'hbf)))) & ($signed((8'hab)) ?
                      $unsigned(reg44) : reg52[(1'h0):(1'h0)])));
              reg76 <= reg51[(1'h0):(1'h0)];
              reg77 <= reg57[(1'h0):(1'h0)];
            end
          else
            begin
              reg75 <= {{(((reg51 ? wire37 : (8'hbb)) ? reg67 : reg50) ?
                          (reg58[(4'h8):(1'h1)] ?
                              $signed(reg57) : (~|wire66)) : $unsigned($signed(reg65)))},
                  (wire60[(1'h0):(1'h0)] * reg53)};
              reg76 <= $unsigned(($signed(($signed(reg70) * $unsigned(reg77))) | $unsigned((wire37[(2'h3):(1'h1)] ~^ (reg55 ?
                  reg48 : reg43)))));
              reg77 <= (reg68 ? (!reg55) : wire38);
            end
          reg78 <= (reg77[(1'h0):(1'h0)] >= reg45[(4'hc):(4'hb)]);
        end
      else
        begin
          reg71 <= reg57[(3'h4):(1'h1)];
          if ((wire63 | (reg50[(1'h0):(1'h0)] << ($signed({reg77}) >> (reg67[(4'hf):(1'h1)] - ((8'hae) - reg46))))))
            begin
              reg72 <= $unsigned(reg53);
              reg73 <= wire41;
              reg74 <= reg52;
              reg75 <= reg50;
              reg76 <= reg73;
            end
          else
            begin
              reg72 <= ((|$unsigned($signed($signed(reg55)))) ?
                  (+$unsigned(reg58)) : wire62);
              reg73 <= reg54;
              reg74 <= $signed($signed($unsigned(reg54[(1'h1):(1'h0)])));
              reg75 <= wire61[(2'h2):(1'h0)];
              reg76 <= (($unsigned({(wire38 ?
                      wire62 : wire37)}) > (^~((wire62 > reg46) | reg49))) != reg44);
            end
          reg77 <= $signed((^{$unsigned($unsigned(wire64))}));
          reg78 <= (~reg45[(2'h3):(2'h3)]);
        end
    end
  assign wire79 = ($signed($signed(wire62[(4'hc):(2'h3)])) ?
                      reg71[(3'h6):(1'h1)] : $unsigned(($unsigned($signed(wire62)) ?
                          reg56[(3'h7):(3'h4)] : {{wire39, (8'hb3)},
                              $signed((8'hb9))})));
  assign wire80 = $signed((wire59[(2'h3):(2'h2)] ?
                      {(!(reg67 == reg58)), reg73} : (~&reg56[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      reg81 <= ((8'hb5) ?
          reg50 : ((&({wire42} | $unsigned(reg52))) ?
              (^(+(^wire63))) : (reg65 << $unsigned((wire66 ?
                  reg76 : (8'hb6))))));
      if ($unsigned({(((reg65 == reg76) ? $signed(reg67) : (8'hb2)) ?
              $unsigned($unsigned(reg44)) : wire64),
          $signed(wire60[(4'hd):(3'h7)])}))
        begin
          reg82 <= {(~|(reg65[(4'h8):(3'h5)] >= $signed(reg69)))};
          if ({((-($unsigned(reg52) ?
                  (reg82 ?
                      reg43 : wire40) : {reg69})) && (&($signed(wire64) ^~ reg75)))})
            begin
              reg83 <= $unsigned({reg71});
              reg84 <= (8'ha1);
            end
          else
            begin
              reg83 <= reg47[(3'h7):(2'h3)];
            end
          if (reg82[(4'he):(4'h8)])
            begin
              reg85 <= $signed((-(wire40[(3'h6):(1'h0)] ?
                  ((wire61 - reg46) >> (-wire79)) : (reg50[(5'h15):(5'h10)] <<< (reg81 ?
                      (8'hb2) : reg43)))));
              reg86 <= ($unsigned((^{(wire80 > wire60)})) >> $signed(({$unsigned(reg52)} ?
                  {$unsigned(wire42), $unsigned(reg85)} : $unsigned(wire64))));
              reg87 <= (8'hbb);
            end
          else
            begin
              reg85 <= (~^wire41[(4'h8):(4'h8)]);
              reg86 <= reg56;
            end
        end
      else
        begin
          reg82 <= $signed(($signed($signed((wire79 ?
              (8'h9e) : reg71))) * (^(~&$signed(reg54)))));
          reg83 <= $signed((-(-$signed(reg78))));
          reg84 <= (~^(+$unsigned(($signed(reg57) ?
              (wire60 || (8'hb3)) : $signed(reg85)))));
          reg85 <= wire60;
        end
      if (reg77[(1'h1):(1'h1)])
        begin
          reg88 <= wire42[(1'h0):(1'h0)];
        end
      else
        begin
          reg88 <= (($signed((reg56 + $unsigned(reg85))) ?
              reg45 : (reg50[(4'hf):(3'h7)] ?
                  $signed((reg74 ? reg75 : wire41)) : {$signed(wire39),
                      (^~(7'h44))})) - reg73[(3'h7):(3'h7)]);
          if (wire62)
            begin
              reg89 <= reg67[(1'h1):(1'h0)];
            end
          else
            begin
              reg89 <= (reg77[(1'h0):(1'h0)] > ($signed(((reg77 * reg87) ?
                      reg88 : (-reg82))) ?
                  reg75 : wire40[(4'h9):(4'h9)]));
              reg90 <= $unsigned({((wire66 == $unsigned(reg85)) ?
                      ($unsigned((8'ha7)) ?
                          reg85 : $signed(reg68)) : $unsigned(((8'hb6) ?
                          wire63 : reg67)))});
              reg91 <= $signed(({(((8'ha3) ? (8'hab) : reg88) ?
                      $unsigned(wire41) : (~|reg70)),
                  $unsigned({reg57})} ~^ reg58[(5'h13):(4'h9)]));
              reg92 <= $signed((|(+$signed(reg71))));
            end
          reg93 <= $unsigned((~^$signed((reg49 + $signed(reg50)))));
          reg94 <= (reg69[(1'h0):(1'h0)] ?
              ($signed((8'hbe)) ?
                  ($unsigned({reg90, reg71}) ?
                      ((reg58 > reg76) - wire64) : reg46) : (wire38[(4'ha):(1'h1)] ?
                      $unsigned((|wire66)) : $unsigned({reg93}))) : $signed(({(^~reg90)} & reg72[(3'h4):(3'h4)])));
        end
    end
endmodule

module module16
#(parameter param30 = (!(+((8'ha6) ? (+(~^(8'ha1))) : (|(^(8'hb6)))))), 
parameter param31 = (^~(~|param30)))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (8'h9f);
  assign wire22 = ((-((^$unsigned(wire17)) >>> wire18[(2'h2):(1'h1)])) ?
                      $unsigned(wire19) : wire17);
  assign wire23 = (($unsigned((7'h40)) ?
                      ((^(wire21 ?
                          wire20 : wire19)) >= wire20[(3'h7):(3'h6)]) : $unsigned(wire17[(2'h2):(1'h0)])) > {{wire20,
                          ((8'ha0) == (wire22 ^ wire19))},
                      $unsigned(((|wire22) ^~ $signed(wire21)))});
  assign wire24 = ({wire22,
                      ($signed($unsigned(wire20)) == (wire20[(3'h6):(3'h6)] >> wire23))} >> (-wire21));
  assign wire25 = (^~$unsigned((^~$unsigned(wire23))));
  assign wire26 = wire17[(3'h5):(3'h5)];
  assign wire27 = wire18;
  assign wire28 = $signed($unsigned({$signed((wire18 ? wire19 : wire20)),
                      wire19}));
  assign wire29 = $signed(wire27[(3'h4):(1'h1)]);
endmodule
