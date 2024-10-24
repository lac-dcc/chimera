module top
#(parameter param49 = (((-(~{(8'hba)})) ? (((+(8'ha1)) <= ((8'hb8) ? (8'hb1) : (7'h40))) ^~ (((7'h42) ^~ (8'h9e)) ? ((8'had) || (8'ha3)) : (8'hb4))) : {(((8'ha6) <<< (8'ha0)) ? (+(8'hb1)) : ((8'ha6) > (8'ha7))), {{(8'hab), (8'h9d)}}}) ? ((((~(8'hb8)) ? (&(8'hb8)) : ((8'h9f) << (8'ha6))) ? (8'ha7) : ({(7'h42)} ? ((8'hba) ^~ (7'h41)) : ((8'hae) | (8'hb2)))) ? (~&(^~((8'ha1) ? (8'hb0) : (8'hb0)))) : ({((8'hbf) ? (8'hb3) : (8'ha0))} >> (^((8'hb5) ^ (7'h44))))) : {(((&(8'hbf)) & ((8'ha9) ? (8'hac) : (8'h9f))) && (~(^~(8'hba))))}), 
parameter param50 = ((&({(param49 < param49), (~|param49)} | ({param49} ^~ param49))) ? (param49 ~^ param49) : (param49 & {(^~(param49 ? (8'ha6) : (7'h41))), ((param49 >= param49) ? ((8'hae) | (7'h41)) : {param49, param49})})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire47;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire47, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed((($unsigned((wire0 ^ wire1)) != (~|(-wire1))) > {wire2}));
  assign wire7 = wire4;
  assign wire8 = ({wire2[(3'h5):(2'h2)], (~wire4)} ?
                     wire1[(4'h8):(3'h5)] : (~^$unsigned((wire7 & (wire4 == wire7)))));
  assign wire9 = wire6;
  assign wire10 = ($unsigned(wire6[(5'h10):(1'h0)]) | (~$signed((wire1 > wire2[(1'h1):(1'h0)]))));
  module11 #() modinst48 (.wire14(wire6), .wire15(wire8), .wire16(wire1), .y(wire47), .wire13(wire10), .clk(clk), .wire12(wire0));
endmodule

module module11
#(parameter param45 = (8'ha3), 
parameter param46 = (-((!param45) ^~ param45)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire17;
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  assign y = {wire43,
                 wire31,
                 wire30,
                 wire17,
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
                 (1'h0)};
  assign wire17 = $signed({(+((wire15 * (8'hb5)) < $unsigned((8'hb8)))),
                      wire16[(4'hc):(4'h9)]});
  always
    @(posedge clk) begin
      reg18 <= (8'hb8);
      if ($unsigned(wire12[(5'h10):(3'h4)]))
        begin
          reg19 <= (wire17 ?
              $signed($unsigned(($unsigned(reg18) >= reg18[(2'h2):(2'h2)]))) : (~|wire12));
        end
      else
        begin
          reg19 <= wire13[(1'h0):(1'h0)];
          reg20 <= reg19[(5'h11):(4'hc)];
          reg21 <= (($unsigned((wire17 >= $unsigned(wire16))) && reg18) ?
              $signed((wire13[(3'h6):(3'h5)] ?
                  $signed($signed(wire12)) : wire16)) : ({$signed($signed((7'h43))),
                  (&wire15)} - reg19));
        end
      reg22 <= reg18[(2'h2):(1'h0)];
      reg23 <= (($unsigned({(^(8'h9d))}) < ($signed((^~wire13)) != ((~&(8'ha5)) ~^ (wire16 == reg18)))) ?
          $unsigned(wire15) : ($unsigned(((wire13 ? wire13 : wire16) ?
                  $signed(wire13) : {reg20, wire14})) ?
              (&($unsigned(reg18) >>> wire17)) : ($signed(wire12[(4'hf):(4'ha)]) - $signed($unsigned(wire12)))));
      if ({(|(|$unsigned((reg22 ? reg23 : reg20))))})
        begin
          if (reg20[(1'h0):(1'h0)])
            begin
              reg24 <= $unsigned((8'hb9));
              reg25 <= wire13[(2'h3):(2'h2)];
            end
          else
            begin
              reg24 <= (((^~((reg20 && (8'hb5)) >> $signed(reg23))) + {wire16,
                      (|reg18[(3'h6):(2'h3)])}) ?
                  reg20 : ($signed(($signed(wire15) || (&reg21))) >>> (+reg18)));
            end
          if ((~|(-wire13)))
            begin
              reg26 <= wire14[(2'h3):(2'h3)];
              reg27 <= (|(reg24[(4'hf):(3'h4)] & (&$signed((~^(8'hbb))))));
              reg28 <= reg24[(4'hb):(3'h4)];
            end
          else
            begin
              reg26 <= $signed(((reg25[(2'h3):(2'h3)] != reg23) ?
                  reg24[(4'h9):(1'h0)] : $signed((8'hb7))));
              reg27 <= reg28;
              reg28 <= ($unsigned($unsigned(reg18)) ?
                  (^(reg27[(4'ha):(3'h4)] ?
                      (&(reg27 * wire17)) : ((|reg24) == (^(8'hb5))))) : $unsigned(reg19));
              reg29 <= reg18[(3'h5):(2'h2)];
            end
        end
      else
        begin
          if ((reg18[(3'h5):(2'h3)] <<< $signed((wire13[(3'h7):(2'h2)] ?
              reg21[(3'h6):(1'h0)] : {((8'hb8) ? reg21 : (8'ha8))}))))
            begin
              reg24 <= reg22[(1'h0):(1'h0)];
              reg25 <= $unsigned({{$unsigned((~^reg22)),
                      $unsigned({wire17, wire16})}});
              reg26 <= reg22[(3'h4):(1'h1)];
            end
          else
            begin
              reg24 <= (($unsigned(wire15[(5'h14):(4'hc)]) ^~ ($signed((wire17 ?
                      reg23 : reg22)) ?
                  (|$unsigned(reg22)) : (reg23[(4'hf):(4'hf)] ?
                      $unsigned((8'hbf)) : $signed((8'hb8))))) <= (wire15[(4'ha):(3'h4)] ?
                  $signed(reg22[(3'h5):(3'h5)]) : ($unsigned((reg22 ?
                          reg24 : wire14)) ?
                      {reg27[(5'h13):(4'hd)]} : reg23[(2'h3):(2'h2)])));
              reg25 <= $signed((7'h42));
              reg26 <= ($signed($signed($unsigned((reg18 ? reg20 : reg29)))) ?
                  ($signed($signed(reg22[(2'h2):(1'h1)])) <= ((~(reg26 ?
                      reg18 : wire14)) ^ $signed((reg20 ?
                      reg29 : reg21)))) : (&(wire17[(4'hb):(1'h1)] + ((reg27 ?
                      reg18 : reg21) & wire14))));
            end
          reg27 <= (&($unsigned(({reg27} ?
                  (reg24 << (8'ha3)) : (reg21 | reg22))) ?
              (^~$signed($signed(reg24))) : $signed(wire13[(2'h3):(1'h1)])));
        end
    end
  assign wire30 = $unsigned(($unsigned((wire13[(3'h4):(3'h4)] ?
                          wire14 : (wire12 ? reg19 : reg19))) ?
                      ((reg21[(4'h8):(1'h1)] ? (&reg24) : (wire17 * reg20)) ?
                          (|(reg21 ~^ (8'ha3))) : ({(8'hae)} * (wire13 <= reg24))) : $signed(reg23[(4'hf):(4'hf)])));
  assign wire31 = $signed($unsigned($signed($signed((+wire13)))));
  module32 #() modinst44 (wire43, clk, reg28, reg24, wire15, wire17);
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  assign y = {wire42, wire41, wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = wire33[(4'hc):(4'ha)];
  assign wire38 = (-wire35[(3'h4):(1'h1)]);
  assign wire39 = wire38[(2'h3):(1'h1)];
  assign wire40 = $unsigned(wire37);
  assign wire41 = (~^wire35[(1'h0):(1'h0)]);
  assign wire42 = (8'ha9);
endmodule
