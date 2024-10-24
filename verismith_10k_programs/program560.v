module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire155;
  wire signed [(3'h5):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire142;
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire5,
                 wire6,
                 wire142,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire5 = (~|(((wire0[(1'h1):(1'h1)] ? (8'had) : $signed(wire2)) ?
                         wire2[(3'h4):(2'h3)] : ($signed(wire1) ?
                             $signed(wire3) : $signed((8'had)))) ?
                     wire0[(4'h9):(1'h1)] : ((~^wire1) & $unsigned($signed(wire1)))));
  assign wire6 = wire2;
  module7 #() modinst143 (.wire9(wire0), .wire8(wire2), .wire12(wire1), .wire10(wire4), .clk(clk), .wire11(wire5), .y(wire142));
  always
    @(posedge clk) begin
      reg144 <= $signed($signed((~&(wire4 ?
          $unsigned(wire5) : $signed(wire1)))));
      if ((wire5[(3'h6):(2'h2)] >>> $signed({(wire1 ?
              $signed(wire6) : (wire142 ? (8'hbb) : wire0))})))
        begin
          reg145 <= $signed((8'haf));
        end
      else
        begin
          reg145 <= {$signed(wire1[(3'h6):(2'h2)])};
        end
      reg146 <= $unsigned(((^$signed(wire2[(5'h14):(2'h2)])) ?
          (&wire0) : {{wire0}, reg145}));
      reg147 <= (8'hac);
      reg148 <= ((wire2 ?
          (+$unsigned($unsigned(reg146))) : wire4) != wire4[(4'hb):(1'h1)]);
    end
  assign wire149 = (~&(&$unsigned((~^wire5[(4'hb):(3'h5)]))));
  assign wire150 = (7'h41);
  assign wire151 = (8'h9c);
  assign wire152 = ({wire3} ?
                       wire150 : (~^(!(wire2 ?
                           $signed(reg148) : $unsigned(wire149)))));
  assign wire153 = (($unsigned((!(wire150 | reg146))) && (~((wire142 ?
                           wire152 : (8'hbf)) == (wire150 != reg145)))) ?
                       $signed($signed($signed($unsigned(wire151)))) : ({wire0[(4'ha):(4'h9)]} ?
                           wire3[(4'he):(4'hd)] : (^~(^$signed((8'ha9))))));
  assign wire154 = ($signed((+$unsigned($signed(reg145)))) <<< $unsigned($signed($signed(wire1[(2'h3):(2'h2)]))));
  assign wire155 = ($unsigned((!(wire3 ? (~|reg147) : $signed(reg144)))) ?
                       reg144 : (reg145[(3'h4):(2'h2)] ?
                           ($unsigned({wire149}) ^ $unsigned(wire149)) : $signed($unsigned((wire154 && wire142)))));
endmodule

module module7
#(parameter param141 = ((~(&((8'hab) ^ ((8'ha3) ? (8'h9c) : (8'ha8))))) ? (((^((8'ha7) ? (8'h9c) : (8'hb8))) ? (((8'hbc) << (8'hb7)) ? ((8'hbe) ? (8'ha8) : (8'hb7)) : ((8'hb9) ? (7'h43) : (8'ha8))) : (8'ha3)) != (((+(7'h43)) ? ((8'ha1) >= (8'hb1)) : ((8'hbd) & (8'hb2))) * (((8'ha2) ? (8'hb3) : (8'hb7)) ? (&(7'h44)) : {(8'hb2), (8'h9c)}))) : ({{((8'ha2) && (8'hb5))}} + (((-(8'hb8)) + (+(8'hb3))) ? (((8'ha0) <<< (7'h40)) ? ((8'had) ? (8'had) : (8'h9e)) : {(8'hb7)}) : ({(7'h43)} ? ((8'ha3) ? (8'hb9) : (8'ha1)) : ((8'hb9) - (8'haa)))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(4'h9):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire40;
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire98,
                 wire91,
                 wire44,
                 wire43,
                 wire42,
                 wire13,
                 wire14,
                 wire40,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 (1'h0)};
  assign wire13 = wire9[(1'h1):(1'h1)];
  assign wire14 = $signed((wire8 == $signed(((wire12 >> (8'hb9)) ~^ $unsigned(wire12)))));
  module15 #() modinst41 (wire40, clk, wire13, wire9, wire11, wire8, wire12);
  assign wire42 = wire8;
  assign wire43 = $signed(wire40);
  assign wire44 = (wire13[(3'h5):(3'h4)] >> {$unsigned(((wire11 && wire14) ?
                          (wire40 ? wire43 : wire8) : $unsigned(wire9))),
                      $signed($signed($signed(wire12)))});
  module45 #() modinst92 (.clk(clk), .wire46(wire13), .wire49(wire43), .wire47(wire12), .wire48(wire14), .y(wire91));
  always
    @(posedge clk) begin
      reg93 <= (((8'hba) ?
              ($unsigned((wire91 ^ wire40)) ?
                  (~&(wire44 ?
                      wire43 : wire43)) : ($signed(wire14) & $unsigned(wire9))) : (wire42 ?
                  (8'ha9) : {(wire13 ? wire10 : wire13), (wire8 >= wire12)})) ?
          (~{$unsigned((wire11 <<< wire10))}) : {{$unsigned($signed((8'haf)))}});
      reg94 <= wire11;
      reg95 <= ($unsigned($unsigned(($signed(reg94) ~^ wire42[(2'h2):(1'h0)]))) ?
          wire10[(4'h8):(4'h8)] : {({$unsigned(reg94)} * (8'h9d))});
      reg96 <= (wire44 < $signed((((~wire44) ~^ (wire14 ? wire91 : wire44)) ?
          (^wire8[(5'h14):(5'h12)]) : wire11)));
      reg97 <= ($signed($signed(wire44[(1'h1):(1'h0)])) + $unsigned(reg96[(1'h0):(1'h0)]));
    end
  assign wire98 = (reg95 ? reg93[(3'h5):(1'h0)] : (8'hb5));
  module99 #() modinst139 (.wire104(wire44), .clk(clk), .wire102(wire91), .wire100(wire10), .wire103(reg97), .y(wire138), .wire101(wire43));
  assign wire140 = wire8[(4'he):(4'hd)];
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire104;
  input wire signed [(5'h14):(1'h0)] wire103;
  input wire [(4'he):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire111;
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire111,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned((^~$unsigned($signed(wire102))))))
        begin
          reg105 <= $unsigned($signed((((wire100 ?
                  wire103 : wire101) | wire104[(3'h4):(1'h1)]) ?
              (|$signed(wire104)) : $unsigned((wire100 ~^ wire102)))));
          reg106 <= ($signed(wire102[(2'h2):(1'h1)]) | (($unsigned(wire104[(4'ha):(1'h0)]) >>> (-$signed(reg105))) ?
              (8'hb7) : wire102[(3'h6):(2'h3)]));
          reg107 <= $unsigned(wire101[(3'h4):(2'h3)]);
        end
      else
        begin
          if (reg107[(3'h7):(1'h0)])
            begin
              reg105 <= $signed({(!($signed(reg106) ?
                      $signed(wire100) : wire104[(4'hd):(4'h9)]))});
              reg106 <= $unsigned($unsigned((+(~&reg107[(3'h4):(3'h4)]))));
              reg107 <= reg107;
              reg108 <= (~wire104);
              reg109 <= (~|$unsigned(({(8'haa),
                  (wire101 ? wire101 : wire100)} != ((reg106 <= wire101) ?
                  $signed(reg107) : wire103[(4'ha):(4'h8)]))));
            end
          else
            begin
              reg105 <= reg108[(2'h3):(1'h0)];
              reg106 <= ($unsigned(($signed($unsigned(wire100)) ?
                      (&(|reg105)) : $unsigned({(8'hab), reg109}))) ?
                  ($signed(reg105[(2'h2):(2'h2)]) << (~reg106[(1'h0):(1'h0)])) : (^$signed(((wire101 ?
                          wire101 : reg107) ?
                      {wire100} : (~&wire104)))));
            end
        end
      reg110 <= reg105;
    end
  assign wire111 = reg110;
  always
    @(posedge clk) begin
      if (reg105[(3'h4):(1'h1)])
        begin
          if (({(reg109 & $signed((reg107 ? wire100 : wire100))),
                  reg106[(5'h11):(4'ha)]} ?
              ($unsigned(wire100[(3'h4):(1'h1)]) ~^ wire102) : $signed($signed({(wire104 ?
                      (8'hb8) : wire111)}))))
            begin
              reg112 <= $signed($unsigned(wire111));
              reg113 <= $signed((((8'hb6) ?
                      {$signed(reg108),
                          (reg108 ? reg105 : (8'hbb))} : ((reg112 || reg107) ?
                          (wire100 ? reg107 : wire100) : (^~reg112))) ?
                  $unsigned((!reg108)) : reg112[(5'h10):(3'h7)]));
              reg114 <= $unsigned(wire103[(5'h12):(5'h12)]);
              reg115 <= (^$unsigned($unsigned(wire102[(4'hd):(1'h0)])));
              reg116 <= (8'ha2);
            end
          else
            begin
              reg112 <= $unsigned(reg108);
              reg113 <= (reg107 == ((!((reg108 & (8'hba)) == ((8'haf) ?
                      wire100 : wire101))) ?
                  ((^(+wire104)) ^ reg112[(2'h2):(1'h1)]) : wire111));
            end
          if ($unsigned(reg114[(1'h0):(1'h0)]))
            begin
              reg117 <= $signed(reg108[(1'h0):(1'h0)]);
              reg118 <= (~|({((reg110 + wire103) > (wire101 ?
                          (8'h9d) : reg113))} ?
                  (wire101 >> ($unsigned(reg108) ?
                      reg114[(1'h0):(1'h0)] : reg109)) : wire102[(1'h1):(1'h1)]));
              reg119 <= (~|reg109[(2'h3):(2'h2)]);
              reg120 <= $signed((($unsigned(reg118) == wire103[(4'h8):(1'h1)]) ~^ $unsigned((-(~^wire104)))));
            end
          else
            begin
              reg117 <= (((~|reg110) + $signed(reg106)) ?
                  wire103[(1'h1):(1'h1)] : (^~$signed((~|(^~(8'hbe))))));
              reg118 <= reg117[(1'h1):(1'h1)];
              reg119 <= $unsigned(reg113[(4'ha):(3'h6)]);
              reg120 <= $unsigned((reg116 ^~ wire111));
            end
        end
      else
        begin
          if ((reg108[(4'ha):(2'h3)] <= reg107))
            begin
              reg112 <= ((~($unsigned($signed((8'ha0))) <= reg108)) <<< (reg110[(4'hb):(4'hb)] || $unsigned(reg116)));
              reg113 <= reg113[(3'h4):(1'h0)];
              reg114 <= $unsigned(reg107[(4'hd):(4'h9)]);
              reg115 <= (&(8'hba));
              reg116 <= $unsigned($unsigned(wire102));
            end
          else
            begin
              reg112 <= (8'ha3);
              reg113 <= (wire111 && wire101[(1'h0):(1'h0)]);
              reg114 <= (|reg112[(4'hd):(4'h8)]);
              reg115 <= $unsigned({((^~(^~wire104)) ^~ $unsigned(reg106))});
            end
          reg117 <= (|(^(!($unsigned(reg107) ?
              (reg109 ? reg116 : wire100) : {wire101, reg106}))));
        end
      reg121 <= $signed($signed(reg109));
    end
  assign wire122 = $unsigned((reg116 ?
                       ({(~reg112), (wire102 ? reg113 : wire101)} && ((wire104 ?
                           reg120 : reg108) << $signed(reg107))) : wire102));
  assign wire123 = reg106;
  assign wire124 = (~((wire123[(3'h6):(1'h0)] >>> wire102[(4'he):(4'hc)]) * (~reg119[(3'h5):(3'h5)])));
  assign wire125 = (reg119[(3'h5):(3'h5)] ? reg110 : (~^reg114[(2'h2):(2'h2)]));
  assign wire126 = (({(^~(reg116 ? (8'h9c) : reg116)),
                       {$unsigned(reg106)}} < reg115) | reg107);
  assign wire127 = reg108[(3'h5):(2'h2)];
  assign wire128 = ((($signed($unsigned(wire123)) ?
                       ($signed(reg106) <= $unsigned(wire122)) : wire125) * $signed((wire125[(4'hb):(4'h8)] ?
                       (8'h9e) : wire126))) <= $unsigned(reg120[(2'h3):(1'h0)]));
  assign wire129 = $signed(wire111[(3'h7):(3'h4)]);
  assign wire130 = (&reg108);
  assign wire131 = {$signed((~^{wire127[(3'h5):(2'h3)],
                           wire100[(1'h0):(1'h0)]})),
                       (8'hbc)};
  assign wire132 = reg118[(2'h2):(1'h0)];
  assign wire133 = {(((reg105[(3'h6):(3'h6)] < (~|reg106)) >>> {(^reg112),
                               $unsigned(wire101)}) ?
                           ((^$signed(reg105)) <<< wire104[(2'h3):(1'h0)]) : ((|(wire124 ?
                                   wire103 : wire132)) ?
                               $signed((wire129 ?
                                   (7'h43) : reg109)) : ((reg106 || wire122) <<< ((8'hac) ?
                                   wire123 : reg105))))};
  assign wire134 = (~^((^~{$unsigned(wire132)}) >> wire125[(3'h5):(3'h4)]));
  assign wire135 = $unsigned(reg106);
  assign wire136 = wire127;
  assign wire137 = (((~$unsigned((8'hac))) ?
                       $unsigned((+reg108[(2'h3):(1'h0)])) : $unsigned(wire127[(3'h4):(1'h0)])) < (~(((reg117 >> reg121) ?
                           $signed(wire103) : reg107) ?
                       reg108[(4'ha):(4'ha)] : {reg117, $signed(wire122)})));
endmodule

module module45  (y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire49;
  input wire [(4'h8):(1'h0)] wire48;
  input wire [(5'h11):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  assign y = {wire90,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg89,
                 reg88,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= ((8'hba) ?
          (wire46 ?
              {(~$unsigned(wire48))} : $unsigned({(-wire46),
                  $unsigned(wire46)})) : {($unsigned({(8'hbf),
                  wire48}) || wire49[(3'h5):(1'h0)]),
              (wire49[(3'h5):(1'h1)] ?
                  (~&wire46[(4'h9):(3'h6)]) : $signed({wire48, (8'ha9)}))});
      reg51 <= (!(7'h41));
      reg52 <= $signed((^~(~$signed($unsigned(reg50)))));
      reg53 <= (wire48[(2'h2):(2'h2)] ? wire48 : $signed(reg52[(1'h0):(1'h0)]));
    end
  assign wire54 = (({$signed(wire48[(3'h5):(2'h3)]),
                              $unsigned(((8'hb8) ^~ wire47))} ?
                          {(wire46 && wire47)} : reg52[(3'h4):(2'h3)]) ?
                      (({(~&wire47), wire46[(3'h6):(3'h6)]} != {{wire49, reg52},
                          (~reg52)}) ^~ (($signed(wire46) ?
                          ((8'ha0) ?
                              reg50 : reg50) : wire46) == ($unsigned((8'ha4)) * (8'haf)))) : ((8'ha4) == $signed((wire49[(3'h6):(1'h1)] ?
                          $signed(reg51) : $unsigned(reg50)))));
  assign wire55 = wire49;
  assign wire56 = $unsigned($signed((($signed(reg51) ?
                          (~&wire46) : $signed(reg50)) ?
                      (|$signed(reg53)) : ((wire47 ~^ reg53) ?
                          (wire54 >= reg50) : $signed(wire47)))));
  assign wire57 = (wire55 || (wire48 << $signed(reg52[(3'h5):(3'h5)])));
  assign wire58 = ((8'hb0) && (reg50[(2'h3):(1'h1)] >> reg52));
  always
    @(posedge clk) begin
      if ((($signed($unsigned((8'hb8))) << wire56[(3'h4):(1'h1)]) < wire57[(3'h4):(2'h2)]))
        begin
          reg59 <= {wire46, $signed(wire57[(5'h13):(4'hf)])};
          reg60 <= (((reg50[(1'h0):(1'h0)] ? (~wire54) : wire57) ?
                  reg52 : reg52) ?
              ((wire55 & {$unsigned(reg51), $unsigned(reg50)}) ?
                  reg52[(3'h4):(2'h2)] : (($signed(wire48) & ((8'hb2) ?
                          reg52 : wire48)) ?
                      (&reg53[(4'h8):(3'h7)]) : (~^(+reg53)))) : $unsigned(wire54));
          reg61 <= ((reg50[(2'h3):(2'h2)] ?
                  $signed((wire48[(2'h2):(1'h1)] >= reg52[(2'h3):(1'h1)])) : $unsigned($signed((reg59 >= reg59)))) ?
              reg51 : $signed(wire54));
          reg62 <= (reg50[(1'h1):(1'h1)] ?
              $signed((($unsigned(wire58) << {(8'h9f), wire54}) ?
                  (wire54 ?
                      (~|wire54) : (wire47 ?
                          (8'haa) : wire56)) : ($unsigned(reg51) ?
                      (reg52 * (8'hae)) : $unsigned((8'hba))))) : ((~|wire47[(4'hb):(2'h2)]) <<< (wire57[(1'h0):(1'h0)] ?
                  $signed((wire54 - wire49)) : ((^reg61) ?
                      (~&reg50) : (wire54 <= wire57)))));
          reg63 <= $signed($signed((^wire49[(3'h4):(2'h3)])));
        end
      else
        begin
          reg59 <= reg51[(1'h1):(1'h0)];
        end
    end
  assign wire64 = (({wire54[(4'hf):(4'h9)],
                          wire54[(3'h5):(2'h3)]} <<< $unsigned($signed((reg53 ?
                          (7'h43) : wire47)))) ?
                      {(reg63[(1'h0):(1'h0)] ?
                              wire48 : (~^((8'h9f) ^~ reg61)))} : reg59[(2'h2):(2'h2)]);
  assign wire65 = (-($unsigned($signed(reg62)) ?
                      $signed(reg59[(4'ha):(3'h5)]) : ((~|$signed(wire55)) > wire48)));
  assign wire66 = ((-((&(reg63 >>> reg60)) ?
                          ($signed(reg52) <<< (reg60 ?
                              wire55 : wire56)) : (!wire58))) ?
                      {{reg62, reg50},
                          ((+(wire57 ? wire49 : wire46)) || wire46)} : wire65);
  assign wire67 = wire55;
  assign wire68 = {$unsigned(wire49), (^~(|$signed(((8'hac) - wire56))))};
  always
    @(posedge clk) begin
      reg69 <= wire66[(1'h0):(1'h0)];
      if ((reg59[(4'hd):(1'h0)] ^~ {(^(wire66[(2'h3):(2'h2)] ?
              (reg69 << wire57) : $signed((7'h42)))),
          $signed((^wire46[(2'h2):(1'h1)]))}))
        begin
          reg70 <= $signed((({(reg60 ? wire57 : (8'hba))} | ((wire68 == reg63) ?
              (wire56 ? reg59 : (8'hbb)) : reg50)) > reg63[(3'h5):(3'h4)]));
          if (((-(-({wire57, reg63} ?
              $unsigned((8'hae)) : reg70))) * ($unsigned((-(wire56 < reg53))) ^ (-($unsigned(wire57) ?
              (wire55 ? wire67 : (8'ha0)) : $unsigned(wire55))))))
            begin
              reg71 <= {(&(^~reg59)), $unsigned(wire64[(2'h2):(2'h2)])};
              reg72 <= $signed(reg60);
              reg73 <= (~(wire54 ?
                  {(reg63 ? {reg69} : $unsigned(reg52))} : ((~|(8'hb7)) ?
                      wire54[(4'hd):(3'h5)] : {$signed(wire49), reg51})));
            end
          else
            begin
              reg71 <= ((reg73 <<< wire48) ?
                  (($signed(wire46) ^ $unsigned($signed(reg72))) ?
                      ((+reg52[(1'h1):(1'h1)]) ^ {$signed(wire66)}) : reg53[(1'h0):(1'h0)]) : $unsigned(((~|$unsigned(reg60)) >>> ((wire57 ~^ wire67) && wire58[(2'h2):(1'h0)]))));
              reg72 <= ($unsigned((wire49 ?
                  wire49[(3'h6):(2'h2)] : (^~$signed(wire48)))) - {wire57,
                  {(wire68 ? {(8'haa)} : reg62), $unsigned($unsigned(reg60))}});
            end
          if (reg53[(3'h4):(2'h3)])
            begin
              reg74 <= ($signed(reg52) || ($unsigned(((wire58 ?
                  reg71 : reg62) * $signed(reg52))) == $signed((wire64 <= wire55))));
            end
          else
            begin
              reg74 <= $signed((8'haa));
              reg75 <= {(wire54 == {(&wire48[(1'h1):(1'h1)])}),
                  ((~&wire54) > reg53[(1'h0):(1'h0)])};
              reg76 <= (|(reg60 < $signed(((reg60 ?
                  wire68 : wire48) - (reg61 < wire67)))));
              reg77 <= $signed({$unsigned(wire55[(2'h2):(2'h2)]),
                  $signed({wire54})});
            end
          reg78 <= wire48[(4'h8):(4'h8)];
        end
      else
        begin
          if (($unsigned(($unsigned((reg70 ? (8'hb6) : wire67)) ?
                  (~&$unsigned((7'h40))) : $signed(reg53))) ?
              {$signed($unsigned(wire66)),
                  (~|((reg74 >> reg53) ? {wire58, reg76} : (!reg52)))} : reg63))
            begin
              reg70 <= $unsigned(reg61);
              reg71 <= $signed(wire57);
              reg72 <= (($signed(($signed(reg75) ?
                      (wire54 || (8'hb2)) : reg78[(1'h0):(1'h0)])) ?
                  $unsigned($unsigned(reg61)) : reg59) <= $unsigned((|wire66)));
            end
          else
            begin
              reg70 <= ($unsigned(((((8'ha6) ? wire68 : wire65) ?
                          (reg59 ? reg71 : reg60) : reg60[(3'h7):(3'h6)]) ?
                      (^~reg53) : {wire66, (~&reg69)})) ?
                  reg78 : (((reg60[(1'h0):(1'h0)] << {reg76, reg78}) ^ reg70) ?
                      (wire48[(1'h1):(1'h0)] ?
                          reg73[(3'h7):(3'h4)] : reg52[(2'h2):(2'h2)]) : ($unsigned((wire46 ?
                          reg51 : wire67)) >>> (~^reg78))));
              reg71 <= {(~&$unsigned((~&$unsigned(reg63)))),
                  (((wire49 ? (reg69 ? (8'hbc) : (8'hb5)) : $signed(reg52)) ?
                      reg69[(3'h6):(3'h6)] : reg62) > {(|(wire66 >= (8'ha3)))})};
              reg72 <= {(~|$unsigned(wire55))};
            end
        end
      if ($signed($signed($unsigned(((+reg77) != $signed(reg77))))))
        begin
          reg79 <= ($signed(wire68[(2'h2):(2'h2)]) <= $unsigned(($signed(wire54) > (reg70[(2'h3):(1'h0)] && $signed(reg73)))));
          reg80 <= $unsigned({{(8'hae)}});
          reg81 <= wire48[(3'h6):(3'h6)];
        end
      else
        begin
          reg79 <= (8'haa);
          reg80 <= $signed($unsigned($signed($signed((reg72 ^ reg53)))));
          reg81 <= {wire55[(4'h9):(3'h6)]};
          if (wire57[(5'h11):(2'h2)])
            begin
              reg82 <= (((&wire68) ?
                  (~^$unsigned(wire66[(1'h1):(1'h0)])) : reg76[(5'h10):(5'h10)]) == wire58);
              reg83 <= reg59[(4'h9):(2'h3)];
              reg84 <= (^~reg52[(1'h1):(1'h1)]);
              reg85 <= (($unsigned(((|reg79) < (~wire49))) ^~ $unsigned(reg83)) ?
                  $unsigned((wire49[(3'h5):(2'h2)] != reg60)) : (&wire57[(5'h11):(5'h10)]));
              reg86 <= $signed($unsigned(((((8'ha4) ?
                      wire57 : reg75) | wire64[(1'h0):(1'h0)]) ?
                  (wire56[(2'h2):(1'h1)] ?
                      $signed(reg79) : (reg79 ?
                          (8'hbd) : (8'h9c))) : $unsigned(((8'hbb) & wire49)))));
            end
          else
            begin
              reg82 <= reg86;
              reg83 <= $signed($signed($signed(({reg71,
                  reg50} <= (reg80 + reg76)))));
              reg84 <= reg80;
              reg85 <= (-(~|($unsigned(((8'haf) >>> reg76)) ?
                  $unsigned((reg82 ? wire46 : reg63)) : (~&{reg60}))));
            end
          reg87 <= ($unsigned(reg53) ?
              (reg74 ?
                  ($signed(reg84[(2'h3):(1'h0)]) - reg78[(1'h1):(1'h0)]) : $signed(reg62)) : $signed((^(+$signed(wire58)))));
        end
      reg88 <= reg82[(3'h4):(2'h2)];
      reg89 <= reg76[(4'he):(3'h4)];
    end
  assign wire90 = reg82;
endmodule

module module15
#(parameter param38 = {(~^((~|((8'h9d) < (8'h9d))) ~^ (((8'hb4) + (8'ha7)) ? (|(8'h9d)) : ((8'hb1) ? (8'ha2) : (8'hb8)))))}, 
parameter param39 = param38)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = $unsigned(($unsigned($unsigned((wire18 ? wire16 : wire17))) ?
                      (((wire20 != wire19) * wire17) <= ($unsigned(wire20) >= (~&wire17))) : ((!(wire18 <= wire20)) ?
                          wire20[(3'h5):(2'h2)] : $unsigned({wire20}))));
  assign wire22 = wire19[(4'hc):(4'h8)];
  assign wire23 = wire19[(2'h2):(2'h2)];
  assign wire24 = (|(wire23[(1'h0):(1'h0)] ?
                      ($unsigned((^~wire23)) != $signed((wire23 << wire19))) : ((wire22[(4'h8):(3'h7)] ?
                          {wire20, wire16} : (~&wire21)) << ((wire22 ?
                          wire20 : wire18) > (wire23 <<< wire21)))));
  assign wire25 = (((8'hae) ?
                          (-($signed(wire24) ?
                              wire17[(5'h13):(5'h13)] : wire23)) : $unsigned(((wire21 > wire21) ?
                              (wire23 ?
                                  wire17 : wire24) : wire18[(3'h5):(1'h0)]))) ?
                      $signed(($signed((^~wire21)) ^ wire19)) : ($signed((wire19[(1'h1):(1'h0)] + $signed(wire21))) < $unsigned($signed((wire24 ?
                          wire24 : wire23)))));
  assign wire26 = $signed(((($signed(wire22) + $signed(wire21)) <<< ($unsigned(wire22) ~^ $signed(wire22))) != (7'h43)));
  assign wire27 = {((~^($unsigned(wire21) ?
                          wire24[(5'h14):(4'hb)] : (wire23 || wire19))) * wire19),
                      ((({wire26} ? $signed(wire22) : {wire16}) ?
                              wire20[(1'h1):(1'h1)] : ($unsigned(wire25) ?
                                  $signed(wire25) : (^(8'hb5)))) ?
                          (wire26[(3'h5):(3'h5)] ?
                              {{wire21},
                                  wire25} : (~&(^~wire16))) : ($unsigned((wire21 ?
                              wire22 : wire25)) << wire18))};
  assign wire28 = ($unsigned(wire19[(4'hc):(4'h8)]) ?
                      wire17[(1'h0):(1'h0)] : wire22[(5'h10):(4'hb)]);
  assign wire29 = (-wire16);
  assign wire30 = (~&wire25);
  assign wire31 = $unsigned((|$signed($unsigned((8'ha8)))));
  assign wire32 = wire27[(5'h11):(2'h3)];
  assign wire33 = (~((wire30 | wire27) == wire30));
  assign wire34 = (($signed($unsigned($signed(wire16))) ?
                          ({{wire29, wire19}} > ($unsigned(wire17) != (wire21 ?
                              wire29 : wire32))) : (({wire25, wire31} ?
                                  {wire28, wire21} : $unsigned(wire26)) ?
                              ((wire19 ? (8'ha8) : wire29) ?
                                  $signed(wire27) : (wire18 ?
                                      (7'h42) : wire16)) : wire30[(3'h5):(2'h2)])) ?
                      wire20 : $unsigned($signed($unsigned((wire28 ?
                          wire20 : wire20)))));
  assign wire35 = $signed($signed($unsigned($signed((wire20 + wire31)))));
  assign wire36 = wire26;
  assign wire37 = wire24[(5'h10):(3'h5)];
endmodule
