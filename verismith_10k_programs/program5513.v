module top
#(parameter param17 = ((((((8'haa) ? (8'hab) : (8'ha0)) <<< (~|(8'hb1))) ? {(~&(8'hb7)), ((8'ha8) ? (8'hb6) : (8'ha3))} : ({(8'haa)} ? (&(8'ha2)) : ((8'ha2) ? (7'h44) : (8'ha3)))) == (~^(((8'ha5) ? (8'hb1) : (8'ha7)) ? ((8'hae) ^ (8'hac)) : {(8'hae), (8'h9d)}))) - {((^~(^(7'h40))) ? (((8'hb1) ^~ (8'ha8)) >>> ((7'h42) ? (8'ha2) : (8'ha7))) : (((8'ha0) ? (8'hbb) : (8'haf)) ? (|(8'ha4)) : (+(7'h41)))), (8'hb9)}), 
parameter param18 = (^param17))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire14,
                 wire13,
                 reg15,
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
      if ((&{(wire3 <<< ((+wire3) + $unsigned(wire0))), {wire0}}))
        begin
          reg4 <= (-(8'haa));
          reg5 <= (!$signed(($signed({reg4}) ^~ $signed((8'hb4)))));
          if ($signed(({{wire3[(4'h9):(3'h4)], (wire1 >>> (8'hbd))}, wire2} ?
              (8'hb9) : $unsigned($signed((reg5 ? wire3 : (7'h43)))))))
            begin
              reg6 <= (-$signed(reg4));
            end
          else
            begin
              reg6 <= $signed($signed((reg6[(3'h7):(2'h3)] > ((wire1 & wire1) ?
                  (8'hba) : $unsigned((7'h43))))));
              reg7 <= (~&wire2);
              reg8 <= ($signed(reg5[(5'h10):(5'h10)]) <= ({$signed($signed(reg6))} ?
                  $unsigned((~|$signed(reg6))) : $signed((wire3 ?
                      wire3 : $signed(wire2)))));
            end
          reg9 <= (8'hb2);
          reg10 <= (8'hab);
        end
      else
        begin
          reg4 <= (~(reg9[(1'h0):(1'h0)] ? $signed(reg4) : wire1));
        end
      reg11 <= (~((8'hb1) + {(8'ha2), $signed(wire0)}));
    end
  always
    @(posedge clk) begin
      reg12 <= reg6[(5'h10):(4'he)];
    end
  assign wire13 = ($signed($unsigned(($unsigned(reg12) ?
                          $signed(reg12) : (reg9 ? (8'ha8) : wire2)))) ?
                      reg8[(3'h6):(2'h3)] : {reg4[(5'h10):(4'h8)]});
  assign wire14 = (((+wire2[(4'ha):(3'h6)]) && reg9[(1'h0):(1'h0)]) ?
                      ($signed(((wire3 ~^ reg12) ?
                          {reg11} : (~^reg12))) * (8'ha0)) : $signed((($unsigned(reg12) < $unsigned(reg6)) ?
                          (reg9 ?
                              wire2[(3'h5):(1'h0)] : $signed(reg8)) : $signed((8'ha1)))));
  always
    @(posedge clk) begin
      reg15 <= $unsigned($unsigned(reg7[(1'h0):(1'h0)]));
    end
  assign wire16 = $signed(($signed(({wire2} <<< $unsigned(wire0))) ?
                      {(^(wire3 ? reg15 : wire3)),
                          reg4[(2'h3):(2'h3)]} : reg10));
endmodule
