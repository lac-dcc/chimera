module top
#(parameter param56 = ((((((8'hae) ? (8'hb1) : (8'hb9)) && ((8'hba) ? (8'h9c) : (8'hbe))) ? {{(8'hb3), (8'h9f)}} : (((8'hb9) ? (8'hbd) : (7'h44)) ? (^(8'ha4)) : (^~(8'ha4)))) ? ((((8'hb1) >> (8'hab)) ~^ (8'ha0)) >> {((8'ha4) << (8'hb6))}) : ((^~(+(8'haf))) && {((8'h9c) ? (8'hbf) : (8'hac))})) >>> (^(-(((8'haf) ? (8'hb6) : (8'hbf)) > (|(8'ha1)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire35;
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  assign y = {wire55,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire38,
                 wire37,
                 wire4,
                 wire5,
                 wire6,
                 wire35,
                 reg54,
                 reg53,
                 reg48,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire4 = $signed((({(&wire0)} ?
                     ((wire0 ? wire1 : wire3) ?
                         wire2 : (~&wire2)) : wire1) - $signed(((wire2 ?
                     wire0 : wire0) && (^~wire1)))));
  assign wire5 = (wire2 ?
                     (wire3 ?
                         (-$signed(wire3[(3'h4):(1'h0)])) : (({wire3, wire3} ?
                             {wire0} : (|wire4)) < ({wire4, wire4} ?
                             $signed(wire4) : wire0[(2'h3):(1'h1)]))) : wire1[(2'h3):(1'h0)]);
  assign wire6 = ((wire5[(2'h3):(2'h2)] * $signed((8'haf))) ~^ ($unsigned((~|$signed(wire0))) ?
                     wire1 : $unsigned(($signed((7'h41)) ?
                         $signed(wire5) : wire2))));
  module7 #() modinst36 (.wire9(wire6), .wire10(wire1), .wire8(wire3), .wire11(wire2), .clk(clk), .y(wire35), .wire12(wire0));
  assign wire37 = $unsigned(wire5[(4'he):(4'h9)]);
  assign wire38 = {({(~(wire2 <<< (8'hbb)))} * wire0[(1'h1):(1'h1)]),
                      (wire4[(1'h1):(1'h0)] ?
                          $signed(wire35[(1'h0):(1'h0)]) : wire4[(4'hf):(4'he)])};
  always
    @(posedge clk) begin
      reg39 <= (~^wire2[(3'h6):(1'h0)]);
      if ((-wire4[(4'hf):(2'h3)]))
        begin
          reg40 <= (^~$signed(wire0));
        end
      else
        begin
          reg40 <= ((wire3[(1'h0):(1'h0)] ?
                  $signed($signed(wire38[(5'h11):(3'h5)])) : wire5[(2'h2):(1'h1)]) ?
              $signed($signed(($signed((8'haf)) == $unsigned(wire1)))) : (8'ha0));
          if ((((8'hb8) & (wire35[(2'h3):(1'h0)] ^ (-(reg40 ?
                  wire6 : wire38)))) ?
              $unsigned(((&(8'hba)) ?
                  wire5[(4'h8):(2'h3)] : (^(~^(8'hae))))) : (((wire1 ?
                      ((8'hb1) & wire3) : (wire37 - (8'hb7))) >>> reg39) ?
                  ({{wire4,
                          wire38}} <<< $unsigned($unsigned(wire4))) : $unsigned(($unsigned(wire5) >= $signed(wire38))))))
            begin
              reg41 <= ((wire4 ?
                  $unsigned(reg39) : reg39[(5'h10):(4'he)]) > wire0[(2'h2):(2'h2)]);
              reg42 <= (-$signed((-reg41)));
              reg43 <= $signed(((&wire38) ?
                  (^(wire37[(2'h2):(1'h0)] ^~ (wire2 != reg39))) : reg39));
            end
          else
            begin
              reg41 <= {(8'haa), wire2};
              reg42 <= wire2;
            end
          reg44 <= ((+$signed({wire6[(1'h1):(1'h0)]})) ?
              wire1[(3'h6):(3'h6)] : wire37[(4'ha):(4'ha)]);
          reg45 <= (-(~&$unsigned((reg42 ?
              (reg39 * wire1) : (wire38 + reg39)))));
        end
      reg46 <= {($unsigned({reg45}) <= {(+$signed(reg40)), (~^wire6)})};
    end
  assign wire47 = wire0;
  always
    @(posedge clk) begin
      reg48 <= (-((+$unsigned(reg39)) > $unsigned(wire0[(4'ha):(3'h7)])));
    end
  assign wire49 = $unsigned({$signed((~|$unsigned(reg39))),
                      $signed((wire1[(4'hc):(1'h0)] <= $unsigned(wire5)))});
  assign wire50 = wire0;
  assign wire51 = $unsigned((~(reg43[(4'h8):(2'h3)] & $unsigned($signed(wire1)))));
  assign wire52 = ((~$signed($signed((^~wire50)))) ?
                      $signed(wire5) : {wire49[(2'h2):(1'h1)],
                          $signed((~(reg40 & reg45)))});
  always
    @(posedge clk) begin
      reg53 <= $unsigned($unsigned(((~wire3[(4'hc):(2'h2)]) < wire5[(4'he):(3'h5)])));
      reg54 <= $signed(((~&$unsigned(wire3[(4'h9):(3'h6)])) ?
          ($signed(wire49[(4'h9):(4'h9)]) ?
              wire52 : ((|wire49) ?
                  $unsigned((8'hbe)) : $unsigned(wire3))) : $unsigned(wire51)));
    end
  assign wire55 = $signed(reg41[(4'hd):(1'h1)]);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 reg17,
                 (1'h0)};
  assign wire13 = wire8[(4'he):(3'h5)];
  assign wire14 = {{((~|$signed(wire8)) ~^ $unsigned((~^wire8)))},
                      wire10[(3'h7):(3'h7)]};
  assign wire15 = wire10[(4'hc):(3'h4)];
  assign wire16 = wire9;
  always
    @(posedge clk) begin
      reg17 <= wire16;
      reg18 <= wire14[(3'h4):(2'h2)];
      if ($unsigned($signed((($unsigned((8'ha8)) != $signed((8'hb6))) && ((reg18 >= wire11) ^ (reg18 ?
          reg17 : wire13))))))
        begin
          if ({{(|reg17)},
              (wire12[(2'h2):(1'h1)] == ($unsigned((wire14 ?
                  (8'hbf) : wire13)) >> wire14))})
            begin
              reg19 <= (~^(wire10 ? wire11 : wire14[(3'h4):(1'h1)]));
              reg20 <= wire10[(3'h6):(2'h3)];
            end
          else
            begin
              reg19 <= $unsigned($unsigned(((wire11 <= $signed(reg20)) - {(reg20 ?
                      wire15 : wire14),
                  {(8'ha9), wire11}})));
              reg20 <= $signed(wire13);
            end
          if ((((wire12[(3'h6):(1'h0)] <<< wire8) > $unsigned(($unsigned(wire9) ?
              $signed(wire16) : (!reg20)))) || (~$unsigned($signed($signed(wire15))))))
            begin
              reg21 <= {($signed(wire14[(3'h6):(1'h1)]) ? wire15 : reg17)};
            end
          else
            begin
              reg21 <= wire9;
              reg22 <= (^~((!$signed($signed(wire11))) ^~ ({$signed(wire9),
                  (wire13 ? reg20 : reg17)} && $signed(wire12))));
              reg23 <= (&$unsigned((wire9 ~^ ($signed(wire12) ?
                  $signed(reg22) : ((8'ha1) ? wire14 : (8'hb7))))));
              reg24 <= reg22[(2'h3):(2'h3)];
              reg25 <= {((&{$signed(wire16)}) ? (7'h40) : reg20)};
            end
        end
      else
        begin
          if ((reg24[(2'h3):(2'h2)] ?
              {$unsigned(($unsigned((7'h44)) ?
                      ((8'hbc) ^~ reg17) : $unsigned((8'hb6))))} : reg20))
            begin
              reg19 <= (~|((wire8 ?
                  $signed($signed(wire15)) : (~&$unsigned(wire8))) == wire12[(2'h2):(1'h0)]));
              reg20 <= wire10[(3'h7):(3'h4)];
              reg21 <= wire16[(2'h3):(2'h3)];
            end
          else
            begin
              reg19 <= $unsigned((|reg21[(2'h2):(1'h1)]));
              reg20 <= reg19;
              reg21 <= reg18[(5'h12):(4'h9)];
              reg22 <= $signed(reg19[(4'h9):(3'h4)]);
            end
          if ((|((((wire11 ? reg24 : (8'haf)) - $signed(wire15)) ?
              ((reg20 > reg20) ?
                  reg21[(2'h2):(2'h2)] : $signed(reg25)) : (wire11 ?
                  (+wire10) : (-reg22))) & {$unsigned(reg19),
              $unsigned((~&wire8))})))
            begin
              reg23 <= (reg18[(4'hf):(4'h8)] ?
                  ($unsigned($unsigned({(8'ha6), (8'ha5)})) ?
                      ($signed($unsigned((8'hbf))) ?
                          wire9[(3'h4):(2'h3)] : ((^wire9) ~^ $unsigned(wire9))) : {$unsigned((reg24 <<< (8'h9e))),
                          {$unsigned(reg23),
                              reg19[(3'h4):(1'h0)]}}) : (-wire16[(2'h2):(1'h0)]));
              reg24 <= wire14;
              reg25 <= wire8[(4'h9):(1'h0)];
              reg26 <= (~&wire10);
              reg27 <= (+wire13[(3'h4):(2'h2)]);
            end
          else
            begin
              reg23 <= ($unsigned($signed(wire13[(1'h1):(1'h0)])) ?
                  (~reg22) : reg23[(4'hf):(3'h6)]);
              reg24 <= ($signed((~|$signed((-reg19)))) - wire12[(1'h1):(1'h1)]);
              reg25 <= $signed(({((reg25 == wire12) * (~^(7'h42))),
                  {$signed(reg19)}} - (8'ha1)));
              reg26 <= reg21;
              reg27 <= (reg24[(2'h2):(1'h1)] ?
                  wire11[(3'h6):(2'h2)] : $unsigned($unsigned(reg22[(3'h4):(2'h2)])));
            end
        end
      if (({{$unsigned($signed(wire12))}} ^ reg19))
        begin
          reg28 <= wire13[(2'h2):(1'h1)];
          reg29 <= (~&reg23);
          reg30 <= (reg20[(3'h7):(2'h2)] < $signed($signed($signed((~wire13)))));
        end
      else
        begin
          reg28 <= $signed(($signed(($unsigned((8'ha3)) >> (!reg25))) > reg22));
        end
      reg31 <= {reg30[(4'hf):(3'h7)],
          {((8'hb8) ?
                  ((|(8'ha9)) ?
                      reg19[(4'ha):(3'h7)] : reg27) : $unsigned((-reg20))),
              ($unsigned(reg27[(4'hc):(1'h1)]) > $signed($signed(reg21)))}};
    end
  assign wire32 = (-$signed($signed((wire15[(2'h2):(1'h1)] ?
                      $unsigned(reg19) : reg25))));
  assign wire33 = reg29[(3'h4):(2'h2)];
  assign wire34 = (7'h40);
endmodule
