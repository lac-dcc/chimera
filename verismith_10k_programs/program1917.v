module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  assign y = {wire42,
                 wire31,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire5 = $unsigned(wire2);
  assign wire6 = {$unsigned({(+(wire0 ? wire1 : (8'h9c))), wire4})};
  assign wire7 = (wire5 || (~&$unsigned(wire0)));
  assign wire8 = $unsigned((~($unsigned((wire3 ?
                     wire0 : wire5)) < {(wire4 & wire4), (wire6 ^ wire0)})));
  assign wire9 = ({(8'ha0)} ?
                     $signed((~&((wire1 <= wire7) ?
                         (wire1 ?
                             wire0 : wire2) : wire3))) : ($unsigned($signed($unsigned(wire4))) ?
                         wire8[(4'h9):(3'h7)] : ($signed({wire7}) ?
                             (((7'h42) ~^ wire1) ?
                                 $signed(wire4) : $unsigned(wire6)) : (~(^wire3)))));
  assign wire10 = ((({wire2[(3'h4):(2'h2)], $unsigned((8'hb9))} ?
                          ((-wire9) <= wire7[(4'hc):(4'hb)]) : $unsigned((wire4 ?
                              wire8 : wire0))) ?
                      wire4 : (((wire2 <= wire6) ?
                          {wire0,
                              wire1} : wire9) >> wire2[(1'h1):(1'h1)])) - wire4[(4'h9):(3'h4)]);
  module11 #() modinst32 (.wire14(wire4), .y(wire31), .wire13(wire6), .wire15(wire3), .wire12(wire0), .clk(clk));
  always
    @(posedge clk) begin
      if ($unsigned($signed(($unsigned((wire8 && wire9)) ?
          wire8[(5'h12):(2'h2)] : ((|wire3) ? (8'ha9) : $signed(wire8))))))
        begin
          if (((wire1[(4'ha):(3'h6)] ?
              $signed((wire0[(5'h12):(4'he)] < ((8'hbf) + (8'hab)))) : wire4) ~^ {wire31,
              (({(8'hb7)} | wire3) ?
                  $unsigned((+wire4)) : (((8'hba) ?
                      wire7 : (8'hb5)) && wire10))}))
            begin
              reg33 <= wire31;
              reg34 <= (~|((((|wire5) || (wire0 ? wire0 : (8'hb0))) ?
                  (&(~^wire7)) : $signed((+wire6))) ^~ (8'ha6)));
            end
          else
            begin
              reg33 <= $signed(wire5[(3'h4):(1'h1)]);
              reg34 <= ($unsigned(wire3[(5'h14):(4'ha)]) * (7'h41));
              reg35 <= $unsigned(wire2[(3'h7):(1'h1)]);
              reg36 <= wire5[(4'ha):(3'h6)];
            end
          reg37 <= $signed(wire1);
          reg38 <= reg35;
        end
      else
        begin
          if (({reg34[(1'h0):(1'h0)]} ?
              ((!$signed((~wire3))) >= (((reg35 == wire7) ~^ reg37) ?
                  $unsigned(wire6) : {wire0[(3'h4):(2'h2)]})) : $unsigned(wire5)))
            begin
              reg33 <= wire31;
              reg34 <= (((^($signed(wire5) ?
                      reg37[(4'h8):(3'h6)] : (^reg36))) != reg36[(4'hc):(2'h2)]) ?
                  wire31[(3'h7):(3'h4)] : $signed(reg36));
            end
          else
            begin
              reg33 <= $unsigned(reg38);
            end
          if ($signed(reg36))
            begin
              reg35 <= {{((|reg35[(1'h0):(1'h0)]) <<< (8'ha4))}, (~|wire10)};
              reg36 <= $unsigned(reg38);
              reg37 <= ((^~($unsigned((wire2 < wire9)) ?
                      $unsigned((reg38 >>> reg38)) : wire6)) ?
                  wire8 : reg37[(2'h3):(1'h1)]);
            end
          else
            begin
              reg35 <= $signed(wire1);
            end
        end
      reg39 <= $unsigned({$signed(({wire10} ?
              reg38[(1'h1):(1'h0)] : $unsigned(reg35)))});
      reg40 <= {(~&$unsigned(wire5))};
      reg41 <= wire5;
    end
  assign wire42 = $unsigned(((^~wire31[(3'h7):(2'h2)]) ^ ($signed(reg37) >= (~$signed(wire31)))));
endmodule

module module11
#(parameter param30 = (~^(^~{(&((8'hbb) ? (8'hac) : (8'hb1))), (-(|(8'ha5)))})))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg28,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire12;
      reg17 <= wire13;
      reg18 <= wire14;
      reg19 <= reg18[(4'hf):(4'h9)];
    end
  assign wire20 = $unsigned((($unsigned((wire14 >>> wire15)) >>> (-wire15[(4'h9):(3'h5)])) ?
                      $signed($unsigned(reg17)) : wire13));
  assign wire21 = ($unsigned(reg17) ?
                      wire12[(2'h3):(1'h0)] : $signed((^$signed((7'h42)))));
  assign wire22 = (~&$unsigned(((wire13 | (wire12 << reg17)) ?
                      wire14[(3'h7):(1'h0)] : $unsigned((reg16 <<< wire13)))));
  assign wire23 = (|((!{{wire20, wire20},
                      {(8'hac)}}) << $unsigned(wire20[(2'h3):(2'h3)])));
  assign wire24 = reg18;
  assign wire25 = {(wire24 ?
                          (8'ha7) : {((reg16 ? wire13 : wire13) ?
                                  reg16 : $signed(wire21)),
                              reg17[(4'h9):(2'h3)]})};
  assign wire26 = wire13;
  assign wire27 = ((8'hb0) ?
                      $unsigned(((8'hb6) + (((8'hac) <<< (8'h9f)) ?
                          $signed(wire13) : wire26[(4'h8):(3'h7)]))) : {wire25[(3'h7):(2'h3)]});
  always
    @(posedge clk) begin
      reg28 <= (8'hb8);
    end
  assign wire29 = (($unsigned((reg17 ? $signed(reg16) : {wire21})) ?
                          wire20 : (^(~&(~&wire13)))) ?
                      reg16 : $unsigned($unsigned($unsigned(((8'hac) ?
                          wire13 : wire27)))));
endmodule
