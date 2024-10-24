module top
#(parameter param17 = (-((-(((8'hb3) ? (8'hb9) : (8'hb4)) ? {(8'hae), (8'hb2)} : {(8'hbd)})) & (({(7'h42)} ? ((8'hbb) >> (8'hb9)) : ((8'haf) ? (8'ha8) : (8'hbc))) ~^ ((^(8'hac)) || (+(7'h40)))))), 
parameter param18 = param17)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned((~^(|wire4)));
  assign wire6 = (^~(($signed(wire2[(4'hf):(2'h3)]) < wire2[(3'h7):(2'h3)]) ?
                     wire0[(2'h2):(1'h0)] : ((~^$unsigned(wire1)) ?
                         wire1[(2'h3):(1'h1)] : $signed($signed(wire1)))));
  assign wire7 = wire6[(4'ha):(4'h8)];
  assign wire8 = $unsigned($signed($signed(wire0[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg9 <= $unsigned($unsigned($unsigned(((wire4 ?
          wire7 : wire1) ~^ wire0))));
      reg10 <= $unsigned($unsigned(((wire6[(4'h9):(1'h1)] ^ $unsigned(wire2)) ?
          (wire0[(3'h4):(3'h4)] - (+wire6)) : wire6)));
      if (wire0)
        begin
          reg11 <= {wire7[(3'h5):(3'h4)],
              ($signed({$unsigned(wire6), (reg10 ? wire2 : (8'hba))}) ?
                  (($signed(wire2) >> (wire4 >> wire1)) ?
                      {wire2[(4'ha):(3'h7)]} : wire8) : $signed({(~&wire3),
                      ((8'hab) ~^ wire5)}))};
          reg12 <= $unsigned(wire7[(5'h10):(4'hf)]);
        end
      else
        begin
          reg11 <= reg12;
          reg12 <= (({(8'hb5), wire8} ?
              $signed(reg11) : ($signed($signed(reg11)) ?
                  $signed($signed(wire6)) : {(|reg10)})) << (|(~^((wire1 ?
              wire2 : reg11) <= reg9[(1'h1):(1'h0)]))));
          reg13 <= (|(-($signed((wire5 ? wire2 : (8'hb9))) ?
              (!$signed((8'ha3))) : {$unsigned(wire6), (~|(8'haf))})));
          reg14 <= (~^$signed($signed(reg13[(3'h7):(1'h0)])));
        end
      reg15 <= $unsigned((^(reg11[(1'h1):(1'h0)] ^~ reg14[(4'h9):(2'h3)])));
    end
  assign wire16 = wire0[(3'h6):(3'h4)];
endmodule
