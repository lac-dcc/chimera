module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ((((wire2 ?
                     (wire2 >= wire1) : wire1) ^~ $unsigned($unsigned((8'ha3)))) < (((+wire3) ?
                     wire2 : (wire2 ? (8'hb9) : wire0)) * ($unsigned(wire0) ?
                     wire4 : $unsigned(wire2)))) || $unsigned(wire4[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg6 <= wire1;
    end
  always
    @(posedge clk) begin
      reg7 <= {wire0[(1'h1):(1'h1)]};
      reg8 <= ((((!((8'hab) >>> reg7)) == $unsigned((wire1 * wire1))) >> (wire2 ?
          wire4[(3'h6):(1'h1)] : ($unsigned(reg6) || wire3[(3'h4):(1'h1)]))) ~^ $unsigned((8'hab)));
    end
  assign wire9 = $signed(wire4);
  assign wire10 = reg8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg11 <= (reg7[(3'h5):(1'h0)] || (&(reg6 ?
          {wire0} : (-wire3[(2'h3):(1'h1)]))));
      reg12 <= (reg11 ?
          (reg7[(4'h8):(2'h3)] ?
              (~|$signed($unsigned(wire4))) : wire1[(1'h0):(1'h0)]) : {$unsigned($signed($signed(reg7))),
              {((reg8 ? wire5 : wire0) > $signed(wire1))}});
      reg13 <= wire5;
      reg14 <= $unsigned(wire10[(4'ha):(3'h7)]);
    end
  assign wire15 = (wire2 > ({wire1} ?
                      ($unsigned({reg11}) ?
                          reg14[(4'h9):(4'h8)] : $unsigned((wire3 ?
                              reg11 : wire9))) : ($unsigned(wire5) ?
                          wire3[(1'h0):(1'h0)] : $signed($signed(wire9)))));
  assign wire16 = $unsigned($unsigned((&(+reg14))));
  assign wire17 = (reg7[(3'h6):(3'h4)] != ({($signed((8'ha8)) || reg7)} ?
                      wire1 : (wire0[(1'h0):(1'h0)] ?
                          wire4 : $signed(wire16))));
  assign wire18 = $signed((+{$signed($unsigned((8'haf))),
                      $signed($signed(wire15))}));
  assign wire19 = ((-wire4[(4'h8):(3'h5)]) ^ (|(({wire15, wire1} ?
                      (wire4 ?
                          reg8 : reg6) : $unsigned(wire10)) - ($unsigned(wire16) ?
                      $unsigned(wire18) : (reg12 ? wire17 : wire5)))));
  always
    @(posedge clk) begin
      reg20 <= reg12;
    end
  always
    @(posedge clk) begin
      reg21 <= wire3;
      reg22 <= (~^((wire5[(3'h5):(1'h1)] > ((reg21 | wire10) > (~&reg7))) ~^ wire18));
      reg23 <= reg11;
    end
  always
    @(posedge clk) begin
      reg24 <= (~(((~$unsigned(wire4)) && (+(-wire2))) ?
          $signed(wire4[(1'h0):(1'h0)]) : $unsigned(reg13)));
      if (({reg20[(2'h2):(2'h2)], (8'hbc)} ?
          $unsigned({$unsigned(wire19)}) : reg22[(4'hf):(2'h3)]))
        begin
          reg25 <= (((((reg12 || wire16) || wire2) ?
                      ($signed(wire4) ?
                          (reg13 << wire17) : (wire16 >>> wire18)) : {(wire19 ?
                              reg8 : wire15),
                          reg8}) ?
                  (8'h9d) : (wire3[(1'h1):(1'h0)] ?
                      reg7 : $unsigned($unsigned(wire16)))) ?
              $unsigned(wire9[(4'h9):(4'h8)]) : $unsigned(((reg11 <= ((8'hbc) ?
                  wire9 : reg8)) ^ ($signed(wire4) >>> $signed((8'h9f))))));
          reg26 <= (|(7'h40));
          reg27 <= (~|((-((reg26 < reg12) ? (^reg12) : (~&reg26))) ?
              reg8[(1'h0):(1'h0)] : ($unsigned((reg6 <<< wire1)) >= $signed((reg23 <= reg26)))));
        end
      else
        begin
          if ((8'hbd))
            begin
              reg25 <= (8'ha0);
              reg26 <= (reg13 ?
                  (|(reg12 == wire16[(4'ha):(2'h2)])) : ((^wire3[(1'h0):(1'h0)]) ?
                      ($signed((~reg11)) ^ {reg14[(4'he):(4'hb)],
                          (8'hac)}) : wire9[(1'h1):(1'h1)]));
              reg27 <= (|{$signed(({reg6} || reg22[(3'h6):(3'h4)]))});
              reg28 <= wire3;
              reg29 <= reg11[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= reg24[(4'hc):(3'h6)];
              reg26 <= $unsigned(((!(~(8'had))) ?
                  (reg12[(1'h0):(1'h0)] + (+$unsigned(reg25))) : $unsigned(((reg6 ?
                          (8'hbd) : reg13) ?
                      $unsigned(wire3) : $signed(wire5)))));
              reg27 <= (reg6[(4'h9):(2'h2)] ?
                  wire17 : ((reg23[(1'h0):(1'h0)] ?
                          (~(wire19 ?
                              reg29 : (8'hb7))) : wire4[(2'h3):(2'h2)]) ?
                      ($unsigned($signed(reg28)) ?
                          $unsigned((-wire0)) : reg28[(2'h3):(1'h0)]) : reg21[(4'he):(3'h6)]));
              reg28 <= $signed(($unsigned((|wire15)) ~^ $unsigned({$signed(reg28)})));
            end
          reg30 <= (^~{$unsigned($unsigned($unsigned(reg25)))});
          reg31 <= {(reg20[(2'h2):(1'h1)] ?
                  {reg23} : $signed((|$unsigned(reg24)))),
              ((reg20[(2'h2):(1'h1)] + $signed(((8'hb6) ? (8'hb3) : reg12))) ?
                  ((!(reg14 - reg6)) ?
                      ($signed(reg8) ?
                          {wire4} : wire1[(3'h7):(2'h3)]) : $signed($signed(reg26))) : (!(reg30[(3'h6):(3'h6)] ?
                      wire15 : (wire4 >>> wire19))))};
        end
    end
  assign wire32 = (reg31 - wire19);
  assign wire33 = $unsigned((reg21 ? (&{reg30}) : wire15[(2'h2):(1'h1)]));
endmodule
