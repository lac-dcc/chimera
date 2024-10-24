module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire168;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire170;
  assign y = {wire168, wire133, wire5, wire6, wire131, wire170, (1'h0)};
  assign wire5 = (wire4 & $unsigned(wire3[(2'h2):(2'h2)]));
  assign wire6 = ((((((7'h42) ? (8'hbe) : wire0) ?
                     ((8'ha4) ?
                         wire1 : wire0) : wire1) > (~(8'hb4))) <<< ((wire1[(4'he):(4'ha)] ^~ {wire2}) ?
                     wire0[(3'h7):(2'h3)] : $signed({wire2,
                         wire0}))) ^~ wire5[(4'he):(4'he)]);
  module7 #() modinst132 (.wire11(wire5), .y(wire131), .wire10(wire2), .wire12(wire1), .wire9(wire4), .clk(clk), .wire8(wire6));
  assign wire133 = (~|wire131);
  module134 #() modinst169 (.wire138(wire6), .wire135(wire3), .wire137(wire5), .clk(clk), .wire139(wire4), .y(wire168), .wire136(wire0));
  module7 #() modinst171 (.y(wire170), .wire11(wire1), .wire9(wire3), .wire12(wire131), .clk(clk), .wire10(wire5), .wire8(wire2));
endmodule

module module134
#(parameter param166 = (((!((~(8'hb4)) * {(8'hb4)})) ? {((8'hbf) || ((8'hbe) ? (8'hb8) : (8'hb8))), ((|(8'hae)) <<< ((8'hbb) ? (8'ha0) : (8'hae)))} : ({((8'ha5) * (8'h9e))} == (((8'had) ? (8'hb7) : (8'ha4)) ? ((7'h42) ~^ (8'hbb)) : ((7'h42) >>> (8'ha4))))) ? ((((!(7'h40)) ? {(8'hab), (7'h40)} : ((8'ha3) ? (8'hb5) : (8'hb4))) ? (((8'haf) ? (8'ha2) : (8'h9e)) ? (^(7'h40)) : (+(8'ha8))) : (8'h9f)) ? {{(~(8'hb7)), (^(8'ha3))}, (((8'haa) || (7'h42)) ? ((8'ha5) * (8'ha4)) : ((8'ha1) ? (8'hb6) : (7'h40)))} : ((((8'hba) ? (8'hbb) : (8'hab)) + (+(8'hbc))) ? ((+(8'hba)) >> {(8'ha6)}) : ({(8'ha0), (7'h44)} ~^ (+(8'hbd))))) : {((~&{(8'had), (8'ha1)}) ? (((8'hb6) ? (8'hb5) : (8'hb2)) ? ((8'hbb) == (7'h40)) : (~(8'had))) : (+((7'h41) ? (8'ha3) : (7'h40))))}), 
parameter param167 = {({param166, param166} ? {(~|(param166 ? param166 : param166))} : param166), (((^(param166 ? param166 : param166)) ? {((8'ha9) == param166)} : (((8'hbf) && param166) ? (param166 ? param166 : (8'ha6)) : {param166})) ? param166 : {((param166 >= param166) << (+param166))})})
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire139;
  input wire [(4'he):(1'h0)] wire138;
  input wire signed [(2'h3):(1'h0)] wire137;
  input wire signed [(4'h8):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  assign y = {wire165,
                 wire160,
                 wire142,
                 wire141,
                 wire140,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
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
                 (1'h0)};
  assign wire140 = ((-wire135[(2'h2):(2'h2)]) ?
                       (~((wire136 || wire135) >= wire136[(4'h8):(3'h7)])) : ((~|$signed($signed(wire135))) ^ ($signed((wire139 <<< wire138)) * (|wire135[(4'hf):(4'he)]))));
  assign wire141 = (7'h41);
  assign wire142 = ($signed(wire141) | $unsigned(({(-(8'h9f))} ?
                       (wire139 ? (^wire137) : $unsigned(wire136)) : wire140)));
  always
    @(posedge clk) begin
      reg143 <= $unsigned(wire136[(2'h3):(1'h0)]);
      if ($unsigned(wire142[(3'h4):(2'h2)]))
        begin
          if (((wire140 ? wire135 : reg143) ?
              ($unsigned(((7'h42) ?
                  ((8'h9d) >= wire135) : {wire138,
                      (8'haf)})) ^ wire135) : ((+(~^(~wire136))) ~^ ({(wire135 == wire139),
                      wire136} ?
                  $signed(reg143[(1'h1):(1'h1)]) : wire138))))
            begin
              reg144 <= (wire135 ?
                  ($signed((wire137[(1'h1):(1'h0)] <= (~^wire139))) > ((~|((8'hbb) ?
                      wire138 : wire138)) ^ (wire137 ?
                      wire135 : (reg143 > wire137)))) : $unsigned({{((8'hb6) ?
                              wire136 : reg143),
                          ((8'h9d) + wire142)}}));
              reg145 <= $signed(wire137[(1'h0):(1'h0)]);
              reg146 <= wire138;
              reg147 <= wire142;
              reg148 <= wire138;
            end
          else
            begin
              reg144 <= $signed($signed($signed(reg144)));
              reg145 <= ((((wire135[(4'h9):(1'h1)] ?
                          reg145 : {wire136, wire135}) ~^ reg148) ?
                      (^wire140[(4'h9):(3'h4)]) : $unsigned((wire135 && (reg147 ?
                          (8'ha2) : reg147)))) ?
                  reg148[(1'h0):(1'h0)] : ($unsigned((8'h9e)) ?
                      wire140[(3'h6):(2'h3)] : reg143));
            end
        end
      else
        begin
          if ((($unsigned(reg147) ?
              wire141 : (~|reg143[(3'h6):(3'h4)])) > ((wire140 ?
                  $signed($signed(wire142)) : {$signed(wire136),
                      $unsigned(wire135)}) ?
              $signed(($signed(reg143) ?
                  $signed(wire141) : (reg144 ^~ (8'ha6)))) : ($signed(reg144) || (~&(&reg147))))))
            begin
              reg144 <= wire135[(4'h8):(3'h5)];
            end
          else
            begin
              reg144 <= $unsigned($unsigned((^~$signed(wire142))));
              reg145 <= $unsigned((7'h40));
            end
          reg146 <= wire139[(2'h3):(1'h1)];
        end
      if ($signed($unsigned(((wire140[(3'h4):(2'h3)] ~^ wire137[(1'h0):(1'h0)]) ^~ (wire139[(3'h5):(2'h2)] << (-wire140))))))
        begin
          reg149 <= (((((!wire136) ?
                  (wire137 ?
                      reg148 : reg145) : $signed(wire142)) << ($unsigned(wire135) | wire136)) || ($unsigned($unsigned((8'h9f))) ?
                  reg147 : (~(wire136 << wire138)))) ?
              ({(~(wire136 | wire135))} ?
                  (~$signed((8'ha1))) : $unsigned(reg145)) : reg146);
          reg150 <= (~^reg149);
          reg151 <= (wire142[(4'hd):(1'h0)] ?
              (^({$signed(reg144)} < (~(reg146 ?
                  wire139 : wire142)))) : {reg146});
        end
      else
        begin
          reg149 <= reg149[(3'h4):(2'h2)];
          if (wire136[(3'h6):(1'h1)])
            begin
              reg150 <= reg150[(4'hd):(2'h3)];
              reg151 <= wire140[(2'h3):(2'h2)];
              reg152 <= ((($signed($unsigned(reg151)) < {reg144[(1'h1):(1'h0)],
                  reg147}) && reg149) >> $signed({(reg147 ^~ wire137[(1'h1):(1'h0)])}));
            end
          else
            begin
              reg150 <= {{(&reg150[(4'hc):(2'h3)])},
                  (&$signed(($signed(reg148) ?
                      $unsigned(reg147) : ((8'hab) == (8'haa)))))};
              reg151 <= (8'hb5);
              reg152 <= (~|wire136);
              reg153 <= $unsigned((-$signed($signed(reg148))));
              reg154 <= wire137;
            end
          if ((^((wire136[(2'h2):(1'h0)] > $signed(reg147)) | (reg153 ^~ $unsigned({wire137,
              wire139})))))
            begin
              reg155 <= (^~reg150[(4'hc):(3'h6)]);
              reg156 <= reg151;
              reg157 <= wire140[(4'hc):(3'h4)];
            end
          else
            begin
              reg155 <= {(reg150[(4'he):(1'h1)] ?
                      $signed(reg147[(3'h5):(3'h4)]) : $signed({reg151}))};
              reg156 <= (^(~^(~&($signed(wire139) ?
                  {reg143} : wire142[(4'h9):(2'h2)]))));
              reg157 <= $unsigned(wire140[(3'h6):(3'h6)]);
              reg158 <= {((^(-((8'hab) ?
                      reg148 : wire138))) ~^ $unsigned((|(+wire140))))};
              reg159 <= reg149;
            end
        end
    end
  assign wire160 = reg146[(5'h10):(4'he)];
  always
    @(posedge clk) begin
      reg161 <= $unsigned({(((~^wire137) ? reg143[(3'h6):(3'h4)] : (+reg144)) ?
              ((|reg155) ~^ ((8'ha5) <= reg146)) : ((wire141 << (8'hb0)) != $unsigned(reg150)))});
      reg162 <= {(reg158 != reg150[(1'h1):(1'h0)]), reg147};
      reg163 <= (&(reg151[(4'hc):(3'h7)] ?
          $unsigned($signed(reg161)) : (-$unsigned((+reg144)))));
      reg164 <= {(^~wire138[(4'h8):(1'h0)]),
          (~^(((reg150 == (8'hb7)) ?
              $unsigned(reg149) : reg143) >> reg150[(1'h0):(1'h0)]))};
    end
  assign wire165 = $unsigned($signed(($signed((reg161 & (8'hbf))) <= reg163)));
endmodule

module module7
#(parameter param130 = {(-(+(((8'h9c) <= (8'hb7)) != ((8'hae) > (8'hba)))))})
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire128;
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  assign y = {wire93,
                 wire64,
                 wire13,
                 wire62,
                 wire105,
                 wire106,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire128,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire13 = $signed($signed((^$signed((wire8 ^ wire10)))));
  always
    @(posedge clk) begin
      if ((((8'h9d) ?
              $unsigned((^(wire10 ? (8'hac) : wire11))) : $unsigned(((wire13 ?
                  wire10 : wire9) || (wire11 ? (8'h9f) : wire11)))) ?
          (~$signed(wire9)) : $signed(($signed((8'hbb)) ?
              ($signed(wire13) ^~ (~^wire12)) : ($unsigned((8'hac)) ^~ (wire13 >>> (7'h43)))))))
        begin
          reg14 <= wire8[(2'h3):(1'h1)];
          reg15 <= $unsigned(wire8);
        end
      else
        begin
          if (wire12)
            begin
              reg14 <= ($unsigned(($signed($unsigned(wire13)) ?
                  ($signed(wire10) ?
                      {reg14} : ((8'hb9) ? wire8 : reg14)) : ((8'hbb) ?
                      (reg15 ?
                          reg15 : reg15) : (+wire12)))) < ((8'ha3) > $signed(reg14)));
              reg15 <= {($signed($signed($unsigned(wire8))) >= $unsigned($signed({reg14}))),
                  (reg15 != wire11)};
              reg16 <= (((reg14[(1'h0):(1'h0)] ?
                      ($signed((8'h9c)) >> wire9[(1'h0):(1'h0)]) : ((wire12 & wire9) >>> $unsigned((8'hbb)))) - $unsigned((!$signed(reg14)))) ?
                  $unsigned(wire10[(2'h2):(1'h0)]) : (wire10 >= (8'hb8)));
            end
          else
            begin
              reg14 <= $unsigned(((~|wire12[(4'h9):(2'h2)]) ?
                  reg15 : (($unsigned(wire8) + (|wire8)) == {(reg14 | wire11)})));
              reg15 <= $unsigned((^$unsigned($signed(((8'hb1) ?
                  wire11 : wire12)))));
              reg16 <= (~|(!$unsigned(reg16[(4'hd):(3'h6)])));
              reg17 <= (&wire12);
            end
          if ($unsigned((8'hb8)))
            begin
              reg18 <= wire9[(4'h9):(1'h1)];
            end
          else
            begin
              reg18 <= wire8[(1'h1):(1'h0)];
              reg19 <= $unsigned(wire13[(4'hf):(2'h3)]);
              reg20 <= $unsigned((reg16[(4'hc):(2'h2)] * (wire13 ?
                  (reg16 && $unsigned(reg19)) : reg18)));
            end
        end
      reg21 <= {{wire12[(4'hd):(4'hb)], $unsigned(((8'h9c) ^ $signed(reg18)))}};
    end
  module22 #() modinst63 (.wire25(reg15), .clk(clk), .wire23(reg16), .wire24(wire10), .wire26(reg18), .y(wire62));
  assign wire64 = {$signed((wire11 ? {(~wire8)} : wire8)), reg17};
  module65 #() modinst94 (.wire70(reg14), .wire66(reg18), .clk(clk), .wire69(reg20), .y(wire93), .wire68(reg19), .wire67(wire64));
  always
    @(posedge clk) begin
      if (((reg14[(4'hb):(4'ha)] ?
              ($unsigned(wire8[(2'h2):(2'h2)]) ?
                  ((reg19 ? reg20 : wire12) ?
                      (^reg15) : reg15) : (&$signed(wire13))) : $signed($signed((reg19 >= reg14)))) ?
          wire10[(4'hc):(3'h4)] : {(((wire9 ? wire10 : wire8) ?
                      wire64 : $signed(wire93)) ?
                  ($signed((8'ha5)) & (~&reg15)) : wire64)}))
        begin
          reg95 <= (wire10 ? $signed(reg19) : {(8'ha1)});
          reg96 <= ({$signed(({wire12} ? reg17 : wire9)),
                  $unsigned($unsigned($unsigned(wire62)))} ?
              wire10[(3'h7):(2'h3)] : reg95);
          reg97 <= $unsigned((!(reg17[(2'h3):(1'h0)] ?
              ((wire13 < wire64) ?
                  (8'h9c) : $unsigned((8'hb7))) : $signed($signed((8'hb8))))));
          reg98 <= (wire64 && (reg97[(2'h2):(2'h2)] > $signed($signed($signed(reg20)))));
        end
      else
        begin
          reg95 <= reg96;
          if (wire13[(4'h9):(1'h0)])
            begin
              reg96 <= (~^reg19[(3'h7):(2'h2)]);
              reg97 <= (-{(({reg17,
                      reg97} >>> reg20[(4'hd):(4'h8)]) ~^ wire62)});
              reg98 <= (8'ha6);
              reg99 <= (((((^wire11) ? $signed(reg19) : (8'ha7)) > ((+reg97) ?
                          $unsigned(reg20) : $unsigned(wire11))) ?
                      $unsigned((^~reg15)) : {(reg21 ?
                              reg19[(4'ha):(4'ha)] : $signed((8'hb8))),
                          $signed((reg17 ^ reg21))}) ?
                  (+wire62) : (~&$signed(wire8[(2'h2):(1'h1)])));
            end
          else
            begin
              reg96 <= wire11[(3'h5):(2'h2)];
              reg97 <= wire64;
            end
          reg100 <= (wire64[(3'h6):(3'h5)] << $signed({reg96}));
          reg101 <= {reg18,
              ($unsigned($signed(reg100[(5'h12):(4'hf)])) ?
                  {$unsigned(wire8)} : {wire12})};
        end
      reg102 <= (8'had);
      reg103 <= $signed((~^reg102[(3'h7):(3'h6)]));
      reg104 <= wire13[(4'hb):(3'h5)];
    end
  assign wire105 = ($signed($unsigned(reg19)) != $signed(($unsigned($signed(reg95)) ?
                       $unsigned(((8'haa) - wire64)) : ((~^reg19) || $unsigned(reg104)))));
  assign wire106 = (($unsigned(((reg17 ? reg16 : wire11) ?
                           $signed(wire93) : $unsigned((8'hb2)))) ?
                       reg21 : ((^reg100) - (reg99 ?
                           reg100 : reg101[(4'hb):(3'h4)]))) << ((^~$unsigned(reg18)) ?
                       ((wire13 ^ $unsigned(wire64)) ^~ $signed(reg98[(1'h0):(1'h0)])) : ((^~(^~reg14)) != (reg17[(2'h3):(2'h2)] ?
                           wire64[(3'h4):(2'h3)] : $unsigned((8'hb6))))));
  always
    @(posedge clk) begin
      reg107 <= ($unsigned(reg101) ?
          {((|$unsigned(reg15)) + {$signed(reg16)})} : $unsigned(wire13[(3'h7):(3'h6)]));
      reg108 <= {$unsigned(((~(8'ha7)) <<< (wire11 ?
              ((8'hbc) ? reg107 : reg97) : (wire13 ? reg107 : reg101))))};
      reg109 <= wire105;
      reg110 <= ((($unsigned((|wire105)) ?
          reg101[(3'h6):(1'h1)] : {$signed(reg16),
              (^reg100)}) ~^ ($unsigned((!reg95)) != ((^~reg15) ~^ (reg14 >> wire93)))) << $unsigned(reg15));
    end
  assign wire111 = (($unsigned(reg16[(3'h7):(1'h1)]) ?
                           (wire62 ?
                               {$signed(wire8),
                                   {reg104}} : {wire10[(4'hb):(3'h5)],
                                   $signed(wire8)}) : $unsigned((7'h44))) ?
                       wire9 : (+(~reg18)));
  assign wire112 = (wire62[(2'h2):(1'h0)] ?
                       {reg102} : (wire111[(1'h0):(1'h0)] <= $signed((reg21[(3'h5):(1'h0)] < wire13[(4'ha):(4'h8)]))));
  assign wire113 = (+{wire10});
  assign wire114 = wire10;
  assign wire115 = ($unsigned({$unsigned($signed(reg16)),
                       $signed($signed((8'ha6)))}) <= ($unsigned({{wire105},
                           (+reg95)}) ?
                       wire10 : (-(&(reg18 * reg100)))));
  module116 #() modinst129 (wire128, clk, wire64, wire115, reg17, wire11, reg109);
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire121;
  input wire signed [(5'h12):(1'h0)] wire120;
  input wire signed [(5'h13):(1'h0)] wire119;
  input wire signed [(2'h3):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(5'h11):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  assign y = {wire127, wire126, wire125, wire124, wire123, wire122, (1'h0)};
  assign wire122 = (|$unsigned(wire118[(2'h3):(2'h3)]));
  assign wire123 = wire122;
  assign wire124 = wire118[(2'h2):(1'h0)];
  assign wire125 = {$signed($unsigned($unsigned($unsigned(wire124)))),
                       (({(wire122 >>> wire122)} ?
                               $signed(wire118[(2'h2):(2'h2)]) : {(~&wire123)}) ?
                           $signed($signed($unsigned(wire118))) : (&{$signed(wire122)}))};
  assign wire126 = (wire120[(2'h2):(1'h1)] ?
                       wire118[(2'h3):(2'h3)] : (wire120[(4'ha):(2'h3)] <<< (({wire119} && (8'hab)) ?
                           ((wire117 || (8'ha2)) ?
                               wire118 : $signed(wire122)) : ((wire121 ?
                               (8'h9d) : wire121) | (7'h40)))));
  assign wire127 = (wire117 >>> (-(8'hb8)));
endmodule

module module65
#(parameter param91 = ((({{(8'hbc)}, ((8'ha6) != (8'ha9))} != {((8'ha7) >>> (8'hb5))}) == ((+{(8'hbe), (8'had)}) ? {{(8'ha3), (8'haa)}, ((8'ha5) != (8'ha1))} : (((8'hb2) < (8'hb9)) > ((8'hb8) * (8'ha1))))) || ({({(8'hbf)} ? (~(7'h44)) : ((7'h42) ? (8'h9f) : (8'hae))), (((7'h43) ? (7'h41) : (8'hae)) && (~(8'hbb)))} >> {(+((8'hab) >>> (8'h9f)))})), 
parameter param92 = ({param91, param91} ? (!((7'h40) ^~ param91)) : (8'hbf)))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire70;
  input wire signed [(5'h12):(1'h0)] wire69;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire [(2'h3):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg86,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({(8'hab), (wire67[(2'h2):(1'h1)] <= $signed((|(8'hbe))))}))
        begin
          if ($unsigned((wire68[(3'h7):(1'h1)] ?
              (wire69[(4'hb):(3'h6)] < {wire67[(2'h3):(1'h1)],
                  ((8'hbf) ? wire66 : wire68)}) : wire70[(2'h2):(2'h2)])))
            begin
              reg71 <= (wire68[(3'h4):(1'h1)] ?
                  ((wire67 & (wire70 ?
                          $unsigned(wire68) : wire68[(4'h8):(3'h4)])) ?
                      ((wire66 ?
                          {wire68} : (wire68 ^ wire66)) == wire68[(1'h0):(1'h0)]) : (-(^$unsigned(wire67)))) : (((wire69[(4'hc):(3'h7)] || (&(8'ha0))) ?
                      {wire69} : {wire69,
                          (wire67 - (8'hbc))}) | $unsigned(wire69)));
              reg72 <= {({wire66,
                          ((wire66 ? wire68 : wire66) ?
                              $signed(wire70) : wire67)} ?
                      $unsigned($unsigned($signed(wire69))) : (wire70[(4'h8):(3'h5)] | (((7'h40) ?
                          wire68 : (8'ha5)) >= (~&wire69)))),
                  $signed((8'hb5))};
              reg73 <= $signed((wire69[(3'h5):(2'h2)] ?
                  $unsigned($signed((~|wire69))) : $unsigned($unsigned($signed(wire66)))));
            end
          else
            begin
              reg71 <= ($signed((~&$signed({wire69}))) ?
                  (((|(~&reg71)) ~^ $signed((~&reg72))) ?
                      ($unsigned($signed(wire69)) >= $signed((reg71 ?
                          reg71 : reg73))) : (((wire70 ?
                          wire68 : wire66) | (reg73 ?
                          reg71 : wire69)) - {(+(8'haa)),
                          reg72})) : (($signed({wire68, reg73}) ?
                      ((wire68 ? reg72 : wire66) ?
                          ((8'hb0) ? wire67 : wire67) : {wire69,
                              wire66}) : $signed($unsigned(wire68))) >>> ((8'ha3) ?
                      $unsigned($unsigned(wire70)) : ((~(7'h41)) ^ wire67[(2'h3):(1'h0)]))));
            end
          if (($signed((wire68 || (~|(~&reg73)))) ^~ (($unsigned(reg71[(3'h4):(2'h3)]) | reg71[(3'h4):(2'h3)]) <<< $unsigned((reg71[(3'h4):(1'h0)] <= {reg73,
              wire70})))))
            begin
              reg74 <= ($signed($signed($unsigned(reg73[(2'h2):(2'h2)]))) & (wire68[(1'h1):(1'h1)] ?
                  wire68[(2'h2):(1'h1)] : (7'h40)));
              reg75 <= $signed(reg71);
              reg76 <= {$unsigned($signed(wire66))};
            end
          else
            begin
              reg74 <= ({$unsigned({(&wire66)})} >= $unsigned((wire67 ?
                  ((wire68 ?
                      wire70 : reg75) >= reg73[(2'h2):(1'h0)]) : wire67[(1'h1):(1'h0)])));
              reg75 <= ((-reg74[(2'h3):(1'h1)]) ?
                  (($signed($signed((8'h9e))) ?
                          ((reg71 ?
                              wire70 : reg72) > wire70[(4'h9):(4'h8)]) : $unsigned((|(8'hbf)))) ?
                      reg73[(2'h2):(1'h1)] : $signed(reg72)) : reg75);
              reg76 <= (!reg72[(1'h0):(1'h0)]);
              reg77 <= {$unsigned((wire67 ?
                      (~&(|reg71)) : reg74[(2'h3):(2'h3)])),
                  $signed(reg76[(4'he):(4'h9)])};
            end
        end
      else
        begin
          reg71 <= (reg75[(1'h0):(1'h0)] ^ (wire68 ?
              (reg73[(1'h1):(1'h0)] ?
                  ((reg71 >> (8'hbb)) ?
                      (reg77 <= wire68) : (8'hb5)) : $unsigned((8'hbb))) : $unsigned({$signed(wire69)})));
          reg72 <= $unsigned(reg71);
          reg73 <= $signed(($unsigned((~|((8'hb9) <<< (8'h9e)))) ?
              (wire70 > (+wire69)) : wire70[(3'h5):(1'h0)]));
          reg74 <= $signed(reg73);
        end
      reg78 <= reg74[(4'h8):(3'h7)];
      reg79 <= (8'ha5);
    end
  assign wire80 = $signed((wire67[(2'h3):(1'h1)] << ((reg74 == reg77[(1'h1):(1'h0)]) ?
                      ($signed(reg71) ?
                          $signed(wire67) : {wire70}) : $signed((wire68 ?
                          reg77 : reg75)))));
  assign wire81 = (($signed({reg74[(4'hb):(3'h7)], $unsigned(reg77)}) ?
                          ($signed((^reg73)) ?
                              ($signed(reg74) ?
                                  (wire80 ?
                                      (8'hb2) : wire68) : $signed(wire80)) : reg76) : ($unsigned((wire66 <= wire80)) >= wire69[(4'hf):(4'h9)])) ?
                      {{(&$signed(reg75))},
                          $signed(((wire67 * reg71) ?
                              (reg78 ?
                                  (8'ha2) : reg74) : $unsigned((8'hb1))))} : $unsigned(((-reg76[(5'h10):(3'h5)]) <= wire67)));
  assign wire82 = reg73[(2'h2):(1'h1)];
  assign wire83 = ((((reg76[(3'h5):(2'h3)] + {reg71, reg72}) ?
                              $unsigned((wire69 ^ reg79)) : {$signed(reg78),
                                  {wire80, reg79}}) ?
                          reg73 : wire80) ?
                      $signed(({((8'hbc) || (8'hb3))} ?
                          (reg77 != (~|wire69)) : ({wire69} ?
                              (~&reg78) : (^~wire68)))) : $signed(reg72[(2'h2):(1'h1)]));
  assign wire84 = $unsigned({({(&wire68), $unsigned(wire67)} ?
                          reg77[(4'he):(4'h8)] : wire80),
                      $unsigned(wire67[(1'h0):(1'h0)])});
  assign wire85 = (reg73 ?
                      wire69 : {(((8'hb4) ?
                              $signed(wire83) : $signed(reg76)) << {$signed(wire82)}),
                          reg78[(3'h7):(1'h0)]});
  always
    @(posedge clk) begin
      reg86 <= (~(($unsigned(wire80[(4'he):(4'hb)]) < {{reg79, wire82}}) ?
          $unsigned(reg79[(3'h4):(1'h1)]) : (((^~wire70) * (^reg71)) ?
              {wire82[(4'h8):(4'h8)], $signed(wire67)} : ($signed(wire69) ?
                  reg73[(2'h3):(2'h2)] : ((8'h9d) ? wire67 : wire81)))));
    end
  assign wire87 = $signed(wire70);
  assign wire88 = $unsigned(reg78);
  assign wire89 = (+$unsigned((reg77 ? $signed((reg74 | reg77)) : (~|reg71))));
  assign wire90 = (^(wire82[(4'hc):(3'h5)] ?
                      {$signed((reg72 > reg73))} : $signed(reg73)));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire [(5'h11):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire27 = $signed($signed((((~^(8'hba)) || (!wire24)) >= (~(wire24 >= wire23)))));
  assign wire28 = $signed(wire25);
  assign wire29 = wire28[(3'h5):(2'h3)];
  assign wire30 = (((|($signed(wire28) ? (&wire26) : (wire28 ^~ wire27))) ?
                          (!((wire29 ~^ wire28) | (wire26 != wire28))) : wire24[(3'h6):(3'h5)]) ?
                      $signed($unsigned((|(wire29 < wire27)))) : $signed(wire24));
  assign wire31 = ($signed((&$signed((8'h9d)))) || wire30[(3'h6):(3'h4)]);
  assign wire32 = $signed((((^~(~^wire26)) ?
                          (+wire23[(3'h6):(2'h3)]) : wire28[(3'h5):(1'h1)]) ?
                      ((&(wire23 ? (7'h40) : wire28)) ?
                          wire29[(3'h4):(2'h3)] : $unsigned($unsigned(wire24))) : $unsigned($signed((wire31 ?
                          wire28 : wire28)))));
  assign wire33 = wire23[(2'h3):(1'h0)];
  assign wire34 = wire33[(4'hf):(4'hd)];
  assign wire35 = (!(|$unsigned($signed((wire33 < wire31)))));
  always
    @(posedge clk) begin
      if (wire35[(3'h5):(1'h1)])
        begin
          if (wire27[(4'hb):(1'h0)])
            begin
              reg36 <= ($signed((~&$signed($unsigned(wire25)))) ?
                  wire28 : ($unsigned({{wire30}}) ?
                      (~{wire23}) : $signed({$signed(wire33),
                          $unsigned(wire24)})));
              reg37 <= (wire23 & wire26[(1'h1):(1'h1)]);
              reg38 <= wire28;
              reg39 <= (~&$signed((~&$unsigned(wire25[(3'h5):(2'h2)]))));
              reg40 <= (^~$signed($signed(wire32)));
            end
          else
            begin
              reg36 <= (^$signed($signed((8'hb4))));
              reg37 <= ({(-{(+reg38)})} ?
                  wire31 : ((~(((8'ha6) ^ wire24) ?
                          (|wire30) : {wire23, wire32})) ?
                      wire23[(1'h0):(1'h0)] : wire33[(4'hd):(2'h3)]));
              reg38 <= (reg37 ?
                  $unsigned(reg38) : $unsigned({(&(wire27 != wire24)),
                      wire31[(5'h14):(2'h2)]}));
              reg39 <= (((~&$unsigned((|wire34))) ?
                      $unsigned((reg40 <<< (-wire28))) : ($signed((reg39 + wire32)) * $signed(((8'ha0) ?
                          wire24 : (8'hb2))))) ?
                  (+{(reg39 << (|(8'hbe))), wire31[(2'h3):(1'h1)]}) : ((reg36 ?
                      ({wire24} ?
                          reg39 : wire24[(3'h6):(3'h4)]) : $unsigned((~wire26))) | $unsigned($unsigned(wire34[(1'h0):(1'h0)]))));
            end
          reg41 <= (reg40[(3'h4):(2'h3)] ?
              {(~|(8'hb9))} : ((~|({reg39} >>> $signed(wire31))) ^ $signed((wire32 ?
                  wire29 : (|reg36)))));
          reg42 <= wire32;
          reg43 <= reg39;
        end
      else
        begin
          reg36 <= (wire29[(1'h1):(1'h0)] >> wire24);
          reg37 <= reg42[(4'hc):(4'hc)];
          reg38 <= $signed($signed({(+$signed(wire29)), reg36}));
        end
      if (({(($unsigned(reg36) ~^ reg38) ?
              reg39[(3'h5):(2'h3)] : $unsigned($unsigned(reg42))),
          ((wire28[(3'h4):(3'h4)] <<< wire32[(4'hb):(4'h9)]) & reg36[(4'h9):(4'h8)])} << reg39))
        begin
          if ($unsigned(reg42))
            begin
              reg44 <= $unsigned($signed($signed(reg38)));
              reg45 <= reg40[(4'h9):(3'h4)];
              reg46 <= $signed(((reg43 ?
                  wire31[(5'h13):(3'h7)] : $unsigned(wire28)) + (8'hb1)));
              reg47 <= reg39[(4'hc):(1'h0)];
              reg48 <= (reg42 >= wire26);
            end
          else
            begin
              reg44 <= reg37[(3'h4):(3'h4)];
              reg45 <= {((({wire27, wire23} ?
                              (reg38 ? reg39 : reg40) : reg46[(1'h0):(1'h0)]) ?
                          {{reg47, wire30}} : wire26[(1'h1):(1'h1)]) ?
                      $signed($unsigned(wire30[(2'h2):(1'h0)])) : (+$signed((wire25 >= reg44)))),
                  (8'hac)};
              reg46 <= wire27;
            end
          reg49 <= (wire31[(4'h9):(3'h6)] ?
              ((((wire34 != wire34) <= {wire33, reg45}) != ($signed((8'ha5)) ?
                  (|(8'hac)) : (wire31 + reg47))) && {wire25,
                  $signed(wire31[(1'h0):(1'h0)])}) : wire26);
        end
      else
        begin
          reg44 <= ((^({(reg41 ? wire23 : reg38)} >= {(reg37 ? reg44 : reg37),
                  (wire31 << reg43)})) ?
              reg46 : wire33[(4'hb):(1'h0)]);
        end
      reg50 <= (wire28 ?
          wire24[(4'hd):(1'h0)] : (~^{(^wire35[(1'h0):(1'h0)]),
              {$signed(wire26), ((8'hbc) <= (8'ha0))}}));
      if ($signed($signed((((+reg46) * (reg39 + wire35)) | ((~|wire31) ?
          ((8'hbe) ? reg44 : reg41) : reg49[(3'h5):(3'h4)])))))
        begin
          if ({reg47[(1'h0):(1'h0)], (reg47[(1'h0):(1'h0)] ? reg50 : wire29)})
            begin
              reg51 <= (~^$signed(($signed($signed(wire32)) ?
                  $signed($signed(wire23)) : reg36)));
              reg52 <= (+$unsigned($unsigned(reg51[(4'hf):(4'ha)])));
              reg53 <= $unsigned($signed(($signed($unsigned(reg41)) ?
                  reg39 : ((|reg51) << $signed(wire27)))));
              reg54 <= {reg51[(4'h9):(1'h1)], $signed(wire26[(2'h2):(1'h0)])};
            end
          else
            begin
              reg51 <= (-((!({wire35} ^~ (8'hae))) != {{reg40},
                  ($signed(reg46) ? reg43 : (reg40 ~^ wire23))}));
            end
        end
      else
        begin
          if ((-wire32[(1'h1):(1'h0)]))
            begin
              reg51 <= (((~&(((8'hac) ? wire24 : wire25) ?
                          wire32[(1'h0):(1'h0)] : reg39)) ?
                      $unsigned(reg41) : reg44) ?
                  $unsigned($signed(($signed(wire32) ?
                      reg48 : (~|reg54)))) : reg41[(3'h6):(3'h5)]);
              reg52 <= ({reg38[(3'h6):(3'h5)]} ~^ (({reg52} + ($signed(wire31) ?
                      (reg50 ? (8'hb3) : wire25) : {wire35})) ?
                  $unsigned(((wire33 ?
                      wire32 : wire29) ~^ reg42[(4'h9):(4'h8)])) : wire27[(2'h3):(2'h2)]));
            end
          else
            begin
              reg51 <= ({reg42} >> wire30);
            end
          if ($unsigned((reg48[(4'hf):(3'h7)] == (reg54[(3'h7):(3'h4)] ?
              $unsigned((reg40 >>> wire35)) : $unsigned($signed(wire30))))))
            begin
              reg53 <= reg52;
              reg54 <= $signed({reg50});
              reg55 <= {(((wire32 ^ {reg40, wire33}) ?
                          wire23 : {((7'h43) ? reg51 : wire27),
                              $signed(reg37)}) ?
                      ($unsigned(wire33[(3'h6):(2'h2)]) ?
                          wire33[(4'ha):(3'h7)] : ((wire33 ?
                              wire24 : reg52) <<< $signed(wire26))) : $signed($signed(reg53))),
                  ($unsigned({reg52}) ?
                      (($unsigned((8'ha0)) >>> reg48) ?
                          $unsigned((^~wire25)) : $unsigned($signed(reg45))) : (8'hbd))};
            end
          else
            begin
              reg53 <= $signed($unsigned(($unsigned($unsigned(wire27)) ?
                  (((8'hb3) >= (8'hb7)) ^~ $signed((8'hbf))) : reg43[(3'h5):(1'h0)])));
              reg54 <= $signed(wire30[(3'h4):(3'h4)]);
              reg55 <= $signed((|$unsigned((8'hb2))));
              reg56 <= $signed((reg36 ? reg37 : {$signed($signed(reg53))}));
              reg57 <= $unsigned($signed($unsigned((wire23[(1'h1):(1'h1)] > {wire31}))));
            end
          reg58 <= $signed((^~(+reg54)));
        end
      reg59 <= $unsigned(reg54);
    end
  assign wire60 = ((|$signed(($unsigned(reg40) ?
                          $signed(reg52) : (reg57 >>> reg44)))) ?
                      ($signed({(reg42 - reg53)}) - ($unsigned((~|wire27)) ?
                          ((~|reg45) ?
                              wire33 : (reg38 ?
                                  wire28 : wire35)) : (^~$signed((8'hb8))))) : (~|(8'ha6)));
  assign wire61 = reg51;
endmodule
