module top
#(parameter param189 = ({((|((8'ha9) >= (8'ha6))) >= (+((8'ha1) | (8'h9d)))), ((((8'h9c) ? (8'hb8) : (8'hb0)) ? ((8'hb4) | (8'hbe)) : (+(8'hb6))) > ((|(8'ha9)) == ((8'ha2) ? (8'hb7) : (8'hab))))} ? (|{(~{(8'haf), (8'hb1)})}) : (((~^(^~(8'ha9))) <<< (((8'ha3) ^~ (8'h9d)) ? (~|(8'hbd)) : {(8'hb0)})) * (~^({(8'h9e), (8'ha6)} - ((8'hb1) <= (8'ha4)))))), 
parameter param190 = (-(|(~&param189))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire185;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire102,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire27,
                 wire62,
                 wire185,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
  always
    @(posedge clk) begin
      reg5 <= $signed($signed((|(8'hac))));
      if ((~^((((reg5 ~^ (8'ha1)) != wire4[(2'h2):(1'h0)]) != (8'hb4)) == wire0[(1'h0):(1'h0)])))
        begin
          reg6 <= {(($unsigned($signed(reg5)) ?
                  $unsigned((^reg5)) : $signed(reg5[(2'h3):(2'h2)])) < (+$unsigned(wire1[(3'h7):(3'h6)]))),
              ((8'hb5) ? $signed(wire2[(4'hc):(1'h1)]) : wire3)};
          reg7 <= $signed(wire2);
          if ((^reg6[(4'h8):(3'h4)]))
            begin
              reg8 <= $unsigned(wire1);
              reg9 <= ($unsigned((~^{(reg6 ? reg8 : reg6), $unsigned(wire3)})) ?
                  wire4[(1'h0):(1'h0)] : (8'haf));
              reg10 <= ($unsigned(($unsigned((reg6 <<< (8'hb4))) ?
                  $unsigned((~^wire4)) : $signed($unsigned(reg5)))) >>> $signed(reg9));
              reg11 <= $unsigned(($unsigned((|(wire0 ?
                  (8'ha5) : (8'ha3)))) >= ($signed((reg10 ? reg8 : wire1)) ?
                  $signed(wire4) : $unsigned($unsigned((8'h9e))))));
              reg12 <= reg7;
            end
          else
            begin
              reg8 <= $signed(wire1[(4'hc):(3'h4)]);
              reg9 <= wire1[(5'h10):(4'h9)];
            end
          reg13 <= (wire3[(3'h4):(1'h1)] ?
              reg9[(4'hb):(3'h5)] : (~|$signed(reg11)));
        end
      else
        begin
          reg6 <= reg12[(5'h11):(3'h4)];
        end
      reg14 <= (wire0 ?
          wire1 : $unsigned($unsigned(((+(8'hbc)) ?
              wire4 : (reg10 ? wire1 : reg8)))));
      reg15 <= wire3;
      if (reg14)
        begin
          reg16 <= {{$unsigned(wire3[(1'h0):(1'h0)]),
                  $signed((~|(reg8 && wire4)))},
              $signed(((!(reg13 | reg10)) ? $unsigned(reg7) : reg14))};
          reg17 <= ({(^~reg6)} != (&reg7[(4'h9):(3'h7)]));
          reg18 <= $unsigned((reg5 ?
              reg10[(3'h6):(1'h0)] : wire4[(3'h4):(1'h1)]));
          reg19 <= reg9[(1'h1):(1'h1)];
        end
      else
        begin
          reg16 <= reg7[(3'h5):(3'h4)];
          if ((^{((~^(wire2 ? wire3 : wire4)) ?
                  $signed(reg7[(3'h4):(3'h4)]) : wire1[(3'h4):(3'h4)]),
              (wire0[(3'h5):(3'h5)] ^~ ({wire3, reg5} >> ((8'ha0) || reg13)))}))
            begin
              reg17 <= ((+$unsigned(($unsigned(reg15) | (-reg18)))) * {reg7,
                  (((reg5 ? reg19 : reg6) ^ reg8) ?
                      (((8'hac) ? reg9 : reg13) ?
                          $signed(reg5) : {reg19,
                              reg5}) : (^~(reg7 << reg12)))});
              reg18 <= (~^reg18[(4'he):(2'h3)]);
              reg19 <= $unsigned(({((~^reg7) > $signed((7'h40)))} << (^(^reg5[(4'hc):(4'h9)]))));
              reg20 <= $unsigned({$signed({reg14}), $unsigned(reg8)});
              reg21 <= (~|reg18[(5'h12):(4'hb)]);
            end
          else
            begin
              reg17 <= (~&(wire3 ? (~^reg6) : reg16[(2'h2):(1'h1)]));
              reg18 <= $unsigned(wire1[(4'hd):(4'h8)]);
              reg19 <= {$signed({($unsigned(reg13) | (wire1 ?
                          reg17 : (8'hb3)))}),
                  (7'h41)};
              reg20 <= (reg13 ?
                  {$unsigned(wire1[(5'h12):(4'hf)])} : (+$signed(({wire1,
                      wire1} > $unsigned(reg9)))));
            end
          if ($unsigned((~&((8'hb8) ?
              $unsigned(((8'h9e) ? reg16 : (8'hb1))) : {(&wire2),
                  (reg14 ? reg16 : (8'hbd))}))))
            begin
              reg22 <= {wire3};
              reg23 <= {reg22[(1'h0):(1'h0)]};
              reg24 <= reg10[(4'h8):(3'h4)];
              reg25 <= (^({($unsigned(reg13) ?
                      $signed(wire0) : reg11[(4'hf):(3'h7)]),
                  reg21[(3'h6):(2'h3)]} ^ $unsigned({$unsigned(reg6),
                  $signed(reg8)})));
              reg26 <= (reg25[(2'h2):(1'h1)] || reg20);
            end
          else
            begin
              reg22 <= (+$signed($unsigned(({wire0,
                  wire0} || $signed(reg17)))));
              reg23 <= (reg18 <= reg16);
            end
        end
    end
  assign wire27 = wire0[(3'h5):(3'h4)];
  module28 #() modinst63 (wire62, clk, wire3, reg24, reg8, reg6, reg18);
  assign wire64 = (~&(8'ha5));
  assign wire65 = wire62;
  assign wire66 = reg7;
  assign wire67 = $signed((8'hb0));
  module68 #() modinst103 (.clk(clk), .wire72(reg6), .wire71(wire62), .y(wire102), .wire70(reg24), .wire69(reg15), .wire73(reg20));
  module104 #() modinst186 (.wire105(wire65), .y(wire185), .clk(clk), .wire108(wire4), .wire106(reg17), .wire107(wire66), .wire109(reg9));
  assign wire187 = reg10[(4'h9):(3'h4)];
  assign wire188 = ((~^{((reg8 & reg8) | reg9)}) * (|reg16[(3'h5):(3'h4)]));
endmodule

module module104
#(parameter param183 = ((~^(^{{(8'ha1), (8'hae)}})) && {(^~(((8'hb8) >> (8'hab)) ? ((8'hb0) <<< (8'ha8)) : ((8'haf) ? (8'h9d) : (7'h44))))}), 
parameter param184 = (~&param183))
(y, clk, wire105, wire106, wire107, wire108, wire109);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire105;
  input wire signed [(4'ha):(1'h0)] wire106;
  input wire signed [(5'h13):(1'h0)] wire107;
  input wire [(4'he):(1'h0)] wire108;
  input wire [(5'h12):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire182;
  wire signed [(4'hd):(1'h0)] wire181;
  wire signed [(3'h6):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire [(5'h15):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire175;
  wire signed [(5'h14):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire149;
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h13):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire153,
                 wire152,
                 wire151,
                 wire149,
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
                 (1'h0)};
  module110 #() modinst150 (.wire114(wire106), .wire111(wire108), .wire112(wire107), .y(wire149), .wire115(wire105), .clk(clk), .wire113(wire109));
  assign wire151 = ($unsigned((~^{wire109})) || $unsigned(wire108));
  assign wire152 = ((~(wire105[(1'h0):(1'h0)] ?
                           (wire109[(4'hf):(4'hb)] ?
                               (wire149 ^~ wire108) : wire149[(3'h4):(1'h1)]) : ((wire107 ?
                                   wire151 : wire109) ?
                               wire109[(4'hb):(2'h2)] : wire149))) ?
                       (wire107[(4'ha):(1'h1)] <<< (wire106 <= (wire106[(3'h5):(1'h1)] - (wire151 ?
                           wire151 : wire109)))) : (&$signed(((~&wire109) | (wire149 ?
                           wire106 : wire151)))));
  assign wire153 = (^$unsigned(((8'hab) ?
                       {wire105[(1'h1):(1'h1)]} : (~$signed(wire151)))));
  always
    @(posedge clk) begin
      reg154 <= wire107;
      if (wire109)
        begin
          reg155 <= (!($unsigned((+wire106[(4'ha):(1'h1)])) << (+wire108)));
          if (((^~reg155) ?
              wire106[(3'h6):(1'h0)] : (wire149 ?
                  {$signed($signed(reg154))} : (-((wire106 ?
                          (8'had) : wire109) ?
                      $unsigned(reg154) : wire105[(1'h1):(1'h1)])))))
            begin
              reg156 <= wire108[(1'h0):(1'h0)];
              reg157 <= reg155;
              reg158 <= wire107[(3'h6):(3'h4)];
              reg159 <= (~&$unsigned(($signed(reg157) < ($signed(reg155) || (^(8'ha1))))));
              reg160 <= {reg154[(4'ha):(1'h0)]};
            end
          else
            begin
              reg156 <= {reg157,
                  (($signed(wire107) * $signed((reg155 ? wire153 : wire149))) ?
                      {$signed((wire106 ? wire153 : (8'hae)))} : (((-reg154) ?
                              (wire152 ?
                                  reg154 : wire149) : $unsigned(wire149)) ?
                          reg157[(1'h1):(1'h0)] : $unsigned((~(7'h44)))))};
            end
        end
      else
        begin
          reg155 <= $signed(reg155[(4'ha):(4'h9)]);
          reg156 <= reg159;
          reg157 <= reg159[(4'h9):(2'h3)];
          reg158 <= reg155;
          if (($unsigned(((^~(reg155 <<< reg160)) ?
              (-$unsigned(wire153)) : ((^~(8'hb7)) ?
                  (wire109 ?
                      wire152 : wire105) : wire149[(2'h3):(2'h3)]))) * $unsigned((-wire153))))
            begin
              reg159 <= {(~|((reg154[(3'h5):(3'h4)] ? (&wire109) : reg156) ?
                      reg155 : reg156[(3'h7):(2'h3)])),
                  $signed((wire109[(5'h12):(3'h4)] >>> $unsigned($signed(reg159))))};
              reg160 <= (wire109[(4'h9):(1'h0)] + $signed((reg154[(1'h1):(1'h0)] ?
                  $signed(reg156) : $signed(wire153))));
              reg161 <= $unsigned($unsigned(($unsigned((wire108 ?
                  wire151 : wire107)) << reg156[(4'hb):(2'h2)])));
              reg162 <= $signed({(-$signed($signed((8'ha5))))});
              reg163 <= wire149;
            end
          else
            begin
              reg159 <= wire105[(1'h1):(1'h1)];
              reg160 <= $signed(wire153);
              reg161 <= ($unsigned($unsigned(((-reg163) ?
                  reg163 : (8'ha3)))) != $signed($signed(({(8'hb1)} << (reg156 ?
                  reg159 : reg154)))));
              reg162 <= ($unsigned(((wire108 ?
                      $unsigned(wire153) : $signed(wire107)) ?
                  reg157 : $unsigned($unsigned(wire107)))) <= (((^reg156) >= reg154[(3'h4):(3'h4)]) ?
                  $unsigned(reg162) : ($signed((reg162 | reg155)) ?
                      wire107[(4'hf):(4'h9)] : ($signed((8'ha2)) ?
                          {wire152, (8'ha7)} : (~^wire151)))));
              reg163 <= reg154;
            end
        end
      reg164 <= (|$unsigned(wire151[(4'ha):(3'h4)]));
      if (({reg164[(5'h13):(4'he)], $signed(reg159)} ?
          ($signed((((8'hb4) == reg160) ~^ (&(8'hab)))) << wire152) : (-$unsigned(reg162))))
        begin
          if ($signed($unsigned(($signed((wire106 * reg162)) ?
              (^wire106) : wire105[(4'hc):(4'hc)]))))
            begin
              reg165 <= reg163;
              reg166 <= wire107;
              reg167 <= wire153;
              reg168 <= ((reg159 ?
                  reg166 : $signed(((-(8'hb2)) ?
                      {(8'ha6), wire106} : $unsigned((8'ha7))))) | (8'hb2));
            end
          else
            begin
              reg165 <= (($signed((~&(reg163 & (8'hab)))) ~^ ((^(~wire109)) ?
                  ((~&(7'h42)) ?
                      $unsigned(wire106) : $unsigned(wire151)) : $unsigned($signed(wire107)))) && {($signed((&reg167)) << ($signed(wire106) ?
                      reg157[(2'h2):(2'h2)] : $unsigned(reg159)))});
              reg166 <= {wire107,
                  $signed((reg158[(3'h4):(2'h2)] ?
                      $unsigned((8'ha8)) : ($signed(wire105) ?
                          wire108 : wire108[(2'h3):(2'h3)])))};
              reg167 <= reg158[(1'h1):(1'h0)];
              reg168 <= (~(~&((^~$unsigned((8'hbd))) ?
                  ((wire152 ? wire149 : (8'hb2)) ?
                      (reg155 ?
                          reg159 : (8'ha8)) : $signed(reg157)) : $signed((reg167 & (8'ha7))))));
              reg169 <= reg156;
            end
          if (reg162)
            begin
              reg170 <= (~^$signed(($signed((~&reg164)) ?
                  reg158[(2'h2):(2'h2)] : ((^~reg155) ?
                      reg167 : $unsigned(wire108)))));
              reg171 <= reg170[(4'h8):(3'h6)];
              reg172 <= ((reg157[(2'h2):(1'h1)] ?
                  $unsigned((|$signed(wire105))) : (!reg162[(3'h7):(2'h2)])) > ((reg156 > $unsigned((reg169 ?
                  wire106 : wire151))) >> ((~(reg165 ?
                  reg161 : reg169)) << {(reg161 ^ (8'hb2)),
                  (reg154 ? (8'hbb) : wire153)})));
              reg173 <= (8'hb0);
            end
          else
            begin
              reg170 <= (({$signed((~(8'hbc))),
                      ($unsigned((8'hb8)) & $signed(reg171))} ^~ (~((reg161 ?
                      reg168 : wire153) != ((8'hb5) ? wire153 : (8'ha6))))) ?
                  (((|wire151[(4'hd):(4'ha)]) - $signed((|reg155))) ?
                      $unsigned(((~|(8'ha2)) != wire151)) : (~|reg158)) : (reg159 == (~&$signed($signed(wire149)))));
            end
          reg174 <= reg168[(3'h7):(1'h1)];
        end
      else
        begin
          reg165 <= (($signed($unsigned(reg170)) >>> $signed((~^(wire106 >= wire152)))) ?
              ($signed(reg161) == (~&$unsigned((reg163 ?
                  reg169 : reg170)))) : $signed((wire107 ?
                  $unsigned(reg168[(4'h8):(3'h4)]) : (~^(reg166 ?
                      wire108 : reg163)))));
        end
    end
  assign wire175 = $unsigned(($unsigned(reg165[(1'h1):(1'h0)]) >= reg167[(4'h8):(3'h6)]));
  assign wire176 = $unsigned(reg158);
  assign wire177 = reg155[(1'h1):(1'h0)];
  assign wire178 = $unsigned(reg160[(3'h6):(3'h6)]);
  assign wire179 = (7'h41);
  assign wire180 = wire178;
  assign wire181 = (reg155 ? {$unsigned(reg171), wire152} : wire108);
  assign wire182 = $unsigned(reg154);
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire signed [(5'h13):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire97;
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  assign y = {wire101, wire100, wire97, reg99, (1'h0)};
  module74 #() modinst98 (wire97, clk, wire72, wire70, wire71, wire69);
  always
    @(posedge clk) begin
      reg99 <= (8'ha9);
    end
  assign wire100 = (wire69 - $unsigned($unsigned($unsigned((!wire69)))));
  assign wire101 = ($unsigned((8'hbf)) ?
                       $signed(((wire97 < (wire73 * wire71)) ?
                           wire72[(4'h8):(3'h7)] : ((wire73 * wire72) ?
                               (wire97 ?
                                   wire69 : wire71) : reg99))) : {{{(&reg99),
                                   (wire73 ^~ wire71)},
                               wire72[(3'h6):(1'h1)]}});
endmodule

module module28
#(parameter param60 = (+(((~|(7'h41)) ? (((7'h42) ? (8'hb7) : (8'ha7)) ? (+(8'h9e)) : ((8'hbf) ? (8'hba) : (7'h43))) : ((8'ha3) ^~ ((8'hb8) || (8'ha4)))) ? {({(8'hb9), (7'h44)} ~^ {(8'hb1)}), ((^(8'hae)) >> (~&(8'hb5)))} : (~^(((8'hbb) ? (8'hbf) : (8'ha6)) + ((8'ha2) ? (8'ha8) : (8'ha1)))))), 
parameter param61 = ({(&(!param60)), (^param60)} ? ((param60 ? ({param60, param60} <<< (param60 ? param60 : param60)) : {param60, (^param60)}) ? (8'hae) : (((param60 & param60) >> {param60}) - ((8'hbf) >> param60))) : {(~param60)}))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire34;
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  assign y = {wire59,
                 wire52,
                 wire51,
                 wire50,
                 wire34,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 (1'h0)};
  assign wire34 = $unsigned($unsigned(({wire32[(2'h2):(2'h2)]} * $signed(wire31))));
  always
    @(posedge clk) begin
      if ($signed(((wire31[(3'h6):(1'h1)] ?
              (wire32 > (wire29 ? (8'ha9) : wire31)) : wire32) ?
          ($unsigned({wire32}) | ((^wire34) ?
              wire31 : wire33)) : $unsigned(wire31))))
        begin
          if (wire33[(2'h3):(1'h1)])
            begin
              reg35 <= $unsigned(wire33);
              reg36 <= (~&($unsigned(wire29[(3'h6):(1'h1)]) ^ $signed((~^$signed(wire29)))));
              reg37 <= (((reg36 ?
                          reg36 : (wire29[(5'h10):(3'h4)] ?
                              wire31[(3'h5):(3'h5)] : (&wire32))) ?
                      (wire29 == (~(~|(8'haa)))) : $signed($unsigned(wire29))) ?
                  (-((8'haf) ?
                      wire30 : (wire30[(5'h15):(4'hc)] ?
                          (^wire31) : {wire30}))) : (!{wire32[(1'h0):(1'h0)]}));
              reg38 <= (|$signed((+$signed($signed(reg37)))));
            end
          else
            begin
              reg35 <= (^(~wire32));
              reg36 <= ($unsigned($unsigned($signed({reg35}))) * $unsigned((((8'ha2) ?
                      {reg36, reg36} : wire31[(3'h6):(2'h3)]) ?
                  reg37[(1'h0):(1'h0)] : (^~$unsigned(wire34)))));
              reg37 <= wire33;
              reg38 <= $unsigned($signed((8'hb8)));
              reg39 <= $signed($signed(($signed((^~wire34)) - wire30[(4'h8):(1'h1)])));
            end
          if (reg36[(3'h4):(1'h0)])
            begin
              reg40 <= wire33[(4'hd):(4'hd)];
              reg41 <= (&wire34[(4'h8):(3'h6)]);
              reg42 <= $unsigned(reg39[(4'he):(4'h8)]);
              reg43 <= reg42;
              reg44 <= $unsigned(reg43);
            end
          else
            begin
              reg40 <= (reg37 && ($unsigned((~$unsigned(reg36))) + reg39[(3'h4):(2'h3)]));
              reg41 <= wire32[(2'h3):(1'h1)];
              reg42 <= (~|($signed(($signed(reg43) <= (~|(8'ha3)))) >= (($signed(wire32) ?
                      $unsigned(wire31) : reg35) ?
                  ((~|wire34) ?
                      $signed(wire31) : $unsigned(reg43)) : $unsigned(((7'h40) ?
                      reg40 : reg43)))));
            end
          reg45 <= ($signed($unsigned((reg36 ? (reg44 ~^ (8'hab)) : {reg38}))) ?
              reg35[(1'h0):(1'h0)] : (~&(~|(8'hb6))));
        end
      else
        begin
          reg35 <= (wire30 ?
              $unsigned((^$signed((!reg45)))) : $unsigned(((-((8'ha4) ^ reg44)) ?
                  $signed($unsigned(reg36)) : reg40[(5'h12):(4'h8)])));
        end
      reg46 <= reg44;
      reg47 <= $unsigned((+$signed($signed({reg35}))));
      if ({(+(reg46 ? $signed($unsigned(wire31)) : (^~reg39))), reg43})
        begin
          reg48 <= $signed($signed(reg46));
        end
      else
        begin
          reg48 <= ((~$signed(reg42[(1'h1):(1'h0)])) ?
              (($unsigned($unsigned((7'h40))) ?
                      {reg38[(4'hb):(4'ha)], {reg38}} : reg48) ?
                  reg46[(2'h2):(2'h2)] : $signed($unsigned((8'ha9)))) : {(^~reg38[(2'h3):(1'h0)]),
                  reg37[(3'h7):(3'h5)]});
        end
    end
  always
    @(posedge clk) begin
      reg49 <= ((^wire32[(2'h2):(1'h1)]) <= (($signed(reg44[(4'h8):(3'h4)]) ~^ ($unsigned((7'h42)) ?
              (+reg43) : reg41[(4'he):(4'hc)])) ?
          ($unsigned((8'ha9)) && reg40) : {(8'h9f), reg40}));
    end
  assign wire50 = (reg42 < {(&$unsigned((reg48 ? reg44 : wire30)))});
  assign wire51 = {($unsigned(reg43[(3'h4):(3'h4)]) * $unsigned($signed(((8'haa) <<< wire33)))),
                      $signed(($unsigned((reg47 ? reg36 : (8'haf))) ?
                          reg37 : ($signed(wire33) & (reg39 <<< reg41))))};
  assign wire52 = $unsigned($signed(reg44));
  always
    @(posedge clk) begin
      reg53 <= ((-$unsigned(({wire33, wire34} != (reg49 ? reg39 : reg35)))) ?
          $unsigned($unsigned($signed((reg43 && wire50)))) : reg48);
      if ((reg37 <<< ($unsigned($unsigned(wire32[(1'h0):(1'h0)])) && {($signed((8'hbf)) && $unsigned(wire31)),
          $unsigned((!(8'hab)))})))
        begin
          reg54 <= reg39;
          reg55 <= $signed(reg42);
          reg56 <= ($signed(wire51) + ($unsigned($signed((reg38 == (7'h40)))) || $unsigned(reg44[(3'h4):(1'h0)])));
          reg57 <= (reg41 & $unsigned({(8'hbd)}));
        end
      else
        begin
          reg54 <= (-$unsigned(reg48));
          reg55 <= reg54[(4'he):(4'h9)];
          reg56 <= $signed(wire52[(3'h6):(1'h1)]);
          reg57 <= reg39;
        end
      reg58 <= (^~(^~(~{reg57[(4'h8):(1'h0)]})));
    end
  assign wire59 = $signed({(|wire34),
                      $unsigned((^~((8'hbd) ? reg37 : reg39)))});
endmodule

module module74
#(parameter param95 = (^(+(({(8'hb8), (8'ha9)} ? ((8'ha5) ? (8'hb2) : (8'ha2)) : ((8'hab) ? (8'hbb) : (8'h9e))) && (((8'hb2) == (8'hb6)) <<< ((7'h40) ? (8'hb1) : (8'hab)))))), 
parameter param96 = (~param95))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire78;
  input wire signed [(3'h5):(1'h0)] wire77;
  input wire [(4'h9):(1'h0)] wire76;
  input wire signed [(3'h7):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  assign y = {wire94,
                 wire92,
                 wire91,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg93,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire79 = wire75;
  assign wire80 = wire79;
  assign wire81 = ($signed(($unsigned((wire75 ?
                      wire77 : wire76)) <= {$signed(wire75)})) < (wire76 != $signed(wire75)));
  assign wire82 = (-$signed($signed($unsigned(wire77[(2'h2):(1'h1)]))));
  assign wire83 = ($signed($signed(($unsigned(wire77) - {wire82}))) ^ (wire78 ?
                      (&((wire82 ? wire76 : wire79) || {wire81,
                          wire82})) : (((wire78 >> wire81) ?
                          (wire81 << wire76) : (wire79 << wire76)) && ((wire77 ?
                              wire81 : wire82) ?
                          (wire79 <= wire82) : wire78))));
  assign wire84 = $signed((|$unsigned((wire79 ?
                      $unsigned(wire77) : {wire79, wire75}))));
  assign wire85 = ((!({$signed(wire84)} ?
                          {(^~wire75)} : (wire83[(4'h8):(3'h6)] + (&wire79)))) ?
                      ((8'hb6) ?
                          (-{$signed(wire76),
                              wire78}) : {$unsigned({wire76})}) : $signed((wire79 >= wire77[(3'h5):(3'h4)])));
  always
    @(posedge clk) begin
      reg86 <= (wire78 && {((|wire76[(2'h2):(2'h2)]) ?
              $signed($unsigned(wire77)) : (8'hbd)),
          $unsigned((~&wire76[(4'h8):(1'h0)]))});
    end
  always
    @(posedge clk) begin
      if ((($signed({wire81}) ~^ wire78[(4'ha):(4'h9)]) ?
          $signed($unsigned(wire80[(2'h2):(2'h2)])) : $unsigned((wire77[(1'h0):(1'h0)] ^~ {$signed(wire77)}))))
        begin
          reg87 <= reg86[(1'h0):(1'h0)];
          if (((~|{wire77[(1'h1):(1'h0)],
              $signed($unsigned(wire81))}) ^~ (!wire75)))
            begin
              reg88 <= $signed((~|(^~wire81[(4'ha):(2'h3)])));
              reg89 <= (-(reg86[(1'h0):(1'h0)] ?
                  (~|((wire77 ? wire75 : wire76) ?
                      $unsigned(wire82) : {reg88,
                          wire77})) : ((wire77[(1'h0):(1'h0)] + (wire83 ?
                          (7'h40) : wire76)) ?
                      $signed({wire75,
                          wire82}) : $unsigned((wire85 >= (7'h42))))));
            end
          else
            begin
              reg88 <= (|(-((wire76 | $unsigned(wire78)) ?
                  $unsigned(((8'had) >= wire76)) : $signed((reg87 <<< (7'h43))))));
              reg89 <= ((~(8'hb3)) != $signed($unsigned((~&(wire79 ?
                  reg89 : reg86)))));
            end
          reg90 <= (|$unsigned(wire79));
        end
      else
        begin
          reg87 <= reg90[(1'h0):(1'h0)];
        end
    end
  assign wire91 = wire85;
  assign wire92 = (((($unsigned(wire85) ?
                              (wire83 ?
                                  reg90 : wire80) : reg89[(1'h0):(1'h0)]) ?
                          ((+reg88) != (8'hbe)) : wire75[(1'h1):(1'h0)]) ?
                      wire78 : (^~$signed((~&wire82)))) <= (8'haf));
  always
    @(posedge clk) begin
      reg93 <= reg86;
    end
  assign wire94 = $signed(wire81);
endmodule

module module110
#(parameter param148 = (+{(|((~&(8'ha2)) ? ((8'hb2) ? (8'hb3) : (8'hb0)) : ((7'h41) * (8'haf))))}))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire115;
  input wire signed [(2'h3):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  input wire [(5'h13):(1'h0)] wire112;
  input wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire141,
                 wire140,
                 wire138,
                 wire137,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire117,
                 wire116,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire116 = (~^((wire111 <<< ({wire115} ?
                       $unsigned(wire115) : wire115)) <= wire112[(4'hd):(4'hb)]));
  assign wire117 = $signed((((|$signed(wire111)) ^~ $unsigned($unsigned(wire112))) ?
                       $unsigned((wire116[(3'h6):(1'h0)] ?
                           (~&wire116) : (wire111 ?
                               wire116 : wire114))) : $unsigned(wire115)));
  always
    @(posedge clk) begin
      if (($signed(wire114) ? (!$unsigned((8'haa))) : wire116))
        begin
          if (wire111[(1'h1):(1'h1)])
            begin
              reg118 <= wire115;
            end
          else
            begin
              reg118 <= {wire113[(2'h3):(2'h3)]};
            end
          if ((wire113 ?
              ((wire114 ? (8'hb3) : reg118) ?
                  (~^(((7'h40) ~^ wire111) > (~(8'hb9)))) : wire114[(1'h1):(1'h1)]) : $signed(reg118[(4'hf):(4'ha)])))
            begin
              reg119 <= $unsigned(wire112);
              reg120 <= (wire113[(3'h4):(2'h2)] ?
                  ((((wire112 <<< reg119) > reg118[(3'h4):(2'h2)]) ?
                          wire112 : (~&wire113)) ?
                      $unsigned($unsigned(reg118[(3'h7):(2'h2)])) : $signed(wire111)) : $unsigned($unsigned(wire117[(3'h6):(1'h1)])));
            end
          else
            begin
              reg119 <= reg120[(1'h1):(1'h0)];
              reg120 <= ((8'haa) <= $signed(wire116));
              reg121 <= {$unsigned($unsigned(((|wire114) ?
                      (reg118 - reg119) : ((8'ha3) || wire113)))),
                  (+$unsigned($signed(((8'hbf) ? wire117 : wire112))))};
            end
        end
      else
        begin
          reg118 <= {$unsigned(($unsigned(reg119) ?
                  $unsigned(wire112) : ((reg119 && wire115) ?
                      wire112 : reg118)))};
        end
    end
  assign wire122 = $signed((wire114 >> (+wire116[(3'h4):(2'h3)])));
  assign wire123 = ($signed((+((wire117 ? wire111 : wire112) ?
                       $signed(wire111) : (wire117 ?
                           (8'hb8) : wire122)))) >= (8'had));
  assign wire124 = wire112;
  assign wire125 = ((({((8'hac) ? (8'hbf) : reg120),
                           $signed(wire123)} >= wire122[(2'h3):(2'h3)]) || (reg121 <= ({wire123} ^ {wire111}))) ?
                       $unsigned(reg121) : ((~((&wire115) ?
                           ((8'ha8) <= wire124) : (~&wire112))) != $unsigned(wire114[(1'h1):(1'h1)])));
  assign wire126 = $unsigned($signed($signed($signed((~|wire124)))));
  assign wire127 = {$unsigned($signed(wire126[(3'h5):(1'h0)]))};
  assign wire128 = {($unsigned((&reg120)) >= $unsigned(wire126[(3'h5):(1'h0)])),
                       (8'haf)};
  always
    @(posedge clk) begin
      if ($signed({reg118[(4'h9):(3'h7)]}))
        begin
          reg129 <= (((((|wire117) ?
                      (wire127 & reg118) : $signed(wire112)) >> ($signed(reg121) ^~ wire116)) ?
                  $signed((~^(wire124 <= (8'ha4)))) : wire123[(5'h13):(5'h11)]) ?
              (($unsigned((^wire126)) >> ($unsigned(wire126) ^~ $signed(wire116))) ?
                  $unsigned($signed({wire113})) : reg120) : wire112[(2'h2):(1'h0)]);
          reg130 <= (!(!wire127));
          reg131 <= reg121;
          reg132 <= (((((wire125 + wire113) >= (8'hbd)) && $signed((-reg130))) + (wire113 * (+(!reg130)))) << ({(~^wire125[(4'hb):(4'h8)])} >>> (-$signed(wire125[(5'h11):(4'h8)]))));
          if ((((((reg121 ~^ wire114) ? $signed((8'hac)) : wire125) ?
                      $signed($unsigned(wire123)) : {(reg118 ?
                              wire115 : wire128),
                          ((8'hab) >= reg132)}) ?
                  {((~^reg121) ?
                          $unsigned(wire114) : (wire111 != reg118))} : (8'hbd)) ?
              ($unsigned((~reg119)) ?
                  ($unsigned((wire126 <<< wire126)) ?
                      $signed((reg121 ? wire127 : wire128)) : $signed((wire113 ?
                          (8'ha7) : reg132))) : $unsigned(reg120[(1'h0):(1'h0)])) : ((wire111[(3'h4):(1'h1)] ?
                  wire116 : $signed({wire113})) <= $signed($unsigned(wire125[(4'hf):(4'h9)])))))
            begin
              reg133 <= (^~($unsigned((reg118[(3'h6):(3'h4)] ?
                      (&wire128) : $unsigned(reg130))) ?
                  wire124 : (((wire125 ? (8'ha8) : wire112) ?
                          wire112[(4'h9):(1'h0)] : wire127[(3'h7):(1'h1)]) ?
                      (wire112[(5'h11):(1'h1)] ?
                          wire128 : wire126[(3'h5):(3'h5)]) : ((wire114 ?
                              wire111 : (8'ha6)) ?
                          (&wire111) : $signed((8'ha8))))));
              reg134 <= ((((~(^wire125)) || ({wire128, (7'h43)} ?
                  (-reg131) : ((8'hbe) ?
                      wire113 : wire116))) & (8'hac)) != $signed($unsigned(wire128[(4'hf):(4'hf)])));
            end
          else
            begin
              reg133 <= wire126[(3'h4):(1'h1)];
              reg134 <= ({reg130[(3'h7):(3'h4)],
                      $signed(((reg121 >>> wire112) ?
                          (reg129 > wire112) : reg130))} ?
                  $signed({((wire122 ? (8'ha2) : wire115) ?
                          wire111[(3'h7):(3'h7)] : wire127[(4'h9):(4'h8)])}) : (~(~|(reg130[(3'h5):(1'h1)] >= (wire123 * reg132)))));
              reg135 <= reg132;
            end
        end
      else
        begin
          reg129 <= $signed($unsigned(((wire122[(4'h8):(2'h2)] ?
                  (&reg133) : $unsigned((8'h9e))) ?
              ((8'hb9) ^~ {wire113, wire112}) : (~((8'hba) ?
                  reg134 : reg118)))));
          reg130 <= {(^~reg119)};
          if ($unsigned(((((+reg120) + (wire114 ? wire126 : wire122)) ?
                  $signed($signed(wire112)) : (reg130 ~^ $signed((8'hbe)))) ?
              $unsigned((~&(8'hb7))) : wire125[(3'h5):(3'h4)])))
            begin
              reg131 <= $unsigned(wire125[(4'h8):(2'h3)]);
              reg132 <= wire126;
            end
          else
            begin
              reg131 <= ((((^wire117[(1'h0):(1'h0)]) & $signed(reg121[(4'hc):(2'h3)])) >>> reg132) == ($signed(((wire126 ?
                      wire116 : wire127) ?
                  wire117[(1'h1):(1'h1)] : reg120)) ~^ (~reg135)));
            end
          if ($unsigned((-reg131)))
            begin
              reg133 <= ($unsigned(reg133[(3'h6):(1'h1)]) ?
                  $unsigned($signed($signed(reg118[(2'h2):(2'h2)]))) : reg121[(4'hc):(2'h2)]);
            end
          else
            begin
              reg133 <= reg132;
              reg134 <= (wire112[(4'hd):(4'h8)] ?
                  (~&(reg121[(3'h4):(2'h3)] ?
                      ($signed(reg129) ?
                          $signed(reg135) : $unsigned(reg118)) : {(wire124 <<< wire117),
                          (~|(8'ha9))})) : ({$unsigned({reg121}),
                      (8'h9c)} * wire123[(1'h0):(1'h0)]));
              reg135 <= (^~reg121[(3'h7):(3'h4)]);
            end
          reg136 <= (-($signed(reg119) ?
              ((~^wire117[(3'h7):(3'h4)]) ^~ $signed((wire113 ?
                  (8'ha3) : reg120))) : $signed((((8'hac) | wire113) ?
                  {wire124} : ((8'ha3) ~^ (8'ha6))))));
        end
    end
  assign wire137 = (wire116 & (&(~((^reg118) || wire124[(2'h3):(1'h0)]))));
  assign wire138 = reg136;
  always
    @(posedge clk) begin
      reg139 <= reg133[(3'h4):(3'h4)];
    end
  assign wire140 = reg131;
  assign wire141 = ({(~$signed((reg139 ? wire113 : reg135)))} ?
                       $signed(((~reg139) ?
                           $signed($signed(reg130)) : ($signed(wire116) + $unsigned(reg139)))) : (($unsigned((wire124 ?
                           wire123 : reg132)) <= $unsigned($signed(reg131))) || wire115[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg142 <= $unsigned((wire113[(4'hc):(3'h7)] ^ wire114));
      reg143 <= reg118[(4'ha):(3'h5)];
      reg144 <= (reg131[(1'h0):(1'h0)] | $unsigned(reg139));
      reg145 <= $signed(reg134);
    end
  assign wire146 = ($signed($signed(($signed(wire117) ?
                       {reg145,
                           wire122} : reg133[(2'h2):(1'h1)]))) > (-(reg139 << $signed($signed(reg132)))));
  assign wire147 = (~^($signed(((|(7'h44)) ?
                           wire137[(4'h8):(2'h2)] : $signed(reg133))) ?
                       (~&(8'ha7)) : (~^(reg144[(2'h2):(1'h0)] ?
                           $signed(wire138) : $signed(wire146)))));
endmodule
