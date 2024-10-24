module top
#(parameter param223 = (!(8'ha3)), 
parameter param224 = (param223 ? (8'ha3) : (^((((8'hbd) >> param223) <<< (~(8'hbd))) & (param223 ? (param223 * (8'hae)) : {param223, param223})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire221;
  wire signed [(4'hd):(1'h0)] wire220;
  wire signed [(2'h2):(1'h0)] wire219;
  wire signed [(2'h2):(1'h0)] wire218;
  wire signed [(4'hc):(1'h0)] wire217;
  wire signed [(4'hb):(1'h0)] wire216;
  wire [(4'hf):(1'h0)] wire215;
  wire signed [(4'hc):(1'h0)] wire214;
  wire [(4'ha):(1'h0)] wire213;
  wire [(2'h2):(1'h0)] wire212;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire210;
  reg signed [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire5,
                 wire6,
                 wire15,
                 wire16,
                 wire18,
                 wire19,
                 wire139,
                 wire158,
                 wire210,
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
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {{$unsigned((wire1[(1'h1):(1'h0)] ?
                             $signed(wire2) : {wire0, wire0}))},
                     wire2};
  assign wire6 = (wire0[(5'h15):(2'h2)] ?
                     ({(~(|wire2)), wire3[(3'h4):(1'h0)]} ?
                         (~&$signed(wire3[(1'h1):(1'h1)])) : ($unsigned((wire2 > wire0)) ?
                             wire4 : ({(8'hb3)} ^~ (wire0 ?
                                 wire1 : wire2)))) : wire1[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      if (((wire5[(1'h1):(1'h1)] * (wire6 ?
          ($unsigned((8'ha9)) ?
              $unsigned(wire0) : {wire4,
                  wire0}) : $unsigned(wire0[(5'h10):(4'ha)]))) + ($signed(wire2) & $unsigned(wire0))))
        begin
          reg7 <= $unsigned(wire6);
          reg8 <= (&$unsigned((wire3[(3'h5):(1'h1)] >= wire5[(1'h1):(1'h1)])));
          if ($signed((wire5 ?
              {(~$unsigned(wire2))} : ({$unsigned(wire5)} ?
                  $signed(wire6[(1'h1):(1'h1)]) : (~&wire5[(1'h0):(1'h0)])))))
            begin
              reg9 <= $signed(($unsigned(wire1[(2'h2):(2'h2)]) ?
                  $signed(($signed(wire1) & {wire5,
                      reg7})) : wire1[(2'h2):(1'h1)]));
            end
          else
            begin
              reg9 <= (~^$signed(wire1[(2'h3):(1'h0)]));
              reg10 <= wire2[(5'h10):(4'ha)];
              reg11 <= (~&$unsigned(($unsigned(reg9) ?
                  ($signed(wire5) - (wire6 - wire2)) : (reg10[(2'h3):(2'h3)] ?
                      reg10[(2'h2):(2'h2)] : $unsigned((8'hbc))))));
            end
          reg12 <= ({$signed(reg7)} ?
              reg7 : $unsigned($signed(wire4[(3'h7):(1'h0)])));
        end
      else
        begin
          if (wire6[(3'h5):(2'h2)])
            begin
              reg7 <= (($unsigned($unsigned((reg9 >= wire5))) ?
                  (-{(!wire5)}) : $signed(wire1)) | $unsigned({$unsigned((^reg11))}));
            end
          else
            begin
              reg7 <= (|{(wire2 && (|reg10[(2'h2):(1'h1)])),
                  (~|(wire2[(4'h9):(4'h9)] << (reg9 <<< (8'ha6))))});
              reg8 <= (!(~&reg9[(4'h8):(3'h4)]));
            end
          if ((|reg10))
            begin
              reg9 <= $unsigned($unsigned({((wire2 == wire6) ~^ reg9[(3'h5):(2'h2)]),
                  $signed((wire3 ? reg11 : wire6))}));
              reg10 <= {wire6};
              reg11 <= $unsigned((~|reg8[(2'h3):(1'h1)]));
              reg12 <= (reg11[(4'hd):(4'hd)] >= wire5[(1'h0):(1'h0)]);
              reg13 <= ((+{($unsigned((8'hb8)) ? (-reg7) : (reg10 != wire2)),
                      wire5[(2'h2):(1'h0)]}) ?
                  reg9 : wire2);
            end
          else
            begin
              reg9 <= reg13[(4'h8):(2'h2)];
            end
        end
      reg14 <= reg7;
    end
  assign wire15 = $signed(wire3);
  assign wire16 = $unsigned(($unsigned(wire5) ?
                      (~^wire2[(5'h13):(5'h10)]) : $unsigned($unsigned({wire5}))));
  always
    @(posedge clk) begin
      reg17 <= (~&({$signed({reg11, reg9})} ?
          (wire1 < ((wire16 ?
              (8'ha6) : wire1) == (-reg12))) : $signed((reg12 && (reg10 ?
              reg14 : wire2)))));
    end
  assign wire18 = {$unsigned((reg7 ?
                          (^(wire3 ? wire16 : reg12)) : {(wire16 ?
                                  reg17 : reg12),
                              {wire4}})),
                      reg10[(1'h0):(1'h0)]};
  assign wire19 = (|(-({$unsigned((8'hba))} & $signed((|wire2)))));
  module20 #() modinst140 (wire139, clk, reg14, wire5, reg12, wire6);
  always
    @(posedge clk) begin
      reg141 <= $signed($unsigned((8'h9c)));
      reg142 <= wire19[(1'h1):(1'h0)];
      reg143 <= ($unsigned($unsigned($signed($unsigned(reg12)))) ?
          $signed({$signed(((8'haa) ? wire15 : reg9)),
              wire139}) : $unsigned(wire0));
      if ((+$unsigned((((7'h41) > $signed(wire18)) ~^ (((8'ha4) ?
              reg9 : wire19) ?
          (reg9 ^ wire3) : $unsigned(reg143))))))
        begin
          if ($unsigned((!(reg17[(1'h0):(1'h0)] ^~ (~|(wire1 ? reg7 : reg7))))))
            begin
              reg144 <= (8'ha7);
              reg145 <= $signed(wire16[(4'hc):(4'h9)]);
              reg146 <= $signed(reg7[(1'h1):(1'h1)]);
            end
          else
            begin
              reg144 <= (+$unsigned((&(((8'h9f) ?
                  wire16 : (8'h9e)) ~^ (^~(8'ha8))))));
              reg145 <= ((+wire4) ^~ $unsigned(wire18));
              reg146 <= $unsigned((^~$unsigned(((|wire139) <= {reg13, reg9}))));
              reg147 <= ((wire18 ?
                      $signed(reg146) : $unsigned($unsigned(wire139[(2'h2):(2'h2)]))) ?
                  wire3[(4'hc):(1'h0)] : reg7);
            end
          if (({(((reg13 ? reg12 : reg143) ? ((7'h42) - wire15) : {(8'hb3)}) ?
                  ($signed(reg11) == (wire139 ?
                      wire15 : wire16)) : (+$unsigned(reg9)))} ^ ($unsigned((wire18[(2'h2):(1'h0)] + {reg9})) ?
              reg144[(1'h0):(1'h0)] : (({reg146} ?
                  (-wire139) : $unsigned(wire0)) >> ((reg11 && wire4) ?
                  wire4 : (^~(7'h43)))))))
            begin
              reg148 <= $unsigned(((~|(reg10 ? {wire1} : $unsigned((8'hb9)))) ?
                  $signed(($unsigned(reg8) > wire3[(4'h8):(3'h5)])) : (^$signed(reg141))));
              reg149 <= wire0;
              reg150 <= ($unsigned((({reg149, wire6} << {(8'hbf), wire15}) ?
                  (reg143 ?
                      (!wire139) : $signed(reg7)) : reg144[(4'hf):(4'ha)])) << ({((wire0 ?
                      (8'hb9) : wire139) >> (reg148 >> reg148))} ^ (!(((7'h41) ?
                      wire3 : reg143) ?
                  (wire1 ? wire5 : wire4) : reg17))));
              reg151 <= ($signed(($unsigned((|reg149)) ?
                  (reg150 ?
                      (8'ha7) : wire3[(4'h8):(1'h0)]) : (^$signed(wire139)))) ^ wire1[(3'h6):(1'h0)]);
              reg152 <= {{reg146, wire2}, wire5};
            end
          else
            begin
              reg148 <= ((reg11 ?
                  ($unsigned((wire0 ?
                      reg13 : reg146)) == (reg145[(2'h3):(2'h2)] ?
                      {wire18} : reg143[(4'ha):(3'h5)])) : {wire1[(1'h1):(1'h0)],
                      ((wire2 + reg152) >> reg150[(4'h8):(4'h8)])}) ~^ wire18[(4'h8):(3'h4)]);
            end
          if (wire139)
            begin
              reg153 <= reg152[(2'h2):(1'h1)];
              reg154 <= (~|wire139);
              reg155 <= ((~^(|$signed(wire15))) ?
                  (reg152 ?
                      $unsigned(reg151[(2'h2):(1'h1)]) : $signed((reg12 ?
                          $signed(reg146) : (reg145 << reg153)))) : ($unsigned($signed(wire5)) ?
                      $unsigned(($unsigned(reg152) - wire3[(3'h5):(1'h0)])) : (($unsigned(wire18) - (+reg12)) <= wire4[(3'h6):(2'h2)])));
            end
          else
            begin
              reg153 <= reg12;
            end
          reg156 <= (&($signed({$unsigned(reg146),
              $signed(reg11)}) ~^ ((8'ha1) & reg145)));
          reg157 <= ((~|reg7) != {reg7});
        end
      else
        begin
          reg144 <= wire1[(2'h2):(1'h0)];
          reg145 <= ({($signed((reg147 ? reg145 : (8'hbc))) ?
                      {reg145[(3'h5):(3'h5)], (reg12 == wire1)} : reg7),
                  (8'ha0)} ?
              reg141[(3'h4):(1'h1)] : (^wire16[(4'hb):(2'h2)]));
          reg146 <= ($unsigned({($signed(wire1) ^~ $unsigned(reg146))}) || $unsigned(reg9));
        end
    end
  assign wire158 = wire139[(2'h2):(1'h1)];
  module159 #() modinst211 (wire210, clk, reg11, wire16, wire3, wire2);
  assign wire212 = wire139;
  assign wire213 = $signed($unsigned(((|$signed(wire158)) <<< reg10[(1'h0):(1'h0)])));
  assign wire214 = {$signed($signed(reg17)), $unsigned((|(&{wire15})))};
  assign wire215 = wire4[(3'h5):(2'h3)];
  assign wire216 = (~^wire19[(4'h8):(2'h3)]);
  assign wire217 = (reg9 ?
                       (|$signed((8'hac))) : $unsigned($unsigned(reg142[(3'h7):(1'h0)])));
  assign wire218 = wire213[(4'ha):(1'h0)];
  assign wire219 = ((reg11[(4'hf):(2'h3)] ^~ reg10) ?
                       (reg155[(4'he):(3'h5)] * wire217) : {$unsigned($unsigned($unsigned(reg147))),
                           reg153[(1'h1):(1'h1)]});
  assign wire220 = $unsigned(wire219);
  module99 #() modinst222 (.y(wire221), .wire102(reg145), .wire103(reg9), .clk(clk), .wire101(reg7), .wire104(wire19), .wire100(wire15));
endmodule

module module159
#(parameter param208 = {{(~(~|((8'had) ? (8'hbf) : (8'ha7))))}, ((((+(8'hb9)) >= ((8'h9e) ? (8'ha6) : (8'hbe))) <<< (^~((8'hab) ? (8'hb4) : (8'hab)))) >> {((~^(8'had)) ? ((8'ha8) + (8'hb8)) : {(8'haf), (8'hb4)})})}, 
parameter param209 = (!((((param208 <= param208) < (~^param208)) | (^~(8'hbe))) ? (param208 != (~(+param208))) : (!param208))))
(y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire163;
  input wire [(4'hd):(1'h0)] wire162;
  input wire signed [(3'h4):(1'h0)] wire161;
  input wire signed [(5'h10):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire207;
  wire [(5'h13):(1'h0)] wire206;
  wire [(4'hd):(1'h0)] wire205;
  wire signed [(4'hb):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire203;
  wire signed [(5'h11):(1'h0)] wire202;
  wire signed [(3'h6):(1'h0)] wire200;
  wire [(4'hb):(1'h0)] wire164;
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire200,
                 wire164,
                 (1'h0)};
  assign wire164 = (~|wire161);
  module165 #() modinst201 (.wire169(wire160), .clk(clk), .y(wire200), .wire168(wire164), .wire166(wire163), .wire167(wire162));
  assign wire202 = {wire162[(3'h4):(2'h2)]};
  assign wire203 = wire164;
  assign wire204 = ((($unsigned($unsigned(wire200)) - ((wire202 >= wire202) <<< wire161)) ?
                       (wire161[(2'h3):(2'h2)] ^~ wire164) : {$signed((~wire203)),
                           (~&wire202[(4'he):(3'h6)])}) & wire163[(3'h6):(1'h0)]);
  assign wire205 = $signed((~^(wire203[(1'h0):(1'h0)] ?
                       $unsigned($signed(wire161)) : wire161)));
  assign wire206 = $unsigned(wire161[(1'h1):(1'h1)]);
  assign wire207 = ($signed({{wire205}, {wire205[(4'hd):(3'h4)]}}) ?
                       $unsigned((~&$signed(wire204[(1'h0):(1'h0)]))) : ({{(wire164 ?
                                       wire204 : (8'h9f)),
                                   (wire162 ? (8'hab) : wire163)}} ?
                           ((wire161 >= (wire164 ? wire206 : wire160)) ?
                               ($signed(wire204) & (~^wire204)) : ($signed(wire203) ?
                                   wire160[(3'h7):(2'h3)] : $unsigned(wire205))) : (-$unsigned((8'hb8)))));
endmodule

module module20
#(parameter param137 = (((((|(8'ha6)) + (~|(8'haa))) && {((8'hba) <= (8'hac))}) * ((~|((8'hb2) == (8'hb7))) <<< (^(~(8'ha5))))) * (~^{({(8'h9e), (8'hb8)} - ((8'hbd) ^ (8'hb1)))})), 
parameter param138 = (^~(param137 ? (~|((param137 << param137) ? param137 : (param137 ^ param137))) : (&({param137} >> {param137, param137})))))
(y, clk, wire21, wire22, wire23, wire24);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire75;
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire125,
                 wire123,
                 wire98,
                 wire95,
                 wire81,
                 wire80,
                 wire79,
                 wire25,
                 wire26,
                 wire75,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg77,
                 reg78,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg96,
                 reg97,
                 (1'h0)};
  assign wire25 = wire23[(2'h3):(2'h2)];
  assign wire26 = $signed((~&wire22[(3'h4):(3'h4)]));
  module27 #() modinst76 (.wire28(wire21), .y(wire75), .wire32(wire22), .clk(clk), .wire29(wire26), .wire30(wire25), .wire31(wire24));
  always
    @(posedge clk) begin
      reg77 <= wire75;
      reg78 <= $unsigned(($signed(((wire25 - wire24) ?
              (wire21 <= wire24) : $signed(reg77))) ?
          (~|{(!wire22)}) : reg77[(1'h0):(1'h0)]));
    end
  assign wire79 = ($unsigned((wire26[(3'h6):(2'h2)] ?
                      $signed(wire24) : $unsigned($signed(wire21)))) <= wire21);
  assign wire80 = $unsigned(($signed(((wire21 ?
                          wire25 : reg78) != $signed(wire23))) ?
                      (wire79[(4'h8):(2'h3)] ?
                          reg78 : ((~(8'hae)) ^~ {(8'ha8),
                              wire75})) : wire79[(3'h6):(1'h0)]));
  assign wire81 = ($signed(((~wire24) ? wire23 : reg78[(3'h7):(1'h1)])) ?
                      $unsigned(wire21) : ($unsigned(reg78[(5'h11):(2'h2)]) ?
                          reg77 : (8'h9e)));
  always
    @(posedge clk) begin
      if ($signed((((~$signed(wire22)) << wire26) ?
          wire80[(2'h2):(1'h1)] : reg78)))
        begin
          if ({wire23})
            begin
              reg82 <= wire24[(1'h0):(1'h0)];
              reg83 <= (~^{$signed((+$signed((7'h44))))});
              reg84 <= $signed(wire81[(4'h8):(3'h6)]);
              reg85 <= $unsigned(($signed(((reg78 ? wire80 : (8'hb9)) ?
                  reg84 : (8'ha6))) < {((wire75 - wire26) ?
                      reg77 : $unsigned(wire79)),
                  $signed(wire79)}));
              reg86 <= $signed($signed(reg84[(5'h11):(4'ha)]));
            end
          else
            begin
              reg82 <= (-(reg85 * $signed({$unsigned(reg82)})));
              reg83 <= (wire23 ^ {($signed((8'ha9)) == $signed($unsigned(reg85)))});
            end
          reg87 <= wire25[(4'he):(4'h9)];
          reg88 <= (&{reg78[(1'h1):(1'h1)]});
        end
      else
        begin
          if (($signed({((wire23 - reg78) < (wire80 * reg78))}) << {(^~($unsigned(reg78) ?
                  $signed((8'hbc)) : (wire24 ? wire80 : reg83))),
              $signed((wire81 ? reg85[(2'h2):(1'h1)] : (-(8'haa))))}))
            begin
              reg82 <= reg88;
            end
          else
            begin
              reg82 <= {{($unsigned(reg85[(3'h5):(1'h0)]) ?
                          ((^reg86) ?
                              (reg78 ?
                                  reg82 : reg84) : {reg77}) : ($signed(reg87) ?
                              $signed(wire26) : wire21[(4'hd):(1'h0)])),
                      wire25},
                  $unsigned((~^(|(^wire22))))};
              reg83 <= {(~|($unsigned((reg85 ? (8'hbc) : wire25)) ?
                      $unsigned({wire21}) : ((7'h43) ?
                          wire24 : reg82[(3'h7):(1'h0)]))),
                  wire24};
              reg84 <= wire21[(4'hd):(3'h4)];
            end
          reg85 <= reg84[(4'hb):(3'h6)];
          reg86 <= ($signed($signed((8'ha7))) && (wire26 <<< {((reg87 <<< (8'hbb)) ?
                  $signed(wire80) : $unsigned(wire75))}));
          reg87 <= $unsigned(reg87);
          if ($signed($unsigned($unsigned(reg77))))
            begin
              reg88 <= $signed(wire22[(4'hc):(4'hb)]);
              reg89 <= $unsigned($signed(((reg85 ?
                  {(8'hac)} : reg86) + $unsigned((8'hb1)))));
              reg90 <= {wire25};
            end
          else
            begin
              reg88 <= $signed(reg82);
              reg89 <= $signed(reg89);
              reg90 <= $unsigned((+reg78[(1'h1):(1'h0)]));
            end
        end
      reg91 <= (&((^(wire81[(3'h5):(1'h1)] ?
              $signed((8'ha6)) : $unsigned(reg78))) ?
          {($signed(wire75) ? {reg84} : {wire22})} : wire25));
      reg92 <= (+(reg87[(2'h2):(1'h1)] && (-(~^(wire21 ? wire21 : (7'h40))))));
      reg93 <= (+$unsigned(reg85[(1'h1):(1'h1)]));
      reg94 <= reg84;
    end
  assign wire95 = reg92;
  always
    @(posedge clk) begin
      reg96 <= {(reg78 > wire79[(4'h9):(3'h7)]),
          {$unsigned(($unsigned(wire79) ^ (8'hb8)))}};
      reg97 <= $signed($signed(reg85[(1'h1):(1'h0)]));
    end
  assign wire98 = (~|(reg92 + ((~reg77) ?
                      (wire75 ?
                          $signed(reg87) : ((8'ha6) ?
                              reg82 : wire75)) : wire23)));
  module99 #() modinst124 (.wire103(reg84), .wire100(reg88), .clk(clk), .wire102(reg92), .wire104(reg78), .wire101(reg97), .y(wire123));
  assign wire125 = wire95;
  always
    @(posedge clk) begin
      reg126 <= $signed($signed(reg78[(3'h6):(3'h4)]));
      reg127 <= reg91[(3'h5):(2'h2)];
      reg128 <= wire125[(1'h0):(1'h0)];
      reg129 <= {(wire26[(3'h6):(2'h2)] ?
              reg83[(5'h10):(4'hd)] : ((~{(8'hb4)}) ?
                  {(wire22 ? (8'hbe) : reg92), (8'hb8)} : $unsigned({wire81}))),
          ($signed(reg87[(3'h4):(1'h1)]) - $signed($unsigned(wire79[(1'h1):(1'h0)])))};
      reg130 <= (reg96 ?
          {{((wire24 & wire81) > $signed(reg94))},
              wire25[(5'h13):(4'hc)]} : ((wire25 <<< (8'h9d)) > $unsigned($unsigned($signed((8'h9f))))));
    end
  always
    @(posedge clk) begin
      reg131 <= $unsigned((((reg128 ?
              {(8'h9c)} : reg83) == (^~$unsigned((8'hb3)))) ?
          $unsigned($signed(((8'hb8) ? reg90 : reg77))) : (&(~&(reg127 ?
              reg86 : reg94)))));
      if ($signed(reg88))
        begin
          reg132 <= wire81[(4'hb):(3'h4)];
        end
      else
        begin
          reg132 <= (8'hb8);
        end
    end
  assign wire133 = (~^wire21);
  assign wire134 = (~wire79);
  assign wire135 = ($unsigned($signed($signed((~(8'ha4))))) ?
                       ($signed(($unsigned(reg87) ?
                               $signed(wire133) : $signed(reg77))) ?
                           reg130 : ($signed((~reg130)) <<< $signed((~|reg128)))) : ((($signed(reg130) != {reg90,
                           reg129}) * wire79) * $signed({(-wire98),
                           (wire81 ? reg77 : wire75)})));
  assign wire136 = $unsigned(({((wire134 >> wire134) ?
                               (reg83 ^~ reg83) : (wire75 || wire80))} ?
                       wire24 : reg86[(2'h2):(1'h1)]));
endmodule

module module99
#(parameter param122 = {(&((((8'hac) ? (8'ha1) : (8'hab)) <= ((8'hb3) && (8'hbd))) >> ((&(8'hb5)) >= (|(8'ha1))))), {{(~(!(8'hbe)))}}})
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire104;
  input wire signed [(3'h6):(1'h0)] wire103;
  input wire [(3'h7):(1'h0)] wire102;
  input wire [(3'h6):(1'h0)] wire101;
  input wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire113,
                 wire112,
                 wire111,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire105 = $signed(wire102[(2'h2):(2'h2)]);
  assign wire106 = $unsigned((!wire104[(1'h0):(1'h0)]));
  assign wire107 = wire100;
  assign wire108 = $unsigned($unsigned($unsigned($unsigned($signed(wire106)))));
  always
    @(posedge clk) begin
      reg109 <= $unsigned(($unsigned(wire104) & $unsigned($signed($signed((8'h9e))))));
      reg110 <= (8'h9c);
    end
  assign wire111 = reg109[(4'h9):(3'h6)];
  assign wire112 = $signed((wire106[(1'h0):(1'h0)] * $signed(wire106[(1'h0):(1'h0)])));
  assign wire113 = $unsigned(({(^~(-reg110)),
                           ($unsigned(wire101) ?
                               $unsigned(wire111) : ((8'hbc) ?
                                   wire108 : wire112))} ?
                       (!(!{wire105})) : reg110[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg114 <= {$unsigned((wire108 ^~ ((reg109 ?
              (8'hbd) : wire101) | (-wire101))))};
      reg115 <= wire105[(4'h8):(1'h1)];
      if ({{(~^reg114[(5'h12):(4'hf)])}})
        begin
          reg116 <= wire108;
          reg117 <= wire101[(3'h6):(2'h3)];
          reg118 <= reg114[(5'h10):(4'ha)];
        end
      else
        begin
          reg116 <= $signed((^~($unsigned((&wire104)) ?
              $signed((~&wire105)) : wire107)));
          reg117 <= (wire108[(4'hd):(4'ha)] ^~ $unsigned((wire106[(4'h8):(3'h6)] >>> ((wire105 ?
                  reg116 : wire104) ?
              (wire100 ? wire111 : (8'hb0)) : $signed(wire102)))));
          reg118 <= wire100;
        end
      reg119 <= $signed($signed($unsigned($unsigned((reg117 ?
          wire100 : (8'h9e))))));
    end
  assign wire120 = (7'h41);
  assign wire121 = (8'ha0);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire63,
                 wire62,
                 wire57,
                 wire56,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 (1'h0)};
  assign wire33 = {$signed(wire30[(2'h3):(1'h0)]), wire28[(3'h4):(1'h1)]};
  assign wire34 = (&(~$unsigned($unsigned(wire31[(3'h4):(2'h2)]))));
  assign wire35 = (^~wire31);
  assign wire36 = $signed((8'hab));
  assign wire37 = wire31[(3'h7):(1'h1)];
  assign wire38 = wire34[(3'h6):(2'h2)];
  assign wire39 = wire30;
  assign wire40 = wire30;
  always
    @(posedge clk) begin
      if ($signed(wire39))
        begin
          reg41 <= ({{((wire40 - wire29) ?
                      (wire37 + wire35) : wire36[(1'h0):(1'h0)])}} & $unsigned((7'h40)));
          reg42 <= $unsigned($signed((($unsigned((8'hb8)) ?
              ((8'hbb) >> (8'ha1)) : $signed(wire30)) && $unsigned(((8'had) ?
              wire35 : wire30)))));
        end
      else
        begin
          reg41 <= wire38;
          reg42 <= {$unsigned($unsigned(wire34[(2'h2):(2'h2)])),
              (~({(wire37 ? wire39 : wire39)} << reg41[(4'hd):(1'h0)]))};
        end
      if ($unsigned((!{((wire37 ~^ wire37) >= {wire29}), {{wire40}}})))
        begin
          if ($unsigned($signed($signed((-(7'h42))))))
            begin
              reg43 <= (!wire35);
              reg44 <= (+(^(8'hab)));
              reg45 <= $unsigned({(reg44[(1'h0):(1'h0)] ?
                      wire37 : ((^reg44) ?
                          $signed((8'hbb)) : $signed((8'ha2))))});
              reg46 <= ($unsigned($unsigned($signed((reg45 ?
                  wire35 : wire37)))) && wire31[(4'h8):(4'h8)]);
            end
          else
            begin
              reg43 <= reg41[(2'h3):(1'h1)];
              reg44 <= wire32;
              reg45 <= {{$unsigned(((&wire38) ? {reg45, wire31} : reg41))}};
            end
          reg47 <= (~|{(reg43[(2'h2):(1'h0)] << (wire36[(1'h1):(1'h1)] < wire36[(1'h0):(1'h0)])),
              $unsigned(wire31[(3'h6):(2'h2)])});
          reg48 <= $signed((wire36[(1'h0):(1'h0)] ?
              ((^~(-reg43)) ?
                  reg47 : ($signed(wire31) ?
                      reg47 : {wire36, wire30})) : {(reg47[(2'h3):(1'h1)] ?
                      (wire37 ? reg43 : wire28) : (-reg43))}));
          reg49 <= reg41;
          reg50 <= $signed({$unsigned($signed({(8'hbc)})),
              (^reg47[(2'h3):(1'h1)])});
        end
      else
        begin
          reg43 <= (((-(|reg48[(2'h3):(2'h2)])) ?
              $signed((~^(reg45 ? wire36 : wire33))) : (reg46 ?
                  reg47[(3'h5):(3'h4)] : {(reg41 << wire36)})) ~^ {$unsigned(((reg41 | wire32) >>> $signed(wire30)))});
        end
      if (($signed((|$unsigned($signed(reg41)))) ?
          ($unsigned(($unsigned(reg44) ~^ $signed(wire37))) ?
              {wire33} : $signed((wire30[(2'h3):(1'h1)] >>> $signed(wire28)))) : (($signed($signed(reg44)) ?
              wire39[(1'h1):(1'h1)] : reg49[(1'h1):(1'h1)]) <= (~wire39))))
        begin
          reg51 <= $unsigned((($unsigned((8'haf)) ?
              wire38[(3'h5):(1'h0)] : ($signed(wire34) ?
                  (!(8'hb6)) : $signed((8'ha3)))) ^ $unsigned($unsigned(wire28[(3'h7):(1'h1)]))));
          if (wire36)
            begin
              reg52 <= (&(~&$signed((reg48[(1'h0):(1'h0)] * (+wire32)))));
              reg53 <= (-$unsigned($signed(($signed(wire33) <<< reg43))));
              reg54 <= reg41[(3'h6):(2'h2)];
            end
          else
            begin
              reg52 <= (((|wire30) ?
                  $unsigned({$signed((8'haf)),
                      wire30[(1'h1):(1'h1)]}) : ($signed(wire35) && $signed({reg42,
                      wire36}))) << ((wire31[(3'h6):(1'h1)] ?
                      $signed(reg53) : ((~|reg46) ?
                          (reg52 & (8'ha5)) : {wire33, reg51})) ?
                  (~(wire40 ? $signed(reg44) : (~reg50))) : {({(8'haa), reg41} ?
                          {reg46, wire38} : wire37[(3'h4):(3'h4)])}));
              reg53 <= ((((~&$unsigned((8'hb6))) ~^ wire38[(1'h0):(1'h0)]) ?
                  (~^$signed($signed(reg53))) : $signed(({reg46, wire30} ?
                      reg43[(3'h7):(3'h5)] : (~^wire31)))) <<< {{reg52,
                      $unsigned($unsigned((8'hae)))}});
              reg54 <= wire29[(2'h2):(2'h2)];
            end
          reg55 <= (~^$unsigned((8'ha8)));
        end
      else
        begin
          reg51 <= (({$unsigned(reg46), wire28[(4'h8):(2'h3)]} ?
              $signed(wire29) : $unsigned($signed($unsigned(wire38)))) * (7'h44));
          reg52 <= $signed($signed(($signed((reg50 && wire33)) | ((wire34 < reg43) >> {reg42}))));
        end
    end
  assign wire56 = $unsigned(reg50[(5'h11):(4'hb)]);
  assign wire57 = wire31[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg58 <= reg52;
      reg59 <= $unsigned((~^{$signed({reg55, reg44}), reg43}));
      reg60 <= (8'haf);
    end
  always
    @(posedge clk) begin
      reg61 <= (^~wire28[(2'h2):(2'h2)]);
    end
  assign wire62 = reg45[(5'h10):(4'hb)];
  assign wire63 = (wire34 ?
                      (~&{reg59[(4'he):(4'he)]}) : $unsigned(reg48[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg64 <= reg52;
      if ({$unsigned({$signed(wire39[(2'h2):(2'h2)]), (~&$signed((8'hb5)))}),
          (reg46 ^~ $signed($signed((wire62 < wire33))))})
        begin
          if ($signed(((-$signed({(8'hbe), reg51})) ?
              $signed(reg44[(1'h1):(1'h0)]) : $signed(((&wire30) >> reg54)))))
            begin
              reg65 <= $unsigned((((!((8'ha1) ^~ reg43)) ^~ ((wire32 >> wire63) ?
                      (reg50 ? reg45 : wire56) : {reg55})) ?
                  wire57[(2'h3):(2'h3)] : (!$unsigned($signed(reg64)))));
              reg66 <= (^(|reg54[(4'h8):(1'h0)]));
            end
          else
            begin
              reg65 <= ($signed(wire28) >= reg41);
              reg66 <= reg47;
              reg67 <= (8'hbb);
              reg68 <= $signed(wire40[(3'h4):(3'h4)]);
              reg69 <= $signed($unsigned($unsigned($unsigned($unsigned(reg65)))));
            end
          reg70 <= $unsigned(reg52);
          reg71 <= wire57;
        end
      else
        begin
          reg65 <= $unsigned(reg44);
          reg66 <= (($unsigned($signed(reg70[(5'h11):(4'hb)])) ~^ reg41[(3'h7):(2'h3)]) ?
              (^~($signed($unsigned(reg71)) >> wire32)) : ($signed({$unsigned((8'hb5))}) & wire37[(1'h1):(1'h1)]));
          reg67 <= $unsigned($unsigned(((reg45[(4'h8):(3'h7)] ?
                  reg64[(2'h2):(2'h2)] : (wire30 ^~ (8'ha6))) ?
              reg49[(1'h1):(1'h1)] : ((+reg58) <<< $unsigned(wire37)))));
          reg68 <= reg44;
        end
      reg72 <= $signed(reg61[(2'h3):(1'h0)]);
    end
  assign wire73 = ($signed((~({wire57} ? wire31[(3'h6):(2'h2)] : (~wire39)))) ?
                      wire28[(2'h3):(2'h2)] : (-(reg47 ?
                          (((8'ha1) ?
                              reg54 : reg65) && reg45[(4'ha):(1'h0)]) : ({(8'hac),
                              (7'h43)} < reg51))));
  assign wire74 = $signed(wire57[(1'h0):(1'h0)]);
endmodule

module module165  (y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire169;
  input wire signed [(4'hb):(1'h0)] wire168;
  input wire [(2'h2):(1'h0)] wire167;
  input wire signed [(4'hb):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire199;
  wire [(2'h3):(1'h0)] wire198;
  wire signed [(5'h10):(1'h0)] wire197;
  wire signed [(2'h3):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire195;
  wire [(4'ha):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire190;
  wire signed [(4'he):(1'h0)] wire189;
  wire [(5'h13):(1'h0)] wire178;
  wire [(2'h3):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire175;
  wire [(4'hc):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire [(4'ha):(1'h0)] wire172;
  wire signed [(4'h9):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg [(5'h14):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(3'h7):(1'h0)] reg179 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 reg194,
                 reg193,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire170 = (-(&$signed(wire167[(1'h0):(1'h0)])));
  assign wire171 = $unsigned({($unsigned({(8'hb9), wire166}) ?
                           (&wire170[(1'h0):(1'h0)]) : {(~^wire167),
                               (wire167 ^ wire169)})});
  assign wire172 = $signed(((-wire171[(4'h8):(1'h0)]) ?
                       $unsigned(((wire168 ^ wire168) != $unsigned(wire170))) : ({(&wire170),
                           (wire169 ?
                               wire171 : wire167)} >>> (wire166 ~^ wire171))));
  assign wire173 = ((-$unsigned($signed((wire172 ? wire168 : wire168)))) ?
                       $signed((wire172[(4'h8):(3'h5)] || wire168)) : ((((~|wire171) - (~^wire167)) * $signed($unsigned(wire166))) ?
                           ((|$unsigned(wire169)) ?
                               {{wire171},
                                   ((8'hb5) ~^ wire171)} : {(wire172 >= (8'h9e)),
                                   $signed(wire172)}) : (^~wire166)));
  assign wire174 = (wire173[(4'h9):(1'h0)] >= $signed(wire170[(4'h8):(3'h4)]));
  assign wire175 = ($signed((wire171[(1'h1):(1'h1)] ?
                       wire171 : {{wire167,
                               (8'hb0)}})) ^~ {wire171[(3'h5):(3'h5)]});
  assign wire176 = $unsigned($unsigned($unsigned(wire175)));
  assign wire177 = ((8'hac) != $signed(($unsigned(wire166) ?
                       wire176 : wire171)));
  assign wire178 = $unsigned($signed($signed((wire171 ?
                       (wire174 <<< wire166) : ((7'h42) ?
                           wire170 : wire168)))));
  always
    @(posedge clk) begin
      reg179 <= {$unsigned((-wire173))};
      reg180 <= (({$unsigned((wire168 ? wire177 : wire166)),
              (wire172[(2'h3):(1'h1)] && {wire166,
                  wire167})} <<< (^~({wire177} ?
              $unsigned(wire170) : wire172))) ?
          wire169[(4'h8):(2'h2)] : $signed($unsigned((wire168 ?
              (wire178 ^ wire168) : wire174))));
      reg181 <= (8'hbf);
      reg182 <= wire177[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ((wire173[(4'hc):(1'h0)] | ((^reg182) - (reg182[(1'h1):(1'h0)] ?
          $unsigned((8'hbe)) : (^~reg180)))))
        begin
          reg183 <= $unsigned(reg180[(1'h0):(1'h0)]);
        end
      else
        begin
          reg183 <= ((~wire170) ~^ $unsigned(($signed($unsigned(reg179)) ?
              wire174[(4'ha):(4'h8)] : wire178)));
          reg184 <= ($signed(reg182) >> wire178[(4'he):(4'he)]);
          reg185 <= (wire166 && (-($signed($unsigned(wire176)) ?
              (wire166[(1'h0):(1'h0)] || $unsigned(wire169)) : wire168[(4'h8):(3'h5)])));
          reg186 <= wire167;
          reg187 <= ($signed((~|$signed(wire174))) ?
              $unsigned(wire167) : (!(wire169 ?
                  $signed((~wire174)) : ((reg179 << reg183) + $unsigned(reg184)))));
        end
      reg188 <= (reg181 <= wire168[(1'h0):(1'h0)]);
    end
  assign wire189 = $signed($signed($signed((!wire173))));
  assign wire190 = $unsigned((^reg187[(4'h8):(2'h3)]));
  assign wire191 = $signed(($unsigned($signed((wire176 ? wire175 : wire168))) ?
                       reg180 : $signed((^~(|wire170)))));
  assign wire192 = {(8'hac)};
  always
    @(posedge clk) begin
      reg193 <= wire166;
      reg194 <= reg187[(3'h5):(2'h2)];
    end
  assign wire195 = (~&(wire172[(1'h1):(1'h0)] ?
                       wire174 : (~|$unsigned(reg187))));
  assign wire196 = (wire169 - $unsigned($signed(($unsigned(reg184) ?
                       wire166 : (|wire178)))));
  assign wire197 = reg182;
  assign wire198 = $signed($unsigned(reg183[(4'ha):(3'h6)]));
  assign wire199 = (8'ha8);
endmodule
