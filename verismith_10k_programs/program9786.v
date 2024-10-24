module top
#(parameter param71 = ((!(((^(8'hb2)) ? (|(8'hb2)) : (~|(8'haa))) >> (|((8'hbe) >= (8'hb2))))) << {{{(&(8'ha9))}}}), 
parameter param72 = {(param71 ? ((^~(~|param71)) ? (8'hab) : (param71 ? (param71 < param71) : (param71 <= param71))) : ((param71 ? param71 : (~^param71)) ? ((param71 < param71) ? (-param71) : ((7'h43) ? param71 : param71)) : param71))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire69;
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire69,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 (1'h0)};
  assign wire5 = wire2[(1'h1):(1'h0)];
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      if ($signed(wire6))
        begin
          reg7 <= $unsigned(((((wire4 > wire6) ?
              wire4 : wire0) <<< wire0[(2'h2):(2'h2)]) ^~ $signed((wire5 ?
              wire4 : {(8'h9e), wire0}))));
          reg8 <= wire0;
          if ({(wire2 * wire5),
              (({wire6, wire2[(1'h0):(1'h0)]} ?
                  wire6 : {{reg7}, {wire2}}) << $signed(wire1[(4'hd):(4'ha)]))})
            begin
              reg9 <= wire0[(4'he):(3'h5)];
              reg10 <= (wire1[(4'ha):(1'h0)] ?
                  {wire0} : {$unsigned((!{wire5}))});
              reg11 <= (~|(({(+wire0),
                  (wire2 ? reg9 : reg9)} & reg9) * wire1[(3'h6):(1'h0)]));
              reg12 <= reg11[(4'hf):(4'ha)];
              reg13 <= {wire6[(3'h6):(1'h1)],
                  (&{{(reg8 == wire3), wire4},
                      ($unsigned(reg7) ?
                          $unsigned(wire0) : reg9[(1'h1):(1'h1)])})};
            end
          else
            begin
              reg9 <= {(+(!reg11))};
              reg10 <= (((!$unsigned((wire4 ? wire2 : wire0))) ?
                      ($unsigned({(7'h41)}) ?
                          {(wire4 || reg7)} : reg12[(5'h14):(5'h10)]) : $unsigned($unsigned((reg9 ?
                          wire0 : reg7)))) ?
                  (-$unsigned(({reg13} && $unsigned(reg8)))) : (~^reg7));
              reg11 <= (reg10 << (8'hb1));
              reg12 <= $signed((($signed(wire3[(2'h2):(1'h1)]) ?
                  reg10[(1'h1):(1'h1)] : ({reg13} ?
                      (^reg10) : $unsigned(wire3))) * wire4[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          if ((~(!(~|$unsigned((reg7 ~^ reg12))))))
            begin
              reg7 <= ($signed((8'hb8)) ?
                  (~&$signed({(wire5 ? wire5 : reg13),
                      wire4[(3'h4):(3'h4)]})) : reg13[(3'h4):(1'h1)]);
              reg8 <= $signed({reg7[(1'h1):(1'h0)],
                  (reg13 ?
                      ({reg13} ?
                          {reg8,
                              wire3} : (!(8'hb5))) : (&((8'ha5) != wire0)))});
            end
          else
            begin
              reg7 <= $signed({$unsigned(wire5[(2'h3):(2'h2)]), {reg13}});
              reg8 <= ((&wire3) ?
                  reg10[(2'h2):(1'h0)] : $signed(reg7[(1'h1):(1'h1)]));
              reg9 <= $unsigned({(~|((wire4 ? wire4 : (8'hab)) != (wire4 ?
                      (7'h44) : wire3))),
                  {($unsigned(wire5) || (reg7 < wire1)), (8'hbe)}});
            end
          reg10 <= wire3[(4'hf):(4'h8)];
          if ((wire0 ?
              reg8[(4'he):(2'h2)] : $signed($signed($signed($signed(wire4))))))
            begin
              reg11 <= reg12[(3'h7):(1'h1)];
              reg12 <= (!(~^(&(&$signed((8'haf))))));
            end
          else
            begin
              reg11 <= ((+{{reg8}}) ^ $unsigned(wire3));
              reg12 <= ($signed((^~$unsigned($signed((8'hae))))) == (~^$signed(({reg9,
                      reg10} ?
                  (wire3 ? wire3 : wire0) : (wire5 << reg11)))));
            end
          reg13 <= (~(reg8 ? reg10 : $unsigned(wire5[(4'he):(2'h2)])));
        end
      reg14 <= ($unsigned($unsigned(reg11[(5'h14):(5'h12)])) * $unsigned(wire3[(4'ha):(3'h4)]));
      reg15 <= $signed({($signed($signed(wire5)) ?
              (wire1[(3'h6):(3'h4)] ?
                  reg13[(3'h6):(1'h1)] : $unsigned(reg10)) : reg13[(3'h4):(2'h3)]),
          $signed($unsigned((8'ha8)))});
      reg16 <= ((7'h44) ?
          wire4 : {((^{wire2}) ~^ {reg11}), reg9[(1'h0):(1'h0)]});
    end
  assign wire17 = reg13;
  assign wire18 = ((!wire1) ?
                      (|reg10) : ((^$signed($signed(reg11))) ?
                          $signed({$unsigned((8'ha6))}) : reg12[(4'hb):(3'h5)]));
  assign wire19 = {($unsigned({$signed(reg16),
                          $unsigned(wire3)}) <= (-((wire3 || reg12) ?
                          {wire0} : (wire2 > reg12)))),
                      {wire0[(1'h1):(1'h0)],
                          ((~&reg9[(2'h2):(1'h1)]) ?
                              (~|reg10) : wire6[(4'ha):(4'h9)])}};
  assign wire20 = (reg15 ? {reg11[(4'hf):(4'ha)]} : wire6);
  assign wire21 = ((&((!wire2) ?
                          reg13 : ((reg16 ? reg13 : reg15) ?
                              (reg7 ^~ wire18) : (~|(8'h9c))))) ?
                      $signed($signed({$signed(wire5),
                          $unsigned(wire2)})) : wire17[(1'h1):(1'h1)]);
  assign wire22 = $signed(wire21[(3'h6):(1'h0)]);
  assign wire23 = (reg9 | wire20[(4'he):(4'h9)]);
  assign wire24 = (($unsigned(reg15) ?
                      ((-wire5) || (wire23[(1'h1):(1'h1)] ?
                          (wire18 << reg8) : {reg7,
                              reg9})) : (wire4[(2'h3):(1'h1)] ?
                          (wire23 ^ reg15[(4'h8):(3'h5)]) : (&(wire21 ?
                              reg15 : (8'h9e))))) >>> {(8'h9d),
                      $signed(wire17[(1'h1):(1'h1)])});
  always
    @(posedge clk) begin
      reg25 <= wire18[(1'h0):(1'h0)];
      if ((+(~&(~|reg12[(4'he):(1'h1)]))))
        begin
          reg26 <= ((!$unsigned((8'h9f))) ? reg15 : wire1);
          reg27 <= (wire24[(4'hd):(4'h8)] == reg12[(3'h7):(3'h4)]);
        end
      else
        begin
          reg26 <= wire19;
          reg27 <= {wire17,
              ($unsigned($signed($signed(wire3))) ?
                  (($signed(wire3) * (wire5 ? reg14 : wire19)) ?
                      ((reg14 == reg16) < $signed(reg10)) : {reg12,
                          reg27[(2'h3):(2'h3)]}) : $unsigned($signed(wire23[(4'hc):(1'h0)])))};
          reg28 <= reg27[(5'h10):(4'hf)];
        end
      if ((wire20 ? reg10 : reg8))
        begin
          reg29 <= (($signed({reg16[(1'h1):(1'h1)], (8'h9c)}) ?
                  $signed((^(wire1 > reg27))) : $signed($unsigned(wire2))) ?
              (7'h40) : reg26[(4'h8):(3'h6)]);
        end
      else
        begin
          reg29 <= $signed(($unsigned({(reg16 ? wire17 : reg13),
              $unsigned(reg10)}) + $signed($unsigned({reg8, wire21}))));
        end
      reg30 <= {reg10[(3'h6):(1'h1)]};
      reg31 <= (&((reg12[(5'h14):(2'h3)] ?
          (reg25[(3'h7):(3'h4)] != $signed(wire22)) : (wire18 ?
              (reg25 ? reg26 : wire6) : reg25[(4'h9):(3'h5)])) | wire5));
    end
  module32 #() modinst70 (.wire37(wire24), .wire35(wire23), .wire36(wire2), .clk(clk), .wire33(reg15), .y(wire69), .wire34(reg30));
endmodule

module module32
#(parameter param68 = ((|{((-(8'haa)) >>> ((8'ha8) ? (8'haf) : (8'hbd))), (~&(8'h9c))}) != (~&(({(8'ha8)} ? ((8'ha9) ? (8'had) : (7'h44)) : (^(8'hac))) ? (~&((8'hbe) >> (8'ha9))) : ((~^(8'hab)) > (~^(7'h43)))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire34;
  input wire [(5'h14):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  assign y = {wire66, wire40, wire39, wire38, (1'h0)};
  assign wire38 = wire34;
  assign wire39 = (wire37 ?
                      (^wire38[(4'hc):(3'h5)]) : ({(wire37[(5'h12):(4'hd)] ?
                              (wire35 ? wire34 : wire33) : {wire35,
                                  wire34})} != $signed((|(wire35 ?
                          wire33 : wire35)))));
  assign wire40 = ((((wire35 ? (|wire38) : $unsigned(wire38)) == ({wire35} ?
                      $signed(wire35) : wire38[(4'h9):(4'h8)])) + $signed({$unsigned((7'h41)),
                      wire38[(2'h2):(2'h2)]})) > $signed((wire33[(4'hc):(2'h3)] >> ({wire37,
                      wire35} || ((8'hb1) >> wire39)))));
  module41 #() modinst67 (.wire43(wire33), .wire45(wire38), .wire42(wire36), .clk(clk), .y(wire66), .wire44(wire40));
endmodule

module module41
#(parameter param64 = ((&(((&(8'ha3)) ? {(8'hba), (8'ha4)} : (~|(8'hb6))) ? (~^((8'haa) == (8'hb5))) : (((8'had) << (8'hb0)) * ((8'ha1) * (8'ha4))))) ? {(8'hbf), {(^{(8'hab)})}} : (((!(~^(8'hac))) != (((8'hab) != (8'hbf)) ? {(8'hae), (8'hb6)} : ((8'ha8) ? (7'h42) : (8'hbc)))) ? (((-(8'haf)) + (~^(7'h43))) ? (((8'ha0) ? (8'hba) : (8'ha8)) <<< ((7'h41) ? (8'hbb) : (7'h41))) : ({(8'ha6)} & ((8'hb2) <= (8'h9c)))) : ((((8'hba) ^ (7'h43)) ? {(8'ha6), (7'h44)} : {(8'hb5), (8'hbe)}) ? ({(8'hb3)} ? (^~(8'ha8)) : (&(7'h44))) : {(!(8'ha6)), ((8'h9d) ^ (8'ha9))}))), 
parameter param65 = {(({(param64 ^ param64)} - param64) ? (~^((param64 | (8'hb7)) ? (param64 == param64) : param64)) : param64), (~&((&(param64 == param64)) <= ((^param64) || param64)))})
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg49,
                 (1'h0)};
  assign wire46 = wire45;
  assign wire47 = ((~|wire46) ?
                      $signed({$signed($signed(wire42))}) : $signed($signed(wire42)));
  assign wire48 = ({wire47[(3'h5):(3'h5)]} ? (8'ha0) : wire43[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg49 <= wire48;
    end
  assign wire50 = (!wire45[(4'h8):(3'h7)]);
  assign wire51 = ($unsigned(wire43[(2'h3):(2'h2)]) <<< $unsigned($signed(wire50[(1'h0):(1'h0)])));
  assign wire52 = ((~&(+$unsigned({wire45,
                      wire51}))) * $signed((^({wire51} && wire47))));
  assign wire53 = (wire45[(4'hd):(4'h8)] ?
                      ((reg49 > ((wire43 ?
                          wire52 : (8'ha8)) != (7'h43))) * ({wire43, wire46} ?
                          wire43 : $signed((wire48 - wire45)))) : (reg49 == $unsigned(wire46)));
  assign wire54 = wire51[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg55 <= $signed($signed((!$signed({(8'h9e)}))));
      reg56 <= ($signed(wire47) ?
          (-wire48) : $unsigned((~{(8'hae), $signed(wire44)})));
      reg57 <= $signed((($signed($signed(wire54)) ?
          ($signed(reg49) ?
              wire45[(4'hc):(4'h9)] : (wire48 ?
                  wire52 : reg56)) : ($unsigned(wire53) >= (!wire43))) + ($unsigned($unsigned(wire52)) ?
          reg56 : (^(wire46 < (8'h9d))))));
      reg58 <= (~&((wire54 ?
              (~&wire42[(3'h6):(1'h0)]) : $unsigned(reg55[(1'h1):(1'h0)])) ?
          {($signed(wire44) ?
                  $signed(wire43) : (~^wire50))} : $unsigned(($unsigned(wire45) ^~ {wire44}))));
      reg59 <= wire48[(4'hd):(3'h7)];
    end
  assign wire60 = ((reg49 != $signed({$signed((8'hb0)),
                      (^~(8'hab))})) << $signed(wire54[(4'hb):(1'h0)]));
  assign wire61 = wire60;
  assign wire62 = {({wire48} && reg55[(1'h1):(1'h1)])};
  assign wire63 = (~&(~|((+(~&wire46)) + $unsigned($signed(wire48)))));
endmodule
