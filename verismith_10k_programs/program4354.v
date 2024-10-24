module top
#(parameter param34 = (~&(+(+({(8'h9c), (8'haf)} ? ((7'h44) ? (8'ha9) : (8'hbb)) : (+(7'h43)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire4,
                 reg28,
                 reg27,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire2 ? (wire0 && $unsigned($signed(wire0))) : wire2);
  always
    @(posedge clk) begin
      reg5 <= (wire1[(3'h4):(2'h2)] ?
          ($signed(wire4[(1'h0):(1'h0)]) ?
              wire0[(3'h4):(2'h2)] : wire3) : (~^(({(8'hbe),
              wire0} >= (wire2 <<< (8'hbb))) > $signed({wire1}))));
      reg6 <= {$unsigned(wire1)};
      reg7 <= (+({(|$signed(wire4))} ?
          $unsigned(($unsigned(wire2) || (~^reg6))) : $unsigned(wire1[(4'ha):(4'ha)])));
    end
  always
    @(posedge clk) begin
      if ({(((wire0 ? {reg6} : $unsigned(reg7)) ?
                  wire4[(4'hc):(3'h7)] : $unsigned((wire3 >= reg6))) ?
              ((wire1 >= (reg6 << reg5)) ?
                  ($unsigned(wire2) || (wire2 ?
                      (8'hb8) : wire4)) : {$signed(wire4), reg6}) : wire1),
          ($signed(reg7) ?
              (((8'ha9) + $signed(reg7)) <<< ((~|reg7) | ((8'haa) ?
                  wire1 : (8'ha1)))) : wire2)})
        begin
          reg8 <= reg5;
        end
      else
        begin
          reg8 <= wire3;
          if ($signed($unsigned($unsigned(((~|(8'ha2)) <= reg5)))))
            begin
              reg9 <= (&wire2[(1'h1):(1'h0)]);
              reg10 <= wire4[(4'ha):(4'ha)];
              reg11 <= ((wire4[(3'h5):(1'h1)] < wire3) >>> $signed(reg5));
              reg12 <= (((($signed(wire4) < $signed(wire3)) || (+wire3)) ?
                      wire4 : wire4) ?
                  ((^wire4) <<< $unsigned(($signed(reg11) ?
                      $unsigned(wire2) : reg10))) : reg9[(3'h5):(2'h3)]);
            end
          else
            begin
              reg9 <= $unsigned($signed(wire4[(2'h2):(1'h0)]));
              reg10 <= ((((wire2[(4'hc):(4'h9)] >>> reg9) >= wire0) + (^~{(wire0 ?
                      (8'hb2) : reg10),
                  reg9[(1'h1):(1'h1)]})) > reg9);
              reg11 <= wire3;
            end
          reg13 <= $unsigned(reg9[(2'h2):(2'h2)]);
        end
      reg14 <= ($signed($unsigned({$signed((8'h9d)),
          (reg7 ^ reg13)})) * {reg8});
      reg15 <= reg5[(3'h6):(2'h2)];
      if ({((~|(+{reg12, (7'h44)})) + {($signed(reg5) ? wire1 : (~^wire3)),
              ($signed(reg5) ? reg8 : reg7[(1'h0):(1'h0)])}),
          (reg10 ? (8'hb5) : reg7)})
        begin
          reg16 <= ((($unsigned(reg7[(3'h4):(1'h1)]) != wire4[(3'h7):(2'h2)]) & (-(wire1 ?
              (~^reg5) : ((8'hab) >> wire1)))) & reg15);
          if ((reg15[(4'h9):(1'h0)] ?
              $unsigned($unsigned(($unsigned(wire3) ?
                  $signed(wire4) : $signed(reg6)))) : (reg5[(3'h4):(1'h0)] ?
                  $signed(wire4[(4'ha):(3'h7)]) : $signed($unsigned((wire2 ?
                      (8'hbd) : reg11))))))
            begin
              reg17 <= $signed((wire1 ?
                  reg12[(1'h1):(1'h1)] : reg12[(2'h3):(2'h2)]));
              reg18 <= ((~&$unsigned({$signed(reg11), (reg7 < (8'ha9))})) ?
                  reg6 : ((~&((~(8'ha4)) == {reg13})) < $unsigned({reg11})));
            end
          else
            begin
              reg17 <= (8'hba);
              reg18 <= $signed(reg16[(1'h0):(1'h0)]);
              reg19 <= (-(-(^~($signed((8'hae)) + $unsigned(reg7)))));
              reg20 <= reg17;
              reg21 <= reg10;
            end
        end
      else
        begin
          reg16 <= (~|$signed(((+(^~reg16)) ?
              (!$signed(wire4)) : (~&$signed(reg7)))));
          reg17 <= (&reg6);
          reg18 <= $signed(reg10[(2'h2):(1'h1)]);
        end
    end
  assign wire22 = (^~$unsigned(reg19[(2'h2):(1'h0)]));
  assign wire23 = (^(~|$signed((reg8 > reg21))));
  assign wire24 = $unsigned(((~^($unsigned((8'hbf)) ?
                          (8'hb7) : reg7[(1'h0):(1'h0)])) ?
                      reg9 : $signed($unsigned({(8'h9e), (8'hbf)}))));
  assign wire25 = (wire2[(1'h0):(1'h0)] > {reg7, (~&reg11[(4'hf):(3'h7)])});
  assign wire26 = $unsigned(($unsigned(reg7) | reg10[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg27 <= reg18;
      reg28 <= ({({reg18, $signed(wire22)} && $signed((reg20 ?
                  wire3 : reg11)))} ?
          (8'hb1) : $signed({$signed($signed((8'h9d))),
              $signed((reg13 >> reg13))}));
    end
  assign wire29 = $unsigned((~|$unsigned($signed({wire26, wire26}))));
  assign wire30 = {reg9};
  assign wire31 = reg10[(2'h2):(1'h1)];
  assign wire32 = wire25;
  assign wire33 = ({$unsigned(({(8'hb5)} << reg15[(4'h8):(3'h4)]))} < reg12);
endmodule
