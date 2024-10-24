module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed(($signed($signed(wire1)) ?
                     wire2 : (wire2[(2'h2):(1'h1)] ?
                         wire4[(4'ha):(4'h9)] : $unsigned({wire4}))));
  assign wire6 = (wire0[(5'h12):(3'h6)] ?
                     $signed(wire3[(4'h8):(3'h5)]) : wire1[(5'h14):(5'h12)]);
  assign wire7 = (^~$signed($signed(wire0[(1'h0):(1'h0)])));
  assign wire8 = $signed($unsigned(wire2));
  assign wire9 = wire8[(3'h7):(1'h0)];
  assign wire10 = $signed($signed(wire0[(4'ha):(3'h6)]));
  assign wire11 = {(wire6[(2'h3):(2'h3)] ^~ (((wire2 << wire7) ?
                          (^~wire0) : (~^(8'hb8))) ^ (wire2[(4'h9):(3'h7)] ?
                          wire10[(2'h3):(1'h0)] : (wire1 ^ wire6)))),
                      (wire5[(1'h1):(1'h1)] != $signed((wire1 ?
                          ((8'hb7) ^~ wire0) : (wire10 ? (8'ha4) : wire1))))};
  assign wire12 = (-((^(wire6 ? (wire4 | wire9) : {wire7})) ?
                      wire0 : wire9[(2'h2):(1'h0)]));
  assign wire13 = wire6[(3'h5):(1'h1)];
  assign wire14 = {((+((wire13 << wire8) ?
                              (wire7 ? wire6 : (8'h9c)) : (^~wire1))) ?
                          (-(8'hb3)) : wire11),
                      wire13[(3'h5):(2'h2)]};
  assign wire15 = (((^~wire11) ?
                      wire7 : (((+wire0) ?
                              (wire9 ? wire12 : wire14) : $unsigned(wire4)) ?
                          $signed($signed(wire10)) : wire0)) || {$signed((^~wire2[(1'h0):(1'h0)])),
                      (^~$signed((7'h40)))});
  assign wire16 = $unsigned($signed((~|(&(~wire14)))));
  assign wire17 = (+{$unsigned(((wire2 ^~ wire9) ?
                          wire12[(3'h4):(1'h0)] : wire0)),
                      (~(!(wire10 ? wire3 : wire16)))});
  always
    @(posedge clk) begin
      if ((~^(((+wire8) ?
          {(wire7 && wire12),
              (wire12 ? wire10 : wire14)} : (wire7[(3'h5):(1'h0)] ?
              (~&(8'ha6)) : (~|wire12))) - {(wire9 >> wire11[(1'h0):(1'h0)])})))
        begin
          reg18 <= $signed(($unsigned(wire14[(4'ha):(1'h1)]) > (((+wire16) ^~ wire2) ?
              $signed((wire3 | (8'hb2))) : (~^wire4))));
          if (($unsigned({(((8'ha0) ? wire7 : wire16) ?
                      $signed(wire12) : wire14[(4'ha):(3'h7)]),
                  (~^{(8'h9f), wire16})}) ?
              wire12[(1'h1):(1'h1)] : (wire6 ?
                  (&((wire12 <= wire14) ?
                      {(8'ha2),
                          wire0} : (wire15 ^ wire13))) : {$signed(wire9)})))
            begin
              reg19 <= $signed(wire3[(4'h8):(1'h1)]);
              reg20 <= (8'hb0);
              reg21 <= wire15;
              reg22 <= (($signed(wire14[(4'ha):(2'h3)]) ?
                      reg19 : $unsigned($signed(((8'hae) ^ (8'h9c))))) ?
                  $signed(reg21) : $signed(((-wire14) ~^ (&(wire8 ?
                      (8'ha7) : wire15)))));
            end
          else
            begin
              reg19 <= (7'h44);
              reg20 <= $unsigned(wire13[(2'h2):(1'h1)]);
              reg21 <= (wire4 ? wire10 : wire7);
            end
          reg23 <= (((wire11[(1'h0):(1'h0)] ?
                  $unsigned(reg21) : wire15) * $signed((8'h9e))) ?
              reg20 : ({$signed(reg22)} ?
                  $unsigned(wire3[(3'h4):(1'h1)]) : $unsigned(wire12)));
          reg24 <= wire16;
        end
      else
        begin
          if (reg23)
            begin
              reg18 <= wire8;
              reg19 <= ($unsigned(reg24[(3'h4):(2'h3)]) - reg24);
              reg20 <= wire14;
              reg21 <= $unsigned(({$unsigned((wire2 ?
                      wire5 : wire15))} >> {$signed(wire15[(4'hd):(4'ha)])}));
              reg22 <= ((wire13 ?
                  $unsigned(((+(8'ha9)) || (8'hb8))) : (~^(~^$signed(wire1)))) ^~ $unsigned($signed((reg24 | (+wire8)))));
            end
          else
            begin
              reg18 <= wire1;
              reg19 <= (8'hb8);
            end
          if ($signed((~wire13[(2'h3):(2'h2)])))
            begin
              reg23 <= ((wire6[(2'h3):(1'h0)] ?
                      ((wire0 ^ (^(8'ha0))) < wire11) : ((reg19 ?
                          wire15[(4'hb):(1'h1)] : reg22) | (wire17 >>> (~wire4)))) ?
                  wire14[(3'h6):(3'h5)] : $unsigned(reg20[(2'h2):(1'h0)]));
            end
          else
            begin
              reg23 <= (+$signed((8'hbc)));
              reg24 <= (~&$signed((({reg22} ?
                  $signed(wire15) : $signed(reg18)) | $signed((reg23 <<< reg23)))));
            end
          if ((!$unsigned(wire1)))
            begin
              reg25 <= wire8;
              reg26 <= (~|wire13[(3'h5):(3'h4)]);
              reg27 <= wire5;
              reg28 <= $signed(wire17[(2'h3):(1'h1)]);
              reg29 <= (^~$signed($signed($signed($signed(wire1)))));
            end
          else
            begin
              reg25 <= wire17[(4'h9):(4'h9)];
              reg26 <= ((-$signed(({reg20} & $unsigned(wire8)))) < (~{((^~wire13) != $unsigned(reg28)),
                  reg29[(3'h5):(2'h2)]}));
            end
          if ($signed($signed(wire8[(2'h3):(2'h2)])))
            begin
              reg30 <= $signed(((~&reg24) < $signed((wire4 ?
                  (reg26 ? reg20 : reg28) : {wire4, reg18}))));
              reg31 <= reg25;
            end
          else
            begin
              reg30 <= reg27;
              reg31 <= ((~&(|$signed($signed(reg30)))) >>> $unsigned(reg23[(1'h1):(1'h1)]));
              reg32 <= (^(wire4[(1'h1):(1'h0)] ^ ((^~$signed(reg18)) ?
                  (reg25 ?
                      (!wire15) : wire17[(4'hd):(2'h3)]) : ($signed((8'h9c)) * $unsigned(reg28)))));
              reg33 <= reg27[(3'h5):(3'h4)];
              reg34 <= (~&(reg22[(4'h8):(3'h6)] ?
                  ((^(wire5 ? (8'hb6) : reg19)) ?
                      (^~wire7) : wire6[(3'h7):(2'h3)]) : reg20));
            end
          reg35 <= $signed(wire10[(1'h1):(1'h0)]);
        end
    end
endmodule
