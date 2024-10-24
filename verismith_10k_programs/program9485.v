module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ($signed(wire0) ?
                     (^~$signed($signed(wire3))) : wire0[(5'h10):(3'h5)]);
  assign wire6 = wire2[(5'h13):(5'h13)];
  assign wire7 = $signed({{wire6, ($unsigned(wire4) - $signed((7'h40)))},
                     $signed(wire3[(3'h4):(1'h0)])});
  assign wire8 = wire5[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg9 <= $signed($unsigned((7'h41)));
      if (wire3[(2'h2):(1'h1)])
        begin
          reg10 <= (8'ha6);
          reg11 <= ((+$signed($signed(wire1))) ?
              ($unsigned(reg10[(4'hd):(2'h2)]) ?
                  ($signed(((8'hbc) == wire3)) ?
                      $signed(wire5[(1'h0):(1'h0)]) : reg9) : (8'h9e)) : $unsigned((wire4[(2'h2):(1'h0)] ?
                  {wire7, wire2} : reg10)));
          reg12 <= wire4;
          if ((wire2 >> {$unsigned(wire4[(1'h1):(1'h1)]),
              (wire7 ? (~^{(8'hac), reg12}) : $unsigned($signed((8'hb6))))}))
            begin
              reg13 <= $signed($signed(((~^{reg9, (8'hae)}) ?
                  $unsigned(wire6[(1'h0):(1'h0)]) : (^(-reg11)))));
              reg14 <= ((~|(~|wire2[(3'h7):(3'h6)])) * wire3[(1'h0):(1'h0)]);
              reg15 <= reg11[(1'h1):(1'h1)];
            end
          else
            begin
              reg13 <= ((-reg9[(4'h8):(2'h2)]) << ($signed($signed({reg15})) ?
                  ((|(wire7 ^~ wire3)) ?
                      $signed($unsigned(wire1)) : (reg15 & (~&reg9))) : $signed((reg11 ?
                      (reg12 ? wire8 : wire1) : reg14[(4'h8):(2'h2)]))));
            end
        end
      else
        begin
          reg10 <= (((&wire6) ^ $signed((8'hac))) >= $signed($signed(reg11)));
          reg11 <= reg14[(2'h2):(1'h0)];
          reg12 <= (reg11 ?
              $unsigned(((^~(wire5 ?
                  (7'h40) : reg12)) < reg10[(4'ha):(4'h9)])) : reg11);
          reg13 <= wire0;
          reg14 <= {$unsigned(($unsigned(((8'hbc) <= reg11)) ~^ reg10[(3'h4):(1'h0)])),
              (reg13 ? {({wire3} ^ (wire2 && wire1))} : wire8[(2'h2):(1'h0)])};
        end
    end
endmodule
