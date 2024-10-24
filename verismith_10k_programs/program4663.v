module top
#(parameter param23 = (^~((((7'h42) ? {(8'hba), (8'ha4)} : (&(7'h41))) ? (|(8'had)) : {((8'hb4) ? (8'hb5) : (8'hbd))}) - ((((7'h41) ? (8'hb6) : (8'hbc)) ? ((8'hba) ? (8'hb4) : (8'ha2)) : ((8'hb7) * (8'h9f))) ? (((8'hb5) ~^ (8'ha3)) <<< (^~(8'hb1))) : ({(8'h9e)} ? ((8'ha6) ? (7'h41) : (8'h9f)) : {(8'ha7), (8'ha0)})))), 
parameter param24 = (param23 ? ((8'hbc) | param23) : ((((param23 ? (8'hbc) : param23) < (param23 <= param23)) ^ param23) + (({param23} ? {param23} : (param23 ? param23 : param23)) && (~|(param23 - param23))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire4,
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
  assign wire4 = $unsigned({(wire1 ^~ ($unsigned((8'hb5)) >>> (~&wire1))),
                     wire0});
  always
    @(posedge clk) begin
      reg5 <= {wire0, wire4};
      reg6 <= $unsigned($unsigned(wire0));
      if ($signed(wire2[(4'ha):(1'h0)]))
        begin
          reg7 <= ($unsigned(wire0[(1'h1):(1'h0)]) ?
              $unsigned(reg5) : ((&reg6) ?
                  $signed($signed(wire4[(3'h5):(1'h1)])) : (^~{(reg6 ?
                          wire2 : reg6),
                      wire4})));
        end
      else
        begin
          reg7 <= $unsigned(reg5);
          if ($signed(reg5[(1'h0):(1'h0)]))
            begin
              reg8 <= ($signed((^~$signed(wire1))) ?
                  wire1[(1'h0):(1'h0)] : {wire0});
              reg9 <= wire4;
              reg10 <= reg9[(3'h6):(3'h6)];
              reg11 <= {((~$signed({wire2})) ?
                      reg5[(1'h1):(1'h0)] : $signed($signed(wire3)))};
              reg12 <= $signed($signed((~&$signed($unsigned(wire4)))));
            end
          else
            begin
              reg8 <= reg7[(3'h5):(1'h0)];
              reg9 <= (+reg12);
            end
          reg13 <= {$signed((~^$signed($unsigned(reg5))))};
          reg14 <= reg8;
        end
      if ((~reg11))
        begin
          reg15 <= wire3;
          if ((($unsigned((wire2 + $signed(reg13))) > (|((!reg8) ?
              reg8 : {reg6, reg15}))) << reg7))
            begin
              reg16 <= $signed($unsigned((reg9 ?
                  (((8'hb1) ? reg11 : (8'h9c)) > $unsigned(reg11)) : {{reg9,
                          wire1}})));
              reg17 <= (&((reg11[(5'h12):(2'h2)] ? reg5 : reg6[(1'h0):(1'h0)]) ?
                  wire4 : $signed($signed($unsigned(reg14)))));
              reg18 <= (reg11 ^~ $signed(reg7[(4'h8):(3'h4)]));
              reg19 <= reg7;
              reg20 <= {(8'hb9)};
            end
          else
            begin
              reg16 <= reg12[(3'h6):(1'h1)];
              reg17 <= wire0;
              reg18 <= reg11[(5'h11):(3'h6)];
            end
        end
      else
        begin
          reg15 <= reg9[(2'h2):(1'h0)];
          reg16 <= ({$unsigned($signed((reg8 - reg5)))} ?
              (($unsigned((wire3 ? reg20 : (8'hba))) ?
                  ((reg17 ? reg8 : reg16) ?
                      {reg7, reg13} : (wire4 ?
                          reg11 : reg18)) : $signed(reg5)) >= (&reg11)) : ($unsigned((reg11[(3'h6):(1'h1)] ?
                      (reg19 ? reg15 : wire4) : $signed(reg14))) ?
                  {$signed((reg11 >= (7'h41)))} : reg15[(3'h6):(1'h0)]));
        end
    end
  assign wire21 = (reg13[(4'hc):(3'h5)] * $signed(reg17));
  assign wire22 = ($unsigned(reg5[(1'h0):(1'h0)]) ?
                      {$unsigned(reg14)} : $unsigned($signed((|reg9[(3'h4):(2'h3)]))));
endmodule
