module top
#(parameter param75 = ({(^~(~((8'hb0) <<< (8'ha8))))} >> {((7'h41) ^~ (8'ha1))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire69;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire4,
                 wire5,
                 wire6,
                 wire69,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = {$signed(wire4), $signed(wire0[(2'h3):(1'h1)])};
  assign wire6 = (^~((^~($unsigned(wire4) ?
                     (wire4 << wire5) : (8'ha4))) >>> ($signed($unsigned(wire5)) ?
                     {(^~wire2), {(8'hb6)}} : ((^~wire0) ?
                         $unsigned((8'ha1)) : {wire4}))));
  module7 #() modinst70 (.wire12(wire5), .wire10(wire2), .wire9(wire0), .clk(clk), .wire8(wire1), .wire11(wire4), .y(wire69));
  assign wire71 = $signed(wire6[(4'h9):(3'h7)]);
  assign wire72 = $signed(($unsigned({(^~wire2)}) <= ($unsigned((wire6 ?
                          wire6 : wire0)) ?
                      $unsigned($unsigned(wire4)) : wire69)));
  assign wire73 = {$unsigned(wire71[(1'h1):(1'h0)])};
  assign wire74 = {$signed(({$signed(wire5)} == (^~(+wire5))))};
endmodule

module module7
#(parameter param67 = ({((!(|(8'hb4))) >>> (((8'h9f) ? (8'ha6) : (8'hbf)) >= (~|(8'had))))} ? {(-(~|((8'hb8) ^ (8'hbc))))} : ({({(8'hb7)} < (&(8'ha8)))} ? (~((!(8'hb3)) ? ((8'had) ? (8'hb2) : (8'h9d)) : ((8'ha6) * (7'h40)))) : (~(((8'ha4) ? (7'h42) : (8'hb1)) ? (^~(8'ha9)) : ((8'had) ? (8'hb6) : (8'ha7)))))), 
parameter param68 = (^(+{(~(|(8'ha0)))})))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire63;
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire41,
                 wire42,
                 wire63,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = $signed(wire11[(1'h1):(1'h1)]);
  assign wire14 = wire9[(3'h7):(1'h1)];
  assign wire15 = $signed({$signed((^(wire10 + wire14))),
                      ((&$signed(wire12)) ?
                          {$signed(wire12)} : $unsigned((wire10 ?
                              wire14 : wire14)))});
  always
    @(posedge clk) begin
      reg16 <= $signed((8'h9d));
      if ({$unsigned($unsigned($unsigned(((8'ha0) ? wire15 : wire12))))})
        begin
          if ($unsigned((wire13 ?
              (^~wire14) : $unsigned($signed((wire8 > (8'hb5)))))))
            begin
              reg17 <= wire8;
            end
          else
            begin
              reg17 <= reg17;
              reg18 <= $signed((~&wire13));
            end
          reg19 <= $signed(wire14);
          reg20 <= $signed(reg18);
          reg21 <= ({wire12[(2'h2):(2'h2)]} * reg20[(2'h3):(2'h2)]);
        end
      else
        begin
          if ($unsigned(wire9[(4'h8):(1'h0)]))
            begin
              reg17 <= {$unsigned(wire12[(1'h1):(1'h1)]),
                  $unsigned((~^$signed((reg16 > reg18))))};
              reg18 <= $signed($unsigned((reg16 ?
                  $unsigned((+wire8)) : (+wire15[(2'h2):(1'h0)]))));
              reg19 <= $unsigned(($unsigned(wire8) ^ $signed(wire12)));
            end
          else
            begin
              reg17 <= (((wire14[(3'h5):(1'h1)] && wire10[(3'h6):(3'h5)]) ?
                  (~|$unsigned((-wire13))) : ((reg19 ?
                      (&(8'ha2)) : reg20) <<< (((8'hb0) ^~ wire15) == (|wire14)))) >= ((8'h9d) ?
                  wire10 : (wire12[(1'h1):(1'h0)] ?
                      (~$signed(wire13)) : $unsigned(reg18[(2'h2):(2'h2)]))));
              reg18 <= (($signed($signed((8'had))) == {$unsigned((reg17 < (8'ha1)))}) | (8'haf));
              reg19 <= $signed({($unsigned((wire11 ? reg21 : (7'h41))) ?
                      ($unsigned(wire13) ?
                          reg21[(3'h6):(3'h5)] : reg19) : (wire8[(1'h1):(1'h0)] ?
                          wire9[(2'h3):(1'h1)] : reg17)),
                  $signed(reg19)});
            end
        end
      reg22 <= wire12[(1'h0):(1'h0)];
      reg23 <= $signed((wire13[(4'hd):(4'h8)] ?
          wire13[(3'h5):(3'h5)] : (&({reg21} <<< reg19))));
      reg24 <= (reg17 ? $unsigned($unsigned(wire10)) : (8'hbb));
    end
  assign wire25 = $unsigned({({(reg21 ~^ (8'hb6)),
                          (8'hae)} <<< $unsigned((reg18 ? reg17 : wire12))),
                      wire8});
  assign wire26 = $signed($unsigned(wire25));
  assign wire27 = (7'h44);
  assign wire28 = {reg19[(3'h7):(2'h3)], reg16};
  assign wire29 = (((({wire12, reg17} != {reg17}) ?
                          (-{reg23}) : $unsigned(((8'hab) ? reg17 : reg20))) ?
                      (~^$unsigned((+reg24))) : reg21[(2'h3):(2'h3)]) << ((^~reg21[(1'h1):(1'h1)]) > (($signed(wire8) ?
                          $unsigned(reg18) : ((8'hb6) ? (7'h43) : wire9)) ?
                      (~&$unsigned(wire8)) : $signed((&wire9)))));
  assign wire30 = ($unsigned(wire28[(4'h8):(3'h7)]) ?
                      {(((wire13 && reg24) << (wire15 - (8'hab))) ?
                              $signed((&(7'h40))) : (+wire13[(3'h6):(2'h2)])),
                          (($unsigned(reg23) >= $signed(wire13)) || ($signed(wire8) ?
                              (reg21 ? reg16 : reg24) : (~reg17)))} : {wire13});
  always
    @(posedge clk) begin
      if (wire14[(3'h5):(3'h5)])
        begin
          reg31 <= wire13[(4'hd):(4'ha)];
          reg32 <= reg20[(2'h2):(1'h1)];
          reg33 <= (((+(^~reg23)) ?
                  (reg31[(4'h8):(1'h1)] ?
                      $signed($signed(wire10)) : {(^~reg24)}) : (-$signed(reg20[(3'h5):(2'h2)]))) ?
              wire10[(5'h10):(2'h2)] : ((8'ha1) != (((wire26 ?
                  (8'hbf) : wire27) && (reg16 ?
                  wire11 : wire8)) >>> $unsigned(wire13))));
          if ((-$unsigned((reg19[(5'h10):(4'hb)] ?
              $signed((reg16 & (8'hb7))) : wire10[(3'h6):(1'h0)]))))
            begin
              reg34 <= reg21;
              reg35 <= (((8'hb9) ?
                  $unsigned(((8'hac) > wire26[(1'h1):(1'h0)])) : reg20) == (wire25[(3'h4):(3'h4)] ?
                  reg34 : $signed({$signed(wire10)})));
              reg36 <= ((8'hae) ?
                  $signed({($signed(reg33) ^~ (reg17 ^ wire11)),
                      {(wire15 >> wire26), $unsigned(reg23)}}) : (!(+((8'h9c) ?
                      (wire15 ? reg16 : wire29) : wire14))));
            end
          else
            begin
              reg34 <= ($signed({{reg35[(1'h1):(1'h1)]},
                      ((^wire10) >= $signed((8'hb2)))}) ?
                  wire10[(2'h2):(1'h1)] : (~|((~&reg22) ?
                      (-$signed(reg21)) : reg34[(2'h2):(1'h0)])));
              reg35 <= reg24;
              reg36 <= $unsigned((^~reg16));
              reg37 <= reg36[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg31 <= $unsigned($unsigned(reg18));
          reg32 <= (reg37[(3'h4):(3'h4)] ?
              $signed((reg35[(2'h2):(1'h1)] > $signed($signed(reg17)))) : (~^$unsigned($unsigned((-wire14)))));
        end
      reg38 <= reg31[(4'h8):(3'h7)];
      reg39 <= (((&reg35) ?
          ($signed($signed((7'h42))) & (reg16[(3'h6):(2'h2)] ?
              $unsigned((8'hb5)) : reg22)) : reg20[(3'h5):(1'h1)]) | reg17);
      reg40 <= (wire9[(2'h3):(2'h2)] >= (~|(&reg39)));
    end
  assign wire41 = ($signed(wire8[(2'h2):(2'h2)]) ?
                      $signed($signed($unsigned((&reg36)))) : (($signed((~reg18)) ?
                              (((8'hb5) * reg31) ?
                                  $signed(wire27) : (^reg24)) : (-$unsigned(reg20))) ?
                          $signed(reg39) : (8'hb0)));
  assign wire42 = reg16;
  module43 #() modinst64 (wire63, clk, wire26, wire9, reg20, wire10, reg37);
  assign wire65 = (|(^reg18));
  assign wire66 = $unsigned((8'ha4));
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= $unsigned($signed((wire44 >>> $signed(wire46[(1'h1):(1'h0)]))));
      reg50 <= (8'hbe);
    end
  assign wire51 = ((|((wire45 ? wire48 : {wire44}) ~^ {(wire45 ?
                          wire44 : wire48)})) >> wire45[(2'h2):(1'h1)]);
  assign wire52 = $signed($unsigned({wire47, (^~(reg50 ? reg50 : (8'hb0)))}));
  assign wire53 = (8'hab);
  assign wire54 = $unsigned($unsigned(($signed({wire44,
                      (8'hac)}) && ($signed(wire47) | $unsigned(reg49)))));
  assign wire55 = wire53[(2'h3):(2'h3)];
  assign wire56 = $unsigned($signed(wire54));
  always
    @(posedge clk) begin
      reg57 <= wire51[(3'h5):(3'h5)];
      reg58 <= {wire46,
          (-{(wire55 ? (wire45 ? wire52 : wire47) : reg50[(4'h8):(2'h3)])})};
      reg59 <= (~({$signed((wire51 ? wire48 : (8'hb4)))} && ((wire47 ?
          wire56 : wire55[(4'h9):(3'h6)]) - $unsigned(wire54[(3'h5):(3'h5)]))));
      reg60 <= $signed((!($unsigned($unsigned(wire44)) + {((8'ha3) >>> reg49),
          $unsigned(wire46)})));
    end
  assign wire61 = $signed(wire47[(4'he):(1'h1)]);
  assign wire62 = (($unsigned(wire52) != $unsigned(($unsigned(wire54) ?
                      wire45 : (reg58 ?
                          wire44 : wire54)))) ~^ $unsigned($signed(wire56[(2'h2):(1'h1)])));
endmodule
