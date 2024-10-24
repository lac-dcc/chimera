module top
#(parameter param53 = ((({((8'hb4) ? (8'ha4) : (7'h43)), ((8'hb8) << (8'ha3))} ? ((|(8'hbb)) >> ((8'hba) ? (8'hb0) : (8'hb4))) : (~(8'ha6))) > (|(~|{(8'h9e), (8'h9e)}))) >>> (((~&(+(8'hba))) ? ((8'ha8) ? ((8'hb5) ^~ (8'ha5)) : ((7'h44) ? (7'h41) : (7'h42))) : ((8'ha5) < ((7'h44) ? (8'hbb) : (8'ha5)))) >>> (~&{((8'hb9) >= (8'ha3)), ((8'hb6) >>> (8'hba))}))), 
parameter param54 = (param53 ? (param53 ? param53 : (((param53 ? param53 : param53) >>> (param53 ? (8'hb8) : param53)) ? param53 : (~&param53))) : (param53 ? param53 : (({param53} ^~ (param53 ? param53 : param53)) ? ((param53 | param53) + param53) : {param53}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire51;
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire4,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire51,
                 reg20,
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
  assign wire4 = ((+{$signed($signed((8'ha4))), wire3}) ?
                     ($signed(wire3) ?
                         $unsigned(({wire1, wire0} ~^ {wire0,
                             (8'hb7)})) : wire3) : wire2[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg5 <= ((^wire1[(3'h7):(3'h7)]) ? (7'h41) : wire1[(5'h14):(1'h1)]);
      reg6 <= $unsigned(wire0);
      if ({(wire4[(5'h10):(1'h0)] | ($unsigned(wire1[(5'h13):(5'h11)]) ?
              ({(8'haa)} ? wire3[(3'h5):(2'h2)] : (-wire4)) : {wire0}))})
        begin
          reg7 <= {$signed($signed(($signed(reg5) ?
                  (8'hab) : reg6[(3'h6):(3'h6)])))};
          reg8 <= $signed(({reg7, (-((8'hac) ? reg5 : wire0))} ?
              (~^wire1[(5'h11):(2'h2)]) : (8'ha0)));
        end
      else
        begin
          if (($signed((({wire2} - wire2) ~^ reg5[(1'h1):(1'h0)])) ?
              reg5 : (&$signed(reg8))))
            begin
              reg7 <= $signed(reg7);
              reg8 <= (^wire2[(4'h8):(1'h0)]);
            end
          else
            begin
              reg7 <= $unsigned($unsigned({(-(reg6 << (8'ha6))),
                  (-((8'h9c) ? wire0 : wire0))}));
              reg8 <= (wire4[(1'h0):(1'h0)] && ($signed($signed((reg8 << reg6))) << wire0[(1'h0):(1'h0)]));
              reg9 <= wire4[(5'h11):(5'h10)];
              reg10 <= wire0;
            end
        end
      reg11 <= (reg9[(1'h1):(1'h0)] ?
          ($signed($unsigned($unsigned(wire1))) + ((reg9 ?
              $unsigned(wire2) : (wire0 ~^ reg6)) & (^~wire3))) : reg10);
      reg12 <= ((-wire2[(4'h8):(4'h8)]) ?
          $unsigned(({wire4[(3'h7):(3'h5)], (&reg7)} ?
              (reg7[(3'h6):(3'h5)] << reg8[(1'h0):(1'h0)]) : reg8)) : $signed({$unsigned(reg10[(5'h14):(4'h8)])}));
    end
  always
    @(posedge clk) begin
      reg13 <= $signed($signed({wire4[(4'h9):(1'h0)]}));
    end
  assign wire14 = (($unsigned(reg7) ?
                      (wire0 <= (reg8[(1'h0):(1'h0)] && $unsigned((8'hbf)))) : $signed(reg9[(2'h2):(1'h1)])) && $signed({wire4,
                      (+((8'hab) ? reg8 : reg5))}));
  assign wire15 = wire2;
  assign wire16 = {$signed(wire3),
                      (($signed(wire2) ?
                          ($signed(wire14) - wire1) : (|(~^reg13))) ^ wire15[(4'hd):(4'ha)])};
  assign wire17 = {wire1[(3'h5):(2'h2)], reg8};
  assign wire18 = $unsigned($signed((8'ha4)));
  assign wire19 = $signed(reg6);
  always
    @(posedge clk) begin
      reg20 <= reg9;
    end
  module21 #() modinst52 (.y(wire51), .wire22(wire18), .wire26(reg8), .clk(clk), .wire25(reg13), .wire24(wire2), .wire23(wire3));
endmodule

module module21
#(parameter param49 = (((((+(8'hb0)) > (^(8'h9f))) != ((8'ha0) ? ((7'h41) ? (8'ha5) : (7'h41)) : ((7'h42) ? (8'had) : (8'hb7)))) - (7'h41)) ? (((((8'haf) ? (8'hb1) : (8'ha3)) >>> ((8'hae) ? (8'h9d) : (8'h9c))) >>> {((8'h9d) * (8'hb1))}) ? (((~(8'h9e)) != ((8'hb0) - (8'haf))) != (((8'h9d) ? (8'hbb) : (8'hb7)) & ((8'ha5) ? (8'hb8) : (8'ha5)))) : ((-((8'hb4) ? (8'ha8) : (8'ha2))) << ({(7'h44), (8'had)} <<< ((8'hb4) ? (7'h43) : (8'ha6))))) : (~&({((8'hbe) & (8'h9e)), ((8'ha8) ? (8'hbf) : (8'hb9))} + {{(8'ha6)}}))), 
parameter param50 = (8'ha9))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
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
                 (1'h0)};
  assign wire27 = {((~&$unsigned($signed(wire22))) ?
                          $signed(wire26) : (~^((8'h9c) ? wire23 : (+wire24)))),
                      ((((8'hbe) + wire23) | wire22) && (wire26 ?
                          (wire23[(4'hc):(1'h0)] <<< (wire22 && wire26)) : (wire25 + (wire26 ?
                              wire25 : wire24))))};
  assign wire28 = (wire27 <= wire26);
  assign wire29 = ($signed($unsigned(($signed(wire26) ?
                          wire24 : wire24[(4'hb):(1'h1)]))) ?
                      ($signed(wire24) ?
                          wire25 : wire24[(4'h8):(3'h6)]) : $unsigned(((-wire22[(3'h5):(1'h1)]) + ((wire27 ?
                          wire26 : wire28) ^~ (wire24 + (8'ha1))))));
  assign wire30 = wire25[(3'h6):(3'h4)];
  assign wire31 = ({wire24[(3'h6):(2'h3)]} ?
                      $unsigned(wire29[(3'h7):(2'h2)]) : wire22);
  assign wire32 = wire28;
  always
    @(posedge clk) begin
      reg33 <= $unsigned(($unsigned($signed($unsigned((8'hb8)))) ^~ ((wire25[(4'he):(4'ha)] ?
          $signed(wire30) : (wire29 ?
              wire26 : wire27)) ~^ $unsigned((wire26 || wire31)))));
      reg34 <= wire23[(4'hc):(4'hb)];
      if ((wire23[(1'h1):(1'h0)] ?
          reg34[(4'ha):(1'h0)] : $signed(wire23[(1'h1):(1'h1)])))
        begin
          if (wire32[(2'h3):(2'h2)])
            begin
              reg35 <= ($unsigned((^~{((8'hbe) ? wire28 : wire32),
                      reg33[(3'h5):(3'h5)]})) ?
                  (($signed(((8'hbd) <= wire24)) ?
                          ($unsigned((8'hbc)) || (wire24 ?
                              wire25 : wire30)) : ((~&wire28) ?
                              $signed(wire22) : $unsigned(reg34))) ?
                      (~&(wire28[(4'h8):(1'h0)] ?
                          wire26 : wire25[(4'hf):(2'h3)])) : (8'hb5)) : ($signed((~&reg34[(3'h6):(1'h1)])) ?
                      ((reg34 ? (8'ha6) : $unsigned(wire28)) ?
                          (wire23[(4'hc):(2'h3)] || wire22) : wire26) : $signed(wire24)));
              reg36 <= (wire25[(2'h2):(1'h0)] - $unsigned($unsigned(((~|wire25) ?
                  $unsigned(wire22) : (wire26 ? wire24 : wire30)))));
              reg37 <= ($signed(($unsigned((|(8'hb6))) != $unsigned(wire29))) - (~|reg34));
            end
          else
            begin
              reg35 <= $unsigned(reg36[(3'h7):(2'h3)]);
              reg36 <= {((~&((8'ha4) ?
                          (wire28 == reg33) : wire32[(1'h0):(1'h0)])) ?
                      reg37 : (~^(reg34[(2'h2):(2'h2)] ?
                          wire31[(3'h6):(1'h1)] : wire22[(4'h8):(3'h5)])))};
              reg37 <= (|$signed(($signed((wire29 + wire25)) & wire26[(3'h6):(1'h1)])));
              reg38 <= $signed({$signed($signed($signed(wire26)))});
              reg39 <= (($signed((~&(wire30 <<< wire29))) ?
                      reg34[(3'h4):(2'h2)] : (($unsigned(reg35) ?
                          (wire23 ?
                              wire22 : wire25) : $unsigned(reg38)) & wire24)) ?
                  reg34[(3'h7):(2'h3)] : (^$unsigned({$unsigned(wire22)})));
            end
          reg40 <= (~^(8'haf));
          reg41 <= (^~reg33[(3'h7):(3'h5)]);
        end
      else
        begin
          reg35 <= wire22;
          reg36 <= $unsigned((+(^$unsigned((reg35 ? (8'h9c) : wire25)))));
        end
      reg42 <= (reg39[(3'h6):(1'h1)] ?
          {($unsigned((!reg40)) ~^ reg40)} : ($unsigned($unsigned((~wire28))) >> (wire23 ?
              (-(8'h9c)) : (((7'h42) || reg33) >>> (wire29 ?
                  wire22 : wire29)))));
      reg43 <= ((wire22[(1'h0):(1'h0)] * $signed(((reg37 ~^ reg41) ?
              wire22[(1'h1):(1'h0)] : reg37[(3'h5):(3'h4)]))) ?
          wire29 : $signed($unsigned(((reg39 <= wire22) + (wire22 ?
              wire23 : (8'hba))))));
    end
  assign wire44 = (8'hb9);
  assign wire45 = (reg39 ?
                      (($unsigned($signed(reg41)) ^ $signed(((8'hb3) && (8'ha7)))) ?
                          $signed((~|(wire32 * wire26))) : (~&({wire25,
                              (8'ha1)} ^~ $unsigned(wire25)))) : wire44);
  assign wire46 = ($signed({{wire30[(4'hc):(4'h9)]}, (8'hbe)}) ?
                      $signed($unsigned(wire32[(3'h4):(3'h4)])) : ((8'ha9) ?
                          (~$signed((reg38 ?
                              reg36 : wire27))) : (wire31[(4'h9):(4'h9)] ?
                              {(-reg41)} : (~^$unsigned(reg33)))));
  assign wire47 = reg38;
  assign wire48 = wire29;
endmodule
