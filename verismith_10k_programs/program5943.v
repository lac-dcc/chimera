module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg6 <= wire5;
          reg7 <= (8'ha3);
          if ($unsigned(((+$unsigned(wire0[(1'h0):(1'h0)])) << wire5)))
            begin
              reg8 <= ((!reg7) == reg6);
              reg9 <= (({$signed($unsigned(wire4))} < wire5[(2'h3):(1'h0)]) ?
                  $unsigned((((^~wire2) ?
                      (wire2 >>> wire0) : wire2[(2'h2):(2'h2)]) && $unsigned({reg7}))) : $unsigned((-($unsigned(wire1) ?
                      $unsigned((8'hb3)) : $unsigned(wire4)))));
              reg10 <= ($signed($unsigned((wire0[(2'h3):(1'h0)] & wire1))) ?
                  ($signed($signed((wire5 <<< reg6))) - (wire2[(3'h4):(1'h1)] * ($unsigned(reg7) && reg6))) : wire4);
            end
          else
            begin
              reg8 <= $unsigned(wire3[(1'h1):(1'h0)]);
              reg9 <= wire3;
              reg10 <= $unsigned(reg8[(3'h4):(3'h4)]);
              reg11 <= (^~(|wire4[(1'h1):(1'h0)]));
            end
          reg12 <= ((reg6[(3'h7):(2'h3)] <<< ((8'hb0) ?
                  $unsigned((8'ha7)) : (|{reg10}))) ?
              $signed({$unsigned($signed((7'h42)))}) : reg7[(1'h0):(1'h0)]);
        end
      else
        begin
          reg6 <= reg8;
          reg7 <= (^(({reg8[(3'h4):(1'h0)]} - (~((8'hbb) ^~ wire0))) != (~$unsigned($unsigned(reg12)))));
          reg8 <= (^~(!wire3));
          reg9 <= reg11[(2'h3):(2'h3)];
          reg10 <= (reg12[(4'ha):(1'h1)] <= $unsigned({(wire5 ?
                  {wire2} : (reg7 || (8'hb0)))}));
        end
      reg13 <= reg6;
      if (wire4)
        begin
          if ($unsigned($unsigned($signed({(8'hb1)}))))
            begin
              reg14 <= (~|reg10);
              reg15 <= ($signed(wire2[(3'h7):(1'h1)]) + reg7[(5'h12):(3'h4)]);
              reg16 <= $unsigned(reg7[(4'he):(3'h5)]);
            end
          else
            begin
              reg14 <= reg12;
              reg15 <= ({(-(8'hbc))} ?
                  reg8[(4'h8):(4'h8)] : $unsigned(({wire1,
                      $signed(reg15)} == ((wire5 < (8'hb8)) ?
                      reg13 : (reg13 ? wire5 : reg8)))));
            end
          reg17 <= reg16;
          reg18 <= ({$signed(((reg16 >= (8'ha1)) ^ wire3)),
                  {(7'h44), (!$unsigned((7'h42)))}} ?
              (({(reg17 ? (8'h9e) : (8'ha9)),
                  $unsigned(wire0)} > ((reg17 && reg14) || $unsigned(reg9))) ^~ wire4) : (wire4[(2'h2):(2'h2)] < wire4[(3'h4):(1'h1)]));
        end
      else
        begin
          reg14 <= $unsigned(reg18[(4'h9):(3'h6)]);
        end
      reg19 <= $signed($signed({(-(~^reg10)),
          ((reg15 ? reg18 : reg8) ? $signed(wire0) : $unsigned(wire0))}));
      reg20 <= $unsigned(((~^($unsigned(reg14) < (reg6 ?
          wire0 : reg13))) != ($signed(reg15) ?
          ((wire1 == (8'ha2)) * wire5[(4'hb):(1'h1)]) : reg9[(1'h1):(1'h0)])));
    end
  assign wire21 = {reg12, reg13};
  assign wire22 = $signed($unsigned(wire1[(1'h0):(1'h0)]));
  assign wire23 = ((reg13[(3'h6):(2'h2)] ?
                      $signed((8'ha4)) : (^~(reg20 ?
                          (~^reg15) : wire1))) ^ reg14[(3'h7):(2'h2)]);
  assign wire24 = ($unsigned($signed($unsigned(reg11))) ?
                      $unsigned(reg13[(4'hc):(3'h5)]) : ((~{reg8}) ?
                          $unsigned(((reg16 <= wire2) & $unsigned(wire3))) : (((^reg9) ?
                              reg10[(4'h8):(3'h6)] : $signed((8'haf))) >> ((^~reg14) != (wire4 ?
                              reg10 : reg6)))));
  assign wire25 = (|wire24);
  assign wire26 = $signed((~|$unsigned(wire5)));
  assign wire27 = $unsigned({$signed({reg15[(3'h5):(3'h5)]})});
endmodule
