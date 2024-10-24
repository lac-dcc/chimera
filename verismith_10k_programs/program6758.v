module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire43,
                 wire4,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire4 = ((wire2[(3'h6):(1'h0)] ^~ wire2) <<< wire2);
  module5 #() modinst44 (.wire7(wire2), .clk(clk), .wire9(wire1), .wire6(wire3), .wire8(wire4), .y(wire43));
  assign wire45 = ((&$signed(((8'ha9) * $unsigned(wire43)))) ^~ $unsigned($unsigned(wire43)));
  always
    @(posedge clk) begin
      reg46 <= $unsigned(((~wire1[(1'h0):(1'h0)]) ? $unsigned(wire0) : wire2));
      reg47 <= $signed(wire2);
    end
  assign wire48 = (wire1[(1'h1):(1'h1)] != ($unsigned($signed((reg47 ?
                      wire0 : wire0))) >>> reg46[(4'h9):(3'h4)]));
  assign wire49 = $unsigned($signed((&((wire2 + wire3) ?
                      {wire45} : $unsigned(wire4)))));
  assign wire50 = $unsigned($unsigned((((wire0 ^ (8'ha3)) < (!(8'ha8))) * (-(wire3 ?
                      (8'hbd) : wire49)))));
  assign wire51 = ($signed(reg47[(2'h2):(1'h1)]) & ((^((-(8'ha4)) ~^ $unsigned(wire0))) ^~ reg47));
  assign wire52 = (+reg46[(3'h7):(3'h4)]);
  assign wire53 = (&(8'ha1));
  assign wire54 = reg47;
endmodule

module module5
#(parameter param41 = ((((8'hb8) <<< ((^~(8'haf)) <<< (~(8'ha3)))) << (^~{{(8'ha4), (8'hbf)}})) > ({((7'h42) | ((8'hb9) ? (8'h9f) : (8'hbf))), (((8'hb4) ? (8'hbf) : (8'ha8)) ? {(8'ha3), (8'haa)} : (^(8'h9e)))} | (+((8'ha8) ? (^(8'hbc)) : {(8'hbe)})))), 
parameter param42 = {(param41 ? ((-(param41 || param41)) <= (((8'hbd) >> param41) != (~&param41))) : (((param41 ? param41 : param41) ? {param41, param41} : {param41}) || param41)), ({({param41} | (param41 ? param41 : (8'hb6)))} >> (((8'hba) ? (param41 && (8'ha7)) : param41) ? (param41 ? param41 : (&param41)) : ((param41 == param41) ? {param41, param41} : (param41 >= param41))))})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire10;
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire40,
                 wire10,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire10 = ($signed(($signed($unsigned(wire8)) >> $unsigned(wire9))) ?
                      (^~($unsigned((-wire8)) ?
                          (wire6 || {wire7}) : ((wire6 << wire6) ?
                              $unsigned(wire8) : $unsigned((8'hb3))))) : $unsigned(wire9[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg11 <= (~&($unsigned(wire6[(1'h0):(1'h0)]) != (&$unsigned(wire10[(4'he):(1'h1)]))));
      if ((wire10[(4'h9):(2'h3)] ?
          (wire8[(2'h2):(1'h0)] != ((-(reg11 + wire7)) ?
              ($signed(reg11) ?
                  wire7[(5'h11):(3'h7)] : $signed(wire8)) : reg11)) : $unsigned($unsigned(((wire9 >>> wire9) ?
              $signed(wire9) : (!wire10))))))
        begin
          reg12 <= ($signed({((~^wire9) <<< wire10),
              ((~|wire6) <= (~^(8'hb4)))}) | $signed(((wire8[(2'h2):(1'h0)] ?
                  (~wire7) : wire10) ?
              $unsigned((~^wire7)) : $signed((^wire10)))));
        end
      else
        begin
          if ({reg11, wire10})
            begin
              reg12 <= wire7;
              reg13 <= wire7;
              reg14 <= $unsigned($signed(((~reg11) ? $signed(wire7) : wire8)));
            end
          else
            begin
              reg12 <= wire8;
              reg13 <= wire8[(1'h0):(1'h0)];
            end
          reg15 <= $signed((+((wire9[(4'h9):(3'h7)] ?
                  ((8'hba) * reg14) : reg11) ?
              wire8[(2'h2):(1'h0)] : ($signed((7'h42)) ?
                  wire10 : (reg11 <= reg11)))));
          reg16 <= wire7[(4'hb):(4'h9)];
          reg17 <= $signed(($signed($unsigned((reg11 ?
              wire10 : (8'h9f)))) <<< reg12));
          if (reg12)
            begin
              reg18 <= {reg17[(5'h13):(3'h6)]};
              reg19 <= {$unsigned(wire8[(3'h4):(3'h4)])};
            end
          else
            begin
              reg18 <= ({((~&(wire9 ^ (8'hba))) <<< $signed((~(7'h44))))} * {(($signed(reg11) ^ (~&wire8)) >>> (-$unsigned(reg18))),
                  reg13[(3'h7):(2'h2)]});
            end
        end
    end
  always
    @(posedge clk) begin
      reg20 <= reg12;
      reg21 <= $unsigned({(~^wire10)});
      reg22 <= $unsigned(reg13[(4'hb):(3'h7)]);
      reg23 <= reg21[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg24 <= $signed($signed(reg11));
      reg25 <= ({(((^~wire8) < reg11[(2'h2):(2'h2)]) ^~ (|$signed(wire8)))} | {$unsigned($signed((8'haf))),
          ((+{wire8}) >= ($signed(reg13) ? reg24 : $signed(reg12)))});
      if (reg19[(5'h11):(4'he)])
        begin
          reg26 <= {(({(&wire7), $unsigned(reg11)} ?
                  $unsigned(reg12[(3'h6):(2'h3)]) : reg23) > (reg11 | ({reg20} ?
                  ((7'h43) == reg25) : {wire7}))),
              {({{reg21}, reg21} ?
                      (&reg17[(4'hf):(1'h1)]) : $unsigned((wire6 ?
                          (8'hb8) : wire7))),
                  (reg22 < reg23)}};
          reg27 <= reg19[(3'h7):(3'h5)];
          if (wire10[(1'h0):(1'h0)])
            begin
              reg28 <= reg17;
              reg29 <= {{{((~&reg26) ? $unsigned(reg27) : $unsigned(reg18)),
                          wire6},
                      $unsigned({(wire6 < reg19), reg13[(4'he):(4'he)]})}};
            end
          else
            begin
              reg28 <= ((~&((reg20 | reg18) << $unsigned($signed(wire10)))) ^~ $unsigned(reg24[(4'hb):(2'h2)]));
              reg29 <= $signed(($signed(((wire8 | reg14) >= (~wire8))) == reg15[(3'h5):(3'h5)]));
              reg30 <= reg18;
              reg31 <= reg23;
            end
        end
      else
        begin
          reg26 <= (!reg11);
          reg27 <= (($signed(((^~reg27) ? $signed(wire9) : (wire7 + reg15))) ?
                  ($unsigned((^reg17)) ?
                      {(&reg13)} : (&(wire8 << (8'hbb)))) : $signed($unsigned($unsigned(reg22)))) ?
              reg18[(3'h6):(1'h1)] : reg14[(3'h4):(3'h4)]);
          if (reg27)
            begin
              reg28 <= wire9;
            end
          else
            begin
              reg28 <= reg31[(4'hb):(2'h2)];
              reg29 <= $signed(reg12);
              reg30 <= $signed(reg19[(4'h8):(3'h7)]);
              reg31 <= $signed(wire6[(1'h1):(1'h0)]);
            end
          reg32 <= $signed($signed($signed((((8'h9c) << (7'h44)) & (+reg29)))));
          reg33 <= ((-wire7) <= reg16);
        end
      if ($signed($signed(reg20)))
        begin
          reg34 <= (8'hb7);
        end
      else
        begin
          if ($unsigned((~|$unsigned(reg32[(2'h3):(1'h1)]))))
            begin
              reg34 <= ({(8'h9f), $unsigned((!$unsigned(reg21)))} ?
                  (((reg25 <= $signed((8'ha9))) ?
                          reg29[(1'h1):(1'h0)] : (7'h42)) ?
                      $signed((8'hac)) : ((^~reg11[(1'h0):(1'h0)]) <= reg29)) : $unsigned((+$unsigned(wire10[(4'h8):(2'h2)]))));
            end
          else
            begin
              reg34 <= $unsigned($unsigned((~^($unsigned((8'h9d)) ?
                  (reg33 <= reg25) : (reg32 & (8'hb0))))));
            end
          reg35 <= (~|reg25);
          reg36 <= $unsigned((((8'ha2) > $unsigned(reg32)) && (8'hb4)));
          reg37 <= wire9[(4'ha):(2'h3)];
          reg38 <= $unsigned(wire9);
        end
      reg39 <= {($unsigned(wire7[(1'h1):(1'h1)]) ?
              {$unsigned((wire10 ?
                      reg15 : reg16))} : $unsigned($signed(reg19)))};
    end
  assign wire40 = $unsigned(({reg21[(3'h7):(2'h3)],
                      $unsigned({reg28, wire8})} || wire10[(2'h3):(1'h0)]));
endmodule
