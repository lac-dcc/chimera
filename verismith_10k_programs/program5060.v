module top
#(parameter param16 = (({{(^~(7'h43)), (+(8'ha7))}} != (&({(8'ha5)} && (~(8'hab))))) >>> (&((((8'hbd) ? (8'ha2) : (8'ha4)) ? ((8'hb3) < (7'h41)) : ((8'hbd) ? (8'ha9) : (7'h42))) ? (7'h42) : {((8'ha1) ? (8'ha3) : (8'hae))}))), 
parameter param17 = (8'hac))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire9,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {$signed(($signed(wire1[(4'hb):(3'h4)]) != wire3))};
      if ($unsigned($unsigned((($signed(wire1) ?
              $unsigned(wire3) : $signed(wire3)) ?
          $signed(wire3) : (-((8'ha0) ? (8'h9e) : wire1))))))
        begin
          reg5 <= (^~$unsigned($signed(wire3[(1'h0):(1'h0)])));
        end
      else
        begin
          reg5 <= $signed((~$signed({(~|reg5)})));
          reg6 <= $unsigned(wire1[(2'h3):(1'h1)]);
          reg7 <= $unsigned(reg4);
          reg8 <= $unsigned((~&($unsigned(wire3[(1'h0):(1'h0)]) ?
              wire3 : $signed((8'ha1)))));
        end
    end
  assign wire9 = reg8;
  assign wire10 = (wire2[(2'h3):(2'h3)] ? wire9 : reg5);
  always
    @(posedge clk) begin
      reg11 <= (~^(wire0[(1'h0):(1'h0)] ?
          $unsigned($signed(((8'hac) | (8'ha2)))) : $signed(((wire3 ?
                  wire3 : reg6) ?
              reg5[(4'h8):(3'h5)] : (wire3 ? reg5 : reg8)))));
      reg12 <= $signed(($signed(wire10) ?
          $signed(((reg4 ? reg11 : wire10) ?
              (reg6 ^~ reg6) : $signed(reg5))) : $unsigned($signed(((8'hab) ?
              reg11 : wire1)))));
    end
  assign wire13 = (reg11 >= {wire10});
  assign wire14 = $unsigned(wire0[(4'h9):(3'h5)]);
  assign wire15 = wire13;
endmodule
