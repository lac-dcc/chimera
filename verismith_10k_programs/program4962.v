module top
#(parameter param151 = ((((((8'hbf) ^ (8'haf)) < ((8'h9d) ? (8'ha5) : (8'ha7))) <<< (-(|(8'hbd)))) | ((((8'ha8) << (8'ha1)) ? ((8'hbb) ? (7'h40) : (7'h40)) : (&(8'hb7))) || (&(~|(8'had))))) * (((((8'hb8) ? (8'haa) : (8'hba)) ? ((8'hb4) ? (8'hbb) : (8'hac)) : (~(8'ha4))) ? (((8'hba) <= (7'h44)) ? (+(8'ha7)) : (8'ha6)) : ({(8'haa)} & ((8'hbb) ? (7'h42) : (8'hb4)))) >>> (~^((~(8'haf)) ? (8'ha0) : ((8'ha8) != (8'ha3)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire123;
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire134,
                 wire133,
                 wire132,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire23,
                 wire123,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg137,
                 reg136,
                 reg135,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire4 = $signed($unsigned($unsigned(wire1[(4'h8):(3'h6)])));
  assign wire5 = $signed($unsigned($signed(((wire0 ?
                     wire3 : wire0) & $signed(wire0)))));
  assign wire6 = $signed((({(wire0 <= wire4),
                         wire5[(3'h6):(3'h6)]} <= $signed(wire4)) ?
                     (($signed(wire5) ^~ $signed(wire5)) ?
                         ($unsigned(wire3) ?
                             $signed(wire1) : wire3) : wire3) : wire1[(4'h8):(3'h6)]));
  assign wire7 = $unsigned($signed($signed((8'had))));
  module8 #() modinst24 (.wire9(wire2), .y(wire23), .wire11(wire3), .wire12(wire5), .clk(clk), .wire10(wire0));
  module25 #() modinst124 (.clk(clk), .y(wire123), .wire26(wire2), .wire30(wire5), .wire27(wire6), .wire29(wire23), .wire28(wire3));
  always
    @(posedge clk) begin
      if ($signed((wire5[(5'h15):(5'h15)] >> (+$signed(wire3[(4'hb):(4'h9)])))))
        begin
          reg125 <= (($signed(wire23[(4'hd):(4'h8)]) ^ wire3) ?
              {$signed((~(wire0 >= wire23)))} : ($signed({$signed(wire123)}) ?
                  (!(&(|wire6))) : $unsigned((~^(wire5 ? wire2 : wire5)))));
          reg126 <= ($signed(wire5) ?
              $signed(wire2[(4'hb):(1'h1)]) : ((((wire1 ? wire5 : (8'ha7)) ?
                      $unsigned(wire6) : $signed(wire1)) ?
                  wire6 : $signed($signed(wire3))) & wire2));
          reg127 <= {wire7[(1'h1):(1'h0)],
              (^~(wire23 ?
                  ((wire123 > wire6) ?
                      wire1 : {wire5,
                          wire23}) : (reg125[(3'h4):(2'h3)] <= {wire3,
                      wire7})))};
          reg128 <= ($unsigned(reg125) ?
              (+wire6[(1'h1):(1'h1)]) : (^~$unsigned(wire5)));
          reg129 <= $unsigned(((($signed(reg128) ?
                  (wire1 ?
                      (8'hb7) : reg125) : {(8'hb1)}) != $unsigned((reg126 - wire7))) ?
              $signed((~&(wire7 <= wire4))) : wire123));
        end
      else
        begin
          reg125 <= (wire5[(4'h9):(3'h7)] ?
              $unsigned((wire2 ?
                  {(reg128 ? reg127 : (8'hbc)),
                      wire6[(3'h4):(1'h1)]} : (reg127[(3'h4):(3'h4)] ?
                      (-reg127) : $unsigned(reg129)))) : reg125[(3'h5):(3'h4)]);
          reg126 <= $unsigned($unsigned($signed($signed($signed(reg126)))));
          reg127 <= (((((wire3 >>> wire2) | ((8'h9d) ? wire0 : wire23)) ?
                  (-$unsigned(reg128)) : ({reg126, reg127} ?
                      (wire4 ? (8'hb3) : wire0) : (~|reg129))) ?
              ($unsigned((reg128 ? wire4 : wire3)) ?
                  ((reg126 ? wire7 : wire7) ?
                      reg127[(2'h2):(2'h2)] : {(7'h42),
                          reg128}) : {$unsigned(wire3)}) : $signed(wire2[(4'h9):(2'h2)])) > $unsigned($unsigned(($signed(reg125) & (wire2 >>> wire5)))));
        end
      reg130 <= (((^$unsigned(wire0[(2'h3):(2'h2)])) && ((|(reg126 <= (7'h42))) ?
          wire2[(5'h11):(5'h11)] : wire3)) || $signed((+$unsigned($unsigned((8'h9c))))));
      reg131 <= wire1[(4'h9):(3'h5)];
    end
  assign wire132 = ($unsigned($unsigned({(wire4 ? (8'ha3) : (7'h42)),
                           wire4[(4'he):(4'ha)]})) ?
                       $signed((-$signed($unsigned(wire5)))) : (wire1 + {$unsigned((reg129 ^ wire5))}));
  assign wire133 = $signed(($unsigned($signed($signed(wire23))) <= wire132));
  assign wire134 = $unsigned(($unsigned($unsigned($unsigned(wire132))) <<< (($signed(wire23) ?
                           {wire1, reg128} : $unsigned(wire4)) ?
                       wire132 : $signed(reg127))));
  always
    @(posedge clk) begin
      reg135 <= {$signed(wire6)};
      reg136 <= ($signed(((reg135[(1'h1):(1'h1)] ?
              (~|reg127) : {reg126, wire134}) ^ ((8'h9e) ?
              {(8'hba)} : ((8'h9e) ? reg130 : wire0)))) ?
          {(((^wire133) ?
                  $signed(reg130) : $unsigned((8'ha5))) <<< $unsigned(((8'ha1) ?
                  wire3 : reg129)))} : $signed((($unsigned(reg131) ?
                  $signed(wire123) : wire1) ?
              wire4 : ($signed(wire4) >> wire4))));
      reg137 <= (((((~&wire123) != ((8'hb7) ? wire123 : wire123)) ?
          (8'hab) : ((wire2 ? reg131 : wire5) ?
              wire1[(1'h1):(1'h1)] : (+wire2))) >>> {(reg125[(3'h7):(3'h5)] ?
              (~&wire0) : $signed(reg131)),
          ((-wire123) <<< wire23[(1'h1):(1'h1)])}) < $signed($unsigned($unsigned(wire1[(3'h5):(2'h2)]))));
    end
  assign wire138 = (~(&($unsigned(reg135[(3'h5):(1'h0)]) ?
                       {reg127,
                           $signed(wire134)} : ($unsigned(reg137) == (reg126 << (8'ha8))))));
  assign wire139 = ((($signed(reg125[(3'h6):(3'h4)]) ?
                           ((^reg129) ?
                               $unsigned((8'hb5)) : $unsigned(wire23)) : reg127) >= reg130[(3'h6):(3'h6)]) ?
                       reg137[(4'ha):(4'h8)] : ({reg129,
                               ($unsigned(wire132) & $unsigned(wire132))} ?
                           wire133 : (wire5 ?
                               wire138[(2'h3):(2'h3)] : wire138[(2'h2):(1'h1)])));
  assign wire140 = wire4;
  assign wire141 = wire123[(4'h8):(1'h0)];
  assign wire142 = wire4[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg143 <= (reg128[(3'h4):(2'h3)] ?
          $signed((^~reg136[(4'h9):(4'h9)])) : wire142);
      if (wire3[(3'h5):(1'h1)])
        begin
          reg144 <= (~&$signed(wire138));
          reg145 <= {$unsigned($unsigned($signed((-wire4))))};
          reg146 <= ({(wire132 ?
                  $unsigned(wire7[(2'h2):(1'h1)]) : (^~(^wire23)))} <= $signed(((wire23[(4'h8):(3'h6)] ?
                  (+reg136) : $unsigned(reg145)) ?
              $unsigned({wire140}) : wire1[(4'h8):(3'h5)])));
          reg147 <= $signed($unsigned((($signed(reg146) ?
                  wire142[(3'h5):(2'h3)] : $signed((8'hb9))) ?
              wire139 : wire138[(2'h2):(1'h1)])));
        end
      else
        begin
          reg144 <= reg137;
          reg145 <= wire6;
          if ((((wire2 >> (reg129 | (-reg129))) ?
                  ((~|(|wire139)) ?
                      ((wire23 ? reg125 : wire138) ?
                          $unsigned(wire134) : (wire139 && reg131)) : wire6[(4'h8):(3'h6)]) : wire5[(5'h14):(1'h0)]) ?
              {(wire6 ?
                      (-reg146) : ((wire141 <= (8'hb3)) ?
                          (wire4 ~^ (8'ha1)) : {wire141}))} : (-{$signed((8'hbf))})))
            begin
              reg146 <= ((wire6 ?
                      (~^((reg131 << wire132) ? wire4 : (^~wire3))) : reg145) ?
                  $unsigned($unsigned(reg130[(4'hd):(4'hd)])) : $unsigned((~^((wire5 ?
                      reg137 : (8'had)) << wire141[(3'h4):(1'h0)]))));
              reg147 <= (8'hb7);
              reg148 <= reg147;
              reg149 <= $unsigned(wire7[(2'h2):(2'h2)]);
            end
          else
            begin
              reg146 <= $signed($unsigned((reg127[(4'h9):(3'h5)] - (8'hb9))));
              reg147 <= {$signed({wire140[(4'h8):(3'h7)], (wire140 ~^ wire0)}),
                  ($unsigned(wire7) >>> wire2)};
              reg148 <= reg125[(3'h6):(3'h4)];
              reg149 <= $signed($signed((((wire2 && reg145) + (reg126 == reg131)) ?
                  $unsigned({reg137, reg143}) : wire138[(2'h3):(2'h3)])));
            end
        end
      reg150 <= $unsigned({($unsigned((|wire3)) + reg126)});
    end
endmodule

module module25
#(parameter param122 = (!(&({((8'h9e) ? (8'ha0) : (8'ha0)), (~&(8'hb6))} * (((8'ha8) ? (8'ha5) : (8'ha0)) ^~ ((8'ha0) ? (8'ha3) : (8'h9e)))))))
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire47;
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire31,
                 wire47,
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
                 reg99,
                 (1'h0)};
  assign wire31 = $unsigned(({wire26[(1'h1):(1'h0)], wire27[(4'hc):(3'h6)]} ?
                      wire27[(4'hb):(3'h7)] : (wire29[(3'h4):(1'h0)] ?
                          ({wire29} && $unsigned(wire26)) : wire29)));
  module32 #() modinst48 (.wire36(wire26), .wire33(wire30), .wire35(wire29), .y(wire47), .clk(clk), .wire34(wire31), .wire37(wire27));
  assign wire49 = $unsigned((-wire47));
  assign wire50 = (~&{{($signed(wire49) == (~^wire29)),
                          $unsigned((wire30 ? wire27 : wire26))}});
  assign wire51 = wire31;
  assign wire52 = wire50[(3'h4):(2'h3)];
  module53 #() modinst95 (wire94, clk, wire50, wire49, wire27, wire30);
  assign wire96 = (((~^$signed({(7'h44)})) ?
                          wire50[(3'h4):(2'h3)] : wire27[(3'h7):(3'h7)]) ?
                      {$signed(wire31[(5'h10):(4'hb)]),
                          $signed(((~&wire94) ^ (wire28 ?
                              wire49 : wire31)))} : (wire27[(4'h9):(3'h5)] << ((!wire52) == wire49[(4'hd):(3'h6)])));
  assign wire97 = ($unsigned(wire49) ?
                      (8'ha0) : ($signed((~|(wire27 ? (8'ha6) : wire28))) ?
                          (~^wire96[(4'ha):(3'h4)]) : (~(((8'hb2) ?
                                  (8'ha9) : wire96) ?
                              ((7'h41) ?
                                  wire31 : wire96) : $unsigned(wire50)))));
  assign wire98 = wire30[(5'h14):(1'h1)];
  always
    @(posedge clk) begin
      if (wire98)
        begin
          reg99 <= ((-($signed(wire49[(2'h3):(1'h0)]) < ($unsigned(wire97) ^~ $signed((8'hb9))))) >> wire26);
        end
      else
        begin
          reg99 <= (~&wire26);
          if (wire50[(1'h1):(1'h1)])
            begin
              reg100 <= wire97;
              reg101 <= wire52;
              reg102 <= (wire49[(5'h10):(5'h10)] == $signed((wire49[(3'h7):(3'h4)] ^~ (+wire28[(1'h1):(1'h1)]))));
              reg103 <= wire51[(3'h4):(2'h3)];
            end
          else
            begin
              reg100 <= (($unsigned((~^$unsigned(wire96))) && wire52[(3'h4):(2'h3)]) ?
                  (~$signed({{(8'h9c), reg99}})) : (reg99 ?
                      ({(~|reg99)} == $signed((wire26 ?
                          wire28 : wire50))) : wire50[(3'h4):(2'h2)]));
              reg101 <= (^(|{{wire28}}));
            end
          reg104 <= wire27;
          reg105 <= $signed(wire96[(3'h6):(3'h5)]);
          reg106 <= ({((~&$unsigned(wire31)) >>> $unsigned($signed(wire98)))} | (wire51 ?
              $unsigned($unsigned($unsigned(reg100))) : wire47));
        end
      if (wire96[(4'h8):(2'h3)])
        begin
          reg107 <= (wire96 << ((((8'haf) ?
                      $unsigned(wire28) : reg99[(4'h9):(4'h9)]) ?
                  (8'ha3) : reg106) ?
              $unsigned(($signed((7'h43)) + $signed((8'ha8)))) : wire52[(2'h2):(1'h1)]));
        end
      else
        begin
          if (reg106)
            begin
              reg107 <= $unsigned(wire27);
              reg108 <= $unsigned((wire49 ?
                  (wire50 ~^ (reg106[(1'h0):(1'h0)] && $signed(reg107))) : {($signed(reg107) ?
                          wire51 : $unsigned((8'hb3))),
                      $signed({(7'h42), wire94})}));
              reg109 <= $signed(reg108[(5'h13):(1'h0)]);
              reg110 <= $unsigned((wire51 + $signed({wire29, (^wire94)})));
            end
          else
            begin
              reg107 <= wire96;
            end
        end
      reg111 <= (~^$unsigned(reg106[(3'h4):(1'h1)]));
      if ((~&((8'h9c) ?
          reg102[(4'h9):(3'h5)] : ((+(~&wire47)) ?
              reg103[(2'h2):(1'h0)] : ((reg100 ? (8'hb0) : wire27) ?
                  $unsigned((8'ha3)) : ((8'hbe) ^ reg101))))))
        begin
          reg112 <= $signed(wire30[(5'h10):(3'h7)]);
          reg113 <= (|(!((8'ha6) ? wire26 : {(~&reg112), (wire97 + reg107)})));
          reg114 <= wire94[(1'h1):(1'h0)];
          reg115 <= reg108;
          reg116 <= reg103;
        end
      else
        begin
          reg112 <= (-(($unsigned((~reg110)) | wire51[(1'h1):(1'h1)]) ?
              reg111[(2'h3):(1'h0)] : ((^~$signed(wire96)) ?
                  {(~^wire30), (-wire29)} : (reg107 | {reg104, reg115}))));
          reg113 <= $signed($unsigned((reg109[(1'h1):(1'h0)] >>> wire31)));
          reg114 <= {$unsigned(wire27[(3'h7):(2'h3)])};
        end
      reg117 <= (~&((((^wire26) > (reg110 ? reg111 : reg109)) ?
              {wire28} : {$signed(reg107), (reg100 ^ reg112)}) ?
          wire97[(3'h6):(3'h5)] : {{{wire47}},
              $unsigned(reg113[(2'h3):(2'h2)])}));
    end
  assign wire118 = ($signed(wire31) * {(((reg117 ? wire94 : reg101) ?
                           (+reg107) : $signed(reg110)) ^ ({wire31} ?
                           wire28[(3'h6):(3'h4)] : reg115))});
  assign wire119 = $unsigned(wire118[(5'h14):(5'h11)]);
  assign wire120 = (|(8'hb5));
  assign wire121 = ({(8'ha9)} ?
                       ($unsigned(reg106) * $unsigned({$signed(wire120),
                           (reg102 <= reg107)})) : reg109);
endmodule

module module8
#(parameter param21 = ((8'hb5) - (~(~&{{(8'ha7)}, ((8'ha8) ^~ (8'hb2))}))), 
parameter param22 = param21)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = wire12[(4'ha):(1'h0)];
  assign wire14 = (wire11[(4'hb):(3'h5)] ?
                      $signed(wire13) : {wire12[(2'h2):(1'h0)],
                          {((wire12 && wire13) ^~ $signed(wire9)),
                              $signed({wire12, wire13})}});
  assign wire15 = wire14;
  assign wire16 = wire15[(1'h0):(1'h0)];
  assign wire17 = (8'haf);
  assign wire18 = wire11;
  assign wire19 = {$unsigned(($unsigned(wire13) ?
                          (|(wire13 != wire11)) : (wire11[(4'h8):(1'h1)] != wire14)))};
  assign wire20 = $unsigned(wire19[(2'h3):(1'h1)]);
endmodule

module module53
#(parameter param93 = (8'ha6))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  assign y = {wire92,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire59,
                 wire58,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
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
                 (1'h0)};
  assign wire58 = ($signed((|($unsigned(wire55) ?
                          (wire55 ? wire54 : (8'hbf)) : (^wire57)))) ?
                      $signed(($unsigned((-wire56)) ?
                          ((-wire55) + $unsigned(wire57)) : (wire55 ?
                              wire54[(3'h4):(2'h2)] : wire55[(4'hd):(4'hc)]))) : (+$signed($signed((+wire56)))));
  assign wire59 = {(wire58[(4'hc):(1'h1)] ? $signed(wire58) : wire55),
                      ($unsigned((^$unsigned(wire58))) << $signed((^~$unsigned(wire58))))};
  always
    @(posedge clk) begin
      if ((8'had))
        begin
          if ($unsigned(((&($unsigned(wire56) < (&(7'h41)))) ?
              wire54[(4'hd):(4'h9)] : wire59)))
            begin
              reg60 <= ((|wire55) ?
                  {$signed((!(wire58 + wire59))),
                      ($signed($unsigned(wire55)) ?
                          (wire58 | (wire56 ?
                              wire54 : (8'hb0))) : $unsigned((|wire57)))} : $signed($signed($signed({(8'ha3),
                      wire57}))));
            end
          else
            begin
              reg60 <= (wire58 ? (8'ha8) : $signed((+reg60)));
            end
          reg61 <= wire55;
          reg62 <= wire58[(4'hd):(3'h7)];
          if ($unsigned({$unsigned(((7'h42) ~^ $signed(wire55)))}))
            begin
              reg63 <= reg60;
              reg64 <= (~|($unsigned($unsigned($unsigned(wire55))) & $unsigned({(8'hac),
                  $signed(wire57)})));
              reg65 <= ($signed((wire54 ^ {$signed(wire55)})) ?
                  wire54[(1'h1):(1'h0)] : $signed({({(8'hbe)} > ((8'ha9) ?
                          reg64 : wire54))}));
              reg66 <= reg63;
              reg67 <= ((reg65 ?
                  reg65[(1'h1):(1'h0)] : (~^((wire54 ?
                      wire58 : wire58) <= reg62[(4'he):(3'h6)]))) > (reg60 || {$unsigned((wire57 | wire57))}));
            end
          else
            begin
              reg63 <= {(^wire59[(2'h2):(1'h1)]),
                  $signed(wire55[(5'h12):(4'h8)])};
              reg64 <= (~&$signed(reg67));
              reg65 <= wire56;
              reg66 <= (((wire54 ?
                  reg62 : (reg62[(1'h1):(1'h1)] >= $signed(wire59))) ^ reg65[(5'h10):(4'ha)]) & $unsigned($signed(reg62[(4'hd):(2'h2)])));
            end
        end
      else
        begin
          if ((((~$signed((wire56 >> reg65))) ?
              reg67[(3'h4):(1'h1)] : wire55[(2'h2):(1'h1)]) ^ wire56[(1'h1):(1'h0)]))
            begin
              reg60 <= ($unsigned($signed(wire54[(3'h4):(1'h0)])) ?
                  ((wire59[(3'h4):(2'h2)] > ($unsigned((8'hbc)) ?
                          (-wire59) : (reg65 ? wire56 : wire59))) ?
                      {(reg61[(2'h2):(1'h0)] ? wire57 : (~&wire57)),
                          {reg66,
                              wire55}} : reg65[(4'he):(4'hb)]) : $signed($unsigned(reg66[(1'h0):(1'h0)])));
            end
          else
            begin
              reg60 <= (($unsigned($signed(((8'ha6) >> wire56))) * (wire55[(4'h9):(3'h6)] ^~ wire54[(2'h2):(1'h1)])) ?
                  wire55[(4'hd):(2'h2)] : reg60[(2'h2):(1'h0)]);
              reg61 <= $signed((($unsigned((wire57 && reg64)) ?
                      ((wire55 >>> wire58) <= $signed(wire58)) : reg62) ?
                  reg64[(3'h5):(2'h3)] : $signed({(wire54 ?
                          (8'ha8) : (8'ha2))})));
              reg62 <= reg62;
              reg63 <= $signed({(((~|reg62) + reg65) ?
                      (^~(reg60 ~^ wire59)) : ($unsigned(wire54) ?
                          wire57[(3'h4):(2'h2)] : (reg66 ? wire54 : wire58)))});
            end
          reg64 <= ({(~^wire55[(2'h2):(1'h1)])} & (wire56[(5'h11):(4'h8)] - (($signed(reg64) - $unsigned((8'hb8))) <<< $signed(reg67))));
          reg65 <= ($unsigned($signed(wire59)) ? wire58 : $unsigned((8'hba)));
          reg66 <= $signed({(-$unsigned(reg61)), reg64[(4'hf):(3'h6)]});
          reg67 <= (reg63 ~^ reg63[(1'h0):(1'h0)]);
        end
      reg68 <= {(|{(8'h9f), ({reg66, reg64} ^~ (reg62 ? wire58 : (7'h41)))})};
      reg69 <= $unsigned((+wire56));
      reg70 <= $unsigned((!reg64));
    end
  assign wire71 = (!reg67);
  assign wire72 = $unsigned((reg68 + $unsigned(wire57)));
  assign wire73 = wire57[(3'h4):(3'h4)];
  assign wire74 = ($signed(reg64) ?
                      {$unsigned((!{(8'h9d)}))} : {{(wire56[(4'h9):(2'h2)] >> {(8'h9e)})}});
  assign wire75 = $unsigned(({((wire71 | reg61) >> (~&reg70))} <<< wire71[(1'h1):(1'h0)]));
  assign wire76 = $signed(((~|$unsigned(reg60[(1'h0):(1'h0)])) ?
                      wire74 : reg61[(2'h3):(2'h2)]));
  assign wire77 = reg69;
  assign wire78 = {$unsigned({wire57[(1'h0):(1'h0)]})};
  assign wire79 = (~^(8'had));
  assign wire80 = wire73;
  assign wire81 = $unsigned($signed((($unsigned(wire78) ^~ {(7'h43), reg69}) ?
                      {$signed(reg61), $signed(reg65)} : reg67)));
  assign wire82 = $signed($unsigned($signed((~&(-(8'ha8))))));
  assign wire83 = (wire71[(1'h1):(1'h0)] ? (8'hb1) : reg68[(4'h8):(3'h6)]);
  assign wire84 = (~&(~^wire59));
  always
    @(posedge clk) begin
      if ($signed({wire83,
          ((&$unsigned(wire80)) != ((wire57 >= wire82) ?
              $signed(wire73) : $unsigned((8'ha6))))}))
        begin
          reg85 <= (+(~^wire58[(4'h9):(3'h7)]));
          reg86 <= (({$unsigned($unsigned(reg66)),
                  (wire84[(4'hd):(4'hc)] ?
                      (reg65 != reg68) : wire59[(1'h1):(1'h1)])} ?
              $unsigned($signed((wire80 ?
                  wire77 : (8'hb6)))) : ($signed({wire81}) && wire58)) << reg69);
          reg87 <= (!$signed(wire80));
          reg88 <= (|(!wire81));
          reg89 <= wire71;
        end
      else
        begin
          if ($unsigned(($signed((8'h9c)) ?
              $unsigned(wire58[(3'h4):(1'h1)]) : $signed($signed(reg65[(4'ha):(1'h0)])))))
            begin
              reg85 <= (reg62 ~^ (^~(~reg87[(2'h2):(1'h1)])));
            end
          else
            begin
              reg85 <= (reg67[(1'h1):(1'h1)] + {reg61, wire79[(3'h4):(3'h4)]});
              reg86 <= (wire75 ?
                  reg87[(1'h0):(1'h0)] : ((8'haf) || (~&(reg89[(3'h4):(2'h3)] && wire71[(1'h1):(1'h1)]))));
              reg87 <= $unsigned($unsigned(((-(reg89 > reg64)) ?
                  $signed({(8'hb7), wire59}) : $unsigned((~^wire73)))));
              reg88 <= $unsigned(wire79);
              reg89 <= reg70;
            end
          reg90 <= {(|reg63)};
          reg91 <= (|{($signed($unsigned(reg60)) ?
                  $signed((wire81 == wire55)) : wire56),
              (~^reg86[(2'h2):(1'h1)])});
        end
    end
  assign wire92 = (wire58 ?
                      (reg64 ?
                          ($signed($signed(reg70)) != reg67) : (~&$signed((&wire59)))) : reg64[(1'h0):(1'h0)]);
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = (~|(~|$signed($signed($signed(wire37)))));
  assign wire39 = (wire35[(4'hb):(2'h3)] << {$unsigned(($signed((8'hb7)) ?
                          (^~wire36) : wire35[(5'h13):(1'h1)]))});
  assign wire40 = wire36;
  assign wire41 = $signed($signed({(^$unsigned(wire38))}));
  assign wire42 = wire39[(5'h13):(4'he)];
  assign wire43 = (8'hb2);
  assign wire44 = (8'h9d);
  assign wire45 = (8'h9e);
  assign wire46 = (8'ha4);
endmodule
