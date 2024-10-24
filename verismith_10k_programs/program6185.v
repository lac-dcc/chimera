module top
#(parameter param170 = (-(|(&(8'hb5)))), 
parameter param171 = param170)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire168;
  wire signed [(3'h7):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire165;
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire4,
                 wire19,
                 wire20,
                 wire22,
                 wire165,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg21,
                 (1'h0)};
  assign wire4 = (!(~^(~&$unsigned((wire3 ~^ wire1)))));
  always
    @(posedge clk) begin
      if ((&((!$unsigned((~|wire3))) >= wire2[(4'hb):(3'h6)])))
        begin
          if ($unsigned(($signed((-wire4[(3'h4):(2'h2)])) >= $signed(wire2[(2'h3):(2'h3)]))))
            begin
              reg5 <= $unsigned((~&(+($unsigned(wire3) < ((8'h9f) ?
                  wire4 : wire1)))));
              reg6 <= $unsigned($signed(($unsigned(((8'h9e) && wire1)) ?
                  reg5[(1'h1):(1'h1)] : wire4)));
              reg7 <= $signed((8'hb3));
            end
          else
            begin
              reg5 <= $signed(reg5[(1'h1):(1'h1)]);
              reg6 <= reg6;
              reg7 <= (+((8'hb6) >= $signed(wire4)));
            end
          if (wire4)
            begin
              reg8 <= wire4;
              reg9 <= wire3[(4'h9):(4'h9)];
              reg10 <= $signed(($unsigned((wire3 ?
                  {(8'hbf),
                      reg8} : {reg5})) && $unsigned((((8'h9e) << wire1) | {reg8,
                  (8'hba)}))));
              reg11 <= $signed(($unsigned($signed(((8'hb8) > reg9))) ?
                  wire0 : $signed((8'ha0))));
              reg12 <= $unsigned(($signed(reg11) ?
                  ((((8'hbd) ? reg6 : reg8) == (reg9 ?
                      wire1 : reg5)) <= reg7) : wire1[(3'h7):(2'h2)]));
            end
          else
            begin
              reg8 <= ((reg6 ?
                      ((+(reg6 <= reg7)) * wire4) : (+((8'haf) >>> $signed((8'ha7))))) ?
                  (reg6 != ((~^{wire3, (7'h42)}) ?
                      ({reg6, reg6} >> (wire3 ?
                          (8'hb5) : reg7)) : $signed($signed(reg9)))) : $signed(((reg5[(2'h3):(1'h0)] > $unsigned(wire1)) * $signed(wire2[(2'h3):(1'h0)]))));
            end
          reg13 <= (^((wire2 ^~ reg11[(2'h2):(1'h0)]) ?
              ($signed((!reg8)) * ((~|reg5) ?
                  (reg11 ^ wire4) : (~reg7))) : $unsigned($signed(wire1[(3'h5):(1'h1)]))));
          reg14 <= $unsigned($unsigned(((-(wire2 <= reg11)) && wire2)));
          if ($signed($signed(($unsigned({reg14}) ^~ reg11))))
            begin
              reg15 <= reg5[(3'h4):(2'h3)];
              reg16 <= $unsigned((((|$signed((8'ha6))) ^ $unsigned((reg14 ?
                      reg6 : wire2))) ?
                  wire2[(2'h3):(1'h0)] : $signed({(wire3 ? wire1 : (8'ha9))})));
              reg17 <= (wire4[(4'hb):(2'h3)] + ((^~$unsigned($unsigned(reg10))) ?
                  {$unsigned((wire1 <= (8'ha4))),
                      $signed(((8'hac) & wire4))} : wire0[(1'h0):(1'h0)]));
              reg18 <= (($signed(((reg11 || reg12) ?
                  reg15 : $signed(reg6))) * $unsigned(($signed(wire3) << reg16))) != $unsigned($unsigned(((reg11 ?
                  reg12 : reg13) >= $signed((8'haf))))));
            end
          else
            begin
              reg15 <= {(-(~&((8'ha0) ^ {(8'ha2), reg9})))};
              reg16 <= $signed($signed({$signed(reg14[(1'h0):(1'h0)])}));
            end
        end
      else
        begin
          reg5 <= ((~|wire3) ?
              {$unsigned((!reg17)), reg7} : $signed(reg6[(3'h4):(3'h4)]));
          reg6 <= reg6;
          reg7 <= (|((-((|reg15) ^ wire3)) <<< (reg7 ?
              $unsigned((^~reg17)) : reg13[(3'h4):(3'h4)])));
          reg8 <= ($unsigned($signed(reg8[(1'h1):(1'h1)])) * (reg18 ?
              (-$unsigned(wire4[(1'h1):(1'h1)])) : $unsigned(({reg10, reg16} ?
                  reg5[(2'h3):(1'h1)] : $unsigned(reg13)))));
        end
    end
  assign wire19 = (^~$signed($signed($signed((reg5 + reg6)))));
  assign wire20 = {$signed(($signed((&reg12)) ?
                          reg7[(2'h2):(1'h1)] : reg15[(2'h3):(2'h3)]))};
  always
    @(posedge clk) begin
      reg21 <= ((reg18[(3'h6):(3'h5)] >> ($unsigned({wire4}) ?
          (wire4[(3'h6):(3'h4)] ?
              $unsigned((8'ha4)) : (!wire1)) : (8'h9f))) > $unsigned(($signed(reg16[(2'h2):(2'h2)]) ?
          ((8'ha6) ? {reg13, reg12} : (reg18 ? (8'ha8) : (8'hb6))) : reg16)));
    end
  assign wire22 = (8'hb2);
  module23 #() modinst166 (wire165, clk, reg10, wire3, reg17, reg9);
  assign wire167 = (~&$unsigned(reg8));
  assign wire168 = {($signed($signed(wire20)) ?
                           (~^$unsigned((wire20 | (8'hb9)))) : wire2[(4'he):(3'h7)])};
  assign wire169 = (~^(^((reg9[(3'h7):(3'h5)] ^ reg7) ?
                       wire3[(1'h1):(1'h1)] : $unsigned((+(8'hba))))));
endmodule

module module23
#(parameter param163 = (!{(!(((7'h44) ? (8'ha6) : (8'hbe)) ? ((8'hb4) && (8'ha9)) : (~^(8'hb8))))}), 
parameter param164 = (~^(((param163 ? (param163 ? param163 : param163) : param163) || (param163 << (+param163))) ? ((param163 << {param163, param163}) - param163) : {(8'ha0), ((~|param163) ? (8'ha0) : param163)})))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h29c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(4'h9):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire123;
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire145,
                 wire125,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire80,
                 wire123,
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
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
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
                 (1'h0)};
  assign wire28 = wire27[(1'h0):(1'h0)];
  assign wire29 = (wire25 + wire24[(1'h1):(1'h0)]);
  assign wire30 = $signed(wire26[(3'h6):(1'h1)]);
  assign wire31 = {((^$signed($signed(wire24))) * $signed((wire24[(4'h8):(1'h0)] ^~ {wire28}))),
                      ($unsigned(((wire25 >>> wire29) ^ $unsigned(wire26))) ?
                          wire24 : (~&(wire27 && (wire26 ? wire27 : wire27))))};
  assign wire32 = {wire25, (8'hb7)};
  assign wire33 = $signed({wire27,
                      $signed($signed((wire30 ? wire31 : wire31)))});
  assign wire34 = (8'hbc);
  module35 #() modinst81 (.y(wire80), .wire37(wire29), .wire38(wire27), .wire39(wire25), .clk(clk), .wire36(wire33));
  always
    @(posedge clk) begin
      if (wire30)
        begin
          if (wire25)
            begin
              reg82 <= $signed($signed(({(wire29 >> wire27),
                      ((8'h9e) | wire29)} ?
                  ($unsigned(wire27) ?
                      $signed(wire24) : ((8'hbe) << wire28)) : wire31[(2'h2):(1'h0)])));
            end
          else
            begin
              reg82 <= reg82;
              reg83 <= wire30[(4'h8):(1'h1)];
            end
          if (wire27)
            begin
              reg84 <= (wire80 >= (wire34[(4'ha):(1'h1)] & (~|(~&(~wire29)))));
            end
          else
            begin
              reg84 <= wire80;
            end
          reg85 <= $signed(wire25[(2'h2):(1'h1)]);
          reg86 <= ($unsigned(wire25) & (~^($signed(wire26[(1'h1):(1'h0)]) & (~&$signed(reg83)))));
        end
      else
        begin
          reg82 <= ({$unsigned($unsigned($unsigned(reg84))),
              $unsigned(($signed(wire29) & $unsigned(wire33)))} > reg82[(2'h2):(1'h1)]);
          reg83 <= (((((8'hb4) ^ {(8'hba), wire29}) ?
                  wire29 : wire28[(3'h6):(2'h2)]) >> (wire27 && $unsigned((wire31 & wire33)))) ?
              (~&wire33[(1'h1):(1'h1)]) : reg86);
        end
      if ($signed(wire29))
        begin
          reg87 <= ($unsigned($signed($unsigned((8'ha5)))) ?
              $signed(wire32[(3'h7):(3'h6)]) : wire32[(3'h4):(2'h2)]);
        end
      else
        begin
          if ((~&(!$unsigned($unsigned(wire29[(3'h4):(1'h0)])))))
            begin
              reg87 <= wire80;
              reg88 <= wire28;
              reg89 <= reg87[(4'h9):(3'h7)];
              reg90 <= wire31[(1'h1):(1'h1)];
            end
          else
            begin
              reg87 <= reg83;
              reg88 <= ({$signed(reg83), (8'ha8)} << ((~&wire34) ?
                  (!(7'h40)) : reg89));
              reg89 <= ($unsigned($unsigned(reg86)) ?
                  reg87[(1'h0):(1'h0)] : $signed($unsigned(($signed(wire34) == $unsigned(wire33)))));
              reg90 <= $signed((((8'haf) >> wire28[(4'h8):(3'h5)]) ?
                  wire24 : $signed($unsigned(wire30))));
              reg91 <= wire31;
            end
        end
      if (wire26[(3'h5):(3'h5)])
        begin
          reg92 <= wire31;
          reg93 <= wire29[(5'h10):(4'hd)];
        end
      else
        begin
          reg92 <= $signed((|(~|wire32)));
          reg93 <= ($signed(reg92) ?
              $signed(wire31[(2'h2):(1'h0)]) : ((reg87 ?
                      reg84 : $unsigned($unsigned(wire25))) ?
                  $signed((|$unsigned(reg88))) : (|reg88)));
        end
      reg94 <= (~&reg83[(1'h1):(1'h0)]);
      reg95 <= (^~({(!$signed(reg84))} ? ((8'haa) * reg90) : (8'hb6)));
    end
  module96 #() modinst124 (wire123, clk, wire34, reg88, wire27, wire33, reg85);
  assign wire125 = wire32;
  always
    @(posedge clk) begin
      reg126 <= wire31[(1'h1):(1'h1)];
      reg127 <= reg95[(4'h9):(4'h9)];
      if (reg95)
        begin
          if ((~|reg93[(1'h1):(1'h1)]))
            begin
              reg128 <= reg86[(3'h5):(1'h0)];
              reg129 <= wire26;
              reg130 <= reg94;
              reg131 <= (&($signed((wire31 ?
                  wire31[(1'h0):(1'h0)] : $unsigned(wire30))) ^ $unsigned($unsigned(wire24))));
              reg132 <= $unsigned({(reg89 ?
                      ((wire27 || wire123) ?
                          wire33[(3'h5):(1'h0)] : reg95) : reg84)});
            end
          else
            begin
              reg128 <= reg126[(1'h0):(1'h0)];
              reg129 <= ($signed(reg126) && (8'ha2));
            end
        end
      else
        begin
          reg128 <= (reg90 >> reg128);
          reg129 <= $signed({$signed({(-wire125)}),
              $unsigned((reg84 ? wire123[(4'h8):(4'h8)] : (7'h41)))});
          reg130 <= wire26;
        end
      if (reg86)
        begin
          if ($unsigned($unsigned(reg85)))
            begin
              reg133 <= wire25[(4'h8):(3'h5)];
              reg134 <= reg133;
              reg135 <= $signed(wire25);
              reg136 <= $signed($signed(reg84));
            end
          else
            begin
              reg133 <= $signed((wire24[(3'h4):(3'h4)] & ($unsigned($signed((8'hb5))) <<< $unsigned((7'h41)))));
              reg134 <= reg127[(4'h8):(3'h4)];
            end
          if ((~&($signed(reg135[(2'h2):(1'h1)]) ^ (~^($unsigned((8'hae)) ?
              (reg90 + (8'hbc)) : {reg136, wire33})))))
            begin
              reg137 <= {$signed((reg128[(1'h1):(1'h0)] ?
                      ($unsigned((8'hb5)) ?
                          (~^reg134) : {reg93,
                              (8'hae)}) : ({reg126} || $unsigned(wire31))))};
              reg138 <= wire24[(2'h2):(1'h1)];
              reg139 <= ({$unsigned(reg138[(4'h8):(3'h6)])} >> $unsigned(reg84[(1'h1):(1'h0)]));
              reg140 <= reg84[(2'h3):(2'h2)];
            end
          else
            begin
              reg137 <= ($unsigned($unsigned(((+reg138) >> {(8'hac)}))) > $unsigned(reg127[(1'h1):(1'h0)]));
            end
          if ($unsigned(reg94))
            begin
              reg141 <= $unsigned($signed($signed($signed((reg87 ?
                  reg86 : wire33)))));
            end
          else
            begin
              reg141 <= (reg127 == {wire25,
                  (|($signed((7'h44)) ? $signed(reg133) : (|wire33)))});
              reg142 <= (~|(7'h40));
            end
          reg143 <= $unsigned(reg140[(4'h8):(1'h0)]);
          reg144 <= $unsigned(wire34[(4'h9):(3'h7)]);
        end
      else
        begin
          reg133 <= reg134;
          if (reg137[(4'h9):(1'h0)])
            begin
              reg134 <= ($signed((reg140 >> ((reg138 | (8'hb9)) ?
                      (&reg139) : $unsigned(wire27)))) ?
                  ((^~((|(8'h9f)) ? (reg139 || reg132) : (~&wire125))) ?
                      {{(+reg93), $signed((8'hba))},
                          ($signed((8'hb5)) == wire125[(4'ha):(1'h0)])} : wire80) : {$unsigned(reg134)});
              reg135 <= ($unsigned(reg141) << (~|(((-wire125) >>> (~^reg132)) & reg90)));
            end
          else
            begin
              reg134 <= $unsigned((((7'h44) ?
                      (-$signed(reg90)) : (^~(^(8'hbc)))) ?
                  reg133 : reg136));
              reg135 <= reg137;
              reg136 <= (8'ha6);
            end
          reg137 <= ((($signed((|(8'hbd))) ?
              {$signed((8'hbb))} : $unsigned(((8'ha4) <= reg129))) | reg82[(1'h1):(1'h0)]) == ((((reg141 == (8'hb9)) << (|reg94)) ?
              $signed((reg128 < reg88)) : reg130) ^ reg92[(3'h4):(3'h4)]));
          reg138 <= $unsigned((reg137[(4'h9):(1'h1)] ?
              $signed(((~wire28) ?
                  reg89 : wire30[(2'h3):(2'h2)])) : $signed((~^$signed(wire30)))));
        end
    end
  assign wire145 = (reg85 ? (|reg131[(1'h0):(1'h0)]) : $signed(reg94));
  always
    @(posedge clk) begin
      if ({((reg91 ? (~|$unsigned(reg137)) : $unsigned((~wire30))) ?
              {reg126[(2'h2):(1'h0)]} : {(~|wire123), $unsigned(reg92)})})
        begin
          if ({(|(~|(wire34[(5'h15):(5'h11)] ^ $unsigned(wire32)))),
              $unsigned(reg143)})
            begin
              reg146 <= (|((~$unsigned((reg134 >= reg135))) >> $unsigned(reg136)));
              reg147 <= ($signed((-reg130)) & reg140[(1'h0):(1'h0)]);
            end
          else
            begin
              reg146 <= (wire27[(2'h2):(1'h0)] ?
                  {reg86[(2'h3):(2'h2)], (8'hb0)} : reg128[(3'h6):(1'h0)]);
            end
          reg148 <= ($unsigned(wire29) ?
              (reg82[(1'h1):(1'h1)] ?
                  reg86[(3'h4):(3'h4)] : $signed(reg136[(2'h2):(1'h0)])) : $unsigned(($unsigned((reg90 ?
                      reg137 : reg140)) ?
                  reg84[(1'h0):(1'h0)] : $signed(reg87[(4'h8):(4'h8)]))));
        end
      else
        begin
          reg146 <= ((8'hb5) ?
              $signed(reg126[(2'h2):(2'h2)]) : (^reg147[(2'h3):(2'h3)]));
          reg147 <= $unsigned(reg134);
          reg148 <= wire25;
          reg149 <= {wire34,
              (reg133[(3'h5):(3'h5)] ^ $unsigned($signed(reg134)))};
        end
      reg150 <= ({reg144[(1'h0):(1'h0)], $unsigned((wire123 ~^ (^(7'h44))))} ?
          ((wire27[(3'h7):(3'h6)] ?
              $unsigned(reg141[(1'h0):(1'h0)]) : $signed(reg144[(4'hc):(3'h4)])) >= (($signed((8'ha8)) >>> $unsigned(reg134)) & $signed((~&reg138)))) : ($unsigned(reg139) ?
              (wire31[(1'h0):(1'h0)] ?
                  {(reg138 && reg86)} : reg131[(3'h5):(3'h4)]) : $signed(($unsigned(reg144) >> reg146[(5'h11):(4'hf)]))));
      if (reg133[(3'h6):(1'h0)])
        begin
          if ({reg91})
            begin
              reg151 <= $signed(wire30);
              reg152 <= wire25[(1'h0):(1'h0)];
            end
          else
            begin
              reg151 <= reg91;
              reg152 <= ($signed(reg90) + (+reg148));
              reg153 <= ((+{reg91[(1'h1):(1'h0)],
                  (!(reg89 + reg126))}) || (reg139[(3'h4):(1'h0)] ?
                  ($unsigned(reg135[(2'h3):(1'h0)]) ^ $unsigned(reg136[(2'h3):(1'h0)])) : {(((8'hb1) ?
                          reg135 : wire80) >> $signed(wire28)),
                      reg86[(2'h3):(1'h1)]}));
              reg154 <= (8'hac);
              reg155 <= $signed({(^~((reg149 ^ reg144) << (reg146 >>> reg84)))});
            end
          reg156 <= $signed({($unsigned((reg147 * reg152)) ?
                  $signed(wire24[(1'h0):(1'h0)]) : (-$signed(reg92))),
              $unsigned(($unsigned(reg88) ?
                  wire125 : (reg131 ? reg150 : (8'hba))))});
          reg157 <= wire145[(3'h7):(3'h4)];
        end
      else
        begin
          reg151 <= {$signed({$unsigned(wire34), reg87[(3'h5):(3'h5)]})};
          reg152 <= reg140[(2'h2):(1'h0)];
          if ((reg92[(3'h4):(3'h4)] == ((((reg82 ?
                  reg150 : (8'hab)) ^ (reg92 == reg138)) ?
              wire28 : $signed((wire26 ?
                  wire24 : reg143))) >> (+({reg140} ^ ((8'hb0) - wire24))))))
            begin
              reg153 <= reg88[(3'h7):(3'h5)];
              reg154 <= (^~(~&$signed($unsigned((^reg143)))));
              reg155 <= ((!$signed((~(reg95 ? reg138 : (8'hac))))) ?
                  reg138 : reg138);
              reg156 <= reg84;
            end
          else
            begin
              reg153 <= {(reg153[(3'h5):(3'h4)] ?
                      $unsigned($signed((^~reg131))) : $signed(((~&wire123) != (reg83 ?
                          reg131 : reg156))))};
              reg154 <= reg155;
              reg155 <= $unsigned($unsigned((!((reg140 ? reg86 : wire34) ?
                  reg82[(2'h2):(1'h0)] : {reg137}))));
              reg156 <= $signed((($signed(reg84) > {wire28[(2'h3):(1'h1)]}) || (reg129 < {reg144[(2'h3):(2'h3)]})));
              reg157 <= ((($unsigned(reg140) ?
                      reg95[(1'h1):(1'h1)] : $unsigned(reg92)) ?
                  ((reg82[(1'h1):(1'h1)] ~^ $unsigned(reg88)) ?
                      reg90 : (8'hb4)) : $signed(wire27)) >= (-((-(~&wire33)) >= (~^reg153[(4'h8):(3'h4)]))));
            end
          reg158 <= ((8'hbe) * {(wire32 ?
                  $unsigned($signed(reg138)) : reg155)});
          reg159 <= reg93[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg160 <= $signed((!(~$signed($signed(reg151)))));
    end
  assign wire161 = (reg134 ?
                       $unsigned(reg89[(4'h8):(2'h3)]) : {((((8'hb9) >> (8'ha7)) ?
                                   {reg91, wire26} : (reg147 ?
                                       reg140 : wire123)) ?
                               ($signed(reg138) << $unsigned(reg150)) : {(^wire27),
                                   (reg158 ? reg84 : reg90)})});
  assign wire162 = $signed($unsigned(wire161));
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire101;
  input wire signed [(3'h7):(1'h0)] wire100;
  input wire signed [(4'h8):(1'h0)] wire99;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire [(5'h15):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire102;
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire116,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg122,
                 reg121,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire102 = wire99;
  assign wire103 = (((wire99 ? (~((7'h43) & wire99)) : $unsigned(wire99)) ?
                           $unsigned(wire100[(3'h6):(1'h0)]) : $signed($unsigned($signed(wire102)))) ?
                       ($signed((wire101[(3'h6):(1'h0)] ~^ (&wire97))) >>> (~(-{wire102,
                           wire102}))) : wire98[(4'h8):(3'h5)]);
  assign wire104 = $unsigned($unsigned(((+(wire101 ? wire103 : wire97)) ?
                       {$unsigned((8'had))} : (+(wire102 ?
                           wire102 : wire98)))));
  assign wire105 = (^~$signed($signed($signed((wire98 ? wire97 : wire102)))));
  assign wire106 = wire102[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg107 <= wire103[(4'ha):(1'h0)];
      if (wire106[(3'h4):(1'h1)])
        begin
          if (($signed(((wire97[(4'h9):(1'h0)] < (+wire99)) || (8'hbd))) < {(wire99[(3'h4):(1'h1)] || (8'hb6))}))
            begin
              reg108 <= $signed(wire98);
            end
          else
            begin
              reg108 <= (-$signed($signed(wire103)));
              reg109 <= (&$signed(wire98));
            end
          if ((($unsigned(wire106[(4'h8):(2'h2)]) ?
              $unsigned($unsigned((reg108 ? wire97 : wire97))) : {reg109,
                  $signed(((8'ha5) * wire104))}) ^ (!wire97[(4'hc):(4'hb)])))
            begin
              reg110 <= ((((+(wire106 ?
                  wire97 : reg107)) < $unsigned((^~(8'hac)))) >= reg109[(3'h6):(1'h0)]) - ((8'hbb) ?
                  (^((-wire104) ? wire102 : wire106)) : {(+{reg109, wire102}),
                      $unsigned($unsigned((8'haa)))}));
              reg111 <= wire101;
              reg112 <= $unsigned(($unsigned(wire97[(4'hc):(1'h1)]) & $signed($unsigned($signed((7'h44))))));
              reg113 <= wire105;
              reg114 <= wire100[(1'h0):(1'h0)];
            end
          else
            begin
              reg110 <= (wire98 ?
                  ((!(&(-wire104))) << ((^~(reg111 ? reg110 : wire104)) ?
                      $unsigned(wire97) : wire100)) : (~&(-$unsigned($signed(wire106)))));
            end
          reg115 <= $signed({((~^(~|wire102)) >= (reg112 ?
                  $unsigned(wire106) : wire105[(1'h1):(1'h1)]))});
        end
      else
        begin
          reg108 <= reg109[(4'he):(4'he)];
          reg109 <= {$unsigned(wire101), reg112[(4'hf):(1'h0)]};
          reg110 <= (wire102 <<< $signed({((+(8'hb8)) ?
                  wire103 : $unsigned(wire97))}));
          reg111 <= $signed($signed((wire101 ?
              ($signed((8'hb5)) + wire98) : (((8'hbb) ?
                  wire106 : wire97) <= (~&reg113)))));
        end
    end
  assign wire116 = $signed(reg114[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg117 <= (((((wire103 <<< wire99) ~^ $unsigned(wire106)) && $signed($signed(wire101))) ?
              $unsigned(wire101) : $signed((!((7'h41) ^ reg112)))) ?
          reg115 : (~^{reg109[(1'h0):(1'h0)]}));
      reg118 <= $signed((wire116 ?
          reg113[(5'h15):(3'h7)] : ($signed(((8'hab) ? (8'ha5) : reg117)) ?
              (reg117 ?
                  $signed(reg110) : (reg112 ?
                      reg114 : reg111)) : (^~wire116[(3'h5):(1'h1)]))));
    end
  assign wire119 = $signed(wire98);
  assign wire120 = ((wire103[(4'he):(2'h2)] ^~ reg117) ?
                       (wire101 <<< (reg108[(2'h2):(1'h1)] ?
                           ({reg112, wire119} - (reg113 ?
                               wire104 : reg111)) : (wire106 | (reg110 ?
                               wire97 : reg117)))) : (wire105[(2'h2):(1'h1)] ?
                           reg113 : {$signed($unsigned((8'had))), {{wire97}}}));
  always
    @(posedge clk) begin
      reg121 <= wire105;
      reg122 <= $signed($signed(wire97));
    end
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire53,
                 wire52,
                 reg65,
                 reg64,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= wire37[(5'h10):(3'h5)];
      reg41 <= wire38[(3'h7):(1'h1)];
      reg42 <= ((+(((wire36 ? wire36 : (7'h40)) ?
          wire36[(3'h4):(1'h1)] : ((7'h41) ?
              (8'ha2) : wire39)) + wire37[(4'ha):(4'h8)])) * wire38[(4'hc):(3'h5)]);
      reg43 <= $unsigned((wire36 << {(reg42 ?
              (wire39 ? (8'hbc) : (8'hb3)) : reg42[(1'h1):(1'h1)]),
          wire36[(1'h1):(1'h1)]}));
      reg44 <= wire37[(5'h11):(4'hb)];
    end
  always
    @(posedge clk) begin
      reg45 <= wire39;
      reg46 <= (~&((~&((reg43 + reg40) | {reg44})) ?
          reg45 : (&{(reg43 + wire37), wire37[(3'h6):(3'h6)]})));
      if ({(^$unsigned($unsigned($unsigned(reg44))))})
        begin
          reg47 <= ($unsigned(reg45) && $unsigned(($unsigned($unsigned(reg42)) ?
              ((wire39 ? reg45 : reg41) ?
                  {reg44, reg40} : (wire39 ?
                      reg40 : reg42)) : ($unsigned(reg42) ~^ reg42))));
          reg48 <= (-(~reg44));
          reg49 <= reg47;
          reg50 <= wire37;
        end
      else
        begin
          reg47 <= wire37;
          if ((({$signed(wire38), (8'ha4)} ? {reg44} : reg44[(1'h0):(1'h0)]) ?
              (wire38[(4'hf):(3'h6)] ?
                  {$unsigned(reg49),
                      reg46[(4'hd):(3'h7)]} : reg49[(1'h0):(1'h0)]) : (^~reg49[(3'h4):(1'h1)])))
            begin
              reg48 <= (reg47[(4'he):(4'hb)] > reg47);
              reg49 <= reg41[(3'h6):(3'h4)];
            end
          else
            begin
              reg48 <= $signed({reg43[(3'h4):(1'h1)], $unsigned((+(&reg48)))});
              reg49 <= ($unsigned((reg47[(4'he):(2'h3)] ?
                      reg43 : $signed((8'ha9)))) ?
                  ((reg43[(4'h8):(1'h1)] ?
                      $unsigned((reg41 ?
                          wire38 : reg49)) : $signed($unsigned(reg41))) >>> $signed(reg50)) : reg49);
            end
          reg50 <= (~|reg40[(3'h6):(3'h6)]);
        end
      reg51 <= reg49;
    end
  assign wire52 = reg43;
  assign wire53 = wire52[(4'he):(1'h0)];
  always
    @(posedge clk) begin
      if (((^~{reg46, reg51}) * $signed((~({wire37, (8'had)} ?
          (~reg49) : reg45[(5'h10):(3'h6)])))))
        begin
          reg54 <= $unsigned(reg48);
        end
      else
        begin
          reg54 <= ((~&wire36[(3'h6):(3'h6)]) & (((&reg42) ?
                  $unsigned(reg46[(3'h4):(2'h2)]) : ($unsigned(reg44) ?
                      (wire36 ? reg45 : reg41) : wire38)) ?
              {(!(!wire36))} : reg54[(2'h2):(2'h2)]));
          reg55 <= (8'hbc);
          reg56 <= reg44[(1'h0):(1'h0)];
        end
      reg57 <= $unsigned((^~reg43));
      if (wire38)
        begin
          reg58 <= reg42;
          reg59 <= reg44;
          reg60 <= $unsigned((^~($signed(reg46) <= wire52[(4'ha):(4'h9)])));
        end
      else
        begin
          if ($signed(((&((wire52 ? reg59 : (8'ha4)) ?
              (|wire39) : (-reg58))) >>> $signed($unsigned($unsigned(reg41))))))
            begin
              reg58 <= reg43;
              reg59 <= $signed({{$signed((reg60 ? wire37 : wire39)),
                      reg45[(4'hf):(3'h7)]}});
            end
          else
            begin
              reg58 <= ((reg46[(4'hb):(2'h3)] >>> reg45[(3'h4):(3'h4)]) ?
                  (~|(($signed(reg50) ? wire37 : (~(8'hb6))) ?
                      $unsigned(reg46[(1'h0):(1'h0)]) : reg42)) : $signed(reg50[(4'h8):(4'h8)]));
              reg59 <= $signed((($signed((reg54 ? reg40 : reg40)) ?
                  $signed((reg47 > wire37)) : (((8'ha5) ?
                      (8'hb8) : reg60) != $signed((8'hb2)))) >> wire39));
              reg60 <= (!{(&$signed((reg44 >> reg60)))});
            end
          reg61 <= ($signed(reg60) ?
              ($unsigned($unsigned({reg46})) ?
                  (8'ha5) : reg51) : $signed((($unsigned(reg54) == $signed(reg49)) ?
                  (reg49[(1'h1):(1'h0)] ?
                      ((8'hac) != reg48) : (reg54 <= reg45)) : ($unsigned(wire36) ?
                      $signed(wire39) : {reg58}))));
        end
    end
  assign wire62 = $signed(reg60);
  assign wire63 = (+({$signed((~reg49))} >> $unsigned((^~reg55))));
  always
    @(posedge clk) begin
      reg64 <= ((&(reg48 | $signed((reg49 ? reg58 : wire62)))) ?
          $signed(reg58[(1'h1):(1'h0)]) : $unsigned((wire39[(2'h3):(1'h1)] ?
              (-$unsigned((8'hbd))) : $signed({wire37, reg60}))));
      reg65 <= (~^(&$unsigned($signed(wire62[(2'h2):(1'h0)]))));
    end
  assign wire66 = ((($unsigned(reg44) ?
                          $signed($signed(wire39)) : (~^(reg48 ?
                              reg41 : (8'hb5)))) && ((~reg64) ?
                          reg45[(4'hd):(4'h9)] : wire37[(4'hc):(4'hc)])) ?
                      reg64[(4'h9):(2'h2)] : wire62);
  assign wire67 = reg40[(1'h1):(1'h1)];
  assign wire68 = $signed(wire52[(2'h2):(1'h1)]);
  assign wire69 = ($signed($unsigned(reg50)) - $signed(reg51));
  assign wire70 = (&$signed($signed(({(8'h9d), wire38} ?
                      (reg61 ? reg41 : wire38) : $unsigned((8'h9e))))));
  assign wire71 = $unsigned($signed({$unsigned($signed(reg58))}));
  assign wire72 = wire68;
  assign wire73 = wire39;
  assign wire74 = reg41;
  assign wire75 = reg56;
  assign wire76 = ((^~((~|{(8'hb6),
                      wire75}) * (^$unsigned(reg47)))) || wire66[(3'h6):(2'h2)]);
  assign wire77 = (!$signed(wire39[(3'h5):(3'h5)]));
  assign wire78 = reg56[(1'h1):(1'h1)];
  assign wire79 = (!$signed(((-reg45[(4'h8):(3'h7)]) < $unsigned(((8'hb3) * reg47)))));
endmodule
