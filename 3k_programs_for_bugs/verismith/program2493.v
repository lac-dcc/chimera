module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire16,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
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
  assign wire5 = $signed(wire2[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg6 <= ($signed({$signed((~wire3))}) ?
          {{((+wire2) ? ((7'h41) ? wire0 : wire4) : $unsigned(wire2))},
              ($signed(((8'ha1) ~^ wire1)) & wire3)} : $signed((((wire0 ?
              wire4 : wire1) << {wire5}) * {wire5[(4'hf):(4'h9)],
              (~(8'hb6))})));
      reg7 <= (~(($unsigned((wire1 ?
          (8'hb1) : reg6)) & $unsigned(wire3[(4'h8):(1'h0)])) > {(wire4 ^~ wire5),
          $signed((wire0 <<< wire0))}));
      reg8 <= (reg6 | ($unsigned($signed((wire0 >> wire1))) ?
          (((8'ha7) - (wire4 ? wire4 : reg7)) ^ wire1) : {(wire4 ?
                  reg6 : $unsigned(wire0)),
              wire4}));
      reg9 <= {$unsigned({(+$unsigned(reg7)),
              ($unsigned(reg6) ? (+wire2) : $unsigned(reg7))})};
      if ((~&($signed(((wire2 ? wire1 : (8'haa)) * {wire3, wire4})) == wire2)))
        begin
          reg10 <= ((-(8'hb6)) ^ (~^$unsigned((reg7[(3'h4):(2'h2)] & (-wire5)))));
          if (wire4[(1'h1):(1'h1)])
            begin
              reg11 <= wire1;
              reg12 <= ((~^reg6) ?
                  (wire0 ^~ $unsigned($signed($unsigned(wire0)))) : (|wire2));
            end
          else
            begin
              reg11 <= reg9;
            end
          reg13 <= (~&(8'ha0));
          if ($unsigned((((wire1[(1'h1):(1'h1)] ?
                  (+wire2) : $unsigned(wire0)) + ((~|reg7) ?
                  ((8'ha8) >>> reg11) : reg12[(2'h3):(1'h1)])) ?
              wire5 : $unsigned(reg13))))
            begin
              reg14 <= wire1;
            end
          else
            begin
              reg14 <= (wire5 >= $signed(reg7));
              reg15 <= $unsigned((8'h9f));
            end
        end
      else
        begin
          reg10 <= $signed($unsigned(((|{wire3, wire4}) ?
              reg13 : $unsigned($unsigned(reg10)))));
          reg11 <= $unsigned((^$unsigned({(wire3 & reg14),
              (reg6 ? reg8 : wire2)})));
          reg12 <= ((((8'hb1) ?
              reg7[(2'h2):(1'h0)] : wire0[(2'h2):(1'h0)]) ^ $unsigned(wire4)) ^~ $signed((^$signed((~wire5)))));
          reg13 <= (~wire1[(4'h8):(3'h6)]);
        end
    end
  assign wire16 = (~&({(~reg7)} <= $unsigned(wire5[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      reg17 <= $signed(wire0);
      if ((wire4 ?
          wire5[(5'h12):(4'hf)] : (^$signed((+(reg8 ? reg9 : wire4))))))
        begin
          reg18 <= reg9[(3'h5):(2'h3)];
          reg19 <= wire0[(2'h2):(1'h1)];
          reg20 <= $unsigned($unsigned($signed(((reg13 ?
              reg8 : wire2) ~^ $signed(reg6)))));
          reg21 <= ($signed(reg18[(4'hd):(4'hc)]) + reg10[(3'h7):(3'h6)]);
        end
      else
        begin
          reg18 <= $unsigned((8'ha7));
          reg19 <= reg12[(2'h2):(1'h0)];
          reg20 <= (~reg11[(1'h1):(1'h0)]);
        end
    end
  assign wire22 = reg7;
endmodule
