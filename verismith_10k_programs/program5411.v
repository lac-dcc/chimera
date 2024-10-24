module top
#(parameter param207 = (8'h9c), 
parameter param208 = (8'hb8))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire205;
  wire [(4'hb):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire202;
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire5,
                 wire6,
                 wire202,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire5 = ($signed(($unsigned($unsigned(wire0)) ?
                         wire1 : ((wire1 - wire3) << (~wire2)))) ?
                     ((~&(|(wire1 ?
                         wire4 : wire0))) | ((-(wire3 ^ wire2)) << ((~(8'hb3)) - (^wire2)))) : wire4);
  assign wire6 = (|(($signed(((8'hbe) >= wire0)) ?
                         $signed(wire1[(4'hb):(3'h4)]) : ({wire2} - wire2[(5'h10):(4'hb)])) ?
                     ((+$unsigned(wire0)) ?
                         (&{wire2, wire2}) : wire5) : wire0));
  always
    @(posedge clk) begin
      reg7 <= wire3[(5'h13):(3'h7)];
      reg8 <= ((&(wire1 || wire1)) ?
          $unsigned(({wire5, wire0[(1'h0):(1'h0)]} ?
              (reg7[(4'hb):(1'h0)] >> (wire2 < wire2)) : wire1[(5'h11):(4'hf)])) : wire1);
      if ((($signed((wire6 >> reg7)) >= $unsigned(((reg8 ? (8'hab) : reg8) ?
              $unsigned(wire6) : wire1))) ?
          (~&$unsigned(($unsigned(reg8) <<< $unsigned(reg7)))) : ((|wire2) <<< ((&(wire2 ^~ (8'hbe))) ?
              (|(-wire1)) : (&(wire1 ? wire0 : reg7))))))
        begin
          reg9 <= wire4[(4'hb):(4'ha)];
          reg10 <= (((wire5[(3'h4):(2'h3)] ?
                  reg9[(4'ha):(2'h2)] : (7'h43)) <= reg9) ?
              {wire3[(4'he):(1'h1)]} : wire0);
          reg11 <= ((wire5[(3'h5):(2'h2)] ?
              ({((8'haa) ? wire3 : reg8),
                  (~(7'h44))} >>> wire5) : $signed(reg10[(3'h5):(1'h0)])) && ($unsigned(((^reg9) ?
                  (wire2 << (8'had)) : (+wire6))) ?
              ($unsigned($unsigned(wire0)) ?
                  reg8[(5'h12):(4'h9)] : $signed((wire6 | reg10))) : (&({(8'haa)} ~^ wire1))));
          reg12 <= (8'had);
          reg13 <= reg7;
        end
      else
        begin
          reg9 <= ((&$unsigned(reg13)) ?
              (wire6 ?
                  (~^reg8) : {wire6[(4'hf):(4'hf)]}) : wire1[(2'h3):(2'h2)]);
          reg10 <= {$unsigned(((^~(^~wire0)) ?
                  ((+(8'hbd)) ? $signed(wire6) : (reg7 <= wire4)) : (+{wire0,
                      wire5}))),
              reg13[(2'h2):(1'h1)]};
          reg11 <= (^(-{wire1[(3'h5):(3'h4)]}));
        end
      reg14 <= reg10;
    end
  module15 #() modinst203 (wire202, clk, reg7, reg9, wire3, reg12, reg10);
  assign wire204 = reg14[(2'h3):(1'h0)];
  module15 #() modinst206 (.wire16(wire4), .wire20(reg14), .wire19(reg7), .y(wire205), .wire18(reg12), .wire17(wire6), .clk(clk));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire194;
  wire signed [(3'h5):(1'h0)] wire192;
  wire [(3'h4):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire136;
  reg [(5'h14):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(4'hd):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  assign y = {wire194,
                 wire192,
                 wire156,
                 wire147,
                 wire146,
                 wire140,
                 wire138,
                 wire53,
                 wire21,
                 wire55,
                 wire68,
                 wire69,
                 wire99,
                 wire115,
                 wire117,
                 wire136,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg139,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 (1'h0)};
  assign wire21 = $unsigned((7'h42));
  module22 #() modinst54 (wire53, clk, wire21, wire19, wire17, wire20, wire16);
  assign wire55 = wire19;
  always
    @(posedge clk) begin
      reg56 <= ((($unsigned($signed(wire20)) ?
                  wire53[(4'hc):(2'h3)] : $signed($unsigned(wire55))) ?
              wire53 : wire18[(3'h7):(2'h2)]) ?
          (^~$unsigned($unsigned(wire18[(3'h6):(2'h3)]))) : ((8'hae) ^ ($unsigned(wire53[(1'h0):(1'h0)]) ^~ wire17)));
      if ($signed({{$signed(wire21[(4'hf):(4'hf)]),
              (wire55[(3'h5):(3'h4)] != reg56)}}))
        begin
          if ($signed(wire21))
            begin
              reg57 <= ({($signed($signed(wire16)) ?
                      ((wire16 || wire55) >= {(7'h44), reg56}) : {wire20,
                          {wire55}}),
                  $signed(wire21[(4'ha):(2'h3)])} ^~ (^~(wire20[(4'ha):(4'ha)] & $unsigned($signed(wire19)))));
              reg58 <= wire21;
              reg59 <= ($unsigned((|($unsigned(wire17) ?
                  {wire16} : $unsigned(wire20)))) ^ ((((wire17 >= wire55) ?
                      $unsigned(reg56) : (wire18 ? wire16 : wire53)) ?
                  wire20 : {(wire16 != reg57),
                      wire21[(1'h0):(1'h0)]}) & (reg58 > $unsigned(wire53[(3'h7):(1'h0)]))));
              reg60 <= (($signed($unsigned((~|wire21))) ^~ (wire19[(4'hc):(1'h0)] ?
                      $unsigned(wire21[(3'h5):(1'h1)]) : wire55[(4'h8):(2'h2)])) ?
                  (-$signed($unsigned((wire16 != wire53)))) : wire55[(3'h5):(1'h0)]);
            end
          else
            begin
              reg57 <= ((wire17[(2'h2):(2'h2)] > (-$unsigned($unsigned(reg58)))) >= $unsigned(wire18));
              reg58 <= reg58;
              reg59 <= wire18;
              reg60 <= wire21;
              reg61 <= $signed($signed((((~&reg60) ?
                      $signed(wire17) : reg60[(4'hd):(2'h3)]) ?
                  $signed(wire21[(4'hd):(4'hb)]) : ({wire53} ?
                      $unsigned(reg56) : wire16))));
            end
        end
      else
        begin
          reg57 <= $unsigned((^(^{(wire55 ? wire55 : (7'h44)),
              reg57[(3'h7):(3'h7)]})));
          reg58 <= (wire20 ?
              $signed(($unsigned((wire20 ?
                  wire55 : wire55)) + wire21)) : $signed({{(reg60 * wire21)}}));
        end
      reg62 <= $signed((^(wire53 << (-(wire17 + reg59)))));
      if (reg60[(3'h7):(3'h7)])
        begin
          reg63 <= reg59[(2'h3):(2'h2)];
          reg64 <= wire21[(4'h8):(3'h5)];
        end
      else
        begin
          if (wire17[(2'h3):(2'h3)])
            begin
              reg63 <= (((((wire21 ?
                  wire53 : (8'hb0)) | (wire55 != wire20)) * (^~(wire17 ?
                  wire53 : wire55))) >> {$unsigned($unsigned(reg58))}) >= (reg61[(5'h11):(4'hf)] || {(&((8'ha9) ?
                      reg58 : wire20)),
                  $signed(reg63[(4'hb):(4'h8)])}));
              reg64 <= $signed((reg63[(4'ha):(3'h4)] ?
                  (((reg61 || reg61) ?
                      wire21[(1'h1):(1'h0)] : $unsigned(reg61)) && wire55[(3'h7):(2'h3)]) : $signed({wire19[(2'h2):(1'h1)],
                      (reg58 << (8'haf))})));
              reg65 <= (($unsigned((reg56 ?
                      reg58[(2'h3):(2'h3)] : wire17[(2'h2):(1'h1)])) >> $signed(reg57[(3'h6):(2'h3)])) ?
                  $signed(($unsigned(reg57[(3'h7):(3'h7)]) * (8'hb3))) : ((~&((reg57 ?
                          reg64 : wire16) ?
                      (wire21 ? wire20 : wire55) : ((8'ha2) ?
                          reg56 : wire17))) - ((^~(reg56 >= reg64)) >> $signed($signed((8'hb9))))));
              reg66 <= (wire16[(3'h4):(1'h0)] >> wire20);
              reg67 <= {(reg64 ~^ ($signed(reg56[(3'h5):(1'h0)]) >= ((^~reg66) ?
                      $signed(wire55) : (-(8'ha0)))))};
            end
          else
            begin
              reg63 <= wire20[(4'h8):(1'h0)];
              reg64 <= (|reg62[(2'h3):(1'h1)]);
              reg65 <= ((8'hae) ^~ (reg66 ~^ $unsigned({$signed((8'hbc))})));
            end
        end
    end
  assign wire68 = ($unsigned(({(^wire20)} ?
                      (wire16 >> (-reg67)) : $signed(reg60))) ^ reg61[(4'hf):(4'hc)]);
  assign wire69 = reg58;
  module70 #() modinst100 (wire99, clk, reg63, wire53, reg56, wire18);
  module101 #() modinst116 (wire115, clk, wire69, reg67, wire68, reg62);
  assign wire117 = $unsigned($unsigned({(~^$unsigned((8'hab)))}));
  module118 #() modinst137 (.wire122(reg64), .y(wire136), .clk(clk), .wire119(reg66), .wire120(wire18), .wire123(wire17), .wire121(wire117));
  assign wire138 = reg57;
  always
    @(posedge clk) begin
      reg139 <= $unsigned($unsigned(wire68));
    end
  assign wire140 = wire115;
  always
    @(posedge clk) begin
      reg141 <= ($unsigned((((reg62 ?
              reg59 : wire69) ^~ wire117[(2'h3):(1'h0)]) ?
          (~&$unsigned(reg64)) : ((~^(8'h9c)) ?
              $signed((8'hae)) : (reg58 + wire140)))) + ((&(!$unsigned(wire16))) ?
          reg57 : (+wire17[(1'h0):(1'h0)])));
      reg142 <= $unsigned($unsigned(reg63[(5'h12):(5'h10)]));
      reg143 <= ({$unsigned(wire21)} + ($unsigned((8'h9c)) - wire20[(3'h4):(1'h0)]));
      reg144 <= (((8'hbb) >= $signed($unsigned(wire18[(3'h5):(3'h5)]))) < $unsigned($signed($signed((reg60 ?
          reg57 : wire68)))));
      reg145 <= ((reg65[(3'h6):(1'h0)] ?
              wire140 : ((wire68[(3'h5):(2'h2)] - {(8'ha3), (8'haa)}) ?
                  $signed((wire117 || wire99)) : $signed($signed((7'h44))))) ?
          (~^(wire20 >> $unsigned(wire20[(4'hf):(4'he)]))) : (8'hb7));
    end
  assign wire146 = ($signed((^~((wire17 == wire17) ? (~reg56) : (8'hae)))) ?
                       (wire115[(4'h9):(4'h9)] <= (wire99 << $unsigned((~^(8'hbd))))) : (reg139[(4'h9):(3'h5)] <<< ({(wire16 != reg139),
                           ((8'ha6) || wire136)} >= ((wire20 || (8'hbf)) * wire53[(4'hc):(2'h3)]))));
  assign wire147 = wire18;
  always
    @(posedge clk) begin
      reg148 <= $signed(((wire20[(5'h10):(3'h6)] <= reg66) ?
          $signed(($signed(wire146) > (wire147 ?
              reg145 : (8'ha4)))) : (({(8'haa), reg65} ?
              $unsigned((8'haa)) : {(8'hbd)}) <= $signed(wire117[(2'h3):(1'h0)]))));
      reg149 <= (reg142 ?
          (wire117 ? reg67 : $unsigned($signed((wire146 ~^ wire146)))) : reg58);
      if ((($unsigned({(~|wire138)}) ^~ (+$unsigned((~|reg57)))) ?
          $unsigned({$signed(wire146),
              $unsigned($signed(reg143))}) : wire19[(4'hc):(3'h4)]))
        begin
          reg150 <= wire16[(4'h9):(3'h7)];
          if (((~^{(~|reg64)}) >= (8'ha9)))
            begin
              reg151 <= reg56;
            end
          else
            begin
              reg151 <= reg148;
              reg152 <= ({$signed($signed((reg59 >> reg58)))} ?
                  ($unsigned(wire19[(3'h5):(2'h3)]) && $unsigned($signed((wire117 ?
                      wire147 : wire115)))) : (($unsigned(reg65) ?
                      (~$unsigned(wire21)) : (((8'hb5) ~^ wire55) ^~ {reg148,
                          wire20})) ~^ wire147));
              reg153 <= (~^(reg63[(4'hc):(4'ha)] ~^ (~&((wire68 & reg65) != (8'ha8)))));
            end
          reg154 <= $signed((~|wire53));
          reg155 <= wire69[(4'ha):(1'h1)];
        end
      else
        begin
          reg150 <= wire18[(3'h6):(3'h6)];
          if ((&(wire55 ?
              ($unsigned(reg148[(2'h3):(1'h1)]) ?
                  {(8'hbc)} : $unsigned((reg59 ?
                      wire68 : reg155))) : ((~$signed(wire21)) ?
                  (-$signed(reg58)) : $signed(reg151[(3'h4):(1'h0)])))))
            begin
              reg151 <= (^~(wire138[(2'h3):(1'h0)] ?
                  wire138[(1'h0):(1'h0)] : $unsigned($unsigned(wire19[(3'h4):(1'h1)]))));
              reg152 <= {(-{$signed(wire117), (8'ha2)}),
                  ((wire55 & reg139[(4'he):(4'he)]) ?
                      $unsigned(($unsigned(reg143) | $unsigned((8'ha3)))) : (($unsigned(wire16) ?
                              (wire69 && wire55) : {reg144, reg143}) ?
                          (reg153[(1'h1):(1'h0)] ?
                              (wire18 ?
                                  reg142 : wire16) : reg56[(1'h0):(1'h0)]) : {wire16[(2'h2):(2'h2)]}))};
              reg153 <= ($unsigned((((wire146 && (8'hbb)) ?
                      (~reg61) : wire16[(4'hb):(2'h2)]) ?
                  (&$unsigned(reg141)) : wire18[(3'h7):(3'h6)])) | (((~^reg155[(1'h0):(1'h0)]) ?
                      wire19[(1'h0):(1'h0)] : (~&$unsigned(wire55))) ?
                  (~&(^(&reg66))) : reg154[(2'h3):(2'h2)]));
              reg154 <= {({wire136[(4'hd):(4'hb)],
                          ($signed(wire20) == (|reg151))} ?
                      ($unsigned($unsigned(wire21)) ^ reg67[(3'h6):(2'h3)]) : (~|($signed(reg142) + $signed(reg63)))),
                  (({$unsigned(reg56), (wire138 >>> reg141)} - (+(^~(8'had)))) ?
                      reg62 : reg56)};
            end
          else
            begin
              reg151 <= (reg60[(4'h9):(3'h6)] ?
                  wire17[(1'h0):(1'h0)] : {$signed($signed((wire138 ?
                          wire53 : wire53)))});
            end
          reg155 <= $unsigned((~^$signed(((wire20 >>> reg145) | (wire99 ?
              reg62 : wire147)))));
        end
    end
  assign wire156 = ((((^$unsigned(reg145)) ?
                               (~(reg148 ?
                                   wire117 : (7'h42))) : ($signed(reg149) ?
                                   {reg59} : $unsigned(wire136))) ?
                           (-(~&(~^(8'hbe)))) : reg151) ?
                       ((|((reg145 == reg65) ?
                               (reg150 <<< reg62) : (reg139 >>> wire53))) ?
                           (wire18 || ((wire69 ? reg61 : (8'ha5)) ?
                               (reg155 ?
                                   reg56 : reg67) : reg141[(1'h1):(1'h1)])) : reg142[(1'h1):(1'h0)]) : (^~wire146));
  module157 #() modinst193 (.wire161(wire18), .clk(clk), .wire158(wire136), .wire160(reg145), .wire162(reg150), .y(wire192), .wire159(reg58));
  assign wire194 = wire16[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg195 <= reg143;
      reg196 <= (((!wire117) - ({(wire99 ? reg145 : reg62),
              $unsigned((8'hb9))} ?
          ((reg150 >= reg154) ^ (reg139 <<< reg57)) : ((reg154 ?
                  wire117 : wire115) ?
              $signed(wire69) : $unsigned((8'had))))) ~^ ((((~reg63) ?
              (!reg155) : (~&reg57)) & reg57) ?
          wire147[(1'h0):(1'h0)] : (~&$unsigned((reg61 ? wire115 : wire140)))));
      if (({$signed((|$unsigned(reg153))),
          $signed(($unsigned(wire17) ?
              (wire21 ?
                  reg148 : wire99) : $signed(reg57)))} << wire53[(1'h1):(1'h1)]))
        begin
          reg197 <= ({{(wire68[(4'h8):(3'h4)] + (wire69 <= wire68)),
                      ((wire194 ? reg67 : reg155) >= reg67)}} ?
              $unsigned((~((wire147 | reg143) ?
                  (reg141 + reg67) : reg141))) : $signed(wire136[(5'h14):(4'he)]));
        end
      else
        begin
          reg197 <= ($signed($signed(reg67[(2'h3):(1'h0)])) <<< (reg139 ^~ $unsigned($signed(reg150))));
          reg198 <= (!(reg197 && ((^~(wire18 >= wire21)) != ((!reg62) ?
              reg66[(2'h3):(1'h0)] : (~|reg145)))));
        end
      if ((8'hb1))
        begin
          reg199 <= (((~{reg141}) ?
                  $signed((!{reg66, reg142})) : reg62[(4'he):(1'h0)]) ?
              (wire146[(4'hd):(2'h3)] ~^ {reg65,
                  ((^~(8'had)) ? reg196 : reg57[(1'h0):(1'h0)])}) : reg198);
          reg200 <= (8'ha2);
        end
      else
        begin
          reg199 <= (|(~|$unsigned((8'h9d))));
          reg200 <= (|$signed((^~(~&(reg198 >= (8'h9c))))));
        end
      reg201 <= (~|{($unsigned((^wire18)) ? {reg196[(1'h1):(1'h0)]} : reg62)});
    end
endmodule

module module157
#(parameter param191 = ((((&(!(8'hb7))) >>> ((^~(8'ha2)) | ((8'hb0) - (8'hbf)))) ? ((~&(~&(8'hbd))) <= ((~|(8'hae)) != {(8'hbd), (8'h9d)})) : {(8'ha3), ((|(7'h44)) ? (~^(8'ha7)) : ((8'ha2) >>> (8'ha8)))}) ? ((~^{((7'h42) ? (8'ha0) : (8'h9f))}) | ((((8'hb1) ? (8'ha8) : (8'hab)) ? ((8'ha5) ? (7'h41) : (8'hbd)) : ((8'h9c) <= (8'h9e))) ? (((8'h9c) <<< (8'hbe)) <<< {(8'hbe), (8'hbb)}) : (((8'haa) >= (8'haa)) * ((8'hb9) >> (7'h43))))) : ((^{(&(8'hb9))}) ? (~^({(8'hab), (8'hac)} < (8'hb6))) : (&((8'hab) ? (-(8'ha2)) : (~(8'ha4)))))))
(y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire162;
  input wire signed [(4'hb):(1'h0)] wire161;
  input wire [(2'h2):(1'h0)] wire160;
  input wire signed [(5'h10):(1'h0)] wire159;
  input wire [(3'h4):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire190;
  wire [(4'ha):(1'h0)] wire181;
  wire signed [(3'h7):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire163;
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(4'h9):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(4'hf):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg165 = (1'h0);
  assign y = {wire190,
                 wire181,
                 wire164,
                 wire163,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg180,
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
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire163 = (8'hb4);
  assign wire164 = (-$unsigned($unsigned(wire160[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire162[(4'hb):(4'hb)])
        begin
          reg165 <= $signed((wire161[(4'h8):(3'h7)] ?
              (~&wire160[(2'h2):(1'h0)]) : {wire159,
                  $unsigned($unsigned(wire161))}));
          reg166 <= reg165;
          reg167 <= (((((reg165 < wire158) ?
                  (wire158 ? (8'hb9) : reg166) : reg165[(5'h10):(3'h6)]) ?
              $unsigned(((8'ha1) ?
                  wire159 : reg165)) : $signed($signed(reg166))) < wire162[(4'hc):(4'h9)]) >>> {wire160[(1'h0):(1'h0)],
              {wire162[(4'ha):(3'h6)]}});
          reg168 <= $signed($signed((($signed(wire162) ?
                  $unsigned((8'ha7)) : {reg167, wire164}) ?
              ((~^reg166) != (~^wire164)) : wire164[(3'h6):(3'h5)])));
          reg169 <= $unsigned(($unsigned(wire164[(3'h4):(1'h0)]) ?
              (8'hbd) : reg167[(3'h4):(1'h0)]));
        end
      else
        begin
          reg165 <= (((reg167[(4'h8):(3'h5)] | $signed((reg169 ?
              wire163 : wire162))) > ((~&((8'hae) ?
              wire164 : (7'h41))) && $signed($signed(wire163)))) * {(8'hb4),
              wire158[(1'h1):(1'h1)]});
          if ($signed(wire159[(4'hb):(3'h4)]))
            begin
              reg166 <= {$unsigned(wire162[(1'h0):(1'h0)]),
                  ($unsigned((wire163[(2'h2):(2'h2)] < reg168[(3'h4):(3'h4)])) ?
                      (8'ha6) : $signed((-$signed(reg168))))};
              reg167 <= ((^~($signed(((8'hba) > (8'hb5))) ?
                      $signed(reg168) : $unsigned(reg165[(1'h0):(1'h0)]))) ?
                  wire161 : ($signed((-(reg165 ?
                      reg167 : wire162))) << wire162[(3'h6):(2'h3)]));
              reg168 <= $unsigned(wire162[(4'he):(3'h4)]);
            end
          else
            begin
              reg166 <= (~&$unsigned((~^wire163[(3'h6):(2'h3)])));
              reg167 <= $signed((|((8'ha6) && wire163[(2'h3):(1'h1)])));
              reg168 <= ($signed((~(^(wire163 <= reg167)))) != $signed(reg167));
              reg169 <= ($signed({wire164,
                  (reg167[(5'h11):(3'h6)] + reg169[(1'h0):(1'h0)])}) || (8'hb9));
              reg170 <= wire162[(4'ha):(3'h5)];
            end
          reg171 <= (~|$unsigned($unsigned($unsigned((wire164 * (8'hac))))));
        end
      reg172 <= $signed(reg168);
      reg173 <= wire162;
      if ($signed($signed(reg168[(3'h4):(2'h2)])))
        begin
          reg174 <= $unsigned(wire160);
          reg175 <= $unsigned({(wire158 ? (7'h40) : reg169), wire161});
        end
      else
        begin
          reg174 <= ($signed($unsigned(reg171)) ?
              (wire162 | (8'hbf)) : $unsigned(((~&reg168) ?
                  reg172[(4'h8):(1'h1)] : $signed((wire163 ?
                      reg167 : wire158)))));
          reg175 <= ((~&wire164) * (8'hbf));
          reg176 <= (-reg175[(3'h4):(1'h1)]);
        end
      if ((wire163 + (~&$unsigned(wire159))))
        begin
          reg177 <= (wire158[(1'h0):(1'h0)] ?
              $unsigned(wire163[(3'h4):(1'h1)]) : ($signed((^$signed(reg173))) && $unsigned(reg169[(1'h1):(1'h1)])));
          reg178 <= reg176;
          reg179 <= ((-$unsigned({(reg168 ?
                  wire164 : wire163)})) && $signed(((-reg178) ?
              wire162[(4'he):(1'h1)] : (^(^~wire164)))));
          reg180 <= (wire161[(3'h4):(1'h1)] >= wire160[(1'h0):(1'h0)]);
        end
      else
        begin
          reg177 <= reg168;
        end
    end
  assign wire181 = ((!(~|(wire159 && (~&wire164)))) ?
                       ($unsigned((+$unsigned(wire163))) ~^ {{{reg173,
                                   wire162}}}) : reg180);
  always
    @(posedge clk) begin
      reg182 <= {reg180};
      reg183 <= ($signed($unsigned((-reg177))) <<< reg176);
      reg184 <= $signed(wire160[(1'h1):(1'h1)]);
      if ((~$signed(reg170)))
        begin
          reg185 <= wire181[(2'h3):(1'h1)];
          if ((+reg185))
            begin
              reg186 <= (($signed({(reg179 * reg178), reg168}) | (reg177 ?
                      $unsigned($signed(reg174)) : reg176[(4'h9):(1'h1)])) ?
                  {(!$signed({reg174, wire164}))} : wire158[(2'h3):(2'h2)]);
              reg187 <= $unsigned((reg179 ? reg171[(3'h5):(3'h4)] : (-reg168)));
            end
          else
            begin
              reg186 <= $unsigned({$signed($signed(wire181))});
              reg187 <= {reg177[(4'hc):(1'h1)]};
            end
          reg188 <= reg168[(3'h7):(1'h1)];
        end
      else
        begin
          reg185 <= (~|reg170);
          reg186 <= (reg167[(4'hc):(1'h1)] ? (!reg177[(4'he):(2'h3)]) : reg165);
          reg187 <= $signed(reg175[(3'h7):(1'h0)]);
          reg188 <= ((8'hbc) ?
              ((~&{((8'hb8) ? reg178 : reg180), wire158}) ?
                  {((^reg174) ?
                          (wire164 ?
                              reg177 : (8'hb6)) : {(8'hbf)})} : reg169) : reg180);
        end
      reg189 <= ($signed($signed($signed(reg166[(3'h4):(2'h2)]))) ^ (reg183[(1'h1):(1'h0)] << $signed(($unsigned(wire159) ?
          $signed(reg165) : reg173))));
    end
  assign wire190 = (reg189[(2'h3):(2'h2)] > $unsigned({$unsigned((reg166 > reg178))}));
endmodule

module module118
#(parameter param135 = ({(|(((8'ha6) >> (8'hb9)) | (8'ha0)))} ? (8'haa) : ((-(((8'h9c) ? (8'ha2) : (8'had)) ? (~|(8'hba)) : ((8'hbf) ? (8'hbd) : (8'ha7)))) ? (((!(8'haa)) ? ((8'h9e) ? (8'ha6) : (8'hba)) : (~(8'hbf))) ? (8'ha7) : (((8'hbf) ~^ (8'h9c)) <<< (8'ha7))) : (~|(~(8'hab))))))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire123;
  input wire signed [(5'h14):(1'h0)] wire122;
  input wire [(3'h5):(1'h0)] wire121;
  input wire [(2'h2):(1'h0)] wire120;
  input wire signed [(3'h4):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire124;
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 reg125,
                 (1'h0)};
  assign wire124 = (($unsigned(wire121) ?
                           (^~(wire121[(3'h5):(1'h1)] - $unsigned((8'ha6)))) : wire120[(1'h0):(1'h0)]) ?
                       wire119[(1'h1):(1'h0)] : wire119);
  always
    @(posedge clk) begin
      reg125 <= wire119;
    end
  assign wire126 = ((wire121[(3'h5):(1'h1)] ?
                           wire123 : (($unsigned(wire124) << reg125[(1'h1):(1'h1)]) != ($signed(reg125) ?
                               (wire121 ?
                                   wire121 : wire120) : $unsigned(wire120)))) ?
                       $unsigned(wire124) : (^($signed((wire123 > wire119)) ?
                           {$unsigned(wire124)} : wire119[(1'h0):(1'h0)])));
  assign wire127 = wire121[(3'h4):(2'h3)];
  assign wire128 = $unsigned(($unsigned($signed((wire121 + reg125))) + wire122[(5'h14):(3'h7)]));
  assign wire129 = (+(({$unsigned(wire121)} ?
                       $unsigned({wire124}) : wire121[(3'h4):(2'h3)]) < ($signed((wire123 ?
                       (7'h42) : wire123)) ~^ ($signed(wire126) >> (8'haf)))));
  assign wire130 = ((8'hbf) ?
                       $unsigned($signed($unsigned((8'hb8)))) : (!((8'hb0) < wire127[(2'h2):(2'h2)])));
  assign wire131 = (~^(wire124[(4'hf):(3'h7)] | ($unsigned(wire128[(2'h2):(2'h2)]) ?
                       wire120 : ((wire121 != wire120) <<< $signed(wire119)))));
  assign wire132 = ((+$unsigned(wire121)) == wire121[(2'h3):(1'h0)]);
  assign wire133 = $signed(wire130[(4'hf):(3'h5)]);
  assign wire134 = ((wire121 ?
                       $unsigned($unsigned((8'ha2))) : wire128[(1'h1):(1'h0)]) + reg125[(2'h2):(2'h2)]);
endmodule

module module101
#(parameter param114 = (((((&(8'h9c)) ? (~|(8'haf)) : ((8'haf) * (8'hb5))) ? ((^~(7'h42)) + (~|(8'hac))) : (((8'hbd) - (7'h44)) & (&(8'hb9)))) >>> {(((8'hb7) != (8'hb8)) - (~^(8'hb8)))}) >> (((!(~|(8'hbf))) ? (((8'hb4) ~^ (8'ha9)) ? ((8'ha0) & (8'ha8)) : ((8'haf) >= (8'ha4))) : (((8'hba) ? (8'h9e) : (7'h44)) ? (~&(8'hbe)) : ((8'hb4) ? (8'hb3) : (8'had)))) == ((|((8'hab) < (8'haa))) ? ((&(8'h9e)) ? ((8'hb4) ? (8'ha7) : (8'ha8)) : ((8'hb3) ? (8'h9d) : (8'hbb))) : ({(8'hbe)} ? (^~(8'ha9)) : ((8'hab) ? (8'h9c) : (8'hbf)))))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire105;
  input wire [(3'h6):(1'h0)] wire104;
  input wire signed [(5'h10):(1'h0)] wire103;
  input wire signed [(4'he):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 (1'h0)};
  assign wire106 = wire105[(1'h0):(1'h0)];
  assign wire107 = (+$signed(((8'ha8) ? wire105 : ({(8'hb5)} >>> (|(8'haf))))));
  assign wire108 = (~&($signed(((wire106 ? wire103 : wire107) <<< (wire107 ?
                           (7'h41) : wire102))) ?
                       (wire103 ?
                           ({wire106, wire104} ?
                               (wire104 ?
                                   wire102 : wire103) : $signed(wire104)) : $unsigned($signed(wire103))) : (~^((+wire104) ?
                           $signed(wire107) : {wire107, wire105}))));
  assign wire109 = (!(~$unsigned(wire106[(3'h5):(3'h4)])));
  assign wire110 = ({$signed({(7'h44), ((8'haf) ? wire108 : (7'h41))})} ?
                       wire108[(4'hb):(4'hb)] : wire104);
  assign wire111 = {($unsigned($signed($unsigned(wire104))) ?
                           wire106[(1'h0):(1'h0)] : wire104),
                       $signed($signed((wire107[(4'hc):(4'hb)] ?
                           $unsigned((8'ha2)) : wire107)))};
  assign wire112 = ($signed((8'hbd)) <= $unsigned((&(^~$signed(wire105)))));
  assign wire113 = (wire103[(4'hc):(3'h7)] ? wire104 : (|wire102));
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  input wire [(4'hd):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg83,
                 (1'h0)};
  assign wire75 = wire74;
  assign wire76 = ($signed(wire74[(3'h7):(3'h5)]) ? wire74 : wire72);
  assign wire77 = (&({((wire73 == wire73) ? wire76[(4'ha):(3'h5)] : {wire74}),
                      {wire74[(4'hb):(3'h4)]}} > $unsigned(wire73[(5'h10):(5'h10)])));
  assign wire78 = (~&$unsigned((wire74[(4'hb):(4'h9)] != wire71[(1'h1):(1'h0)])));
  assign wire79 = (^(wire73 + (8'hbe)));
  assign wire80 = ($unsigned($unsigned(wire72[(2'h2):(1'h1)])) > $unsigned($unsigned((-$unsigned(wire75)))));
  assign wire81 = (^~wire76);
  assign wire82 = (7'h44);
  always
    @(posedge clk) begin
      reg83 <= wire71[(3'h5):(3'h5)];
    end
  assign wire84 = $signed({wire76[(4'hc):(4'h8)]});
  assign wire85 = (wire84 ? wire80 : wire73);
  assign wire86 = $unsigned(({($signed(wire85) ?
                              wire71[(2'h3):(2'h2)] : $unsigned(wire73)),
                          (wire78 ? wire76 : $unsigned(wire73))} ?
                      reg83[(1'h0):(1'h0)] : wire82[(2'h2):(1'h1)]));
  assign wire87 = wire81[(1'h1):(1'h1)];
  assign wire88 = ((~|(((wire71 <<< wire87) ^~ $unsigned(wire80)) ^ (~|wire71[(1'h0):(1'h0)]))) ?
                      wire78 : (((+(wire79 >> (7'h43))) ?
                          {wire76[(1'h1):(1'h1)],
                              reg83[(1'h0):(1'h0)]} : wire81) <<< ((^~(+(8'ha2))) ?
                          wire74 : ($unsigned(reg83) == (wire77 ?
                              wire76 : wire79)))));
  assign wire89 = {({((^~(8'hb5)) >>> $signed(wire84))} + ($signed($unsigned((8'haf))) ?
                          $signed(wire84[(2'h2):(1'h0)]) : ((~reg83) ?
                              $signed(wire85) : wire78))),
                      ((wire79 ? $unsigned({wire79}) : wire78[(1'h0):(1'h0)]) ?
                          {wire75, (&$signed(wire71))} : $unsigned(((+wire79) ?
                              $unsigned(wire79) : {wire74, (8'ha1)})))};
  assign wire90 = (&$unsigned((((wire77 << (8'hbc)) + wire73) || ($signed(wire71) == $unsigned(wire84)))));
  always
    @(posedge clk) begin
      reg91 <= wire88;
      reg92 <= (~&(~|wire89[(3'h5):(1'h1)]));
      reg93 <= {{(8'hbb),
              (wire74 ? $signed((^(8'hb9))) : $signed(reg91[(3'h7):(3'h6)]))},
          $signed($unsigned(reg91[(3'h7):(2'h2)]))};
      reg94 <= wire78[(4'hc):(3'h5)];
    end
  assign wire95 = $unsigned(wire80);
  assign wire96 = ((~^wire88) <= $signed(wire85));
  assign wire97 = ((8'hb3) <<< (wire75[(3'h6):(1'h0)] ~^ wire90));
  assign wire98 = (wire80[(4'ha):(3'h6)] ^ wire86);
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire28 = ($unsigned(wire26[(3'h4):(2'h2)]) & wire24);
  assign wire29 = $signed(wire23[(1'h0):(1'h0)]);
  assign wire30 = {wire24[(2'h2):(1'h1)]};
  assign wire31 = wire29[(3'h6):(3'h5)];
  assign wire32 = $unsigned(wire27);
  assign wire33 = (((&(((8'ha5) ?
                          wire25 : (8'hb4)) && wire28)) ^~ $unsigned(((wire27 ?
                              wire23 : wire29) ?
                          (wire29 && wire32) : {wire29}))) ?
                      wire27 : wire28[(2'h2):(1'h1)]);
  assign wire34 = $signed(({$unsigned((wire23 ? wire23 : wire31)),
                          (wire26 == wire26)} ?
                      $unsigned($signed((wire30 ?
                          wire27 : wire26))) : $signed(((wire28 ?
                          wire33 : (7'h41)) * wire33))));
  assign wire35 = {$unsigned(wire34[(3'h6):(2'h3)]),
                      (wire27[(4'ha):(1'h0)] == wire31)};
  assign wire36 = (($signed($unsigned(wire33)) ?
                      ((wire23 ? $unsigned(wire35) : $unsigned((8'hb8))) ?
                          {wire27} : (wire33 ^~ (~^wire24))) : $unsigned($signed(wire34[(2'h3):(2'h2)]))) - (!(~|$unsigned($unsigned((8'had))))));
  assign wire37 = {wire36,
                      ($unsigned(wire29[(2'h2):(2'h2)]) || $unsigned($unsigned(wire23[(3'h6):(1'h1)])))};
  assign wire38 = ($signed($signed(wire26[(3'h6):(3'h4)])) ?
                      ($signed($signed($signed(wire35))) ?
                          wire25 : {wire34[(5'h12):(4'he)]}) : $unsigned((~wire30[(4'hd):(4'ha)])));
  assign wire39 = (((8'hbf) & (~&$signed((wire32 ? (8'hb7) : wire25)))) ?
                      (wire31[(3'h5):(1'h1)] != (~$signed($unsigned((8'hb4))))) : ($signed($unsigned((wire30 ?
                          wire29 : wire25))) >>> (($signed(wire37) | ((8'haf) ^ wire23)) >= wire26[(2'h3):(2'h3)])));
  assign wire40 = (8'ha6);
  always
    @(posedge clk) begin
      reg41 <= ($unsigned(wire26) >>> wire32[(1'h1):(1'h1)]);
      reg42 <= $unsigned({$unsigned($unsigned((wire39 >= (8'hb4)))), wire38});
    end
  assign wire43 = ($signed((|(^(reg41 ? wire26 : wire40)))) ?
                      $unsigned(wire27[(4'h8):(3'h4)]) : (wire36 - wire32));
  assign wire44 = {{wire29[(3'h4):(1'h1)], {wire36, wire40[(2'h2):(2'h2)]}}};
  assign wire45 = $unsigned((^~$unsigned($unsigned(((8'haa) && wire34)))));
  assign wire46 = $unsigned(wire28);
  always
    @(posedge clk) begin
      reg47 <= (8'ha7);
      reg48 <= $unsigned(wire27);
      reg49 <= ({wire30[(3'h5):(3'h5)],
          (|$unsigned($signed(wire35)))} ^~ reg48);
      reg50 <= {wire28,
          {(wire37[(2'h2):(2'h2)] * ($unsigned(reg41) ?
                  reg47 : {wire36, wire34})),
              $unsigned((^~{wire27, wire25}))}};
    end
  assign wire51 = $unsigned(reg41[(1'h0):(1'h0)]);
  assign wire52 = (+(-{((wire28 ? reg42 : wire34) ^~ wire33[(4'h8):(4'h8)]),
                      $signed((~wire27))}));
endmodule
