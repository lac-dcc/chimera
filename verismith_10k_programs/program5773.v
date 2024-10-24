module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire34;
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire5,
                 wire34,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg38,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(2'h2):(2'h2)];
    end
  assign wire5 = $unsigned({(+$unsigned(wire3))});
  module6 #() modinst35 (.clk(clk), .wire7(reg4), .wire8(wire3), .wire10(wire5), .y(wire34), .wire9(wire2));
  assign wire36 = $unsigned(wire3);
  assign wire37 = $signed($signed($signed(wire0[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg38 <= (wire34 ?
          (((~wire0) ?
              ($signed(reg4) < $signed((7'h40))) : {{wire37},
                  $unsigned(wire0)}) < (+$signed({wire1}))) : ($signed($unsigned((reg4 ?
                  wire34 : wire2))) ?
              $signed($unsigned((wire37 && wire1))) : $signed(wire5)));
    end
  assign wire39 = $unsigned({(~&$signed({(8'ha3), wire34})),
                      $signed({((8'hb4) ? wire5 : wire1)})});
  assign wire40 = $unsigned($unsigned($unsigned($signed((~^wire5)))));
  always
    @(posedge clk) begin
      reg41 <= $signed(($unsigned($signed(wire1)) ^ {wire40[(2'h2):(1'h0)]}));
      if (wire36)
        begin
          reg42 <= (&(-(~($unsigned(wire0) ?
              $signed(wire34) : {wire36, wire0}))));
        end
      else
        begin
          reg42 <= wire2[(4'ha):(1'h0)];
          if ($unsigned(wire1[(3'h6):(1'h1)]))
            begin
              reg43 <= ((((reg42[(1'h0):(1'h0)] <<< (-wire5)) ^ wire2[(4'hd):(4'h8)]) != (~^$signed((~^(8'hb4))))) ?
                  $unsigned((8'hb2)) : reg42);
              reg44 <= ((wire37[(4'hc):(2'h2)] ?
                      (~{$signed(wire37), $signed(wire36)}) : wire40) ?
                  wire3 : $unsigned(reg41[(2'h3):(2'h2)]));
              reg45 <= $signed(($signed(reg41[(3'h7):(1'h0)]) ^~ {((^~wire5) <= (reg41 | wire39)),
                  reg44}));
              reg46 <= wire2[(2'h2):(1'h1)];
            end
          else
            begin
              reg43 <= $signed((7'h40));
              reg44 <= wire37[(1'h0):(1'h0)];
              reg45 <= wire34[(2'h2):(1'h1)];
              reg46 <= (($unsigned(({(8'hac)} ? wire3 : (reg44 && wire2))) ?
                      (($unsigned(reg38) == wire36) ~^ ($signed(reg4) ?
                          wire39 : (wire34 ? wire2 : wire36))) : (reg44 ?
                          ((reg44 ?
                              wire36 : reg42) <= (~^wire5)) : $signed((reg45 ?
                              wire2 : wire5)))) ?
                  ((wire0[(2'h2):(1'h1)] ?
                      $unsigned((reg43 ?
                          (8'hb3) : (8'haf))) : wire40) ^ (8'ha9)) : (~(+wire5)));
            end
          reg47 <= (!{$signed(reg46)});
          reg48 <= (^~((^~(~&(reg47 >= reg4))) ?
              {{wire0, (reg43 <= wire40)},
                  (~^(wire1 && wire36))} : ($signed(reg46) == (-(wire0 ?
                  wire5 : (7'h44))))));
        end
    end
endmodule

module module6
#(parameter param32 = (~^(~((~^(8'hbb)) && (((8'hb2) ? (8'hbf) : (8'h9e)) & {(8'hbc)})))), 
parameter param33 = ((({(param32 ? param32 : param32)} ? (!(^~param32)) : (&param32)) ^ param32) > (param32 - param32)))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire12,
                 wire11,
                 reg31,
                 reg30,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = wire8;
  assign wire12 = $unsigned(($unsigned({wire10[(2'h2):(1'h0)]}) ?
                      wire11[(2'h3):(2'h2)] : $signed(wire10[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (((((~wire7[(3'h7):(3'h4)]) ?
              (&(+wire7)) : ((~&wire11) ?
                  wire11 : (!wire11))) ~^ (~&(+(~wire12)))) ?
          wire9 : $signed((!$unsigned(wire12[(2'h3):(1'h0)])))))
        begin
          reg13 <= $signed((($unsigned((^wire9)) ?
              (^~wire10) : wire9[(4'he):(1'h1)]) == wire12[(3'h4):(1'h1)]));
          reg14 <= (|wire7[(3'h4):(1'h0)]);
          reg15 <= $signed((8'h9f));
          reg16 <= ((&wire12[(3'h5):(1'h0)]) ~^ $unsigned((&{(~wire12),
              reg15})));
          if (($unsigned({$unsigned((reg13 ? (7'h41) : reg16))}) ?
              (reg13[(3'h7):(2'h3)] <= (({wire12} ?
                  reg15 : (wire7 ?
                      wire12 : wire7)) || $unsigned(reg14[(1'h1):(1'h1)]))) : ($unsigned($unsigned($unsigned(wire11))) != (~((8'had) - (reg13 ?
                  reg15 : (8'hb1)))))))
            begin
              reg17 <= wire11;
              reg18 <= reg17;
              reg19 <= $unsigned(reg16[(3'h5):(3'h4)]);
              reg20 <= ((($signed(reg13[(1'h1):(1'h0)]) ?
                          reg18[(4'ha):(4'h8)] : reg17[(3'h6):(3'h6)]) ?
                      (($unsigned(reg14) <= ((8'hba) ?
                          wire12 : wire7)) < wire11) : (~^($unsigned(reg18) ?
                          $signed(wire12) : (~|wire7)))) ?
                  (^reg18) : (({wire9[(4'he):(1'h0)],
                          (8'ha7)} <<< $signed((~|reg16))) ?
                      $unsigned($unsigned({wire8})) : reg15[(3'h4):(1'h1)]));
              reg21 <= reg18[(3'h6):(1'h1)];
            end
          else
            begin
              reg17 <= reg13;
              reg18 <= {({({(8'hb5)} ?
                          reg21[(4'h9):(3'h5)] : (~^reg14))} + reg18),
                  ($signed((~((8'haf) ^ wire11))) ?
                      ($unsigned(reg17) ?
                          wire11 : $signed(reg17)) : ($unsigned((wire7 <<< wire10)) ?
                          ((reg15 | wire8) ?
                              $unsigned(wire8) : (-reg21)) : $signed(((8'h9d) <<< reg13))))};
              reg19 <= $signed($signed(wire12[(4'h8):(3'h7)]));
            end
        end
      else
        begin
          reg13 <= {((reg14[(2'h3):(1'h0)] >> $unsigned((wire9 | (8'h9e)))) ?
                  $unsigned((8'ha5)) : wire9[(4'hd):(2'h3)])};
          if (($unsigned((~^($signed(wire12) ?
              (wire7 ? reg14 : reg15) : (-(8'haa))))) <= (~|(8'haa))))
            begin
              reg14 <= reg19;
              reg15 <= ($unsigned($unsigned((-{(8'hac),
                  reg15}))) ^~ ({{$unsigned(reg18)},
                  $signed(wire8)} | $unsigned(reg18[(4'ha):(4'h9)])));
              reg16 <= $signed({((&(reg21 >> wire11)) ?
                      $signed(reg15) : (~&(wire10 ? reg20 : reg16)))});
              reg17 <= reg14[(4'ha):(3'h5)];
              reg18 <= $signed(wire12[(4'hd):(4'ha)]);
            end
          else
            begin
              reg14 <= (wire9 ?
                  (|($signed(reg15[(3'h7):(3'h6)]) ?
                      {(reg17 || reg20),
                          $unsigned(wire9)} : reg14)) : ($unsigned(wire7) ?
                      (^reg16) : $unsigned(((reg14 >= reg21) ?
                          (reg19 ~^ wire10) : $signed(reg17)))));
            end
          reg19 <= {reg16, $signed($unsigned(reg17))};
        end
    end
  assign wire22 = wire8[(4'ha):(3'h5)];
  assign wire23 = wire8[(1'h0):(1'h0)];
  assign wire24 = wire10;
  assign wire25 = reg20;
  assign wire26 = wire10[(2'h3):(2'h2)];
  assign wire27 = $unsigned(reg15);
  assign wire28 = (^~(reg16 == (((^~wire26) ? reg13 : (~wire23)) ?
                      ((+reg19) & $unsigned(reg19)) : $unsigned((reg20 > (8'ha2))))));
  assign wire29 = reg20;
  always
    @(posedge clk) begin
      reg30 <= ($unsigned((reg20[(4'he):(4'hc)] ?
              ($signed((8'hac)) + (8'ha9)) : wire23)) ?
          (^(~((reg20 <<< wire22) ?
              (wire10 >> wire9) : (|wire26)))) : (|reg18));
      reg31 <= $unsigned(wire8);
    end
endmodule
