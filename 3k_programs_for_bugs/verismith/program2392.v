module top
#(parameter param42 = ((~(8'ha1)) ? (((((7'h43) << (7'h42)) ? (~^(8'h9c)) : ((7'h43) | (8'hb0))) <<< (8'hbe)) | (-({(8'hbe)} ? (&(7'h40)) : ((8'hb7) != (8'hbe))))) : (({((8'had) ? (8'hb9) : (8'h9e)), (~&(8'haa))} & (((8'hab) | (8'hbe)) ? {(8'ha6), (8'ha2)} : ((8'haa) ? (8'ha9) : (8'hb7)))) ? (~((~(7'h42)) ? (+(8'ha9)) : ((8'hb1) ? (8'h9e) : (8'hb0)))) : (|({(8'hbc)} >>> (-(8'h9c)))))), 
parameter param43 = param42)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ({wire0[(1'h1):(1'h0)], (((|wire1) | wire0) == wire2)} ?
                     ($signed(((+(8'h9c)) ?
                         $signed((8'hb7)) : $signed(wire3))) < $signed(wire0)) : $signed($signed((wire0[(1'h1):(1'h1)] ?
                         (wire3 ? wire1 : (8'hb6)) : (wire3 != wire3)))));
  assign wire5 = (($signed($unsigned(wire2[(3'h6):(3'h6)])) ?
                         $unsigned($unsigned({wire2})) : $signed(wire4[(1'h0):(1'h0)])) ?
                     $signed($unsigned(((~|wire2) << (wire0 != wire2)))) : (^~$unsigned($signed({wire1}))));
  always
    @(posedge clk) begin
      reg6 <= wire1[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($signed(wire4[(1'h1):(1'h1)]))
        begin
          reg7 <= ($signed((^~((~|wire1) - $unsigned(wire1)))) ?
              {wire1} : wire4);
          reg8 <= ($unsigned(wire1) ?
              {{reg7}} : ($unsigned($signed($signed(reg6))) > $signed(((^~wire2) ?
                  $signed(wire4) : (wire1 ? (8'hb6) : reg6)))));
          reg9 <= $unsigned((($signed((wire2 >>> reg8)) != wire2) + ((8'ha0) ?
              wire2 : (reg8[(2'h3):(1'h1)] ~^ (wire5 ? (8'h9e) : wire5)))));
          reg10 <= reg7[(4'hc):(4'hb)];
        end
      else
        begin
          if (wire1[(2'h2):(2'h2)])
            begin
              reg7 <= ($unsigned(wire4[(1'h1):(1'h0)]) <<< {($unsigned((reg7 - wire3)) ?
                      (|(^wire0)) : $unsigned($signed(wire1))),
                  $unsigned((-(wire3 != wire1)))});
              reg8 <= $unsigned(wire1);
            end
          else
            begin
              reg7 <= ((-(($unsigned(reg10) - (reg8 << reg10)) ?
                      ((&(8'hb8)) ?
                          {(8'hb5), wire0} : (reg6 ? wire2 : reg10)) : (wire0 ?
                          (wire3 ? wire4 : wire5) : {wire2}))) ?
                  ($signed(($unsigned(reg6) == (wire3 ? reg7 : wire2))) ?
                      $signed($unsigned((wire5 ?
                          (8'hbc) : wire2))) : wire3[(4'ha):(3'h6)]) : wire5);
              reg8 <= (|(~&(^~$signed(wire3[(2'h2):(2'h2)]))));
            end
          reg9 <= (+reg8);
        end
    end
  module11 #() modinst37 (wire36, clk, wire4, reg7, reg9, wire5);
  assign wire38 = ({$unsigned(((wire4 < wire0) >> (reg8 << reg7)))} ?
                      ((wire2[(1'h0):(1'h0)] * wire1[(3'h7):(3'h7)]) ?
                          wire1[(1'h0):(1'h0)] : ({(wire5 - (8'hb1))} ~^ $unsigned((wire4 >> wire0)))) : (wire0 && (-((7'h43) ?
                          $signed(reg9) : (wire5 ^ reg9)))));
  assign wire39 = $signed((reg7 ? wire0[(2'h3):(1'h0)] : wire0));
  assign wire40 = (wire2 <<< {wire39});
  assign wire41 = wire5[(4'ha):(1'h1)];
endmodule

module module11
#(parameter param34 = {(((^~((8'h9f) ? (7'h41) : (8'hb7))) ? (-{(8'hbf)}) : (((8'hb9) ? (8'h9d) : (8'hac)) ? ((8'hbb) ? (8'hbd) : (8'ha9)) : ((8'haa) ? (8'hbc) : (8'hb3)))) >>> (-(((8'ha4) ? (8'hac) : (8'hbd)) != ((8'hba) ? (7'h41) : (7'h42))))), ((7'h43) - (8'h9f))}, 
parameter param35 = (((^((param34 ^~ param34) ? (param34 ? param34 : param34) : (-param34))) <= (({param34, param34} ? param34 : param34) ? {param34, (~^param34)} : (~&param34))) + param34))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire16;
  assign y = {wire33, wire32, wire31, wire30, wire28, wire16, (1'h0)};
  assign wire16 = $signed(($signed(wire13[(2'h3):(1'h1)]) > wire15[(3'h7):(1'h1)]));
  module17 #() modinst29 (wire28, clk, wire15, wire13, wire16, wire14);
  assign wire30 = {(8'ha0)};
  assign wire31 = {$unsigned(wire12[(4'hc):(4'ha)])};
  assign wire32 = (|wire31);
  assign wire33 = wire30;
endmodule

module module17
#(parameter param27 = (((8'hb4) ? ({((8'had) ? (8'ha7) : (8'ha5))} != {((8'ha4) == (8'ha7)), {(8'hbf)}}) : ((~^((7'h42) <<< (7'h44))) && (+{(8'hbb), (8'h9e)}))) & (+((~(|(8'ha7))) | {(~&(8'hb4))}))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire26, wire25, wire24, reg23, reg22, (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= (wire20[(2'h2):(1'h1)] ?
          $signed((wire18 != (~&(^~wire21)))) : wire19[(1'h0):(1'h0)]);
      reg23 <= (($unsigned((&(wire19 ? wire20 : wire21))) <<< (^wire21)) ?
          {(~|((wire20 ? reg22 : wire20) || ((7'h40) || wire19))),
              wire19[(3'h5):(3'h5)]} : ($signed(reg22[(3'h6):(2'h3)]) ?
              wire21[(2'h3):(2'h2)] : wire21));
    end
  assign wire24 = ($signed({$signed($unsigned(reg22))}) || (wire20 - (&$unsigned($unsigned(wire21)))));
  assign wire25 = reg23;
  assign wire26 = ((&{$signed(wire25),
                      ({wire19, (8'hae)} ?
                          wire25[(3'h4):(2'h2)] : $unsigned(reg22))}) * $unsigned((8'h9e)));
endmodule
