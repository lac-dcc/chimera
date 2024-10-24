module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire4,
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
                 reg17,
                 reg16,
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
      reg5 <= (((($unsigned(wire4) ?
          (wire0 ?
              wire2 : wire0) : $unsigned(wire2)) + wire3[(2'h3):(1'h1)]) >> wire4) >> $signed(({wire3[(4'hd):(1'h1)]} ?
          $unsigned(wire3[(3'h6):(2'h2)]) : $unsigned({wire1}))));
      if ((-(&wire4[(3'h6):(2'h2)])))
        begin
          reg6 <= (^$signed(wire3[(3'h6):(3'h5)]));
        end
      else
        begin
          reg6 <= reg5;
          reg7 <= $unsigned((^reg6));
          reg8 <= (((($unsigned(wire2) <<< (-wire0)) != wire3[(4'h9):(3'h4)]) ^ $unsigned($signed(wire3))) ?
              $signed($unsigned({$signed(wire4)})) : (&((+((8'h9c) && wire2)) ?
                  (wire1 ? wire4 : $unsigned(reg6)) : wire3[(1'h1):(1'h1)])));
          reg9 <= (&($signed(reg6) ?
              reg6 : $signed({$signed(wire2), $unsigned((7'h41))})));
          reg10 <= (^~((~^$unsigned((reg5 > reg7))) | wire4));
        end
    end
  assign wire11 = wire2;
  assign wire12 = ((^((wire2[(3'h5):(1'h0)] ?
                      reg5 : (reg5 ^ wire2)) >>> $unsigned($unsigned(wire11)))) & (wire4 - (($signed(reg5) ?
                          ((8'hb6) << reg5) : $unsigned(reg9)) ?
                      $signed(((8'hb1) ?
                          (8'ha5) : reg7)) : (reg8[(5'h10):(4'hb)] == wire0))));
  assign wire13 = $unsigned((reg7[(4'h9):(4'h9)] ?
                      wire12 : (+wire3[(3'h6):(3'h6)])));
  assign wire14 = wire4[(2'h3):(1'h0)];
  assign wire15 = wire0[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= $signed($signed((|((~reg9) & (-wire0)))));
      if (({{reg16}} ?
          reg7 : (wire4[(1'h1):(1'h1)] ?
              $unsigned({$signed(reg6)}) : $unsigned((wire2[(4'hc):(4'hc)] ?
                  $signed((7'h42)) : wire13)))))
        begin
          reg17 <= reg8[(2'h2):(1'h1)];
          reg18 <= $signed(wire13[(3'h4):(1'h0)]);
          reg19 <= (8'hae);
        end
      else
        begin
          reg17 <= $signed(($unsigned(reg17) ?
              $signed($signed((~|wire3))) : ($unsigned($unsigned((8'hbf))) ?
                  $unsigned($unsigned(reg17)) : reg17[(2'h2):(1'h0)])));
          reg18 <= $unsigned({wire15, reg18});
          if ($unsigned(reg7))
            begin
              reg19 <= {reg19};
            end
          else
            begin
              reg19 <= (^~reg6);
              reg20 <= (reg8 ?
                  $signed(($unsigned($signed(wire11)) ?
                      $signed($signed(reg7)) : wire4[(3'h6):(2'h2)])) : {reg7[(3'h4):(1'h0)]});
              reg21 <= reg8[(3'h6):(3'h6)];
              reg22 <= (((!(!((8'h9f) ? reg5 : reg10))) ?
                      (reg19 ?
                          reg7[(3'h7):(3'h4)] : wire15[(3'h6):(3'h5)]) : reg6) ?
                  (+(!$unsigned(wire15))) : $signed(wire3));
            end
          reg23 <= (8'hb3);
        end
      reg24 <= $unsigned((^~(wire3[(4'hc):(1'h1)] - {(reg7 ?
              wire12 : wire0)})));
      reg25 <= {$unsigned($unsigned((-$unsigned((8'hb8))))),
          ((~|wire0) > reg18)};
      reg26 <= reg5[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg27 <= (8'hba);
      reg28 <= reg9[(1'h0):(1'h0)];
      reg29 <= (8'hb1);
      reg30 <= (reg27[(1'h1):(1'h1)] ~^ wire3[(2'h3):(1'h0)]);
      if (((&$unsigned(reg18[(2'h3):(1'h0)])) & ($unsigned(({wire14, (8'ha5)} ?
              $unsigned(reg19) : $signed(reg16))) ?
          $unsigned((8'had)) : (((wire3 ?
              (8'haf) : reg22) >>> $unsigned(wire12)) >>> (reg23 >= (~reg20))))))
        begin
          reg31 <= (|reg29[(2'h2):(1'h0)]);
        end
      else
        begin
          reg31 <= (|reg18[(3'h5):(3'h4)]);
        end
    end
  assign wire32 = $unsigned((~(reg17[(2'h3):(1'h0)] ?
                      reg10[(2'h2):(1'h0)] : $unsigned(reg21))));
endmodule
