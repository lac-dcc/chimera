module top
#(parameter param198 = (~|{({((8'hbf) ? (8'hbd) : (8'hb0))} >= (((7'h40) ^~ (8'ha2)) ? ((8'hb3) ? (7'h43) : (8'hab)) : ((7'h42) <= (8'ha6)))), (&((8'hb6) >> (^(7'h44))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire197;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire195;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire197,
                 wire5,
                 wire12,
                 wire13,
                 wire16,
                 wire135,
                 wire195,
                 reg15,
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(4'he):(2'h3)];
  always
    @(posedge clk) begin
      if ({wire0})
        begin
          reg6 <= {(&$signed($unsigned($unsigned(wire5))))};
          reg7 <= (wire1 | $signed(((wire0[(4'hd):(1'h1)] ?
                  (wire3 ? (8'h9f) : (7'h41)) : {wire4, wire4}) ?
              (^wire4[(2'h3):(1'h0)]) : wire2)));
        end
      else
        begin
          reg6 <= reg6[(3'h4):(1'h1)];
          reg7 <= ((8'had) ?
              reg7[(4'h8):(3'h4)] : {{((wire3 ? wire1 : wire1) ?
                          wire1[(3'h6):(3'h6)] : (wire4 >> (7'h44)))}});
          reg8 <= $signed(($signed(wire0) ?
              {(~&(~|reg7)),
                  reg6[(1'h0):(1'h0)]} : $unsigned($signed((wire5 ^~ wire3)))));
        end
      reg9 <= $signed((^reg7));
      reg10 <= (~&($signed(($unsigned(wire0) == reg7)) <<< (8'haf)));
      reg11 <= {$signed(reg8)};
    end
  assign wire12 = reg8;
  assign wire13 = $unsigned((~|(((wire0 >= reg8) * wire12[(4'h8):(3'h4)]) ?
                      wire5 : wire1[(5'h14):(4'hd)])));
  always
    @(posedge clk) begin
      reg14 <= $unsigned((wire1[(3'h5):(2'h2)] != reg8[(3'h4):(1'h0)]));
      reg15 <= wire4;
    end
  assign wire16 = $signed((~&(&$signed(reg10[(2'h2):(1'h1)]))));
  module17 #() modinst136 (.clk(clk), .wire19(reg8), .wire18(reg7), .y(wire135), .wire20(reg10), .wire21(reg9));
  module137 #() modinst196 (.wire142(wire1), .wire139(wire3), .wire141(reg11), .clk(clk), .y(wire195), .wire138(wire12), .wire140(reg8));
  assign wire197 = $unsigned(reg14[(5'h10):(5'h10)]);
endmodule

module module137
#(parameter param194 = (-(({((8'hbb) + (8'hba))} ? {((8'ha1) ? (8'hbc) : (8'hb9)), ((8'had) <= (8'hb0))} : ((^(8'hb7)) >>> (^(7'h42)))) ? {((~|(8'hb6)) ? {(7'h41), (8'hb3)} : (&(8'hb8))), (^~(-(8'hb9)))} : (^~(((7'h43) ? (8'hba) : (8'hbc)) || (+(8'hbd)))))))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire142;
  input wire [(5'h14):(1'h0)] wire141;
  input wire signed [(4'hd):(1'h0)] wire140;
  input wire [(5'h10):(1'h0)] wire139;
  input wire [(5'h10):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire192;
  wire signed [(3'h7):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire166;
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire182,
                 wire168,
                 wire166,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
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
                 (1'h0)};
  module143 #() modinst167 (wire166, clk, wire142, wire141, wire138, wire139);
  assign wire168 = ((~wire166) | (($signed((~&wire142)) ?
                           ($signed(wire139) ?
                               wire166[(1'h1):(1'h0)] : (wire138 ?
                                   (8'haa) : wire141)) : $signed((~wire140))) ?
                       wire166 : ($signed(((7'h41) > wire166)) ?
                           $unsigned(wire140[(4'hc):(4'hc)]) : $unsigned(wire142))));
  always
    @(posedge clk) begin
      reg169 <= ((($unsigned($unsigned(wire138)) <<< wire139) ?
          $signed(wire166[(3'h7):(2'h3)]) : wire139[(4'hd):(1'h0)]) <= (wire138 ?
          wire168[(4'hd):(3'h4)] : wire139[(4'he):(4'hc)]));
      reg170 <= wire138[(5'h10):(1'h1)];
      if (((($unsigned((wire140 ?
                  wire168 : wire168)) ^~ {wire139[(2'h2):(2'h2)],
                  $unsigned(wire142)}) ?
              $signed((~^((8'had) ?
                  (8'hbe) : (8'ha8)))) : reg170[(1'h1):(1'h1)]) ?
          $unsigned(wire140[(3'h5):(2'h2)]) : (~^($signed((reg170 & reg170)) ?
              ({wire141} ?
                  wire142[(4'hb):(1'h0)] : (~(8'ha4))) : ((wire141 ^ wire168) ?
                  wire141[(5'h11):(1'h0)] : wire166)))))
        begin
          reg171 <= (((+(~|(wire140 == wire140))) * $signed((!{reg170,
                  wire142}))) ?
              $unsigned($unsigned({(~^wire140)})) : wire166);
        end
      else
        begin
          if (($signed((8'hbc)) ?
              ((~^(-{wire141})) ?
                  ($signed(reg170) ?
                      (wire166[(3'h7):(1'h1)] && {(8'ha5)}) : wire138) : (7'h42)) : $unsigned($unsigned((^$unsigned(wire166))))))
            begin
              reg171 <= {wire141};
              reg172 <= (~^(wire142 ?
                  (~$signed($signed(wire139))) : wire138[(1'h0):(1'h0)]));
              reg173 <= reg169;
            end
          else
            begin
              reg171 <= (((-{(wire168 + reg171), $signed(reg173)}) ?
                  reg171 : wire166) >>> wire140[(4'hb):(3'h5)]);
            end
          if ((wire166 ?
              (~^$unsigned($unsigned((^~wire168)))) : (+wire141[(5'h13):(4'hc)])))
            begin
              reg174 <= reg169[(2'h2):(2'h2)];
              reg175 <= $signed((wire168 ^~ (wire139 <= (^((8'hb2) <<< (8'hab))))));
              reg176 <= (^$signed((reg169 ?
                  $unsigned((reg174 & reg169)) : reg171)));
              reg177 <= $signed(({reg170} ?
                  (reg171[(3'h6):(2'h2)] <= wire140) : reg169[(3'h5):(3'h5)]));
            end
          else
            begin
              reg174 <= $unsigned({(((reg171 ? reg176 : wire140) ?
                          $unsigned(wire139) : (wire168 ^ reg177)) ?
                      reg172 : (&$signed(wire139))),
                  reg171});
              reg175 <= reg174[(4'hc):(2'h2)];
              reg176 <= (~reg174);
              reg177 <= (~^{($signed(reg172) | $unsigned(((8'hb9) ?
                      wire140 : reg169)))});
              reg178 <= ((~^$signed($signed($signed(reg171)))) | (^~wire166));
            end
          reg179 <= $signed(((!$unsigned($signed(reg177))) * $signed(((reg174 ?
              reg172 : reg172) ^~ $signed(reg174)))));
          reg180 <= $unsigned((($unsigned(reg173) ?
                  wire139[(3'h6):(2'h2)] : wire166) ?
              $signed(wire168[(4'hc):(4'hc)]) : wire138[(5'h10):(4'hc)]));
          reg181 <= wire140;
        end
    end
  assign wire182 = wire142;
  always
    @(posedge clk) begin
      reg183 <= $unsigned(reg174);
      if ((wire168 ?
          ((|reg175[(4'he):(3'h5)]) ?
              $signed((~|(+(8'hb2)))) : (-($unsigned(wire139) ?
                  $unsigned(wire166) : (reg176 ?
                      wire141 : reg171)))) : wire140))
        begin
          reg184 <= ((+$unsigned((~&wire182[(1'h1):(1'h1)]))) + wire140);
          reg185 <= $unsigned($unsigned(reg171));
        end
      else
        begin
          if ((8'h9e))
            begin
              reg184 <= $signed(($unsigned(wire142[(3'h6):(2'h2)]) && reg172[(2'h3):(1'h0)]));
              reg185 <= $signed((8'hb4));
            end
          else
            begin
              reg184 <= (($unsigned(($signed((7'h43)) ? reg171 : (~wire138))) ?
                      {(-reg175)} : ({(reg183 != wire140)} ?
                          (-$unsigned(reg183)) : (reg176[(1'h0):(1'h0)] <<< (wire182 >>> (7'h41))))) ?
                  $unsigned(reg180) : (wire139[(4'hc):(1'h0)] ?
                      ((reg173 ?
                          (&(8'ha1)) : (wire142 ?
                              reg169 : reg174)) * (reg180[(1'h0):(1'h0)] ?
                          $unsigned(reg170) : wire141[(5'h13):(4'ha)])) : (({reg181,
                              reg174} - (wire168 >= reg171)) ?
                          ($signed(wire141) ~^ $signed((8'hae))) : ($signed((8'h9d)) ?
                              $signed(reg177) : (|wire141)))));
              reg185 <= reg177[(2'h3):(2'h3)];
              reg186 <= $signed({reg171});
            end
          reg187 <= {$unsigned($signed(reg186[(2'h2):(2'h2)])),
              reg171[(3'h6):(1'h1)]};
          if ({reg178})
            begin
              reg188 <= $unsigned($signed((($signed(reg180) ?
                  reg181[(3'h4):(1'h1)] : (wire142 + wire139)) == (8'ha2))));
              reg189 <= $signed(wire141[(3'h6):(1'h0)]);
              reg190 <= reg170[(1'h1):(1'h1)];
              reg191 <= {$unsigned($signed(reg189[(5'h10):(3'h7)]))};
            end
          else
            begin
              reg188 <= (!{(-$unsigned($signed(reg186))),
                  $unsigned((^~$unsigned(reg187)))});
              reg189 <= $signed(($unsigned($unsigned(reg188[(5'h11):(1'h0)])) - $signed(reg179)));
            end
        end
    end
  assign wire192 = {reg176};
  assign wire193 = wire139;
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire91;
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire99,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire36,
                 wire91,
                 reg130,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg98,
                 (1'h0)};
  module22 #() modinst37 (wire36, clk, wire19, wire21, wire20, wire18, (8'hb8));
  module38 #() modinst92 (.clk(clk), .y(wire91), .wire41(wire19), .wire43(wire36), .wire42(wire21), .wire40(wire18), .wire39(wire20));
  assign wire93 = $signed(wire21);
  assign wire94 = wire21[(2'h2):(1'h1)];
  assign wire95 = ($signed($signed($unsigned($signed(wire19)))) ?
                      (8'ha6) : ($unsigned($unsigned((wire36 ?
                          (8'h9c) : (8'h9f)))) && (wire94 ^~ wire93)));
  assign wire96 = (wire36[(3'h7):(3'h7)] >= (^~(~|{wire93})));
  assign wire97 = {(~^$signed($unsigned($unsigned(wire96))))};
  always
    @(posedge clk) begin
      reg98 <= $signed(wire18[(2'h2):(1'h1)]);
    end
  assign wire99 = wire91;
  module100 #() modinst121 (.wire102(wire99), .y(wire120), .wire103(wire21), .wire101(wire20), .wire104(wire19), .clk(clk));
  assign wire122 = ((&(wire20[(4'h8):(3'h7)] ?
                           $unsigned((~^wire21)) : wire93)) ?
                       (!wire18[(4'ha):(3'h5)]) : ($unsigned($unsigned((!reg98))) >= (wire96 ?
                           $unsigned($signed(wire93)) : (~^(wire94 == wire93)))));
  assign wire123 = (^~(+wire97));
  assign wire124 = wire20;
  always
    @(posedge clk) begin
      reg125 <= ({(8'ha8)} ?
          $signed(((&(&wire93)) || $signed({wire94}))) : {wire122[(2'h3):(2'h2)]});
      reg126 <= $signed((!(8'hb1)));
      reg127 <= $signed($signed(wire21));
      reg128 <= {((!wire93) ?
              (wire124 ^~ reg98[(2'h3):(1'h1)]) : (((wire99 ?
                  wire97 : reg127) ^ wire120) >> ((~^wire96) + ((8'hb8) ?
                  wire97 : reg126)))),
          (!$unsigned(((reg98 ? (8'haf) : reg98) >> (wire20 <<< wire19))))};
    end
  assign wire129 = $signed($unsigned((reg127 ~^ wire94[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg130 <= (({$unsigned($signed(wire18)),
          $signed((wire94 ?
              (8'ha8) : reg127))} <<< $unsigned({wire97[(4'h8):(3'h4)]})) > $unsigned((wire20 * (wire18 ~^ wire122[(4'hd):(3'h4)]))));
    end
  assign wire131 = $unsigned(($signed({wire93[(2'h3):(1'h1)], reg127}) ?
                       (~$unsigned($unsigned(wire36))) : $signed($unsigned((-reg130)))));
  assign wire132 = reg126[(4'h8):(1'h1)];
  assign wire133 = ($signed($unsigned(wire95)) - wire91);
  assign wire134 = ((wire122 - wire95) ?
                       {$signed($unsigned((~&wire120))),
                           wire21[(1'h0):(1'h0)]} : (({(~wire99),
                               reg98} > ((&wire129) <<< wire96[(3'h4):(2'h2)])) ?
                           wire94 : wire122[(3'h6):(2'h2)]));
endmodule

module module100
#(parameter param119 = {{({(-(8'hbc))} & (((8'hbd) > (8'hb0)) ? (8'ha5) : ((8'h9f) < (8'hb4)))), ((8'h9f) * {((8'hbb) & (8'hba))})}, ((~(~&((8'haf) == (8'hb8)))) < {(^~((7'h40) <= (8'hb1)))})})
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire104;
  input wire [(3'h7):(1'h0)] wire103;
  input wire [(3'h6):(1'h0)] wire102;
  input wire [(5'h13):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire106,
                 wire105,
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
                 (1'h0)};
  assign wire105 = $signed((wire104 ?
                       $signed(wire104) : wire102[(3'h4):(1'h1)]));
  assign wire106 = ($signed(wire101) <= (($unsigned((~wire105)) + (wire102[(2'h2):(1'h0)] ?
                       wire103[(2'h3):(2'h3)] : (wire101 >= wire105))) <= (wire103 ?
                       wire103 : $signed((wire102 ? wire101 : (8'haa))))));
  always
    @(posedge clk) begin
      reg107 <= $signed(wire104[(2'h2):(1'h0)]);
      reg108 <= ($signed(wire104[(1'h1):(1'h1)]) - $signed((~wire101[(2'h3):(1'h1)])));
      if (wire103)
        begin
          reg109 <= ({wire103,
              (~$unsigned(wire106[(4'ha):(1'h0)]))} <<< (+(($unsigned(reg107) && wire101) ?
              $unsigned($signed(wire104)) : reg108)));
          reg110 <= (!(8'hbb));
          reg111 <= $unsigned($unsigned(wire103));
          if (($unsigned(($unsigned(wire105) ?
                  $signed((+wire102)) : reg107[(1'h0):(1'h0)])) ?
              $signed($signed($signed(wire104))) : $unsigned((reg109 > reg110))))
            begin
              reg112 <= $signed((+$signed(((reg108 ?
                  wire106 : reg110) >> (reg107 < reg111)))));
              reg113 <= reg112;
              reg114 <= $signed($signed(wire104));
              reg115 <= reg111;
            end
          else
            begin
              reg112 <= ($signed($unsigned(($signed((7'h42)) ?
                      $unsigned((8'ha2)) : $signed(wire101)))) ?
                  ($unsigned(((+reg107) ?
                      $signed(wire105) : wire103[(3'h6):(1'h0)])) >>> reg108[(4'ha):(3'h7)]) : $unsigned((wire106[(1'h1):(1'h0)] - ((reg114 ?
                      (8'ha9) : wire101) > (8'hb7)))));
              reg113 <= (~&(-wire104));
            end
          reg116 <= reg108[(4'ha):(3'h4)];
        end
      else
        begin
          reg109 <= $signed(($unsigned({$signed(reg112), $signed(wire105)}) ?
              (^~reg110) : $unsigned(($unsigned(reg116) * $unsigned(wire101)))));
          reg110 <= (^(8'hbe));
          reg111 <= $signed(($signed($unsigned($unsigned(reg110))) > reg108[(4'h8):(3'h6)]));
          reg112 <= (^$signed((^~(~^(wire103 ? reg110 : reg116)))));
        end
    end
  assign wire117 = $signed((!reg113));
  assign wire118 = reg111[(3'h5):(3'h4)];
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  input wire signed [(4'h8):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg75,
                 reg72,
                 reg71,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~|$signed(wire39[(1'h1):(1'h0)])) ?
          $unsigned($unsigned($signed((&wire39)))) : $signed($signed(wire41[(4'he):(1'h0)]))))
        begin
          reg44 <= wire43;
          reg45 <= $signed((($unsigned($signed(wire43)) == (((8'ha0) ?
                  wire41 : reg44) || $signed((8'hb7)))) ?
              (&wire43[(2'h3):(2'h3)]) : $unsigned((^~(reg44 & (8'hb8))))));
          if (reg44)
            begin
              reg46 <= wire40;
              reg47 <= wire43[(4'ha):(3'h6)];
            end
          else
            begin
              reg46 <= (~&$signed($unsigned(((!(8'ha8)) ?
                  ((8'hb2) ? wire39 : reg46) : $unsigned((8'ha7))))));
              reg47 <= $unsigned(((^~{$unsigned(wire39),
                  reg45[(1'h0):(1'h0)]}) >= ((&$unsigned(wire42)) ?
                  $signed($unsigned(wire42)) : wire43[(4'h8):(1'h1)])));
              reg48 <= wire41[(2'h3):(1'h0)];
              reg49 <= ((7'h42) << ((((reg44 - reg44) || (reg45 != reg44)) + (wire43[(2'h3):(1'h1)] ?
                      $unsigned(wire43) : (wire43 ? (8'hae) : wire41))) ?
                  (^$unsigned($signed(wire41))) : reg46));
            end
        end
      else
        begin
          if ($signed($signed(reg49)))
            begin
              reg44 <= reg48;
              reg45 <= (8'ha3);
              reg46 <= {$unsigned(wire40),
                  $signed($unsigned((|$unsigned(wire40))))};
              reg47 <= ((!(reg45[(4'hb):(2'h2)] ?
                      ((~|wire43) ?
                          reg49 : (~&wire40)) : ((wire41 ~^ wire41) >= (reg47 ?
                          reg45 : wire40)))) ?
                  $unsigned(reg47) : $unsigned((~|wire40)));
              reg48 <= ($unsigned((((wire40 ? wire43 : reg44) ?
                      wire42 : (~reg46)) ?
                  wire41 : ((~|reg46) ?
                      (wire39 ^~ (8'h9c)) : $unsigned(reg46)))) && (reg49[(1'h1):(1'h0)] ?
                  (+(((8'hbc) || reg45) ?
                      (wire42 ? reg49 : reg47) : $signed((8'hb0)))) : reg49));
            end
          else
            begin
              reg44 <= ((reg45[(4'hd):(2'h2)] != (((wire42 ?
                  reg49 : reg47) < $signed(wire41)) >>> (~^$unsigned((7'h42))))) ^ $unsigned(($unsigned((reg46 ?
                      wire40 : wire43)) ?
                  $unsigned($signed(wire42)) : ($unsigned(reg48) ?
                      {wire40, wire41} : $unsigned((8'hb7))))));
              reg45 <= (8'ha1);
            end
        end
      reg50 <= wire43[(4'hc):(4'ha)];
      if ((+reg46))
        begin
          reg51 <= (-(wire39[(2'h3):(2'h3)] << wire39[(3'h4):(1'h1)]));
          reg52 <= $signed(reg44);
          reg53 <= wire42;
        end
      else
        begin
          if ((8'ha2))
            begin
              reg51 <= {(|$unsigned({reg53})), reg51[(4'h9):(3'h4)]};
            end
          else
            begin
              reg51 <= (7'h43);
              reg52 <= ({$unsigned($signed(reg49)),
                      (($signed((8'hab)) ? $signed(reg45) : wire39) ?
                          (reg47 ? {reg51} : (reg50 >>> wire42)) : ((reg47 ?
                                  wire39 : wire40) ?
                              (wire40 ? reg45 : wire43) : $unsigned(reg48)))} ?
                  (8'ha2) : wire40);
              reg53 <= $signed(wire39[(3'h5):(3'h4)]);
              reg54 <= wire43;
              reg55 <= (($unsigned(wire40[(4'ha):(3'h4)]) ?
                  wire42[(2'h3):(1'h1)] : (|$signed({wire42,
                      wire39}))) <= $unsigned(wire41));
            end
          if ($signed(reg47[(1'h0):(1'h0)]))
            begin
              reg56 <= $signed(reg50);
              reg57 <= reg56;
              reg58 <= {reg45};
              reg59 <= (((wire39[(3'h7):(3'h6)] * (&(wire42 != reg51))) ?
                  ($signed($signed(reg49)) ?
                      reg44 : ($signed(reg51) ?
                          reg52[(2'h2):(2'h2)] : $unsigned((8'ha1)))) : (~^(8'hb0))) ~^ {$signed((8'haa))});
              reg60 <= ($unsigned((reg53[(3'h6):(3'h6)] ?
                      (~&{reg49, wire40}) : $unsigned((wire39 ?
                          reg44 : wire40)))) ?
                  $unsigned(wire40) : $unsigned(reg45[(4'ha):(3'h5)]));
            end
          else
            begin
              reg56 <= $signed($signed(wire39));
              reg57 <= $unsigned($signed($unsigned((^~$signed(reg51)))));
            end
          reg61 <= wire40[(4'h9):(3'h7)];
        end
      if (reg53)
        begin
          if ((!$unsigned((~^reg51))))
            begin
              reg62 <= {(reg61[(4'ha):(3'h7)] | wire40[(3'h4):(1'h1)])};
            end
          else
            begin
              reg62 <= (reg51 ^~ ($unsigned({reg60}) <= $unsigned(reg55)));
              reg63 <= $signed($unsigned((reg55[(4'hd):(1'h1)] ?
                  ((reg49 ? reg57 : reg49) ?
                      reg55 : $signed((8'hbf))) : ($unsigned(reg60) ?
                      (reg51 | reg57) : (8'haf)))));
              reg64 <= $unsigned(reg52);
              reg65 <= reg48;
              reg66 <= reg63[(5'h14):(4'ha)];
            end
          reg67 <= $unsigned(reg66[(2'h2):(1'h1)]);
          reg68 <= ($signed($unsigned(((reg48 ? reg53 : wire39) ?
                  {(8'hbf), (8'h9c)} : $unsigned(wire42)))) ?
              $signed((($signed(reg55) ?
                  (reg61 ?
                      reg57 : reg61) : (~reg63)) <= ((^wire41) > $unsigned(reg64)))) : (((^~$signed((8'hab))) ?
                  (wire43 ?
                      (reg56 * (8'ha8)) : (reg66 ?
                          reg62 : reg54)) : $signed({reg44})) < $signed((-$signed(reg58)))));
          if (((reg53 ? reg61[(4'he):(4'ha)] : $unsigned(reg52)) ?
              $signed(($signed((reg64 >> reg50)) ?
                  ((reg61 ~^ reg48) ? {reg45} : $signed(wire43)) : {(reg48 ?
                          reg56 : reg59),
                      $signed(reg57)})) : reg67))
            begin
              reg69 <= (~^((^(wire42 ? $unsigned(reg62) : (reg49 * wire42))) ?
                  {($signed(reg51) == $signed(reg51))} : $unsigned($signed((^~reg57)))));
              reg70 <= ((^~($unsigned((!wire41)) >= ((^reg66) ?
                  (~|(8'had)) : $unsigned(reg44)))) ^ (8'ha9));
            end
          else
            begin
              reg69 <= ((((~|(~|(8'hb7))) ^ ($unsigned(reg53) <<< $unsigned(reg55))) >= (&$signed({reg66,
                      reg49}))) ?
                  $unsigned(reg66) : reg66);
              reg70 <= ($signed(wire39) >>> $unsigned((-($signed((8'hb9)) ?
                  (reg45 ? reg59 : reg47) : (reg53 ? (8'hb7) : (8'hb7))))));
              reg71 <= $signed($signed(reg48[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg62 <= ($signed(((reg67 && reg47) ?
                  ((reg53 > reg48) ?
                      $unsigned(reg58) : (reg69 != (8'h9d))) : {$signed(reg60),
                      (reg54 <<< reg70)})) ?
              reg58[(1'h0):(1'h0)] : (~&reg61[(4'hd):(4'hc)]));
          reg63 <= (&(~^reg46[(2'h3):(1'h0)]));
          reg64 <= reg68;
        end
      reg72 <= $signed((8'hba));
    end
  assign wire73 = wire40[(3'h5):(2'h2)];
  assign wire74 = (+{$signed((reg53[(2'h3):(1'h1)] ?
                          $signed(reg71) : reg53[(1'h1):(1'h0)])),
                      (^~(reg48 < {reg51, reg66}))});
  always
    @(posedge clk) begin
      reg75 <= (+$unsigned((wire74[(2'h3):(2'h2)] ^ ((~^wire73) << {reg57}))));
    end
  assign wire76 = ((&(8'hbd)) ?
                      (({reg58} ?
                          $signed($signed(reg64)) : reg68) + reg46) : $signed($signed({(reg72 ?
                              (8'had) : (8'hbd))})));
  assign wire77 = reg65[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg78 <= {(7'h43), reg55};
      reg79 <= reg48[(3'h4):(2'h3)];
      reg80 <= reg52;
      reg81 <= (reg54 != reg59[(1'h1):(1'h0)]);
    end
  assign wire82 = ($signed(((reg66 ? reg47[(1'h0):(1'h0)] : (reg51 - reg65)) ?
                          $unsigned($unsigned(wire40)) : wire43[(2'h2):(1'h0)])) ?
                      (reg62[(3'h4):(1'h1)] ?
                          (~|$signed((~reg59))) : reg47[(3'h5):(1'h1)]) : reg64);
  assign wire83 = reg70[(4'h9):(3'h5)];
  assign wire84 = $signed(wire76[(4'ha):(3'h7)]);
  assign wire85 = $signed($signed($unsigned(reg71)));
  assign wire86 = $unsigned(reg60[(5'h10):(4'hc)]);
  assign wire87 = $unsigned(((wire76 * reg64) ?
                      reg62[(1'h1):(1'h1)] : wire82[(3'h6):(2'h3)]));
  assign wire88 = (!(8'h9c));
  assign wire89 = reg53;
  assign wire90 = $signed(((reg47 ?
                      (wire88[(3'h4):(1'h0)] ?
                          (wire77 ?
                              reg70 : reg49) : {reg66}) : reg64) << $unsigned(reg45)));
endmodule

module module22
#(parameter param34 = ((((~&(8'had)) <= (-{(8'hb3)})) ^ (({(8'hbd)} ? ((7'h43) * (8'ha7)) : ((7'h40) ? (8'hb0) : (8'ha0))) ? {((8'ha1) ? (8'ha8) : (8'hac))} : ({(8'hbb)} ? (|(7'h41)) : ((8'ha2) ^~ (8'hac))))) >> (((((8'ha0) > (8'ha7)) ? {(8'h9c)} : ((8'ha3) ? (8'h9c) : (8'hb4))) > ((!(8'ha5)) << ((8'ha3) > (8'ha2)))) ? (~^({(8'hae)} ? (~&(8'ha8)) : ((8'hb4) ? (8'haf) : (8'hba)))) : (((^(8'hac)) + ((8'hbc) ? (8'hb9) : (7'h40))) ? {(8'hb6)} : (~|((8'hb1) ? (8'hbf) : (7'h44)))))), 
parameter param35 = {(((&(-param34)) <= (8'hb5)) ? (param34 >>> param34) : (({param34, param34} + param34) ? ((^~param34) <<< (^~param34)) : param34)), (&(param34 ? param34 : (!(~param34))))})
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = wire23[(4'h8):(3'h5)];
  assign wire29 = $signed($signed($signed($unsigned((!wire24)))));
  assign wire30 = ($unsigned(wire26) | {{wire28[(3'h6):(3'h4)]},
                      (wire29 ?
                          ((wire28 ^ wire29) | (^~(8'hb6))) : $signed((!wire24)))});
  assign wire31 = (!(~&(8'hb4)));
  assign wire32 = (^~$signed((+(&(wire26 ? wire27 : wire30)))));
  assign wire33 = wire26;
endmodule

module module143
#(parameter param165 = ((((|(|(8'hbb))) ? {((8'hb1) >> (8'ha0)), (|(8'hbd))} : (((7'h40) << (8'hba)) < {(8'hb7)})) ? {{(^~(8'hbb)), (7'h42)}} : (^(((8'hb2) * (8'hac)) ? {(8'ha3), (8'haf)} : ((8'ha6) ? (8'hb0) : (8'ha4))))) ? ((+(^((8'ha4) ? (8'hb0) : (8'ha1)))) ? ((((8'hb6) ^ (8'hae)) ? ((8'haa) ? (8'haf) : (7'h40)) : ((8'ha3) << (8'ha5))) ? (+((8'ha5) ? (8'ha6) : (8'ha3))) : {(^(8'hb0))}) : (((~|(8'h9f)) ? {(8'hac)} : ((7'h43) ? (8'ha9) : (7'h41))) << (((8'ha8) + (8'ha0)) == ((8'hb5) >>> (8'ha8))))) : {{{((7'h44) ? (8'ha9) : (8'ha3))}}, (|(~&((8'h9e) ~^ (8'ha1))))}))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire147;
  input wire [(5'h14):(1'h0)] wire146;
  input wire signed [(2'h3):(1'h0)] wire145;
  input wire signed [(4'ha):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(3'h4):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= ($unsigned(wire146[(5'h11):(4'hf)]) == wire145);
      reg149 <= wire145[(1'h1):(1'h0)];
    end
  assign wire150 = $unsigned(((|$unsigned(wire147)) ?
                       (wire146 ?
                           $unsigned(reg149) : wire145[(1'h0):(1'h0)]) : $signed(reg149[(3'h4):(2'h2)])));
  assign wire151 = $unsigned($unsigned($unsigned($signed($signed(wire147)))));
  assign wire152 = ($unsigned($unsigned(wire151)) == (wire151[(4'ha):(3'h4)] + {reg148}));
  assign wire153 = reg148;
  assign wire154 = $signed($unsigned($unsigned(reg149[(3'h7):(2'h3)])));
  assign wire155 = (~$signed(wire145));
  assign wire156 = ({((~|reg149[(1'h0):(1'h0)]) >= (7'h40)),
                           $unsigned($unsigned($unsigned(wire145)))} ?
                       $signed(((~^(wire151 ?
                           (8'hb9) : wire153)) || (wire153[(3'h6):(1'h0)] ?
                           (wire155 | wire144) : (^~(8'ha7))))) : wire153[(3'h7):(2'h3)]);
  assign wire157 = {(wire152[(1'h0):(1'h0)] ?
                           $unsigned((reg148[(3'h4):(2'h2)] + {(8'ha9),
                               wire154})) : (8'ha4)),
                       wire155[(4'hc):(3'h7)]};
  assign wire158 = ((-$unsigned(wire150)) ?
                       (-$signed(wire153[(4'hc):(4'h8)])) : {$signed(($signed((8'hae)) * (wire152 >> (8'h9f)))),
                           wire152[(3'h5):(1'h1)]});
  assign wire159 = ({(~|(8'hb7)),
                           ($signed(wire147[(2'h3):(2'h2)]) <= ((wire152 <<< wire146) ?
                               wire151 : $signed(wire146)))} ?
                       $unsigned($signed((~|$signed(wire154)))) : $signed($signed(wire155)));
  assign wire160 = $unsigned(wire153[(1'h0):(1'h0)]);
  assign wire161 = wire152[(4'hc):(2'h3)];
  assign wire162 = ({(8'hb6),
                       $unsigned($unsigned((~&reg148)))} >> ($unsigned(wire151[(1'h1):(1'h1)]) ?
                       wire150 : wire160[(2'h3):(2'h2)]));
  assign wire163 = wire146[(4'hb):(3'h4)];
  assign wire164 = (wire152 * wire158);
endmodule
