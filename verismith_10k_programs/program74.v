module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire14,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg15,
                 reg13,
                 reg12,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {{$signed($unsigned((wire2 << wire3))),
              $unsigned({wire3[(4'hc):(3'h7)]})},
          $unsigned((~|(wire1[(1'h0):(1'h0)] ~^ (wire3 <<< wire1))))};
    end
  assign wire5 = ((~&wire2) || $unsigned($unsigned(wire2[(4'hc):(3'h5)])));
  assign wire6 = wire2[(3'h4):(2'h2)];
  assign wire7 = $unsigned(((wire5[(1'h1):(1'h1)] <<< ((wire5 < wire6) | ((8'hab) ^~ wire5))) ?
                     (((wire5 ? wire2 : wire2) ?
                         wire1 : (8'hba)) <= ((reg4 != wire3) ^ $unsigned(wire1))) : $unsigned(((^~wire1) ?
                         $unsigned(wire3) : {wire2}))));
  assign wire8 = $signed((wire6[(4'h8):(3'h4)] ?
                     (wire6[(1'h0):(1'h0)] ?
                         (wire2 <<< (-wire7)) : $unsigned(wire0)) : reg4));
  assign wire9 = (wire8[(3'h4):(2'h3)] ?
                     wire7 : $unsigned(wire1[(1'h0):(1'h0)]));
  assign wire10 = {((~^wire0[(1'h0):(1'h0)]) ?
                          reg4 : ({$signed(wire1)} >>> $signed((~|wire9))))};
  assign wire11 = wire3;
  always
    @(posedge clk) begin
      reg12 <= {$unsigned((~^reg4)),
          $signed({$signed($unsigned(wire9)), (wire8 ? wire3 : (!(7'h44)))})};
      reg13 <= (!wire5[(2'h2):(1'h0)]);
    end
  assign wire14 = wire3;
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg15 <= ((reg12[(4'hc):(1'h0)] ?
                  (|((wire1 <= wire2) ?
                      ((7'h42) >> wire3) : {wire10})) : (~|reg4[(4'ha):(3'h7)])) ?
              (wire11[(4'hf):(3'h7)] ?
                  $unsigned(((wire5 ?
                      wire1 : wire2) >= (|wire7))) : ($unsigned((wire7 || wire10)) != (~^reg12))) : reg12[(2'h3):(2'h3)]);
          reg16 <= wire0[(1'h0):(1'h0)];
          reg17 <= (~&wire2[(5'h14):(5'h12)]);
          if (reg4)
            begin
              reg18 <= wire9[(4'h9):(4'h8)];
            end
          else
            begin
              reg18 <= $signed($signed(wire8[(1'h1):(1'h0)]));
              reg19 <= $unsigned($signed((^$signed($unsigned(wire9)))));
              reg20 <= (^reg4);
              reg21 <= $unsigned(((^~$signed(reg13)) < wire8[(3'h7):(3'h4)]));
              reg22 <= reg12[(4'h8):(3'h5)];
            end
          reg23 <= ({$signed($unsigned((wire3 == wire7))),
              ($signed((-reg22)) ?
                  $unsigned((^wire10)) : (^{(8'hbc),
                      wire14}))} << (($unsigned(wire0) << {$unsigned(reg13),
              {reg16}}) ^~ $signed((~^reg22))));
        end
      else
        begin
          reg15 <= {reg13, $signed((&$signed((reg19 ? reg22 : reg22))))};
          if ($signed((|$unsigned($signed(reg18)))))
            begin
              reg16 <= (($signed({(~&reg23), $signed(wire1)}) ?
                  $unsigned($unsigned((reg21 ?
                      wire7 : wire10))) : $signed(((wire0 >>> wire0) ?
                      reg12 : (wire11 ?
                          reg4 : wire6)))) | reg18[(2'h3):(1'h0)]);
            end
          else
            begin
              reg16 <= $signed(((|($signed(reg22) + (reg21 != reg21))) && {{$signed(reg12)}}));
              reg17 <= ($signed(wire14[(4'he):(3'h7)]) - wire14);
            end
          reg18 <= ((((reg21[(4'hc):(3'h7)] ? (~^reg20) : $unsigned(wire2)) ?
              $signed(((8'hb3) ?
                  reg19 : wire0)) : (|$signed(wire7))) + (^~({(8'hb9)} || wire8))) == reg12);
        end
      reg24 <= $signed(wire5);
      reg25 <= $unsigned({(7'h41)});
      reg26 <= wire0[(1'h0):(1'h0)];
      reg27 <= $signed(((($unsigned((8'hae)) <<< (~reg25)) ?
              $signed(reg16[(1'h1):(1'h1)]) : wire11[(3'h5):(3'h5)]) ?
          {{(wire2 ? wire2 : (7'h43)), wire3[(4'hd):(1'h0)]},
              reg25[(2'h2):(1'h1)]} : ($signed((wire10 ?
              wire3 : (8'hb7))) <<< reg18)));
    end
endmodule
