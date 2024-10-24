module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3;
    end
  assign wire6 = (wire1 <= wire1[(3'h4):(2'h2)]);
  assign wire7 = (((8'ha5) * (wire6 == (wire0 ~^ reg5))) <<< wire4[(1'h0):(1'h0)]);
  assign wire8 = (wire1[(1'h0):(1'h0)] | wire6);
  assign wire9 = $unsigned((^$unsigned(($unsigned(wire1) >>> $signed(wire0)))));
  always
    @(posedge clk) begin
      reg10 <= wire2[(4'h8):(3'h4)];
      reg11 <= (+$unsigned(wire1[(3'h4):(2'h2)]));
      reg12 <= reg11[(3'h4):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire3[(3'h4):(3'h4)]))
        begin
          reg13 <= $signed((|wire0[(1'h0):(1'h0)]));
          if (($signed(wire1[(1'h1):(1'h1)]) ? reg10 : $unsigned(reg10)))
            begin
              reg14 <= wire0;
              reg15 <= (8'hb6);
            end
          else
            begin
              reg14 <= wire8;
              reg15 <= (!$unsigned((|wire2)));
            end
          reg16 <= (($unsigned(($signed(wire1) - $unsigned((7'h42)))) ?
                  (8'ha3) : ((~&reg14) ?
                      {{reg14, wire9}, $signed(reg11)} : wire1)) ?
              wire4[(3'h7):(3'h4)] : wire6[(4'h8):(3'h5)]);
          reg17 <= (~reg16);
          reg18 <= ((-reg10) ~^ ({wire2[(3'h4):(2'h2)]} ^ {(reg15 >> reg12)}));
        end
      else
        begin
          if ((wire8[(2'h2):(2'h2)] < ((wire7[(1'h0):(1'h0)] ?
                  {(~&reg10), reg16[(3'h4):(1'h1)]} : {(~&(7'h41)),
                      (~^(8'ha5))}) ?
              (8'hb3) : $signed($signed($signed(wire4))))))
            begin
              reg13 <= (8'hbd);
              reg14 <= $unsigned((8'h9e));
              reg15 <= {(((|(reg18 ? wire4 : (8'h9e))) - ({wire8,
                          (8'hb2)} >> wire6[(1'h0):(1'h0)])) ?
                      (|$unsigned($signed(wire8))) : $unsigned((-{reg12}))),
                  reg13[(4'h9):(2'h2)]};
              reg16 <= wire4;
            end
          else
            begin
              reg13 <= wire6[(3'h4):(1'h0)];
            end
          reg17 <= (+wire8[(3'h6):(1'h0)]);
        end
      reg19 <= (reg16[(3'h5):(3'h4)] | wire6[(4'hd):(4'h9)]);
    end
  assign wire20 = reg5[(5'h11):(4'he)];
endmodule
