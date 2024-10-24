module top
#(parameter param21 = (~(+(~|((!(7'h40)) ? (~(8'ha7)) : {(8'ha2), (8'hbd)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned(((8'ha9) && (((~|(8'ha2)) ?
                     wire4 : $signed(wire1)) ^~ (wire0 ?
                     $unsigned(wire0) : $unsigned(wire3)))));
  assign wire6 = wire2;
  assign wire7 = $signed($unsigned($signed(wire0)));
  assign wire8 = $unsigned((!wire4[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(({wire1[(3'h6):(2'h2)]} ?
          wire7[(2'h2):(1'h1)] : $signed(((8'ha8) ? wire5 : wire1))))))
        begin
          reg9 <= (^($signed($unsigned(wire3[(1'h1):(1'h1)])) << ($unsigned($signed((8'h9c))) * wire2[(2'h3):(2'h2)])));
          reg10 <= wire2[(4'hb):(3'h6)];
        end
      else
        begin
          if (wire4)
            begin
              reg9 <= $signed((~|{$signed((^reg10)), wire6}));
              reg10 <= ({$signed(((wire6 != wire7) & reg9))} ?
                  (8'hb7) : ($unsigned($unsigned(wire1)) ? (8'hb8) : (8'hb1)));
              reg11 <= (((8'hb4) ?
                  reg10 : $unsigned(((~wire6) ^ (wire5 >>> reg9)))) <= (|({wire6,
                      {wire7, (8'h9c)}} ?
                  ($unsigned(wire4) << (wire3 <= wire7)) : wire6)));
            end
          else
            begin
              reg9 <= $unsigned($unsigned(((wire3 ?
                      $unsigned(wire1) : $unsigned((8'ha5))) ?
                  {wire4[(3'h4):(2'h3)]} : (&wire3))));
              reg10 <= wire3;
              reg11 <= (~&wire1);
              reg12 <= (^$unsigned(wire8));
              reg13 <= (+{$unsigned($unsigned(wire7)), $signed(wire0)});
            end
          reg14 <= ((~($signed($unsigned(reg11)) || (8'ha0))) + wire1);
        end
      reg15 <= wire8;
      reg16 <= $signed($unsigned((+((-wire5) ?
          $signed(reg9) : wire1[(3'h7):(2'h3)]))));
    end
  assign wire17 = $signed((!reg12));
  assign wire18 = $unsigned((wire2[(4'h8):(2'h3)] | ((&$signed(wire0)) >>> (8'hb0))));
  assign wire19 = (((wire18 < (((8'ha8) >> wire2) ?
                          reg16[(3'h5):(3'h5)] : (wire0 ^ wire7))) ?
                      wire5[(2'h2):(1'h0)] : {wire5[(1'h1):(1'h1)],
                          ($signed(reg15) >> (wire2 ?
                              wire3 : wire17))}) * ($unsigned(((~&(8'ha2)) ?
                      wire3 : reg15)) <= (wire4[(2'h2):(2'h2)] | $signed(reg16[(4'h8):(2'h2)]))));
  assign wire20 = (~&($unsigned({wire0,
                      wire8}) & (((~reg13) ^~ (!wire6)) == ((|(8'haf)) ?
                      (reg14 ? (8'ha3) : (7'h40)) : wire19))));
endmodule
