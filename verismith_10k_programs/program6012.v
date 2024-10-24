module top
#(parameter param26 = (((-((^~(8'hb5)) ? ((8'hb0) ? (8'hb7) : (8'ha6)) : (!(8'hbc)))) ? ((((8'hbf) <= (8'ha6)) ? ((8'haf) ~^ (8'ha0)) : (|(8'ha0))) ? (7'h41) : (((8'hbb) ? (8'ha2) : (8'hb3)) <= ((8'hb3) == (8'ha9)))) : ((&((8'hbc) * (8'ha3))) ? ({(8'hb4)} ? (+(8'had)) : ((8'ha7) && (8'h9d))) : (((8'ha3) ? (8'ha5) : (8'ha7)) >> (~(8'hb4))))) ^~ (^~{(((8'ha1) == (8'hba)) << (!(8'hb8)))})), 
parameter param27 = param26)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
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
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire1 ?
          $unsigned((^($signed(wire2) ?
              wire1[(3'h6):(1'h0)] : (wire2 | wire1)))) : (~(~(wire0[(3'h6):(1'h0)] != wire2))));
      reg5 <= wire1;
      reg6 <= $unsigned(reg4);
      reg7 <= reg5;
    end
  assign wire8 = reg5[(4'hf):(2'h3)];
  assign wire9 = wire3[(2'h3):(2'h2)];
  assign wire10 = (|reg5);
  assign wire11 = $unsigned((wire2 ? wire8 : (|(~|(|(8'haa))))));
  always
    @(posedge clk) begin
      reg12 <= (7'h40);
      if (($unsigned((|($unsigned(wire11) ? $unsigned(wire11) : wire10))) ?
          wire3[(1'h0):(1'h0)] : wire0))
        begin
          if ($unsigned($signed($unsigned(wire11))))
            begin
              reg13 <= (8'hbd);
              reg14 <= (^~($unsigned(wire3[(1'h0):(1'h0)]) ?
                  (reg4 ?
                      $signed($signed(wire8)) : reg6[(4'hd):(2'h3)]) : {reg13,
                      ((wire8 ? wire1 : reg5) ? (|wire8) : (wire2 << reg6))}));
              reg15 <= (^$signed((reg13[(4'he):(3'h6)] ^ (wire11[(3'h5):(3'h4)] ?
                  (reg13 ~^ (8'h9f)) : (8'hb4)))));
            end
          else
            begin
              reg13 <= $unsigned(((|$unsigned($unsigned(wire1))) != ({(^wire1),
                      {reg6}} ?
                  (~$unsigned(reg6)) : reg15[(1'h0):(1'h0)])));
              reg14 <= {$signed($unsigned($unsigned(wire2[(2'h2):(1'h1)]))),
                  wire3};
              reg15 <= (~^($signed(((reg7 ? wire1 : (8'hac)) ? wire0 : reg6)) ?
                  (((reg14 ~^ reg7) ? (|wire0) : (wire0 ? wire9 : wire8)) ?
                      (^~wire8[(2'h2):(2'h2)]) : $signed((reg15 ?
                          wire2 : wire11))) : (8'hb7)));
              reg16 <= (8'ha8);
              reg17 <= reg15;
            end
          reg18 <= wire9[(1'h0):(1'h0)];
          reg19 <= {$unsigned(wire11[(3'h5):(1'h0)])};
        end
      else
        begin
          if ((^$unsigned($signed((wire9 ? $unsigned(wire8) : (8'ha5))))))
            begin
              reg13 <= (^~{wire10,
                  $signed(((reg5 ? reg7 : wire9) ?
                      $unsigned(wire9) : {reg7}))});
              reg14 <= ((reg13[(4'he):(2'h3)] == wire1[(1'h1):(1'h1)]) ?
                  $signed($signed((reg13[(4'hd):(4'ha)] ?
                      (^reg19) : (wire1 ?
                          wire0 : wire8)))) : ((($unsigned(wire8) ?
                              (~^reg6) : (!(8'ha2))) ?
                          (reg19[(2'h2):(2'h2)] ?
                              reg12 : reg7[(1'h0):(1'h0)]) : (~{wire0})) ?
                      (reg13[(3'h4):(1'h0)] >> reg6) : ((wire11 ?
                          (reg4 <= (8'ha1)) : (|reg19)) ~^ (&(wire2 ?
                          wire11 : reg15)))));
              reg15 <= ($signed(reg6) ~^ $signed($unsigned($unsigned(((8'h9f) ?
                  reg18 : reg16)))));
              reg16 <= wire0;
            end
          else
            begin
              reg13 <= ((+($unsigned((^(8'hbb))) - ({reg18} ?
                  (reg13 < reg17) : $unsigned(wire2)))) && (&{$unsigned($signed(wire0)),
                  ($unsigned(reg6) ?
                      wire0[(4'h8):(3'h7)] : (reg18 == wire11))}));
              reg14 <= (-((~|(7'h41)) >>> (|((-(8'h9d)) > reg16))));
              reg15 <= (reg17 <<< ($signed((^$unsigned(wire0))) <= (((+wire1) && $signed((8'ha2))) ?
                  (reg16[(5'h12):(3'h4)] <<< (+reg7)) : ((8'hbc) ?
                      {reg5, reg17} : reg18[(2'h2):(1'h0)]))));
            end
          if (((8'haf) ? reg6[(1'h1):(1'h0)] : (8'h9e)))
            begin
              reg17 <= $unsigned({(wire11 ? {reg12[(4'h9):(1'h0)]} : (8'haa)),
                  $unsigned((8'ha6))});
              reg18 <= (&(^{reg13[(1'h1):(1'h0)]}));
              reg19 <= reg5;
              reg20 <= $unsigned(wire3);
            end
          else
            begin
              reg17 <= ({($unsigned($signed(reg20)) ?
                      (reg20[(3'h6):(1'h1)] ? {wire9} : {reg14}) : ((wire9 ?
                          reg14 : reg13) ^ {(8'h9c)})),
                  wire3} || $unsigned((^~((wire2 ? (8'hba) : reg17) ?
                  (reg12 == reg17) : $signed(wire9)))));
              reg18 <= $signed((reg7 ?
                  (^{(reg13 ? wire8 : reg7), wire0}) : {wire2,
                      (~(reg12 * (8'hb3)))}));
            end
          reg21 <= reg20;
          if (({wire3[(1'h1):(1'h1)], wire9[(1'h1):(1'h1)]} ?
              ($signed({((8'hbc) ? reg6 : (8'hbf))}) ?
                  $signed(($signed((8'hae)) ?
                      (reg6 - wire9) : reg5)) : ((8'hbd) ?
                      ({reg5} <= {reg18}) : {$unsigned(reg4)})) : $signed(reg20)))
            begin
              reg22 <= ({reg4,
                      $unsigned(((wire2 ? reg14 : wire11) ?
                          ((8'hab) | (8'hb7)) : $signed((8'h9c))))} ?
                  (~|(^~{(wire9 == wire8),
                      $unsigned(reg13)})) : (^~wire10[(1'h0):(1'h0)]));
            end
          else
            begin
              reg22 <= (~&{(reg15[(3'h4):(2'h2)] ?
                      reg14[(2'h2):(1'h0)] : ((wire11 ? reg4 : (8'h9c)) ?
                          $unsigned((8'hba)) : $signed((8'h9d))))});
              reg23 <= reg14[(1'h0):(1'h0)];
            end
        end
      reg24 <= $signed($unsigned(((wire3[(3'h4):(1'h1)] == reg20) >> ((reg18 ^~ wire3) ?
          (wire8 ? (8'hbb) : wire9) : (reg4 ~^ reg14)))));
      reg25 <= {(wire8[(1'h1):(1'h0)] ?
              (reg22 >> reg23[(4'he):(4'hc)]) : (((reg21 <= wire10) ?
                  {reg19,
                      reg20} : reg22[(2'h3):(2'h3)]) + $unsigned((reg12 ^ reg24)))),
          (wire1[(2'h2):(1'h0)] ?
              reg13[(4'ha):(4'h9)] : $signed({{reg22}, $signed(wire11)}))};
    end
endmodule
