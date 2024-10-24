module top
#(parameter param207 = ((-(((&(8'h9c)) | {(8'had)}) ? ((~(8'hbf)) << ((8'ha6) ~^ (8'hb8))) : ((8'haf) ? (^(8'hba)) : (&(8'h9c))))) ? (~|((8'hb2) ? ((+(7'h43)) ? ((8'ha4) ^ (8'h9c)) : (^(7'h43))) : (((8'ha7) >= (8'h9f)) ? ((8'hb3) <<< (8'hb8)) : ((8'hbd) <= (8'h9c))))) : ((8'hbd) + ((((8'hb2) <= (8'hbe)) && ((8'hb4) == (8'hbd))) ? ((^(8'hb1)) ^~ ((8'hb6) - (8'haa))) : ((&(8'hb4)) * (~(7'h44)))))), 
parameter param208 = ((param207 << (!{(!param207)})) ? {param207, param207} : (|((|(param207 ? param207 : (8'hb3))) ? (^~(param207 ? param207 : (7'h43))) : param207))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire206;
  wire [(4'ha):(1'h0)] wire205;
  wire signed [(5'h10):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire203;
  wire [(3'h5):(1'h0)] wire202;
  wire signed [(4'h8):(1'h0)] wire201;
  wire signed [(5'h14):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire197,
                 wire28,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (!($signed($unsigned(wire3)) ^ $signed(wire0[(2'h3):(1'h1)])));
  assign wire6 = $signed($unsigned({wire0[(3'h6):(2'h3)],
                     wire0[(2'h3):(1'h0)]}));
  assign wire7 = $unsigned(($signed(((wire0 & wire3) ?
                         (wire6 ? wire3 : wire4) : $unsigned(wire5))) ?
                     (8'hbf) : $signed(wire4)));
  module8 #() modinst29 (.y(wire28), .wire9(wire5), .clk(clk), .wire10(wire6), .wire11(wire7), .wire12(wire4));
  module30 #() modinst198 (wire197, clk, wire2, wire4, wire0, wire6);
  assign wire199 = (~wire28);
  assign wire200 = (((wire6 ?
                               ((wire4 ~^ (8'hbb)) ?
                                   $unsigned(wire199) : wire4[(5'h10):(2'h3)]) : ({wire1,
                                   wire199} ^ (wire4 > (8'ha9)))) ?
                           (wire5[(3'h7):(3'h7)] & $unsigned({wire4})) : (~&$unsigned(wire28))) ?
                       $signed({$signed(wire28),
                           ($signed(wire197) ?
                               ((7'h42) ?
                                   wire2 : wire7) : (wire5 >>> wire0))}) : {(8'hb9),
                           ((wire199 ?
                               $signed(wire1) : (~&wire4)) <= wire0[(4'he):(1'h1)])});
  assign wire201 = ($signed($signed($unsigned(wire6[(4'hf):(1'h1)]))) != wire0[(4'hb):(3'h7)]);
  assign wire202 = $unsigned((~wire2[(4'h9):(2'h2)]));
  assign wire203 = wire200;
  assign wire204 = (-(($signed(wire197[(1'h1):(1'h1)]) << {wire1[(1'h1):(1'h0)]}) ?
                       wire4[(5'h11):(2'h2)] : {((wire28 ?
                               wire6 : wire4) >> {wire3, wire200})}));
  assign wire205 = (wire2 ?
                       $signed((8'h9d)) : $signed($signed(wire5[(3'h6):(3'h4)])));
  assign wire206 = (~&$unsigned((^(&wire3))));
endmodule

module module30
#(parameter param196 = ((!(^~(^((8'hbf) || (8'hac))))) * ((^(!(~|(8'ha0)))) ~^ ((^~((7'h40) ? (8'ha2) : (8'had))) ^~ {((8'h9f) ? (8'h9c) : (8'h9e))}))))
(y, clk, wire31, wire32, wire33, wire34);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire195;
  wire signed [(2'h3):(1'h0)] wire194;
  wire [(5'h12):(1'h0)] wire193;
  wire [(4'hd):(1'h0)] wire192;
  wire signed [(4'h8):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire159;
  wire [(4'hf):(1'h0)] wire160;
  wire signed [(4'h8):(1'h0)] wire189;
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire157,
                 wire140,
                 wire139,
                 wire111,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire96,
                 wire137,
                 wire159,
                 wire160,
                 wire189,
                 reg36,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 (1'h0)};
  assign wire35 = (wire32[(3'h4):(3'h4)] ?
                      {($unsigned({(8'hb0),
                              (8'ha2)}) <<< wire34)} : (wire31[(3'h5):(3'h5)] <= $signed((wire32[(1'h1):(1'h0)] ?
                          wire33[(4'h8):(2'h3)] : wire31[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg36 <= $unsigned(wire35);
    end
  assign wire37 = wire34[(1'h1):(1'h1)];
  assign wire38 = $unsigned((~(^($signed(reg36) ^~ wire34[(3'h6):(2'h3)]))));
  assign wire39 = (+$unsigned(((wire32 ?
                      $unsigned(wire33) : ((8'haf) ?
                          wire35 : wire33)) <= wire33[(4'h8):(3'h7)])));
  module40 #() modinst97 (.wire41(wire32), .wire44(wire33), .wire42(wire31), .clk(clk), .y(wire96), .wire43(reg36));
  module98 #() modinst112 (.wire100(wire39), .wire101(wire37), .wire99(wire38), .clk(clk), .wire103(wire34), .wire102(wire33), .y(wire111));
  module113 #() modinst138 (.wire117(wire111), .clk(clk), .y(wire137), .wire115(wire33), .wire114(wire39), .wire118(wire32), .wire116(wire34));
  assign wire139 = $signed($unsigned(wire96));
  assign wire140 = $unsigned(wire37[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg141 <= (7'h43);
      reg142 <= (wire32 <= wire37);
      reg143 <= (($unsigned((wire32 - reg142)) ?
              wire140[(2'h2):(2'h2)] : (~(7'h41))) ?
          wire31[(4'h9):(3'h4)] : (wire139[(2'h2):(2'h2)] ?
              (~^wire33[(3'h5):(3'h4)]) : $signed(wire39[(2'h3):(1'h0)])));
      reg144 <= wire39;
    end
  module145 #() modinst158 (.y(wire157), .wire150(wire33), .wire148(wire34), .wire147(wire31), .clk(clk), .wire146(wire137), .wire149(wire39));
  assign wire159 = $unsigned(wire39[(4'h9):(1'h0)]);
  assign wire160 = {reg141};
  module161 #() modinst190 (wire189, clk, wire38, wire159, reg142, wire157);
  assign wire191 = (~|wire33[(4'h9):(4'h8)]);
  assign wire192 = (~^($unsigned($signed((wire35 >> wire35))) < {$unsigned(((7'h44) ?
                           wire189 : wire34)),
                       {$signed(wire189), wire39}}));
  assign wire193 = $unsigned($signed((wire37 ?
                       wire39 : (~|{reg144, wire191}))));
  assign wire194 = $signed(($unsigned($unsigned((wire96 ? wire111 : (8'ha5)))) ?
                       (~&($unsigned((7'h43)) ?
                           (wire160 ?
                               wire39 : reg144) : {(8'hbd)})) : wire192));
  assign wire195 = (~^(~$signed((|(wire139 || (8'hba))))));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire14,
                 wire13,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = wire11;
  assign wire14 = $unsigned(({$signed((wire9 ? wire12 : wire13)),
                          $unsigned($signed((8'hbb)))} ?
                      (wire12 < wire12[(3'h7):(3'h6)]) : $unsigned((^~wire10[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg15 <= wire10[(3'h6):(1'h1)];
      reg16 <= {$signed(($signed((wire10 ? (8'hbb) : reg15)) ?
              ({wire9, wire13} + (wire12 ~^ wire11)) : $unsigned({wire12,
                  reg15}))),
          (+wire13[(3'h5):(1'h0)])};
      if (wire9[(2'h3):(2'h2)])
        begin
          reg17 <= wire14;
          reg18 <= (~&reg16);
          reg19 <= wire14;
          reg20 <= reg17;
          reg21 <= $signed(reg16);
        end
      else
        begin
          reg17 <= (~|(^$signed(wire9)));
          reg18 <= {(~reg19[(2'h2):(1'h0)])};
          reg19 <= (+(+{((!reg18) >> (wire10 ^~ wire10)),
              $unsigned((wire11 ? reg18 : (8'hb9)))}));
        end
    end
  assign wire22 = reg21[(4'h8):(2'h2)];
  assign wire23 = ($unsigned($signed(reg21)) <<< ((8'hae) ?
                      wire9 : wire9[(4'hc):(4'h8)]));
  assign wire24 = $signed((7'h42));
  assign wire25 = (8'hb0);
  assign wire26 = ($unsigned($unsigned({$unsigned(wire23)})) ?
                      $unsigned((~|$unsigned({reg19,
                          reg19}))) : $unsigned((($unsigned(wire12) ?
                              (+wire13) : (wire13 != wire24)) ?
                          wire11[(3'h7):(3'h7)] : $signed({reg19}))));
  assign wire27 = reg20;
endmodule

module module161
#(parameter param188 = (((^{(~(8'hb8))}) << (8'ha0)) ? ((!(~|((8'hb9) & (8'hbd)))) ? ((^((8'haa) ? (8'hbc) : (8'hbb))) && (((8'ha8) ? (8'ha5) : (8'hae)) ? ((8'hb4) != (8'ha0)) : ((8'hb0) & (8'hb5)))) : (|(8'hbf))) : (~|(((+(8'hb6)) ? ((7'h44) << (8'hb7)) : ((8'ha2) == (8'hb1))) - ((^(8'hb0)) ^ ((8'ha0) ? (8'ha3) : (8'hac)))))))
(y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire165;
  input wire signed [(3'h7):(1'h0)] wire164;
  input wire [(2'h3):(1'h0)] wire163;
  input wire signed [(5'h11):(1'h0)] wire162;
  wire signed [(4'ha):(1'h0)] wire187;
  wire [(3'h5):(1'h0)] wire186;
  wire signed [(4'ha):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire183;
  wire [(2'h2):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire [(5'h10):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire signed [(2'h2):(1'h0)] wire166;
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(5'h12):(1'h0)] reg169 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire168,
                 wire167,
                 wire166,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire166 = {$signed(($signed($unsigned(wire162)) ?
                           $signed((wire165 ?
                               wire162 : wire162)) : {$unsigned((8'hba))})),
                       {$signed((+wire164)),
                           (wire163[(2'h2):(1'h1)] ?
                               (((8'hb3) >= wire165) <<< wire163[(2'h2):(1'h1)]) : wire162[(3'h5):(1'h1)])}};
  assign wire167 = $signed(wire166);
  assign wire168 = wire165;
  always
    @(posedge clk) begin
      if (wire167)
        begin
          reg169 <= wire163[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned((wire168[(4'ha):(1'h1)] ?
              ($signed($signed(wire163)) - ((wire166 == wire166) | $unsigned((8'hac)))) : {((wire166 ?
                          wire167 : wire165) ?
                      $unsigned(wire165) : $signed(wire168))})))
            begin
              reg169 <= $unsigned($unsigned($signed((wire162[(4'h8):(2'h3)] > (wire167 ?
                  wire163 : wire165)))));
              reg170 <= ((($signed($unsigned(wire164)) | wire167[(2'h3):(1'h1)]) << $unsigned({$unsigned(wire168)})) ?
                  $signed($signed($unsigned(wire163))) : wire163[(1'h0):(1'h0)]);
              reg171 <= (wire165[(3'h4):(3'h4)] & wire162[(4'he):(4'hd)]);
            end
          else
            begin
              reg169 <= ((wire166 ?
                      wire168[(5'h15):(3'h7)] : (wire163 <<< $unsigned({wire168,
                          reg170}))) ?
                  (wire168[(4'ha):(1'h0)] >>> wire168) : wire166);
              reg170 <= (({$unsigned($signed(reg170))} ?
                  (((wire162 ~^ (8'hbd)) ? (~wire168) : reg170[(4'hd):(4'ha)]) ?
                      ($signed(wire166) ? {wire166} : wire165) : {(wire162 ?
                              (8'ha7) : wire167),
                          $unsigned(wire166)}) : $unsigned(($signed((8'ha3)) ^~ (~&wire167)))) ^ wire166[(2'h2):(2'h2)]);
              reg171 <= $signed(wire167);
              reg172 <= ($unsigned(reg171[(1'h0):(1'h0)]) <= $signed(wire162));
            end
        end
      reg173 <= (wire166[(1'h1):(1'h0)] ?
          ($signed($unsigned(reg170[(3'h5):(2'h3)])) <= {(wire168 << (~^(7'h40)))}) : ($signed($signed({wire167})) ?
              (wire168 & (^~reg170)) : wire167[(2'h2):(2'h2)]));
      reg174 <= (~|wire168);
      reg175 <= reg169;
    end
  assign wire176 = (|$signed($signed({$unsigned((8'haf))})));
  assign wire177 = (reg174[(3'h7):(3'h4)] ?
                       reg171[(1'h0):(1'h0)] : wire167[(1'h1):(1'h1)]);
  assign wire178 = (wire164[(1'h1):(1'h1)] ?
                       ($signed($signed((wire162 ?
                           wire177 : wire176))) <= $unsigned((8'hbf))) : reg171);
  assign wire179 = ($unsigned($unsigned(reg170)) ?
                       reg173 : $signed($unsigned(({reg175, wire176} ?
                           reg173 : (-wire163)))));
  assign wire180 = ({$signed((8'hb6)),
                           (reg175 * (reg172[(3'h4):(1'h1)] ?
                               wire176 : (wire177 ? reg175 : wire176)))} ?
                       $signed((wire176 << (wire177 | (|reg169)))) : $signed($signed(reg175[(2'h2):(1'h0)])));
  assign wire181 = (^reg172[(2'h2):(1'h1)]);
  assign wire182 = (wire178 ? $unsigned(wire177[(3'h5):(3'h5)]) : reg174);
  assign wire183 = $signed({$signed(($signed((8'haf)) ^~ $unsigned(wire167)))});
  assign wire184 = ($unsigned((~&($signed((8'ha1)) + $signed(wire168)))) ?
                       $signed(((~&$signed(reg170)) ?
                           {(&wire178)} : wire183[(5'h13):(5'h11)])) : reg169[(5'h11):(2'h2)]);
  assign wire185 = (~^$unsigned({wire166[(1'h0):(1'h0)]}));
  assign wire186 = $unsigned((wire178 >= $unsigned(wire179[(2'h2):(1'h0)])));
  assign wire187 = reg174;
endmodule

module module145  (y, clk, wire150, wire149, wire148, wire147, wire146);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire150;
  input wire [(4'hd):(1'h0)] wire149;
  input wire signed [(5'h12):(1'h0)] wire148;
  input wire [(4'hc):(1'h0)] wire147;
  input wire [(5'h12):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  assign y = {wire156, wire155, wire154, wire153, wire152, wire151, (1'h0)};
  assign wire151 = ($unsigned(((wire146 >>> $signed(wire147)) ^~ (wire149 + wire148))) && wire146);
  assign wire152 = {{$signed({{(8'hb7)}})}};
  assign wire153 = ($unsigned({$signed($unsigned(wire152)),
                           $unsigned($unsigned(wire151))}) ?
                       wire146[(5'h10):(3'h6)] : (&(((wire152 << wire148) ?
                           {wire146,
                               wire151} : wire149) - ($signed(wire146) & wire148))));
  assign wire154 = wire151[(2'h3):(1'h1)];
  assign wire155 = $unsigned(wire150);
  assign wire156 = {(|$unsigned($unsigned(wire147[(4'h9):(3'h5)]))), wire149};
endmodule

module module113
#(parameter param135 = ((((((8'hb9) ? (8'hb2) : (8'hb6)) && (8'hbc)) < (((8'ha3) & (8'ha5)) ~^ (~&(8'haa)))) != ((((8'h9c) ~^ (8'hb8)) >> (^~(8'hb5))) & (|((7'h42) ? (7'h42) : (8'hb5))))) ? (((((8'hab) ? (8'hbf) : (7'h40)) ? ((7'h43) ~^ (8'hbe)) : (~&(8'haa))) ? (((8'ha8) >>> (7'h44)) ? (^(8'ha5)) : ((8'hbf) || (8'ha6))) : (^(^~(8'hb1)))) ? ((~(&(8'hb9))) < (((8'ha4) ^ (8'had)) ? (~&(8'haf)) : ((8'h9d) >> (7'h44)))) : (8'h9d)) : (((((8'ha2) ? (7'h44) : (7'h40)) ? {(8'ha1), (8'had)} : ((8'hba) - (7'h41))) ^ (((8'hb6) <<< (7'h40)) ^~ ((8'ha4) ? (8'ha9) : (8'hae)))) ? {{((8'hbd) ? (8'hb9) : (8'hb8)), ((8'hbf) ? (8'ha1) : (7'h42))}} : (((8'ha1) <<< ((8'had) ? (8'had) : (8'ha5))) ? ((&(8'ha2)) ? {(8'hb8), (7'h44)} : {(8'hac)}) : {(!(8'hac))}))), 
parameter param136 = (((((param135 ? param135 : param135) != param135) ? (^~param135) : (param135 > (^param135))) ^ {((param135 ? param135 : param135) ^ param135), (&(param135 != param135))}) ? (-({param135, param135} ? ((param135 != param135) ? (~|param135) : (^param135)) : (8'hac))) : ((~|((param135 & param135) < (param135 - param135))) >> param135)))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire118;
  input wire signed [(4'hb):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire signed [(4'hb):(1'h0)] wire115;
  input wire [(4'hc):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(4'hd):(1'h0)] wire119;
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire119 = ((+wire115[(2'h2):(1'h1)]) ?
                       $unsigned($unsigned($signed((~wire115)))) : wire115);
  assign wire120 = $signed(wire114[(4'h8):(4'h8)]);
  assign wire121 = wire120[(2'h3):(2'h3)];
  assign wire122 = (~^$signed((!($unsigned(wire121) ^~ (wire118 ^ wire115)))));
  assign wire123 = wire114[(4'h9):(2'h2)];
  assign wire124 = $unsigned({$unsigned(((wire115 ?
                           wire119 : wire118) > $signed(wire119))),
                       (~^wire117)});
  assign wire125 = wire122[(1'h0):(1'h0)];
  assign wire126 = wire123;
  always
    @(posedge clk) begin
      reg127 <= (~$unsigned({$unsigned({wire118})}));
      reg128 <= $unsigned((wire117[(1'h0):(1'h0)] ?
          (({wire114, wire124} < (wire124 ?
              wire119 : wire121)) | $unsigned((!wire117))) : (wire121 && wire116[(1'h0):(1'h0)])));
      reg129 <= (~&(($signed($unsigned(wire120)) ?
              ({wire120} <= wire116) : wire122) ?
          (wire117 >= ((wire126 ? (8'ha2) : wire114) || (wire114 ?
              wire121 : wire115))) : {wire119[(1'h0):(1'h0)],
              (^wire123[(1'h1):(1'h1)])}));
      reg130 <= wire117[(3'h6):(2'h2)];
      reg131 <= (((~^(~&wire117[(3'h5):(3'h5)])) ?
              $unsigned(wire117[(4'ha):(2'h3)]) : {((wire121 ?
                      wire126 : wire126) ^ wire114[(3'h4):(1'h0)]),
                  (wire122[(5'h10):(1'h0)] << (wire118 | wire114))}) ?
          {((~((8'hab) << wire124)) ?
                  ((~wire119) ^~ (~&reg130)) : $signed((&(8'hab))))} : $unsigned(((~|wire122) <<< wire120[(3'h5):(1'h1)])));
    end
  assign wire132 = wire116[(3'h4):(2'h2)];
  assign wire133 = wire114;
  assign wire134 = $unsigned(wire115);
endmodule

module module98
#(parameter param110 = (((~&((~^(8'haa)) ? {(8'hac)} : ((8'ha8) ^~ (8'hb4)))) - {({(8'ha3), (8'ha4)} * ((7'h43) | (8'hbe))), (8'ha1)}) || (-((((7'h40) ? (8'h9e) : (8'hb4)) && ((8'h9c) * (8'h9c))) != (&{(8'haa)})))))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  input wire signed [(5'h12):(1'h0)] wire101;
  input wire [(3'h6):(1'h0)] wire100;
  input wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  assign y = {wire109, wire108, wire107, wire106, wire105, wire104, (1'h0)};
  assign wire104 = wire102;
  assign wire105 = $signed($unsigned(((^~$signed(wire100)) ?
                       wire101[(2'h2):(1'h0)] : wire101)));
  assign wire106 = ((((~^wire100[(3'h4):(2'h2)]) ^~ wire101[(4'ha):(3'h7)]) - $unsigned(((wire103 + wire99) ?
                       {wire105,
                           wire99} : wire104[(5'h10):(3'h4)]))) + wire101);
  assign wire107 = ((wire105[(4'hb):(4'h8)] ?
                           (~^(wire99[(1'h1):(1'h1)] ?
                               (wire104 && wire102) : (wire101 ?
                                   wire106 : wire104))) : {(wire103[(3'h6):(3'h6)] >>> wire105)}) ?
                       (wire102[(3'h4):(1'h1)] != ($signed((|(8'h9f))) ?
                           $signed($unsigned(wire100)) : ((8'hbb) & ((8'hb3) * wire106)))) : wire100);
  assign wire108 = $signed(({(^~(wire99 ? wire102 : wire106))} & (wire99 ?
                       {(~wire99), {wire104, wire100}} : {wire104})));
  assign wire109 = wire108;
endmodule

module module40
#(parameter param94 = (~(!{{(8'hb0), ((8'hb1) ? (8'had) : (8'ha0))}, (((8'ha8) ? (7'h41) : (8'hb3)) != (^(8'hbb)))})), 
parameter param95 = ((8'hbc) ? ((((param94 ? param94 : param94) <= {param94}) ? ((param94 << param94) ? param94 : {param94}) : param94) | (-((param94 * param94) ? (-param94) : (param94 ? param94 : param94)))) : (-((7'h41) == {(param94 ? param94 : param94)}))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h27f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire [(4'he):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire47,
                 wire46,
                 wire45,
                 reg91,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 (1'h0)};
  assign wire45 = {{(($unsigned(wire42) ? wire42 : (8'hb1)) < {{wire44},
                              (wire43 ? wire44 : wire42)})}};
  assign wire46 = $signed(wire41);
  assign wire47 = $unsigned((~&((wire46 && (wire41 > wire41)) ?
                      wire42 : ({wire42} ^~ {wire45}))));
  always
    @(posedge clk) begin
      reg48 <= (({$unsigned(wire45[(3'h4):(2'h2)]),
          ($signed(wire47) || wire41[(2'h3):(2'h2)])} + wire41[(5'h10):(1'h1)]) >>> wire46);
      if ($signed(wire42[(1'h1):(1'h1)]))
        begin
          reg49 <= (wire41[(5'h11):(3'h7)] ?
              ((wire46 ?
                      (~$unsigned(wire43)) : ((wire44 >>> wire43) || (^~reg48))) ?
                  $signed((|wire42)) : (reg48[(4'hc):(4'h9)] ?
                      reg48[(4'hb):(2'h3)] : $signed((wire41 | wire42)))) : (wire46 > (({(8'haf)} * (wire44 == wire42)) ?
                  (wire47[(2'h3):(2'h2)] ?
                      (^~wire43) : $unsigned(wire44)) : (+wire44[(3'h5):(3'h4)]))));
          reg50 <= {((^((reg48 ?
                  wire46 : wire42) ^ reg49)) >>> {(reg49[(3'h5):(3'h5)] ?
                      wire41[(3'h5):(2'h3)] : $signed((8'ha2)))}),
              (~&{wire47[(1'h1):(1'h0)], (wire44 <= (wire47 == wire43))})};
          reg51 <= ((~^(8'hab)) ~^ $unsigned(($unsigned($signed(wire44)) ?
              wire45 : (&(reg50 ? reg49 : wire43)))));
          reg52 <= $unsigned((~wire46[(4'h9):(2'h2)]));
          reg53 <= reg49;
        end
      else
        begin
          reg49 <= wire46[(4'he):(2'h2)];
          reg50 <= wire45[(4'hd):(4'hb)];
          reg51 <= {(!(((wire43 ? wire44 : wire41) | $unsigned(reg48)) ?
                  wire43[(5'h10):(4'hf)] : $unsigned((8'hb2)))),
              (((~&(^~wire46)) != $signed({reg52})) < wire43[(5'h10):(3'h4)])};
        end
      if ($signed({$unsigned($signed($unsigned(reg51))), reg48}))
        begin
          reg54 <= $signed(reg48);
          if ($signed($signed(((8'ha7) < wire41))))
            begin
              reg55 <= reg54;
              reg56 <= reg55;
            end
          else
            begin
              reg55 <= (wire44 ?
                  $signed((~^$unsigned($signed(reg51)))) : $signed($signed((+(reg55 ^~ (8'hb7))))));
              reg56 <= $unsigned(((reg51[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(wire45)) : ($signed(reg50) == (8'ha4))) || reg54[(2'h3):(1'h1)]));
              reg57 <= (-reg53[(2'h3):(1'h0)]);
              reg58 <= wire43[(1'h1):(1'h0)];
              reg59 <= ($signed($signed((8'ha5))) ~^ $signed($unsigned((reg51[(4'hc):(3'h7)] - (|(8'hbf))))));
            end
          if ($signed(reg58[(1'h1):(1'h0)]))
            begin
              reg60 <= reg57;
            end
          else
            begin
              reg60 <= {((({reg60,
                          reg49} ~^ (wire46 > (8'hb4))) < ($signed((8'hbe)) - (!reg54))) ?
                      (|($signed(reg60) ?
                          wire45[(4'ha):(4'h9)] : $unsigned(wire44))) : $unsigned(reg53[(1'h1):(1'h1)]))};
              reg61 <= ((reg56[(3'h6):(3'h4)] >> $signed($unsigned(wire45[(4'hd):(1'h0)]))) ?
                  (reg50 > $unsigned($unsigned($signed(reg58)))) : $signed((~^$unsigned((reg57 ?
                      reg56 : wire46)))));
              reg62 <= {((reg55 != wire44) ?
                      (~&wire45[(4'hd):(3'h7)]) : (8'ha4)),
                  {$unsigned((8'ha4)), $unsigned(wire43)}};
            end
        end
      else
        begin
          reg54 <= reg51;
          reg55 <= ((^$signed($signed($unsigned(wire43)))) ? reg52 : wire44);
          if ({reg48, {$unsigned(wire44), $unsigned((&$signed(wire41)))}})
            begin
              reg56 <= ($signed((((^~reg53) <= $unsigned(reg55)) ?
                      (~&reg59[(3'h5):(1'h1)]) : $signed(wire47))) ?
                  (-((+{reg49}) >> $unsigned((reg62 ?
                      reg51 : wire47)))) : ((reg60 ?
                      reg48[(3'h4):(1'h0)] : $signed(reg56[(1'h0):(1'h0)])) >> $signed(((reg61 ?
                          reg58 : reg62) ?
                      (&(8'ha8)) : ((8'haa) >= reg59)))));
              reg57 <= reg59[(1'h0):(1'h0)];
              reg58 <= {($unsigned(((~|(8'ha6)) ?
                          ((8'ha8) < wire44) : ((8'haf) == wire43))) ?
                      wire47[(3'h4):(2'h2)] : (reg50[(1'h0):(1'h0)] - (8'h9f))),
                  reg55};
              reg59 <= reg60[(4'h9):(1'h0)];
              reg60 <= ((|reg53[(2'h2):(1'h1)]) ?
                  $signed($unsigned(reg62)) : {(~reg57[(4'h9):(3'h6)]),
                      ((8'ha6) >> reg54[(4'hb):(3'h5)])});
            end
          else
            begin
              reg56 <= $signed(wire45[(5'h11):(3'h5)]);
              reg57 <= reg62;
              reg58 <= (~|({(reg54[(2'h2):(2'h2)] * reg59[(1'h0):(1'h0)])} * (~|((~|reg60) ?
                  reg51[(2'h2):(1'h0)] : $signed((8'haf))))));
              reg59 <= wire47;
            end
          reg61 <= $signed(wire45);
          reg62 <= (((^reg48[(3'h6):(2'h3)]) < ((|$unsigned(reg60)) ?
              $signed($signed((8'hb2))) : reg51)) ~^ reg54);
        end
      if ((^~wire44[(4'hb):(4'hb)]))
        begin
          if (wire47)
            begin
              reg63 <= wire41;
              reg64 <= reg54;
              reg65 <= ($unsigned(((!$unsigned(reg64)) << (reg53[(2'h2):(2'h2)] ?
                      (reg50 ? wire43 : wire43) : reg53[(2'h2):(1'h0)]))) ?
                  $signed(wire45[(5'h11):(2'h2)]) : $unsigned({(8'hb3),
                      $unsigned((wire43 >>> reg53))}));
              reg66 <= $signed(({$signed($signed(wire44))} ?
                  reg54[(4'hc):(4'ha)] : wire41));
              reg67 <= $signed((~$signed((reg52[(3'h5):(3'h4)] || $unsigned(reg66)))));
            end
          else
            begin
              reg63 <= {$signed($unsigned((~$signed(reg53))))};
            end
          reg68 <= (($signed($unsigned($signed(reg67))) - ({reg63} ^ $signed(reg49[(4'ha):(2'h2)]))) ?
              $unsigned((|reg57[(4'hc):(4'h8)])) : (((!reg61[(2'h3):(1'h0)]) >= (~|{reg55})) ?
                  wire43[(3'h5):(3'h4)] : (8'hb8)));
          reg69 <= reg61[(3'h7):(2'h2)];
          reg70 <= (8'haf);
          if (($unsigned(((~^((8'h9c) * reg68)) ?
              $unsigned($signed(reg70)) : (reg64 ?
                  $signed((8'ha3)) : (reg56 - (8'hae))))) < $signed((^~(8'ha1)))))
            begin
              reg71 <= ($signed(reg53[(1'h1):(1'h1)]) == ((reg64[(2'h2):(2'h2)] ?
                      ($signed(reg66) ?
                          {reg60, reg65} : wire41) : reg62[(4'hc):(4'h8)]) ?
                  $signed(($unsigned(reg68) >>> $signed((7'h43)))) : ((~^$signed((8'hbc))) ?
                      $unsigned((reg49 ?
                          reg53 : (8'ha8))) : ($signed(wire44) >> $signed(wire42)))));
              reg72 <= (&((!(~^$unsigned(reg64))) == ({{reg63}} ?
                  {reg49} : (reg64[(4'h8):(3'h5)] || (^~(8'hbd))))));
              reg73 <= $signed($unsigned((8'hb5)));
            end
          else
            begin
              reg71 <= $unsigned($unsigned((reg48 ?
                  (~(wire42 ? reg68 : (8'hbe))) : reg54[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          if ($signed($unsigned((reg70[(4'h8):(2'h2)] ?
              ((wire45 ^ wire42) > $unsigned(reg49)) : reg64[(4'hf):(3'h4)]))))
            begin
              reg63 <= ((reg53[(1'h1):(1'h0)] * (-((reg62 | reg52) && {reg58}))) >>> (reg49[(3'h4):(2'h2)] ^ reg59[(1'h0):(1'h0)]));
              reg64 <= $unsigned(($signed($signed((~(8'ha9)))) << (8'ha3)));
              reg65 <= $unsigned((reg59[(2'h2):(1'h0)] == reg64[(4'h9):(3'h4)]));
            end
          else
            begin
              reg63 <= (reg55 ^ ((((reg53 ? reg65 : reg54) ?
                  reg60 : (~|reg54)) && $unsigned(reg49[(2'h3):(2'h2)])) && ($unsigned($signed(wire46)) ?
                  reg70[(2'h2):(2'h2)] : $unsigned($signed(reg54)))));
              reg64 <= ($signed(reg63[(2'h3):(2'h2)]) >>> (~&(&($signed(reg71) ?
                  wire44 : $unsigned(wire41)))));
              reg65 <= {reg65[(2'h3):(2'h3)],
                  ((|$signed((~^reg69))) ?
                      reg59 : $unsigned($signed($signed(reg68))))};
            end
          reg66 <= reg59[(3'h5):(2'h2)];
          if (($unsigned((-reg52)) ?
              reg56 : $unsigned({($unsigned(reg59) >= ((8'had) ?
                      reg50 : (8'hae)))})))
            begin
              reg67 <= $unsigned(reg69);
              reg68 <= ($signed(reg50[(1'h0):(1'h0)]) == wire41[(4'ha):(3'h7)]);
              reg69 <= (reg50 ?
                  reg51 : (^~($signed($unsigned((8'hb5))) ?
                      reg62 : (^~(~^reg52)))));
            end
          else
            begin
              reg67 <= reg70;
            end
        end
      reg74 <= $unsigned($signed($unsigned(((wire45 & (8'hb4)) ?
          (!reg70) : $unsigned((8'haf))))));
    end
  assign wire75 = (((reg55[(1'h0):(1'h0)] ?
                          reg70 : ($unsigned(reg67) ?
                              {reg57, reg54} : (~^(8'hb2)))) ?
                      $unsigned($signed({reg62})) : reg71) >>> (reg71 ?
                      ({$signed(wire44)} ?
                          reg64 : {(reg54 ? wire45 : reg48),
                              reg60[(2'h2):(1'h0)]}) : ({$unsigned(wire46),
                              reg49[(2'h2):(2'h2)]} ?
                          {$signed(reg51)} : $signed({(8'hb2)}))));
  assign wire76 = reg69[(1'h0):(1'h0)];
  assign wire77 = (~&{{(&reg49[(4'h9):(1'h0)]), $signed($signed(reg49))},
                      reg60[(2'h3):(2'h2)]});
  assign wire78 = $signed((-{((reg74 ? reg68 : (8'hb3)) ?
                          reg67 : $signed((7'h41)))}));
  assign wire79 = $unsigned(reg74[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      reg80 <= {$unsigned(($unsigned(((8'hb1) || reg69)) ^ ($signed(reg55) ^~ (reg52 ?
              reg49 : wire79)))),
          $unsigned(($signed((reg56 ? reg69 : (8'hab))) ? reg71 : (~&reg53)))};
      reg81 <= ((reg70[(1'h0):(1'h0)] ^ $signed(reg61[(3'h6):(1'h0)])) | {reg49[(4'he):(4'h9)],
          {$signed((reg49 ? reg59 : reg80)), reg57[(4'hc):(2'h2)]}});
      reg82 <= $signed((!({(|reg74)} ?
          wire44[(3'h5):(3'h4)] : {reg60[(4'ha):(4'h8)],
              wire45[(4'h8):(2'h2)]})));
      reg83 <= reg68[(3'h6):(3'h5)];
      reg84 <= $signed((wire76 - $unsigned($signed(reg81))));
    end
  assign wire85 = (~^$signed(wire75[(3'h6):(1'h0)]));
  assign wire86 = (~|((reg49 <= reg54) ?
                      wire46 : (wire78 ?
                          $unsigned(((7'h44) && reg66)) : {(reg84 ?
                                  reg59 : reg71)})));
  assign wire87 = $signed({(!{$signed((8'hbc))})});
  assign wire88 = {{$signed((reg52 >>> $unsigned(reg70)))}};
  assign wire89 = (8'hb8);
  assign wire90 = (($unsigned((~^(wire88 ?
                      reg64 : reg55))) | {reg48[(4'hc):(3'h5)],
                      wire89[(2'h2):(1'h0)]}) * (~|{(8'haf)}));
  always
    @(posedge clk) begin
      reg91 <= $signed({(reg80[(4'hb):(2'h2)] * reg70[(5'h10):(5'h10)]),
          {reg70[(4'h8):(4'h8)], {reg56[(4'ha):(3'h6)]}}});
    end
  assign wire92 = $unsigned(reg59[(1'h0):(1'h0)]);
  assign wire93 = wire43[(4'h9):(2'h3)];
endmodule
