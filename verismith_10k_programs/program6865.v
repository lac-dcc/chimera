module top
#(parameter param28 = (^(((((8'hab) ? (7'h42) : (8'hbd)) ? (!(7'h44)) : {(8'ha4)}) ? (((8'hb8) << (8'hba)) <<< (8'haa)) : (((8'h9e) ? (8'hab) : (8'h9d)) ? ((8'hbb) ? (8'hb4) : (8'hbe)) : ((8'h9e) >> (8'hb6)))) ^~ {(8'hb3)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire20;
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire20,
                 reg22,
                 reg21,
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
  always
    @(posedge clk) begin
      reg5 <= ($unsigned((~$signed((wire3 ^~ wire1)))) ?
          wire4[(4'ha):(2'h2)] : (((^~(^~wire0)) ?
              wire1[(3'h6):(2'h3)] : $signed(wire2)) ^~ wire4));
      if ((7'h43))
        begin
          reg6 <= {wire2[(4'hd):(4'h8)],
              (wire0[(3'h4):(2'h3)] - ((((8'hac) ?
                  wire1 : wire3) - (wire1 == (8'ha0))) && $signed(((8'haa) < wire3))))};
        end
      else
        begin
          reg6 <= reg5;
          reg7 <= ((wire2 ?
              (~&{(reg5 ? wire2 : wire1),
                  $signed(wire2)}) : (reg5 ^~ (wire3[(4'h8):(3'h4)] ?
                  (|(8'hbc)) : (reg5 ? (8'hb6) : wire0)))) && (^wire4));
          reg8 <= $signed($signed(($signed((8'ha9)) >>> reg7)));
          if ((8'hb0))
            begin
              reg9 <= (~|$unsigned(($unsigned((^wire3)) ?
                  {(wire0 ? wire0 : (8'hba)), (&wire2)} : ({reg8} ?
                      (wire4 <= wire3) : reg7))));
              reg10 <= (((~|$signed(reg7[(4'h8):(3'h4)])) >>> $signed($signed((reg6 <<< reg5)))) ?
                  (~^(($unsigned(reg8) + (reg5 > reg8)) ?
                      reg6[(3'h6):(3'h6)] : ($signed(reg7) ~^ $unsigned(wire0)))) : $unsigned(({$signed(wire3)} ?
                      $signed(reg9) : wire2[(5'h10):(4'hb)])));
              reg11 <= $unsigned(reg6);
            end
          else
            begin
              reg9 <= (wire2[(4'hd):(2'h3)] <<< reg9);
              reg10 <= $unsigned($unsigned(wire1));
              reg11 <= $unsigned(((reg6 ?
                      (+(!reg6)) : ((+reg9) ? reg11[(2'h3):(2'h2)] : (8'ha7))) ?
                  $signed(((~^reg9) ^~ {reg6})) : $signed($unsigned(reg11[(1'h1):(1'h1)]))));
            end
          if (reg7)
            begin
              reg12 <= wire1[(5'h12):(2'h2)];
              reg13 <= ($signed(wire0) >> wire3[(4'ha):(4'ha)]);
              reg14 <= $signed({reg13, wire2[(2'h3):(1'h1)]});
              reg15 <= ($signed(((!{wire0}) * ($unsigned(wire4) ?
                      {reg14} : $signed((7'h43))))) ?
                  {$signed((&{reg6}))} : $unsigned($signed((+$signed(reg8)))));
              reg16 <= $signed(reg7);
            end
          else
            begin
              reg12 <= {(reg6 ? (8'ha1) : $unsigned(reg11)), reg13};
              reg13 <= $unsigned(wire0[(1'h0):(1'h0)]);
              reg14 <= (((~|$unsigned((!wire2))) ^ $unsigned(((wire3 ?
                  reg14 : wire0) - reg11[(1'h0):(1'h0)]))) << reg7);
              reg15 <= wire2[(5'h13):(4'hd)];
            end
        end
      reg17 <= (wire4 ?
          ($signed($unsigned({wire4})) ?
              reg7 : $unsigned($unsigned((~^wire4)))) : $unsigned((+wire3[(4'he):(3'h4)])));
      reg18 <= $signed(($unsigned($signed((reg5 ^~ reg9))) >> reg10[(3'h5):(2'h3)]));
      reg19 <= reg17;
    end
  assign wire20 = {(reg11 && reg14),
                      {(((reg10 ? (8'had) : wire1) ^ {reg8}) ?
                              (^~$signed(reg7)) : $signed($signed(reg7)))}};
  always
    @(posedge clk) begin
      reg21 <= (!wire3);
      reg22 <= {$signed($signed(wire1[(4'he):(2'h3)]))};
    end
  assign wire23 = reg18;
  assign wire24 = $unsigned((~|(^((reg14 * wire1) ? (8'ha3) : (8'ha6)))));
  assign wire25 = wire3;
  assign wire26 = (!((^~wire2[(4'he):(4'h8)]) ?
                      {(^(reg5 ? reg21 : wire1))} : (~^reg11)));
  assign wire27 = (8'hbc);
endmodule
