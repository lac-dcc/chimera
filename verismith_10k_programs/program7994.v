module top
#(parameter param229 = ({(8'hb0)} ? ((~|(~((8'ha3) > (8'ha6)))) ? (+(((8'hb6) & (7'h40)) <= ((8'hbf) ? (8'ha4) : (8'h9c)))) : ((8'ha8) ^~ (((8'hb7) - (8'hba)) ? ((8'hbe) ? (8'haf) : (7'h40)) : ((8'hb5) * (8'h9c))))) : (~((((8'h9e) <= (7'h44)) - (8'hbe)) + {((7'h41) != (8'ha9))}))), 
parameter param230 = param229)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire227;
  wire [(4'hc):(1'h0)] wire225;
  wire [(4'he):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire114;
  assign y = {wire227, wire225, wire86, wire88, wire114, (1'h0)};
  module5 #() modinst87 (.wire10(wire4), .clk(clk), .wire6(wire1), .wire8(wire2), .y(wire86), .wire9(wire0), .wire7(wire3));
  assign wire88 = wire1;
  module89 #() modinst115 (wire114, clk, wire3, wire1, wire88, wire86, wire0);
  module116 #() modinst226 (.wire118(wire2), .wire120(wire0), .clk(clk), .wire119(wire86), .wire117(wire1), .y(wire225));
  module116 #() modinst228 (wire227, clk, wire2, wire114, wire88, wire1);
endmodule

module module116
#(parameter param224 = (((^~(|((8'hb2) << (8'hb7)))) >>> (({(8'hab)} >= ((8'hb4) ? (8'h9e) : (8'hbf))) ? {(^~(8'ha4)), ((7'h41) ? (8'hb3) : (8'hab))} : (8'hb0))) ? ({(+(~|(7'h44))), (^~((8'ha4) ? (8'ha6) : (8'ha0)))} ? (&{(~^(8'ha2)), ((8'had) ? (8'h9c) : (8'haa))}) : (&(((8'hb4) || (8'hbb)) ? {(7'h43)} : {(8'hb0), (8'h9f)}))) : {((((8'hbf) << (8'ha0)) || (+(8'h9f))) ? ((-(8'ha9)) || {(8'hb4), (8'hb3)}) : {((8'hae) ? (8'ha9) : (8'hb2)), (~&(8'hb5))})}))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire120;
  input wire [(4'he):(1'h0)] wire119;
  input wire [(4'hf):(1'h0)] wire118;
  input wire [(5'h15):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire223;
  wire signed [(4'he):(1'h0)] wire222;
  wire [(5'h14):(1'h0)] wire221;
  wire signed [(3'h4):(1'h0)] wire220;
  wire [(5'h15):(1'h0)] wire219;
  wire [(5'h13):(1'h0)] wire218;
  wire [(5'h12):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire216;
  wire signed [(5'h10):(1'h0)] wire215;
  wire [(5'h15):(1'h0)] wire214;
  wire [(4'hf):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire211;
  wire [(4'hf):(1'h0)] wire178;
  wire signed [(4'h9):(1'h0)] wire177;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire175;
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire211,
                 wire178,
                 wire177,
                 wire153,
                 wire125,
                 wire124,
                 wire155,
                 wire156,
                 wire175,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= {{wire117[(3'h6):(1'h1)]}};
      reg122 <= (wire120 ?
          ((wire117 <<< reg121) ?
              (((wire118 ?
                  wire118 : wire120) >>> wire118) & (+((8'h9c) ^~ (8'hb5)))) : (^~($unsigned(wire118) ?
                  wire118[(2'h3):(1'h0)] : wire117[(5'h12):(3'h4)]))) : (reg121 ?
              (wire118 != {wire118[(1'h0):(1'h0)],
                  (wire118 << reg121)}) : $signed((8'haf))));
      reg123 <= $signed($signed(({wire118[(1'h0):(1'h0)]} ?
          $unsigned(((8'ha6) ?
              wire117 : reg121)) : $signed(((8'ha5) ~^ wire118)))));
    end
  assign wire124 = wire120;
  assign wire125 = (($unsigned((&$unsigned(reg123))) ?
                           wire117[(5'h13):(3'h6)] : (wire124 ?
                               (8'hb4) : $signed((wire118 ?
                                   wire119 : wire120)))) ?
                       reg121 : (^$signed($signed($unsigned((8'hbc))))));
  module126 #() modinst154 (.clk(clk), .wire129(reg121), .wire127(wire117), .wire128(wire119), .wire130(wire118), .y(wire153));
  assign wire155 = wire124[(2'h2):(2'h2)];
  assign wire156 = {(^reg122[(3'h4):(1'h1)])};
  module157 #() modinst176 (.clk(clk), .wire162(reg123), .wire158(reg121), .wire161(wire120), .wire160(wire119), .y(wire175), .wire159(wire155));
  assign wire177 = ({((+(8'ha5)) ^~ wire124[(2'h2):(1'h1)]),
                       (($unsigned(reg122) ?
                           reg123[(1'h0):(1'h0)] : (wire156 ?
                               (8'ha6) : wire124)) | $signed($unsigned(wire175)))} & wire175);
  assign wire178 = $signed(({wire124[(1'h0):(1'h0)],
                       ({wire119} != $unsigned(wire156))} >> (!({(8'hb8)} ?
                       (reg121 ? (8'hb9) : (8'hbc)) : ((8'hab) ?
                           wire119 : wire124)))));
  module179 #() modinst212 (wire211, clk, wire175, reg121, wire117, wire118, wire155);
  assign wire213 = {$signed($signed(($unsigned(wire124) ?
                           ((8'hab) >= (8'hb1)) : (~|wire118))))};
  assign wire214 = (~^wire211[(3'h4):(2'h3)]);
  assign wire215 = ((&$signed((|wire153))) >= (^($unsigned(reg121) ?
                       {{wire175, wire120},
                           $signed(reg122)} : ($signed(reg123) ?
                           ((8'ha4) ?
                               (8'hae) : wire156) : wire120[(5'h12):(4'ha)]))));
  assign wire216 = wire156;
  assign wire217 = (8'had);
  assign wire218 = (~^reg123[(1'h1):(1'h1)]);
  assign wire219 = ($unsigned((8'ha0)) && (wire119 >>> ((-$signed(wire178)) < $signed((wire120 ~^ wire215)))));
  assign wire220 = (wire213 == wire175);
  assign wire221 = ({wire216[(4'ha):(3'h4)],
                           ($signed(wire175[(4'h9):(2'h2)]) ?
                               reg123 : $signed((~wire124)))} ?
                       {reg122,
                           $signed((!(^wire125)))} : $unsigned(((wire214 && (~|(8'h9f))) <= ($signed((8'ha9)) ?
                           $unsigned(wire218) : $unsigned(wire119)))));
  assign wire222 = wire220;
  assign wire223 = $unsigned((wire178 ? wire119 : wire177));
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire94;
  input wire signed [(5'h12):(1'h0)] wire93;
  input wire [(4'h8):(1'h0)] wire92;
  input wire [(3'h6):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire110,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire97,
                 wire96,
                 wire95,
                 reg111,
                 reg109,
                 reg98,
                 (1'h0)};
  assign wire95 = (~|$signed(wire94[(4'h9):(3'h5)]));
  assign wire96 = $unsigned($unsigned({(wire91[(3'h5):(3'h5)] ?
                          (wire90 ? wire92 : wire93) : (wire95 + wire94))}));
  assign wire97 = {($unsigned(wire93[(4'hd):(4'h9)]) < (($signed(wire94) ^ (wire90 ?
                          wire90 : wire95)) ^ wire91[(1'h1):(1'h1)])),
                      $unsigned($signed(wire90))};
  always
    @(posedge clk) begin
      reg98 <= wire91;
    end
  assign wire99 = $signed(wire92[(2'h3):(2'h2)]);
  assign wire100 = $unsigned(wire99[(4'hb):(3'h4)]);
  assign wire101 = ($unsigned(({wire99[(4'h8):(3'h7)]} ?
                           wire97 : ((~wire95) ?
                               wire99 : wire100[(3'h5):(1'h0)]))) ?
                       (($signed((8'hab)) ?
                               (((8'ha0) ?
                                   wire92 : (8'hb2)) ^ (^wire93)) : $signed((~wire97))) ?
                           $unsigned($signed($unsigned(wire95))) : {$unsigned((~^wire100))}) : {wire94,
                           $unsigned(wire99)});
  assign wire102 = wire99[(4'h8):(3'h7)];
  assign wire103 = $unsigned($signed(($signed(wire93[(5'h11):(2'h3)]) << {(~|wire100)})));
  assign wire104 = $unsigned($unsigned((wire99[(1'h0):(1'h0)] ?
                       $unsigned((-wire99)) : wire92[(4'h8):(3'h5)])));
  assign wire105 = wire92[(1'h0):(1'h0)];
  assign wire106 = ((wire97 ?
                           (wire91[(3'h4):(1'h1)] ?
                               {{wire90},
                                   {wire92,
                                       wire99}} : wire102) : $unsigned(($unsigned(wire97) | (wire90 > wire102)))) ?
                       $unsigned(((wire100 ?
                               {reg98} : (wire97 ? (8'ha1) : wire104)) ?
                           (8'hb8) : ((wire93 ? wire102 : (8'ha4)) ?
                               $signed(wire104) : (wire90 ^~ wire102)))) : (wire105 ?
                           $unsigned((~&$unsigned((8'ha4)))) : $signed(($signed(reg98) <<< {wire103,
                               wire103}))));
  assign wire107 = ((wire93 == {(^~$signed(wire106)), $unsigned((~(8'hbb)))}) ?
                       {$unsigned(wire102[(1'h1):(1'h1)])} : $unsigned((reg98 ?
                           (^wire99[(5'h12):(3'h4)]) : wire104[(2'h2):(2'h2)])));
  assign wire108 = (wire103[(2'h3):(2'h2)] & $unsigned((~^$unsigned((!wire96)))));
  always
    @(posedge clk) begin
      reg109 <= $unsigned({$unsigned(wire108),
          $unsigned(reg98[(1'h1):(1'h1)])});
    end
  assign wire110 = $unsigned(wire92[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg111 <= wire97;
    end
  assign wire112 = wire95;
  assign wire113 = ((wire106[(3'h7):(3'h7)] ?
                       ((wire101 && (~&wire110)) ?
                           reg98 : wire102[(2'h3):(2'h3)]) : (wire96 * $unsigned($signed((8'hb0))))) + wire106[(3'h4):(1'h1)]);
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h2c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire61;
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire44,
                 wire61,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = (~&$unsigned((wire6[(2'h2):(1'h1)] ?
                      wire9[(2'h2):(1'h1)] : ({(8'had), wire9} ?
                          $unsigned(wire8) : wire10[(1'h1):(1'h1)]))));
  assign wire12 = (+{$unsigned((~{(8'hb0)})), wire8[(1'h1):(1'h0)]});
  assign wire13 = ($unsigned($unsigned($signed(((8'had) ?
                      wire6 : wire12)))) && wire8);
  assign wire14 = ($unsigned((~$signed((^~wire12)))) ?
                      wire8[(3'h4):(3'h4)] : wire11[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ((~$signed((wire6[(1'h1):(1'h1)] | wire10))))
        begin
          if ({(~^$signed(wire13[(3'h4):(3'h4)])),
              $unsigned((wire7 ? wire13 : wire9[(3'h5):(3'h5)]))})
            begin
              reg15 <= (|$signed(wire12[(3'h6):(3'h4)]));
              reg16 <= wire11[(3'h5):(3'h5)];
              reg17 <= $signed({$signed((wire8[(2'h3):(2'h2)] <= (wire7 ?
                      (8'ha6) : wire13)))});
              reg18 <= $signed(($signed((8'hb4)) <= wire8));
              reg19 <= $signed((reg17[(1'h1):(1'h0)] | {{$signed(reg17),
                      $unsigned(wire12)}}));
            end
          else
            begin
              reg15 <= ((($signed($unsigned(wire14)) ~^ $signed($signed(wire7))) ?
                  $signed(((^reg19) ?
                      reg17 : (reg16 ? (8'ha3) : wire9))) : {$signed((reg19 ?
                          reg18 : wire11))}) << ((((-wire13) - (^~wire10)) ?
                  ($signed(reg19) ?
                      wire10[(1'h1):(1'h0)] : wire6[(1'h0):(1'h0)]) : (wire9[(2'h2):(1'h1)] ?
                      $signed(wire14) : (~&reg15))) | ($signed((^~(8'haa))) ?
                  (((8'hbd) ?
                      reg18 : reg15) & wire7[(4'hf):(1'h0)]) : $signed((^~wire12)))));
              reg16 <= ($unsigned((($signed(wire9) <<< reg15[(4'hd):(3'h7)]) ?
                      ($unsigned((8'hb7)) ?
                          $signed((8'ha7)) : (wire9 ?
                              wire7 : (8'h9c))) : ((wire14 + reg19) >= (wire12 >> wire6)))) ?
                  $unsigned($signed((wire8 ?
                      wire13[(3'h4):(2'h2)] : (reg16 * wire13)))) : $signed(wire14[(4'he):(4'hb)]));
              reg17 <= ((+$signed(reg18)) ?
                  {(+((!reg18) ? (+wire12) : wire13))} : wire13[(3'h4):(1'h0)]);
            end
          reg20 <= (~^($unsigned(($signed(reg19) ?
                  (wire10 ? wire14 : wire10) : (reg19 >> wire13))) ?
              wire10[(3'h5):(2'h2)] : wire13[(3'h6):(1'h1)]));
          reg21 <= {$unsigned(reg16[(4'h9):(2'h2)]),
              {{{(~&(8'hbb)), (^reg17)}, {(reg17 >> wire13)}}}};
        end
      else
        begin
          reg15 <= (~^((((^wire14) != $unsigned((8'hb8))) ?
              reg21 : {(reg20 ^ wire11),
                  (reg16 ? (8'haa) : reg18)}) <<< (reg15[(5'h10):(4'he)] ?
              wire12[(4'h9):(3'h4)] : $signed(wire13[(3'h6):(3'h5)]))));
          reg16 <= wire14[(4'h9):(2'h2)];
          if ($unsigned((wire6[(2'h2):(1'h0)] ?
              (^~($signed(reg19) == $unsigned(wire12))) : ((^$unsigned(reg18)) ?
                  ((wire9 ? (8'ha3) : reg17) <= (wire10 ?
                      wire8 : (8'ha0))) : reg18[(1'h1):(1'h0)]))))
            begin
              reg17 <= reg15;
            end
          else
            begin
              reg17 <= reg18;
              reg18 <= (~^{(~|(wire6 != (wire11 << (8'ha4)))),
                  (wire7[(5'h10):(3'h6)] ? {(reg17 ? reg20 : reg21)} : wire7)});
              reg19 <= $signed(wire13[(2'h2):(2'h2)]);
            end
          reg20 <= reg16;
          reg21 <= {(^~$signed($unsigned(wire11))),
              (reg15 < ($signed({wire12,
                  reg20}) && $unsigned(wire11[(2'h2):(1'h0)])))};
        end
      reg22 <= (&wire11);
      reg23 <= reg15[(2'h2):(1'h1)];
      reg24 <= $unsigned(wire6[(1'h1):(1'h0)]);
      reg25 <= (8'ha0);
    end
  always
    @(posedge clk) begin
      if (reg16[(4'ha):(3'h4)])
        begin
          reg26 <= ($signed(wire12[(2'h3):(1'h1)]) ?
              (~|(|(8'ha0))) : wire7[(3'h5):(1'h0)]);
          reg27 <= reg19[(4'h8):(2'h2)];
          if ((-{reg25, $unsigned($signed((~|reg17)))}))
            begin
              reg28 <= reg23[(5'h15):(1'h0)];
              reg29 <= reg24;
            end
          else
            begin
              reg28 <= ((wire11[(4'ha):(4'h8)] ?
                  reg16 : {(~|(wire8 * reg23)), wire6}) ~^ {$signed(wire9),
                  reg19[(3'h7):(3'h6)]});
              reg29 <= {(reg20 ?
                      $unsigned(((reg25 ?
                          reg29 : (8'hb1)) & $unsigned(reg17))) : (-(^wire6[(1'h1):(1'h1)])))};
            end
        end
      else
        begin
          if (((~|wire14[(2'h3):(2'h2)]) ?
              (reg17[(2'h3):(2'h3)] ?
                  ((7'h41) + (~(&reg28))) : $unsigned($signed((wire8 >> wire13)))) : (~|$unsigned(({wire11} ?
                  (~wire11) : {wire10, reg27})))))
            begin
              reg26 <= (~^$signed(reg15));
            end
          else
            begin
              reg26 <= wire12[(4'hb):(1'h0)];
              reg27 <= ((wire7 ?
                  (~|($unsigned(wire13) ?
                      {reg18, reg21} : {reg18,
                          reg22})) : (~^$unsigned((reg22 >> wire11)))) != ($unsigned((^$unsigned(wire13))) && ($unsigned(reg20) ?
                  $unsigned(reg16) : (^(reg24 | reg23)))));
              reg28 <= $unsigned(($unsigned(wire10) ?
                  $unsigned(wire6) : ((&(reg27 ?
                      wire9 : reg22)) < reg22[(1'h0):(1'h0)])));
              reg29 <= (^~reg17[(3'h4):(2'h2)]);
            end
          if ($signed(reg19[(3'h7):(3'h5)]))
            begin
              reg30 <= reg15[(4'hc):(4'hb)];
              reg31 <= reg25[(2'h3):(1'h1)];
              reg32 <= {reg28[(4'ha):(1'h1)]};
              reg33 <= (((8'ha8) ?
                  {reg31[(1'h1):(1'h0)]} : ((~&wire9) ?
                      $signed(wire14[(4'h8):(3'h4)]) : {$unsigned(reg16),
                          reg18})) << $unsigned({$signed($unsigned(reg17))}));
              reg34 <= (~^{$unsigned(wire7[(3'h5):(2'h3)]),
                  reg16[(4'hb):(4'ha)]});
            end
          else
            begin
              reg30 <= reg21[(1'h0):(1'h0)];
              reg31 <= ((8'h9d) * (!((reg33[(3'h4):(1'h1)] <<< reg20[(3'h5):(1'h1)]) ?
                  (reg27[(3'h6):(1'h1)] ?
                      (reg29 >>> wire6) : (~wire11)) : ((!reg23) == {reg26}))));
            end
          reg35 <= $unsigned($unsigned(reg22[(3'h6):(3'h6)]));
        end
      reg36 <= wire13[(2'h3):(1'h1)];
      if ((({($unsigned(reg17) & ((8'hb4) >>> reg27)),
                  ((reg19 ? reg16 : reg35) - (reg21 ? wire7 : (8'hbe)))} ?
              (~&reg17) : reg33) ?
          $signed((8'hb8)) : reg36[(2'h3):(1'h1)]))
        begin
          reg37 <= $unsigned($unsigned(($signed(reg15) ~^ (^$unsigned(reg33)))));
          reg38 <= {$signed((&{((8'hb7) ? wire10 : reg31), {reg30, reg26}})),
              reg35[(4'hc):(1'h1)]};
          if ((~|($unsigned(($unsigned(reg25) <= reg35)) ^ reg30)))
            begin
              reg39 <= ($signed(((-(^reg19)) + $signed(reg29))) ?
                  {(&(~|reg16))} : ($unsigned({$unsigned(reg29)}) ?
                      (-(reg22 ?
                          {reg37,
                              reg33} : (!reg37))) : (($signed(reg25) != $signed(reg22)) >> wire8)));
              reg40 <= reg39;
              reg41 <= ((~$unsigned({(wire13 ? wire7 : reg28)})) >= reg32);
              reg42 <= $unsigned((~^$signed(($signed(reg21) ?
                  (reg16 << wire12) : (~&reg38)))));
            end
          else
            begin
              reg39 <= $unsigned(((~^reg38[(4'hd):(3'h6)]) >> (({wire12} ~^ (reg33 ?
                      reg22 : wire7)) ?
                  (^$unsigned(wire13)) : reg29)));
              reg40 <= (reg33[(2'h2):(2'h2)] ?
                  $unsigned($signed(reg16[(4'ha):(4'h8)])) : reg34[(5'h14):(5'h10)]);
              reg41 <= ((~^{$unsigned($signed(reg17)),
                  {reg35[(1'h1):(1'h0)]}}) && $unsigned(reg18));
              reg42 <= reg38[(4'hf):(3'h6)];
              reg43 <= (wire7 ? reg25 : (&reg30));
            end
        end
      else
        begin
          reg37 <= ($unsigned(reg16) >>> ((reg37[(2'h2):(1'h0)] && reg33) - $signed($unsigned((+wire10)))));
          reg38 <= reg32[(2'h3):(2'h3)];
          reg39 <= $signed((~reg34[(3'h6):(1'h1)]));
          reg40 <= (reg19 ^ ((wire8[(1'h1):(1'h1)] ^ $unsigned($unsigned(reg28))) ?
              reg34[(4'h8):(3'h7)] : {({reg34} || $unsigned((8'hb3))),
                  $unsigned((reg22 ? wire7 : reg35))}));
        end
    end
  assign wire44 = wire10;
  module45 #() modinst62 (.wire50(reg18), .wire48(reg43), .wire46(wire14), .clk(clk), .wire49(reg23), .wire47(reg35), .y(wire61));
  always
    @(posedge clk) begin
      reg63 <= $signed(wire44[(3'h4):(1'h1)]);
      if ((|((^{{wire61}}) >>> $signed(($signed(reg40) ?
          {reg21} : wire9[(2'h3):(2'h3)])))))
        begin
          if ($unsigned((((+(~|reg21)) ?
                  (+(wire14 > reg39)) : reg24[(3'h6):(2'h2)]) ?
              ($signed((wire6 ? reg36 : reg30)) ?
                  {$signed(reg21),
                      {reg40, reg30}} : wire14[(2'h3):(2'h2)]) : (((reg25 ?
                      wire61 : reg39) ?
                  wire10 : (8'hb4)) ^ $signed($unsigned(reg17))))))
            begin
              reg64 <= $signed(reg38[(4'hb):(4'ha)]);
              reg65 <= (~(^~$unsigned(reg16[(4'hd):(4'hc)])));
            end
          else
            begin
              reg64 <= wire61[(1'h0):(1'h0)];
              reg65 <= (((((wire11 ? wire13 : reg16) ?
                      {reg34} : reg18[(3'h6):(2'h2)]) <= {(~reg64)}) & (8'hb8)) ?
                  reg25[(1'h0):(1'h0)] : reg39[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg64 <= $unsigned((reg28[(4'hb):(4'ha)] != (wire11[(2'h3):(2'h3)] - $signed({reg65}))));
          reg65 <= ((8'hb4) <= (reg32 ? (8'ha1) : reg43[(3'h5):(3'h4)]));
          reg66 <= reg43;
          if ($unsigned((!(~&$unsigned({(7'h43), reg33})))))
            begin
              reg67 <= (^$signed({($unsigned(wire6) ?
                      wire13[(1'h1):(1'h0)] : (reg26 & wire9))}));
              reg68 <= ($signed($unsigned(((wire14 >>> wire10) ?
                  reg31[(1'h0):(1'h0)] : reg31))) - reg63);
            end
          else
            begin
              reg67 <= reg66[(3'h7):(3'h4)];
              reg68 <= (wire13[(3'h5):(1'h0)] ?
                  {(((~&reg24) << reg63) ?
                          reg38[(4'ha):(3'h4)] : ((reg66 ? reg29 : wire13) ?
                              (!wire13) : $unsigned((8'ha4))))} : (~|reg16));
              reg69 <= ((8'hab) ?
                  (+((|(^wire11)) << $signed((wire14 ?
                      reg35 : reg25)))) : ($signed($unsigned((8'hbb))) ?
                      (((!reg66) != wire13[(2'h3):(1'h1)]) & ($signed(reg41) >>> reg41)) : (+$signed((|reg31)))));
              reg70 <= ({(!reg42[(3'h4):(1'h0)]),
                      $signed(({reg25} - {reg38, (8'hba)}))} ?
                  $signed((wire10 <= {reg26,
                      $signed(wire7)})) : (((~^$signed(reg39)) <= $signed($signed(reg65))) ?
                      (8'hb8) : (+$signed($unsigned(wire14)))));
            end
          if ($signed({$unsigned((-((8'hbc) ? reg23 : wire11)))}))
            begin
              reg71 <= ({$unsigned({((8'ha8) ? wire8 : reg18)})} ?
                  ((~|reg40) ?
                      ((&reg15) ?
                          ((reg65 == reg67) ?
                              {reg15,
                                  reg40} : {reg36}) : wire11) : {$unsigned(wire44[(3'h5):(3'h5)]),
                          ({(8'h9d)} ?
                              $unsigned(reg42) : (!reg22))}) : reg29[(1'h0):(1'h0)]);
              reg72 <= reg67[(2'h3):(2'h3)];
              reg73 <= reg66;
            end
          else
            begin
              reg71 <= reg69;
              reg72 <= $unsigned($unsigned((~^reg63)));
            end
        end
      reg74 <= (reg34 ^ ((&$unsigned((~|wire8))) != reg73[(3'h5):(1'h0)]));
    end
  assign wire75 = $unsigned((^~$unsigned({(~&reg25), (reg28 * (7'h44))})));
  assign wire76 = (^((($unsigned((8'ha1)) >>> wire12[(1'h0):(1'h0)]) ?
                      reg21 : $unsigned((reg31 ? reg36 : wire75))) > reg37));
  assign wire77 = $unsigned(wire13);
  assign wire78 = reg16[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg79 <= $signed($signed(reg33[(3'h4):(1'h1)]));
      reg80 <= $signed(reg30);
      reg81 <= reg25[(1'h1):(1'h0)];
      reg82 <= $unsigned((reg38[(4'hd):(1'h1)] ?
          ($unsigned((8'hbb)) | $unsigned(wire75[(2'h3):(2'h2)])) : $unsigned($signed(reg67))));
    end
  assign wire83 = $signed($unsigned(reg36[(3'h4):(3'h4)]));
  assign wire84 = reg63;
  assign wire85 = $unsigned((8'had));
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= {wire50};
      reg52 <= (^$signed({($signed(wire46) ?
              (wire50 ? wire48 : wire50) : $unsigned((8'ha0))),
          reg51[(1'h1):(1'h1)]}));
      reg53 <= ((wire47 ?
              (~wire49[(4'hd):(3'h4)]) : (reg51 + ((+wire49) ?
                  (wire46 >= wire48) : (~^wire50)))) ?
          (((&wire48[(2'h3):(1'h0)]) | wire50[(1'h0):(1'h0)]) - $unsigned($signed((reg51 >>> (8'had))))) : wire49[(4'h9):(2'h3)]);
      reg54 <= (|wire48);
    end
  assign wire55 = (^wire47);
  assign wire56 = $unsigned($unsigned($signed(reg51[(2'h2):(1'h0)])));
  assign wire57 = ($signed($signed({(8'hbd),
                      (reg52 ? (8'hb5) : reg52)})) || $signed({wire47,
                      reg52[(1'h1):(1'h0)]}));
  assign wire58 = ({((|(reg54 + reg54)) || $unsigned((reg51 ?
                              wire55 : wire48))),
                          (|(reg52 ~^ (reg53 ? wire49 : wire57)))} ?
                      $unsigned(wire56) : (((~|$unsigned(reg51)) ?
                              (+{wire56}) : $signed($signed(wire57))) ?
                          $signed(reg51) : (reg54[(2'h2):(1'h0)] ~^ ({wire56,
                                  wire55} ?
                              (wire55 ?
                                  reg53 : reg51) : reg53[(4'h9):(2'h3)]))));
  assign wire59 = reg53;
  assign wire60 = (wire57[(4'hd):(3'h5)] & {($signed(wire57) < (7'h44)),
                      wire47});
endmodule

module module179  (y, clk, wire184, wire183, wire182, wire181, wire180);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire184;
  input wire [(5'h13):(1'h0)] wire183;
  input wire signed [(5'h11):(1'h0)] wire182;
  input wire [(4'hf):(1'h0)] wire181;
  input wire [(4'hc):(1'h0)] wire180;
  wire [(3'h5):(1'h0)] wire206;
  wire signed [(2'h3):(1'h0)] wire205;
  wire signed [(4'h8):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire203;
  wire [(3'h4):(1'h0)] wire202;
  wire [(4'hd):(1'h0)] wire201;
  wire signed [(5'h11):(1'h0)] wire200;
  wire signed [(4'ha):(1'h0)] wire199;
  wire [(4'he):(1'h0)] wire198;
  wire signed [(3'h4):(1'h0)] wire197;
  wire signed [(3'h6):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire186;
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'he):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire188,
                 wire187,
                 wire186,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg185,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg185 <= (({wire184[(4'he):(4'hb)]} > (wire184[(1'h1):(1'h0)] ?
              $unsigned((~&wire181)) : wire180)) ?
          $signed({$signed((wire180 == wire182))}) : $signed($unsigned((~|wire184))));
    end
  assign wire186 = $unsigned(({($signed(wire181) ?
                               (~(8'hb8)) : (reg185 ? (7'h40) : wire180)),
                           wire181[(4'he):(4'hb)]} ?
                       (^$signed((wire184 ?
                           wire182 : wire181))) : ($unsigned(((8'hb5) <<< wire182)) ^~ $unsigned((wire181 ?
                           reg185 : reg185)))));
  assign wire187 = (({$unsigned($unsigned((8'ha2))), $signed(wire182)} ?
                           wire186 : ($signed({wire180}) || wire181)) ?
                       wire182 : wire183[(3'h6):(1'h1)]);
  assign wire188 = $signed(($unsigned((|$signed(wire187))) >= $unsigned($signed(wire180[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((~wire182[(3'h4):(2'h2)]))
        begin
          reg189 <= $signed(($signed((wire186[(1'h0):(1'h0)] ?
              $signed(reg185) : (wire187 || wire186))) & (8'ha5)));
          reg190 <= $unsigned(wire188[(3'h4):(3'h4)]);
          reg191 <= $unsigned($unsigned($unsigned((((8'h9e) != wire186) ?
              (8'hb7) : (8'hb1)))));
          reg192 <= (8'ha6);
        end
      else
        begin
          reg189 <= (($unsigned($unsigned((wire188 & wire184))) & {reg189}) ?
              {$signed(reg185)} : $unsigned({{wire182},
                  $unsigned((wire184 ? reg189 : wire184))}));
        end
      reg193 <= reg190[(2'h3):(1'h0)];
      reg194 <= wire187;
      reg195 <= $unsigned((~|((reg185[(3'h5):(1'h0)] ?
              reg189[(1'h1):(1'h0)] : wire180[(3'h7):(1'h0)]) ?
          ($unsigned((8'ha8)) <<< (wire186 == wire180)) : (^~(|reg190)))));
      reg196 <= (reg193[(1'h0):(1'h0)] || wire183);
    end
  assign wire197 = $unsigned(($unsigned(reg190) ?
                       {$unsigned($signed(reg185))} : (!wire182[(4'ha):(3'h6)])));
  assign wire198 = (|reg192[(2'h2):(1'h0)]);
  assign wire199 = reg193;
  assign wire200 = ({$signed($signed((~&wire180)))} > wire199[(2'h2):(1'h0)]);
  assign wire201 = reg193[(1'h1):(1'h0)];
  assign wire202 = (wire198 ~^ $signed({wire182,
                       ((wire181 < wire200) ?
                           wire201 : reg185[(1'h1):(1'h1)])}));
  assign wire203 = ($unsigned((((^wire200) >= (^reg195)) ?
                           wire188[(1'h0):(1'h0)] : wire197)) ?
                       ($signed(reg195[(4'hd):(3'h7)]) <<< (((wire187 ?
                               wire187 : wire198) <= $signed(wire199)) ?
                           wire186[(2'h3):(2'h3)] : ($unsigned((7'h42)) ?
                               $signed(wire186) : $signed(reg192)))) : (reg185[(2'h3):(1'h1)] >>> $signed(reg195[(4'h8):(3'h5)])));
  assign wire204 = $unsigned(wire183);
  assign wire205 = ({$unsigned(wire183),
                       (((reg191 * (8'hb0)) ?
                           reg191 : (wire201 ?
                               reg195 : wire198)) < reg185[(2'h2):(2'h2)])} != $unsigned(wire180));
  assign wire206 = $signed($unsigned(({(wire202 ? (8'haa) : (8'hae)),
                           $unsigned((8'hb0))} ?
                       (reg190[(3'h6):(1'h0)] <<< (wire184 ?
                           wire203 : reg190)) : (~|$signed(reg189)))));
  always
    @(posedge clk) begin
      reg207 <= ($signed($unsigned($unsigned($unsigned(reg195)))) ^ $signed($signed({((7'h41) ?
              (8'hbe) : reg193)})));
    end
  always
    @(posedge clk) begin
      reg208 <= ($unsigned($unsigned(($signed(reg207) - (+reg194)))) <= wire181[(4'hb):(4'h9)]);
      reg209 <= wire197;
      reg210 <= wire183;
    end
endmodule

module module157  (y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire162;
  input wire signed [(3'h7):(1'h0)] wire161;
  input wire signed [(2'h2):(1'h0)] wire160;
  input wire [(3'h6):(1'h0)] wire159;
  input wire [(2'h2):(1'h0)] wire158;
  wire [(4'h8):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(5'h10):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire168;
  wire [(4'ha):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire165;
  wire signed [(5'h12):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire163;
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 (1'h0)};
  assign wire163 = ((wire158[(1'h1):(1'h0)] ^~ $unsigned({(!(8'hac))})) || $signed($signed(((^~(7'h40)) ?
                       (|wire161) : wire158))));
  assign wire164 = $unsigned($unsigned(((-$signed(wire158)) ?
                       $signed($signed(wire163)) : $signed(wire163[(4'hb):(4'h8)]))));
  assign wire165 = wire160[(1'h0):(1'h0)];
  assign wire166 = wire160[(2'h2):(1'h0)];
  assign wire167 = (-wire162[(1'h0):(1'h0)]);
  assign wire168 = ((((8'haa) >> ((wire160 || wire166) - {wire167,
                           wire163})) >= wire163) ?
                       ((|($unsigned((8'hb2)) ?
                           wire164 : (-wire161))) * ($unsigned(wire161) ?
                           {((8'haa) ? wire163 : wire161),
                               $signed(wire165)} : $signed($signed(wire158)))) : $unsigned((($unsigned(wire167) && wire167) ~^ $signed(wire164))));
  assign wire169 = (~(!wire164));
  assign wire170 = (~|(wire164 != ($unsigned(wire162) ?
                       ((wire159 ? wire160 : (8'ha7)) ?
                           (~^wire158) : $signed((7'h41))) : $unsigned((wire159 != wire169)))));
  assign wire171 = $unsigned($unsigned($unsigned((wire160[(2'h2):(1'h0)] ?
                       wire165 : wire168[(2'h2):(1'h1)]))));
  assign wire172 = (wire168[(2'h2):(2'h2)] || (^$unsigned($signed($unsigned((8'hb6))))));
  assign wire173 = {(((((8'hb3) ? wire162 : wire165) ?
                                   {wire166} : (~|wire168)) ?
                               wire172[(4'hc):(4'h9)] : wire166) ?
                           (!{(8'h9e)}) : wire169[(4'he):(2'h3)])};
  assign wire174 = ((($signed(wire163[(3'h4):(2'h2)]) ?
                           {$unsigned(wire162)} : $signed($unsigned(wire159))) ?
                       (wire171 ?
                           $signed(wire161[(3'h5):(3'h5)]) : $signed($unsigned(wire160))) : (($unsigned(wire163) ?
                               (wire172 & wire169) : (+wire163)) ?
                           $unsigned(wire162) : ($unsigned(wire158) || wire171))) + {{((^~wire158) | (wire160 ?
                               wire159 : wire159))}});
endmodule

module module126
#(parameter param151 = (((+(((8'h9c) ? (8'h9d) : (8'ha0)) == ((8'h9c) ^ (8'h9d)))) ? (-(8'hb2)) : (|(8'hb9))) << {(~|({(8'hb9)} ? {(8'hbb)} : {(8'hbc)}))}), 
parameter param152 = {(((^(param151 | param151)) ? (+{param151, param151}) : {(param151 ? param151 : (8'ha7))}) ? param151 : (((param151 ~^ param151) ? (~^param151) : param151) <<< ((!param151) >> (param151 ? param151 : param151))))})
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire130;
  input wire [(3'h5):(1'h0)] wire129;
  input wire [(4'he):(1'h0)] wire128;
  input wire signed [(4'h8):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire [(4'hc):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire131 = ((^~(-((8'had) ^~ $signed((8'hb4))))) & wire127[(3'h6):(3'h5)]);
  assign wire132 = (~|$signed(($unsigned($signed(wire129)) ?
                       (&wire127) : ({wire131,
                           (8'hab)} <= $unsigned((8'hb1))))));
  assign wire133 = $unsigned(wire132[(4'ha):(4'h9)]);
  assign wire134 = $signed((((wire128[(3'h6):(1'h0)] - {wire131}) ?
                       wire127 : wire129[(2'h3):(1'h1)]) & (^($signed(wire132) >= wire129[(3'h5):(1'h1)]))));
  assign wire135 = (~|$signed($unsigned((8'h9c))));
  assign wire136 = wire134;
  assign wire137 = (wire135[(4'he):(4'hb)] + wire133);
  assign wire138 = (~^(-($signed($signed(wire135)) > ({wire129} ?
                       wire132[(2'h3):(2'h2)] : (8'ha7)))));
  assign wire139 = wire138;
  assign wire140 = wire127;
  assign wire141 = wire128[(4'ha):(4'ha)];
  assign wire142 = {(~&wire127[(1'h1):(1'h1)]),
                       ((~wire138[(2'h3):(1'h1)]) ^~ wire127)};
  assign wire143 = $signed((wire139 ?
                       wire129 : $unsigned((wire139[(1'h0):(1'h0)] ?
                           $signed(wire132) : wire133))));
  always
    @(posedge clk) begin
      reg144 <= ($unsigned(((~&wire136[(1'h1):(1'h0)]) ?
          ($signed(wire139) ?
              (wire143 ? wire131 : (8'ha1)) : (wire143 ?
                  wire136 : wire143)) : (wire138 ~^ $signed(wire139)))) > wire129[(1'h0):(1'h0)]);
      reg145 <= ($unsigned(wire136[(3'h5):(3'h5)]) ~^ (8'ha5));
    end
  assign wire146 = (!$signed((wire128 * wire127)));
  assign wire147 = $unsigned(wire129[(1'h0):(1'h0)]);
  assign wire148 = (!(~|(((~^reg145) >>> wire132[(4'h8):(3'h4)]) ?
                       reg144[(4'ha):(3'h6)] : wire147)));
  assign wire149 = reg145;
  assign wire150 = wire141[(2'h2):(1'h1)];
endmodule
