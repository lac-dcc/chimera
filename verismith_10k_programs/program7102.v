module top
#(parameter param192 = (((7'h41) <= (&((!(8'hb0)) >>> {(7'h44), (8'hac)}))) ? ((8'h9e) - {(((8'hb6) ? (8'hbd) : (8'ha6)) ? {(8'hb4), (7'h44)} : (~|(8'hb4))), (((8'hb3) ? (8'hbb) : (8'h9f)) <= ((8'ha2) ? (8'ha1) : (8'hac)))}) : (((((8'hb2) == (8'ha5)) ^~ {(8'hb6)}) ? ((|(8'h9f)) && ((8'ha2) < (7'h44))) : (((8'ha9) ^ (8'hac)) ^~ ((8'haa) ? (8'hac) : (8'ha9)))) + ((((7'h43) & (8'hb8)) ? {(7'h40)} : ((8'ha3) - (8'ha4))) ? (~|{(8'hb4), (8'hac)}) : {((8'hb8) ? (8'hb1) : (8'haa)), ((8'ha1) <<< (8'hbd))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire signed [(3'h5):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire164;
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(4'h8):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire164,
                 reg6,
                 reg5,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((|wire0[(4'hc):(1'h1)]));
      reg6 <= reg5[(2'h2):(1'h1)];
    end
  module7 #() modinst165 (.y(wire164), .wire10(wire4), .wire8(wire2), .wire11(reg5), .clk(clk), .wire9(wire1), .wire12(wire3));
  always
    @(posedge clk) begin
      reg166 <= {(reg6 ?
              {(-$signed(wire0)), (^$signed(wire3))} : wire1[(2'h3):(1'h1)])};
      reg167 <= (reg6 + (((~|(wire3 ? wire0 : wire3)) * (~|{wire3})) ?
          $signed({(reg166 + (7'h40))}) : ($unsigned((wire3 <= reg166)) ^~ $unsigned($signed(reg6)))));
      if (wire2)
        begin
          reg168 <= (^~((($unsigned(wire4) ? wire164 : {reg167, wire0}) ?
              wire1[(2'h3):(1'h0)] : ((reg6 - wire3) ?
                  {wire2} : wire3[(2'h3):(2'h2)])) ^~ reg167));
          reg169 <= (^~(wire4[(4'hd):(4'hc)] && $unsigned($signed(reg167))));
        end
      else
        begin
          reg168 <= (reg6 && $signed($unsigned(reg168[(3'h5):(1'h0)])));
          if ((wire1[(3'h7):(1'h0)] ^ (!(~|($unsigned(reg168) ?
              (+wire2) : ((8'hae) ? wire0 : reg5))))))
            begin
              reg169 <= (({$signed((~&reg169))} ?
                      (~(^~(~|wire3))) : {(^~{wire2, wire0})}) ?
                  $unsigned((8'hb2)) : (^wire164));
              reg170 <= (wire164 > (8'haf));
              reg171 <= $unsigned({(+$unsigned($unsigned(reg168))),
                  {($unsigned(wire4) ?
                          reg167[(3'h4):(2'h2)] : $unsigned(reg6))}});
              reg172 <= (+(|$unsigned({reg166[(1'h1):(1'h1)],
                  $unsigned(reg167)})));
            end
          else
            begin
              reg169 <= (8'ha2);
            end
          reg173 <= reg169;
        end
      reg174 <= reg171;
      reg175 <= reg171;
    end
  always
    @(posedge clk) begin
      reg176 <= (^$signed((((reg166 > reg167) ?
              wire3[(1'h1):(1'h1)] : (reg175 ^~ reg166)) ?
          reg170[(4'hb):(3'h4)] : ((reg5 ? wire3 : reg175) ?
              (~|reg6) : (wire4 * reg173)))));
      reg177 <= reg171;
      reg178 <= (8'haf);
      if (((reg170[(3'h5):(1'h1)] * (((reg172 ^ reg6) ~^ (^~(8'hb3))) ?
              $signed(((8'hb7) ? reg5 : wire4)) : reg178[(3'h7):(1'h1)])) ?
          {reg178[(3'h6):(3'h6)],
              (($unsigned(reg170) || (reg175 ? wire3 : reg175)) ?
                  {(8'hac),
                      $signed((8'h9f))} : (&$unsigned(reg168)))} : reg173[(2'h2):(1'h1)]))
        begin
          reg179 <= reg6[(4'he):(2'h2)];
          reg180 <= $signed((~|{wire1}));
          reg181 <= reg176;
        end
      else
        begin
          reg179 <= reg174;
          if ($unsigned((~^reg168)))
            begin
              reg180 <= wire2;
              reg181 <= reg172[(3'h5):(2'h2)];
              reg182 <= (((reg178[(4'hf):(4'hb)] ?
                      $unsigned($signed(reg180)) : reg167[(2'h3):(1'h1)]) != reg169[(4'ha):(4'h9)]) ?
                  (reg171[(2'h3):(2'h3)] >>> $unsigned($unsigned((reg169 << reg178)))) : (wire1 >>> ((~reg178) ^ reg180)));
              reg183 <= $unsigned(reg171[(3'h5):(2'h3)]);
            end
          else
            begin
              reg180 <= wire3;
              reg181 <= ((8'ha5) != (~|({reg166[(4'h8):(3'h4)], reg173} ?
                  reg179 : (~&$signed(reg166)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg184 <= ((8'h9f) ?
          $signed({reg169[(4'h9):(3'h5)],
              (reg180 ?
                  reg182 : (reg176 ?
                      reg167 : (8'ha2)))}) : (+(reg171 & (reg174 ?
              reg5 : {reg172}))));
      reg185 <= (&reg181);
      reg186 <= ($unsigned($signed($signed((8'hab)))) ?
          ((^reg169) ?
              reg185 : (({reg170} ? $signed(reg5) : $signed((7'h42))) ?
                  (wire4[(4'he):(3'h7)] && wire3) : wire1)) : (((~&reg171) ?
              ($unsigned(reg174) && (reg169 >>> reg174)) : (&reg169[(3'h7):(2'h3)])) >>> (~|($signed(reg174) == $unsigned(wire2)))));
    end
  module34 #() modinst188 (wire187, clk, reg183, reg171, reg172, reg186, reg176);
  assign wire189 = wire3[(4'h9):(2'h3)];
  assign wire190 = {wire0, $signed($unsigned($unsigned((wire187 + wire1))))};
  assign wire191 = {reg6, (8'hbf)};
endmodule

module module7
#(parameter param162 = ((8'hb6) ? ((~|(((8'hb6) ? (8'ha3) : (8'hb7)) ? ((8'hba) * (8'hb4)) : {(8'ha3), (8'hbb)})) ? ({((8'ha7) & (8'h9c)), (-(8'had))} >= {(~^(8'hbd))}) : ((((8'h9c) ? (8'ha6) : (8'hb4)) ^~ ((7'h44) ? (8'ha8) : (8'hb5))) >>> (8'ha3))) : ((&(+((8'hbe) ? (8'ha2) : (8'hba)))) ? ((((8'hb0) ? (8'ha5) : (7'h41)) ? ((8'h9e) ? (8'h9f) : (8'ha9)) : {(8'ha4)}) ? ((-(8'ha6)) <= ((7'h42) || (8'ha1))) : {((8'hb0) ? (7'h43) : (8'ha9)), ((7'h42) ? (7'h43) : (8'hb7))}) : (|{(^~(7'h40))}))), 
parameter param163 = (((~((param162 < (8'hb5)) ? (~^(8'ha9)) : param162)) ? (~|(8'ha7)) : ((param162 >> ((8'ha3) | param162)) && (~(param162 >> param162)))) ? (~|param162) : (((8'ha3) ? param162 : param162) << (~(param162 ~^ (~^param162))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire49;
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  assign y = {wire161,
                 wire145,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire51,
                 wire28,
                 wire15,
                 wire14,
                 wire13,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire49,
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
                 reg16,
                 (1'h0)};
  assign wire13 = wire9[(2'h2):(1'h0)];
  assign wire14 = ($unsigned(wire12[(2'h3):(1'h0)]) <= (wire8 ?
                      wire10 : wire13));
  assign wire15 = (|wire14);
  always
    @(posedge clk) begin
      reg16 <= $signed({{$unsigned(wire11[(1'h0):(1'h0)])}});
    end
  module17 #() modinst29 (wire28, clk, wire14, reg16, wire8, wire15);
  assign wire30 = wire9;
  assign wire31 = (8'hb2);
  assign wire32 = ($unsigned(wire10) <= ((^wire9[(3'h6):(2'h3)]) < $unsigned(wire12[(1'h0):(1'h0)])));
  assign wire33 = reg16[(2'h3):(1'h0)];
  module34 #() modinst50 (.wire39(wire8), .wire37(wire15), .clk(clk), .wire35(wire14), .wire36(wire28), .y(wire49), .wire38(wire13));
  assign wire51 = (~^wire32[(4'hb):(2'h2)]);
  module52 #() modinst111 (.y(wire110), .wire55(wire32), .wire53(wire28), .wire56(wire31), .clk(clk), .wire54(wire10));
  assign wire112 = (~&{(wire33[(3'h7):(3'h6)] ?
                           $signed($unsigned(wire8)) : ((wire8 && wire12) ?
                               reg16[(1'h0):(1'h0)] : $unsigned(wire32)))});
  assign wire113 = (wire49[(3'h5):(1'h0)] + $signed(($signed($unsigned((8'hbe))) ?
                       ($unsigned((8'hab)) - (wire51 ?
                           wire32 : wire10)) : $signed(wire8))));
  assign wire114 = wire113;
  assign wire115 = $signed((wire10 ~^ $signed($signed($signed(wire32)))));
  assign wire116 = wire10[(4'hb):(3'h5)];
  always
    @(posedge clk) begin
      reg117 <= wire114[(2'h2):(2'h2)];
      if (reg16[(3'h5):(3'h5)])
        begin
          reg118 <= (wire15[(3'h6):(3'h4)] > {wire49});
          reg119 <= ((+$signed((&((7'h42) << wire49)))) ?
              $unsigned((!(((8'hb9) ? wire32 : (8'hab)) ?
                  wire49[(4'hf):(4'hb)] : $unsigned(wire13)))) : wire8[(1'h0):(1'h0)]);
          if (reg119)
            begin
              reg120 <= $unsigned((-wire32[(3'h5):(1'h1)]));
              reg121 <= {{reg118[(3'h4):(1'h0)],
                      $signed($signed((wire30 - wire15)))},
                  (8'h9c)};
            end
          else
            begin
              reg120 <= $unsigned(wire32[(1'h0):(1'h0)]);
              reg121 <= wire10;
              reg122 <= {((-((wire11 ?
                          reg119 : (8'hbe)) || wire32[(4'h9):(4'h9)])) ?
                      ((&(reg119 ?
                          reg16 : wire49)) && reg119) : {$signed(wire15[(4'hd):(2'h2)])})};
              reg123 <= ($unsigned((({wire15} ? (8'h9f) : (wire49 <= wire51)) ?
                  (|wire11[(3'h4):(1'h1)]) : ((wire113 ? wire33 : wire49) ?
                      (wire114 <= wire15) : wire110))) ~^ {reg120[(3'h4):(1'h0)]});
            end
          reg124 <= ({{$unsigned(((7'h40) != wire49)),
                  ($unsigned((8'haf)) ^ reg123[(3'h4):(2'h2)])}} ~^ ($unsigned(wire14[(4'ha):(3'h5)]) ~^ ((8'hba) << ($unsigned(wire11) ?
              $signed(wire115) : $signed(wire14)))));
        end
      else
        begin
          if (($signed(wire110) ? (~^wire13) : $unsigned(wire113)))
            begin
              reg118 <= wire14;
              reg119 <= wire31[(3'h4):(1'h1)];
              reg120 <= {(reg117 >= wire10),
                  ({reg16,
                      (^(+wire9))} ~^ $unsigned($signed($unsigned(wire14))))};
              reg121 <= $signed($unsigned(($signed(wire110[(5'h11):(3'h4)]) << (wire49 >>> $unsigned(reg122)))));
            end
          else
            begin
              reg118 <= $signed((8'hac));
              reg119 <= {$signed({(wire30[(2'h2):(1'h1)] ?
                          reg16[(3'h5):(3'h5)] : (wire9 ? (8'ha6) : wire10))})};
            end
          reg122 <= wire112;
        end
      if ($signed((wire10[(4'hd):(3'h5)] ? (8'hb5) : (~^$signed({wire12})))))
        begin
          reg125 <= $signed($unsigned(reg120[(1'h0):(1'h0)]));
          if ((~&$signed(((8'hbc) <= $unsigned((wire10 ? wire12 : wire13))))))
            begin
              reg126 <= wire8;
            end
          else
            begin
              reg126 <= wire32[(3'h6):(2'h2)];
              reg127 <= $signed($unsigned($signed((^(wire116 ?
                  wire13 : reg119)))));
              reg128 <= (~&reg118[(2'h3):(1'h0)]);
              reg129 <= (^~{((~$signed(reg120)) ?
                      ((^wire49) ~^ (reg119 ^ reg123)) : wire114[(2'h3):(2'h2)]),
                  (((wire8 ? wire31 : wire12) < $unsigned(reg16)) ?
                      ((reg122 >>> wire14) ?
                          ((8'haf) ? wire14 : wire110) : ((8'h9f) ?
                              wire113 : reg121)) : (~&{wire33}))});
            end
          reg130 <= wire33;
        end
      else
        begin
          reg125 <= $signed((|($signed(((8'hbf) ?
              (8'hb8) : wire112)) > (8'ha5))));
          reg126 <= reg122;
        end
    end
  module131 #() modinst146 (.wire132(reg121), .wire133(wire31), .wire135(reg123), .y(wire145), .wire134(wire116), .clk(clk));
  always
    @(posedge clk) begin
      if (wire114[(2'h2):(2'h2)])
        begin
          if ((wire11 ?
              ($unsigned(wire8[(4'he):(3'h5)]) ?
                  $unsigned((&$unsigned(reg119))) : ((|(|(8'hb7))) ^~ ((wire13 ?
                          reg121 : reg123) ?
                      $unsigned(reg118) : $unsigned(reg125)))) : $unsigned(reg16)))
            begin
              reg147 <= ((7'h42) ?
                  reg117[(2'h2):(2'h2)] : (|$unsigned({(8'hb3)})));
              reg148 <= wire28[(3'h6):(2'h3)];
            end
          else
            begin
              reg147 <= $unsigned(wire112[(3'h4):(3'h4)]);
              reg148 <= wire115[(2'h2):(1'h1)];
              reg149 <= {{reg126[(1'h1):(1'h0)]}};
              reg150 <= ({wire28} < wire30[(1'h0):(1'h0)]);
            end
          if ((8'hbd))
            begin
              reg151 <= (^~wire112);
              reg152 <= ((^~(wire14 ^~ ((|reg150) || wire12))) ?
                  (!((^~(reg126 ~^ wire11)) ?
                      (wire51 && wire15) : $unsigned(wire9))) : ($unsigned(reg121[(4'hb):(2'h3)]) <<< (8'ha6)));
            end
          else
            begin
              reg151 <= reg118[(4'h9):(2'h2)];
              reg152 <= ($unsigned((reg117[(1'h1):(1'h0)] <<< wire13[(2'h2):(1'h0)])) ?
                  (wire116 && (7'h43)) : (8'ha0));
              reg153 <= $unsigned((&reg148[(1'h0):(1'h0)]));
              reg154 <= $signed($signed(wire112));
            end
        end
      else
        begin
          if (reg121[(4'h8):(1'h1)])
            begin
              reg147 <= ((^~(~$signed((+wire115)))) ?
                  wire8[(3'h5):(2'h2)] : (|reg128[(2'h3):(1'h1)]));
              reg148 <= $signed(wire12);
            end
          else
            begin
              reg147 <= $signed(wire9);
              reg148 <= $signed($unsigned(({reg154[(3'h4):(1'h0)],
                      (reg149 <= (8'hbf))} ?
                  $signed((reg16 >= reg152)) : $unsigned($signed(wire51)))));
              reg149 <= ((wire10 * wire10[(4'h8):(2'h3)]) - {{wire31,
                      ((-(8'hae)) && $signed(reg123))},
                  $signed((&{(8'hb1), reg150}))});
              reg150 <= (!($signed($signed((!reg128))) < reg154));
              reg151 <= reg148;
            end
          reg152 <= ({(wire12 ?
                  ({wire116, wire10} > ((8'hb6) >>> wire9)) : reg152),
              $unsigned($signed((~&reg128)))} << (((^~(8'hbc)) ?
                  wire32 : wire10) ?
              {wire115,
                  ((wire115 ? reg120 : reg149) ?
                      (reg121 ? reg124 : wire49) : {reg121,
                          wire13})} : (8'ha2)));
          if (((reg129 ?
                  (~|((wire13 ?
                      reg147 : wire8) | {(8'hb1)})) : $unsigned((+reg129[(3'h4):(2'h3)]))) ?
              wire145[(2'h2):(2'h2)] : (($signed($signed((8'hbc))) ?
                      $unsigned($signed(wire114)) : (reg125[(1'h1):(1'h1)] ?
                          $unsigned(reg120) : ((8'haf) ? reg126 : reg119))) ?
                  (-($signed(reg125) <= reg153)) : (((reg128 ?
                          reg154 : wire114) ?
                      $signed(wire49) : reg147[(2'h2):(1'h1)]) > reg122[(3'h7):(2'h3)]))))
            begin
              reg153 <= $signed((wire112 ?
                  $unsigned($unsigned((~^wire49))) : $unsigned(($signed(reg148) - $unsigned(reg121)))));
              reg154 <= ((wire14[(4'hd):(4'ha)] ?
                      (wire11[(2'h2):(1'h0)] ?
                          (((8'ha3) ?
                              reg119 : reg129) * {wire15}) : reg117[(1'h1):(1'h1)]) : (+(~wire12))) ?
                  reg123[(1'h1):(1'h1)] : reg123);
              reg155 <= $signed(reg147);
              reg156 <= reg126[(1'h0):(1'h0)];
            end
          else
            begin
              reg153 <= (~^({wire33} != reg123[(1'h1):(1'h0)]));
              reg154 <= (reg149[(4'h8):(3'h5)] ?
                  ((~$signed(reg16)) ?
                      (!(reg124 ?
                          (7'h43) : reg150[(1'h1):(1'h0)])) : ((reg129[(4'ha):(3'h4)] || wire8) ?
                          wire112 : (^~{wire12, reg153}))) : $unsigned(wire33));
              reg155 <= $unsigned(reg129);
            end
          reg157 <= $signed($unsigned(wire114[(2'h3):(2'h2)]));
          reg158 <= $unsigned($unsigned(((wire116 || $unsigned(wire12)) != ((^wire33) ?
              $unsigned(wire51) : $signed(wire10)))));
        end
      reg159 <= $unsigned($signed((reg120 ?
          reg118[(2'h3):(1'h0)] : (wire116 || (wire14 ? reg153 : wire145)))));
      reg160 <= reg129;
    end
  assign wire161 = wire10;
endmodule

module module131
#(parameter param143 = ((-((&(~(8'hbc))) ? ((&(8'ha0)) ? ((8'ha9) ? (8'hb7) : (8'ha5)) : (!(8'had))) : (((8'ha6) ? (8'hb4) : (7'h42)) ? ((8'hac) ? (8'hb2) : (8'h9e)) : ((8'hb8) <<< (8'ha2))))) ? (((8'haf) ? (((7'h44) ? (8'hae) : (8'ha2)) ? {(8'ha8), (7'h43)} : {(8'ha3)}) : ({(8'hbf)} <= ((8'ha3) ? (8'hb1) : (8'hbb)))) << ((((8'hbb) || (8'h9e)) ? ((8'hbc) ? (8'hb1) : (8'haa)) : (-(8'hb2))) ^~ {(&(8'hae))})) : (!(^((^(8'hb2)) ? (~(7'h42)) : (!(7'h44)))))), 
parameter param144 = ((((^param143) ? (|(&param143)) : (+((8'hbd) != param143))) ? (((param143 >> param143) ? (param143 ? param143 : param143) : param143) >= ((-(8'hb1)) ? param143 : (~param143))) : ({{param143}, (^param143)} != {(!param143), {(8'hb0), param143}})) ? param143 : (^(~|(+(~|param143))))))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire135;
  input wire signed [(4'hf):(1'h0)] wire134;
  input wire [(3'h7):(1'h0)] wire133;
  input wire [(5'h15):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire136;
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire136 = $signed($signed((|(+(wire134 ? (8'hb2) : wire135)))));
  assign wire137 = wire132[(5'h14):(2'h2)];
  assign wire138 = {(((~|(~&wire134)) - (!wire137)) ?
                           $signed($signed((wire136 == wire137))) : wire136[(1'h1):(1'h1)]),
                       $signed(wire135)};
  assign wire139 = $unsigned($signed(wire136[(2'h2):(2'h2)]));
  assign wire140 = wire132[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg141 <= $unsigned(wire135[(2'h3):(2'h2)]);
      reg142 <= $unsigned(wire140);
    end
endmodule

module module52
#(parameter param109 = (((({(8'ha7), (8'hb2)} < ((8'h9d) ? (8'ha3) : (7'h44))) && (((8'ha6) ? (8'hbc) : (7'h42)) << ((8'ha6) ? (8'ha4) : (7'h44)))) ? (({(8'ha5), (8'had)} ? (~|(8'h9d)) : ((8'hb5) ? (8'hbe) : (8'hae))) - (^~((8'hbd) || (8'hb5)))) : ((((8'ha7) != (8'h9d)) != (8'hb0)) ? (((8'hb9) == (8'hb9)) ? (~(7'h41)) : (~^(8'h9f))) : ((|(8'hb1)) >= (+(8'haf))))) || (((((8'ha9) ? (8'hbf) : (8'hb7)) << (&(8'h9d))) | ((!(8'hb0)) != {(8'hbb), (8'hbe)})) == ((((8'hb2) + (8'h9e)) - (|(8'haa))) <= ((8'hbc) ? {(8'hb6)} : {(7'h42), (8'hb0)})))))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire56;
  input wire signed [(4'h9):(1'h0)] wire55;
  input wire signed [(5'h12):(1'h0)] wire54;
  input wire [(5'h11):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire59,
                 wire58,
                 wire57,
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
                 (1'h0)};
  assign wire57 = (^$unsigned(wire55[(3'h6):(2'h2)]));
  assign wire58 = ($signed($unsigned(((|wire53) ?
                      wire55 : ((8'ha2) << wire54)))) > (wire54 <<< wire55[(1'h1):(1'h0)]));
  assign wire59 = (wire56 * wire58);
  always
    @(posedge clk) begin
      if (({(~&wire54), wire59} ^~ {wire58[(5'h14):(3'h4)],
          ($unsigned($signed(wire55)) ?
              ((wire58 << wire57) ? $unsigned(wire53) : (+wire55)) : ({wire55,
                      wire56} ?
                  wire59[(4'hb):(4'hb)] : wire54))}))
        begin
          reg60 <= (wire56[(1'h0):(1'h0)] + (wire53 | $unsigned(($unsigned(wire58) != $signed(wire53)))));
          reg61 <= (($unsigned((~|$unsigned(wire55))) ?
              $unsigned(wire57) : wire53) || ((7'h41) ? (8'hb5) : (~&(8'hac))));
          reg62 <= (+reg60[(1'h0):(1'h0)]);
          reg63 <= wire58[(3'h6):(1'h1)];
          if (wire55[(3'h4):(1'h1)])
            begin
              reg64 <= $signed($unsigned($unsigned({$unsigned(wire57)})));
              reg65 <= ((^$unsigned(($unsigned(wire53) | (~|reg61)))) < {(wire59 ?
                      wire59[(5'h10):(3'h4)] : (wire57[(4'ha):(3'h5)] - wire57[(3'h5):(2'h3)])),
                  $signed($unsigned((wire58 < reg60)))});
              reg66 <= {($unsigned((wire59[(1'h0):(1'h0)] ?
                          $unsigned(reg62) : (8'hbe))) ?
                      $signed({(reg62 ?
                              wire57 : wire57)}) : $unsigned(($signed(wire58) < $unsigned(wire58))))};
            end
          else
            begin
              reg64 <= wire55[(3'h6):(3'h4)];
              reg65 <= $unsigned(wire56);
              reg66 <= reg65[(2'h2):(2'h2)];
            end
        end
      else
        begin
          if ((((+$unsigned((~(8'h9f)))) ~^ wire55) ?
              (reg66 ? reg65 : reg64[(4'hd):(1'h0)]) : reg66[(4'h9):(1'h0)]))
            begin
              reg60 <= reg66[(2'h3):(1'h1)];
              reg61 <= ($unsigned((wire55 >> {{reg63,
                      wire55}})) & ((^$signed((~wire56))) && reg64[(4'hb):(4'hb)]));
              reg62 <= ($unsigned($unsigned(($unsigned((8'ha4)) ?
                      {reg65, (8'ha6)} : $unsigned(reg62)))) ?
                  $unsigned((8'hb5)) : {{$signed((wire57 ? reg65 : wire56)),
                          $unsigned({(7'h42)})},
                      (~&((!wire57) == (8'had)))});
              reg63 <= ((((reg66 ? (reg62 << wire55) : {reg65, reg66}) ?
                          (wire58[(5'h15):(5'h15)] ?
                              $signed(reg63) : wire58) : reg65) ?
                      (~&($signed(reg60) ^ {(8'had)})) : {wire54}) ?
                  (|(~&$signed($signed((8'hb7))))) : (($unsigned((reg64 >= wire55)) ?
                          $signed((~^wire58)) : $signed(wire57[(4'ha):(3'h4)])) ?
                      reg63 : (reg63[(2'h2):(2'h2)] ?
                          wire57 : reg65[(2'h3):(2'h3)])));
              reg64 <= ($signed((((^(8'haf)) << reg65[(2'h2):(2'h2)]) ?
                  (reg61 ?
                      $unsigned((8'hb9)) : wire59[(5'h10):(3'h5)]) : (|(!(8'hb6))))) != $unsigned((&(!{reg64,
                  (7'h44)}))));
            end
          else
            begin
              reg60 <= (~^$signed($signed($unsigned((reg60 - reg62)))));
              reg61 <= ($signed((8'hbd)) ?
                  reg63[(2'h2):(1'h1)] : $unsigned(({$unsigned((8'hb7)),
                      $signed((7'h42))} == wire56)));
              reg62 <= $signed((^wire59[(1'h0):(1'h0)]));
              reg63 <= (7'h40);
            end
          reg65 <= (~&wire55);
          reg66 <= ($unsigned({(-wire57),
              $unsigned($signed(reg65))}) >> ((~&{$unsigned(reg61),
                  reg61[(5'h10):(4'hc)]}) ?
              {(~&$unsigned(wire54)), wire54[(4'hb):(3'h4)]} : (8'hbe)));
          if ((((~&((~&wire57) == reg60[(1'h0):(1'h0)])) << wire58[(3'h7):(3'h6)]) <= (-reg65)))
            begin
              reg67 <= (wire57[(4'h9):(4'h9)] ?
                  (reg61[(4'h8):(1'h0)] + $signed({$unsigned((8'hbb)),
                      $signed(wire53)})) : {{$signed(reg66[(5'h11):(4'ha)]),
                          ((~reg63) ?
                              $signed(wire57) : (wire55 ?
                                  (7'h40) : (8'hac)))}});
              reg68 <= $unsigned(reg61[(1'h0):(1'h0)]);
              reg69 <= $signed($unsigned(($unsigned(wire59[(4'hf):(4'he)]) ~^ reg61)));
              reg70 <= ((~&$unsigned((-(-reg60)))) >> wire56);
              reg71 <= (reg70[(4'hc):(3'h4)] << (8'had));
            end
          else
            begin
              reg67 <= $signed((!(^~reg67[(3'h4):(3'h4)])));
              reg68 <= $signed($signed(reg62[(1'h1):(1'h0)]));
              reg69 <= ((8'hb2) ?
                  (reg69 != $unsigned((|(^~reg65)))) : ((|reg60) == wire54[(2'h3):(2'h3)]));
              reg70 <= wire57;
              reg71 <= ((^~wire53[(2'h2):(1'h0)]) <<< wire57);
            end
          reg72 <= (reg69[(3'h4):(1'h0)] ?
              (reg63 != (^wire58[(4'hb):(4'ha)])) : reg61);
        end
    end
  always
    @(posedge clk) begin
      reg73 <= reg61;
    end
  assign wire74 = wire55;
  assign wire75 = reg68;
  assign wire76 = {reg70[(4'h8):(3'h7)]};
  assign wire77 = ((~&reg61[(5'h12):(4'ha)]) << wire59);
  assign wire78 = $signed((reg61[(5'h12):(4'hb)] == reg68));
  assign wire79 = $signed(($unsigned(($unsigned(reg60) >= (wire78 ?
                      wire75 : (8'ha8)))) > (~&reg69[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned($unsigned(wire55)))))
        begin
          reg80 <= ($unsigned((~&wire53[(4'h9):(3'h7)])) ?
              $signed($signed($signed($signed(wire56)))) : (!{($signed(wire74) ?
                      (|wire79) : (+reg65))}));
          reg81 <= wire54[(5'h12):(2'h3)];
          reg82 <= $signed($unsigned($signed($signed($signed(reg70)))));
          reg83 <= ($signed((~{(wire56 ? (7'h42) : reg69), $signed(wire55)})) ?
              {{wire59}} : (8'hb5));
          reg84 <= reg83[(4'h9):(3'h4)];
        end
      else
        begin
          reg80 <= (^~(~^(8'ha6)));
          reg81 <= wire57;
          if (reg60)
            begin
              reg82 <= $signed(reg80[(2'h3):(1'h0)]);
              reg83 <= (reg64 ~^ $unsigned(wire79[(1'h1):(1'h1)]));
              reg84 <= wire54[(5'h12):(4'hc)];
            end
          else
            begin
              reg82 <= $unsigned(reg70);
              reg83 <= $signed({{reg62}, (&wire55)});
              reg84 <= $signed($signed((((~reg83) || (reg62 ?
                      (8'hb4) : reg81)) ?
                  reg80 : wire74)));
              reg85 <= $signed((wire56[(3'h5):(2'h2)] ?
                  reg71[(3'h4):(3'h4)] : $signed($signed($unsigned(reg63)))));
            end
          if ($signed((reg68[(3'h5):(3'h5)] * (&{$unsigned(wire78),
              reg81[(4'h8):(3'h4)]}))))
            begin
              reg86 <= $signed({wire56});
              reg87 <= {wire77[(3'h6):(3'h4)]};
              reg88 <= $unsigned(reg82);
              reg89 <= (!wire79);
            end
          else
            begin
              reg86 <= (reg86[(2'h2):(2'h2)] > wire56[(4'h9):(2'h2)]);
              reg87 <= $signed($unsigned((8'hb2)));
            end
          reg90 <= $signed(reg72);
        end
      reg91 <= $signed($signed({($signed(reg67) == reg68),
          $signed($signed((8'haf)))}));
      if ((&(($signed({reg61}) ?
              ((wire54 ? reg87 : wire53) ? wire54 : (&(8'ha8))) : reg81) ?
          (({wire58} ? (~|reg83) : $unsigned(reg83)) ?
              (|$unsigned(reg72)) : (((8'hbd) - wire74) || (+(8'hb5)))) : reg90)))
        begin
          reg92 <= reg83[(3'h6):(3'h6)];
          reg93 <= (^$signed((^~wire59)));
          reg94 <= (-(8'hae));
          reg95 <= $signed(wire56[(2'h2):(2'h2)]);
        end
      else
        begin
          reg92 <= $unsigned(reg92);
        end
      reg96 <= ((8'h9c) ?
          (reg84 ?
              (~reg60[(2'h2):(1'h0)]) : $unsigned(reg94)) : $unsigned(reg72[(2'h2):(1'h1)]));
      if ((~|((^~((8'hac) || (reg93 * reg63))) + (~|$signed((^wire53))))))
        begin
          if ($unsigned(wire54))
            begin
              reg97 <= (~|(!(((+wire55) < $signed(wire75)) || (reg73 ?
                  (reg87 - (8'ha1)) : (!reg83)))));
              reg98 <= wire54;
            end
          else
            begin
              reg97 <= wire58;
              reg98 <= (($signed((-$signed(reg66))) ?
                  reg61 : reg72[(1'h1):(1'h0)]) != wire79[(1'h0):(1'h0)]);
              reg99 <= reg92;
              reg100 <= $signed({{(~|(reg72 >> reg99))}, reg81[(4'he):(2'h2)]});
            end
          reg101 <= reg85[(4'hf):(2'h2)];
          reg102 <= (+$signed(wire54));
          reg103 <= ((reg82 << wire55[(2'h3):(1'h1)]) ?
              {$unsigned(((wire74 > wire56) | $unsigned(wire76)))} : (&$signed($signed((^~reg91)))));
          reg104 <= reg85;
        end
      else
        begin
          reg97 <= (($unsigned((~^$signed(reg101))) == $unsigned(reg73)) ?
              $unsigned((~|(~^{wire55, reg83}))) : {((reg94[(2'h3):(1'h1)] ?
                          ((8'ha3) ? wire79 : wire58) : {reg81, reg89}) ?
                      ({reg68,
                          reg71} || (+reg80)) : $signed((wire79 <= reg95))),
                  $unsigned((reg69 ? (&reg93) : (!wire77)))});
          reg98 <= $signed(($unsigned({reg90}) >= (reg72 | $signed((wire78 | reg85)))));
          reg99 <= $unsigned((~&reg73));
          reg100 <= (reg63 >> {$unsigned(reg87)});
        end
    end
  assign wire105 = (($signed($signed(wire59[(1'h0):(1'h0)])) > (^{wire74})) ?
                       $signed($signed($signed({(8'hb4),
                           wire75}))) : (!{(reg97[(4'hb):(3'h7)] ?
                               (wire75 ? reg69 : wire58) : reg103),
                           (reg102[(1'h1):(1'h1)] ?
                               reg66[(2'h2):(2'h2)] : (-reg85))}));
  assign wire106 = wire105[(1'h1):(1'h1)];
  assign wire107 = {{$unsigned($signed(reg68[(2'h2):(2'h2)]))},
                       ($unsigned(((reg87 <= wire59) == reg62)) <= (wire58[(1'h0):(1'h0)] ?
                           wire57 : reg90))};
  assign wire108 = ($signed((({reg69, (8'hb5)} ?
                           wire75[(4'h9):(1'h1)] : (|reg91)) ?
                       $signed(reg88) : {(~(7'h42)),
                           reg72})) & $unsigned($signed($signed((wire106 >>> reg103)))));
endmodule

module module34
#(parameter param48 = (~{(^(-(8'hbe))), ((^~((8'hab) ? (8'hb5) : (8'h9e))) || ({(8'ha0), (7'h43)} ? ((8'hb2) & (8'ha9)) : (|(8'hac))))}))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire signed [(3'h4):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  assign y = {wire47,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg46,
                 (1'h0)};
  assign wire40 = ((8'ha1) && $signed(((!wire36) | (wire36[(1'h1):(1'h0)] ?
                      $signed(wire35) : (wire39 ? wire36 : wire35)))));
  assign wire41 = wire40[(4'hd):(1'h1)];
  assign wire42 = wire39;
  assign wire43 = (~&(~$unsigned(wire41[(3'h4):(2'h2)])));
  assign wire44 = $signed({(($unsigned(wire37) ?
                          ((7'h43) ?
                              wire36 : wire42) : (8'hb9)) || ((wire42 + wire39) ?
                          (wire43 - (8'had)) : (~|wire41))),
                      {$unsigned((wire40 * (8'hb8))),
                          ((~wire40) ? wire40 : {(7'h44)})}});
  assign wire45 = $unsigned(wire42);
  always
    @(posedge clk) begin
      reg46 <= (wire38 <<< wire41[(4'h9):(4'h9)]);
    end
  assign wire47 = (-$unsigned(wire44[(1'h1):(1'h0)]));
endmodule

module module17
#(parameter param26 = {((|({(8'hb3), (8'ha7)} && ((8'hb9) && (8'ha7)))) <<< ((((8'haf) + (8'hb6)) - ((8'hb9) ? (8'hb5) : (8'ha0))) + (((8'haa) <= (8'ha4)) ? (^(7'h44)) : ((8'hb7) != (7'h43)))))}, 
parameter param27 = param26)
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  assign y = {wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = wire18[(3'h7):(3'h7)];
  assign wire23 = (wire22[(4'h9):(3'h5)] ^ $signed($unsigned(({wire22} ?
                      wire20[(1'h1):(1'h1)] : ((8'hbb) >>> (8'ha4))))));
  assign wire24 = $signed({$unsigned($signed($unsigned(wire23)))});
  assign wire25 = $unsigned(wire24);
endmodule
