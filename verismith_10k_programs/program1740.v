module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire17,
                 wire16,
                 wire15,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 reg14,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire4[(1'h1):(1'h0)];
  assign wire6 = $signed(((wire4 && wire4[(1'h1):(1'h1)]) > $signed(wire0[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg7 <= ((~wire1) ?
          {$unsigned(wire3[(4'h9):(3'h5)]),
              wire5} : (~|$unsigned((wire1[(1'h1):(1'h0)] || wire2[(3'h5):(1'h0)]))));
      reg8 <= (wire1 <= (wire4[(1'h0):(1'h0)] ? $signed(wire5) : (-wire0)));
    end
  assign wire9 = $unsigned((&$unsigned($unsigned((reg8 ? wire2 : reg7)))));
  assign wire10 = (^(^~wire1[(2'h2):(1'h0)]));
  assign wire11 = reg7;
  assign wire12 = $unsigned($unsigned(wire2));
  assign wire13 = wire5;
  always
    @(posedge clk) begin
      reg14 <= ($signed((($unsigned(wire11) ?
                  (reg7 * wire9) : ((8'ha6) ~^ wire6)) ?
              $unsigned(wire6[(4'hb):(4'h9)]) : reg8)) ?
          {($unsigned({wire5}) != (wire0 ?
                  $signed(wire10) : (wire5 ? wire2 : wire5))),
              $unsigned(($signed(wire10) ?
                  wire6 : (~|wire13)))} : (~^(~|wire0)));
    end
  assign wire15 = wire3[(1'h1):(1'h0)];
  assign wire16 = wire9;
  assign wire17 = ($unsigned((reg8 + {(wire11 << (8'hb4)),
                      wire2[(1'h0):(1'h0)]})) | $unsigned($signed((8'h9d))));
  always
    @(posedge clk) begin
      reg18 <= (!((~^(~&(reg8 ?
          (8'h9f) : wire3))) < ($unsigned($signed(wire4)) ?
          (^reg7[(3'h7):(1'h0)]) : $unsigned((wire0 >> wire9)))));
      if (wire3[(1'h0):(1'h0)])
        begin
          reg19 <= $unsigned(($unsigned(reg7[(1'h1):(1'h0)]) <= $signed({(+wire5)})));
          reg20 <= (~^wire0[(1'h0):(1'h0)]);
        end
      else
        begin
          reg19 <= wire12[(3'h7):(3'h5)];
          reg20 <= $signed((-reg18));
          reg21 <= wire1;
          if (((8'hac) != ($unsigned(($signed(wire9) - (&wire1))) ^ ((reg14[(2'h3):(2'h3)] ?
                  (wire2 * wire3) : wire16) ?
              $signed({wire13}) : ($unsigned(wire9) ?
                  $signed(wire3) : wire6[(2'h2):(1'h1)])))))
            begin
              reg22 <= (^(^~reg21));
            end
          else
            begin
              reg22 <= (^{(~|wire10[(1'h1):(1'h0)]),
                  $unsigned($unsigned(wire12[(4'h8):(3'h7)]))});
              reg23 <= ({({{(8'hbc), wire1},
                          (reg22 ? wire15 : (8'hb9))} >= wire5[(2'h3):(2'h2)]),
                      wire11} ?
                  ((~$signed($signed(wire4))) >= (&$signed(wire5))) : (reg18[(4'ha):(4'ha)] || (((wire10 ?
                      wire10 : wire0) < wire0[(1'h0):(1'h0)]) ~^ {{wire2},
                      $unsigned(wire1)})));
              reg24 <= wire13[(3'h5):(1'h0)];
            end
          if ((wire15 & reg23[(4'h9):(2'h2)]))
            begin
              reg25 <= $signed(($signed(reg7) ?
                  ($unsigned((+(8'ha6))) >> (~^wire9)) : {$unsigned(wire9),
                      (8'hba)}));
              reg26 <= reg20[(1'h0):(1'h0)];
              reg27 <= ((|$signed($unsigned((~&wire5)))) ?
                  wire2[(4'hc):(4'h9)] : ({reg25,
                      $unsigned(wire15[(4'he):(3'h4)])} | (((~(8'haf)) >= $unsigned(wire11)) ~^ (wire13[(3'h7):(3'h7)] ^ (&reg23)))));
            end
          else
            begin
              reg25 <= ($unsigned($signed((reg21[(4'hf):(3'h5)] < reg19[(4'ha):(4'ha)]))) ?
                  (7'h40) : wire3);
              reg26 <= wire13;
            end
        end
      reg28 <= reg14;
      reg29 <= reg19[(4'ha):(4'h8)];
    end
  always
    @(posedge clk) begin
      reg30 <= $signed($signed(reg19));
      reg31 <= $signed((!$signed(((reg29 ? reg14 : reg18) ?
          wire3[(4'hc):(3'h7)] : (wire17 ? (8'hab) : wire4)))));
      reg32 <= ($signed((8'hbe)) ^~ ($unsigned(($unsigned(wire9) ~^ (wire10 ?
          (8'hb1) : reg18))) <<< reg23));
      reg33 <= $unsigned(wire13[(3'h7):(3'h5)]);
    end
  assign wire34 = $signed(((wire6 ?
                          ((wire15 != (8'h9f)) ?
                              (reg25 - wire6) : wire16) : wire15) ?
                      $unsigned(($unsigned(wire1) ?
                          (wire1 ?
                              wire16 : (8'hb1)) : reg8[(2'h3):(2'h3)])) : ((&(reg26 ?
                              reg27 : reg20)) ?
                          ($signed(reg23) || wire17[(4'hc):(4'hc)]) : ((reg23 < reg7) ?
                              wire13 : wire6[(3'h7):(3'h6)]))));
  assign wire35 = wire1;
  assign wire36 = ($unsigned(wire16[(4'ha):(2'h3)]) ? wire1 : (^~reg25));
  assign wire37 = (+reg21);
  always
    @(posedge clk) begin
      if (((wire5 ?
          {wire10[(3'h5):(3'h4)], wire9[(3'h5):(1'h0)]} : (^~$unsigned({reg14,
              reg30}))) ^~ reg18))
        begin
          if (reg22[(4'h8):(3'h4)])
            begin
              reg38 <= (8'ha6);
            end
          else
            begin
              reg38 <= (wire35[(1'h1):(1'h0)] ?
                  (~((-$signed((8'ha7))) ?
                      ($signed(reg32) <= (reg29 ?
                          reg22 : (8'hae))) : reg25[(1'h1):(1'h1)])) : reg38[(4'hd):(4'hd)]);
              reg39 <= (wire16 <= $signed(((reg19 ?
                  $unsigned(wire15) : $signed((8'ha0))) >> wire6)));
              reg40 <= reg27;
              reg41 <= $signed(reg22);
              reg42 <= (8'hbc);
            end
          reg43 <= $unsigned((~reg22));
          reg44 <= (~&(~(+((!wire17) >>> reg18))));
          reg45 <= $unsigned((($signed((^reg25)) || (!(~|reg8))) ?
              {((wire12 >>> reg22) & $unsigned(wire0))} : $signed($unsigned(wire34))));
          reg46 <= reg21;
        end
      else
        begin
          reg38 <= (wire34[(4'hd):(2'h3)] <= wire5[(1'h0):(1'h0)]);
          reg39 <= {reg7[(4'h8):(4'h8)], reg21[(2'h3):(1'h0)]};
          if ({(wire11 <= ($signed((^reg32)) ?
                  (~&(~&reg41)) : ((~&reg31) != (!reg44))))})
            begin
              reg40 <= wire0[(2'h2):(2'h2)];
              reg41 <= $signed(reg31);
              reg42 <= wire35;
            end
          else
            begin
              reg40 <= $signed({$signed((~^(wire16 ? reg40 : wire37)))});
              reg41 <= $signed(wire13);
              reg42 <= (wire10 >>> wire11);
              reg43 <= $unsigned(reg7);
              reg44 <= (reg19 < (^~wire5[(3'h7):(3'h4)]));
            end
        end
      reg47 <= wire11;
      reg48 <= $unsigned({$signed((reg19 ? reg45[(3'h6):(3'h4)] : (^wire11)))});
    end
endmodule
