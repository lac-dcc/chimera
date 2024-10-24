module top
#(parameter param19 = ((~^(7'h44)) ? {((((8'hbd) != (8'ha9)) ? ((8'haf) ? (8'h9d) : (8'hb0)) : ((8'h9c) >>> (8'hb2))) - ((~^(8'ha8)) ? ((7'h43) ? (8'hbe) : (8'hba)) : ((8'ha6) ? (8'ha8) : (8'hb0))))} : ((~|(~&((8'hb4) << (8'hb1)))) ? {(((8'ha8) * (8'ha4)) ? ((8'hb5) ? (8'h9c) : (7'h43)) : ((7'h40) != (8'haa)))} : ((+{(8'ha1), (8'hb0)}) & ((~(8'ha1)) ? ((8'hb3) > (8'h9c)) : ((8'hbc) ^ (8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned({((~|(8'hac)) <<< wire2[(2'h3):(1'h0)]),
                     $unsigned($signed(wire1))}));
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      if ((wire6 ? wire2[(2'h3):(2'h2)] : wire2))
        begin
          reg8 <= (+(|(7'h42)));
          reg9 <= {$unsigned((8'hbd))};
          reg10 <= $unsigned(wire5);
        end
      else
        begin
          reg8 <= ((!$unsigned(((wire1 ? wire0 : wire0) ?
              (wire6 >= (7'h41)) : (wire6 ?
                  wire7 : (8'ha3))))) != {wire1[(1'h0):(1'h0)]});
          reg9 <= {wire6};
          if ((($signed($signed($signed(reg9))) < (reg10 ?
              (-(wire7 <<< wire4)) : (~^{wire3}))) | $unsigned((+wire3[(2'h2):(1'h0)]))))
            begin
              reg10 <= $signed($unsigned(reg9));
              reg11 <= (+(+(({reg9, wire7} ?
                  (reg9 ? (8'h9e) : wire3) : (wire6 ?
                      (8'hbf) : wire0)) + $unsigned(((8'haf) ?
                  reg8 : wire1)))));
              reg12 <= ((wire5 ?
                  reg10 : wire6[(4'hd):(2'h2)]) < (($signed($signed((8'hb7))) && (~^wire5[(3'h4):(1'h1)])) == ($signed($unsigned(wire1)) * $signed(wire7[(3'h4):(1'h1)]))));
              reg13 <= (-($signed({wire7}) - $unsigned(wire7)));
              reg14 <= (~$unsigned(((~&((7'h44) >> wire7)) ?
                  $unsigned($signed(wire3)) : reg11[(4'h8):(4'h8)])));
            end
          else
            begin
              reg10 <= (~^$unsigned((^(~|(wire3 ? (8'hbb) : reg13)))));
            end
        end
    end
  assign wire15 = (({$signed((wire3 ? wire1 : reg12))} ?
                          (reg14[(3'h7):(1'h1)] != (|(wire1 ?
                              wire4 : reg9))) : $signed((wire1[(1'h0):(1'h0)] ?
                              $unsigned(wire2) : $unsigned(wire3)))) ?
                      $unsigned(wire6) : wire5[(1'h0):(1'h0)]);
  assign wire16 = (((8'ha9) ~^ ((^wire1) << (((8'had) ?
                      reg10 : reg11) - wire3[(1'h1):(1'h0)]))) + (({wire3} == $signed((-wire6))) ?
                      ({(~reg9),
                          (^wire3)} ~^ wire6) : (reg10[(4'ha):(2'h2)] << (~&reg9[(2'h3):(2'h2)]))));
  assign wire17 = $signed(wire15[(3'h6):(1'h1)]);
  assign wire18 = (((~($signed((8'ha5)) ? wire3[(3'h4):(3'h4)] : (~|(8'haa)))) ?
                          wire2 : ((wire3[(1'h0):(1'h0)] << (wire7 <<< reg14)) ^ $signed((~wire16)))) ?
                      (+$signed($unsigned($unsigned((8'ha9))))) : $signed((reg13[(2'h2):(1'h1)] >> ($unsigned(reg14) ?
                          (!wire3) : wire1[(2'h2):(1'h0)]))));
endmodule
