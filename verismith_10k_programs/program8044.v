module top
#(parameter param17 = ({(7'h40), {((!(8'hba)) ? ((8'ha9) ? (8'h9d) : (8'h9f)) : {(8'hb0), (7'h40)})}} && {{(((8'hae) ? (8'hb4) : (8'hb7)) ? {(8'hab), (8'ha4)} : ((8'hbf) ? (8'h9e) : (8'hbb))), {(8'h9f), {(8'hbf)}}}, (^~(~&((8'ha6) * (8'hbe))))}), 
parameter param18 = param17)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire4,
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
  assign wire4 = ({$unsigned(($unsigned(wire3) ? {wire3} : $unsigned(wire3))),
                     $unsigned(wire2[(3'h4):(3'h4)])} >= $signed((wire1 ?
                     ($unsigned(wire2) ?
                         (wire2 ?
                             wire0 : wire1) : $unsigned(wire3)) : ($unsigned(wire0) > wire3))));
  always
    @(posedge clk) begin
      reg5 <= wire1[(4'hc):(1'h1)];
      reg6 <= (&((({wire4, wire2} + {wire4,
          wire4}) >>> wire4[(2'h3):(1'h0)]) > {(+$signed(wire1))}));
      reg7 <= wire2;
      reg8 <= ($unsigned(($unsigned($unsigned((8'ha2))) ?
              (wire0[(3'h4):(1'h1)] < (wire0 ?
                  wire4 : reg5)) : ($unsigned(reg6) ^ reg6))) ?
          wire4 : wire4[(3'h5):(1'h0)]);
      if ($signed((8'ha3)))
        begin
          reg9 <= $unsigned(wire2[(3'h5):(2'h2)]);
          reg10 <= (reg6 - reg7);
          reg11 <= (8'hbf);
        end
      else
        begin
          if (wire1)
            begin
              reg9 <= {{wire0[(1'h1):(1'h0)], reg10},
                  $unsigned((reg10[(4'hd):(4'hc)] <= $unsigned(reg11[(3'h7):(1'h0)])))};
              reg10 <= $unsigned(((^~$unsigned($signed(wire0))) & ($unsigned($unsigned(wire1)) != (-((8'hb7) ?
                  (8'ha8) : (8'ha5))))));
              reg11 <= reg6;
              reg12 <= $signed({(^~$signed(wire2)),
                  (($signed(reg9) + {wire1}) * wire3)});
              reg13 <= ($unsigned((((|wire2) ?
                  reg8 : (wire3 ? (8'hbf) : reg9)) || {(reg9 ?
                      reg5 : reg5)})) || $signed($signed(((reg10 == wire2) ~^ wire0[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg9 <= (reg11 ? (~|reg10[(3'h6):(3'h6)]) : wire4[(3'h4):(2'h2)]);
              reg10 <= reg8[(2'h2):(1'h1)];
            end
        end
    end
  assign wire14 = $unsigned(reg11);
  assign wire15 = ($unsigned(wire2) ?
                      {$signed($unsigned((reg11 ?
                              wire14 : wire3)))} : ((~(|{reg10, wire0})) ?
                          (8'hb8) : (~reg13)));
  assign wire16 = $signed(wire3);
endmodule
