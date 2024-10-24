module top
#(parameter param54 = (^~{((!{(7'h40), (7'h44)}) ? (((8'haa) && (8'hbd)) ? {(8'hb2)} : {(8'hbc)}) : (~|(~^(8'ha5)))), ({((8'had) << (8'hb1)), ((8'haa) >>> (8'hac))} ? (((7'h41) >>> (8'hb0)) & ((8'h9c) ? (8'hb2) : (7'h40))) : ((~^(8'hb8)) - ((8'ha2) ? (7'h40) : (8'hb9))))}), 
parameter param55 = param54)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire29;
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire5,
                 wire6,
                 wire29,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire5 = ($unsigned(($unsigned(wire2) > (&(!wire4)))) != (~|$signed((~(wire2 ^~ (8'hb9))))));
  assign wire6 = $unsigned($unsigned(wire4[(3'h5):(2'h2)]));
  module7 #() modinst30 (.wire9(wire5), .wire11(wire6), .wire10(wire0), .y(wire29), .wire12(wire1), .clk(clk), .wire8(wire3));
  assign wire31 = $signed((wire3 - $signed($signed((wire1 & wire3)))));
  assign wire32 = ((!({(wire6 ? wire31 : (8'hb9)),
                          ((8'hbe) | wire1)} == wire29)) ?
                      $unsigned(((~|wire31) != $signed($unsigned((8'ha8))))) : ($signed(($unsigned(wire4) ?
                              (wire0 - wire6) : $unsigned((7'h40)))) ?
                          (wire1 ?
                              $signed(wire2[(2'h2):(1'h1)]) : $signed($signed((8'ha1)))) : (($signed((8'ha0)) ^ (wire1 ?
                              (8'h9c) : wire3)) != {$unsigned((7'h41)),
                              ((8'ha3) + wire3)})));
  assign wire33 = $unsigned(wire2[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg34 <= (8'hbf);
      reg35 <= $signed((~^(wire6 ?
          $signed({wire5, wire2}) : {wire5[(4'h8):(3'h4)]})));
    end
  assign wire36 = ($signed({$unsigned($unsigned(wire6)),
                      wire32}) != $signed((&(8'hb4))));
  assign wire37 = (wire3[(2'h3):(1'h0)] >>> ($signed((wire32[(1'h1):(1'h0)] ?
                          $unsigned((8'ha7)) : wire31)) ?
                      $unsigned(wire32[(1'h1):(1'h1)]) : $signed(wire1[(4'h9):(2'h3)])));
  assign wire38 = wire3[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg39 <= {wire4};
      reg40 <= $signed($unsigned((((wire36 ?
              wire5 : wire1) ~^ $unsigned((8'hbb))) ?
          ($signed(wire36) >= wire0) : wire32)));
      if ($signed((!$unsigned(($unsigned(reg35) >>> (~^wire37))))))
        begin
          reg41 <= (-(!($unsigned(reg35[(3'h6):(2'h3)]) ?
              ((~&(8'hab)) ? {wire5} : (+wire29)) : (~|(~^wire33)))));
        end
      else
        begin
          if ($signed((wire0[(3'h6):(1'h0)] < $unsigned($unsigned({wire32})))))
            begin
              reg41 <= reg41;
            end
          else
            begin
              reg41 <= $signed(wire32);
              reg42 <= {$unsigned(($unsigned((wire31 ? (8'h9f) : wire33)) ?
                      (+(8'hb8)) : wire33[(2'h3):(1'h0)]))};
            end
          reg43 <= (~|wire0);
          reg44 <= (8'hbd);
          reg45 <= wire5[(4'hd):(3'h5)];
          reg46 <= reg41[(2'h3):(2'h3)];
        end
      reg47 <= (~^({$unsigned($unsigned((8'hb9))),
          (~&((8'hb5) | (8'hb4)))} >= $signed((+(-(8'ha1))))));
      if ({((wire31 ? (|(~reg47)) : $signed($signed(wire38))) ?
              wire3 : (^~(~|(8'hbe))))})
        begin
          reg48 <= $signed(((wire4 <<< wire6) << wire3));
          reg49 <= (8'hb7);
          reg50 <= ($unsigned($signed($unsigned(reg46))) ?
              (reg44 ?
                  (+$unsigned((-reg41))) : reg42[(4'he):(3'h4)]) : wire5[(5'h10):(4'h9)]);
          reg51 <= $signed(($unsigned(($unsigned(wire36) >> (&wire0))) ?
              $unsigned($unsigned((reg48 ?
                  wire4 : reg47))) : {$signed((wire5 && reg39)),
                  (|$unsigned(wire0))}));
        end
      else
        begin
          if ($signed($unsigned((^~({reg46} * wire36)))))
            begin
              reg48 <= ($signed($signed({{wire0}})) ^~ (wire36[(1'h0):(1'h0)] ?
                  $signed(($unsigned(reg34) < $signed(reg46))) : {(-(8'haf))}));
            end
          else
            begin
              reg48 <= $unsigned($unsigned($signed($signed({(7'h43), wire2}))));
              reg49 <= (reg39 >= (~&{(wire31[(2'h2):(1'h0)] ^~ wire38[(1'h1):(1'h0)])}));
            end
          reg50 <= ((((wire38 | $signed((8'hae))) ? (8'hb0) : (8'ha7)) ?
                  (8'h9d) : (+(wire1[(4'hc):(4'hc)] > $signed(wire0)))) ?
              (^~(((^reg44) ?
                  (wire32 ~^ wire3) : ((8'hae) ?
                      reg45 : reg49)) == (&wire3[(3'h6):(1'h1)]))) : (reg40 ?
                  $unsigned((8'ha4)) : $signed(reg49[(3'h4):(2'h2)])));
          reg51 <= (&wire29);
          reg52 <= (($unsigned((!((8'h9f) != reg34))) > reg43[(3'h5):(2'h3)]) <= (reg44 - {(^(wire6 ~^ wire32))}));
          reg53 <= reg41;
        end
    end
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire13 = (+$unsigned({(wire10[(2'h3):(2'h3)] < (wire11 >> wire10)),
                      (+wire12[(3'h7):(3'h5)])}));
  assign wire14 = (wire9 >>> $unsigned(wire8[(3'h6):(3'h4)]));
  assign wire15 = $unsigned(($unsigned(($signed(wire13) ?
                          $unsigned(wire8) : wire8[(3'h5):(1'h0)])) ?
                      (-(+$unsigned(wire12))) : wire11[(1'h1):(1'h1)]));
  assign wire16 = (~|wire10);
  assign wire17 = ({$unsigned($unsigned($unsigned(wire10)))} + ($unsigned(((wire16 ?
                          wire9 : wire10) ?
                      wire8[(3'h4):(3'h4)] : wire13)) || $signed($unsigned(wire8[(3'h4):(1'h1)]))));
  assign wire18 = ($signed($signed(wire14)) ?
                      (($unsigned(wire11[(1'h0):(1'h0)]) >> $signed(wire8[(3'h6):(3'h5)])) != ((~&(wire12 && wire8)) ?
                          (!(wire15 ? (8'hb6) : wire15)) : ({wire9,
                              wire16} & wire13[(3'h5):(2'h2)]))) : (^~(($unsigned(wire10) + $signed(wire16)) ?
                          ($unsigned(wire14) >= wire8[(3'h5):(1'h1)]) : wire11[(2'h3):(1'h0)])));
  assign wire19 = ({{($signed((8'ha4)) <<< (!(8'ha9)))}} ^ $unsigned($signed((^wire11[(4'h9):(4'h8)]))));
  assign wire20 = wire12[(1'h0):(1'h0)];
  assign wire21 = (~^wire8[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg22 <= ({(((wire14 ? wire8 : wire16) ?
                  (wire10 * (8'ha1)) : wire17[(2'h2):(1'h0)]) ?
              ((wire9 ^~ wire20) == (wire13 || (7'h41))) : $signed(wire9))} && $signed(wire13[(3'h6):(2'h3)]));
      reg23 <= wire11[(1'h1):(1'h0)];
      if ((($signed(wire9[(4'ha):(1'h0)]) ?
          $signed(reg23[(2'h3):(1'h1)]) : $signed(({wire21, wire21} ?
              $signed(wire18) : wire13[(1'h1):(1'h0)]))) != ($unsigned((~|reg22)) ?
          ($unsigned($signed(wire10)) ^~ wire11) : $signed($signed((~^wire14))))))
        begin
          reg24 <= ($unsigned(reg22[(2'h2):(2'h2)]) + (((^$unsigned((7'h44))) >>> {$unsigned(wire18)}) != {(((8'ha3) ?
                  wire11 : wire19) >> $unsigned(wire17)),
              (wire19 ? wire16[(3'h6):(1'h1)] : $signed(wire19))}));
          reg25 <= (~^wire10);
          reg26 <= (8'hb9);
          reg27 <= wire17;
        end
      else
        begin
          reg24 <= wire12;
          reg25 <= reg24;
        end
    end
  assign wire28 = wire9[(1'h1):(1'h0)];
endmodule
