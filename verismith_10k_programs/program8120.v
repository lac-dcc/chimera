module top
#(parameter param163 = {(&{((^~(8'ha7)) || {(8'ha8)}), (!(7'h43))}), (+((8'hb8) <<< (8'ha7)))}, 
parameter param164 = (8'ha6))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire149;
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire151,
                 wire145,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire80,
                 wire147,
                 wire149,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned($signed($unsigned($signed((^wire3)))));
  assign wire6 = (((~&({wire2} < (wire2 <<< wire0))) ?
                     ((wire5 || (8'ha5)) ?
                         wire0[(4'ha):(4'ha)] : (~$unsigned(wire3))) : $unsigned(((^~wire0) + $unsigned(wire4)))) < wire4[(5'h14):(4'ha)]);
  assign wire7 = $unsigned($unsigned(wire2));
  assign wire8 = ((|((wire4[(4'ha):(4'ha)] ?
                     (wire3 << wire0) : ((8'haf) + wire3)) >= wire1)) * (((wire2 ~^ (wire5 & wire6)) + $signed((+wire4))) ?
                     (wire2[(2'h2):(2'h2)] | ($unsigned(wire4) == {wire3,
                         wire2})) : $unsigned(wire6)));
  always
    @(posedge clk) begin
      reg9 <= wire8;
      reg10 <= ((wire2[(1'h0):(1'h0)] >= (~|($unsigned(wire2) ?
          {wire0, wire3} : wire1))) ~^ $unsigned((&$unsigned($signed(wire0)))));
    end
  assign wire11 = (reg9[(3'h4):(2'h2)] ? wire1 : reg9[(4'hb):(2'h3)]);
  assign wire12 = (+{((+$signed(wire2)) ?
                          $signed(((8'hb7) ?
                              reg10 : wire7)) : $unsigned((wire7 ?
                              wire5 : wire7)))});
  assign wire13 = $signed((|(+(!reg10[(3'h7):(1'h0)]))));
  assign wire14 = wire4;
  assign wire15 = (8'hbd);
  assign wire16 = $signed(wire8[(1'h0):(1'h0)]);
  assign wire17 = $signed(wire1);
  module18 #() modinst81 (.wire20(wire7), .wire23(wire5), .y(wire80), .wire22(wire1), .clk(clk), .wire21(wire4), .wire19(wire6));
  module82 #() modinst146 (.wire83(wire80), .wire84(reg9), .y(wire145), .clk(clk), .wire85(wire6), .wire87(wire3), .wire86(reg10));
  module124 #() modinst148 (.wire127(wire3), .wire125(wire145), .wire126(wire15), .clk(clk), .wire128(wire8), .y(wire147));
  module25 #() modinst150 (wire149, clk, wire11, wire145, wire2, wire147, wire1);
  assign wire151 = wire149;
  module88 #() modinst153 (.clk(clk), .wire90(wire8), .wire89(wire149), .wire91(wire16), .y(wire152), .wire92(wire17), .wire93(reg10));
  assign wire154 = ((wire15 ?
                           $unsigned($unsigned({wire145})) : $unsigned((reg9 && ((8'hb1) ?
                               wire145 : (8'hb5))))) ?
                       $unsigned((~^wire17)) : (-(wire145 ?
                           $unsigned(wire80[(1'h1):(1'h1)]) : reg9[(4'ha):(2'h2)])));
  assign wire155 = (~(-$unsigned((wire147 ? wire145 : (8'hb5)))));
  assign wire156 = $unsigned(wire7[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg157 <= wire8[(3'h4):(2'h3)];
      if ((wire80 ? {wire2, wire156} : wire12[(4'hb):(1'h0)]))
        begin
          reg158 <= $unsigned((((8'hb1) ?
              $signed((^wire2)) : (wire15[(1'h1):(1'h1)] | (wire147 >= wire7))) ^~ $unsigned((!(wire156 ?
              wire16 : wire145)))));
        end
      else
        begin
          if (wire152[(1'h1):(1'h1)])
            begin
              reg158 <= (wire80 ^ wire3);
            end
          else
            begin
              reg158 <= ({($unsigned(wire15[(4'h9):(3'h7)]) && $signed((^~wire149)))} ?
                  wire16 : wire156);
              reg159 <= ((wire5 ?
                  {{{(8'ha9), (8'hb9)},
                          $unsigned((8'hbe))}} : $signed(($signed(wire11) ?
                      (wire17 <= wire17) : (wire80 >>> (8'hbb))))) >> $unsigned(wire14));
              reg160 <= (!((|$unsigned((~|wire11))) ~^ wire155[(1'h1):(1'h1)]));
            end
          if (reg159[(4'hb):(3'h5)])
            begin
              reg161 <= $unsigned((($signed((wire145 ? wire17 : wire16)) ?
                      $unsigned($unsigned(wire155)) : (reg10[(4'ha):(1'h0)] ^~ (^wire149))) ?
                  (((wire0 > reg158) & $signed(wire154)) <<< ({wire12,
                      wire7} >>> $signed(wire15))) : (~&($unsigned((8'hab)) ?
                      reg158[(3'h7):(2'h2)] : wire16[(4'hf):(3'h6)]))));
            end
          else
            begin
              reg161 <= ((^$signed({$signed((8'hb6)), (8'ha9)})) ?
                  {reg158[(2'h3):(1'h1)],
                      ((~|$unsigned(wire5)) ?
                          $unsigned((wire2 >> wire147)) : $unsigned((reg159 ?
                              wire145 : reg157)))} : {$signed((-wire8[(4'hb):(3'h7)])),
                      (7'h43)});
            end
        end
      reg162 <= $signed($signed($signed(($signed((8'ha5)) ^ (wire7 >> wire12)))));
    end
endmodule

module module82  (y, clk, wire83, wire84, wire85, wire86, wire87);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire84;
  input wire signed [(5'h11):(1'h0)] wire85;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire [(5'h13):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire139;
  wire [(3'h5):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire122;
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire139,
                 wire137,
                 wire122,
                 reg141,
                 (1'h0)};
  module88 #() modinst123 (wire122, clk, wire84, wire87, wire86, wire85, wire83);
  module124 #() modinst138 (wire137, clk, wire84, wire87, wire83, wire85);
  assign wire139 = (wire137 ?
                       wire87 : (((+wire86) ?
                               $unsigned(wire86) : $signed($unsigned(wire137))) ?
                           (+{(&wire84),
                               wire122[(4'ha):(2'h2)]}) : $unsigned({(^wire84)})));
  assign wire140 = wire83;
  always
    @(posedge clk) begin
      reg141 <= $signed(($unsigned(wire139) || $signed($unsigned({wire85}))));
    end
  assign wire142 = ((~|(((|(8'hb3)) - wire84[(3'h7):(1'h0)]) << $unsigned((8'hb6)))) | {wire86});
  assign wire143 = (&$signed(((8'h9e) >= $signed($signed(wire139)))));
  assign wire144 = (wire84 ? (|$signed($signed((^wire84)))) : wire84);
endmodule

module module18
#(parameter param78 = ((((((8'ha6) ? (8'ha6) : (8'hb2)) <= ((8'hb0) | (8'hb0))) & (8'h9d)) ^ {{((8'hb6) > (8'ha9)), {(8'hb6), (7'h42)}}, ((-(7'h44)) || ((7'h44) >> (8'hb6)))}) >= (({{(7'h40), (8'hb4)}, ((8'hba) << (8'h9d))} >= (((8'hab) ? (7'h40) : (8'ha6)) >= ((8'hb5) ? (8'hb7) : (8'hb8)))) ? (8'hba) : ((+{(8'ha0)}) * {{(8'ha1), (7'h40)}, (~&(8'h9c))}))), 
parameter param79 = (param78 ? param78 : ((^~(~&(~|param78))) <<< ((&param78) > {(^~param78)}))))
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire70;
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire24,
                 wire70,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire24 = $signed((wire20[(2'h2):(1'h1)] || {wire23, (8'h9e)}));
  module25 #() modinst71 (.y(wire70), .wire28(wire22), .wire29(wire24), .wire26(wire21), .wire27(wire20), .wire30(wire23), .clk(clk));
  assign wire72 = {$signed((wire20 || (wire21 ? wire70 : (|(7'h44))))),
                      ((&wire70[(2'h3):(1'h1)]) * wire70)};
  assign wire73 = wire19;
  assign wire74 = wire24;
  assign wire75 = {wire19, wire73};
  always
    @(posedge clk) begin
      reg76 <= (-wire22);
      reg77 <= {wire21};
    end
endmodule

module module25
#(parameter param68 = ((((|{(8'hbe), (8'haf)}) ? (((8'ha5) <<< (8'h9f)) ? {(8'ha2), (8'hba)} : (^~(8'h9e))) : (8'hb0)) >= {((~(8'hbe)) ? {(8'hb8), (8'ha1)} : (&(8'hb3))), (8'hb7)}) ~^ (8'hbe)), 
parameter param69 = (((((param68 >= param68) <<< param68) < {(param68 ^ param68)}) ? (param68 & ((param68 ? param68 : param68) && (param68 ? param68 : (8'haa)))) : ((~&(+param68)) * ((param68 >> param68) ? param68 : param68))) ? param68 : ({{(8'ha6), {param68, param68}}} < param68)))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire59,
                 wire58,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire31 = wire26;
  assign wire32 = $unsigned(wire26);
  assign wire33 = $unsigned($unsigned((wire30 ?
                      {(wire28 << wire28)} : wire27[(1'h0):(1'h0)])));
  assign wire34 = wire26[(4'hf):(1'h0)];
  always
    @(posedge clk) begin
      reg35 <= $signed($unsigned($signed($unsigned((^~wire29)))));
      reg36 <= ((^~wire31[(4'hd):(3'h4)]) <<< (wire32 * {{(wire27 ?
                  wire33 : wire26),
              {reg35}},
          (wire28 ? $signed(wire33) : wire32[(4'ha):(1'h0)])}));
      reg37 <= (reg35[(2'h3):(1'h1)] || $unsigned(wire27));
      if ((reg37[(3'h5):(3'h5)] ?
          reg36[(5'h12):(3'h7)] : (^~($signed((+wire26)) ?
              (^wire30[(5'h10):(1'h0)]) : $unsigned((-(8'hb5)))))))
        begin
          reg38 <= $unsigned((reg37 ?
              (~|(~|$signed(wire34))) : (wire30 ?
                  (wire32[(2'h2):(1'h0)] <<< (wire28 ?
                      reg36 : (8'hac))) : wire32[(3'h5):(1'h1)])));
          reg39 <= ($unsigned(reg35) <<< reg37[(4'he):(4'hb)]);
          reg40 <= ($unsigned(wire28) ^~ $unsigned(wire29[(4'ha):(3'h7)]));
          reg41 <= (($unsigned(wire31) - reg35) <<< (|wire33[(3'h6):(1'h1)]));
        end
      else
        begin
          if ((((|((+wire34) ?
              reg36 : reg36)) == (^(|wire33))) && $signed((wire29[(3'h4):(1'h0)] ?
              $signed(reg41) : {$unsigned(wire32)}))))
            begin
              reg38 <= (((reg41[(3'h5):(3'h4)] ?
                      reg39[(3'h5):(3'h4)] : $signed(wire28[(1'h0):(1'h0)])) - $unsigned($signed(reg36))) ?
                  reg37[(3'h5):(3'h5)] : (^~$signed(((wire30 != reg38) ?
                      $signed(wire31) : (~|reg41)))));
              reg39 <= (reg36 ?
                  {$unsigned((reg36[(2'h2):(1'h1)] ?
                          $signed((8'hb1)) : $unsigned((8'haf))))} : (wire31[(5'h10):(4'he)] || (~|($signed(wire27) ?
                      reg37[(1'h1):(1'h0)] : (reg37 ? (8'hab) : wire29)))));
            end
          else
            begin
              reg38 <= reg41[(4'h8):(1'h0)];
              reg39 <= (((((wire29 ? reg35 : reg35) * (reg38 ?
                      reg38 : wire27)) <<< $unsigned({wire26, (8'ha2)})) ?
                  $signed($unsigned((wire29 ?
                      reg41 : wire26))) : $signed($signed($signed(wire31)))) ^~ {$signed((-reg39)),
                  (reg36 < ((reg40 >= reg41) >> $unsigned(wire31)))});
            end
          reg40 <= reg36;
        end
    end
  assign wire42 = {$unsigned($unsigned({$unsigned(wire31), $signed(wire29)})),
                      {$unsigned(($signed(reg35) ^ $signed(reg37)))}};
  assign wire43 = ((!(+wire42)) ?
                      wire30 : {wire30[(1'h0):(1'h0)],
                          (wire32 <= ((8'hb3) != $signed(wire42)))});
  assign wire44 = (8'hbb);
  assign wire45 = $unsigned(((~&(!{wire30})) ?
                      (-{$unsigned(wire28)}) : (8'hbd)));
  assign wire46 = ($unsigned($signed($signed(reg38[(1'h1):(1'h0)]))) ^ ($unsigned(reg41[(4'h8):(2'h2)]) || $unsigned($signed((wire30 ?
                      wire28 : wire45)))));
  assign wire47 = (|(~$signed(wire43[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg48 <= wire28[(1'h1):(1'h1)];
    end
  assign wire49 = $signed(wire33);
  always
    @(posedge clk) begin
      if ($signed({reg48, wire31}))
        begin
          reg50 <= $signed((8'ha7));
          if (reg37)
            begin
              reg51 <= $unsigned(reg35[(2'h2):(2'h2)]);
            end
          else
            begin
              reg51 <= ((reg35 ?
                  reg50[(5'h12):(4'hf)] : $unsigned($signed((wire26 <= wire43)))) << wire34);
            end
          reg52 <= $unsigned((((~|(wire29 ? wire33 : wire26)) ?
                  $unsigned(reg37[(3'h7):(2'h3)]) : (((8'hb6) ?
                      wire49 : wire43) < (wire47 & wire27))) ?
              $unsigned(reg40) : reg51));
        end
      else
        begin
          reg50 <= $signed($signed(wire26[(4'hb):(3'h5)]));
          if (((wire47 < $unsigned(wire47)) ?
              wire47[(2'h2):(2'h2)] : (~|$unsigned({$signed(reg37), reg37}))))
            begin
              reg51 <= ($unsigned((7'h42)) ?
                  {(|reg37[(1'h1):(1'h1)])} : (~^{$signed({wire43, wire28})}));
              reg52 <= (({$signed($signed((8'hab)))} * $unsigned(wire28)) + wire45);
              reg53 <= {(+$unsigned((wire32 ? wire47 : (reg48 || (8'hb7))))),
                  wire42};
              reg54 <= $signed((^wire44));
            end
          else
            begin
              reg51 <= $signed($unsigned($unsigned(wire28)));
              reg52 <= $unsigned(($unsigned((reg51[(2'h2):(2'h2)] >= (~|wire27))) || $signed(reg35)));
              reg53 <= $unsigned($unsigned(reg53[(4'ha):(2'h2)]));
              reg54 <= (reg38[(3'h7):(3'h5)] ?
                  (reg41[(1'h1):(1'h0)] << $unsigned((reg53[(5'h13):(4'h8)] <<< (wire33 ?
                      reg36 : wire28)))) : $unsigned(wire43[(1'h1):(1'h1)]));
            end
        end
      reg55 <= wire27[(4'h8):(3'h7)];
      reg56 <= (wire30[(2'h2):(1'h1)] ?
          (wire43[(3'h7):(1'h0)] <= (^(reg36 <= $unsigned(wire31)))) : (|$unsigned(((8'h9c) ^~ wire45[(1'h0):(1'h0)]))));
      reg57 <= ((~&reg40) ?
          $signed($unsigned(wire45[(1'h1):(1'h1)])) : $unsigned({wire33}));
    end
  assign wire58 = (~&$signed($unsigned(($unsigned((8'ha0)) ^~ wire30))));
  assign wire59 = (($signed($signed($signed(reg35))) >= ($unsigned((wire46 ?
                          wire26 : wire27)) ?
                      (-reg50) : $unsigned($signed(reg51)))) ^ wire43[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg60 <= $unsigned(((^~wire43[(2'h3):(1'h1)]) >> reg39[(2'h3):(2'h2)]));
      reg61 <= (8'hbe);
      reg62 <= $unsigned((8'hb1));
      reg63 <= $unsigned($unsigned(($unsigned($signed((8'ha6))) ?
          $unsigned((wire43 || reg35)) : $unsigned(wire34))));
      reg64 <= wire29[(5'h11):(4'h8)];
    end
  assign wire65 = $unsigned({(^~{reg62[(4'h8):(2'h2)]})});
  assign wire66 = wire30;
  assign wire67 = $signed((|$signed($unsigned(((8'hb5) ? (8'hb7) : reg39)))));
endmodule

module module124  (y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire128;
  input wire signed [(4'hf):(1'h0)] wire127;
  input wire signed [(4'h8):(1'h0)] wire126;
  input wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire129;
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire129,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire129 = {$signed(wire126[(4'h8):(3'h5)]), wire128[(4'ha):(1'h1)]};
  always
    @(posedge clk) begin
      reg130 <= (&wire126[(2'h2):(2'h2)]);
      reg131 <= ((~|(^~(wire125 + (wire127 ?
          wire128 : (8'hbe))))) || ($unsigned($signed((^wire129))) != wire126));
      reg132 <= ($signed({(7'h41)}) > (+(wire127[(3'h6):(3'h5)] || wire127)));
      reg133 <= ({{(!reg131[(1'h1):(1'h0)])},
          $signed(wire129[(2'h3):(1'h1)])} & $unsigned(wire128[(2'h3):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg134 <= (-{wire129[(3'h4):(2'h3)]});
    end
  assign wire135 = ({((reg133[(1'h0):(1'h0)] ?
                               $signed(wire126) : (reg130 ?
                                   reg133 : reg134)) && $signed($unsigned(wire129))),
                           reg130} ?
                       wire125[(1'h1):(1'h1)] : (!$unsigned(reg132)));
  assign wire136 = $unsigned($unsigned((^~$signed({reg131}))));
endmodule

module module88
#(parameter param121 = (8'ha5))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  input wire [(3'h4):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire103,
                 wire102,
                 wire101,
                 reg106,
                 reg105,
                 reg104,
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
      reg94 <= ((($signed($signed(wire90)) ^ ((wire93 == wire92) ?
              (wire91 | (8'ha3)) : $unsigned(wire89))) ?
          ($unsigned(wire93[(1'h0):(1'h0)]) ?
              wire92 : (|{wire90,
                  (8'hb1)})) : wire89[(4'h8):(2'h2)]) | (7'h42));
      reg95 <= $signed($unsigned(wire93));
      if ((~$unsigned($unsigned((~&$signed(reg95))))))
        begin
          reg96 <= $unsigned((8'hbc));
          reg97 <= $unsigned({wire91, wire92[(2'h2):(1'h1)]});
          reg98 <= wire92;
        end
      else
        begin
          reg96 <= ($unsigned($signed(reg98[(3'h7):(2'h2)])) | $signed($unsigned((reg98 ?
              $unsigned(wire92) : wire90))));
          if ((!(~&reg98[(5'h10):(1'h1)])))
            begin
              reg97 <= {(~&reg98),
                  (wire93[(2'h2):(1'h0)] ^~ ($signed(reg96) ~^ reg94[(4'hb):(3'h6)]))};
              reg98 <= (!(reg97 && ($unsigned((wire91 == (8'hbd))) > $unsigned(reg98[(5'h13):(4'h8)]))));
              reg99 <= $unsigned((wire91 || (^($signed(wire93) ~^ $unsigned((8'ha6))))));
              reg100 <= reg99;
            end
          else
            begin
              reg97 <= (({reg96[(4'h8):(3'h6)], reg97} ?
                      $signed((8'h9e)) : ($unsigned((+(8'hb5))) > wire92)) ?
                  (reg99[(3'h6):(3'h5)] ?
                      (-(wire90 ?
                          {reg97,
                              wire92} : {wire89})) : ((!wire91[(4'hc):(4'ha)]) && {$unsigned(wire93)})) : ({$signed((wire89 > wire89)),
                          $unsigned({wire92, reg98})} ?
                      wire93[(1'h1):(1'h1)] : (reg98[(2'h3):(2'h2)] > $signed($signed(reg98)))));
              reg98 <= reg99;
              reg99 <= $signed(($unsigned(reg94[(4'he):(1'h0)]) ?
                  $unsigned(wire89[(3'h6):(1'h0)]) : ($unsigned($unsigned(reg96)) ?
                      (wire89 ?
                          ((8'hbd) >> reg100) : {wire92}) : ($signed(wire92) ?
                          (!wire92) : wire91[(4'ha):(3'h5)]))));
              reg100 <= reg96[(4'h8):(3'h6)];
            end
        end
    end
  assign wire101 = $unsigned($unsigned($signed(reg99[(1'h0):(1'h0)])));
  assign wire102 = (wire91[(3'h4):(2'h3)] ?
                       (reg100 <= $unsigned($unsigned((wire91 >= wire101)))) : ($signed(((~wire92) - (reg94 ?
                               wire92 : wire89))) ?
                           (~^$unsigned(wire90[(1'h0):(1'h0)])) : $signed(($unsigned(reg98) ?
                               $signed(reg94) : (reg98 == (8'ha3))))));
  assign wire103 = wire90;
  always
    @(posedge clk) begin
      reg104 <= ($unsigned($signed($signed({wire93}))) ?
          $unsigned((((+wire92) ? $unsigned(reg95) : ((8'hbc) && wire92)) ?
              reg97[(1'h0):(1'h0)] : $unsigned(wire89[(3'h6):(2'h2)]))) : $signed(wire102));
    end
  always
    @(posedge clk) begin
      reg105 <= (reg100 || (|$signed(reg99)));
      reg106 <= $unsigned($unsigned(({(~reg99)} && (^~{wire102, wire89}))));
    end
  assign wire107 = (((wire93 ? reg105[(2'h3):(1'h1)] : reg95) ?
                       $signed(reg98[(3'h5):(1'h1)]) : $signed($unsigned($unsigned((8'ha9))))) || reg99);
  assign wire108 = (!$signed($signed(({wire107} >>> (~&(8'haa))))));
  assign wire109 = reg105[(1'h0):(1'h0)];
  assign wire110 = ((-(~|((wire103 >>> wire103) ?
                       {wire89} : wire103[(2'h2):(1'h1)]))) && (8'hae));
  assign wire111 = $unsigned({reg106[(2'h2):(1'h0)]});
  assign wire112 = {(((7'h41) == $unsigned($signed((7'h40)))) ?
                           wire109 : wire90[(1'h0):(1'h0)])};
  assign wire113 = {(|reg99[(3'h6):(1'h1)]), wire91};
  assign wire114 = wire93[(1'h1):(1'h1)];
  assign wire115 = reg104[(2'h2):(1'h1)];
  assign wire116 = wire93;
  assign wire117 = $signed($signed((reg94 & (+(reg97 * reg106)))));
  assign wire118 = wire101[(4'hd):(4'hb)];
  assign wire119 = {((reg99 < wire102[(4'ha):(1'h0)]) ^ (^~((wire113 <<< (8'hbe)) ?
                           wire101 : $signed(wire90))))};
  assign wire120 = wire110[(3'h7):(1'h1)];
endmodule
