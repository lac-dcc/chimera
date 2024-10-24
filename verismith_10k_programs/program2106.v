module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire134;
  assign y = {wire139, wire138, wire137, wire136, wire134, (1'h0)};
  module4 #() modinst135 (wire134, clk, wire2, wire3, wire1, wire0);
  assign wire136 = $signed((+$signed({$signed(wire134)})));
  assign wire137 = $unsigned(($unsigned(wire3) ?
                       ($signed(wire3) ?
                           $signed((~wire2)) : wire2) : (-$signed($unsigned((8'ha1))))));
  assign wire138 = ($unsigned($unsigned(wire137[(2'h2):(2'h2)])) ?
                       (($signed((wire3 ? wire136 : wire1)) ?
                           (~wire1) : wire137) * {$unsigned({(8'h9d)})}) : wire3[(5'h13):(1'h1)]);
  assign wire139 = ($signed(($unsigned((wire3 >>> wire137)) ?
                       wire2 : ((wire138 ?
                           wire2 : wire0) || $signed(wire136)))) > (({(wire2 ?
                                   wire137 : wire2)} ?
                           ((wire137 & wire2) ?
                               wire138 : (~|wire136)) : ({(8'hb2)} > $unsigned(wire2))) ?
                       ((^~(!wire136)) >= wire134) : $unsigned($unsigned($unsigned(wire1)))));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  assign y = {wire131,
                 wire118,
                 wire117,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg133,
                 reg132,
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
                 reg116,
                 reg115,
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
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire9 = (-(wire8 | (wire8 < wire8[(3'h4):(2'h2)])));
  assign wire10 = ({{$signed(wire6[(1'h1):(1'h1)]),
                              ($signed(wire6) ?
                                  (wire7 && wire9) : $signed(wire8))},
                          {($signed(wire5) ?
                                  (wire7 ?
                                      wire5 : wire7) : wire6[(4'h8):(3'h4)]),
                              (wire9 ? {wire5} : $signed((8'ha5)))}} ?
                      (^~$signed(wire6)) : (($signed((|(8'hb4))) ~^ $signed((^~wire8))) ?
                          (+((!wire9) > wire8)) : wire7[(4'hf):(1'h0)]));
  assign wire11 = $signed(wire7[(3'h6):(3'h5)]);
  assign wire12 = ($unsigned({wire10}) >> ($unsigned($signed((!wire6))) ~^ wire8[(1'h0):(1'h0)]));
  module13 #() modinst59 (wire58, clk, wire7, wire6, wire9, wire5);
  assign wire60 = (wire12[(1'h1):(1'h0)] & ((wire12[(3'h6):(3'h5)] ?
                          ({wire5} ?
                              $signed(wire12) : wire11[(4'he):(3'h5)]) : $signed(wire9)) ?
                      wire58 : (+($signed(wire5) ?
                          wire5[(4'ha):(4'h8)] : wire58[(2'h2):(1'h1)]))));
  assign wire61 = $unsigned((({wire58[(1'h0):(1'h0)], ((8'ha0) <<< wire12)} ?
                      wire5 : $unsigned($signed((7'h41)))) ~^ $signed(wire9[(4'hc):(1'h0)])));
  assign wire62 = (|(-$unsigned(({wire5} ?
                      (wire9 ? wire5 : wire60) : (~|wire9)))));
  module63 #() modinst96 (.wire66(wire60), .clk(clk), .y(wire95), .wire64(wire6), .wire65(wire8), .wire67(wire12));
  assign wire97 = $signed(wire95[(3'h4):(1'h0)]);
  assign wire98 = $unsigned({(~$signed($signed(wire12))),
                      (~|($unsigned(wire6) >>> $unsigned(wire97)))});
  assign wire99 = wire61[(3'h4):(1'h0)];
  assign wire100 = $signed(($unsigned((wire58[(2'h3):(1'h0)] << (!wire97))) ^ $signed($signed((wire98 & wire5)))));
  always
    @(posedge clk) begin
      reg101 <= wire5;
      if (wire97[(1'h0):(1'h0)])
        begin
          reg102 <= {$unsigned($signed(wire10))};
          if (($unsigned((($unsigned((8'hb2)) || $signed(wire61)) >> (wire58 ?
              (wire60 * wire61) : {wire62, wire8}))) >= {reg102[(1'h0):(1'h0)],
              ($signed($unsigned(wire98)) ?
                  (^~(wire5 ? wire5 : reg102)) : (|wire6[(4'hb):(3'h4)]))}))
            begin
              reg103 <= wire95[(4'h9):(4'h8)];
              reg104 <= (^~wire97);
              reg105 <= wire10;
              reg106 <= (({wire100,
                      reg102[(2'h2):(2'h2)]} ^ ($unsigned((wire95 && wire100)) ?
                      {((8'hb9) ? reg102 : wire99),
                          (wire97 >> wire7)} : wire7[(5'h12):(4'hd)])) ?
                  $unsigned(($unsigned((wire5 - (8'hbf))) | $unsigned((reg101 ?
                      wire62 : wire61)))) : $signed($unsigned((8'hb6))));
            end
          else
            begin
              reg103 <= ((^~(~&($unsigned((8'hb8)) >>> $unsigned(reg101)))) ?
                  (((~(wire5 && (8'hb2))) ?
                      ((^~wire99) ?
                          wire12 : reg101) : $signed($unsigned(wire100))) != wire60) : (^($unsigned((^wire60)) ?
                      $signed((+wire98)) : (wire100 ?
                          $unsigned(wire100) : wire98[(4'hb):(3'h4)]))));
            end
          reg107 <= {$signed(wire5)};
          reg108 <= ((^(wire12 * ((wire10 ? wire60 : wire98) ^~ (wire11 ?
              wire99 : (8'h9c))))) ^~ {wire61});
          reg109 <= $unsigned($unsigned($unsigned(reg108)));
        end
      else
        begin
          reg102 <= (~&$unsigned($unsigned($unsigned($unsigned(reg108)))));
          reg103 <= ((({{wire99}} ?
              ((reg104 ? wire98 : wire7) ?
                  $signed(wire58) : wire95[(4'h8):(3'h6)]) : (8'haf)) == $unsigned({wire100})) > $signed(wire9[(2'h3):(1'h0)]));
          reg104 <= $unsigned($unsigned((~^((reg104 ?
              reg104 : reg105) && wire60))));
          if (($unsigned((wire95 > ((wire7 >> (8'hb0)) >>> wire60))) ^ (^$unsigned(wire12[(3'h6):(2'h3)]))))
            begin
              reg105 <= wire10;
              reg106 <= wire100;
              reg107 <= reg109[(1'h0):(1'h0)];
            end
          else
            begin
              reg105 <= wire9;
              reg106 <= ((+wire62[(4'he):(3'h7)]) ?
                  (8'hb3) : $unsigned($unsigned((wire98 - (~&reg102)))));
            end
          reg108 <= (|$signed((~^(^~(&wire97)))));
        end
      if ((^($signed((!wire11[(4'h8):(3'h4)])) ?
          (-{wire60[(3'h4):(1'h0)]}) : (($signed(wire58) ?
                  wire61[(2'h2):(1'h1)] : $signed(reg109)) ?
              wire62 : wire60[(2'h3):(1'h0)]))))
        begin
          reg110 <= ({({reg109} ?
                  wire10[(1'h0):(1'h0)] : $unsigned(wire12[(1'h0):(1'h0)]))} ~^ (!(reg106 < (((8'ha5) ?
                  wire5 : wire6) ?
              $signed(reg103) : reg109))));
          if ($unsigned((8'ha1)))
            begin
              reg111 <= (reg109[(3'h4):(1'h0)] + wire6[(4'hd):(2'h2)]);
            end
          else
            begin
              reg111 <= (reg104[(4'hc):(3'h5)] ?
                  wire58[(1'h0):(1'h0)] : (wire62[(5'h13):(4'ha)] * wire9));
            end
          reg112 <= $signed(wire98[(3'h6):(1'h0)]);
          if ({wire99,
              (!$unsigned(((-reg108) ?
                  (wire100 ? (8'ha1) : wire98) : reg110[(4'he):(3'h4)])))})
            begin
              reg113 <= $unsigned($signed((8'h9e)));
            end
          else
            begin
              reg113 <= reg112;
              reg114 <= ($signed((^((-wire58) ?
                  reg103 : (^wire7)))) && ($unsigned((reg105 ?
                      (-wire12) : (wire7 + reg109))) ?
                  (reg103 ? wire98 : reg105) : ((^~((8'hab) == wire58)) ?
                      ((~(8'hb2)) > $signed(wire95)) : wire12)));
              reg115 <= reg108[(2'h3):(2'h2)];
            end
          reg116 <= $signed($signed($signed($signed($signed(wire95)))));
        end
      else
        begin
          reg110 <= (^reg111[(1'h1):(1'h0)]);
          reg111 <= (wire58[(2'h2):(2'h2)] >= wire5[(4'h9):(2'h3)]);
          reg112 <= reg104;
        end
    end
  assign wire117 = reg103[(5'h13):(5'h12)];
  assign wire118 = wire10[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg119 <= wire97[(1'h1):(1'h0)];
      reg120 <= ($signed($signed(wire8)) ?
          $signed($unsigned(({reg107} >= reg114[(2'h3):(1'h1)]))) : {(8'haa)});
      if (wire61[(3'h6):(3'h4)])
        begin
          reg121 <= $unsigned((^(wire58 <<< $unsigned(reg108))));
          reg122 <= (-reg112[(4'he):(4'h8)]);
          if ((|((|{$unsigned(reg110)}) ?
              reg119 : $signed({reg111, (reg110 ? reg101 : wire98)}))))
            begin
              reg123 <= ((reg115 ?
                  ((reg106[(4'hf):(4'hc)] <<< (~|wire99)) ?
                      {(reg112 ^ reg105), (reg104 + reg105)} : ({wire61,
                              reg119} ?
                          reg112[(2'h3):(2'h3)] : $signed(wire11))) : (^$unsigned(reg114))) | wire100);
              reg124 <= (-reg115);
              reg125 <= $signed($unsigned($signed((&$unsigned(reg111)))));
              reg126 <= (-{$unsigned(reg114[(1'h1):(1'h1)]), {(^~{(8'hb4)})}});
              reg127 <= (&(~&reg108));
            end
          else
            begin
              reg123 <= ((+(8'ha3)) ?
                  (((&(&wire97)) ?
                      $unsigned($unsigned(wire118)) : (reg127 != reg112)) <= reg101[(1'h0):(1'h0)]) : (reg119 ~^ {($signed((8'hb8)) != reg122[(2'h3):(2'h2)]),
                      reg126}));
              reg124 <= reg125;
              reg125 <= ($signed(reg122[(2'h2):(1'h1)]) ?
                  reg124 : $signed((~&{(~&wire60)})));
              reg126 <= reg113;
              reg127 <= ((8'ha7) ? reg116 : reg107);
            end
          reg128 <= $signed($unsigned($unsigned($signed(reg101))));
        end
      else
        begin
          reg121 <= (((!$signed(reg111[(4'hd):(2'h3)])) ?
                  (($signed(wire12) ? (8'ha8) : (|reg114)) ?
                      ($unsigned(reg128) ^ $unsigned(reg114)) : wire99) : ($unsigned(reg124[(2'h3):(2'h2)]) || ($signed(wire100) && wire8[(1'h1):(1'h0)]))) ?
              $signed((^~{(+reg101)})) : (wire6 == reg116[(3'h4):(1'h1)]));
          reg122 <= (!$unsigned((reg105[(3'h5):(1'h1)] ?
              wire10 : $signed((wire60 ? wire7 : reg125)))));
          reg123 <= wire10;
        end
      reg129 <= $unsigned($signed($signed(((reg114 <<< reg126) >= reg120[(5'h13):(5'h13)]))));
      reg130 <= wire7;
    end
  assign wire131 = ($signed((wire6 ?
                       reg111[(4'ha):(2'h2)] : $unsigned($unsigned((8'h9c))))) ^ (~|(8'ha5)));
  always
    @(posedge clk) begin
      reg132 <= wire118;
      reg133 <= wire131[(4'he):(2'h2)];
    end
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire signed [(3'h4):(1'h0)] wire66;
  input wire [(3'h5):(1'h0)] wire65;
  input wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg80,
                 (1'h0)};
  assign wire68 = {({wire67, (wire64[(4'ha):(4'ha)] <= (^(8'hba)))} ?
                          (wire67 ?
                              wire65[(1'h0):(1'h0)] : (~^{(8'hae),
                                  wire66})) : {wire64})};
  assign wire69 = ((wire66 + $signed(({wire67} ?
                          wire67[(3'h5):(2'h3)] : $unsigned(wire66)))) ?
                      $signed({$unsigned((!wire68)),
                          $signed((!wire65))}) : (($unsigned({(8'hae)}) ~^ wire64[(1'h0):(1'h0)]) >= wire67));
  assign wire70 = $signed(wire67[(3'h5):(1'h1)]);
  assign wire71 = $signed((wire65[(3'h4):(1'h0)] ?
                      wire68 : $unsigned(wire66[(2'h2):(1'h0)])));
  assign wire72 = {wire71,
                      (~&{$unsigned(wire70),
                          ((wire64 | wire66) || (~^wire64))})};
  assign wire73 = wire66[(3'h4):(1'h1)];
  assign wire74 = wire69[(3'h6):(2'h2)];
  assign wire75 = wire70[(4'h9):(1'h1)];
  assign wire76 = $unsigned((^{(-(wire73 | wire71)), wire67[(4'h9):(2'h3)]}));
  assign wire77 = wire64[(3'h4):(2'h2)];
  assign wire78 = ((8'hbc) ?
                      (~|(^~$unsigned($signed(wire70)))) : (wire67 ~^ wire75));
  assign wire79 = $signed((8'hbd));
  always
    @(posedge clk) begin
      reg80 <= (&($unsigned($unsigned($unsigned(wire66))) != wire77[(5'h10):(5'h10)]));
    end
  assign wire81 = ((wire65[(1'h0):(1'h0)] ?
                      (wire65[(2'h2):(1'h1)] ?
                          (+wire73[(4'h8):(3'h5)]) : ($unsigned(wire69) <= wire74)) : wire66[(1'h1):(1'h0)]) - wire71[(2'h2):(2'h2)]);
  assign wire82 = {wire68[(3'h7):(1'h0)],
                      $signed(({wire74[(2'h3):(1'h1)]} ?
                          ((wire72 ?
                              wire78 : wire79) & (wire74 < wire78)) : (wire78 ?
                              ((7'h42) <= wire65) : $unsigned(wire73))))};
  assign wire83 = wire73;
  assign wire84 = ($signed(wire72) ?
                      {{{(wire71 | wire77)}}} : (((~|reg80[(3'h6):(2'h2)]) || {$unsigned(wire68)}) - (^$unsigned($unsigned(wire67)))));
  assign wire85 = $unsigned((&$signed(wire67[(3'h7):(3'h4)])));
  assign wire86 = $unsigned($signed(wire68));
  assign wire87 = (&wire66);
  always
    @(posedge clk) begin
      reg88 <= wire75[(3'h6):(3'h5)];
    end
  always
    @(posedge clk) begin
      if (wire71[(1'h0):(1'h0)])
        begin
          reg89 <= wire65[(3'h5):(2'h2)];
        end
      else
        begin
          reg89 <= $unsigned(((-$unsigned(wire72[(4'ha):(2'h2)])) > (~|$unsigned({wire68}))));
          reg90 <= {wire68,
              (($signed(wire65) ?
                  wire79[(3'h5):(3'h5)] : ($unsigned((8'hb8)) ~^ wire77[(4'h8):(2'h3)])) <= (wire79[(3'h6):(3'h6)] ?
                  wire86[(2'h3):(1'h1)] : (reg88 ^ (7'h44))))};
          if ((~|reg80))
            begin
              reg91 <= (~(~^$signed(((~&(8'hb2)) << reg88[(3'h6):(3'h4)]))));
              reg92 <= {(+(~^wire84[(2'h3):(2'h3)])),
                  ($signed((wire64 <<< $unsigned(reg90))) ?
                      ({wire65[(2'h3):(2'h2)]} ?
                          {$unsigned(wire70)} : (((8'ha5) & (8'ha4)) ?
                              wire65 : $unsigned((8'ha1)))) : (wire86[(1'h1):(1'h0)] ?
                          wire67 : $signed(wire86[(1'h0):(1'h0)])))};
            end
          else
            begin
              reg91 <= (&(~((|(~wire74)) && $unsigned($unsigned(wire81)))));
            end
          reg93 <= (reg90[(5'h13):(4'h9)] >= $unsigned(wire76[(1'h1):(1'h0)]));
        end
      reg94 <= (8'hba);
    end
endmodule

module module13
#(parameter param57 = (({((~^(8'hb3)) * {(8'hb4)})} ? {(7'h40)} : (-((~|(8'hb2)) ? ((8'h9f) || (8'had)) : ((8'hae) ? (8'hbe) : (8'hb9))))) ? (~((((8'ha1) ? (8'hb5) : (8'hbc)) ? {(8'ha9), (8'hb8)} : {(8'ha1), (8'hb8)}) ? (((8'ha1) ? (8'haa) : (8'hb3)) >> {(8'hb7), (8'hb6)}) : {((8'ha9) > (8'haa))})) : ((({(8'h9c), (8'ha8)} ? ((8'hb2) | (8'ha8)) : (~|(8'ha8))) && {(~|(7'h41)), ((8'ha8) | (7'h41))}) ? (+(~(~|(8'ha8)))) : ((((8'hb1) - (7'h44)) ? ((8'had) ? (8'ha0) : (8'h9d)) : ((8'hbb) ? (7'h44) : (8'haf))) ? (((8'h9e) | (8'ha6)) + ((8'hb0) ? (8'ha1) : (8'ha3))) : ((|(8'ha7)) ? (-(8'hae)) : (~|(8'hb1)))))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire46,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire18 = wire17;
  assign wire19 = $unsigned(wire16[(3'h6):(1'h0)]);
  assign wire20 = wire14;
  assign wire21 = ({{$unsigned(wire17),
                          $signed((wire14 | wire14))}} ^ wire18[(3'h4):(2'h2)]);
  assign wire22 = wire18;
  assign wire23 = $unsigned(wire19);
  always
    @(posedge clk) begin
      reg24 <= (wire20[(4'he):(4'hd)] ?
          wire15[(3'h6):(3'h6)] : ((wire14[(3'h5):(1'h0)] - wire20) ?
              {$unsigned(wire19[(4'hc):(3'h5)])} : $signed((~&$unsigned(wire16)))));
      if ($unsigned((~&(!wire19))))
        begin
          reg25 <= (reg24[(4'h9):(2'h2)] >>> ((wire20[(4'ha):(3'h5)] + $unsigned($unsigned(wire20))) <<< (wire14 <<< $unsigned((^~wire21)))));
          reg26 <= ($signed($signed((^(~(8'hbf))))) ?
              (reg25[(1'h0):(1'h0)] ? wire19 : wire20[(2'h2):(2'h2)]) : reg24);
          reg27 <= ($signed((^$unsigned({(8'ha2)}))) ?
              $unsigned($signed($signed(wire23))) : reg24[(3'h4):(1'h0)]);
          reg28 <= $unsigned((wire23[(3'h6):(3'h4)] ?
              $unsigned((&wire16[(3'h7):(3'h7)])) : (8'ha2)));
          reg29 <= ({$unsigned(reg28),
                  (wire15[(4'h9):(1'h1)] <= {(7'h42), (~wire16)})} ?
              (~|wire21[(4'hd):(4'hc)]) : $unsigned($signed(reg25)));
        end
      else
        begin
          reg25 <= reg28[(3'h5):(3'h5)];
          reg26 <= ((+(((wire23 < wire17) ?
                  $unsigned(reg27) : (-wire21)) >>> $unsigned((reg29 < wire23)))) ?
              ({wire16} ?
                  ((|((8'ha3) ? (8'hbd) : reg28)) ?
                      ((+wire21) & reg26[(1'h1):(1'h1)]) : {wire17[(4'hb):(4'h8)],
                          {wire19}}) : {((8'hae) ? wire16 : wire22),
                      ($signed(reg25) ?
                          (wire20 ?
                              (8'hba) : wire14) : $unsigned(reg29))}) : (reg25[(1'h1):(1'h0)] ?
                  wire23 : {wire18[(5'h10):(4'h8)]}));
          reg27 <= $unsigned(($signed((&$unsigned(wire23))) ?
              $signed(((+wire23) ?
                  reg27[(3'h6):(1'h0)] : wire22)) : ({$unsigned(wire22)} >>> wire21[(4'hb):(3'h4)])));
        end
      reg30 <= $signed((~|wire19));
    end
  assign wire31 = $unsigned($signed(wire19[(4'h8):(4'h8)]));
  assign wire32 = (8'hb0);
  always
    @(posedge clk) begin
      reg33 <= {((8'h9c) ? ($signed(reg25) && wire18) : wire20[(4'h8):(2'h2)]),
          $unsigned(wire14)};
    end
  assign wire34 = $signed(($unsigned($signed($unsigned((7'h40)))) ^ (^{wire14[(1'h1):(1'h1)]})));
  assign wire35 = (+wire31);
  always
    @(posedge clk) begin
      reg36 <= ((+$unsigned(reg24)) ?
          ($unsigned(wire16[(1'h0):(1'h0)]) == $unsigned(((^wire16) ?
              $unsigned((8'hb2)) : wire35))) : (7'h43));
      if (reg29[(1'h0):(1'h0)])
        begin
          reg37 <= $unsigned($unsigned((((wire17 >>> wire23) | (~reg30)) ?
              (~&reg28) : (!(reg33 ? (8'ha1) : wire17)))));
        end
      else
        begin
          reg37 <= $signed($unsigned(wire14[(3'h7):(3'h4)]));
          reg38 <= $signed((^$signed((|$unsigned((8'ha1))))));
          reg39 <= $unsigned((|wire17));
          reg40 <= $signed($signed(($signed({(8'hbc), reg24}) ?
              $unsigned((wire35 ? reg39 : wire19)) : {$unsigned(wire34)})));
          reg41 <= reg29[(3'h4):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      reg42 <= (reg36 >>> reg30);
      reg43 <= reg39;
      reg44 <= $unsigned(((((~reg27) ? {wire16, reg33} : $unsigned(wire21)) ?
          $unsigned((wire19 < wire15)) : $signed(reg30)) ^~ wire18[(1'h0):(1'h0)]));
      reg45 <= ({$signed((^~((7'h44) >> (8'h9e)))),
              $unsigned(($unsigned(wire14) ?
                  (wire19 >>> reg26) : {wire17, (8'ha0)}))} ?
          {$unsigned((8'hbc)),
              $signed((-((8'hb9) ?
                  wire18 : (8'hb1))))} : (((|$unsigned(wire17)) >> (&reg37[(4'he):(4'hd)])) ?
              $signed(wire34) : (reg37[(4'hb):(1'h1)] & ($unsigned(reg28) ?
                  (~|reg41) : wire34[(1'h1):(1'h1)]))));
    end
  assign wire46 = $signed($unsigned((~|$signed($unsigned(wire15)))));
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned((wire14 ? reg27 : (8'hbc))) ?
          $signed(wire17) : $unsigned((-reg39))) == (wire21 < ((^wire16) ?
          $unsigned(reg39) : $signed(reg43))))))
        begin
          if (wire23[(3'h7):(1'h0)])
            begin
              reg47 <= ($signed((((wire16 ?
                  wire35 : (8'haf)) << reg37[(4'hd):(3'h5)]) || ($signed(wire46) ?
                  (reg40 >> reg24) : $unsigned(reg40)))) | (^~{(8'had),
                  wire31[(4'ha):(3'h4)]}));
              reg48 <= wire16;
            end
          else
            begin
              reg47 <= reg26[(3'h4):(2'h2)];
            end
          reg49 <= $signed(reg39);
          reg50 <= $unsigned({((reg37[(2'h3):(1'h1)] < (reg37 ?
                  wire34 : reg37)) || (reg45[(1'h0):(1'h0)] * (wire46 <= reg36))),
              (reg47 > $unsigned((reg47 ? wire34 : reg36)))});
          reg51 <= $signed((&(8'ha5)));
          reg52 <= $signed(((^$signed((~&wire34))) ?
              $unsigned((-reg51[(2'h3):(2'h2)])) : ($signed($unsigned(reg50)) ?
                  $unsigned($signed(reg51)) : wire17)));
        end
      else
        begin
          reg47 <= ({$unsigned(wire46)} ?
              ($unsigned(((reg33 ?
                  wire21 : (8'hbf)) & reg36)) > (^~{reg33[(2'h3):(1'h1)],
                  reg27})) : ($signed((^(reg47 << reg52))) ?
                  ((-(~&(8'hb2))) ?
                      ((wire18 - reg52) ?
                          {(8'hb1)} : $unsigned(wire31)) : (8'hbd)) : (~^reg37[(3'h5):(3'h4)])));
        end
    end
  assign wire53 = $signed(wire18[(4'h8):(3'h4)]);
  assign wire54 = wire18[(4'hf):(3'h6)];
  assign wire55 = (8'ha9);
  assign wire56 = $signed(wire54[(5'h10):(2'h2)]);
endmodule
