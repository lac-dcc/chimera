module top
#(parameter param253 = ((&((((7'h44) ? (8'hb9) : (8'hba)) ? (~(8'hbf)) : ((8'hb3) ^ (8'ha9))) < (+((8'h9f) ? (8'hb3) : (8'hba))))) && (((((8'hb2) <<< (8'hb2)) ^~ ((8'ha4) ? (8'haf) : (7'h44))) <= ((~|(8'ha4)) <<< (&(7'h44)))) ? (((^(8'hba)) ? ((8'ha4) < (8'hab)) : ((8'ha1) ? (7'h40) : (8'hb8))) ? ((|(8'hb9)) ? ((8'hac) ~^ (8'hb9)) : {(8'hbb)}) : ((^~(8'hac)) ? (8'hb8) : (|(8'hbc)))) : (-(^((8'hbe) >> (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire252;
  wire [(5'h15):(1'h0)] wire246;
  wire [(3'h5):(1'h0)] wire244;
  wire signed [(5'h11):(1'h0)] wire242;
  wire signed [(4'hf):(1'h0)] wire241;
  wire signed [(4'hd):(1'h0)] wire240;
  wire [(5'h10):(1'h0)] wire238;
  wire [(3'h6):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire8;
  reg signed [(4'hc):(1'h0)] reg251 = (1'h0);
  reg [(3'h4):(1'h0)] reg250 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg248 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg247 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire252,
                 wire246,
                 wire244,
                 wire242,
                 wire241,
                 wire240,
                 wire238,
                 wire141,
                 wire8,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((~^wire0));
      reg5 <= $signed(wire1[(4'hd):(4'hb)]);
      reg6 <= wire0[(2'h2):(1'h0)];
      reg7 <= $signed({(~^$unsigned(wire3[(1'h0):(1'h0)]))});
    end
  assign wire8 = (~^(~($signed($signed(wire2)) && (~$signed(reg6)))));
  module9 #() modinst142 (.wire13(wire1), .clk(clk), .wire11(reg6), .y(wire141), .wire12(wire2), .wire10(reg4));
  module143 #() modinst239 (wire238, clk, wire3, wire8, wire1, wire0);
  assign wire240 = wire1[(4'hf):(4'ha)];
  assign wire241 = (reg7 < $signed((~|$unsigned(wire0[(4'h9):(2'h3)]))));
  module215 #() modinst243 (wire242, clk, wire240, wire8, wire238, wire1);
  module167 #() modinst245 (.wire171(wire3), .wire170(wire238), .wire172(reg5), .clk(clk), .wire169(wire2), .wire168(wire241), .y(wire244));
  assign wire246 = $signed((($signed(wire244) ?
                           (8'h9e) : (((8'hb5) ? reg7 : reg6) ?
                               $unsigned((8'h9d)) : (!wire3))) ?
                       $unsigned(({wire241} <<< wire141[(1'h1):(1'h1)])) : ($signed((~wire141)) & $signed({wire1,
                           wire238}))));
  always
    @(posedge clk) begin
      reg247 <= wire0[(4'hf):(4'h8)];
      if ($unsigned($signed((-$unsigned($signed(wire3))))))
        begin
          reg248 <= {{$signed({(wire8 ? wire2 : wire8),
                      (wire241 ? wire0 : wire240)})},
              (($unsigned(wire141[(1'h0):(1'h0)]) == $unsigned((wire8 ?
                  wire246 : wire0))) <<< wire0[(4'hb):(3'h7)])};
          reg249 <= $signed($signed($unsigned(reg5[(1'h0):(1'h0)])));
        end
      else
        begin
          reg248 <= ((-$unsigned(wire244)) <= ($unsigned(wire141) ^ reg7));
          reg249 <= $signed($signed(reg4[(4'h9):(3'h4)]));
        end
      reg250 <= wire1;
      reg251 <= ((^~$signed(reg250[(2'h2):(2'h2)])) ~^ $unsigned($unsigned(reg6[(4'hd):(4'ha)])));
    end
  assign wire252 = ($unsigned($signed(reg4)) ? reg4[(4'h8):(3'h7)] : wire238);
endmodule

module module143  (y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire147;
  input wire signed [(5'h10):(1'h0)] wire146;
  input wire [(4'hc):(1'h0)] wire145;
  input wire signed [(4'h8):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire237;
  wire signed [(4'hd):(1'h0)] wire236;
  wire signed [(4'ha):(1'h0)] wire235;
  wire signed [(5'h15):(1'h0)] wire234;
  wire signed [(5'h10):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire203;
  wire signed [(5'h11):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire205;
  wire [(4'hd):(1'h0)] wire206;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(4'hd):(1'h0)] wire213;
  wire signed [(4'he):(1'h0)] wire214;
  wire [(3'h4):(1'h0)] wire232;
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg208 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(4'hb):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg211 = (1'h0);
  assign y = {wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire201,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire203,
                 wire204,
                 wire205,
                 wire206,
                 wire212,
                 wire213,
                 wire214,
                 wire232,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= (wire147 ?
          ((-($signed(wire144) > $unsigned(wire146))) ?
              $signed((!$unsigned(wire145))) : $unsigned(wire147[(5'h13):(3'h4)])) : $signed((($unsigned(wire146) ?
              $signed(wire144) : $signed(wire147)) ^~ wire147[(5'h10):(5'h10)])));
      reg149 <= $signed((~$signed(wire145)));
      reg150 <= $signed((wire144 | reg148[(3'h6):(1'h1)]));
      if ($signed((reg148[(1'h0):(1'h0)] ?
          ((8'hac) != $signed(reg149[(3'h5):(1'h0)])) : (reg150[(5'h11):(4'hd)] <<< reg149[(3'h4):(2'h2)]))))
        begin
          reg151 <= reg149;
          reg152 <= (8'hb9);
          if ($unsigned((reg148 > $signed({$signed(reg150)}))))
            begin
              reg153 <= wire144[(4'h8):(3'h6)];
              reg154 <= $signed((((^~{wire145}) ?
                      $unsigned((-wire146)) : $signed(wire147)) ?
                  (^~(~|$unsigned((8'hb1)))) : $signed($unsigned($unsigned(wire146)))));
            end
          else
            begin
              reg153 <= (~&({reg149[(3'h4):(3'h4)],
                  reg154} & reg151[(2'h2):(1'h0)]));
              reg154 <= reg151;
              reg155 <= $unsigned(reg153[(4'hf):(1'h1)]);
              reg156 <= $unsigned((|(reg148[(2'h3):(2'h3)] ?
                  wire147[(1'h0):(1'h0)] : reg154)));
            end
          if ((^~wire145[(3'h4):(3'h4)]))
            begin
              reg157 <= ({$unsigned($signed({wire146})), reg156} ?
                  (({wire146} ?
                          (reg153[(4'hf):(4'h9)] ?
                              {reg148,
                                  reg148} : $unsigned(wire146)) : $unsigned(wire146[(3'h4):(1'h0)])) ?
                      wire145 : $unsigned((!(8'hbc)))) : ((reg155[(5'h11):(2'h2)] ?
                          (7'h41) : (!{reg155})) ?
                      (((~|wire146) ?
                          reg148[(4'h8):(3'h7)] : reg155) >> (|reg153[(4'hc):(4'h8)])) : wire146[(2'h2):(2'h2)]));
              reg158 <= ($signed($signed($signed($unsigned(reg150)))) ?
                  {$unsigned(((^~reg152) << (wire145 << reg156))),
                      reg155[(2'h3):(2'h3)]} : wire146);
              reg159 <= {$signed((~&reg158[(4'h8):(3'h6)]))};
            end
          else
            begin
              reg157 <= reg154;
              reg158 <= (((reg148 ?
                          (^$unsigned(reg148)) : $signed((~^wire146))) ?
                      reg157 : {$unsigned((8'ha6))}) ?
                  reg152[(2'h3):(1'h1)] : $signed((8'hba)));
            end
        end
      else
        begin
          if (({($unsigned(reg155) + (reg150 < (reg156 < reg159))),
                  (reg151 ? wire146[(4'hc):(4'hc)] : wire146[(2'h3):(2'h2)])} ?
              ((-reg148) ?
                  {($signed(reg149) ?
                          wire147 : $signed(reg159))} : reg151) : {(($signed((8'hbe)) ?
                          $unsigned(wire146) : (!reg148)) ?
                      reg151[(2'h2):(2'h2)] : ((!(8'h9f)) | {reg149}))}))
            begin
              reg151 <= reg154;
              reg152 <= {reg158,
                  $signed(($signed((reg155 ? reg149 : (7'h41))) ?
                      {$signed(reg159)} : (!{reg151})))};
              reg153 <= $signed(reg153);
            end
          else
            begin
              reg151 <= ((&($signed($unsigned(reg155)) ~^ $unsigned((wire147 ?
                      reg159 : wire144)))) ?
                  wire144 : (|$signed({((7'h43) ? reg151 : (8'h9d))})));
              reg152 <= reg148;
            end
          reg154 <= $unsigned(($unsigned(wire145[(3'h6):(1'h0)]) <= ($unsigned($signed(reg154)) >> ((reg156 * reg152) ?
              (~|(8'hbb)) : wire144))));
          reg155 <= (reg152 & $unsigned({($signed((8'h9e)) || $signed(reg158)),
              reg151[(1'h0):(1'h0)]}));
          reg156 <= $signed(($unsigned(wire145) ~^ ($signed(reg149) < $unsigned({(8'hae)}))));
          reg157 <= reg150;
        end
      reg160 <= (({reg148[(4'h8):(2'h2)]} ?
          (reg157 >>> $unsigned({reg150,
              reg154})) : $signed(wire147[(5'h12):(5'h10)])) == reg148[(2'h3):(1'h1)]);
    end
  assign wire161 = (~(reg150 ?
                       (~{$signed(reg151),
                           reg149[(1'h1):(1'h0)]}) : $unsigned((^~$signed(wire144)))));
  assign wire162 = wire145;
  assign wire163 = {$signed($signed(({reg149, reg153} ?
                           (reg160 == reg148) : (8'haf))))};
  assign wire164 = (reg154 ?
                       ($signed(((-wire163) * wire161[(1'h0):(1'h0)])) < reg153[(4'hd):(4'hb)]) : (-$unsigned((reg148 ?
                           (reg154 ? reg160 : reg148) : (|reg160)))));
  assign wire165 = $signed((&($unsigned($signed(reg157)) > reg150)));
  assign wire166 = $signed((reg159 >= ((!wire164) ?
                       {{reg155, (8'hb8)}} : wire162)));
  module167 #() modinst202 (wire201, clk, wire161, wire164, reg155, wire166, reg153);
  assign wire203 = (({{reg151, {(8'ha6)}}, reg155} ?
                       wire147 : reg153) ~^ (((-((8'hb3) << wire145)) ?
                           reg157 : {{wire164}, reg155[(3'h7):(1'h1)]}) ?
                       (8'hb4) : reg151[(1'h0):(1'h0)]));
  assign wire204 = ((~|reg156[(3'h5):(2'h3)]) ~^ {reg159, reg158});
  assign wire205 = $unsigned(($unsigned($signed($signed(reg153))) ?
                       (-($unsigned(reg157) < (~wire164))) : $unsigned((((8'haa) >> wire146) ?
                           (~|wire161) : reg154))));
  assign wire206 = ($signed(reg155[(3'h5):(2'h2)]) ^ $signed(reg152[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed((({(wire163 ? reg152 : wire205)} ?
              (-reg153[(3'h6):(2'h2)]) : $signed(wire205)) ?
          $unsigned(wire147) : wire204[(1'h1):(1'h0)])))
        begin
          reg207 <= $unsigned(wire162);
          if ((({wire146} * ({reg155[(4'hf):(3'h7)]} ?
              (8'h9e) : $unsigned($signed(reg207)))) && (^wire166)))
            begin
              reg208 <= (^~($unsigned(((&wire144) > (wire161 ?
                  reg155 : wire206))) << wire161));
              reg209 <= {wire147};
              reg210 <= reg154;
              reg211 <= (^reg159);
            end
          else
            begin
              reg208 <= $signed(((~&((!wire205) + $signed(wire147))) ?
                  wire147[(5'h10):(4'ha)] : $unsigned((reg160[(3'h4):(3'h4)] ^ reg207))));
              reg209 <= ($unsigned((&((reg156 <= reg154) ?
                      (^~wire166) : $signed(wire146)))) ?
                  wire204[(4'hf):(4'hf)] : wire206);
              reg210 <= (~^(^~$unsigned(wire147)));
            end
        end
      else
        begin
          if (wire164)
            begin
              reg207 <= wire166[(4'ha):(3'h7)];
              reg208 <= ({wire206,
                      ($signed({reg158,
                          wire201}) <<< $signed($unsigned(wire201)))} ?
                  ((~$signed($signed((8'haa)))) ?
                      $unsigned(wire201[(4'h8):(3'h4)]) : reg156[(3'h6):(1'h1)]) : ($unsigned(({reg151,
                          reg160} >= $unsigned(reg154))) ?
                      (~((^~reg158) ^~ ((7'h40) ?
                          wire204 : reg158))) : wire145[(3'h5):(1'h0)]));
              reg209 <= ({wire162,
                  reg210[(4'hb):(3'h5)]} >> {((((8'hb2) || wire162) ?
                          $signed(wire161) : (wire144 ? reg159 : (8'h9c))) ?
                      ((reg156 ? reg208 : (8'hb3)) ?
                          (reg150 - reg152) : wire203) : (wire146[(3'h7):(2'h3)] && {wire145,
                          (8'hb2)}))});
              reg210 <= $signed(wire145);
            end
          else
            begin
              reg207 <= wire204[(4'ha):(1'h0)];
            end
        end
    end
  assign wire212 = ({$unsigned($unsigned(wire144)),
                           ((~(&wire162)) ?
                               ({wire147} ?
                                   (-reg158) : (^(8'hb4))) : ($unsigned((8'ha4)) || (wire201 ^~ wire163)))} ?
                       (|$unsigned($unsigned($unsigned(reg210)))) : (^~$unsigned(wire162[(4'h8):(3'h5)])));
  assign wire213 = $unsigned(reg158);
  assign wire214 = ((~$signed((8'hae))) <<< ($signed((8'ha9)) ?
                       (~&reg148[(4'h8):(2'h3)]) : $unsigned(({reg157} ?
                           $signed(wire144) : (8'ha4)))));
  module215 #() modinst233 (wire232, clk, wire147, reg151, wire161, wire146);
  assign wire234 = $unsigned($unsigned(reg157));
  assign wire235 = $signed(wire214);
  assign wire236 = ((&$unsigned(($unsigned((7'h43)) * $signed(wire234)))) ?
                       (($unsigned($unsigned(wire162)) ?
                               $signed((wire206 ?
                                   reg208 : (8'hb7))) : $signed(reg209)) ?
                           wire212[(3'h5):(1'h0)] : wire162) : {wire166,
                           reg152});
  assign wire237 = $unsigned(reg154);
endmodule

module module9
#(parameter param140 = {(|(({(8'hbe)} ? ((8'hae) << (8'hb5)) : ((8'hb5) + (8'hb7))) << {((7'h40) + (8'haa)), (|(8'ha0))}))})
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire132;
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire36,
                 wire38,
                 wire39,
                 wire86,
                 wire132,
                 (1'h0)};
  module14 #() modinst37 (.wire17(wire10), .wire18(wire12), .y(wire36), .wire16(wire13), .clk(clk), .wire15(wire11));
  assign wire38 = $signed(($signed(((8'h9f) + wire10[(4'hb):(2'h3)])) ^~ $signed((-wire12))));
  assign wire39 = wire10[(3'h7):(3'h7)];
  module40 #() modinst87 (.wire42(wire38), .clk(clk), .wire44(wire13), .wire43(wire39), .wire41(wire12), .y(wire86));
  module88 #() modinst133 (.wire90(wire36), .wire89(wire86), .clk(clk), .wire93(wire13), .wire92(wire12), .y(wire132), .wire91(wire11));
  assign wire134 = $unsigned(wire132);
  assign wire135 = {$unsigned(wire132[(4'h9):(3'h6)]), wire38};
  assign wire136 = $signed($unsigned(wire134[(1'h0):(1'h0)]));
  assign wire137 = ((~^$signed(wire132)) <= $signed({$unsigned($signed(wire136))}));
  assign wire138 = wire132;
  assign wire139 = $signed(wire38);
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(4'ha):(1'h0)] wire92;
  input wire signed [(5'h15):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg94 <= wire89;
          reg95 <= $signed(wire92);
          if ($unsigned({((^~{wire90}) >> $signed(((8'hb0) && wire90)))}))
            begin
              reg96 <= wire92[(3'h4):(1'h1)];
              reg97 <= wire89[(2'h3):(2'h2)];
              reg98 <= $signed(reg96[(4'hb):(4'ha)]);
              reg99 <= $unsigned((reg97[(2'h2):(2'h2)] ?
                  (8'h9e) : $unsigned((8'hb0))));
              reg100 <= wire91[(3'h6):(3'h6)];
            end
          else
            begin
              reg96 <= $signed($unsigned(reg95));
              reg97 <= (+(~&(~&reg98[(1'h0):(1'h0)])));
            end
          reg101 <= ((reg94 + (8'h9c)) >> (($signed(((8'haa) + wire89)) && ((reg96 != reg94) >>> reg95)) ?
              wire91 : ($signed($signed(wire89)) ?
                  (!(wire92 <= wire90)) : wire93)));
          reg102 <= reg96[(2'h3):(2'h3)];
        end
      else
        begin
          reg94 <= ((reg101[(1'h1):(1'h1)] ?
              $signed($unsigned(reg100[(2'h3):(1'h0)])) : ((reg97[(4'h9):(4'h8)] & $unsigned(reg98)) >>> ({(8'h9d)} ?
                  {reg102,
                      reg94} : wire89))) + ({(-(8'ha5))} >>> $unsigned($signed(reg94[(3'h4):(1'h1)]))));
        end
      reg103 <= reg102[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg104 <= (({(~$signed(reg99)),
          ({reg100} ?
              {wire91,
                  wire92} : (wire92 | reg99))} != $unsigned(((8'hab) || (reg97 ?
          reg99 : reg101)))) ^~ (reg103 ?
          reg100[(2'h3):(2'h3)] : (wire91 < reg100)));
      if (wire91)
        begin
          if (reg95[(3'h5):(2'h2)])
            begin
              reg105 <= (({reg101} && $signed(((reg102 ?
                      reg102 : wire91) ~^ (reg97 ^~ reg97)))) ?
                  (~|(((reg99 || reg101) ?
                          (wire93 ? wire93 : wire93) : wire91[(5'h15):(4'hc)]) ?
                      (&(^reg96)) : (reg102 >>> reg104[(4'hb):(3'h6)]))) : (reg100 ^ $unsigned(reg94[(4'h9):(3'h4)])));
              reg106 <= $unsigned(reg95);
              reg107 <= reg98;
              reg108 <= $signed(((-((~|wire93) < {reg104})) ?
                  reg95[(5'h10):(5'h10)] : reg99[(3'h4):(2'h3)]));
            end
          else
            begin
              reg105 <= $signed(reg94);
              reg106 <= {(^~$unsigned($signed($signed(wire92)))),
                  {({$signed(reg106), {(8'hb0)}} ?
                          (reg105[(5'h10):(2'h3)] ?
                              reg108[(2'h2):(2'h2)] : $unsigned(reg97)) : $signed($unsigned(reg105))),
                      (~&reg102[(1'h0):(1'h0)])}};
              reg107 <= $unsigned(($unsigned((!(wire89 >>> (8'had)))) ^ (wire93[(3'h4):(2'h2)] == {(8'h9f)})));
            end
          reg109 <= $signed(reg107);
          reg110 <= reg104;
          if ((-($signed(wire90[(2'h3):(2'h2)]) == $signed(reg110[(2'h3):(1'h0)]))))
            begin
              reg111 <= (^{(((|reg95) ?
                          {wire90, (8'hb1)} : reg98[(2'h3):(2'h3)]) ?
                      ((reg101 > reg108) ?
                          $signed(reg95) : $unsigned((8'hbb))) : wire90),
                  ($unsigned((!reg100)) ^~ reg106[(1'h1):(1'h1)])});
            end
          else
            begin
              reg111 <= {$unsigned(($unsigned(reg108[(1'h1):(1'h0)]) ?
                      wire93[(4'hb):(3'h6)] : (~|(wire93 ?
                          reg106 : (8'h9e)))))};
              reg112 <= wire93[(4'hd):(4'hb)];
            end
        end
      else
        begin
          if ((~|$unsigned(($unsigned(reg97) ?
              reg98[(2'h2):(2'h2)] : $unsigned(wire89)))))
            begin
              reg105 <= $signed($unsigned(($unsigned($unsigned(reg107)) <= {(wire91 ?
                      (8'ha7) : reg106),
                  $signed(reg98)})));
            end
          else
            begin
              reg105 <= reg112[(3'h5):(2'h2)];
              reg106 <= reg94[(4'h8):(3'h5)];
            end
        end
      reg113 <= $unsigned(reg101);
      reg114 <= $unsigned((-reg102));
      if ($unsigned(((reg111[(3'h6):(2'h3)] ?
          $unsigned(wire92[(4'ha):(3'h4)]) : $signed((~^reg106))) | wire93[(3'h7):(1'h1)])))
        begin
          reg115 <= $unsigned($signed(reg99));
          if (reg110[(2'h2):(1'h0)])
            begin
              reg116 <= (+reg111);
            end
          else
            begin
              reg116 <= (!(~((-reg96) == {(reg94 ? reg105 : reg98),
                  $unsigned(reg99)})));
            end
          reg117 <= (reg95[(4'h8):(1'h0)] ^~ $unsigned($unsigned(((reg97 ?
              reg95 : wire89) <= $signed(reg115)))));
        end
      else
        begin
          reg115 <= $signed(wire90[(2'h3):(2'h2)]);
          reg116 <= $signed(($signed(reg117[(3'h7):(3'h5)]) ?
              (reg96 ^~ reg96) : reg97[(3'h4):(3'h4)]));
          reg117 <= (reg108 << {reg104});
          reg118 <= $unsigned(reg111[(5'h11):(3'h6)]);
          reg119 <= $signed((({{reg94}} ?
              {(reg96 ? reg110 : (8'hab)),
                  (reg104 ^~ wire89)} : ((reg105 <<< reg105) ?
                  (reg100 | wire92) : ((8'hbc) <<< reg100))) > $signed(($signed(reg97) & (reg118 ?
              reg100 : wire91)))));
        end
    end
  assign wire120 = (~((|(+reg104)) && reg102[(1'h0):(1'h0)]));
  assign wire121 = reg97[(3'h7):(1'h0)];
  assign wire122 = $signed({$signed((~^$unsigned(reg114))),
                       reg105[(4'h9):(4'h8)]});
  assign wire123 = wire92[(4'ha):(3'h5)];
  assign wire124 = (!reg113);
  assign wire125 = $signed((((^~(reg104 ? reg98 : reg110)) ?
                       (reg103 ?
                           $signed((8'ha5)) : $unsigned(reg101)) : ($unsigned((8'ha5)) <<< $unsigned(reg104))) <<< {(((8'hbf) + (8'ha7)) ?
                           $unsigned(reg98) : $signed((8'hbb))),
                       ((8'hac) <= $unsigned(reg117))}));
  assign wire126 = ($unsigned({$unsigned((reg114 ~^ wire89))}) + wire92[(2'h2):(1'h1)]);
  assign wire127 = $unsigned((($signed((~^reg118)) ?
                       reg115 : wire90) ^~ $signed((~|(!reg102)))));
  assign wire128 = ($unsigned({{{wire93, reg102}}}) ?
                       reg100[(1'h0):(1'h0)] : (&reg110[(3'h7):(1'h0)]));
  assign wire129 = wire125[(4'h8):(4'h8)];
  assign wire130 = $signed($signed(wire129));
  assign wire131 = $unsigned($unsigned((^{(|(8'h9e)), (7'h40)})));
endmodule

module module40
#(parameter param84 = {((8'ha9) <= (~|(((8'ha4) <<< (7'h41)) ? ((8'hb1) && (8'ha6)) : (~^(8'ha8))))), ((|(~&(|(8'ha0)))) | (8'hbf))}, 
parameter param85 = param84)
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire44;
  input wire [(5'h10):(1'h0)] wire43;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire [(4'ha):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  assign y = {wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg82,
                 reg81,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire45 = $signed({$unsigned(((wire42 ?
                          wire42 : wire44) < $signed(wire44)))});
  assign wire46 = wire45[(4'h9):(3'h6)];
  assign wire47 = ((8'hb1) + wire46[(3'h7):(2'h3)]);
  assign wire48 = ((8'ha3) ?
                      $signed($signed($signed($unsigned(wire44)))) : (wire41 ?
                          $signed($signed(wire47)) : wire41[(3'h5):(1'h1)]));
  assign wire49 = wire46;
  assign wire50 = {$signed(((wire42[(4'hb):(2'h3)] - $signed(wire49)) ?
                          $unsigned(wire42[(2'h2):(1'h0)]) : wire48)),
                      $signed(wire44[(3'h5):(1'h0)])};
  assign wire51 = (wire42 ?
                      $unsigned($unsigned({(wire46 && wire48)})) : wire45);
  assign wire52 = {$unsigned(wire49[(4'h9):(1'h0)]), (^(&wire47))};
  assign wire53 = $unsigned($unsigned(wire52));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned((&wire52))) == wire43))
        begin
          reg54 <= ((~|$signed((&wire43[(5'h10):(3'h6)]))) ?
              wire45 : {$unsigned(wire50)});
          reg55 <= (|$signed($signed(wire43)));
          reg56 <= ((wire46[(2'h2):(1'h1)] ?
                  wire51 : $signed(reg54[(1'h0):(1'h0)])) ?
              $unsigned($signed(((wire42 & (8'h9e)) <= (wire45 ?
                  wire47 : wire50)))) : (+wire47[(2'h2):(2'h2)]));
          reg57 <= ($signed(wire48) ?
              {(!((^~wire51) <<< (^(8'hae))))} : (~|wire42));
          reg58 <= $unsigned({reg54});
        end
      else
        begin
          reg54 <= $unsigned((((wire45[(3'h6):(3'h4)] && (^(8'ha3))) ?
                  ({(8'ha9), wire53} ?
                      (reg54 ^ wire50) : (-reg58)) : (^~reg58)) ?
              $signed(((wire53 ?
                  wire50 : reg56) & $unsigned(wire42))) : (wire50[(3'h6):(1'h0)] >= wire53)));
        end
      reg59 <= $signed(wire41[(1'h1):(1'h1)]);
      reg60 <= {{$signed(reg55[(4'hd):(4'hd)])}};
    end
  assign wire61 = $signed($unsigned((wire53 ?
                      $signed((8'hb3)) : ($unsigned(wire49) << {reg59,
                          wire50}))));
  always
    @(posedge clk) begin
      reg62 <= $unsigned((8'had));
      reg63 <= $signed(wire61[(2'h2):(1'h1)]);
      if (($unsigned((~^$signed((wire44 == reg55)))) ?
          $unsigned($unsigned((^(!wire49)))) : wire41))
        begin
          if (($unsigned((|$unsigned($signed(wire50)))) ?
              ((($signed(reg55) <<< (wire48 ? reg59 : wire53)) ?
                      wire61[(4'hc):(2'h2)] : wire47) ?
                  ($signed((~reg60)) ?
                      {((8'ha1) ?
                              reg63 : wire61)} : ($unsigned(reg62) * $signed(wire50))) : wire45[(4'hd):(4'h8)]) : (8'hbe)))
            begin
              reg64 <= wire41[(2'h3):(1'h1)];
              reg65 <= $unsigned($unsigned(reg59));
              reg66 <= $signed((wire61 & (~^((reg58 ? reg65 : reg58) ?
                  $unsigned((8'ha7)) : wire52))));
              reg67 <= reg66;
              reg68 <= (wire48[(2'h3):(1'h0)] * (8'hac));
            end
          else
            begin
              reg64 <= reg60[(3'h5):(2'h2)];
              reg65 <= ($signed(reg56) ?
                  $signed((8'h9d)) : (reg66[(4'hc):(3'h4)] >= wire51[(2'h2):(1'h1)]));
              reg66 <= (!$unsigned($signed((^$unsigned((8'h9f))))));
              reg67 <= {reg67};
            end
        end
      else
        begin
          reg64 <= ($unsigned((((reg55 ?
                  (8'had) : (8'hba)) != reg63[(2'h2):(1'h1)]) != ((reg58 ?
                  wire48 : wire41) - wire42[(4'ha):(4'h9)]))) ?
              (reg64 <= wire46) : ($unsigned(reg58[(2'h2):(2'h2)]) ^~ $unsigned($signed((wire51 ?
                  reg64 : wire51)))));
        end
    end
  always
    @(posedge clk) begin
      reg69 <= $signed($signed(wire49));
      reg70 <= (~&{($unsigned((reg63 ? (8'had) : reg58)) ?
              wire49[(4'h8):(3'h7)] : ((+reg58) | {reg65}))});
      if ($unsigned((wire48 || $unsigned(((wire49 ? wire50 : (8'ha5)) ?
          ((8'hac) + wire47) : $unsigned(wire47))))))
        begin
          reg71 <= reg62;
          reg72 <= $signed(reg55[(4'h8):(2'h2)]);
        end
      else
        begin
          reg71 <= reg67[(3'h4):(2'h3)];
          reg72 <= $unsigned((reg62 - ((^wire43[(2'h3):(2'h2)]) ?
              {{(8'ha6), (8'hb0)}, wire42[(3'h7):(3'h4)]} : wire61)));
          reg73 <= reg64;
          reg74 <= reg68[(1'h1):(1'h0)];
          reg75 <= (~|$signed(wire44));
        end
      reg76 <= (7'h43);
    end
  assign wire77 = {(8'h9e)};
  assign wire78 = reg55[(4'h8):(3'h7)];
  assign wire79 = ((($signed((wire77 * reg58)) - ($unsigned(wire48) <= $signed(reg67))) * wire50) - $unsigned({wire47,
                      wire52[(4'ha):(4'h9)]}));
  assign wire80 = {$signed({(reg59[(4'h9):(3'h6)] < (wire48 | (7'h43))),
                          (!(reg74 | reg59))})};
  always
    @(posedge clk) begin
      reg81 <= $unsigned({$signed((wire45 ?
              $signed(wire51) : $unsigned(wire50))),
          wire51[(4'ha):(4'ha)]});
      reg82 <= $signed((reg69[(4'hf):(4'h9)] ?
          $signed(reg58) : ($signed((wire41 && reg68)) ?
              $unsigned($signed(reg71)) : $unsigned($signed(reg55)))));
    end
  assign wire83 = $signed($signed((^(reg55[(4'hd):(1'h1)] >= reg71[(1'h0):(1'h0)]))));
endmodule

module module14
#(parameter param34 = ({(((^~(8'hba)) ? ((8'h9f) ? (8'hac) : (8'hb2)) : ((8'hb2) || (8'ha5))) | {((8'hb6) | (8'hb5)), (~(8'haa))}), (~|((^(8'ha2)) - {(8'ha1)}))} != {(~^(~&((8'ha3) ? (8'hba) : (8'hba))))}), 
parameter param35 = param34)
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire19 = (-$unsigned({wire18}));
  assign wire20 = wire15;
  assign wire21 = (^{$unsigned(wire18),
                      ($signed((wire16 * (8'hba))) - (wire19[(2'h3):(2'h3)] <= $unsigned(wire17)))});
  assign wire22 = (^(~^(wire19[(1'h1):(1'h0)] >= (wire20[(3'h7):(3'h7)] ?
                      $unsigned((8'h9d)) : $unsigned(wire21)))));
  assign wire23 = $signed((~&($unsigned((^wire16)) ?
                      wire17 : $signed((^wire17)))));
  assign wire24 = $signed(wire18[(1'h0):(1'h0)]);
  assign wire25 = wire23;
  assign wire26 = wire17;
  assign wire27 = (wire19 != (wire24[(1'h1):(1'h1)] != {wire15[(3'h6):(2'h2)],
                      {$unsigned(wire21)}}));
  assign wire28 = (!(8'hba));
  assign wire29 = ({{((~&wire28) >= (-wire17)),
                          wire28[(3'h6):(1'h0)]}} + $signed($signed($signed((wire23 == wire26)))));
  assign wire30 = {wire21, wire18[(4'ha):(4'ha)]};
  assign wire31 = $unsigned((($signed($unsigned(wire17)) >= wire19) ?
                      $unsigned(wire15[(1'h0):(1'h0)]) : wire26));
  always
    @(posedge clk) begin
      reg32 <= (~wire23[(3'h4):(3'h4)]);
      reg33 <= wire22;
    end
endmodule

module module215  (y, clk, wire219, wire218, wire217, wire216);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire219;
  input wire signed [(2'h3):(1'h0)] wire218;
  input wire [(3'h5):(1'h0)] wire217;
  input wire [(5'h10):(1'h0)] wire216;
  wire [(4'h8):(1'h0)] wire231;
  wire [(4'hd):(1'h0)] wire230;
  wire [(3'h4):(1'h0)] wire229;
  wire [(5'h10):(1'h0)] wire228;
  wire signed [(4'hf):(1'h0)] wire227;
  wire signed [(5'h13):(1'h0)] wire226;
  wire signed [(4'hc):(1'h0)] wire225;
  wire [(2'h3):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire222;
  wire [(2'h2):(1'h0)] wire221;
  wire signed [(4'hf):(1'h0)] wire220;
  reg [(3'h5):(1'h0)] reg224 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 reg224,
                 (1'h0)};
  assign wire220 = wire218[(1'h1):(1'h1)];
  assign wire221 = $signed(({(^wire217)} < $unsigned(wire220[(1'h1):(1'h0)])));
  assign wire222 = (wire218[(2'h3):(1'h0)] <= (8'hb3));
  assign wire223 = (&wire222);
  always
    @(posedge clk) begin
      reg224 <= $signed({(8'haa), wire222});
    end
  assign wire225 = reg224;
  assign wire226 = ((wire225[(2'h2):(1'h0)] ?
                       (wire219[(1'h1):(1'h0)] ?
                           ((&(8'hae)) ?
                               $signed(wire218) : (wire222 ^~ wire216)) : ($unsigned(wire216) ?
                               (wire219 ^ wire221) : (wire225 ?
                                   wire221 : wire221))) : wire222) - (+{(reg224[(3'h4):(2'h2)] ?
                           wire225 : wire221[(1'h0):(1'h0)]),
                       (~|wire217[(1'h0):(1'h0)])}));
  assign wire227 = (~&(~^(($signed(wire218) ?
                       wire218[(2'h2):(1'h0)] : $unsigned(wire219)) >> $signed({wire217,
                       wire219}))));
  assign wire228 = wire221[(2'h2):(1'h0)];
  assign wire229 = wire218[(1'h1):(1'h0)];
  assign wire230 = wire219[(2'h2):(2'h2)];
  assign wire231 = (8'ha8);
endmodule

module module167
#(parameter param200 = (~^((((^~(8'haf)) ? {(8'hb4)} : ((8'hbe) << (8'h9c))) & ((+(8'ha8)) ? ((8'hb0) <= (8'hb8)) : {(7'h44)})) ? ((((8'h9c) | (8'hb7)) ? ((7'h42) ? (8'ha4) : (8'ha8)) : ((8'hb0) ? (8'ha2) : (7'h41))) >>> {{(8'hb8)}}) : ((~&{(8'hb0)}) - ((~|(8'hbf)) ? ((8'ha1) <= (8'h9e)) : ((8'hbb) ? (7'h44) : (8'h9f)))))))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire172;
  input wire [(4'ha):(1'h0)] wire171;
  input wire signed [(4'h8):(1'h0)] wire170;
  input wire [(5'h14):(1'h0)] wire169;
  input wire [(4'hf):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire190;
  wire [(3'h6):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(3'h4):(1'h0)] wire177;
  wire [(3'h7):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire174;
  wire [(4'he):(1'h0)] wire173;
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(4'he):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  assign y = {wire199,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire181,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg183,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire173 = $signed(({(wire170 ?
                               $signed(wire169) : ((7'h41) ?
                                   wire170 : wire172)),
                           wire171} ?
                       $signed(((wire168 << wire168) || {(8'h9d)})) : $unsigned(wire170)));
  assign wire174 = {$unsigned((8'h9f)),
                       {wire169,
                           (($signed(wire169) ^~ (~^wire169)) ?
                               (^(wire169 ?
                                   wire173 : wire172)) : (!(&wire169)))}};
  assign wire175 = wire171;
  assign wire176 = {(~^((wire174 ? (+wire169) : (~wire172)) ?
                           ((wire168 ^ wire171) - (wire174 ~^ wire172)) : (^wire169)))};
  assign wire177 = {$signed((wire174[(1'h1):(1'h1)] ?
                           ((^wire175) != wire175) : ((wire173 ?
                               wire174 : wire168) && (~&wire172))))};
  always
    @(posedge clk) begin
      reg178 <= wire168[(2'h2):(1'h0)];
      reg179 <= $signed({(^~$signed(wire175))});
      reg180 <= (8'hb8);
    end
  assign wire181 = wire173;
  assign wire182 = $unsigned((((((8'ha0) ?
                           (8'hbc) : wire170) <<< $signed(wire173)) ?
                       (+(|wire168)) : (wire173 ?
                           $unsigned(reg179) : wire173)) && $unsigned(reg179[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg183 <= wire173[(4'hc):(1'h0)];
    end
  assign wire184 = ((wire169 ?
                           (|$unsigned(((8'ha8) ^~ (8'haf)))) : (~^wire173)) ?
                       reg179 : (!(8'hb7)));
  assign wire185 = {$signed($signed((^((8'had) >= wire177)))),
                       (wire177[(1'h1):(1'h1)] ^~ ((~|wire169) ^~ ($signed(wire169) ?
                           (wire168 <= wire172) : $unsigned(wire168))))};
  assign wire186 = $signed((~&$unsigned((^~$unsigned(wire177)))));
  assign wire187 = ((|$unsigned(((wire182 ? wire181 : reg179) ?
                       reg179[(3'h5):(1'h1)] : wire184[(3'h7):(3'h7)]))) && (~^wire181));
  assign wire188 = (!wire170);
  assign wire189 = ($signed(wire175) - wire185[(4'ha):(2'h2)]);
  assign wire190 = $unsigned($signed($unsigned(({wire171,
                       (8'ha1)} != $unsigned(wire169)))));
  always
    @(posedge clk) begin
      if ($signed(((wire173 <= wire175[(2'h3):(1'h1)]) ?
          (~|($signed(reg179) << (8'hb3))) : (-{(8'hb0)}))))
        begin
          reg191 <= (~&(wire181 ?
              (reg178[(2'h3):(2'h2)] ?
                  (~|$unsigned(wire175)) : (~&wire185[(4'hb):(2'h2)])) : ($signed(wire190) * wire184[(1'h0):(1'h0)])));
          reg192 <= wire172;
          reg193 <= ((7'h41) != (^$signed(wire189[(2'h2):(1'h1)])));
        end
      else
        begin
          reg191 <= $signed(($signed(($unsigned(wire189) ?
                  wire170[(1'h1):(1'h1)] : reg191[(1'h0):(1'h0)])) ?
              wire187 : wire181[(4'h9):(3'h7)]));
          reg192 <= (7'h42);
          reg193 <= wire172;
          reg194 <= reg193;
        end
      reg195 <= (((~&($signed((8'hb8)) ^ $unsigned((8'hb5)))) & $unsigned({(~^(8'ha6)),
              wire172})) ?
          {$unsigned($unsigned($unsigned(wire176)))} : ($signed(($unsigned(wire171) <= wire189)) ?
              reg192 : $unsigned(wire173[(4'hb):(3'h4)])));
      reg196 <= $unsigned((({(wire170 ? reg180 : (8'hb7)),
          (reg191 ? reg192 : reg192)} >>> (wire175[(3'h4):(3'h4)] ?
          $unsigned(wire186) : $signed(wire190))) >> reg192));
      reg197 <= $signed($signed(reg178));
      reg198 <= (&reg197);
    end
  assign wire199 = reg196[(3'h5):(1'h1)];
endmodule
