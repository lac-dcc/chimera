module top
#(parameter param15 = ((~&((~^{(8'ha3), (8'ha2)}) ? (((8'hae) && (8'haa)) * ((8'ha1) != (7'h42))) : (-((8'hb9) * (8'hb9))))) & (+{{((8'hb0) ? (8'ha2) : (8'hb1)), (~(8'hb8))}, (((8'hb7) <<< (8'h9e)) | ((7'h41) ^~ (8'hb7)))})), 
parameter param16 = ((~^(!(~|(^param15)))) > (param15 + {param15})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {(($signed((wire1 ?
                         (8'hb8) : wire0)) == $unsigned(((8'hbd) <= (7'h42)))) << {$signed((wire2 ?
                             (8'hb2) : wire2))})};
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= wire4[(3'h5):(1'h0)];
      reg8 <= (($unsigned($signed((wire5 & wire5))) << (^wire1)) ^ ($unsigned($signed((8'ha6))) || ({$unsigned(wire6),
          wire2} != wire2[(2'h3):(1'h1)])));
      if ($signed(reg8[(4'h8):(3'h4)]))
        begin
          reg9 <= $signed(reg8);
          reg10 <= wire1;
          reg11 <= ((-$signed($signed(wire5[(2'h3):(2'h3)]))) ?
              ((|{$signed((8'hbe)),
                  {wire2,
                      wire6}}) == ((reg9[(4'hb):(1'h0)] & $signed((8'hb2))) ?
                  wire6[(3'h5):(1'h0)] : wire1)) : ((^$signed($signed(reg10))) ?
                  (((+reg8) ? (-wire3) : (wire1 ? wire5 : wire3)) ?
                      $unsigned({wire6, (7'h41)}) : $signed((reg7 ?
                          (8'hb5) : (8'ha7)))) : ($signed((reg8 ?
                          reg7 : wire6)) ?
                      $signed(reg7) : (+reg7[(4'hd):(3'h6)]))));
          reg12 <= (&$unsigned((wire1 == ((^~wire0) ?
              $signed(wire5) : $signed(wire0)))));
        end
      else
        begin
          reg9 <= (^~$signed((~|$signed((~&wire5)))));
          if ((($unsigned($unsigned(reg8[(2'h3):(2'h2)])) > reg9[(2'h2):(1'h0)]) >>> reg7[(3'h7):(2'h2)]))
            begin
              reg10 <= $unsigned(((reg12[(3'h5):(2'h3)] << (wire3 | reg12)) ?
                  $unsigned(($signed(wire3) ?
                      $unsigned(wire5) : (+reg11))) : wire5));
            end
          else
            begin
              reg10 <= $unsigned(({$unsigned((wire5 ? reg10 : reg8)),
                      ((wire1 > (8'hb3)) == wire0[(4'hc):(1'h1)])} ?
                  $signed((&(wire4 ^ wire0))) : reg9[(3'h5):(3'h4)]));
              reg11 <= $unsigned(((|{$signed((8'h9c)), wire2}) ?
                  {reg10,
                      ((wire6 ? (8'hbf) : (8'hbd)) ?
                          (wire6 ?
                              reg8 : reg12) : wire3[(3'h7):(3'h5)])} : (-wire2[(2'h2):(2'h2)])));
              reg12 <= $unsigned((8'hbf));
              reg13 <= $unsigned($signed(($signed(wire3) > ({reg12,
                  reg11} + reg12[(3'h7):(3'h4)]))));
            end
        end
    end
  assign wire14 = $signed((~reg11));
endmodule
