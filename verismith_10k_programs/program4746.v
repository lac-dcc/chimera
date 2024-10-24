module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire122;
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire166,
                 wire164,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire124,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire122,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg11,
                 (1'h0)};
  assign wire5 = (8'haf);
  assign wire6 = wire1;
  assign wire7 = ($unsigned(wire5[(1'h0):(1'h0)]) ?
                     ((~^$unsigned(wire3)) <<< (~&wire0)) : (8'ha4));
  assign wire8 = (~(wire1[(3'h7):(3'h7)] ?
                     ((wire6[(3'h4):(2'h3)] ?
                             (wire1 ? wire2 : wire1) : (wire3 != wire2)) ?
                         $unsigned($signed((8'hbe))) : (+(8'hb9))) : wire3[(1'h0):(1'h0)]));
  assign wire9 = (~(&($signed((wire0 ? wire8 : wire5)) * (wire4 ^~ wire1))));
  assign wire10 = $signed(wire4[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg11 <= $unsigned({$signed($unsigned(wire4))});
    end
  assign wire12 = {{wire10[(1'h1):(1'h1)], wire5[(2'h3):(2'h3)]},
                      $signed(($unsigned((wire8 ? wire8 : (8'ha9))) ?
                          (~wire1[(2'h3):(1'h1)]) : (reg11[(2'h2):(2'h2)] <<< $signed(wire1))))};
  module13 #() modinst123 (wire122, clk, wire9, wire5, reg11, wire6);
  assign wire124 = $signed({$signed(wire6),
                       ($signed({(7'h43), wire4}) ?
                           ((wire5 < wire6) * $unsigned(wire5)) : wire122)});
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg125 <= ($signed(wire3) ?
              $unsigned($unsigned((((7'h41) > wire7) + (wire124 ?
                  wire5 : wire3)))) : wire5[(4'hb):(4'h8)]);
          reg126 <= ($signed((wire2 - wire2)) ?
              {(^$unsigned($signed(wire9)))} : $signed(($signed((wire12 < (7'h42))) ?
                  $signed((wire122 ? wire1 : reg11)) : wire124)));
          if (wire1[(2'h3):(2'h3)])
            begin
              reg127 <= (^((~&(((8'hbe) ? wire124 : (8'ha5)) ?
                      $signed(wire124) : wire12)) ?
                  $signed(((reg11 ? reg11 : wire0) >= ((8'ha9) ?
                      (8'hbd) : wire12))) : ((wire9 ?
                      {(8'hb6)} : wire124) >>> ((|reg126) <<< (wire1 & wire4)))));
              reg128 <= wire4;
              reg129 <= reg125[(3'h7):(2'h3)];
              reg130 <= ($signed(((!(|reg126)) ~^ $signed({wire3}))) & (~&reg125[(4'h8):(3'h7)]));
            end
          else
            begin
              reg127 <= ($unsigned((~^((|reg126) ? wire3 : (8'hbe)))) ?
                  (&wire2[(3'h5):(3'h5)]) : {$unsigned($unsigned((~wire9)))});
              reg128 <= wire6[(3'h5):(2'h2)];
            end
        end
      else
        begin
          reg125 <= (wire8 ? (8'hb7) : $unsigned($signed((^{wire10}))));
        end
      reg131 <= $unsigned((|($signed(wire3) ?
          (wire9 ?
              (-wire124) : (wire5 || wire9)) : ($signed((8'ha3)) <= reg11))));
    end
  assign wire132 = (&(reg128 - $signed(wire9)));
  assign wire133 = reg127;
  assign wire134 = ((~|reg127[(3'h7):(1'h0)]) ?
                       (!{(!(8'ha7)),
                           (((8'h9d) <<< reg126) & (^wire1))}) : $signed((((wire10 ?
                                   wire6 : (7'h43)) ?
                               (reg128 ? reg125 : reg11) : (wire133 == wire9)) ?
                           (wire1 ? (wire8 >> wire133) : reg128) : {(wire4 ?
                                   (8'hb1) : wire12)})));
  assign wire135 = $signed($signed(((~&(wire0 == reg125)) ?
                       $unsigned($signed((7'h43))) : (wire10[(3'h5):(2'h3)] == {(7'h42),
                           wire0}))));
  assign wire136 = (~|(~&((wire0[(2'h3):(2'h2)] ?
                           (wire2 ? reg127 : wire0) : $signed(reg131)) ?
                       ((wire132 ^~ wire1) ?
                           $signed(wire10) : (-(8'ha7))) : wire0)));
  assign wire137 = $signed(({((wire10 + wire6) ?
                           (~wire135) : $signed(reg125))} & (reg11[(4'he):(4'h8)] <= wire9)));
  assign wire138 = $unsigned(($unsigned({(wire8 ?
                           wire3 : wire137)}) <= $unsigned($unsigned(reg125[(3'h7):(1'h0)]))));
  assign wire139 = (wire0 ?
                       ((!($signed(wire5) << $signed(wire1))) ?
                           $unsigned(($unsigned(wire124) >> (wire6 <<< wire7))) : wire12) : (wire9[(4'hb):(1'h0)] > $unsigned((!(reg11 ?
                           wire0 : wire3)))));
  module140 #() modinst165 (wire164, clk, wire6, wire137, wire138, wire132);
  assign wire166 = (~^wire9[(4'he):(4'hb)]);
endmodule

module module140  (y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire144;
  input wire [(5'h11):(1'h0)] wire143;
  input wire signed [(5'h14):(1'h0)] wire142;
  input wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire163;
  wire signed [(5'h15):(1'h0)] wire162;
  wire signed [(5'h10):(1'h0)] wire161;
  wire [(3'h6):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(4'he):(1'h0)] wire148;
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned({{$signed(wire144)},
          wire143}) ^ (wire142[(4'h8):(1'h0)] >>> (wire143 >> (^$unsigned(wire144))))))
        begin
          reg145 <= (8'hbf);
          reg146 <= {wire144, wire143[(4'h9):(3'h7)]};
        end
      else
        begin
          reg145 <= wire141;
          reg146 <= $unsigned({((wire144[(2'h2):(2'h2)] ?
                  (wire143 >>> (8'h9d)) : (reg146 ?
                      wire143 : wire143)) | (&$signed(wire144)))});
          reg147 <= wire144[(2'h2):(2'h2)];
        end
    end
  assign wire148 = (~&((((|wire142) >= $signed(wire143)) ?
                           {(+wire142), {reg145}} : (+{(8'hbf)})) ?
                       wire142[(3'h5):(1'h1)] : {wire142, reg147}));
  assign wire149 = wire148;
  assign wire150 = reg147[(4'hd):(4'h8)];
  assign wire151 = $signed((reg146[(1'h1):(1'h1)] ?
                       ($unsigned(wire144[(2'h2):(1'h0)]) ?
                           $signed(reg146) : $signed((!wire149))) : $unsigned({(wire143 ?
                               (8'hac) : reg145)})));
  assign wire152 = (^(8'ha9));
  assign wire153 = (wire150 ?
                       ($signed($signed((reg145 ? (8'hae) : (8'haf)))) ?
                           $signed(wire144) : (((wire151 ? (8'hac) : (8'hbc)) ?
                               {wire141} : $signed(wire144)) && $signed($unsigned(wire152)))) : (~|(wire149[(4'h9):(2'h2)] == reg146)));
  assign wire154 = $unsigned($unsigned((~(+$unsigned(wire148)))));
  assign wire155 = $unsigned((~&wire142));
  always
    @(posedge clk) begin
      reg156 <= ($signed((~(wire148[(1'h1):(1'h1)] == wire141))) ?
          (^$signed($unsigned(((8'hb7) <<< wire144)))) : (+(8'hb2)));
      reg157 <= ($unsigned((~&(8'hb2))) * $signed(wire141));
      reg158 <= (wire144 | ($unsigned(wire153[(2'h3):(1'h0)]) ?
          {wire151[(2'h2):(1'h0)],
              $signed($unsigned(wire154))} : (($signed((8'hb6)) ?
              $signed(wire142) : reg157) - ((wire152 >> wire141) > (!wire152)))));
      reg159 <= $unsigned(wire151);
    end
  assign wire160 = $signed(wire153[(2'h2):(1'h0)]);
  assign wire161 = $unsigned(reg159[(2'h2):(2'h2)]);
  assign wire162 = {({($signed(wire154) ?
                                   $unsigned(reg156) : (reg145 ?
                                       wire160 : wire142)),
                               ({wire143} ? (~|wire148) : (^reg145))} ?
                           wire144[(2'h2):(1'h0)] : (~^$signed(reg146))),
                       wire153};
  assign wire163 = ($unsigned(((8'hbc) ?
                           ($signed(reg159) ?
                               wire144 : $signed(reg159)) : $signed(((8'hb1) ?
                               wire144 : reg147)))) ?
                       wire155[(5'h10):(2'h2)] : (~^$signed((|wire161[(4'ha):(3'h6)]))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h249):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire105;
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire107,
                 wire62,
                 wire28,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire64,
                 wire65,
                 wire66,
                 wire72,
                 wire73,
                 wire105,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire18 = (8'hba);
  assign wire19 = wire16;
  assign wire20 = ((&wire14[(3'h5):(3'h5)]) << (($unsigned($signed(wire14)) ?
                      ((wire15 >> wire15) ?
                          $unsigned(wire17) : (~(8'hba))) : wire16) && (((wire14 ?
                          wire15 : wire16) ?
                      (wire15 - wire17) : wire19[(1'h0):(1'h0)]) <= ((~wire18) < $signed((8'hac))))));
  assign wire21 = ($signed($unsigned((~(wire17 ?
                      wire17 : wire15)))) && ($signed((|$unsigned((7'h40)))) <= wire14));
  assign wire22 = wire16[(4'hd):(4'hc)];
  always
    @(posedge clk) begin
      reg23 <= wire17[(2'h2):(1'h1)];
      reg24 <= ((8'ha1) * wire18[(3'h4):(2'h3)]);
      reg25 <= wire20;
      if ({((-wire18) || (+((wire17 + reg25) <<< (wire22 << reg23))))})
        begin
          reg26 <= (8'hb9);
        end
      else
        begin
          reg26 <= wire16[(5'h12):(5'h12)];
          reg27 <= wire16;
        end
    end
  assign wire28 = $signed($signed($signed((^~(wire21 ~^ (8'ha9))))));
  module29 #() modinst63 (.wire32(wire17), .wire30(wire15), .clk(clk), .wire31(wire28), .wire33(reg26), .y(wire62));
  assign wire64 = {(&((reg27[(4'hc):(3'h6)] ?
                              (wire17 ?
                                  wire16 : (7'h41)) : wire16[(4'hb):(4'ha)]) ?
                          (wire15[(4'hc):(3'h4)] ?
                              (wire16 >> wire14) : {wire15,
                                  (8'ha9)}) : ((~^reg27) > reg26[(4'he):(4'ha)]))),
                      $unsigned((($unsigned(wire16) ~^ (wire62 ?
                          wire62 : (8'hb7))) < wire14[(4'hb):(4'ha)]))};
  assign wire65 = (!(7'h42));
  assign wire66 = {((((^~wire16) ?
                              (wire17 ? wire28 : wire22) : {reg23,
                                  (8'haa)}) < (~|(8'hb0))) ?
                          (!{$unsigned(wire62),
                              (~(8'ha5))}) : wire17[(5'h10):(4'hb)]),
                      reg24[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg67 <= wire20;
      reg68 <= wire64[(1'h0):(1'h0)];
      reg69 <= $unsigned($unsigned($unsigned({wire17, $signed(wire65)})));
      reg70 <= wire66[(2'h2):(2'h2)];
      reg71 <= reg68[(4'h9):(3'h5)];
    end
  assign wire72 = $unsigned($signed($unsigned(((^(8'hac)) ?
                      (wire65 ~^ wire28) : (wire20 == reg71)))));
  assign wire73 = $unsigned(((7'h44) ?
                      $signed(wire21) : (~|$signed($unsigned(wire16)))));
  always
    @(posedge clk) begin
      if ($signed((reg27[(3'h5):(3'h4)] ^~ reg23[(3'h6):(3'h5)])))
        begin
          reg74 <= $unsigned(((8'ha6) ^ (+((wire21 && (8'haf)) ^~ {(8'ha8),
              reg24}))));
          if ($unsigned({(-(|reg69))}))
            begin
              reg75 <= reg68;
              reg76 <= (($unsigned($signed((wire21 ? reg24 : wire73))) ?
                      wire14[(4'h8):(2'h3)] : (reg70[(3'h7):(3'h4)] & $unsigned((-reg70)))) ?
                  {$unsigned((8'hb3)),
                      ((wire18[(3'h7):(3'h7)] ?
                          (^reg24) : ((8'hb1) || reg27)) > reg70)} : $unsigned(((wire66[(3'h4):(1'h1)] && $signed((8'ha2))) ^~ ($unsigned((7'h40)) ?
                      ((8'hba) == wire16) : wire65[(3'h6):(1'h1)]))));
            end
          else
            begin
              reg75 <= reg23[(4'hc):(4'ha)];
            end
          reg77 <= ((!{$unsigned((reg71 ? wire14 : wire16))}) ?
              {(reg23 == reg67), $unsigned(reg26)} : reg70);
          reg78 <= reg23[(1'h0):(1'h0)];
          reg79 <= ((~^$unsigned((+wire22[(1'h1):(1'h1)]))) < reg68);
        end
      else
        begin
          if (reg24)
            begin
              reg74 <= reg27;
            end
          else
            begin
              reg74 <= reg67;
            end
        end
      reg80 <= {(reg70[(5'h12):(4'hc)] | reg79)};
      reg81 <= ((((reg26 && (wire20 >>> wire28)) ?
          $unsigned((reg24 ^ reg24)) : $unsigned((+wire16))) & (^$unsigned(reg67[(3'h7):(1'h1)]))) >> (wire18[(4'hb):(2'h3)] == reg67));
      reg82 <= {(($unsigned((reg23 ?
                  reg80 : reg70)) ^ $unsigned($unsigned(wire14))) ?
              ({(~|wire16)} ?
                  $unsigned(((8'ha6) ?
                      reg23 : reg67)) : (8'h9e)) : (|($signed(reg70) ?
                  wire16 : ((8'haf) ? reg79 : reg76))))};
    end
  module83 #() modinst106 (wire105, clk, reg78, wire16, reg75, reg71);
  assign wire107 = $signed({$signed(((wire20 < (8'hb8)) ?
                           (^~reg24) : (^~reg77))),
                       reg74});
  always
    @(posedge clk) begin
      if ((wire64 ?
          ((((~&reg23) >= (wire66 && wire28)) ?
                  (~|wire28) : (|(reg25 <= wire17))) ?
              {wire16} : (wire64[(3'h6):(3'h4)] ?
                  ($signed(reg78) + $signed(reg68)) : wire73[(3'h6):(3'h6)])) : {$signed((wire17 ?
                  (!reg81) : (reg70 & wire105))),
              {(8'hac), $unsigned(reg79)}}))
        begin
          if (reg78[(1'h1):(1'h1)])
            begin
              reg108 <= (8'hba);
            end
          else
            begin
              reg108 <= {((reg68[(4'hd):(4'hc)] ?
                          ((&reg74) <= (reg108 == wire17)) : (+$signed(wire105))) ?
                      wire28[(3'h5):(2'h2)] : wire105[(5'h13):(2'h2)])};
              reg109 <= $unsigned($signed(($signed((wire73 ? wire66 : wire28)) ?
                  ($signed(wire18) >>> (^reg80)) : $unsigned((7'h42)))));
              reg110 <= (($unsigned(((-(8'hbe)) >>> (reg77 & wire66))) ?
                  wire66 : reg70) <<< wire15);
            end
          reg111 <= $unsigned({$signed((|(~wire72)))});
          reg112 <= reg77;
          if (wire19)
            begin
              reg113 <= (wire15 ?
                  $signed(($signed($unsigned((8'ha2))) ?
                      wire14[(3'h7):(2'h3)] : ((-reg108) <<< (|wire73)))) : (reg68[(4'hf):(4'hd)] && (wire17 ?
                      wire105 : $signed((!reg109)))));
            end
          else
            begin
              reg113 <= ((~$unsigned(wire16[(2'h2):(2'h2)])) | $unsigned(((^$signed(reg68)) >>> (reg68 ?
                  (7'h41) : (wire73 * wire105)))));
              reg114 <= reg108[(1'h1):(1'h1)];
              reg115 <= wire21;
              reg116 <= ($signed($signed(wire22[(4'hb):(4'h9)])) != ({(8'ha0),
                      {(~reg26)}} ?
                  {reg76} : (((reg77 ? reg111 : wire15) > reg74) ?
                      ($signed(wire17) ?
                          $unsigned(reg68) : $signed(reg75)) : (8'hac))));
            end
          reg117 <= ($unsigned($signed(wire16)) == (wire16[(4'hd):(3'h6)] < wire28));
        end
      else
        begin
          if (((+$unsigned($signed($signed(wire64)))) ?
              reg77[(4'hf):(3'h7)] : (~|$unsigned((8'ha1)))))
            begin
              reg108 <= $signed($signed(wire14));
              reg109 <= {$signed({((wire62 | wire16) ?
                          $unsigned(reg70) : $unsigned(wire73))}),
                  reg113};
              reg110 <= $unsigned((~&{((wire105 ?
                      wire62 : reg109) == (wire20 && wire14))}));
              reg111 <= ($signed(reg111) ?
                  $unsigned({wire16}) : {reg116[(3'h7):(1'h0)]});
            end
          else
            begin
              reg108 <= $signed($signed($unsigned(wire16[(5'h12):(4'h8)])));
              reg109 <= $signed($signed((~$unsigned(wire17[(1'h1):(1'h1)]))));
              reg110 <= (8'h9f);
              reg111 <= ((({$signed(wire19),
                      $unsigned(reg71)} | $unsigned($unsigned((8'hb3)))) ?
                  (wire73 && reg25) : (^(reg117 >>> reg24))) == $unsigned(reg76[(1'h0):(1'h0)]));
              reg112 <= $signed(wire21[(4'h9):(3'h5)]);
            end
          if ($unsigned($signed($signed($signed(wire16)))))
            begin
              reg113 <= (^$unsigned(reg116[(3'h4):(2'h3)]));
            end
          else
            begin
              reg113 <= reg27;
              reg114 <= (~&(((8'ha1) ~^ (8'ha8)) ?
                  (~($signed((8'ha3)) > (!wire66))) : ($signed(reg114) ?
                      $signed($unsigned(reg69)) : $signed($unsigned(wire65)))));
              reg115 <= reg70[(2'h2):(1'h0)];
              reg116 <= wire16[(1'h0):(1'h0)];
            end
          reg117 <= ($unsigned((($signed(reg74) && ((8'ha2) + reg108)) ?
                  wire15 : $signed(wire17))) ?
              (reg26[(1'h0):(1'h0)] ?
                  $signed(((^~reg75) ?
                      (reg74 && wire20) : reg68[(3'h5):(1'h0)])) : wire62) : wire22[(2'h2):(1'h0)]);
        end
      reg118 <= (!($unsigned({((8'ha3) >>> (8'ha9))}) >= (reg113 && $signed($signed(reg115)))));
    end
  assign wire119 = (!wire28);
  assign wire120 = (^~reg80[(1'h0):(1'h0)]);
  assign wire121 = wire21[(4'hf):(3'h4)];
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire87;
  input wire signed [(4'he):(1'h0)] wire86;
  input wire signed [(2'h2):(1'h0)] wire85;
  input wire [(5'h13):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire88;
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg89,
                 (1'h0)};
  assign wire88 = (wire85[(1'h0):(1'h0)] ?
                      $signed(wire84[(4'h9):(1'h1)]) : $unsigned(((wire86[(3'h4):(1'h1)] >= ((8'hb0) * wire86)) == ((wire86 ?
                              wire87 : (8'hb9)) ?
                          (wire86 ? (8'ha9) : wire85) : $signed(wire87)))));
  always
    @(posedge clk) begin
      reg89 <= (wire86 - $unsigned((wire84[(4'he):(1'h1)] ?
          {{wire86, wire88}, $signed(wire86)} : wire86)));
    end
  assign wire90 = $signed((wire87[(4'hf):(4'hc)] ?
                      wire88[(1'h0):(1'h0)] : ($signed((wire87 + wire84)) << ((^~reg89) ?
                          $signed(wire85) : (&reg89)))));
  assign wire91 = (($signed(wire85) > $signed(reg89[(2'h3):(1'h1)])) >= ($unsigned(wire84) ?
                      $unsigned($unsigned(reg89)) : wire88));
  assign wire92 = $unsigned(wire91[(3'h6):(1'h0)]);
  assign wire93 = (^~($unsigned((~&(wire87 ? wire84 : wire90))) ?
                      reg89 : wire92[(4'hf):(1'h0)]));
  assign wire94 = (($signed($unsigned(wire86[(3'h6):(1'h0)])) > wire91[(1'h0):(1'h0)]) ?
                      (wire84[(3'h7):(3'h4)] ^ wire90[(3'h4):(2'h2)]) : ((8'hb4) ~^ $signed((wire87 ?
                          wire88 : wire86[(4'h9):(3'h6)]))));
  assign wire95 = {wire85};
  always
    @(posedge clk) begin
      reg96 <= $unsigned(((($unsigned(wire86) ~^ wire85[(2'h2):(1'h0)]) < wire94) ^ $signed(($signed(wire95) ?
          wire95[(3'h6):(2'h3)] : (+reg89)))));
      if (((wire92 || (((wire93 ? wire95 : wire95) >> (wire85 & wire88)) ?
          $unsigned((+wire87)) : {wire86,
              (wire87 ?
                  wire92 : wire87)})) == ($signed(($unsigned(wire90) ^ (wire95 ?
          (8'ha9) : wire84))) & (~&($signed((8'hba)) * $unsigned(wire84))))))
        begin
          reg97 <= $unsigned((wire95[(5'h10):(4'hc)] << $signed(($signed(wire86) || (|wire93)))));
          reg98 <= ($signed($signed(wire93[(1'h0):(1'h0)])) ?
              wire84 : $signed({$unsigned((wire88 ? wire86 : wire86))}));
          reg99 <= $unsigned((&wire85[(1'h1):(1'h0)]));
        end
      else
        begin
          reg97 <= (&{(((8'h9c) ~^ $signed(wire87)) << $unsigned((wire88 ?
                  reg96 : reg96))),
              ((wire94[(4'hc):(4'h8)] <= (!reg99)) ?
                  ($unsigned(wire95) ^ (+reg89)) : (+{(8'hb7), wire94}))});
          if (((~^reg97[(1'h1):(1'h0)]) >= $unsigned(wire93[(1'h0):(1'h0)])))
            begin
              reg98 <= (((((8'hb9) || (wire87 << wire86)) ? wire90 : wire85) ?
                      (^~wire90[(1'h1):(1'h0)]) : ({(wire84 ^~ reg96)} ?
                          ($unsigned(reg96) ?
                              ((7'h41) <= wire84) : wire84[(5'h12):(2'h3)]) : wire86)) ?
                  wire92 : wire92);
              reg99 <= wire93[(2'h2):(2'h2)];
            end
          else
            begin
              reg98 <= $signed($signed(wire85));
              reg99 <= ((8'haa) ^ $unsigned({((~wire95) << (wire95 ?
                      reg89 : wire86)),
                  $unsigned(wire87)}));
            end
        end
      reg100 <= wire95[(4'h9):(4'h8)];
    end
  assign wire101 = reg100[(4'h9):(2'h3)];
  assign wire102 = $unsigned(wire86[(4'h9):(3'h7)]);
  assign wire103 = {($signed((wire93[(1'h0):(1'h0)] ?
                               $unsigned(wire91) : (wire92 && wire93))) ?
                           $unsigned($unsigned($unsigned(wire85))) : (^~wire94[(4'h8):(3'h5)])),
                       (wire102[(5'h12):(3'h4)] * ((wire91 > $unsigned(reg98)) ?
                           reg97[(3'h5):(2'h2)] : reg98[(3'h7):(2'h3)]))};
  assign wire104 = $signed({((~&(!wire86)) <= (+(^wire92)))});
endmodule

module module29
#(parameter param60 = {(({((8'had) >>> (8'hbc))} >= (&(~(8'hbd)))) ? {{((8'hb8) ? (8'hb2) : (8'hbd)), (8'hba)}, (((8'hb9) ? (8'hae) : (8'hb7)) ? ((8'ha7) ? (8'ha4) : (8'ha9)) : ((8'hba) ? (8'haa) : (8'ha8)))} : (~{{(8'hbd), (8'ha0)}, (~|(8'haf))}))}, 
parameter param61 = (+((({param60} <= (param60 ? (8'ha8) : param60)) ? (&(param60 ? param60 : param60)) : (~^(param60 ? param60 : param60))) <<< (param60 ? (&param60) : param60))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire32;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire59,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire34 = ({$unsigned(((~&wire32) ?
                              wire31[(3'h7):(1'h0)] : {wire32, wire32}))} ?
                      ($unsigned({$unsigned(wire30),
                          $unsigned(wire31)}) * (wire31[(1'h1):(1'h0)] <= ((wire32 ?
                          wire31 : wire32) >= (-wire33)))) : wire32[(3'h4):(2'h3)]);
  assign wire35 = (~$signed((wire32 ?
                      wire34[(3'h7):(1'h0)] : wire33[(1'h0):(1'h0)])));
  assign wire36 = (&($signed(wire34[(3'h7):(3'h7)]) >> wire35));
  assign wire37 = ((-wire36) > (|$signed((wire35 ?
                      (wire30 ? wire30 : wire34) : ((8'h9c) + wire34)))));
  assign wire38 = $signed($signed($unsigned(wire34[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire30)
        begin
          reg39 <= (|(^($signed(((8'hb9) ?
              wire35 : wire38)) ~^ (-$unsigned(wire31)))));
          reg40 <= (8'hae);
          if ($signed($signed(wire37[(1'h0):(1'h0)])))
            begin
              reg41 <= (wire34 | $unsigned($signed($signed((wire38 ?
                  wire37 : wire35)))));
            end
          else
            begin
              reg41 <= wire30;
              reg42 <= wire34[(3'h5):(1'h1)];
              reg43 <= (($unsigned((~&(wire31 ?
                  wire32 : wire33))) ~^ {($signed((8'ha2)) * wire36[(4'h8):(3'h7)])}) ^~ ($unsigned(((reg39 < wire36) || (wire36 ?
                  reg41 : reg41))) ~^ reg41[(1'h0):(1'h0)]));
              reg44 <= (~&$signed({wire31[(4'ha):(3'h6)]}));
            end
          reg45 <= (~^reg42);
        end
      else
        begin
          reg39 <= $unsigned($signed($signed(wire34[(2'h2):(1'h1)])));
        end
      reg46 <= $signed(($unsigned($signed((wire30 >> reg40))) ?
          wire30[(1'h0):(1'h0)] : ($signed(reg43) == $unsigned((^reg41)))));
      if (wire31[(4'hb):(2'h3)])
        begin
          reg47 <= reg41[(3'h5):(2'h3)];
          reg48 <= $unsigned($unsigned(reg47));
          reg49 <= reg43;
          reg50 <= (7'h41);
          reg51 <= $signed($unsigned(reg49));
        end
      else
        begin
          reg47 <= wire38;
          reg48 <= ($signed(wire35) & {((~(reg51 ?
                  wire34 : reg51)) >>> $unsigned((~|(8'hb8)))),
              reg40[(4'he):(4'ha)]});
          reg49 <= (wire33 ~^ reg45[(2'h2):(2'h2)]);
          if ($unsigned($signed((7'h43))))
            begin
              reg50 <= wire33[(2'h2):(2'h2)];
              reg51 <= reg50;
            end
          else
            begin
              reg50 <= $unsigned(($signed(($signed((8'hae)) ?
                  reg46[(2'h2):(1'h1)] : (reg45 && wire34))) ^~ (reg49 ?
                  $signed((reg41 ?
                      (8'haf) : reg44)) : $unsigned((reg47 < wire35)))));
            end
        end
      reg52 <= ($unsigned((((~^wire34) < $signed(reg39)) ^ reg39)) - $unsigned($unsigned({((7'h44) << wire32)})));
      reg53 <= (7'h42);
    end
  always
    @(posedge clk) begin
      reg54 <= $signed(wire37);
      reg55 <= reg45;
      reg56 <= (({((|reg53) ? $signed(wire34) : reg51),
              ((reg48 <= reg39) | reg50)} == (~|$signed($signed((8'hb7))))) ?
          {$unsigned($signed(wire34[(3'h4):(2'h2)])),
              ($unsigned(((8'ha2) == reg48)) ?
                  (~reg45) : $unsigned(((8'hbf) * (8'hb6))))} : reg45);
      reg57 <= $signed($signed((((reg55 > wire37) - (reg46 && reg40)) <= ((~|reg53) ?
          $signed(wire34) : $signed(reg50)))));
      reg58 <= ($unsigned($signed({$unsigned(wire30)})) ?
          {reg57[(2'h2):(1'h0)]} : wire34[(1'h1):(1'h1)]);
    end
  assign wire59 = ((($signed($unsigned((8'ha7))) ^~ (^~((7'h43) && reg46))) ^~ (!$signed(reg39[(3'h7):(3'h7)]))) < {(((8'hbf) ?
                          {reg51,
                              reg46} : (!reg47)) * wire38[(5'h13):(4'hc)])});
endmodule
