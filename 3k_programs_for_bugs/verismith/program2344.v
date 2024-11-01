module top
#(parameter param15 = {(8'ha4)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (+($unsigned((|$signed(wire0))) | (($unsigned(wire2) || (wire0 || wire2)) + wire3)));
  assign wire5 = wire2;
  assign wire6 = (($unsigned((&(8'h9f))) != (+$unsigned((|wire2)))) ?
                     $unsigned((wire2[(1'h1):(1'h1)] ?
                         $unsigned((wire4 ?
                             (8'hbf) : wire3)) : wire5[(3'h4):(2'h2)])) : {((~|(wire3 < wire4)) >>> ($signed(wire3) + ((8'haa) <= (8'ha9)))),
                         {((wire3 ? (8'hbc) : wire0) ?
                                 (wire5 ? wire1 : wire1) : $signed(wire5))}});
  always
    @(posedge clk) begin
      reg7 <= (((wire2[(2'h2):(2'h2)] * ((wire3 == wire1) ?
              $signed(wire4) : (~|wire5))) <= wire3[(1'h1):(1'h0)]) ?
          {((8'hbd) ^ (~^wire2[(3'h7):(1'h1)])),
              $signed({(8'ha0)})} : (-wire1));
      if (wire6)
        begin
          reg8 <= wire3;
          reg9 <= wire6[(4'hf):(4'hb)];
          reg10 <= ($unsigned((({wire4,
              wire1} <= $unsigned(reg8)) << (((7'h44) ? wire5 : wire4) ?
              $unsigned(reg9) : (~&(8'ha2))))) >> $unsigned($unsigned($unsigned(wire4[(3'h5):(1'h0)]))));
        end
      else
        begin
          reg8 <= (reg7 >> (~({(reg9 ^~ wire0),
              wire5} == (|(wire2 >>> reg7)))));
          reg9 <= $unsigned(({(^~((8'hb8) >>> (7'h43)))} <<< (((wire0 ?
                      reg7 : (8'haa)) ?
                  (wire1 ? wire4 : wire4) : reg10[(3'h5):(2'h3)]) ?
              (^~$unsigned(reg10)) : reg7[(2'h2):(2'h2)])));
          reg10 <= ($unsigned((~|{(-wire1), wire1})) ^~ wire5);
          reg11 <= reg9[(3'h6):(1'h1)];
          reg12 <= ((&$signed((~|(~&reg11)))) != ((-(reg10 ^ (reg7 | reg8))) ?
              (reg7[(3'h7):(3'h7)] ?
                  $unsigned(wire3) : wire5[(1'h0):(1'h0)]) : (wire6 <<< {$signed((8'hae)),
                  $signed(wire5)})));
        end
    end
  always
    @(posedge clk) begin
      reg13 <= $signed((8'h9d));
      reg14 <= ($unsigned(reg11[(4'he):(4'he)]) * ($unsigned(wire4[(3'h4):(1'h0)]) ?
          wire0 : $signed((8'hbb))));
    end
endmodule
