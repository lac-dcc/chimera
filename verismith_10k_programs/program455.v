module top
#(parameter param20 = ((({((7'h42) == (8'haa)), ((8'hb1) ? (7'h40) : (8'hb4))} <<< (((8'h9f) ? (8'h9f) : (8'hb6)) & (8'hb1))) < {(((7'h44) ~^ (8'ha2)) != (^~(8'hbb)))}) ? {((^((8'ha7) ? (7'h40) : (8'h9f))) ? (8'ha9) : (~^((8'ha8) ? (8'hae) : (8'h9c)))), ({(^~(8'hae))} ~^ ((&(8'ha8)) ? ((7'h44) <= (8'hbd)) : ((8'hb5) ? (8'ha0) : (8'h9d))))} : ((8'hac) ? (^(((8'h9e) ? (8'ha0) : (8'ha6)) != (+(8'h9e)))) : {(((8'hbb) ? (8'ha2) : (8'hb5)) ? ((8'ha7) << (8'hb5)) : ((8'ha4) < (8'hbe)))})), 
parameter param21 = (param20 ? {(((-param20) ? (param20 ? (8'ha1) : param20) : (param20 || (8'hbd))) ? (~{param20}) : {(param20 ? param20 : param20), (param20 == param20)}), param20} : {(param20 ? param20 : (param20 ? (param20 ? param20 : param20) : param20)), param20}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
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
      reg5 <= (~(~$signed((wire1[(4'hc):(4'h9)] ? (wire2 != wire0) : wire1))));
      reg6 <= (^(~$unsigned($unsigned(reg5[(3'h4):(2'h2)]))));
      reg7 <= {reg5[(1'h0):(1'h0)], $signed($signed((8'ha3)))};
      if ($unsigned($signed(reg7[(2'h2):(1'h0)])))
        begin
          reg8 <= $unsigned((^~(!((wire1 == (8'had)) ?
              $signed(wire1) : (reg5 ? wire3 : wire4)))));
          reg9 <= (~&($signed(wire1[(3'h4):(2'h2)]) < reg8[(4'ha):(2'h3)]));
        end
      else
        begin
          if ($signed(($signed((^((8'ha1) != (8'hbe)))) ?
              (&($unsigned(wire4) ~^ $signed((8'h9f)))) : wire3)))
            begin
              reg8 <= $signed($signed((^reg7)));
              reg9 <= $unsigned((+reg5[(3'h5):(2'h2)]));
              reg10 <= ($unsigned(wire3[(2'h2):(2'h2)]) ?
                  $unsigned(wire3[(4'h8):(3'h7)]) : $signed($signed($signed({(8'ha2)}))));
              reg11 <= (($unsigned((reg9 ?
                          $signed(wire3) : wire0[(3'h7):(2'h3)])) ?
                      $signed(reg8[(4'h8):(2'h2)]) : $unsigned({{reg6,
                              reg7}})) ?
                  ((reg5[(4'ha):(4'ha)] != (wire4 >>> $signed(wire1))) || reg10) : (|$signed($unsigned((wire3 | (8'hb6))))));
            end
          else
            begin
              reg8 <= wire0[(4'hc):(4'h8)];
              reg9 <= (^wire3[(3'h5):(1'h1)]);
            end
          reg12 <= (!$unsigned((~^$unsigned((~reg10)))));
          reg13 <= $signed((^~(-($signed((7'h42)) >> wire4))));
          reg14 <= (~|(($unsigned($unsigned(wire0)) ?
              ((reg13 ? wire2 : reg12) ?
                  $signed(reg6) : {wire2}) : {$unsigned(reg13),
                  (8'hb2)}) == $unsigned(reg5)));
        end
      reg15 <= reg5;
    end
  assign wire16 = wire2;
  assign wire17 = $signed((({$signed(wire16),
                      $unsigned(reg11)} * {reg9[(3'h4):(1'h1)],
                      (wire1 & reg11)}) - ((wire1[(1'h0):(1'h0)] >= (reg12 ?
                          wire0 : (8'h9c))) ?
                      wire2[(1'h0):(1'h0)] : wire2)));
  assign wire18 = wire2[(2'h3):(2'h2)];
  assign wire19 = {$signed((!$signed(reg8)))};
endmodule
