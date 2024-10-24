module top
#(parameter param19 = (+((~|(((8'haa) ? (8'hb7) : (8'ha7)) ? {(8'hb3)} : ((7'h41) || (8'hac)))) ? (8'h9f) : ((((8'hac) != (8'ha2)) - ((7'h42) ? (8'hb1) : (8'ha6))) ? ((^(8'hb0)) != ((8'hb9) ? (8'hba) : (8'haf))) : (((8'hb9) == (8'ha2)) ? ((8'hb3) > (8'haf)) : ((8'hb8) << (8'ha1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire7,
                 wire6,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (-$signed($unsigned(({(8'hac), wire3} - {wire4, wire2}))));
    end
  assign wire6 = reg5[(2'h3):(1'h0)];
  assign wire7 = (wire6[(2'h3):(1'h1)] > ($unsigned(($unsigned(wire3) ?
                     (wire4 ?
                         wire6 : (8'ha1)) : reg5[(2'h2):(1'h1)])) + wire3[(5'h12):(1'h0)]));
  always
    @(posedge clk) begin
      reg8 <= wire3[(4'hf):(4'hd)];
      if (wire4)
        begin
          reg9 <= {(~wire1[(1'h1):(1'h1)]), wire2};
          reg10 <= {({(8'h9c), wire4[(3'h6):(3'h4)]} ?
                  (+(&$signed((8'ha4)))) : $unsigned($unsigned((wire7 ^~ wire1))))};
          reg11 <= wire1[(4'hc):(4'ha)];
          reg12 <= (-{reg9,
              ({(reg9 | wire2), $unsigned(wire6)} ?
                  ((|reg11) ? wire0 : reg9) : (reg8 <<< (8'hb8)))});
          reg13 <= $unsigned((8'ha9));
        end
      else
        begin
          reg9 <= $signed((^~wire4[(3'h7):(1'h1)]));
          reg10 <= (-((reg13[(1'h1):(1'h0)] ?
              ((!reg10) >>> (wire0 == (7'h44))) : reg10) <<< $signed({reg12,
              $signed(reg13)})));
          reg11 <= reg11[(1'h0):(1'h0)];
          if (reg10[(2'h2):(1'h0)])
            begin
              reg12 <= reg10;
              reg13 <= wire1[(4'hf):(4'h8)];
              reg14 <= reg11[(2'h2):(2'h2)];
              reg15 <= (~^reg14);
            end
          else
            begin
              reg12 <= ((~|wire6[(4'ha):(4'h8)]) ?
                  (wire3 ?
                      wire1 : $signed($unsigned($signed(reg8)))) : ((reg8[(4'hb):(1'h1)] != ({reg10,
                      reg5} <<< wire2)) | ($signed(reg12) + wire2)));
              reg13 <= (wire3[(5'h13):(3'h6)] ?
                  $signed(reg12) : {(wire4 || (^~$signed(reg5))),
                      ({$unsigned(reg14)} ?
                          wire4 : {(8'hb8), $signed(reg11)})});
              reg14 <= {(wire4 && (^{((7'h44) ? reg12 : wire1)})),
                  wire3[(4'hc):(4'h9)]};
              reg15 <= ($signed(($signed($unsigned(reg13)) ?
                      ((wire2 || wire4) ?
                          reg13 : (reg12 ?
                              reg11 : reg13)) : $signed($signed(reg12)))) ?
                  {reg13, wire3[(3'h5):(3'h5)]} : {wire4,
                      wire0[(2'h2):(2'h2)]});
              reg16 <= {(8'ha1)};
            end
        end
    end
  assign wire17 = ((~^wire7[(4'he):(2'h2)]) >> (wire7[(3'h7):(3'h6)] ^~ ($unsigned(reg8[(1'h1):(1'h1)]) ?
                      $unsigned((~^reg15)) : (^~wire4[(5'h11):(2'h2)]))));
  assign wire18 = $unsigned($unsigned($signed(reg9[(4'hd):(3'h7)])));
endmodule
