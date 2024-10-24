module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire169;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire188;
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire169,
                 wire4,
                 wire13,
                 wire167,
                 wire185,
                 wire187,
                 wire188,
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
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = $unsigned((|$signed(wire0)));
  always
    @(posedge clk) begin
      reg5 <= $signed((wire3 - wire3[(4'h9):(3'h6)]));
      reg6 <= $signed($unsigned((!(|(reg5 ? wire0 : wire4)))));
      if ($unsigned(({reg6[(3'h7):(1'h1)], {{reg6, reg5}}} <= (((8'hab) ?
              {reg6} : (wire2 <<< wire2)) ?
          $signed(wire4) : $signed(reg6)))))
        begin
          reg7 <= wire2;
          reg8 <= {(&{(|(~&wire4)), $signed((wire3 != reg6))}), wire1};
        end
      else
        begin
          reg7 <= (((($signed(reg8) << $signed((8'hb0))) ?
                      ((~&reg8) ?
                          ((8'hba) ?
                              wire1 : reg8) : $signed(reg6)) : (reg5[(3'h4):(2'h3)] || (&wire4))) ?
                  {($signed((8'ha6)) << (reg5 < wire0))} : wire4) ?
              (~&$unsigned(($signed(wire2) ?
                  $unsigned(wire0) : (reg8 + wire4)))) : (((reg5[(1'h0):(1'h0)] >= ((8'hb3) - reg7)) ?
                  reg6[(1'h1):(1'h0)] : reg7) > (reg5[(2'h2):(1'h0)] ?
                  wire2[(3'h5):(3'h4)] : (^$unsigned(reg7)))));
          reg8 <= (~&$signed((+reg8[(3'h5):(1'h1)])));
          reg9 <= reg8;
          reg10 <= {reg5[(3'h5):(3'h5)],
              (reg7 ?
                  (($signed((8'hb9)) && $unsigned(reg7)) > $signed((wire0 ?
                      (8'h9f) : reg5))) : (($unsigned(reg9) >> (wire0 ?
                      reg6 : reg8)) * reg8[(1'h1):(1'h0)]))};
        end
      reg11 <= wire2[(3'h5):(1'h0)];
      reg12 <= (~&$signed($unsigned($signed({reg9, reg7}))));
    end
  assign wire13 = (+(8'hab));
  module14 #() modinst168 (wire167, clk, reg10, wire0, reg11, reg12);
  assign wire169 = {$signed($signed($signed((~wire167))))};
  always
    @(posedge clk) begin
      reg170 <= $signed(((~reg6) >= (^~(8'hb2))));
      if (({({(~&(8'ha2)), reg8[(2'h3):(2'h3)]} > reg11[(2'h3):(2'h3)]),
              ($unsigned((~&wire0)) <<< $signed((^wire4)))} ?
          ((reg170 & $unsigned({wire169})) ?
              wire2[(4'hc):(4'ha)] : reg11[(1'h0):(1'h0)]) : (!$unsigned((^(reg10 ?
              reg10 : wire167))))))
        begin
          reg171 <= {$unsigned((&(&(reg12 >>> wire2))))};
          reg172 <= (({((reg9 && reg171) || (reg6 >>> wire169)),
                  $unsigned(reg7[(3'h4):(2'h3)])} ?
              (!$unsigned($signed(reg10))) : reg8) >> $signed({reg12[(4'hf):(4'he)],
              ($unsigned(reg12) << (&reg171))}));
          reg173 <= reg172[(3'h7):(3'h7)];
        end
      else
        begin
          reg171 <= reg172;
          reg172 <= $unsigned((reg5[(1'h1):(1'h0)] ?
              (({reg6} || $unsigned(wire167)) ?
                  ((&reg9) ?
                      $unsigned(reg7) : (reg6 + (8'ha4))) : $unsigned($signed(reg10))) : reg170));
          reg173 <= (wire2[(3'h4):(3'h4)] ?
              (+(&(wire1[(3'h6):(3'h6)] ?
                  wire169[(4'hf):(4'he)] : wire167))) : reg11[(4'hd):(4'ha)]);
          reg174 <= $signed(wire167);
          reg175 <= wire13;
        end
      if ((wire2[(4'ha):(1'h0)] <= $unsigned({(reg172[(1'h0):(1'h0)] ?
              $signed(reg11) : reg9[(2'h2):(1'h0)])})))
        begin
          reg176 <= (!reg7[(1'h0):(1'h0)]);
          reg177 <= $unsigned($signed({reg9[(3'h6):(3'h5)]}));
          reg178 <= ($unsigned((~|({(8'hb9), reg171} ?
              (^~(8'ha8)) : reg11))) + (~^(wire2 != {wire167,
              (reg173 << reg9)})));
          reg179 <= $unsigned(((|$unsigned($unsigned(reg170))) ^ ((8'hb3) ?
              $signed((~&wire3)) : reg8)));
        end
      else
        begin
          if ((~^$unsigned((-(reg5[(1'h1):(1'h0)] & $signed((8'ha5)))))))
            begin
              reg176 <= reg174[(2'h3):(2'h3)];
              reg177 <= ((!$unsigned(($signed(reg172) ?
                  $signed(reg5) : reg11))) | (^~reg9[(3'h6):(2'h2)]));
            end
          else
            begin
              reg176 <= $unsigned((~$signed(($unsigned(wire1) >>> $signed(reg174)))));
            end
        end
    end
  assign wire180 = $unsigned((^{reg174[(1'h0):(1'h0)],
                       ((!reg5) ?
                           (wire167 ? reg171 : (8'ha1)) : $signed(wire3))}));
  assign wire181 = $unsigned((8'haf));
  assign wire182 = $signed($signed((|$signed($unsigned(reg174)))));
  module133 #() modinst184 (wire183, clk, reg6, reg172, wire180, reg9);
  module22 #() modinst186 (wire185, clk, wire181, wire169, wire2, wire167);
  assign wire187 = $signed((^~{(reg173[(1'h0):(1'h0)] == reg179[(2'h2):(1'h0)]),
                       (^~reg6[(4'ha):(3'h7)])}));
  module133 #() modinst189 (wire188, clk, reg5, wire182, wire181, wire180);
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire164;
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  assign y = {wire166,
                 wire126,
                 wire114,
                 wire112,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire19,
                 wire21,
                 wire88,
                 wire132,
                 wire164,
                 reg20,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 (1'h0)};
  assign wire19 = $signed($signed($unsigned((~|$unsigned(wire18)))));
  always
    @(posedge clk) begin
      reg20 <= $unsigned(($unsigned(wire19[(3'h4):(1'h0)]) ?
          wire17[(3'h7):(3'h7)] : (8'hb4)));
    end
  assign wire21 = {(^~wire16), $unsigned(wire17[(2'h2):(1'h1)])};
  module22 #() modinst89 (wire88, clk, reg20, wire19, wire18, wire15);
  assign wire90 = $unsigned(wire19[(2'h2):(1'h0)]);
  assign wire91 = {$unsigned($signed((!(~|wire88))))};
  assign wire92 = (8'ha0);
  assign wire93 = ($unsigned(wire90[(3'h4):(2'h2)]) ?
                      ($signed(($signed(wire92) >= (wire90 + wire91))) && $unsigned(wire15)) : wire91);
  module94 #() modinst113 (wire112, clk, wire18, wire19, wire90, wire92);
  assign wire114 = {$unsigned(wire90[(5'h10):(5'h10)]), wire93[(2'h2):(2'h2)]};
  module115 #() modinst127 (wire126, clk, wire21, wire92, reg20, wire18);
  always
    @(posedge clk) begin
      reg128 <= {$unsigned($unsigned({{(8'h9e)}, (wire92 ? reg20 : (8'hb4))}))};
      reg129 <= ((wire18 * (+wire112[(4'hc):(3'h7)])) < $unsigned($signed((wire15[(4'ha):(1'h1)] <= reg20))));
      reg130 <= (~&reg20[(5'h15):(4'h9)]);
      reg131 <= (^((8'hb8) * $signed(wire21[(2'h3):(1'h0)])));
    end
  assign wire132 = $signed($unsigned((~&(~^(wire92 ^ wire16)))));
  module133 #() modinst165 (wire164, clk, wire18, wire19, reg128, wire16);
  assign wire166 = $unsigned(reg130);
endmodule

module module133  (y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire137;
  input wire signed [(5'h11):(1'h0)] wire136;
  input wire signed [(5'h11):(1'h0)] wire135;
  input wire signed [(4'hf):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(4'h9):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire138;
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire140,
                 wire138,
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
                 reg139,
                 (1'h0)};
  assign wire138 = (^~((((-(7'h44)) ?
                               (wire136 ?
                                   wire137 : wire136) : (wire137 ~^ wire134)) ?
                           $signed($signed(wire137)) : (&$unsigned(wire136))) ?
                       {(+wire136[(2'h2):(2'h2)]),
                           $unsigned({wire136})} : wire134));
  always
    @(posedge clk) begin
      reg139 <= (wire137[(4'ha):(1'h1)] >> ((~&(7'h43)) - wire134));
    end
  assign wire140 = {$signed({$unsigned(wire134)})};
  always
    @(posedge clk) begin
      if ((+$unsigned((8'hb0))))
        begin
          reg141 <= $unsigned($unsigned({((wire140 == reg139) ?
                  $unsigned(wire138) : (wire138 ? wire134 : wire140)),
              wire140}));
        end
      else
        begin
          reg141 <= (8'h9e);
          reg142 <= $signed(wire134);
          reg143 <= ((~$signed(({(7'h40)} ? $unsigned(wire134) : (!wire140)))) ?
              $unsigned(reg141[(4'h9):(3'h4)]) : {(wire135[(3'h4):(1'h0)] ?
                      reg142 : wire140),
                  $signed({$unsigned(wire136), (~wire134)})});
          reg144 <= {(reg142 ?
                  {wire135[(4'h9):(3'h5)],
                      wire136[(5'h11):(4'hb)]} : $unsigned((wire137 ?
                      ((8'hbd) ? (8'hbb) : wire140) : wire135))),
              $unsigned(wire140[(1'h0):(1'h0)])};
        end
      if ($unsigned($signed(($signed((wire137 ? wire138 : wire135)) ?
          $unsigned(((8'ha5) ?
              wire136 : reg144)) : ($unsigned(reg142) << (wire140 + reg139))))))
        begin
          if ($unsigned($unsigned(($unsigned($unsigned(wire137)) && (wire138 ?
              wire140[(3'h5):(2'h3)] : wire140)))))
            begin
              reg145 <= wire140[(3'h4):(3'h4)];
              reg146 <= $unsigned((-(($unsigned(wire136) < {(8'ha3)}) ?
                  reg143[(1'h0):(1'h0)] : $unsigned(wire134))));
              reg147 <= (($unsigned($signed({reg144,
                  reg145})) ^ (^$signed({wire137}))) ^ ($unsigned(reg146) ~^ ($unsigned((|(8'haa))) ^ (^wire135))));
              reg148 <= ($signed($signed((+wire137))) >>> ($unsigned({$signed(wire136),
                      (reg141 << reg144)}) ?
                  (8'hb6) : (|(7'h43))));
              reg149 <= ($unsigned(((reg141[(3'h7):(3'h7)] - {wire134,
                      reg142}) ?
                  reg145[(1'h0):(1'h0)] : reg145)) + reg141);
            end
          else
            begin
              reg145 <= reg142;
            end
          reg150 <= ((|$unsigned((|$signed(wire135)))) ?
              (|$unsigned((~$signed(reg145)))) : (($signed((8'hb6)) << ({reg145,
                  reg141} && ((8'hbc) && wire135))) ~^ reg142[(2'h3):(1'h0)]));
          reg151 <= (((((|reg146) ? $unsigned(reg148) : $signed(reg149)) ?
                  (+(reg146 <<< reg149)) : $unsigned((reg143 ?
                      (8'h9f) : reg141))) - $signed(((reg144 ?
                      reg147 : wire135) ?
                  wire137 : {reg142}))) ?
              (~$unsigned(((reg144 ? wire137 : reg139) ?
                  (reg144 ?
                      (8'hb8) : reg141) : (wire135 << wire140)))) : wire134[(3'h7):(3'h5)]);
          if (reg142[(1'h1):(1'h1)])
            begin
              reg152 <= (!reg147[(2'h2):(1'h1)]);
            end
          else
            begin
              reg152 <= (~^$signed(reg146));
              reg153 <= $signed(reg152[(2'h2):(1'h1)]);
            end
          if (wire135[(4'h9):(3'h6)])
            begin
              reg154 <= (+$signed($unsigned(($unsigned((7'h42)) | {wire135,
                  reg141}))));
              reg155 <= reg151;
              reg156 <= $unsigned($signed(((~|(reg155 ?
                  reg145 : reg144)) || $unsigned(reg150))));
              reg157 <= $signed((wire136 ?
                  reg141 : (reg143 ?
                      $unsigned(wire138[(1'h0):(1'h0)]) : $unsigned((~^(8'ha5))))));
              reg158 <= reg154[(3'h4):(1'h1)];
            end
          else
            begin
              reg154 <= $signed(wire137[(1'h1):(1'h1)]);
              reg155 <= $unsigned($signed((reg149[(4'hc):(4'h8)] ?
                  $unsigned({reg151,
                      reg148}) : ((wire137 >>> wire136) && reg141[(3'h5):(1'h1)]))));
            end
        end
      else
        begin
          reg145 <= reg146;
          reg146 <= (8'hae);
          reg147 <= (reg157[(4'he):(4'h9)] ?
              (({reg148[(2'h2):(2'h2)], reg153} ?
                      {(wire135 << reg144)} : ($unsigned(reg150) ?
                          reg147[(1'h1):(1'h0)] : $signed((8'hbc)))) ?
                  ($unsigned((|(8'ha0))) ?
                      {reg149} : wire136[(3'h6):(3'h5)]) : ($signed((reg156 ?
                          reg156 : reg145)) ?
                      $unsigned({wire135}) : reg153)) : (-{(reg146[(2'h2):(1'h0)] != {wire134}),
                  ((wire135 ? reg150 : reg150) ?
                      $signed((8'hb3)) : (reg148 ? reg149 : reg142))}));
          reg148 <= $signed(((wire138[(3'h7):(2'h3)] ?
              (!reg141[(2'h2):(2'h2)]) : ($unsigned(reg147) ?
                  (^~reg148) : $signed(reg147))) | $signed((8'haf))));
          if ((((reg158 ? ((8'ha0) > reg153) : (+$unsigned(wire135))) ?
              ((!reg143) ?
                  reg157[(2'h3):(2'h2)] : $signed((~(8'ha8)))) : reg153[(3'h5):(1'h0)]) ~^ ($signed(reg154) ~^ reg158[(5'h14):(5'h12)])))
            begin
              reg149 <= $signed((+(^{reg153[(3'h6):(1'h0)]})));
              reg150 <= ({reg141} ?
                  (!(-{(wire134 & wire135)})) : (&reg150[(3'h4):(2'h3)]));
              reg151 <= wire136[(5'h10):(3'h7)];
              reg152 <= reg149[(4'ha):(4'ha)];
              reg153 <= ((^$signed(reg158[(5'h12):(4'ha)])) <<< ((((-reg150) ?
                          (8'hbd) : reg142) ?
                      {(reg139 ^ (8'hb3))} : $signed($unsigned((8'had)))) ?
                  {$signed(((8'hb1) > wire137))} : $signed($signed($unsigned(reg150)))));
            end
          else
            begin
              reg149 <= reg147[(2'h2):(1'h0)];
              reg150 <= ((+$unsigned($unsigned($unsigned(reg145)))) ?
                  wire137 : (7'h44));
              reg151 <= reg154;
              reg152 <= $unsigned({(8'hae)});
            end
        end
      reg159 <= (^~(^reg145[(1'h0):(1'h0)]));
      reg160 <= (8'ha5);
      reg161 <= $unsigned($unsigned({$signed($signed(reg152))}));
    end
  assign wire162 = wire134;
  assign wire163 = {((($signed(reg161) ^~ {reg145, wire140}) ?
                           $unsigned($unsigned(reg151)) : wire138) <= $unsigned(reg143)),
                       $unsigned(reg141[(2'h2):(1'h0)])};
endmodule

module module115
#(parameter param124 = (8'ha4), 
parameter param125 = ((!(param124 ? (8'hb9) : param124)) ? (param124 ? (~|param124) : (param124 ? (param124 ? (param124 ? param124 : param124) : (~&param124)) : (8'ha3))) : param124))
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire119;
  input wire [(5'h10):(1'h0)] wire118;
  input wire signed [(2'h2):(1'h0)] wire117;
  input wire signed [(4'he):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  assign y = {wire123, wire122, wire121, wire120, (1'h0)};
  assign wire120 = $unsigned(wire118);
  assign wire121 = wire118[(3'h4):(1'h0)];
  assign wire122 = ({wire117[(2'h2):(1'h1)]} || $unsigned((~($signed(wire121) ?
                       (+(8'hbc)) : $signed(wire116)))));
  assign wire123 = $unsigned(wire120);
endmodule

module module94  (y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire98;
  input wire signed [(4'hf):(1'h0)] wire97;
  input wire signed [(5'h14):(1'h0)] wire96;
  input wire [(5'h13):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire99;
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire99,
                 reg109,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = (7'h44);
  always
    @(posedge clk) begin
      if ((!wire98[(3'h4):(2'h3)]))
        begin
          reg100 <= $unsigned($signed(wire99[(1'h1):(1'h0)]));
          reg101 <= wire95[(3'h6):(2'h3)];
          reg102 <= {($signed((~reg101)) > (({wire95, wire96} ?
                  {reg101, wire99} : wire97) << $unsigned((&wire99))))};
          reg103 <= ($signed(wire97[(4'hc):(4'hc)]) ? reg100 : wire99);
          reg104 <= wire96[(3'h4):(2'h2)];
        end
      else
        begin
          reg100 <= wire95;
          reg101 <= $signed({(^reg104[(1'h0):(1'h0)])});
        end
    end
  assign wire105 = $unsigned(($unsigned(((~^(8'hb8)) ?
                           (reg100 ? wire95 : wire98) : (wire98 ?
                               wire95 : reg100))) ?
                       $signed($signed({wire97})) : (wire99 ^~ ((wire97 ?
                           reg104 : reg101) ^~ $unsigned(reg103)))));
  assign wire106 = $signed(((reg104 * wire97[(4'h8):(4'h8)]) == {reg101[(3'h7):(3'h7)],
                       $unsigned((reg104 - (8'hb5)))}));
  assign wire107 = ((reg104[(1'h1):(1'h1)] ?
                           reg102 : {(8'hbe), $unsigned($unsigned(wire106))}) ?
                       ($unsigned(((reg101 || (8'ha3)) ?
                           (&wire99) : wire97)) >>> $signed((~&(8'hb3)))) : $unsigned({wire97[(3'h6):(3'h5)]}));
  assign wire108 = {(((8'hb4) ? reg103 : ((!wire99) <<< wire107)) ?
                           $unsigned(reg102[(5'h10):(1'h0)]) : (~&((wire96 ?
                                   reg100 : (8'hb2)) ?
                               $signed(wire95) : wire99))),
                       $unsigned($signed($signed((reg101 & reg102))))};
  always
    @(posedge clk) begin
      reg109 <= $unsigned($signed($signed(wire106)));
    end
  assign wire110 = wire107[(3'h5):(3'h5)];
  assign wire111 = $signed($unsigned((~$unsigned($unsigned(wire107)))));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h2bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire27 = ({(8'h9d), wire24[(3'h4):(1'h0)]} ?
                      {$unsigned($signed(((8'hb8) <= wire24)))} : wire25[(2'h2):(1'h0)]);
  assign wire28 = (wire27[(3'h4):(1'h1)] ?
                      wire27[(1'h1):(1'h1)] : ($unsigned($signed($unsigned(wire24))) ?
                          (&(8'ha8)) : $signed($signed(wire23))));
  assign wire29 = (~|($signed(($signed(wire24) ?
                      wire24 : ((8'h9c) ?
                          wire26 : wire28))) > {{(wire27 >= wire27)}}));
  assign wire30 = {(wire29 <<< wire29[(3'h7):(1'h0)]),
                      (wire26[(4'h9):(3'h4)] ^ ((wire25 ?
                          (wire25 ^ wire27) : wire26[(4'hd):(1'h0)]) <<< ((wire25 ?
                          wire28 : wire24) ^~ $unsigned(wire24))))};
  assign wire31 = ((!$signed($unsigned({wire28}))) ?
                      $signed($signed(((wire28 ? wire23 : wire27) ?
                          $unsigned(wire28) : $unsigned(wire24)))) : (~&wire24));
  always
    @(posedge clk) begin
      reg32 <= $signed(wire25);
      if ((~$unsigned(((~(^~wire27)) ^~ (-$signed(wire24))))))
        begin
          if (wire26[(1'h1):(1'h1)])
            begin
              reg33 <= (+wire25[(2'h2):(2'h2)]);
              reg34 <= ($unsigned((&wire28[(2'h2):(1'h1)])) ?
                  wire28 : ((((&wire27) ?
                          wire28 : (^reg33)) != $unsigned({wire28})) ?
                      $unsigned(((!wire23) ?
                          (+wire28) : (wire24 >= reg33))) : $signed(((reg33 ?
                              wire30 : (8'ha1)) ?
                          wire25 : reg32[(1'h0):(1'h0)]))));
              reg35 <= {$unsigned(reg34)};
            end
          else
            begin
              reg33 <= {reg32[(1'h1):(1'h0)]};
              reg34 <= reg33;
              reg35 <= $unsigned($signed((reg35[(4'hc):(3'h7)] ?
                  wire24[(2'h2):(1'h1)] : $signed({wire30, (7'h41)}))));
              reg36 <= (({($signed(wire24) & $unsigned(reg35)),
                          $signed({wire31})} ?
                      ({$unsigned((8'hbd)), wire27[(1'h1):(1'h0)]} ?
                          $signed((-reg34)) : ((|(8'had)) ?
                              (reg32 ?
                                  reg33 : wire29) : $unsigned(wire26))) : (|reg33)) ?
                  (wire30 ?
                      (8'hb1) : $signed($unsigned($unsigned((8'hb3))))) : ((wire26 >> (+{wire27,
                          reg34})) ?
                      (reg32[(1'h1):(1'h0)] ? wire24 : reg34) : (8'haf)));
              reg37 <= (reg36 <<< (+{(wire24 ?
                      wire27[(4'hc):(4'h9)] : (reg33 != wire30))}));
            end
          reg38 <= {{((reg32[(1'h1):(1'h1)] ?
                          (wire30 ? reg35 : wire27) : (reg33 ?
                              reg35 : wire24)) ?
                      $unsigned(wire26[(3'h4):(1'h1)]) : $unsigned($unsigned(reg36)))}};
        end
      else
        begin
          reg33 <= $signed($signed((~^((wire23 <<< reg34) == (wire25 ?
              wire28 : wire30)))));
          if (($signed($signed($signed(wire25[(2'h2):(1'h1)]))) & {({wire29} ^ $signed($unsigned(wire30)))}))
            begin
              reg34 <= wire31;
            end
          else
            begin
              reg34 <= ((~^((wire23[(2'h3):(2'h3)] > (~|wire31)) ?
                      ($signed(wire28) == $signed(wire29)) : (wire26 || (^reg37)))) ?
                  (&$unsigned((^~$unsigned((7'h40))))) : reg35[(4'he):(2'h2)]);
              reg35 <= wire25;
              reg36 <= {$signed((wire24[(1'h1):(1'h0)] ?
                      {wire26} : $signed($unsigned(reg32))))};
              reg37 <= $unsigned((~&$signed({(wire29 ^~ reg32)})));
              reg38 <= (wire29[(3'h7):(3'h5)] * $signed((($unsigned((8'hb2)) ?
                  wire29[(3'h6):(1'h1)] : (|(8'hae))) & wire31)));
            end
          if (wire30)
            begin
              reg39 <= (reg35[(3'h7):(3'h7)] & $signed(reg36[(3'h4):(2'h2)]));
              reg40 <= $unsigned(wire31);
              reg41 <= wire29;
              reg42 <= reg35[(1'h0):(1'h0)];
            end
          else
            begin
              reg39 <= (wire27 ?
                  ($signed({(reg40 ? wire27 : reg34)}) | (((wire29 ?
                      wire31 : (7'h41)) > (reg42 ?
                      (8'hba) : wire26)) && (~|{(8'ha7),
                      (8'ha6)}))) : (~&$signed((~&$signed((8'h9d))))));
              reg40 <= ((~^((wire28[(2'h3):(1'h0)] <<< $unsigned(wire31)) ?
                  {reg38,
                      (wire29 ?
                          (8'hb8) : reg37)} : $signed($signed(wire28)))) << reg37[(5'h12):(4'hd)]);
              reg41 <= ((&((~&reg36) - (~|{reg36, (8'ha8)}))) ?
                  $unsigned((~^(reg39[(4'hb):(4'hb)] == (|reg40)))) : reg39[(1'h1):(1'h1)]);
            end
          if ((~|({$signed((reg35 ? reg39 : reg39)),
                  (|(wire28 ? reg39 : reg35))} ?
              (|({wire29} ? $signed(reg35) : {wire30, wire26})) : wire23)))
            begin
              reg43 <= $unsigned({{($signed(wire25) <= (reg32 ?
                          reg35 : (8'hb8))),
                      {(reg41 < reg35)}},
                  wire27[(3'h7):(2'h2)]});
            end
          else
            begin
              reg43 <= (($signed($signed(wire29[(4'ha):(4'ha)])) <= (wire30[(4'hd):(4'h8)] + wire27[(1'h1):(1'h0)])) ?
                  $signed($unsigned({((8'hb1) ? (8'hb5) : reg37),
                      (^~reg38)})) : $unsigned((^~$signed($unsigned(reg40)))));
              reg44 <= reg38;
              reg45 <= $signed(reg43[(5'h14):(5'h11)]);
            end
          reg46 <= reg37[(5'h10):(4'hf)];
        end
      if ($signed(wire23))
        begin
          reg47 <= reg41[(2'h3):(1'h1)];
          reg48 <= ($unsigned((reg33[(3'h5):(2'h2)] >>> {reg47})) * (~|(!wire30[(5'h12):(4'h8)])));
          if (reg33)
            begin
              reg49 <= $unsigned($unsigned($unsigned($signed($signed(reg43)))));
              reg50 <= (^(~^(reg43 ? wire23 : (^~{wire31}))));
            end
          else
            begin
              reg49 <= ((~(^~$unsigned((8'hac)))) ?
                  ((8'hae) ? (|$signed(reg32)) : reg38) : (reg32 ?
                      $unsigned($signed((wire24 != reg41))) : $signed($signed((reg35 ?
                          wire29 : reg48)))));
              reg50 <= (~&(8'hb0));
              reg51 <= $signed(reg41[(4'hd):(3'h4)]);
              reg52 <= wire24[(3'h4):(3'h4)];
            end
          reg53 <= ((~&$unsigned(({reg36, reg49} ^~ (8'h9f)))) ?
              $signed($signed((wire23 ?
                  wire23 : $signed(reg32)))) : (^~$signed(reg37[(3'h7):(3'h6)])));
          reg54 <= wire23;
        end
      else
        begin
          reg47 <= (wire27 & $signed($signed({(~^reg40), $unsigned(reg41)})));
        end
      reg55 <= (($unsigned($signed(wire24)) < (wire24[(3'h4):(1'h1)] + ((+reg48) > $signed(wire25)))) ?
          (!$signed((~^((8'hbe) ? reg52 : reg42)))) : (((~|(wire23 ?
                  (8'hbb) : reg52)) > (|(reg38 ^ reg41))) ?
              reg39 : $unsigned((|reg46))));
      reg56 <= reg42[(4'hd):(4'h9)];
    end
  assign wire57 = (($unsigned(reg32[(1'h1):(1'h1)]) + (((wire26 <<< reg44) | wire24[(1'h0):(1'h0)]) ?
                          reg36 : (!wire25[(1'h1):(1'h1)]))) ?
                      $signed((($signed(reg55) <= (reg38 ^~ reg39)) ?
                          $signed((reg32 == reg53)) : ({reg56} < (~&reg46)))) : reg54[(3'h5):(2'h2)]);
  assign wire58 = wire26[(4'hb):(1'h0)];
  assign wire59 = (~^(&(+$signed((wire30 ? reg39 : wire28)))));
  assign wire60 = {wire28[(1'h0):(1'h0)]};
  assign wire61 = ($unsigned($unsigned($unsigned((wire60 ? reg32 : reg54)))) ?
                      ((wire26 != wire59) ?
                          ({(wire58 ? reg47 : reg36),
                              wire30[(4'hc):(2'h2)]} - wire59[(1'h1):(1'h1)]) : reg55[(2'h3):(1'h0)]) : (($signed(wire29) ?
                              $signed(reg40[(2'h2):(1'h0)]) : {((8'h9d) ~^ reg41)}) ?
                          reg34 : {reg44[(3'h6):(3'h5)]}));
  assign wire62 = ($signed($signed(wire23[(5'h11):(4'hb)])) ?
                      $unsigned(($signed((^~(7'h41))) == (|$signed(wire23)))) : {$unsigned((|((8'hbc) >>> wire29))),
                          {reg46, (((8'hbe) <<< wire27) & $unsigned(reg45))}});
  assign wire63 = reg44[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg64 <= reg54;
      reg65 <= $signed(wire27);
      if (((7'h41) ?
          ($signed($signed((wire58 ^~ wire61))) ?
              ((wire27[(2'h2):(2'h2)] >= (~&(7'h41))) ?
                  {((7'h41) ^~ wire29), $signed(wire63)} : {$signed(reg40),
                      (~|(8'h9e))}) : $signed((+$unsigned((8'hab))))) : $unsigned(reg32[(1'h0):(1'h0)])))
        begin
          reg66 <= {$signed($unsigned(($unsigned(reg33) <= $unsigned(reg52)))),
              $signed(((^(~^wire29)) ?
                  (wire61[(1'h0):(1'h0)] < (reg39 < reg64)) : {reg53[(4'hd):(4'hd)],
                      $unsigned(reg43)}))};
          if ((~&$signed({(reg64 ? {reg43} : $signed((8'hb5)))})))
            begin
              reg67 <= {reg66, (8'h9c)};
              reg68 <= (($signed($unsigned((reg32 >>> reg53))) ?
                      wire29[(3'h5):(1'h1)] : reg48[(3'h6):(3'h4)]) ?
                  (~|reg34[(3'h6):(1'h1)]) : $signed((+{$unsigned((8'haa)),
                      {reg43}})));
              reg69 <= (^~($signed($unsigned($unsigned(wire28))) && reg68[(1'h1):(1'h1)]));
              reg70 <= wire62[(3'h4):(3'h4)];
            end
          else
            begin
              reg67 <= ((~$signed((~|reg66))) ?
                  reg69 : {($signed(wire28[(1'h1):(1'h0)]) == wire24[(3'h5):(1'h0)])});
            end
          reg71 <= $unsigned(($unsigned(wire63) || $signed((((8'hae) + reg33) ?
              ((8'ha6) ? reg49 : wire60) : {(8'hbf), reg66}))));
        end
      else
        begin
          reg66 <= $unsigned(reg40);
          reg67 <= (&(wire23 & (8'h9c)));
          reg68 <= (($unsigned($signed($signed(reg64))) ?
              $signed({reg47[(4'he):(3'h5)]}) : ($unsigned((reg71 != reg54)) ?
                  {(^wire23),
                      (reg56 || wire30)} : $unsigned($unsigned(reg33)))) >= $unsigned($unsigned(((reg56 >= wire23) >= (8'hb3)))));
        end
      if ($unsigned((reg65[(2'h2):(1'h1)] <<< (((&reg46) ?
          $signed(reg44) : (reg70 ? reg56 : reg42)) & (wire62[(2'h3):(2'h2)] ?
          {(8'ha4)} : (~reg42))))))
        begin
          reg72 <= (wire60[(3'h5):(3'h4)] & $signed((($signed((8'hb3)) != (wire23 && (8'hb6))) > ({wire61} ?
              {reg54} : (reg49 & (8'ha9))))));
          reg73 <= ({(8'hb9),
              wire29[(4'he):(3'h6)]} <= ((wire61[(2'h2):(1'h0)] ^ reg66[(1'h0):(1'h0)]) <<< $unsigned((reg47 > wire28[(1'h1):(1'h0)]))));
          reg74 <= $signed($unsigned($unsigned(({reg53, wire29} ?
              $unsigned(reg71) : {reg41, reg40}))));
        end
      else
        begin
          reg72 <= reg55;
        end
    end
  assign wire75 = $unsigned($signed(((reg64 ? reg70[(3'h7):(3'h5)] : (!reg33)) ?
                      {(reg42 | wire27),
                          reg46[(4'he):(4'hc)]} : ($signed((7'h42)) << reg69))));
  always
    @(posedge clk) begin
      reg76 <= (wire31[(1'h1):(1'h0)] ?
          reg72[(3'h7):(2'h3)] : (reg71[(1'h0):(1'h0)] ?
              $signed(reg46[(4'hd):(4'hb)]) : reg70));
      reg77 <= reg69;
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned((7'h43));
      reg79 <= ((reg41[(2'h3):(2'h3)] == ($unsigned($unsigned(wire27)) ?
              $unsigned((^~reg69)) : {$unsigned((8'hbb)), (reg74 || reg35)})) ?
          reg40 : (^~reg35[(1'h1):(1'h0)]));
      reg80 <= $unsigned($signed(reg35));
      reg81 <= ((8'hb8) ?
          (reg74[(3'h7):(2'h2)] ?
              (((wire58 + (8'hbb)) * reg54[(1'h1):(1'h1)]) ?
                  (wire62[(2'h3):(2'h3)] ?
                      (reg41 ?
                          wire58 : reg50) : wire59[(1'h1):(1'h1)]) : $unsigned((reg50 ?
                      wire30 : (8'hb7)))) : ($unsigned(reg47) <<< reg79[(2'h2):(2'h2)])) : (8'ha2));
      reg82 <= (+$unsigned((8'ha7)));
    end
  always
    @(posedge clk) begin
      reg83 <= reg43;
      reg84 <= {(~|$unsigned(($unsigned(reg66) ?
              $unsigned((8'hb7)) : (reg48 * wire63)))),
          $unsigned(wire27)};
    end
  assign wire85 = $signed($unsigned($signed(reg72)));
  assign wire86 = wire23;
  assign wire87 = reg44;
endmodule
