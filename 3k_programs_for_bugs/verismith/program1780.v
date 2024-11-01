module top
#(parameter param24 = (-(~((((8'ha4) * (8'ha8)) * {(8'h9c), (8'hab)}) ? (~|((8'hb1) & (8'h9f))) : (^~((8'hb4) >= (8'ha0)))))), 
parameter param25 = (param24 >= (~|((^~(-param24)) ? (!(param24 & param24)) : ((-param24) ? {param24, param24} : param24)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire10,
                 wire9,
                 wire8,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire0[(3'h6):(3'h6)] ?
          wire0 : ($unsigned(($unsigned(wire1) ?
              wire2 : $unsigned(wire2))) * wire3));
      reg5 <= ($signed({(!(wire1 ^~ wire2))}) ?
          wire3[(3'h5):(1'h1)] : $unsigned(((+(^~reg4)) ?
              $unsigned($unsigned(wire2)) : wire0[(1'h0):(1'h0)])));
      reg6 <= wire1[(3'h7):(2'h2)];
      reg7 <= $unsigned(wire1[(4'hf):(4'hc)]);
    end
  assign wire8 = ({reg7,
                         (^~(wire0[(4'h8):(2'h3)] ?
                             ((8'hbd) ?
                                 (8'hb4) : wire1) : wire0[(4'hf):(1'h1)]))} ?
                     reg6 : $unsigned(wire0));
  assign wire9 = (~^(~|$signed(({wire3, reg5} && $signed(wire3)))));
  assign wire10 = $signed(($unsigned(reg6) < (wire3[(3'h7):(3'h7)] ?
                      {wire9} : wire1)));
  always
    @(posedge clk) begin
      reg11 <= (wire8 ? (wire10[(3'h5):(3'h4)] | (&wire2)) : wire10);
      if (($unsigned((|$unsigned((^wire2)))) * (-wire8)))
        begin
          reg12 <= wire2;
          reg13 <= $signed($signed((8'hb4)));
        end
      else
        begin
          reg12 <= reg11[(2'h2):(2'h2)];
          if (wire1)
            begin
              reg13 <= (wire0[(4'hf):(3'h5)] ?
                  ($signed($signed($unsigned(reg5))) ?
                      ($signed(wire9) >>> wire10[(3'h5):(1'h1)]) : reg5[(2'h2):(1'h1)]) : $unsigned((((+reg12) + ((8'hbe) ?
                      wire2 : reg5)) << ((wire3 | wire10) ^ wire3[(1'h1):(1'h0)]))));
              reg14 <= (-(wire2 ?
                  ({reg13[(4'h8):(2'h3)], $signed(reg5)} ?
                      $unsigned(reg4) : reg7[(2'h2):(1'h0)]) : wire1));
              reg15 <= (~^($signed($unsigned($signed(reg13))) ?
                  (wire9 ?
                      (~^$unsigned(reg11)) : ({wire3} >>> (wire10 | (8'hb2)))) : $unsigned($unsigned(reg7))));
              reg16 <= wire2;
              reg17 <= reg4[(2'h2):(1'h0)];
            end
          else
            begin
              reg13 <= (wire2 ? reg11 : reg4[(1'h0):(1'h0)]);
            end
          reg18 <= ((!$unsigned($signed((!reg14)))) > ((~&reg12[(3'h5):(3'h4)]) != {({(7'h41),
                      wire0} ?
                  (reg11 ? reg13 : (8'hb3)) : (wire1 != reg11))}));
        end
      reg19 <= ({reg5, (~^reg16[(1'h0):(1'h0)])} ^ {$signed($signed(reg13)),
          (reg15 < ($signed(wire3) > {reg14, reg12}))});
    end
  assign wire20 = wire0[(3'h6):(3'h5)];
  assign wire21 = ((8'hba) >>> $signed($unsigned(reg6)));
  assign wire22 = $signed($signed($signed($unsigned((wire10 <<< reg4)))));
  assign wire23 = ({(((wire1 ? reg17 : reg16) ?
                                  (reg13 ? wire10 : reg19) : $signed(wire0)) ?
                              $signed($unsigned(wire2)) : $signed($unsigned(reg4)))} ?
                      $signed((~({wire10, reg16} ?
                          $unsigned((8'ha4)) : $signed(wire20)))) : (~^((8'hb5) ?
                          wire8 : wire20)));
endmodule
