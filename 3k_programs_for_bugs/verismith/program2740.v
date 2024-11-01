module top
#(parameter param16 = ((^~({((8'hac) ~^ (8'ha6))} + (+(+(8'ha0))))) + ((8'hb2) ? ((8'ha4) ? (~^((8'hb8) ? (8'ha5) : (8'ha4))) : (((7'h41) ? (8'ha2) : (8'hb6)) ^~ ((8'h9c) ? (8'had) : (8'ha2)))) : (({(8'ha1)} ? ((8'hb0) << (8'hac)) : ((7'h44) + (8'ha0))) ? (((8'haa) ? (8'hba) : (8'hb4)) ? ((8'ha8) >>> (8'hb1)) : (~&(8'ha3))) : (^~((8'ha2) ? (8'ha0) : (8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire13,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (~$unsigned($signed((wire2 || {wire2}))));
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      if (wire3[(2'h2):(2'h2)])
        begin
          reg8 <= $signed(wire7[(3'h4):(2'h2)]);
          reg9 <= $unsigned((~&($unsigned(((7'h41) | reg8)) ?
              ($signed(wire1) <= wire4) : wire4[(2'h2):(1'h1)])));
          reg10 <= (&(reg8[(2'h2):(1'h0)] | wire6[(3'h4):(2'h3)]));
        end
      else
        begin
          reg8 <= ({{(((8'hbf) ^~ reg8) ?
                      (wire7 << wire6) : (wire5 ? wire3 : (8'h9d)))},
              $signed({reg8})} >= $unsigned($unsigned(wire0[(2'h3):(1'h1)])));
          reg9 <= (&wire2[(5'h15):(4'hb)]);
          reg10 <= wire7[(4'hc):(1'h1)];
          reg11 <= ((8'hae) ? wire6 : $signed(reg9[(5'h11):(4'hd)]));
          reg12 <= wire1[(3'h6):(1'h1)];
        end
    end
  assign wire13 = (8'haf);
  always
    @(posedge clk) begin
      reg14 <= {(~&(8'hae)),
          ($signed(($signed(wire5) ? reg11[(4'hc):(1'h0)] : $signed(wire7))) ?
              $signed((~&(wire2 & reg12))) : reg12)};
      reg15 <= reg8[(1'h0):(1'h0)];
    end
endmodule
