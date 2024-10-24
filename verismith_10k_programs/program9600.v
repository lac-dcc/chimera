module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h26a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire18;
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire40,
                 wire39,
                 wire38,
                 wire22,
                 wire21,
                 wire20,
                 wire4,
                 wire5,
                 wire18,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg58,
                 reg57,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg37,
                 reg36,
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
                 (1'h0)};
  assign wire4 = (($signed(wire1[(3'h4):(3'h4)]) || (($unsigned((8'hb5)) + wire0) ?
                         ({wire1, wire0} ?
                             wire3 : ((8'hb1) ^ wire3)) : $signed($unsigned((8'h9d))))) ?
                     $signed({(^~(^~wire0)),
                         (wire3 ~^ $signed(wire3))}) : $unsigned((wire1 ?
                         (|(wire2 ? wire2 : wire3)) : wire1)));
  assign wire5 = ((^~(($signed(wire1) ?
                     {wire0} : wire0) ~^ (wire3 >= wire2[(1'h0):(1'h0)]))) != wire0);
  module6 #() modinst19 (.wire7(wire5), .y(wire18), .wire10(wire3), .wire8(wire2), .wire11(wire0), .clk(clk), .wire9(wire1));
  assign wire20 = (&{($unsigned($signed(wire3)) != wire1),
                      $unsigned($signed((wire1 ? wire0 : wire0)))});
  assign wire21 = (&wire0);
  assign wire22 = (wire1 == ((wire18 != $signed((|wire4))) ?
                      ($signed({wire1, wire1}) ?
                          wire18 : $signed(((8'hbd) ?
                              (8'ha8) : wire0))) : wire21));
  always
    @(posedge clk) begin
      reg23 <= wire4[(4'h8):(3'h7)];
      reg24 <= $signed({($signed((wire4 ? (8'hba) : wire4)) | $signed((wire21 ?
              wire5 : reg23))),
          ($unsigned((wire4 <<< wire2)) > (8'hb5))});
      if ({wire3})
        begin
          if (((($unsigned($signed(reg23)) ?
                  ((wire18 >>> (8'hbf)) ?
                      $unsigned((8'hb1)) : $signed(wire20)) : ($unsigned(reg23) ?
                      (wire20 ? wire3 : wire5) : (|wire2))) ?
              wire18 : (wire20[(3'h5):(2'h2)] >>> wire1)) <<< {(!wire20),
              wire2}))
            begin
              reg25 <= reg24;
              reg26 <= (8'hb8);
            end
          else
            begin
              reg25 <= $unsigned((8'ha5));
              reg26 <= (wire22 ?
                  {$signed(($unsigned(wire0) ?
                          wire22[(5'h11):(4'h9)] : wire18)),
                      wire21} : $unsigned({reg24,
                      $unsigned(wire4[(4'hf):(4'h8)])}));
              reg27 <= wire4[(5'h13):(3'h5)];
            end
          reg28 <= reg26;
        end
      else
        begin
          reg25 <= reg24;
        end
      reg29 <= (-$signed(wire21));
      if (wire21)
        begin
          reg30 <= {wire4};
        end
      else
        begin
          reg30 <= (^~$unsigned((|(8'hae))));
          reg31 <= $signed(((^$signed((reg27 ? wire18 : wire4))) ?
              wire2 : {((reg29 ? reg25 : reg24) * {wire0}),
                  (~|wire21[(1'h1):(1'h1)])}));
          reg32 <= ($signed(({$unsigned((7'h43))} ?
              {reg30[(3'h5):(2'h3)]} : reg31[(1'h1):(1'h1)])) >>> $unsigned($signed($signed((8'had)))));
          if (($signed(($unsigned($signed(reg32)) ?
              reg29[(4'h8):(3'h6)] : (~|$unsigned(wire1)))) <<< reg28))
            begin
              reg33 <= ((~reg29) ?
                  wire5[(3'h4):(2'h2)] : ((-($signed(wire2) ?
                          $unsigned((8'hba)) : wire20[(2'h2):(1'h0)])) ?
                      (-(|$signed((8'hba)))) : $signed((wire1 || reg26))));
              reg34 <= $unsigned(reg32[(2'h3):(1'h0)]);
            end
          else
            begin
              reg33 <= (~wire20);
              reg34 <= wire20[(1'h1):(1'h1)];
              reg35 <= $unsigned($unsigned((|($unsigned(reg30) || reg33[(1'h0):(1'h0)]))));
              reg36 <= $signed($unsigned(($unsigned(reg27[(3'h7):(3'h5)]) | reg33[(2'h2):(1'h1)])));
              reg37 <= $unsigned(($unsigned({(!wire21),
                  (!reg28)}) <<< $unsigned($unsigned((wire3 ?
                  reg34 : reg31)))));
            end
        end
    end
  assign wire38 = $signed(wire5[(4'hd):(3'h5)]);
  assign wire39 = wire5[(1'h0):(1'h0)];
  assign wire40 = $unsigned(wire4);
  always
    @(posedge clk) begin
      reg41 <= $signed($unsigned(wire0));
      reg42 <= reg27;
      if ((wire2 ?
          (^~(+(~reg23[(3'h5):(1'h1)]))) : (~|((wire2 >= ((8'haa) ?
              reg34 : (8'ha6))) ~^ reg32[(5'h11):(4'he)]))))
        begin
          if (($unsigned((($signed(wire4) + reg33[(1'h0):(1'h0)]) <<< (|(7'h44)))) ?
              wire4 : (reg33 ?
                  $unsigned($signed((reg29 ?
                      wire38 : wire40))) : (reg24 + ((reg24 <<< wire4) || (reg23 ?
                      reg42 : wire22))))))
            begin
              reg43 <= $unsigned((!reg31[(2'h2):(2'h2)]));
              reg44 <= $signed((|$signed(reg37)));
              reg45 <= ($unsigned((^~reg26[(2'h2):(2'h2)])) ?
                  $signed((($signed((8'hbc)) ? $signed((8'ha4)) : (+reg33)) ?
                      (+$unsigned((8'ha7))) : reg35[(2'h3):(2'h3)])) : $unsigned(wire20));
              reg46 <= $unsigned((({$signed(reg34),
                  reg31[(1'h0):(1'h0)]} || reg30) <<< $unsigned($signed((+reg33)))));
            end
          else
            begin
              reg43 <= $signed((~^$unsigned($unsigned((wire40 | wire2)))));
              reg44 <= (wire39 <= {((8'hb2) && (-{wire2})),
                  ((~wire0[(4'hd):(2'h2)]) | ($signed(reg32) == wire40[(3'h7):(3'h7)]))});
            end
          if ($signed($unsigned($signed((&reg42)))))
            begin
              reg47 <= (~&(wire22 ?
                  {((reg43 ? reg31 : reg27) ^ (reg33 ?
                          reg34 : wire18))} : $signed((~|wire21[(1'h1):(1'h0)]))));
              reg48 <= reg24[(1'h1):(1'h1)];
              reg49 <= (8'hb6);
            end
          else
            begin
              reg47 <= reg41[(5'h12):(4'h9)];
              reg48 <= ($signed($unsigned((~(8'ha2)))) ?
                  (8'hbe) : reg45[(2'h3):(1'h0)]);
              reg49 <= $signed((($signed($unsigned(wire2)) ?
                      (((8'ha6) == wire38) ^~ (wire22 ?
                          reg34 : (8'hb9))) : $unsigned(reg48[(3'h6):(3'h5)])) ?
                  (8'hb1) : (((reg30 ? reg32 : reg37) <<< {reg35}) ?
                      $signed($unsigned(reg31)) : $signed((~|wire1)))));
              reg50 <= $unsigned($unsigned({((+wire21) <<< (reg26 ?
                      reg24 : (8'hb1)))}));
            end
          if (($signed(($signed(((8'hb7) < reg47)) || (~(reg33 < reg31)))) ?
              ((^~$signed({wire21, (8'hbc)})) * ($unsigned(wire3) ?
                  ((reg50 != (8'hb4)) < $signed(reg33)) : {reg33})) : $unsigned($unsigned(((+reg33) >> reg25)))))
            begin
              reg51 <= wire40[(1'h1):(1'h1)];
              reg52 <= reg50[(1'h0):(1'h0)];
            end
          else
            begin
              reg51 <= (reg47 * {reg29[(4'hb):(4'h8)], wire20[(3'h4):(2'h3)]});
            end
          reg53 <= wire38[(1'h0):(1'h0)];
        end
      else
        begin
          if ({((^~wire4) >> (8'had))})
            begin
              reg43 <= $unsigned((~($signed($unsigned(reg51)) ?
                  {$unsigned(wire20), $signed(reg50)} : reg43)));
              reg44 <= {(wire20 ^~ reg30[(1'h1):(1'h1)]),
                  ($signed($unsigned($unsigned(reg44))) ?
                      $unsigned(((-reg25) ?
                          (reg25 || wire3) : (wire18 ?
                              (8'ha2) : wire21))) : $signed({wire2}))};
            end
          else
            begin
              reg43 <= ({$unsigned((wire2[(3'h6):(3'h5)] ?
                          (reg45 * reg43) : reg37)),
                      reg34} ?
                  reg25 : $signed($unsigned({$signed(reg41)})));
              reg44 <= (($unsigned((~^{(7'h42),
                      (8'hb6)})) ^~ (reg27[(4'hd):(1'h0)] || ((wire4 ?
                      wire20 : reg25) << $unsigned(reg26)))) ?
                  ((reg35 ?
                      wire20 : {$signed(reg44), $signed(reg30)}) >> (reg27 ?
                      reg51 : (|(wire40 ^~ reg41)))) : ({{(reg36 <= reg53),
                              (reg30 ? wire4 : reg27)},
                          (8'h9d)} ?
                      (!$unsigned(wire0[(4'hf):(4'ha)])) : (^(^$signed(reg32)))));
            end
          if ({((reg34[(2'h2):(2'h2)] ?
                  (8'haf) : reg29) ^ ((8'hb7) - (&(reg49 - reg51)))),
              $unsigned(($unsigned({(7'h41)}) ^~ (!(8'haf))))})
            begin
              reg45 <= (-reg47[(3'h4):(2'h2)]);
              reg46 <= ($unsigned($unsigned(reg23)) && $signed(reg47[(4'hc):(4'hb)]));
              reg47 <= wire2[(3'h6):(3'h5)];
              reg48 <= $unsigned(((8'hbb) ?
                  (($unsigned(wire18) ?
                      $signed(reg37) : (reg37 ?
                          wire20 : (8'hb0))) || $unsigned(reg45[(3'h5):(2'h2)])) : (8'ha7)));
              reg49 <= $signed({$signed(wire18[(2'h2):(2'h2)])});
            end
          else
            begin
              reg45 <= (~|(~^(^$unsigned($signed(reg25)))));
              reg46 <= ((&reg44[(4'hb):(4'ha)]) ?
                  $signed((reg53[(4'hf):(3'h6)] ?
                      ($unsigned(wire38) >= $signed(reg25)) : $unsigned(reg32))) : ((^~$signed(wire39[(2'h3):(1'h1)])) ?
                      {(wire18[(1'h1):(1'h0)] ^~ (reg30 < wire20))} : wire18));
              reg47 <= wire40[(3'h7):(2'h2)];
            end
          reg50 <= ((~^$unsigned(wire3[(4'h9):(4'h9)])) ?
              wire3[(4'hc):(4'h8)] : ((($unsigned(wire18) && {reg49}) ?
                      reg44 : (8'hac)) ?
                  reg32 : (-{(reg53 ? (8'h9f) : reg28)})));
          reg51 <= wire2[(2'h3):(1'h0)];
        end
      reg54 <= reg35;
    end
  assign wire55 = (8'hae);
  assign wire56 = reg49[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg57 <= (((^(~|(-(8'hab)))) ?
              $signed($unsigned($unsigned(reg45))) : $unsigned((&$unsigned(wire2)))) ?
          reg46[(3'h5):(2'h3)] : ($signed($signed((-reg25))) == reg23));
      reg58 <= {$unsigned({(~|{reg47, (8'hbb)}),
              $signed(wire3[(2'h2):(2'h2)])})};
    end
  assign wire59 = ($unsigned(wire18[(1'h1):(1'h1)]) ?
                      wire38 : ($unsigned(((reg58 && reg25) < (wire38 >>> reg57))) ?
                          $signed({(reg54 ? reg27 : (8'haa)),
                              $signed(reg34)}) : $signed(reg29)));
  assign wire60 = (reg57[(2'h2):(1'h1)] == ($signed(($signed(reg58) ?
                          (wire59 ? (8'had) : wire4) : reg23[(3'h7):(3'h5)])) ?
                      $unsigned((+(^~wire39))) : {$unsigned($signed((8'haf))),
                          reg34[(2'h2):(1'h1)]}));
  assign wire61 = $unsigned(reg37[(2'h2):(1'h1)]);
  assign wire62 = $unsigned((~^$unsigned(((8'hbe) ?
                      $signed(reg31) : $signed(reg42)))));
  assign wire63 = ($unsigned({{reg57[(3'h6):(2'h2)], $unsigned(wire59)}}) ?
                      (7'h41) : {$unsigned(reg31)});
  assign wire64 = (~&$unsigned(wire18[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg65 <= reg42;
      reg66 <= $unsigned($signed(reg41));
      if (((($signed(reg37[(3'h4):(2'h2)]) + ((8'hbd) ?
                  reg50 : ((8'ha1) * wire18))) ?
              reg49 : $unsigned({(~^reg44), (~|wire61)})) ?
          wire60[(3'h4):(1'h0)] : reg33[(2'h2):(1'h0)]))
        begin
          reg67 <= (((~|($unsigned(reg25) ? {reg28} : reg54)) ?
              (|$signed($unsigned(reg65))) : wire3) + (reg58[(2'h3):(1'h1)] | (8'ha9)));
          reg68 <= reg33[(1'h1):(1'h0)];
        end
      else
        begin
          reg67 <= reg67[(3'h7):(3'h6)];
          reg68 <= reg24;
        end
      if ($signed((((reg65 >>> reg45[(2'h3):(2'h2)]) ?
              {(-(7'h41)), $unsigned(wire40)} : {{wire63}, {wire2, reg27}}) ?
          (($signed(wire5) >> $unsigned(reg41)) ?
              $unsigned((reg48 >>> reg23)) : (~^$signed(wire55))) : reg47)))
        begin
          reg69 <= (8'ha4);
        end
      else
        begin
          reg69 <= $signed(($signed(reg28[(2'h3):(1'h0)]) >> reg51[(2'h3):(1'h0)]));
          reg70 <= $unsigned(((!$signed(((7'h42) ?
              (8'hb5) : wire39))) != wire38));
          if ($unsigned(wire22))
            begin
              reg71 <= wire62[(1'h0):(1'h0)];
              reg72 <= reg70;
              reg73 <= $unsigned((~^{reg34,
                  ((reg50 ? (8'hb8) : reg23) || (+wire20))}));
              reg74 <= ($signed(wire18) != $unsigned($unsigned(((|reg34) >>> (reg44 <= (8'ha5))))));
            end
          else
            begin
              reg71 <= {$unsigned({$signed($signed((8'hb9))),
                      ($signed(reg74) ?
                          ((8'hb2) ? wire18 : reg35) : $signed(wire20))}),
                  $signed(wire62)};
            end
          reg75 <= ({(wire55[(1'h1):(1'h1)] ^~ (reg30[(4'hc):(1'h0)] ?
                  (reg32 ? reg41 : reg32) : (~|(8'hbc)))),
              reg74} < reg57);
        end
    end
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  assign y = {wire17, wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = wire8[(3'h5):(3'h5)];
  assign wire13 = ((+$signed($unsigned($signed(wire8)))) ?
                      $unsigned((wire11 ?
                          (8'ha4) : (wire11 ^~ (wire9 ^~ wire12)))) : (($signed((-wire9)) ?
                              (wire8 - ((8'hbd) < wire11)) : wire8) ?
                          wire11 : wire7[(2'h2):(2'h2)]));
  assign wire14 = ((~|wire10[(4'hf):(3'h5)]) ? (8'hac) : $unsigned({wire11}));
  assign wire15 = wire12;
  assign wire16 = ((~^wire10[(4'hc):(4'h8)]) == ($signed(((wire7 <= wire10) != {wire7,
                          wire11})) ?
                      $signed({{wire10}}) : $unsigned({((8'haa) ^~ wire7)})));
  assign wire17 = (~^(^~(^wire13)));
endmodule
