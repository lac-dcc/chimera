module top
#(parameter param21 = ((7'h40) && ({{((8'h9c) != (8'hba)), (-(8'h9c))}, (((8'h9e) > (8'hb0)) & ((8'ha0) >>> (8'ha5)))} ? (+((-(8'hb0)) ^~ ((8'hb5) ? (8'hba) : (8'hb4)))) : ({((8'hb6) ? (8'hb0) : (8'hb4))} - {((8'ha7) & (8'ha1))}))), 
parameter param22 = (^(-param21)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (wire2[(4'hc):(4'ha)] ?
                     $unsigned((~&(wire1 ?
                         (wire1 << wire4) : (^~wire3)))) : $unsigned(((!wire4) ?
                         {wire0} : wire3)));
  assign wire6 = wire5;
  assign wire7 = (((|((~&(8'h9f)) * $signed(wire5))) < ($signed(wire1) ?
                         {wire3[(4'h9):(3'h5)]} : ((8'ha1) * (|wire1)))) ?
                     wire6[(1'h1):(1'h0)] : (wire1[(1'h0):(1'h0)] << wire2[(3'h7):(3'h7)]));
  assign wire8 = (8'h9f);
  always
    @(posedge clk) begin
      if (({($unsigned($signed((8'hbc))) || wire7),
              ((~|$signed(wire8)) ? wire8 : $unsigned(wire7[(2'h2):(1'h0)]))} ?
          $signed($signed(wire5)) : ($signed(((wire4 ? wire8 : wire6) ?
              {wire2, wire0} : wire3[(4'hb):(4'h9)])) << wire7)))
        begin
          reg9 <= wire8[(1'h0):(1'h0)];
          reg10 <= wire3;
          reg11 <= (!wire2);
        end
      else
        begin
          reg9 <= wire5[(1'h1):(1'h0)];
          reg10 <= wire4[(1'h1):(1'h1)];
          reg11 <= (-$signed((($signed(wire0) - (8'ha4)) ?
              (reg11 ? (|wire1) : (wire7 ? wire3 : wire4)) : ($unsigned(wire5) ?
                  (^(8'hbd)) : $unsigned((8'hbc))))));
          if ({(~^$unsigned((~&(reg9 || (8'ha3)))))})
            begin
              reg12 <= $unsigned((($unsigned($unsigned((8'hbb))) ^ reg10[(3'h4):(1'h1)]) ?
                  ({$signed((7'h43))} ?
                      $unsigned((wire8 || wire4)) : ($signed(wire6) ?
                          ((8'h9d) > wire2) : $signed(wire1))) : $unsigned($unsigned(((8'hb0) ?
                      wire6 : wire0)))));
              reg13 <= (+$signed($unsigned($signed((reg11 ?
                  (8'hb8) : (8'ha3))))));
              reg14 <= wire4[(4'ha):(3'h4)];
            end
          else
            begin
              reg12 <= (8'h9e);
            end
        end
      if (reg10)
        begin
          if ((!(wire1 + $signed(reg14[(3'h4):(2'h3)]))))
            begin
              reg15 <= {(reg12 ?
                      {(~&$unsigned(wire4)),
                          (^~reg10)} : ((&(^~wire8)) > (+$signed(reg11))))};
              reg16 <= $signed((~|$unsigned(((reg10 - reg9) ?
                  (~(8'h9d)) : (+wire3)))));
              reg17 <= reg14[(2'h2):(1'h1)];
              reg18 <= ($unsigned($unsigned($unsigned((wire1 << (8'hb0))))) << wire0);
            end
          else
            begin
              reg15 <= wire1[(3'h6):(2'h3)];
              reg16 <= (wire6[(4'hc):(2'h3)] > (wire4 == reg12[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg15 <= $signed((reg17[(3'h7):(2'h2)] < wire7));
        end
    end
  assign wire19 = wire3;
  assign wire20 = reg12[(3'h4):(1'h1)];
endmodule
