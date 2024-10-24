module top #(parameter param227 = (8'haa)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire226;
  wire signed [(3'h7):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire207;
  wire signed [(3'h4):(1'h0)] wire206;
  wire [(2'h3):(1'h0)] wire193;
  wire [(4'ha):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire191;
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg224 = (1'h0);
  reg [(4'hc):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg222 = (1'h0);
  reg [(2'h2):(1'h0)] reg221 = (1'h0);
  reg [(5'h14):(1'h0)] reg220 = (1'h0);
  reg [(3'h6):(1'h0)] reg219 = (1'h0);
  reg [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(4'ha):(1'h0)] reg217 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg212 = (1'h0);
  reg [(3'h5):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(4'hb):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  assign y = {wire226,
                 wire208,
                 wire207,
                 wire206,
                 wire193,
                 wire117,
                 wire105,
                 wire104,
                 wire4,
                 wire102,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire135,
                 wire191,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg133,
                 reg134,
                 (1'h0)};
  assign wire4 = (+wire3[(1'h0):(1'h0)]);
  module5 #() modinst103 (.wire10(wire3), .clk(clk), .wire8(wire2), .wire9(wire1), .wire6(wire0), .wire7(wire4), .y(wire102));
  assign wire104 = {wire0[(4'hc):(4'h8)]};
  assign wire105 = ((wire2 == $unsigned((|(wire4 ^~ wire2)))) > $signed(wire104[(3'h4):(2'h2)]));
  module106 #() modinst118 (.wire111(wire105), .wire107(wire1), .y(wire117), .clk(clk), .wire108(wire0), .wire109(wire102), .wire110(wire2));
  always
    @(posedge clk) begin
      reg119 <= wire105[(2'h3):(1'h1)];
      if (wire117)
        begin
          reg120 <= {($unsigned((^~wire102)) > (&wire3)),
              ($unsigned(wire102) ? $signed(wire104) : (-(!wire105)))};
        end
      else
        begin
          reg120 <= wire4;
        end
      if ((^$signed(($signed({wire2, wire0}) ?
          $unsigned($signed(reg120)) : {wire4}))))
        begin
          reg121 <= (8'ha1);
          if ((wire1 ?
              $signed(($unsigned((^wire117)) >> (!wire1))) : (~&wire1[(4'h8):(2'h3)])))
            begin
              reg122 <= wire3;
              reg123 <= ($unsigned(($unsigned((reg119 ?
                  (8'hb7) : wire117)) ~^ ({wire117} ?
                  $unsigned(wire0) : $signed(wire105)))) | ($signed(({wire102,
                      wire2} ?
                  (reg121 ? wire104 : wire117) : {wire1})) << (!wire0)));
              reg124 <= (($signed(((^~(8'hb4)) != wire1)) >= (reg122[(3'h4):(1'h1)] ?
                  $signed($unsigned((8'hbc))) : $signed(wire4))) * ($signed({((7'h43) ?
                          wire104 : wire105),
                      reg120[(3'h5):(2'h2)]}) ?
                  reg123 : reg121[(1'h1):(1'h1)]));
              reg125 <= reg121[(1'h0):(1'h0)];
              reg126 <= $unsigned({$unsigned($signed(wire3)),
                  ((+$signed((8'hb7))) == (wire105[(4'ha):(2'h3)] < $signed(reg122)))});
            end
          else
            begin
              reg122 <= wire104;
              reg123 <= (8'h9c);
            end
        end
      else
        begin
          reg121 <= $unsigned($unsigned((^(~&(~&reg124)))));
          if (wire105[(2'h3):(1'h0)])
            begin
              reg122 <= wire0[(4'hc):(1'h0)];
              reg123 <= (~&(($unsigned((reg121 ? (8'hbe) : reg126)) ?
                      ((wire104 * reg124) & reg124) : reg121) ?
                  $unsigned($signed((wire102 >> wire104))) : reg119[(2'h2):(1'h1)]));
              reg124 <= wire117[(2'h2):(2'h2)];
              reg125 <= reg124[(1'h1):(1'h1)];
            end
          else
            begin
              reg122 <= $unsigned({($unsigned((reg123 + wire4)) ?
                      $unsigned(((8'hbf) - (8'h9e))) : $unsigned((reg121 ?
                          wire3 : reg120))),
                  reg124});
              reg123 <= {(^$signed({(7'h42)})),
                  ($signed($signed($signed((8'ha4)))) ?
                      (&(reg120[(3'h4):(2'h2)] ?
                          ((8'hac) ?
                              (8'ha8) : wire117) : (^~wire105))) : wire105)};
              reg124 <= $signed($unsigned(($unsigned((wire117 + wire105)) <= reg121[(1'h1):(1'h1)])));
            end
        end
    end
  assign wire127 = $signed(wire2);
  assign wire128 = (((wire0 >> ($signed(reg123) <<< (&reg120))) | (+reg126)) >= reg122[(1'h0):(1'h0)]);
  assign wire129 = {(wire4 ?
                           (|((~&wire127) ?
                               (wire4 ?
                                   reg119 : wire117) : (^wire128))) : $unsigned(wire4[(4'h8):(3'h5)]))};
  assign wire130 = wire0[(4'ha):(2'h3)];
  assign wire131 = $unsigned(reg119);
  assign wire132 = (&(-(reg121[(1'h1):(1'h0)] ?
                       (~&reg120[(4'h8):(1'h0)]) : wire131)));
  always
    @(posedge clk) begin
      reg133 <= (7'h44);
      reg134 <= reg124[(1'h1):(1'h0)];
    end
  assign wire135 = $unsigned($unsigned(reg125));
  module136 #() modinst192 (wire191, clk, reg126, reg121, reg134, wire105);
  assign wire193 = {$unsigned(((wire131 ?
                           $signed(reg125) : (reg120 != wire104)) > $unsigned(wire131[(4'h9):(4'h8)]))),
                       wire128};
  always
    @(posedge clk) begin
      reg194 <= wire105;
      if ((|(reg119[(1'h1):(1'h1)] ?
          (wire130 ? reg134 : wire130) : ($unsigned((wire4 ?
                  (8'hbf) : wire130)) ?
              {{(8'ha8), (8'ha0)}} : $unsigned((~^wire135))))))
        begin
          reg195 <= reg122[(3'h4):(2'h3)];
          reg196 <= $signed(((|(8'hb7)) ?
              {wire117[(3'h6):(1'h0)],
                  wire117[(1'h1):(1'h1)]} : (~$unsigned(wire4))));
          if ($unsigned($signed(($signed(reg126) - ((7'h42) ^~ $signed(reg123))))))
            begin
              reg197 <= wire104;
              reg198 <= (+($signed((8'hab)) ? reg121[(4'ha):(3'h7)] : (7'h43)));
            end
          else
            begin
              reg197 <= wire102[(4'ha):(2'h2)];
              reg198 <= reg133[(2'h3):(1'h1)];
            end
          reg199 <= (wire135 ?
              (($signed($signed(reg124)) + reg198[(3'h6):(1'h1)]) ^~ ((8'hb3) > $unsigned(reg119[(1'h0):(1'h0)]))) : (7'h44));
        end
      else
        begin
          reg195 <= ((wire128 ?
                  ((!$unsigned(reg120)) >> reg119[(1'h1):(1'h0)]) : (((~&wire128) ?
                          $unsigned(wire3) : (!reg195)) ?
                      wire128[(1'h1):(1'h1)] : (~|$unsigned((8'ha2))))) ?
              $unsigned($signed((((8'hb9) ? (8'ha0) : reg194) & (wire132 ?
                  wire0 : reg194)))) : (|($unsigned($unsigned(wire2)) ?
                  wire129[(1'h0):(1'h0)] : $signed($signed(wire105)))));
        end
      if (wire117)
        begin
          reg200 <= wire193;
          reg201 <= ($unsigned($signed({$signed((7'h42)), (~|wire127)})) ?
              reg197[(3'h4):(1'h1)] : ((^~wire132) ^~ $unsigned(((reg121 >>> wire191) ?
                  (wire131 | wire130) : (reg195 ~^ wire193)))));
          reg202 <= {$unsigned((~($signed(reg124) ~^ $unsigned(reg124))))};
          reg203 <= ($signed($unsigned(reg134[(2'h2):(2'h2)])) ?
              wire135[(2'h2):(1'h0)] : {(wire0[(2'h3):(2'h3)] ?
                      ((reg124 ? reg199 : reg119) ?
                          reg119[(1'h1):(1'h0)] : wire130) : $unsigned(wire4[(3'h7):(1'h1)]))});
        end
      else
        begin
          reg200 <= $signed($signed({((reg126 ?
                  wire132 : reg196) >= (reg203 < (8'ha4)))}));
          reg201 <= ($unsigned((7'h41)) + $unsigned(($unsigned(reg194) - (^~$signed(reg203)))));
        end
      reg204 <= wire129;
      reg205 <= $signed((~^(&{$unsigned((8'h9e)), (|reg119)})));
    end
  assign wire206 = reg201;
  assign wire207 = $signed((reg200 <= ($unsigned((reg120 ^~ reg204)) >>> {reg120[(2'h3):(2'h2)]})));
  module31 #() modinst209 (.y(wire208), .clk(clk), .wire33(reg205), .wire35(reg121), .wire34(reg199), .wire32(reg200));
  always
    @(posedge clk) begin
      reg210 <= $signed(reg200[(1'h0):(1'h0)]);
      reg211 <= reg196[(3'h6):(1'h1)];
      if (({(~&{$signed(wire2), ((8'hb1) ? reg201 : reg197)}),
          (~^((reg197 ? (8'hb7) : wire129) ?
              (reg205 || wire105) : reg199[(1'h0):(1'h0)]))} | (reg197[(2'h2):(1'h1)] >= (8'ha4))))
        begin
          reg212 <= (|reg120[(2'h3):(2'h3)]);
          reg213 <= {$unsigned($signed({$unsigned(wire193), $signed(reg194)}))};
          reg214 <= (reg120 >>> (reg196 ? wire131 : wire208[(3'h7):(3'h4)]));
        end
      else
        begin
          reg212 <= ((|(wire128 ?
              $signed(((8'hba) >= reg126)) : (reg203 & (reg214 ?
                  wire191 : reg120)))) >= (8'ha5));
          if ((reg198 ?
              $signed(((|(&reg214)) ?
                  reg119[(1'h0):(1'h0)] : $signed($unsigned((8'ha6))))) : $unsigned(((wire208[(2'h3):(2'h2)] ?
                      $signed(reg125) : reg211) ?
                  $signed((&reg214)) : $unsigned((reg194 ? reg210 : reg133))))))
            begin
              reg213 <= ((reg121[(4'hf):(3'h7)] << ($signed((reg122 ?
                      reg198 : wire206)) ?
                  $signed((reg123 > reg199)) : ($unsigned(wire193) <= wire2[(1'h0):(1'h0)]))) || ((8'h9c) ^ reg211[(2'h2):(1'h0)]));
              reg214 <= (8'ha7);
              reg215 <= $signed($unsigned($signed(wire105[(4'ha):(3'h5)])));
            end
          else
            begin
              reg213 <= $unsigned(($unsigned(reg195) != reg123[(2'h2):(2'h2)]));
            end
          reg216 <= {(7'h43)};
        end
      if (wire131)
        begin
          reg217 <= $signed(((~((^~reg197) || (wire191 & (8'h9f)))) ?
              reg126 : {wire2[(5'h13):(4'hf)]}));
          reg218 <= (({{wire135,
                  (reg199 ? wire208 : reg205)}} >> reg134) & $unsigned(wire3));
          reg219 <= $signed((+wire2[(1'h1):(1'h1)]));
          if (wire135)
            begin
              reg220 <= reg197;
              reg221 <= $unsigned(reg201);
              reg222 <= ({((~&(reg200 ? reg194 : reg219)) ?
                          wire2 : $signed((wire1 <<< reg195)))} ?
                  (wire127[(1'h0):(1'h0)] >>> (($unsigned(wire193) != (-wire208)) ?
                      ((wire135 - wire208) >> (7'h41)) : $signed(wire104))) : reg215);
              reg223 <= (reg200[(4'hd):(4'ha)] != $signed($signed(wire129)));
            end
          else
            begin
              reg220 <= $signed(reg222[(1'h1):(1'h1)]);
              reg221 <= $unsigned(reg122[(1'h0):(1'h0)]);
              reg222 <= $signed((~$signed({$unsigned(wire129)})));
              reg223 <= $unsigned((~&({(wire130 || reg197)} + $unsigned($signed(wire191)))));
            end
          reg224 <= (({(&$signed((8'hb3))),
                  ((reg222 >> reg204) >>> (reg221 ? (8'hb1) : (8'ha7)))} ?
              wire4[(5'h12):(2'h2)] : reg212) >>> (wire3[(4'hf):(2'h3)] <= {$unsigned(reg121[(4'hf):(1'h0)]),
              $signed((reg197 <<< reg203))}));
        end
      else
        begin
          reg217 <= $signed($signed($unsigned((^~{wire1, (8'h9c)}))));
          reg218 <= ($unsigned($signed((^$signed(reg203)))) ?
              $signed(reg201) : $signed($signed($unsigned($unsigned(reg205)))));
        end
      reg225 <= reg194;
    end
  assign wire226 = {reg213[(5'h10):(3'h4)]};
endmodule

module module136
#(parameter param190 = {(({((8'hac) - (8'ha7))} + (~&((8'ha6) ? (8'hac) : (8'ha4)))) ? (&(^~((8'hb8) < (8'hb4)))) : (~^((~|(8'haa)) | (8'ha3)))), ({(-(7'h43)), (|{(8'ha0)})} << ({(+(8'ha9)), ((8'ha9) ? (8'had) : (8'h9c))} >= (&((8'hb2) & (8'h9c)))))})
(y, clk, wire137, wire138, wire139, wire140);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire137;
  input wire [(5'h15):(1'h0)] wire138;
  input wire [(4'hb):(1'h0)] wire139;
  input wire signed [(3'h7):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire184;
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire141,
                 wire142,
                 wire143,
                 wire158,
                 wire184,
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
                 (1'h0)};
  assign wire141 = wire139;
  assign wire142 = (8'haf);
  assign wire143 = wire138;
  always
    @(posedge clk) begin
      reg144 <= ($signed($unsigned({wire140[(1'h1):(1'h1)]})) & $unsigned({wire140,
          wire138}));
      reg145 <= ((((+wire141) ?
                  (-wire142) : (wire137[(2'h2):(2'h2)] ?
                      {wire142} : ((8'h9e) ^~ wire139))) ?
              reg144 : $unsigned(((~^reg144) ? {wire142, (8'hbf)} : (8'hb2)))) ?
          wire141[(3'h7):(3'h7)] : $signed($unsigned((wire143 <<< wire140[(3'h7):(1'h1)]))));
      reg146 <= $signed(($unsigned(wire138) | wire141));
      if (reg146)
        begin
          if ((~(~(({wire140, wire140} ?
                  $signed(wire139) : wire141[(5'h12):(5'h12)]) ?
              (!reg146[(4'h8):(3'h6)]) : $signed(wire138[(4'h9):(4'h8)])))))
            begin
              reg147 <= {wire142};
              reg148 <= $unsigned($signed(wire138));
              reg149 <= $unsigned((|wire139));
              reg150 <= $unsigned(({$unsigned((!reg144)),
                      (^~$unsigned((8'hb4)))} ?
                  reg148[(2'h2):(1'h1)] : $unsigned((|(reg145 ?
                      reg149 : reg149)))));
            end
          else
            begin
              reg147 <= wire140[(1'h0):(1'h0)];
            end
          if (((+$signed(((8'h9d) < (7'h40)))) - $unsigned($signed((~^$signed(reg145))))))
            begin
              reg151 <= $unsigned($unsigned(({(reg150 ? reg147 : wire142)} ?
                  reg145[(1'h1):(1'h0)] : wire143)));
            end
          else
            begin
              reg151 <= reg147[(1'h0):(1'h0)];
              reg152 <= (|$unsigned(reg151[(4'hf):(4'hc)]));
              reg153 <= (~{((8'h9d) ?
                      (reg152[(3'h4):(2'h2)] ?
                          $signed(wire141) : $signed(reg150)) : wire143[(4'h9):(4'h8)])});
            end
          reg154 <= reg151[(4'h8):(3'h6)];
          if ($unsigned(wire142))
            begin
              reg155 <= reg149[(4'hb):(4'ha)];
              reg156 <= $unsigned($signed($unsigned($signed($unsigned(reg151)))));
            end
          else
            begin
              reg155 <= (^~((wire139[(2'h2):(1'h1)] + (^~$unsigned(reg149))) || (reg145 ?
                  reg146 : $unsigned((reg144 ? reg151 : wire141)))));
            end
        end
      else
        begin
          if (reg156[(2'h2):(2'h2)])
            begin
              reg147 <= wire137[(1'h1):(1'h0)];
              reg148 <= $unsigned($unsigned(reg145[(4'hc):(3'h6)]));
              reg149 <= $signed(reg144);
              reg150 <= $unsigned($unsigned(wire138));
              reg151 <= (reg144 ?
                  ((reg150 ?
                      (7'h40) : wire143[(4'h9):(2'h3)]) ^ $unsigned(wire141[(4'hb):(2'h2)])) : ($signed({wire140[(1'h1):(1'h1)],
                      $unsigned(wire142)}) * (-(wire143 < reg146[(4'hb):(3'h4)]))));
            end
          else
            begin
              reg147 <= ($unsigned(({((8'ha2) != reg152),
                      $unsigned((8'h9e))} << $signed((reg151 == reg144)))) ?
                  reg145[(3'h5):(2'h2)] : $signed($signed((~^(~&(8'h9c))))));
              reg148 <= (+$unsigned((((reg147 ? wire137 : (8'hac)) ?
                  (reg150 >= reg151) : $unsigned(reg150)) == reg148)));
              reg149 <= reg154[(4'ha):(4'h8)];
              reg150 <= reg150;
            end
          reg152 <= (~^$signed($unsigned(reg145[(5'h12):(5'h11)])));
          reg153 <= ({{reg146, wire143[(3'h5):(2'h2)]},
              (~^reg146[(4'hd):(4'hc)])} == (+wire141[(5'h15):(3'h6)]));
        end
      reg157 <= $unsigned(reg146[(2'h2):(2'h2)]);
    end
  assign wire158 = $unsigned(((~|reg145[(5'h11):(3'h6)]) ?
                       (~|(+(~&wire139))) : wire141[(1'h0):(1'h0)]));
  module159 #() modinst185 (.wire160(reg149), .y(wire184), .clk(clk), .wire163(reg153), .wire164(reg151), .wire162(wire138), .wire161(reg157));
  assign wire186 = reg149;
  assign wire187 = reg151[(3'h6):(1'h0)];
  assign wire188 = (reg144 & (wire137 ? (8'hb1) : reg157[(1'h0):(1'h0)]));
  assign wire189 = $unsigned(wire187);
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire [(4'hf):(1'h0)] wire109;
  input wire [(4'hc):(1'h0)] wire108;
  input wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  assign y = {wire116, wire115, wire114, wire113, wire112, (1'h0)};
  assign wire112 = $unsigned((~|{(!((8'ha3) ? wire108 : wire111))}));
  assign wire113 = $signed($unsigned((($signed(wire108) ?
                           $signed((8'ha5)) : wire109[(4'hc):(3'h7)]) ?
                       wire111 : $signed(wire108[(4'ha):(3'h7)]))));
  assign wire114 = $signed((wire109[(3'h4):(2'h2)] > {(wire110[(3'h4):(2'h2)] ?
                           $unsigned(wire111) : (wire112 ^ wire112)),
                       wire108}));
  assign wire115 = wire113;
  assign wire116 = ((~|{(wire109 ? (^wire111) : wire114[(2'h3):(2'h3)]),
                           $signed($signed((8'hb9)))}) ?
                       wire114 : wire112);
endmodule

module module5
#(parameter param101 = (({(((8'ha0) ? (8'h9f) : (8'ha7)) < ((7'h41) ? (7'h42) : (8'ha7)))} && ({(|(8'hb1))} << (((8'hae) > (8'hb9)) ? (|(8'ha7)) : ((8'hbf) ? (8'ha4) : (8'hbb))))) ? (|((8'hb2) ? {(^~(8'hae)), (~&(8'hb7))} : (((8'h9c) > (8'ha2)) ^~ ((7'h41) != (7'h42))))) : (^~(-({(8'hbe), (8'h9c)} != (&(8'hb7)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire74;
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  assign y = {wire76,
                 wire11,
                 wire12,
                 wire13,
                 wire17,
                 wire74,
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
                 reg77,
                 reg14,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire11 = (+(wire10 >> {((!(8'ha6)) != $signed(wire10)),
                      wire6[(2'h3):(1'h0)]}));
  assign wire12 = wire8[(4'h8):(2'h2)];
  assign wire13 = $signed(($signed(wire11[(3'h4):(2'h3)]) <<< $unsigned((-$unsigned(wire8)))));
  always
    @(posedge clk) begin
      reg14 <= wire8[(2'h3):(1'h0)];
      reg15 <= wire12;
      reg16 <= $signed((-wire6));
    end
  assign wire17 = (8'haa);
  always
    @(posedge clk) begin
      reg18 <= $unsigned(wire13);
      reg19 <= (~^(+{wire17, (reg18[(1'h0):(1'h0)] | {wire10})}));
      reg20 <= (^~(&{reg19[(3'h5):(1'h0)]}));
      if (($signed((wire17[(1'h1):(1'h0)] == {(~(8'ha7)),
          ((8'ha0) >= (8'h9c))})) ^ (wire8[(1'h1):(1'h0)] << (-reg14[(4'hb):(4'hb)]))))
        begin
          reg21 <= ($unsigned((^$signed((7'h42)))) * $unsigned($unsigned($unsigned({wire6,
              wire17}))));
          reg22 <= (((^~$signed({reg18})) & reg15) ?
              (~^{(~(reg19 > wire13)),
                  (reg15[(3'h5):(1'h1)] < wire7)}) : reg16[(3'h7):(3'h5)]);
          reg23 <= (~^(&wire12[(1'h1):(1'h0)]));
          reg24 <= $signed(wire8[(3'h6):(2'h2)]);
          reg25 <= reg16[(4'hb):(4'h9)];
        end
      else
        begin
          reg21 <= $signed((8'hb1));
          reg22 <= wire11[(3'h5):(2'h3)];
        end
      reg26 <= wire7;
    end
  always
    @(posedge clk) begin
      reg27 <= $unsigned({(^((wire8 ? reg24 : (8'hb4)) + wire13)), (8'hb6)});
      reg28 <= $signed(($signed(((reg19 ? wire7 : wire12) ?
              (^~wire9) : (reg20 >>> reg15))) ?
          {($signed(reg24) ?
                  (~^(8'h9f)) : ((8'hbe) ? wire11 : wire12))} : wire17));
      reg29 <= reg21;
      reg30 <= {(reg21 ^~ {reg19[(1'h1):(1'h0)]})};
    end
  module31 #() modinst75 (wire74, clk, reg20, wire17, reg15, reg29);
  assign wire76 = ($unsigned($unsigned($unsigned((~&wire9)))) || (|($signed($signed(wire74)) ?
                      (~|{wire11}) : (^~wire74[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      if ($unsigned(reg25))
        begin
          if (reg27)
            begin
              reg77 <= reg24[(3'h5):(3'h4)];
              reg78 <= ((wire8 != $signed((((8'hbf) ? wire17 : reg22) ?
                      (reg21 ? reg23 : (8'ha3)) : {reg25}))) ?
                  reg21 : wire7[(2'h2):(1'h0)]);
              reg79 <= reg21;
              reg80 <= $signed($signed(reg27[(4'ha):(3'h7)]));
              reg81 <= reg16[(1'h1):(1'h1)];
            end
          else
            begin
              reg77 <= $unsigned(((reg20[(4'hb):(3'h7)] * $signed((wire6 >>> wire6))) >= (+reg14[(4'h8):(2'h3)])));
            end
          reg82 <= reg25;
          if (reg29[(2'h2):(1'h0)])
            begin
              reg83 <= wire9;
            end
          else
            begin
              reg83 <= reg82[(1'h1):(1'h0)];
              reg84 <= ($signed({({reg18} ^~ (~wire13))}) == ({$unsigned($signed(reg26))} ^ (-{wire11})));
              reg85 <= ($unsigned((|{$unsigned(reg77),
                  wire10})) - wire76[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          if ($signed($unsigned($signed((^~wire12[(4'h8):(1'h1)])))))
            begin
              reg77 <= (($signed((reg84 ?
                  $unsigned(wire7) : (reg30 ~^ (8'hbb)))) >>> reg20) > ($unsigned(wire10[(2'h2):(1'h1)]) != reg19));
              reg78 <= $unsigned(($signed(reg30) > reg79));
            end
          else
            begin
              reg77 <= $unsigned($unsigned($signed($signed(reg14[(4'ha):(4'h8)]))));
              reg78 <= (wire13[(4'he):(2'h3)] * reg81[(3'h7):(3'h6)]);
              reg79 <= (^(wire76[(2'h2):(1'h1)] ?
                  reg82 : $signed((reg78[(2'h3):(2'h2)] ^ $unsigned(reg79)))));
              reg80 <= $unsigned(reg22[(2'h3):(1'h0)]);
              reg81 <= (8'ha9);
            end
          reg82 <= (8'hb0);
          reg83 <= $unsigned({wire10});
          reg84 <= (8'hab);
        end
      reg86 <= wire17;
      if ($unsigned((+wire12)))
        begin
          if ($signed($unsigned((|($signed(reg78) ?
              (reg23 ? reg16 : reg16) : (reg19 ? reg15 : reg86))))))
            begin
              reg87 <= $signed((($signed({wire13}) ?
                  (wire76[(1'h0):(1'h0)] - {wire7,
                      wire7}) : ($unsigned(wire12) == reg16)) < (reg82[(2'h2):(2'h2)] ?
                  (^reg77) : wire11[(3'h5):(3'h5)])));
              reg88 <= $signed($unsigned($unsigned(reg24[(2'h2):(2'h2)])));
              reg89 <= reg23;
              reg90 <= $unsigned(reg80);
              reg91 <= (8'hb5);
            end
          else
            begin
              reg87 <= ($signed(reg83[(4'h8):(2'h2)]) ?
                  $signed(((&((8'hbf) ? reg87 : (8'haa))) ?
                      ((reg22 ? (7'h44) : reg24) ?
                          {reg87, wire6} : (reg79 & reg15)) : reg22)) : reg88);
              reg88 <= (~$unsigned({wire74[(1'h0):(1'h0)]}));
            end
          reg92 <= $unsigned(wire6);
          reg93 <= $signed((^reg91));
          reg94 <= $signed((~&((|(reg16 ^ reg80)) ?
              $signed((reg21 ^ (8'h9d))) : ((reg79 ? wire8 : reg83) ?
                  $unsigned((8'ha1)) : reg21[(3'h5):(2'h3)]))));
          if (wire12[(3'h5):(3'h4)])
            begin
              reg95 <= reg20[(4'h8):(1'h0)];
              reg96 <= (((wire9 ?
                      ({reg15} ?
                          {wire11} : $unsigned(reg29)) : wire74[(3'h5):(2'h2)]) ?
                  reg77 : {$signed((reg29 <<< reg84)),
                      {(reg80 <= (8'h9e))}}) <<< reg24);
            end
          else
            begin
              reg95 <= (-$signed((reg23[(1'h0):(1'h0)] ~^ $unsigned($signed(reg25)))));
              reg96 <= reg85;
            end
        end
      else
        begin
          reg87 <= (-$unsigned(($unsigned(reg77[(3'h7):(3'h4)]) & (8'h9f))));
          reg88 <= $signed((7'h43));
          reg89 <= $signed(wire76[(2'h2):(1'h0)]);
          if (($unsigned((reg21[(2'h2):(1'h0)] ? reg77 : $unsigned((^reg26)))) ?
              ((wire6[(2'h2):(1'h1)] ?
                  $signed((reg77 & reg85)) : $signed(((8'hb0) ?
                      reg85 : reg89))) > reg83[(4'hf):(1'h1)]) : $signed($signed(reg93))))
            begin
              reg90 <= ((~$unsigned(reg18)) || $signed(($unsigned(((8'haa) ?
                      (8'hbc) : reg29)) ?
                  ($signed(wire9) ?
                      reg27[(2'h2):(1'h0)] : $signed((8'haf))) : wire6[(1'h0):(1'h0)])));
              reg91 <= reg96;
              reg92 <= (^(+reg21));
              reg93 <= ($signed((~|$unsigned((~&reg96)))) ?
                  $unsigned($signed((8'hb2))) : ((|((8'hb1) <= reg96[(3'h7):(3'h7)])) ?
                      (reg14 || $signed((reg14 - (8'h9d)))) : reg14[(3'h4):(2'h3)]));
              reg94 <= reg95[(4'ha):(1'h1)];
            end
          else
            begin
              reg90 <= (|(((reg83 <= $signed(wire7)) << (wire6[(2'h2):(2'h2)] ?
                  $signed(reg86) : (reg29 ?
                      reg86 : reg96))) > (|((wire8 < reg25) && (~|reg84)))));
              reg91 <= reg27[(3'h7):(2'h2)];
              reg92 <= $unsigned(((~|((reg79 >>> reg94) ~^ (8'hab))) ?
                  $unsigned($signed((~reg91))) : ({wire6[(2'h3):(1'h0)]} >>> $signed((~reg19)))));
              reg93 <= $unsigned(reg80[(2'h3):(1'h1)]);
              reg94 <= reg22;
            end
          if (reg27[(4'hc):(3'h5)])
            begin
              reg95 <= ((-$signed(wire7)) ?
                  (^~$signed($unsigned((wire9 <= reg93)))) : $unsigned(reg16[(1'h0):(1'h0)]));
              reg96 <= reg22;
              reg97 <= wire11;
            end
          else
            begin
              reg95 <= {reg28,
                  (($unsigned((reg84 ? reg18 : reg29)) ?
                      wire6[(2'h3):(1'h1)] : reg88[(4'hc):(4'hb)]) && (^~$unsigned(reg83[(4'ha):(3'h6)])))};
              reg96 <= $signed($signed($signed($unsigned(reg80))));
              reg97 <= $signed(reg26[(1'h0):(1'h0)]);
              reg98 <= (($unsigned((reg84 < (^~reg15))) ^ reg90[(2'h3):(2'h3)]) ^~ (^~wire12));
              reg99 <= ((|$signed(reg22)) >> (reg29 != ($signed(reg81) ?
                  $unsigned($unsigned(reg82)) : ($signed(reg78) ?
                      (-reg30) : $signed(reg26)))));
            end
        end
      reg100 <= (((((8'had) ? (~|reg97) : (-reg98)) ?
                  ($unsigned(wire8) == (wire8 ?
                      (7'h41) : reg83)) : $signed(reg91)) ?
              (|(-(-reg85))) : (&reg90)) ?
          reg92 : ({($signed((8'h9c)) ? $signed(reg88) : reg97[(3'h6):(3'h6)]),
              ($signed(wire13) >> reg97[(2'h2):(2'h2)])} >= ((~&reg25[(4'h9):(4'h9)]) ?
              reg84 : ((wire7 & reg19) | wire9[(4'hd):(3'h6)]))));
    end
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 (1'h0)};
  assign wire36 = $signed({{$unsigned($signed((8'hbd))), wire35[(3'h7):(3'h7)]},
                      (|(-$signed(wire35)))});
  assign wire37 = wire32[(2'h2):(1'h1)];
  assign wire38 = $signed((^wire34));
  assign wire39 = ($signed(($signed($signed(wire32)) - (^~wire36[(1'h1):(1'h1)]))) ?
                      (($unsigned(wire33[(1'h0):(1'h0)]) >= wire38[(2'h2):(1'h0)]) >> ((~|wire35) ?
                          ((wire34 ?
                              (8'h9e) : (8'ha3)) <= (^wire36)) : (^wire35))) : {{wire33,
                              ((^~wire35) && wire33)},
                          wire32});
  assign wire40 = ((^wire37[(1'h1):(1'h0)]) ?
                      $signed((($signed(wire35) >> wire34) << $signed($unsigned((8'hab))))) : wire35);
  assign wire41 = (~|wire38[(4'hf):(1'h1)]);
  assign wire42 = $signed({($signed($unsigned(wire39)) << (8'hb7))});
  always
    @(posedge clk) begin
      if (((8'ha4) ?
          ((wire37[(2'h2):(1'h1)] ?
                  $unsigned($unsigned(wire38)) : ({wire40, (8'ha2)} ?
                      wire33 : (wire41 ? wire33 : wire42))) ?
              ((((8'ha9) ? (8'hb3) : wire32) ?
                      $unsigned(wire35) : wire41[(4'ha):(4'h9)]) ?
                  $signed((^~wire36)) : (wire32 ?
                      wire36 : (wire33 > wire35))) : $signed(($signed(wire34) ?
                  wire37 : (~wire42)))) : wire42[(3'h5):(2'h2)]))
        begin
          reg43 <= $unsigned($unsigned((($unsigned(wire38) ?
              $signed(wire39) : $unsigned((8'hb4))) << $unsigned({wire40,
              wire41}))));
          if (($unsigned($signed($signed((-wire40)))) & $unsigned($signed($unsigned($unsigned((8'ha2)))))))
            begin
              reg44 <= ($unsigned($signed(wire42)) ?
                  ($signed(($signed(wire34) ^~ {wire38})) ?
                      $unsigned($unsigned({wire42})) : $signed($signed(((8'hb4) << wire35)))) : wire35);
              reg45 <= $signed({(^wire33[(2'h2):(1'h1)])});
              reg46 <= (wire38 <<< {($signed(wire42) ?
                      ($signed(wire37) || $signed(reg44)) : (~|((8'ha1) | (8'ha8)))),
                  {wire32[(1'h0):(1'h0)]}});
              reg47 <= $signed((wire33 >= wire40));
              reg48 <= wire38;
            end
          else
            begin
              reg44 <= ($unsigned(($signed((8'hac)) ?
                      (+(wire37 ? wire36 : wire39)) : $signed(wire40))) ?
                  (wire38[(3'h4):(1'h1)] <<< $unsigned(reg48[(2'h3):(2'h2)])) : wire39);
              reg45 <= ({((((8'ha9) <= wire42) ?
                      {wire36} : (wire36 ^~ reg46)) || wire41[(4'h9):(3'h6)]),
                  (reg47 ?
                      wire36[(3'h4):(2'h2)] : (((8'haf) ^ wire37) ?
                          {wire37} : reg46))} & (!reg45));
              reg46 <= $unsigned(reg46[(2'h3):(1'h0)]);
            end
          reg49 <= wire40[(3'h6):(3'h4)];
        end
      else
        begin
          reg43 <= ((~|(($signed((7'h41)) ^ (wire34 > wire36)) + ((^~wire37) ?
                  (wire39 <= reg43) : (|wire34)))) ?
              $unsigned($signed($unsigned(reg43[(2'h2):(1'h1)]))) : wire42);
          reg44 <= $signed((8'haf));
        end
      if (wire40[(3'h6):(3'h5)])
        begin
          reg50 <= (~&((|$unsigned($signed(reg47))) ?
              $signed(reg45[(1'h0):(1'h0)]) : {{$unsigned(wire32)}}));
        end
      else
        begin
          reg50 <= ((&reg49) ? reg45 : (reg50 ? $signed((^~(8'h9d))) : wire36));
          reg51 <= $signed((&$signed((reg43 ?
              $signed(wire33) : (wire32 == wire39)))));
          reg52 <= (8'ha5);
          reg53 <= ($unsigned($unsigned(wire37[(1'h1):(1'h1)])) <= (($signed(wire42[(2'h2):(1'h1)]) << reg45) ?
              ($signed($signed(reg48)) && reg44[(3'h7):(3'h4)]) : ((wire36[(1'h0):(1'h0)] ?
                  (~^reg47) : $unsigned((8'h9d))) ^~ reg44)));
        end
      if ((((reg47[(2'h2):(1'h0)] ? wire42 : ({reg44} == (~&reg50))) ?
              reg46 : {$unsigned(reg49[(2'h3):(2'h2)]),
                  ((~|(7'h43)) ? (reg51 << (8'hbb)) : $unsigned(wire37))}) ?
          (((~((8'hb7) ? wire38 : reg46)) ?
                  (~^{wire33, reg49}) : wire42[(3'h5):(3'h4)]) ?
              (-(reg43[(1'h0):(1'h0)] ?
                  reg46 : $unsigned(wire34))) : wire34[(1'h0):(1'h0)]) : (-$signed(reg53[(2'h2):(1'h0)]))))
        begin
          reg54 <= reg50;
          reg55 <= $signed((($unsigned($unsigned(wire42)) & wire40[(3'h5):(3'h5)]) ?
              ((wire37[(1'h0):(1'h0)] ?
                      (wire40 ? reg49 : wire38) : reg53[(1'h1):(1'h0)]) ?
                  wire34 : wire41[(2'h3):(1'h1)]) : $signed((!{wire35}))));
          if (reg55)
            begin
              reg56 <= (wire36 ?
                  {(((reg46 ? wire38 : wire42) << wire36[(1'h0):(1'h0)]) ?
                          $unsigned($signed(reg52)) : $unsigned(wire35)),
                      $signed(((~|wire34) ?
                          wire39 : reg50))} : $unsigned(((reg49 ~^ reg44[(3'h5):(3'h4)]) ?
                      reg52[(4'ha):(1'h0)] : ((wire40 * wire34) ?
                          {reg54, reg50} : $signed(reg53)))));
              reg57 <= $signed($signed((({(8'had), reg55} ?
                  reg47[(1'h1):(1'h0)] : (reg46 ? wire37 : wire37)) & reg54)));
              reg58 <= (8'hb7);
              reg59 <= ((&wire36) ?
                  $signed(wire37[(2'h3):(2'h3)]) : $signed(wire35[(5'h11):(4'hc)]));
              reg60 <= wire36[(2'h3):(2'h2)];
            end
          else
            begin
              reg56 <= wire35[(2'h2):(2'h2)];
              reg57 <= $unsigned((~^reg53[(2'h2):(1'h1)]));
            end
          reg61 <= (((((!wire32) ? wire35 : (~&reg48)) ?
                  reg59[(4'hf):(2'h3)] : ((reg57 ? reg47 : reg60) ?
                      wire39[(1'h0):(1'h0)] : (wire34 <= (7'h44)))) ?
              $signed(wire39) : (wire33 ?
                  $signed((8'ha1)) : ({reg46} == reg57))) >= $unsigned($unsigned(wire32[(2'h3):(2'h3)])));
          reg62 <= $signed((wire33 ?
              ((|$unsigned(reg47)) >>> reg46[(1'h1):(1'h0)]) : (wire32[(2'h3):(2'h3)] ?
                  $signed((wire39 ? reg44 : wire36)) : reg57)));
        end
      else
        begin
          reg54 <= reg44;
        end
      reg63 <= (7'h40);
      reg64 <= reg43;
    end
  assign wire65 = reg43[(1'h0):(1'h0)];
  assign wire66 = (~reg60[(1'h0):(1'h0)]);
  assign wire67 = reg54;
  assign wire68 = $signed($unsigned($unsigned({(reg45 < reg48)})));
  assign wire69 = $unsigned(reg48);
  assign wire70 = $unsigned(wire41[(4'h8):(1'h1)]);
  assign wire71 = reg55;
  assign wire72 = (~((|(~^$signed(reg61))) ?
                      ($unsigned(wire65) ?
                          $unsigned(reg51[(2'h2):(2'h2)]) : $signed(((8'ha4) + reg47))) : wire39[(3'h4):(2'h2)]));
  assign wire73 = reg59[(4'h9):(3'h4)];
endmodule

module module159
#(parameter param182 = (~(((~{(7'h41), (8'ha5)}) ? ({(8'hb9)} ? (|(8'ha8)) : {(8'hb1), (8'hb1)}) : (^((8'ha6) ? (8'haa) : (8'hb1)))) ? ((+((8'hb3) >= (8'hb2))) ? (+(^~(8'ha0))) : (&{(8'ha0), (8'hbe)})) : {(((8'hb9) ? (8'hbd) : (8'ha5)) ? (^(7'h43)) : ((7'h44) != (8'hb4)))})), 
parameter param183 = ((~(&((|param182) + (param182 ? param182 : param182)))) ^ ({param182, (~^(param182 ? param182 : param182))} || {(param182 < (param182 ? param182 : param182))})))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire164;
  input wire signed [(4'h8):(1'h0)] wire163;
  input wire [(5'h15):(1'h0)] wire162;
  input wire signed [(4'h9):(1'h0)] wire161;
  input wire signed [(5'h13):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire signed [(5'h12):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire165;
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(3'h6):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  assign y = {wire181,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
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
                 (1'h0)};
  assign wire165 = {$signed(wire162)};
  assign wire166 = (8'had);
  assign wire167 = $signed((!wire161[(1'h1):(1'h1)]));
  assign wire168 = wire161[(3'h6):(2'h2)];
  assign wire169 = (8'hb8);
  always
    @(posedge clk) begin
      reg170 <= ((wire163[(3'h4):(1'h1)] ?
          wire164 : (8'ha6)) == $signed(wire162[(4'hd):(1'h0)]));
      if ($unsigned($signed((((wire164 ? wire164 : wire161) ?
              $signed(wire169) : {wire160, wire168}) ?
          (reg170 & (wire166 && wire165)) : {(~^wire168),
              wire163[(3'h4):(2'h2)]}))))
        begin
          reg171 <= $unsigned(($signed(wire169[(4'hc):(3'h7)]) > (~&wire166[(2'h3):(1'h1)])));
          reg172 <= $unsigned($unsigned((~^(reg171 - (reg171 ?
              wire169 : wire163)))));
          reg173 <= (-wire163);
          if (reg170[(4'hc):(2'h2)])
            begin
              reg174 <= (&{(~|$unsigned($unsigned(reg170))), $signed(reg170)});
              reg175 <= wire161;
              reg176 <= wire163;
            end
          else
            begin
              reg174 <= (($unsigned($signed((+wire168))) >>> wire162) ?
                  $unsigned($unsigned($signed((^~wire160)))) : (8'ha9));
            end
          reg177 <= reg172[(3'h4):(3'h4)];
        end
      else
        begin
          reg171 <= reg173;
          if ($signed($unsigned(reg170)))
            begin
              reg172 <= reg172[(1'h0):(1'h0)];
              reg173 <= $unsigned($signed(((wire163[(3'h6):(3'h4)] ?
                      (wire165 << wire163) : $unsigned(wire169)) ?
                  $unsigned(wire160) : $unsigned(reg171))));
              reg174 <= reg171[(1'h0):(1'h0)];
              reg175 <= (wire161[(2'h3):(2'h3)] != $unsigned(($signed({(8'hbc),
                  wire169}) > (&reg176[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg172 <= (($unsigned($unsigned((wire164 <= reg176))) ~^ ($signed(wire165[(1'h1):(1'h0)]) ?
                      reg173 : (+(&reg173)))) ?
                  (!wire161) : {$unsigned(({wire167} || (wire169 ?
                          wire160 : wire162))),
                      $unsigned($unsigned({wire161}))});
              reg173 <= $signed((wire164 == $signed((8'hbf))));
              reg174 <= wire160[(5'h10):(4'hc)];
              reg175 <= $unsigned((~^$signed({$signed((8'ha0)), {wire162}})));
            end
          reg176 <= $signed(($signed(wire169) ?
              $signed(((8'hbe) ?
                  (wire168 == (8'ha3)) : wire163[(3'h7):(2'h3)])) : reg174));
          reg177 <= (^({reg173} ?
              wire168 : {(wire169[(5'h10):(4'he)] ?
                      (wire169 ? (8'hb9) : reg175) : wire167[(1'h1):(1'h0)]),
                  $signed($unsigned((8'haa)))}));
        end
    end
  always
    @(posedge clk) begin
      reg178 <= {{reg172[(4'he):(2'h2)], (8'hb0)}};
      reg179 <= $signed((~{wire166[(2'h3):(2'h3)]}));
      reg180 <= ($signed((wire164 | $unsigned(reg171[(2'h2):(2'h2)]))) > $signed($unsigned(((reg177 ?
              reg170 : (7'h40)) ?
          {wire168, wire165} : $unsigned(wire161)))));
    end
  assign wire181 = reg171;
endmodule
