module top
#(parameter param82 = ((((((8'ha5) | (8'h9c)) ? {(8'had)} : ((8'h9e) ^ (8'h9f))) ? (^~((7'h42) ? (8'hb9) : (8'haa))) : ({(8'hb3)} ? ((8'ha3) << (7'h43)) : ((7'h40) ? (8'ha1) : (7'h40)))) ? {((^~(8'hb0)) <= ((8'hab) ? (8'hbb) : (8'h9e))), (!(+(8'hb8)))} : (+(((7'h44) ? (8'ha6) : (8'hb9)) ? (~(8'hb8)) : (^~(8'hac))))) ? {(~&(((8'hba) ^ (8'hb8)) == ((8'hbf) ? (8'ha1) : (8'hbf))))} : (({(~&(8'h9d))} ? (~^(-(8'ha3))) : (((8'ha2) ^ (8'hbc)) ? ((8'ha7) != (8'hbf)) : ((8'hb8) < (8'hb6)))) ? (8'ha7) : ((&((8'hb6) * (8'h9d))) ^~ (|((8'ha8) - (8'ha9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire69;
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  assign y = {wire81,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module4 #() modinst70 (wire69, clk, wire1, wire2, wire0, wire3);
  assign wire71 = $signed($unsigned($unsigned(($signed(wire0) <= (+wire69)))));
  assign wire72 = $signed(($unsigned(wire1) && {wire1[(4'h8):(2'h2)]}));
  assign wire73 = (~^(8'h9d));
  assign wire74 = wire0;
  always
    @(posedge clk) begin
      reg75 <= ($unsigned((~&$unsigned((+wire73)))) ?
          (($signed(wire72[(2'h3):(1'h0)]) ?
                  $unsigned($unsigned(wire74)) : wire1) ?
              $unsigned($unsigned($unsigned(wire71))) : wire3) : wire73);
      reg76 <= $unsigned(wire69);
      reg77 <= {(~|{(wire0[(4'he):(4'he)] ? {reg75} : (wire2 | wire0)),
              (wire73 ? (|reg75) : $signed(wire0))})};
      reg78 <= ($signed(({wire74} < (!{wire1}))) && reg75[(4'h9):(1'h1)]);
      reg79 <= $unsigned((wire71[(2'h2):(1'h0)] | (wire74 * reg76)));
    end
  always
    @(posedge clk) begin
      reg80 <= wire71[(1'h0):(1'h0)];
    end
  assign wire81 = reg75[(4'hb):(1'h0)];
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire5;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire66;
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire68,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire41,
                 wire43,
                 wire44,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire66,
                 reg51,
                 reg46,
                 reg45,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire9 = $signed($unsigned($signed(((|wire7) <<< $signed(wire5)))));
  assign wire10 = (({(~&(wire8 ? wire5 : wire6))} ^ wire7) ?
                      ((-(|$unsigned(wire6))) + $unsigned(wire7[(3'h7):(3'h6)])) : wire6[(4'hb):(1'h1)]);
  assign wire11 = (wire8 >>> wire10[(3'h5):(1'h1)]);
  assign wire12 = $unsigned(($signed(wire7) >>> $signed((!(wire6 << (7'h40))))));
  always
    @(posedge clk) begin
      if ({(8'ha5)})
        begin
          reg13 <= ($unsigned((wire6[(2'h2):(2'h2)] && (!{wire8}))) ?
              wire5 : wire5);
          reg14 <= wire12;
          reg15 <= $signed($signed(wire7[(2'h2):(1'h1)]));
          if (($signed((((|reg14) ?
                      ((8'ha7) ? wire8 : wire11) : reg13[(1'h1):(1'h1)]) ?
                  (|(8'h9c)) : {(reg15 < reg15), $unsigned(wire7)})) ?
              wire11 : $unsigned(wire7)))
            begin
              reg16 <= ((+($unsigned({wire11}) ?
                      ($signed(reg14) ^ (~|(8'hb7))) : ((reg14 ?
                              (7'h40) : reg15) ?
                          reg14[(1'h1):(1'h1)] : (reg13 ? wire5 : wire10)))) ?
                  ($signed($signed((~wire12))) ?
                      wire9[(3'h7):(3'h5)] : {reg13,
                          reg15}) : $signed(wire5[(1'h0):(1'h0)]));
            end
          else
            begin
              reg16 <= wire12;
              reg17 <= $signed(reg14[(3'h4):(1'h0)]);
            end
          reg18 <= $signed($unsigned(wire5));
        end
      else
        begin
          reg13 <= (wire6[(4'h8):(3'h7)] < (reg13[(4'h8):(2'h2)] ?
              wire7[(2'h2):(1'h1)] : $signed($signed((reg17 >= wire6)))));
          reg14 <= $signed($unsigned($unsigned(wire11[(3'h5):(1'h1)])));
          reg15 <= $signed($unsigned($unsigned((&(^reg14)))));
          reg16 <= ({$signed(($signed((8'ha7)) ? wire6[(2'h3):(1'h0)] : wire8)),
                  (wire6[(3'h7):(2'h2)] ?
                      (~|$unsigned(reg18)) : ((wire6 | (8'ha8)) ?
                          (8'h9d) : $signed((8'h9e))))} ?
              reg13 : wire5);
        end
      reg19 <= $signed((($signed($signed(wire9)) ?
              $unsigned(wire12) : wire9[(3'h7):(3'h5)]) ?
          wire11 : (^~((reg17 ? wire5 : (8'hba)) || $signed(wire5)))));
      if (($signed(wire11[(4'hb):(4'h9)]) << wire12))
        begin
          reg20 <= (7'h40);
          reg21 <= (|(^~{$signed(reg19[(3'h4):(2'h3)])}));
          if ($signed((&((~$signed(wire8)) <<< reg16))))
            begin
              reg22 <= ((~|$signed(wire7)) ?
                  $signed($signed($unsigned({wire12}))) : reg20[(2'h2):(2'h2)]);
            end
          else
            begin
              reg22 <= $unsigned({$signed((reg14 >= (~^reg19))), reg14});
              reg23 <= {(~&wire5[(1'h0):(1'h0)]), wire7[(3'h6):(3'h6)]};
              reg24 <= {(((^~wire8[(1'h0):(1'h0)]) + $unsigned($unsigned((7'h41)))) >>> (($signed((8'hb4)) ?
                      reg20 : {reg19, reg14}) < (wire5 * (reg17 - (8'hb6)))))};
            end
          reg25 <= (+($signed($signed({wire5})) - {{(wire9 ? wire7 : (8'hbd))},
              reg21[(1'h1):(1'h1)]}));
        end
      else
        begin
          reg20 <= $signed($unsigned(($unsigned(wire8[(1'h1):(1'h1)]) >= reg19[(2'h2):(1'h1)])));
          reg21 <= {(reg23[(3'h4):(2'h2)] + $unsigned(($signed(wire10) + reg21[(3'h4):(2'h2)])))};
          reg22 <= reg24[(1'h0):(1'h0)];
          if ((reg20[(3'h4):(2'h2)] ? wire10[(3'h6):(2'h3)] : (8'hb6)))
            begin
              reg23 <= $signed((({((8'hb8) || wire9), (-reg14)} ?
                  ({reg22, wire8} ?
                      (reg25 && reg23) : (^reg21)) : $unsigned((wire6 ?
                      reg22 : wire8))) != (wire8[(1'h1):(1'h1)] <= {wire9,
                  (wire6 <<< wire8)})));
            end
          else
            begin
              reg23 <= (reg14 | {$signed({(wire9 ? reg18 : wire8), reg24})});
              reg24 <= {(reg13[(3'h4):(2'h2)] < $signed($unsigned($unsigned(reg19)))),
                  reg25[(1'h0):(1'h0)]};
              reg25 <= $signed(reg18[(1'h0):(1'h0)]);
            end
          reg26 <= (!{(~&$unsigned(wire5[(1'h0):(1'h0)]))});
        end
      reg27 <= (~&$unsigned($unsigned({reg19})));
      reg28 <= (reg17 | (wire8[(1'h0):(1'h0)] > wire10));
    end
  module29 #() modinst42 (wire41, clk, reg25, wire11, wire5, reg22, reg21);
  assign wire43 = $signed($unsigned(((~^wire11) >> {(reg21 >>> reg13),
                      $unsigned((8'hb2))})));
  assign wire44 = $signed($unsigned((|wire5[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      reg45 <= (&$signed($signed($unsigned($signed(wire7)))));
      reg46 <= {wire41, (~$signed($unsigned((&reg23))))};
    end
  assign wire47 = (({wire5[(4'h8):(1'h0)]} ?
                      ((8'hb0) ?
                          {(wire5 ~^ reg21)} : (~&wire10)) : reg26) <= $unsigned((($unsigned(reg25) ^~ (!reg46)) != wire43)));
  assign wire48 = reg23[(2'h2):(1'h1)];
  assign wire49 = ($signed({((wire8 ? wire48 : wire11) ?
                              {reg20} : $signed(reg22)),
                          reg26[(3'h4):(1'h0)]}) ?
                      reg18 : ($unsigned(reg16) ?
                          {$signed($signed(reg45)),
                              reg28} : $unsigned(wire10[(2'h3):(2'h3)])));
  assign wire50 = $unsigned(reg14[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg51 <= (^~$unsigned((reg17[(4'ha):(3'h7)] ?
          $unsigned(reg20) : ($signed(wire50) == {wire10}))));
    end
  module52 #() modinst67 (wire66, clk, wire43, reg22, reg19, wire50, wire49);
  assign wire68 = {(-(~&((+wire11) ?
                          $signed(reg24) : (reg26 ? reg21 : reg25)))),
                      ($signed(reg51) ?
                          $unsigned(((wire5 >>> wire66) >= reg17[(5'h11):(2'h2)])) : wire43[(3'h7):(3'h4)])};
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  input wire [(4'hb):(1'h0)] wire54;
  input wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 (1'h0)};
  assign wire58 = ((^~{wire56}) != ($unsigned($signed(wire54)) & ($unsigned($unsigned(wire56)) ?
                      $unsigned($unsigned((7'h44))) : wire54[(3'h4):(2'h3)])));
  assign wire59 = (wire53[(1'h1):(1'h1)] & {wire53[(4'hb):(3'h7)]});
  assign wire60 = ($unsigned(wire54) + $unsigned(wire58[(4'hc):(2'h3)]));
  assign wire61 = ((!wire57) ? wire58 : $unsigned((~^(&wire54))));
  assign wire62 = ((|({((8'ha6) ? wire59 : wire58), $signed(wire55)} ?
                          wire60[(4'ha):(4'h9)] : ($signed(wire59) << wire55))) ?
                      ((({wire53} > ((8'hbe) ?
                              (8'ha9) : wire56)) & (~&(~wire54))) ?
                          (&(wire55[(2'h3):(2'h3)] ?
                              $unsigned(wire54) : (~^wire53))) : wire59[(3'h7):(1'h1)]) : wire58[(4'ha):(1'h0)]);
  assign wire63 = $signed((7'h43));
  assign wire64 = $unsigned($signed($signed($signed(wire59[(2'h2):(1'h1)]))));
  assign wire65 = wire61[(1'h0):(1'h0)];
endmodule

module module29
#(parameter param39 = (7'h44), 
parameter param40 = (~|((param39 ~^ {(param39 == param39)}) || {(((8'hbd) ? param39 : param39) >> (~^param39))})))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(4'h8):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  assign y = {wire38, wire37, wire36, wire35, (1'h0)};
  assign wire35 = (({wire33, wire31} ?
                      $signed(((wire30 >>> wire30) ?
                          ((8'h9e) != wire34) : wire33[(2'h3):(2'h3)])) : $unsigned($signed(wire30))) | wire31[(3'h5):(2'h2)]);
  assign wire36 = ($signed($signed(((wire32 ~^ wire35) ?
                      (7'h40) : (-wire33)))) ~^ (({(^~wire34),
                      $signed(wire31)} >> ($signed(wire31) ?
                      $signed(wire31) : {wire31})) >= wire31[(1'h0):(1'h0)]));
  assign wire37 = ($signed((|{wire31, $unsigned(wire35)})) ?
                      (($unsigned($unsigned(wire36)) || (8'ha1)) >>> (+$signed(wire36[(1'h0):(1'h0)]))) : ($signed(wire35[(4'h8):(4'h8)]) != $signed((((8'h9f) ?
                          wire35 : wire35) >> {wire34}))));
  assign wire38 = (~&{(wire30[(2'h2):(1'h1)] ?
                          {(^~wire31), $unsigned((8'ha7))} : $signed(wire35))});
endmodule
