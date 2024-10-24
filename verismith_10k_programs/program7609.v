module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire70, wire69, wire68, wire66, wire5, (1'h0)};
  assign wire5 = wire0[(1'h1):(1'h0)];
  module6 #() modinst67 (.wire10(wire3), .y(wire66), .wire9(wire1), .wire8(wire2), .wire7(wire4), .clk(clk));
  assign wire68 = ((^~wire2[(3'h5):(3'h5)]) ?
                      $unsigned((((~wire3) ? ((8'ha9) < wire0) : {wire0}) ?
                          (~^(wire1 ?
                              (8'h9f) : wire2)) : $unsigned($unsigned(wire2)))) : $unsigned($unsigned(($signed(wire0) ?
                          $unsigned(wire1) : wire5[(2'h2):(1'h0)]))));
  assign wire69 = $unsigned((^~$unsigned(({wire5, wire2} ?
                      wire3[(3'h4):(2'h2)] : $unsigned((8'ha7))))));
  assign wire70 = wire69[(1'h0):(1'h0)];
endmodule

module module6
#(parameter param64 = (({{(~(7'h44)), ((8'hb5) | (8'hac))}} ? ({{(8'hba), (8'hac)}, ((8'hbe) * (8'ha7))} ^ (8'ha0)) : ({((8'hb0) ? (8'hb9) : (8'ha9)), (7'h42)} >= {((8'ha6) != (8'h9e))})) ~^ (^~({(!(8'hb7))} ? ({(7'h42), (8'hb7)} & {(8'ha1), (8'hb3)}) : (((8'ha5) | (7'h41)) || ((8'hb2) ^~ (8'h9f)))))), 
parameter param65 = ((~^(-(8'h9e))) ? (8'hac) : (~&(((^~param64) ^~ (param64 ? (8'hba) : (8'h9d))) ~^ ((param64 ? param64 : param64) > (param64 != param64))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire57;
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire18,
                 wire19,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire45,
                 wire46,
                 wire57,
                 reg44,
                 reg43,
                 reg42,
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
                 reg20,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire11 = $unsigned($signed({wire7[(2'h2):(2'h2)]}));
  assign wire12 = (wire11[(3'h4):(1'h0)] < wire7);
  assign wire13 = ($signed($unsigned(($signed(wire8) & wire11[(2'h3):(1'h1)]))) ?
                      wire8 : {(+$signed(((8'hb9) - wire7)))});
  assign wire14 = (8'hb6);
  assign wire15 = wire9[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= $signed($signed((((wire12 + wire14) * (8'hb2)) ?
          wire10 : {$unsigned(wire7), wire12})));
      reg17 <= $unsigned($signed($unsigned($unsigned(reg16[(2'h3):(2'h3)]))));
    end
  assign wire18 = wire13;
  assign wire19 = wire18[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= wire7[(2'h3):(1'h0)];
      reg21 <= {(wire15 || $signed($signed({wire12, wire9}))), wire19};
      if (reg17)
        begin
          reg22 <= (&wire13[(1'h1):(1'h0)]);
          if ((reg17[(4'h9):(3'h5)] < $unsigned($signed(((wire7 ?
                  wire9 : reg20) ?
              (reg16 ? reg21 : wire15) : reg22)))))
            begin
              reg23 <= ((&$signed((^(!wire7)))) >= ($unsigned({(wire12 + wire9),
                  (wire11 ? (8'ha2) : (8'hba))}) == $unsigned({(8'h9c),
                  (reg22 ? wire14 : wire15)})));
              reg24 <= wire12[(4'hd):(4'h9)];
              reg25 <= reg16[(1'h0):(1'h0)];
              reg26 <= (~$signed((^~reg17[(3'h6):(2'h3)])));
            end
          else
            begin
              reg23 <= wire8[(2'h2):(1'h0)];
              reg24 <= reg21;
              reg25 <= wire8;
              reg26 <= (!$unsigned($unsigned($signed((+wire9)))));
              reg27 <= $signed(wire14[(3'h7):(1'h1)]);
            end
          if ($unsigned(wire7[(2'h2):(1'h0)]))
            begin
              reg28 <= (~|(-$signed(reg21)));
              reg29 <= {$signed(wire13), $unsigned((^~(8'hbb)))};
              reg30 <= reg23;
            end
          else
            begin
              reg28 <= wire19;
              reg29 <= (-$unsigned(($unsigned((+wire11)) ~^ (-((7'h40) ?
                  reg29 : (8'ha4))))));
              reg30 <= wire18;
              reg31 <= (&reg28[(2'h3):(1'h1)]);
              reg32 <= ($unsigned(({wire8} ?
                      reg30[(3'h5):(1'h0)] : {((8'hac) >>> wire8),
                          (wire11 ? wire9 : reg17)})) ?
                  reg27[(1'h1):(1'h1)] : reg27);
            end
        end
      else
        begin
          reg22 <= ($unsigned((~&{{reg17, (8'ha3)}, (&reg17)})) ?
              $signed($unsigned($unsigned((wire9 < reg28)))) : ((~&(^wire8[(2'h2):(2'h2)])) ?
                  reg23 : reg25));
          reg23 <= reg20;
        end
      if ($signed(reg24[(3'h5):(3'h5)]))
        begin
          reg33 <= (-($unsigned((8'ha7)) ~^ $signed($signed($unsigned(wire19)))));
        end
      else
        begin
          if (reg33)
            begin
              reg33 <= ({$unsigned($unsigned(reg26)), (~|reg32)} ?
                  (wire8[(1'h0):(1'h0)] * (^~($unsigned((8'haa)) != $signed(wire13)))) : (~|$signed((reg30[(1'h1):(1'h1)] == (wire19 ?
                      wire13 : reg26)))));
              reg34 <= (^~($unsigned({((8'hb2) ?
                      wire12 : reg24)}) > wire12[(3'h6):(3'h4)]));
            end
          else
            begin
              reg33 <= reg25;
              reg34 <= $unsigned(wire19);
              reg35 <= ($unsigned(reg21[(5'h11):(5'h11)]) ?
                  $unsigned({$unsigned((reg16 && reg22))}) : (wire12 ?
                      (^reg22) : $signed(((wire11 ?
                          wire11 : reg31) && reg24))));
              reg36 <= (wire15 << reg35[(3'h5):(3'h5)]);
            end
          reg37 <= wire18[(3'h5):(3'h4)];
        end
    end
  assign wire38 = $signed({wire14[(4'hd):(3'h7)]});
  assign wire39 = reg22;
  assign wire40 = $unsigned(reg28[(2'h2):(1'h1)]);
  assign wire41 = (reg26[(3'h7):(3'h5)] && $unsigned($unsigned(((8'ha2) ?
                      $unsigned(reg31) : wire15))));
  always
    @(posedge clk) begin
      reg42 <= $signed($signed(wire15[(2'h2):(2'h2)]));
      reg43 <= wire15;
      reg44 <= (($unsigned((+wire38)) ?
          wire12[(4'h8):(3'h7)] : (($unsigned(reg23) << (wire19 ?
                  reg36 : reg28)) ?
              $unsigned((|reg35)) : $signed((wire41 ?
                  wire7 : reg33)))) >> (wire9[(3'h6):(1'h0)] ?
          reg21 : (!(+reg17[(3'h6):(3'h5)]))));
    end
  assign wire45 = reg36[(5'h12):(1'h0)];
  assign wire46 = reg34[(2'h2):(2'h2)];
  module47 #() modinst58 (wire57, clk, wire7, reg30, reg31, wire11, wire13);
  assign wire59 = $signed($unsigned(wire7[(3'h4):(2'h2)]));
  assign wire60 = $signed(wire57);
  assign wire61 = $signed(($signed(wire10[(2'h2):(1'h0)]) >> $signed(reg31)));
  assign wire62 = (($unsigned($signed((wire19 ? reg28 : wire46))) ?
                      ($unsigned((reg23 ~^ (8'had))) ~^ reg44) : {($signed(wire14) ^~ {reg23}),
                          (+{reg37})}) << $signed(reg29));
  assign wire63 = (wire19[(2'h3):(2'h2)] >= ($signed((((7'h43) ~^ wire38) ?
                      $unsigned(wire14) : {wire41, wire38})) ^~ wire39));
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire52;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire signed [(5'h15):(1'h0)] wire49;
  input wire signed [(4'he):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  assign y = {wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = $unsigned(($unsigned({(~&wire51)}) || (wire52[(3'h6):(3'h4)] == ((wire49 >>> wire49) >>> {(8'hb7),
                      wire49}))));
  assign wire54 = wire52[(3'h4):(2'h2)];
  assign wire55 = wire54[(3'h6):(2'h3)];
  assign wire56 = wire49;
endmodule
