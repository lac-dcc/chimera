module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire45,
                 wire35,
                 wire23,
                 wire22,
                 wire21,
                 wire4,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      if ((-$unsigned($unsigned((+wire0[(3'h4):(1'h1)])))))
        begin
          if ($signed($signed($signed($unsigned((8'hae))))))
            begin
              reg5 <= $signed(((((wire2 ?
                      (7'h42) : (8'hbb)) - $unsigned(wire4)) ^~ $unsigned($unsigned((8'ha0)))) ?
                  $signed(((&wire1) >= (!wire0))) : $signed(wire2[(2'h2):(2'h2)])));
              reg6 <= (^(wire0 ?
                  reg5 : (({wire1, wire0} != {reg5}) > $signed({(8'hb5)}))));
              reg7 <= (wire0 ?
                  ((&$signed((~|wire4))) ?
                      $unsigned((~&reg5[(5'h11):(3'h5)])) : (&(~^reg6))) : wire2[(1'h0):(1'h0)]);
              reg8 <= (((-((-(8'hb1)) ?
                      (~|(8'hb4)) : wire2)) & (+(wire3 - (^wire4)))) ?
                  wire3[(1'h0):(1'h0)] : reg6[(5'h10):(4'hd)]);
            end
          else
            begin
              reg5 <= (&wire0);
              reg6 <= (wire2 ?
                  (((!wire2[(1'h1):(1'h0)]) < ((^(7'h40)) ?
                          wire4[(5'h11):(4'he)] : reg6[(5'h12):(1'h0)])) ?
                      (~reg8[(2'h3):(2'h3)]) : $signed(wire4)) : {(reg6[(4'h8):(1'h1)] ?
                          ($unsigned(wire1) ?
                              $signed(wire1) : (reg7 ?
                                  wire0 : (8'ha7))) : {{wire3}, (8'ha5)})});
              reg7 <= reg7[(4'h9):(3'h7)];
            end
          if (($signed({reg6[(5'h12):(3'h4)], wire0[(4'hb):(2'h2)]}) ?
              (^~$signed(($unsigned((8'ha7)) ?
                  (^~(8'haa)) : wire0[(4'hb):(4'h9)]))) : wire2[(1'h1):(1'h1)]))
            begin
              reg9 <= $unsigned(reg8);
            end
          else
            begin
              reg9 <= {((7'h42) ~^ $unsigned((wire4 ^~ $signed(wire4))))};
              reg10 <= $signed(($signed({(~^(8'ha8))}) ?
                  $unsigned($signed($unsigned(wire0))) : ($unsigned($signed(wire1)) ?
                      wire2[(1'h0):(1'h0)] : ($unsigned(reg8) ?
                          (wire0 >> wire3) : wire0))));
              reg11 <= (reg8 ?
                  (-((^$signed(reg8)) ?
                      {(wire2 | wire4),
                          wire1} : wire1[(2'h2):(1'h0)])) : $unsigned({((8'hb0) ?
                          {wire3, reg10} : ((8'hb3) ? reg9 : reg10))}));
            end
          reg12 <= {$unsigned($signed((((8'hb8) | wire3) ?
                  $unsigned((8'hb4)) : (~|reg5)))),
              ($unsigned(($unsigned(wire0) <<< (wire0 ^~ (8'hb7)))) > (reg11[(5'h10):(4'hb)] == $signed(reg11)))};
        end
      else
        begin
          reg5 <= {$signed((~^$signed((reg5 ? reg10 : reg10)))),
              reg12[(3'h6):(2'h2)]};
          if ((($signed(reg9) && $unsigned((~&wire1))) ?
              reg8[(3'h5):(2'h3)] : wire4))
            begin
              reg6 <= reg7[(1'h0):(1'h0)];
              reg7 <= wire0;
              reg8 <= reg6[(2'h3):(2'h3)];
              reg9 <= reg11[(4'ha):(3'h6)];
            end
          else
            begin
              reg6 <= (8'h9d);
              reg7 <= (~^wire0);
              reg8 <= reg7;
              reg9 <= wire3[(3'h7):(3'h4)];
            end
          reg10 <= $unsigned((~&$unsigned(((wire3 >>> wire1) ?
              $unsigned((8'hba)) : (wire2 << reg5)))));
          reg11 <= wire3[(4'ha):(4'ha)];
        end
      reg13 <= $signed($signed(reg8));
      reg14 <= reg8[(2'h3):(2'h2)];
      if (reg5)
        begin
          reg15 <= (((&reg6) >> (+(~&$signed(wire2)))) >>> $signed(reg5));
        end
      else
        begin
          reg15 <= ((~^((reg8 | ((8'ha9) ? reg13 : reg6)) ?
              ((reg11 ? wire1 : wire2) ?
                  (reg8 ?
                      wire0 : reg13) : (reg5 == wire2)) : $unsigned(wire1[(3'h5):(2'h2)]))) >>> (wire2[(1'h0):(1'h0)] ?
              $unsigned($signed({reg11})) : $signed(reg12)));
          reg16 <= (!(((reg14[(4'h9):(4'h8)] > (-wire1)) ^~ reg15[(4'h9):(3'h7)]) || (&wire1[(3'h7):(3'h7)])));
        end
    end
  always
    @(posedge clk) begin
      reg17 <= wire3;
      reg18 <= (~|reg17);
      reg19 <= ($signed(({((8'hb6) ? wire4 : reg16)} ?
              {(reg16 ? (7'h42) : wire2),
                  (reg5 ? wire3 : reg6)} : (!reg10[(1'h0):(1'h0)]))) ?
          $unsigned(reg14[(1'h0):(1'h0)]) : reg9);
      reg20 <= $signed((reg14[(4'h9):(4'h9)] | wire2[(2'h2):(2'h2)]));
    end
  assign wire21 = $unsigned($unsigned(wire2[(1'h1):(1'h0)]));
  assign wire22 = reg7[(4'h9):(4'h8)];
  assign wire23 = (8'hba);
  always
    @(posedge clk) begin
      if (reg20[(4'he):(4'hc)])
        begin
          reg24 <= ($unsigned((((reg10 ?
              wire22 : wire1) >= (~reg11)) || ((^reg18) ?
              (~^wire4) : reg8))) > ((^~$unsigned((reg12 ? wire23 : reg7))) ?
              $signed((~((8'ha7) ? (7'h40) : wire23))) : $unsigned(reg18)));
          reg25 <= (((~^reg24) ?
                  wire21 : {$signed(wire21[(2'h2):(1'h0)]),
                      (~|reg8[(3'h4):(1'h1)])}) ?
              $unsigned($unsigned((reg24[(2'h2):(1'h0)] <<< (^~wire21)))) : ((wire1 ?
                      ((reg13 + wire21) ?
                          $signed(reg16) : wire22) : (reg18 || (~&reg12))) ?
                  (&$signed($signed(reg24))) : {(&wire3)}));
          reg26 <= wire3[(3'h6):(2'h3)];
        end
      else
        begin
          reg24 <= {$signed((8'hbd))};
          reg25 <= (8'hbb);
          reg26 <= ($signed(reg17) | ($signed((-(8'hb5))) ~^ $signed((reg5[(3'h5):(1'h1)] ^ $unsigned((8'hb0))))));
        end
      reg27 <= (wire1[(3'h5):(2'h2)] ?
          $unsigned(($signed(reg8[(2'h2):(1'h1)]) ?
              reg8[(2'h2):(1'h1)] : reg24)) : reg24[(4'hd):(3'h5)]);
      if ((8'h9c))
        begin
          reg28 <= {($signed(({(8'ha0), reg11} < $unsigned(reg27))) ?
                  (~$signed((wire21 ?
                      reg26 : reg25))) : {(reg10[(3'h4):(3'h4)] * (reg25 ?
                          reg7 : reg19)),
                      reg6[(3'h6):(3'h5)]})};
          reg29 <= (!({$signed(reg8[(2'h3):(1'h0)]), reg18[(3'h5):(3'h5)]} ?
              $unsigned($unsigned($unsigned(reg25))) : {reg24}));
          reg30 <= ((^$signed((wire23[(2'h2):(2'h2)] >= ((8'h9f) ?
                  reg19 : wire21)))) ?
              reg25 : $unsigned($signed($signed($signed(reg17)))));
          reg31 <= (+(reg8[(2'h2):(1'h0)] ?
              (|(8'hbb)) : ($unsigned({reg12, reg15}) ?
                  reg7 : (reg15[(4'hf):(2'h2)] ?
                      $signed((8'h9d)) : reg16[(5'h10):(4'hd)]))));
          reg32 <= ($unsigned(wire22) ~^ wire23[(3'h4):(1'h0)]);
        end
      else
        begin
          reg28 <= (^~reg26[(4'hf):(1'h1)]);
          reg29 <= $unsigned((((reg25[(3'h6):(1'h0)] ?
                  $signed(reg17) : reg30[(4'hb):(4'h8)]) > {{(8'hb1), reg5},
                  $signed((8'hb3))}) ?
              reg10 : (($signed(reg27) ? {reg24} : (reg6 ? reg14 : reg15)) ?
                  ($signed(wire3) ~^ reg9) : (reg28 <<< wire22[(2'h2):(1'h0)]))));
        end
      reg33 <= {($unsigned($signed((^~reg12))) ? reg29 : reg7), reg19};
    end
  always
    @(posedge clk) begin
      reg34 <= (+$signed(({$signed(reg27), reg30} ^~ (~|reg7[(4'h8):(2'h3)]))));
    end
  assign wire35 = reg16[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      if ((~|(reg8 ? (|$unsigned((reg5 < (8'had)))) : wire35)))
        begin
          reg36 <= $unsigned({((wire3 ?
                  {wire21} : $signed((8'h9e))) && ($unsigned(reg24) ?
                  {wire4} : {reg5}))});
          reg37 <= reg34[(2'h2):(2'h2)];
          reg38 <= (!reg13[(3'h5):(2'h2)]);
          reg39 <= ((!wire0) ?
              reg30 : (~|($signed({reg36,
                  wire35}) ^~ $unsigned($signed(reg30)))));
          reg40 <= (-$unsigned(((&(reg15 > (7'h40))) >> (reg29 ?
              reg36[(1'h1):(1'h1)] : (^~reg33)))));
        end
      else
        begin
          if ($signed((~|{wire35[(1'h0):(1'h0)]})))
            begin
              reg36 <= (~((((reg36 ? reg15 : reg19) ?
                      $unsigned((7'h42)) : reg5) ~^ reg29) ?
                  $unsigned(reg25) : ($unsigned((reg11 ? wire3 : reg9)) ?
                      reg29[(3'h4):(3'h4)] : reg17)));
            end
          else
            begin
              reg36 <= $unsigned((8'ha1));
            end
        end
      reg41 <= (|reg15);
      reg42 <= wire35[(1'h0):(1'h0)];
      reg43 <= $unsigned($signed(reg19[(4'ha):(3'h5)]));
      reg44 <= wire1;
    end
  assign wire45 = wire4;
endmodule
