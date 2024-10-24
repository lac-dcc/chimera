module top
#(parameter param26 = ((((~&(&(8'hb8))) <= (((8'ha0) + (8'haa)) ? (~|(8'hb1)) : ((8'ha6) >> (8'hb0)))) ? (~|(((8'ha0) ? (8'hab) : (8'hb2)) || ((8'ha5) ? (8'hb7) : (8'hac)))) : ((((8'hb6) << (8'hb8)) * ((8'hb8) ? (8'hb9) : (8'hb6))) <<< (((8'ha9) * (7'h40)) + (~|(8'ha5))))) ^ (8'ha9)), 
parameter param27 = (((^param26) ? ({{param26, param26}} ? param26 : ({param26} ? param26 : (param26 ? param26 : param26))) : {(&param26), {param26, (param26 ? (8'ha7) : param26)}}) && ((+((param26 >= param26) ? (param26 ? (8'h9f) : param26) : (param26 ? param26 : param26))) ? {(~|((8'hbc) ? param26 : param26)), {param26, (param26 ? param26 : (8'hae))}} : (~param26))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire21;
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire21,
                 reg22,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (+wire1);
      reg6 <= $unsigned(wire0);
      if ($unsigned(reg5[(1'h1):(1'h0)]))
        begin
          reg7 <= wire2[(4'ha):(1'h1)];
        end
      else
        begin
          reg7 <= {wire0[(4'ha):(2'h2)], (8'hab)};
          reg8 <= (($unsigned((8'haf)) > wire0) ?
              $unsigned(((-reg5[(2'h3):(1'h1)]) ?
                  $unsigned((7'h40)) : $unsigned($signed((7'h44))))) : $signed({wire2[(5'h10):(3'h5)],
                  ((~^reg6) ? $signed(reg6) : $signed(wire1))}));
          reg9 <= (^$unsigned({$signed($signed(wire2))}));
          if (reg9)
            begin
              reg10 <= reg8[(3'h6):(2'h3)];
              reg11 <= $unsigned((reg6 ?
                  (wire4[(1'h1):(1'h0)] >>> $signed($unsigned(reg8))) : (reg9 ~^ $signed((reg7 || wire0)))));
            end
          else
            begin
              reg10 <= wire2;
              reg11 <= wire1[(4'hf):(4'he)];
            end
        end
      reg12 <= $unsigned((reg5 ?
          $signed($signed((~|reg5))) : (wire4 * wire0[(2'h3):(2'h3)])));
      if (((reg11[(3'h5):(1'h0)] ?
          wire2[(5'h11):(3'h6)] : (~|$unsigned({reg11,
              reg9}))) - {wire3[(2'h3):(2'h2)], {reg11[(1'h1):(1'h1)]}}))
        begin
          reg13 <= $signed((wire4[(3'h4):(3'h4)] - wire2));
          reg14 <= ((reg11[(1'h1):(1'h0)] << $signed(reg13[(4'hb):(4'h8)])) >> wire4[(2'h3):(1'h0)]);
        end
      else
        begin
          reg13 <= ((~&$unsigned(wire4)) * $unsigned(($signed((reg5 <= wire4)) ?
              reg5[(1'h1):(1'h1)] : (&reg12))));
          reg14 <= {reg8[(2'h3):(2'h3)]};
          reg15 <= ($signed($unsigned(wire4)) << reg9[(5'h13):(1'h1)]);
          reg16 <= (!((8'ha4) ? wire4[(1'h0):(1'h0)] : (&(8'ha7))));
          if ((reg14 ?
              $signed(reg15[(1'h1):(1'h1)]) : (+$signed(((+reg6) ?
                  reg13 : reg15)))))
            begin
              reg17 <= $signed(((+(|(reg6 != reg8))) ?
                  $signed(wire0) : reg7[(2'h3):(2'h2)]));
              reg18 <= reg13;
              reg19 <= {$unsigned(wire4)};
              reg20 <= $unsigned($signed((|$unsigned(((8'hb6) ^~ reg13)))));
            end
          else
            begin
              reg17 <= reg14;
              reg18 <= $signed($unsigned(({$unsigned(reg6)} + {((8'hbe) ?
                      reg7 : reg6),
                  reg13[(4'hc):(2'h2)]})));
              reg19 <= ($signed(reg6) ? (~reg5) : (&reg12[(2'h3):(2'h3)]));
            end
        end
    end
  assign wire21 = reg7;
  always
    @(posedge clk) begin
      reg22 <= ($signed($signed((reg10 ?
          (reg17 << wire0) : reg11[(1'h1):(1'h1)]))) ~^ ($unsigned(((reg9 && reg6) ?
          reg9 : (reg9 ?
              (8'hab) : (8'hbe)))) - ((wire2[(4'h8):(1'h1)] != ((8'hb1) + wire1)) ~^ wire1)));
    end
  assign wire23 = $unsigned($signed($unsigned($unsigned(reg13[(1'h1):(1'h0)]))));
  assign wire24 = (reg20[(3'h6):(2'h3)] <<< reg7[(4'h9):(3'h6)]);
  assign wire25 = $signed($unsigned(($unsigned(reg10[(5'h11):(4'h9)]) ?
                      ($unsigned((8'hbc)) ?
                          reg16[(4'h9):(3'h7)] : (~&reg11)) : (reg12 ?
                          (reg22 >> reg17) : reg22[(4'ha):(1'h1)]))));
endmodule
