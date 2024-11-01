module top
#(parameter param26 = (8'hba), 
parameter param27 = ((|{({param26} && param26)}) <<< {((~&param26) ? ((8'had) ? (param26 == param26) : (param26 ? param26 : param26)) : (param26 ? (|param26) : {param26, param26})), (((8'hb5) >>> param26) >= param26)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire15,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ((8'h9c) ?
                     (wire1[(1'h1):(1'h0)] ?
                         (((wire4 ? wire0 : wire3) ^~ wire0[(3'h4):(2'h2)]) ?
                             wire3[(1'h1):(1'h1)] : (-$unsigned(wire3))) : (~$signed((~|wire1)))) : (((8'hbe) ?
                         $signed($unsigned(wire4)) : (&$unsigned(wire4))) < (~|wire0[(3'h4):(3'h4)])));
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg7 <= (~wire5[(2'h3):(1'h0)]);
          reg8 <= wire2[(2'h3):(1'h0)];
          reg9 <= wire4[(3'h4):(2'h3)];
          reg10 <= wire5[(1'h1):(1'h1)];
          reg11 <= $signed(($unsigned($unsigned((wire1 >>> wire6))) ?
              (+$unsigned($signed((8'ha6)))) : (wire6[(4'hd):(4'hb)] - ($signed(wire3) ?
                  $unsigned(reg10) : (&reg7)))));
        end
      else
        begin
          reg7 <= (^((~&(((7'h44) < (8'hbb)) + $signed((8'hb1)))) ?
              $signed(wire6[(4'ha):(2'h2)]) : ($unsigned($unsigned((8'hb0))) ?
                  wire0 : reg7[(2'h3):(1'h1)])));
          reg8 <= (((^wire3[(4'h9):(2'h2)]) ?
                  ($signed((wire2 ?
                      wire1 : reg10)) >>> $unsigned((~^reg10))) : (wire0[(2'h2):(1'h0)] == (~|wire4[(2'h2):(1'h0)]))) ?
              $signed(wire4) : reg10);
          reg9 <= ($unsigned((wire0[(1'h1):(1'h0)] ?
              ((reg11 << reg10) + wire5) : {(wire0 ?
                      reg8 : wire1)})) < reg7[(3'h5):(2'h2)]);
        end
      reg12 <= wire1;
      reg13 <= $unsigned(reg8);
      reg14 <= $unsigned(wire2);
    end
  assign wire15 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= $unsigned(reg9[(1'h1):(1'h1)]);
      reg17 <= (wire4[(4'hc):(4'hc)] ?
          ({reg8[(4'hb):(3'h7)], (-$signed(reg7))} ?
              {{{reg10}}} : {$signed((wire3 ? wire4 : reg8)),
                  (wire2 ?
                      (8'ha1) : $signed(wire1))}) : $unsigned((reg10 == (|(wire6 >> (8'h9f))))));
      reg18 <= ($unsigned((+(&(reg14 ?
          (8'ha2) : reg7)))) << {reg10[(1'h1):(1'h0)], wire6});
      reg19 <= wire15;
      reg20 <= (^~$signed($unsigned($signed(reg13))));
    end
  assign wire21 = {$signed(reg9[(3'h5):(2'h2)])};
  assign wire22 = ($signed({reg12[(4'hf):(4'ha)]}) >> wire5[(2'h3):(1'h1)]);
  assign wire23 = (!$signed($signed($signed($signed(wire22)))));
  assign wire24 = $unsigned((^~wire5[(1'h0):(1'h0)]));
  assign wire25 = (+{(8'hb5), reg7});
endmodule
