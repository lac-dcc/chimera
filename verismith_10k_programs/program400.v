module top
#(parameter param20 = (({{((8'hb1) ? (7'h42) : (8'ha7))}} ? {(&(~^(8'hbd))), (~^((8'hbe) & (8'hbf)))} : (((!(8'h9d)) >= ((8'ha3) ? (8'haf) : (8'ha9))) ? ((~&(8'ha1)) & (&(8'h9f))) : (((8'hab) ? (8'hb3) : (8'hb5)) ^~ ((8'hb9) ? (8'hb0) : (8'hb8))))) == (((7'h42) ? (~&(~&(8'hb9))) : (((8'hb7) ^~ (7'h40)) ? ((8'hbd) & (7'h40)) : ((8'hb0) || (8'hb4)))) ? ((((8'hab) ^~ (8'ha0)) ? {(8'ha4), (8'hbb)} : (~^(8'ha3))) != (((8'hbd) != (8'haf)) ? (^(8'h9f)) : ((8'hab) + (8'hba)))) : (({(7'h43)} ? (7'h42) : ((7'h41) >= (8'ha4))) ^~ ((8'hbf) + ((8'hb8) ? (8'hb7) : (8'ha1)))))), 
parameter param21 = (^~param20))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire4,
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
  assign wire4 = $unsigned({(^~(wire0 ? $unsigned(wire3) : wire3)),
                     (wire0 ? wire3[(2'h2):(2'h2)] : $unsigned(wire2))});
  always
    @(posedge clk) begin
      if ($signed((8'hb4)))
        begin
          if ($unsigned((($unsigned(wire4[(3'h5):(1'h0)]) <<< wire3) && wire3)))
            begin
              reg5 <= wire4[(3'h4):(1'h1)];
              reg6 <= $unsigned(wire3);
              reg7 <= $unsigned((~^$unsigned(wire3)));
              reg8 <= $signed((|wire3[(4'hb):(4'h9)]));
            end
          else
            begin
              reg5 <= (({$unsigned($signed(reg8)),
                  wire4[(2'h3):(2'h2)]} & $signed((wire1 ?
                  (&reg7) : $signed(wire3)))) > wire2);
              reg6 <= (^~((((reg8 * wire0) ~^ reg8) ?
                  ({reg6,
                      wire0} - $signed(reg6)) : $unsigned($unsigned(reg8))) == wire2));
              reg7 <= $signed(((reg6 == {$signed(wire3)}) <<< wire1[(1'h1):(1'h0)]));
            end
          reg9 <= $unsigned(wire3);
          reg10 <= reg8[(3'h5):(3'h4)];
          reg11 <= reg5[(2'h3):(2'h2)];
          reg12 <= ($signed(((~|wire3) < $signed((reg9 ? (8'ha7) : reg5)))) ?
              $unsigned((|{reg11,
                  {wire4,
                      reg9}})) : ((wire3 ^ {(wire4 != (8'ha3))}) <= wire2[(2'h2):(1'h0)]));
        end
      else
        begin
          reg5 <= $signed((~|(((reg8 - reg8) ?
                  $signed(reg9) : $unsigned((8'hb4))) ?
              ((&reg6) > (wire1 ? (8'had) : reg7)) : (^~(wire2 + wire3)))));
          reg6 <= ($unsigned(reg10) ?
              (!(((wire4 >= reg10) ?
                  $signed(reg7) : (wire3 ?
                      wire0 : reg8)) <<< {wire1[(2'h3):(2'h2)],
                  wire0[(1'h0):(1'h0)]})) : (wire4 ?
                  $signed((~reg9[(2'h2):(2'h2)])) : {(8'hab)}));
          if (((+({(wire3 - reg6)} <<< $unsigned({reg5, reg9}))) <= wire1))
            begin
              reg7 <= (!(reg12 - $signed($signed((reg8 ? wire0 : wire2)))));
              reg8 <= reg12;
              reg9 <= $signed(wire4);
              reg10 <= $signed(reg7[(2'h3):(1'h0)]);
              reg11 <= (-wire4[(1'h1):(1'h1)]);
            end
          else
            begin
              reg7 <= reg5[(2'h3):(1'h1)];
              reg8 <= ((-($unsigned({reg5}) <= (^{reg10}))) ?
                  ({wire0[(4'h9):(2'h2)]} && reg8) : $unsigned((((~&wire0) - (~^wire0)) ?
                      $signed({(8'hbb)}) : (|(wire0 ? wire0 : reg12)))));
              reg9 <= ((wire4 >>> {(reg5[(2'h2):(2'h2)] ?
                      $unsigned(reg7) : reg5[(1'h1):(1'h1)]),
                  ($unsigned((8'hbc)) << (reg8 >>> (8'hb9)))}) + reg5[(2'h3):(1'h1)]);
            end
        end
      reg13 <= wire3;
      reg14 <= reg6[(1'h1):(1'h1)];
    end
  assign wire15 = wire2[(1'h1):(1'h0)];
  assign wire16 = wire15;
  assign wire17 = $signed(reg6[(1'h0):(1'h0)]);
  assign wire18 = $unsigned($unsigned($unsigned({(~^(8'hbb)),
                      (wire0 ~^ wire3)})));
  assign wire19 = reg14;
endmodule
