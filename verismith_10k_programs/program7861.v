module top
#(parameter param214 = ((((8'hbb) - ((&(8'ha3)) && (~(8'ha0)))) ? ((~^(^(8'hb5))) ? (((8'ha1) * (8'hbe)) >>> ((8'ha4) ? (7'h42) : (8'hb0))) : (~(&(8'ha3)))) : {((~&(8'ha4)) ? {(7'h40), (8'hb7)} : ((8'h9f) ? (8'hb4) : (8'h9e)))}) && ((~|(~((8'ha1) ? (8'hbd) : (7'h43)))) && (!(8'hbc)))), 
parameter param215 = (param214 ? ((^~param214) ? param214 : {(!(~&param214))}) : (~|(({param214} <= (param214 - param214)) ^ (param214 ? (param214 >>> param214) : param214)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire213;
  wire signed [(4'hc):(1'h0)] wire212;
  wire [(5'h14):(1'h0)] wire211;
  wire signed [(4'h8):(1'h0)] wire210;
  wire signed [(4'hf):(1'h0)] wire209;
  wire [(4'ha):(1'h0)] wire208;
  wire signed [(5'h15):(1'h0)] wire207;
  wire signed [(4'h9):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(4'h9):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire202;
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire169,
                 wire8,
                 wire7,
                 wire171,
                 wire202,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((~^(^~$signed(wire3))) ?
          (wire1[(2'h2):(1'h1)] ?
              wire1[(1'h0):(1'h0)] : (!wire0[(2'h2):(1'h0)])) : (!({wire0,
              wire3} == (-wire3)))) <<< (wire0 == (($unsigned(wire3) ?
              $unsigned(wire3) : (8'hae)) ?
          $unsigned($unsigned(wire3)) : $unsigned($unsigned(wire0)))));
      reg5 <= (!{$unsigned((!wire3)), (^~(wire3 > (wire1 ? wire1 : reg4)))});
      reg6 <= reg5;
    end
  assign wire7 = reg6;
  assign wire8 = reg5[(2'h3):(1'h0)];
  module9 #() modinst170 (.wire13(wire3), .wire12(reg5), .wire10(wire7), .wire11(wire0), .clk(clk), .y(wire169));
  assign wire171 = ((-reg6) ?
                       wire169 : (reg4 ^~ $unsigned($unsigned($unsigned(wire169)))));
  module172 #() modinst203 (wire202, clk, wire169, reg6, wire171, wire0);
  assign wire204 = $unsigned(reg4[(1'h1):(1'h1)]);
  assign wire205 = {$signed(wire8[(4'hc):(2'h3)])};
  assign wire206 = {(!{((!(8'ha3)) ? wire169[(3'h6):(1'h0)] : (&wire171)),
                           $unsigned({wire204, wire2})}),
                       ((wire202 & (^~reg5)) <= (~$signed((wire2 ?
                           reg5 : wire3))))};
  assign wire207 = {$unsigned(((!(wire169 ?
                           reg6 : wire0)) && (wire2 ^~ wire7[(4'hf):(4'h9)]))),
                       wire0[(2'h2):(1'h0)]};
  assign wire208 = $unsigned(wire1[(2'h3):(2'h3)]);
  assign wire209 = $signed(($unsigned(reg6) >= (wire7 >> $signed(wire7))));
  assign wire210 = (-($signed(((reg4 ?
                           (8'hb9) : wire209) * wire1[(2'h2):(2'h2)])) ?
                       $unsigned(reg4) : $unsigned((8'ha0))));
  assign wire211 = (wire171 + ((reg4 >>> $signed((wire0 >= wire7))) * $signed(wire209[(4'hb):(4'h8)])));
  assign wire212 = (~(({(wire209 ? reg6 : reg6)} ?
                       wire1[(1'h0):(1'h0)] : {(8'hbb)}) - ({wire211[(5'h14):(3'h4)],
                       (wire8 >= (8'hbb))} ^ wire2)));
  assign wire213 = wire1[(1'h0):(1'h0)];
endmodule

module module172
#(parameter param200 = {((|(!(~^(8'ha9)))) && ((^~((8'hb8) ? (8'hbc) : (8'hb3))) ^~ (((8'hbe) ? (7'h40) : (7'h41)) ? ((8'h9f) ? (8'hbf) : (8'h9d)) : ((8'h9e) ? (8'hbc) : (8'hbc)))))}, 
parameter param201 = (param200 >>> (~&{param200})))
(y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire176;
  input wire signed [(5'h10):(1'h0)] wire175;
  input wire signed [(4'hb):(1'h0)] wire174;
  input wire signed [(5'h12):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire199;
  wire [(5'h14):(1'h0)] wire198;
  wire [(5'h13):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire196;
  wire [(3'h7):(1'h0)] wire195;
  wire [(4'h9):(1'h0)] wire194;
  wire signed [(2'h2):(1'h0)] wire192;
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire192,
                 (1'h0)};
  module177 #() modinst193 (wire192, clk, wire176, wire175, wire173, wire174);
  assign wire194 = $unsigned(wire173);
  assign wire195 = wire176;
  assign wire196 = wire175[(5'h10):(3'h5)];
  assign wire197 = (!((wire196[(1'h0):(1'h0)] << (~|$unsigned(wire174))) ?
                       (^$signed(wire173[(1'h0):(1'h0)])) : $unsigned(wire174[(4'h9):(4'h9)])));
  assign wire198 = (($signed(((wire174 ?
                       wire197 : wire195) <<< (-wire192))) || (~wire175[(5'h10):(4'hb)])) + $signed((+$signed((wire194 ?
                       (8'hb7) : wire197)))));
  assign wire199 = wire175[(3'h5):(1'h0)];
endmodule

module module9
#(parameter param167 = ((((^(-(8'hb1))) > {(~|(8'hbf))}) < {(~((8'hb2) & (8'ha1)))}) && ((|(~&((8'h9d) ? (8'ha3) : (8'ha0)))) ? ((((8'ha4) ? (8'hb1) : (8'ha8)) > ((8'hb2) + (8'hb6))) | (((8'ha2) > (8'hb5)) ^ (+(8'h9f)))) : (((-(7'h43)) > ((8'haa) + (8'ha7))) ? (~{(8'hbd), (8'hab)}) : {((8'hba) + (8'hb4))}))), 
parameter param168 = (8'ha3))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire85;
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  assign y = {wire166,
                 wire164,
                 wire127,
                 wire126,
                 wire119,
                 wire14,
                 wire85,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 (1'h0)};
  assign wire14 = wire10;
  module15 #() modinst86 (wire85, clk, wire12, wire10, wire13, wire14, wire11);
  module87 #() modinst120 (.wire91(wire11), .wire88(wire12), .wire89(wire10), .clk(clk), .wire90(wire14), .y(wire119));
  always
    @(posedge clk) begin
      if ((8'h9d))
        begin
          reg121 <= wire13;
          reg122 <= $signed({$signed(wire119)});
          if ($signed((wire12[(4'hc):(4'ha)] ?
              wire12 : ($unsigned((+wire14)) ?
                  $signed((~|wire14)) : $unsigned((wire14 || wire85))))))
            begin
              reg123 <= (reg121[(3'h5):(3'h5)] | $unsigned(($unsigned({wire14}) ?
                  wire14 : (reg121 << $signed(wire13)))));
              reg124 <= ($signed((wire13 & wire10)) ?
                  $unsigned(($unsigned($signed(reg121)) && wire119[(3'h4):(1'h1)])) : ($unsigned($unsigned($unsigned(wire85))) ?
                      {(!(wire85 <= wire11)),
                          reg121} : $signed(($signed(wire12) == (&wire14)))));
            end
          else
            begin
              reg123 <= (!$unsigned(((8'hb4) ^ (wire11[(4'hd):(3'h6)] >>> (|wire12)))));
              reg124 <= {(((^wire12[(1'h0):(1'h0)]) ^~ {$signed(wire13),
                      (wire14 ? (8'ha9) : wire119)}) ~^ (~^(~|{reg124,
                      wire13}))),
                  wire13[(3'h7):(1'h1)]};
            end
          reg125 <= {((+(((8'hba) * wire85) && reg122[(1'h0):(1'h0)])) ?
                  $signed(($signed((8'hb4)) != $signed(wire11))) : wire11[(3'h4):(2'h2)]),
              (wire10 ? wire11[(4'ha):(3'h5)] : wire12[(3'h4):(2'h3)])};
        end
      else
        begin
          reg121 <= reg121;
          if ((($unsigned($signed(reg123[(4'h9):(1'h0)])) ?
                  wire12 : $signed($unsigned((^~(8'haf))))) ?
              wire14[(5'h10):(4'hf)] : $unsigned($unsigned($unsigned(reg124[(1'h1):(1'h1)])))))
            begin
              reg122 <= wire10;
              reg123 <= $unsigned(reg123[(4'h8):(3'h5)]);
              reg124 <= wire14;
              reg125 <= $unsigned((~|$signed(wire14[(2'h3):(2'h2)])));
            end
          else
            begin
              reg122 <= reg121[(4'h9):(3'h5)];
              reg123 <= wire14[(4'hd):(1'h1)];
              reg124 <= $signed($unsigned({$unsigned((~(8'haf)))}));
            end
        end
    end
  assign wire126 = wire119[(1'h0):(1'h0)];
  assign wire127 = $signed($signed(($signed((wire85 ? wire119 : wire11)) ?
                       wire10 : (+(&wire85)))));
  module128 #() modinst165 (.wire129(reg125), .y(wire164), .clk(clk), .wire132(reg122), .wire131(wire12), .wire130(reg123), .wire133(wire10));
  assign wire166 = (&{$signed($signed({wire14}))});
endmodule

module module128
#(parameter param163 = ({(|{((8'hbd) ? (8'hae) : (8'ha0)), ((8'h9e) ? (7'h44) : (8'ha6))}), (((8'h9f) ? ((8'hb2) ? (8'ha7) : (8'hb1)) : ((8'haa) ^ (8'haa))) ? (((7'h40) ^~ (8'hb2)) ? ((8'h9f) ? (8'hb5) : (8'h9d)) : ((8'ha1) ~^ (8'ha2))) : ((~^(8'ha0)) ? (~^(8'hbd)) : (~|(8'hb8))))} * (((((8'hbd) ? (8'hb6) : (8'hbf)) || ((8'hb4) ? (8'ha7) : (8'ha8))) ? (~{(8'hbf), (8'hbf)}) : (-{(8'h9c), (8'hbb)})) >= ({((7'h43) ? (8'ha8) : (8'h9e))} * {((8'hae) & (8'h9c)), (!(8'ha3))}))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire133;
  input wire [(4'hb):(1'h0)] wire132;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire [(4'he):(1'h0)] wire130;
  input wire signed [(3'h5):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire160;
  wire [(3'h4):(1'h0)] wire159;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire139,
                 wire136,
                 wire135,
                 wire134,
                 reg158,
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
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire134 = wire129;
  assign wire135 = ((!($unsigned($unsigned(wire134)) ?
                       (!$unsigned(wire129)) : $unsigned(((8'hb6) > wire131)))) << (~$signed($signed($signed(wire131)))));
  assign wire136 = (((^~$signed($unsigned(wire134))) ?
                           ({$unsigned(wire131), wire135} ?
                               (~|(!wire132)) : (~^{wire134,
                                   wire132})) : (wire133[(4'h9):(4'h8)] & $unsigned($unsigned((8'hb6))))) ?
                       $signed($unsigned((~&(|wire134)))) : {((wire134[(1'h1):(1'h0)] || wire129) ?
                               (~&{wire132}) : wire132[(3'h6):(3'h5)])});
  always
    @(posedge clk) begin
      reg137 <= $unsigned(($unsigned($signed((wire132 ?
          wire130 : wire133))) != $signed(wire132[(3'h6):(1'h1)])));
      reg138 <= (8'ha5);
    end
  assign wire139 = $unsigned((wire135 ? wire135 : reg137[(4'ha):(3'h6)]));
  always
    @(posedge clk) begin
      if ((|{(((8'hb3) && wire135[(4'hb):(4'h9)]) >> {(wire129 ?
                  wire130 : wire129)})}))
        begin
          reg140 <= {$signed(({(wire130 ?
                      (8'h9f) : wire133)} >> (^~{wire129})))};
          if ((wire132[(4'h8):(3'h7)] >= $signed({(reg137[(3'h6):(1'h0)] && $unsigned(wire132)),
              wire133[(4'hd):(4'ha)]})))
            begin
              reg141 <= {(+reg140[(4'h9):(3'h7)])};
              reg142 <= (~(~^wire139));
              reg143 <= (($unsigned((8'ha5)) >= (^~((-wire134) >>> $unsigned(wire131)))) || (($unsigned((wire135 ?
                  wire134 : wire130)) ~^ ((wire132 ? (8'ha9) : wire132) ?
                  $unsigned(wire129) : {reg138})) * $signed((^~reg140))));
              reg144 <= (reg138[(2'h2):(1'h0)] > ({{(~|wire134),
                      $unsigned(reg142)}} <<< wire132[(4'h9):(4'h9)]));
              reg145 <= (wire131 ?
                  ((|($signed((8'ha0)) ?
                          $signed(wire129) : (wire136 > wire135))) ?
                      $unsigned(wire131) : $signed(wire133[(3'h7):(2'h3)])) : $signed($signed(((reg144 <= wire134) & wire135[(4'hc):(3'h5)]))));
            end
          else
            begin
              reg141 <= ((reg137 ?
                      (wire134[(3'h4):(1'h0)] ?
                          wire135 : (wire136[(5'h10):(3'h4)] >> wire129[(1'h0):(1'h0)])) : (-((!wire130) ?
                          $signed(wire131) : $signed(wire131)))) ?
                  (reg142 - $signed($unsigned($unsigned(wire132)))) : (^~$signed((^$unsigned((8'hb0))))));
            end
          if (wire139)
            begin
              reg146 <= (~^($signed($unsigned(reg143)) ?
                  (!reg143) : (~^wire136[(3'h7):(3'h4)])));
              reg147 <= {$unsigned($signed((~|(wire136 >> reg142)))),
                  (^~(-{wire135, {wire134}}))};
            end
          else
            begin
              reg146 <= reg145[(5'h10):(4'he)];
            end
        end
      else
        begin
          if (reg138)
            begin
              reg140 <= ({$signed($unsigned($unsigned(wire133))),
                  (^~reg137)} + (~$unsigned((wire134[(3'h5):(1'h1)] > (^~wire134)))));
              reg141 <= (wire133 ?
                  ((wire136[(4'he):(3'h7)] ?
                          $unsigned(reg147[(4'hd):(4'hd)]) : $unsigned((|wire136))) ?
                      (($signed(wire129) ?
                              $unsigned((8'ha0)) : reg145[(5'h13):(4'he)]) ?
                          reg138[(3'h4):(2'h3)] : reg141[(5'h12):(4'hc)]) : (8'ha2)) : ($unsigned((((7'h41) || (8'haa)) < $unsigned(reg144))) >>> (wire131 ?
                      ((+reg143) >= wire134[(3'h6):(3'h4)]) : (&(+wire135)))));
              reg142 <= ((!$unsigned($signed(reg140[(4'h8):(3'h4)]))) && ($signed(reg147[(3'h5):(3'h5)]) && wire130));
              reg143 <= ($unsigned(wire130) << wire133[(3'h7):(2'h2)]);
            end
          else
            begin
              reg140 <= ($signed(($signed((reg137 ?
                  reg147 : (8'ha3))) || $signed((wire132 ?
                  reg140 : wire130)))) ^ (&$signed(((reg140 ?
                      reg147 : wire132) ?
                  (wire132 ? wire130 : wire130) : (-(8'hbc))))));
              reg141 <= (reg146 ?
                  wire135[(3'h4):(1'h0)] : $signed((~&$unsigned(reg144[(3'h6):(2'h3)]))));
              reg142 <= reg141;
            end
        end
      reg148 <= $signed($unsigned(wire136[(4'hc):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if (($unsigned((reg147 ?
              reg141[(4'hb):(2'h2)] : ((reg138 > (8'ha3)) ?
                  wire133[(4'h8):(3'h7)] : (8'ha4)))) ?
          ((-((reg146 >>> wire129) ? (reg144 ~^ wire135) : $unsigned(reg146))) ?
              ($unsigned((wire136 ?
                  (8'ha8) : wire134)) >= $unsigned(wire135)) : $unsigned((+(wire132 & reg140)))) : wire136))
        begin
          reg149 <= {reg143, reg144};
        end
      else
        begin
          reg149 <= (~|$unsigned(reg141));
          reg150 <= reg141[(1'h0):(1'h0)];
          reg151 <= (($signed($signed(reg140[(5'h12):(3'h6)])) | $unsigned(reg147)) ?
              reg146 : reg143[(3'h7):(3'h6)]);
          reg152 <= (!{(^$signed({wire135, reg141}))});
          reg153 <= wire136;
        end
      reg154 <= (8'hb7);
    end
  always
    @(posedge clk) begin
      reg155 <= $unsigned((+({$unsigned(reg140), $unsigned(reg154)} ?
          {(reg147 ? wire136 : reg138),
              $unsigned(reg147)} : $signed(reg151[(2'h2):(1'h1)]))));
      reg156 <= $unsigned(reg151);
      reg157 <= reg146;
      reg158 <= $signed($unsigned((-$unsigned((wire134 ^~ wire135)))));
    end
  assign wire159 = ((!($signed(wire139) == (wire135[(3'h7):(3'h7)] | {reg155,
                           reg158}))) ?
                       (^~(^~{reg156,
                           ((8'ha5) <<< wire132)})) : $unsigned((^~((8'hb5) ?
                           $signed((8'hbd)) : $signed(reg153)))));
  assign wire160 = $signed((wire133[(4'hb):(4'h8)] ?
                       reg138 : ($signed({reg148}) ? (8'hbd) : wire129)));
  assign wire161 = ($unsigned(reg154[(2'h3):(1'h0)]) || ((($unsigned(reg149) ?
                           wire139[(4'hb):(2'h3)] : (+(8'had))) ?
                       (~^wire139) : reg146) >= $signed((8'ha7))));
  assign wire162 = (reg147[(4'hd):(4'ha)] ^ $signed(reg155));
endmodule

module module87
#(parameter param118 = ((~|((((8'ha4) << (8'ha8)) * ((8'hb3) ? (8'hb2) : (8'hb0))) != (~|((8'hb0) ^ (8'h9f))))) ? (((-(~|(8'had))) * (((8'hab) ? (8'hb5) : (8'ha5)) ? ((8'hae) >= (8'h9d)) : (~|(8'haf)))) <<< {(((7'h43) ? (8'hac) : (8'hb6)) ? ((7'h42) >> (8'hbe)) : {(8'hba)}), (((8'ha8) + (8'hb4)) >>> (|(8'hb3)))}) : ({(&((8'hb4) ? (8'ha4) : (7'h40)))} ? ((~^(~|(8'h9e))) >>> ((8'haa) ? (~(8'ha8)) : ((8'ha0) ? (8'had) : (7'h43)))) : (!(~|((8'ha0) >>> (8'hbc)))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire signed [(5'h12):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 reg98,
                 (1'h0)};
  assign wire92 = $signed(wire90[(2'h3):(2'h3)]);
  assign wire93 = $unsigned($signed($signed((wire88 ?
                      {wire89} : (wire92 && wire91)))));
  assign wire94 = ((~^(&$signed(wire93))) < (-wire93));
  assign wire95 = ({{({wire92, wire90} >> (wire89 ? wire94 : wire94)),
                          $unsigned((!(8'ha6)))},
                      $unsigned($unsigned($signed(wire92)))} >>> (8'hb2));
  assign wire96 = $signed((~^wire94[(1'h0):(1'h0)]));
  assign wire97 = ($signed((-((^~wire90) ?
                      (wire88 > wire91) : (wire95 >> wire95)))) > (~&(&$unsigned((&wire88)))));
  always
    @(posedge clk) begin
      reg98 <= (wire88[(2'h3):(2'h3)] ? wire93[(4'ha):(2'h3)] : wire88);
      reg99 <= wire97;
      reg100 <= wire96[(4'h8):(3'h4)];
      if (wire89[(3'h4):(1'h0)])
        begin
          reg101 <= $unsigned((({wire93[(4'he):(4'h9)]} ?
                  wire93[(3'h5):(2'h2)] : ((~|reg98) * ((8'ha0) ?
                      (8'hb1) : reg99))) ?
              reg100[(3'h7):(2'h3)] : (($signed(wire95) >> $unsigned(reg100)) >= {(wire89 >>> reg99)})));
          reg102 <= (8'hb8);
          if (wire92[(1'h1):(1'h0)])
            begin
              reg103 <= reg99[(1'h0):(1'h0)];
            end
          else
            begin
              reg103 <= $unsigned(wire93[(4'h8):(2'h2)]);
              reg104 <= reg99;
            end
        end
      else
        begin
          reg101 <= $signed(wire88[(4'h8):(4'h8)]);
        end
      if ((wire91 & ({{$unsigned(wire96),
              $signed(reg103)}} == (~|$signed($unsigned((8'hb4)))))))
        begin
          reg105 <= {(($unsigned((wire91 ? wire92 : wire89)) ?
                      (~^wire93) : (!(~^reg102))) ?
                  ((8'hb1) ? reg103 : (&wire95)) : {(((7'h44) ?
                              wire97 : reg104) ?
                          $signed(wire91) : wire91[(3'h5):(1'h1)])}),
              wire95};
          reg106 <= ((-(-reg104[(4'hb):(1'h0)])) ?
              wire96 : ((-$unsigned(wire96)) ?
                  $unsigned({(wire97 <= (8'h9d))}) : (reg99 <= (wire93[(4'ha):(4'ha)] ^ $unsigned(wire90)))));
          reg107 <= wire97[(1'h0):(1'h0)];
          if (({reg98[(1'h1):(1'h0)]} ?
              wire93 : (reg99[(4'he):(1'h0)] ?
                  $signed($signed(wire96[(4'hd):(2'h2)])) : wire95)))
            begin
              reg108 <= (wire94[(1'h0):(1'h0)] ?
                  wire95[(1'h0):(1'h0)] : (({{wire92, wire94},
                              $unsigned(wire93)} ?
                          ((reg104 ? reg106 : wire95) ?
                              reg105 : (8'hb3)) : $unsigned((wire93 > reg105))) ?
                      (^($unsigned(reg101) >= (~&reg99))) : reg106));
              reg109 <= reg106;
            end
          else
            begin
              reg108 <= $signed($unsigned($signed(reg100[(1'h0):(1'h0)])));
              reg109 <= reg109[(3'h5):(1'h1)];
            end
          reg110 <= ((reg100[(3'h5):(3'h4)] ?
              $signed(((reg105 ? reg109 : reg100) ?
                  (reg109 ?
                      reg99 : reg99) : $signed(reg107))) : reg104[(3'h7):(3'h7)]) == (reg105 ?
              $signed($signed(wire90[(4'h9):(3'h7)])) : $unsigned({$signed(reg101),
                  $signed(reg106)})));
        end
      else
        begin
          reg105 <= {(^~$signed((|wire89[(3'h5):(2'h2)])))};
          if ($unsigned((&(((^reg99) ?
              reg110 : $unsigned(wire96)) << $unsigned((reg98 == reg105))))))
            begin
              reg106 <= (~(reg104 ? wire88 : reg98));
              reg107 <= $unsigned($signed(($signed((reg106 ? reg100 : wire93)) ?
                  $unsigned(wire96) : $signed((^~(8'ha4))))));
              reg108 <= $signed(wire88[(1'h0):(1'h0)]);
              reg109 <= reg99[(3'h5):(2'h2)];
              reg110 <= (reg105 - reg106[(1'h1):(1'h0)]);
            end
          else
            begin
              reg106 <= wire97[(1'h0):(1'h0)];
              reg107 <= $signed((8'ha9));
              reg108 <= (&(reg98[(3'h7):(1'h1)] > $unsigned($unsigned((wire96 & reg103)))));
              reg109 <= (8'hb6);
              reg110 <= reg106;
            end
          reg111 <= (8'hb4);
          reg112 <= (-{$unsigned(reg111),
              $signed(((reg109 ? reg101 : reg100) ~^ wire94[(1'h0):(1'h0)]))});
        end
    end
  assign wire113 = wire93[(4'hd):(4'hd)];
  assign wire114 = reg108[(3'h4):(1'h1)];
  assign wire115 = reg109;
  assign wire116 = ($signed((({wire95} ?
                           (wire91 + reg101) : (&wire113)) != (^~$unsigned(wire89)))) ?
                       reg112[(2'h3):(2'h2)] : {$unsigned(reg107),
                           ((reg107 >= $unsigned(reg105)) < reg105[(1'h0):(1'h0)])});
  assign wire117 = {$signed(reg98[(3'h7):(3'h7)])};
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h346):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire40,
                 wire39,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg81,
                 reg73,
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
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  assign wire21 = (~&(+(wire17[(3'h6):(2'h3)] < (wire20[(2'h2):(2'h2)] ?
                      $signed(wire19) : wire19[(4'ha):(4'ha)]))));
  assign wire22 = (($signed({$signed(wire17)}) < $unsigned($unsigned($signed(wire16)))) ?
                      ({$signed($signed((8'hb8)))} ?
                          $signed($signed((wire16 <= (8'ha2)))) : wire19[(5'h12):(1'h0)]) : wire18[(2'h2):(1'h0)]);
  assign wire23 = wire18[(1'h0):(1'h0)];
  assign wire24 = wire17;
  always
    @(posedge clk) begin
      reg25 <= ((^wire24[(4'hb):(2'h2)]) ?
          wire20[(1'h1):(1'h0)] : $signed($signed($signed((!wire22)))));
      if ((wire23 == wire21[(1'h0):(1'h0)]))
        begin
          reg26 <= wire21[(4'h8):(3'h7)];
          reg27 <= (((wire21 ?
              ((wire16 > wire17) * reg26) : wire23[(1'h0):(1'h0)]) <<< (((~^reg26) >>> (wire21 ~^ (8'hae))) <<< $signed($signed(wire24)))) - (wire16[(3'h5):(2'h2)] ?
              wire16[(3'h7):(1'h0)] : $signed(($unsigned(wire22) ?
                  (!wire16) : {wire19, wire17}))));
          reg28 <= ($signed((~&wire24)) | (($unsigned($signed(wire19)) <<< $unsigned($unsigned(wire19))) || $signed($unsigned((^(8'hb5))))));
          reg29 <= wire23;
        end
      else
        begin
          if (wire23)
            begin
              reg26 <= $signed(((!((wire24 ?
                      (8'haf) : reg26) + $signed(reg28))) ?
                  wire18 : ($unsigned(((8'ha0) ^ wire18)) && $signed(reg26[(3'h4):(2'h3)]))));
              reg27 <= wire19[(3'h4):(2'h3)];
              reg28 <= {{$unsigned(reg29)}};
              reg29 <= reg28[(2'h2):(2'h2)];
            end
          else
            begin
              reg26 <= ({$signed(reg27[(2'h2):(1'h1)])} <<< ($unsigned((8'haf)) ?
                  wire17 : wire18));
              reg27 <= wire20;
              reg28 <= ($signed(wire23) < ($unsigned($signed($signed(wire20))) ?
                  (~|$signed((8'haa))) : wire19));
            end
          reg30 <= $signed((^~((reg27[(2'h2):(2'h2)] ?
                  $signed(wire23) : (wire21 ? wire20 : wire24)) ?
              $signed({wire18}) : (wire17[(3'h6):(3'h6)] != $unsigned(wire23)))));
          reg31 <= (((($unsigned(reg30) && wire20) ?
                  (8'h9d) : (~&reg30[(4'hd):(3'h6)])) ?
              $unsigned($signed({reg30, reg28})) : wire19) >= reg26);
          reg32 <= reg28[(4'h9):(2'h3)];
          if ($signed((^~(wire21 | (wire21[(3'h7):(3'h7)] ~^ (reg29 << wire20))))))
            begin
              reg33 <= (wire24 - (~wire16));
            end
          else
            begin
              reg33 <= ((~&$signed({wire24,
                  reg27[(2'h2):(1'h0)]})) <<< $unsigned(wire16));
              reg34 <= (|(($unsigned($signed(reg29)) ?
                      $unsigned(wire18) : $unsigned((wire20 <= wire16))) ?
                  $signed(((reg30 <<< (8'hb9)) ?
                      $unsigned(wire16) : {wire23,
                          (8'haa)})) : (wire18[(2'h2):(2'h2)] >>> ($signed(reg27) >> wire20))));
              reg35 <= $unsigned($unsigned((|{$unsigned(reg33),
                  $unsigned(wire21)})));
              reg36 <= reg25[(3'h5):(2'h3)];
            end
        end
      reg37 <= $signed($signed(({(reg33 ? wire20 : reg31),
          {wire16, wire19}} >= ((&reg30) ?
          wire20[(2'h3):(1'h0)] : $unsigned((7'h42))))));
      reg38 <= $signed(wire16);
    end
  assign wire39 = reg35[(2'h3):(2'h2)];
  assign wire40 = $unsigned((((-wire39) ~^ $signed((reg34 + wire17))) ?
                      $signed(reg28) : (8'haa)));
  always
    @(posedge clk) begin
      reg41 <= $signed($signed($unsigned($signed(reg30[(3'h6):(2'h3)]))));
      reg42 <= $unsigned((reg31 <= wire23[(1'h0):(1'h0)]));
      if ($unsigned((+$unsigned($unsigned(reg28)))))
        begin
          reg43 <= (!{($signed($unsigned((8'ha1))) & (8'ha4))});
          reg44 <= $unsigned(reg34[(3'h7):(1'h1)]);
        end
      else
        begin
          reg43 <= (((wire19[(3'h4):(2'h3)] <<< reg28) != $signed({$unsigned(reg36)})) <= $unsigned(reg30));
          reg44 <= $unsigned($unsigned($unsigned(((reg30 || (8'hbd)) ?
              $signed((8'ha1)) : (~reg41)))));
          if ((($signed(wire17[(3'h7):(2'h3)]) != (8'h9f)) ?
              ($signed(wire17[(3'h6):(2'h2)]) ?
                  $signed($signed($signed(reg35))) : (~^($signed(reg36) ?
                      $unsigned(reg28) : $signed(reg41)))) : wire16[(2'h2):(2'h2)]))
            begin
              reg45 <= reg44[(5'h12):(4'h8)];
              reg46 <= ({$signed((wire20 ?
                      wire39[(1'h0):(1'h0)] : (^wire23)))} && wire40[(3'h4):(1'h1)]);
              reg47 <= $signed((~{$signed(((7'h44) ? reg32 : wire23)),
                  (reg25[(3'h4):(2'h2)] ?
                      (wire24 ? reg41 : (8'hb6)) : $signed(reg29))}));
              reg48 <= (|(($signed($signed((8'h9d))) ?
                      ((+wire23) <<< (~^reg46)) : $signed((reg47 < (8'hba)))) ?
                  (8'h9e) : wire22[(4'ha):(3'h6)]));
              reg49 <= (-reg25);
            end
          else
            begin
              reg45 <= (~&$signed((((&wire24) ?
                  (wire39 && (8'ha7)) : (wire39 > reg27)) > $signed((reg46 & reg32)))));
              reg46 <= ($unsigned((^$signed(wire19[(4'hc):(1'h1)]))) ~^ $signed((8'haf)));
              reg47 <= (reg33[(1'h1):(1'h1)] ?
                  $unsigned((8'had)) : (reg28 >= reg30[(4'h8):(4'h8)]));
              reg48 <= $signed({(~&reg30)});
              reg49 <= ((^((reg49[(1'h0):(1'h0)] - reg37) ?
                      (!$unsigned(reg49)) : wire22)) ?
                  reg26 : (wire22[(4'h8):(3'h6)] * ((reg49[(4'hf):(2'h2)] | (^~reg29)) >>> $unsigned(reg38[(4'hb):(1'h0)]))));
            end
          if (($unsigned((|$unsigned((wire23 <<< reg49)))) ? reg38 : wire18))
            begin
              reg50 <= reg29;
              reg51 <= (+{($signed($unsigned(wire18)) >> $unsigned($unsigned(wire24)))});
              reg52 <= reg48[(4'hc):(4'hc)];
            end
          else
            begin
              reg50 <= $unsigned((8'ha9));
              reg51 <= reg49;
            end
          reg53 <= (&(((((8'hb9) ? reg29 : reg34) ?
                  (wire20 * wire16) : (reg43 || (8'ha1))) ?
              (8'hb4) : reg49) & (8'ha0)));
        end
      reg54 <= $signed({reg28[(3'h5):(3'h5)],
          (!($unsigned(reg37) <<< $unsigned(wire23)))});
      if (((8'ha8) >>> {$signed(($unsigned(wire21) ?
              $signed(reg25) : (wire39 ? reg26 : wire40))),
          $signed(wire40[(3'h7):(2'h3)])}))
        begin
          if (reg41[(3'h5):(2'h3)])
            begin
              reg55 <= $unsigned(((reg27 * wire17[(1'h0):(1'h0)]) != (reg49 == $unsigned((wire24 ?
                  wire20 : reg31)))));
              reg56 <= $signed(((wire39 ?
                  $unsigned({reg26, (8'ha8)}) : $unsigned(((8'h9f) ?
                      (8'hb9) : reg33))) != reg47));
            end
          else
            begin
              reg55 <= {(wire24[(5'h10):(2'h3)] & $signed(($unsigned(reg43) ?
                      reg31[(3'h4):(1'h0)] : (reg51 ? reg35 : (8'ha1))))),
                  wire17};
              reg56 <= $signed($signed((8'haa)));
              reg57 <= {({$unsigned(reg51[(5'h11):(5'h11)])} >= reg38),
                  $unsigned($signed(reg34))};
              reg58 <= (-($unsigned({$unsigned(wire23)}) < $signed((8'ha9))));
              reg59 <= $signed(reg55);
            end
          if ((~|(~&(~|reg25))))
            begin
              reg60 <= ((reg32 != {reg56}) ?
                  (^reg56) : $signed($unsigned(((reg34 ? (8'haa) : reg27) ?
                      (reg50 <<< reg57) : (reg26 | wire24)))));
              reg61 <= ($unsigned((((^~reg28) ? $unsigned(reg37) : reg60) ?
                      ((reg55 ? reg59 : wire23) ^~ (reg47 ?
                          wire18 : reg27)) : (reg38[(4'hb):(4'hb)] ?
                          (reg51 * reg44) : reg32[(1'h0):(1'h0)]))) ?
                  {wire18, {($signed(reg58) < (~^reg31))}} : wire17);
              reg62 <= (~&(reg50[(4'hb):(3'h4)] ?
                  $unsigned($signed(reg61)) : (^$unsigned($unsigned(reg41)))));
              reg63 <= (reg51[(1'h0):(1'h0)] > {(&(reg47 ?
                      (reg42 ? wire18 : reg36) : (8'hb5)))});
            end
          else
            begin
              reg60 <= wire23[(2'h2):(1'h1)];
              reg61 <= (((($unsigned(reg54) > {reg44}) ?
                          $unsigned({reg38, wire24}) : {(~^reg56)}) ?
                      ((|(~|reg34)) ^ reg30) : {wire16}) ?
                  {$unsigned((~(^reg61))),
                      {reg44[(4'h9):(3'h5)]}} : ((~|{reg53[(4'h9):(3'h6)],
                          reg36[(3'h5):(3'h4)]}) ?
                      (($signed(reg59) ?
                              (|reg49) : (wire20 ? reg47 : (8'hba))) ?
                          ($unsigned(reg45) ?
                              ((8'ha3) >>> reg44) : {wire23}) : ((reg45 ?
                                  reg50 : reg46) ?
                              (~wire19) : $unsigned((8'hb1)))) : wire16));
            end
          if (((^~$unsigned((~|(~^reg47)))) ?
              (-((-(wire17 ? (8'haa) : wire23)) - {reg33,
                  (~|(8'hb0))})) : (reg41 != (({(8'haa)} > (reg28 ?
                      reg58 : reg46)) ?
                  ($signed(wire21) ?
                      {reg43, reg45} : (reg46 || reg36)) : (^~(^reg42))))))
            begin
              reg64 <= {wire40};
              reg65 <= (($unsigned(reg33[(2'h3):(1'h1)]) != reg33) ?
                  ({$signed(wire22[(4'h9):(2'h3)])} ?
                      ($signed((reg50 ?
                          reg37 : reg38)) <= $unsigned(reg62[(4'hd):(4'h9)])) : reg59[(1'h0):(1'h0)]) : {wire21[(3'h7):(1'h0)],
                      reg54});
              reg66 <= reg32;
              reg67 <= (reg27 <= {$signed($signed($signed(reg55)))});
            end
          else
            begin
              reg64 <= reg47[(2'h3):(1'h0)];
              reg65 <= $signed($signed(reg32));
              reg66 <= $signed(($signed($unsigned(reg29[(4'hc):(4'h9)])) || $signed({$signed(reg35)})));
              reg67 <= ($unsigned($unsigned((!(reg28 ? (8'hbb) : reg55)))) ?
                  reg54[(1'h0):(1'h0)] : ($signed((^$unsigned(wire18))) >>> $unsigned((reg38 ^ (~reg65)))));
              reg68 <= $unsigned((((^~((8'hbf) ?
                  wire23 : reg49)) <= reg27[(2'h2):(1'h0)]) + $signed(((reg25 >> reg45) == (wire17 - (8'ha8))))));
            end
          if ($signed(reg43[(2'h2):(2'h2)]))
            begin
              reg69 <= ((~{$unsigned(reg28[(4'he):(2'h3)]),
                      (reg29 | (|reg58))}) ?
                  (^wire23) : ($signed((reg50 != reg64)) ?
                      ((wire39[(3'h4):(1'h0)] ?
                              $unsigned(reg51) : $unsigned((8'hbc))) ?
                          $signed($unsigned(reg28)) : {{reg46,
                                  reg56}}) : $unsigned($signed($signed(reg65)))));
            end
          else
            begin
              reg69 <= (!(reg58 ?
                  (reg42 ?
                      $signed($unsigned((7'h40))) : {$unsigned(reg63),
                          (reg52 - reg65)}) : (reg69 ?
                      reg63[(2'h2):(1'h1)] : ($unsigned(reg35) ?
                          (~|reg45) : wire40[(4'hd):(4'h8)]))));
              reg70 <= $unsigned((~^$signed(({reg53, wire21} ^~ (reg54 ?
                  reg35 : wire17)))));
              reg71 <= (^($unsigned(wire39) * $signed($unsigned((reg25 != reg36)))));
              reg72 <= (~|$signed(reg57));
            end
          reg73 <= ((($signed((reg60 ? wire39 : (8'hbc))) ?
                  reg57 : {(reg52 ? reg64 : reg53), reg63[(3'h5):(2'h3)]}) ?
              (wire23 ?
                  (~&$unsigned(reg63)) : ($signed(reg54) >> wire19)) : (((reg62 ?
                  wire24 : reg25) ~^ reg31[(4'h8):(1'h1)]) ^ (^~$signed(reg26)))) << reg42);
        end
      else
        begin
          reg55 <= (+((+$signed({reg52})) - wire16));
        end
    end
  assign wire74 = reg50[(1'h1):(1'h0)];
  assign wire75 = wire17;
  assign wire76 = (8'hb3);
  assign wire77 = $unsigned(({$unsigned($signed(wire39))} * $signed((8'ha1))));
  assign wire78 = (reg55[(4'h9):(3'h4)] <= (wire18 ?
                      ($signed($unsigned(reg55)) ?
                          (~&reg65[(1'h0):(1'h0)]) : $signed(reg29)) : wire21[(2'h3):(2'h3)]));
  assign wire79 = (reg68 || ((wire22 ^~ reg27[(2'h2):(1'h1)]) >> $signed($signed((reg55 || wire76)))));
  assign wire80 = reg59;
  always
    @(posedge clk) begin
      reg81 <= $unsigned(reg32[(2'h2):(1'h0)]);
    end
  assign wire82 = reg81;
  assign wire83 = $unsigned(($unsigned($unsigned($unsigned(reg69))) ?
                      wire18[(2'h3):(1'h0)] : $signed($unsigned((reg25 < (8'hba))))));
  assign wire84 = (8'hab);
endmodule

module module177  (y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire181;
  input wire signed [(4'hb):(1'h0)] wire180;
  input wire [(5'h12):(1'h0)] wire179;
  input wire signed [(4'hb):(1'h0)] wire178;
  wire [(2'h2):(1'h0)] wire191;
  wire [(4'hb):(1'h0)] wire190;
  wire signed [(4'ha):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire188;
  wire [(3'h6):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire184;
  wire [(4'hf):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire183,
                 wire182,
                 reg185,
                 (1'h0)};
  assign wire182 = (wire180 == $signed(({wire180[(4'h8):(2'h3)]} ^ (wire180[(2'h2):(1'h1)] >= (~^wire180)))));
  assign wire183 = {(wire181 ? $unsigned(wire181) : wire182[(4'hc):(3'h5)]),
                       (~^wire180)};
  assign wire184 = ((({(wire179 ? wire178 : wire180),
                           $unsigned((7'h44))} > ($signed(wire182) ?
                           (wire179 + wire178) : (^(8'ha3)))) <<< ((wire179[(3'h5):(2'h2)] ?
                               (|wire181) : {wire179}) ?
                           (~&(wire181 ?
                               wire183 : wire183)) : (wire178[(3'h5):(2'h2)] ?
                               (~|(8'hba)) : (wire179 ? wire178 : wire178)))) ?
                       (|$signed(wire178[(3'h4):(2'h2)])) : $unsigned((!{((8'hb2) ?
                               (8'ha5) : wire181)})));
  always
    @(posedge clk) begin
      reg185 <= (wire182 ? wire179 : wire180[(3'h7):(1'h0)]);
    end
  assign wire186 = (-(7'h40));
  assign wire187 = (($unsigned($unsigned((reg185 >= reg185))) << {wire178[(4'h9):(2'h3)],
                       (!(reg185 <= reg185))}) >> $signed((wire182[(1'h1):(1'h0)] + $signed($unsigned(wire184)))));
  assign wire188 = ((wire178 >> $signed((!wire187))) ?
                       (~^(((reg185 ? reg185 : wire181) ?
                           {wire187} : (^wire186)) | ($signed(wire186) * $unsigned(wire178)))) : $signed(reg185[(4'ha):(4'h8)]));
  assign wire189 = wire183;
  assign wire190 = $signed($unsigned(wire181[(4'hc):(1'h1)]));
  assign wire191 = $unsigned({(!(~^wire180)), wire186[(4'hb):(1'h0)]});
endmodule
