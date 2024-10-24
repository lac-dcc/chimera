module top
#(parameter param142 = (~&(^~({((8'hae) ^ (8'ha6)), (^(8'hae))} <<< (&((8'hbf) ? (8'h9e) : (8'ha8)))))), 
parameter param143 = (^(&(param142 == param142))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire137;
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire4,
                 wire54,
                 wire69,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire137,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire2));
  module5 #() modinst55 (wire54, clk, wire2, wire1, wire0, wire4);
  always
    @(posedge clk) begin
      reg56 <= ($signed({((wire0 > wire4) + {(8'h9c)}), (~|$signed((8'h9d)))}) ?
          (wire4[(4'hb):(4'ha)] ?
              (($signed(wire1) > (-wire54)) ? (8'ha8) : wire3) : (({wire2,
                      wire1} ?
                  wire2[(1'h0):(1'h0)] : wire3[(1'h0):(1'h0)]) >= ((^~wire54) ?
                  (-(7'h40)) : {wire1,
                      wire1}))) : $signed((($unsigned((8'hbd)) && $unsigned(wire54)) & ((wire0 ?
              wire0 : wire2) == (|(7'h43))))));
      if (wire54[(2'h2):(2'h2)])
        begin
          if (((8'hb1) ?
              $unsigned((^~(!{wire3}))) : (&$unsigned(wire3[(4'h9):(2'h3)]))))
            begin
              reg57 <= wire4;
              reg58 <= reg56[(5'h10):(4'he)];
              reg59 <= {wire0[(1'h1):(1'h1)], $signed((8'h9c))};
              reg60 <= ((-(^~$signed((~^reg56)))) ?
                  ((~|{reg59, $unsigned(reg59)}) ?
                      $signed({$unsigned(reg57)}) : {(reg57[(5'h12):(2'h2)] ?
                              (wire1 >>> (8'ha4)) : (wire3 >>> (7'h43))),
                          ({wire54, wire0} ?
                              $signed(reg58) : (&wire0))}) : $signed((+((wire1 ?
                          reg58 : wire2) ?
                      $unsigned((8'hb8)) : (wire0 || (8'h9e))))));
            end
          else
            begin
              reg57 <= ($signed((wire3[(4'hf):(1'h0)] ?
                      (~^$signed(reg60)) : $signed(wire2[(2'h3):(1'h0)]))) ?
                  wire0 : $unsigned(wire3));
            end
          if (wire0[(1'h1):(1'h1)])
            begin
              reg61 <= $unsigned((wire1 << (^wire54[(1'h0):(1'h0)])));
              reg62 <= (|$signed(reg58));
              reg63 <= reg58;
              reg64 <= $signed($unsigned((8'hb7)));
              reg65 <= (8'hb6);
            end
          else
            begin
              reg61 <= ({wire54[(2'h2):(1'h0)],
                  $unsigned(((^~reg62) + $signed(reg57)))} ^ wire1[(4'hc):(4'h8)]);
              reg62 <= {wire54[(2'h3):(2'h3)], {reg64}};
              reg63 <= reg56;
              reg64 <= (^~((reg62[(5'h11):(3'h7)] << reg58[(4'hd):(4'hd)]) >= (~$unsigned(((8'ha5) ?
                  reg61 : reg65)))));
            end
          reg66 <= $unsigned((((-(reg65 ~^ reg60)) ?
              (~|reg63) : ($signed(wire1) - reg58[(1'h0):(1'h0)])) ^~ $unsigned((~wire54))));
          reg67 <= $signed((+{$unsigned({reg59})}));
        end
      else
        begin
          reg57 <= $unsigned((reg57 ?
              {(~|reg59[(3'h7):(3'h6)]),
                  $unsigned($unsigned(reg62))} : $unsigned((|wire3[(4'hc):(4'h8)]))));
          reg58 <= (((!reg59[(5'h12):(1'h0)]) ?
                  reg60 : ($signed(reg60[(2'h3):(1'h0)]) ?
                      reg59 : (~^$unsigned(reg64)))) ?
              wire3[(2'h2):(1'h1)] : wire4[(4'hc):(3'h5)]);
          reg59 <= $unsigned({$signed((reg61 ? (wire2 < reg60) : (-reg67))),
              $signed($unsigned((reg66 ? reg62 : wire4)))});
          reg60 <= (((8'h9f) ^~ $signed(reg57[(2'h3):(2'h3)])) ?
              ($signed(($signed(reg63) ^~ (&reg65))) != (|$signed((reg56 ?
                  wire54 : reg65)))) : $unsigned(wire54[(3'h6):(1'h1)]));
          reg61 <= reg64[(4'hd):(2'h2)];
        end
      reg68 <= reg57;
    end
  assign wire69 = ($unsigned(reg67[(1'h0):(1'h0)]) ?
                      (wire2[(5'h12):(2'h3)] ^ reg56[(2'h3):(2'h2)]) : $signed(($signed(reg59) ?
                          reg59[(5'h12):(3'h7)] : (-$unsigned(reg62)))));
  always
    @(posedge clk) begin
      if (($unsigned(reg57[(5'h11):(5'h10)]) ^ $signed($signed((reg58[(4'hf):(4'hb)] ?
          wire0[(3'h7):(3'h4)] : {reg57, reg66})))))
        begin
          reg70 <= $unsigned(reg59[(3'h6):(1'h1)]);
          reg71 <= (~|reg58[(4'he):(3'h4)]);
          reg72 <= reg61;
        end
      else
        begin
          reg70 <= (8'h9e);
          if ($unsigned(((reg64[(2'h3):(2'h3)] - $unsigned(reg61)) ?
              $signed($signed((reg56 + reg65))) : ((|$signed(wire4)) ?
                  reg65 : $signed($signed(reg70))))))
            begin
              reg71 <= $signed($unsigned(wire3));
              reg72 <= reg58[(2'h3):(2'h2)];
              reg73 <= reg56[(2'h2):(1'h0)];
              reg74 <= wire0[(3'h4):(2'h2)];
            end
          else
            begin
              reg71 <= {wire69[(2'h3):(2'h2)]};
            end
        end
      reg75 <= wire1[(4'ha):(1'h0)];
      reg76 <= (!(~|reg70[(3'h4):(1'h0)]));
      reg77 <= $unsigned(($unsigned(reg56[(2'h3):(2'h3)]) ?
          $unsigned(reg57[(4'ha):(3'h7)]) : (reg57 ?
              (reg67[(2'h2):(2'h2)] ?
                  ((8'hbb) && reg71) : (reg76 << wire69)) : reg56[(2'h3):(2'h3)])));
    end
  assign wire78 = (($unsigned((|(wire69 ?
                      (8'hba) : wire69))) - reg76) == {(+$signed({reg61,
                          reg72}))});
  assign wire79 = reg71;
  assign wire80 = $signed(reg77);
  assign wire81 = $unsigned($signed((~&($unsigned(wire3) && (7'h44)))));
  module82 #() modinst138 (.y(wire137), .clk(clk), .wire83(reg74), .wire85(wire79), .wire84(reg63), .wire86(reg70));
  assign wire139 = (reg56[(5'h10):(4'he)] ?
                       wire4[(3'h7):(3'h4)] : (reg66[(5'h10):(3'h5)] ?
                           $signed((!wire80)) : ((8'ha1) ?
                               reg71 : {reg74[(1'h1):(1'h0)],
                                   ((8'ha0) ? reg59 : reg60)})));
  assign wire140 = (reg64 ?
                       wire80 : (($signed(((8'h9f) ? reg63 : (8'ha0))) ?
                               $unsigned($signed(wire1)) : reg73[(1'h1):(1'h0)]) ?
                           $unsigned(($signed(reg74) ?
                               reg68[(4'hc):(1'h0)] : reg77)) : (8'ha9)));
  assign wire141 = $unsigned(reg61);
endmodule

module module82
#(parameter param136 = ({((^~((7'h40) == (8'hb8))) > (&((8'h9d) ? (8'hb1) : (8'haa)))), ((((8'hbc) ? (7'h42) : (8'ha1)) ? ((7'h41) ^~ (8'hbd)) : ((8'ha3) >= (8'hbc))) ? ((~^(8'h9e)) ? (-(8'hbb)) : ((8'hbd) >> (8'ha4))) : {((7'h44) ? (8'ha9) : (8'ha4)), ((8'hbb) ? (8'hbd) : (8'hb8))})} ? (~^(8'hb6)) : ({((-(8'h9c)) ? ((8'hb4) ? (7'h41) : (8'hae)) : ((8'hab) ? (8'hae) : (8'hae)))} || (({(8'ha4)} >>> (-(8'hb1))) | (8'ha9)))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire86;
  input wire [(3'h7):(1'h0)] wire85;
  input wire signed [(5'h11):(1'h0)] wire84;
  input wire [(4'h8):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  assign y = {wire135,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire89,
                 wire88,
                 wire87,
                 reg134,
                 reg133,
                 reg132,
                 reg130,
                 reg125,
                 reg124,
                 reg123,
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
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire87 = $unsigned({$signed(($signed((8'hae)) ?
                          wire86 : $unsigned(wire85)))});
  assign wire88 = $unsigned(wire86);
  assign wire89 = {($unsigned($signed((wire86 < wire85))) ?
                          wire83 : $unsigned({$signed(wire83),
                              $signed(wire88)})),
                      $signed($unsigned(wire84[(4'h8):(3'h5)]))};
  always
    @(posedge clk) begin
      reg90 <= (8'hb6);
      reg91 <= wire88[(1'h0):(1'h0)];
      reg92 <= reg90;
    end
  assign wire93 = reg91[(2'h3):(1'h0)];
  assign wire94 = wire84;
  assign wire95 = (~|(!$signed((8'ha1))));
  assign wire96 = ($signed({(8'haf), $signed((wire84 <= wire84))}) ?
                      ($unsigned(wire84) ?
                          (({wire93, wire86} ?
                                  (wire87 != wire94) : (wire83 > wire89)) ?
                              {(wire85 * reg90),
                                  $signed(wire83)} : (7'h42)) : (wire85[(3'h5):(1'h0)] | wire84)) : (wire83[(1'h0):(1'h0)] ?
                          wire88 : $unsigned(wire84[(3'h7):(3'h6)])));
  assign wire97 = {wire86, ($signed(wire87) == ((8'haa) | $signed(wire95)))};
  assign wire98 = wire94;
  assign wire99 = (^~(^$signed($signed(wire85))));
  always
    @(posedge clk) begin
      reg100 <= ((^~wire84[(4'ha):(2'h3)]) ?
          wire93[(1'h0):(1'h0)] : ($signed((^~(&wire93))) & ((wire96 <<< {wire98,
              reg92}) * ((^wire95) ? (wire87 << wire97) : $signed((8'hbc))))));
      reg101 <= (reg90 >>> wire96);
      if ((reg101[(4'hc):(4'hc)] ?
          $signed($signed(reg91[(2'h2):(1'h1)])) : reg91[(2'h2):(1'h1)]))
        begin
          reg102 <= $unsigned($signed($unsigned($unsigned($signed(wire99)))));
          reg103 <= ((~&({wire94} ?
              {(wire93 && wire99)} : wire88[(2'h2):(2'h2)])) << wire96);
          reg104 <= {$unsigned(($signed((wire84 >= wire95)) ^ ($unsigned(wire94) - wire89))),
              wire94};
        end
      else
        begin
          if (($signed(($unsigned((wire95 ? reg100 : (8'hb7))) ?
                  wire94[(3'h4):(2'h2)] : ($unsigned(wire89) ?
                      wire95 : wire84))) ?
              wire99[(2'h2):(2'h2)] : wire85[(1'h0):(1'h0)]))
            begin
              reg102 <= {wire84};
            end
          else
            begin
              reg102 <= (reg92 < wire93[(3'h6):(3'h6)]);
              reg103 <= $unsigned({(7'h44),
                  (~$unsigned((wire85 ? wire88 : reg92)))});
              reg104 <= reg92[(4'ha):(3'h6)];
              reg105 <= (!$unsigned((+wire89[(4'he):(2'h3)])));
            end
          if ({(|(((wire94 < wire87) ?
                      $signed(reg101) : (wire89 ? (8'hba) : (8'ha6))) ?
                  $signed((8'hab)) : $unsigned(wire98))),
              (8'hb9)})
            begin
              reg106 <= reg103[(2'h2):(1'h0)];
              reg107 <= $signed($signed($unsigned(wire94)));
              reg108 <= ((^~$signed($signed($unsigned(wire93)))) ?
                  {reg91[(2'h3):(1'h0)]} : reg91[(1'h0):(1'h0)]);
              reg109 <= {wire88};
              reg110 <= wire97[(4'h9):(4'h9)];
            end
          else
            begin
              reg106 <= $signed((|$unsigned($signed($signed(reg103)))));
              reg107 <= ($signed(({(~|wire85)} || (8'ha2))) < {(!(&(wire98 ?
                      reg91 : wire88))),
                  (wire96[(4'h8):(3'h7)] || ($signed(wire97) ^~ {wire85,
                      wire85}))});
            end
          if ($unsigned((!$unsigned((8'hbc)))))
            begin
              reg111 <= $signed((~$unsigned({wire98, (|(8'hb1))})));
              reg112 <= (+$signed((($signed(wire95) ?
                      (~^reg102) : $signed((8'haf))) ?
                  wire84[(4'h9):(3'h5)] : {((8'h9c) ^ reg105)})));
              reg113 <= (|reg106[(5'h10):(4'h9)]);
              reg114 <= reg102[(4'hd):(2'h3)];
              reg115 <= (~|$signed($signed((~&$unsigned(wire85)))));
            end
          else
            begin
              reg111 <= reg102;
              reg112 <= (wire96 ?
                  $unsigned($unsigned((!((8'hb5) | (8'hb8))))) : (wire84[(4'he):(3'h4)] ?
                      wire93 : (~^wire85)));
            end
        end
      if ($signed(reg111[(4'h9):(3'h6)]))
        begin
          reg116 <= $signed((~^reg104));
          reg117 <= (({wire95[(1'h0):(1'h0)], ($signed(reg102) - reg102)} ?
              (reg102 ?
                  $signed((reg102 > wire84)) : reg109) : ({$signed(wire87),
                  $unsigned(wire88)} ~^ wire84)) > ((&$signed((wire85 || (8'ha7)))) & wire88));
          reg118 <= (|reg92);
          reg119 <= (&(wire87[(1'h1):(1'h0)] ?
              {$unsigned(reg105),
                  ((wire83 != wire85) != {reg102,
                      reg109})} : reg91[(1'h0):(1'h0)]));
          if ((wire85[(2'h3):(1'h1)] ?
              $unsigned((((reg105 < wire85) ?
                      (wire94 ? (8'had) : wire93) : ((8'hb2) - wire95)) ?
                  ((reg102 ? (8'hb4) : reg101) ?
                      (^wire94) : (wire94 ?
                          reg104 : reg101)) : $unsigned($unsigned(reg100)))) : (+$signed(($unsigned(reg106) ?
                  (wire94 << reg103) : wire97)))))
            begin
              reg120 <= reg91;
              reg121 <= (^~reg90[(3'h6):(2'h3)]);
              reg122 <= $signed(((wire96 + (8'hbf)) ^~ {reg92[(4'h9):(3'h6)]}));
              reg123 <= wire84;
              reg124 <= {wire88[(2'h2):(2'h2)],
                  (reg107 >>> $unsigned({reg91, $signed(reg92)}))};
            end
          else
            begin
              reg120 <= $signed(wire94);
              reg121 <= $unsigned((reg119[(4'h8):(3'h7)] || reg101));
              reg122 <= $unsigned($signed($unsigned(($unsigned(reg106) >= $unsigned(reg101)))));
              reg123 <= (~(-(~|(&$signed(wire98)))));
              reg124 <= $unsigned((($unsigned(wire93[(2'h3):(2'h2)]) << ($unsigned(reg107) ?
                      $signed(reg100) : reg103[(1'h0):(1'h0)])) ?
                  (~^{(~&wire96), $signed(reg119)}) : wire88));
            end
        end
      else
        begin
          reg116 <= reg106[(3'h7):(2'h2)];
          if ($unsigned((!(($unsigned(reg121) ?
                  (reg102 ? wire96 : (8'hab)) : reg116) ?
              (reg104 ?
                  (reg118 ? reg102 : wire95) : {reg91,
                      wire84}) : ((+reg123) <= $unsigned(reg111))))))
            begin
              reg117 <= wire87[(1'h0):(1'h0)];
              reg118 <= wire89;
              reg119 <= wire97;
              reg120 <= {($unsigned(reg105[(1'h0):(1'h0)]) - (reg120 ?
                      $unsigned((7'h43)) : ($signed(reg112) ?
                          (wire87 ? reg105 : reg121) : (+reg106)))),
                  $signed({reg102})};
            end
          else
            begin
              reg117 <= wire95[(1'h0):(1'h0)];
              reg118 <= wire89[(4'h8):(3'h5)];
            end
        end
      reg125 <= $signed(wire88[(3'h5):(2'h3)]);
    end
  assign wire126 = $signed({reg113});
  assign wire127 = $unsigned({wire99[(1'h1):(1'h1)]});
  assign wire128 = (8'h9d);
  assign wire129 = wire98;
  always
    @(posedge clk) begin
      reg130 <= (|$unsigned(reg117[(4'hd):(4'hc)]));
    end
  assign wire131 = $unsigned($unsigned((wire85 && {reg125[(1'h1):(1'h1)],
                       (reg111 >>> reg117)})));
  always
    @(posedge clk) begin
      reg132 <= (~reg119);
      reg133 <= $signed((&($unsigned($signed(reg130)) ?
          (7'h42) : {wire129, (wire95 ? wire99 : reg107)})));
      reg134 <= {(~&(reg105 ^ ((wire89 - wire99) * ((8'ha7) || reg132))))};
    end
  assign wire135 = reg100;
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire38,
                 wire36,
                 wire12,
                 wire11,
                 wire10,
                 reg51,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire10 = (^~$unsigned((((^(7'h40)) <= wire6) != {wire6})));
  assign wire11 = wire9[(5'h13):(1'h0)];
  assign wire12 = $unsigned(($signed((&wire8)) ?
                      $signed(({(8'ha1),
                          wire7} << $unsigned(wire10))) : (^(&(wire11 ?
                          wire10 : wire8)))));
  module13 #() modinst37 (wire36, clk, wire6, wire7, wire12, wire11);
  assign wire38 = wire6[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg39 <= $signed($signed((8'hbf)));
      if ((~^(|(&($unsigned(wire12) ? $unsigned(wire6) : (|wire6))))))
        begin
          if ($unsigned((wire38[(1'h0):(1'h0)] >> wire12)))
            begin
              reg40 <= $signed(reg39);
              reg41 <= (($signed(wire6) * (wire8[(4'hf):(4'h9)] || ((^wire12) ?
                      (8'ha2) : (~wire8)))) ?
                  (wire6 ~^ {$unsigned($signed((8'hb1))),
                      {wire11, $signed(wire6)}}) : wire38[(5'h10):(4'he)]);
              reg42 <= ((wire6 <<< ((~|$signed(wire38)) ?
                      (wire8 ? (&wire8) : (!(7'h44))) : $signed({reg41,
                          reg39}))) ?
                  $unsigned((~(~(wire9 ^ wire9)))) : (7'h41));
              reg43 <= wire6[(4'ha):(4'h8)];
            end
          else
            begin
              reg40 <= (~reg40);
              reg41 <= $unsigned((wire11[(4'h9):(2'h2)] & (-$unsigned(wire11))));
              reg42 <= ($signed(({(8'had)} ? wire7 : wire7)) == (!reg42));
            end
          reg44 <= wire9[(4'hb):(3'h7)];
          reg45 <= reg44[(3'h5):(3'h4)];
        end
      else
        begin
          reg40 <= ({$unsigned(((|(8'hb9)) ? (&wire38) : wire9))} ?
              wire38 : (reg39 ?
                  $unsigned((^(reg39 ?
                      reg42 : wire12))) : wire9[(4'he):(4'hc)]));
          if (({$signed(wire10), (8'hb2)} == ($signed(wire9[(4'hb):(3'h6)]) ?
              wire38[(3'h4):(3'h4)] : wire6[(3'h7):(3'h7)])))
            begin
              reg41 <= {wire11,
                  (wire11[(3'h7):(3'h4)] ?
                      $signed(wire38[(4'h9):(3'h4)]) : wire8)};
              reg42 <= ($signed(((~|$unsigned(wire8)) ?
                  wire11[(4'he):(4'hd)] : (~^{reg44}))) >> ($unsigned(reg40[(3'h5):(1'h1)]) ?
                  {reg44} : (wire11 < $signed({wire9, wire11}))));
              reg43 <= ($unsigned(({(reg40 > reg41)} & (&(wire6 ?
                  reg41 : wire10)))) ~^ (!reg44[(1'h1):(1'h0)]));
              reg44 <= {(8'ha2), $signed(wire10[(3'h7):(1'h1)])};
            end
          else
            begin
              reg41 <= wire12[(3'h5):(2'h2)];
              reg42 <= (wire6 ?
                  {(($signed(wire6) ?
                          $unsigned(reg39) : $unsigned(wire10)) && $signed((~|(8'hb6))))} : reg42);
            end
        end
    end
  assign wire46 = (~&wire9[(4'he):(4'hb)]);
  assign wire47 = reg40;
  assign wire48 = (($unsigned((|(wire12 == (8'hba)))) ?
                      {$signed($signed(wire47))} : $unsigned($unsigned({wire8,
                          reg41}))) || (^wire10));
  assign wire49 = (~|{(((~&reg45) ?
                              (reg43 ? wire7 : wire48) : $unsigned(wire11)) ?
                          (8'hb8) : ((~&wire12) ? (^reg44) : $unsigned(reg41))),
                      $signed(wire12)});
  assign wire50 = (({$signed(wire9), (|$signed(wire47))} ?
                          $unsigned(reg42[(5'h12):(4'hf)]) : (^~{reg42})) ?
                      (~|(wire10 || wire36[(1'h0):(1'h0)])) : $signed(wire12[(4'hc):(4'ha)]));
  always
    @(posedge clk) begin
      reg51 <= $signed($unsigned((~^{(~wire48)})));
    end
  assign wire52 = (^~((wire50 ?
                          $signed((~^wire12)) : (wire49 ?
                              (8'ha2) : $signed(wire10))) ?
                      wire50 : ($unsigned({(8'hb7)}) ?
                          reg42 : $signed((wire38 ? wire48 : reg42)))));
  assign wire53 = ($unsigned($signed(wire36)) ?
                      ($unsigned($unsigned(wire10)) & reg39[(1'h1):(1'h1)]) : ($signed({(wire48 == wire52),
                          wire11[(3'h7):(3'h5)]}) >> ((wire36 ?
                              {wire52} : ((8'hb1) & (7'h41))) ?
                          wire36 : reg44)));
endmodule

module module13
#(parameter param34 = (((((~&(8'hae)) ? ((8'h9e) ~^ (8'hb5)) : ((8'h9e) ? (8'hb7) : (7'h42))) ? {((8'hb9) & (8'ha2))} : (8'hba)) < ((((8'hbc) && (8'had)) ? {(8'hb0), (8'ha4)} : {(8'hbf), (8'haf)}) ? ({(8'ha4)} == ((8'hb2) ? (8'haa) : (8'h9f))) : (-((8'h9c) ? (8'ha2) : (8'h9e))))) ~^ (^((+((8'hbf) != (7'h42))) > (((8'hab) <<< (8'hbc)) != ((8'ha8) * (8'hb2)))))), 
parameter param35 = param34)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire26,
                 wire19,
                 wire18,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = wire16[(3'h5):(3'h4)];
  assign wire19 = $unsigned(wire15);
  always
    @(posedge clk) begin
      reg20 <= wire16;
      reg21 <= $unsigned($signed($unsigned(reg20[(2'h2):(1'h1)])));
      reg22 <= ((reg20[(2'h3):(2'h2)] <= ({(reg20 && (8'hb6))} ?
          $signed(wire19[(3'h6):(3'h5)]) : $signed(wire17))) || $unsigned(((8'ha0) ?
          wire16 : (8'h9e))));
      reg23 <= (8'h9e);
      reg24 <= (reg21 || $signed(wire14));
    end
  always
    @(posedge clk) begin
      reg25 <= reg20;
    end
  assign wire26 = $unsigned(wire15);
  always
    @(posedge clk) begin
      reg27 <= $unsigned(reg23[(1'h0):(1'h0)]);
      reg28 <= {(~(reg21[(4'ha):(4'ha)] | reg25))};
    end
  assign wire29 = $signed(((reg27 || $signed(reg25[(2'h3):(1'h1)])) ?
                      $unsigned(wire26) : wire15));
  assign wire30 = (wire29[(3'h6):(3'h5)] == reg27[(3'h5):(3'h4)]);
  assign wire31 = $unsigned(reg27[(1'h0):(1'h0)]);
  assign wire32 = reg23[(2'h2):(1'h1)];
  assign wire33 = wire32[(3'h7):(1'h1)];
endmodule
