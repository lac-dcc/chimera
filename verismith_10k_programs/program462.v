module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = {wire3};
  assign wire5 = $signed($signed($unsigned((~|(~|wire0)))));
  assign wire6 = ({{$signed((wire4 >>> wire4))}} <= $signed((~&($unsigned(wire4) <= (wire0 ?
                     (8'ha8) : wire1)))));
  assign wire7 = wire3;
  assign wire8 = (^wire3);
  assign wire9 = ({wire8[(2'h2):(1'h1)]} ^~ $signed(wire3[(3'h6):(3'h6)]));
  assign wire10 = $unsigned((8'hb8));
  always
    @(posedge clk) begin
      reg11 <= ((^$signed((wire10[(2'h2):(2'h2)] ?
          wire10[(4'hb):(2'h3)] : $unsigned((8'haa))))) << (~&(!wire7[(2'h3):(2'h2)])));
      reg12 <= $unsigned(((~|$unsigned($unsigned(wire2))) ?
          (!((wire7 ? wire1 : wire8) ?
              $unsigned(wire5) : wire3[(5'h10):(4'hb)])) : wire4));
      if (((wire0 - (((wire7 ? wire6 : wire8) ?
          wire9[(1'h1):(1'h1)] : $signed(reg11)) || ((wire0 ?
          (8'ha2) : wire9) && (wire10 ?
          wire2 : wire10)))) >>> $unsigned(($signed(wire3) ?
          $signed({wire9}) : {(|wire5), $unsigned(wire8)}))))
        begin
          reg13 <= $unsigned((|$signed((wire7 ^ $signed(wire2)))));
          reg14 <= (~&(^$signed(($signed(wire2) ?
              $unsigned(reg11) : {reg11}))));
          reg15 <= wire10[(4'hd):(1'h0)];
        end
      else
        begin
          if (reg12[(1'h1):(1'h0)])
            begin
              reg13 <= wire3;
              reg14 <= ((wire9[(1'h0):(1'h0)] ?
                      (~&(8'ha3)) : (-{{reg12, wire7}})) ?
                  reg12[(4'hd):(3'h7)] : $unsigned(reg11[(2'h2):(1'h0)]));
              reg15 <= wire2;
              reg16 <= ($signed($unsigned(wire6)) >> ($unsigned(wire7) >= $unsigned({$signed(wire0)})));
            end
          else
            begin
              reg13 <= (&wire0);
              reg14 <= (wire4 ? $signed({wire7}) : wire3);
              reg15 <= (~&$unsigned($unsigned((|(~|wire3)))));
              reg16 <= reg15;
              reg17 <= (~^{$unsigned((~&(reg11 ? wire6 : reg12))), (~|reg12)});
            end
          if (reg11[(2'h2):(2'h2)])
            begin
              reg18 <= (({wire10, reg14[(3'h7):(2'h2)]} ?
                  {{(reg15 ?
                              wire10 : wire8)}} : wire8[(3'h4):(1'h1)]) <= {$signed((|(^~wire10))),
                  wire0[(4'h9):(1'h0)]});
              reg19 <= $unsigned($signed({(~^reg15),
                  ($signed(reg15) ?
                      $signed(reg16) : ((8'ha6) ? wire5 : wire8))}));
            end
          else
            begin
              reg18 <= $unsigned(wire4);
              reg19 <= (|(^~(~|(8'hac))));
              reg20 <= wire4[(2'h2):(2'h2)];
              reg21 <= $unsigned((|$unsigned((+wire3))));
            end
        end
      reg22 <= (+$unsigned($unsigned({(wire8 ? reg17 : wire10),
          (reg15 != wire6)})));
    end
  assign wire23 = (~|({{$unsigned(reg18), (-wire5)},
                      (-((8'ha9) + (8'haf)))} > {$unsigned((wire3 ^~ reg13))}));
  assign wire24 = {wire0};
  assign wire25 = $unsigned(wire10[(3'h7):(3'h7)]);
  assign wire26 = $signed(((wire2 ~^ wire6) | {$signed({(8'hbb)})}));
endmodule
