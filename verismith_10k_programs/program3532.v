module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire19;
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire19,
                 reg40,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((($signed(wire2[(1'h1):(1'h1)]) ?
          (wire0[(2'h2):(1'h1)] || wire1[(2'h2):(1'h1)]) : (-$unsigned(wire3))) - ((^~wire3[(1'h0):(1'h0)]) ?
          wire2 : ((wire1 ? wire2 : wire0) >> (wire0 ~^ wire2)))));
      reg5 <= $signed($signed(reg4[(4'he):(4'hb)]));
      reg6 <= (wire1[(4'h8):(1'h0)] ?
          ({((8'had) ? (wire0 ? (8'h9f) : wire2) : $signed((8'h9e))),
                  ({reg4} ? (!wire3) : (reg5 ? (8'hb6) : wire2))} ?
              wire0[(1'h0):(1'h0)] : $unsigned($signed({reg4}))) : $unsigned(({(~&wire0),
              (+wire2)} <<< (^~(reg4 <<< reg4)))));
      reg7 <= (8'hba);
      if ((&$unsigned((wire1[(3'h6):(1'h1)] + $signed($unsigned(wire1))))))
        begin
          reg8 <= ($unsigned({(+(^~(8'haf)))}) - wire2);
          reg9 <= (~|$signed((^$signed(wire1))));
          if ((reg4 ^ $signed(((((8'hb4) < reg6) ?
                  (wire3 < wire0) : $signed(reg5)) ?
              reg4[(1'h0):(1'h0)] : $unsigned((reg8 ? wire0 : reg4))))))
            begin
              reg10 <= ($signed((((reg5 - wire0) ?
                          (reg4 ? reg5 : reg9) : ((7'h41) ? wire1 : reg4)) ?
                      ((reg8 ? wire3 : wire0) >= (wire3 ?
                          wire0 : wire3)) : (~&(reg7 ? (8'ha5) : wire2)))) ?
                  (-(reg8[(1'h1):(1'h0)] ?
                      wire3 : wire0)) : wire3[(3'h4):(1'h1)]);
              reg11 <= $unsigned(((^(((8'ha7) || reg5) ^~ $signed(reg9))) ?
                  (~^$signed(((8'ha7) ?
                      (8'hbc) : reg10))) : ((wire1 + $unsigned(wire1)) == wire0[(1'h0):(1'h0)])));
              reg12 <= $unsigned((|(-(~^reg9))));
              reg13 <= ($unsigned((reg5 << (reg5[(1'h0):(1'h0)] ?
                      (reg7 ? reg9 : reg9) : (wire3 ^~ wire2)))) ?
                  $unsigned((~|reg11)) : reg7[(3'h4):(1'h0)]);
              reg14 <= $unsigned(reg13[(3'h7):(3'h5)]);
            end
          else
            begin
              reg10 <= reg7;
              reg11 <= ((-($unsigned((wire2 ? wire1 : reg14)) + ((reg8 ^ reg7) ?
                  $unsigned(wire0) : (|reg9)))) <<< {(~(~^(8'hb9)))});
            end
          if ($signed(reg13[(3'h7):(1'h0)]))
            begin
              reg15 <= wire3;
            end
          else
            begin
              reg15 <= (-($signed(reg10) ? reg7[(5'h13):(4'h9)] : wire2));
              reg16 <= {$signed(wire0)};
              reg17 <= reg6;
            end
          reg18 <= (reg11 == ((~^((|reg11) <<< (~|reg5))) - ((&reg11) ?
              $unsigned(wire2[(1'h0):(1'h0)]) : ((reg10 ?
                  reg15 : reg8) >= (reg14 || reg8)))));
        end
      else
        begin
          if ((reg13 >= {(reg11 >> (+(^~reg8))),
              $unsigned(reg17[(4'h9):(1'h0)])}))
            begin
              reg8 <= ((^~reg8[(4'ha):(3'h4)]) ?
                  $unsigned(((!$signed(wire2)) + $signed(reg5))) : ((|$unsigned({reg13})) >= wire0[(1'h1):(1'h1)]));
              reg9 <= {((8'h9e) ? $unsigned((~^{(8'ha4), reg15})) : reg17),
                  (reg18 ?
                      $unsigned($unsigned($unsigned(reg7))) : $signed((reg6[(2'h2):(2'h2)] + (8'ha2))))};
              reg10 <= reg12[(1'h1):(1'h1)];
            end
          else
            begin
              reg8 <= $unsigned(reg6);
              reg9 <= (reg13[(4'h9):(3'h4)] <= reg16[(3'h5):(1'h0)]);
            end
          reg11 <= (wire2 ?
              ((($signed(reg15) > (wire2 ? wire3 : reg7)) ?
                      {(+reg12), reg17} : $unsigned(reg7)) ?
                  (-{(+reg17)}) : {($unsigned(wire2) < (8'ha2))}) : (8'ha8));
          if (($unsigned($unsigned($unsigned($signed(reg12)))) ?
              {reg18[(4'ha):(4'h8)]} : (({$unsigned((8'ha2))} < $unsigned(reg9[(2'h3):(1'h1)])) == ($signed((!(7'h44))) ?
                  (8'ha7) : (reg14 ^ (reg6 ? reg17 : reg18))))))
            begin
              reg12 <= reg13[(3'h4):(2'h2)];
              reg13 <= ((reg10[(3'h6):(1'h1)] >>> {((~|wire0) >= (reg11 ?
                      reg17 : wire3)),
                  $unsigned((wire1 ? reg13 : reg14))}) * $unsigned((8'hb4)));
              reg14 <= $signed((8'hbf));
              reg15 <= wire2[(2'h2):(1'h0)];
              reg16 <= {wire3[(1'h1):(1'h1)], wire0};
            end
          else
            begin
              reg12 <= ((reg15[(1'h0):(1'h0)] ^ reg13) ?
                  $signed(reg14) : reg7[(4'hd):(4'hb)]);
            end
        end
    end
  assign wire19 = $unsigned(((8'ha5) & (((~wire0) > (reg7 + reg17)) ?
                      reg10[(1'h0):(1'h0)] : (~$signed(reg13)))));
  module20 #() modinst33 (wire32, clk, wire3, reg8, reg10, wire19, reg14);
  assign wire34 = (-(wire32 ?
                      reg16[(3'h4):(1'h1)] : $unsigned($signed((|reg4)))));
  assign wire35 = (+reg14[(2'h3):(1'h0)]);
  assign wire36 = ($signed(reg18[(3'h4):(3'h4)]) ~^ {(8'hbc), (8'hb3)});
  assign wire37 = reg9;
  assign wire38 = reg11[(2'h3):(1'h1)];
  assign wire39 = (reg11[(1'h0):(1'h0)] && (reg10[(1'h0):(1'h0)] || ($unsigned(wire1[(1'h1):(1'h1)]) ~^ $signed(wire1))));
  always
    @(posedge clk) begin
      reg40 <= (~^$unsigned({reg9, reg4[(1'h1):(1'h1)]}));
    end
endmodule

module module20
#(parameter param30 = (((((~^(8'h9e)) ? ((8'ha2) ~^ (7'h43)) : ((8'h9d) < (8'hbc))) ? (^~((8'hbf) ? (8'hb1) : (8'ha5))) : {((8'hb3) << (8'hb5)), ((7'h40) ? (8'ha4) : (8'ha8))}) ? ((((8'ha9) ? (8'hb4) : (8'hbc)) ~^ (!(8'hae))) >>> (!((8'hb0) - (8'hb1)))) : (({(8'ha5)} ? (-(8'had)) : {(7'h40), (8'hbc)}) ? {((7'h41) ? (8'hbc) : (8'h9c)), ((8'hae) - (7'h40))} : (~{(8'ha9), (7'h41)}))) ? ((~&({(7'h42)} > ((8'ha8) ? (8'hb7) : (8'hb5)))) <= ((!(&(8'hbb))) ? (8'hb0) : {((8'ha1) | (8'haf)), ((8'ha7) ^~ (8'hbe))})) : (^((^((8'ha0) ? (8'had) : (8'hbe))) ? ((~&(8'ha0)) ? (+(8'ha1)) : {(8'hab)}) : {(+(8'hbb)), ((8'hbb) ? (8'ha5) : (8'ha2))}))), 
parameter param31 = (!((param30 ? {{param30}} : (^(~|param30))) ~^ (8'haf))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire23;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  assign y = {wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = (+$unsigned({((wire24 ? wire24 : wire21) < (wire24 ?
                          wire24 : (8'hba)))}));
  assign wire27 = wire22;
  assign wire28 = $unsigned(wire26[(1'h0):(1'h0)]);
  assign wire29 = $signed($signed((8'hb9)));
endmodule
