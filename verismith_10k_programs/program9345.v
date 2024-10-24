module top
#(parameter param19 = ((|(|(((8'hb5) ? (8'ha0) : (8'h9c)) == ((8'h9e) ? (8'hab) : (8'ha0))))) ? {{(+(8'hb4)), {((7'h42) ? (8'hbb) : (8'hb9))}}} : {(((!(8'ha3)) ? ((8'haa) ? (8'ha9) : (8'ha9)) : ((8'hb5) != (7'h41))) && (((8'hb9) & (7'h44)) ~^ ((8'ha0) | (8'hb3))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ((~^wire3[(5'h12):(2'h3)]) ?
                     ((wire1[(2'h3):(1'h0)] * $unsigned({wire0, wire0})) ?
                         $signed($signed(wire2[(3'h5):(1'h1)])) : (wire3 & (^$signed((8'hbe))))) : wire1);
  assign wire5 = ($signed(wire1[(1'h0):(1'h0)]) ~^ wire1);
  assign wire6 = (wire2 == wire3);
  always
    @(posedge clk) begin
      reg7 <= (wire1[(1'h1):(1'h0)] <= (7'h40));
      if ({{({$unsigned((8'ha8))} ?
                  {$unsigned(wire5), (reg7 ? wire0 : wire5)} : ($signed(wire6) ?
                      $unsigned(wire1) : (wire4 * wire3)))}})
        begin
          reg8 <= wire4[(1'h1):(1'h0)];
          reg9 <= ({(-reg8)} ~^ (~^$unsigned((wire2[(4'h8):(2'h2)] ?
              (~wire1) : wire4))));
          reg10 <= {(((!reg7) | wire4[(4'hb):(1'h0)]) ?
                  $unsigned($unsigned(wire6[(4'hd):(3'h5)])) : (!((wire0 ?
                      wire3 : reg7) <<< wire4))),
              wire3};
          if ($signed($unsigned((-reg10[(4'h9):(1'h0)]))))
            begin
              reg11 <= $unsigned((~($signed((wire0 < wire6)) ?
                  (&(wire4 ? (8'hbc) : wire4)) : wire5)));
              reg12 <= wire4;
              reg13 <= (^~$unsigned($signed((((8'hb2) ?
                  wire2 : wire4) ^ $unsigned(wire0)))));
              reg14 <= (|{(((wire1 >>> wire2) ?
                          (wire4 ? reg9 : wire4) : $signed((8'ha9))) ?
                      ((wire6 << wire2) ?
                          (~^(8'hb9)) : $signed(reg12)) : $unsigned((reg9 ?
                          wire5 : reg9))),
                  reg12});
              reg15 <= wire0;
            end
          else
            begin
              reg11 <= wire5;
              reg12 <= $signed($signed((8'ha6)));
              reg13 <= ((~(|reg7[(3'h4):(2'h3)])) + (wire3 ?
                  (reg7[(4'h8):(2'h2)] || (wire6[(2'h3):(1'h1)] ?
                      {wire6} : (~|reg15))) : $signed(((-wire5) & reg12))));
              reg14 <= ($unsigned($signed($signed((wire5 << (8'ha5))))) ~^ (reg12 ?
                  wire3 : reg7));
            end
          reg16 <= wire2;
        end
      else
        begin
          reg8 <= $unsigned((reg13[(2'h3):(2'h2)] ^ (wire0[(3'h6):(3'h5)] ?
              $signed(reg14) : {reg13, $unsigned(reg14)})));
          reg9 <= wire2[(4'h8):(1'h0)];
          if (((7'h41) ?
              $signed(((reg12 ?
                  reg7[(3'h6):(2'h3)] : $unsigned(reg7)) ^ {$signed((8'h9d))})) : (~|(+$unsigned((reg7 + reg16))))))
            begin
              reg10 <= (reg16[(1'h1):(1'h1)] ?
                  (|wire0) : {(((wire1 ? wire6 : reg10) ? reg9 : reg13) ?
                          (|reg16) : wire1[(2'h2):(2'h2)]),
                      reg16});
              reg11 <= reg12;
              reg12 <= wire5;
              reg13 <= (|{((+reg8[(3'h6):(2'h2)]) ^~ wire4)});
            end
          else
            begin
              reg10 <= wire4[(1'h1):(1'h0)];
              reg11 <= wire6;
              reg12 <= $signed($signed($signed(({reg13, wire1} ?
                  wire6[(3'h4):(2'h3)] : $signed(wire5)))));
              reg13 <= reg7;
            end
        end
    end
  assign wire17 = ($signed((~^{{(8'hbf)}})) && (~&$unsigned(($signed(reg15) && $signed(reg7)))));
  assign wire18 = $unsigned((+wire2));
endmodule
