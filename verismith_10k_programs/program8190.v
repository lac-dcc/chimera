module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire202;
  wire [(5'h10):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire204,
                 wire202,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed((8'had));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg5 <= ((&$unsigned((8'hbd))) <= wire2[(4'ha):(3'h5)]);
        end
      else
        begin
          reg5 <= reg5;
          reg6 <= (($signed(wire4[(4'he):(2'h2)]) ~^ $signed(wire4)) * $signed(wire3));
          reg7 <= (wire3[(4'h8):(3'h5)] ? wire3[(2'h2):(1'h1)] : reg5);
          reg8 <= ($unsigned((((reg5 <= wire0) ?
                  (wire2 ? (8'h9f) : wire0) : wire2) >= reg7[(1'h0):(1'h0)])) ?
              reg7 : $signed($signed({wire0})));
        end
      reg9 <= wire2;
      reg10 <= ((~|wire1[(2'h2):(2'h2)]) & ((7'h43) ?
          wire2 : $unsigned(($signed(wire1) & wire4))));
    end
  module11 #() modinst31 (.wire14(reg9), .y(wire30), .wire12(reg10), .wire13(wire1), .wire15(wire0), .clk(clk));
  assign wire32 = wire4[(2'h3):(2'h2)];
  assign wire33 = (wire2 ?
                      $signed(((((8'hbb) - reg8) ?
                          $signed(wire1) : (&(8'hb4))) || reg6)) : {$unsigned(reg5[(2'h3):(1'h0)]),
                          wire1[(3'h4):(3'h4)]});
  assign wire34 = ((8'haf) ?
                      (reg9 << ({(reg6 ? wire1 : (8'ha8)), (|wire1)} ?
                          $unsigned(wire4) : (wire32[(4'hb):(1'h0)] << $signed(wire33)))) : wire3[(2'h2):(2'h2)]);
  module35 #() modinst203 (wire202, clk, wire2, reg6, wire30, wire32, wire34);
  assign wire204 = (&{$signed(wire4[(1'h0):(1'h0)])});
endmodule

module module35
#(parameter param201 = (((((&(8'hb9)) ? (~^(8'hb1)) : ((8'hba) + (7'h44))) > ((-(8'hb4)) <<< ((8'haf) >>> (8'ha6)))) || ({((8'ha8) < (8'ha7)), ((8'hbb) ? (8'h9e) : (8'hbb))} && {(~&(8'hb4))})) ? {(((~(8'ha5)) ? ((8'hab) && (8'ha1)) : ((8'ha8) || (8'h9e))) ? ({(8'hb4), (8'ha2)} - (7'h42)) : {{(8'h9d), (8'hb0)}, ((8'ha0) || (8'hbf))}), ((-((8'hbc) ? (8'ha3) : (7'h41))) == (+((7'h41) >> (8'haf))))} : {{(~|{(8'had), (7'h40)})}, ((-((7'h44) ? (8'ha9) : (7'h43))) ^ {((7'h40) ? (8'hb3) : (8'hbb)), ((8'ha6) && (8'haf))})}))
(y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire37;
  input wire [(3'h5):(1'h0)] wire38;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire200;
  wire signed [(5'h11):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire198;
  wire signed [(3'h6):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire194;
  wire signed [(5'h13):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire181;
  wire signed [(4'hc):(1'h0)] wire180;
  wire signed [(5'h15):(1'h0)] wire179;
  wire [(3'h4):(1'h0)] wire167;
  wire signed [(4'hf):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire86;
  reg [(2'h3):(1'h0)] reg197 = (1'h0);
  reg [(2'h2):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg191 = (1'h0);
  reg [(2'h2):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire195,
                 wire194,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire167,
                 wire166,
                 wire164,
                 wire145,
                 wire144,
                 wire142,
                 wire88,
                 wire48,
                 wire86,
                 reg197,
                 reg196,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= (^$signed(({$unsigned(wire40),
          (wire39 ? wire38 : wire40)} << (wire37[(3'h7):(3'h6)] ?
          (wire37 ? (8'hba) : (8'hb2)) : (wire38 || wire36)))));
      reg42 <= reg41;
      reg43 <= $unsigned(((^~(~$unsigned(wire37))) ?
          $signed($signed($signed(wire36))) : $signed($unsigned((~reg42)))));
      reg44 <= $signed($unsigned(wire37));
    end
  always
    @(posedge clk) begin
      reg45 <= reg44[(2'h2):(1'h0)];
      reg46 <= reg41;
      reg47 <= wire37[(1'h1):(1'h0)];
    end
  assign wire48 = reg43;
  module49 #() modinst87 (.clk(clk), .wire51(wire36), .wire54(reg45), .wire53(reg46), .wire52(reg44), .y(wire86), .wire50(reg41));
  assign wire88 = $signed({(($unsigned((8'hb2)) ?
                              $unsigned(reg42) : (wire37 ? wire36 : reg47)) ?
                          reg42 : reg46)});
  module89 #() modinst143 (wire142, clk, wire48, reg43, reg44, wire39);
  assign wire144 = ((($signed({wire36,
                       (8'hb1)}) == (+(~|wire86))) | $signed($signed($signed((8'hbf))))) ^ wire48);
  assign wire145 = ($signed((wire86 ?
                           ((~^reg45) ?
                               wire48[(4'h9):(2'h2)] : (wire86 <<< reg47)) : ((reg46 ?
                                   reg44 : (8'hb8)) ?
                               $signed(wire142) : (8'ha9)))) ?
                       (reg42 ? (7'h42) : wire38) : (!{$unsigned((~&wire37))}));
  module146 #() modinst165 (.wire149(wire145), .wire147(wire144), .clk(clk), .wire148(reg46), .y(wire164), .wire150(reg42));
  assign wire166 = wire164[(3'h5):(1'h1)];
  assign wire167 = reg42;
  always
    @(posedge clk) begin
      if ((((^(!wire144[(4'hb):(3'h6)])) - ({wire166} ?
          $unsigned(((7'h44) ? wire145 : (7'h44))) : ($signed(reg46) ?
              $signed(wire167) : reg46[(1'h0):(1'h0)]))) >>> $signed({{(wire48 ^ reg41)},
          (&$unsigned(wire48))})))
        begin
          reg168 <= (^~($signed($signed({wire145})) && wire88[(1'h0):(1'h0)]));
          reg169 <= {(8'ha0), $unsigned(reg46)};
          reg170 <= $signed(wire36);
          reg171 <= ((!(!{reg46, reg46})) | $signed($unsigned(wire145)));
        end
      else
        begin
          if ($signed((wire142 ^ wire167)))
            begin
              reg168 <= ($unsigned((&{wire48})) - (8'hb9));
              reg169 <= (((|reg41) & ($unsigned(wire166[(3'h4):(1'h1)]) << $signed(reg170[(1'h1):(1'h0)]))) ?
                  ((wire167[(1'h1):(1'h1)] ?
                      $signed($unsigned(reg46)) : reg171) || $signed(wire86)) : wire38);
              reg170 <= $signed((wire88 << reg43[(1'h1):(1'h1)]));
            end
          else
            begin
              reg168 <= $unsigned(($signed((reg42[(4'h9):(3'h7)] + $unsigned(wire40))) ?
                  wire86 : ((&wire167[(1'h0):(1'h0)]) ?
                      ((wire39 ? wire48 : (8'haa)) ?
                          reg170 : reg41[(3'h6):(2'h3)]) : (^~reg46[(4'hb):(3'h7)]))));
              reg169 <= (wire164 == ($signed(reg43[(2'h2):(1'h1)]) >> $signed($unsigned((reg168 != wire38)))));
              reg170 <= reg45;
              reg171 <= reg47;
              reg172 <= {reg44[(4'hb):(4'hb)], wire38[(2'h2):(2'h2)]};
            end
          reg173 <= $signed(($signed((wire36[(5'h12):(3'h7)] ?
              $unsigned(wire38) : reg41)) * $unsigned(($signed((7'h42)) ?
              (reg45 ? wire48 : wire48) : $unsigned(wire142)))));
          reg174 <= ($signed((reg44[(4'hb):(3'h4)] ?
                  $unsigned({reg170}) : wire166[(3'h4):(2'h2)])) ?
              reg41 : $signed(((-$unsigned(wire39)) ?
                  $signed((wire40 ?
                      wire167 : reg170)) : reg42[(2'h2):(2'h2)])));
          reg175 <= (-(&$unsigned((!$unsigned((8'hbd))))));
        end
      if (($unsigned($unsigned($signed(wire145))) ?
          $signed(($unsigned($signed(reg44)) || ((reg169 + wire36) >= (wire86 > reg44)))) : reg44[(1'h0):(1'h0)]))
        begin
          reg176 <= wire38[(2'h3):(2'h3)];
          reg177 <= $unsigned({(reg172 * reg171[(2'h2):(1'h0)])});
        end
      else
        begin
          reg176 <= (!reg172[(4'hb):(3'h6)]);
          reg177 <= ($unsigned($signed({$signed(wire145),
                  ((8'hbc) ? reg46 : reg169)})) ?
              wire145[(3'h5):(3'h5)] : $unsigned((($signed(wire88) >>> reg41[(1'h0):(1'h0)]) & (!$signed(wire37)))));
        end
      reg178 <= $signed((~^wire142[(1'h0):(1'h0)]));
    end
  assign wire179 = $signed((~|(&$unsigned((wire167 <= wire86)))));
  assign wire180 = (!(($signed((reg173 ? (8'hb4) : wire142)) ?
                       $signed((^~(8'ha1))) : wire38[(2'h2):(1'h1)]) - (^~$signed(reg178))));
  assign wire181 = $signed(reg168[(2'h3):(2'h2)]);
  assign wire182 = reg41[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg183 <= wire142;
      reg184 <= wire40;
      if (wire182)
        begin
          reg185 <= ($signed(wire182[(3'h7):(2'h2)]) ?
              $unsigned(({reg41[(3'h7):(3'h6)]} >= (8'ha8))) : ($unsigned(reg174) <= (($signed(wire40) || $unsigned(reg47)) ?
                  $unsigned((~wire142)) : reg169[(1'h1):(1'h0)])));
          if (wire88[(2'h2):(2'h2)])
            begin
              reg186 <= ((reg172 >>> $unsigned(((reg183 << wire182) >> $signed(wire40)))) ?
                  $signed((8'hbb)) : ($signed(reg183) + ((reg185 <= $signed(wire180)) | wire179)));
              reg187 <= (~^(^~($signed((reg169 ?
                  (8'ha7) : reg47)) && ($signed(reg178) != $unsigned(reg183)))));
              reg188 <= ({($unsigned($unsigned(reg169)) ?
                      wire182 : ($unsigned(reg186) >= (+wire36)))} ^~ wire48);
            end
          else
            begin
              reg186 <= (8'ha9);
            end
          reg189 <= $signed($signed((+(wire182 > reg168))));
          reg190 <= (^reg46[(2'h2):(1'h0)]);
          reg191 <= {$unsigned(reg170), (8'ha7)};
        end
      else
        begin
          if (wire144[(3'h7):(1'h0)])
            begin
              reg185 <= (reg190[(1'h1):(1'h1)] * (+$unsigned((wire38 && reg174))));
              reg186 <= wire40[(3'h7):(3'h6)];
            end
          else
            begin
              reg185 <= {(reg169 > (|{((8'ha6) * (8'ha7)), (wire38 | reg189)})),
                  reg168};
              reg186 <= ((+$unsigned(reg44)) == wire167);
              reg187 <= $unsigned(wire88[(1'h1):(1'h1)]);
              reg188 <= $unsigned((wire179[(2'h2):(2'h2)] < ((wire166 ?
                      (reg41 ? wire48 : reg46) : $unsigned((8'ha9))) ?
                  wire179 : (((8'hae) || reg175) * (-reg178)))));
            end
          reg189 <= (reg43 ?
              (~(+($unsigned(reg45) | $unsigned(wire142)))) : $unsigned($unsigned($unsigned((reg173 ?
                  (8'ha1) : wire179)))));
          reg190 <= reg174[(1'h1):(1'h0)];
          reg191 <= reg187[(1'h1):(1'h1)];
          reg192 <= {(~^$signed(wire86)),
              {{$unsigned({wire180, reg170}), (8'hae)},
                  (reg187 ~^ ($signed(reg172) & $unsigned(wire48)))}};
        end
      reg193 <= (^$unsigned($signed($signed((reg42 ? wire164 : (8'hb2))))));
    end
  assign wire194 = (reg187 != $unsigned(reg43[(3'h4):(2'h3)]));
  assign wire195 = (!(|(reg175[(5'h10):(4'h8)] ~^ (wire142[(3'h4):(2'h3)] ^~ (reg174 || wire164)))));
  always
    @(posedge clk) begin
      reg196 <= reg172[(3'h7):(2'h2)];
      reg197 <= (-(8'hb4));
    end
  assign wire198 = ({$unsigned((^~{reg190})),
                           (reg43[(1'h1):(1'h0)] ?
                               $unsigned($unsigned(reg187)) : $signed((^wire182)))} ?
                       ((wire40[(2'h3):(2'h2)] || (~(wire36 ^ reg169))) ?
                           reg43 : $unsigned((8'had))) : $unsigned(wire166[(1'h0):(1'h0)]));
  assign wire199 = (8'hbf);
  assign wire200 = $unsigned(((reg185 * $signed((wire38 ^ (7'h41)))) >= wire36));
endmodule

module module11
#(parameter param28 = {(|(((!(8'h9e)) ? ((8'hba) >= (8'ha3)) : ((8'hb2) <= (8'hbb))) ? (((8'hb4) ? (8'h9c) : (8'ha2)) > (^(8'h9e))) : (^~(~|(8'hba)))))}, 
parameter param29 = (^(~&((^(^param28)) << ((^~param28) ? (^~(8'hb5)) : param28)))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg23,
                 (1'h0)};
  assign wire16 = (8'hb1);
  assign wire17 = ($unsigned((&$signed(wire15))) ?
                      $signed(({$signed(wire16), $unsigned((8'ha2))} ?
                          $signed(wire16) : wire15[(3'h4):(1'h1)])) : (wire13[(1'h1):(1'h1)] ^~ (8'hac)));
  assign wire18 = $unsigned((~^(wire17[(1'h0):(1'h0)] | (8'haf))));
  assign wire19 = ({(~(~^$unsigned(wire14))), $signed(wire18)} ?
                      wire14[(2'h2):(2'h2)] : $unsigned(({(wire17 ?
                                  wire14 : wire17)} ?
                          (^{wire16}) : (!$signed(wire14)))));
  assign wire20 = (~((-wire14) < {(7'h42),
                      ((wire19 ? wire12 : wire19) & wire14)}));
  assign wire21 = $unsigned($signed($signed(wire13)));
  assign wire22 = (wire12[(3'h5):(1'h1)] + $unsigned({((wire15 ?
                          (8'hb5) : wire12) ~^ (wire13 ~^ wire14)),
                      $signed($signed(wire21))}));
  always
    @(posedge clk) begin
      reg23 <= wire16;
    end
  assign wire24 = (((wire15 ?
                          {(~&(8'h9e)), $signed(wire19)} : (-((8'hb9) ?
                              wire15 : wire20))) ~^ $unsigned(wire13)) ?
                      $signed(wire16[(1'h1):(1'h0)]) : wire19);
  assign wire25 = $unsigned(wire18[(2'h2):(1'h1)]);
  assign wire26 = wire19[(3'h5):(1'h0)];
  assign wire27 = ($unsigned(wire24) ?
                      wire17 : $signed((wire17[(1'h1):(1'h0)] ?
                          wire18[(1'h0):(1'h0)] : {wire12[(4'h8):(2'h3)]})));
endmodule

module module146
#(parameter param162 = (~^((~&(+((8'hb5) ? (8'haf) : (8'h9e)))) + (-{{(8'hb4)}, (|(7'h43))}))), 
parameter param163 = param162)
(y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire150;
  input wire signed [(2'h3):(1'h0)] wire149;
  input wire signed [(4'ha):(1'h0)] wire148;
  input wire signed [(3'h6):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire152;
  wire signed [(4'hf):(1'h0)] wire151;
  assign y = {wire161,
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
                 (1'h0)};
  assign wire151 = $unsigned({(((~&wire148) ?
                               (wire148 <= wire148) : $signed(wire150)) ?
                           ((8'haa) ?
                               (wire150 ? wire150 : (8'hb7)) : (wire148 ?
                                   (8'ha2) : wire150)) : wire149[(1'h1):(1'h1)])});
  assign wire152 = ((!(-(8'ha2))) <<< (wire147[(2'h3):(2'h3)] ?
                       $signed(wire149) : wire151));
  assign wire153 = wire150;
  assign wire154 = wire147;
  assign wire155 = (wire152[(4'h8):(2'h2)] ~^ {wire153[(1'h0):(1'h0)],
                       (^~(^~{wire152, wire151}))});
  assign wire156 = wire149[(1'h0):(1'h0)];
  assign wire157 = $signed($unsigned(wire154));
  assign wire158 = wire151[(3'h5):(1'h0)];
  assign wire159 = wire147[(3'h4):(2'h2)];
  assign wire160 = $unsigned(wire152);
  assign wire161 = (wire147[(3'h5):(1'h0)] ? wire150[(4'hf):(4'h9)] : wire150);
endmodule

module module89  (y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(5'h13):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg129,
                 reg128,
                 reg127,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg94 <= {wire92[(2'h3):(2'h2)],
          (~({wire90, (wire90 ? wire92 : wire90)} ?
              wire90[(3'h7):(2'h2)] : $unsigned((wire91 >= wire91))))};
      reg95 <= wire92;
      reg96 <= (+$signed(reg95[(1'h1):(1'h1)]));
      reg97 <= reg94[(4'hb):(3'h6)];
      if ($signed({wire90, ($unsigned((~&wire90)) & reg97)}))
        begin
          reg98 <= ($unsigned({(~|{wire92, wire92}),
                  $unsigned($signed(reg96))}) ?
              $signed((8'ha0)) : ($unsigned({$signed((8'ha8)),
                      $unsigned(wire90)}) ?
                  reg96 : $unsigned($unsigned({wire92, reg95}))));
          if (($signed({(reg98 ? (wire92 ? reg94 : reg95) : (^~wire91)),
              reg98}) ^~ (~|{$unsigned(reg97),
              {{wire93}, wire91[(4'h9):(4'h8)]}})))
            begin
              reg99 <= {wire91};
              reg100 <= {$signed($signed(((wire92 << (8'hb5)) ?
                      $unsigned((8'hba)) : (^reg98))))};
              reg101 <= $signed(wire91[(3'h6):(2'h3)]);
              reg102 <= {($signed((~^reg100)) >= {reg100[(1'h0):(1'h0)],
                      reg96})};
              reg103 <= $signed(reg98);
            end
          else
            begin
              reg99 <= ({(&reg100[(1'h0):(1'h0)]),
                  reg97} != (reg99[(1'h1):(1'h1)] ?
                  $unsigned({(+reg95)}) : ($unsigned(reg102[(4'hb):(1'h0)]) << reg99)));
              reg100 <= $unsigned(reg97);
              reg101 <= {(~reg103[(4'ha):(2'h2)]),
                  ((reg103[(1'h0):(1'h0)] == $unsigned((8'haf))) ?
                      {{wire90[(1'h1):(1'h0)]}} : reg94[(4'hc):(4'hb)])};
            end
          reg104 <= (+((reg103 ?
              (~^(reg95 ?
                  (8'ha2) : reg94)) : $signed(reg98[(1'h1):(1'h1)])) <<< wire93));
        end
      else
        begin
          if ((^$unsigned(reg101)))
            begin
              reg98 <= (^(8'hbd));
            end
          else
            begin
              reg98 <= $unsigned((~^(8'ha8)));
              reg99 <= $unsigned(($signed((reg96[(3'h4):(2'h2)] != reg101[(4'hc):(3'h4)])) ?
                  $signed(($unsigned(reg100) ?
                      reg100[(2'h2):(1'h1)] : (wire91 ?
                          reg100 : reg100))) : ($unsigned({wire93, wire93}) ?
                      wire90[(4'hd):(3'h6)] : $unsigned({reg97, (8'h9e)}))));
            end
          reg100 <= (reg98[(2'h2):(1'h1)] < reg98);
        end
    end
  assign wire105 = reg100;
  assign wire106 = {$signed((reg94 ?
                           (reg100[(2'h3):(1'h0)] ?
                               $unsigned(reg103) : (reg100 ?
                                   (8'hbf) : reg94)) : {$unsigned(wire93)})),
                       $unsigned((reg102 ?
                           ($signed(wire90) ?
                               reg100 : (reg104 * wire93)) : (+reg94)))};
  assign wire107 = $signed($signed((&((reg100 ? reg102 : reg100) ?
                       $signed((7'h44)) : reg94))));
  assign wire108 = $unsigned((8'ha0));
  always
    @(posedge clk) begin
      if ({{wire106},
          $signed((&((~&wire107) ? $signed((8'h9f)) : $unsigned(wire107))))})
        begin
          if (reg99)
            begin
              reg109 <= {(wire105[(3'h5):(1'h0)] ?
                      ((|$unsigned(reg94)) ?
                          (-{reg101, reg94}) : {(^wire105)}) : reg98),
                  (~|wire90[(4'hd):(4'h9)])};
              reg110 <= wire93;
              reg111 <= $signed((wire93 ?
                  $signed($signed((wire91 <= wire106))) : wire108));
              reg112 <= {(~^((~^(reg95 ? reg95 : wire105)) ?
                      $signed($signed((7'h44))) : (reg100[(2'h2):(1'h0)] ?
                          {reg97, wire92} : (7'h43)))),
                  {(reg98 <= (&wire106)),
                      $signed($signed(reg111[(4'h9):(1'h0)]))}};
              reg113 <= wire93;
            end
          else
            begin
              reg109 <= $unsigned($unsigned({$unsigned(wire106[(3'h4):(1'h1)]),
                  $signed((reg94 ? wire106 : wire91))}));
            end
          reg114 <= (reg110[(4'h8):(2'h3)] >> (+(wire93[(1'h0):(1'h0)] * $unsigned(wire106))));
          if ($unsigned(($unsigned($unsigned($signed(wire93))) ?
              $signed((((8'hb1) ?
                  wire108 : wire106) != reg98)) : $unsigned(({wire93} || $signed(reg100))))))
            begin
              reg115 <= reg99;
              reg116 <= (reg95 != {(-reg95[(2'h3):(2'h2)]),
                  (((wire106 ? reg99 : wire105) ?
                      (reg110 <<< (8'hba)) : {reg98, wire107}) <<< {reg112})});
              reg117 <= $signed($unsigned((((8'ha6) && $signed(wire90)) >= $signed((~reg110)))));
              reg118 <= ((8'hb4) >> (wire107[(3'h4):(1'h0)] - (reg114 ?
                  $signed($signed((8'ha8))) : (~$unsigned(reg112)))));
              reg119 <= (~|(+(~^(reg113[(5'h14):(3'h7)] ?
                  {reg116, reg96} : {reg117, reg110}))));
            end
          else
            begin
              reg115 <= ($signed((((reg99 ? reg116 : reg118) ?
                          ((8'ha7) ^ reg109) : wire91[(4'hd):(4'hb)]) ?
                      reg101[(3'h6):(3'h5)] : (reg101[(4'ha):(1'h0)] ?
                          $signed(reg117) : $unsigned(reg112)))) ?
                  ($unsigned(($unsigned((8'ha4)) ?
                      $unsigned(wire90) : {reg110,
                          reg102})) ^ reg100[(1'h1):(1'h1)]) : (~|{(~|(|reg98))}));
              reg116 <= (~^wire107[(5'h12):(5'h11)]);
            end
          reg120 <= $signed($signed(reg104[(2'h2):(1'h0)]));
        end
      else
        begin
          reg109 <= {(8'haa),
              $signed($unsigned($unsigned(reg114[(4'hf):(3'h7)])))};
        end
      reg121 <= (((((&reg96) + (reg118 ? (8'hbb) : reg119)) - (~^(reg94 ?
                  (8'hb4) : wire91))) ?
              (^~(reg102 ?
                  reg99[(3'h6):(1'h1)] : (8'hbc))) : wire90[(5'h12):(3'h7)]) ?
          (~|$unsigned(reg97)) : (~|$unsigned(((~&reg97) ?
              $unsigned(reg114) : reg119[(4'h8):(1'h0)]))));
      reg122 <= (reg102 ~^ $unsigned(reg111));
    end
  assign wire123 = (^((^((8'haf) ? $signed(reg94) : $unsigned(reg114))) ?
                       $signed($unsigned((wire91 || reg115))) : ((7'h44) ~^ {reg114[(1'h1):(1'h0)],
                           reg104[(2'h2):(2'h2)]})));
  assign wire124 = ((wire92 && ($signed(((8'hae) <<< (8'hb0))) <= $signed({reg122,
                       reg100}))) - ((((~&reg95) << reg112) ^ wire93) > ($unsigned(reg117[(3'h6):(3'h4)]) ?
                       ($signed((8'h9d)) != wire90) : {wire91})));
  assign wire125 = ($unsigned({wire90,
                       reg98[(1'h0):(1'h0)]}) <= $signed((((wire123 >>> reg104) && wire124) + wire123[(4'hb):(2'h2)])));
  assign wire126 = (^~(reg98[(3'h4):(2'h3)] ? reg117 : $unsigned(reg118)));
  always
    @(posedge clk) begin
      reg127 <= (wire93[(3'h6):(2'h3)] & $unsigned(((~^reg95) >> $signed(reg99))));
      reg128 <= ((reg97 ? wire106 : reg96[(3'h5):(1'h0)]) >>> (reg101 ?
          $signed({reg103[(2'h2):(1'h0)],
              ((8'h9f) ? reg113 : (8'hb9))}) : {$signed((reg110 <= wire126))}));
      reg129 <= reg127[(3'h6):(2'h2)];
    end
  assign wire130 = reg97[(3'h5):(2'h3)];
  assign wire131 = wire90;
  assign wire132 = (^~(((reg97 <<< reg113[(5'h14):(5'h13)]) << ((+reg113) && $signed((8'had)))) == (8'hbf)));
  assign wire133 = ({{($unsigned(reg101) | ((8'hb2) ? (8'hb5) : reg115))}} ?
                       {($unsigned(reg116) && (^{(8'ha1)}))} : $signed($signed($unsigned((wire132 < reg115)))));
  assign wire134 = (~|$unsigned($signed(reg96[(1'h0):(1'h0)])));
  assign wire135 = $unsigned({{reg109[(4'ha):(3'h4)], (&$signed(reg97))}});
  assign wire136 = $signed(reg101);
  assign wire137 = wire132;
  assign wire138 = ((reg101[(4'hd):(4'ha)] ?
                           $signed($signed($unsigned(reg115))) : (({(8'hb9),
                                   wire106} ?
                               (~|(8'hb2)) : {wire136,
                                   reg118}) ^~ reg94[(4'ha):(1'h1)])) ?
                       (+{(wire93 >> $signed(reg94))}) : wire107);
  assign wire139 = $signed({$unsigned((((8'ha1) == wire123) - $signed(reg120)))});
  assign wire140 = $signed((|$signed((reg129[(4'hb):(3'h5)] | {reg110}))));
  assign wire141 = (~^{($unsigned(reg118[(1'h0):(1'h0)]) ?
                           $signed($signed(wire133)) : reg122)});
endmodule

module module49
#(parameter param84 = {({(~&((8'ha4) ? (7'h40) : (8'ha4)))} ? (^((^(8'h9d)) ? ((8'ha7) != (8'hbd)) : (-(8'hb4)))) : ((((8'hb7) != (8'hb1)) ? ((8'hbe) & (8'hb9)) : (-(8'h9e))) ? (8'ha5) : (((8'hbf) << (8'hac)) ? ((8'haf) < (8'hb7)) : (^(8'hae)))))}, 
parameter param85 = ({(({param84} == (param84 > param84)) ? (~|(~&param84)) : param84)} != (((!(|param84)) != ((param84 - (8'ha4)) != (param84 == param84))) ^~ (-((param84 || param84) <= (param84 + param84))))))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire54;
  input wire signed [(4'hc):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire signed [(4'he):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire61,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire55 = $signed(wire53[(3'h4):(1'h1)]);
  assign wire56 = ($signed($unsigned((~&(wire53 || wire55)))) << ($unsigned({$unsigned(wire51),
                          wire50}) ?
                      ((^~((8'hbe) ^~ wire52)) ?
                          wire54 : ((-(8'ha8)) ?
                              wire50[(2'h3):(1'h1)] : $signed(wire51))) : wire55));
  assign wire57 = $signed(($signed($signed(wire51[(4'hc):(1'h0)])) || (8'ha3)));
  assign wire58 = wire50;
  always
    @(posedge clk) begin
      reg59 <= $signed(wire58[(4'hb):(2'h2)]);
      reg60 <= (~(8'ha6));
    end
  assign wire61 = ($unsigned({({wire57} | ((7'h44) == wire50))}) ?
                      ($unsigned((8'hae)) ?
                          (8'ha5) : $signed($signed(((8'hbe) < wire55)))) : reg59);
  always
    @(posedge clk) begin
      if ({wire50, (~$signed((~^wire57)))})
        begin
          reg62 <= (~$unsigned((8'hbf)));
          reg63 <= reg62;
          reg64 <= wire58[(2'h3):(2'h3)];
          if ({$signed(($unsigned(reg60) || (-(&reg60)))), wire53})
            begin
              reg65 <= (wire53[(4'ha):(4'h8)] ?
                  ((((reg59 ? wire55 : (8'ha4)) <<< $unsigned(reg62)) ?
                      wire53[(4'h8):(3'h4)] : (~^$unsigned((8'hbf)))) ^ $unsigned((~(wire58 ?
                      wire52 : reg64)))) : wire51);
              reg66 <= $unsigned(wire53);
              reg67 <= reg63;
              reg68 <= (^(8'had));
              reg69 <= (($unsigned((-reg63)) ?
                      reg62[(3'h6):(1'h0)] : (~$unsigned($signed(wire57)))) ?
                  ($unsigned(((reg65 ? (8'ha1) : reg60) ?
                          $unsigned(reg68) : (reg62 ? reg66 : reg63))) ?
                      $unsigned($unsigned((&reg66))) : $unsigned((wire58[(3'h6):(3'h4)] ?
                          wire55 : (~reg66)))) : $signed((reg62[(4'he):(4'h9)] * reg63)));
            end
          else
            begin
              reg65 <= $unsigned(wire58[(3'h6):(1'h0)]);
              reg66 <= (-wire56);
              reg67 <= {wire56};
              reg68 <= reg66;
            end
        end
      else
        begin
          reg62 <= (wire51[(4'h9):(4'h8)] ^~ ($signed($unsigned($unsigned(wire53))) == $signed($signed($unsigned(wire58)))));
          reg63 <= reg68;
          reg64 <= $unsigned($signed($signed(wire56)));
          reg65 <= wire50;
          reg66 <= ((reg67 ?
              {(~|(wire56 ^ reg62))} : (~(reg66[(2'h2):(2'h2)] ?
                  wire56 : (wire55 ?
                      wire56 : reg63)))) << (+($unsigned((wire50 >>> reg59)) ?
              (8'hb6) : $signed({wire53}))));
        end
      if ($unsigned(wire58))
        begin
          reg70 <= $signed(wire52);
          reg71 <= reg63[(3'h6):(1'h0)];
          reg72 <= (reg66[(4'h9):(3'h7)] ? wire61 : $signed({reg68}));
          reg73 <= {$signed((~&wire50)),
              ({(!{wire58, reg60}),
                  ({reg70} >>> (reg63 < (8'hb6)))} <= $unsigned(wire52))};
          if ((({($signed(wire54) - $unsigned(reg64)), wire58} ?
                  $signed($signed($unsigned(wire54))) : ($unsigned((wire54 ^ (8'hb9))) <<< wire57)) ?
              reg69[(2'h2):(2'h2)] : $signed((((8'h9d) ?
                  {reg62, wire53} : (reg59 ?
                      reg73 : reg67)) - $unsigned(wire58)))))
            begin
              reg74 <= {reg67[(4'he):(1'h1)],
                  (wire61 ?
                      ((reg60 ?
                          wire55[(4'h9):(4'h8)] : $unsigned(reg63)) + reg70) : (reg62 ?
                          $unsigned(reg66[(1'h1):(1'h0)]) : reg71))};
            end
          else
            begin
              reg74 <= reg60[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg70 <= {((wire61[(4'he):(4'he)] ~^ ((wire57 + reg59) ?
                  (reg72 ? reg72 : reg63) : (^reg67))) * {(~^(reg62 ?
                      wire53 : (7'h44)))}),
              (~&((^~{reg72}) >> ((~reg74) > $unsigned(reg72))))};
          reg71 <= (reg63[(4'h9):(4'h9)] ? reg64 : $unsigned($signed(wire51)));
        end
      if (((wire58 != (&$unsigned(reg67))) > (~^$unsigned(reg68[(2'h3):(1'h1)]))))
        begin
          reg75 <= ({((^~wire56[(1'h0):(1'h0)]) ?
                  wire50 : reg63[(4'hb):(4'h8)])} <= ($unsigned(wire58[(3'h7):(3'h6)]) ^~ {{wire51}}));
          reg76 <= (reg74[(3'h5):(1'h1)] ?
              $signed($signed(($signed(reg60) | (reg72 == (8'ha8))))) : ((&((reg73 <= reg59) ?
                      (^~reg60) : (-(8'hbd)))) ?
                  wire51 : (wire57[(1'h0):(1'h0)] ?
                      reg60[(2'h2):(1'h0)] : $signed($signed(reg70)))));
          reg77 <= {$unsigned($signed($signed($signed(wire58)))),
              ($signed($unsigned(((8'ha7) || reg59))) ?
                  $unsigned(((|reg75) ?
                      ((7'h40) != reg76) : (!wire54))) : (reg69[(4'ha):(1'h0)] ?
                      reg60[(3'h6):(1'h1)] : $signed({reg73, (8'h9f)})))};
          if ($signed((reg71[(4'h8):(1'h1)] ?
              ((~^$signed(reg75)) <<< ((+reg64) >> (wire54 ?
                  wire52 : reg76))) : $unsigned({reg68,
                  reg63[(3'h5):(3'h4)]}))))
            begin
              reg78 <= wire57;
              reg79 <= $unsigned(((^$unsigned((^~reg62))) ?
                  wire53[(1'h1):(1'h0)] : {$unsigned((reg75 & wire55)),
                      ((reg70 ? wire53 : reg75) ?
                          wire50[(1'h0):(1'h0)] : $signed(reg77))}));
              reg80 <= $unsigned((($unsigned($signed(reg65)) ?
                      reg63[(1'h1):(1'h1)] : $signed($signed(wire58))) ?
                  reg79 : (($unsigned(reg75) != wire53[(3'h7):(2'h3)]) ?
                      {(wire52 ^ wire58), reg70[(4'hd):(3'h5)]} : ((wire52 ?
                          reg79 : (7'h44)) ^ reg66))));
              reg81 <= (&$unsigned((~{(&reg79), $unsigned(wire52)})));
            end
          else
            begin
              reg78 <= $unsigned($signed(($signed(reg77) ?
                  ((reg66 ~^ reg78) ?
                      $signed(reg63) : reg74) : (~wire51[(3'h6):(1'h1)]))));
              reg79 <= (~|reg74);
              reg80 <= reg73[(5'h13):(1'h0)];
            end
        end
      else
        begin
          reg75 <= $signed((((8'h9f) < ((reg78 > reg73) ?
                  wire57[(1'h1):(1'h1)] : {(8'ha7), reg66})) ?
              wire61 : $signed($unsigned(((8'hba) ? wire54 : reg66)))));
          reg76 <= $signed(((reg66[(4'hd):(4'h9)] + reg71) ?
              $signed((-$unsigned(wire54))) : wire54[(4'hd):(3'h4)]));
        end
    end
  assign wire82 = reg75;
  assign wire83 = (~^$signed($signed((~&(|reg74)))));
endmodule
