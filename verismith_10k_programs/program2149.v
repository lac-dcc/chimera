module top
#(parameter param21 = {(^~{(((8'hae) ? (8'hb5) : (8'hbd)) > ((8'ha1) ? (8'hb4) : (7'h40)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= {wire5};
    end
  always
    @(posedge clk) begin
      reg7 <= (+wire0[(1'h0):(1'h0)]);
      if (wire2)
        begin
          reg8 <= wire0[(2'h3):(1'h0)];
          if ($unsigned({reg7[(4'hc):(4'h9)]}))
            begin
              reg9 <= wire5;
            end
          else
            begin
              reg9 <= ($signed($signed(((wire2 ~^ (8'hbe)) ? wire2 : wire0))) ?
                  $signed($signed((wire2 ?
                      (|wire5) : wire3[(1'h0):(1'h0)]))) : reg9);
              reg10 <= ({{(&(^wire5)), (wire2 && reg8[(1'h1):(1'h0)])}} ?
                  ((((wire3 ?
                          wire2 : wire1) || (~^wire1)) ~^ ($signed(wire1) >= (wire5 != reg7))) ?
                      (wire3[(2'h3):(2'h2)] || $signed((~|reg7))) : (wire5[(4'hd):(1'h0)] ~^ reg9[(2'h3):(2'h3)])) : reg9);
              reg11 <= ((8'hb1) ^~ reg8[(2'h2):(2'h2)]);
              reg12 <= $signed(((reg8[(1'h1):(1'h0)] | (!wire1[(3'h6):(1'h0)])) ?
                  ((+wire3) || (~&$signed(wire0))) : wire4[(3'h4):(2'h3)]));
              reg13 <= $unsigned((($unsigned({reg12}) ?
                  (^reg10[(4'h9):(3'h7)]) : reg7) << (+reg6[(4'he):(1'h1)])));
            end
          reg14 <= reg8;
          reg15 <= reg12;
        end
      else
        begin
          reg8 <= $unsigned($signed($unsigned($unsigned(reg11))));
        end
    end
  assign wire16 = $unsigned((wire3[(1'h1):(1'h1)] ?
                      ((((8'hbb) ^ (8'hb6)) ?
                          reg10[(4'hd):(4'hb)] : $signed((8'ha1))) | ({wire1} ?
                          (wire4 ?
                              (8'h9d) : reg7) : reg13[(1'h1):(1'h0)])) : {(!wire5[(4'hc):(4'hb)]),
                          $unsigned(reg11[(3'h7):(1'h0)])}));
  assign wire17 = ($signed((8'hbf)) ^ reg10);
  assign wire18 = (($unsigned(reg15[(5'h10):(4'ha)]) ?
                      {((reg8 ? wire3 : wire3) ? (8'h9e) : $unsigned(wire17)),
                          reg7} : reg9) <<< reg15[(4'ha):(4'h9)]);
  assign wire19 = $unsigned($unsigned(reg15[(4'hb):(3'h7)]));
  assign wire20 = wire1;
endmodule
