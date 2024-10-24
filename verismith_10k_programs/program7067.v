module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned(wire0[(4'ha):(2'h2)]));
  assign wire5 = $unsigned({(+{(wire1 & wire0), (wire3 ? wire0 : wire4)})});
  assign wire6 = $signed({wire2,
                     ((wire1 ?
                         (~&wire5) : wire2[(3'h6):(2'h3)]) - ($signed((7'h42)) ?
                         wire4 : (8'hb7)))});
  assign wire7 = $signed($unsigned($signed({$unsigned(wire1)})));
  always
    @(posedge clk) begin
      if ((^~wire3))
        begin
          reg8 <= $signed($signed($signed((~^$signed(wire7)))));
          if (($unsigned(wire7) ?
              (((~&$signed((8'hba))) < wire1[(1'h0):(1'h0)]) ?
                  ((^wire5[(4'hb):(2'h3)]) >>> wire6[(2'h2):(1'h1)]) : $unsigned(((wire5 && wire2) ?
                      wire6[(4'ha):(3'h4)] : $unsigned(reg8)))) : wire2))
            begin
              reg9 <= ($unsigned((~^$unsigned($signed((8'hb1))))) + (&wire7[(1'h0):(1'h0)]));
              reg10 <= (((-(^~(wire5 ? reg9 : wire4))) ?
                      wire7[(3'h4):(3'h4)] : (((reg8 ^ wire6) >> (&wire4)) ?
                          $signed((wire5 - wire4)) : $unsigned((8'hb7)))) ?
                  wire2 : wire2);
              reg11 <= {wire5[(5'h13):(1'h1)]};
              reg12 <= $signed($signed(wire4));
              reg13 <= (|wire6);
            end
          else
            begin
              reg9 <= (wire1[(4'ha):(2'h3)] ^ {(8'hae),
                  (((wire0 ^~ wire4) && (wire0 ?
                      (8'hab) : wire7)) ~^ $signed($unsigned(wire7)))});
              reg10 <= $signed(reg9);
              reg11 <= $unsigned(reg12);
              reg12 <= $unsigned(((8'hb1) ?
                  ($unsigned(wire4) > ((8'hbf) >>> $unsigned(wire6))) : {wire5}));
              reg13 <= {((7'h44) ?
                      $signed($unsigned({reg11,
                          wire6})) : (~^($unsigned(reg11) + wire4)))};
            end
          reg14 <= ($signed(($unsigned($unsigned(reg8)) ? wire7 : wire1)) ?
              reg10[(1'h1):(1'h0)] : wire4[(2'h3):(2'h2)]);
          reg15 <= reg9;
          reg16 <= $signed((reg14[(4'hb):(4'h9)] ?
              ($unsigned($signed(wire3)) & $unsigned($unsigned(wire5))) : wire6));
        end
      else
        begin
          if ($signed($unsigned(($signed((reg14 > reg10)) ?
              (^~(8'hbb)) : (reg9 ~^ $signed(wire3))))))
            begin
              reg8 <= {(({(^~(8'hbc))} ?
                      ((^~reg10) - (reg9 ?
                          (8'had) : reg15)) : (+(^~reg16))) || reg11[(4'hb):(4'h8)])};
              reg9 <= (^~$unsigned((reg12[(3'h7):(1'h1)] ?
                  {$unsigned(wire5), wire5[(3'h6):(1'h0)]} : (-(|wire4)))));
              reg10 <= $signed(reg12);
              reg11 <= (((($signed(reg16) ^~ {reg16}) ?
                      {(!reg14), $signed(wire4)} : reg12[(4'ha):(4'ha)]) ?
                  (&$signed(wire3[(4'he):(4'hc)])) : wire3) ~^ {$unsigned(((wire2 ?
                      reg8 : reg8) < wire2)),
                  wire3});
            end
          else
            begin
              reg8 <= {$unsigned((8'ha7))};
              reg9 <= $signed({wire2[(2'h3):(1'h1)], reg13[(3'h5):(3'h4)]});
            end
          if (reg13[(3'h7):(1'h1)])
            begin
              reg12 <= (8'h9e);
              reg13 <= ($unsigned(($signed(wire5) < wire7)) != ($signed(((wire5 ?
                  wire2 : reg12) <= wire7[(1'h1):(1'h1)])) > $unsigned($signed(reg10[(1'h0):(1'h0)]))));
              reg14 <= {wire2,
                  ($signed($unsigned((+wire4))) << ($unsigned($signed(wire1)) ?
                      ((reg9 ? wire6 : wire3) | {wire4,
                          reg9}) : $unsigned((reg15 ? reg16 : reg10))))};
              reg15 <= (!reg11);
              reg16 <= (7'h41);
            end
          else
            begin
              reg12 <= (($unsigned(((wire4 ^~ reg16) ?
                  (reg15 && reg16) : reg12[(4'ha):(4'h8)])) >= wire7) - ((8'hb3) ?
                  {$unsigned(wire3),
                      $unsigned((~&reg16))} : ($unsigned((8'hbb)) + (^((8'hbe) ?
                      reg15 : (8'hb1))))));
              reg13 <= (-$signed((~|reg12)));
            end
          reg17 <= reg16;
          reg18 <= $signed(reg10[(1'h0):(1'h0)]);
          if (reg18[(3'h5):(1'h1)])
            begin
              reg19 <= wire4;
              reg20 <= (reg17[(5'h10):(3'h6)] >= $signed((((+wire7) ?
                  reg18[(3'h6):(1'h0)] : $unsigned(reg19)) < $signed((reg8 ?
                  wire2 : reg11)))));
              reg21 <= (8'hb1);
            end
          else
            begin
              reg19 <= wire3;
              reg20 <= (wire6 ?
                  $signed($signed((((8'ha6) | (8'ha5)) < (reg17 ?
                      wire4 : reg14)))) : $unsigned($unsigned($signed(reg12))));
              reg21 <= ((!(8'hbf)) >> ($unsigned(((reg10 ? reg18 : wire7) ?
                  (~|wire5) : (wire3 ?
                      reg15 : reg18))) <<< (({reg15} <= (reg21 ?
                  reg16 : wire4)) * (^~wire6[(1'h0):(1'h0)]))));
              reg22 <= (({{$signed(reg14)}, (~&(reg10 != reg9))} ?
                      $signed(reg16) : $unsigned(($signed(reg13) <<< (reg21 ^~ wire1)))) ?
                  (^(^(-(^~wire3)))) : reg16);
              reg23 <= (~|$signed((((reg17 && reg19) ?
                  reg11[(3'h5):(3'h5)] : $unsigned(reg8)) << (+(reg18 != wire5)))));
            end
        end
    end
  always
    @(posedge clk) begin
      if (({reg14[(4'h8):(2'h3)]} < (reg9 ?
          $unsigned({(~&(8'ha3)), reg16[(5'h10):(1'h1)]}) : (({reg12,
              (8'hb2)} >> (8'ha0)) - (~^reg18[(4'h9):(1'h1)])))))
        begin
          reg24 <= {reg14, $signed(reg12)};
          reg25 <= (!($unsigned((~|wire0)) != ({reg23} > ((wire7 - (8'ha2)) ?
              reg18 : (~^reg11)))));
        end
      else
        begin
          reg24 <= $signed(reg25);
          reg25 <= $signed($signed($signed(($signed(wire5) >= $signed(reg12)))));
          if (wire7[(3'h4):(1'h0)])
            begin
              reg26 <= $unsigned(($unsigned(reg15[(1'h1):(1'h1)]) - $unsigned(wire5)));
            end
          else
            begin
              reg26 <= {($unsigned((~&wire6)) ?
                      wire4[(5'h11):(1'h1)] : reg26[(3'h6):(3'h4)]),
                  $unsigned(wire3[(4'h9):(1'h1)])};
            end
          if ($signed(reg18[(3'h7):(3'h6)]))
            begin
              reg27 <= ((^~$signed($signed(wire2[(4'h8):(4'h8)]))) >> $unsigned((reg20[(2'h2):(1'h1)] ?
                  reg8[(3'h5):(2'h3)] : (8'hb8))));
              reg28 <= reg22;
              reg29 <= $unsigned(reg13);
              reg30 <= (-($signed((wire0[(1'h0):(1'h0)] ? (8'hbc) : reg22)) ?
                  (^~$unsigned(reg15)) : ({(^wire7)} || $signed($unsigned(reg11)))));
            end
          else
            begin
              reg27 <= reg8[(2'h2):(1'h1)];
            end
          reg31 <= reg24;
        end
      reg32 <= reg19;
      reg33 <= reg12;
      reg34 <= (~{(^~{(~reg26)}), $unsigned((~^$signed(reg31)))});
    end
  assign wire35 = reg26[(2'h2):(1'h1)];
  assign wire36 = (reg26[(3'h5):(1'h1)] < (($unsigned((wire0 != wire6)) | (-(-reg18))) ~^ (&$unsigned($unsigned(wire4)))));
endmodule
