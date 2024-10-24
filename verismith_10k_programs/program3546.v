module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
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
  assign wire4 = (wire0 <<< (+wire3));
  always
    @(posedge clk) begin
      if ($signed((8'ha5)))
        begin
          if (wire4[(1'h0):(1'h0)])
            begin
              reg5 <= wire0;
              reg6 <= (8'h9e);
            end
          else
            begin
              reg5 <= ((wire4 >>> ((reg5[(4'h8):(3'h6)] <<< (wire4 >= wire3)) ?
                  (reg6[(2'h2):(1'h1)] ?
                      (^wire4) : (wire2 > (8'h9f))) : ($signed(wire1) && ((8'ha7) ?
                      wire1 : reg6)))) <<< (((!((8'ha9) + reg5)) ?
                      ((wire2 ? reg6 : wire3) != (reg6 ?
                          reg6 : wire2)) : {wire3}) ?
                  {($unsigned(wire2) * (wire2 >>> reg5))} : (wire4[(2'h3):(2'h2)] << $signed((wire4 ?
                      (8'hb8) : wire3)))));
            end
        end
      else
        begin
          reg5 <= {((~reg6[(2'h2):(2'h2)]) << wire0), reg6};
          reg6 <= reg6;
          reg7 <= $unsigned(($signed((~^(wire0 ? wire1 : wire2))) ?
              ($signed(wire4[(3'h6):(1'h0)]) ?
                  ({wire2, wire0} ?
                      wire3 : (wire0 ?
                          reg6 : wire4)) : (|wire2[(3'h6):(1'h0)])) : (~&(+wire1))));
        end
      reg8 <= reg6;
      reg9 <= (({((8'hb9) ? wire2[(3'h6):(1'h0)] : {(8'hab), (8'ha3)}),
              wire4} <= reg5[(4'hf):(4'h9)]) ?
          ($signed(reg7[(2'h2):(2'h2)]) ?
              (~&{$signed(wire4)}) : wire1) : (8'ha5));
      if (wire3[(1'h0):(1'h0)])
        begin
          reg10 <= (~^reg8[(3'h4):(3'h4)]);
          reg11 <= (&{$unsigned(reg6[(1'h1):(1'h1)])});
        end
      else
        begin
          if ($signed($signed(reg6)))
            begin
              reg10 <= (8'hb6);
              reg11 <= wire0;
              reg12 <= $signed((~|$unsigned($signed(reg11))));
              reg13 <= $signed((|((~&(8'haf)) ^ reg8)));
            end
          else
            begin
              reg10 <= (+(^$signed($signed((~^wire4)))));
              reg11 <= $unsigned($unsigned($signed(reg9)));
              reg12 <= reg10;
            end
        end
      reg14 <= ($unsigned(reg7[(3'h4):(2'h2)]) ?
          reg8[(1'h1):(1'h0)] : reg6[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg15 <= $unsigned({wire4[(2'h3):(2'h3)]});
      reg16 <= wire1[(4'hb):(3'h6)];
      reg17 <= (^~reg12[(3'h4):(2'h2)]);
      reg18 <= reg16;
    end
  assign wire19 = ((({(reg13 ? (8'h9d) : reg8)} >>> wire4) ?
                          ($unsigned(((8'ha0) ? reg10 : reg10)) ?
                              (~$signed(reg14)) : wire3[(4'hb):(1'h0)]) : $unsigned($unsigned($signed(reg15)))) ?
                      {$unsigned({$unsigned(wire3), (7'h44)}),
                          $signed((~$unsigned(reg15)))} : $signed(($unsigned($unsigned(reg6)) ?
                          ({reg5, reg8} ?
                              (reg16 ?
                                  wire0 : wire2) : $unsigned(reg10)) : reg14)));
  assign wire20 = (^~(((~|(~&reg5)) ?
                      (~&(reg13 ?
                          reg18 : reg5)) : $unsigned(wire3[(3'h5):(3'h5)])) || reg11));
endmodule
