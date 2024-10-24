module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire [(5'h13):(1'h0)] wire171;
  wire signed [(2'h3):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire169;
  wire [(4'h9):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire [(5'h10):(1'h0)] wire166;
  wire [(5'h14):(1'h0)] wire165;
  wire signed [(5'h10):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire117;
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire119,
                 wire117,
                 reg175,
                 reg174,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 (1'h0)};
  module5 #() modinst118 (wire117, clk, wire0, wire3, wire2, wire4, wire1);
  assign wire119 = (wire4 ?
                       ($signed({((8'hb8) ? wire1 : wire3)}) ?
                           $signed((wire0[(1'h1):(1'h1)] ?
                               {(8'hb2),
                                   wire3} : wire0[(4'h8):(2'h3)])) : (&{wire1,
                               {wire0,
                                   wire3}})) : (wire1[(1'h0):(1'h0)] >>> wire1[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      if ({$signed(wire2[(1'h0):(1'h0)])})
        begin
          reg120 <= ($signed(wire1) ?
              wire0[(1'h1):(1'h1)] : (((|wire4[(4'hd):(4'h9)]) ?
                  wire2[(2'h2):(1'h1)] : ((!wire2) ?
                      (8'haf) : (wire119 + wire4))) && (~&(wire1 ?
                  (+wire2) : (wire117 ? wire1 : wire1)))));
          reg121 <= (wire1 >>> $signed(((((8'ha1) ?
                  wire117 : (7'h44)) >>> reg120[(4'ha):(1'h1)]) ?
              ((wire119 * wire4) >> $signed(wire0)) : wire3)));
          if ($unsigned(({$unsigned({wire4, reg121})} >>> {wire117,
              (wire4[(4'he):(1'h0)] ^ wire117)})))
            begin
              reg122 <= $signed((wire117 ?
                  $signed(($signed((8'hba)) || (!wire119))) : reg121));
              reg123 <= reg122[(2'h3):(2'h3)];
            end
          else
            begin
              reg122 <= (-reg123[(2'h2):(1'h0)]);
              reg123 <= $unsigned((|(reg121[(2'h3):(2'h3)] ?
                  (^~(reg121 - wire3)) : (!$unsigned(reg122)))));
            end
          reg124 <= wire1;
        end
      else
        begin
          if ($signed((^~$unsigned({(reg120 ? reg120 : wire1),
              $signed(reg124)}))))
            begin
              reg120 <= reg124[(4'h9):(1'h1)];
              reg121 <= $signed($unsigned({(reg124[(3'h7):(3'h4)] <= (wire117 ?
                      wire2 : wire1))}));
              reg122 <= wire117[(1'h1):(1'h1)];
              reg123 <= $signed(reg123[(3'h6):(2'h3)]);
            end
          else
            begin
              reg120 <= (&(((wire117[(1'h1):(1'h0)] ?
                  reg120 : {reg124}) && (^(reg122 <<< reg121))) <= $unsigned(((wire0 ?
                      reg121 : wire2) ?
                  $signed(wire1) : (wire3 < (8'hbb))))));
              reg121 <= (~({wire4[(2'h3):(2'h3)]} ?
                  reg123[(3'h7):(3'h6)] : $signed(wire1)));
              reg122 <= ((~|$signed(reg120[(4'hc):(3'h6)])) ?
                  (~&{($unsigned(wire0) ?
                          wire1 : reg124[(1'h1):(1'h1)])}) : $unsigned(wire117[(1'h1):(1'h0)]));
              reg123 <= (wire2 * ((8'ha5) ? $unsigned({{reg124}}) : {wire3}));
            end
        end
      reg125 <= {$signed(((+reg124[(3'h7):(1'h0)]) ^ (+$signed((7'h44)))))};
    end
  assign wire126 = reg123[(1'h0):(1'h0)];
  assign wire127 = $signed(wire126);
  assign wire128 = {{(!(~^(~(8'ha6))))},
                       (reg125[(3'h6):(2'h3)] ^ $unsigned($signed((~|reg121))))};
  assign wire129 = (-(reg120[(1'h1):(1'h1)] ?
                       $unsigned((reg125 ~^ reg122[(3'h5):(1'h0)])) : (({reg120,
                               wire119} & (wire117 ? wire128 : wire3)) ?
                           (((8'hb9) ^ (8'hbd)) ?
                               wire119[(3'h5):(1'h1)] : wire126) : wire3)));
  module130 #() modinst164 (.wire132(wire2), .wire135(reg120), .wire131(wire0), .clk(clk), .wire134(wire127), .y(wire163), .wire133(wire128));
  assign wire165 = (wire4 ?
                       $unsigned($signed(wire119)) : $signed($signed($unsigned($signed(wire127)))));
  assign wire166 = ($unsigned((+({wire119} ?
                       wire0[(2'h3):(2'h3)] : (wire3 > wire2)))) * $unsigned((8'hbc)));
  assign wire167 = {$signed((!(8'hb6)))};
  assign wire168 = wire126;
  assign wire169 = $unsigned(reg120);
  assign wire170 = wire119[(1'h0):(1'h0)];
  assign wire171 = wire165;
  assign wire172 = (((+wire171) ? wire126[(2'h3):(1'h1)] : (~{(|reg121)})) ?
                       {{reg125[(3'h5):(2'h2)]},
                           $unsigned($signed($unsigned(reg122)))} : (~|wire3[(5'h11):(4'h9)]));
  assign wire173 = $signed({($unsigned({wire0, wire4}) ?
                           (wire119 + (^reg125)) : (8'ha7))});
  always
    @(posedge clk) begin
      reg174 <= wire165;
      reg175 <= reg123;
    end
  assign wire176 = ((($signed($unsigned(reg124)) > ((|wire169) ^~ (8'hbf))) ?
                       $signed($unsigned($signed(wire170))) : (~&(^~reg175[(3'h4):(2'h3)]))) >> $signed((8'hb7)));
  assign wire177 = wire0[(4'hc):(4'h8)];
  assign wire178 = {reg121};
endmodule

module module130
#(parameter param161 = ({((((8'hb2) & (8'hb5)) + (~(8'hb8))) ? {(~&(8'ha4))} : ((8'haf) | (~^(8'haa))))} ? ((!(((8'hae) ? (8'hb2) : (8'ha9)) ? ((8'h9d) ? (8'hb8) : (8'hbc)) : (~^(8'hb0)))) | {({(8'hbe)} ? ((8'haa) ? (8'hb6) : (8'haa)) : {(7'h43), (8'ha9)}), (^~(~^(8'had)))}) : ({(((8'ha1) ? (7'h41) : (8'ha8)) ? (8'hb1) : {(8'ha2)})} * ({((8'ha5) ? (8'ha8) : (8'hb3)), ((7'h42) + (8'h9d))} ? (((8'had) - (8'ha0)) ^~ (7'h40)) : (~{(8'hb2)})))), 
parameter param162 = (({(param161 ? param161 : (param161 ? param161 : (8'hb9)))} ? ((|param161) ? ({(8'hb8)} ? (~param161) : (|param161)) : {(param161 ? param161 : param161)}) : (~^((&param161) ? {param161} : (~param161)))) ? ({(~&param161)} ? (^~(&param161)) : (-(8'ha4))) : {((~&param161) ? (~&(~^(8'ha5))) : param161)}))
(y, clk, wire131, wire132, wire133, wire134, wire135);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire131;
  input wire signed [(4'ha):(1'h0)] wire132;
  input wire [(4'he):(1'h0)] wire133;
  input wire [(4'he):(1'h0)] wire134;
  input wire [(4'hf):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire155;
  assign y = {wire160, wire159, wire158, wire157, wire155, (1'h0)};
  module136 #() modinst156 (.wire140(wire133), .y(wire155), .clk(clk), .wire139(wire131), .wire138(wire135), .wire141(wire132), .wire137(wire134));
  assign wire157 = $signed($signed(({$unsigned(wire132), {wire134}} ?
                       $unsigned((+(8'h9d))) : $unsigned((wire132 ?
                           wire133 : wire135)))));
  assign wire158 = $signed(((((&wire131) ?
                           $unsigned(wire135) : $unsigned(wire135)) ?
                       (!$unsigned(wire155)) : wire131) || ((wire132[(3'h4):(2'h2)] != (wire135 || wire132)) ?
                       (|wire132) : $unsigned($unsigned(wire134)))));
  assign wire159 = $signed(wire134[(4'he):(4'he)]);
  assign wire160 = (wire131 - {wire132[(3'h4):(3'h4)],
                       (wire155 ?
                           $signed((!wire135)) : {(wire134 & wire131)})});
endmodule

module module5
#(parameter param115 = (((|{((8'ha7) ? (8'ha7) : (8'ha9))}) ? (~((~&(8'ha6)) ? (8'hbd) : ((8'hbf) << (8'hab)))) : ({((8'hb8) - (8'ha5))} >= (~{(8'hac), (8'hbf)}))) ? (^({(8'hb1), ((8'haa) ? (8'h9d) : (7'h42))} <= (~^((8'hbf) ? (8'hb5) : (8'hba))))) : (^((~^(-(8'haf))) >> (8'hb5)))), 
parameter param116 = ((~^param115) ? ((((param115 ? param115 : param115) > (|(8'hb7))) ? ((^~param115) >> param115) : ((param115 <<< param115) ? (param115 ? param115 : (8'h9f)) : (param115 ? param115 : param115))) ? ((7'h43) ? (param115 ? (param115 ~^ param115) : param115) : (^~(param115 >= param115))) : param115) : (((~^(^~param115)) ? ({(8'ha8), param115} || (~&param115)) : ((~^param115) ^~ (|param115))) >>> (((param115 ? param115 : param115) >= (param115 >> param115)) ? ((param115 != param115) ? param115 : (param115 ? param115 : param115)) : (^(param115 < param115))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire111;
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  assign y = {wire113,
                 wire44,
                 wire24,
                 wire23,
                 wire11,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire86,
                 wire111,
                 reg114,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 (1'h0)};
  assign wire11 = {(-wire6[(3'h6):(1'h1)])};
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire10[(1'h1):(1'h0)]);
      reg13 <= wire6;
      if ({wire9})
        begin
          reg14 <= (wire10[(2'h2):(2'h2)] && $unsigned((~wire10)));
        end
      else
        begin
          reg14 <= $unsigned($signed($unsigned(($unsigned(wire9) != (~|wire10)))));
          reg15 <= $unsigned({{($unsigned(wire10) | (-wire9)),
                  $unsigned($unsigned(wire8))}});
          reg16 <= wire11;
          if ($signed((8'hb9)))
            begin
              reg17 <= (wire6 >>> (|wire6[(3'h5):(3'h4)]));
              reg18 <= $signed((^~wire11));
              reg19 <= {(((wire9 + reg16) ?
                      wire11[(5'h12):(4'ha)] : reg17[(3'h4):(2'h2)]) * ((^~$signed(reg18)) >= reg16[(3'h6):(3'h5)]))};
              reg20 <= $unsigned(((((reg19 ? wire9 : wire11) ?
                      reg18[(4'h9):(3'h6)] : (wire7 ^ wire6)) > (|wire11)) ?
                  reg16[(5'h12):(2'h3)] : $signed($signed(wire9[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg17 <= wire7[(4'hd):(2'h2)];
              reg18 <= (($unsigned(($unsigned(wire6) ?
                      (wire10 <= wire7) : (reg13 ? reg14 : wire8))) != reg19) ?
                  {$signed(reg17[(2'h2):(1'h1)]),
                      wire6[(1'h1):(1'h0)]} : (reg20 ?
                      (~|$unsigned((reg13 ~^ reg12))) : ($unsigned(reg14) ?
                          (8'had) : reg16[(5'h12):(5'h11)])));
            end
        end
      reg21 <= $unsigned($signed(({wire9[(2'h2):(1'h0)]} ?
          reg20[(2'h3):(2'h3)] : $unsigned(wire8[(4'hb):(2'h2)]))));
      reg22 <= wire7[(4'h9):(3'h5)];
    end
  assign wire23 = $unsigned(((^~(((8'hb5) - wire7) - $unsigned(reg22))) ~^ $unsigned(reg15)));
  assign wire24 = reg16;
  module25 #() modinst45 (.clk(clk), .y(wire44), .wire27(reg18), .wire28(wire11), .wire26(reg14), .wire29(reg16));
  assign wire46 = (~^($signed((wire24 ? wire9[(1'h1):(1'h1)] : (8'ha2))) ?
                      {$unsigned($signed(reg21)),
                          wire23[(1'h0):(1'h0)]} : reg13[(4'he):(4'h8)]));
  assign wire47 = $signed(reg20);
  assign wire48 = ((^($unsigned((8'hbb)) ?
                      (((8'ha1) ? reg20 : wire23) ?
                          (+(8'hb8)) : reg14) : $unsigned((^~reg12)))) && (reg12 ?
                      ($unsigned({(8'hb4)}) ?
                          wire8 : $unsigned((~^(8'ha9)))) : $signed(({wire6,
                              (8'hac)} ?
                          (reg14 ? reg13 : wire7) : $signed(wire24)))));
  assign wire49 = wire46;
  assign wire50 = (reg20 - wire10);
  assign wire51 = $unsigned({$unsigned(wire47)});
  assign wire52 = $unsigned($signed((~wire23[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire52)
        begin
          reg53 <= {$signed($signed((!reg22))),
              {$signed((-$unsigned((8'had))))}};
          if (($unsigned($unsigned({(^(7'h41))})) < (~reg16)))
            begin
              reg54 <= $signed(wire11[(4'he):(3'h5)]);
            end
          else
            begin
              reg54 <= (((~|(reg21 ? wire51[(2'h2):(2'h2)] : $signed(wire11))) ?
                  ((~&(^reg19)) * $unsigned(reg21[(3'h6):(2'h3)])) : ((~^$unsigned(wire9)) < wire11)) | $unsigned((8'hb9)));
            end
        end
      else
        begin
          if ($unsigned((7'h40)))
            begin
              reg53 <= (^~{$unsigned($unsigned(reg16[(3'h6):(3'h4)]))});
              reg54 <= (!$signed($unsigned({(^~reg54)})));
              reg55 <= $signed((^~($unsigned({reg21,
                  reg16}) ~^ reg19[(3'h4):(1'h1)])));
            end
          else
            begin
              reg53 <= reg16;
              reg54 <= reg55;
              reg55 <= ((^(((reg19 != wire46) ?
                  $unsigned(reg19) : {reg54,
                      wire46}) | $signed($unsigned((7'h42))))) >> reg22);
              reg56 <= (reg13 ? wire11 : wire9[(5'h13):(3'h6)]);
              reg57 <= wire52[(3'h6):(1'h1)];
            end
          reg58 <= ($signed(($signed((wire51 ?
              reg57 : reg16)) != wire9[(3'h6):(2'h3)])) ^~ (~^reg14[(4'h9):(2'h2)]));
        end
    end
  module59 #() modinst87 (.wire62(reg18), .wire64(reg16), .wire61(reg17), .clk(clk), .y(wire86), .wire63(wire51), .wire60(wire7));
  module88 #() modinst112 (.wire89(reg15), .wire91(wire7), .y(wire111), .clk(clk), .wire90(reg54), .wire93(reg12), .wire92(reg53));
  assign wire113 = reg53[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg114 <= (reg21[(4'hf):(1'h0)] ?
          $signed($signed($signed((wire10 ^~ reg16)))) : $signed(wire111));
    end
endmodule

module module88
#(parameter param110 = ((8'ha8) ? (((~|(&(8'hb5))) >> ({(8'ha3)} ? (-(8'hbd)) : (~^(8'hbe)))) - (-(^~(|(8'hb4))))) : ((+{((7'h43) + (8'ha8)), {(8'ha9)}}) ? ({(8'hbd), ((8'hb1) || (8'ha7))} ? ((&(8'ha5)) >>> {(7'h43)}) : (~(~(8'ha0)))) : (({(8'h9f)} ? ((8'hb7) < (8'h9c)) : ((7'h41) >= (8'ha2))) < (~(&(8'ha9)))))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire93;
  input wire [(4'ha):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire91;
  input wire signed [(5'h10):(1'h0)] wire90;
  input wire signed [(5'h12):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
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
                 (1'h0)};
  assign wire94 = $unsigned($unsigned($unsigned(($signed(wire90) ?
                      {(8'ha0), wire92} : wire89))));
  assign wire95 = wire91;
  assign wire96 = $signed((~&$signed(wire95)));
  assign wire97 = (wire95 > $signed((-wire95[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      if ((wire92 ^~ {(^~(~|(+wire92))),
          (wire89 ? $unsigned($signed((8'hab))) : wire90)}))
        begin
          reg98 <= wire97;
          if ((~((-(8'hb9)) ?
              $signed($signed({reg98})) : wire97[(3'h5):(2'h3)])))
            begin
              reg99 <= wire95;
              reg100 <= reg98[(2'h2):(1'h0)];
              reg101 <= $signed(wire92);
              reg102 <= wire97;
            end
          else
            begin
              reg99 <= ((wire90 ?
                      $unsigned(((wire96 ?
                          (8'hb8) : wire94) | $signed(wire89))) : ((~^reg101[(4'h8):(1'h0)]) == ({(8'hae)} ?
                          wire91[(5'h12):(4'hf)] : reg99))) ?
                  (~^(!$unsigned((&wire95)))) : ($signed(($unsigned(wire96) - reg100)) * (|((8'hb8) ?
                      reg98 : wire92))));
              reg100 <= ($unsigned(wire96) & ($unsigned(($unsigned(wire91) ?
                      reg99[(4'hf):(4'hf)] : $signed(reg99))) ?
                  wire90[(5'h10):(2'h3)] : wire93[(3'h5):(2'h2)]));
              reg101 <= ($unsigned($signed((+(wire89 ? wire94 : wire95)))) ?
                  (wire91 ?
                      {(wire90 - (+wire90))} : (~|wire96)) : $unsigned((((wire95 == (8'ha5)) ~^ (~|wire90)) <<< wire94)));
              reg102 <= wire92;
            end
          reg103 <= ((8'hbc) ?
              $signed(wire92) : (($unsigned($unsigned((8'ha4))) ?
                  $unsigned((wire91 ? wire92 : wire97)) : {{wire95},
                      (&wire96)}) == (~|(!$unsigned(wire96)))));
          reg104 <= reg101[(4'hd):(1'h0)];
          reg105 <= $signed($unsigned(wire94));
        end
      else
        begin
          reg98 <= $unsigned({wire92, wire91});
          if (wire96)
            begin
              reg99 <= {(($signed((wire90 ? wire89 : wire97)) ?
                      $signed(((8'hb7) ?
                          wire90 : reg101)) : $unsigned($unsigned(wire92))) <<< (((|reg102) ?
                      $signed(reg98) : {reg99,
                          wire94}) & (^~reg102[(4'hf):(4'hd)])))};
              reg100 <= ($unsigned((wire91 ?
                  (^$signed((7'h44))) : {$signed((8'h9d)),
                      (wire89 ?
                          wire95 : (8'hbc))})) << (~|$unsigned({$signed(wire95),
                  (^~reg101)})));
              reg101 <= (~&((reg98 < (wire96[(1'h0):(1'h0)] ?
                      (8'hb4) : $signed((8'hb2)))) ?
                  (&((wire92 * reg99) >= reg101)) : ($unsigned($unsigned(wire94)) ?
                      ((&(8'hb4)) >>> (reg99 <= (8'ha0))) : (reg98 ?
                          (reg102 <<< reg102) : (wire94 ? reg101 : reg105)))));
              reg102 <= ($signed(($unsigned($unsigned(wire93)) - ($unsigned(reg103) ?
                      reg100[(4'hc):(4'h9)] : $signed(wire93)))) ?
                  wire92 : $unsigned(($unsigned({wire97,
                      reg104}) >> $unsigned((8'ha9)))));
              reg103 <= ($signed((~^$signed(((8'ha6) ? reg99 : wire97)))) ?
                  ({$signed((wire89 | reg102))} ~^ wire97[(3'h5):(1'h0)]) : reg103);
            end
          else
            begin
              reg99 <= (((((reg102 != wire95) ?
                  reg101 : $unsigned(wire90)) ^~ (8'hb3)) ^ $unsigned(((~^reg99) != (~&reg100)))) == $unsigned(wire91));
              reg100 <= (reg104[(2'h3):(1'h0)] ?
                  $unsigned(($signed((wire93 & reg102)) * {$signed(wire97),
                      (wire96 ^~ wire96)})) : (^~$signed($signed($signed(wire95)))));
              reg101 <= wire89[(4'hf):(1'h0)];
              reg102 <= $signed($signed($signed($unsigned(wire95))));
              reg103 <= (~|(({(&reg99)} >= (8'ha0)) ?
                  $unsigned(reg98[(1'h1):(1'h0)]) : (~$signed($signed(wire97)))));
            end
        end
      reg106 <= (~reg102);
      reg107 <= $unsigned(($signed((^~(^~(8'hb8)))) != $unsigned($unsigned((!(8'haa))))));
    end
  assign wire108 = wire92[(4'ha):(4'ha)];
  assign wire109 = reg106;
endmodule

module module59
#(parameter param85 = {(({((8'hb3) ^ (8'hb6))} >> (((8'hb5) ? (8'ha0) : (8'h9f)) ^~ (!(8'hb7)))) > ((((8'hb7) ? (8'hab) : (8'hb4)) << (~|(8'ha4))) + ((8'hb9) ? {(8'ha8), (8'h9f)} : ((7'h44) ? (8'ha8) : (8'hbd)))))})
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(3'h5):(1'h0)] wire63;
  input wire [(4'ha):(1'h0)] wire62;
  input wire signed [(4'hd):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg65 <= (!$unsigned((~^(-$unsigned(wire64)))));
      if (($signed({(wire61[(4'h9):(3'h5)] ? (-reg65) : wire62[(3'h5):(2'h3)]),
              ($unsigned(wire63) & wire63[(1'h0):(1'h0)])}) ?
          wire64 : (wire64[(4'h8):(1'h0)] ?
              $unsigned(wire61[(4'hb):(1'h1)]) : (|wire61[(4'hb):(2'h2)]))))
        begin
          reg66 <= wire60;
          if (wire63)
            begin
              reg67 <= {wire62[(3'h6):(1'h1)],
                  (^~$signed(((wire64 ~^ wire63) == (wire61 ?
                      (8'h9d) : wire64))))};
            end
          else
            begin
              reg67 <= $unsigned(reg65);
              reg68 <= reg66[(2'h3):(2'h3)];
              reg69 <= reg67[(3'h7):(3'h6)];
              reg70 <= (~|reg65);
              reg71 <= (({reg68[(3'h6):(3'h6)],
                      (^~(^wire62))} || wire63[(2'h2):(1'h0)]) ?
                  wire60 : $signed($unsigned({(wire64 != (8'hbf)),
                      (wire61 ? reg65 : reg66)})));
            end
        end
      else
        begin
          reg66 <= ($signed(((wire63[(2'h2):(1'h0)] ?
                      $unsigned(wire60) : (reg69 * (8'haf))) ?
                  {reg68[(3'h5):(1'h1)]} : (8'hb2))) ?
              reg71[(4'h8):(3'h4)] : reg71);
          reg67 <= wire61[(2'h2):(2'h2)];
          if ((($signed(reg71) ?
              ((~^wire64) ?
                  (8'hb4) : $signed($unsigned((8'haa)))) : $signed((~|reg67))) * (|reg71[(1'h1):(1'h0)])))
            begin
              reg68 <= reg69;
              reg69 <= (&(8'had));
              reg70 <= $unsigned($signed($unsigned(($signed(reg71) >= wire60[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg68 <= reg70;
              reg69 <= (($signed($signed((reg67 ? wire64 : reg66))) ?
                  $unsigned($unsigned((reg69 >> (8'hb2)))) : ($unsigned(wire64[(1'h0):(1'h0)]) ^ $signed(((8'h9e) > wire60)))) * $unsigned({((wire63 ?
                          reg70 : reg66) ?
                      {reg71} : wire60)}));
              reg70 <= (reg66[(1'h0):(1'h0)] ?
                  $signed(($signed(wire62) ?
                      ((wire64 << reg66) ?
                          (reg69 << wire61) : (wire62 << wire60)) : $signed(wire64[(2'h3):(1'h0)]))) : $unsigned(wire60));
              reg71 <= (^((~(^~(reg69 > reg67))) >>> ($signed((|(8'hb9))) ?
                  reg66[(1'h1):(1'h0)] : ((!wire64) ^ $signed((8'ha2))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg72 <= $unsigned((^((reg69 ?
          $signed(reg65) : $unsigned(wire64)) & ((reg65 ? reg67 : wire61) ?
          {reg70, wire60} : {(8'h9e)}))));
      if ((wire60[(2'h3):(2'h3)] ?
          $unsigned($signed(reg66)) : (($signed({wire63, reg67}) ?
              (&$signed(reg67)) : wire64) | {reg66[(3'h5):(3'h5)]})))
        begin
          reg73 <= $unsigned(($unsigned((&$unsigned(reg72))) + ($signed(((8'ha5) ?
                  reg68 : (8'haa))) ?
              (~reg66[(2'h3):(1'h0)]) : wire63[(1'h0):(1'h0)])));
          reg74 <= {reg69, (|reg65[(3'h6):(3'h5)])};
        end
      else
        begin
          reg73 <= $signed({($unsigned((^reg69)) & $unsigned(reg74)), reg68});
          reg74 <= ($unsigned((~^(~|(-reg69)))) || (^~$unsigned(((reg72 <= (8'hbf)) ?
              (wire60 ? (8'haa) : reg71) : reg68[(2'h3):(1'h0)]))));
          if (wire63[(1'h1):(1'h0)])
            begin
              reg75 <= ({(-(8'hb9)), (8'ha9)} ?
                  (~$signed(($signed(reg67) ?
                      reg69[(4'hd):(4'hd)] : (8'hb0)))) : $unsigned($signed((~|((8'hb1) ?
                      (8'hb7) : reg66)))));
              reg76 <= ($signed(({$signed(reg67), $unsigned(wire62)} * reg74)) ?
                  ($signed($unsigned({wire64})) ?
                      reg66 : (wire63[(2'h3):(2'h3)] ?
                          $unsigned({reg74}) : $signed((wire60 ?
                              reg65 : (8'hab))))) : reg66[(3'h4):(1'h1)]);
              reg77 <= $signed(($unsigned($signed((wire63 <<< wire61))) ?
                  $signed($signed(reg70[(1'h0):(1'h0)])) : (reg65 >>> $signed((wire61 != reg69)))));
              reg78 <= reg69[(3'h7):(1'h1)];
            end
          else
            begin
              reg75 <= (8'hb1);
            end
          reg79 <= $unsigned(reg69);
          reg80 <= {reg76};
        end
      reg81 <= $signed({(reg72 ^ ((^reg65) * wire63)), {(~(^~(8'ha5)))}});
    end
  assign wire82 = $unsigned($signed($unsigned({{(8'hb4)}})));
  assign wire83 = $unsigned(reg70[(3'h5):(3'h5)]);
  assign wire84 = $unsigned(reg72);
endmodule

module module25
#(parameter param43 = (((+((&(7'h44)) - (^~(8'hb2)))) ? (~|{((8'hac) | (8'hb3)), (~&(8'had))}) : ({((8'hbf) < (8'hb2))} ? ((-(8'h9f)) ? ((8'ha3) ? (7'h44) : (8'ha1)) : ((8'hbc) <<< (8'ha9))) : (|((8'hb8) ? (8'hba) : (8'h9c))))) | ((~(~&{(8'hb3)})) >> ((((8'hb7) ? (8'hb3) : (8'h9c)) > ((8'hb7) > (7'h42))) >> ((8'ha2) <<< (^~(8'hbe)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  assign y = {wire42,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire30 = (~&$signed($signed((wire28 <<< (wire28 ? wire29 : wire27)))));
  assign wire31 = {(^$signed($unsigned($signed(wire28))))};
  assign wire32 = wire30;
  assign wire33 = $signed($unsigned((|(&$signed(wire30)))));
  assign wire34 = ({wire28[(1'h0):(1'h0)]} | (8'hb3));
  assign wire35 = (~&$signed($signed(wire31[(4'h9):(1'h1)])));
  assign wire36 = (~&$signed($signed(wire31[(4'h8):(1'h1)])));
  assign wire37 = wire31;
  always
    @(posedge clk) begin
      reg38 <= wire27[(3'h4):(1'h1)];
      if (($signed($signed((+(+wire31)))) ?
          (^~$signed(wire27[(2'h3):(1'h0)])) : $unsigned($unsigned((~$signed(wire37))))))
        begin
          reg39 <= (wire36 ?
              (wire36 ?
                  (~wire35[(5'h10):(4'h8)]) : ((8'hb1) || (!reg38))) : (^~wire30));
          reg40 <= ((8'haa) ? wire27[(3'h5):(2'h3)] : $unsigned({wire28}));
        end
      else
        begin
          reg39 <= (~&({wire33} >> (8'ha6)));
        end
      reg41 <= (wire36[(4'hc):(3'h6)] || $unsigned(wire34));
    end
  assign wire42 = {((((|reg40) ? wire37[(4'h8):(1'h0)] : (reg38 << wire37)) ?
                          $unsigned((^~reg39)) : $signed(wire33[(4'hd):(4'ha)])) > {reg41[(3'h7):(2'h3)]}),
                      $signed(($signed($unsigned(reg41)) ?
                          $signed(wire36[(4'h8):(2'h3)]) : $unsigned((reg39 | reg41))))};
endmodule

module module136  (y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire141;
  input wire signed [(2'h3):(1'h0)] wire140;
  input wire signed [(2'h2):(1'h0)] wire139;
  input wire [(4'hf):(1'h0)] wire138;
  input wire signed [(4'h8):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  assign y = {wire154,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire144,
                 wire143,
                 wire142,
                 reg153,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire142 = $unsigned(wire137);
  assign wire143 = ((((^~(wire139 ? (8'ha0) : wire141)) ?
                               wire137 : ((wire140 << wire141) ?
                                   (wire140 >>> wire138) : wire141)) ?
                           (8'hae) : $signed($unsigned((wire140 ?
                               (8'ha8) : wire140)))) ?
                       (|wire137) : ({wire141} ?
                           (8'ha3) : {(8'hab), $unsigned($signed(wire138))}));
  assign wire144 = wire139;
  always
    @(posedge clk) begin
      reg145 <= wire141;
      reg146 <= (~|wire142);
      reg147 <= {wire137[(3'h5):(1'h1)]};
      reg148 <= $signed(wire137);
    end
  assign wire149 = $signed((!$signed($signed((^wire140)))));
  assign wire150 = reg145[(3'h6):(3'h5)];
  assign wire151 = wire140[(2'h3):(2'h2)];
  assign wire152 = (8'ha3);
  always
    @(posedge clk) begin
      reg153 <= $signed($unsigned((8'hbe)));
    end
  assign wire154 = $unsigned(((wire149 | (&{(8'hbb)})) ?
                       $unsigned(($signed((8'ha0)) && $signed(wire144))) : (~(&(-reg146)))));
endmodule
