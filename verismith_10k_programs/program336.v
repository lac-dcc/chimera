module top
#(parameter param155 = ((~^((!(8'haf)) ? ((^~(8'hbe)) || ((8'haf) ? (8'h9f) : (8'h9c))) : ((^(8'hb8)) >= ((8'hab) ? (8'hba) : (8'ha2))))) ^ ({(-(^(8'hb6))), (((8'h9e) ? (8'ha2) : (8'hbe)) ? ((8'hb7) ? (8'ha3) : (8'ha4)) : {(8'hbb), (8'hb2)})} == {{((8'hbb) ~^ (8'hb3)), ((8'hb0) <<< (8'h9e))}, (((8'ha1) >> (8'hb0)) ~^ (~|(8'haf)))})), 
parameter param156 = ((8'hba) + (&(+(~&(~param155))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire [(4'hb):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire148;
  wire [(5'h11):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire86;
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire88,
                 wire5,
                 wire6,
                 wire7,
                 wire86,
                 reg152,
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire5 = ({(8'hba)} == (|($signed((wire4 ? wire0 : wire3)) ?
                     wire4[(4'hc):(3'h4)] : (~&(wire3 != wire3)))));
  assign wire6 = (&wire3);
  assign wire7 = $signed(wire1[(4'h9):(1'h1)]);
  module8 #() modinst87 (wire86, clk, wire3, wire6, wire1, wire7, wire5);
  assign wire88 = $unsigned((8'hbf));
  module89 #() modinst146 (wire145, clk, wire5, wire7, wire3, wire86);
  assign wire147 = ((-{$unsigned(((8'hbb) || wire4))}) ?
                       $signed({(+(wire1 ?
                               wire145 : (8'hb9)))}) : $unsigned({((wire145 ?
                               wire86 : wire6) + $signed(wire86))}));
  assign wire148 = wire3[(3'h4):(3'h4)];
  assign wire149 = $unsigned($signed((((wire7 ?
                       wire6 : wire7) ~^ (wire145 >> (8'ha5))) && (wire4[(3'h5):(1'h0)] >= $unsigned((8'h9f))))));
  always
    @(posedge clk) begin
      reg150 <= (|$signed($unsigned(wire147)));
      reg151 <= (~({{$unsigned(wire0)},
          (8'hba)} <= $signed($unsigned($unsigned((7'h41))))));
      reg152 <= (wire149[(2'h2):(2'h2)] != $signed({{((8'h9f) ? reg150 : wire7),
              $unsigned(wire149)}}));
    end
  assign wire153 = $signed($unsigned((~&(wire0 ? {wire3, wire0} : (-wire2)))));
  assign wire154 = $unsigned(($signed(wire153) ? wire2 : wire0[(3'h5):(2'h3)]));
endmodule

module module89
#(parameter param143 = (~(!{(~&((8'haf) >= (7'h43))), (^~(^(8'hbe)))})), 
parameter param144 = param143)
(y, clk, wire90, wire91, wire92, wire93);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire120;
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire123,
                 wire122,
                 wire94,
                 wire95,
                 wire120,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire94 = (wire93[(1'h0):(1'h0)] ?
                      (($signed(wire92[(1'h0):(1'h0)]) ?
                              ($signed(wire92) & wire91[(1'h0):(1'h0)]) : (wire90 + (~&wire93))) ?
                          ((~|$signed((8'hb5))) >> $signed((~^wire90))) : wire92[(2'h3):(2'h2)]) : $signed(((~^$signed(wire92)) ^~ $unsigned({(8'ha6),
                          wire93}))));
  assign wire95 = ((7'h40) ? wire92 : (^wire94));
  module96 #() modinst121 (wire120, clk, wire91, wire94, wire92, wire95, wire93);
  assign wire122 = $unsigned(wire93[(1'h1):(1'h1)]);
  assign wire123 = (wire93[(1'h1):(1'h0)] ~^ (+($signed($signed(wire91)) ?
                       ((wire122 ?
                           (8'hb9) : (8'hbb)) << (8'ha8)) : (^~((8'haf) <= wire95)))));
  always
    @(posedge clk) begin
      reg124 <= (~wire91);
      if ($signed({wire90[(5'h13):(4'h8)]}))
        begin
          if ({$unsigned($unsigned(wire95[(2'h3):(1'h0)]))})
            begin
              reg125 <= (~^($unsigned({(+wire122),
                  wire92[(2'h2):(2'h2)]}) >= {$unsigned({wire90})}));
              reg126 <= wire92;
              reg127 <= $unsigned($signed(((~&(&wire90)) * (^~{wire93}))));
              reg128 <= $unsigned(wire94);
              reg129 <= $unsigned($unsigned(wire90[(5'h14):(5'h13)]));
            end
          else
            begin
              reg125 <= {$unsigned($unsigned(((wire95 && reg128) >>> (wire120 ?
                      wire120 : (8'had))))),
                  (($signed((reg125 >= wire120)) ^~ $unsigned($unsigned(wire120))) ?
                      $unsigned(reg124) : $unsigned((^(reg126 ?
                          (8'ha8) : wire94))))};
            end
          reg130 <= wire92;
          if ({$signed((|wire91[(3'h6):(2'h3)]))})
            begin
              reg131 <= ($unsigned($signed($signed((wire122 ?
                      reg124 : (8'hb7))))) ?
                  wire123[(2'h2):(2'h2)] : {(~(^~(wire93 ?
                          reg129 : (8'hbb))))});
            end
          else
            begin
              reg131 <= {(&{wire95[(3'h4):(3'h4)], $unsigned((8'hb7))}),
                  (^~wire92[(1'h0):(1'h0)])};
              reg132 <= $signed({wire93[(1'h0):(1'h0)],
                  (reg124 ?
                      $signed($signed((8'hbf))) : ((wire91 ?
                          wire94 : reg129) && $unsigned(reg127)))});
              reg133 <= $signed((((reg128[(2'h2):(1'h0)] ?
                  ((8'hbf) ?
                      wire123 : reg124) : $signed(wire91)) * reg128) | $unsigned((^$signed(wire91)))));
            end
        end
      else
        begin
          reg125 <= (^~reg129);
          reg126 <= reg133[(4'hf):(3'h7)];
        end
      reg134 <= reg132[(1'h1):(1'h0)];
      reg135 <= (~wire93[(4'he):(4'hc)]);
    end
  assign wire136 = reg133;
  assign wire137 = (wire122 && (($unsigned(reg133) ~^ $unsigned((wire94 ?
                           (8'ha5) : reg126))) ?
                       reg132 : {($signed(reg133) ?
                               (reg128 | wire92) : $unsigned(wire91)),
                           wire123[(5'h10):(3'h4)]}));
  assign wire138 = ($unsigned((reg128[(1'h0):(1'h0)] ?
                           wire123[(4'ha):(3'h5)] : (~reg126[(1'h0):(1'h0)]))) ?
                       wire92[(2'h2):(2'h2)] : ($unsigned($signed((^~reg126))) * reg134));
  assign wire139 = ((+wire91) > reg128);
  assign wire140 = (8'ha5);
  assign wire141 = {($signed((~|$signed(wire90))) ?
                           reg133 : (reg125[(2'h2):(1'h1)] ?
                               $unsigned((wire122 * wire140)) : {(reg132 >= wire90),
                                   (8'hb2)}))};
  assign wire142 = (!(($signed((wire140 ? wire90 : reg135)) >= wire122) ?
                       $unsigned($unsigned((reg127 ?
                           reg131 : (8'hbf)))) : ($unsigned($unsigned((8'hb2))) && $unsigned((|(7'h43))))));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire54;
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire77,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  module14 #() modinst55 (.clk(clk), .wire18(wire9), .wire15(wire11), .wire17(wire13), .y(wire54), .wire16(wire12));
  assign wire56 = wire11;
  assign wire57 = wire10[(4'h8):(2'h3)];
  assign wire58 = (~$unsigned((((!(8'hb6)) ?
                          (wire57 ? (8'hb6) : wire56) : (wire54 ?
                              (8'hb5) : wire54)) ?
                      ($signed(wire54) || $unsigned(wire9)) : $unsigned($unsigned(wire12)))));
  assign wire59 = wire58[(3'h4):(3'h4)];
  module60 #() modinst78 (.wire64(wire59), .wire61(wire56), .y(wire77), .clk(clk), .wire62(wire11), .wire63(wire54));
  always
    @(posedge clk) begin
      reg79 <= ($signed((({wire57, wire54} ?
                  $unsigned(wire13) : {wire54, wire56}) ?
              (&$unsigned(wire10)) : (((8'hb0) ? wire54 : (7'h40)) ?
                  (wire59 < wire59) : (wire57 ? wire54 : wire11)))) ?
          (^~$unsigned($signed(wire59))) : ($signed((((8'haa) ?
              wire77 : wire57) > wire9)) < (~|wire58[(3'h4):(3'h4)])));
      reg80 <= wire13;
      reg81 <= $signed(($unsigned(({wire77, wire58} ?
              {wire10} : $unsigned(wire54))) ?
          ($unsigned((|(8'ha6))) != $unsigned(wire13[(3'h4):(2'h2)])) : wire58));
      reg82 <= ((~wire59) >> (~$unsigned(($unsigned(reg80) ~^ (~wire10)))));
      reg83 <= (^$unsigned((wire59 ?
          $signed(wire77[(2'h3):(1'h1)]) : wire9[(4'hb):(4'hb)])));
    end
  assign wire84 = wire54[(4'he):(4'h9)];
  assign wire85 = wire58[(2'h2):(2'h2)];
endmodule

module module60
#(parameter param75 = (((7'h42) ~^ {(((8'hb0) << (8'h9f)) | {(8'hb6), (8'hba)}), (((8'hbc) || (8'haa)) - ((8'h9f) & (8'hb3)))}) ? ((({(8'hb8)} - ((8'ha5) + (8'hb3))) >= (((7'h40) ? (8'ha5) : (8'ha9)) ? ((8'haa) ? (8'hb5) : (8'ha7)) : (-(8'hba)))) ? (+(((8'haf) << (7'h40)) | ((8'hbd) ? (8'hbb) : (8'hb8)))) : ((^((7'h42) ? (8'hbe) : (7'h42))) ? {((8'hab) != (8'ha9))} : {((8'hb9) ? (8'hb1) : (8'hb0)), (~^(7'h41))})) : ((^~((!(7'h42)) <= (+(8'hb7)))) ? (~^(((8'ha9) | (8'hb8)) || ((8'hb3) | (8'hb7)))) : ((^((8'haf) * (8'ha6))) ? (-{(8'h9e)}) : (^{(8'hb4)})))), 
parameter param76 = {((~|(param75 ^~ (param75 << (7'h40)))) >> ({((7'h40) ? param75 : param75)} <= ({param75} ? (~param75) : {(8'hb3)}))), param75})
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  input wire [(4'ha):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire74,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire65 = wire64;
  assign wire66 = $unsigned(wire64);
  assign wire67 = (^((^~((wire66 ? wire65 : wire65) <= wire66[(3'h6):(1'h1)])) ?
                      $signed(wire65[(3'h5):(1'h0)]) : (+((wire63 ?
                              wire61 : wire62) ?
                          $signed(wire66) : {wire66, wire63}))));
  assign wire68 = ((~&$unsigned(wire63[(4'hb):(2'h3)])) << (~|(7'h43)));
  assign wire69 = ($signed($signed(wire67)) > (wire64 ?
                      (wire68[(2'h2):(1'h1)] == (-wire61[(1'h0):(1'h0)])) : ($signed($signed(wire66)) <= ($signed(wire68) ?
                          (wire67 + wire63) : wire63))));
  always
    @(posedge clk) begin
      reg70 <= $unsigned($signed($unsigned(((wire67 && wire67) ?
          ((8'hae) ? wire61 : wire66) : $unsigned(wire63)))));
      reg71 <= wire61;
      reg72 <= wire68[(1'h0):(1'h0)];
      reg73 <= (~&((^((&wire61) ?
          $unsigned(reg72) : $signed(wire65))) < reg71));
    end
  assign wire74 = wire61;
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg45,
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
                 (1'h0)};
  assign wire19 = (8'haf);
  assign wire20 = $unsigned(wire17);
  assign wire21 = wire19[(3'h4):(1'h0)];
  assign wire22 = $unsigned($signed($signed((8'hb9))));
  assign wire23 = {$unsigned(($signed((^wire15)) ?
                          $unsigned(wire20) : $signed((wire17 && wire17))))};
  always
    @(posedge clk) begin
      if (((7'h41) | ((((wire16 & wire16) ?
                  (wire23 ? wire21 : wire19) : (~^wire18)) ?
              {(wire18 ? wire19 : wire20)} : $signed($unsigned(wire23))) ?
          wire23[(4'hb):(4'ha)] : {wire15})))
        begin
          reg24 <= wire22;
          if ($signed(wire19[(1'h1):(1'h1)]))
            begin
              reg25 <= (+((wire18 >>> (wire21 ?
                  wire17[(1'h0):(1'h0)] : (~&wire15))) || $signed((~|reg24[(4'h8):(3'h4)]))));
              reg26 <= wire16;
              reg27 <= (8'ha7);
              reg28 <= ($unsigned({($signed((8'ha0)) ?
                          ((8'hbf) ? wire23 : reg25) : (wire21 != wire22)),
                      (^$unsigned(reg25))}) ?
                  $unsigned((wire21 >>> (wire23 ?
                      {reg26, wire16} : wire15))) : (({((8'hab) < (7'h44))} ?
                      (|$unsigned(reg25)) : wire21[(4'h8):(3'h4)]) <<< $signed($signed({(8'hba)}))));
            end
          else
            begin
              reg25 <= ({(^(~(wire20 ? (8'ha5) : reg28)))} < $unsigned((reg24 ?
                  (~^(^wire15)) : reg28)));
              reg26 <= ({$unsigned($unsigned(reg26)),
                      ((!(-wire18)) ?
                          wire15[(1'h1):(1'h1)] : $signed((reg25 ?
                              reg26 : (8'hb9))))} ?
                  ($signed((wire16 << (wire21 - reg25))) ?
                      $signed((8'hb5)) : reg26) : $unsigned((^((+(8'hba)) <<< wire17))));
              reg27 <= $signed((wire21 != wire19));
            end
        end
      else
        begin
          reg24 <= (-($unsigned(((wire21 * wire19) ?
                  (8'h9e) : $unsigned(reg26))) ?
              $signed(((-wire15) ^ $unsigned(wire16))) : (((~|reg25) ^~ {reg25,
                      reg28}) ?
                  (wire16[(4'h8):(3'h6)] ?
                      wire21[(4'hf):(4'hb)] : (wire16 ?
                          reg26 : wire19)) : $unsigned((8'ha0)))));
          reg25 <= $unsigned(reg25);
        end
      if ({{$signed(((reg28 ? wire20 : wire20) ^ wire16[(4'hc):(4'ha)]))}})
        begin
          if (wire23[(4'h9):(4'h8)])
            begin
              reg29 <= $unsigned(((|($unsigned(wire16) & wire20[(2'h2):(1'h0)])) ?
                  reg26 : wire20));
              reg30 <= (reg26[(3'h6):(3'h6)] ?
                  {((&$unsigned(wire19)) ^ wire15)} : wire18);
              reg31 <= wire15[(2'h3):(2'h2)];
            end
          else
            begin
              reg29 <= $unsigned((reg24[(4'h9):(2'h3)] ?
                  (^~reg24[(2'h2):(2'h2)]) : wire17));
              reg30 <= (^reg30);
              reg31 <= wire20;
            end
          if (wire23)
            begin
              reg32 <= wire17;
              reg33 <= reg27[(3'h5):(2'h2)];
              reg34 <= $signed({{(~|reg27)}, reg30[(4'hf):(4'ha)]});
              reg35 <= ($signed((((!wire20) ? (wire22 - wire20) : reg28) ?
                      $unsigned((+reg33)) : wire22)) ?
                  $unsigned({wire22}) : $unsigned(($signed((wire17 ?
                          reg34 : reg25)) ?
                      ({reg32, reg31} ?
                          {wire18,
                              (7'h40)} : $unsigned((7'h43))) : ($signed(reg24) ?
                          (-reg30) : $unsigned(reg26)))));
            end
          else
            begin
              reg32 <= ({(^(reg28[(1'h0):(1'h0)] | (wire16 && wire19))),
                  {((reg24 ? reg30 : wire20) ?
                          reg29[(1'h0):(1'h0)] : $signed(reg24))}} && $signed(((8'hae) ?
                  $unsigned($signed(reg28)) : (~|reg27[(2'h3):(1'h1)]))));
              reg33 <= (|$unsigned($signed($unsigned({reg27, wire16}))));
              reg34 <= $signed((($unsigned((^reg32)) ^ $unsigned(reg31[(1'h0):(1'h0)])) ?
                  {{(~reg26), wire16[(4'h8):(1'h1)]},
                      wire21} : $signed(wire18[(4'hd):(3'h5)])));
            end
          if ((&((^(!(reg30 ? (8'ha9) : (8'h9e)))) ? wire19 : {wire18})))
            begin
              reg36 <= reg27;
            end
          else
            begin
              reg36 <= $signed(((~^{wire18[(2'h3):(2'h3)]}) != (-reg31)));
              reg37 <= reg35;
              reg38 <= ((^~$signed($signed((wire22 ?
                  reg30 : reg26)))) & wire21[(4'h9):(3'h6)]);
              reg39 <= reg31[(3'h5):(3'h4)];
              reg40 <= (~&wire21);
            end
        end
      else
        begin
          reg29 <= (~(~^reg27));
          if (wire15[(1'h0):(1'h0)])
            begin
              reg30 <= ($unsigned((((reg35 > reg38) + reg26) ?
                  reg27[(2'h2):(1'h0)] : $unsigned($unsigned(reg33)))) & (~(&$signed({reg37,
                  reg34}))));
              reg31 <= $unsigned({(7'h44), (reg27 & wire15[(1'h1):(1'h1)])});
              reg32 <= (($unsigned(($unsigned(reg29) ^~ (wire20 & wire21))) ?
                      ((wire22[(2'h3):(1'h0)] ?
                              (&reg25) : wire23[(2'h3):(1'h0)]) ?
                          ((^reg30) != ((8'hb5) >> reg40)) : $unsigned((~|(8'ha3)))) : (~|reg37)) ?
                  {wire20,
                      (reg31[(3'h6):(3'h5)] == $signed(((8'ha2) >>> reg39)))} : (wire23 ?
                      wire16[(3'h5):(3'h5)] : (wire22 || reg31)));
            end
          else
            begin
              reg30 <= (&((^(reg35[(2'h3):(2'h2)] << reg24)) && reg36[(2'h3):(2'h2)]));
              reg31 <= (8'hbb);
            end
          reg33 <= (($unsigned($signed({wire20,
                  reg34})) - {reg25[(4'h8):(3'h4)],
                  ((reg26 ? reg31 : wire16) ? reg40 : $signed(wire20))}) ?
              (wire17[(2'h2):(1'h0)] != $signed((^~{wire17,
                  reg33}))) : ({(~&$signed(reg26)),
                      $unsigned((reg27 * (8'hbb)))} ?
                  ({(|wire17), reg30} ?
                      ((wire15 <= reg35) ?
                          (reg40 ?
                              wire15 : reg28) : wire19) : wire18) : ((^$unsigned(wire21)) ?
                      reg39 : ((wire20 ? (8'h9d) : wire17) ~^ (reg29 ?
                          wire22 : reg29)))));
          reg34 <= {(+(((reg26 ?
                  reg25 : wire17) || (^~reg27)) * ($signed(reg37) <<< $signed(wire15))))};
        end
      reg41 <= (~&reg32[(4'h8):(4'h8)]);
    end
  assign wire42 = $signed(wire22);
  assign wire43 = ((reg38 << $unsigned((~|(reg28 ? reg35 : reg36)))) ?
                      (reg36 ?
                          (~|(7'h44)) : $signed($unsigned(((8'h9f) ?
                              reg32 : reg34)))) : (+wire15));
  assign wire44 = (+(~|$signed(reg34[(3'h6):(3'h4)])));
  always
    @(posedge clk) begin
      reg45 <= $signed(((reg40 <= wire42[(3'h5):(1'h0)]) ?
          ((reg26[(2'h3):(1'h0)] ?
              ((8'hb1) > (8'hb1)) : $unsigned(reg32)) ^~ wire22[(2'h3):(2'h3)]) : {$signed((~|reg31)),
              (|$signed((8'hb8)))}));
    end
  assign wire46 = reg28[(3'h6):(1'h0)];
  assign wire47 = reg29[(2'h2):(2'h2)];
  assign wire48 = reg32;
  assign wire49 = $signed({reg27,
                      ($signed(((8'hbf) | reg37)) ^~ $unsigned((reg24 ?
                          wire46 : reg41)))});
  assign wire50 = (reg40[(3'h5):(2'h2)] ?
                      ((~^(^reg40[(2'h3):(2'h3)])) ?
                          {reg33[(3'h6):(2'h2)]} : ($signed((wire22 <= wire47)) <= $unsigned($signed(wire16)))) : {((8'hae) && reg32),
                          {reg45[(3'h4):(2'h2)], (8'hac)}});
  assign wire51 = reg45[(5'h11):(5'h11)];
  assign wire52 = $signed($unsigned((~|reg39)));
  assign wire53 = wire19;
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire101;
  input wire signed [(3'h6):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire signed [(2'h2):(1'h0)] wire98;
  input wire signed [(5'h12):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 wire103,
                 wire102,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire102 = {(~&wire99)};
  assign wire103 = wire98[(2'h2):(1'h1)];
  assign wire104 = (+($unsigned($signed($unsigned(wire97))) != (&(^wire101[(3'h6):(2'h2)]))));
  always
    @(posedge clk) begin
      reg105 <= (8'hb3);
      reg106 <= (7'h44);
      reg107 <= ($signed(wire97) * ((~^$unsigned((wire97 ? wire98 : wire100))) ?
          ((wire99[(3'h6):(1'h0)] ?
              $unsigned(wire101) : $signed(reg106)) << wire101[(3'h7):(1'h0)]) : reg106));
      reg108 <= wire100;
      reg109 <= (wire104[(2'h2):(2'h2)] ?
          reg106 : {((wire104[(1'h1):(1'h1)] == {reg107}) ?
                  $signed((wire103 >>> wire104)) : ((7'h40) ?
                      $signed(wire102) : wire103[(2'h2):(1'h1)]))});
    end
  assign wire110 = $unsigned(wire99);
  assign wire111 = (($signed($unsigned(reg105)) <<< (-reg107)) >> (~|$unsigned(wire104)));
  assign wire112 = $signed(reg109);
  assign wire113 = $unsigned(wire99);
  assign wire114 = (~&reg109[(1'h0):(1'h0)]);
  assign wire115 = (~&(reg108 ?
                       $unsigned({reg106, $unsigned(reg109)}) : (~&reg107)));
  assign wire116 = $unsigned({$unsigned($unsigned($signed(wire99))),
                       ((-(wire110 & reg109)) ?
                           $unsigned($unsigned(reg109)) : ((wire98 <<< wire113) <<< wire97[(4'he):(4'h8)]))});
  assign wire117 = wire115;
  assign wire118 = $unsigned($unsigned((((8'hba) * ((8'hb8) ?
                           wire103 : reg108)) ?
                       wire116 : (|(!wire113)))));
  assign wire119 = $signed(((~&reg105) || (-$unsigned({wire115}))));
endmodule
