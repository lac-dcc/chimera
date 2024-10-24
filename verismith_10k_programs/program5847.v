module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire209;
  wire signed [(4'h9):(1'h0)] wire207;
  wire signed [(5'h10):(1'h0)] wire206;
  wire signed [(5'h12):(1'h0)] wire205;
  wire signed [(4'hc):(1'h0)] wire203;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire61;
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  assign y = {wire209,
                 wire207,
                 wire206,
                 wire205,
                 wire203,
                 wire79,
                 wire67,
                 wire66,
                 wire61,
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
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  module4 #() modinst62 (.wire6(wire0), .clk(clk), .wire7(wire2), .wire5(wire3), .wire8(wire1), .wire9((8'ha2)), .y(wire61));
  always
    @(posedge clk) begin
      reg63 <= $signed({(wire0 ? wire3[(4'he):(2'h2)] : $signed(wire61)),
          wire3});
      reg64 <= ({$signed($unsigned((wire61 ? wire0 : reg63)))} + wire3);
      reg65 <= $unsigned($unsigned(($signed((+wire1)) == {wire2[(3'h5):(3'h5)],
          wire0})));
    end
  assign wire66 = ($unsigned(wire1[(1'h1):(1'h1)]) | $unsigned(wire61[(4'hd):(3'h4)]));
  assign wire67 = reg63;
  always
    @(posedge clk) begin
      reg68 <= wire1;
      if (wire1)
        begin
          reg69 <= reg63;
          reg70 <= (reg68[(2'h3):(1'h1)] ?
              (^~wire66[(4'hc):(1'h1)]) : $signed(reg63[(5'h13):(5'h12)]));
        end
      else
        begin
          reg69 <= (8'ha7);
          reg70 <= ($unsigned((((wire0 ^ wire2) || $signed(wire61)) != (~{reg65}))) ?
              $signed(reg63) : {reg64[(4'hb):(1'h1)],
                  (^~reg68[(2'h3):(2'h2)])});
          reg71 <= wire66[(5'h11):(1'h0)];
          reg72 <= $signed($unsigned((((wire0 & (8'ha1)) ^~ (|reg71)) ?
              reg63[(4'hf):(3'h6)] : {reg71})));
          reg73 <= $signed($signed($unsigned(wire0[(5'h15):(5'h13)])));
        end
      if ($signed((((8'hb4) ?
              ({wire0, (7'h41)} >= $unsigned(reg72)) : ({wire61} ?
                  $signed(wire61) : $unsigned((8'ha9)))) ?
          $signed(($signed(wire2) >>> $unsigned(reg72))) : reg63)))
        begin
          reg74 <= $signed($signed(($unsigned($unsigned((8'ha5))) + $unsigned((~|wire3)))));
          if ($signed($signed(wire3)))
            begin
              reg75 <= $signed((^~reg65[(2'h2):(2'h2)]));
              reg76 <= $unsigned($unsigned(($unsigned(wire61) | reg69)));
              reg77 <= $unsigned(($unsigned($signed((^~reg63))) * (((^wire66) || reg75) ?
                  $signed((7'h43)) : wire61[(5'h13):(3'h4)])));
            end
          else
            begin
              reg75 <= (reg64 ^ (^(+(reg63[(4'hd):(4'h9)] ?
                  {reg69, reg70} : {wire61}))));
              reg76 <= wire61[(5'h11):(5'h10)];
              reg77 <= ($signed($signed(((&reg64) + (reg73 ? wire3 : reg72)))) ?
                  reg70[(3'h5):(3'h4)] : $signed(reg71));
            end
        end
      else
        begin
          reg74 <= (wire2 <<< ($unsigned((~(&wire2))) >>> $unsigned(reg70)));
          if ($signed(wire1[(4'he):(3'h6)]))
            begin
              reg75 <= reg77[(3'h4):(2'h2)];
            end
          else
            begin
              reg75 <= ($signed((^$signed((reg70 > wire3)))) + $signed($unsigned((reg72 << (wire67 ?
                  wire0 : reg75)))));
              reg76 <= (~&(~($signed((wire61 ? (8'hbb) : wire66)) <= (wire0 ?
                  $signed(reg74) : reg72[(1'h1):(1'h0)]))));
              reg77 <= $unsigned(((~&((wire1 ? (7'h43) : (8'hbb)) ?
                      (+reg71) : (~|(8'haf)))) ?
                  $unsigned(((reg69 ? reg69 : wire66) ?
                      $signed(wire61) : (wire61 - wire1))) : (+(8'ha3))));
            end
        end
      reg78 <= {{$unsigned(reg77)}, (^~reg77)};
    end
  assign wire79 = {$signed(reg68[(1'h0):(1'h0)])};
  module80 #() modinst204 (wire203, clk, wire61, reg78, wire66, reg64, reg74);
  assign wire205 = (reg76[(4'hc):(4'hb)] ^ (~^$signed($unsigned((~|reg71)))));
  assign wire206 = ({$signed(reg73[(1'h1):(1'h0)])} ?
                       {reg73,
                           $unsigned($unsigned(reg65))} : {$unsigned(reg63[(1'h1):(1'h0)])});
  module144 #() modinst208 (.wire149(reg68), .wire145(reg70), .y(wire207), .clk(clk), .wire146(reg74), .wire148(reg71), .wire147(reg73));
  assign wire209 = reg68[(3'h6):(3'h4)];
endmodule

module module80
#(parameter param201 = (^(!(~&(((8'h9f) <<< (8'haa)) ? ((7'h41) ~^ (8'ha6)) : ((8'hbf) <<< (8'ha3)))))), 
parameter param202 = param201)
(y, clk, wire81, wire82, wire83, wire84, wire85);
  output wire [(32'h22f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire81;
  input wire signed [(4'h8):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire signed [(5'h11):(1'h0)] wire84;
  input wire [(5'h11):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire189;
  reg signed [(3'h5):(1'h0)] reg200 = (1'h0);
  reg [(4'hb):(1'h0)] reg199 = (1'h0);
  reg [(4'hb):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg195 = (1'h0);
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire86,
                 wire87,
                 wire88,
                 wire102,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire139,
                 wire141,
                 wire142,
                 wire143,
                 wire189,
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
                 reg114,
                 reg113,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire86 = $unsigned((wire81 ?
                      $signed($signed(wire82[(1'h0):(1'h0)])) : wire85[(4'hc):(3'h4)]));
  assign wire87 = {(~&(~|wire84))};
  assign wire88 = (({{(wire86 != wire87), (wire87 ^~ wire82)},
                          $unsigned(wire84[(2'h3):(2'h3)])} ?
                      $signed(($unsigned(wire81) ?
                          (|wire87) : ((8'hbd) ?
                              (8'ha0) : wire82))) : (8'had)) == $unsigned(wire84));
  always
    @(posedge clk) begin
      reg89 <= (wire84 ?
          {$signed(wire88),
              wire82[(3'h4):(2'h2)]} : $unsigned((wire85[(4'hb):(1'h1)] ?
              ({wire88} && $signed(wire84)) : ($signed(wire88) || (wire83 ?
                  wire86 : wire88)))));
      reg90 <= (^~reg89);
      if (wire87[(1'h1):(1'h1)])
        begin
          reg91 <= $unsigned(({(wire82[(1'h1):(1'h1)] >= (reg89 ?
                      reg89 : wire87)),
                  ($unsigned(reg89) ? $unsigned(wire83) : $unsigned((8'hab)))} ?
              wire81 : {(reg89 ^ $signed(wire82)),
                  ((wire83 == wire87) ?
                      wire88[(3'h6):(1'h0)] : {wire86, wire87})}));
        end
      else
        begin
          reg91 <= (8'hb2);
          reg92 <= $unsigned($signed(wire82));
          reg93 <= ((-(^$unsigned($unsigned(wire82)))) ?
              (reg91[(3'h7):(3'h4)] && (wire85[(4'hc):(3'h4)] ?
                  ((wire87 ?
                      (8'hb7) : wire86) ^ ((8'ha7) >= reg91)) : {{reg90}})) : ((($signed((7'h41)) != wire85[(2'h3):(1'h1)]) >> reg92[(1'h1):(1'h0)]) != wire83[(5'h13):(3'h6)]));
          reg94 <= reg89;
        end
      if ($unsigned({reg93[(1'h1):(1'h1)]}))
        begin
          reg95 <= wire87;
          reg96 <= $unsigned(wire85[(1'h0):(1'h0)]);
          reg97 <= reg96;
          if ((^~(reg91[(1'h1):(1'h1)] ?
              $unsigned({$signed((8'haa)),
                  $unsigned(reg92)}) : $unsigned(($unsigned((8'hb8)) ~^ (8'hb8))))))
            begin
              reg98 <= ((wire84 <<< ((-reg94) ?
                      ((wire85 ? wire88 : reg92) ?
                          ((8'hbc) >>> wire87) : (^reg92)) : (|$unsigned(reg93)))) ?
                  reg91[(3'h4):(1'h0)] : ($unsigned(({reg94, reg90} ~^ {reg93,
                          reg91})) ?
                      ((^(~reg92)) ?
                          reg96 : $signed(reg95[(2'h3):(1'h1)])) : reg96));
              reg99 <= $signed({$signed($signed((~reg97)))});
            end
          else
            begin
              reg98 <= $unsigned(((^(~|reg94)) && $unsigned(reg92)));
              reg99 <= reg92;
            end
          reg100 <= ((!reg98[(1'h0):(1'h0)]) ?
              {($unsigned((reg98 ?
                      reg94 : reg97)) < wire87[(1'h1):(1'h1)])} : $unsigned(($unsigned((wire82 ?
                      wire87 : wire85)) ?
                  (~$unsigned(wire86)) : $signed(((8'hbb) ? wire87 : reg92)))));
        end
      else
        begin
          reg95 <= ((wire83 >> wire87[(2'h2):(1'h0)]) ?
              reg96[(4'hf):(3'h7)] : ($signed(reg94) >= (((-(8'hbf)) & reg90[(4'h9):(1'h1)]) <<< (reg91 ?
                  $signed(reg91) : (&wire88)))));
        end
      reg101 <= $unsigned(((~reg99[(3'h4):(3'h4)]) || ($unsigned(reg97[(4'h9):(1'h1)]) ^~ reg98)));
    end
  assign wire102 = (~|$unsigned(reg96));
  always
    @(posedge clk) begin
      reg103 <= $signed((^~((^wire88[(2'h3):(2'h3)]) + ($unsigned(reg89) ?
          wire84 : $signed(reg99)))));
      if (wire83)
        begin
          if ((+reg95[(2'h3):(1'h0)]))
            begin
              reg104 <= (~&(reg91 ?
                  $unsigned(($unsigned(wire86) ?
                      wire102[(1'h0):(1'h0)] : (wire83 ?
                          (7'h42) : reg90))) : reg90));
              reg105 <= $unsigned((^(^~wire83)));
              reg106 <= (wire81 ?
                  ((|wire85[(4'h8):(3'h4)]) == ({(reg96 >> reg101)} ?
                      (|reg99[(3'h4):(2'h3)]) : $unsigned($signed(reg99)))) : ($unsigned({(reg99 || reg91),
                      (~&reg93)}) * {((reg105 >> reg96) == {reg91, reg100}),
                      (+wire81)}));
            end
          else
            begin
              reg104 <= (reg105 ^~ reg97[(3'h5):(3'h5)]);
            end
          reg107 <= $signed($signed(($signed($signed(reg99)) ?
              (~^reg90[(3'h7):(3'h5)]) : reg99[(4'he):(3'h6)])));
          reg108 <= (($unsigned({(8'h9f),
              (wire87 + reg89)}) ^~ $signed($unsigned(wire86[(5'h13):(5'h11)]))) <= $signed(wire85));
          reg109 <= (wire81[(2'h3):(1'h0)] ?
              {({(reg89 != reg105), (reg95 ? reg89 : wire85)} ?
                      wire86 : (^$signed(reg105))),
                  (wire102 ?
                      $signed(wire84) : $signed(reg108))} : ((((wire81 && (8'h9f)) ?
                      $signed((7'h44)) : (reg92 - reg98)) >>> (wire83 - ((8'hb6) >>> wire87))) ?
                  $signed(((~^reg94) ?
                      (^reg106) : (8'h9d))) : (~($signed(wire83) != (^~wire102)))));
          reg110 <= (8'hb0);
        end
      else
        begin
          reg104 <= $unsigned($unsigned((-reg94[(3'h5):(3'h4)])));
          reg105 <= $signed(reg94);
          reg106 <= $signed({(|($unsigned(wire87) & (reg101 ?
                  (8'hb4) : (8'h9d))))});
          reg107 <= reg107;
          if ((|{(~|wire86), $unsigned($signed({wire86}))}))
            begin
              reg108 <= $unsigned((^~((~(wire84 <<< reg106)) << (8'ha9))));
              reg109 <= $signed(reg100);
              reg110 <= $unsigned($signed($signed((~&reg106))));
            end
          else
            begin
              reg108 <= (^~$unsigned({reg97,
                  ((~&reg104) ? $unsigned(reg110) : (^wire84))}));
              reg109 <= (-((($unsigned(wire83) <= $signed(wire86)) || (^~(&wire102))) ?
                  reg92 : (({(7'h40), reg99} ?
                      $unsigned(reg101) : ((8'hb2) & reg105)) & (+$unsigned(reg97)))));
              reg110 <= {(reg104[(3'h6):(1'h0)] ?
                      (wire88[(2'h2):(1'h1)] && (wire83 ?
                          (~(8'h9c)) : reg106)) : {($unsigned(reg101) >>> reg99)})};
              reg111 <= ($signed($unsigned(reg109)) ?
                  (&($signed({(8'ha2), reg100}) ?
                      ((^(8'ha3)) ?
                          (&(8'ha7)) : (~reg96)) : wire81[(3'h4):(2'h2)])) : (reg99[(1'h1):(1'h1)] & (|$unsigned($signed(wire88)))));
              reg112 <= (reg111 ? reg107 : (8'h9f));
            end
        end
      reg113 <= (reg100[(4'h8):(3'h7)] ? reg111 : $signed((~&$signed(wire83))));
      reg114 <= (^reg91[(4'hb):(3'h7)]);
    end
  assign wire115 = $signed($signed((~&reg100[(1'h1):(1'h0)])));
  assign wire116 = reg93[(5'h12):(1'h0)];
  assign wire117 = ((8'hac) ^~ {$signed($unsigned(reg114))});
  assign wire118 = (+($signed(({reg96} + (reg113 - (8'ha1)))) + wire83));
  assign wire119 = (~|(8'hb7));
  module120 #() modinst140 (wire139, clk, wire116, reg94, reg107, wire85);
  assign wire141 = $unsigned(((reg108 ?
                           $unsigned(reg107[(4'he):(2'h2)]) : wire115[(5'h12):(4'ha)]) ?
                       wire119 : (((~^(7'h42)) ?
                           (reg114 >>> reg103) : (wire87 > (8'haa))) >= (!{reg107}))));
  assign wire142 = ((+$signed($signed($signed(wire83)))) ?
                       $signed((~|wire141)) : (|(^(8'hb5))));
  assign wire143 = $unsigned($signed($signed(reg109[(4'he):(3'h5)])));
  module144 #() modinst190 (wire189, clk, wire115, wire81, reg98, reg89, wire142);
  always
    @(posedge clk) begin
      reg191 <= (^~(wire118[(1'h0):(1'h0)] ?
          reg113[(3'h5):(2'h2)] : ($unsigned(((8'h9d) - reg104)) && ((wire82 > reg113) ?
              (wire139 ? reg106 : (8'ha1)) : (wire82 * wire143)))));
      reg192 <= $unsigned(($unsigned($unsigned((reg95 ? reg89 : reg111))) ?
          reg101 : $signed(reg111[(3'h6):(1'h0)])));
      reg193 <= $unsigned(($signed((((8'hbf) ^~ wire118) ?
              $unsigned(reg94) : $signed(wire87))) ?
          ($signed(wire102[(3'h4):(1'h1)]) <<< wire83) : $unsigned(reg91)));
      if ($signed({reg103, reg103[(2'h2):(1'h0)]}))
        begin
          if (reg92)
            begin
              reg194 <= wire85[(4'hc):(3'h7)];
              reg195 <= ((-((!(wire84 ?
                  reg93 : wire116)) ~^ {$signed(reg192)})) <= ($unsigned($signed($unsigned(wire83))) < $unsigned((reg101[(1'h1):(1'h1)] ?
                  $signed(reg98) : (wire116 + wire143)))));
              reg196 <= $signed(reg103);
              reg197 <= wire115[(3'h7):(2'h3)];
              reg198 <= $unsigned(wire189[(1'h0):(1'h0)]);
            end
          else
            begin
              reg194 <= ((~|$signed(($signed((7'h41)) > ((8'hae) ?
                  (8'hae) : (8'hbb))))) ~^ $signed($signed((~^(~&reg113)))));
              reg195 <= wire189;
              reg196 <= wire88[(4'h9):(3'h6)];
            end
          if ($signed((~&$unsigned(reg192[(4'h8):(1'h0)]))))
            begin
              reg199 <= $unsigned(((~($unsigned(reg105) ?
                  $signed(wire88) : $unsigned(reg111))) < ($signed($signed((8'hbd))) & $unsigned((8'hb6)))));
            end
          else
            begin
              reg199 <= (~&reg97[(4'h8):(4'h8)]);
            end
        end
      else
        begin
          reg194 <= $signed(reg103[(2'h3):(2'h3)]);
        end
      reg200 <= wire86;
    end
endmodule

module module4
#(parameter param60 = (((^~((~^(8'had)) ? (~^(7'h40)) : ((8'ha2) ? (7'h44) : (8'hb4)))) == (~&((~|(8'ha7)) >= ((7'h44) - (8'hae))))) ? (~^(+((~^(8'had)) < ((8'ha6) ? (8'ha3) : (8'hbc))))) : (({((8'hb1) <= (8'hb3))} ? (((8'hbe) ? (7'h42) : (7'h42)) || ((7'h43) ? (8'hb5) : (8'h9c))) : ({(8'hb3), (7'h41)} ? (~&(8'ha8)) : ((8'ha4) ? (8'h9c) : (8'hbb)))) + ({((8'hae) <<< (8'hb5))} ? (~^{(8'hba)}) : (^((8'hbf) ? (8'h9f) : (8'h9c)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire5;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire58;
  assign y = {wire10, wire11, wire12, wire13, wire58, (1'h0)};
  assign wire10 = ((wire9[(4'h8):(1'h1)] >= (~^(~&wire5))) << $signed(wire5));
  assign wire11 = {wire6[(3'h7):(1'h1)],
                      ((wire5[(3'h7):(3'h7)] ?
                              $unsigned({wire7}) : ($signed(wire7) - wire5)) ?
                          wire9[(2'h3):(1'h0)] : wire7[(4'ha):(3'h6)])};
  assign wire12 = (wire10 <= ($unsigned(wire8) > (((wire5 | wire9) ?
                      (wire6 ?
                          wire11 : wire7) : (wire7 << wire7)) && (^(wire11 << wire11)))));
  assign wire13 = ({({$signed(wire8)} ? (~&(!wire7)) : (8'ha8))} ?
                      $unsigned(wire12[(2'h2):(1'h0)]) : wire6);
  module14 #() modinst59 (wire58, clk, wire9, wire13, wire5, wire6, wire12);
endmodule

module module14
#(parameter param56 = ((((-((7'h40) ^~ (8'ha5))) ? ((!(8'hac)) ? ((8'hb5) ? (8'ha3) : (7'h42)) : ((8'hbf) > (8'hbd))) : ((~|(8'ha5)) - (!(8'ha8)))) ? {(((8'hb8) ? (8'hb5) : (8'h9c)) == {(8'hab)})} : (-(&(~|(8'h9c))))) ? ({(~((8'hb3) ? (8'hac) : (8'hba)))} ? ((((8'hbc) >> (8'ha6)) ? ((8'ha5) ^ (8'ha6)) : (&(8'hb4))) ? {{(8'hb1), (7'h44)}, ((8'hbe) ? (8'hb3) : (8'had))} : {(|(8'hac))}) : (~^(^~(-(8'hab))))) : ((8'haa) >>> {(&(~&(8'ha8))), {((8'hae) ? (8'hbb) : (8'hae))}})), 
parameter param57 = (8'h9d))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg41,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $unsigned(((($unsigned(wire16) ?
          $unsigned(wire19) : (wire15 ^ wire19)) ^~ $unsigned({wire19,
          wire15})) >>> (wire15 ^ wire17[(4'h9):(3'h7)])));
      if ((-wire18))
        begin
          reg21 <= reg20[(5'h12):(4'hf)];
          if ((~$signed((reg20[(4'h8):(1'h0)] <<< ($signed(wire15) ?
              $unsigned((8'ha3)) : (reg20 ? reg20 : wire17))))))
            begin
              reg22 <= $unsigned(($unsigned({wire15[(2'h2):(2'h2)]}) ?
                  wire19[(1'h1):(1'h1)] : wire16));
            end
          else
            begin
              reg22 <= $signed((({{reg22, wire19},
                      $unsigned(reg22)} ~^ wire17) ?
                  ({$unsigned(reg20),
                      $signed((8'ha6))} != reg22[(3'h7):(1'h0)]) : wire17[(2'h3):(2'h2)]));
            end
          reg23 <= (~|$unsigned(wire15));
          reg24 <= wire19;
          reg25 <= ($signed(((wire18[(3'h4):(1'h0)] | ((8'ha7) ?
                      (8'hb8) : reg24)) ?
                  wire18 : ((wire15 & wire18) ?
                      $unsigned(wire16) : (wire15 ? reg24 : wire15)))) ?
              (reg20[(5'h13):(4'ha)] ?
                  wire16[(3'h7):(3'h7)] : $unsigned($unsigned($signed(wire18)))) : reg20);
        end
      else
        begin
          reg21 <= reg22;
          reg22 <= (8'hb1);
          if ((reg21[(4'h9):(3'h4)] ?
              {(&$unsigned((reg24 >>> (7'h42)))),
                  reg25[(3'h7):(1'h0)]} : (8'hbe)))
            begin
              reg23 <= $unsigned({wire18[(3'h5):(1'h1)],
                  {((~&wire19) >>> wire15), $unsigned({wire16, reg20})}});
              reg24 <= {$unsigned((reg24 ~^ $unsigned($unsigned(wire17)))),
                  (&$signed($unsigned(reg22)))};
              reg25 <= ($unsigned(($unsigned(((8'h9d) ? reg24 : reg24)) ?
                      reg20[(3'h7):(2'h3)] : $unsigned($unsigned(wire17)))) ?
                  (~^$unsigned(wire18)) : $signed((-(wire16[(5'h15):(3'h4)] ?
                      $unsigned(reg22) : $signed(wire15)))));
              reg26 <= reg21[(3'h4):(2'h2)];
            end
          else
            begin
              reg23 <= $unsigned((reg20[(3'h4):(2'h3)] ?
                  wire16 : {wire15, ({wire15, (8'hab)} - $signed(reg21))}));
              reg24 <= $unsigned((~|$unsigned(wire19[(2'h2):(1'h1)])));
              reg25 <= ($signed($signed(((wire18 | wire18) ?
                      $signed((8'hac)) : wire19))) ?
                  (~^(&(~{wire15}))) : $unsigned(((~^(+reg26)) <<< $signed($unsigned((8'ha6))))));
            end
          reg27 <= $unsigned((~^wire15));
        end
    end
  assign wire28 = $signed($signed($unsigned($signed($unsigned(reg22)))));
  assign wire29 = (reg25 ?
                      $signed($unsigned(($unsigned(reg20) | {(8'ha3),
                          wire16}))) : reg27[(3'h6):(3'h6)]);
  assign wire30 = $signed((!(wire19[(1'h0):(1'h0)] << reg21)));
  assign wire31 = (reg22 ? reg22[(1'h0):(1'h0)] : $unsigned((8'hb6)));
  always
    @(posedge clk) begin
      reg32 <= ($signed((((8'ha7) ?
              wire29 : ((8'h9f) && wire30)) != reg21[(4'h9):(3'h7)])) ?
          $signed(wire31[(3'h6):(3'h4)]) : $signed((8'had)));
      reg33 <= $unsigned(($unsigned(((reg21 ?
          reg21 : wire18) - $signed(wire31))) << ((~|(wire30 ?
              wire15 : reg21)) ?
          (~$unsigned(wire31)) : ((~&(8'hb1)) >= (wire19 + reg20)))));
      reg34 <= ((8'ha3) == (~&$signed($signed(reg27))));
      reg35 <= ((!(~wire18)) - (~^reg33[(4'h9):(3'h7)]));
    end
  assign wire36 = reg20;
  assign wire37 = ($unsigned($signed($unsigned(reg33[(4'hd):(4'hb)]))) != $signed(wire30));
  assign wire38 = wire17[(3'h6):(1'h1)];
  assign wire39 = ((~|(~|(~|$unsigned(wire30)))) ?
                      (~(wire28 ?
                          $unsigned($unsigned(wire29)) : (-(reg33 << reg27)))) : reg27[(1'h0):(1'h0)]);
  assign wire40 = $unsigned(wire38[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg41 <= $unsigned((($signed($unsigned(wire37)) >= wire30[(5'h12):(5'h12)]) | $unsigned(reg32[(3'h6):(3'h5)])));
    end
  assign wire42 = {$unsigned($unsigned($unsigned(((8'hab) || wire36))))};
  assign wire43 = $signed(((~&((wire38 ? reg23 : wire39) ?
                      ((7'h43) || reg26) : $unsigned(reg26))) & (^~((wire17 ?
                          reg34 : wire40) ?
                      (wire16 ? wire16 : reg32) : $unsigned(wire30)))));
  assign wire44 = (-$unsigned(($unsigned((~wire18)) < reg25)));
  always
    @(posedge clk) begin
      reg45 <= wire29[(4'ha):(4'ha)];
      if ((8'hba))
        begin
          reg46 <= (!reg35);
        end
      else
        begin
          reg46 <= $unsigned((-{(^~((8'h9d) ? reg20 : wire17)),
              (~|wire16[(2'h2):(2'h2)])}));
          reg47 <= wire30;
          reg48 <= (({reg21, ($unsigned(reg32) >> (wire44 ? wire40 : reg46))} ?
                  reg32[(4'hd):(2'h2)] : reg41) ?
              $unsigned($unsigned({reg41[(4'hd):(3'h6)]})) : (&(8'hb0)));
          reg49 <= reg26[(2'h2):(1'h0)];
          reg50 <= ({(&(~(reg23 ^~ (8'haa)))),
              ((~^reg47[(2'h2):(1'h1)]) ?
                  reg25[(2'h3):(1'h1)] : (^(wire36 ?
                      reg21 : wire42)))} | (reg49[(4'ha):(4'ha)] ?
              reg33[(3'h4):(2'h3)] : $signed((~^reg48[(1'h0):(1'h0)]))));
        end
      reg51 <= $signed((^~$unsigned((wire37[(4'h9):(2'h2)] ?
          reg27[(1'h1):(1'h1)] : (~(8'ha9))))));
    end
  assign wire52 = reg49[(1'h0):(1'h0)];
  assign wire53 = ((+reg35[(3'h5):(2'h3)]) ?
                      (~($signed($unsigned(reg23)) ?
                          {(!(8'hae)),
                              (wire39 ?
                                  (8'had) : wire38)} : {$unsigned(wire15)})) : (-{reg32}));
  assign wire54 = reg45;
  assign wire55 = reg26[(4'ha):(4'h9)];
endmodule

module module144  (y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire149;
  input wire [(5'h10):(1'h0)] wire148;
  input wire signed [(3'h7):(1'h0)] wire147;
  input wire [(4'hf):(1'h0)] wire146;
  input wire [(5'h14):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire187;
  wire signed [(2'h2):(1'h0)] wire186;
  wire [(4'hc):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire184;
  wire [(2'h2):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire178;
  wire [(5'h14):(1'h0)] wire177;
  wire signed [(3'h6):(1'h0)] wire176;
  wire signed [(4'ha):(1'h0)] wire175;
  wire [(4'hb):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire signed [(4'h9):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  wire signed [(5'h14):(1'h0)] wire150;
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire150,
                 reg182,
                 reg181,
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
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire150 = ($unsigned(wire147[(3'h5):(3'h5)]) >= $signed(($signed((~(8'hb7))) ?
                       (8'h9e) : $unsigned($signed(wire145)))));
  always
    @(posedge clk) begin
      reg151 <= (((({wire146, wire150} & wire150[(2'h2):(2'h2)]) ?
          {wire148[(5'h10):(4'h8)]} : (8'hba)) && {$signed((wire148 ?
              wire149 : wire148)),
          (((8'had) ? wire147 : wire149) ?
              $unsigned(wire145) : (8'h9d))}) != ($signed((+wire150[(3'h7):(3'h4)])) >> wire147[(2'h2):(1'h1)]));
      if (($signed((wire150[(3'h6):(1'h1)] != {$unsigned((8'h9f))})) ?
          wire147 : (wire149[(4'hc):(2'h3)] != $unsigned($unsigned((!wire147))))))
        begin
          reg152 <= (^$unsigned($signed((!(^reg151)))));
        end
      else
        begin
          reg152 <= (wire146 ?
              {((wire150 ? ((7'h40) >>> wire149) : reg152) ?
                      {(-wire146)} : reg152[(4'he):(4'h9)]),
                  (($unsigned(wire145) ?
                      (wire147 >= wire147) : wire149) >>> $unsigned(wire150[(2'h3):(2'h3)]))} : $unsigned(($unsigned((wire147 ?
                      wire148 : wire145)) ?
                  (wire147[(1'h1):(1'h0)] << {reg152, wire146}) : (~((7'h44) ?
                      reg151 : reg152)))));
          reg153 <= ($unsigned((wire147 ?
                  $signed((wire148 ?
                      (8'hb1) : wire148)) : (+$unsigned(reg152)))) ?
              ($unsigned($signed(wire146[(4'hf):(4'hf)])) ?
                  $signed(reg152) : ((-reg151[(3'h6):(3'h5)]) <= $signed(((8'haa) >> wire145)))) : (($unsigned($signed(wire148)) >>> wire148) ?
                  $signed($signed(wire147)) : (wire150[(1'h1):(1'h0)] ?
                      {{wire146}} : (!{wire149}))));
          reg154 <= $signed((+($unsigned($signed(wire146)) ?
              (-(~|wire147)) : reg153[(5'h10):(4'he)])));
        end
      reg155 <= $unsigned(((wire145[(4'he):(4'he)] ?
          reg154 : wire148) << (+wire146[(4'hb):(3'h4)])));
      reg156 <= ($unsigned(wire149) >>> reg154);
      reg157 <= wire147[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (wire145[(4'hf):(3'h4)])
        begin
          reg158 <= {wire148, (reg152[(4'hb):(4'h8)] - $signed((8'ha0)))};
          reg159 <= ((((!$unsigned(wire148)) <<< wire146) >> (8'ha8)) ^ reg155[(3'h4):(2'h3)]);
          reg160 <= $signed((reg159 ?
              $signed((wire150[(5'h12):(1'h0)] >> (~^wire149))) : reg157));
          reg161 <= ($signed(reg157[(3'h4):(1'h1)]) ?
              (8'hbe) : wire149[(5'h11):(4'h9)]);
        end
      else
        begin
          if (($unsigned((reg159[(4'ha):(4'ha)] || reg158)) ^~ ($signed(wire149[(4'ha):(3'h7)]) < {((reg153 ?
                  (7'h42) : wire147) || reg156),
              {((8'hb3) ? (8'h9d) : reg156)}})))
            begin
              reg158 <= (+$signed((^~$unsigned($signed(wire147)))));
              reg159 <= wire147[(3'h7):(2'h3)];
              reg160 <= ($signed(($signed({wire147}) && (~^$signed((8'hba))))) & reg155[(3'h5):(2'h2)]);
              reg161 <= ($unsigned({(^wire146[(3'h5):(3'h5)])}) ?
                  reg158[(1'h0):(1'h0)] : (!(($unsigned((8'h9e)) && $unsigned(wire149)) ?
                      $signed((reg158 ?
                          reg152 : wire146)) : (~|$unsigned(reg151)))));
            end
          else
            begin
              reg158 <= (8'hb7);
              reg159 <= reg151;
              reg160 <= ((reg160 != $signed($signed((reg159 == (7'h44))))) >>> reg156);
            end
          if ((((8'ha7) + wire146[(4'h8):(3'h7)]) <= reg161))
            begin
              reg162 <= wire148;
              reg163 <= {$signed(wire146[(3'h4):(1'h0)])};
              reg164 <= $signed($unsigned(reg163[(2'h2):(1'h1)]));
            end
          else
            begin
              reg162 <= (reg161[(2'h3):(1'h1)] ?
                  ((~&{reg163[(4'ha):(4'ha)],
                      (reg156 << wire147)}) << $signed(reg155[(3'h4):(2'h3)])) : reg161[(4'h8):(3'h5)]);
              reg163 <= wire150[(5'h11):(4'hc)];
              reg164 <= reg158[(1'h1):(1'h0)];
              reg165 <= $signed(({wire146[(4'hf):(4'he)]} & {($unsigned(reg163) - wire149),
                  {(-reg155)}}));
              reg166 <= (7'h44);
            end
          if (($unsigned((&reg165[(2'h2):(2'h2)])) == (+((8'h9f) ~^ ((wire146 <<< reg160) ?
              (~&wire147) : reg161)))))
            begin
              reg167 <= $unsigned(reg159);
            end
          else
            begin
              reg167 <= $signed(reg161);
              reg168 <= $unsigned(((8'hb2) ?
                  reg167[(1'h0):(1'h0)] : ($signed((^reg155)) ?
                      wire147[(1'h1):(1'h0)] : ($unsigned(reg156) ?
                          (reg164 >>> reg153) : $unsigned(reg161)))));
              reg169 <= {$unsigned(wire146[(4'hb):(3'h7)])};
            end
        end
      reg170 <= ((~&reg168[(1'h1):(1'h0)]) ?
          $unsigned((-($unsigned(reg157) > ((8'ha1) ^ wire147)))) : {{((^reg155) ?
                      {wire147} : (reg165 || wire150))}});
    end
  assign wire171 = wire148;
  assign wire172 = (+reg159[(4'h9):(4'h9)]);
  assign wire173 = $signed((~^$signed({(8'ha8), {wire172, (8'hae)}})));
  assign wire174 = reg167;
  assign wire175 = ((~&{((reg168 != reg160) < reg159)}) ?
                       ((|(reg151 | $unsigned(wire145))) ?
                           $unsigned({reg158,
                               {(8'haa)}}) : wire146) : (-(wire148[(2'h2):(2'h2)] ?
                           ((reg169 ?
                               reg167 : (8'hb6)) && (reg153 != reg168)) : (wire149[(4'ha):(2'h2)] & (reg152 ?
                               reg159 : reg151)))));
  assign wire176 = wire148[(4'h9):(3'h4)];
  assign wire177 = reg167[(3'h6):(2'h2)];
  assign wire178 = $signed({$signed($unsigned((reg163 & reg156)))});
  assign wire179 = (8'had);
  assign wire180 = $unsigned(wire150[(5'h13):(4'h9)]);
  always
    @(posedge clk) begin
      reg181 <= $signed(wire174);
      reg182 <= (reg153[(3'h5):(2'h3)] ? (8'h9d) : reg155[(1'h1):(1'h0)]);
    end
  assign wire183 = (-wire148);
  assign wire184 = (+($signed(($unsigned(reg154) ?
                           wire173 : ((8'hbb) ? reg166 : reg158))) ?
                       (~{(~wire171),
                           reg156[(1'h1):(1'h0)]}) : ($unsigned((!reg153)) >>> ((wire174 != reg162) ?
                           {reg182} : $unsigned(wire147)))));
  assign wire185 = (($signed(((reg155 <<< reg151) < (~&wire173))) >>> $signed($signed((8'hbd)))) - wire147);
  assign wire186 = (^~wire185[(4'hc):(3'h5)]);
  assign wire187 = $signed($unsigned($unsigned(wire150[(4'he):(1'h0)])));
  assign wire188 = (reg154 * (8'ha0));
endmodule

module module120
#(parameter param138 = ((!(+((!(8'hbf)) - (-(8'hb7))))) ? ({{((8'ha9) ? (8'hb1) : (8'hac)), (~^(8'hbb))}, (((8'h9e) ? (8'hb3) : (7'h40)) ~^ {(8'hb9)})} == {(((8'hbc) ? (8'h9d) : (8'ha5)) ~^ (^(8'hac))), (((8'ha4) ? (8'hbf) : (8'hbd)) ? ((8'ha5) ? (8'hac) : (7'h40)) : (^~(8'ha7)))}) : (((((7'h41) | (8'h9e)) >>> ((8'ha5) <<< (8'haa))) ? ({(8'hbf), (8'hbe)} + (~&(8'hbc))) : (~&{(8'ha7)})) == (~^(((8'had) * (8'hbc)) ? {(8'hb0), (8'hbd)} : ((8'hbc) * (7'h41)))))))
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire124;
  input wire [(4'hc):(1'h0)] wire123;
  input wire [(5'h10):(1'h0)] wire122;
  input wire [(5'h11):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg131,
                 (1'h0)};
  assign wire125 = (wire123 > wire123);
  assign wire126 = $signed(wire125);
  assign wire127 = ((((wire125 ? {wire126, wire122} : (wire124 | wire124)) ?
                           (^$unsigned(wire124)) : ($signed(wire125) ?
                               (+wire121) : $signed(wire123))) || $unsigned(((wire126 ?
                               wire123 : (8'hbd)) ?
                           (8'hb3) : wire124))) ?
                       $signed($signed($signed(wire121))) : wire125);
  assign wire128 = wire122[(3'h7):(1'h1)];
  assign wire129 = wire125;
  assign wire130 = wire128;
  always
    @(posedge clk) begin
      reg131 <= (((~|((~(8'ha7)) & wire129[(2'h3):(1'h0)])) << wire122[(2'h3):(1'h1)]) ?
          $unsigned((8'hbe)) : {(wire121[(4'h9):(4'h9)] ?
                  ($signed(wire129) ^~ wire123[(4'h8):(3'h5)]) : ((wire124 ?
                      wire124 : wire128) + (^~(8'ha6)))),
              $unsigned({(|wire125)})});
    end
  assign wire132 = $signed(($signed((~|wire128)) | (((+reg131) >> wire130) ?
                       ((wire122 ? wire122 : wire122) ?
                           $unsigned((7'h40)) : $unsigned(wire122)) : wire121)));
  assign wire133 = wire125[(2'h2):(1'h1)];
  assign wire134 = ((($signed(wire128) ?
                       (wire129 ?
                           {wire132} : $unsigned(wire126)) : (&wire124)) >> wire121) >> $unsigned(wire121[(3'h4):(2'h2)]));
  assign wire135 = wire132[(2'h3):(2'h3)];
  assign wire136 = wire135;
  assign wire137 = $signed($signed(wire121[(1'h1):(1'h1)]));
endmodule
