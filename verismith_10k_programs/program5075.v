module top
#(parameter param55 = {((8'hbd) ? (|((^~(8'ha0)) >>> (-(8'had)))) : (~^((~|(8'hac)) ? ((8'hb3) ? (7'h44) : (8'ha7)) : ((7'h40) >>> (8'hae)))))}, 
parameter param56 = ((8'ha7) ? (~^((param55 ? (param55 | param55) : {param55, param55}) - ((param55 ? param55 : param55) | (param55 ? param55 : param55)))) : param55))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire41;
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire22,
                 wire4,
                 wire41,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire4 = {(!$signed(wire2)), $unsigned(wire3[(3'h5):(2'h3)])};
  module5 #() modinst23 (.wire7(wire1), .wire8(wire3), .wire10(wire4), .wire6(wire2), .clk(clk), .wire9(wire0), .y(wire22));
  module24 #() modinst42 (wire41, clk, wire2, wire3, wire0, wire22, wire1);
  assign wire43 = $signed($signed({$unsigned((8'ha1)),
                      $unsigned($unsigned(wire2))}));
  assign wire44 = $signed($signed(wire1[(4'he):(3'h4)]));
  assign wire45 = (($unsigned(wire1[(4'h8):(3'h7)]) - ({wire4} & ($unsigned(wire4) ?
                          $signed(wire44) : wire41))) ?
                      wire1 : {(wire41[(1'h1):(1'h1)] ?
                              (~|(wire1 ? wire44 : wire41)) : (!{wire3}))});
  assign wire46 = (|((8'h9d) ? wire3[(1'h0):(1'h0)] : wire4[(3'h6):(1'h0)]));
  always
    @(posedge clk) begin
      reg47 <= wire43[(2'h2):(1'h1)];
      reg48 <= $unsigned(wire45);
      reg49 <= (&reg48[(2'h3):(2'h2)]);
      if ($signed(((^$signed((wire41 ?
          reg48 : wire1))) != {((|wire41) << (|(7'h44))),
          ({(8'ha3)} ? wire2 : (8'h9c))})))
        begin
          reg50 <= (((reg48 ?
                  reg47 : wire44[(1'h0):(1'h0)]) <= {$signed((reg48 | reg49)),
                  wire46[(2'h3):(2'h2)]}) ?
              ((reg47 ?
                  wire44 : $unsigned((wire45 ?
                      wire3 : (8'hb1)))) != $unsigned($unsigned($signed(wire2)))) : {reg49[(4'h8):(3'h7)]});
          reg51 <= ({$unsigned((|reg48[(4'he):(1'h0)]))} >= wire44);
        end
      else
        begin
          reg50 <= $unsigned(({((reg51 < wire1) ? (^~reg51) : $signed(wire44)),
                  $unsigned((^wire2))} ?
              (~^((wire45 ? wire3 : wire22) ?
                  (!(8'ha7)) : (~&wire45))) : (reg51 ^ (wire3[(3'h4):(3'h4)] ?
                  ((8'ha2) ? reg48 : reg48) : wire2))));
          reg51 <= $unsigned(reg51[(4'h9):(3'h4)]);
        end
      reg52 <= (wire45[(3'h4):(2'h2)] ^ wire0[(2'h2):(1'h1)]);
    end
  assign wire53 = ($unsigned((wire44[(3'h6):(3'h6)] > {$unsigned(wire4)})) ~^ $unsigned(({$unsigned(wire22)} ?
                      reg52 : wire1[(4'he):(3'h7)])));
  assign wire54 = (^~(wire45[(3'h4):(1'h0)] ?
                      $signed({$signed((8'h9e))}) : wire0[(1'h0):(1'h0)]));
endmodule

module module24
#(parameter param39 = ((((^((7'h41) * (8'had))) | ((8'h9d) * {(8'ha3), (8'ha1)})) && ((((8'hab) <= (8'hb5)) == ((8'had) ? (8'hbb) : (8'hba))) ~^ (((8'ha8) ? (8'h9d) : (8'ha5)) - ((8'had) > (8'haf))))) ? (!((((8'hbd) && (8'ha5)) - ((8'ha2) ? (8'hb9) : (8'hbd))) ? ((~&(8'hb0)) - (~(8'hae))) : (((7'h41) << (8'hae)) | (~&(8'hb2))))) : {(|(~|((7'h43) ^~ (8'ha4)))), (8'hb0)}), 
parameter param40 = param39)
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(3'h5):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire32,
                 wire31,
                 wire30,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire30 = (-(&({$unsigned(wire27), {wire27, wire25}} * wire26)));
  assign wire31 = {({wire28[(4'ha):(4'h8)]} != wire30)};
  assign wire32 = {$signed((wire31 ?
                          wire29[(4'hf):(4'hc)] : $unsigned($unsigned(wire27)))),
                      $unsigned(wire30)};
  always
    @(posedge clk) begin
      reg33 <= wire32;
      reg34 <= $signed(((reg33[(4'hb):(2'h3)] ?
          wire28[(3'h7):(2'h2)] : {(^wire25), wire26}) >= wire30));
    end
  assign wire35 = wire27[(1'h1):(1'h0)];
  assign wire36 = $unsigned((&(8'hac)));
  assign wire37 = wire31[(3'h6):(1'h1)];
  assign wire38 = $unsigned(wire37[(4'h8):(3'h7)]);
endmodule

module module5
#(parameter param20 = (((7'h44) != (({(8'h9d), (8'ha1)} ? (~&(8'hbf)) : {(8'h9d)}) >> (((8'ha6) ? (8'hb8) : (8'ha8)) ? (^~(8'hae)) : ((8'ha3) ? (8'hba) : (8'hb4))))) - (!((~^(|(8'hba))) - ((~(8'hb7)) ~^ ((7'h44) ? (8'ha4) : (8'ha0)))))), 
parameter param21 = (param20 ? (param20 << ((!(~param20)) ? param20 : ({param20} ? (param20 ? param20 : param20) : ((8'hbd) + param20)))) : (8'hb4)))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = {(8'hbb), $unsigned((~^($signed(wire6) << {wire7})))};
  assign wire12 = wire8[(1'h1):(1'h1)];
  assign wire13 = $signed(wire12[(3'h5):(1'h0)]);
  assign wire14 = ($unsigned(wire6) ?
                      ({$unsigned(wire11)} ?
                          wire6 : (~|$unsigned(wire6[(5'h10):(4'hd)]))) : wire7[(2'h2):(2'h2)]);
  assign wire15 = $signed(wire6);
  assign wire16 = (wire15 - (((~(wire7 ? wire11 : wire11)) ?
                      wire15[(4'h8):(2'h2)] : {(~^wire13),
                          (&wire7)}) << ($signed($unsigned(wire6)) ^~ wire15[(4'he):(3'h6)])));
  assign wire17 = (wire9 >> wire14);
  assign wire18 = $signed({$unsigned((~^(~|wire12)))});
  assign wire19 = $unsigned($unsigned($unsigned(({wire14} >>> (wire11 != wire10)))));
endmodule
