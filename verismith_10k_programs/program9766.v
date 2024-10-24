module top
#(parameter param134 = {(((~(+(8'ha4))) ? ((8'hba) ? (~(8'hbf)) : ((7'h44) != (7'h40))) : (((7'h42) ? (8'hbd) : (8'hae)) == ((8'hb3) ? (8'h9c) : (8'ha7)))) | (^~(((8'ha2) + (8'h9c)) ? {(8'haf)} : (^(8'h9c))))), ((({(8'hbb), (8'ha3)} ? ((8'hb1) ? (8'hb2) : (8'hb5)) : {(8'hb2)}) <<< {(8'hbe)}) ? (-((^~(7'h42)) ? {(8'hb6)} : (~|(8'hb2)))) : (!((!(8'ha9)) ? ((8'h9d) ^ (7'h44)) : ((8'hb4) <<< (8'hbd)))))}, 
parameter param135 = param134)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire132;
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire132,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = $unsigned(((((wire1 ? wire2 : wire2) != (wire3 ?
                     (7'h42) : (8'hb1))) || wire2[(1'h1):(1'h1)]) * {(~&(&wire1))}));
  assign wire5 = wire0;
  assign wire6 = (-({(8'haf)} ?
                     $unsigned((wire3 ?
                         $signed(wire4) : {wire3})) : ({((8'ha5) > wire1)} - wire1)));
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg7 <= (8'ha3);
          reg8 <= wire2[(3'h4):(2'h3)];
          reg9 <= $unsigned(wire5[(2'h3):(2'h2)]);
          reg10 <= $unsigned($signed(wire0));
        end
      else
        begin
          reg7 <= reg9[(3'h4):(3'h4)];
          if ((wire2 > wire3[(2'h3):(1'h0)]))
            begin
              reg8 <= (8'hba);
              reg9 <= {(~$signed($unsigned($signed(wire3)))), (8'hab)};
              reg10 <= ((&(^{{(7'h44)},
                  (reg9 ? reg7 : wire2)})) | $signed((8'ha7)));
              reg11 <= $signed((-$signed($unsigned({reg10, reg8}))));
            end
          else
            begin
              reg8 <= wire5[(2'h3):(2'h2)];
              reg9 <= wire4;
            end
          reg12 <= $unsigned((wire5[(3'h4):(2'h2)] ?
              reg8[(3'h4):(1'h0)] : $signed(($unsigned(reg10) < $unsigned(reg9)))));
        end
    end
  assign wire13 = (wire1 <<< (reg7 + $signed($signed((wire4 | wire1)))));
  assign wire14 = ({$signed($unsigned(wire4)),
                      wire3[(1'h0):(1'h0)]} >> (&(^~$unsigned($signed(reg10)))));
  assign wire15 = $unsigned((^~(((+(8'ha1)) ?
                      $signed(reg9) : {wire4, (7'h43)}) * $signed({reg11,
                      wire14}))));
  assign wire16 = (((8'ha5) >> wire14[(5'h12):(4'he)]) < $signed({reg8[(2'h3):(2'h2)]}));
  assign wire17 = ((&$signed(reg7)) ?
                      ((+((reg10 ? wire3 : wire16) >> {wire14, wire6})) ?
                          (^$unsigned($signed(reg9))) : (wire3 + (!wire16[(4'h8):(3'h5)]))) : wire16[(3'h7):(1'h0)]);
  module18 #() modinst133 (.wire22(reg7), .wire20(wire4), .wire19(wire5), .wire21(wire3), .y(wire132), .clk(clk));
endmodule

module module18
#(parameter param130 = ((((|((8'h9f) ? (8'ha2) : (8'hb5))) - (((8'ha5) ? (8'hb2) : (8'haa)) ? (~|(8'hac)) : {(8'hbf)})) ? (((~&(8'hba)) == ((8'ha6) ? (8'hb2) : (8'hbf))) ? (8'haf) : ((~^(8'hbe)) <= {(8'haf)})) : ((|{(8'hac)}) ? (-(~&(8'hbe))) : (~{(8'ha9)}))) < (((((8'ha0) ? (8'hb7) : (8'hbe)) || {(8'hac), (8'hb2)}) ? {(|(7'h42)), {(8'h9d), (8'h9e)}} : (((8'h9e) <= (8'hba)) & ((8'hb0) ? (8'hb0) : (8'haf)))) | (({(8'hba)} ? ((8'h9d) ? (8'hb2) : (8'hbb)) : ((8'ha7) <<< (8'hb2))) ? {((8'hb4) >= (8'h9e))} : (((8'hb6) == (8'hb6)) ^~ (|(8'hb7)))))), 
parameter param131 = param130)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h1cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire23;
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  assign y = {wire113,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire63,
                 wire23,
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
                 (1'h0)};
  assign wire23 = wire21;
  module24 #() modinst64 (wire63, clk, wire23, wire21, wire20, wire19);
  module65 #() modinst93 (.wire68(wire19), .wire67(wire20), .wire69(wire23), .y(wire92), .wire66(wire63), .clk(clk));
  assign wire94 = $unsigned(($unsigned(wire23[(4'ha):(4'h9)]) ?
                      ((wire92[(2'h2):(2'h2)] ?
                          $unsigned(wire92) : {(8'h9c), wire63}) && {(wire23 ?
                              wire63 : wire22),
                          wire19}) : $unsigned($unsigned($signed(wire22)))));
  assign wire95 = ((($signed((wire21 ? wire23 : wire92)) ?
                              $unsigned({wire94}) : (~|wire20)) ?
                          (+wire23[(3'h6):(2'h2)]) : $signed(wire92)) ?
                      ((wire21 << $unsigned(wire92[(4'hb):(4'ha)])) ?
                          ($unsigned($unsigned(wire22)) ?
                              {{wire20,
                                      wire20}} : wire22[(3'h4):(1'h0)]) : {((&(8'h9c)) != (!wire23))}) : (^$signed(({wire19,
                          wire92} >> {wire63, wire94}))));
  assign wire96 = $unsigned((!wire20[(2'h3):(2'h2)]));
  assign wire97 = wire22;
  assign wire98 = wire97;
  assign wire99 = wire96;
  assign wire100 = wire95;
  always
    @(posedge clk) begin
      reg101 <= wire20;
      if ((~|(7'h41)))
        begin
          if (wire97)
            begin
              reg102 <= (reg101[(3'h7):(2'h3)] ?
                  reg101[(2'h3):(1'h1)] : (((wire96 >>> (!wire22)) ?
                          wire100[(4'hb):(1'h1)] : $signed((~|wire22))) ?
                      (wire99 - ((wire20 || (8'ha7)) ?
                          $signed(wire97) : wire99[(1'h0):(1'h0)])) : wire97));
              reg103 <= (wire19 ?
                  $unsigned(wire95[(3'h4):(2'h3)]) : (wire22 ?
                      $signed(wire21) : ($signed((~^wire95)) ~^ wire95[(1'h0):(1'h0)])));
              reg104 <= $unsigned({((wire63 ?
                      $unsigned(wire23) : (reg102 ?
                          reg102 : reg103)) != (wire99 ?
                      (&wire94) : {wire23, wire100})),
                  (|{wire19[(3'h4):(1'h0)], wire96})});
              reg105 <= (wire19 > wire23);
            end
          else
            begin
              reg102 <= wire100[(2'h2):(2'h2)];
              reg103 <= reg102[(3'h6):(1'h0)];
              reg104 <= (wire96[(4'h8):(3'h5)] ^ {$unsigned($signed(wire95)),
                  wire19[(4'hd):(2'h2)]});
            end
          if ($unsigned($unsigned($signed(($signed(wire20) ^~ wire22[(2'h3):(1'h0)])))))
            begin
              reg106 <= $unsigned(($unsigned((^(wire97 ? wire63 : wire99))) ?
                  (-((reg105 - (8'ha2)) + {reg105,
                      reg104})) : ((wire63 <= $signed(wire21)) ?
                      (wire100[(1'h1):(1'h0)] <= (wire99 < wire95)) : (~|wire92))));
              reg107 <= (((((~&(8'haa)) ?
                      wire20[(4'hf):(4'hc)] : (wire23 - wire21)) >> $signed(reg105)) == (^(~reg101))) ?
                  $signed((+$unsigned((~reg105)))) : wire92);
              reg108 <= (!wire100[(1'h1):(1'h1)]);
            end
          else
            begin
              reg106 <= ({(~$signed($signed(wire95)))} ^ $signed((-((&wire97) <= $signed(reg107)))));
              reg107 <= $unsigned($unsigned($signed((!(|wire95)))));
              reg108 <= {$signed((($signed((8'hbd)) ?
                      (reg103 - wire95) : (-(7'h40))) <= (&(~&wire20))))};
              reg109 <= (&wire22);
            end
        end
      else
        begin
          if (wire99[(4'hc):(3'h4)])
            begin
              reg102 <= (((reg104 ?
                      wire100 : (!reg109[(4'he):(4'hc)])) ^~ (($unsigned((8'ha7)) + (reg104 ?
                      wire20 : wire99)) | ($signed((8'hb3)) ?
                      (reg107 == reg104) : $signed(wire96)))) ?
                  wire63[(4'h8):(3'h5)] : (reg103 ?
                      ($unsigned(reg102) ?
                          ((reg107 ? reg103 : wire99) ^~ (wire19 ?
                              wire98 : (8'hb7))) : ($signed(wire96) << $unsigned(reg107))) : (((reg108 ^ reg107) ?
                              {wire21, (8'ha9)} : (^wire23)) ?
                          wire100[(3'h6):(2'h2)] : $signed(reg105))));
              reg103 <= ($unsigned(((~^(wire96 ?
                  wire23 : wire63)) ^~ ((|wire92) >>> (wire99 > reg107)))) ^ (~^reg104[(1'h0):(1'h0)]));
              reg104 <= $unsigned($signed(wire99));
              reg105 <= $unsigned(((reg109 ~^ ((wire95 << reg105) ?
                      (8'hac) : wire22[(1'h0):(1'h0)])) ?
                  (!{(wire19 < wire100)}) : {$signed($unsigned(wire92))}));
              reg106 <= (&wire63);
            end
          else
            begin
              reg102 <= wire98[(2'h3):(2'h2)];
              reg103 <= reg107[(4'h8):(3'h6)];
              reg104 <= wire100[(4'h8):(3'h7)];
              reg105 <= (reg104 == ((({wire97, wire63} | (reg109 - wire97)) ?
                  (wire92 >>> reg106) : $unsigned({wire19})) >>> wire99[(4'hc):(3'h6)]));
            end
          reg107 <= (~|(+(~(~|$unsigned(reg104)))));
          reg108 <= ((^~wire19[(4'h9):(2'h3)]) ?
              ($unsigned((wire22[(3'h5):(2'h3)] >= $unsigned(reg103))) > ((|reg105) ?
                  wire23 : wire21)) : $signed(reg104));
        end
      reg110 <= $signed($unsigned(wire23[(4'hc):(2'h2)]));
      reg111 <= (($unsigned($signed((~(8'ha9)))) ?
              ({(8'haf)} + wire20[(4'h8):(1'h1)]) : (wire98[(1'h1):(1'h1)] ?
                  wire21 : ((8'ha9) << (wire96 ^ wire92)))) ?
          wire94 : (($unsigned((wire22 << wire97)) ?
              (wire92 ?
                  (wire19 | wire100) : (reg105 ?
                      wire96 : reg106)) : wire100) << reg107));
      reg112 <= $signed((~wire19[(4'he):(4'h8)]));
    end
  assign wire113 = reg111;
  always
    @(posedge clk) begin
      if ({(reg109 ?
              (^~$unsigned((reg103 ?
                  reg101 : reg109))) : $unsigned({(^wire99)}))})
        begin
          if ($unsigned((^(^$unsigned((wire99 ? wire100 : wire97))))))
            begin
              reg114 <= (|wire19);
              reg115 <= (($signed(reg108) ^ wire97) << wire92);
            end
          else
            begin
              reg114 <= reg110;
              reg115 <= (~&$unsigned(wire96[(3'h4):(1'h1)]));
            end
          reg116 <= $unsigned(reg110[(3'h4):(1'h0)]);
          reg117 <= ((~|(^~$unsigned((reg107 ~^ wire100)))) ?
              reg111[(4'ha):(2'h3)] : reg102);
          reg118 <= wire92;
        end
      else
        begin
          if (reg101[(1'h0):(1'h0)])
            begin
              reg114 <= wire22[(1'h0):(1'h0)];
            end
          else
            begin
              reg114 <= ($unsigned($signed(((-reg103) >= wire20))) && reg116);
            end
          if ($unsigned($signed($unsigned((wire23[(4'hf):(4'h9)] ?
              $signed(reg118) : {reg103})))))
            begin
              reg115 <= (^~($signed((reg118 ?
                  $signed(wire22) : (reg106 ?
                      reg112 : wire63))) >>> (-reg104[(2'h3):(2'h3)])));
              reg116 <= ((reg117 >>> reg117) ?
                  $unsigned((8'ha2)) : $unsigned(({(wire94 >> wire22)} >> $unsigned(wire96[(4'hc):(3'h4)]))));
              reg117 <= $signed($signed((|wire113)));
            end
          else
            begin
              reg115 <= $unsigned({(|wire97[(1'h1):(1'h0)]), (~wire21)});
            end
          if ({$unsigned(wire23[(5'h13):(5'h11)])})
            begin
              reg118 <= $signed((~&(8'hbe)));
              reg119 <= {{$signed($unsigned((wire92 != reg104))),
                      (reg102 || wire98)},
                  {(($signed(wire98) ?
                          $unsigned(wire100) : $signed(reg114)) < (!{wire95}))}};
            end
          else
            begin
              reg118 <= {wire19[(3'h4):(2'h3)]};
              reg119 <= {$unsigned(reg118[(2'h3):(2'h2)]),
                  $unsigned((($signed(wire22) <<< wire23[(4'hd):(4'h9)]) + wire99))};
              reg120 <= $signed($unsigned($unsigned($signed($unsigned(wire23)))));
              reg121 <= (~|$signed(($unsigned($unsigned(reg117)) ?
                  $signed($signed((8'hb9))) : $signed($signed(reg116)))));
            end
        end
      if ((|wire96[(2'h2):(2'h2)]))
        begin
          reg122 <= reg110;
          if (reg122[(2'h2):(1'h1)])
            begin
              reg123 <= $unsigned($unsigned((((wire100 ? wire92 : reg106) ?
                      $unsigned(reg111) : (wire99 ^ reg115)) ?
                  reg120 : reg103)));
            end
          else
            begin
              reg123 <= (~^(~|$signed(reg105)));
              reg124 <= (reg116[(2'h3):(1'h0)] && reg119[(2'h2):(2'h2)]);
              reg125 <= reg112[(2'h3):(2'h2)];
            end
          reg126 <= ((8'h9e) != (((&$unsigned(reg124)) ?
              (~|reg101) : {$signed(wire22)}) && (((&reg108) ?
              reg125 : (wire23 <= (8'hbf))) & (~{reg123}))));
        end
      else
        begin
          reg122 <= (wire113 ?
              $unsigned(reg110[(2'h3):(1'h0)]) : ($signed(reg116[(2'h3):(1'h1)]) ?
                  (((^~wire19) * wire98) ^~ $signed((reg116 ?
                      reg109 : reg108))) : reg122));
          if (wire95[(4'h9):(4'h9)])
            begin
              reg123 <= {($unsigned((reg107[(3'h6):(1'h1)] ^~ $signed((8'hb7)))) ^ $signed(reg111[(2'h2):(1'h1)]))};
              reg124 <= $signed(reg105[(2'h2):(1'h1)]);
              reg125 <= $unsigned($unsigned(wire99));
              reg126 <= (~^reg122);
            end
          else
            begin
              reg123 <= $unsigned((8'hb6));
              reg124 <= $signed(($signed(reg112[(2'h3):(2'h3)]) ?
                  (wire23 ?
                      reg105 : reg106[(4'he):(4'hb)]) : $signed($unsigned((reg120 > reg101)))));
              reg125 <= {reg124[(1'h0):(1'h0)]};
              reg126 <= ($unsigned(wire63) <= $unsigned((wire22 ?
                  $signed({reg108}) : (-reg108))));
            end
          reg127 <= (~^((8'ha0) > $signed($signed((wire19 ?
              wire63 : reg118)))));
        end
      reg128 <= ($signed($signed(wire23)) + wire94);
      reg129 <= wire98[(2'h2):(2'h2)];
    end
endmodule

module module65
#(parameter param91 = {(^{{((8'ha3) ~^ (8'hb9)), ((8'hb3) * (8'hb3))}}), {(+(|((7'h44) ? (7'h41) : (8'h9c))))}})
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire70 = (~&((~&((!wire68) ?
                          ((8'hbc) ? (8'ha1) : wire67) : $unsigned(wire66))) ?
                      wire67 : (wire67[(3'h5):(2'h3)] ?
                          ((wire68 ? wire67 : wire68) ?
                              (~|(8'hbb)) : (wire68 <<< wire69)) : (8'ha7))));
  assign wire71 = (($unsigned($signed((^wire67))) ?
                          $signed($unsigned((wire68 >>> wire66))) : wire67) ?
                      wire67 : $unsigned($unsigned((8'hbd))));
  assign wire72 = ($unsigned((!wire66)) ?
                      ($unsigned(wire70) >>> wire66) : $unsigned({$unsigned((wire70 ?
                              wire67 : (8'hbf)))}));
  assign wire73 = (+(|wire66[(2'h2):(2'h2)]));
  assign wire74 = wire72[(1'h0):(1'h0)];
  assign wire75 = wire67[(1'h1):(1'h0)];
  assign wire76 = (($signed(wire73[(4'hc):(4'h9)]) <<< wire66[(1'h0):(1'h0)]) ?
                      $unsigned((|wire66[(1'h1):(1'h1)])) : {wire66[(1'h1):(1'h1)],
                          (((wire74 ? wire67 : wire66) <= (^(8'hbb))) ?
                              (8'ha6) : (8'hab))});
  assign wire77 = (8'hbc);
  assign wire78 = wire70;
  assign wire79 = $signed(wire67);
  always
    @(posedge clk) begin
      reg80 <= ((|wire66[(2'h2):(2'h2)]) >>> wire66[(2'h2):(1'h1)]);
      reg81 <= (~$unsigned((+(wire79[(4'hb):(4'h9)] ?
          wire78[(2'h2):(2'h2)] : ((7'h40) | reg80)))));
    end
  assign wire82 = $unsigned($signed(reg80));
  assign wire83 = $signed($signed((($signed(wire76) & (-wire74)) || wire75)));
  always
    @(posedge clk) begin
      if (wire71)
        begin
          reg84 <= (~|$unsigned((-wire66)));
          reg85 <= (-wire71[(3'h5):(3'h4)]);
          reg86 <= $signed(($signed(((8'ha2) ?
                  ((8'hae) > wire69) : ((8'ha6) ? wire70 : (8'ha8)))) ?
              wire79[(4'ha):(3'h5)] : wire72));
        end
      else
        begin
          reg84 <= {((+reg85) ?
                  wire73 : (((!wire78) ?
                      (wire78 ? reg80 : wire72) : $unsigned(wire74)) - wire66)),
              (($signed($unsigned(wire66)) ?
                  ($signed(wire71) ?
                      $unsigned(wire77) : reg81) : ((wire78 <= wire66) ?
                      wire69[(2'h3):(1'h1)] : wire73[(4'ha):(3'h7)])) ^ {$signed($signed(reg81)),
                  ((wire73 >> reg84) ?
                      (wire68 ? wire68 : wire72) : $unsigned(wire74))})};
          reg85 <= $unsigned(((($unsigned(wire76) ?
                  {(8'hbf), wire66} : wire72[(1'h0):(1'h0)]) <<< (8'hbf)) ?
              wire78 : $signed((&wire82))));
          reg86 <= $unsigned($unsigned(wire74));
          reg87 <= $signed(wire68);
          if ($signed(wire78[(3'h5):(3'h5)]))
            begin
              reg88 <= reg85[(2'h2):(1'h0)];
            end
          else
            begin
              reg88 <= $unsigned(($signed((^(reg87 ? wire70 : reg81))) ?
                  ((reg86[(1'h1):(1'h1)] ? wire82 : wire78[(4'hb):(3'h5)]) ?
                      $unsigned({reg85,
                          (8'haa)}) : reg86[(3'h4):(1'h1)]) : (wire71[(4'ha):(2'h3)] ?
                      ((wire83 ?
                          wire69 : reg87) & $unsigned((8'ha6))) : (wire69 ?
                          (!(7'h41)) : (reg81 ? wire77 : reg87)))));
              reg89 <= ($unsigned(reg81) ? reg84 : reg86);
              reg90 <= ($signed(($signed($unsigned((8'hb3))) || $unsigned(reg81[(1'h0):(1'h0)]))) <= (($unsigned($unsigned(reg89)) ?
                  (&(wire66 ?
                      wire71 : wire66)) : reg85[(4'h9):(2'h3)]) & $signed((^~(reg84 ?
                  reg84 : wire77)))));
            end
        end
    end
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg55,
                 reg54,
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
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= $unsigned($signed({(wire27[(1'h1):(1'h1)] ?
              ((8'h9e) > wire28) : (wire26 * (8'hb3))),
          $unsigned((wire25 ? wire25 : wire27))}));
      reg30 <= ($unsigned((8'hb1)) ?
          $unsigned((&wire28)) : $signed((~(wire28 ?
              wire25[(2'h2):(2'h2)] : {wire27, wire25}))));
      reg31 <= (((~|$unsigned((wire26 ? reg30 : (8'ha9)))) - (8'hb7)) ?
          $unsigned(wire26[(4'he):(3'h6)]) : wire28);
    end
  assign wire32 = (wire25[(3'h7):(1'h1)] ?
                      $unsigned(reg29) : {(reg30 >>> ((!reg30) ?
                              (reg30 ? wire27 : (8'ha4)) : $unsigned(wire27))),
                          (~((reg30 ? reg29 : reg29) ?
                              (~&wire27) : (wire28 >> (8'hbb))))});
  assign wire33 = (8'hba);
  assign wire34 = reg29;
  assign wire35 = reg31[(4'ha):(4'h9)];
  assign wire36 = {((reg29 * (7'h42)) <<< wire32[(4'ha):(1'h0)]),
                      wire27[(1'h1):(1'h0)]};
  assign wire37 = ((8'had) != ({wire33} ?
                      wire35 : $signed((wire32[(4'ha):(4'h9)] >> (wire34 ?
                          (8'hbb) : (8'hb3))))));
  assign wire38 = wire36[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      if (wire36)
        begin
          reg39 <= (8'ha5);
          reg40 <= wire27[(1'h1):(1'h1)];
          if ({reg39[(3'h5):(3'h4)]})
            begin
              reg41 <= (+$signed(wire36));
              reg42 <= (wire28[(2'h3):(2'h2)] ?
                  wire36[(1'h0):(1'h0)] : wire37[(2'h3):(1'h0)]);
            end
          else
            begin
              reg41 <= $signed(((!($unsigned(wire35) ?
                  (reg31 ? wire26 : wire25) : reg29)) - $unsigned(reg41)));
            end
          reg43 <= $signed((7'h41));
          reg44 <= {((^wire34) && wire27)};
        end
      else
        begin
          reg39 <= $signed($unsigned($signed(reg42)));
          reg40 <= (!(reg41 >> $signed(wire34[(2'h3):(1'h0)])));
          reg41 <= wire36;
        end
      if (((|(8'h9c)) ?
          ((($unsigned(wire34) ^~ (wire28 >> reg44)) ?
                  ((wire38 + wire38) ?
                      $signed(wire27) : $unsigned(wire33)) : ((^reg44) ?
                      reg44[(2'h2):(1'h1)] : $unsigned(wire36))) ?
              (($signed(wire34) ^~ wire32[(2'h2):(1'h0)]) ^~ $unsigned(wire26[(4'h8):(3'h7)])) : (~|$unsigned(wire37))) : ($unsigned((wire32 ?
                  (^wire34) : wire37)) ?
              $signed(wire27[(1'h1):(1'h1)]) : reg41)))
        begin
          reg45 <= ((reg42 ? wire36[(3'h5):(3'h5)] : (7'h41)) ?
              wire36 : reg30[(1'h0):(1'h0)]);
          reg46 <= (&($signed(reg45) ?
              wire35[(3'h4):(1'h1)] : $unsigned(wire36)));
          reg47 <= $signed((wire28 ?
              (reg29 && ((reg41 - (8'hb4)) <= reg44)) : ((((8'h9c) ^ wire38) ^~ (wire26 ?
                  reg46 : wire28)) <= $unsigned({wire25}))));
        end
      else
        begin
          if ((|$signed(({$unsigned(wire34)} ?
              ({(8'ha6)} ?
                  (reg40 ?
                      reg42 : wire35) : reg39[(1'h0):(1'h0)]) : (+$signed(wire38))))))
            begin
              reg45 <= reg29;
            end
          else
            begin
              reg45 <= (8'hb8);
              reg46 <= wire34;
              reg47 <= wire36;
            end
        end
      reg48 <= wire36;
      if (($signed((^~wire32)) >>> $signed({$signed($unsigned(reg40))})))
        begin
          reg49 <= $signed((-wire25));
        end
      else
        begin
          reg49 <= $signed(((^{$signed(reg47)}) ?
              $unsigned((~|(~reg47))) : reg49[(3'h6):(1'h0)]));
          reg50 <= wire26;
          reg51 <= $signed($unsigned(wire38));
        end
      reg52 <= (~&$signed((($unsigned(wire38) ?
              reg48[(4'he):(1'h1)] : (!(8'ha4))) ?
          ({(8'hac)} ^~ (&reg47)) : {(^~reg47)})));
    end
  assign wire53 = (~^(~&{($signed(wire34) >= (~(8'hb7))),
                      (reg51 ~^ ((8'hba) && wire26))}));
  always
    @(posedge clk) begin
      reg54 <= $signed(wire53);
      reg55 <= {(reg40[(4'ha):(4'h8)] ?
              {$signed($unsigned(wire34))} : wire35[(3'h4):(2'h3)])};
    end
  assign wire56 = ($signed((($signed(reg42) ?
                          $signed(wire35) : reg39) | reg49)) ?
                      $signed(((&(reg45 & reg29)) ?
                          (~&$signed(reg49)) : reg55[(1'h1):(1'h0)])) : wire25[(1'h1):(1'h1)]);
  assign wire57 = wire37[(2'h2):(2'h2)];
  assign wire58 = ((~|{wire25[(3'h4):(1'h0)], reg46}) ?
                      ($signed(((!wire56) ?
                          reg50 : reg43[(2'h3):(2'h2)])) * $signed(({reg40} && $unsigned(reg46)))) : (!(reg41[(3'h5):(3'h4)] ?
                          wire33 : ((~wire32) ?
                              {(8'hb2)} : wire37[(2'h3):(1'h0)]))));
  assign wire59 = ($signed(($unsigned($signed(reg46)) >= reg42[(2'h2):(1'h0)])) | (^~$unsigned((reg55 | (reg50 ?
                      wire34 : wire56)))));
  assign wire60 = (((+(8'h9f)) ?
                          $signed($unsigned(wire35[(3'h4):(2'h2)])) : wire36[(1'h0):(1'h0)]) ?
                      wire57 : reg41[(2'h3):(1'h1)]);
  assign wire61 = reg40;
  assign wire62 = (8'h9e);
endmodule
