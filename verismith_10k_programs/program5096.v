module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire37;
  assign y = {wire39, wire5, wire6, wire7, wire8, wire37, (1'h0)};
  assign wire5 = wire2[(4'ha):(2'h2)];
  assign wire6 = (&$unsigned($signed({(wire1 >>> wire4), {wire0}})));
  assign wire7 = wire3[(1'h1):(1'h1)];
  assign wire8 = (wire2 ?
                     $unsigned(wire0[(3'h6):(2'h2)]) : ($unsigned((7'h42)) ?
                         (wire5 || (!(^wire0))) : $unsigned($signed((wire2 >>> wire6)))));
  module9 #() modinst38 (wire37, clk, wire6, wire2, wire5, wire8, wire0);
  assign wire39 = (((8'ha7) ?
                          (8'ha4) : $signed(((wire8 & wire37) ?
                              ((8'hbc) <<< wire1) : $signed((8'ha8))))) ?
                      (8'hb1) : {(8'ha5), wire2});
endmodule

module module9
#(parameter param35 = ({{((^~(8'hb1)) < {(8'ha7)}), ({(8'hbc), (8'hb2)} ? ((8'hba) ? (7'h41) : (7'h42)) : (~(8'hab)))}} ^ (|(&(((8'ha3) ? (8'hab) : (8'hb2)) & ((8'hbe) ? (8'hb0) : (8'ha0)))))), 
parameter param36 = param35)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  assign y = {wire34,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 (1'h0)};
  assign wire15 = (($signed(wire11[(4'hc):(4'hb)]) > $signed(((8'hbe) - $signed(wire14)))) & ($signed((wire12 || (wire13 ?
                          wire14 : (7'h44)))) ?
                      {$signed(wire12),
                          $signed($signed(wire12))} : {{$unsigned(wire11),
                              $unsigned(wire10)}}));
  assign wire16 = {wire11, (!wire13[(3'h5):(2'h2)])};
  assign wire17 = wire16[(3'h5):(2'h2)];
  assign wire18 = $unsigned((-$signed((8'hb6))));
  assign wire19 = $unsigned((+({$unsigned(wire16), ((8'ha7) + wire18)} ?
                      wire17 : (wire10 ? (|wire11) : wire10[(3'h5):(1'h1)]))));
  assign wire20 = wire10;
  assign wire21 = {(^(($signed((8'hae)) <= $signed(wire18)) ?
                          (!$unsigned((8'haf))) : ((wire13 ?
                                  (8'ha9) : (8'hb0)) ?
                              $unsigned(wire11) : (-wire19))))};
  assign wire22 = ($unsigned($signed({wire10[(3'h4):(3'h4)]})) || $unsigned({(~|wire18[(4'h8):(1'h1)]),
                      (~^(wire18 ? wire21 : (8'hbb)))}));
  always
    @(posedge clk) begin
      reg23 <= wire13;
      reg24 <= $unsigned((wire19 ?
          ($unsigned((wire13 ?
              wire12 : wire14)) <= wire22) : $signed($signed(wire17))));
      reg25 <= $signed($unsigned(($signed((wire14 ?
          reg24 : reg24)) && $unsigned((8'h9c)))));
      if ({$unsigned((|wire14)), (7'h41)})
        begin
          if ($signed(((wire11 ?
                  $signed($unsigned(wire17)) : wire16[(4'hf):(4'hc)]) ?
              (reg25 ?
                  {(wire11 & (8'hae)),
                      (~|wire14)} : {wire12[(1'h0):(1'h0)]}) : (~^$unsigned((wire20 <= reg25))))))
            begin
              reg26 <= $unsigned(($signed($unsigned((wire11 ?
                  wire14 : reg23))) || ($unsigned((wire11 + (7'h40))) != $unsigned((reg23 < wire21)))));
            end
          else
            begin
              reg26 <= $unsigned(wire22[(2'h2):(1'h1)]);
            end
          reg27 <= {reg23[(3'h4):(1'h1)]};
          reg28 <= $unsigned($unsigned((reg26[(3'h7):(3'h7)] ?
              wire11[(4'hc):(1'h0)] : $signed((~^wire14)))));
        end
      else
        begin
          reg26 <= ({wire12[(1'h0):(1'h0)]} ?
              (&(~(+(wire11 ? reg24 : reg26)))) : wire14);
          reg27 <= ($signed($signed((!wire14))) ?
              wire11[(4'h9):(4'h8)] : ((~^wire19[(2'h3):(2'h2)]) ?
                  (($signed(wire16) ^ (reg28 <= wire11)) ?
                      (!(wire22 >>> wire11)) : ((wire14 != wire14) ?
                          ((8'hae) || wire22) : $unsigned(wire10))) : {((wire13 <= wire13) & (wire19 | reg27))}));
          reg28 <= $signed($signed(reg27[(4'ha):(2'h2)]));
          if (reg28[(5'h14):(3'h7)])
            begin
              reg29 <= (reg25 ?
                  $unsigned($signed(wire10)) : wire11[(4'hf):(3'h5)]);
              reg30 <= (-wire19);
              reg31 <= ((wire22[(4'h9):(3'h5)] ?
                  ((^$unsigned(reg30)) * $unsigned({(8'ha5),
                      reg23})) : ($signed($unsigned(reg28)) >> ((8'ha5) ?
                      (wire19 & reg30) : (|reg24)))) & wire13[(3'h4):(2'h2)]);
            end
          else
            begin
              reg29 <= reg26[(1'h1):(1'h0)];
              reg30 <= {$signed($unsigned($signed(reg28)))};
            end
          reg32 <= (+(8'hb4));
        end
      reg33 <= (+$unsigned($unsigned(((wire19 ?
          wire20 : wire11) << (|(8'ha4))))));
    end
  assign wire34 = wire16[(5'h14):(2'h3)];
endmodule
