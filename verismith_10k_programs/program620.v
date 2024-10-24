module top
#(parameter param19 = ((8'ha7) ? (!{(8'ha1), (((7'h43) & (8'ha6)) ? {(8'hba), (8'ha9)} : ((8'hb8) ? (8'h9c) : (8'ha5)))}) : (({{(8'hb3), (8'hb9)}, (-(8'hb1))} * (^~((8'ha4) + (8'ha3)))) ? (~(7'h40)) : ((((7'h41) ^~ (8'h9e)) ? (~^(7'h42)) : (~|(8'hb6))) ? ({(8'h9d)} - ((8'ha4) ? (8'haa) : (7'h41))) : (((8'ha3) ? (8'h9d) : (8'hab)) ? ((8'h9c) ^ (8'hb7)) : {(8'hb1)})))), 
parameter param20 = (~&({param19, param19} ? (((param19 ? param19 : param19) ^ (param19 ? param19 : param19)) ? ({(8'hbf)} ? ((8'hac) ? param19 : param19) : (param19 ? (8'ha9) : param19)) : (((8'hbc) ? param19 : param19) ^ (param19 ? param19 : param19))) : (+param19))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(($unsigned(((wire2 ? wire1 : wire2) ?
          (wire2 ?
              wire1 : wire3) : {(8'h9f)})) + $unsigned(wire0[(4'h8):(3'h4)])));
      if ((~&wire2))
        begin
          reg5 <= $signed(wire3);
          reg6 <= ($unsigned(wire0[(5'h12):(4'ha)]) & (reg4[(1'h0):(1'h0)] ?
              wire1[(3'h5):(1'h0)] : {(~^(wire3 ? wire0 : wire1)), (8'hab)}));
          if (((&(^~(|((8'h9f) ? reg6 : wire3)))) ?
              (^~$unsigned({(reg4 ~^ (8'hb8)),
                  (wire2 ? wire0 : wire2)})) : ($unsigned((!(8'hb8))) ?
                  ({reg6} ^ $signed((wire2 != wire3))) : {(reg4[(2'h2):(1'h1)] ?
                          $signed(wire2) : (wire0 ? wire0 : wire0)),
                      $signed(reg4[(1'h0):(1'h0)])})))
            begin
              reg7 <= $signed((^($signed($unsigned(wire2)) ?
                  $signed(wire3) : reg5)));
            end
          else
            begin
              reg7 <= $unsigned({$unsigned(($signed(wire2) != {reg5})),
                  reg6[(4'ha):(4'h9)]});
              reg8 <= wire0;
              reg9 <= $signed((reg8[(4'hc):(2'h2)] - $signed((!wire0))));
              reg10 <= $unsigned($signed({$unsigned((8'hbe)),
                  ((~wire0) ? {reg9, (8'hb1)} : (~&(8'hb5)))}));
              reg11 <= $unsigned($unsigned($signed((!$signed(reg4)))));
            end
        end
      else
        begin
          reg5 <= $signed(({(wire1 ?
                  $signed(reg9) : reg7[(4'h8):(1'h0)])} || reg11[(4'hd):(3'h6)]));
          reg6 <= (8'ha9);
          if (($unsigned($signed($signed({(8'hba),
              wire2}))) + $unsigned((reg8[(5'h12):(3'h7)] >>> ((wire1 ?
              reg5 : wire1) >> $unsigned(wire0))))))
            begin
              reg7 <= wire2;
            end
          else
            begin
              reg7 <= ((wire3 ^~ reg11[(4'h9):(4'h9)]) ?
                  (^$unsigned($unsigned({(8'ha3),
                      reg6}))) : ((-reg11) << (^reg6)));
              reg8 <= ($unsigned(wire1[(4'h8):(3'h6)]) <<< reg5[(3'h4):(2'h3)]);
              reg9 <= (^reg10);
            end
        end
      if (reg6)
        begin
          reg12 <= reg10;
        end
      else
        begin
          if ((reg8[(3'h4):(1'h1)] ? (8'ha0) : (&$signed((8'hb5)))))
            begin
              reg12 <= reg5[(2'h3):(1'h0)];
            end
          else
            begin
              reg12 <= (&$unsigned((wire3[(1'h1):(1'h0)] >> $signed(reg7[(4'h8):(3'h6)]))));
              reg13 <= (-{{$signed((reg10 < wire1))}});
            end
        end
      reg14 <= reg13;
    end
  assign wire15 = (~&($unsigned((^~wire2[(4'ha):(4'ha)])) ?
                      (reg12 ?
                          $signed($unsigned(reg8)) : (^$unsigned((8'hae)))) : (~&reg11)));
  assign wire16 = wire2[(4'h8):(2'h2)];
  assign wire17 = (~&(!$signed(reg12[(2'h3):(2'h3)])));
  assign wire18 = ((($signed((-(8'ha5))) ?
                              {$unsigned(reg4)} : ((8'ha7) ?
                                  (reg12 << wire16) : (wire16 ?
                                      reg12 : reg11))) ?
                          ((!(reg9 ?
                              wire16 : (8'ha9))) < (reg13[(2'h3):(1'h1)] ?
                              {reg5} : {reg13, reg4})) : (reg8 << (8'hba))) ?
                      wire2[(3'h4):(2'h2)] : (+(&$signed(reg9))));
endmodule
