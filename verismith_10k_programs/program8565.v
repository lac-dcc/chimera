module top
#(parameter param25 = {{(({(8'ha7)} ? {(8'hb0)} : (~&(8'ha5))) ? (^((8'hbf) ? (8'hbd) : (8'h9c))) : ((^(8'hb2)) >> ((8'hae) ? (8'hb2) : (8'h9e)))), ((!((8'ha5) ? (8'ha2) : (8'ha0))) ? (!(&(8'hb4))) : (8'hb2))}, ((~(8'hbc)) * {(+(|(8'hac)))})}, 
parameter param26 = (param25 >= (((&(param25 ? param25 : param25)) ? ((param25 | param25) || param25) : ({param25} ? (8'ha0) : param25)) ^ (^(!{param25})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (($signed($signed($unsigned(wire3))) < {($signed(wire5) >> (wire5 <<< wire5))}) + wire1[(3'h4):(2'h3)]);
  assign wire7 = {{$signed((+wire3[(2'h3):(2'h2)]))}, wire6};
  assign wire8 = wire4[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if (wire5[(1'h0):(1'h0)])
        begin
          reg9 <= (~((wire2 ? $signed(((8'h9c) ? wire1 : wire3)) : (~wire0)) ?
              $unsigned({$signed(wire6),
                  $unsigned((8'ha8))}) : (&({wire3} || wire2))));
          reg10 <= (wire7[(3'h6):(1'h1)] || ((wire4 > ($signed(wire4) ?
                  (wire1 ? wire1 : wire0) : (wire8 << wire2))) ?
              (~^(-$unsigned(reg9))) : (~^wire8)));
          reg11 <= (-wire1);
          reg12 <= $signed(wire0[(5'h10):(4'hd)]);
        end
      else
        begin
          reg9 <= wire7[(2'h3):(2'h3)];
          if (wire6[(3'h6):(2'h2)])
            begin
              reg10 <= $signed(reg9);
              reg11 <= (8'ha9);
              reg12 <= $unsigned((+($unsigned($signed((8'haf))) ^~ (-reg12))));
            end
          else
            begin
              reg10 <= reg12;
              reg11 <= $signed(((({reg11} ?
                      (wire3 << wire4) : wire3[(1'h0):(1'h0)]) << {(!wire5)}) ?
                  (^$signed($signed(wire1))) : (wire3[(1'h0):(1'h0)] ^~ {reg9[(2'h2):(1'h0)]})));
              reg12 <= $signed((~(wire6[(2'h3):(1'h1)] << $unsigned($signed(wire6)))));
            end
          reg13 <= (^~wire2[(4'he):(2'h3)]);
          reg14 <= wire8;
          reg15 <= wire4[(2'h3):(1'h1)];
        end
      reg16 <= (reg15 ?
          (reg11 ?
              ($unsigned({(8'hb3)}) ?
                  (+(~&wire3)) : (^~(wire1 >= reg13))) : ($signed($signed(reg9)) <= ((wire0 ?
                      reg9 : reg9) ?
                  (-wire5) : (reg12 ? reg9 : reg9)))) : (^{$signed(wire1),
              (&(8'haf))}));
      reg17 <= $signed({({(|wire1)} ?
              reg10[(3'h5):(2'h3)] : wire8[(3'h5):(1'h0)]),
          (({(7'h43), reg9} ? (~^wire7) : $signed((8'hb2))) ?
              (+(+reg16)) : ({(8'ha5), reg15} ?
                  wire1[(3'h5):(2'h3)] : (~&reg12)))});
      reg18 <= $unsigned((wire0 >>> $signed(($unsigned(wire2) < (wire2 ?
          reg14 : wire4)))));
      if ({reg15[(2'h2):(1'h0)]})
        begin
          if (($signed(wire0) ? $signed($signed(reg10)) : reg12))
            begin
              reg19 <= (wire1 * wire3);
            end
          else
            begin
              reg19 <= $signed(reg15[(1'h1):(1'h1)]);
              reg20 <= (+(reg15 ?
                  {$signed({reg17}),
                      ($signed((8'hab)) ?
                          reg14[(3'h7):(3'h4)] : $signed(reg13))} : wire5[(4'h9):(1'h0)]));
            end
        end
      else
        begin
          reg19 <= $unsigned($signed(((wire0[(1'h1):(1'h1)] >>> $signed(wire6)) != reg17)));
          reg20 <= (^((($unsigned(reg11) >= $signed(reg16)) < (((7'h44) || reg13) - (8'hb2))) > (8'hba)));
          reg21 <= (wire0 ?
              reg13[(3'h5):(3'h4)] : ((&((7'h44) ^ ((8'ha6) ?
                      reg15 : (8'hb7)))) ?
                  $signed((8'hb9)) : (~^$unsigned($unsigned((7'h42))))));
          if (((($unsigned($unsigned((7'h43))) | (wire4[(4'h9):(2'h3)] ?
                  $unsigned(wire8) : reg18)) ?
              wire5 : reg21[(4'hc):(1'h1)]) << wire3[(1'h0):(1'h0)]))
            begin
              reg22 <= {({$unsigned($signed(reg18)), $unsigned({wire1})} ?
                      reg10[(1'h0):(1'h0)] : $signed(reg12[(3'h4):(3'h4)]))};
            end
          else
            begin
              reg22 <= (((-$unsigned($signed(reg20))) <= ((|(reg13 ?
                      reg12 : reg15)) >> $signed({reg11}))) ?
                  wire3 : (~($unsigned($signed(reg20)) != (reg14[(5'h10):(5'h10)] | (8'hb0)))));
            end
        end
    end
  assign wire23 = $signed($signed(($unsigned($signed(reg20)) >= ((|reg13) != wire7[(4'h8):(3'h6)]))));
  assign wire24 = ($unsigned(({reg12} ?
                          (~&(reg11 ? reg22 : reg17)) : $unsigned((wire7 ?
                              (8'hb6) : reg17)))) ?
                      (~^(|reg10)) : reg11);
endmodule
