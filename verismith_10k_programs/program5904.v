module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire227;
  wire [(4'hc):(1'h0)] wire226;
  wire signed [(4'hf):(1'h0)] wire225;
  wire signed [(4'hf):(1'h0)] wire224;
  wire [(3'h6):(1'h0)] wire222;
  wire signed [(5'h12):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire159;
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire222,
                 wire165,
                 wire159,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 (1'h0)};
  module4 #() modinst160 (wire159, clk, wire1, wire2, wire3, wire0);
  always
    @(posedge clk) begin
      reg161 <= {wire1[(1'h0):(1'h0)], wire159};
      if ($unsigned(wire159))
        begin
          reg162 <= wire3;
          reg163 <= {wire1, (~^wire1[(3'h7):(3'h6)])};
        end
      else
        begin
          reg162 <= $signed(reg162);
          reg163 <= ({(wire3[(3'h7):(2'h2)] ?
                      $unsigned(wire1[(4'ha):(3'h5)]) : (wire159 ?
                          (reg161 ? (8'ha8) : wire1) : (reg161 >= wire3))),
                  $unsigned(wire1[(1'h1):(1'h1)])} ?
              $unsigned(((reg161 ? (wire0 && reg163) : (wire2 >= wire159)) ?
                  $signed($unsigned(reg163)) : $unsigned($signed(reg163)))) : reg161);
        end
      reg164 <= $unsigned($unsigned(({$signed(wire159),
          $unsigned(reg163)} || wire0)));
    end
  assign wire165 = $unsigned({{$unsigned($signed(wire3))}});
  module166 #() modinst223 (.wire167(reg164), .clk(clk), .wire171(wire159), .y(wire222), .wire168(reg163), .wire170(wire1), .wire169(reg161));
  assign wire224 = $unsigned((wire0[(4'hb):(2'h3)] != $unsigned(reg164[(2'h3):(1'h0)])));
  assign wire225 = ($unsigned((8'haa)) ?
                       $unsigned((~|(+$signed(wire165)))) : {((8'hb2) ?
                               ((reg162 ^ wire165) << (wire222 > wire159)) : {reg164[(3'h5):(3'h4)]})});
  assign wire226 = $unsigned($unsigned(wire159[(4'he):(3'h6)]));
  assign wire227 = {wire225};
endmodule

module module166
#(parameter param221 = (({(((8'hab) ? (8'hb4) : (8'hb9)) ? ((8'hbd) ? (8'ha4) : (8'hb8)) : ((8'hbb) ? (8'ha4) : (8'haf)))} ? (&(&{(8'hb6), (8'hbc)})) : ({(^(8'hb7))} ? (-((8'had) ? (8'hba) : (8'ha9))) : ((+(8'hb3)) <= ((8'h9c) ? (8'ha9) : (7'h43))))) != (((((8'haf) <<< (8'ha0)) < {(7'h40)}) >> (^(!(7'h42)))) <= (-{((8'ha2) ? (8'hb4) : (8'ha3))}))))
(y, clk, wire171, wire170, wire169, wire168, wire167);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire171;
  input wire signed [(4'hb):(1'h0)] wire170;
  input wire signed [(5'h11):(1'h0)] wire169;
  input wire signed [(4'hf):(1'h0)] wire168;
  input wire signed [(4'h9):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire220;
  wire signed [(5'h13):(1'h0)] wire218;
  wire [(5'h14):(1'h0)] wire202;
  wire signed [(5'h15):(1'h0)] wire173;
  wire [(3'h5):(1'h0)] wire172;
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg179 = (1'h0);
  assign y = {wire220,
                 wire218,
                 wire202,
                 wire173,
                 wire172,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 (1'h0)};
  assign wire172 = wire168[(1'h0):(1'h0)];
  assign wire173 = $unsigned((8'hb5));
  always
    @(posedge clk) begin
      if ((+wire173))
        begin
          reg174 <= (wire172 ?
              ($signed(wire167[(3'h5):(2'h2)]) & $signed((~|wire168))) : wire170[(3'h7):(3'h6)]);
          reg175 <= (wire169[(4'h9):(3'h6)] ?
              (wire167[(2'h2):(1'h0)] ?
                  {(~|$signed(wire173)),
                      ((wire171 ?
                          wire168 : wire173) && (wire167 * wire168))} : (wire170[(4'h8):(3'h7)] ?
                      $unsigned($unsigned(wire167)) : wire169)) : $unsigned({((|wire173) ?
                      (wire169 ? wire170 : (8'ha7)) : $signed(wire167))}));
        end
      else
        begin
          reg174 <= {(wire167 + $unsigned((~&(~^wire170))))};
          if (wire168[(1'h0):(1'h0)])
            begin
              reg175 <= (~&wire173);
              reg176 <= (^~$unsigned($unsigned($signed($signed(wire172)))));
              reg177 <= $signed((8'hb3));
            end
          else
            begin
              reg175 <= reg176[(4'h8):(3'h6)];
              reg176 <= wire170;
              reg177 <= wire171[(1'h1):(1'h1)];
              reg178 <= (+(!(^~wire172[(1'h1):(1'h1)])));
            end
          reg179 <= $unsigned(($unsigned(((8'h9e) | wire168)) ?
              $unsigned($unsigned((-wire173))) : $unsigned(reg174[(1'h1):(1'h1)])));
        end
    end
  module180 #() modinst203 (.wire184(reg176), .wire182(wire170), .clk(clk), .wire183(reg178), .y(wire202), .wire181(wire168));
  module204 #() modinst219 (wire218, clk, reg178, reg179, wire169, wire173, reg175);
  assign wire220 = wire173[(4'h8):(1'h1)];
endmodule

module module4
#(parameter param158 = (((((&(8'ha8)) ? ((8'hb4) ? (8'h9d) : (8'ha5)) : (8'h9d)) > (~&(-(8'hbf)))) ? ((((8'hb4) ? (8'hb7) : (8'ha6)) > {(8'ha4), (8'h9e)}) | (((8'hb6) ? (8'hb4) : (8'ha2)) ? (+(7'h43)) : ((7'h41) == (8'h9c)))) : {(|{(8'hb3)})}) ? ((|(((8'hbf) <= (8'h9f)) < {(8'ha6)})) <<< ((((8'hb4) || (8'h9d)) ? (^~(8'hbc)) : {(8'hb1)}) ? {{(8'hb6), (8'hbe)}, (!(8'hae))} : (((7'h40) > (8'ha5)) ? {(8'ha0)} : {(8'h9d)}))) : (((((8'had) * (8'haf)) ? (|(8'hac)) : ((8'hac) | (8'hac))) ? (^~(8'ha4)) : (((7'h40) ? (8'hb8) : (8'hbb)) ? {(8'hab)} : (~|(8'ha3)))) ? (-(~&((8'hbc) ? (8'hbb) : (8'h9c)))) : (8'had))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h282):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire5;
  input wire [(3'h5):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(3'h6):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire138;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire154,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire9,
                 wire13,
                 wire19,
                 wire36,
                 wire37,
                 wire116,
                 wire118,
                 wire119,
                 wire120,
                 wire125,
                 wire138,
                 reg35,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 (1'h0)};
  assign wire9 = $unsigned($unsigned($signed($unsigned((|wire6)))));
  always
    @(posedge clk) begin
      reg10 <= {wire8, $unsigned($signed(wire8))};
      reg11 <= (wire7 ?
          $signed((wire7[(3'h4):(3'h4)] ?
              reg10[(4'h8):(3'h6)] : ($signed(wire7) >>> $unsigned(wire9)))) : $unsigned($signed(((wire9 > wire7) * (wire5 ?
              wire5 : wire7)))));
      reg12 <= ({$unsigned(($signed((8'h9e)) ~^ reg10)), wire7[(3'h5):(1'h0)]} ?
          ($signed((-((8'ha9) <= wire5))) | $signed($signed((^~wire5)))) : $unsigned({$signed($signed(reg11)),
              ($signed(wire6) ^~ wire6[(2'h2):(1'h1)])}));
    end
  assign wire13 = $unsigned(((+$signed((reg12 ? reg10 : wire6))) ?
                      $unsigned((~|$unsigned(reg12))) : (reg12 ?
                          $unsigned((reg10 ? reg11 : wire5)) : (+{wire8,
                              wire7}))));
  always
    @(posedge clk) begin
      reg14 <= $signed((((~&(wire9 ~^ (8'hb0))) ?
          (8'hb3) : (wire9[(5'h10):(2'h3)] && ((8'h9d) ?
              reg12 : reg10))) < {wire7}));
      reg15 <= ($unsigned((((wire13 ? (8'ha3) : wire9) << (^~(8'haa))) ?
              ($signed(reg14) ?
                  (8'hb1) : (wire13 ?
                      reg14 : (8'hb0))) : ((^reg12) + ((8'hb2) - wire5)))) ?
          $unsigned($signed({wire6, $unsigned(wire7)})) : $signed(wire9));
      reg16 <= ($signed(($unsigned((wire8 ? wire9 : wire5)) << (&(^(8'hb7))))) ?
          wire9[(3'h6):(1'h0)] : (^~($unsigned($signed(wire8)) ?
              (|(wire5 - wire5)) : wire8[(4'h8):(1'h1)])));
      reg17 <= (~&{$signed($signed($unsigned(reg10))),
          $unsigned(wire8[(5'h10):(1'h1)])});
      reg18 <= $signed((|reg12));
    end
  assign wire19 = ($signed(wire5) ?
                      $unsigned((+($unsigned((8'hb3)) * wire6[(2'h3):(1'h0)]))) : reg11);
  always
    @(posedge clk) begin
      reg20 <= $unsigned((-reg10));
      if ($signed(wire19))
        begin
          if ($unsigned(($unsigned(wire19[(5'h11):(4'he)]) ?
              $signed(reg17[(3'h7):(2'h2)]) : (((reg16 || (8'had)) > $signed(reg10)) ?
                  reg11 : $unsigned($unsigned(wire7))))))
            begin
              reg21 <= (+$unsigned($signed(reg12[(3'h4):(3'h4)])));
              reg22 <= (+((+{wire6[(3'h5):(2'h3)],
                  (reg16 ? reg20 : reg20)}) && (((+wire9) >= {(8'h9e)}) ?
                  {$signed(reg21)} : reg16)));
              reg23 <= (8'hb3);
            end
          else
            begin
              reg21 <= reg17;
              reg22 <= reg15;
              reg23 <= {$signed($unsigned($unsigned((!reg15)))),
                  (($signed(reg23[(5'h11):(4'h9)]) ?
                          reg14[(2'h3):(1'h1)] : {reg10[(4'ha):(4'h8)],
                              $signed(reg22)}) ?
                      ((+$signed(reg23)) ~^ {reg18[(1'h1):(1'h1)],
                          wire6[(2'h3):(1'h1)]}) : (8'ha1))};
              reg24 <= $signed(reg20);
            end
          reg25 <= reg16[(4'h9):(3'h7)];
          reg26 <= wire5;
        end
      else
        begin
          reg21 <= (!reg26[(4'hc):(4'ha)]);
          if (reg25)
            begin
              reg22 <= (^~$signed((($signed((8'ha0)) != (reg21 ?
                  reg23 : wire19)) >>> reg25)));
            end
          else
            begin
              reg22 <= $unsigned(reg17);
            end
          if ($unsigned((-reg14[(3'h7):(3'h5)])))
            begin
              reg23 <= $signed((wire8[(4'h8):(3'h5)] ~^ reg14));
              reg24 <= (~wire6);
              reg25 <= reg25;
              reg26 <= reg10[(4'ha):(3'h4)];
              reg27 <= $signed($unsigned((-reg18[(4'hf):(4'hc)])));
            end
          else
            begin
              reg23 <= $unsigned(reg16[(5'h11):(3'h7)]);
            end
          reg28 <= reg17;
          if ((!(wire8[(1'h0):(1'h0)] ?
              {$unsigned((wire13 <<< reg11))} : reg27[(1'h1):(1'h1)])))
            begin
              reg29 <= $unsigned($signed((wire8 ?
                  reg17 : ($signed(reg18) ?
                      reg15[(3'h7):(3'h5)] : $signed((8'hb4))))));
              reg30 <= reg21[(1'h0):(1'h0)];
              reg31 <= $unsigned((reg25 | $unsigned($signed($signed(reg26)))));
              reg32 <= $signed(reg21[(3'h4):(2'h3)]);
              reg33 <= (~^{{($signed(reg12) ?
                          (wire7 ? reg24 : reg28) : $unsigned(wire9)),
                      (~^(reg24 ? reg20 : reg20))}});
            end
          else
            begin
              reg29 <= $unsigned($unsigned((reg15[(2'h2):(1'h0)] >> wire7[(3'h4):(1'h1)])));
            end
        end
      reg34 <= $unsigned(($signed(((reg29 ? reg29 : reg10) ?
              reg12[(4'hf):(3'h7)] : ((8'ha8) <= reg21))) ?
          wire6 : (+reg31[(5'h10):(3'h4)])));
      reg35 <= {$signed((^$signed($unsigned(reg31))))};
    end
  assign wire36 = {(~^{reg24[(4'h9):(4'h8)]})};
  assign wire37 = (^($signed($unsigned(reg28)) ?
                      $unsigned((8'hb9)) : {(~&wire7)}));
  module38 #() modinst117 (.y(wire116), .clk(clk), .wire43(reg18), .wire41(reg28), .wire40(reg35), .wire39(reg20), .wire42(reg15));
  assign wire118 = $unsigned($unsigned($unsigned(({(8'hbe)} ?
                       (reg22 ^~ wire8) : (reg29 ? reg24 : reg16)))));
  assign wire119 = $unsigned({$unsigned((reg26[(4'he):(3'h5)] ?
                           reg14 : wire9[(1'h0):(1'h0)]))});
  assign wire120 = ($unsigned(reg35[(2'h2):(1'h0)]) << reg29);
  always
    @(posedge clk) begin
      reg121 <= wire9;
      reg122 <= $unsigned(reg10[(4'ha):(1'h0)]);
      reg123 <= ($signed((~&$signed((reg23 || wire5)))) ?
          reg11[(1'h0):(1'h0)] : (($unsigned($unsigned((8'hba))) >> $signed($unsigned(reg35))) >>> $signed((+(reg30 ?
              reg31 : reg10)))));
      reg124 <= $signed(((reg34[(3'h4):(2'h2)] > ($signed(wire119) ?
              $signed(reg25) : (reg25 ? reg31 : wire9))) ?
          (reg32 && (-(~|reg123))) : (8'ha2)));
    end
  assign wire125 = (|{{$signed($unsigned(reg18)), reg12[(3'h4):(2'h3)]}});
  module126 #() modinst139 (wire138, clk, wire36, reg34, reg22, reg123);
  assign wire140 = reg12[(4'ha):(1'h1)];
  assign wire141 = ($unsigned({(~^$unsigned(wire118))}) ?
                       $signed({(+(!wire119)),
                           $unsigned({reg35, wire7})}) : reg123[(1'h0):(1'h0)]);
  assign wire142 = $unsigned({{reg25[(1'h1):(1'h1)]}, wire119});
  assign wire143 = wire36;
  module144 #() modinst155 (.wire145(reg15), .wire148(wire36), .wire146(wire19), .clk(clk), .y(wire154), .wire147(reg24));
  assign wire156 = wire6[(1'h0):(1'h0)];
  assign wire157 = (wire36 | reg33);
endmodule

module module144  (y, clk, wire148, wire147, wire146, wire145);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire148;
  input wire [(5'h12):(1'h0)] wire147;
  input wire signed [(4'hc):(1'h0)] wire146;
  input wire [(5'h12):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  assign y = {wire153, wire152, wire151, reg150, reg149, (1'h0)};
  always
    @(posedge clk) begin
      reg149 <= $unsigned((wire147[(4'he):(4'h8)] ?
          (wire146 ? wire147 : (8'hb5)) : $unsigned(wire148[(4'hc):(3'h6)])));
      reg150 <= $unsigned({wire145[(4'hd):(4'hc)]});
    end
  assign wire151 = $signed($unsigned((!(-$unsigned(reg150)))));
  assign wire152 = wire146;
  assign wire153 = $unsigned($signed((+($signed(wire148) < (reg149 == reg150)))));
endmodule

module module126  (y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire130;
  input wire signed [(5'h10):(1'h0)] wire129;
  input wire signed [(5'h10):(1'h0)] wire128;
  input wire signed [(4'hd):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire131 = (wire129[(2'h2):(2'h2)] << wire128[(2'h3):(2'h2)]);
  assign wire132 = wire128[(4'h8):(3'h5)];
  assign wire133 = (((~&$unsigned($unsigned(wire127))) ?
                           wire128 : (&wire127[(3'h5):(1'h1)])) ?
                       (wire131 - wire132[(4'h9):(3'h5)]) : $unsigned((~|wire130[(4'hd):(2'h3)])));
  assign wire134 = (wire127[(4'hb):(3'h7)] ? wire129[(3'h6):(2'h3)] : wire133);
  always
    @(posedge clk) begin
      reg135 <= $unsigned($signed($signed(wire130[(1'h0):(1'h0)])));
      reg136 <= wire130;
      reg137 <= $unsigned($unsigned(wire131[(3'h4):(1'h1)]));
    end
endmodule

module module38
#(parameter param115 = ({{((~|(8'hb5)) ? (^(7'h42)) : {(8'h9d), (8'hb7)})}, {((&(8'hbd)) >= {(8'hb5), (8'hb5)}), (8'hb3)}} || (((~(8'hb8)) || {((8'hb4) ? (8'ha9) : (8'hb9)), ((8'hb8) ? (8'ha8) : (8'haa))}) ? {{{(8'hb7), (8'h9e)}, ((8'ha5) | (7'h44))}, ((~(8'ha3)) ? {(8'hb1), (8'h9f)} : ((8'h9e) ? (8'hb5) : (7'h43)))} : (((^(7'h43)) ? ((8'hbd) ? (8'hb2) : (8'hb9)) : ((8'hbb) ? (8'ha1) : (8'ha9))) >>> (((8'hb6) ^~ (8'ha3)) ^ ((8'hb4) ? (8'hb1) : (8'hb0)))))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h387):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire [(4'ha):(1'h0)] wire42;
  input wire [(4'h8):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire [(2'h2):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire98,
                 wire97,
                 wire74,
                 wire73,
                 wire62,
                 wire61,
                 reg112,
                 reg111,
                 reg110,
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
                 reg77,
                 reg76,
                 reg75,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= (wire41 ?
          ($signed((wire39[(1'h1):(1'h1)] ?
              (wire40 ?
                  wire41 : (7'h41)) : (8'ha3))) ^ wire42) : ((wire41 | ((~wire42) ?
              wire43 : (|(8'haa)))) ^ $signed($unsigned(wire42))));
      if (((({wire42,
              (wire39 ? (8'hb3) : wire39)} + $unsigned(wire39[(1'h0):(1'h0)])) ?
          (-{(wire41 ? wire39 : (8'hb6)), $signed(wire43)}) : ($signed((reg44 ?
                  (8'ha1) : wire42)) ?
              {wire39[(2'h2):(1'h0)]} : $unsigned(reg44))) ^~ $signed((reg44[(3'h6):(3'h5)] ?
          $unsigned(wire43[(3'h4):(1'h0)]) : wire40))))
        begin
          reg45 <= {(!((wire42 ?
                  reg44[(4'h9):(3'h4)] : wire42[(3'h4):(2'h2)]) + wire41[(2'h2):(1'h1)]))};
          if (((!reg44) ?
              $signed(wire39[(2'h2):(1'h0)]) : (^(wire41[(4'h8):(3'h5)] ?
                  $signed($unsigned(wire40)) : wire43[(3'h6):(3'h4)]))))
            begin
              reg46 <= (+$unsigned(((&(reg45 < wire42)) ?
                  (^$signed(wire40)) : $unsigned(((8'hb4) ^ (8'hb0))))));
              reg47 <= $unsigned($unsigned(((|{reg44, wire42}) && (!(reg46 ?
                  (8'hb3) : wire43)))));
              reg48 <= reg47;
              reg49 <= $signed($signed(($signed({(8'ha4)}) > ((wire41 ?
                      (8'ha2) : wire40) ?
                  (~^reg46) : {wire39}))));
              reg50 <= (((!(&(wire41 == (8'hbd)))) ?
                      $unsigned(wire41[(3'h6):(2'h2)]) : $signed(wire41[(3'h5):(2'h3)])) ?
                  (($unsigned($unsigned(wire41)) ?
                          $unsigned((wire40 ?
                              reg47 : reg49)) : $unsigned(wire39)) ?
                      reg48 : reg45) : reg49[(4'he):(4'ha)]);
            end
          else
            begin
              reg46 <= {{(reg50 ?
                          ((^~reg45) | $unsigned(reg45)) : $signed(((8'hb1) * reg46)))}};
              reg47 <= ($unsigned($unsigned(($unsigned(wire40) ?
                  (^~(8'hbb)) : (+wire43)))) <= ((&((reg48 ?
                  wire41 : reg46) >> (reg45 ?
                  reg47 : reg46))) <= ($signed($signed((8'ha8))) ?
                  (|(reg48 || reg45)) : reg44[(4'h8):(1'h1)])));
              reg48 <= wire42[(3'h5):(1'h1)];
              reg49 <= ((wire43 >>> reg44[(2'h3):(1'h0)]) ~^ {wire42[(2'h3):(2'h2)]});
            end
          reg51 <= $signed(reg44[(4'hc):(4'ha)]);
          if ($unsigned(reg47[(1'h0):(1'h0)]))
            begin
              reg52 <= (~&(({reg46} ? reg51[(4'h8):(3'h6)] : {(^~wire42)}) ?
                  (reg47 ?
                      ((-wire40) ?
                          (~&(8'hbd)) : (~|reg46)) : $signed(wire39[(2'h2):(1'h1)])) : (^~(reg51 >= (-(8'hb7))))));
            end
          else
            begin
              reg52 <= $unsigned({$signed($signed($unsigned(reg51))), reg46});
              reg53 <= (+$unsigned($signed(wire42[(1'h1):(1'h1)])));
              reg54 <= $signed(reg46[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg45 <= (reg52 ?
              ((+((&reg51) ? $signed(wire42) : reg46)) ?
                  (wire42[(3'h6):(2'h3)] <<< wire41[(3'h7):(3'h7)]) : ((~(~^reg47)) | wire43[(3'h5):(1'h1)])) : wire41[(3'h7):(3'h5)]);
        end
      reg55 <= (|$unsigned($unsigned(((8'hbe) >>> $unsigned(wire39)))));
    end
  always
    @(posedge clk) begin
      reg56 <= (wire40 ?
          reg54[(4'hc):(3'h7)] : (!((!reg45) ^ ($unsigned(reg54) + $unsigned(wire42)))));
      reg57 <= $signed($unsigned(reg54));
      reg58 <= $signed($signed($signed(reg47)));
      reg59 <= (~|{$unsigned(reg44[(1'h1):(1'h1)]),
          $unsigned(reg46[(1'h0):(1'h0)])});
      reg60 <= wire40[(2'h3):(2'h2)];
    end
  assign wire61 = (^{(!((reg52 ? reg52 : reg52) - (reg54 >>> (8'hb0)))),
                      reg46});
  assign wire62 = (^(!($signed($signed(reg50)) >>> ((reg58 == reg45) ?
                      (reg56 - reg59) : $signed((8'hb3))))));
  always
    @(posedge clk) begin
      if ($signed((~^$signed((^~(reg48 ? reg60 : reg52))))))
        begin
          reg63 <= ((|(reg56 * $unsigned($unsigned(reg51)))) >> $signed((({reg48,
                  reg48} || {reg60}) ?
              $unsigned((reg57 ? reg60 : reg59)) : $signed(reg60))));
        end
      else
        begin
          reg63 <= (|((^~reg54[(3'h7):(2'h3)]) ?
              reg55 : {$signed($unsigned(wire42))}));
          reg64 <= wire43[(1'h1):(1'h1)];
          reg65 <= (((~&$unsigned({reg54})) ?
              ((reg49[(4'h8):(2'h3)] ?
                      ((8'haf) ? reg59 : (8'ha6)) : {(8'hbd)}) ?
                  ((~^reg57) & $unsigned((8'ha3))) : reg50[(4'hc):(3'h5)]) : {reg60[(5'h14):(4'h9)]}) ~^ reg60);
          if (reg59)
            begin
              reg66 <= $signed($signed($unsigned({wire39[(1'h0):(1'h0)]})));
              reg67 <= {$signed(wire43)};
              reg68 <= reg51;
              reg69 <= $signed($unsigned(reg46));
              reg70 <= (reg48 * reg57);
            end
          else
            begin
              reg66 <= reg50[(5'h15):(5'h10)];
              reg67 <= (^$unsigned((reg67 ?
                  reg66 : (reg50[(3'h6):(1'h0)] | (+reg60)))));
              reg68 <= ((reg65[(4'ha):(3'h5)] >= reg65[(1'h1):(1'h1)]) ?
                  {reg57} : reg57[(4'hc):(4'h9)]);
              reg69 <= $signed($signed($unsigned(reg68[(2'h2):(1'h0)])));
            end
          reg71 <= (^reg70);
        end
      reg72 <= (!{(reg57[(1'h1):(1'h1)] ?
              $signed((reg69 & reg56)) : (^reg54[(3'h7):(3'h5)])),
          (wire41 < ((+reg67) <<< (~|reg47)))});
    end
  assign wire73 = reg58;
  assign wire74 = $unsigned($unsigned((|(&$unsigned(reg49)))));
  always
    @(posedge clk) begin
      if ((reg65[(3'h7):(3'h7)] ?
          $unsigned(reg66) : {({$signed(reg53), ((8'ha0) < (8'had))} ?
                  ($signed(reg67) != $unsigned(reg64)) : $signed($unsigned(wire73))),
              reg55}))
        begin
          if (wire74[(3'h4):(1'h1)])
            begin
              reg75 <= ((8'ha3) ?
                  (!(~|(&reg45[(4'hc):(3'h4)]))) : $signed(reg55));
              reg76 <= $unsigned($signed(wire39));
              reg77 <= reg49;
              reg78 <= $signed($signed(((~&$unsigned(wire41)) > ({reg51} ?
                  (reg51 ? wire74 : wire39) : reg58))));
              reg79 <= reg64[(4'h9):(4'h8)];
            end
          else
            begin
              reg75 <= {(|(((reg69 ?
                      reg65 : reg67) ~^ (^~reg51)) <= reg55[(3'h4):(3'h4)])),
                  (~^reg72)};
              reg76 <= ($unsigned(reg58) ?
                  $signed((reg59 > {$signed(reg72),
                      (8'h9c)})) : $signed((reg50[(2'h3):(2'h3)] != $unsigned(reg77[(4'hf):(4'he)]))));
              reg77 <= wire73;
              reg78 <= (reg57[(4'h8):(2'h2)] ~^ ((~&reg47) & reg67[(4'hb):(3'h4)]));
            end
          reg80 <= reg64;
          reg81 <= $unsigned(reg66[(4'h8):(1'h0)]);
          reg82 <= ($signed((wire40 - $unsigned(wire62))) << $unsigned({reg50,
              reg44}));
          reg83 <= $unsigned((reg49 ? (8'haf) : reg77));
        end
      else
        begin
          reg75 <= reg67;
          reg76 <= reg75;
        end
      if ((8'hb4))
        begin
          reg84 <= reg46;
        end
      else
        begin
          reg84 <= $unsigned(((wire73[(3'h4):(2'h3)] ^ $unsigned($unsigned(wire39))) | $unsigned((|reg63))));
          reg85 <= reg68;
          reg86 <= {reg76,
              (&((((8'hb8) <<< reg76) ? (reg50 ^ reg54) : $unsigned(reg68)) ?
                  ({wire74} ?
                      reg82[(1'h0):(1'h0)] : $signed((8'ha4))) : ({reg70,
                      wire61} <<< reg67[(4'ha):(3'h6)])))};
        end
      reg87 <= ({(^$unsigned(((8'hbe) >= wire40))), reg83[(5'h11):(3'h6)]} ?
          ($signed(reg71) ?
              (!$unsigned(reg52[(1'h0):(1'h0)])) : (((reg66 | reg48) && (reg83 ?
                  reg56 : reg47)) >= (reg67[(4'h8):(2'h2)] ?
                  ((8'hab) ?
                      reg51 : reg58) : ((8'haa) & reg57)))) : $signed($unsigned($signed((reg69 ~^ reg51)))));
      reg88 <= (~|reg60);
    end
  always
    @(posedge clk) begin
      reg89 <= $signed($unsigned(wire74));
      reg90 <= reg65[(3'h4):(2'h3)];
      if (reg84)
        begin
          reg91 <= reg57[(1'h1):(1'h1)];
          reg92 <= ((({{reg50},
                  reg70[(3'h4):(2'h3)]} && (~|$unsigned(reg55))) != (($signed(wire43) ?
                      {(8'hb9), (8'h9f)} : reg71[(3'h7):(3'h4)]) ?
                  {(reg81 ? reg51 : reg70)} : (reg82 ?
                      {reg54, reg59} : $unsigned(reg70)))) ?
              $signed(((reg51 ? $unsigned(reg51) : $signed(reg67)) || ((reg71 ?
                      reg60 : reg44) ?
                  wire62[(3'h5):(3'h5)] : reg86))) : ((~(!$signed(reg77))) == ($signed((8'hb6)) > $signed($unsigned(reg56)))));
          reg93 <= ($signed($signed(($unsigned(wire61) ~^ (&reg80)))) ?
              $unsigned(reg59[(3'h5):(1'h0)]) : (~reg92));
        end
      else
        begin
          if (({$signed($signed(reg53)),
              $unsigned(((reg49 ?
                  reg46 : reg60) < reg55[(5'h10):(5'h10)]))} <<< (^reg63[(5'h10):(4'hc)])))
            begin
              reg91 <= reg51[(2'h2):(1'h0)];
            end
          else
            begin
              reg91 <= ((+(~^$signed(wire43[(1'h0):(1'h0)]))) > $signed($signed({((8'hb3) ?
                      reg55 : reg54)})));
              reg92 <= reg46;
            end
          reg93 <= (8'h9d);
          reg94 <= reg79[(1'h1):(1'h0)];
          reg95 <= $unsigned({(reg83[(3'h7):(2'h3)] ?
                  $unsigned($unsigned(reg55)) : (-{wire41, wire42})),
              (((wire73 ? reg53 : reg55) <<< (~reg66)) ?
                  ((reg46 || reg48) ? wire42 : (|reg69)) : ((8'ha9) ?
                      reg54[(4'hf):(4'h8)] : reg84[(3'h5):(3'h5)]))});
        end
      reg96 <= (|($signed(reg65[(2'h3):(2'h3)]) ?
          reg66 : (($signed(reg83) ? {wire43} : $signed(reg44)) ?
              (^~(reg87 ~^ (8'hab))) : ((|reg92) - reg48))));
    end
  assign wire97 = (-(($signed((reg84 ? wire42 : reg92)) ?
                          (~{reg47}) : $signed(reg65[(4'hb):(3'h7)])) ?
                      (&$signed((reg80 ?
                          reg51 : reg83))) : ($signed((reg60 << reg92)) ?
                          (-(^~reg78)) : ($unsigned(reg87) - $signed(reg85)))));
  assign wire98 = ($unsigned(reg65[(4'hb):(3'h4)]) < $unsigned((reg79 ^~ {reg81})));
  always
    @(posedge clk) begin
      if (reg67)
        begin
          if ($unsigned($unsigned((reg75 && (~^reg91[(2'h3):(1'h0)])))))
            begin
              reg99 <= (reg57[(1'h0):(1'h0)] ?
                  ($signed($signed((reg45 >> (7'h41)))) ?
                      $signed((reg59[(2'h2):(1'h0)] ?
                          reg68[(2'h3):(1'h0)] : $signed((8'hbd)))) : (reg78[(4'hd):(4'h8)] && $unsigned(((8'ha2) <= reg46)))) : (8'ha1));
              reg100 <= ((reg90[(3'h5):(3'h5)] ?
                      (($unsigned(reg87) ?
                          wire98 : $signed(reg89)) >> (8'hbb)) : (|(reg45[(3'h4):(2'h2)] ?
                          (-reg63) : (wire40 << reg96)))) ?
                  reg90[(1'h1):(1'h0)] : (reg89 - (~^(~$unsigned(reg66)))));
              reg101 <= (8'ha5);
              reg102 <= ((reg101[(4'h8):(3'h4)] ?
                      (($signed(reg71) ?
                          {(8'had),
                              reg49} : reg82) < {$signed(reg47)}) : ($unsigned($unsigned(reg57)) + reg89)) ?
                  reg56 : ((((reg77 << wire73) ?
                      (reg51 ?
                          reg54 : wire74) : $unsigned(reg76)) ~^ (reg54 < (reg75 ?
                      reg101 : (8'ha8)))) < {$signed($unsigned((8'ha9))),
                      {(wire74 ? reg52 : reg48)}}));
              reg103 <= reg95[(2'h3):(2'h3)];
            end
          else
            begin
              reg99 <= ($signed((wire97[(4'ha):(2'h2)] ?
                  $signed((reg77 ?
                      reg51 : reg45)) : (^$signed((8'ha4))))) != {$signed($signed($signed((8'ha7))))});
              reg100 <= (reg46 ?
                  ($signed(((reg101 <<< reg67) < (-reg86))) ?
                      ((8'hbf) * ((^wire74) ?
                          reg56[(3'h7):(3'h5)] : (&reg60))) : reg55[(3'h5):(3'h5)]) : ((reg66 ?
                          ((wire61 - reg82) ?
                              (reg71 * (8'ha0)) : ((8'hba) > reg47)) : $signed((reg71 ?
                              reg91 : reg87))) ?
                      reg100 : ((~(^~reg47)) >> reg90)));
              reg101 <= (&(($signed((~reg85)) ^ (^~(~|(8'ha8)))) > reg71[(4'hf):(4'hc)]));
            end
          reg104 <= {reg72};
          reg105 <= reg49[(3'h6):(2'h3)];
          if ($signed(reg104[(2'h3):(2'h3)]))
            begin
              reg106 <= reg103[(1'h0):(1'h0)];
            end
          else
            begin
              reg106 <= (|reg48);
              reg107 <= wire43;
              reg108 <= reg69;
              reg109 <= reg91[(3'h6):(1'h0)];
            end
          reg110 <= (|(~|$unsigned(({reg89} ?
              $signed(reg56) : $signed(reg109)))));
        end
      else
        begin
          reg99 <= reg87[(4'hd):(4'hc)];
          if ($signed(($unsigned((^~(~|reg79))) ?
              (reg103[(4'hb):(3'h6)] < (reg78 ?
                  reg51 : reg80[(2'h3):(2'h2)])) : reg88)))
            begin
              reg100 <= (8'had);
              reg101 <= ((~^$signed(reg80[(3'h7):(1'h1)])) & (|(~&reg92[(3'h5):(1'h1)])));
              reg102 <= (~^(~&(($unsigned(reg55) & reg78) ?
                  $signed((reg70 ? wire62 : reg102)) : ($unsigned(reg89) ?
                      $unsigned(reg77) : (reg70 ? reg64 : reg91)))));
              reg103 <= $unsigned((~$signed(reg83[(3'h7):(2'h3)])));
              reg104 <= $signed({($signed({reg72}) && {$unsigned(wire42),
                      {wire42}})});
            end
          else
            begin
              reg100 <= ((reg44[(2'h2):(1'h0)] >> {((~^reg93) ^ {(8'hac)})}) - (wire39 & ($unsigned((~&(8'hae))) ?
                  (~^(reg72 ? reg81 : wire39)) : {$unsigned(reg64)})));
              reg101 <= (~{$unsigned(reg81),
                  $unsigned($unsigned($unsigned(reg108)))});
            end
          reg105 <= ((((reg83[(4'hb):(1'h0)] ? $unsigned(reg66) : (8'ha5)) ?
                      $unsigned(wire98) : ((-(8'hb4)) <= {(8'hac), reg54})) ?
                  {(&{reg84, (8'hba)}),
                      ((8'hb3) ?
                          $signed(reg64) : (7'h41))} : $unsigned(($signed(reg93) ?
                      reg72[(2'h3):(1'h0)] : $signed(reg85)))) ?
              reg52[(5'h11):(3'h6)] : (({(-wire62),
                  {wire43}} >>> reg54[(5'h12):(4'hf)]) << (!(~&reg99))));
        end
      reg111 <= (8'hb8);
      reg112 <= (8'h9f);
    end
  assign wire113 = reg90[(4'h8):(3'h6)];
  assign wire114 = (~($unsigned(reg63) ?
                       ((!((8'hb5) ^~ reg69)) ?
                           {{(8'hac)}} : ($unsigned((8'ha9)) ^~ reg63[(3'h6):(3'h5)])) : (((reg100 ?
                               reg93 : reg53) | $signed((8'hb5))) ?
                           (^$unsigned(reg44)) : ((reg67 ?
                               reg66 : reg79) || (reg50 ? reg102 : reg66)))));
endmodule

module module204  (y, clk, wire209, wire208, wire207, wire206, wire205);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire209;
  input wire [(3'h7):(1'h0)] wire208;
  input wire signed [(3'h7):(1'h0)] wire207;
  input wire [(5'h15):(1'h0)] wire206;
  input wire [(5'h15):(1'h0)] wire205;
  wire [(4'ha):(1'h0)] wire217;
  wire signed [(3'h7):(1'h0)] wire216;
  wire signed [(3'h6):(1'h0)] wire215;
  wire signed [(4'he):(1'h0)] wire214;
  wire signed [(4'hf):(1'h0)] wire211;
  wire [(4'hd):(1'h0)] wire210;
  reg signed [(3'h4):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg212 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire211,
                 wire210,
                 reg213,
                 reg212,
                 (1'h0)};
  assign wire210 = wire208;
  assign wire211 = wire210[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg212 <= (wire208[(3'h5):(2'h2)] ?
          {wire211[(2'h2):(1'h1)],
              $signed($unsigned((wire205 - wire205)))} : wire206[(4'he):(3'h6)]);
      reg213 <= (wire211[(4'hf):(4'he)] ?
          {$signed({wire205, (~|wire207)}),
              (($signed(wire210) << (reg212 ? reg212 : wire210)) ?
                  wire205[(2'h2):(1'h1)] : {(wire211 ? (8'hbe) : reg212),
                      (~|(8'ha9))})} : $unsigned((~|$unsigned(wire209))));
    end
  assign wire214 = ($unsigned({$signed((reg213 || reg212))}) && $unsigned($signed((~&(wire207 << reg212)))));
  assign wire215 = ({$signed(({reg213} ? $signed((8'hb6)) : wire208)),
                           ({wire209[(3'h6):(3'h6)]} ?
                               ($signed(reg212) != ((7'h43) <<< wire206)) : (~^$unsigned(wire209)))} ?
                       $signed((^((wire205 ?
                           (8'ha8) : wire205) ^ (8'ha2)))) : {(|{wire210[(4'hb):(4'ha)]}),
                           $signed((!(8'haa)))});
  assign wire216 = (!($unsigned($signed((wire210 | (8'hb4)))) ?
                       (|wire205[(4'hc):(3'h6)]) : (wire211[(4'hd):(4'hb)] > $signed($signed(wire214)))));
  assign wire217 = (+wire205);
endmodule

module module180
#(parameter param201 = (^((|(^~((8'ha1) ? (8'hb3) : (8'h9f)))) - (-(((8'h9f) * (8'ha5)) ? ((8'hae) > (8'hbf)) : (~&(7'h44)))))))
(y, clk, wire184, wire183, wire182, wire181);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire184;
  input wire [(5'h15):(1'h0)] wire183;
  input wire signed [(2'h2):(1'h0)] wire182;
  input wire signed [(4'hc):(1'h0)] wire181;
  wire signed [(4'hb):(1'h0)] wire200;
  wire signed [(4'h8):(1'h0)] wire199;
  wire signed [(2'h2):(1'h0)] wire198;
  wire signed [(2'h3):(1'h0)] wire197;
  wire [(4'hd):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire195;
  wire signed [(5'h14):(1'h0)] wire194;
  wire signed [(5'h10):(1'h0)] wire193;
  wire signed [(4'h8):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire signed [(4'hc):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire187;
  wire [(2'h2):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire185;
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 (1'h0)};
  assign wire185 = (~^wire184[(3'h5):(2'h2)]);
  assign wire186 = wire185;
  assign wire187 = (^$signed({$unsigned(((8'hab) <<< wire186)),
                       wire186[(1'h1):(1'h1)]}));
  assign wire188 = ((wire182 | wire184) >>> ((wire181 >> wire186) ?
                       wire181[(3'h4):(2'h3)] : wire185[(2'h3):(1'h1)]));
  assign wire189 = (wire186[(2'h2):(1'h1)] == ({$signed(wire184[(2'h2):(2'h2)]),
                           $unsigned(wire185[(5'h10):(3'h5)])} ?
                       $unsigned($unsigned((wire181 || wire186))) : $signed({(!wire182)})));
  assign wire190 = $unsigned($signed(wire185[(3'h7):(3'h4)]));
  assign wire191 = ($signed((wire190 ?
                       $signed(wire186[(1'h1):(1'h1)]) : ({wire186, (7'h40)} ?
                           wire190 : $unsigned(wire185)))) != $unsigned((8'ha9)));
  assign wire192 = $signed({wire189[(1'h1):(1'h0)]});
  assign wire193 = wire182;
  assign wire194 = $unsigned(wire184[(1'h1):(1'h0)]);
  assign wire195 = wire186;
  assign wire196 = ((|$signed((^~(wire183 != (8'hb8))))) ?
                       $unsigned(wire185) : $signed((wire184 ?
                           $signed({wire183}) : wire195[(2'h3):(1'h0)])));
  assign wire197 = wire184;
  assign wire198 = wire187;
  assign wire199 = wire198[(1'h0):(1'h0)];
  assign wire200 = ((wire188[(2'h3):(1'h0)] ?
                       wire198[(1'h1):(1'h1)] : $unsigned($unsigned(wire183))) << (+wire188));
endmodule
