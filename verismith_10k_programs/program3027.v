module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire168;
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire65, wire6, wire67, wire68, wire168, reg4, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((wire3[(4'he):(2'h3)] ?
              wire3[(1'h1):(1'h0)] : wire1[(3'h5):(3'h5)]) ?
          ($signed((wire2 <<< wire2)) * (~&$unsigned((8'hbb)))) : ($signed(((8'ha9) < wire1)) ?
              $unsigned((wire0 >> wire2)) : $signed($signed(wire1)))) || (8'ha8));
      reg5 <= (~{(wire2 ?
              $unsigned((wire1 ? wire2 : wire1)) : $unsigned((wire0 ?
                  wire2 : wire2))),
          ((((8'hb1) <<< reg4) ? (+wire3) : reg4) ? reg4 : wire3)});
    end
  assign wire6 = ($signed(reg5) ? (7'h41) : (~|reg5[(4'h8):(2'h3)]));
  module7 #() modinst66 (wire65, clk, wire2, wire3, reg4, reg5, wire6);
  assign wire67 = {reg5};
  assign wire68 = (8'ha2);
  module69 #() modinst169 (wire168, clk, wire3, wire2, reg5, wire6);
endmodule

module module69
#(parameter param166 = ((&({(^(8'hb5)), (~&(8'hae))} ? ((|(8'hb6)) ? (|(8'ha6)) : ((7'h43) ? (8'hb5) : (8'hb2))) : (^((8'hb3) >> (8'h9e))))) ? (((-((8'hbd) >= (8'hba))) ? (~|((8'hbd) ^ (8'h9c))) : (~(~|(8'hb0)))) <<< (!(!((8'hbf) ? (8'hbc) : (8'hbf))))) : (((+(~^(8'h9d))) ^ (~&((8'hb5) ? (8'hbb) : (8'hbc)))) & ((((8'hab) ? (8'hbe) : (7'h44)) ? ((7'h42) ? (8'ha7) : (7'h40)) : ((8'hae) ? (8'hb6) : (8'hbf))) ? (~^((8'h9f) < (7'h43))) : ((^~(8'hb9)) ? {(8'had)} : {(7'h41)})))), 
parameter param167 = param166)
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire73;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire76;
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  assign y = {wire165,
                 wire163,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire97,
                 wire95,
                 wire76,
                 reg75,
                 reg74,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= {(-$signed($signed($signed((8'ha5)))))};
      reg75 <= reg74[(4'h9):(4'h9)];
    end
  assign wire76 = (8'hb5);
  module77 #() modinst96 (.clk(clk), .wire81(reg75), .wire79(wire72), .y(wire95), .wire80(wire71), .wire78(wire76), .wire82(wire73));
  assign wire97 = $signed((((wire70[(4'hb):(3'h7)] ?
                          $unsigned(wire71) : $signed(wire71)) + $unsigned(wire73[(1'h1):(1'h0)])) ?
                      $unsigned($signed({reg75, wire70})) : {({wire71,
                              (8'hbc)} & (wire95 >>> wire95)),
                          {(reg75 && (8'h9e)), {(8'hac)}}}));
  always
    @(posedge clk) begin
      reg98 <= (^(~|$unsigned(({wire71} | (wire95 && (8'hb9))))));
    end
  module99 #() modinst129 (.wire100(wire72), .wire103(reg98), .y(wire128), .clk(clk), .wire104(wire97), .wire102(wire95), .wire101(wire76));
  assign wire130 = $signed($unsigned((+((wire97 ? wire71 : reg98) ?
                       $unsigned(wire70) : (wire76 ~^ wire76)))));
  assign wire131 = wire76[(2'h3):(2'h3)];
  assign wire132 = ((reg98[(3'h5):(2'h3)] ?
                           wire71[(1'h0):(1'h0)] : ($signed((wire131 < wire131)) - ($signed(reg75) != ((7'h40) ?
                               (8'h9f) : wire128)))) ?
                       ({wire97[(3'h5):(2'h3)],
                           ((8'h9e) ?
                               $unsigned(wire128) : $signed(wire131))} ^ {((~^wire130) ?
                               (wire130 ?
                                   wire95 : wire130) : wire70[(4'h9):(1'h0)])}) : reg98[(3'h7):(1'h1)]);
  module133 #() modinst164 (wire163, clk, wire72, wire71, reg98, reg75);
  assign wire165 = ((~|wire132[(4'h8):(2'h2)]) == ($unsigned($signed((wire97 ?
                           wire70 : wire163))) ?
                       wire132 : ($unsigned(reg75) ~^ wire71)));
endmodule

module module7
#(parameter param64 = ({((8'hb0) ? (+(8'hb3)) : ({(8'hb5), (8'haa)} ? ((8'h9c) * (7'h40)) : ((8'ha2) ? (8'h9c) : (8'ha5))))} ? ({(&((8'hab) ? (8'hb2) : (8'ha8))), (^~(8'hba))} ? ((!(8'hb4)) ? (((8'hac) > (8'ha1)) ^ (8'ha0)) : {(8'hb9)}) : ((7'h40) != {(!(8'hb9)), ((8'ha7) ? (8'hb3) : (8'hb1))})) : ((((&(8'hb1)) || ((8'hb5) <= (8'haf))) <= (|((8'h9d) ? (8'ha5) : (7'h40)))) ? ((|((8'hb0) > (8'hb7))) ^~ (((8'hae) ? (8'ha2) : (8'hb0)) == (~^(7'h42)))) : (((+(8'ha6)) ^ (8'haa)) ? (+((8'hb4) & (8'hb9))) : ((8'h9e) + {(8'ha6)})))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire60;
  assign y = {wire63,
                 wire62,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire60,
                 (1'h0)};
  assign wire13 = $unsigned($signed(wire8[(4'hc):(2'h2)]));
  assign wire14 = wire13;
  assign wire15 = $unsigned((&$signed(wire12)));
  assign wire16 = wire15[(4'he):(3'h4)];
  assign wire17 = {(~(wire16 >> wire8[(3'h5):(1'h0)])), wire16};
  module18 #() modinst61 (wire60, clk, wire13, wire17, wire8, wire16, wire11);
  assign wire62 = wire12[(2'h3):(2'h3)];
  assign wire63 = $signed(wire13);
endmodule

module module18
#(parameter param58 = (&(|({((8'hb2) ? (8'ha7) : (8'h9d))} ? (((8'hb0) ? (8'hb9) : (8'hb8)) >= ((8'hb2) + (8'hb5))) : (((8'ha9) < (8'hbc)) + {(7'h41)})))), 
parameter param59 = (((param58 > (^(param58 ^~ param58))) ? (param58 ? ((param58 > param58) & (param58 | param58)) : {(~&param58), param58}) : param58) == param58))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
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
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire24 = $unsigned($signed((wire20[(5'h10):(4'he)] ?
                      (^~{(8'hbb)}) : wire20[(2'h2):(1'h0)])));
  assign wire25 = ($unsigned((wire22 ?
                          ($signed((8'h9f)) * $unsigned(wire23)) : ((wire20 ~^ wire20) >> $signed(wire21)))) ?
                      {{(+$unsigned(wire22))},
                          wire21} : ((8'hbf) == $unsigned(($unsigned((8'ha6)) ?
                          $signed(wire23) : $unsigned(wire22)))));
  assign wire26 = (8'hbd);
  always
    @(posedge clk) begin
      reg27 <= $unsigned(wire24);
      reg28 <= ($signed(wire23) ?
          wire25[(2'h3):(2'h3)] : (!$signed(((wire20 ? (8'hba) : wire19) ?
              (wire23 ? wire22 : wire24) : {wire22, wire21}))));
      reg29 <= {wire26[(3'h5):(1'h0)]};
      reg30 <= $signed((|$unsigned($unsigned({wire25, reg29}))));
    end
  assign wire31 = reg30;
  assign wire32 = (~|($unsigned((+(!wire20))) ?
                      (~$signed($signed(wire25))) : ($unsigned((wire24 ^ wire26)) >> (!(wire21 ?
                          wire24 : (8'hb9))))));
  assign wire33 = wire32;
  always
    @(posedge clk) begin
      reg34 <= (~^(($unsigned({wire33}) >= {(wire25 ?
              wire21 : wire33)}) ~^ $signed(((wire19 ?
          wire20 : wire24) >> $unsigned(wire19)))));
      reg35 <= wire23[(3'h7):(3'h4)];
    end
  assign wire36 = ((reg27[(1'h1):(1'h1)] ?
                          reg35[(2'h2):(2'h2)] : (reg29 ?
                              $signed(reg28[(2'h2):(1'h0)]) : $unsigned(reg34[(5'h12):(5'h10)]))) ?
                      (!($signed(wire22) >>> (|$unsigned(wire26)))) : $unsigned($signed($signed(reg30[(3'h6):(3'h4)]))));
  assign wire37 = wire20;
  assign wire38 = $unsigned(reg28[(3'h6):(2'h3)]);
  assign wire39 = (&reg34[(4'h8):(2'h2)]);
  always
    @(posedge clk) begin
      reg40 <= wire20;
      reg41 <= $signed({($signed($signed(reg28)) >>> $signed($unsigned(wire23))),
          $unsigned((|$unsigned(wire26)))});
      if ($signed({(((^~wire31) != wire38[(2'h3):(1'h1)]) ~^ wire38[(3'h4):(1'h1)]),
          ((8'hbe) > ((reg29 > (8'h9f)) ?
              wire32[(4'ha):(3'h7)] : (wire23 ? reg35 : wire25)))}))
        begin
          if ((reg28[(1'h0):(1'h0)] ?
              reg35[(1'h1):(1'h0)] : $unsigned((^$signed(wire23)))))
            begin
              reg42 <= (+$signed({reg34[(3'h4):(2'h3)], $signed(reg40)}));
              reg43 <= (wire26 || $unsigned(wire32));
              reg44 <= $signed($signed(reg27));
            end
          else
            begin
              reg42 <= {((|wire25) ?
                      ($signed(reg35[(2'h3):(2'h3)]) ?
                          wire23 : (wire22[(1'h0):(1'h0)] ?
                              (~|reg30) : reg28)) : (wire21[(4'h8):(3'h7)] <<< (wire39 ?
                          $unsigned(reg35) : (|wire23)))),
                  $signed((~^$unsigned((&reg27))))};
              reg43 <= reg30[(3'h5):(1'h0)];
              reg44 <= reg30;
              reg45 <= wire20;
              reg46 <= $signed(wire31);
            end
          reg47 <= $signed($unsigned({(-reg45)}));
          if ($signed($unsigned(wire26)))
            begin
              reg48 <= $signed(($signed($signed((wire37 < wire33))) <<< $signed(reg47[(4'h9):(4'h9)])));
              reg49 <= ($signed((^~(!(reg35 >> wire26)))) ?
                  $unsigned(reg27[(4'h8):(3'h6)]) : $signed($unsigned(reg48)));
              reg50 <= ({(~|$unsigned(wire22))} <<< $signed({reg41[(4'hc):(4'ha)]}));
              reg51 <= $unsigned((!(-(wire25[(1'h1):(1'h1)] ~^ reg40[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg48 <= reg30;
            end
          reg52 <= (reg41[(2'h3):(1'h0)] ?
              ($unsigned(wire37[(1'h1):(1'h1)]) & ($unsigned(reg41) ?
                  wire26[(4'h8):(2'h3)] : (~wire38))) : (($unsigned($signed(wire26)) ?
                  ((7'h40) ?
                      (reg44 ~^ wire38) : (-wire23)) : reg27[(1'h0):(1'h0)]) * ($signed(reg44) | $unsigned(((8'hb1) ?
                  (8'hb3) : wire25)))));
        end
      else
        begin
          reg42 <= (^(8'hb2));
          if ($signed((~|((~$signed(reg52)) & $signed((reg43 >> (8'hb6)))))))
            begin
              reg43 <= $unsigned(({($signed(wire25) ? (+reg28) : (^~reg45)),
                  {(8'hba), reg28}} & reg28[(3'h6):(2'h3)]));
            end
          else
            begin
              reg43 <= ($signed({wire24,
                  ({reg47, reg46} ?
                      wire36[(4'h9):(2'h2)] : (wire31 ?
                          (8'hba) : reg41))}) | reg49);
              reg44 <= (reg27 >>> $signed((~&$unsigned((reg29 ?
                  wire36 : wire25)))));
              reg45 <= (8'hbc);
              reg46 <= $signed($unsigned((^~reg35)));
            end
          reg47 <= $signed((^~$unsigned(((^~wire26) ?
              wire31 : ((8'ha9) ? reg52 : reg52)))));
          reg48 <= wire24[(3'h7):(2'h3)];
        end
      reg53 <= reg41[(4'h8):(4'h8)];
      reg54 <= $unsigned(((({reg27, wire21} & $signed(wire21)) ?
              $unsigned($signed((7'h40))) : wire20[(4'hc):(3'h5)]) ?
          ($signed(reg47[(2'h3):(1'h1)]) ?
              (wire39[(1'h0):(1'h0)] | ((7'h44) ?
                  reg27 : wire33)) : wire25) : (~&($signed(reg40) <<< (reg40 + reg50)))));
    end
  assign wire55 = (reg51 >> (reg48 ?
                      reg34[(2'h2):(1'h1)] : (wire24 ?
                          (+(reg49 | wire36)) : reg50)));
  assign wire56 = wire37[(2'h3):(2'h2)];
  assign wire57 = ({reg34} >= wire20[(4'h8):(3'h5)]);
endmodule

module module133
#(parameter param161 = {(((~^((8'hab) ? (8'h9e) : (8'ha9))) ? ((^~(8'haa)) ? ((8'hb2) & (8'hb2)) : (~|(7'h40))) : ((^~(7'h44)) & {(8'hb0)})) < ((~^(8'ha2)) || ((~^(8'h9e)) == ((8'ha8) ? (8'hbe) : (7'h43))))), (((((8'haf) < (8'hbf)) || ((7'h40) >> (8'hb2))) ~^ ((^~(8'hbe)) ^ ((8'haf) ? (8'hbe) : (8'hbb)))) ? {(((8'ha5) ? (8'hb8) : (8'ha1)) + ((8'h9d) < (8'hb5)))} : ((((8'hb7) ? (8'hb4) : (8'ha5)) ? ((8'ha4) ? (8'hb3) : (8'hb9)) : (|(8'hae))) ? ({(8'hb9)} + ((8'hba) >= (7'h41))) : (^~(-(8'hb1)))))}, 
parameter param162 = (^~((param161 ? ({param161} ? (param161 << param161) : param161) : (8'hb8)) ? (((+param161) < (~param161)) ? ((param161 ? param161 : param161) ^~ (~param161)) : {(param161 < param161), (^~param161)}) : ({(param161 < param161), (param161 ? param161 : param161)} - ((param161 > (8'hb5)) || ((7'h41) ? param161 : param161))))))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire137;
  input wire [(4'h9):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  input wire [(2'h2):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire signed [(3'h5):(1'h0)] wire157;
  wire [(4'h8):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire signed [(4'hc):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire138;
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 (1'h0)};
  assign wire138 = $signed(wire134[(1'h0):(1'h0)]);
  assign wire139 = (wire136[(2'h2):(1'h1)] ^~ $unsigned((+(!(+wire135)))));
  assign wire140 = $signed($unsigned(wire139));
  assign wire141 = $unsigned(((8'hb5) > wire135[(3'h4):(2'h3)]));
  assign wire142 = {(^wire138),
                       ((((wire138 ? wire136 : wire138) ?
                               wire138 : $signed(wire136)) >> (8'had)) ?
                           wire137 : wire138[(1'h1):(1'h1)])};
  assign wire143 = wire137[(4'h8):(4'h8)];
  assign wire144 = $signed(wire141);
  assign wire145 = (^~wire136);
  assign wire146 = $signed($signed((!(8'ha6))));
  assign wire147 = wire139;
  assign wire148 = (($signed($signed(wire144)) | ((8'hba) ?
                           wire144 : $unsigned({wire144, wire146}))) ?
                       $unsigned({($unsigned(wire143) ^~ (wire140 ?
                               wire134 : wire141))}) : wire145);
  assign wire149 = ($unsigned((($unsigned(wire142) ?
                       wire147 : (wire137 ?
                           wire138 : wire138)) == wire143[(2'h3):(2'h2)])) >= {$signed($unsigned($signed((8'hb0)))),
                       (((&(8'hbd)) ? {wire138} : (|(8'hbc))) >> (8'h9f))});
  assign wire150 = $signed(wire146[(3'h7):(3'h7)]);
  assign wire151 = wire142[(2'h2):(1'h0)];
  assign wire152 = (+((wire146[(4'hd):(4'hc)] | (|wire148)) ?
                       wire137 : wire143[(3'h7):(1'h0)]));
  assign wire153 = wire134;
  assign wire154 = $unsigned(wire134[(2'h2):(1'h1)]);
  assign wire155 = {$signed(wire142[(4'hd):(1'h0)]), wire139};
  assign wire156 = {$unsigned((~&wire147[(3'h5):(1'h1)]))};
  assign wire157 = $signed((((~wire139[(5'h10):(1'h1)]) ?
                       wire136[(3'h6):(1'h0)] : $signed((wire152 + wire140))) - (~|($signed(wire154) ?
                       $signed(wire139) : wire155))));
  assign wire158 = ({($signed($unsigned(wire140)) ?
                               wire157[(3'h4):(3'h4)] : $unsigned((~|wire138))),
                           ($unsigned($unsigned(wire138)) + $unsigned($unsigned(wire150)))} ?
                       ($signed((wire139[(3'h6):(3'h6)] >> ((8'ha8) <= wire134))) != (~&$unsigned($unsigned(wire149)))) : $unsigned((((wire141 << wire157) ?
                               ((7'h42) ?
                                   wire147 : wire154) : $unsigned(wire140)) ?
                           $unsigned(wire146) : wire142[(4'h9):(4'h9)])));
  assign wire159 = ((-wire138[(3'h6):(1'h1)]) <<< $unsigned((-$unsigned((^wire149)))));
  assign wire160 = ((+$signed($signed($signed((8'hb4))))) ?
                       (~wire143) : $unsigned(((-$unsigned(wire155)) ?
                           (wire138[(1'h1):(1'h0)] * wire156[(2'h3):(2'h2)]) : $signed((wire138 ?
                               wire145 : wire157)))));
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire104;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire signed [(4'hb):(1'h0)] wire101;
  input wire signed [(4'he):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire105;
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire117,
                 wire116,
                 wire114,
                 wire105,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg115,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire105 = $signed($unsigned(wire100));
  always
    @(posedge clk) begin
      if ((wire104[(3'h7):(3'h6)] ?
          ({$signed($unsigned((8'h9e))),
              (wire101[(3'h6):(3'h6)] >> (^wire100))} > (~^wire100[(4'he):(4'h8)])) : wire100[(3'h7):(1'h0)]))
        begin
          reg106 <= ((($signed($signed(wire101)) ~^ ($signed(wire100) ?
              {wire101} : wire102[(1'h1):(1'h0)])) ~^ (wire104[(5'h13):(1'h0)] ?
              (^~(&wire102)) : wire104)) << ($unsigned((wire101[(4'ha):(3'h4)] ?
              wire105 : (!(8'hb5)))) | $unsigned(wire104[(2'h2):(1'h0)])));
          reg107 <= {$unsigned(reg106[(4'hb):(4'ha)])};
          reg108 <= wire104;
          reg109 <= (~|$unsigned(({wire104[(5'h13):(1'h0)]} ?
              {$signed(wire101)} : (reg106[(3'h4):(2'h3)] ?
                  (wire104 ~^ wire104) : reg106))));
        end
      else
        begin
          if ((8'h9e))
            begin
              reg106 <= $signed($unsigned($unsigned((wire105 << wire104))));
              reg107 <= (^(!$unsigned(((!wire101) || (wire100 ?
                  reg106 : (8'hb6))))));
              reg108 <= (reg106[(1'h0):(1'h0)] >>> reg106[(4'hf):(1'h1)]);
            end
          else
            begin
              reg106 <= {(|(!((wire102 <<< reg107) ^~ (wire103 || reg107)))),
                  (7'h40)};
              reg107 <= reg107[(4'ha):(4'ha)];
            end
        end
      reg110 <= wire105[(4'h8):(3'h6)];
      reg111 <= (|{$unsigned(($signed(wire104) ? {reg108, reg108} : wire102)),
          (($unsigned(wire104) >>> (!(8'ha5))) ?
              $unsigned(wire101[(3'h6):(3'h6)]) : ((wire104 >> wire102) - (wire100 ?
                  reg107 : wire100)))});
      reg112 <= ({(((^~reg109) >= ((7'h44) ?
              wire104 : wire102)) + ({reg109} + ((8'ha0) ^~ reg106))),
          $unsigned({(reg109 <= wire100)})} | $signed({(-(wire101 && reg111)),
          ((wire104 <= reg106) >= wire101[(1'h0):(1'h0)])}));
      reg113 <= (reg106[(4'hf):(4'ha)] ?
          ((~|((+reg108) >> (!reg107))) >= $unsigned($unsigned($unsigned(wire101)))) : wire101);
    end
  assign wire114 = $unsigned($unsigned((reg108[(3'h7):(3'h7)] ^~ $unsigned((wire101 >>> wire100)))));
  always
    @(posedge clk) begin
      reg115 <= $signed((~$signed(({reg113} >>> (wire101 || wire100)))));
    end
  assign wire116 = ((8'ha4) ?
                       (^~$unsigned({(^~(8'hb9)),
                           $signed((7'h41))})) : (($unsigned((reg106 <<< reg108)) ?
                               $unsigned($unsigned(reg112)) : wire105) ?
                           $unsigned($unsigned((reg115 ?
                               wire114 : reg110))) : reg115));
  assign wire117 = {{$signed({(-reg112)})}};
  always
    @(posedge clk) begin
      reg118 <= reg109[(2'h3):(2'h3)];
      reg119 <= $signed($signed(($unsigned($signed(wire117)) ?
          $unsigned((reg118 * reg110)) : ($unsigned(wire105) == wire114))));
      reg120 <= (+{$signed(((^~reg113) ? reg111 : wire101)),
          wire103[(1'h0):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg121 <= $signed((((|(reg113 >>> (8'ha2))) ?
          (wire114 ?
              wire105[(3'h7):(3'h7)] : wire105) : $signed(wire104[(3'h7):(3'h4)])) <= wire102));
      reg122 <= wire100;
      reg123 <= (~^reg120[(1'h1):(1'h0)]);
    end
  assign wire124 = {reg110[(2'h2):(1'h1)]};
  assign wire125 = reg112[(2'h3):(1'h0)];
  assign wire126 = (reg110 ?
                       (~^wire124) : $signed((((reg113 ?
                           wire101 : reg110) != $unsigned(wire104)) + wire102[(4'ha):(3'h5)])));
  assign wire127 = $signed(wire104[(4'hc):(1'h0)]);
endmodule

module module77
#(parameter param94 = (8'hb7))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire82;
  input wire [(4'h9):(1'h0)] wire81;
  input wire [(3'h5):(1'h0)] wire80;
  input wire [(3'h4):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg89,
                 (1'h0)};
  assign wire83 = $signed((($unsigned($unsigned(wire81)) >= (!$unsigned(wire79))) ?
                      wire81 : {((wire82 > wire79) & (wire81 - wire81)),
                          (wire79[(1'h0):(1'h0)] >> (+wire79))}));
  assign wire84 = {wire82};
  assign wire85 = $unsigned(wire79[(3'h4):(1'h0)]);
  assign wire86 = ({wire84[(1'h0):(1'h0)], (^~$signed($unsigned(wire83)))} ?
                      (((!$unsigned((7'h42))) ?
                              $signed(wire85[(2'h3):(2'h2)]) : wire82) ?
                          wire78 : $unsigned(wire80)) : $unsigned(wire85));
  assign wire87 = (($unsigned((~^$unsigned(wire78))) == wire78) * wire80[(2'h3):(2'h2)]);
  assign wire88 = wire86[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg89 <= $unsigned((~^wire87));
    end
  assign wire90 = (~^(wire81[(3'h6):(1'h0)] ?
                      (wire88[(1'h0):(1'h0)] ?
                          $signed($unsigned(wire82)) : (wire84 + $signed(wire88))) : ($signed((8'hac)) & wire85)));
  assign wire91 = ($unsigned($signed($signed((^wire79)))) ?
                      ($unsigned((~(-wire80))) ?
                          {wire79[(1'h0):(1'h0)],
                              wire88} : $unsigned(((-wire82) >= $unsigned(reg89)))) : wire78[(3'h4):(2'h3)]);
  assign wire92 = wire91;
  assign wire93 = wire80;
endmodule
