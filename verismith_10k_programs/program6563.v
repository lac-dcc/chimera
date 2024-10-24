module top
#(parameter param23 = ((~|{(((8'ha5) < (8'ha6)) <<< ((8'hb1) & (8'ha0))), ((8'ha3) ? ((8'hb9) ? (8'ha6) : (8'ha4)) : (~&(8'hb8)))}) || (({(|(8'h9d)), (^(8'hb6))} ? ({(8'ha5)} ? ((8'hb2) >= (7'h41)) : ((8'hb4) << (8'hae))) : (~((8'haa) << (8'ha1)))) & (((~(7'h40)) ^~ ((7'h41) ? (8'hb2) : (8'hac))) ? (((8'ha1) ? (8'ha7) : (8'hb7)) > ((8'ha6) != (8'ha7))) : ((&(8'h9e)) >= ((8'ha4) >>> (8'ha3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (^~$unsigned((wire0[(4'ha):(3'h6)] ?
                     (wire1[(2'h2):(2'h2)] ?
                         wire2 : (8'ha5)) : (~|(~|wire1)))));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if (($unsigned($signed($unsigned($signed(wire3)))) ?
              $signed($unsigned($signed((8'ha9)))) : (8'ha8)))
            begin
              reg5 <= $unsigned((({wire2[(2'h3):(2'h3)], (!wire3)} ?
                  {wire2} : ((&wire0) ?
                      (8'ha8) : (~^wire4))) == $unsigned((+wire0))));
              reg6 <= (!$unsigned((({wire0, wire3} || (reg5 ?
                  wire4 : wire0)) - ((~wire1) ?
                  ((8'ha0) ? wire2 : reg5) : wire2))));
              reg7 <= {$unsigned((wire0[(3'h5):(3'h4)] == (((8'hb1) + wire2) ?
                      wire0[(4'ha):(1'h1)] : reg6[(4'h9):(3'h6)])))};
              reg8 <= $unsigned((((!(wire0 + reg5)) >>> (-(+wire0))) ?
                  reg7 : $unsigned((~^{wire3}))));
              reg9 <= reg6;
            end
          else
            begin
              reg5 <= ({reg5[(4'h8):(3'h7)]} << $unsigned(($unsigned($signed(reg6)) ?
                  ({(8'h9d), wire0} ?
                      (wire2 ?
                          wire0 : wire1) : $signed(reg5)) : {$signed((7'h41))})));
              reg6 <= ($signed((reg9 ?
                  ($signed(reg6) ?
                      $signed(reg7) : (reg7 || reg7)) : ($unsigned(wire2) ^ $signed(reg9)))) & {(-reg5[(3'h7):(3'h6)])});
              reg7 <= (~&(wire0 * (^$signed({reg6}))));
              reg8 <= ($signed({{reg8[(1'h1):(1'h0)]}, reg9[(4'hd):(4'ha)]}) ?
                  (^~wire2) : reg6);
              reg9 <= {reg9};
            end
          reg10 <= (^reg9);
        end
      else
        begin
          reg5 <= reg9;
          if (($unsigned(reg7[(1'h0):(1'h0)]) ?
              reg8[(2'h2):(2'h2)] : $unsigned({(reg5[(4'h8):(1'h0)] * ((8'hb8) != reg7))})))
            begin
              reg6 <= ((^(~((wire0 - reg6) ?
                  ((8'hbd) ?
                      wire4 : (8'ha8)) : $unsigned(reg6)))) != (((8'h9c) >> (^(wire1 & reg8))) ?
                  $unsigned(reg7[(2'h3):(2'h3)]) : ((~^reg9[(2'h2):(2'h2)]) ?
                      ($signed(reg5) ?
                          {wire0} : (8'hb8)) : (wire1[(2'h2):(1'h0)] ^ (wire4 ^ wire4)))));
              reg7 <= $unsigned($unsigned(reg6));
            end
          else
            begin
              reg6 <= (^~(reg7[(1'h0):(1'h0)] ~^ ($unsigned(reg9) ?
                  $signed(reg5) : wire1[(1'h1):(1'h0)])));
              reg7 <= $unsigned(reg10[(3'h5):(1'h0)]);
              reg8 <= reg8[(2'h2):(1'h1)];
              reg9 <= (~$signed(($unsigned($unsigned(wire3)) ^ reg10[(3'h4):(2'h2)])));
              reg10 <= (reg10[(1'h0):(1'h0)] * wire3[(2'h2):(1'h0)]);
            end
        end
      reg11 <= (^$signed($signed(wire0[(4'h8):(2'h3)])));
      reg12 <= ((7'h40) >>> reg11);
      reg13 <= (&reg6);
    end
  always
    @(posedge clk) begin
      reg14 <= $signed(reg12[(4'h9):(4'h8)]);
      reg15 <= (-(reg9[(4'he):(2'h2)] >> (~|((-reg6) >>> (|reg5)))));
      reg16 <= ($unsigned($signed(((reg10 | reg11) ?
          $signed(reg12) : $unsigned(wire2)))) ^ wire4);
      reg17 <= reg15[(4'hd):(3'h5)];
      reg18 <= (~^(^reg6));
    end
  always
    @(posedge clk) begin
      reg19 <= $unsigned(reg15);
    end
  assign wire20 = reg11[(1'h1):(1'h1)];
  assign wire21 = (-$unsigned(reg5[(2'h2):(2'h2)]));
  assign wire22 = $signed($signed((^~((!(7'h41)) ?
                      wire2[(3'h7):(1'h1)] : $signed(wire1)))));
endmodule
