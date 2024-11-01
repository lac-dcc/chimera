module top #(parameter param182 = (8'ha8)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire179;
  wire [(5'h12):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire173;
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire4,
                 wire173,
                 (1'h0)};
  assign wire4 = wire0[(5'h14):(2'h2)];
  module5 #() modinst174 (.wire8(wire4), .wire9(wire0), .wire7(wire3), .y(wire173), .wire6(wire1), .clk(clk), .wire10(wire2));
  assign wire175 = wire0;
  assign wire176 = (~|$signed($signed(wire1)));
  assign wire177 = wire173[(1'h1):(1'h1)];
  assign wire178 = $unsigned(wire0);
  assign wire179 = wire2;
  assign wire180 = ($unsigned(($unsigned($unsigned(wire173)) ?
                       $signed((wire173 - wire179)) : $signed($unsigned(wire2)))) <= (^~$signed(wire178[(2'h3):(2'h3)])));
  assign wire181 = (wire1[(4'hd):(2'h3)] >> $unsigned(wire3[(4'hc):(1'h0)]));
endmodule

module module5
#(parameter param171 = (|((((!(8'had)) ? (8'ha7) : {(8'ha2), (8'hae)}) ? (((8'ha1) - (8'ha3)) > (-(8'hb7))) : ((+(8'hb3)) ? (|(8'hb5)) : ((8'hab) ? (8'hb9) : (8'ha4)))) ? (({(8'hbc)} == ((8'h9f) | (8'hb0))) * ((+(8'ha0)) ? ((8'hb0) ? (8'ha9) : (8'hb9)) : {(8'hae), (7'h41)})) : (^(~((8'hb1) ? (8'hbe) : (8'hbd)))))), 
parameter param172 = (((^~param171) == (|(7'h43))) ? {({(+param171), (param171 ? (8'hb5) : param171)} < (param171 ? param171 : {(8'hb0)}))} : param171))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h37e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  assign y = {wire139,
                 wire137,
                 wire105,
                 wire61,
                 wire60,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire27,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
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
                 reg140,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg62,
                 reg63,
                 reg107,
                 (1'h0)};
  module11 #() modinst28 (.wire15(wire7), .y(wire27), .wire13(wire8), .wire14(wire6), .wire12(wire10), .wire16(wire9), .clk(clk));
  always
    @(posedge clk) begin
      reg29 <= $unsigned(wire10[(2'h3):(1'h0)]);
      if ((|(wire9[(2'h2):(1'h0)] >>> $unsigned({wire10, (^reg29)}))))
        begin
          if (wire8[(4'h8):(2'h2)])
            begin
              reg30 <= $unsigned($unsigned(reg29[(3'h4):(2'h3)]));
            end
          else
            begin
              reg30 <= (wire10 ?
                  $unsigned((wire7 ?
                      wire6[(1'h1):(1'h0)] : (wire27 ?
                          $signed(reg29) : reg29))) : {$unsigned((wire27[(3'h4):(1'h0)] & (-wire7)))});
              reg31 <= $unsigned($unsigned(((~^(!wire9)) != ((wire9 > (8'hb9)) ?
                  (wire7 <<< wire6) : (wire27 ? wire7 : reg30)))));
              reg32 <= $signed(wire9);
              reg33 <= (($signed((reg29[(1'h0):(1'h0)] ?
                          $signed(reg31) : reg31)) ?
                      (wire10[(2'h3):(2'h3)] ^ wire7[(4'hf):(3'h6)]) : (~|(8'haa))) ?
                  wire10 : reg31[(1'h1):(1'h1)]);
              reg34 <= wire6;
            end
        end
      else
        begin
          reg30 <= wire8[(3'h7):(1'h1)];
          reg31 <= reg29;
          reg32 <= wire6;
          if (({reg33} ?
              {wire9[(3'h5):(2'h2)],
                  {(-{wire8, reg34}),
                      (^~(wire6 ^~ wire27))}} : $unsigned(((reg32 & reg34) >= (~^(~(8'hb2)))))))
            begin
              reg33 <= (wire8[(4'h8):(1'h1)] ?
                  $unsigned(reg32) : {wire9[(3'h5):(3'h5)]});
              reg34 <= $signed(($unsigned(reg30[(3'h6):(3'h5)]) < (&$unsigned(reg33))));
              reg35 <= wire6;
            end
          else
            begin
              reg33 <= ((8'had) ? reg32 : reg31);
            end
          if ((wire7 && reg34[(3'h4):(2'h3)]))
            begin
              reg36 <= {(8'hb1), (8'had)};
            end
          else
            begin
              reg36 <= $signed(wire6[(2'h2):(2'h2)]);
            end
        end
      if ($signed($signed(wire27[(1'h0):(1'h0)])))
        begin
          reg37 <= {(-wire9[(1'h0):(1'h0)])};
        end
      else
        begin
          reg37 <= wire10[(2'h2):(1'h1)];
          reg38 <= ({reg33} | reg32[(4'hb):(4'hb)]);
          reg39 <= wire10[(3'h5):(1'h1)];
        end
      reg40 <= (+((~wire27[(1'h0):(1'h0)]) <<< (((reg38 ^~ reg35) ^ (wire8 ?
              reg38 : (8'hb9))) ?
          reg33[(2'h3):(1'h1)] : {(8'hae)})));
    end
  assign wire41 = (reg31 << ((~&((~&reg34) - $unsigned(reg38))) ?
                      (((~|(8'hae)) ?
                          (reg39 ^~ reg35) : (wire27 ?
                              reg32 : wire8)) & (~{wire8})) : ((~reg38) ?
                          $unsigned(((8'hbb) >> reg31)) : $signed((8'hb7)))));
  assign wire42 = {reg33[(4'ha):(4'ha)]};
  assign wire43 = wire6[(2'h2):(2'h2)];
  assign wire44 = $unsigned(reg40[(4'hd):(3'h6)]);
  assign wire45 = (&($unsigned($unsigned(((8'had) ? reg30 : reg39))) ?
                      (reg32 ?
                          $signed($unsigned(wire9)) : $unsigned($signed(wire44))) : $unsigned($unsigned({(8'ha0)}))));
  assign wire46 = (8'ha8);
  always
    @(posedge clk) begin
      if ($unsigned(reg32))
        begin
          if (wire9)
            begin
              reg47 <= {$signed(($signed((wire6 | (8'ha2))) ?
                      $signed(wire41[(3'h4):(3'h4)]) : ((reg35 ?
                          reg31 : wire9) && $unsigned(reg30))))};
              reg48 <= ((!(reg33[(3'h5):(1'h1)] ?
                      (((8'hbd) ?
                          reg38 : wire45) || $unsigned(reg39)) : reg35[(4'hb):(4'hb)])) ?
                  ($signed(((reg37 >> wire44) << wire7)) << {($signed(wire45) ?
                          $unsigned((8'ha1)) : ((8'hbc) & wire41)),
                      (^reg38[(2'h3):(2'h3)])}) : ($signed((reg37 ?
                          wire42 : wire9)) ?
                      {((8'hb6) ?
                              $unsigned((8'hb2)) : $signed(wire42))} : ($signed((wire27 ?
                          reg32 : wire7)) > {(~(8'hb6))})));
              reg49 <= $unsigned($signed($signed({(wire6 >= reg29)})));
            end
          else
            begin
              reg47 <= wire6[(4'h9):(2'h2)];
              reg48 <= ({{reg34[(4'h9):(3'h5)], wire8[(1'h0):(1'h0)]},
                  (((^reg38) ?
                      {wire44,
                          reg36} : $signed(wire8)) == $unsigned(wire44))} + ((8'ha6) ?
                  $unsigned($signed({reg39})) : reg33));
            end
          reg50 <= $unsigned((!($signed((wire7 ? reg35 : wire45)) - {reg37})));
          reg51 <= ((!$unsigned({$unsigned(wire43), reg49})) ?
              {(reg34 < $signed((~|reg30)))} : reg33[(3'h4):(1'h0)]);
        end
      else
        begin
          reg47 <= (wire44[(3'h7):(1'h0)] ?
              (wire43 || wire45) : {(reg49[(5'h15):(3'h6)] ?
                      $unsigned(wire46) : (|(-(8'ha1)))),
                  $signed({$unsigned(wire42), reg39})});
          reg48 <= reg48[(4'ha):(3'h7)];
          reg49 <= {((reg37[(1'h1):(1'h1)] <= {$signed((8'hae)),
                  (~|wire27)}) >> (~^(!(|reg34))))};
        end
      reg52 <= ($signed({$signed((~^reg40)), reg50}) ?
          ($unsigned($unsigned((wire10 ? reg48 : wire9))) ?
              (8'h9f) : ($unsigned((wire27 | wire45)) & ((^wire10) ?
                  $unsigned(reg49) : $unsigned(wire9)))) : reg39);
      if ($signed(reg51[(1'h1):(1'h0)]))
        begin
          reg53 <= $signed(($unsigned(($unsigned(reg52) ?
                  reg52 : ((8'ha5) * reg35))) ?
              reg33[(3'h6):(3'h6)] : reg35[(3'h5):(1'h0)]));
          if ($unsigned({($signed((wire41 ? wire8 : reg29)) >> (!reg48))}))
            begin
              reg54 <= wire44[(2'h2):(1'h0)];
              reg55 <= {wire9[(2'h3):(1'h1)], reg51};
            end
          else
            begin
              reg54 <= reg47[(1'h1):(1'h1)];
            end
          reg56 <= reg37[(3'h5):(1'h0)];
        end
      else
        begin
          if ($signed($unsigned({reg37})))
            begin
              reg53 <= ((((reg53[(4'hc):(4'hc)] ?
                          (reg37 ? reg29 : (8'hbb)) : $signed(wire9)) ?
                      (wire41 ?
                          $unsigned(wire27) : wire44[(1'h0):(1'h0)]) : $signed(reg39[(1'h1):(1'h0)])) ?
                  $unsigned(((reg56 ?
                      reg53 : reg54) >> reg52)) : $signed((wire42 ?
                      ((7'h41) ?
                          (8'hb5) : wire6) : $unsigned(reg52)))) && (($signed((wire9 * wire46)) ?
                  wire41[(2'h3):(1'h1)] : $signed((wire27 - reg47))) - $signed(reg54)));
            end
          else
            begin
              reg53 <= $unsigned(reg39[(4'hb):(4'h8)]);
              reg54 <= $signed($unsigned(({(~reg32)} ?
                  ($signed(reg39) || wire6[(3'h6):(3'h4)]) : wire27)));
            end
          reg55 <= $unsigned((^~(({reg33} ? reg51 : reg32[(1'h0):(1'h0)]) ?
              reg40 : (&wire7))));
          reg56 <= reg30;
          reg57 <= (wire27 && (-(((+reg38) * (~^wire7)) ?
              $signed(reg48[(3'h7):(3'h5)]) : ((wire44 > (8'h9d)) || $signed(reg36)))));
          reg58 <= (8'ha6);
        end
      reg59 <= $unsigned(reg34);
    end
  assign wire60 = (reg48 ?
                      {$unsigned((((8'hb8) ?
                              wire9 : reg59) << (~&wire46)))} : reg50);
  assign wire61 = $signed({(7'h42), reg56});
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg62 <= wire9[(2'h2):(2'h2)];
        end
      else
        begin
          reg62 <= wire6;
          reg63 <= (8'hbc);
        end
    end
  module64 #() modinst106 (wire105, clk, reg54, reg59, reg29, reg47);
  always
    @(posedge clk) begin
      reg107 <= (($unsigned(reg32[(4'hd):(3'h7)]) ?
          reg48 : reg32) >> $unsigned(reg29));
    end
  module108 #() modinst138 (wire137, clk, reg59, reg36, reg54, reg58, reg63);
  assign wire139 = $unsigned((((!$unsigned((8'hb7))) ?
                       ({reg35} ?
                           (reg47 == (8'hb4)) : (reg107 ?
                               wire41 : wire10)) : (~&(wire137 != (8'h9f)))) <= (~&$signed(reg30))));
  always
    @(posedge clk) begin
      if (wire10[(2'h3):(2'h3)])
        begin
          reg140 <= ((reg52[(4'h9):(1'h1)] ?
              $signed($signed($unsigned(reg34))) : (~&(~reg56[(2'h3):(2'h2)]))) * $signed((-reg49)));
          reg141 <= {$unsigned(((~^{reg107}) != {$signed(reg54),
                  $unsigned(reg63)}))};
          if ((wire61 ? {$unsigned({(reg34 ^~ (8'hb1))})} : (8'hb3)))
            begin
              reg142 <= $unsigned($signed(reg62));
            end
          else
            begin
              reg142 <= reg39[(4'hd):(2'h3)];
            end
          reg143 <= (&$unsigned(wire61[(4'h9):(3'h6)]));
          reg144 <= {$unsigned((reg30[(3'h7):(2'h3)] | reg34)),
              $signed($unsigned((reg36[(3'h5):(1'h0)] ? (|wire7) : (~reg39))))};
        end
      else
        begin
          reg140 <= reg48;
          reg141 <= reg62;
          reg142 <= {reg47[(2'h3):(2'h3)]};
        end
      if ($unsigned((~|{wire61})))
        begin
          reg145 <= reg39[(3'h7):(2'h3)];
        end
      else
        begin
          if (((8'haf) & $signed(wire6)))
            begin
              reg145 <= $unsigned(reg36[(3'h6):(3'h6)]);
              reg146 <= $unsigned(reg145[(3'h5):(1'h1)]);
              reg147 <= (reg53 ?
                  (^~(($unsigned((8'ha5)) ?
                          $unsigned(reg30) : $unsigned(reg142)) ?
                      $unsigned(reg38[(1'h1):(1'h0)]) : (8'hba))) : $signed(reg107[(4'h8):(3'h7)]));
              reg148 <= (^~wire45[(3'h4):(2'h3)]);
            end
          else
            begin
              reg145 <= reg107[(3'h6):(2'h2)];
              reg146 <= ((wire60 ^ wire43[(4'ha):(3'h5)]) + wire137);
              reg147 <= (8'hb2);
              reg148 <= $signed($unsigned(($signed(reg31) ?
                  (~|(reg146 ? reg59 : (8'h9f))) : reg35)));
              reg149 <= wire61;
            end
          if (reg40)
            begin
              reg150 <= (reg148 >>> $unsigned({((~wire9) != (|reg30)),
                  {wire8, (!(8'ha8))}}));
              reg151 <= (~|reg107[(2'h2):(1'h1)]);
              reg152 <= reg140[(4'hc):(3'h7)];
              reg153 <= ($unsigned((($unsigned(wire41) ^~ (reg38 ?
                      reg56 : reg150)) ?
                  (((8'hb3) ?
                      (8'hb7) : reg32) == reg147[(2'h3):(2'h3)]) : $signed({reg146}))) << reg39);
            end
          else
            begin
              reg150 <= $unsigned($unsigned((((&reg48) ?
                      (reg52 + reg142) : reg49[(4'hb):(4'ha)]) ?
                  {wire7} : (&$unsigned(reg34)))));
              reg151 <= reg141;
              reg152 <= wire6;
              reg153 <= (($signed(reg144[(1'h0):(1'h0)]) ~^ $signed(((8'hb0) + $unsigned((7'h42))))) <= $signed((({wire139} ?
                  ((8'ha3) < wire42) : reg58) & reg150)));
              reg154 <= ((reg107[(2'h2):(2'h2)] ?
                  (reg153[(1'h1):(1'h0)] == (~^(reg35 >= reg36))) : wire27) - wire61);
            end
          reg155 <= $unsigned(reg29);
          reg156 <= (+wire8);
        end
      reg157 <= (^~(+(-reg51[(1'h0):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg158 <= (wire9[(3'h5):(1'h1)] | reg154[(3'h5):(3'h4)]);
      reg159 <= $signed(wire139[(3'h6):(1'h0)]);
      reg160 <= reg150[(5'h10):(2'h2)];
      if ($signed($signed((reg53 + reg144[(2'h3):(2'h3)]))))
        begin
          if (reg147[(1'h0):(1'h0)])
            begin
              reg161 <= wire60[(2'h3):(1'h1)];
            end
          else
            begin
              reg161 <= $unsigned((reg58[(5'h10):(2'h3)] >= {$signed((wire46 ?
                      reg49 : reg36)),
                  (&reg35)}));
              reg162 <= ($signed(reg63[(1'h1):(1'h1)]) ?
                  (^~(~|(&wire41))) : $unsigned((wire7[(3'h6):(1'h1)] ?
                      (~|(8'h9e)) : $signed($unsigned(reg59)))));
              reg163 <= wire60[(2'h2):(1'h0)];
              reg164 <= reg59;
              reg165 <= (wire137 * (8'hb6));
            end
          reg166 <= (({($signed((7'h43)) ?
                      $signed(reg161) : reg59[(4'hf):(1'h1)]),
                  $signed((|reg63))} >= reg31[(4'hb):(3'h6)]) ?
              (~^{($unsigned(reg165) || ((8'ha6) ? (8'had) : reg144)),
                  reg165}) : wire61);
          reg167 <= wire27[(2'h3):(2'h2)];
        end
      else
        begin
          reg161 <= ($signed(wire6) ?
              reg35[(3'h7):(3'h7)] : {$unsigned($unsigned((~|reg57)))});
          reg162 <= (~&((~|$unsigned(wire137[(5'h10):(4'hb)])) >= (^~(!wire6))));
          if (reg158)
            begin
              reg163 <= $unsigned(reg167);
              reg164 <= ({$signed($signed({reg54, reg36})),
                  $signed(((reg63 ? reg146 : reg52) ?
                      $signed(reg38) : $signed(reg30)))} >= $unsigned(wire42[(3'h7):(1'h0)]));
              reg165 <= $signed($signed(reg153[(2'h2):(1'h0)]));
              reg166 <= (($signed((|$unsigned(reg162))) ?
                      (({wire7} ? (~&reg140) : reg158) ?
                          reg145 : ((reg37 > (8'hb0)) ?
                              $signed(wire27) : $signed(reg160))) : {((reg49 ?
                                  reg147 : reg48) ?
                              {wire9, reg59} : (reg35 ? wire41 : reg49)),
                          $unsigned({reg56, reg151})}) ?
                  {reg162[(2'h3):(2'h3)],
                      $signed($signed(reg143[(2'h2):(1'h1)]))} : reg39);
              reg167 <= $unsigned($unsigned((~(-$signed(reg159)))));
            end
          else
            begin
              reg163 <= (~^$unsigned(reg54[(4'h9):(3'h7)]));
              reg164 <= $unsigned($signed((!(~&wire45[(2'h3):(1'h0)]))));
              reg165 <= ((({$signed(wire10)} ?
                          (+$signed((8'h9f))) : $signed((^~reg142))) ?
                      (8'ha7) : (~&wire44[(4'ha):(4'ha)])) ?
                  wire6 : ({($unsigned(reg156) >> (^reg157)),
                          (reg165 > (reg147 ? reg35 : (8'ha8)))} ?
                      $signed({reg158}) : $unsigned(($unsigned(reg167) ?
                          (~^(8'hae)) : reg31[(2'h2):(1'h0)]))));
            end
          reg168 <= wire7[(4'hc):(4'h8)];
        end
    end
  always
    @(posedge clk) begin
      reg169 <= wire44;
      reg170 <= $unsigned($unsigned($unsigned(reg50[(3'h5):(2'h2)])));
    end
endmodule

module module108
#(parameter param135 = ((|(-{(~|(8'had))})) ? (((^((8'hbf) + (8'hb2))) <= ({(8'ha3)} ^~ ((8'hbb) ^~ (8'ha1)))) ? (+(((8'hb0) ? (8'h9c) : (7'h41)) ? {(8'hbc)} : ((8'ha7) >>> (7'h40)))) : ({(!(8'ha5)), ((8'hb2) ? (8'hba) : (8'hb3))} && {((8'hb1) ? (8'hb7) : (7'h42)), (+(8'hbb))})) : (-{((-(8'h9d)) ? {(8'h9d), (8'hb4)} : ((8'had) & (8'hb1)))})), 
parameter param136 = (&((((!(8'hb8)) >= (param135 ? param135 : (7'h41))) ? {(param135 <<< param135), (~param135)} : (~(param135 + param135))) ? (param135 <<< param135) : (+({param135, param135} ? {param135, param135} : param135)))))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire113;
  input wire [(2'h3):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire111;
  input wire signed [(5'h15):(1'h0)] wire110;
  input wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire114;
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire117,
                 wire114,
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
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire114 = {$signed((8'haf)), wire109};
  always
    @(posedge clk) begin
      reg115 <= $unsigned($signed(wire110[(4'hd):(2'h3)]));
      reg116 <= $unsigned($unsigned((wire114 << {reg115,
          (wire109 + wire110)})));
    end
  assign wire117 = $unsigned(reg116);
  always
    @(posedge clk) begin
      reg118 <= (wire110 + (($unsigned($signed(wire113)) ?
          wire112[(2'h3):(1'h1)] : ((wire114 ?
              wire110 : wire109) ^~ wire113[(2'h2):(2'h2)])) <= ((~&wire111) <<< reg115)));
      reg119 <= $signed({(&$unsigned(wire110[(4'h8):(2'h3)]))});
      reg120 <= reg119;
      reg121 <= (8'hab);
      if ($signed($signed({$signed((+wire117)), $signed($signed(reg120))})))
        begin
          if ((|(~^wire111[(4'ha):(1'h0)])))
            begin
              reg122 <= $signed($unsigned($signed(($unsigned((8'hb6)) ?
                  (reg120 ? (8'hbc) : wire109) : (reg118 ?
                      wire109 : reg121)))));
              reg123 <= ($unsigned($unsigned(reg118)) >> (+(reg116[(4'h8):(1'h0)] ?
                  reg118[(4'hd):(3'h5)] : reg119)));
              reg124 <= wire111[(2'h2):(1'h0)];
              reg125 <= (reg124 ?
                  ($unsigned(reg120) || reg124[(2'h3):(2'h3)]) : $unsigned(wire113[(3'h4):(1'h1)]));
            end
          else
            begin
              reg122 <= $signed($unsigned($signed((8'hbd))));
              reg123 <= $unsigned(((($unsigned(reg115) ?
                      $signed(wire109) : $unsigned(reg119)) ?
                  reg118 : $unsigned(reg123[(3'h7):(3'h7)])) > ($signed($unsigned(reg121)) ?
                  $signed(reg119) : $signed($unsigned(wire110)))));
              reg124 <= {(^(wire114 && wire111))};
              reg125 <= ($unsigned({((wire112 >>> wire117) ?
                      (reg120 == reg125) : wire110)}) == reg122[(5'h13):(2'h3)]);
            end
          reg126 <= wire112;
          if ((~^$unsigned(((reg119 << wire117) >>> $signed({reg123})))))
            begin
              reg127 <= {{{(~(~wire111)), wire111}}};
              reg128 <= $signed((~$unsigned(((~^wire114) ?
                  wire111 : (reg124 ? wire117 : reg119)))));
              reg129 <= (((^((wire112 ?
                      reg116 : reg116) - $unsigned(reg127))) == $signed((~^(^~wire112)))) ?
                  reg115[(2'h3):(1'h0)] : ((((^reg115) & (reg119 >= reg116)) || (~|wire117[(2'h2):(1'h1)])) ?
                      (~^$unsigned((wire110 >>> reg118))) : ((~reg120) ?
                          $signed((reg115 == reg122)) : reg126[(3'h6):(3'h4)])));
            end
          else
            begin
              reg127 <= reg120;
              reg128 <= $unsigned(wire110);
              reg129 <= ({((8'h9d) ?
                          $unsigned($unsigned((8'ha2))) : ($unsigned(reg128) ?
                              wire112 : $unsigned((8'hb6))))} ?
                  ($signed($unsigned(((8'hab) <= reg126))) ?
                      $unsigned((+$unsigned(wire117))) : reg125[(5'h13):(3'h6)]) : (8'had));
              reg130 <= reg127[(3'h7):(2'h3)];
            end
          reg131 <= $signed(((($signed(reg129) ^ $unsigned(reg120)) ?
              reg116 : {$signed(wire117),
                  $unsigned(reg116)}) < ($unsigned((wire113 == reg126)) ?
              ((reg116 || wire112) == $signed(reg127)) : wire117[(2'h2):(1'h1)])));
        end
      else
        begin
          reg122 <= $signed((~&((8'ha5) ?
              $signed($unsigned((8'hac))) : reg129)));
          reg123 <= $unsigned(((((+wire112) | reg116) ?
                  $unsigned((!reg123)) : wire110[(5'h14):(2'h3)]) ?
              reg115[(2'h3):(1'h1)] : wire117[(2'h3):(2'h2)]));
          reg124 <= wire117[(2'h2):(2'h2)];
          reg125 <= (((reg128[(4'h8):(3'h5)] ?
                  ($unsigned(reg121) ?
                      reg122[(4'he):(4'hb)] : wire114) : reg121[(1'h1):(1'h1)]) >= reg130) ?
              ((reg130[(4'h8):(4'h8)] <= reg121[(1'h0):(1'h0)]) ?
                  (|(-$unsigned(wire117))) : ($unsigned((^~reg130)) > reg125)) : ((reg124 ^~ reg130[(3'h4):(2'h2)]) ?
                  $unsigned($signed($unsigned((8'hb9)))) : ({{wire111,
                          reg127}} + ((reg119 ? reg122 : wire112) ?
                      (^~reg123) : (-reg125)))));
        end
    end
  assign wire132 = {(-(8'hae))};
  assign wire133 = (~&$unsigned($signed((8'hb6))));
  assign wire134 = ($unsigned(((!$signed((8'h9c))) & ($signed((8'hab)) << $signed(reg126)))) && (reg122[(4'hd):(3'h6)] ?
                       (|$unsigned(reg118)) : $signed(({reg122} ~^ (reg116 <= reg120)))));
endmodule

module module64
#(parameter param104 = (+(({{(8'hb9)}, ((8'hb2) ^ (8'hb9))} - {((8'ha5) ? (8'hbe) : (8'haf)), (~(8'hb2))}) ? ((((8'hb1) ? (8'hb1) : (8'haa)) ? {(8'had)} : (~|(8'hae))) >> (((8'ha4) ^ (8'h9f)) <= (&(8'ha7)))) : (((~^(8'hbb)) >> ((8'hb5) * (7'h40))) ? (((8'ha4) ^ (7'h44)) ? ((8'haa) != (8'ha3)) : (+(8'hbc))) : (((8'hb7) <= (8'hb0)) >>> (~&(8'hb1)))))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire68;
  input wire [(5'h14):(1'h0)] wire67;
  input wire [(3'h4):(1'h0)] wire66;
  input wire [(5'h10):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire69;
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire69,
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
                 reg93,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = $unsigned((wire65[(3'h5):(3'h5)] + (wire66 ?
                      (wire68 ?
                          wire68[(3'h7):(1'h1)] : ((8'hba) ?
                              wire66 : wire67)) : ($unsigned((8'hb7)) ?
                          $signed(wire66) : (~wire66)))));
  always
    @(posedge clk) begin
      reg70 <= wire69;
      if ((((wire66 ?
          ((wire66 ? wire65 : wire66) ?
              wire65[(5'h10):(4'h9)] : wire68) : (8'hb7)) == wire66) == $unsigned(wire67[(4'ha):(3'h4)])))
        begin
          reg71 <= (-wire67);
        end
      else
        begin
          reg71 <= wire66;
          reg72 <= $unsigned($signed(wire67[(4'hd):(2'h3)]));
        end
      if ($signed(reg71[(4'hb):(4'ha)]))
        begin
          if (wire66)
            begin
              reg73 <= $signed(wire67);
              reg74 <= $unsigned(((((wire69 ~^ reg70) ?
                  (|wire67) : (reg70 ?
                      wire68 : (8'hbb))) + ($unsigned(reg70) && wire69)) * $signed({$signed(wire66),
                  wire67[(3'h7):(2'h3)]})));
              reg75 <= $signed(wire65[(4'h9):(1'h0)]);
              reg76 <= $signed(((~|$unsigned((reg74 ? reg72 : wire67))) ?
                  $unsigned((~|$signed(wire69))) : ({(^~wire69),
                          $signed(wire69)} ?
                      {(wire69 ? wire69 : wire66),
                          (reg72 ? wire66 : (8'hba))} : wire65)));
              reg77 <= (($signed(wire68[(1'h0):(1'h0)]) | (8'ha8)) ?
                  ({$unsigned((^~(8'hb4)))} != (reg74[(1'h0):(1'h0)] ?
                      (wire67[(5'h11):(4'h9)] <= $signed(reg73)) : ($signed(reg71) ?
                          (reg73 >> wire66) : (~wire69)))) : $signed(wire68));
            end
          else
            begin
              reg73 <= wire67[(1'h1):(1'h0)];
              reg74 <= $signed(wire67[(2'h2):(2'h2)]);
              reg75 <= reg70[(4'ha):(2'h2)];
              reg76 <= {wire66, (-reg74)};
              reg77 <= (reg70[(3'h7):(2'h3)] >> $unsigned($signed($signed(wire69[(3'h6):(3'h5)]))));
            end
        end
      else
        begin
          reg73 <= {(($signed($signed(reg73)) ?
                  $unsigned($signed(reg77)) : reg77[(3'h4):(2'h3)]) >> $signed(((!wire66) ?
                  $unsigned(reg70) : (reg73 == reg70)))),
              wire68[(1'h0):(1'h0)]};
          if ((^~wire66))
            begin
              reg74 <= {reg75[(1'h1):(1'h0)], (|(|(!$unsigned(wire66))))};
              reg75 <= $unsigned((|reg77[(2'h3):(2'h3)]));
            end
          else
            begin
              reg74 <= (-reg72[(3'h4):(1'h0)]);
            end
        end
    end
  always
    @(posedge clk) begin
      if ((|reg74))
        begin
          reg78 <= {wire65,
              {$unsigned((-(wire69 << wire66))), (|(|$unsigned(reg74)))}};
          reg79 <= (!(reg78 < $unsigned(((reg78 <<< wire68) ?
              reg76 : {wire68, reg75}))));
          reg80 <= (^$unsigned($unsigned(reg72)));
          reg81 <= $unsigned(wire67[(2'h3):(2'h2)]);
        end
      else
        begin
          if (reg77[(3'h5):(2'h2)])
            begin
              reg78 <= (((((reg76 ? reg81 : reg76) << (reg73 ?
                      (8'ha0) : wire69)) ?
                  reg77 : ((reg73 ^~ wire68) + {reg76})) & ($signed($signed(reg71)) & (((8'hb4) ?
                  wire66 : reg73) != (reg81 > reg73)))) < $unsigned($signed((reg75 >= $signed(wire67)))));
            end
          else
            begin
              reg78 <= wire69;
            end
          reg79 <= reg80[(2'h3):(2'h3)];
          reg80 <= reg72[(3'h4):(3'h4)];
        end
      if (reg76[(2'h3):(2'h3)])
        begin
          reg82 <= (($signed(((~&reg75) ?
              (reg76 ?
                  wire66 : reg78) : reg80[(2'h2):(1'h0)])) + ($signed($signed(wire69)) | $signed(reg70[(3'h4):(1'h0)]))) ~^ (reg71[(5'h13):(5'h12)] ?
              $unsigned($unsigned((~(8'hbd)))) : reg74));
        end
      else
        begin
          reg82 <= $signed($signed((^~$unsigned({wire69, reg74}))));
          if ((-(($unsigned($unsigned((8'hbc))) ?
                  wire65[(4'ha):(3'h6)] : ($signed((8'hbf)) || reg75[(3'h4):(3'h4)])) ?
              (wire68[(3'h6):(2'h2)] ?
                  wire66 : {(reg74 != reg70),
                      (reg74 ? reg74 : wire69)}) : (((!reg82) ?
                      $unsigned(reg76) : (reg73 ? wire69 : (8'h9c))) ?
                  ($signed(reg71) ^ {reg78, wire65}) : reg74[(2'h2):(2'h2)]))))
            begin
              reg83 <= ((^(+$signed((^reg72)))) > {$unsigned({$unsigned(reg77),
                      ((8'ha6) * (8'ha6))}),
                  (!$unsigned($signed((8'hbf))))});
              reg84 <= {$signed($signed((~&reg75)))};
              reg85 <= {reg72[(5'h11):(4'ha)]};
            end
          else
            begin
              reg83 <= reg71;
              reg84 <= reg71[(5'h12):(4'ha)];
              reg85 <= wire66;
            end
          reg86 <= reg75[(4'h8):(2'h2)];
          reg87 <= reg82;
        end
      reg88 <= ($unsigned((reg83[(1'h0):(1'h0)] ?
              ((^~reg85) ?
                  reg81 : (reg83 ? reg70 : reg76)) : wire66[(2'h3):(1'h0)])) ?
          reg83 : $unsigned((((reg75 || reg72) <= (^reg83)) ?
              $signed((reg80 - reg80)) : reg76[(2'h3):(2'h3)])));
      reg89 <= ((^~reg83[(1'h0):(1'h0)]) > $unsigned((|$signed(reg78))));
    end
  assign wire90 = (($unsigned((!(8'h9e))) ?
                      (wire69 ?
                          (~reg75) : ((reg74 ? (8'ha3) : reg74) ?
                              (reg71 > reg79) : (wire66 ?
                                  wire67 : reg78))) : $signed(reg71)) || (~^((!{reg89}) ?
                      ((!reg88) ?
                          (wire69 >= reg84) : (reg86 && reg89)) : wire68)));
  assign wire91 = reg75;
  assign wire92 = (~^reg83);
  always
    @(posedge clk) begin
      reg93 <= (($unsigned(wire91[(2'h3):(1'h1)]) >> reg78[(2'h2):(1'h1)]) ?
          $signed($signed($signed(reg70))) : ($signed($signed($signed(reg86))) ?
              reg82 : $unsigned({reg85})));
      reg94 <= (((8'hac) + {({reg93, reg76} ^ wire90)}) != $signed(reg89));
      if (reg70)
        begin
          reg95 <= (((reg87 <<< wire66[(3'h4):(1'h0)]) ?
              (reg78 | reg87[(1'h1):(1'h1)]) : $signed($signed(((8'hb8) >= reg71)))) <= $signed(((-(reg74 ^~ reg85)) + {(reg86 ?
                  wire90 : wire90),
              ((8'haf) << reg73)})));
          reg96 <= reg81;
          if (($unsigned(reg78) ?
              $unsigned($signed($signed((reg80 ?
                  reg73 : reg70)))) : ({(+$signed((8'hae)))} ^~ (^~((8'ha9) ?
                  (~^reg76) : {reg94, reg88})))))
            begin
              reg97 <= {(reg71[(4'hf):(4'hf)] | reg74[(2'h3):(1'h1)])};
              reg98 <= reg86[(3'h4):(1'h1)];
            end
          else
            begin
              reg97 <= $signed((~|(8'hbd)));
              reg98 <= $unsigned($signed(reg75));
              reg99 <= reg98[(4'ha):(3'h6)];
              reg100 <= $signed($signed(({$unsigned(reg78), $signed(wire69)} ?
                  (&(!wire66)) : $unsigned((~reg74)))));
              reg101 <= reg94;
            end
          reg102 <= $signed({(reg97[(1'h1):(1'h0)] ?
                  (~&(wire66 == reg88)) : wire67)});
        end
      else
        begin
          reg95 <= $signed(reg75[(4'hc):(1'h1)]);
          reg96 <= reg79[(1'h0):(1'h0)];
          reg97 <= {reg85, (^$signed((-{reg82})))};
          reg98 <= $signed(((&reg74[(2'h3):(2'h2)]) - reg78[(2'h3):(1'h0)]));
          reg99 <= wire67;
        end
      reg103 <= $unsigned(((~&((reg79 ?
          reg86 : wire92) == (~^(8'ha9)))) * (reg77[(3'h5):(3'h5)] != (reg84[(3'h7):(3'h4)] * (reg80 >> wire92)))));
    end
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire17 = wire14[(2'h3):(2'h2)];
  assign wire18 = {(^~(8'ha7)), wire17};
  assign wire19 = wire12[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      if (wire18)
        begin
          reg20 <= wire17;
          reg21 <= $unsigned($signed(({$unsigned(wire18)} ?
              ($signed(wire13) ^ wire14) : wire13)));
          reg22 <= wire12[(2'h2):(2'h2)];
          reg23 <= ($signed(wire14[(2'h2):(1'h1)]) ?
              ((($unsigned((8'hb7)) ? (-wire14) : reg21) ?
                      $signed((!(7'h42))) : wire13) ?
                  wire14[(5'h12):(3'h5)] : wire12[(1'h1):(1'h1)]) : reg21[(2'h2):(1'h1)]);
        end
      else
        begin
          reg20 <= wire19[(1'h0):(1'h0)];
          reg21 <= $unsigned($unsigned((&$unsigned($signed(wire17)))));
          reg22 <= $unsigned({(~|($signed(wire16) ?
                  $signed(reg21) : {wire17, wire19}))});
          reg23 <= (~^$unsigned(wire14[(3'h4):(1'h1)]));
        end
      reg24 <= wire18;
      if (reg22)
        begin
          reg25 <= $unsigned($signed(reg21));
          reg26 <= ($signed($unsigned(((wire15 + wire16) & (wire15 < (8'ha4))))) - ({wire13[(4'h8):(4'h8)],
              (((8'haa) >>> wire12) * $signed((8'ha7)))} << $signed(wire12)));
        end
      else
        begin
          reg25 <= wire16;
          reg26 <= ((((+$signed(wire13)) ?
              (7'h43) : (wire15 >>> wire16)) ^ $signed((((8'hb8) ?
                  wire13 : (8'ha8)) ?
              (~reg25) : (~reg24)))) << $signed((8'h9c)));
        end
    end
endmodule
