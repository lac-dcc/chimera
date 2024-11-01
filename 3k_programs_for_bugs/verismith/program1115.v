module top
#(parameter param47 = (((({(8'hab), (8'ha5)} ? ((7'h40) + (8'hb7)) : ((8'hab) ? (8'haf) : (8'h9d))) == (!((8'hba) ? (8'hb0) : (8'ha7)))) ? {((8'hb7) ? (~&(8'haa)) : ((7'h40) ? (7'h42) : (8'hb7))), (^~((8'hac) & (8'ha6)))} : (8'hb0)) & (^({{(8'ha5), (8'ha9)}, (|(8'hb3))} < {(|(8'h9c)), ((8'ha2) >> (8'hb1))}))), 
parameter param48 = ((8'hb8) & (^(8'had))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire12,
                 wire5,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg32,
                 reg31,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned(((^{$unsigned(wire3), wire1}) ?
          $signed(wire2[(2'h2):(2'h2)]) : ($unsigned($signed(wire3)) <<< (^~wire5))));
    end
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed(wire0[(3'h4):(2'h2)]));
      reg8 <= $unsigned(((wire2[(2'h2):(2'h2)] ?
          ($unsigned(wire2) >= reg7[(4'h8):(2'h2)]) : ((wire3 ?
                  (8'hb4) : wire5) ?
              reg7[(3'h6):(1'h1)] : $signed(reg7))) + $signed(wire2[(1'h0):(1'h0)])));
      reg9 <= reg7[(4'ha):(4'h9)];
      reg10 <= (&$unsigned($signed($unsigned((reg6 ? wire0 : (8'h9d))))));
      reg11 <= (~^$signed($unsigned(((reg9 < reg10) << (wire4 ?
          reg7 : wire1)))));
    end
  assign wire12 = $signed(reg10);
  always
    @(posedge clk) begin
      reg13 <= ($unsigned(($signed((~^reg9)) ?
          (~|(wire12 ?
              wire2 : reg10)) : wire2)) != (reg9[(4'hb):(4'h8)] <<< $unsigned(wire3[(3'h7):(3'h4)])));
      if ((~^(wire5 ? wire5[(4'hb):(1'h1)] : $unsigned(reg9[(5'h11):(4'h9)]))))
        begin
          reg14 <= ($unsigned(((~^$signed(reg13)) ?
              $unsigned($unsigned(reg13)) : wire3[(4'hf):(3'h6)])) ^~ reg9[(2'h3):(2'h2)]);
        end
      else
        begin
          reg14 <= (wire4[(2'h2):(1'h1)] <<< $signed(wire2));
          reg15 <= (^(($unsigned(wire1[(1'h0):(1'h0)]) - $signed($signed(wire0))) ?
              {($unsigned(reg13) ?
                      (reg6 || wire12) : reg6[(3'h5):(3'h5)])} : {wire12,
                  wire0[(4'h9):(1'h1)]}));
          reg16 <= (8'hb2);
          reg17 <= (wire3[(3'h4):(1'h1)] << reg11);
          reg18 <= $unsigned(reg7[(1'h0):(1'h0)]);
        end
      reg19 <= wire2[(1'h0):(1'h0)];
      if (reg11)
        begin
          if ((wire4 ?
              (|($unsigned(reg15) ?
                  {reg18[(2'h3):(1'h0)],
                      reg8} : $signed((wire0 | reg19)))) : (|$signed($unsigned({(8'hb5)})))))
            begin
              reg20 <= (|$signed((&reg6)));
              reg21 <= reg16[(4'hb):(1'h0)];
              reg22 <= {((~reg13[(3'h5):(2'h2)]) ?
                      ($signed(wire1) && (-wire12)) : (reg17[(4'ha):(4'ha)] ?
                          (reg14 ?
                              (wire0 < reg17) : reg9) : {((8'hab) * reg11)}))};
              reg23 <= {{wire0[(3'h5):(1'h1)],
                      (((wire5 ? (8'hbd) : wire3) ?
                          (wire0 ?
                              reg15 : reg7) : reg17) ^ reg18[(2'h2):(1'h0)])}};
              reg24 <= $signed(reg7[(4'h9):(1'h1)]);
            end
          else
            begin
              reg20 <= $signed(wire2);
              reg21 <= {({$signed($unsigned((8'hb8)))} >> (8'ha0))};
            end
          reg25 <= reg7;
          reg26 <= ((+reg19) * (^$signed((!(^reg25)))));
          if ((($signed($signed({wire1, reg9})) ?
              $signed(reg23) : $signed($unsigned(reg9[(4'hf):(3'h4)]))) + $signed($signed(wire2))))
            begin
              reg27 <= $signed($unsigned((wire2[(2'h3):(2'h3)] ?
                  (^~$signed(reg11)) : {(reg21 == reg15)})));
            end
          else
            begin
              reg27 <= (reg13 ?
                  wire3 : (wire5[(4'hc):(4'h8)] ?
                      $signed({(wire4 ? reg10 : (8'hbb)),
                          (reg8 || reg9)}) : reg6));
              reg28 <= $unsigned(reg20);
            end
        end
      else
        begin
          reg20 <= reg16;
          reg21 <= reg25;
          reg22 <= reg9;
          reg23 <= $signed((((7'h44) ?
              {wire12} : $unsigned($unsigned(reg26))) << (-reg24)));
          reg24 <= wire1[(1'h0):(1'h0)];
        end
      reg29 <= ((((!reg10[(1'h1):(1'h0)]) == reg24[(5'h12):(4'hf)]) ?
          reg9 : (((+reg14) ? $signed(reg14) : (-reg6)) ?
              {(reg27 ?
                      wire3 : reg23)} : (^~$unsigned((8'hbe))))) | (&{(&(reg22 >= reg18)),
          ((^reg16) ? (wire3 <= (7'h43)) : wire1[(2'h2):(1'h0)])}));
    end
  assign wire30 = $unsigned({$unsigned(((-reg24) ? (~^reg8) : (~&reg14))),
                      $signed($unsigned((~|(8'ha8))))});
  always
    @(posedge clk) begin
      reg31 <= $signed(reg22[(2'h2):(1'h1)]);
      reg32 <= ($unsigned(wire0[(3'h5):(2'h3)]) ?
          $unsigned((^~reg17[(3'h7):(1'h0)])) : ($unsigned(($signed(reg15) ?
                  ((8'hb4) ? reg8 : reg10) : (wire4 ? reg14 : reg11))) ?
              (~|reg9) : reg13[(3'h6):(1'h1)]));
    end
  assign wire33 = (((!reg28[(4'h9):(3'h7)]) ~^ (^(+(wire12 ?
                      wire4 : (8'hb7))))) || reg8);
  assign wire34 = $unsigned({$unsigned($signed(reg20))});
  assign wire35 = (($signed((~wire34)) ^~ reg28[(1'h1):(1'h1)]) >= reg13);
  assign wire36 = (^((wire1 <<< $signed(wire33)) > (reg8 <<< (&$signed(reg32)))));
  assign wire37 = {wire5[(4'hc):(4'ha)], $unsigned(wire3[(4'hd):(4'ha)])};
  always
    @(posedge clk) begin
      reg38 <= reg31;
      if ({reg28[(3'h5):(2'h3)]})
        begin
          reg39 <= {$signed($signed(wire2))};
        end
      else
        begin
          reg39 <= (~^(~^(wire1[(1'h0):(1'h0)] && ($unsigned(reg16) ?
              (reg31 ? reg10 : wire36) : (~reg39)))));
        end
      reg40 <= {$signed(reg22)};
      reg41 <= wire34[(4'he):(1'h0)];
      reg42 <= wire34;
    end
  assign wire43 = $unsigned((~^wire4));
  assign wire44 = (^~(~^(~&$signed((wire12 ? wire1 : wire5)))));
  assign wire45 = wire5[(1'h1):(1'h1)];
  assign wire46 = (-$unsigned((wire33[(5'h13):(1'h0)] ?
                      $signed($unsigned(reg13)) : {((7'h41) >>> reg24)})));
endmodule
