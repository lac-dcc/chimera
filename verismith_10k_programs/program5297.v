module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire5,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (^~(-$signed(wire0)));
  assign wire5 = $unsigned((wire3 & (((wire1 ? wire2 : (8'h9d)) ?
                         (+wire4) : $unsigned(wire0)) ?
                     wire4 : (|$unsigned(wire1)))));
  always
    @(posedge clk) begin
      if ((8'hb0))
        begin
          if ((wire0 | wire5[(4'hf):(3'h4)]))
            begin
              reg6 <= wire2[(2'h3):(1'h0)];
              reg7 <= $signed($signed(((((8'ha5) ?
                  wire2 : wire1) && (^~(8'haf))) | ((~&wire0) ^~ (+reg6)))));
              reg8 <= ($signed(wire1) ^~ wire4);
              reg9 <= ({reg8} + (8'hb4));
              reg10 <= (({$unsigned(reg7)} ?
                  reg8 : $signed(reg7[(4'ha):(1'h1)])) <= reg6[(2'h3):(1'h0)]);
            end
          else
            begin
              reg6 <= ({$signed((-(wire5 - reg8))),
                  reg6[(2'h3):(1'h1)]} ^~ (wire1 ?
                  (^~$signed((wire4 ? reg9 : wire0))) : reg7));
            end
          reg11 <= wire5[(3'h6):(2'h2)];
          reg12 <= (reg9[(1'h0):(1'h0)] ^~ (reg9[(4'hd):(3'h4)] - reg11[(2'h3):(1'h1)]));
        end
      else
        begin
          if (((~(reg10[(4'ha):(2'h3)] + ({reg10, reg12} ?
                  wire5[(4'ha):(2'h3)] : $unsigned((8'h9f))))) ?
              ($signed(reg11[(4'he):(3'h5)]) << reg6) : ((((reg9 ?
                  wire2 : wire2) + reg9[(5'h13):(3'h7)]) || (!(~wire0))) && (wire1 ?
                  $signed((reg10 == wire1)) : ($unsigned(wire0) == wire1)))))
            begin
              reg6 <= reg12[(4'h8):(3'h6)];
              reg7 <= wire3;
              reg8 <= $signed($unsigned($signed({(8'ha1)})));
            end
          else
            begin
              reg6 <= wire3[(3'h6):(1'h0)];
              reg7 <= $signed({$signed((!(|reg8)))});
              reg8 <= reg12[(4'ha):(3'h4)];
              reg9 <= ((wire3[(4'hb):(3'h5)] ?
                      (7'h41) : $signed($signed($unsigned((8'hb9))))) ?
                  ($signed((~^$signed((8'hba)))) >>> {reg12}) : (~|$signed((wire5[(2'h3):(1'h1)] < reg8))));
            end
          reg10 <= (~|$signed(reg10[(1'h0):(1'h0)]));
          reg11 <= reg9[(4'h8):(3'h7)];
          if ({reg9, ((~^wire4) >> reg6[(4'h9):(3'h7)])})
            begin
              reg12 <= (^(^~$signed($unsigned($unsigned(reg11)))));
              reg13 <= reg11[(4'hc):(3'h6)];
            end
          else
            begin
              reg12 <= (((^((wire2 ? wire2 : reg8) ?
                          wire2 : (reg7 ? reg9 : reg7))) ?
                      wire4[(2'h3):(1'h1)] : {reg10}) ?
                  (~^reg11[(1'h0):(1'h0)]) : ($unsigned($signed((&wire1))) ?
                      {(-wire2[(1'h0):(1'h0)])} : reg13[(1'h1):(1'h0)]));
              reg13 <= $unsigned(wire3[(1'h0):(1'h0)]);
              reg14 <= wire0[(4'hd):(3'h5)];
              reg15 <= (($signed($unsigned(reg12[(4'h9):(3'h7)])) <= (7'h40)) ?
                  reg14[(4'h9):(4'h9)] : $signed(reg10));
              reg16 <= $unsigned(reg14[(4'h8):(4'h8)]);
            end
          reg17 <= reg12;
        end
      if ((reg17 ?
          $signed((($signed(reg13) ?
              {reg13} : $signed((8'hb8))) <= (^(^wire3)))) : $signed((7'h42))))
        begin
          reg18 <= (^reg11);
        end
      else
        begin
          reg18 <= ((!$unsigned($unsigned(wire5[(5'h15):(2'h3)]))) ?
              $unsigned((^~((wire0 ? wire5 : wire1) ?
                  $signed(reg6) : $unsigned((8'ha2))))) : $signed({$unsigned($signed(wire5)),
                  $signed(((8'ha9) ? (8'hb1) : wire1))}));
        end
      reg19 <= reg18;
      reg20 <= wire2[(1'h1):(1'h1)];
      reg21 <= $unsigned($signed(reg14[(2'h3):(2'h3)]));
    end
  assign wire22 = {(($unsigned((reg13 ? reg21 : (8'h9d))) ?
                              (~^$unsigned(reg9)) : reg18) ?
                          reg7[(4'ha):(3'h4)] : reg7[(4'h8):(1'h0)])};
  assign wire23 = reg8;
  assign wire24 = (7'h43);
  assign wire25 = wire24;
  assign wire26 = (reg9 - reg16[(3'h6):(2'h3)]);
  assign wire27 = (+reg10[(3'h4):(2'h2)]);
  assign wire28 = ((reg20[(1'h0):(1'h0)] ?
                          (~|((reg20 ?
                              reg11 : reg15) * (^(8'ha5)))) : wire2[(2'h2):(1'h1)]) ?
                      $unsigned(wire27) : (wire5 ?
                          (reg14[(1'h0):(1'h0)] ^~ {wire26[(1'h0):(1'h0)]}) : wire27));
endmodule
