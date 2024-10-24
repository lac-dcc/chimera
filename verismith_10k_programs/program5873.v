module top
#(parameter param22 = ((8'hb8) ? ((((^~(8'ha2)) != ((8'hae) ? (7'h44) : (8'h9f))) << (^((7'h40) ? (8'h9e) : (7'h41)))) ? {(((8'ha2) ? (8'ha5) : (8'ha0)) ? {(8'hb7), (8'hab)} : ((7'h41) > (8'hb2)))} : ((((7'h43) ? (8'had) : (8'ha4)) && (~^(7'h41))) ? ((!(8'ha9)) ? ((8'ha8) ? (8'ha5) : (8'ha0)) : ((8'hb5) ? (8'hb2) : (8'hab))) : {((8'hb6) ? (8'hb0) : (7'h44))})) : ((~^(((8'hb2) ? (8'hbc) : (7'h43)) ? (~&(8'hbf)) : ((8'had) - (8'hb1)))) ? (((!(7'h44)) ? (|(8'hab)) : ((8'h9c) ? (8'ha2) : (8'hb8))) ^ ((^~(8'hba)) ? ((8'ha5) ? (8'ha8) : (8'ha2)) : ((8'hba) ? (8'hbe) : (8'ha6)))) : {(((8'hbd) ~^ (8'ha4)) >>> ((8'haa) ? (7'h40) : (8'ha9))), ((8'hbc) + ((8'hb7) ? (8'hb6) : (8'hae)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
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
                 reg5,
                 (1'h0)};
  assign wire4 = (+{$unsigned(wire0[(4'hd):(4'hd)]), wire3[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg5 <= $signed((8'hb3));
    end
  assign wire6 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= {(8'hba),
          $unsigned(((wire0 ? wire6[(2'h3):(1'h0)] : wire6) ?
              wire3[(1'h1):(1'h0)] : wire1))};
      if (wire2)
        begin
          if ((|wire6[(3'h5):(3'h5)]))
            begin
              reg8 <= (|$signed(((7'h42) - {$signed((8'h9e))})));
              reg9 <= (~^wire4);
              reg10 <= ((~(reg7 >= ((wire4 * reg9) == (reg7 ?
                  (8'ha8) : wire1)))) & wire1[(2'h2):(1'h1)]);
              reg11 <= $unsigned($signed(wire6));
              reg12 <= wire1;
            end
          else
            begin
              reg8 <= wire3;
              reg9 <= reg10;
              reg10 <= $unsigned(($signed(reg8) ?
                  $unsigned($unsigned(wire2[(2'h2):(1'h0)])) : $unsigned($signed((wire6 ?
                      reg8 : wire3)))));
            end
          reg13 <= (^~reg12[(2'h3):(2'h3)]);
          reg14 <= (~^reg9);
          reg15 <= reg14[(2'h2):(2'h2)];
        end
      else
        begin
          reg8 <= (~^wire6[(4'hd):(4'hb)]);
          if (wire1)
            begin
              reg9 <= (~^((+wire6[(2'h3):(2'h3)]) >> reg11));
              reg10 <= ((wire6 - $unsigned((wire2 || reg9))) >> (wire6 != $signed(((wire1 | reg11) >>> reg13[(4'h8):(2'h2)]))));
            end
          else
            begin
              reg9 <= (~wire2[(3'h5):(2'h3)]);
              reg10 <= $unsigned((+$unsigned({(~reg8)})));
              reg11 <= ($signed((7'h42)) ~^ $unsigned(wire0[(3'h7):(3'h6)]));
            end
          reg12 <= reg9;
          if (reg9)
            begin
              reg13 <= wire3;
              reg14 <= wire2[(3'h5):(2'h2)];
              reg15 <= $signed(wire1[(2'h2):(1'h1)]);
              reg16 <= reg10[(3'h6):(3'h4)];
            end
          else
            begin
              reg13 <= $signed($unsigned(($signed((~|reg16)) ^~ reg16[(3'h5):(1'h1)])));
              reg14 <= (($unsigned(((8'h9e) ?
                      (wire2 <= reg13) : (reg14 ? reg11 : reg8))) ?
                  {(reg12 ? {reg9} : $signed(reg10)),
                      $signed(reg10)} : (~|(wire2[(3'h4):(2'h2)] ?
                      wire2 : $unsigned(reg5)))) <<< (!((+$signed((8'hbb))) >>> wire2)));
              reg15 <= $signed(({$signed(reg11),
                  $signed(((8'ha2) == reg10))} >> (wire0[(4'he):(3'h7)] ?
                  wire6[(4'h9):(1'h0)] : $unsigned($unsigned(wire3)))));
              reg16 <= $signed((|(wire6[(4'h8):(3'h6)] ?
                  (reg12[(2'h2):(1'h0)] ?
                      reg14[(4'hc):(1'h0)] : (reg15 ?
                          wire1 : wire4)) : reg14)));
            end
        end
    end
  assign wire17 = (wire0 << (8'ha0));
  assign wire18 = (~wire1);
  assign wire19 = $unsigned(((((!wire4) ? reg5 : $signed(wire3)) * wire1) ?
                      (reg13[(2'h3):(2'h3)] ?
                          ((reg7 <<< (8'h9f)) >>> (^~wire3)) : $signed(reg9[(4'ha):(3'h7)])) : {$signed($signed(reg8))}));
  assign wire20 = ($signed((reg9 * ((7'h40) << ((8'ha3) | wire1)))) ?
                      reg15 : ({((reg12 ? reg12 : reg15) ? wire19 : reg15)} ?
                          (~^(!reg16[(4'h8):(2'h2)])) : $unsigned(reg11)));
  assign wire21 = reg7;
endmodule
