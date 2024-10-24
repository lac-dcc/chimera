module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((({{wire3}, ((8'hab) && (7'h40))} != wire2[(3'h7):(1'h1)]) ?
          (wire0 ? {(~wire2), (wire1 ? wire2 : wire0)} : wire3) : (wire3 ?
              (wire3 ^~ (wire2 ? wire1 : wire2)) : (wire1 ?
                  $signed(wire1) : $unsigned(wire2))))))
        begin
          if ((wire3 ~^ (~({(wire0 ? wire0 : wire1),
              $unsigned(wire0)} >> $unsigned($unsigned(wire1))))))
            begin
              reg4 <= ((+{wire0}) >>> {(wire2[(4'ha):(2'h2)] < {(wire1 + wire3),
                      $unsigned(wire1)})});
              reg5 <= wire3[(3'h4):(3'h4)];
              reg6 <= (~^((reg5[(1'h1):(1'h1)] && {(8'ha6),
                  $unsigned(wire2)}) > ($unsigned(reg4[(3'h4):(1'h0)]) ?
                  $signed(wire2) : reg4[(1'h0):(1'h0)])));
              reg7 <= wire3[(4'h9):(1'h0)];
            end
          else
            begin
              reg4 <= (wire1 ~^ wire0[(4'ha):(3'h6)]);
            end
          reg8 <= (($unsigned($signed((~|wire0))) ?
                  wire3 : $signed((!(^(7'h42))))) ?
              wire3 : {(reg4[(3'h4):(2'h2)] ?
                      wire1[(3'h4):(1'h0)] : $unsigned(wire0[(4'h8):(3'h6)])),
                  (wire1 ?
                      wire1[(3'h7):(3'h7)] : (!(wire3 ? (8'hbc) : reg6)))});
          reg9 <= ({(reg5[(4'ha):(3'h5)] < reg5[(1'h1):(1'h1)]),
              (8'hbb)} | (^~$unsigned($signed({wire0}))));
        end
      else
        begin
          reg4 <= reg5;
          reg5 <= $unsigned({$unsigned(reg7)});
          if ($unsigned($signed(wire3[(3'h7):(1'h0)])))
            begin
              reg6 <= (!($unsigned((8'hbf)) & (^($signed(wire0) + {wire1,
                  reg7}))));
              reg7 <= $unsigned(($unsigned($signed(wire3[(3'h5):(2'h3)])) + $signed(reg7[(1'h1):(1'h1)])));
              reg8 <= ((reg5[(4'h8):(3'h4)] == $signed({$signed(wire1),
                  (|wire1)})) - $signed($signed({$signed((8'hb7)), (&reg5)})));
              reg9 <= (wire1[(4'h9):(4'h9)] ?
                  ({$signed((~^reg5)), wire2[(3'h7):(3'h6)]} ?
                      $signed({(&reg4),
                          {wire3,
                              reg8}}) : wire1[(2'h2):(1'h1)]) : (^~((~(&reg4)) ?
                      (^reg5) : reg9)));
              reg10 <= reg9[(4'hc):(3'h6)];
            end
          else
            begin
              reg6 <= (|$unsigned($unsigned($signed(reg4[(1'h1):(1'h1)]))));
              reg7 <= (reg6 ? reg5 : reg6[(2'h3):(1'h1)]);
              reg8 <= (&(&wire3));
              reg9 <= reg4;
              reg10 <= ($signed($unsigned((reg10[(1'h1):(1'h1)] <= (wire3 ?
                      wire0 : reg9)))) ?
                  reg4 : (~|$signed(reg8[(1'h1):(1'h0)])));
            end
        end
      reg11 <= ((wire1[(1'h1):(1'h1)] + $unsigned((~|(!(7'h41))))) >= (((reg4[(2'h2):(1'h0)] | (reg5 ?
              reg8 : reg10)) ?
          (wire1 ?
              ((8'ha9) ?
                  (8'haf) : wire3) : reg4[(3'h4):(2'h2)]) : reg4[(1'h0):(1'h0)]) * (reg9[(2'h2):(2'h2)] == reg9)));
      if (wire1[(1'h1):(1'h1)])
        begin
          if ($unsigned({reg8}))
            begin
              reg12 <= {($unsigned(wire1[(3'h6):(3'h6)]) ?
                      wire1 : $unsigned(((~wire2) < (~wire2))))};
              reg13 <= (reg5[(4'hb):(3'h4)] ?
                  wire1[(2'h3):(2'h2)] : $unsigned(reg8));
            end
          else
            begin
              reg12 <= ($signed((8'hba)) && {$signed({(reg10 ? reg12 : reg13),
                      reg4[(2'h2):(2'h2)]})});
              reg13 <= (reg7[(2'h3):(1'h1)] ?
                  $unsigned((+reg6[(4'ha):(1'h1)])) : reg4[(2'h2):(1'h0)]);
              reg14 <= ((reg6 ?
                  reg7 : $unsigned((~(reg13 ?
                      wire0 : (7'h43))))) <<< $signed(wire0));
              reg15 <= (~&reg9[(5'h13):(4'hb)]);
              reg16 <= (&$signed($signed($unsigned($unsigned(reg7)))));
            end
          reg17 <= (reg12 ? reg13 : {wire0[(4'he):(3'h6)]});
          reg18 <= ($unsigned($unsigned({$signed(reg15)})) <<< $unsigned({($unsigned(reg7) ?
                  $signed(reg13) : reg9[(2'h2):(1'h0)]),
              $signed({(7'h43)})}));
        end
      else
        begin
          reg12 <= $unsigned(wire1[(4'h8):(1'h0)]);
          if ((~(^{(wire1 ? $signed(wire3) : reg7)})))
            begin
              reg13 <= $signed({(reg4[(3'h4):(1'h0)] & $signed((reg15 || reg6)))});
              reg14 <= reg16;
            end
          else
            begin
              reg13 <= ($unsigned($signed({(reg6 ? (8'ha3) : reg7),
                      (~reg11)})) ?
                  $unsigned((~&$unsigned($unsigned((7'h41))))) : ((reg6 >= (^(reg13 ^ wire1))) ?
                      (+{reg18, (reg9 ? reg6 : (8'h9f))}) : (({reg14} ?
                          $unsigned(wire0) : (reg9 ?
                              wire3 : reg12)) <= wire3)));
              reg14 <= ((~^reg6) >> $unsigned($unsigned($signed(reg11))));
            end
          reg15 <= (+(($unsigned({(8'hb0)}) ?
              reg17 : ({reg14} ? (^reg4) : wire1[(2'h2):(1'h0)])) && reg10));
        end
      reg19 <= wire3[(2'h3):(2'h2)];
      reg20 <= $signed(($unsigned($signed((reg16 <= (8'haf)))) ?
          (!($signed(reg12) << wire1[(1'h1):(1'h1)])) : ((~&reg16[(2'h3):(2'h2)]) >> $unsigned($unsigned(reg6)))));
    end
  assign wire21 = $unsigned(wire3[(3'h5):(2'h3)]);
  assign wire22 = ($signed((reg18[(1'h0):(1'h0)] ?
                      ({wire21} && $unsigned(reg12)) : (((8'hb4) ?
                          reg10 : reg18) + reg20[(1'h1):(1'h0)]))) <<< $signed($signed($unsigned((reg7 ?
                      reg16 : reg17)))));
  assign wire23 = ((^~$unsigned(wire22[(2'h3):(2'h3)])) - (8'hbe));
endmodule
