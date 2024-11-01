module top
#(parameter param21 = (~&(((((8'hb4) ? (8'ha7) : (8'hba)) == ((7'h42) || (8'hb3))) ? {((7'h41) <= (8'hb5))} : (((8'hb0) ? (8'ha6) : (8'hbe)) ^~ ((7'h41) ? (8'hb1) : (8'hb4)))) & {(((8'hba) == (8'ha9)) ? ((7'h41) ? (8'hb6) : (8'hb1)) : (!(8'hbd))), (^~(^~(8'hba)))})), 
parameter param22 = ((param21 ? (+((^~(8'hb7)) ? ((8'hab) || param21) : {(8'hbb), param21})) : param21) > param21))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = {($signed($unsigned($signed(wire0))) ?
                         ((~|(wire1 ?
                             (8'ha9) : wire2)) == (wire2[(4'h9):(1'h0)] < wire2)) : $signed(wire0))};
  assign wire5 = (($unsigned((|(wire4 ? (8'ha8) : wire2))) ?
                     $unsigned({(wire3 || wire1)}) : $unsigned($signed($unsigned(wire3)))) ~^ ((((wire1 ?
                     (8'h9d) : wire2) << (wire1 * wire2)) >= (wire4 <= wire0)) == wire1));
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = $signed(({wire5[(1'h1):(1'h0)], wire5} ?
                     $signed({(wire6 ? wire6 : wire4),
                         wire0}) : ($unsigned((wire2 >= wire4)) ?
                         $signed((wire0 * wire5)) : ((wire0 ?
                             wire0 : wire3) >>> (~wire5)))));
  assign wire8 = $signed(({wire3,
                     (^wire2)} < (($signed(wire4) != (|wire7)) >= $signed(wire7[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg9 <= {($signed(wire4[(5'h10):(3'h6)]) <= (wire2[(4'h9):(1'h1)] | (|$signed(wire0))))};
      if (wire4[(4'h9):(2'h3)])
        begin
          reg10 <= (reg9 ?
              ((^((wire8 ?
                  wire7 : wire6) | $signed(wire3))) - {(~|$unsigned(wire8))}) : $unsigned((~&reg9)));
          if ($unsigned((&$signed(wire1))))
            begin
              reg11 <= (wire0[(3'h6):(3'h5)] ^ (^~((^$signed(wire0)) ?
                  wire4[(4'h9):(1'h1)] : {(^(8'hb8))})));
              reg12 <= {$signed((((wire4 < reg10) ?
                          $unsigned(reg9) : ((8'hb7) ? (7'h42) : reg10)) ?
                      ({wire0, wire0} ?
                          (wire6 ?
                              wire1 : (8'ha4)) : (wire0 <<< wire0)) : $signed((wire8 * wire3)))),
                  $unsigned((~&wire4[(1'h0):(1'h0)]))};
              reg13 <= ($unsigned((wire2[(4'h9):(1'h0)] <<< (+$unsigned(reg11)))) > {$signed((^(reg11 + (8'hb4))))});
            end
          else
            begin
              reg11 <= {wire2[(4'h9):(1'h0)],
                  $unsigned((&wire5[(3'h7):(3'h6)]))};
              reg12 <= (&(8'hbe));
              reg13 <= reg12;
              reg14 <= wire2[(1'h0):(1'h0)];
            end
          reg15 <= wire1[(3'h4):(2'h2)];
          reg16 <= $unsigned({$signed(wire7)});
          reg17 <= (reg15 ?
              wire4[(3'h4):(3'h4)] : {(wire2 ?
                      $unsigned(wire7) : {(reg12 ? reg11 : (8'ha1))})});
        end
      else
        begin
          reg10 <= $unsigned(($unsigned($signed($unsigned((8'had)))) - {$signed($unsigned(reg11)),
              reg9[(4'ha):(3'h5)]}));
          if (((~|$signed($signed(((8'ha3) ?
              (8'hb3) : wire5)))) >> ({wire7[(1'h0):(1'h0)]} ?
              reg14 : ($signed((wire0 ?
                  (8'hb2) : reg11)) > ($signed(wire5) ^ (wire6 >>> (8'hbe)))))))
            begin
              reg11 <= $unsigned(wire6[(1'h0):(1'h0)]);
              reg12 <= ($unsigned(reg12[(1'h1):(1'h1)]) ?
                  {{((reg14 ? wire0 : reg17) || (8'hbc)),
                          (reg10 ? $signed(reg17) : reg15[(3'h4):(3'h4)])},
                      {(~^reg13[(1'h0):(1'h0)])}} : (7'h43));
              reg13 <= (&reg10);
            end
          else
            begin
              reg11 <= ($unsigned($unsigned(reg13)) ?
                  reg14[(5'h10):(3'h5)] : $unsigned($unsigned(wire2[(1'h0):(1'h0)])));
              reg12 <= reg9;
            end
          reg14 <= (wire0 ?
              $signed((&reg14)) : $unsigned($signed((^wire4[(1'h0):(1'h0)]))));
          reg15 <= (((&{$unsigned(reg15),
                  $signed(reg12)}) | $signed($signed(reg14))) ?
              ((wire6 <<< $unsigned((8'ha6))) && (wire6[(1'h0):(1'h0)] ?
                  $signed($unsigned(wire0)) : wire7[(1'h1):(1'h1)])) : reg10);
        end
    end
  assign wire18 = wire3[(4'hc):(3'h7)];
  assign wire19 = $unsigned(wire2);
  assign wire20 = $unsigned((^wire18));
endmodule
