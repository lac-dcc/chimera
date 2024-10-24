module top
#(parameter param20 = {(((~|{(8'hb4), (8'ha4)}) ? (~(~^(8'ha3))) : {(~&(8'haa))}) ? (((8'hbb) ^ ((8'ha1) < (8'haf))) != {((8'ha9) ? (8'h9c) : (8'ha9)), ((8'hac) ^ (8'hab))}) : (((!(7'h43)) ? ((8'h9f) ^~ (8'hb4)) : {(8'ha4)}) | (^~((8'hbb) ? (8'ha5) : (8'hbd))))), (((((8'hbe) & (8'haf)) ? (-(8'ha7)) : {(8'hac), (8'hba)}) ? (|{(8'hbd), (8'ha7)}) : (^~{(8'hb6)})) >= (+(((8'hb3) >= (8'hbc)) ? {(8'hbc), (8'hb9)} : ((8'hb3) ? (8'hae) : (8'haf)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire9,
                 wire8,
                 wire7,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (({$unsigned({wire2}), ({wire0} ? wire2 : $signed(wire3))} ?
          wire0[(4'hb):(3'h7)] : {$signed(wire2[(2'h2):(1'h1)]),
              $unsigned(wire2)}) << wire2[(4'hb):(4'h8)]);
      reg5 <= (reg4 >>> (~(8'ha1)));
      reg6 <= (-(wire0[(3'h5):(2'h2)] ?
          $unsigned(wire1[(4'hc):(1'h1)]) : wire0[(4'hd):(4'hb)]));
    end
  assign wire7 = (reg5[(3'h5):(1'h1)] ?
                     (&$signed((wire2[(1'h1):(1'h1)] ?
                         (wire1 ?
                             reg6 : wire2) : (~(8'h9f))))) : $unsigned((reg6[(2'h3):(2'h2)] && wire0[(2'h2):(2'h2)])));
  assign wire8 = ($signed($signed($unsigned($unsigned(reg6)))) ?
                     $unsigned({$unsigned(((8'hb1) ? (8'ha6) : (8'hb2))),
                         (8'hbc)}) : $unsigned(reg4[(1'h0):(1'h0)]));
  assign wire9 = (~$unsigned((((wire2 ? reg5 : wire1) ^ (~&wire0)) ?
                     wire3[(1'h0):(1'h0)] : $unsigned((~|reg6)))));
  always
    @(posedge clk) begin
      reg10 <= wire7;
      reg11 <= (((~^wire1[(1'h1):(1'h1)]) == $unsigned(wire9)) ?
          (^~reg10[(3'h4):(1'h0)]) : (!(!reg5[(2'h2):(2'h2)])));
      if (wire8[(4'h9):(2'h3)])
        begin
          reg12 <= ((reg4[(2'h2):(1'h0)] >> reg6) ?
              ($unsigned((reg4 ?
                  {wire2,
                      (8'haf)} : (wire3 || wire9))) > $signed($signed((^reg10)))) : ((((wire3 << (8'hac)) <<< wire0) ?
                      $unsigned((wire3 && wire1)) : wire7[(2'h3):(1'h0)]) ?
                  wire2 : wire1[(2'h3):(1'h1)]));
          reg13 <= (reg10 ~^ ($signed((&$signed(reg5))) ?
              wire3[(3'h6):(3'h5)] : reg5));
        end
      else
        begin
          reg12 <= $unsigned((($unsigned($unsigned((7'h44))) ?
              $unsigned(reg10[(1'h0):(1'h0)]) : $unsigned($signed(reg6))) >= ($signed(reg5) ?
              ((wire2 >> wire3) ? (~^wire9) : $signed(reg10)) : reg10)));
        end
      if ((!$unsigned($signed(wire0))))
        begin
          reg14 <= $signed((^wire1));
          reg15 <= reg11;
          reg16 <= $signed(((reg12[(3'h6):(1'h0)] ^~ (~^{reg12, wire9})) ?
              $signed(wire3) : $unsigned($signed((-(8'ha2))))));
          reg17 <= {(^~$signed(reg12[(3'h5):(3'h4)]))};
        end
      else
        begin
          reg14 <= $signed($unsigned(reg17[(1'h1):(1'h1)]));
        end
    end
  assign wire18 = $signed((8'haa));
  assign wire19 = $unsigned((($unsigned($unsigned(wire0)) ?
                      $unsigned((reg10 ?
                          wire9 : wire0)) : (-$unsigned(reg14))) - ((~$signed(reg11)) > reg4[(4'h8):(3'h6)])));
endmodule
