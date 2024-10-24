module top
#(parameter param263 = ((({{(8'hb1)}} ? (+{(8'ha0)}) : (((8'hb8) ? (8'hbd) : (8'hb7)) ? (&(8'ha1)) : ((7'h44) == (8'hb1)))) ^~ {{((8'ha7) ? (8'hbf) : (8'h9c)), ((8'h9c) ? (8'hb3) : (8'hab))}, ((|(8'ha4)) & (-(8'ha6)))}) <<< (^((((7'h44) ^ (8'h9f)) ? {(8'ha1)} : (^~(8'hac))) ? ({(8'hb4)} ? (8'ha2) : ((8'hb2) ? (8'hab) : (8'h9c))) : (((8'hab) == (8'ha0)) ? (-(8'h9e)) : ((7'h40) == (7'h41)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire262;
  wire signed [(2'h2):(1'h0)] wire261;
  wire signed [(5'h11):(1'h0)] wire259;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire262,
                 wire261,
                 wire259,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((wire1[(2'h3):(2'h3)] >> wire4[(1'h1):(1'h0)])))
        begin
          if (wire2[(2'h2):(2'h2)])
            begin
              reg5 <= wire4;
              reg6 <= $signed($unsigned((|{(~^wire1)})));
              reg7 <= ($signed((($unsigned(reg6) ?
                      $signed(wire1) : reg6) << wire1[(1'h1):(1'h1)])) ?
                  (wire0 ?
                      (wire0[(1'h0):(1'h0)] ?
                          $unsigned(wire4) : ((wire1 ? wire3 : (8'hb2)) ?
                              $signed(wire0) : {wire2, wire3})) : (-(~|{reg5,
                          wire1}))) : wire4);
            end
          else
            begin
              reg5 <= $unsigned((wire2 ?
                  {(&(wire4 ?
                          reg5 : reg5))} : $signed($unsigned((~|(8'hbb))))));
              reg6 <= reg7[(2'h2):(1'h1)];
            end
          reg8 <= $unsigned($signed((~|$signed((reg5 <= (8'hb6))))));
          reg9 <= $unsigned($unsigned(($signed((wire1 | reg6)) >>> reg5)));
          reg10 <= ((wire4[(4'hc):(2'h3)] ?
              ((wire1 ?
                  (^~wire2) : (wire0 + reg5)) <= $signed(wire0)) : $signed((~^wire1))) * reg9);
          reg11 <= reg9;
        end
      else
        begin
          reg5 <= (~reg8);
          reg6 <= $signed((8'ha6));
          if ($unsigned((!$unsigned(reg6))))
            begin
              reg7 <= ($unsigned(({((8'ha9) ? reg10 : (8'h9d)),
                      {reg11}} * (!reg7[(4'h9):(4'h9)]))) ?
                  $unsigned(($unsigned($signed(reg7)) ^ $unsigned((reg7 ?
                      (8'h9e) : wire4)))) : $unsigned(wire1));
              reg8 <= ((reg6[(3'h7):(2'h3)] ?
                  wire0 : reg6) & $unsigned(({reg9[(1'h1):(1'h0)],
                  $signed(reg6)} <= $unsigned(reg5[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg7 <= reg11;
              reg8 <= $unsigned(($unsigned((8'hb0)) ?
                  (|$unsigned(reg9[(2'h2):(1'h1)])) : (((~reg10) ?
                          (~wire0) : wire3) ?
                      $unsigned({(8'ha3)}) : reg8[(2'h2):(1'h0)])));
              reg9 <= $unsigned({$unsigned(reg8),
                  ($signed($signed(reg8)) <<< (8'ha7))});
              reg10 <= wire2[(2'h3):(1'h0)];
            end
          reg11 <= reg6;
          if ($unsigned(((reg7 == {(reg11 > (8'ha6)), reg7[(5'h10):(5'h10)]}) ?
              $unsigned(wire3) : (((reg11 <<< reg8) >> reg5) ^~ ((+reg7) | (^~wire0))))))
            begin
              reg12 <= (^~wire3);
              reg13 <= {reg7};
              reg14 <= ((^~(!{(wire4 <<< reg6), reg5[(3'h4):(1'h1)]})) ?
                  wire0[(1'h1):(1'h0)] : ((8'ha2) ?
                      ((8'hb9) ?
                          $signed($unsigned((8'h9e))) : $signed((wire4 - wire1))) : (~^{wire3[(4'h8):(3'h4)],
                          $signed((8'hba))})));
              reg15 <= $unsigned({$unsigned((wire4[(3'h7):(3'h6)] ?
                      $unsigned(wire0) : (+(8'hac))))});
              reg16 <= (+(!(reg5 || $unsigned((reg10 ^ reg7)))));
            end
          else
            begin
              reg12 <= $unsigned(reg7[(3'h4):(2'h3)]);
            end
        end
      reg17 <= ((!(wire1 <= ({wire2, reg6} ?
          reg6[(4'h8):(2'h2)] : $unsigned(wire4)))) * reg11[(4'hb):(2'h2)]);
      reg18 <= (reg12 ~^ wire2);
      reg19 <= reg14[(3'h5):(3'h5)];
      reg20 <= wire0[(3'h4):(2'h3)];
    end
  assign wire21 = ((!(wire1[(2'h3):(1'h1)] ?
                      $signed($unsigned(wire0)) : reg20)) >= (^~reg17[(1'h1):(1'h1)]));
  assign wire22 = {((reg13[(4'h8):(1'h1)] ?
                          reg18[(3'h5):(2'h3)] : (-$unsigned(wire2))) < (-((reg16 ?
                          (8'hbf) : reg12) | $unsigned(reg7))))};
  assign wire23 = {wire2[(2'h2):(2'h2)], (!$signed((8'hab)))};
  assign wire24 = reg20;
  assign wire25 = (~^($signed((^{(8'hbd)})) ?
                      (wire0[(4'he):(3'h4)] + (wire22 | $signed((7'h41)))) : $unsigned($signed(reg13[(3'h5):(2'h3)]))));
  module26 #() modinst260 (wire259, clk, reg17, reg19, wire2, wire4);
  assign wire261 = (reg14[(1'h0):(1'h0)] ?
                       $unsigned(reg14) : {((8'hbe) ?
                               {$signed(reg17)} : (^(wire1 <= reg15))),
                           $unsigned({(reg8 ? reg17 : wire259), (+reg17)})});
  assign wire262 = reg10;
endmodule

module module26
#(parameter param258 = ((&((((8'hab) & (7'h41)) | ((8'h9f) ? (8'ha8) : (8'hb0))) || (8'hb3))) * (7'h43)))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h24e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire256;
  wire [(3'h5):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  reg signed [(5'h13):(1'h0)] reg196 = (1'h0);
  reg [(3'h6):(1'h0)] reg195 = (1'h0);
  reg [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(3'h5):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg191 = (1'h0);
  reg [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  assign y = {wire256,
                 wire197,
                 wire167,
                 wire96,
                 wire95,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg196,
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
                 reg171,
                 reg170,
                 reg169,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire31 = (-(((wire27 + $signed(wire30)) * $signed((+wire28))) ?
                      {wire27} : $signed((&wire30))));
  assign wire32 = wire30[(1'h1):(1'h0)];
  assign wire33 = (8'ha4);
  assign wire34 = ($unsigned((!wire31)) ?
                      $unsigned(($signed({wire33}) <= $signed($unsigned(wire33)))) : (wire32 ?
                          (^($unsigned(wire28) ?
                              wire29[(4'hf):(1'h1)] : (wire28 ?
                                  wire27 : wire29))) : $unsigned((wire33 ?
                              wire27[(1'h1):(1'h1)] : $signed(wire27)))));
  assign wire35 = $signed({wire27[(2'h2):(2'h2)]});
  assign wire36 = (^(~&($unsigned(wire30[(2'h3):(2'h3)]) ?
                      wire34 : ((~|wire33) != wire34))));
  module37 #() modinst87 (wire86, clk, wire28, wire35, wire30, wire36);
  assign wire88 = $unsigned((~|(($unsigned(wire86) ?
                          $unsigned(wire36) : ((8'hb0) ? wire33 : wire30)) ?
                      wire28[(2'h2):(1'h1)] : ((wire32 || wire34) >>> wire29))));
  assign wire89 = ($unsigned(wire29[(4'h8):(2'h2)]) >> wire30[(3'h5):(1'h0)]);
  assign wire90 = ((-$signed($unsigned(wire36[(5'h13):(5'h12)]))) << (~|{wire36[(2'h3):(2'h3)],
                      wire30[(1'h1):(1'h1)]}));
  assign wire91 = ({(~|(~^wire89))} ? (~|wire30) : wire30[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg92 <= ($unsigned((wire33 ?
              ((wire89 >>> wire91) >>> wire36) : wire29[(5'h10):(3'h4)])) ?
          wire35 : (!wire29[(4'hb):(4'hb)]));
      reg93 <= $signed($unsigned(($unsigned($unsigned(wire36)) && wire32)));
      reg94 <= (($unsigned(wire34[(4'hc):(2'h3)]) ?
          (((wire89 ? reg93 : reg92) >= {wire34, wire33}) ?
              $signed($signed(wire33)) : wire89[(3'h7):(1'h1)]) : ((~&(~^(8'ha2))) <= ((wire88 ?
                  (8'hbf) : reg93) ?
              $signed(wire32) : (wire29 ?
                  reg92 : wire30)))) >>> (-$signed({wire36, wire31})));
    end
  assign wire95 = wire28;
  assign wire96 = $unsigned(wire32);
  module97 #() modinst168 (.wire98(wire34), .wire100(wire91), .wire99(reg94), .y(wire167), .clk(clk), .wire101(reg92));
  always
    @(posedge clk) begin
      if (((+wire34) ?
          ($signed($signed(wire33[(2'h3):(1'h1)])) & ($unsigned((wire36 ?
                  wire86 : wire167)) ?
              {$signed(wire89),
                  ((8'hb2) & reg94)} : (~$signed(wire27)))) : {(-(+(&wire34))),
              ($unsigned(wire86) ?
                  (|(wire36 * wire90)) : ((~wire29) ?
                      $signed(wire29) : $signed(wire89)))}))
        begin
          if ((wire89[(3'h6):(1'h0)] ~^ $unsigned((wire30 - ((|wire32) ?
              (-wire27) : {wire90})))))
            begin
              reg169 <= $signed(reg92[(4'hb):(4'h9)]);
            end
          else
            begin
              reg169 <= $unsigned((wire35[(5'h10):(3'h4)] <= (({wire96} ?
                  ((8'hb5) <= wire36) : $signed(reg169)) <<< ({wire36,
                  wire167} >> {wire34}))));
              reg170 <= {($unsigned(wire36) >> {(((7'h40) ? wire90 : (8'ha9)) ?
                          {(8'ha7), wire36} : (wire35 || wire167)),
                      wire35})};
              reg171 <= (~|wire86);
              reg172 <= wire28;
            end
          reg173 <= reg92[(5'h10):(4'hc)];
          reg174 <= wire33;
          reg175 <= $signed($signed($signed(($unsigned(wire33) ?
              $signed(wire27) : (~^reg171)))));
        end
      else
        begin
          if ((8'hb5))
            begin
              reg169 <= $signed((&$signed(wire90[(1'h1):(1'h0)])));
              reg170 <= {wire27[(1'h1):(1'h1)],
                  (wire35[(2'h2):(1'h1)] * (!((wire91 ?
                      (8'ha1) : wire34) - reg169)))};
              reg171 <= ({$unsigned(((reg169 << wire29) ?
                          (8'hb1) : (reg174 ? wire89 : reg92)))} ?
                  $unsigned(wire91[(1'h1):(1'h1)]) : wire30[(3'h5):(2'h3)]);
              reg172 <= reg93;
              reg173 <= (8'hba);
            end
          else
            begin
              reg169 <= $unsigned(wire95[(2'h2):(2'h2)]);
              reg170 <= (wire167 ^~ (|$unsigned((8'ha1))));
              reg171 <= wire167;
            end
          reg174 <= $unsigned(wire29[(4'hd):(4'h9)]);
        end
      if (wire86)
        begin
          if (wire88[(3'h5):(3'h4)])
            begin
              reg176 <= reg94;
              reg177 <= {$signed($unsigned(((wire28 ? wire34 : reg174) ?
                      ((8'hb1) ? wire86 : wire32) : (wire30 >= (8'ha1)))))};
              reg178 <= (!(($signed($unsigned(wire30)) + (((8'ha6) ?
                      wire29 : wire30) ?
                  $signed(reg176) : reg172[(1'h0):(1'h0)])) && (((wire34 == reg93) + ((8'hb0) ?
                  wire36 : reg173)) >> (((8'hb6) & reg93) || wire33))));
            end
          else
            begin
              reg176 <= wire34[(2'h3):(1'h1)];
            end
          if (((($unsigned((wire29 - (8'hab))) & {$unsigned((8'ha4))}) != {{$signed(wire88)}}) == (($signed($unsigned(reg94)) | (-(!reg174))) | $unsigned((|wire88)))))
            begin
              reg179 <= (((wire91 > $unsigned((reg169 & wire31))) ?
                  $signed({$unsigned(wire86),
                      $unsigned(reg176)}) : $signed($unsigned((wire36 == wire86)))) ^ $signed({wire86,
                  wire96[(4'h8):(3'h6)]}));
              reg180 <= (reg174[(4'ha):(4'h8)] >= $signed($signed(wire36)));
              reg181 <= ((~(|$signed(wire96))) ^ $unsigned(wire32[(4'h9):(4'h8)]));
              reg182 <= wire33[(4'h8):(1'h1)];
            end
          else
            begin
              reg179 <= $signed($unsigned({reg93, (8'hb5)}));
              reg180 <= (reg177 || {$signed(wire28),
                  (reg92 ?
                      $unsigned(reg170[(1'h0):(1'h0)]) : ((wire167 << reg93) ^ (reg170 || wire167)))});
              reg181 <= (^~reg94);
              reg182 <= $unsigned((~^$unsigned({$unsigned(reg170), {reg176}})));
              reg183 <= reg176[(4'hc):(2'h2)];
            end
          if (({$signed((!(~|wire86))), (!wire34)} + {wire95[(2'h3):(2'h2)]}))
            begin
              reg184 <= $signed($signed($unsigned($signed($unsigned(wire91)))));
              reg185 <= reg184[(1'h0):(1'h0)];
              reg186 <= reg169;
            end
          else
            begin
              reg184 <= reg179;
              reg185 <= (8'hb9);
            end
        end
      else
        begin
          reg176 <= reg175;
          reg177 <= $signed($signed(reg184));
          reg178 <= (~|$unsigned((7'h41)));
          reg179 <= $signed((wire86 + (^~($unsigned(reg94) ?
              $signed(wire31) : $unsigned(reg183)))));
          reg180 <= $signed(wire88[(2'h3):(1'h1)]);
        end
      reg187 <= (8'hb5);
      reg188 <= (^~((|reg173) ~^ $unsigned((((8'ha1) < (8'hab)) + (reg182 ~^ (8'hb1))))));
      if ($signed($unsigned(($unsigned(wire31[(1'h0):(1'h0)]) ?
          {(reg183 ? reg172 : wire27),
              (reg171 & reg183)} : ($unsigned((8'hb8)) ?
              $unsigned(wire33) : wire27)))))
        begin
          reg189 <= reg173[(2'h2):(1'h0)];
          if ((~&wire30[(3'h4):(3'h4)]))
            begin
              reg190 <= {(&((((8'ha3) | reg172) ?
                          (reg170 + reg93) : wire31[(2'h2):(2'h2)]) ?
                      ((reg171 ? (8'ha9) : (8'hab)) ?
                          $signed(wire88) : $signed(wire89)) : $signed(wire27)))};
              reg191 <= ((&(7'h40)) >>> {$unsigned({reg189[(3'h7):(3'h7)]}),
                  ({(wire90 >>> wire90), wire27[(2'h2):(1'h1)]} ?
                      $signed({wire90}) : (wire90 == reg171))});
              reg192 <= (($signed(reg191) >= (($unsigned(reg189) + reg191) ?
                      ($signed(reg186) && {(8'hae), reg185}) : ((|reg191) ?
                          (wire167 << wire28) : ((8'hbf) <<< wire88)))) ?
                  {reg190} : ($unsigned({(reg182 == reg178),
                      $signed(wire30)}) <<< (($signed(reg171) >>> (wire91 == (8'hb9))) >>> (wire32[(3'h4):(3'h4)] ?
                      reg191 : $unsigned(reg191)))));
            end
          else
            begin
              reg190 <= (~|$unsigned(($unsigned((wire27 || reg174)) == wire34)));
              reg191 <= $unsigned($signed((($unsigned(reg189) ?
                      reg181 : (8'hb8)) ?
                  $unsigned($signed((8'hbf))) : $unsigned(wire33[(1'h0):(1'h0)]))));
              reg192 <= (~&reg189[(3'h5):(1'h0)]);
            end
          if ($signed((7'h41)))
            begin
              reg193 <= (^({({reg191} < $signed((8'ha6))), {$signed(reg94)}} ?
                  reg173 : $signed($unsigned((wire91 ? wire89 : wire95)))));
            end
          else
            begin
              reg193 <= ($unsigned((^~$unsigned($signed(reg179)))) + ($signed(({wire88} >> (wire90 != reg94))) == (!(8'h9d))));
              reg194 <= $signed($unsigned((^~reg93[(2'h2):(1'h0)])));
              reg195 <= wire86[(3'h6):(3'h5)];
              reg196 <= reg182[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg189 <= reg187[(2'h3):(2'h2)];
        end
    end
  assign wire197 = ($unsigned(wire90) ?
                       reg183[(2'h2):(1'h0)] : $signed(reg195[(1'h1):(1'h1)]));
  module198 #() modinst257 (wire256, clk, reg173, wire95, reg185, wire28);
endmodule

module module198
#(parameter param254 = (8'ha4), 
parameter param255 = ((^param254) ? param254 : param254))
(y, clk, wire202, wire201, wire200, wire199);
  output wire [(32'h256):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire202;
  input wire signed [(5'h13):(1'h0)] wire201;
  input wire [(4'hd):(1'h0)] wire200;
  input wire signed [(4'hd):(1'h0)] wire199;
  wire signed [(4'he):(1'h0)] wire247;
  wire [(3'h4):(1'h0)] wire245;
  wire [(4'h9):(1'h0)] wire244;
  wire signed [(5'h12):(1'h0)] wire243;
  wire [(3'h6):(1'h0)] wire242;
  wire signed [(5'h10):(1'h0)] wire238;
  wire [(4'ha):(1'h0)] wire237;
  wire [(4'he):(1'h0)] wire232;
  wire [(4'hb):(1'h0)] wire231;
  wire signed [(4'h8):(1'h0)] wire230;
  wire signed [(5'h14):(1'h0)] wire229;
  wire signed [(5'h12):(1'h0)] wire228;
  wire signed [(4'he):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire203;
  reg signed [(3'h7):(1'h0)] reg253 = (1'h0);
  reg [(3'h4):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg251 = (1'h0);
  reg [(3'h6):(1'h0)] reg250 = (1'h0);
  reg [(2'h2):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg246 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg241 = (1'h0);
  reg [(4'he):(1'h0)] reg240 = (1'h0);
  reg [(4'hb):(1'h0)] reg239 = (1'h0);
  reg [(4'hf):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg235 = (1'h0);
  reg [(5'h14):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg233 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg227 = (1'h0);
  reg [(5'h14):(1'h0)] reg226 = (1'h0);
  reg [(5'h14):(1'h0)] reg225 = (1'h0);
  reg [(2'h3):(1'h0)] reg224 = (1'h0);
  reg [(4'h8):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg222 = (1'h0);
  reg [(3'h4):(1'h0)] reg221 = (1'h0);
  reg [(5'h13):(1'h0)] reg220 = (1'h0);
  reg [(4'hf):(1'h0)] reg219 = (1'h0);
  reg [(3'h4):(1'h0)] reg218 = (1'h0);
  reg [(5'h10):(1'h0)] reg217 = (1'h0);
  reg [(4'hd):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg [(5'h10):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg209 = (1'h0);
  reg [(4'h9):(1'h0)] reg208 = (1'h0);
  reg [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg205 = (1'h0);
  assign y = {wire247,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire238,
                 wire237,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire204,
                 wire203,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg246,
                 reg241,
                 reg240,
                 reg239,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 (1'h0)};
  assign wire203 = (~$unsigned(wire200[(1'h0):(1'h0)]));
  assign wire204 = ($signed(($signed({wire200, (8'hb1)}) ?
                       $signed((8'hab)) : wire200[(3'h6):(2'h3)])) ^~ $signed(wire200[(4'hd):(2'h2)]));
  always
    @(posedge clk) begin
      reg205 <= ((wire202 == wire201) ?
          (-({(wire201 ? wire202 : (8'hb9))} ?
              (!wire201) : wire199[(4'hc):(3'h7)])) : wire200[(4'h9):(3'h6)]);
      reg206 <= $signed((((reg205[(3'h4):(3'h4)] - (wire199 < wire203)) ?
              {wire202[(4'hc):(4'hc)],
                  (wire200 ? wire200 : wire202)} : (^~(wire203 > (8'hb9)))) ?
          $unsigned($signed(wire199)) : ((!(|wire200)) && ((reg205 >= wire203) ?
              (wire199 <<< wire201) : {wire203, reg205}))));
      reg207 <= wire204;
    end
  always
    @(posedge clk) begin
      reg208 <= (|reg206);
      reg209 <= $signed($unsigned(((^(reg205 > wire202)) ?
          (-{reg206}) : reg206[(5'h10):(4'hf)])));
      if ({$signed($unsigned($unsigned((reg205 ? wire199 : reg206))))})
        begin
          reg210 <= (wire200[(2'h2):(2'h2)] ? wire201[(1'h0):(1'h0)] : reg208);
          if ($signed($signed((reg207[(3'h7):(3'h5)] ?
              (wire202 >> $signed((8'hb4))) : (8'hb7)))))
            begin
              reg211 <= wire201[(4'h8):(3'h6)];
            end
          else
            begin
              reg211 <= {reg210,
                  ({(reg209 ?
                          ((7'h44) || wire200) : (wire203 <<< reg209))} ~^ (wire203 ~^ $signed((&reg208))))};
              reg212 <= wire200;
              reg213 <= ($unsigned(reg212) >> (~^($signed(reg207[(3'h6):(3'h4)]) == (^$unsigned(wire201)))));
            end
          reg214 <= (~|((~{$signed(wire204),
              (&reg211)}) >> (!$signed((wire199 << reg213)))));
          reg215 <= $unsigned((-reg211[(3'h6):(3'h5)]));
          if ($unsigned(reg214))
            begin
              reg216 <= $signed({(reg207[(1'h1):(1'h1)] ?
                      $unsigned(reg215[(4'h9):(2'h2)]) : (reg206[(3'h6):(3'h4)] ~^ (wire201 <<< wire202))),
                  (({wire202} + $signed(wire200)) ?
                      (&wire201[(1'h0):(1'h0)]) : ($signed(reg212) >> (~|wire200)))});
              reg217 <= reg211[(2'h3):(2'h3)];
              reg218 <= $unsigned($signed($signed((!(wire202 ^~ reg211)))));
            end
          else
            begin
              reg216 <= $unsigned((reg218[(3'h4):(2'h3)] ~^ ($signed((~reg208)) & (^~(reg217 + reg208)))));
            end
        end
      else
        begin
          reg210 <= reg213;
          if (reg209)
            begin
              reg211 <= $signed(wire200);
              reg212 <= ((|wire202) ? wire199 : reg205[(2'h3):(1'h0)]);
              reg213 <= $unsigned($unsigned(reg206[(4'hb):(4'h8)]));
            end
          else
            begin
              reg211 <= $signed((wire199 != reg217));
              reg212 <= {reg216[(4'hc):(1'h1)]};
              reg213 <= ($unsigned((-{((8'haf) ? wire200 : (8'hae)),
                  {reg216}})) <<< (8'ha8));
              reg214 <= (8'hb8);
              reg215 <= ($signed((|($unsigned(reg211) ?
                  $signed(reg208) : (wire200 ?
                      (8'ha0) : reg213)))) & (~$signed($signed((reg205 + (8'ha4))))));
            end
          if ((!reg206[(4'hc):(3'h6)]))
            begin
              reg216 <= $signed(reg211[(1'h1):(1'h0)]);
              reg217 <= $signed(reg205[(3'h4):(1'h0)]);
              reg218 <= $unsigned(reg205[(2'h3):(1'h0)]);
              reg219 <= reg207;
              reg220 <= $unsigned($signed((8'hb4)));
            end
          else
            begin
              reg216 <= reg211;
              reg217 <= ($unsigned(((^$unsigned(reg212)) ?
                  $unsigned((|wire200)) : reg209)) >> ($unsigned(reg218) ?
                  $unsigned($unsigned(wire200)) : $unsigned(reg216)));
              reg218 <= ((~|{reg211[(4'h8):(4'h8)]}) ^ $signed((8'h9d)));
              reg219 <= $unsigned(reg220[(4'hf):(4'hf)]);
              reg220 <= wire202[(3'h5):(3'h5)];
            end
          reg221 <= $signed(reg218);
          if ($signed($unsigned(((+{(8'hb6), reg207}) >>> (^reg219)))))
            begin
              reg222 <= $unsigned(reg221[(2'h2):(1'h0)]);
              reg223 <= ($unsigned({$signed($signed(reg207)),
                  reg219}) ~^ reg209[(3'h4):(2'h2)]);
              reg224 <= wire200[(3'h6):(3'h4)];
              reg225 <= ($signed((reg215[(1'h0):(1'h0)] <<< $signed($unsigned(reg219)))) ?
                  $unsigned(reg221) : (-{reg212[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg222 <= reg220;
              reg223 <= $unsigned($signed((((|reg207) && (+(7'h43))) + ((reg214 ?
                  reg208 : reg213) ^~ $signed(reg205)))));
              reg224 <= wire199[(4'h9):(3'h4)];
              reg225 <= (reg224 ?
                  $unsigned((((reg205 ? reg211 : reg212) ?
                      $unsigned(wire201) : (reg214 != reg224)) < wire202)) : reg211[(3'h6):(2'h3)]);
              reg226 <= ($signed((~^reg223)) ?
                  ($unsigned(reg205[(4'h9):(1'h1)]) ?
                      (~|((wire202 + reg218) <<< (reg212 ?
                          reg224 : reg205))) : (reg207 ?
                          $signed($unsigned((8'hb0))) : (&reg214))) : wire201);
            end
        end
      reg227 <= reg225[(4'hc):(1'h0)];
    end
  assign wire228 = $unsigned(reg213);
  assign wire229 = $signed(wire204[(4'ha):(4'ha)]);
  assign wire230 = ($unsigned(reg205) ?
                       $signed(($unsigned((|reg212)) ?
                           $signed(reg216[(4'ha):(1'h0)]) : reg212[(2'h2):(1'h0)])) : (~wire204[(2'h2):(1'h0)]));
  assign wire231 = $unsigned((&reg205));
  assign wire232 = wire200[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      reg233 <= {(~&reg212)};
      reg234 <= (8'hbb);
      reg235 <= ((reg207[(3'h5):(3'h5)] ?
              wire204 : {({reg213} ? (reg214 < wire231) : {reg206}),
                  $unsigned($unsigned(wire202))}) ?
          ((^$signed($signed((8'hb1)))) + $unsigned(wire231[(4'h9):(4'h8)])) : (~(reg225[(2'h3):(2'h3)] > $unsigned(reg210))));
      reg236 <= (&wire199[(3'h6):(2'h2)]);
    end
  assign wire237 = $unsigned(wire203[(2'h3):(2'h2)]);
  assign wire238 = reg236;
  always
    @(posedge clk) begin
      reg239 <= $unsigned((~(($unsigned(reg235) | $signed(reg206)) ^ (!(~reg215)))));
      reg240 <= $unsigned($unsigned((~|{(|reg205), $signed(reg216)})));
      reg241 <= ($unsigned(({$unsigned(reg234)} ?
              reg207[(2'h2):(1'h0)] : (wire238 ^~ (^reg224)))) ?
          $unsigned($signed({$unsigned((8'hbc)),
              $unsigned(reg221)})) : {($signed({reg209,
                  wire228}) - ((reg214 >> reg213) != {wire229, reg236})),
              ({reg220[(4'ha):(2'h3)], (~|reg216)} ?
                  $signed(wire228[(3'h5):(3'h4)]) : $signed(reg217[(4'he):(4'hc)]))});
    end
  assign wire242 = ((~^(~|$signed(reg217[(2'h3):(1'h0)]))) ?
                       (&(-$signed(wire202[(3'h5):(3'h4)]))) : (^$unsigned((~(reg208 ?
                           wire231 : reg223)))));
  assign wire243 = (~|reg220[(4'hb):(4'h8)]);
  assign wire244 = wire238[(4'hf):(1'h0)];
  assign wire245 = (8'ha2);
  always
    @(posedge clk) begin
      reg246 <= ((~{reg239}) ?
          {(^reg214[(4'ha):(3'h6)])} : ((+(((8'hba) ? wire202 : reg209) ?
              (reg241 ? wire243 : reg217) : (reg205 ?
                  wire200 : reg221))) <= (^reg236[(4'ha):(3'h4)])));
    end
  assign wire247 = {$signed($unsigned(reg239))};
  always
    @(posedge clk) begin
      if ($unsigned((({wire203} >> wire228) ~^ (~wire244))))
        begin
          if ($signed(((~(&(reg224 ? reg240 : reg217))) ?
              (&reg217[(4'hf):(4'he)]) : wire230)))
            begin
              reg248 <= {(8'ha0)};
              reg249 <= $unsigned($signed((8'hb3)));
              reg250 <= wire237;
              reg251 <= $signed((wire204[(4'ha):(3'h4)] ?
                  (((~&reg241) ^~ (~^wire237)) <= reg240[(2'h3):(1'h1)]) : (~^(-(^~(8'hae))))));
            end
          else
            begin
              reg248 <= reg215;
              reg249 <= reg213;
              reg250 <= (wire200 >>> {$signed({(reg224 ? wire238 : reg211),
                      (reg233 < (8'hac))})});
              reg251 <= ({wire238} & (((|(~&reg233)) >> (reg223 ?
                      (^reg248) : $signed((8'h9c)))) ?
                  ((((8'h9e) ? wire199 : (7'h41)) > {(8'h9c)}) ?
                      {reg234[(3'h5):(2'h2)],
                          (reg249 != reg226)} : (~|(&reg212))) : ($unsigned(reg249[(1'h0):(1'h0)]) | $signed(reg216))));
              reg252 <= reg226;
            end
        end
      else
        begin
          reg248 <= reg205[(1'h0):(1'h0)];
          reg249 <= $unsigned(((|((^~wire245) ?
                  $unsigned(reg249) : wire230[(1'h1):(1'h1)])) ?
              (($signed(reg206) ^ $signed(wire201)) == $unsigned((-wire237))) : reg224));
          reg250 <= (+(&reg212[(1'h0):(1'h0)]));
        end
      reg253 <= ((-$unsigned({$signed(wire204)})) ?
          reg251[(4'h9):(2'h2)] : reg205[(4'h8):(1'h0)]);
    end
endmodule

module module97
#(parameter param166 = {(8'hae)})
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h294):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire101;
  input wire [(4'hd):(1'h0)] wire100;
  input wire [(3'h4):(1'h0)] wire99;
  input wire signed [(5'h13):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire135,
                 wire134,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire102 = wire100[(3'h4):(1'h0)];
  assign wire103 = wire102;
  assign wire104 = (~|$unsigned(($unsigned(wire100[(4'hb):(3'h6)]) ?
                       wire98 : (+wire103))));
  assign wire105 = wire102;
  always
    @(posedge clk) begin
      if (wire98)
        begin
          if ($unsigned(wire100[(4'hb):(4'ha)]))
            begin
              reg106 <= $unsigned($signed(wire100));
              reg107 <= $signed(wire98[(3'h4):(3'h4)]);
              reg108 <= (|{(wire103[(5'h12):(4'hb)] ?
                      wire105[(3'h4):(1'h1)] : $signed((&reg107))),
                  {wire98, {$unsigned(wire104)}}});
            end
          else
            begin
              reg106 <= $unsigned((^wire98[(4'he):(4'hd)]));
              reg107 <= (reg106 ? wire99 : $unsigned(reg107));
              reg108 <= wire103[(5'h11):(4'hf)];
            end
          reg109 <= reg108;
        end
      else
        begin
          if ($signed($signed((~|$signed(reg109[(4'hc):(3'h5)])))))
            begin
              reg106 <= (&($signed((~^(|reg106))) ?
                  (-(wire102[(1'h1):(1'h1)] ?
                      reg106 : (+wire103))) : $unsigned(((~&wire99) ?
                      $signed(reg107) : (!wire99)))));
              reg107 <= reg109[(4'h9):(2'h3)];
              reg108 <= reg109[(3'h4):(3'h4)];
            end
          else
            begin
              reg106 <= (~&$signed($unsigned($signed((wire101 ^ wire103)))));
              reg107 <= $signed(wire105[(3'h4):(2'h3)]);
              reg108 <= $signed(((-$signed($unsigned(reg109))) ?
                  (8'hbe) : $unsigned(((+wire103) & {reg108, wire104}))));
              reg109 <= $unsigned(reg107);
              reg110 <= ($unsigned(reg108[(4'h9):(3'h5)]) <<< reg109);
            end
          reg111 <= {reg107};
          reg112 <= (wire101 ?
              $signed((~$signed(wire104))) : {(-$signed(wire103)),
                  $unsigned(wire98[(5'h11):(4'he)])});
          if (((((|(!reg112)) <<< {{wire101}}) ~^ $signed(reg108)) >>> $signed($unsigned({(reg107 ?
                  reg106 : wire105)}))))
            begin
              reg113 <= wire101;
              reg114 <= ((($signed((^wire101)) ?
                      $signed((wire99 ?
                          wire105 : wire105)) : $unsigned($signed(wire102))) && (|$unsigned((wire99 ^ wire105)))) ?
                  $unsigned(reg111[(3'h5):(3'h4)]) : $unsigned((reg107 && {(-wire104)})));
              reg115 <= ((8'ha9) + $unsigned($signed($unsigned((~|reg110)))));
              reg116 <= (^~wire103);
            end
          else
            begin
              reg113 <= wire100;
            end
          if (wire101[(3'h5):(1'h0)])
            begin
              reg117 <= ((reg112 ?
                      reg108[(1'h1):(1'h1)] : (~wire105[(1'h0):(1'h0)])) ?
                  wire103[(5'h11):(4'hc)] : reg106);
              reg118 <= $unsigned($unsigned(wire102[(1'h1):(1'h0)]));
              reg119 <= (^(((wire105[(3'h5):(1'h0)] && {wire102}) ?
                      $signed($signed(reg114)) : $unsigned((reg113 ?
                          wire102 : wire99))) ?
                  reg114 : reg109));
              reg120 <= wire102[(2'h2):(1'h1)];
              reg121 <= (({reg115} ?
                  {$unsigned(reg119)} : {wire99[(2'h2):(2'h2)],
                      $unsigned((~|reg110))}) << ($signed((8'h9e)) ?
                  $signed((8'ha0)) : ({(^~reg111),
                      (reg119 ? reg108 : reg120)} | ((8'hbd) <<< (-reg111)))));
            end
          else
            begin
              reg117 <= ($signed((((wire101 * reg120) >>> $unsigned(wire100)) ?
                      (~reg107[(2'h3):(2'h3)]) : ($signed(reg119) << reg109[(4'h8):(2'h2)]))) ?
                  {(~reg107[(3'h5):(2'h3)]),
                      wire102[(3'h5):(3'h5)]} : $unsigned(($unsigned(wire103[(5'h10):(4'hb)]) << (~&(reg119 ?
                      wire99 : reg113)))));
              reg118 <= $unsigned($unsigned($signed($signed($signed((8'haf))))));
            end
        end
      reg122 <= reg118[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ({(!(((wire99 != reg106) ?
              (wire104 != wire102) : (!(7'h43))) == {(reg113 ?
                  (8'hb3) : wire103),
              (reg118 ? wire98 : (8'h9c))})),
          (~&(^($signed(wire98) ~^ $signed((8'hb5)))))})
        begin
          if ((8'hbb))
            begin
              reg123 <= (wire102 ?
                  $unsigned({{reg115, (&wire99)},
                      ((reg110 ?
                          reg106 : reg112) * $signed(wire98))}) : (!wire102[(3'h5):(2'h2)]));
              reg124 <= (wire98[(4'hb):(3'h4)] ^ $signed((|(&((8'hb6) - reg108)))));
              reg125 <= (&wire99);
              reg126 <= $unsigned($unsigned($signed(wire102)));
              reg127 <= $unsigned(($unsigned(($signed(wire101) & {reg112})) ?
                  $unsigned(reg113[(2'h3):(1'h0)]) : reg114));
            end
          else
            begin
              reg123 <= ((reg120[(2'h2):(1'h1)] <<< (reg125 - {$unsigned(reg124),
                  $signed((8'haf))})) != reg118[(2'h3):(2'h2)]);
              reg124 <= (^~($signed(($unsigned(wire103) ? reg116 : reg126)) ?
                  ({(reg124 ? reg107 : reg122)} ?
                      ((^~reg108) ?
                          $unsigned((8'ha9)) : {wire104}) : (reg127[(4'h9):(3'h6)] <<< reg126[(2'h2):(1'h1)])) : reg110));
              reg125 <= ($signed((-$signed((8'hb0)))) <= (~(^$unsigned((reg121 && reg112)))));
              reg126 <= $unsigned($unsigned($signed(($signed(reg119) ?
                  (wire103 + reg108) : $signed((8'h9f))))));
            end
          reg128 <= $unsigned($signed($signed(reg127[(3'h4):(2'h2)])));
          reg129 <= {reg114};
          if ((8'ha4))
            begin
              reg130 <= (8'h9c);
              reg131 <= reg122[(5'h10):(3'h4)];
            end
          else
            begin
              reg130 <= $signed($signed(wire104[(2'h2):(1'h1)]));
              reg131 <= {((($signed((8'hb0)) ?
                      (reg106 <<< reg126) : ((8'hb8) ?
                          (8'hbf) : reg115)) <<< reg123[(1'h0):(1'h0)]) >= $signed($signed((-wire104)))),
                  $signed((reg124 ?
                      wire98[(3'h6):(1'h1)] : (+$unsigned(reg125))))};
              reg132 <= reg111;
            end
        end
      else
        begin
          reg123 <= $signed($unsigned(wire98[(2'h3):(2'h3)]));
        end
      reg133 <= reg121;
    end
  assign wire134 = $signed(reg120[(2'h2):(1'h1)]);
  assign wire135 = (reg109 ?
                       $signed({$unsigned(reg122[(3'h4):(2'h2)])}) : (wire103[(5'h11):(3'h7)] >= ($signed(wire102) ~^ (reg132 ?
                           {(8'ha8)} : reg118))));
  always
    @(posedge clk) begin
      if ($unsigned({({reg111,
              (reg120 ? reg127 : reg126)} * (~|reg111[(3'h7):(3'h5)])),
          $signed($unsigned((8'hb3)))}))
        begin
          reg136 <= reg108;
          reg137 <= reg113;
          if (($signed($unsigned((+(reg125 ? reg107 : (8'hb3))))) ?
              (reg122 >> $signed($unsigned($signed(wire103)))) : (~|reg109)))
            begin
              reg138 <= $signed(wire99);
              reg139 <= reg130;
              reg140 <= $signed((~&reg126));
            end
          else
            begin
              reg138 <= (|(~^$unsigned(reg112)));
              reg139 <= reg110;
              reg140 <= $signed(reg137[(2'h2):(1'h1)]);
            end
          reg141 <= ({wire101[(4'h8):(3'h6)], {(!$unsigned(reg122))}} ?
              $signed((^$signed(reg112[(5'h11):(4'ha)]))) : $signed((wire105 ?
                  reg133 : $signed($unsigned(reg131)))));
          reg142 <= $signed(wire98);
        end
      else
        begin
          reg136 <= wire100[(3'h5):(1'h1)];
          reg137 <= $signed($signed($unsigned(wire104)));
          reg138 <= wire103[(4'hf):(3'h5)];
        end
    end
  assign wire143 = ($unsigned(reg125) ?
                       ((((-reg106) == $signed(reg118)) ?
                               (^$signed(reg128)) : ($signed(reg136) ?
                                   reg107[(4'h9):(3'h4)] : $unsigned(reg109))) ?
                           (($signed(reg117) ? wire135 : $unsigned(wire100)) ?
                               reg113[(3'h4):(1'h1)] : (~&reg125)) : (reg115[(2'h2):(2'h2)] ?
                               $unsigned({wire135}) : ({wire103} ?
                                   (reg137 ?
                                       reg106 : wire135) : $signed(reg125)))) : reg126);
  assign wire144 = $signed({{$signed(reg119[(1'h0):(1'h0)])}});
  assign wire145 = $unsigned($signed(wire98));
  assign wire146 = {(~|wire135[(1'h1):(1'h0)])};
  assign wire147 = $unsigned(reg136[(4'ha):(3'h7)]);
  assign wire148 = reg139;
  assign wire149 = $signed(wire105);
  assign wire150 = $signed(wire102[(1'h0):(1'h0)]);
  assign wire151 = reg115[(4'ha):(3'h4)];
  always
    @(posedge clk) begin
      reg152 <= reg107[(3'h7):(3'h5)];
      reg153 <= ((|(($signed(wire101) > $signed(reg152)) == $signed((reg112 ?
              wire100 : reg121)))) ?
          (($unsigned(reg120) ?
              (|(wire151 >= wire100)) : (!$unsigned(reg131))) ^~ (!wire105[(4'h9):(3'h4)])) : reg122[(4'h8):(3'h7)]);
      if ($signed(reg133))
        begin
          if ((7'h40))
            begin
              reg154 <= $signed(($signed($unsigned($signed(reg129))) << ($unsigned(wire102[(1'h1):(1'h1)]) && reg123[(1'h1):(1'h0)])));
              reg155 <= $unsigned(((|$signed(wire149)) ?
                  $signed($signed(wire102[(2'h3):(1'h0)])) : (!wire99)));
              reg156 <= $signed({{reg130}});
            end
          else
            begin
              reg154 <= $signed($signed({reg137[(2'h3):(1'h0)]}));
              reg155 <= reg139[(1'h0):(1'h0)];
              reg156 <= (~^reg153[(2'h3):(2'h3)]);
              reg157 <= (reg109 != ((^((reg154 ? reg129 : wire143) ?
                  (!reg114) : wire143)) * $signed(reg131)));
              reg158 <= reg126[(3'h5):(3'h4)];
            end
        end
      else
        begin
          reg154 <= (~|($signed(((~&reg118) == (reg127 ? wire145 : (8'ha0)))) ?
              ($unsigned(reg128[(2'h2):(1'h0)]) ?
                  (&$signed(wire135)) : wire105[(2'h2):(2'h2)]) : (wire150[(4'hb):(4'h8)] ?
                  ({wire102,
                      reg153} >>> $signed(reg109)) : $unsigned(wire150))));
          reg155 <= $signed(reg109[(3'h5):(2'h3)]);
          if (((($signed(reg141) ^~ $signed((reg126 >> (8'ha0)))) ?
                  reg124[(3'h5):(2'h3)] : ($unsigned((reg109 ?
                          (8'hba) : (8'hb9))) ?
                      ($signed((8'hbe)) ?
                          (!wire135) : (reg119 | wire149)) : (!reg109))) ?
              (^~($signed((wire101 ?
                  reg141 : reg131)) * {(8'hb2)})) : (reg157 >= $signed(wire148[(3'h7):(2'h3)]))))
            begin
              reg156 <= reg109[(4'hb):(2'h3)];
              reg157 <= (&$signed(reg122));
              reg158 <= $unsigned(((^~(|wire145)) ?
                  reg106 : {$unsigned(((7'h43) ? reg154 : reg113))}));
              reg159 <= (~|(((~^(~reg153)) ?
                  $signed(wire105[(3'h7):(1'h1)]) : wire147) >>> $signed(reg140)));
            end
          else
            begin
              reg156 <= ($unsigned({reg142[(1'h1):(1'h1)]}) && ((&$unsigned(((8'ha6) * (8'hb1)))) ?
                  reg108[(3'h7):(3'h6)] : {$unsigned($unsigned(wire100))}));
              reg157 <= $signed((reg110 ?
                  reg112[(4'hc):(3'h6)] : $unsigned(({wire135, reg140} ?
                      reg155 : reg142[(1'h1):(1'h0)]))));
              reg158 <= {reg140[(1'h1):(1'h1)]};
            end
          reg160 <= (($signed((~^wire146[(4'hd):(1'h0)])) ?
              {reg155,
                  wire105[(4'ha):(3'h4)]} : (((reg128 >>> reg114) || (~|reg141)) ?
                  ((reg131 ?
                      reg133 : reg125) - reg138) : reg130[(4'h9):(4'h9)])) || reg126);
          reg161 <= $unsigned($unsigned({$signed({(8'ha2)}),
              ((reg121 ? reg138 : reg160) ? {wire150, (7'h43)} : {reg129})}));
        end
    end
  assign wire162 = reg155;
  assign wire163 = $signed((^~reg129[(1'h0):(1'h0)]));
  assign wire164 = (~^(~&(-reg156)));
  assign wire165 = (+reg112[(4'he):(1'h1)]);
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire41;
  input wire signed [(5'h14):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire54,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire42 = wire39;
  assign wire43 = ((8'ha5) ?
                      $signed((8'hb2)) : (-{$unsigned($signed(wire41)),
                          ((~wire42) ? wire42 : $signed(wire41))}));
  assign wire44 = (((^$unsigned({wire40, wire39})) ?
                      $unsigned($unsigned($unsigned((8'ha8)))) : (|$signed($unsigned(wire40)))) & ({(&(wire42 ?
                          wire42 : wire43)),
                      (8'hb4)} & $unsigned(wire40[(2'h3):(1'h0)])));
  assign wire45 = $signed((({{wire39, (8'ha6)},
                          $unsigned(wire42)} > $signed(wire39[(2'h2):(2'h2)])) ?
                      ((7'h43) ?
                          (~|wire40[(1'h0):(1'h0)]) : (|$signed(wire42))) : (!wire40[(4'he):(3'h7)])));
  assign wire46 = (~((~$signed((~wire38))) ?
                      $signed(wire42[(3'h4):(2'h3)]) : wire40));
  assign wire47 = ($signed(wire41) ? (+wire43) : wire44[(4'hd):(3'h5)]);
  assign wire48 = $signed($unsigned(wire39[(3'h4):(3'h4)]));
  assign wire49 = wire44[(4'ha):(4'h9)];
  assign wire50 = (($signed(wire39) ?
                      $unsigned((!$unsigned((8'ha6)))) : $unsigned({wire41[(1'h1):(1'h0)],
                          (wire45 ?
                              wire48 : wire47)})) != ((~|$unsigned(wire49)) | {(wire48[(2'h2):(2'h2)] ?
                          $signed(wire48) : $unsigned(wire44)),
                      $signed((wire42 | wire47))}));
  always
    @(posedge clk) begin
      reg51 <= $signed({$unsigned(((wire42 == wire43) || wire39[(2'h2):(2'h2)])),
          ((~|wire46[(2'h2):(1'h1)]) ? $unsigned(wire50) : (~|(-(8'h9c))))});
      reg52 <= ((^{(7'h44), ($signed(wire45) & (wire50 ? wire44 : wire50))}) ?
          (!wire45) : (~|$signed(wire39[(3'h5):(2'h2)])));
      reg53 <= wire45;
    end
  assign wire54 = ((~|{(wire43[(3'h6):(2'h2)] - wire47[(3'h4):(3'h4)])}) != reg52[(5'h14):(2'h3)]);
  always
    @(posedge clk) begin
      if ((8'ha3))
        begin
          reg55 <= $unsigned((reg51[(4'ha):(1'h0)] ?
              (wire38[(5'h12):(4'hc)] & $signed(wire42[(3'h4):(2'h2)])) : (wire50 != {(wire46 <= wire47)})));
          if ((reg52[(3'h6):(2'h2)] < $signed((~&wire41))))
            begin
              reg56 <= (!(|$signed($signed($unsigned(wire42)))));
              reg57 <= (wire46[(3'h4):(2'h3)] >= (~^(reg56 <= $signed(reg52))));
              reg58 <= (wire44 ?
                  $signed(wire40[(4'hb):(1'h0)]) : ($signed(wire45[(4'h8):(2'h2)]) ?
                      (wire41[(1'h0):(1'h0)] ?
                          reg56 : $unsigned(wire48)) : wire50));
              reg59 <= $signed($signed((wire42 ?
                  wire45[(1'h1):(1'h0)] : wire42[(2'h2):(2'h2)])));
              reg60 <= wire44[(3'h4):(2'h2)];
            end
          else
            begin
              reg56 <= ((7'h40) == $unsigned((((~wire39) - (wire38 + reg60)) != wire44)));
              reg57 <= ($signed($unsigned(({(8'ha2), reg51} ?
                  $signed(reg53) : reg58))) || wire50);
            end
          reg61 <= (~^({($signed(reg59) ~^ $signed((8'hb5)))} - $signed($signed(wire50[(1'h1):(1'h1)]))));
          if (reg59[(1'h0):(1'h0)])
            begin
              reg62 <= reg52[(3'h4):(2'h3)];
              reg63 <= $unsigned((-reg51[(4'ha):(1'h0)]));
              reg64 <= (8'hab);
            end
          else
            begin
              reg62 <= ((^~(^~reg59)) | (8'h9e));
              reg63 <= reg59[(4'hf):(4'ha)];
              reg64 <= $unsigned($signed($signed(($signed(wire48) <= (wire44 ~^ wire44)))));
              reg65 <= $unsigned(((wire54[(5'h13):(4'he)] ?
                  {(reg62 ? reg55 : reg56),
                      wire39} : $signed($signed((8'hab)))) <= (~&$unsigned($unsigned(wire39)))));
            end
          reg66 <= (8'hb7);
        end
      else
        begin
          reg55 <= ((reg58[(1'h0):(1'h0)] > reg51) ?
              wire44 : ((|$signed(wire40)) ? (&reg57) : wire44));
          reg56 <= reg61;
          if ((!({reg55} >> $signed(((~^wire48) > wire42)))))
            begin
              reg57 <= (reg53[(4'hd):(4'ha)] == {reg61});
              reg58 <= $signed($signed((({wire41, reg63} ?
                      reg64[(4'hb):(4'hb)] : reg56) ?
                  (!{reg64, (8'h9e)}) : $signed((wire39 ? reg51 : reg58)))));
              reg59 <= $signed((($signed({reg57,
                      reg52}) * $unsigned((|wire45))) ?
                  (~&{(&wire39)}) : (^~$unsigned(wire48[(1'h1):(1'h1)]))));
              reg60 <= (8'ha5);
            end
          else
            begin
              reg57 <= ($unsigned($signed(reg58[(4'h9):(4'h8)])) ?
                  (wire49[(4'h9):(3'h4)] ?
                      ({$signed((8'hbb))} ^ $signed((|(8'h9f)))) : ({wire40,
                          (~wire46)} | ((^reg63) ?
                          ((8'ha4) >> (8'ha5)) : (7'h40)))) : $unsigned($unsigned(((wire47 ?
                      reg51 : wire54) && (reg61 ? wire41 : reg63)))));
            end
          if (wire54[(5'h11):(2'h2)])
            begin
              reg61 <= ($signed($unsigned({{reg63, reg64}, (8'haf)})) ?
                  $signed((^~wire39[(3'h5):(3'h4)])) : $signed($unsigned($signed(((8'ha0) ?
                      (8'hb2) : reg53)))));
              reg62 <= wire45[(2'h2):(1'h1)];
            end
          else
            begin
              reg61 <= (reg66 ?
                  (((^~wire47[(2'h3):(1'h0)]) << {(reg52 ~^ reg64),
                      $signed(reg61)}) || ({$unsigned(wire49)} ?
                      ((reg58 ? reg57 : reg51) ?
                          (reg64 >> reg65) : $signed(wire50)) : ((~^(8'ha3)) ?
                          $unsigned(wire38) : (~|reg65)))) : wire50);
              reg62 <= $signed($unsigned({wire48,
                  $signed(((8'haf) ? reg59 : reg62))}));
              reg63 <= {($unsigned((~|reg53[(4'ha):(4'h9)])) <= (~&wire39[(3'h5):(3'h5)])),
                  (~(reg64 ?
                      (!((8'hac) || wire42)) : ((-(8'ha3)) == (reg56 - (8'hac)))))};
              reg64 <= $signed(reg56[(4'hb):(1'h1)]);
              reg65 <= reg64;
            end
        end
      reg67 <= reg59;
      if ($signed((^$signed({(reg59 != wire45), $signed(wire54)}))))
        begin
          reg68 <= reg66;
        end
      else
        begin
          if (wire38[(5'h12):(4'hf)])
            begin
              reg68 <= $unsigned((&$signed(reg68)));
            end
          else
            begin
              reg68 <= $unsigned($signed(((wire54 ?
                      (reg68 ? wire47 : reg61) : (reg65 <= reg58)) ?
                  ($unsigned(reg53) <= {(8'hb5)}) : wire48[(1'h1):(1'h1)])));
              reg69 <= (~(~^(($unsigned(wire54) ?
                      $unsigned(wire43) : (wire45 ? reg58 : wire49)) ?
                  reg68[(4'hc):(2'h3)] : $unsigned($signed(reg66)))));
              reg70 <= $unsigned((reg69 == $unsigned((|(wire54 <<< wire48)))));
              reg71 <= ((~^reg65) ?
                  $unsigned(wire54[(4'hc):(4'h9)]) : $signed((-$unsigned((~&reg66)))));
              reg72 <= (^~$signed((reg55[(4'h9):(4'h9)] ~^ {reg64,
                  (~|(8'hac))})));
            end
          reg73 <= $unsigned($signed(((((8'had) ~^ wire39) ?
              reg59 : $unsigned(wire47)) >= (~&$signed((7'h40))))));
          reg74 <= reg55[(3'h6):(2'h2)];
          reg75 <= (8'ha6);
        end
    end
  assign wire76 = {(wire40 ? (8'hbe) : wire44)};
  assign wire77 = (-$signed(wire48));
  assign wire78 = ($signed((reg62[(1'h0):(1'h0)] > {(wire41 > reg63)})) ?
                      $unsigned(reg73) : ($unsigned((8'h9d)) ?
                          $unsigned($signed($unsigned(wire40))) : wire76[(4'h8):(2'h2)]));
  assign wire79 = ((!$signed(reg61)) ?
                      {{reg66[(1'h1):(1'h0)],
                              ($signed(wire45) + reg71[(1'h1):(1'h1)])},
                          wire49[(3'h7):(3'h6)]} : ((wire46[(2'h3):(2'h2)] ?
                              ((reg66 ?
                                  wire47 : reg55) << {wire50}) : ((reg69 + reg52) && (reg62 + (8'ha3)))) ?
                          (+reg75[(3'h7):(3'h7)]) : wire49));
  assign wire80 = {$signed(({(8'ha3), reg68} ?
                          ((&reg51) ?
                              (reg73 > reg67) : (reg57 ?
                                  reg71 : wire54)) : reg66))};
  assign wire81 = $signed(((((reg51 ? reg66 : (8'h9c)) || $signed((8'had))) ?
                      (wire46 + reg55[(4'hb):(3'h7)]) : ($signed(wire39) ?
                          {reg51,
                              wire54} : reg52[(1'h1):(1'h0)])) ^~ reg69[(1'h0):(1'h0)]));
  assign wire82 = (reg52[(4'hf):(4'h9)] ^ $signed(wire78));
  assign wire83 = (~|$signed($signed(((reg52 ? (8'hb3) : reg68) ?
                      reg60[(1'h1):(1'h0)] : $signed(wire54)))));
  assign wire84 = {$unsigned(((~|(wire77 >>> wire42)) >> wire78)),
                      wire50[(2'h2):(1'h0)]};
  assign wire85 = reg73[(1'h0):(1'h0)];
endmodule
