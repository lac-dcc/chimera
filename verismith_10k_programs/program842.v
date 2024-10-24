module top
#(parameter param20 = ((~|((((8'hb7) ? (8'h9f) : (7'h41)) ? ((8'hac) ? (8'hb8) : (8'hb3)) : {(8'hb2), (8'hb0)}) <= (((8'hac) ? (8'hb5) : (8'hbb)) ? ((8'hbc) * (7'h42)) : ((8'haf) ^~ (8'hb5))))) ? ((((-(8'ha3)) ? (8'hb9) : ((8'ha3) - (8'hb4))) ? ({(7'h41), (8'ha2)} << ((8'ha5) != (8'ha9))) : ({(7'h41)} > (8'hbf))) & ((((8'hb4) ? (8'ha6) : (8'hbd)) >> ((8'hbe) ? (7'h43) : (8'ha4))) <= (((8'hae) & (8'hbe)) ? ((7'h43) ? (8'hbf) : (8'ha2)) : (^~(8'ha5))))) : ((^~(((8'ha0) - (8'h9d)) ? ((8'ha8) <<< (8'hae)) : (|(8'ha7)))) ? {(((8'hb3) ? (8'haf) : (8'hac)) | (!(7'h40)))} : (~^((-(8'hb7)) > {(8'haa)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned(wire2[(4'ha):(1'h0)]);
  assign wire5 = ((^wire3) ?
                     (^($unsigned(wire0) ?
                         $unsigned((+wire0)) : $unsigned((!wire2)))) : $signed((+wire3[(3'h5):(3'h4)])));
  assign wire6 = ($unsigned($signed(($signed(wire2) ?
                     wire2[(1'h1):(1'h1)] : wire5[(2'h3):(1'h1)]))) > ({$unsigned((wire5 && wire1)),
                         wire4[(5'h10):(2'h2)]} ?
                     (^~$unsigned({wire3,
                         wire2})) : (~(~|$unsigned((8'hac))))));
  assign wire7 = (wire0[(4'h9):(2'h3)] ?
                     (~&$unsigned(wire5)) : ($unsigned((~&(-wire3))) ?
                         (($signed(wire4) == (-wire2)) ?
                             $signed(wire6[(2'h2):(2'h2)]) : (8'ha8)) : {(+wire6[(3'h5):(2'h3)]),
                             (7'h40)}));
  assign wire8 = (8'ha6);
  assign wire9 = $unsigned((({((8'ha9) ? (8'haa) : (8'ha5)),
                         $unsigned(wire7)} <= ((wire4 ?
                         (8'hb7) : (8'ha0)) ^ $signed(wire5))) ?
                     ((^(wire4 ?
                         wire6 : wire6)) + wire6[(2'h2):(1'h0)]) : ($signed($signed(wire7)) <<< $unsigned((-(8'hbb))))));
  always
    @(posedge clk) begin
      if (wire5)
        begin
          reg10 <= {$unsigned(wire4)};
          reg11 <= wire7[(3'h4):(3'h4)];
          reg12 <= wire1;
        end
      else
        begin
          reg10 <= (((((wire6 >>> reg10) ?
              wire2[(1'h0):(1'h0)] : $signed(wire3)) << $unsigned(wire3[(1'h0):(1'h0)])) ~^ $unsigned(wire2[(2'h3):(2'h2)])) || $unsigned((|wire4[(4'hc):(2'h2)])));
          reg11 <= $unsigned(wire3[(4'hd):(3'h4)]);
        end
      reg13 <= $signed($signed($signed($signed((wire6 ? wire2 : (8'hbb))))));
      reg14 <= (+reg13[(4'hb):(3'h7)]);
      reg15 <= (($signed((&((8'hb4) <= (8'ha6)))) ?
              $signed((|(&reg12))) : wire3[(2'h2):(2'h2)]) ?
          $unsigned($unsigned(((-reg14) | {reg13}))) : reg14);
      reg16 <= {$unsigned(reg13), wire6};
    end
  assign wire17 = $signed($unsigned((!(reg11[(3'h6):(1'h0)] ?
                      $signed(wire6) : $unsigned(reg15)))));
  assign wire18 = (|(~reg16));
  assign wire19 = wire5[(1'h0):(1'h0)];
endmodule
