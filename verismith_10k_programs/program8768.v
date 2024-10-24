module top
#(parameter param47 = {(|({(~(8'ha2))} ? (^(8'hb1)) : (&((8'ha7) ^~ (8'ha9))))), (((((8'hab) ? (8'ha5) : (8'haa)) ? {(8'hb8)} : ((8'h9d) + (8'hae))) >= (~&(+(8'hbe)))) & ((((8'ha1) * (8'ha9)) ? (|(8'ha2)) : ((8'h9d) <<< (8'hbd))) << (~((8'ha4) - (8'hb3)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire40;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire4,
                 wire5,
                 wire40,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned($unsigned((~|(wire1 >> wire1)))));
  assign wire5 = $unsigned($signed({wire4[(4'ha):(3'h4)],
                     $unsigned((|wire4))}));
  module6 #() modinst41 (.wire7(wire1), .wire10(wire4), .wire8(wire2), .clk(clk), .wire11(wire3), .wire9(wire5), .y(wire40));
  assign wire42 = $unsigned($unsigned((+(8'h9e))));
  assign wire43 = (+wire5[(4'hb):(4'h8)]);
  assign wire44 = {wire2[(5'h14):(3'h4)]};
  assign wire45 = wire42[(4'hd):(1'h0)];
  assign wire46 = ((({wire40[(1'h0):(1'h0)]} | (wire45 + (|wire42))) << $unsigned(($signed((8'h9d)) <= wire42))) <<< wire2);
endmodule

module module6
#(parameter param38 = (+((~|(~^{(8'ha0)})) < ({((8'hb9) ? (8'hb2) : (8'hb7)), ((8'hae) ? (8'hb8) : (8'hab))} ^ (((7'h40) + (8'hba)) | {(8'hba), (8'h9f)})))), 
parameter param39 = (^(~&((!(param38 <<< param38)) ? {param38, (|param38)} : ((param38 >> (8'ha3)) | ((7'h42) >= param38))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
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
                 (1'h0)};
  assign wire12 = (((8'ha1) ?
                      (wire11 ?
                          wire9[(4'h9):(1'h1)] : {$signed((8'ha9)),
                              wire10[(1'h0):(1'h0)]}) : {(^(wire11 >= (7'h44)))}) + wire11);
  assign wire13 = $signed(($signed({$signed((8'h9c))}) - (&(|wire12))));
  assign wire14 = wire8;
  assign wire15 = $unsigned((!((8'hbc) < $signed($signed(wire14)))));
  always
    @(posedge clk) begin
      reg16 <= (&$signed((wire14[(1'h1):(1'h0)] ?
          ((wire8 || wire14) >> (|wire14)) : ((wire9 ? wire9 : wire12) ?
              $signed((8'hb1)) : wire12[(3'h5):(1'h0)]))));
      if ($unsigned(wire7))
        begin
          reg17 <= wire7;
          reg18 <= reg17;
          if ((8'hbe))
            begin
              reg19 <= $unsigned((wire10[(3'h5):(2'h2)] ?
                  wire7[(3'h6):(2'h2)] : (8'ha1)));
              reg20 <= wire14;
              reg21 <= (~wire7);
              reg22 <= ((^~(8'ha7)) ?
                  ((|$unsigned({reg19})) ^ wire7[(3'h4):(3'h4)]) : (7'h44));
            end
          else
            begin
              reg19 <= (+$signed($signed(wire14[(1'h1):(1'h0)])));
              reg20 <= $signed({wire12[(3'h4):(2'h3)],
                  ($signed(((8'h9f) + wire10)) <= (wire9[(3'h7):(2'h2)] != (reg17 ?
                      wire12 : wire12)))});
              reg21 <= $signed(wire12);
              reg22 <= (~&wire10[(3'h4):(1'h1)]);
              reg23 <= wire14[(3'h5):(1'h1)];
            end
          if ($signed($unsigned(wire13)))
            begin
              reg24 <= wire15[(4'hb):(4'h8)];
              reg25 <= ((($signed(reg18) ?
                      (reg22[(1'h1):(1'h1)] ^~ ((8'hbb) ^~ wire12)) : reg17[(1'h0):(1'h0)]) >> wire9[(4'hc):(4'hc)]) ?
                  ((wire14[(1'h0):(1'h0)] < wire8[(4'hc):(3'h5)]) << {reg20}) : {(8'hb8),
                      wire10[(2'h2):(1'h0)]});
              reg26 <= (reg22[(1'h1):(1'h1)] + wire12);
              reg27 <= {(~wire15[(3'h4):(1'h0)]), reg19};
              reg28 <= reg25[(1'h1):(1'h1)];
            end
          else
            begin
              reg24 <= (~(((~wire11) - {wire8,
                  (wire9 >> wire15)}) << (~|reg28[(4'hd):(3'h4)])));
              reg25 <= $signed(wire10[(2'h3):(2'h2)]);
              reg26 <= ((^~(8'hae)) ~^ ($unsigned($unsigned($unsigned((8'h9e)))) ?
                  (reg28 ?
                      (&(wire10 && reg20)) : (&(reg23 ^~ (8'hb6)))) : reg27));
              reg27 <= wire14;
              reg28 <= {$unsigned(reg19[(4'hb):(3'h7)])};
            end
        end
      else
        begin
          reg17 <= (((-($unsigned((8'h9f)) ? {reg24} : $signed(wire15))) ?
                  $unsigned(((wire7 << reg16) ?
                      (~reg26) : $signed(reg20))) : wire15[(4'hb):(3'h7)]) ?
              (8'ha8) : $signed(reg16));
        end
      reg29 <= reg27[(2'h2):(2'h2)];
    end
  assign wire30 = ({($signed($unsigned(reg27)) ?
                              $unsigned(reg20[(4'h9):(3'h6)]) : ($unsigned(reg18) ?
                                  (&(8'ha4)) : $unsigned(reg25))),
                          $unsigned($signed({wire8}))} ?
                      {(!(reg24 ? reg28 : $signed(reg29))),
                          wire8} : $signed($unsigned((^~$unsigned(wire7)))));
  assign wire31 = reg21;
  assign wire32 = (^~(reg29[(1'h1):(1'h0)] <<< (($unsigned(wire14) < reg27[(2'h2):(1'h0)]) ?
                      (~^$unsigned(reg16)) : wire8[(3'h6):(2'h3)])));
  assign wire33 = (^~((^(reg27[(3'h4):(2'h3)] <<< (~^reg22))) >>> $unsigned((-$unsigned(reg29)))));
  assign wire34 = wire33[(2'h3):(2'h3)];
  assign wire35 = $unsigned(($unsigned($unsigned($unsigned(wire33))) ?
                      {((reg24 ? reg18 : reg26) & wire11),
                          {((8'hb8) & wire10),
                              reg16[(4'hb):(3'h4)]}} : reg23[(4'h8):(3'h7)]));
  assign wire36 = {$unsigned(reg21[(2'h3):(2'h3)])};
  assign wire37 = (~|wire30);
endmodule
