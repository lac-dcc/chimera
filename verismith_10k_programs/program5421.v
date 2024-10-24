module top
#(parameter param87 = (~((((-(8'hb9)) || (|(8'ha4))) ^ (8'hba)) - (^(8'hb8)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire73;
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire6,
                 wire73,
                 reg85,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire2);
      reg5 <= (~wire0[(3'h4):(1'h1)]);
    end
  assign wire6 = wire0[(3'h7):(3'h6)];
  module7 #() modinst74 (wire73, clk, wire0, wire2, reg4, wire1, reg5);
  always
    @(posedge clk) begin
      reg75 <= (~$signed(reg5[(3'h7):(2'h2)]));
      if ((8'ha4))
        begin
          reg76 <= (8'h9d);
          reg77 <= $unsigned(reg75[(1'h0):(1'h0)]);
        end
      else
        begin
          reg76 <= wire73[(4'hc):(2'h2)];
          reg77 <= $signed(reg5);
          reg78 <= wire6;
        end
      reg79 <= $signed({$unsigned({(reg76 - wire6), ((8'h9c) <<< wire3)})});
      reg80 <= reg77[(4'h9):(3'h6)];
    end
  assign wire81 = reg4;
  assign wire82 = (+reg76[(4'he):(1'h1)]);
  assign wire83 = wire82;
  assign wire84 = wire1;
  always
    @(posedge clk) begin
      reg85 <= wire82;
    end
  assign wire86 = $signed(((~^{(wire84 ? reg80 : (7'h40))}) ^~ wire2));
endmodule

module module7
#(parameter param71 = ((&{(((7'h44) - (7'h44)) ? ((7'h41) ? (7'h42) : (8'ha9)) : {(8'hbe), (7'h44)}), (((8'hb5) << (8'h9e)) == {(8'ha7), (8'ha8)})}) ? (({((8'ha3) ? (8'hbb) : (8'h9f)), ((8'hb6) ^~ (8'haf))} ? (|{(8'hbf), (8'haf)}) : (^((8'ha8) == (8'hb2)))) ? ((~|((8'ha4) ? (8'ha4) : (8'hab))) ? {(~|(8'hb5)), {(8'ha8)}} : (~|(^~(8'hab)))) : (({(8'hb9)} - (~&(8'haa))) >> (~|{(7'h41), (8'h9d)}))) : {(-(~|(^~(8'hbc)))), ((((7'h40) >= (8'haf)) * ((8'hbf) ? (8'ha6) : (8'ha6))) >> {{(8'had)}, (^(8'ha3))})}), 
parameter param72 = (param71 ? {(((param71 ? param71 : param71) ? (param71 == (8'ha6)) : (param71 ? param71 : param71)) ? (~|(&param71)) : ((param71 ~^ param71) <= (param71 > param71))), {((param71 ? param71 : param71) == param71), (param71 ? (param71 ? param71 : param71) : ((8'h9f) << param71))}} : (({(+param71), (~|param71)} ? param71 : (param71 ? (param71 || param71) : param71)) < (((param71 ? param71 : param71) ? ((7'h44) ? param71 : (8'ha9)) : (param71 ? param71 : param71)) > param71))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  assign y = {wire70,
                 wire68,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = (7'h42);
  assign wire14 = $signed(wire13[(1'h0):(1'h0)]);
  assign wire15 = ($unsigned(wire11) ?
                      wire11[(4'ha):(3'h6)] : ({$unsigned(wire11),
                              (wire14 ? (!wire12) : $unsigned(wire13))} ?
                          ((~&wire12) ?
                              $unsigned((wire10 >= (8'hb9))) : (8'haf)) : (($unsigned(wire14) <= (wire11 < wire13)) ?
                              ((~&wire10) ?
                                  $signed(wire9) : $signed(wire11)) : $signed($unsigned(wire12)))));
  assign wire16 = (8'hb9);
  assign wire17 = {wire16[(2'h3):(1'h1)],
                      $unsigned($unsigned(($unsigned(wire14) ^~ wire9)))};
  assign wire18 = (8'hae);
  assign wire19 = (wire10[(3'h5):(3'h5)] ?
                      $signed(wire11) : ($unsigned($signed({wire10})) >> wire11));
  module20 #() modinst69 (wire68, clk, wire15, wire9, wire10, wire14);
  assign wire70 = $unsigned(wire16[(4'h8):(3'h7)]);
endmodule

module module20
#(parameter param67 = {(~(((!(8'ha7)) ? ((8'hb1) ? (8'ha3) : (7'h44)) : {(8'ha4), (8'ha1)}) ? (^~{(8'haf), (8'hbc)}) : (^((7'h40) || (8'hab))))), ({(&{(8'hba)})} - (!(~|{(8'hbf), (8'hb0)})))})
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(2'h3):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 wire29,
                 wire28,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg32,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg25 <= ($signed(wire21) < (-wire21));
      reg26 <= (!wire24[(1'h1):(1'h0)]);
      reg27 <= reg26[(2'h2):(2'h2)];
    end
  assign wire28 = wire21;
  assign wire29 = (^~(reg26 ?
                      $unsigned(wire28) : (({reg25, wire21} ?
                          $unsigned(wire28) : $unsigned(reg26)) << wire21)));
  always
    @(posedge clk) begin
      reg30 <= {(^~wire23[(3'h4):(3'h4)]), wire24};
    end
  assign wire31 = ($signed(reg27[(3'h6):(1'h0)]) >> (^$signed(wire28)));
  always
    @(posedge clk) begin
      reg32 <= wire21;
    end
  assign wire33 = wire31[(4'ha):(2'h3)];
  assign wire34 = ({(&reg30[(4'hd):(4'hc)]),
                      (($unsigned((8'hb8)) > $signed(wire23)) <= ($unsigned((8'hab)) ?
                          {reg26,
                              wire31} : (^reg26)))} >= $unsigned($signed((^~{reg32}))));
  assign wire35 = reg26;
  assign wire36 = ($signed(reg27) ?
                      wire35[(1'h0):(1'h0)] : {$signed(reg26),
                          {(~|(^~wire21))}});
  assign wire37 = reg25[(2'h3):(1'h0)];
  assign wire38 = $unsigned($signed((((reg30 || wire24) - $signed(reg32)) * ((!wire28) ?
                      $signed(reg32) : wire35[(2'h2):(1'h0)]))));
  assign wire39 = $signed((!((wire33 & (wire22 ? reg25 : reg32)) == ({wire22,
                          reg30} ?
                      (8'hb6) : {(8'h9c)}))));
  assign wire40 = ((((wire39[(2'h2):(2'h2)] ?
                      $signed(reg27) : (reg25 > reg27)) & $signed((wire22 ?
                      wire36 : wire24))) || wire33[(4'h8):(3'h7)]) - wire35[(1'h1):(1'h0)]);
  assign wire41 = $signed(wire29);
  assign wire42 = ((^~$signed($signed(wire21))) && (wire40 ^ ($unsigned((reg32 & wire22)) > (~^(wire24 ?
                      (8'ha1) : reg30)))));
  assign wire43 = $signed(wire41);
  assign wire44 = ((8'hba) & $signed($signed((wire43[(2'h2):(2'h2)] ?
                      (^wire31) : (~^wire38)))));
  always
    @(posedge clk) begin
      if (wire21[(4'hd):(1'h0)])
        begin
          reg45 <= (~&wire42);
        end
      else
        begin
          reg45 <= $signed((wire31[(2'h3):(1'h1)] ?
              {(wire36 ? wire39[(4'h9):(3'h6)] : (wire22 ? reg27 : reg32)),
                  (~&$signed(wire40))} : reg32[(4'hb):(1'h1)]));
          reg46 <= $signed({(($unsigned(wire28) ?
                  $signed(wire39) : (wire23 >> wire37)) << wire43[(1'h0):(1'h0)])});
          if (reg26[(5'h10):(4'he)])
            begin
              reg47 <= ((wire37 ?
                  wire42[(4'hf):(4'hb)] : reg45) ^ $unsigned(wire24));
              reg48 <= {reg46, (-{wire33})};
              reg49 <= {wire22[(1'h1):(1'h0)], wire24};
            end
          else
            begin
              reg47 <= (((~|($unsigned(wire33) ?
                      wire39 : (wire22 ? wire41 : wire23))) ?
                  ($signed((wire22 ?
                      reg45 : wire24)) << reg48) : ((&(wire42 <<< wire40)) ^ ((wire23 << wire24) <<< wire41[(4'h9):(3'h4)]))) >= {$unsigned((^~((8'hb6) ?
                      wire31 : (8'haa))))});
              reg48 <= $unsigned({{(!{wire24, wire37})},
                  wire44[(3'h4):(2'h3)]});
            end
          if (reg25[(1'h1):(1'h0)])
            begin
              reg50 <= $signed((wire38[(4'he):(4'ha)] && $signed($unsigned($signed(reg49)))));
              reg51 <= wire40;
              reg52 <= (wire31[(2'h3):(2'h3)] == $signed((($signed((8'ha8)) ?
                      (wire28 <<< reg45) : {reg50, wire22}) ?
                  (!(wire31 ? wire42 : reg50)) : wire34[(3'h4):(2'h3)])));
              reg53 <= $unsigned($unsigned(reg46));
              reg54 <= reg53[(3'h5):(2'h3)];
            end
          else
            begin
              reg50 <= $unsigned($unsigned(wire43[(1'h1):(1'h1)]));
              reg51 <= ($signed(wire31[(1'h1):(1'h1)]) ?
                  wire39 : (wire44[(3'h6):(3'h6)] ?
                      $signed((~&(-(8'ha7)))) : $signed($unsigned((~|(8'hab))))));
              reg52 <= (8'ha2);
            end
        end
      reg55 <= $signed(((($unsigned(reg51) << {reg54,
              reg45}) >= $unsigned($unsigned(reg54))) ?
          $unsigned(wire42[(4'h8):(3'h4)]) : reg54[(3'h4):(2'h2)]));
      if (($signed(reg54[(2'h3):(1'h1)]) ?
          ((wire38[(4'h8):(3'h4)] ?
              reg47[(2'h3):(2'h3)] : wire31[(3'h7):(2'h3)]) ^ (~(8'ha2))) : reg25[(1'h1):(1'h1)]))
        begin
          reg56 <= $unsigned(((!wire36[(3'h4):(1'h0)]) >>> $unsigned((reg52 + (~^wire24)))));
          if (wire24[(2'h2):(1'h0)])
            begin
              reg57 <= wire31;
            end
          else
            begin
              reg57 <= $signed(reg50);
              reg58 <= $unsigned({$signed(({(8'ha0)} ?
                      reg25[(2'h3):(2'h2)] : (wire31 ? (8'hbe) : (8'hb1))))});
              reg59 <= $signed(((reg49 << wire22[(1'h0):(1'h0)]) || (~^wire31)));
              reg60 <= {{(|({wire33} ? wire24 : (~|reg50)))},
                  ($unsigned(reg55[(1'h1):(1'h0)]) ?
                      (({reg59} << $signed((8'ha5))) ?
                          ({reg50, reg57} ~^ {wire33,
                              reg57}) : $unsigned((wire28 != wire24))) : $unsigned((wire41 ?
                          (~wire28) : (reg26 != (8'hab)))))};
            end
          reg61 <= $signed(reg26[(2'h3):(1'h0)]);
          reg62 <= $signed(($signed($unsigned($unsigned(reg32))) + ($unsigned(wire42) <<< wire39[(3'h6):(3'h6)])));
        end
      else
        begin
          if ((!{reg52[(2'h3):(1'h1)], (~reg49[(3'h6):(2'h3)])}))
            begin
              reg56 <= reg46;
            end
          else
            begin
              reg56 <= (wire29 ? wire40 : $unsigned((-{$unsigned(reg52)})));
            end
          reg57 <= $signed((~&$unsigned((8'hb3))));
          reg58 <= reg30;
          reg59 <= (8'h9c);
        end
    end
  assign wire63 = (~|$unsigned(reg54));
  assign wire64 = reg62[(4'hc):(3'h7)];
  assign wire65 = (^~wire37[(4'hc):(2'h2)]);
  assign wire66 = ($unsigned((8'hb0)) || (8'hac));
endmodule
