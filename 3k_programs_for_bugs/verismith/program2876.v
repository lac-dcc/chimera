module top
#(parameter param145 = (((8'hac) ? (^~(((8'h9c) | (8'haf)) ? ((8'hbe) ? (8'hb1) : (8'h9d)) : ((8'hbd) ? (7'h41) : (8'hb6)))) : ((8'hb4) ? ({(8'hac)} * (~(7'h43))) : ((!(8'hbb)) ^~ ((8'hb4) ? (8'ha9) : (8'hab))))) > (({((8'ha3) < (8'had)), ((7'h44) ? (8'hbc) : (8'ha9))} ? (((8'ha9) * (7'h42)) + (8'had)) : (((8'ha9) ^~ (8'haa)) ^ (!(8'ha8)))) ? (~|{((7'h44) ? (8'hbc) : (8'hab))}) : {(~&((8'haa) ? (8'had) : (8'ha1))), (^(7'h43))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire111;
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire5,
                 wire6,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire111,
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
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire5 = (-((~|(wire4[(3'h5):(1'h1)] ?
                         $unsigned(wire2) : $unsigned(wire1))) ?
                     $signed(wire3) : $signed($unsigned($unsigned(wire4)))));
  assign wire6 = wire1;
  module7 #() modinst83 (wire82, clk, wire1, wire4, wire5, wire6);
  assign wire84 = ($unsigned($unsigned(wire0)) ^ {((wire2 ?
                              wire1[(3'h6):(1'h0)] : wire1) ?
                          wire1 : (|(^wire1))),
                      (wire0 ? wire0[(1'h1):(1'h1)] : wire82)});
  assign wire85 = wire1[(5'h12):(3'h6)];
  assign wire86 = $unsigned($unsigned((-wire2[(4'hc):(3'h5)])));
  module87 #() modinst112 (wire111, clk, wire3, wire85, wire86, wire6, wire84);
  always
    @(posedge clk) begin
      reg113 <= ($signed(wire6) - $unsigned((+$signed((-wire2)))));
      if ($signed(((!$signed((wire84 ?
          wire1 : wire111))) > $signed(((wire2 | wire82) ?
          {(7'h40), wire111} : (wire1 ? wire84 : (8'hae)))))))
        begin
          reg114 <= ($unsigned(((wire82 ?
                      {wire6} : (wire111 ? wire86 : wire82)) ?
                  wire111 : ((wire82 + wire1) > (wire2 < wire6)))) ?
              {(~^{(~^(8'hb2)), wire84}), wire85[(2'h2):(1'h1)]} : (wire5 ?
                  (wire2 & $signed((wire82 >> (8'haa)))) : wire4));
        end
      else
        begin
          if (wire82)
            begin
              reg114 <= ($unsigned(wire111) ?
                  wire2[(5'h14):(4'h9)] : (((wire3[(3'h7):(2'h3)] ?
                          (~&(8'hba)) : (~|wire0)) ?
                      $signed({wire2,
                          wire0}) : wire6[(4'hc):(4'ha)]) >>> ((+{wire5,
                          wire111}) ?
                      (-(8'hae)) : $unsigned((8'hb9)))));
              reg115 <= ($signed($unsigned($unsigned((reg113 ^~ wire1)))) ?
                  wire85 : {$unsigned(wire111)});
            end
          else
            begin
              reg114 <= $unsigned(wire3);
            end
        end
      if (((~|wire4) - $signed((^~(|$unsigned(wire0))))))
        begin
          reg116 <= ($unsigned(((~$unsigned(wire111)) ?
                  (-(wire3 | wire1)) : wire0[(1'h0):(1'h0)])) ?
              $unsigned((^$signed({wire3}))) : {$unsigned($unsigned({wire4,
                      reg115})),
                  $unsigned($signed($unsigned(wire84)))});
        end
      else
        begin
          if (wire85[(4'he):(3'h6)])
            begin
              reg116 <= $unsigned(((((~wire1) ?
                  wire5[(3'h4):(2'h3)] : reg114) | $signed((wire1 > reg115))) & ((8'hb3) ?
                  ($signed(wire84) <<< reg113[(3'h6):(1'h1)]) : (reg115 - $unsigned(wire0)))));
              reg117 <= $signed($signed((&((wire82 ?
                  wire4 : wire6) <<< (wire2 << wire84)))));
              reg118 <= (reg115[(2'h2):(2'h2)] + (wire0[(1'h0):(1'h0)] >> $signed(wire85)));
              reg119 <= (($unsigned($unsigned(reg114[(5'h10):(5'h10)])) < (&((wire85 | reg114) ?
                  (+wire1) : (reg118 ? wire86 : (8'hb8))))) && wire1);
              reg120 <= reg117;
            end
          else
            begin
              reg116 <= {reg114};
              reg117 <= $unsigned((($unsigned($signed(reg114)) ?
                  (~^$unsigned(wire111)) : {$signed(wire84)}) <= (reg120[(2'h2):(1'h1)] <<< (reg116 * wire6[(5'h10):(4'hb)]))));
              reg118 <= (+(({reg120[(3'h4):(1'h0)],
                      $signed(reg119)} > {reg114[(4'hf):(4'h9)]}) ?
                  {wire1, {(reg119 ? (8'ha8) : wire6)}} : $signed(wire5)));
            end
          reg121 <= reg120;
          reg122 <= (($unsigned((8'hbd)) && $unsigned(($signed(wire82) ?
                  {wire82, wire3} : (~|(8'ha9))))) ?
              wire84 : ($signed((~|(reg114 ? reg116 : reg120))) ?
                  (reg115 ? wire84 : {(reg116 + wire86)}) : (wire0 ?
                      {$signed(reg116)} : {$signed(reg113),
                          ((8'hb8) ? wire4 : reg116)})));
          reg123 <= wire111;
          reg124 <= $signed((((8'ha3) <= $signed($signed(wire6))) && (8'hbc)));
        end
      reg125 <= $signed(wire2[(2'h2):(1'h0)]);
      reg126 <= ($unsigned((~(reg118[(1'h0):(1'h0)] ?
          wire86 : (wire5 ? reg117 : reg123)))) >> (^($unsigned((reg114 ?
              wire2 : reg125)) ?
          reg125[(3'h4):(1'h1)] : ((+reg122) && wire85[(5'h12):(3'h7)]))));
    end
  always
    @(posedge clk) begin
      reg127 <= reg118;
      if (((wire82[(1'h1):(1'h1)] ? $unsigned((~^wire2)) : $unsigned(wire1)) ?
          (|((&$signed(wire5)) ?
              ($unsigned(reg127) - {reg115, reg123}) : ($signed((8'hb0)) ?
                  $unsigned((8'ha8)) : reg125))) : $signed($signed((^$signed(wire6))))))
        begin
          reg128 <= (!((((~&reg122) ?
                  ((7'h42) ?
                      reg124 : wire6) : $signed(wire5)) > $signed(reg119)) ?
              $unsigned($unsigned((reg124 >> wire86))) : $signed($signed($unsigned(reg116)))));
          reg129 <= (8'h9f);
        end
      else
        begin
          if (wire3[(4'hd):(4'hc)])
            begin
              reg128 <= wire0[(2'h3):(2'h2)];
            end
          else
            begin
              reg128 <= $unsigned(($signed(($unsigned(reg122) ?
                      wire84 : wire4[(3'h7):(1'h1)])) ?
                  (^(reg116[(5'h12):(3'h6)] ?
                      (+reg114) : reg116[(5'h13):(5'h10)])) : {{$unsigned(reg113)},
                      (|reg119)}));
              reg129 <= wire5[(1'h0):(1'h0)];
            end
          if (reg122[(1'h1):(1'h0)])
            begin
              reg130 <= (reg120 >= $unsigned($unsigned((((8'h9c) >>> wire5) ?
                  (wire4 ? wire86 : reg122) : (~reg123)))));
              reg131 <= $signed($signed(((^((8'hb6) <= wire4)) ?
                  (!reg118[(1'h0):(1'h0)]) : $signed((reg119 >> reg125)))));
              reg132 <= ($signed((wire82 <= $signed(wire6[(4'hb):(3'h5)]))) ?
                  (^($unsigned($signed((8'hac))) ?
                      (+(wire85 > wire0)) : $unsigned((~|wire86)))) : ($signed(reg122) ?
                      $signed($signed((~&reg118))) : (wire3 > (~|((8'hbc) <<< reg123)))));
            end
          else
            begin
              reg130 <= (^~{(($signed(wire3) ?
                      $unsigned(reg121) : (reg121 - wire3)) != wire111[(1'h0):(1'h0)])});
              reg131 <= $unsigned(wire0[(3'h5):(3'h4)]);
              reg132 <= ((~&(&$unsigned((^~wire3)))) == $signed((!(reg114 << $unsigned(reg119)))));
            end
          reg133 <= (+(~|(+reg117)));
          reg134 <= ($signed(($unsigned((reg117 > wire0)) * reg131[(4'ha):(1'h1)])) >= wire82[(1'h1):(1'h1)]);
          reg135 <= (reg114[(4'he):(4'hb)] << $signed((~|$signed($signed(wire6)))));
        end
      reg136 <= $unsigned((8'hab));
      if (reg135[(3'h5):(1'h0)])
        begin
          reg137 <= wire4;
        end
      else
        begin
          reg137 <= wire82;
          reg138 <= reg117[(1'h0):(1'h0)];
          reg139 <= {$signed($signed((reg133[(3'h4):(3'h4)] ?
                  (&reg137) : $signed(reg137)))),
              $signed(wire111)};
          reg140 <= ((+wire84) >>> (wire5 > reg122[(2'h3):(2'h2)]));
        end
    end
  always
    @(posedge clk) begin
      reg141 <= ((($signed((reg123 ? (8'ha5) : (8'hb7))) ?
                  (-(7'h43)) : ($signed((7'h42)) ?
                      (reg123 ? reg140 : reg139) : reg125[(2'h2):(1'h1)])) ?
              ((^~$signed(wire84)) ?
                  wire85 : ({(8'hb0), reg134} ?
                      $signed((8'ha2)) : (reg120 >= reg124))) : {$unsigned((~&(7'h42)))}) ?
          {wire111[(1'h1):(1'h1)],
              (^~$signed(reg125[(2'h2):(2'h2)]))} : (!reg140[(2'h2):(1'h0)]));
    end
  assign wire142 = (&($signed(($signed(reg114) ?
                       reg117[(4'h9):(3'h5)] : reg128[(1'h1):(1'h1)])) ~^ reg126));
  assign wire143 = $signed((~&wire4[(3'h7):(1'h1)]));
  assign wire144 = $unsigned($unsigned(reg116[(3'h7):(3'h5)]));
endmodule

module module87
#(parameter param109 = (8'hb8), 
parameter param110 = param109)
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire signed [(3'h7):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire90;
  input wire [(5'h15):(1'h0)] wire89;
  input wire [(3'h6):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire94,
                 wire93,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire93 = ($unsigned((+($unsigned(wire90) ?
                      (wire89 << wire91) : (wire89 ?
                          (7'h41) : wire92)))) <= ((((wire91 ?
                                  wire90 : (7'h43)) ?
                              $signed((8'hb7)) : (wire90 ? wire91 : wire89)) ?
                          (wire92[(3'h4):(2'h3)] || $unsigned(wire91)) : ((^~wire89) <= {wire92})) ?
                      (wire89 ?
                          wire89[(3'h7):(1'h0)] : ($unsigned((8'hac)) ?
                              (wire90 ?
                                  (7'h43) : (8'h9f)) : wire89[(2'h2):(1'h1)])) : {wire90[(3'h5):(3'h5)],
                          (wire89[(4'h9):(3'h4)] - (~^wire90))}));
  assign wire94 = ($signed($unsigned($signed({wire91, wire93}))) ?
                      wire91 : (^(~^((~wire89) || $unsigned(wire91)))));
  always
    @(posedge clk) begin
      reg95 <= ((+wire92) ? wire89 : wire88[(3'h4):(3'h4)]);
      if ((&((-(wire91[(3'h5):(1'h1)] <<< $unsigned(wire89))) ?
          wire89[(3'h5):(1'h1)] : (wire89 * $unsigned($signed(wire94))))))
        begin
          reg96 <= $signed(wire92[(1'h1):(1'h0)]);
          reg97 <= (~(wire94[(3'h7):(3'h5)] ?
              reg96 : {($unsigned(reg96) ?
                      $signed(wire89) : $signed(wire92))}));
          reg98 <= $unsigned($signed(({(wire94 ?
                  (7'h44) : reg95)} >>> wire93[(5'h10):(3'h4)])));
        end
      else
        begin
          reg96 <= reg97;
          reg97 <= $signed($signed((($signed(wire94) ?
                  (wire94 ? reg97 : reg96) : (reg97 + wire89)) ?
              wire88 : reg95)));
          reg98 <= $unsigned(reg97);
          reg99 <= (8'hb5);
        end
      reg100 <= (~^((~^reg97[(3'h6):(1'h1)]) ?
          $unsigned(((~&wire88) ^~ $unsigned(reg99))) : wire91[(3'h5):(1'h0)]));
      reg101 <= reg100[(1'h0):(1'h0)];
      reg102 <= reg96;
    end
  assign wire103 = $unsigned(reg100[(2'h2):(1'h0)]);
  assign wire104 = (8'h9d);
  assign wire105 = (reg99[(3'h7):(3'h6)] ?
                       (&(wire90[(1'h0):(1'h0)] + reg98[(1'h1):(1'h0)])) : reg100);
  assign wire106 = $signed($unsigned(wire92));
  assign wire107 = (~^wire92[(2'h3):(2'h3)]);
  assign wire108 = (|($signed(((wire107 ?
                       wire103 : wire89) ~^ wire94)) ~^ $unsigned(((~&wire88) ?
                       $unsigned(reg100) : reg97[(2'h3):(1'h0)]))));
endmodule

module module7
#(parameter param80 = (({(8'hb0)} ? (^(((7'h42) ? (8'ha9) : (8'hb2)) << {(8'had)})) : (((&(8'hb6)) ? ((8'ha3) ? (8'ha6) : (7'h44)) : ((8'hb9) ? (8'haf) : (8'h9c))) - (((8'ha3) * (8'hb9)) * ((7'h44) ? (8'hba) : (8'haf))))) <= (8'hb2)), 
parameter param81 = param80)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire74;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire12,
                 wire13,
                 wire34,
                 wire36,
                 wire74,
                 (1'h0)};
  assign wire12 = wire8[(1'h0):(1'h0)];
  assign wire13 = $signed((wire9 ?
                      $signed(($signed((8'hb8)) ?
                          (wire10 && wire12) : wire10[(4'ha):(1'h1)])) : wire10[(4'h8):(2'h3)]));
  module14 #() modinst35 (wire34, clk, wire8, wire13, wire10, wire12);
  assign wire36 = wire8[(5'h13):(5'h13)];
  module37 #() modinst75 (.y(wire74), .wire39(wire8), .wire41(wire36), .wire38(wire10), .clk(clk), .wire42(wire9), .wire40(wire13));
  assign wire76 = $unsigned({{$signed((|(8'hb7)))},
                      $signed(({(8'h9d), (8'hbe)} ?
                          {(8'h9d)} : $signed((8'haf))))});
  assign wire77 = $unsigned({($signed((wire12 ? (8'hac) : wire12)) ?
                          $unsigned((wire34 ?
                              wire34 : wire10)) : wire74[(2'h2):(1'h1)])});
  assign wire78 = $signed(wire11[(3'h6):(3'h4)]);
  assign wire79 = wire13;
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire [(2'h2):(1'h0)] wire41;
  input wire [(3'h7):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
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
                 reg56,
                 (1'h0)};
  assign wire43 = wire42[(2'h2):(1'h0)];
  assign wire44 = wire40;
  assign wire45 = (!($signed($unsigned($signed(wire44))) - wire39));
  assign wire46 = (~|{(wire43 ?
                          ((~|wire42) ?
                              (wire44 ?
                                  wire38 : wire45) : $signed(wire43)) : wire40),
                      (wire41[(1'h0):(1'h0)] ?
                          $signed((wire38 && wire40)) : wire44[(4'h8):(3'h7)])});
  assign wire47 = ((8'hbf) <= wire46);
  assign wire48 = wire40[(2'h3):(2'h3)];
  assign wire49 = $signed((&{($signed(wire44) ?
                          $signed((8'hba)) : $unsigned((8'ha2)))}));
  assign wire50 = wire40;
  assign wire51 = (wire40 ?
                      $unsigned($unsigned(wire47)) : (|wire48[(2'h3):(1'h0)]));
  assign wire52 = wire49[(2'h3):(2'h2)];
  assign wire53 = ($signed(wire41[(1'h0):(1'h0)]) ?
                      (~($unsigned($unsigned(wire38)) ?
                          wire46 : wire49)) : wire44[(2'h3):(1'h1)]);
  assign wire54 = wire40;
  assign wire55 = ((!$unsigned($unsigned((wire41 << wire45)))) >> (|$signed(($signed(wire43) || (wire47 ?
                      wire53 : wire46)))));
  always
    @(posedge clk) begin
      reg56 <= wire49[(2'h2):(1'h0)];
    end
  assign wire57 = wire41[(1'h0):(1'h0)];
  assign wire58 = wire45;
  always
    @(posedge clk) begin
      if ((~(~^(~^wire43[(3'h7):(3'h5)]))))
        begin
          if (wire43[(2'h3):(2'h3)])
            begin
              reg59 <= (-(~^({(wire50 & wire51)} >> $signed((+wire58)))));
              reg60 <= wire41;
            end
          else
            begin
              reg59 <= $signed($signed(wire53[(3'h7):(3'h4)]));
              reg60 <= wire52;
            end
        end
      else
        begin
          if (wire46)
            begin
              reg59 <= $unsigned((wire48 < wire40[(1'h0):(1'h0)]));
              reg60 <= {$unsigned($unsigned(wire50[(1'h0):(1'h0)])),
                  (~$unsigned(($unsigned(wire47) && (^~(8'hb6)))))};
              reg61 <= $unsigned(($signed({(wire54 ?
                      reg60 : wire39)}) * $signed((~^{wire49, wire45}))));
            end
          else
            begin
              reg59 <= $signed((wire50 ? wire51 : $signed(wire40)));
              reg60 <= $signed((~^$unsigned((wire54[(1'h0):(1'h0)] ?
                  wire41 : wire52))));
              reg61 <= wire40[(1'h0):(1'h0)];
              reg62 <= ({$unsigned((~|wire38)),
                      ($unsigned($unsigned(wire57)) >>> $unsigned((wire46 < wire55)))} ?
                  (8'hb5) : ($signed((8'hb5)) >= ((reg61 ^~ (wire58 ?
                          wire51 : wire53)) ?
                      $unsigned(wire46[(4'hb):(4'h8)]) : $signed($signed(wire45)))));
            end
          reg63 <= wire58;
          reg64 <= (-((wire40 ? $signed($signed((8'hbb))) : reg61) ?
              $unsigned(wire52[(1'h0):(1'h0)]) : (^($signed(wire46) ?
                  (~&(8'ha7)) : {wire42, reg61}))));
          reg65 <= {(wire50 & $signed((wire51 || (wire48 ? reg62 : reg64)))),
              ($unsigned((wire50 <= ((8'hb5) ~^ wire57))) ?
                  ((wire42[(4'hc):(4'ha)] ? (wire47 >= wire38) : {wire49}) ?
                      ((~|wire48) << wire51[(3'h4):(1'h0)]) : reg64[(2'h2):(1'h1)]) : wire39)};
          reg66 <= ($unsigned((reg61[(4'hb):(4'h8)] ?
                  reg56[(2'h3):(1'h0)] : wire46[(3'h7):(3'h4)])) ?
              (wire46 <<< ($unsigned((-wire42)) <<< $signed((wire42 ?
                  (8'ha1) : wire48)))) : (&wire40));
        end
      reg67 <= wire49;
      reg68 <= $unsigned((reg64[(1'h1):(1'h0)] ?
          $signed(wire47) : $signed(((reg65 && reg61) <= (reg64 || wire54)))));
      reg69 <= $unsigned((&$unsigned({wire54[(1'h0):(1'h0)]})));
    end
  assign wire70 = ((wire38[(2'h3):(1'h0)] > {$unsigned($unsigned((8'hb8))),
                      $unsigned(wire43[(3'h6):(2'h3)])}) && wire46);
  assign wire71 = {reg65[(1'h1):(1'h0)],
                      ($unsigned({wire38[(3'h6):(3'h4)],
                              wire38[(2'h3):(1'h1)]}) ?
                          $signed(((&reg60) ?
                              wire41 : (!reg67))) : wire45[(2'h3):(2'h2)])};
  assign wire72 = reg69[(1'h1):(1'h1)];
  assign wire73 = (~{(|{wire43, (reg68 != wire43)})});
endmodule

module module14
#(parameter param33 = ({((((8'ha9) ? (8'had) : (8'hbb)) ? ((8'h9f) + (8'ha9)) : ((8'h9f) + (8'hb6))) >= (((7'h43) ? (8'hb6) : (8'hb3)) ? {(8'hbe), (7'h40)} : {(8'h9f)})), ((8'ha5) ? (8'hb7) : {((7'h44) ? (8'hb5) : (8'h9c)), (|(8'hbf))})} ? (7'h44) : (~&(-((8'ha5) < ((8'hb4) ? (7'h40) : (8'ha4)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire20,
                 wire19,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = (+(wire16 != wire16[(1'h0):(1'h0)]));
  assign wire20 = {{$signed(((wire18 >= wire19) * (wire19 - (8'h9e))))},
                      (((~^wire16[(1'h0):(1'h0)]) ?
                          wire17 : $unsigned(wire16[(1'h1):(1'h1)])) != (wire18[(5'h12):(5'h10)] ?
                          wire15 : $signed($signed(wire17))))};
  always
    @(posedge clk) begin
      reg21 <= (~|$unsigned({$unsigned(wire20[(3'h4):(2'h2)]),
          ($signed(wire15) - wire16)}));
      reg22 <= $unsigned((($signed(wire19) ?
          ((~^reg21) ?
              (8'hb7) : $signed(wire16)) : wire20[(3'h6):(3'h6)]) == $signed(wire17[(1'h1):(1'h1)])));
      reg23 <= ((-wire17) + wire17[(1'h1):(1'h1)]);
      reg24 <= $unsigned(wire16[(1'h1):(1'h1)]);
      reg25 <= reg23[(1'h0):(1'h0)];
    end
  assign wire26 = $unsigned($unsigned($unsigned((wire15 != $signed(wire17)))));
  assign wire27 = reg23[(2'h2):(1'h0)];
  assign wire28 = {$signed({$unsigned(((7'h43) ? wire17 : (8'hb5)))}),
                      ($signed($signed((8'ha8))) >>> (-(!$signed(wire15))))};
  assign wire29 = (-{reg22});
  assign wire30 = (reg25[(3'h5):(2'h3)] ?
                      $unsigned(((-wire18[(4'h8):(3'h7)]) ^ reg22[(1'h0):(1'h0)])) : (~|wire18[(3'h5):(2'h3)]));
  assign wire31 = {$unsigned(($unsigned(wire16[(2'h3):(2'h2)]) ?
                          {wire30[(1'h1):(1'h0)], $signed(wire29)} : wire27)),
                      ($unsigned((!reg21)) ? wire29 : ((8'hbc) || wire28))};
  assign wire32 = (~|wire19[(1'h1):(1'h1)]);
endmodule
