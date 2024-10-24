module top
#(parameter param20 = (({((^(8'hbb)) ? ((8'hbe) ? (8'hb8) : (8'hbb)) : (+(8'ha8)))} ? (~|(!((8'hb5) <= (8'ha9)))) : (8'hac)) ? (~^((!((8'ha7) <= (8'ha3))) ^~ (|((8'hbc) >> (8'ha4))))) : {(^~((|(8'haf)) ? {(7'h40)} : {(8'hbe), (8'hba)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
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
  assign wire4 = (^$unsigned($signed(wire3[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg5 <= $unsigned((~|wire3));
      reg6 <= wire0[(4'he):(4'h9)];
      reg7 <= wire0;
      if ((8'h9f))
        begin
          reg8 <= {$unsigned((^$unsigned(reg6[(4'h9):(2'h2)])))};
        end
      else
        begin
          reg8 <= ($signed(((8'hb7) ^~ reg6[(4'hf):(1'h0)])) ~^ reg8);
          if (wire4)
            begin
              reg9 <= wire4[(4'hc):(4'ha)];
            end
          else
            begin
              reg9 <= reg6[(1'h1):(1'h1)];
            end
          reg10 <= (-wire0);
          if (({$unsigned($unsigned((reg9 ?
                  wire1 : wire3)))} - (^wire1[(4'hf):(4'hd)])))
            begin
              reg11 <= reg10;
              reg12 <= $signed((8'hb3));
              reg13 <= reg9;
            end
          else
            begin
              reg11 <= reg5;
              reg12 <= wire3;
              reg13 <= reg8[(3'h7):(2'h3)];
            end
          reg14 <= $signed({reg7[(3'h7):(3'h5)]});
        end
    end
  assign wire15 = wire2[(1'h1):(1'h0)];
  assign wire16 = {($unsigned($unsigned((reg11 ? wire0 : reg14))) ?
                          $signed(wire0) : $unsigned(reg10[(5'h12):(2'h3)])),
                      $signed($signed(reg10[(4'he):(4'h9)]))};
  assign wire17 = $unsigned((wire1[(3'h5):(2'h2)] ?
                      wire4 : $signed(reg10[(4'hc):(3'h4)])));
  assign wire18 = $signed((({(~^(8'ha8))} ?
                          ((8'hb4) != (reg14 <<< wire17)) : {reg11[(4'he):(4'ha)]}) ?
                      $signed($unsigned(wire15)) : ((-(wire16 * reg10)) ?
                          $signed($unsigned((8'hb6))) : (&wire2[(2'h3):(1'h0)]))));
  assign wire19 = wire4[(5'h12):(5'h10)];
endmodule
