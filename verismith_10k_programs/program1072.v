module top
#(parameter param200 = (((~&(7'h42)) ? (^~(~((8'hb9) ? (8'ha8) : (8'haa)))) : ((8'ha8) ? {((8'ha1) ? (8'hbe) : (8'h9e)), ((8'hbe) ? (8'hb2) : (8'hbf))} : {((8'ha7) << (7'h44)), (|(8'haf))})) & (^{(8'hbe), {((8'hab) ? (8'hb6) : (8'hb7)), (~(8'hbc))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire198;
  wire [(5'h11):(1'h0)] wire197;
  wire signed [(3'h7):(1'h0)] wire196;
  wire [(4'hc):(1'h0)] wire195;
  wire signed [(4'hc):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire164;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire152;
  wire signed [(3'h7):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire158;
  reg [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg187 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(5'h10):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire167,
                 wire165,
                 wire164,
                 wire162,
                 wire161,
                 wire160,
                 wire148,
                 wire147,
                 wire145,
                 wire5,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire156,
                 wire158,
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
                 reg168,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed($signed(wire4[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      if ({wire0,
          $signed(({wire1[(3'h4):(2'h3)]} ?
              (wire2 ?
                  wire4[(3'h4):(2'h3)] : (~|wire0)) : wire5[(1'h1):(1'h0)]))})
        begin
          reg6 <= wire5;
          reg7 <= ($unsigned(wire4) ?
              $unsigned(($signed((wire0 == wire3)) ?
                  wire2[(3'h4):(2'h2)] : ($signed(wire1) >= wire5[(2'h3):(2'h2)]))) : ((^~wire2[(3'h4):(1'h1)]) << (+{((8'hb1) ?
                      wire4 : wire2)})));
          reg8 <= wire3[(3'h6):(3'h6)];
          if (($signed((reg8[(3'h4):(1'h0)] ~^ (wire3 < wire3[(3'h6):(2'h2)]))) <<< $unsigned(wire4[(4'hb):(3'h6)])))
            begin
              reg9 <= (wire2[(3'h7):(2'h2)] ?
                  ({((~&(8'ha3)) != (wire5 || wire0))} + {$unsigned((wire1 ?
                          (8'hb3) : wire5)),
                      wire5}) : wire3);
              reg10 <= $signed(($unsigned(wire0) ?
                  (8'ha6) : $signed(((|wire2) ?
                      wire4[(1'h0):(1'h0)] : wire5))));
            end
          else
            begin
              reg9 <= ({$signed($signed((~&reg9)))} & ((8'hb5) <= {reg6}));
              reg10 <= (8'ha4);
            end
        end
      else
        begin
          reg6 <= wire0[(5'h13):(4'hd)];
          if ($unsigned((8'hb0)))
            begin
              reg7 <= {wire3[(4'h9):(4'h8)]};
              reg8 <= (!($signed($signed(wire2[(3'h7):(3'h5)])) ?
                  (({reg6, wire1} ? $signed(wire3) : reg8) < $signed((wire4 ?
                      reg10 : reg6))) : $unsigned(reg6[(1'h1):(1'h0)])));
              reg9 <= (~$unsigned($unsigned($unsigned((8'hb1)))));
              reg10 <= {{((&$unsigned(wire3)) ^~ wire2[(3'h7):(3'h5)]), reg6},
                  wire4};
            end
          else
            begin
              reg7 <= {(&reg9[(2'h2):(1'h0)]), wire0[(4'hf):(4'ha)]};
              reg8 <= (8'hb2);
              reg9 <= $unsigned(((reg9[(1'h1):(1'h0)] ?
                  ((wire4 <= (8'ha9)) < (wire1 & reg9)) : (((8'ha6) ?
                          reg8 : reg9) ?
                      (reg6 ?
                          reg8 : reg8) : (~reg8))) <<< $signed($unsigned($unsigned((8'ha3))))));
              reg10 <= $unsigned((7'h44));
              reg11 <= ($unsigned(wire1) ^~ (reg8[(3'h5):(1'h0)] ?
                  $unsigned(reg7) : ($signed((~^reg6)) & (~^$signed(wire5)))));
            end
        end
      reg12 <= (wire3 ?
          ((-wire0) || $signed(wire4[(2'h2):(1'h0)])) : ($signed((8'hb0)) ^~ (({reg9} < $signed(wire2)) ^ (8'ha0))));
    end
  module13 #() modinst146 (wire145, clk, reg12, reg9, reg11, reg8);
  assign wire147 = $unsigned(((|($unsigned(reg8) ?
                       reg8[(4'hf):(4'he)] : $signed((8'h9c)))) >= ((&reg8[(3'h4):(1'h0)]) ?
                       $signed((reg11 ?
                           reg10 : reg10)) : ((|wire5) || (~|wire1)))));
  module109 #() modinst149 (.wire111(reg11), .wire114(wire3), .wire113(wire5), .y(wire148), .wire112(reg7), .wire110(wire1), .clk(clk));
  assign wire150 = (($unsigned((!$signed(wire1))) ?
                       $unsigned(wire2) : (~(|wire1[(3'h4):(1'h1)]))) + {wire2});
  assign wire151 = (^wire1[(4'hb):(3'h6)]);
  assign wire152 = (($signed($signed($signed(reg6))) ?
                           (&($unsigned(wire147) ?
                               (reg12 ?
                                   wire145 : reg9) : {wire0})) : ($signed((|reg10)) || (wire1[(5'h10):(4'hc)] ?
                               $unsigned(wire2) : $unsigned(wire145)))) ?
                       wire2 : $unsigned(reg10[(4'ha):(3'h7)]));
  assign wire153 = wire148;
  module21 #() modinst155 (wire154, clk, reg12, reg9, wire2, wire1);
  module13 #() modinst157 (.clk(clk), .y(wire156), .wire17(reg9), .wire14(reg10), .wire15(wire151), .wire16(wire2));
  module13 #() modinst159 (.wire17(wire150), .wire14(wire156), .wire15(reg9), .y(wire158), .clk(clk), .wire16(wire2));
  assign wire160 = ($signed(wire0) ?
                       (~^(wire147 || $signed($unsigned(wire148)))) : wire150[(1'h0):(1'h0)]);
  assign wire161 = $signed($unsigned(wire0[(3'h6):(1'h1)]));
  module64 #() modinst163 (wire162, clk, reg11, wire148, reg6, wire145);
  assign wire164 = {reg10[(4'h8):(1'h0)]};
  module21 #() modinst166 (.wire23(wire2), .wire25(wire3), .clk(clk), .wire24(wire5), .wire22(wire151), .y(wire165));
  assign wire167 = (($signed(({wire165, wire160} ?
                               (reg12 <<< wire160) : (wire145 && (8'h9e)))) ?
                           $unsigned(($signed(wire154) == (reg8 ?
                               (8'hbf) : reg9))) : (wire0[(1'h1):(1'h1)] >> $signed(wire1))) ?
                       $signed(wire160[(4'hd):(2'h3)]) : $unsigned(($signed((^(8'hb8))) != ((8'hac) != $unsigned(wire154)))));
  always
    @(posedge clk) begin
      if (wire152)
        begin
          reg168 <= $unsigned((wire145[(4'hb):(3'h6)] <= $unsigned(wire160)));
          if (((($unsigned({wire145, reg9}) ?
                  wire161[(3'h5):(2'h3)] : (|(wire145 ?
                      wire153 : wire167))) + wire151[(4'hc):(1'h1)]) ?
              (!$unsigned(($signed(wire0) ?
                  (wire164 ?
                      (8'hbb) : (8'ha9)) : {wire148}))) : $unsigned((&$signed(wire1)))))
            begin
              reg169 <= wire0[(5'h11):(5'h11)];
              reg170 <= (((^wire3[(3'h5):(1'h0)]) <= $signed(wire153[(3'h6):(2'h2)])) <= (&$signed((&wire147[(1'h1):(1'h1)]))));
              reg171 <= (wire167 ? (^$signed((^$signed(reg169)))) : (8'h9e));
              reg172 <= (^~((^~$unsigned($unsigned(wire162))) ^ {$signed($signed(wire162))}));
            end
          else
            begin
              reg169 <= $signed((reg171[(3'h7):(1'h0)] ?
                  ({(wire160 ? wire3 : reg8)} ?
                      wire151 : $signed(wire147[(4'h8):(3'h6)])) : $unsigned((reg12 * wire154))));
              reg170 <= ((reg168 ~^ wire1[(4'h8):(3'h7)]) ?
                  ((&wire165) ^~ ($signed(reg7[(2'h2):(1'h1)]) - $unsigned($unsigned(wire148)))) : (&((wire158 >> (+wire153)) ?
                      (reg8 ?
                          {reg11,
                              (8'hb9)} : reg172) : (+wire148[(1'h1):(1'h0)]))));
              reg171 <= (reg8 <= wire0);
              reg172 <= ((reg172 << reg169[(5'h10):(3'h7)]) ?
                  wire5[(4'hf):(4'ha)] : reg170[(2'h3):(1'h0)]);
            end
          reg173 <= (&$signed(wire150));
          if ($signed($unsigned($unsigned(reg8[(3'h4):(2'h2)]))))
            begin
              reg174 <= (+$unsigned(($unsigned(reg172) & (+$unsigned(wire162)))));
              reg175 <= {reg7};
              reg176 <= $signed((wire147[(4'h9):(3'h4)] ?
                  $signed(($unsigned(reg174) != (reg174 ?
                      reg9 : reg169))) : $signed((reg168 ~^ wire151))));
            end
          else
            begin
              reg174 <= wire167;
            end
        end
      else
        begin
          reg168 <= (^~wire145);
          reg169 <= ({(+reg6[(1'h0):(1'h0)]),
              {wire158}} & $unsigned({(!wire153),
              (wire158 ? (8'hbc) : $signed(reg10))}));
          reg170 <= (((|(reg10[(2'h3):(2'h3)] <<< $unsigned(wire164))) * wire154[(3'h4):(1'h0)]) || wire165);
        end
      if (wire1)
        begin
          reg177 <= {$signed((8'ha7))};
        end
      else
        begin
          if ($unsigned(reg173[(3'h5):(3'h5)]))
            begin
              reg177 <= wire152;
              reg178 <= wire165;
              reg179 <= wire152;
              reg180 <= $signed(((^~(wire164 | $signed(reg9))) ?
                  {wire1[(4'he):(2'h3)]} : (((~|wire1) ?
                      wire156[(4'ha):(4'h9)] : {wire4}) == (8'ha3))));
              reg181 <= ((+((~&(&reg171)) ?
                      ((wire162 ?
                          reg10 : (8'ha4)) << $unsigned(reg6)) : ({reg168,
                          reg175} * (wire153 ? reg170 : reg7)))) ?
                  (wire153[(1'h1):(1'h0)] ?
                      $unsigned($signed(reg173)) : (~^(~(reg10 ?
                          wire164 : wire162)))) : $signed(reg12));
            end
          else
            begin
              reg177 <= wire153[(3'h6):(2'h3)];
              reg178 <= (|$signed($unsigned((&(8'hba)))));
            end
          reg182 <= reg10[(4'hb):(4'hb)];
          reg183 <= ($signed((^~($unsigned((7'h42)) - wire147[(4'hb):(4'h9)]))) ?
              reg168[(3'h4):(3'h4)] : ($unsigned($signed(wire156[(4'hb):(2'h2)])) < $signed(wire1)));
          reg184 <= (wire147[(4'ha):(4'h8)] || ($signed({(reg177 ?
                  wire4 : reg172)}) ^ $signed(reg179[(4'ha):(4'ha)])));
          if ($signed((wire165 ?
              ((~^(wire162 || wire161)) ?
                  ({reg180} ?
                      $signed(reg181) : reg181) : $unsigned((reg12 >= wire154))) : reg6)))
            begin
              reg185 <= $signed((wire153[(2'h3):(2'h3)] | $signed($unsigned((7'h44)))));
              reg186 <= $signed((8'ha7));
              reg187 <= (^~wire156[(2'h3):(1'h1)]);
            end
          else
            begin
              reg185 <= $signed($signed($unsigned($unsigned(reg176[(3'h7):(3'h7)]))));
              reg186 <= wire147;
              reg187 <= reg175[(3'h5):(2'h2)];
              reg188 <= reg187[(4'ha):(3'h4)];
              reg189 <= reg7;
            end
        end
      if ((reg174[(4'hd):(3'h5)] ?
          ((reg11 == (^(reg9 ? reg178 : wire153))) ?
              wire165 : $signed((+wire167[(2'h2):(1'h1)]))) : (wire150 << reg9)))
        begin
          reg190 <= (8'hab);
          reg191 <= wire160[(4'hf):(4'hd)];
          reg192 <= $unsigned(reg10[(3'h4):(1'h1)]);
          reg193 <= wire156;
        end
      else
        begin
          reg190 <= $signed($unsigned({((reg6 ?
                  wire156 : reg191) - (reg185 * wire154))}));
          reg191 <= $signed(wire162[(5'h12):(4'he)]);
          reg192 <= (~^$signed({{{wire147, reg181},
                  (wire151 ? reg178 : wire160)}}));
          reg193 <= $unsigned($unsigned($signed({$signed(reg174)})));
        end
      reg194 <= $unsigned($unsigned((8'h9f)));
    end
  assign wire195 = ({(!$signed(wire4[(4'hb):(3'h4)])),
                       ((|{(8'hb3), reg181}) ?
                           (-$unsigned(reg6)) : $signed((wire161 >>> wire161)))} - (~^wire154));
  assign wire196 = $unsigned(($signed($unsigned($unsigned(wire147))) + ((reg185[(2'h2):(1'h0)] ?
                       $signed(reg171) : (wire167 ?
                           (8'had) : reg9)) << ((-wire158) - $unsigned((7'h40))))));
  assign wire197 = wire195[(1'h1):(1'h1)];
  module64 #() modinst199 (.wire66(wire154), .y(wire198), .clk(clk), .wire68(reg190), .wire67(reg11), .wire65(wire158));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire142;
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire144,
                 wire99,
                 wire84,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire20,
                 wire19,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire106,
                 wire107,
                 wire108,
                 wire142,
                 reg105,
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
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= ($unsigned((wire15[(2'h2):(1'h0)] ?
              $unsigned($unsigned(wire15)) : ($signed(wire15) ?
                  $unsigned(wire16) : $signed(wire16)))) ?
          wire15[(4'hc):(4'hb)] : $unsigned($unsigned($signed((+wire17)))));
    end
  assign wire19 = wire16[(3'h5):(1'h0)];
  assign wire20 = $signed(wire19[(3'h5):(3'h4)]);
  module21 #() modinst33 (.wire22(wire16), .y(wire32), .wire25(wire20), .wire24(wire14), .clk(clk), .wire23(wire15));
  assign wire34 = wire15;
  assign wire35 = $signed((~^(wire14 * (wire34[(3'h4):(3'h4)] ?
                      $unsigned(wire34) : reg18[(2'h2):(2'h2)]))));
  assign wire36 = ((($signed($unsigned((8'haf))) <<< ((wire17 <= wire32) * (~^(8'h9e)))) ?
                      ($unsigned(((8'hb1) ?
                          wire32 : wire15)) || $signed({wire35})) : (((wire35 ?
                              wire34 : wire17) ^~ $unsigned((7'h42))) ?
                          {wire34} : $signed(wire32))) ^ ((((wire17 + reg18) ^ $signed((8'h9c))) - (~{wire16,
                      (8'h9d)})) >>> (8'hbd)));
  always
    @(posedge clk) begin
      reg37 <= wire34[(1'h0):(1'h0)];
      if ((-($signed(reg18) || {$signed($unsigned((7'h41))),
          $signed(wire16[(4'hf):(4'ha)])})))
        begin
          if ({$unsigned((8'hae))})
            begin
              reg38 <= $unsigned($unsigned((~^{(+(8'hb2))})));
              reg39 <= wire32;
            end
          else
            begin
              reg38 <= (~^reg39[(2'h3):(2'h2)]);
              reg39 <= wire35[(1'h1):(1'h1)];
              reg40 <= $unsigned(reg18);
              reg41 <= $signed(reg18);
            end
          reg42 <= wire17[(2'h2):(2'h2)];
          reg43 <= wire15[(3'h4):(1'h0)];
          reg44 <= ({wire36[(4'ha):(3'h4)],
              wire32} ~^ (~$unsigned($signed(reg42[(1'h0):(1'h0)]))));
        end
      else
        begin
          if ((wire36[(4'hb):(4'h9)] ^ (~|({$unsigned(wire19)} ?
              ((wire19 ~^ wire16) ?
                  $unsigned(wire17) : $unsigned(wire15)) : reg40))))
            begin
              reg38 <= (+reg39[(2'h2):(1'h1)]);
            end
          else
            begin
              reg38 <= $signed(reg44);
              reg39 <= (((reg40[(1'h1):(1'h1)] == reg40) ?
                  $signed($unsigned((~&wire35))) : ((8'h9e) ?
                      ((wire19 ? (8'h9c) : reg37) ?
                          (&reg44) : $signed(wire17)) : $signed(wire34[(3'h5):(1'h1)]))) < reg40[(1'h0):(1'h0)]);
              reg40 <= (~^$unsigned($unsigned(($unsigned(reg37) <<< wire36))));
              reg41 <= $signed(wire17);
              reg42 <= reg44;
            end
          reg43 <= (8'hba);
          if (wire17)
            begin
              reg44 <= $signed((wire36 && wire20[(3'h4):(3'h4)]));
              reg45 <= {$unsigned($signed($unsigned(wire35[(4'h8):(4'h8)])))};
              reg46 <= wire35[(1'h0):(1'h0)];
              reg47 <= ($unsigned(reg44[(4'hf):(4'hc)]) <= reg38);
              reg48 <= wire32[(4'ha):(3'h5)];
            end
          else
            begin
              reg44 <= {($unsigned(wire16) >> reg45)};
              reg45 <= $signed(reg40[(2'h2):(1'h0)]);
              reg46 <= {(!(reg18 >= ($unsigned(wire35) == $unsigned(reg43)))),
                  (reg43[(3'h5):(1'h1)] >> (~&$unsigned(reg48[(3'h6):(1'h1)])))};
              reg47 <= reg45;
              reg48 <= ($signed($unsigned(wire17[(2'h2):(2'h2)])) ?
                  reg45 : $signed((^reg44)));
            end
        end
      if ((!reg39[(3'h7):(2'h2)]))
        begin
          reg49 <= $signed((+$signed($unsigned($signed((8'hb8))))));
          reg50 <= ($unsigned(wire14[(4'ha):(1'h0)]) ?
              $unsigned((reg38[(3'h4):(1'h1)] ?
                  $signed($unsigned(reg46)) : reg43[(2'h2):(1'h1)])) : $unsigned(((reg41 + wire34[(3'h5):(3'h5)]) ?
                  (|reg41[(5'h12):(4'hf)]) : wire34[(3'h6):(1'h1)])));
          reg51 <= (reg50[(4'ha):(4'h8)] == wire34);
          reg52 <= (~|(~$signed(($unsigned(reg50) ?
              (wire14 < wire36) : reg47))));
        end
      else
        begin
          reg49 <= $unsigned(reg51[(4'hd):(1'h0)]);
          reg50 <= reg39[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      if ($signed(($signed($signed((wire19 ? reg46 : reg44))) ^~ ({(reg42 ?
                  wire20 : reg46)} ?
          ((~&reg49) + $unsigned((8'haf))) : $signed({reg50, wire17})))))
        begin
          reg53 <= wire32[(4'hc):(3'h5)];
          reg54 <= reg44;
          reg55 <= ($unsigned(($signed((+(8'hb6))) ?
              (reg50 ? (~&reg44) : (-reg18)) : ((reg38 ? wire36 : wire15) ?
                  reg38 : wire34))) <<< (reg50[(2'h3):(2'h3)] ?
              reg43[(3'h6):(1'h1)] : {$signed(reg39[(3'h7):(3'h6)]),
                  $unsigned($unsigned((8'ha1)))}));
          reg56 <= reg52[(2'h2):(1'h1)];
          reg57 <= (~|((+((8'hb6) ? $signed((8'hb4)) : wire20)) ?
              ($unsigned((^~reg41)) * ($signed(reg47) > (wire15 ?
                  reg42 : wire20))) : $unsigned($unsigned(reg54[(3'h7):(3'h7)]))));
        end
      else
        begin
          if (reg53[(3'h7):(3'h7)])
            begin
              reg53 <= (($unsigned((reg57 ? (wire19 <= reg46) : reg51)) ?
                  ($unsigned($unsigned(reg45)) ?
                      (^~reg48[(1'h1):(1'h0)]) : reg40[(1'h1):(1'h1)]) : $signed({((7'h43) ?
                          (8'h9f) : (7'h43))})) & wire34);
            end
          else
            begin
              reg53 <= ((reg39[(4'he):(1'h0)] ?
                      reg52[(2'h3):(1'h0)] : (reg40[(3'h5):(2'h3)] | (8'hbe))) ?
                  wire34[(2'h2):(2'h2)] : ($signed($unsigned((reg42 ?
                      wire15 : wire16))) | (~reg37[(1'h0):(1'h0)])));
              reg54 <= ((reg42[(2'h2):(1'h1)] << $signed(($signed(wire16) ~^ reg55[(1'h1):(1'h0)]))) + (($signed((~^reg48)) ?
                      ($signed(reg54) + (8'ha9)) : reg43) ?
                  (-($unsigned(reg46) ?
                      $signed(wire15) : (reg53 > reg52))) : (({wire14, reg18} ?
                      $unsigned((8'hb8)) : (~^reg41)) ^~ reg53)));
            end
          reg55 <= (-((reg55 ? reg45[(4'ha):(4'ha)] : (-(reg52 && reg47))) ?
              $unsigned($signed($unsigned(reg49))) : reg43[(2'h2):(2'h2)]));
          if ({(!(~^reg45[(3'h7):(1'h1)]))})
            begin
              reg56 <= reg46;
              reg57 <= {(~(wire20 ? reg57 : reg37)),
                  {reg54, (~|(reg53[(3'h5):(3'h5)] - (^reg50)))}};
              reg58 <= $signed(wire20[(4'ha):(2'h2)]);
              reg59 <= ($signed((~^(8'hb8))) ?
                  reg44 : ((|(wire14[(4'h9):(1'h1)] ?
                          $unsigned((8'ha9)) : (wire17 ? (8'hbd) : reg47))) ?
                      reg53 : (({reg40} ? $signed(reg42) : {wire35, wire15}) ?
                          $unsigned($signed(reg50)) : reg39)));
            end
          else
            begin
              reg56 <= reg56;
              reg57 <= reg53[(4'hc):(4'h8)];
              reg58 <= ((~$unsigned($signed(reg39[(4'he):(4'ha)]))) ?
                  (8'hb9) : (!(reg18 <= wire32[(3'h5):(2'h3)])));
              reg59 <= reg38;
            end
        end
      reg60 <= ((~&$signed({(8'hb7), (~^reg48)})) ?
          reg53[(4'hb):(2'h2)] : (-reg59));
      reg61 <= ($signed(reg58) ?
          $unsigned(reg46[(1'h0):(1'h0)]) : {wire15[(1'h0):(1'h0)]});
      reg62 <= reg18[(1'h1):(1'h1)];
      reg63 <= $unsigned((8'hb0));
    end
  module64 #() modinst85 (wire84, clk, wire32, reg50, reg41, wire15);
  module86 #() modinst100 (.wire88(reg44), .wire89(reg38), .y(wire99), .clk(clk), .wire90(reg57), .wire87(wire20), .wire91(reg62));
  assign wire101 = (^$signed((~|wire19[(1'h1):(1'h0)])));
  assign wire102 = (wire19[(4'h9):(4'h9)] ?
                       reg37[(2'h3):(2'h3)] : wire36[(1'h0):(1'h0)]);
  assign wire103 = wire102[(3'h4):(1'h0)];
  assign wire104 = reg52[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg105 <= (~&((|(reg62[(3'h7):(1'h1)] ?
          (reg54 || reg39) : $signed(wire35))) < reg59));
    end
  assign wire106 = $unsigned($unsigned(wire99));
  assign wire107 = wire16;
  assign wire108 = (wire19 ?
                       (^~(reg62[(4'h8):(2'h2)] >>> (8'hb5))) : (~|(reg60[(1'h0):(1'h0)] >= $unsigned(wire35[(2'h3):(2'h2)]))));
  module109 #() modinst143 (wire142, clk, reg44, reg38, reg105, reg57, wire17);
  assign wire144 = wire36;
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire114;
  input wire [(5'h10):(1'h0)] wire113;
  input wire signed [(3'h5):(1'h0)] wire112;
  input wire [(2'h2):(1'h0)] wire111;
  input wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire120;
  wire [(5'h15):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire125,
                 wire124,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 (1'h0)};
  assign wire115 = $signed(wire111);
  assign wire116 = $signed((((8'ha7) ?
                       ($unsigned(wire113) ?
                           $signed(wire110) : {wire114}) : $signed(((7'h43) ?
                           wire114 : (8'haa)))) <= ((8'had) >= $signed((8'hbf)))));
  assign wire117 = (~&$signed(((&(wire110 ? wire110 : wire112)) ?
                       (8'hb6) : (wire116[(3'h7):(2'h3)] ?
                           (~&wire111) : wire113))));
  assign wire118 = (wire114[(2'h3):(1'h0)] ^~ wire117[(1'h0):(1'h0)]);
  assign wire119 = {$signed($signed(((wire112 & wire114) ?
                           wire112 : (wire115 ? wire111 : wire118)))),
                       wire115[(4'h8):(3'h4)]};
  assign wire120 = (($unsigned((!(^~wire111))) ?
                       wire118 : (8'hb6)) != (wire111[(1'h1):(1'h0)] ~^ ($signed((^~(8'hb9))) ?
                       $signed(wire116) : (^(wire115 ? wire115 : wire111)))));
  assign wire121 = $signed(wire117[(5'h14):(3'h7)]);
  assign wire122 = (wire110[(1'h0):(1'h0)] ?
                       {(wire110[(1'h1):(1'h0)] << (wire116[(4'h8):(1'h0)] ~^ $unsigned(wire114))),
                           ($signed((wire114 - wire119)) ?
                               $unsigned(wire116) : wire113)} : ((7'h44) >= $signed(($signed((8'hbc)) ?
                           (wire111 << wire120) : (wire114 < wire119)))));
  always
    @(posedge clk) begin
      reg123 <= $signed(wire112[(3'h4):(2'h2)]);
    end
  assign wire124 = (|($unsigned($unsigned($unsigned(wire117))) ?
                       (8'hb1) : (($signed(wire119) ?
                           (wire113 ? wire114 : (8'haf)) : {(8'ha0),
                               wire116}) ^ (~(&wire119)))));
  assign wire125 = $signed(wire124[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      if ((!$unsigned($signed((+(reg123 & wire125))))))
        begin
          if ({({wire118, (8'ha0)} ?
                  {((&wire116) > $signed(wire124))} : $unsigned($unsigned($signed(wire113)))),
              (~((((8'hb3) ? wire113 : wire117) ?
                  (~^wire116) : $signed(wire115)) <<< wire112[(3'h5):(2'h3)]))})
            begin
              reg126 <= ((wire113[(4'hf):(4'h8)] ?
                  ((+(~wire118)) ?
                      wire117[(4'ha):(3'h7)] : (wire124 <<< {wire115})) : $unsigned($signed((wire111 < wire112)))) <<< $signed(($unsigned(wire125) ?
                  wire113 : wire113[(4'hd):(4'ha)])));
              reg127 <= (reg126 ?
                  wire110 : ((($unsigned(wire115) ?
                      wire122[(1'h1):(1'h0)] : (wire124 ?
                          (8'hb5) : wire119)) <<< $unsigned(((8'hb1) || wire122))) >= $signed($signed(wire122))));
              reg128 <= $unsigned(wire112);
              reg129 <= (($signed(((wire124 ? wire119 : wire115) ?
                      $unsigned((8'ha9)) : wire117)) ?
                  reg128[(2'h2):(1'h1)] : wire122) ~^ wire112[(1'h0):(1'h0)]);
              reg130 <= $unsigned($signed($unsigned((8'ha2))));
            end
          else
            begin
              reg126 <= $unsigned((!(wire115 ~^ {(^~reg126)})));
              reg127 <= wire117[(1'h0):(1'h0)];
              reg128 <= $signed((~|reg130));
              reg129 <= {$signed($unsigned(({wire115, wire116} | (8'hb5))))};
            end
          reg131 <= $signed($unsigned($unsigned(($signed(wire112) ?
              $signed(wire121) : {wire112}))));
        end
      else
        begin
          reg126 <= wire112[(1'h0):(1'h0)];
          reg127 <= wire120;
          reg128 <= {$unsigned($signed({$unsigned(wire115),
                  $unsigned(wire124)}))};
          reg129 <= (wire111 ? wire124[(3'h6):(1'h0)] : wire110);
        end
      if ((8'ha2))
        begin
          reg132 <= $signed(reg130);
          reg133 <= (wire125 <= $unsigned((!wire118[(1'h1):(1'h0)])));
          reg134 <= ((reg132[(3'h7):(3'h4)] ?
              $unsigned({wire121,
                  $signed(reg132)}) : $signed((~&(8'ha2)))) != (~^((wire120 ^~ (7'h41)) ?
              $signed((wire121 ? wire112 : wire111)) : reg128[(2'h3):(2'h3)])));
        end
      else
        begin
          if ((((!$signed((wire113 ? wire125 : reg127))) ~^ ($unsigned((reg128 ?
              wire116 : wire111)) << (~|(reg127 >>> (8'hb2))))) | $unsigned({$signed((&wire122))})))
            begin
              reg132 <= wire112[(3'h5):(3'h5)];
              reg133 <= (&wire119);
            end
          else
            begin
              reg132 <= wire113;
              reg133 <= wire119;
              reg134 <= $signed(wire117);
              reg135 <= $unsigned(({$unsigned(wire113[(1'h1):(1'h0)]),
                      $signed($signed(wire119))} ?
                  ($unsigned($signed(wire120)) ?
                      (wire125 ?
                          (wire117 <<< reg123) : (reg132 ?
                              reg134 : wire110)) : wire125) : wire118));
              reg136 <= ($signed(({$signed(wire122), wire116[(2'h3):(2'h3)]} ?
                  $signed($signed(reg134)) : wire124[(3'h6):(3'h6)])) >= $signed((~&wire124[(3'h5):(1'h1)])));
            end
        end
      if ($unsigned((wire111 ? reg130[(1'h1):(1'h1)] : (~|reg128))))
        begin
          reg137 <= $unsigned(reg133[(3'h6):(1'h0)]);
        end
      else
        begin
          reg137 <= wire111[(1'h0):(1'h0)];
          reg138 <= wire113[(3'h6):(1'h1)];
          reg139 <= ($unsigned((+(8'hae))) < $signed($unsigned(reg132[(3'h4):(1'h1)])));
        end
    end
  assign wire140 = $unsigned(wire122[(4'hc):(4'ha)]);
  assign wire141 = wire124;
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire [(5'h14):(1'h0)] wire88;
  input wire signed [(3'h7):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  assign y = {wire98, wire97, wire96, wire94, wire93, wire92, reg95, (1'h0)};
  assign wire92 = wire90[(4'he):(4'hc)];
  assign wire93 = ((8'h9d) ?
                      ($unsigned($signed(((8'hb2) ?
                          wire88 : wire88))) << wire87[(1'h1):(1'h1)]) : (+wire92));
  assign wire94 = (7'h41);
  always
    @(posedge clk) begin
      reg95 <= (wire89 > wire93);
    end
  assign wire96 = wire94[(1'h1):(1'h0)];
  assign wire97 = (!$signed(wire89[(3'h7):(3'h4)]));
  assign wire98 = ($signed(wire89[(4'h8):(2'h2)]) ^ {{$unsigned(wire90)}});
endmodule

module module64
#(parameter param82 = (&(((((7'h41) || (7'h40)) <= ((8'hbb) ? (8'hb5) : (8'h9e))) ? {((8'ha0) + (8'hb4)), ((8'hb0) ^~ (8'h9d))} : (-(~|(8'hbb)))) >>> ((^(-(8'h9f))) ^ {((8'haf) ? (7'h44) : (8'ha6)), ((8'hb1) ? (8'hae) : (8'hac))}))), 
parameter param83 = param82)
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  input wire [(4'h8):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 (1'h0)};
  assign wire69 = (wire67 ~^ $unsigned(wire66));
  assign wire70 = wire69;
  assign wire71 = {(^~(((~^wire67) < wire69[(2'h3):(1'h0)]) ?
                          ((wire68 ? wire70 : wire65) ^ (wire65 ?
                              wire66 : wire65)) : (|wire70[(4'hc):(3'h5)]))),
                      (($signed($signed(wire70)) ?
                          $unsigned(wire65[(4'h8):(3'h7)]) : wire66[(2'h2):(1'h1)]) <= $signed($signed((wire69 ?
                          wire70 : wire70))))};
  assign wire72 = $unsigned((^({{wire66}, ((8'ha5) ? wire69 : (8'hbc))} ?
                      (8'hb3) : wire67)));
  assign wire73 = ({($unsigned((wire69 > wire71)) ?
                              $signed(wire71[(4'h9):(3'h7)]) : {(wire72 ?
                                      wire65 : wire66),
                                  $unsigned(wire67)}),
                          $signed($unsigned({wire72, wire70}))} ?
                      ($unsigned((8'hb4)) ?
                          {($signed(wire69) ?
                                  wire69[(2'h2):(1'h0)] : wire71[(3'h4):(2'h2)])} : $unsigned($unsigned(wire66[(2'h3):(1'h1)]))) : wire65);
  assign wire74 = wire70[(3'h7):(3'h7)];
  assign wire75 = wire66[(4'h8):(2'h3)];
  assign wire76 = wire68[(4'h8):(3'h6)];
  assign wire77 = ($signed($signed($unsigned($unsigned(wire66)))) ?
                      (^$unsigned((^~wire70[(5'h13):(3'h6)]))) : (wire72[(4'h8):(3'h4)] & (~$unsigned((-wire66)))));
  assign wire78 = wire75[(5'h12):(5'h12)];
  assign wire79 = ($unsigned((&wire74)) ? wire73 : wire78[(2'h2):(2'h2)]);
  assign wire80 = $unsigned(wire69);
  assign wire81 = wire69[(2'h2):(1'h1)];
endmodule

module module21
#(parameter param30 = (~&{((((8'hab) ? (8'hb8) : (8'ha6)) ? ((8'h9d) ? (8'ha6) : (8'had)) : ((8'haf) <= (8'hbe))) ? ((~^(8'ha3)) & (~(8'hab))) : {(~^(8'hb0)), (~|(7'h41))})}), 
parameter param31 = (-{(((8'hbb) >> ((8'hb4) ? param30 : param30)) >>> (+(param30 - param30))), (|((~^param30) - (|param30)))}))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  assign y = {wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = {(($signed((wire24 >> (8'hb3))) ?
                              ($unsigned(wire24) ?
                                  $unsigned((8'hb6)) : wire22[(4'he):(4'he)]) : $unsigned($unsigned((8'ha7)))) ?
                          $signed($unsigned(wire24[(4'hc):(2'h2)])) : (^~(~&$unsigned(wire22))))};
  assign wire27 = (&(^~$signed($signed($unsigned(wire25)))));
  assign wire28 = wire24;
  assign wire29 = ((!($signed($unsigned(wire28)) < wire27[(3'h5):(1'h0)])) ^~ wire25[(2'h2):(2'h2)]);
endmodule
