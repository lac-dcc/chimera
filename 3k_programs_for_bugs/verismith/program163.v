module top
#(parameter param316 = ((((((8'h9f) ^~ (8'haf)) <= (&(8'hb6))) ? {(+(8'haf))} : ({(8'ha6), (8'hbd)} ? ((8'ha5) | (8'h9e)) : ((8'hb9) < (8'hb8)))) >= ((!(!(8'hbc))) + (^{(7'h41), (7'h41)}))) >> (~|(8'ha6))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire315;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire313;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  assign y = {wire315,
                 wire172,
                 wire25,
                 wire24,
                 wire5,
                 wire313,
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
                 reg23,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire5 = ({{wire0, (~^{wire1})},
                     ((~&(&(8'hb2))) ?
                         wire3 : (^$signed(wire2)))} <= $unsigned(((^$unsigned(wire1)) ?
                     (wire2 <<< wire1) : (wire4 ?
                         (wire2 ? wire1 : wire3) : (wire1 ? wire0 : wire0)))));
  always
    @(posedge clk) begin
      reg6 <= (($signed(wire4) ?
          ($unsigned($signed(wire2)) && $unsigned(((8'hac) + wire0))) : $signed((~^(wire2 ?
              (8'ha5) : wire1)))) == (+(~^wire5[(3'h5):(3'h5)])));
      reg7 <= (wire0 ?
          (($unsigned($signed(wire3)) ?
                  (&$signed(wire1)) : $signed(wire2[(3'h7):(2'h2)])) ?
              (wire3[(1'h1):(1'h0)] <= wire5) : $signed($signed((7'h43)))) : $signed({$unsigned($unsigned(wire3))}));
      reg8 <= wire2[(4'hb):(3'h6)];
      if (wire1)
        begin
          reg9 <= $unsigned($signed(reg7));
          reg10 <= wire0;
          if ((&wire0[(1'h1):(1'h0)]))
            begin
              reg11 <= ({$unsigned((~&(~^wire2))),
                  (~&$signed($signed(wire1)))} != $signed(reg8[(4'h9):(3'h7)]));
              reg12 <= {({((wire0 <= wire0) >>> (wire0 ? (8'hb7) : (8'ha9))),
                          (~&wire1[(1'h0):(1'h0)])} ?
                      $signed(reg9[(3'h7):(2'h2)]) : reg8),
                  $signed(wire0)};
              reg13 <= (|(8'ha6));
              reg14 <= ((~&$signed($signed($signed(wire0)))) ?
                  $unsigned(wire2[(2'h3):(2'h3)]) : ($unsigned($unsigned($signed(wire2))) <= (wire1[(2'h2):(1'h1)] > {reg11})));
            end
          else
            begin
              reg11 <= $unsigned(reg8);
              reg12 <= wire0;
              reg13 <= $signed(reg7);
              reg14 <= (({(~&$signed(wire2))} == $unsigned((reg14 ?
                  $signed((8'hac)) : $unsigned((8'hbe))))) || wire4[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg9 <= {(^~wire4[(2'h2):(1'h0)])};
          reg10 <= (wire1 > (&reg8[(1'h0):(1'h0)]));
          reg11 <= $signed((((~|wire2[(4'h9):(2'h2)]) || $unsigned(reg7)) ?
              $signed(wire1) : reg8[(3'h4):(2'h2)]));
        end
    end
  always
    @(posedge clk) begin
      reg15 <= {{((8'ha7) ?
                  ((reg12 != reg10) ?
                      reg8[(4'ha):(4'ha)] : wire4[(1'h1):(1'h0)]) : (reg7[(4'hf):(4'hd)] < $signed(wire2))),
              ($signed($unsigned(wire0)) ? wire5 : {(&(7'h44)), (^~reg14)})}};
      reg16 <= reg7;
      reg17 <= (&{$signed($unsigned((wire0 ^ (8'h9c))))});
      reg18 <= wire1;
      if (reg6)
        begin
          reg19 <= ($signed($signed($unsigned(reg15))) < $signed($unsigned((+(reg16 || reg18)))));
          reg20 <= $signed((~|{(~&((8'h9c) >> reg13)),
              $signed($unsigned((7'h43)))}));
          reg21 <= ($signed(reg12[(3'h6):(1'h0)]) ?
              $unsigned({{(-reg7), (8'ha6)}}) : (8'had));
          if ((8'hbb))
            begin
              reg22 <= (($signed(((8'hbb) ? reg21[(3'h4):(2'h2)] : (^wire3))) ?
                  reg17[(4'hb):(4'hb)] : (8'haf)) >>> reg11[(2'h3):(2'h2)]);
              reg23 <= ((^$signed((^~(reg17 ? reg9 : reg6)))) ?
                  {wire4} : ((8'ha6) - $unsigned((8'hae))));
            end
          else
            begin
              reg22 <= reg20;
              reg23 <= {(~&$unsigned(((reg13 ?
                      wire2 : reg14) < ((8'hab) != wire2))))};
            end
        end
      else
        begin
          reg19 <= (($unsigned((^((8'hbc) ? wire1 : reg15))) ?
                  $signed($signed($unsigned(reg9))) : reg13[(3'h5):(1'h0)]) ?
              (reg21[(4'h8):(1'h0)] ~^ ((8'hae) ?
                  (reg18[(3'h4):(2'h2)] ?
                      (reg19 ?
                          reg16 : wire2) : reg17) : wire2[(2'h2):(2'h2)])) : wire1[(1'h0):(1'h0)]);
          reg20 <= $unsigned(($signed(reg17) ?
              $unsigned(reg18) : ($unsigned($unsigned(reg23)) ?
                  $signed(wire1) : (reg16[(3'h6):(2'h3)] ? wire4 : reg14))));
          reg21 <= wire5[(3'h6):(2'h3)];
          reg22 <= $signed({({reg23[(4'ha):(2'h3)],
                  (reg6 ?
                      reg16 : wire4)} >>> ((reg14 >= (8'hb4)) ~^ $signed(wire4)))});
          reg23 <= reg12[(2'h3):(1'h0)];
        end
    end
  assign wire24 = $signed((reg14 <= reg13[(3'h5):(1'h0)]));
  assign wire25 = reg10;
  always
    @(posedge clk) begin
      reg26 <= ((reg18 > (reg23[(3'h4):(2'h3)] ?
              reg19[(4'h8):(2'h2)] : (~^wire25[(1'h1):(1'h0)]))) ?
          reg22[(4'ha):(4'ha)] : (((-reg16) != (+{reg13})) >>> reg10[(3'h5):(3'h5)]));
      reg27 <= reg26[(4'h8):(2'h2)];
      reg28 <= (reg10 == (^(wire0 ?
          $signed({(7'h41)}) : reg14[(2'h2):(1'h0)])));
    end
  module29 #() modinst173 (wire172, clk, reg19, wire4, reg13, reg8);
  module174 #() modinst314 (wire313, clk, reg14, reg27, reg13, wire3, reg11);
  assign wire315 = $unsigned($signed(wire313[(2'h3):(1'h0)]));
endmodule

module module174  (y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire179;
  input wire signed [(4'hd):(1'h0)] wire178;
  input wire signed [(4'hc):(1'h0)] wire177;
  input wire signed [(4'he):(1'h0)] wire176;
  input wire signed [(4'hb):(1'h0)] wire175;
  wire [(3'h4):(1'h0)] wire312;
  wire signed [(2'h2):(1'h0)] wire311;
  wire [(5'h14):(1'h0)] wire310;
  wire signed [(4'hb):(1'h0)] wire309;
  wire signed [(5'h13):(1'h0)] wire308;
  wire [(4'h8):(1'h0)] wire307;
  wire signed [(4'he):(1'h0)] wire306;
  wire signed [(3'h4):(1'h0)] wire305;
  wire signed [(3'h7):(1'h0)] wire303;
  wire signed [(5'h11):(1'h0)] wire201;
  wire signed [(5'h14):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire182;
  wire [(5'h15):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire203;
  wire signed [(4'h9):(1'h0)] wire262;
  assign y = {wire312,
                 wire311,
                 wire310,
                 wire309,
                 wire308,
                 wire307,
                 wire306,
                 wire305,
                 wire303,
                 wire201,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire203,
                 wire262,
                 (1'h0)};
  assign wire180 = (wire176[(4'hc):(2'h3)] ?
                       ($signed(($unsigned(wire178) ?
                               ((7'h40) ?
                                   wire176 : wire176) : $signed(wire177))) ?
                           wire175 : wire176[(3'h6):(1'h0)]) : $signed({{(wire176 >> wire179)},
                           wire179}));
  assign wire181 = wire180[(2'h2):(2'h2)];
  assign wire182 = (wire181 ~^ wire175);
  assign wire183 = ((((7'h40) ?
                           $signed((8'ha0)) : $signed(wire180[(3'h6):(1'h1)])) ?
                       $unsigned(($unsigned(wire176) ?
                           $unsigned(wire180) : wire176[(3'h7):(1'h0)])) : ((((8'h9d) ?
                               (8'ha8) : wire180) ?
                           (wire182 > wire182) : (wire181 ?
                               wire178 : (8'hbd))) - ($unsigned(wire180) > (wire176 ?
                           wire175 : wire180)))) > {$unsigned(wire177),
                       (&$unsigned({(8'hbf), wire180}))});
  module184 #() modinst202 (wire201, clk, wire175, wire177, wire181, wire180, wire179);
  assign wire203 = ($unsigned(wire182) <= (8'haa));
  module204 #() modinst263 (.wire207(wire201), .clk(clk), .wire206(wire180), .wire208(wire203), .wire205(wire183), .y(wire262), .wire209(wire179));
  module264 #() modinst304 (.wire266(wire201), .wire268(wire177), .clk(clk), .wire267(wire182), .y(wire303), .wire265(wire183));
  assign wire305 = (!$signed($unsigned((!wire203[(1'h1):(1'h1)]))));
  assign wire306 = $signed(({((wire177 ? wire303 : wire262) ?
                           (^wire183) : (wire179 > wire305)),
                       $unsigned((wire201 ?
                           (8'haa) : wire201))} <= {(~^$signed(wire177)),
                       $signed((wire176 ? (8'hb3) : wire180))}));
  assign wire307 = {wire183[(4'hc):(1'h1)]};
  assign wire308 = $signed($unsigned((~&wire262[(1'h0):(1'h0)])));
  assign wire309 = {$unsigned({($signed(wire180) ?
                               ((8'haa) ?
                                   wire308 : wire306) : (wire262 >= (8'ha1))),
                           (wire179[(1'h0):(1'h0)] ?
                               $unsigned(wire262) : (^wire182))}),
                       (-(~^(8'ha3)))};
  assign wire310 = $unsigned((^~wire303[(2'h2):(2'h2)]));
  assign wire311 = $unsigned($unsigned(wire178[(3'h5):(2'h3)]));
  assign wire312 = $unsigned(((8'haf) ?
                       (wire309[(4'hb):(1'h1)] >= $signed(wire307)) : {((wire177 <= wire201) ?
                               ((8'haa) >> (8'had)) : (~&wire182)),
                           $signed((7'h40))}));
endmodule

module module29
#(parameter param170 = ({(&{{(8'hbb), (8'hba)}, (|(8'hba))})} ^ {(~^{((8'haf) ? (8'hae) : (8'hab))}), (+{{(7'h42)}, ((8'hbe) - (7'h44))})}), 
parameter param171 = ((!{param170, (((8'h9d) ? param170 : (8'had)) ? ((8'haf) ? param170 : (8'hba)) : (param170 ? (8'ha6) : (8'hb7)))}) || (~(8'h9f))))
(y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire162;
  wire [(3'h5):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire117;
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire135,
                 wire120,
                 wire119,
                 wire52,
                 wire117,
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
                 (1'h0)};
  module34 #() modinst53 (wire52, clk, wire30, wire31, wire33, wire32);
  module54 #() modinst118 (wire117, clk, wire52, wire31, wire32, wire30, wire33);
  assign wire119 = $signed($unsigned($signed($unsigned({wire52, wire33}))));
  assign wire120 = wire30;
  always
    @(posedge clk) begin
      reg121 <= wire33;
      reg122 <= (({(!wire119)} ?
          (~^wire33[(4'h9):(1'h0)]) : (8'hb6)) == {{wire117[(4'hb):(4'ha)],
              ($signed(wire117) <<< (wire119 ? wire119 : wire52))},
          (((wire32 < wire33) - reg121[(2'h2):(2'h2)]) & wire30[(3'h6):(1'h1)])});
      if (reg121[(3'h4):(1'h1)])
        begin
          reg123 <= wire120;
        end
      else
        begin
          reg123 <= wire30;
          if ($signed($unsigned(((reg121[(2'h3):(2'h3)] == {wire30}) ^ ($signed(wire33) - reg122)))))
            begin
              reg124 <= $unsigned((((~^wire30[(4'h9):(4'h8)]) + $signed(((8'h9c) ?
                      (8'haf) : wire119))) ?
                  ($signed((wire31 - wire30)) ?
                      wire30 : {{wire119, reg121},
                          (reg121 ? wire52 : reg122)}) : wire31));
              reg125 <= ($signed(wire52[(1'h1):(1'h0)]) > wire120);
              reg126 <= {(($signed({wire119, reg124}) ?
                          wire117[(4'ha):(3'h7)] : reg124[(3'h5):(2'h2)]) ?
                      ($signed(reg124) <= ($unsigned(wire117) * $signed(wire119))) : $signed(wire117[(1'h0):(1'h0)])),
                  $unsigned((reg125[(3'h7):(1'h0)] ?
                      $unsigned((^reg124)) : $signed(wire119)))};
            end
          else
            begin
              reg124 <= (reg122[(4'ha):(1'h0)] == (+({$signed(wire120),
                      $unsigned(reg125)} ?
                  (|wire30) : $signed((~^(8'hbc))))));
              reg125 <= ($signed($signed((8'ha7))) ?
                  $unsigned(wire33) : ($signed((+(wire31 ? reg124 : wire30))) ?
                      wire120 : (~wire33[(2'h2):(1'h1)])));
              reg126 <= ($unsigned((($signed(reg124) ?
                      wire31[(3'h7):(3'h6)] : wire120[(3'h6):(1'h0)]) ?
                  $unsigned($unsigned(reg124)) : $unsigned((^~wire33)))) * $unsigned(wire30));
              reg127 <= (^~wire120);
              reg128 <= $unsigned(((~&$unsigned($unsigned(wire30))) ?
                  wire119[(1'h0):(1'h0)] : wire120));
            end
          if (($signed((((wire30 < reg127) ?
                      $signed(reg121) : $signed(wire33)) ?
                  $signed((-wire30)) : wire30)) ?
              ((+(reg123 ? reg123 : (wire120 && wire33))) & {(!(wire32 ?
                      reg126 : wire119)),
                  ($unsigned(wire119) != (&reg121))}) : $unsigned(wire32)))
            begin
              reg129 <= {$signed($unsigned(reg128[(3'h6):(3'h6)]))};
            end
          else
            begin
              reg129 <= reg123[(3'h5):(3'h4)];
            end
          if ((wire32 > wire33))
            begin
              reg130 <= $unsigned(wire31);
              reg131 <= $unsigned((~&$unsigned((|reg129))));
              reg132 <= $unsigned((reg129 >> $unsigned($unsigned(wire52[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg130 <= (-$unsigned(($signed((wire31 & reg127)) ~^ reg131[(2'h3):(1'h0)])));
              reg131 <= $signed((&$signed(reg132[(2'h3):(2'h3)])));
              reg132 <= (($unsigned($unsigned((7'h44))) ?
                      reg128 : $unsigned(wire119)) ?
                  ($unsigned($unsigned($unsigned(wire119))) ?
                      (+reg123) : (($unsigned(wire31) ?
                              reg125[(1'h0):(1'h0)] : {wire30}) ?
                          $unsigned((|reg124)) : reg132[(2'h2):(2'h2)])) : $unsigned(reg126));
            end
          reg133 <= $signed((($signed((reg128 <<< reg124)) ?
                  (8'h9e) : $unsigned($signed(reg121))) ?
              wire52 : (~|($unsigned((7'h40)) ?
                  (wire119 && reg122) : (^reg127)))));
        end
      reg134 <= {(!reg122[(1'h1):(1'h1)]),
          (reg129 ?
              $unsigned($signed((reg131 ? reg122 : reg132))) : (({(8'hb5),
                  reg133} | ((8'hac) || reg133)) && (~&$signed(reg132))))};
    end
  assign wire135 = {(~|(^~$signed(wire117[(2'h3):(1'h0)])))};
  module136 #() modinst163 (wire162, clk, reg124, reg129, wire52, wire31);
  assign wire164 = $signed(wire32);
  assign wire165 = $unsigned($signed($signed($signed((reg128 >= (8'hbd))))));
  assign wire166 = $unsigned($unsigned(wire117));
  assign wire167 = reg125;
  assign wire168 = ($unsigned($signed(wire167[(1'h1):(1'h1)])) ?
                       $unsigned(((reg129 ^~ wire32) ?
                           (-wire30[(4'hb):(3'h4)]) : (|$signed((8'h9f))))) : (^~{(reg124[(4'hc):(2'h2)] ?
                               (7'h40) : ((8'h9c) ? reg133 : reg123)),
                           $signed((reg133 && reg128))}));
  assign wire169 = (^(($signed($signed(reg125)) ?
                           $unsigned($unsigned((7'h42))) : ((+wire166) != (+(8'hab)))) ?
                       (^~$unsigned((wire119 ?
                           (8'hb5) : wire165))) : (^(8'ha7))));
endmodule

module module136
#(parameter param161 = ((&(^(((7'h43) && (7'h40)) | ((8'hbc) << (8'hab))))) ^ (!(((~(8'had)) ? (^(8'h9e)) : {(8'hb6), (8'hab)}) ? ({(8'hbd)} ? {(7'h44)} : ((8'ha5) < (8'hbe))) : ((^~(7'h40)) ? ((8'hac) >= (8'ha9)) : (|(7'h41)))))))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire140;
  input wire signed [(3'h7):(1'h0)] wire139;
  input wire [(5'h11):(1'h0)] wire138;
  input wire [(5'h13):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg150,
                 (1'h0)};
  assign wire141 = ({$signed((+$signed(wire137)))} ?
                       $unsigned($signed(((^~wire137) * wire139[(3'h6):(2'h3)]))) : $signed($unsigned(($unsigned(wire137) | ((8'hbf) < (8'hae))))));
  assign wire142 = wire140;
  assign wire143 = (8'hb0);
  assign wire144 = wire139;
  assign wire145 = ($unsigned($unsigned({wire142})) ?
                       ((~&(8'ha2)) == $unsigned(({(8'h9d)} ?
                           $signed(wire143) : (wire137 ?
                               (8'hb9) : wire137)))) : (7'h43));
  assign wire146 = (wire143 >> wire140);
  assign wire147 = (wire137[(1'h1):(1'h1)] ?
                       (|(~$signed(wire142[(4'hb):(2'h3)]))) : (((~|$unsigned(wire145)) ^~ $unsigned(wire145)) ~^ ((|{(8'had)}) + (~^wire145[(2'h2):(1'h1)]))));
  assign wire148 = wire137;
  assign wire149 = $signed($unsigned({$signed((wire141 ? (8'hb0) : wire145))}));
  always
    @(posedge clk) begin
      reg150 <= $unsigned(((8'haf) >> wire147));
    end
  assign wire151 = $signed((7'h43));
  assign wire152 = $unsigned((&$unsigned($signed(((8'hb1) ?
                       reg150 : wire145)))));
  assign wire153 = (~|wire145[(1'h1):(1'h1)]);
  assign wire154 = {(wire142 > wire141),
                       (&((((8'hb3) * wire147) ?
                           $signed(wire142) : (wire152 >> wire151)) - $signed(wire149[(1'h1):(1'h0)])))};
  assign wire155 = wire152[(2'h2):(2'h2)];
  assign wire156 = (&(^(!wire154)));
  assign wire157 = $unsigned({(8'hbe)});
  assign wire158 = wire142[(2'h3):(1'h0)];
  assign wire159 = {wire155[(3'h4):(1'h0)]};
  assign wire160 = wire145[(1'h0):(1'h0)];
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h286):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg78,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire60 = {($signed(((wire57 ? wire56 : (7'h41)) ?
                              wire57 : wire58[(3'h5):(2'h2)])) ?
                          ((wire59[(2'h3):(1'h0)] ?
                              wire58[(5'h13):(4'h9)] : wire56[(3'h6):(3'h4)]) == {$unsigned(wire57),
                              {wire55, wire58}}) : wire59),
                      wire55[(2'h2):(2'h2)]};
  assign wire61 = $unsigned(wire59[(2'h2):(1'h1)]);
  assign wire62 = (wire55[(4'ha):(3'h5)] ~^ $unsigned((!$unsigned($unsigned(wire56)))));
  assign wire63 = (wire61 <<< (wire57 ?
                      $unsigned(wire59) : $signed((((8'hac) ? wire57 : wire55) ?
                          (7'h43) : $unsigned(wire61)))));
  assign wire64 = {($signed({$signed((8'hb5)), wire60}) ?
                          ((~{wire57}) ?
                              $unsigned((+wire61)) : $signed($signed(wire57))) : $signed((wire59 ?
                              wire60[(3'h4):(3'h4)] : (~^wire60)))),
                      $signed((((wire57 ? wire61 : wire60) ^~ (wire58 ?
                              wire63 : wire58)) ?
                          (^~$signed(wire59)) : $unsigned(wire63[(2'h3):(1'h0)])))};
  assign wire65 = (8'h9d);
  assign wire66 = (($signed($unsigned((~^wire64))) ?
                      $signed({(wire58 < wire55)}) : $unsigned(wire59)) + wire63[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg67 <= (wire61 >>> wire56);
      reg68 <= {wire63};
      reg69 <= wire65[(1'h1):(1'h0)];
      reg70 <= (8'hb9);
    end
  assign wire71 = (($signed(({wire56} | $signed(wire55))) ?
                          {$unsigned((wire59 ^~ reg70)),
                              wire58[(5'h11):(3'h6)]} : $signed(reg69)) ?
                      (wire59 ?
                          $unsigned($signed(wire59[(3'h4):(2'h2)])) : $unsigned((wire56 | ((8'hb0) ?
                              wire58 : wire65)))) : $signed(wire59[(2'h3):(1'h0)]));
  assign wire72 = reg67[(1'h1):(1'h0)];
  assign wire73 = (&$signed(((wire66 ?
                      wire57[(2'h2):(1'h0)] : {wire61}) >> $signed(wire65[(1'h0):(1'h0)]))));
  assign wire74 = wire65[(1'h0):(1'h0)];
  assign wire75 = wire72;
  assign wire76 = (|(|(&($signed(wire59) << $unsigned(wire56)))));
  assign wire77 = wire59;
  always
    @(posedge clk) begin
      reg78 <= {($unsigned(wire57[(2'h3):(2'h2)]) <= reg69)};
      if ($unsigned({wire57[(1'h1):(1'h1)]}))
        begin
          reg79 <= (wire57 * $unsigned(($signed((reg78 ? wire72 : wire58)) ?
              {(wire63 << wire75)} : wire56[(2'h2):(2'h2)])));
          reg80 <= ({$signed(wire76[(4'hb):(3'h5)])} ?
              $signed(reg68[(2'h3):(1'h1)]) : {wire63});
        end
      else
        begin
          reg79 <= wire61[(3'h5):(2'h3)];
          if ($signed($signed(wire64)))
            begin
              reg80 <= $unsigned(reg70);
              reg81 <= reg67;
              reg82 <= reg79;
              reg83 <= {(~$signed($signed(reg80[(2'h2):(1'h0)])))};
              reg84 <= wire72;
            end
          else
            begin
              reg80 <= wire61[(4'h8):(1'h1)];
              reg81 <= reg84;
            end
          reg85 <= reg68[(4'hf):(1'h1)];
          reg86 <= wire77;
        end
      if (wire66)
        begin
          reg87 <= ((~$signed((~|(wire73 << reg67)))) || reg80[(5'h11):(4'hb)]);
          reg88 <= reg81;
          reg89 <= $signed($unsigned(wire58[(5'h10):(1'h1)]));
          reg90 <= ((+($unsigned((~|(7'h43))) ^~ wire57[(2'h3):(1'h0)])) == ($unsigned(reg79[(4'hf):(1'h1)]) ^~ wire66));
        end
      else
        begin
          if ($unsigned($signed($signed($unsigned($signed(reg87))))))
            begin
              reg87 <= (+wire60[(3'h4):(2'h2)]);
              reg88 <= reg87;
              reg89 <= ($signed((reg85 - ((wire62 > wire58) ?
                  (reg79 > wire61) : (reg80 * reg67)))) | $signed(wire58[(4'hf):(2'h2)]));
              reg90 <= (&$signed((($signed(reg84) ?
                  $signed(wire64) : (wire58 >> wire61)) && ($unsigned(reg85) <<< $signed(reg80)))));
            end
          else
            begin
              reg87 <= reg86[(5'h10):(4'hb)];
              reg88 <= wire76[(4'hb):(1'h1)];
            end
          if (wire77[(5'h11):(2'h2)])
            begin
              reg91 <= ((wire56 < {reg81[(1'h0):(1'h0)],
                      ($unsigned(reg89) <= (^~reg84))}) ?
                  $unsigned(reg79) : wire71[(1'h0):(1'h0)]);
              reg92 <= $signed(($unsigned(reg78) || (~&$signed($signed((8'ha8))))));
            end
          else
            begin
              reg91 <= ((&reg79) & $unsigned({(((8'ha2) || (8'ha7)) >>> (|(7'h41)))}));
              reg92 <= reg87[(2'h2):(1'h0)];
              reg93 <= (&wire73[(3'h4):(1'h1)]);
            end
          if (wire72[(4'ha):(3'h5)])
            begin
              reg94 <= $signed((wire66[(2'h2):(2'h2)] ?
                  $unsigned({((7'h42) < reg90), (~&(8'hae))}) : wire62));
              reg95 <= ({$unsigned({wire77}),
                      ($signed((~&reg83)) > {(~^wire61)})} ?
                  wire56[(3'h5):(2'h3)] : $unsigned(wire62[(3'h7):(3'h7)]));
              reg96 <= {reg68[(5'h11):(4'hb)]};
            end
          else
            begin
              reg94 <= (~|$signed({$signed((|wire59)),
                  ((wire59 ? reg69 : reg88) & wire64[(4'ha):(3'h7)])}));
              reg95 <= wire55;
              reg96 <= wire77[(5'h12):(4'hf)];
              reg97 <= $unsigned((8'ha9));
              reg98 <= $signed(($signed($signed($signed(reg67))) > (^~wire55[(4'ha):(3'h7)])));
            end
          reg99 <= wire63[(1'h0):(1'h0)];
          reg100 <= (~$signed((^reg90)));
        end
      reg101 <= reg84[(1'h0):(1'h0)];
      reg102 <= ((&(~^$unsigned(wire71[(5'h10):(4'h8)]))) ?
          $signed((~((reg81 ? reg101 : reg96) ?
              reg88[(1'h1):(1'h0)] : {(8'hb4),
                  reg101}))) : ((reg93 <<< (|(+wire61))) > reg82));
    end
  assign wire103 = $unsigned(($unsigned($unsigned((wire64 ^ wire63))) ?
                       $signed((^~((8'hac) ?
                           reg88 : wire61))) : ((+reg69[(3'h5):(3'h4)]) & ($signed((8'hbe)) ?
                           (+(8'ha9)) : $signed(wire62)))));
  assign wire104 = (wire75[(1'h1):(1'h0)] ?
                       $unsigned($signed({reg70[(1'h0):(1'h0)],
                           (~^reg69)})) : reg81);
  assign wire105 = reg90[(1'h1):(1'h1)];
  assign wire106 = $signed(reg90);
  assign wire107 = (($signed($signed(((7'h41) & (8'hb2)))) & wire59) + {{wire58[(5'h12):(1'h1)],
                           (^$signed(wire74))}});
  assign wire108 = wire76;
  always
    @(posedge clk) begin
      if ($unsigned(reg86[(4'ha):(3'h6)]))
        begin
          if ((wire71[(4'hb):(3'h4)] ?
              (wire58[(4'hd):(3'h6)] && ((wire56 * $unsigned(reg101)) ?
                  $signed($signed(reg88)) : (8'ha9))) : reg85))
            begin
              reg109 <= $signed((&$signed(wire75)));
              reg110 <= $unsigned(reg98[(2'h3):(2'h3)]);
              reg111 <= $unsigned(wire75[(3'h6):(3'h6)]);
              reg112 <= ($unsigned((8'hb4)) ?
                  {$unsigned(((~&reg81) ? reg88 : wire56))} : wire66);
              reg113 <= $unsigned((^~wire103[(2'h2):(1'h0)]));
            end
          else
            begin
              reg109 <= wire59;
              reg110 <= $signed((^~(({(8'ha1)} ?
                  $signed(reg95) : wire105) == ({wire56, reg112} ?
                  ((8'ha7) > (8'ha6)) : $unsigned(reg92)))));
              reg111 <= (wire75 ?
                  ((~&$unsigned(reg89[(4'hd):(4'hd)])) > {$unsigned((&wire59))}) : ((wire106[(4'he):(4'hd)] ?
                          ((^reg81) ^ $signed(wire64)) : $signed($signed(wire105))) ?
                      (-$signed((reg101 ?
                          wire72 : wire60))) : (($unsigned(reg97) == $unsigned(reg91)) ?
                          $unsigned($signed(wire105)) : (!(8'h9f)))));
            end
          reg114 <= (($signed($signed((wire73 >>> reg80))) ?
                  (~&$signed({wire106, reg96})) : wire73) ?
              (-{((wire104 + reg78) >> (wire62 ? wire61 : reg70)),
                  (&(8'hb2))}) : {reg94[(1'h0):(1'h0)], (&reg70)});
          reg115 <= reg80;
          reg116 <= wire105;
        end
      else
        begin
          reg109 <= {{$unsigned({(&reg114), (wire66 < (8'hba))}),
                  (^(((8'hb9) || reg82) && $signed(reg82)))},
              reg96};
        end
    end
endmodule

module module34
#(parameter param51 = (8'hbc))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= {(wire36[(1'h1):(1'h0)] && wire36[(2'h2):(2'h2)])};
      reg40 <= wire38[(2'h3):(2'h3)];
      reg41 <= (&reg39);
    end
  assign wire42 = $unsigned(((8'h9d) ?
                      reg41 : ($signed(wire35[(3'h4):(2'h2)]) < ({(8'hb3)} ?
                          wire35[(3'h7):(1'h0)] : $signed(wire35)))));
  assign wire43 = ((8'had) ?
                      wire35[(3'h6):(3'h5)] : $signed($signed(((wire37 | reg41) ?
                          $unsigned(reg41) : (wire35 ? wire36 : wire36)))));
  assign wire44 = ($unsigned({(^~(wire35 ?
                          wire37 : reg39))}) > {$signed(wire43)});
  assign wire45 = {wire44,
                      (~^($unsigned($signed(wire36)) ?
                          wire43 : (~|(wire43 ? reg41 : (8'ha2)))))};
  assign wire46 = (reg41 != wire43[(5'h13):(3'h7)]);
  assign wire47 = ($unsigned($unsigned((reg39 ?
                      (^~wire35) : {wire42, wire38}))) ^~ wire38);
  assign wire48 = wire35;
  assign wire49 = (-(|$signed({$unsigned((8'ha0)), (-wire35)})));
  assign wire50 = (wire38[(3'h4):(3'h4)] ? (~^$signed((8'hab))) : wire49);
endmodule

module module264
#(parameter param301 = ({((~|((8'had) ^ (8'hae))) ? (8'ha4) : ((~^(8'ha2)) ? (~(8'ha5)) : {(7'h41)})), ((~&(&(8'ha6))) ^ {{(8'hab), (8'hab)}, ((8'hb4) ? (8'ha9) : (8'hbc))})} ? (~((((8'hac) ? (8'hb8) : (8'hb7)) < ((8'ha4) ? (8'hb0) : (8'ha7))) ? (((8'ha9) <= (8'hb9)) ~^ (~|(8'ha0))) : (((8'hb7) < (8'hbe)) != ((8'had) ? (8'hba) : (8'haa))))) : (^~{({(8'haf)} <<< (~(8'hbe)))})), 
parameter param302 = (~&({(-param301), ((param301 ^ param301) >> (&param301))} << (((param301 ? param301 : param301) ? (^param301) : param301) >= {(~^param301)}))))
(y, clk, wire268, wire267, wire266, wire265);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire268;
  input wire signed [(5'h10):(1'h0)] wire267;
  input wire signed [(3'h7):(1'h0)] wire266;
  input wire [(4'h9):(1'h0)] wire265;
  wire signed [(3'h5):(1'h0)] wire300;
  wire signed [(3'h7):(1'h0)] wire297;
  wire signed [(3'h6):(1'h0)] wire296;
  wire [(4'he):(1'h0)] wire295;
  wire [(2'h3):(1'h0)] wire294;
  wire [(5'h14):(1'h0)] wire292;
  wire [(3'h6):(1'h0)] wire288;
  wire signed [(5'h10):(1'h0)] wire287;
  wire [(4'hd):(1'h0)] wire286;
  wire [(4'ha):(1'h0)] wire285;
  wire signed [(4'ha):(1'h0)] wire273;
  wire signed [(4'h9):(1'h0)] wire272;
  reg signed [(4'hb):(1'h0)] reg299 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg298 = (1'h0);
  reg [(5'h15):(1'h0)] reg293 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg291 = (1'h0);
  reg [(5'h15):(1'h0)] reg290 = (1'h0);
  reg [(3'h7):(1'h0)] reg289 = (1'h0);
  reg [(4'hb):(1'h0)] reg284 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg283 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg282 = (1'h0);
  reg [(5'h15):(1'h0)] reg281 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg280 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg279 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg278 = (1'h0);
  reg [(4'h8):(1'h0)] reg277 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg276 = (1'h0);
  reg [(5'h15):(1'h0)] reg275 = (1'h0);
  reg [(5'h10):(1'h0)] reg274 = (1'h0);
  reg [(3'h6):(1'h0)] reg271 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg270 = (1'h0);
  reg [(4'hd):(1'h0)] reg269 = (1'h0);
  assign y = {wire300,
                 wire297,
                 wire296,
                 wire295,
                 wire294,
                 wire292,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire273,
                 wire272,
                 reg299,
                 reg298,
                 reg293,
                 reg291,
                 reg290,
                 reg289,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg271,
                 reg270,
                 reg269,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg269 <= ({wire268, {wire268}} ?
          wire265 : $unsigned({((wire267 - (8'ha7)) ?
                  wire265[(3'h4):(2'h2)] : (wire265 ? wire268 : wire268)),
              $signed((wire266 ? wire268 : wire267))}));
      reg270 <= $signed($unsigned({wire265, $unsigned({(8'hb6)})}));
      reg271 <= wire267;
    end
  assign wire272 = reg270;
  assign wire273 = (reg270 ? (~|$unsigned(wire266)) : $signed(wire272));
  always
    @(posedge clk) begin
      reg274 <= wire267[(4'h8):(1'h0)];
      reg275 <= (!((8'had) ?
          reg270[(3'h4):(2'h3)] : (wire267[(3'h5):(3'h5)] ?
              $signed((~^(8'ha1))) : $signed($unsigned(wire265)))));
      if (wire273[(4'h8):(4'h8)])
        begin
          reg276 <= (-wire272[(1'h0):(1'h0)]);
          reg277 <= wire272;
        end
      else
        begin
          reg276 <= (($unsigned({((8'had) ?
                  (8'hbe) : reg270)}) >= reg269) >> $signed(($signed(reg271[(2'h3):(2'h2)]) ?
              $unsigned(((8'hbf) ? wire272 : reg270)) : ((~wire268) ?
                  (reg269 <= wire268) : $unsigned(wire265)))));
          reg277 <= ($unsigned(($signed(reg275) << $unsigned(((8'hbc) ?
                  wire268 : reg270)))) ?
              reg270 : (reg275 <<< reg277[(1'h1):(1'h0)]));
          reg278 <= ($signed(wire267[(3'h5):(3'h5)]) >> (&$signed((!(8'h9e)))));
          if (wire268[(1'h0):(1'h0)])
            begin
              reg279 <= (reg270[(3'h7):(1'h0)] ?
                  wire266 : (^({(reg271 ? reg278 : reg274),
                          reg271[(2'h3):(1'h1)]} ?
                      (~|$unsigned(reg275)) : {(reg277 && reg271)})));
              reg280 <= ($signed($unsigned((|$signed(wire268)))) ?
                  $signed(({$signed((8'ha4))} ^ ($unsigned(wire273) ?
                      $unsigned(wire272) : {wire268}))) : $unsigned($unsigned({$signed(wire266),
                      (wire267 ? (8'ha3) : (7'h44))})));
              reg281 <= wire268[(4'h8):(3'h6)];
              reg282 <= reg275[(5'h11):(4'hf)];
              reg283 <= $signed($signed((($signed((7'h41)) ?
                  (^wire266) : reg281) >>> (8'hb6))));
            end
          else
            begin
              reg279 <= $signed(($unsigned((((8'hb5) << reg277) ?
                  (^wire273) : {(8'hb5)})) >= {$unsigned($signed(reg283)),
                  reg276}));
              reg280 <= ($signed(reg283) ?
                  (((^~(^~(7'h44))) ?
                          ((wire272 << reg277) <= reg280[(4'h9):(2'h3)]) : wire272[(3'h5):(1'h1)]) ?
                      (^($unsigned(reg278) ?
                          $unsigned(wire273) : ((8'h9f) * reg270))) : ((|((8'h9c) ?
                              wire268 : reg269)) ?
                          (~^wire266) : $signed($unsigned(reg271)))) : (&(8'hbf)));
              reg281 <= (($signed($unsigned((&reg270))) ?
                  (($signed(reg282) && (reg281 != wire272)) | ((reg269 ?
                          reg282 : wire265) ?
                      (-reg279) : $unsigned(wire273))) : $signed(reg274)) | ($signed(((reg279 ^ reg276) >>> reg275)) | ($unsigned(((8'hb9) ?
                  reg274 : reg283)) << ((reg276 ?
                  (8'hab) : reg283) & (reg271 << reg283)))));
              reg282 <= reg282[(1'h1):(1'h1)];
              reg283 <= ($signed((((reg281 >>> reg269) & reg271) ?
                      ($signed(reg275) >> reg271) : $unsigned($unsigned((8'hac))))) ?
                  reg279[(3'h6):(1'h1)] : reg280);
            end
        end
      reg284 <= (~^(+reg270[(1'h1):(1'h0)]));
    end
  assign wire285 = (!$unsigned($signed(((8'hb7) ? wire272 : reg283))));
  assign wire286 = reg276;
  assign wire287 = ((&reg270) ?
                       (reg275 ?
                           ($unsigned(reg270[(4'ha):(1'h1)]) ?
                               $unsigned(((7'h43) ?
                                   reg274 : reg274)) : wire268) : reg270) : reg270);
  assign wire288 = $signed((^~(((reg275 >> wire267) & {wire265}) ?
                       $signed((+reg280)) : {(7'h44), reg279})));
  always
    @(posedge clk) begin
      reg289 <= ($signed($unsigned(wire273[(1'h1):(1'h1)])) > {$signed($signed((wire286 + wire273))),
          ($unsigned($signed((8'ha6))) >> reg279)});
      reg290 <= wire268;
      reg291 <= $unsigned((($signed($signed(wire286)) ?
          (&(reg279 ? wire268 : (8'hb4))) : {$unsigned((8'hb4)),
              (~reg280)}) >> $signed((!reg290))));
    end
  assign wire292 = $unsigned(((~(8'haf)) ?
                       wire267[(2'h3):(1'h1)] : (~|$signed(reg282))));
  always
    @(posedge clk) begin
      reg293 <= $signed($signed((((~reg271) ?
          $unsigned(wire287) : $signed(reg282)) >>> reg270[(3'h6):(2'h2)])));
    end
  assign wire294 = (wire292 < reg275[(5'h12):(3'h7)]);
  assign wire295 = (($unsigned((8'ha2)) != (&$signed(reg278[(1'h1):(1'h1)]))) ?
                       $unsigned((reg275 ?
                           $signed($signed(reg277)) : {$unsigned(reg290),
                               $unsigned(wire286)})) : $unsigned(reg290));
  assign wire296 = (({(wire267[(4'hd):(3'h4)] ?
                           (|wire285) : reg279)} || reg291[(1'h1):(1'h0)]) <<< (-((~^wire292[(4'hb):(4'ha)]) ?
                       {(wire292 >= reg271)} : ((wire292 ? wire288 : reg293) ?
                           (reg278 >= wire294) : wire272[(1'h0):(1'h0)]))));
  assign wire297 = ((reg284[(3'h7):(1'h1)] + ((~&$unsigned((8'hb0))) ?
                           wire294[(1'h0):(1'h0)] : wire292[(4'hb):(3'h6)])) ?
                       {{(reg283[(1'h1):(1'h0)] ?
                                   reg278[(2'h3):(1'h0)] : (+wire286)),
                               wire267}} : reg269);
  always
    @(posedge clk) begin
      reg298 <= $unsigned({$unsigned((+(~|reg269)))});
      reg299 <= (wire267[(3'h7):(1'h1)] >> (wire273 <= $signed(($signed(wire287) || $signed(reg277)))));
    end
  assign wire300 = wire295[(4'h8):(3'h5)];
endmodule

module module204
#(parameter param260 = ((|((8'hbf) * {((8'hbb) ? (8'hae) : (8'hae)), (|(8'h9d))})) == ((!((~|(8'h9e)) ? {(8'hb4)} : ((8'ha8) ? (7'h43) : (8'hbb)))) ? ((((8'ha6) ? (8'hbf) : (8'ha0)) + ((8'hbb) ? (8'ha8) : (8'hac))) ? ((~^(8'haa)) ? ((8'h9f) * (8'haa)) : ((8'ha7) >= (8'hab))) : {((8'hbd) <= (8'hbd)), (~|(8'hab))}) : ((((8'hab) < (8'hab)) + ((8'hac) - (8'had))) ? (((7'h40) || (7'h40)) & {(8'had)}) : (~{(8'hb1)})))), 
parameter param261 = ({(+(^~(~^param260))), {((param260 != param260) ? (param260 == param260) : param260), (8'ha0)}} > (8'ha4)))
(y, clk, wire209, wire208, wire207, wire206, wire205);
  output wire [(32'h257):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire209;
  input wire [(5'h14):(1'h0)] wire208;
  input wire signed [(5'h11):(1'h0)] wire207;
  input wire [(4'h9):(1'h0)] wire206;
  input wire signed [(4'hd):(1'h0)] wire205;
  wire [(3'h6):(1'h0)] wire259;
  wire [(5'h15):(1'h0)] wire248;
  wire [(5'h11):(1'h0)] wire247;
  wire signed [(2'h3):(1'h0)] wire246;
  wire [(4'h9):(1'h0)] wire245;
  wire [(5'h13):(1'h0)] wire244;
  wire signed [(5'h10):(1'h0)] wire243;
  wire [(4'h9):(1'h0)] wire242;
  wire signed [(4'hf):(1'h0)] wire235;
  wire signed [(4'hb):(1'h0)] wire234;
  wire signed [(4'hd):(1'h0)] wire223;
  wire [(4'hb):(1'h0)] wire222;
  wire [(3'h7):(1'h0)] wire221;
  wire signed [(4'ha):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire210;
  reg signed [(5'h15):(1'h0)] reg258 = (1'h0);
  reg [(5'h14):(1'h0)] reg257 = (1'h0);
  reg [(4'h8):(1'h0)] reg256 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg254 = (1'h0);
  reg [(4'ha):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg251 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg249 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg241 = (1'h0);
  reg [(4'hf):(1'h0)] reg240 = (1'h0);
  reg [(2'h2):(1'h0)] reg239 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg238 = (1'h0);
  reg [(5'h12):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg233 = (1'h0);
  reg [(5'h10):(1'h0)] reg232 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg231 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg230 = (1'h0);
  reg [(5'h14):(1'h0)] reg229 = (1'h0);
  reg [(4'h9):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg226 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg225 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg224 = (1'h0);
  reg [(3'h6):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg219 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg218 = (1'h0);
  reg [(4'hd):(1'h0)] reg217 = (1'h0);
  reg [(3'h5):(1'h0)] reg216 = (1'h0);
  reg [(3'h7):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg212 = (1'h0);
  assign y = {wire259,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire235,
                 wire234,
                 wire223,
                 wire222,
                 wire221,
                 wire211,
                 wire210,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 (1'h0)};
  assign wire210 = $unsigned(wire209[(1'h1):(1'h0)]);
  assign wire211 = wire206;
  always
    @(posedge clk) begin
      reg212 <= wire211[(4'h8):(4'h8)];
      reg213 <= {(reg212[(1'h1):(1'h1)] ?
              {wire205[(3'h4):(2'h2)]} : $signed(wire207))};
      reg214 <= ((8'hb7) ? $signed(wire207[(4'hc):(3'h6)]) : wire207);
      reg215 <= ($signed(((!(~&wire205)) ?
          wire209 : ((8'hb3) || (reg214 + wire207)))) >>> {$signed(((wire206 ?
              wire210 : wire205) ^~ (~&wire210)))});
    end
  always
    @(posedge clk) begin
      reg216 <= wire206[(3'h4):(1'h0)];
      reg217 <= wire207;
      if ({$unsigned((wire210[(4'he):(4'h8)] != ((~&(8'hb4)) ?
              (reg213 ? reg216 : wire210) : (wire208 ^~ reg213)))),
          $unsigned((^reg212))})
        begin
          reg218 <= $unsigned(wire210);
          if ($signed($unsigned((reg216 > $signed(wire208)))))
            begin
              reg219 <= wire210;
            end
          else
            begin
              reg219 <= reg216;
            end
        end
      else
        begin
          reg218 <= (((wire210[(5'h14):(5'h11)] ^~ wire206[(3'h6):(1'h0)]) ?
                  (reg215[(1'h0):(1'h0)] <<< reg219[(3'h5):(3'h5)]) : wire208) ?
              $unsigned(({(wire208 + reg212),
                  $signed(reg212)} ^ $unsigned($unsigned(wire209)))) : wire211);
        end
      reg220 <= (~^$unsigned($unsigned((|$unsigned(wire205)))));
    end
  assign wire221 = (|wire211[(4'h9):(4'h8)]);
  assign wire222 = $unsigned(reg213[(3'h4):(1'h0)]);
  assign wire223 = reg213[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg224 <= (reg217 ?
          ((($unsigned(reg220) ?
              ((8'hb7) ?
                  wire222 : reg213) : $unsigned(reg218)) || ((wire208 <<< wire223) ?
              reg213 : (wire208 + reg215))) << ($unsigned({reg215, wire211}) ?
              $signed($signed(wire209)) : {{wire223, wire211},
                  wire209[(1'h1):(1'h1)]})) : $unsigned((~wire221[(1'h0):(1'h0)])));
      if (wire222)
        begin
          if (reg219[(3'h5):(2'h2)])
            begin
              reg225 <= $signed(wire206);
              reg226 <= ($unsigned($signed(wire207[(5'h11):(4'he)])) - wire205[(4'hc):(3'h4)]);
              reg227 <= (~|(~&reg217));
              reg228 <= {((8'hb1) < {(reg212[(2'h3):(2'h2)] ?
                          $signed(reg216) : reg224),
                      (~^reg215[(1'h0):(1'h0)])}),
                  ({{$signed(reg216), wire211},
                          (reg214 ?
                              wire221[(3'h6):(3'h4)] : reg213[(2'h3):(2'h2)])} ?
                      (~|$signed((-reg219))) : reg226)};
              reg229 <= wire205;
            end
          else
            begin
              reg225 <= ((reg225 ?
                  $signed($signed($signed(reg226))) : (8'h9c)) - $unsigned((^~($signed(wire208) ?
                  $unsigned(reg212) : (reg227 != wire221)))));
              reg226 <= $signed((wire211 ?
                  wire221[(3'h5):(2'h3)] : {{(wire207 ? reg212 : reg213),
                          (wire223 ? reg213 : (8'hb1))},
                      $unsigned((8'ha7))}));
              reg227 <= wire207;
              reg228 <= wire205[(1'h0):(1'h0)];
              reg229 <= $unsigned(wire205);
            end
        end
      else
        begin
          reg225 <= (!((($signed(reg218) || ((8'hbd) ? reg224 : wire211)) ?
              (^~$signed(reg215)) : reg212) <= $unsigned(reg225)));
          if (reg214)
            begin
              reg226 <= $unsigned($unsigned($unsigned((reg226 + (reg215 ?
                  (8'hbd) : wire210)))));
              reg227 <= wire222;
            end
          else
            begin
              reg226 <= ({reg218} ?
                  reg212 : $unsigned((^~$unsigned($unsigned(reg214)))));
              reg227 <= wire206[(4'h9):(1'h1)];
              reg228 <= {$signed(reg214[(3'h5):(1'h1)]), wire206};
              reg229 <= $signed(reg216[(2'h3):(2'h2)]);
              reg230 <= $unsigned((~^$unsigned(((wire222 << (8'hba)) ?
                  ((8'hb2) ? reg219 : reg226) : (reg219 ? (7'h44) : reg228)))));
            end
          reg231 <= reg217;
        end
      reg232 <= ((&(($signed(reg226) ?
                  (reg215 ? wire206 : wire205) : (^~wire211)) ?
              (wire209 ?
                  $unsigned(reg230) : (reg216 && wire208)) : ((7'h44) <= (wire208 ?
                  reg224 : wire223)))) ?
          reg213[(3'h4):(3'h4)] : reg217[(4'h9):(3'h4)]);
      reg233 <= reg219[(2'h3):(1'h1)];
    end
  assign wire234 = (wire222[(1'h1):(1'h1)] >= (+$unsigned(reg213)));
  assign wire235 = (8'hbb);
  always
    @(posedge clk) begin
      reg236 <= (+$unsigned($unsigned(reg227)));
      if ((8'hac))
        begin
          reg237 <= reg236[(5'h11):(4'hf)];
          if ($unsigned($signed(reg231)))
            begin
              reg238 <= $signed($signed(wire207));
            end
          else
            begin
              reg238 <= (|reg233);
              reg239 <= wire211;
            end
        end
      else
        begin
          reg237 <= $unsigned(((reg217 != $unsigned($signed(wire208))) | reg231[(3'h6):(2'h2)]));
          reg238 <= reg217;
          reg239 <= ({(~&reg224)} || $unsigned(wire222[(3'h7):(3'h7)]));
        end
      reg240 <= (reg212[(1'h1):(1'h0)] >> $unsigned((-reg215)));
      reg241 <= wire206[(3'h7):(1'h1)];
    end
  assign wire242 = (8'hb2);
  assign wire243 = $signed(wire221[(1'h0):(1'h0)]);
  assign wire244 = ({reg228} ?
                       ((((8'hb4) <= (reg240 || wire209)) ?
                               (~&(reg237 ?
                                   reg219 : (8'haf))) : ((reg232 >>> reg229) ?
                                   reg217 : (^~(8'h9e)))) ?
                           $signed((+(~reg227))) : (&{(wire242 ?
                                   reg233 : reg213),
                               (reg232 ?
                                   reg229 : reg213)})) : $unsigned(((^~(reg230 && wire206)) ?
                           wire207[(1'h1):(1'h1)] : {(-wire211),
                               wire208[(4'hc):(4'hc)]})));
  assign wire245 = $signed(wire234);
  assign wire246 = $unsigned(($unsigned(reg230[(4'h8):(4'h8)]) ?
                       (~&$unsigned(reg225)) : $signed($signed({reg218,
                           reg230}))));
  assign wire247 = (8'ha0);
  assign wire248 = (~(~&(&(^~reg240))));
  always
    @(posedge clk) begin
      reg249 <= $signed((|(((wire221 >> wire205) ?
          (~^wire209) : (wire235 <= wire247)) * (!wire242[(3'h6):(3'h4)]))));
      reg250 <= $unsigned((((~^(~|reg240)) ?
              ((reg220 & reg220) * (wire223 ?
                  wire206 : (8'hb4))) : $unsigned((~^reg237))) ?
          reg213 : reg217[(3'h4):(2'h2)]));
      reg251 <= $unsigned(($unsigned(($signed((8'hab)) ?
          $signed(wire245) : ((8'h9d) ?
              reg215 : reg220))) ~^ $unsigned($signed({reg214, wire209}))));
    end
  always
    @(posedge clk) begin
      reg252 <= $unsigned(reg230);
      reg253 <= $unsigned((8'h9d));
      if ($unsigned($signed((8'ha3))))
        begin
          reg254 <= wire209;
        end
      else
        begin
          reg254 <= $signed($signed(($unsigned(reg237) ^ $signed($unsigned(reg218)))));
          reg255 <= $signed(((+(8'hbe)) ^ $signed((~&wire210))));
          reg256 <= reg217[(3'h4):(2'h2)];
          reg257 <= wire205[(4'hd):(4'h9)];
          reg258 <= ($unsigned(reg236[(5'h11):(3'h4)]) ^ {wire205,
              ((wire242[(2'h2):(1'h1)] ?
                  wire248 : wire222[(3'h6):(3'h6)]) <<< ($unsigned(wire223) ?
                  reg240 : (|reg237)))});
        end
    end
  assign wire259 = (8'had);
endmodule

module module184
#(parameter param200 = {((((-(8'hb2)) > ((8'h9c) ? (7'h44) : (8'hb1))) ? (~{(8'ha5)}) : ((|(8'hbb)) ? (~&(8'hb4)) : ((8'hb0) ? (8'ha3) : (8'haf)))) + (~&(((8'haf) <= (8'ha5)) ? (&(7'h43)) : (~^(8'hab))))), (^((((8'hb0) >>> (8'hbc)) << {(7'h40)}) ? ((~^(7'h40)) ? {(8'hae), (8'hb5)} : ((8'ha4) * (7'h44))) : (((8'haf) ? (8'hb8) : (8'ha5)) ? {(8'hb9), (8'hb2)} : (~(8'ha0)))))})
(y, clk, wire189, wire188, wire187, wire186, wire185);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire189;
  input wire signed [(4'hc):(1'h0)] wire188;
  input wire signed [(5'h15):(1'h0)] wire187;
  input wire signed [(4'hd):(1'h0)] wire186;
  input wire [(4'h8):(1'h0)] wire185;
  wire signed [(4'h8):(1'h0)] wire199;
  wire signed [(4'hd):(1'h0)] wire198;
  wire [(5'h12):(1'h0)] wire197;
  wire [(5'h15):(1'h0)] wire196;
  wire signed [(5'h15):(1'h0)] wire195;
  wire [(4'he):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire193;
  wire [(4'he):(1'h0)] wire192;
  wire signed [(5'h15):(1'h0)] wire191;
  wire [(3'h5):(1'h0)] wire190;
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 (1'h0)};
  assign wire190 = (-($unsigned(wire188[(3'h5):(2'h2)]) ?
                       wire189[(4'hb):(3'h5)] : (wire187 ?
                           wire189[(4'hb):(2'h3)] : ({wire188} >>> (^~wire186)))));
  assign wire191 = ((^~$unsigned($unsigned($signed(wire185)))) ?
                       $unsigned((wire187 & (~(|wire185)))) : (((&wire186) >>> wire187[(4'hd):(2'h3)]) ?
                           ($unsigned($signed(wire186)) * wire189[(4'h8):(3'h4)]) : $signed(wire190[(1'h1):(1'h1)])));
  assign wire192 = wire188;
  assign wire193 = wire187;
  assign wire194 = ($signed((~|(wire188[(2'h3):(2'h2)] ?
                       $unsigned((7'h43)) : wire185[(3'h7):(2'h3)]))) != $signed($signed((-(^~wire188)))));
  assign wire195 = $unsigned((&wire189[(4'h8):(1'h0)]));
  assign wire196 = (wire189 ?
                       (wire185[(1'h1):(1'h0)] && ($signed((|wire186)) - (|(!(8'hb3))))) : (wire194[(2'h3):(2'h2)] ?
                           wire194[(4'hc):(3'h6)] : (wire188 ^~ wire194[(3'h7):(3'h7)])));
  assign wire197 = $unsigned($unsigned((({wire193,
                       (8'hb5)} ~^ $signed(wire185)) <= (^~(wire193 ?
                       wire187 : wire186)))));
  assign wire198 = (((~^(-(wire195 ? wire190 : wire196))) ?
                           wire186[(4'h8):(3'h6)] : $unsigned(({wire196} >> $unsigned(wire185)))) ?
                       (wire187 ?
                           ((&(wire191 ? wire189 : wire188)) ?
                               $signed((wire190 ^ (8'hbf))) : $unsigned($signed(wire188))) : wire187[(3'h6):(3'h4)]) : wire192);
  assign wire199 = wire185;
endmodule
