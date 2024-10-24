module top
#(parameter param26 = (^~(|(~&((8'haf) >= (8'hb8))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire3)))
        begin
          if (wire5[(1'h0):(1'h0)])
            begin
              reg6 <= $signed((wire0[(1'h1):(1'h1)] ~^ wire2));
              reg7 <= ({(^~$unsigned($signed(wire2)))} ?
                  ($unsigned($signed((^wire5))) && ({reg6[(3'h4):(2'h3)],
                          $unsigned(reg6)} ?
                      wire5[(2'h2):(2'h2)] : wire1[(2'h3):(1'h1)])) : $unsigned((($unsigned(wire2) ?
                      (wire5 ? reg6 : (8'hbb)) : {wire2, wire0}) - {{wire4,
                          wire2},
                      ((8'ha6) ? wire1 : wire5)})));
              reg8 <= ({$signed($signed($unsigned((8'hbc)))),
                  reg7[(2'h2):(1'h1)]} ^~ ($signed((~&(~|(8'ha6)))) ?
                  (~&($unsigned(wire3) != wire4)) : (|{wire3[(2'h2):(2'h2)]})));
              reg9 <= $signed(((($unsigned(wire0) ?
                      $signed(wire0) : (wire2 ?
                          wire3 : reg7)) - (~^reg7[(2'h2):(2'h2)])) ?
                  $unsigned(wire4) : ((wire1 && (reg6 ?
                      (8'hb3) : wire2)) | {$signed((8'h9c))})));
              reg10 <= (~&wire4);
            end
          else
            begin
              reg6 <= ($unsigned((&$unsigned(wire4))) ? wire5 : wire1);
              reg7 <= wire2;
              reg8 <= wire1[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg6 <= wire5;
          reg7 <= ({({wire5} ? $signed(wire2) : $unsigned((wire5 == wire1))),
                  $signed(wire0)} ?
              (8'hb4) : $signed((reg7 ?
                  wire1 : ((reg7 ? reg8 : (8'ha7)) ?
                      reg7[(4'hd):(3'h4)] : (reg8 ? reg8 : (8'h9c))))));
          if (((wire4[(2'h2):(1'h1)] ? (^wire4) : wire2[(3'h7):(2'h3)]) ?
              $unsigned(($unsigned(wire2) << ((reg7 <= reg8) ?
                  wire0[(2'h2):(1'h1)] : (wire5 ?
                      reg10 : reg9)))) : {$signed(({wire5, reg10} ?
                      $unsigned(wire0) : (wire3 ? wire3 : (8'hb1)))),
                  {wire1, {$unsigned(wire2), (wire3 ? wire2 : (7'h42))}}}))
            begin
              reg8 <= (-reg7[(2'h3):(1'h0)]);
              reg9 <= {{(~^$unsigned({wire0, reg8})),
                      (^~(reg6 ? $signed(wire0) : (reg7 ? (8'hac) : wire4)))}};
            end
          else
            begin
              reg8 <= {wire5[(1'h1):(1'h0)], $signed(wire0[(5'h13):(4'he)])};
              reg9 <= (~^{({wire0[(5'h12):(1'h0)]} * $unsigned((reg8 ?
                      wire2 : reg9))),
                  wire3[(1'h0):(1'h0)]});
              reg10 <= reg9;
              reg11 <= (^{wire1});
              reg12 <= ($signed($signed(($unsigned((8'h9c)) + wire3[(2'h3):(1'h1)]))) ?
                  $signed(wire2) : reg6[(2'h3):(2'h2)]);
            end
          reg13 <= {(reg8 ?
                  $unsigned($unsigned($unsigned(wire0))) : ((^~(-reg11)) ?
                      reg7[(3'h4):(1'h1)] : ((^(8'hab)) ?
                          (&(8'hb7)) : $signed(wire3))))};
        end
      if ((reg12 < wire2))
        begin
          reg14 <= $unsigned({(($signed(wire5) ?
                  reg7 : $unsigned(reg11)) >>> wire1[(1'h0):(1'h0)])});
          reg15 <= (((^$unsigned(reg8[(4'ha):(3'h7)])) ?
                  (^~$signed($signed((8'hb0)))) : (!((reg7 ?
                      wire1 : (8'ha3)) || wire5))) ?
              {$signed(reg7[(2'h3):(1'h1)]),
                  (+$signed({wire1, wire5}))} : (|reg9));
          reg16 <= {$unsigned((-$unsigned((wire3 ? wire4 : (8'hae)))))};
          reg17 <= $signed($signed((+(8'hb1))));
          reg18 <= (reg10 ^~ (wire4 ? wire4 : reg14));
        end
      else
        begin
          reg14 <= $unsigned(($unsigned($unsigned((reg14 ? (8'ha5) : reg13))) ?
              (((+reg7) ?
                  wire1 : $signed(reg16)) > reg18[(2'h2):(1'h0)]) : (~|wire2)));
          reg15 <= $unsigned($unsigned($unsigned((~^$unsigned(reg7)))));
          reg16 <= {{($signed({wire4}) || wire5[(1'h0):(1'h0)]),
                  ($signed(reg14) ?
                      ((reg14 ?
                          (8'ha2) : reg9) != (reg16 >>> (7'h42))) : $unsigned((^~(8'ha2))))}};
          if ((~|$unsigned($unsigned(((reg15 ^~ reg11) ?
              $signed((8'haa)) : (wire2 >= reg9))))))
            begin
              reg17 <= {$unsigned(wire2)};
              reg18 <= $signed(((|(wire1[(1'h0):(1'h0)] ?
                      $unsigned((8'hb0)) : (+reg10))) ?
                  (($signed((8'hab)) & (8'h9e)) || ({wire1,
                      wire0} ~^ reg11[(3'h5):(1'h0)])) : reg12));
              reg19 <= (~&$signed((8'hbd)));
              reg20 <= $unsigned(reg13);
            end
          else
            begin
              reg17 <= wire5;
            end
        end
      reg21 <= reg8;
    end
  assign wire22 = reg16;
  assign wire23 = (!reg15[(2'h2):(1'h1)]);
  assign wire24 = {reg15,
                      ($signed((~|(~&wire22))) ?
                          (reg15[(1'h1):(1'h1)] > ((^reg11) ?
                              (^~wire23) : {reg15})) : $signed(reg20[(1'h1):(1'h1)]))};
  assign wire25 = (~(!reg8[(4'hf):(3'h7)]));
endmodule
