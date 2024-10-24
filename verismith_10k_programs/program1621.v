module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire237;
  wire signed [(2'h3):(1'h0)] wire230;
  wire [(3'h6):(1'h0)] wire228;
  wire [(3'h4):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire226;
  wire signed [(5'h10):(1'h0)] wire232;
  wire signed [(3'h6):(1'h0)] wire233;
  wire [(2'h3):(1'h0)] wire234;
  wire signed [(3'h5):(1'h0)] wire235;
  reg [(4'ha):(1'h0)] reg238 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire237,
                 wire230,
                 wire228,
                 wire4,
                 wire18,
                 wire20,
                 wire137,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire226,
                 wire232,
                 wire233,
                 wire234,
                 wire235,
                 reg238,
                 reg19,
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
  assign wire4 = ($unsigned(((-$signed((8'haf))) ?
                     $signed((wire0 ?
                         wire1 : wire2)) : $signed(wire2))) >>> $signed((~|((wire1 ?
                         (8'hbf) : wire2) ?
                     (wire3 <= wire0) : wire2[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned(wire1));
      reg6 <= (-({wire0, $signed(wire1)} ?
          {wire0} : $unsigned(({wire4} | wire4))));
      if (($unsigned($unsigned((~^((8'ha6) == wire4)))) ?
          wire1 : $signed((~$unsigned((reg5 + wire4))))))
        begin
          reg7 <= ($unsigned((~|{(reg5 ? wire0 : wire0), (~&wire3)})) ?
              $signed(($signed({wire1}) ?
                  wire1 : ((!wire1) ?
                      $signed(reg5) : (&wire3)))) : ((wire1 >>> $signed(wire2)) ?
                  ((wire2[(3'h7):(3'h6)] >>> $signed(reg5)) >> $signed($unsigned(wire2))) : $unsigned($signed({reg6,
                      wire3}))));
          if ((wire4 ? reg7 : {$signed((7'h43))}))
            begin
              reg8 <= (8'ha0);
              reg9 <= ((+(^reg6[(1'h1):(1'h1)])) * ($unsigned(((8'haa) >> $signed(reg8))) ?
                  wire4 : wire4[(2'h3):(1'h1)]));
            end
          else
            begin
              reg8 <= $unsigned($unsigned(($signed($signed(wire3)) >= $unsigned($signed((8'hb9))))));
              reg9 <= ({(($signed(reg9) == (|reg6)) | wire3),
                      $signed($signed(wire2))} ?
                  reg7[(2'h3):(1'h1)] : (+{reg9[(1'h1):(1'h0)]}));
              reg10 <= $signed((~|reg5));
              reg11 <= (((wire1 >= ((wire1 ? reg9 : wire1) ^ (8'hbe))) ?
                      wire1 : $unsigned($unsigned(reg6[(2'h2):(2'h2)]))) ?
                  (wire1[(2'h2):(1'h0)] ?
                      $signed((&(wire3 >>> reg5))) : (-wire0[(3'h6):(2'h2)])) : {reg6});
            end
          reg12 <= (~&(reg11[(4'hc):(2'h2)] << {(~wire0), (~^(~(8'ha0)))}));
        end
      else
        begin
          if ((reg7 | (8'hbf)))
            begin
              reg7 <= reg8[(2'h3):(2'h2)];
              reg8 <= wire1[(2'h2):(2'h2)];
              reg9 <= reg8[(1'h1):(1'h1)];
              reg10 <= wire4[(1'h1):(1'h0)];
            end
          else
            begin
              reg7 <= $unsigned($signed((((wire1 ?
                      (8'hbd) : reg9) - $signed(reg7)) ?
                  (-(!reg9)) : {(~&(8'had)), $signed((8'ha5))})));
            end
          reg11 <= (((($unsigned(reg12) ?
                      (&(7'h44)) : wire4[(1'h0):(1'h0)]) ^~ $signed(reg11[(3'h6):(1'h1)])) ?
                  $signed(reg11[(5'h14):(3'h7)]) : $signed(wire2)) ?
              (^~(((+(8'ha2)) ?
                  {reg5} : (~|(8'hbd))) ^~ wire3[(1'h1):(1'h0)])) : (({(~^reg7)} ?
                      (!wire3[(3'h5):(2'h2)]) : reg6[(2'h2):(2'h2)]) ?
                  $signed(($signed((7'h41)) ?
                      reg10 : (wire0 ? wire1 : wire0))) : {((wire4 ?
                          wire1 : wire3) & wire2[(1'h1):(1'h1)]),
                      reg10}));
        end
      reg13 <= $unsigned({(wire3 ?
              reg6[(1'h1):(1'h0)] : $signed((wire1 >= wire0)))});
    end
  always
    @(posedge clk) begin
      reg14 <= reg9[(1'h1):(1'h1)];
      reg15 <= ($unsigned($unsigned($unsigned($signed(reg12)))) ?
          $signed((+(^wire2[(4'hb):(2'h3)]))) : (reg6[(2'h2):(1'h0)] ?
              ($unsigned((reg7 ?
                  reg5 : reg10)) || $unsigned(reg14[(2'h3):(1'h0)])) : wire2));
      reg16 <= $unsigned(reg5[(4'hd):(4'h9)]);
      reg17 <= reg6[(1'h1):(1'h1)];
    end
  assign wire18 = wire3;
  always
    @(posedge clk) begin
      reg19 <= reg16;
    end
  assign wire20 = reg11;
  module21 #() modinst138 (.wire22(reg17), .wire25(reg11), .y(wire137), .clk(clk), .wire23(reg9), .wire24(reg5));
  assign wire139 = $unsigned($unsigned($unsigned($signed({reg10}))));
  assign wire140 = $signed(reg13[(3'h5):(2'h3)]);
  assign wire141 = $signed({(8'h9f)});
  assign wire142 = $unsigned((8'h9c));
  assign wire143 = ((wire2 || ((!(&(8'hb5))) ?
                           (&((8'hbf) ~^ reg15)) : $signed($unsigned(reg14)))) ?
                       (~{$signed(reg12[(3'h4):(2'h3)])}) : wire20);
  module144 #() modinst227 (.wire149(wire137), .y(wire226), .wire146(wire141), .wire145(reg10), .clk(clk), .wire148(wire2), .wire147(reg8));
  module151 #() modinst229 (.wire156(wire3), .wire152(wire226), .clk(clk), .wire155(reg16), .wire153(wire143), .wire154(wire142), .y(wire228));
  module151 #() modinst231 (.wire153(reg13), .clk(clk), .wire155(reg7), .y(wire230), .wire152(reg17), .wire156(wire141), .wire154(reg12));
  assign wire232 = wire141;
  assign wire233 = {((~^{{wire142},
                           (wire226 ?
                               wire1 : wire137)}) && reg5[(4'hc):(1'h1)])};
  assign wire234 = $unsigned(reg13[(4'h9):(4'h8)]);
  module21 #() modinst236 (wire235, clk, wire232, reg17, wire2, wire18);
  assign wire237 = ((wire140[(2'h3):(1'h1)] <= wire226) ?
                       (wire235[(2'h3):(2'h2)] ?
                           $signed($unsigned({wire228,
                               (8'hbc)})) : (reg13[(3'h5):(3'h4)] <= {(wire233 && wire140),
                               (^wire232)})) : {{{((8'ha8) ? reg17 : wire3)},
                               {$unsigned(reg14), $unsigned(reg17)}}});
  always
    @(posedge clk) begin
      reg238 <= ((7'h43) ~^ $unsigned($signed($unsigned(reg16))));
    end
endmodule

module module144
#(parameter param224 = (({(8'ha3)} ? (~((+(7'h41)) ? (^(8'ha9)) : (~^(8'ha0)))) : (((8'h9e) << (!(8'haa))) * (((8'h9e) << (7'h42)) ? ((8'ha6) - (8'hbf)) : (|(8'hbc))))) ? ((((!(7'h44)) >> (!(8'hac))) ? (((7'h42) >> (8'hae)) ? ((8'ha7) ? (8'hb6) : (8'ha6)) : (~|(8'hb1))) : (((8'hb0) ? (7'h41) : (8'ha5)) > ((8'hb6) ? (8'hbc) : (7'h43)))) < ((~(~(8'hbb))) == (((8'hb8) >>> (8'ha6)) ^~ {(8'ha1), (7'h40)}))) : (((+((8'h9e) >>> (8'ha5))) ? (8'hb4) : (((8'hb5) ? (8'hbb) : (8'haf)) | {(7'h41), (8'had)})) ? {(!((8'haf) - (8'hae))), ((+(8'haa)) ^ ((8'ha4) ? (8'h9e) : (8'h9e)))} : ((8'ha9) == (((8'had) ? (8'ha8) : (8'hb8)) ? {(7'h44), (8'ha8)} : (8'h9e))))), 
parameter param225 = param224)
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire149;
  input wire [(5'h13):(1'h0)] wire148;
  input wire [(4'ha):(1'h0)] wire147;
  input wire [(5'h14):(1'h0)] wire146;
  input wire signed [(5'h12):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire223;
  wire signed [(4'he):(1'h0)] wire222;
  wire [(5'h11):(1'h0)] wire221;
  wire signed [(4'hb):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire178;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(4'he):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire219;
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg179 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire221,
                 wire176,
                 wire150,
                 wire178,
                 wire182,
                 wire183,
                 wire219,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire150 = wire149[(2'h2):(2'h2)];
  module151 #() modinst177 (.wire154(wire149), .wire156(wire146), .wire155(wire145), .wire152(wire148), .clk(clk), .y(wire176), .wire153(wire150));
  assign wire178 = ($unsigned(wire147[(1'h1):(1'h0)]) >= $unsigned(wire145[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg179 <= (wire150[(4'h9):(3'h7)] || wire148);
      reg180 <= wire145[(3'h4):(2'h2)];
      reg181 <= $signed((|{(&{wire176, wire149})}));
    end
  assign wire182 = {(wire145 ?
                           (wire145 - {reg180}) : $unsigned($signed(wire149[(4'hb):(3'h6)]))),
                       (wire176 ?
                           (~wire148[(3'h4):(3'h4)]) : ((!(wire146 ?
                               wire150 : wire145)) ^ (^~(|wire176))))};
  assign wire183 = (wire182[(3'h6):(3'h6)] ?
                       (reg181[(3'h5):(2'h3)] ?
                           reg179[(1'h1):(1'h0)] : ({$signed(wire176),
                               $signed(wire148)} << ((wire150 ?
                                   wire182 : (8'hb3)) ?
                               wire149[(3'h7):(3'h6)] : {wire182}))) : (&(8'ha2)));
  module184 #() modinst220 (.wire187(wire183), .wire185(wire150), .y(wire219), .clk(clk), .wire188(wire182), .wire186(wire149), .wire189(wire146));
  assign wire221 = (~wire145);
  assign wire222 = wire221;
  assign wire223 = wire176[(2'h2):(1'h1)];
endmodule

module module21
#(parameter param135 = (!(((^~((8'hb3) ? (8'hb7) : (8'hba))) ? (-((8'hae) && (8'haa))) : (^~((8'ha9) ? (8'hac) : (8'ha8)))) < ((((8'ha4) & (8'hb9)) ^ (8'ha5)) >> ((8'ha4) >> (~^(8'ha5)))))), 
parameter param136 = ((param135 ? (param135 ? (((8'hb3) ? (8'hb7) : param135) ? (~^param135) : (^~param135)) : {(8'ha8)}) : (({param135, param135} && param135) ? (^~(^param135)) : ((~&param135) >> (~param135)))) && ({(((8'hae) >>> param135) ? (~param135) : ((8'hbe) ? param135 : param135))} <<< (({param135, param135} ? param135 : param135) ? (&{param135}) : (~param135)))))
(y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire134;
  wire [(4'hc):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire125;
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire127,
                 wire26,
                 wire27,
                 wire32,
                 wire65,
                 wire68,
                 wire70,
                 wire74,
                 wire75,
                 wire125,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg67,
                 reg69,
                 reg71,
                 reg72,
                 reg73,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire26 = $unsigned(wire23);
  assign wire27 = $signed(wire22[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg28 <= wire25;
      reg29 <= wire23;
      reg30 <= wire24[(4'hd):(2'h2)];
      reg31 <= $unsigned(reg29);
    end
  assign wire32 = $unsigned((reg29[(4'h8):(3'h6)] >> (~$unsigned($unsigned(reg30)))));
  module33 #() modinst66 (.wire36(reg30), .wire35(wire32), .y(wire65), .clk(clk), .wire37(reg28), .wire34(reg31), .wire38(wire27));
  always
    @(posedge clk) begin
      reg67 <= ((&{reg30, {$signed(wire23)}}) < reg31);
    end
  assign wire68 = ({$unsigned((-$unsigned(wire22))),
                      (^~$unsigned((reg30 ?
                          wire23 : (8'ha9))))} >> ((&wire22[(2'h2):(2'h2)]) ?
                      wire27 : ($unsigned((wire32 >>> wire27)) >= ((&reg67) - $signed(reg29)))));
  always
    @(posedge clk) begin
      reg69 <= wire65[(2'h2):(2'h2)];
    end
  assign wire70 = ((({reg30[(3'h4):(1'h0)]} <<< wire22[(4'h9):(2'h2)]) ?
                      reg28[(3'h4):(2'h2)] : wire23[(3'h5):(2'h2)]) ~^ $signed(($unsigned($unsigned(reg30)) + {reg31[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg71 <= wire22[(1'h1):(1'h1)];
      reg72 <= $unsigned(({$signed(wire65), (^~(reg30 ? wire24 : (8'h9f)))} ?
          (($unsigned(reg28) || {reg67,
              wire70}) != $unsigned(wire70)) : (reg69[(4'h8):(4'h8)] ?
              $unsigned((wire24 ? reg31 : wire32)) : (-reg71))));
      reg73 <= reg71;
    end
  assign wire74 = $signed((8'ha4));
  assign wire75 = wire65;
  always
    @(posedge clk) begin
      reg76 <= wire27;
      reg77 <= (~^reg30);
      reg78 <= $unsigned((~^{(8'h9f),
          ({wire75} ? {wire68, wire23} : $signed(reg30))}));
    end
  module79 #() modinst126 (.wire82(reg72), .y(wire125), .wire80(reg77), .wire81(wire25), .clk(clk), .wire83(reg78));
  assign wire127 = reg72;
  always
    @(posedge clk) begin
      if (reg31)
        begin
          reg128 <= {((reg67 & wire23) >> (((-reg67) << wire24) ~^ reg73))};
          reg129 <= $unsigned((~&((8'hb7) != wire23)));
          reg130 <= $signed(wire70);
        end
      else
        begin
          reg128 <= {($signed(reg28[(4'hd):(2'h3)]) ? reg73 : (8'ha4))};
        end
      reg131 <= $unsigned($unsigned(reg67[(4'hc):(4'hc)]));
      reg132 <= ($signed(reg67) ?
          ({$signed((reg73 & wire74)), $signed(((8'had) >>> reg69))} ?
              ({$unsigned(wire68)} == $signed(((8'hbf) ?
                  reg76 : reg130))) : (|wire70)) : (!$unsigned(reg72)));
    end
  assign wire133 = reg30[(3'h6):(1'h0)];
  assign wire134 = $unsigned((($unsigned($unsigned(reg28)) && $signed((!wire65))) + $unsigned((!$unsigned(reg67)))));
endmodule

module module79
#(parameter param124 = ((+((((8'ha6) << (7'h43)) ? ((8'ha3) ? (8'ha3) : (8'had)) : ((8'h9f) ~^ (8'ha2))) ? {((8'ha8) ? (7'h41) : (8'hb5))} : (((8'hb9) || (7'h43)) ^~ (&(8'hb2))))) || ((^(((8'hbe) ? (8'ha2) : (8'ha6)) ? ((8'hb8) ? (8'hb4) : (8'had)) : {(8'haa), (8'ha1)})) ? (+({(8'hbf), (7'h41)} <<< (^(7'h43)))) : (-{{(8'ha2)}}))))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire83;
  input wire signed [(4'h8):(1'h0)] wire82;
  input wire [(4'he):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire87;
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire120,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg121,
                 reg119,
                 reg118,
                 reg117,
                 reg109,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg84 <= wire80[(2'h3):(1'h1)];
      reg85 <= (^~((+($signed(reg84) + ((8'hb5) + wire82))) ^~ (($signed(wire82) ~^ $signed(wire81)) ?
          reg84[(2'h3):(2'h3)] : reg84[(3'h6):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg86 <= wire82[(1'h0):(1'h0)];
    end
  assign wire87 = reg85[(5'h13):(4'hc)];
  assign wire88 = reg85;
  assign wire89 = ({(8'ha5),
                      ((~|wire83[(3'h4):(3'h4)]) ?
                          (&{wire83, wire87}) : {$unsigned(wire83)})} & reg84);
  assign wire90 = $signed(({(^$signed(reg86)), wire82} ?
                      (~$signed({reg85, wire83})) : wire82));
  always
    @(posedge clk) begin
      if (($signed($signed($unsigned(reg86))) && ((&wire80) ?
          $unsigned($signed($signed(wire88))) : wire83[(3'h4):(1'h0)])))
        begin
          reg91 <= ($signed($signed($signed((~wire80)))) == reg84[(3'h7):(2'h2)]);
          reg92 <= (+reg91);
          reg93 <= (~(~&{wire83[(5'h10):(3'h4)], wire82}));
          if (reg86[(3'h4):(1'h0)])
            begin
              reg94 <= {(reg91 ? wire80[(4'h9):(3'h7)] : reg85)};
              reg95 <= reg92;
              reg96 <= (^~($unsigned((~((8'hb3) | wire90))) > (~{(wire83 - reg84),
                  $signed(reg95)})));
              reg97 <= wire88;
            end
          else
            begin
              reg94 <= (8'hbe);
              reg95 <= (~&reg92);
              reg96 <= $signed($unsigned(reg86));
            end
          reg98 <= {(8'hac)};
        end
      else
        begin
          if ({(8'hb7),
              ((!(8'hbe)) ? reg84[(3'h7):(1'h1)] : wire81[(1'h1):(1'h0)])})
            begin
              reg91 <= (!$signed((($unsigned(reg91) ?
                  (reg84 ?
                      (8'haa) : wire90) : $unsigned(wire88)) >>> (&$signed(reg91)))));
              reg92 <= $signed(((wire90 ?
                  $signed(wire87) : reg98) > $signed({(wire88 ?
                      reg94 : (7'h44)),
                  $signed(reg85)})));
              reg93 <= $unsigned((|(((reg98 >> (8'hb4)) ?
                  wire82[(3'h6):(2'h2)] : wire80) << $signed((reg98 ~^ wire90)))));
              reg94 <= ($unsigned((wire88 ?
                      (-$signed((8'hab))) : (&(^~reg86)))) ?
                  ((reg98 ~^ {$unsigned(wire90), $unsigned(reg85)}) ?
                      $unsigned(((reg84 | wire89) ?
                          reg96[(3'h4):(2'h2)] : (wire90 * wire83))) : (|wire82[(3'h7):(3'h4)])) : ($signed($unsigned({wire90})) > reg95));
            end
          else
            begin
              reg91 <= reg93;
              reg92 <= (^reg94[(2'h3):(1'h1)]);
              reg93 <= {(+reg98),
                  $signed($signed({$signed(wire90), (reg84 ~^ reg93)}))};
            end
          reg95 <= {($signed(((reg92 ^ reg97) >> reg95)) * $unsigned((wire90 + wire81))),
              $unsigned((((~^wire89) ? {(8'hbb), wire82} : reg86) ?
                  reg92 : reg85))};
          if ((({$unsigned(wire89[(3'h5):(3'h4)])} - (((reg96 ?
                  (8'ha9) : (7'h42)) >>> (reg85 & reg95)) ?
              reg98[(2'h2):(1'h1)] : $unsigned(wire81[(4'ha):(1'h1)]))) > reg91))
            begin
              reg96 <= ({reg85[(5'h13):(5'h12)], {{(8'ha0)}}} ?
                  (^~reg85) : reg96);
              reg97 <= $signed($signed($unsigned(({reg93,
                  wire88} > wire89[(2'h2):(1'h1)]))));
              reg98 <= ({($signed((wire81 * wire87)) != (wire88[(2'h2):(1'h0)] ?
                      {reg95} : (reg97 ?
                          wire89 : reg94)))} & $signed($signed($unsigned((|reg97)))));
            end
          else
            begin
              reg96 <= ($signed($unsigned(wire87)) ?
                  $unsigned((reg93[(4'h9):(3'h6)] ?
                      (^~wire83[(1'h0):(1'h0)]) : reg94)) : {$signed(reg93)});
              reg97 <= ({reg92} ?
                  reg84 : ({(~|(~^reg92))} ?
                      wire90 : (wire87[(2'h2):(2'h2)] ?
                          wire82[(3'h5):(1'h0)] : $signed($signed(wire82)))));
            end
        end
      reg99 <= wire80;
      if ({((~|wire80) ~^ $unsigned((wire90 ? $unsigned(wire90) : (|(8'hba))))),
          reg94})
        begin
          reg100 <= $signed($signed(wire81));
          reg101 <= $signed(($signed(reg84) ?
              reg92 : {(reg98 ^~ wire82), reg99[(1'h0):(1'h0)]}));
          reg102 <= $signed(((~&(reg86[(1'h1):(1'h0)] ^ (wire87 ?
              reg101 : reg99))) <<< reg94));
          reg103 <= reg84;
        end
      else
        begin
          reg100 <= ($unsigned((reg95[(3'h4):(1'h1)] ?
              $unsigned((reg96 << reg86)) : reg96[(3'h7):(2'h2)])) * (wire88[(3'h7):(2'h2)] ?
              $signed((~|$unsigned(wire83))) : $signed($signed($unsigned(reg86)))));
          reg101 <= wire83[(4'he):(1'h0)];
          reg102 <= $unsigned((&($unsigned(((8'ha3) >= reg100)) != {(^wire82)})));
          reg103 <= reg95[(3'h6):(3'h5)];
          if ((~(~$unsigned(($unsigned(reg100) ?
              reg86[(1'h0):(1'h0)] : (+(8'hbb)))))))
            begin
              reg104 <= {{$signed(reg85[(1'h0):(1'h0)])},
                  {(({(8'hb3),
                          reg100} || wire82[(3'h7):(1'h1)]) & {$signed(reg103),
                          (!reg97)})}};
              reg105 <= reg91;
              reg106 <= reg97;
              reg107 <= reg96;
              reg108 <= {reg102[(4'he):(1'h0)], reg104[(4'h8):(3'h6)]};
            end
          else
            begin
              reg104 <= (($signed((|(-reg107))) != ((8'hb2) != reg91[(3'h4):(2'h3)])) ?
                  {reg105} : $signed(reg94[(3'h7):(3'h4)]));
            end
        end
      reg109 <= reg108[(1'h1):(1'h1)];
    end
  assign wire110 = $unsigned((~($signed((7'h41)) | ($signed(reg102) == reg96[(2'h3):(1'h1)]))));
  assign wire111 = ((~&((~^((8'ha8) ? (7'h43) : reg99)) ?
                           (^$signed(reg97)) : (-$unsigned(reg105)))) ?
                       ((~(~^(reg96 ?
                           reg91 : reg101))) && $unsigned($signed(reg107[(4'h8):(3'h7)]))) : reg97[(4'he):(3'h6)]);
  assign wire112 = (^~$unsigned(reg98[(4'hb):(3'h5)]));
  assign wire113 = (&$unsigned(reg108[(2'h3):(1'h1)]));
  assign wire114 = wire83;
  assign wire115 = (-wire87);
  assign wire116 = (-$unsigned(($unsigned(reg99[(4'h9):(1'h1)]) ^ $signed((^~wire81)))));
  always
    @(posedge clk) begin
      reg117 <= (~|reg95[(3'h5):(3'h4)]);
      reg118 <= $signed($unsigned(reg102[(4'hd):(4'hc)]));
      reg119 <= $signed($signed((({reg85, (8'ha7)} ~^ (wire113 + wire82)) ?
          wire88 : wire114[(2'h2):(1'h1)])));
    end
  assign wire120 = $unsigned((!($unsigned($unsigned(reg119)) ?
                       reg103 : {$unsigned((8'haa)), reg86[(3'h6):(3'h5)]})));
  always
    @(posedge clk) begin
      reg121 <= $unsigned($unsigned({({wire80} + ((8'hac) ^~ wire87))}));
    end
  assign wire122 = reg98[(4'h9):(4'h8)];
  assign wire123 = $unsigned(wire111[(3'h5):(1'h1)]);
endmodule

module module33
#(parameter param64 = (~&({(8'hbe)} ? (-(-((8'hb4) ? (7'h40) : (8'ha3)))) : (^(~|(|(8'h9e)))))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(3'h4):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  assign y = {wire63,
                 wire58,
                 wire57,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire39 = $signed(wire34[(3'h4):(1'h1)]);
  assign wire40 = $unsigned(((8'ha7) ?
                      wire36[(4'h9):(3'h7)] : wire36[(4'h8):(4'h8)]));
  assign wire41 = (~$unsigned(($unsigned(wire38[(3'h6):(2'h3)]) ^~ {wire34})));
  assign wire42 = (((^~wire38[(5'h12):(5'h12)]) ?
                      wire35[(1'h0):(1'h0)] : $unsigned({$unsigned(wire41)})) >= wire38[(5'h13):(5'h11)]);
  assign wire43 = $signed((~&$signed($unsigned((wire37 > wire40)))));
  assign wire44 = $unsigned(((~|wire38) ?
                      wire35[(5'h10):(2'h2)] : $signed(wire43)));
  assign wire45 = ($unsigned((wire43[(4'hc):(4'hc)] > $signed((wire34 < wire43)))) ?
                      $unsigned((wire36[(4'ha):(3'h7)] && wire41)) : (~&wire34[(2'h2):(1'h1)]));
  assign wire46 = (-{$unsigned((&$signed(wire40)))});
  always
    @(posedge clk) begin
      reg47 <= $signed($unsigned(wire46));
      reg48 <= $unsigned(wire42);
      if ((^~{$unsigned((|wire40[(1'h0):(1'h0)]))}))
        begin
          reg49 <= (reg48 <= ((wire43[(2'h3):(2'h3)] ?
              $signed((8'hb0)) : wire43[(1'h0):(1'h0)]) >>> (&($unsigned(wire39) ?
              $unsigned(wire46) : $signed(wire37)))));
        end
      else
        begin
          reg49 <= wire39[(2'h2):(2'h2)];
          reg50 <= $signed((8'hb8));
          reg51 <= (~&(($unsigned((wire42 ?
              wire39 : wire41)) == (~wire41[(2'h2):(2'h2)])) > $signed((+{reg50}))));
          reg52 <= wire44[(4'h9):(3'h7)];
        end
      if ($unsigned(wire46[(5'h10):(2'h3)]))
        begin
          reg53 <= $unsigned($unsigned(($signed(wire45[(1'h0):(1'h0)]) ?
              (~|(|(8'ha4))) : wire37[(1'h0):(1'h0)])));
          reg54 <= {(-reg49[(4'hc):(1'h0)])};
        end
      else
        begin
          reg53 <= ($unsigned((^~($signed(wire42) >= (wire36 ?
                  wire44 : wire38)))) ?
              wire37 : $unsigned(($unsigned({wire45}) ?
                  $unsigned($signed(wire36)) : (~$signed(wire46)))));
          reg54 <= (|$signed(reg51));
          reg55 <= ($signed(($signed(reg51) != wire34[(2'h3):(1'h1)])) ?
              {wire37[(2'h3):(1'h0)]} : $unsigned((((wire41 ?
                      reg48 : wire39) - (reg51 << reg52)) ?
                  ($signed(wire40) ?
                      (reg52 || (8'ha1)) : $unsigned(reg49)) : (^{wire39}))));
          reg56 <= ({(wire42 > reg49), $signed(reg50)} ?
              ($unsigned(reg48[(3'h5):(2'h2)]) > ({(reg54 >> reg47),
                      wire43[(4'hd):(2'h2)]} ?
                  wire38 : ($signed(wire40) ?
                      reg49 : ((8'h9f) ^ wire40)))) : (~|wire36[(1'h0):(1'h0)]));
        end
    end
  assign wire57 = $unsigned(((^{(wire34 << wire44),
                      reg52[(4'h9):(2'h2)]}) > wire43[(4'hc):(2'h3)]));
  assign wire58 = reg54[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg59 <= $unsigned((((+$unsigned((8'hb7))) | (&(|reg48))) >> $signed($unsigned(wire43))));
      reg60 <= (($signed(reg49) ?
          (8'hbf) : {$signed($unsigned(reg47)),
              $unsigned($signed((8'ha6)))}) ^ ((reg47 ?
          ((~^wire46) ? $signed(reg50) : (wire36 ? reg51 : reg49)) : (-(wire58 ?
              reg47 : wire57))) ^~ wire42[(3'h7):(3'h4)]));
      reg61 <= (((reg60 | $signed((reg53 || wire58))) ? wire40 : reg47) ?
          {(|$signed($signed(wire57))),
              {(8'ha4), $signed(((8'hbe) << (8'hbb)))}} : reg56);
      reg62 <= {wire44};
    end
  assign wire63 = {(wire40[(3'h4):(1'h0)] < reg48[(3'h5):(3'h5)]),
                      (({(^(8'hae))} ?
                          (8'hba) : reg47) || $signed(wire57[(1'h0):(1'h0)]))};
endmodule

module module184
#(parameter param217 = (((7'h40) ? {(((8'hba) ? (8'hb9) : (8'hb1)) ^ {(8'hb6)}), (((7'h40) && (8'hb8)) ? ((8'ha5) >> (7'h44)) : ((7'h43) <= (8'hb1)))} : (-((&(8'hb0)) ~^ ((8'haa) ? (8'haf) : (8'ha3))))) ? {{((&(8'hb1)) | ((8'h9e) <<< (7'h43))), (~|{(8'h9d)})}, {{(^~(8'hbb))}}} : ((~&(~|(~&(8'ha6)))) ? (({(8'hb6)} >= ((8'hb3) ? (8'hab) : (8'ha1))) ? ((^~(8'h9f)) - ((7'h42) ? (8'hbd) : (7'h41))) : (&(^~(8'hbc)))) : (~(((7'h40) ? (8'h9f) : (8'hb5)) ? (~|(7'h40)) : ((8'h9f) >= (8'ha7)))))), 
parameter param218 = (param217 == {(^((^param217) ? (|param217) : {param217, param217}))}))
(y, clk, wire189, wire188, wire187, wire186, wire185);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire189;
  input wire [(4'hf):(1'h0)] wire188;
  input wire signed [(4'he):(1'h0)] wire187;
  input wire signed [(4'ha):(1'h0)] wire186;
  input wire signed [(4'hf):(1'h0)] wire185;
  wire signed [(3'h7):(1'h0)] wire216;
  wire [(4'ha):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire214;
  wire signed [(4'h9):(1'h0)] wire211;
  wire signed [(5'h11):(1'h0)] wire210;
  wire [(4'hd):(1'h0)] wire209;
  wire [(4'h9):(1'h0)] wire208;
  wire signed [(4'hf):(1'h0)] wire207;
  wire [(4'hd):(1'h0)] wire206;
  wire [(3'h4):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire197;
  wire signed [(4'h8):(1'h0)] wire196;
  wire signed [(5'h10):(1'h0)] wire192;
  wire signed [(4'h9):(1'h0)] wire191;
  wire [(4'ha):(1'h0)] wire190;
  reg signed [(4'hb):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  reg [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg [(3'h4):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg193 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire197,
                 wire196,
                 wire192,
                 wire191,
                 wire190,
                 reg213,
                 reg212,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  assign wire190 = ($unsigned($unsigned(wire186)) ?
                       ((wire186 << wire185) ?
                           {((wire188 ?
                                   wire188 : wire188) > (|wire189))} : ($signed(wire189[(3'h6):(3'h5)]) && wire186)) : wire189[(4'h9):(1'h0)]);
  assign wire191 = (wire188 ? (8'had) : wire188);
  assign wire192 = wire189;
  always
    @(posedge clk) begin
      reg193 <= $signed(((wire192 >= (wire187[(4'hc):(3'h4)] != $unsigned(wire187))) ~^ $signed((^~(&wire185)))));
      reg194 <= $signed((((&wire187[(3'h7):(3'h7)]) ?
              $signed(wire189) : wire185[(4'hf):(3'h6)]) ?
          (wire188[(3'h6):(3'h5)] ?
              ((|wire188) == (wire192 << wire191)) : (~^wire192[(4'h8):(3'h7)])) : (^~wire189)));
      reg195 <= (wire186 || $signed(wire188));
    end
  assign wire196 = wire185;
  assign wire197 = wire186;
  always
    @(posedge clk) begin
      reg198 <= reg193[(4'hd):(3'h5)];
      reg199 <= wire197;
      if ((wire186[(4'h9):(3'h6)] >>> (wire185[(2'h2):(1'h1)] ?
          ($signed(reg198) || ($unsigned(wire188) ?
              reg195[(1'h1):(1'h0)] : $signed(reg195))) : wire185)))
        begin
          reg200 <= {wire191[(2'h2):(2'h2)],
              ((+$signed(reg193)) > reg198[(4'hc):(3'h7)])};
          reg201 <= (8'hb7);
        end
      else
        begin
          reg200 <= wire185[(4'ha):(4'h8)];
          reg201 <= reg200[(3'h4):(2'h2)];
          reg202 <= (wire188 ?
              (~&reg199[(3'h7):(3'h7)]) : ({{(reg199 <<< wire190)}, reg198} ?
                  $unsigned(wire192) : (((wire189 <<< reg198) <= (wire186 ?
                          wire192 : wire188)) ?
                      {$unsigned(wire186)} : ((reg194 ?
                          reg200 : wire197) ^ wire197))));
          reg203 <= {wire187, $unsigned($unsigned(reg201[(4'hf):(4'hd)]))};
          reg204 <= (~&(($signed($signed(wire188)) ^~ wire189) | wire190));
        end
    end
  assign wire205 = $signed($unsigned(reg193));
  assign wire206 = wire205;
  assign wire207 = ((!$unsigned((reg195 ^ wire205))) ?
                       {wire190[(1'h0):(1'h0)],
                           $signed((wire206[(3'h6):(1'h0)] << {wire189}))} : (($signed((&wire185)) ?
                               $signed({reg194}) : $unsigned((reg204 ?
                                   reg201 : reg203))) ?
                           $unsigned(((wire191 >>> wire190) ?
                               reg194 : (wire192 && wire190))) : $unsigned($unsigned(reg200[(2'h3):(1'h1)]))));
  assign wire208 = $signed((~&$unsigned(wire206[(4'h8):(4'h8)])));
  assign wire209 = ({wire192[(5'h10):(4'hb)]} != reg200);
  assign wire210 = reg198;
  assign wire211 = wire208;
  always
    @(posedge clk) begin
      reg212 <= (reg204 ?
          reg201[(4'h8):(1'h0)] : {$signed($unsigned($unsigned(reg195)))});
      reg213 <= wire190;
    end
  assign wire214 = $unsigned(reg202[(3'h6):(3'h4)]);
  assign wire215 = (~|{wire210[(2'h2):(2'h2)],
                       ($unsigned((+(8'had))) ?
                           reg204[(1'h1):(1'h1)] : $signed($unsigned(reg204)))});
  assign wire216 = wire187[(3'h4):(2'h3)];
endmodule

module module151
#(parameter param175 = (~{((((8'hbc) ? (7'h40) : (8'ha7)) ? ((8'hb4) ? (8'h9e) : (8'hbe)) : ((8'hb6) ? (8'ha4) : (8'ha2))) && {((7'h41) ? (8'ha1) : (7'h44)), (!(8'hb3))})}))
(y, clk, wire156, wire155, wire154, wire153, wire152);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire156;
  input wire [(2'h3):(1'h0)] wire155;
  input wire [(4'h8):(1'h0)] wire154;
  input wire signed [(4'ha):(1'h0)] wire153;
  input wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire158;
  wire signed [(3'h6):(1'h0)] wire157;
  reg signed [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire161,
                 wire159,
                 wire158,
                 wire157,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg160,
                 (1'h0)};
  assign wire157 = wire153[(3'h4):(2'h3)];
  assign wire158 = (+wire157);
  assign wire159 = wire158[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg160 <= $signed(($signed((^~(8'ha9))) + wire154[(3'h5):(2'h3)]));
    end
  assign wire161 = $unsigned(wire153[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      if ({$signed($signed((&$unsigned(wire154)))),
          (^(+{wire158[(2'h2):(1'h0)]}))})
        begin
          reg162 <= (8'ha6);
        end
      else
        begin
          reg162 <= (|((wire155[(1'h0):(1'h0)] ?
                  {(wire155 != wire155)} : ((^wire154) <<< $unsigned(wire153))) ?
              (!($signed(wire153) ?
                  (8'ha8) : $signed(wire159))) : (wire152[(4'h9):(3'h4)] - wire159[(2'h2):(1'h0)])));
        end
      reg163 <= wire153;
      if ((|wire155))
        begin
          if (wire159[(1'h1):(1'h1)])
            begin
              reg164 <= {(($unsigned(wire159) >= $signed($signed((8'hbb)))) >>> $signed(wire154[(4'h8):(3'h7)]))};
              reg165 <= (|$signed(wire153[(2'h2):(1'h0)]));
              reg166 <= reg163;
              reg167 <= $unsigned({$unsigned((wire157 ?
                      reg162[(1'h0):(1'h0)] : wire159)),
                  $signed((~^(wire154 + wire159)))});
              reg168 <= ((({(&(8'hbb)), $unsigned(wire159)} ?
                          (reg165 ?
                              wire156[(3'h4):(2'h2)] : (reg160 || wire155)) : $signed($signed(reg166))) ?
                      reg162[(1'h0):(1'h0)] : $unsigned((wire158 >> reg166[(4'ha):(3'h7)]))) ?
                  reg162[(2'h2):(2'h2)] : $signed((-(wire159 ?
                      (^reg162) : $unsigned(wire155)))));
            end
          else
            begin
              reg164 <= $unsigned(reg162);
              reg165 <= (-$unsigned({reg168}));
            end
          reg169 <= $signed((wire153 ?
              ((~$unsigned(reg167)) ^~ (wire153 ?
                  (reg167 <= wire154) : {wire156,
                      (8'h9f)})) : (reg163 ^ wire153)));
          reg170 <= ((~^$signed((wire152[(3'h4):(2'h2)] ?
                  {wire153} : (wire159 ^~ wire157)))) ?
              reg163 : wire158);
          reg171 <= (wire153 <<< $signed((($signed(reg164) != $unsigned(wire158)) ?
              ($unsigned(wire159) ?
                  (reg169 ? wire153 : wire161) : {wire152,
                      wire157}) : $signed((reg160 > reg160)))));
        end
      else
        begin
          reg164 <= ($unsigned(reg162) - (reg162 ~^ {reg171,
              $signed($unsigned(reg167))}));
        end
      reg172 <= (($unsigned((reg163[(5'h11):(3'h6)] == (-reg163))) ?
          {$signed((wire152 ? reg160 : reg170))} : $signed(((^(7'h40)) ?
              (|wire152) : reg164))) >= ($signed((^~(^~reg169))) ?
          (reg171[(4'hb):(3'h6)] ?
              $unsigned($unsigned(reg162)) : (+reg163)) : reg162[(2'h2):(2'h2)]));
    end
  assign wire173 = $unsigned(reg164[(4'hb):(4'h8)]);
  assign wire174 = $unsigned((~^(~(reg165 ? $signed(wire158) : (+reg162)))));
endmodule
