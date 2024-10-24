module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire56;
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire4,
                 wire56,
                 reg68,
                 reg67,
                 reg66,
                 reg58,
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst57 (.wire7(wire0), .wire10(wire4), .wire9(wire1), .clk(clk), .wire6(wire2), .y(wire56), .wire8(wire3));
  always
    @(posedge clk) begin
      reg58 <= $signed(wire3[(1'h0):(1'h0)]);
    end
  assign wire59 = (~&(~(wire1[(4'hb):(4'hb)] ?
                      {wire1, (|wire2)} : $signed((reg58 ? wire3 : wire2)))));
  assign wire60 = (wire4 ?
                      $signed((|(!(wire1 + wire59)))) : ({(|$signed(wire0)),
                          wire56[(4'hb):(1'h1)]} >= wire56[(4'hf):(3'h5)]));
  assign wire61 = $signed((wire59[(4'hc):(3'h6)] ?
                      ($unsigned((wire3 ?
                          wire56 : wire60)) < $signed($unsigned(wire1))) : $signed((-$signed(wire56)))));
  assign wire62 = wire59;
  assign wire63 = ((wire60 << $unsigned({(wire0 == wire62)})) >>> wire56[(4'ha):(3'h7)]);
  assign wire64 = wire62;
  assign wire65 = {(~^$unsigned($unsigned((reg58 <<< wire61))))};
  always
    @(posedge clk) begin
      reg66 <= ($unsigned(wire65[(3'h4):(2'h2)]) ?
          (wire65[(2'h2):(1'h1)] ?
              ($signed((wire64 ? wire64 : wire2)) >> ({wire65,
                  wire1} ~^ wire59[(5'h10):(3'h4)])) : ($signed({reg58}) ?
                  (wire65 ?
                      (^wire63) : $signed(wire60)) : wire60[(4'hb):(4'h9)])) : $signed((wire59[(5'h13):(4'h8)] ?
              reg58 : ((wire62 <<< wire60) ? (+wire63) : $unsigned(wire64)))));
      reg67 <= ($signed($unsigned($unsigned(wire59[(3'h5):(3'h5)]))) ?
          ((((7'h41) < ((8'hbf) ~^ (8'hb6))) ?
                  (^(wire60 ? wire59 : wire63)) : $signed({(8'hb2), wire60})) ?
              wire63[(2'h2):(1'h0)] : reg58) : (^wire2[(4'hc):(1'h1)]));
      reg68 <= (reg58[(4'h8):(4'h8)] ?
          $unsigned((wire64 ?
              $unsigned(reg58) : $signed((~^reg58)))) : wire60[(1'h0):(1'h0)]);
    end
endmodule

module module5
#(parameter param54 = ((-(({(8'haa)} * (7'h40)) ~^ (((7'h42) ? (8'ha6) : (8'had)) ? ((8'h9d) ? (8'hbc) : (8'hbc)) : (&(7'h41))))) ? (^{(-{(8'hb6), (8'hb9)}), (&(~(8'haf)))}) : {((((8'haf) << (8'hb2)) - ((8'ha4) ? (8'ha4) : (8'hb3))) ? (((8'hb1) ? (8'hab) : (8'ha5)) ~^ ((8'hb8) ? (8'hb9) : (8'ha3))) : ((!(8'ha4)) ? (8'ha4) : (^(8'ha7)))), ((|((8'hbd) & (8'ha6))) ^~ (~^{(7'h43)}))}), 
parameter param55 = (~^(param54 ? (-param54) : ({{param54, param54}, (!param54)} ? (~param54) : param54))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire51;
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire53,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire27,
                 wire28,
                 wire51,
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
                 (1'h0)};
  assign wire11 = wire10;
  assign wire12 = {$unsigned((^{{wire6}}))};
  assign wire13 = (^$unsigned(wire10));
  assign wire14 = $unsigned((-{(~^{wire12, (8'hb6)}),
                      $unsigned($unsigned(wire6))}));
  assign wire15 = wire13[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= wire6[(4'he):(3'h4)];
      reg17 <= wire11;
      reg18 <= wire7;
      if (wire8)
        begin
          if ($signed($unsigned(wire8[(3'h7):(3'h6)])))
            begin
              reg19 <= reg18[(2'h2):(1'h0)];
              reg20 <= $unsigned((~(($signed(wire7) ?
                  $unsigned(wire8) : $unsigned(wire8)) <<< $signed((wire10 ?
                  wire14 : wire10)))));
            end
          else
            begin
              reg19 <= (wire6[(4'h9):(3'h7)] > wire11);
              reg20 <= $unsigned($unsigned(wire11[(4'hf):(4'h8)]));
              reg21 <= (8'ha9);
              reg22 <= {$signed((7'h44))};
              reg23 <= $signed(wire8);
            end
          reg24 <= wire15;
          reg25 <= ($unsigned(wire15) ~^ $signed({(~&(wire9 ?
                  reg18 : reg22))}));
          reg26 <= $signed((-(~^(wire13 ? {wire15} : reg25[(4'hd):(3'h5)]))));
        end
      else
        begin
          reg19 <= (!$unsigned(wire10));
          reg20 <= (-((~^{((8'hbc) < reg21), (reg17 & reg20)}) ?
              reg16 : (($unsigned(wire8) ^~ wire9) ?
                  {reg24[(2'h2):(1'h0)],
                      (wire13 ? reg20 : reg26)} : $signed({wire15}))));
          reg21 <= $signed(((&reg18) >= (({reg21, reg21} ?
              (~(8'hbc)) : wire10) <= wire11[(4'hd):(2'h2)])));
        end
    end
  assign wire27 = $signed($signed($signed(wire12[(3'h6):(3'h5)])));
  assign wire28 = (7'h42);
  module29 #() modinst52 (wire51, clk, reg21, wire9, reg19, reg16, reg22);
  assign wire53 = reg23[(2'h3):(2'h2)];
endmodule

module module29
#(parameter param50 = ((({((8'hb8) ^~ (8'ha8)), (~&(8'hae))} > ((~(8'h9f)) ^ (^~(8'hb0)))) && (8'hbb)) ? (~|((((8'ha3) != (8'hb6)) ? ((8'h9e) <= (8'hab)) : {(8'h9e), (8'ha2)}) ? ((~^(8'hab)) ~^ ((8'hba) - (8'hb3))) : (((8'ha0) ? (8'hbd) : (7'h40)) != (~|(8'hbd))))) : (({((8'ha2) == (8'ha3))} > (8'ha2)) > {((8'ha0) | ((8'hb2) == (8'ha4))), (~^((8'ha2) ^ (8'hae)))})))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = {{$unsigned((~(+wire30)))}, (^~wire31)};
  assign wire36 = ({{$unsigned(wire34)}, $signed(wire34)} ?
                      wire35[(3'h5):(2'h2)] : $unsigned(({(wire34 ?
                                  (7'h44) : wire31)} ?
                          (^~(^wire33)) : $signed($unsigned(wire30)))));
  assign wire37 = wire34;
  assign wire38 = wire35[(4'h8):(2'h2)];
  assign wire39 = (|{$signed((~|{wire31}))});
  assign wire40 = ($unsigned(((|(wire33 >= (8'h9d))) ?
                      ((wire39 ? wire32 : wire30) ?
                          wire31[(4'h9):(1'h0)] : (wire39 ?
                              (8'hbe) : wire30)) : ((~^wire39) ?
                          $unsigned(wire38) : (~|wire34)))) && (-wire35));
  assign wire41 = wire36;
  assign wire42 = wire40;
  assign wire43 = ({$unsigned($signed((wire41 ?
                          wire38 : wire34)))} != wire42[(3'h5):(2'h3)]);
  assign wire44 = $unsigned((8'hbf));
  assign wire45 = {wire44[(2'h2):(2'h2)]};
  assign wire46 = (~wire41[(1'h1):(1'h0)]);
  assign wire47 = (-{$unsigned((~^(wire30 ? (8'had) : wire38))),
                      $unsigned(wire46)});
  assign wire48 = wire46;
  assign wire49 = wire32;
endmodule
