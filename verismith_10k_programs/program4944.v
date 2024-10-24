module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(4'hf):(1'h0)] wire185;
  wire [(5'h13):(1'h0)] wire184;
  wire signed [(4'h8):(1'h0)] wire182;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire26;
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire30,
                 wire29,
                 wire28,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire26,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((^wire4[(4'hd):(2'h2)]));
    end
  assign wire6 = reg5[(3'h4):(2'h2)];
  assign wire7 = $unsigned($unsigned(wire0[(4'hb):(1'h1)]));
  assign wire8 = $unsigned($signed(((7'h43) ? wire4 : wire7)));
  assign wire9 = (^~$unsigned((wire3[(4'hf):(2'h2)] + (|(wire2 <= wire0)))));
  assign wire10 = wire4[(3'h4):(3'h4)];
  assign wire11 = (~^$signed(((~|{wire7}) ?
                      $signed(reg5[(1'h0):(1'h0)]) : (!(~&wire0)))));
  assign wire12 = $signed(wire3[(2'h3):(1'h0)]);
  assign wire13 = $signed({(((wire3 ? wire11 : reg5) ?
                              $unsigned(wire2) : wire7[(2'h3):(1'h1)]) ?
                          (((8'ha4) >> (7'h43)) ^ {wire12}) : wire1),
                      (^((^~wire2) * (reg5 ? wire8 : wire11)))});
  assign wire14 = ((8'ha7) | wire6);
  module15 #() modinst27 (.wire17(wire10), .clk(clk), .wire16(wire0), .wire20(wire8), .wire18(wire9), .wire19(wire13), .y(wire26));
  assign wire28 = $unsigned($unsigned((wire7[(3'h5):(1'h0)] > $signed(wire3[(1'h1):(1'h0)]))));
  assign wire29 = (wire4[(4'hb):(4'h9)] == (8'hac));
  assign wire30 = (((|(8'hb8)) ?
                      wire14[(2'h3):(1'h0)] : wire29[(1'h1):(1'h0)]) == (($unsigned((wire14 ?
                          wire28 : wire4)) - (8'ha7)) ?
                      (-((wire8 >>> wire4) == (wire6 == (8'ha8)))) : $unsigned($signed((!(8'hb8))))));
  module31 #() modinst183 (.y(wire182), .wire35(reg5), .wire36(wire29), .wire33(wire3), .clk(clk), .wire34(wire28), .wire32(wire2));
  assign wire184 = (~&$unsigned($unsigned((wire7 ?
                       $signed(reg5) : $unsigned(reg5)))));
  assign wire185 = {$unsigned((-$unsigned($unsigned(wire30))))};
  assign wire186 = wire4;
endmodule

module module31
#(parameter param180 = (+((|({(8'h9f)} + ((7'h44) ? (7'h41) : (8'ha6)))) ? (|(((8'ha6) > (8'hbb)) ? ((8'hbc) ? (8'haf) : (7'h44)) : (^~(8'ha4)))) : (!(((8'hb6) <<< (7'h44)) && (~^(8'hbe)))))), 
parameter param181 = ((~^(param180 | {(~|param180), (param180 ? param180 : param180)})) && (param180 | param180)))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire36;
  input wire [(4'h8):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire42;
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire178,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire42,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= wire34[(4'h8):(2'h2)];
      reg38 <= wire35[(1'h0):(1'h0)];
      reg39 <= (~|wire33);
      reg40 <= wire34;
      reg41 <= (wire34 ?
          $unsigned(((&(wire35 + reg37)) ?
              (wire32 < wire36[(2'h3):(2'h3)]) : $unsigned(reg39))) : (~^(reg38 ?
              $signed((reg39 && wire35)) : $signed($unsigned(wire33)))));
    end
  assign wire42 = ($unsigned($signed($signed((^~wire34)))) ^~ reg41[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg43 <= (&wire34[(4'he):(2'h2)]);
      reg44 <= ($unsigned(reg40) ?
          reg41[(4'hb):(3'h4)] : $unsigned((~&(reg41 == {reg39, (8'ha2)}))));
      if ({wire42[(3'h6):(3'h5)]})
        begin
          reg45 <= wire34[(4'hc):(4'hb)];
          if (((({(&reg40)} >= reg41) ?
              {((reg37 ? reg44 : (8'hb5)) ?
                      (reg38 ?
                          reg37 : (8'haf)) : $signed(wire34))} : (+(&$signed(reg43)))) ~^ (reg37 ?
              $unsigned((^~(^reg41))) : (((reg38 <<< wire42) <<< $unsigned((8'ha1))) == (^wire33)))))
            begin
              reg46 <= ((8'h9d) != wire32);
              reg47 <= (((~&reg38[(4'hf):(4'hf)]) && $signed({$unsigned(reg44),
                      $unsigned(wire35)})) ?
                  ($signed(wire36) * $signed(((wire35 + wire42) < (~|reg40)))) : reg43[(3'h6):(2'h3)]);
              reg48 <= $signed(reg39);
              reg49 <= ((~|$unsigned(((-reg48) > (reg39 >= reg43)))) <<< (&(7'h41)));
              reg50 <= (({reg46[(3'h6):(2'h2)]} ?
                  $signed((-reg43)) : $unsigned($unsigned(reg48[(3'h4):(1'h1)]))) != ((({wire33} ?
                  (^~wire34) : ((8'hac) != wire35)) ^~ reg45[(1'h0):(1'h0)]) <<< (~|({reg39,
                      wire34} ?
                  (~|reg43) : (~|reg48)))));
            end
          else
            begin
              reg46 <= (reg46 ?
                  ((!(8'had)) <= $signed($signed((wire33 ?
                      wire35 : wire36)))) : reg47);
              reg47 <= reg50[(1'h0):(1'h0)];
              reg48 <= $signed((&($unsigned((wire32 ? wire34 : wire32)) ?
                  $signed($signed(reg44)) : {{wire33, wire33}, reg43})));
              reg49 <= ($signed(reg50) ?
                  {$signed((8'hb7))} : (($unsigned(((8'ha0) ?
                          reg41 : (8'ha5))) ?
                      $unsigned(reg44[(4'hb):(1'h0)]) : $unsigned((reg49 ~^ wire33))) ~^ $unsigned((((8'ha3) <= reg43) && reg37))));
              reg50 <= {(reg49 >> $signed(wire42)), reg38};
            end
          if (((reg39[(4'hd):(4'h8)] ?
              ($signed(wire32[(1'h0):(1'h0)]) > {(reg43 ?
                      reg48 : (8'ha9))}) : (reg37[(2'h3):(1'h0)] ?
                  reg45 : ({wire32, wire42} ?
                      (reg48 >= reg43) : $signed(reg40)))) == (reg45 ?
              reg48[(4'ha):(2'h3)] : wire42[(2'h2):(1'h1)])))
            begin
              reg51 <= (wire32 ?
                  wire42 : ((reg41[(1'h0):(1'h0)] && {reg45, reg48}) ?
                      $unsigned(reg49) : (reg50 ?
                          $unsigned(reg47[(3'h4):(2'h3)]) : reg46[(3'h4):(2'h2)])));
            end
          else
            begin
              reg51 <= (&$signed({wire32[(2'h2):(2'h2)],
                  reg50[(3'h5):(3'h4)]}));
              reg52 <= $signed((((reg41[(1'h1):(1'h0)] ? (&reg46) : wire34) ?
                  reg49[(3'h7):(2'h2)] : $signed(wire36)) ^ reg45[(2'h3):(1'h1)]));
              reg53 <= (^~(reg37 ~^ reg52));
            end
        end
      else
        begin
          reg45 <= ($signed(((&$unsigned(reg51)) ^~ (+$signed(reg50)))) ^ $unsigned($signed(reg43)));
          if ($signed(reg37))
            begin
              reg46 <= $signed($signed($signed(reg40[(1'h0):(1'h0)])));
              reg47 <= (({reg38[(1'h1):(1'h1)]} <<< (-(reg47[(3'h5):(3'h4)] | (reg37 < (8'hbd))))) == (&(+reg41)));
              reg48 <= wire42;
              reg49 <= $unsigned(reg41[(3'h4):(2'h2)]);
            end
          else
            begin
              reg46 <= $signed(reg37);
              reg47 <= (~&($signed(reg46[(2'h2):(1'h1)]) ?
                  $signed($signed((+reg53))) : ((8'hb7) ?
                      (!{reg38, wire42}) : reg50)));
              reg48 <= ($unsigned(reg53) ?
                  (8'h9c) : $unsigned(reg43[(2'h3):(2'h3)]));
              reg49 <= $signed($unsigned(reg47[(2'h3):(2'h3)]));
            end
          reg50 <= $unsigned(reg37[(3'h5):(3'h4)]);
          reg51 <= reg52;
          if ((reg38[(2'h2):(2'h2)] >= wire36[(2'h3):(2'h3)]))
            begin
              reg52 <= $signed(({wire34[(4'he):(2'h2)]} && $unsigned($unsigned(reg53))));
              reg53 <= reg47;
            end
          else
            begin
              reg52 <= $unsigned((((8'haa) ?
                  (+((7'h42) > reg52)) : reg46) - wire35));
              reg53 <= (reg49 ?
                  reg39[(3'h5):(3'h4)] : ((~^(-$signed(reg49))) ?
                      (^~reg52[(3'h6):(3'h6)]) : reg47[(2'h2):(2'h2)]));
            end
        end
    end
  assign wire54 = ($unsigned({$unsigned(reg47),
                      reg52[(2'h3):(2'h2)]}) - {$signed(reg43),
                      reg43[(3'h4):(2'h3)]});
  assign wire55 = wire54[(1'h0):(1'h0)];
  assign wire56 = reg37;
  assign wire57 = ($signed(reg38) ^~ ($signed($signed((|reg53))) <= ((8'ha5) ?
                      $signed((8'hb7)) : wire35[(3'h7):(1'h0)])));
  assign wire58 = reg41[(4'hf):(3'h6)];
  assign wire59 = reg52;
  assign wire60 = (!$signed($signed($signed((wire42 ^~ reg44)))));
  assign wire61 = wire56[(4'hc):(3'h6)];
  assign wire62 = (~&$signed($signed($unsigned($signed(reg39)))));
  assign wire63 = (((^reg38) >> ($signed((reg37 >= reg46)) != ((-reg38) > {wire33,
                      reg44}))) ^~ $unsigned(reg53[(3'h7):(2'h3)]));
  module64 #() modinst134 (.wire68(wire58), .wire66(wire61), .clk(clk), .y(wire133), .wire65(wire63), .wire67(wire60));
  assign wire135 = wire60[(1'h1):(1'h1)];
  assign wire136 = (^~reg52[(1'h1):(1'h0)]);
  assign wire137 = {wire133};
  assign wire138 = (~|wire61[(1'h1):(1'h1)]);
  assign wire139 = reg40[(3'h5):(3'h5)];
  module140 #() modinst179 (.clk(clk), .wire144(reg49), .y(wire178), .wire143(wire34), .wire141(wire133), .wire142(reg48));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = (((8'hb6) >= ({$unsigned((8'hbc)), wire18} ?
                      wire20[(1'h0):(1'h0)] : $signed($signed(wire20)))) == wire19[(4'hf):(3'h4)]);
  assign wire22 = wire17[(4'hf):(3'h5)];
  assign wire23 = (~|((({wire20, wire21} <= wire18[(3'h5):(3'h4)]) ?
                          $unsigned(wire17) : ((wire20 ? wire22 : wire17) ?
                              $unsigned(wire16) : (!wire19))) ?
                      (|wire19[(1'h1):(1'h1)]) : $unsigned($unsigned((~&wire18)))));
  assign wire24 = wire17[(4'hf):(3'h6)];
  assign wire25 = (+($signed(wire23) || $signed((wire19[(2'h3):(1'h0)] ?
                      wire24 : {wire20}))));
endmodule

module module140
#(parameter param176 = (((8'haa) ~^ ((~^((8'ha9) ? (8'hb9) : (8'had))) != (~^(!(8'ha3))))) && (~|((&((8'ha0) ? (8'ha5) : (7'h42))) >>> (((8'hae) >> (8'h9f)) || (^~(8'hb7)))))), 
parameter param177 = param176)
(y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire signed [(5'h15):(1'h0)] wire143;
  input wire [(4'hd):(1'h0)] wire142;
  input wire [(4'hf):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(5'h12):(1'h0)] wire173;
  wire [(4'ha):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire147;
  wire [(4'ha):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire145;
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire162,
                 wire160,
                 wire159,
                 wire147,
                 wire146,
                 wire145,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg161,
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
                 (1'h0)};
  assign wire145 = $signed(wire142[(4'h8):(4'h8)]);
  assign wire146 = (wire142 <<< wire144[(5'h13):(4'hb)]);
  assign wire147 = ((~|wire141[(4'h8):(2'h2)]) ?
                       wire145[(3'h7):(1'h1)] : ($signed(((wire144 ?
                                   wire143 : wire142) ?
                               (wire145 ~^ (8'ha5)) : {wire146, wire144})) ?
                           {wire142[(3'h7):(3'h7)]} : (+((~|wire142) << wire143))));
  always
    @(posedge clk) begin
      reg148 <= wire143;
      reg149 <= {((reg148 < (8'hbe)) <= {wire146[(3'h5):(2'h3)]}),
          {$signed(((+wire142) ? ((7'h40) << (8'hbb)) : (-wire144)))}};
      if ({wire146[(3'h6):(1'h0)]})
        begin
          reg150 <= (wire144[(4'h8):(3'h6)] + {($unsigned((~&(8'haa))) ?
                  (wire143[(5'h15):(5'h12)] << wire144) : (8'ha6))});
          if (wire143[(5'h12):(3'h7)])
            begin
              reg151 <= {((+(wire142[(2'h2):(1'h1)] ?
                          (reg148 ^~ (8'hb4)) : $unsigned(wire143))) ?
                      $unsigned($signed((+reg150))) : $signed((+wire146)))};
              reg152 <= reg151[(2'h2):(1'h1)];
              reg153 <= ($unsigned((({wire147, reg151} ?
                          {wire144, wire147} : (|wire141)) ?
                      wire143[(5'h10):(4'hb)] : ((reg151 ? wire141 : wire145) ?
                          ((8'ha9) <= wire142) : (&wire144)))) ?
                  (~(reg151[(4'hf):(3'h7)] ?
                      (^$signed(reg152)) : (&(wire146 >= wire145)))) : ($unsigned($unsigned({reg149,
                      wire146})) > ((~|$unsigned(wire144)) >>> wire142[(1'h0):(1'h0)])));
              reg154 <= (((|$unsigned($unsigned(wire141))) ?
                      ({(&reg149)} | (^~(reg151 & wire141))) : wire143[(5'h14):(4'h8)]) ?
                  wire147 : wire146);
            end
          else
            begin
              reg151 <= $unsigned(wire143[(4'h8):(3'h4)]);
              reg152 <= (!((~^reg148) ?
                  (~|($unsigned((8'hbd)) | wire141)) : wire145[(2'h3):(1'h0)]));
              reg153 <= wire146[(1'h0):(1'h0)];
              reg154 <= ((wire147 | (wire141[(4'ha):(4'h8)] ?
                  {reg154[(3'h6):(3'h5)]} : $unsigned((reg152 * reg151)))) <= (+$unsigned(reg149[(3'h6):(2'h2)])));
              reg155 <= $signed(reg153);
            end
          reg156 <= reg148;
        end
      else
        begin
          reg150 <= {$signed((8'hb7))};
        end
      reg157 <= {{reg155, $unsigned($signed((reg152 != wire143)))},
          (wire146[(3'h4):(1'h1)] ?
              (({(8'ha4), wire143} ? (+(8'hbc)) : ((8'hb1) >>> reg154)) ?
                  ($unsigned(wire145) ~^ (wire142 | wire142)) : reg152[(4'ha):(2'h3)]) : $unsigned(reg155))};
      reg158 <= ($signed(((8'haa) ?
          wire146 : (8'haf))) + reg150[(2'h2):(2'h2)]);
    end
  assign wire159 = $signed({wire145[(2'h2):(2'h2)]});
  assign wire160 = $signed((+reg152[(4'he):(3'h4)]));
  always
    @(posedge clk) begin
      reg161 <= (-reg157);
    end
  assign wire162 = (~^reg158);
  always
    @(posedge clk) begin
      if (wire162[(1'h0):(1'h0)])
        begin
          reg163 <= reg157[(2'h3):(2'h3)];
          reg164 <= $signed((({((8'hb3) ? wire141 : (8'hac)),
                      ((7'h42) ? reg152 : wire145)} ?
                  $unsigned($signed(wire145)) : reg155[(1'h0):(1'h0)]) ?
              wire141[(4'hf):(4'he)] : {reg158[(4'h8):(4'h8)],
                  (wire143 + $unsigned(reg157))}));
          reg165 <= {$signed({reg148}), reg156[(2'h2):(2'h2)]};
        end
      else
        begin
          reg163 <= reg155;
          reg164 <= ((reg153 ?
              $unsigned(reg151) : (8'ha6)) << $signed((((~|(8'hbd)) >>> $signed(reg163)) >> $signed((~^wire160)))));
          reg165 <= wire144[(4'h8):(1'h1)];
          if ((((reg148 >> (^reg165)) ?
                  (((wire159 & reg151) ?
                          wire147[(1'h0):(1'h0)] : $unsigned(wire160)) ?
                      wire143 : (+reg163[(4'ha):(2'h3)])) : $signed(reg153)) ?
              $unsigned(($unsigned($signed(reg158)) ?
                  $signed(reg153[(1'h1):(1'h1)]) : (8'ha7))) : $unsigned((wire141[(4'ha):(3'h7)] ?
                  wire147 : (8'hab)))))
            begin
              reg166 <= reg150[(4'hd):(4'ha)];
              reg167 <= (($unsigned(($unsigned(reg158) ?
                          reg148 : $unsigned(reg151))) ?
                      reg163 : $unsigned(($signed(reg157) && wire146))) ?
                  (((&reg151) & $unsigned(reg166)) ^ ((reg154 >= $signed(reg158)) ?
                      reg158 : (8'hb7))) : $unsigned($unsigned(((~&(8'hb8)) ?
                      (reg153 <<< reg156) : (reg150 ? (7'h42) : (8'ha7))))));
              reg168 <= reg156[(1'h0):(1'h0)];
            end
          else
            begin
              reg166 <= {$signed(({(&reg168)} || $signed($unsigned(wire141))))};
              reg167 <= $signed({(!(&(|wire146)))});
              reg168 <= wire143;
            end
          reg169 <= (reg153 <= (|(~&(wire160[(4'h8):(3'h7)] ?
              $signed(reg164) : (~|reg149)))));
        end
    end
  assign wire170 = $signed(($signed((~|$signed(reg163))) == $signed(($unsigned((8'h9d)) << wire145))));
  assign wire171 = reg158[(2'h3):(1'h0)];
  assign wire172 = $signed(wire160);
  assign wire173 = (((+$signed((wire145 >> wire162))) ^~ $unsigned((reg167[(1'h0):(1'h0)] ?
                           $signed(wire160) : $unsigned(wire147)))) ?
                       (wire172 + $unsigned(wire171)) : (wire160 ?
                           wire171[(3'h6):(2'h2)] : ((~^(wire145 >>> reg158)) < (reg167[(2'h2):(1'h1)] != reg151))));
  assign wire174 = reg148;
  assign wire175 = wire162;
endmodule

module module64
#(parameter param132 = {{((!(|(8'had))) > (((8'hb4) != (8'hbb)) ? (~(8'hb2)) : (~(8'hac))))}, {({((8'ha5) ? (8'hbc) : (8'hba)), {(8'hba), (7'h43)}} + (((7'h40) ^~ (8'ha1)) | ((8'ha9) ? (7'h41) : (8'h9f))))}})
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h2c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(3'h7):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire129;
  wire signed [(4'he):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire69;
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire82,
                 wire81,
                 wire69,
                 reg131,
                 reg130,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = $signed($signed(wire67));
  always
    @(posedge clk) begin
      reg70 <= wire68[(4'ha):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ((wire68[(4'h8):(1'h0)] ?
          $signed($unsigned($signed(reg70))) : $unsigned(wire65[(3'h7):(3'h7)])))
        begin
          if (wire66[(3'h6):(3'h5)])
            begin
              reg71 <= wire66;
              reg72 <= {wire68[(3'h7):(2'h3)]};
              reg73 <= (|($signed((+(reg70 ?
                  wire65 : reg71))) ~^ {wire65[(3'h4):(1'h1)]}));
              reg74 <= $unsigned(wire68);
            end
          else
            begin
              reg71 <= $signed(($unsigned(reg71) ?
                  (reg72 ^~ {(^reg71)}) : $signed((8'h9d))));
              reg72 <= $signed($unsigned({({wire69, wire68} ^~ (wire66 ?
                      wire65 : wire68)),
                  wire67[(1'h0):(1'h0)]}));
              reg73 <= (((~wire65) ?
                  ($signed($unsigned(wire67)) ?
                      ($unsigned(reg74) ^ $signed(wire69)) : ((wire68 ?
                          (8'ha0) : wire65) * {wire68,
                          (8'hb4)})) : ($unsigned(((8'hbd) && (8'hb0))) ?
                      {wire65[(2'h2):(1'h1)],
                          $unsigned(reg72)} : reg74)) + $signed(((((8'hbf) ?
                  reg72 : wire66) <= $signed(reg74)) ~^ reg74)));
              reg74 <= (^(~&{($unsigned(reg70) ~^ (wire68 ? wire65 : wire65)),
                  reg72}));
              reg75 <= (reg74 ?
                  (({(reg74 != reg70)} ?
                      $unsigned((wire66 >= wire69)) : wire66) < {(reg70 ?
                          (^~wire66) : ((8'hae) ?
                              reg70 : wire68))}) : (~|reg70));
            end
          reg76 <= wire67[(4'hd):(4'hc)];
          reg77 <= reg76;
          if ($signed(wire67))
            begin
              reg78 <= wire69;
            end
          else
            begin
              reg78 <= {$unsigned((~&reg75)), {reg78[(3'h4):(2'h2)]}};
              reg79 <= (wire66[(1'h1):(1'h1)] - ({{((7'h41) >> (8'hb5)),
                          (&wire69)},
                      $unsigned((~|reg74))} ?
                  {wire69[(5'h10):(4'hd)]} : (~(((8'hb8) < wire68) ?
                      (reg71 ? (8'h9f) : wire67) : (wire67 ? reg72 : reg71)))));
              reg80 <= (~^(~($signed(reg78) ?
                  ((reg72 >> reg76) ? reg76 : (7'h42)) : {reg75, reg72})));
            end
        end
      else
        begin
          if ($unsigned((~|$signed($unsigned($unsigned(reg75))))))
            begin
              reg71 <= (~&((($signed((8'hb2)) ?
                  (reg73 ?
                      reg72 : reg77) : wire66[(4'h9):(1'h1)]) <= ((^~reg74) >>> $unsigned(reg79))) == $signed(wire69)));
              reg72 <= (~^$signed($unsigned($unsigned($unsigned(reg73)))));
            end
          else
            begin
              reg71 <= (^~$signed({((wire68 == wire67) | wire66),
                  {reg73, (+(8'ha2))}}));
            end
        end
    end
  assign wire81 = {(~^$signed(wire67)), reg73};
  assign wire82 = $unsigned(wire66);
  always
    @(posedge clk) begin
      if (reg77[(1'h1):(1'h0)])
        begin
          reg83 <= (((7'h43) ?
              $unsigned($unsigned(wire69[(4'hb):(3'h5)])) : (^~$signed($signed(reg76)))) ^~ ({((8'hb4) ?
                  $unsigned(wire66) : $signed(reg73))} ~^ ((~{wire69,
              wire67}) * reg70[(1'h0):(1'h0)])));
          reg84 <= {(~|reg72[(1'h0):(1'h0)])};
        end
      else
        begin
          reg83 <= reg73[(3'h5):(2'h2)];
          reg84 <= $signed($unsigned({wire65[(3'h7):(2'h2)],
              $unsigned(reg70[(4'hb):(4'h8)])}));
          if ((reg77 ? $unsigned(reg73) : wire65))
            begin
              reg85 <= reg71;
              reg86 <= ({(({wire68} & reg85[(4'h8):(3'h6)]) >> $signed($unsigned(wire66))),
                      $signed(((wire81 ? (8'ha4) : reg78) ?
                          (~reg73) : (!reg74)))} ?
                  wire65[(2'h2):(2'h2)] : ($signed($unsigned(((8'h9f) <<< wire65))) >= $unsigned(((reg78 ~^ reg70) ?
                      reg73[(3'h7):(1'h1)] : $signed(reg75)))));
              reg87 <= wire82[(2'h3):(2'h3)];
              reg88 <= {{reg85[(3'h4):(3'h4)],
                      (($signed(reg76) ?
                          (reg75 & reg84) : (|reg84)) | ((wire69 ?
                              wire68 : (8'hae)) ?
                          reg85 : reg86[(1'h0):(1'h0)]))},
                  reg70[(3'h7):(3'h5)]};
              reg89 <= $unsigned($unsigned(wire81[(4'h8):(3'h5)]));
            end
          else
            begin
              reg85 <= {(reg89 ?
                      (&({(8'hb1), reg70} ?
                          ((8'hb5) >>> reg72) : (-(8'hb3)))) : (8'hb4))};
              reg86 <= (~^$unsigned((reg76 ? reg88 : (^~{wire67}))));
            end
          reg90 <= {wire82[(5'h10):(1'h0)],
              $signed((~$signed($signed(wire67))))};
        end
      reg91 <= ($signed((^~($unsigned(reg80) <= wire66))) < wire65);
      if ($signed(wire67))
        begin
          reg92 <= {wire65[(1'h0):(1'h0)]};
        end
      else
        begin
          if (((+$unsigned(wire82)) ^ $unsigned(wire65)))
            begin
              reg92 <= (wire65 || (((reg74[(2'h3):(1'h1)] - $unsigned(reg90)) ?
                  (8'hb0) : $unsigned((reg85 ^~ reg90))) != (reg83 + ((&reg83) ?
                  (wire67 - reg73) : $signed(wire69)))));
              reg93 <= reg76[(4'h9):(2'h3)];
              reg94 <= reg78;
              reg95 <= $unsigned(((((8'haf) ~^ reg72) ?
                      (8'haf) : $signed(reg72[(2'h2):(2'h2)])) ?
                  reg79 : $signed((reg90 == reg85))));
            end
          else
            begin
              reg92 <= {(($signed(reg92[(1'h1):(1'h1)]) ~^ ({reg79} ?
                      $unsigned((8'hb6)) : $unsigned(reg86))) <= (^~reg93[(1'h1):(1'h0)])),
                  ((^reg84[(2'h3):(2'h3)]) ?
                      (8'ha1) : (^~$unsigned($unsigned(wire65))))};
              reg93 <= wire81[(1'h0):(1'h0)];
              reg94 <= $unsigned($signed($unsigned((8'ha6))));
              reg95 <= (reg89 ~^ $signed($unsigned(wire68[(5'h12):(1'h0)])));
            end
          if ($signed($signed($unsigned({((8'h9d) >> reg94)}))))
            begin
              reg96 <= ($signed(wire67) ?
                  $unsigned($signed($unsigned((8'h9d)))) : (~&wire65));
              reg97 <= $unsigned((!reg96));
              reg98 <= reg91;
              reg99 <= ((reg71[(3'h6):(2'h2)] * (8'hbb)) ? reg86 : reg87);
            end
          else
            begin
              reg96 <= ($unsigned($unsigned($signed((reg86 ?
                      wire81 : wire65)))) ?
                  $signed((^reg76)) : reg83[(5'h12):(4'h9)]);
            end
          reg100 <= $signed({(8'ha6),
              {{((8'ha4) ^~ reg99)}, (!$unsigned((8'hb7)))}});
          if (reg76)
            begin
              reg101 <= $unsigned(reg86[(1'h0):(1'h0)]);
              reg102 <= reg75[(5'h10):(5'h10)];
            end
          else
            begin
              reg101 <= wire66[(1'h0):(1'h0)];
              reg102 <= ((~(reg97 ?
                      $signed($signed(reg94)) : reg96[(4'h8):(4'h8)])) ?
                  (|reg96[(2'h2):(1'h0)]) : ($unsigned($unsigned((^reg88))) ?
                      ((wire68[(4'hf):(2'h2)] * $signed(reg84)) ?
                          (|(+reg79)) : $unsigned($unsigned(reg97))) : ((-$unsigned(reg89)) ?
                          $signed(reg93) : ((|reg90) ?
                              reg98 : ((8'ha8) ? reg71 : wire66)))));
              reg103 <= (|((reg98[(2'h2):(1'h1)] ~^ reg85[(4'h8):(2'h2)]) | ({(-reg84),
                      (reg99 ? reg72 : (7'h42))} ?
                  (~^reg80[(1'h0):(1'h0)]) : reg99[(2'h3):(2'h3)])));
            end
        end
      if ((8'ha5))
        begin
          reg104 <= (^{($signed($unsigned((8'hb8))) && (~^reg77))});
          reg105 <= (&((({reg70} | $signed((8'hb2))) ?
              (8'ha8) : {(reg79 != reg104),
                  (&reg79)}) >= (~$unsigned(((8'ha7) || reg92)))));
          reg106 <= (wire67 ? reg73[(3'h6):(3'h4)] : reg88[(3'h6):(3'h6)]);
        end
      else
        begin
          reg104 <= reg78;
          reg105 <= ($signed(wire68[(4'hd):(4'ha)]) != $signed(((+(~^reg97)) ?
              {$signed((8'had))} : (~&$unsigned(reg90)))));
          if ($signed((&(reg105 > $unsigned($signed(reg76))))))
            begin
              reg106 <= (~^reg106[(4'hf):(2'h3)]);
              reg107 <= $unsigned(((reg70[(2'h2):(2'h2)] ?
                      reg91 : ((~|reg76) ?
                          ((8'ha6) ~^ reg97) : $unsigned((8'ha0)))) ?
                  reg74 : $signed(({wire82} ^~ reg83))));
              reg108 <= reg107[(2'h2):(1'h1)];
            end
          else
            begin
              reg106 <= (^~($signed(reg108) ?
                  ({$signed(reg94), $unsigned((8'hab))} >>> {(reg90 ?
                          reg87 : reg80),
                      (8'hb5)}) : (|reg75)));
              reg107 <= reg92;
              reg108 <= $unsigned(reg104);
              reg109 <= (~^(~^reg92));
            end
          if ($unsigned(wire67[(4'hf):(1'h1)]))
            begin
              reg110 <= $unsigned($signed(($unsigned((reg109 <<< reg72)) ?
                  reg97 : reg87[(2'h2):(1'h1)])));
              reg111 <= (|$unsigned((wire67[(4'ha):(4'h9)] - ($unsigned(reg85) ~^ {reg102}))));
              reg112 <= (~|reg91);
              reg113 <= $unsigned($signed((reg79 ?
                  $signed($unsigned((8'ha8))) : (~|$unsigned(reg92)))));
              reg114 <= $unsigned($unsigned($signed(((reg83 ?
                  wire67 : reg102) || $signed((8'ha1))))));
            end
          else
            begin
              reg110 <= (~^wire66);
              reg111 <= ((reg93 ?
                      $signed(wire66) : (reg111 << ((~wire69) ?
                          (reg80 ? wire82 : reg91) : $unsigned(reg75)))) ?
                  $signed(({(reg84 ^~ reg73)} > (-(reg79 ?
                      (8'ha8) : reg108)))) : (wire67[(4'h8):(2'h2)] ?
                      reg114[(5'h10):(5'h10)] : (8'hbf)));
            end
          if (reg94)
            begin
              reg115 <= reg107[(3'h6):(3'h5)];
              reg116 <= ((|$signed($signed(reg92[(2'h2):(2'h2)]))) ?
                  reg103[(2'h2):(1'h0)] : (~^({(~(8'h9d))} - (~(reg93 == reg100)))));
              reg117 <= ((!(reg78 ?
                      ({reg70} ?
                          (reg77 + reg90) : (^~wire82)) : reg94[(2'h2):(1'h1)])) ?
                  $signed((+{reg90[(3'h5):(2'h2)]})) : reg104);
              reg118 <= reg101;
              reg119 <= $unsigned($unsigned((7'h40)));
            end
          else
            begin
              reg115 <= $signed($signed(({reg74[(2'h2):(1'h0)]} < {(^~reg113),
                  $unsigned(reg100)})));
            end
        end
      reg120 <= reg88[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg121 <= (wire68 ?
          $unsigned($unsigned((((8'hbf) ? reg119 : reg71) ?
              {(8'hbf), reg92} : (reg94 ?
                  reg120 : reg102)))) : $unsigned((((reg74 ?
                  reg111 : reg109) * $signed(wire81)) ?
              $unsigned((^reg105)) : reg120)));
      reg122 <= $signed(reg114);
      reg123 <= reg78;
      reg124 <= {$signed((8'hb3)),
          {((reg89 || reg90[(4'h9):(3'h6)]) ?
                  wire66[(2'h2):(1'h0)] : ($signed(reg121) ?
                      (8'hbe) : (reg97 <= reg96)))}};
    end
  assign wire125 = ($unsigned(((((8'ha3) >> reg87) ?
                               ((8'h9f) <= reg78) : (^~(8'hab))) ?
                           (8'hb6) : ($unsigned(reg101) <= $signed(reg96)))) ?
                       $unsigned(reg70[(4'ha):(4'h8)]) : $unsigned(((8'h9d) ?
                           ({(8'ha1),
                               reg89} == $unsigned(reg112)) : (-reg97[(4'hd):(2'h2)]))));
  assign wire126 = reg73;
  assign wire127 = wire126;
  assign wire128 = (~$unsigned((($unsigned(reg94) < $unsigned(reg113)) ?
                       reg72 : ((reg73 & (8'ha1)) ?
                           (~|(8'hb4)) : $signed(reg78)))));
  assign wire129 = (($signed(reg98[(4'hd):(3'h6)]) ?
                       wire68 : $signed((~wire67))) < {((^$unsigned((8'hba))) > (&reg91)),
                       ($unsigned((reg98 & reg117)) > ($unsigned(reg71) ?
                           reg84 : (~|reg87)))});
  always
    @(posedge clk) begin
      reg130 <= (wire66 << (reg96[(2'h2):(1'h0)] ?
          reg110[(1'h1):(1'h0)] : (&reg102[(1'h1):(1'h0)])));
      reg131 <= (~^(^reg72));
    end
endmodule
