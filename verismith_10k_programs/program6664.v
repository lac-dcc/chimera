module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire48;
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire59,
                 wire4,
                 wire48,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire4 = (wire0 ?
                     ($signed({((8'hb4) << wire1),
                         (wire3 >>> wire0)}) >>> wire2[(2'h3):(2'h3)]) : (((wire0[(3'h6):(3'h6)] << wire3) ?
                             (wire0 ?
                                 $unsigned(wire2) : (!wire1)) : {(wire0 & wire0),
                                 (^~wire1)}) ?
                         ((8'hbe) ?
                             (~$signed(wire2)) : $unsigned((wire3 ?
                                 (8'hbd) : wire3))) : wire3));
  module5 #() modinst49 (.wire8(wire1), .y(wire48), .clk(clk), .wire6(wire0), .wire10(wire2), .wire7(wire4), .wire9(wire3));
  always
    @(posedge clk) begin
      reg50 <= $signed({($signed(wire4[(1'h1):(1'h1)]) < (^(~wire48))),
          $signed(wire0[(3'h4):(3'h4)])});
    end
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg51 <= $signed(wire0[(5'h11):(4'ha)]);
          reg52 <= (^(!(~^wire3)));
          reg53 <= $signed((~&{wire3[(3'h4):(1'h0)]}));
          reg54 <= $signed(wire1);
          if (wire48)
            begin
              reg55 <= (wire48[(4'he):(2'h3)] < $signed($signed(wire1)));
              reg56 <= wire1;
              reg57 <= ({wire48} ?
                  ($signed($unsigned(wire2[(5'h13):(5'h10)])) ?
                      $unsigned(wire4) : {wire3}) : ((+(^reg52)) ?
                      $unsigned(((wire0 ? reg56 : wire48) ?
                          (wire3 - reg51) : reg50)) : $unsigned(reg56)));
            end
          else
            begin
              reg55 <= wire3[(4'hd):(3'h6)];
              reg56 <= (wire3[(4'ha):(1'h0)] == reg54[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg51 <= $unsigned((8'ha4));
        end
      reg58 <= (8'hb2);
    end
  assign wire59 = (~^$signed($signed(reg54[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg60 <= reg58[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg61 <= (~^(wire2[(4'hf):(2'h3)] ?
          wire2 : (~|$signed($unsigned(reg53)))));
      if ($unsigned(((7'h40) <= (&({reg55} ?
          (reg50 < reg51) : $unsigned(reg54))))))
        begin
          reg62 <= $unsigned($signed({(+(-reg60))}));
          reg63 <= ({{wire3[(5'h12):(4'h8)], wire2}} || (~($unsigned((-reg52)) ?
              wire59[(3'h5):(3'h4)] : {(reg53 ^~ reg56),
                  reg56[(4'hf):(2'h3)]})));
        end
      else
        begin
          if ($unsigned(($unsigned(reg62[(3'h5):(3'h5)]) <<< ($signed(reg56[(4'ha):(4'h9)]) ?
              (reg62 ? reg58[(3'h5):(2'h2)] : {reg53, reg56}) : wire2))))
            begin
              reg62 <= (~&(~^$signed(reg53)));
              reg63 <= ($unsigned((7'h42)) + ($signed(wire2) ?
                  (&{(reg55 ? reg55 : reg56)}) : reg51));
              reg64 <= (reg62[(2'h3):(2'h3)] == ((^~$unsigned($signed(reg54))) << $unsigned(wire1[(1'h0):(1'h0)])));
              reg65 <= $unsigned({$signed(reg63)});
              reg66 <= $signed(reg61[(1'h1):(1'h1)]);
            end
          else
            begin
              reg62 <= reg55[(3'h4):(2'h2)];
              reg63 <= $signed((({{reg54}} < $unsigned((reg58 >= (8'had)))) == (8'hb3)));
              reg64 <= {($unsigned(reg52) ?
                      wire4 : $unsigned($unsigned(reg58[(4'hb):(3'h6)])))};
              reg65 <= (reg60[(1'h0):(1'h0)] ? (8'ha5) : wire59);
              reg66 <= (((&$unsigned((reg54 != wire59))) ^~ $unsigned(wire4[(2'h3):(2'h2)])) ?
                  $signed($signed(reg60)) : ((~&reg60[(2'h2):(1'h0)]) * $signed(reg58)));
            end
        end
      if (wire4[(4'ha):(3'h4)])
        begin
          if ($signed({$signed(($signed(wire59) ?
                  $unsigned(wire59) : (wire59 >> reg52))),
              (~^reg64[(2'h2):(2'h2)])}))
            begin
              reg67 <= (~wire3[(3'h7):(1'h1)]);
              reg68 <= (^~$unsigned($signed($unsigned((reg67 ?
                  reg52 : wire3)))));
              reg69 <= $unsigned((wire0 ^ (!(wire3 < (wire59 ~^ reg52)))));
            end
          else
            begin
              reg67 <= (reg62 ?
                  $unsigned((~&$signed((reg63 ?
                      (8'hbb) : wire3)))) : $unsigned($signed(reg67[(2'h2):(1'h1)])));
              reg68 <= ({((~{reg51, wire2}) ? {(reg64 << reg58)} : reg61),
                  $unsigned({reg61,
                      (wire3 != reg66)})} * {(wire59[(4'hb):(4'ha)] >>> ((reg61 ?
                          reg54 : reg61) ?
                      wire2[(5'h12):(2'h3)] : wire0))});
              reg69 <= ((wire4 >= (~reg60)) ?
                  $signed(((!(wire59 ? reg64 : reg58)) ^ ({reg66, reg56} ?
                      $unsigned((8'ha9)) : $unsigned(reg64)))) : (|($signed(reg52[(3'h6):(3'h5)]) ^~ (reg55[(4'ha):(3'h7)] ?
                      $unsigned(reg51) : (reg65 && reg64)))));
            end
          reg70 <= reg62[(4'hc):(3'h5)];
          reg71 <= $unsigned(wire4[(4'h8):(1'h0)]);
          reg72 <= (($unsigned(((wire1 ^ wire4) ^~ $unsigned((8'hb0)))) ?
              $signed((~|(-reg70))) : $unsigned((reg53 == reg53))) ^ wire3);
        end
      else
        begin
          reg67 <= reg66[(3'h5):(1'h0)];
          if ({($unsigned($unsigned($signed(reg68))) || reg54),
              reg72[(1'h0):(1'h0)]})
            begin
              reg68 <= $signed(reg53[(1'h0):(1'h0)]);
              reg69 <= (-((($signed((7'h40)) ?
                      ((8'ha9) ?
                          reg58 : reg62) : reg65) <= $unsigned(reg52[(3'h7):(1'h0)])) ?
                  (reg72 ?
                      (|$unsigned(reg67)) : {(wire4 ? reg63 : reg58),
                          wire2}) : (wire59[(4'h8):(3'h4)] ?
                      wire2[(3'h7):(3'h7)] : {reg53, (8'hbd)})));
            end
          else
            begin
              reg68 <= $signed($unsigned($unsigned(reg51)));
              reg69 <= $unsigned(reg56);
              reg70 <= (~&$unsigned((+$signed((~|reg68)))));
              reg71 <= $unsigned((reg61[(3'h5):(1'h1)] ?
                  (~|((wire0 ?
                      reg58 : (8'h9d)) & reg66[(3'h6):(3'h5)])) : $unsigned(reg63)));
              reg72 <= reg50;
            end
        end
      reg73 <= ($unsigned(({(reg51 ? wire2 : reg54),
          $unsigned(reg58)} | $signed((reg63 ?
          (8'hb7) : reg55)))) < $unsigned(reg63[(3'h4):(1'h0)]));
    end
  assign wire74 = ((reg62[(4'he):(2'h3)] ?
                      reg68[(2'h2):(2'h2)] : ($unsigned(reg72[(3'h4):(1'h0)]) | wire3[(4'hd):(4'h9)])) >> wire2[(4'hf):(4'hf)]);
  assign wire75 = wire59;
  assign wire76 = reg56[(1'h0):(1'h0)];
endmodule

module module5
#(parameter param46 = ((((~|((8'hb3) * (8'hb5))) >> (((8'h9c) < (8'ha0)) + {(8'hbe), (8'haf)})) ? ((~(&(8'ha5))) <<< (~{(8'ha0)})) : ((((8'hbd) ? (8'haa) : (8'hb2)) >> {(8'hb0)}) ? (!((8'ha2) ? (8'ha4) : (8'hb6))) : (~(&(8'ha4))))) ? ({(!((8'haf) ? (8'ha9) : (8'ha3))), ((~(8'hbb)) && {(8'ha1)})} ? (^~(((8'hbf) | (8'hb6)) ? (8'haf) : ((8'haf) ? (8'hb6) : (8'hb1)))) : (&(^~((8'ha2) ? (7'h41) : (8'ha6))))) : ({(((8'hb6) & (8'hb7)) || ((8'ha4) | (8'h9c)))} ? ((((8'hb3) != (8'hbb)) <<< (~|(8'hbf))) && (((8'h9e) ? (8'hac) : (8'hb5)) ^~ {(7'h42), (8'ha8)})) : (^~(~|((8'hba) ? (8'h9e) : (8'h9c)))))), 
parameter param47 = param46)
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire25;
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire25,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  module11 #() modinst26 (.y(wire25), .clk(clk), .wire14(wire8), .wire15(wire7), .wire16(wire9), .wire12(wire6), .wire13(wire10));
  assign wire27 = wire7[(4'ha):(4'h8)];
  assign wire28 = {wire6[(4'he):(4'h8)]};
  assign wire29 = $unsigned(wire6);
  always
    @(posedge clk) begin
      if ((((wire29 - (wire25[(1'h1):(1'h0)] ?
              $unsigned(wire10) : $unsigned(wire7))) ?
          (~|(wire29[(4'hc):(4'h8)] ~^ $signed(wire6))) : wire6) != (wire29 ?
          $signed(wire8) : (+(((8'ha1) ? wire27 : wire7) ?
              (wire28 ? wire6 : wire29) : (wire6 << wire9))))))
        begin
          reg30 <= wire8;
          reg31 <= (($signed((((8'ha3) ? wire9 : wire7) ?
                      (wire29 <<< (8'had)) : $unsigned(wire29))) ?
                  (({(8'hbe), wire25} * (!wire27)) ?
                      {$signed(wire6),
                          $unsigned(wire9)} : (~^$unsigned((7'h43)))) : $signed({((8'hb7) >>> wire6),
                      (wire27 ? wire6 : (8'ha5))})) ?
              ((~^reg30) <<< {((wire25 ? wire28 : reg30) <= (wire29 ^~ wire10)),
                  wire28[(1'h0):(1'h0)]}) : ($signed($signed(wire7)) ?
                  $unsigned(($signed(wire25) < wire29[(4'he):(3'h5)])) : (!(8'ha9))));
          if ((wire28 ?
              (wire7 & (((~^wire27) ?
                      (wire6 ? wire10 : reg31) : ((8'hac) + wire6)) ?
                  wire7 : (&$signed(reg31)))) : (8'ha3)))
            begin
              reg32 <= reg30;
            end
          else
            begin
              reg32 <= (($unsigned(((wire29 ~^ wire8) ?
                  {wire7,
                      wire29} : $unsigned(reg31))) ^ $signed((((8'ha8) == wire6) * (wire9 ~^ reg32)))) ^~ reg30);
              reg33 <= ($signed($signed(((wire27 * wire8) ?
                      $unsigned(wire29) : ((7'h42) << wire25)))) ?
                  (~&$signed(wire6)) : $signed({$unsigned((wire28 == wire28)),
                      (|(wire28 | reg32))}));
            end
          reg34 <= {(((^~$unsigned(reg33)) ?
                  (!$signed(wire27)) : $signed(wire7)) >= {{(reg32 ?
                          reg30 : wire6),
                      wire27},
                  {{wire9, reg32}}})};
        end
      else
        begin
          if ((($signed(reg30[(1'h0):(1'h0)]) ?
                  $signed(wire29[(4'hc):(1'h0)]) : (wire6[(4'hf):(4'hc)] <<< reg33[(2'h3):(1'h1)])) ?
              ((wire8[(4'hd):(1'h0)] ?
                      $unsigned((^wire9)) : (wire29 ?
                          wire27[(5'h12):(1'h1)] : (~|wire28))) ?
                  (!(reg31 && (reg31 ^~ reg33))) : {$unsigned((wire10 ?
                          wire28 : wire29))}) : wire10))
            begin
              reg30 <= (|$signed(((((8'haa) ? wire27 : reg30) ?
                      (|reg30) : (wire29 > wire10)) ?
                  ((wire7 ?
                      wire10 : wire27) >>> reg30) : $signed($unsigned((8'ha3))))));
            end
          else
            begin
              reg30 <= (~&$unsigned(reg32[(3'h4):(2'h3)]));
              reg31 <= (($unsigned(((~wire7) ?
                      (wire6 ? reg31 : wire25) : (wire28 <<< reg34))) ?
                  wire9 : ($signed(((7'h42) & wire7)) & $unsigned((wire10 ?
                      reg31 : reg34)))) != wire25[(1'h1):(1'h1)]);
            end
          reg32 <= $unsigned(wire28);
        end
      reg35 <= $signed(wire6);
      reg36 <= $unsigned({wire8[(4'hc):(4'h9)], reg30[(3'h5):(1'h1)]});
      reg37 <= $unsigned($signed(reg31));
      if ($signed((8'ha9)))
        begin
          if ($signed(reg30))
            begin
              reg38 <= (reg33 ? $unsigned(reg33) : reg31[(4'h8):(1'h1)]);
            end
          else
            begin
              reg38 <= (&($signed(((|wire6) == (reg38 ? reg37 : (8'hb1)))) ?
                  ($unsigned(wire29[(5'h10):(1'h0)]) ?
                      (^(8'h9f)) : wire9) : reg33));
              reg39 <= ((8'hb8) ?
                  $unsigned(((wire10[(2'h2):(2'h2)] ?
                          (-(8'hb2)) : $signed(reg35)) ?
                      $unsigned((reg37 ?
                          wire6 : (8'hb8))) : $unsigned((^~(8'haa))))) : (+wire29[(5'h13):(3'h7)]));
              reg40 <= {(reg30[(4'hb):(4'ha)] ?
                      reg36[(3'h4):(1'h0)] : (wire6[(2'h2):(2'h2)] ?
                          ((reg37 ? (8'ha3) : wire7) ?
                              (reg33 > wire29) : reg31[(4'hb):(4'h9)]) : ($unsigned(wire28) || (wire7 ?
                              wire6 : wire27)))),
                  wire27};
            end
          reg41 <= (~|$signed($signed(($unsigned((8'hac)) != reg38))));
          reg42 <= $signed($signed(wire10[(2'h3):(1'h0)]));
          reg43 <= wire8[(4'he):(4'hc)];
        end
      else
        begin
          reg38 <= $unsigned((8'hb0));
          reg39 <= {($unsigned((~|$signed(wire29))) ?
                  ((7'h42) << (-$unsigned(reg41))) : $signed($unsigned(((8'haf) & reg40))))};
        end
    end
  always
    @(posedge clk) begin
      reg44 <= (({reg33[(1'h0):(1'h0)],
          (wire28 ?
              (^reg30) : (reg39 ?
                  (8'ha9) : reg34))} != $unsigned((8'hac))) >> wire6[(2'h3):(1'h0)]);
      reg45 <= $signed($unsigned($signed((~^(~wire28)))));
    end
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire12[(1'h0):(1'h0)];
      reg18 <= $signed((8'haf));
    end
  assign wire19 = (({(~wire16[(4'h8):(1'h1)])} > ((^wire15[(2'h2):(1'h0)]) && (wire16[(4'hf):(4'hf)] <<< $signed((8'ha9))))) < $unsigned((8'hbe)));
  assign wire20 = (((wire13[(1'h0):(1'h0)] ~^ $unsigned($signed(wire12))) <= wire16[(3'h6):(1'h0)]) ?
                      ((wire19 >> $signed({(8'ha2)})) ?
                          ($unsigned(wire12[(2'h3):(2'h2)]) >>> wire15[(2'h2):(1'h0)]) : $unsigned((^wire12))) : $signed(($signed($signed(wire15)) ?
                          (7'h40) : reg17[(3'h5):(1'h0)])));
  assign wire21 = ((&(((!(8'hb5)) ?
                      ((8'ha3) ? reg17 : wire13) : {wire19,
                          wire19}) - $unsigned({wire19}))) * (((^~wire12) == (&(wire13 >>> wire20))) ?
                      (((wire12 ? wire16 : wire20) != reg18[(3'h5):(3'h4)]) ?
                          {$signed(wire20)} : $unsigned(wire15)) : {{wire20[(4'hb):(4'h8)]}}));
  assign wire22 = ((((&(wire14 - wire20)) & $signed($signed(wire20))) ?
                          {(8'h9e), wire15[(1'h0):(1'h0)]} : wire21) ?
                      {$signed($signed(wire16))} : (!($unsigned(wire20[(5'h10):(4'hd)]) >>> {$signed((8'hac)),
                          (wire19 ? (8'hb5) : (8'hb1))})));
  assign wire23 = $unsigned(({((8'hb3) <<< $signed(wire16))} ?
                      wire16 : $unsigned((~{wire22}))));
  assign wire24 = wire20[(3'h4):(2'h2)];
endmodule
