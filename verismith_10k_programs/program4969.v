module top
#(parameter param303 = {({{(8'h9d)}} ? (~^(8'ha4)) : ({((8'hbc) * (8'ha7)), ((8'hb6) ? (8'h9d) : (8'hb2))} < (&{(7'h44), (8'ha9)})))}, 
parameter param304 = param303)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h269):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire302;
  wire signed [(5'h13):(1'h0)] wire301;
  wire [(5'h14):(1'h0)] wire300;
  wire [(4'he):(1'h0)] wire299;
  wire signed [(4'h9):(1'h0)] wire297;
  wire signed [(3'h5):(1'h0)] wire278;
  wire [(5'h13):(1'h0)] wire277;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire275;
  reg signed [(5'h14):(1'h0)] reg296 = (1'h0);
  reg [(5'h15):(1'h0)] reg295 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg294 = (1'h0);
  reg [(5'h11):(1'h0)] reg293 = (1'h0);
  reg [(4'hf):(1'h0)] reg292 = (1'h0);
  reg [(4'hc):(1'h0)] reg291 = (1'h0);
  reg [(4'hc):(1'h0)] reg290 = (1'h0);
  reg [(4'hf):(1'h0)] reg289 = (1'h0);
  reg [(3'h7):(1'h0)] reg288 = (1'h0);
  reg [(3'h4):(1'h0)] reg287 = (1'h0);
  reg [(4'hf):(1'h0)] reg286 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg285 = (1'h0);
  reg [(5'h14):(1'h0)] reg284 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg283 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg282 = (1'h0);
  reg [(3'h6):(1'h0)] reg281 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg280 = (1'h0);
  reg [(5'h15):(1'h0)] reg279 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  assign y = {wire302,
                 wire301,
                 wire300,
                 wire299,
                 wire297,
                 wire278,
                 wire277,
                 wire5,
                 wire113,
                 wire115,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire275,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire5 = ((|wire1) == $signed($unsigned($signed(wire2[(4'h8):(4'h8)]))));
  module6 #() modinst114 (.wire9(wire1), .wire8(wire3), .wire10(wire2), .y(wire113), .clk(clk), .wire7(wire0));
  assign wire115 = (-(wire3[(4'h8):(4'h8)] ?
                       wire2 : (wire5 ?
                           $signed((wire113 < wire3)) : $signed((wire1 * wire4)))));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(wire4)) >= $unsigned(wire113)))
        begin
          reg116 <= $signed({($signed(wire113) ?
                  ({wire5, wire1} << wire2[(3'h7):(2'h3)]) : (!(~&wire2)))});
          reg117 <= (~&wire1);
        end
      else
        begin
          if ((^~(!{$signed((wire4 <= wire115))})))
            begin
              reg116 <= $signed((wire1[(5'h10):(4'hb)] ?
                  reg117[(3'h7):(3'h7)] : wire115[(4'hc):(3'h5)]));
              reg117 <= (($signed($unsigned((wire2 | wire2))) ^~ (!wire4)) && (~&($signed((wire4 ^~ wire3)) ?
                  wire5[(1'h1):(1'h0)] : ($signed(wire4) | (-wire1)))));
              reg118 <= ((~wire3) ?
                  (wire4[(1'h0):(1'h0)] ?
                      (&((wire4 == wire115) ?
                          wire5[(1'h1):(1'h1)] : $unsigned(wire2))) : (wire4 != (((8'ha5) ?
                              reg117 : reg116) ?
                          (wire0 ?
                              wire4 : wire113) : reg116[(2'h2):(1'h1)]))) : $signed(wire1[(2'h3):(1'h1)]));
            end
          else
            begin
              reg116 <= wire0[(3'h4):(1'h1)];
              reg117 <= ((wire3 ?
                  $signed((&$signed(wire2))) : (~|wire5)) >= wire115[(4'h9):(1'h0)]);
              reg118 <= reg118[(3'h5):(1'h0)];
              reg119 <= $unsigned($unsigned((^($unsigned((8'h9e)) >= $signed(reg116)))));
            end
        end
      reg120 <= reg118;
      reg121 <= reg120[(1'h0):(1'h0)];
    end
  assign wire122 = reg121[(4'h8):(1'h0)];
  assign wire123 = $unsigned($signed($signed(wire0)));
  assign wire124 = $signed($signed((reg119 ?
                       $unsigned($signed(wire1)) : reg121)));
  assign wire125 = reg121;
  assign wire126 = (((({reg121, reg116} ?
                           wire3 : ((8'hbc) ? reg118 : wire113)) ?
                       $unsigned($signed(wire125)) : $unsigned((~&wire3))) - $signed((&(8'h9d)))) & wire3[(4'hb):(4'hb)]);
  always
    @(posedge clk) begin
      if ($signed(reg120[(1'h1):(1'h1)]))
        begin
          reg127 <= wire126;
          reg128 <= wire5;
          reg129 <= wire124;
          reg130 <= $signed(((($unsigned(reg121) >= wire5) <= ({(8'hb6)} != $signed(wire122))) - (~wire113[(1'h0):(1'h0)])));
          reg131 <= $unsigned({wire113[(1'h0):(1'h0)], {{reg128}, reg128}});
        end
      else
        begin
          reg127 <= ($unsigned((~^(~^{wire123, wire125}))) ? wire115 : reg128);
          reg128 <= reg119;
          reg129 <= wire0[(5'h13):(1'h0)];
          if ((~$signed($signed($signed(wire3[(4'hb):(4'h8)])))))
            begin
              reg130 <= $unsigned({$unsigned(reg129),
                  (((8'haf) ?
                      {reg129,
                          (7'h40)} : (wire123 >>> wire126)) - $signed($signed(wire4)))});
              reg131 <= {{reg120[(2'h2):(1'h0)], (8'ha6)}, (8'hb2)};
              reg132 <= ($signed(reg129) | (!$unsigned(($unsigned(wire124) ?
                  $signed((8'ha5)) : wire126))));
              reg133 <= ($signed(wire113[(2'h3):(2'h2)]) || (((~|(wire123 * reg117)) ?
                  $unsigned($signed(reg131)) : reg127) ^ (wire4[(1'h1):(1'h0)] >= wire122[(4'he):(3'h6)])));
              reg134 <= reg118[(1'h1):(1'h1)];
            end
          else
            begin
              reg130 <= (-reg130[(3'h6):(3'h6)]);
              reg131 <= (7'h42);
              reg132 <= wire0;
            end
        end
      reg135 <= $signed(({$unsigned($unsigned(reg118)), reg121} ?
          reg131 : $signed($signed((wire5 & reg128)))));
      reg136 <= (((^($signed((8'ha1)) >>> (-wire1))) ?
              reg132 : (~^$signed((^reg119)))) ?
          $unsigned({reg129[(3'h5):(3'h5)]}) : ($signed($signed((wire126 != reg119))) ?
              $signed({wire126,
                  wire0}) : ($signed(((8'hb4) + wire2)) - (^(wire0 > reg133)))));
    end
  module137 #() modinst276 (wire275, clk, wire124, reg127, reg117, wire126, wire123);
  assign wire277 = wire123;
  assign wire278 = $signed((reg134 >= (8'hae)));
  always
    @(posedge clk) begin
      reg279 <= ($signed($signed($unsigned(reg121[(4'he):(4'h9)]))) >> (+$signed((~(reg121 ?
          wire3 : reg136)))));
      if ({wire113[(1'h0):(1'h0)],
          $unsigned($signed(((8'had) - (wire123 ? wire125 : reg118))))})
        begin
          reg280 <= {reg119[(2'h2):(1'h1)], (~&wire4[(2'h2):(1'h1)])};
        end
      else
        begin
          reg280 <= (~|$signed({{wire1, wire113},
              ((~(8'hb8)) ? $signed((7'h40)) : (wire123 ? wire125 : reg136))}));
          if ($unsigned(wire3))
            begin
              reg281 <= wire277[(4'h9):(2'h3)];
              reg282 <= wire2[(2'h2):(1'h0)];
              reg283 <= (~^(&$signed(reg136)));
              reg284 <= $signed((&{{$unsigned(wire4)},
                  (wire1[(2'h3):(2'h2)] ? reg134 : reg118)}));
            end
          else
            begin
              reg281 <= $unsigned(reg133[(3'h5):(1'h1)]);
              reg282 <= (((wire278[(2'h3):(1'h1)] <<< reg116) ?
                      ((wire277[(4'ha):(1'h0)] >> wire5[(1'h0):(1'h0)]) ?
                          wire123 : $signed(wire123)) : (|(|$signed((8'hb8))))) ?
                  $unsigned($signed(($signed(reg279) > (wire124 - (8'h9d))))) : $unsigned(($unsigned({wire125,
                      reg131}) && ({(8'ha0)} && {(7'h42), wire277}))));
              reg283 <= reg118;
              reg284 <= ((wire115[(4'hd):(4'ha)] && {reg129,
                  wire115}) * $signed((~|$unsigned(reg127))));
              reg285 <= (8'hb5);
            end
          if (reg119)
            begin
              reg286 <= wire122;
              reg287 <= reg128;
              reg288 <= reg136;
              reg289 <= $signed(((((wire0 | wire123) - (-reg280)) ?
                  reg288[(3'h7):(2'h2)] : ($signed((8'hb4)) ?
                      wire123[(1'h0):(1'h0)] : wire4)) + reg280[(4'ha):(3'h6)]));
              reg290 <= reg120[(2'h2):(2'h2)];
            end
          else
            begin
              reg286 <= (!(reg281[(2'h3):(1'h0)] ?
                  $unsigned(reg116) : wire113[(1'h0):(1'h0)]));
              reg287 <= reg136[(2'h2):(1'h0)];
              reg288 <= $unsigned(reg136[(2'h3):(1'h1)]);
              reg289 <= ($signed($unsigned(($unsigned((8'hb0)) & $signed(reg116)))) ?
                  reg290 : ($unsigned($signed((reg132 ?
                      reg119 : reg135))) | ((-(~^reg279)) ?
                      $unsigned((wire0 ?
                          reg131 : reg283)) : wire0[(3'h4):(2'h2)])));
              reg290 <= $signed($unsigned((~($unsigned((8'ha2)) ?
                  {wire278} : (8'hb1)))));
            end
        end
      reg291 <= $unsigned(reg127[(3'h5):(2'h3)]);
      reg292 <= (-$signed((^~wire2)));
      reg293 <= (~&(~&$unsigned(wire124)));
    end
  always
    @(posedge clk) begin
      reg294 <= ((reg280[(4'hc):(3'h5)] & (~|{(wire277 || wire126)})) > reg132[(4'hf):(1'h1)]);
      reg295 <= reg280;
      reg296 <= {($signed(reg291[(1'h0):(1'h0)]) >> $unsigned(wire0[(3'h6):(3'h4)])),
          wire4[(2'h2):(2'h2)]};
    end
  module6 #() modinst298 (.wire9(reg291), .wire8(reg279), .clk(clk), .wire10(wire0), .wire7(wire122), .y(wire297));
  assign wire299 = $signed({$unsigned($signed((reg283 ? reg121 : reg280)))});
  assign wire300 = reg295[(2'h2):(1'h0)];
  assign wire301 = (+wire122[(4'hc):(1'h0)]);
  assign wire302 = reg279;
endmodule

module module137
#(parameter param274 = ((({(8'hb5)} - (~|(+(8'haf)))) < ((!{(8'ha7)}) ? ((+(8'hb2)) ? {(8'ha5), (8'hb0)} : {(8'hba)}) : (~&((8'h9f) ? (8'ha9) : (8'hbf))))) ^ (~(((+(8'hbb)) ? ((8'ha9) >= (8'hb9)) : ((8'ha3) ? (7'h44) : (8'hb7))) <<< (((8'h9d) ? (8'ha8) : (8'hbc)) == {(8'haf), (8'hb6)})))))
(y, clk, wire138, wire139, wire140, wire141, wire142);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire138;
  input wire signed [(4'hf):(1'h0)] wire139;
  input wire [(4'ha):(1'h0)] wire140;
  input wire [(5'h14):(1'h0)] wire141;
  input wire [(3'h4):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire273;
  wire signed [(4'he):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire179;
  wire [(4'hf):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire213;
  wire signed [(5'h14):(1'h0)] wire215;
  wire [(4'hd):(1'h0)] wire271;
  reg [(5'h14):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  assign y = {wire273,
                 wire155,
                 wire176,
                 wire178,
                 wire179,
                 wire188,
                 wire213,
                 wire215,
                 wire271,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  module143 #() modinst156 (.clk(clk), .wire145(wire141), .wire146(wire140), .wire147(wire139), .wire144(wire138), .y(wire155));
  module157 #() modinst177 (wire176, clk, wire141, wire140, wire155, wire139);
  assign wire178 = (({(-wire140), (wire139 < ((8'hba) ~^ wire142))} ?
                           (wire139[(4'hf):(1'h0)] ?
                               (~$signed(wire176)) : ((~^wire140) ?
                                   {wire142, wire155} : wire140)) : wire139) ?
                       ($unsigned((wire155[(4'h8):(3'h5)] != $unsigned(wire155))) ?
                           $unsigned(wire141) : wire155[(2'h3):(1'h1)]) : wire139);
  assign wire179 = {{$signed(wire142), $unsigned($unsigned($signed((7'h43))))},
                       $signed((wire178[(4'h8):(3'h7)] + ($signed(wire139) ?
                           wire178[(5'h11):(2'h3)] : ((8'hbd) ?
                               wire138 : wire176))))};
  always
    @(posedge clk) begin
      reg180 <= {wire176};
      if ((reg180 ? wire141[(4'hb):(4'ha)] : (8'hbd)))
        begin
          reg181 <= ($signed((^$unsigned($signed(wire178)))) - (-(+(wire142[(1'h0):(1'h0)] ?
              wire176[(5'h12):(3'h4)] : $unsigned(wire155)))));
        end
      else
        begin
          reg181 <= wire142[(1'h0):(1'h0)];
          reg182 <= wire176[(4'hc):(3'h4)];
          reg183 <= reg182[(1'h1):(1'h0)];
          reg184 <= {(wire139 ?
                  ($signed(((8'hb4) ? (8'hb1) : (8'h9e))) ?
                      $unsigned(reg183) : $unsigned($unsigned(wire179))) : wire178),
              reg181};
          reg185 <= ((~^$unsigned({(wire138 + reg180)})) ? {wire140} : reg183);
        end
      reg186 <= reg184;
      reg187 <= $signed($signed((wire178[(4'he):(2'h3)] ?
          $unsigned(wire142[(3'h4):(1'h1)]) : ({reg180, wire176} ?
              $unsigned(wire141) : $unsigned(wire155)))));
    end
  assign wire188 = ($unsigned(($unsigned((^reg186)) ?
                           $signed(((8'ha8) ?
                               wire138 : (8'hb7))) : $unsigned($unsigned(wire138)))) ?
                       ((wire176 ?
                           reg183[(5'h14):(4'hd)] : $signed((reg186 <= (8'h9d)))) ^~ reg180) : ($unsigned((8'hb0)) ?
                           $signed(({(8'hb8), wire140} ?
                               reg185 : wire176)) : ($unsigned({wire179,
                               reg180}) == (+reg184))));
  module189 #() modinst214 (wire213, clk, reg186, reg185, reg182, reg181);
  assign wire215 = (~|reg187[(2'h3):(2'h3)]);
  module216 #() modinst272 (.wire221(wire215), .y(wire271), .wire217(reg187), .wire219(wire176), .wire220(reg183), .clk(clk), .wire218(wire139));
  assign wire273 = $signed(reg185[(2'h3):(1'h0)]);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire101;
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire11,
                 wire87,
                 wire101,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire11 = $unsigned(wire10);
  module12 #() modinst88 (.wire13(wire7), .clk(clk), .wire14(wire10), .wire15(wire11), .wire16(wire9), .y(wire87));
  module89 #() modinst102 (.wire92(wire87), .wire94(wire9), .wire91(wire10), .wire90(wire11), .y(wire101), .wire93(wire8), .clk(clk));
  always
    @(posedge clk) begin
      reg103 <= (wire11 ^ wire10);
      reg104 <= (($unsigned(($unsigned(wire8) >>> (-wire101))) ?
              {{{wire9}, wire11[(3'h7):(3'h6)]},
                  wire9} : $unsigned((~&$unsigned(wire11)))) ?
          wire11 : $unsigned(reg103[(3'h4):(3'h4)]));
      reg105 <= (!$unsigned((($signed(wire7) >= reg104) || ((wire9 ?
          wire11 : wire10) ~^ wire11))));
    end
  assign wire106 = ((wire9[(4'hc):(2'h3)] ^ $unsigned(($unsigned(wire87) ?
                           ((8'hbd) ?
                               reg103 : wire10) : wire7[(5'h10):(3'h6)]))) ?
                       (~&$signed(reg103)) : $unsigned({($signed((8'ha5)) ^ wire8[(2'h3):(1'h0)]),
                           wire8[(4'hf):(2'h2)]}));
  assign wire107 = $signed(wire8[(4'hd):(2'h3)]);
  assign wire108 = wire7;
  assign wire109 = $signed(((~|$signed((wire106 ? wire106 : wire101))) ?
                       wire101 : $unsigned(((wire10 == wire101) ?
                           $unsigned(wire9) : (wire8 ? reg104 : reg104)))));
  assign wire110 = wire87[(5'h11):(3'h4)];
  assign wire111 = $unsigned(wire101[(2'h2):(2'h2)]);
  assign wire112 = wire9;
endmodule

module module89
#(parameter param100 = (~({(((8'hae) ^ (8'hb1)) ^~ ((8'hb7) ^~ (8'ha7))), (((8'hb3) ? (8'ha5) : (8'hb2)) ? ((8'ha8) ? (8'h9c) : (8'h9c)) : (8'h9e))} - {((^(7'h40)) * ((8'ha1) ? (8'ha9) : (7'h42)))})))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire94;
  input wire [(5'h14):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  input wire [(4'hc):(1'h0)] wire91;
  input wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  assign y = {wire99, wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = {wire92};
  assign wire96 = (wire91[(3'h4):(3'h4)] ?
                      (&{((&wire91) ?
                              ((8'hb1) ?
                                  (8'hab) : wire90) : wire91)}) : $signed((~$signed($signed(wire91)))));
  assign wire97 = ((~^$unsigned(wire90)) ?
                      ((wire93 ^ (wire95 && (^wire94))) ?
                          (-$unsigned((~|wire95))) : (^(wire95[(1'h0):(1'h0)] >>> (wire94 < wire91)))) : (8'ha2));
  assign wire98 = ((!({(~^wire94),
                      wire93[(4'hf):(4'h9)]} >= wire97)) + (|(~&((-wire91) ?
                      wire96[(1'h1):(1'h0)] : ((8'hb6) ? wire96 : wire94)))));
  assign wire99 = $signed(($signed($unsigned(wire95[(3'h4):(2'h3)])) ?
                      ($signed(wire98) ?
                          wire95[(3'h5):(2'h2)] : ((wire96 < wire96) ?
                              wire91[(2'h3):(2'h3)] : $signed((8'hb1)))) : ((8'ha5) || $unsigned(wire90[(1'h0):(1'h0)]))));
endmodule

module module12
#(parameter param85 = (((~|((!(8'hb6)) ? ((8'ha7) ? (8'hb9) : (8'haa)) : ((8'hbb) ? (8'ha4) : (8'hb8)))) ? ((((8'had) >> (8'ha1)) - ((8'ha1) ? (8'h9f) : (8'hb3))) ? (&(^(8'hbc))) : ((!(8'hb1)) - (&(8'hbb)))) : (~|({(8'h9d)} && ((8'ha3) ? (8'h9e) : (7'h43))))) ? (((!(~|(8'hb4))) * (^(~&(8'ha1)))) ? {{((8'haf) ? (8'ha9) : (8'ha4)), ((8'had) ? (8'ha6) : (8'ha7))}} : (|((&(8'hab)) << (&(8'ha2))))) : (((((8'hb5) ? (8'hb7) : (8'hb5)) >= (8'hb3)) ? (((8'hba) ? (8'had) : (7'h43)) ? (|(8'hac)) : ((8'ha9) ? (8'hb8) : (8'ha3))) : ((8'haa) ? ((8'hba) ^ (8'ha1)) : ((8'hac) - (8'h9c)))) ? ((8'ha1) ? ({(8'h9c)} ~^ ((8'had) ^~ (8'ha3))) : (((8'ha9) ? (8'hbb) : (8'ha9)) >= ((7'h41) ? (8'hb0) : (7'h43)))) : ((~^{(8'ha7), (8'ha6)}) || {(~&(8'hb6)), {(8'haa)}}))), 
parameter param86 = (({({param85, param85} ? (param85 ? param85 : param85) : {param85, (8'haa)})} >>> (8'hb2)) * ((!{(param85 ? param85 : param85)}) & (param85 * ((param85 <= param85) + {param85, param85})))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h348):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire36,
                 wire35,
                 wire34,
                 wire18,
                 wire17,
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
                 reg38,
                 reg37,
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
                 (1'h0)};
  assign wire17 = $unsigned((&wire13));
  assign wire18 = ($signed((~&(+$unsigned(wire16)))) ?
                      $unsigned(wire17[(4'ha):(2'h2)]) : ((($signed((8'hb9)) ?
                              wire15 : (^wire16)) | ($unsigned(wire14) ?
                              (|wire13) : $signed(wire16))) ?
                          (~|wire15) : wire17[(5'h10):(1'h1)]));
  always
    @(posedge clk) begin
      reg19 <= ((~{$signed({wire14, wire17})}) ?
          ($signed((+(wire18 ?
              wire14 : wire17))) < wire17[(5'h11):(5'h11)]) : $signed($signed({(wire17 ?
                  wire16 : wire15),
              (~&wire13)})));
    end
  always
    @(posedge clk) begin
      reg20 <= $signed(wire15[(1'h0):(1'h0)]);
      reg21 <= {wire17[(3'h6):(2'h3)]};
      reg22 <= {$signed(reg21[(4'hc):(4'ha)])};
      reg23 <= $unsigned(((^(|$unsigned(wire15))) ?
          $unsigned(wire13) : ($unsigned($signed(reg20)) ?
              $unsigned($unsigned(reg20)) : (~wire18))));
      if (($signed(reg20) ? reg23[(1'h1):(1'h1)] : reg21[(3'h4):(2'h3)]))
        begin
          reg24 <= wire14[(1'h1):(1'h0)];
          if ($unsigned($signed($signed((reg22 & (~|reg20))))))
            begin
              reg25 <= ($signed(wire17[(1'h1):(1'h0)]) != $unsigned($signed(wire15)));
              reg26 <= reg25;
            end
          else
            begin
              reg25 <= ($unsigned((((reg22 - wire18) ?
                  $signed(reg22) : (reg25 & (8'hab))) + $signed((^wire13)))) << ($unsigned({wire16}) ?
                  ({$unsigned(wire14)} ?
                      ({reg22,
                          reg19} + (wire15 >>> wire18)) : $signed(wire14[(1'h1):(1'h1)])) : (wire13 ?
                      (reg20[(2'h3):(1'h1)] <= ((8'ha3) | reg20)) : wire18)));
              reg26 <= $unsigned({(wire14[(3'h7):(3'h4)] ?
                      (7'h44) : ((wire18 < reg25) >> (wire16 ?
                          (8'hba) : reg22)))});
            end
        end
      else
        begin
          if ($unsigned(reg25[(2'h3):(2'h3)]))
            begin
              reg24 <= ($signed($signed(wire15[(1'h1):(1'h1)])) ?
                  reg21[(3'h4):(1'h1)] : wire17[(4'hf):(2'h3)]);
              reg25 <= $signed((8'h9d));
              reg26 <= (wire16 <<< $signed((~$unsigned((8'h9f)))));
              reg27 <= reg23;
            end
          else
            begin
              reg24 <= wire18[(5'h10):(4'hd)];
              reg25 <= $signed(reg25);
            end
          if (((wire16 == wire18) ?
              (reg19 << ($signed((^reg24)) ?
                  wire17[(4'ha):(4'ha)] : $unsigned(wire18[(1'h0):(1'h0)]))) : reg21[(2'h2):(2'h2)]))
            begin
              reg28 <= {(^~({(reg27 > (7'h43))} | ((reg22 ? (8'hb7) : reg24) ?
                      $signed(reg24) : {(8'hb1)}))),
                  reg26};
            end
          else
            begin
              reg28 <= (|(^reg19[(3'h5):(2'h2)]));
              reg29 <= $signed((-((~reg27[(4'h8):(3'h6)]) ?
                  $signed({reg21}) : {wire14[(3'h7):(3'h7)],
                      (wire13 - wire14)})));
              reg30 <= {reg27};
            end
        end
    end
  always
    @(posedge clk) begin
      reg31 <= reg27;
      reg32 <= $unsigned({wire17});
      reg33 <= $unsigned($unsigned((reg19[(4'h9):(4'h9)] <= (8'haf))));
    end
  assign wire34 = reg28;
  assign wire35 = ($unsigned(reg28[(2'h2):(1'h1)]) <= wire14);
  assign wire36 = reg27;
  always
    @(posedge clk) begin
      reg37 <= $unsigned(wire18);
      if ((~|(reg23[(4'hb):(3'h6)] & (((wire36 ?
              reg37 : reg28) + $unsigned(reg28)) ?
          ((wire17 < reg26) > (reg33 ^~ wire14)) : reg26))))
        begin
          reg38 <= (wire36[(1'h1):(1'h1)] ?
              (~|$unsigned({(reg31 ?
                      reg21 : reg22)})) : (^($signed($unsigned(reg30)) && wire15[(4'hd):(1'h0)])));
          reg39 <= $signed($unsigned(reg32[(4'h9):(3'h4)]));
          reg40 <= $signed($unsigned(({{reg26}, $unsigned(reg25)} ?
              reg30 : {$signed(reg39)})));
          reg41 <= ((reg25 << (((wire16 >> wire36) ?
              reg33 : $unsigned(reg31)) < (~|(&reg26)))) && $unsigned((-$signed($signed(wire15)))));
        end
      else
        begin
          if ($signed({{(reg30[(3'h4):(1'h0)] ? $unsigned(reg30) : (^reg31))}}))
            begin
              reg38 <= {reg39[(2'h2):(1'h0)]};
            end
          else
            begin
              reg38 <= (-(!wire15[(4'ha):(3'h5)]));
              reg39 <= ((wire13 ?
                  ((reg23[(3'h5):(3'h5)] ?
                      (reg39 <<< reg38) : wire15[(3'h6):(3'h5)]) ~^ $unsigned(reg41)) : $signed($signed((~^reg31)))) >= ($unsigned($signed((8'h9d))) ?
                  {reg31[(1'h0):(1'h0)],
                      $unsigned($unsigned(wire14))} : $unsigned(reg24[(1'h0):(1'h0)])));
              reg40 <= (!({reg37[(2'h3):(2'h2)], reg40[(1'h0):(1'h0)]} ?
                  reg24[(2'h3):(1'h0)] : reg21[(3'h6):(3'h6)]));
              reg41 <= $signed(wire15);
              reg42 <= $unsigned(reg26);
            end
          reg43 <= $unsigned((~|(^~((wire36 + reg27) ?
              reg42[(4'h9):(1'h0)] : (reg23 ? reg32 : (8'ha0))))));
          reg44 <= reg43;
          reg45 <= (^~(&wire17));
          reg46 <= ($signed(((reg31[(1'h1):(1'h1)] ?
              (~&reg33) : (reg28 ?
                  reg33 : (8'hba))) || wire15[(2'h2):(1'h0)])) <= reg39[(5'h14):(5'h13)]);
        end
      reg47 <= ($signed((!$signed($signed(wire15)))) ?
          {reg27,
              $unsigned((&$signed(reg41)))} : $unsigned($signed((~&reg22))));
      reg48 <= $signed((~reg28[(4'h8):(2'h3)]));
    end
  assign wire49 = ((reg42 ?
                      (^($signed(reg42) ?
                          (wire13 & (8'ha2)) : $unsigned(reg33))) : reg21) != $unsigned(reg39[(5'h10):(4'hd)]));
  assign wire50 = reg32;
  assign wire51 = ($signed(reg21) ~^ (^~(reg45 || ((reg19 & (8'h9f)) ?
                      $unsigned(wire17) : {reg33}))));
  assign wire52 = {($unsigned({((8'ha1) == reg29),
                          (reg19 * reg26)}) - {($signed(reg43) ?
                              (reg20 ? wire15 : reg23) : $signed(reg42))}),
                      $unsigned(((-$signed(reg22)) >>> {$unsigned(reg47)}))};
  always
    @(posedge clk) begin
      if ({reg24, (-$unsigned($unsigned(wire18[(2'h2):(1'h1)])))})
        begin
          reg53 <= wire50[(3'h7):(1'h1)];
          if ($unsigned(({reg28,
                  ($unsigned(wire17) ? reg25[(1'h1):(1'h1)] : wire49)} ?
              $unsigned($signed((reg25 ?
                  reg24 : reg53))) : (^reg33[(2'h3):(2'h2)]))))
            begin
              reg54 <= (~&$unsigned((^~($signed(reg24) != $signed(wire18)))));
            end
          else
            begin
              reg54 <= ((((&(+wire49)) ?
                      reg31[(2'h2):(1'h0)] : {$signed(reg38),
                          $signed(reg48)}) ^ {(reg37[(2'h2):(1'h1)] ?
                          $signed(wire16) : wire17)}) ?
                  $unsigned($unsigned(($unsigned(reg44) ?
                      (~&reg43) : (wire13 | (8'ha6))))) : $unsigned({(&reg37[(2'h3):(1'h1)])}));
              reg55 <= reg48;
              reg56 <= (reg38[(1'h1):(1'h1)] & ($signed((!$signed(wire50))) ?
                  reg45 : $unsigned(wire52)));
            end
          if (($unsigned({{$signed(reg20),
                  (wire14 + wire18)}}) > ((((8'h9c) * $unsigned(wire17)) > (8'ha9)) ?
              $signed((8'ha9)) : $unsigned(reg44[(1'h0):(1'h0)]))))
            begin
              reg57 <= reg32;
              reg58 <= $signed({($unsigned($signed(wire49)) << (~^((7'h40) >>> reg39))),
                  (~&$signed(reg56))});
              reg59 <= $unsigned($signed($signed($signed($unsigned((8'hb6))))));
              reg60 <= (&{((7'h43) > {{wire50, (8'hb2)},
                      (reg20 ? reg38 : reg54)})});
            end
          else
            begin
              reg57 <= reg27[(4'he):(4'h8)];
              reg58 <= reg21;
            end
          reg61 <= reg55;
        end
      else
        begin
          reg53 <= (({(~&$unsigned(reg44))} << $signed($unsigned(reg48[(1'h1):(1'h0)]))) <<< ($signed({$unsigned(wire35),
              (8'hac)}) + ((~&$unsigned(reg24)) & ($signed(reg47) <= {reg29,
              reg59}))));
          if ($signed($unsigned($unsigned(wire49[(3'h4):(1'h1)]))))
            begin
              reg54 <= (&(reg31[(1'h0):(1'h0)] ?
                  (^$signed({reg33})) : reg61[(1'h0):(1'h0)]));
              reg55 <= (~((((8'hb3) * $signed(reg20)) ~^ $signed({reg43})) >> $unsigned($signed($signed((8'ha2))))));
              reg56 <= (|reg53);
              reg57 <= $unsigned(reg57[(2'h3):(1'h1)]);
              reg58 <= {(8'hb5),
                  (^~(($unsigned(reg33) - (wire51 * (8'h9d))) ?
                      reg46[(2'h3):(2'h3)] : (~(reg40 && reg59))))};
            end
          else
            begin
              reg54 <= (~&(~&{reg53[(1'h1):(1'h0)]}));
              reg55 <= $signed(($unsigned({$signed(reg31)}) ?
                  reg29[(3'h6):(3'h6)] : ((reg44[(3'h5):(3'h5)] ?
                      $signed(reg37) : reg57) >= ($unsigned(reg61) << $signed(wire35)))));
              reg56 <= ((reg48 ?
                  ((|$signed(reg28)) & $unsigned($unsigned(wire52))) : (+{reg33,
                      (8'hab)})) << ({reg48[(1'h1):(1'h1)],
                      $unsigned($unsigned((8'hae)))} ?
                  ((8'hab) ?
                      (((7'h42) + reg40) ?
                          wire17 : (wire49 < reg32)) : (wire34[(4'hf):(4'he)] ?
                          $signed(reg48) : (|reg29))) : (^$unsigned(wire51[(4'hf):(3'h7)]))));
              reg57 <= reg37;
              reg58 <= (wire17 ?
                  $signed(reg37[(2'h3):(2'h2)]) : (({(wire34 ^~ reg40),
                      {reg20}} >> $signed(((8'hb5) ^~ reg23))) != $unsigned((~|(+reg61)))));
            end
          reg59 <= (~&(reg54 >= (reg29 ?
              $unsigned(wire18) : (~|{reg30, wire16}))));
          reg60 <= reg25[(3'h4):(1'h0)];
        end
      reg62 <= (^((~&(wire52[(1'h1):(1'h1)] ?
          {wire18} : reg32)) ^~ ((reg20[(3'h4):(1'h0)] ?
              (wire17 - reg43) : {wire34}) ?
          $signed($signed(reg47)) : $signed($signed(reg45)))));
      reg63 <= (~$unsigned(((8'ha5) == reg43[(1'h0):(1'h0)])));
      if ($signed({((&reg26[(4'h9):(4'h9)]) ?
              reg19[(1'h0):(1'h0)] : $signed($signed((8'hb1))))}))
        begin
          if ((+$signed($signed(reg58[(4'ha):(1'h0)]))))
            begin
              reg64 <= (-(~&($signed((~&reg56)) - reg60)));
              reg65 <= (reg33[(4'hd):(4'hc)] << $unsigned(reg31[(1'h0):(1'h0)]));
              reg66 <= $unsigned(((~&wire52) > ({$signed(reg20),
                  $signed(wire34)} || (|{(8'h9c), wire52}))));
            end
          else
            begin
              reg64 <= reg39[(2'h3):(1'h1)];
              reg65 <= wire35;
              reg66 <= $unsigned($signed($unsigned(((wire34 && wire34) ?
                  {(8'ha9)} : (~|reg58)))));
            end
          reg67 <= (8'hbd);
          reg68 <= ((!reg41) || wire36[(1'h1):(1'h0)]);
          if ((!reg47[(2'h2):(2'h2)]))
            begin
              reg69 <= ({$unsigned({(wire34 <= wire50), reg43[(2'h2):(1'h1)]}),
                  $signed(reg48[(2'h2):(1'h0)])} && ((~reg28) | (!(~^$signed(reg63)))));
              reg70 <= (~&reg24[(1'h1):(1'h0)]);
              reg71 <= {(reg57 ^ $signed($signed($unsigned(reg67)))),
                  (wire50[(3'h6):(3'h6)] == (&{$unsigned(reg59),
                      reg55[(2'h3):(1'h0)]}))};
              reg72 <= $unsigned(($unsigned($signed($unsigned(reg32))) ?
                  $unsigned(reg23[(4'he):(4'hd)]) : (^~({reg23,
                      reg42} == {reg56, (8'hb2)}))));
            end
          else
            begin
              reg69 <= {$signed((reg20[(3'h4):(2'h2)] * $unsigned($unsigned((8'haa)))))};
              reg70 <= ((|$unsigned(($signed(wire14) ?
                  $unsigned((8'hb7)) : reg44))) > reg43);
              reg71 <= (($unsigned(($unsigned(reg47) != $signed(reg67))) ?
                      $unsigned($unsigned($signed(wire50))) : reg23[(4'h9):(1'h1)]) ?
                  (reg22[(4'h8):(2'h3)] ?
                      $unsigned((|(|reg21))) : ({$signed(reg65)} > reg59)) : wire51);
              reg72 <= (8'ha5);
            end
          reg73 <= (~^{{(~&(!reg54))}});
        end
      else
        begin
          reg64 <= (($unsigned({(+reg70)}) - ($unsigned($signed((8'hbe))) ?
              (reg57 <<< (^~(8'had))) : ((reg24 ? reg38 : wire14) ?
                  {wire18, (8'hbd)} : (8'ha4)))) < reg25[(1'h1):(1'h0)]);
          reg65 <= $unsigned(($signed((~|(~&(8'h9e)))) && $signed(({(8'hb7),
              reg40} >>> reg73))));
        end
      if (((8'hb7) ?
          {reg24[(2'h2):(2'h2)]} : $unsigned((~(-(reg58 ~^ (8'h9d)))))))
        begin
          reg74 <= reg33;
          reg75 <= $unsigned(reg38[(1'h0):(1'h0)]);
        end
      else
        begin
          reg74 <= ((^reg63[(4'he):(4'he)]) ?
              {$signed($unsigned(reg33)),
                  $unsigned(reg71)} : {$unsigned(reg43)});
        end
    end
  assign wire76 = (reg41 ~^ (|wire14[(4'h8):(1'h1)]));
  assign wire77 = (reg23 + reg45[(4'h8):(3'h7)]);
  assign wire78 = $unsigned($signed($signed((reg33 ?
                      (|reg33) : reg46[(5'h10):(4'hc)]))));
  assign wire79 = {{(reg40[(1'h1):(1'h0)] ? (~&reg54) : ({(8'hac)} | (~reg46))),
                          ($signed((~|(8'hab))) ?
                              (reg29[(4'hd):(4'h8)] * (reg57 ?
                                  wire78 : (8'h9d))) : (!(reg57 ?
                                  reg69 : reg22)))},
                      reg45[(4'h9):(4'h8)]};
  assign wire80 = wire76[(2'h3):(2'h3)];
  assign wire81 = reg37[(1'h1):(1'h1)];
  assign wire82 = ({($unsigned($unsigned(wire13)) >> {((8'hba) & reg59)})} ?
                      (($unsigned((|reg31)) && {(reg40 ? wire36 : reg58)}) ?
                          ((reg44 ? (~&reg70) : (reg19 <<< wire36)) ?
                              $unsigned(reg67) : reg64[(1'h1):(1'h1)]) : {$unsigned((wire35 ?
                                  wire34 : wire16)),
                              (&wire14[(4'h9):(1'h1)])}) : {reg39,
                          $signed((^reg45[(3'h4):(1'h1)]))});
  assign wire83 = (-($signed(reg66) ~^ reg43[(1'h0):(1'h0)]));
  assign wire84 = {{{$unsigned({reg29, (7'h42)})}}};
endmodule

module module216
#(parameter param269 = (~((|{(^~(8'hab))}) != (+(|((8'ha6) ? (8'hb5) : (8'ha3)))))), 
parameter param270 = ((~|(param269 ? ((param269 ? param269 : param269) ^~ ((8'h9d) ? param269 : param269)) : param269)) - {(param269 ? param269 : (param269 ? param269 : (param269 >= param269)))}))
(y, clk, wire221, wire220, wire219, wire218, wire217);
  output wire [(32'h276):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire221;
  input wire [(4'hd):(1'h0)] wire220;
  input wire [(5'h13):(1'h0)] wire219;
  input wire [(2'h3):(1'h0)] wire218;
  input wire [(5'h14):(1'h0)] wire217;
  wire [(4'hf):(1'h0)] wire268;
  wire signed [(4'hc):(1'h0)] wire267;
  wire [(4'hf):(1'h0)] wire264;
  wire [(5'h14):(1'h0)] wire263;
  wire signed [(5'h12):(1'h0)] wire262;
  wire [(5'h12):(1'h0)] wire261;
  wire [(5'h15):(1'h0)] wire260;
  wire signed [(3'h5):(1'h0)] wire250;
  wire signed [(2'h2):(1'h0)] wire249;
  wire signed [(4'hc):(1'h0)] wire248;
  wire signed [(5'h13):(1'h0)] wire247;
  wire [(5'h10):(1'h0)] wire238;
  wire [(4'h8):(1'h0)] wire237;
  wire signed [(2'h2):(1'h0)] wire236;
  wire [(5'h13):(1'h0)] wire222;
  reg [(3'h7):(1'h0)] reg266 = (1'h0);
  reg [(4'hc):(1'h0)] reg265 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg259 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg258 = (1'h0);
  reg [(4'h9):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg255 = (1'h0);
  reg [(4'he):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg253 = (1'h0);
  reg [(4'hb):(1'h0)] reg252 = (1'h0);
  reg [(3'h7):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg246 = (1'h0);
  reg [(4'h8):(1'h0)] reg245 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg244 = (1'h0);
  reg signed [(4'he):(1'h0)] reg243 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg242 = (1'h0);
  reg [(3'h4):(1'h0)] reg241 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg240 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg239 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg235 = (1'h0);
  reg signed [(4'he):(1'h0)] reg234 = (1'h0);
  reg [(5'h15):(1'h0)] reg233 = (1'h0);
  reg [(5'h14):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg228 = (1'h0);
  reg [(5'h11):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg224 = (1'h0);
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  assign y = {wire268,
                 wire267,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire238,
                 wire237,
                 wire236,
                 wire222,
                 reg266,
                 reg265,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 (1'h0)};
  assign wire222 = {wire220};
  always
    @(posedge clk) begin
      reg223 <= wire221[(3'h7):(1'h0)];
      reg224 <= $signed(wire221[(1'h0):(1'h0)]);
      reg225 <= ((~^((!(wire218 ?
          wire220 : (7'h42))) <<< (!{reg223}))) * wire217[(4'hf):(4'hd)]);
    end
  always
    @(posedge clk) begin
      reg226 <= ($unsigned((|wire219[(2'h2):(2'h2)])) ?
          $signed(reg223) : (-$unsigned((&(^~(8'hb1))))));
      if (({$signed((~(wire218 - wire218))), wire221} ?
          ((wire220 <<< wire217[(4'he):(4'he)]) ?
              (((wire220 || wire218) > $signed(wire217)) == {(wire218 ^ wire220),
                  $signed(reg223)}) : {wire222[(2'h3):(2'h3)],
                  $unsigned($unsigned(reg226))}) : {((wire217 ?
                  (~^reg225) : $unsigned(reg223)) != $unsigned(wire221[(2'h3):(2'h3)])),
              $signed((-wire219[(3'h5):(1'h0)]))}))
        begin
          reg227 <= $unsigned($signed((!($signed(reg226) <<< (^~wire218)))));
          reg228 <= {reg223};
          if ((wire219 ?
              $signed(((reg228[(4'hd):(2'h3)] ? (~^reg226) : $signed(wire222)) ?
                  {{reg226}} : $signed(wire221))) : reg224[(2'h3):(1'h1)]))
            begin
              reg229 <= ($signed($unsigned($signed(((7'h44) >= (8'hb0))))) ?
                  ($signed(reg224[(1'h1):(1'h0)]) | (({wire220,
                          reg226} >= $signed(reg224)) ?
                      $unsigned({(8'h9c),
                          wire218}) : $unsigned((|reg225)))) : $signed(($signed(wire217[(5'h10):(4'he)]) ?
                      wire222 : (|wire218))));
              reg230 <= $signed((wire220 << {$signed((+reg223)),
                  $unsigned(reg223[(3'h5):(2'h2)])}));
              reg231 <= (((|($signed(reg227) ? (-reg224) : $unsigned(reg226))) ?
                  reg225[(4'hc):(4'h9)] : $signed({$signed((8'ha4)),
                      wire221})) ~^ {(8'hb0)});
              reg232 <= $signed(wire219[(4'hf):(1'h0)]);
            end
          else
            begin
              reg229 <= ({reg231[(5'h10):(4'he)]} ?
                  $signed(reg223[(2'h3):(2'h2)]) : reg227);
            end
          if (reg225[(5'h13):(4'ha)])
            begin
              reg233 <= reg227;
              reg234 <= {$unsigned((({wire221,
                          reg226} >>> reg225[(4'h8):(3'h7)]) ?
                      reg228 : $signed($unsigned(reg223))))};
              reg235 <= (~|$unsigned($signed((^{reg233, wire220}))));
            end
          else
            begin
              reg233 <= $signed(($unsigned(reg226[(2'h2):(1'h0)]) >> ({(&reg232),
                      reg231} ?
                  wire218 : reg235)));
              reg234 <= $signed($signed(reg229[(4'hc):(3'h7)]));
            end
        end
      else
        begin
          reg227 <= ((8'hb6) ?
              $signed(reg235) : ($unsigned(reg229[(4'hd):(4'h8)]) ?
                  reg223[(1'h0):(1'h0)] : $signed($signed(((8'ha6) ^~ reg227)))));
          reg228 <= wire220;
        end
    end
  assign wire236 = $signed($unsigned($unsigned(reg226[(1'h1):(1'h1)])));
  assign wire237 = (|$signed(wire236[(1'h1):(1'h0)]));
  assign wire238 = ($signed($unsigned(reg230[(4'ha):(2'h3)])) ?
                       ($unsigned((^~$signed(reg232))) ?
                           $unsigned((~|reg223)) : reg231) : (|(((~&wire220) ?
                           reg231 : $signed(wire236)) * ((wire221 ^ reg225) >= (~^reg231)))));
  always
    @(posedge clk) begin
      reg239 <= ({((8'ha8) ? (-wire219) : (8'hbc))} <<< ((~((8'hbf) ?
              (~^reg234) : wire237)) ?
          $unsigned(reg223[(3'h7):(1'h1)]) : (8'hb4)));
      reg240 <= $unsigned((8'hbf));
      reg241 <= ((reg226 >>> ((^~reg225[(5'h11):(3'h4)]) - ((wire238 ?
          reg227 : reg239) ^~ $unsigned(wire220)))) <<< $unsigned(reg239));
      if ($unsigned($signed((~$signed($unsigned(reg241))))))
        begin
          if ((-(($signed($unsigned(wire220)) * ($signed(reg232) ?
              (8'hb7) : $signed(reg239))) == (~|($unsigned(wire217) ?
              (+wire238) : $unsigned(reg234))))))
            begin
              reg242 <= (&reg234);
              reg243 <= ({($signed($signed(wire238)) ~^ (~|reg239))} ?
                  {(8'hb7),
                      ((^$signed(reg228)) ?
                          wire221[(4'hc):(3'h4)] : ({reg225} >= (^wire220)))} : reg227[(4'h8):(2'h2)]);
              reg244 <= ($signed(((^(-reg226)) ?
                      (&(~|wire218)) : ((wire238 ?
                          wire222 : reg240) == (reg243 >>> wire236)))) ?
                  $signed(reg242) : (~^$unsigned($unsigned((~&(8'hbd))))));
              reg245 <= $unsigned($unsigned({(wire219[(2'h3):(2'h3)] == (8'hac))}));
            end
          else
            begin
              reg242 <= ({reg243[(4'hd):(4'hb)], (8'hae)} ?
                  (~^reg225[(4'hd):(4'hd)]) : $unsigned((~^reg233[(1'h0):(1'h0)])));
              reg243 <= (8'h9d);
            end
        end
      else
        begin
          reg242 <= wire238;
        end
      reg246 <= reg234;
    end
  assign wire247 = $signed(reg234[(3'h4):(3'h4)]);
  assign wire248 = reg242;
  assign wire249 = reg226;
  assign wire250 = wire219;
  always
    @(posedge clk) begin
      if (($signed((8'hb3)) ?
          $signed($signed((reg233 + (reg234 < (8'haa))))) : reg224[(1'h1):(1'h1)]))
        begin
          reg251 <= (!reg233[(5'h13):(3'h4)]);
          reg252 <= wire237[(3'h5):(2'h3)];
          reg253 <= wire248[(2'h2):(2'h2)];
          if (((^(~^wire250)) > $signed(($signed((reg240 ?
              reg253 : (8'hb4))) <<< wire222))))
            begin
              reg254 <= (|$signed(wire247[(4'hc):(3'h7)]));
            end
          else
            begin
              reg254 <= ($unsigned(((reg252 ?
                          (&wire249) : (reg225 ? wire218 : (8'ha0))) ?
                      reg231[(4'hd):(1'h0)] : wire236[(1'h0):(1'h0)])) ?
                  (8'haf) : (8'hae));
              reg255 <= ($unsigned({reg244}) >= $signed((~(+(wire218 ?
                  reg235 : reg239)))));
              reg256 <= (!{reg235, (8'hb7)});
              reg257 <= (reg243[(1'h1):(1'h1)] != ($unsigned(reg253[(1'h0):(1'h0)]) != $unsigned(wire218[(1'h0):(1'h0)])));
            end
          reg258 <= (reg229[(4'he):(3'h7)] ^~ ($signed(wire248[(2'h3):(1'h0)]) ?
              ((|(reg252 >= reg241)) ?
                  $unsigned((&(8'hb2))) : reg240[(3'h5):(1'h0)]) : ($unsigned((reg230 | reg226)) | {(wire248 ?
                      reg226 : reg233),
                  (reg245 <= (8'had))})));
        end
      else
        begin
          reg251 <= $unsigned(reg256[(5'h11):(4'hc)]);
          if ({{(((reg223 ?
                      reg239 : wire238) ~^ $signed(reg235)) == wire220[(3'h6):(2'h2)])},
              reg228})
            begin
              reg252 <= ($signed(reg229[(4'hf):(1'h1)]) ?
                  ((reg239 ?
                      (wire238[(2'h2):(1'h1)] - $signed(reg224)) : reg225[(4'ha):(3'h4)]) >= (8'ha7)) : (!$signed((~|$signed(reg224)))));
            end
          else
            begin
              reg252 <= reg227;
              reg253 <= reg232[(4'hd):(1'h0)];
              reg254 <= $signed((~&$unsigned(reg252)));
              reg255 <= reg231[(4'hf):(4'h9)];
              reg256 <= $signed(($unsigned((reg229[(1'h0):(1'h0)] > (reg254 ?
                  reg230 : (8'hb6)))) ^ (^~$signed($unsigned(reg224)))));
            end
          if ((~&(~|$unsigned({(!(8'ha9)), wire219[(4'hf):(4'ha)]}))))
            begin
              reg257 <= (^(|{(~(|reg240))}));
              reg258 <= (wire218 == $unsigned((wire222[(1'h0):(1'h0)] ?
                  ($signed(wire222) ?
                      $signed((8'h9d)) : $signed(wire249)) : $signed(((8'haa) ?
                      reg239 : reg227)))));
              reg259 <= reg241;
            end
          else
            begin
              reg257 <= ((-reg243[(4'he):(4'h9)]) ?
                  {(~&((reg257 ? reg259 : wire217) ?
                          (reg251 ? wire237 : reg223) : (reg242 ?
                              reg229 : wire250)))} : $signed((+wire221[(4'hc):(4'h9)])));
            end
        end
    end
  assign wire260 = $unsigned((|{$unsigned(wire222),
                       $signed($unsigned(wire217))}));
  assign wire261 = reg234[(3'h6):(1'h1)];
  assign wire262 = $signed($signed($signed(((!reg232) ~^ reg244))));
  assign wire263 = $unsigned({($signed((reg229 <= reg231)) ?
                           $signed((reg225 ? reg243 : reg244)) : ((~|reg258) ?
                               (8'hae) : $signed(reg244))),
                       (-$signed((|reg235)))});
  assign wire264 = ((($signed(reg225) ^ ({reg259, (8'ha5)} != (reg225 ?
                       wire217 : wire237))) >>> $signed(((reg239 > (8'h9c)) ^~ wire262))) & wire222[(5'h11):(3'h4)]);
  always
    @(posedge clk) begin
      reg265 <= ($unsigned((wire237 ?
          ((~|wire249) ?
              $unsigned(reg251) : {(8'hab)}) : ($signed(wire260) | reg223[(3'h7):(3'h7)]))) > ($unsigned({reg245[(1'h0):(1'h0)]}) ?
          $unsigned(wire262[(5'h11):(3'h4)]) : reg235[(4'h9):(3'h6)]));
    end
  always
    @(posedge clk) begin
      reg266 <= $unsigned(wire263);
    end
  assign wire267 = reg245[(3'h7):(1'h1)];
  assign wire268 = (~$unsigned((-(8'hab))));
endmodule

module module189
#(parameter param211 = ((8'hae) + (({((8'hab) && (8'ha3)), (^~(8'haf))} <= (((8'hb5) ? (8'hb9) : (8'hb4)) < ((8'hb9) ? (8'ha2) : (8'ha8)))) ? {(((7'h40) > (8'h9e)) >>> ((8'hbe) == (8'hbf)))} : ({((8'hb8) - (8'ha3))} ~^ (|(8'haa))))), 
parameter param212 = {(((|(param211 ^ param211)) ? (^(~|param211)) : ((|param211) >= {param211})) ? (8'haa) : param211), (~(8'hbc))})
(y, clk, wire193, wire192, wire191, wire190);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire193;
  input wire [(4'ha):(1'h0)] wire192;
  input wire signed [(2'h2):(1'h0)] wire191;
  input wire signed [(4'hb):(1'h0)] wire190;
  wire signed [(5'h13):(1'h0)] wire210;
  wire signed [(3'h6):(1'h0)] wire209;
  wire signed [(4'h9):(1'h0)] wire208;
  wire [(4'hf):(1'h0)] wire207;
  wire [(4'ha):(1'h0)] wire206;
  wire signed [(5'h14):(1'h0)] wire205;
  wire signed [(3'h4):(1'h0)] wire204;
  wire signed [(4'hd):(1'h0)] wire203;
  wire [(5'h13):(1'h0)] wire202;
  wire signed [(4'he):(1'h0)] wire201;
  wire [(3'h6):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire199;
  wire [(3'h6):(1'h0)] wire198;
  wire [(2'h3):(1'h0)] wire197;
  wire signed [(4'hf):(1'h0)] wire196;
  wire [(5'h11):(1'h0)] wire195;
  wire signed [(3'h6):(1'h0)] wire194;
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 (1'h0)};
  assign wire194 = $unsigned({({(wire192 ? wire193 : wire191),
                           $unsigned(wire193)} <= $unsigned($unsigned(wire193))),
                       (~&$unsigned($signed(wire192)))});
  assign wire195 = ((+$unsigned($unsigned((~^wire191)))) ?
                       ({wire192,
                           $unsigned((wire191 && wire194))} >>> (8'hb2)) : wire193[(3'h5):(1'h0)]);
  assign wire196 = (($signed(($signed(wire194) >= wire194)) ?
                           $unsigned({(wire195 ?
                                   wire192 : wire195)}) : {(8'hbd),
                               (wire190[(4'h9):(3'h4)] & wire194[(2'h3):(2'h3)])}) ?
                       ($unsigned(wire192[(3'h4):(1'h1)]) <<< $unsigned($unsigned($unsigned(wire190)))) : (~^$signed((^~wire194))));
  assign wire197 = (~wire196);
  assign wire198 = (^wire195);
  assign wire199 = wire193[(3'h4):(2'h3)];
  assign wire200 = {{(+$unsigned((|wire190)))},
                       (wire198[(2'h2):(1'h0)] <= $unsigned(((~&wire195) ?
                           wire193 : $signed(wire197))))};
  assign wire201 = (^$signed(((|wire194) ?
                       wire200[(1'h0):(1'h0)] : {{wire199, (8'hb5)},
                           (^~wire195)})));
  assign wire202 = $signed($unsigned((+((^wire196) >>> wire193[(1'h0):(1'h0)]))));
  assign wire203 = {{$signed($unsigned(wire200)), wire199},
                       (wire191 || ((wire190 >= (!wire191)) >> $signed((^wire193))))};
  assign wire204 = (^~$signed($signed($unsigned($signed(wire191)))));
  assign wire205 = ($signed(((wire192 ~^ (8'hae)) | (+{wire198}))) ?
                       (wire199 >= {wire201[(4'hd):(2'h2)],
                           wire201}) : $signed((+(wire204 || {wire193}))));
  assign wire206 = wire196;
  assign wire207 = wire203;
  assign wire208 = ((|(wire190[(4'ha):(4'h8)] ?
                           ($signed(wire205) ?
                               wire198[(1'h1):(1'h1)] : $signed(wire205)) : $unsigned(wire196[(3'h4):(3'h4)]))) ?
                       (((^~wire196) <= wire196[(4'hc):(2'h3)]) ?
                           (8'hb1) : $unsigned($signed((~wire195)))) : (((|((8'hb2) >>> wire196)) <= ($unsigned((8'hba)) | $unsigned(wire198))) >>> wire201[(3'h4):(1'h1)]));
  assign wire209 = wire198;
  assign wire210 = wire209;
endmodule

module module157
#(parameter param175 = (&(((((8'haa) ? (8'hac) : (8'ha8)) ? ((8'hbe) >= (8'haf)) : {(8'hae), (8'ha2)}) <= (~(~(8'haf)))) >> {((~&(8'hba)) ~^ (!(8'hab)))})))
(y, clk, wire161, wire160, wire159, wire158);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire161;
  input wire [(4'ha):(1'h0)] wire160;
  input wire [(4'hc):(1'h0)] wire159;
  input wire [(3'h4):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire173;
  wire [(4'h8):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire164;
  reg signed [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg172,
                 reg171,
                 reg163,
                 reg162,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg162 <= wire161;
      reg163 <= wire160;
    end
  assign wire164 = $unsigned((~|(^~$signed(wire161))));
  assign wire165 = ((!$unsigned((wire164 ? wire161 : $unsigned(wire160)))) ?
                       {reg162[(3'h4):(1'h0)],
                           wire160[(3'h4):(2'h3)]} : (~{wire160[(1'h1):(1'h0)]}));
  assign wire166 = (~((~{wire164}) ?
                       (~$unsigned(((8'hbf) ?
                           (8'ha6) : wire160))) : $unsigned((!wire161))));
  assign wire167 = wire158;
  assign wire168 = wire166[(4'h9):(3'h4)];
  assign wire169 = {wire158};
  assign wire170 = $unsigned($unsigned(wire169));
  always
    @(posedge clk) begin
      reg171 <= ((&wire164[(2'h2):(1'h1)]) ?
          $unsigned($unsigned(wire169[(1'h1):(1'h0)])) : $signed($signed((!(~^wire165)))));
      reg172 <= wire165[(1'h1):(1'h0)];
    end
  assign wire173 = (-$unsigned(wire165));
  assign wire174 = ($signed(reg163[(2'h2):(2'h2)]) && (^({$signed(wire164)} ?
                       (+wire161) : wire161)));
endmodule

module module143
#(parameter param154 = ({{(~|(~|(8'h9d)))}} > ((((~^(8'hb3)) ? ((8'hb0) ? (8'hb9) : (8'hb3)) : (~(7'h44))) <= (((8'ha6) ? (8'hab) : (8'h9c)) ? ((8'haf) ? (8'hbe) : (8'h9d)) : {(8'ha8)})) > ((((7'h41) - (8'hbb)) ^~ {(8'hbf)}) ? ({(8'haa)} ? ((8'hb6) ? (8'hb2) : (8'h9f)) : (8'hb1)) : (~(^~(8'hb5)))))))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire147;
  input wire signed [(4'ha):(1'h0)] wire146;
  input wire signed [(5'h11):(1'h0)] wire145;
  input wire signed [(5'h11):(1'h0)] wire144;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire signed [(4'hb):(1'h0)] wire148;
  assign y = {wire153, wire152, wire151, wire150, wire149, wire148, (1'h0)};
  assign wire148 = $unsigned(($unsigned(wire147) ?
                       $signed((~&$signed(wire145))) : wire144));
  assign wire149 = (-wire144[(1'h0):(1'h0)]);
  assign wire150 = $signed($signed((^$signed((~wire144)))));
  assign wire151 = $unsigned($signed($signed((^(wire150 ?
                       wire147 : wire145)))));
  assign wire152 = $signed($unsigned(({wire151[(4'hd):(2'h3)],
                       wire151} - $signed(wire151[(3'h4):(3'h4)]))));
  assign wire153 = wire146;
endmodule
