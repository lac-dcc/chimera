module top
#(parameter param52 = (((&(((8'hac) ? (8'ha7) : (8'h9c)) ? ((8'ha1) ? (8'ha4) : (8'ha3)) : (-(8'hba)))) || ((8'ha8) ? (((8'hb9) <= (8'hb1)) >> ((7'h43) ? (8'ha0) : (8'hb5))) : (~&(~&(8'ha6))))) ? (~^(+(8'hac))) : (((-{(8'h9f), (8'hb3)}) ~^ ((~&(8'hb4)) ^~ (^(8'h9e)))) ? (-((~&(8'h9f)) == ((8'hb3) ? (7'h42) : (8'hb1)))) : ({(7'h42), {(8'hbe)}} <<< (8'ha4)))), 
parameter param53 = param52)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire21,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 (1'h0)};
  assign wire5 = (~({(wire0 << wire4[(4'ha):(1'h0)])} + ({wire4} < (~^$signed(wire4)))));
  assign wire6 = {(-$unsigned($signed($signed(wire1)))),
                     $signed(wire3[(4'ha):(4'ha)])};
  assign wire7 = $unsigned((|({$signed(wire4), (~wire4)} > wire6)));
  module8 #() modinst20 (wire19, clk, wire2, wire6, wire4, wire3);
  assign wire21 = $signed($signed(wire4));
  always
    @(posedge clk) begin
      if ($signed(((+wire2[(2'h2):(1'h0)]) ? wire7 : wire6[(1'h1):(1'h1)])))
        begin
          reg22 <= $signed(({wire19,
                  ((wire1 == (8'h9d)) ? {(8'haf), wire3} : {(7'h43)})} ?
              $signed(((wire2 ?
                  wire0 : wire6) & wire6[(4'h8):(2'h3)])) : wire21[(3'h7):(2'h3)]));
          reg23 <= ((8'h9e) ?
              ((~&wire4) ? wire5 : wire7[(5'h13):(4'hc)]) : (wire6 <<< (({wire3,
                  wire1} >>> wire5[(5'h10):(1'h0)]) << wire2[(4'ha):(3'h5)])));
          reg24 <= $signed(wire2);
          if (($unsigned($signed(wire5)) ?
              $unsigned((8'hb2)) : wire6[(3'h6):(2'h2)]))
            begin
              reg25 <= $unsigned($unsigned($unsigned(wire5)));
            end
          else
            begin
              reg25 <= ($unsigned($unsigned(wire2[(4'ha):(1'h1)])) ?
                  (wire0 + ($signed((~wire2)) ^ $unsigned((~wire7)))) : (($signed(wire1[(3'h5):(2'h2)]) && ((~^wire21) ?
                          wire19 : $signed(reg24))) ?
                      wire19[(4'hc):(1'h1)] : ($unsigned(reg22[(4'h9):(3'h5)]) ?
                          $unsigned(reg24) : $unsigned((wire1 ?
                              wire0 : (8'hbf))))));
              reg26 <= $unsigned($unsigned((reg22[(1'h0):(1'h0)] ^ wire1)));
              reg27 <= $signed({wire2,
                  ((((8'h9d) >> wire3) ? $unsigned((8'hae)) : {wire1}) ?
                      $unsigned((reg23 * wire4)) : (^wire2))});
              reg28 <= reg25[(4'hd):(4'hc)];
            end
          reg29 <= $signed(wire6);
        end
      else
        begin
          reg22 <= $unsigned(($unsigned(((~^wire3) ?
              (reg26 ?
                  (8'h9c) : (7'h44)) : reg28)) || $signed($signed({reg22}))));
          reg23 <= ({(8'hab),
                  (((reg24 >>> reg23) ?
                          $signed((8'h9f)) : wire7[(1'h1):(1'h0)]) ?
                      reg27 : $signed(wire5[(4'he):(4'he)]))} ?
              $signed($signed($unsigned((^reg24)))) : wire0[(4'h9):(2'h3)]);
          reg24 <= ($signed(reg23) | $unsigned($signed($unsigned($unsigned(reg24)))));
          reg25 <= $signed(($signed($unsigned(wire19)) ^ $unsigned((wire19[(3'h6):(2'h2)] ?
              reg26 : $unsigned((8'hab))))));
        end
      reg30 <= reg28;
      reg31 <= $signed((7'h43));
    end
  assign wire32 = $signed(wire2);
  assign wire33 = (~^$signed(($signed(reg25[(1'h1):(1'h1)]) ^~ {$signed((8'hb6))})));
  assign wire34 = wire3;
  assign wire35 = {($signed(wire19[(4'h8):(1'h0)]) ~^ (8'ha2)),
                      (!$unsigned(reg26))};
  assign wire36 = $signed((^~wire21));
  assign wire37 = reg29;
  assign wire38 = $unsigned((~wire32));
  assign wire39 = $signed(wire0);
  always
    @(posedge clk) begin
      if (((^({wire6} ?
              ($unsigned(reg27) >>> (reg26 ? wire21 : wire7)) : {(~^wire7)})) ?
          (reg22[(1'h0):(1'h0)] ?
              $unsigned(reg29) : $signed(wire3)) : (($signed(wire21) ?
              wire0 : wire38[(4'hb):(3'h6)]) || $unsigned(reg26))))
        begin
          if (reg28)
            begin
              reg40 <= $unsigned(wire32[(3'h4):(1'h0)]);
              reg41 <= $signed(({(^~wire1[(2'h3):(1'h0)])} ~^ $unsigned((-$unsigned(wire6)))));
            end
          else
            begin
              reg40 <= ((~$unsigned($signed($signed(wire38)))) << (^$unsigned($unsigned((wire39 ?
                  reg40 : reg27)))));
              reg41 <= (-reg26[(4'h9):(1'h1)]);
            end
          reg42 <= wire21;
          reg43 <= ((($unsigned($unsigned(reg22)) ?
                  reg41[(1'h0):(1'h0)] : (^$unsigned(wire19))) ?
              ($unsigned((8'ha1)) | reg25) : ({reg42, reg27[(4'hb):(2'h3)]} ?
                  $unsigned(((8'hb0) ?
                      wire0 : (8'ha8))) : (8'hbf))) ~^ $unsigned(wire37[(3'h7):(2'h3)]));
          reg44 <= ($unsigned($signed(({reg31} - (wire32 << wire36)))) ?
              reg31[(3'h6):(1'h1)] : (~$unsigned(((-(8'hb1)) ?
                  $unsigned(wire21) : (reg42 | wire7)))));
        end
      else
        begin
          reg40 <= $signed(((^$unsigned(reg28)) ?
              $unsigned($unsigned(reg41[(2'h2):(1'h1)])) : reg24));
          reg41 <= ($unsigned(((~^wire37) ?
              (wire2[(4'hd):(2'h3)] != (wire37 || reg41)) : wire35[(1'h0):(1'h0)])) || wire5[(1'h0):(1'h0)]);
          reg42 <= (reg22[(1'h0):(1'h0)] != wire4);
          if ($signed($unsigned((8'hae))))
            begin
              reg43 <= (!$signed(wire2[(3'h7):(3'h7)]));
              reg44 <= (-wire0);
            end
          else
            begin
              reg43 <= $unsigned(wire35);
              reg44 <= ((((&(+reg23)) ?
                      ((&wire32) ? (~wire7) : reg27) : $signed((~&wire39))) ?
                  $unsigned((reg24[(4'hc):(3'h4)] + $signed(wire0))) : $signed($unsigned(reg27[(3'h6):(3'h6)]))) >> $signed(((^$unsigned(reg29)) ?
                  $unsigned((!reg27)) : $signed(reg25))));
              reg45 <= reg22[(4'hb):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg46 <= (8'hb5);
      reg47 <= wire32;
      reg48 <= (~|(^wire5));
    end
  assign wire49 = (reg44[(1'h0):(1'h0)] ?
                      $signed(reg42[(3'h6):(3'h5)]) : (~|(reg41[(3'h6):(3'h4)] ?
                          wire32 : $unsigned((reg42 ? wire32 : reg31)))));
  assign wire50 = $signed(((8'hbe) < ((+$unsigned(reg43)) <= ((wire7 ^ reg28) == (reg23 >= wire37)))));
  assign wire51 = $signed(wire21);
endmodule

module module8
#(parameter param17 = (8'hb2), 
parameter param18 = param17)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  assign y = {wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = (~|(({wire10[(5'h12):(5'h11)], {wire12}} ?
                          $unsigned($signed(wire11)) : (~$unsigned(wire11))) ?
                      (wire11[(2'h3):(2'h2)] ?
                          wire9 : ((~^wire9) ~^ (wire11 ?
                              wire11 : wire10))) : $unsigned((~(wire11 - (8'ha7))))));
  assign wire14 = (wire9 ^~ $unsigned((wire12 << $signed($signed(wire13)))));
  assign wire15 = ($signed(((8'h9d) ^~ {wire13})) == (wire9 << ((~&{(8'hac),
                          (8'hb9)}) ?
                      $unsigned((|wire10)) : wire11[(4'h8):(1'h1)])));
  assign wire16 = ((wire14 ? wire9 : wire9[(1'h1):(1'h0)]) >>> (8'had));
endmodule
