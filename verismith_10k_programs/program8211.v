module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {wire0[(2'h3):(1'h0)]};
  assign wire6 = (($signed((wire4 ? (+wire4) : $signed(wire0))) ?
                         (wire3 <= $unsigned((wire3 ?
                             wire5 : wire4))) : $unsigned((~^$signed(wire1)))) ?
                     wire4[(1'h1):(1'h1)] : $unsigned($signed(({wire2,
                             (8'h9f)} ?
                         (wire3 && (8'hbb)) : $unsigned(wire3)))));
  assign wire7 = (((8'hbf) * $unsigned(wire1)) ?
                     $signed(wire6) : (~^$unsigned((wire6[(1'h1):(1'h1)] + wire3[(1'h0):(1'h0)]))));
  assign wire8 = ((8'ha8) ?
                     (|(~|$signed($signed(wire1)))) : $signed($signed(($signed(wire4) ?
                         (~&(8'hae)) : wire7[(4'hf):(1'h1)]))));
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire1[(2'h3):(2'h3)]);
      if ($signed($unsigned({((wire1 ? wire7 : wire2) * wire3)})))
        begin
          reg10 <= (wire2 ? wire2 : wire8[(2'h2):(1'h0)]);
          reg11 <= $unsigned({((&(wire1 >> wire6)) << $unsigned($signed(reg10)))});
        end
      else
        begin
          if (wire8[(2'h3):(2'h2)])
            begin
              reg10 <= $unsigned((|(|reg9[(3'h7):(2'h2)])));
              reg11 <= $signed(wire3[(3'h7):(2'h3)]);
              reg12 <= wire3[(3'h4):(1'h0)];
              reg13 <= $signed($unsigned($unsigned(reg10)));
              reg14 <= (+wire4);
            end
          else
            begin
              reg10 <= wire2;
              reg11 <= {wire5[(4'hb):(3'h4)]};
            end
          reg15 <= $unsigned(reg14);
          reg16 <= (^~(^~(^$signed(reg12[(4'hb):(3'h6)]))));
          reg17 <= (reg16 & $signed(({((8'h9e) ~^ (8'haa))} > (~^wire1[(4'h8):(1'h0)]))));
          reg18 <= wire7[(4'hc):(3'h5)];
        end
      reg19 <= $unsigned(reg12[(4'h9):(1'h1)]);
      reg20 <= reg13[(2'h3):(1'h1)];
    end
  assign wire21 = reg12;
  assign wire22 = reg19[(4'hd):(4'hc)];
  assign wire23 = (wire2 ?
                      (wire2[(2'h3):(1'h0)] ?
                          $signed($unsigned($signed(wire5))) : ($signed((wire3 ?
                              (8'hb9) : (7'h43))) ^ (wire1 ?
                              (wire22 ? reg9 : reg9) : (reg11 ?
                                  reg12 : wire2)))) : (&$signed($unsigned((wire22 ~^ wire21)))));
endmodule
