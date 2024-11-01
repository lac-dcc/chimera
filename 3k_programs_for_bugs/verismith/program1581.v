module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire241;
  wire [(5'h11):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire6;
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  assign y = {wire241,
                 wire117,
                 wire101,
                 wire100,
                 wire99,
                 wire86,
                 wire6,
                 reg5,
                 reg4,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed(($signed((wire1 <= wire0)) ?
              (wire0[(4'h9):(3'h4)] * $unsigned(wire2)) : ((!wire3) ?
                  $unsigned(wire0) : (wire0 < wire2)))) ?
          (|$unsigned((-$signed((8'ha4))))) : wire1[(1'h0):(1'h0)]);
      reg5 <= (({$unsigned((wire2 ? reg4 : wire2)),
              ($unsigned(wire1) ? reg4 : wire0[(3'h6):(3'h6)])} & reg4) ?
          ($unsigned($unsigned((reg4 >> wire0))) ^ (~$signed($signed(wire3)))) : (8'hba));
    end
  assign wire6 = (|(+(&$signed((8'hb1)))));
  module7 #() modinst87 (.wire9(wire1), .wire11(reg5), .wire8(wire3), .clk(clk), .wire10(wire6), .wire12(wire0), .y(wire86));
  always
    @(posedge clk) begin
      reg88 <= $unsigned(($signed($signed($unsigned(reg5))) ^ $signed((~(^~wire6)))));
      reg89 <= (((wire3 || wire1) ?
              reg4[(4'h9):(3'h6)] : $unsigned($signed((reg4 ?
                  reg4 : (8'ha7))))) ?
          $signed((($signed(reg5) ? reg4[(3'h5):(1'h1)] : wire86) - (reg4 ?
              (wire86 >= reg4) : (^wire3)))) : (~&(~{$signed((8'hb6))})));
      if ((~&($signed({wire0, $unsigned(wire1)}) ?
          ($unsigned((^~wire6)) >> $unsigned($unsigned(wire2))) : $unsigned(($signed(reg5) ?
              $signed(reg5) : wire6)))))
        begin
          reg90 <= wire6;
          reg91 <= wire2[(4'he):(2'h3)];
          if (((-wire3[(5'h10):(2'h2)]) ? $unsigned($signed((7'h44))) : reg89))
            begin
              reg92 <= ((reg5[(3'h4):(2'h2)] == (~wire1[(2'h3):(2'h3)])) >> {(!$unsigned($signed(wire6))),
                  wire3});
              reg93 <= ((^(|{$unsigned(reg89)})) ?
                  wire3[(5'h15):(3'h5)] : reg4[(2'h2):(1'h1)]);
            end
          else
            begin
              reg92 <= reg93[(2'h2):(2'h2)];
              reg93 <= $unsigned(reg89[(2'h2):(2'h2)]);
              reg94 <= $unsigned(wire0[(4'h8):(3'h5)]);
              reg95 <= $unsigned($signed(reg90));
              reg96 <= {{($unsigned(reg94[(2'h2):(2'h2)]) ?
                          $signed((reg93 ? reg89 : reg4)) : {(reg95 ?
                                  wire3 : wire0),
                              wire86})},
                  wire2};
            end
        end
      else
        begin
          reg90 <= (($unsigned((8'hb4)) * (^~(((7'h43) ~^ (8'hbf)) ?
                  $signed(reg93) : wire2[(2'h3):(2'h2)]))) ?
              (+{reg91}) : (&{(reg4 >= reg92[(2'h2):(1'h1)]),
                  wire0[(4'hf):(4'hc)]}));
          if ((8'ha7))
            begin
              reg91 <= (reg90 != reg88[(3'h7):(3'h5)]);
              reg92 <= ((+$signed($signed(reg96))) ?
                  (~&($signed(reg94[(3'h5):(1'h1)]) ?
                      reg90 : $signed((reg93 ?
                          wire86 : (8'hbf))))) : $unsigned($signed((reg89[(3'h5):(3'h5)] ?
                      reg90[(3'h7):(2'h2)] : $signed(reg91)))));
            end
          else
            begin
              reg91 <= $signed(reg4[(4'hb):(3'h5)]);
              reg92 <= ((~^({(reg92 ? reg5 : reg5), wire6[(2'h3):(1'h0)]} ?
                      ($signed(wire3) | wire6[(3'h5):(2'h3)]) : $unsigned(wire1[(3'h6):(1'h1)]))) ?
                  reg93 : $signed({{wire3}, reg93[(2'h2):(2'h2)]}));
            end
          if (reg96)
            begin
              reg93 <= reg95;
              reg94 <= {reg5[(3'h4):(2'h2)], wire6};
              reg95 <= (~|$signed(((~^(reg89 >= wire3)) | {(wire2 != reg4)})));
              reg96 <= {$signed(reg94)};
            end
          else
            begin
              reg93 <= (((~^wire2) ?
                      ($signed($unsigned(reg4)) != {(reg91 ?
                              reg93 : wire1)}) : {($unsigned(wire3) >>> $unsigned(reg93)),
                          (~(wire86 ? reg92 : reg5))}) ?
                  reg93[(1'h1):(1'h1)] : $signed(wire1));
              reg94 <= ((reg95[(4'hd):(3'h6)] && $signed($unsigned($unsigned(reg93)))) != (8'hba));
              reg95 <= (8'ha7);
              reg96 <= reg92;
            end
        end
      reg97 <= {reg96[(3'h4):(1'h1)]};
      reg98 <= $signed(reg91);
    end
  assign wire99 = reg98;
  assign wire100 = $unsigned((wire6[(4'hd):(3'h5)] - reg88));
  assign wire101 = $signed(($signed($unsigned((-wire99))) ?
                       (($signed((8'hba)) ?
                           (reg95 * reg93) : $unsigned(reg4)) && $signed((~reg97))) : $signed($signed({wire86}))));
  always
    @(posedge clk) begin
      if ({reg98[(1'h0):(1'h0)]})
        begin
          if (reg89[(3'h5):(2'h3)])
            begin
              reg102 <= {$unsigned(reg98),
                  ((reg95[(4'ha):(2'h3)] & (((8'ha0) ? reg4 : wire0) ?
                          (reg92 <<< reg4) : (wire0 ? (7'h43) : (8'ha7)))) ?
                      (-(7'h42)) : ((reg96[(1'h0):(1'h0)] && (wire86 ?
                              reg4 : reg5)) ?
                          (+(~reg96)) : (reg98 ? wire86 : wire6)))};
              reg103 <= (8'hbb);
              reg104 <= $unsigned(({(^wire0)} & ($unsigned($unsigned(reg102)) ?
                  ($unsigned(reg89) ? reg90 : reg90) : reg96)));
              reg105 <= (~^$unsigned(wire1[(4'h9):(2'h2)]));
            end
          else
            begin
              reg102 <= ((reg95[(4'ha):(4'h9)] ?
                      ($unsigned($signed(reg105)) ?
                          $signed((reg4 ^ reg94)) : wire1) : $signed(($signed(reg88) ?
                          reg96[(3'h4):(1'h1)] : {wire100}))) ?
                  {$unsigned($unsigned((reg102 ?
                          wire1 : wire3)))} : (reg91[(5'h10):(4'he)] ?
                      ((8'hbb) > $signed((wire2 ? reg92 : reg102))) : reg103));
            end
        end
      else
        begin
          reg102 <= reg103[(1'h0):(1'h0)];
          reg103 <= reg102[(4'h8):(1'h1)];
          reg104 <= {$signed({((8'hb5) ? $signed(wire3) : (reg93 >> reg92)),
                  ((^reg88) ? (reg102 >> reg96) : (reg97 ? reg94 : (8'hb1)))}),
              $unsigned((&((reg104 != reg91) ? wire99 : (^~wire6))))};
        end
      reg106 <= $signed($unsigned((^~$signed((wire99 << reg4)))));
      if ($unsigned(({({(8'hb8)} ? ((8'hb2) < (8'ha3)) : wire86)} + wire0)))
        begin
          reg107 <= (reg93[(1'h0):(1'h0)] > {reg92[(1'h1):(1'h1)],
              {$signed(wire0[(4'h8):(3'h4)])}});
          reg108 <= (!($signed(reg95[(3'h5):(1'h1)]) | (^~$unsigned(wire100))));
          reg109 <= $signed($signed(((((8'hab) ?
              reg102 : reg108) > (~|wire86)) >>> wire0)));
          if ($unsigned((reg88[(3'h4):(2'h2)] == $signed($signed((^reg102))))))
            begin
              reg110 <= reg104[(4'he):(4'ha)];
              reg111 <= wire86[(3'h7):(2'h2)];
              reg112 <= reg109;
            end
          else
            begin
              reg110 <= reg5;
            end
          if (reg110)
            begin
              reg113 <= wire101[(2'h3):(1'h1)];
              reg114 <= $signed(wire101[(4'hc):(3'h6)]);
              reg115 <= reg89;
            end
          else
            begin
              reg113 <= (!({{(reg91 << reg114), (reg103 | reg93)},
                  $signed(reg110)} ^~ (wire100 ?
                  $unsigned(reg89) : {(reg113 ? reg88 : reg90)})));
            end
        end
      else
        begin
          reg107 <= $signed($unsigned(((&(wire6 < wire2)) << {reg89[(1'h0):(1'h0)],
              (reg115 ? reg109 : reg94)})));
          reg108 <= $signed(reg106);
          if (reg105)
            begin
              reg109 <= $unsigned(($unsigned(wire100[(1'h1):(1'h0)]) <= reg91[(4'h8):(3'h6)]));
            end
          else
            begin
              reg109 <= {reg4[(1'h0):(1'h0)]};
              reg110 <= ((~&$signed((8'hb1))) ?
                  (|(+reg110)) : $unsigned(($unsigned({reg102}) >>> reg94)));
            end
          reg111 <= (&$unsigned((wire100[(2'h2):(1'h0)] ?
              $signed((reg102 ? (8'hab) : reg114)) : ((reg111 ?
                      reg90 : reg107) ?
                  reg4[(3'h5):(3'h4)] : (~^reg107)))));
          reg112 <= wire100[(2'h2):(1'h0)];
        end
      reg116 <= reg103[(1'h1):(1'h1)];
    end
  assign wire117 = reg104[(3'h5):(1'h0)];
  module118 #() modinst242 (.wire122(wire1), .clk(clk), .wire119(reg113), .y(wire241), .wire120(reg116), .wire121(wire0), .wire123(reg115));
endmodule

module module118  (y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire123;
  input wire signed [(5'h12):(1'h0)] wire122;
  input wire signed [(2'h3):(1'h0)] wire121;
  input wire [(3'h6):(1'h0)] wire120;
  input wire [(5'h15):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire240;
  wire signed [(4'hb):(1'h0)] wire238;
  wire signed [(3'h7):(1'h0)] wire191;
  wire [(4'h8):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire189;
  wire [(4'he):(1'h0)] wire187;
  wire [(4'hd):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  assign y = {wire240,
                 wire238,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 reg130,
                 (1'h0)};
  assign wire124 = wire119;
  assign wire125 = $signed((-($signed(wire123) >>> ((wire121 >= wire124) ^~ (wire121 | wire123)))));
  assign wire126 = $signed($unsigned($signed((~&(wire119 ?
                       (8'hab) : wire119)))));
  assign wire127 = wire120;
  assign wire128 = (wire120 ?
                       ((+{(wire127 ? wire125 : wire122),
                           wire119}) >= {((^wire121) & wire120[(3'h4):(2'h3)]),
                           (~^wire119)}) : wire127[(2'h2):(2'h2)]);
  assign wire129 = (-((((~&wire126) ?
                           (8'hba) : wire124[(3'h4):(3'h4)]) - wire119[(4'hf):(4'hf)]) ?
                       $unsigned(wire121) : wire125));
  always
    @(posedge clk) begin
      reg130 <= (8'hb7);
    end
  assign wire131 = (($unsigned(wire124) ?
                           $signed(wire128[(1'h0):(1'h0)]) : (reg130[(3'h7):(3'h4)] != wire119[(4'hc):(4'h9)])) ?
                       ((-(&wire125)) ?
                           wire125 : wire121[(2'h3):(2'h3)]) : wire125);
  assign wire132 = (8'haf);
  assign wire133 = $signed($unsigned((wire125 ?
                       $unsigned($signed(wire122)) : $unsigned((wire124 >> wire126)))));
  assign wire134 = {(&(((wire131 - wire125) & (wire125 || wire124)) ?
                           (~wire125[(2'h3):(1'h1)]) : ($unsigned(wire125) ^ ((8'ha7) ?
                               (8'h9c) : wire123)))),
                       (wire126[(5'h12):(5'h12)] ?
                           $unsigned(reg130) : (~$signed($signed((8'hbd)))))};
  assign wire135 = $signed(wire121[(2'h3):(2'h3)]);
  module136 #() modinst188 (wire187, clk, wire122, wire133, wire126, wire135);
  assign wire189 = (~|$signed($signed(((-(8'ha7)) & ((8'ha7) ?
                       wire119 : wire129)))));
  assign wire190 = (8'hbf);
  assign wire191 = (^wire134[(2'h2):(1'h1)]);
  module192 #() modinst239 (wire238, clk, wire132, wire122, wire119, wire125);
  assign wire240 = (!(($signed(wire133) + ((~|wire189) ?
                       wire238[(2'h3):(2'h2)] : {wire238})) <<< $unsigned($signed((-wire119)))));
endmodule

module module7
#(parameter param85 = (((+((-(7'h40)) ? (~(8'ha6)) : ((8'hbc) ? (7'h41) : (8'h9d)))) | ({((8'haf) ? (7'h42) : (8'hb3))} ? ({(8'ha0)} != (!(7'h40))) : {((8'hbf) ? (8'hbb) : (8'haa))})) ? ({((&(8'haa)) ? (~^(8'hab)) : ((8'hb8) ? (8'haf) : (8'ha2)))} >> {{{(8'hb9)}, (!(8'ha6))}, (((8'h9f) << (8'ha1)) ? {(7'h43), (8'hb2)} : ((8'haf) ? (7'h43) : (8'hb6)))}) : (~^(&({(8'h9f), (7'h40)} ? ((8'hbc) & (8'ha7)) : (^~(8'hb0)))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire79;
  assign y = {wire84, wire83, wire82, wire81, wire79, (1'h0)};
  module13 #() modinst80 (wire79, clk, wire12, wire8, wire10, wire9, wire11);
  assign wire81 = wire11;
  assign wire82 = (($signed($signed((wire12 ? (8'haf) : wire11))) - ({(wire12 ?
                              wire12 : wire9)} && wire79[(4'h8):(3'h5)])) ?
                      $unsigned(wire81[(2'h2):(2'h2)]) : (^~$unsigned({(~(8'hb6))})));
  assign wire83 = ($unsigned($unsigned($signed($unsigned(wire11)))) ?
                      ($unsigned($signed($signed(wire12))) ^ ($unsigned((^wire9)) ^~ wire79[(4'ha):(3'h4)])) : (((wire8[(2'h2):(1'h0)] && wire82) && wire81[(4'hb):(4'hb)]) ?
                          (($unsigned(wire12) >> ((7'h44) >>> wire10)) << (wire81[(1'h0):(1'h0)] ?
                              $signed(wire10) : $signed(wire82))) : wire8));
  assign wire84 = (~&$signed({wire12[(4'hd):(4'hb)],
                      $signed((wire81 & (8'hb6)))}));
endmodule

module module13
#(parameter param77 = {(((!((8'ha0) ^~ (8'hb3))) ? {((8'ha4) | (7'h43))} : (~((8'hb4) ? (8'ha6) : (8'ha5)))) ? (+{((8'h9d) * (8'hab))}) : (~(+((8'h9d) ? (8'hb5) : (8'ha4))))), (&(^~(((8'hb6) >> (7'h44)) ? (~&(7'h43)) : (!(8'hac)))))}, 
parameter param78 = (|(~^{{(+param77)}})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire24;
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire57,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire24,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= (($unsigned((8'hb5)) != wire14[(4'hb):(2'h3)]) == {(wire15[(1'h1):(1'h0)] ?
              (^(wire16 ? wire15 : wire14)) : wire15),
          wire18});
      if (wire18[(4'h8):(1'h1)])
        begin
          reg20 <= $unsigned((~^(!$unsigned($signed(wire16)))));
          reg21 <= wire14;
          reg22 <= ($signed(wire14[(3'h5):(2'h3)]) ?
              $signed($signed(reg21[(3'h4):(3'h4)])) : $unsigned(wire17));
        end
      else
        begin
          reg20 <= (reg21[(3'h5):(2'h3)] ?
              ((+wire18) ?
                  reg22[(4'h8):(4'h8)] : reg20[(4'h9):(2'h2)]) : ({wire16,
                  ((reg22 && wire18) ?
                      (^~wire14) : (8'hbf))} > (reg22 <<< (wire15 * ((7'h44) >>> wire17)))));
          reg21 <= ({$signed((&wire16)),
              ($signed(wire14[(3'h6):(3'h6)]) + $signed($signed(reg21)))} != (wire16[(4'h8):(2'h2)] ?
              $unsigned(({reg20} ?
                  wire14 : $signed(reg20))) : (~($unsigned(wire16) ?
                  reg21[(2'h2):(2'h2)] : (|wire18)))));
          reg22 <= reg20[(4'h9):(3'h5)];
          if (reg22)
            begin
              reg23 <= $signed(wire18[(3'h4):(2'h3)]);
            end
          else
            begin
              reg23 <= {$signed(reg19[(3'h4):(3'h4)]), wire17};
            end
        end
    end
  assign wire24 = wire16[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (wire16[(1'h1):(1'h1)])
        begin
          if (((|$unsigned(wire15)) >> (8'hb9)))
            begin
              reg25 <= reg19[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= wire18;
              reg26 <= (|((^~$signed($signed(reg25))) ?
                  (reg22[(2'h3):(1'h0)] ^~ reg19) : reg21));
            end
          if ($signed(reg20[(3'h5):(1'h0)]))
            begin
              reg27 <= {(wire18[(2'h3):(1'h1)] ?
                      ((8'ha8) || (wire17[(3'h6):(3'h5)] ?
                          (~wire18) : (+reg22))) : $signed((^~$unsigned(wire15))))};
              reg28 <= (!(~&(wire16 ?
                  wire24[(3'h4):(2'h3)] : (-reg22[(4'h9):(3'h5)]))));
              reg29 <= ((reg20 > $signed((&$unsigned(wire18)))) != $signed($unsigned((+(reg20 <<< reg22)))));
            end
          else
            begin
              reg27 <= (wire24[(1'h0):(1'h0)] ?
                  $unsigned(({$signed(reg26),
                      wire24[(3'h6):(1'h1)]} <= {$signed(wire16),
                      ((8'h9d) & reg28)})) : reg25[(3'h4):(1'h0)]);
              reg28 <= (reg23[(3'h4):(1'h0)] >= reg21);
              reg29 <= ((8'hba) ^~ reg26[(3'h5):(3'h4)]);
            end
          if (($signed({$unsigned(reg22[(4'h9):(3'h4)]),
              (-$unsigned(reg26))}) - reg26[(1'h1):(1'h0)]))
            begin
              reg30 <= ({($signed({(8'ha3)}) & {reg22[(3'h4):(1'h1)]})} ?
                  reg27 : $signed(reg21[(2'h2):(1'h1)]));
            end
          else
            begin
              reg30 <= reg28;
              reg31 <= reg29;
              reg32 <= ($signed((~|wire24[(3'h5):(2'h2)])) <= $signed((($unsigned(reg21) ?
                      (+reg27) : (8'hb8)) ?
                  reg21[(3'h6):(2'h2)] : reg23[(2'h2):(2'h2)])));
              reg33 <= $unsigned({reg20[(4'hb):(2'h2)]});
            end
        end
      else
        begin
          if ($signed($signed($signed(((8'ha1) ~^ (reg32 << wire16))))))
            begin
              reg25 <= $signed($unsigned(reg33[(3'h6):(3'h6)]));
            end
          else
            begin
              reg25 <= $signed($unsigned(wire18[(4'hd):(4'hd)]));
              reg26 <= (reg20[(4'hb):(1'h0)] ?
                  (((8'hbc) ?
                          {((8'hbc) ? reg20 : wire24),
                              $unsigned(reg27)} : (wire16[(4'ha):(1'h0)] == (8'ha5))) ?
                      ({reg28[(4'ha):(3'h6)], wire14} ?
                          $unsigned($signed(reg30)) : $signed(reg21)) : $signed($unsigned(wire17[(3'h7):(2'h3)]))) : ((((reg27 == reg25) ?
                      (~&reg20) : {wire17}) - reg29[(1'h0):(1'h0)]) + (reg33 << wire24[(3'h5):(3'h5)])));
            end
          reg27 <= $unsigned(reg28);
          if ((8'hb5))
            begin
              reg28 <= $signed($unsigned($signed($unsigned((~|reg29)))));
              reg29 <= $signed(wire15[(2'h2):(2'h2)]);
              reg30 <= wire15;
            end
          else
            begin
              reg28 <= reg19;
              reg29 <= (~^((((|reg31) ?
                  (!wire16) : {(7'h43)}) - $unsigned($unsigned(reg23))) & $signed(((wire16 ?
                      wire15 : (7'h44)) ?
                  (^~reg23) : reg31[(2'h3):(2'h3)]))));
              reg30 <= $unsigned($unsigned(($unsigned((8'h9e)) ?
                  (^reg33[(2'h3):(2'h3)]) : {$unsigned(reg30), (|wire18)})));
              reg31 <= wire18;
            end
          reg32 <= {(8'ha0)};
          if (($unsigned($unsigned(reg31)) >>> (reg19 != $unsigned($signed($signed(wire14))))))
            begin
              reg33 <= ({$unsigned($unsigned({reg28})),
                      (~&((^~(8'haf)) ^ $unsigned(reg22)))} ?
                  ((wire17 + (~|(~|reg22))) >>> {wire18[(3'h4):(2'h3)]}) : $unsigned($unsigned($signed(wire15))));
              reg34 <= ($signed($unsigned(reg22)) ?
                  {reg33[(3'h5):(2'h2)],
                      (((~&wire16) ?
                          reg21[(1'h1):(1'h1)] : reg28[(2'h2):(1'h1)]) ~^ (^$signed((8'hb9))))} : $unsigned(reg32));
              reg35 <= wire14[(1'h1):(1'h0)];
              reg36 <= (8'haa);
              reg37 <= (~^$signed((reg34 ? {reg21} : reg22[(3'h5):(2'h3)])));
            end
          else
            begin
              reg33 <= reg23[(1'h1):(1'h0)];
              reg34 <= reg21[(2'h3):(1'h0)];
              reg35 <= (reg31[(1'h0):(1'h0)] ?
                  (&(~&(~^$unsigned(reg23)))) : (~reg31[(1'h1):(1'h0)]));
            end
        end
      reg38 <= reg37;
    end
  assign wire39 = $signed(reg32);
  assign wire40 = $unsigned(($signed({wire14}) ?
                      (+{$signed(reg27)}) : (($signed(reg29) ?
                          $signed(reg21) : $signed(wire14)) - reg19)));
  assign wire41 = (8'ha0);
  assign wire42 = ((8'hb4) & reg32);
  assign wire43 = reg23;
  always
    @(posedge clk) begin
      reg44 <= reg30[(2'h2):(1'h1)];
      reg45 <= (|wire17[(3'h5):(3'h5)]);
      if (((~&($signed(reg37[(3'h4):(2'h2)]) < $signed(wire16[(3'h7):(3'h7)]))) | $unsigned($unsigned((wire15 ?
          wire40 : $unsigned(wire39))))))
        begin
          if ($signed($signed((wire41[(3'h4):(1'h1)] ?
              $signed((reg28 <<< reg25)) : ((wire39 ?
                  (8'hb1) : reg26) > $signed(wire40))))))
            begin
              reg46 <= {$unsigned((wire40[(3'h5):(2'h3)] ?
                      $signed((reg29 ? (7'h41) : (8'hbd))) : (reg30 ?
                          {(8'hb2)} : $signed(wire17)))),
                  ((((-(7'h43)) ? reg21 : reg23) ?
                          (~(reg20 ? wire41 : wire40)) : reg45) ?
                      ((^reg31[(1'h1):(1'h1)]) <<< $signed($unsigned((8'hac)))) : $signed(((~^reg45) | ((8'haf) >>> wire15))))};
              reg47 <= (~^{wire39, reg26});
              reg48 <= $signed($signed(wire42));
              reg49 <= reg44[(2'h2):(1'h0)];
            end
          else
            begin
              reg46 <= $unsigned(((+((^reg35) * (^wire16))) ?
                  (((|wire16) ? reg26[(2'h3):(1'h1)] : wire15[(1'h1):(1'h0)]) ?
                      $signed((wire43 == wire42)) : $signed(((8'hb4) ?
                          reg47 : wire24))) : (^~(8'hba))));
              reg47 <= (8'h9d);
              reg48 <= ($unsigned(($unsigned(wire17) ? wire39 : reg33)) ?
                  {$unsigned((reg49[(1'h1):(1'h1)] ?
                          (reg32 || reg27) : $signed((8'ha3)))),
                      reg29[(5'h11):(4'ha)]} : (({$signed(reg32)} <= ($signed(reg38) < reg25)) ?
                      reg26 : {(!$unsigned(reg36)), $signed(wire15)}));
              reg49 <= $unsigned((!$unsigned((~(reg19 ? (8'haa) : wire40)))));
              reg50 <= $unsigned(((+reg37[(3'h4):(1'h0)]) ?
                  $signed(({reg20, reg30} <<< (reg31 ?
                      reg37 : (7'h44)))) : (7'h43)));
            end
          reg51 <= reg31[(1'h1):(1'h1)];
          reg52 <= reg36;
        end
      else
        begin
          if (wire24)
            begin
              reg46 <= (((~^reg52[(1'h1):(1'h1)]) > {$signed($unsigned(wire43))}) && $unsigned($unsigned(wire43[(3'h5):(1'h0)])));
              reg47 <= wire39;
            end
          else
            begin
              reg46 <= (wire39 ? (~&(8'hbc)) : reg26);
              reg47 <= $signed(reg47[(3'h6):(1'h0)]);
              reg48 <= reg46[(4'hd):(4'hb)];
            end
          reg49 <= wire40[(5'h10):(4'hf)];
          reg50 <= (((&($unsigned(reg28) ?
                      reg29[(1'h0):(1'h0)] : reg51[(1'h0):(1'h0)])) ?
                  {$unsigned(reg33[(3'h6):(2'h3)]),
                      $unsigned((!(8'ha8)))} : ($unsigned((reg36 ?
                          wire43 : wire16)) ?
                      ({reg44, reg47} ~^ reg30) : ((^wire39) ^ reg26))) ?
              reg36[(3'h4):(1'h1)] : reg37[(4'h8):(3'h4)]);
          reg51 <= $unsigned($signed($unsigned($unsigned(reg45))));
          reg52 <= reg48[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg53 <= (&({reg49[(2'h2):(1'h1)],
          (((8'ha4) ? wire18 : (8'hb5)) ?
              (reg48 > wire18) : wire42[(3'h7):(3'h4)])} >>> reg36[(1'h0):(1'h0)]));
      reg54 <= (-$unsigned($signed($unsigned({reg44}))));
      reg55 <= $signed($unsigned(($signed(reg51) ?
          reg25 : (reg19[(1'h0):(1'h0)] ? reg37[(3'h6):(2'h2)] : reg36))));
      reg56 <= (reg45[(4'h9):(4'h8)] >> reg30);
    end
  assign wire57 = reg35[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ($unsigned(reg50))
        begin
          if ((wire57[(3'h5):(3'h5)] ?
              ($signed($unsigned((wire40 ? reg47 : (7'h41)))) ?
                  (reg47[(2'h2):(1'h0)] ?
                      $signed((~wire40)) : {$signed((8'ha4)),
                          $signed(reg33)}) : {(reg33 ?
                          reg33[(3'h5):(1'h1)] : {(8'hb2),
                              reg33})}) : ((((&reg34) ?
                  (+wire39) : wire16) >>> {reg25}) << (($signed(reg55) << (~|reg29)) < wire24[(3'h5):(1'h1)]))))
            begin
              reg58 <= $unsigned(((($signed(wire41) != $signed((8'ha5))) <= ((+reg50) ?
                      reg28 : (reg29 >= wire15))) ?
                  ({(wire57 ? reg51 : wire17), $signed(wire16)} ?
                      {(&reg47)} : $signed((reg26 != reg36))) : (~$signed(reg53))));
              reg59 <= reg31;
            end
          else
            begin
              reg58 <= (!$unsigned($unsigned(reg50)));
              reg59 <= ((&(~|$unsigned(reg20[(5'h10):(1'h1)]))) || (~$unsigned($unsigned($unsigned((8'hb2))))));
              reg60 <= $unsigned($signed($signed(wire15[(1'h1):(1'h1)])));
              reg61 <= (reg50[(3'h6):(3'h6)] ?
                  ((8'ha4) ~^ $signed((~^reg52[(1'h0):(1'h0)]))) : $signed($unsigned(($signed(reg54) >> $unsigned(wire16)))));
            end
          reg62 <= $unsigned(reg20);
          if (({($unsigned($signed(reg48)) ?
                  {(reg53 ? (8'hb4) : reg53),
                      (wire43 ? reg52 : reg60)} : {(reg38 ? reg36 : wire43)}),
              reg34} ~^ {wire39}))
            begin
              reg63 <= $signed((|{(wire43 >> (|reg60)), {$signed((8'hbc))}}));
              reg64 <= wire39[(1'h0):(1'h0)];
              reg65 <= $signed($unsigned($signed(((reg52 ?
                  (8'haa) : wire24) != $unsigned(reg53)))));
              reg66 <= ($signed((~&({(7'h41), reg31} ?
                      (reg58 ? reg30 : reg63) : wire15))) ?
                  (~&$signed((~|(reg53 ?
                      reg59 : wire40)))) : reg46[(1'h0):(1'h0)]);
              reg67 <= (8'ha9);
            end
          else
            begin
              reg63 <= (^wire15[(2'h3):(1'h0)]);
              reg64 <= $unsigned(($signed($signed((!reg46))) - {((reg23 != reg32) ?
                      $unsigned((7'h40)) : (~|reg63)),
                  (~&$unsigned((8'hb6)))}));
              reg65 <= reg56;
              reg66 <= (reg31[(3'h6):(2'h3)] ?
                  $unsigned($signed($signed((reg45 ?
                      wire16 : reg20)))) : $signed(((reg21[(3'h6):(3'h5)] <= (~&reg36)) ?
                      $unsigned((reg52 ?
                          reg47 : reg37)) : $unsigned({reg45}))));
              reg67 <= reg58;
            end
          reg68 <= reg23[(1'h0):(1'h0)];
        end
      else
        begin
          reg58 <= reg19[(1'h1):(1'h1)];
          reg59 <= ({wire24[(3'h6):(1'h1)]} ? wire24 : reg46[(4'h9):(3'h6)]);
        end
      reg69 <= {(|reg65[(2'h3):(2'h2)]),
          $unsigned(($signed(reg56[(1'h1):(1'h0)]) & $unsigned(reg45)))};
      reg70 <= reg45;
    end
  assign wire71 = reg68;
  assign wire72 = $signed((~&(~&({reg27, wire39} ? (+reg52) : {reg66}))));
  assign wire73 = ((+(($signed(reg55) ? reg70[(4'hc):(2'h3)] : reg66) ?
                      ((reg69 ? wire41 : wire42) ?
                          (reg19 ?
                              wire24 : reg66) : reg62) : $unsigned((-(8'hbb))))) <= wire72[(3'h6):(2'h2)]);
  assign wire74 = reg19[(1'h0):(1'h0)];
  assign wire75 = reg33;
  assign wire76 = $signed(wire74);
endmodule

module module192  (y, clk, wire196, wire195, wire194, wire193);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire196;
  input wire [(4'hd):(1'h0)] wire195;
  input wire [(3'h5):(1'h0)] wire194;
  input wire [(5'h13):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire237;
  wire [(4'hc):(1'h0)] wire234;
  wire signed [(3'h7):(1'h0)] wire233;
  wire [(3'h7):(1'h0)] wire232;
  wire [(4'hc):(1'h0)] wire227;
  wire [(5'h13):(1'h0)] wire226;
  wire [(2'h2):(1'h0)] wire225;
  wire signed [(5'h12):(1'h0)] wire224;
  wire [(4'h8):(1'h0)] wire223;
  wire signed [(4'ha):(1'h0)] wire222;
  wire [(3'h7):(1'h0)] wire221;
  wire signed [(4'he):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire219;
  wire [(2'h2):(1'h0)] wire209;
  wire signed [(4'hf):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire197;
  reg signed [(4'ha):(1'h0)] reg236 = (1'h0);
  reg [(2'h2):(1'h0)] reg235 = (1'h0);
  reg [(5'h12):(1'h0)] reg231 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg229 = (1'h0);
  reg [(5'h15):(1'h0)] reg228 = (1'h0);
  reg [(4'ha):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg [(5'h13):(1'h0)] reg213 = (1'h0);
  reg [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(4'he):(1'h0)] reg211 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(4'he):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg [(4'hb):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg200 = (1'h0);
  assign y = {wire237,
                 wire234,
                 wire233,
                 wire232,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire209,
                 wire199,
                 wire198,
                 wire197,
                 reg236,
                 reg235,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 (1'h0)};
  assign wire197 = ((((wire194 && (wire193 & (8'ha7))) ^ wire196[(1'h0):(1'h0)]) <<< (8'hb1)) ?
                       wire193 : {wire195[(2'h3):(2'h2)]});
  assign wire198 = wire196;
  assign wire199 = $unsigned((wire193 > wire197[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed(((!$signed(wire194)) & (+wire194[(2'h2):(1'h1)])))))
        begin
          reg200 <= (wire194[(2'h3):(1'h1)] ?
              (wire199[(3'h7):(3'h5)] ?
                  (~^((wire197 ?
                      wire195 : wire193) ^ ((8'h9f) <= wire195))) : {(~&((8'had) | (8'ha1)))}) : wire198[(3'h4):(2'h3)]);
          reg201 <= $unsigned(wire196);
        end
      else
        begin
          reg200 <= ($unsigned(wire194[(2'h3):(1'h1)]) ?
              (wire196[(2'h2):(2'h2)] || (((wire194 ?
                  wire199 : (8'h9f)) ^ (reg201 ~^ wire193)) > (wire193 * reg200))) : ((~|(^~wire198[(4'h9):(3'h4)])) == {(^$signed(reg201)),
                  $signed($unsigned(reg201))}));
          reg201 <= $signed(wire199[(1'h1):(1'h0)]);
          reg202 <= (wire198[(3'h7):(2'h2)] >>> (-wire199));
          reg203 <= {$unsigned(wire196[(3'h6):(3'h4)])};
          if ((wire198 ?
              (^$signed($signed(((8'hab) & wire197)))) : (~^(8'ha6))))
            begin
              reg204 <= {reg203, $unsigned(reg202)};
              reg205 <= {$unsigned({wire195}), {wire196}};
              reg206 <= {(wire197 >>> (($unsigned((8'hb1)) ?
                      (|wire199) : $signed(wire199)) || wire197)),
                  {($unsigned((wire193 ? (7'h41) : (8'hab))) ?
                          ((|reg201) <<< (-reg204)) : $signed(wire199[(2'h2):(1'h0)])),
                      (wire196 || (~&wire193))}};
            end
          else
            begin
              reg204 <= wire193[(4'he):(2'h3)];
              reg205 <= ((^($unsigned($signed(reg201)) * (7'h40))) ?
                  $unsigned((wire199[(4'hd):(3'h4)] > (7'h43))) : wire199);
              reg206 <= $unsigned(wire196[(3'h6):(3'h5)]);
              reg207 <= (+((wire197[(2'h3):(1'h1)] >> (~^(reg204 & reg205))) ?
                  ($signed($unsigned(wire199)) != (8'hbb)) : $unsigned($signed((reg204 ?
                      wire195 : (8'hab))))));
              reg208 <= ((((~&reg200) * reg207[(1'h1):(1'h1)]) == reg201[(4'ha):(2'h3)]) || $signed(wire193));
            end
        end
    end
  assign wire209 = wire198;
  always
    @(posedge clk) begin
      reg210 <= {(($signed((wire194 >>> reg206)) ?
                  ((wire209 ? wire196 : reg200) ?
                      reg201[(4'he):(4'he)] : wire194[(2'h2):(2'h2)]) : (reg201[(2'h3):(2'h3)] + $signed((8'haf)))) ?
              {$unsigned((!reg206))} : $signed((|{reg200})))};
      if ($unsigned(wire198[(4'ha):(3'h7)]))
        begin
          reg211 <= $signed(reg203);
        end
      else
        begin
          reg211 <= $signed($unsigned({wire197[(2'h2):(1'h0)]}));
          if (reg201[(4'hb):(4'h9)])
            begin
              reg212 <= $unsigned($signed(wire209[(2'h2):(1'h0)]));
              reg213 <= reg202[(3'h6):(3'h4)];
            end
          else
            begin
              reg212 <= reg202;
              reg213 <= reg203;
              reg214 <= $signed(wire199);
              reg215 <= ((($signed((-reg212)) | ((-reg203) ?
                          ((7'h43) ? reg202 : reg202) : reg212)) ?
                      {$unsigned($signed(reg212)),
                          (reg200 ?
                              (wire209 + reg201) : (wire195 ~^ reg205))} : reg200) ?
                  (reg205[(4'hf):(4'hc)] >= wire194[(2'h2):(2'h2)]) : ((reg212[(3'h6):(3'h4)] == $unsigned((reg202 + reg211))) + {(8'hab)}));
              reg216 <= ($signed((8'ha6)) ?
                  (^((~(reg200 >> wire198)) || {{(8'had)}})) : $unsigned((^~$signed($signed(reg214)))));
            end
          reg217 <= (reg207[(4'hc):(4'h8)] > ($signed((((8'h9f) ?
                      reg216 : reg202) ?
                  reg208[(4'hd):(4'hc)] : reg210)) ?
              ((wire209[(2'h2):(1'h0)] >= wire194) ?
                  reg211 : wire196) : reg202));
          reg218 <= (!{$unsigned(($signed(reg208) <= (reg212 + wire198)))});
        end
    end
  assign wire219 = (((&reg201[(2'h3):(2'h3)]) + wire198) ?
                       (^$unsigned(wire209)) : ($signed($signed($signed(reg210))) <= $unsigned($signed($unsigned(wire209)))));
  assign wire220 = (|{wire195});
  assign wire221 = $signed($signed(wire197[(1'h0):(1'h0)]));
  assign wire222 = (^$unsigned(wire194));
  assign wire223 = (-{(wire196[(2'h2):(1'h1)] >= $unsigned(((8'ha2) - wire222))),
                       (reg205 ? {wire197} : (reg218 ? wire221 : {reg207}))});
  assign wire224 = $unsigned($signed($unsigned($signed((reg205 <= wire223)))));
  assign wire225 = ($unsigned((wire222 > reg202)) >> ((~|$signed((-wire196))) ~^ (!wire199)));
  assign wire226 = {($unsigned(wire224[(3'h7):(1'h0)]) ?
                           $unsigned((^~(reg210 ~^ wire219))) : (^~wire224[(2'h3):(2'h3)]))};
  assign wire227 = (((8'ha0) ?
                       ((wire197 || wire195) ?
                           $signed((reg202 ?
                               reg208 : reg206)) : $signed({wire226,
                               (8'h9e)})) : reg208) > ($signed(wire196) || (reg214[(2'h3):(2'h3)] ?
                       reg215[(5'h10):(4'hf)] : {reg211[(4'hd):(3'h6)]})));
  always
    @(posedge clk) begin
      reg228 <= $signed(reg200[(3'h7):(1'h0)]);
      reg229 <= reg214[(1'h1):(1'h0)];
      reg230 <= (~&(|($unsigned((wire224 > reg200)) ^ $signed($signed(reg214)))));
      reg231 <= wire222[(3'h5):(2'h2)];
    end
  assign wire232 = $unsigned((wire227[(4'h8):(1'h0)] > (wire199 || reg231[(5'h12):(4'h9)])));
  assign wire233 = ((~&wire194[(3'h5):(2'h2)]) ?
                       {reg215} : $unsigned((&{(wire198 ? reg217 : reg206)})));
  assign wire234 = $signed((~^reg215));
  always
    @(posedge clk) begin
      reg235 <= {$unsigned($signed($unsigned(wire194[(1'h1):(1'h1)]))),
          ($signed(reg208) ? {(-(reg205 & reg229))} : (8'ha9))};
      reg236 <= reg210;
    end
  assign wire237 = $unsigned((($unsigned({wire222}) <= reg204) << $unsigned($unsigned((&reg218)))));
endmodule

module module136
#(parameter param186 = (&{(({(8'ha6)} ^ {(8'haa)}) ? (((8'h9d) < (8'had)) <<< ((8'hbc) ? (7'h44) : (8'had))) : ((~|(8'hb6)) ? (+(8'hb2)) : {(8'ha2)}))}))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire140;
  input wire [(4'ha):(1'h0)] wire139;
  input wire [(2'h3):(1'h0)] wire138;
  input wire signed [(4'hd):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire183;
  wire signed [(2'h3):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire179;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire160,
                 wire156,
                 wire155,
                 wire154,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg159,
                 reg158,
                 reg157,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire141 = (&$signed($unsigned(($signed(wire137) && wire137))));
  assign wire142 = $unsigned(wire137);
  assign wire143 = wire142;
  assign wire144 = ($unsigned(wire142[(3'h4):(2'h2)]) ? wire139 : (!(8'ha5)));
  always
    @(posedge clk) begin
      reg145 <= ({((+$unsigned(wire143)) != {wire138, (^~(7'h43))}),
          ({wire144[(4'ha):(4'h8)], (&wire140)} || ((wire142 >= wire143) ?
              (wire144 + wire143) : (~^(8'hbb))))} - wire143[(1'h0):(1'h0)]);
      if (($signed((&wire141[(1'h1):(1'h0)])) ?
          {wire142,
              ($signed((!wire144)) == $signed(wire141))} : $unsigned($signed($unsigned(wire143[(1'h1):(1'h0)])))))
        begin
          reg146 <= (!((!$signed((wire137 ? wire138 : wire142))) > wire138));
          if ($signed({wire143}))
            begin
              reg147 <= wire141[(2'h2):(2'h2)];
              reg148 <= reg146[(4'h9):(2'h3)];
            end
          else
            begin
              reg147 <= (wire140[(2'h2):(1'h1)] >>> ({reg147[(3'h6):(1'h1)]} ?
                  (~(~&$signed((8'had)))) : {reg145}));
              reg148 <= $unsigned(({$signed($signed(reg146))} >= wire143));
              reg149 <= $signed($unsigned((~^(8'h9d))));
              reg150 <= reg145;
              reg151 <= reg145;
            end
          if ($signed($signed(reg151[(1'h0):(1'h0)])))
            begin
              reg152 <= $signed($unsigned($unsigned({((8'hb6) ?
                      wire142 : reg151),
                  $unsigned((8'ha4))})));
            end
          else
            begin
              reg152 <= (&{$unsigned(reg149[(2'h3):(1'h0)])});
            end
          reg153 <= (-(8'h9c));
        end
      else
        begin
          reg146 <= {$signed(reg152),
              $unsigned($unsigned((^~wire139[(1'h1):(1'h1)])))};
          if ({reg150[(1'h1):(1'h1)], reg148})
            begin
              reg147 <= (reg149 >= $unsigned($signed($signed($unsigned(reg147)))));
            end
          else
            begin
              reg147 <= $signed(((^~{(reg147 ? wire142 : wire137)}) ?
                  wire144[(3'h7):(2'h3)] : (((-reg151) ~^ reg153[(3'h6):(3'h6)]) ?
                      $signed($unsigned(reg147)) : (wire138 && $signed(reg147)))));
              reg148 <= $signed(reg147[(3'h4):(1'h0)]);
              reg149 <= reg150[(4'hd):(3'h4)];
              reg150 <= reg153[(3'h4):(2'h3)];
              reg151 <= (wire144 ?
                  ({reg152} != (~{$signed(wire144),
                      ((8'hba) | reg149)})) : wire137[(4'h8):(3'h6)]);
            end
        end
    end
  assign wire154 = wire140;
  assign wire155 = reg153[(4'ha):(2'h3)];
  assign wire156 = (wire143 << (8'hba));
  always
    @(posedge clk) begin
      reg157 <= ((|(^(~&(~wire143)))) ? reg146 : (reg146 <<< (~&wire139)));
      reg158 <= wire143;
      reg159 <= (8'hbe);
    end
  assign wire160 = ((~wire154[(3'h5):(3'h4)]) ?
                       $unsigned((reg153[(2'h2):(1'h1)] < $signed($unsigned(reg149)))) : reg149[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      if (reg149[(3'h7):(3'h7)])
        begin
          reg161 <= (-{{$signed((wire143 * reg150)), (~$unsigned(reg151))}});
        end
      else
        begin
          reg161 <= ($unsigned({(wire156[(4'hd):(1'h0)] ?
                      $signed(wire140) : $signed((8'hbe))),
                  {$unsigned(reg161), ((8'hbf) ? reg157 : wire144)}}) ?
              (wire144[(5'h11):(5'h10)] && wire156) : wire156);
          reg162 <= $signed($unsigned($unsigned(reg148)));
          reg163 <= (((reg152[(2'h2):(1'h0)] ?
                  $unsigned({reg147,
                      wire142}) : $unsigned($unsigned((8'hb6)))) != reg149[(2'h2):(2'h2)]) ?
              {{(^~$signed(reg146)), reg147},
                  (~|reg159[(3'h7):(2'h2)])} : reg159);
          if ((wire142 ?
              ($signed($signed((reg157 ? wire154 : wire137))) ?
                  $unsigned({$unsigned(wire154)}) : $unsigned((^wire156[(3'h6):(3'h4)]))) : $signed((^~($signed(wire155) ?
                  (reg159 << reg145) : wire137)))))
            begin
              reg164 <= $signed(wire138);
              reg165 <= (8'ha2);
              reg166 <= reg158;
              reg167 <= ($unsigned(reg149[(3'h6):(2'h2)]) << ((&wire138) ?
                  reg158 : $unsigned({((8'ha6) ? wire141 : reg161)})));
            end
          else
            begin
              reg164 <= (8'hb5);
              reg165 <= $signed((wire160 ?
                  $unsigned({(~reg149), $signed(reg162)}) : wire144));
              reg166 <= ($unsigned($signed($unsigned(reg165[(1'h0):(1'h0)]))) ^ $signed((reg149 ^~ reg151)));
            end
          reg168 <= $unsigned($signed(($unsigned($signed(wire142)) - wire154)));
        end
    end
  always
    @(posedge clk) begin
      if (reg161[(4'h8):(2'h2)])
        begin
          reg169 <= ((8'h9d) ?
              (reg145 ?
                  {(!reg145[(2'h2):(2'h2)])} : $unsigned($signed(wire141))) : $unsigned($signed({((8'hb0) ?
                      reg145 : reg162)})));
          if ((8'haa))
            begin
              reg170 <= {wire154[(5'h10):(4'he)], reg162[(1'h0):(1'h0)]};
              reg171 <= (~|(~wire137));
              reg172 <= {$unsigned($unsigned($unsigned(((8'hbc) <<< reg152)))),
                  $unsigned(reg146)};
            end
          else
            begin
              reg170 <= (((+(^reg146)) ?
                      (~&$signed(reg161[(4'h8):(1'h0)])) : (reg166 ^ $signed((reg153 ?
                          reg165 : reg153)))) ?
                  (reg172[(3'h7):(1'h1)] ?
                      $signed((~|{reg152,
                          reg163})) : {wire143}) : reg171[(3'h7):(1'h0)]);
            end
          if ({(-{$signed(wire140[(3'h5):(2'h3)]), $signed($signed(reg159))}),
              $unsigned($signed($signed($unsigned(wire138))))})
            begin
              reg173 <= ((8'ha0) ?
                  ((($unsigned(reg171) ?
                          (wire137 << reg167) : {reg157}) - ($signed(reg171) ?
                          (|reg158) : (wire144 >>> reg167))) ?
                      (($unsigned(reg164) && $signed(reg145)) ?
                          wire139 : ((reg172 * reg157) <<< $unsigned(reg158))) : wire137) : (({{reg145,
                              wire140}} * reg151) ?
                      (reg152[(2'h3):(2'h3)] ?
                          (wire139[(3'h5):(2'h2)] ?
                              $unsigned(reg166) : $signed(reg146)) : ($unsigned(reg170) ?
                              reg145 : (wire142 ?
                                  reg172 : reg167))) : (^~{wire141})));
              reg174 <= reg163[(4'hf):(1'h0)];
            end
          else
            begin
              reg173 <= ((8'hb6) & wire156[(2'h3):(1'h0)]);
              reg174 <= (~|$unsigned($unsigned({reg159})));
              reg175 <= $unsigned($signed(({reg153,
                  $unsigned(wire142)} >>> reg148[(1'h1):(1'h0)])));
            end
          reg176 <= $signed(wire137);
        end
      else
        begin
          if (reg172)
            begin
              reg169 <= reg149[(2'h3):(2'h3)];
              reg170 <= ($signed((~&(reg171[(4'h8):(2'h2)] <= (reg159 ?
                  wire154 : reg157)))) << $signed((wire139[(4'ha):(4'h9)] ?
                  {{wire141, (8'hbd)},
                      (reg146 ?
                          reg145 : reg176)} : (wire144[(1'h0):(1'h0)] <= $signed(reg149)))));
              reg171 <= (((^reg168[(4'hb):(2'h2)]) ?
                      reg173 : reg145[(1'h1):(1'h0)]) ?
                  reg176 : ($unsigned($unsigned((wire160 >= reg169))) ?
                      (wire142[(4'ha):(1'h0)] <= $unsigned((reg158 ?
                          (8'hab) : (8'hb9)))) : ($signed((reg165 ?
                              (8'h9c) : reg145)) ?
                          reg148[(3'h5):(2'h3)] : ($unsigned(wire142) ~^ $unsigned(reg162)))));
              reg172 <= ({{($signed(reg166) ?
                          (wire139 ? reg167 : (8'ha3)) : (-reg159))},
                  $signed($unsigned($unsigned((8'h9e))))} ^~ (!$signed(reg146)));
            end
          else
            begin
              reg169 <= ($unsigned($unsigned((^~wire143))) | wire160[(4'ha):(4'ha)]);
              reg170 <= ((reg173 ?
                      {$signed((reg150 ?
                              reg174 : (8'haa)))} : ($signed((reg146 ?
                          reg171 : wire154)) || $unsigned((wire142 ?
                          (8'hbf) : reg175)))) ?
                  reg149 : $signed($unsigned({{reg170, (8'hb8)}})));
              reg171 <= {(((~&$signed(reg146)) && $signed((reg165 ^ reg145))) == (^$unsigned($signed(wire137))))};
            end
          reg173 <= (((!$signed((reg153 ? reg162 : wire144))) ?
              (((^reg173) == reg159[(4'h9):(2'h3)]) + ($unsigned(reg153) ?
                  (!(8'h9f)) : $signed(wire142))) : (reg172 ?
                  ((reg148 == wire141) ?
                      (reg157 ?
                          (8'hba) : reg167) : reg172[(3'h6):(2'h2)]) : wire138)) <<< reg165);
          reg174 <= $signed(reg164);
        end
      reg177 <= reg150[(1'h0):(1'h0)];
      reg178 <= $signed($signed(($unsigned((reg161 - reg175)) ?
          wire156[(3'h6):(1'h1)] : $unsigned($signed(reg149)))));
    end
  assign wire179 = {wire144[(4'h8):(1'h1)]};
  assign wire180 = reg168;
  assign wire181 = reg167[(2'h3):(1'h1)];
  assign wire182 = (reg162[(2'h3):(1'h0)] ~^ (reg165 ?
                       ((~^$signed((8'hae))) ?
                           (reg146 ?
                               (^wire181) : (~&reg158)) : ($signed(wire139) <= $signed(reg174))) : (~^reg171[(2'h2):(1'h0)])));
  assign wire183 = wire182[(1'h1):(1'h1)];
  assign wire184 = reg166[(2'h2):(1'h1)];
  assign wire185 = (~^($unsigned((wire156[(4'hd):(3'h5)] ?
                           (reg146 < reg172) : wire141[(1'h0):(1'h0)])) ?
                       $signed(($unsigned(wire137) ~^ ((8'ha1) || reg157))) : $signed($unsigned($unsigned(wire179)))));
endmodule
