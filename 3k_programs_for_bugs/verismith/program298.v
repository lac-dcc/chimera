module top
#(parameter param14 = {{(-((^~(8'hba)) ^ ((8'hb3) ? (8'hbf) : (8'ha4)))), ((~|{(8'hb0), (8'hb6)}) ? (^((8'had) >>> (8'hbe))) : (((8'had) ? (8'h9c) : (8'hba)) ? (!(8'haa)) : (^~(8'h9f))))}, (({(~(8'h9f)), (^(8'hac))} ? (((8'ha6) > (8'hb8)) ? (~&(8'haa)) : {(8'hb4)}) : (+((7'h41) - (7'h40)))) ? {((-(8'ha3)) ? (-(8'ha7)) : (+(8'ha5)))} : (!(|((8'hb7) | (8'haa)))))}, 
parameter param15 = ({((8'hbb) ? ({param14, param14} ~^ (param14 >> (8'hbe))) : (+param14))} <= (~&(&(|{param14, param14})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~|wire0[(1'h0):(1'h0)]);
  assign wire5 = $signed(wire2);
  assign wire6 = (^(-wire2));
  always
    @(posedge clk) begin
      reg7 <= wire0[(1'h1):(1'h0)];
      if (wire6[(1'h0):(1'h0)])
        begin
          reg8 <= $signed((wire4 ~^ $unsigned(((+wire5) < (^wire5)))));
          reg9 <= reg7[(5'h11):(5'h11)];
          reg10 <= ({((((8'ha1) ? reg7 : wire6) == ((8'ha9) >> wire3)) ?
                      (!((8'haa) ? reg7 : (8'hbb))) : $signed((|wire5))),
                  (~^((8'hbf) ^ reg9[(2'h2):(2'h2)]))} ?
              wire6[(1'h0):(1'h0)] : ($unsigned(((-wire2) ~^ {wire5, reg8})) ?
                  $unsigned(wire4) : (&reg8)));
          reg11 <= $signed($unsigned(($unsigned(wire0[(1'h0):(1'h0)]) ?
              $unsigned($signed(reg8)) : $unsigned($signed(wire2)))));
          reg12 <= ((&{$unsigned((reg10 | wire3))}) ?
              wire5[(1'h1):(1'h0)] : reg10);
        end
      else
        begin
          reg8 <= reg8;
          reg9 <= ((reg7[(3'h4):(3'h4)] ?
                  (^$signed({wire6, (7'h42)})) : ($signed((reg8 ?
                      (8'hb0) : wire2)) > (|$signed(reg12)))) ?
              $signed((reg11[(2'h3):(1'h0)] ?
                  wire0[(1'h0):(1'h0)] : $signed(wire0))) : (reg11 ?
                  reg8[(1'h0):(1'h0)] : $signed(((wire3 ? (8'hbb) : wire5) ?
                      ((8'haa) == reg7) : $unsigned(reg10)))));
          if ($signed((^(wire5 ?
              (reg7[(1'h1):(1'h1)] <= $unsigned(reg12)) : $signed(((8'hbe) << reg9))))))
            begin
              reg10 <= (-(reg9[(1'h1):(1'h0)] != (^{(reg12 + (8'hbb))})));
              reg11 <= (8'hb4);
            end
          else
            begin
              reg10 <= (+reg10);
              reg11 <= ((wire1 ?
                      {wire0[(1'h0):(1'h0)],
                          $unsigned(reg11)} : $unsigned((|$unsigned(wire1)))) ?
                  ($unsigned(wire5[(2'h2):(2'h2)]) <<< reg9) : wire5[(1'h1):(1'h0)]);
              reg12 <= {wire2[(4'h9):(3'h5)],
                  (reg8[(4'hb):(4'h9)] ?
                      ({$signed((8'hae)), $unsigned(reg8)} ?
                          $signed((wire0 ?
                              reg12 : reg12)) : (~(^~reg11))) : (+{(wire0 ?
                              reg9 : (8'haa))}))};
            end
        end
      reg13 <= wire5;
    end
endmodule
