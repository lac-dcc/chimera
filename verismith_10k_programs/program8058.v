module top
#(parameter param349 = {(-(^{((8'hab) ? (8'ha4) : (8'ha2)), ((8'hbe) ? (8'hb0) : (8'hbc))}))}, 
parameter param350 = (((((param349 < param349) ? (8'hb0) : (!param349)) ? ((^param349) ? (^param349) : (param349 ? (8'hba) : param349)) : ((param349 << param349) ? {param349, param349} : (^(7'h40)))) ? (|param349) : (&(~^(|param349)))) ? ((^~{((8'h9c) ? param349 : param349), (^(8'hbb))}) <<< ({(param349 || (8'hb1)), (param349 ? param349 : param349)} ? (+(param349 >>> param349)) : param349)) : {({param349, (param349 ? param349 : param349)} | param349), param349}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire348;
  wire [(5'h14):(1'h0)] wire347;
  wire signed [(3'h7):(1'h0)] wire346;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire344;
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  assign y = {wire348,
                 wire347,
                 wire346,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire117,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire344,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg136,
                 (1'h0)};
  assign wire4 = ($unsigned(wire0[(2'h3):(2'h2)]) ?
                     (wire2[(4'hd):(4'hb)] ?
                         ({wire0,
                             (wire1 ?
                                 wire2 : wire1)} * $unsigned((wire3 >= wire2))) : $unsigned($unsigned(((8'ha1) ^~ wire3)))) : (wire2[(4'hb):(2'h3)] ?
                         $signed((|{wire1, wire3})) : wire2[(2'h2):(1'h0)]));
  assign wire5 = $unsigned($unsigned(wire4[(4'hd):(3'h7)]));
  assign wire6 = $signed((((8'haa) ?
                     (^~(wire0 ? wire3 : wire1)) : (^~(wire1 ?
                         wire0 : wire5))) > (~|(wire1 <= (!(8'ha9))))));
  assign wire7 = wire6;
  assign wire8 = (^~$signed(wire0[(1'h0):(1'h0)]));
  assign wire9 = ($unsigned($unsigned((+wire5))) << (-{{(-(8'hb5))},
                     ($unsigned(wire0) ?
                         wire8[(3'h6):(1'h0)] : wire8[(2'h3):(1'h1)])}));
  assign wire10 = (wire4[(4'h9):(3'h5)] && (&$signed($unsigned((wire8 | wire2)))));
  assign wire11 = $unsigned($unsigned($unsigned($signed((^~(8'haa))))));
  assign wire12 = (|$signed((wire4[(2'h3):(1'h1)] != wire8[(4'ha):(3'h4)])));
  module13 #() modinst118 (wire117, clk, wire0, wire12, wire5, wire9);
  always
    @(posedge clk) begin
      reg119 <= (8'hb5);
      reg120 <= wire11;
      reg121 <= (~|wire10[(1'h1):(1'h1)]);
      if ((^$unsigned($signed((^(wire9 ? wire3 : wire0))))))
        begin
          reg122 <= ($signed(($unsigned($signed(reg119)) ?
                  reg121 : (~|wire8))) ?
              ($unsigned((^~$unsigned((8'haf)))) >>> reg121[(4'h9):(1'h0)]) : $unsigned(wire3[(1'h0):(1'h0)]));
          reg123 <= ((((wire117 ? {wire4, reg120} : wire0[(4'hd):(2'h2)]) ?
              wire12 : ($signed(reg121) ?
                  $signed(wire2) : $unsigned(wire0))) ^~ wire6[(4'h9):(4'h8)]) == wire3[(1'h1):(1'h1)]);
          reg124 <= (~|wire11);
          reg125 <= $signed((wire1 << ($signed((^~reg123)) >> ($unsigned((7'h42)) ?
              ((8'ha4) ~^ reg124) : wire2[(4'ha):(3'h4)]))));
        end
      else
        begin
          reg122 <= (wire7[(3'h5):(2'h3)] ?
              ((&wire5) ?
                  $unsigned(reg121) : $signed({$signed(reg121)})) : (^wire12));
          reg123 <= $signed((wire2 <<< wire1));
          if (reg120[(2'h3):(2'h2)])
            begin
              reg124 <= ($unsigned(wire4) & (^(~^wire5)));
              reg125 <= ((~|(wire8 ?
                      $unsigned((|(8'hac))) : ((8'ha7) || $unsigned(wire10)))) ?
                  $signed(reg123[(3'h5):(2'h2)]) : reg120);
              reg126 <= (~$signed(wire0[(4'ha):(1'h0)]));
              reg127 <= {wire0[(4'ha):(1'h0)]};
            end
          else
            begin
              reg124 <= wire4[(4'hf):(4'hc)];
              reg125 <= {(^$unsigned((reg127[(3'h5):(3'h5)] ~^ wire9)))};
              reg126 <= (8'ha0);
              reg127 <= wire11;
            end
          reg128 <= $signed({wire12[(2'h3):(1'h0)], $unsigned((8'ha0))});
          reg129 <= (reg128 && reg119[(2'h2):(1'h0)]);
        end
      reg130 <= reg124[(3'h4):(2'h3)];
    end
  assign wire131 = {(wire12[(4'h8):(1'h1)] ?
                           ((|$unsigned(wire8)) + ($signed((8'hb6)) ?
                               (-wire11) : {reg129,
                                   wire10})) : $unsigned($unsigned($unsigned(wire3)))),
                       (((~(wire3 & reg121)) ?
                           $unsigned((8'hbd)) : ((wire9 ?
                               wire8 : wire0) >> reg126[(2'h2):(1'h0)])) * (reg124[(3'h5):(1'h1)] ?
                           reg122 : (((8'ha1) != reg130) ?
                               (reg129 ? wire0 : reg130) : wire5)))};
  assign wire132 = (($unsigned((wire0 & (~^(8'hb1)))) ^~ (wire117[(4'he):(4'ha)] ?
                       reg122 : (~|wire131))) | wire131);
  assign wire133 = wire11;
  assign wire134 = reg125;
  assign wire135 = ((|(^(reg119[(2'h3):(1'h1)] ?
                       $signed(wire4) : $unsigned(wire1)))) << $unsigned(wire4[(5'h12):(4'hc)]));
  always
    @(posedge clk) begin
      reg136 <= ({{((wire0 ? wire2 : wire4) >> (^(8'hbc))),
                  ($signed((8'hbe)) ? (wire4 ~^ wire10) : (reg125 && wire117))},
              {wire134[(1'h0):(1'h0)]}} ?
          wire1[(2'h3):(2'h2)] : wire132[(3'h5):(2'h2)]);
    end
  module137 #() modinst345 (.wire138(wire0), .wire141(wire117), .wire140(reg126), .wire139(wire133), .clk(clk), .y(wire344));
  assign wire346 = ((~wire4[(3'h7):(2'h3)]) <= $unsigned((7'h43)));
  assign wire347 = (&{$unsigned($unsigned({reg119}))});
  assign wire348 = reg121[(4'h9):(4'h9)];
endmodule

module module137
#(parameter param342 = ((((((7'h40) >> (8'had)) ? (&(8'hab)) : {(8'hbb)}) >= (^~((8'ha6) && (8'hb5)))) && (^((&(8'ha4)) >> ((8'hb2) ? (7'h40) : (7'h40))))) ? (((-{(8'h9d)}) ? (((8'ha6) ? (8'ha6) : (8'hb2)) ? (^(8'haa)) : ((8'h9c) ? (8'ha0) : (8'hb3))) : ((8'hb4) ? ((7'h43) ? (8'ha8) : (8'hb9)) : ((8'hb2) == (8'hb6)))) << {((~&(8'hba)) ~^ ((8'ha7) | (7'h43)))}) : (+{((8'hba) == ((8'hb8) ? (8'hbf) : (8'hb4)))})), 
parameter param343 = ((((^(&param342)) ? ((param342 ? param342 : param342) >> param342) : ((&param342) * (param342 << param342))) ? {{param342, (param342 <<< param342)}, param342} : ((8'ha1) ? param342 : param342)) & (param342 + param342)))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire141;
  input wire signed [(4'h8):(1'h0)] wire140;
  input wire signed [(4'hf):(1'h0)] wire139;
  input wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire341;
  wire signed [(5'h15):(1'h0)] wire336;
  wire signed [(4'hd):(1'h0)] wire334;
  wire [(4'hd):(1'h0)] wire309;
  wire signed [(2'h3):(1'h0)] wire295;
  wire signed [(4'hd):(1'h0)] wire294;
  wire signed [(5'h14):(1'h0)] wire292;
  wire [(2'h2):(1'h0)] wire241;
  wire signed [(4'hb):(1'h0)] wire240;
  wire signed [(2'h2):(1'h0)] wire239;
  wire [(5'h14):(1'h0)] wire200;
  wire signed [(4'ha):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire237;
  reg signed [(4'hf):(1'h0)] reg340 = (1'h0);
  reg [(3'h7):(1'h0)] reg339 = (1'h0);
  reg [(5'h12):(1'h0)] reg338 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg337 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  assign y = {wire341,
                 wire336,
                 wire334,
                 wire309,
                 wire295,
                 wire294,
                 wire292,
                 wire241,
                 wire240,
                 wire239,
                 wire200,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire237,
                 reg340,
                 reg339,
                 reg338,
                 reg337,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg142 <= wire138;
      reg143 <= $unsigned(wire140);
    end
  always
    @(posedge clk) begin
      if (($signed((-$signed($signed(reg143)))) != $unsigned((wire141 ?
          ({reg142} >= wire140[(3'h7):(1'h0)]) : {$signed((8'hac)),
              $unsigned((8'hb2))}))))
        begin
          if ((&(~(reg142 ? (8'ha1) : wire138[(4'hf):(4'h8)]))))
            begin
              reg144 <= {reg142,
                  (($signed(wire139) > reg142) ?
                      wire139[(1'h1):(1'h1)] : $signed($unsigned(reg143[(2'h2):(2'h2)])))};
              reg145 <= (wire141[(2'h2):(1'h0)] != wire140);
              reg146 <= ($signed(reg142) ?
                  ($signed(($unsigned(reg143) ?
                          (wire138 | reg145) : $unsigned(wire138))) ?
                      reg142[(1'h1):(1'h1)] : $signed((wire138[(3'h6):(3'h6)] ?
                          $unsigned((8'haa)) : $unsigned(reg143)))) : (reg143 <= $unsigned(reg144[(3'h7):(2'h2)])));
              reg147 <= $unsigned(((wire139[(2'h2):(1'h0)] ?
                      ($unsigned(reg142) ?
                          $unsigned(wire141) : {reg143}) : reg145[(4'hd):(3'h5)]) ?
                  {$unsigned((&(8'hbb)))} : (($signed(reg142) ?
                      (-(8'hbd)) : ((8'hbb) ?
                          reg144 : reg144)) >> (reg142[(2'h2):(2'h2)] ?
                      reg143[(3'h5):(1'h1)] : (wire140 ? reg142 : reg144)))));
            end
          else
            begin
              reg144 <= ($unsigned(((reg146 + $unsigned(reg146)) ~^ $unsigned((|reg146)))) < wire138[(3'h5):(3'h4)]);
              reg145 <= (~&wire140[(1'h0):(1'h0)]);
              reg146 <= (({(+$unsigned(reg143))} ?
                      $signed($unsigned(reg143[(2'h2):(2'h2)])) : reg142) ?
                  ($unsigned($signed($unsigned(reg144))) + (reg146 ?
                      wire139 : wire138)) : $signed((((8'hb1) ?
                          (reg146 ^ reg146) : wire140) ?
                      $unsigned(reg145) : $unsigned((reg147 && (8'hb1))))));
              reg147 <= {wire141};
            end
        end
      else
        begin
          reg144 <= (&({reg147} ?
              wire139[(1'h0):(1'h0)] : (({reg146, (8'ha8)} ?
                      $unsigned(reg146) : (reg147 ? wire138 : (8'hbf))) ?
                  ($signed(wire140) != (wire138 & (8'hb0))) : wire139)));
          reg145 <= {$signed($unsigned((~^{reg146, reg142}))), reg147};
          reg146 <= (8'hbe);
          if (wire139[(1'h0):(1'h0)])
            begin
              reg147 <= (wire139 < reg147[(2'h2):(1'h0)]);
            end
          else
            begin
              reg147 <= (wire139[(1'h1):(1'h1)] * ({$signed($unsigned(reg144)),
                      ((^~wire139) ^ $signed(wire138))} ?
                  (~wire141[(1'h1):(1'h0)]) : (-(^~$unsigned((8'hab))))));
            end
        end
      reg148 <= wire141[(1'h0):(1'h0)];
      reg149 <= (+$unsigned(((^$unsigned((8'ha7))) <= (~$unsigned(wire139)))));
      reg150 <= reg145;
      if ($signed($unsigned(((8'hab) != (|((8'ha2) ? reg142 : (8'ha3)))))))
        begin
          reg151 <= (8'h9e);
          if (((reg145[(4'hd):(4'h9)] * $signed($unsigned($signed(wire139)))) ~^ (~|$unsigned($unsigned($unsigned(reg142))))))
            begin
              reg152 <= (((~$unsigned({wire141})) < $unsigned($unsigned(reg150))) ?
                  (8'hb1) : reg147);
            end
          else
            begin
              reg152 <= $signed(reg150);
              reg153 <= $unsigned((!($unsigned((reg147 ?
                  reg149 : reg145)) < $unsigned((reg145 ?
                  (7'h40) : (8'ha8))))));
            end
        end
      else
        begin
          reg151 <= reg145[(5'h10):(3'h6)];
          reg152 <= ((reg150[(3'h4):(1'h0)] ?
                  (!$signed((^~wire138))) : ({$unsigned(reg149)} ?
                      ((wire139 ? reg142 : (8'hac)) ?
                          $unsigned(reg151) : $unsigned(wire139)) : $signed(reg153[(3'h5):(2'h2)]))) ?
              reg151 : ((((reg145 ?
                      reg143 : (8'h9f)) > reg143) <<< $signed($signed((8'ha8)))) ?
                  (^$unsigned((~reg144))) : (({(8'hb2), (7'h42)} ?
                      (reg151 ? reg148 : wire139) : reg152) & $signed((wire138 ?
                      reg151 : reg153)))));
          reg153 <= ((8'haf) ? reg150[(1'h0):(1'h0)] : wire139);
          reg154 <= (-wire140[(3'h5):(1'h0)]);
        end
    end
  assign wire155 = ($unsigned($signed($unsigned($signed(reg150)))) << (^{reg142[(1'h1):(1'h1)]}));
  assign wire156 = wire140[(3'h4):(1'h1)];
  assign wire157 = reg150;
  assign wire158 = (8'hac);
  assign wire159 = ($unsigned(($signed({wire141, wire156}) ?
                           $unsigned($signed(reg145)) : (wire138 ^~ {wire156,
                               (7'h40)}))) ?
                       {reg148} : (8'hbf));
  assign wire160 = reg152[(4'hd):(1'h0)];
  module161 #() modinst201 (.y(wire200), .clk(clk), .wire164(reg152), .wire163(wire138), .wire165(reg145), .wire162(reg142));
  module202 #() modinst238 (wire237, clk, reg151, wire141, reg143, reg153, reg152);
  assign wire239 = (~^$signed((wire141 && {$signed(wire157), (~^reg152)})));
  assign wire240 = $signed($signed(((reg147[(2'h3):(1'h1)] ?
                       $unsigned(wire200) : wire138[(2'h2):(1'h0)]) == reg152[(4'hf):(3'h7)])));
  assign wire241 = wire139;
  module242 #() modinst293 (wire292, clk, wire155, wire156, wire159, reg146, wire158);
  assign wire294 = wire155[(2'h3):(1'h0)];
  assign wire295 = $signed($signed($unsigned({$unsigned(reg144)})));
  module296 #() modinst310 (wire309, clk, reg152, wire139, wire240, wire200, wire138);
  module311 #() modinst335 (wire334, clk, reg151, reg154, wire141, wire159);
  assign wire336 = wire294;
  always
    @(posedge clk) begin
      reg337 <= $signed({(-$signed(wire156)),
          $unsigned((!(reg152 ? (8'haf) : reg149)))});
      reg338 <= $signed(reg337);
      reg339 <= $signed({(((-reg149) ?
              $unsigned((8'ha1)) : $signed(wire141)) ~^ (+{(8'ha2), (8'hb5)})),
          $unsigned(((~|wire141) ? wire336 : (^~wire239)))});
      reg340 <= (!reg148[(2'h3):(1'h0)]);
    end
  assign wire341 = wire155;
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire111,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire48,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg116,
                 reg113,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire18 = (~|wire16);
  assign wire19 = $unsigned(wire14[(1'h0):(1'h0)]);
  assign wire20 = ((~&$unsigned($signed(((8'hae) > (8'hbf))))) >= $signed((-$unsigned((wire18 <<< (8'hbb))))));
  assign wire21 = (wire14 ?
                      wire17 : {(wire16 ?
                              (^(wire16 ?
                                  wire18 : wire19)) : (~wire19[(1'h0):(1'h0)])),
                          (~&$signed(((8'hba) >>> wire19)))});
  assign wire22 = (^{$unsigned($signed((wire14 ? wire14 : wire21)))});
  assign wire23 = $unsigned(wire15);
  assign wire24 = (~wire17[(4'h9):(1'h0)]);
  assign wire25 = wire21[(3'h4):(1'h0)];
  assign wire26 = {$signed(((|{wire18}) & ((wire21 ^ wire15) <<< (~^wire24)))),
                      $signed(wire14)};
  assign wire27 = (^$unsigned(wire18));
  module28 #() modinst49 (wire48, clk, wire19, wire16, wire21, wire24);
  always
    @(posedge clk) begin
      reg50 <= $unsigned($unsigned($unsigned(wire21)));
      reg51 <= $unsigned((|$unsigned((~|$unsigned((8'h9d))))));
      reg52 <= (!(reg50 ? (-wire48) : (~&((^~wire22) && $signed(wire22)))));
      reg53 <= (wire21[(3'h7):(3'h6)] * (~|(($unsigned(wire20) ?
          (wire18 >> (8'hb4)) : {wire16}) ~^ wire25)));
    end
  assign wire54 = (8'ha9);
  assign wire55 = ($unsigned(((+$unsigned(wire17)) <<< ($unsigned(wire48) ?
                      {(8'ha3)} : (~|(8'ha4))))) ~^ $unsigned(wire48[(3'h7):(3'h7)]));
  assign wire56 = ({wire26,
                      $signed(((wire19 ? wire24 : wire21) ?
                          (~&wire24) : $signed(reg52)))} ^~ wire18);
  assign wire57 = $unsigned(((($signed(wire15) ?
                      (|wire56) : $unsigned(reg51)) ^ $signed((wire55 ?
                      (8'ha2) : wire14))) >= (wire21 ?
                      $unsigned((wire23 ? reg52 : wire14)) : {(wire56 ?
                              (8'hbf) : wire20)})));
  assign wire58 = (8'hb7);
  assign wire59 = wire19[(1'h1):(1'h0)];
  module60 #() modinst112 (.wire63(wire23), .y(wire111), .wire62(wire26), .wire64(wire58), .wire61(wire57), .clk(clk));
  always
    @(posedge clk) begin
      reg113 <= ($unsigned($signed($signed({wire16}))) ?
          $unsigned(wire21[(4'hf):(3'h4)]) : $unsigned((wire21 & wire15[(5'h12):(4'hf)])));
    end
  assign wire114 = (-(+(~|wire25)));
  assign wire115 = (reg113[(3'h4):(2'h2)] * (wire56[(4'hf):(1'h0)] ?
                       $unsigned((!wire58)) : (wire48[(2'h2):(1'h0)] >= $signed($unsigned(reg50)))));
  always
    @(posedge clk) begin
      reg116 <= ($signed(wire23[(4'h9):(1'h0)]) ?
          $signed(wire19) : wire20[(3'h6):(2'h3)]);
    end
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h214):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire95,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire66,
                 wire65,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg98,
                 reg97,
                 reg96,
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
                 reg77,
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
                 (1'h0)};
  assign wire65 = wire62;
  assign wire66 = wire65;
  always
    @(posedge clk) begin
      reg67 <= (wire64 != wire65);
      if ({$signed({wire62})})
        begin
          reg68 <= (!wire61);
        end
      else
        begin
          if ($unsigned(wire66))
            begin
              reg68 <= wire65[(4'hc):(4'h9)];
              reg69 <= ({wire65[(4'hc):(1'h1)]} >> (~&(($unsigned(reg68) ?
                  wire61[(2'h3):(1'h1)] : reg68[(1'h0):(1'h0)]) - {wire66,
                  $signed(wire66)})));
              reg70 <= (wire62[(2'h3):(2'h2)] ^~ {$unsigned(wire65),
                  $unsigned({(&reg67), reg67})});
              reg71 <= {($unsigned((~|(wire62 - (8'hb3)))) > ((wire63[(4'hc):(3'h5)] && $signed(wire64)) ?
                      wire65[(2'h2):(1'h1)] : $unsigned($signed(wire61))))};
            end
          else
            begin
              reg68 <= (8'hbe);
              reg69 <= (((8'hb0) > $unsigned(wire62[(3'h4):(3'h4)])) ?
                  $unsigned($unsigned((&{wire61}))) : reg67[(3'h7):(3'h6)]);
            end
          if ($unsigned($signed($signed($signed($signed(reg69))))))
            begin
              reg72 <= wire63;
            end
          else
            begin
              reg72 <= (reg71 | $unsigned($signed(reg72)));
              reg73 <= (^wire62);
              reg74 <= ((reg72[(3'h7):(1'h1)] ?
                  $signed((+(reg71 ? wire62 : wire62))) : (reg73 ?
                      ({reg70} ?
                          reg69 : (reg68 >>> reg71)) : (8'ha1))) == wire63[(4'h8):(3'h4)]);
              reg75 <= (($unsigned(((&(8'hbb)) << (wire64 ?
                  wire63 : reg67))) ^~ {({reg74, wire64} >>> wire64),
                  (reg73 * wire61)}) >>> reg74[(4'hd):(4'hb)]);
            end
        end
      reg76 <= ($unsigned($signed({(^~wire61),
          ((8'hab) ^~ reg70)})) == (~&$unsigned((!(8'hbe)))));
      reg77 <= reg69[(2'h2):(2'h2)];
    end
  assign wire78 = reg71[(2'h3):(2'h2)];
  assign wire79 = wire64;
  assign wire80 = $unsigned($signed(wire65[(4'ha):(3'h4)]));
  assign wire81 = $unsigned($signed((reg74 | (wire80 < (~^wire79)))));
  always
    @(posedge clk) begin
      if (((-((!(wire81 ? wire65 : reg74)) <= $signed({reg70,
          wire66}))) == {wire80[(3'h4):(1'h1)]}))
        begin
          if ((reg72 ? wire78 : reg72))
            begin
              reg82 <= (|$unsigned((+(7'h40))));
              reg83 <= $unsigned(wire65);
              reg84 <= ((^~$signed((wire79 < $signed(wire63)))) >> {reg77[(3'h5):(3'h4)]});
              reg85 <= (8'hba);
            end
          else
            begin
              reg82 <= reg74;
              reg83 <= reg69[(1'h1):(1'h1)];
              reg84 <= reg75;
            end
          reg86 <= (($unsigned({(reg85 ? reg83 : (8'hb5)),
                  reg68[(4'he):(3'h5)]}) ?
              {(-(-reg73)),
                  wire81[(1'h0):(1'h0)]} : (reg76 <= wire79[(3'h4):(3'h4)])) <= (wire62 ?
              ((8'h9e) ^ wire65[(4'hb):(4'hb)]) : $signed(((wire81 ?
                  (8'ha2) : reg75) ^~ reg70))));
          if (($unsigned((8'hb1)) || $unsigned((reg67 <= $unsigned((~^reg74))))))
            begin
              reg87 <= {wire66, reg84};
            end
          else
            begin
              reg87 <= ($signed($unsigned(((^(8'hb1)) ? (!wire62) : {reg83}))) ?
                  $signed($unsigned((~|((8'hb3) ? wire62 : reg73)))) : (8'haa));
              reg88 <= $signed((wire78[(1'h0):(1'h0)] ?
                  ({((8'ha5) < reg77),
                      wire65} | reg86[(2'h2):(1'h1)]) : reg71[(1'h0):(1'h0)]));
              reg89 <= reg67[(2'h2):(1'h1)];
            end
          if (reg83)
            begin
              reg90 <= ((reg77[(2'h2):(1'h0)] < {reg86}) ^ {(|$unsigned($unsigned(reg89))),
                  $unsigned((~^reg71))});
              reg91 <= ($signed((^$unsigned(reg82))) >= ({wire79[(2'h2):(2'h2)],
                  wire81} == wire64));
              reg92 <= reg71;
              reg93 <= $unsigned(reg82[(3'h7):(3'h5)]);
              reg94 <= reg88[(4'h8):(1'h0)];
            end
          else
            begin
              reg90 <= (({$signed(reg76)} | $signed(((^~wire81) > reg85))) ^ reg73[(3'h4):(2'h3)]);
              reg91 <= (+($unsigned($signed((~|wire66))) ?
                  reg92 : (reg86 | (|reg67[(4'he):(3'h4)]))));
              reg92 <= (-(wire79[(2'h2):(2'h2)] >= ((-(wire63 ?
                  reg86 : reg90)) * wire66[(3'h5):(3'h5)])));
            end
        end
      else
        begin
          if (reg88[(2'h2):(1'h0)])
            begin
              reg82 <= $signed(reg75[(3'h4):(2'h2)]);
              reg83 <= (-reg73);
              reg84 <= $signed((8'hab));
              reg85 <= reg90[(4'hf):(4'hf)];
              reg86 <= wire61;
            end
          else
            begin
              reg82 <= $unsigned(reg75);
              reg83 <= $unsigned(wire65);
              reg84 <= wire64[(3'h5):(3'h5)];
            end
        end
    end
  assign wire95 = $signed(reg70[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg96 <= (wire95[(4'h9):(3'h4)] ?
          reg94[(4'hc):(2'h3)] : (-$signed(((~|wire95) > $unsigned(wire79)))));
      reg97 <= $signed($signed(wire66[(4'h9):(1'h1)]));
      reg98 <= (-($signed((8'hb3)) - reg90[(3'h6):(3'h6)]));
    end
  assign wire99 = $signed(reg97);
  assign wire100 = {$signed((&wire63))};
  assign wire101 = $unsigned($signed(wire80[(4'hb):(4'h8)]));
  assign wire102 = (&$unsigned((&reg72[(4'h8):(1'h0)])));
  always
    @(posedge clk) begin
      reg103 <= $unsigned({$signed((+(&wire65))),
          (($unsigned(reg94) ?
              $unsigned(reg84) : (reg94 ?
                  (8'ha3) : reg72)) ^~ (~^(reg90 <<< (8'ha6))))});
      reg104 <= ($signed($unsigned((~^$signed((8'ha4))))) ^~ (~((reg88 ?
              $signed((8'hbe)) : $unsigned((8'had))) ?
          (~|$signed(reg90)) : $unsigned((reg97 ? reg97 : wire81)))));
      if ($signed(((reg89 ?
          reg98[(4'ha):(2'h2)] : reg86[(2'h2):(1'h0)]) <<< reg96[(3'h4):(1'h0)])))
        begin
          reg105 <= wire78;
          reg106 <= $signed(($unsigned((+reg104)) ?
              ((~&wire102) ^ ((wire100 ? reg94 : reg96) ?
                  (wire99 >>> reg98) : $signed(reg73))) : {$unsigned((wire101 || reg93))}));
          reg107 <= reg90[(5'h11):(4'hd)];
          reg108 <= (&reg86);
        end
      else
        begin
          reg105 <= ((reg84[(3'h6):(2'h3)] + ((~$signed((7'h43))) ?
                  {(reg85 & reg103), (~&wire64)} : $signed((reg73 ?
                      reg87 : (8'ha2))))) ?
              ($signed({$unsigned(reg91)}) ?
                  wire61[(1'h0):(1'h0)] : $signed({$unsigned(reg98)})) : (reg108 ?
                  ((wire95[(3'h4):(1'h0)] != reg74[(5'h12):(4'hb)]) && ((reg89 <<< reg107) ?
                      ((8'hb3) ?
                          reg94 : reg82) : reg103)) : (($unsigned(reg89) ?
                          $signed(reg72) : reg82) ?
                      $unsigned((-reg107)) : (^((8'ha5) ? reg75 : (8'ha3))))));
          reg106 <= wire64;
        end
    end
  assign wire109 = wire100;
  assign wire110 = reg105;
endmodule

module module28
#(parameter param47 = (~^((&(+{(8'ha4)})) >> ((((7'h43) == (8'hb6)) == ((8'hb0) | (8'ha5))) ? (((8'hb3) ? (8'haa) : (8'ha9)) ? ((8'hbb) <= (8'h9f)) : ((8'hb5) ? (8'ha4) : (8'ha9))) : (+(^(7'h41)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire33 = (((^{(|wire32), (wire31 ? wire29 : wire29)}) ?
                          (($signed(wire31) ? $unsigned(wire29) : {wire30}) ?
                              $signed({wire29}) : {wire32[(2'h2):(1'h0)]}) : wire29[(4'ha):(4'ha)]) ?
                      $signed(wire29[(4'h9):(1'h0)]) : $signed(wire31));
  assign wire34 = $signed(wire32[(3'h4):(2'h2)]);
  assign wire35 = {(^(((&wire34) & $unsigned((7'h40))) ?
                          wire32[(2'h3):(1'h1)] : wire33))};
  assign wire36 = (($signed((-(~&wire34))) >= wire34[(3'h4):(1'h1)]) ?
                      (wire30[(5'h10):(2'h2)] && (-$unsigned(wire31[(3'h5):(3'h4)]))) : ($signed(({wire32,
                                  (8'ha3)} ?
                              ((8'hac) >>> (8'hba)) : {(8'h9d), wire35})) ?
                          wire29[(1'h1):(1'h1)] : $signed((&$signed(wire34)))));
  assign wire37 = (^~$signed(wire31));
  assign wire38 = wire34;
  assign wire39 = wire38;
  always
    @(posedge clk) begin
      reg40 <= $unsigned($unsigned({wire33[(4'hc):(4'h8)],
          ((~^wire31) ? $unsigned(wire37) : {wire36, wire32})}));
    end
  always
    @(posedge clk) begin
      if (wire38[(3'h4):(3'h4)])
        begin
          reg41 <= (|((wire39[(1'h1):(1'h1)] ?
                  (-$unsigned((8'hb5))) : wire31[(4'hb):(3'h6)]) ?
              $unsigned(({wire32, wire37} < (wire37 ?
                  wire29 : reg40))) : (!wire29)));
          reg42 <= wire34;
          reg43 <= $unsigned(((|reg42[(2'h2):(1'h1)]) ?
              ($unsigned(wire29) ?
                  (-wire36) : wire38[(2'h3):(1'h0)]) : $signed((8'hb7))));
          if ($signed((8'ha1)))
            begin
              reg44 <= {(wire30 ? $signed($signed($unsigned(wire29))) : wire36),
                  ({$unsigned({(8'hbc)}), reg42} >= {$signed({reg40})})};
            end
          else
            begin
              reg44 <= $unsigned((-$signed(($signed(wire37) ?
                  (wire36 ? wire34 : reg43) : reg44))));
              reg45 <= (~^((reg40[(4'hf):(1'h1)] ?
                  ((reg42 != (8'ha7)) << (wire29 * (8'hba))) : (wire36[(2'h2):(1'h1)] ?
                      ((8'hb2) ?
                          wire36 : (8'hbd)) : reg40[(4'hc):(2'h2)])) <= $signed(((wire31 ?
                  wire30 : (8'hab)) * (wire29 || wire35)))));
              reg46 <= $unsigned($signed($unsigned(wire30)));
            end
        end
      else
        begin
          reg41 <= wire35[(4'h8):(4'h8)];
          reg42 <= wire36[(1'h1):(1'h0)];
          reg43 <= $unsigned((reg41 ?
              (~&$signed($unsigned(reg44))) : ($unsigned(wire29) ?
                  (reg44 ?
                      ((8'hbd) | reg41) : $unsigned((8'hb1))) : reg44[(3'h7):(3'h5)])));
          reg44 <= {$unsigned(wire37)};
          reg45 <= $unsigned(wire31[(5'h12):(3'h5)]);
        end
    end
endmodule

module module311  (y, clk, wire315, wire314, wire313, wire312);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire315;
  input wire [(4'h9):(1'h0)] wire314;
  input wire [(4'hd):(1'h0)] wire313;
  input wire signed [(3'h5):(1'h0)] wire312;
  wire signed [(4'h9):(1'h0)] wire333;
  wire signed [(5'h12):(1'h0)] wire332;
  wire [(5'h10):(1'h0)] wire331;
  wire signed [(4'h9):(1'h0)] wire330;
  wire [(5'h10):(1'h0)] wire329;
  wire signed [(4'hd):(1'h0)] wire328;
  wire signed [(5'h15):(1'h0)] wire327;
  wire [(2'h2):(1'h0)] wire326;
  wire signed [(4'h9):(1'h0)] wire325;
  wire [(4'hd):(1'h0)] wire324;
  wire signed [(3'h6):(1'h0)] wire323;
  wire [(3'h5):(1'h0)] wire322;
  wire signed [(2'h2):(1'h0)] wire321;
  wire [(4'hd):(1'h0)] wire320;
  wire [(5'h15):(1'h0)] wire319;
  wire [(5'h15):(1'h0)] wire318;
  wire signed [(5'h12):(1'h0)] wire317;
  wire signed [(5'h14):(1'h0)] wire316;
  assign y = {wire333,
                 wire332,
                 wire331,
                 wire330,
                 wire329,
                 wire328,
                 wire327,
                 wire326,
                 wire325,
                 wire324,
                 wire323,
                 wire322,
                 wire321,
                 wire320,
                 wire319,
                 wire318,
                 wire317,
                 wire316,
                 (1'h0)};
  assign wire316 = $unsigned(wire314);
  assign wire317 = wire313;
  assign wire318 = (wire312[(2'h2):(1'h1)] ?
                       wire317 : (wire313[(2'h2):(2'h2)] ^~ (wire316[(5'h10):(2'h2)] << $signed((wire313 - wire317)))));
  assign wire319 = (wire314 - wire314[(1'h1):(1'h0)]);
  assign wire320 = (wire317 ?
                       ((+$unsigned((wire319 ? (8'ha6) : wire316))) ?
                           (wire316[(2'h2):(1'h0)] && ((wire313 ?
                               wire314 : wire318) ~^ $signed(wire319))) : {$signed((8'hbb)),
                               (8'ha3)}) : (((&(wire316 ~^ wire317)) ?
                           ((wire315 ? wire313 : wire318) ?
                               wire312[(1'h1):(1'h0)] : (wire312 >>> wire312)) : wire317[(2'h2):(1'h0)]) >= ((&wire312[(2'h2):(2'h2)]) < (8'hbe))));
  assign wire321 = $signed(({$signed($unsigned(wire313))} <<< $signed((~&wire312))));
  assign wire322 = $unsigned(wire320);
  assign wire323 = wire322[(1'h1):(1'h0)];
  assign wire324 = wire322;
  assign wire325 = {{$unsigned(((wire315 ? wire317 : wire319) ?
                               (!wire320) : (&wire312))),
                           $signed(wire312[(2'h2):(1'h1)])}};
  assign wire326 = {{wire320, ((+$signed(wire320)) | wire322)},
                       ({((|wire320) ? $unsigned(wire318) : (~^wire322)),
                           wire318} + (~&wire318[(5'h11):(4'h8)]))};
  assign wire327 = wire320;
  assign wire328 = wire317[(2'h2):(1'h0)];
  assign wire329 = wire318;
  assign wire330 = {(~|wire323[(3'h5):(2'h2)])};
  assign wire331 = $signed(wire317);
  assign wire332 = wire315[(2'h2):(1'h1)];
  assign wire333 = wire326;
endmodule

module module296
#(parameter param308 = ((8'ha5) != ((({(8'ha3), (8'haa)} - (~&(8'ha4))) >= (((8'hba) != (8'hb5)) ? {(8'ha1), (8'hb7)} : {(8'hb0)})) ? ((((8'ha2) ? (8'hbf) : (8'ha1)) ? ((8'ha1) == (8'hba)) : ((8'hbf) <= (8'ha0))) ~^ ({(8'h9c), (8'hb1)} & (|(8'h9d)))) : (+((!(8'hb5)) ? ((8'hb2) ^ (8'h9f)) : ((8'ha8) ^ (8'ha6)))))))
(y, clk, wire301, wire300, wire299, wire298, wire297);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire301;
  input wire [(4'hf):(1'h0)] wire300;
  input wire [(4'hb):(1'h0)] wire299;
  input wire [(5'h10):(1'h0)] wire298;
  input wire [(4'h9):(1'h0)] wire297;
  wire [(3'h7):(1'h0)] wire307;
  wire signed [(4'hf):(1'h0)] wire306;
  wire signed [(4'hf):(1'h0)] wire305;
  wire [(4'he):(1'h0)] wire304;
  wire [(4'hc):(1'h0)] wire303;
  wire [(2'h2):(1'h0)] wire302;
  assign y = {wire307, wire306, wire305, wire304, wire303, wire302, (1'h0)};
  assign wire302 = $unsigned(wire300[(4'hb):(4'ha)]);
  assign wire303 = (($signed(wire297) >>> $signed(({wire301, (8'hbe)} ?
                       $unsigned(wire299) : {wire301,
                           wire299}))) == $signed($signed(({wire300} && $signed(wire299)))));
  assign wire304 = wire298;
  assign wire305 = (wire301[(1'h1):(1'h0)] - {wire304, wire299});
  assign wire306 = (+$unsigned($unsigned($unsigned((wire301 - wire302)))));
  assign wire307 = wire298;
endmodule

module module242
#(parameter param290 = ({(+(~((8'hba) * (8'hbf))))} ? ((^~((^(8'ha2)) ? ((8'ha5) <= (8'ha4)) : ((8'ha9) ? (8'had) : (8'h9f)))) ? {(((8'hb7) ? (8'hb2) : (8'hb9)) ? ((8'hb8) ? (8'ha4) : (8'ha4)) : (~&(8'hbf)))} : {(^(~&(8'hbf)))}) : ((({(7'h43), (8'ha6)} ? ((8'hab) ? (7'h40) : (7'h44)) : ((8'hb1) ? (8'ha1) : (8'had))) ? ({(8'hb7), (8'hab)} ? ((8'ha3) < (8'had)) : (-(8'h9e))) : (((8'hb0) || (8'hb1)) ~^ (!(8'ha0)))) ? ({((8'h9e) ? (8'hab) : (8'ha1))} ? (((8'hb9) <= (7'h40)) ? ((8'hbb) ? (8'ha3) : (7'h42)) : ((7'h42) <= (8'ha6))) : ((~&(8'ha6)) ? ((7'h43) ? (8'haf) : (8'hbf)) : ((8'hbd) ? (8'ha9) : (8'hbe)))) : ((((8'haa) << (8'ha1)) ? (~|(8'ha4)) : ((8'hb8) && (8'ha9))) ? (((8'hba) ^ (8'ha4)) & ((8'ha8) ? (8'ha0) : (8'hab))) : (~|((8'hbc) ? (8'h9d) : (7'h40)))))), 
parameter param291 = (~^((~param290) != ((param290 << (&param290)) > ({param290} ? (param290 || param290) : (param290 ? param290 : param290))))))
(y, clk, wire247, wire246, wire245, wire244, wire243);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire247;
  input wire [(4'h8):(1'h0)] wire246;
  input wire signed [(5'h13):(1'h0)] wire245;
  input wire [(2'h3):(1'h0)] wire244;
  input wire signed [(4'hd):(1'h0)] wire243;
  wire [(4'he):(1'h0)] wire287;
  wire signed [(5'h10):(1'h0)] wire276;
  wire [(4'h8):(1'h0)] wire275;
  wire [(4'hc):(1'h0)] wire274;
  wire signed [(5'h11):(1'h0)] wire251;
  reg [(5'h13):(1'h0)] reg289 = (1'h0);
  reg [(5'h15):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg286 = (1'h0);
  reg [(3'h7):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg284 = (1'h0);
  reg [(5'h12):(1'h0)] reg283 = (1'h0);
  reg [(5'h14):(1'h0)] reg282 = (1'h0);
  reg [(4'h8):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg280 = (1'h0);
  reg [(2'h2):(1'h0)] reg279 = (1'h0);
  reg [(4'hd):(1'h0)] reg278 = (1'h0);
  reg [(3'h7):(1'h0)] reg277 = (1'h0);
  reg [(5'h14):(1'h0)] reg273 = (1'h0);
  reg [(2'h3):(1'h0)] reg272 = (1'h0);
  reg [(4'he):(1'h0)] reg271 = (1'h0);
  reg [(3'h6):(1'h0)] reg270 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg269 = (1'h0);
  reg [(4'he):(1'h0)] reg268 = (1'h0);
  reg [(2'h3):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg265 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg263 = (1'h0);
  reg signed [(4'he):(1'h0)] reg262 = (1'h0);
  reg [(5'h10):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg260 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg259 = (1'h0);
  reg [(2'h2):(1'h0)] reg258 = (1'h0);
  reg [(5'h12):(1'h0)] reg257 = (1'h0);
  reg [(4'he):(1'h0)] reg256 = (1'h0);
  reg [(4'hf):(1'h0)] reg255 = (1'h0);
  reg [(5'h10):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg253 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg250 = (1'h0);
  reg [(4'he):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg248 = (1'h0);
  assign y = {wire287,
                 wire276,
                 wire275,
                 wire274,
                 wire251,
                 reg289,
                 reg288,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg250,
                 reg249,
                 reg248,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg248 <= (~^(($signed((wire245 << wire244)) && ($signed(wire244) ?
              $signed(wire244) : (wire247 ? wire243 : wire247))) ?
          wire246[(1'h0):(1'h0)] : wire247));
      reg249 <= $unsigned($signed(wire246));
      reg250 <= reg248[(1'h1):(1'h1)];
    end
  assign wire251 = (7'h44);
  always
    @(posedge clk) begin
      if ($unsigned({$signed({reg249[(2'h2):(1'h1)]}),
          $unsigned(($unsigned(reg249) ? reg248[(1'h0):(1'h0)] : wire245))}))
        begin
          reg252 <= ($signed(wire244[(1'h0):(1'h0)]) ?
              $unsigned($signed($unsigned($signed((8'hba))))) : $signed($unsigned(($unsigned(reg248) || (wire251 ?
                  wire251 : wire244)))));
          reg253 <= wire251;
        end
      else
        begin
          reg252 <= (8'hb0);
          reg253 <= $signed({reg250});
          reg254 <= $unsigned(wire247);
          reg255 <= wire251[(4'hc):(4'ha)];
        end
      reg256 <= $signed(wire243[(2'h3):(2'h2)]);
      if ($unsigned(reg253[(2'h3):(1'h1)]))
        begin
          reg257 <= ($unsigned(reg254[(5'h10):(4'hd)]) == {$unsigned((reg249 ?
                  (reg249 ? wire246 : reg254) : (~&reg249)))});
          if ($signed(reg257))
            begin
              reg258 <= $signed(wire251);
              reg259 <= ($signed(reg253[(1'h1):(1'h0)]) > (&(8'hbd)));
              reg260 <= ((-(+$signed(reg252[(1'h1):(1'h0)]))) ?
                  (((wire247 ?
                          $unsigned((8'hb0)) : $unsigned(reg256)) == ((reg250 && wire247) ^ (!wire247))) ?
                      (&$signed((wire246 ~^ reg256))) : wire244) : {reg256[(2'h3):(1'h0)]});
            end
          else
            begin
              reg258 <= (((~^reg249[(4'h9):(3'h7)]) & $unsigned(($signed(reg258) ?
                      reg258 : (reg252 ~^ reg249)))) ?
                  {$signed((((8'hae) ? wire245 : (8'ha6)) ?
                          (!wire251) : $signed(wire243)))} : $signed(wire244[(1'h0):(1'h0)]));
              reg259 <= reg259[(1'h1):(1'h1)];
              reg260 <= (~(wire243 & (8'h9f)));
              reg261 <= {wire244[(1'h0):(1'h0)],
                  (~|(!$signed((reg253 ? (7'h44) : reg258))))};
              reg262 <= (((&$signed((~^reg248))) <<< reg252[(4'h8):(2'h2)]) <<< $signed((wire247 ?
                  $signed(((8'hbe) ? (8'hb7) : wire244)) : (-{(8'ha3),
                      reg259}))));
            end
        end
      else
        begin
          reg257 <= (!$signed((~(reg253[(1'h1):(1'h0)] ?
              (+reg257) : (8'hb7)))));
          reg258 <= (($signed(reg254) >= ((^~(&reg250)) == $unsigned({reg252,
                  reg252}))) ?
              reg252[(3'h4):(1'h1)] : $unsigned(wire246[(3'h5):(3'h5)]));
          reg259 <= {(((-(&wire247)) ? reg258 : (^$signed(reg253))) ?
                  $unsigned($signed(reg260[(1'h0):(1'h0)])) : wire251)};
          reg260 <= (&wire247[(3'h5):(3'h5)]);
        end
      reg263 <= wire244;
      if ((reg261 ? reg261 : $unsigned({$unsigned((8'hbd))})))
        begin
          reg264 <= (&$signed({(-{reg248, reg263})}));
          reg265 <= $unsigned(($signed(reg250) & reg258[(2'h2):(2'h2)]));
          if ((^wire245[(4'ha):(1'h0)]))
            begin
              reg266 <= $signed(reg253[(3'h4):(2'h2)]);
            end
          else
            begin
              reg266 <= (-(7'h44));
              reg267 <= reg265[(4'hc):(4'ha)];
              reg268 <= reg256;
              reg269 <= (({(~^{reg268}), (!(~&wire245))} ?
                      $signed(wire247[(2'h3):(2'h3)]) : (reg265[(4'ha):(2'h2)] ?
                          (reg266 ?
                              (!(8'ha5)) : reg257[(4'hf):(1'h1)]) : reg256)) ?
                  $unsigned(reg256) : ((~&wire244[(1'h1):(1'h0)]) - reg255[(3'h6):(3'h5)]));
            end
          if (((((((8'h9f) << reg254) ?
                  (8'ha9) : (~^reg269)) >= ((reg248 + reg249) ?
                  reg259 : reg260[(4'h8):(4'h8)])) >= (($signed(reg269) ?
                  $unsigned(wire251) : $signed(wire245)) | ((reg268 >= (8'hbc)) ?
                  (&reg257) : reg256[(4'he):(2'h3)]))) ?
              (+($signed($unsigned(reg267)) & (wire246 ?
                  {reg255} : $unsigned((8'hba))))) : ($unsigned(wire244[(1'h1):(1'h0)]) ?
                  (reg257 ?
                      ($signed(reg253) >> (~|wire251)) : reg266) : $signed($unsigned(reg258)))))
            begin
              reg270 <= ((&reg261[(4'hc):(4'ha)]) ~^ reg248);
            end
          else
            begin
              reg270 <= (wire246[(2'h2):(2'h2)] >= $signed(reg257));
              reg271 <= (reg250[(3'h6):(1'h1)] ? $signed(reg270) : reg268);
              reg272 <= reg252;
            end
          reg273 <= {$unsigned($signed($unsigned($signed((8'hb5))))),
              $signed(reg272)};
        end
      else
        begin
          reg264 <= ($unsigned(reg248[(1'h0):(1'h0)]) ?
              $signed(reg261[(1'h1):(1'h1)]) : $unsigned({((8'ha7) ^~ (~(8'ha8))),
                  ((&reg255) ? reg250 : reg273[(3'h7):(3'h7)])}));
        end
    end
  assign wire274 = reg250;
  assign wire275 = $unsigned((^{$signed((reg256 ? reg270 : reg260))}));
  assign wire276 = reg260[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg277 <= reg269[(1'h1):(1'h1)];
      if ((reg255 != (~(reg273 - ((reg261 ? reg266 : wire274) > (reg250 ?
          reg269 : reg258))))))
        begin
          if ($unsigned(reg250))
            begin
              reg278 <= wire274;
              reg279 <= ($signed({$unsigned((~|reg273))}) || reg258);
              reg280 <= $unsigned(reg263[(4'hf):(4'h9)]);
              reg281 <= reg249;
              reg282 <= $signed(reg281);
            end
          else
            begin
              reg278 <= $unsigned(({((wire247 * reg277) < $unsigned((8'hb4)))} >>> ($signed((reg277 < wire246)) ?
                  ($signed(reg261) | reg273[(5'h13):(4'ha)]) : reg248[(2'h2):(1'h0)])));
            end
          reg283 <= (8'ha6);
        end
      else
        begin
          if ((+reg257[(4'hd):(4'hb)]))
            begin
              reg278 <= reg263;
              reg279 <= wire247;
              reg280 <= $unsigned((reg254[(1'h0):(1'h0)] >>> (+($signed(reg262) > ((8'hb5) || wire251)))));
              reg281 <= $signed(wire246[(2'h3):(1'h1)]);
              reg282 <= $unsigned((~&reg270[(1'h0):(1'h0)]));
            end
          else
            begin
              reg278 <= reg264[(2'h3):(2'h3)];
            end
          reg283 <= ($unsigned(($unsigned((|reg248)) <<< reg272[(2'h3):(2'h3)])) < (-{wire274}));
          reg284 <= (|reg268[(1'h1):(1'h0)]);
          if ((((8'h9f) & ((8'hba) ^ $signed($signed(reg261)))) != (&$signed(reg265))))
            begin
              reg285 <= $signed(reg268[(3'h5):(3'h4)]);
              reg286 <= wire274;
            end
          else
            begin
              reg285 <= $unsigned(reg268[(4'hd):(3'h4)]);
              reg286 <= reg282;
            end
        end
    end
  assign wire287 = $signed((reg256 ?
                       (reg284 ? reg272 : {reg270, $signed(reg250)}) : reg271));
  always
    @(posedge clk) begin
      reg288 <= reg271;
      reg289 <= ((~($signed((^reg250)) ?
          $signed({(8'hac),
              wire274}) : $signed($signed(reg255)))) | ($signed(reg280) + reg266[(1'h1):(1'h0)]));
    end
endmodule

module module202
#(parameter param235 = (8'hb1), 
parameter param236 = (-(~(~param235))))
(y, clk, wire207, wire206, wire205, wire204, wire203);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire207;
  input wire signed [(4'hc):(1'h0)] wire206;
  input wire signed [(5'h11):(1'h0)] wire205;
  input wire signed [(3'h5):(1'h0)] wire204;
  input wire signed [(3'h4):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire234;
  wire signed [(4'hb):(1'h0)] wire233;
  wire signed [(4'hc):(1'h0)] wire220;
  wire signed [(5'h10):(1'h0)] wire219;
  wire [(4'hf):(1'h0)] wire213;
  wire signed [(5'h13):(1'h0)] wire212;
  wire [(5'h11):(1'h0)] wire211;
  wire [(5'h15):(1'h0)] wire210;
  wire [(4'h9):(1'h0)] wire209;
  wire signed [(5'h15):(1'h0)] wire208;
  reg signed [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg230 = (1'h0);
  reg [(5'h10):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg228 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg226 = (1'h0);
  reg [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(3'h7):(1'h0)] reg222 = (1'h0);
  reg [(2'h2):(1'h0)] reg221 = (1'h0);
  reg [(5'h11):(1'h0)] reg218 = (1'h0);
  reg [(3'h5):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg216 = (1'h0);
  reg [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(5'h13):(1'h0)] reg214 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire220,
                 wire219,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 (1'h0)};
  assign wire208 = (({wire207, wire206} ?
                           wire204 : ((&$unsigned((8'ha7))) ?
                               wire206 : (|wire203))) ?
                       wire204 : ({wire206,
                           (wire207[(3'h5):(3'h4)] >> wire205)} - (wire203 ?
                           $signed((wire206 ?
                               wire207 : wire205)) : $signed((wire206 ^ (8'hbc))))));
  assign wire209 = $signed($signed(($unsigned($unsigned(wire206)) ?
                       ($unsigned(wire203) & $unsigned(wire208)) : {wire203,
                           $unsigned(wire204)})));
  assign wire210 = wire207;
  assign wire211 = $unsigned($signed(wire205[(1'h0):(1'h0)]));
  assign wire212 = wire209;
  assign wire213 = wire206[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg214 <= ($signed((^wire209)) < $signed(wire204));
      if ((wire208 ?
          wire205[(4'h8):(3'h6)] : {(|(reg214 ? {wire213} : (8'hb6))),
              $unsigned($unsigned((wire203 | wire208)))}))
        begin
          reg215 <= {(-(|(8'hb7)))};
        end
      else
        begin
          reg215 <= (|reg215);
        end
      reg216 <= wire211;
      reg217 <= $unsigned(wire210);
      reg218 <= (|$unsigned((8'hb6)));
    end
  assign wire219 = ({(&(wire203[(1'h1):(1'h0)] != ((8'hb1) & reg216)))} != $unsigned((8'hbb)));
  assign wire220 = $signed(reg217);
  always
    @(posedge clk) begin
      reg221 <= $signed((reg218 ? reg217[(2'h3):(2'h2)] : reg217));
      if (((wire210[(2'h3):(2'h2)] > $signed(wire220)) ?
          ($unsigned(reg218) ?
              (((wire206 ? reg217 : (8'hb6)) && $signed(reg216)) ?
                  $unsigned($signed(wire209)) : (wire209 ?
                      $unsigned((8'ha9)) : (wire208 & wire213))) : (+$signed(((8'ha1) >>> wire213)))) : (|(wire208 <<< ((wire208 ~^ (8'h9e)) <= (!reg214))))))
        begin
          reg222 <= wire208;
          reg223 <= ($unsigned($signed(wire205[(4'he):(4'hc)])) ?
              (!(+((wire212 >> reg216) > (~^wire208)))) : (wire205[(4'h9):(3'h7)] ?
                  (((~^wire206) && $unsigned((8'h9d))) ?
                      wire205 : reg214[(4'hc):(1'h0)]) : (~|((wire212 >> (8'hbd)) + wire207[(2'h2):(1'h1)]))));
          reg224 <= {(wire209[(3'h5):(2'h3)] > reg218[(3'h4):(2'h3)]),
              (($unsigned({wire220}) ?
                  wire220[(4'hc):(2'h2)] : ($signed((8'hb7)) || (wire207 ?
                      reg215 : wire207))) * reg216[(1'h0):(1'h0)])};
          reg225 <= {($signed((&$unsigned(wire203))) ?
                  wire211 : {(!(wire203 != reg215)),
                      $signed((reg221 ? reg224 : reg217))}),
              wire212[(3'h6):(1'h0)]};
        end
      else
        begin
          if (((-{(~$unsigned(wire206))}) + (!(reg222 ?
              wire207 : reg222[(1'h0):(1'h0)]))))
            begin
              reg222 <= {(!($unsigned((reg221 != (8'hab))) ?
                      (((8'haa) & (8'ha0)) >= wire220[(3'h4):(2'h2)]) : {(wire220 ?
                              reg217 : reg225),
                          (~wire206)}))};
            end
          else
            begin
              reg222 <= $signed((((wire205 ?
                  wire212 : {reg223, reg222}) == ((|wire213) != (wire207 ?
                  wire209 : wire205))) - reg221));
              reg223 <= reg215[(2'h2):(1'h0)];
              reg224 <= ($signed((((8'ha8) ~^ wire212[(3'h7):(3'h5)]) || (^$unsigned(wire205)))) ?
                  ((~($unsigned(reg214) ?
                      wire210[(2'h3):(1'h1)] : $signed(wire211))) - (^{((8'ha2) ?
                          wire210 : wire211)})) : $unsigned({(~(-wire207))}));
              reg225 <= $signed(reg225);
            end
        end
      if ((reg222 ^ (~^(&($signed(wire211) ?
          ((8'hb9) ? wire204 : wire204) : $signed(wire210))))))
        begin
          reg226 <= (-{$signed(wire219[(1'h1):(1'h1)])});
        end
      else
        begin
          if ((8'hb5))
            begin
              reg226 <= (~|{$unsigned($signed(wire209))});
              reg227 <= $signed(reg222[(3'h6):(1'h1)]);
              reg228 <= reg218[(1'h1):(1'h1)];
              reg229 <= (reg216[(1'h1):(1'h0)] ^~ $signed(($signed($unsigned(wire207)) ?
                  $unsigned($unsigned(reg217)) : wire203)));
              reg230 <= $unsigned(reg221[(2'h2):(1'h0)]);
            end
          else
            begin
              reg226 <= ($unsigned($unsigned(({(7'h41)} ?
                      $unsigned(wire212) : wire203[(2'h2):(1'h0)]))) ?
                  reg226 : $unsigned((|wire210)));
              reg227 <= reg223;
            end
          reg231 <= wire204;
          reg232 <= ($signed({wire207[(4'h8):(3'h4)],
              $unsigned((reg231 ?
                  reg215 : reg231))}) << ((reg227[(3'h4):(3'h4)] <<< {$unsigned((7'h42))}) || $unsigned(($unsigned(wire210) ?
              $signed(reg230) : (~&reg222)))));
        end
    end
  assign wire233 = reg218[(2'h3):(1'h0)];
  assign wire234 = $unsigned((($unsigned((-reg226)) || wire210) ?
                       $unsigned((^reg228[(4'hf):(3'h6)])) : $signed((8'hae))));
endmodule

module module161  (y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire165;
  input wire [(5'h13):(1'h0)] wire164;
  input wire signed [(5'h15):(1'h0)] wire163;
  input wire signed [(3'h7):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire199;
  wire signed [(5'h15):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(5'h15):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire166;
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg [(3'h7):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h15):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire181,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
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
                 reg167,
                 (1'h0)};
  assign wire166 = $signed(($signed($signed((wire162 < wire165))) ?
                       wire164 : (|(8'hbb))));
  always
    @(posedge clk) begin
      reg167 <= wire164[(1'h1):(1'h0)];
    end
  assign wire168 = ({(~((wire165 ? reg167 : (8'hbf)) ?
                           ((8'hbe) ? wire162 : wire164) : (7'h41))),
                       $unsigned(((reg167 != wire162) >> (-reg167)))} != $signed(({$unsigned(reg167)} ?
                       $unsigned($signed(wire163)) : $signed((wire166 ?
                           (8'hbe) : wire162)))));
  assign wire169 = (^(~^wire166[(4'hc):(3'h5)]));
  assign wire170 = wire163;
  assign wire171 = wire166[(1'h1):(1'h0)];
  assign wire172 = {{$signed($unsigned($unsigned(wire164))), wire171}};
  assign wire173 = reg167;
  assign wire174 = $unsigned(($signed(wire166[(4'hd):(3'h7)]) <<< reg167[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg175 <= ((({(!wire172),
              $signed(wire169)} << (wire168[(2'h2):(2'h2)] < wire166)) ?
          $unsigned($unsigned(wire163)) : wire166) <<< (+({wire172[(1'h1):(1'h0)],
          wire172} < wire170)));
      if ((wire170[(3'h4):(3'h4)] ?
          (+(($signed(wire163) ?
              (wire171 & wire173) : $signed(wire170)) & wire164)) : wire170))
        begin
          reg176 <= (^~(~^{wire171[(3'h6):(3'h5)],
              $signed((wire169 + wire162))}));
          reg177 <= wire166[(3'h5):(3'h4)];
          reg178 <= $signed((((~^wire168[(2'h3):(1'h0)]) * $signed($unsigned(wire168))) ?
              ($unsigned(wire162) ? (~|$signed(reg176)) : wire166) : wire170));
          reg179 <= $signed(wire166);
          reg180 <= ((-$signed({(wire168 ? (7'h41) : wire164)})) ?
              (~(&wire166)) : {(((reg176 ?
                      reg175 : wire171) == $unsigned(wire170)) || ((8'ha3) ?
                      reg176[(5'h12):(4'ha)] : $signed(reg167))),
                  wire170[(1'h1):(1'h0)]});
        end
      else
        begin
          reg176 <= $unsigned(($signed((reg175 ?
                  (wire166 <= reg180) : reg177[(3'h5):(1'h1)])) ?
              $signed($signed($unsigned((8'hbb)))) : (^(wire171[(4'h8):(3'h6)] ?
                  ((8'hb1) + (8'ha8)) : wire164[(5'h10):(1'h0)]))));
        end
    end
  assign wire181 = reg167;
  always
    @(posedge clk) begin
      reg182 <= {(+(~^wire169[(5'h13):(1'h0)])),
          (&($signed((wire169 + reg177)) ?
              ($signed(wire163) & $signed(wire172)) : $signed((wire171 <= reg180))))};
      if ((^$unsigned(reg180[(2'h3):(1'h1)])))
        begin
          reg183 <= (($signed((8'ha0)) > (^(^~reg179))) >>> (reg180[(1'h1):(1'h1)] ?
              ((~wire174) >= reg179[(2'h2):(1'h0)]) : (|($unsigned(wire168) ?
                  (wire172 | reg175) : $unsigned(wire181)))));
          if ($signed({(8'ha7),
              $signed({wire163[(5'h10):(4'hc)], (reg179 ? (7'h44) : reg178)})}))
            begin
              reg184 <= $unsigned(wire169);
              reg185 <= {$signed(($signed((wire173 ?
                      reg183 : wire165)) >> wire168[(2'h3):(2'h2)])),
                  ($unsigned($unsigned((wire168 ? wire174 : wire171))) ?
                      wire174 : $signed(($signed((8'ha6)) > (wire174 ?
                          (8'hae) : (8'ha8)))))};
              reg186 <= (($unsigned(reg180) ?
                  wire166 : ($signed(reg167) < (!wire164[(2'h3):(2'h3)]))) * $unsigned(wire170[(3'h7):(3'h4)]));
            end
          else
            begin
              reg184 <= $signed($signed((($signed(wire174) <<< (reg167 >= reg184)) ?
                  (wire173 >>> reg177[(4'hb):(4'hb)]) : ((wire181 >= wire163) ?
                      (wire164 ? reg184 : (8'hb3)) : (^reg177)))));
              reg185 <= reg182;
              reg186 <= (~&reg175[(3'h7):(3'h7)]);
            end
        end
      else
        begin
          if ($signed(wire181))
            begin
              reg183 <= ((reg178[(3'h5):(3'h5)] ?
                      (~^((reg177 <= reg183) ?
                          {wire174, (8'haa)} : reg179)) : ($unsigned((wire170 ?
                          wire181 : reg180)) < (8'hb3))) ?
                  $signed(((&reg180[(2'h3):(1'h1)]) & (wire165 ^ reg179))) : (wire164[(5'h10):(4'he)] ?
                      $signed((^~$unsigned(wire165))) : wire172));
              reg184 <= $signed((~&$unsigned($unsigned((|reg184)))));
            end
          else
            begin
              reg183 <= reg179[(1'h1):(1'h0)];
              reg184 <= reg179;
              reg185 <= (+$unsigned(reg183));
              reg186 <= ((^~(((wire168 ? reg179 : reg178) ?
                      (reg178 ?
                          reg176 : reg175) : reg179[(2'h2):(1'h0)]) & $signed((7'h42)))) ?
                  wire162 : $signed({$signed((&reg182)),
                      ((~|(8'hbb)) ?
                          wire163[(3'h7):(3'h7)] : wire173[(5'h14):(4'hd)])}));
            end
          if (((+$signed((~|$signed(reg167)))) ?
              $unsigned($signed(((wire164 ? reg178 : reg178) ~^ {wire163,
                  reg182}))) : reg175[(1'h0):(1'h0)]))
            begin
              reg187 <= ((^reg182[(3'h7):(3'h5)]) <= (&(^(reg177 - {wire170,
                  wire181}))));
              reg188 <= wire172;
              reg189 <= (~reg188);
              reg190 <= $unsigned(reg189);
              reg191 <= $unsigned($unsigned(((!{wire171,
                  (8'ha6)}) >>> {$signed((8'hab)), {wire169}})));
            end
          else
            begin
              reg187 <= (!((($signed((8'haa)) ?
                      (wire173 ? (8'hb4) : wire169) : $signed(wire162)) ?
                  $unsigned((|wire174)) : {(wire168 ?
                          (8'hbc) : wire162)}) + wire173));
              reg188 <= (7'h40);
              reg189 <= (^~reg184[(4'h8):(3'h4)]);
              reg190 <= {(&(^~(~&wire166)))};
              reg191 <= reg183[(4'h9):(1'h0)];
            end
          reg192 <= reg182[(4'h9):(3'h5)];
          reg193 <= ($unsigned((|$signed(reg185[(4'ha):(3'h5)]))) ?
              $unsigned(wire164[(4'hd):(3'h6)]) : $signed($signed(reg183)));
          reg194 <= ((~&((-$unsigned(wire163)) <<< ((wire164 != (8'ha5)) ?
              reg183[(5'h13):(4'h9)] : reg193))) * $signed($signed(($signed(reg190) ?
              reg178 : $signed(reg190)))));
        end
      reg195 <= $signed($signed(wire170));
      reg196 <= reg179[(2'h3):(1'h1)];
    end
  assign wire197 = (reg177[(4'h8):(2'h3)] | $unsigned((8'hb7)));
  assign wire198 = $signed(reg178[(5'h11):(4'hb)]);
  assign wire199 = reg167;
endmodule
