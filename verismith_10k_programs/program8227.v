module top
#(parameter param19 = ({(-({(8'hbf), (8'h9d)} >= ((8'h9c) ? (8'hab) : (7'h41)))), ((((8'hba) ? (8'hb5) : (7'h44)) > {(8'hb6)}) != ((-(8'hb7)) ? (-(8'hbf)) : (~(8'hb7))))} <<< (((((8'hb0) >>> (8'hb0)) > {(8'ha9)}) ? {((7'h44) ? (8'hb2) : (8'hbd)), (^(8'hbc))} : {((8'ha7) >> (8'ha1)), (~|(7'h42))}) <<< ((((8'hb6) ? (8'hbe) : (8'hbd)) <= (8'hba)) ? (~{(8'hb6)}) : {((8'had) ? (8'h9e) : (8'hb9)), (&(8'hb8))}))), 
parameter param20 = param19)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
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
  assign wire4 = wire2[(1'h1):(1'h1)];
  assign wire5 = wire3[(1'h1):(1'h1)];
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= wire2[(4'hb):(4'h8)];
      if (reg7[(4'hc):(4'h9)])
        begin
          reg8 <= $signed((($unsigned((wire1 ^ wire5)) ?
              $signed({wire3, wire0}) : $unsigned((wire0 ?
                  wire1 : wire0))) << wire3[(5'h12):(5'h10)]));
          reg9 <= wire1;
          if ((~^reg9[(1'h0):(1'h0)]))
            begin
              reg10 <= ($unsigned($signed($signed((wire1 ?
                  wire6 : reg7)))) | (reg7[(3'h7):(2'h3)] ?
                  wire4 : $unsigned(wire6)));
            end
          else
            begin
              reg10 <= (&((wire4[(3'h4):(3'h4)] > ($signed(wire5) ?
                  (wire3 < reg10) : wire3[(2'h3):(1'h1)])) * (8'ha0)));
              reg11 <= $signed($unsigned($signed(wire2[(4'hc):(1'h0)])));
              reg12 <= $unsigned((((((8'ha3) - reg7) ?
                      (wire0 ?
                          wire6 : wire3) : ((8'ha7) <<< wire1)) >> wire4[(3'h5):(3'h5)]) ?
                  (!$signed((wire5 & wire1))) : {{(8'hbb), {reg7}}, (8'haf)}));
              reg13 <= (-($signed($signed((reg8 <= (8'hbf)))) <<< wire6[(1'h0):(1'h0)]));
            end
          reg14 <= (wire5[(4'h9):(1'h0)] == $unsigned((wire1[(4'hf):(4'he)] ?
              (wire0 && (^~wire5)) : wire6[(2'h2):(2'h2)])));
          reg15 <= (|{$signed(({reg13, (8'ha9)} ?
                  wire1[(2'h3):(1'h0)] : wire6[(2'h2):(2'h2)]))});
        end
      else
        begin
          reg8 <= $signed((!(($signed(reg15) << $unsigned(wire1)) > {(reg13 ^ reg7)})));
          reg9 <= (reg7[(3'h6):(3'h6)] ?
              $signed($signed(wire5[(3'h5):(3'h4)])) : reg14);
        end
      reg16 <= $unsigned((8'hae));
      reg17 <= $signed($signed({(+reg7[(4'h8):(3'h7)]), (~&{reg14})}));
    end
  assign wire18 = (({(reg17 & (8'haa))} << (~reg14[(3'h6):(3'h6)])) > {(reg16[(4'hf):(4'hb)] && (~&(reg7 ^~ wire5)))});
endmodule
