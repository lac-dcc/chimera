module top
#(parameter param222 = ({(((8'hb4) ? {(8'ha5)} : ((8'hbe) ? (8'hb3) : (8'hb4))) - (((8'hac) * (8'ha6)) << {(8'hbe)}))} >= ((((~&(8'haf)) || ((8'hb9) ? (8'ha9) : (8'hbf))) != {{(8'ha9)}, {(8'hbf)}}) >>> (({(8'ha6), (7'h40)} && ((7'h44) ? (8'had) : (8'hba))) << (((8'ha0) > (8'hbc)) ? (8'ha8) : ((8'hb9) << (8'ha1)))))), 
parameter param223 = {param222})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire221;
  wire signed [(5'h10):(1'h0)] wire220;
  wire [(5'h15):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire191;
  wire signed [(3'h5):(1'h0)] wire190;
  wire signed [(4'hd):(1'h0)] wire189;
  wire signed [(5'h11):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire186;
  reg [(3'h6):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg218 = (1'h0);
  reg [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg216 = (1'h0);
  reg [(5'h13):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg214 = (1'h0);
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg211 = (1'h0);
  reg [(4'hf):(1'h0)] reg208 = (1'h0);
  reg [(5'h15):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg201 = (1'h0);
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(3'h7):(1'h0)] reg199 = (1'h0);
  reg [(4'he):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(4'he):(1'h0)] reg192 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire210,
                 wire209,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire5,
                 wire186,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
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
                 reg22,
                 (1'h0)};
  assign wire5 = $signed((((&wire0[(1'h1):(1'h1)]) << ((wire1 & wire0) || wire0[(4'h8):(3'h5)])) << wire1[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ((~$unsigned((!($signed(wire5) ? (^wire3) : (-(8'hb4)))))))
        begin
          reg6 <= {$signed($signed(wire1[(2'h2):(1'h0)]))};
          reg7 <= $unsigned(($signed(wire4[(1'h1):(1'h1)]) ?
              (($signed(wire1) ?
                      ((8'h9d) ? wire5 : wire2) : (reg6 ? wire1 : wire0)) ?
                  wire3 : $unsigned((^~wire1))) : $signed(wire5)));
          reg8 <= (^~{(reg7 ?
                  ({wire1} ?
                      ((7'h41) > wire4) : $unsigned(wire3)) : $signed(((8'ha2) ?
                      wire1 : wire3)))});
          if ((reg8 ? reg6 : wire0[(3'h5):(2'h2)]))
            begin
              reg9 <= wire1[(2'h2):(1'h1)];
              reg10 <= reg8;
              reg11 <= wire4;
              reg12 <= {$unsigned(((((8'h9e) ? wire4 : reg10) ?
                      reg6 : $signed(wire4)) & (((8'ha6) ?
                      wire5 : (8'hab)) ~^ (^~reg7)))),
                  (8'hba)};
              reg13 <= $signed((($unsigned($signed(reg12)) ?
                  $signed(reg7[(5'h10):(4'hd)]) : $signed((-(8'hb3)))) > $signed(($unsigned(reg6) > reg11[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg9 <= (+reg11[(1'h1):(1'h0)]);
              reg10 <= ({$signed((+(8'hab))),
                  $unsigned(($unsigned(wire3) | reg10[(4'he):(2'h2)]))} != reg11[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          if ((wire4[(5'h13):(3'h6)] & (8'hac)))
            begin
              reg6 <= {({(wire4[(5'h10):(4'hc)] & reg7),
                          $unsigned(reg6[(3'h4):(2'h2)])} ?
                      (^~(wire5[(3'h4):(1'h1)] - wire1[(2'h2):(1'h0)])) : $unsigned($signed(reg13[(5'h10):(3'h5)])))};
              reg7 <= reg8[(3'h5):(1'h0)];
            end
          else
            begin
              reg6 <= {(reg9[(2'h2):(1'h1)] ?
                      reg7 : $unsigned({{(8'ha1)}, (reg7 ? (8'hbc) : wire2)}))};
              reg7 <= {{{reg6}, reg11[(1'h0):(1'h0)]}};
              reg8 <= wire3;
            end
        end
      reg14 <= $signed((!(reg9 ~^ $unsigned((8'ha1)))));
      reg15 <= (7'h40);
      if (reg13)
        begin
          reg16 <= wire0[(1'h1):(1'h1)];
          if (reg8)
            begin
              reg17 <= wire5;
              reg18 <= reg17;
              reg19 <= (-(wire4[(3'h6):(2'h2)] ^~ (wire5[(3'h5):(1'h0)] ?
                  (((8'ha7) ? (8'hb2) : wire4) ?
                      $unsigned(wire5) : $unsigned(wire2)) : (~$signed(reg14)))));
              reg20 <= (~(~^((reg7 ? $unsigned(reg10) : reg14) ?
                  reg7 : wire1[(2'h2):(1'h1)])));
            end
          else
            begin
              reg17 <= ($unsigned($signed((((8'hb8) << wire5) < (wire1 < wire2)))) && ($signed((8'hbe)) ?
                  $unsigned(reg7[(4'ha):(4'h8)]) : reg13[(4'h9):(3'h7)]));
            end
          reg21 <= $signed($unsigned($signed((|(reg20 ? reg18 : reg15)))));
          reg22 <= $signed(reg21);
        end
      else
        begin
          reg16 <= ((7'h43) ?
              {(wire1 ? ((8'hbf) * {(8'hbc), (8'hb0)}) : $unsigned(reg18)),
                  $signed(reg8[(3'h6):(1'h0)])} : $signed($unsigned($unsigned((wire4 ?
                  reg14 : reg10)))));
          reg17 <= ({$unsigned((|((7'h41) ^~ reg20))),
                  $unsigned({(wire5 ? reg6 : reg20)})} ?
              $unsigned($signed(wire5[(3'h5):(2'h2)])) : $unsigned((reg17 > {reg12[(5'h14):(4'h9)]})));
          reg18 <= (8'haa);
        end
    end
  module23 #() modinst187 (wire186, clk, wire3, reg6, reg9, reg10);
  assign wire188 = reg20[(1'h0):(1'h0)];
  assign wire189 = $signed((wire1 * reg22[(2'h3):(2'h3)]));
  assign wire190 = reg13;
  assign wire191 = ($signed(reg7[(1'h0):(1'h0)]) || wire190[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      if (((reg20 ?
          wire4 : ($unsigned((reg12 ?
              reg22 : reg13)) >> reg20)) ^~ $signed((^~(~^$signed(wire3))))))
        begin
          reg192 <= (~&((wire190[(2'h2):(1'h0)] << reg13[(3'h6):(3'h5)]) ?
              $signed(($signed((8'ha4)) ? {reg6} : $unsigned(reg16))) : reg12));
          reg193 <= wire191;
          if (wire1)
            begin
              reg194 <= reg193;
              reg195 <= ({(~^reg15), $signed({((8'hb3) - wire191)})} ?
                  (8'hbc) : reg19);
              reg196 <= reg14;
              reg197 <= {$unsigned(($signed($unsigned(wire188)) | wire2[(3'h6):(1'h0)]))};
              reg198 <= $unsigned(reg192[(4'hc):(4'h8)]);
            end
          else
            begin
              reg194 <= $signed(reg196);
              reg195 <= $signed(reg197);
              reg196 <= (~^$unsigned(wire3));
              reg197 <= reg198[(3'h6):(1'h1)];
              reg198 <= $unsigned($signed((~&{wire190[(3'h4):(2'h3)]})));
            end
        end
      else
        begin
          if ($signed(reg16[(2'h3):(2'h2)]))
            begin
              reg192 <= (~&(~|(8'had)));
              reg193 <= (~&(^~(~&reg7)));
              reg194 <= (wire5 ?
                  $signed(($unsigned({(7'h41), wire4}) + reg7)) : (|reg10));
              reg195 <= {((~|$signed((reg9 <<< reg192))) || $signed(($unsigned((8'h9c)) ?
                      $unsigned(wire186) : (wire4 ? reg13 : reg17)))),
                  reg20};
              reg196 <= $signed((|((reg18[(2'h3):(1'h0)] ?
                  (+(8'hb2)) : $unsigned(reg198)) | $unsigned($unsigned(reg13)))));
            end
          else
            begin
              reg192 <= reg20;
              reg193 <= (reg7 ?
                  $signed($signed((|reg6[(4'hd):(3'h5)]))) : $signed(wire4));
            end
          reg197 <= wire3[(2'h2):(1'h1)];
        end
      reg199 <= (~|($signed($signed($signed(wire3))) ?
          (-$signed(reg10)) : reg194[(3'h5):(2'h3)]));
      if ((wire5[(2'h3):(1'h0)] ?
          (((~^(reg20 ? reg16 : (8'hb2))) ?
              reg11 : $signed($signed(reg194))) < $signed($unsigned((~(8'hb1))))) : reg19[(2'h3):(2'h3)]))
        begin
          reg200 <= $signed($signed($unsigned(reg7[(3'h6):(3'h5)])));
          reg201 <= wire1;
          reg202 <= $signed(reg15);
        end
      else
        begin
          if ((({(!wire191)} || $signed(reg195[(2'h2):(1'h0)])) ?
              reg21[(1'h0):(1'h0)] : $unsigned($unsigned($signed({reg197})))))
            begin
              reg200 <= (~^reg12);
            end
          else
            begin
              reg200 <= $signed(reg192[(1'h1):(1'h1)]);
              reg201 <= reg15[(3'h6):(1'h1)];
              reg202 <= wire0;
              reg203 <= (|(~&reg192));
            end
          reg204 <= reg9;
          reg205 <= $signed($unsigned(wire190));
          reg206 <= (8'hb4);
        end
      reg207 <= ($unsigned(($unsigned($signed((7'h40))) != (wire191 >= reg200[(3'h6):(2'h2)]))) - $signed(reg195[(2'h2):(1'h0)]));
      reg208 <= (^(8'ha9));
    end
  assign wire209 = ({$unsigned(reg193[(3'h4):(3'h4)])} ~^ $signed($signed(reg207)));
  assign wire210 = $signed((+{(reg201 ? $signed(reg205) : $unsigned(reg10)),
                       {(reg8 ? (7'h44) : reg193)}}));
  always
    @(posedge clk) begin
      reg211 <= (!reg200);
      reg212 <= {reg196[(4'h8):(3'h7)]};
      if (((8'haf) << {$unsigned((^~$signed(reg16))), reg12[(4'hf):(2'h2)]}))
        begin
          reg213 <= {reg204[(3'h4):(1'h0)],
              $signed($signed($unsigned((reg206 ? wire0 : reg205))))};
        end
      else
        begin
          reg213 <= $signed((~&reg19[(4'hd):(4'h9)]));
          reg214 <= $unsigned(($unsigned($signed({wire209,
              reg197})) | reg208[(4'hc):(4'hb)]));
          if ($unsigned((((~reg198[(1'h1):(1'h0)]) ?
              reg200 : reg20[(3'h4):(2'h2)]) & reg10)))
            begin
              reg215 <= $signed(({$unsigned($signed(reg202)),
                      $unsigned(reg8[(3'h6):(3'h5)])} ?
                  ((~|reg7[(4'hd):(2'h3)]) || ((reg206 ?
                      reg16 : reg202) >= (!wire1))) : $signed(((|wire209) ?
                      ((8'hb9) + reg212) : reg199))));
              reg216 <= ((8'hb9) ?
                  (-$signed((!(reg194 ?
                      reg206 : reg16)))) : $unsigned(($unsigned((reg195 || reg215)) >= wire5[(1'h1):(1'h0)])));
              reg217 <= $signed(((|({reg22, reg213} ? (-wire191) : reg7)) ?
                  reg201[(1'h0):(1'h0)] : reg199[(1'h0):(1'h0)]));
              reg218 <= $unsigned((!reg11[(2'h2):(2'h2)]));
            end
          else
            begin
              reg215 <= $unsigned($unsigned((^reg218)));
              reg216 <= ((reg216[(5'h10):(4'h9)] ?
                      $signed((^(!reg194))) : (&$unsigned($signed(wire5)))) ?
                  reg12[(4'he):(4'hc)] : {wire3});
            end
          reg219 <= reg213[(2'h2):(2'h2)];
        end
    end
  assign wire220 = $unsigned((wire186[(4'hc):(4'ha)] ?
                       $signed((((8'ha8) ? reg19 : (8'hb8)) ?
                           $signed((8'hb5)) : (wire1 ?
                               wire5 : reg204))) : (((wire189 ?
                           (8'hab) : reg193) >>> (~|reg194)) <<< {(reg18 >>> reg18),
                           $unsigned(wire1)})));
  assign wire221 = {(-reg206), reg195[(2'h2):(1'h1)]};
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire signed [(4'hc):(1'h0)] wire183;
  wire signed [(4'h9):(1'h0)] wire182;
  wire [(2'h2):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire74;
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(2'h3):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire163,
                 wire162,
                 wire161,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire76,
                 wire74,
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
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  module28 #() modinst75 (.wire29(wire24), .clk(clk), .y(wire74), .wire30(wire26), .wire31(wire27), .wire32(wire25));
  assign wire76 = ((-(+$signed($signed(wire24)))) ? (7'h42) : (8'hac));
  module77 #() modinst148 (wire147, clk, wire25, wire24, wire26, wire76);
  assign wire149 = $signed($signed((8'hb4)));
  assign wire150 = ((7'h42) ?
                       wire27 : $unsigned($signed($signed(wire26[(3'h4):(3'h4)]))));
  assign wire151 = wire27[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg152 <= $unsigned({(+wire26[(3'h7):(2'h2)]),
          (((wire74 ? (8'had) : wire151) || {wire24}) ?
              (~|$signed(wire151)) : ({wire25} ?
                  (~^(8'hbb)) : (wire76 - wire149)))});
      if (reg152[(3'h6):(1'h0)])
        begin
          reg153 <= (8'hb1);
        end
      else
        begin
          reg153 <= $unsigned(({$signed($signed(wire149)),
              (^~((8'hba) <= wire74))} >>> (+wire26)));
          reg154 <= wire76[(3'h7):(1'h1)];
          reg155 <= reg152[(2'h3):(2'h2)];
          reg156 <= wire149[(4'hb):(1'h1)];
          reg157 <= reg152[(1'h1):(1'h0)];
        end
      reg158 <= $unsigned($signed(((8'hb7) ~^ $signed((wire150 > wire74)))));
      reg159 <= wire24;
      reg160 <= (reg154 ? wire25 : reg159);
    end
  assign wire161 = (8'ha0);
  assign wire162 = {($unsigned(reg156) > reg156[(3'h7):(3'h7)])};
  assign wire163 = ((~{wire162}) ? (8'hb5) : reg157);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((~&$unsigned(reg160)))))
        begin
          reg164 <= (reg156[(2'h2):(1'h0)] ?
              $unsigned(($signed(wire147) && {$signed(wire76),
                  (8'hb1)})) : {reg158, $unsigned({$unsigned(reg157)})});
        end
      else
        begin
          if ($signed($unsigned((-($unsigned(reg158) ?
              (^reg157) : (~|wire163))))))
            begin
              reg164 <= {{reg153[(5'h14):(3'h4)]}};
              reg165 <= reg159[(1'h1):(1'h1)];
              reg166 <= $unsigned({(-reg158)});
            end
          else
            begin
              reg164 <= $signed($unsigned((~&{reg157})));
              reg165 <= $signed(($unsigned(wire150[(2'h2):(1'h0)]) ?
                  $signed($signed((+reg165))) : (8'hab)));
              reg166 <= (reg159 ?
                  wire151[(2'h2):(1'h0)] : ((($signed(wire163) ?
                          wire74[(1'h0):(1'h0)] : (!wire27)) && (wire74[(2'h2):(2'h2)] == (8'h9f))) ?
                      reg153[(5'h13):(5'h10)] : reg160));
            end
          reg167 <= $unsigned($unsigned(reg152[(2'h3):(2'h3)]));
          reg168 <= reg160;
          reg169 <= wire26[(3'h7):(2'h3)];
          reg170 <= (+wire27);
        end
      reg171 <= ((!reg159[(3'h5):(2'h2)]) ?
          (reg165[(4'he):(2'h3)] ?
              (^~reg158) : $signed(reg154[(4'h9):(2'h2)])) : reg165[(2'h2):(2'h2)]);
      reg172 <= ((|$signed({reg155[(4'he):(4'he)],
          (!reg152)})) < $unsigned($signed($unsigned((reg166 ?
          reg166 : reg167)))));
      if (reg171)
        begin
          reg173 <= {((+wire76[(4'ha):(2'h2)]) ?
                  wire147 : (~&$unsigned((!reg170))))};
          reg174 <= ($unsigned((wire24[(4'hb):(4'h8)] ?
                  reg167[(5'h10):(2'h3)] : (8'hae))) ?
              $signed(wire25[(4'hf):(4'ha)]) : {(8'ha8)});
        end
      else
        begin
          reg173 <= reg160;
          if (reg164)
            begin
              reg174 <= (reg164[(4'ha):(1'h0)] ?
                  $signed((~(8'hbb))) : $signed($unsigned((~reg174))));
            end
          else
            begin
              reg174 <= ({((((7'h43) ? reg167 : (8'hb2)) ?
                          ((8'hb5) ? reg165 : reg153) : (wire161 ?
                              reg164 : wire74)) ?
                      $unsigned(reg157) : (reg155 < (wire163 ?
                          (7'h43) : (8'hb5)))),
                  $unsigned(wire162[(4'h9):(2'h3)])} || (~^{wire74[(3'h5):(3'h4)],
                  (~$unsigned(reg158))}));
              reg175 <= wire162[(3'h4):(2'h2)];
              reg176 <= (((^wire24) ?
                      $unsigned(($unsigned(reg155) != (8'hb6))) : (&{(wire26 != reg171),
                          wire24[(3'h6):(1'h1)]})) ?
                  (8'ha9) : {$signed(($unsigned(reg173) <= {wire163,
                          wire162}))});
              reg177 <= wire76;
            end
          reg178 <= (wire147 ?
              ((^~reg176) + ($unsigned(reg160) << $unsigned(reg157[(2'h2):(1'h0)]))) : (~|({wire76[(4'hf):(2'h2)]} >> ($unsigned(reg157) ?
                  reg172 : reg160))));
          if (wire149[(4'hd):(1'h1)])
            begin
              reg179 <= reg152;
              reg180 <= reg170[(2'h2):(1'h0)];
            end
          else
            begin
              reg179 <= ($signed(wire74) * $signed(((8'hac) <<< (reg169[(4'h9):(4'h8)] ?
                  reg157 : $signed(reg171)))));
              reg180 <= reg165;
              reg181 <= ($unsigned($unsigned($unsigned(wire25[(4'hd):(1'h1)]))) ?
                  reg173[(3'h6):(3'h5)] : $unsigned($unsigned($unsigned($unsigned((8'hb8))))));
            end
        end
    end
  assign wire182 = ($unsigned(reg174) - (-reg168));
  assign wire183 = reg160[(2'h2):(1'h0)];
  assign wire184 = $signed(reg178);
  assign wire185 = $unsigned((|$unsigned((((8'hbf) ^~ (8'hb2)) - $unsigned(reg155)))));
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h30e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire81;
  input wire [(4'hc):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  input wire signed [(5'h12):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  assign y = {wire146,
                 wire137,
                 wire136,
                 wire135,
                 wire109,
                 wire96,
                 wire95,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg134,
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
                 reg97,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire82 = wire78;
  assign wire83 = wire80[(3'h4):(1'h0)];
  assign wire84 = (~|wire83);
  assign wire85 = (!$unsigned({{wire80, (wire78 ? wire79 : wire82)}}));
  always
    @(posedge clk) begin
      reg86 <= $signed((wire79 < $unsigned((wire80[(4'h9):(4'h8)] ?
          $unsigned(wire78) : (wire80 ? wire83 : wire82)))));
      reg87 <= wire79[(1'h0):(1'h0)];
      if ((!wire82[(2'h3):(2'h3)]))
        begin
          reg88 <= (wire85 ?
              $signed({{(8'hab), $signed(reg86)},
                  (!$signed(wire79))}) : $signed({(wire78[(3'h5):(1'h1)] ?
                      (wire81 << wire84) : wire78[(2'h2):(1'h1)])}));
          reg89 <= reg87;
        end
      else
        begin
          reg88 <= (wire81 ?
              $unsigned((~&(((8'h9c) >> (8'h9e)) == $signed(wire79)))) : ((|wire83[(5'h11):(1'h1)]) - $signed(wire79)));
          reg89 <= $signed((8'hb4));
          reg90 <= wire80[(4'h8):(2'h3)];
          if (($unsigned(wire80) == $unsigned(reg87)))
            begin
              reg91 <= wire80;
            end
          else
            begin
              reg91 <= (wire83[(2'h3):(2'h2)] ?
                  ((reg88 ?
                      ((wire80 <= reg88) ?
                          wire81[(4'hb):(4'hb)] : $signed(reg87)) : ((reg86 ?
                              wire78 : wire78) ?
                          (wire78 ?
                              reg89 : wire78) : wire81[(3'h7):(1'h0)])) ^ {reg90}) : reg86[(2'h3):(1'h0)]);
              reg92 <= $signed({({wire78} ?
                      $signed($unsigned(reg86)) : $signed((~^wire85))),
                  {reg86}});
              reg93 <= $signed($unsigned(reg86));
              reg94 <= $unsigned(({(^((8'hbf) ? reg90 : wire81))} ?
                  ((8'ha4) >>> $signed(((8'ha5) ?
                      reg90 : reg86))) : (($signed(wire81) ?
                      $signed(reg87) : (reg88 ?
                          reg92 : reg93)) - (~^(!wire81)))));
            end
        end
    end
  assign wire95 = (~({$unsigned(reg91[(1'h1):(1'h0)]), wire83} ^~ reg90));
  assign wire96 = $signed(reg91[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire79[(1'h0):(1'h0)])
        begin
          if ($unsigned($unsigned({($signed(wire78) ?
                  (-wire80) : reg94[(1'h1):(1'h0)])})))
            begin
              reg97 <= {$signed($signed($unsigned(((7'h40) + wire81))))};
              reg98 <= wire83[(1'h0):(1'h0)];
              reg99 <= (-(reg88[(5'h12):(4'hf)] << (^~(~(wire95 ?
                  wire79 : (8'h9d))))));
              reg100 <= ((-$unsigned(reg86)) ?
                  ((!wire84) ?
                      reg86[(4'h8):(3'h6)] : wire85[(2'h3):(1'h0)]) : (reg97 ?
                      wire81 : $signed(reg98[(4'he):(3'h5)])));
              reg101 <= (((&$signed($unsigned(reg86))) ?
                      $signed(({wire78} ?
                          (reg89 ?
                              reg88 : reg99) : $signed((7'h42)))) : (+$signed((wire85 ?
                          wire85 : reg97)))) ?
                  {($signed(reg88) ?
                          wire80 : ($signed((8'hb5)) <<< $unsigned(wire79)))} : ($unsigned((-$signed(reg91))) ?
                      (((~&wire80) || $unsigned(wire80)) ?
                          reg91[(2'h2):(2'h2)] : wire78) : {($signed(reg93) >> (wire79 ?
                              wire78 : reg99))}));
            end
          else
            begin
              reg97 <= (~^reg87);
            end
          if (($signed(reg94[(3'h5):(3'h5)]) < reg87[(1'h1):(1'h1)]))
            begin
              reg102 <= (~^($unsigned(reg101[(1'h0):(1'h0)]) + {(+$signed((8'hb5))),
                  $unsigned((|(8'hb3)))}));
            end
          else
            begin
              reg102 <= $unsigned(($signed(reg102) ?
                  (|wire79[(2'h2):(2'h2)]) : wire78));
              reg103 <= {(|{($signed(reg97) ^~ $unsigned((8'h9f))), reg102}),
                  ($signed((|$signed(wire80))) ?
                      reg89[(4'hc):(4'h9)] : wire84[(4'ha):(3'h7)])};
              reg104 <= (!reg86[(2'h2):(1'h0)]);
            end
          reg105 <= (!($unsigned(($signed(reg92) ?
              (+(8'haf)) : $signed((8'hbd)))) >> {reg100[(5'h12):(1'h0)]}));
        end
      else
        begin
          reg97 <= {wire81, reg92};
          reg98 <= $signed(((-(~^(&reg102))) ?
              ($unsigned({reg86}) & (reg87 && $signed(reg97))) : (~|reg97)));
          reg99 <= (~^$signed((~^((~wire83) ?
              (reg105 ? wire82 : (7'h44)) : (8'hb7)))));
          if (((^~(8'h9c)) ?
              (((-(^~wire84)) ?
                  {{wire83},
                      wire79[(1'h1):(1'h0)]} : $signed({reg98})) <= $unsigned(((reg89 >> reg91) | $signed(wire83)))) : reg99))
            begin
              reg100 <= reg89;
              reg101 <= $signed($unsigned(reg97));
              reg102 <= $unsigned(($signed($unsigned($signed(wire96))) <= $unsigned($unsigned((reg101 ?
                  wire85 : reg105)))));
              reg103 <= reg89[(3'h4):(3'h4)];
              reg104 <= wire80[(1'h0):(1'h0)];
            end
          else
            begin
              reg100 <= $unsigned(($unsigned($signed($signed(reg97))) + reg88[(3'h6):(2'h3)]));
              reg101 <= $unsigned($signed(((7'h42) >= $signed({reg88,
                  reg101}))));
            end
          reg105 <= ((7'h40) <<< (~&reg101));
        end
      reg106 <= (-$unsigned(($unsigned((^~reg89)) ?
          $unsigned($unsigned(wire79)) : (reg99[(1'h1):(1'h0)] >> reg99[(4'h8):(2'h3)]))));
      reg107 <= (~|(7'h44));
      reg108 <= wire80[(3'h6):(3'h6)];
    end
  assign wire109 = (!($unsigned(reg97[(4'h8):(2'h3)]) ?
                       {$signed(reg94[(1'h0):(1'h0)])} : wire83[(5'h10):(4'h9)]));
  always
    @(posedge clk) begin
      if ($signed(((~|((wire95 ~^ reg86) ?
          $unsigned(wire82) : (wire84 ?
              wire79 : wire78))) != $signed(reg98[(2'h2):(1'h1)]))))
        begin
          reg110 <= $signed((wire79 ? $unsigned({wire109}) : {reg99}));
          if ($unsigned(wire82))
            begin
              reg111 <= $unsigned($unsigned((^($signed(reg87) ?
                  (~|wire85) : {reg98, (8'hb9)}))));
              reg112 <= reg97;
              reg113 <= ((&$unsigned(reg108)) <= $unsigned((8'ha4)));
              reg114 <= (($signed({$signed(reg94),
                      (~|reg98)}) | $unsigned((reg90 ?
                      (~&wire83) : $signed(wire78)))) ?
                  reg111[(1'h0):(1'h0)] : reg99[(3'h7):(3'h6)]);
              reg115 <= (~&reg86[(1'h0):(1'h0)]);
            end
          else
            begin
              reg111 <= (((~^reg97[(4'hd):(4'hc)]) ?
                  ((8'hab) + (~|(8'ha7))) : wire84[(2'h2):(1'h0)]) - reg98[(4'ha):(3'h5)]);
              reg112 <= (!reg91[(2'h2):(1'h0)]);
              reg113 <= reg98[(2'h2):(2'h2)];
              reg114 <= reg93[(2'h3):(2'h2)];
              reg115 <= $unsigned((reg101[(1'h0):(1'h0)] ?
                  (((reg108 ?
                      wire109 : wire82) <= (reg106 > reg111)) | $unsigned({reg93})) : reg92));
            end
          reg116 <= (+$signed({($unsigned(reg87) ?
                  reg103[(4'hd):(1'h0)] : $unsigned(reg100)),
              reg112[(4'h8):(2'h2)]}));
        end
      else
        begin
          if ((wire79 ?
              wire83[(1'h1):(1'h0)] : (wire83 ?
                  (($unsigned(reg93) ?
                      (7'h41) : (reg115 ?
                          reg108 : reg94)) <= wire85) : {$signed(((8'hb2) ?
                          reg93 : reg116)),
                      ((~reg87) < {wire96})})))
            begin
              reg110 <= (wire78[(5'h10):(4'ha)] ?
                  (reg86[(3'h6):(2'h2)] * $signed(reg104)) : (^reg100));
              reg111 <= $signed(reg89);
              reg112 <= $signed({($unsigned(wire96) | ({reg93} * (reg88 >>> (8'hbd))))});
            end
          else
            begin
              reg110 <= wire96[(2'h3):(2'h3)];
              reg111 <= $signed((^~((^(wire81 <<< wire78)) ?
                  ($signed(reg111) ?
                      (^~wire82) : (reg89 - reg104)) : (~^(wire95 ?
                      reg115 : reg91)))));
              reg112 <= ((8'ha6) <<< $signed(reg92[(4'h8):(4'h8)]));
              reg113 <= (!wire96[(4'ha):(3'h6)]);
              reg114 <= reg103;
            end
          if (reg102[(2'h2):(1'h0)])
            begin
              reg115 <= ((&reg102) || $unsigned($signed($unsigned(reg98[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg115 <= (reg98 != $unsigned(($unsigned(wire78) != (reg111 ^ $unsigned(reg98)))));
              reg116 <= (({wire95[(1'h0):(1'h0)]} >>> $unsigned(((reg103 < reg90) ?
                      (8'hb8) : $signed((8'hb6))))) ?
                  reg93[(3'h6):(2'h3)] : (reg87 ?
                      $unsigned(reg93) : $unsigned(reg90[(1'h0):(1'h0)])));
              reg117 <= wire79;
              reg118 <= (~^wire78);
              reg119 <= reg110[(1'h1):(1'h0)];
            end
          if (((~&($signed(wire79[(1'h0):(1'h0)]) < $unsigned($unsigned(wire81)))) | {($signed((reg118 ?
                  reg112 : reg87)) != reg113),
              reg90}))
            begin
              reg120 <= (-reg118);
              reg121 <= reg104;
              reg122 <= wire83;
            end
          else
            begin
              reg120 <= reg89;
              reg121 <= {($signed({$unsigned(reg104)}) ?
                      $signed($signed(reg108[(2'h3):(1'h1)])) : (-{reg118[(4'h9):(1'h0)],
                          reg116})),
                  (({$unsigned(wire109)} ?
                      reg121[(2'h3):(2'h3)] : (|$signed(wire96))) && wire85)};
              reg122 <= ($unsigned($signed(($unsigned(reg122) ?
                      (reg112 ? reg101 : reg121) : reg90[(3'h6):(2'h2)]))) ?
                  (reg122 ?
                      $unsigned(reg100[(3'h5):(1'h1)]) : wire96[(4'hc):(1'h0)]) : (-($unsigned((~|(7'h43))) ?
                      (^(|reg98)) : (~|$unsigned(reg121)))));
              reg123 <= $unsigned((reg91 == (($signed(reg116) ?
                      (+reg90) : reg121) ?
                  ($signed(reg89) ?
                      (reg89 ? wire80 : reg110) : {reg117,
                          (7'h43)}) : (^(reg110 ? (8'hae) : reg105)))));
              reg124 <= $signed(((reg97 && (+(^reg86))) ?
                  $signed($signed((|reg119))) : reg100[(5'h13):(5'h10)]));
            end
          reg125 <= reg110[(4'hc):(2'h2)];
          reg126 <= ((reg90 ?
              (-(8'haf)) : (^~{$unsigned(wire85)})) + ((8'hbd) >= reg125));
        end
      if (((|$unsigned($signed(reg116))) >>> $signed($signed(((reg110 != wire79) ?
          reg105 : (7'h40))))))
        begin
          reg127 <= {wire95[(1'h1):(1'h1)], reg110[(4'hc):(3'h5)]};
          reg128 <= reg102[(1'h0):(1'h0)];
          if (((|reg122[(1'h0):(1'h0)]) >= (8'hab)))
            begin
              reg129 <= (reg94[(2'h3):(1'h0)] ?
                  (~|{(wire78 ?
                          (^~reg115) : reg87)}) : $signed(reg121[(3'h7):(3'h6)]));
            end
          else
            begin
              reg129 <= $unsigned(wire83[(4'he):(3'h4)]);
              reg130 <= (((8'ha5) ^ reg112[(4'hb):(2'h3)]) ?
                  $signed(((-$unsigned(reg104)) ?
                      (^~wire78) : (reg89[(3'h5):(3'h5)] ?
                          $unsigned(reg125) : wire109[(1'h1):(1'h1)]))) : reg107[(3'h7):(3'h7)]);
              reg131 <= $signed((reg128 ?
                  $signed(reg88[(1'h0):(1'h0)]) : $signed(((~&reg124) ?
                      (wire80 ? (8'hba) : reg123) : $unsigned(reg126)))));
            end
        end
      else
        begin
          reg127 <= (&$signed(({(wire85 > reg99),
              reg121[(4'hb):(2'h3)]} | reg125[(4'hb):(3'h4)])));
          if ((wire109[(2'h2):(1'h0)] ?
              (|(&(reg111 <= $unsigned(reg90)))) : ($signed((!((7'h42) ^~ wire95))) ?
                  (&$unsigned((wire80 ?
                      reg99 : reg119))) : (^$signed(wire96)))))
            begin
              reg128 <= (!reg94[(3'h6):(3'h6)]);
              reg129 <= {(&(((!reg122) > $unsigned(reg107)) ?
                      reg110 : $signed(wire95))),
                  wire109};
              reg130 <= (^~$unsigned((((wire78 != reg119) == reg102[(2'h3):(1'h1)]) + $signed((reg94 - reg99)))));
            end
          else
            begin
              reg128 <= (+wire79[(2'h2):(1'h1)]);
              reg129 <= ($signed(wire83[(3'h5):(3'h4)]) == {reg111,
                  $unsigned((~^wire95))});
            end
        end
      reg132 <= (($unsigned(reg103) & {$unsigned($unsigned(wire95)),
          ($signed(reg100) ? {wire83, reg124} : (^reg131))}) + reg118);
      reg133 <= $signed($signed(reg110[(3'h5):(1'h0)]));
      reg134 <= {{(($signed(reg132) | $signed(reg114)) < (reg123[(3'h4):(3'h4)] || reg111))}};
    end
  assign wire135 = (($signed(reg92) | reg130[(4'he):(4'h8)]) ?
                       ($unsigned((|(~|reg123))) ?
                           $signed($unsigned(reg93[(3'h4):(2'h3)])) : ((-$unsigned(reg114)) ?
                               ((~^reg107) ?
                                   $unsigned(reg115) : (reg134 && reg116)) : reg125[(4'h8):(3'h7)])) : (^~reg106));
  assign wire136 = ({reg93, reg102[(2'h2):(2'h2)]} ?
                       (+$signed((+(reg91 ?
                           reg112 : reg134)))) : ($signed({(~&reg103)}) ?
                           {reg127} : (8'hbf)));
  assign wire137 = reg87;
  always
    @(posedge clk) begin
      reg138 <= (reg124[(1'h1):(1'h0)] ?
          ($unsigned($signed(reg100)) + (($unsigned(reg123) <<< (reg120 <= reg133)) != ($unsigned((8'hb5)) - wire137[(5'h14):(4'hb)]))) : (reg97[(1'h0):(1'h0)] ?
              $signed((((8'hac) <<< wire95) ?
                  reg103[(5'h10):(4'ha)] : (wire135 ?
                      (8'ha7) : reg99))) : ((&reg128[(5'h11):(4'hd)]) | (~&$unsigned(reg112)))));
      if ($signed(reg97))
        begin
          reg139 <= ((reg98 ?
              (!$unsigned(reg102)) : (~|({reg130} ?
                  (~&reg104) : reg119[(3'h5):(2'h2)]))) >> (~&(~&reg91[(1'h0):(1'h0)])));
          if ($unsigned((!reg89[(4'ha):(3'h5)])))
            begin
              reg140 <= ($signed(reg103[(2'h2):(1'h0)]) ^ ((wire96[(4'ha):(4'h9)] ?
                      {(reg117 ~^ (8'haf))} : reg121[(4'hb):(2'h2)]) ?
                  reg129[(2'h2):(1'h1)] : {(~^reg122[(2'h2):(1'h1)]),
                      reg89[(2'h3):(2'h3)]}));
              reg141 <= (|{$unsigned((-$signed(reg132)))});
              reg142 <= $unsigned((^~wire80));
            end
          else
            begin
              reg140 <= (reg138[(1'h1):(1'h0)] > $unsigned($unsigned($unsigned((reg121 == reg88)))));
              reg141 <= $unsigned(($unsigned(reg111[(2'h3):(2'h3)]) != {$unsigned(reg103)}));
              reg142 <= $unsigned((8'ha6));
              reg143 <= {$signed(($signed((~|(8'hb5))) << $unsigned((8'hbe)))),
                  reg127[(2'h3):(1'h1)]};
            end
          reg144 <= reg130[(4'he):(4'hd)];
        end
      else
        begin
          reg139 <= reg111[(1'h0):(1'h0)];
          if ({($signed($unsigned((wire83 ?
                  reg112 : reg111))) <<< (~^(-(wire84 - reg105)))),
              ($unsigned(reg139) > $signed((!{(8'ha6)})))})
            begin
              reg140 <= ($signed({((reg117 <<< reg143) ?
                      reg90 : {reg106, wire95}),
                  {(8'hba), reg125}}) ^ {{$signed((!wire83)),
                      reg92[(4'h9):(3'h6)]}});
            end
          else
            begin
              reg140 <= (($signed(((^~reg100) ?
                  (wire81 ?
                      reg98 : reg141) : (&reg122))) != reg99) > ({({reg134} >> {reg125,
                          reg103}),
                      (+((8'ha8) ? reg99 : reg115))} ?
                  (^$signed($unsigned(reg90))) : $unsigned(((wire81 ?
                          reg87 : (8'hb7)) ?
                      $unsigned(wire85) : $unsigned(reg127)))));
            end
          reg141 <= reg104;
          if ((|$signed(reg87[(1'h0):(1'h0)])))
            begin
              reg142 <= ((8'ha2) ?
                  (wire80 ?
                      reg126[(1'h0):(1'h0)] : (&$signed((~wire85)))) : reg144);
            end
          else
            begin
              reg142 <= (reg143 ^ ((({reg102, reg106} ^ ((8'ha5) ?
                  reg133 : wire78)) != $signed($unsigned(reg120))) == ($unsigned((|wire83)) ?
                  $unsigned((^~(8'ha9))) : $unsigned((wire80 == reg108)))));
              reg143 <= reg94;
              reg144 <= (reg119 ^ $signed((8'hae)));
            end
          reg145 <= reg112;
        end
    end
  assign wire146 = $signed($unsigned((~&(-(-reg145)))));
endmodule

module module28
#(parameter param72 = ((((~((8'hae) + (8'hb4))) && {((8'had) >>> (8'hb8)), ((7'h40) == (7'h43))}) & ((((8'hbb) + (7'h44)) ? ((8'had) && (8'hab)) : ((8'h9d) ? (8'ha8) : (7'h43))) ? {((8'hac) || (7'h40)), ((8'ha2) * (8'ha3))} : (8'hbe))) ? {((~|(&(8'hb4))) ? (~^((7'h40) ? (7'h40) : (8'h9e))) : (((8'hb7) >= (8'hae)) ? (!(8'ha8)) : (!(8'ha3)))), ((((8'hab) ? (8'ha6) : (8'ha1)) <= (7'h44)) ? ((^(8'ha6)) >> ((8'hae) ? (8'hab) : (8'haf))) : ((^(8'h9d)) + ((7'h43) ~^ (8'hac))))} : ((((~(8'hbc)) ? ((8'hab) ? (8'ha0) : (7'h43)) : {(8'ha7)}) & {((8'hb2) && (8'ha4))}) ? (~(|((8'hb0) ? (8'hba) : (8'hbe)))) : {({(8'hab)} & ((8'ha9) << (8'hac)))})), 
parameter param73 = ((|param72) < (param72 ? (param72 ? (param72 ? (param72 ? param72 : param72) : (&param72)) : param72) : (param72 == param72))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire [(2'h2):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= ($unsigned({(wire30[(3'h6):(3'h4)] != (8'ha8)),
          ((8'ha9) && (-wire29))}) | wire29);
      if (((&$signed(wire31)) ?
          wire29 : $signed($signed((wire30[(3'h6):(3'h4)] * (wire32 && reg33))))))
        begin
          reg34 <= $unsigned(($signed($unsigned($unsigned(wire30))) ?
              $unsigned(((wire31 ? reg33 : wire30) ?
                  wire30 : $unsigned(wire32))) : $signed(((-(8'hb4)) ^ wire30[(4'ha):(4'h8)]))));
          reg35 <= $signed(reg33);
          reg36 <= reg33[(2'h3):(1'h0)];
        end
      else
        begin
          reg34 <= $unsigned($signed(wire30[(4'ha):(1'h0)]));
          reg35 <= {$unsigned({$signed((reg36 << reg36)),
                  ($unsigned(wire29) - $signed((8'hbc)))}),
              $signed(reg35)};
          if ($unsigned(((+reg35[(3'h6):(1'h1)]) >> {wire30[(2'h3):(2'h3)],
              ((-(8'hae)) <<< wire31)})))
            begin
              reg36 <= {(wire29[(2'h3):(2'h3)] ?
                      wire31[(1'h0):(1'h0)] : (((wire31 - (7'h43)) ?
                              $unsigned(wire32) : $unsigned((8'hbf))) ?
                          ($signed((8'ha3)) == reg35[(2'h2):(1'h1)]) : ((wire31 ?
                              wire31 : reg34) * (reg35 ? (7'h42) : reg34))))};
            end
          else
            begin
              reg36 <= $signed((8'hae));
              reg37 <= (~^((reg35[(2'h2):(1'h0)] << (!((8'hb3) ?
                  reg33 : wire30))) == ($unsigned($signed((8'hbd))) - wire30[(1'h0):(1'h0)])));
              reg38 <= ((^~wire30) ?
                  reg37 : ($unsigned({(reg35 | reg35),
                      (wire29 > (8'hb8))}) ~^ reg33));
              reg39 <= $unsigned($unsigned(wire32));
            end
          reg40 <= ($unsigned($unsigned((((8'ha8) ?
                  reg35 : reg33) != (wire30 <<< reg36)))) ?
              wire31 : reg34[(3'h5):(1'h1)]);
        end
      reg41 <= wire32;
      reg42 <= reg33;
    end
  always
    @(posedge clk) begin
      reg43 <= ($unsigned($signed(reg33[(2'h3):(2'h2)])) + $unsigned($unsigned(((~&reg42) & $signed(wire32)))));
      if ($unsigned(wire31[(2'h2):(2'h2)]))
        begin
          reg44 <= $unsigned($unsigned(reg41[(3'h6):(2'h3)]));
          reg45 <= (reg37[(1'h0):(1'h0)] << $signed((((reg39 != reg42) <<< wire29[(3'h5):(2'h2)]) <= (wire30[(3'h7):(1'h0)] <= reg35[(3'h4):(1'h0)]))));
          if (reg40[(5'h10):(4'hd)])
            begin
              reg46 <= $unsigned($unsigned((($signed(reg43) >= $unsigned(wire30)) < $signed((~^reg45)))));
              reg47 <= wire29;
              reg48 <= {(+wire29),
                  (reg33[(1'h1):(1'h0)] ?
                      wire30[(1'h0):(1'h0)] : {(wire32[(2'h3):(2'h2)] ?
                              $signed(reg43) : $unsigned(reg34)),
                          (+(^~wire31))})};
            end
          else
            begin
              reg46 <= wire29[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg44 <= $unsigned(reg33[(3'h4):(3'h4)]);
          reg45 <= (+$signed(reg35[(3'h7):(3'h6)]));
          reg46 <= ($unsigned(wire32) ^ reg39);
          if ({reg48, ($signed(reg39) || reg34)})
            begin
              reg47 <= (reg47[(3'h5):(1'h0)] ?
                  $unsigned(reg35[(1'h1):(1'h1)]) : (8'hb7));
            end
          else
            begin
              reg47 <= $signed(reg36[(1'h1):(1'h0)]);
              reg48 <= $unsigned((wire31[(2'h2):(1'h1)] && (^~(^~$signed(wire29)))));
              reg49 <= (|$unsigned(reg36));
              reg50 <= $signed(reg41[(1'h1):(1'h1)]);
            end
          reg51 <= $unsigned(reg34);
        end
      reg52 <= $signed(wire31[(2'h2):(1'h0)]);
      if ((&$unsigned(((reg52 ~^ (reg46 ? wire31 : reg35)) ?
          ((!reg43) ^ $signed(reg47)) : reg44[(2'h2):(1'h0)]))))
        begin
          reg53 <= wire32;
          reg54 <= (^(8'h9e));
        end
      else
        begin
          reg53 <= ((reg46 & reg38[(2'h3):(2'h3)]) + $unsigned(($unsigned((reg36 < reg49)) - reg45)));
          reg54 <= (~&reg44);
        end
    end
  assign wire55 = (reg42 && reg38);
  assign wire56 = (($signed($unsigned((reg53 ?
                      reg51 : reg54))) * ((&{(8'hb3)}) <<< (7'h41))) <= $unsigned($signed(((^~reg37) ?
                      $unsigned(reg46) : reg52))));
  assign wire57 = $unsigned(wire56);
  assign wire58 = ($signed(((reg43 ?
                          reg47[(3'h6):(1'h1)] : (|wire30)) <= {reg40[(4'h8):(3'h4)],
                          (reg44 ? reg45 : (8'hbd))})) ?
                      ((~&reg51) ?
                          (((reg54 ? reg39 : reg42) * {reg34,
                              reg49}) >= $signed($signed(reg48))) : reg36[(1'h0):(1'h0)]) : (($signed($signed((7'h40))) ?
                              ((^~reg42) ?
                                  $unsigned(reg40) : (~^reg33)) : ((8'hbc) <= $unsigned(reg52))) ?
                          {((|reg50) ? (reg52 ? reg38 : reg49) : (~^reg44)),
                              wire55} : reg49[(4'hb):(4'hb)]));
  assign wire59 = reg34[(1'h0):(1'h0)];
  assign wire60 = {(($signed(reg37) ? {$unsigned(reg41)} : $signed((+reg51))) ?
                          $unsigned(($unsigned(reg38) <= (-reg52))) : $signed($unsigned({(8'ha7)}))),
                      (reg49[(3'h6):(3'h4)] ?
                          (|((reg47 ? wire58 : reg33) != (reg52 ?
                              wire55 : wire29))) : (($signed(reg34) ?
                                  wire55[(4'hd):(3'h7)] : reg47[(3'h4):(3'h4)]) ?
                              $signed({reg51,
                                  wire55}) : $signed(wire32[(3'h5):(3'h5)])))};
  assign wire61 = ((-reg44) ?
                      $signed(({reg37[(3'h6):(2'h3)]} ?
                          wire56 : (~|{(8'ha7)}))) : ($unsigned(($unsigned(reg38) ?
                          $unsigned(reg35) : reg42[(1'h1):(1'h0)])) + (((reg34 >> reg38) || $signed(reg53)) | reg37[(3'h5):(1'h1)])));
  assign wire62 = $signed(($unsigned($unsigned((!wire59))) ?
                      wire55 : (+reg50)));
  assign wire63 = ({(reg35[(3'h6):(3'h4)] ?
                          (&((8'haf) <<< wire31)) : wire60[(4'h9):(2'h2)])} | {(^reg47),
                      (8'haf)});
  assign wire64 = reg54[(1'h0):(1'h0)];
  assign wire65 = reg44;
  assign wire66 = ($signed(((reg41 && $signed((8'hbc))) ?
                      $signed((wire30 - reg44)) : (+{wire63}))) - wire63[(1'h0):(1'h0)]);
  assign wire67 = $signed((|({$signed(wire66), {wire55}} ?
                      reg33[(2'h2):(1'h1)] : reg36[(2'h3):(2'h3)])));
  assign wire68 = ((((+(~|wire63)) >> {wire29[(3'h7):(3'h4)],
                          reg43}) ^ ({wire32[(3'h4):(1'h1)]} ?
                          $unsigned({wire65}) : (~&reg37))) ?
                      $signed((~&(reg54[(3'h5):(2'h2)] || (reg34 ^ wire62)))) : wire67);
  assign wire69 = $signed((&$unsigned({wire29})));
  assign wire70 = {(({(-(8'h9c)), wire32[(4'h8):(4'h8)]} ?
                              $unsigned((8'hb4)) : reg49) ?
                          $unsigned((reg33[(3'h5):(1'h0)] ?
                              {reg46,
                                  wire30} : $signed(wire63))) : $signed((reg42 ?
                              reg54[(4'hb):(3'h5)] : {wire29})))};
  assign wire71 = $unsigned(({$signed((~^(8'hbe))),
                      wire31[(1'h0):(1'h0)]} >>> ($signed((wire32 ?
                          reg41 : wire64)) ?
                      (wire61 - $unsigned(wire70)) : (+reg52))));
endmodule
