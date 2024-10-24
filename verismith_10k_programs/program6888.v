module top
#(parameter param196 = (~^((|{((8'ha7) ? (7'h41) : (8'ha3)), ((8'hab) ? (8'ha4) : (8'hb1))}) ? ((8'ha7) ^ (((7'h41) ~^ (8'hbb)) ? ((8'h9c) >>> (8'ha6)) : ((8'ha5) ? (7'h42) : (8'ha8)))) : (((~|(8'hb2)) ? (&(8'h9c)) : ((8'h9d) ? (8'ha4) : (7'h41))) > {((8'hae) > (8'ha3))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire165;
  wire [(5'h14):(1'h0)] wire166;
  reg signed [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(4'hc):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg signed [(4'he):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  assign y = {wire185,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire159,
                 wire60,
                 wire59,
                 wire40,
                 wire57,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
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
                 (1'h0)};
  module4 #() modinst41 (wire40, clk, wire1, wire0, wire2, wire3);
  module42 #() modinst58 (wire57, clk, wire1, wire40, wire3, wire0, wire2);
  assign wire59 = wire57[(2'h2):(1'h1)];
  assign wire60 = ($signed(wire40) << (((~^(wire3 || (8'hb6))) ?
                          ((wire1 ? wire3 : wire57) ?
                              {wire2} : (~(8'hb8))) : wire3) ?
                      $signed(({wire3} == $signed(wire57))) : wire2[(4'hb):(3'h4)]));
  module61 #() modinst160 (.wire64(wire40), .wire63(wire0), .wire62(wire2), .clk(clk), .y(wire159), .wire65(wire3), .wire66(wire59));
  assign wire161 = wire40;
  assign wire162 = ($signed(wire0) ?
                       $unsigned($signed(wire161[(2'h2):(1'h1)])) : (($signed((^wire2)) ^~ (wire1[(3'h7):(1'h0)] + (~^wire2))) ?
                           (((wire0 ? wire0 : wire159) ?
                                   (wire3 - (8'h9e)) : (!wire60)) ?
                               wire161 : $signed(wire0[(1'h0):(1'h0)])) : ((!$signed(wire1)) ?
                               wire59 : $signed({wire3, wire3}))));
  assign wire163 = (~$unsigned(wire162[(3'h7):(3'h5)]));
  assign wire164 = ($signed(wire0) > ((~^wire59[(4'ha):(3'h5)]) ?
                       ((-(^~wire162)) && {((8'ha7) ?
                               (8'h9f) : wire57)}) : ($signed(wire161) <<< wire59)));
  assign wire165 = $unsigned($unsigned($unsigned($unsigned($unsigned(wire60)))));
  module61 #() modinst167 (wire166, clk, wire2, wire60, wire0, wire40, wire164);
  assign wire168 = (!$signed(wire166[(5'h14):(1'h0)]));
  assign wire169 = (^wire161);
  assign wire170 = (~^wire159);
  assign wire171 = $signed({$unsigned($signed((8'ha9))),
                       $signed(wire165[(2'h3):(1'h1)])});
  assign wire172 = wire165[(1'h0):(1'h0)];
  assign wire173 = $signed(((((wire162 ? wire59 : wire169) ?
                               (~&(8'hb4)) : (^~wire165)) ?
                           wire168 : wire1[(4'hb):(4'h8)]) ?
                       wire40 : wire168[(2'h3):(1'h1)]));
  assign wire174 = (wire159 <= wire162);
  always
    @(posedge clk) begin
      reg175 <= (wire40[(1'h1):(1'h0)] ?
          (-$unsigned(((wire57 > wire0) >> $signed(wire174)))) : {$unsigned(wire170),
              {((wire1 << wire60) ? (!wire166) : wire165[(1'h1):(1'h1)])}});
      if ((wire171[(3'h4):(2'h3)] + (($unsigned((wire166 ?
          wire171 : wire60)) >= ((wire171 * (8'hbc)) && {(8'ha0)})) > wire166)))
        begin
          reg176 <= wire164;
          reg177 <= wire1;
          if (wire172[(2'h3):(2'h3)])
            begin
              reg178 <= wire159[(1'h1):(1'h0)];
              reg179 <= $unsigned(((((-wire57) ?
                  wire161[(1'h1):(1'h0)] : $signed(wire60)) == $signed((wire2 ?
                  wire1 : wire173))) * (((wire3 ? wire173 : wire1) ?
                      (~reg176) : wire163) ?
                  $signed((wire1 ?
                      wire2 : wire3)) : $unsigned((wire159 ^~ (8'hbb))))));
              reg180 <= (8'hb6);
              reg181 <= (-($signed((wire173 ?
                      (wire174 + wire159) : (~^(8'hb3)))) ?
                  wire2[(3'h4):(3'h4)] : (~|wire0)));
            end
          else
            begin
              reg178 <= (8'ha5);
              reg179 <= (wire60 ?
                  $signed((+$unsigned($unsigned(wire171)))) : wire161);
              reg180 <= reg178;
              reg181 <= wire171[(2'h2):(1'h0)];
              reg182 <= wire172[(3'h6):(3'h4)];
            end
        end
      else
        begin
          reg176 <= $signed(wire161[(2'h3):(1'h0)]);
        end
      reg183 <= wire174;
      reg184 <= $signed($unsigned(wire171[(3'h5):(2'h3)]));
    end
  assign wire185 = (!(($unsigned({wire164}) ~^ ($signed((8'h9d)) ^~ wire1[(4'hf):(4'ha)])) ?
                       $unsigned((~(reg177 ?
                           wire166 : wire169))) : ($unsigned({wire57}) ?
                           $unsigned(((8'hb1) - (8'haf))) : (~^$signed(wire159)))));
  always
    @(posedge clk) begin
      reg186 <= wire166[(4'hd):(1'h1)];
      reg187 <= $signed(((reg180[(3'h7):(3'h5)] >> wire162) ?
          ($unsigned(wire60[(4'h9):(3'h7)]) ?
              (|wire164[(4'hc):(2'h3)]) : reg182) : (((wire162 ?
                  wire2 : wire173) <<< ((8'ha7) ? reg182 : wire59)) ?
              ({wire166} - wire59) : $unsigned($signed(wire2)))));
      reg188 <= ((^~($unsigned((!wire60)) ?
              $unsigned({reg180, (8'hb3)}) : $unsigned(wire3))) ?
          ((({(8'haa)} ? wire40 : (reg175 ? wire165 : (8'hbc))) > (((8'hb3) ?
              (8'hbf) : reg180) ^~ ((8'h9d) || reg182))) || $signed($signed($signed(wire60)))) : $signed((((reg176 > wire173) ?
                  {wire166, wire164} : ((7'h40) ? wire59 : (8'h9e))) ?
              $signed((reg178 ? reg181 : reg180)) : reg178[(2'h2):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg189 <= (&$signed(wire1[(3'h6):(3'h5)]));
      reg190 <= reg184;
      reg191 <= (((({reg186} ~^ reg180) ?
                  $unsigned(wire172) : $signed(((8'ha0) <= wire169))) ?
              $unsigned((reg175[(1'h0):(1'h0)] ?
                  $unsigned(reg186) : (^~reg188))) : $signed($unsigned(wire169[(1'h1):(1'h0)]))) ?
          ($signed({reg186}) ?
              reg189[(4'he):(4'ha)] : {(8'hba),
                  (~(wire174 ?
                      (8'hbb) : reg190))}) : (wire2 || ((|wire172[(3'h6):(1'h0)]) || ($signed(wire161) != (wire2 - reg189)))));
      reg192 <= ($unsigned($unsigned((~|(-(8'hab))))) << (reg188 ?
          wire159[(4'hc):(2'h2)] : $unsigned({(wire165 >> reg183), wire174})));
      if (($signed(wire163[(3'h6):(2'h3)]) | (~&wire165[(1'h1):(1'h0)])))
        begin
          reg193 <= $unsigned({((~&$signed(reg178)) ?
                  reg190[(4'h8):(3'h7)] : ($unsigned(reg180) & $signed(reg183)))});
          reg194 <= (^(^(~$unsigned($unsigned(reg187)))));
        end
      else
        begin
          reg193 <= (reg186[(2'h3):(1'h1)] ?
              (&((!{wire173,
                  reg186}) & $signed((!reg183)))) : $signed((~reg180)));
          reg194 <= (~|$unsigned((8'hb3)));
          reg195 <= $signed(($signed({$unsigned((8'hb3)),
              (~^wire165)}) & $signed($unsigned(((8'hb5) ? wire3 : wire59)))));
        end
    end
endmodule

module module61
#(parameter param157 = {(8'h9e), (&(((8'hb6) ? ((8'ha9) ? (8'h9c) : (8'h9d)) : ((8'ha5) ? (8'hb6) : (8'hac))) ^ ((^~(8'hae)) ? (|(8'h9f)) : {(8'hbf), (8'hbc)})))}, 
parameter param158 = (^~{{((param157 >= param157) ? (!param157) : (param157 <= param157)), (|(param157 < param157))}}))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire66;
  input wire [(4'hb):(1'h0)] wire65;
  input wire [(5'h10):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire [(4'hf):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire94;
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire143,
                 wire142,
                 wire140,
                 wire139,
                 wire137,
                 wire121,
                 wire120,
                 wire118,
                 wire116,
                 wire97,
                 wire96,
                 wire94,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg141,
                 reg119,
                 (1'h0)};
  module67 #() modinst95 (.clk(clk), .wire68(wire62), .wire70(wire64), .y(wire94), .wire69(wire63), .wire71(wire66));
  assign wire96 = (({{$unsigned(wire64), wire94[(4'ha):(1'h0)]}} <= (wire94 ?
                      (!$signed(wire66)) : ((wire64 ?
                          wire66 : wire94) >> (wire66 ?
                          wire63 : wire66)))) | wire66);
  assign wire97 = (wire66 ~^ $unsigned({wire64[(3'h6):(3'h6)]}));
  module98 #() modinst117 (wire116, clk, wire65, wire63, wire97, wire66);
  assign wire118 = wire94[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg119 <= $unsigned(wire65);
    end
  assign wire120 = $unsigned(wire116);
  assign wire121 = ({((((8'hbe) ? reg119 : (8'hbe)) && wire97[(4'hb):(3'h4)]) ?
                           ((+wire94) ?
                               $unsigned(wire96) : $signed(wire118)) : ($signed(wire120) ?
                               {wire116,
                                   wire97} : wire63))} ~^ $unsigned($unsigned({wire63,
                       wire116})));
  module122 #() modinst138 (.wire126(wire116), .clk(clk), .y(wire137), .wire127(wire64), .wire123(wire63), .wire124(reg119), .wire125(wire96));
  assign wire139 = wire121;
  assign wire140 = (+({$signed(wire120)} ?
                       $unsigned(wire64[(4'h8):(2'h2)]) : ($unsigned($signed(wire62)) ?
                           $unsigned({wire121}) : $signed(reg119[(3'h5):(3'h4)]))));
  always
    @(posedge clk) begin
      reg141 <= {(wire116 > (reg119 * ($signed(wire97) ^~ {wire121,
              (8'hb2)})))};
    end
  assign wire142 = wire116;
  assign wire143 = wire94;
  always
    @(posedge clk) begin
      reg144 <= $signed(wire116[(3'h7):(2'h3)]);
      if (wire65[(3'h6):(1'h1)])
        begin
          reg145 <= wire94[(2'h2):(1'h1)];
          reg146 <= $signed((wire139[(2'h3):(1'h1)] ?
              (wire66 ? $signed((8'hbd)) : (8'h9f)) : ($unsigned((8'hbb)) ?
                  ({wire116} ?
                      $unsigned(wire137) : {reg144,
                          wire96}) : $signed(((8'ha7) <= (8'h9d))))));
          if ((wire65[(3'h5):(3'h4)] || wire139[(3'h6):(3'h6)]))
            begin
              reg147 <= (~wire97[(2'h3):(2'h2)]);
              reg148 <= wire143;
              reg149 <= (^(((wire97 != reg144) ^~ ({reg148} | (~^wire66))) ?
                  $signed(({wire94, (8'ha6)} + (wire63 ?
                      wire66 : wire120))) : wire62));
            end
          else
            begin
              reg147 <= (((^~wire64) & (~&((+wire64) >> (~|wire121)))) > wire62);
              reg148 <= wire66;
            end
        end
      else
        begin
          reg145 <= ((wire121 ? wire120[(4'h8):(3'h5)] : (reg141 ^ reg146)) ?
              (8'haf) : (^(&(&wire139))));
          reg146 <= wire120[(4'h8):(3'h6)];
          reg147 <= reg145[(2'h2):(2'h2)];
          reg148 <= $unsigned({wire97, $unsigned(wire121)});
          reg149 <= wire62[(4'hd):(3'h4)];
        end
      reg150 <= $signed(($unsigned((wire118 * (wire140 ? reg146 : wire121))) ?
          $signed((8'ha2)) : (!($unsigned(wire64) && (|reg145)))));
      reg151 <= reg150[(1'h1):(1'h1)];
    end
  assign wire152 = ($signed($unsigned(wire121[(1'h1):(1'h0)])) ?
                       reg119[(3'h6):(1'h0)] : (~|(|(~|$signed((8'had))))));
  assign wire153 = $signed(wire65[(3'h6):(3'h4)]);
  assign wire154 = $unsigned(wire66[(4'h9):(2'h3)]);
  assign wire155 = ((~($signed({reg149,
                       (8'haa)}) - wire140)) >> wire154[(3'h4):(2'h2)]);
  assign wire156 = $unsigned($signed({(~^{wire140, wire153})}));
endmodule

module module42
#(parameter param55 = ({(!((~|(8'hbd)) | ((8'had) ? (8'ha2) : (8'h9f)))), {(|(&(8'hab)))}} * {((+((8'hbf) ? (8'hb4) : (8'hb5))) ? (((8'hb4) ? (8'haa) : (8'hb7)) < ((8'hb6) ~^ (8'hac))) : (+{(8'h9f)})), (|(~^(~^(8'hb1))))}), 
parameter param56 = ((((param55 ^ (+param55)) ? (~&(~&param55)) : ((param55 > param55) ? (|param55) : {param55, param55})) ? ({param55} ? (param55 <= (param55 ? param55 : param55)) : ((param55 >> param55) ? (param55 ? param55 : param55) : (^param55))) : (!{(param55 < (8'h9c))})) ? (((^(param55 == param55)) - (!(param55 && (7'h43)))) >>> ((+(param55 | param55)) ? {param55} : (^(&param55)))) : param55))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(4'ha):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire49, wire48, (1'h0)};
  assign wire48 = (~|$signed(wire46[(3'h4):(3'h4)]));
  assign wire49 = {{($unsigned((^~(8'hb4))) ?
                              (~^wire47) : (wire45 != wire47[(3'h6):(3'h4)]))},
                      ((~&wire46) * (~(^~wire47[(4'h9):(2'h2)])))};
  assign wire50 = ((8'ha7) != wire47[(3'h4):(3'h4)]);
  assign wire51 = {wire48, (!{{(wire44 ? wire46 : wire47), (^wire43)}})};
  assign wire52 = $unsigned($signed(wire48[(3'h4):(1'h0)]));
  assign wire53 = ((($unsigned((8'h9f)) <<< $unsigned((wire47 ?
                          wire52 : wire50))) << $unsigned((+{wire48}))) ?
                      (($unsigned((wire48 < wire47)) ?
                              ($signed(wire51) ?
                                  {wire43,
                                      wire50} : $unsigned(wire52)) : $signed(wire52)) ?
                          $signed(wire43) : wire43[(3'h5):(3'h4)]) : (wire46[(3'h5):(2'h2)] ?
                          ((+wire51[(3'h4):(3'h4)]) ?
                              $signed(((8'hac) >> wire48)) : (~|(wire43 ~^ wire43))) : ($unsigned($unsigned(wire50)) + $unsigned((wire48 ?
                              wire47 : wire43)))));
  assign wire54 = wire49[(4'he):(3'h6)];
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire9;
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire9,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire9 = wire8[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg10 <= (~&wire6[(4'hb):(4'h9)]);
      reg11 <= $unsigned($signed((+$unsigned($signed((8'ha7))))));
    end
  assign wire12 = $unsigned(wire9);
  assign wire13 = wire12[(3'h6):(1'h1)];
  assign wire14 = (wire13[(1'h1):(1'h0)] ~^ (({(wire8 <= reg10)} >> ((^wire6) | (~^wire9))) ?
                      wire6[(5'h11):(3'h6)] : {$signed(wire8[(2'h3):(1'h1)]),
                          ($signed(wire5) ^~ $unsigned(wire7))}));
  assign wire15 = ((wire6[(5'h10):(3'h5)] > {(+wire9[(1'h1):(1'h0)])}) ?
                      $unsigned(wire5) : reg11);
  assign wire16 = ($signed({wire12[(3'h7):(3'h4)]}) ?
                      wire14[(3'h5):(2'h2)] : (wire5 <= (((reg10 << wire14) ?
                          $signed((8'hba)) : $unsigned((8'ha3))) << $signed(reg10[(4'ha):(4'ha)]))));
  assign wire17 = ((((reg11[(3'h6):(2'h3)] ?
                              $unsigned(wire5) : $signed(wire8)) ?
                          reg10[(4'h9):(1'h1)] : (&((8'hb6) ?
                              wire15 : reg10))) >= $signed((wire16 << (wire16 ?
                          wire6 : reg10)))) ?
                      wire12 : reg10);
  always
    @(posedge clk) begin
      reg18 <= ((((!wire14[(2'h2):(2'h2)]) ?
              ((~^wire14) << wire7) : wire17[(3'h5):(3'h4)]) ^~ (wire8 ?
              (wire15[(1'h0):(1'h0)] ?
                  wire16[(4'hf):(4'h9)] : $signed(wire5)) : wire12)) ?
          {{wire16[(4'hb):(2'h3)],
                  wire9}} : $signed((-$unsigned(wire16[(3'h7):(2'h3)]))));
      if ($unsigned((wire9 && reg10[(4'he):(4'hd)])))
        begin
          reg19 <= ($signed($signed($unsigned((wire9 ?
              reg10 : wire6)))) << wire14);
          reg20 <= wire5[(4'ha):(3'h4)];
          if ($signed((((reg20[(5'h11):(3'h4)] ? {reg18, reg20} : reg18) ?
                  (^~$signed(reg10)) : (&reg20)) ?
              $unsigned((&wire8)) : (^~((wire6 ^ wire7) ?
                  $unsigned(wire17) : wire16)))))
            begin
              reg21 <= wire6[(2'h2):(1'h0)];
              reg22 <= ({(~&(|wire17[(1'h0):(1'h0)]))} & (reg21 ?
                  reg11 : $signed((((7'h41) | reg21) < (reg10 ?
                      (8'hb1) : reg18)))));
            end
          else
            begin
              reg21 <= reg19;
              reg22 <= ($signed({(&reg21[(4'hb):(3'h5)])}) * (wire12 ?
                  wire17[(1'h1):(1'h0)] : ($signed({wire15,
                      wire13}) | (!(reg10 ? (8'ha2) : wire6)))));
            end
          if ((~^{{$unsigned(wire8), (reg21 > {reg10})},
              (((~(8'h9d)) ?
                  wire7 : $signed(wire13)) >>> $unsigned($signed((8'ha2))))}))
            begin
              reg23 <= reg18;
              reg24 <= $unsigned($unsigned($unsigned(((wire9 ?
                  wire16 : reg19) >>> (reg21 <= wire6)))));
              reg25 <= (~^({reg18[(3'h4):(3'h4)],
                      (reg18[(1'h0):(1'h0)] ?
                          $signed(wire13) : $unsigned((8'hae)))} ?
                  (&(wire5 ?
                      (reg11 ?
                          reg20 : wire9) : wire15[(3'h6):(3'h4)])) : reg11[(2'h2):(1'h0)]));
            end
          else
            begin
              reg23 <= ($signed((^~(8'had))) ?
                  wire5[(1'h0):(1'h0)] : (((~|reg22[(3'h7):(1'h0)]) ?
                      (wire15 ?
                          $signed(wire13) : (~reg20)) : $unsigned((wire13 <<< (8'hb4)))) || (|reg25)));
              reg24 <= {wire7,
                  (~|($signed((wire14 ?
                      wire16 : wire7)) << reg21[(3'h4):(2'h2)]))};
            end
        end
      else
        begin
          if ((($signed($signed((|wire12))) >> (&$unsigned($signed((8'haf))))) <<< $unsigned(reg20)))
            begin
              reg19 <= $unsigned($unsigned(wire6));
            end
          else
            begin
              reg19 <= $signed($unsigned(($unsigned((wire7 ~^ reg23)) ?
                  ((|reg21) != {reg18, reg18}) : (~|$signed(wire8)))));
              reg20 <= (wire9[(2'h2):(2'h2)] ^~ $signed((^(!{(7'h40),
                  reg20}))));
              reg21 <= (reg10[(4'h8):(3'h7)] ~^ (wire13 ?
                  reg18 : $signed(wire12[(4'h8):(3'h6)])));
            end
          reg22 <= (8'haf);
        end
      reg26 <= (~^(~^wire6));
      reg27 <= reg18[(4'hc):(3'h6)];
      if ({$unsigned(wire17[(3'h7):(3'h5)])})
        begin
          reg28 <= {$unsigned({(~^{reg22, wire15})})};
        end
      else
        begin
          reg28 <= reg20[(4'h8):(3'h5)];
          if ({wire7[(2'h3):(1'h0)]})
            begin
              reg29 <= $unsigned($signed((reg21 ?
                  (8'hb8) : reg25[(3'h4):(3'h4)])));
              reg30 <= wire14[(1'h0):(1'h0)];
              reg31 <= wire7[(1'h1):(1'h0)];
              reg32 <= $unsigned(reg23[(1'h1):(1'h0)]);
            end
          else
            begin
              reg29 <= (7'h41);
              reg30 <= (($unsigned({{reg30}}) >> ((wire8[(3'h4):(2'h2)] ?
                  (reg10 >= wire9) : {(8'hb7)}) <= $signed((~|reg29)))) - $unsigned($signed((^$unsigned(wire15)))));
            end
          reg33 <= $unsigned(reg30);
          reg34 <= (reg31[(3'h5):(2'h3)] ?
              (($unsigned((reg27 << wire16)) ?
                      $signed((|reg31)) : ($unsigned(wire5) ?
                          {reg28, wire13} : (wire8 ? reg11 : reg33))) ?
                  $unsigned((wire16[(4'hb):(3'h7)] << reg23[(3'h5):(1'h0)])) : {wire15}) : (7'h44));
        end
    end
  assign wire35 = reg33[(1'h0):(1'h0)];
  assign wire36 = reg28[(3'h6):(3'h5)];
  assign wire37 = $signed(reg23[(4'hd):(3'h6)]);
  assign wire38 = wire8[(2'h2):(1'h1)];
  assign wire39 = ($unsigned(wire6[(4'hf):(4'he)]) ?
                      $signed(reg11) : $signed(wire8[(3'h4):(1'h0)]));
endmodule

module module122
#(parameter param135 = ((((((8'hb5) ? (8'ha1) : (8'ha7)) && ((8'hb8) ? (8'had) : (8'hbf))) ^~ ({(7'h41)} <= (+(8'ha0)))) ? (~^(^~(&(8'hae)))) : (~((8'hb7) >> ((8'hab) ? (8'h9e) : (8'ha1))))) ~^ ((8'hac) + (8'ha5))), 
parameter param136 = ((^{(((8'h9d) << param135) >= (param135 ? param135 : param135)), ((param135 * param135) == {(8'ha4)})}) ? ((param135 <<< ((param135 && param135) == {param135, param135})) ? param135 : ((((8'ha7) ^ param135) ? (param135 ? param135 : param135) : param135) ? ({(8'haa), param135} ? (param135 ~^ param135) : param135) : (7'h41))) : (((8'ha4) ? (8'hb8) : param135) ? param135 : (~|({param135} ? {param135, param135} : (param135 * param135))))))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire127;
  input wire signed [(3'h5):(1'h0)] wire126;
  input wire signed [(4'hb):(1'h0)] wire125;
  input wire [(5'h11):(1'h0)] wire124;
  input wire [(3'h7):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg132,
                 (1'h0)};
  assign wire128 = {$unsigned($unsigned(wire123[(3'h5):(2'h3)])),
                       (|$unsigned((-$unsigned(wire127))))};
  assign wire129 = wire128;
  assign wire130 = (|(^~wire128));
  assign wire131 = $signed($unsigned($signed($unsigned(wire124[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg132 <= wire129[(2'h2):(2'h2)];
    end
  assign wire133 = {wire126[(1'h1):(1'h0)],
                       ((wire129[(4'h8):(3'h6)] ?
                               $unsigned((~^wire128)) : wire127[(1'h1):(1'h0)]) ?
                           (wire128[(2'h2):(2'h2)] << {$signed(wire123)}) : (~|wire124))};
  assign wire134 = wire133;
endmodule

module module98
#(parameter param115 = (((+(((8'haa) ? (8'h9f) : (8'ha4)) ? {(8'ha8)} : ((8'hae) ~^ (8'hbd)))) && ((^~{(8'hae)}) || (((8'hbb) ? (8'hae) : (8'hbc)) ? (^(8'hb7)) : (^~(8'haf))))) >>> ({(((8'hbd) ? (8'hb1) : (8'hbc)) ? ((8'h9d) >= (8'ha5)) : ((8'ha4) ^~ (8'h9e))), {((7'h40) ? (8'hbb) : (8'hbe))}} >> (&(+(!(8'ha9)))))))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire102;
  input wire [(5'h13):(1'h0)] wire101;
  input wire signed [(4'hd):(1'h0)] wire100;
  input wire [(5'h10):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 (1'h0)};
  assign wire103 = (~^wire99[(4'h8):(1'h1)]);
  assign wire104 = (8'ha3);
  assign wire105 = ((&{(wire101[(1'h1):(1'h0)] <= {wire103, (8'ha9)}),
                           (wire99[(3'h5):(1'h0)] - (wire104 + wire102))}) ?
                       (|wire100[(4'ha):(4'ha)]) : wire101);
  assign wire106 = $unsigned((wire103 >= (wire103[(3'h6):(3'h4)] << $signed(wire102[(4'h8):(3'h7)]))));
  assign wire107 = wire101;
  assign wire108 = ($signed((wire107[(4'h9):(1'h0)] - ((wire102 ?
                       wire107 : wire102) < (wire100 >= wire104)))) + wire99[(4'h9):(4'h8)]);
  assign wire109 = {(8'ha2)};
  assign wire110 = (&(~^wire101));
  assign wire111 = (+$signed(({(~wire104)} & $unsigned($signed(wire100)))));
  assign wire112 = ($signed((($unsigned((8'hb6)) - wire111[(3'h4):(1'h1)]) < ($signed(wire110) ?
                           (wire104 ?
                               wire101 : wire100) : (wire110 != (8'hb8))))) ?
                       $signed($signed(((~^wire107) + wire107))) : (((wire103[(1'h0):(1'h0)] ?
                                   $unsigned(wire99) : (-wire100)) ?
                               (7'h41) : (!$signed((8'hba)))) ?
                           $signed((wire102 ~^ (~|wire106))) : ((~|wire107) ?
                               ((wire99 || wire105) <<< $signed(wire111)) : (~&(wire111 ?
                                   wire106 : wire107)))));
  assign wire113 = $signed($unsigned((wire110 >>> wire112)));
  assign wire114 = wire109[(4'hd):(4'hb)];
endmodule

module module67
#(parameter param92 = {(-(~&((+(8'ha5)) ? {(8'hab), (8'h9f)} : ((8'hb7) ? (8'hb6) : (8'ha8)))))}, 
parameter param93 = (({((param92 ? (8'ha3) : param92) >>> param92)} ? param92 : (((~^param92) >>> (~param92)) & (param92 ? param92 : {(8'hb2)}))) * (((param92 & (param92 ? param92 : param92)) ? (~&(param92 ? param92 : param92)) : param92) ? (param92 >>> (param92 ? param92 : (7'h41))) : {param92})))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire [(2'h2):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire72 = {$unsigned($unsigned(wire68)),
                      $unsigned($signed($signed(wire70)))};
  assign wire73 = ((wire72[(2'h3):(2'h2)] ?
                          ((((8'hae) ? wire69 : wire68) - (wire71 || (8'h9f))) ?
                              {(wire68 ?
                                      wire71 : wire69)} : $signed($unsigned((8'hbf)))) : wire71) ?
                      {$signed($signed((wire69 ?
                              wire69 : (8'hbc))))} : $signed($unsigned(wire71)));
  assign wire74 = ((~|(!$signed($unsigned(wire71)))) > (!wire72));
  assign wire75 = wire68;
  assign wire76 = (wire71 ?
                      $unsigned(($unsigned($signed(wire74)) ?
                          (wire68 ?
                              (wire74 | wire74) : $unsigned(wire75)) : $unsigned(wire68[(4'hb):(3'h7)]))) : $unsigned($unsigned(({(8'had),
                          wire75} >>> (^wire68)))));
  assign wire77 = ((wire74[(1'h0):(1'h0)] ?
                          $unsigned(((wire73 > (8'hb2)) ^~ wire76)) : $signed($unsigned((wire71 * wire72)))) ?
                      wire72 : wire70);
  assign wire78 = wire75;
  assign wire79 = wire73;
  assign wire80 = {$unsigned(($unsigned((wire76 ? wire77 : (8'hb9))) ?
                          ((wire69 ? (8'hb2) : wire75) ?
                              $signed(wire77) : wire70[(2'h2):(1'h1)]) : (((8'hb2) ?
                                  wire68 : wire74) ?
                              wire72 : wire73))),
                      {wire77}};
  assign wire81 = (($signed({(wire79 >>> (7'h42))}) ?
                          (-$signed(wire76[(3'h7):(3'h6)])) : $unsigned({(wire72 ?
                                  wire75 : wire73),
                              $unsigned(wire78)})) ?
                      (7'h40) : wire77);
  always
    @(posedge clk) begin
      reg82 <= $unsigned($unsigned(wire74));
      reg83 <= (~|(({(wire79 ? wire77 : (8'ha7))} ?
          wire80[(3'h7):(3'h6)] : ((wire69 >= (8'ha9)) <<< wire75)) - {{(reg82 * wire76)},
          (^wire78[(4'hb):(3'h5)])}));
      if ((wire73[(5'h11):(4'hf)] || $unsigned((wire68[(4'hf):(3'h5)] ~^ {(^~wire68),
          (wire76 * wire71)}))))
        begin
          if ((wire81 ^~ wire77))
            begin
              reg84 <= {((({wire81} ?
                              (wire78 ? (8'ha8) : wire74) : ((8'ha9) ?
                                  wire68 : wire79)) ?
                          {$signed(wire77)} : (|(wire75 ? wire80 : wire78))) ?
                      ((((8'h9d) | reg83) ?
                          $signed(wire68) : wire68) < (~^(wire79 ?
                          wire74 : wire80))) : $unsigned(wire78))};
            end
          else
            begin
              reg84 <= ((~^$signed(wire68[(4'hc):(2'h3)])) ?
                  (~^(((reg84 || wire69) + {wire81, wire74}) ?
                      (|$signed((8'ha5))) : wire68[(4'h8):(3'h5)])) : $signed($unsigned($unsigned(wire75[(1'h1):(1'h1)]))));
              reg85 <= wire75;
              reg86 <= ((wire73 ?
                  ($unsigned(reg83[(1'h1):(1'h0)]) ?
                      (!(wire70 ?
                          wire76 : wire81)) : ((8'ha5) <= {wire80})) : (^wire72[(1'h0):(1'h0)])) != $signed(wire74));
              reg87 <= {({$unsigned((|reg85)),
                      {(reg85 ? reg83 : wire73),
                          $unsigned((8'hbf))}} + {($unsigned(wire73) >>> $unsigned(wire76)),
                      ({reg82} ^~ wire77[(1'h0):(1'h0)])}),
                  $unsigned({{(wire75 ? wire78 : (7'h44)), {wire81, wire77}},
                      wire68})};
              reg88 <= reg82;
            end
        end
      else
        begin
          reg84 <= (7'h42);
        end
    end
  assign wire89 = $signed(({$signed((wire76 ? reg85 : (8'ha0))),
                      ((8'h9d) ?
                          (reg83 <<< (8'ha4)) : $unsigned(wire71))} - wire76[(4'hd):(4'ha)]));
  assign wire90 = reg83[(3'h5):(1'h0)];
  assign wire91 = {reg85[(2'h2):(1'h1)]};
endmodule
