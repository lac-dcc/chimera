module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire6,
                 wire5,
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
                 reg7,
                 (1'h0)};
  assign wire5 = (~&wire2);
  assign wire6 = (wire5[(3'h5):(3'h5)] ?
                     (~^(wire2[(3'h7):(2'h3)] ?
                         (8'ha4) : $unsigned($unsigned(wire5)))) : $unsigned(($unsigned((|wire5)) ?
                         (^~$unsigned(wire1)) : (+wire1[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg7 <= ($unsigned($unsigned((wire0[(2'h3):(2'h3)] >= (^~wire1)))) ?
          (wire4[(3'h5):(2'h2)] ?
              $unsigned(($signed(wire4) & $unsigned((7'h43)))) : $unsigned($signed((wire6 ?
                  wire5 : wire0)))) : ($signed({(wire4 & wire0)}) ?
              (8'h9e) : ($signed(wire6) << (-wire3[(1'h0):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if (wire5[(1'h1):(1'h0)])
        begin
          reg8 <= {(wire2[(4'h9):(3'h5)] << (wire2 ?
                  $unsigned(wire1) : ((wire0 >= wire2) ?
                      $unsigned((8'ha6)) : (~&wire0)))),
              $signed(reg7)};
          if ((!$signed(wire2)))
            begin
              reg9 <= wire4;
              reg10 <= ($signed($signed(wire6)) >> ($signed(((wire6 ^ wire0) <= wire6[(5'h11):(4'ha)])) ?
                  ((reg8[(1'h1):(1'h0)] ^ ((8'ha6) << wire4)) ?
                      $signed($unsigned((7'h40))) : ((wire4 ~^ reg8) ?
                          (8'haa) : (wire1 ?
                              wire3 : reg9))) : $signed((~^(wire3 ?
                      (8'hb2) : reg7)))));
              reg11 <= (-(({((7'h43) ? wire5 : wire3)} ?
                      wire2 : ($signed((8'hbf)) >= {(8'hba), wire5})) ?
                  $signed((~^(8'ha6))) : ((-(-wire0)) << reg9)));
            end
          else
            begin
              reg9 <= {(reg10 * $signed((wire3[(3'h6):(2'h3)] != {reg11,
                      reg10}))),
                  wire2[(4'hb):(2'h3)]};
              reg10 <= wire6[(4'h8):(1'h0)];
              reg11 <= wire1[(3'h4):(1'h0)];
              reg12 <= $unsigned((!($signed($unsigned(wire0)) ?
                  {(~|wire2),
                      $unsigned(reg8)} : $signed(((8'ha4) << (8'haf))))));
            end
          reg13 <= reg9[(1'h1):(1'h1)];
          reg14 <= {$signed(wire2),
              $signed((wire1[(2'h3):(2'h2)] ?
                  ((~^wire5) > $signed(wire0)) : reg8[(2'h2):(1'h1)]))};
          if ($signed(($unsigned(($signed(wire1) ?
              (8'hb5) : (^wire2))) | (($unsigned((8'hb7)) ?
                  (^~reg12) : ((8'hb4) ? wire4 : (8'hae))) ?
              wire3 : $unsigned(((8'hb9) ? wire2 : reg13))))))
            begin
              reg15 <= ((((+wire1) <= wire6[(3'h6):(3'h5)]) ?
                  wire4[(4'ha):(4'h9)] : $signed(reg11)) ^~ (~&$unsigned(reg11)));
            end
          else
            begin
              reg15 <= $signed($unsigned(wire4));
              reg16 <= ((($unsigned(wire4) ?
                      reg11 : $signed({(8'hbc), wire3})) ?
                  ((reg8[(2'h3):(2'h3)] ^~ ((8'ha5) & reg8)) >>> reg7) : (8'hb6)) + $signed(((|reg7[(5'h12):(4'hc)]) ?
                  $unsigned(reg8[(2'h3):(2'h3)]) : reg9)));
              reg17 <= reg9;
              reg18 <= reg10;
              reg19 <= $signed((reg10 ?
                  (~({wire0, wire2} ?
                      (reg9 << reg14) : $signed(reg18))) : $signed(reg9)));
            end
        end
      else
        begin
          reg8 <= (|((~^reg10) >> reg9[(1'h1):(1'h1)]));
          reg9 <= wire5;
        end
      reg20 <= $signed(reg19);
      if (reg16[(3'h7):(3'h5)])
        begin
          reg21 <= $signed(reg18[(2'h3):(2'h3)]);
          reg22 <= reg8;
          reg23 <= (!(~{$unsigned($signed((8'ha9)))}));
        end
      else
        begin
          reg21 <= ($unsigned(($signed(((8'h9c) + reg9)) ~^ $unsigned($signed((8'h9d))))) >= reg16);
          reg22 <= reg10[(2'h2):(2'h2)];
        end
      reg24 <= (reg8[(2'h2):(1'h0)] ?
          (~|reg12[(4'h8):(3'h5)]) : reg12[(3'h5):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg25 <= reg21[(3'h4):(3'h4)];
      reg26 <= ({$signed($unsigned({(7'h41), wire6}))} ?
          reg20[(3'h4):(1'h1)] : reg19[(2'h2):(1'h1)]);
      reg27 <= wire3[(2'h2):(2'h2)];
      reg28 <= $signed(wire6);
    end
  assign wire29 = reg19;
  assign wire30 = (8'ha2);
endmodule
