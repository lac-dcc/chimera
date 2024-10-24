module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire55;
  assign y = {wire61, wire60, wire59, wire58, wire57, wire55, (1'h0)};
  module4 #() modinst56 (.wire5(wire3), .wire6(wire2), .clk(clk), .wire8(wire0), .y(wire55), .wire7(wire1));
  assign wire57 = $unsigned($signed((!((wire0 ? wire2 : (8'hae)) ?
                      (!wire2) : {(8'h9f), (8'hbb)}))));
  assign wire58 = (^~$unsigned((8'hb5)));
  assign wire59 = $signed(((^(~|wire57)) | wire58));
  assign wire60 = {{(~$signed((wire55 != wire57))), $signed((8'ha2))}};
  assign wire61 = (~^(~|$unsigned(wire59)));
endmodule

module module4
#(parameter param53 = {(((+((8'ha2) == (8'hb6))) <= (~&{(7'h43)})) < (((~^(8'h9c)) ? ((8'hac) ? (8'hae) : (8'hb8)) : (~^(8'hbe))) + ((~&(8'ha7)) ? ((8'hba) || (8'hb2)) : ((8'ha3) ? (7'h42) : (8'ha2)))))}, 
parameter param54 = param53)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire5;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire44;
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire44,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= wire7;
      if ({{$signed($unsigned($unsigned(wire8)))}, wire8})
        begin
          reg10 <= wire5[(4'h9):(3'h6)];
        end
      else
        begin
          if ((({$unsigned(wire5[(2'h2):(1'h0)])} ?
                  (8'ha4) : $unsigned((-$unsigned(wire7)))) ?
              (~^(^$signed({(8'hb2),
                  wire6}))) : $signed($unsigned(($signed(reg10) ?
                  (8'h9f) : reg10)))))
            begin
              reg10 <= {reg9};
              reg11 <= wire8[(1'h1):(1'h1)];
              reg12 <= ((-wire7[(4'hd):(3'h4)]) ^ {((wire5 ?
                          reg9 : (wire5 ? wire8 : reg11)) ?
                      (&$unsigned(reg9)) : (+(reg11 ? wire8 : wire5))),
                  $signed(reg11)});
            end
          else
            begin
              reg10 <= wire7[(4'hf):(4'hb)];
              reg11 <= $signed($unsigned((wire5 >>> wire8)));
              reg12 <= $unsigned({($unsigned((reg9 >> wire6)) && reg10[(1'h1):(1'h0)])});
              reg13 <= $signed((reg11[(3'h5):(2'h2)] <<< $unsigned((~&(wire8 ?
                  wire7 : reg11)))));
            end
        end
      reg14 <= (8'ha7);
      reg15 <= (&wire7[(1'h0):(1'h0)]);
      reg16 <= {(~|({{wire6}, {wire5}} ~^ (wire7 ^ reg13[(5'h10):(4'ha)])))};
    end
  assign wire17 = reg15;
  assign wire18 = {(8'ha1)};
  assign wire19 = $signed($signed(({wire5[(2'h2):(1'h1)]} ?
                      (wire7 ? $unsigned(reg9) : reg14) : (|(reg11 & reg15)))));
  assign wire20 = {$unsigned({(wire6[(4'hb):(4'hb)] ?
                              wire6[(4'h9):(4'h9)] : (wire19 ?
                                  (8'ha1) : wire5))})};
  assign wire21 = reg16;
  assign wire22 = wire8;
  assign wire23 = $unsigned((($unsigned({wire7, (8'ha1)}) ?
                      (-(^~(8'had))) : reg10[(1'h0):(1'h0)]) && {reg10,
                      (~&{(8'ha7)})}));
  assign wire24 = wire23[(2'h3):(1'h1)];
  assign wire25 = ((|wire24) ?
                      wire19[(2'h3):(1'h1)] : ($signed(wire18[(2'h3):(1'h0)]) >> (-((!(8'had)) ?
                          ((8'hbb) ? wire7 : reg14) : wire18[(1'h1):(1'h1)]))));
  assign wire26 = {reg16[(3'h5):(1'h0)]};
  module27 #() modinst45 (wire44, clk, wire24, reg12, wire22, wire8);
  always
    @(posedge clk) begin
      if ((wire7[(3'h5):(1'h1)] != (wire25 ^ wire18[(1'h0):(1'h0)])))
        begin
          reg46 <= reg12;
          reg47 <= wire5[(3'h5):(2'h2)];
          reg48 <= (($unsigned($unsigned($signed(wire21))) != (($signed(reg15) ?
                  {wire23} : (~^wire23)) != (wire23 <= wire21[(1'h0):(1'h0)]))) ?
              $unsigned(($signed(reg46[(3'h5):(3'h4)]) >= (~|reg47))) : wire23[(1'h1):(1'h0)]);
          reg49 <= ($signed($unsigned(wire19[(1'h1):(1'h1)])) == reg16[(3'h7):(3'h7)]);
        end
      else
        begin
          reg46 <= ($signed((8'h9d)) ?
              wire17 : $signed($signed(wire19[(2'h2):(1'h0)])));
          reg47 <= {((!(wire22[(1'h0):(1'h0)] && reg13)) + ($unsigned((|reg12)) ?
                  $signed((wire44 ? wire6 : reg12)) : wire7[(4'h8):(2'h2)])),
              (reg10[(2'h3):(2'h3)] + (~|((reg11 ?
                  reg12 : reg9) ~^ wire22[(2'h3):(2'h3)])))};
          reg48 <= $signed(wire20);
          reg49 <= {((({wire8, wire22} ?
                  reg48[(1'h1):(1'h0)] : reg16[(2'h3):(1'h1)]) >= ((reg10 + reg47) * reg47)) * reg9)};
        end
    end
  assign wire50 = $unsigned(($unsigned((8'hb6)) ?
                      (~&$signed((reg16 ? wire26 : reg14))) : ((8'hb3) ?
                          ({(7'h44)} <= $signed(reg10)) : reg16[(3'h7):(3'h4)])));
  assign wire51 = {$signed($signed({{reg16, (7'h44)}, (~^wire21)}))};
  assign wire52 = $unsigned((!wire51[(1'h1):(1'h0)]));
endmodule

module module27
#(parameter param43 = ((({((7'h44) ? (8'ha0) : (7'h41)), ((7'h42) ? (8'hbb) : (8'ha9))} >> (~^(7'h42))) <= {(&((8'hb2) ? (8'ha0) : (8'ha3))), {(~&(8'hbe)), {(8'h9f)}}}) >> ((~{((8'ha7) ? (8'haa) : (7'h44))}) ? ((((8'ha5) ? (7'h41) : (8'ha3)) ? ((8'hb1) >= (8'hb8)) : (~(8'ha0))) ? ({(8'ha3), (8'hb8)} ? ((8'hbd) ? (8'hb2) : (8'hb6)) : ((7'h42) ? (8'h9c) : (7'h41))) : ((-(8'haf)) ? {(8'hb7)} : ((8'ha4) + (8'hb6)))) : ((8'h9c) ? (8'hb3) : ((-(8'ha9)) ? (-(8'hb9)) : (~(8'hbc)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg38,
                 (1'h0)};
  assign wire32 = {(~&($unsigned(wire28) & $unsigned(((8'hb3) == wire28))))};
  assign wire33 = (({(8'ha3), ((wire31 < (7'h43)) || (&wire30))} ~^ (~|({wire31,
                          wire28} ~^ $unsigned(wire30)))) ?
                      $unsigned((^~((^wire32) ?
                          $unsigned(wire32) : (&wire31)))) : $signed(wire32[(1'h1):(1'h1)]));
  assign wire34 = $signed($signed($unsigned({wire29[(1'h0):(1'h0)],
                      (wire29 ? wire32 : wire33)})));
  assign wire35 = wire30;
  assign wire36 = (($unsigned($unsigned((wire28 & wire30))) ?
                      {($unsigned(wire30) ? {(8'hbb)} : wire29[(2'h2):(2'h2)]),
                          wire29} : wire29[(1'h0):(1'h0)]) == wire34[(4'h8):(2'h2)]);
  assign wire37 = ($unsigned(wire28[(1'h0):(1'h0)]) ?
                      $signed((~{wire30})) : wire32);
  always
    @(posedge clk) begin
      reg38 <= wire36;
    end
  assign wire39 = $signed(wire31);
  assign wire40 = $unsigned(wire31[(2'h3):(2'h3)]);
  assign wire41 = {($unsigned(((!(8'hac)) || wire31[(4'he):(4'ha)])) == wire31[(4'hc):(3'h7)])};
  assign wire42 = (({wire37[(3'h7):(2'h3)]} ? wire34 : wire37[(2'h3):(2'h3)]) ?
                      wire41 : $signed((($unsigned(reg38) ?
                              (~&wire32) : $signed(wire30)) ?
                          ((wire37 ? wire33 : wire28) ~^ (wire39 ?
                              wire32 : (8'hb6))) : $unsigned(wire40))));
endmodule
