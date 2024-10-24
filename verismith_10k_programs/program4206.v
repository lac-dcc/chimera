module top
#(parameter param19 = {{(8'ha0), {((~^(8'hb0)) ? (!(8'hb9)) : (8'hb0)), (((8'ha6) ? (8'ha6) : (8'hb6)) ? ((8'hbb) ^ (8'hae)) : ((8'hb0) < (8'ha9)))}}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 reg18,
                 reg17,
                 reg16,
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
      reg4 <= (((wire3[(3'h7):(2'h2)] + $signed((wire0 <= wire0))) ?
              $unsigned(wire2[(1'h1):(1'h0)]) : ((wire2 ?
                  (wire2 ?
                      (8'hb5) : wire1) : (~wire2)) || $unsigned($signed(wire2)))) ?
          wire1 : {$signed(wire0)});
      reg5 <= $unsigned($signed($unsigned($signed($unsigned(wire1)))));
      if (reg5)
        begin
          reg6 <= $signed((~|wire1));
          if ($unsigned(($unsigned(reg6) ?
              (~^(wire3 ?
                  $unsigned(wire1) : {wire3,
                      (8'hb2)})) : $unsigned($unsigned((reg6 != reg5))))))
            begin
              reg7 <= $unsigned({reg4[(1'h1):(1'h0)]});
              reg8 <= $signed($unsigned(reg4[(1'h0):(1'h0)]));
              reg9 <= {(!$unsigned((wire0 ~^ (wire2 ? reg8 : reg8))))};
            end
          else
            begin
              reg7 <= $signed(((reg8 ?
                      $signed(wire3[(3'h7):(3'h5)]) : $unsigned(((8'h9e) ?
                          (8'ha4) : (8'hac)))) ?
                  {(8'ha8), reg6[(3'h6):(2'h2)]} : $signed({{(7'h44)}})));
              reg8 <= ({$signed((~^reg5)), (-reg6)} ?
                  $unsigned($signed($signed(reg4))) : $signed(($unsigned((reg5 ?
                      reg7 : reg6)) ^~ $unsigned((reg7 ? wire2 : reg5)))));
              reg9 <= (7'h40);
            end
          reg10 <= wire3[(3'h5):(2'h3)];
        end
      else
        begin
          reg6 <= reg5;
          reg7 <= ((wire0[(3'h6):(1'h1)] < reg6) > (+reg6));
          reg8 <= (^~$signed($signed(($unsigned(reg8) ?
              reg9 : $signed(reg6)))));
          reg9 <= ((|((8'h9c) == $unsigned(wire1))) + (reg5 ?
              wire0 : $signed((~|reg8))));
        end
      reg11 <= ($signed((8'hbc)) * (($unsigned((~reg6)) ^ (!$unsigned(wire2))) ?
          $signed(reg6) : (((wire2 ? reg10 : reg7) ?
              $unsigned(wire3) : (reg8 ?
                  wire1 : reg4)) ^ reg6[(1'h0):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg12 <= wire1;
      reg13 <= {((reg8 ? wire1 : $unsigned((reg5 ~^ (8'ha3)))) ?
              (^(-(reg6 < reg10))) : reg4),
          $signed(reg11[(3'h4):(1'h0)])};
    end
  assign wire14 = {reg10[(3'h5):(2'h3)]};
  assign wire15 = wire2[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= $unsigned($signed(wire0));
      reg17 <= (~^(wire15 > reg12[(3'h6):(1'h0)]));
      reg18 <= $signed((reg5[(1'h1):(1'h1)] < (^~(^(reg6 ? wire15 : wire14)))));
    end
endmodule
