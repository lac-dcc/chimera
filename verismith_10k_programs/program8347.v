module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire146,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire38,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire4 = $signed($unsigned((wire3 ?
                     wire3 : ((!wire0) ? $unsigned(wire1) : (!wire0)))));
  assign wire5 = (+(8'ha9));
  always
    @(posedge clk) begin
      reg6 <= ((~|$unsigned((wire3 ?
          (wire5 >= wire5) : $signed(wire1)))) - wire3);
      reg7 <= ((!(~|$unsigned((|wire3)))) ?
          $signed(((^(wire0 == wire3)) ?
              wire4 : ($signed((7'h44)) ?
                  wire0[(4'hc):(4'hc)] : (reg6 >> wire5)))) : (^~(($signed((8'hb4)) ?
              (8'ha3) : (wire0 ? reg6 : wire4)) * reg6)));
      reg8 <= (((&{wire2[(4'h8):(4'h8)]}) < wire3) ^ $unsigned(wire5));
      if ((8'hbb))
        begin
          reg9 <= ((((&wire5) && ((&wire5) ?
                      $unsigned(reg8) : $unsigned(wire2))) ?
                  $signed($unsigned(((8'hb8) < wire3))) : (^$signed((8'haf)))) ?
              $unsigned(reg8[(3'h5):(2'h3)]) : $unsigned($signed(((~^wire5) >>> (!wire1)))));
          reg10 <= {$unsigned((wire4 ~^ reg8[(2'h2):(1'h0)])), wire2};
          reg11 <= $unsigned($signed(wire0));
          reg12 <= reg10[(3'h5):(3'h5)];
          reg13 <= (reg7[(1'h1):(1'h0)] ?
              {((~&(wire0 && reg8)) ~^ (-$signed(wire3)))} : reg6);
        end
      else
        begin
          reg9 <= wire1;
          reg10 <= {$signed(wire4), wire1[(1'h1):(1'h1)]};
          if ((reg11 ?
              $unsigned((reg9 || reg11[(4'ha):(1'h1)])) : $unsigned(((-reg7[(2'h2):(1'h0)]) + ({reg8} > reg6[(4'hb):(1'h1)])))))
            begin
              reg11 <= ((+reg6) + wire0);
            end
          else
            begin
              reg11 <= $signed((reg11 ?
                  (wire4[(4'hb):(3'h4)] != $signed($unsigned(wire3))) : wire0[(1'h0):(1'h0)]));
              reg12 <= (reg8[(2'h3):(2'h2)] ?
                  ((wire4 & wire4[(1'h0):(1'h0)]) <= (($unsigned(wire3) >>> reg11[(3'h7):(3'h6)]) ?
                      reg6 : ((wire3 >> wire2) ?
                          (~&(8'hbf)) : reg9[(1'h0):(1'h0)]))) : reg8);
            end
        end
    end
  assign wire14 = reg10;
  assign wire15 = (($unsigned($unsigned(reg13[(1'h0):(1'h0)])) ?
                      $signed($signed((+reg6))) : wire5[(3'h4):(1'h0)]) < ($unsigned({(reg6 ?
                          wire4 : wire2),
                      (reg7 ?
                          wire14 : wire2)}) ~^ $unsigned((wire1[(1'h0):(1'h0)] - reg13[(1'h1):(1'h0)]))));
  assign wire16 = ((!reg7) * wire14[(4'ha):(2'h3)]);
  assign wire17 = ((^~$signed($unsigned((wire2 ?
                      reg7 : (8'ha6))))) << ($unsigned((8'ha4)) ?
                      ($signed({reg9}) != wire3[(4'hf):(2'h2)]) : $signed((reg13[(1'h0):(1'h0)] ?
                          {wire5} : (-reg11)))));
  always
    @(posedge clk) begin
      if ((((reg12[(1'h0):(1'h0)] || (~&{(8'hbe), wire17})) ?
              $unsigned(({wire0} * (reg12 ? wire0 : reg11))) : {wire16,
                  $signed((wire15 ? wire5 : wire15))}) ?
          reg12[(3'h5):(2'h2)] : $signed((wire1[(1'h0):(1'h0)] <= reg12))))
        begin
          reg18 <= $unsigned(wire2[(1'h0):(1'h0)]);
          if (reg8[(1'h0):(1'h0)])
            begin
              reg19 <= (({{reg9[(3'h6):(3'h6)]}} ?
                  wire15[(3'h5):(1'h1)] : (~|(~^(-wire15)))) != $unsigned(((-(^~reg12)) << $signed($signed(wire15)))));
              reg20 <= reg13[(1'h1):(1'h1)];
            end
          else
            begin
              reg19 <= ((($unsigned((^wire0)) ?
                          (~^(!wire0)) : {$unsigned(wire17)}) ?
                      $unsigned({(~reg20)}) : (!((reg9 >> wire16) ?
                          (reg11 ? (8'hb8) : wire17) : $unsigned((8'hb9))))) ?
                  wire17 : ((~&$signed((~wire5))) ?
                      (~^$unsigned(((8'hb3) == (8'hb3)))) : $signed($unsigned(((8'h9f) ~^ wire3)))));
              reg20 <= (~&({(8'hbd)} ?
                  reg18[(1'h1):(1'h0)] : $signed($signed((reg9 <<< wire5)))));
              reg21 <= (reg12[(1'h0):(1'h0)] ? wire17 : wire1[(2'h2):(2'h2)]);
              reg22 <= $signed($unsigned(($signed(wire3) ?
                  wire15 : reg19[(4'he):(4'he)])));
              reg23 <= $signed((-(&{(wire5 ? wire17 : reg12), (8'hbf)})));
            end
          if (wire5)
            begin
              reg24 <= reg7[(2'h2):(1'h0)];
              reg25 <= $unsigned(reg10[(5'h10):(4'hb)]);
            end
          else
            begin
              reg24 <= $signed($signed($signed($signed($signed(wire3)))));
              reg25 <= {wire1[(1'h0):(1'h0)]};
              reg26 <= ({(+($signed(reg9) ? (&reg18) : $signed(reg10))),
                  $unsigned(reg8[(1'h0):(1'h0)])} ^~ reg13[(1'h0):(1'h0)]);
            end
          if ($signed($signed((!$unsigned((wire15 || (8'h9c)))))))
            begin
              reg27 <= ((reg9 ?
                      (((wire2 != reg23) != (!wire3)) ?
                          (wire5[(4'hf):(3'h4)] ?
                              $signed(reg18) : reg18) : ($signed(reg21) ?
                              (&reg8) : (-(8'ha3)))) : ($unsigned((reg19 >= wire2)) ?
                          {wire5,
                              (reg6 ?
                                  (8'ha2) : wire0)} : (reg12[(3'h5):(2'h2)] >>> ((8'hbe) ?
                              wire1 : wire1)))) ?
                  $signed($signed(reg7)) : ((!($signed(wire5) ?
                      $signed(reg23) : $signed(reg7))) ^~ (wire17 ?
                      ((wire15 == wire15) <= $unsigned(reg20)) : ($signed(reg8) ^ $signed(reg12)))));
              reg28 <= wire0;
              reg29 <= reg27;
              reg30 <= ($signed(((+$signed(reg29)) ?
                      (reg24 ? (^(7'h43)) : reg11[(3'h5):(1'h0)]) : reg10)) ?
                  $unsigned({$signed($unsigned(wire3)),
                      ((reg19 ?
                          reg6 : reg29) ^~ $unsigned(reg6))}) : $signed($unsigned(({(8'h9c)} ?
                      (~|wire15) : wire17[(2'h2):(1'h1)]))));
              reg31 <= (&$signed(($signed(reg11) ?
                  wire2[(3'h5):(3'h5)] : wire3)));
            end
          else
            begin
              reg27 <= $unsigned($signed($unsigned(($signed(reg27) ?
                  (wire5 || wire15) : $unsigned(reg23)))));
              reg28 <= ($unsigned($signed($unsigned({reg31, wire15}))) ?
                  wire15[(3'h6):(1'h1)] : (&$unsigned(($signed(reg18) == $signed(wire17)))));
              reg29 <= $unsigned((+$signed(wire1[(2'h2):(2'h2)])));
              reg30 <= wire1[(2'h3):(2'h2)];
              reg31 <= ({reg18[(2'h2):(1'h1)]} ^~ {(|wire1[(2'h3):(2'h2)])});
            end
          if (reg6[(2'h2):(1'h0)])
            begin
              reg32 <= reg18;
              reg33 <= $unsigned((&(-((wire0 && reg11) > $signed(wire1)))));
              reg34 <= reg8[(2'h3):(1'h1)];
            end
          else
            begin
              reg32 <= ({{(8'hae)}} >= reg27);
              reg33 <= (((reg13 ? reg23[(3'h6):(2'h2)] : {$unsigned((8'hab))}) ?
                  reg24[(3'h6):(1'h0)] : {(wire17 <<< $signed(reg13)),
                      (wire3 == wire2)}) - (reg7 || reg31));
              reg34 <= (~&(($signed($signed(reg10)) ?
                      $unsigned(wire16[(1'h0):(1'h0)]) : reg23[(1'h1):(1'h0)]) ?
                  (^~{reg12[(2'h2):(1'h0)]}) : $unsigned($signed((~|reg26)))));
              reg35 <= (($unsigned(reg18[(2'h2):(1'h1)]) ?
                  ($signed((-reg26)) || $unsigned((reg10 <= wire5))) : wire14) ^~ ($unsigned($signed($unsigned(reg13))) ?
                  {reg7, reg19[(5'h10):(3'h6)]} : reg29));
            end
        end
      else
        begin
          reg18 <= reg13;
          if ((^~(+(reg25[(4'ha):(3'h7)] || (&{(8'hb3), reg13})))))
            begin
              reg19 <= $signed($unsigned((^$signed({reg30}))));
              reg20 <= ({(((reg7 ? (7'h41) : reg19) <<< (!wire5)) >= {{reg13,
                          reg34},
                      $unsigned(wire5)}),
                  $unsigned(((~reg10) == (reg28 >> reg30)))} < $unsigned((reg24[(4'hd):(4'ha)] ?
                  wire1 : (^(8'ha9)))));
              reg21 <= $unsigned($signed(({reg34, $signed(wire3)} ?
                  (reg8 >= $unsigned((7'h42))) : wire5)));
              reg22 <= $signed((({(wire4 ? reg9 : (7'h44)), $signed(wire2)} ?
                  $signed($signed(reg33)) : (~|(reg7 & reg7))) != $unsigned(((reg18 ?
                      reg6 : (8'ha5)) ?
                  reg35 : $signed(reg26)))));
              reg23 <= $signed(($unsigned({(reg11 ? reg11 : reg27)}) ?
                  (((~(7'h44)) ?
                      (wire17 ? (8'haf) : wire16) : (~reg28)) * (reg22 ?
                      (reg22 > reg21) : {(8'ha0),
                          reg23})) : $signed((~^(reg32 >>> reg10)))));
            end
          else
            begin
              reg19 <= ($signed($signed(wire16)) ?
                  ($unsigned($signed((reg35 >>> reg28))) > (&reg9[(3'h4):(2'h2)])) : ({(wire4[(4'ha):(1'h0)] ^~ $unsigned(reg27))} ?
                      wire4[(1'h0):(1'h0)] : (({reg20} == $signed((8'hbc))) ?
                          ($signed(reg20) ?
                              wire4 : ((7'h42) ? reg21 : (8'ha3))) : wire14)));
              reg20 <= $signed(reg33);
              reg21 <= $signed((!(wire2 ?
                  (((8'hbb) && (8'hbf)) ?
                      (&reg32) : $unsigned(reg8)) : ($unsigned(reg26) ?
                      wire5[(4'h8):(2'h3)] : (8'ha4)))));
              reg22 <= (~&reg12);
              reg23 <= $unsigned(reg22);
            end
        end
      reg36 <= (^~(($unsigned(wire2) || (~reg27)) ~^ (wire17 >= reg29[(2'h3):(2'h2)])));
      reg37 <= $signed(reg33[(4'hf):(4'hb)]);
    end
  assign wire38 = (reg33 ?
                      $signed((reg18[(1'h0):(1'h0)] + wire14[(4'hb):(3'h5)])) : reg33[(4'ha):(1'h1)]);
  module39 #() modinst65 (.y(wire64), .wire41(reg28), .clk(clk), .wire42(reg33), .wire40(reg22), .wire43(reg6));
  assign wire66 = (((reg35[(3'h5):(1'h0)] != $signed(wire2)) ?
                      (((reg24 ? reg36 : reg19) ?
                          reg33[(4'h9):(4'h8)] : (wire2 ?
                              (8'hb5) : (8'h9d))) >>> (wire64 ?
                          reg22 : reg6)) : (8'hbe)) <= wire17);
  assign wire67 = (($signed($signed({wire17,
                          reg6})) <<< $unsigned($unsigned($unsigned(wire2)))) ?
                      (-wire0[(4'h9):(1'h0)]) : ((($unsigned(reg21) + reg29) ?
                          $signed((reg33 ?
                              reg6 : reg26)) : reg7[(1'h1):(1'h0)]) & wire38[(3'h6):(1'h0)]));
  assign wire68 = wire38[(3'h7):(1'h0)];
  assign wire69 = reg11;
  assign wire70 = reg7;
  module71 #() modinst147 (wire146, clk, wire1, reg11, reg34, reg30, wire15);
endmodule

module module71
#(parameter param145 = (((~^(^(~^(8'hb2)))) <<< ((~|((8'ha5) ? (7'h40) : (8'h9d))) ? (~^((8'hab) << (8'h9d))) : (((8'hb7) >> (8'hb6)) ? {(7'h41), (8'had)} : (~^(8'hbd))))) ? (8'hb7) : (((~&((8'ha0) + (7'h42))) * {{(7'h44), (8'h9f)}}) <= (({(7'h41)} ^~ ((8'hbc) ? (8'hb5) : (8'ha7))) ? (((8'ha6) == (8'hb3)) + ((8'ha4) && (8'ha4))) : {((7'h44) ? (7'h43) : (8'ha2))}))))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire76;
  input wire signed [(4'hc):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  input wire [(5'h15):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire139;
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire96,
                 wire77,
                 wire139,
                 reg141,
                 (1'h0)};
  assign wire77 = wire75;
  module78 #() modinst97 (.wire79(wire76), .clk(clk), .wire82(wire75), .wire81(wire77), .wire80(wire72), .wire83(wire74), .y(wire96));
  module98 #() modinst140 (wire139, clk, wire72, wire74, wire96, wire73, wire76);
  always
    @(posedge clk) begin
      reg141 <= ($unsigned(wire77[(3'h6):(3'h5)]) ?
          wire74 : wire96[(3'h4):(1'h0)]);
    end
  assign wire142 = wire74;
  assign wire143 = ($signed(({(wire76 ?
                               (8'ha8) : (8'ha3))} ^ $signed($unsigned(reg141)))) ?
                       wire74 : (8'ha6));
  assign wire144 = wire96[(4'h8):(1'h0)];
endmodule

module module39
#(parameter param62 = (&{(^~({(7'h41)} > (~&(8'h9e))))}), 
parameter param63 = ({{(((7'h41) >= param62) ? param62 : (param62 * param62))}, {(8'haf)}} - (((~|{param62, param62}) ~^ (param62 <= param62)) ? param62 : (param62 << {param62, {param62, param62}}))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire signed [(4'ha):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  input wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire46,
                 wire45,
                 wire44,
                 reg55,
                 reg54,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire44 = ((~^$signed(wire43)) ?
                      $signed(wire41[(1'h1):(1'h1)]) : (-(+(^$unsigned(wire40)))));
  assign wire45 = {(({(+wire44), $unsigned(wire41)} ?
                              (wire43 ?
                                  ((8'hb9) ?
                                      wire40 : wire42) : $unsigned(wire40)) : ($signed(wire42) ?
                                  wire40 : $unsigned((8'hae)))) ?
                          wire40[(4'hc):(3'h6)] : wire42[(3'h6):(2'h3)])};
  assign wire46 = $signed($unsigned(wire44));
  always
    @(posedge clk) begin
      reg47 <= $signed(wire44[(3'h5):(3'h4)]);
      reg48 <= $unsigned(($signed(wire46[(4'h9):(3'h7)]) ^ (((8'hbe) ?
          wire46 : $unsigned((8'hb8))) != wire43)));
      reg49 <= $signed(wire42[(4'h9):(3'h7)]);
    end
  assign wire50 = $unsigned(((reg47 == (~reg48[(3'h5):(2'h2)])) ?
                      reg48 : (~{{(8'ha8), reg48}})));
  assign wire51 = wire43;
  assign wire52 = (~^{((wire40[(4'h8):(2'h3)] ?
                              (~|reg49) : (reg49 ? wire42 : (8'hb6))) ?
                          (~|wire40) : ((^~reg47) ?
                              $unsigned(reg47) : {reg49, wire44}))});
  assign wire53 = {{reg49,
                          ((wire40[(5'h10):(1'h0)] != wire40[(4'hf):(2'h3)]) <= ($signed(wire52) ?
                              wire40[(2'h3):(2'h3)] : $unsigned(wire42)))}};
  always
    @(posedge clk) begin
      reg54 <= reg47[(3'h6):(3'h5)];
      reg55 <= ((8'hba) ?
          (wire51[(3'h6):(2'h3)] ~^ reg47) : ($signed(wire40[(4'h8):(1'h1)]) > ({(wire52 ?
                  wire53 : (8'hb1))} >= ((^~reg48) << (~&reg48)))));
    end
  assign wire56 = ((~^reg49) ?
                      {$unsigned($unsigned((reg48 ? wire45 : wire44))),
                          (~&($signed(reg54) ?
                              $signed(reg55) : (^~wire41)))} : (~wire50[(2'h3):(1'h1)]));
  assign wire57 = $unsigned((({wire42, wire40[(3'h6):(3'h6)]} ?
                      {(8'hbb),
                          $signed((8'hb8))} : (~^reg54)) ^~ (!($unsigned(wire44) ?
                      $signed(wire46) : (wire44 || (8'hbc))))));
  assign wire58 = $signed($unsigned(($unsigned((wire44 != (8'hb7))) ?
                      (^(8'ha8)) : {(reg48 ? wire51 : wire40)})));
  assign wire59 = $unsigned((^{reg55[(3'h5):(2'h2)], reg49}));
  assign wire60 = wire51[(4'h8):(3'h6)];
  assign wire61 = $unsigned((|(8'hbf)));
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire [(3'h5):(1'h0)] wire100;
  input wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  assign y = {wire138,
                 wire125,
                 wire124,
                 wire123,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
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
                 (1'h0)};
  assign wire104 = (8'h9d);
  assign wire105 = ($signed((wire104[(3'h6):(3'h4)] ?
                       (~^$signed(wire99)) : wire104)) >= wire104);
  assign wire106 = ({wire101[(3'h4):(1'h1)],
                       ({(wire102 ^ wire105),
                           wire101} & $signed($unsigned((8'haf))))} ~^ ($unsigned((wire99 - {(8'had)})) ^~ $signed(wire101)));
  assign wire107 = wire104;
  assign wire108 = {$unsigned(wire100[(1'h1):(1'h1)])};
  assign wire109 = wire100[(1'h0):(1'h0)];
  assign wire110 = wire109;
  assign wire111 = (wire100[(3'h4):(1'h0)] ?
                       ($unsigned((wire110[(3'h7):(1'h1)] <= wire102[(3'h7):(3'h7)])) ?
                           $unsigned({(^(8'hb1))}) : $signed(wire104[(4'ha):(3'h7)])) : $signed($unsigned(($unsigned(wire101) ^ $unsigned(wire107)))));
  always
    @(posedge clk) begin
      if ((8'hbd))
        begin
          reg112 <= $signed((8'ha0));
        end
      else
        begin
          reg112 <= ((^(8'haa)) <<< wire109[(1'h1):(1'h1)]);
          reg113 <= (^~(wire110[(1'h1):(1'h0)] >= wire108[(3'h4):(3'h4)]));
          if ({wire101[(2'h3):(2'h2)],
              (({(wire105 ^ wire99), reg112[(3'h6):(1'h0)]} ?
                  $unsigned(((7'h44) ?
                      wire102 : wire106)) : $signed($signed(reg112))) - wire110[(2'h2):(1'h1)])})
            begin
              reg114 <= wire102;
              reg115 <= ({$signed(((&wire100) ^ $unsigned((8'hb7)))),
                  $unsigned((~^(^wire108)))} < wire99);
              reg116 <= $signed(wire101);
            end
          else
            begin
              reg114 <= (^reg115[(5'h11):(4'h9)]);
              reg115 <= ((((^{wire104, wire105}) ?
                  ((reg113 ?
                      wire111 : (8'haa)) * reg116[(4'h8):(3'h6)]) : ($unsigned(wire100) ?
                      wire102[(4'hc):(3'h6)] : (wire103 + (8'hb9)))) + ((~$unsigned(wire102)) != {(~&(8'hbc)),
                  (reg116 ?
                      (8'h9d) : wire103)})) && (reg113 <<< (wire103[(4'hb):(2'h2)] ?
                  (8'ha3) : (+$unsigned(wire101)))));
              reg116 <= (~wire108);
            end
          reg117 <= (^reg116[(2'h2):(1'h1)]);
          if ($signed((~$signed(((wire100 ?
              wire103 : reg116) > $unsigned(reg113))))))
            begin
              reg118 <= $signed((~$signed(reg115)));
              reg119 <= (((7'h42) || $signed($unsigned(reg116[(4'hf):(4'hf)]))) ?
                  wire111[(3'h4):(1'h1)] : wire108);
              reg120 <= reg113[(1'h0):(1'h0)];
            end
          else
            begin
              reg118 <= $signed(reg119[(4'hb):(1'h0)]);
              reg119 <= ({{(~^reg119), reg118[(3'h4):(2'h3)]},
                  (8'hb1)} | (reg117[(3'h4):(1'h0)] || ($signed({reg117}) ?
                  ($signed(wire106) >>> $unsigned(wire101)) : wire111)));
              reg120 <= reg117[(2'h2):(1'h1)];
              reg121 <= ($unsigned(wire106[(1'h0):(1'h0)]) >= reg115);
              reg122 <= (($signed({(8'hba), $signed(wire103)}) ?
                  (~&((+reg114) && (wire111 ?
                      wire100 : wire105))) : wire110[(1'h1):(1'h1)]) != $signed($unsigned((wire111 <<< (wire99 ?
                  reg117 : wire101)))));
            end
        end
    end
  assign wire123 = $unsigned(wire100);
  assign wire124 = (wire104 ?
                       ($unsigned((reg116[(4'hf):(3'h5)] - {(8'ha0),
                               wire100})) ?
                           $signed(((reg122 && wire111) > $signed(wire102))) : (|(~(~^(8'ha3))))) : reg118);
  assign wire125 = wire106[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg126 <= (reg120[(2'h2):(1'h0)] ?
          $unsigned((reg113[(4'hb):(3'h4)] ?
              (reg114 ?
                  $signed(wire102) : $unsigned(reg113)) : reg119)) : $signed($unsigned(wire125)));
    end
  always
    @(posedge clk) begin
      if ({{wire104}})
        begin
          reg127 <= (8'hb3);
          reg128 <= wire108;
        end
      else
        begin
          reg127 <= wire100[(1'h0):(1'h0)];
          reg128 <= $signed({$signed($signed((wire111 ? reg119 : wire106)))});
          reg129 <= wire110[(3'h4):(2'h3)];
          if ((($unsigned($unsigned((reg128 == (8'ha2)))) ?
                  ((-reg112) ?
                      ((wire105 ?
                          reg120 : (8'haa)) && (reg122 << wire103)) : $unsigned((wire123 * wire101))) : $unsigned($unsigned($unsigned(reg115)))) ?
              wire123 : (^($signed((reg127 ? (8'hbc) : wire107)) ?
                  ((wire104 ^ reg120) ?
                      $unsigned(wire108) : $unsigned(wire111)) : wire100[(3'h4):(1'h0)]))))
            begin
              reg130 <= wire110[(2'h2):(1'h0)];
              reg131 <= $unsigned(reg115[(4'he):(3'h6)]);
              reg132 <= reg128[(1'h1):(1'h0)];
              reg133 <= $signed((~^wire124[(3'h6):(2'h2)]));
            end
          else
            begin
              reg130 <= $unsigned($signed($unsigned(reg114)));
              reg131 <= (~|$signed(((8'hbd) < (-reg122[(4'hd):(4'hd)]))));
            end
        end
      reg134 <= reg127[(1'h1):(1'h0)];
      reg135 <= reg130[(3'h4):(2'h3)];
      reg136 <= (~reg129[(4'he):(3'h5)]);
      reg137 <= (wire102[(3'h4):(1'h0)] * reg135);
    end
  assign wire138 = $signed($unsigned(wire107));
endmodule

module module78
#(parameter param95 = {{({(-(8'hbf))} * ({(8'hb5), (8'hb1)} ? ((7'h42) <<< (7'h43)) : (8'ha9)))}})
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire83;
  input wire [(4'hc):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire81;
  input wire signed [(5'h11):(1'h0)] wire80;
  input wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 (1'h0)};
  assign wire84 = wire80[(4'hf):(1'h0)];
  assign wire85 = $unsigned($signed((wire83[(4'hb):(3'h4)] ?
                      $signed(wire83) : $unsigned($unsigned(wire84)))));
  assign wire86 = wire83;
  assign wire87 = $unsigned($signed($signed($unsigned($signed((8'hb3))))));
  assign wire88 = ($signed((|((wire83 ? wire80 : wire82) ?
                      (wire86 >= wire81) : (wire80 == wire82)))) >> ($unsigned((+wire81[(4'h9):(3'h5)])) <= $signed({$signed(wire84)})));
  assign wire89 = ((|$signed((((8'ha2) ? wire81 : wire84) ?
                          wire82 : {wire81}))) ?
                      ((!((wire82 ? wire80 : (8'haa)) ?
                          (wire79 ?
                              (8'ha4) : wire86) : $signed(wire87))) ^~ (^~$unsigned((wire85 ?
                          wire88 : (8'ha3))))) : $signed((^$unsigned((wire87 ?
                          wire82 : wire79)))));
  assign wire90 = $unsigned(wire81);
  assign wire91 = $unsigned((wire90[(2'h2):(1'h0)] ?
                      {wire90[(1'h0):(1'h0)]} : (!(+{wire81, wire79}))));
  assign wire92 = wire81[(3'h4):(2'h3)];
  assign wire93 = $signed((!(wire83 ?
                      $unsigned($unsigned(wire79)) : $signed((^~wire90)))));
  assign wire94 = (wire79 & wire92);
endmodule
