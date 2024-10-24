module top
#(parameter param24 = ((!((((8'ha6) ? (8'hb1) : (8'hbf)) ? {(7'h43)} : ((8'h9c) == (8'ha6))) ? (((8'hbc) ? (8'hb7) : (8'ha1)) ? ((8'had) ? (8'hab) : (7'h43)) : ((8'hba) == (8'hb6))) : (~|(~&(8'hba))))) >= ((+((!(8'hbc)) ? (8'hb7) : ((8'haf) ^ (8'ha6)))) ? ((&((8'hac) ? (8'ha2) : (8'haa))) >>> (~^(!(8'hba)))) : (^(^{(8'ha4)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = $unsigned($signed($unsigned(wire0)));
  assign wire5 = $signed((8'hbf));
  assign wire6 = wire4;
  assign wire7 = (^$signed((~^({(8'h9e)} <<< (wire5 ^~ wire1)))));
  assign wire8 = $unsigned($unsigned(wire2));
  assign wire9 = (wire5[(4'ha):(2'h3)] > (~wire5[(5'h10):(4'h8)]));
  assign wire10 = wire9[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg11 <= ($unsigned(($signed((8'h9f)) ?
              $signed(((8'ha1) >>> wire3)) : ((wire7 ? (8'haa) : wire2) ?
                  {wire2} : (wire10 ? wire0 : wire7)))) ?
          ($signed((wire7[(1'h0):(1'h0)] ?
              (wire9 ?
                  wire7 : wire9) : wire4[(1'h0):(1'h0)])) <= $unsigned((7'h41))) : (($unsigned($unsigned(wire2)) >>> (!wire6)) ?
              (|{(8'hbf)}) : $unsigned((-(wire10 ? wire2 : (8'hb1))))));
      reg12 <= wire2[(2'h2):(1'h0)];
      if (({reg12[(4'hf):(4'hb)]} ?
          wire9 : $signed({$signed((wire5 ? wire3 : reg12))})))
        begin
          if ((((wire3 ?
              {(^~wire8)} : (|wire8)) >>> $unsigned($signed((wire5 <= wire6)))) >> wire3[(1'h0):(1'h0)]))
            begin
              reg13 <= wire2[(3'h4):(3'h4)];
              reg14 <= ($unsigned($unsigned(wire6[(2'h2):(1'h1)])) ?
                  ($signed(wire0) || {(~^$signed((8'hae))), wire9}) : (+wire4));
              reg15 <= wire4[(2'h2):(1'h0)];
              reg16 <= $signed(wire9);
              reg17 <= ($signed(wire10[(4'ha):(2'h2)]) ?
                  ($unsigned(((reg13 ? wire1 : reg11) ?
                      ((7'h41) ?
                          (8'hbd) : wire7) : (~^(8'hb9)))) >> (|$unsigned($unsigned(reg15)))) : ((+$signed((^~reg14))) ?
                      ({(8'ha7)} ?
                          (|(^reg14)) : $unsigned((wire0 <<< reg12))) : wire1));
            end
          else
            begin
              reg13 <= (~&$unsigned({({reg17} * (7'h44)), (~&(~^wire10))}));
              reg14 <= $unsigned(wire4[(1'h1):(1'h0)]);
            end
          reg18 <= reg16[(3'h6):(3'h5)];
        end
      else
        begin
          if ($unsigned(wire1))
            begin
              reg13 <= (&((~^($unsigned(wire0) + (wire10 ?
                  wire3 : wire7))) >= (!(|(wire10 ~^ reg17)))));
              reg14 <= (~|wire6[(3'h5):(2'h3)]);
              reg15 <= ($unsigned($unsigned(($signed(reg17) ^ (~|reg17)))) ?
                  $unsigned($signed(($signed(reg12) ?
                      reg11 : (wire10 ? reg15 : reg14)))) : $unsigned(reg17));
              reg16 <= reg13;
            end
          else
            begin
              reg13 <= ($signed({(8'ha6),
                  $signed(((7'h42) ? (8'haf) : (8'h9d)))}) || $signed(wire10));
              reg14 <= wire10[(2'h3):(2'h2)];
            end
          reg17 <= reg14;
          if (wire8[(2'h2):(1'h1)])
            begin
              reg18 <= wire7[(2'h3):(2'h2)];
              reg19 <= $unsigned($unsigned((~&(wire0 ?
                  $unsigned(wire1) : (wire6 + reg16)))));
              reg20 <= (reg14 ?
                  (|$signed((wire5[(1'h0):(1'h0)] >= (reg14 + (8'ha6))))) : reg15);
            end
          else
            begin
              reg18 <= wire6;
              reg19 <= wire10;
              reg20 <= ($signed(reg13[(2'h3):(2'h3)]) - $signed((~&(reg20[(2'h3):(1'h0)] > $unsigned((8'hae))))));
              reg21 <= $signed((($unsigned($unsigned(reg13)) && wire8) ?
                  ($signed(reg18[(3'h4):(3'h4)]) & (reg12 ?
                      (^~wire0) : $unsigned(wire0))) : ($signed((^~(8'hbf))) | reg13[(2'h2):(1'h1)])));
              reg22 <= reg19;
            end
          reg23 <= {$signed(wire2)};
        end
    end
endmodule
