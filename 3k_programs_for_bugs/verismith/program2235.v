module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire153;
  assign y = {wire5, wire6, wire7, wire8, wire153, (1'h0)};
  assign wire5 = wire0[(4'hd):(4'ha)];
  assign wire6 = $signed($unsigned(($signed((wire2 > (8'haa))) & {(^~wire3)})));
  assign wire7 = $signed(wire5);
  assign wire8 = $unsigned(wire2);
  module9 #() modinst154 (.wire13(wire7), .wire14(wire6), .wire11(wire4), .y(wire153), .wire12(wire8), .wire10(wire3), .clk(clk));
endmodule

module module9
#(parameter param152 = ((({{(8'ha9), (8'hbd)}, (+(8'hb4))} && {{(8'ha0)}}) - {(((8'ha9) ? (8'ha4) : (8'ha7)) ? ((8'ha5) >= (8'hae)) : ((7'h40) ? (8'ha9) : (8'hbd))), (+((8'h9d) >= (8'haa)))}) ? ((|(((8'h9e) ? (8'had) : (7'h42)) ? {(7'h42)} : ((8'hac) & (8'h9c)))) > (~|(((8'h9c) * (7'h41)) || ((8'ha8) >> (7'h41))))) : (!({((8'hb1) != (8'hbc))} ? (8'hac) : (((7'h40) ~^ (8'h9e)) >>> ((8'ha5) ? (8'h9c) : (8'hbf)))))))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire148;
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire95,
                 wire36,
                 wire15,
                 wire16,
                 wire34,
                 wire98,
                 wire99,
                 wire100,
                 wire148,
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
                 reg97,
                 (1'h0)};
  assign wire15 = $unsigned((|(wire11 ~^ ({(8'ha6)} ^~ (wire11 ?
                      wire10 : wire11)))));
  assign wire16 = $unsigned(wire13[(2'h2):(2'h2)]);
  module17 #() modinst35 (.wire20(wire16), .y(wire34), .wire19(wire11), .clk(clk), .wire18(wire13), .wire21(wire12), .wire22(wire15));
  assign wire36 = wire12[(4'hb):(4'hb)];
  module37 #() modinst96 (.wire41(wire15), .wire39(wire14), .wire38(wire16), .wire42(wire34), .y(wire95), .wire40(wire12), .clk(clk));
  always
    @(posedge clk) begin
      reg97 <= (&wire10);
    end
  assign wire98 = (wire16[(4'h9):(4'h8)] >> wire36);
  assign wire99 = $unsigned($unsigned(wire14));
  assign wire100 = ($signed(wire16) ?
                       (-wire99[(4'hf):(4'hb)]) : (wire14[(1'h0):(1'h0)] <= wire99[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if ((8'ha8))
        begin
          reg101 <= wire11;
          reg102 <= (((((~&wire15) ~^ (^wire95)) & $signed($unsigned(wire98))) * (!{$unsigned(wire95)})) > wire100[(1'h1):(1'h0)]);
          reg103 <= {(&$unsigned(wire15[(3'h5):(1'h0)]))};
          if ($signed(wire16[(1'h1):(1'h0)]))
            begin
              reg104 <= wire34;
              reg105 <= $signed(((!$signed($unsigned(wire95))) > ($signed((wire10 ?
                      wire12 : wire95)) ?
                  ((wire13 || wire16) ?
                      $unsigned(wire95) : (reg102 > wire10)) : $signed({wire16,
                      (8'hbc)}))));
              reg106 <= $unsigned($signed(((wire34[(1'h1):(1'h1)] <= $unsigned(wire11)) ?
                  $unsigned({wire10, wire34}) : (8'ha6))));
              reg107 <= reg97[(4'hc):(2'h2)];
            end
          else
            begin
              reg104 <= wire11[(4'he):(4'hb)];
              reg105 <= $unsigned(wire34[(3'h7):(3'h7)]);
              reg106 <= $unsigned((~^($signed(reg101) ^ $signed((^wire11)))));
            end
          reg108 <= reg103;
        end
      else
        begin
          reg101 <= (^$signed(reg102[(4'h9):(3'h5)]));
          if ((8'ha9))
            begin
              reg102 <= (~^(wire14 >= (~|wire100[(1'h0):(1'h0)])));
            end
          else
            begin
              reg102 <= reg101[(3'h6):(1'h1)];
              reg103 <= (wire100 >>> ((reg106[(1'h0):(1'h0)] ^~ (8'hb0)) >>> (^~$signed($unsigned(reg108)))));
              reg104 <= $signed($unsigned(((&(reg104 == reg104)) ?
                  {reg107, $unsigned(wire11)} : ((reg97 ? (8'hb3) : wire11) ?
                      (!reg107) : $unsigned(reg101)))));
              reg105 <= $unsigned($unsigned($unsigned({$signed((7'h41)),
                  $signed(reg106)})));
              reg106 <= (wire36 ?
                  $unsigned((-reg107)) : $unsigned({$unsigned($unsigned(reg107))}));
            end
          reg107 <= $unsigned({$signed((~(8'hb9))),
              (reg102 ? $unsigned($signed(reg101)) : (&{wire98, wire10}))});
        end
      if (($signed($signed(($unsigned(wire12) ?
              reg102[(5'h10):(1'h1)] : (-wire10)))) ?
          wire11[(4'hc):(3'h6)] : ((((-reg103) + $unsigned(wire16)) ?
              $unsigned(wire95) : reg108[(4'he):(3'h6)]) <<< $unsigned(($unsigned(wire14) << $unsigned(wire100))))))
        begin
          if ($unsigned((~wire12)))
            begin
              reg109 <= ((($signed((wire12 + wire16)) < wire12[(2'h3):(2'h2)]) ^~ $unsigned($signed((-reg97)))) * (reg106[(1'h1):(1'h1)] <<< reg104[(3'h4):(1'h0)]));
              reg110 <= wire15[(4'hc):(4'hb)];
            end
          else
            begin
              reg109 <= $unsigned((^~(wire36[(5'h13):(5'h13)] == $unsigned((wire12 ?
                  reg105 : wire10)))));
              reg110 <= wire95;
              reg111 <= wire16;
              reg112 <= ($signed(((8'hb2) ?
                  ($unsigned(wire12) ?
                      (~|reg108) : reg103) : $signed((reg108 || wire11)))) | ($signed((~reg101[(1'h0):(1'h0)])) >>> (8'ha4)));
            end
          if (wire36[(5'h12):(3'h5)])
            begin
              reg113 <= (((^(((8'hb1) <<< wire34) + (reg112 ?
                      wire36 : wire11))) ?
                  (&$unsigned({reg105,
                      wire13})) : $unsigned((8'hbc))) && wire13[(5'h10):(4'ha)]);
              reg114 <= wire16;
              reg115 <= wire12[(3'h7):(2'h3)];
              reg116 <= {$unsigned(reg108)};
              reg117 <= {(~&($unsigned($signed(reg115)) ?
                      $signed(((8'ha7) ?
                          wire13 : (8'ha2))) : {reg102[(4'h9):(2'h3)],
                          reg107[(3'h6):(3'h5)]})),
                  reg105[(4'hb):(1'h0)]};
            end
          else
            begin
              reg113 <= $signed(reg107[(1'h0):(1'h0)]);
              reg114 <= (wire14[(5'h12):(2'h3)] ^~ $signed(((|wire95[(2'h2):(2'h2)]) || ($unsigned((8'hac)) << (8'ha2)))));
              reg115 <= (wire98 ?
                  (^~$signed((~&$signed((8'hab))))) : (wire15[(1'h0):(1'h0)] < $signed($signed({(8'hbb)}))));
              reg116 <= ($signed((8'hb1)) >= $unsigned(wire15));
              reg117 <= $unsigned(reg102[(4'he):(3'h5)]);
            end
        end
      else
        begin
          reg109 <= ($signed((&($unsigned(wire99) < $unsigned(reg113)))) >>> $signed(wire12));
        end
    end
  module118 #() modinst149 (.wire120(wire15), .wire122(reg112), .clk(clk), .wire121(wire13), .y(wire148), .wire119(reg111), .wire123(wire36));
  assign wire150 = (wire98[(3'h4):(2'h2)] ?
                       (reg105[(2'h3):(2'h2)] && $unsigned(((reg106 > wire14) == wire10[(3'h7):(1'h1)]))) : $unsigned(($signed((wire11 ?
                               wire11 : wire34)) ?
                           {wire10[(4'hc):(4'h9)]} : ((reg103 ?
                                   wire99 : wire11) ?
                               reg108 : reg113[(4'hd):(3'h4)]))));
  assign wire151 = reg114[(2'h2):(1'h0)];
endmodule

module module118
#(parameter param146 = (^~(^~{({(7'h40)} ? ((8'hbf) ? (8'hb3) : (8'ha8)) : (^~(8'hb8)))})), 
parameter param147 = ((|(|((param146 ? param146 : (8'ha6)) < ((7'h40) + (8'hb0))))) <<< (param146 ? (param146 ? {{param146}} : {{param146, param146}, param146}) : ({{param146}, (param146 >> (8'hb0))} ? param146 : ((|param146) ? (param146 ? param146 : (7'h40)) : param146)))))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire123;
  input wire signed [(5'h11):(1'h0)] wire122;
  input wire [(4'he):(1'h0)] wire121;
  input wire signed [(2'h2):(1'h0)] wire120;
  input wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
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
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire124 = $unsigned((!(8'ha5)));
  assign wire125 = wire119;
  assign wire126 = wire122;
  always
    @(posedge clk) begin
      reg127 <= ((wire123[(5'h14):(2'h3)] ?
          wire119 : ((^~{wire124}) ?
              (^wire122[(3'h6):(1'h0)]) : wire123)) >>> (|wire125));
      if ($unsigned($unsigned($unsigned(wire119[(4'h8):(2'h2)]))))
        begin
          if ($signed((wire123[(4'h8):(1'h1)] ^~ (($unsigned(reg127) ?
                  wire123[(1'h0):(1'h0)] : $unsigned(wire120)) ?
              (^$signed(reg127)) : $unsigned((wire126 ? wire124 : wire122))))))
            begin
              reg128 <= wire123;
            end
          else
            begin
              reg128 <= wire122;
              reg129 <= (!((($signed(wire123) < {(8'hb2)}) >>> (wire125 || {wire126,
                  wire125})) || $signed((wire120 ?
                  $signed((8'hb1)) : (&(8'ha3))))));
              reg130 <= wire124;
              reg131 <= (($signed(wire125[(4'hc):(4'h8)]) ?
                      reg127 : (wire124[(3'h5):(1'h1)] ?
                          reg128 : ($unsigned(wire123) ? wire121 : reg129))) ?
                  wire121[(4'h9):(1'h0)] : (7'h44));
              reg132 <= (wire122[(3'h5):(1'h0)] ~^ wire124);
            end
          reg133 <= ((~&(+$signed((-reg132)))) >> $unsigned(({(wire122 ?
                      (8'hbe) : reg127)} ?
              (~&reg129) : ($unsigned(wire122) | reg131[(4'hf):(2'h3)]))));
          if (($signed({$unsigned({reg133, reg129})}) ?
              $unsigned($signed((^~(wire126 ?
                  wire123 : reg132)))) : $unsigned($signed($unsigned($signed(wire120))))))
            begin
              reg134 <= ({($signed(reg132) ?
                      reg133 : (reg133 < ((7'h41) && reg127)))} - {(wire119 << (reg129 ?
                      $unsigned(reg130) : $unsigned(wire124)))});
              reg135 <= wire125;
              reg136 <= ($unsigned(((8'ha0) >>> reg127[(1'h1):(1'h0)])) <= ((wire123[(3'h7):(1'h0)] ?
                  $signed($unsigned(reg131)) : (^~wire122)) - $signed($signed($signed(wire120)))));
              reg137 <= wire121;
              reg138 <= $signed(($unsigned({((8'hbe) ? wire122 : wire120),
                      (wire119 << (8'h9e))}) ?
                  $signed($signed(reg128[(4'hb):(4'ha)])) : $signed(($signed(reg131) && {wire122}))));
            end
          else
            begin
              reg134 <= (-{($signed({wire124, wire126}) ?
                      reg132[(3'h4):(1'h0)] : ((^~reg135) ?
                          (wire119 ? reg137 : reg132) : (~|wire122)))});
              reg135 <= reg132;
            end
          if (wire119[(3'h6):(2'h3)])
            begin
              reg139 <= $unsigned(reg128);
              reg140 <= $signed({(-(~&((8'ha5) && (8'hae)))),
                  ($unsigned($signed((8'hb7))) ?
                      $unsigned($unsigned(reg131)) : $signed($signed((7'h43))))});
            end
          else
            begin
              reg139 <= wire125[(4'ha):(4'h8)];
              reg140 <= wire121[(2'h3):(1'h0)];
            end
          if ($signed(reg130))
            begin
              reg141 <= reg139;
              reg142 <= reg128[(4'hd):(4'hd)];
              reg143 <= reg129[(2'h2):(1'h1)];
              reg144 <= (8'hba);
              reg145 <= $unsigned(reg127[(3'h4):(3'h4)]);
            end
          else
            begin
              reg141 <= ($unsigned((~^$signed(reg135))) && (reg144 ?
                  (~^wire122[(5'h10):(4'h9)]) : $unsigned(reg144)));
              reg142 <= $signed((wire123 || ((^(^~reg144)) ?
                  wire119[(4'h8):(3'h4)] : $unsigned(wire125))));
              reg143 <= (reg132[(1'h0):(1'h0)] & (((+$signed(reg143)) ~^ ((8'hbf) + (wire124 <= reg131))) | wire126));
              reg144 <= (((reg144[(2'h2):(1'h1)] | ($signed(wire122) ~^ $unsigned(reg131))) ?
                  (~|{$unsigned(reg127)}) : ($signed($unsigned(wire121)) ?
                      {{wire119, reg145},
                          $unsigned(wire119)} : $unsigned(reg143))) >> wire125);
            end
        end
      else
        begin
          reg128 <= wire122;
        end
    end
endmodule

module module37
#(parameter param94 = (((^~((8'hb9) == ((8'ha7) * (8'ha7)))) << (({(8'hbf)} ? {(8'hb2)} : (&(8'hb8))) | {{(8'hac)}})) >= ((~&(((8'ha5) >= (8'ha5)) ? {(8'h9e), (8'hb2)} : (^(8'h9c)))) | {(((8'hab) - (7'h40)) ~^ (&(7'h40))), (((8'h9d) >= (8'h9c)) ? ((8'h9d) >>> (8'hb9)) : {(8'ha5)})})))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h274):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire64,
                 wire63,
                 wire62,
                 wire44,
                 wire43,
                 reg86,
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
                 reg66,
                 reg65,
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
                 (1'h0)};
  assign wire43 = wire41;
  assign wire44 = {$signed((8'hb9)), $unsigned((+$signed($unsigned(wire43))))};
  always
    @(posedge clk) begin
      if ((wire42[(1'h0):(1'h0)] ?
          ($signed($unsigned($signed(wire40))) > wire38) : ($unsigned({$unsigned(wire44),
                  wire42}) ?
              $signed(($unsigned((8'ha0)) ^~ $signed(wire44))) : {wire38,
                  ((wire43 ? wire40 : wire38) ?
                      $unsigned(wire40) : wire40[(1'h1):(1'h1)])})))
        begin
          reg45 <= wire44;
          reg46 <= $signed($unsigned($signed($unsigned($signed(wire44)))));
          reg47 <= (wire44[(1'h1):(1'h1)] ? wire39[(3'h5):(3'h4)] : wire38);
          reg48 <= $unsigned(($unsigned(($signed(wire41) ?
                  wire39[(2'h3):(1'h0)] : (wire43 <= wire43))) ?
              {(reg47[(4'hb):(4'h9)] ?
                      reg46[(3'h4):(2'h3)] : (wire39 ? wire41 : reg45)),
                  wire41} : $signed(wire43)));
        end
      else
        begin
          if ($signed(({reg46[(5'h10):(4'hc)], reg48[(3'h5):(2'h3)]} ?
              (~&($unsigned((8'had)) || $unsigned(wire40))) : reg46)))
            begin
              reg45 <= ((8'hba) ~^ ({(reg46[(4'hf):(3'h5)] ?
                          wire43 : (~^(8'hbf)))} ?
                  (~&(^wire39)) : $unsigned(wire43)));
              reg46 <= wire41;
              reg47 <= $unsigned($unsigned((&(reg48 ?
                  $unsigned((8'hbf)) : {reg47}))));
            end
          else
            begin
              reg45 <= reg47[(2'h2):(1'h0)];
              reg46 <= wire41;
              reg47 <= (((reg46[(4'hb):(4'hb)] ?
                      wire41 : (|(~(8'ha0)))) <<< $unsigned(wire42[(1'h1):(1'h1)])) ?
                  $signed($signed(reg47)) : (($unsigned((wire39 * wire44)) ?
                          reg48[(4'ha):(3'h4)] : {$unsigned(reg47)}) ?
                      (|(~|(wire42 ?
                          reg45 : wire42))) : (($unsigned(wire41) <= $unsigned(wire39)) ?
                          wire39[(3'h4):(2'h3)] : $signed((wire38 ?
                              reg46 : wire38)))));
              reg48 <= ($unsigned(reg47[(2'h3):(1'h1)]) ?
                  $unsigned($unsigned((~wire41[(1'h0):(1'h0)]))) : (wire40[(2'h3):(2'h2)] ?
                      $signed($signed((&reg46))) : {{((8'hbb) - wire43),
                              reg45[(3'h7):(1'h1)]}}));
            end
          if (wire42)
            begin
              reg49 <= {(reg46[(2'h3):(2'h3)] > ((~^(reg47 == (7'h41))) == (|wire38)))};
              reg50 <= wire38[(3'h7):(3'h4)];
              reg51 <= wire41[(3'h5):(2'h2)];
            end
          else
            begin
              reg49 <= wire44;
              reg50 <= reg46;
              reg51 <= ($unsigned((-$unsigned((&wire43)))) ?
                  $unsigned($unsigned($signed($unsigned(reg50)))) : {$unsigned(reg50)});
              reg52 <= (wire39[(3'h5):(2'h3)] ^~ {$signed($signed({reg48,
                      wire42}))});
            end
          reg53 <= (((~^$signed((reg49 == reg50))) ?
                  (!reg46[(4'he):(4'h9)]) : reg47[(4'h8):(2'h3)]) ?
              (-(!($signed(reg46) ? (7'h41) : wire43))) : (8'hb0));
        end
      reg54 <= {reg52[(1'h1):(1'h1)], $signed(wire39[(2'h3):(2'h3)])};
      reg55 <= ($unsigned($signed(((reg49 ? reg51 : reg50) ?
          reg54[(4'he):(3'h4)] : $unsigned((7'h43))))) == {((reg48[(4'hf):(4'hc)] != (|wire38)) ?
              {(~^reg46)} : (reg46[(5'h10):(1'h0)] ?
                  (-reg49) : (wire38 ? reg48 : reg45))),
          wire38[(3'h4):(2'h3)]});
    end
  always
    @(posedge clk) begin
      reg56 <= {$unsigned({$unsigned(reg53),
              (wire39 ? (wire38 <= reg51) : (8'h9c))})};
      if ((~^{(~$unsigned((reg51 <= reg56))),
          $signed((reg46[(1'h1):(1'h1)] - (wire39 ? reg47 : (8'hbe))))}))
        begin
          if ((!$signed((((7'h40) == (wire39 - (8'hb9))) + (((8'ha6) ?
              (8'h9e) : reg51) < {reg51, wire40})))))
            begin
              reg57 <= $unsigned(reg56);
              reg58 <= reg53[(3'h7):(3'h6)];
              reg59 <= (~$unsigned((((8'h9f) ?
                  reg46[(4'hd):(4'hc)] : (~&wire43)) ^ wire44[(1'h0):(1'h0)])));
              reg60 <= wire39;
              reg61 <= (|((^~$signed($unsigned((8'hab)))) ?
                  reg54 : (&$signed(reg46[(4'h8):(3'h4)]))));
            end
          else
            begin
              reg57 <= wire39;
              reg58 <= {($signed(($unsigned(reg60) ?
                      wire43[(2'h2):(1'h0)] : (|reg48))) - (wire41[(2'h2):(1'h1)] ?
                      (8'h9c) : ({(8'hac)} * (reg61 ? reg45 : (8'hb2))))),
                  reg54[(3'h6):(3'h4)]};
              reg59 <= (($unsigned($unsigned(((8'had) >> reg45))) > $unsigned((((7'h42) ?
                  reg52 : reg53) || {reg55}))) ^~ $unsigned(wire43[(3'h5):(3'h5)]));
              reg60 <= $unsigned((reg46[(4'he):(2'h2)] ?
                  reg49[(4'hf):(3'h5)] : ($signed((wire42 ?
                      reg56 : (8'hbc))) ~^ (^~reg45))));
              reg61 <= $signed(reg58[(4'hf):(3'h5)]);
            end
        end
      else
        begin
          reg57 <= ((^~{{$unsigned(reg58), $signed((8'ha8))}}) ?
              $signed(reg53) : (~reg53[(3'h6):(1'h0)]));
        end
    end
  assign wire62 = $unsigned((!($signed($unsigned(reg57)) != (reg50[(3'h6):(3'h4)] ?
                      (8'ha1) : (reg58 ? reg51 : reg46)))));
  assign wire63 = ((~($signed(reg59[(1'h0):(1'h0)]) + reg46[(5'h12):(2'h3)])) & (({reg53} ?
                          reg56 : ({reg58} ?
                              $unsigned(wire44) : $unsigned(reg51))) ?
                      $unsigned(wire41[(3'h4):(2'h3)]) : ((wire42 & $signed(wire43)) ?
                          ((reg48 ^ reg47) & reg48[(4'hf):(4'hc)]) : ((reg50 ?
                                  reg61 : reg52) ?
                              (~|wire40) : $unsigned((8'hbb))))));
  assign wire64 = wire40[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg65 <= reg48[(4'h9):(1'h1)];
      reg66 <= reg54[(3'h4):(2'h2)];
      if ((wire64[(2'h2):(1'h1)] + (~|(8'hb8))))
        begin
          reg67 <= reg55[(4'he):(1'h0)];
          if ($unsigned({($unsigned($unsigned(reg45)) ?
                  {(+(8'ha4)), $signed((8'ha8))} : $signed($unsigned(reg61)))}))
            begin
              reg68 <= wire63[(4'h9):(3'h7)];
              reg69 <= $signed(reg59);
              reg70 <= ((|$unsigned($signed({reg66, wire41}))) ?
                  ((reg47[(3'h4):(1'h0)] - wire39[(1'h0):(1'h0)]) ?
                      $signed($unsigned((^~(8'hae)))) : reg49) : reg54);
            end
          else
            begin
              reg68 <= (~^{($unsigned((|reg68)) ?
                      (~^wire40[(2'h3):(2'h2)]) : reg49[(4'h8):(1'h0)])});
              reg69 <= $signed((8'ha6));
              reg70 <= $signed(($signed($signed($unsigned(reg47))) ?
                  reg52[(2'h3):(2'h3)] : reg48));
              reg71 <= wire41[(1'h0):(1'h0)];
            end
          reg72 <= wire63[(1'h1):(1'h1)];
          reg73 <= (({$unsigned(reg48)} ?
              (((!reg66) ? (reg53 ? (8'haf) : reg58) : $signed((8'hb6))) ?
                  reg52[(4'h8):(2'h3)] : (8'hac)) : wire43) <<< $unsigned(($unsigned(((8'hab) ?
                  reg68 : wire40)) ?
              $unsigned(reg46) : {$unsigned((7'h43))})));
        end
      else
        begin
          if ((wire38 + ((reg71 * ($unsigned(wire62) ?
                  wire62[(3'h7):(2'h3)] : reg54[(3'h7):(3'h4)])) ?
              reg67 : (reg72[(3'h6):(2'h2)] >= $unsigned((reg56 ?
                  reg54 : (8'ha8)))))))
            begin
              reg67 <= wire38[(4'h8):(1'h1)];
              reg68 <= (~|wire38);
              reg69 <= $signed(wire43);
              reg70 <= (8'haa);
              reg71 <= $unsigned((^$signed({(reg59 < reg61)})));
            end
          else
            begin
              reg67 <= (^wire43[(2'h3):(2'h2)]);
              reg68 <= $signed(reg69[(4'h9):(4'h8)]);
              reg69 <= wire64[(1'h0):(1'h0)];
            end
          if ((reg48 & $signed(reg48)))
            begin
              reg72 <= ($signed(reg53) <= $unsigned(wire40[(2'h2):(1'h0)]));
              reg73 <= reg47[(3'h4):(1'h1)];
              reg74 <= ($unsigned({$unsigned(reg71)}) ?
                  ($signed($signed((wire43 <= reg48))) ?
                      reg61[(5'h11):(3'h7)] : (reg55 + (|$signed(wire38)))) : ((reg54[(4'ha):(2'h3)] ?
                      (reg57 == {reg57}) : reg50[(3'h5):(1'h1)]) << $unsigned({reg66[(2'h2):(1'h0)],
                      $unsigned(reg46)})));
              reg75 <= reg61;
            end
          else
            begin
              reg72 <= wire38;
              reg73 <= reg75[(2'h2):(2'h2)];
              reg74 <= (-$signed((~^((reg70 ? wire62 : reg68) ?
                  $signed(reg48) : reg46))));
              reg75 <= reg67[(5'h10):(3'h5)];
            end
        end
      if ((^$signed((^~{(!wire43), $unsigned(reg70)}))))
        begin
          if ({(reg46 ?
                  $unsigned(wire40) : $unsigned(((wire38 && reg54) >> (wire39 ?
                      wire63 : reg75))))})
            begin
              reg76 <= (-($unsigned($signed((^wire42))) ?
                  (({(8'hbb)} ? reg46 : reg69) ?
                      wire40 : reg75) : reg51[(4'hb):(2'h3)]));
            end
          else
            begin
              reg76 <= {$unsigned(((8'hbd) <= ((wire38 >= reg51) || $unsigned(wire62))))};
              reg77 <= reg74[(1'h1):(1'h0)];
              reg78 <= reg58;
              reg79 <= $unsigned($unsigned(wire63[(4'ha):(3'h5)]));
            end
          reg80 <= {({reg49[(3'h4):(3'h4)],
                  ($unsigned(reg53) <<< reg66)} && (reg65[(4'he):(3'h4)] ?
                  $unsigned(reg71[(4'h8):(3'h5)]) : $signed(reg76))),
              (8'hae)};
          reg81 <= wire39;
          reg82 <= reg45[(4'hd):(4'ha)];
          if (reg75)
            begin
              reg83 <= (^~reg59[(3'h6):(3'h5)]);
              reg84 <= (reg52 ?
                  (~($unsigned(((8'ha3) > wire41)) < $signed((wire40 && reg51)))) : ($unsigned((|((8'ha0) <<< reg77))) < ($unsigned(((8'h9d) & reg56)) >>> reg48)));
              reg85 <= $signed({(-$signed($signed((8'hb0))))});
            end
          else
            begin
              reg83 <= ($unsigned({((reg82 >= wire62) > {reg66})}) >>> $signed(reg51[(4'ha):(4'h9)]));
            end
        end
      else
        begin
          reg76 <= (reg54[(3'h7):(2'h2)] & reg83[(4'ha):(4'h9)]);
          if (reg57)
            begin
              reg77 <= $signed(((reg49[(4'hf):(3'h4)] ?
                  (!(+reg79)) : (~^$unsigned(reg67))) >> ($unsigned(reg80) * (8'haa))));
              reg78 <= $unsigned($unsigned(wire39[(3'h4):(1'h0)]));
            end
          else
            begin
              reg77 <= (+(wire62 ?
                  $unsigned(reg74) : $unsigned($unsigned(wire63[(3'h6):(2'h2)]))));
              reg78 <= (((~&((reg84 != reg54) != $unsigned(reg54))) ?
                      wire63[(2'h3):(2'h3)] : reg49[(3'h7):(2'h3)]) ?
                  $unsigned($unsigned(reg81[(2'h3):(1'h0)])) : ((reg70 ?
                          ((reg47 ?
                              reg55 : wire64) && (~|(7'h41))) : reg85[(4'h8):(4'h8)]) ?
                      $signed(($unsigned(reg85) >= $unsigned((8'ha5)))) : (reg55 ^~ (reg50 != ((8'h9d) ?
                          wire44 : wire42)))));
              reg79 <= wire41[(3'h5):(3'h4)];
            end
        end
      reg86 <= {(($unsigned(reg73) < reg50) ?
              wire43 : (|$signed($unsigned(wire62))))};
    end
  assign wire87 = reg58;
  assign wire88 = $signed(wire87[(4'h8):(3'h5)]);
  assign wire89 = $signed((reg61[(2'h2):(1'h0)] ?
                      {$unsigned(reg60[(4'h8):(1'h1)])} : ((8'hb0) ?
                          (-$unsigned(reg81)) : {(^~reg58)})));
  assign wire90 = (^~(((!(8'hb6)) | ($signed(reg85) ?
                          $unsigned(wire38) : (reg84 ? reg65 : reg79))) ?
                      {wire89} : $signed($signed({(8'hb3)}))));
  assign wire91 = reg58[(3'h4):(1'h0)];
  assign wire92 = reg77[(3'h5):(3'h4)];
  assign wire93 = wire38[(3'h7):(3'h4)];
endmodule

module module17
#(parameter param33 = {(~&({((7'h40) ? (8'hbb) : (8'h9e))} != ({(8'hbc)} >> ((8'h9d) ? (8'ha0) : (8'had)))))})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 wire23,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = $signed(wire22);
  assign wire24 = wire22[(4'hb):(3'h5)];
  assign wire25 = (wire22[(2'h3):(1'h1)] ?
                      ({$unsigned($unsigned(wire23)),
                          $unsigned(((8'ha2) ?
                              wire24 : wire20))} == $signed(wire24[(5'h12):(4'ha)])) : (wire20 ?
                          (~^($unsigned((7'h44)) ?
                              (wire21 == wire20) : $signed((8'hb6)))) : ($unsigned((wire20 * wire20)) >>> (~wire20[(3'h7):(1'h0)]))));
  always
    @(posedge clk) begin
      reg26 <= (~^$signed((^$signed((8'h9e)))));
      reg27 <= wire22;
    end
  assign wire28 = wire25[(3'h6):(3'h6)];
  assign wire29 = ((~wire23) ?
                      $signed((($signed(wire20) ?
                          (wire18 ?
                              wire19 : wire21) : $unsigned(wire25)) ~^ $unsigned((~^(8'hb8))))) : $unsigned(wire21));
  assign wire30 = ((^$signed(wire20)) >> ((((-(8'hb8)) ?
                          wire23[(2'h2):(1'h1)] : (+wire20)) & $unsigned(wire19)) ?
                      $signed(({wire25} <<< (wire18 ?
                          wire23 : wire19))) : ((^{wire21,
                          wire18}) & (wire24 || $signed(wire24)))));
  assign wire31 = ({({wire30, reg26[(1'h0):(1'h0)]} == {(wire22 ?
                              wire22 : wire29)}),
                      ($unsigned(wire19) ?
                          ((wire23 ? wire22 : wire29) != {wire24,
                              wire29}) : (reg27 ~^ wire21[(4'h9):(1'h1)]))} && (wire23[(3'h6):(3'h5)] ?
                      ($signed($signed(wire18)) && wire24) : (~{(reg26 ?
                              wire28 : (8'hb2)),
                          (8'ha9)})));
  assign wire32 = {wire18};
endmodule
