module top
#(parameter param78 = ({((|((8'hb3) ? (8'ha2) : (7'h42))) ^ (~^((8'h9d) ? (8'hba) : (8'ha1))))} ^ ({(((8'hac) == (8'hb0)) && ((8'hb4) ? (8'hb2) : (7'h43))), (((7'h41) ? (8'ha6) : (8'haf)) >= (8'haa))} ? ({((8'h9d) ? (7'h41) : (8'hbd))} < {((8'hb5) ? (8'hb8) : (8'ha6))}) : ({((8'ha6) ? (8'hae) : (8'had))} * ((&(8'had)) <= ((7'h40) ? (8'hb3) : (8'h9c)))))), 
parameter param79 = param78)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((|$unsigned(wire2[(3'h5):(1'h1)])) ?
                     ($signed(wire0) ?
                         (($unsigned(wire4) ?
                             (wire4 << wire2) : (~|wire3)) + $signed($unsigned(wire4))) : wire1[(4'hd):(4'hd)]) : $signed(($signed(wire0[(1'h0):(1'h0)]) ?
                         $unsigned(wire1) : $unsigned($signed(wire0)))));
  assign wire6 = wire5[(5'h13):(4'he)];
  assign wire7 = wire5;
  assign wire8 = (wire2 ?
                     (~^wire7[(4'ha):(4'ha)]) : (+{$unsigned($unsigned((8'ha9)))}));
  module9 #() modinst65 (.clk(clk), .wire13(wire2), .wire11(wire1), .y(wire64), .wire10(wire7), .wire12(wire0));
  assign wire66 = (8'hb1);
  assign wire67 = $unsigned((~|wire2[(4'h9):(3'h6)]));
  assign wire68 = (&$signed($unsigned(wire67)));
  assign wire69 = wire1;
  assign wire70 = wire0;
  assign wire71 = (~&($signed(wire69) ?
                      wire64[(3'h6):(3'h6)] : ((wire69[(3'h6):(2'h2)] ?
                              (^~(8'hb0)) : wire69[(2'h3):(2'h2)]) ?
                          $signed(wire3[(5'h11):(3'h4)]) : (((8'ha2) || wire1) ~^ (wire70 ?
                              (8'ha5) : (8'hb2))))));
  assign wire72 = $signed((wire5[(3'h6):(3'h6)] ?
                      (~$signed($signed(wire6))) : $signed({(~wire6)})));
  assign wire73 = $unsigned($unsigned((wire2 ?
                      wire7[(4'he):(4'hb)] : wire66[(4'h8):(1'h0)])));
  assign wire74 = wire4;
  assign wire75 = (-($unsigned(((wire3 ?
                      wire64 : wire66) >> (wire6 >= wire72))) ^ (&{(wire72 ?
                          (8'hae) : wire3)})));
  assign wire76 = wire73;
  assign wire77 = {$signed(((!{wire64, (8'ha0)}) & wire69))};
endmodule

module module9
#(parameter param62 = {(~^((((8'ha6) ? (8'ha4) : (8'hb7)) >= ((8'hac) ? (8'ha5) : (8'hba))) ? {{(8'hab), (8'hba)}} : (((8'hab) ? (8'hbb) : (7'h42)) ? (~^(8'hb6)) : ((8'hba) ? (8'hb5) : (8'hb6)))))}, 
parameter param63 = param62)
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  assign y = {wire61,
                 wire53,
                 wire52,
                 wire50,
                 wire42,
                 wire39,
                 wire16,
                 wire15,
                 wire14,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 (1'h0)};
  assign wire14 = (~^(~&((~|$unsigned((8'hb4))) ^ $unsigned((wire11 >> (8'ha4))))));
  assign wire15 = $unsigned($unsigned((wire12 == $unsigned(((8'hae) ?
                      wire12 : (8'hbb))))));
  assign wire16 = wire12[(3'h6):(2'h2)];
  module17 #() modinst40 (wire39, clk, wire15, wire10, wire12, wire16);
  always
    @(posedge clk) begin
      reg41 <= (-{wire10,
          ($unsigned(wire11[(4'hc):(1'h1)]) < wire15[(4'hb):(4'hb)])});
    end
  assign wire42 = ((((~|wire11[(1'h0):(1'h0)]) ?
                          wire10 : ((reg41 ?
                              wire10 : wire11) - wire14[(1'h1):(1'h1)])) ?
                      wire11 : (^~{wire16[(4'hc):(2'h3)]})) <= (!{$signed((8'hb0))}));
  always
    @(posedge clk) begin
      reg43 <= $unsigned(($signed({$unsigned(wire12),
              (wire10 ? wire12 : wire12)}) ?
          ($unsigned(((8'ha7) ? wire15 : wire39)) ?
              (+$unsigned(wire39)) : ($unsigned((8'hba)) ?
                  {(8'hb7)} : wire11[(4'hb):(3'h7)])) : $unsigned($signed($signed(reg41)))));
      reg44 <= $unsigned(wire42);
      reg45 <= $unsigned(wire11);
    end
  always
    @(posedge clk) begin
      reg46 <= (~(|($signed((wire11 ? reg44 : (8'hbc))) ?
          (wire39[(3'h4):(1'h0)] > (!reg41)) : $unsigned(reg41[(3'h7):(1'h1)]))));
      reg47 <= (^~wire42);
      reg48 <= (8'hb0);
      reg49 <= ({(~^((|reg48) > (wire13 ? reg48 : (8'hbc))))} ?
          (((!{(8'hbe), wire39}) && $signed($signed(reg48))) ?
              {(+(reg46 ^~ wire42))} : wire11[(1'h0):(1'h0)]) : (^~$signed(((reg45 ?
              (7'h44) : (8'ha7)) ^~ wire39))));
    end
  assign wire50 = ((7'h43) - $signed(reg43));
  always
    @(posedge clk) begin
      reg51 <= $signed($signed((($signed(wire50) ?
          $signed(wire10) : $unsigned(wire16)) <<< (reg44[(2'h2):(1'h0)] ?
          $signed((8'h9d)) : $signed((8'h9d))))));
    end
  assign wire52 = (8'hbd);
  assign wire53 = $unsigned({(~|$unsigned($unsigned(wire15)))});
  always
    @(posedge clk) begin
      reg54 <= ((|(($unsigned((8'hae)) == ((8'hac) ?
          wire11 : reg44)) || $signed(wire39[(5'h10):(4'hd)]))) * $signed(((+(wire42 == (8'hb2))) ?
          reg43[(5'h12):(3'h4)] : {(wire50 >= wire10), (wire50 <= wire13)})));
      reg55 <= (8'hbd);
      reg56 <= {$signed(($unsigned((|wire16)) ?
              ((wire14 + wire50) - wire14[(4'h8):(4'h8)]) : (wire50[(4'hd):(4'h9)] ?
                  (reg55 ~^ wire42) : $signed(reg55)))),
          (8'ha0)};
      if (($signed($unsigned(($signed(wire52) != {wire14, reg55}))) ?
          {$unsigned(($signed(reg56) > (!reg41)))} : $signed(reg54[(4'he):(1'h1)])))
        begin
          reg57 <= (((!$unsigned((reg41 - reg43))) ?
              {$signed($signed(wire15))} : wire53[(3'h4):(2'h2)]) << wire52[(2'h2):(1'h1)]);
          reg58 <= reg44[(4'h8):(3'h7)];
          reg59 <= $unsigned(({((wire16 ?
                  wire50 : reg45) == reg55[(2'h2):(1'h0)]),
              {$signed(reg48),
                  (reg57 ? wire13 : wire10)}} <<< (reg46[(2'h3):(1'h1)] ?
              (8'h9f) : ((reg41 || wire16) ?
                  (reg56 != wire39) : (wire14 ? reg48 : wire39)))));
        end
      else
        begin
          reg57 <= $unsigned((!((+(+wire42)) <= $signed(reg44[(2'h3):(1'h0)]))));
          reg58 <= ($unsigned(reg58[(1'h0):(1'h0)]) ?
              $unsigned((8'ha6)) : reg55[(1'h0):(1'h0)]);
          if ($unsigned($signed(((&$unsigned(wire50)) ?
              {$unsigned(reg55)} : $signed(wire42[(1'h1):(1'h0)])))))
            begin
              reg59 <= (~^((wire11[(2'h2):(1'h1)] > reg49[(3'h4):(3'h4)]) == reg48));
              reg60 <= $signed($unsigned({{$unsigned(wire11)}, wire39}));
            end
          else
            begin
              reg59 <= ($signed((((8'ha5) ^ ((7'h43) & reg41)) >= ($signed(reg47) ?
                  reg41[(3'h6):(3'h6)] : (reg46 ?
                      (8'ha8) : (8'hae))))) * $unsigned(reg44));
            end
        end
    end
  assign wire61 = {{{(7'h40)},
                          {(((7'h41) ? reg56 : reg56) ^ reg48[(4'ha):(1'h1)])}},
                      ({wire15[(2'h3):(2'h3)]} ~^ reg56)};
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = $unsigned(($unsigned(($signed(wire21) != wire21)) ?
                      wire20[(2'h2):(1'h0)] : (wire21 ?
                          $signed(wire18) : $unsigned({wire21}))));
  assign wire23 = (wire22[(3'h7):(1'h0)] ?
                      wire18 : $signed((^~($signed(wire18) ?
                          $signed(wire21) : $unsigned(wire20)))));
  assign wire24 = (^(~^wire18));
  assign wire25 = wire22[(1'h0):(1'h0)];
  assign wire26 = ((({{wire25, wire20}} || {(wire23 ?
                          wire25 : wire18)}) || wire18) != {wire25});
  assign wire27 = wire18[(1'h0):(1'h0)];
  assign wire28 = (+$unsigned({(8'had)}));
  assign wire29 = wire18;
  assign wire30 = (|(+wire23[(3'h6):(3'h5)]));
  assign wire31 = (!wire23[(1'h1):(1'h1)]);
  assign wire32 = (^((&{wire25[(3'h7):(2'h2)]}) < {$signed((wire24 * wire29)),
                      $signed(wire27)}));
  assign wire33 = (({((wire31 + wire30) ?
                          $signed(wire29) : $unsigned((8'ha7)))} != (~wire26[(3'h4):(2'h2)])) ~^ $signed(wire31));
  assign wire34 = wire31[(4'hd):(3'h5)];
  assign wire35 = wire21[(4'h9):(3'h5)];
  assign wire36 = $unsigned((wire34[(2'h2):(1'h0)] ?
                      wire35[(2'h2):(1'h1)] : (+(wire34[(1'h1):(1'h0)] << $unsigned(wire26)))));
  assign wire37 = (^(^$signed(($signed(wire27) | (8'hae)))));
  assign wire38 = ((&$unsigned(wire36)) | $unsigned({{$unsigned(wire19),
                          ((8'hbe) >>> wire36)}}));
endmodule
