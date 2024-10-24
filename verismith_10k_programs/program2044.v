module top
#(parameter param214 = ({((((8'haa) ? (8'hbf) : (8'ha5)) && ((8'hb9) ? (8'h9f) : (8'hbb))) ? (~&(~(8'hbd))) : ({(8'hb5)} + (7'h43)))} ? (({((8'hb1) & (8'ha8))} ? ({(8'ha7)} << ((8'h9d) <<< (7'h40))) : (-((8'ha5) ^ (8'hb7)))) << {((8'hb9) ? {(8'ha9), (8'hab)} : ((8'hb6) > (8'hbc))), ((!(7'h43)) ^~ ((7'h42) >>> (8'ha2)))}) : ({{(!(8'h9f)), (8'ha0)}} ? ((((8'hbe) <<< (8'hbe)) ? {(8'hb2), (8'hb4)} : ((8'hae) >>> (8'hbb))) ? ({(8'haf), (8'ha5)} ? ((8'ha2) ? (7'h42) : (8'ha2)) : ((8'had) << (7'h40))) : (((8'hb2) >= (8'hb7)) > ((7'h44) ? (8'hb1) : (8'ha8)))) : {(-(&(8'hb8))), ({(8'hbf), (8'hab)} ? (~&(8'hb2)) : ((8'hb8) ? (8'ha1) : (8'hb6)))})), 
parameter param215 = (^param214))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire203;
  wire [(3'h7):(1'h0)] wire202;
  wire [(5'h11):(1'h0)] wire200;
  wire [(5'h10):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'he):(1'h0)] reg208 = (1'h0);
  reg [(4'hc):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(4'ha):(1'h0)] reg205 = (1'h0);
  reg [(4'he):(1'h0)] reg204 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire200,
                 wire5,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 (1'h0)};
  assign wire5 = (~wire1[(4'ha):(2'h3)]);
  module6 #() modinst201 (.y(wire200), .wire8(wire0), .wire10(wire3), .clk(clk), .wire9(wire4), .wire7(wire2));
  assign wire202 = $unsigned($signed((($unsigned(wire4) ?
                       $unsigned(wire3) : wire0[(3'h5):(1'h0)]) == wire2)));
  assign wire203 = $signed((8'hab));
  always
    @(posedge clk) begin
      reg204 <= $unsigned($signed(wire5[(4'he):(4'he)]));
      reg205 <= {(wire1[(4'hd):(4'h8)] ?
              $signed(((-wire4) ?
                  (~wire0) : ((7'h41) ?
                      wire203 : wire203))) : {{$unsigned(reg204),
                      $signed(wire0)}})};
      reg206 <= (wire5[(4'he):(2'h2)] != {wire200[(3'h7):(3'h7)],
          wire200[(1'h1):(1'h1)]});
      reg207 <= {reg204, (~^(wire3 ? wire203 : wire5))};
      if ($unsigned((^~{(8'hb9)})))
        begin
          if (wire0[(4'ha):(4'h9)])
            begin
              reg208 <= (~|{reg204[(4'he):(2'h2)]});
            end
          else
            begin
              reg208 <= {wire3, {$unsigned(wire200[(1'h1):(1'h1)])}};
              reg209 <= $signed(wire200);
              reg210 <= (wire203 ?
                  reg205 : ((((wire202 ? wire3 : reg207) ?
                          reg208[(4'he):(2'h2)] : {reg204,
                              reg208}) > $signed((reg208 - wire3))) ?
                      $signed(reg205[(3'h4):(2'h2)]) : wire202));
              reg211 <= (reg210 ? wire4[(3'h5):(1'h0)] : (8'hb4));
              reg212 <= wire202;
            end
          reg213 <= $signed((!($signed(reg210) ?
              (&$unsigned(wire2)) : ((~&(8'ha9)) & (7'h43)))));
        end
      else
        begin
          if ((($unsigned((|$unsigned(wire1))) && wire4[(3'h4):(1'h1)]) ?
              (wire5[(4'ha):(3'h7)] ?
                  wire3[(2'h2):(1'h1)] : (~^reg204[(2'h3):(2'h3)])) : (wire4 ?
                  (8'hb0) : (-reg210[(1'h1):(1'h1)]))))
            begin
              reg208 <= ($signed(reg210[(5'h10):(4'hc)]) ?
                  reg209[(4'hd):(4'ha)] : reg210);
            end
          else
            begin
              reg208 <= {($signed(wire202) ?
                      $unsigned((wire0 ^ (&(7'h42)))) : $signed($signed((reg212 ?
                          (7'h41) : wire200))))};
              reg209 <= (!{$signed($signed($signed(wire203))), reg209});
              reg210 <= (!($signed((wire200[(4'hf):(4'hb)] >= (+reg207))) ?
                  (-(reg208[(3'h7):(3'h5)] ?
                      (wire1 || wire2) : (~(8'had)))) : $unsigned($unsigned((reg204 >> (8'haf))))));
            end
          reg211 <= (~&{reg211});
          reg212 <= reg204[(4'h8):(3'h6)];
        end
    end
endmodule

module module6
#(parameter param198 = (({(((8'hbe) >>> (8'hb9)) < (!(8'h9e)))} ~^ {(((8'ha6) ? (8'ha2) : (8'ha7)) | ((8'hb3) != (8'hb8)))}) ? {(!(((7'h43) && (7'h40)) ? {(8'hbf)} : (+(7'h42))))} : (((^~{(8'h9d)}) ? {(|(8'ha6))} : (((8'hba) ? (8'ha2) : (8'hb2)) ^~ ((7'h42) >> (8'hb5)))) >> ((((8'haf) >>> (7'h44)) <= (~^(8'h9f))) * (8'hba)))), 
parameter param199 = (({param198} ? (~&((param198 ? (8'hae) : param198) ^ (param198 ? param198 : param198))) : (param198 ? ({param198} != param198) : (8'ha5))) || (&({{param198, param198}} ? (param198 ? {param198, param198} : (param198 != param198)) : (~|{(8'ha4), param198})))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire197;
  wire signed [(4'ha):(1'h0)] wire196;
  wire [(4'h9):(1'h0)] wire195;
  wire signed [(3'h4):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire193;
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire131,
                 wire84,
                 wire83,
                 wire40,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 wire81,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire158,
                 wire191,
                 wire193,
                 reg13,
                 reg14,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  assign wire11 = (~wire10[(1'h0):(1'h0)]);
  assign wire12 = ({wire11, wire8} >>> $unsigned((({wire10,
                      (8'ha8)} ^ (+wire11)) < $unsigned(wire11))));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire11);
      reg14 <= {(|(|reg13))};
    end
  assign wire15 = wire10[(2'h2):(1'h1)];
  assign wire16 = $signed(wire9[(4'ha):(3'h5)]);
  module17 #() modinst41 (wire40, clk, reg14, wire11, wire8, wire9);
  module42 #() modinst82 (wire81, clk, wire12, wire11, reg14, wire16);
  assign wire83 = $signed($unsigned(reg13[(4'ha):(3'h4)]));
  assign wire84 = $unsigned($signed(((~^(wire12 - wire40)) - wire12[(4'h9):(1'h0)])));
  always
    @(posedge clk) begin
      reg85 <= (((((wire84 | wire84) ?
                      (wire8 ? wire7 : wire8) : $unsigned((8'hb1))) ?
                  wire81 : $signed((wire83 ? wire81 : wire16))) ?
              $signed(wire9[(4'ha):(4'h8)]) : (wire84 + (!wire10))) ?
          ((~{wire7, (-wire16)}) ?
              ($unsigned((|reg14)) ?
                  wire10[(2'h2):(1'h1)] : wire7[(2'h3):(2'h3)]) : reg13[(2'h3):(2'h3)]) : (~^((+(wire15 ?
                  (8'hac) : wire10)) ?
              $unsigned((&(7'h43))) : wire8)));
      if (reg85)
        begin
          if ((((($signed(reg13) ?
                  (wire11 ? wire12 : wire15) : (wire9 != wire7)) ?
              ($unsigned(wire15) ?
                  (wire83 >= wire81) : {wire9}) : (wire11[(4'hd):(4'hb)] ?
                  (+(8'h9d)) : ((8'hbc) ? (7'h43) : wire8))) - ((wire12 ?
                  wire8 : ((8'hb2) ? wire84 : wire8)) ?
              wire81 : $unsigned((reg85 ?
                  wire12 : reg85)))) - (^~$unsigned(wire16[(5'h12):(4'he)]))))
            begin
              reg86 <= $signed(wire12);
              reg87 <= wire40;
              reg88 <= (~(-$signed({$unsigned(wire12),
                  wire16[(3'h5):(2'h2)]})));
            end
          else
            begin
              reg86 <= {($unsigned(($signed((7'h42)) < (^(7'h44)))) ^~ $unsigned(({(8'hb8),
                      wire15} << $unsigned(wire40)))),
                  (~($unsigned((reg85 >= wire16)) ?
                      wire11[(2'h3):(1'h0)] : ((wire10 ? reg86 : wire7) ?
                          wire83 : wire84[(4'he):(3'h4)])))};
              reg87 <= wire11[(1'h1):(1'h1)];
            end
          if (((-wire9) - {wire83}))
            begin
              reg89 <= (|$signed(reg85[(4'hd):(4'h9)]));
            end
          else
            begin
              reg89 <= $unsigned((-reg89[(4'ha):(1'h0)]));
              reg90 <= reg87;
            end
          reg91 <= (-$unsigned(((-$signed(reg13)) ^~ reg88[(4'ha):(1'h1)])));
          reg92 <= wire40;
        end
      else
        begin
          reg86 <= reg88;
          if ($signed(($signed(wire10) > ((!$unsigned(reg90)) ?
              wire10[(1'h1):(1'h1)] : (8'ha9)))))
            begin
              reg87 <= {((~|wire81[(4'hf):(4'hc)]) << wire8[(4'h9):(2'h3)]),
                  $signed((+reg91))};
              reg88 <= $unsigned((8'ha0));
              reg89 <= (+(~^{wire8[(3'h4):(3'h4)]}));
              reg90 <= wire8;
              reg91 <= (~^{reg92[(4'hb):(3'h6)]});
            end
          else
            begin
              reg87 <= $unsigned(wire84[(3'h6):(3'h4)]);
              reg88 <= wire40[(3'h5):(3'h5)];
              reg89 <= $unsigned($signed({$unsigned((wire15 ? reg89 : wire83)),
                  (^~wire40)}));
              reg90 <= reg86;
              reg91 <= $unsigned($signed($signed(($unsigned(wire16) || wire83))));
            end
          reg92 <= (reg88 | $unsigned(((((8'hbf) >>> wire81) ?
              (-(8'hb2)) : {reg91}) ~^ ((reg14 ? (8'ha0) : reg87) <= (reg86 ?
              reg91 : reg91)))));
          if ((|{$signed($unsigned(wire9)), wire8[(4'h8):(1'h1)]}))
            begin
              reg93 <= ((+((~(reg91 + wire16)) & $signed((wire84 ?
                      wire83 : wire40)))) ?
                  wire83[(1'h0):(1'h0)] : $unsigned((reg13[(2'h3):(1'h1)] ^ $unsigned((reg13 - (7'h41))))));
              reg94 <= (&((8'hb6) ?
                  ($signed((wire11 > reg93)) ?
                      ((reg85 >>> wire40) ?
                          reg87[(1'h1):(1'h1)] : $signed(wire12)) : {wire7[(4'hd):(4'h8)],
                          $signed(wire9)}) : (+(|(~|reg85)))));
              reg95 <= ($signed(((reg13[(1'h0):(1'h0)] ? reg85 : (-reg93)) ?
                  $signed(wire15[(4'h8):(3'h4)]) : (reg86[(4'h8):(2'h2)] >> $signed(reg13)))) <= wire12);
            end
          else
            begin
              reg93 <= wire81[(2'h2):(1'h0)];
            end
        end
      reg96 <= (reg13[(4'h9):(1'h0)] < ($unsigned({(reg14 ? wire8 : wire16)}) ?
          reg88[(5'h10):(4'hf)] : reg94));
      reg97 <= reg89;
      reg98 <= (wire7[(4'h8):(2'h3)] ?
          (&reg90) : ($signed($unsigned({wire9})) >= $unsigned((reg94 >>> ((8'hbf) <= reg86)))));
    end
  module99 #() modinst132 (wire131, clk, reg91, wire83, wire40, wire16);
  assign wire133 = (~&(reg89[(2'h3):(1'h1)] ^ $unsigned((|(8'hbf)))));
  assign wire134 = (8'hb7);
  assign wire135 = reg87;
  assign wire136 = ({$unsigned(reg86[(2'h2):(2'h2)])} ?
                       $signed(wire11[(1'h1):(1'h1)]) : ($unsigned(wire83[(1'h1):(1'h1)]) ?
                           reg89 : reg90));
  assign wire137 = $unsigned((|$unsigned(wire81)));
  module138 #() modinst159 (wire158, clk, wire7, reg93, wire10, reg90);
  module160 #() modinst192 (wire191, clk, reg86, reg14, wire7, reg89, wire10);
  module17 #() modinst194 (wire193, clk, wire8, reg87, wire15, wire158);
  assign wire195 = wire136[(4'ha):(3'h7)];
  assign wire196 = (wire81[(4'hf):(2'h2)] > (((~^$signed(reg93)) * (^$signed(wire12))) >= {({(7'h40)} ?
                           wire10[(3'h4):(2'h3)] : (wire134 ?
                               reg13 : (8'ha8)))}));
  assign wire197 = reg93[(3'h7):(2'h3)];
endmodule

module module160  (y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire165;
  input wire signed [(2'h3):(1'h0)] wire164;
  input wire signed [(4'ha):(1'h0)] wire163;
  input wire signed [(4'hf):(1'h0)] wire162;
  input wire signed [(4'hb):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire190;
  wire [(5'h11):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire187;
  wire [(4'hc):(1'h0)] wire186;
  wire [(2'h2):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire166;
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
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
                 (1'h0)};
  assign wire166 = ((~^{wire164}) ?
                       $signed((wire163[(2'h3):(2'h2)] << wire162)) : wire165);
  assign wire167 = wire164[(1'h1):(1'h1)];
  assign wire168 = $signed(($signed((8'hb4)) >= wire165));
  assign wire169 = wire162[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg170 <= $unsigned((-$signed($signed(wire168[(4'he):(4'h8)]))));
      reg171 <= wire164;
      if ($signed((~&wire161)))
        begin
          reg172 <= (reg170 ?
              $signed({$unsigned(wire168),
                  wire164}) : {($unsigned((~&reg171)) > $unsigned($signed(wire163))),
                  {reg171, $unsigned((wire164 && (8'h9e)))}});
          reg173 <= $signed($signed((8'haf)));
          reg174 <= wire165[(4'ha):(3'h7)];
          reg175 <= (+(!$signed((!(wire165 >> reg172)))));
        end
      else
        begin
          if (reg173[(2'h3):(1'h0)])
            begin
              reg172 <= $unsigned($signed((!((wire163 & (8'ha2)) > $unsigned((8'h9d))))));
              reg173 <= $signed((^wire167[(1'h1):(1'h0)]));
              reg174 <= reg170;
              reg175 <= $unsigned((8'hbf));
            end
          else
            begin
              reg172 <= wire161[(4'h9):(4'h9)];
              reg173 <= {wire166[(4'h8):(4'h8)]};
              reg174 <= (+(~wire165[(4'hd):(4'hc)]));
              reg175 <= (^wire164);
            end
          reg176 <= wire161[(2'h3):(1'h1)];
          if ((-(((((8'hac) ? wire166 : reg172) ?
                  (|reg171) : wire166[(2'h2):(2'h2)]) < $signed(reg171[(1'h1):(1'h0)])) ?
              (^$signed((&reg175))) : (($signed(wire162) ?
                  {reg170} : (~|(8'hbd))) && (wire161[(1'h0):(1'h0)] ?
                  $unsigned(wire163) : (&wire165))))))
            begin
              reg177 <= ({$unsigned($signed({reg175,
                      wire163}))} << ((+reg173) & $unsigned($unsigned(wire163[(4'h9):(2'h3)]))));
            end
          else
            begin
              reg177 <= (^~{wire169});
              reg178 <= $signed($unsigned(wire167));
              reg179 <= reg176[(2'h2):(1'h1)];
              reg180 <= $signed(wire165);
            end
          reg181 <= (reg178 == $unsigned($unsigned(wire164)));
          reg182 <= (^{reg172[(4'h8):(3'h4)]});
        end
      reg183 <= (&(^~$unsigned(reg170[(3'h7):(3'h7)])));
    end
  assign wire184 = (~reg171);
  assign wire185 = (^reg178);
  assign wire186 = ((wire168[(4'hf):(4'hb)] ?
                       {(~$unsigned(reg175)),
                           $unsigned(wire168[(3'h6):(2'h3)])} : (~|$unsigned($signed(reg171)))) || {$unsigned((^~wire163[(1'h1):(1'h0)])),
                       reg178});
  assign wire187 = ({$unsigned($signed(reg179[(3'h5):(2'h3)])),
                           {{$signed(reg177), (reg179 ? wire164 : wire169)}}} ?
                       $unsigned((|((!reg178) ~^ $signed((8'hac))))) : (~|(reg182 ?
                           $signed(wire161[(3'h5):(2'h3)]) : ((~|reg176) ?
                               $signed(wire186) : {reg181, reg171}))));
  assign wire188 = (8'haa);
  assign wire189 = $unsigned((|({wire167} ~^ (~^wire169))));
  assign wire190 = wire185[(2'h2):(1'h0)];
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire142;
  input wire signed [(4'hf):(1'h0)] wire141;
  input wire [(4'ha):(1'h0)] wire140;
  input wire signed [(3'h4):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
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
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire143 = (-(&($signed(wire140) ?
                       wire142 : {(wire139 <= (8'ha4)), (-wire141)})));
  assign wire144 = ($unsigned($signed(wire140)) >> $signed(wire142));
  assign wire145 = ($unsigned(({wire139} ?
                       (+wire142[(3'h6):(1'h1)]) : wire141)) > $unsigned(wire144));
  always
    @(posedge clk) begin
      reg146 <= (|(+$unsigned(({(8'hb6)} >= ((8'h9f) ? wire139 : wire139)))));
      reg147 <= wire144;
      if ($signed(($signed((^(wire141 ^~ reg146))) >>> wire141[(4'hc):(1'h1)])))
        begin
          reg148 <= wire144;
          if ((wire140 ^ $unsigned((8'ha6))))
            begin
              reg149 <= {wire140[(3'h6):(3'h4)], $signed($signed((8'hb0)))};
              reg150 <= wire139;
            end
          else
            begin
              reg149 <= reg148[(4'hb):(2'h2)];
            end
        end
      else
        begin
          if ($signed((((~&(!wire144)) == wire142[(4'h8):(1'h0)]) ?
              $signed(reg149[(3'h7):(3'h5)]) : $signed(((reg148 ?
                      reg149 : wire144) ?
                  ((8'hb3) ? reg148 : reg146) : reg146)))))
            begin
              reg148 <= ($unsigned($signed((|(reg149 ? reg147 : reg150)))) ?
                  (~&(reg146[(2'h3):(2'h2)] ?
                      ((reg149 ?
                          reg148 : wire142) >>> $signed(wire143)) : ((reg149 <<< reg150) ^ wire145[(4'h8):(3'h4)]))) : $signed((!$unsigned({wire141,
                      reg149}))));
              reg149 <= (wire145[(4'hf):(4'hd)] ?
                  (8'hba) : wire142[(4'h9):(2'h2)]);
              reg150 <= wire141[(3'h4):(3'h4)];
              reg151 <= (~&{wire144});
              reg152 <= reg150;
            end
          else
            begin
              reg148 <= (^(-$unsigned((|((8'hb9) <= reg148)))));
              reg149 <= wire139;
              reg150 <= {(&wire141), (~(~^(-reg149[(1'h1):(1'h0)])))};
            end
          reg153 <= (|(wire144 - wire142[(4'h8):(3'h5)]));
          reg154 <= $unsigned($unsigned($signed(reg148[(3'h6):(2'h3)])));
        end
    end
  always
    @(posedge clk) begin
      reg155 <= (~^({((^~reg150) ? (wire139 && wire142) : (!wire144))} ?
          (reg153[(1'h1):(1'h0)] > $signed($unsigned(reg146))) : $unsigned((|$signed((8'hb0))))));
      reg156 <= ((-$signed($signed((wire140 - reg146)))) >> (~|$signed($signed(wire142))));
      reg157 <= (wire142[(3'h4):(1'h1)] ?
          $unsigned($signed($unsigned(reg150[(3'h4):(2'h3)]))) : ($signed((~|$signed(reg151))) ?
              ({$unsigned(reg150)} ?
                  ($signed((8'had)) && $signed((8'hb4))) : (!(reg149 != reg152))) : reg150[(2'h2):(1'h0)]));
    end
endmodule

module module99  (y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire103;
  input wire [(3'h4):(1'h0)] wire102;
  input wire [(3'h6):(1'h0)] wire101;
  input wire [(5'h10):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire104;
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg130,
                 reg129,
                 reg128,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg105,
                 (1'h0)};
  assign wire104 = (&wire100);
  always
    @(posedge clk) begin
      reg105 <= $unsigned($unsigned({(&wire100)}));
    end
  assign wire106 = ((8'hb7) >>> wire100);
  assign wire107 = wire104;
  assign wire108 = $unsigned((~$signed((reg105[(5'h13):(4'h9)] ?
                       wire104 : (wire104 > reg105)))));
  always
    @(posedge clk) begin
      reg109 <= $signed(wire104);
      reg110 <= wire108;
      reg111 <= wire107;
      reg112 <= wire104;
    end
  assign wire113 = $unsigned((~|$signed(wire108[(4'h8):(3'h7)])));
  assign wire114 = (^~($signed(((~^wire107) ? (^wire103) : reg110)) + (wire104 ?
                       wire101 : (-wire108))));
  assign wire115 = $unsigned(wire100[(4'hb):(1'h0)]);
  assign wire116 = (^$unsigned({($unsigned(wire104) >> {wire115, reg111}),
                       {{wire101, wire113}, (8'haf)}}));
  always
    @(posedge clk) begin
      reg117 <= {wire114,
          (!($unsigned(reg105) ?
              wire108[(4'hc):(2'h3)] : $signed($unsigned(reg111))))};
      reg118 <= {{reg112,
              (wire107 ?
                  $signed($unsigned(wire106)) : ((~reg109) ^~ (wire113 * wire103)))}};
      reg119 <= reg112;
      reg120 <= wire114[(1'h0):(1'h0)];
      reg121 <= wire102[(2'h2):(1'h0)];
    end
  assign wire122 = $unsigned($signed(((^$unsigned(wire103)) <= {(wire106 != wire116)})));
  assign wire123 = $unsigned((~^(reg105[(4'hf):(2'h3)] && (~|reg120[(1'h0):(1'h0)]))));
  assign wire124 = $signed(((&$signed($unsigned(reg119))) ?
                       ($signed(reg110[(5'h12):(3'h7)]) == ((!reg105) || {wire102})) : (~^reg119)));
  assign wire125 = wire103;
  assign wire126 = (^((reg118[(1'h1):(1'h0)] ?
                           wire115 : ($signed(wire123) <<< (wire125 ?
                               wire113 : wire125))) ?
                       (wire100[(3'h4):(1'h1)] ?
                           ((wire113 <= (8'hae)) == (+wire114)) : ((reg105 || wire106) ?
                               $unsigned(wire107) : ((8'hac) ?
                                   wire123 : wire103))) : $signed(reg112)));
  assign wire127 = $unsigned(($signed($signed(reg118[(1'h0):(1'h0)])) | $signed(((wire124 ?
                       wire103 : reg105) == (wire101 ? wire122 : wire124)))));
  always
    @(posedge clk) begin
      reg128 <= ((~|(|wire122[(4'ha):(1'h1)])) ?
          ({(!$unsigned(wire100)), (8'ha8)} ?
              {$signed((|wire106)),
                  ((wire113 ? reg112 : reg118) >= {wire116,
                      wire102})} : (($signed(wire108) - (-wire116)) & (~(8'hab)))) : $unsigned($signed($signed((^wire102)))));
      reg129 <= wire104;
      reg130 <= $signed($signed(reg117));
    end
endmodule

module module42
#(parameter param79 = {(((((8'hac) & (8'hae)) ? (8'hb6) : ((8'hba) ? (8'h9c) : (8'hbf))) ? ({(8'hbb), (8'ha6)} ? (~&(8'hb7)) : ((8'hb5) ? (8'had) : (8'hb4))) : ({(8'hb1), (8'h9d)} ? (+(8'h9e)) : ((8'hb6) | (8'ha1)))) ? ((^((8'hac) ^~ (8'hb8))) & (((8'hbf) ? (7'h42) : (8'ha1)) - (~&(8'hb8)))) : (8'h9e))}, 
parameter param80 = param79)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire signed [(3'h5):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire53;
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire53,
                 reg75,
                 reg74,
                 reg73,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire44 ?
          ($signed(wire46[(1'h1):(1'h0)]) ?
              (8'h9e) : $signed(($unsigned(wire45) ?
                  (8'haa) : (!(8'hb6))))) : (wire45[(1'h0):(1'h0)] ?
              ($unsigned((wire43 & wire46)) > wire44[(3'h4):(1'h1)]) : $signed(wire45))))
        begin
          reg47 <= $unsigned($signed((wire43 ?
              ((&wire45) ? (7'h44) : (8'hb7)) : wire43[(2'h2):(2'h2)])));
          reg48 <= $unsigned(($signed((~|(reg47 ?
              (8'ha3) : wire45))) >>> (((wire46 * wire43) << $unsigned(wire45)) ?
              (&$unsigned(wire46)) : {$unsigned(wire44)})));
        end
      else
        begin
          reg47 <= (~^$signed($signed((^~(reg47 ? wire46 : wire44)))));
          reg48 <= ((~^wire43[(1'h0):(1'h0)]) ?
              reg48 : $signed(($signed($signed(wire43)) | $signed((+reg48)))));
          if (wire44[(3'h4):(1'h1)])
            begin
              reg49 <= reg47;
              reg50 <= (reg48 ?
                  $unsigned(((|$signed(wire43)) | $signed($signed(reg49)))) : $signed(reg49[(3'h4):(3'h4)]));
              reg51 <= wire44;
              reg52 <= $unsigned((7'h41));
            end
          else
            begin
              reg49 <= wire44[(3'h4):(1'h1)];
              reg50 <= (wire44 ?
                  (!(reg50[(3'h6):(3'h6)] ?
                      $unsigned((reg50 ? reg48 : reg50)) : ($signed(wire43) ?
                          {reg52,
                              wire46} : (wire45 < wire46)))) : (reg47[(4'hf):(3'h5)] | (reg50 ?
                      ((^reg50) ?
                          $unsigned((8'ha6)) : reg47) : ((wire44 | reg47) ?
                          ((8'hb9) ? (8'hb4) : wire45) : $signed((8'ha5))))));
            end
        end
    end
  assign wire53 = (wire45 ?
                      $signed($unsigned((wire45[(2'h2):(2'h2)] ?
                          $signed(reg50) : (!reg51)))) : ((wire44 ?
                              (reg47[(4'hc):(3'h7)] >> $unsigned(wire46)) : reg47[(3'h4):(3'h4)]) ?
                          reg51 : wire45[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg54 <= $signed($signed(({(8'hbf), $signed(reg49)} ?
          $signed($unsigned(reg51)) : reg49[(2'h3):(2'h3)])));
      reg55 <= ($unsigned($unsigned(($unsigned(wire44) != (reg49 && wire43)))) || (!($signed(reg48[(5'h14):(3'h7)]) >> (+(wire53 < wire45)))));
      if ((~(((^~((8'ha7) + reg48)) || (~&reg49[(1'h0):(1'h0)])) ?
          reg48[(5'h14):(4'h9)] : ($signed(wire44) | reg51[(2'h3):(2'h2)]))))
        begin
          reg56 <= wire46;
          reg57 <= (^reg50[(1'h0):(1'h0)]);
          reg58 <= $unsigned((~(reg54[(4'ha):(4'h9)] ^~ $signed((8'ha8)))));
          reg59 <= reg54[(4'hd):(3'h4)];
          reg60 <= ((((8'ha0) >>> reg47[(2'h2):(1'h1)]) ^ ((~|wire45[(2'h2):(1'h0)]) ^ reg57)) >= (^$unsigned(reg56)));
        end
      else
        begin
          if ($unsigned((~&(reg50 < (+reg49[(4'ha):(1'h0)])))))
            begin
              reg56 <= reg50[(3'h7):(3'h4)];
              reg57 <= ({$unsigned($signed({reg52,
                      (8'ha5)}))} >> (+(^$unsigned((wire43 > reg59)))));
              reg58 <= reg60[(2'h2):(1'h1)];
            end
          else
            begin
              reg56 <= {(reg51 << (reg52 ? reg55[(2'h2):(1'h1)] : (|{reg59}))),
                  ((|(reg51 ? (^reg60) : (8'hbb))) ^ $unsigned(((wire53 ?
                          wire45 : wire53) ?
                      (8'hb2) : (~reg60))))};
              reg57 <= ($signed(reg54) ?
                  reg50[(1'h1):(1'h0)] : $unsigned(((8'hb7) <= $signed(reg60[(1'h0):(1'h0)]))));
              reg58 <= (reg56 >>> $signed(((^~(+(8'hb4))) < ($signed((8'hba)) ?
                  (wire44 || reg57) : {reg57, reg58}))));
            end
          reg59 <= (($unsigned($unsigned($unsigned(wire46))) < (~^reg52)) ?
              $signed(reg59) : ((|(^~$signed(wire46))) < reg49[(2'h3):(1'h1)]));
        end
      if ($signed($signed($signed($signed({reg56})))))
        begin
          reg61 <= $signed(wire43[(2'h2):(2'h2)]);
          reg62 <= $signed(({reg51} <<< reg56[(5'h13):(2'h3)]));
        end
      else
        begin
          reg61 <= $signed(reg50[(3'h6):(1'h0)]);
          reg62 <= (&($unsigned(((~|wire43) <<< (8'hb2))) ?
              wire44 : $signed(reg60[(2'h2):(1'h1)])));
        end
      if ((wire44 ?
          wire46[(1'h0):(1'h0)] : ($unsigned(($signed(reg56) ?
              wire43[(1'h0):(1'h0)] : $unsigned(wire46))) + (($signed(reg61) ?
                  $signed(reg49) : reg56[(1'h0):(1'h0)]) ?
              ($signed(wire46) <= reg49) : {reg52}))))
        begin
          if (((reg52 | (reg48[(5'h10):(2'h3)] ~^ ((reg56 ? reg49 : reg51) ?
                  reg58[(2'h2):(1'h0)] : ((8'ha5) << wire46)))) ?
              ($signed((~|(reg48 ?
                  (8'had) : wire46))) - $unsigned(reg47[(3'h5):(2'h2)])) : $unsigned(wire53)))
            begin
              reg63 <= {$signed(reg58),
                  $unsigned({reg49, ({reg50, reg59} << reg51[(3'h4):(2'h3)])})};
              reg64 <= reg56;
              reg65 <= ((~^$unsigned($signed((reg54 ? (7'h40) : wire53)))) ?
                  (-reg57[(2'h3):(1'h0)]) : reg61[(1'h0):(1'h0)]);
              reg66 <= (($signed($unsigned({reg59})) ?
                      ({(reg64 ^ reg59)} || $unsigned($unsigned(reg61))) : $unsigned((wire46 ?
                          reg61 : reg62[(1'h0):(1'h0)]))) ?
                  (reg48 ?
                      (((8'had) != (reg56 > (8'hab))) >>> {$unsigned(wire43),
                          reg49[(4'ha):(4'h9)]}) : reg60) : (&(~&$unsigned($unsigned(reg48)))));
            end
          else
            begin
              reg63 <= wire53[(4'hd):(1'h1)];
            end
          reg67 <= reg59[(1'h0):(1'h0)];
          reg68 <= (^~$signed($unsigned(((~^wire44) ?
              ((8'ha3) ? wire53 : wire43) : reg64))));
        end
      else
        begin
          reg63 <= (((~^reg47[(1'h1):(1'h1)]) ?
              ((((8'hb4) >= reg62) ? $signed(reg67) : $unsigned(wire53)) ?
                  wire44 : (reg65 ?
                      (reg65 ?
                          reg49 : (8'hb2)) : (+(7'h42)))) : (&$unsigned((reg62 ~^ reg57)))) <<< (!reg48));
          reg64 <= reg63[(3'h5):(3'h4)];
        end
    end
  assign wire69 = ($signed(reg61[(2'h2):(1'h0)]) & ($signed((8'ha8)) + $unsigned($unsigned(wire44))));
  assign wire70 = ({$signed($signed(reg66[(1'h0):(1'h0)]))} ?
                      $unsigned($signed(((~(8'h9d)) * reg68[(3'h6):(3'h5)]))) : wire44[(1'h0):(1'h0)]);
  assign wire71 = $unsigned({$signed($signed($unsigned((7'h42))))});
  assign wire72 = reg65;
  always
    @(posedge clk) begin
      reg73 <= $unsigned((^wire44));
      reg74 <= reg67;
      reg75 <= $unsigned((reg73 ?
          $unsigned({$signed(reg49), wire69}) : ($unsigned((reg60 ?
              wire69 : reg65)) + (|(|reg65)))));
    end
  assign wire76 = reg68[(4'hd):(3'h7)];
  assign wire77 = (~&{(((reg64 <<< reg66) < (+reg47)) ~^ ((reg56 ?
                              reg57 : reg57) ?
                          wire45[(2'h2):(1'h0)] : (reg74 & reg60))),
                      (wire70 >>> reg51)});
  assign wire78 = (reg67 ?
                      $unsigned(((wire70[(4'ha):(1'h0)] >> (reg67 ?
                              wire45 : reg66)) ?
                          $signed({reg65,
                              reg58}) : (~&{wire44}))) : (^~$signed((&(8'haa)))));
endmodule

module module17
#(parameter param38 = ((({((7'h41) & (8'ha2)), ((8'hbe) << (8'ha3))} & (7'h40)) - ((((8'ha9) ? (8'ha4) : (8'hb1)) ? ((8'hba) ? (8'ha8) : (7'h44)) : ((8'hb8) & (8'hb4))) ^~ (((8'h9e) >>> (8'h9d)) + (8'hbf)))) <<< (((~|((8'hba) << (8'had))) ? (((8'hae) ? (7'h42) : (7'h43)) >>> (7'h44)) : (!((8'hba) ? (8'hac) : (8'hb9)))) == ((-(8'ha6)) ? (((8'ha3) & (8'hbf)) & (&(7'h41))) : (^~(+(8'hbc)))))), 
parameter param39 = param38)
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire22 = ((~|wire20) ? wire18 : (|((^~$signed(wire20)) > (~^wire21))));
  assign wire23 = wire21;
  assign wire24 = $unsigned($signed(((wire22[(3'h4):(1'h1)] & (&wire23)) ?
                      $signed((wire21 & wire21)) : {(wire22 ?
                              wire22 : wire19)})));
  assign wire25 = (8'haa);
  assign wire26 = $unsigned(wire18);
  always
    @(posedge clk) begin
      reg27 <= wire26;
      if ((((~^{$signed((8'h9f)), (wire18 ? wire20 : wire20)}) ?
              $unsigned($unsigned(wire18)) : (8'hbe)) ?
          $unsigned(({$unsigned(wire18)} ?
              $unsigned($signed(wire21)) : reg27)) : (&(wire19 <= $signed((wire18 ?
              wire21 : wire19))))))
        begin
          reg28 <= wire19[(1'h1):(1'h0)];
        end
      else
        begin
          reg28 <= $unsigned({{$signed({(8'ha2)}), $signed(wire21)},
              ((~wire26) | ($signed(wire20) ? reg27 : {(8'hb9)}))});
          reg29 <= $signed(($signed($signed((reg27 == wire18))) ?
              ({wire25,
                  wire20[(1'h0):(1'h0)]} - wire19) : (~^$unsigned(wire22[(2'h3):(1'h1)]))));
          reg30 <= {reg28, $unsigned($unsigned((!reg29)))};
          reg31 <= (^~$signed($signed((+$unsigned(reg28)))));
          reg32 <= wire21[(3'h5):(2'h2)];
        end
      reg33 <= (((wire19[(2'h3):(1'h0)] ?
              (wire21[(1'h0):(1'h0)] + (wire18 ?
                  reg31 : reg32)) : wire22[(2'h3):(1'h0)]) == wire19[(4'ha):(3'h4)]) ?
          ((reg32[(3'h6):(1'h0)] + ({wire23} ^~ $unsigned((8'hbb)))) || reg29) : ({((+wire18) >> (&reg27))} || $signed((reg27 ?
              {wire18} : $signed(wire26)))));
    end
  assign wire34 = (($unsigned($signed(wire19[(3'h4):(1'h1)])) ^~ ((8'ha6) * wire21)) >= $unsigned((8'ha7)));
  assign wire35 = ({(8'hb8)} ^ (reg29[(2'h3):(2'h2)] ?
                      $signed((8'ha9)) : reg33));
  assign wire36 = wire24[(3'h4):(2'h3)];
  assign wire37 = $unsigned($unsigned(reg30[(3'h6):(2'h3)]));
endmodule
