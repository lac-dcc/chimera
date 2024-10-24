module top
#(parameter param90 = (^~({(((8'hb0) ? (8'ha5) : (7'h43)) >> ((8'ha8) ^ (8'ha5))), (((8'hab) ^ (8'hb1)) ~^ ((8'h9d) == (8'ha1)))} ? (^(~{(8'ha2)})) : {(((8'hb4) <= (7'h43)) < ((8'ha2) - (8'hb7)))})), 
parameter param91 = ((-({(param90 - param90)} ? (param90 ? (param90 ? param90 : param90) : (param90 && param90)) : param90)) <<< ((-param90) ? (((param90 ? (8'hb0) : param90) >>> (param90 ? param90 : param90)) && (^~(!param90))) : (({param90} ? {param90} : param90) != {param90, (8'hb6)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire31,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&$signed(wire0)))
        begin
          reg4 <= {({wire0} ?
                  wire1[(2'h2):(1'h1)] : $signed(wire0[(2'h3):(2'h3)])),
              $unsigned(wire2[(1'h0):(1'h0)])};
          reg5 <= {$unsigned(wire2),
              ((wire2[(2'h3):(2'h2)] ?
                  {{wire0}} : wire2) ^~ (&$signed((reg4 >= wire2))))};
          reg6 <= reg5[(2'h2):(2'h2)];
          if ($unsigned(wire0))
            begin
              reg7 <= (-(^(+((wire2 ? wire0 : (8'ha4)) != reg6))));
            end
          else
            begin
              reg7 <= ($signed(reg6) != reg5[(4'ha):(3'h4)]);
              reg8 <= ((~|{((reg5 ^ reg5) ^~ wire2)}) ?
                  (wire1[(3'h5):(1'h0)] << ((7'h41) >> (^~wire1))) : {(wire2 ?
                          reg7[(4'hd):(4'h9)] : $unsigned($signed(reg5)))});
              reg9 <= reg4[(2'h3):(2'h2)];
            end
        end
      else
        begin
          if (((wire2[(1'h1):(1'h1)] * $unsigned(((reg5 != reg9) & (reg8 || reg9)))) ?
              {$unsigned({$signed(wire0),
                      (^~reg7)})} : ($signed($unsigned({wire1})) ?
                  (reg6 ?
                      reg6 : $unsigned($signed((8'ha6)))) : $unsigned({wire0}))))
            begin
              reg4 <= $unsigned(wire1);
            end
          else
            begin
              reg4 <= reg9;
              reg5 <= reg7;
              reg6 <= $signed(reg4);
              reg7 <= $signed($unsigned($unsigned({(reg9 >>> reg5)})));
            end
          reg8 <= reg9[(2'h3):(1'h1)];
          reg9 <= reg4;
          reg10 <= {($unsigned((reg4 ?
                      (wire0 * reg6) : (wire1 ? (7'h40) : (8'hb3)))) ?
                  (^~(&(&(8'hbd)))) : (8'hbe))};
        end
    end
  always
    @(posedge clk) begin
      reg11 <= reg5[(4'hc):(3'h4)];
      reg12 <= (8'haa);
      reg13 <= (8'hb3);
    end
  assign wire14 = ((wire2 <= $unsigned((+(reg6 ? (8'had) : wire3)))) ?
                      (reg6[(1'h0):(1'h0)] < $signed(reg7[(1'h1):(1'h1)])) : wire2);
  assign wire15 = ($signed($signed(reg5[(3'h7):(3'h5)])) - $unsigned((^~reg11[(4'ha):(4'ha)])));
  assign wire16 = $signed((^wire2[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg17 <= (^~(wire2[(2'h3):(1'h0)] != ({$unsigned(wire15), wire2} ?
          $signed(reg10) : reg6[(4'h8):(2'h3)])));
    end
  assign wire18 = reg11[(4'hb):(1'h0)];
  assign wire19 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg20 <= $unsigned((8'hb7));
      reg21 <= ((reg8 ? reg11 : wire14) ?
          ({{reg13}, $unsigned($unsigned(reg4))} ?
              ($unsigned((|reg17)) ^ reg13) : {wire14[(3'h5):(3'h4)],
                  (reg6 || reg5)}) : $unsigned(((+(|wire15)) ?
              $unsigned(((8'hba) && reg5)) : (8'ha8))));
      reg22 <= (^~((&$signed(((7'h43) ? (8'hbd) : reg20))) ?
          (~{wire14[(2'h3):(1'h1)]}) : wire14));
      reg23 <= ($unsigned((8'hb8)) < {(-$signed((wire14 ? reg13 : wire3))),
          $unsigned(reg6[(3'h4):(3'h4)])});
      if ({(-wire14[(1'h0):(1'h0)]),
          ($unsigned((~|$unsigned(reg5))) ?
              {(wire18 ? reg4 : reg21),
                  reg9[(1'h1):(1'h0)]} : $unsigned(reg13[(4'h8):(3'h6)]))})
        begin
          if ($unsigned($signed($unsigned((|(^~(8'ha3)))))))
            begin
              reg24 <= (wire16 ?
                  ((wire0 < $unsigned($signed(reg17))) << $unsigned((8'hbc))) : ((((wire18 ?
                          reg23 : reg20) > (wire2 ?
                          reg8 : reg11)) ^ ((-reg5) * (8'hab))) ?
                      ({(reg10 ?
                              wire15 : reg17)} >= $signed((wire18 ^ reg22))) : (7'h41)));
              reg25 <= wire3;
              reg26 <= wire2;
              reg27 <= reg8;
              reg28 <= $unsigned({$unsigned(({reg27, reg8} | {wire2})),
                  ($signed($unsigned((8'hae))) || $unsigned((reg5 && reg21)))});
            end
          else
            begin
              reg24 <= (8'hb4);
              reg25 <= $signed($signed((8'haf)));
              reg26 <= ((reg12[(1'h1):(1'h0)] ? $signed(reg11) : wire15) ?
                  $signed(((wire16[(3'h7):(2'h2)] + $unsigned(wire2)) ?
                      ((wire18 != reg13) ?
                          (reg23 ?
                              wire1 : wire14) : ((8'haf) < (8'h9f))) : reg13)) : (!$unsigned(((reg17 ?
                      wire0 : wire14) ^~ $unsigned(reg13)))));
              reg27 <= $signed((^~wire14));
              reg28 <= (~&$unsigned((~$signed(((7'h44) ? reg10 : reg13)))));
            end
          if ((^~reg27))
            begin
              reg29 <= reg12[(1'h1):(1'h0)];
              reg30 <= wire16;
            end
          else
            begin
              reg29 <= (|($unsigned((|$unsigned((8'hb5)))) ?
                  (^(^$unsigned(reg4))) : reg10));
              reg30 <= (+(reg30 | (8'haf)));
            end
        end
      else
        begin
          if (($signed(reg24[(3'h4):(1'h1)]) < (-(^~wire0[(3'h4):(2'h3)]))))
            begin
              reg24 <= $unsigned({reg30});
              reg25 <= $signed((&($unsigned({reg5,
                  (8'h9d)}) == {$signed((8'haf))})));
              reg26 <= reg23[(3'h5):(2'h2)];
            end
          else
            begin
              reg24 <= reg26[(2'h2):(1'h0)];
              reg25 <= {reg28};
              reg26 <= reg10[(4'h8):(1'h1)];
              reg27 <= reg27;
              reg28 <= ((reg10 < $signed(reg22)) ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : reg28[(3'h7):(2'h3)]);
            end
          reg29 <= $signed((wire0 ?
              ((((8'hb0) >>> reg23) ?
                  (reg25 ?
                      reg27 : reg20) : {(8'hbf)}) * ($unsigned((8'ha4)) ~^ (reg25 ?
                  (8'hae) : wire1))) : reg21[(1'h0):(1'h0)]));
          reg30 <= reg7;
        end
    end
  assign wire31 = $signed((|reg13[(4'hb):(3'h7)]));
  module32 #() modinst86 (.wire35(reg5), .wire33(reg17), .wire34(wire15), .y(wire85), .wire36(wire14), .clk(clk));
  assign wire87 = reg21;
  assign wire88 = $signed({((reg25 ?
                          wire0[(3'h5):(3'h5)] : {reg8, wire3}) > {(~&wire87)}),
                      ({(reg5 != reg30)} ?
                          $signed((wire31 ?
                              (8'hac) : wire87)) : ($signed(reg7) ?
                              wire3[(1'h1):(1'h0)] : (+wire16)))});
  assign wire89 = {$signed($unsigned($unsigned(reg6[(1'h1):(1'h0)]))),
                      (reg25[(4'h8):(3'h6)] != ($signed(reg29) ~^ $signed((wire31 <= reg12))))};
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire81;
  assign y = {wire84,
                 wire83,
                 wire57,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire81,
                 (1'h0)};
  assign wire37 = $unsigned(wire34[(2'h3):(2'h2)]);
  assign wire38 = {(!($unsigned((~^(8'ha8))) || (~&wire37[(4'hd):(2'h2)])))};
  assign wire39 = $signed(wire38[(5'h14):(4'hf)]);
  assign wire40 = (wire39[(3'h5):(2'h3)] ?
                      ($unsigned(wire33[(2'h2):(1'h0)]) ?
                          (&wire38) : {wire33[(2'h3):(2'h2)]}) : wire37[(3'h7):(3'h5)]);
  assign wire41 = $signed(((~^$signed(((8'h9d) == wire37))) ?
                      (8'hb5) : (!$signed($unsigned(wire39)))));
  module42 #() modinst58 (wire57, clk, wire36, wire34, wire35, wire40, wire38);
  module59 #() modinst82 (wire81, clk, wire35, wire34, wire36, wire38, wire40);
  assign wire83 = $unsigned(wire40[(1'h0):(1'h0)]);
  assign wire84 = (((wire37 ? wire36 : wire81) < wire33) ?
                      $unsigned((wire35 == $unsigned($unsigned((8'ha1))))) : (~(~^(8'hbb))));
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(4'ha):(1'h0)] wire61;
  input wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire65;
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire65,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire65 = {wire61[(3'h7):(3'h4)]};
  always
    @(posedge clk) begin
      reg66 <= (wire63[(2'h2):(2'h2)] ~^ ({{$signed(wire65)}} ?
          wire64[(2'h2):(2'h2)] : (wire61[(1'h0):(1'h0)] & (!wire64))));
      reg67 <= {(8'ha6)};
      reg68 <= reg66[(1'h1):(1'h0)];
      reg69 <= (~&reg66);
      reg70 <= (^~reg66);
    end
  assign wire71 = {($unsigned(((~|reg70) ^~ $signed(wire62))) - wire62),
                      (($unsigned($unsigned(reg67)) ?
                              (~^(&wire60)) : $unsigned($unsigned(wire63))) ?
                          (({(8'h9d),
                              reg69} + reg70) || $unsigned((8'hbf))) : reg70)};
  assign wire72 = wire61[(2'h2):(2'h2)];
  assign wire73 = ((($signed(wire71) ?
                      reg67 : $signed($signed(wire60))) < (!wire62)) + ($unsigned({(8'hb0),
                      (~wire65)}) != (8'haf)));
  assign wire74 = $unsigned({$signed($signed(((8'h9d) ? reg66 : reg67))),
                      ({wire64} ?
                          ($signed(wire73) > (reg67 && reg66)) : wire72[(1'h1):(1'h0)])});
  assign wire75 = ({$signed((-(|reg67))), (-(~^(wire71 ? (8'haa) : (8'ha6))))} ?
                      wire62[(2'h2):(1'h0)] : (((^~wire71[(2'h2):(2'h2)]) * wire64) ?
                          (reg66 ~^ $unsigned(((8'ha4) >>> reg67))) : reg67));
  assign wire76 = {(|$unsigned(wire65[(2'h3):(2'h3)]))};
  assign wire77 = wire71[(4'h9):(2'h2)];
  assign wire78 = (!(+wire72[(2'h2):(1'h1)]));
  assign wire79 = wire73[(3'h7):(3'h6)];
  assign wire80 = $unsigned(($signed((wire79 ?
                      (!wire63) : (|wire60))) - (^(!wire74[(4'h8):(2'h3)]))));
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(5'h10):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = $signed((^($signed($signed(wire46)) > $unsigned((+wire43)))));
  assign wire49 = wire46;
  assign wire50 = wire47[(2'h3):(1'h0)];
  assign wire51 = wire43;
  assign wire52 = (wire51[(3'h4):(1'h0)] ?
                      $unsigned((((wire51 ? wire49 : wire47) ?
                              wire43[(4'ha):(4'h9)] : {(8'hac), wire50}) ?
                          (-wire47[(3'h7):(2'h2)]) : {(&wire47),
                              ((8'h9c) ?
                                  wire49 : (8'hb4))})) : (|$unsigned({$signed(wire48)})));
  assign wire53 = $signed(wire48[(1'h0):(1'h0)]);
  assign wire54 = wire44[(3'h5):(3'h4)];
  assign wire55 = wire46;
  assign wire56 = $unsigned($unsigned(({(wire52 ?
                          wire53 : wire54)} <<< (|wire52[(3'h5):(2'h3)]))));
endmodule
