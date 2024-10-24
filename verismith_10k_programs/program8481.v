module top
#(parameter param200 = (((({(8'ha8)} ? ((8'ha9) ? (8'hb0) : (8'ha1)) : ((8'h9f) ? (8'ha3) : (8'hbd))) & (^((8'haf) <= (8'hb7)))) ? ((&((8'hb2) ? (8'h9e) : (8'hb7))) || (((8'hab) > (7'h42)) | ((8'ha6) ^~ (8'hb0)))) : (~|(-(8'ha7)))) ? ((8'ha6) ? {(((7'h44) ? (8'had) : (7'h40)) ? ((8'hb2) * (8'hbc)) : ((8'ha1) ? (8'ha7) : (8'hbc))), (8'hac)} : {(((8'ha9) << (8'ha0)) * (~&(8'ha1)))}) : {((((8'ha0) ? (8'ha0) : (8'hb9)) ? {(8'hb9)} : ((8'hbc) ^ (8'h9e))) & {((8'hbb) ? (8'h9f) : (8'h9c))})}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire193;
  wire signed [(4'he):(1'h0)] wire182;
  wire [(5'h14):(1'h0)] wire181;
  wire [(2'h2):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire178;
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg [(4'hf):(1'h0)] reg198 = (1'h0);
  reg [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg [(5'h15):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  reg [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  assign y = {wire193,
                 wire182,
                 wire181,
                 wire180,
                 wire145,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 wire178,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg154,
                 (1'h0)};
  module5 #() modinst146 (.wire7(wire0), .wire6(wire3), .wire8(wire2), .y(wire145), .clk(clk), .wire9(wire1));
  assign wire147 = $signed($unsigned(wire1));
  assign wire148 = wire147[(2'h2):(2'h2)];
  assign wire149 = wire1;
  assign wire150 = ($signed(({wire148[(2'h2):(1'h1)],
                       (~wire149)} >= (~&$unsigned(wire4)))) >> wire1[(4'hb):(3'h5)]);
  assign wire151 = $signed(($signed(wire2) ? wire147[(1'h0):(1'h0)] : wire2));
  assign wire152 = $signed($signed($signed((|{wire3}))));
  assign wire153 = ({wire145[(1'h0):(1'h0)], (~$signed($unsigned((8'hb9))))} ?
                       $signed(wire0[(5'h11):(4'hd)]) : {(({wire149} ?
                               (+wire1) : (wire4 ?
                                   wire152 : wire1)) & (+$signed(wire152))),
                           wire148});
  always
    @(posedge clk) begin
      reg154 <= wire0[(4'ha):(3'h7)];
    end
  assign wire155 = $signed($unsigned((!$unsigned(reg154[(2'h3):(2'h3)]))));
  assign wire156 = $unsigned($unsigned((+((wire148 ?
                       wire148 : wire149) && (8'ha6)))));
  assign wire157 = $unsigned($unsigned((wire3 >> ($signed(reg154) ^~ $signed(wire151)))));
  assign wire158 = ({(8'hb1)} | wire3);
  module159 #() modinst179 (.wire161(wire148), .wire163(wire156), .wire160(reg154), .clk(clk), .wire162(wire152), .y(wire178));
  assign wire180 = (|$signed(($signed(wire1) ?
                       {{(7'h41)},
                           (wire151 ?
                               wire158 : wire147)} : (^(wire1 ^~ wire149)))));
  assign wire181 = $unsigned((-$unsigned((8'hb7))));
  assign wire182 = (wire150 ?
                       ($unsigned(wire151) ?
                           ({wire148} ?
                               (!$unsigned(wire1)) : $unsigned($unsigned(wire4))) : $unsigned($unsigned($unsigned(wire1)))) : $unsigned(wire156[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg183 <= wire1;
      if ((wire3 ^ ({wire2[(4'ha):(1'h0)], ((~wire2) >= {(7'h42)})} ?
          wire0[(4'h8):(3'h7)] : ($unsigned($signed((8'h9c))) ?
              $unsigned($signed(wire158)) : ($signed(wire148) ?
                  $signed((7'h44)) : wire1)))))
        begin
          if (((~((wire152[(4'hf):(4'he)] ^ reg154[(1'h0):(1'h0)]) ?
                  $signed($signed(wire157)) : ((~&reg183) >> (reg154 * wire158)))) ?
              (|(wire178[(4'hc):(4'hb)] ?
                  $signed($signed(wire148)) : ($signed(wire0) ?
                      $signed(wire145) : {wire156}))) : (^wire155)))
            begin
              reg184 <= wire4[(3'h5):(3'h5)];
              reg185 <= $unsigned(((^$unsigned($signed(wire182))) ?
                  $unsigned(((!wire4) ?
                      wire157[(1'h0):(1'h0)] : ((8'hb4) & wire180))) : ($unsigned((+wire150)) == wire152)));
              reg186 <= $unsigned((~&{$signed({wire150})}));
            end
          else
            begin
              reg184 <= (((wire0 | wire4) ?
                      $signed(reg154[(3'h7):(2'h3)]) : $signed((wire150[(2'h2):(1'h1)] + $signed(wire157)))) ?
                  ((8'hba) && ((^wire147[(1'h1):(1'h0)]) != wire145[(1'h1):(1'h0)])) : (~^wire2[(4'he):(1'h0)]));
              reg185 <= $signed({(($unsigned(wire3) ? (!wire178) : wire148) ?
                      ((^~wire158) ?
                          $signed(wire1) : $unsigned(wire156)) : (-wire153[(3'h7):(1'h1)])),
                  $unsigned((8'hb0))});
              reg186 <= $signed((wire150 ?
                  ({(wire153 ^ wire156)} ?
                      wire180[(2'h2):(1'h0)] : $signed($signed((8'ha8)))) : reg186[(3'h5):(3'h4)]));
              reg187 <= $signed($signed({$signed($unsigned(wire153)),
                  ((reg183 ? reg186 : wire1) + (wire155 ? wire147 : reg185))}));
              reg188 <= $unsigned($signed(wire178));
            end
          reg189 <= (reg187[(1'h0):(1'h0)] ?
              {$unsigned((8'ha4)),
                  ($signed($signed(wire155)) ?
                      wire180 : wire150[(4'h8):(3'h5)])} : $signed(((8'h9d) ?
                  $signed((wire178 ?
                      wire2 : wire4)) : wire178[(2'h3):(1'h0)])));
          reg190 <= $signed(($unsigned($signed($signed(wire152))) > $unsigned((+$unsigned(wire153)))));
          reg191 <= $unsigned(wire157[(3'h5):(1'h0)]);
          reg192 <= $signed((-($unsigned($signed(reg186)) ?
              wire153[(5'h11):(4'he)] : ({reg189, wire178} & wire158))));
        end
      else
        begin
          reg184 <= ($unsigned((($unsigned((7'h40)) - (^(8'hbe))) >>> wire181)) ~^ $unsigned(((~|(8'hbc)) ?
              (((8'hbc) == wire2) ?
                  (wire2 && wire152) : wire158[(4'h9):(3'h7)]) : ($unsigned(reg189) ?
                  $unsigned(wire2) : $signed(wire1)))));
          if (((|($signed(((8'ha4) ? wire1 : (8'ha0))) ?
                  {wire156[(1'h1):(1'h0)]} : $unsigned($unsigned(wire150)))) ?
              ((!(reg192 == $signed(wire4))) ?
                  wire150 : (-((&wire157) ?
                      (wire181 ?
                          wire157 : reg190) : reg187))) : wire150[(3'h5):(3'h4)]))
            begin
              reg185 <= ((((^(&wire4)) ?
                  (^~reg191[(3'h5):(1'h1)]) : wire181[(2'h3):(2'h3)]) > (reg190[(3'h4):(2'h2)] >>> wire4)) <= $unsigned($signed((&reg183))));
              reg186 <= reg190;
            end
          else
            begin
              reg185 <= {(wire153 ?
                      $unsigned($unsigned((|wire151))) : $unsigned(reg192[(4'h8):(3'h6)])),
                  (reg188 ?
                      (~|(reg191 << $signed((8'hbe)))) : {wire182, wire1})};
              reg186 <= $unsigned({$unsigned({$unsigned(reg191), wire153})});
              reg187 <= reg191[(4'h9):(1'h1)];
              reg188 <= reg154[(3'h4):(2'h2)];
              reg189 <= $unsigned($unsigned(reg154));
            end
        end
    end
  assign wire193 = $signed((~|reg188));
  always
    @(posedge clk) begin
      reg194 <= ((+(~($signed(reg187) ^ $unsigned(wire155)))) < ((($unsigned((8'hb8)) & $unsigned(wire145)) ~^ reg192) <= ((~|(reg190 ?
          reg188 : wire152)) << $unsigned($signed((8'hbf))))));
      if (wire1[(4'ha):(1'h1)])
        begin
          reg195 <= $unsigned(((&$signed({wire1,
              wire182})) == wire181[(5'h12):(2'h3)]));
          reg196 <= $unsigned($signed(({$unsigned(reg184),
              (reg189 ? (8'h9d) : reg187)} <= $unsigned((reg183 ?
              reg183 : (7'h41))))));
        end
      else
        begin
          reg195 <= (7'h41);
          reg196 <= (reg191[(3'h6):(3'h6)] | {((wire157 ?
                  (wire155 && reg191) : (wire149 & wire148)) || ((wire148 ?
                  reg190 : wire155) <= $signed((8'ha4))))});
        end
      reg197 <= $signed((~&(($unsigned(reg184) ~^ ((8'hb9) ?
          wire156 : wire145)) * ($signed(wire156) ?
          (wire178 ? (7'h44) : reg184) : (8'hbd)))));
      reg198 <= ($unsigned({(~&$unsigned(wire156)),
          (~(reg154 ?
              reg196 : wire156))}) < (^~((wire2[(4'h8):(2'h3)] ~^ $signed(wire181)) ?
          reg190[(4'h8):(1'h1)] : ((+(8'haf)) ? wire4 : (reg195 && wire193)))));
      reg199 <= wire148;
    end
endmodule

module module159
#(parameter param176 = ((({(^~(8'ha0)), (|(8'ha5))} & (~&((8'hab) ? (8'ha5) : (8'ha3)))) ? ((~{(8'hac)}) + (((7'h41) >= (8'hb2)) >> ((8'hb1) <<< (8'ha2)))) : (^~(^~{(8'hba)}))) <<< ((^{(7'h41)}) ? ((((8'hbb) && (7'h42)) + (^(8'ha0))) << {(8'h9d), (~&(8'haf))}) : (~&(((8'hbf) ? (8'hb2) : (8'hb6)) ? {(8'hba)} : ((8'hb0) * (8'ha9)))))), 
parameter param177 = ((~(+((param176 && param176) ^ ((8'h9f) * param176)))) << param176))
(y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire163;
  input wire signed [(5'h10):(1'h0)] wire162;
  input wire [(3'h7):(1'h0)] wire161;
  input wire [(3'h4):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire175;
  wire [(4'ha):(1'h0)] wire174;
  wire signed [(5'h14):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(4'h8):(1'h0)] wire169;
  wire signed [(3'h5):(1'h0)] wire165;
  wire [(4'hd):(1'h0)] wire164;
  reg [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(4'hf):(1'h0)] reg166 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire165,
                 wire164,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire164 = $signed({wire162, wire162});
  assign wire165 = wire162[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg166 <= $signed(wire161[(3'h5):(3'h5)]);
      reg167 <= $unsigned($signed(wire165[(3'h4):(1'h0)]));
      reg168 <= {reg166[(2'h2):(1'h1)]};
    end
  assign wire169 = wire163;
  assign wire170 = (~|(&(&wire165[(1'h1):(1'h1)])));
  assign wire171 = (!$unsigned($signed((8'haa))));
  assign wire172 = (wire164[(4'h9):(2'h2)] ?
                       reg166[(2'h3):(2'h3)] : $unsigned($signed((~^wire169))));
  assign wire173 = wire163;
  assign wire174 = wire165;
  assign wire175 = wire164[(4'h8):(3'h4)];
endmodule

module module5
#(parameter param144 = (^~(&{((~(8'hac)) ? ((8'h9e) ? (8'ha0) : (8'hae)) : ((7'h41) ? (8'ha6) : (8'hac))), (((8'ha2) ? (8'ha8) : (8'hb8)) ? {(8'haa)} : ((8'hb7) >>> (8'hb7)))})))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(4'h9):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire113;
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire129,
                 wire92,
                 wire35,
                 wire22,
                 wire33,
                 wire94,
                 wire113,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg128,
                 reg127,
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
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire7)))
        begin
          reg10 <= ($signed($unsigned((~|(wire9 >= (8'hb1))))) ?
              $signed(({wire7, (wire8 ~^ wire6)} ?
                  ((wire8 ? (8'ha9) : wire7) ?
                      $signed(wire7) : $unsigned((8'hb3))) : $unsigned((&wire9)))) : wire8[(1'h0):(1'h0)]);
          reg11 <= wire7[(4'hf):(4'hc)];
          reg12 <= {{$signed((^(-wire6))), wire7}};
          reg13 <= $unsigned($signed({(wire8 ?
                  wire7 : (reg10 ? (8'ha2) : wire9)),
              $unsigned(((8'h9c) ? (8'ha1) : wire6))}));
          if (wire7[(4'h8):(4'h8)])
            begin
              reg14 <= $unsigned(wire6[(2'h2):(1'h1)]);
              reg15 <= $unsigned(reg14);
            end
          else
            begin
              reg14 <= ({$signed(wire8[(3'h5):(3'h5)])} ?
                  (~&wire8[(2'h2):(1'h1)]) : $signed((((wire9 ?
                      wire6 : (8'hb4)) ^~ {wire7,
                      wire7}) & $signed($signed((8'h9f))))));
            end
        end
      else
        begin
          reg10 <= $unsigned($unsigned($signed($unsigned(wire6[(1'h0):(1'h0)]))));
          if ({((reg12[(3'h6):(3'h6)] ~^ reg13) & reg13),
              ((+(reg11[(2'h2):(2'h2)] | (~&wire8))) ^~ reg13)})
            begin
              reg11 <= (8'had);
              reg12 <= (reg11 ^~ reg11[(2'h2):(2'h2)]);
              reg13 <= wire9[(3'h7):(1'h1)];
              reg14 <= ((((|reg14[(4'h9):(4'h9)]) ?
                          wire8[(3'h6):(2'h2)] : (~|(reg14 ? wire7 : reg11))) ?
                      wire6 : (+$signed((reg12 ? wire7 : (8'hb7))))) ?
                  reg14[(4'h9):(2'h3)] : reg13);
              reg15 <= reg11[(1'h1):(1'h1)];
            end
          else
            begin
              reg11 <= (reg14 ?
                  {((^$unsigned(reg12)) * reg13[(1'h1):(1'h1)])} : (((!(~wire8)) ?
                      {wire7} : (~(wire6 < reg10))) ~^ reg11));
              reg12 <= reg11[(1'h0):(1'h0)];
              reg13 <= (-((reg13[(4'he):(4'ha)] ?
                      $signed($signed(reg15)) : $signed($signed(reg10))) ?
                  (reg15 && $unsigned(reg15[(1'h0):(1'h0)])) : reg15));
              reg14 <= ((~|{((reg11 ? reg15 : reg11) + {wire6, reg11})}) ?
                  reg12 : (reg15 ^ {$unsigned($unsigned((8'hba))),
                      wire8[(2'h2):(1'h1)]}));
            end
        end
      if (reg15)
        begin
          reg16 <= ((($signed({wire6, reg15}) ? reg11 : wire6) << (^~({reg13,
                  reg10} != $unsigned(wire6)))) ?
              (reg12 ?
                  {$unsigned((reg10 ^ reg12)),
                      reg14} : $unsigned($signed($unsigned(reg15)))) : {reg13,
                  $unsigned((wire7[(4'hc):(3'h4)] ?
                      ((7'h42) ? wire9 : (7'h40)) : reg13))});
        end
      else
        begin
          reg16 <= (wire8 ?
              (reg11[(1'h0):(1'h0)] ?
                  $signed(($signed(reg15) == (8'hac))) : $signed((reg13 ?
                      {reg14, wire6} : (^wire9)))) : wire8);
          reg17 <= reg16[(4'ha):(4'h9)];
          reg18 <= (8'ha0);
        end
      reg19 <= (-(((|wire8) ? (8'hb5) : $signed(reg10[(1'h1):(1'h1)])) ?
          (8'h9c) : wire8[(1'h0):(1'h0)]));
      reg20 <= (|(+(($signed(wire8) >> reg15[(2'h3):(2'h3)]) ^ ((+reg18) + (reg16 ?
          reg18 : reg13)))));
      reg21 <= (wire7 >>> (((~^$signed((8'ha2))) >>> reg11) != reg11));
    end
  assign wire22 = ((($unsigned((!wire9)) ?
                          $signed((!reg21)) : (~$signed((8'hbe)))) <<< $unsigned($signed({reg13}))) ?
                      (|(|reg11[(1'h0):(1'h0)])) : $signed(reg12[(2'h2):(1'h0)]));
  module23 #() modinst34 (.clk(clk), .y(wire33), .wire24(wire9), .wire28(reg19), .wire25(reg14), .wire26(reg21), .wire27(reg15));
  assign wire35 = (-wire8);
  module36 #() modinst93 (wire92, clk, reg10, reg16, wire33, reg13);
  assign wire94 = reg16;
  module95 #() modinst114 (wire113, clk, reg21, wire8, wire6, wire33, reg15);
  always
    @(posedge clk) begin
      reg115 <= (($unsigned($signed((|reg19))) ?
          wire35[(4'hb):(3'h5)] : (wire35 ?
              ($unsigned(wire7) ?
                  (reg19 ?
                      reg21 : wire6) : $unsigned(wire8)) : reg21)) && $signed({(reg13[(2'h2):(1'h1)] & reg13[(2'h3):(2'h3)])}));
      reg116 <= reg16;
      if ((7'h40))
        begin
          reg117 <= ((8'ha0) ?
              $signed($unsigned((wire22[(2'h3):(2'h3)] | (reg17 ?
                  reg17 : reg12)))) : ((reg12 << ($unsigned(wire8) < (reg12 || reg16))) ?
                  (7'h40) : $signed(reg116[(1'h1):(1'h1)])));
          if (((^~(reg19[(4'he):(2'h3)] >> reg10)) ? wire7 : wire8))
            begin
              reg118 <= reg14[(1'h0):(1'h0)];
            end
          else
            begin
              reg118 <= (|$signed($signed(($signed(reg117) >>> (^~wire8)))));
              reg119 <= {reg117[(4'hb):(3'h4)], reg21[(4'ha):(2'h2)]};
              reg120 <= wire92[(2'h3):(1'h0)];
              reg121 <= (~&{reg19});
            end
          if ({(reg18[(2'h2):(1'h0)] < reg121[(3'h6):(2'h2)])})
            begin
              reg122 <= $unsigned((^reg21[(3'h6):(3'h5)]));
              reg123 <= reg16[(4'hf):(4'ha)];
              reg124 <= $unsigned(({$unsigned($unsigned(reg13)),
                  $signed(reg122)} & reg16[(3'h5):(2'h3)]));
              reg125 <= (-reg21);
              reg126 <= ({reg124[(3'h4):(1'h1)],
                  {($signed(reg115) ^ (reg119 ? wire94 : reg122))}} <= (7'h43));
            end
          else
            begin
              reg122 <= (7'h43);
              reg123 <= reg18[(1'h0):(1'h0)];
              reg124 <= $signed($signed(reg11));
              reg125 <= (|$signed(($signed($signed(reg116)) ?
                  $unsigned(wire22) : reg11)));
              reg126 <= (~^reg123[(2'h3):(2'h3)]);
            end
          reg127 <= ((~^(~|reg122[(3'h7):(2'h2)])) ?
              (7'h44) : $signed($signed($signed({wire8}))));
        end
      else
        begin
          reg117 <= reg16[(5'h10):(3'h5)];
        end
      reg128 <= (({((-reg19) ? $signed((8'hb6)) : reg16),
              (|$unsigned(reg115))} | (!(8'ha2))) ?
          (!reg16[(1'h0):(1'h0)]) : $signed(reg121[(1'h0):(1'h0)]));
    end
  assign wire129 = {$unsigned(((wire6[(4'h9):(4'h8)] || ((8'ha8) <= wire92)) << ((|(8'hb2)) < reg13))),
                       (+reg119[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg130 <= ({$unsigned(($signed((8'hb8)) - reg122[(2'h2):(1'h1)])),
          reg16[(2'h2):(1'h0)]} >>> $unsigned((wire113[(3'h6):(3'h6)] == $signed($unsigned(reg118)))));
    end
  always
    @(posedge clk) begin
      if (($unsigned((reg17[(2'h3):(2'h2)] == $signed(wire35))) ?
          ({($unsigned(reg12) ? reg117 : (reg11 != wire129)),
                  (reg21 << wire129)} ?
              reg116[(4'h8):(2'h2)] : ((^~$signed((8'hbc))) && (^$unsigned((8'haf))))) : $unsigned($signed(reg19[(4'he):(3'h6)]))))
        begin
          reg131 <= ($unsigned({$unsigned($signed(reg130)), (|reg11)}) ?
              reg118[(3'h6):(2'h3)] : (reg19[(3'h7):(2'h2)] ?
                  ($signed($unsigned(reg128)) >= reg130) : reg21));
          if ((!reg118[(4'hc):(3'h5)]))
            begin
              reg132 <= $signed($signed((reg14 <<< (reg130 ? reg19 : reg122))));
              reg133 <= reg121;
            end
          else
            begin
              reg132 <= (~|reg17[(5'h10):(4'he)]);
              reg133 <= $unsigned($unsigned((^~{wire92})));
            end
          reg134 <= $unsigned((~^reg15[(1'h1):(1'h0)]));
          reg135 <= $unsigned(($signed((^(wire6 ?
              reg116 : wire35))) - ((~&$unsigned(reg122)) == reg133)));
        end
      else
        begin
          if ((~&wire22[(3'h4):(2'h2)]))
            begin
              reg131 <= (+$unsigned(reg121[(1'h0):(1'h0)]));
              reg132 <= reg115;
              reg133 <= ({$signed(reg12), reg118[(4'he):(4'h9)]} ?
                  $signed(((+{reg17, reg12}) >>> ((reg20 ^ reg14) ?
                      (wire33 ?
                          reg123 : wire7) : (reg120 + reg116)))) : (~|(^~((reg135 >> reg135) ^~ (wire33 ?
                      wire7 : reg132)))));
            end
          else
            begin
              reg131 <= reg115[(3'h4):(2'h3)];
              reg132 <= (&reg118[(4'h8):(2'h2)]);
              reg133 <= ((~&reg128) + (8'hb8));
            end
          if ($signed({(8'ha2)}))
            begin
              reg134 <= reg117[(2'h3):(2'h3)];
              reg135 <= reg12[(4'ha):(1'h1)];
              reg136 <= $unsigned((((reg11[(2'h2):(1'h0)] ?
                  (reg126 ?
                      reg124 : (8'hb6)) : wire92[(3'h4):(1'h0)]) > $signed((8'haf))) < reg127));
            end
          else
            begin
              reg134 <= {(&($signed((^~reg17)) ~^ (~^reg120[(2'h3):(1'h1)])))};
            end
        end
    end
  always
    @(posedge clk) begin
      reg137 <= ((^~reg118) + reg116[(2'h3):(2'h2)]);
    end
  assign wire138 = reg118;
  assign wire139 = (8'ha9);
  assign wire140 = (~|reg134[(2'h2):(2'h2)]);
  assign wire141 = reg19[(3'h4):(1'h1)];
  assign wire142 = {(($signed((reg126 + wire138)) ?
                           $signed($signed(reg19)) : (^~(reg115 * reg123))) || (~&(+(reg137 == reg137))))};
  assign wire143 = {((8'ha6) >> reg14[(4'hc):(1'h1)])};
endmodule

module module95
#(parameter param111 = (8'hb0), 
parameter param112 = (~(-(~((param111 >>> param111) << ((8'hbb) ? param111 : param111))))))
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire100;
  input wire signed [(5'h12):(1'h0)] wire99;
  input wire signed [(5'h10):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire [(5'h14):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire102,
                 wire101,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire101 = wire98;
  assign wire102 = (((+$unsigned(wire97)) ?
                       ((((8'h9e) ? wire99 : wire96) << (wire99 ?
                           wire100 : wire96)) <= wire97[(5'h11):(3'h6)]) : ($signed(wire98) ~^ wire100)) | (~^wire98));
  always
    @(posedge clk) begin
      if ((((((wire98 ? wire99 : wire97) ^~ $signed(wire101)) >= (-wire96)) ?
          (wire101 || wire101[(3'h4):(1'h0)]) : wire96[(4'hc):(2'h3)]) != $unsigned(wire97)))
        begin
          reg103 <= (!(~|$unsigned($signed((wire99 & wire98)))));
          if (wire101[(1'h1):(1'h1)])
            begin
              reg104 <= $signed(wire101[(3'h4):(2'h2)]);
              reg105 <= (^~wire101[(1'h1):(1'h0)]);
              reg106 <= $unsigned($unsigned(reg104));
            end
          else
            begin
              reg104 <= (&$signed({wire101, ($unsigned(wire99) ~^ (&wire98))}));
              reg105 <= reg103;
            end
          reg107 <= (~$unsigned(($unsigned($signed(wire101)) ?
              (reg105 && wire101[(3'h4):(2'h2)]) : reg105[(1'h1):(1'h1)])));
        end
      else
        begin
          reg103 <= $unsigned((wire96[(5'h13):(4'hd)] ?
              $signed(reg105) : (^~((~|reg103) ~^ wire97[(4'hd):(1'h1)]))));
          reg104 <= $unsigned(($unsigned($signed((wire101 | (8'hbb)))) ?
              $unsigned((wire99 ?
                  (reg103 ?
                      reg104 : wire101) : $unsigned(wire102))) : $unsigned((^(&reg106)))));
        end
      reg108 <= reg104[(4'ha):(3'h6)];
    end
  assign wire109 = wire101[(3'h4):(3'h4)];
  assign wire110 = reg103[(2'h2):(1'h0)];
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  input wire [(3'h7):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire50,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire41 = $signed($signed($unsigned($unsigned((-wire39)))));
  assign wire42 = ((((~^((8'hac) & wire39)) << wire41[(4'he):(3'h5)]) <= wire38[(2'h3):(2'h3)]) >> (^~wire39));
  assign wire43 = (($signed(wire37) >= $signed({(|wire40)})) >= (($signed((|wire37)) <<< wire40[(4'hb):(2'h3)]) ?
                      $unsigned($signed($signed(wire41))) : wire38));
  assign wire44 = wire39;
  assign wire45 = {$unsigned(((|(wire44 ? wire39 : (7'h44))) ?
                          wire41[(3'h7):(3'h5)] : $signed(((7'h40) > wire44)))),
                      ({$unsigned($signed(wire43)), (!wire38[(2'h3):(2'h2)])} ?
                          wire42 : {((~wire43) ~^ $signed(wire42))})};
  assign wire46 = (((~|$signed(wire43)) ?
                      $signed({{wire45, wire43}}) : ({wire43[(3'h6):(2'h2)],
                              $signed(wire44)} ?
                          wire37 : (&wire41[(4'he):(4'h8)]))) * ($unsigned($unsigned($unsigned(wire44))) ?
                      $signed($signed($unsigned(wire43))) : wire42));
  always
    @(posedge clk) begin
      reg47 <= ((-{(((8'h9f) && wire44) ? (8'haa) : (^~wire41))}) ?
          (wire41[(4'h8):(3'h6)] ?
              wire43[(2'h3):(1'h1)] : {$unsigned($unsigned(wire38)),
                  wire40}) : ($signed(($unsigned(wire42) + $signed(wire40))) >> {$unsigned($unsigned(wire41)),
              $unsigned($unsigned(wire46))}));
      reg48 <= $unsigned($unsigned(wire44[(4'hb):(3'h7)]));
      reg49 <= wire39;
    end
  assign wire50 = ({($signed($unsigned(wire39)) != ({wire40, wire40} ?
                          $unsigned(wire38) : reg49[(3'h6):(3'h4)])),
                      ((wire44[(1'h0):(1'h0)] ?
                          $signed(wire46) : (~^reg48)) != ((reg47 ?
                              wire37 : reg49) ?
                          (wire44 > wire42) : wire46))} > ((+$signed((reg49 ^ (7'h44)))) && {((reg49 <= (8'hb7)) > {(8'haa),
                          wire38}),
                      $signed((wire44 ? wire43 : reg47))}));
  always
    @(posedge clk) begin
      reg51 <= (^~$signed(reg47[(1'h0):(1'h0)]));
      if (wire45)
        begin
          reg52 <= ($signed(wire38) ?
              wire44[(2'h2):(2'h2)] : (($unsigned(wire46) ?
                      wire42[(1'h1):(1'h0)] : {$unsigned(wire42)}) ?
                  wire40 : $signed(wire44)));
          reg53 <= (&((({wire40} ? $unsigned(wire42) : wire44) ?
              (8'ha8) : ((wire40 ? wire41 : reg52) ?
                  $signed(wire40) : wire41[(4'hb):(2'h3)])) <= wire46[(2'h3):(2'h2)]));
          if ((((~wire37) ?
              (8'hbb) : (wire40[(3'h6):(1'h0)] ?
                  reg52[(2'h3):(2'h2)] : reg49)) || (((~(wire45 || (8'hb9))) | {(wire42 ?
                      wire45 : wire46)}) ?
              ($unsigned($unsigned(wire38)) ?
                  wire42[(3'h4):(1'h1)] : wire38[(1'h1):(1'h1)]) : wire40[(4'hc):(3'h6)])))
            begin
              reg54 <= (+($signed(($unsigned(wire40) ?
                      (8'ha2) : (wire43 >>> wire44))) ?
                  $signed($signed({wire45})) : $unsigned(((-reg51) ?
                      (wire37 == wire44) : (^~reg49)))));
              reg55 <= reg52;
              reg56 <= $signed({wire41, {(~|wire39[(4'he):(4'he)])}});
              reg57 <= $unsigned($unsigned($unsigned(({reg49} | ((7'h42) ?
                  reg49 : reg55)))));
              reg58 <= wire46[(3'h5):(1'h0)];
            end
          else
            begin
              reg54 <= ((wire44[(5'h10):(4'hd)] ?
                  (reg47 ^~ (-(reg57 ? (8'ha8) : reg54))) : (($unsigned(reg51) ?
                      (^reg51) : wire42[(1'h0):(1'h0)]) <= wire40[(1'h0):(1'h0)])) <<< $signed(wire40[(4'h8):(3'h7)]));
              reg55 <= (reg54 ?
                  $signed($signed((-wire37))) : (reg48[(3'h6):(1'h0)] ?
                      ((reg56 <<< (reg49 ? wire39 : wire37)) ?
                          $unsigned((wire45 ?
                              reg51 : (8'hbc))) : (~&reg57[(4'h9):(4'h8)])) : reg47));
              reg56 <= (8'ha4);
            end
          reg59 <= (({wire50,
                  (wire41[(2'h2):(2'h2)] >>> (reg52 >= wire41))} != wire40[(3'h7):(3'h6)]) ?
              ((^~$signed((wire44 >= wire50))) <= $signed($unsigned(wire50))) : wire37);
          reg60 <= wire41[(4'he):(4'h8)];
        end
      else
        begin
          reg52 <= {{$signed($signed((~|reg58)))},
              {$signed($unsigned((wire37 <= reg48)))}};
          reg53 <= (wire42 ?
              {$unsigned((~|(wire41 ? reg56 : (8'h9c)))),
                  ($signed((reg53 * reg55)) && {reg49,
                      (wire44 ? wire42 : reg47)})} : (^~(reg53[(5'h12):(3'h7)] ?
                  reg47[(4'he):(4'hc)] : ((reg59 ? wire39 : (8'ha4)) ?
                      reg51 : (reg56 < wire38)))));
          reg54 <= ((~wire37[(2'h2):(1'h0)]) ?
              {$signed($signed($signed((8'hb1)))),
                  reg59} : reg59[(2'h3):(2'h2)]);
        end
      reg61 <= (~^reg51[(4'hb):(3'h5)]);
      if (reg57[(2'h2):(2'h2)])
        begin
          if ({$signed(($unsigned($unsigned(reg56)) == $unsigned($unsigned((8'ha2)))))})
            begin
              reg62 <= $signed((((|$signed(wire50)) <= $signed((~reg52))) ?
                  {$signed(wire41[(4'hb):(3'h7)])} : $unsigned($signed($unsigned(wire37)))));
              reg63 <= wire46[(1'h0):(1'h0)];
            end
          else
            begin
              reg62 <= $unsigned((~&$signed($unsigned({reg49, reg47}))));
              reg63 <= (($signed($signed(reg62[(4'ha):(3'h4)])) < (~&$unsigned($unsigned(wire50)))) ?
                  reg58 : $signed((wire37[(2'h2):(1'h0)] ^ reg52)));
            end
          reg64 <= (wire42[(2'h3):(2'h2)] ?
              ({((^reg49) ? ((8'h9f) <<< reg56) : reg60)} ?
                  (8'h9e) : {(8'hb1)}) : $unsigned({wire42[(2'h3):(1'h0)]}));
        end
      else
        begin
          if (reg53)
            begin
              reg62 <= {(~(-reg63[(2'h3):(2'h3)]))};
              reg63 <= (&$unsigned(reg63[(4'ha):(4'h8)]));
              reg64 <= $unsigned((wire45 ?
                  $signed(((+reg58) ?
                      $signed(reg64) : $signed(wire37))) : reg48));
              reg65 <= ($unsigned($unsigned((^~{reg48}))) ?
                  wire46[(1'h0):(1'h0)] : wire37);
              reg66 <= wire41;
            end
          else
            begin
              reg62 <= ({$unsigned(reg49)} ?
                  (^$signed(((reg49 ? reg66 : reg57) ?
                      reg60 : $signed(wire39)))) : ((wire41 > $unsigned((8'hbf))) < ({$signed(wire44),
                          ((8'hab) ? wire39 : wire37)} ?
                      reg54 : reg63[(4'hc):(3'h5)])));
              reg63 <= (($signed({$signed(wire39)}) >>> ((^~$signed(reg51)) ?
                  (((8'hab) ?
                      (8'hbb) : reg49) | $unsigned((8'haa))) : $signed($signed(wire38)))) ^~ wire50[(3'h6):(3'h5)]);
            end
          reg67 <= $unsigned(((((reg57 ? wire39 : reg57) | $unsigned(reg57)) ?
              wire38 : (reg63 ?
                  ((8'hbb) ?
                      reg55 : (8'hbb)) : (reg64 < reg61))) ^~ $signed($unsigned(reg61))));
          reg68 <= $signed((wire42[(3'h5):(3'h4)] <= reg60));
        end
      reg69 <= $unsigned(wire40);
    end
  assign wire70 = reg62;
  assign wire71 = reg63;
  assign wire72 = (^(~$signed($unsigned((~&reg69)))));
  assign wire73 = $unsigned(($signed(wire41) ~^ wire37[(2'h3):(2'h3)]));
  assign wire74 = $signed((-(^((reg65 < reg52) == $unsigned(reg58)))));
  assign wire75 = (+(reg58 | (((wire42 >> wire43) ? (&(8'hae)) : (&(8'hb6))) ?
                      ((&wire39) & {wire50,
                          (8'ha8)}) : {wire42[(1'h1):(1'h1)]})));
  assign wire76 = $signed((^~(reg68 * {$unsigned(reg65), {wire37, reg66}})));
  assign wire77 = ($signed((^~(((8'haf) <= wire44) ?
                      {wire76, wire37} : (reg51 ?
                          reg55 : reg65)))) && (reg68[(2'h2):(1'h1)] >> {((reg61 ?
                          reg47 : reg64) != (~wire45))}));
  assign wire78 = (wire73[(4'hf):(4'hd)] ?
                      $unsigned((reg64[(4'h9):(3'h7)] - $signed((~&reg49)))) : (-$unsigned((~|$signed(wire39)))));
  always
    @(posedge clk) begin
      reg79 <= ($signed(reg59[(1'h1):(1'h1)]) > (!$unsigned(((-reg53) ?
          (reg64 ? wire70 : (8'ha7)) : (reg56 > reg51)))));
      if (((^($unsigned({(7'h40),
          wire77}) * wire41[(1'h1):(1'h1)])) <= (~|wire71[(4'hd):(4'hc)])))
        begin
          reg80 <= $unsigned((&$signed(wire41[(3'h7):(1'h1)])));
          reg81 <= $unsigned((^({(~^wire50)} ? reg56 : {{(8'haf)}})));
          reg82 <= $signed(((reg53[(4'hc):(2'h2)] ?
                  (~|(reg51 >= wire73)) : $unsigned((~reg79))) ?
              (-((reg63 ? reg62 : (7'h42)) | $signed(wire43))) : ((&((7'h41) ?
                      wire43 : wire46)) ?
                  (wire74 ^ $unsigned(wire43)) : ((~^reg60) ?
                      (reg47 << wire70) : {(8'ha0), wire77}))));
        end
      else
        begin
          reg80 <= wire39;
          if ($unsigned($signed(wire38)))
            begin
              reg81 <= $unsigned((!$unsigned((&(wire46 < reg48)))));
            end
          else
            begin
              reg81 <= wire76;
              reg82 <= reg56;
              reg83 <= wire77;
              reg84 <= wire46[(2'h3):(1'h0)];
              reg85 <= (|$signed($unsigned({{wire71, reg58}, (~&reg57)})));
            end
          reg86 <= (($unsigned((reg58 ?
              (^(8'hbe)) : (wire73 ? (8'hb1) : reg81))) <<< ($unsigned({wire71,
              wire75}) - ((reg83 ? wire38 : reg61) & (~|wire46)))) * reg81);
          if (reg81)
            begin
              reg87 <= reg68[(1'h0):(1'h0)];
              reg88 <= (~^$unsigned(wire37[(3'h4):(2'h2)]));
              reg89 <= $unsigned($signed((~&reg56[(1'h1):(1'h1)])));
              reg90 <= $signed(($signed(((~&reg56) >= (+reg80))) ?
                  reg68 : (($unsigned(reg59) < $signed(wire72)) ?
                      {((7'h43) ? wire46 : wire37),
                          $unsigned((8'hba))} : (~&reg86[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg87 <= reg79;
              reg88 <= (!$unsigned($signed(((reg49 ?
                  wire37 : (8'had)) + (~|(8'hb5))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg91 <= (({$unsigned($unsigned(wire72))} ?
              $signed((~&reg49)) : (reg49 ^~ reg84[(3'h5):(2'h3)])) ?
          reg60[(2'h2):(1'h1)] : (^((8'hab) ?
              ({wire41, (8'had)} ? (wire42 <<< reg80) : reg87) : (~|{reg65}))));
    end
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(3'h4):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  assign y = {wire32, wire31, wire30, wire29, (1'h0)};
  assign wire29 = {wire26[(1'h1):(1'h0)], $unsigned(((~&(^~wire24)) + wire28))};
  assign wire30 = (~^({$signed($signed((8'had))), $signed(wire26)} ?
                      ((wire29 ? wire25 : $unsigned(wire27)) || ((wire24 ?
                              wire29 : wire27) ?
                          $unsigned((8'hb7)) : (wire28 ?
                              wire27 : wire26))) : (^~({wire25, (8'hb1)} ?
                          ((8'hbe) < (8'h9e)) : ((8'hb6) ? wire29 : wire27)))));
  assign wire31 = wire26[(2'h2):(1'h0)];
  assign wire32 = (($unsigned({$unsigned((8'hbc)), (&wire25)}) ^ wire25) ?
                      wire31 : wire30);
endmodule
