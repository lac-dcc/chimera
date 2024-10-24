module top
#(parameter param45 = (~&((((|(8'haf)) | (8'haf)) ? {((8'ha8) <= (8'h9d))} : (~&(&(8'ha9)))) ? (&(((8'ha1) ? (8'hb5) : (8'haf)) ^~ ((7'h41) ? (7'h41) : (8'ha0)))) : ({((8'hab) ? (8'ha6) : (8'h9c))} ^~ {((8'hb9) ? (8'hb5) : (8'ha3))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire16,
                 wire5,
                 wire4,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire4 = $signed($unsigned({({wire3} ?
                         $unsigned(wire0) : $signed((8'hb0)))}));
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      if ($unsigned(wire4))
        begin
          reg6 <= (wire0[(2'h2):(1'h1)] ^ wire4[(1'h1):(1'h0)]);
          reg7 <= (7'h43);
          reg8 <= {(~&($unsigned((~reg7)) ?
                  $unsigned(wire4[(3'h4):(2'h2)]) : $unsigned((wire1 ?
                      reg7 : wire0)))),
              {(wire1 + $signed((7'h44))),
                  (wire1[(3'h4):(2'h3)] ~^ (-wire1[(3'h5):(2'h3)]))}};
          reg9 <= wire1;
        end
      else
        begin
          reg6 <= (wire3 ~^ $unsigned($signed((+$signed(reg9)))));
        end
      reg10 <= {({($unsigned(wire1) > wire4), reg9} >>> (($unsigned(wire1) ?
              reg9[(3'h7):(3'h4)] : reg8) >= $unsigned($signed(reg7)))),
          (+$unsigned(reg6[(3'h6):(2'h2)]))};
      reg11 <= wire5[(4'h8):(3'h7)];
    end
  always
    @(posedge clk) begin
      if ($signed($signed(wire2[(1'h1):(1'h0)])))
        begin
          reg12 <= ($signed(reg9[(3'h6):(3'h6)]) >= ((^~$signed((8'ha7))) ?
              $signed(reg11) : $unsigned($signed($signed((8'hac))))));
          reg13 <= (wire4 | $unsigned((wire3 <= ({reg8} <<< (reg9 ?
              reg9 : reg12)))));
          if ((reg11 < (~^reg6[(4'h8):(1'h0)])))
            begin
              reg14 <= $signed($signed($signed((~(&reg8)))));
            end
          else
            begin
              reg14 <= reg10[(4'hf):(3'h4)];
            end
        end
      else
        begin
          reg12 <= ({$unsigned($signed(wire5[(5'h11):(1'h1)])), (8'h9c)} ?
              {(&((wire4 > wire3) ?
                      (reg12 ?
                          wire5 : wire3) : $unsigned((8'hba))))} : (~(reg10 < (reg7[(3'h4):(2'h3)] ?
                  $signed(reg12) : $unsigned(reg14)))));
          reg13 <= (~&$signed(reg8));
          reg14 <= wire1[(2'h2):(1'h1)];
        end
      reg15 <= (^~reg12[(2'h3):(2'h2)]);
    end
  assign wire16 = $signed(((($signed((8'hb1)) >> {(8'hb0)}) * reg15) <= ((~&$unsigned(reg6)) ?
                      (~&reg12[(3'h4):(2'h3)]) : wire3[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg17 <= ((($unsigned($unsigned(reg7)) << ({reg12} << $signed(reg8))) << $signed(({wire3} && $signed(reg15)))) ?
          $unsigned((~^(reg15 ?
              (8'ha5) : (reg15 > wire1)))) : $signed($unsigned(reg7)));
      if ((^~(reg6[(1'h0):(1'h0)] + (-{$signed(reg6), (wire2 - (7'h43))}))))
        begin
          reg18 <= ({$signed($unsigned(((7'h43) ? reg6 : reg17)))} ?
              $unsigned($signed($unsigned($unsigned(wire3)))) : wire3);
        end
      else
        begin
          reg18 <= reg12[(1'h1):(1'h1)];
          if (((wire2 * (|wire16[(5'h12):(2'h2)])) ?
              $unsigned($unsigned(($signed((8'ha3)) ?
                  (~^reg13) : {(8'hb9), wire4}))) : $unsigned($signed((~^(reg8 ?
                  wire3 : reg8))))))
            begin
              reg19 <= $unsigned($unsigned($signed((wire2 ?
                  (7'h41) : (wire2 ^~ reg7)))));
              reg20 <= (reg6 & $signed(($signed((reg13 ? reg11 : (8'ha7))) ?
                  $signed((reg10 ^~ reg14)) : reg9)));
            end
          else
            begin
              reg19 <= $unsigned(wire5);
              reg20 <= reg15;
              reg21 <= reg8[(1'h1):(1'h0)];
            end
          reg22 <= (+reg12[(2'h3):(1'h0)]);
          reg23 <= $unsigned((((^~(+wire3)) ~^ reg22[(2'h2):(2'h2)]) < (^(wire16[(4'hf):(2'h3)] ?
              (wire4 ^ (8'hb6)) : $unsigned(reg10)))));
          reg24 <= (($unsigned(((reg14 | reg8) ?
                  $signed(reg11) : (wire0 ? (8'hbb) : reg9))) ~^ (^((wire2 ?
                  reg11 : reg8) >= $signed((7'h43))))) ?
              (-$unsigned($unsigned((wire3 == (8'hae))))) : ((((reg23 <<< reg11) < reg20) ~^ (wire3 ?
                      $unsigned(reg11) : (|wire0))) ?
                  $unsigned(((&reg6) ?
                      reg9[(3'h6):(1'h0)] : $signed(reg7))) : ($unsigned($signed(reg6)) ?
                      {$signed(reg6)} : $unsigned(reg6))));
        end
      reg25 <= (-$unsigned(reg9[(3'h6):(3'h5)]));
      if ($unsigned({({(reg17 > (7'h40)), (^~reg7)} ?
              reg7 : ((reg23 + wire2) ? $unsigned(reg8) : (reg9 <= wire5)))}))
        begin
          reg26 <= {(({reg19, wire0} ? $signed($unsigned(reg17)) : {{reg8}}) ?
                  $unsigned(reg9[(4'ha):(1'h0)]) : {(~{(8'h9d)})})};
          reg27 <= (~|reg26[(4'h9):(4'h9)]);
          reg28 <= reg19[(4'ha):(1'h1)];
          reg29 <= ($unsigned(reg7[(2'h3):(1'h1)]) ?
              ((&reg24) >>> (~&(~$signed(reg22)))) : (~&(wire0[(1'h1):(1'h0)] <= wire5[(4'h8):(2'h2)])));
          reg30 <= $unsigned(((|reg9[(3'h5):(3'h4)]) << ((8'ha6) ?
              $signed(wire0[(1'h1):(1'h1)]) : wire5[(1'h1):(1'h1)])));
        end
      else
        begin
          reg26 <= $signed((~(&(^~$unsigned(reg12)))));
          reg27 <= (~^$unsigned((8'ha4)));
        end
      reg31 <= $signed(($signed({$unsigned(wire0), reg19}) ?
          $unsigned((~&{reg10, reg25})) : $unsigned({$unsigned((8'hbe)),
              {reg21, reg21}})));
    end
  assign wire32 = ($unsigned(((reg22 > (reg17 ? reg11 : wire1)) ?
                      ((reg9 & reg8) ^~ (^reg23)) : $signed((|wire5)))) >> {wire0});
  assign wire33 = ($signed((~^(((7'h40) - reg29) ?
                      $signed(reg6) : $unsigned((8'ha3))))) == $unsigned({(8'hb1),
                      (+(wire32 ~^ reg21))}));
  assign wire34 = $signed($unsigned(reg21));
  assign wire35 = (^$unsigned($signed(wire32)));
  assign wire36 = (~$signed(($unsigned($unsigned(reg24)) ?
                      {(-reg11), {reg21, wire33}} : reg20)));
  assign wire37 = $signed((~^(-(reg13 ? (8'hb7) : $unsigned(wire0)))));
  always
    @(posedge clk) begin
      reg38 <= (reg29 & wire37[(1'h0):(1'h0)]);
      reg39 <= reg6[(2'h3):(2'h3)];
      reg40 <= $signed($unsigned(wire36));
      reg41 <= reg30[(3'h4):(3'h4)];
    end
  assign wire42 = $signed(wire35[(4'h9):(2'h2)]);
  assign wire43 = $unsigned(reg39[(5'h10):(4'h8)]);
  assign wire44 = (({wire42[(3'h5):(1'h1)],
                      ((wire35 > reg17) & reg15[(4'hc):(4'hc)])} ~^ reg13[(5'h13):(4'hf)]) ~^ $signed(($signed((wire4 == reg11)) >= reg23[(4'hd):(4'hc)])));
endmodule
