module top
#(parameter param21 = (^(((((8'hb0) * (8'hb1)) ? ((8'hb1) ? (8'hbe) : (8'ha5)) : (+(8'ha0))) ? (((7'h43) ? (8'hb6) : (8'hba)) >>> ((8'hbe) ^ (8'hac))) : {((8'ha2) ? (8'hb8) : (8'haa))}) << ((^~{(8'ha4)}) + (((7'h42) ~^ (8'hb5)) ? ((8'ha7) ? (7'h42) : (7'h43)) : {(8'hb1)})))), 
parameter param22 = param21)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire6,
                 wire5,
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
  assign wire5 = {wire0[(4'ha):(1'h0)]};
  assign wire6 = (wire3[(3'h4):(2'h2)] << (wire3 ?
                     (&wire4) : $unsigned((-wire4))));
  always
    @(posedge clk) begin
      reg7 <= (wire2 ?
          wire5[(3'h5):(3'h4)] : $signed($unsigned(($signed(wire3) ?
              {wire6} : $signed(wire6)))));
      reg8 <= $unsigned(wire5);
      reg9 <= (~^$unsigned(wire3[(2'h3):(2'h3)]));
      if ((^~reg8))
        begin
          reg10 <= $signed(($signed(($unsigned((7'h42)) ?
                  $unsigned((8'ha2)) : $unsigned(reg9))) ?
              wire4[(3'h7):(1'h0)] : $signed($signed((&wire4)))));
          reg11 <= (wire4[(2'h2):(1'h0)] ?
              ((~(8'haf)) < (+($unsigned(wire3) > wire6[(4'h9):(3'h4)]))) : wire2);
          reg12 <= ($unsigned(wire6) <<< $signed(reg7[(1'h0):(1'h0)]));
          reg13 <= reg8;
          reg14 <= reg8[(3'h6):(2'h2)];
        end
      else
        begin
          reg10 <= {(reg11[(2'h2):(1'h1)] ?
                  reg8[(4'hd):(4'h8)] : $unsigned({$signed(reg9),
                      $unsigned(reg7)}))};
          reg11 <= ((wire4[(5'h11):(3'h4)] < (^wire2[(3'h5):(3'h5)])) ?
              (reg11[(1'h0):(1'h0)] ~^ reg14[(1'h1):(1'h0)]) : (reg9 ?
                  (8'hbe) : reg9[(2'h3):(2'h2)]));
          if (({$signed(($unsigned(reg9) >= (reg11 ? wire0 : wire4))),
              (~&({wire6,
                  reg7} & ((8'hac) ~^ reg10)))} << ($signed(wire5[(1'h1):(1'h0)]) ?
              reg11 : $signed($unsigned({(8'hbf)})))))
            begin
              reg12 <= $signed((7'h42));
              reg13 <= reg9;
              reg14 <= (-($unsigned((reg11[(1'h0):(1'h0)] ?
                  (reg14 ? reg13 : reg13) : (wire1 ?
                      (8'hb1) : wire3))) ~^ $unsigned(($signed(reg11) ?
                  $signed(wire4) : $signed(wire6)))));
            end
          else
            begin
              reg12 <= $unsigned($signed($signed({$signed(wire5),
                  $unsigned(reg13)})));
              reg13 <= $unsigned({wire6[(3'h6):(2'h2)], (8'hab)});
            end
          if ($unsigned((reg13[(4'hd):(3'h4)] * $unsigned($unsigned(reg9[(2'h2):(1'h0)])))))
            begin
              reg15 <= reg7;
              reg16 <= $signed(reg11[(1'h1):(1'h0)]);
              reg17 <= {reg7[(2'h3):(2'h3)], reg15[(4'h8):(1'h1)]};
              reg18 <= ((+$unsigned(((wire5 || reg9) - reg15[(1'h0):(1'h0)]))) ?
                  {($signed((reg11 ?
                          reg12 : reg14)) * reg11[(1'h1):(1'h1)])} : {(8'hb4),
                      ({$signed(wire0), (~^reg7)} ?
                          $signed(reg12) : (^{wire3, reg14}))});
            end
          else
            begin
              reg15 <= $signed(reg16[(5'h13):(3'h6)]);
              reg16 <= $signed(reg14);
              reg17 <= wire4;
              reg18 <= ((~^reg8[(2'h2):(1'h1)]) ?
                  ({($signed(wire6) ~^ (reg14 != reg11))} ?
                      (reg17[(1'h1):(1'h1)] ?
                          wire4[(5'h10):(4'he)] : ($signed(wire4) ?
                              (^(8'h9c)) : $signed(wire6))) : $signed(wire1[(1'h0):(1'h0)])) : (+(reg13[(5'h11):(4'hf)] << reg18)));
            end
        end
      reg19 <= $unsigned(($signed({$unsigned(reg17),
          (reg11 ? reg14 : reg13)}) << (&wire3[(3'h5):(1'h1)])));
    end
  assign wire20 = (~^$unsigned((reg9 ?
                      $unsigned(((7'h40) ^~ wire0)) : $signed((~wire5)))));
endmodule
