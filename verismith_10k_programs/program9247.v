module top
#(parameter param22 = (((~(^~{(8'hab)})) < ((((8'ha7) <= (8'hae)) ? (^~(8'haa)) : {(8'haa)}) >>> (|((8'hb3) >= (8'ha4))))) ? (!(&({(8'ha8)} * (~^(8'ha7))))) : ({(((8'h9d) >> (8'hb0)) >= ((8'ha4) ~^ (8'haf))), ({(8'hb0)} + (8'hac))} || ((~^(^~(8'ha5))) <<< {{(8'ha0), (8'hb5)}, ((8'hac) * (8'ha0))}))), 
parameter param23 = ({(!{((8'ha3) << param22)}), (8'ha1)} ? (+param22) : param22))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire0 ?
                     $unsigned($signed(wire1[(2'h3):(2'h2)])) : (^(wire1[(3'h4):(2'h3)] | $unsigned(wire2[(4'hd):(4'h9)]))));
  assign wire5 = $unsigned({(wire3[(1'h0):(1'h0)] << (&(wire0 == wire3))),
                     (+wire3)});
  always
    @(posedge clk) begin
      if ((~&($signed($signed(wire1)) == wire3)))
        begin
          reg6 <= $signed($unsigned($unsigned(wire1[(3'h7):(1'h0)])));
        end
      else
        begin
          if (({(~&$signed(wire2[(4'hc):(3'h4)])), wire0} ?
              reg6 : ($signed({$unsigned((7'h44)), $unsigned(wire5)}) ?
                  wire2 : $unsigned($unsigned($unsigned(wire0))))))
            begin
              reg6 <= {wire0, wire2[(4'hd):(4'hb)]};
            end
          else
            begin
              reg6 <= reg6[(1'h1):(1'h0)];
              reg7 <= (((((^wire4) || $signed(wire3)) & (+$unsigned(wire1))) | (~&wire2)) ?
                  ($signed($unsigned((wire1 > wire5))) ?
                      $signed($unsigned(wire0[(1'h0):(1'h0)])) : (7'h44)) : ($signed(reg6) ?
                      ((&((8'hbd) ?
                          wire2 : wire4)) ^ $signed(wire0[(3'h7):(2'h3)])) : reg6[(2'h2):(2'h2)]));
              reg8 <= wire1[(3'h4):(2'h2)];
              reg9 <= $unsigned($signed(wire0[(2'h2):(1'h0)]));
            end
          if ($signed((8'ha7)))
            begin
              reg10 <= wire5;
              reg11 <= reg6;
              reg12 <= (~&($signed(reg9) + reg10));
              reg13 <= (($signed((~(reg7 ^~ (7'h40)))) ?
                      wire5 : wire0[(2'h3):(1'h0)]) ?
                  wire3 : $signed(reg6));
            end
          else
            begin
              reg10 <= reg13;
            end
        end
    end
  assign wire14 = ((|reg6) == $unsigned((($unsigned(reg7) * (wire1 || wire0)) + wire0)));
  assign wire15 = $unsigned(((wire3[(1'h0):(1'h0)] * ((~(8'hb8)) <<< $signed(wire4))) ?
                      ((~&wire2[(1'h1):(1'h1)]) ?
                          $unsigned(wire5) : {{(8'ha3), wire4},
                              (reg7 >>> reg7)}) : reg13[(2'h3):(1'h0)]));
  assign wire16 = (wire0 ? ((~|wire5) == reg9[(3'h6):(3'h6)]) : (8'hbf));
  always
    @(posedge clk) begin
      reg17 <= (~&(~($unsigned(wire2[(4'he):(2'h3)]) && (~|reg10[(3'h4):(1'h1)]))));
      reg18 <= reg9;
      reg19 <= wire4;
    end
  assign wire20 = (($unsigned((reg13[(1'h1):(1'h1)] ?
                      $signed(reg9) : $signed(wire2))) & $signed((!{reg12,
                      (8'ha6)}))) < reg9);
  assign wire21 = wire2[(4'ha):(4'h9)];
endmodule
