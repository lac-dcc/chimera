module top
#(parameter param201 = (|{((^(!(8'ha4))) ? (((8'haa) ? (8'hb2) : (8'h9c)) ? (~&(8'hb4)) : (8'hbc)) : ((8'hb4) == ((8'h9e) ? (8'hb7) : (8'h9e)))), {(((7'h44) << (8'h9f)) ? ((8'h9f) | (8'hae)) : ((8'hae) >>> (8'ha8)))}}), 
parameter param202 = ((8'hac) * (-(((param201 + param201) <<< {param201}) ? (param201 & param201) : ((~^(8'hbb)) ^ {param201, (8'ha9)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire186;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire91;
  reg [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'hb):(1'h0)] reg188 = (1'h0);
  reg signed [(4'he):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(3'h5):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  assign y = {wire186,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire165,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 (1'h0)};
  module5 #() modinst92 (wire91, clk, wire2, wire3, wire0, wire4);
  assign wire93 = wire3;
  assign wire94 = $signed(wire3[(3'h5):(2'h2)]);
  assign wire95 = $unsigned((({wire2} ?
                      (^$unsigned(wire3)) : wire1[(1'h1):(1'h1)]) * $signed((wire93[(3'h5):(2'h3)] ?
                      (wire1 << (8'hb4)) : (wire4 ? wire4 : wire91)))));
  assign wire96 = (((-wire0) ?
                      $signed(wire4) : (wire91[(4'he):(4'hb)] < wire94[(1'h1):(1'h1)])) ^ wire93);
  assign wire97 = ($unsigned((-((+(8'hb3)) ~^ (+wire1)))) - wire2);
  assign wire98 = $unsigned(wire1[(3'h7):(2'h3)]);
  assign wire99 = $unsigned((~^wire91[(3'h4):(2'h3)]));
  module100 #() modinst166 (.clk(clk), .wire102(wire3), .wire103(wire99), .wire101(wire4), .y(wire165), .wire104(wire1));
  assign wire167 = wire95;
  assign wire168 = $unsigned({(^wire165[(3'h6):(1'h1)]),
                       (((wire91 ? wire96 : wire3) != {wire165}) ?
                           (8'had) : $signed((&(8'ha1))))});
  assign wire169 = wire3;
  assign wire170 = {($signed(($signed(wire167) * {(8'hbf)})) ?
                           $unsigned(wire96[(4'hf):(4'hd)]) : wire169)};
  assign wire171 = (&wire98);
  always
    @(posedge clk) begin
      if ($unsigned(wire91))
        begin
          reg172 <= (((wire98[(4'hb):(4'h8)] < (-(&(8'hb2)))) ?
              wire97 : $unsigned(wire167[(4'hb):(4'ha)])) ^ (~wire97));
          reg173 <= wire167[(4'h9):(4'h8)];
        end
      else
        begin
          if (wire4)
            begin
              reg172 <= {$signed(((+wire96[(5'h10):(4'hb)]) ?
                      $unsigned(((8'hb6) & wire171)) : ({(8'ha1)} != $unsigned(wire0))))};
              reg173 <= $unsigned(reg172);
            end
          else
            begin
              reg172 <= $signed($signed($signed((~$unsigned(wire168)))));
              reg173 <= reg173;
              reg174 <= (wire93 ?
                  (!($unsigned($unsigned((8'hab))) <<< $unsigned(wire93))) : (~|(($signed(wire97) ?
                      {wire97, reg173} : $unsigned(wire96)) * reg172)));
              reg175 <= (^($unsigned(((~(8'hbc)) ?
                      ((8'ha0) ? wire167 : (7'h44)) : (wire94 ?
                          wire93 : reg173))) ?
                  wire99[(3'h5):(1'h1)] : $signed(((+wire93) ?
                      wire93[(2'h2):(2'h2)] : (wire91 >> wire1)))));
              reg176 <= ((!((&(8'ha6)) <<< (((8'had) ?
                  wire170 : (8'ha8)) << (wire95 ?
                  wire2 : wire93)))) == wire1[(4'h8):(4'h8)]);
            end
          reg177 <= wire97;
          reg178 <= (&wire93[(3'h5):(2'h3)]);
        end
      reg179 <= {(-(~reg177[(3'h4):(2'h3)])), $unsigned((8'hbe))};
      reg180 <= (8'ha1);
      if ($signed(wire1))
        begin
          reg181 <= wire98;
          if ((^~wire97[(3'h5):(1'h0)]))
            begin
              reg182 <= ($signed($unsigned(wire91[(4'he):(3'h4)])) ?
                  $unsigned(reg177[(3'h7):(1'h0)]) : wire91[(3'h6):(3'h4)]);
            end
          else
            begin
              reg182 <= {wire169[(5'h12):(4'hf)]};
            end
          reg183 <= wire171[(2'h3):(1'h0)];
        end
      else
        begin
          reg181 <= ($unsigned((wire91 ?
              (wire171[(2'h2):(1'h1)] > (wire171 > (8'haa))) : wire4)) <= ((!{(&wire91)}) ?
              reg181[(2'h3):(2'h3)] : (((8'h9c) ?
                  {(8'ha0), reg179} : {reg179}) <= (reg182[(1'h0):(1'h0)] ?
                  (~|wire95) : ((8'hbe) ? (7'h41) : wire168)))));
          reg182 <= wire1;
          reg183 <= $signed($unsigned((8'hb2)));
          reg184 <= ($unsigned({((^reg179) ? wire93 : (~|reg182)), wire167}) ?
              $unsigned(reg183) : wire4);
        end
      reg185 <= {((~|reg182[(4'ha):(3'h5)]) ?
              (~($signed(wire165) ?
                  (reg172 ?
                      wire95 : reg180) : $signed(reg172))) : $signed(wire171[(4'h9):(3'h5)]))};
    end
  assign wire186 = (~^(!{wire91[(4'hc):(4'hc)]}));
  always
    @(posedge clk) begin
      reg187 <= {((&wire95[(1'h1):(1'h0)]) <= wire165[(4'h9):(3'h7)]),
          ({((wire0 ? wire93 : wire170) ?
                  (wire91 ^~ reg182) : $unsigned(reg175))} ~^ wire167[(4'h9):(2'h2)])};
      if (reg172)
        begin
          if ($unsigned(((|(8'hbe)) ^ reg182)))
            begin
              reg188 <= wire2[(1'h0):(1'h0)];
              reg189 <= wire93[(2'h2):(1'h0)];
            end
          else
            begin
              reg188 <= (8'hbe);
              reg189 <= wire97;
            end
          reg190 <= wire94[(3'h4):(2'h2)];
          reg191 <= (|reg172[(2'h2):(1'h1)]);
          reg192 <= wire165[(2'h2):(2'h2)];
          if ((reg173 <<< $signed($signed(wire3))))
            begin
              reg193 <= (^({$signed((wire94 + wire3))} ?
                  (|$signed(wire3[(3'h7):(3'h4)])) : $unsigned(wire3[(3'h7):(2'h2)])));
              reg194 <= $signed(wire93[(3'h4):(1'h1)]);
              reg195 <= {$unsigned(reg177)};
            end
          else
            begin
              reg193 <= $unsigned(((^~((wire95 >>> (8'ha6)) + ((8'haa) <<< reg185))) ?
                  $unsigned((~^{reg188})) : ((reg187 * wire99) ?
                      ($signed(wire168) >= wire97) : {(!(8'ha6))})));
              reg194 <= $signed($unsigned(wire169));
              reg195 <= ($signed(($signed({wire186}) ?
                  ((~wire95) + wire168[(4'hd):(3'h6)]) : {$signed(wire96)})) ~^ (!(($signed(reg183) <<< $signed(wire93)) >= $signed(wire4))));
              reg196 <= $unsigned($signed($unsigned({wire97[(1'h1):(1'h0)],
                  wire96[(4'ha):(2'h3)]})));
              reg197 <= ((^~$unsigned(((reg192 <<< reg181) - $unsigned(reg177)))) ?
                  wire186 : $unsigned($unsigned(wire2)));
            end
        end
      else
        begin
          reg188 <= wire1[(5'h11):(4'hf)];
        end
      reg198 <= (reg194[(1'h1):(1'h0)] - $signed(reg182[(4'h9):(2'h2)]));
      reg199 <= $signed($signed($signed($unsigned((wire0 ? wire167 : wire4)))));
      reg200 <= $signed(($signed($signed((~|reg181))) ~^ ((|{wire94}) ?
          reg191[(1'h1):(1'h1)] : {(reg193 ? wire186 : reg181)})));
    end
endmodule

module module100
#(parameter param164 = (8'hbf))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire104;
  input wire signed [(3'h5):(1'h0)] wire103;
  input wire [(4'he):(1'h0)] wire102;
  input wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire123,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire105 = wire104[(4'ha):(4'h8)];
  assign wire106 = $signed(((8'hbd) < wire105[(4'h8):(2'h3)]));
  assign wire107 = $signed($signed(($unsigned((wire102 ? wire106 : (8'ha4))) ?
                       wire106[(1'h0):(1'h0)] : wire105)));
  assign wire108 = ((wire103 || $unsigned(wire105)) >>> (wire102[(4'ha):(4'h9)] == $unsigned($signed((^wire106)))));
  always
    @(posedge clk) begin
      if (wire102)
        begin
          reg109 <= ($unsigned((~|$unsigned((8'ha3)))) ?
              (+({wire105} ?
                  (((8'hbb) ? wire106 : wire101) ?
                      $signed(wire105) : wire105) : ((wire104 ?
                          wire102 : wire104) ?
                      (!wire108) : (|(8'hb5))))) : (-((8'ha8) ?
                  ($signed(wire107) ^ {wire101}) : wire102[(4'hc):(2'h3)])));
          if ({{((wire104 ^~ wire102[(2'h2):(1'h1)]) > wire104[(3'h4):(1'h1)]),
                  (wire106 ?
                      ($unsigned(wire106) == $unsigned(wire106)) : {(wire105 >> wire103),
                          (wire103 & (8'hb0))})},
              wire107})
            begin
              reg110 <= $signed($signed($signed((wire101[(3'h6):(1'h0)] ?
                  wire107 : (~^wire104)))));
              reg111 <= reg110[(2'h2):(2'h2)];
              reg112 <= wire104[(4'hf):(2'h3)];
            end
          else
            begin
              reg110 <= (+$signed(($signed($unsigned(wire101)) ?
                  (~(|wire108)) : (~reg111[(1'h1):(1'h1)]))));
              reg111 <= wire101;
              reg112 <= wire106;
              reg113 <= {reg111, $unsigned(wire104[(2'h2):(1'h1)])};
              reg114 <= {{wire107},
                  ((($signed(wire104) ?
                      (|wire102) : wire104) == (((8'h9d) != reg112) ?
                      $signed(wire104) : wire105)) >> wire102)};
            end
        end
      else
        begin
          reg109 <= (|(^$signed($unsigned((reg114 <<< wire101)))));
          if ({wire102, (~|(|wire102))})
            begin
              reg110 <= (~$signed(((~$unsigned(wire101)) ^~ $signed((wire105 <<< wire106)))));
              reg111 <= ((-$signed((&$signed(wire101)))) > $signed(wire108));
              reg112 <= {reg112[(1'h1):(1'h1)]};
              reg113 <= $signed(reg114[(4'h9):(3'h4)]);
            end
          else
            begin
              reg110 <= (($unsigned(((wire103 ?
                      (8'hbc) : reg112) ^ (reg109 | reg112))) ?
                  reg112[(3'h6):(3'h4)] : reg109) << (reg112 ?
                  $signed(wire108) : (-(+((7'h41) | reg110)))));
              reg111 <= ($unsigned(((!((8'hb8) ?
                  (8'hab) : wire103)) + (~|wire101))) * {(~|reg110[(1'h0):(1'h0)]),
                  $signed(((wire105 >> wire108) & $signed(reg109)))});
              reg112 <= {{$unsigned((((8'ha0) && (8'hb7)) ?
                          (wire102 ?
                              (8'haf) : wire107) : reg111[(5'h12):(4'hd)])),
                      ($signed((|reg109)) | $signed(wire101[(4'hd):(4'h9)]))},
                  $signed($signed((~(wire105 ? (8'hac) : reg113))))};
              reg113 <= wire103[(1'h0):(1'h0)];
            end
          reg114 <= wire108[(1'h0):(1'h0)];
        end
      reg115 <= wire107[(1'h1):(1'h1)];
      reg116 <= (reg113 + $unsigned(reg111));
      if (reg111[(4'hd):(3'h4)])
        begin
          reg117 <= ($unsigned($unsigned(($unsigned(reg112) ?
              (reg114 ?
                  wire105 : reg112) : (wire108 << (8'haf))))) ~^ $signed(wire104[(3'h6):(3'h6)]));
          reg118 <= wire101;
          reg119 <= $signed($unsigned($signed(wire107[(1'h1):(1'h1)])));
        end
      else
        begin
          if ($unsigned(($unsigned({{reg110}}) ^ $unsigned({$unsigned(reg111),
              wire101[(2'h2):(1'h0)]}))))
            begin
              reg117 <= ({($unsigned(wire107) ?
                      ((|wire106) << $unsigned(reg118)) : $signed($unsigned(reg113)))} && reg117[(2'h2):(1'h1)]);
              reg118 <= (((~&(wire106[(1'h1):(1'h0)] << $unsigned(reg117))) ?
                      {((reg111 * wire106) != $unsigned(reg111))} : ((+(~wire107)) || (~&(reg112 ?
                          reg113 : reg112)))) ?
                  $signed($signed(({reg112} ?
                      (&wire108) : {reg111}))) : (-($signed((!(8'hb0))) ?
                      {(^wire103), reg117} : $unsigned($signed(reg111)))));
              reg119 <= (wire102 - $signed(reg117[(2'h2):(1'h1)]));
              reg120 <= $unsigned((8'hab));
              reg121 <= (reg110 && reg116);
            end
          else
            begin
              reg117 <= $signed((wire105 ?
                  ((8'h9f) <= ({reg118, reg117} ?
                      reg112[(2'h3):(1'h0)] : $unsigned((8'ha7)))) : wire104));
              reg118 <= ($unsigned(reg121[(1'h1):(1'h0)]) ?
                  {$signed((-{(8'hb1)}))} : $signed((^(8'ha2))));
              reg119 <= (|$signed(reg111));
              reg120 <= (~^({$signed(reg120), {$signed(wire107)}} ?
                  $unsigned((reg113[(3'h5):(1'h0)] * (reg113 && wire107))) : $signed($unsigned($signed(reg121)))));
              reg121 <= ($signed((&({reg116} ?
                  $unsigned((7'h40)) : (reg119 ?
                      wire107 : wire107)))) < {$signed({(~^(8'ha0)),
                      (wire107 * reg114)}),
                  reg113});
            end
        end
      reg122 <= $unsigned(((wire107[(3'h7):(2'h2)] * ($unsigned(reg109) ?
          reg113 : {reg121})) || reg109[(1'h0):(1'h0)]));
    end
  assign wire123 = reg110;
  module124 #() modinst160 (wire159, clk, wire108, wire106, reg118, reg119);
  assign wire161 = (reg115 ?
                       (^~(~^(!(reg122 ^~ reg119)))) : ((~(wire105[(1'h1):(1'h1)] ?
                           (wire103 && reg118) : (wire159 ?
                               wire159 : (8'hbd)))) > $unsigned((~reg120[(2'h2):(1'h0)]))));
  assign wire162 = $signed($signed($signed(((-reg116) != reg112[(4'h9):(2'h2)]))));
  assign wire163 = $signed((reg112[(2'h2):(1'h1)] >>> ($signed((reg120 ?
                       wire103 : wire161)) != $unsigned($unsigned(wire108)))));
endmodule

module module5
#(parameter param89 = {(((~^((8'h9f) + (8'ha2))) * (((8'hbf) ? (8'hbf) : (8'hb1)) ? ((8'hb4) ^~ (8'h9f)) : (8'hab))) - (~&((!(8'hbc)) | ((8'ha2) > (8'hb2))))), ((-(^~(+(8'h9d)))) == (~^((|(8'hb5)) | (~^(8'hbe)))))}, 
parameter param90 = (~|((({param89, param89} ^ (param89 != param89)) ? param89 : param89) ~^ param89)))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire87;
  assign y = {wire10, wire11, wire57, wire87, (1'h0)};
  assign wire10 = (+wire7[(1'h0):(1'h0)]);
  assign wire11 = (wire7[(4'hb):(1'h1)] ~^ (&(wire8[(3'h7):(3'h7)] > ($signed(wire9) > (wire8 ?
                      (8'hab) : wire6)))));
  module12 #() modinst58 (wire57, clk, wire11, wire9, wire6, wire10);
  module59 #() modinst88 (.wire64(wire7), .wire61(wire6), .clk(clk), .wire62(wire11), .wire60(wire8), .y(wire87), .wire63(wire57));
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire64;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire62;
  input wire signed [(5'h10):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  assign y = {wire86,
                 wire66,
                 wire65,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 (1'h0)};
  assign wire65 = $signed((~&wire60[(4'hd):(4'hd)]));
  assign wire66 = wire65[(5'h11):(3'h5)];
  always
    @(posedge clk) begin
      if (wire63[(4'hc):(4'h8)])
        begin
          reg67 <= (~|wire61[(4'hd):(1'h0)]);
          reg68 <= wire64;
          reg69 <= $unsigned((-(((!wire62) - (-wire61)) ?
              wire61 : ((^wire65) ? $unsigned(wire66) : (reg67 <= reg68)))));
          reg70 <= $unsigned(((~|(8'haa)) ?
              (wire64 <<< $unsigned($unsigned(wire61))) : $signed($unsigned((wire63 != reg67)))));
        end
      else
        begin
          reg67 <= $signed((~|$signed(($unsigned((7'h40)) * wire65[(3'h5):(2'h3)]))));
          reg68 <= ((~{(^wire66),
              $signed((wire62 < wire65))}) > reg68[(4'he):(4'h9)]);
          reg69 <= wire64[(3'h4):(2'h3)];
        end
      if (wire64)
        begin
          if (((wire61[(2'h3):(2'h3)] - $unsigned(wire63[(3'h6):(1'h1)])) >> $unsigned((reg68 ?
              {(&reg67)} : ((reg69 ? wire64 : wire66) ~^ (|(8'ha9)))))))
            begin
              reg71 <= wire62;
              reg72 <= (&($unsigned($signed({wire62})) != $unsigned((wire65 != wire62[(4'hb):(1'h1)]))));
              reg73 <= (~|wire62[(1'h0):(1'h0)]);
              reg74 <= (8'hbf);
            end
          else
            begin
              reg71 <= (~^(wire65 | {wire66[(3'h4):(2'h2)]}));
              reg72 <= ($unsigned(wire63[(2'h2):(2'h2)]) ^ $signed($unsigned(reg69[(1'h1):(1'h1)])));
              reg73 <= reg74;
            end
          if ((reg71 <= ({({wire65, reg73} - $signed((8'haf))),
                  (reg69[(2'h2):(2'h2)] <= reg71)} ?
              (-(8'hac)) : {(reg67 ? wire64[(1'h1):(1'h1)] : $unsigned(reg70)),
                  {(~(8'haa)), {wire65, reg68}}})))
            begin
              reg75 <= (wire66[(4'h8):(3'h6)] ^~ (-reg68));
              reg76 <= reg71;
              reg77 <= ((wire64 ?
                  (~($signed(wire63) ?
                      (reg73 >> wire65) : (reg67 ?
                          reg69 : wire61))) : (^~((&reg71) < (wire64 == wire60)))) | ((((reg68 || reg73) ?
                          wire63 : $unsigned(reg73)) ?
                      $signed(reg74) : reg74[(2'h3):(1'h1)]) ?
                  $unsigned(reg68[(4'hd):(2'h3)]) : {($signed(wire63) << wire66),
                      reg74[(2'h3):(2'h2)]}));
            end
          else
            begin
              reg75 <= (reg74[(1'h1):(1'h0)] ?
                  {($unsigned($unsigned(wire66)) ?
                          $unsigned({reg70,
                              wire64}) : wire61[(4'h9):(3'h6)])} : reg70[(3'h6):(2'h2)]);
              reg76 <= {$unsigned($unsigned(wire65)), reg67[(3'h6):(1'h1)]};
            end
          reg78 <= $unsigned(wire62[(4'ha):(1'h0)]);
          reg79 <= $signed($signed($unsigned($signed($signed(reg70)))));
        end
      else
        begin
          reg71 <= (8'hbd);
        end
      if (reg70[(1'h0):(1'h0)])
        begin
          reg80 <= (8'ha5);
          reg81 <= $unsigned((8'hb6));
        end
      else
        begin
          reg80 <= (^~$unsigned(({(reg76 > wire64)} ?
              ({reg70, reg67} ? (wire61 ? reg69 : reg74) : reg75) : reg71)));
          if (reg79)
            begin
              reg81 <= (&reg73[(3'h5):(3'h4)]);
            end
          else
            begin
              reg81 <= ((-$signed(($signed(reg75) == $signed(reg72)))) ^~ ((reg71 ^~ ($unsigned(reg70) && wire61)) | (((reg81 * reg75) ?
                      reg68[(4'hc):(4'h8)] : (-wire60)) ?
                  (reg73 >>> ((8'hbf) ~^ reg73)) : (+(!(8'hb0))))));
              reg82 <= $signed((~&wire64));
              reg83 <= reg75;
              reg84 <= reg82;
              reg85 <= reg76;
            end
        end
    end
  assign wire86 = ((^~$unsigned(((reg82 ? reg78 : reg69) ?
                      $signed(wire60) : reg77[(3'h4):(2'h2)]))) ~^ reg78[(3'h5):(1'h1)]);
endmodule

module module12
#(parameter param55 = (8'hac), 
parameter param56 = (~^((-(^~param55)) ? (~|(|(~param55))) : ((7'h44) ? (^param55) : ((~|param55) | (param55 - param55))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire42,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 reg29,
                 (1'h0)};
  assign wire17 = wire14;
  assign wire18 = (((wire17 >> wire16[(3'h7):(2'h3)]) <<< $signed(wire17)) >= (8'h9f));
  assign wire19 = $signed($unsigned($signed($signed($unsigned(wire14)))));
  assign wire20 = (-{($signed(wire17) ?
                          {{(7'h41)}, wire16[(3'h4):(2'h3)]} : wire17)});
  assign wire21 = $unsigned(wire19[(1'h0):(1'h0)]);
  assign wire22 = $unsigned(wire18);
  assign wire23 = ((8'hb7) != wire22);
  assign wire24 = (^(~$signed(wire17[(3'h7):(2'h3)])));
  assign wire25 = (8'ha1);
  assign wire26 = (wire19 >>> $signed(wire18));
  assign wire27 = (~^$unsigned(wire16));
  assign wire28 = wire20[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg29 <= (~&wire19);
    end
  assign wire30 = (&{wire14, $signed(wire13)});
  always
    @(posedge clk) begin
      reg31 <= ($signed(wire23) != $unsigned(((wire24 ?
              (wire21 << wire30) : (&wire28)) ?
          (~&(wire22 ? (8'ha8) : wire13)) : $signed((wire20 ?
              wire18 : wire20)))));
      if ($unsigned((($signed(wire20) ?
              $signed((!wire16)) : ((wire14 ?
                  (8'hbb) : wire17) ^ (reg29 << wire25))) ?
          wire13[(4'h8):(1'h1)] : wire18)))
        begin
          reg32 <= (((wire14 <<< ($signed(wire30) ?
                  wire21 : wire23[(3'h7):(3'h5)])) == {($unsigned(wire13) ^ (wire25 ?
                      (8'ha1) : wire23)),
                  $unsigned((wire22 ? wire13 : wire20))}) ?
              (7'h41) : {wire19[(3'h4):(1'h0)], wire19[(2'h3):(2'h3)]});
          if (wire25)
            begin
              reg33 <= $signed({reg29, (~|$unsigned((^~wire21)))});
              reg34 <= (8'h9f);
              reg35 <= {(^wire26[(1'h0):(1'h0)]),
                  (-(($unsigned(reg32) != (7'h41)) >> ((wire22 || (8'h9c)) * wire17)))};
              reg36 <= $unsigned(((8'hb2) ?
                  $signed((reg31 && (wire30 > wire13))) : wire21[(2'h3):(2'h2)]));
            end
          else
            begin
              reg33 <= (^~(wire30[(3'h6):(2'h3)] | {(~$signed((8'ha1))),
                  ((wire13 ? wire30 : reg32) >> (^wire20))}));
              reg34 <= $signed(wire22);
              reg35 <= (wire19[(3'h6):(3'h6)] > ((wire30 & ((wire18 > wire30) ?
                  reg31 : $unsigned(wire26))) <= {(!(reg32 << wire14))}));
            end
          reg37 <= (-wire30);
          reg38 <= $signed(wire24[(2'h3):(2'h2)]);
          if (reg38[(4'hc):(4'ha)])
            begin
              reg39 <= wire18[(1'h1):(1'h0)];
            end
          else
            begin
              reg39 <= wire28[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg32 <= (($signed((~|(^~wire20))) ?
              $unsigned(($signed(wire18) ?
                  (reg37 ?
                      (7'h43) : reg34) : wire25)) : (~^wire23[(1'h1):(1'h0)])) != (^~((+(wire21 < (7'h41))) + ((8'hbb) > (7'h41)))));
        end
      reg40 <= ($unsigned(($signed(wire19[(4'ha):(3'h6)]) >>> ((~&(8'h9c)) >> wire15[(2'h2):(2'h2)]))) ?
          {$unsigned($unsigned(reg33[(4'ha):(3'h7)]))} : wire21);
      reg41 <= $unsigned((~|{wire17[(2'h3):(2'h2)]}));
    end
  assign wire42 = (~(!$unsigned(reg41[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      reg43 <= {((-wire24) ?
              $signed({(reg39 > wire23)}) : ((+(reg33 ?
                  reg37 : wire30)) ~^ (8'hb3)))};
      reg44 <= reg38[(4'hc):(4'h9)];
      if (reg34)
        begin
          reg45 <= (((reg31 != ($signed(wire13) ?
                  ((8'hb2) ?
                      reg38 : (8'ha6)) : wire15[(4'he):(4'he)])) ^~ (|$signed(reg29[(3'h5):(1'h0)]))) ?
              $unsigned(($unsigned({reg39, reg32}) ?
                  wire17[(5'h14):(5'h12)] : ({reg35, wire21} ?
                      (wire15 ?
                          wire16 : reg35) : $signed(reg34)))) : (((~wire21) ?
                      reg33[(2'h2):(2'h2)] : $unsigned($signed(wire21))) ?
                  (((reg36 ? reg44 : wire14) ?
                          $signed(wire20) : (wire18 ~^ reg39)) ?
                      $signed(wire28[(2'h2):(1'h1)]) : wire19) : ($unsigned({reg39,
                          wire18}) ?
                      (|{wire27}) : reg43[(1'h1):(1'h0)])));
          reg46 <= $signed($signed((8'ha9)));
          reg47 <= wire30;
          reg48 <= wire19[(4'hb):(4'ha)];
          reg49 <= {($unsigned(reg47) ?
                  $unsigned(wire21[(1'h0):(1'h0)]) : {$signed((reg37 ?
                          reg47 : wire23)),
                      {reg46}}),
              reg47[(3'h5):(3'h5)]};
        end
      else
        begin
          reg45 <= ($unsigned((~^({reg29} * (7'h41)))) ~^ reg35[(3'h5):(1'h0)]);
          reg46 <= {wire25[(3'h4):(2'h2)], reg32};
        end
    end
  assign wire50 = {($signed(wire30) ~^ wire22)};
  assign wire51 = reg32[(3'h4):(1'h0)];
  assign wire52 = $unsigned((~&(8'hab)));
  assign wire53 = {$signed((^~wire30[(2'h2):(1'h0)])),
                      $unsigned($signed($signed((reg35 < reg45))))};
  assign wire54 = (wire50[(4'hf):(4'h9)] && wire16[(3'h5):(1'h0)]);
endmodule

module module124
#(parameter param158 = ((!(+(&{(8'h9f), (8'h9d)}))) ? {(^((!(8'ha4)) ? ((8'hbe) ? (8'ha8) : (8'haa)) : {(8'ha9)})), {(|(!(8'haf))), (|((7'h40) ^ (8'ha8)))}} : (({((8'ha2) ? (8'ha1) : (8'hbf))} ? {{(8'ha8)}} : ((|(8'ha1)) == ((7'h41) ? (8'hab) : (8'hae)))) ? ((((8'hbe) ^ (8'ha7)) ? ((8'hb3) == (8'h9d)) : {(8'ha8)}) & {{(8'hae)}, ((8'ha3) != (8'hba))}) : ({((8'ha6) ? (7'h44) : (8'hb4)), (!(8'haa))} * (((8'ha9) > (7'h40)) ? ((8'h9d) ? (8'h9f) : (8'ha1)) : (8'hb1))))))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire128;
  input wire signed [(5'h10):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  input wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(4'h9):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire151;
  wire [(3'h7):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg153,
                 reg152,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire129 = ($signed($signed(wire127)) & $unsigned(wire125));
  assign wire130 = $unsigned(wire128);
  assign wire131 = ($signed(wire128[(2'h3):(1'h1)]) > wire127[(4'hf):(1'h0)]);
  assign wire132 = (wire125 ? $signed(wire126) : wire131[(2'h3):(2'h2)]);
  assign wire133 = $signed($signed($unsigned(wire126)));
  assign wire134 = wire131;
  assign wire135 = $unsigned(wire134);
  always
    @(posedge clk) begin
      reg136 <= wire125;
      reg137 <= ($signed($unsigned((8'ha0))) ?
          wire135 : wire128[(2'h3):(2'h3)]);
      reg138 <= $signed(wire132[(3'h4):(2'h2)]);
      if ($unsigned(($unsigned({(~&(7'h43))}) < $unsigned((~(wire131 ?
          (8'hbc) : wire131))))))
        begin
          reg139 <= wire133[(3'h6):(2'h3)];
          reg140 <= $unsigned(((reg136 ?
                  (8'hb9) : $unsigned((wire132 ? wire127 : wire128))) ?
              ($signed({wire130}) ?
                  (((8'h9c) ? (8'hae) : wire125) ?
                      (^reg137) : wire131) : $signed(wire126[(3'h7):(3'h4)])) : $unsigned(reg138)));
          reg141 <= ((|$unsigned($unsigned((wire129 ?
              (8'hbf) : (8'h9f))))) < (((^~wire130[(3'h7):(1'h0)]) ?
              wire135[(3'h6):(2'h2)] : {$signed(wire134),
                  wire134[(1'h0):(1'h0)]}) == (((wire134 < (8'haa)) << (~(8'ha4))) ?
              $signed((wire128 ? reg136 : wire126)) : ((^wire125) ?
                  (wire131 << wire133) : $unsigned(wire135)))));
          reg142 <= ({{(~|reg140), (wire133[(2'h2):(1'h1)] | wire125)},
                  wire128} ?
              (reg141[(1'h0):(1'h0)] ?
                  $unsigned((wire131 ?
                      wire131[(3'h7):(3'h5)] : wire133[(3'h7):(1'h1)])) : {((~|wire135) ?
                          wire134[(3'h4):(3'h4)] : ((7'h43) ?
                              wire134 : reg138)),
                      reg139[(4'hc):(3'h5)]}) : (~|(&($signed(reg140) >> $unsigned(reg136)))));
        end
      else
        begin
          reg139 <= (wire134[(3'h4):(1'h0)] - $unsigned($unsigned($signed((^reg136)))));
          reg140 <= $signed((~|$unsigned((+(wire127 ? wire134 : reg142)))));
          if ({$unsigned(reg142[(2'h2):(2'h2)])})
            begin
              reg141 <= {$signed(wire132),
                  ({$signed(reg138),
                      $unsigned(reg139[(2'h3):(2'h3)])} | $unsigned($signed(reg136[(1'h0):(1'h0)])))};
              reg142 <= ({$signed(($unsigned(wire134) ?
                          $unsigned(wire126) : $signed(wire135))),
                      ({(+wire130)} ?
                          $signed(reg137[(2'h3):(2'h3)]) : (reg140[(2'h2):(2'h2)] ?
                              $unsigned(wire135) : {(8'haf)}))} ?
                  $unsigned((wire131 ?
                      (^~(wire126 <= wire133)) : (8'ha5))) : $signed((~|$signed((+wire135)))));
              reg143 <= wire127;
              reg144 <= $unsigned(wire125);
            end
          else
            begin
              reg141 <= ({{$signed((wire134 ?
                          reg143 : reg142))}} < $signed(wire128));
              reg142 <= (8'ha7);
            end
        end
    end
  always
    @(posedge clk) begin
      reg145 <= (reg138[(4'ha):(1'h1)] + $unsigned((wire125[(2'h2):(1'h1)] << (((8'hb5) ?
          wire130 : (8'ha5)) >> $signed(wire135)))));
      reg146 <= wire132[(3'h6):(3'h5)];
    end
  assign wire147 = reg146[(4'h9):(3'h7)];
  assign wire148 = ((+(~|($unsigned(reg141) == wire134[(3'h5):(3'h4)]))) ?
                       reg145[(4'h8):(3'h6)] : (wire132 - (~|reg137[(1'h1):(1'h0)])));
  assign wire149 = $signed(($signed(((+wire129) + $unsigned(reg137))) ?
                       reg136 : {$signed((reg143 >> (7'h42)))}));
  assign wire150 = ((wire130 > (~^wire133)) ?
                       wire127 : (wire134[(2'h3):(1'h0)] ?
                           ($signed((~&wire133)) * (~|reg138[(1'h0):(1'h0)])) : wire133[(2'h3):(1'h1)]));
  assign wire151 = wire132;
  always
    @(posedge clk) begin
      reg152 <= {reg141, reg137};
      reg153 <= $signed(($unsigned((wire133 >>> $signed(wire131))) ?
          ((((8'ha6) ?
              wire128 : wire148) && (^~wire135)) ^ wire133[(4'h9):(3'h5)]) : $signed((wire147 ?
              (wire135 ? (8'hab) : wire134) : (^~reg136)))));
    end
  assign wire154 = ({reg143} ^ $signed($unsigned($unsigned(wire132))));
  assign wire155 = (8'ha8);
  assign wire156 = $unsigned((^(((8'h9e) ?
                       $unsigned(wire126) : reg136[(1'h1):(1'h1)]) >>> (8'haa))));
  assign wire157 = $unsigned(reg140);
endmodule
