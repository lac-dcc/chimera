module top
#(parameter param22 = (({(((8'haf) ~^ (8'hbc)) ? {(8'h9c), (8'ha0)} : (^(8'hb4))), (8'ha3)} > {(((8'hb7) + (8'hb3)) - ((8'hb1) ? (8'haf) : (8'hbd))), {(~&(8'hb7)), ((8'ha6) ? (8'hac) : (8'hbd))}}) ? {((7'h43) ? (((8'hab) ? (8'ha3) : (8'ha2)) ? ((8'ha5) ? (8'haa) : (8'ha4)) : (|(8'ha6))) : (((8'h9c) >>> (8'ha8)) ? ((8'hae) ? (8'ha0) : (7'h40)) : ((8'hb9) >> (8'hb1))))} : (~&({(!(8'ha7)), ((8'ha9) << (8'h9d))} ? (((8'hb3) ? (8'hae) : (8'hac)) + ((8'hb1) ? (8'hb9) : (8'ha4))) : {{(8'hbf)}, ((8'hb5) ? (7'h44) : (7'h42))}))), 
parameter param23 = (((~^(-param22)) ? param22 : {((param22 <<< param22) != {param22, param22}), ((|param22) < (param22 && param22))}) ? ((|(param22 ? (param22 ? param22 : param22) : (param22 ^ param22))) ? (((param22 ? (8'hb1) : (8'hb5)) || (+param22)) ? param22 : ((~^param22) || (param22 > param22))) : ({{param22}, param22} ? {(~^param22), ((8'hba) ? param22 : param22)} : (!(param22 && param22)))) : (param22 ? (!((+param22) ? (param22 ^~ param22) : {param22})) : (((param22 <= param22) <<< {param22}) ? (((8'h9e) | param22) ? (param22 ? param22 : (8'hbd)) : (7'h41)) : (~&(-param22))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
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
  assign wire5 = ((~&{$signed((^~wire0))}) ?
                     (^~$unsigned((7'h42))) : wire4[(3'h5):(2'h3)]);
  assign wire6 = {$signed($unsigned($signed($signed(wire4))))};
  always
    @(posedge clk) begin
      reg7 <= wire3;
      reg8 <= $signed($signed(wire0[(4'h9):(3'h5)]));
      reg9 <= (($signed(wire5[(2'h2):(2'h2)]) ?
          wire0 : $unsigned(((wire2 ? (8'ha7) : wire5) ?
              {wire1,
                  wire6} : {wire1}))) <<< ($signed($signed($unsigned(wire5))) ?
          wire5 : ((~&wire6[(1'h0):(1'h0)]) ^~ (~(~&wire3)))));
      if ($unsigned(wire0[(2'h2):(1'h1)]))
        begin
          if (wire3)
            begin
              reg10 <= $signed(reg8[(2'h2):(2'h2)]);
              reg11 <= (((-{(!(8'hb1))}) ?
                      ({wire6,
                          ((8'hb7) ?
                              wire2 : wire2)} * wire1[(2'h2):(2'h2)]) : wire2) ?
                  $signed(((reg7[(1'h1):(1'h1)] <<< $unsigned(wire3)) ?
                      (8'ha6) : (reg8 <<< $unsigned(wire5)))) : (^$unsigned($unsigned($signed((8'ha3))))));
              reg12 <= (~(reg11 * reg8));
            end
          else
            begin
              reg10 <= (^$unsigned(($signed(reg11) ?
                  ($unsigned(wire2) > (^reg7)) : (wire0[(3'h5):(1'h1)] & $signed(wire0)))));
            end
          reg13 <= $unsigned((|(8'hae)));
          reg14 <= wire5[(2'h2):(1'h0)];
          reg15 <= (reg13[(1'h1):(1'h1)] == $unsigned((~^{(wire2 ^~ wire6)})));
          reg16 <= (!wire2[(4'hd):(4'hd)]);
        end
      else
        begin
          reg10 <= $signed((({$unsigned(wire0), wire2} ?
                  $unsigned(reg9[(1'h1):(1'h0)]) : ((wire1 ? reg14 : wire1) ?
                      $unsigned(wire2) : reg8)) ?
              reg15 : {(^reg16),
                  ({(8'h9c)} ? (+wire0) : reg16[(3'h6):(2'h2)])}));
          reg11 <= reg12;
          reg12 <= (|(!wire3[(2'h2):(2'h2)]));
        end
    end
  assign wire17 = (&wire2);
  assign wire18 = (-($unsigned((-(8'ha9))) ^~ wire1[(4'hd):(3'h4)]));
  assign wire19 = (|$signed($signed(wire3[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg20 <= wire18;
      reg21 <= (&(-{((8'ha9) ? (^wire18) : (reg14 ? reg11 : reg7)),
          $signed(wire6)}));
    end
endmodule
