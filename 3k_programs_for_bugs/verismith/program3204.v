module top
#(parameter param54 = {(~|(+({(8'hb4)} << ((8'hb5) ^ (8'hb3))))), {(({(8'h9c)} ? (|(8'haa)) : (~^(8'hb9))) ? ({(8'ha8), (8'ha9)} ~^ ((8'h9d) ? (8'haf) : (7'h40))) : (((8'hbe) || (8'hac)) ? ((8'hba) ? (8'ha8) : (8'haa)) : {(8'h9e), (8'hb4)})), (~(((7'h44) ? (8'ha8) : (8'hb5)) ? (&(8'hb1)) : (&(7'h43))))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire50;
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire23,
                 wire24,
                 wire25,
                 wire50,
                 reg4,
                 reg5,
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
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg4 <= wire1;
          reg5 <= ($unsigned(wire3[(2'h2):(2'h2)]) + (wire1[(4'h9):(1'h1)] ?
              wire2 : reg4));
        end
      else
        begin
          reg4 <= $signed(({$signed(wire2), $unsigned($unsigned(reg5))} ?
              wire0[(1'h0):(1'h0)] : $unsigned((reg5 ?
                  (~|reg4) : {(8'hb0), reg5}))));
          reg5 <= ({(~$unsigned(reg4[(3'h7):(1'h0)]))} ^ $unsigned(((reg4[(3'h7):(3'h7)] ?
              wire1[(3'h5):(2'h2)] : (wire0 ?
                  wire0 : wire1)) >> (~(reg4 <<< wire3)))));
          if (reg4[(1'h1):(1'h1)])
            begin
              reg6 <= wire3;
              reg7 <= $unsigned($unsigned(wire1[(4'h8):(1'h1)]));
              reg8 <= $unsigned($signed({reg4[(1'h0):(1'h0)],
                  reg4[(2'h3):(2'h2)]}));
            end
          else
            begin
              reg6 <= $unsigned($unsigned(({wire2} | ((wire0 ? reg8 : wire2) ?
                  $signed(wire2) : (^(8'h9f))))));
              reg7 <= $unsigned(((~^((reg7 ? wire0 : (8'hbf)) ?
                      $signed((8'hbb)) : reg6[(1'h0):(1'h0)])) ?
                  wire3 : reg8));
              reg8 <= ($signed(($signed((wire1 ? wire2 : reg8)) ?
                  ((reg8 <= reg5) <= (~|(7'h40))) : wire1)) + (|($unsigned($signed((8'hb0))) || $unsigned($signed(wire0)))));
              reg9 <= reg6;
              reg10 <= (({wire1, (~&reg9)} ?
                  reg8[(3'h5):(2'h2)] : (-(-reg8[(3'h7):(3'h7)]))) == $unsigned((&reg6)));
            end
          reg11 <= wire3;
          if (wire1)
            begin
              reg12 <= (reg9[(5'h10):(3'h4)] || ($unsigned(reg9[(3'h5):(3'h5)]) >= (^$unsigned({reg6}))));
              reg13 <= ((+$signed($unsigned((reg12 ?
                  reg5 : wire0)))) ^ $unsigned(reg11));
            end
          else
            begin
              reg12 <= (~^$unsigned($signed($unsigned({reg8, (8'ha1)}))));
              reg13 <= ((|reg6) ?
                  (~^reg8[(3'h5):(2'h3)]) : (|reg5[(3'h4):(2'h3)]));
            end
        end
    end
  assign wire14 = (({(8'h9f)} ?
                      wire1[(3'h4):(2'h2)] : $unsigned((|(wire3 * reg13)))) << (~&($signed($unsigned(reg12)) ?
                      $signed(reg5) : wire2[(1'h0):(1'h0)])));
  assign wire15 = (&({reg9} << $signed((|{wire2}))));
  assign wire16 = reg9[(3'h7):(1'h1)];
  assign wire17 = (^(wire0 ?
                      reg4[(1'h0):(1'h0)] : (reg13[(5'h10):(4'h8)] + $signed($unsigned(reg12)))));
  always
    @(posedge clk) begin
      reg18 <= reg11[(3'h7):(3'h7)];
      reg19 <= ($signed($unsigned(reg10[(4'hf):(4'he)])) == ($signed({$unsigned(wire2)}) ?
          (~|(^~reg8)) : (($signed(wire2) >= reg10) > (-$signed(reg18)))));
      reg20 <= wire16;
      reg21 <= $unsigned(((~^reg8) && $signed(wire2)));
      reg22 <= wire0[(5'h14):(4'hb)];
    end
  assign wire23 = wire2[(3'h5):(1'h0)];
  assign wire24 = (~&(&reg12[(2'h3):(2'h2)]));
  assign wire25 = reg12[(5'h11):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed(reg20))
        begin
          reg26 <= $signed((($signed({reg7}) ?
                  ((reg9 <<< wire1) ?
                      (reg6 ?
                          reg6 : wire15) : ((8'had) | reg7)) : $signed((~&(8'ha0)))) ?
              $signed(((~&reg19) > {wire17})) : $signed(((wire16 < (8'haf)) && $unsigned((7'h42))))));
          reg27 <= {({(~|reg11[(4'hf):(1'h0)]), $unsigned($unsigned(reg6))} ?
                  ((^~$signed(wire16)) ?
                      (reg20[(2'h2):(1'h0)] ? wire24 : (8'h9f)) : {(reg22 ?
                              reg5 : reg21),
                          reg20}) : {$signed(wire23),
                      $unsigned({wire2, reg12})}),
              $signed($unsigned($signed($unsigned((8'hb0)))))};
        end
      else
        begin
          reg26 <= (~&(~|$unsigned((~&wire17))));
          reg27 <= ((^wire23) ?
              $signed(wire24) : (reg11 ~^ (~(((8'hba) ?
                  reg5 : wire24) >= $unsigned(reg18)))));
          reg28 <= $unsigned(reg26[(4'hd):(3'h6)]);
          reg29 <= ($unsigned((!{(^wire16), reg20})) ?
              reg8 : reg18[(3'h5):(2'h3)]);
        end
      reg30 <= {wire14};
      reg31 <= $unsigned(((((reg21 ? wire17 : reg11) ?
              {wire17, wire14} : reg12) != {$unsigned((8'hbf)),
              reg8[(2'h2):(1'h0)]}) ?
          ($signed(wire17) | $signed($unsigned(wire0))) : ($unsigned(reg18[(3'h5):(2'h2)]) ?
              wire16[(5'h12):(1'h0)] : ($unsigned(reg20) ^ wire23))));
      if (reg29)
        begin
          reg32 <= ((8'had) >= $signed((&((reg20 >> reg28) ~^ (|reg18)))));
          reg33 <= ({($unsigned(reg30) ?
                  ($unsigned(reg26) ?
                      (reg9 >= (8'had)) : $signed(wire2)) : wire23[(2'h2):(2'h2)])} >= (~&(reg20[(4'h8):(3'h6)] ^~ (~|(|wire16)))));
          reg34 <= reg32[(3'h4):(2'h3)];
        end
      else
        begin
          reg32 <= reg28;
          if ((|$signed((~($signed(reg34) ? (~|(8'hb8)) : $unsigned(reg22))))))
            begin
              reg33 <= reg28;
            end
          else
            begin
              reg33 <= (((((8'hae) < (reg26 != reg34)) << (reg4 && {reg32})) ?
                      $signed($signed({reg21})) : (!(!$signed((8'hb2))))) ?
                  $unsigned((^{(reg19 ^ reg18)})) : ((^$unsigned(reg19[(2'h3):(2'h2)])) * wire17));
              reg34 <= $unsigned(($signed((wire0 ?
                      reg19[(3'h4):(2'h3)] : reg28[(1'h1):(1'h1)])) ?
                  ((~&(wire14 ? reg21 : reg31)) ?
                      (&$signed((7'h40))) : (^reg11)) : (8'h9d)));
              reg35 <= (~&reg22);
              reg36 <= {(((!{(8'ha7)}) < {{reg33}}) <= wire23), reg19};
              reg37 <= {(~^((!wire14) == (reg28 < (reg32 ? reg28 : reg6)))),
                  (~&$signed(reg33))};
            end
        end
    end
  module38 #() modinst51 (.wire42(wire24), .wire40(reg36), .wire41(reg31), .y(wire50), .clk(clk), .wire39(reg11));
  assign wire52 = (($unsigned(reg19) <<< $unsigned(reg19[(4'h9):(4'h9)])) ?
                      (~&{($unsigned(reg22) ^ ((8'hb5) ?
                              wire24 : reg29))}) : $signed((reg13[(2'h3):(1'h0)] ?
                          (~|$signed(wire25)) : ($unsigned(reg34) ?
                              (~^(7'h40)) : (reg35 <= (8'had))))));
  assign wire53 = (reg31 ? reg13 : (wire50 ? reg33 : (-{(~^wire14)})));
endmodule

module module38
#(parameter param49 = {(-(~^(((8'hab) < (8'had)) ? ((8'hbc) ^ (8'h9f)) : {(7'h40)})))})
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  input wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, (1'h0)};
  assign wire43 = $signed(($signed(((wire39 ?
                      wire41 : (8'hbb)) >>> ((8'hbb) & wire42))) > (({wire39,
                              wire41} ?
                          $unsigned((8'ha2)) : {wire41, wire42}) ?
                      $unsigned($signed(wire40)) : ({(8'ha5), wire41} ?
                          (wire42 ? wire41 : wire39) : $signed(wire39)))));
  assign wire44 = wire39;
  assign wire45 = wire43;
  assign wire46 = wire39[(4'hf):(4'hd)];
  assign wire47 = $unsigned(wire46[(3'h5):(1'h1)]);
  assign wire48 = $signed(wire39);
endmodule
