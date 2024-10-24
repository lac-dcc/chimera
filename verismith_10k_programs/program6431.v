module top
#(parameter param17 = (8'h9f), 
parameter param18 = (((~&{{param17}}) || (param17 ? param17 : ((param17 ~^ param17) ? (param17 << (8'had)) : (~(8'hb9))))) + {param17}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire9,
                 wire8,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((8'hb9));
      reg5 <= ((!wire1[(2'h3):(1'h1)]) ?
          wire2[(4'hc):(4'h8)] : wire1[(1'h0):(1'h0)]);
      reg6 <= $unsigned($signed(($signed($unsigned(wire0)) <<< reg4[(1'h1):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg7 <= $signed({(($unsigned(reg6) + reg4[(2'h3):(1'h1)]) ?
              wire3[(4'hd):(3'h5)] : $signed((wire0 ? wire1 : reg5))),
          reg4[(4'h9):(3'h4)]});
    end
  assign wire8 = ($signed(reg6[(4'h8):(3'h7)]) ? wire3 : (+reg6));
  assign wire9 = reg6;
  always
    @(posedge clk) begin
      reg10 <= $unsigned($unsigned($signed(wire8[(3'h7):(1'h1)])));
      reg11 <= (($signed((-(^wire8))) ?
          $signed({$signed(reg4)}) : wire0) || $unsigned($signed(((-reg7) ?
          (wire8 & reg4) : ((8'hbd) ? reg7 : reg7)))));
      reg12 <= reg11;
      reg13 <= reg5[(4'h9):(2'h2)];
      reg14 <= (^~$unsigned($unsigned({(wire8 ? (8'hae) : reg11)})));
    end
  assign wire15 = (~(wire8[(1'h1):(1'h0)] ?
                      wire0 : (reg7 + ($unsigned(wire9) ?
                          $unsigned(reg4) : reg13))));
  assign wire16 = reg14[(3'h6):(3'h4)];
endmodule
