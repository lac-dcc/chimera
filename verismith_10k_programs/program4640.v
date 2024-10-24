module top #(parameter param46 = (8'ha4)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire41,
                 wire39,
                 wire5,
                 wire4,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((^wire2));
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= wire4[(3'h4):(3'h4)];
      if ((~&wire2))
        begin
          reg7 <= wire2;
        end
      else
        begin
          if ((($unsigned($unsigned($signed(wire2))) ?
                  (wire5 > $signed((!reg7))) : (^~$signed((wire0 ?
                      wire3 : wire1)))) ?
              $unsigned($signed({$unsigned(wire5)})) : $signed((($signed(wire5) ?
                  {(8'h9f)} : wire2) <= wire1[(5'h12):(2'h3)]))))
            begin
              reg7 <= (^wire3);
              reg8 <= $unsigned($unsigned((({wire3} + {(8'hba), wire2}) ?
                  $unsigned($unsigned(wire2)) : (^(wire3 - wire3)))));
            end
          else
            begin
              reg7 <= ((8'hb5) * (wire1 ?
                  $unsigned(((wire4 ?
                      wire5 : reg6) > (^~wire0))) : reg7[(1'h0):(1'h0)]));
              reg8 <= wire5[(2'h3):(2'h2)];
            end
          reg9 <= wire3;
        end
    end
  module10 #() modinst40 (.wire12(wire5), .y(wire39), .wire14(reg8), .wire13(wire4), .clk(clk), .wire11(reg6));
  assign wire41 = $unsigned(($signed(($signed(reg8) < $signed(wire0))) ?
                      ({$signed(wire1), $signed(wire1)} ?
                          $signed((wire2 << wire0)) : $signed(reg6)) : (~&{(&(8'ha2)),
                          reg9[(4'hf):(4'hb)]})));
  always
    @(posedge clk) begin
      reg42 <= $signed((-(^(-(~&wire41)))));
      reg43 <= (({wire39[(2'h2):(2'h2)]} & ($unsigned(reg6[(4'ha):(3'h4)]) ?
              $unsigned($signed(wire3)) : ($unsigned(reg42) ?
                  {wire0, wire5} : (wire1 ? wire5 : reg8)))) ?
          {$unsigned($unsigned(reg42))} : wire1);
      reg44 <= $unsigned($unsigned($unsigned((8'hb5))));
      reg45 <= wire0;
    end
endmodule

module module10
#(parameter param38 = (+(((8'hb0) + {{(8'ha6)}}) <<< (~(~|((8'hbd) ? (8'hbe) : (8'ha1)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire15 = {(+$unsigned(({wire14} ?
                          ((8'hb5) ? wire13 : wire11) : $signed(wire12))))};
  assign wire16 = ((+{wire13[(3'h5):(3'h4)], (~(~&wire12))}) ?
                      (($unsigned(wire13[(2'h2):(2'h2)]) >= $unsigned($signed(wire15))) && $signed((^{wire11,
                          wire12}))) : wire11);
  assign wire17 = ($signed((~^$unsigned((wire14 >> wire16)))) && wire15[(1'h1):(1'h0)]);
  assign wire18 = wire16;
  always
    @(posedge clk) begin
      reg19 <= wire11[(2'h2):(1'h1)];
      if ($signed((&wire16)))
        begin
          reg20 <= $unsigned((reg19[(4'hc):(2'h3)] ?
              wire11[(4'h9):(3'h7)] : wire12[(4'h8):(4'h8)]));
          if ((8'hbd))
            begin
              reg21 <= ((wire11[(2'h2):(1'h0)] ?
                      $unsigned($unsigned(wire12[(4'h8):(1'h0)])) : ((^~wire15[(3'h5):(1'h0)]) ?
                          (~|$signed(wire14)) : $signed(wire16))) ?
                  wire17 : wire14);
              reg22 <= wire17;
              reg23 <= (|reg19[(4'hc):(3'h5)]);
              reg24 <= (8'ha6);
              reg25 <= wire16[(1'h1):(1'h1)];
            end
          else
            begin
              reg21 <= $unsigned((8'hab));
            end
          reg26 <= reg23;
          reg27 <= ($unsigned($signed((wire16 ?
                  $unsigned(reg21) : $unsigned(wire14)))) ?
              wire11 : {wire12, wire15});
          reg28 <= $unsigned(($signed(((wire16 ? (8'hb5) : wire18) ?
              $unsigned(wire17) : $unsigned(reg19))) ^~ wire15));
        end
      else
        begin
          if (((($signed(wire17[(4'h9):(1'h0)]) >= ($signed(reg23) ?
              (+(8'hb7)) : (wire17 ?
                  reg21 : wire13))) & reg27[(4'hd):(4'hd)]) == $signed($signed($signed($signed(reg20))))))
            begin
              reg20 <= wire16[(5'h12):(3'h6)];
            end
          else
            begin
              reg20 <= (reg24 - ((((-wire15) ^~ (~|reg23)) + ({wire17} ?
                  ((8'ha0) || reg26) : {reg28, reg22})) + reg28));
              reg21 <= $signed($signed((~|reg27[(3'h4):(1'h1)])));
              reg22 <= $signed(((reg26[(5'h15):(1'h1)] == (^wire12)) ?
                  (8'hb8) : $signed($unsigned((~|wire17)))));
              reg23 <= (8'h9c);
              reg24 <= $unsigned((~&$unsigned(($signed(reg28) ?
                  (~^wire17) : (wire14 ? (8'hb2) : (8'hb2))))));
            end
        end
    end
  assign wire29 = $unsigned(($signed($unsigned(reg25)) ?
                      $unsigned((^~wire11)) : (reg28 <<< (8'ha3))));
  assign wire30 = (-$signed($signed({$unsigned(wire16)})));
  assign wire31 = ($unsigned(reg23) ?
                      (($signed(wire30) | $unsigned({(8'ha6)})) | $signed((~^wire16[(2'h3):(1'h0)]))) : $signed((~&$unsigned($unsigned(reg28)))));
  assign wire32 = ($unsigned({(wire15 ? $signed(reg19) : $signed(wire15)),
                      $unsigned((wire31 ? reg24 : wire17))}) < ({wire31} ?
                      reg19 : ($signed(wire18[(2'h2):(1'h1)]) && ((wire17 & (8'ha4)) | (wire14 ?
                          reg25 : wire17)))));
  assign wire33 = $signed((wire16[(4'h8):(2'h3)] || $signed(wire15)));
  assign wire34 = ({$unsigned(({wire33, reg21} ?
                              {(8'haa), wire11} : ((8'ha2) ?
                                  wire31 : (8'hb6)))),
                          wire17[(4'hc):(4'hb)]} ?
                      {({(reg28 ? (8'ha2) : reg21), wire16} ?
                              (^~wire13[(3'h7):(1'h0)]) : $signed({wire18})),
                          (^$signed($unsigned(reg24)))} : (((|$unsigned((8'hbf))) ?
                          ({wire33} ^ $signed((7'h40))) : (~^$signed(reg20))) && wire11));
  always
    @(posedge clk) begin
      if ((wire13 ?
          ((!$unsigned(reg22)) && $unsigned({wire12[(1'h1):(1'h0)]})) : ($signed($signed((-reg22))) ?
              ((-(wire13 || (8'hab))) >> wire18[(3'h5):(3'h5)]) : (reg20 ?
                  {(~|wire29),
                      (wire17 ? reg24 : wire34)} : reg22[(3'h4):(2'h2)]))))
        begin
          reg35 <= ((~^(-wire17)) - (~|{reg27}));
          reg36 <= reg22;
          reg37 <= (({reg28[(3'h4):(3'h4)], (+$signed(wire13))} ?
                  $unsigned(($unsigned((7'h43)) ?
                      (reg23 - wire15) : (~&(8'hae)))) : $unsigned(wire34)) ?
              reg27[(3'h6):(2'h3)] : (^~reg21[(2'h2):(2'h2)]));
        end
      else
        begin
          reg35 <= wire12[(1'h0):(1'h0)];
        end
    end
endmodule
