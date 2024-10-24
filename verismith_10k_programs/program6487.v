module top
#(parameter param164 = ((^~((((8'ha9) <<< (8'ha7)) || ((8'hb8) ? (8'hab) : (8'hbb))) ~^ (((8'ha3) ? (7'h41) : (8'h9e)) != ((8'haf) ~^ (8'hb0))))) << ((((+(8'ha5)) <= {(8'ha9)}) > (((8'haf) << (8'hab)) ? ((8'ha4) ? (8'ha5) : (8'hb6)) : (~(8'hb0)))) - {(((8'hab) ? (8'hb7) : (8'hbe)) ^ ((8'hb8) >> (8'hb3)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire140;
  assign y = {wire162,
                 wire142,
                 wire4,
                 wire62,
                 wire64,
                 wire65,
                 wire66,
                 wire140,
                 (1'h0)};
  assign wire4 = $unsigned((8'h9e));
  module5 #() modinst63 (wire62, clk, wire3, wire0, wire4, wire1);
  assign wire64 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire65 = ($unsigned(wire62) << $signed(wire4[(3'h4):(3'h4)]));
  assign wire66 = $signed($signed({((8'had) ?
                          (wire3 >>> (8'hb6)) : $unsigned(wire64)),
                      ({wire1} ? wire3 : $signed(wire2))}));
  module67 #() modinst141 (wire140, clk, wire4, wire1, wire2, wire3, wire62);
  assign wire142 = (&(8'hb7));
  module143 #() modinst163 (wire162, clk, wire62, wire2, wire1, wire3);
endmodule

module module143
#(parameter param161 = (|(~|((~^((8'hbc) == (8'hb6))) ? {((8'ha7) << (8'ha8)), (~(8'hbe))} : ((^(7'h42)) ? ((8'had) ? (8'hb3) : (8'haf)) : (!(8'ha0)))))))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire147;
  input wire [(2'h3):(1'h0)] wire146;
  input wire [(5'h15):(1'h0)] wire145;
  input wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire148;
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire149,
                 wire148,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire148 = ($signed((8'ha6)) ?
                       wire144 : (wire146 >>> ($unsigned((wire144 && wire147)) ?
                           (((8'ha3) ? wire147 : wire146) ?
                               $signed(wire146) : (~&wire145)) : (8'haf))));
  assign wire149 = ({$signed((|(wire144 ? wire146 : wire145)))} ?
                       $signed((($unsigned((8'hb7)) ?
                               $signed(wire146) : wire145[(5'h12):(4'hc)]) ?
                           wire146 : wire146)) : wire144[(4'hb):(3'h7)]);
  always
    @(posedge clk) begin
      reg150 <= (+(wire146 ^ (^~wire144)));
      if (wire146)
        begin
          reg151 <= wire148[(2'h2):(1'h1)];
          reg152 <= ($unsigned(wire145) | wire145[(5'h15):(5'h14)]);
          reg153 <= wire146[(2'h2):(1'h1)];
          reg154 <= ((($signed((reg152 ? wire146 : reg150)) ?
              $signed((~reg150)) : reg151) >= wire148[(3'h5):(2'h2)]) ^~ (((~|wire145[(4'ha):(2'h3)]) == wire144[(3'h5):(1'h1)]) ?
              $signed({(^~wire149)}) : (8'ha9)));
          reg155 <= (~|(~|reg152));
        end
      else
        begin
          reg151 <= $unsigned(((wire148 ?
              $unsigned((wire148 ? (8'hb4) : reg155)) : ((reg152 | reg155) ?
                  ((8'hbf) ?
                      (8'had) : reg151) : wire146[(1'h0):(1'h0)])) <= reg153));
          reg152 <= {reg155[(2'h3):(1'h0)], $signed(reg150)};
          if ((~^wire148))
            begin
              reg153 <= wire149;
              reg154 <= $signed((-$unsigned((&reg151[(2'h2):(1'h1)]))));
              reg155 <= (wire147[(3'h7):(3'h5)] ?
                  (8'ha6) : (~|(reg150 ? (-wire148) : $unsigned((~reg150)))));
            end
          else
            begin
              reg153 <= $unsigned((^~(+wire146[(1'h1):(1'h0)])));
              reg154 <= (reg153 | (reg155[(4'h9):(3'h6)] ?
                  $signed(($signed(wire145) ?
                      $unsigned(wire147) : wire146[(1'h0):(1'h0)])) : wire149));
            end
          reg156 <= $unsigned($unsigned($unsigned(((reg154 << (8'h9d)) >>> ((8'hb3) < reg151)))));
          reg157 <= (wire148 ?
              reg150[(1'h1):(1'h1)] : $signed(wire147[(2'h2):(1'h1)]));
        end
      reg158 <= ({wire144,
          $signed((|$unsigned(reg156)))} ^ $unsigned({$unsigned((&reg157)),
          $signed((reg151 ? wire146 : wire144))}));
    end
  assign wire159 = $signed((((((8'hbc) <= wire147) <<< (reg150 <<< wire145)) ?
                       (reg154 != $signed(wire145)) : reg150[(1'h1):(1'h1)]) == reg152[(1'h0):(1'h0)]));
  assign wire160 = $unsigned(wire147);
endmodule

module module67
#(parameter param138 = {(((((8'hbc) ? (7'h41) : (8'hb7)) ? ((8'ha3) ? (8'ha1) : (7'h44)) : ((8'ha9) ? (8'h9f) : (8'haa))) - ({(8'ha2), (8'ha5)} ? (8'hb4) : ((8'hb9) ? (8'hb2) : (8'haf)))) + (8'hbc))}, 
parameter param139 = (-(param138 ? param138 : (param138 ^ {(param138 ? param138 : param138)}))))
(y, clk, wire68, wire69, wire70, wire71, wire72);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire68;
  input wire [(4'h8):(1'h0)] wire69;
  input wire [(3'h7):(1'h0)] wire70;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire128;
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire73,
                 wire74,
                 wire128,
                 (1'h0)};
  assign wire73 = wire70[(3'h7):(2'h2)];
  assign wire74 = wire70[(2'h3):(1'h0)];
  module75 #() modinst129 (wire128, clk, wire70, wire68, wire69, wire74, wire73);
  assign wire130 = ((~^(($unsigned(wire73) ~^ (wire71 ?
                       wire74 : wire73)) >>> ((8'hbf) * (wire69 >>> wire71)))) != wire128);
  assign wire131 = wire71[(5'h10):(3'h7)];
  assign wire132 = $signed(wire131[(2'h2):(1'h0)]);
  assign wire133 = $unsigned($unsigned($unsigned(wire68)));
  assign wire134 = {{(wire128 ? $signed(wire70[(2'h2):(2'h2)]) : wire128),
                           wire128[(2'h2):(1'h0)]}};
  assign wire135 = (~^{wire134[(1'h0):(1'h0)]});
  assign wire136 = wire128[(3'h5):(1'h0)];
  assign wire137 = ({($signed((wire72 ?
                           wire131 : wire134)) & (^~wire69))} != ($signed(wire74) >>> wire68[(5'h10):(2'h3)]));
endmodule

module module5
#(parameter param61 = (8'ha3))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire55;
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire10,
                 wire55,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = ((+{$signed(wire8), (&wire8[(4'h9):(3'h7)])}) ?
                      ({wire7[(1'h1):(1'h0)]} ?
                          wire7 : $signed($unsigned($unsigned(wire8)))) : ((~$unsigned(wire7)) ?
                          {($unsigned(wire9) ?
                                  $signed((8'hbb)) : (wire6 < (8'ha1))),
                              wire6[(3'h4):(2'h2)]} : {(+$unsigned(wire8))}));
  always
    @(posedge clk) begin
      reg11 <= $unsigned(wire8[(4'ha):(4'ha)]);
      reg12 <= wire6;
    end
  module13 #() modinst56 (.y(wire55), .wire16(wire10), .wire18(reg11), .wire14(reg12), .clk(clk), .wire15(wire9), .wire17(wire8));
  assign wire57 = $signed((&wire55));
  assign wire58 = wire7[(3'h4):(2'h3)];
  assign wire59 = $signed($signed($signed(((-wire7) + wire9))));
  assign wire60 = ($signed(wire9[(4'hd):(3'h4)]) ?
                      {((+$signed(reg11)) - $signed($signed(wire10)))} : $signed(wire6[(2'h3):(2'h2)]));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg21,
                 (1'h0)};
  assign wire19 = {($unsigned({$signed(wire18),
                          wire16}) && (wire14[(3'h7):(3'h7)] ?
                          $signed((~&wire16)) : wire18))};
  assign wire20 = (|(~|(~^$unsigned((-wire19)))));
  always
    @(posedge clk) begin
      reg21 <= wire16[(2'h3):(1'h1)];
    end
  assign wire22 = $signed(wire15[(4'he):(4'hb)]);
  assign wire23 = (((wire20 ? $signed($signed(wire20)) : $signed((^~wire16))) ?
                          (((wire14 ?
                              wire20 : wire19) < (&(8'ha4))) + wire16) : (((wire14 <<< (8'h9f)) ?
                                  wire19[(3'h5):(3'h5)] : (~wire22)) ?
                              wire16 : wire20)) ?
                      (+{(((8'ha8) ?
                              wire20 : (8'hb3)) != (^~(8'h9d)))}) : (-(({wire18,
                              wire14} ?
                          $signed(reg21) : wire17[(3'h5):(1'h1)]) & (~&$unsigned(wire14)))));
  assign wire24 = {(~^wire14[(2'h3):(2'h3)])};
  assign wire25 = wire22[(5'h10):(4'ha)];
  assign wire26 = $signed(wire22);
  assign wire27 = wire16[(2'h3):(1'h0)];
  assign wire28 = $signed({wire14[(2'h3):(2'h3)]});
  assign wire29 = $unsigned($signed($signed(((~wire16) ?
                      $unsigned(wire18) : (wire22 ? wire23 : (8'ha8))))));
  assign wire30 = (^{(~^wire17[(3'h4):(2'h3)])});
  assign wire31 = (((((wire25 ?
                          wire17 : (7'h43)) != wire29) && ($signed(wire25) * $unsigned(wire30))) << wire29) ?
                      $signed(wire24) : (wire18[(3'h4):(2'h3)] < wire20[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ({(($unsigned(wire22) ?
                  {(wire15 >= (8'hbb)),
                      $unsigned(wire22)} : reg21[(1'h0):(1'h0)]) ?
              ($signed($unsigned(wire26)) ?
                  ($unsigned(wire27) ?
                      (!(8'ha3)) : (wire22 ?
                          wire14 : wire30)) : (8'ha8)) : $unsigned($unsigned(wire28)))})
        begin
          reg32 <= $unsigned($unsigned((($signed((8'hb0)) ^ wire31) == ($signed(wire19) < wire23[(3'h6):(1'h1)]))));
        end
      else
        begin
          reg32 <= $unsigned(wire23[(4'ha):(4'h9)]);
          if (($signed($signed(wire19[(4'ha):(3'h4)])) >> wire20[(1'h0):(1'h0)]))
            begin
              reg33 <= wire29[(2'h2):(1'h0)];
              reg34 <= wire22;
              reg35 <= reg33;
            end
          else
            begin
              reg33 <= wire31;
              reg34 <= $unsigned(wire27);
              reg35 <= (8'h9d);
              reg36 <= {wire17[(4'hc):(2'h2)]};
            end
          reg37 <= ($unsigned((~$signed($signed(wire26)))) ?
              (($unsigned({reg21}) != (|{reg21, wire25})) ?
                  $signed((~&$signed((8'ha9)))) : $unsigned(reg36[(2'h3):(1'h0)])) : (^$signed(wire25)));
          reg38 <= $unsigned($unsigned((((wire15 << reg21) - (wire19 ?
              wire23 : reg35)) && (reg33 <= (wire25 ? reg21 : wire25)))));
          if ({((-wire29) ?
                  (((reg21 ?
                      wire29 : wire16) == (~|wire22)) ~^ $unsigned(wire15)) : $signed(reg38[(4'hb):(1'h0)]))})
            begin
              reg39 <= wire30;
              reg40 <= $unsigned($signed({{$signed(wire15)},
                  (~&wire19[(4'h8):(2'h3)])}));
            end
          else
            begin
              reg39 <= (~^((&(~$signed(wire22))) < (~&{(&reg36)})));
              reg40 <= wire16[(2'h2):(1'h0)];
              reg41 <= $signed((~(^{$unsigned(wire16), reg33[(1'h1):(1'h1)]})));
              reg42 <= (8'h9d);
              reg43 <= (~|(^wire15[(4'h8):(3'h5)]));
            end
        end
      reg44 <= reg21[(1'h1):(1'h0)];
      if ((wire15[(3'h6):(3'h6)] != (wire31[(3'h5):(1'h1)] ?
          reg41[(1'h1):(1'h1)] : $unsigned($signed(reg32)))))
        begin
          if (reg41)
            begin
              reg45 <= $unsigned(wire17);
            end
          else
            begin
              reg45 <= reg43;
              reg46 <= (wire29[(1'h0):(1'h0)] ? reg45[(3'h4):(1'h0)] : reg44);
              reg47 <= wire14;
              reg48 <= ((wire18 < {$unsigned($signed(reg44)), (~^(-wire29))}) ?
                  ($unsigned(reg37[(3'h4):(2'h2)]) + wire15) : (+$unsigned(reg34[(3'h6):(1'h0)])));
              reg49 <= ($unsigned($unsigned(reg34[(3'h6):(3'h6)])) | reg37[(3'h4):(2'h3)]);
            end
          reg50 <= $unsigned($unsigned((~^$signed((wire24 & (8'ha9))))));
        end
      else
        begin
          reg45 <= wire17[(4'hd):(4'h8)];
          reg46 <= $signed($unsigned({({wire29, reg44} & (reg49 ?
                  reg43 : (8'hb3))),
              reg41[(2'h3):(2'h2)]}));
          reg47 <= ((((8'haf) + wire24[(4'ha):(3'h7)]) ^ wire22) ?
              wire16 : ($signed($signed(wire28)) ?
                  reg32[(2'h2):(1'h0)] : wire30[(3'h6):(2'h3)]));
          reg48 <= ((&((~(reg45 ?
              reg45 : reg41)) | $signed(wire17[(2'h2):(2'h2)]))) >>> {(~^(wire26[(3'h4):(1'h1)] ^~ $signed((7'h41)))),
              {(7'h40), (~|(^~reg39))}});
          reg49 <= $unsigned((reg40 >> (reg36[(3'h6):(3'h4)] ?
              (|(~|wire17)) : $unsigned((^~reg43)))));
        end
      reg51 <= $unsigned((reg48[(4'hb):(1'h1)] | (^wire19)));
    end
  assign wire52 = (~&(8'hb4));
  assign wire53 = (&(~|reg50[(3'h6):(1'h1)]));
  assign wire54 = (-reg33);
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire77;
  input wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire93,
                 wire92,
                 wire83,
                 wire82,
                 wire81,
                 reg127,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire81 = wire78[(1'h1):(1'h1)];
  assign wire82 = wire81;
  assign wire83 = $signed((((&wire78) - {wire82[(1'h1):(1'h1)]}) - wire82[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($unsigned((~^wire79[(4'h9):(4'h9)])))
        begin
          reg84 <= wire77;
        end
      else
        begin
          reg84 <= {($signed((wire80 ? {wire83} : {wire76})) ~^ {wire78})};
          reg85 <= wire78[(2'h2):(2'h2)];
          if (reg84)
            begin
              reg86 <= $unsigned($unsigned($unsigned(reg85)));
            end
          else
            begin
              reg86 <= $signed((!((((8'ha1) == reg85) & wire82[(1'h0):(1'h0)]) << wire82[(2'h3):(2'h2)])));
              reg87 <= {wire79};
            end
          reg88 <= $unsigned((reg85[(3'h4):(2'h3)] ?
              wire81 : (($signed(wire83) << {wire82, wire81}) ^ wire78)));
        end
      reg89 <= $unsigned(reg86[(2'h3):(2'h2)]);
      reg90 <= (wire77[(5'h12):(4'hd)] ?
          $unsigned($signed(((~(8'ha5)) || $signed(wire78)))) : $signed($unsigned(wire80[(3'h4):(1'h0)])));
      reg91 <= (wire83 ?
          $unsigned(wire78) : (({(wire78 - wire82)} * ($unsigned(wire83) ^~ (wire83 ?
              reg86 : wire78))) ^~ $signed($signed((-wire82)))));
    end
  assign wire92 = $unsigned(((((wire82 ? reg88 : wire78) ?
                          $unsigned(wire78) : $signed(reg85)) ?
                      (8'hbd) : wire76[(4'hc):(1'h0)]) >> (8'hb4)));
  assign wire93 = (-reg88);
  always
    @(posedge clk) begin
      if ((!(8'ha5)))
        begin
          reg94 <= {(^{($signed(reg84) ? $unsigned(wire82) : reg88)})};
          reg95 <= (+reg88);
        end
      else
        begin
          reg94 <= wire80[(1'h1):(1'h1)];
        end
      reg96 <= (wire80 ?
          (((~|$signed(wire92)) ? $signed(reg88) : (~^wire80)) ?
              reg94 : $unsigned($signed(reg90))) : $signed({(((8'h9d) ?
                      (8'haf) : wire93) ?
                  (^~wire78) : $signed(wire82)),
              wire79}));
      reg97 <= wire78;
    end
  always
    @(posedge clk) begin
      reg98 <= reg89[(1'h1):(1'h0)];
      reg99 <= ((~^wire83) ? reg91[(1'h0):(1'h0)] : wire77);
      reg100 <= $unsigned((reg86 + ($signed($unsigned(wire80)) ?
          reg90 : ($unsigned(wire76) ? $signed(wire77) : $unsigned((7'h43))))));
      reg101 <= $signed(((~|reg95) ^ $signed((~&$signed(wire78)))));
    end
  assign wire102 = wire81;
  assign wire103 = reg97[(3'h4):(2'h3)];
  assign wire104 = reg91;
  assign wire105 = $unsigned(($signed((+{reg99, reg99})) ^ wire102));
  always
    @(posedge clk) begin
      reg106 <= reg90;
      reg107 <= wire81;
      reg108 <= ({wire81[(1'h1):(1'h1)]} * (~^wire79));
      reg109 <= (~^(((reg108[(5'h10):(4'hb)] ?
              (reg89 ? reg84 : (8'hb6)) : (~&wire82)) ?
          (8'hba) : reg98[(2'h2):(1'h0)]) >> {(~reg88[(2'h3):(1'h0)]),
          wire93[(3'h5):(2'h3)]}));
    end
  always
    @(posedge clk) begin
      reg110 <= (($signed((reg90 <= (-reg84))) ?
              reg95[(2'h2):(1'h0)] : wire81[(1'h0):(1'h0)]) ?
          $unsigned(wire93) : ($signed(((reg95 < (8'hb0)) >= (wire82 ?
                  wire83 : (8'hb3)))) ?
              wire79[(4'hb):(1'h1)] : (($signed(reg99) ?
                      (reg107 + (8'hae)) : ((7'h41) >> (8'hb2))) ?
                  ($signed(reg100) ?
                      ((7'h44) ?
                          wire104 : (7'h40)) : reg84[(5'h13):(4'hc)]) : $signed(wire103))));
      reg111 <= ({($unsigned({wire92}) ?
              reg100[(1'h0):(1'h0)] : (reg101 ?
                  (reg87 ? reg89 : wire105) : (wire83 ^ wire79)))} & wire105);
      if (($signed(wire76[(4'h8):(3'h7)]) ?
          $signed(reg96[(2'h3):(2'h3)]) : $signed($unsigned($signed(wire105)))))
        begin
          reg112 <= (~^reg87);
          reg113 <= wire80;
        end
      else
        begin
          reg112 <= wire102[(1'h0):(1'h0)];
          if (reg98[(3'h6):(3'h5)])
            begin
              reg113 <= (8'hb9);
              reg114 <= (wire102[(2'h2):(1'h0)] ?
                  {(8'hb4)} : ($signed($signed({(8'h9e),
                      (8'ha2)})) == $unsigned($unsigned((7'h43)))));
              reg115 <= $unsigned((+$unsigned(reg106[(4'ha):(2'h3)])));
            end
          else
            begin
              reg113 <= (~&($unsigned(($unsigned((8'had)) ?
                      (~|(7'h44)) : (reg94 < reg107))) ?
                  reg94 : ($signed((~|reg113)) << $unsigned(reg108))));
              reg114 <= reg87[(2'h3):(2'h2)];
            end
          if (((($signed($unsigned(wire77)) ?
                  wire83[(5'h10):(2'h3)] : $unsigned($unsigned(reg110))) ?
              $signed(({reg87,
                  wire105} ^~ reg112[(1'h1):(1'h0)])) : ((^~$signed((8'ha1))) ?
                  ($signed(reg88) ?
                      {reg101} : (wire78 ?
                          reg114 : reg108)) : (wire80 + (reg91 ?
                      wire76 : wire93)))) <<< reg86))
            begin
              reg116 <= ({$unsigned((wire79[(4'h9):(4'h9)] ?
                      {reg101} : wire93)),
                  (^(!(wire105 ?
                      reg87 : reg101)))} > $unsigned($unsigned((7'h40))));
              reg117 <= $unsigned((-$unsigned($signed((~|wire92)))));
            end
          else
            begin
              reg116 <= ((!$unsigned(reg89[(1'h0):(1'h0)])) ?
                  ($unsigned(((wire76 ~^ (8'ha1)) >= $signed(wire104))) ?
                      ($unsigned((^reg99)) ?
                          (~|$unsigned(wire76)) : (8'ha2)) : reg100) : $unsigned({(^~reg109)}));
              reg117 <= wire77;
              reg118 <= ($signed(wire77) * $signed($signed((((8'hb9) ~^ reg88) ?
                  reg107[(4'ha):(3'h6)] : $signed(reg89)))));
              reg119 <= $signed($signed((reg115 != $unsigned((reg94 ^~ reg111)))));
              reg120 <= ($signed(($unsigned($signed(reg88)) ?
                      ((~^wire79) ?
                          (wire81 - (8'hb5)) : ((8'hbf) ?
                              wire78 : reg95)) : ((^~reg117) ?
                          ((8'h9c) ? reg97 : reg86) : $unsigned(wire76)))) ?
                  (reg111 == $signed((reg84[(5'h13):(5'h13)] && {reg111,
                      (7'h42)}))) : (wire80 >= {((reg110 && wire103) ?
                          ((8'had) ? reg108 : reg90) : wire81)}));
            end
        end
      reg121 <= wire105;
    end
  assign wire122 = wire81;
  assign wire123 = (^~reg86);
  assign wire124 = {(~(reg91 ?
                           (8'h9f) : ((wire93 ? reg101 : wire83) >>> (wire80 ?
                               reg113 : wire80))))};
  assign wire125 = reg100;
  assign wire126 = (&$signed(wire125));
  always
    @(posedge clk) begin
      reg127 <= (-$unsigned({reg97[(3'h5):(3'h4)],
          (|(wire76 ? reg96 : wire79))}));
    end
endmodule
