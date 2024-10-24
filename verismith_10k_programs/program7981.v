module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire180;
  wire [(3'h5):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire127;
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire178,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire4,
                 wire9,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire127,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned($unsigned((+(wire2 ? wire0 : wire0)))) ~^ wire1);
  always
    @(posedge clk) begin
      reg5 <= wire4;
      reg6 <= $signed((wire1[(1'h1):(1'h0)] == $unsigned((~&reg5))));
      reg7 <= wire2[(1'h0):(1'h0)];
      reg8 <= wire3;
    end
  assign wire9 = ((~reg7) && reg5[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      reg10 <= $signed(wire9);
      reg11 <= ($unsigned((&($signed(reg6) >>> {wire4, wire2}))) ?
          $unsigned((~((wire2 ?
              reg5 : reg7) || $signed(wire3)))) : wire3[(1'h0):(1'h0)]);
      reg12 <= (reg7 ? wire4[(2'h3):(1'h0)] : $signed((8'hb2)));
    end
  assign wire13 = $unsigned(reg8);
  assign wire14 = (wire2 ?
                      {$signed(reg11),
                          reg12} : (~|$unsigned(($unsigned(reg11) * $unsigned(wire3)))));
  assign wire15 = (-reg12);
  assign wire16 = reg8[(5'h12):(4'hf)];
  module17 #() modinst128 (wire127, clk, wire4, reg8, reg6, reg12);
  assign wire129 = (&({(8'h9d)} ?
                       $unsigned({(8'ha8)}) : {((wire3 ?
                               wire14 : (7'h42)) >= (~reg10)),
                           ((~|reg5) <= (7'h40))}));
  assign wire130 = wire4;
  assign wire131 = ($signed(wire16[(4'hc):(1'h1)]) ?
                       (~^(((reg10 ? reg6 : wire16) || (8'ha4)) ?
                           ((reg5 ?
                               reg11 : reg12) <<< wire129) : $unsigned($signed(reg5)))) : reg7);
  assign wire132 = reg10[(4'hf):(4'h9)];
  assign wire133 = $unsigned((reg12 ^ $unsigned(reg8[(2'h3):(2'h3)])));
  module134 #() modinst179 (.clk(clk), .y(wire178), .wire138(wire1), .wire137(wire9), .wire135(reg7), .wire136(wire13), .wire139(wire132));
  assign wire180 = wire9[(1'h0):(1'h0)];
  assign wire181 = reg12;
endmodule

module module134  (y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire139;
  input wire [(3'h6):(1'h0)] wire138;
  input wire signed [(3'h4):(1'h0)] wire137;
  input wire [(4'hd):(1'h0)] wire136;
  input wire [(5'h10):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire140;
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  assign y = {wire140,
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
                 (1'h0)};
  assign wire140 = (wire136[(3'h7):(1'h0)] ?
                       (^(~{wire137,
                           $signed(wire136)})) : (wire135[(3'h5):(1'h1)] && (!$signed((wire139 | (8'ha4))))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed(wire140) >> wire137))))
        begin
          reg141 <= $signed({(+wire140), {(~&$signed((8'h9d)))}});
          reg142 <= $signed((~&(!wire139)));
          if (wire135)
            begin
              reg143 <= {(!((^~((8'hbe) ? reg141 : reg142)) >= wire140))};
              reg144 <= $signed(((wire136[(1'h1):(1'h1)] ?
                  reg143[(2'h2):(1'h1)] : $unsigned((wire139 ?
                      wire136 : reg143))) >>> $signed(reg143)));
              reg145 <= $unsigned((reg143 ?
                  wire135[(3'h4):(3'h4)] : $signed($unsigned((~|reg142)))));
              reg146 <= ($unsigned((+(~&wire139[(3'h6):(2'h3)]))) >> (^~$signed(($signed(reg143) >>> reg145))));
              reg147 <= ($unsigned(({wire135} ?
                      $unsigned($unsigned(wire136)) : $unsigned((reg143 ?
                          reg142 : wire136)))) ?
                  $signed(reg145[(3'h5):(1'h0)]) : reg143[(2'h2):(2'h2)]);
            end
          else
            begin
              reg143 <= ($unsigned(wire135[(4'hf):(4'hb)]) * (reg145[(1'h1):(1'h0)] << $signed(reg145[(3'h4):(2'h3)])));
              reg144 <= $unsigned((|$unsigned(wire139)));
            end
          reg148 <= $signed(((wire139[(1'h0):(1'h0)] ?
              wire139 : (wire140 & $signed(reg147))) >>> (((~^wire138) <= reg145) ?
              $unsigned((8'ha5)) : wire136)));
          reg149 <= {$unsigned(((~^$signed(reg142)) & wire135)),
              ($signed(reg142) != reg147)};
        end
      else
        begin
          reg141 <= (($signed(((wire139 >> (7'h43)) >= $signed((8'ha5)))) * (((reg146 ?
                          wire139 : reg143) ?
                      $signed(reg149) : (^~reg143)) ?
                  ({(8'hb9)} > (reg147 ?
                      wire137 : reg144)) : (wire137[(2'h3):(2'h2)] ?
                      $unsigned(reg148) : wire136))) ?
              $signed(wire140[(1'h1):(1'h1)]) : $signed((&$unsigned(reg149))));
          reg142 <= ($signed((~|$signed((~wire138)))) & ((reg143 ?
                  reg145 : (reg146[(2'h2):(1'h0)] * (reg149 ?
                      reg146 : (8'hb2)))) ?
              $signed((((8'h9c) << (8'h9d)) ?
                  $unsigned((8'hb3)) : $signed((8'hae)))) : reg142[(1'h0):(1'h0)]));
          reg143 <= ((8'ha9) <<< ((wire138 || $signed($signed(wire135))) < ($unsigned(reg142) ?
              (((8'hbd) * reg145) - ((7'h40) ?
                  reg145 : reg143)) : ((wire139 ~^ reg148) ?
                  (wire140 ? reg147 : wire139) : $signed(wire139)))));
        end
      reg150 <= reg141;
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire135[(4'hd):(2'h2)]))
        begin
          reg151 <= reg143;
        end
      else
        begin
          reg151 <= (8'hbe);
          reg152 <= $signed((reg146[(4'h8):(2'h3)] ?
              reg150 : $unsigned(reg149)));
          reg153 <= {(^~$signed((reg141 + wire137[(3'h4):(1'h1)]))),
              ($unsigned($signed($signed(wire135))) ?
                  ($unsigned(((8'hbc) | reg145)) << (|(reg148 & wire138))) : ((reg152[(3'h5):(3'h4)] ?
                      (reg149 ?
                          wire138 : reg144) : reg144[(1'h0):(1'h0)]) ~^ (~$unsigned(reg141))))};
          reg154 <= $unsigned((~&(-(|$unsigned(reg147)))));
        end
      reg155 <= reg148[(1'h0):(1'h0)];
      if ($signed($signed(((^(!reg151)) ?
          reg149[(1'h1):(1'h1)] : (^~(reg142 ? wire139 : reg150))))))
        begin
          reg156 <= ($unsigned(wire140[(3'h4):(1'h1)]) | reg141);
          reg157 <= ($unsigned($unsigned($signed(wire137[(2'h2):(2'h2)]))) ?
              reg151 : ($unsigned((reg154 ? (~&reg148) : (reg147 ~^ wire139))) ?
                  $signed($signed($signed(reg150))) : (reg148[(1'h0):(1'h0)] & (|(reg141 ?
                      reg148 : reg146)))));
        end
      else
        begin
          reg156 <= reg141[(5'h10):(3'h6)];
          reg157 <= (~|$signed((wire136 < $unsigned(reg143[(2'h3):(2'h2)]))));
          if (wire140)
            begin
              reg158 <= $signed(reg155[(4'h9):(2'h3)]);
              reg159 <= reg155;
            end
          else
            begin
              reg158 <= (|$signed(reg146));
              reg159 <= wire139[(4'hd):(2'h2)];
              reg160 <= (~&$unsigned(reg145[(1'h1):(1'h1)]));
            end
          if ($unsigned(($unsigned((reg149 ?
                  (reg148 <<< (8'haa)) : $unsigned(reg149))) ?
              (($unsigned(wire135) ? $unsigned(reg149) : $signed(reg154)) ?
                  ($unsigned(reg142) ?
                      $signed(reg155) : ((8'hb5) != reg146)) : ((wire135 ?
                      reg141 : wire139) ^ ((8'hb7) ?
                      wire135 : wire135))) : (~^{(+reg159), $signed(reg158)}))))
            begin
              reg161 <= reg150[(5'h12):(2'h2)];
              reg162 <= $unsigned($unsigned((~(~^$unsigned(reg142)))));
              reg163 <= $signed(($unsigned($unsigned((reg153 << reg151))) ~^ reg146[(4'hb):(4'hb)]));
            end
          else
            begin
              reg161 <= ((((wire139 ?
                      (reg156 ?
                          reg156 : wire140) : reg157) >> reg151) != (^~reg155[(4'hc):(3'h7)])) ?
                  $signed((^wire139[(5'h13):(5'h10)])) : $unsigned((-(-wire136[(3'h6):(3'h4)]))));
              reg162 <= (-((reg163 ~^ ((reg158 ? wire137 : wire139) ?
                  (reg162 && reg151) : ((8'hbe) ?
                      wire135 : reg158))) - $signed({$signed(reg163)})));
              reg163 <= (8'h9f);
              reg164 <= ({reg160[(4'hb):(1'h1)]} ?
                  ({((wire137 ?
                          reg155 : reg148) ~^ wire140[(2'h2):(1'h1)])} > (7'h40)) : (reg154[(2'h3):(1'h0)] ?
                      $unsigned(reg160) : $unsigned((-reg141))));
            end
          reg165 <= $signed((8'hbc));
        end
    end
  always
    @(posedge clk) begin
      reg166 <= reg161[(4'h9):(3'h7)];
      if ($signed($unsigned(reg156[(2'h2):(1'h0)])))
        begin
          reg167 <= wire137;
        end
      else
        begin
          reg167 <= $unsigned({(((reg147 ? reg167 : reg146) & (reg150 ?
                  reg157 : reg167)) << (reg159[(1'h1):(1'h0)] ^ ((8'ha7) ?
                  reg164 : reg152))),
              reg141});
          reg168 <= {wire140,
              (((-$unsigned(reg166)) ?
                      (~(wire135 ? reg141 : reg156)) : reg142) ?
                  reg165[(5'h13):(3'h7)] : $signed(wire138))};
          if (reg165[(5'h13):(4'ha)])
            begin
              reg169 <= $unsigned(reg163);
              reg170 <= (wire136 ?
                  $signed((-(((7'h42) ? wire140 : reg158) ?
                      reg157 : {wire135, reg141}))) : $signed((8'ha4)));
            end
          else
            begin
              reg169 <= (8'hb7);
              reg170 <= (($unsigned($unsigned($signed(reg146))) ?
                  {$signed((reg150 ? reg158 : reg156)),
                      reg141[(4'hd):(3'h7)]} : ($signed((-reg155)) ?
                      (~|{reg159,
                          (8'hb1)}) : (~&{reg168}))) >>> $signed(((((7'h42) ?
                          (7'h42) : reg168) ?
                      reg151 : $signed((8'hbf))) ?
                  ((&reg164) << reg153[(2'h3):(1'h1)]) : (reg159[(2'h2):(2'h2)] < {reg164}))));
              reg171 <= $unsigned($unsigned($signed($unsigned($signed(reg161)))));
            end
          if ({reg150})
            begin
              reg172 <= (&$signed((~|$signed($signed((8'h9f))))));
              reg173 <= ($signed(reg150[(1'h1):(1'h1)]) * $signed((((reg148 ?
                  (8'hb2) : reg151) << (wire138 ?
                  reg155 : reg160)) - ($unsigned((7'h42)) ?
                  reg168 : (&(8'h9f))))));
            end
          else
            begin
              reg172 <= {$signed(($unsigned(reg171) < reg164)), (8'ha2)};
              reg173 <= reg144[(4'ha):(3'h5)];
              reg174 <= (!((reg158[(4'h8):(3'h7)] ?
                  $unsigned($unsigned(reg149)) : ($signed((8'hae)) < reg142[(1'h1):(1'h0)])) <= $unsigned(((^~reg152) + $unsigned((8'hb7))))));
              reg175 <= ({(reg168[(5'h12):(4'hb)] ?
                      $signed(reg173) : (&{(8'hb4), (8'hbe)})),
                  wire136} ^~ ((+(reg150 ~^ $unsigned(reg152))) ?
                  reg169[(4'hc):(3'h5)] : reg142));
            end
          if ($unsigned((({$unsigned(reg175)} <<< $unsigned((8'hba))) <= $signed(reg172[(3'h4):(3'h4)]))))
            begin
              reg176 <= (reg158 * reg166);
            end
          else
            begin
              reg176 <= wire140;
              reg177 <= $signed((($unsigned($signed((8'h9f))) && $unsigned(reg168[(3'h7):(3'h6)])) & ((reg151 >> ((8'hbe) ?
                  (8'ha1) : reg163)) != reg147[(1'h1):(1'h0)])));
            end
        end
    end
endmodule

module module17
#(parameter param125 = ({(8'hbb), {(^~((8'hb4) ? (8'hb2) : (8'haa))), ({(8'hbd), (8'hab)} == ((8'hb9) ? (8'hb3) : (8'hab)))}} - (!(!(((8'haa) ~^ (8'hb7)) ? (^~(8'hb9)) : ((8'hb9) ? (8'ha6) : (7'h43)))))), 
parameter param126 = param125)
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire119,
                 wire118,
                 wire116,
                 wire68,
                 wire66,
                 reg124,
                 reg121,
                 reg120,
                 (1'h0)};
  module22 #() modinst67 (.wire24(wire19), .wire23((8'hbe)), .clk(clk), .wire27(wire18), .wire26(wire21), .wire25(wire20), .y(wire66));
  assign wire68 = wire66[(4'hd):(1'h1)];
  module69 #() modinst117 (.wire71(wire20), .y(wire116), .wire70(wire21), .clk(clk), .wire72(wire66), .wire73(wire68));
  assign wire118 = ({(wire20 ?
                           $signed({wire116}) : ($signed(wire19) ?
                               wire21[(4'hb):(2'h3)] : $signed(wire20)))} <= (wire18 >= $unsigned({wire18[(3'h5):(1'h1)]})));
  assign wire119 = wire116[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg120 <= $unsigned(((^~(!(wire18 >> wire116))) ?
          $unsigned(wire21[(4'ha):(3'h5)]) : (&$unsigned({wire118}))));
      reg121 <= reg120[(2'h2):(1'h1)];
    end
  assign wire122 = $unsigned($unsigned(reg121));
  assign wire123 = $unsigned((wire118 ?
                       $signed((!wire68[(3'h7):(1'h1)])) : $unsigned((wire21 <<< wire119))));
  always
    @(posedge clk) begin
      reg124 <= (8'had);
    end
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  input wire [(5'h13):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg105,
                 reg104,
                 reg103,
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
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= (7'h42);
      reg75 <= wire70[(4'hb):(3'h4)];
      reg76 <= ((~&(^$unsigned((+(8'had))))) ?
          $unsigned(($unsigned(wire70) ?
              ($signed(reg74) <= wire71) : ({wire71,
                  wire70} & wire71[(5'h12):(4'hd)]))) : {($unsigned((wire71 >>> (8'ha1))) ?
                  (~|(wire70 ? (8'h9c) : reg74)) : ((~^wire71) ?
                      wire70[(1'h0):(1'h0)] : (wire70 ^ wire70))),
              (&((reg75 != wire70) != $unsigned(wire72)))});
      reg77 <= (reg76[(1'h0):(1'h0)] ?
          {$signed(($unsigned(wire73) ? reg76 : {wire70}))} : wire72);
      if (wire71[(1'h0):(1'h0)])
        begin
          if (($signed((8'hae)) < wire70[(4'hb):(3'h7)]))
            begin
              reg78 <= wire73;
              reg79 <= (7'h41);
              reg80 <= reg77[(2'h2):(1'h0)];
              reg81 <= wire70;
              reg82 <= ((^~$signed((|$unsigned(reg78)))) ?
                  $signed($signed(((wire73 ? wire70 : reg79) >>> (wire73 ?
                      reg74 : reg75)))) : wire71);
            end
          else
            begin
              reg78 <= reg79[(3'h7):(3'h7)];
              reg79 <= $unsigned((((^reg81) > (^$unsigned(reg82))) ?
                  $unsigned((-reg75)) : ($signed($signed(reg82)) <<< (reg78[(1'h1):(1'h0)] ?
                      $unsigned(wire73) : (reg78 ? wire71 : wire73)))));
              reg80 <= {(&(+$unsigned((wire71 ? reg79 : (8'hb9)))))};
              reg81 <= ((reg78[(1'h1):(1'h0)] ?
                      reg79 : {($unsigned(reg81) ^ $unsigned(wire73)),
                          $signed(reg77)}) ?
                  $unsigned(wire70[(3'h5):(3'h4)]) : reg79[(4'hb):(2'h3)]);
            end
        end
      else
        begin
          reg78 <= wire71;
        end
    end
  always
    @(posedge clk) begin
      if (((wire71[(2'h2):(2'h2)] < reg81) ^ $signed(reg77[(1'h1):(1'h1)])))
        begin
          reg83 <= $signed((^~(^~wire71[(5'h12):(3'h4)])));
          reg84 <= $signed(((((reg78 ?
                      reg77 : reg74) >> wire71[(5'h11):(3'h5)]) ?
                  reg80[(4'he):(1'h1)] : reg82) ?
              $signed({(^(8'had))}) : (reg80 || $unsigned((reg81 ^~ reg83)))));
          if (reg80[(4'he):(2'h3)])
            begin
              reg85 <= $signed(reg75[(3'h4):(1'h1)]);
            end
          else
            begin
              reg85 <= (|$unsigned($signed(reg79[(1'h0):(1'h0)])));
              reg86 <= {reg85[(3'h4):(2'h2)]};
              reg87 <= reg78;
              reg88 <= (reg83[(4'hb):(4'h9)] ?
                  $signed(reg81[(1'h1):(1'h0)]) : $unsigned(((+(reg86 ?
                          reg83 : wire71)) ?
                      reg76[(2'h3):(1'h0)] : $unsigned($unsigned(reg82)))));
              reg89 <= reg76;
            end
          reg90 <= ($unsigned(reg75[(2'h3):(2'h2)]) ?
              reg85 : reg75[(4'h8):(3'h5)]);
        end
      else
        begin
          if ($signed(((wire71[(2'h3):(1'h1)] ?
              (reg74 >= (&(8'hb1))) : $signed(reg87[(1'h0):(1'h0)])) ^ reg89)))
            begin
              reg83 <= $signed(reg89[(2'h3):(2'h2)]);
              reg84 <= $signed($unsigned($signed(wire72[(1'h1):(1'h0)])));
            end
          else
            begin
              reg83 <= (wire71[(4'ha):(3'h4)] ^ ($unsigned($unsigned((reg82 ?
                  (8'ha4) : reg81))) || $unsigned($signed(wire72))));
              reg84 <= reg74[(2'h2):(1'h0)];
            end
        end
      reg91 <= (^~{$signed(($signed((8'hb0)) ? (~&reg82) : (reg78 && (8'haf)))),
          {$signed(reg76[(2'h3):(1'h1)]), reg79[(4'h8):(3'h6)]}});
      if (reg76)
        begin
          reg92 <= reg81;
          reg93 <= (^~{reg86[(3'h4):(1'h1)],
              $signed(($signed((7'h42)) - $unsigned(reg82)))});
          reg94 <= ($unsigned(((8'hb1) ?
                  (reg91 || (+reg74)) : (((8'ha8) ? reg87 : reg88) ?
                      (8'hb5) : $signed(reg90)))) ?
              ({(reg81 ? reg77 : {reg93, reg76}), reg84[(2'h2):(2'h2)]} ?
                  reg87 : $unsigned($unsigned((reg89 ?
                      reg88 : reg80)))) : reg85);
        end
      else
        begin
          reg92 <= (7'h44);
          reg93 <= reg84;
        end
      reg95 <= (reg85[(4'h8):(3'h7)] ~^ {((reg74 <<< {(8'hae),
              reg92}) < {{wire73}, (^~reg87)}),
          (8'ha1)});
    end
  assign wire96 = ((($signed($unsigned((8'hab))) ?
                              reg76[(1'h1):(1'h1)] : {$signed(wire71),
                                  (^~reg91)}) ?
                          (reg90 ?
                              ({reg85} ?
                                  (7'h41) : (+wire70)) : ($unsigned(reg92) ?
                                  (~reg81) : (wire72 ?
                                      reg89 : reg80))) : $signed(((reg88 ?
                              reg90 : wire70) * reg76))) ?
                      ($unsigned(((reg82 ? reg92 : reg74) ?
                              ((8'hbd) ? reg95 : reg74) : $signed(reg95))) ?
                          $signed((reg80 >>> (reg79 >> reg83))) : reg88) : (((reg89[(4'hb):(1'h0)] > $unsigned(reg80)) ?
                          (~^(^~(8'hbb))) : {$signed(reg91)}) * ((|$signed(reg93)) >= reg90[(1'h0):(1'h0)])));
  assign wire97 = reg74;
  assign wire98 = ((~^($unsigned($unsigned(reg82)) >= $signed((wire96 ?
                          (8'haf) : wire70)))) ?
                      wire97[(2'h3):(2'h3)] : reg79);
  assign wire99 = (reg89[(4'h9):(2'h2)] <= ((reg83 + wire70[(4'hc):(3'h6)]) | (8'hb3)));
  assign wire100 = (($unsigned($signed({wire98})) || $signed($unsigned({(8'hb6),
                           reg79}))) ?
                       reg75[(3'h6):(1'h0)] : $unsigned($signed(((8'ha1) ?
                           $signed(reg76) : ((8'ha7) ? (8'hbe) : reg77)))));
  assign wire101 = (({$signed(reg75), (((8'hb5) < wire97) << reg84)} ?
                       reg74 : $unsigned(((~&(8'hba)) ?
                           ((7'h41) & reg78) : (reg83 ?
                               (7'h42) : reg92)))) > $signed(((~(-(8'ha6))) ?
                       (reg94 ^ (^~reg87)) : (((7'h42) && wire99) * ((8'hb2) ?
                           wire71 : (8'hb2))))));
  assign wire102 = reg75[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg103 <= $unsigned((wire98 == $unsigned(((reg81 ? (8'hb5) : wire99) ?
          (reg87 >>> wire98) : (!reg93)))));
      reg104 <= ((reg91 ^ (~&(!$unsigned(reg91)))) == ((^~((reg80 ?
              wire101 : reg93) & (wire99 ? wire99 : wire101))) ?
          reg77[(3'h4):(1'h0)] : $signed($signed(reg91[(3'h6):(1'h0)]))));
      reg105 <= wire73;
    end
  assign wire106 = (reg81 ?
                       (+($signed(reg91) - reg85[(4'h9):(2'h3)])) : ($unsigned((~|(wire96 ?
                               reg86 : reg90))) ?
                           wire102 : reg75));
  assign wire107 = wire102;
  assign wire108 = (reg82[(3'h6):(2'h2)] ?
                       wire97 : $signed((~|({reg79} << (~&reg84)))));
  assign wire109 = wire100[(3'h4):(2'h3)];
  assign wire110 = wire101[(3'h5):(1'h1)];
  assign wire111 = {(reg104 ?
                           wire108[(3'h4):(1'h0)] : $signed($unsigned((-wire108)))),
                       reg84};
  assign wire112 = ({reg93[(2'h2):(2'h2)], reg81[(3'h4):(2'h3)]} ?
                       (|$signed(({wire107,
                           reg88} >> (~|reg92)))) : ((wire72[(3'h7):(3'h6)] + wire99) ?
                           reg77[(2'h2):(2'h2)] : wire107[(4'hc):(2'h2)]));
  assign wire113 = reg84[(1'h1):(1'h0)];
  assign wire114 = $unsigned(wire72[(1'h0):(1'h0)]);
  assign wire115 = ($signed((reg89[(4'ha):(3'h5)] >> $signed(wire109[(1'h0):(1'h0)]))) ?
                       wire70 : reg79);
endmodule

module module22
#(parameter param65 = (8'hba))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire61,
                 wire60,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= wire24;
      if (wire26)
        begin
          reg29 <= (wire24[(2'h2):(2'h2)] ?
              wire24[(1'h1):(1'h1)] : (wire24 & wire26));
          reg30 <= ($unsigned(((+wire24) ?
              (reg29[(4'ha):(2'h2)] ?
                  (reg28 ^~ wire27) : $signed(reg28)) : {$signed(wire23)})) <= $signed(((~&$signed(wire25)) * ($unsigned(reg29) ?
              (-(8'ha7)) : wire25[(4'ha):(3'h4)]))));
          reg31 <= ($signed((~$unsigned((reg28 ^ reg30)))) ?
              wire23[(3'h7):(1'h0)] : (((8'ha6) ?
                      ((wire24 != wire25) ?
                          (wire27 || reg28) : $signed(wire26)) : (wire23[(3'h7):(3'h6)] ?
                          wire25[(3'h4):(3'h4)] : $signed(wire27))) ?
                  $unsigned($signed((reg30 - wire24))) : {$signed({wire24})}));
        end
      else
        begin
          if ($signed(wire24[(1'h0):(1'h0)]))
            begin
              reg29 <= reg30;
              reg30 <= wire25[(4'ha):(3'h5)];
              reg31 <= $signed((reg29 != $unsigned((-(wire23 ?
                  wire23 : wire24)))));
              reg32 <= wire27[(3'h7):(2'h2)];
              reg33 <= wire26[(3'h6):(1'h0)];
            end
          else
            begin
              reg29 <= (((|((!wire26) >> $unsigned(reg31))) && wire24) << (wire25[(1'h1):(1'h1)] ?
                  $unsigned({(^(8'ha1)), $unsigned(wire25)}) : wire23));
            end
          if ($unsigned(wire25[(4'h9):(1'h1)]))
            begin
              reg34 <= (({{(8'hbe)},
                  {wire27[(1'h1):(1'h1)]}} < ($unsigned($signed(reg32)) ?
                  (&wire24[(1'h0):(1'h0)]) : (^~wire26))) << reg28[(3'h4):(2'h2)]);
              reg35 <= (7'h40);
              reg36 <= (|(~^wire26[(2'h3):(1'h0)]));
              reg37 <= ((-$unsigned(((wire25 ? reg32 : reg36) ?
                  {wire23, reg32} : (reg29 && (8'hb6))))) <<< $unsigned(reg35));
              reg38 <= $signed(reg35[(1'h1):(1'h0)]);
            end
          else
            begin
              reg34 <= (~$unsigned(wire24));
              reg35 <= $signed(($signed(($unsigned((8'ha0)) ?
                  reg29[(4'he):(4'h9)] : reg29)) || ((reg36 ?
                      $signed(wire25) : (|wire26)) ?
                  (~|$unsigned(reg38)) : $unsigned(wire27[(1'h0):(1'h0)]))));
              reg36 <= reg28;
              reg37 <= (reg31 >>> ($unsigned({$signed(reg35)}) == $unsigned({{reg28,
                      reg34}})));
            end
          reg39 <= reg35;
        end
      reg40 <= (reg34[(4'he):(4'ha)] ?
          $unsigned(reg38) : ({(^~$signed(reg32))} ?
              $signed(wire27) : (wire23[(4'hd):(4'h9)] ?
                  $signed(reg28) : reg38)));
      reg41 <= (((((reg29 ? (8'hb7) : (8'haf)) ?
                  (reg29 ? reg34 : wire26) : ((8'hb6) ? wire27 : reg30)) ?
              ((|(8'ha8)) + {(8'ha3)}) : (((8'hba) ? reg29 : reg36) ?
                  (reg36 ?
                      (8'haa) : reg40) : (reg31 * reg37))) ^ {((reg30 >> reg39) + reg33)}) ?
          (+(((reg30 >= reg30) ? (~|(8'ha7)) : $signed(reg30)) ?
              $unsigned((reg34 ?
                  reg37 : wire24)) : wire25)) : $unsigned({reg40}));
    end
  assign wire42 = ((reg28[(4'hd):(4'hc)] * ({$signed(reg29)} <= $signed($unsigned(reg41)))) ?
                      reg37 : ((wire25 ? reg32 : reg29) <<< (~&((wire25 ?
                              wire24 : wire25) ?
                          $unsigned(reg34) : $signed(reg30)))));
  assign wire43 = wire27;
  assign wire44 = {reg37[(3'h6):(2'h3)], $unsigned(wire23)};
  assign wire45 = ((($signed($unsigned(wire42)) ?
                          wire25 : $signed(wire43)) | ((!(^reg31)) ?
                          ((!(8'hb1)) ?
                              wire26[(3'h7):(1'h0)] : reg33[(1'h0):(1'h0)]) : $unsigned(wire24[(1'h0):(1'h0)]))) ?
                      reg28[(2'h3):(1'h1)] : (^~reg40));
  assign wire46 = (&{wire26, wire25});
  assign wire47 = (8'ha0);
  assign wire48 = ((wire47 ?
                      $signed((|$signed((8'had)))) : (^~({wire46} ?
                          (~|reg34) : $unsigned(wire44)))) ~^ $signed(reg40));
  assign wire49 = ((wire45[(3'h7):(3'h5)] ?
                          (-(wire47[(4'hb):(1'h0)] ?
                              reg29 : $signed(reg36))) : $signed(reg35[(1'h1):(1'h1)])) ?
                      $signed(wire24) : wire23[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg50 <= wire46;
      reg51 <= $signed(wire47);
      reg52 <= reg51[(1'h0):(1'h0)];
      reg53 <= (reg34 == wire24[(2'h2):(1'h1)]);
      reg54 <= (8'haa);
    end
  assign wire55 = ((8'ha8) ?
                      ($unsigned(((~|wire24) ?
                          $signed(wire48) : reg30[(4'h8):(2'h3)])) | $signed($unsigned((-reg31)))) : reg36);
  assign wire56 = reg40[(5'h10):(5'h10)];
  always
    @(posedge clk) begin
      reg57 <= reg35;
      reg58 <= {wire55};
      reg59 <= (wire24 ^~ ((^~(^(reg50 ? reg37 : reg50))) ?
          $signed($signed($signed((7'h41)))) : {(^{wire56, reg32})}));
    end
  assign wire60 = reg35[(2'h2):(2'h2)];
  assign wire61 = (($signed(((&wire55) ?
                              {(8'h9f), reg36} : $unsigned(wire25))) ?
                          reg35[(1'h1):(1'h1)] : ((~^$signed(wire26)) - $signed((^reg40)))) ?
                      (|{((~|wire27) ? $signed(wire45) : $unsigned(reg40)),
                          (~^(!wire42))}) : ($unsigned(reg57[(2'h2):(2'h2)]) != reg28[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg62 <= $unsigned(wire48[(1'h0):(1'h0)]);
    end
  assign wire63 = wire56[(3'h5):(1'h1)];
  assign wire64 = ({(((|(7'h44)) ?
                              wire63[(1'h0):(1'h0)] : $unsigned(wire61)) != reg57[(2'h2):(1'h1)]),
                          $signed($signed($signed(wire60)))} ?
                      (|(((wire47 ? reg33 : reg62) ?
                          $signed(wire47) : (wire61 && wire24)) | ($unsigned(reg37) ^~ ((8'hb4) ?
                          wire56 : reg41)))) : $unsigned($unsigned(reg32)));
endmodule
