module top #(parameter param39 = (8'h9c)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire30;
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire38,
                 wire6,
                 wire30,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((&(($signed(wire2) <= wire2) ?
          (^wire1) : $signed($signed(wire2)))));
      reg5 <= $signed($signed(wire1[(3'h7):(1'h1)]));
    end
  assign wire6 = $unsigned($unsigned(wire1));
  module7 #() modinst31 (wire30, clk, reg4, wire6, wire2, reg5, wire1);
  always
    @(posedge clk) begin
      if ((|$unsigned({((&reg4) <<< $unsigned(wire30))})))
        begin
          reg32 <= (+$unsigned(((((8'hab) ?
              wire6 : (8'ha6)) * $signed(wire3)) <<< $unsigned((wire30 ?
              reg5 : wire30)))));
          if ($unsigned({$signed(reg32[(3'h6):(2'h3)])}))
            begin
              reg33 <= $unsigned({wire30});
              reg34 <= (~(~^wire3));
              reg35 <= ((-$unsigned((~$unsigned(wire30)))) * reg5[(2'h2):(1'h1)]);
            end
          else
            begin
              reg33 <= reg4;
              reg34 <= $signed(wire30[(2'h2):(2'h2)]);
              reg35 <= $signed(((~reg32) ?
                  ({$signed(wire6), wire30} ?
                      wire6[(3'h4):(2'h2)] : wire0) : (^~(^~(8'ha4)))));
            end
        end
      else
        begin
          reg32 <= ((wire30 | {(-$unsigned(wire0)),
              wire1}) >= (reg5[(4'he):(1'h0)] ?
              $signed(($unsigned(reg33) && reg33)) : (~^wire1)));
          if ($signed((wire30[(3'h4):(2'h2)] ~^ {reg34})))
            begin
              reg33 <= (7'h43);
            end
          else
            begin
              reg33 <= {(-({(!wire1), (~&reg33)} || reg35[(1'h0):(1'h0)]))};
              reg34 <= wire1[(2'h3):(2'h3)];
            end
        end
      reg36 <= {wire1,
          $unsigned(($unsigned(wire6[(2'h2):(1'h0)]) || $signed($signed(wire30))))};
      reg37 <= ((reg34 ?
          $signed((((8'ha8) ?
              reg4 : reg34) & reg36)) : reg5[(1'h1):(1'h0)]) * {$unsigned($unsigned((wire3 ?
              reg5 : wire2))),
          $signed(((^reg36) ? (^reg34) : reg4))});
    end
  assign wire38 = ($unsigned(wire3) ?
                      (reg34 || $signed(($signed(reg35) >>> (+reg36)))) : (($signed(reg36[(5'h11):(3'h7)]) ~^ ((reg4 || reg35) || $unsigned(reg33))) ?
                          wire2 : (!($unsigned((8'hbd)) | $unsigned(wire0)))));
endmodule

module module7
#(parameter param28 = (~&(8'hb0)), 
parameter param29 = param28)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire15,
                 wire14,
                 wire13,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = $signed(((^~$unsigned(((8'ha8) && wire9))) + (wire11[(2'h3):(2'h3)] ?
                      $signed((wire8 ?
                          wire11 : wire11)) : {wire8[(1'h0):(1'h0)], wire12})));
  assign wire14 = (^~wire11);
  assign wire15 = (wire8 + {wire8[(2'h2):(2'h2)], {$unsigned((-(7'h40)))}});
  always
    @(posedge clk) begin
      reg16 <= $unsigned({(8'hac), wire9});
      reg17 <= $signed({$unsigned(wire8[(4'h9):(4'h8)])});
      if (wire15)
        begin
          reg18 <= $signed((~$signed((8'hba))));
          reg19 <= wire8;
          reg20 <= (8'h9d);
        end
      else
        begin
          if (($signed(reg16[(2'h2):(2'h2)]) <<< (8'h9c)))
            begin
              reg18 <= (~(($unsigned(wire9) * $signed(reg17[(3'h4):(1'h0)])) >>> (wire15 ?
                  $signed(wire12) : $signed((8'hbe)))));
              reg19 <= $unsigned(({((reg17 < reg17) ? {wire8} : (|wire13)),
                  {wire10[(4'hd):(1'h0)],
                      wire14[(2'h2):(1'h0)]}} * $signed((~|$unsigned(reg17)))));
            end
          else
            begin
              reg18 <= {(reg17[(1'h0):(1'h0)] ?
                      ({$unsigned(reg17), reg20[(4'hb):(2'h3)]} ?
                          $unsigned($signed(reg19)) : (8'hb3)) : $signed((^$unsigned(wire11)))),
                  reg18[(3'h6):(2'h3)]};
              reg19 <= $unsigned($signed(($signed((reg18 || (8'hb8))) ?
                  ($signed(reg20) ?
                      wire9 : reg18[(3'h5):(1'h0)]) : $unsigned($unsigned((7'h42))))));
              reg20 <= (^((((reg16 == wire8) ? wire8 : (reg19 ^~ wire9)) ?
                      (~$signed(wire15)) : $signed(reg20[(1'h0):(1'h0)])) ?
                  $signed(wire10) : (8'hba)));
              reg21 <= wire12;
            end
        end
      reg22 <= ((8'haa) >>> wire12);
    end
  assign wire23 = $unsigned($unsigned({((wire12 ?
                          reg21 : wire15) ^ $unsigned(reg18)),
                      wire14[(1'h0):(1'h0)]}));
  assign wire24 = (~^wire14);
  assign wire25 = wire23;
  assign wire26 = wire24;
  assign wire27 = (((reg18[(3'h7):(1'h1)] ?
                          (-(&wire25)) : $unsigned($signed(wire10))) > {$signed($unsigned(wire14)),
                          {wire8, $signed(wire25)}}) ?
                      $unsigned(({(wire14 ?
                              wire14 : wire9)} - (-(wire13 > reg20)))) : wire26);
endmodule
