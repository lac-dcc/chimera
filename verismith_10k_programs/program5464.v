module top
#(parameter param193 = ((|(!(~|((8'hab) ? (7'h43) : (8'h9f))))) ? ({(8'hb7)} >> (^(8'ha5))) : ({(-((8'hb4) != (8'hb9)))} <= (|({(8'h9c), (8'haf)} ? ((8'ha9) <= (8'hb1)) : ((7'h42) <<< (7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire184;
  wire [(4'ha):(1'h0)] wire178;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire182;
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire178,
                 wire4,
                 wire58,
                 wire180,
                 wire181,
                 wire182,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire4 = $unsigned(wire1[(2'h2):(1'h1)]);
  module5 #() modinst59 (wire58, clk, wire4, wire0, wire3, wire1, wire2);
  always
    @(posedge clk) begin
      if (($signed((-$unsigned((~&wire0)))) ?
          (~^{($signed(wire0) << $unsigned(wire0))}) : $signed((wire0[(4'h9):(1'h0)] ?
              wire4[(5'h15):(4'hf)] : wire3))))
        begin
          reg60 <= {(!$unsigned((+((8'ha3) ? wire1 : wire58))))};
          if ({(wire4 ^~ ($signed($unsigned((8'ha8))) ? wire1 : wire2))})
            begin
              reg61 <= ({(+(~wire4))} ?
                  (wire4 ~^ (^~wire4[(4'ha):(1'h1)])) : (-((wire0 ?
                          wire3 : $unsigned(wire2)) ?
                      wire4 : {wire2[(4'hc):(4'ha)]})));
              reg62 <= (^$signed(({$signed(wire3), (reg61 ~^ reg60)} ?
                  {$signed((8'hb5)),
                      (reg61 ? wire58 : wire58)} : (-$unsigned(wire58)))));
              reg63 <= {(wire58[(3'h4):(3'h4)] >> $unsigned(reg61[(2'h2):(2'h2)])),
                  $signed(reg62[(2'h2):(2'h2)])};
              reg64 <= wire2[(1'h0):(1'h0)];
              reg65 <= ((~&(~|wire58[(1'h0):(1'h0)])) ?
                  (&{((-reg63) == wire0[(4'h8):(1'h1)])}) : $signed($unsigned((wire4[(4'ha):(3'h4)] >= wire4[(5'h10):(3'h6)]))));
            end
          else
            begin
              reg61 <= ((~|(~(^(reg64 << reg65)))) ?
                  ((~|((+reg64) ?
                      $signed((8'ha6)) : {reg61})) * wire0) : {((wire4[(5'h14):(4'ha)] >> (wire4 ?
                              wire1 : wire58)) ?
                          $unsigned($signed(reg63)) : reg64)});
              reg62 <= reg65;
              reg63 <= ($signed($signed(wire3[(5'h10):(5'h10)])) ?
                  reg60[(3'h6):(2'h2)] : (!(reg64 + wire3)));
              reg64 <= ((|$signed(wire58)) ?
                  ($unsigned(reg60[(3'h7):(3'h5)]) * reg61[(1'h1):(1'h1)]) : ({($unsigned(wire58) >> reg61[(2'h2):(1'h1)])} ^~ $signed(({reg63,
                          reg64} ?
                      $unsigned(wire2) : reg60))));
            end
          reg66 <= $unsigned((($signed(((8'hb6) ?
              wire0 : reg64)) > (~^reg60[(4'h8):(2'h2)])) && $unsigned($unsigned($unsigned(wire2)))));
        end
      else
        begin
          if ({$signed($signed((((8'hb6) ? reg64 : reg66) ?
                  $signed(reg61) : $unsigned(wire2))))})
            begin
              reg60 <= $unsigned({reg60[(2'h3):(2'h2)], reg63});
              reg61 <= $unsigned((reg64[(4'hb):(4'ha)] <= {{reg60[(4'h9):(4'h8)],
                      wire0[(4'h8):(3'h6)]},
                  (~^reg62[(1'h1):(1'h1)])}));
            end
          else
            begin
              reg60 <= ($unsigned(($unsigned((~&reg61)) == $signed((wire4 ?
                  (7'h41) : reg61)))) && (8'hba));
              reg61 <= (reg62 ?
                  (reg65 ?
                      (wire1 << (^wire3)) : ($signed((reg60 >> wire0)) ?
                          $signed(reg65[(3'h6):(3'h6)]) : reg62)) : (^wire58[(5'h10):(4'ha)]));
              reg62 <= ($signed(($unsigned((reg61 <= (8'hb7))) || reg64)) ?
                  (8'ha1) : (((~(reg60 | wire58)) ?
                      wire0 : $unsigned((reg64 >> reg65))) & wire1[(2'h2):(1'h1)]));
            end
          reg63 <= wire3;
          reg64 <= (~&$signed((~&(8'hb0))));
          if (((8'ha8) ? $signed(reg62) : reg60[(4'ha):(2'h3)]))
            begin
              reg65 <= wire1[(4'h8):(3'h4)];
              reg66 <= (($unsigned({(|wire0)}) ?
                  $signed(wire1) : $unsigned({wire2[(3'h5):(1'h0)],
                      {wire0}})) == {(reg65 ?
                      $signed((wire58 ?
                          reg65 : reg63)) : wire1[(3'h7):(1'h0)])});
            end
          else
            begin
              reg65 <= reg61[(2'h2):(2'h2)];
            end
        end
    end
  module67 #() modinst179 (wire178, clk, wire58, reg60, reg66, wire3, wire1);
  assign wire180 = (($signed(wire2[(3'h4):(1'h1)]) ?
                           (&$signed($signed(reg61))) : reg65) ?
                       $signed(((wire1 < $unsigned(wire4)) && (((8'h9d) ?
                           wire1 : reg64) ~^ reg64[(3'h4):(3'h4)]))) : (wire1[(4'hd):(4'hb)] ?
                           reg61[(2'h2):(1'h0)] : $unsigned($unsigned((reg61 ?
                               (8'ha9) : wire1)))));
  assign wire181 = reg63;
  module67 #() modinst183 (wire182, clk, reg60, wire4, reg64, reg61, reg65);
  assign wire184 = (((!((7'h43) - $signed(wire181))) & $signed(reg61)) << reg62);
  assign wire185 = wire1;
  assign wire186 = $signed($signed($unsigned($unsigned((reg65 ^ (8'hb6))))));
  always
    @(posedge clk) begin
      reg187 <= $signed((~|reg60[(2'h2):(2'h2)]));
      reg188 <= ($unsigned((reg63 ?
              (wire178[(3'h6):(2'h2)] <<< $unsigned(wire185)) : ((reg61 & reg62) - (wire2 ?
                  wire178 : wire185)))) ?
          (reg60 ?
              ((~|{wire182, reg63}) ?
                  (^~$signed(wire2)) : ((wire2 ? wire185 : reg66) ?
                      $signed(wire0) : {wire186,
                          wire180})) : wire2[(1'h0):(1'h0)]) : {(reg65 ~^ ((reg65 ?
                      wire2 : reg187) ?
                  wire1[(2'h2):(1'h1)] : $unsigned(wire178))),
              (((~reg66) ? wire2[(3'h7):(3'h5)] : $unsigned((8'hb9))) ?
                  (~&(-(8'haa))) : (^~(reg63 ? reg187 : wire185)))});
      if (wire178)
        begin
          reg189 <= reg61[(3'h4):(2'h2)];
          reg190 <= wire181;
          reg191 <= $signed((8'hb3));
          reg192 <= (wire181[(5'h10):(1'h0)] >= (8'hbe));
        end
      else
        begin
          reg189 <= (~^wire178);
        end
    end
endmodule

module module67
#(parameter param176 = (8'ha7), 
parameter param177 = ((-((^~{param176}) > (7'h43))) ? param176 : param176))
(y, clk, wire68, wire69, wire70, wire71, wire72);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire68;
  input wire [(4'ha):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire71;
  input wire [(5'h14):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire174;
  wire [(3'h6):(1'h0)] wire173;
  wire [(4'hb):(1'h0)] wire171;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire142;
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire73,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire142,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  assign wire73 = {wire68};
  always
    @(posedge clk) begin
      reg74 <= wire70[(5'h12):(1'h1)];
      reg75 <= {(wire69[(4'ha):(4'h9)] ?
              $signed((~^wire69[(3'h5):(2'h2)])) : (&wire69[(4'h9):(3'h6)]))};
      reg76 <= $unsigned((8'hbc));
    end
  assign wire77 = wire73[(1'h1):(1'h0)];
  assign wire78 = wire77;
  assign wire79 = reg75[(4'hd):(1'h1)];
  assign wire80 = wire72;
  assign wire81 = (&$unsigned(wire77[(3'h7):(1'h1)]));
  assign wire82 = (8'hbf);
  module83 #() modinst143 (wire142, clk, wire78, wire77, reg76, wire68, reg75);
  module144 #() modinst172 (wire171, clk, wire73, reg75, wire80, wire81, wire142);
  assign wire173 = {$signed(($unsigned(wire82) - ((wire142 ?
                           (8'hb7) : wire171) - $signed(reg75)))),
                       reg75[(3'h4):(1'h1)]};
  assign wire174 = ($unsigned($signed(wire73)) == (wire77[(2'h2):(1'h1)] ?
                       reg76[(3'h4):(1'h1)] : (~($unsigned(wire69) ?
                           wire72[(5'h12):(4'h9)] : wire73))));
  assign wire175 = $unsigned(((^((wire174 ? (8'hbc) : wire68) ^~ (!wire73))) ?
                       ({$signed(wire80), (^~(7'h44))} == wire69) : wire80));
endmodule

module module5
#(parameter param56 = (&(~^(({(8'haa), (8'ha4)} ? (8'hae) : ((8'ha4) - (8'ha2))) ? (~((8'ha2) ? (8'ha1) : (8'haa))) : ((^(8'hab)) && ((8'hbf) - (8'had)))))), 
parameter param57 = ((~&((param56 ? param56 : param56) >>> param56)) ? (+({(param56 ? param56 : param56), (param56 + param56)} || param56)) : (~|param56)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire55,
                 wire53,
                 wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire27,
                 reg36,
                 reg31,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed(wire6[(4'h9):(1'h0)]);
    end
  module12 #() modinst28 (wire27, clk, reg11, wire10, wire6, wire9);
  assign wire29 = ((wire10[(1'h1):(1'h0)] >= {((-wire10) ?
                              (wire6 < wire9) : (wire9 ? (7'h44) : (8'hba))),
                          (^(wire27 ? wire7 : wire6))}) ?
                      (($signed(((8'ha2) ? wire9 : wire6)) ?
                          {(8'ha5),
                              (wire7 ?
                                  wire8 : wire8)} : (!(reg11 < wire27))) ^~ (+$signed(((8'ha5) < wire10)))) : $unsigned($signed((~$signed(wire7)))));
  assign wire30 = {$unsigned($unsigned({(wire27 < wire27)})),
                      $signed((!((wire27 ^ wire9) ?
                          {reg11, reg11} : $unsigned(wire10))))};
  always
    @(posedge clk) begin
      reg31 <= {($unsigned(wire9) ?
              ({$unsigned((8'hb3)), (~|wire30)} ?
                  wire7 : $signed(wire30)) : wire8),
          wire27[(3'h5):(3'h4)]};
    end
  assign wire32 = wire27[(3'h6):(2'h3)];
  assign wire33 = wire30[(3'h7):(1'h0)];
  assign wire34 = $unsigned({($signed((wire6 ? wire7 : wire27)) ?
                          (+(wire32 >= (8'h9f))) : ($unsigned(wire8) | reg31[(3'h6):(2'h3)]))});
  assign wire35 = (~|(8'ha8));
  always
    @(posedge clk) begin
      reg36 <= $signed((~|$signed($signed({wire27, reg31}))));
    end
  assign wire37 = $signed($unsigned((((^~reg11) ?
                          (wire27 >> wire6) : $unsigned((8'ha7))) ?
                      ((!wire35) ?
                          (reg31 ?
                              wire10 : wire35) : wire27[(2'h2):(2'h2)]) : (((8'hba) + reg36) ?
                          $signed(reg36) : $signed(wire35)))));
  assign wire38 = (|((8'hb0) && (reg11 > reg31)));
  module39 #() modinst54 (wire53, clk, wire30, wire7, wire35, wire32);
  assign wire55 = ($unsigned($signed(({reg11, wire10} < (^~wire9)))) ?
                      $unsigned(wire7[(3'h4):(2'h3)]) : $signed(((+$unsigned(wire6)) ?
                          (~^$signed((8'hab))) : wire10[(4'hd):(4'hc)])));
endmodule

module module39
#(parameter param52 = (~&{(|{((7'h43) >= (8'h9e)), {(7'h40)}}), (~&(((8'haf) ^ (7'h43)) ? ((8'hb1) | (8'hb9)) : ((8'hae) | (8'hba))))}))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire43;
  input wire [(3'h4):(1'h0)] wire42;
  input wire [(2'h2):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 (1'h0)};
  assign wire44 = ($signed(wire41[(1'h1):(1'h0)]) ?
                      $signed((-$unsigned(wire42[(1'h0):(1'h0)]))) : wire40[(4'hb):(3'h5)]);
  assign wire45 = (($unsigned($unsigned((~^wire43))) ?
                      (!(-(wire44 ?
                          (8'h9c) : wire44))) : wire41[(1'h1):(1'h0)]) & wire40[(5'h15):(3'h5)]);
  assign wire46 = wire42;
  assign wire47 = $signed({{{wire46[(3'h5):(1'h0)], (8'ha4)}}, wire42});
  assign wire48 = (({$unsigned((-wire43)),
                      $signed(wire41[(2'h2):(2'h2)])} - wire44[(3'h4):(1'h0)]) >>> (wire43[(2'h2):(2'h2)] ^~ wire44));
  assign wire49 = $signed($signed({{(8'hab), {wire41, wire42}}}));
  assign wire50 = wire45;
  assign wire51 = (^$signed({(7'h42)}));
endmodule

module module12
#(parameter param26 = ({({{(8'ha7)}} ^ (-((8'hb2) ? (7'h43) : (8'hb2)))), (|((8'hb9) & (~|(8'ha7))))} ? ((+((^(8'ha0)) == ((8'hbb) + (8'hab)))) ? (!{{(8'hb2)}}) : (((8'h9c) | ((8'hbb) ? (7'h41) : (8'ha0))) ? (((8'hbf) + (8'h9f)) >> {(8'hb6), (8'hb5)}) : ((~^(8'hab)) ? (&(8'hae)) : ((8'ha8) ? (8'hb8) : (8'hbc))))) : {((^{(8'hbc), (7'h40)}) >= (~((8'ha8) ? (7'h44) : (8'h9f))))}))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= $signed($signed(wire15));
      reg18 <= (+reg17[(4'hc):(2'h3)]);
      reg19 <= ((^wire14) & $unsigned((wire16 > $signed($unsigned(reg18)))));
      reg20 <= reg17[(3'h4):(3'h4)];
    end
  assign wire21 = {((~^{wire13[(2'h2):(2'h2)],
                          {wire14, reg18}}) + $signed((wire14 ?
                          reg18[(1'h0):(1'h0)] : (wire13 - reg19))))};
  assign wire22 = ($unsigned(((+$unsigned(reg17)) && $signed((reg20 ?
                          wire14 : (8'hb6))))) ?
                      $signed((wire14 & reg18)) : (($unsigned((^~reg20)) <<< wire15[(3'h4):(2'h2)]) ?
                          ($signed($unsigned(reg19)) ^ ((reg17 || reg20) ?
                              wire14[(3'h4):(3'h4)] : $signed(reg19))) : (wire21[(5'h14):(5'h14)] ?
                              ((~&reg20) ?
                                  reg17 : $signed(reg18)) : ((wire16 != (8'hb6)) | {reg20}))));
  assign wire23 = ($unsigned(wire14) ?
                      ($signed({(|reg19)}) ?
                          {(~|$signed(wire14))} : (-((wire16 ? reg20 : wire14) ?
                              ((8'ha6) <= reg18) : (wire21 - wire14)))) : wire22);
  assign wire24 = wire15;
  assign wire25 = (($signed(wire24[(1'h1):(1'h0)]) ?
                          {(8'hb5)} : ((~&$signed((8'haf))) ?
                              wire14 : $signed((reg17 ? wire14 : reg19)))) ?
                      $signed({wire21, (&((8'ha1) ? wire13 : reg20))}) : reg18);
endmodule

module module144  (y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire149;
  input wire signed [(4'he):(1'h0)] wire148;
  input wire [(5'h12):(1'h0)] wire147;
  input wire [(4'hd):(1'h0)] wire146;
  input wire signed [(5'h13):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire170;
  wire signed [(4'h9):(1'h0)] wire169;
  wire signed [(4'hf):(1'h0)] wire168;
  wire signed [(3'h6):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(5'h11):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire150 = wire147;
  assign wire151 = wire146[(3'h7):(3'h6)];
  assign wire152 = wire146[(3'h6):(3'h4)];
  assign wire153 = $unsigned((~&(8'hbd)));
  assign wire154 = ((wire149[(3'h6):(2'h2)] ?
                       wire153[(4'hb):(1'h1)] : wire146[(4'ha):(3'h4)]) << ((wire150[(2'h2):(1'h0)] ?
                           ((wire152 ~^ wire148) ?
                               (wire150 ?
                                   (7'h42) : wire153) : $unsigned((8'ha1))) : ($signed((8'h9e)) < ((8'hb9) >> wire152))) ?
                       (~((wire147 ~^ wire150) && (wire150 >= wire149))) : ((wire150[(1'h1):(1'h1)] ?
                           (^~wire147) : $unsigned(wire149)) == $unsigned($unsigned(wire153)))));
  assign wire155 = $unsigned((^($signed(wire148[(4'h9):(4'h9)]) ?
                       wire147 : wire148[(3'h4):(1'h1)])));
  assign wire156 = $signed((~^(~|$signed((wire154 ^~ wire151)))));
  assign wire157 = {wire147};
  always
    @(posedge clk) begin
      if (wire146[(3'h6):(2'h2)])
        begin
          reg158 <= $signed(((|{(8'hbc), $unsigned(wire157)}) ?
              wire149[(1'h0):(1'h0)] : $unsigned({(&wire145)})));
          reg159 <= wire153;
        end
      else
        begin
          reg158 <= wire149;
          if (wire154)
            begin
              reg159 <= (&($unsigned((wire149 ?
                  (~&wire146) : $unsigned(reg158))) || (8'hb3)));
              reg160 <= wire148[(3'h7):(3'h5)];
            end
          else
            begin
              reg159 <= wire148[(4'hc):(3'h7)];
            end
          reg161 <= ($signed(wire154) >= wire157[(2'h3):(1'h0)]);
          reg162 <= (~|(reg160[(1'h1):(1'h1)] ?
              {reg159[(3'h7):(3'h4)]} : wire148));
          reg163 <= (-$unsigned(reg162));
        end
      reg164 <= reg161[(2'h3):(2'h2)];
      reg165 <= $signed($unsigned((reg162[(1'h0):(1'h0)] ?
          (~|reg163[(3'h7):(2'h3)]) : ((reg163 ? wire147 : (8'hb7)) ?
              (^reg158) : ((8'haf) != reg163)))));
    end
  assign wire166 = reg161[(2'h3):(2'h3)];
  assign wire167 = wire149[(4'h8):(2'h3)];
  assign wire168 = ((((wire147[(4'h9):(4'h8)] >>> wire150[(1'h1):(1'h1)]) ~^ ($unsigned(wire154) - $unsigned(reg165))) <<< $signed(wire145[(2'h3):(1'h0)])) ?
                       (!reg162[(3'h5):(3'h5)]) : ((wire167[(3'h4):(2'h3)] ?
                           ((wire157 == wire146) ~^ (wire151 <= reg161)) : wire157[(2'h3):(1'h1)]) >= ($unsigned(wire153[(4'hd):(2'h3)]) | reg159[(1'h1):(1'h0)])));
  assign wire169 = ({reg161[(3'h4):(1'h0)],
                       (+reg162[(5'h11):(2'h2)])} != (reg159[(3'h4):(1'h1)] ?
                       reg161 : {(~{wire150}), reg164[(3'h7):(1'h0)]}));
  assign wire170 = $signed(($signed({(wire157 ? wire155 : wire154),
                       (8'hab)}) > $unsigned($signed(wire150))));
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  input wire signed [(4'he):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 reg94,
                 (1'h0)};
  assign wire89 = $signed(wire85);
  assign wire90 = (+$unsigned(((&wire87[(1'h1):(1'h1)]) ~^ wire88[(1'h0):(1'h0)])));
  assign wire91 = ($unsigned($signed(wire86[(1'h1):(1'h0)])) ?
                      (~&{$signed(((8'hb0) <= wire86))}) : ((&$signed((!wire86))) ?
                          $signed(($signed((8'hbf)) ?
                              $unsigned(wire88) : $signed(wire84))) : (~&$unsigned($unsigned((7'h40))))));
  assign wire92 = {(wire91 ?
                          (|($signed(wire88) ?
                              wire85[(4'hc):(4'hc)] : {wire87,
                                  wire84})) : wire87[(5'h13):(5'h13)])};
  assign wire93 = wire91[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg94 <= ((($unsigned((8'hba)) ?
              ((wire88 ^ wire84) ?
                  wire87[(3'h6):(2'h3)] : $unsigned(wire89)) : $signed(wire89)) ?
          $signed($signed(wire84[(3'h7):(1'h1)])) : $unsigned(({wire93,
                  wire91} ?
              $unsigned((8'h9c)) : {(8'hbb)}))) != $unsigned(($unsigned({wire87}) ?
          $unsigned((wire92 ? wire92 : wire93)) : ((wire88 ?
              (7'h40) : wire85) >>> $signed(wire92)))));
    end
  assign wire95 = $unsigned(wire85);
  assign wire96 = (-($signed(wire95) ?
                      (!$unsigned($signed(wire90))) : wire93[(1'h1):(1'h0)]));
  assign wire97 = wire85;
  assign wire98 = ((wire92[(2'h2):(1'h0)] >>> ($unsigned((wire88 >>> wire93)) ?
                          ((wire85 <<< wire96) ?
                              (wire93 << wire89) : (wire97 ?
                                  (8'hbe) : wire85)) : ($signed(wire96) >= {wire87,
                              wire87}))) ?
                      wire86[(4'ha):(3'h6)] : wire93);
  assign wire99 = (~&((7'h43) ?
                      (wire97 ?
                          $signed((wire86 ? wire84 : (8'hae))) : ((+wire92) ?
                              (^(8'ha7)) : wire93)) : wire92[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg100 <= wire93;
      reg101 <= wire91[(1'h1):(1'h0)];
      reg102 <= wire93;
      if ((8'hb7))
        begin
          reg103 <= $unsigned(reg94[(2'h2):(1'h1)]);
          reg104 <= $unsigned((&(wire90[(1'h0):(1'h0)] ^ (wire87 ?
              reg102[(4'hc):(3'h6)] : (|wire93)))));
          if (reg102)
            begin
              reg105 <= {(^wire98[(3'h4):(1'h0)]), $unsigned(wire87)};
              reg106 <= ((~|(((wire84 << wire85) ?
                  (|wire89) : {reg101}) <= {(reg105 >> wire85)})) ^ {(((^wire98) ?
                          wire98[(1'h1):(1'h1)] : $unsigned(wire84)) ?
                      ((reg103 ?
                          reg103 : reg102) > $unsigned(wire96)) : ((wire96 & wire93) != (wire93 <= wire85)))});
              reg107 <= (~|$unsigned(wire91));
              reg108 <= wire97;
              reg109 <= ((~|$signed($unsigned((wire87 ? wire99 : (8'ha6))))) ?
                  (reg108[(1'h1):(1'h0)] == {(wire92[(3'h4):(1'h1)] ^~ wire93[(3'h6):(3'h4)])}) : (~&(reg104 ?
                      ($signed(wire92) ?
                          $signed(wire86) : (reg106 >= wire92)) : {wire88,
                          reg105})));
            end
          else
            begin
              reg105 <= (~|wire99[(3'h4):(2'h2)]);
              reg106 <= (+$unsigned(reg106[(5'h10):(4'hb)]));
              reg107 <= $unsigned($signed((!$unsigned((!wire95)))));
              reg108 <= wire92;
              reg109 <= ((&reg101) | (wire89[(1'h1):(1'h0)] ?
                  (~|$unsigned((wire95 ?
                      (8'ha9) : wire84))) : $unsigned((|wire84))));
            end
          reg110 <= (&(~|(|(wire84 ?
              $unsigned(reg109) : reg107[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg103 <= $unsigned((wire95 ?
              $signed(reg103[(3'h4):(2'h3)]) : (((reg108 ? wire98 : wire87) ?
                      wire91 : reg103[(1'h1):(1'h1)]) ?
                  $signed(reg105[(5'h13):(2'h2)]) : wire95)));
          if ((wire96 || $unsigned((~^reg103))))
            begin
              reg104 <= (!(wire95 && $signed(wire95)));
              reg105 <= $unsigned((reg107[(1'h0):(1'h0)] <<< $signed($unsigned((-reg102)))));
              reg106 <= wire86;
            end
          else
            begin
              reg104 <= $signed($signed($unsigned(reg109)));
              reg105 <= reg104;
              reg106 <= $signed({($unsigned($signed(wire98)) ?
                      ((wire99 + reg104) || ((8'h9c) ?
                          (7'h40) : wire92)) : reg100[(3'h6):(3'h4)])});
              reg107 <= reg102;
              reg108 <= $signed({({{wire99}} & (&$unsigned(wire88)))});
            end
          if (($unsigned(reg94) ?
              (~|reg110[(3'h5):(2'h2)]) : ($signed(wire99) ?
                  ($unsigned((8'hbc)) ? wire96 : wire86) : wire93)))
            begin
              reg109 <= $signed((&((&(wire95 ?
                  reg102 : reg107)) * ((wire93 >> reg103) ?
                  $unsigned(wire96) : $unsigned(reg103)))));
              reg110 <= wire99;
              reg111 <= (~{$unsigned($signed($unsigned(wire89))),
                  $signed(($unsigned(reg101) * (7'h44)))});
              reg112 <= wire97;
              reg113 <= $signed((8'hb8));
            end
          else
            begin
              reg109 <= wire86[(3'h4):(2'h3)];
              reg110 <= reg112[(3'h4):(1'h0)];
            end
          reg114 <= (((reg101 & reg107) >= $unsigned(($unsigned((8'hbc)) <= (wire87 <= wire93)))) ?
              (!(wire96[(4'he):(2'h2)] ?
                  wire92 : $unsigned($unsigned(wire88)))) : $signed($unsigned({(&wire84)})));
        end
      reg115 <= reg112;
    end
  always
    @(posedge clk) begin
      reg116 <= wire93[(4'h9):(4'h8)];
      reg117 <= (!(wire93[(2'h3):(2'h2)] ?
          (+$signed((|reg108))) : {((reg108 ? reg111 : (7'h40)) + (-reg103))}));
      reg118 <= (((-$unsigned((!wire84))) ?
              reg115[(4'h8):(4'h8)] : (~^$signed({wire99}))) ?
          reg100 : wire89);
      if ((({(reg113[(3'h5):(2'h3)] ~^ ((8'hb1) ?
                  reg112 : wire84))} * wire93[(2'h2):(1'h1)]) ?
          {(reg112[(3'h5):(3'h4)] ?
                  reg94[(1'h0):(1'h0)] : $signed((reg100 ^~ reg102))),
              ((~^$unsigned(wire85)) ?
                  wire85[(4'hc):(3'h6)] : ((~|reg105) ?
                      (~(8'hab)) : $signed(reg116)))} : ($unsigned(((reg113 <<< reg102) < {reg105})) ?
              ($unsigned($signed(reg108)) ?
                  (8'hbb) : $unsigned((wire85 ?
                      reg100 : reg100))) : (^wire88))))
        begin
          reg119 <= (~&($unsigned((^$unsigned(wire96))) - (~&(reg117 ?
              wire85 : (~|reg113)))));
          if (reg101)
            begin
              reg120 <= {$signed($signed($unsigned(reg112[(1'h0):(1'h0)]))),
                  wire92[(3'h6):(1'h0)]};
              reg121 <= $unsigned(wire88);
            end
          else
            begin
              reg120 <= wire86[(3'h4):(2'h3)];
              reg121 <= ($unsigned($signed(reg113)) ?
                  (($signed({wire88, wire85}) ?
                          wire84[(3'h7):(3'h4)] : wire95[(1'h1):(1'h0)]) ?
                      reg116[(3'h6):(1'h1)] : reg101) : ($signed((((8'hab) >> reg121) & ((8'hb5) ?
                          reg110 : wire87))) ?
                      reg100[(4'h8):(3'h7)] : reg117[(3'h4):(3'h4)]));
              reg122 <= $unsigned(reg103);
              reg123 <= {$unsigned($signed($unsigned({reg108, reg115}))),
                  reg107};
              reg124 <= ((~^($unsigned((|(8'ha6))) == (8'ha2))) ?
                  reg107[(2'h3):(1'h1)] : {$signed((~|((8'hb9) ?
                          wire95 : reg122)))});
            end
          reg125 <= reg101;
          if (wire96[(3'h7):(3'h4)])
            begin
              reg126 <= reg102;
              reg127 <= reg126[(3'h7):(3'h4)];
              reg128 <= (~{((8'ha7) >>> reg104[(3'h4):(1'h0)])});
              reg129 <= $signed(reg120[(3'h7):(3'h7)]);
              reg130 <= reg125[(2'h2):(2'h2)];
            end
          else
            begin
              reg126 <= $signed((($signed(((8'ha8) ?
                  wire92 : reg130)) || reg123[(4'ha):(1'h0)]) <<< (-$signed((reg123 < reg123)))));
              reg127 <= ((($unsigned($signed(reg106)) > (8'ha2)) ?
                  {(reg112[(3'h6):(1'h1)] ?
                          (-reg123) : ((8'hbe) ? (8'ha4) : reg118)),
                      $unsigned($unsigned(reg103))} : ((wire97 ?
                      reg121 : (reg122 - reg126)) ^~ reg114[(2'h2):(1'h1)])) >> $unsigned((wire87[(5'h13):(4'hc)] ?
                  (8'ha5) : (8'hb5))));
              reg128 <= reg110[(1'h0):(1'h0)];
            end
          reg131 <= ((^wire96[(3'h6):(2'h2)]) ?
              wire86 : $unsigned($signed((|reg122[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg119 <= (8'hb5);
        end
      reg132 <= reg101;
    end
  always
    @(posedge clk) begin
      reg133 <= $unsigned(reg103[(3'h4):(1'h0)]);
    end
  assign wire134 = $unsigned($signed((~^$unsigned((reg119 <<< (8'hb7))))));
  assign wire135 = (~&wire99);
  assign wire136 = $signed($signed({$unsigned(reg114[(1'h1):(1'h1)]),
                       $unsigned(wire134)}));
  assign wire137 = $unsigned($unsigned(reg113));
  assign wire138 = reg117;
  assign wire139 = $signed((-reg118));
  assign wire140 = reg101[(2'h2):(2'h2)];
  assign wire141 = reg118;
endmodule
