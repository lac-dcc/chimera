module top
#(parameter param247 = (~^(^~{(((8'haf) ? (7'h43) : (8'hb0)) ? ((8'hb1) < (8'hba)) : ((8'ha3) >>> (8'hbe))), {{(8'hb0), (8'ha1)}}})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire246;
  wire [(2'h2):(1'h0)] wire245;
  wire [(2'h2):(1'h0)] wire244;
  wire signed [(4'ha):(1'h0)] wire243;
  wire [(4'ha):(1'h0)] wire241;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire128;
  assign y = {wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire241,
                 wire5,
                 wire128,
                 (1'h0)};
  assign wire5 = (8'hb0);
  module6 #() modinst129 (.wire11(wire2), .wire9(wire1), .wire10(wire0), .y(wire128), .wire7(wire4), .wire8(wire5), .clk(clk));
  module130 #() modinst242 (wire241, clk, wire2, wire128, wire5, wire4);
  assign wire243 = ($signed(wire2[(4'h9):(1'h0)]) + $signed(((^(!wire4)) | wire0[(3'h4):(2'h2)])));
  assign wire244 = ({$signed(wire5),
                       ((!(wire2 >= wire2)) << $unsigned({(8'hb4),
                           wire1}))} >>> $unsigned(wire1));
  assign wire245 = wire3;
  assign wire246 = ($signed((&((wire244 ?
                       wire241 : wire5) * (wire2 | (8'hb0))))) & wire244);
endmodule

module module130
#(parameter param240 = ((^{(((8'hbb) && (8'ha4)) ? ((8'ha6) ? (8'ha1) : (8'ha0)) : (~|(8'ha8)))}) ? {(((+(7'h40)) ? (!(8'ha1)) : (8'ha7)) ? {((8'hb1) ~^ (7'h42)), ((8'ha1) >= (8'hbd))} : (((8'haf) ? (8'hb8) : (8'ha4)) < ((7'h42) ? (8'hba) : (8'haa)))), (((^~(7'h42)) ? ((8'hbb) < (8'ha0)) : ((8'ha4) ? (8'h9d) : (8'h9f))) <= {((8'hb3) - (8'hb0)), ((8'hae) ? (8'had) : (7'h44))})} : ((~^(((8'hbe) ? (8'ha6) : (8'haf)) ? ((7'h41) ? (8'hba) : (8'ha6)) : {(8'hae), (8'h9f)})) ? {(~|(~^(7'h41))), (((8'h9c) * (7'h42)) * (~^(7'h41)))} : ((~(&(8'ha6))) | ((8'h9e) ? ((8'hb8) ? (8'hb8) : (8'hb3)) : ((8'hbe) ? (8'h9d) : (8'hb0)))))))
(y, clk, wire131, wire132, wire133, wire134);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire131;
  input wire [(3'h4):(1'h0)] wire132;
  input wire signed [(4'he):(1'h0)] wire133;
  input wire signed [(5'h13):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire239;
  wire [(3'h4):(1'h0)] wire238;
  wire [(4'hc):(1'h0)] wire237;
  wire [(4'hf):(1'h0)] wire198;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(4'he):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire200;
  wire [(4'hf):(1'h0)] wire201;
  wire [(4'h8):(1'h0)] wire235;
  reg [(4'h9):(1'h0)] reg207 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(2'h2):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  assign y = {wire239,
                 wire238,
                 wire237,
                 wire198,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire159,
                 wire200,
                 wire201,
                 wire235,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire135 = (wire132[(3'h4):(1'h1)] ^~ (^wire132));
  assign wire136 = ((~&{(~wire134[(4'h9):(2'h2)]),
                           ((wire132 == wire134) < (~|wire134))}) ?
                       ($signed((wire131[(2'h2):(1'h1)] ?
                               (^~wire135) : $unsigned(wire135))) ?
                           $signed((~^$signed(wire135))) : (wire134 ?
                               $unsigned($unsigned(wire133)) : (-((8'hb2) || wire135)))) : ((wire132 ^~ wire131[(2'h2):(1'h0)]) ?
                           wire134 : wire135[(1'h1):(1'h0)]));
  assign wire137 = $signed($unsigned($signed(wire135)));
  assign wire138 = wire135;
  assign wire139 = wire132;
  module140 #() modinst160 (.wire142(wire137), .wire143(wire135), .wire141(wire134), .y(wire159), .wire145(wire136), .clk(clk), .wire144(wire131));
  assign wire161 = {$unsigned((({wire135} ?
                           (wire135 ?
                               wire134 : wire134) : wire138[(4'hd):(3'h6)]) | {((8'ha1) ?
                               wire131 : wire135),
                           (wire132 - wire134)})),
                       {($signed($unsigned((8'hb9))) > wire139[(1'h1):(1'h0)]),
                           wire132}};
  assign wire162 = (wire136[(4'h8):(3'h6)] ?
                       $unsigned((((8'ha3) == wire136[(5'h13):(5'h13)]) + {$signed((8'h9d))})) : (wire137[(1'h1):(1'h1)] | ($unsigned(((8'had) << wire133)) ?
                           (8'hbb) : ($unsigned(wire159) - $unsigned((8'hb7))))));
  assign wire163 = (wire131[(5'h10):(4'h8)] ?
                       $signed(($unsigned($unsigned(wire135)) ?
                           $unsigned($unsigned(wire132)) : wire134[(4'ha):(4'h8)])) : ((8'had) ?
                           wire139 : wire161[(3'h6):(2'h2)]));
  assign wire164 = (&((+$unsigned(wire131)) ^~ (^~wire159)));
  assign wire165 = (8'h9e);
  assign wire166 = {wire134};
  module167 #() modinst199 (.wire168(wire162), .wire172(wire133), .y(wire198), .wire171(wire136), .wire170(wire134), .clk(clk), .wire169(wire163));
  assign wire200 = $unsigned((((+wire136) ?
                           wire139 : ((wire134 * wire162) != (wire198 <<< wire166))) ?
                       wire134[(2'h3):(1'h0)] : wire165));
  assign wire201 = ($signed((wire163[(4'h8):(2'h3)] ?
                       wire136 : wire135[(4'hc):(4'ha)])) << wire198);
  always
    @(posedge clk) begin
      reg202 <= {($signed((((8'ha0) << wire132) << (wire161 | wire134))) == ($signed((wire198 ?
                  wire161 : (8'hbd))) ?
              wire165 : (-{(7'h41), wire138}))),
          ($signed(((|wire162) ?
              wire198[(3'h5):(1'h0)] : $signed(wire163))) ~^ wire134)};
      reg203 <= {({(wire131[(3'h5):(2'h2)] < wire164)} ?
              wire132[(3'h4):(1'h0)] : wire159[(4'h9):(4'h8)])};
      if (wire159[(3'h7):(3'h6)])
        begin
          reg204 <= ($unsigned((!(|(wire133 ? wire133 : wire134)))) ?
              (~&$unsigned((|(-wire198)))) : $signed((-({reg203} ?
                  (wire161 != (8'h9c)) : (~&wire161)))));
          reg205 <= (~|$signed((wire136[(5'h10):(4'he)] ?
              wire139[(2'h2):(2'h2)] : reg202)));
          reg206 <= (~&$unsigned($signed($unsigned(wire200[(4'hf):(4'hc)]))));
        end
      else
        begin
          reg204 <= (~|(wire132[(1'h1):(1'h0)] ? (~reg204) : wire131));
          reg205 <= $unsigned(wire161);
          reg206 <= wire198[(4'he):(1'h0)];
          reg207 <= {(wire136 ~^ (^$signed($unsigned(wire138)))),
              (&$unsigned((reg204[(3'h4):(1'h0)] ?
                  $signed(wire166) : (wire163 < (8'hbb)))))};
        end
    end
  module208 #() modinst236 (wire235, clk, wire163, wire137, wire201, wire166, wire134);
  assign wire237 = {$signed($unsigned(((wire162 < wire163) ?
                           (reg203 | wire139) : (wire136 * reg202))))};
  assign wire238 = reg203[(3'h4):(3'h4)];
  assign wire239 = reg205[(2'h2):(1'h0)];
endmodule

module module6
#(parameter param126 = ((-(+((^(8'ha7)) ^~ (7'h40)))) ? ((((^(8'had)) | {(8'ha6)}) ? (&((8'hb1) ? (8'ha6) : (8'hab))) : ((&(8'hbe)) ? ((8'ha6) << (8'hbb)) : ((8'haf) ? (8'ha5) : (8'hab)))) ? (({(8'ha3)} ~^ ((8'ha0) ? (8'haf) : (8'hbc))) == (~|(-(8'ha9)))) : ((((8'hb4) >> (8'hb8)) ? {(8'ha0)} : ((8'hb4) == (8'hae))) <= ((&(8'hbf)) || ((7'h44) != (8'had))))) : ((-((8'hb2) <<< ((7'h42) ? (8'ha5) : (8'haa)))) ? ((~&((8'ha5) ? (8'haa) : (8'h9c))) | ((8'had) < ((8'hbe) + (8'hbc)))) : (^~(((8'ha9) + (7'h41)) >>> {(8'h9c)})))), 
parameter param127 = {param126, param126})
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire118;
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire76,
                 wire14,
                 wire13,
                 wire12,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire118,
                 reg78,
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
  assign wire12 = ($unsigned((-($signed(wire10) ?
                          wire8 : (wire8 ? wire8 : wire8)))) ?
                      wire11[(2'h3):(1'h0)] : (((-(wire7 ~^ (8'hbb))) ?
                              {$signed((8'haf)), $unsigned(wire9)} : wire10) ?
                          $signed((wire8 ?
                              (|wire11) : wire10)) : (-$signed(wire10))));
  assign wire13 = $signed(wire7[(1'h1):(1'h1)]);
  assign wire14 = $unsigned(wire9);
  always
    @(posedge clk) begin
      reg15 <= (~&$signed(wire10[(3'h6):(3'h4)]));
      if (reg15[(3'h7):(3'h6)])
        begin
          reg16 <= (~|(wire7 ?
              (!($unsigned((8'ha2)) <= (wire10 ?
                  (8'ha3) : (8'h9f)))) : $signed(($signed(wire11) < $signed((8'ha1))))));
          reg17 <= ((wire14 ?
              (wire8[(2'h3):(2'h3)] ?
                  $unsigned(((8'ha2) ?
                      wire9 : wire9)) : wire7) : ($signed(wire14[(3'h7):(1'h1)]) <<< $signed((&(8'hbd))))) || {wire8[(3'h6):(3'h5)]});
          reg18 <= $signed(wire13[(4'hd):(4'h9)]);
          if (((reg15[(4'h8):(2'h3)] ?
              {reg15[(2'h3):(2'h3)]} : (^($signed((8'hb8)) > {reg15,
                  reg17}))) <<< {($unsigned((~reg17)) ?
                  wire12 : $signed((reg17 != wire12))),
              wire10}))
            begin
              reg19 <= $unsigned((~{{$signed(wire9)}}));
              reg20 <= $signed(reg19[(1'h0):(1'h0)]);
            end
          else
            begin
              reg19 <= (&(($unsigned(wire9) >>> (&wire9)) + wire8));
              reg20 <= $signed(reg20);
              reg21 <= wire11;
              reg22 <= $signed((~^{wire8,
                  ($unsigned(reg15) - (wire10 >> wire9))}));
            end
          if ($signed($signed((&wire12[(5'h10):(3'h7)]))))
            begin
              reg23 <= {{(reg18[(3'h7):(2'h2)] ?
                          $signed((reg21 >= (8'hae))) : {reg16,
                              (wire7 || reg21)}),
                      reg22}};
            end
          else
            begin
              reg23 <= ($signed($unsigned(wire13)) != {wire9});
              reg24 <= wire13;
              reg25 <= wire10;
              reg26 <= (+($unsigned((-reg23[(3'h5):(2'h2)])) ?
                  (wire7[(2'h2):(1'h0)] ?
                      {(wire10 ? reg21 : (8'ha9)),
                          (reg17 ?
                              wire9 : (8'hbe))} : wire11) : {$unsigned((wire11 ?
                          reg24 : reg18)),
                      ((8'hb7) != (wire7 || reg17))}));
              reg27 <= reg22[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg16 <= $signed((!wire9[(2'h2):(1'h1)]));
          reg17 <= reg24;
        end
      reg28 <= $signed(reg19);
      reg29 <= ($unsigned((reg27[(4'hc):(3'h5)] ?
              ((^reg20) ?
                  ((8'ha8) ?
                      wire13 : wire12) : (7'h43)) : $unsigned($signed(wire9)))) ?
          $signed(reg20) : wire10[(3'h7):(1'h0)]);
    end
  module30 #() modinst77 (.wire31(reg22), .clk(clk), .wire32(reg19), .wire33(reg29), .wire34(reg21), .y(wire76), .wire35(wire11));
  always
    @(posedge clk) begin
      reg78 <= $unsigned((reg21[(2'h2):(2'h2)] ?
          (reg20 ?
              (~|wire11[(5'h10):(2'h3)]) : $signed(((8'hbd) ?
                  wire10 : reg18))) : $unsigned((wire76 ?
              (|(8'hb6)) : (reg25 ? reg15 : reg20)))));
    end
  assign wire79 = (({reg20, $signed((wire76 ? wire7 : (8'hb7)))} ?
                      $signed(reg16) : reg15[(3'h5):(1'h1)]) && {(|wire13)});
  assign wire80 = reg26;
  assign wire81 = wire8;
  assign wire82 = $signed(reg19[(2'h2):(1'h1)]);
  assign wire83 = (^(!(wire11[(5'h15):(5'h11)] ~^ wire8[(1'h1):(1'h0)])));
  module84 #() modinst119 (wire118, clk, reg28, wire83, wire10, wire14, reg21);
  assign wire120 = {{$signed(((wire9 >= reg15) << (reg15 ? reg19 : wire11))),
                           $signed((7'h43))}};
  assign wire121 = ((^~(8'hb1)) | wire76[(5'h10):(3'h4)]);
  assign wire122 = $signed($unsigned(reg15[(2'h2):(1'h1)]));
  assign wire123 = wire14;
  assign wire124 = {wire76[(4'hf):(4'h9)]};
  assign wire125 = (^~($unsigned(($signed(reg15) ?
                       $unsigned(reg28) : (!wire14))) ~^ {wire79[(4'h9):(3'h4)],
                       {reg24}}));
endmodule

module module84
#(parameter param116 = (((((&(8'ha6)) - (~&(8'h9f))) <<< (((8'hb9) ? (8'haf) : (8'hbf)) != ((8'ha8) ? (8'ha5) : (8'hbb)))) <<< {(^((8'ha6) >> (8'ha6))), (((8'ha6) | (8'ha4)) ? {(8'hb9)} : ((8'hae) & (8'hb8)))}) == ((8'haa) && ((&((8'hb1) - (7'h41))) ? (~|(~|(8'ha5))) : (~|((8'ha9) ~^ (8'hae)))))), 
parameter param117 = param116)
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire signed [(4'hf):(1'h0)] wire88;
  input wire signed [(2'h3):(1'h0)] wire87;
  input wire signed [(2'h2):(1'h0)] wire86;
  input wire signed [(4'hb):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 wire103,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg115,
                 reg114,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire90 = wire87[(1'h0):(1'h0)];
  assign wire91 = ((8'ha2) ^ ({((wire90 && (8'hb6)) ?
                              ((8'ha5) >= wire88) : wire87[(1'h0):(1'h0)]),
                          ({(8'ha2)} + (wire86 >>> wire88))} ?
                      (!(~&(|wire86))) : wire86));
  assign wire92 = {{((wire85 <= wire87[(2'h3):(2'h2)]) >= $unsigned($unsigned(wire88)))}};
  assign wire93 = $unsigned(wire87);
  assign wire94 = wire90;
  assign wire95 = $signed($signed((wire88 <<< $unsigned($unsigned(wire85)))));
  always
    @(posedge clk) begin
      reg96 <= ($unsigned((|{wire92})) ?
          wire95[(4'h8):(3'h5)] : (|{{wire88}, wire88[(3'h5):(1'h1)]}));
      if (wire87)
        begin
          reg97 <= {$signed(({{reg96},
                  (wire89 <= wire87)} >>> ($unsigned(reg96) ?
                  $signed((8'ha6)) : wire86[(1'h1):(1'h0)]))),
              $signed(wire87)};
        end
      else
        begin
          reg97 <= wire93[(3'h7):(3'h7)];
          reg98 <= $unsigned(((~wire86) >>> wire88));
          reg99 <= $unsigned((~&wire95[(4'hb):(3'h4)]));
          reg100 <= $signed(wire95[(3'h5):(2'h3)]);
          reg101 <= ((|(((~&wire93) >> wire92[(1'h0):(1'h0)]) ?
              $unsigned((reg96 ?
                  (8'hb6) : wire91)) : wire90[(5'h10):(4'he)])) && (-wire86[(2'h2):(1'h0)]));
        end
      reg102 <= reg97[(3'h5):(1'h0)];
    end
  assign wire103 = {(wire85[(1'h1):(1'h1)] ?
                           wire89[(3'h7):(3'h7)] : reg100[(4'h9):(2'h3)])};
  assign wire104 = wire90[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg105 <= (~({({wire104} ?
              $signed(reg102) : (7'h42))} <<< (((reg99 | wire93) & {reg102}) != reg102)));
      reg106 <= ($unsigned((~|reg98)) && reg96[(3'h6):(3'h6)]);
      reg107 <= ((-wire91) <<< {(((reg99 >= wire93) ?
              (wire103 ?
                  wire95 : (8'hb9)) : (|wire92)) || $unsigned($unsigned(wire104))),
          (wire91 ?
              $unsigned(((8'h9f) ? wire94 : wire88)) : ($unsigned(wire103) ?
                  (wire103 ? (8'ha2) : reg105) : wire85))});
      reg108 <= (~^reg106[(5'h10):(3'h7)]);
      reg109 <= {(reg96[(3'h6):(2'h3)] ? $signed(wire89) : reg98)};
    end
  assign wire110 = reg109[(2'h3):(2'h3)];
  assign wire111 = {wire86, {reg106[(1'h1):(1'h0)], (wire85 << wire87)}};
  assign wire112 = ({(($signed(reg101) - (+reg97)) ?
                               wire95[(3'h4):(1'h0)] : ((-wire87) ^ $unsigned(reg106)))} ?
                       (&wire87) : ($unsigned($unsigned((reg105 ?
                           reg105 : reg97))) << ((-((8'ha6) ? wire92 : reg98)) ?
                           wire92 : wire87[(1'h1):(1'h1)])));
  assign wire113 = $unsigned({reg101, (^reg96)});
  always
    @(posedge clk) begin
      reg114 <= wire110;
      reg115 <= $unsigned(({(8'ha6)} ?
          reg107 : ({(reg102 | reg100)} ?
              (reg96[(1'h0):(1'h0)] != reg97[(3'h7):(2'h3)]) : reg108)));
    end
endmodule

module module30
#(parameter param75 = ((({((8'ha0) - (8'ha7)), (-(8'hbd))} ? {((8'hbf) >>> (8'hb5)), (~^(8'had))} : ((8'hab) ? (&(8'haf)) : {(8'ha8)})) | (+(((8'hb9) ? (8'ha2) : (8'h9c)) ? ((8'hb3) ? (8'hb9) : (7'h44)) : (+(8'hac))))) ? (({((8'hb0) ? (8'ha1) : (8'ha3))} ? (((8'ha4) ? (8'haf) : (7'h40)) ? (~|(8'had)) : {(8'hbc)}) : ((|(8'hab)) | ((8'hb7) ? (8'hbd) : (8'had)))) > {(((8'hac) != (8'ha2)) ? ((8'haa) ? (8'ha1) : (8'ha0)) : ((8'ha9) ^ (8'hab))), (~|((8'h9d) ? (8'ha2) : (8'hbd)))}) : (+(((-(8'hb6)) ? ((8'ha7) ? (8'ha5) : (8'hb8)) : (^(8'hab))) + (~|((8'ha9) ? (8'had) : (8'ha7)))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  assign wire36 = {$unsigned(wire33[(2'h3):(1'h1)])};
  assign wire37 = wire36[(4'hd):(4'h8)];
  assign wire38 = ($unsigned((^~$unsigned((wire34 ? wire35 : (8'h9e))))) ?
                      (^~(|((8'h9e) > (wire31 ?
                          wire35 : wire36)))) : $signed(wire37[(3'h6):(3'h5)]));
  assign wire39 = $unsigned(wire32);
  assign wire40 = $signed($unsigned(((wire36[(3'h4):(1'h0)] ?
                          $signed(wire37) : (wire31 ? wire38 : wire32)) ?
                      ((+(8'ha3)) ?
                          $unsigned(wire38) : wire34) : (~&$signed(wire36)))));
  assign wire41 = wire32[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg42 <= {((wire35[(1'h1):(1'h1)] ?
                  $signed(wire34) : wire31[(4'ha):(4'ha)]) ?
              wire35[(1'h0):(1'h0)] : wire36)};
      reg43 <= {(($signed((8'hbb)) ?
                  {$unsigned(wire39),
                      $signed(wire36)} : $unsigned((~|wire36))) ?
              wire37 : {(wire31 ? (~^wire41) : wire33)}),
          ((!wire37) ?
              (|$unsigned((wire34 && wire32))) : {(((8'hbb) ? wire41 : wire40) ?
                      (wire37 ? wire32 : wire34) : (wire35 >= wire37)),
                  (~&{wire32, (8'hac)})})};
      if ((-{($unsigned($unsigned(wire41)) ? wire36 : wire35)}))
        begin
          reg44 <= reg43;
        end
      else
        begin
          if ({(((~(wire39 ? (8'h9c) : (7'h41))) ?
                  ($unsigned((8'haa)) ?
                      {wire32,
                          (7'h40)} : wire37[(3'h7):(2'h2)]) : wire41[(3'h6):(3'h5)]) | wire40)})
            begin
              reg44 <= ((7'h44) ?
                  wire39[(4'he):(3'h6)] : wire35[(1'h0):(1'h0)]);
              reg45 <= wire39;
              reg46 <= $unsigned((&wire41));
              reg47 <= $signed(((reg42 == ((7'h42) ?
                  $unsigned(wire40) : wire38)) * reg43));
            end
          else
            begin
              reg44 <= (wire31 ? wire34[(3'h4):(1'h0)] : {wire40});
            end
          reg48 <= (8'h9f);
          if ({$signed({(8'h9e), wire31[(5'h14):(5'h14)]})})
            begin
              reg49 <= ((((wire31[(4'hc):(3'h6)] ?
                          wire34 : reg45[(1'h1):(1'h1)]) >> (+(wire36 ?
                          wire33 : wire37))) ?
                      (($unsigned(wire35) > wire40[(3'h5):(2'h3)]) ?
                          ({reg45,
                              wire37} + reg43[(1'h1):(1'h0)]) : (wire33[(2'h3):(2'h2)] <<< (-wire31))) : $signed((|wire38[(1'h0):(1'h0)]))) ?
                  {(-$signed(reg46))} : $signed((((!wire40) ?
                          (wire41 ? (8'ha7) : wire39) : wire35) ?
                      reg44 : $unsigned($signed(wire40)))));
              reg50 <= $signed($signed((-$unsigned((|reg49)))));
              reg51 <= (({($unsigned(wire39) * (wire32 + (7'h42)))} ?
                      (reg46 << ((!wire33) ?
                          $signed(reg50) : (^(8'hbd)))) : reg50) ?
                  reg43 : reg45);
              reg52 <= $signed((wire38[(2'h2):(1'h0)] >> {$signed((reg42 ?
                      reg43 : reg43))}));
              reg53 <= (~|((reg50[(1'h0):(1'h0)] ^ (+((8'hae) ?
                      reg44 : wire31))) ?
                  $signed($unsigned((wire35 ?
                      reg48 : reg45))) : $signed((~|$signed(wire34)))));
            end
          else
            begin
              reg49 <= (~&(-($unsigned(wire33) >> ((|wire38) ?
                  (|(8'hb0)) : (+reg52)))));
              reg50 <= $signed($unsigned((wire36 ^~ $signed($unsigned(reg45)))));
              reg51 <= $signed((7'h42));
            end
        end
      reg54 <= $unsigned($signed(wire39[(3'h7):(3'h4)]));
    end
  assign wire55 = wire34[(1'h1):(1'h0)];
  assign wire56 = $signed({wire41, (!{$signed(reg44), {reg50, (8'ha5)}})});
  assign wire57 = {({reg46[(2'h3):(1'h1)],
                          $unsigned(wire35[(1'h1):(1'h1)])} ^~ $unsigned((~^(reg42 ?
                          wire56 : reg49)))),
                      reg45};
  assign wire58 = (|wire55);
  assign wire59 = ((~&$signed(wire33[(2'h2):(1'h0)])) ~^ (~&((|(wire31 ?
                      wire41 : reg53)) > ({reg43} ?
                      ((8'hbc) >> (8'ha8)) : {wire37}))));
  always
    @(posedge clk) begin
      reg60 <= wire35;
      reg61 <= (((reg51[(1'h0):(1'h0)] <= (wire59 ^~ (~reg53))) ?
          wire55[(3'h4):(1'h0)] : $unsigned(wire31[(2'h3):(1'h0)])) * reg48);
      if ((~(8'hae)))
        begin
          if ((^$signed($unsigned((reg44[(1'h1):(1'h0)] - reg43)))))
            begin
              reg62 <= ($unsigned($signed((reg42 - wire35))) ?
                  reg61[(3'h5):(1'h0)] : (8'ha0));
              reg63 <= reg46[(2'h2):(1'h1)];
              reg64 <= (((((reg49 == wire41) < (reg45 ? wire38 : (8'hbb))) ?
                      wire41[(2'h2):(1'h1)] : reg63[(1'h1):(1'h1)]) <<< ($signed({wire34,
                          (8'ha5)}) ?
                      reg52 : $unsigned({(8'ha5)}))) ?
                  (wire41 == {wire37[(2'h2):(1'h0)],
                      (|reg54[(5'h10):(1'h1)])}) : ((reg51[(2'h2):(1'h1)] ?
                          wire37 : reg46) ?
                      $unsigned(wire38[(1'h0):(1'h0)]) : (((reg49 ?
                              reg62 : (8'hb7)) + (wire55 >= wire41)) ?
                          (!wire34) : ((reg47 ~^ reg50) ?
                              wire35[(1'h0):(1'h0)] : ((8'ha4) - wire38)))));
              reg65 <= ((reg62 & $unsigned(reg46[(2'h2):(1'h0)])) + $signed((~|reg62[(1'h0):(1'h0)])));
            end
          else
            begin
              reg62 <= reg53[(4'h8):(2'h2)];
              reg63 <= (reg44[(2'h2):(1'h0)] < $signed($unsigned(reg42)));
            end
        end
      else
        begin
          reg62 <= reg51;
        end
    end
  assign wire66 = reg63[(3'h6):(2'h3)];
  assign wire67 = $signed($unsigned(reg49));
  assign wire68 = wire32;
  assign wire69 = $signed(((reg50 ?
                      (wire58 & wire36) : wire59) * ($unsigned($unsigned(reg63)) ?
                      $signed(wire32) : wire55[(2'h2):(2'h2)])));
  assign wire70 = (~^{($signed(wire35[(2'h2):(1'h1)]) ?
                          ((~|wire68) ?
                              reg53 : (reg46 != wire69)) : $signed(wire37[(4'ha):(2'h3)])),
                      (wire39 == reg50)});
  assign wire71 = ((wire70[(1'h1):(1'h0)] ?
                      {((reg42 | (7'h41)) ?
                              (8'haa) : $unsigned(reg54))} : (+wire68[(1'h0):(1'h0)])) && $signed($unsigned((+$unsigned(reg48)))));
  assign wire72 = ($signed(reg60[(4'hb):(3'h7)]) & $signed((+reg46[(1'h1):(1'h0)])));
  assign wire73 = reg51[(3'h5):(3'h4)];
  assign wire74 = (wire59 >= (reg42[(1'h0):(1'h0)] ?
                      ($signed((+wire56)) ? wire32 : reg44) : (reg43 ?
                          {(&(7'h41)), $signed(reg48)} : $unsigned((wire68 ?
                              reg52 : wire56)))));
endmodule

module module208  (y, clk, wire213, wire212, wire211, wire210, wire209);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire213;
  input wire [(3'h6):(1'h0)] wire212;
  input wire [(4'ha):(1'h0)] wire211;
  input wire [(5'h11):(1'h0)] wire210;
  input wire signed [(5'h11):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire234;
  wire [(3'h7):(1'h0)] wire233;
  wire [(3'h5):(1'h0)] wire232;
  wire signed [(5'h15):(1'h0)] wire231;
  wire [(3'h6):(1'h0)] wire230;
  wire [(2'h2):(1'h0)] wire229;
  wire [(3'h6):(1'h0)] wire228;
  wire signed [(4'he):(1'h0)] wire227;
  wire signed [(3'h5):(1'h0)] wire226;
  wire [(4'he):(1'h0)] wire215;
  wire [(5'h11):(1'h0)] wire214;
  reg signed [(3'h7):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg224 = (1'h0);
  reg [(4'h9):(1'h0)] reg223 = (1'h0);
  reg [(3'h5):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(5'h14):(1'h0)] reg219 = (1'h0);
  reg [(4'hc):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg216 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire215,
                 wire214,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 (1'h0)};
  assign wire214 = (($signed(wire211) > (wire210[(3'h6):(3'h5)] ?
                       $unsigned($signed(wire213)) : $signed($unsigned(wire211)))) > $unsigned({$signed(((8'ha7) & wire213))}));
  assign wire215 = wire211[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg216 <= $unsigned(($signed(($signed(wire211) >>> $signed(wire211))) ?
          (($signed((7'h43)) >= $signed(wire212)) <= $signed(wire209)) : $unsigned(wire212)));
      if ({{$signed($unsigned(wire211))}})
        begin
          reg217 <= (~^wire215[(3'h7):(2'h2)]);
          reg218 <= wire212;
          reg219 <= (~|(+($unsigned($unsigned(reg218)) * wire215[(4'ha):(4'ha)])));
          if (wire209[(4'hb):(3'h6)])
            begin
              reg220 <= $signed(reg216[(4'hc):(4'hb)]);
            end
          else
            begin
              reg220 <= wire214[(5'h11):(3'h5)];
              reg221 <= wire210;
              reg222 <= $unsigned({((reg218[(3'h4):(1'h1)] <<< (wire215 >> reg221)) || ($unsigned(wire214) < {wire214,
                      wire214}))});
              reg223 <= $unsigned((-$signed(($unsigned(wire214) ?
                  wire211[(3'h4):(2'h2)] : wire212[(2'h3):(1'h0)]))));
            end
          reg224 <= (($signed((wire209[(3'h6):(2'h2)] ?
              (~reg222) : reg221[(3'h5):(1'h1)])) | {wire213[(4'h9):(3'h4)]}) * ({reg216} > {$unsigned($unsigned(wire212))}));
        end
      else
        begin
          if ($signed((^~$unsigned($signed((wire215 ? wire209 : wire211))))))
            begin
              reg217 <= ($signed((reg224[(3'h7):(3'h4)] ?
                  wire211[(4'h8):(3'h6)] : ((+wire211) ?
                      reg219[(3'h7):(3'h5)] : ((8'h9d) <= wire213)))) == $signed({reg218,
                  wire214[(4'hf):(3'h7)]}));
              reg218 <= ((((~(reg218 ? reg218 : reg219)) ?
                          reg219[(5'h13):(4'he)] : $unsigned($signed(reg221))) ?
                      ((-(reg217 >>> reg218)) ?
                          ($unsigned(reg220) >> (~^reg216)) : {{reg224}}) : $unsigned(wire215)) ?
                  wire210 : $unsigned($signed((reg222 - wire209))));
              reg219 <= $unsigned(((~&$signed($signed(wire209))) ?
                  $signed((wire212 ?
                      wire210 : wire213[(4'hb):(2'h3)])) : wire212));
              reg220 <= (^~(reg222[(1'h1):(1'h0)] ?
                  reg216 : (reg220[(2'h2):(1'h1)] <<< (wire210[(4'h8):(2'h3)] ?
                      (~reg224) : (wire213 ? reg224 : wire210)))));
            end
          else
            begin
              reg217 <= ($unsigned((7'h44)) - $signed($signed(({reg218,
                  wire211} <= wire214[(1'h0):(1'h0)]))));
              reg218 <= (8'h9f);
              reg219 <= (8'h9f);
              reg220 <= ((~&$signed({((7'h40) ?
                      reg216 : (8'had))})) & {$unsigned($signed($unsigned(reg223)))});
              reg221 <= (~&(({{reg217, reg216}} ?
                      ((reg221 >>> wire210) ?
                          (reg222 & reg222) : (reg223 ?
                              wire212 : reg220)) : reg224) ?
                  reg224 : $signed(((reg220 ? wire215 : reg224) ?
                      $unsigned(wire215) : $unsigned(wire209)))));
            end
          reg222 <= $signed($unsigned(reg216));
          if ((+reg218[(2'h2):(1'h1)]))
            begin
              reg223 <= (~|((((reg216 ? wire213 : wire215) ?
                      {wire215} : $unsigned(reg218)) | wire211[(4'ha):(4'h8)]) ?
                  $signed((-(~^(8'hb5)))) : reg218));
              reg224 <= (~^{($signed(reg223[(3'h7):(2'h2)]) - $unsigned($unsigned((8'hb1)))),
                  ({(~&wire210)} ?
                      $unsigned(reg217[(3'h7):(2'h2)]) : ((!reg223) <<< $signed(reg216)))});
              reg225 <= wire214[(5'h10):(4'hf)];
            end
          else
            begin
              reg223 <= (($unsigned($unsigned((reg223 ? (8'h9e) : reg219))) ?
                      reg218[(3'h5):(1'h1)] : (!((reg221 ?
                          reg224 : (8'hbe)) < (reg221 & wire211)))) ?
                  (8'hbd) : (|($signed($signed((8'ha9))) ?
                      ($unsigned(reg217) << wire215) : (^$signed(wire214)))));
              reg224 <= reg217;
            end
        end
    end
  assign wire226 = $signed((~|{(~&(~^reg219))}));
  assign wire227 = $unsigned(($unsigned((+(~^(8'h9c)))) >> $unsigned(reg217)));
  assign wire228 = ($signed($signed(reg220[(1'h1):(1'h1)])) + ({reg225,
                       ((+(7'h41)) ?
                           $signed(reg223) : reg218[(1'h1):(1'h1)])} ^~ $signed(reg219[(5'h10):(4'h8)])));
  assign wire229 = ({wire209, wire213[(4'hc):(3'h5)]} <= {wire214,
                       {(^wire213), wire209[(4'hd):(3'h7)]}});
  assign wire230 = ((wire211[(4'ha):(3'h7)] ?
                           wire226[(3'h5):(3'h4)] : $signed(reg220)) ?
                       reg224[(3'h6):(3'h6)] : $unsigned((8'hba)));
  assign wire231 = {reg224,
                       ((!$signed((reg225 & reg223))) ?
                           (wire213 ?
                               $signed(wire209) : $signed(((7'h44) ?
                                   wire228 : wire209))) : $unsigned(wire230[(3'h5):(2'h2)]))};
  assign wire232 = reg217;
  assign wire233 = $unsigned(reg225);
  assign wire234 = $unsigned((~|$signed(((~|wire211) != (wire227 ?
                       reg225 : wire231)))));
endmodule

module module167
#(parameter param197 = ({((^(&(8'hb7))) ? (!((8'ha8) != (8'hae))) : (((8'hae) ? (8'h9f) : (7'h41)) ? (~&(8'ha0)) : (~^(8'hb4)))), ((~{(8'ha9), (8'hbe)}) ? (!((8'hb7) | (8'ha2))) : (^((8'hbf) ^~ (8'hbc))))} ? {{((^(8'ha3)) ? ((8'ha7) < (7'h41)) : ((8'h9f) | (8'haf))), (((8'hb3) ? (8'hae) : (8'h9f)) < ((8'ha3) ? (8'haf) : (8'hb4)))}, (((|(8'ha3)) ? (+(8'ha7)) : ((8'ha2) * (8'ha3))) ? {(8'had)} : (8'hb7))} : (((((7'h41) ? (7'h40) : (8'hb0)) ? ((8'hb4) ? (8'hb3) : (8'ha1)) : ((8'hb5) - (8'ha1))) ? (((8'ha6) ? (8'hb6) : (8'h9f)) >> ((8'hbc) ? (8'ha1) : (8'hb9))) : (((8'hb7) ^ (7'h43)) ? (~|(8'hb4)) : ((8'hb5) || (8'hba)))) ? (!((~&(8'hb4)) ? ((8'hb0) ? (8'h9e) : (8'hb0)) : {(8'had), (8'h9e)})) : (^~(!((8'ha4) ? (8'ha5) : (8'hb7)))))))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire172;
  input wire [(4'hb):(1'h0)] wire171;
  input wire signed [(2'h2):(1'h0)] wire170;
  input wire signed [(2'h3):(1'h0)] wire169;
  input wire [(5'h12):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire196;
  wire [(5'h15):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire194;
  wire signed [(4'h8):(1'h0)] wire193;
  wire signed [(2'h2):(1'h0)] wire192;
  wire [(2'h2):(1'h0)] wire191;
  wire signed [(4'hb):(1'h0)] wire190;
  wire signed [(4'hd):(1'h0)] wire189;
  wire [(2'h3):(1'h0)] wire188;
  wire signed [(4'h9):(1'h0)] wire187;
  wire [(4'ha):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(4'h8):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  reg signed [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire185,
                 wire184,
                 wire180,
                 wire179,
                 wire178,
                 reg186,
                 reg183,
                 reg182,
                 reg181,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire170))
        begin
          reg173 <= ((8'hb4) > ((~^wire171[(2'h3):(2'h3)]) == wire169[(2'h3):(1'h0)]));
          reg174 <= {wire169[(2'h2):(1'h1)],
              (|$unsigned((-(wire170 ? wire171 : wire168))))};
          reg175 <= $unsigned(((($unsigned(wire172) ?
                  (reg173 ~^ wire169) : $signed(wire171)) ?
              ($unsigned(wire168) << $signed(wire169)) : ($signed((8'haa)) ?
                  (^wire168) : reg174[(3'h6):(3'h6)])) - ((~^(+reg173)) ?
              wire170[(1'h1):(1'h1)] : reg174[(1'h1):(1'h1)])));
          reg176 <= $signed(wire168[(3'h6):(2'h3)]);
          reg177 <= ($unsigned({(((8'hb4) > (7'h42)) ?
                      wire168 : $signed(wire172)),
                  (^~(reg173 ? reg175 : (8'haf)))}) ?
              (8'ha2) : wire172);
        end
      else
        begin
          reg173 <= (^~($unsigned(wire171[(1'h1):(1'h0)]) == reg175));
        end
    end
  assign wire178 = $unsigned(wire170);
  assign wire179 = {(wire171[(3'h5):(2'h2)] ?
                           (8'hb0) : ((reg177[(4'hb):(4'hb)] ~^ (^(8'h9e))) ?
                               $signed((&(8'h9c))) : (^~reg173))),
                       $signed(((^~$unsigned(reg173)) ?
                           ((~|reg175) == $unsigned((8'hb3))) : wire171))};
  assign wire180 = (&$unsigned((^wire179[(3'h5):(2'h3)])));
  always
    @(posedge clk) begin
      reg181 <= (($signed(wire171) ?
              ((~|((8'ha8) < wire170)) <<< wire168) : (~|$unsigned((|(7'h40))))) ?
          {(^~$signed({wire178})),
              {$signed(reg174[(3'h4):(2'h3)])}} : reg174[(5'h13):(4'h9)]);
      reg182 <= wire170[(2'h2):(1'h1)];
      reg183 <= reg176;
    end
  assign wire184 = $signed($signed({($unsigned(wire169) ~^ (~&reg176))}));
  assign wire185 = ($signed((^$unsigned({reg181}))) + $unsigned(reg181));
  always
    @(posedge clk) begin
      reg186 <= $signed({(|$unsigned($signed((8'ha7))))});
    end
  assign wire187 = reg176[(1'h1):(1'h0)];
  assign wire188 = $signed($unsigned(wire187[(2'h3):(2'h2)]));
  assign wire189 = reg174;
  assign wire190 = {{$unsigned((wire169 >>> (!wire171))),
                           $unsigned($signed((wire178 << (8'hb4))))}};
  assign wire191 = $signed($unsigned($signed($signed((wire170 ?
                       wire185 : reg177)))));
  assign wire192 = ($unsigned({(!$unsigned(wire179))}) << ($signed($unsigned(wire189)) ?
                       wire191 : ((!(wire169 ^~ wire190)) & ((wire188 || wire191) || (wire168 ?
                           wire178 : reg177)))));
  assign wire193 = wire171[(4'hb):(3'h6)];
  assign wire194 = (((~$signed((reg182 ?
                           wire171 : wire188))) ^ $signed(wire192[(1'h1):(1'h0)])) ?
                       (wire168 & wire180[(2'h3):(2'h3)]) : $unsigned(wire179));
  assign wire195 = $unsigned({(8'hbe)});
  assign wire196 = {((~&reg183[(1'h1):(1'h1)]) ?
                           $unsigned(wire171[(1'h1):(1'h1)]) : (({wire180,
                               wire185} * {(8'hb8)}) > ({(8'h9d),
                               wire189} <<< wire190))),
                       $signed($unsigned(wire180))};
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire145;
  input wire signed [(4'hf):(1'h0)] wire144;
  input wire signed [(5'h12):(1'h0)] wire143;
  input wire signed [(4'hd):(1'h0)] wire142;
  input wire [(5'h13):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire146;
  reg signed [(4'he):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire151,
                 wire150,
                 wire146,
                 reg154,
                 reg153,
                 reg152,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire146 = $unsigned((~&$unsigned($signed(wire141[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg147 <= wire141[(3'h4):(2'h2)];
      reg148 <= (({$signed(((8'ha6) ? wire141 : (8'ha0)))} ?
          $unsigned({wire141,
              (+wire146)}) : reg147[(2'h3):(2'h3)]) < {wire146});
      reg149 <= (wire145[(4'h8):(1'h0)] * reg147[(3'h5):(1'h0)]);
    end
  assign wire150 = $unsigned((8'hbe));
  assign wire151 = reg149[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg152 <= ($signed($signed(wire150)) <<< $signed((wire141 ?
          $unsigned({wire144}) : (wire141[(5'h11):(3'h6)] <= {wire144,
              reg147}))));
      reg153 <= $signed((reg147[(2'h2):(2'h2)] ?
          ((reg152 <= (reg148 ? wire142 : reg148)) ?
              (~reg152[(2'h3):(2'h3)]) : wire146[(1'h0):(1'h0)]) : wire145[(1'h0):(1'h0)]));
      reg154 <= (~^(+(8'hb3)));
    end
  assign wire155 = $unsigned({$signed((+((8'haa) != reg147)))});
  assign wire156 = wire146;
  assign wire157 = ((~(($unsigned(reg154) > $unsigned(wire145)) * wire150[(2'h2):(1'h0)])) + (~wire151[(3'h6):(3'h6)]));
  assign wire158 = ($unsigned(($unsigned($signed(wire143)) > (~|$unsigned(wire144)))) ?
                       (~$unsigned(reg154)) : $signed((((wire150 ?
                                   wire143 : reg153) ?
                               (wire150 ~^ wire155) : (|reg154)) ?
                           ($unsigned((8'h9c)) >= (^(8'hb6))) : reg153[(4'he):(3'h7)])));
endmodule
