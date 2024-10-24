module top
#(parameter param177 = (((^(~^((8'hb1) || (8'ha8)))) << (8'h9f)) ~^ ({(~&(~&(8'haa))), {((8'hbe) ? (8'hb9) : (8'haf)), {(8'haa)}}} ? (!(((7'h42) & (8'ha5)) ? {(8'hba), (8'ha3)} : ((8'hb8) ? (8'haf) : (8'hb0)))) : (!(~&{(8'hb9), (8'ha3)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire166;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire169;
  wire signed [(4'hf):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire172;
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  assign y = {wire166,
                 wire114,
                 wire113,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire16,
                 wire26,
                 wire111,
                 wire169,
                 wire170,
                 wire171,
                 wire172,
                 reg176,
                 reg175,
                 reg174,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg15,
                 reg14,
                 reg6,
                 reg5,
                 reg168,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned($unsigned((^{wire1, wire2}))) ?
          ($unsigned((~wire4)) ?
              wire3[(3'h6):(2'h3)] : (8'hac)) : wire2[(3'h5):(2'h3)]);
      reg6 <= {$unsigned({(-{wire0}), wire3[(3'h5):(2'h3)]})};
    end
  assign wire7 = wire4;
  assign wire8 = $unsigned(wire2[(4'hd):(1'h0)]);
  assign wire9 = (|(!($unsigned((wire0 ?
                     wire0 : wire2)) || ($signed(wire1) ~^ wire3[(3'h4):(2'h2)]))));
  assign wire10 = $signed($signed($unsigned(({wire3,
                      wire2} != ((8'h9c) * (8'h9e))))));
  assign wire11 = (wire7[(4'h8):(1'h1)] ?
                      wire8 : (wire2[(3'h5):(1'h0)] ?
                          (wire2 <= ($signed(reg5) ?
                              $signed(wire9) : (~wire8))) : $signed($signed(wire4))));
  assign wire12 = {wire3};
  assign wire13 = (~&((($signed((8'hbf)) ^ wire1[(2'h2):(1'h1)]) ?
                      wire11 : wire8[(1'h0):(1'h0)]) || $signed(($unsigned(wire10) <<< wire1))));
  always
    @(posedge clk) begin
      reg14 <= $unsigned(({$signed($signed((8'hb0)))} == reg6));
      reg15 <= (((^~wire10[(2'h2):(1'h0)]) ?
          wire9[(3'h5):(2'h3)] : (~(^~(~wire10)))) > $unsigned({((-reg6) <<< wire9[(2'h2):(2'h2)])}));
    end
  assign wire16 = ($signed($signed((wire3 ?
                      (+wire8) : $signed(wire2)))) ^~ ($unsigned(((wire2 ?
                              reg6 : wire8) ?
                          {(8'h9d)} : (wire2 == wire11))) ?
                      {(wire2[(3'h7):(3'h4)] >> wire10)} : (^$signed((^wire2)))));
  always
    @(posedge clk) begin
      reg17 <= (wire0 ?
          ({$unsigned((wire2 ? wire2 : wire4))} ?
              wire2 : wire0[(3'h7):(3'h7)]) : $signed($unsigned($signed(wire11[(2'h2):(1'h1)]))));
      reg18 <= (wire13[(2'h3):(1'h1)] ?
          $signed(((~((8'hbf) ?
              reg17 : (8'had))) >>> $unsigned($unsigned(wire12)))) : reg14);
      if ($unsigned({((~^$unsigned(wire2)) - ((wire1 >>> (8'ha4)) ?
              ((8'ha7) - reg6) : $unsigned(wire10)))}))
        begin
          if (($unsigned(wire0[(4'h9):(3'h6)]) ^~ (reg5 ?
              reg18[(4'h8):(1'h0)] : ((~&(wire4 <= wire0)) + ((^~wire7) == wire0[(4'h9):(3'h5)])))))
            begin
              reg19 <= (reg6[(3'h6):(2'h3)] ?
                  $unsigned($signed({$signed(wire12),
                      $signed(reg15)})) : $unsigned({$signed((wire9 ?
                          wire10 : wire9)),
                      wire10[(1'h1):(1'h1)]}));
              reg20 <= ({wire3, wire4} | $signed(($unsigned(wire0) >= ((wire11 ?
                      reg15 : wire8) ?
                  (reg15 == wire16) : {wire4, reg19}))));
            end
          else
            begin
              reg19 <= $signed($signed((^~(reg5 ?
                  wire12[(3'h6):(3'h5)] : (~&wire0)))));
              reg20 <= (8'ha3);
            end
          reg21 <= wire16;
          reg22 <= reg5;
          reg23 <= $signed(({reg20,
              (wire9 ^~ (wire4 ? (7'h44) : wire10))} + reg20));
        end
      else
        begin
          reg19 <= (^~reg6);
          reg20 <= (wire0 ? reg21 : wire1);
        end
      reg24 <= ((((8'hac) ~^ (~|(wire10 > wire0))) << (reg17[(1'h1):(1'h0)] ?
              {$signed(wire1),
                  wire12[(2'h3):(1'h1)]} : ((~|reg20) == (reg23 ^~ wire2)))) ?
          $signed(reg20) : reg23[(1'h1):(1'h0)]);
      reg25 <= $unsigned(($signed($unsigned((|wire4))) || wire11[(3'h5):(1'h0)]));
    end
  assign wire26 = $signed($unsigned($unsigned((~^(~&wire3)))));
  always
    @(posedge clk) begin
      reg27 <= {(^reg14), $unsigned($unsigned($unsigned(wire10)))};
    end
  module28 #() modinst112 (wire111, clk, reg19, reg20, wire26, reg23);
  assign wire113 = reg5[(1'h0):(1'h0)];
  assign wire114 = $unsigned(reg15);
  module115 #() modinst167 (wire166, clk, wire113, wire4, wire13, wire3, wire2);
  always
    @(posedge clk) begin
      reg168 <= (((+wire9[(3'h4):(2'h3)]) * $signed((8'h9f))) ?
          (~|wire9[(4'hb):(3'h5)]) : ((((!reg21) ?
                      (|wire8) : (wire12 == wire111)) ?
                  wire13 : ($signed((8'h9e)) ?
                      wire9[(2'h2):(1'h0)] : ((8'ha1) <= wire114))) ?
              (wire114[(4'hc):(4'hc)] >= ($signed(wire16) <= $signed(wire114))) : $unsigned((reg22 == reg27[(4'h8):(4'h8)]))));
    end
  assign wire169 = reg24[(4'hd):(1'h1)];
  assign wire170 = (8'ha8);
  assign wire171 = ($unsigned(wire26[(2'h2):(1'h0)]) ?
                       (+((~&(reg23 || reg168)) ^~ ($signed(reg25) << $signed(reg27)))) : $unsigned(((~&(wire9 ?
                               wire3 : reg6)) ?
                           wire16 : $signed(wire2[(3'h7):(3'h7)]))));
  module88 #() modinst173 (wire172, clk, reg25, wire111, wire170, wire2);
  always
    @(posedge clk) begin
      reg174 <= (~&(~^$signed($unsigned($unsigned(reg21)))));
      reg175 <= $signed((+(^~wire7[(3'h7):(2'h3)])));
      reg176 <= wire16[(3'h6):(1'h0)];
    end
endmodule

module module115
#(parameter param165 = (&(((((8'hb6) == (8'ha6)) <= (8'haf)) ? (^~{(8'ha5)}) : (-(+(8'ha1)))) ~^ ({((8'ha4) == (7'h41))} >= ((8'hb7) * ((8'hae) <= (8'ha3)))))))
(y, clk, wire116, wire117, wire118, wire119, wire120);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire116;
  input wire signed [(3'h4):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire118;
  input wire [(5'h12):(1'h0)] wire119;
  input wire [(3'h7):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire155;
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  assign y = {wire164,
                 wire157,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire129,
                 wire130,
                 wire155,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire121 = wire118;
  assign wire122 = (8'hb7);
  assign wire123 = (((wire116[(3'h7):(2'h2)] > ($unsigned(wire118) ?
                       {wire120,
                           wire121} : $signed(wire117))) != ((+(~|(8'ha4))) >> wire121)) - wire122);
  assign wire124 = $signed($unsigned((8'haa)));
  assign wire125 = (wire118[(3'h4):(3'h4)] == (^wire124));
  always
    @(posedge clk) begin
      reg126 <= (^~$unsigned($signed({$signed(wire121), $unsigned(wire123)})));
      reg127 <= wire117[(1'h1):(1'h1)];
      reg128 <= wire116[(3'h6):(1'h1)];
    end
  assign wire129 = (~^{wire122});
  assign wire130 = (($signed(wire117[(1'h0):(1'h0)]) ?
                       $signed(wire129) : ($signed({wire120, (8'h9d)}) ?
                           $signed($signed(wire120)) : wire129)) >= (reg127 > $unsigned((wire121 ^~ wire116))));
  module131 #() modinst156 (wire155, clk, wire122, wire119, wire121, wire123, wire116);
  assign wire157 = $signed($unsigned(wire118));
  always
    @(posedge clk) begin
      if (wire129[(4'he):(4'h9)])
        begin
          reg158 <= (~(($unsigned($unsigned(wire157)) * (8'hae)) ?
              $signed($unsigned(wire157)) : wire123[(4'hc):(4'hc)]));
          reg159 <= {(~|$unsigned($unsigned($unsigned((8'had))))),
              $signed((&((&wire120) ~^ {(8'ha0)})))};
          reg160 <= wire123[(2'h2):(1'h1)];
        end
      else
        begin
          reg158 <= {wire155[(1'h0):(1'h0)],
              ($unsigned(wire124) ?
                  (&$signed((wire125 + wire155))) : ($signed($signed(reg158)) ?
                      $signed(reg127[(4'he):(3'h7)]) : wire119[(2'h3):(1'h0)]))};
          if ({$unsigned($unsigned({wire118[(4'he):(2'h3)]})),
              (wire130 ? $unsigned(wire120) : wire124[(3'h5):(2'h3)])})
            begin
              reg159 <= wire120;
              reg160 <= ($signed($unsigned(((wire130 ?
                  wire120 : wire129) >= {wire129}))) << reg126);
            end
          else
            begin
              reg159 <= $signed(wire123[(4'h9):(3'h5)]);
              reg160 <= wire123[(3'h7):(2'h2)];
            end
          reg161 <= $unsigned(($signed(((reg127 ? reg160 : wire117) ?
                  $signed(wire122) : reg128)) ?
              wire117 : {($signed(wire129) != wire124)}));
          reg162 <= (^~$signed($unsigned($unsigned($signed(wire157)))));
        end
      reg163 <= wire120;
    end
  assign wire164 = $signed((+((^(wire117 ? wire123 : wire121)) ?
                       (-$signed(wire117)) : ((wire155 ? wire122 : reg159) ?
                           (8'ha3) : (wire120 ? (8'haa) : wire117)))));
endmodule

module module28
#(parameter param109 = ((~({((8'hba) ^ (8'hb8))} ? (((8'had) ? (8'hbb) : (7'h43)) && ((8'hb0) && (8'hba))) : {(|(8'hb4))})) ? {(!(8'hb7))} : {((8'hb8) ? (~^{(8'ha9), (8'hbf)}) : {((8'hac) ? (8'hbb) : (8'hae))})}), 
parameter param110 = (8'haa))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire87,
                 wire85,
                 wire33,
                 reg108,
                 (1'h0)};
  assign wire33 = (((~^$unsigned(wire31[(5'h12):(3'h5)])) ?
                      (wire30 <= (~&(^wire32))) : $unsigned(wire30)) <<< {$unsigned($signed((~wire32))),
                      ((&$unsigned(wire30)) <<< (!wire32[(3'h5):(1'h0)]))});
  module34 #() modinst86 (wire85, clk, wire31, wire32, wire30, wire29);
  assign wire87 = {$signed($signed($signed((wire30 ? wire33 : wire85))))};
  module88 #() modinst102 (.wire91(wire32), .clk(clk), .wire89(wire33), .wire92(wire31), .wire90(wire30), .y(wire101));
  assign wire103 = ({$signed(wire87)} ?
                       (~&{$unsigned((wire87 ? (8'hae) : wire85)),
                           $unsigned((wire31 ? wire101 : wire87))}) : wire33);
  assign wire104 = wire87;
  assign wire105 = wire104[(1'h1):(1'h1)];
  assign wire106 = $signed(((wire33 | ({wire104} ?
                       (wire32 >>> wire32) : (wire30 && (8'ha4)))) << (wire31[(5'h10):(1'h0)] < (wire103 ?
                       (wire33 ? wire32 : wire29) : (8'hab)))));
  assign wire107 = $unsigned(wire30);
  always
    @(posedge clk) begin
      reg108 <= wire101[(1'h0):(1'h0)];
    end
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire92;
  input wire [(4'he):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire93 = $signed(($signed($unsigned((wire91 ? wire89 : wire89))) ?
                      wire91 : ((~^(wire89 ?
                          wire91 : (8'ha3))) && wire92[(4'hb):(4'h8)])));
  assign wire94 = wire92;
  assign wire95 = (($signed({(wire91 ? wire91 : wire91),
                          wire89}) < wire91[(4'hb):(4'h8)]) ?
                      wire94[(2'h2):(1'h1)] : ($signed({(wire91 ^ wire92),
                              wire90[(4'h9):(3'h5)]}) ?
                          (~^(+(^wire94))) : {wire93}));
  assign wire96 = ((wire90[(4'ha):(3'h7)] ?
                      {((wire94 || (8'hbc)) ? (&(8'hb5)) : $signed(wire92)),
                          wire93[(3'h4):(3'h4)]} : ($unsigned($signed((8'hb0))) <= ($signed(wire94) && wire95))) >>> ((((wire91 ?
                          wire94 : (8'hb4)) ?
                      $signed(wire89) : $unsigned(wire91)) > (~^(!wire92))) >= {((wire92 || wire95) && $signed(wire94))}));
  assign wire97 = $signed((($unsigned((wire96 ? wire94 : wire93)) ?
                          {wire92[(1'h0):(1'h0)]} : ($signed(wire89) ?
                              ((8'hb1) >> (7'h43)) : $signed(wire96))) ?
                      (!((wire89 ^ wire93) + $signed((8'ha5)))) : wire91[(4'hd):(2'h3)]));
  always
    @(posedge clk) begin
      reg98 <= ($signed(({wire92} ?
              wire95[(5'h11):(5'h11)] : ({(8'ha6), wire94} || (+wire94)))) ?
          $signed((~$unsigned((~wire89)))) : $unsigned(wire89[(3'h5):(3'h4)]));
      reg99 <= (!{(8'h9e), wire96});
      reg100 <= (^{((+(wire96 ? (8'hb4) : reg98)) != ($unsigned(wire89) ?
              (^wire96) : (&wire95)))});
    end
endmodule

module module34
#(parameter param83 = ({(({(7'h43), (8'ha3)} ? (+(8'hb0)) : ((8'h9f) <= (8'h9d))) ? (((8'ha2) <<< (8'hb6)) ? {(8'hb2), (8'ha9)} : {(8'ha3), (8'ha1)}) : (((8'h9f) ? (8'hae) : (7'h41)) ? ((8'hba) >= (8'hbd)) : (^~(8'ha8)))), ((|(&(8'hba))) ? ((&(8'ha9)) ^ {(8'hb4)}) : ({(8'ha2), (8'hbf)} < ((8'hb6) - (8'haa))))} ? (~&(|({(8'ha2)} ? {(8'hb9)} : (~&(8'ha5))))) : (~&((&((8'h9e) ? (8'hb0) : (7'h41))) ? ({(8'haf), (7'h40)} ? {(8'hbd)} : (&(8'ha1))) : ((^(8'haa)) ? ((8'h9c) <= (8'hb4)) : ((7'h42) ? (8'ha1) : (8'ha8)))))), 
parameter param84 = (param83 ? ((^(^~(param83 ? (8'ha6) : (8'hb9)))) ? ({{param83, param83}} << param83) : param83) : ((param83 ? ((param83 ? param83 : (8'ha4)) + param83) : (!param83)) ? (param83 || param83) : (|param83))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(5'h10):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire39;
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire39,
                 reg77,
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
                 reg54,
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
                 (1'h0)};
  assign wire39 = $signed(($signed(({(8'haf)} ?
                          $unsigned(wire35) : wire35[(4'he):(1'h0)])) ?
                      {({wire37} ? (^wire37) : (~wire36)),
                          ((wire35 != wire38) ?
                              $signed(wire38) : (wire38 ^ wire37))} : (wire35[(3'h5):(2'h2)] || wire37[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg40 <= (wire38 ?
          (~&wire36[(4'hb):(1'h1)]) : (!{$signed(wire35[(4'hc):(4'hc)])}));
    end
  always
    @(posedge clk) begin
      if ((&(((&$unsigned(wire39)) ?
          {(wire38 ? wire39 : wire38),
              (wire36 < (8'ha8))} : wire36[(4'he):(3'h5)]) * wire37)))
        begin
          reg41 <= (!wire36);
          if ((~&reg41[(1'h1):(1'h0)]))
            begin
              reg42 <= $signed($unsigned(wire37));
              reg43 <= reg41[(1'h0):(1'h0)];
              reg44 <= (~&{reg40[(3'h7):(3'h4)],
                  ((~(wire36 || wire39)) < ((8'hb1) + (wire36 == (8'hb6))))});
              reg45 <= $signed(reg44);
            end
          else
            begin
              reg42 <= reg42;
              reg43 <= $signed(((-($unsigned(reg42) >>> $signed(reg42))) ?
                  {((reg45 >> wire37) & {wire39})} : (+$signed((reg42 ?
                      wire38 : wire35)))));
              reg44 <= $unsigned(reg45);
              reg45 <= $signed(wire37[(1'h0):(1'h0)]);
            end
          reg46 <= (($unsigned(((&(8'ha8)) && $unsigned((8'hb8)))) ?
              (reg44 | (-(&wire35))) : wire36) <<< (~&(8'ha6)));
          reg47 <= ((7'h44) ?
              {reg44[(1'h1):(1'h0)],
                  (^~{((7'h41) ? wire35 : reg44)})} : reg42[(2'h3):(1'h0)]);
          if ($unsigned(((reg45[(2'h3):(1'h1)] > (|wire36)) * (reg41[(1'h0):(1'h0)] ?
              (^reg46[(1'h1):(1'h0)]) : $signed((^~wire39))))))
            begin
              reg48 <= (reg44 ? {(8'ha3)} : wire37);
              reg49 <= wire37;
              reg50 <= (^$signed($signed($unsigned($unsigned((8'hab))))));
              reg51 <= wire39[(3'h4):(1'h0)];
            end
          else
            begin
              reg48 <= $signed($unsigned(reg50[(4'h8):(1'h0)]));
              reg49 <= (reg48[(3'h6):(3'h5)] ^~ (~(reg44[(1'h0):(1'h0)] * (reg47[(3'h6):(3'h4)] <= (reg44 >> (8'ha1))))));
              reg50 <= (({(~&{reg43, reg41})} ^ {$unsigned({(8'hb1)}),
                  (reg43 ? $signed(reg43) : reg49[(1'h1):(1'h1)])}) - reg46);
              reg51 <= reg50;
            end
        end
      else
        begin
          reg41 <= reg48[(2'h2):(1'h0)];
          if ($unsigned(($unsigned(($signed((8'hb7)) != reg42[(1'h1):(1'h0)])) ~^ reg47)))
            begin
              reg42 <= wire37;
              reg43 <= (~&$signed((^reg46)));
              reg44 <= $unsigned($unsigned((&{(-reg44)})));
              reg45 <= wire38;
              reg46 <= (!(~^reg44[(3'h4):(2'h3)]));
            end
          else
            begin
              reg42 <= (wire39[(4'hf):(4'hd)] * reg44[(3'h4):(1'h1)]);
              reg43 <= $signed((!(wire37[(2'h2):(1'h0)] ^~ (&$signed(reg42)))));
              reg44 <= (((reg40[(1'h1):(1'h1)] ?
                  reg47 : ((|reg42) == (reg50 ?
                      wire39 : wire35))) * $signed((8'hbe))) & reg45[(1'h0):(1'h0)]);
              reg45 <= ((reg41 ?
                  {(8'ha6),
                      $signed(reg43[(4'hb):(4'hb)])} : reg48) <= wire35[(4'hc):(3'h7)]);
              reg46 <= $unsigned(reg48[(4'h8):(1'h0)]);
            end
        end
    end
  assign wire52 = (((~$signed((^reg46))) ?
                      $signed(reg45[(1'h1):(1'h0)]) : reg50[(4'h9):(2'h2)]) - reg41[(2'h2):(1'h1)]);
  assign wire53 = {((((-reg43) <= (wire39 - reg49)) | (+(reg51 < (8'ha1)))) ?
                          (($signed(wire37) ?
                                  (wire37 ?
                                      (8'h9c) : (8'hbe)) : (reg47 > wire39)) ?
                              ((wire52 & reg49) ?
                                  (reg49 ?
                                      reg46 : reg42) : $signed(reg48)) : $unsigned($signed(reg44))) : (&wire39[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      reg54 <= (~|$signed((reg51 ?
          (~|$signed((7'h41))) : ((~reg40) - $signed(reg47)))));
    end
  assign wire55 = wire53[(2'h2):(1'h0)];
  assign wire56 = (reg45 ? (reg40 ? reg49 : {reg43}) : wire39);
  assign wire57 = (-((|wire55) ?
                      {wire35[(4'ha):(1'h1)],
                          {(reg41 <<< reg42),
                              (wire53 ? wire39 : reg48)}} : (reg48 ?
                          (~|(wire53 ? reg54 : reg48)) : reg41)));
  assign wire58 = reg48[(3'h4):(1'h0)];
  assign wire59 = ($signed(wire37[(2'h3):(1'h1)]) ?
                      $signed(($signed($unsigned((8'ha5))) ?
                          ((8'h9f) ?
                              reg49 : (reg43 <= reg51)) : (reg50[(2'h3):(1'h0)] ?
                              reg47 : reg48))) : ((($unsigned(wire36) ?
                          (~|reg47) : (^wire39)) ^ ((reg51 ? wire58 : reg49) ?
                          (!wire53) : ((8'hb0) <<< wire36))) < (((wire55 >>> reg51) ?
                              wire58[(3'h7):(3'h5)] : $signed(reg49)) ?
                          $signed(wire56[(3'h6):(3'h5)]) : (wire52[(4'ha):(3'h6)] ?
                              (+reg50) : (!reg49)))));
  always
    @(posedge clk) begin
      reg60 <= (((wire52[(2'h2):(1'h1)] ?
              ($signed(reg41) >= reg48) : ($signed(reg41) == wire56[(3'h4):(3'h4)])) ?
          {($unsigned(wire52) ~^ (~&wire36)),
              (~|$unsigned(wire53))} : ($signed((reg44 ?
              reg47 : wire53)) ^~ $signed((reg48 * wire53)))) << $signed(reg50[(1'h0):(1'h0)]));
      reg61 <= reg44[(2'h2):(1'h1)];
      if ((7'h40))
        begin
          reg62 <= ($unsigned(((reg48[(1'h1):(1'h1)] ?
              {(7'h40), reg44} : $signed(reg54)) ^ ($signed(reg46) ?
              reg43 : ((8'h9c) ?
                  wire36 : wire38)))) && $signed({(^reg46[(4'h9):(3'h4)])}));
          reg63 <= ($signed(((&$signed(reg42)) ?
              wire39[(5'h11):(5'h10)] : $unsigned(wire38))) << $unsigned(($signed($signed(wire53)) < ({(7'h42)} < reg61[(4'he):(1'h0)]))));
          reg64 <= {(wire38 ?
                  ({(8'ha5), (7'h41)} <= {(wire59 ? reg51 : wire56),
                      (~wire56)}) : $unsigned(((8'hbc) ?
                      reg47[(3'h7):(3'h4)] : $unsigned((8'ha8)))))};
          reg65 <= $signed((~&$unsigned(reg49)));
          if (($signed((((reg50 ?
              reg47 : wire58) || wire57[(4'h9):(2'h2)]) <<< ($unsigned(reg46) | reg41[(1'h0):(1'h0)]))) & reg65))
            begin
              reg66 <= (-(|reg62[(2'h2):(1'h0)]));
              reg67 <= reg65;
            end
          else
            begin
              reg66 <= reg45;
              reg67 <= (|reg49[(2'h3):(2'h2)]);
              reg68 <= (~$signed(wire59[(4'hd):(1'h1)]));
              reg69 <= ({(!(~^(wire56 ? (8'haf) : (8'ha2))))} ?
                  (((8'haf) - $signed(reg68)) <<< (~|({(8'hbf), reg46} ?
                      $unsigned(reg61) : reg63))) : $unsigned({$unsigned(wire39),
                      $unsigned(reg43)}));
            end
        end
      else
        begin
          if ((+(reg44[(3'h4):(2'h3)] ?
              $signed(reg50[(2'h2):(2'h2)]) : (reg49 <<< (reg49[(1'h1):(1'h0)] && (reg54 ?
                  reg69 : reg50))))))
            begin
              reg62 <= $unsigned($signed((!wire59)));
            end
          else
            begin
              reg62 <= $unsigned({{({wire37, reg60} ~^ (8'ha6))},
                  $signed(reg50)});
              reg63 <= $unsigned(wire58[(3'h5):(3'h4)]);
            end
          reg64 <= reg41;
          if (((wire37 ?
              {({wire36, reg68} ? wire39 : {(8'hb1)})} : (~$signed({reg43,
                  reg43}))) > $unsigned({(^~reg44[(2'h3):(2'h3)]),
              ($signed(reg64) * (reg61 ? wire38 : reg66))})))
            begin
              reg65 <= $signed(reg50[(4'h9):(2'h3)]);
              reg66 <= (7'h44);
              reg67 <= (8'ha6);
              reg68 <= $signed((($signed((8'ha5)) ?
                  (^$unsigned(wire57)) : wire38) != reg66[(4'he):(2'h3)]));
              reg69 <= wire56[(2'h2):(1'h1)];
            end
          else
            begin
              reg65 <= {$signed($signed($unsigned(reg48))),
                  $signed(wire52[(4'hb):(3'h7)])};
              reg66 <= $signed(reg67);
              reg67 <= ((~&$unsigned({(^reg60), (8'hb1)})) ?
                  (^(~$unsigned((wire38 - wire35)))) : (8'haf));
              reg68 <= (~(8'hb0));
            end
        end
      if ((wire38 ? wire38 : (reg60 | reg51)))
        begin
          reg70 <= {$signed(($unsigned(((8'ha3) != reg50)) > ($unsigned(wire52) >> (8'hb3)))),
              $unsigned($unsigned({(|wire52)}))};
          reg71 <= (wire37 <<< {(^~$unsigned($unsigned(reg62)))});
        end
      else
        begin
          reg70 <= (reg51[(1'h1):(1'h1)] > ((reg51[(3'h6):(1'h1)] > $unsigned((&reg70))) >>> reg41));
          reg71 <= (((((reg49 ? reg61 : wire37) ? {reg71, reg54} : reg41) ?
                  (^~$unsigned(reg50)) : {(wire57 ~^ wire55)}) >= reg71[(5'h12):(3'h6)]) ?
              reg68[(3'h5):(1'h0)] : $signed((((^~reg64) ?
                      wire39[(5'h10):(3'h5)] : reg45[(2'h3):(1'h1)]) ?
                  reg65 : reg50)));
          reg72 <= reg51[(1'h1):(1'h1)];
          reg73 <= wire53[(3'h6):(3'h5)];
        end
    end
  assign wire74 = wire37;
  assign wire75 = $signed($unsigned($signed(($signed(reg41) & ((8'hbf) ^ (8'hac))))));
  assign wire76 = (^~wire39);
  always
    @(posedge clk) begin
      reg77 <= $unsigned($signed(((reg49 == $signed(wire38)) >>> (^~(wire57 ^ reg43)))));
    end
  assign wire78 = (reg51[(1'h0):(1'h0)] == ((reg68 ?
                      $unsigned($unsigned(wire36)) : (8'haa)) >> ($signed(wire58[(3'h4):(3'h4)]) <<< $unsigned($unsigned(reg77)))));
  assign wire79 = $unsigned({$signed((reg54 & (reg44 << wire55))),
                      $unsigned(((reg54 >= wire75) || wire57))});
  assign wire80 = ((~(((^~wire35) <<< $signed(wire75)) * (|$signed(reg69)))) ?
                      reg63[(1'h0):(1'h0)] : reg71[(2'h3):(1'h0)]);
  assign wire81 = $signed($signed((reg69 ? $unsigned(reg43) : wire78)));
  assign wire82 = (((($unsigned(reg50) ?
                      reg69 : reg69[(1'h1):(1'h1)]) - reg50) > ($signed((8'ha4)) || $unsigned(((8'hb1) ^ reg67)))) <<< $unsigned(($unsigned({reg77}) * $signed(wire38))));
endmodule

module module131
#(parameter param153 = (~^(^((((8'hae) ? (8'hb0) : (8'had)) ? ((7'h43) ? (8'hb9) : (8'hb6)) : ((8'ha3) > (8'hb7))) ? (((7'h43) << (7'h40)) ? ((8'haf) ? (7'h43) : (8'hb7)) : (^~(8'hb7))) : (^~{(8'haa)})))), 
parameter param154 = ((&{(param153 & (param153 ^ (8'hb1))), param153}) != (^{{((8'ha8) >> param153), param153}, param153})))
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire136;
  input wire [(3'h5):(1'h0)] wire135;
  input wire signed [(3'h7):(1'h0)] wire134;
  input wire signed [(2'h2):(1'h0)] wire133;
  input wire [(5'h13):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 reg149,
                 (1'h0)};
  assign wire137 = (^~{wire135[(3'h4):(3'h4)], wire133});
  assign wire138 = $signed($signed(((~(!wire133)) ?
                       $signed((~^wire133)) : (wire135[(3'h4):(3'h4)] ^ {wire135}))));
  assign wire139 = {$unsigned($unsigned(wire134)), wire138};
  assign wire140 = (~^$signed(wire135));
  assign wire141 = $unsigned($signed($signed($signed((wire140 ?
                       wire135 : wire133)))));
  assign wire142 = wire132;
  assign wire143 = $signed(wire140[(5'h13):(4'hd)]);
  assign wire144 = $unsigned($unsigned((($signed((8'hba)) >= wire142[(4'h8):(1'h0)]) ~^ wire138)));
  assign wire145 = wire144;
  assign wire146 = wire140[(5'h13):(4'hf)];
  assign wire147 = $unsigned(wire146[(5'h14):(5'h10)]);
  assign wire148 = ($signed(($signed($unsigned((8'ha6))) ?
                       (~^wire144[(1'h1):(1'h0)]) : $signed((wire140 ?
                           wire147 : wire147)))) >> wire132[(5'h13):(2'h2)]);
  always
    @(posedge clk) begin
      reg149 <= wire139;
    end
  assign wire150 = (^(-wire144));
  assign wire151 = (($signed($unsigned((wire145 ^~ wire143))) >> $unsigned($signed($signed(wire144)))) | wire142[(2'h2):(2'h2)]);
  assign wire152 = {wire150};
endmodule
