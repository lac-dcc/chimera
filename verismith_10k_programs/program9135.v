module top
#(parameter param184 = (((8'ha4) ? ((+(8'hbb)) || ((-(8'ha1)) ? (~^(7'h41)) : (^~(8'had)))) : {(8'ha1), ((~^(8'ha9)) ? (7'h44) : ((7'h41) == (8'hbd)))}) ? {({((8'h9e) && (8'hab))} ~^ {((8'hab) && (8'ha8)), ((8'hb5) != (8'ha1))}), (((~(7'h43)) ? ((8'hab) ? (8'hbc) : (8'hb2)) : {(8'hb2), (8'hb1)}) ^~ (~((7'h41) ? (8'hb2) : (8'hb8))))} : (~((~^(~^(7'h41))) ? {(!(7'h41))} : (((8'hbd) ? (8'haf) : (8'hb8)) ? {(8'hb6)} : ((8'ha2) <<< (7'h42)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire183;
  wire signed [(4'hf):(1'h0)] wire182;
  wire [(4'hd):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire165;
  wire signed [(5'h10):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire6,
                 wire5,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hb6))
        begin
          reg4 <= $signed((wire0[(1'h1):(1'h0)] ?
              {{{wire1, wire2}}} : $signed(((wire3 - wire2) ?
                  (wire1 ? wire3 : wire3) : $signed((8'hb2))))));
        end
      else
        begin
          reg4 <= ((reg4[(2'h2):(1'h0)] >= wire0) ^ (!wire3[(5'h12):(5'h11)]));
        end
    end
  assign wire5 = ($unsigned((8'h9f)) ^~ (~((&(!wire0)) ?
                     $signed($unsigned(wire1)) : $unsigned($signed(wire1)))));
  assign wire6 = wire3[(3'h5):(3'h5)];
  module7 #() modinst163 (.y(wire162), .wire8(wire3), .wire10(wire2), .clk(clk), .wire9(wire6), .wire11(wire1));
  assign wire164 = (({wire162[(1'h0):(1'h0)], wire1} <<< $signed(({wire5} ?
                       reg4 : {(7'h40)}))) ^ $unsigned(wire1));
  assign wire165 = $signed(wire5[(2'h3):(2'h3)]);
  assign wire166 = wire6[(5'h14):(3'h7)];
  assign wire167 = (~^(wire2[(5'h11):(4'h8)] ?
                       (8'hb1) : $signed($unsigned((wire0 >> wire0)))));
  assign wire168 = {wire1[(1'h0):(1'h0)],
                       ((&(~&(wire6 > (8'h9c)))) ?
                           ((wire162 ?
                               ((8'h9e) && wire166) : $signed(wire167)) <<< wire165[(1'h1):(1'h1)]) : reg4[(2'h3):(2'h3)])};
  always
    @(posedge clk) begin
      reg169 <= (($unsigned(wire6[(1'h1):(1'h0)]) << (($signed(wire167) ?
              $signed(wire164) : wire1[(3'h6):(3'h6)]) <= $unsigned({wire168,
              wire168}))) ?
          (wire166[(5'h14):(4'h8)] <= wire164[(4'hb):(4'h8)]) : (|($signed($signed(wire166)) ?
              $signed($signed(wire3)) : ((wire167 ^ (8'hbb)) || (~|wire0)))));
      if ({(+wire1)})
        begin
          reg170 <= ($unsigned(({$signed(wire1),
              (~^wire1)} | ($signed(wire166) != {reg4}))) <<< {((~|(wire167 ^ wire162)) > $unsigned(wire168[(4'hc):(3'h5)]))});
          reg171 <= $signed(((reg169 ~^ ($unsigned(wire165) >> (wire6 > (8'haa)))) ?
              wire0 : wire164[(3'h6):(2'h3)]));
          reg172 <= $signed($signed(wire162));
          reg173 <= (wire162[(3'h4):(3'h4)] ?
              wire168 : $signed($signed((-(~&reg171)))));
        end
      else
        begin
          reg170 <= ($unsigned((wire1[(2'h3):(1'h1)] > reg172)) ?
              wire3 : wire165[(1'h0):(1'h0)]);
          reg171 <= wire5;
          reg172 <= (reg170[(1'h0):(1'h0)] << wire1);
          reg173 <= $unsigned(wire167);
          reg174 <= ($signed($unsigned($unsigned(((8'h9c) ?
                  wire1 : wire162)))) ?
              (&(wire164[(3'h5):(1'h1)] ?
                  (wire167[(2'h3):(1'h0)] ^ reg173[(3'h7):(2'h2)]) : reg171)) : (wire5[(4'he):(4'ha)] ^ $unsigned(((wire165 ?
                      wire6 : wire168) ?
                  wire2 : wire168))));
        end
      reg175 <= (((wire167[(4'h9):(2'h2)] ?
          ({reg174, reg169} && ((8'ha1) ?
              wire6 : reg172)) : wire1) ^ (8'h9f)) & $signed({$signed({wire168}),
          ({wire3, wire166} & $unsigned(wire5))}));
      if ($signed((reg170 >>> reg4)))
        begin
          if (((&wire166[(3'h6):(1'h1)]) ?
              reg175[(4'hb):(3'h4)] : wire0[(3'h4):(3'h4)]))
            begin
              reg176 <= ($signed(reg4[(3'h5):(3'h4)]) >>> $unsigned(reg173[(4'h9):(1'h1)]));
              reg177 <= wire1[(3'h4):(2'h2)];
            end
          else
            begin
              reg176 <= (((($unsigned(wire3) ^ $signed(wire168)) <<< wire166) ?
                  $signed(wire165) : reg172[(2'h2):(1'h0)]) && $unsigned(reg177));
            end
          reg178 <= $signed(reg4[(3'h6):(1'h1)]);
        end
      else
        begin
          reg176 <= $unsigned(wire165);
          reg177 <= $signed($signed(($signed($signed(wire164)) << $signed({(8'haa)}))));
          reg178 <= (8'hbd);
          reg179 <= $signed((~(wire0 <<< wire168)));
          reg180 <= (^(+(reg176 ? reg175 : (8'hb1))));
        end
    end
  assign wire181 = $unsigned((~&(reg174 ?
                       $signed($unsigned(reg4)) : reg4[(2'h3):(1'h0)])));
  assign wire182 = $unsigned(reg180[(1'h0):(1'h0)]);
  assign wire183 = $unsigned($unsigned({$unsigned(wire3[(5'h13):(4'h8)])}));
endmodule

module module7
#(parameter param161 = {(({{(8'h9e), (8'hb2)}, {(8'ha7)}} >= (((8'hba) ? (7'h43) : (8'hb0)) ? (~|(7'h42)) : ((8'hac) || (8'ha8)))) & (((8'haf) ? (~&(8'h9f)) : (7'h42)) * {((8'h9f) ? (8'hb9) : (8'haa))}))})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire131;
  assign y = {wire159,
                 wire134,
                 wire133,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire85,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire131,
                 (1'h0)};
  assign wire12 = $unsigned(wire10);
  assign wire13 = wire12;
  assign wire14 = ($unsigned((wire13[(3'h4):(1'h1)] ?
                      (&$signed(wire11)) : $unsigned(wire10))) >= $signed((~|((~|wire9) ?
                      (+(8'hb4)) : $unsigned(wire12)))));
  assign wire15 = ($unsigned(wire8[(2'h3):(1'h1)]) ?
                      (^~$signed($signed(wire9[(1'h1):(1'h0)]))) : {$unsigned(((wire14 ?
                              wire8 : (8'hb1)) * $signed(wire13)))});
  assign wire16 = ({wire14[(2'h2):(2'h2)],
                      (|((|wire11) ?
                          (wire8 != (8'hbb)) : {wire15,
                              wire12}))} >> $unsigned($unsigned(wire11)));
  module17 #() modinst86 (wire85, clk, wire15, wire13, wire9, wire14);
  assign wire87 = (|wire8[(1'h0):(1'h0)]);
  assign wire88 = ({wire10, wire15[(2'h3):(1'h1)]} >= (8'hb1));
  assign wire89 = ((~&wire15) ?
                      wire87 : (wire16 ^ (|((wire13 ~^ (8'hb3)) ?
                          (wire13 ? (8'ha5) : wire10) : $signed(wire15)))));
  assign wire90 = $unsigned(wire14);
  assign wire91 = ({(!wire89)} ?
                      ($signed((8'had)) < (+((wire13 + wire14) ?
                          wire14 : (wire89 + wire90)))) : wire11[(4'ha):(4'h9)]);
  assign wire92 = ((~&(8'h9d)) ?
                      $unsigned(wire89) : $unsigned($signed(((wire14 ^ wire11) ?
                          $unsigned((8'ha6)) : (-wire9)))));
  assign wire93 = wire10;
  assign wire94 = wire11;
  module95 #() modinst132 (wire131, clk, wire91, wire10, wire87, wire15, wire92);
  assign wire133 = (|(wire89 - (~|$unsigned((wire88 ? wire89 : wire87)))));
  assign wire134 = wire94;
  module135 #() modinst160 (wire159, clk, wire92, wire14, wire15, wire89);
endmodule

module module135  (y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire139;
  input wire signed [(4'ha):(1'h0)] wire138;
  input wire signed [(5'h13):(1'h0)] wire137;
  input wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  assign y = {wire158,
                 wire147,
                 wire146,
                 wire142,
                 wire141,
                 wire140,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg145,
                 reg144,
                 reg143,
                 (1'h0)};
  assign wire140 = wire139;
  assign wire141 = (&({((wire136 ^ wire136) || (wire139 <<< wire140))} ?
                       $signed($unsigned((!wire138))) : (($unsigned(wire136) - $signed((8'hbe))) ?
                           wire137 : $unsigned(((8'hb6) ?
                               wire136 : wire140)))));
  assign wire142 = (~wire141[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg143 <= (8'hae);
      reg144 <= (-$signed((((~wire138) ?
          wire142 : (wire136 > reg143)) | $signed($unsigned(wire139)))));
      reg145 <= wire138;
    end
  assign wire146 = (&(reg145[(1'h0):(1'h0)] ^~ $signed($signed({reg143,
                       wire136}))));
  assign wire147 = (+(+wire146));
  always
    @(posedge clk) begin
      reg148 <= $signed($unsigned((((wire147 ?
          (8'haa) : wire140) * reg145) < (((8'ha0) ?
          wire142 : reg144) - wire138))));
      if ((wire147 || reg148[(3'h4):(1'h0)]))
        begin
          reg149 <= (reg143 + (~|((+wire142) ?
              {(reg148 ? wire137 : reg148)} : ($unsigned(reg145) || ((8'ha2) ?
                  reg144 : wire146)))));
          reg150 <= $signed($signed(wire139));
          if (wire142)
            begin
              reg151 <= $unsigned({(wire141 ?
                      ((reg150 <= reg150) | $unsigned(wire142)) : ((reg143 ?
                              reg150 : reg149) ?
                          (wire141 ? wire137 : wire142) : ((8'haf) ?
                              wire142 : reg150)))});
            end
          else
            begin
              reg151 <= $signed(($unsigned(reg151[(3'h7):(3'h4)]) != ((((8'hae) > wire137) >> (reg148 ?
                      (8'hbf) : wire140)) ?
                  $unsigned((wire139 ~^ reg150)) : wire141)));
              reg152 <= ((reg143 >> $unsigned((wire142[(1'h0):(1'h0)] ?
                  (wire146 ?
                      (8'ha4) : wire138) : $signed(reg143)))) ~^ wire141);
              reg153 <= $signed((!$unsigned($unsigned((~&wire139)))));
            end
          reg154 <= (wire141[(2'h2):(1'h0)] ? (8'ha2) : (8'ha1));
          reg155 <= reg145;
        end
      else
        begin
          reg149 <= wire138;
          reg150 <= reg145;
          reg151 <= ((((wire141[(1'h0):(1'h0)] ?
                      $unsigned((8'hb7)) : $unsigned(reg150)) ?
                  {$signed(reg144)} : {(-reg150)}) ?
              $signed((!(~^reg150))) : (reg145[(1'h0):(1'h0)] <<< ((+reg148) ?
                  {wire146} : reg155))) ^ reg143[(1'h1):(1'h1)]);
          reg152 <= $unsigned({$unsigned(wire140[(2'h3):(2'h2)]),
              wire141[(2'h3):(1'h0)]});
        end
      reg156 <= (~&(reg145[(4'h8):(3'h5)] ?
          {((reg145 || reg155) <<< (^reg150))} : (+$signed((wire147 ?
              wire141 : wire142)))));
      reg157 <= {{($unsigned($signed(reg144)) ^ $unsigned((8'hbc))),
              $signed($signed(reg145[(3'h6):(1'h1)]))}};
    end
  assign wire158 = reg148[(1'h1):(1'h1)];
endmodule

module module95
#(parameter param129 = (((~(|(~^(8'hbd)))) ? ((!(^~(8'haf))) && (((8'hbf) ? (8'hb8) : (8'ha1)) | ((8'ha9) ? (8'hba) : (8'ha6)))) : (~{{(8'ha1), (8'h9c)}, (^~(8'hae))})) >> {(&(!{(8'hb3), (8'hb5)}))}), 
parameter param130 = (~|param129))
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire100;
  input wire [(4'ha):(1'h0)] wire99;
  input wire signed [(4'hb):(1'h0)] wire98;
  input wire signed [(5'h14):(1'h0)] wire97;
  input wire [(5'h11):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire122,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg125,
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
                 reg101,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= $signed({(~|$signed($signed(wire96))), wire98[(4'ha):(3'h4)]});
    end
  assign wire102 = {$signed(wire98[(4'ha):(3'h4)])};
  assign wire103 = wire97;
  assign wire104 = wire100[(4'h8):(3'h6)];
  assign wire105 = $signed($unsigned(wire99));
  assign wire106 = wire105;
  assign wire107 = wire106[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if ((~(-$unsigned(wire98[(4'hb):(4'h8)]))))
        begin
          reg108 <= $unsigned({$unsigned((wire99[(4'h9):(3'h4)] ?
                  (~|wire105) : ((8'hac) && (8'hac))))});
        end
      else
        begin
          reg108 <= (wire107 & (+wire107));
          reg109 <= (wire106 ^ ($unsigned(((wire106 <<< (8'hb8)) ?
              (wire97 & wire99) : $unsigned((8'hb4)))) == wire98[(3'h6):(1'h0)]));
          reg110 <= ($unsigned({$unsigned(wire106)}) ?
              wire103[(4'hf):(1'h1)] : (($unsigned((wire96 * wire104)) ?
                  $signed($unsigned(wire98)) : (reg109[(1'h0):(1'h0)] ?
                      $unsigned(wire99) : wire107)) ~^ (!((^~(7'h41)) ?
                  {(7'h40), (8'ha7)} : wire103))));
        end
      if ((^~($signed($signed((reg108 ? wire105 : wire102))) ?
          {wire102} : (!$unsigned($unsigned(wire99))))))
        begin
          if ((~^reg110))
            begin
              reg111 <= {{$unsigned(wire103[(5'h12):(1'h0)])}};
              reg112 <= ((reg101 ?
                      (^~wire105[(4'he):(3'h5)]) : (^~((8'h9d) >> wire107[(2'h3):(2'h2)]))) ?
                  $signed(((^(&(7'h44))) ?
                      ($unsigned(wire107) <= ((8'ha2) ?
                          reg111 : wire98)) : $unsigned(wire103[(2'h3):(1'h1)]))) : $signed($unsigned(wire102)));
              reg113 <= wire104[(1'h1):(1'h1)];
              reg114 <= reg110;
            end
          else
            begin
              reg111 <= $unsigned($unsigned($unsigned(($signed(reg111) * $unsigned(wire107)))));
            end
          reg115 <= $signed(wire105[(4'hf):(1'h1)]);
          if ($signed(($signed((wire98[(3'h5):(3'h5)] << $unsigned(reg110))) ^~ (^$unsigned(wire104[(1'h0):(1'h0)])))))
            begin
              reg116 <= (~|(8'ha2));
              reg117 <= $signed($unsigned(((8'ha7) ^ reg101[(2'h2):(1'h1)])));
              reg118 <= $signed((8'had));
            end
          else
            begin
              reg116 <= $signed((~|{{(reg110 > reg117), $unsigned(wire103)},
                  (^~(!reg110))}));
              reg117 <= (~&wire100);
              reg118 <= reg113[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg111 <= {reg108};
          reg112 <= (({reg101, wire105[(2'h2):(1'h0)]} >> (8'haa)) ?
              $unsigned((8'hb3)) : $unsigned(wire102));
          if ($unsigned((^$unsigned(($unsigned(wire103) <<< wire97[(4'he):(4'hd)])))))
            begin
              reg113 <= wire97;
              reg114 <= (-reg117);
              reg115 <= {reg114[(4'h9):(3'h6)], $signed(wire98)};
              reg116 <= (^(({wire97, (reg110 & reg115)} ?
                  $unsigned(reg113[(2'h2):(1'h1)]) : reg101) + wire104));
            end
          else
            begin
              reg113 <= $signed((wire103 != (|wire107[(1'h1):(1'h1)])));
              reg114 <= reg112;
              reg115 <= wire105[(4'h9):(4'h9)];
              reg116 <= ({({reg108[(4'h8):(3'h6)]} ?
                          (|reg109[(3'h7):(1'h1)]) : ($signed(reg109) ?
                              $unsigned(reg118) : (wire104 <= wire100))),
                      reg118[(1'h1):(1'h1)]} ?
                  (((!$signed(wire100)) <<< wire99[(2'h3):(1'h1)]) << (-wire100[(4'hf):(4'he)])) : {$signed(((!reg117) ?
                          (~&reg118) : wire104[(1'h1):(1'h1)])),
                      wire102[(1'h0):(1'h0)]});
              reg117 <= $unsigned(($signed(reg116[(3'h4):(1'h1)]) ?
                  wire97 : $signed(reg101[(4'hd):(2'h2)])));
            end
        end
      reg119 <= (-(wire98[(4'hb):(1'h1)] & {(|(wire102 ? reg118 : wire102))}));
      reg120 <= ((({(reg111 ? (8'hb4) : wire107)} + $signed((wire107 ?
                  (8'hae) : wire103))) ?
              $signed(((wire96 ? (8'ha0) : wire106) ?
                  reg119[(3'h6):(1'h0)] : $unsigned(wire105))) : $signed({(+reg115)})) ?
          $unsigned((|wire105[(4'ha):(1'h1)])) : $signed((8'had)));
      reg121 <= (reg114[(4'h8):(1'h1)] ?
          $signed((~|(^~wire98[(2'h2):(2'h2)]))) : ($signed((|wire97[(4'hb):(3'h6)])) <<< reg117[(3'h5):(3'h4)]));
    end
  assign wire122 = $unsigned($signed($signed((~$signed(wire97)))));
  assign wire123 = (&((+($unsigned(wire97) ?
                           ((8'ha4) ? reg114 : wire106) : $unsigned(reg109))) ?
                       wire102[(4'ha):(4'h9)] : reg121[(2'h2):(2'h2)]));
  assign wire124 = $signed($unsigned((~$signed((-reg108)))));
  always
    @(posedge clk) begin
      reg125 <= $signed(reg115[(1'h0):(1'h0)]);
    end
  assign wire126 = (&reg115[(3'h6):(2'h3)]);
  assign wire127 = $signed((wire122[(4'hf):(4'h8)] < (wire103[(3'h6):(3'h5)] | $unsigned((&wire126)))));
  assign wire128 = (reg114[(3'h4):(1'h0)] << wire126);
endmodule

module module17
#(parameter param83 = (^(~(-{(|(8'ha5)), (!(8'hb2))}))), 
parameter param84 = param83)
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h285):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire65,
                 wire64,
                 wire23,
                 wire22,
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
                 reg43,
                 reg42,
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
  assign wire22 = $unsigned({wire18[(5'h10):(3'h7)]});
  assign wire23 = (($signed(($unsigned(wire20) ? wire18 : $signed(wire19))) ?
                      $signed({{wire19}}) : ((~^(-wire22)) > wire20[(3'h4):(1'h0)])) || ($signed(($signed(wire22) >>> (wire20 ?
                          wire22 : wire18))) ?
                      (+($unsigned(wire19) ?
                          $signed(wire19) : wire19[(4'hb):(2'h2)])) : $signed(((^wire19) <<< wire21))));
  always
    @(posedge clk) begin
      if ((~{(($signed(wire22) <= wire18[(3'h5):(3'h4)]) != $signed(wire21)),
          $unsigned((~|wire20[(2'h2):(2'h2)]))}))
        begin
          reg24 <= (8'hac);
          if ($unsigned((~|$signed(($unsigned(wire23) ?
              (^~wire21) : (-(8'ha5)))))))
            begin
              reg25 <= (&(&((wire18[(4'h8):(2'h3)] <= wire19) ?
                  wire20 : $signed((wire22 > (8'ha7))))));
              reg26 <= $signed((((8'haf) ?
                      (~(wire20 ? (8'haa) : reg25)) : ((reg25 ?
                              wire19 : reg25) ?
                          wire21[(2'h2):(1'h0)] : (wire20 ? wire22 : wire21))) ?
                  {((7'h41) ^~ $unsigned(wire23)),
                      (~&wire20)} : $unsigned(wire20[(3'h4):(1'h0)])));
              reg27 <= $unsigned((+{{(reg24 ^~ wire23)}}));
              reg28 <= $signed($unsigned((+({wire23, wire22} ?
                  (reg27 >> reg27) : $unsigned(reg27)))));
              reg29 <= $signed(reg24[(1'h1):(1'h1)]);
            end
          else
            begin
              reg25 <= $signed(((!{$unsigned(reg28)}) ^~ $signed($unsigned(reg26[(3'h7):(3'h4)]))));
              reg26 <= ((~&((~^(reg27 >= reg24)) ?
                  $unsigned($signed(wire22)) : {(reg24 ?
                          reg28 : reg24)})) ~^ reg24[(2'h2):(1'h1)]);
              reg27 <= reg28;
              reg28 <= wire23;
              reg29 <= ($unsigned(wire18) ?
                  (($signed(reg29[(2'h2):(1'h1)]) && reg28) ^~ ($unsigned($unsigned((7'h43))) || $signed(reg27[(2'h3):(1'h0)]))) : {reg24[(4'h9):(1'h0)]});
            end
          reg30 <= (wire21[(3'h4):(2'h3)] * (8'h9f));
          reg31 <= wire23[(3'h5):(2'h3)];
          reg32 <= ($unsigned((~&wire19)) ^~ reg24[(4'h9):(2'h2)]);
        end
      else
        begin
          reg24 <= ((reg30 ^~ ((+(reg28 ? (8'hbd) : reg27)) ?
                  $signed(reg32[(4'hd):(3'h6)]) : (+reg28[(4'ha):(4'h9)]))) ?
              (!$unsigned(($signed(wire21) ?
                  $unsigned(wire18) : wire21[(3'h5):(1'h0)]))) : (!{(8'hb3),
                  $signed($unsigned((8'ha9)))}));
          reg25 <= $unsigned(reg32[(1'h1):(1'h0)]);
        end
      reg33 <= {wire18,
          (wire23 << $signed((wire19 ?
              (wire18 >>> wire20) : (reg30 ~^ wire23))))};
      reg34 <= (((~&reg26) << wire19[(4'h9):(1'h1)]) - $signed($unsigned($unsigned((~reg28)))));
    end
  always
    @(posedge clk) begin
      if (reg28[(3'h7):(3'h5)])
        begin
          reg35 <= ($signed((^~$unsigned(((8'hbc) == wire18)))) + (^~(reg27[(1'h1):(1'h1)] && $unsigned($signed(reg26)))));
          reg36 <= $signed((($unsigned($unsigned(reg27)) ?
              reg27 : reg26[(4'h8):(2'h2)]) ~^ ($signed((reg24 ?
                  reg30 : (8'hbe))) ?
              (&wire19[(5'h10):(2'h2)]) : ((reg30 ? wire19 : wire19) ?
                  {wire23} : {reg34, reg32}))));
          reg37 <= (+(8'hb1));
        end
      else
        begin
          reg35 <= reg31;
          reg36 <= wire19[(4'hf):(4'ha)];
          reg37 <= $unsigned($unsigned({(wire20 * reg33[(2'h2):(1'h0)]),
              reg34[(3'h6):(3'h4)]}));
        end
      reg38 <= $unsigned(((reg27[(3'h5):(2'h2)] == $signed(((8'ha5) ?
              reg29 : reg28))) ?
          (~^reg37[(4'h9):(3'h7)]) : (8'ha8)));
      reg39 <= (($unsigned($signed((^~reg34))) > (+(-$unsigned(wire21)))) ?
          {(((+reg35) > {wire19}) ?
                  ($unsigned(wire22) ?
                      wire23[(3'h5):(1'h0)] : reg35) : reg37[(3'h5):(3'h4)])} : reg38);
      reg40 <= reg30[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg41 <= (^$unsigned(wire20[(3'h6):(2'h2)]));
      reg42 <= wire20;
      reg43 <= $unsigned($unsigned(wire18));
      reg44 <= ($signed(((~&(reg38 & reg40)) ?
          reg29 : $unsigned((reg34 <<< reg42)))) && ((-wire18[(4'h9):(3'h7)]) ?
          (~^wire21) : ({$signed((8'hab))} * $unsigned($signed(reg40)))));
    end
  always
    @(posedge clk) begin
      reg45 <= wire21[(2'h2):(2'h2)];
      reg46 <= ($signed(wire23[(3'h4):(2'h3)]) ?
          $signed((~|($signed(reg39) ?
              $signed((8'hbe)) : reg25))) : (|($unsigned((&wire18)) ^~ (((7'h40) ?
              reg42 : wire22) || reg40))));
      if (wire23)
        begin
          reg47 <= {{reg32, reg31[(3'h6):(1'h1)]}};
          reg48 <= (-reg29[(3'h5):(3'h5)]);
          reg49 <= (|$signed($unsigned(wire20[(2'h2):(1'h0)])));
        end
      else
        begin
          if ({((^~$unsigned(wire18)) * $unsigned($unsigned((reg27 ?
                  reg41 : wire22))))})
            begin
              reg47 <= (&reg48[(3'h6):(1'h0)]);
              reg48 <= (-reg25);
              reg49 <= wire23[(2'h2):(2'h2)];
              reg50 <= {($unsigned((((8'had) | reg47) - {wire23})) ?
                      {{(reg44 - reg24),
                              wire23}} : (($unsigned(reg43) == ((8'ha9) ?
                          (8'haf) : reg33)) * (reg43 | (!reg30)))),
                  $signed(((|reg27) || reg36[(2'h3):(2'h3)]))};
            end
          else
            begin
              reg47 <= reg43[(2'h2):(2'h2)];
              reg48 <= (&((reg39[(2'h2):(2'h2)] <<< $signed($signed(reg34))) ?
                  (|($unsigned(reg35) ?
                      (~^reg38) : (reg43 == reg25))) : ((~^((8'ha7) <<< reg25)) ?
                      $unsigned((+reg50)) : $unsigned((7'h41)))));
              reg49 <= $unsigned((-reg45[(4'hb):(4'h9)]));
              reg50 <= reg31;
            end
          reg51 <= ((&$signed(reg45[(5'h12):(1'h0)])) ?
              (wire21 & (~|(-{(7'h44),
                  reg47}))) : $signed((((~&reg30) ~^ $signed(wire21)) ?
                  reg29 : reg28)));
          reg52 <= reg34[(4'h8):(1'h1)];
          if ((({$unsigned((~(8'ha5)))} ?
              wire18[(4'hb):(4'ha)] : reg35[(3'h4):(2'h3)]) + ((8'hae) ?
              wire23 : wire22)))
            begin
              reg53 <= {$unsigned(reg42[(3'h6):(2'h3)]),
                  {(|$signed((wire21 ? reg27 : (8'hb3))))}};
              reg54 <= ((^~((~reg52[(1'h1):(1'h1)]) ?
                  ($unsigned(reg40) >> (reg34 & reg49)) : $signed($signed((7'h40))))) ~^ $unsigned((~|(reg37 || reg47[(3'h7):(2'h3)]))));
              reg55 <= (!reg42);
              reg56 <= (^~(reg44[(2'h3):(2'h2)] ?
                  $unsigned(reg35) : (~|reg38[(1'h1):(1'h0)])));
              reg57 <= (reg42[(4'h9):(2'h2)] ?
                  {($unsigned({(8'hbb)}) >> {$unsigned(reg29),
                          wire23[(2'h3):(2'h3)]})} : (((&{reg42, (8'hb0)}) ?
                      {reg33} : (((7'h41) ^~ reg47) * (reg46 ^ reg46))) & (-(~^(reg30 + wire18)))));
            end
          else
            begin
              reg53 <= reg24;
            end
          if (reg36[(1'h0):(1'h0)])
            begin
              reg58 <= {$unsigned(({(-(8'hb5)), (~wire19)} ?
                      (7'h43) : ({reg45, reg52} > (reg45 ? reg55 : reg32)))),
                  (^~$signed(reg30[(3'h7):(1'h0)]))};
              reg59 <= $signed($signed((reg55[(3'h5):(2'h3)] * reg47)));
            end
          else
            begin
              reg58 <= ((!$signed(((&reg40) >> $signed(wire20)))) ?
                  $signed($signed(($unsigned(reg30) && (~&reg51)))) : (8'hae));
              reg59 <= $unsigned((+($signed($unsigned(reg55)) ~^ reg32)));
              reg60 <= {(~&reg39)};
              reg61 <= (reg24 ?
                  ($signed($unsigned(((8'hb1) >= reg29))) < ((^~$unsigned(reg52)) ?
                      (((8'hb0) ? (8'hba) : reg54) ?
                          $unsigned(reg25) : (-reg45)) : ($signed((8'ha0)) ?
                          wire21[(1'h1):(1'h1)] : (|wire20)))) : ((&$unsigned($signed(reg41))) ?
                      $unsigned((8'hb2)) : $unsigned(((reg26 >> (8'ha0)) ?
                          reg53 : ((8'hb6) ? wire22 : reg25)))));
              reg62 <= (|$signed(reg34));
            end
        end
      reg63 <= (reg41[(1'h0):(1'h0)] ?
          reg33[(1'h0):(1'h0)] : $unsigned((reg41 ?
              (reg25[(3'h5):(2'h2)] ?
                  $unsigned(wire21) : $unsigned(reg37)) : ((&reg54) ?
                  reg42[(4'ha):(3'h7)] : $unsigned(reg39)))));
    end
  assign wire64 = ($signed($signed(($signed(reg32) ?
                          $signed(reg28) : (reg42 >= reg43)))) ?
                      ($signed($unsigned((!reg47))) > reg47) : (-reg26));
  assign wire65 = reg33[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg66 <= wire19[(1'h1):(1'h0)];
      if (reg46[(3'h7):(3'h7)])
        begin
          if (((reg66[(2'h3):(2'h3)] | (~^$signed((reg54 ? reg45 : wire21)))) ?
              $signed(({(7'h40)} ?
                  $unsigned(reg47) : $signed({reg44, (8'ha7)}))) : (8'hbd)))
            begin
              reg67 <= $unsigned((~^$signed($unsigned($unsigned(wire18)))));
              reg68 <= (~$signed($signed((reg43[(3'h4):(2'h2)] ?
                  (reg31 ~^ reg35) : $signed((8'ha5))))));
              reg69 <= $signed(reg60[(3'h7):(1'h0)]);
            end
          else
            begin
              reg67 <= $signed($unsigned(wire22));
              reg68 <= $unsigned($unsigned((8'hb8)));
              reg69 <= {wire21};
              reg70 <= $signed((reg47 == ((~^(|reg29)) >>> reg66[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          reg67 <= reg49[(3'h4):(1'h1)];
          reg68 <= {((8'ha5) >> reg32),
              (reg58 != (({(8'ha1), reg54} ^ {reg48, reg35}) ?
                  reg24[(4'hd):(3'h7)] : ($signed(reg57) ~^ $unsigned(reg56))))};
          if ((~^{({(reg34 | (8'ha3)), $signed(reg24)} ?
                  $unsigned($signed(reg25)) : {reg42[(1'h0):(1'h0)],
                      $unsigned(reg32)})}))
            begin
              reg69 <= $signed(((^~({reg26} ?
                  (reg39 ?
                      wire23 : (8'hb0)) : $unsigned(wire64))) | $signed(reg25[(1'h0):(1'h0)])));
              reg70 <= $signed(reg38);
            end
          else
            begin
              reg69 <= reg26;
              reg70 <= reg29;
            end
          reg71 <= ($signed((-reg29[(5'h11):(1'h0)])) != wire64);
          if (($unsigned(reg51[(4'h8):(1'h1)]) ?
              (((wire22 ?
                  (8'hb8) : {(8'hb5),
                      reg70}) | $signed((&reg62))) & {{(^~reg55),
                      $unsigned(reg49)}}) : reg47[(2'h2):(1'h1)]))
            begin
              reg72 <= (reg28[(4'hd):(3'h5)] || (7'h43));
              reg73 <= (reg66 || reg47[(2'h2):(2'h2)]);
            end
          else
            begin
              reg72 <= wire65[(2'h3):(2'h2)];
              reg73 <= (+($signed(reg54) != ($unsigned($signed((8'hbb))) ?
                  ($signed(reg25) ?
                      $signed(reg36) : (~^reg28)) : $unsigned((wire18 ?
                      reg58 : reg27)))));
            end
        end
      reg74 <= ($signed(wire23) ~^ (reg34 ?
          reg46[(3'h5):(1'h0)] : reg69[(1'h0):(1'h0)]));
      reg75 <= reg67;
      reg76 <= $signed($unsigned(reg35[(3'h5):(3'h4)]));
    end
  assign wire77 = reg48[(3'h5):(3'h5)];
  assign wire78 = (&(~{$signed(reg55[(1'h1):(1'h0)])}));
  assign wire79 = ((8'hb2) <= {((+{reg39}) | reg66[(3'h4):(2'h2)])});
  assign wire80 = $signed($unsigned((~^reg69[(1'h1):(1'h1)])));
  assign wire81 = (&reg71);
  assign wire82 = (($unsigned((reg33[(3'h5):(3'h4)] <= $signed(reg56))) ?
                          $unsigned(reg40[(2'h2):(2'h2)]) : ((~&(-reg55)) - reg53)) ?
                      (^~(reg44[(4'hd):(2'h3)] ?
                          $signed(reg38) : ($unsigned(reg56) <<< (!reg57)))) : (reg34 ?
                          (8'hbe) : $unsigned(reg32)));
endmodule
