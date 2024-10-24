module top
#(parameter param39 = {((!({(8'hba), (7'h40)} ? ((7'h43) ? (8'h9f) : (8'hb5)) : ((7'h42) ? (8'ha5) : (8'hb4)))) ? (7'h42) : ((^{(8'hb3), (8'ha2)}) ~^ (!((8'ha2) != (8'hbb))))), ((-({(8'hbb)} ? (^(8'hb0)) : (|(8'ha0)))) ? ((((8'h9f) ? (8'hb8) : (8'h9d)) || ((7'h40) ? (8'ha5) : (8'ha8))) ~^ ((^~(7'h40)) && {(8'ha9)})) : (((~&(8'ha6)) + ((8'h9d) ? (8'hab) : (8'ha8))) ? (((8'hb9) ? (8'hba) : (8'hb5)) ? ((8'hae) ? (8'hbe) : (8'h9c)) : (&(7'h42))) : (!(~^(8'h9d)))))}, 
parameter param40 = (!{param39}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire30;
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire5,
                 wire30,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire0[(2'h3):(2'h3)]);
      if ($unsigned((^(^~(wire1[(2'h2):(1'h1)] ? wire2 : {wire0, wire0})))))
        begin
          reg7 <= $signed($signed(wire1[(4'h9):(4'h8)]));
          reg8 <= $signed(wire2[(4'h8):(1'h1)]);
          reg9 <= {($signed($signed(reg6)) || reg7), wire4};
          reg10 <= $signed($unsigned($signed({(wire0 ? wire0 : reg6),
              $unsigned(reg8)})));
        end
      else
        begin
          reg7 <= wire4[(1'h0):(1'h0)];
          reg8 <= $unsigned((((wire4 ? $signed(reg7) : $signed(reg10)) ?
                  reg8 : ($signed(reg7) & (|wire5))) ?
              $signed((((7'h42) ?
                  wire5 : wire2) & reg8[(4'h9):(2'h3)])) : $unsigned(wire1)));
          reg9 <= wire2;
          reg10 <= reg6;
          reg11 <= wire2[(3'h5):(2'h3)];
        end
      reg12 <= (reg6[(2'h3):(1'h0)] ?
          wire4[(4'h8):(3'h6)] : $unsigned($unsigned({((8'ha5) >> wire4)})));
      if (reg12[(4'h8):(3'h6)])
        begin
          reg13 <= ((^~wire1[(3'h5):(3'h4)]) ?
              wire1[(4'hc):(1'h1)] : (({(reg12 || reg11),
                      (reg6 ?
                          reg11 : reg12)} * $unsigned(reg8[(4'ha):(2'h3)])) ?
                  reg8 : wire5[(1'h0):(1'h0)]));
          if ((wire2[(3'h4):(2'h3)] & (^~reg7)))
            begin
              reg14 <= (wire0[(1'h1):(1'h0)] ? (8'hb4) : wire0);
            end
          else
            begin
              reg14 <= (((((^reg6) | (reg6 ? reg10 : (7'h42))) ?
                  $signed(reg7) : wire5) || $signed(((wire2 ? reg8 : reg11) ?
                  (+reg6) : reg9[(3'h7):(3'h6)]))) == (^~$unsigned($unsigned($signed(reg11)))));
            end
        end
      else
        begin
          reg13 <= ((8'hae) * (^$signed((reg12[(2'h2):(1'h0)] <= $signed(wire0)))));
          reg14 <= reg8;
          reg15 <= $unsigned(($signed(($signed(wire2) ?
                  (^~wire4) : wire1[(1'h1):(1'h1)])) ?
              (+{(^~wire3), (reg14 ^~ reg13)}) : wire5[(5'h13):(4'hf)]));
        end
      reg16 <= $unsigned($unsigned(((|$signed(reg10)) <= $signed(reg12))));
    end
  module17 #() modinst31 (wire30, clk, reg9, wire5, reg13, reg15);
  assign wire32 = $unsigned($signed(wire3[(4'he):(4'ha)]));
  assign wire33 = {{$unsigned({(wire5 ? reg8 : reg15),
                              (wire5 ? reg13 : (8'h9d))})}};
  assign wire34 = reg7;
  assign wire35 = {wire0[(1'h1):(1'h0)],
                      ($unsigned(wire33[(2'h3):(2'h2)]) - $signed($signed(wire33[(3'h5):(3'h4)])))};
  assign wire36 = $unsigned({($signed(reg14) ^~ $signed($signed(wire35)))});
  assign wire37 = wire34;
  assign wire38 = $signed($signed((((~wire0) ? (wire3 - reg14) : wire0) ?
                      wire4 : (!((8'ha4) ? reg8 : wire35)))));
endmodule

module module17
#(parameter param28 = (8'hb1), 
parameter param29 = (~|((^~((param28 ? (8'ha6) : param28) - (8'ha9))) & param28)))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  assign y = {wire27, wire23, wire22, reg26, reg25, reg24, (1'h0)};
  assign wire22 = wire21;
  assign wire23 = {$unsigned(wire21[(1'h1):(1'h1)]), (8'ha5)};
  always
    @(posedge clk) begin
      reg24 <= ((-wire22) ?
          ((~|$unsigned((^wire19))) ?
              wire23 : ((~^(8'ha6)) - wire22[(5'h11):(5'h10)])) : wire20);
      reg25 <= ($signed($signed(reg24)) ? reg24[(1'h0):(1'h0)] : reg24);
      reg26 <= $unsigned((wire21 ?
          wire19[(1'h1):(1'h0)] : $unsigned(reg24[(3'h4):(1'h1)])));
    end
  assign wire27 = {wire18[(3'h5):(1'h1)],
                      ($signed($signed($signed((8'hb8)))) <<< {wire19[(3'h5):(1'h1)],
                          $signed((reg26 ? wire18 : reg26))})};
endmodule
