module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire19,
                 wire18,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = (+(wire0[(3'h5):(2'h2)] ?
                     (8'haf) : {($signed(wire0) ?
                             wire2 : ((8'ha2) ? wire1 : wire0)),
                         ((wire2 >> wire3) || $signed((8'ha7)))}));
  assign wire5 = $signed(wire0);
  assign wire6 = wire2[(3'h6):(1'h1)];
  assign wire7 = $signed(((((!wire3) ?
                         wire0 : wire6[(4'ha):(1'h1)]) - {(~|wire4)}) ?
                     ((8'hab) ?
                         wire3[(5'h10):(3'h6)] : {(^wire4)}) : (wire1[(1'h0):(1'h0)] ?
                         (wire1 ?
                             (wire0 ?
                                 wire3 : wire3) : $unsigned(wire3)) : ((wire4 ?
                                 (8'ha9) : wire3) ?
                             $unsigned(wire6) : wire4[(3'h6):(1'h0)]))));
  assign wire8 = $unsigned((wire5 & (wire7 < ((wire6 ^~ wire7) > wire1[(2'h3):(1'h1)]))));
  assign wire9 = (!(wire6[(3'h5):(1'h0)] && (wire8[(1'h0):(1'h0)] ?
                     wire5[(3'h7):(2'h2)] : ((^~wire5) ?
                         (7'h42) : (wire7 | wire0)))));
  assign wire10 = (^{($signed(wire3[(1'h1):(1'h1)]) + ($unsigned(wire7) * (wire4 << wire9))),
                      $signed(wire4)});
  assign wire11 = $signed(($signed(({(8'ha1), wire5} ?
                          $signed((8'ha2)) : wire4[(1'h1):(1'h0)])) ?
                      (~&wire1[(3'h4):(2'h2)]) : (8'hb2)));
  assign wire12 = $signed(wire11);
  always
    @(posedge clk) begin
      reg13 <= ((~(((8'ha3) & $unsigned((8'h9f))) && wire4)) ?
          (wire4 < ((wire9[(3'h7):(3'h7)] > {wire2,
              wire11}) || $signed((~^wire1)))) : (wire0 >> (-$signed((wire7 ~^ wire1)))));
      if ($unsigned(wire11[(3'h5):(3'h4)]))
        begin
          reg14 <= wire12[(2'h3):(2'h3)];
          reg15 <= ($signed({$signed((~|wire7)),
              {(wire1 <= wire12),
                  (&wire7)}}) ^ ($signed($unsigned($unsigned(wire4))) ?
              ((^~$unsigned(wire8)) | ((~wire7) >>> $signed(wire10))) : (wire10 ?
                  wire11 : (~|wire2[(4'h8):(4'h8)]))));
          reg16 <= {wire4};
          reg17 <= wire8;
        end
      else
        begin
          reg14 <= {wire9[(1'h0):(1'h0)],
              (wire9[(1'h0):(1'h0)] || ($unsigned(wire3) >> reg15[(2'h2):(1'h0)]))};
          reg15 <= ($signed(wire5[(2'h3):(1'h0)]) ?
              (8'hb3) : ($unsigned($signed($unsigned(wire3))) <= ({{(8'h9d),
                      wire6}} >> ($signed(reg15) ?
                  (wire5 ? reg16 : wire10) : ((8'hb2) | reg16)))));
          reg16 <= wire1[(3'h4):(2'h2)];
          reg17 <= {$unsigned($signed(reg13)), $unsigned(wire0[(3'h5):(1'h0)])};
        end
    end
  assign wire18 = $signed($unsigned($signed(reg14)));
  assign wire19 = ($unsigned((((8'hac) ?
                          {(8'ha7), wire5} : $unsigned((7'h40))) ?
                      $signed(wire12[(1'h0):(1'h0)]) : (reg16 ?
                          wire5 : $signed(wire9)))) << wire2[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg20 <= (~&wire11[(4'h8):(2'h2)]);
      if (wire1[(1'h1):(1'h1)])
        begin
          reg21 <= wire12;
        end
      else
        begin
          reg21 <= {wire12[(2'h2):(2'h2)]};
        end
      if (wire8[(1'h1):(1'h1)])
        begin
          reg22 <= (8'ha7);
        end
      else
        begin
          if (((wire5 ?
                  ((~|wire3[(4'hd):(3'h7)]) >>> (wire9 >> $unsigned(reg13))) : wire2) ?
              ((({reg13} * (~&wire9)) ?
                  $signed($unsigned(reg14)) : $unsigned((reg16 ~^ wire3))) | $signed(((~&reg22) == ((8'ha6) ?
                  reg21 : (8'ha7))))) : (8'hb6)))
            begin
              reg22 <= wire4[(4'hc):(3'h4)];
              reg23 <= $signed($unsigned(($unsigned((reg16 ?
                  wire5 : wire19)) <<< {((8'hbb) ? reg17 : (8'hba))})));
            end
          else
            begin
              reg22 <= ($signed(wire1[(3'h5):(2'h2)]) ^~ (($signed((wire12 >= wire3)) ?
                  reg15 : wire11) >= $signed((~&$unsigned(reg23)))));
              reg23 <= wire7;
              reg24 <= reg15[(1'h0):(1'h0)];
              reg25 <= wire12;
            end
        end
      if ((~$unsigned(((wire18[(2'h2):(1'h1)] ?
          reg17 : $signed((7'h43))) != {wire12, (wire5 ? reg24 : reg22)}))))
        begin
          reg26 <= wire4[(4'hc):(4'ha)];
          reg27 <= {$unsigned((($unsigned(wire11) ?
                  wire1 : $unsigned(reg24)) == reg25))};
          reg28 <= wire5;
        end
      else
        begin
          if (wire6)
            begin
              reg26 <= (^reg21[(2'h3):(1'h0)]);
              reg27 <= $signed(wire11);
              reg28 <= ($unsigned(reg25) <<< $signed((reg27[(4'h8):(1'h1)] ?
                  $signed((wire0 < (8'hac))) : ((reg14 ?
                      reg16 : reg24) >> (reg16 ? wire12 : wire6)))));
              reg29 <= wire5[(2'h2):(1'h1)];
            end
          else
            begin
              reg26 <= $unsigned($signed($unsigned($signed((8'ha3)))));
              reg27 <= wire10[(2'h2):(2'h2)];
              reg28 <= (~&wire9[(3'h6):(2'h2)]);
              reg29 <= {(~|wire11)};
            end
        end
    end
  assign wire30 = reg29[(4'he):(4'ha)];
  assign wire31 = reg28[(1'h1):(1'h1)];
  assign wire32 = ((wire10 ?
                          ({(wire8 >>> reg26)} ?
                              $unsigned($unsigned(wire0)) : reg13) : $unsigned((~&$signed(reg28)))) ?
                      (|((+((8'hb4) > wire8)) | $unsigned(reg21[(3'h5):(3'h4)]))) : (reg16[(1'h0):(1'h0)] && $unsigned(reg16)));
  assign wire33 = $signed((!$signed(wire8[(1'h1):(1'h1)])));
  assign wire34 = {wire31};
endmodule
