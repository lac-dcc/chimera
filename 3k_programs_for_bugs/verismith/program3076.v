module top
#(parameter param271 = {({{((8'hb7) >= (8'ha7))}} ? (^~(((8'hb2) ? (8'ha0) : (7'h42)) ? ((8'ha6) ? (8'hbf) : (8'hbd)) : {(8'hbe)})) : {{(&(8'h9c)), (|(8'hb1))}, (((8'h9f) && (8'ha3)) || ((8'hac) <= (8'hbd)))})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire270;
  wire [(3'h7):(1'h0)] wire268;
  wire [(4'h9):(1'h0)] wire267;
  wire [(4'hc):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire265;
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  assign y = {wire270,
                 wire268,
                 wire267,
                 wire21,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire79,
                 wire81,
                 wire82,
                 wire83,
                 wire104,
                 wire265,
                 reg103,
                 reg102,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  module4 #() modinst22 (wire21, clk, wire1, wire0, wire2, wire3);
  assign wire23 = $signed((^~$signed(wire2[(3'h7):(1'h1)])));
  assign wire24 = wire3;
  assign wire25 = (|$unsigned(($signed((wire24 ? wire24 : wire3)) | wire23)));
  assign wire26 = $unsigned(wire21);
  module27 #() modinst80 (wire79, clk, wire21, wire25, wire1, wire24);
  assign wire81 = $signed(wire1);
  assign wire82 = $unsigned(wire0[(3'h4):(2'h2)]);
  assign wire83 = $signed($unsigned($signed(($unsigned((8'ha0)) * (wire2 ?
                      wire23 : wire1)))));
  always
    @(posedge clk) begin
      reg84 <= wire23;
      reg85 <= $unsigned($unsigned((((~&wire21) & (+wire3)) ?
          ($unsigned((8'ha2)) ? (-wire24) : (wire2 + wire25)) : (wire0 ?
              wire21 : (wire25 != (8'h9c))))));
      if (((~&($unsigned((-wire3)) ? (~|(wire26 || wire79)) : wire23)) ?
          wire2[(3'h7):(3'h4)] : (-$signed(reg85))))
        begin
          if ((reg85[(3'h4):(2'h3)] ?
              ($signed((8'had)) * (wire0 ?
                  $signed(wire24) : ((wire3 ?
                      wire83 : wire2) | {reg84}))) : $unsigned($signed(wire25))))
            begin
              reg86 <= {$unsigned(wire24),
                  (({$signed(wire1),
                      wire23} && reg84) != (+$unsigned($unsigned(wire3))))};
              reg87 <= wire25;
              reg88 <= (-wire21);
              reg89 <= $unsigned(((|$signed($signed(wire3))) <<< (((wire2 ?
                  wire24 : wire25) <= ((8'had) || wire25)) > (wire1[(5'h15):(4'he)] ?
                  reg87 : (wire3 + wire82)))));
              reg90 <= ({reg87[(2'h3):(2'h2)]} ?
                  ({(wire26 ^ (reg89 ? reg89 : wire81))} ?
                      $unsigned(reg84[(3'h6):(1'h0)]) : wire81) : reg89);
            end
          else
            begin
              reg86 <= {({(8'h9e), $signed(reg90)} ?
                      ($signed($signed(wire79)) ?
                          {$unsigned(wire23),
                              $signed(reg87)} : ({(8'hb7)} * $signed(wire26))) : $unsigned($unsigned($unsigned(reg88)))),
                  ((8'ha5) ?
                      $signed($signed((wire83 ? wire3 : wire81))) : wire2)};
              reg87 <= (!$unsigned((((~wire0) < (wire82 ? reg85 : (8'hb6))) ?
                  (wire23[(5'h13):(2'h3)] <<< (~reg90)) : {$signed(reg85),
                      (wire81 ^~ reg86)})));
            end
          reg91 <= $unsigned((wire21 >>> ($signed((-wire2)) ?
              wire21 : (!(~&wire24)))));
          reg92 <= $signed(reg87);
        end
      else
        begin
          if (($unsigned((~&reg86)) ?
              reg88[(5'h12):(5'h12)] : (((((8'hac) ? reg92 : wire25) ?
                      (~&reg88) : (wire79 << wire83)) * $unsigned((wire25 ?
                      reg92 : wire79))) ?
                  wire0[(4'hd):(2'h3)] : (~^($unsigned(reg89) ?
                      {wire26, wire21} : wire81[(1'h0):(1'h0)])))))
            begin
              reg86 <= reg89;
              reg87 <= ((&{{reg90[(4'hc):(1'h0)]},
                      {$unsigned(wire21), {reg86}}}) ?
                  (^~({(wire82 ?
                          wire82 : wire21)} && $signed((wire25 != wire26)))) : (wire1 & ($signed(reg91[(4'ha):(4'h9)]) ?
                      {$signed((8'hb7))} : ((wire2 ?
                          (8'ha1) : wire1) || wire24))));
              reg88 <= ((&$unsigned((^$unsigned((8'ha8))))) >= {wire3,
                  (8'hb2)});
              reg89 <= ((wire82[(1'h0):(1'h0)] < $signed(($unsigned(wire21) & ((8'hbc) ?
                      (8'hb2) : reg85)))) ?
                  $unsigned({reg84[(2'h2):(2'h2)],
                      ((!wire82) >>> wire21)}) : ({(reg85[(1'h0):(1'h0)] ?
                          $signed(wire23) : ((8'hb4) <= wire0)),
                      $unsigned(((8'hb3) || wire0))} <= (reg90[(3'h7):(3'h6)] <= {{wire3},
                      (wire82 & (7'h44))})));
            end
          else
            begin
              reg86 <= (^~{(($unsigned(reg84) ? reg90 : reg91[(4'hf):(2'h2)]) ?
                      wire25 : (-{reg87})),
                  (wire79 ? reg91[(4'hc):(3'h6)] : $unsigned((&(8'hb3))))});
            end
          reg90 <= $signed((wire81 ?
              $unsigned(wire82[(2'h3):(1'h1)]) : (~|{$unsigned(wire21)})));
          reg91 <= ($signed((wire25[(5'h15):(5'h15)] ^~ $unsigned(reg91[(2'h3):(1'h0)]))) == $signed($signed({(~reg86),
              $signed(wire23)})));
          reg92 <= $signed({$unsigned($unsigned((!reg92)))});
        end
      if ((((|$signed((reg88 >> (8'ha0)))) ?
              reg88 : $unsigned((~^{wire25, (8'hb6)}))) ?
          (wire0[(4'hd):(4'h9)] == reg91[(2'h2):(2'h2)]) : ($signed((wire21 ?
                  $unsigned(wire25) : $unsigned((8'hb5)))) ?
              wire3[(2'h3):(1'h0)] : (($signed(wire26) ^ (wire25 ?
                      wire2 : wire24)) ?
                  {(-reg84), (|wire25)} : reg85))))
        begin
          reg93 <= (~&($signed((~&(&reg91))) >= (~|wire82[(1'h1):(1'h1)])));
          reg94 <= ($unsigned($signed($signed({(8'ha4),
              wire23}))) ^ ((8'ha2) && wire83));
          if ((|((~((wire3 >= wire82) ^~ (~&wire24))) ^ $signed($unsigned(wire1[(5'h13):(3'h6)])))))
            begin
              reg95 <= (~&wire0[(4'h8):(3'h6)]);
              reg96 <= {(reg89 ?
                      $signed($unsigned((wire81 ?
                          wire2 : (8'hb8)))) : $signed($unsigned(reg85))),
                  $unsigned($unsigned((^~$unsigned(wire83))))};
              reg97 <= (^$unsigned(($unsigned($signed(wire82)) > reg84)));
            end
          else
            begin
              reg95 <= {reg89[(4'h8):(3'h4)]};
              reg96 <= reg96[(1'h1):(1'h1)];
              reg97 <= $signed((|((!((8'hb7) ? wire24 : reg96)) ?
                  $signed($unsigned((8'had))) : $unsigned((wire2 - reg97)))));
            end
          if ((~{reg87[(3'h5):(3'h4)], {{((8'hbb) || reg91), (~&reg94)}}}))
            begin
              reg98 <= (^~(reg85 ? (8'ha6) : $signed($unsigned(wire1))));
              reg99 <= ($unsigned((~|wire1)) >= $signed(((~^$unsigned((7'h43))) ?
                  ((reg85 & wire0) ?
                      wire1[(4'hd):(1'h0)] : wire3[(4'he):(4'hd)]) : wire3[(4'ha):(3'h7)])));
              reg100 <= wire23;
              reg101 <= $unsigned(reg100);
              reg102 <= $signed(((reg94[(2'h3):(1'h0)] < reg87[(3'h6):(1'h0)]) ^ reg93[(5'h11):(1'h0)]));
            end
          else
            begin
              reg98 <= reg99[(1'h0):(1'h0)];
              reg99 <= reg98;
              reg100 <= $unsigned(((+wire25) ?
                  wire81[(1'h0):(1'h0)] : $signed(($unsigned(reg99) && $unsigned((8'ha6))))));
            end
        end
      else
        begin
          reg93 <= ((reg90 << $unsigned($signed(wire79[(3'h6):(3'h5)]))) ?
              (~^$signed(reg87)) : (reg90[(3'h4):(2'h3)] ?
                  reg98 : (-{$unsigned((8'hb1))})));
        end
      reg103 <= $unsigned(reg88[(5'h15):(4'ha)]);
    end
  assign wire104 = $signed(($signed({$unsigned(reg94),
                       wire79}) >> ((&$unsigned(reg97)) ?
                       ((wire26 ? wire21 : reg95) <<< (wire82 ?
                           (8'ha7) : wire79)) : $signed($unsigned(reg102)))));
  module105 #() modinst266 (.wire110(reg97), .wire109(wire81), .y(wire265), .wire108(wire79), .wire107(reg100), .clk(clk), .wire106(wire82));
  assign wire267 = ($unsigned($signed(($signed(reg88) << $signed(wire26)))) ^ wire81);
  module61 #() modinst269 (.clk(clk), .wire65(reg88), .wire62(wire81), .y(wire268), .wire63(reg87), .wire64(wire25));
  assign wire270 = reg92[(1'h0):(1'h0)];
endmodule

module module105  (y, clk, wire106, wire107, wire108, wire109, wire110);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire106;
  input wire [(4'hf):(1'h0)] wire107;
  input wire signed [(5'h11):(1'h0)] wire108;
  input wire signed [(4'hf):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire264;
  wire signed [(5'h11):(1'h0)] wire263;
  wire signed [(4'hb):(1'h0)] wire262;
  wire signed [(3'h7):(1'h0)] wire221;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire223;
  wire signed [(3'h6):(1'h0)] wire224;
  wire signed [(4'h8):(1'h0)] wire225;
  wire signed [(3'h4):(1'h0)] wire239;
  wire signed [(2'h2):(1'h0)] wire240;
  wire [(4'h8):(1'h0)] wire260;
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg [(4'h9):(1'h0)] reg228 = (1'h0);
  reg [(3'h7):(1'h0)] reg229 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg230 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg231 = (1'h0);
  reg [(5'h12):(1'h0)] reg232 = (1'h0);
  reg [(4'hb):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg234 = (1'h0);
  reg [(5'h14):(1'h0)] reg235 = (1'h0);
  reg [(5'h12):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg238 = (1'h0);
  assign y = {wire264,
                 wire263,
                 wire262,
                 wire221,
                 wire122,
                 wire123,
                 wire153,
                 wire223,
                 wire224,
                 wire225,
                 wire239,
                 wire240,
                 wire260,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg111 <= ($signed($unsigned($unsigned({wire108, wire110}))) ?
          (+({wire107[(4'he):(4'he)],
              $unsigned((8'hb2))} >> wire106)) : ($unsigned(wire110[(3'h5):(3'h5)]) ?
              (wire106 ?
                  $unsigned((~|wire109)) : ($unsigned(wire109) > wire107)) : wire110[(4'ha):(2'h3)]));
      if ((8'haf))
        begin
          reg112 <= ({{(-$unsigned((8'hb4)))}} >= (8'ha4));
          reg113 <= $unsigned(((~|$signed((wire107 ?
              wire109 : reg112))) || {reg111, wire107}));
          reg114 <= $unsigned((~&{wire106, $signed(wire107[(2'h3):(2'h3)])}));
          reg115 <= wire106;
        end
      else
        begin
          reg112 <= ((((wire106 ? {reg114, reg111} : wire110) ?
                  $signed(wire109) : reg113) ?
              (8'ha5) : wire107) >>> wire109);
          reg113 <= (wire108[(3'h4):(1'h0)] ?
              ($unsigned($signed($signed(reg111))) ^ $signed(reg113)) : $unsigned($unsigned((+(!reg113)))));
          reg114 <= wire106;
          reg115 <= $unsigned($signed((~wire110[(5'h15):(5'h12)])));
        end
      reg116 <= $signed({$signed(wire107[(3'h4):(1'h1)]),
          ((~^(8'haf)) >>> (((8'ha4) ? reg112 : reg111) ?
              {(7'h41), wire108} : (wire107 ^~ wire106)))});
      if (wire110[(4'h9):(3'h4)])
        begin
          reg117 <= $signed($unsigned(reg116[(4'h9):(3'h7)]));
        end
      else
        begin
          reg117 <= {($unsigned(($unsigned(reg115) ?
                      $signed(wire109) : $unsigned(reg115))) ?
                  reg113 : reg113[(5'h15):(4'hd)])};
          reg118 <= ({wire106} ?
              wire106[(4'hf):(3'h4)] : $signed(((^~$unsigned(reg115)) ?
                  wire107[(1'h0):(1'h0)] : (~(reg113 ? reg112 : reg117)))));
          reg119 <= wire106;
          reg120 <= reg114;
        end
      reg121 <= ((reg119 ?
              $unsigned(((reg115 != wire108) ?
                  reg112[(1'h1):(1'h1)] : $unsigned(reg116))) : (+$signed((wire107 ?
                  wire107 : reg111)))) ?
          $signed($signed($unsigned($unsigned(wire110)))) : $unsigned(reg120));
    end
  assign wire122 = (~reg115);
  assign wire123 = wire106;
  module124 #() modinst154 (.wire128(wire109), .wire127(reg111), .y(wire153), .wire125(wire107), .wire126(wire108), .wire129(reg115), .clk(clk));
  module155 #() modinst222 (.clk(clk), .wire157(wire109), .wire158(reg112), .y(wire221), .wire159(wire108), .wire156(wire110), .wire160(reg119));
  assign wire223 = {({$signed($unsigned((8'haa))),
                               $unsigned(reg119[(1'h0):(1'h0)])} ?
                           (wire123[(3'h5):(3'h5)] != $unsigned({reg119,
                               wire153})) : wire109[(2'h3):(2'h3)])};
  assign wire224 = wire106[(4'hb):(1'h0)];
  assign wire225 = ({wire123} ?
                       $signed($signed({reg111,
                           $unsigned(wire108)})) : reg111[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg226 <= reg120[(1'h1):(1'h0)];
      reg227 <= (reg116 - {(&wire223[(3'h5):(3'h4)])});
      reg228 <= wire123;
      if ($signed($unsigned($unsigned((+(wire106 ~^ reg111))))))
        begin
          if ((reg227[(5'h14):(4'hf)] << (^~((~|(&wire223)) ?
              (|(~^wire123)) : wire109))))
            begin
              reg229 <= wire223;
              reg230 <= reg120[(5'h14):(4'hb)];
              reg231 <= reg115[(4'h9):(3'h5)];
              reg232 <= $signed(reg121);
              reg233 <= (-(&(reg113[(4'hd):(3'h7)] ?
                  $signed(reg113) : {(wire107 < reg119)})));
            end
          else
            begin
              reg229 <= wire109[(4'hf):(4'h9)];
              reg230 <= (^~$signed(((wire225[(1'h1):(1'h1)] > reg118[(1'h0):(1'h0)]) ~^ wire108[(4'h8):(2'h2)])));
              reg231 <= $unsigned($unsigned($unsigned((8'h9d))));
            end
          if ({wire223, (wire123[(2'h3):(2'h2)] <= $signed($signed(reg226)))})
            begin
              reg234 <= (((~^reg117) - $unsigned(({reg231} & (-wire107)))) ?
                  (wire123 != reg226[(3'h5):(3'h4)]) : ($signed((8'ha5)) ?
                      {$unsigned((!reg226)),
                          (!wire108)} : reg119[(3'h4):(1'h1)]));
            end
          else
            begin
              reg234 <= $unsigned(((&reg228) ?
                  $unsigned($unsigned($signed(wire109))) : reg117[(2'h2):(2'h2)]));
              reg235 <= ($unsigned((8'had)) >= reg119[(1'h1):(1'h0)]);
              reg236 <= $signed(($signed(wire109[(4'h8):(3'h4)]) ~^ wire110));
              reg237 <= {$unsigned((reg236 * wire223[(2'h2):(1'h1)])),
                  wire110[(2'h3):(1'h0)]};
            end
          reg238 <= ($unsigned(reg116[(4'hd):(3'h5)]) ?
              $signed(wire225) : $signed(reg114));
        end
      else
        begin
          if (reg237[(4'hd):(4'h8)])
            begin
              reg229 <= (!$unsigned((wire224 ?
                  ((wire225 ? reg118 : wire110) <= {(7'h44),
                      (8'haf)}) : (~^(~^(8'ha2))))));
              reg230 <= wire122[(3'h4):(3'h4)];
              reg231 <= reg238[(1'h0):(1'h0)];
              reg232 <= {$unsigned($signed($signed({reg238}))), reg238};
            end
          else
            begin
              reg229 <= (~^$signed(reg232));
              reg230 <= (reg236 || wire221[(2'h3):(1'h0)]);
            end
          reg233 <= reg119[(2'h2):(1'h1)];
          reg234 <= ($unsigned(reg115) + wire224[(2'h3):(2'h2)]);
          reg235 <= $signed(wire223[(1'h0):(1'h0)]);
        end
    end
  assign wire239 = $signed(reg230[(3'h4):(2'h3)]);
  assign wire240 = (~&$unsigned($signed(((reg120 >= (8'hb3)) ?
                       {reg232} : (&wire109)))));
  module241 #() modinst261 (wire260, clk, reg235, wire107, reg233, reg120);
  assign wire262 = wire109[(3'h4):(2'h3)];
  assign wire263 = ((~|(reg120 ?
                       (wire221 ?
                           reg112 : (reg112 && reg119)) : $unsigned({(8'ha0)}))) ^~ (wire240 ?
                       $unsigned(((reg236 ?
                           reg231 : wire110) - $signed(wire153))) : ((wire123 ?
                           wire239[(1'h1):(1'h0)] : $unsigned(wire240)) <= $unsigned($signed(wire224)))));
  assign wire264 = reg229;
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  assign y = {wire77,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire32 = wire28;
  assign wire33 = (wire28[(1'h1):(1'h0)] ?
                      (-((8'hb3) ?
                          wire29[(4'h9):(3'h5)] : (&((8'ha9) ?
                              wire31 : wire28)))) : wire31);
  assign wire34 = wire29;
  assign wire35 = wire33[(1'h1):(1'h1)];
  assign wire36 = (!(wire35 ?
                      $unsigned(wire34[(4'hd):(3'h4)]) : wire31[(1'h1):(1'h1)]));
  assign wire37 = (^(8'hb9));
  assign wire38 = {wire35};
  always
    @(posedge clk) begin
      if ((7'h43))
        begin
          reg39 <= $signed(wire36);
          if (wire35[(2'h3):(2'h2)])
            begin
              reg40 <= (~^$unsigned(wire38[(4'hb):(1'h1)]));
              reg41 <= {(~(($signed(wire30) ? (-wire33) : $unsigned(reg39)) ?
                      {$unsigned(wire31)} : (wire36[(1'h0):(1'h0)] >= {reg39})))};
              reg42 <= wire33;
            end
          else
            begin
              reg40 <= wire37;
              reg41 <= $signed($signed($unsigned({{(8'hb0), wire28}})));
              reg42 <= (reg40 ?
                  $unsigned(($unsigned(reg42) > wire34)) : {wire29[(5'h11):(4'hb)],
                      $signed((((8'hab) ? wire32 : wire35) >> wire36))});
            end
          reg43 <= $signed((^~($signed({wire36}) << wire36)));
          reg44 <= wire28[(2'h2):(1'h1)];
          if ((&(~wire29[(4'he):(4'he)])))
            begin
              reg45 <= ($unsigned(((8'hab) ?
                  (~&wire31) : (8'ha8))) != ((~^((reg41 ?
                  (8'hb7) : reg43) - (|(8'hbb)))) | ($unsigned((reg41 ?
                  wire37 : (8'haf))) <<< reg43[(1'h1):(1'h0)])));
              reg46 <= ((reg42[(3'h4):(2'h2)] ?
                      wire37 : {((wire31 ? wire37 : reg40) ?
                              (|wire31) : (wire30 ? reg45 : wire30))}) ?
                  (wire38[(3'h4):(2'h3)] == (-wire31[(1'h0):(1'h0)])) : $signed($signed(($signed(wire28) ^ $signed((8'ha0))))));
              reg47 <= (reg40 ?
                  (~&((wire29 ? (8'h9e) : $unsigned((8'h9e))) ?
                      $unsigned((wire38 ?
                          reg44 : reg39)) : ((~&wire33) * $unsigned(reg46)))) : ((8'h9c) & $signed((((8'ha4) || reg41) ?
                      reg45[(3'h7):(1'h1)] : (-wire36)))));
              reg48 <= ((!{{$unsigned(wire30), (reg41 ? wire30 : reg41)},
                      wire37}) ?
                  wire35 : ((~$signed($unsigned(wire33))) | (+$signed((wire34 ?
                      reg46 : reg40)))));
            end
          else
            begin
              reg45 <= reg39[(5'h15):(4'hb)];
              reg46 <= reg48;
              reg47 <= $unsigned((wire28[(3'h4):(2'h2)] < wire30));
              reg48 <= reg45;
              reg49 <= $unsigned(($unsigned((8'ha2)) ?
                  $signed(wire38[(3'h4):(1'h0)]) : wire38[(4'ha):(1'h0)]));
            end
        end
      else
        begin
          if (((($unsigned({reg41, (8'hb6)}) * {wire30, $signed(wire32)}) ?
                  $signed((~(~reg39))) : (wire37 ?
                      wire32[(1'h1):(1'h1)] : (~(!wire34)))) ?
              $unsigned(wire38[(4'hd):(1'h1)]) : reg43[(1'h1):(1'h1)]))
            begin
              reg39 <= reg40[(3'h4):(1'h1)];
              reg40 <= reg39[(1'h0):(1'h0)];
              reg41 <= {($signed(wire34) > (reg39 ?
                      ((wire38 << wire38) || reg40[(4'hb):(1'h0)]) : $unsigned(((8'hb6) ?
                          (8'hbc) : wire30)))),
                  (-((reg49[(4'h9):(4'h9)] ?
                          {(8'ha7), wire29} : $signed(wire35)) ?
                      $signed(((8'ha7) >>> (8'hb0))) : $signed((^wire30))))};
              reg42 <= wire35[(1'h1):(1'h1)];
              reg43 <= wire36;
            end
          else
            begin
              reg39 <= $unsigned($signed(reg42));
              reg40 <= $signed(reg45[(3'h5):(3'h5)]);
              reg41 <= (&reg48);
              reg42 <= {(({$signed((8'hbd))} != ($signed(reg43) ?
                          $unsigned((8'h9c)) : (reg45 ? (8'hb1) : wire30))) ?
                      wire31 : reg44[(1'h0):(1'h0)]),
                  wire29[(4'ha):(1'h0)]};
            end
          reg44 <= (|(wire31 - $unsigned($unsigned(wire29))));
          reg45 <= (reg47[(5'h13):(4'hc)] ~^ wire28);
          reg46 <= (((((-wire36) ? (^~wire37) : wire34[(5'h10):(4'hc)]) ?
                  ((wire32 > reg49) >= wire33) : wire29[(4'he):(4'h9)]) << reg46) ?
              reg39[(4'hd):(3'h4)] : $signed(wire38));
          if ((&{$signed((~|$signed((7'h43))))}))
            begin
              reg47 <= (^wire37[(3'h4):(2'h3)]);
              reg48 <= (^((+reg41) > (&reg46[(5'h11):(2'h2)])));
              reg49 <= (|$unsigned(wire35));
              reg50 <= ((8'hab) ?
                  $unsigned(reg40[(4'ha):(4'h8)]) : reg47[(4'hb):(2'h2)]);
              reg51 <= (reg40 ?
                  ($unsigned((reg47 > $unsigned(reg42))) ?
                      $unsigned($unsigned((wire29 ?
                          reg45 : wire38))) : $unsigned($unsigned((wire30 ?
                          reg48 : reg44)))) : {({reg46} * $signed((reg43 * wire38)))});
            end
          else
            begin
              reg47 <= reg41[(3'h7):(3'h5)];
              reg48 <= $unsigned((^~$signed(($unsigned(reg48) < {wire28,
                  wire32}))));
            end
        end
      reg52 <= $unsigned((~&$signed(((!wire32) ^~ $signed(reg43)))));
      reg53 <= wire33[(2'h3):(1'h1)];
      if ($unsigned((~&(wire35[(3'h4):(1'h0)] ?
          ((-(8'hb2)) ? (reg42 <<< (8'hba)) : $unsigned(wire29)) : (8'hb4)))))
        begin
          if ((($signed((8'ha9)) + (((wire29 ? (8'h9e) : reg39) | ((8'hab) ?
                  reg40 : wire34)) >> ((reg45 * wire33) ?
                  wire36[(1'h0):(1'h0)] : reg41[(3'h6):(3'h4)]))) ?
              reg50 : wire31))
            begin
              reg54 <= $unsigned($signed(reg40));
              reg55 <= reg52[(1'h0):(1'h0)];
              reg56 <= ($unsigned((~|$signed((wire36 < wire30)))) ?
                  $unsigned($signed(reg50[(3'h6):(1'h1)])) : reg50);
            end
          else
            begin
              reg54 <= (~reg49);
              reg55 <= wire28[(2'h2):(1'h0)];
              reg56 <= reg40;
              reg57 <= reg54[(4'h8):(2'h2)];
              reg58 <= ($signed({(wire36 ? reg55 : $unsigned(reg53)),
                      wire37[(3'h4):(1'h0)]}) ?
                  ((8'ha5) || (-reg56)) : reg52[(4'hc):(4'hb)]);
            end
          reg59 <= $signed(($signed($unsigned(reg58[(4'hb):(4'h9)])) >>> (((reg57 ?
                  wire38 : reg40) ?
              (reg56 ? reg47 : reg53) : (wire35 ? reg56 : reg54)) ^~ ({wire29,
              reg56} + $unsigned(reg49)))));
        end
      else
        begin
          reg54 <= wire28[(2'h2):(2'h2)];
          if ({((-(~{reg58})) ?
                  $signed(((8'hb5) ?
                      (reg57 - wire32) : $unsigned(reg55))) : {$signed((wire30 | reg56)),
                      $unsigned(reg45[(2'h3):(1'h0)])})})
            begin
              reg55 <= reg39;
              reg56 <= $signed(reg39[(2'h2):(2'h2)]);
              reg57 <= (8'hb0);
              reg58 <= {$unsigned({((reg52 >= reg52) * (8'ha7)), (8'ha1)})};
              reg59 <= $unsigned(wire36[(2'h2):(1'h1)]);
            end
          else
            begin
              reg55 <= ((reg54[(4'h9):(2'h3)] == (reg53 < ($signed(wire33) >> (wire35 ?
                      reg52 : (8'hbd))))) ?
                  reg47 : (wire34[(2'h3):(1'h1)] ?
                      reg56[(4'ha):(3'h4)] : {((~reg42) ~^ $unsigned(reg50))}));
              reg56 <= $signed(reg50[(1'h0):(1'h0)]);
            end
          reg60 <= ($signed($unsigned($unsigned($signed((8'ha5))))) & ((reg58 ?
                  $unsigned((&wire30)) : $unsigned(wire28)) ?
              wire37[(4'hd):(4'h9)] : wire38[(4'hc):(4'hc)]));
        end
    end
  module61 #() modinst78 (.clk(clk), .wire63(wire32), .wire62(reg58), .wire64(wire34), .y(wire77), .wire65(reg46));
endmodule

module module4
#(parameter param20 = (-({(((8'ha7) ? (8'h9f) : (8'hb0)) ? ((8'hb1) ? (8'h9d) : (7'h42)) : ((8'ha5) ? (8'ha6) : (7'h40))), (-(^(8'ha8)))} ? (~^{(~&(8'h9c)), {(7'h40)}}) : (-{(+(8'hbf))}))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = {wire8[(3'h7):(1'h1)], $signed(wire6[(3'h5):(2'h3)])};
  assign wire10 = (8'ha7);
  assign wire11 = (wire7[(4'hb):(4'hb)] << $unsigned(wire10[(4'he):(1'h1)]));
  assign wire12 = $signed(wire8[(4'hb):(4'h8)]);
  assign wire13 = (($signed($unsigned($unsigned(wire12))) ?
                      $unsigned((^~$unsigned(wire6))) : $signed((~(wire9 ?
                          wire6 : wire7)))) >>> $signed({{$signed(wire7),
                          (|(8'hac))},
                      (^~wire10)}));
  assign wire14 = ((wire12 == ($signed(wire11) ?
                          (&(&(8'hb1))) : wire9[(4'h9):(1'h0)])) ?
                      (|((-(7'h44)) >>> (~&(wire9 ?
                          wire11 : (8'hb3))))) : wire5[(1'h1):(1'h1)]);
  assign wire15 = wire12;
  assign wire16 = (((8'ha6) || {(wire15 ?
                          wire13[(5'h11):(2'h3)] : {(8'ha0),
                              wire12})}) >= (wire5 == (wire11 - {((8'ha4) ?
                          (8'hab) : wire11)})));
  assign wire17 = $signed(wire10[(5'h10):(4'hc)]);
  assign wire18 = wire7;
  assign wire19 = wire5[(1'h0):(1'h0)];
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire65;
  input wire [(4'h8):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire [(3'h5):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= $unsigned($signed({(+(wire63 ? wire64 : wire62)),
          ((&wire64) ? (wire63 >= wire65) : $unsigned(wire64))}));
      reg67 <= $unsigned($signed(wire65[(2'h2):(1'h0)]));
    end
  assign wire68 = (((^$unsigned(reg67[(3'h7):(3'h4)])) ?
                      wire64[(2'h2):(1'h0)] : ((reg66 + wire64) >>> wire62)) - wire63);
  assign wire69 = $signed((((!wire62[(1'h0):(1'h0)]) ?
                          reg66 : ($signed(reg67) || {wire62, reg67})) ?
                      $unsigned($unsigned((wire64 || reg66))) : $unsigned((reg67[(3'h7):(3'h7)] ~^ $signed(wire65)))));
  assign wire70 = ((($signed(reg67) ? {$signed(reg66)} : $signed(reg67)) ?
                      ((~|(reg66 | wire63)) ^ $unsigned(wire62)) : wire64[(3'h4):(3'h4)]) - $signed(($unsigned((wire64 ?
                      wire63 : reg66)) >= wire65[(2'h2):(2'h2)])));
  assign wire71 = wire63;
  assign wire72 = wire71[(1'h0):(1'h0)];
  assign wire73 = $unsigned((~&{(&$unsigned(wire65))}));
  assign wire74 = {($unsigned($signed($unsigned(wire70))) ?
                          ($signed((reg66 ? wire68 : wire63)) ?
                              $unsigned(wire62) : (^~$unsigned(wire63))) : $unsigned(wire72[(3'h4):(2'h2)]))};
  assign wire75 = (((-(&wire62)) << ($unsigned((^~reg67)) ?
                          {((8'h9d) ? wire72 : wire63),
                              $unsigned(wire73)} : $unsigned($signed(wire73)))) ?
                      (8'hae) : wire63);
  assign wire76 = wire62[(2'h2):(1'h0)];
endmodule

module module241  (y, clk, wire245, wire244, wire243, wire242);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire245;
  input wire signed [(4'h9):(1'h0)] wire244;
  input wire signed [(4'hb):(1'h0)] wire243;
  input wire signed [(5'h11):(1'h0)] wire242;
  wire [(2'h3):(1'h0)] wire259;
  wire signed [(2'h3):(1'h0)] wire258;
  wire [(3'h6):(1'h0)] wire249;
  wire [(5'h14):(1'h0)] wire248;
  wire signed [(5'h11):(1'h0)] wire247;
  wire [(4'hd):(1'h0)] wire246;
  reg signed [(4'h8):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg254 = (1'h0);
  reg [(5'h10):(1'h0)] reg253 = (1'h0);
  reg [(3'h4):(1'h0)] reg252 = (1'h0);
  reg [(3'h6):(1'h0)] reg251 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg250 = (1'h0);
  assign y = {wire259,
                 wire258,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 (1'h0)};
  assign wire246 = ($signed($signed((^~wire243))) << wire244[(3'h4):(2'h2)]);
  assign wire247 = ((~|{$unsigned((^wire243))}) ?
                       (!{$unsigned($signed(wire244))}) : (wire245[(4'hf):(3'h5)] ?
                           wire245 : $signed(wire244)));
  assign wire248 = (^(wire246 << wire244[(4'h9):(4'h9)]));
  assign wire249 = wire247;
  always
    @(posedge clk) begin
      if (wire246[(3'h4):(1'h1)])
        begin
          reg250 <= $unsigned({($signed(wire247[(2'h2):(1'h1)]) <= $signed((+wire247))),
              wire249[(1'h0):(1'h0)]});
          if ((~|wire247[(3'h6):(3'h5)]))
            begin
              reg251 <= (~^$signed($signed((wire244 ?
                  $unsigned((8'ha9)) : (-wire243)))));
              reg252 <= (7'h40);
              reg253 <= {(wire243 ?
                      (reg252 ~^ $unsigned($signed(wire244))) : wire244),
                  $unsigned(wire246[(3'h4):(2'h2)])};
              reg254 <= $signed($unsigned(reg250[(1'h0):(1'h0)]));
            end
          else
            begin
              reg251 <= $signed(wire244);
              reg252 <= reg252[(2'h3):(2'h2)];
              reg253 <= $signed((wire249[(1'h0):(1'h0)] ?
                  $unsigned({(wire242 ? wire244 : wire249)}) : wire249));
              reg254 <= $signed(({reg251} ?
                  {wire247[(1'h1):(1'h1)]} : $unsigned((reg252 ?
                      ((7'h40) ^~ wire249) : (^~wire249)))));
              reg255 <= $unsigned($unsigned($signed($unsigned((wire243 * wire245)))));
            end
        end
      else
        begin
          reg250 <= ($unsigned((7'h44)) > ((reg251 >> ({reg252} != $unsigned(wire245))) && (&(^(reg253 ^~ wire245)))));
          if ((~&reg250))
            begin
              reg251 <= (wire247 ? $signed(wire245) : (wire247 ^ (^~wire243)));
              reg252 <= {reg251[(1'h0):(1'h0)],
                  ((wire247[(4'he):(4'he)] - reg250) ? wire242 : wire247)};
              reg253 <= (reg252 ~^ $unsigned(wire246[(2'h3):(2'h3)]));
              reg254 <= $signed($unsigned($signed($unsigned((&wire244)))));
              reg255 <= $unsigned($unsigned(wire242));
            end
          else
            begin
              reg251 <= $signed($signed((!$signed($unsigned(reg252)))));
              reg252 <= reg250[(1'h1):(1'h1)];
              reg253 <= $unsigned(reg252);
              reg254 <= $unsigned((((^~(~reg254)) - wire244) ?
                  {(^wire246)} : $signed($unsigned($signed(reg250)))));
            end
        end
      reg256 <= (reg250 == (wire242[(4'h9):(4'h9)] ?
          {((reg250 ? reg250 : (8'hb9)) != ((8'haf) ? wire245 : reg255)),
              ((~^wire242) ?
                  $signed(wire243) : (~wire245))} : $signed((~|(~reg252)))));
      reg257 <= (~$unsigned(($unsigned($unsigned((8'hb6))) ?
          ((wire243 != wire246) || (wire249 ?
              wire246 : (8'hb0))) : wire246[(4'ha):(3'h6)])));
    end
  assign wire258 = {wire244};
  assign wire259 = $unsigned($unsigned(($signed((&reg253)) > (|(~^wire243)))));
endmodule

module module155
#(parameter param219 = {{(8'hbd)}}, 
parameter param220 = ((((^~(param219 * param219)) ? (^((8'hac) <= (8'ha7))) : (~&((8'haf) ^~ (8'ha1)))) ? (&(!param219)) : (!(+(^~param219)))) <= (8'hae)))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire160;
  input wire signed [(5'h11):(1'h0)] wire159;
  input wire [(4'hf):(1'h0)] wire158;
  input wire [(4'hf):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire218;
  wire [(4'hc):(1'h0)] wire217;
  wire [(5'h14):(1'h0)] wire216;
  wire signed [(4'hc):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire214;
  wire [(5'h14):(1'h0)] wire213;
  wire [(4'hc):(1'h0)] wire212;
  wire [(3'h5):(1'h0)] wire211;
  wire signed [(4'h8):(1'h0)] wire210;
  wire signed [(5'h10):(1'h0)] wire209;
  reg [(4'hc):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg201 = (1'h0);
  reg [(4'hd):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg [(4'hf):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
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
                 reg186,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((({$unsigned(wire160), wire159} - {$unsigned((wire159 || wire160))}) ?
          $unsigned(wire156) : (&($unsigned((wire159 && wire157)) ?
              ((wire159 - wire156) - $unsigned(wire160)) : wire157))))
        begin
          reg161 <= (^~($signed((wire160 ?
              wire160[(3'h4):(2'h2)] : wire157)) == (((wire158 ?
                  wire158 : wire157) > (-wire159)) ?
              wire157[(1'h1):(1'h0)] : $signed(wire158[(4'hc):(1'h1)]))));
          reg162 <= $signed($signed((($signed(wire159) ?
                  wire159 : {(8'ha0), (8'hb8)}) ?
              ($signed((8'ha4)) - (reg161 || wire156)) : (~&(wire157 > reg161)))));
        end
      else
        begin
          reg161 <= (wire156[(1'h0):(1'h0)] - $unsigned(wire156));
          reg162 <= (((($signed(wire160) ?
                          (wire156 - wire159) : (wire159 ? wire159 : wire159)) ?
                      $unsigned((wire159 ^~ reg162)) : (~^(&wire156))) ?
                  (~&(wire159[(5'h11):(4'hc)] < $unsigned((8'ha4)))) : (((reg162 ?
                          (8'ha7) : wire159) ?
                      ((8'hbb) <= wire158) : (8'ha9)) + wire160[(3'h4):(2'h2)])) ?
              wire157 : wire156[(1'h0):(1'h0)]);
          reg163 <= (($signed((~^wire158)) ?
              $unsigned(($signed(wire156) >>> (wire156 ?
                  reg161 : wire158))) : reg161[(4'hd):(1'h0)]) <<< wire159);
          reg164 <= (!$unsigned(((-(-wire157)) < reg161)));
        end
      reg165 <= $unsigned(wire156);
      if (reg163)
        begin
          reg166 <= $signed(((({reg162,
              reg163} >> $unsigned(reg165)) < (^~{wire158,
              reg163})) << (~|wire158)));
          reg167 <= ($unsigned((((reg163 + reg162) ?
              (reg164 && reg161) : reg166[(4'hb):(3'h7)]) <= $unsigned((reg161 ?
              reg165 : wire158)))) ^ wire157);
        end
      else
        begin
          reg166 <= reg162;
          if ($unsigned({(&((^~reg162) ^ $signed(reg164)))}))
            begin
              reg167 <= (({((^~reg163) ?
                              $unsigned(reg164) : wire156[(4'hf):(2'h3)]),
                          {(!wire158)}} ?
                      reg164[(2'h3):(1'h1)] : ($unsigned($signed(wire159)) ?
                          ($unsigned(reg163) > $signed((8'ha2))) : $unsigned(((8'hbe) ?
                              reg162 : reg167)))) ?
                  wire156 : {(8'hab)});
              reg168 <= (($signed($unsigned({(7'h40)})) ^~ ({(~^reg163),
                      $unsigned((8'hb2))} ?
                  (reg167 >>> reg164) : wire158[(4'he):(3'h6)])) > {(((~&reg164) >> (+wire156)) != ($signed(reg162) ?
                      reg165 : (wire156 ? reg166 : (8'hb8)))),
                  $unsigned(reg163)});
              reg169 <= $signed(reg167[(4'hf):(2'h2)]);
            end
          else
            begin
              reg167 <= reg163[(4'h9):(1'h0)];
            end
          reg170 <= $unsigned($unsigned(wire160[(1'h0):(1'h0)]));
          if ($unsigned(({$unsigned((wire158 <<< reg164))} + (^~((reg167 - reg161) <<< $signed(reg167))))))
            begin
              reg171 <= ($unsigned((reg166[(4'h9):(2'h3)] | reg165)) ?
                  reg162[(5'h11):(4'hc)] : reg164[(3'h5):(2'h2)]);
              reg172 <= ($signed({reg170}) ? reg171 : reg165[(1'h0):(1'h0)]);
              reg173 <= (reg161 ^ reg161[(3'h7):(1'h1)]);
              reg174 <= (reg167 ?
                  $unsigned($signed(reg165)) : (((~^(reg170 ^~ reg170)) ?
                          reg173 : wire157) ?
                      reg171[(3'h7):(1'h1)] : (~|{wire160})));
            end
          else
            begin
              reg171 <= (reg172 ?
                  reg173[(1'h1):(1'h1)] : $unsigned($signed($signed(reg161))));
              reg172 <= {{$signed($signed(reg164[(3'h7):(3'h5)]))}};
              reg173 <= ((+(reg168 ?
                  $unsigned((wire158 ^ wire157)) : reg173)) ^~ ((reg171 ?
                      $signed((wire156 <= reg170)) : (7'h43)) ?
                  $signed(wire160[(3'h5):(1'h0)]) : $unsigned((wire156[(4'hf):(1'h0)] ?
                      (~|reg169) : (reg171 ? wire156 : (8'h9e))))));
            end
        end
      if ($unsigned({(reg168 ?
              ((~&reg162) ?
                  (-reg163) : $unsigned(reg165)) : (wire159[(5'h11):(4'hb)] * reg173)),
          (+reg172[(3'h5):(2'h3)])}))
        begin
          reg175 <= (!($signed((wire158 >= (reg169 << wire156))) * $unsigned(((|reg168) ?
              (^~reg174) : $unsigned(reg173)))));
          reg176 <= $unsigned((reg167 * ($signed($signed((8'hba))) << reg175)));
          if ($unsigned((7'h42)))
            begin
              reg177 <= reg166;
              reg178 <= reg162;
              reg179 <= reg177;
              reg180 <= $unsigned($signed(reg172[(4'h9):(3'h6)]));
              reg181 <= (+(wire160[(2'h2):(1'h1)] ?
                  $unsigned($signed({reg177})) : reg179));
            end
          else
            begin
              reg177 <= (((reg177 || (((8'hba) < wire159) << reg167)) ?
                      (^~reg172) : ({((8'ha1) ? wire159 : wire160)} ?
                          reg172[(4'h8):(2'h3)] : (|(reg163 >= reg170)))) ?
                  ($unsigned((&reg162)) >= {reg166[(3'h6):(1'h0)],
                      {{reg167}}}) : $signed(reg177));
              reg178 <= ($signed(($unsigned($signed(wire159)) * ($signed(wire156) | $unsigned(reg178)))) - wire158);
            end
          reg182 <= reg161;
          reg183 <= $signed((!($unsigned(wire158) ?
              ({reg177} ? (reg165 & reg162) : reg179) : {(reg171 <<< reg181),
                  $unsigned(reg162)})));
        end
      else
        begin
          reg175 <= reg166;
        end
      if (((~&$unsigned($signed((reg171 ? (8'h9c) : (8'hb0))))) < reg170))
        begin
          reg184 <= (~(reg176 ?
              reg172 : ($unsigned($unsigned(reg166)) || (~^reg170[(3'h6):(3'h5)]))));
          if ((^reg183))
            begin
              reg185 <= (8'hbf);
              reg186 <= reg177;
              reg187 <= $unsigned(reg179[(4'he):(3'h4)]);
              reg188 <= ({{reg179[(3'h5):(3'h4)]},
                  (((reg184 << wire156) ? {reg167} : $unsigned(reg176)) ?
                      (&$unsigned(reg183)) : ({reg181} ?
                          wire160 : $unsigned(reg172)))} ^ $unsigned(reg164[(3'h5):(2'h3)]));
              reg189 <= $unsigned(wire157);
            end
          else
            begin
              reg185 <= reg161[(2'h3):(2'h3)];
              reg186 <= reg171;
            end
          if ((~|reg161[(1'h0):(1'h0)]))
            begin
              reg190 <= {reg183, reg180};
              reg191 <= (|(~((reg164 ? (reg188 >= reg175) : $signed(reg174)) ?
                  $unsigned(reg176[(3'h7):(1'h1)]) : reg180)));
            end
          else
            begin
              reg190 <= reg181;
              reg191 <= (!reg170);
            end
          reg192 <= (^~reg171);
          if ($unsigned(reg173))
            begin
              reg193 <= {((((+reg168) * $signed(reg187)) & (8'haf)) ?
                      ((8'ha9) ?
                          {{reg163, reg182},
                              (reg166 - reg176)} : ($unsigned(reg166) * $unsigned(reg173))) : $signed({{reg175,
                              reg164}}))};
            end
          else
            begin
              reg193 <= (-($unsigned($signed(reg193[(2'h2):(1'h1)])) ?
                  $unsigned(wire156) : {reg166}));
              reg194 <= ((!reg169[(2'h2):(1'h1)]) && wire158);
              reg195 <= reg191;
            end
        end
      else
        begin
          reg184 <= (~|(reg178 ?
              (reg181 & ((&reg177) ?
                  (wire157 ?
                      (8'ha8) : wire156) : reg164)) : ($unsigned($signed(reg188)) ?
                  reg176[(2'h2):(1'h1)] : $signed($unsigned(reg194)))));
        end
    end
  always
    @(posedge clk) begin
      reg196 <= (reg176[(3'h4):(1'h1)] ~^ (($unsigned($signed(reg189)) + reg161[(2'h3):(1'h0)]) != $signed(({reg182} ^ (reg181 ?
          reg184 : reg166)))));
      reg197 <= ($unsigned({$signed(((8'hb3) ? reg175 : (7'h42))),
              ((~|reg173) * wire158[(4'hb):(1'h0)])}) ?
          reg184[(1'h1):(1'h0)] : $signed($unsigned((~^((8'ha2) ?
              reg184 : (8'hba))))));
      reg198 <= {$unsigned((!(-{(8'h9e), (7'h44)}))),
          ($signed($signed(reg196)) ?
              ({reg179[(1'h1):(1'h1)]} && $signed((reg172 ?
                  reg179 : reg180))) : {$signed($signed(reg174))})};
      reg199 <= ((($unsigned((reg192 != reg187)) ?
                  (((8'h9d) ? reg182 : wire159) ?
                      (~&reg192) : (^reg187)) : {$signed(reg173)}) ?
              ((((8'h9d) ? reg195 : (8'hbd)) ?
                  wire160 : reg185) || (8'ha5)) : (reg184 ?
                  wire157 : reg194[(3'h4):(2'h2)])) ?
          ($signed(((reg166 ? reg173 : reg181) ?
                  $unsigned((8'haf)) : (+reg162))) ?
              ($unsigned((~&reg191)) ?
                  $signed((^wire158)) : ($signed(reg182) ?
                      $signed(reg168) : $signed(reg166))) : {(!reg176)}) : ((reg183[(1'h0):(1'h0)] ?
                  (8'hbb) : (reg189 ?
                      (reg180 ~^ reg196) : reg189[(4'h8):(3'h7)])) ?
              reg186[(5'h11):(4'h9)] : reg192));
      if ((($unsigned(reg197[(3'h4):(2'h2)]) ?
          (wire156[(3'h5):(3'h5)] || $signed(reg198)) : {(|wire156)}) ~^ $signed((|(^(^~reg187))))))
        begin
          reg200 <= $unsigned($unsigned(reg175[(2'h2):(1'h1)]));
          reg201 <= $unsigned(((8'h9e) ?
              $signed($signed(reg182)) : reg195[(5'h12):(4'h9)]));
          reg202 <= ((^~(((reg166 && reg192) >= ((8'h9f) != (8'hb9))) << (8'haa))) || ($unsigned(reg168) ?
              (reg185 == ($signed(reg168) ^~ $unsigned(reg197))) : reg193));
          reg203 <= $signed((~&$signed(reg196)));
          reg204 <= $signed(((~(8'ha3)) * $signed($unsigned({reg185}))));
        end
      else
        begin
          reg200 <= {$signed(reg169)};
          reg201 <= {($unsigned(reg180[(2'h2):(1'h0)]) ?
                  (8'ha4) : {$signed((~|reg163))}),
              reg169[(2'h2):(2'h2)]};
          if ($signed((8'ha0)))
            begin
              reg202 <= (~&reg173[(2'h3):(2'h2)]);
              reg203 <= ((~^$unsigned(reg203[(4'hb):(4'h8)])) ?
                  reg177[(2'h3):(2'h3)] : (reg198[(1'h1):(1'h1)] ?
                      $signed($unsigned({(8'ha6)})) : $unsigned((+(~&reg177)))));
              reg204 <= ({$signed((((7'h44) * reg170) || (~&reg185)))} | $signed($unsigned({{reg169,
                      (8'haa)},
                  (~^reg174)})));
              reg205 <= $unsigned(reg163);
              reg206 <= reg165[(1'h1):(1'h1)];
            end
          else
            begin
              reg202 <= $unsigned((+reg201));
            end
          reg207 <= $signed($signed($signed(reg206[(4'hf):(1'h0)])));
          reg208 <= $signed(reg162);
        end
    end
  assign wire209 = (((reg183 >= {(reg188 - (8'hb1))}) * $signed((~^(reg208 - reg193)))) * reg201);
  assign wire210 = ((wire160 ?
                           {{reg190[(3'h4):(2'h3)], reg199},
                               (~|reg192[(1'h0):(1'h0)])} : ((((8'h9e) ?
                               reg176 : reg186) & $unsigned(reg196)) <<< ($unsigned(reg203) ?
                               (reg192 ^ reg182) : (reg169 < reg169)))) ?
                       ($signed(({(8'hb6)} ?
                               {(8'hbf), reg202} : $signed((8'hb9)))) ?
                           ((!reg166[(4'ha):(2'h3)]) ?
                               (reg167 << (!reg185)) : (reg166 ?
                                   reg198[(1'h1):(1'h1)] : (+reg202))) : wire160) : {reg204,
                           {($unsigned(reg194) * $signed((8'ha6))), (8'hb3)}});
  assign wire211 = $unsigned((~&wire159));
  assign wire212 = reg165;
  assign wire213 = wire210[(1'h1):(1'h0)];
  assign wire214 = (((reg197[(1'h1):(1'h0)] ?
                           ($signed(reg173) ? reg170 : (^reg174)) : wire157) ?
                       reg207[(4'hc):(4'h8)] : ($unsigned((8'hb9)) ?
                           ((reg188 & reg188) * $unsigned(reg166)) : $signed((reg203 ?
                               wire160 : (7'h42))))) - (|((^(~|reg186)) >= $signed(wire210))));
  assign wire215 = wire160[(3'h4):(3'h4)];
  assign wire216 = wire215[(1'h1):(1'h1)];
  assign wire217 = reg199;
  assign wire218 = {((((&wire156) ?
                                   reg180[(5'h10):(3'h4)] : reg203[(1'h1):(1'h1)]) ?
                               (^~(reg168 ? reg198 : reg195)) : reg167) ?
                           $unsigned({(!reg200)}) : wire209)};
endmodule

module module124
#(parameter param152 = {(&({((8'hb8) ? (7'h40) : (7'h41))} ? (((8'hbf) | (8'ha2)) ~^ ((8'ha8) ? (8'hab) : (8'had))) : (~&{(8'hb9)}))), {(!(((7'h44) ? (8'ha9) : (8'hb2)) ^ {(8'ha4)})), (((&(8'ha4)) != (~^(7'h41))) ? ((-(8'hbb)) ? {(7'h44)} : ((8'hba) ? (8'hbf) : (8'hb5))) : (((8'hb4) ? (8'hac) : (7'h44)) ? (8'haa) : (+(8'h9e))))}})
(y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire129;
  input wire signed [(4'hb):(1'h0)] wire128;
  input wire signed [(5'h11):(1'h0)] wire127;
  input wire signed [(4'hb):(1'h0)] wire126;
  input wire [(4'hf):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  assign y = {wire151,
                 wire145,
                 wire144,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire130,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg132,
                 (1'h0)};
  assign wire130 = $unsigned((~(wire129[(4'ha):(3'h7)] ?
                       (&wire126[(1'h0):(1'h0)]) : $unsigned(wire126))));
  assign wire131 = $unsigned(((~&$unsigned(wire127[(4'hf):(3'h7)])) && (-(wire128[(4'h9):(4'h9)] ~^ wire127[(4'h9):(3'h4)]))));
  always
    @(posedge clk) begin
      reg132 <= $signed($signed({(8'ha9)}));
    end
  assign wire133 = wire131;
  assign wire134 = wire125[(2'h3):(1'h1)];
  assign wire135 = ((wire128[(4'hb):(3'h6)] ?
                           wire127 : $unsigned(((wire134 == wire128) || $unsigned(wire128)))) ?
                       $signed((&(~(wire127 + wire133)))) : (~|($signed((wire131 ?
                               (7'h43) : wire129)) ?
                           (^~$unsigned(wire133)) : $unsigned(wire134))));
  assign wire136 = ((((~|(wire128 ?
                           wire129 : (8'hbb))) >>> $signed($unsigned((8'h9c)))) ?
                       $unsigned($signed(wire126[(2'h2):(1'h1)])) : (^~$unsigned((wire129 ?
                           wire134 : wire134)))) | wire127);
  assign wire137 = $unsigned(($unsigned($unsigned(wire135)) ?
                       wire134[(5'h11):(5'h11)] : $signed(wire125[(4'ha):(3'h4)])));
  assign wire138 = ((~|(^$signed((wire134 << wire136)))) ?
                       ($unsigned(wire125[(4'hd):(4'hb)]) ?
                           ($unsigned((wire128 ? wire133 : wire127)) ?
                               ({wire127,
                                   wire133} ^ (wire127 && wire133)) : ({wire137,
                                   wire125} + $signed(wire135))) : wire136[(3'h4):(2'h3)]) : $signed({{{(8'ha1),
                                   wire128}},
                           ((wire134 ^~ (8'h9e)) ?
                               wire134 : $signed(wire137))}));
  assign wire139 = (&(((&wire137[(3'h5):(1'h1)]) << {$unsigned(wire130)}) ?
                       ({wire135} ?
                           (wire133[(2'h3):(2'h3)] ?
                               $signed(wire126) : {wire126}) : ({reg132} ?
                               {(8'hb1)} : (wire136 + wire126))) : {($unsigned((8'ha3)) ?
                               wire129 : {wire137}),
                           ((wire128 ? (8'ha7) : wire130) ?
                               wire135 : wire135[(1'h1):(1'h0)])}));
  always
    @(posedge clk) begin
      reg140 <= ((wire125[(1'h1):(1'h0)] & ((7'h41) ? reg132 : wire133)) ?
          $signed((wire135 <<< {$signed((8'h9c))})) : $unsigned(((~&$signed((7'h41))) > ((8'hbf) ^ ((8'ha1) > wire127)))));
      reg141 <= wire131;
      reg142 <= ($signed(wire126[(2'h2):(1'h1)]) ?
          (^$unsigned(reg132[(1'h0):(1'h0)])) : $unsigned($unsigned($unsigned(wire138[(4'he):(1'h1)]))));
      reg143 <= ((wire129[(1'h0):(1'h0)] ~^ wire136) ?
          (wire130[(1'h0):(1'h0)] <= $unsigned(reg132[(2'h2):(1'h0)])) : reg132[(1'h0):(1'h0)]);
    end
  assign wire144 = $signed({{((reg132 && reg141) ?
                               ((8'had) && wire126) : ((7'h40) ?
                                   wire126 : wire137)),
                           $signed(((7'h43) ? wire125 : wire135))}});
  assign wire145 = $unsigned(wire139[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      reg146 <= (!wire125[(4'hb):(1'h0)]);
      reg147 <= (({(wire138 ? (~^wire126) : (wire136 ? wire134 : wire144)),
              reg140[(3'h5):(2'h2)]} && (&{(8'ha8)})) ?
          wire130[(2'h2):(1'h1)] : $signed((((wire127 ^~ wire139) ^~ reg132[(2'h3):(2'h3)]) == $signed(wire137[(1'h0):(1'h0)]))));
      reg148 <= (((~^(wire130 ?
              (wire128 ^~ reg143) : (wire138 >> wire125))) + (^~($signed(wire139) <<< wire136))) ?
          (&$unsigned($signed((~wire137)))) : reg141[(2'h3):(1'h0)]);
      reg149 <= reg147[(3'h5):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg150 <= $signed((wire127 <= reg141[(4'he):(3'h5)]));
    end
  assign wire151 = reg142;
endmodule
