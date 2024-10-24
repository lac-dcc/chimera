module top
#(parameter param34 = ((((8'hae) ? ((~|(8'h9e)) > ((8'ha0) ? (8'hbe) : (7'h40))) : (8'hb0)) | ((((7'h43) ^~ (8'hbb)) >= (&(8'hae))) ? (~&(^(8'hb7))) : (&((7'h44) * (8'hb2))))) || (&((((8'ha6) ? (8'hbe) : (8'ha6)) != (&(8'hb6))) << (((8'hb7) >> (8'hb5)) ? ((8'hb1) ? (8'h9c) : (8'ha6)) : (|(8'hbb)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire8;
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire8,
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
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((~^$signed(({wire1} ?
          wire3 : $signed(wire2)))) == (^~((((8'ha4) ?
          wire1 : wire3) << $signed(wire1)) || $unsigned($unsigned(wire2)))));
      reg5 <= ($signed((wire2 <<< $unsigned((wire1 ? wire0 : wire1)))) ?
          $signed($unsigned((8'ha4))) : (((wire0 << ((8'ha0) ?
                      (8'hbd) : wire2)) ?
                  $unsigned((reg4 ? wire3 : (7'h43))) : wire3) ?
              (~&((wire3 ? reg4 : wire1) ? (&reg4) : wire2)) : (&(^~{wire0,
                  (8'ha4)}))));
      reg6 <= reg4;
      reg7 <= wire0[(3'h5):(1'h1)];
    end
  assign wire8 = wire3[(5'h11):(3'h6)];
  always
    @(posedge clk) begin
      reg9 <= reg6;
      reg10 <= reg9;
      if ((reg6 ? wire8 : reg6))
        begin
          reg11 <= $signed((wire8[(1'h0):(1'h0)] ?
              (~((wire2 ? reg4 : (8'ha9)) ?
                  (reg4 ? reg9 : wire0) : (reg4 ?
                      (7'h44) : reg4))) : reg6[(3'h6):(3'h5)]));
          reg12 <= (($unsigned(($unsigned((8'h9f)) ?
              {reg11,
                  wire0} : (wire8 >> reg10))) == $unsigned($unsigned(reg10[(3'h4):(1'h1)]))) || {((!{wire1}) | ($unsigned(reg7) >= wire1[(5'h11):(1'h0)])),
              $signed($unsigned($unsigned(wire2)))});
          reg13 <= reg7[(3'h7):(3'h4)];
        end
      else
        begin
          reg11 <= (wire1 ?
              wire2 : ({($unsigned(reg13) == (wire1 ^ reg5)), $unsigned(reg4)} ?
                  $signed(reg10) : reg4));
          if (reg5[(4'h8):(2'h2)])
            begin
              reg12 <= {$unsigned({$unsigned($signed(reg9))})};
              reg13 <= {(~(($signed(wire2) || {reg9}) - (8'haf))), reg6};
              reg14 <= (&$unsigned($unsigned(($signed(reg6) ?
                  (reg11 == reg7) : ((8'ha5) ^ (8'ha1))))));
              reg15 <= {((($unsigned(reg9) >> (wire2 ? wire3 : reg4)) ?
                      (|reg9) : (^~(wire2 <= reg10))) || ($signed($signed(wire8)) ?
                      reg6[(2'h2):(1'h0)] : reg12[(3'h5):(3'h5)])),
                  wire8[(2'h2):(1'h1)]};
              reg16 <= $unsigned((~^reg15));
            end
          else
            begin
              reg12 <= $unsigned((((^wire8[(4'he):(4'ha)]) ?
                  (~reg16[(3'h4):(3'h4)]) : reg6) >= (((&reg7) ?
                      wire3[(5'h11):(5'h10)] : (reg7 & reg16)) ?
                  wire8 : $signed((reg11 ? wire8 : wire3)))));
            end
          if (reg15)
            begin
              reg17 <= reg4;
              reg18 <= wire0;
              reg19 <= reg16[(3'h4):(2'h3)];
            end
          else
            begin
              reg17 <= (wire3 <= $unsigned((~^$signed((&reg4)))));
              reg18 <= reg5[(3'h5):(1'h0)];
              reg19 <= ($signed($unsigned(reg4[(3'h6):(2'h2)])) <= (reg11 <<< (^reg15)));
            end
          reg20 <= reg4[(3'h5):(3'h4)];
        end
      reg21 <= reg19;
      reg22 <= (wire1 - (~^reg21[(3'h4):(2'h3)]));
    end
  assign wire23 = $unsigned((^reg10));
  assign wire24 = (reg22 + reg10);
  assign wire25 = ((+($unsigned($unsigned((8'hb6))) > $signed(reg12[(4'ha):(3'h4)]))) ?
                      {(reg7[(4'hc):(3'h7)] ~^ wire24)} : reg10);
  assign wire26 = wire25[(3'h5):(1'h1)];
  assign wire27 = (wire26[(2'h3):(2'h3)] <<< $signed((wire0 ?
                      {$signed((8'h9e))} : (^$signed(reg10)))));
  assign wire28 = (^reg22);
  assign wire29 = reg21[(3'h6):(1'h0)];
  assign wire30 = reg21[(1'h0):(1'h0)];
  assign wire31 = {{wire3[(4'h8):(3'h6)]}, reg16};
  assign wire32 = reg13[(1'h0):(1'h0)];
  assign wire33 = $signed((($unsigned((+reg14)) ?
                      wire2[(3'h6):(2'h2)] : $signed((&wire32))) >>> ({(8'ha8)} | (!$signed(wire29)))));
endmodule
