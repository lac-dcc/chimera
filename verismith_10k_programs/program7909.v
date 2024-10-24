module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire53, wire9, wire6, wire5, reg8, reg7, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(4'hb):(3'h6)];
    end
  assign wire5 = (8'ha1);
  assign wire6 = {wire3};
  always
    @(posedge clk) begin
      reg7 <= ($unsigned($unsigned(((wire3 || wire2) ?
              wire2[(5'h10):(4'ha)] : (-wire3)))) ?
          $signed(wire5[(1'h0):(1'h0)]) : (~^((~reg4[(3'h4):(3'h4)]) ?
              wire5 : {wire6[(1'h0):(1'h0)]})));
    end
  always
    @(posedge clk) begin
      reg8 <= ((^~wire2) ?
          (^$unsigned((wire5[(1'h1):(1'h1)] ~^ (reg7 ?
              wire0 : wire6)))) : (&wire2));
    end
  assign wire9 = $signed((!($unsigned({wire3, wire1}) << {(^~(8'hb1))})));
  module10 #() modinst54 (.wire11(reg4), .wire13(reg8), .clk(clk), .y(wire53), .wire14(wire5), .wire12(wire0));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire49,
                 wire36,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
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
                 (1'h0)};
  assign wire15 = ((8'ha3) ~^ $unsigned(wire14[(3'h4):(3'h4)]));
  assign wire16 = $unsigned((~&($signed($signed(wire13)) >= $unsigned(((8'h9e) || wire15)))));
  assign wire17 = ($unsigned(wire15) > $unsigned($signed(((wire11 ^~ (8'had)) + wire12))));
  assign wire18 = wire14;
  assign wire19 = (wire17 ? $signed((8'hb2)) : $signed((8'hb0)));
  assign wire20 = (~&{wire19[(4'h8):(3'h6)],
                      (wire17 ?
                          $unsigned((-wire16)) : {(wire11 ?
                                  wire15 : wire19)})});
  always
    @(posedge clk) begin
      reg21 <= $unsigned({(($signed(wire20) ?
              (~^wire12) : (wire19 ? wire14 : wire16)) * wire16)});
      if (wire20[(3'h4):(3'h4)])
        begin
          reg22 <= $unsigned(wire17[(4'h8):(3'h5)]);
          reg23 <= {wire14};
          if (reg22[(3'h6):(3'h4)])
            begin
              reg24 <= ((((|wire15[(3'h6):(3'h5)]) ?
                      ($unsigned(wire20) ~^ wire18[(3'h4):(2'h2)]) : reg23) ?
                  ((8'ha9) ?
                      wire15 : (^{wire14,
                          wire12})) : $unsigned($unsigned(wire15))) >> ({(8'hb9),
                  (^(wire17 ? wire15 : wire20))} > wire11[(4'ha):(3'h5)]));
              reg25 <= $unsigned($signed($unsigned(reg23)));
              reg26 <= wire19;
              reg27 <= $signed((~&{($signed(reg26) ?
                      $signed(reg26) : (wire18 ? reg25 : wire20)),
                  $unsigned(reg26)}));
              reg28 <= $unsigned((wire13 ? $unsigned(reg26) : wire15));
            end
          else
            begin
              reg24 <= $signed(wire13[(2'h2):(1'h0)]);
              reg25 <= ((&(wire19[(4'h8):(3'h7)] ?
                  $unsigned((wire16 | reg25)) : $signed($signed((8'hb6))))) | {$signed($unsigned((reg26 ?
                      wire14 : wire13)))});
              reg26 <= (&wire14[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg22 <= (8'hb2);
        end
      reg29 <= $unsigned((8'haf));
      if (($signed(({(wire17 ^ reg21), $unsigned(reg26)} + $unsigned(wire15))) ?
          wire15 : $unsigned((((wire17 ? reg28 : reg22) ?
                  (reg21 >>> wire17) : reg21[(1'h1):(1'h1)]) ?
              wire15 : {(wire16 <= wire14)}))))
        begin
          if (wire16[(1'h0):(1'h0)])
            begin
              reg30 <= $signed(((8'had) ?
                  $signed(($signed(reg25) ~^ wire17[(4'he):(4'hb)])) : (+wire11[(3'h5):(1'h0)])));
              reg31 <= $unsigned((^~(reg26 ? wire11 : reg26)));
              reg32 <= $signed((^(!wire12[(2'h3):(1'h1)])));
              reg33 <= reg23[(2'h2):(2'h2)];
            end
          else
            begin
              reg30 <= $signed(reg31[(1'h1):(1'h0)]);
              reg31 <= ((~|reg24[(3'h7):(1'h0)]) >= {wire19[(3'h7):(3'h7)],
                  $unsigned((wire16 ?
                      wire12[(3'h7):(3'h7)] : reg24[(4'hb):(4'h8)]))});
              reg32 <= $signed($signed(wire20));
              reg33 <= (|(((-(reg23 ?
                  wire11 : reg33)) == (~(reg26 | wire12))) ^ $unsigned($signed((|wire19)))));
            end
        end
      else
        begin
          reg30 <= (($signed((^~$signed(reg33))) ?
              $signed((((8'ha6) ?
                  reg27 : wire11) != wire18)) : ($unsigned(reg33) - reg29[(1'h0):(1'h0)])) >>> (~^$signed(((wire19 ?
                  wire12 : reg26) ?
              (reg29 == (8'hb7)) : reg22[(1'h0):(1'h0)]))));
          reg31 <= reg33;
          if ((|(wire13[(3'h5):(3'h4)] ?
              (((wire11 && reg29) ?
                  $unsigned((8'ha1)) : $unsigned(reg23)) ~^ (^$unsigned(reg30))) : ($unsigned(reg29[(4'hd):(4'h9)]) ?
                  ((~wire16) ?
                      {reg22, reg30} : (reg22 ?
                          reg26 : (8'h9d))) : (&$unsigned(reg31))))))
            begin
              reg32 <= reg27[(2'h2):(1'h0)];
            end
          else
            begin
              reg32 <= (~|$unsigned(reg32));
              reg33 <= ($signed(reg24) ?
                  $unsigned((~&reg27[(2'h3):(2'h3)])) : $unsigned((+$signed(reg25[(1'h1):(1'h0)]))));
              reg34 <= $signed(reg25);
              reg35 <= reg21;
            end
        end
    end
  assign wire36 = (wire20[(3'h6):(3'h4)] ?
                      ((|($signed(wire19) & (8'h9f))) > reg35[(1'h1):(1'h1)]) : (!wire12));
  always
    @(posedge clk) begin
      reg37 <= (wire16[(1'h1):(1'h0)] == $signed((~&$signed($signed(reg29)))));
      reg38 <= (|(^~(^~$signed(reg29))));
      reg39 <= $unsigned($signed(({(-reg26), (reg29 >> wire20)} ?
          (wire19[(3'h5):(2'h2)] != $unsigned(wire36)) : (wire14[(3'h4):(1'h1)] ^ $signed(wire18)))));
      if ($signed(reg39[(4'h9):(3'h6)]))
        begin
          reg40 <= wire14;
          if (reg32)
            begin
              reg41 <= $unsigned($signed($signed((reg31 + reg38[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg41 <= (~|$unsigned((reg39 ~^ wire16[(3'h4):(1'h0)])));
              reg42 <= (!$unsigned(wire19));
              reg43 <= $signed(reg24[(2'h2):(2'h2)]);
              reg44 <= (((({reg35, reg31} ?
                          reg33 : {reg30}) < $signed($unsigned(reg35))) ?
                      $signed((wire36[(3'h6):(1'h1)] - reg30[(4'he):(3'h4)])) : (8'hac)) ?
                  {$unsigned((~(reg39 ? reg23 : reg23)))} : reg24);
              reg45 <= (7'h41);
            end
          reg46 <= ({(~$signed((reg35 << reg23)))} ?
              wire15[(2'h2):(1'h1)] : ((reg41 ~^ reg26[(4'hf):(1'h0)]) ?
                  (~|$signed((~|reg25))) : reg41[(3'h4):(1'h0)]));
          reg47 <= $unsigned(wire20[(3'h5):(1'h1)]);
        end
      else
        begin
          reg40 <= {reg23};
          reg41 <= (wire18 ?
              {(&$signed($unsigned(reg37))),
                  reg25[(2'h2):(1'h0)]} : ($unsigned(reg46) ?
                  (!reg45[(2'h3):(2'h2)]) : {reg30}));
          reg42 <= ($unsigned($unsigned(((&wire16) ?
              $unsigned(reg44) : (reg31 || reg46)))) >> reg28[(2'h3):(2'h2)]);
          reg43 <= $signed(reg35[(4'h8):(1'h1)]);
        end
      reg48 <= reg23;
    end
  assign wire49 = wire13;
  always
    @(posedge clk) begin
      reg50 <= (~$unsigned(((reg45 && (~wire18)) ~^ {reg33[(5'h10):(3'h7)]})));
      reg51 <= ((reg33[(5'h12):(4'he)] ?
          (~|reg37) : (wire17[(4'hb):(4'h9)] ?
              wire49[(3'h5):(3'h5)] : {(reg34 ? wire13 : wire11),
                  reg22})) != $signed({$unsigned({reg47})}));
      reg52 <= $signed((-wire16));
    end
endmodule
