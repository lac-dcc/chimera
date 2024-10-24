module top
#(parameter param41 = ((&(({(8'haa)} < ((8'ha3) ? (8'hbc) : (7'h40))) >> (8'h9d))) ? (~&((((8'h9c) < (8'ha6)) > ((8'ha5) ? (8'ha8) : (7'h40))) ? (!((8'hb4) - (8'ha8))) : {(&(8'hbe)), {(8'hb7), (8'hbd)}})) : {(({(8'hbf), (8'haf)} ? ((8'h9e) ? (8'hb0) : (8'h9d)) : (!(8'h9c))) ? (8'ha8) : (((8'ha1) ^ (8'hba)) ? ((8'hb2) ? (8'hbf) : (7'h43)) : ((8'ha0) ? (7'h40) : (8'hba)))), ((^((8'hab) ? (8'hab) : (7'h43))) ? {((8'hb7) * (8'hb8)), ((8'h9c) ? (8'hba) : (8'ha7))} : (((8'ha1) ? (8'ha0) : (8'hb4)) ? {(8'ha3), (8'hac)} : (-(8'hb7))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg38,
                 reg37,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = $unsigned({(~&(~^wire3[(4'hb):(4'h8)]))});
  assign wire7 = ({$unsigned($unsigned((~|wire4)))} ?
                     wire3[(5'h10):(3'h6)] : (^{wire2[(4'h9):(3'h6)]}));
  assign wire8 = ($unsigned((~|$unsigned(((8'ha5) ^ wire4)))) | (($signed((^~wire2)) >>> $signed(((8'hbf) ?
                     wire2 : wire4))) + (wire5 >>> (wire5 != wire6))));
  assign wire9 = (~|wire1[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg10 <= wire2;
      if (((+wire7) ? reg10 : wire9))
        begin
          reg11 <= (^reg10);
        end
      else
        begin
          if ($unsigned((^~(({(8'haf)} & wire6[(1'h1):(1'h1)]) ?
              wire6[(2'h3):(1'h1)] : (~{wire3, reg10})))))
            begin
              reg11 <= {(8'hb9)};
              reg12 <= ($unsigned(wire4) ?
                  wire0[(2'h2):(2'h2)] : $signed({{(wire5 - wire7)}}));
              reg13 <= wire7;
              reg14 <= $signed((&$signed(wire4)));
            end
          else
            begin
              reg11 <= {{reg13[(3'h6):(2'h2)], wire1}};
              reg12 <= reg12;
            end
          reg15 <= $signed($signed(reg12[(4'hf):(4'hd)]));
          reg16 <= wire8[(3'h5):(3'h5)];
          reg17 <= ($signed((($unsigned(reg14) << (reg12 ?
                  wire8 : reg10)) > {$unsigned(wire8), {reg11}})) ?
              $unsigned((wire3[(3'h6):(3'h4)] ?
                  reg15 : wire5[(1'h1):(1'h0)])) : ($signed((~wire7)) || wire8));
        end
      reg18 <= $unsigned((reg12 ?
          $signed(($signed(wire9) ?
              $signed(reg14) : {reg14, wire7})) : ((8'hbf) ~^ (^(+wire7)))));
    end
  always
    @(posedge clk) begin
      if (reg17)
        begin
          reg19 <= $unsigned($signed((($signed(wire7) ?
              {reg12, wire6} : wire6[(4'ha):(4'ha)]) << {{wire3},
              (wire7 * reg13)})));
          if ($unsigned((~^(reg17 ^ {$unsigned(reg16), reg10}))))
            begin
              reg20 <= {{$signed((&wire3))}, reg18};
              reg21 <= wire0;
            end
          else
            begin
              reg20 <= {reg19};
              reg21 <= {wire4[(4'he):(4'hb)]};
              reg22 <= $signed(($unsigned((~^(reg20 <= reg19))) - $signed((reg12[(4'h9):(3'h7)] ?
                  $unsigned((8'hb3)) : $signed(reg15)))));
            end
          if ((+(^~(^({wire3, reg10} ? $signed(wire1) : $unsigned((8'hae)))))))
            begin
              reg23 <= ((((8'ha4) ?
                  $signed((reg18 > reg17)) : $signed(reg19[(1'h1):(1'h1)])) | $signed(wire4)) - $unsigned((reg12 ?
                  ($signed(wire4) ?
                      ((8'haf) ^ reg18) : reg19) : (wire5[(4'h8):(1'h1)] ?
                      $unsigned((8'ha8)) : ((8'hbf) ? reg21 : reg14)))));
              reg24 <= $signed($unsigned($unsigned((~|((8'hb3) * reg11)))));
              reg25 <= {$unsigned(reg14)};
              reg26 <= $unsigned((((reg21[(4'h9):(3'h7)] ?
                  $signed(wire2) : (wire6 ?
                      wire9 : reg17)) ^ $unsigned(wire7)) <<< reg24[(1'h1):(1'h0)]));
            end
          else
            begin
              reg23 <= (~(-((+wire4[(1'h0):(1'h0)]) * {reg13[(2'h3):(2'h2)]})));
              reg24 <= (^(~reg17));
              reg25 <= ($signed(reg20) ?
                  (~&wire9[(2'h2):(1'h1)]) : {(|reg14), wire8[(3'h4):(1'h0)]});
              reg26 <= $unsigned((^(($unsigned(reg19) ?
                  $signed(wire0) : $signed(reg14)) >>> reg16[(2'h3):(2'h3)])));
              reg27 <= wire1[(2'h2):(1'h1)];
            end
          if ($signed((~^$signed(($unsigned(reg11) ? reg12 : reg27)))))
            begin
              reg28 <= {((8'hb9) & ($unsigned((wire5 ? reg12 : reg23)) ?
                      $signed(wire6) : ($unsigned(reg10) ?
                          {wire2, reg24} : (reg25 <<< reg10))))};
              reg29 <= wire3;
              reg30 <= wire9[(1'h1):(1'h1)];
              reg31 <= (((($signed(wire0) ?
                          {wire9} : (reg14 << wire5)) && reg12[(2'h2):(2'h2)]) ?
                      $signed((-(reg26 ? reg28 : wire6))) : ({(^~(7'h42)),
                              reg21} ?
                          ((reg15 ? (8'ha8) : (8'ha5)) ?
                              reg23 : $signed((7'h40))) : ((~(7'h41)) ?
                              (8'ha9) : reg30))) ?
                  (~wire5) : $unsigned(wire4[(2'h2):(1'h1)]));
            end
          else
            begin
              reg28 <= $signed($signed((~^wire5)));
              reg29 <= reg29;
              reg30 <= {reg30};
            end
        end
      else
        begin
          reg19 <= ($unsigned((8'h9c)) >>> ($signed(reg29[(3'h7):(3'h6)]) ~^ reg15[(5'h11):(2'h2)]));
        end
      reg32 <= reg21[(4'h8):(3'h7)];
      reg33 <= $unsigned(wire8);
      reg34 <= (~^wire6[(4'h9):(1'h1)]);
    end
  assign wire35 = reg11;
  assign wire36 = (reg30[(2'h3):(1'h0)] | reg28[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg37 <= ($signed(({$unsigned((8'hbb)), {wire35}} ?
          (reg15[(3'h6):(2'h2)] <= (reg31 || wire5)) : wire7)) <<< {((reg10 ?
              reg27 : (reg12 >>> (8'hb1))) >> (|reg28))});
      reg38 <= (+$unsigned({wire8[(3'h6):(3'h5)]}));
    end
  assign wire39 = wire9[(3'h4):(2'h2)];
  assign wire40 = ($signed((($unsigned(reg13) << reg15) - (8'h9e))) & wire35[(1'h0):(1'h0)]);
endmodule
