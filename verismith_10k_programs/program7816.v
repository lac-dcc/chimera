module top
#(parameter param20 = (^~((+({(8'hbf), (8'hb8)} == ((7'h43) | (8'ha3)))) || (((&(7'h41)) + ((8'ha8) ? (8'hbd) : (8'hbd))) ? (((7'h40) <<< (7'h40)) - (~^(8'ha6))) : (-((8'ha7) ? (8'hb6) : (8'hbc)))))), 
parameter param21 = (param20 ? ({param20, ((param20 ? param20 : param20) ? (!param20) : (param20 <= param20))} ? ((8'ha8) ? (((8'haf) <<< param20) ~^ (8'hb2)) : ((param20 ? param20 : param20) <= ((8'ha5) ? (8'hab) : param20))) : (((^~param20) ? (param20 ? (8'h9d) : param20) : (-(8'hac))) >= {(param20 < param20)})) : (((^(~|param20)) ? ((param20 ~^ param20) ? param20 : (param20 & param20)) : ((|(8'hac)) ? (param20 ? param20 : param20) : (|(8'hb1)))) ? (param20 ? ((|param20) ? (param20 & param20) : (^~param20)) : param20) : (param20 ? ({param20, (8'hb6)} >= param20) : ({(8'ha6), param20} <= {param20, param20})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (~^$unsigned($unsigned($unsigned(wire3))));
  always
    @(posedge clk) begin
      reg5 <= (-(|$signed((wire0 ? $signed((8'hb1)) : $signed(wire4)))));
      reg6 <= (~|$signed({(!{wire0})}));
      if ($unsigned(wire4[(2'h2):(2'h2)]))
        begin
          reg7 <= reg6;
        end
      else
        begin
          if ((+($signed(({wire1, wire1} ?
              reg7 : (~^wire2))) << {$unsigned((reg6 ? wire3 : wire1))})))
            begin
              reg7 <= wire1[(3'h6):(1'h1)];
              reg8 <= wire2[(4'hf):(4'he)];
              reg9 <= (!((!({wire2} < (reg6 == reg6))) ?
                  {{(wire1 ? (8'hb8) : wire2)},
                      ($unsigned(reg8) ?
                          reg8[(3'h5):(1'h0)] : $unsigned(reg6))} : {(^~(^~(8'hb2))),
                      (reg7 & (|reg8))}));
            end
          else
            begin
              reg7 <= ($unsigned({$unsigned((8'hb6)),
                      $signed(wire2[(4'hc):(3'h4)])}) ?
                  (wire1[(2'h3):(2'h2)] != reg5) : ($unsigned(wire2) ^~ $unsigned(($signed(wire4) == $unsigned(reg8)))));
              reg8 <= wire2;
              reg9 <= $signed((~(($signed(reg8) <<< reg6[(4'hd):(4'h9)]) & ($unsigned(reg5) ?
                  wire2 : wire1[(2'h3):(2'h3)]))));
            end
          if ((+({reg8[(4'h8):(3'h5)],
              {reg8[(1'h0):(1'h0)], (wire2 ~^ reg8)}} > ({(wire2 ?
                      reg5 : (8'hbd)),
                  $unsigned(reg6)} ?
              $unsigned((wire4 | wire0)) : $unsigned(reg9[(3'h5):(2'h2)])))))
            begin
              reg10 <= (^~$signed((reg9[(1'h0):(1'h0)] >> wire2[(1'h1):(1'h1)])));
              reg11 <= ($signed(({reg8[(1'h1):(1'h0)], $unsigned(reg6)} ?
                      ($unsigned(wire4) ?
                          reg5[(4'hb):(3'h4)] : $signed(reg10)) : $unsigned(((8'hac) >>> wire2)))) ?
                  reg9[(2'h2):(1'h0)] : wire3[(3'h5):(1'h1)]);
              reg12 <= {reg11[(3'h4):(2'h3)]};
              reg13 <= ((reg10[(4'ha):(1'h1)] || {$signed((7'h41))}) << reg12[(3'h5):(2'h3)]);
              reg14 <= reg5[(3'h7):(2'h3)];
            end
          else
            begin
              reg10 <= (8'ha7);
              reg11 <= (wire2[(4'hd):(4'hb)] ?
                  ((reg6 <<< ($unsigned(reg9) & $unsigned(reg7))) << $signed($unsigned($signed((8'hb0))))) : $signed((({reg11} ?
                          (reg8 & (8'hbc)) : (reg13 && wire1)) ?
                      $signed($unsigned(wire0)) : (8'hbd))));
            end
          reg15 <= ((reg9 ?
                  {$unsigned($signed(reg5))} : (!((wire1 ? wire1 : (8'hbf)) ?
                      (reg12 == reg8) : reg5))) ?
              {reg9} : {$unsigned((!(reg12 <<< (8'hbf)))),
                  (($unsigned(reg9) ? (reg11 >= wire0) : wire1) ?
                      $unsigned($unsigned(wire0)) : $signed((^~wire2)))});
          if ($signed((~&reg6)))
            begin
              reg16 <= {reg10};
              reg17 <= (8'h9d);
            end
          else
            begin
              reg16 <= {(((~|reg10) - $unsigned($signed(reg11))) ?
                      wire0 : (((^reg7) ?
                              (reg11 ? reg17 : reg9) : (reg17 && reg5)) ?
                          wire1 : reg6[(4'hf):(4'hc)])),
                  reg15};
              reg17 <= reg17;
            end
        end
    end
  assign wire18 = (8'hb5);
  assign wire19 = reg13;
endmodule
