module top
#(parameter param145 = (~&(~&(~|(((8'hbf) >> (8'hb8)) <<< {(8'hb2)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire142;
  assign y = {wire144, wire4, wire5, wire142, (1'h0)};
  assign wire4 = (wire3 < {wire1[(4'h9):(2'h2)]});
  assign wire5 = ($unsigned((^$signed({wire3, wire3}))) ?
                     wire2 : {($unsigned($unsigned(wire1)) ?
                             ($signed((8'hb2)) ?
                                 (|wire2) : wire2[(4'hb):(3'h7)]) : (((8'hb0) ?
                                 wire3 : wire4) < (wire1 == wire1)))});
  module6 #() modinst143 (.wire11(wire1), .wire9(wire4), .wire7(wire0), .wire10(wire2), .y(wire142), .wire8(wire5), .clk(clk));
  assign wire144 = (~^$unsigned(wire2));
endmodule

module module6
#(parameter param140 = (((-(((8'ha1) >= (8'ha4)) ? {(7'h42), (7'h42)} : ((8'ha9) ? (8'ha4) : (8'ha3)))) ? (((-(8'hba)) ^ ((8'hbb) ? (8'hb9) : (8'hbc))) ? {(+(8'ha2)), ((7'h43) ? (8'hae) : (8'hb0))} : (-{(8'hb2), (8'ha4)})) : ((((8'hb4) ^~ (8'hbd)) ? {(8'ha8), (8'hbd)} : (+(8'hb4))) ? (~&((7'h44) ? (8'ha2) : (8'ha9))) : {((8'hb9) ? (8'hac) : (7'h43))})) ? (-(|(((8'ha3) ~^ (8'ha4)) < ((7'h42) >> (8'ha6))))) : ({({(8'hb9), (8'ha5)} ~^ {(7'h40)}), (((7'h41) | (8'ha7)) ~^ (-(8'hbf)))} ? (8'ha3) : (~(-{(8'ha2), (8'haf)})))), 
parameter param141 = (^param140))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire136;
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire71,
                 wire16,
                 wire15,
                 wire13,
                 wire12,
                 wire73,
                 wire74,
                 wire75,
                 wire97,
                 wire136,
                 reg17,
                 reg14,
                 reg76,
                 (1'h0)};
  assign wire12 = (8'had);
  assign wire13 = (~&{wire7, wire11[(2'h3):(1'h1)]});
  always
    @(posedge clk) begin
      reg14 <= ($signed((wire9 <<< $signed(wire13))) & wire9);
    end
  assign wire15 = ((wire12 ?
                      wire9[(3'h6):(1'h1)] : ({wire8, (wire7 ? wire8 : wire9)} ?
                          wire12 : ($unsigned(reg14) ~^ $unsigned(wire12)))) || (wire8[(4'he):(4'ha)] ?
                      (~|((wire11 == (8'hb8)) ?
                          (wire10 ?
                              reg14 : reg14) : ((8'hbb) ^ (8'hb2)))) : ((wire9[(3'h4):(1'h0)] >> (&wire13)) - (wire8[(4'hc):(3'h6)] >= (wire13 - wire9)))));
  assign wire16 = wire10[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg17 <= reg14;
    end
  module18 #() modinst72 (wire71, clk, wire15, wire16, wire10, reg17);
  assign wire73 = (~^($signed(($unsigned(wire15) * (wire71 ?
                      wire11 : wire13))) + wire11));
  assign wire74 = wire8;
  assign wire75 = ((wire7 != $signed(wire10)) ^ ($unsigned(wire11[(1'h0):(1'h0)]) ^ wire9));
  always
    @(posedge clk) begin
      reg76 <= wire8[(3'h7):(3'h4)];
    end
  module77 #() modinst98 (wire97, clk, wire73, wire12, wire71, wire13);
  module99 #() modinst137 (wire136, clk, wire8, wire97, reg76, wire7);
  assign wire138 = ((8'hbb) ?
                       (reg76 ?
                           $signed(((-wire97) ?
                               {(8'hbb),
                                   wire15} : wire16[(5'h11):(3'h6)])) : $unsigned(((reg14 ?
                                   wire75 : wire136) ?
                               ((8'h9f) < wire8) : $signed(wire11)))) : $signed((wire15 ?
                           reg14 : (~|$unsigned(wire7)))));
  assign wire139 = (reg14 - (wire8 <= (((~&(8'h9c)) ?
                           $unsigned((8'hb7)) : $unsigned(wire73)) ?
                       (~&(-wire138)) : $unsigned(wire7[(4'h9):(3'h7)]))));
endmodule

module module99
#(parameter param134 = {(({(8'ha5), (~&(8'hb5))} ? {((8'hb4) & (8'ha5)), ((8'hab) ? (8'haf) : (8'hb0))} : {(~&(8'h9f))}) * (~^{(~&(8'hb7)), ((8'hb3) >= (8'ha9))})), (((7'h43) ? ((!(8'ha5)) << ((8'hb3) | (8'hae))) : (((8'ha9) ? (8'hae) : (8'hac)) == (+(8'hb6)))) ? ((((8'haf) ? (8'hb8) : (8'haf)) ? (&(8'hb1)) : (^(8'ha5))) <= ({(8'ha3)} ? (~&(8'hbf)) : (~(7'h43)))) : (^~({(8'hab), (8'hb6)} - {(8'hae), (7'h40)})))}, 
parameter param135 = (param134 ? (((param134 ? (~^param134) : param134) ? (~&param134) : ((param134 >= (7'h44)) ? param134 : param134)) ? param134 : ({param134} ? (param134 ? (param134 ? param134 : param134) : ((8'haf) && param134)) : {(param134 ? (8'hb3) : param134)})) : param134))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire103;
  input wire [(5'h11):(1'h0)] wire102;
  input wire [(3'h6):(1'h0)] wire101;
  input wire [(3'h5):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire104;
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire104,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
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
                 (1'h0)};
  assign wire104 = wire103[(4'hf):(3'h6)];
  always
    @(posedge clk) begin
      reg105 <= $unsigned($signed(($unsigned(wire104[(3'h4):(1'h0)]) ?
          ((wire102 && wire100) ?
              $unsigned(wire101) : {wire104}) : $signed((wire104 << (8'hb3))))));
      if (((8'h9e) ?
          $unsigned({((~&wire100) >> $unsigned(wire104))}) : $unsigned(($signed((wire101 ?
                  wire103 : wire100)) ?
              (wire100[(2'h3):(2'h2)] + $unsigned((8'hb2))) : ((reg105 || wire101) ?
                  (^~(8'hbc)) : wire104)))))
        begin
          if ({(wire101 - $unsigned($signed((wire104 ^~ reg105))))})
            begin
              reg106 <= $signed(wire103);
              reg107 <= (~|wire102);
              reg108 <= (^~{(wire102[(1'h1):(1'h1)] != reg107[(4'ha):(3'h4)])});
            end
          else
            begin
              reg106 <= $unsigned({(((^~reg105) ?
                          $unsigned(reg107) : reg107[(4'hd):(2'h3)]) ?
                      wire102[(4'he):(4'hc)] : $signed(wire100))});
              reg107 <= wire103[(5'h11):(4'h8)];
              reg108 <= $signed((wire104[(3'h5):(1'h1)] ?
                  wire104 : $signed((((8'ha0) ?
                      wire102 : (7'h40)) != (!(8'hab))))));
              reg109 <= wire101;
            end
        end
      else
        begin
          if (wire103[(5'h13):(3'h7)])
            begin
              reg106 <= $signed(reg109[(2'h2):(1'h1)]);
              reg107 <= ((|(wire100[(3'h4):(1'h1)] - reg106)) ?
                  {{$signed(wire100)}} : $signed($unsigned(($unsigned(wire103) ^~ {reg107}))));
              reg108 <= wire100[(2'h2):(1'h0)];
            end
          else
            begin
              reg106 <= (|($unsigned((-{reg107})) == {(!{wire100}),
                  wire100[(2'h3):(1'h0)]}));
            end
          reg109 <= (^(wire100 ?
              $unsigned(reg107[(4'hb):(3'h5)]) : wire101[(1'h1):(1'h1)]));
          if ((8'hb4))
            begin
              reg110 <= {$signed((!((reg106 ?
                      reg109 : (8'hba)) & $signed((8'hae)))))};
              reg111 <= (reg105[(4'h8):(3'h5)] << $signed((((reg108 ?
                      wire102 : wire101) <= ((8'hb6) > wire102)) ?
                  wire101[(1'h1):(1'h1)] : ($signed(reg107) ^ wire104))));
              reg112 <= reg109;
            end
          else
            begin
              reg110 <= (^(((-$unsigned((8'hba))) ?
                  reg111 : $signed(reg110[(4'ha):(4'h8)])) && $signed(({wire102} > (~(8'hbf))))));
              reg111 <= (reg107[(2'h3):(2'h2)] ?
                  $signed($unsigned(($unsigned(reg105) == (reg112 ?
                      reg111 : reg107)))) : wire100);
              reg112 <= wire101;
              reg113 <= reg109;
              reg114 <= ((^~((reg109 ?
                      (reg105 ?
                          reg107 : wire104) : reg110) << wire102[(2'h3):(1'h0)])) ?
                  $signed($signed($unsigned($unsigned(wire104)))) : reg111[(4'hb):(4'h8)]);
            end
          reg115 <= $signed(reg112[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg116 <= wire102[(4'h9):(4'h8)];
    end
  assign wire117 = (~|(8'hb0));
  assign wire118 = reg106;
  assign wire119 = reg105;
  assign wire120 = (8'hab);
  assign wire121 = (&reg116);
  assign wire122 = (~^wire120[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg123 <= $signed(((wire121 ^~ reg116) ?
          (wire104[(2'h2):(1'h1)] == (wire103[(2'h2):(1'h1)] ?
              (wire121 * reg110) : (^~reg116))) : wire101[(2'h2):(1'h0)]));
      if (wire118[(1'h1):(1'h0)])
        begin
          if (wire119)
            begin
              reg124 <= $unsigned(($unsigned((wire119[(1'h1):(1'h0)] > (-reg108))) <= (~^reg108)));
              reg125 <= (($signed($unsigned((^wire121))) ?
                      ($signed($signed(wire101)) || (+$unsigned(wire100))) : $signed(wire100[(3'h4):(1'h1)])) ?
                  (8'hab) : reg111[(1'h1):(1'h1)]);
              reg126 <= ((((~|{wire104}) ?
                      $unsigned({reg112}) : $unsigned((reg116 ?
                          wire100 : wire122))) ?
                  $unsigned((!$unsigned(wire100))) : (^reg107)) ^ {reg123,
                  reg124[(4'hc):(3'h7)]});
              reg127 <= (($unsigned($signed((&(8'hab)))) ?
                      wire122[(4'hc):(4'ha)] : reg105[(2'h2):(1'h1)]) ?
                  (wire118[(5'h14):(3'h4)] && {(^~(reg123 ^ wire122)),
                      wire117[(2'h2):(1'h1)]}) : (~^(8'ha1)));
              reg128 <= reg112[(1'h1):(1'h1)];
            end
          else
            begin
              reg124 <= (&$unsigned((^~reg111[(4'h8):(3'h5)])));
            end
        end
      else
        begin
          reg124 <= $signed($unsigned(($signed(((8'hbb) >>> wire118)) ^ $unsigned(wire117))));
          reg125 <= {((&$signed((~^reg115))) ~^ wire118[(3'h5):(1'h0)])};
          reg126 <= {reg115[(2'h2):(2'h2)], $unsigned(wire121)};
          reg127 <= (((^~((reg115 ?
                  reg113 : wire104) && $unsigned(wire120))) == (&({reg116,
                  reg108} < (+(8'hae))))) ?
              $unsigned($unsigned($unsigned(((8'hb7) < reg125)))) : {$unsigned($signed(((8'hb0) ?
                      reg113 : reg124)))});
        end
    end
  assign wire129 = $unsigned({$unsigned($signed(wire102[(4'hc):(1'h0)]))});
  assign wire130 = wire120;
  assign wire131 = wire102[(3'h4):(1'h1)];
  assign wire132 = $signed(($unsigned(($signed(wire131) ?
                           (+wire130) : (wire104 >>> wire100))) ?
                       $unsigned($unsigned(wire119)) : (reg108 + ((reg108 < wire118) > reg105[(4'hc):(4'ha)]))));
  assign wire133 = $unsigned(($signed({$unsigned(reg107)}) >> $unsigned(($unsigned(wire118) && reg128[(1'h1):(1'h0)]))));
endmodule

module module77
#(parameter param95 = (((^~({(8'haf), (8'h9d)} ? ((8'ha6) ? (8'ha2) : (8'hae)) : (~|(8'hb0)))) < ({(|(8'hb5))} ? ({(8'hb1), (8'ha6)} ? ((8'had) - (8'hb8)) : ((8'hbe) ? (7'h41) : (8'hbc))) : {((8'h9f) ? (8'hb0) : (8'hab))})) - (((!{(8'hbc)}) ? {((8'had) ? (8'ha7) : (8'hb0))} : (((8'hb3) >>> (8'hbb)) ? ((8'hbc) ? (8'haf) : (8'hae)) : ((8'h9f) ? (8'hab) : (8'hb1)))) ? ((^~(&(8'hae))) <<< {((8'hb7) >= (8'hb9))}) : {(((8'hbb) & (8'hac)) ? ((8'ha4) ? (8'h9c) : (8'hb4)) : (8'hb1))})), 
parameter param96 = (param95 ? param95 : param95))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire81;
  input wire [(4'h9):(1'h0)] wire80;
  input wire [(4'h9):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = wire81;
  assign wire83 = wire81[(1'h1):(1'h1)];
  assign wire84 = wire80[(3'h4):(3'h4)];
  assign wire85 = {(wire78[(2'h2):(1'h0)] ?
                          $signed($unsigned((&wire78))) : (({wire82,
                              wire78} > wire78) >= (-wire83[(3'h6):(2'h3)]))),
                      ((8'hb4) ?
                          wire78[(4'hc):(3'h4)] : $unsigned(wire84[(4'hb):(2'h2)]))};
  assign wire86 = $unsigned($unsigned(($unsigned($signed(wire78)) - wire80)));
  assign wire87 = $signed((&(!$signed(wire78))));
  assign wire88 = $signed(((+(~|wire84)) != ((8'hbe) ?
                      wire78[(4'ha):(1'h0)] : $signed(wire87[(2'h2):(1'h1)]))));
  assign wire89 = (8'ha7);
  assign wire90 = ({$unsigned({$signed(wire86)}),
                      (wire81 >= $unsigned({wire85}))} << wire78[(3'h5):(2'h2)]);
  assign wire91 = $signed(wire84[(4'he):(4'h9)]);
  assign wire92 = $unsigned((~|wire88));
  assign wire93 = wire87[(1'h1):(1'h0)];
  assign wire94 = ((~^wire80[(4'h9):(3'h4)]) ?
                      ($signed($unsigned((8'hbb))) ?
                          $unsigned(wire78[(2'h3):(1'h1)]) : (~^wire90[(4'hc):(3'h6)])) : wire92[(4'h8):(1'h0)]);
endmodule

module module18
#(parameter param70 = (({(((8'hb5) + (8'ha1)) ? ((8'hb0) ? (8'hb3) : (7'h42)) : (|(8'ha2)))} << (~(!(&(8'hbb))))) ? (^(~^(+{(8'ha4)}))) : (^((((8'hb9) ? (7'h44) : (8'hb6)) ? ((8'h9d) ? (8'hb0) : (8'had)) : (~^(8'hab))) ^ ((+(8'h9d)) <= (&(8'hb4)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire43,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = (~|wire21[(3'h6):(3'h4)]);
  assign wire24 = ((~wire22) + wire23);
  always
    @(posedge clk) begin
      reg25 <= (~(-wire23));
      reg26 <= (-(((&(wire23 | wire22)) ^ $signed((wire20 ?
          wire23 : wire20))) && reg25[(4'hb):(1'h0)]));
      reg27 <= (&reg25[(3'h5):(1'h1)]);
    end
  assign wire28 = $signed($signed(reg26[(5'h15):(5'h14)]));
  assign wire29 = (~&$unsigned($unsigned($signed(((8'ha1) * wire20)))));
  assign wire30 = ((^~$unsigned((8'hbc))) ?
                      $signed(({{reg25}} ?
                          (!(~^(8'ha8))) : $signed((wire21 <= wire24)))) : (^(+(+{reg25,
                          wire24}))));
  assign wire31 = (($signed(wire24[(4'hc):(1'h1)]) && wire29) ?
                      $unsigned((($signed(wire24) ?
                              (wire24 || wire24) : wire24) ?
                          $unsigned(reg27[(2'h3):(2'h3)]) : wire23)) : (($signed($unsigned(wire28)) ?
                          wire30 : $unsigned((wire29 ?
                              wire28 : wire22))) <= (((8'hbb) ?
                              {reg27} : (8'hbf)) ?
                          ((reg27 ? reg27 : reg27) ?
                              {wire29} : wire22[(4'hd):(4'ha)]) : (8'h9d))));
  assign wire32 = {($unsigned({$signed(wire21)}) ?
                          $unsigned($signed(((8'ha4) ?
                              reg26 : wire24))) : $signed(wire20))};
  assign wire33 = ($signed(wire31) ?
                      {$signed($signed(wire28[(4'hb):(4'hb)]))} : wire31[(4'hf):(4'hb)]);
  always
    @(posedge clk) begin
      if (wire24)
        begin
          reg34 <= (~($unsigned((~|wire33[(1'h1):(1'h0)])) ?
              {({wire29} ? ((8'h9c) + reg27) : {(8'hba), wire19}),
                  ((reg25 >= reg26) ?
                      (^~wire29) : reg26[(5'h13):(4'ha)])} : wire33));
          reg35 <= $unsigned($signed(reg26[(5'h11):(5'h11)]));
          reg36 <= ($unsigned($unsigned(wire28)) ?
              $unsigned(reg26) : wire19[(1'h0):(1'h0)]);
          if ((&$unsigned($unsigned((|((8'ha2) ^ wire20))))))
            begin
              reg37 <= $unsigned({($unsigned(wire29) ?
                      reg27 : $unsigned((wire21 ? reg27 : wire20))),
                  ($unsigned($signed((8'h9e))) || reg25[(4'hc):(4'hc)])});
              reg38 <= $signed({$unsigned((8'ha9))});
              reg39 <= (-(+(wire33 ?
                  reg25[(4'hc):(4'h8)] : ((wire28 ? wire19 : reg26) ?
                      (!wire30) : (wire21 ? reg25 : reg25)))));
              reg40 <= reg34[(1'h0):(1'h0)];
            end
          else
            begin
              reg37 <= {$signed((~&((&(8'hac)) - $unsigned((8'hb5))))),
                  (^~reg40[(3'h6):(3'h5)])};
              reg38 <= wire19;
              reg39 <= ((~$signed(reg35[(4'hf):(3'h7)])) ?
                  $signed($signed((~^$unsigned(reg25)))) : reg26[(3'h6):(2'h3)]);
            end
          reg41 <= wire21;
        end
      else
        begin
          reg34 <= $unsigned(wire24[(2'h2):(1'h1)]);
          reg35 <= ((reg38[(4'h9):(4'h8)] ?
              $unsigned((wire33 <= reg40[(4'he):(1'h0)])) : ((+((8'hb5) ?
                      wire28 : (8'haf))) ?
                  ($signed(reg34) ?
                      ((8'hbe) == (8'hac)) : $unsigned(wire32)) : (&reg25))) & {wire29[(1'h1):(1'h0)],
              reg36[(5'h10):(4'hf)]});
          reg36 <= wire29;
          reg37 <= $signed((+($unsigned($unsigned(reg37)) ?
              ({wire32} ^~ (reg36 ? wire20 : reg26)) : {(~reg27)})));
          if (reg36[(5'h14):(4'hb)])
            begin
              reg38 <= $unsigned({(reg39 << reg34[(4'ha):(1'h1)])});
              reg39 <= (wire30 ?
                  (~&wire32) : ((wire22[(4'he):(2'h3)] - ({wire29, wire29} ?
                      $unsigned(wire24) : reg40)) && wire30[(3'h4):(1'h0)]));
              reg40 <= (|($signed($unsigned((8'ha5))) == (reg41[(1'h0):(1'h0)] ?
                  $signed($unsigned(wire29)) : $unsigned(((8'hae) ?
                      wire32 : wire19)))));
              reg41 <= {($signed($signed((reg40 >> wire19))) ?
                      $signed(wire28[(4'hc):(3'h7)]) : wire33)};
            end
          else
            begin
              reg38 <= $unsigned(reg36);
              reg39 <= (7'h44);
              reg40 <= {wire23, wire22[(5'h14):(3'h6)]};
              reg41 <= wire31;
              reg42 <= ($signed((reg27[(1'h1):(1'h0)] ?
                  wire32[(1'h1):(1'h1)] : reg37[(2'h3):(1'h0)])) < (wire29 ^~ $unsigned(($unsigned(reg40) ?
                  $unsigned(wire33) : (|(8'ha5))))));
            end
        end
    end
  assign wire43 = $signed(reg34);
  always
    @(posedge clk) begin
      if ($unsigned(reg38[(3'h4):(1'h0)]))
        begin
          if (wire28[(3'h4):(2'h2)])
            begin
              reg44 <= $signed((((((8'hbe) ?
                  wire29 : wire24) <= ((8'hba) > reg27)) <= ((reg25 ?
                  reg26 : wire20) | wire24[(4'h9):(4'h9)])) <= (^~{(reg25 ?
                      reg41 : (7'h43)),
                  {(8'haa), wire20}})));
              reg45 <= ($signed($unsigned({reg27, (reg40 & wire33)})) ?
                  wire24 : ({(~|reg44[(2'h3):(2'h3)])} <<< reg26));
              reg46 <= ($signed($signed(((wire32 >> wire33) << reg39))) == (((reg26 ~^ $unsigned(reg39)) == reg25) ?
                  (~$signed((wire32 != reg39))) : $signed(((reg37 << reg26) | reg44[(3'h5):(3'h4)]))));
              reg47 <= $unsigned($signed({{wire32[(2'h2):(2'h2)]}}));
            end
          else
            begin
              reg44 <= (^(wire28 > reg46[(1'h1):(1'h1)]));
            end
          reg48 <= $unsigned(wire30[(5'h12):(4'ha)]);
          reg49 <= reg45[(3'h7):(3'h4)];
          if ((({((wire28 != reg49) == reg46[(2'h2):(2'h2)])} <= $signed({$signed(wire23)})) ?
              ($signed(($signed(wire22) ?
                  reg47 : wire43)) >>> (&$signed((reg36 ?
                  reg39 : reg25)))) : $unsigned($signed(((7'h42) <<< ((8'hbf) <<< reg34))))))
            begin
              reg50 <= (~(({(reg38 ^~ wire28), {reg38}} ?
                  ((reg25 ?
                      wire33 : reg27) || $unsigned(reg36)) : wire23[(3'h7):(1'h1)]) << (wire33 ?
                  reg39[(1'h0):(1'h0)] : wire23[(4'ha):(4'ha)])));
              reg51 <= (((((wire20 <= reg27) ~^ {reg27}) - {(&reg40),
                  (wire19 ? reg34 : wire43)}) & ((~^(reg50 ? reg41 : reg42)) ?
                  (-(reg27 || reg38)) : wire24)) > {(((+wire21) <= (8'ha6)) ^~ ((&reg35) | $unsigned((7'h41)))),
                  {$signed(wire21[(3'h6):(3'h5)]),
                      (reg42 ? $signed(wire20) : reg38[(2'h2):(2'h2)])}});
              reg52 <= ((reg36[(5'h13):(3'h4)] & (~(((8'hb6) >= wire19) ?
                      (reg26 >>> reg35) : {reg49}))) ?
                  reg37 : $unsigned({$signed((wire23 & wire21)),
                      {(^reg46), (reg47 - reg38)}}));
              reg53 <= (&reg44[(2'h2):(1'h0)]);
            end
          else
            begin
              reg50 <= (($signed((8'hb6)) ?
                      ({$signed(reg53), (wire20 ? wire30 : wire31)} ?
                          reg46[(1'h0):(1'h0)] : $signed(wire32)) : (8'hac)) ?
                  reg25 : wire24);
              reg51 <= wire43;
              reg52 <= {(reg44 | ((~(wire43 - reg52)) || ((reg51 ?
                      wire24 : wire28) * $unsigned(reg52))))};
              reg53 <= reg46[(3'h4):(3'h4)];
              reg54 <= $unsigned((|($signed($signed(reg34)) ?
                  ($signed(reg35) ? $signed(reg25) : wire23) : wire24)));
            end
        end
      else
        begin
          reg44 <= reg26[(5'h12):(3'h4)];
          reg45 <= {{reg35[(3'h6):(3'h5)]}, (8'hb5)};
          if (wire43)
            begin
              reg46 <= (reg27[(3'h4):(1'h1)] ? wire23[(3'h5):(3'h5)] : reg26);
              reg47 <= $unsigned((!wire32));
              reg48 <= reg42;
              reg49 <= (wire28[(4'hf):(2'h2)] ?
                  reg53[(3'h6):(3'h6)] : ($signed($unsigned((reg48 <= (8'had)))) == $unsigned({reg25[(3'h7):(3'h5)]})));
              reg50 <= (~&reg49[(1'h1):(1'h0)]);
            end
          else
            begin
              reg46 <= (reg34 ^ reg42);
              reg47 <= reg52;
            end
          reg51 <= (($unsigned((~$unsigned(reg34))) <<< {$signed(wire43[(1'h0):(1'h0)])}) ?
              ({(~(wire29 & wire32))} - (8'hba)) : (reg25[(4'hb):(3'h5)] + (wire19[(1'h1):(1'h1)] ?
                  $signed($unsigned(wire22)) : reg37)));
          reg52 <= (reg37[(2'h2):(1'h1)] ?
              $unsigned($signed(reg41)) : (reg47 & (8'ha0)));
        end
      if (reg52)
        begin
          reg55 <= $signed(($unsigned((reg27[(3'h4):(1'h0)] >>> (&reg44))) != ((reg54[(1'h0):(1'h0)] == (reg26 ?
              wire31 : reg42)) <= reg36)));
          reg56 <= $unsigned((^(+$signed((&reg35)))));
          if ($signed(wire20))
            begin
              reg57 <= reg48[(3'h5):(2'h3)];
              reg58 <= ($signed($signed((((8'hb6) ?
                      (8'hb5) : reg41) <<< reg51[(2'h3):(2'h3)]))) ?
                  (~&$signed($unsigned((~reg50)))) : (wire32 << $signed(reg41[(3'h7):(3'h6)])));
              reg59 <= (&wire23);
            end
          else
            begin
              reg57 <= (reg49 >> (~&((((7'h41) ? reg54 : reg53) ?
                      {(7'h42), (8'ha0)} : (reg59 ? (8'hae) : (8'hac))) ?
                  (reg44[(3'h5):(3'h5)] ?
                      $unsigned(wire22) : (reg47 != reg38)) : ((reg49 ?
                          reg56 : wire21) ?
                      $signed(wire29) : {wire31}))));
              reg58 <= (|$signed((^~(8'hbe))));
              reg59 <= (~|$signed($signed((^~$unsigned(wire19)))));
              reg60 <= reg27[(2'h2):(1'h1)];
            end
          if (reg55[(3'h7):(1'h1)])
            begin
              reg61 <= (!(!$unsigned($unsigned((~|reg45)))));
              reg62 <= (((^~(&((8'hb6) >> (7'h41)))) ?
                  $unsigned((-$signed(wire19))) : $signed($signed((reg50 && reg50)))) <= (8'ha9));
            end
          else
            begin
              reg61 <= $unsigned({($unsigned((^reg42)) << $unsigned((~|(8'h9e))))});
              reg62 <= $signed((~^$signed({$signed(wire20)})));
              reg63 <= $unsigned((-(reg52[(4'h8):(3'h4)] < (((8'hb4) - reg46) ?
                  (reg36 - reg42) : (reg42 > wire30)))));
              reg64 <= wire28[(2'h3):(2'h3)];
            end
          reg65 <= reg41;
        end
      else
        begin
          reg55 <= (^reg59[(1'h0):(1'h0)]);
          reg56 <= (8'h9d);
          reg57 <= reg58;
          reg58 <= ($unsigned($signed($signed({reg34}))) ^ ($signed(({wire31} ?
                  reg53[(4'ha):(2'h3)] : (reg51 ? (8'hba) : wire31))) ?
              reg62 : {(+reg61), (-(7'h42))}));
          reg59 <= ((~(&$unsigned((~reg47)))) & reg53[(3'h5):(2'h2)]);
        end
    end
  assign wire66 = $unsigned((-reg63[(3'h5):(3'h5)]));
  assign wire67 = $signed(({reg65, wire43[(1'h1):(1'h0)]} & (~|wire29)));
  assign wire68 = reg55;
  assign wire69 = (-$signed((~$signed((wire43 ? reg34 : (7'h43))))));
endmodule
