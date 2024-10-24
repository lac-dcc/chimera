module top
#(parameter param36 = ({(((!(8'h9c)) >>> {(8'haf), (8'hbd)}) >> (~|{(8'hb0)}))} ^ (&({{(8'haf), (8'ha8)}} ? (((8'hbc) * (7'h43)) ? ((8'ha1) <= (7'h43)) : ((8'hb5) ? (7'h41) : (8'ha5))) : (|{(8'had)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = $unsigned(wire5[(2'h2):(2'h2)]);
  assign wire7 = $unsigned($unsigned(wire1[(1'h1):(1'h0)]));
  assign wire8 = (^$signed($signed(wire4)));
  assign wire9 = $unsigned($unsigned($unsigned((^~$unsigned(wire3)))));
  assign wire10 = ({$signed($signed((wire3 ? wire1 : wire7))),
                      (wire9[(3'h6):(3'h6)] ?
                          $signed((8'hb9)) : $signed($signed(wire0)))} << wire8);
  assign wire11 = {$signed((-$signed((&wire3))))};
  always
    @(posedge clk) begin
      reg12 <= $signed(($unsigned(wire4[(3'h5):(2'h3)]) ?
          wire7[(1'h1):(1'h1)] : (((!wire4) ?
              wire11[(3'h7):(3'h4)] : (wire1 ?
                  wire5 : (8'ha2))) == (+wire10))));
      reg13 <= wire3[(1'h0):(1'h0)];
    end
  assign wire14 = $unsigned($unsigned(wire1));
  assign wire15 = {(~wire1[(1'h1):(1'h0)]),
                      (wire7[(1'h1):(1'h1)] ?
                          $unsigned(wire9[(4'h8):(1'h0)]) : (~^(~wire9)))};
  assign wire16 = ($unsigned(wire15[(3'h5):(2'h3)]) >= (~^$signed((+{wire8,
                      wire7}))));
  assign wire17 = wire3[(3'h4):(1'h0)];
  assign wire18 = $unsigned((($signed((~^wire17)) ?
                          ((wire10 ?
                              (8'ha3) : wire3) ^~ $signed(wire11)) : (wire0[(1'h1):(1'h1)] * $unsigned(wire5))) ?
                      $signed({$signed(wire8)}) : $signed(wire15)));
  assign wire19 = $signed(({(wire11 ?
                          wire3[(3'h4):(1'h0)] : wire15)} < (^((~|wire6) ?
                      $unsigned(reg12) : {(7'h41)}))));
  assign wire20 = $signed(({(8'hb4)} ? reg12 : (8'ha1)));
  assign wire21 = reg13[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      reg22 <= (~^wire20[(1'h0):(1'h0)]);
      reg23 <= $signed({((((8'h9d) ? wire8 : wire11) ?
              (reg13 ?
                  wire6 : wire1) : (wire5 <= (8'ha9))) ^ (-$unsigned(wire2)))});
      reg24 <= wire4[(3'h7):(3'h5)];
      if ($signed($unsigned(wire15)))
        begin
          reg25 <= reg22[(3'h5):(1'h1)];
          if ((8'hb0))
            begin
              reg26 <= $signed((((~^(!wire16)) ?
                  (wire20[(5'h10):(4'hf)] != $signed(wire1)) : (~$unsigned(reg12))) >>> {(-$signed(wire7))}));
              reg27 <= ({$signed({wire14}),
                  (^~$unsigned({(8'h9d)}))} << ($signed($signed((wire20 ?
                      wire7 : wire10))) ?
                  (reg23 >> ((wire3 << reg24) ?
                      (wire18 | reg13) : $unsigned(wire7))) : (($unsigned(reg22) ^~ {(8'had),
                      wire0}) <= $signed((^~wire4)))));
              reg28 <= $signed(($signed((^$unsigned(reg27))) ?
                  (^wire4) : reg24));
            end
          else
            begin
              reg26 <= $unsigned($unsigned($unsigned(($signed((8'hbc)) & (reg23 & wire5)))));
            end
          reg29 <= $unsigned((({$unsigned(reg25)} ?
                  (reg23 <<< (wire1 >>> wire1)) : wire2[(3'h7):(3'h5)]) ?
              wire7[(2'h2):(2'h2)] : ((((8'hba) ? wire1 : reg26) ?
                      (^~reg24) : reg12) ?
                  (~^wire1) : (wire5 ? wire8 : $unsigned((8'hb9))))));
        end
      else
        begin
          if ((^reg22))
            begin
              reg25 <= (($signed(((-reg13) ?
                      reg13[(3'h5):(3'h5)] : wire10[(4'hc):(4'ha)])) ^~ (~^(^~(|(8'haf))))) ?
                  wire18[(1'h0):(1'h0)] : (8'h9d));
              reg26 <= $unsigned(((((reg23 || wire8) < $signed(wire14)) ?
                  (-reg13[(2'h3):(1'h0)]) : $signed(reg23)) - ($unsigned((reg13 >>> wire11)) ?
                  (reg28[(4'he):(3'h7)] ?
                      (reg26 || (7'h42)) : (reg22 ? reg29 : reg12)) : wire11)));
              reg27 <= {$unsigned({wire0, (!$unsigned(wire17))}),
                  ((&(wire20[(1'h0):(1'h0)] >>> wire21)) ?
                      $unsigned(((+wire4) && ((8'ha7) << wire4))) : $signed((-((8'ha3) ?
                          wire9 : reg29))))};
              reg28 <= (wire8[(3'h7):(1'h0)] || wire3[(1'h0):(1'h0)]);
              reg29 <= reg25;
            end
          else
            begin
              reg25 <= $signed((~^$signed($signed($unsigned((8'ha3))))));
              reg26 <= wire0[(2'h3):(1'h0)];
            end
          reg30 <= ($signed(($unsigned((wire1 << reg29)) || wire1)) & wire8[(4'hd):(4'h9)]);
          reg31 <= $signed(($unsigned(($unsigned((8'ha4)) ?
              reg24 : wire21[(4'ha):(4'h9)])) << (8'ha2)));
          reg32 <= ((|{wire17}) | $signed(wire6));
        end
      reg33 <= (((^~(((8'hb5) ? wire11 : wire14) ?
              (~&reg23) : $unsigned((8'h9c)))) && reg29) ?
          $unsigned($unsigned(reg23[(4'h9):(2'h2)])) : $unsigned((reg28[(4'h8):(3'h6)] ?
              (wire5 ? {wire17, reg27} : wire14) : (wire3 != (reg22 ?
                  (8'hb4) : reg30)))));
    end
  assign wire34 = $unsigned((&{$signed(reg22[(4'ha):(4'ha)])}));
  assign wire35 = wire7;
endmodule
