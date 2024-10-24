module top
#(parameter param18 = ((((((8'ha7) ? (8'ha4) : (8'hb9)) ? (&(8'hb1)) : (-(8'ha5))) - (((8'haf) + (8'had)) ^ (~(7'h41)))) * ({((8'ha2) ? (8'hb7) : (8'hb6)), ((8'h9d) >>> (8'hae))} ? (((8'ha1) ? (8'ha2) : (8'hbb)) << ((8'hb3) | (7'h44))) : (-((8'hac) ? (8'hb5) : (8'hb4))))) ? (~((((7'h42) >> (8'ha4)) ? {(8'hb2), (8'hbd)} : ((8'ha2) ^ (7'h43))) || (|((8'ha5) * (7'h40))))) : (^(8'had))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg6 <= $signed(($unsigned((((8'hba) | wire1) ?
              (&wire4) : {wire1, wire5})) ?
          $unsigned(((!wire2) < (wire0 || wire1))) : (wire1[(3'h7):(3'h5)] ?
              $unsigned($signed(wire3)) : (&{wire2, wire1}))));
      if (wire3)
        begin
          reg7 <= ((wire2 ?
                  (wire5 ?
                      $signed(wire3[(2'h3):(2'h3)]) : ((wire1 == wire5) ?
                          (wire4 ?
                              wire3 : wire3) : $signed(wire2))) : reg6[(3'h5):(2'h2)]) ?
              ((8'hab) * (($signed(reg6) ?
                  $unsigned(wire2) : (~|wire0)) + $unsigned(wire3[(4'hd):(4'h8)]))) : $unsigned((((wire4 >>> wire3) ?
                      (wire3 || reg6) : reg6) ?
                  ($unsigned(wire0) ?
                      $signed((8'hbb)) : $signed(wire4)) : {$unsigned((8'ha9))})));
          reg8 <= ((7'h43) <<< (~&reg6[(4'h8):(2'h3)]));
        end
      else
        begin
          if ($unsigned((&reg7)))
            begin
              reg7 <= (^~(+(&$unsigned($unsigned(wire0)))));
              reg8 <= (((^wire3[(4'hc):(3'h4)]) ?
                  (&reg7[(3'h6):(1'h1)]) : {{$unsigned(reg8),
                          $unsigned((8'haf))},
                      $unsigned($unsigned((8'hab)))}) & $signed(({wire1} ?
                  $signed((wire5 ? wire5 : reg6)) : $signed((~|reg6)))));
              reg9 <= (~&({($signed(wire2) >> reg7),
                      $signed(wire0[(1'h1):(1'h1)])} ?
                  (wire4[(4'hc):(2'h3)] ?
                      (-$unsigned(reg7)) : ((!reg8) ?
                          $unsigned(wire2) : ((8'hab) ?
                              reg8 : reg7))) : $signed(((reg8 * (8'hb2)) >= reg6))));
            end
          else
            begin
              reg7 <= (((~|($signed(reg7) <<< wire3[(4'hf):(4'h9)])) ?
                      {(^~wire5)} : (~|($unsigned(reg9) ?
                          (wire5 ? wire0 : (8'hae)) : wire1[(4'h8):(3'h7)]))) ?
                  (reg9[(2'h2):(2'h2)] ?
                      (^wire2[(3'h5):(3'h5)]) : wire5[(1'h1):(1'h0)]) : ((~&(~wire5[(3'h4):(1'h1)])) <= ($signed($signed(wire2)) ?
                      $unsigned((~|reg7)) : reg7[(5'h11):(1'h1)])));
              reg8 <= (!(-wire1));
            end
        end
      reg10 <= $unsigned(((~wire2) + ($signed($signed(reg6)) * (~|(!wire4)))));
      reg11 <= ((~^(8'h9d)) ?
          wire4[(5'h10):(4'h8)] : $unsigned($unsigned((~|reg6[(4'h8):(2'h2)]))));
    end
  assign wire12 = (~&reg7);
  assign wire13 = {($unsigned((~|{(8'h9e), wire1})) * (8'hba))};
  assign wire14 = ($unsigned((wire3 ?
                      $signed(wire2) : wire5)) - {$unsigned(wire2)});
  assign wire15 = $signed(reg8);
  assign wire16 = ($unsigned($unsigned((!(wire14 ?
                      wire14 : reg7)))) << ($unsigned($signed(wire5)) <<< ((~^((8'ha9) & reg9)) > reg6)));
  assign wire17 = wire12[(4'hc):(1'h0)];
endmodule
