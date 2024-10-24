module top
#(parameter param200 = (&(~&((((8'hb6) ? (8'ha4) : (8'hbb)) + ((8'h9e) ? (8'hac) : (8'hbb))) ? {(+(8'hb5)), ((8'hb0) ? (8'ha1) : (8'ha1))} : (!(-(8'h9c)))))), 
parameter param201 = {{(~(param200 ? (param200 << (8'hab)) : ((8'ha2) >= param200)))}, (~&(8'ha0))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire199;
  wire signed [(5'h15):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire190;
  wire [(5'h13):(1'h0)] wire189;
  wire [(3'h6):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire187;
  wire [(5'h12):(1'h0)] wire186;
  wire [(3'h7):(1'h0)] wire179;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire168;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg [(2'h2):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'he):(1'h0)] reg185 = (1'h0);
  assign y = {wire199,
                 wire193,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire179,
                 wire178,
                 wire171,
                 wire170,
                 wire168,
                 wire106,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 (1'h0)};
  assign wire5 = $unsigned({(($unsigned((7'h40)) ?
                         ((8'hac) & (8'hbc)) : wire1) & wire1[(4'h8):(3'h6)]),
                     (8'ha3)});
  assign wire6 = (~($signed((+wire5)) <<< ({wire2[(5'h12):(5'h11)]} ^~ (^~$signed(wire1)))));
  assign wire7 = $signed((!$unsigned(($signed(wire4) ?
                     $signed(wire1) : (~|wire5)))));
  assign wire8 = wire7;
  assign wire9 = (~^$signed((~(((7'h44) ?
                     (8'ha0) : wire7) * (wire5 ^ (8'ha4))))));
  module10 #() modinst107 (wire106, clk, wire2, wire3, wire7, wire6);
  module108 #() modinst169 (.wire112(wire9), .y(wire168), .wire109(wire1), .wire111(wire8), .clk(clk), .wire110(wire7));
  assign wire170 = ((|(wire2 ? ($signed(wire1) | wire8) : {(^wire3)})) ?
                       {wire168,
                           (^~$signed((^wire3)))} : {$unsigned((wire4 <<< (^(8'hb4))))});
  assign wire171 = $signed(($signed(wire5[(4'hd):(4'h8)]) >= {$unsigned((~(8'hb8)))}));
  always
    @(posedge clk) begin
      if (wire170[(1'h0):(1'h0)])
        begin
          reg172 <= wire3;
          reg173 <= $unsigned(({$signed(wire3[(4'h8):(1'h0)]),
              $signed((wire8 ? wire7 : (8'hb2)))} <= wire8[(2'h3):(2'h3)]));
          reg174 <= wire1;
          reg175 <= $unsigned({$unsigned($signed((~wire7)))});
          reg176 <= (-$unsigned((~^$unsigned((wire4 | wire8)))));
        end
      else
        begin
          reg172 <= {$unsigned(wire8)};
          reg173 <= wire8[(2'h2):(1'h0)];
        end
      reg177 <= wire5;
    end
  assign wire178 = wire0[(4'hb):(4'ha)];
  module10 #() modinst180 (.wire11(reg174), .wire12(reg176), .y(wire179), .wire13(reg175), .clk(clk), .wire14(reg173));
  always
    @(posedge clk) begin
      reg181 <= $unsigned((wire2[(4'ha):(2'h3)] >= wire4));
      reg182 <= $signed(((wire1[(3'h7):(2'h2)] ?
              (wire1[(4'hb):(3'h5)] * wire7[(4'h8):(4'h8)]) : $unsigned({wire106,
                  wire2})) ?
          reg174[(2'h3):(1'h1)] : reg181));
      reg183 <= $unsigned(wire4);
      reg184 <= wire171[(4'h8):(3'h6)];
      reg185 <= ($unsigned(wire6) <<< {($unsigned((wire1 >>> (7'h44))) ?
              ((reg184 ? wire2 : reg175) ?
                  wire170[(2'h3):(2'h3)] : (reg176 ?
                      (8'ha4) : wire1)) : ((wire8 && wire1) ?
                  (8'hb1) : $unsigned(wire4)))});
    end
  assign wire186 = $signed((~|(~|reg182[(3'h4):(2'h2)])));
  assign wire187 = reg185;
  assign wire188 = $signed((+((wire9[(2'h2):(2'h2)] * (wire171 ?
                           (8'ha5) : reg184)) ?
                       (reg176[(3'h6):(2'h3)] ?
                           reg177 : $signed(wire179)) : $signed($signed(wire7)))));
  assign wire189 = (^~$signed({$signed($signed(wire170))}));
  assign wire190 = (|$signed(wire171));
  module128 #() modinst192 (.wire129(reg182), .wire131(reg175), .wire132(reg183), .clk(clk), .y(wire191), .wire133(wire170), .wire130(wire189));
  assign wire193 = ($unsigned((^($signed(wire2) & wire179))) ?
                       $unsigned($unsigned((wire5[(3'h6):(2'h2)] ?
                           (8'hbd) : wire187[(2'h3):(1'h1)]))) : $signed(((~(+wire9)) != (~^reg185[(4'hb):(4'hb)]))));
  always
    @(posedge clk) begin
      reg194 <= wire4[(3'h4):(1'h0)];
      reg195 <= $unsigned($unsigned(wire191));
      reg196 <= $unsigned(wire1[(3'h6):(1'h0)]);
      reg197 <= reg195[(4'hf):(4'hd)];
      reg198 <= (8'haa);
    end
  assign wire199 = wire2;
endmodule

module module108
#(parameter param166 = (({((~^(8'hbf)) == ((8'hbd) == (8'hb5))), (8'hb5)} || ({(~|(8'ha3))} ? (~^(8'h9c)) : (((8'hb4) >= (7'h42)) < (^(8'ha8))))) ? (|(((|(8'h9c)) != {(8'hbc), (8'hba)}) >= (((8'had) == (8'ha4)) + ((8'h9e) ? (8'hbf) : (8'hb2))))) : ((+({(7'h40)} >= {(8'h9c)})) * (8'h9d))), 
parameter param167 = ((param166 ? param166 : (((param166 ? param166 : param166) >= ((8'haa) >>> param166)) != (~|(param166 ? param166 : param166)))) ? ((((7'h44) >> ((8'ha3) < param166)) ? (^{param166, param166}) : (((8'ha4) ? param166 : (8'ha4)) ? (param166 >> param166) : (param166 ? param166 : param166))) || (((+param166) - (param166 ? (8'haa) : param166)) && ((&param166) ? (param166 ? param166 : param166) : (param166 ^ param166)))) : (((!(^~(8'hb9))) ? ((param166 << param166) * (~|param166)) : (param166 ~^ param166)) + ((param166 > (-param166)) || (&(param166 ? param166 : (8'hae)))))))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire112;
  input wire signed [(5'h14):(1'h0)] wire111;
  input wire signed [(4'hd):(1'h0)] wire110;
  input wire [(5'h13):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire126;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire160;
  reg signed [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  assign y = {wire165,
                 wire126,
                 wire113,
                 wire160,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire113 = (wire111[(1'h1):(1'h0)] << $unsigned(wire112[(4'h8):(2'h2)]));
  module114 #() modinst127 (wire126, clk, wire109, wire112, wire113, wire111, wire110);
  module128 #() modinst161 (wire160, clk, wire111, wire112, wire113, wire109, wire126);
  always
    @(posedge clk) begin
      reg162 <= $unsigned((~|wire126[(3'h6):(1'h1)]));
      reg163 <= {wire110};
      reg164 <= {reg162[(3'h5):(1'h1)]};
    end
  assign wire165 = ($signed(({(~|reg164)} || (wire160[(3'h4):(3'h4)] ?
                       {wire112,
                           wire110} : $unsigned(wire111)))) * $unsigned($unsigned($signed(wire112))));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire15;
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  assign y = {wire105,
                 wire103,
                 wire15,
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
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire15 = (8'ha8);
  always
    @(posedge clk) begin
      reg16 <= wire12[(4'hd):(4'hc)];
      reg17 <= (($signed({(wire11 ? wire14 : reg16), {reg16, (7'h40)}}) ?
              (8'hac) : (^{$signed(wire14), wire12[(5'h10):(4'hc)]})) ?
          {$signed(((wire15 | wire15) ?
                  (~^wire14) : (reg16 ? wire12 : wire11)))} : (~|wire11));
      reg18 <= (wire12[(2'h3):(1'h0)] <<< reg16);
      if ($unsigned((|$signed(({wire14, reg18} ^~ wire12[(4'h8):(3'h4)])))))
        begin
          reg19 <= (~|wire13[(4'ha):(3'h4)]);
          if (reg19)
            begin
              reg20 <= wire12;
              reg21 <= (~$unsigned((&$unsigned((|wire11)))));
              reg22 <= reg18;
            end
          else
            begin
              reg20 <= $signed({wire15, wire15[(3'h6):(3'h4)]});
              reg21 <= (|wire11);
            end
          if ((reg21[(4'hb):(4'h8)] ? reg19 : (+(!$signed((wire12 - reg19))))))
            begin
              reg23 <= {(^reg16[(4'hb):(3'h6)]),
                  (^~$unsigned((|reg16[(4'h8):(3'h7)])))};
              reg24 <= reg17;
              reg25 <= reg18[(1'h0):(1'h0)];
              reg26 <= (7'h41);
            end
          else
            begin
              reg23 <= $unsigned((8'hbe));
              reg24 <= (~|reg18[(3'h5):(2'h3)]);
              reg25 <= $signed(reg22);
              reg26 <= ({reg19,
                  ({(~reg24)} ?
                      wire13[(5'h11):(3'h6)] : reg22[(3'h7):(3'h7)])} > reg20[(4'ha):(3'h6)]);
            end
          reg27 <= $unsigned($unsigned((((reg19 ^~ (8'hb0)) ?
                  (^~wire13) : {reg19}) ?
              $signed((reg25 < reg24)) : {$signed(wire11)})));
          reg28 <= $unsigned(((|(~reg22)) == {wire13}));
        end
      else
        begin
          reg19 <= (reg25 > $signed((~&({wire13} ?
              {(8'hb8), reg17} : wire12[(2'h3):(2'h2)]))));
          reg20 <= ({{$signed((wire14 ? reg18 : wire13)), reg24[(2'h2):(1'h0)]},
              (reg18[(1'h0):(1'h0)] + wire11[(2'h3):(1'h0)])} >= $signed(reg18));
          reg21 <= ($signed((|{reg25[(2'h2):(2'h2)]})) ?
              (&(($unsigned(reg16) <= $unsigned(reg27)) ?
                  reg23 : wire15[(1'h0):(1'h0)])) : ($unsigned($signed((8'h9f))) != reg20));
          reg22 <= $unsigned((-reg16[(1'h0):(1'h0)]));
          reg23 <= {$signed(($signed({reg24,
                  reg24}) ^~ $unsigned(wire15[(4'ha):(4'h8)]))),
              wire12[(4'hd):(1'h0)]};
        end
      reg29 <= wire11;
    end
  module30 #() modinst104 (wire103, clk, wire12, reg28, reg23, reg16, wire14);
  assign wire105 = (({wire103[(4'h9):(2'h3)]} ?
                       ((((8'hbc) ? reg19 : reg28) ?
                               {reg19} : (wire14 != reg20)) ?
                           (!{reg19}) : (reg20 ?
                               $unsigned(wire12) : (~|reg26))) : $unsigned(reg28[(3'h7):(1'h0)])) < ($signed((^$signed((8'ha6)))) || $signed((wire13[(4'he):(2'h2)] - ((8'hb2) >= (7'h44))))));
endmodule

module module30
#(parameter param102 = ((+(&{((8'ha2) == (8'haf))})) ^~ {{({(8'hbc), (8'hb5)} << (~(8'hb8))), ((!(8'hb5)) ? {(8'hbd)} : ((7'h44) + (8'hbf)))}}))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h312):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire36;
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg86,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = wire34;
  always
    @(posedge clk) begin
      reg37 <= wire32[(4'h8):(3'h5)];
      reg38 <= ((((|wire32) ?
          ($signed(wire32) ?
              ((8'hbf) ?
                  reg37 : wire35) : (wire31 >= wire36)) : (wire34[(4'hf):(2'h2)] << wire36)) <<< {$signed($unsigned(wire36)),
          wire36}) >> (wire33[(4'h8):(1'h1)] ?
          $unsigned($unsigned({wire36})) : wire36[(1'h0):(1'h0)]));
    end
  assign wire39 = $unsigned((reg37[(5'h11):(5'h11)] ?
                      ($signed(reg38) ?
                          $signed($signed(wire32)) : (^(reg37 ?
                              wire36 : reg37))) : wire31));
  assign wire40 = ($unsigned(wire31) ?
                      {{wire35[(3'h4):(3'h4)]},
                          {wire32[(2'h3):(2'h3)],
                              wire35[(4'h8):(2'h3)]}} : ($unsigned((reg38[(1'h0):(1'h0)] <= (-wire35))) ?
                          (wire34 && ($unsigned((8'hb5)) <= (wire36 ?
                              wire33 : (8'hbf)))) : {{wire33[(2'h3):(2'h3)],
                                  (wire31 >>> wire31)}}));
  assign wire41 = wire31[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg42 <= (+(&{(wire31 ?
                  wire36[(1'h0):(1'h0)] : ((8'ha9) ? wire31 : wire33))}));
          if ($unsigned(wire35[(3'h7):(3'h7)]))
            begin
              reg43 <= (+$signed({wire35[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg43 <= (&reg42);
              reg44 <= $signed((wire33[(1'h1):(1'h1)] ?
                  (-(8'hac)) : $signed(wire31[(3'h4):(2'h3)])));
              reg45 <= ($signed((($signed((8'hb8)) - wire40[(2'h2):(2'h2)]) + ($unsigned(reg42) ?
                  wire32[(2'h3):(1'h1)] : (~|(8'ha8))))) & wire33);
              reg46 <= (8'hba);
              reg47 <= (~|{reg38[(5'h10):(4'h9)],
                  $signed((wire34[(4'h8):(3'h6)] ?
                      wire32[(1'h0):(1'h0)] : (wire35 > reg43)))});
            end
          if ((((reg42 ?
              $unsigned((^~reg38)) : (|$unsigned(wire35))) ~^ (reg46[(2'h2):(1'h1)] < reg42[(4'ha):(3'h4)])) > $signed(($signed((8'haf)) ?
              wire31[(4'hc):(3'h7)] : $unsigned(reg43)))))
            begin
              reg48 <= ($unsigned($unsigned(wire32[(1'h0):(1'h0)])) ~^ $signed($unsigned((reg45[(2'h3):(1'h1)] ?
                  (reg45 + wire35) : (8'hb3)))));
            end
          else
            begin
              reg48 <= (^~$signed(reg37[(4'hb):(3'h4)]));
            end
          reg49 <= $signed($unsigned($signed($unsigned((wire40 ?
              reg42 : wire34)))));
          if ($signed(wire34))
            begin
              reg50 <= reg49[(2'h3):(2'h3)];
              reg51 <= {$unsigned(reg45[(4'h9):(3'h6)]),
                  $unsigned(wire33[(3'h5):(1'h1)])};
              reg52 <= ((((+wire33) <= $unsigned(wire36[(4'h8):(1'h0)])) * (reg47 ?
                      wire39 : (reg44[(2'h2):(1'h0)] ?
                          (wire35 ? wire32 : wire39) : $signed(wire33)))) ?
                  wire36[(2'h2):(2'h2)] : (|(((wire34 || reg51) ^~ (reg49 ?
                          wire39 : (8'hb9))) ?
                      $unsigned(((8'hb5) - reg49)) : ((&wire40) ?
                          wire31[(3'h5):(3'h4)] : reg50))));
              reg53 <= wire41[(2'h2):(1'h1)];
              reg54 <= (^(&wire34));
            end
          else
            begin
              reg50 <= reg48;
              reg51 <= ($unsigned(wire41) << wire34[(5'h11):(4'hb)]);
              reg52 <= reg37[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg42 <= (((($signed(reg37) || {(8'ha7)}) ?
              ((reg50 ? (8'hbf) : wire36) ? (~^wire36) : reg44) : {reg52,
                  (wire34 * reg54)}) | ((^(^~wire39)) && $signed((reg38 * wire39)))) * $unsigned(wire41[(5'h14):(2'h2)]));
        end
      if ((~|(reg37 != $unsigned(wire33))))
        begin
          reg55 <= $signed($unsigned({(~&(^reg53))}));
          reg56 <= ((~|{$signed((8'ha9)),
                  ({(8'haf), reg48} ? reg42 : (8'ha3))}) ?
              $signed((~&({(8'had), reg43} ?
                  $unsigned(reg48) : wire34[(5'h14):(1'h0)]))) : (^reg44));
          reg57 <= $unsigned(($signed($unsigned(wire33[(3'h6):(2'h3)])) > wire35[(4'h8):(2'h3)]));
          reg58 <= $signed(((&((8'ha0) & (reg43 ?
              reg43 : reg38))) & $unsigned(reg48)));
          if (wire39)
            begin
              reg59 <= reg51[(4'h9):(3'h7)];
              reg60 <= (reg45[(3'h7):(2'h2)] ~^ wire39);
              reg61 <= ((~^(((reg59 < reg47) ?
                  $unsigned((8'ha3)) : $signed(reg46)) * ($signed((8'ha4)) ?
                  $signed((8'ha0)) : (!wire34)))) >= reg44);
              reg62 <= {reg47};
            end
          else
            begin
              reg59 <= reg42[(4'he):(2'h3)];
              reg60 <= (wire33[(3'h4):(3'h4)] ?
                  $unsigned((8'hae)) : (^($unsigned((-wire33)) >>> $signed((reg38 ^ reg50)))));
              reg61 <= {$signed({reg57[(1'h1):(1'h1)], reg52[(4'hc):(1'h1)]}),
                  reg58[(3'h7):(1'h1)]};
            end
        end
      else
        begin
          reg55 <= wire31[(5'h10):(3'h6)];
          reg56 <= reg48[(4'hd):(1'h0)];
        end
      reg63 <= (&($signed(reg42) ?
          (reg56[(3'h6):(2'h2)] > (reg50 ?
              wire39[(4'ha):(3'h7)] : wire41[(4'hd):(4'hc)])) : (reg61 < ($signed(reg52) ?
              reg57[(1'h1):(1'h0)] : (!wire40)))));
      if ((-(reg59[(3'h7):(3'h4)] ^~ {$signed($signed(reg46))})))
        begin
          reg64 <= $unsigned($unsigned(wire39));
          if ((~|{$signed($signed((reg52 || reg44)))}))
            begin
              reg65 <= wire40[(2'h3):(2'h3)];
              reg66 <= $signed((({$signed(reg64)} ?
                      ({wire32, reg44} ?
                          (wire33 < (8'hbf)) : reg45[(4'h9):(3'h5)]) : wire41[(2'h3):(1'h1)]) ?
                  reg64 : (~^reg62[(3'h7):(3'h7)])));
              reg67 <= reg61;
            end
          else
            begin
              reg65 <= $signed((&(wire31 >>> (reg56[(1'h1):(1'h0)] ?
                  $signed(reg50) : reg60[(2'h2):(2'h2)]))));
              reg66 <= ({{reg55, (~^$signed(reg49))}} ?
                  $signed(reg63[(3'h6):(3'h5)]) : ((!(reg61 ?
                          (~|reg43) : wire36)) ?
                      $signed($signed(reg61)) : (^{(reg56 < reg54),
                          (reg44 ? reg58 : wire34)})));
              reg67 <= ($signed(($unsigned($unsigned((8'ha2))) <<< $unsigned($signed(reg50)))) - (^wire35));
              reg68 <= $unsigned($signed((reg45 ?
                  (~$unsigned(reg37)) : ((~^reg64) << (|reg56)))));
            end
          if ((reg59[(1'h0):(1'h0)] ?
              ($signed(reg44[(1'h0):(1'h0)]) ?
                  reg67[(2'h2):(1'h0)] : $unsigned({((8'ha7) <= (8'h9c))})) : {($signed(wire34[(4'ha):(3'h7)]) || $signed((^(8'hb8)))),
                  wire36[(3'h5):(1'h1)]}))
            begin
              reg69 <= ($signed((reg63[(3'h6):(3'h4)] ?
                      ((reg58 ? wire40 : reg42) ?
                          reg59 : reg56[(4'h9):(3'h5)]) : reg50[(1'h1):(1'h1)])) ?
                  reg51 : reg67[(3'h4):(1'h0)]);
            end
          else
            begin
              reg69 <= (($signed(reg50) & reg43[(2'h2):(1'h1)]) ?
                  (-(((|reg47) * reg64[(3'h6):(3'h5)]) ?
                      (8'hbd) : (wire35 ?
                          (reg58 >= reg49) : $unsigned(reg60)))) : reg53);
              reg70 <= $unsigned((^reg47));
            end
        end
      else
        begin
          reg64 <= ((8'hb7) >= reg68[(2'h2):(1'h1)]);
          reg65 <= reg49;
          reg66 <= (^(~^({reg68[(3'h6):(3'h6)]} ?
              wire39[(4'ha):(3'h6)] : reg45)));
          reg67 <= {wire39,
              ($signed(($unsigned(reg48) * {reg56,
                  wire41})) | (&$signed({wire40, reg48})))};
          if ({$unsigned((~|((reg70 ~^ reg62) ?
                  $signed(wire33) : $signed((8'ha3)))))})
            begin
              reg68 <= ({reg45,
                  (^~{(8'hbc)})} < $unsigned((wire34[(4'hf):(2'h3)] ?
                  ($unsigned(reg58) ?
                      (wire34 ? reg63 : (8'ha6)) : reg65) : $signed((reg64 ?
                      reg70 : reg59)))));
              reg69 <= wire35[(3'h4):(3'h4)];
              reg70 <= $signed(((-$signed({reg48, reg61})) ?
                  (!{(8'hbc), reg46}) : $signed((-$signed(reg52)))));
              reg71 <= reg38;
              reg72 <= reg54[(2'h2):(1'h1)];
            end
          else
            begin
              reg68 <= reg59;
              reg69 <= ($signed(($signed((~^reg48)) ~^ wire34)) ^~ reg45[(5'h12):(2'h2)]);
            end
        end
      if ({($unsigned(reg38) ?
              wire36[(3'h5):(1'h1)] : (reg70 > wire39[(4'hf):(1'h1)])),
          $signed({reg59[(1'h1):(1'h1)], reg43[(3'h6):(3'h5)]})})
        begin
          reg73 <= ((($unsigned($signed(reg62)) ?
                      $unsigned((wire41 > reg45)) : reg47[(4'hc):(4'h9)]) ?
                  wire36 : reg65) ?
              (reg67[(2'h2):(1'h0)] ?
                  reg60 : (~^$signed(reg48[(3'h6):(1'h1)]))) : reg53[(2'h2):(1'h0)]);
          reg74 <= reg71[(2'h2):(2'h2)];
          reg75 <= reg49;
          reg76 <= ($unsigned({$signed((reg45 ? reg61 : reg61)),
              reg74[(5'h10):(4'hb)]}) > reg57[(2'h3):(2'h3)]);
        end
      else
        begin
          reg73 <= (&$unsigned(reg68));
          reg74 <= $signed(reg62[(2'h2):(2'h2)]);
          if (reg47[(4'hf):(4'ha)])
            begin
              reg75 <= reg72[(1'h1):(1'h1)];
              reg76 <= $unsigned($unsigned({(wire35[(4'h8):(3'h7)] < $unsigned(reg49)),
                  wire33[(3'h5):(2'h2)]}));
            end
          else
            begin
              reg75 <= (reg54 ?
                  ($signed($signed((wire41 && reg70))) > (~^($signed(reg70) ?
                      (-reg47) : (|reg64)))) : $signed($unsigned((&(wire33 >= reg55)))));
              reg76 <= ($unsigned(reg48) >> ($signed($signed(reg48[(4'hc):(3'h4)])) >= $signed($signed((reg65 >= (8'h9f))))));
              reg77 <= $unsigned((~&{($signed(reg54) <= (~|(8'hbc))),
                  ($signed(reg60) ? reg67 : (reg49 > (8'hb8)))}));
              reg78 <= $signed((+reg46[(3'h6):(2'h2)]));
            end
          reg79 <= wire34[(4'h9):(2'h3)];
          reg80 <= ($signed((reg47[(2'h3):(2'h3)] == $signed($unsigned(reg47)))) >>> (&reg57));
        end
    end
  assign wire81 = $unsigned((-($signed((reg54 < reg45)) >> ({reg52,
                      reg57} == (wire36 ? reg73 : reg37)))));
  assign wire82 = $signed((+($unsigned((8'hb5)) ?
                      ($unsigned(reg56) ?
                          reg57[(1'h0):(1'h0)] : (reg72 ?
                              reg50 : reg47)) : wire81)));
  assign wire83 = (~|$unsigned($signed(($unsigned(wire41) ^~ reg70))));
  assign wire84 = reg38[(4'hc):(2'h3)];
  assign wire85 = ($unsigned($unsigned($unsigned({wire40}))) >= $unsigned((wire81 >= $signed((reg52 + (8'hbb))))));
  always
    @(posedge clk) begin
      reg86 <= (reg69[(4'hb):(2'h2)] ? $signed($signed(wire36)) : reg69);
    end
  assign wire87 = $signed($unsigned((($unsigned(wire31) ?
                          (~|(8'h9f)) : $signed(reg77)) ?
                      $signed((reg53 && reg61)) : (8'haa))));
  assign wire88 = (reg43[(2'h2):(1'h0)] ?
                      (!wire82) : $signed($signed((|$unsigned(reg51)))));
  assign wire89 = (~reg58[(2'h3):(2'h3)]);
  assign wire90 = $unsigned((((-$signed((8'hb7))) ?
                          ($signed(reg49) + (reg60 << reg70)) : reg62[(3'h7):(3'h4)]) ?
                      (reg86[(3'h7):(2'h2)] ?
                          $signed($signed(wire88)) : (+(reg65 ?
                              wire87 : wire89))) : (~|$unsigned(reg73[(4'hc):(2'h3)]))));
  always
    @(posedge clk) begin
      if ({$signed(wire34),
          ($signed(wire32[(1'h0):(1'h0)]) > ({(wire81 != wire84)} ?
              reg59[(1'h1):(1'h0)] : ((&reg73) <<< $signed(reg80))))})
        begin
          reg91 <= wire84[(3'h5):(2'h2)];
          if (reg75)
            begin
              reg92 <= ((+(^~$signed(reg61))) == $unsigned($signed($signed(reg70))));
              reg93 <= (($signed(($unsigned(reg47) ?
                          (reg79 * reg48) : (&reg42))) ?
                      $signed(({(7'h41),
                          reg72} ^~ {reg62})) : wire32[(1'h0):(1'h0)]) ?
                  {$unsigned(reg73),
                      $unsigned((reg47 ?
                          $unsigned(reg60) : (wire85 ?
                              reg63 : reg53)))} : reg42);
              reg94 <= wire84;
            end
          else
            begin
              reg92 <= ($signed((reg61[(4'he):(1'h1)] ?
                      (reg65[(1'h1):(1'h0)] ? reg59 : (!reg58)) : ((+wire83) ?
                          {(8'hb4)} : reg37[(1'h0):(1'h0)]))) ?
                  $signed((!reg70[(2'h3):(1'h0)])) : ($unsigned(wire36) ^~ reg61[(4'ha):(3'h6)]));
              reg93 <= reg71[(3'h7):(1'h1)];
              reg94 <= (^{(reg43 ?
                      reg57[(1'h1):(1'h1)] : $signed($signed(reg92))),
                  (&{(~|wire87), wire32[(1'h1):(1'h0)]})});
            end
          reg95 <= $unsigned({{wire83}});
          reg96 <= ({$unsigned(reg55)} || (((reg86 ?
              (reg74 && reg91) : {reg56}) > $unsigned((reg58 ?
              reg54 : reg74))) < wire84));
        end
      else
        begin
          reg91 <= (^~reg70);
          reg92 <= reg71;
          reg93 <= (reg59[(4'h9):(4'h8)] | ($signed((((8'ha1) * wire35) & reg43[(2'h3):(2'h3)])) ?
              (&$signed(reg92)) : {((wire41 ^ wire31) ? reg38 : {wire41}),
                  reg58[(3'h4):(1'h0)]}));
          if (($signed((reg70 ?
                  reg75[(4'hb):(1'h0)] : ((8'hac) != (-wire31)))) ?
              (reg71[(4'h9):(2'h2)] ?
                  reg71[(1'h0):(1'h0)] : ((+(wire31 <<< wire84)) >>> reg74)) : (^(($unsigned(reg52) ?
                      wire81[(3'h4):(1'h1)] : wire83[(2'h2):(1'h1)]) ?
                  (^(^~(7'h43))) : ((|wire90) ^~ $signed(reg47))))))
            begin
              reg94 <= (+$unsigned((reg86[(2'h3):(1'h1)] ?
                  (8'hb1) : $signed((reg45 ^ wire41)))));
            end
          else
            begin
              reg94 <= ((!$signed($unsigned(reg60[(2'h3):(2'h2)]))) == ($signed(wire31) ~^ reg64[(3'h5):(1'h1)]));
            end
          reg95 <= $signed(wire41[(3'h6):(3'h4)]);
        end
      if (($unsigned((+(reg94[(4'h8):(4'h8)] ?
              (reg48 ? (7'h41) : reg72) : $unsigned(reg56)))) ?
          ({$signed((!reg94)), (-(^reg51))} < {$unsigned($unsigned(reg68)),
              $unsigned(reg47[(4'h8):(2'h2)])}) : reg49))
        begin
          reg97 <= (reg50[(2'h2):(2'h2)] || {reg54,
              (reg48 ?
                  ((reg46 ? wire82 : reg56) ?
                      (wire88 <= reg56) : reg56[(3'h7):(3'h5)]) : reg96[(1'h1):(1'h0)])});
          reg98 <= $signed($unsigned($signed($signed(reg69))));
        end
      else
        begin
          reg97 <= reg64;
        end
      reg99 <= reg72;
      reg100 <= ($unsigned((reg74[(5'h11):(4'he)] ?
          (~(wire82 | reg44)) : ((&reg46) * $signed(reg72)))) * $signed((reg55 ?
          (^(^reg57)) : ($signed(reg67) ~^ (wire31 ? wire87 : (8'hbd))))));
      reg101 <= $unsigned({(({wire87, (8'h9d)} << $unsigned(wire89)) ?
              ((&reg68) - (~&reg59)) : ((~&reg91) >= (~reg67))),
          ((&{reg100, reg67}) ^ ((wire33 >> reg93) ^ (wire90 || reg76)))});
    end
endmodule

module module128
#(parameter param159 = ((&(!{((8'ha9) << (8'hb5))})) & ((|(((8'ha3) | (8'hae)) ^~ ((8'haf) ? (8'ha6) : (8'h9d)))) ^ (({(8'hbe)} > (+(7'h44))) ? (((8'had) <<< (8'h9f)) >> ((7'h40) <<< (7'h40))) : {((7'h40) ? (7'h42) : (8'ha6))}))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire133;
  input wire [(4'hb):(1'h0)] wire132;
  input wire signed [(5'h11):(1'h0)] wire131;
  input wire [(5'h13):(1'h0)] wire130;
  input wire [(4'ha):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire [(2'h2):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 reg154,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire134 = wire133;
  assign wire135 = ($unsigned((7'h41)) << ($unsigned(wire131[(5'h11):(4'h8)]) ?
                       wire131 : ($unsigned((8'hbf)) ?
                           (wire131 >> $signed(wire130)) : (^~(wire129 * wire133)))));
  assign wire136 = $signed(((-wire134[(2'h2):(1'h0)]) >>> $unsigned(((~wire129) ?
                       (wire129 <<< (8'ha2)) : (wire129 ?
                           wire135 : wire132)))));
  assign wire137 = wire129;
  assign wire138 = ($unsigned((~{(wire131 + wire130)})) | $unsigned((~&wire133[(2'h2):(1'h1)])));
  assign wire139 = (($unsigned(wire136[(1'h0):(1'h0)]) ?
                       {wire137,
                           $unsigned($unsigned((8'ha4)))} : $signed(wire133[(4'hc):(3'h6)])) >> wire136);
  assign wire140 = wire136;
  assign wire141 = (wire136[(4'hb):(3'h4)] ^ ($unsigned($signed((8'hb9))) ?
                       wire130[(3'h4):(2'h3)] : (~|(wire131 ?
                           (wire131 ?
                               wire131 : wire132) : (wire138 * wire138)))));
  always
    @(posedge clk) begin
      reg142 <= ((({(wire139 ? wire138 : wire141),
                  ((8'h9d) ? wire135 : wire138)} ?
              ($signed(wire133) ?
                  (wire137 ? wire139 : wire135) : (8'haa)) : wire139) ?
          wire136 : $unsigned($unsigned($unsigned(wire135)))) * $unsigned((wire130[(4'hb):(2'h2)] ?
          ((~^wire140) ?
              wire138[(3'h5):(1'h1)] : (wire139 ?
                  wire137 : (8'hb6))) : $signed($unsigned(wire133)))));
    end
  always
    @(posedge clk) begin
      reg143 <= ($unsigned((&wire131[(1'h0):(1'h0)])) ?
          ((wire134 ? wire141 : $unsigned($unsigned(wire134))) ?
              $signed((^~wire138)) : {{$signed(wire132), wire135},
                  (wire130[(3'h4):(3'h4)] ?
                      wire141 : $signed((7'h42)))}) : (+$unsigned($signed(wire132[(2'h2):(1'h1)]))));
      reg144 <= wire136[(4'hd):(4'h8)];
      if ((reg142[(2'h3):(2'h2)] ?
          ($signed(wire130[(5'h13):(4'h9)]) ?
              wire130[(4'h8):(2'h2)] : reg144[(3'h4):(1'h0)]) : $unsigned(reg144)))
        begin
          reg145 <= (~reg143);
          reg146 <= wire130[(5'h13):(5'h12)];
          if ($signed($unsigned((~^(8'ha4)))))
            begin
              reg147 <= reg142;
              reg148 <= wire137;
            end
          else
            begin
              reg147 <= ((wire136 || $unsigned((wire139 ?
                      reg143 : (wire129 != wire139)))) ?
                  {wire132[(1'h0):(1'h0)]} : $unsigned($signed(($signed(reg148) && (reg145 != wire136)))));
              reg148 <= $signed((8'ha6));
            end
          reg149 <= reg142[(4'h8):(1'h1)];
          if ((+reg144))
            begin
              reg150 <= $signed($unsigned((!$unsigned(wire140))));
            end
          else
            begin
              reg150 <= (8'h9d);
              reg151 <= (8'h9c);
              reg152 <= $signed(($unsigned(wire132) * (8'hb2)));
            end
        end
      else
        begin
          reg145 <= (((wire129 ?
                  $signed((!wire139)) : (wire133[(5'h13):(4'he)] ?
                      (&reg143) : wire139[(4'hd):(3'h5)])) <= (-(^(!reg146)))) ?
              (reg144[(3'h4):(2'h3)] >> reg149[(1'h0):(1'h0)]) : $signed(wire130));
        end
    end
  assign wire153 = {(($signed($signed(wire135)) ?
                               ($signed(reg142) ?
                                   wire131 : $signed((8'ha7))) : (~$signed(wire137))) ?
                           reg145 : $signed(wire138)),
                       wire133[(4'hc):(3'h6)]};
  always
    @(posedge clk) begin
      reg154 <= wire136[(4'hf):(3'h6)];
    end
  assign wire155 = (8'ha2);
  assign wire156 = wire141[(2'h3):(1'h0)];
  assign wire157 = {$signed($unsigned(wire156[(1'h0):(1'h0)])),
                       $unsigned((wire141[(2'h2):(1'h0)] ?
                           wire138[(3'h7):(3'h7)] : reg145[(3'h4):(1'h1)]))};
  assign wire158 = {($unsigned($unsigned($unsigned(reg144))) + $signed(wire131)),
                       (^(((+reg151) || {(8'hb9),
                           wire134}) ^~ ($signed(wire129) ?
                           $unsigned(reg146) : (wire133 - wire141))))};
endmodule

module module114
#(parameter param124 = (~&(|{((~(8'hb3)) ~^ (8'ha1)), {((8'h9c) ? (8'haa) : (8'hb6))}})), 
parameter param125 = ((&param124) >> (^{((param124 <= param124) ~^ param124), param124})))
(y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire119;
  input wire signed [(4'hc):(1'h0)] wire118;
  input wire [(4'hd):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire [(4'hd):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  assign y = {wire123, wire122, wire121, wire120, (1'h0)};
  assign wire120 = wire115[(1'h0):(1'h0)];
  assign wire121 = wire116[(3'h7):(1'h1)];
  assign wire122 = wire119[(1'h1):(1'h0)];
  assign wire123 = $signed($unsigned(wire120[(3'h4):(3'h4)]));
endmodule
