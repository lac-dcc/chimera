module top
#(parameter param19 = ((~{(((8'hb5) || (8'hb4)) ? {(8'hb8)} : ((8'hba) ? (8'ha5) : (8'hab))), ({(8'haa), (8'hb8)} >= {(8'h9e)})}) ^~ {{{((7'h43) ? (8'hb8) : (8'haa))}}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ($unsigned($signed($unsigned(((8'hbf) ?
                     wire3 : wire1)))) & $unsigned(wire2[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      reg6 <= wire5[(2'h2):(1'h1)];
      reg7 <= (~&wire4);
      reg8 <= $signed(wire1[(5'h12):(4'hf)]);
      reg9 <= wire5;
      if ($signed(wire0[(3'h4):(1'h0)]))
        begin
          reg10 <= wire2;
          reg11 <= ($signed(reg10) ^ $unsigned($signed((-(wire4 >= (8'ha3))))));
          reg12 <= ($unsigned((~^(~|(|reg9)))) ?
              (~|reg10[(4'h8):(3'h4)]) : (~($signed($signed(reg10)) & reg7)));
          reg13 <= ((~|$unsigned((~|(wire4 | reg9)))) ?
              wire1[(3'h4):(3'h4)] : {{reg9}, wire2[(2'h2):(1'h1)]});
          if ($signed($signed(($unsigned(reg13[(2'h2):(1'h1)]) * $unsigned(wire2)))))
            begin
              reg14 <= wire1;
              reg15 <= $unsigned(({(8'hab)} && reg12[(4'ha):(4'h8)]));
              reg16 <= ($unsigned($signed(reg8)) ?
                  $unsigned($signed(reg13)) : (^$unsigned((!(reg10 - wire2)))));
            end
          else
            begin
              reg14 <= (8'hbf);
            end
        end
      else
        begin
          reg10 <= reg10;
          reg11 <= reg8[(4'he):(3'h5)];
        end
    end
  assign wire17 = (^~$signed(reg6));
  assign wire18 = $unsigned((reg10 ?
                      $signed(((reg11 ~^ wire5) ?
                          (wire4 && (8'hac)) : (~reg9))) : $signed(((reg7 + wire17) ?
                          reg10[(2'h3):(2'h3)] : {reg10}))));
endmodule
