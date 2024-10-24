module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire12,
                 wire11,
                 wire4,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed((~&{$signed((wire1 ? wire1 : wire3)), (|wire1)}));
  always
    @(posedge clk) begin
      reg5 <= {$unsigned(wire1[(3'h5):(1'h1)])};
      reg6 <= $signed(reg5);
      reg7 <= (|reg6);
      reg8 <= ($unsigned($unsigned(wire4)) ?
          ($unsigned(wire3) == {(^wire3)}) : {(~&(^~(wire0 <= wire2)))});
    end
  always
    @(posedge clk) begin
      reg9 <= ({(7'h43)} ? reg7 : $unsigned((|$signed($signed(reg7)))));
      reg10 <= reg7;
    end
  assign wire11 = wire1;
  assign wire12 = wire1;
  always
    @(posedge clk) begin
      if ($unsigned((~^$unsigned((^$unsigned(reg9))))))
        begin
          if ((reg6[(3'h4):(2'h2)] ^ (~&(~^$unsigned((wire4 < (8'hbf)))))))
            begin
              reg13 <= (8'hb1);
              reg14 <= wire2;
            end
          else
            begin
              reg13 <= $unsigned(((reg13[(4'h9):(4'h8)] ?
                      $signed(reg6) : $unsigned(((8'hbe) < reg9))) ?
                  (^($signed(wire11) == reg5)) : reg6[(2'h2):(2'h2)]));
              reg14 <= (~^reg13[(3'h5):(2'h2)]);
              reg15 <= $unsigned((wire0 ?
                  ($unsigned({wire11}) ~^ (reg14[(3'h7):(3'h4)] | (wire4 ?
                      reg5 : wire4))) : (((wire1 + wire11) - $unsigned(wire2)) ^~ (8'ha7))));
              reg16 <= ($signed((((8'hbc) ?
                          (wire3 ? wire2 : wire3) : (reg13 <<< (7'h44))) ?
                      wire3[(2'h3):(1'h1)] : wire12)) ?
                  reg7 : (((+wire0[(3'h7):(3'h6)]) + {(~wire0)}) ?
                      (~|$unsigned((~&reg8))) : $unsigned(reg5)));
              reg17 <= (+(+(({wire12,
                  reg10} ^~ wire0[(2'h3):(1'h0)]) - reg16)));
            end
          reg18 <= ({($signed((^reg15)) ? $signed((~reg10)) : (8'h9c)),
              $unsigned($unsigned((reg10 ?
                  reg8 : reg10)))} == reg7[(3'h4):(2'h3)]);
        end
      else
        begin
          reg13 <= ($signed((+((8'hb3) - (reg14 ? reg18 : reg5)))) ?
              (8'ha1) : ((~^((^~wire4) <= $unsigned(wire0))) ?
                  ($unsigned(reg5[(1'h1):(1'h1)]) ?
                      (8'hb5) : $signed(reg10[(4'h9):(1'h1)])) : wire1[(3'h4):(1'h0)]));
          reg14 <= wire0;
          if ($unsigned((reg15[(3'h4):(3'h4)] ?
              (^~(wire11[(2'h3):(2'h3)] + wire12)) : (($signed(wire4) || $unsigned((8'had))) ^~ reg6))))
            begin
              reg15 <= (|{$unsigned(reg7),
                  ($signed((reg13 >> (8'hb0))) <= (^~reg7[(4'h8):(3'h5)]))});
            end
          else
            begin
              reg15 <= $signed(($signed(reg10[(5'h10):(1'h1)]) ?
                  (wire3[(1'h0):(1'h0)] ?
                      ((^~reg15) ? reg7 : (reg9 - reg9)) : ((reg5 ?
                              reg13 : reg5) ?
                          wire3[(1'h0):(1'h0)] : reg9)) : ($unsigned($signed(wire3)) * $signed(reg17[(3'h7):(3'h7)]))));
              reg16 <= $unsigned(($unsigned(reg16) + (((wire2 ?
                      wire0 : wire11) | (wire3 * reg8)) ?
                  (~^(reg14 ?
                      reg15 : reg17)) : ($unsigned(reg16) * $signed((8'ha3))))));
              reg17 <= wire3;
              reg18 <= reg13[(4'h8):(3'h5)];
              reg19 <= $unsigned((8'ha2));
            end
          reg20 <= wire4;
        end
    end
  assign wire21 = (wire3[(2'h2):(2'h2)] ?
                      (~|(reg9 * ((reg6 == wire12) ?
                          reg5[(4'ha):(4'h8)] : reg20))) : {((wire11 != ((8'hbf) ?
                                  wire3 : reg15)) ?
                              {(~&reg13),
                                  wire11[(3'h7):(1'h0)]} : $unsigned({wire0})),
                          ((+{reg18, reg10}) ?
                              $unsigned($unsigned(reg6)) : reg10[(5'h13):(4'he)])});
  assign wire22 = (^~(~|($signed($signed(wire3)) == ((reg15 && (8'hb8)) - reg8[(4'h8):(1'h1)]))));
  assign wire23 = reg15;
  assign wire24 = wire2[(3'h4):(1'h1)];
  assign wire25 = $unsigned(reg10[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg26 <= (((((reg13 ? wire23 : wire25) ?
              ((8'haf) <= reg10) : $signed(wire21)) + $signed((wire12 && reg17))) ?
          (8'hbd) : (reg10[(5'h10):(4'h8)] <<< wire22[(4'hc):(4'h9)])) + $unsigned(((+(-reg20)) <<< (wire1 ~^ $signed(wire23)))));
      reg27 <= (-$unsigned(((reg17[(3'h4):(2'h2)] == (|(8'ha9))) ?
          (((8'hba) ^~ (8'hbb)) != (reg5 ^ reg13)) : {(reg15 ? reg26 : wire22),
              (!reg13)})));
      reg28 <= (+(~&{$signed(reg14)}));
      reg29 <= wire24[(1'h0):(1'h0)];
    end
  assign wire30 = (~^{($unsigned((~^reg15)) ? (reg16 ^ (&wire0)) : reg6),
                      {reg20[(2'h2):(1'h1)], (^~{reg13, reg15})}});
endmodule
