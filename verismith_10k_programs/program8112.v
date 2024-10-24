module top
#(parameter param23 = ((~(({(8'ha6), (8'ha7)} ? ((7'h42) ? (8'hbb) : (8'ha0)) : ((8'hba) || (8'hb6))) && {((8'h9e) ? (8'hb3) : (8'hbb))})) <<< ((~&{(8'ha8)}) ? ((&((8'hbe) < (8'hb2))) ~^ (~(^~(8'hbc)))) : ((-((8'ha1) | (8'ha1))) ? (&{(7'h40), (8'ha1)}) : ({(8'hbf), (8'ha1)} < ((8'ha1) * (8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg22,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (|wire4);
  always
    @(posedge clk) begin
      reg6 <= wire5[(2'h3):(1'h0)];
      reg7 <= ((+(+(8'hb9))) ?
          ((~&(wire3[(3'h5):(3'h4)] ^~ (wire0 ?
              reg6 : wire3))) + (^{$unsigned(wire1)})) : wire4[(3'h7):(3'h4)]);
      reg8 <= ($unsigned($signed(wire5[(4'hd):(3'h7)])) != (8'hac));
      reg9 <= (wire4[(1'h1):(1'h1)] ?
          $signed($signed(wire3[(4'h9):(2'h3)])) : wire5[(4'hc):(3'h7)]);
    end
  assign wire10 = (reg8[(3'h5):(1'h1)] ?
                      wire2 : (^(((reg6 ? wire4 : (8'hb1)) - (reg8 ?
                          (8'hb7) : reg8)) > ((reg8 == wire3) ?
                          {(8'ha8), wire3} : reg6[(1'h1):(1'h1)]))));
  assign wire11 = reg8[(3'h5):(1'h0)];
  assign wire12 = wire10[(4'h8):(3'h7)];
  assign wire13 = wire5[(1'h1):(1'h1)];
  assign wire14 = (~$unsigned(((+(-wire0)) ? (~|$unsigned(wire5)) : wire13)));
  assign wire15 = $signed((({$signed(wire11), $unsigned(wire0)} ?
                      wire5[(1'h1):(1'h0)] : $unsigned(wire5[(5'h10):(4'ha)])) + ($unsigned($unsigned(reg6)) ?
                      $signed(((8'haf) ? (8'ha3) : (8'hb8))) : {(reg8 ?
                              (8'h9e) : wire3),
                          (reg8 ? wire14 : wire10)})));
  always
    @(posedge clk) begin
      if ((~(((reg7 ? wire11 : {wire1, reg9}) & ($unsigned(wire3) ?
              $signed(wire14) : ((7'h44) != wire5))) ?
          $signed(((wire14 ? reg6 : wire12) ?
              ((8'hab) ?
                  (8'hb1) : wire14) : $unsigned(wire3))) : $unsigned($unsigned(wire13)))))
        begin
          reg16 <= $signed((~&(&$unsigned((^~wire12)))));
          reg17 <= wire5;
          reg18 <= (wire4 <<< $unsigned($signed(($signed((8'hb3)) ?
              (^~(8'ha2)) : {wire1}))));
          reg19 <= ($signed({$signed((!wire5)), $unsigned((wire1 <= wire3))}) ?
              wire2[(3'h4):(3'h4)] : $signed((+$unsigned(wire4[(3'h5):(1'h0)]))));
        end
      else
        begin
          if (wire3)
            begin
              reg16 <= (~&wire3[(3'h7):(3'h5)]);
              reg17 <= (7'h40);
            end
          else
            begin
              reg16 <= ($signed(wire3[(2'h2):(2'h2)]) ?
                  (~|{((reg17 ? wire5 : wire1) == (8'haf)),
                      wire3[(1'h1):(1'h1)]}) : {($signed(reg9) * {((8'hbc) ?
                              wire3 : (8'h9c)),
                          (~&wire2)})});
            end
        end
    end
  assign wire20 = reg19;
  assign wire21 = (~&$unsigned(((reg6[(2'h2):(1'h0)] | wire1) ?
                      $signed((~(8'ha0))) : $signed(reg6))));
  always
    @(posedge clk) begin
      reg22 <= reg16;
    end
endmodule
