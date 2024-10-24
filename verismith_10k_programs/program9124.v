module top
#(parameter param20 = ((({((8'hbb) >> (8'hbf)), (|(8'ha9))} >= (((8'ha4) != (8'hab)) ? (^~(8'hbc)) : {(8'hb8), (8'h9d)})) ^ {((8'hb6) != ((8'hb8) ? (8'hb3) : (8'ha0))), (((8'haf) ? (8'ha1) : (8'haf)) ? ((8'hbb) ? (8'hb3) : (8'ha7)) : ((8'h9d) ? (8'haf) : (8'ha8)))}) <= (((~(8'hac)) ? ({(7'h41), (8'hbb)} ? ((8'haf) >> (8'h9c)) : ((8'hba) ? (8'ha5) : (8'hbf))) : (((8'h9c) ? (8'hac) : (8'ha3)) ? ((8'ha8) >= (8'hb7)) : ((7'h41) ^~ (8'hac)))) ? (((-(8'ha5)) * (&(8'h9d))) >= (8'hbc)) : (!((8'ha9) ? ((8'hb8) + (8'hb1)) : {(8'haf), (8'ha2)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire0));
  assign wire5 = $unsigned((|$unsigned(((wire2 ? wire3 : wire4) ?
                     (wire3 ? wire1 : wire4) : (wire2 << wire2)))));
  assign wire6 = wire3;
  assign wire7 = $unsigned($unsigned((8'h9e)));
  assign wire8 = (~|{(wire5[(3'h7):(2'h2)] ?
                         wire1 : ((wire0 < wire3) - $signed((8'ha1))))});
  always
    @(posedge clk) begin
      reg9 <= {wire5[(3'h7):(2'h2)], wire7};
      reg10 <= $unsigned($signed((&reg9[(2'h3):(2'h2)])));
      if (reg10[(2'h3):(1'h1)])
        begin
          if ($signed(($signed($signed($signed((8'hb5)))) > $unsigned($unsigned(reg9[(3'h4):(2'h3)])))))
            begin
              reg11 <= $signed(reg10);
              reg12 <= (^~($unsigned(((wire0 ? (7'h41) : wire7) >> (wire7 ?
                  wire8 : wire6))) >>> $signed(wire3)));
              reg13 <= $unsigned(wire8[(2'h2):(2'h2)]);
            end
          else
            begin
              reg11 <= wire5[(3'h4):(2'h3)];
            end
          reg14 <= {(~{$unsigned((reg11 ^~ wire1)), reg10}),
              reg12[(4'h9):(1'h1)]};
        end
      else
        begin
          reg11 <= ((~|wire5) ?
              (reg10[(1'h0):(1'h0)] ?
                  wire6 : (($unsigned(wire7) ?
                          $unsigned((8'hb0)) : {wire2, reg12}) ?
                      $unsigned($signed(wire1)) : $unsigned((~wire6)))) : (reg9[(3'h6):(1'h1)] ?
                  wire5 : reg11[(3'h6):(3'h6)]));
          reg12 <= ($unsigned((((wire1 != reg9) ^~ (wire6 > wire1)) ?
                  $signed((reg14 ? wire3 : wire0)) : $signed((-(8'hbc))))) ?
              ($signed((~|$unsigned(reg13))) == {wire8[(4'h8):(2'h2)],
                  $unsigned((~&wire7))}) : reg14);
        end
      if ((((8'ha1) * $unsigned(wire5)) ^ $unsigned({$unsigned(wire2),
          {(8'hb2)}})))
        begin
          reg15 <= (~wire8);
        end
      else
        begin
          reg15 <= ($signed($unsigned(((~&(8'ha2)) ?
              (reg12 ?
                  reg13 : reg14) : (^wire5)))) > $unsigned((reg9 + {$signed(wire2),
              $signed(wire3)})));
          reg16 <= (~&$unsigned((&(wire6[(2'h2):(1'h1)] >> {wire8}))));
          reg17 <= reg10[(3'h6):(1'h1)];
          reg18 <= $signed({(^~$signed((^~wire0))), (|wire2)});
        end
    end
  assign wire19 = wire2[(3'h4):(2'h2)];
endmodule
