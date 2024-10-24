module top
#(parameter param49 = (((~(((8'hb2) == (8'ha8)) && (^~(8'hbc)))) >= (8'haf)) || (^~(^{((8'ha6) ? (8'hac) : (8'h9c)), {(8'hae)}}))), 
parameter param50 = {((param49 << (8'hb0)) << (param49 ? (param49 ? param49 : (~|param49)) : param49)), ((&param49) != {((~|param49) ? (8'hb6) : param49), param49})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg31,
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
                 reg16,
                 (1'h0)};
  assign wire5 = ((($unsigned($unsigned(wire0)) != $unsigned((^wire1))) ^ $unsigned((wire0[(1'h0):(1'h0)] ?
                         (wire3 ? (8'hb2) : wire0) : (|wire1)))) ?
                     $signed(((wire2 ?
                         $signed(wire3) : $unsigned(wire4)) | $signed(((7'h40) | wire2)))) : wire2[(3'h4):(1'h0)]);
  assign wire6 = wire2;
  assign wire7 = {(+wire1[(4'ha):(4'ha)]), wire4};
  assign wire8 = {$unsigned(wire7[(1'h1):(1'h1)]),
                     ({(8'hb8), wire7[(1'h1):(1'h0)]} ?
                         wire6[(4'hb):(4'h8)] : (wire4[(4'ha):(1'h1)] ?
                             $signed((~wire7)) : wire3[(5'h14):(5'h10)]))};
  assign wire9 = $signed((^($unsigned((~|wire3)) ?
                     (wire5 ?
                         $unsigned(wire0) : wire5[(2'h2):(1'h1)]) : $signed(wire7[(3'h5):(3'h5)]))));
  assign wire10 = $signed(wire5);
  assign wire11 = ((wire10 ?
                          ((^(wire9 - wire4)) ?
                              (-(|wire5)) : $signed(wire6[(4'hf):(2'h3)])) : {((8'hbe) & (wire3 | (8'ha8)))}) ?
                      wire4[(1'h1):(1'h1)] : (+$unsigned($unsigned((~|wire6)))));
  assign wire12 = $unsigned((^wire4));
  assign wire13 = wire0[(4'hb):(3'h6)];
  assign wire14 = (wire0 ?
                      $unsigned(wire13) : $unsigned(((~|((8'hbe) ^~ wire12)) ^~ ($signed(wire10) == wire0))));
  assign wire15 = (&$unsigned(wire8));
  always
    @(posedge clk) begin
      reg16 <= (8'hae);
    end
  assign wire17 = (8'hb9);
  assign wire18 = ($signed($signed((&wire12))) ?
                      (($unsigned(reg16) < (^{wire4})) | wire10[(4'hb):(1'h0)]) : (((^(wire8 ?
                          wire17 : wire1)) >>> $unsigned($unsigned(wire3))) != (wire4[(4'h8):(3'h6)] != wire11)));
  assign wire19 = $signed((wire5[(3'h5):(2'h2)] ?
                      (&wire11[(5'h12):(5'h10)]) : $signed(((^~(8'h9f)) <<< $unsigned(wire17)))));
  assign wire20 = (|$unsigned({wire10, $signed(wire18)}));
  always
    @(posedge clk) begin
      reg21 <= wire10[(2'h3):(2'h3)];
      reg22 <= $unsigned((wire20[(4'hd):(3'h4)] ?
          (((reg21 ? wire2 : (8'hae)) ?
              wire5 : $unsigned(wire4)) != $unsigned($unsigned(wire20))) : (^($signed(wire7) ^ (wire17 ?
              wire2 : (8'hb6))))));
      if (wire17[(4'h8):(2'h2)])
        begin
          reg23 <= $unsigned($signed((^~$unsigned($unsigned(wire11)))));
          reg24 <= $signed(wire13[(3'h4):(2'h2)]);
          reg25 <= (~^wire8[(4'ha):(1'h0)]);
        end
      else
        begin
          reg23 <= (8'haf);
          reg24 <= wire18[(3'h4):(3'h4)];
          reg25 <= ($signed($signed(wire20[(2'h3):(2'h2)])) ?
              wire14[(2'h3):(2'h3)] : ($unsigned($unsigned($unsigned(wire10))) ?
                  wire9[(2'h2):(1'h0)] : wire0));
          reg26 <= (wire7 >= (wire9 != $signed($unsigned($signed((8'ha4))))));
        end
      if ($signed(((wire2 ?
          wire5 : $signed($unsigned((7'h41)))) >>> (reg23 * ($signed(wire5) >>> wire4)))))
        begin
          reg27 <= $signed($signed((8'hb9)));
          reg28 <= $signed({$unsigned((reg25 && wire11[(4'he):(2'h2)])),
              reg21[(1'h1):(1'h0)]});
          if ((~(($signed({wire8}) ?
              wire0[(4'h8):(1'h0)] : reg28) == (-wire7))))
            begin
              reg29 <= ($signed($signed((~^$signed(reg28)))) ?
                  $unsigned($unsigned($signed({reg28,
                      wire5}))) : ((!($unsigned(reg28) ?
                          (wire6 ? reg21 : wire3) : (wire7 ?
                              wire14 : wire15))) ?
                      {reg27, reg16} : $signed($signed(wire2))));
              reg30 <= ((($unsigned($signed(wire1)) ~^ reg24[(3'h4):(1'h0)]) ?
                  $unsigned((^(reg26 ?
                      (8'had) : wire17))) : $unsigned(wire14)) == (wire7[(4'hb):(3'h4)] ?
                  wire14 : wire12[(2'h3):(2'h3)]));
              reg31 <= (8'hb7);
              reg32 <= reg16;
            end
          else
            begin
              reg29 <= ($signed($unsigned($signed((reg27 ?
                  reg27 : reg31)))) & {wire20[(1'h0):(1'h0)]});
              reg30 <= reg29[(3'h6):(1'h0)];
              reg31 <= (reg22 ?
                  ($signed($signed(((8'ha0) >>> wire12))) <= (wire13[(4'h8):(2'h3)] | ((wire20 >= wire10) * wire2))) : reg23);
            end
          reg33 <= (~&((|wire10[(4'hc):(2'h3)]) ?
              $unsigned($unsigned(wire5)) : (!wire7[(4'ha):(1'h1)])));
        end
      else
        begin
          if (wire19[(5'h11):(1'h0)])
            begin
              reg27 <= (~&(~^wire17[(4'ha):(1'h0)]));
              reg28 <= $unsigned((($signed($signed((8'h9c))) ?
                      ((wire20 + wire18) != reg22[(5'h15):(4'hc)]) : reg32[(3'h4):(3'h4)]) ?
                  ($unsigned({reg24,
                      reg28}) * $unsigned((wire4 << reg32))) : {(7'h41)}));
              reg29 <= $signed(reg21[(3'h5):(1'h0)]);
            end
          else
            begin
              reg27 <= wire5;
              reg28 <= ($unsigned((&{reg31[(4'h8):(4'h8)]})) > (reg33 ?
                  wire2 : reg27[(3'h5):(3'h4)]));
              reg29 <= (reg30 ?
                  {(^{(+wire14)})} : $signed(reg28[(2'h2):(2'h2)]));
            end
        end
      if ($unsigned((wire12[(4'hc):(4'hb)] ?
          ((&wire6[(2'h3):(2'h2)]) ? (8'ha0) : $signed(wire3)) : (8'hbb))))
        begin
          reg34 <= (((((wire5 >>> wire2) == (+reg23)) ?
                  ({(7'h43)} >> reg21) : ($signed((8'ha0)) ?
                      $signed(wire17) : reg21)) ?
              (&((reg22 && wire19) <<< (~&wire13))) : reg16[(3'h5):(3'h4)]) - (|(reg33[(3'h7):(3'h4)] ?
              {reg32[(2'h2):(1'h1)], (7'h41)} : ((!wire0) ?
                  reg21 : (-reg24)))));
        end
      else
        begin
          if ((($unsigned((wire6[(4'hd):(4'hd)] ?
              (wire11 ?
                  wire1 : wire20) : reg16[(2'h2):(1'h1)])) <<< reg16) * wire4))
            begin
              reg34 <= (~^({(~&wire2[(3'h7):(1'h0)])} ~^ ((wire13 ?
                  wire7 : (~&reg21)) >> (+reg29))));
              reg35 <= (~(reg25[(3'h6):(1'h0)] >= $signed((8'ha5))));
            end
          else
            begin
              reg34 <= (~|wire11[(2'h2):(2'h2)]);
              reg35 <= (|(-((!$signed(reg27)) ?
                  (reg30 ?
                      {reg29,
                          (8'ha7)} : $signed(wire14)) : (!$signed((7'h43))))));
            end
          reg36 <= $signed(reg16);
          if (reg27)
            begin
              reg37 <= {(wire11 ?
                      $unsigned(((reg29 ?
                          wire14 : wire1) - ((8'hac) ^~ reg16))) : ($unsigned($unsigned(wire1)) ?
                          $signed($unsigned((8'ha6))) : reg31[(2'h2):(1'h0)]))};
              reg38 <= ({reg23,
                      $unsigned({wire2[(1'h0):(1'h0)], reg35[(3'h4):(2'h2)]})} ?
                  (wire14 ?
                      (reg16[(3'h5):(2'h2)] ~^ ((-(8'ha3)) ?
                          (reg32 >> reg23) : $signed(reg34))) : ($unsigned(reg21[(3'h5):(3'h4)]) ?
                          $signed((wire6 ?
                              wire6 : wire15)) : (reg25[(5'h10):(4'he)] * wire19))) : (reg27[(3'h4):(1'h0)] ?
                      wire20 : $unsigned($unsigned($signed(wire10)))));
              reg39 <= wire17;
            end
          else
            begin
              reg37 <= $unsigned(wire9[(1'h1):(1'h1)]);
              reg38 <= $unsigned($unsigned(wire7[(1'h1):(1'h1)]));
              reg39 <= ($unsigned(((+wire0[(2'h3):(1'h1)]) ?
                      wire14 : (!wire9))) ?
                  (!((-{wire2,
                      wire19}) & (~^(+wire13)))) : {($signed($signed(wire9)) | (&(reg26 ?
                          (8'hba) : reg35))),
                      (($unsigned(wire5) || reg28[(1'h1):(1'h1)]) ?
                          (reg37 ? (8'hae) : {reg33}) : reg21[(1'h0):(1'h0)])});
              reg40 <= (reg37[(1'h0):(1'h0)] ?
                  (+$signed($unsigned(wire1[(3'h5):(1'h1)]))) : ((((reg35 | reg22) ?
                          (reg34 ?
                              wire11 : wire18) : (wire11 == reg33)) > reg23) ?
                      (^~reg36) : (!reg37)));
              reg41 <= $unsigned(reg25);
            end
          reg42 <= (~|$unsigned(reg36));
          reg43 <= reg29;
        end
    end
  assign wire44 = (reg23[(2'h2):(2'h2)] >= wire4[(2'h3):(2'h3)]);
  assign wire45 = (~(!wire10[(1'h0):(1'h0)]));
  assign wire46 = {wire5,
                      {(reg40 || (reg34[(1'h0):(1'h0)] ?
                              wire10[(3'h7):(2'h2)] : wire13[(3'h4):(1'h1)])),
                          $signed(wire18)}};
  assign wire47 = (+wire4[(3'h7):(3'h4)]);
  assign wire48 = $signed((($unsigned(wire9[(1'h0):(1'h0)]) ?
                          wire1[(3'h4):(1'h1)] : wire20) ?
                      $signed((reg24[(3'h6):(2'h2)] && {(8'ha0)})) : reg30));
endmodule
