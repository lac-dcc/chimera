module top
#(parameter param27 = (&(7'h44)), 
parameter param28 = (~^param27))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire15,
                 wire6,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (+wire0[(3'h6):(1'h1)]);
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= $signed(wire6);
      if ($unsigned({(reg7[(1'h1):(1'h0)] ?
              ((&reg7) ? (wire2 ? wire6 : wire0) : $unsigned(wire0)) : {(reg7 ?
                      wire4 : wire3)})}))
        begin
          if ((8'hb4))
            begin
              reg8 <= ({(wire6 >>> ({wire2} ? $signed(wire2) : (~^wire6)))} ?
                  wire6[(4'hd):(3'h5)] : $unsigned((wire4 <<< (reg7[(2'h2):(2'h2)] >= $signed(wire6)))));
              reg9 <= (-(-(($signed((8'haa)) ?
                  (~wire3) : $unsigned((8'hbc))) && (reg7[(2'h3):(2'h2)] ^ reg8[(4'h8):(1'h1)]))));
              reg10 <= (wire0 - (($unsigned((+wire0)) ?
                      {((8'hb9) < wire0), (wire4 + (8'h9e))} : wire6) ?
                  reg7 : (^((wire5 ? wire6 : (8'hac)) * {wire6, reg7}))));
              reg11 <= ($unsigned($unsigned((^~wire2))) ^~ $signed((({reg10} ?
                      wire4 : $signed(reg8)) ?
                  (wire1 | wire2[(4'hf):(4'hf)]) : (8'ha9))));
            end
          else
            begin
              reg8 <= wire0[(3'h6):(2'h2)];
              reg9 <= reg11;
              reg10 <= (reg9 ?
                  $signed(wire3[(1'h0):(1'h0)]) : $unsigned((reg11[(5'h11):(4'hd)] ?
                      ({wire3, wire3} ?
                          $signed(wire3) : (reg10 ?
                              reg8 : (8'ha5))) : $signed((wire5 | wire6)))));
            end
          reg12 <= $signed(reg11);
        end
      else
        begin
          reg8 <= $signed(wire2[(4'he):(2'h2)]);
          reg9 <= (reg10 ?
              (^~reg10) : $unsigned(($signed($signed((8'hac))) ?
                  ((8'hae) | (wire2 >>> reg10)) : wire2[(4'h9):(3'h4)])));
        end
      reg13 <= ($unsigned($signed((8'hae))) <<< reg8[(4'h8):(3'h7)]);
      reg14 <= $unsigned(reg11);
    end
  assign wire15 = $unsigned((8'hb8));
  always
    @(posedge clk) begin
      reg16 <= (~&(reg9 ?
          ((|(wire3 >> reg12)) ?
              reg11[(4'h8):(1'h0)] : ((8'h9e) + (8'hb0))) : {($unsigned(reg8) >= $unsigned(reg14)),
              {(reg10 > reg14), ((8'hb8) ^ (8'hb2))}}));
      if ((~&(8'hb8)))
        begin
          if (reg7[(2'h2):(1'h1)])
            begin
              reg17 <= $signed(({reg11[(5'h13):(1'h1)]} <= (+wire0[(2'h3):(2'h3)])));
              reg18 <= (~reg8[(4'h8):(3'h7)]);
            end
          else
            begin
              reg17 <= $unsigned({(&((wire15 && reg13) == (reg18 == wire5)))});
              reg18 <= reg17;
              reg19 <= (reg9[(3'h5):(1'h1)] ?
                  reg18[(1'h1):(1'h1)] : $unsigned($signed(($unsigned((8'hbf)) >= $signed(wire4)))));
            end
          if ((!((($unsigned((8'hb4)) ? {reg8, (8'ha7)} : $signed(wire0)) ?
                  {$signed(reg14)} : $unsigned($signed(wire5))) ?
              (~reg16[(1'h0):(1'h0)]) : $unsigned((((8'hb5) != wire5) | reg18[(4'ha):(1'h0)])))))
            begin
              reg20 <= (~|wire4[(1'h0):(1'h0)]);
            end
          else
            begin
              reg20 <= wire0;
              reg21 <= (+((($unsigned(reg18) ?
                      wire2[(5'h11):(4'hf)] : (wire0 ? reg19 : reg14)) ?
                  {{wire4},
                      $unsigned((8'hb2))} : (((8'haa) >>> wire0) + reg19[(4'h9):(1'h1)])) > ($unsigned($signed(reg14)) ?
                  ({reg12} ? (wire15 ~^ reg19) : $signed(wire1)) : ((reg7 ?
                          (8'had) : wire15) ?
                      (+wire15) : wire6))));
            end
          reg22 <= $unsigned((wire6[(4'hd):(4'h9)] ?
              $unsigned((^~$signed((8'hb6)))) : ($signed((-(8'hb2))) ^~ $signed({reg19,
                  wire15}))));
          reg23 <= ((reg12[(1'h1):(1'h0)] ^ (8'hb7)) + ({($signed(reg10) ?
                      $unsigned(wire1) : reg18)} ?
              $signed(($unsigned(reg14) ?
                  wire4 : (wire5 ? reg19 : wire0))) : (|wire2)));
          reg24 <= (reg19[(3'h4):(1'h1)] ?
              (~|reg16[(4'h9):(3'h5)]) : (^(reg21[(1'h1):(1'h1)] >> (~|{reg20,
                  reg13}))));
        end
      else
        begin
          reg17 <= $unsigned((wire15[(3'h7):(3'h5)] ?
              wire3[(1'h0):(1'h0)] : wire3[(2'h2):(1'h0)]));
          reg18 <= (^reg8[(2'h2):(1'h1)]);
          reg19 <= $unsigned(reg13);
        end
      reg25 <= ((wire4 ?
              ($unsigned(reg14) & $unsigned($unsigned((8'ha4)))) : ({$signed(reg24),
                      ((8'ha7) ? wire0 : wire2)} ?
                  ({wire2, (8'ha0)} ?
                      (wire2 ? reg17 : wire5) : (wire4 ?
                          reg12 : reg11)) : (-(reg22 ? reg23 : wire6)))) ?
          wire4[(1'h0):(1'h0)] : ($unsigned(wire4) ^~ reg20));
      reg26 <= (&$signed((((&reg12) ?
          (&wire2) : $signed(reg14)) << ($unsigned((8'hab)) <= $signed(reg8)))));
    end
endmodule
