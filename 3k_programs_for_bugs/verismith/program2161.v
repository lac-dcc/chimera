module top
#(parameter param177 = ((((((8'hab) != (8'ha3)) ? ((8'hab) ? (8'hba) : (8'ha5)) : ((7'h41) ? (8'ha4) : (8'haa))) ? (((8'ha1) ? (8'hb7) : (8'h9f)) ? ((7'h44) ^~ (8'hb2)) : ((8'ha5) - (8'hb3))) : (((8'ha8) ? (8'hb5) : (8'ha6)) <<< ((8'ha4) || (8'ha3)))) < ({(!(8'hbe))} ? (-(+(8'hb5))) : ((8'hbe) ? (&(8'hb0)) : ((7'h41) ~^ (8'hba))))) ? (!((&((8'hbf) != (8'hbb))) ? (((8'hbb) ? (8'h9c) : (8'hbd)) ? ((8'hb5) ? (8'ha7) : (8'ha9)) : (8'ha3)) : (((8'hbd) ? (7'h43) : (8'hb6)) ^ ((8'hb3) | (8'hbb))))) : ((~((~(8'ha4)) ~^ ((7'h40) ? (8'hb2) : (8'h9c)))) >>> ((~^((8'h9f) ? (8'hbd) : (8'hb1))) + (+(!(8'hb2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire165,
                 wire163,
                 wire7,
                 wire6,
                 wire5,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire5 = ((~|$unsigned(wire0)) ?
                     (wire3 >= (~((wire2 ? wire1 : wire0) ?
                         $unsigned(wire4) : (!wire0)))) : ((((-wire2) ?
                             (wire0 <= (8'hbc)) : (wire3 >>> (8'hba))) ?
                         wire4[(1'h1):(1'h1)] : (8'hae)) != wire4[(1'h1):(1'h0)]));
  assign wire6 = ((^~({(&(8'ha9))} && $unsigned((~(8'haf))))) <= wire1);
  assign wire7 = ((wire0 ?
                     wire0 : wire0[(2'h3):(2'h3)]) - wire5[(1'h1):(1'h0)]);
  module8 #() modinst164 (wire163, clk, wire4, wire7, wire0, wire5);
  assign wire165 = ({$unsigned(wire4[(4'hb):(2'h2)]),
                       wire4[(1'h0):(1'h0)]} ^~ $signed(wire7));
  always
    @(posedge clk) begin
      reg166 <= (&wire163);
      reg167 <= wire6;
      reg168 <= (8'hb6);
    end
  assign wire169 = $unsigned($unsigned($unsigned($signed($unsigned(wire165)))));
  assign wire170 = reg166;
  always
    @(posedge clk) begin
      reg171 <= ((((wire3[(1'h1):(1'h0)] || $unsigned(wire0)) <<< ((+wire1) ^ (wire4 & (8'hbd)))) ?
          $unsigned((8'hb2)) : ($unsigned((~&reg166)) <<< reg167[(4'h9):(2'h2)])) >>> (!{(~$signed(wire5)),
          wire169}));
      reg172 <= $signed((((|$signed(reg168)) <= {$unsigned(reg167)}) ?
          (($signed(reg168) && ((8'hb2) + reg166)) ?
              wire6[(5'h10):(4'h8)] : $unsigned(wire1)) : wire2));
    end
  always
    @(posedge clk) begin
      reg173 <= ($unsigned({($signed(wire169) ?
              {wire5} : $signed(reg167))}) - wire169);
    end
  always
    @(posedge clk) begin
      reg174 <= ($signed({reg167[(4'h8):(2'h3)]}) ?
          ($unsigned(reg168) ?
              $unsigned((-wire2[(4'hb):(3'h5)])) : ((wire165 >>> (~^wire3)) ?
                  (wire165 + $unsigned(wire3)) : wire3[(2'h2):(1'h1)])) : $signed($signed(wire170)));
      reg175 <= $signed(wire6);
      reg176 <= reg173;
    end
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire155;
  reg [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire118,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire13,
                 wire120,
                 wire155,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire13 = (-{(~&wire12[(2'h2):(1'h0)]),
                      ($unsigned($signed(wire12)) ?
                          (8'hb7) : $signed(((8'hab) ? wire12 : wire10)))});
  always
    @(posedge clk) begin
      reg14 <= $unsigned((($signed((wire10 == wire12)) ?
              $signed(((7'h41) >> (8'hb6))) : (((8'hb9) ? wire11 : (8'ha9)) ?
                  (|(7'h40)) : (wire9 ? wire11 : wire13))) ?
          $unsigned((!wire9[(2'h3):(1'h1)])) : $unsigned($signed((wire13 ?
              wire9 : wire9)))));
      reg15 <= (~&reg14);
      if ($unsigned(wire12))
        begin
          reg16 <= (^wire9[(1'h1):(1'h0)]);
        end
      else
        begin
          reg16 <= reg15;
          reg17 <= (~$unsigned((+((reg16 == (8'haf)) ?
              $unsigned(wire13) : reg15[(2'h2):(1'h1)]))));
          reg18 <= wire9;
          reg19 <= {$signed(wire11[(1'h0):(1'h0)]), (reg15 < (8'ha7))};
        end
      reg20 <= ((|{$unsigned(wire11[(2'h2):(2'h2)])}) ?
          reg17[(3'h7):(3'h5)] : $unsigned($unsigned(((wire9 > reg16) <= {reg19}))));
    end
  module21 #() modinst45 (.y(wire44), .wire24(wire12), .wire23(wire10), .wire25(wire13), .wire22(wire9), .clk(clk));
  assign wire46 = $signed(wire12[(3'h6):(3'h4)]);
  assign wire47 = (((wire11[(1'h1):(1'h1)] || $signed((~^reg16))) ?
                      reg14 : (!(-(-wire9)))) >= ((~|$unsigned(wire9[(2'h3):(1'h0)])) ?
                      $unsigned({$unsigned((8'hb1))}) : $unsigned((8'ha6))));
  assign wire48 = {$unsigned((&$unsigned(wire47))), reg20};
  module49 #() modinst119 (.wire53(reg20), .y(wire118), .wire52(reg16), .clk(clk), .wire54(reg14), .wire50(wire12), .wire51(reg18));
  assign wire120 = (~^{(reg18[(2'h2):(2'h2)] || ((8'ha8) ?
                           (~|wire47) : (reg15 << (7'h41))))});
  module121 #() modinst156 (.y(wire155), .wire124(reg17), .wire123(wire10), .wire122(wire47), .clk(clk), .wire125(wire120));
  always
    @(posedge clk) begin
      reg157 <= (|$signed($unsigned({(8'ha6)})));
      reg158 <= $unsigned(wire12[(3'h4):(1'h0)]);
      reg159 <= (wire47[(3'h7):(3'h7)] ?
          (($signed(wire9[(2'h3):(2'h3)]) ?
              reg20[(4'h9):(3'h4)] : $unsigned($unsigned(reg17))) <= (wire47[(4'hd):(4'h9)] <= wire47[(4'h8):(3'h6)])) : ($unsigned({(^~(8'hb9)),
              wire11}) << ({reg20} ~^ $signed((reg18 ? wire118 : wire44)))));
      reg160 <= (~&$unsigned(reg19[(1'h1):(1'h0)]));
    end
  assign wire161 = $unsigned((wire13[(1'h1):(1'h0)] ?
                       $unsigned((^(^~wire47))) : $unsigned($unsigned((reg157 ?
                           reg20 : reg17)))));
  assign wire162 = (reg157 ?
                       (wire44[(2'h3):(1'h0)] ?
                           ($unsigned((^~reg16)) ~^ $unsigned(wire155)) : $signed($signed(wire47[(2'h2):(1'h0)]))) : $unsigned(reg17));
endmodule

module module121  (y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire125;
  input wire signed [(5'h12):(1'h0)] wire124;
  input wire [(4'hd):(1'h0)] wire123;
  input wire signed [(4'he):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire [(3'h6):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(4'hb):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire128,
                 wire127,
                 wire126,
                 reg149,
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
                 (1'h0)};
  assign wire126 = wire123[(4'h8):(2'h2)];
  assign wire127 = wire122;
  assign wire128 = wire126[(4'he):(4'hb)];
  always
    @(posedge clk) begin
      if (((8'ha2) ?
          ($signed((((8'ha6) ? wire127 : wire125) ?
                  (wire126 < wire128) : $signed(wire127))) ?
              {(wire126 ?
                      (wire128 ?
                          wire128 : wire124) : $unsigned(wire127))} : wire124) : $signed((|((8'hab) ?
              {wire123, wire124} : $signed(wire126))))))
        begin
          reg129 <= wire126;
          if (((8'hb3) <= wire126[(1'h0):(1'h0)]))
            begin
              reg130 <= $unsigned(wire124[(4'h9):(3'h6)]);
              reg131 <= wire122[(2'h2):(1'h1)];
              reg132 <= ((reg130[(5'h11):(4'h9)] > $signed(({(8'hbc),
                      (8'hba)} + wire125[(3'h6):(1'h0)]))) ?
                  $unsigned(((-wire128[(4'hb):(3'h7)]) | (~^{(8'h9e),
                      wire122}))) : reg130[(1'h0):(1'h0)]);
              reg133 <= $unsigned((((|$unsigned(wire126)) ?
                  $unsigned((wire122 + wire122)) : {reg129[(1'h1):(1'h1)]}) ^~ {$unsigned(reg131[(1'h1):(1'h0)])}));
              reg134 <= (|wire126);
            end
          else
            begin
              reg130 <= $unsigned($signed($unsigned((+((8'hbc) ?
                  reg132 : (8'hbb))))));
              reg131 <= {reg134[(2'h3):(1'h1)]};
              reg132 <= reg130[(4'ha):(4'h8)];
              reg133 <= reg131[(1'h1):(1'h0)];
              reg134 <= (reg129[(3'h6):(2'h3)] ?
                  (((~&{reg133, (8'hb7)}) != ((reg133 ?
                      reg132 : reg134) | wire128[(4'hd):(2'h2)])) + wire122[(3'h6):(2'h2)]) : ({$unsigned((|reg131))} ?
                      $signed(wire125[(3'h7):(2'h2)]) : {{(-reg129)}}));
            end
          reg135 <= (8'hb0);
          reg136 <= (({(8'had)} ?
              $unsigned($signed(wire125)) : (8'ha9)) - wire127);
          reg137 <= ($unsigned(((!reg132[(3'h4):(3'h4)]) ?
                  wire123 : $signed($signed(wire127)))) ?
              $unsigned($unsigned(reg134)) : reg133);
        end
      else
        begin
          reg129 <= reg131;
          reg130 <= $signed(({$signed({wire124}), (^~$unsigned((8'hb4)))} ?
              reg134 : {reg132[(1'h1):(1'h0)], reg137}));
          reg131 <= $signed(wire124);
          reg132 <= reg130[(1'h0):(1'h0)];
          reg133 <= (wire126 + ($unsigned($unsigned($signed(reg131))) ?
              {((reg132 * (8'ha0)) ? (~reg135) : (!(8'hb4))),
                  (+{wire127, (8'hbb)})} : {$signed((wire123 != reg134)),
                  $unsigned({wire123})}));
        end
      reg138 <= $signed(reg129[(3'h5):(1'h0)]);
      reg139 <= (8'hbc);
      reg140 <= (^wire125[(3'h4):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg141 <= (reg131[(3'h5):(2'h2)] ?
          wire126[(4'h8):(3'h6)] : ($signed($signed((reg136 << reg134))) >> $signed((-(~&wire127)))));
    end
  assign wire142 = reg134[(2'h2):(1'h0)];
  assign wire143 = wire128;
  assign wire144 = reg137[(1'h0):(1'h0)];
  assign wire145 = ((reg140[(2'h2):(2'h2)] ?
                       $unsigned($unsigned((reg135 ?
                           reg133 : wire125))) : {($signed((8'hbe)) ?
                               {reg132} : (8'hbb)),
                           $unsigned($unsigned((7'h41)))}) ~^ reg141);
  assign wire146 = (-(~$signed($unsigned($unsigned(reg139)))));
  assign wire147 = reg132[(4'ha):(4'h9)];
  assign wire148 = $unsigned(($signed(wire124) ?
                       $unsigned((^~reg135[(2'h3):(2'h2)])) : {reg132[(4'ha):(3'h7)],
                           reg136}));
  always
    @(posedge clk) begin
      reg149 <= (~^reg139);
    end
  assign wire150 = ((+{$signed((reg141 ~^ reg130)), wire148}) ?
                       (reg137[(1'h0):(1'h0)] ^ reg141[(1'h0):(1'h0)]) : (7'h42));
  assign wire151 = ($signed($signed(reg133)) == $signed(reg139));
  assign wire152 = $signed($unsigned((^~reg133)));
  assign wire153 = $unsigned({$signed(reg135[(3'h7):(3'h6)])});
  assign wire154 = (|$signed({wire147}));
endmodule

module module49
#(parameter param117 = (+{(~^{(~^(8'hba)), (~^(8'h9c))})}))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h311):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire54;
  input wire [(3'h7):(1'h0)] wire53;
  input wire signed [(4'hb):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire55;
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire97,
                 wire78,
                 wire77,
                 wire76,
                 wire66,
                 wire61,
                 wire60,
                 wire55,
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
                 reg100,
                 reg99,
                 reg98,
                 reg96,
                 reg95,
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
                 reg80,
                 reg79,
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
                 reg64,
                 reg63,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire55 = (wire50 ?
                      {$unsigned(({wire54, wire50} ?
                              $unsigned(wire52) : (~^wire52)))} : $signed(wire53[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg56 <= (~|{wire55});
      reg57 <= (+$unsigned(({{(7'h44)}} > (^~{wire51}))));
      reg58 <= wire53;
      reg59 <= $unsigned(reg58[(3'h6):(2'h3)]);
    end
  assign wire60 = (wire51[(3'h7):(3'h5)] ^~ {(wire53 >>> $signed($unsigned(wire54)))});
  assign wire61 = ({$signed((wire53[(3'h6):(1'h0)] ? reg57 : (|reg59))),
                      (-{$signed(wire51),
                          ((8'ha0) ?
                              reg58 : (8'ha4))})} - {$unsigned($unsigned((8'h9c)))});
  always
    @(posedge clk) begin
      reg62 <= (($unsigned((8'hab)) ?
              (-($signed(wire54) << {wire53})) : (^~(~wire53[(3'h4):(1'h0)]))) ?
          (^~(&{wire60, $signed(wire60)})) : $signed($unsigned(reg56)));
      reg63 <= (|$signed((~$signed($signed(reg59)))));
      reg64 <= $unsigned(($unsigned(($signed(wire51) <<< {wire53,
          wire53})) ~^ wire60));
      reg65 <= wire55;
    end
  assign wire66 = ({reg59, $signed(wire54)} ^~ {((wire61[(4'ha):(2'h2)] ?
                              $signed(wire60) : (wire51 <<< reg57)) ?
                          ($signed(reg65) <<< wire61[(3'h5):(2'h2)]) : $unsigned((8'hb0))),
                      $signed(reg58)});
  always
    @(posedge clk) begin
      reg67 <= $unsigned((((wire54[(2'h3):(2'h3)] <= ((8'ha4) & (8'hae))) ?
          (7'h41) : (^~$signed(reg65))) & (({reg64,
              (8'ha8)} && $signed(wire50)) ?
          ((!(8'ha5)) >= wire61) : (reg65[(3'h6):(3'h5)] >>> (wire66 ?
              wire53 : wire55)))));
      if (reg65[(3'h5):(1'h0)])
        begin
          reg68 <= $unsigned(reg59[(4'he):(4'ha)]);
        end
      else
        begin
          if (wire52)
            begin
              reg68 <= {((8'haf) ?
                      $signed(wire52) : (reg65 >>> {(reg56 ? wire51 : reg57),
                          (+wire61)})),
                  reg59};
              reg69 <= wire52[(4'hb):(2'h3)];
            end
          else
            begin
              reg68 <= reg59;
              reg69 <= reg67[(4'h9):(3'h6)];
              reg70 <= reg59[(1'h1):(1'h1)];
              reg71 <= ({reg59, $unsigned($signed(reg62[(3'h5):(2'h3)]))} ?
                  (|(reg63[(4'hd):(2'h2)] ^~ (^reg69))) : ((reg68[(4'he):(4'hc)] >= ($unsigned(wire61) >> (7'h40))) ?
                      wire50[(2'h2):(1'h0)] : (~^$signed((^reg57)))));
            end
          reg72 <= (reg59 && {(8'ha8), (8'hb7)});
          reg73 <= $unsigned(wire51);
        end
      reg74 <= (reg57[(4'h9):(4'h8)] << $signed($unsigned(reg67)));
      reg75 <= {reg64, reg63[(4'hc):(4'h9)]};
    end
  assign wire76 = wire54;
  assign wire77 = ((^~(reg62[(4'hd):(4'hb)] && $unsigned((wire50 >> wire54)))) ?
                      {(+($unsigned(reg74) << reg58))} : (-wire52[(1'h0):(1'h0)]));
  assign wire78 = $signed(((((wire66 ?
                      reg58 : reg65) <= $unsigned(reg65)) <= $signed(reg57)) + $unsigned($signed(reg57))));
  always
    @(posedge clk) begin
      if ($signed((reg59 - $signed(reg68))))
        begin
          reg79 <= ({reg74[(4'hb):(1'h0)], wire60} ?
              $signed(wire51[(4'ha):(3'h4)]) : reg75);
          reg80 <= wire61;
          reg81 <= (+$unsigned((reg65[(2'h3):(2'h2)] ?
              {(wire51 ? wire60 : wire51)} : $signed(reg67))));
          reg82 <= ($unsigned(((!wire54) ?
                  {$unsigned(reg58)} : reg59[(4'ha):(3'h5)])) ?
              (+(+$unsigned(reg68[(4'hb):(1'h0)]))) : (+(reg79[(4'hb):(4'h9)] ^~ $unsigned(wire55))));
        end
      else
        begin
          reg79 <= reg69[(3'h7):(2'h3)];
          reg80 <= (8'ha7);
          reg81 <= (~($signed($unsigned(((7'h41) + wire55))) | reg65));
        end
      reg83 <= $unsigned((~&$unsigned(reg57)));
      reg84 <= $unsigned(reg75[(4'hd):(4'ha)]);
      if (((8'haf) ?
          ($signed(((reg59 ? reg72 : reg65) > reg65)) > $signed(({wire76} ?
              {reg84, reg62} : (-reg62)))) : reg69[(3'h4):(2'h3)]))
        begin
          if ((((&$signed((reg63 ? reg67 : reg67))) ?
              (|$unsigned((reg59 ?
                  reg59 : wire78))) : reg69) && $unsigned(((&(+reg80)) ?
              (wire61 ?
                  (wire61 >> reg75) : (reg62 ~^ reg69)) : reg57[(4'h9):(3'h6)]))))
            begin
              reg85 <= (((^(~|(reg69 ?
                      reg67 : reg82))) >> $signed(((|wire66) <= {reg69,
                      wire66}))) ?
                  reg79 : reg62);
              reg86 <= wire55;
              reg87 <= (^~(reg83[(2'h2):(1'h1)] ?
                  wire61 : (~^(^reg75[(3'h7):(2'h3)]))));
              reg88 <= reg75[(4'h9):(2'h2)];
              reg89 <= (($signed(($unsigned(wire77) < ((8'hbf) ?
                          reg58 : reg68))) ?
                      $unsigned((8'hb0)) : (~$signed($unsigned(reg67)))) ?
                  reg63 : $signed($signed(reg58[(3'h5):(2'h3)])));
            end
          else
            begin
              reg85 <= reg81[(4'h8):(3'h7)];
            end
          reg90 <= {(8'hb6), wire60};
          if (reg84[(1'h0):(1'h0)])
            begin
              reg91 <= reg88[(2'h2):(1'h1)];
              reg92 <= $signed({$unsigned((8'ha7)), (|reg74[(2'h2):(1'h1)])});
            end
          else
            begin
              reg91 <= reg64;
            end
          reg93 <= (8'ha3);
        end
      else
        begin
          reg85 <= (((8'hb0) ?
              (reg68[(3'h5):(1'h0)] ?
                  ($unsigned(reg80) ?
                      reg73 : (wire61 != (8'ha2))) : (~^reg83[(2'h3):(1'h0)])) : $signed(((reg56 ?
                      (8'had) : reg65) ?
                  (reg65 ?
                      reg93 : reg73) : (7'h40)))) << wire76[(4'h9):(3'h5)]);
          if ({$unsigned((|(!$unsigned((8'h9f))))),
              $unsigned((^~(~&reg80[(5'h12):(4'ha)])))})
            begin
              reg86 <= (wire50 ?
                  ((reg85[(1'h0):(1'h0)] - ($signed(wire53) ?
                      $signed(reg62) : reg86[(4'hc):(3'h7)])) | {(|(reg93 ?
                          wire66 : wire66))}) : {(($unsigned(reg90) * wire53[(1'h0):(1'h0)]) - reg71[(3'h5):(2'h2)]),
                      (({(8'hb7), wire52} != {wire78}) << (reg89 ?
                          (8'ha3) : $unsigned(wire66)))});
              reg87 <= $signed($signed(reg57));
              reg88 <= $unsigned(reg63);
              reg89 <= reg84[(2'h3):(2'h3)];
            end
          else
            begin
              reg86 <= (((8'ha5) ?
                  (~|$signed((wire54 << reg92))) : reg65) + $unsigned(reg56));
              reg87 <= (reg90 * ((&((~|(8'hbf)) || reg87[(3'h7):(3'h6)])) != $unsigned((~^(7'h44)))));
              reg88 <= $signed({{((~|reg56) & $signed(reg87))},
                  reg85[(1'h1):(1'h1)]});
              reg89 <= reg58[(4'hf):(2'h2)];
              reg90 <= ((($unsigned((reg67 ^ reg84)) * $unsigned($unsigned(reg83))) ?
                  $unsigned(($signed((7'h43)) <<< (reg89 <= (8'ha9)))) : reg85[(1'h1):(1'h1)]) >> ((($unsigned(reg90) >>> $signed(reg62)) ?
                      {reg93, reg70} : reg83) ?
                  (^~(~^reg81)) : $unsigned(($signed(reg68) ?
                      (^~(8'hba)) : $signed(wire66)))));
            end
          if (reg80)
            begin
              reg91 <= $signed({((|reg81[(1'h0):(1'h0)]) ?
                      ($unsigned(reg73) || (reg87 ^ reg89)) : (~(wire61 ?
                          reg87 : reg88))),
                  $unsigned(reg71)});
              reg92 <= ((reg92 ?
                      $unsigned(reg75[(3'h6):(2'h2)]) : reg70[(1'h1):(1'h0)]) ?
                  reg64[(1'h0):(1'h0)] : (^~{($signed(wire51) || (reg69 | reg59))}));
              reg93 <= reg79[(2'h3):(1'h1)];
              reg94 <= {(~^($signed((8'ha1)) | $unsigned((wire52 ?
                      reg80 : wire76))))};
              reg95 <= reg67;
            end
          else
            begin
              reg91 <= ($unsigned((((wire52 - reg88) == reg92[(1'h0):(1'h0)]) != wire78)) ?
                  reg80 : $signed(({reg83} >> reg57[(1'h1):(1'h1)])));
              reg92 <= (((+wire53[(3'h5):(1'h0)]) ?
                  $unsigned(($signed(reg87) == $signed(reg81))) : (~^(|$signed(wire78)))) ~^ wire66);
              reg93 <= reg84[(3'h4):(2'h3)];
            end
          reg96 <= (((reg82 ?
                  $signed(reg93) : ($unsigned(reg75) ?
                      reg74[(4'h9):(3'h7)] : (wire66 ?
                          reg72 : reg67))) * $unsigned($unsigned(((8'ha5) > (8'ha0))))) ?
              (~wire61) : $signed($signed($signed(reg59[(3'h4):(1'h0)]))));
        end
    end
  assign wire97 = (^(reg79[(4'hf):(2'h3)] ? wire77 : reg67[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg98 <= $signed($signed($unsigned((reg96 ? (reg63 <<< reg71) : reg56))));
      reg99 <= reg57[(4'h9):(3'h4)];
      if (wire78[(1'h0):(1'h0)])
        begin
          if ($unsigned(reg62[(4'h8):(3'h7)]))
            begin
              reg100 <= reg56;
              reg101 <= $unsigned(reg86[(1'h1):(1'h1)]);
              reg102 <= reg62;
            end
          else
            begin
              reg100 <= wire53;
              reg101 <= (^~reg71);
              reg102 <= $signed(wire51[(5'h13):(1'h0)]);
              reg103 <= (reg94 ?
                  $signed(((8'hbd) || ((reg79 && (8'hbd)) || reg73[(2'h2):(2'h2)]))) : $signed($signed(reg65[(1'h1):(1'h0)])));
            end
          if (reg90)
            begin
              reg104 <= (8'hb3);
              reg105 <= reg81[(5'h13):(5'h11)];
              reg106 <= $unsigned(($unsigned((~&(8'ha8))) ?
                  {($unsigned((8'h9e)) ? (wire52 ^ reg57) : (8'hbc)),
                      (reg74[(2'h3):(1'h0)] ?
                          (reg96 ?
                              reg71 : reg79) : $unsigned(reg73))} : $signed(reg96)));
              reg107 <= (^~$signed((((|reg75) ? (wire61 > reg68) : (&reg104)) ?
                  {$signed(reg69)} : reg75)));
              reg108 <= $unsigned({($signed($signed((7'h41))) + reg91[(3'h6):(3'h4)]),
                  ($unsigned($signed(wire52)) ?
                      ((reg85 ? reg68 : reg85) ?
                          $signed((8'hac)) : (wire97 ~^ (7'h43))) : $unsigned($unsigned((8'haa))))});
            end
          else
            begin
              reg104 <= (8'ha6);
              reg105 <= reg72;
              reg106 <= (((^~wire60[(4'hc):(3'h5)]) ?
                  $unsigned(((|reg84) ?
                      wire76[(2'h3):(2'h3)] : wire51[(3'h7):(1'h1)])) : reg91[(4'h9):(3'h6)]) + (((^~$signed(reg100)) ^ {(reg95 >> reg105)}) ^ $signed(((~^reg91) * (reg100 & reg70)))));
              reg107 <= reg88;
            end
          reg109 <= (reg103 ?
              ((~^(reg67 ?
                  (wire66 | reg81) : reg80)) > $signed($signed(reg81[(4'h8):(1'h1)]))) : $signed(reg85[(1'h1):(1'h0)]));
          if (wire61)
            begin
              reg110 <= (8'ha3);
              reg111 <= (~&(reg87 ?
                  $signed($signed((reg104 - reg99))) : ({(wire50 + (8'hb7))} != (-$signed(reg89)))));
            end
          else
            begin
              reg110 <= $signed((((reg88 ?
                  reg109[(1'h1):(1'h1)] : (!(8'h9e))) >> $unsigned(((8'hb8) ?
                  wire52 : reg75))) * ((~|(reg57 ~^ reg57)) ?
                  (+$unsigned(reg75)) : $unsigned((reg79 ~^ wire55)))));
            end
        end
      else
        begin
          reg100 <= $signed((!$unsigned({$unsigned(reg59)})));
          reg101 <= $unsigned($signed({($unsigned(reg105) ?
                  ((8'ha7) ? reg70 : wire97) : $signed(wire50)),
              reg88[(2'h3):(2'h3)]}));
          reg102 <= $signed((($unsigned((^~reg65)) < reg108[(2'h2):(1'h1)]) ?
              (reg85 > reg63[(4'hc):(3'h6)]) : (wire66[(4'hf):(1'h1)] >> {reg57[(3'h7):(1'h1)]})));
        end
    end
  assign wire112 = ({((reg102 ?
                               reg109[(3'h5):(1'h0)] : (reg106 >>> reg82)) && {(|reg96)})} ?
                       wire51 : {($signed(reg75[(3'h7):(1'h1)]) + (~&(reg102 ?
                               reg111 : wire52)))});
  assign wire113 = (+(({reg106,
                       $signed(reg75)} > $unsigned(reg84[(4'hc):(3'h5)])) <<< $signed(((reg98 ?
                       reg79 : reg58) | (reg81 ? reg81 : reg59)))));
  assign wire114 = (~|(8'h9c));
  assign wire115 = (8'ha0);
  assign wire116 = (reg84[(4'hd):(2'h3)] ~^ {wire60[(4'h8):(4'h8)],
                       $unsigned({reg101[(4'h9):(3'h4)], (reg73 && reg67)})});
endmodule

module module21
#(parameter param43 = (((!(((8'ha2) ? (8'hb4) : (8'hb4)) && ((8'hb3) ? (8'hac) : (8'hbb)))) | (8'haa)) ? ((&({(8'ha4)} ? ((8'h9f) ? (8'hb6) : (8'hb2)) : ((8'ha4) ? (8'haf) : (8'h9d)))) ? ((((8'hbb) ? (8'ha9) : (8'ha1)) <= ((8'ha8) > (8'hab))) ^~ ((~^(7'h42)) >>> ((8'h9c) ? (8'ha6) : (8'hbd)))) : (8'hb3)) : ({(((8'hb8) * (7'h42)) & ((8'ha7) ? (8'ha6) : (8'hab))), {{(8'hb9)}}} | {{(8'hbe), ((8'hab) <= (8'ha8))}, (((8'hb2) + (8'hbe)) <<< (~^(7'h44)))})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= $signed($unsigned($signed((-{wire22}))));
      reg27 <= $unsigned(wire25);
      reg28 <= (-(wire23 < {((wire24 ? wire24 : reg27) ?
              (wire22 ? wire22 : reg26) : (!reg26)),
          {wire23[(3'h7):(1'h0)], reg26[(1'h1):(1'h1)]}}));
      reg29 <= reg26[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg30 <= $signed(wire23);
    end
  assign wire31 = ($unsigned($unsigned(reg30[(4'he):(4'h9)])) < (reg27[(2'h2):(2'h2)] ?
                      reg27 : $signed(((~&reg29) ?
                          reg30[(4'ha):(3'h5)] : {reg27}))));
  assign wire32 = reg29[(3'h4):(3'h4)];
  assign wire33 = ((~|wire25) ? wire22 : (!reg28));
  assign wire34 = wire22[(2'h2):(1'h0)];
  assign wire35 = $signed(reg26[(1'h1):(1'h0)]);
  assign wire36 = {(reg27 + (~&wire23))};
  assign wire37 = $unsigned(wire32[(3'h4):(1'h0)]);
  assign wire38 = $unsigned(wire35[(2'h3):(2'h2)]);
  assign wire39 = (7'h40);
  assign wire40 = $unsigned((^~$signed($signed((~&(8'hb7))))));
  assign wire41 = {(|(wire22[(1'h1):(1'h1)] ?
                          (~^((8'hac) ? wire35 : wire25)) : $signed((wire40 ?
                              wire36 : (8'hbe)))))};
  assign wire42 = (8'hb9);
endmodule
