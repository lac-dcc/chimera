module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire4,
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
  assign wire4 = (wire3 * $unsigned(((|$unsigned(wire0)) ?
                     $unsigned((wire3 ?
                         wire2 : wire3)) : wire2[(4'h9):(3'h6)])));
  always
    @(posedge clk) begin
      reg5 <= wire1;
      if ($signed($signed(wire2[(4'hd):(4'hd)])))
        begin
          reg6 <= $signed((wire3[(4'h9):(2'h3)] ?
              ((((8'ha7) ? wire1 : (8'haa)) ?
                      {wire3, wire4} : wire2[(4'h8):(2'h3)]) ?
                  wire0 : ((&reg5) ?
                      ((8'ha5) ? wire3 : wire1) : (reg5 ?
                          (8'had) : (8'ha7)))) : wire3));
        end
      else
        begin
          if ($signed((^~{wire3})))
            begin
              reg6 <= wire0;
              reg7 <= ($signed({(+$unsigned(reg6))}) ?
                  $unsigned($unsigned(($unsigned((8'hb8)) >= {reg5}))) : ((+$unsigned($unsigned(reg5))) && wire3[(2'h2):(1'h1)]));
              reg8 <= $signed(reg7);
            end
          else
            begin
              reg6 <= wire4;
              reg7 <= $unsigned($unsigned($unsigned((8'hb3))));
            end
          reg9 <= $signed($unsigned(reg6));
          reg10 <= ($unsigned({((&reg8) | reg7), {$signed(reg7)}}) ?
              reg5 : $unsigned(wire2[(4'h8):(3'h5)]));
          reg11 <= (({((wire0 != wire0) >> $signed(wire3)),
                  $signed(reg10)} << {wire1}) ?
              (!(wire0[(1'h1):(1'h0)] >> $unsigned(wire0[(2'h3):(2'h3)]))) : (+$signed(wire3[(1'h1):(1'h0)])));
          if (($unsigned(((!(wire1 < wire2)) ?
                  wire3 : ((wire2 > reg10) & {reg7, wire4}))) ?
              (reg6 ?
                  (^reg11[(3'h6):(3'h5)]) : (~(wire2[(2'h2):(1'h0)] || $signed(reg8)))) : ((~&reg5[(1'h1):(1'h1)]) ?
                  reg11[(3'h6):(3'h6)] : (&$unsigned(wire4)))))
            begin
              reg12 <= ((~&($unsigned((wire1 == reg11)) ?
                  {reg6[(4'hf):(4'h8)]} : wire1)) ^ reg6);
              reg13 <= $unsigned($signed(wire2[(4'hf):(4'hb)]));
            end
          else
            begin
              reg12 <= wire2[(1'h0):(1'h0)];
              reg13 <= (~|((~reg8[(3'h5):(3'h4)]) ?
                  (^~reg6[(2'h3):(1'h0)]) : (8'hbe)));
              reg14 <= wire0[(2'h3):(2'h2)];
            end
        end
    end
  assign wire15 = {($unsigned($unsigned($unsigned(wire3))) ?
                          {$unsigned($signed(reg6))} : $unsigned((^~wire1[(3'h4):(3'h4)]))),
                      wire4[(3'h5):(1'h0)]};
  assign wire16 = ($signed((((^~reg13) + reg9) ?
                      (&reg8) : reg6)) | reg5[(1'h1):(1'h1)]);
endmodule
