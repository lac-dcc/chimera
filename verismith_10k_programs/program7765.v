module top
#(parameter param42 = (((((~&(7'h41)) || {(7'h44)}) ^~ ({(8'hbf), (7'h42)} ? ((8'hbf) ^ (8'ha8)) : ((8'hb6) | (8'hb8)))) ? ((-((8'ha8) ? (8'h9e) : (7'h44))) * (((8'hae) | (8'ha7)) ? ((7'h41) << (8'hb9)) : (~&(8'h9f)))) : (+{((8'ha4) ? (8'hbb) : (8'ha4))})) ? (^(~^(((8'hb9) ? (8'h9d) : (8'hb1)) <= (8'had)))) : (~^(^~(((8'hbe) ? (8'h9e) : (7'h44)) ~^ {(8'hbf)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 wire4,
                 reg40,
                 reg39,
                 reg38,
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
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned(((((wire3 ? wire0 : (8'ha9)) ?
                             wire0[(3'h4):(2'h3)] : (wire3 ? wire3 : wire1)) ?
                         wire3 : (8'hb3)) ?
                     wire1[(4'h8):(3'h6)] : $signed((wire3[(1'h1):(1'h0)] ^~ {wire3,
                         wire1}))));
  assign wire5 = (wire3[(1'h1):(1'h1)] ?
                     (((~&wire3[(1'h0):(1'h0)]) ^ ($unsigned(wire4) ?
                             (wire3 & wire3) : wire0)) ?
                         wire4 : ({wire2} >>> $unsigned($unsigned(wire0)))) : $signed(wire1[(4'h8):(3'h6)]));
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= ({$signed($signed(((8'ha3) ? (8'hbd) : wire5)))} >= (8'hae));
      reg8 <= (reg7 ? $signed({wire3[(1'h1):(1'h0)]}) : wire1[(5'h12):(3'h4)]);
      reg9 <= (wire0[(4'h8):(4'h8)] && wire5[(1'h0):(1'h0)]);
      reg10 <= (&$signed({$signed(((8'hb5) ? reg9 : (8'h9d)))}));
    end
  always
    @(posedge clk) begin
      reg11 <= ((^reg8) ?
          $unsigned(((~$signed(wire6)) ?
              (&(wire1 + wire3)) : $unsigned((wire2 == wire0)))) : wire4[(4'he):(1'h0)]);
      reg12 <= $unsigned(wire2);
      if ({wire3[(3'h7):(3'h4)]})
        begin
          reg13 <= (~&((^(((8'ha2) ? wire1 : reg10) ? wire6 : (~reg8))) ?
              $unsigned(($signed(wire0) == (!wire5))) : ($signed(reg7[(2'h2):(1'h1)]) ~^ {{reg10},
                  (wire6 ? wire0 : reg9)})));
        end
      else
        begin
          reg13 <= (reg7[(3'h4):(2'h2)] ?
              ($signed($unsigned(((8'hb9) ~^ wire3))) ?
                  $unsigned(wire4) : $signed($unsigned(((8'hb7) ?
                      (8'hb4) : reg11)))) : reg13);
        end
    end
  assign wire14 = ((!$unsigned(wire0[(3'h5):(1'h0)])) ^~ (reg11 & (($signed(reg13) ?
                          reg10[(5'h12):(4'h8)] : $unsigned(wire5)) ?
                      $signed(wire3) : (^$unsigned((8'hbb))))));
  assign wire15 = wire14[(2'h3):(2'h3)];
  assign wire16 = $unsigned($unsigned($unsigned(wire1[(4'h9):(3'h7)])));
  always
    @(posedge clk) begin
      reg17 <= (+$unsigned($unsigned((((8'h9f) - wire1) <<< $signed((7'h43))))));
    end
  assign wire18 = reg8;
  always
    @(posedge clk) begin
      reg19 <= (~^{reg10[(2'h3):(1'h0)]});
      reg20 <= $signed(({{(~|reg10)}} | $signed(wire15[(1'h0):(1'h0)])));
      reg21 <= ($unsigned((8'hb8)) < $unsigned(($unsigned(reg9[(2'h3):(1'h1)]) ?
          ($unsigned((8'h9e)) ? (-wire2) : reg19[(4'hc):(3'h4)]) : wire15)));
      reg22 <= $signed(($unsigned($unsigned((reg19 ? reg12 : wire15))) ?
          ((wire15 ? reg13 : $signed(reg21)) ? (7'h41) : reg8) : (8'hac)));
      if ((((+{wire15[(2'h2):(1'h1)], (reg7 ? reg10 : (8'hb6))}) >>> wire2) ?
          $signed(reg9) : $signed(((!(~|reg19)) ?
              wire16 : wire6[(3'h7):(3'h7)]))))
        begin
          reg23 <= (^($signed($signed((~^wire3))) ?
              ((~$signed(reg21)) && $unsigned((&wire6))) : ((reg21 ?
                      $unsigned(reg22) : $unsigned((8'h9e))) ?
                  wire0[(3'h7):(3'h6)] : {(-reg21)})));
          if ($signed(({$signed($unsigned(wire3))} ?
              reg11[(4'h8):(3'h4)] : reg9)))
            begin
              reg24 <= reg10;
              reg25 <= (^$unsigned($signed(($signed((8'hb6)) ?
                  (~wire2) : (wire18 ? wire2 : reg10)))));
              reg26 <= reg20[(3'h6):(3'h6)];
              reg27 <= $unsigned(wire18[(3'h7):(3'h6)]);
            end
          else
            begin
              reg24 <= wire5;
              reg25 <= (!reg19);
              reg26 <= ($unsigned((($unsigned(reg7) | reg9[(2'h2):(1'h1)]) <= {wire5[(4'h8):(1'h1)]})) >= wire4[(2'h2):(2'h2)]);
              reg27 <= $unsigned(reg19[(1'h1):(1'h1)]);
              reg28 <= $signed(reg21);
            end
          reg29 <= $unsigned(reg27[(2'h3):(2'h2)]);
        end
      else
        begin
          reg23 <= $signed(($unsigned(((^~reg9) ? reg12 : (wire4 ^~ reg11))) ?
              {((reg12 || reg21) ^~ reg21),
                  $unsigned((wire4 < reg27))} : (($signed(wire3) | {(8'hba),
                      wire3}) ?
                  (!reg12) : (8'hbc))));
          reg24 <= reg10[(4'ha):(3'h7)];
        end
    end
  assign wire30 = {$signed(wire1[(5'h11):(1'h0)]), reg29};
  assign wire31 = {reg29[(4'ha):(3'h5)]};
  assign wire32 = reg28[(3'h5):(3'h4)];
  assign wire33 = wire18[(4'hd):(2'h2)];
  assign wire34 = ($unsigned(wire15) >>> (reg7 >>> (wire3[(4'h8):(3'h5)] == reg17[(1'h0):(1'h0)])));
  assign wire35 = {reg8[(1'h1):(1'h0)], reg11};
  assign wire36 = ((~((^~(reg22 ? reg27 : reg24)) ?
                      ((reg24 ? wire14 : reg13) ?
                          (wire1 << reg26) : (~^(8'hab))) : $unsigned($unsigned(reg9)))) != $unsigned((8'hb4)));
  assign wire37 = reg12;
  always
    @(posedge clk) begin
      reg38 <= wire14[(5'h12):(2'h3)];
      reg39 <= (reg10 ^ wire5[(3'h5):(1'h0)]);
      reg40 <= (!reg20[(4'h8):(3'h5)]);
    end
  assign wire41 = (!(($signed(((8'h9f) ?
                      (8'ha7) : reg25)) != $signed({(8'haa)})) ~^ reg27[(1'h0):(1'h0)]));
endmodule
