module top
#(parameter param18 = ((({{(8'hab)}, (~^(8'ha5))} >>> ((^(8'hac)) ? {(7'h40), (8'h9d)} : (!(8'hb5)))) ? ((~(~&(8'ha0))) + (8'ha2)) : (((8'hb9) ? (!(7'h44)) : ((8'hb7) ? (8'hb2) : (7'h44))) ? ((8'ha2) ? (!(8'h9d)) : ((8'h9f) ^~ (8'ha5))) : ({(8'hb9)} | (+(7'h43))))) | ((7'h44) > (((8'h9c) ? {(8'hab)} : ((8'ha3) ? (8'hb4) : (7'h44))) ? (^~((7'h42) > (7'h40))) : (((7'h44) && (8'h9d)) ? (|(7'h41)) : ((8'hb2) <<< (8'hae)))))), 
parameter param19 = (-(+(((~&(8'ha2)) ? (param18 <<< (8'hb4)) : (!param18)) ? (^(~param18)) : {(param18 - param18)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
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
                 reg6,
                 (1'h0)};
  assign wire4 = (wire1[(3'h6):(3'h4)] > wire1);
  assign wire5 = (|wire2[(4'hf):(2'h2)]);
  always
    @(posedge clk) begin
      reg6 <= ($signed($signed((wire4[(1'h0):(1'h0)] >> $signed(wire1)))) ?
          $signed((((wire5 | (8'haf)) ?
              $unsigned(wire3) : wire0) << {wire0})) : wire5[(1'h1):(1'h0)]);
      if (((^(((wire0 ? wire3 : reg6) ? $unsigned(wire3) : (wire0 <= wire4)) ?
          (!wire5[(2'h3):(2'h3)]) : $signed($signed((8'ha9))))) <<< (-(!(wire3[(2'h2):(1'h1)] ?
          $unsigned(wire0) : wire5)))))
        begin
          reg7 <= (|({{{wire1, wire5}}, $unsigned({reg6, (7'h43)})} ?
              ($unsigned($unsigned(wire5)) ?
                  ((8'h9d) ^ {(8'hb4)}) : reg6[(1'h0):(1'h0)]) : wire4[(1'h0):(1'h0)]));
          reg8 <= ((~|$unsigned(reg6[(2'h2):(1'h1)])) || {wire3});
          reg9 <= $signed(({reg7} != wire2));
        end
      else
        begin
          if ($signed($signed(wire3[(3'h4):(3'h4)])))
            begin
              reg7 <= $unsigned((!(|((^reg6) == (~|wire0)))));
              reg8 <= reg9[(1'h1):(1'h1)];
              reg9 <= $unsigned({{$signed((^(8'had))), wire1[(2'h3):(1'h1)]}});
              reg10 <= (~&$unsigned($signed($signed((wire4 ? reg9 : wire0)))));
              reg11 <= (8'h9c);
            end
          else
            begin
              reg7 <= (((wire3[(4'hc):(1'h0)] <= (^reg9)) > ({{reg11},
                      {wire2}} == $unsigned((reg10 ? wire1 : (8'hac))))) ?
                  reg8[(2'h2):(1'h1)] : {$unsigned({reg8[(3'h7):(2'h2)],
                          (~|wire3)}),
                      $unsigned(wire5[(3'h4):(3'h4)])});
              reg8 <= wire2[(3'h5):(2'h2)];
              reg9 <= wire0[(3'h4):(1'h0)];
            end
          reg12 <= $signed(reg8[(1'h0):(1'h0)]);
          reg13 <= wire1[(3'h4):(2'h2)];
        end
      reg14 <= (((wire1 >> (+$unsigned(wire3))) >> (^$signed(reg8))) ?
          (reg13[(5'h13):(5'h10)] ?
              reg12 : ($unsigned((reg10 != wire4)) ?
                  $signed({wire1,
                      wire0}) : reg7[(4'hf):(3'h4)])) : (wire1[(2'h2):(1'h0)] ?
              (wire0[(4'ha):(3'h5)] == $unsigned((reg11 == wire0))) : (((|reg10) ?
                  (~reg11) : (wire0 ? reg8 : reg11)) ~^ (~$signed(reg10)))));
      reg15 <= (-reg9[(3'h7):(2'h2)]);
      reg16 <= (((wire3[(4'h8):(1'h0)] <= reg8[(3'h7):(3'h4)]) * reg15) ?
          (8'hb8) : ((^~reg10[(1'h1):(1'h1)]) ?
              reg10[(2'h2):(2'h2)] : {($unsigned(wire3) ?
                      $signed(reg6) : $signed(reg14)),
                  (((8'hbd) ? reg12 : reg7) ~^ (~^(8'ha6)))}));
    end
  assign wire17 = wire4;
endmodule
