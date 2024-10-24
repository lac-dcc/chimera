module top
#(parameter param23 = {(~|((-(~(8'h9c))) ? (~((8'ha1) ? (8'h9e) : (8'had))) : ({(8'hac)} - {(8'hb5), (8'hae)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire2[(2'h2):(1'h0)];
  assign wire6 = $signed(((~^($signed(wire4) ?
                         {wire0} : (wire4 ? wire5 : wire0))) ?
                     $unsigned(wire4) : (~|$signed($unsigned(wire2)))));
  assign wire7 = wire5[(3'h7):(3'h7)];
  assign wire8 = $unsigned((($signed({wire5}) << $signed(wire7)) >> (wire2 >> wire5[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg9 <= $signed({(wire6 ~^ ((wire8 ? wire5 : wire1) ?
              {wire1} : (wire2 ? wire8 : wire0)))});
      reg10 <= $unsigned(($signed(({wire4} ?
          $unsigned(wire6) : $signed(wire6))) <= (({wire1} >= (reg9 ?
              wire7 : wire6)) ?
          reg9[(4'he):(1'h0)] : wire6[(4'hc):(4'ha)])));
      if ($signed($signed(((~(wire6 << wire7)) ?
          {wire2, $signed(wire1)} : (wire4[(3'h6):(3'h6)] & ((8'hb9) ?
              (8'h9f) : (8'hbb)))))))
        begin
          reg11 <= wire8;
          reg12 <= (^~$signed((~^($unsigned(wire4) < $unsigned(reg9)))));
        end
      else
        begin
          if ({($signed(($unsigned(wire4) ?
                      wire7[(2'h3):(1'h0)] : $unsigned((8'hb4)))) ?
                  $unsigned($unsigned(wire2)) : (8'ha9)),
              wire3})
            begin
              reg11 <= $signed((((~$unsigned(wire1)) <<< $signed(wire8)) * $unsigned({wire6,
                  (wire0 ? wire6 : wire8)})));
              reg12 <= ((reg9[(3'h4):(2'h3)] ?
                  (-wire5[(3'h5):(2'h3)]) : {wire2[(3'h4):(2'h2)]}) + (!{wire4[(4'he):(4'hc)],
                  {$signed((8'hb2)), wire3[(4'h9):(4'h8)]}}));
              reg13 <= $signed(wire7[(2'h3):(2'h2)]);
            end
          else
            begin
              reg11 <= wire8[(3'h5):(1'h0)];
              reg12 <= reg12[(2'h3):(2'h3)];
              reg13 <= ((^$signed($unsigned((wire5 ? wire1 : wire8)))) ?
                  $signed({((~&wire3) || wire6)}) : $unsigned(((((8'h9d) ?
                      reg13 : wire6) && (^reg10)) * ((wire7 ? wire6 : wire2) ?
                      (+reg13) : (wire7 ? wire8 : wire6)))));
            end
          reg14 <= $signed((wire5 <<< $signed(wire1[(1'h1):(1'h1)])));
          if ($signed({reg14[(4'hb):(3'h4)],
              (wire2 ? wire8[(4'h9):(3'h4)] : $signed($unsigned(wire2)))}))
            begin
              reg15 <= {wire4[(4'he):(4'he)],
                  (+(({reg14, (8'ha3)} ?
                      (wire5 ^~ wire8) : $signed((8'ha1))) ~^ (&(~^wire4))))};
            end
          else
            begin
              reg15 <= $signed((&reg10));
              reg16 <= reg9;
              reg17 <= ((~|{$unsigned(reg16[(4'he):(4'hb)]),
                      ({reg11, wire4} ? $signed(wire7) : $signed(wire2))}) ?
                  (($signed(reg15) ~^ {reg16[(4'hd):(1'h0)]}) << ((~^((8'hb4) == wire5)) * $unsigned($signed(wire2)))) : wire5);
              reg18 <= wire8[(4'ha):(3'h6)];
              reg19 <= (~wire8);
            end
        end
    end
  assign wire20 = reg10;
  assign wire21 = (-wire6);
  assign wire22 = ($signed(reg10[(1'h0):(1'h0)]) ?
                      wire8[(4'h9):(3'h4)] : wire8[(3'h7):(1'h0)]);
endmodule
