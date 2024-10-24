module top
#(parameter param195 = {(~^(~(((8'hae) ? (8'hb2) : (8'hb1)) >> ((8'ha9) <<< (7'h44))))), (~&(({(8'ha0)} & ((7'h40) ? (8'hb3) : (7'h44))) ? ((~^(8'hb1)) & {(8'h9f)}) : (((8'hbd) ? (8'hb5) : (8'hbd)) ? (-(8'hbc)) : (!(8'hab)))))}, 
parameter param196 = (param195 ? param195 : param195))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire194;
  wire [(2'h2):(1'h0)] wire192;
  wire signed [(4'he):(1'h0)] wire191;
  wire [(2'h2):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire157;
  wire [(5'h14):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire152;
  wire signed [(4'hf):(1'h0)] wire154;
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  assign y = {wire194,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire174,
                 wire173,
                 wire172,
                 wire157,
                 wire156,
                 wire147,
                 wire124,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 wire152,
                 wire154,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg149,
                 reg150,
                 reg151,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 (1'h0)};
  assign wire4 = ($unsigned((8'hb1)) - (~(^~(|((8'h9f) ? wire3 : wire2)))));
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      if ((((~^((wire1 ? wire5 : wire2) ?
                  (wire4 == wire0) : wire3[(3'h5):(2'h3)])) ?
              $signed(wire0) : (wire2[(2'h3):(2'h2)] ?
                  (wire4[(1'h0):(1'h0)] ?
                      (wire0 ? wire1 : wire3) : ((7'h42) ?
                          (8'hae) : wire0)) : wire3[(1'h0):(1'h0)])) ?
          $unsigned($signed($unsigned((8'hba)))) : $unsigned((~|$signed($signed(wire2))))))
        begin
          if (($signed($signed((&{wire3}))) > $signed({wire1,
              {(~^(8'hb5)), wire2}})))
            begin
              reg6 <= $unsigned((^~$signed(wire1)));
              reg7 <= (~^{((wire2 - $unsigned(wire0)) | (-(|wire3)))});
              reg8 <= $signed($unsigned(wire5[(1'h0):(1'h0)]));
            end
          else
            begin
              reg6 <= (wire5[(1'h0):(1'h0)] ?
                  {wire2} : ((^~wire3[(3'h6):(3'h5)]) ?
                      {($signed(wire4) ?
                              reg7 : wire2[(3'h6):(1'h1)])} : ($signed(reg6) ?
                          wire5 : wire2)));
              reg7 <= (8'hb1);
              reg8 <= $signed($signed((!$unsigned((reg8 <<< (8'hb6))))));
            end
          reg9 <= ($unsigned($unsigned(reg7[(2'h2):(2'h2)])) || $signed($signed(wire1)));
          reg10 <= {$unsigned(reg7), $signed(wire1[(3'h6):(3'h6)])};
          reg11 <= wire2;
          if (reg8)
            begin
              reg12 <= (reg11 * $signed($unsigned(wire3[(3'h4):(1'h0)])));
              reg13 <= reg8[(4'h8):(3'h4)];
            end
          else
            begin
              reg12 <= $signed((&$unsigned({(reg8 ? (8'ha3) : reg8),
                  (reg8 ? reg10 : reg11)})));
            end
        end
      else
        begin
          reg6 <= $unsigned((~&(^(8'hb7))));
          reg7 <= $signed(reg7);
        end
    end
  assign wire14 = $signed(wire0);
  assign wire15 = (^wire14[(1'h0):(1'h0)]);
  assign wire16 = $unsigned(($unsigned($signed((wire3 ?
                      wire15 : wire15))) && $unsigned(wire0[(4'h9):(4'h9)])));
  module17 #() modinst125 (wire124, clk, reg13, wire2, wire0, wire4, wire1);
  module126 #() modinst148 (wire147, clk, reg9, reg6, wire0, wire1, wire5);
  always
    @(posedge clk) begin
      reg149 <= (((((reg12 ? reg11 : wire4) ? (!reg8) : (^reg7)) ?
              {(wire3 | wire15),
                  (&reg7)} : wire14[(2'h3):(2'h3)]) && {{reg6[(3'h5):(1'h0)]}}) ?
          reg7 : wire3);
      reg150 <= $unsigned((($signed({wire16}) ?
          {{reg11, wire124},
              wire5[(2'h2):(1'h0)]} : $signed($unsigned(reg13))) <= ((reg12 >>> reg8) ?
          {$signed(reg9), reg6[(3'h4):(1'h1)]} : $signed($signed((8'hb6))))));
      reg151 <= ((~|(|$unsigned($unsigned(wire15)))) == ((!(~|$unsigned(wire5))) * $unsigned($signed($unsigned(wire5)))));
    end
  module28 #() modinst153 (.wire30(wire15), .wire29(wire16), .clk(clk), .wire32(wire3), .wire31(wire1), .wire33(reg6), .y(wire152));
  module126 #() modinst155 (wire154, clk, wire4, wire3, reg6, reg13, wire14);
  assign wire156 = (^~reg151[(3'h5):(2'h3)]);
  module126 #() modinst158 (.wire127(reg7), .wire129(reg10), .y(wire157), .wire131(reg151), .wire130(wire5), .wire128(wire14), .clk(clk));
  always
    @(posedge clk) begin
      reg159 <= $unsigned(((^((reg150 ? wire124 : reg13) ?
          $signed(wire3) : (reg11 >> wire15))) - (~^reg10[(3'h4):(2'h3)])));
      if ($unsigned($unsigned(wire14)))
        begin
          if (($signed({$unsigned($signed(reg12)),
              $signed((wire2 <<< (8'h9c)))}) || ($signed((^reg151[(2'h3):(2'h3)])) ?
              $unsigned(reg150[(4'h9):(3'h4)]) : {wire4[(2'h2):(1'h1)]})))
            begin
              reg160 <= $signed($signed({wire156[(5'h11):(4'h8)]}));
              reg161 <= wire1[(1'h1):(1'h0)];
              reg162 <= wire1[(3'h6):(1'h1)];
            end
          else
            begin
              reg160 <= (~^($signed(wire3[(5'h15):(4'he)]) ~^ ($signed({reg161,
                      reg9}) ?
                  (wire0 & $signed(reg12)) : reg9[(3'h6):(2'h3)])));
              reg161 <= ({((reg6 ? {wire1, reg161} : (+(8'ha5))) ?
                      ((reg9 ?
                          wire124 : reg12) != (~&reg11)) : (-$signed(wire5)))} && (!$signed(((reg150 ?
                      wire15 : reg160) ?
                  (+reg162) : (wire16 > reg7)))));
            end
          reg163 <= $unsigned(((~|{reg10}) ?
              reg162[(3'h6):(3'h5)] : $unsigned(reg151)));
        end
      else
        begin
          reg160 <= (&(^wire15[(4'h8):(2'h2)]));
          if (((wire124 | ((~^$unsigned(wire156)) == $signed(reg162))) ^~ reg161[(3'h6):(2'h2)]))
            begin
              reg161 <= $signed(reg149);
              reg162 <= {(((^~(8'haf)) ?
                      wire15[(5'h12):(1'h0)] : ((reg10 ^ wire152) ?
                          wire157[(2'h2):(2'h2)] : {reg9})) <<< ({$unsigned(reg150)} ?
                      $signed($signed(reg11)) : reg160))};
              reg163 <= $unsigned((reg150 ^~ $signed(wire3[(4'hb):(3'h4)])));
            end
          else
            begin
              reg161 <= reg10[(4'hb):(2'h2)];
            end
          reg164 <= $unsigned((~^{$unsigned((~&(8'hbb)))}));
          if ($unsigned($signed(reg12[(4'hd):(3'h5)])))
            begin
              reg165 <= reg164[(3'h7):(3'h6)];
              reg166 <= (+$signed((!$unsigned($unsigned(wire2)))));
              reg167 <= $unsigned($unsigned($signed(wire14[(5'h12):(4'h9)])));
              reg168 <= ((^~{$signed($unsigned(wire124)),
                  wire156[(3'h4):(1'h0)]}) ^ ($signed($unsigned($signed((7'h42)))) ?
                  (wire1 ?
                      reg151[(3'h6):(2'h2)] : (reg165 == (+reg151))) : $signed((8'hb8))));
              reg169 <= {($unsigned(reg12) ?
                      {((~^reg160) ? (+(8'h9e)) : $unsigned(reg149)),
                          ((wire124 ? reg161 : wire154) < (8'hbe))} : (8'ha1))};
            end
          else
            begin
              reg165 <= (reg160 >= $unsigned(wire4));
              reg166 <= wire1[(4'hf):(2'h2)];
              reg167 <= wire4[(4'he):(4'h8)];
            end
          reg170 <= (~&$signed(reg161));
        end
      reg171 <= {({({wire5, (8'hbf)} ? (reg8 + reg161) : (reg151 >>> reg10)),
              (reg9 * ((8'hb4) < reg163))} >>> ($signed($signed(wire2)) ^~ $unsigned(reg164))),
          reg160[(4'hb):(1'h0)]};
    end
  assign wire172 = {(($unsigned((~&reg170)) >>> (reg10[(4'hc):(1'h0)] >>> $signed(wire5))) == (+(^~(wire5 ?
                           wire152 : wire147))))};
  assign wire173 = {{(reg9 ?
                               reg11[(5'h12):(5'h10)] : ($signed(wire15) && (wire154 ?
                                   wire3 : reg159))),
                           (wire156 ?
                               $signed({wire156}) : ((reg10 > (8'ha5)) ?
                                   (+reg151) : reg8[(4'hc):(2'h3)]))}};
  assign wire174 = $unsigned(wire16);
  always
    @(posedge clk) begin
      if (reg167)
        begin
          if ($signed(reg160))
            begin
              reg175 <= $signed($signed((&$signed((reg164 ?
                  (8'ha0) : wire147)))));
              reg176 <= {reg151,
                  $signed(((reg175 ? (wire15 * wire157) : $unsigned(reg169)) ?
                      ($unsigned(wire124) != $signed(reg170)) : reg163[(3'h6):(1'h1)]))};
            end
          else
            begin
              reg175 <= $unsigned($signed((8'hab)));
              reg176 <= $unsigned((8'hb0));
              reg177 <= {((reg165 ?
                          $unsigned(reg176) : (reg13 >>> (reg7 << reg6))) ?
                      $signed(reg175[(1'h0):(1'h0)]) : $signed($unsigned({reg163,
                          reg168}))),
                  {(^((reg166 & wire0) ? reg166 : (wire156 > wire152)))}};
              reg178 <= $signed((-reg10[(1'h1):(1'h1)]));
            end
          reg179 <= $unsigned($signed((&wire4)));
        end
      else
        begin
          if (wire147[(2'h3):(2'h3)])
            begin
              reg175 <= reg175;
              reg176 <= (({$unsigned((&wire172)),
                      ($unsigned(reg167) && {(8'hb8)})} <= (-((wire0 ?
                          reg164 : wire4) ?
                      (wire1 >= reg176) : (&wire2)))) ?
                  $signed($signed(reg179)) : $unsigned(((((8'ha7) != reg10) >>> (|reg9)) & wire157)));
              reg177 <= (!$unsigned($signed($unsigned($signed(reg6)))));
              reg178 <= {((!reg165) ?
                      ($unsigned(reg13) | wire147) : $signed(((reg10 ^ reg161) ?
                          {reg162} : $signed(reg10)))),
                  $unsigned($signed($unsigned($unsigned(wire147))))};
            end
          else
            begin
              reg175 <= (($signed(((|(8'hb1)) ? reg149 : (~|wire147))) ?
                      $signed(reg160) : (((|reg160) ?
                              (reg166 ?
                                  reg162 : reg165) : (wire156 <<< reg170)) ?
                          (8'ha3) : (~&wire156[(3'h7):(3'h5)]))) ?
                  {((^~reg168[(2'h2):(2'h2)]) ^~ reg7)} : (((~|(reg150 * reg162)) <<< $unsigned($unsigned(reg162))) ?
                      $signed($unsigned(reg164[(3'h7):(3'h4)])) : ((-$signed(reg6)) ?
                          reg169 : ((reg149 <= (7'h44)) > $signed(reg8)))));
              reg176 <= (($unsigned((&reg163[(3'h7):(3'h7)])) | ($unsigned(reg149[(4'h8):(1'h1)]) ^ $unsigned($signed((8'hb5))))) >> (reg7[(3'h4):(2'h3)] ~^ reg164[(4'h8):(3'h5)]));
              reg177 <= ((~^$signed($signed($unsigned(wire0)))) ?
                  (|$unsigned((|{reg151}))) : ($unsigned(((reg168 << (8'hb3)) ?
                          $signed(reg11) : reg163)) ?
                      reg175[(3'h5):(2'h2)] : (((wire2 < wire15) ?
                          {(7'h43), wire174} : (reg164 ?
                              wire2 : wire16)) >>> $unsigned(reg161[(5'h14):(4'h8)]))));
              reg178 <= (reg8 >= $unsigned(((reg167 ^~ wire157[(4'hd):(4'hb)]) ?
                  (wire124 ?
                      (reg6 ?
                          reg8 : (8'h9d)) : $unsigned(reg166)) : reg160[(5'h13):(3'h5)])));
            end
          reg179 <= $unsigned((reg163[(3'h7):(3'h5)] ~^ $signed($signed($signed(wire3)))));
        end
      if (reg163)
        begin
          if (reg165[(2'h2):(1'h0)])
            begin
              reg180 <= ($unsigned({(|$signed(reg171))}) ?
                  {wire157[(4'he):(1'h1)],
                      $unsigned($unsigned($unsigned(reg9)))} : (7'h41));
              reg181 <= $signed({(+wire4)});
            end
          else
            begin
              reg180 <= (reg181[(2'h2):(2'h2)] ?
                  $signed($unsigned(reg12[(4'hc):(3'h6)])) : {$signed(reg179[(2'h2):(1'h1)]),
                      (~|wire152)});
            end
        end
      else
        begin
          reg180 <= $unsigned(wire3);
          reg181 <= ($unsigned({($unsigned(wire174) | $signed(wire14))}) ?
              reg180[(1'h0):(1'h0)] : {($unsigned((!wire157)) < $signed($unsigned(wire0))),
                  wire154});
        end
      if ((~^reg171[(1'h0):(1'h0)]))
        begin
          if ((((|((-reg163) ? (~|wire173) : $unsigned(reg162))) ?
              $unsigned($unsigned((reg170 ? wire157 : reg162))) : (((-reg178) ?
                  (^~reg151) : (-reg179)) >= (7'h42))) <<< wire147[(1'h0):(1'h0)]))
            begin
              reg182 <= $unsigned(reg168);
              reg183 <= ((^(({reg180} || (^~wire147)) ?
                  {{wire147}} : reg180[(1'h1):(1'h1)])) ^~ reg170[(4'he):(4'h9)]);
              reg184 <= (+$unsigned(($signed($signed(reg164)) - wire172[(4'hc):(3'h7)])));
              reg185 <= reg168[(3'h4):(2'h2)];
            end
          else
            begin
              reg182 <= (8'hb2);
              reg183 <= $signed((reg180 || reg8));
              reg184 <= (8'hb3);
            end
          reg186 <= (!$signed((^~reg9[(4'hb):(2'h3)])));
          reg187 <= (($signed(wire1) || ($unsigned((^~reg178)) == (reg163 ?
                  reg180[(1'h0):(1'h0)] : $unsigned(wire172)))) ?
              ($signed($signed((~reg175))) ?
                  $signed($signed($unsigned(reg164))) : wire4) : (reg149 ?
                  reg185[(1'h0):(1'h0)] : (((&reg161) > $signed((8'ha0))) | ((~&reg166) ?
                      $unsigned(reg182) : (+reg184)))));
        end
      else
        begin
          if ($unsigned(wire16[(4'ha):(4'h8)]))
            begin
              reg182 <= reg162[(4'hd):(3'h7)];
            end
          else
            begin
              reg182 <= wire1[(4'ha):(2'h2)];
              reg183 <= reg185;
            end
          reg184 <= reg180[(1'h1):(1'h0)];
        end
      reg188 <= $signed(((&{reg187, (wire2 >> reg167)}) ? (8'ha9) : reg171));
    end
  assign wire189 = $unsigned(reg150[(4'hb):(2'h3)]);
  assign wire190 = (((!($signed(reg163) - $signed(reg10))) ?
                       {((wire5 ^~ reg187) >> wire173[(4'h9):(1'h0)]),
                           wire173} : {reg165,
                           (+(reg182 || reg170))}) ^ {$unsigned($signed((wire157 == wire124)))});
  assign wire191 = (-$signed(($unsigned(((8'hac) ? reg160 : reg186)) ?
                       ($signed((8'h9f)) ?
                           (wire154 != reg183) : $unsigned(reg159)) : $signed((~|reg180)))));
  module47 #() modinst193 (.wire50(reg9), .wire51(reg183), .wire48(reg175), .wire49(reg159), .clk(clk), .wire52(reg163), .y(wire192));
  assign wire194 = reg150[(4'h9):(3'h6)];
endmodule

module module126
#(parameter param145 = ((^~((((8'hbe) ~^ (8'hbb)) ? ((8'ha2) != (7'h44)) : ((8'hbe) ^ (8'hac))) ~^ (((8'ha8) >> (8'h9f)) * {(8'hb7), (8'ha2)}))) >> (&(({(8'hb1)} ? ((7'h41) ? (8'hb0) : (8'ha7)) : ((8'hb4) ? (8'ha3) : (8'hb8))) ? (^~((8'ha6) >= (8'h9d))) : (&(8'ha1))))), 
parameter param146 = (|(((param145 && (param145 ? param145 : param145)) && (param145 | ((8'ha8) ^~ param145))) ? ((7'h40) == param145) : (8'hbf))))
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire131;
  input wire signed [(5'h15):(1'h0)] wire130;
  input wire [(3'h5):(1'h0)] wire129;
  input wire [(4'h9):(1'h0)] wire128;
  input wire [(5'h15):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire133,
                 wire132,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire132 = $unsigned((wire130 ?
                       (~$unsigned((&wire129))) : {$signed($signed(wire129)),
                           ((wire127 <= wire131) + (~&wire131))}));
  assign wire133 = wire128;
  always
    @(posedge clk) begin
      reg134 <= (((~((wire132 || wire132) ?
              wire131 : (wire132 ? wire130 : wire131))) ?
          (+(~|(wire130 ^ wire133))) : wire130[(2'h3):(1'h1)]) >> $signed($signed($signed(wire133[(1'h0):(1'h0)]))));
      reg135 <= $unsigned({wire130});
      if ($unsigned(reg134[(1'h1):(1'h1)]))
        begin
          reg136 <= (~{wire132[(3'h7):(2'h2)]});
          reg137 <= (~^(~|wire127[(4'hd):(3'h5)]));
        end
      else
        begin
          reg136 <= $unsigned({wire133,
              (((wire130 ? wire132 : reg134) ?
                      $unsigned(wire133) : wire133[(2'h2):(1'h1)]) ?
                  wire132[(1'h0):(1'h0)] : (reg136[(1'h0):(1'h0)] ?
                      $signed(wire132) : wire132[(3'h6):(1'h0)]))});
          reg137 <= wire132[(3'h7):(2'h2)];
          if (wire129[(3'h4):(2'h2)])
            begin
              reg138 <= reg134;
              reg139 <= ((~^(-$signed(wire133[(2'h2):(1'h1)]))) | (wire130 >> reg136[(2'h2):(1'h0)]));
              reg140 <= reg138;
            end
          else
            begin
              reg138 <= ((!((!{wire133}) == (!(reg134 ?
                  reg134 : reg136)))) < $unsigned((&$signed($unsigned(wire133)))));
            end
          reg141 <= (((~|$unsigned((wire130 >> reg135))) ?
                  reg134 : $unsigned(((8'had) << (-reg137)))) ?
              wire133[(1'h0):(1'h0)] : reg134);
        end
    end
  assign wire142 = (($unsigned({(wire128 << wire132), wire127[(3'h7):(2'h3)]}) ?
                           (((wire128 ~^ reg140) ?
                                   (wire130 ?
                                       (8'hbc) : reg139) : $unsigned(reg137)) ?
                               ((+reg135) == (reg140 == reg134)) : $unsigned(reg140)) : $signed(((+reg134) ?
                               reg140[(1'h0):(1'h0)] : $signed(wire130)))) ?
                       wire133[(2'h2):(1'h1)] : ((((reg137 ?
                           wire127 : (8'ha3)) ~^ $unsigned(reg136)) >= wire130[(4'h9):(3'h5)]) < (wire128 ?
                           {(reg140 & reg137)} : (^~(8'ha0)))));
  assign wire143 = wire131[(3'h7):(2'h3)];
  assign wire144 = $signed((-(&wire131)));
endmodule

module module17
#(parameter param123 = (&(+((((8'ha3) <= (8'hbc)) ? (~^(8'hb3)) : (^~(8'h9c))) ? {((8'ha1) ? (8'hbe) : (8'ha8)), ((8'ha0) * (8'ha0))} : ((~&(7'h43)) ? ((8'ha3) ? (8'hb8) : (8'ha0)) : (!(8'haf)))))))
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire101;
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire81,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire23,
                 wire24,
                 wire25,
                 wire27,
                 wire41,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire101,
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
                 reg105,
                 reg104,
                 reg103,
                 reg26,
                 (1'h0)};
  assign wire23 = $unsigned(wire22[(4'ha):(1'h1)]);
  assign wire24 = wire23;
  assign wire25 = {$signed({(~(wire22 ? (8'hab) : wire21))})};
  always
    @(posedge clk) begin
      reg26 <= wire25;
    end
  assign wire27 = wire22[(4'h8):(3'h5)];
  module28 #() modinst42 (.wire32(wire27), .wire31(wire23), .clk(clk), .wire29(wire19), .y(wire41), .wire33(wire21), .wire30(wire22));
  assign wire43 = wire27[(4'he):(4'hc)];
  assign wire44 = (!{$signed($signed($unsigned(wire18)))});
  assign wire45 = ((^$signed($signed((wire20 && wire20)))) ?
                      (~^((~&{wire41}) * wire20[(2'h2):(1'h0)])) : wire43);
  assign wire46 = wire23;
  module47 #() modinst82 (wire81, clk, wire45, wire27, wire41, wire43, wire21);
  assign wire83 = wire46;
  assign wire84 = $unsigned(wire27[(4'h9):(2'h2)]);
  assign wire85 = wire24[(4'h9):(2'h3)];
  assign wire86 = ((((~^$signed(wire27)) <= $signed(wire41)) ?
                          (!wire85[(3'h5):(2'h2)]) : (-(wire85[(3'h6):(3'h6)] ?
                              (wire22 + wire81) : wire81))) ?
                      $unsigned(((wire25[(3'h6):(2'h3)] ?
                          {wire83,
                              wire20} : (8'hab)) <= $unsigned((wire22 ~^ wire27)))) : (!(((wire19 ~^ wire22) && reg26[(4'hc):(3'h5)]) ?
                          {(wire43 ?
                                  (8'hbb) : wire84)} : wire45[(1'h0):(1'h0)])));
  assign wire87 = {((~|$signed(wire20[(2'h2):(2'h2)])) ?
                          {$unsigned((wire18 ?
                                  (8'hbb) : wire43))} : wire21[(4'hc):(2'h2)])};
  module88 #() modinst102 (.y(wire101), .wire93(wire18), .wire91(wire43), .clk(clk), .wire92(wire85), .wire89(wire23), .wire90(wire24));
  always
    @(posedge clk) begin
      reg103 <= $signed((~|(reg26 ?
          $signed($unsigned(wire44)) : (^~$signed(wire22)))));
      if ($signed((8'hbe)))
        begin
          if ($unsigned((~|$unsigned((wire83 < ((8'ha1) | wire46))))))
            begin
              reg104 <= $signed($unsigned((({wire43,
                  wire25} >= wire84[(2'h3):(1'h1)]) << $signed((7'h42)))));
              reg105 <= (-((($signed(wire19) ^~ {wire21}) + $signed(wire85)) <= $unsigned((wire43[(4'h8):(2'h2)] ^~ $unsigned(wire24)))));
              reg106 <= {$signed($signed({(7'h40)})),
                  ((~((8'ha4) || (reg26 ?
                      (8'hb8) : (8'ha2)))) == (^~wire86[(2'h3):(1'h0)]))};
              reg107 <= ((~wire83) | (reg105 != wire25[(2'h2):(2'h2)]));
              reg108 <= wire46;
            end
          else
            begin
              reg104 <= $unsigned($signed($signed($unsigned((-wire18)))));
              reg105 <= (($signed($signed((8'hb2))) ?
                      reg26[(1'h1):(1'h1)] : (wire41[(4'hd):(3'h4)] ?
                          wire20 : $signed(wire86))) ?
                  (^$signed((^~$unsigned(wire18)))) : $unsigned($unsigned(reg107)));
              reg106 <= ($unsigned(wire19) ?
                  ((({reg107} ? (wire83 ~^ wire81) : $signed(wire22)) ?
                          $unsigned(wire86) : ((reg107 << wire20) ?
                              (-(8'hb4)) : $unsigned(wire27))) ?
                      {(-(wire44 ? wire85 : wire46)),
                          ($unsigned(wire27) <<< wire27[(4'hd):(3'h4)])} : (7'h44)) : wire86);
              reg107 <= wire19[(3'h4):(2'h2)];
            end
        end
      else
        begin
          if ($signed(($signed(wire24[(1'h1):(1'h0)]) ?
              ((!$signed(wire84)) ?
                  ($unsigned((8'ha2)) > ((8'h9c) >> reg26)) : $signed((wire41 ?
                      wire20 : wire84))) : (+{{wire101}, wire18}))))
            begin
              reg104 <= $unsigned(wire25);
              reg105 <= $signed({$unsigned($signed($signed(wire45))), wire19});
              reg106 <= wire43[(4'he):(2'h3)];
              reg107 <= wire18[(3'h6):(3'h6)];
            end
          else
            begin
              reg104 <= ($signed(((~&wire21) ?
                      (^~(8'ha5)) : (^(wire44 ? wire84 : (7'h43))))) ?
                  reg105[(2'h3):(2'h3)] : (+wire24));
              reg105 <= wire46;
              reg106 <= wire86;
              reg107 <= ({{$signed(wire46)},
                  ((^~((8'hb1) ?
                      reg105 : wire83)) >> wire18)} > (($unsigned((!(8'ha4))) ?
                      {{wire27}} : (wire101[(3'h5):(1'h0)] ?
                          (^~wire41) : wire20)) ?
                  {wire87[(2'h2):(2'h2)]} : $signed(wire21)));
              reg108 <= $unsigned(wire23[(4'h9):(2'h3)]);
            end
          reg109 <= wire41;
          reg110 <= (~^$unsigned((wire20[(4'h8):(2'h2)] ?
              ({reg104, wire27} ?
                  (|wire44) : (wire101 ?
                      reg107 : wire43)) : reg104[(3'h5):(2'h3)])));
          if (wire45[(5'h10):(4'he)])
            begin
              reg111 <= reg103[(3'h5):(1'h0)];
              reg112 <= reg26;
            end
          else
            begin
              reg111 <= (&(wire84[(3'h6):(2'h2)] ?
                  reg104[(3'h5):(2'h3)] : {(~^(wire81 ? reg106 : reg105))}));
              reg112 <= (+($signed($unsigned($signed(reg108))) ^~ {(~^(^~(7'h44)))}));
              reg113 <= (^~(wire21[(2'h3):(2'h2)] ?
                  (($unsigned(wire101) ? wire81 : wire23) ?
                      reg111 : {(|wire85),
                          reg103}) : $unsigned((wire23[(4'hb):(4'h9)] ?
                      $unsigned(wire85) : (8'ha1)))));
            end
          reg114 <= ({$signed($unsigned(reg105[(3'h5):(2'h3)]))} ?
              (($signed((8'hb0)) ?
                      ($signed(wire23) ?
                          (&wire41) : (reg103 - wire19)) : ($signed(reg110) ?
                          wire83[(2'h2):(1'h0)] : {wire81, wire81})) ?
                  (~^reg105[(3'h4):(1'h0)]) : reg104) : (((+wire44) ?
                      {(wire44 ? wire46 : reg106)} : (reg106 ?
                          (^~reg108) : (~&(8'hab)))) ?
                  $unsigned($signed((wire41 ~^ wire25))) : (((wire45 ?
                              wire81 : wire41) ?
                          $unsigned((8'hb8)) : (^~wire18)) ?
                      $signed($unsigned((8'hb8))) : $signed(wire18[(2'h2):(1'h0)]))));
        end
      if ($unsigned($unsigned($unsigned(({wire21} ^~ wire18)))))
        begin
          reg115 <= wire43[(4'hb):(3'h6)];
        end
      else
        begin
          if (wire46[(3'h6):(3'h5)])
            begin
              reg115 <= $unsigned(((wire45[(5'h10):(1'h0)] ~^ (-(-(8'h9c)))) ?
                  ($signed((wire87 ? reg111 : wire45)) + $signed({wire27,
                      (8'hb6)})) : wire41[(5'h12):(5'h12)]));
              reg116 <= ($unsigned(wire19[(5'h11):(2'h2)]) && $signed($signed((+(wire41 || wire81)))));
              reg117 <= wire44;
            end
          else
            begin
              reg115 <= reg113;
              reg116 <= ($signed(((8'hb5) & {wire84[(3'h4):(1'h1)],
                  wire25})) <= ($signed((!(wire18 ?
                  (8'hb9) : (8'hb5)))) << $signed(($unsigned(reg108) * reg117))));
              reg117 <= ((8'h9e) != ((8'hb8) ?
                  ((|$unsigned(reg108)) == reg112) : (((wire27 ?
                          reg103 : reg107) + reg117[(3'h5):(3'h4)]) ?
                      $signed({reg111, reg116}) : $signed($signed(wire41)))));
            end
        end
      if ((wire21 > reg26[(1'h1):(1'h0)]))
        begin
          reg118 <= reg26[(2'h3):(2'h2)];
          reg119 <= $unsigned(reg110[(2'h3):(2'h3)]);
        end
      else
        begin
          reg118 <= (~&(^~$signed(wire27[(4'hd):(4'h8)])));
          reg119 <= ($unsigned(wire101[(3'h5):(2'h2)]) >>> wire41);
          reg120 <= (~($unsigned($unsigned(reg114)) + (($signed(wire44) | (reg114 - wire44)) != wire21[(1'h0):(1'h0)])));
        end
    end
  assign wire121 = wire19;
  assign wire122 = $signed(wire86[(1'h1):(1'h0)]);
endmodule

module module88
#(parameter param99 = (((((~(8'ha7)) ? ((8'ha4) > (8'hb6)) : ((8'ha4) ? (8'hb3) : (8'ha5))) ? (+((8'ha4) ? (8'hbc) : (8'h9c))) : (((8'hb3) ? (8'ha8) : (8'hb5)) && ((8'ha7) ? (8'hb1) : (8'ha0)))) ? (-(((8'ha8) ? (7'h41) : (8'ha9)) != ((8'ha5) << (8'ha6)))) : ((((8'ha1) ? (8'hb7) : (8'ha6)) ? ((8'hb5) | (8'hb2)) : ((8'h9f) ~^ (8'hab))) ? ((!(8'hbb)) ? ((8'ha7) ? (8'ha9) : (7'h42)) : (~|(8'hb0))) : (!(^~(8'ha6))))) << (^~{((^~(8'hb8)) ? ((7'h44) ? (7'h41) : (7'h41)) : ((8'ha0) ^~ (8'hba))), ((^~(8'ha8)) <= ((8'hb6) ? (8'h9d) : (8'hb0)))})), 
parameter param100 = (((!((param99 | param99) != param99)) | param99) ? ({((-(7'h43)) & (param99 ? param99 : param99))} ? (((^~param99) ? (param99 ? param99 : param99) : param99) <<< {(~&param99), (|param99)}) : param99) : (-{param99})))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire93;
  input wire [(3'h5):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  assign y = {wire98, wire97, wire96, wire95, wire94, (1'h0)};
  assign wire94 = (^$signed((wire93[(2'h2):(2'h2)] ?
                      $signed(wire93) : ((8'hb3) ?
                          wire92[(2'h2):(1'h0)] : {wire91}))));
  assign wire95 = $unsigned($signed($unsigned((~^$unsigned(wire89)))));
  assign wire96 = wire94;
  assign wire97 = {wire90};
  assign wire98 = wire91;
endmodule

module module47
#(parameter param79 = (((^(((8'hb0) | (8'ha1)) << ((8'h9d) ? (8'ha5) : (8'hb9)))) >> (~^(&((8'hac) ? (8'hb0) : (8'hb4))))) ? (((~|((8'haa) ? (8'hbb) : (8'ha6))) << {{(8'hb2), (8'hbb)}}) && (~^(((8'hb0) ? (8'hb6) : (7'h40)) ? ((8'ha7) >= (8'hbf)) : (~&(8'hae))))) : ((({(8'h9c), (8'haa)} ? {(8'hb4)} : (8'hbe)) ? (((8'hac) ^ (7'h41)) ? ((8'hbd) <= (8'hbd)) : ((8'h9e) ? (8'ha0) : (8'hb6))) : (+((8'hbf) ? (8'hbe) : (8'hb2)))) < ({{(8'hb7)}} ? {{(8'hb4), (7'h42)}, (8'hab)} : (8'hbf)))), 
parameter param80 = (+({((param79 <= param79) | (param79 <<< param79))} ? (((^param79) ? (param79 ? (8'h9d) : param79) : (~&param79)) ~^ (((8'hb3) ? param79 : param79) && (param79 ? param79 : (8'hb3)))) : (+((+param79) ? (param79 << param79) : (~param79))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire52;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire [(2'h2):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire77;
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  assign y = {wire77,
                 reg78,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= (7'h43);
      if ($signed(($signed((^$unsigned(wire48))) ?
          $unsigned(wire51) : {wire52})))
        begin
          reg54 <= $signed(($unsigned(wire50) >>> (wire49 ?
              wire50[(4'hb):(4'ha)] : wire52[(1'h0):(1'h0)])));
        end
      else
        begin
          reg54 <= (~&$unsigned($signed($signed(((8'hae) <<< (8'hae))))));
        end
      if (wire50[(4'hb):(4'ha)])
        begin
          reg55 <= ((-wire50) ?
              {($unsigned((reg54 ? wire51 : wire50)) ?
                      wire50 : $unsigned($unsigned(reg53)))} : $signed((~&((!wire50) ?
                  (wire49 * wire48) : {reg54, wire52}))));
          reg56 <= wire50;
          if ($signed($signed(reg54)))
            begin
              reg57 <= (8'hac);
              reg58 <= (reg54[(4'h9):(3'h7)] == reg56[(4'hc):(2'h3)]);
              reg59 <= $unsigned((!$signed((8'hb1))));
              reg60 <= $unsigned(({((wire51 << (8'hae)) == $signed(reg58)),
                      $signed($signed((8'had)))} ?
                  $signed((reg53[(4'hc):(4'h9)] ?
                      wire50[(4'hb):(2'h2)] : reg55[(3'h4):(3'h4)])) : (+$signed({reg54}))));
              reg61 <= ((&(!((8'ha6) <= (wire48 > wire51)))) ?
                  wire49[(4'he):(4'hd)] : ((wire48[(2'h2):(2'h2)] && $unsigned((~reg60))) | {(((8'ha5) >>> reg54) ?
                          $signed(reg55) : (|(8'hb1)))}));
            end
          else
            begin
              reg57 <= {((((~|reg57) || $signed(reg53)) ?
                          $unsigned(reg56) : reg58[(4'hc):(1'h0)]) ?
                      (reg55[(4'hc):(2'h2)] ^ $signed((+wire49))) : (7'h43)),
                  (|(!{reg61[(4'h8):(3'h7)], reg60[(1'h1):(1'h0)]}))};
              reg58 <= ($unsigned($signed(wire48[(1'h0):(1'h0)])) ^ $unsigned($unsigned({reg59})));
              reg59 <= {$signed((((|wire49) ?
                          (reg60 >> reg55) : $signed(reg54)) ?
                      (-(reg60 ?
                          wire50 : reg60)) : $unsigned(reg54[(4'hf):(3'h6)]))),
                  (~&wire52)};
            end
        end
      else
        begin
          reg55 <= (-wire51);
          reg56 <= (~|reg53);
          reg57 <= reg58;
          if ((~|$signed(($unsigned($unsigned((8'ha3))) >>> (|(~&wire49))))))
            begin
              reg58 <= (reg58[(5'h11):(3'h7)] ?
                  (((~wire50[(3'h5):(1'h1)]) ?
                          $signed(wire50) : (^~$unsigned(wire50))) ?
                      wire51 : ((|(reg60 - wire49)) != (|$signed(reg59)))) : $signed($unsigned(($signed(reg54) || reg54))));
              reg59 <= reg60[(3'h6):(2'h3)];
              reg60 <= $unsigned($signed(((~wire49) ?
                  $unsigned($unsigned(reg59)) : (wire48[(2'h2):(1'h1)] ?
                      (~wire52) : reg61[(3'h5):(3'h5)]))));
            end
          else
            begin
              reg58 <= $signed((~($unsigned((|wire49)) || $signed((reg57 & wire50)))));
              reg59 <= wire48;
              reg60 <= $signed(wire49[(3'h7):(2'h3)]);
              reg61 <= $unsigned(reg58[(5'h10):(4'h9)]);
              reg62 <= (({reg55,
                          ((&wire50) ?
                              wire48[(2'h2):(1'h0)] : {reg59, reg55})} ?
                      $signed($unsigned((reg56 < wire52))) : $signed(reg60[(1'h1):(1'h0)])) ?
                  $signed(wire48[(2'h2):(1'h0)]) : $unsigned(((wire49[(4'hf):(4'hb)] ?
                      wire50[(3'h5):(3'h4)] : (reg55 ?
                          reg54 : reg56)) && reg60[(3'h4):(1'h0)])));
            end
        end
      if ((~&reg61[(4'h9):(3'h6)]))
        begin
          reg63 <= $signed(wire49[(4'hb):(3'h4)]);
        end
      else
        begin
          reg63 <= ($unsigned(($signed($signed(reg55)) ?
                  ((~|wire51) ? reg60 : $unsigned(reg59)) : (8'ha3))) ?
              $signed(((~$signed(reg56)) ?
                  ($unsigned(reg63) >> (reg56 ?
                      reg54 : reg54)) : wire50[(4'he):(3'h5)])) : reg62[(1'h1):(1'h1)]);
          reg64 <= reg60[(3'h7):(2'h3)];
          if ($unsigned(($unsigned(wire52) ?
              $unsigned((&wire48[(1'h0):(1'h0)])) : $unsigned((&{wire48,
                  reg56})))))
            begin
              reg65 <= wire51;
            end
          else
            begin
              reg65 <= {$unsigned((-{(-reg59), $unsigned(reg55)}))};
              reg66 <= ($unsigned($unsigned(reg54)) & $signed(reg65));
              reg67 <= ({$unsigned($unsigned((wire49 ? wire48 : wire48))),
                  (((~|reg63) ? $signed(reg60) : $signed(reg61)) ?
                      wire50[(3'h6):(3'h5)] : $signed($signed(reg64)))} ^ reg58);
              reg68 <= reg63;
              reg69 <= reg63;
            end
          if (reg62[(2'h2):(1'h0)])
            begin
              reg70 <= $signed((($signed((8'hae)) && reg69) ?
                  reg65 : ($unsigned(wire49[(5'h10):(4'hb)]) < ((wire48 | reg65) >> reg68))));
              reg71 <= reg64;
              reg72 <= (!reg58[(3'h6):(1'h0)]);
            end
          else
            begin
              reg70 <= ($unsigned((^reg63[(2'h3):(1'h1)])) ^~ ($signed(reg59) ?
                  $signed((|(~^(8'hb7)))) : $signed($signed(reg71))));
              reg71 <= reg55;
            end
        end
    end
  always
    @(posedge clk) begin
      reg73 <= $unsigned($signed($signed(((reg56 >= wire50) >> ((7'h43) << reg68)))));
      reg74 <= {(((wire49 == $signed(reg62)) ?
              (~|reg62[(1'h0):(1'h0)]) : reg62[(1'h1):(1'h0)]) >>> (-($unsigned(reg54) ?
              (-reg68) : {reg65, reg70})))};
      reg75 <= $signed(reg67[(3'h4):(1'h0)]);
      reg76 <= reg73[(3'h4):(1'h1)];
    end
  assign wire77 = reg71[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg78 <= (wire52[(1'h0):(1'h0)] || ((-wire48) + (8'ha6)));
    end
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  assign y = {wire40, wire39, wire38, wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = wire29;
  assign wire35 = ({$unsigned(($signed(wire34) || $unsigned((7'h40)))),
                      (($signed(wire33) ?
                          $unsigned(wire32) : {wire32}) > (|wire29[(2'h2):(1'h1)]))} <<< wire29);
  assign wire36 = wire33;
  assign wire37 = (~&({$unsigned((wire32 ? (8'h9c) : (8'hbf)))} ?
                      $signed($unsigned((~|wire29))) : (7'h43)));
  assign wire38 = $signed($signed((((+(8'hb1)) ?
                          (wire33 ? wire33 : wire37) : (~^wire30)) ?
                      $signed((+(8'hb4))) : $signed((wire32 ?
                          wire33 : (8'hae))))));
  assign wire39 = wire30;
  assign wire40 = wire34;
endmodule
