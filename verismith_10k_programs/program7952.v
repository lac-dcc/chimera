module top
#(parameter param26 = (((~&(^~(8'hbe))) ? (^{(|(8'h9d))}) : (-((8'h9d) ? ((8'hb6) ? (7'h41) : (8'ha8)) : ((8'hac) ? (8'hba) : (8'hbb))))) >= {({((8'hbf) ? (8'ha8) : (8'hbb))} ^ (-((8'hbd) & (8'hb0)))), ((8'hb8) <= ((!(7'h43)) && (8'hb7)))}), 
parameter param27 = (-({(8'ha5), ((8'hb2) - (&param26))} ? (^~({param26, param26} != (param26 < param26))) : (~|(^(param26 - param26))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire6,
                 wire5,
                 wire4,
                 reg22,
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
                 (1'h0)};
  assign wire4 = $unsigned((wire3 >> $unsigned(({wire3, wire3} ?
                     wire3 : wire1[(2'h2):(1'h0)]))));
  assign wire5 = $signed((~^wire2));
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      if (({({$signed(wire0), (wire6 ? wire4 : wire6)} ?
              $unsigned((7'h40)) : $unsigned(((8'hb5) && wire0))),
          wire1} - $signed(wire0)))
        begin
          reg7 <= $signed((+(((~|wire3) ?
                  (wire5 ? wire4 : wire0) : $unsigned(wire3)) ?
              (wire4 ?
                  $signed(wire3) : (^~(8'ha5))) : ((wire0 != wire6) | ((8'hb6) ?
                  wire3 : wire3)))));
        end
      else
        begin
          if ({$signed({(~|$unsigned(wire5))})})
            begin
              reg7 <= $signed((wire0[(4'h9):(3'h6)] ?
                  (8'hac) : reg7[(4'hc):(4'h8)]));
              reg8 <= reg7[(3'h5):(3'h4)];
              reg9 <= {(+{((&wire5) > $signed(wire4))})};
              reg10 <= ($signed(reg8) ?
                  $signed(wire4) : (&(!($unsigned((8'hb7)) | (wire2 > reg7)))));
            end
          else
            begin
              reg7 <= $unsigned(wire4);
              reg8 <= ($signed((^~$signed($unsigned(reg7)))) ?
                  (reg10[(4'h8):(3'h5)] <= $signed(((!reg7) > (^reg9)))) : $unsigned({(|$signed(reg10)),
                      (wire6[(2'h3):(1'h0)] ? (~&wire6) : (8'hb6))}));
              reg9 <= $signed((&$unsigned(wire0)));
            end
          reg11 <= $unsigned((wire0 >> wire2));
          reg12 <= reg7;
          reg13 <= ($signed({$unsigned(wire2[(2'h2):(1'h1)]),
                  ((reg7 ? wire6 : wire3) >= (reg7 ? wire0 : wire5))}) ?
              (wire2 || reg11) : (^$unsigned((reg9 ?
                  wire3[(4'h8):(3'h4)] : (wire5 != wire4)))));
        end
      if (reg7[(4'hc):(4'hc)])
        begin
          reg14 <= wire0;
          reg15 <= $signed(reg11);
          reg16 <= ((&(+$signed(reg12[(4'ha):(2'h3)]))) ?
              ($unsigned($signed(wire4)) > (~^$unsigned((wire0 >= reg9)))) : wire6[(2'h3):(1'h1)]);
          if ((+(8'ha6)))
            begin
              reg17 <= reg12[(3'h7):(3'h6)];
              reg18 <= (~|$signed(($unsigned($unsigned(reg7)) && $unsigned((-(8'hb4))))));
            end
          else
            begin
              reg17 <= (-((8'hb1) ~^ {((+reg9) ? reg9 : reg8),
                  {$unsigned(reg14), {reg17, wire3}}}));
              reg18 <= ((wire6[(2'h2):(1'h0)] + {$signed({wire6, wire2})}) ?
                  (7'h43) : (&((8'h9c) >>> ($signed(wire4) <<< (reg7 ?
                      wire2 : reg12)))));
              reg19 <= reg14;
              reg20 <= $signed(reg19[(4'hc):(3'h5)]);
              reg21 <= $unsigned((wire3 ?
                  $signed(wire0[(3'h6):(1'h1)]) : wire0));
            end
          reg22 <= $unsigned($signed({wire4,
              (reg18[(3'h6):(2'h2)] ? (^~reg8) : (reg9 ? reg17 : reg17))}));
        end
      else
        begin
          reg14 <= ($unsigned($unsigned($unsigned(wire3))) ?
              reg17[(1'h1):(1'h1)] : $signed($signed(reg11[(1'h1):(1'h1)])));
          reg15 <= wire6;
          reg16 <= {(((~(reg19 ? wire6 : wire0)) ?
                      ((|reg7) * reg17[(4'hd):(4'ha)]) : (~&(reg13 ?
                          wire4 : reg8))) ?
                  $signed((((8'haf) + reg13) ?
                      (~^reg22) : ((8'hae) ?
                          (8'had) : reg7))) : $unsigned((-(wire6 ?
                      (8'hb3) : reg21)))),
              reg19};
        end
    end
  assign wire23 = reg16;
  assign wire24 = wire0[(4'h9):(1'h0)];
  assign wire25 = reg21;
endmodule
