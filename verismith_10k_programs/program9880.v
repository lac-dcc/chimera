module top
#(parameter param50 = (((-(((8'ha7) ? (8'hab) : (7'h40)) << (^~(7'h41)))) ? ({((8'hb7) < (8'haa)), (-(8'ha2))} ^ (((8'h9f) ? (7'h43) : (8'hb5)) + ((8'haa) != (8'hb5)))) : (&({(8'ha6)} << ((8'h9d) + (8'ha1))))) ~^ (~((8'hbf) > (-((8'had) >>> (8'ha3)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire40;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 (1'h0)};
  module5 #() modinst41 (.y(wire40), .clk(clk), .wire6(wire1), .wire7(wire0), .wire8(wire3), .wire10(wire2), .wire9(wire4));
  assign wire42 = (!{$unsigned(wire3)});
  assign wire43 = (8'ha1);
  assign wire44 = (((-$unsigned((wire40 ? wire0 : wire42))) ?
                          ((~&$unsigned(wire1)) >> wire1[(2'h2):(1'h1)]) : ($unsigned(wire1[(1'h0):(1'h0)]) ?
                              {wire3, (8'ha8)} : ((wire1 ? wire2 : wire42) ?
                                  $signed(wire42) : wire3))) ?
                      ((^wire40) ?
                          (~^$signed($signed(wire1))) : $unsigned((+wire4))) : $unsigned(wire4));
  assign wire45 = (wire0[(1'h0):(1'h0)] < wire44);
  assign wire46 = (!$unsigned($unsigned(((~^wire43) > (wire40 ~^ wire42)))));
  assign wire47 = (^wire40);
  assign wire48 = ((!$unsigned($unsigned(wire43[(3'h5):(2'h2)]))) ?
                      $unsigned(wire4) : ((~($signed(wire43) ?
                              $unsigned(wire4) : (wire45 + wire2))) ?
                          (wire47 ?
                              (((8'hae) ? wire43 : (8'ha1)) ?
                                  (+wire40) : (~|wire44)) : $signed($signed(wire0))) : {wire3,
                              (^~(~^wire4))}));
  assign wire49 = (($signed($signed((7'h42))) - ((wire40 << $unsigned(wire48)) || $signed((wire43 ?
                      wire43 : wire45)))) * {wire48[(3'h7):(3'h7)]});
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire11;
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire11,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = ({(~^$unsigned(wire7[(2'h3):(1'h0)])),
                      (|((wire7 ? wire8 : (8'haf)) <= (wire8 ?
                          wire7 : wire8)))} ^~ $signed($unsigned(((~&wire8) >= (~&(8'hba))))));
  always
    @(posedge clk) begin
      if (((($signed((+(8'ha0))) < ($signed(wire9) ?
              (~|wire7) : $signed(wire9))) ?
          {wire6, wire7[(3'h4):(1'h1)]} : (wire11 ?
              wire7[(2'h2):(1'h0)] : $signed(wire11[(3'h7):(3'h4)]))) ^~ (+(8'hab))))
        begin
          reg12 <= ((7'h40) << $signed(wire8[(1'h1):(1'h1)]));
          reg13 <= $unsigned((^$unsigned(wire10[(4'h9):(1'h1)])));
          reg14 <= {{wire7[(3'h4):(1'h1)]}};
        end
      else
        begin
          reg12 <= ((&$unsigned($signed((!wire8)))) <<< (wire10[(2'h2):(2'h2)] ?
              wire6[(1'h0):(1'h0)] : wire11));
          reg13 <= $signed($unsigned($signed(reg12)));
        end
      reg15 <= $unsigned(wire10[(4'h9):(3'h4)]);
      reg16 <= $signed((~^($signed($signed(reg12)) ?
          $unsigned(((8'ha6) ~^ wire11)) : wire9[(4'h8):(3'h5)])));
      reg17 <= (~wire11[(2'h2):(1'h1)]);
    end
  assign wire18 = {{$signed(($unsigned(reg15) >> (8'ha6))),
                          wire9[(3'h5):(1'h0)]},
                      ($signed($signed((wire7 ? wire9 : wire8))) ?
                          ($signed(reg14) ~^ wire11) : $signed(reg12))};
  assign wire19 = ({wire9[(3'h7):(3'h6)], (^$signed($unsigned(reg14)))} ?
                      $unsigned((|reg15)) : (({(8'ha9),
                                  (reg17 ? (8'ha6) : wire9)} ?
                              ((8'h9e) ?
                                  {wire6} : (wire18 && reg15)) : $unsigned((8'h9d))) ?
                          ((+(wire18 ?
                              wire18 : wire18)) | reg12) : wire7[(2'h2):(1'h1)]));
  assign wire20 = ((^wire18) ? {(|$unsigned(wire8))} : wire9[(1'h1):(1'h1)]);
  assign wire21 = $unsigned((^~(!(~{wire10}))));
  assign wire22 = $unsigned($signed((((wire18 ?
                      (8'ha4) : reg16) | (wire20 > (8'hbf))) | $signed(((8'hab) ?
                      reg14 : wire19)))));
  assign wire23 = wire20;
  assign wire24 = (8'had);
  assign wire25 = $unsigned(($signed((!reg13)) == (~^wire20[(2'h3):(1'h0)])));
  assign wire26 = $signed(wire9);
  always
    @(posedge clk) begin
      reg27 <= (8'had);
      reg28 <= {$signed(reg13[(1'h0):(1'h0)])};
      reg29 <= $signed($signed(wire22));
      reg30 <= ((reg16[(1'h0):(1'h0)] ?
          reg14 : (|wire26[(4'hb):(2'h3)])) >> ((~|wire7[(2'h2):(1'h1)]) >= {(wire11[(3'h5):(3'h4)] <= (reg13 <= wire6))}));
      if (((wire8[(1'h1):(1'h0)] ?
          wire19[(2'h2):(2'h2)] : $signed(($signed(reg16) & {(8'ha0)}))) >>> (((reg16 | (-wire6)) ?
          {{reg14, reg14}} : wire7[(3'h4):(1'h0)]) ^ ($signed((~|wire11)) ?
          $unsigned(reg28) : wire7[(1'h1):(1'h0)]))))
        begin
          if ($unsigned(wire26))
            begin
              reg31 <= (((^((wire8 || (7'h42)) ?
                      $signed(wire21) : (reg15 - wire25))) ?
                  ({wire18} ?
                      ((reg16 && reg16) == $signed(wire10)) : (&$unsigned(wire25))) : (!$signed($unsigned(wire22)))) - (^reg28));
              reg32 <= $unsigned((reg17[(4'hd):(3'h6)] ^ $signed($signed($unsigned(wire7)))));
            end
          else
            begin
              reg31 <= ($unsigned($signed(((wire6 ? wire23 : reg29) ?
                  {wire6} : reg16[(4'ha):(1'h0)]))) << ((^(wire7 ?
                      (~|wire6) : (|(7'h44)))) ?
                  (wire20 ?
                      reg14 : reg32[(3'h7):(2'h3)]) : reg14[(4'h9):(3'h5)]));
              reg32 <= (~^(8'ha1));
            end
        end
      else
        begin
          reg31 <= wire19;
          if ((reg15 ?
              $unsigned((&$signed($signed(wire19)))) : $signed(({$signed(reg28)} ?
                  wire22[(1'h0):(1'h0)] : {(8'haa), wire24}))))
            begin
              reg32 <= (+(wire18 ?
                  (wire20[(3'h5):(3'h5)] << wire23) : (-$unsigned(wire21[(1'h0):(1'h0)]))));
              reg33 <= $unsigned((wire7[(3'h4):(3'h4)] >= (!$unsigned($unsigned(reg28)))));
            end
          else
            begin
              reg32 <= (!({(|$signed(wire10))} ?
                  {(~(wire21 ? wire9 : wire19)),
                      (reg31 ^ (wire8 * (8'hb5)))} : reg32));
              reg33 <= (+$signed(wire22));
              reg34 <= $unsigned(reg32);
              reg35 <= $unsigned(reg15);
            end
          if ((7'h41))
            begin
              reg36 <= (-$unsigned($signed((^~(+wire11)))));
              reg37 <= wire7[(1'h1):(1'h1)];
              reg38 <= (~^(-$signed(wire11)));
              reg39 <= ($unsigned($signed($signed({wire26}))) + (($unsigned(wire21) < $signed((^~(8'hae)))) <= wire7));
            end
          else
            begin
              reg36 <= (8'hb9);
              reg37 <= (8'ha9);
              reg38 <= ($unsigned(((&(reg39 ? (8'ha4) : reg14)) ?
                  $unsigned((-reg37)) : {$signed(reg27),
                      reg27[(2'h3):(1'h0)]})) ^ (~|(|reg16)));
              reg39 <= {{$signed({(reg16 ? reg29 : reg34),
                          (reg28 ? reg13 : wire6)}),
                      ((wire9[(2'h3):(2'h3)] & wire24) ?
                          $unsigned((reg35 ? wire20 : wire8)) : reg14)}};
            end
        end
    end
endmodule
