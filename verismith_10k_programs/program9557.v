module top
#(parameter param18 = (((+{((8'had) ? (8'ha5) : (8'h9e))}) && (((+(8'hb4)) && ((8'hb6) ? (8'hbc) : (8'hbe))) + ((~^(7'h40)) ? (!(8'hb1)) : ((8'hac) ? (8'hac) : (8'h9d))))) - ((8'hb5) ? ((((8'ha7) >>> (8'ha8)) ? ((8'hab) ? (8'hb2) : (8'ha9)) : (-(8'hb3))) >> (((7'h42) > (8'hac)) ? ((8'haf) != (8'hbf)) : ((8'ha4) | (8'h9c)))) : (|(((7'h43) << (8'hab)) ? (~^(8'hbb)) : ((8'hab) == (8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire10,
                 wire9,
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
                 (1'h0)};
  assign wire5 = $unsigned((~^wire0[(5'h11):(4'hf)]));
  assign wire6 = wire5;
  assign wire7 = wire2[(2'h3):(2'h2)];
  assign wire8 = (wire1[(4'hf):(4'hb)] ?
                     $signed($unsigned($signed((wire1 != (8'h9d))))) : $unsigned(((^~$unsigned((8'hb6))) != ($unsigned((8'hb0)) ?
                         wire2 : (wire0 ? wire7 : (8'hbd))))));
  assign wire9 = (wire3[(3'h6):(3'h5)] ?
                     {wire4[(1'h0):(1'h0)]} : $unsigned(((^~((8'hb6) ?
                             (8'ha8) : wire2)) ?
                         $unsigned((wire0 < (7'h43))) : (~^$signed(wire0)))));
  assign wire10 = ($signed(wire9[(2'h3):(2'h3)]) ^ ((wire5[(1'h0):(1'h0)] ?
                          $signed({wire9, wire0}) : {wire9[(1'h1):(1'h1)]}) ?
                      ({(~^wire7), ((8'haa) ? wire0 : wire4)} << {(-wire7),
                          {wire9, wire0}}) : (~{(|(8'hb4)),
                          wire3[(4'h9):(3'h4)]})));
  always
    @(posedge clk) begin
      reg11 <= (^~$signed({wire1, wire5[(2'h2):(1'h1)]}));
      reg12 <= (wire6 >= $signed($unsigned({(wire9 ? wire4 : reg11),
          $unsigned(wire10)})));
      reg13 <= (~&$signed(reg12));
      if ({($unsigned($unsigned((~wire0))) & $unsigned({(^~wire1),
              (wire6 >> reg13)})),
          wire5[(4'h9):(2'h3)]})
        begin
          reg14 <= $signed((~|(~&wire7[(4'hc):(2'h3)])));
          reg15 <= ($unsigned({wire8[(4'hc):(4'h9)],
              $unsigned(reg14)}) < (~&$unsigned((8'hb2))));
        end
      else
        begin
          reg14 <= $unsigned((~$signed($unsigned({reg12}))));
          reg15 <= (($signed(wire2[(1'h0):(1'h0)]) ?
                  {($signed(reg11) ? (^reg15) : (reg15 - reg15)),
                      (wire2 ?
                          (^wire9) : $signed(wire6))} : $signed($unsigned($unsigned(wire3)))) ?
              $unsigned(wire9[(1'h1):(1'h1)]) : ((^~($unsigned(wire0) != {wire9,
                      reg15})) ?
                  (&$unsigned($unsigned((8'hbc)))) : $signed((reg15 ?
                      {wire3} : $unsigned(wire1)))));
        end
      reg16 <= wire4[(3'h7):(2'h2)];
    end
  assign wire17 = (&((8'hbc) ?
                      ($signed((wire2 ? wire5 : wire8)) ?
                          wire2 : $unsigned((~&reg14))) : (-wire4)));
endmodule
