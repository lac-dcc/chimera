module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire209;
  wire [(3'h6):(1'h0)] wire208;
  wire signed [(4'ha):(1'h0)] wire207;
  wire [(5'h11):(1'h0)] wire206;
  wire signed [(4'h8):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire204,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= wire0;
      if (wire0[(4'h8):(3'h5)])
        begin
          reg6 <= wire2[(1'h0):(1'h0)];
          reg7 <= ((wire2[(3'h5):(3'h4)] & $signed($signed((+reg5)))) ?
              (-(^~((reg6 + (8'ha3)) ^~ $unsigned((8'ha3))))) : (^~(wire1[(4'ha):(4'h8)] ?
                  wire1 : wire2[(1'h0):(1'h0)])));
        end
      else
        begin
          reg6 <= $signed((reg5[(2'h3):(1'h1)] ^~ $signed($signed((&wire4)))));
          reg7 <= reg7;
          reg8 <= (!(((reg5[(5'h12):(4'he)] > $signed(wire4)) ?
              ({reg7} ^~ wire3) : (+$unsigned(reg7))) <<< $signed((+$unsigned(reg7)))));
        end
      if ({(wire1[(2'h2):(1'h1)] ? reg8 : $signed(wire0))})
        begin
          reg9 <= wire1[(4'hf):(3'h6)];
        end
      else
        begin
          reg9 <= (~|reg7);
        end
      reg10 <= (((7'h41) ?
          ($signed({reg7}) == (wire4[(2'h3):(2'h3)] ^~ wire2)) : ($unsigned($unsigned(reg7)) > wire2)) + wire0[(2'h2):(1'h1)]);
    end
  module11 #() modinst205 (wire204, clk, reg10, wire1, reg5, wire3);
  assign wire206 = $signed($signed($signed(reg7[(1'h0):(1'h0)])));
  assign wire207 = $unsigned((^reg5[(3'h4):(3'h4)]));
  assign wire208 = ({{(wire1 ?
                               $unsigned((8'hb8)) : $signed(wire3))}} >>> (&wire1[(5'h11):(4'ha)]));
  assign wire209 = (&$signed((~|$unsigned(reg8))));
endmodule

module module11
#(parameter param202 = ((8'hb1) ? {((((8'ha2) ~^ (8'ha0)) + ((8'haf) ? (8'hb6) : (8'h9e))) ? (((8'hb5) ? (8'ha2) : (8'hb9)) & ((8'hbc) || (8'h9c))) : {((8'ha6) ? (8'h9f) : (8'h9f))}), (((|(8'ha6)) ? {(8'hbc)} : ((7'h44) ? (8'h9c) : (8'haf))) << ({(8'hb3), (8'hb7)} < ((8'haa) ? (8'ha3) : (8'hb1))))} : ({(((8'haa) == (8'haf)) & {(8'ha9), (8'h9c)})} ^~ ((((8'hbe) ? (8'hb3) : (8'hb5)) >>> (|(8'hb1))) || {(-(8'hac)), (-(8'hb3))}))), 
parameter param203 = param202)
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire201;
  wire [(3'h5):(1'h0)] wire200;
  wire [(4'he):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire195;
  wire signed [(4'ha):(1'h0)] wire194;
  wire signed [(4'h8):(1'h0)] wire193;
  wire signed [(4'hc):(1'h0)] wire192;
  wire signed [(4'hc):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire190;
  wire signed [(2'h3):(1'h0)] wire188;
  wire [(4'he):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire129;
  reg signed [(5'h14):(1'h0)] reg197 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire188,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire89,
                 wire43,
                 wire16,
                 wire17,
                 wire41,
                 wire129,
                 reg197,
                 reg196,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire16 = $signed(wire13);
  assign wire17 = (8'ha1);
  module18 #() modinst42 (.wire19(wire16), .y(wire41), .wire20(wire13), .clk(clk), .wire22(wire15), .wire23(wire12), .wire21(wire17));
  assign wire43 = $signed(({($signed(wire17) ?
                              $signed(wire41) : wire16[(4'h8):(3'h4)])} ?
                      $unsigned(wire15[(2'h2):(2'h2)]) : {wire12[(3'h7):(1'h1)]}));
  always
    @(posedge clk) begin
      reg44 <= wire12[(4'hb):(1'h1)];
      reg45 <= (((($unsigned(wire43) ?
              (~&wire16) : $signed(wire17)) ^~ wire13[(4'hd):(1'h1)]) ?
          (~^((8'ha9) ? {wire16, reg44} : wire43[(1'h1):(1'h1)])) : (wire16 ?
              wire13 : (wire43 ?
                  (wire43 ? wire12 : wire15) : (wire16 ?
                      wire16 : wire17)))) <<< wire13);
      reg46 <= $signed((((-(wire13 << reg45)) ^ $signed((wire15 ^~ reg45))) ?
          reg45 : (8'had)));
      reg47 <= wire13[(4'h9):(3'h7)];
    end
  module48 #() modinst90 (wire89, clk, reg44, wire14, wire41, wire13, reg45);
  module91 #() modinst130 (wire129, clk, wire12, reg45, wire41, wire16, reg47);
  assign wire131 = {reg44[(3'h7):(2'h2)]};
  assign wire132 = (-($signed(wire43) ?
                       $unsigned($unsigned(wire14[(1'h1):(1'h0)])) : wire131));
  assign wire133 = {($signed($signed((reg44 <<< wire17))) ^ $signed((7'h40))),
                       $unsigned(((-reg45[(4'ha):(3'h7)]) ?
                           wire41[(5'h13):(1'h1)] : ((-wire13) ?
                               $signed(reg47) : $signed(reg47))))};
  assign wire134 = $unsigned($unsigned(reg46));
  module135 #() modinst189 (.wire138(wire134), .clk(clk), .wire137(wire15), .y(wire188), .wire139(wire89), .wire136(wire17));
  assign wire190 = $signed((~(^~(-$signed(wire41)))));
  assign wire191 = (~|(+wire15));
  assign wire192 = $unsigned(wire133);
  assign wire193 = (~^$signed(($signed($signed(wire17)) && wire188)));
  assign wire194 = {{$unsigned($signed({wire41, wire134})),
                           $signed((^(wire188 ? wire43 : reg47)))}};
  assign wire195 = (wire16[(4'h8):(2'h2)] ?
                       (+((!wire132[(3'h7):(3'h7)]) - wire14)) : ($unsigned(wire129) >= (reg44[(3'h6):(3'h6)] == ($unsigned((8'had)) ?
                           (wire191 ? wire129 : wire132) : $signed(wire131)))));
  always
    @(posedge clk) begin
      reg196 <= (~|$signed(({$signed(wire12)} == wire17[(3'h6):(1'h0)])));
      reg197 <= ((wire191 < (~^wire195)) ?
          $unsigned($unsigned($signed(wire13))) : $signed($unsigned((~$unsigned(wire133)))));
    end
  assign wire198 = (8'hb1);
  assign wire199 = ({(~&((&wire132) ?
                           (reg196 ?
                               wire129 : wire132) : (wire133 ^~ wire132)))} ~^ (&$unsigned($signed($unsigned(wire13)))));
  assign wire200 = ($signed(((&(reg45 ?
                           wire129 : (8'ha6))) || wire192[(4'h8):(3'h6)])) ?
                       (~&({reg196[(4'hc):(2'h2)],
                           (wire89 ?
                               wire132 : wire193)} ~^ $unsigned({wire43}))) : $unsigned(($unsigned(wire193) ?
                           $unsigned($unsigned(wire13)) : wire190)));
  assign wire201 = (^wire190);
endmodule

module module135
#(parameter param187 = {(({((8'ha9) || (8'hbb))} - ((8'ha3) | (!(8'hbd)))) * {({(8'hba)} >>> (+(8'ha7)))}), {(~|{(+(8'haa))}), ({{(8'hb4), (8'hab)}, {(8'ha6), (8'h9f)}} << (~(~^(8'hb7))))}})
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire139;
  input wire signed [(4'he):(1'h0)] wire138;
  input wire [(5'h15):(1'h0)] wire137;
  input wire signed [(2'h2):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire167;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire signed [(4'hd):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire140;
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(5'h12):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  assign y = {wire171,
                 wire167,
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
                 wire140,
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
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg165,
                 reg164,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire140 = wire136[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire139 >= $unsigned($unsigned(($signed(wire140) ?
          ((7'h40) ? wire137 : wire137) : $signed(wire139))))))
        begin
          reg141 <= wire140[(4'hc):(4'h8)];
        end
      else
        begin
          if (($signed($unsigned((8'hab))) ?
              $unsigned($signed((^{wire137}))) : $unsigned(wire136)))
            begin
              reg141 <= $unsigned((+((+(-wire138)) ^ (8'ha7))));
              reg142 <= (!wire136);
            end
          else
            begin
              reg141 <= (wire136 ?
                  $unsigned((((reg141 ? reg141 : wire139) ?
                      (^reg141) : (wire137 ?
                          wire136 : wire138)) + $unsigned((reg141 >= wire137)))) : $unsigned($unsigned(wire137[(4'hc):(4'ha)])));
              reg142 <= wire138[(4'hb):(1'h1)];
              reg143 <= $unsigned(wire140);
              reg144 <= wire140[(3'h4):(2'h2)];
            end
          reg145 <= $unsigned({wire140[(4'hb):(1'h0)]});
          if (wire138)
            begin
              reg146 <= wire137[(2'h2):(1'h0)];
              reg147 <= {(^~reg142[(2'h2):(2'h2)])};
              reg148 <= wire136[(1'h1):(1'h0)];
              reg149 <= (8'haa);
            end
          else
            begin
              reg146 <= ($unsigned(($signed($signed((8'hb8))) ?
                      wire137[(1'h1):(1'h0)] : ($signed(reg142) < (^~reg149)))) ?
                  wire138[(3'h5):(1'h1)] : reg149);
            end
        end
    end
  always
    @(posedge clk) begin
      reg150 <= $unsigned($unsigned((^({reg143, reg141} | wire136))));
    end
  assign wire151 = (+wire139);
  assign wire152 = wire136[(2'h2):(2'h2)];
  assign wire153 = $unsigned((((!(8'h9d)) ?
                       ((wire137 << reg143) << (+reg150)) : {((8'haf) ?
                               reg150 : (8'hb9))}) ~^ reg150));
  assign wire154 = $unsigned(((7'h43) != $signed($signed((~&reg142)))));
  assign wire155 = $signed(wire154[(2'h2):(2'h2)]);
  assign wire156 = $unsigned($signed(({(8'hb2), reg145} & ({reg144} ?
                       (wire155 | (8'hb2)) : (+wire151)))));
  assign wire157 = $signed((wire138[(1'h1):(1'h1)] && ({(|reg150),
                           (wire137 ? wire137 : reg145)} ?
                       {{reg148}} : ((^reg143) ? $signed(reg148) : wire139))));
  assign wire158 = ((reg143[(4'h8):(3'h6)] ?
                           reg149[(1'h1):(1'h0)] : (reg146[(3'h7):(3'h4)] <= ($unsigned((7'h40)) ?
                               $unsigned(wire138) : $unsigned(reg150)))) ?
                       ((+wire138) ?
                           (+(+reg142[(2'h2):(1'h1)])) : ((((8'hbb) ?
                                   wire155 : wire139) ?
                               wire137[(4'hf):(1'h0)] : $signed(wire151)) << $unsigned(reg143))) : $signed($unsigned($unsigned({wire138}))));
  assign wire159 = ($signed(wire137[(5'h11):(4'he)]) == (-reg150));
  assign wire160 = (&$unsigned((~{wire138})));
  assign wire161 = $unsigned({(wire159 & (wire153 ?
                           wire160 : $unsigned(wire158))),
                       reg141});
  assign wire162 = (+((8'hae) ? $signed($signed($unsigned((8'hb8)))) : reg142));
  assign wire163 = (($unsigned(wire139) > (wire153 * $signed((reg145 ?
                       reg150 : wire154)))) | (~&$signed($signed((reg147 | wire153)))));
  always
    @(posedge clk) begin
      reg164 <= (~|wire152[(1'h1):(1'h1)]);
      reg165 <= reg143[(2'h2):(1'h1)];
      reg166 <= wire158[(1'h1):(1'h1)];
    end
  assign wire167 = (reg145[(5'h12):(4'hf)] <= ((+(~|(8'haf))) ?
                       ((wire138[(2'h3):(1'h0)] ~^ wire153) & ((wire138 ?
                           wire154 : wire153) || (reg147 ~^ wire151))) : $unsigned((^wire158))));
  always
    @(posedge clk) begin
      reg168 <= reg165[(1'h0):(1'h0)];
      reg169 <= reg144[(2'h3):(1'h1)];
      reg170 <= reg146[(1'h0):(1'h0)];
    end
  assign wire171 = $signed(reg166);
  always
    @(posedge clk) begin
      reg172 <= (reg149 ? wire167[(5'h10):(4'he)] : (8'hab));
      if ({wire139[(2'h3):(1'h0)],
          $unsigned(({wire136[(1'h0):(1'h0)], {reg146}} ^ reg145))})
        begin
          if (wire155)
            begin
              reg173 <= ((~^$unsigned((^(~^reg150)))) || {{{(reg141 ?
                              wire151 : wire167)},
                      reg165},
                  reg165[(2'h3):(1'h1)]});
              reg174 <= $signed({(&((+wire161) + (&reg143)))});
              reg175 <= reg169;
            end
          else
            begin
              reg173 <= {$signed((-$signed(reg143)))};
            end
        end
      else
        begin
          reg173 <= $unsigned({$unsigned(wire171[(3'h6):(1'h0)]),
              wire154[(1'h1):(1'h0)]});
          if (wire161[(3'h4):(1'h0)])
            begin
              reg174 <= $signed(wire159);
              reg175 <= {wire140, wire171};
              reg176 <= wire167[(2'h2):(2'h2)];
            end
          else
            begin
              reg174 <= $signed(reg168);
              reg175 <= (($unsigned(wire153) ^ (-$unsigned({wire163}))) | {wire162[(2'h2):(1'h0)]});
              reg176 <= (({$signed((~&reg150)), $unsigned($signed(reg170))} ?
                      (reg169[(4'ha):(2'h2)] ?
                          $unsigned((~reg148)) : reg142) : reg176[(3'h5):(3'h4)]) ?
                  (~((~wire138) ?
                      (wire167 ?
                          reg164[(2'h2):(1'h0)] : {wire158}) : (|(&reg148)))) : ($unsigned(reg176) <<< (+(+(8'hb4)))));
              reg177 <= ($signed(wire159) - wire151[(3'h4):(2'h2)]);
            end
        end
      if ((8'ha0))
        begin
          if ((+$signed(reg173[(3'h4):(1'h0)])))
            begin
              reg178 <= ($unsigned((^~$unsigned((reg148 > wire153)))) ?
                  $unsigned(reg173[(4'ha):(2'h3)]) : wire167);
              reg179 <= {$unsigned(($unsigned($unsigned(wire136)) == $unsigned((wire140 ^~ reg178))))};
              reg180 <= reg164[(4'ha):(3'h7)];
              reg181 <= (-reg175);
            end
          else
            begin
              reg178 <= ((~(~&reg145)) < (8'ha6));
              reg179 <= (~{$unsigned((~(wire156 < (8'ha5)))),
                  (($signed(reg170) ?
                      wire162 : ((8'hbd) ?
                          wire136 : reg179)) >>> (((7'h40) ~^ reg170) ?
                      (&reg179) : (reg145 ? wire153 : wire138)))});
              reg180 <= (&reg145[(1'h0):(1'h0)]);
            end
          if ((reg173 ?
              $signed($unsigned($signed((reg173 >> reg180)))) : (reg169 >> (8'ha6))))
            begin
              reg182 <= reg174;
              reg183 <= {(reg146[(1'h0):(1'h0)] ~^ ((((8'hb8) >> reg178) ?
                      (-wire167) : reg141[(2'h3):(1'h1)]) & $unsigned($signed(reg180))))};
              reg184 <= wire157;
            end
          else
            begin
              reg182 <= ({$signed(((wire162 ? wire171 : reg165) ?
                      (7'h43) : (wire162 || reg183))),
                  (wire137 + (~&(~|wire137)))} * wire158);
              reg183 <= $signed($unsigned(wire160));
            end
        end
      else
        begin
          reg178 <= $signed((reg179[(2'h3):(2'h3)] ?
              {(&(^wire139)),
                  $signed(reg174[(3'h4):(1'h0)])} : $unsigned($unsigned($unsigned(reg180)))));
          reg179 <= $signed((|$signed($unsigned(reg150[(4'hf):(4'h9)]))));
        end
      reg185 <= (^((^((wire163 ? reg178 : wire161) >>> ((7'h43) ?
              reg146 : reg170))) ?
          (({reg146} ? (~reg178) : reg143) ?
              reg169 : $unsigned($unsigned(wire136))) : reg170[(3'h4):(1'h1)]));
      reg186 <= (8'hb7);
    end
endmodule

module module91
#(parameter param128 = (~(+{({(7'h40), (8'h9f)} ? ((8'hbf) >> (8'hb0)) : ((8'hbc) ? (8'hab) : (8'haf)))})))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  input wire signed [(3'h5):(1'h0)] wire93;
  input wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  assign y = {wire127,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg126,
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
                 (1'h0)};
  assign wire97 = $unsigned($unsigned((8'ha7)));
  assign wire98 = (-$unsigned($signed(($signed(wire95) ?
                      wire96[(4'ha):(2'h3)] : wire92))));
  assign wire99 = (wire97 ^~ wire92);
  assign wire100 = wire94[(5'h11):(1'h1)];
  always
    @(posedge clk) begin
      reg101 <= wire94;
    end
  always
    @(posedge clk) begin
      if (wire93[(1'h0):(1'h0)])
        begin
          reg102 <= $unsigned($signed((wire93 > reg101[(3'h4):(1'h1)])));
          if (wire99[(1'h1):(1'h0)])
            begin
              reg103 <= wire100;
              reg104 <= reg101[(3'h4):(1'h1)];
              reg105 <= wire96[(2'h2):(1'h1)];
              reg106 <= {$signed(($signed(reg104) >>> ($signed(wire92) < reg103[(1'h1):(1'h1)]))),
                  ($signed({$unsigned(wire93),
                      $signed(wire96)}) >> wire98[(3'h6):(1'h0)])};
            end
          else
            begin
              reg103 <= wire95;
            end
          reg107 <= (~&wire97);
          reg108 <= wire95;
        end
      else
        begin
          if ($signed((wire95[(3'h5):(3'h4)] ?
              reg102[(3'h6):(1'h1)] : $signed($signed(reg105[(2'h2):(2'h2)])))))
            begin
              reg102 <= (({(!$unsigned(wire99)), {$signed(reg102)}} ?
                  {$unsigned({wire99}),
                      wire99} : $signed(((+reg106) << reg108))) < reg106);
              reg103 <= reg105[(3'h4):(1'h1)];
              reg104 <= (+reg105[(3'h5):(3'h5)]);
            end
          else
            begin
              reg102 <= wire94;
            end
          if (reg105[(3'h6):(1'h0)])
            begin
              reg105 <= (reg107[(4'h9):(2'h2)] ?
                  ($unsigned((|{(7'h41)})) ?
                      $unsigned($unsigned((reg106 ?
                          wire92 : wire99))) : $signed($unsigned($unsigned(wire99)))) : reg101[(3'h7):(3'h5)]);
              reg106 <= reg105;
            end
          else
            begin
              reg105 <= {($signed({$unsigned(reg108)}) ?
                      {($unsigned(reg101) == wire100),
                          {$unsigned(wire92),
                              $signed(wire98)}} : (|(~|$signed((8'ha1)))))};
              reg106 <= $unsigned({$signed($unsigned($unsigned(reg102))),
                  ($unsigned((8'ha7)) ?
                      reg106[(5'h11):(1'h0)] : (((8'ha0) || reg102) == reg108))});
              reg107 <= $signed(reg104[(3'h4):(2'h3)]);
            end
          reg108 <= reg105[(2'h3):(1'h1)];
          reg109 <= (+((!{(^wire100)}) ?
              (!((wire97 ~^ wire97) >= (8'h9f))) : $signed(((wire99 ?
                      wire95 : wire93) ?
                  (reg105 ^~ reg101) : (reg104 ? reg107 : (7'h42))))));
        end
      reg110 <= reg104[(4'ha):(1'h0)];
      reg111 <= ($signed(($unsigned($signed((8'hb9))) ?
          reg105 : reg109[(3'h6):(2'h2)])) | reg104[(3'h6):(3'h4)]);
      if ((wire92 == ((((8'hb3) ? (-(8'ha7)) : $unsigned(reg105)) ?
          $unsigned(reg109) : ((~&(8'haf)) || (|wire98))) > $signed(({wire99,
              reg109} ?
          $signed(reg105) : {reg111})))))
        begin
          reg112 <= ($signed(wire99) ?
              wire95[(4'hb):(3'h4)] : ({$unsigned(reg102[(5'h13):(4'hf)])} <= wire99));
          reg113 <= $unsigned(reg104[(1'h0):(1'h0)]);
          reg114 <= $signed((&(8'haf)));
          reg115 <= $signed(wire99);
          if (((8'hb8) ? $unsigned(reg113) : wire99[(4'he):(4'he)]))
            begin
              reg116 <= {(|$signed($signed(wire95)))};
              reg117 <= $signed((({$signed(reg107),
                      (wire95 ?
                          reg116 : reg104)} >>> (reg107 >>> wire92[(5'h10):(2'h2)])) ?
                  (^~$signed(((8'hb6) && reg111))) : (|wire95[(5'h11):(2'h3)])));
              reg118 <= (wire98[(4'hf):(3'h6)] >= (8'hb0));
              reg119 <= reg105[(1'h1):(1'h1)];
            end
          else
            begin
              reg116 <= (wire92[(4'hc):(4'hb)] ?
                  $unsigned((^~$signed(reg113))) : wire98[(4'he):(1'h1)]);
              reg117 <= ($signed((^reg102)) ?
                  wire96 : (({$signed(reg116), $signed(reg115)} ?
                          $signed($signed(wire97)) : (reg112 & wire92)) ?
                      ((reg102[(4'h9):(3'h5)] ?
                              (~|reg109) : $unsigned(wire92)) ?
                          $signed(reg115[(2'h2):(1'h1)]) : ((reg116 ^~ reg105) >= (reg113 ?
                              wire94 : wire97))) : reg116));
              reg118 <= wire92;
              reg119 <= $signed($signed($signed(({reg102, wire98} ?
                  $unsigned(reg115) : wire100))));
              reg120 <= $signed(reg113);
            end
        end
      else
        begin
          if ($unsigned((|$unsigned(reg112))))
            begin
              reg112 <= (~&(wire94 ? reg107 : $signed(reg114)));
              reg113 <= wire95[(2'h2):(2'h2)];
              reg114 <= (&(-(reg107 && $unsigned(reg117))));
            end
          else
            begin
              reg112 <= (($unsigned(((~(8'hbb)) >= reg120[(3'h5):(2'h2)])) && reg102[(5'h13):(5'h10)]) && wire96);
              reg113 <= {(-($unsigned(wire100) >>> $signed($signed(reg107)))),
                  reg114};
            end
          reg115 <= reg104;
        end
      if (wire94[(3'h6):(1'h0)])
        begin
          reg121 <= wire95[(3'h4):(1'h1)];
          reg122 <= wire99;
          if ($signed(reg102))
            begin
              reg123 <= ((8'hae) != $unsigned($unsigned(wire93)));
              reg124 <= $unsigned($unsigned(wire93));
              reg125 <= reg107;
              reg126 <= (^(reg118[(3'h4):(1'h0)] == (((reg116 ?
                  (7'h44) : wire97) < reg107[(2'h3):(2'h3)]) & (&(~|(7'h40))))));
            end
          else
            begin
              reg123 <= reg110;
            end
        end
      else
        begin
          reg121 <= $unsigned(reg112[(4'hb):(4'h8)]);
        end
    end
  assign wire127 = $unsigned((|wire98[(4'hc):(4'h9)]));
endmodule

module module48
#(parameter param88 = {{(+(~{(7'h40)}))}})
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire53;
  input wire [(3'h5):(1'h0)] wire52;
  input wire signed [(3'h4):(1'h0)] wire51;
  input wire [(5'h11):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  assign y = {wire87,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
                 reg81,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= wire52[(2'h3):(1'h1)];
      reg55 <= (~^$signed((~|reg54[(1'h1):(1'h0)])));
      if (($unsigned(wire53) + $signed((reg54[(2'h2):(1'h0)] <= $unsigned($signed((8'hb6)))))))
        begin
          reg56 <= wire53[(4'hc):(3'h5)];
        end
      else
        begin
          if ({reg55})
            begin
              reg56 <= $signed($signed(reg55));
              reg57 <= $unsigned(wire52);
              reg58 <= (wire52[(2'h2):(1'h0)] ?
                  ((wire49[(1'h0):(1'h0)] ?
                          $signed($signed(wire52)) : $unsigned(wire50)) ?
                      reg54 : (~^$unsigned(wire53[(1'h0):(1'h0)]))) : $signed((^wire53)));
            end
          else
            begin
              reg56 <= ($unsigned((^~(((7'h44) ? reg57 : (8'ha8)) ?
                      (7'h40) : (reg57 ^ wire49)))) ?
                  {reg56} : reg55[(2'h2):(1'h1)]);
              reg57 <= wire49;
              reg58 <= (reg58 ? (|reg57) : $unsigned($signed(wire53)));
            end
          reg59 <= reg58;
          reg60 <= ($signed((reg58 * reg57[(4'h8):(3'h4)])) ?
              wire50 : wire52[(2'h3):(2'h2)]);
        end
      reg61 <= ((((8'hba) ?
                  {(-(8'hbc)), (^~(8'hbd))} : ((reg54 << reg56) ?
                      $signed(reg55) : reg56[(4'hf):(3'h6)])) ?
              {reg58, ((!(8'hb5)) >>> reg60[(3'h6):(1'h0)])} : (~|(reg56 ?
                  reg59 : wire51))) ?
          ({wire51[(1'h1):(1'h1)]} ?
              (-{$unsigned(reg57),
                  reg59[(4'hd):(1'h0)]}) : ((^reg56[(1'h1):(1'h1)]) + $unsigned($signed((8'ha8))))) : $signed(reg60));
    end
  assign wire62 = $unsigned(reg59);
  assign wire63 = (|(~^(reg56[(3'h5):(3'h5)] ?
                      $unsigned((~^wire62)) : $signed($unsigned(reg60)))));
  assign wire64 = ((+(((reg58 ~^ reg58) <<< reg56) != reg60)) ?
                      (~|wire51[(2'h3):(2'h2)]) : $signed(wire50));
  assign wire65 = reg55[(3'h7):(3'h5)];
  assign wire66 = ({(((wire64 ? reg58 : wire51) ?
                              $signed(wire50) : (wire65 ^~ reg55)) & ((~|wire64) ?
                              {wire53} : (wire62 & wire50))),
                          $unsigned($unsigned({wire65, reg59}))} ?
                      (reg56[(1'h1):(1'h1)] ?
                          {wire63[(4'ha):(4'h9)]} : reg58) : ((!((~|reg60) ?
                              (wire62 ?
                                  (8'ha0) : reg60) : wire65[(4'h9):(3'h4)])) ?
                          reg58 : (!$unsigned((reg56 && wire64)))));
  assign wire67 = (8'hb1);
  always
    @(posedge clk) begin
      reg68 <= (~|((((-wire52) + (-wire66)) ?
          $unsigned(reg56) : wire51[(2'h3):(1'h1)]) || wire67));
      if (reg61)
        begin
          reg69 <= reg61;
          reg70 <= {wire51, (reg56 && $signed((^$unsigned(reg61))))};
          if ({wire66[(2'h3):(2'h2)], reg56})
            begin
              reg71 <= (~|reg69);
              reg72 <= reg61[(4'h9):(4'h8)];
              reg73 <= wire50;
            end
          else
            begin
              reg71 <= ((&$unsigned({reg54[(1'h0):(1'h0)], (reg71 >= reg72)})) ?
                  ((((reg55 >>> wire51) < (~^reg70)) ?
                      $signed((|wire49)) : ((~&wire49) ?
                          $signed(reg54) : $signed(wire63))) ~^ $unsigned(($signed(wire49) ?
                      (reg71 <<< wire49) : reg54[(1'h1):(1'h0)]))) : ($signed({reg54[(1'h0):(1'h0)]}) * $unsigned({$unsigned(reg59),
                      (wire66 ? wire66 : wire65)})));
              reg72 <= reg71[(4'h9):(3'h6)];
              reg73 <= (-(reg60[(4'h8):(4'h8)] >= ((+reg73) >= (~^(wire67 ?
                  reg69 : wire51)))));
              reg74 <= (&({reg68[(3'h5):(3'h4)]} ?
                  (($unsigned((8'h9c)) < $unsigned(wire52)) == (~^(~|(8'hb5)))) : ($unsigned({(8'ha3)}) > ((&reg54) >>> $signed(reg61)))));
            end
        end
      else
        begin
          reg69 <= $unsigned(reg58[(4'hd):(3'h4)]);
        end
      reg75 <= (!reg68);
      reg76 <= ($signed((reg57[(4'ha):(2'h3)] ?
              (^~reg68[(3'h6):(1'h0)]) : ({wire53} ?
                  wire53 : (reg68 << (8'hbe))))) ?
          reg61[(4'h8):(4'h8)] : wire50[(4'hf):(3'h7)]);
      reg77 <= $unsigned({$signed((reg54 ^~ {reg70, wire62})),
          wire66[(1'h1):(1'h1)]});
    end
  assign wire78 = $signed($signed(({(~&reg68), $unsigned((8'ha9))} - reg77)));
  assign wire79 = (wire52[(3'h5):(3'h5)] ?
                      wire51 : $unsigned($unsigned(($unsigned(reg70) ?
                          $unsigned(wire51) : $signed(reg75)))));
  assign wire80 = $signed($signed({wire78}));
  always
    @(posedge clk) begin
      reg81 <= ((-$unsigned({(^wire62),
          (reg54 ? reg76 : reg75)})) <= $unsigned(reg57[(2'h3):(2'h2)]));
      reg82 <= (^({($signed((8'hb1)) ? reg56 : {reg72, wire51}),
          reg75} ^~ (~|$unsigned((~wire78)))));
    end
  assign wire83 = (reg54[(1'h0):(1'h0)] >= wire52[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg84 <= $unsigned($signed(wire67[(3'h7):(2'h2)]));
      reg85 <= reg82[(2'h3):(1'h1)];
      reg86 <= $signed(((wire52[(1'h1):(1'h1)] ?
              (~(~^(7'h40))) : ((&reg74) >>> (reg85 | reg71))) ?
          $unsigned(reg81) : {($unsigned((8'haf)) ^ (-wire51))}));
    end
  assign wire87 = ($signed($signed($unsigned($signed(wire53)))) <= $signed((($signed(wire63) + $unsigned(wire64)) ?
                      ((reg61 ? wire64 : reg58) ?
                          (wire66 ?
                              reg55 : wire79) : {reg86}) : (^~reg57[(3'h4):(1'h1)]))));
endmodule

module module18
#(parameter param39 = (+(((&((8'hb3) > (8'ha2))) ? {{(8'hb0), (8'ha2)}} : {(-(8'hb2)), ((8'h9d) ? (8'hb3) : (8'hbd))}) == {(((8'ha0) ? (7'h42) : (8'ha1)) | (~^(8'hb9)))})), 
parameter param40 = (~^(((^(^~param39)) << (~&(^param39))) < (((param39 ~^ (8'hb8)) == (param39 || param39)) ? param39 : {{param39}}))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire20[(3'h7):(2'h2)])
        begin
          reg24 <= $unsigned((($unsigned((wire21 ? wire20 : wire19)) ?
                  (|{wire19, wire19}) : $signed($unsigned(wire21))) ?
              $signed((8'haa)) : {(~&(wire19 << wire23)),
                  $unsigned(wire23[(4'hb):(1'h1)])}));
          reg25 <= $signed($unsigned((~&$unsigned((wire23 >> (8'ha6))))));
        end
      else
        begin
          reg24 <= ($signed(wire22[(1'h1):(1'h0)]) && $unsigned($unsigned($signed({reg24,
              wire23}))));
        end
    end
  assign wire26 = $unsigned($signed($signed(reg25[(4'hb):(2'h2)])));
  assign wire27 = (^~($unsigned(reg25[(3'h7):(3'h4)]) ^ (reg25[(1'h0):(1'h0)] != wire21)));
  assign wire28 = (~|(wire27[(1'h0):(1'h0)] ?
                      $signed($unsigned(wire21[(3'h5):(3'h5)])) : (~|{wire23[(1'h1):(1'h0)],
                          wire21})));
  assign wire29 = wire22[(3'h6):(2'h2)];
  assign wire30 = $signed($signed(($unsigned((wire26 || (8'hbb))) ?
                      $signed($unsigned(wire20)) : $signed($signed(reg24)))));
  always
    @(posedge clk) begin
      reg31 <= (~wire22[(2'h3):(1'h0)]);
      if (wire29)
        begin
          reg32 <= {(~wire19[(1'h1):(1'h0)]),
              $unsigned((~(((8'hb7) != reg24) ?
                  (wire23 <<< wire27) : $unsigned((7'h42)))))};
          reg33 <= {$unsigned(($unsigned(reg32) ? wire30 : reg24)),
              wire27[(4'h8):(4'h8)]};
        end
      else
        begin
          reg32 <= $unsigned((wire28 ? $signed($signed(wire29)) : (|wire26)));
          reg33 <= (wire23 && wire29);
          reg34 <= $signed($unsigned((^~wire23[(3'h4):(1'h1)])));
          reg35 <= wire19[(2'h2):(1'h1)];
        end
      reg36 <= (~|reg33[(1'h0):(1'h0)]);
      reg37 <= (wire30[(4'h9):(3'h4)] ?
          ($unsigned($unsigned($unsigned(wire20))) ?
              ({{reg25}, (reg24 ? wire27 : wire23)} ?
                  (reg36[(1'h0):(1'h0)] > wire23[(4'h9):(3'h4)]) : (^$unsigned(wire30))) : wire27[(2'h3):(1'h1)]) : $signed($unsigned(reg34[(4'h8):(3'h4)])));
    end
  assign wire38 = $signed(($unsigned($signed(wire27)) != (8'h9f)));
endmodule
