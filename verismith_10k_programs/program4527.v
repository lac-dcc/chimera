module top
#(parameter param60 = {(~((|{(8'hb7)}) >>> (~^((8'h9f) ^ (8'hb1)))))}, 
parameter param61 = (~(((((8'hb2) ? param60 : param60) ? (param60 | (8'ha4)) : {param60}) == {(param60 >> param60)}) & {(&(&param60))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire41;
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire45,
                 wire44,
                 wire43,
                 wire5,
                 wire6,
                 wire41,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire5 = $signed(wire3);
  assign wire6 = $unsigned(wire1);
  module7 #() modinst42 (wire41, clk, wire4, wire5, wire1, wire2, wire0);
  assign wire43 = wire3[(2'h2):(1'h0)];
  assign wire44 = (wire2 >>> $unsigned((wire43[(4'hd):(4'ha)] > (8'hb6))));
  assign wire45 = ($signed(wire0[(1'h1):(1'h1)]) ?
                      ((!(wire1 ^~ (wire44 || wire0))) ?
                          {wire3[(2'h2):(1'h0)],
                              (-wire44[(2'h3):(1'h0)])} : $unsigned($signed({(8'ha9),
                              wire44}))) : (~&(8'hb6)));
  always
    @(posedge clk) begin
      if (wire44)
        begin
          reg46 <= (((($unsigned((8'ha7)) ?
                  $signed(wire43) : $unsigned((8'hb4))) ~^ $unsigned($signed(wire2))) + ($unsigned((wire45 ?
                      wire45 : wire4)) ?
                  ($unsigned((8'hb4)) ?
                      (wire45 ? wire6 : wire2) : wire45) : wire4)) ?
              wire2[(3'h6):(2'h2)] : (-$unsigned(((wire4 >= wire0) >> (~|wire41)))));
        end
      else
        begin
          if ($unsigned(wire41[(3'h4):(3'h4)]))
            begin
              reg46 <= (~^reg46);
              reg47 <= reg46[(4'h9):(3'h6)];
              reg48 <= (wire0[(3'h7):(3'h6)] ?
                  wire6[(3'h6):(3'h4)] : ($unsigned((+$unsigned((7'h43)))) >>> $signed(wire41[(1'h0):(1'h0)])));
              reg49 <= {wire3[(1'h0):(1'h0)]};
            end
          else
            begin
              reg46 <= ($unsigned(reg49) || {(8'haa)});
              reg47 <= reg49[(3'h5):(3'h4)];
              reg48 <= wire6;
              reg49 <= reg47[(2'h2):(2'h2)];
              reg50 <= wire6;
            end
          if (wire3)
            begin
              reg51 <= (-wire41[(1'h1):(1'h0)]);
              reg52 <= (&wire2[(2'h2):(1'h0)]);
              reg53 <= $unsigned((^$unsigned((((8'hbe) ? wire4 : wire4) ?
                  (~&wire43) : $signed(wire0)))));
            end
          else
            begin
              reg51 <= $unsigned((|wire43));
              reg52 <= $unsigned((7'h44));
              reg53 <= $signed((^~$unsigned(wire4)));
              reg54 <= (wire5 != (!$signed(wire41[(1'h0):(1'h0)])));
              reg55 <= (($unsigned($signed(wire43[(2'h3):(1'h0)])) == $signed((8'ha4))) ^~ reg46);
            end
          reg56 <= (8'ha1);
        end
    end
  assign wire57 = wire45;
  assign wire58 = reg55[(3'h7):(3'h4)];
  assign wire59 = reg49[(1'h0):(1'h0)];
endmodule

module module7
#(parameter param40 = (~((^{(~|(8'h9c)), ((8'ha4) ^ (8'ha9))}) ? {(((8'hb3) < (8'ha7)) >= ((8'ha5) > (8'hba))), (&((8'ha4) ? (8'ha1) : (8'hb5)))} : (^~(((8'h9e) >>> (8'hb6)) != (!(8'hb3)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire19,
                 wire14,
                 wire13,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = wire12[(1'h1):(1'h0)];
  assign wire14 = {wire10, $unsigned(wire8)};
  always
    @(posedge clk) begin
      if ($unsigned(wire13[(3'h6):(3'h5)]))
        begin
          reg15 <= $signed(({(wire13[(1'h1):(1'h1)] | {wire11}), wire14} ?
              (|(wire12[(2'h3):(2'h3)] ?
                  wire8 : ((8'hb2) < wire8))) : $unsigned(wire11[(3'h6):(1'h1)])));
          reg16 <= {wire9[(2'h3):(2'h3)]};
          reg17 <= ($signed((^~(+reg15))) ?
              $signed(wire13) : wire8[(3'h7):(3'h5)]);
          reg18 <= $signed($signed(wire12));
        end
      else
        begin
          reg15 <= (((({reg16, wire8} ?
                  (wire12 <= wire9) : reg15) <<< (8'ha2)) ?
              {(wire8 ? wire11 : $unsigned((8'h9f))),
                  ((wire9 <<< wire10) >>> $signed((8'hbd)))} : (8'had)) ^ $signed((~$signed({wire8,
              wire8}))));
        end
    end
  assign wire19 = (reg18 ?
                      $signed((~&wire12[(1'h0):(1'h0)])) : wire11[(4'hd):(1'h1)]);
  always
    @(posedge clk) begin
      reg20 <= wire13;
      if (wire14)
        begin
          reg21 <= wire8[(4'ha):(1'h1)];
          if ({(wire13[(3'h4):(2'h3)] | (^~(reg16[(3'h5):(1'h0)] ?
                  $unsigned(reg21) : wire10[(4'ha):(2'h3)])))})
            begin
              reg22 <= ({$unsigned((((8'hbe) >>> wire12) << $signed(wire10)))} && wire19[(1'h1):(1'h0)]);
              reg23 <= ((^~wire14[(3'h7):(3'h6)]) == wire13);
              reg24 <= (^~$unsigned($unsigned(((wire10 ?
                  reg21 : wire19) >> (wire8 == reg17)))));
              reg25 <= reg16;
            end
          else
            begin
              reg22 <= (+$signed((~^((~^wire14) ? $signed(wire8) : (-wire8)))));
              reg23 <= wire11[(4'hc):(3'h7)];
              reg24 <= $signed({reg20, wire13});
            end
          reg26 <= (((($unsigned(wire9) >= {reg16,
              reg24}) + $unsigned(reg20)) >>> ($signed((reg24 ?
              wire14 : wire13)) == {reg24,
              ((8'h9e) | reg18)})) || reg23[(3'h4):(1'h0)]);
          reg27 <= $unsigned($unsigned((~^reg23[(1'h0):(1'h0)])));
        end
      else
        begin
          reg21 <= reg22;
          reg22 <= {($unsigned({wire11[(4'he):(3'h4)]}) * ({$signed(wire10)} ?
                  {(~|(8'h9d)), reg21[(5'h10):(3'h7)]} : ({reg25, reg25} ?
                      reg27[(4'ha):(2'h3)] : $signed(reg20)))),
              (~^wire12)};
          if (reg16)
            begin
              reg23 <= $unsigned(reg26[(1'h0):(1'h0)]);
              reg24 <= $unsigned({$signed((+wire14)), reg17});
              reg25 <= $signed((~$signed((-reg26))));
              reg26 <= $signed($signed((reg22[(3'h7):(3'h5)] ?
                  wire8[(3'h7):(3'h6)] : ((reg20 || reg16) ?
                      wire8[(4'hf):(4'hc)] : reg20))));
              reg27 <= reg27;
            end
          else
            begin
              reg23 <= {(($unsigned($signed(reg23)) << $unsigned(wire10)) ?
                      wire9 : reg17)};
              reg24 <= (((wire12 + reg25[(4'ha):(3'h6)]) - (reg18 ?
                  (8'hbc) : {$signed(reg21),
                      reg18[(4'h9):(3'h7)]})) ~^ wire9[(3'h6):(2'h3)]);
              reg25 <= (+$unsigned({$signed(wire14[(3'h7):(3'h6)])}));
              reg26 <= $signed((|reg25));
              reg27 <= reg24;
            end
          reg28 <= ((!$signed($unsigned(((8'hbb) ? reg16 : (8'haa))))) ?
              $signed(wire19[(2'h3):(2'h2)]) : ($unsigned(((reg27 == (7'h44)) <= (&wire12))) != $unsigned(($unsigned(wire12) ?
                  reg18 : (8'hb6)))));
          if ((&(reg24[(4'h8):(3'h5)] & $unsigned($unsigned($signed(wire19))))))
            begin
              reg29 <= {({(reg20 <<< (~^wire8)),
                      reg23[(3'h5):(2'h3)]} < ((|$signed(reg16)) <<< $unsigned(wire19[(3'h6):(3'h5)]))),
                  wire10};
              reg30 <= $signed({{(reg23[(3'h5):(1'h0)] ?
                          $signed(reg28) : (reg21 ? reg17 : reg27))}});
              reg31 <= reg16;
            end
          else
            begin
              reg29 <= $signed((reg16[(1'h0):(1'h0)] ?
                  $signed($signed((~&(7'h44)))) : ($unsigned((reg18 ^~ reg18)) ?
                      {(8'hb2)} : (reg29[(2'h2):(1'h0)] >= (reg23 >>> wire14)))));
              reg30 <= ((wire12 ? reg15[(3'h5):(1'h0)] : reg16) ?
                  wire8[(4'hf):(4'hb)] : ((^reg31[(1'h1):(1'h0)]) >= $unsigned(({reg26,
                      reg16} & reg28))));
            end
        end
      reg32 <= $signed(wire11[(4'hf):(4'h9)]);
      reg33 <= $unsigned((!(wire9[(3'h5):(3'h5)] << wire13)));
    end
  assign wire34 = (~^reg32);
  assign wire35 = reg21[(3'h6):(1'h0)];
  assign wire36 = $unsigned({(($unsigned((7'h42)) ?
                              (~^reg17) : ((8'hb5) | wire10)) ?
                          $signed(reg21) : {(~&reg15),
                              (reg16 ? wire19 : reg18)}),
                      reg16[(3'h5):(2'h2)]});
  assign wire37 = ((|$signed({(wire19 ? reg33 : reg31)})) ?
                      (~|reg29) : ((+reg20[(1'h1):(1'h0)]) ?
                          $unsigned({$signed(reg24),
                              (-wire14)}) : reg32[(2'h2):(1'h1)]));
  assign wire38 = $unsigned((~&reg32[(3'h5):(1'h0)]));
  assign wire39 = $signed($signed(({{reg30, reg21}, wire10} ^ wire8)));
endmodule
