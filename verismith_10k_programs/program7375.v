module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire210;
  wire signed [(4'hc):(1'h0)] wire209;
  wire signed [(5'h14):(1'h0)] wire208;
  wire [(3'h5):(1'h0)] wire207;
  wire [(2'h3):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire203;
  wire [(2'h3):(1'h0)] wire202;
  wire [(4'hc):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire198;
  wire [(5'h15):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire192,
                 wire16,
                 wire15,
                 wire14,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= ((^wire3[(2'h2):(1'h0)]) == (((!$unsigned(wire3)) ~^ (&$unsigned(wire4))) ?
          ($signed($signed(wire4)) ?
              $signed(wire1[(2'h2):(1'h0)]) : wire2) : wire0[(4'h8):(2'h3)]));
      reg7 <= (wire4[(4'ha):(4'h8)] >> wire2[(3'h7):(3'h7)]);
      reg8 <= wire0[(1'h0):(1'h0)];
      if (($unsigned(reg7[(3'h6):(2'h2)]) == {wire1, wire4[(4'hb):(2'h2)]}))
        begin
          if (wire3)
            begin
              reg9 <= (wire2 ?
                  $unsigned({((reg8 ? reg7 : wire1) + (reg8 ? reg6 : wire3)),
                      ((~&wire2) ? $unsigned(wire3) : (~wire1))}) : wire4);
              reg10 <= (|(({reg6[(4'hb):(3'h6)],
                  (-reg7)} >>> $signed(wire2)) >= $unsigned((~|reg6[(3'h7):(2'h2)]))));
              reg11 <= $unsigned($unsigned((wire1 ?
                  ((reg8 <<< reg10) ?
                      (wire0 >>> wire1) : $signed((8'hb9))) : reg10[(1'h1):(1'h1)])));
              reg12 <= (({$signed(reg5[(5'h10):(3'h4)]),
                          ((-wire2) ? (-wire3) : reg6[(2'h3):(1'h1)])} ?
                      $unsigned((+$signed((8'hb7)))) : ((^wire1) || $signed(reg11[(4'h8):(2'h2)]))) ?
                  ((reg6[(5'h13):(3'h7)] ?
                      reg7[(1'h0):(1'h0)] : ((~&reg9) + reg9[(3'h6):(3'h4)])) * {(wire1 ?
                          wire1[(3'h5):(1'h0)] : wire1)}) : {(~|(~&reg7)),
                      $signed((|(+wire3)))});
              reg13 <= $unsigned(wire4[(4'hc):(4'ha)]);
            end
          else
            begin
              reg9 <= (&((~^(&(reg5 ^ wire1))) ?
                  $signed({reg9[(3'h7):(2'h3)]}) : {(~&wire0[(3'h6):(3'h6)]),
                      ($unsigned(reg8) ?
                          $unsigned((8'hb6)) : $signed((7'h42)))}));
              reg10 <= (~^reg5[(4'h9):(2'h3)]);
            end
        end
      else
        begin
          reg9 <= (~|(|$signed((|$signed(reg9)))));
          reg10 <= $signed({{((^wire1) ?
                      (wire0 ? wire4 : reg11) : (wire1 ? reg11 : reg12)),
                  reg12[(2'h3):(2'h2)]}});
          reg11 <= wire4;
        end
    end
  assign wire14 = $unsigned($unsigned(reg9[(3'h6):(3'h5)]));
  assign wire15 = wire1;
  assign wire16 = reg5[(5'h14):(4'hd)];
  module17 #() modinst193 (wire192, clk, reg11, reg5, reg13, reg8, reg6);
  assign wire194 = $signed(reg12);
  assign wire195 = (wire14 << $signed($unsigned($signed($signed(reg6)))));
  assign wire196 = (($unsigned(reg12) ?
                       reg12 : (wire195 >= (wire1[(3'h4):(1'h0)] ?
                           $unsigned((8'ha0)) : (8'ha9)))) < $signed((($signed(wire3) ?
                           {wire195, wire15} : (reg10 ? reg10 : reg11)) ?
                       (~|$unsigned(wire14)) : wire0)));
  assign wire197 = reg9[(3'h4):(1'h0)];
  assign wire198 = ($signed($signed($signed((^wire14)))) * $unsigned((wire1 >>> reg7[(2'h3):(2'h3)])));
  assign wire199 = {(!(($unsigned((8'hb2)) ?
                               $unsigned(wire1) : reg6[(3'h5):(3'h5)]) ?
                           reg12 : (8'hbf))),
                       (~&({(~wire15)} ?
                           (!reg9[(3'h4):(1'h0)]) : wire195[(1'h0):(1'h0)]))};
  assign wire200 = $signed(wire3[(2'h3):(2'h2)]);
  assign wire201 = (({(((7'h41) ? reg10 : (7'h43)) ?
                                   (^~wire3) : reg6[(5'h13):(4'hc)])} ?
                           wire198[(4'h9):(3'h4)] : reg9) ?
                       (+(((~&wire196) == (^(8'hbf))) ?
                           (+(wire192 ? reg12 : wire2)) : ($signed(reg10) ?
                               {wire4} : (reg6 != wire4)))) : ((~|(wire192 <= $unsigned(reg10))) >>> wire196[(2'h2):(1'h0)]));
  assign wire202 = wire200;
  assign wire203 = ((($signed((wire199 - reg10)) ?
                           reg10 : $unsigned(((8'hb3) > reg7))) ^~ reg11[(2'h3):(1'h1)]) ?
                       (wire194[(2'h3):(2'h2)] ?
                           $signed(reg12[(1'h1):(1'h1)]) : {wire195,
                               ((reg8 >= wire197) == reg8)}) : (^~reg13[(5'h12):(5'h12)]));
  assign wire204 = $unsigned((!$unsigned(((wire201 | wire201) ^~ $signed(wire199)))));
  assign wire205 = (reg11 != wire0[(4'h8):(1'h0)]);
  assign wire206 = (wire195 ^~ (8'h9d));
  assign wire207 = wire16[(3'h4):(1'h0)];
  assign wire208 = ((wire207[(3'h5):(1'h0)] ? wire207 : (&(8'hbe))) ?
                       reg13[(4'hb):(2'h3)] : (+$signed(reg7)));
  assign wire209 = {($unsigned(wire202[(2'h2):(1'h0)]) ?
                           ($signed(wire200[(2'h3):(2'h3)]) ?
                               wire0 : wire202[(2'h2):(1'h1)]) : wire198)};
  assign wire210 = (8'hb0);
endmodule

module module17
#(parameter param191 = {(((^((8'hbb) >> (8'ha4))) ? (^((8'hbb) ? (8'ha4) : (8'hb5))) : (((7'h42) ? (8'ha8) : (8'h9d)) ? ((8'ha8) ^~ (8'h9e)) : ((8'hba) <= (8'hae)))) + (((|(8'hb1)) < (|(8'haa))) ? ((~(8'ha7)) && {(8'hb1), (8'hba)}) : (~|((8'hb9) ^ (8'hb6))))), (^((~|((8'ha3) ? (7'h44) : (8'hbe))) ? ({(8'ha7)} ? (7'h44) : ((8'haf) - (8'haa))) : (((8'hb5) >= (7'h41)) == ((8'ha8) < (8'ha6)))))})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire188;
  assign y = {wire190,
                 wire74,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire126,
                 wire128,
                 wire129,
                 wire130,
                 wire188,
                 (1'h0)};
  assign wire23 = $signed(wire18);
  assign wire24 = ({$signed(((!wire22) || ((8'hb3) ? wire18 : (8'hbf)))),
                      (^wire20)} & ((|wire21[(4'he):(2'h3)]) >> wire18[(4'he):(4'he)]));
  assign wire25 = wire20;
  assign wire26 = wire19;
  assign wire27 = wire20;
  module28 #() modinst75 (.wire33(wire25), .wire31(wire21), .wire29(wire22), .clk(clk), .wire30(wire19), .wire32(wire20), .y(wire74));
  assign wire76 = wire18;
  assign wire77 = $signed(wire19[(4'h8):(3'h7)]);
  assign wire78 = $signed(wire77[(3'h5):(2'h2)]);
  assign wire79 = (~&wire19);
  assign wire80 = (((~$unsigned(wire27)) ?
                      ($unsigned($unsigned(wire23)) ?
                          wire19[(4'he):(1'h1)] : (wire21[(4'h9):(3'h5)] ^ $signed(wire18))) : (($unsigned((8'hac)) >> wire24) ^ {wire20})) * (+{$unsigned((&(8'hb9)))}));
  assign wire81 = ({wire21} ?
                      (-((&wire19[(4'h9):(1'h0)]) ?
                          (8'hab) : (8'h9e))) : $unsigned(wire27[(2'h2):(1'h1)]));
  assign wire82 = $unsigned((~$signed(({wire21} ? wire19 : (~^wire81)))));
  module83 #() modinst127 (wire126, clk, wire81, wire20, wire77, wire79);
  assign wire128 = wire81;
  assign wire129 = $unsigned(wire24[(5'h12):(4'hd)]);
  assign wire130 = wire129[(2'h3):(2'h2)];
  module131 #() modinst189 (.y(wire188), .wire132(wire77), .wire133(wire81), .clk(clk), .wire134(wire23), .wire135(wire130), .wire136(wire26));
  assign wire190 = ((($unsigned($signed(wire25)) >>> (+(wire77 ?
                               wire129 : wire24))) ?
                           wire81[(4'hc):(2'h3)] : {$unsigned((~wire79))}) ?
                       wire129[(2'h3):(1'h1)] : $unsigned(($unsigned($unsigned(wire23)) ?
                           {$unsigned(wire128),
                               {wire76}} : $signed($signed((8'haa))))));
endmodule

module module131
#(parameter param186 = (({(((8'ha7) ? (8'ha0) : (8'had)) + (-(8'haa))), (((8'ha6) ? (7'h42) : (8'hb1)) ? (~(8'ha8)) : {(7'h40)})} >>> (~(~(^(8'haa))))) ? (^~(8'ha9)) : ((|{((8'ha3) - (7'h44)), (+(8'ha9))}) ? (~(8'hb8)) : (((~&(8'ha6)) ? ((8'ha2) ? (8'h9c) : (7'h41)) : {(8'hb4), (8'hbb)}) ? (((7'h40) | (8'hac)) < ((8'h9e) << (8'hbb))) : (~(|(8'ha8)))))), 
parameter param187 = ((!{param186}) ? (param186 & (8'hb1)) : ((|(((8'hb8) ? param186 : param186) | (~param186))) == (~|param186))))
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  input wire [(3'h7):(1'h0)] wire134;
  input wire signed [(4'hd):(1'h0)] wire133;
  input wire signed [(3'h6):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire185;
  wire [(3'h5):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire signed [(5'h11):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire [(4'hf):(1'h0)] wire168;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  reg signed [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire170,
                 wire169,
                 wire168,
                 wire139,
                 wire138,
                 wire137,
                 reg180,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
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
                 reg140,
                 (1'h0)};
  assign wire137 = ((^$unsigned(((!wire136) ?
                       (wire136 ?
                           wire134 : wire136) : (^~wire132)))) >= wire132[(3'h4):(1'h0)]);
  assign wire138 = {wire135[(2'h2):(2'h2)], $signed((8'hb6))};
  assign wire139 = $signed($unsigned($unsigned(($unsigned(wire134) != {wire135}))));
  always
    @(posedge clk) begin
      if (wire132)
        begin
          reg140 <= wire135;
          reg141 <= (^~(&$signed($signed(wire132[(2'h2):(1'h0)]))));
          reg142 <= wire132;
          reg143 <= (~^(wire136[(1'h1):(1'h0)] ?
              $signed((^$signed(wire135))) : $signed(wire139)));
        end
      else
        begin
          reg140 <= $unsigned((~&wire136));
          reg141 <= reg142[(5'h10):(3'h4)];
          reg142 <= ({(~&(reg140[(1'h0):(1'h0)] ~^ (reg142 ?
                  reg142 : (8'haa)))),
              $unsigned($signed(reg143[(3'h6):(1'h0)]))} >> ($signed(reg140[(3'h7):(3'h4)]) ?
              ((((8'ha6) ? reg143 : (7'h42)) > (wire134 << wire135)) ?
                  $signed($unsigned((7'h40))) : wire132) : {(~^$unsigned((7'h44)))}));
          reg143 <= {wire135};
          reg144 <= {(~|(&((!wire136) != (wire138 == reg140))))};
        end
      if (wire136[(1'h0):(1'h0)])
        begin
          reg145 <= reg144[(5'h13):(4'hf)];
          reg146 <= (^$signed((&wire139)));
          if (reg145)
            begin
              reg147 <= reg141[(3'h4):(1'h0)];
              reg148 <= reg146[(2'h3):(2'h2)];
              reg149 <= (wire136 ? (8'ha1) : (+$signed($unsigned(reg147))));
            end
          else
            begin
              reg147 <= reg141[(1'h1):(1'h1)];
              reg148 <= (reg142 ?
                  (|wire136[(2'h2):(1'h1)]) : (-(-wire133[(4'h8):(2'h2)])));
              reg149 <= (^~($signed(wire133[(3'h4):(3'h4)]) ?
                  reg149[(4'he):(1'h0)] : (^~$unsigned(wire135[(5'h12):(5'h10)]))));
              reg150 <= reg140[(1'h0):(1'h0)];
              reg151 <= (7'h41);
            end
          if ({$signed((~&{{reg150, reg142}, ((7'h41) + wire132)})),
              (^$signed(wire134))})
            begin
              reg152 <= (^$unsigned($signed((|reg145))));
            end
          else
            begin
              reg152 <= (((~^$unsigned(wire138[(1'h0):(1'h0)])) ?
                  {$unsigned($unsigned(wire133)),
                      reg142[(3'h4):(2'h2)]} : ((~(+reg149)) || $unsigned(wire136[(1'h1):(1'h0)]))) > $signed($unsigned(reg149)));
              reg153 <= {(($unsigned(wire134[(1'h0):(1'h0)]) - reg150) >> reg141),
                  wire137};
              reg154 <= (~reg147);
            end
        end
      else
        begin
          reg145 <= $unsigned(((^~(reg141 ? (|wire138) : {(8'ha6), reg152})) ?
              wire137[(2'h2):(1'h0)] : $unsigned($signed((reg150 >> reg152)))));
          if (((-(-$unsigned($unsigned(wire134)))) ?
              wire138 : $signed((~$signed(reg144[(3'h6):(2'h3)])))))
            begin
              reg146 <= (^(reg154[(1'h1):(1'h1)] <= wire137[(3'h4):(1'h0)]));
            end
          else
            begin
              reg146 <= reg140;
              reg147 <= (7'h43);
              reg148 <= {({((wire132 ? reg154 : reg149) ?
                              $signed(reg145) : (wire139 ? (8'ha7) : reg148)),
                          (|$signed(reg152))} ?
                      $signed($signed((reg147 ?
                          reg152 : (8'hb0)))) : reg145[(2'h2):(2'h2)])};
              reg149 <= (~&wire138);
            end
          reg150 <= reg143[(5'h10):(4'hb)];
          reg151 <= (|(|{(8'hb4), wire135[(4'ha):(1'h1)]}));
        end
      reg155 <= (+{$signed((!wire134))});
      if ($signed(reg155[(1'h0):(1'h0)]))
        begin
          if ($signed(reg147[(4'hd):(4'hb)]))
            begin
              reg156 <= reg141;
              reg157 <= ({$signed((~^(reg141 >> (8'ha6)))),
                      ((-(reg152 <<< reg152)) == reg143)} ?
                  $unsigned(((8'hb4) < (|$signed(reg154)))) : (7'h42));
              reg158 <= (reg144[(4'h9):(4'h9)] ^~ (reg153[(2'h3):(1'h1)] || $unsigned(wire139)));
            end
          else
            begin
              reg156 <= (8'ha5);
            end
          reg159 <= (+$unsigned(reg143));
          reg160 <= reg157[(3'h4):(3'h4)];
          reg161 <= reg141;
          reg162 <= $signed(((^~((^wire133) ^~ reg148)) ?
              $unsigned((~^reg144)) : (((&reg155) > $signed(reg160)) ?
                  (~(~^reg140)) : (8'hb3))));
        end
      else
        begin
          reg156 <= $signed(reg151[(4'h8):(3'h6)]);
          reg157 <= (wire133[(3'h6):(1'h1)] << {$signed((~|reg142))});
          reg158 <= ((8'ha8) ?
              (wire139[(2'h3):(2'h2)] <= $unsigned(reg156[(4'hd):(4'h9)])) : reg157[(3'h4):(2'h3)]);
          reg159 <= $signed(reg144);
          reg160 <= ((-reg141[(2'h2):(1'h1)]) <<< $signed((reg157[(4'hf):(4'hc)] ?
              wire135 : $signed((~wire138)))));
        end
      if (reg161[(4'ha):(3'h4)])
        begin
          reg163 <= {(((-reg161[(3'h7):(2'h2)]) != (~^$unsigned(reg149))) ~^ (-(!(reg151 ?
                  reg141 : reg157)))),
              reg147[(4'h9):(4'h8)]};
          reg164 <= $unsigned(reg152[(3'h7):(3'h4)]);
          reg165 <= (|(reg154 > reg145));
        end
      else
        begin
          reg163 <= $signed(wire135);
          reg164 <= (reg156[(4'hf):(4'h8)] ?
              (~&(reg164 <<< $unsigned({reg146}))) : $unsigned(reg144));
          reg165 <= (!$signed((~|((~|wire134) ?
              ((7'h40) ? reg154 : (8'ha5)) : (|reg152)))));
          reg166 <= reg162;
          reg167 <= $signed(($unsigned(reg156[(4'h9):(4'h9)]) ?
              $unsigned($signed(((8'ha5) * reg166))) : $unsigned(($signed(reg147) ?
                  $signed(reg145) : ((8'hb3) >= reg156)))));
        end
    end
  assign wire168 = reg147[(3'h5):(1'h1)];
  assign wire169 = ({reg160[(3'h7):(2'h2)],
                       reg141[(4'hd):(4'hb)]} >> (^~reg153[(3'h7):(2'h2)]));
  assign wire170 = $unsigned($unsigned(((8'ha6) | (~wire139[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      if ({(reg149 ?
              {{(~&(8'ha7)), {reg143, reg142}}} : $unsigned(((wire168 ?
                  reg156 : wire137) <= (reg150 ? wire137 : reg141))))})
        begin
          reg171 <= $signed(wire132[(2'h2):(2'h2)]);
          reg172 <= $unsigned($unsigned(reg156[(4'ha):(1'h1)]));
          reg173 <= ((($signed(wire170[(1'h0):(1'h0)]) ?
                  ((!reg150) * (wire139 || reg143)) : reg171) ?
              $signed(((-reg155) ?
                  $unsigned(reg147) : wire135)) : {reg160}) && $unsigned($unsigned(wire134[(2'h3):(2'h2)])));
          reg174 <= {reg167[(1'h0):(1'h0)], $signed(reg171[(2'h3):(1'h0)])};
          reg175 <= (($unsigned({(wire138 ? wire138 : reg146)}) ?
                  $unsigned((reg164[(1'h1):(1'h1)] ?
                      $signed(reg144) : (|reg141))) : $signed({{reg153}})) ?
              wire170[(3'h7):(2'h3)] : reg152[(5'h10):(1'h1)]);
        end
      else
        begin
          reg171 <= $signed({$unsigned({(-reg166), (!reg157)}),
              reg156[(2'h2):(1'h0)]});
          reg172 <= $unsigned(reg152[(4'h9):(3'h6)]);
          if ($unsigned(($unsigned(reg141[(4'ha):(1'h1)]) != $signed(reg154[(1'h0):(1'h0)]))))
            begin
              reg173 <= reg155[(1'h1):(1'h0)];
              reg174 <= $unsigned($unsigned(reg152[(2'h3):(1'h1)]));
            end
          else
            begin
              reg173 <= ($signed({wire170,
                      ($signed((8'hb9)) ? (~|reg152) : reg157)}) ?
                  (~^$signed(wire169[(4'h8):(4'h8)])) : reg161);
              reg174 <= reg171;
              reg175 <= reg152;
              reg176 <= ($unsigned($signed((|(reg157 >> reg144)))) ?
                  reg141 : reg142[(5'h11):(5'h10)]);
              reg177 <= (^($unsigned({wire137,
                  {wire168, reg152}}) >>> reg141[(3'h6):(3'h4)]));
            end
        end
      reg178 <= reg151;
    end
  assign wire179 = (~|$unsigned($signed(({reg144, reg171} ?
                       $signed(reg166) : $unsigned(reg171)))));
  always
    @(posedge clk) begin
      reg180 <= $signed($unsigned(wire179[(1'h0):(1'h0)]));
    end
  assign wire181 = reg163[(1'h0):(1'h0)];
  assign wire182 = {reg154, reg162[(1'h1):(1'h0)]};
  assign wire183 = $unsigned(reg175);
  assign wire184 = $signed(reg160);
  assign wire185 = $unsigned(wire133);
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire87;
  input wire [(4'hd):(1'h0)] wire86;
  input wire [(4'he):(1'h0)] wire85;
  input wire signed [(5'h10):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire106,
                 wire105,
                 wire104,
                 reg123,
                 reg122,
                 reg121,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg88 <= (!(^((!(wire84 == wire85)) << ((wire87 ? wire84 : wire87) ?
          (~|wire84) : (^~wire87)))));
      reg89 <= (wire86 ?
          $signed(reg88[(4'h8):(4'h8)]) : $unsigned(((^(wire84 - wire87)) ?
              reg88 : ({wire87} << (^wire87)))));
      if (wire86[(4'h9):(4'h8)])
        begin
          reg90 <= (wire86[(1'h0):(1'h0)] ?
              $signed(reg89) : $signed({wire86,
                  (((8'hb7) >> wire87) <= wire84)}));
          if (wire86)
            begin
              reg91 <= $signed($unsigned(((wire85[(4'hc):(4'h8)] ?
                  $signed(wire84) : (~&wire87)) & ($signed((8'ha6)) ?
                  (wire87 ^~ wire85) : $signed((8'hb7))))));
              reg92 <= (8'haa);
              reg93 <= (wire86[(4'h8):(2'h3)] ? wire86 : (8'hbd));
              reg94 <= reg90;
              reg95 <= ((((~|reg94) ?
                  $unsigned($signed(wire85)) : $signed(wire87)) & (reg88[(3'h6):(3'h4)] && $unsigned(reg88[(3'h6):(1'h1)]))) << ((~|((~^wire86) << (reg90 < (8'haa)))) << reg94[(4'h8):(2'h2)]));
            end
          else
            begin
              reg91 <= ($unsigned($signed((^~$unsigned(reg91)))) ^ $unsigned(wire85));
              reg92 <= $unsigned($signed((($unsigned((8'hae)) ?
                  (wire85 ? reg89 : wire84) : {reg92, reg93}) ^~ reg95)));
            end
        end
      else
        begin
          reg90 <= reg91[(4'he):(4'ha)];
          reg91 <= (^$unsigned(($unsigned($unsigned(wire84)) ?
              ($unsigned(reg93) <<< $signed(reg88)) : $signed((reg88 ?
                  wire87 : wire84)))));
          if ((&reg89))
            begin
              reg92 <= reg94[(3'h5):(1'h0)];
              reg93 <= $signed($unsigned($signed($unsigned(reg90))));
            end
          else
            begin
              reg92 <= ($signed((($signed(reg88) ?
                          (reg91 ~^ reg89) : (reg91 == (8'hab))) ?
                      wire87[(3'h5):(2'h2)] : (8'hb2))) ?
                  (~&(!((~^(8'hb0)) ?
                      $unsigned((7'h40)) : (wire85 ?
                          reg93 : wire87)))) : ($signed((reg94[(1'h0):(1'h0)] <= ((8'hb7) ?
                          reg88 : reg92))) ?
                      {reg88} : (~&$signed((reg90 ? reg93 : wire86)))));
              reg93 <= $signed($signed(reg91));
              reg94 <= wire87[(1'h1):(1'h0)];
              reg95 <= $signed((~^$signed(((wire84 ? wire87 : reg88) ?
                  (~reg95) : wire87[(4'h9):(4'h8)]))));
              reg96 <= ((($signed($signed(reg93)) ^ $unsigned($signed(wire85))) ?
                  ({(reg88 <<< (8'hae))} ?
                      $unsigned(((8'hac) ?
                          reg95 : (8'had))) : ((-(8'h9d)) - (wire84 ^~ (8'hb6)))) : (&((reg91 ?
                          reg89 : (7'h44)) ?
                      $signed(reg91) : $unsigned(wire85)))) & reg89);
            end
          if ((&reg88[(3'h4):(1'h1)]))
            begin
              reg97 <= $unsigned($unsigned(reg88[(3'h7):(1'h1)]));
              reg98 <= (wire87 & ({$unsigned({(8'had)})} ?
                  reg88[(3'h4):(2'h2)] : (reg91 ?
                      wire87[(4'ha):(3'h4)] : (wire84[(3'h4):(2'h3)] >> reg90[(1'h0):(1'h0)]))));
              reg99 <= $unsigned(wire86[(3'h6):(3'h5)]);
              reg100 <= reg98[(3'h7):(3'h6)];
              reg101 <= $unsigned((~&{$unsigned(((8'hb7) ? reg96 : (8'hbe))),
                  reg99[(3'h6):(1'h0)]}));
            end
          else
            begin
              reg97 <= reg91[(4'h8):(2'h3)];
              reg98 <= (($unsigned(((~reg96) ?
                      (wire87 | (8'hb9)) : (reg92 ?
                          reg90 : reg90))) >>> ((~$unsigned(reg89)) != ((8'hba) ~^ reg95))) ?
                  $unsigned($signed((~^{reg88,
                      wire84}))) : $signed($signed((^(reg97 ?
                      reg95 : (8'hbf))))));
              reg99 <= wire86[(4'hc):(4'hc)];
              reg100 <= {reg89[(1'h1):(1'h0)]};
            end
        end
      reg102 <= ((8'hb6) >= $signed({(reg95 ^~ reg89[(1'h1):(1'h0)]),
          reg95[(3'h7):(3'h6)]}));
      reg103 <= $unsigned((reg101[(3'h6):(1'h0)] ?
          reg93[(3'h4):(2'h3)] : wire84[(4'hc):(3'h5)]));
    end
  assign wire104 = {reg102};
  assign wire105 = $unsigned(({((reg96 ? reg89 : reg90) << (~&reg96))} ?
                       ((reg97[(1'h0):(1'h0)] | (^reg91)) ?
                           $unsigned(reg91) : $signed((reg91 ?
                               reg98 : reg99))) : (((reg92 << wire87) ?
                           reg89[(4'h8):(1'h1)] : $unsigned(reg103)) ^~ reg94)));
  assign wire106 = ($unsigned(reg102[(2'h3):(1'h0)]) ?
                       ((reg93 ?
                           $signed($unsigned(reg97)) : ((reg100 ~^ wire104) ?
                               (wire86 ? wire84 : reg91) : (reg96 ?
                                   reg99 : reg92))) ~^ reg100[(1'h0):(1'h0)]) : ({reg95[(3'h5):(3'h4)]} ^~ ((~^reg102[(4'hd):(3'h4)]) ?
                           $signed(reg93) : (8'ha6))));
  always
    @(posedge clk) begin
      reg107 <= $signed((^reg96));
      reg108 <= (wire86[(1'h0):(1'h0)] ? reg91 : reg98);
      reg109 <= $signed((reg97[(3'h7):(1'h1)] < {(~(wire106 ?
              (8'hb5) : wire104)),
          $unsigned(reg94)}));
      reg110 <= ((|$signed($unsigned((wire86 ~^ wire87)))) ?
          ($unsigned(((reg96 - reg98) ?
                  (reg89 ? (8'hbc) : wire84) : (reg92 ? reg102 : (8'ha5)))) ?
              ($unsigned((reg98 == wire106)) - $unsigned(reg95[(4'h9):(3'h6)])) : $unsigned(((reg95 ?
                  reg92 : reg100) <= (reg93 | reg88)))) : (8'ha6));
      reg111 <= $signed((reg110[(3'h5):(3'h5)] ?
          {reg107[(3'h5):(2'h3)]} : (reg89 ?
              ((reg96 ? wire105 : (7'h40)) ?
                  {reg91} : wire104[(5'h11):(4'ha)]) : (((8'h9c) >> reg110) > (&reg99)))));
    end
  assign wire112 = $signed(reg98[(3'h5):(2'h2)]);
  assign wire113 = ($unsigned(reg108) ?
                       $signed($unsigned($signed((8'haa)))) : (reg103 ?
                           $unsigned(wire84[(4'hd):(3'h5)]) : {$unsigned((reg108 ?
                                   wire112 : reg94))}));
  assign wire114 = reg94;
  assign wire115 = (reg98[(3'h4):(2'h2)] == $signed(reg92[(1'h1):(1'h0)]));
  assign wire116 = $signed(reg101);
  assign wire117 = $signed(reg100);
  assign wire118 = $unsigned(reg102[(5'h14):(4'ha)]);
  assign wire119 = (&$unsigned($unsigned(reg97)));
  assign wire120 = reg96;
  always
    @(posedge clk) begin
      if (reg88)
        begin
          reg121 <= (~&(8'hb1));
        end
      else
        begin
          reg121 <= wire104[(4'he):(3'h5)];
          if ({$unsigned(wire87[(3'h5):(2'h2)]),
              (-$signed(($unsigned(reg89) + ((8'hbe) * (8'hb5)))))})
            begin
              reg122 <= {$signed($signed($unsigned({reg109, reg103}))),
                  (8'hb9)};
            end
          else
            begin
              reg122 <= (-(wire118 > reg98[(4'ha):(1'h1)]));
              reg123 <= (reg89[(2'h3):(2'h3)] ?
                  wire113 : {(wire114 >= $signed(wire104)), wire115});
            end
        end
    end
  assign wire124 = wire104[(2'h2):(1'h0)];
  assign wire125 = $unsigned(reg107[(3'h7):(3'h6)]);
endmodule

module module28
#(parameter param72 = (~|(((((8'had) ? (8'ha4) : (8'hb7)) * ((8'hb6) ? (8'hab) : (8'ha0))) ? {(^~(8'hba)), (~&(8'ha5))} : (((8'h9d) ~^ (7'h41)) || ((8'haa) ? (7'h41) : (8'hae)))) ? (((^~(8'hbc)) >= (8'ha3)) <= (((8'hac) ? (7'h40) : (8'hbc)) ? ((8'ha5) ? (7'h44) : (7'h41)) : ((8'hab) - (8'ha8)))) : ((~|((8'haf) ? (8'hae) : (8'hb8))) < (((8'ha7) ? (8'had) : (8'hae)) ? ((7'h43) >= (8'hbf)) : (~(7'h42)))))), 
parameter param73 = (param72 ? (^{param72}) : ((+param72) ? (^((^param72) ? (param72 & param72) : (+param72))) : (((-param72) ? {param72} : (~&param72)) < (-(~|param72))))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(3'h7):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire34;
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire34,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
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
  assign wire34 = (|(~|wire31));
  always
    @(posedge clk) begin
      if ((|((!wire34) ?
          (-($unsigned(wire34) ?
              {wire31, wire30} : $signed(wire31))) : wire29[(3'h7):(3'h4)])))
        begin
          reg35 <= {(wire29 < wire32),
              $unsigned((((wire34 <<< wire34) ?
                  $unsigned(wire34) : $signed(wire34)) == ((wire34 ?
                      (7'h41) : wire34) ?
                  $signed(wire32) : $signed(wire31))))};
          reg36 <= $unsigned((wire31 << ({(wire29 ? wire31 : wire30),
              wire30} ~^ reg35)));
          reg37 <= $signed(((~^$unsigned(((8'hba) ~^ reg35))) ?
              wire33[(3'h4):(1'h1)] : (!((^~wire31) ?
                  (wire34 * (8'ha9)) : $unsigned(wire32)))));
          if (wire30[(4'hf):(4'he)])
            begin
              reg38 <= wire32;
              reg39 <= $unsigned(reg36[(1'h1):(1'h1)]);
              reg40 <= $signed(((reg39 ?
                  $signed(((7'h42) + reg37)) : $unsigned($signed(wire30))) != (|$signed(wire34[(3'h5):(1'h1)]))));
              reg41 <= wire34[(1'h0):(1'h0)];
              reg42 <= reg41;
            end
          else
            begin
              reg38 <= $unsigned((wire32[(1'h1):(1'h1)] ?
                  {$unsigned(reg42[(2'h3):(1'h1)])} : reg39[(4'hf):(3'h7)]));
              reg39 <= wire29;
            end
          reg43 <= $unsigned(reg37[(4'h8):(2'h2)]);
        end
      else
        begin
          if ((8'hbe))
            begin
              reg35 <= reg38;
              reg36 <= reg35[(3'h4):(2'h2)];
              reg37 <= ((&({$unsigned(reg43), wire32} ?
                  ((reg36 & reg41) >= reg41[(3'h7):(2'h3)]) : (wire32[(3'h5):(3'h5)] ~^ $unsigned(wire29)))) + (+reg38[(3'h4):(3'h4)]));
              reg38 <= (8'hbd);
            end
          else
            begin
              reg35 <= {($signed(({wire29} ? $unsigned(wire31) : reg35)) ?
                      $unsigned((reg39 - (wire33 ?
                          reg35 : (8'hbb)))) : $signed((|(reg42 | wire31))))};
              reg36 <= (+(+(wire29 ?
                  (reg36[(1'h0):(1'h0)] ^ (reg39 ?
                      reg38 : wire32)) : ($unsigned(reg41) || wire29))));
              reg37 <= $unsigned({(!(^~$signed((7'h43))))});
              reg38 <= (reg42 >= {wire34[(3'h5):(1'h1)]});
              reg39 <= $signed(wire31);
            end
          reg40 <= (((({reg43} ?
              reg42 : wire34[(2'h3):(2'h3)]) - ($signed((7'h43)) ?
              reg40 : $unsigned(reg40))) < reg35) & wire29);
          reg41 <= $unsigned({$signed($signed((wire29 ? reg36 : reg40)))});
          reg42 <= (~^((!(^~(~reg42))) ? reg42[(1'h1):(1'h1)] : (^~{(8'hbe)})));
          reg43 <= (wire31 ?
              ($signed((^(wire33 ?
                  (8'hb8) : wire33))) >>> {reg41[(4'h8):(1'h0)]}) : $signed($signed(($signed(reg42) > (wire34 ?
                  wire34 : reg43)))));
        end
    end
  assign wire44 = reg36[(3'h6):(2'h3)];
  assign wire45 = $unsigned(wire30[(3'h5):(1'h1)]);
  assign wire46 = (({(reg35 ? {wire30} : (~reg36)),
                          ((wire45 || reg35) ?
                              ((8'hb0) <<< (8'hb1)) : ((8'h9d) - reg36))} ?
                      (reg37 >= ((!reg42) ?
                          $signed(reg37) : (reg41 - wire33))) : {$unsigned(reg35[(2'h2):(1'h1)])}) ^~ ((reg36[(4'hb):(4'ha)] ?
                          $signed($signed((8'hac))) : wire34) ?
                      $signed($unsigned(wire32[(3'h4):(3'h4)])) : $signed(((~|wire45) ?
                          ((8'hab) ^ wire31) : wire44[(3'h4):(1'h0)]))));
  assign wire47 = (^~$unsigned(($signed({reg37, reg35}) <= wire46)));
  assign wire48 = (reg42 ? reg43 : $signed(wire46[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg49 <= wire48[(4'hd):(1'h1)];
    end
  assign wire50 = $signed($signed(wire44));
  always
    @(posedge clk) begin
      reg51 <= reg37[(1'h1):(1'h0)];
      reg52 <= $signed((($unsigned({(8'ha7)}) && ({reg41} == $signed(wire44))) >> $unsigned(wire45)));
      if (wire29[(4'ha):(2'h2)])
        begin
          reg53 <= wire30[(3'h6):(3'h6)];
          reg54 <= (-reg38[(4'h8):(1'h1)]);
          reg55 <= (($unsigned($unsigned(reg53[(1'h0):(1'h0)])) ?
              {$unsigned(wire31[(3'h4):(2'h2)]),
                  $unsigned((8'h9c))} : $unsigned(((reg38 ?
                  wire30 : wire30) > (+wire48)))) ^ $unsigned((({wire30} ?
              reg52 : (reg53 & reg37)) >= $signed($unsigned(wire46)))));
          reg56 <= (|wire29);
          reg57 <= $signed($signed($signed($signed(reg38))));
        end
      else
        begin
          reg53 <= {((|$unsigned($unsigned(wire29))) >= $unsigned((reg54[(4'hd):(3'h6)] ?
                  (reg39 <<< wire44) : reg40)))};
          reg54 <= $signed(reg38[(3'h7):(1'h1)]);
          reg55 <= ($unsigned(({(!wire47)} ^ (!$unsigned(reg36)))) & $unsigned($signed(($unsigned(reg40) < $signed(wire31)))));
        end
      reg58 <= $signed($unsigned(wire47[(1'h1):(1'h1)]));
    end
  assign wire59 = $unsigned(reg54);
  assign wire60 = $signed({(((+reg54) != wire29[(3'h4):(3'h4)]) ?
                          (reg53[(4'ha):(2'h3)] ?
                              $unsigned(reg49) : (wire33 < wire46)) : (~^reg52[(2'h3):(2'h2)])),
                      {$signed($unsigned(reg42))}});
  assign wire61 = (~&(&reg41[(3'h6):(3'h5)]));
  assign wire62 = $unsigned($unsigned(reg57[(5'h11):(3'h7)]));
  assign wire63 = ($signed((wire31 >>> reg49)) ?
                      $signed(wire50) : {(|(|(reg39 > wire44))), reg42});
  assign wire64 = reg51[(3'h6):(1'h0)];
  assign wire65 = (wire44[(3'h5):(1'h1)] ?
                      (($signed((reg54 ?
                              wire47 : wire29)) >>> $unsigned(wire32[(3'h7):(2'h3)])) ?
                          (~|reg42) : (8'hb5)) : $signed(reg37[(2'h2):(2'h2)]));
  assign wire66 = (wire29 || (+$unsigned(((-reg55) ^ (^wire29)))));
  assign wire67 = wire62;
  assign wire68 = wire60;
  assign wire69 = reg49[(4'h9):(3'h7)];
  assign wire70 = (-(^$signed((~|(+(8'hb7))))));
  assign wire71 = $unsigned(($unsigned(($unsigned(reg39) | (reg38 >> reg37))) < (|(8'hbe))));
endmodule
