module top
#(parameter param22 = (((&({(8'ha4)} <<< (7'h40))) * (-((^~(8'hba)) | ((8'hb6) ? (8'hb6) : (7'h40))))) ? ((+((~(8'ha5)) ? (+(8'ha2)) : (^~(8'h9c)))) ? (-{((7'h43) != (8'ha1)), ((8'hb3) > (8'hb8))}) : (~|(8'hab))) : (~|(((~|(8'ha1)) && {(8'ha5)}) - (((7'h41) <<< (8'hbf)) != ((8'h9c) ^ (8'hbe)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire4,
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
  assign wire4 = wire0[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg5 <= wire4[(3'h7):(1'h0)];
      reg6 <= $unsigned($unsigned((!{$unsigned(reg5)})));
      reg7 <= (8'hb9);
      reg8 <= (~&$signed($unsigned((-$signed(wire0)))));
      reg9 <= (wire4[(4'hd):(4'hd)] || (reg7[(2'h3):(1'h0)] <<< $unsigned(($signed(wire1) * $unsigned(wire2)))));
    end
  always
    @(posedge clk) begin
      if (reg6[(4'he):(4'hc)])
        begin
          if ((reg7 <= (((~|(+wire4)) >= ($unsigned(reg6) >= wire3[(3'h7):(3'h4)])) | $signed(($signed((8'hbc)) || wire3)))))
            begin
              reg10 <= $unsigned($signed($signed($signed(reg5[(4'hf):(4'hc)]))));
              reg11 <= $unsigned(wire1[(3'h4):(3'h4)]);
              reg12 <= ($unsigned(reg7) ~^ $unsigned((((^reg9) ?
                  {(8'h9d)} : {reg11}) || ($unsigned(wire3) ?
                  (wire0 ? reg8 : wire1) : wire2))));
              reg13 <= (8'haa);
              reg14 <= $signed((-$unsigned($unsigned($unsigned(wire0)))));
            end
          else
            begin
              reg10 <= reg10[(4'h9):(3'h7)];
              reg11 <= (^reg5);
              reg12 <= reg7[(4'hf):(1'h1)];
            end
        end
      else
        begin
          reg10 <= $signed($unsigned(reg11[(2'h3):(1'h0)]));
          reg11 <= (((wire0[(3'h4):(3'h4)] ?
                      ((reg9 * (8'hbb)) ?
                          (reg13 >= reg12) : (8'hbf)) : {$signed(reg5)}) ?
                  $signed(($unsigned(reg11) - $signed(reg14))) : $unsigned(reg11[(4'h9):(3'h4)])) ?
              reg9[(3'h4):(1'h1)] : wire4[(3'h6):(1'h1)]);
          reg12 <= wire0[(2'h2):(2'h2)];
          reg13 <= $unsigned((~^wire4[(4'hb):(3'h4)]));
          reg14 <= wire0;
        end
      if ((((((^reg11) ?
              (reg10 ? reg12 : reg10) : $unsigned(wire0)) ^~ $unsigned((wire1 ?
              reg14 : wire1))) ?
          reg8[(4'hb):(3'h7)] : {(^~wire1)}) > (reg13 ?
          reg14 : ($signed((~&(8'ha7))) >> ({reg13, wire0} ?
              reg14[(3'h6):(3'h6)] : (reg9 == wire1))))))
        begin
          reg15 <= reg12[(2'h3):(2'h3)];
          reg16 <= (wire0[(3'h4):(1'h1)] ?
              (^~$signed({$signed(reg9)})) : (~^reg12[(1'h0):(1'h0)]));
          reg17 <= ((~&(-wire3)) ? (^~wire0) : reg16);
        end
      else
        begin
          reg15 <= ((!wire0[(3'h5):(1'h1)]) & ($signed($unsigned((reg17 << reg17))) ?
              $signed((reg15 & (~|reg15))) : $signed((^reg9))));
        end
      reg18 <= (+({$unsigned({reg13, reg10})} ?
          $unsigned(reg11) : $signed(wire1[(2'h3):(1'h1)])));
    end
  assign wire19 = (^$signed(reg14));
  assign wire20 = ($signed(reg18) ?
                      reg13[(3'h6):(3'h6)] : (($unsigned({reg17,
                              reg15}) == $unsigned((reg9 && reg14))) ?
                          (~^{wire3, wire2}) : reg16));
  assign wire21 = $signed(reg9);
endmodule
