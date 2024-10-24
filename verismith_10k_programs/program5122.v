module top
#(parameter param67 = (~&({({(8'ha1)} ? (~(8'hbd)) : ((8'hb5) ? (8'hac) : (8'hba)))} ? (~((8'hb9) != (8'hb5))) : ((+(~(8'hb6))) >>> ((+(8'ha1)) - ((8'hbf) <= (8'had)))))), 
parameter param68 = ((8'hb3) ? ((8'hb5) ? param67 : ({(param67 ? param67 : param67), (param67 ? param67 : param67)} <<< param67)) : param67))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire57;
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire5,
                 wire57,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire5 = ($signed(wire0[(1'h0):(1'h0)]) ^~ (wire0 >= wire4));
  module6 #() modinst58 (wire57, clk, wire0, wire4, wire3, wire1, wire5);
  always
    @(posedge clk) begin
      reg59 <= $signed(wire4);
      if ((~|wire57[(1'h1):(1'h1)]))
        begin
          reg60 <= {(8'hbc), (!(wire5 && wire5[(2'h2):(1'h0)]))};
        end
      else
        begin
          reg60 <= ($signed({(wire57 ~^ wire0[(4'ha):(4'h8)])}) ?
              $signed((wire1[(3'h7):(2'h3)] <= $signed($unsigned(wire0)))) : reg60);
          reg61 <= $signed((8'ha7));
          reg62 <= wire2[(4'hb):(4'hb)];
        end
      reg63 <= $signed(wire1[(4'hb):(4'h8)]);
    end
  assign wire64 = {((reg59 - (wire1[(4'hb):(4'hb)] <<< $signed(reg63))) ?
                          {wire2,
                              wire0[(2'h3):(1'h0)]} : (&$unsigned((&reg62)))),
                      (-$signed((reg62[(1'h0):(1'h0)] * $unsigned(wire5))))};
  assign wire65 = $signed($unsigned(((+$signed(wire3)) - reg60[(4'he):(4'hd)])));
  assign wire66 = (!reg60[(5'h10):(4'hb)]);
endmodule

module module6
#(parameter param55 = (~&((((&(8'ha1)) ? (!(8'haa)) : (8'ha5)) ? ({(8'hbf)} - ((8'hab) & (8'hb8))) : ({(8'ha4), (8'hb4)} ? ((8'hac) ? (8'hb8) : (8'hac)) : ((8'hae) ? (8'ha6) : (8'hb3)))) ? ((((8'had) <<< (8'h9e)) << (~(7'h44))) ? (((8'hbe) ? (8'hbd) : (8'hb2)) ? ((8'hb0) ? (8'h9e) : (8'hba)) : {(8'hb3)}) : (((8'hb2) ? (8'hb9) : (8'ha5)) ? ((8'hbc) << (8'ha2)) : ((8'hbc) | (8'hb1)))) : (&{((8'hb4) ? (8'ha5) : (8'hb5)), ((8'hb0) ? (8'hb0) : (8'hba))}))), 
parameter param56 = param55)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire36;
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire36,
                 reg52,
                 reg51,
                 reg50,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  module12 #() modinst37 (.wire15(wire10), .wire14(wire11), .clk(clk), .wire16(wire7), .wire13(wire8), .y(wire36));
  always
    @(posedge clk) begin
      reg38 <= $signed((+(^(!{wire8}))));
      reg39 <= $signed(wire11);
      reg40 <= $signed($signed((wire11[(2'h2):(1'h0)] != ((8'had) * $signed(wire9)))));
      reg41 <= ({wire9, (+(~&$unsigned(reg39)))} || wire8);
    end
  assign wire42 = $unsigned((^~{(wire7 ?
                          $unsigned((8'ha5)) : $signed(reg41))}));
  assign wire43 = {reg40};
  assign wire44 = $unsigned($unsigned($signed({reg41[(3'h5):(2'h3)]})));
  assign wire45 = (wire44[(1'h0):(1'h0)] + wire10[(3'h6):(3'h5)]);
  assign wire46 = $unsigned(wire42);
  assign wire47 = wire11;
  assign wire48 = ($unsigned(($unsigned((&(8'ha6))) <<< {(wire11 < wire47),
                          reg39[(5'h12):(2'h2)]})) ?
                      wire11 : $signed((-wire11)));
  assign wire49 = (~&((+wire8) ? (^~(~|$signed(wire47))) : wire9));
  always
    @(posedge clk) begin
      reg50 <= reg38[(3'h6):(1'h0)];
      reg51 <= ($unsigned((~((wire8 ?
          reg40 : reg40) << (wire43 > wire48)))) >> $unsigned(wire36));
      reg52 <= $unsigned($unsigned(wire11));
    end
  assign wire53 = wire42;
  assign wire54 = ((7'h42) ?
                      (!reg40) : {(~|reg51[(1'h1):(1'h1)]),
                          (~&((~&reg41) >= (8'hbe)))});
endmodule

module module12
#(parameter param34 = ((((((8'haa) ? (8'haa) : (7'h42)) + (!(8'hba))) && (((8'haf) >>> (8'hac)) ? ((8'hba) ? (8'ha5) : (8'hae)) : ((8'hb6) ? (8'h9e) : (8'hb4)))) ? ((~|(8'h9d)) ? (8'ha7) : ((~(8'ha8)) <= {(8'ha8)})) : ((((8'ha7) * (8'ha0)) ? (~(8'ha7)) : (^~(7'h42))) ? (((8'ha9) != (8'ha7)) ? ((8'had) ? (8'hae) : (8'hb2)) : ((8'hbc) ? (8'hbc) : (8'hae))) : (~(~^(8'hbf))))) ? (8'hb7) : {((^~(^~(8'hb8))) < (((8'hbb) ? (8'h9c) : (8'hb2)) ~^ ((8'hbf) || (7'h41))))}), 
parameter param35 = (~^param34))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ({({(wire16 ? wire14 : wire13),
              (wire14 & wire13)} <= $signed($signed(wire16)))} > (+(-($unsigned(wire15) && {wire14,
          wire15}))));
    end
  assign wire18 = wire14;
  assign wire19 = (wire15[(5'h15):(5'h14)] ^~ ($unsigned({reg17}) ?
                      (wire14[(4'ha):(2'h2)] ?
                          $unsigned({wire15}) : $signed($signed(wire13))) : (-wire16)));
  assign wire20 = wire18;
  assign wire21 = wire18[(4'hd):(1'h0)];
  assign wire22 = {wire15[(4'hc):(2'h3)],
                      $unsigned($signed((wire21 ?
                          $signed(wire15) : (wire13 << (8'ha7)))))};
  always
    @(posedge clk) begin
      reg23 <= wire13;
      if (wire21)
        begin
          reg24 <= ((~|(-{$signed(wire20),
              (wire22 ? wire13 : reg17)})) != (-wire15));
          if ((~^wire21[(3'h5):(2'h2)]))
            begin
              reg25 <= reg24[(1'h0):(1'h0)];
              reg26 <= ($unsigned(reg17[(1'h0):(1'h0)]) * ((^~$unsigned((reg25 ?
                  wire22 : (8'hae)))) != ($unsigned((reg23 ? (8'hb9) : reg24)) ?
                  wire22 : wire14)));
              reg27 <= wire15;
              reg28 <= reg23;
            end
          else
            begin
              reg25 <= (&reg26);
              reg26 <= $unsigned(reg26[(2'h3):(1'h0)]);
              reg27 <= $signed((!$signed(wire13)));
              reg28 <= reg27[(4'h8):(1'h1)];
            end
          reg29 <= wire18;
          reg30 <= reg29;
          if (((|wire16[(3'h5):(1'h0)]) ?
              {$unsigned($signed(reg29)),
                  {wire19[(1'h1):(1'h0)],
                      (^~(reg23 ^ reg24))}} : ($unsigned((wire21 ?
                      reg27[(3'h7):(3'h4)] : reg24[(1'h0):(1'h0)])) ?
                  ((reg23[(2'h2):(1'h1)] ?
                      $unsigned(wire15) : wire20) || (&{reg29,
                      (8'hb5)})) : (reg27[(4'hb):(4'ha)] < $signed($signed(reg17))))))
            begin
              reg31 <= (~(reg28[(4'ha):(3'h5)] ?
                  (((~|wire13) <= $unsigned(wire22)) - reg29[(1'h1):(1'h0)]) : (!($unsigned(reg29) - (reg28 ?
                      (8'hbc) : reg26)))));
            end
          else
            begin
              reg31 <= (($unsigned((7'h42)) ?
                      reg30[(3'h5):(3'h5)] : {((reg25 ?
                              reg17 : wire14) + (wire16 ? reg31 : reg30))}) ?
                  wire14[(4'ha):(3'h7)] : $signed($signed(reg17)));
              reg32 <= reg31;
              reg33 <= (reg17 > $unsigned((8'ha3)));
            end
        end
      else
        begin
          if ($signed($signed((|reg28[(4'hb):(2'h2)]))))
            begin
              reg24 <= ($unsigned(($signed({reg31}) ?
                      $unsigned($unsigned(reg25)) : $signed($signed(wire22)))) ?
                  (8'h9d) : (8'h9c));
            end
          else
            begin
              reg24 <= {({(~^wire20), ((reg27 << reg27) ^~ $signed(wire13))} ?
                      $signed({{wire15}}) : $unsigned($unsigned((-wire14))))};
            end
          if ((|($unsigned((~|$signed(wire20))) ?
              wire14[(4'h8):(3'h7)] : $signed($signed((wire18 + wire21))))))
            begin
              reg25 <= {(8'hba), $unsigned(reg31)};
            end
          else
            begin
              reg25 <= (+((+(~|$unsigned(reg29))) <= (~&wire20[(1'h0):(1'h0)])));
              reg26 <= wire22;
              reg27 <= (wire19 * $unsigned(((+$unsigned(reg24)) - $unsigned(reg33[(1'h1):(1'h1)]))));
            end
        end
    end
endmodule
