module top
#(parameter param52 = (+(~&((((8'hae) >> (8'ha9)) ^~ {(7'h40)}) ? (((7'h44) ? (8'hb5) : (8'hb7)) ? {(8'ha0), (8'h9f)} : (~&(8'hb5))) : (((8'haa) ? (8'ha4) : (8'hbf)) ? (&(7'h40)) : ((8'hab) ? (8'ha0) : (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire37,
                 wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire16,
                 wire5,
                 reg48,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg34,
                 reg33,
                 reg32,
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
  assign wire5 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((($signed((+wire3[(1'h0):(1'h0)])) ^~ ($unsigned(wire4[(3'h4):(3'h4)]) << ($unsigned(wire3) <<< {wire2}))) ?
          $unsigned(wire1) : ((wire4[(2'h2):(1'h1)] <= $signed((wire0 ?
              wire2 : wire3))) <<< $signed({((8'ha1) ? wire5 : wire1),
              wire5[(4'h9):(1'h1)]}))))
        begin
          reg6 <= wire4;
          reg7 <= wire5;
          reg8 <= ((((wire3 | (reg6 ^~ wire1)) != reg6[(4'h8):(2'h3)]) ?
              ((~|wire4[(1'h1):(1'h0)]) ?
                  wire1[(4'h9):(4'h8)] : (8'ha5)) : $unsigned($unsigned($unsigned(wire3)))) <<< (wire4[(3'h6):(2'h2)] ?
              reg7[(5'h12):(4'hf)] : (!(((7'h44) ? reg6 : wire0) ?
                  (wire4 | reg7) : (wire5 > wire3)))));
          if ($signed({$signed((^((8'hbc) ? reg6 : reg6)))}))
            begin
              reg9 <= $unsigned(((~&reg8[(1'h1):(1'h0)]) ?
                  $unsigned(wire3[(2'h3):(1'h0)]) : wire1));
              reg10 <= ((($unsigned(wire5) ?
                  $signed((wire5 ? reg6 : wire5)) : (^(reg9 ?
                      reg8 : (8'hbb)))) && (~$signed((~&wire5)))) * (~((~|wire0) ?
                  reg8 : (reg8[(1'h1):(1'h1)] ?
                      $unsigned((8'ha0)) : $signed(wire0)))));
              reg11 <= (+($unsigned(wire2) ?
                  (reg10[(5'h12):(4'hf)] < reg8[(1'h0):(1'h0)]) : reg6));
            end
          else
            begin
              reg9 <= (!$unsigned($unsigned((8'haa))));
            end
        end
      else
        begin
          reg6 <= ($unsigned((^$unsigned((wire2 | reg8)))) || wire2);
          reg7 <= $signed(((({(8'ha7), reg10} ?
                      ((8'hb9) ^ wire3) : wire5[(3'h5):(3'h4)]) ?
                  wire3[(4'h8):(3'h4)] : ((wire1 <<< reg6) ?
                      $signed(reg10) : ((7'h41) >= reg10))) ?
              $unsigned((^(reg6 * wire5))) : $signed($signed($unsigned(wire3)))));
          reg8 <= (-({$signed({reg8}), $signed((wire2 > wire1))} <<< reg10));
          if ($signed(((($unsigned(reg9) & $signed(wire1)) ?
              (~^(reg11 <<< wire5)) : $unsigned(reg11[(4'h8):(3'h4)])) - $signed(wire5))))
            begin
              reg9 <= $unsigned({$unsigned(((8'ha5) < $unsigned(wire4)))});
              reg10 <= reg11;
              reg11 <= reg11;
            end
          else
            begin
              reg9 <= wire2[(2'h3):(1'h0)];
              reg10 <= wire5;
              reg11 <= ($signed($unsigned(($signed(wire2) | wire2))) ?
                  wire4[(1'h1):(1'h0)] : (8'ha4));
              reg12 <= (&{wire0,
                  ($signed({reg7, reg7}) ?
                      (&{reg7}) : ($signed(wire3) ? {reg7} : (!reg7)))});
            end
        end
      reg13 <= wire0[(4'he):(2'h3)];
      reg14 <= ({($unsigned($signed(reg11)) ^~ {wire5,
              reg6[(3'h7):(3'h4)]})} * (reg11[(4'hd):(3'h4)] > $signed(reg13)));
      reg15 <= $signed(reg6[(1'h0):(1'h0)]);
    end
  assign wire16 = $unsigned($signed($signed(((reg15 ? (8'hbb) : (8'hbb)) ?
                      (~|reg15) : wire1[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg17 <= {$signed($unsigned(({wire5} ? (!(8'hb4)) : {reg6, (8'hb8)}))),
          ($unsigned(reg7[(1'h0):(1'h0)]) ?
              {($unsigned(reg7) ?
                      ((8'ha1) ?
                          wire16 : reg10) : (wire4 <= reg9))} : reg6[(3'h6):(3'h5)])};
      if (reg17[(4'hb):(3'h5)])
        begin
          reg18 <= $signed(($signed((!wire0[(4'hb):(1'h1)])) ?
              $signed(reg10) : ((~|wire5[(2'h3):(2'h3)]) < (|(!reg13)))));
        end
      else
        begin
          reg18 <= (($signed(({wire16, wire5} ? reg17 : $signed(wire16))) ?
              $unsigned({{reg9, wire0}}) : $unsigned(((reg15 != reg8) ?
                  $signed(wire16) : reg7[(4'h9):(2'h2)]))) && $signed(wire5));
          reg19 <= reg11[(5'h11):(4'h8)];
          reg20 <= wire1;
          reg21 <= {$unsigned({{reg20[(4'ha):(4'h8)]}})};
          reg22 <= (|wire3[(2'h3):(1'h1)]);
        end
      reg23 <= (-(reg19 ?
          $signed((reg7 > wire2[(3'h4):(2'h2)])) : ((~$signed(wire0)) ?
              $signed((reg13 ? reg6 : reg13)) : $signed($signed(reg10)))));
      reg24 <= $signed(reg6[(4'h8):(3'h5)]);
    end
  assign wire25 = {reg9[(1'h1):(1'h0)]};
  assign wire26 = wire3;
  assign wire27 = (-wire16);
  assign wire28 = ($unsigned(wire3) <<< (({$signed(reg6),
                          wire2} >>> ((reg22 ^ reg9) ?
                          wire2[(3'h4):(2'h2)] : {reg10, (8'hac)})) ?
                      (((reg22 ? wire26 : reg11) ?
                          (wire3 ?
                              reg22 : wire1) : reg11) & (reg17[(3'h7):(3'h6)] << (&reg17))) : reg12));
  assign wire29 = reg21[(1'h1):(1'h0)];
  assign wire30 = (($signed(((^~reg10) != (reg21 ? reg22 : (8'hb9)))) ?
                      ($signed({(8'hb3),
                          reg18}) != (!$signed(reg10))) : wire4) <= $unsigned((~&$unsigned(reg7))));
  assign wire31 = wire2[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg32 <= reg10[(4'ha):(3'h5)];
      reg33 <= {$signed(wire25[(3'h7):(3'h6)])};
      reg34 <= wire3;
    end
  assign wire35 = wire31;
  assign wire36 = reg7;
  assign wire37 = ((&((wire16[(2'h2):(1'h1)] & (wire31 <<< (8'hb6))) ?
                      {$signed(reg13)} : reg18)) + $signed(($unsigned(reg24[(1'h1):(1'h0)]) ?
                      $signed((wire27 ? wire0 : reg34)) : $unsigned(wire5))));
  always
    @(posedge clk) begin
      reg38 <= (+$unsigned((^wire16)));
      reg39 <= ((^~(~^(8'h9d))) <<< ($signed($signed($signed(wire26))) ?
          (^~($signed(reg18) ?
              $unsigned(wire27) : reg12)) : ($unsigned((!(8'ha4))) ?
              (~&{reg9}) : $signed($unsigned((8'hb0))))));
      reg40 <= wire2;
      reg41 <= (|(~($signed(wire35[(5'h10):(1'h1)]) >>> reg19[(3'h6):(3'h6)])));
      if ($unsigned($unsigned(wire5[(3'h7):(2'h2)])))
        begin
          reg42 <= wire36;
          reg43 <= (~&{{{(reg39 ? reg18 : wire16), reg23},
                  $unsigned((wire30 ? wire5 : reg20))},
              (|(~|{(8'hae)}))});
        end
      else
        begin
          reg42 <= ((~|reg18) ?
              (^reg24) : $unsigned((|((reg10 << reg39) ?
                  (^wire1) : reg7[(4'hf):(4'ha)]))));
          reg43 <= {{({{wire36, reg24}} ? reg9 : {wire26[(3'h4):(1'h1)]})},
              $signed(($unsigned({reg32}) ?
                  ({reg20} ~^ {(8'h9f)}) : (~|$unsigned(reg9))))};
          reg44 <= $signed((reg12[(4'h8):(1'h1)] | $unsigned(reg39[(3'h7):(1'h1)])));
        end
    end
  assign wire45 = (~|reg12);
  assign wire46 = wire31;
  assign wire47 = $signed($unsigned(($unsigned($signed(reg14)) ?
                      reg24 : reg40)));
  always
    @(posedge clk) begin
      reg48 <= $signed((($unsigned($unsigned(reg12)) - (reg42[(2'h2):(1'h1)] >> reg7)) <= $signed(wire31[(1'h0):(1'h0)])));
    end
  assign wire49 = $unsigned(reg9[(3'h7):(3'h6)]);
  assign wire50 = wire3[(3'h7):(1'h1)];
  assign wire51 = wire45[(1'h0):(1'h0)];
endmodule
