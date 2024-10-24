module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire18,
                 wire17,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((+(~&($unsigned(wire2) ?
          wire3 : (wire3 ? wire1 : wire0)))));
      reg5 <= wire3[(5'h10):(4'ha)];
      reg6 <= wire1;
      if ((^wire0[(1'h0):(1'h0)]))
        begin
          reg7 <= reg5[(3'h5):(3'h4)];
          reg8 <= ($signed((~(~^(wire3 ~^ reg6)))) ?
              ((~&reg7) || ((~&(!wire2)) && $signed((reg4 ?
                  reg5 : reg4)))) : $signed((-reg6[(3'h7):(3'h6)])));
          reg9 <= ((wire0 | reg5[(3'h6):(2'h3)]) ?
              {reg5, (8'ha1)} : (($unsigned((wire1 ?
                      reg4 : reg6)) ~^ (+reg7[(3'h5):(3'h5)])) ?
                  (!(8'ha9)) : reg4[(3'h4):(3'h4)]));
        end
      else
        begin
          if ($signed(($unsigned(reg9[(5'h12):(3'h4)]) ?
              $signed(wire3) : (8'hbf))))
            begin
              reg7 <= (8'haf);
            end
          else
            begin
              reg7 <= ({(7'h43)} || $signed($unsigned($unsigned(wire3))));
            end
          reg8 <= (^~(+{(7'h43)}));
        end
      if ((wire0[(1'h1):(1'h0)] >>> ((~|wire2) ? wire0[(2'h2):(1'h0)] : reg9)))
        begin
          reg10 <= (wire3[(4'hb):(1'h0)] ?
              (reg9 > ((^$unsigned(wire2)) ?
                  reg9[(4'hc):(3'h6)] : wire3)) : wire0[(1'h0):(1'h0)]);
          reg11 <= $signed(reg10[(1'h1):(1'h0)]);
          reg12 <= $unsigned({reg6,
              $signed((reg10[(2'h2):(1'h0)] & reg7[(3'h5):(1'h1)]))});
          if ($unsigned($unsigned(($signed((reg5 >>> reg12)) ?
              (+{wire2, (8'hb0)}) : {(^(8'hb2)), $unsigned(reg6)}))))
            begin
              reg13 <= ((!reg9) ?
                  reg4 : $unsigned($signed(wire1[(1'h1):(1'h1)])));
              reg14 <= wire1[(2'h3):(2'h2)];
              reg15 <= (^~$signed($signed((!reg7[(2'h3):(2'h2)]))));
            end
          else
            begin
              reg13 <= reg15;
              reg14 <= $signed(wire0[(1'h1):(1'h0)]);
            end
          reg16 <= {reg8[(4'ha):(4'h9)], (^~reg4)};
        end
      else
        begin
          reg10 <= ({($signed((reg12 ^ reg7)) < (~&((8'hbd) ? reg13 : reg11))),
                  {(8'ha8)}} ?
              $unsigned(reg12[(3'h6):(1'h0)]) : ((^~({reg7, (8'hbf)} ^~ {reg14,
                      (8'ha7)})) ?
                  (reg10 ? reg13[(4'h9):(3'h7)] : reg15) : {(8'hbe)}));
        end
    end
  assign wire17 = (wire0[(1'h0):(1'h0)] ?
                      wire3[(4'hb):(4'ha)] : (~^({reg8[(2'h3):(1'h0)],
                              (wire2 ? (7'h43) : reg16)} ?
                          reg4 : (^reg16[(4'hf):(4'hf)]))));
  assign wire18 = (~^(~&($signed(reg5) ?
                      (+$unsigned(reg8)) : ((reg16 ? wire1 : (8'ha5)) ?
                          reg5 : ((8'haa) ? reg7 : reg9)))));
  always
    @(posedge clk) begin
      reg19 <= {$signed((+reg5)), $unsigned(reg14[(4'h8):(3'h4)])};
      reg20 <= $signed(($unsigned(reg12) ? wire17 : reg12[(2'h2):(1'h0)]));
      reg21 <= {reg7};
      reg22 <= (&((((^wire17) ? reg13 : (reg4 ~^ reg20)) >>> reg12) ?
          (^~((|reg15) ? reg10 : $signed((7'h43)))) : wire3));
    end
  assign wire23 = {$unsigned((((reg19 ? wire17 : reg20) >= reg9) >= ((wire0 ?
                              reg19 : wire0) ?
                          {reg20} : (^~wire1)))),
                      reg14[(3'h4):(2'h3)]};
  assign wire24 = $signed((~|reg15[(4'hc):(4'h9)]));
endmodule
