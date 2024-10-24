module top
#(parameter param18 = {(|((((8'hbc) ? (8'h9c) : (8'ha2)) >>> ((8'hb6) != (8'haa))) ? ((!(8'h9e)) ? ((8'hb1) ? (8'hae) : (8'h9c)) : {(8'hb5)}) : (~{(8'h9c)}))), (8'hbd)}, 
parameter param19 = (~&{(~(-{(8'ha2), param18}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed({$signed((!(^wire1)))});
  assign wire6 = $unsigned(((((wire0 ? wire4 : wire3) ?
                             {wire1, wire1} : (wire4 < wire2)) ?
                         $signed((!wire5)) : wire3[(2'h3):(2'h3)]) ?
                     ($signed({(8'h9f)}) ?
                         {(wire4 <<< wire1)} : (wire5[(1'h1):(1'h1)] >= (^wire0))) : wire2[(4'h9):(1'h0)]));
  assign wire7 = $unsigned((+($signed(wire5[(1'h0):(1'h0)]) < $signed((wire0 ?
                     wire1 : (7'h43))))));
  assign wire8 = ($signed((-$signed((|wire2)))) == $signed(((wire1[(1'h0):(1'h0)] ?
                     wire4 : $unsigned((8'hb2))) >> $signed($unsigned((8'h9d))))));
  always
    @(posedge clk) begin
      reg9 <= wire3;
      reg10 <= (({($signed(wire0) ? ((8'hb9) && reg9) : (wire4 ~^ wire5)),
          (~{wire4})} >> (wire8[(3'h5):(1'h1)] ?
          wire1 : {$signed(wire4)})) <<< reg9);
      if ((-(((wire5[(2'h2):(1'h0)] ? wire4 : $signed(wire7)) ?
          $unsigned(wire0[(4'hf):(4'hf)]) : (-$signed(wire3))) - wire8[(1'h1):(1'h0)])))
        begin
          reg11 <= (~^($unsigned(($signed((8'hbe)) ? {wire0} : $signed(reg9))) ?
              {wire2[(4'hd):(2'h3)],
                  $signed((wire2 == wire5))} : wire5[(1'h1):(1'h0)]));
          reg12 <= ((({(reg9 >= wire8)} | $signed(wire4[(4'hc):(4'ha)])) ?
              (((wire1 != wire3) ?
                      (wire1 ? wire7 : wire4) : (wire6 ? reg9 : wire4)) ?
                  $signed((wire8 ?
                      (8'ha4) : wire1)) : wire1) : wire2) & wire8[(3'h5):(1'h0)]);
          if ($unsigned(reg11[(2'h3):(1'h0)]))
            begin
              reg13 <= (wire1[(2'h2):(2'h2)] ?
                  wire1[(2'h2):(2'h2)] : (^($signed(reg10) ?
                      wire8[(3'h4):(1'h0)] : reg12[(3'h6):(2'h3)])));
            end
          else
            begin
              reg13 <= $signed({wire5});
              reg14 <= $signed($signed($signed($unsigned((wire7 ?
                  wire6 : reg10)))));
              reg15 <= (-(wire1[(2'h3):(1'h1)] ?
                  {($signed(wire5) != $signed((8'ha7)))} : (reg13[(3'h5):(3'h5)] || $unsigned((+wire6)))));
            end
          reg16 <= ((-(wire7 + wire4[(4'he):(2'h2)])) ^ ($unsigned(($unsigned(wire1) ?
                  reg11[(3'h5):(1'h0)] : $signed(reg14))) ?
              (wire2[(2'h3):(2'h3)] ^~ wire6) : wire2[(2'h3):(1'h0)]));
        end
      else
        begin
          reg11 <= (wire1 ?
              (wire4 + $unsigned((~|wire3))) : ($unsigned($unsigned((8'ha8))) ^~ reg16));
          reg12 <= $unsigned($signed((~|{wire4, (reg12 ? reg11 : wire5)})));
          reg13 <= wire3[(5'h11):(4'hb)];
        end
    end
  assign wire17 = {{{reg11[(3'h4):(3'h4)]},
                          {(((8'hbf) ? (8'hbe) : (8'ha4)) - {wire3, reg9})}}};
endmodule
