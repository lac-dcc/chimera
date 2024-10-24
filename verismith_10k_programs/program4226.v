module top #(parameter param83 = (8'hb7)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire20,
                 wire17,
                 wire4,
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(({(~&$signed(wire3))} <<< wire0[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (($unsigned($signed(wire2)) ?
          $unsigned(wire1) : ((((wire0 != wire1) ?
              wire3[(1'h1):(1'h0)] : {wire1}) == wire2) << ($unsigned($unsigned(wire4)) - (wire2[(1'h1):(1'h1)] ?
              (wire3 ? wire4 : wire3) : $signed(wire2))))))
        begin
          reg5 <= $unsigned((+(!$unsigned($unsigned((8'ha7))))));
          reg6 <= wire3[(3'h7):(3'h5)];
        end
      else
        begin
          reg5 <= (+(|$unsigned((~(reg6 + (8'haa))))));
          reg6 <= {reg5[(4'hc):(4'ha)]};
          reg7 <= (((~^(~wire1)) ^~ ({$signed(wire4),
              reg6} == (wire4 & wire4[(3'h4):(2'h3)]))) | (8'ha2));
          reg8 <= (~&(8'hb6));
          reg9 <= (!wire3[(2'h3):(2'h2)]);
        end
      if (((-$signed($signed((|wire0)))) && ($signed(reg5) << $signed(((reg5 ?
              (8'hb0) : reg5) ?
          (&wire1) : (wire2 ? wire3 : wire4))))))
        begin
          reg10 <= $unsigned(wire3);
        end
      else
        begin
          reg10 <= (|{reg8[(3'h4):(3'h4)]});
          reg11 <= ((wire3 ?
                  (((^~reg8) == reg7) ?
                      $unsigned($signed(reg7)) : reg5) : $signed(reg5)) ?
              $signed(((7'h42) | wire1)) : {reg7, reg9});
          reg12 <= (~^(^({(wire0 ? wire2 : wire0),
              reg10[(1'h0):(1'h0)]} ^~ {$unsigned(reg7)})));
          reg13 <= reg8[(3'h4):(3'h4)];
        end
      reg14 <= $unsigned(wire3[(3'h5):(2'h2)]);
      if (reg8)
        begin
          reg15 <= (8'hac);
        end
      else
        begin
          reg15 <= {(~&$unsigned(reg12[(2'h2):(2'h2)]))};
          reg16 <= ($unsigned((((~^reg11) >= (reg5 ?
                  wire2 : reg9)) < $signed(reg6[(2'h2):(2'h2)]))) ?
              reg13[(2'h3):(1'h0)] : $unsigned((8'hb1)));
        end
    end
  assign wire17 = reg13;
  always
    @(posedge clk) begin
      reg18 <= reg15;
      reg19 <= $signed(({($unsigned(reg7) ?
              wire1[(2'h3):(2'h2)] : (reg18 ^ wire17))} ~^ (($signed((8'hb0)) ?
          $unsigned((8'had)) : (-reg15)) + (wire2[(4'h8):(3'h7)] ?
          (wire1 ? reg10 : wire2) : {reg9}))));
    end
  assign wire20 = $signed(wire3[(2'h2):(1'h1)]);
  module21 #() modinst81 (.wire24(wire17), .wire25(wire2), .wire22(reg16), .y(wire80), .clk(clk), .wire23(reg10));
  assign wire82 = {($signed($unsigned($signed(reg18))) ?
                          {(~|reg10[(3'h6):(1'h1)]),
                              wire2[(4'hc):(4'ha)]} : {$signed({wire20}),
                              (8'ha1)}),
                      wire17[(2'h3):(1'h1)]};
endmodule

module module21
#(parameter param79 = (+(~^({((8'haa) >>> (7'h40))} + ((+(8'hab)) >>> ((7'h40) >> (7'h41)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg47,
                 reg46,
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
                 (1'h0)};
  assign wire26 = (($signed((((7'h42) | wire22) ~^ wire23)) - (($signed(wire25) ?
                          ((8'hbf) ~^ wire24) : {(8'hab), wire24}) ?
                      {((8'had) ?
                              wire24 : wire23)} : (~^(-wire24)))) != ($signed(((wire22 >= wire25) < (wire25 >>> wire24))) < wire24));
  assign wire27 = wire24;
  assign wire28 = $unsigned($signed(((~&(~^(8'hb6))) ?
                      (wire25 ?
                          $signed(wire24) : $signed(wire24)) : $unsigned(wire23[(3'h4):(1'h1)]))));
  assign wire29 = (8'hb3);
  always
    @(posedge clk) begin
      reg30 <= (^~$unsigned({({(8'hb4), wire29} ^~ $unsigned(wire26)),
          (wire25 <<< {wire24, wire24})}));
      reg31 <= wire28[(3'h6):(3'h5)];
      if (reg30[(1'h0):(1'h0)])
        begin
          reg32 <= $signed({$unsigned(wire25[(1'h0):(1'h0)])});
          reg33 <= (-wire25[(3'h7):(3'h7)]);
          reg34 <= reg32[(4'h9):(3'h7)];
          reg35 <= (wire23 == {(~wire22), wire27[(4'ha):(4'h9)]});
        end
      else
        begin
          if ($signed(reg31))
            begin
              reg32 <= wire27;
              reg33 <= (8'hb3);
              reg34 <= wire22;
              reg35 <= (reg32[(3'h7):(3'h4)] ?
                  $signed(($signed($unsigned(wire22)) ?
                      (8'h9d) : ((!wire26) * (~(8'hb4))))) : $signed($unsigned(($signed(wire27) & (wire25 != reg35)))));
            end
          else
            begin
              reg32 <= {(wire24 ^ (((wire22 ?
                      reg30 : reg33) >>> reg32[(3'h4):(2'h2)]) << ((~(8'h9e)) >> $signed(wire29))))};
              reg33 <= (wire28 || (($unsigned($unsigned(reg30)) ^~ wire26[(4'h8):(3'h5)]) > reg35));
              reg34 <= wire22[(3'h7):(3'h5)];
              reg35 <= $unsigned(({$unsigned($unsigned((8'ha0)))} ?
                  ((8'hac) ?
                      $signed((wire28 > wire26)) : $unsigned($unsigned(reg34))) : reg35));
              reg36 <= ($signed(wire25) * {$unsigned((~|(wire22 ?
                      reg34 : (8'ha7))))});
            end
          if ($unsigned(((~reg32[(2'h3):(1'h1)]) ?
              (^{(8'ha5), reg36[(3'h7):(1'h1)]}) : {reg30[(1'h1):(1'h1)],
                  (&(-wire27))})))
            begin
              reg37 <= $signed({(~($unsigned((8'hba)) ?
                      (wire28 ^ reg34) : reg33[(4'h9):(3'h6)]))});
              reg38 <= $unsigned(((reg35 ?
                  reg35 : (+$signed((8'hb1)))) << (~|reg32[(3'h4):(2'h3)])));
              reg39 <= (~|$signed($unsigned($signed($signed(wire22)))));
            end
          else
            begin
              reg37 <= reg38[(4'hb):(4'h8)];
            end
          reg40 <= reg36[(1'h0):(1'h0)];
          reg41 <= (((wire29[(1'h0):(1'h0)] > reg33) ~^ (reg39 ^~ wire23[(1'h1):(1'h1)])) && ((reg40[(4'ha):(2'h3)] ?
              reg38[(5'h10):(4'ha)] : $unsigned($signed(reg37))) <= (-(wire22 ?
              (reg33 >= reg35) : reg30[(1'h0):(1'h0)]))));
        end
    end
  assign wire42 = reg33[(3'h5):(1'h1)];
  assign wire43 = reg37;
  assign wire44 = ({(^~$unsigned(wire27)),
                          ($signed((wire42 ? reg35 : reg35)) ?
                              $signed((-reg35)) : (-(reg38 ?
                                  (8'hb8) : reg40)))} ?
                      (~^$signed(((wire23 + wire24) | wire23))) : (-$unsigned((-reg38[(5'h13):(5'h11)]))));
  assign wire45 = {(reg38 || (|($unsigned(reg34) ?
                          (wire43 | reg40) : (wire27 <= wire26))))};
  always
    @(posedge clk) begin
      reg46 <= $unsigned(reg34[(3'h6):(3'h4)]);
      reg47 <= $signed({(|$signed($unsigned(reg30))), wire22});
    end
  assign wire48 = {(!reg37),
                      (reg31 <<< (~^($unsigned(reg31) ? (|wire28) : reg46)))};
  assign wire49 = {$signed(reg31[(3'h4):(1'h1)]), (|$signed(wire28))};
  assign wire50 = $signed($signed((|(+(7'h41)))));
  module51 #() modinst77 (.y(wire76), .wire52(wire24), .clk(clk), .wire55(reg37), .wire54(reg38), .wire53(wire50));
  assign wire78 = (wire24[(4'h9):(1'h1)] - $unsigned((reg35[(4'ha):(1'h1)] ?
                      wire76 : {reg36})));
endmodule

module module51
#(parameter param74 = (^((~&{((8'hab) ? (8'haa) : (8'hb7))}) ? (-(((8'hb9) & (8'hbb)) ^ (&(7'h41)))) : ((|(^(8'hab))) >>> (((8'hbf) ? (8'ha7) : (8'hbc)) ^ (-(8'hae)))))), 
parameter param75 = (~(|(((~^param74) >= param74) <= ((param74 ? param74 : param74) + (|param74))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire55;
  input wire signed [(4'he):(1'h0)] wire54;
  input wire signed [(4'hb):(1'h0)] wire53;
  input wire [(4'hb):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg60,
                 (1'h0)};
  assign wire56 = wire54[(4'hd):(3'h6)];
  assign wire57 = wire54[(4'ha):(3'h5)];
  assign wire58 = ($signed($unsigned((~&$signed(wire55)))) ?
                      wire57 : $unsigned($signed(((8'hbb) == (wire53 <<< wire56)))));
  assign wire59 = (-((~^{(-wire55), (wire53 ^~ wire54)}) >>> (&wire53)));
  always
    @(posedge clk) begin
      reg60 <= wire52;
    end
  assign wire61 = ((~wire53[(1'h0):(1'h0)]) != ((^~reg60[(2'h2):(1'h0)]) - $signed(({wire56,
                          (8'hb7)} ?
                      (-wire54) : $signed(wire56)))));
  assign wire62 = $unsigned((wire57[(1'h0):(1'h0)] >= ($unsigned((wire55 ^~ wire55)) ?
                      ({(8'haf)} ~^ $signed(wire56)) : wire56)));
  assign wire63 = wire59;
  assign wire64 = (-$signed((8'haa)));
  assign wire65 = wire57;
  assign wire66 = wire53[(3'h4):(2'h2)];
  assign wire67 = $signed(($signed(wire54[(4'he):(4'ha)]) >> $signed({(|(8'ha5)),
                      $signed(wire58)})));
  assign wire68 = wire67[(3'h5):(1'h0)];
  assign wire69 = $signed(((&$unsigned(wire66)) << (wire63 ?
                      wire63[(3'h4):(2'h2)] : {(^~wire56), wire63})));
  assign wire70 = (~$signed(wire58));
  assign wire71 = (($signed($signed((~(7'h43)))) ~^ wire57[(3'h4):(2'h3)]) + wire63);
  assign wire72 = wire71;
  assign wire73 = wire72[(4'h8):(3'h5)];
endmodule
