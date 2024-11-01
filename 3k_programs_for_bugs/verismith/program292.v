module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire223;
  wire signed [(5'h13):(1'h0)] wire222;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire218;
  wire [(4'hc):(1'h0)] wire225;
  wire signed [(4'ha):(1'h0)] wire227;
  wire [(4'hc):(1'h0)] wire228;
  reg signed [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg221 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire37,
                 wire38,
                 wire218,
                 wire225,
                 wire227,
                 wire228,
                 reg226,
                 reg221,
                 reg220,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((^{wire0}) ~^ $unsigned($signed(wire1))) ^~ $signed($signed(((~wire1) <= wire3[(4'hb):(3'h7)]))));
      reg5 <= ((|(8'hb7)) <<< (+$unsigned({(wire2 >= (8'h9e)), (+wire3)})));
      reg6 <= wire2[(1'h0):(1'h0)];
      reg7 <= $unsigned((8'hb6));
      if (wire2[(1'h1):(1'h0)])
        begin
          reg8 <= {$signed(wire2[(3'h4):(2'h2)])};
          reg9 <= reg6[(3'h4):(2'h3)];
          reg10 <= (&$unsigned(wire3));
          reg11 <= $signed($unsigned({(|(wire3 ? reg4 : reg8)),
              {(reg6 | wire1), (reg5 < wire0)}}));
        end
      else
        begin
          reg8 <= wire1;
          reg9 <= (((~|wire3) - ((reg7[(3'h7):(3'h7)] <<< $unsigned(reg6)) ?
                  wire2[(3'h6):(3'h6)] : (~$signed(reg10)))) ?
              $signed((($signed(reg8) || reg8) && (^((7'h44) != reg11)))) : (-$unsigned(($unsigned(reg7) ?
                  $unsigned(reg8) : (reg11 ? wire1 : wire2)))));
          if ((reg9 ?
              (-$signed(reg10)) : ($signed((^~(reg7 >> wire1))) ?
                  {{$signed((8'ha9))},
                      {{reg6}, {wire3, reg8}}} : $signed($unsigned(reg7)))))
            begin
              reg10 <= ($signed({($unsigned(reg8) ?
                          ((8'hb3) > reg10) : $unsigned(reg10))}) ?
                  reg5 : $unsigned((8'hbe)));
              reg11 <= ((~wire1) ^~ ({$unsigned((~&reg5))} ?
                  reg10 : $unsigned({(reg9 ? wire3 : reg9)})));
            end
          else
            begin
              reg10 <= reg9;
              reg11 <= wire0[(3'h4):(1'h0)];
            end
        end
    end
  assign wire12 = (8'hb0);
  assign wire13 = $signed(((reg5 ~^ $signed((reg10 ? wire12 : wire2))) ?
                      (&{(reg7 ? reg7 : reg7)}) : {(((8'ha6) ^ reg10) ?
                              $unsigned(wire1) : reg7[(1'h1):(1'h1)]),
                          (~&(^~wire1))}));
  assign wire14 = (reg9 | reg7);
  assign wire15 = $signed(reg11);
  assign wire16 = $signed($signed(wire12));
  always
    @(posedge clk) begin
      reg17 <= wire2[(2'h2):(2'h2)];
      if (($signed((!{reg7})) ? (~(reg11 + (!(^(8'ha7))))) : wire0))
        begin
          reg18 <= wire1;
          if ({(&{((wire16 ^~ reg10) ^ (wire14 ? reg5 : reg10)),
                  (&$signed(reg7))}),
              ($unsigned($signed(reg17[(2'h2):(1'h1)])) || wire13)})
            begin
              reg19 <= $signed((~^$signed((~(7'h44)))));
              reg20 <= reg6[(3'h6):(3'h6)];
            end
          else
            begin
              reg19 <= $unsigned(({$unsigned((reg8 ?
                      wire0 : reg18))} >> $unsigned(((wire14 ? reg8 : reg6) ?
                  $signed(reg18) : wire1[(2'h3):(2'h3)]))));
              reg20 <= $signed((reg18[(5'h11):(5'h10)] ?
                  $unsigned((wire3 ?
                      $signed((8'ha9)) : {reg11})) : (((reg19 >= reg10) >>> reg4) ?
                      ((&wire1) < wire2[(3'h5):(1'h1)]) : ((^reg6) ?
                          wire0[(4'hf):(4'hf)] : (~reg6)))));
              reg21 <= {(($signed($signed(reg10)) ?
                      $unsigned($unsigned((8'hbf))) : ($signed(reg4) ?
                          $unsigned(reg8) : $unsigned(reg8))) <<< $signed($unsigned((+reg6))))};
              reg22 <= wire14;
              reg23 <= ((wire15[(4'hc):(1'h0)] ?
                      (reg6[(2'h2):(1'h1)] || reg5[(2'h2):(1'h1)]) : $unsigned((-$signed(wire2)))) ?
                  reg22[(3'h5):(2'h3)] : reg7);
            end
          reg24 <= reg8;
        end
      else
        begin
          reg18 <= (($signed($signed(wire13[(2'h2):(1'h1)])) != reg9) <<< wire2[(3'h4):(2'h3)]);
          if ((reg21 * $unsigned((-$signed((&wire2))))))
            begin
              reg19 <= $signed(wire13[(2'h2):(1'h0)]);
              reg20 <= $unsigned(($unsigned($unsigned((reg11 + (7'h40)))) <<< (^(~&(reg24 ?
                  (8'h9c) : wire3)))));
            end
          else
            begin
              reg19 <= ($unsigned($signed((^~(reg21 ? wire13 : wire13)))) ?
                  ($unsigned(({reg19} ?
                      (reg24 >> reg7) : $signed(wire12))) >>> wire15[(4'he):(4'hc)]) : reg8);
              reg20 <= ($signed((((~|reg21) ?
                  (&reg4) : $signed(reg18)) && (wire14 ?
                  $signed(wire0) : (wire0 ?
                      wire14 : (8'h9e))))) < $unsigned($signed(($signed(reg18) ?
                  reg11[(5'h15):(5'h12)] : wire0[(4'h8):(1'h1)]))));
              reg21 <= $unsigned($unsigned(reg8[(5'h10):(3'h6)]));
              reg22 <= ($signed(reg8[(5'h10):(4'ha)]) ?
                  wire16[(1'h1):(1'h1)] : ({$unsigned((-reg19))} ?
                      (reg7[(3'h6):(3'h5)] ?
                          $signed((&reg21)) : ((^~reg7) & reg5[(2'h2):(1'h0)])) : ($signed((~|reg10)) & $signed((+wire1)))));
              reg23 <= $unsigned((($signed(wire0[(2'h3):(1'h0)]) ?
                  $unsigned({reg4,
                      (8'ha7)}) : $signed((8'h9d))) > (~&$unsigned(wire12[(2'h2):(1'h1)]))));
            end
          reg24 <= ((&$unsigned((((8'ha3) | reg22) ~^ {wire2}))) ?
              $unsigned(reg7[(3'h4):(3'h4)]) : wire3);
          reg25 <= $signed(wire12[(4'h9):(3'h6)]);
          reg26 <= $unsigned(reg11[(4'hb):(4'h9)]);
        end
      reg27 <= ((^~(8'hb9)) ?
          ($unsigned($unsigned((reg6 ? wire1 : reg11))) ?
              $signed(wire16) : $unsigned($signed($unsigned(reg6)))) : {$unsigned(((-reg22) ?
                  (reg24 ? wire15 : reg10) : reg25)),
              $signed((~|(&reg23)))});
      reg28 <= (8'ha7);
      if (($signed(reg5) ? $signed((|reg25[(2'h2):(1'h1)])) : (~|reg4)))
        begin
          reg29 <= (reg11 ?
              reg27 : (^($signed(reg23[(2'h3):(1'h0)]) ?
                  $signed(reg6[(2'h3):(1'h0)]) : $unsigned((-(8'hac))))));
          if ($signed((((!$unsigned(reg19)) * reg20[(1'h0):(1'h0)]) * (wire16 ^ ((wire0 && wire2) != (reg10 ?
              reg27 : reg7))))))
            begin
              reg30 <= wire13;
              reg31 <= $unsigned((wire15[(5'h11):(2'h3)] ?
                  $unsigned($unsigned($signed(wire2))) : (+reg25)));
              reg32 <= $unsigned($unsigned(reg21[(3'h6):(3'h4)]));
              reg33 <= $signed(reg26);
              reg34 <= (8'hb2);
            end
          else
            begin
              reg30 <= (($signed(reg24) ? (~^reg9[(1'h1):(1'h0)]) : (8'hb8)) ?
                  (^~((reg9[(1'h0):(1'h0)] > $signed((8'hb5))) <= {$unsigned((8'h9c)),
                      ((8'ha5) ?
                          reg10 : reg17)})) : $signed((&(!$unsigned(reg6)))));
              reg31 <= $signed($signed((($unsigned(reg18) ?
                  $signed(reg23) : $signed(wire1)) || reg24[(2'h3):(2'h2)])));
              reg32 <= (&(~|$unsigned((^~reg7))));
            end
          reg35 <= wire2;
          reg36 <= reg26[(4'ha):(2'h3)];
        end
      else
        begin
          reg29 <= $unsigned((((|(-reg18)) == {(8'hb9)}) ?
              $signed((&$unsigned(reg18))) : ((~|(reg29 ~^ wire15)) ?
                  $unsigned((reg33 && reg19)) : wire1)));
          reg30 <= $unsigned(reg10[(2'h2):(1'h1)]);
          reg31 <= reg17;
          if (reg23)
            begin
              reg32 <= $unsigned($unsigned({($unsigned(wire15) != (8'h9e))}));
              reg33 <= $signed($unsigned({(reg6[(2'h2):(1'h0)] <<< (reg26 ?
                      reg25 : wire1)),
                  reg25}));
            end
          else
            begin
              reg32 <= $unsigned((8'hae));
            end
        end
    end
  assign wire37 = (+reg26[(2'h3):(2'h3)]);
  assign wire38 = reg31;
  always
    @(posedge clk) begin
      if ({$unsigned({wire1[(3'h4):(3'h4)]})})
        begin
          reg39 <= $unsigned($unsigned((~|($unsigned(reg23) ?
              (wire2 ? (8'ha2) : wire2) : (8'ha8)))));
        end
      else
        begin
          if ((8'h9c))
            begin
              reg39 <= $signed(wire2);
              reg40 <= ($signed((8'hb9)) >= $signed($unsigned((~(wire12 ?
                  reg28 : reg28)))));
              reg41 <= (~({reg17[(3'h4):(2'h2)]} ?
                  (^~$signed($signed((8'ha3)))) : (!reg25[(2'h2):(1'h0)])));
              reg42 <= reg21[(3'h7):(3'h5)];
              reg43 <= reg25[(2'h3):(1'h0)];
            end
          else
            begin
              reg39 <= (8'had);
            end
          reg44 <= (((^~reg30) | ($signed($unsigned(reg39)) ?
              (&(wire1 || reg24)) : (reg4 ?
                  wire15 : (~^reg6)))) ^~ ((8'ha6) <= reg29[(1'h0):(1'h0)]));
          if (($signed($signed($signed((reg8 <<< reg27)))) ?
              {{reg10[(4'ha):(4'ha)]}, reg26[(3'h5):(1'h0)]} : reg4))
            begin
              reg45 <= (&((((wire14 ?
                  reg33 : wire2) < $signed(reg35)) <<< reg34) != $unsigned($unsigned($signed(wire12)))));
            end
          else
            begin
              reg45 <= wire1;
              reg46 <= $unsigned((reg25 ?
                  $signed((reg31[(3'h4):(1'h0)] ?
                      reg9 : reg23)) : reg42[(3'h6):(3'h4)]));
            end
          reg47 <= wire12;
          reg48 <= (+reg35);
        end
      reg49 <= reg30[(5'h14):(1'h0)];
    end
  module50 #() modinst219 (.wire53(reg41), .wire54(wire3), .wire51(reg45), .y(wire218), .wire55(reg39), .wire52(reg8), .clk(clk));
  always
    @(posedge clk) begin
      reg220 <= ($unsigned($unsigned(reg19)) <= (reg25 <= $unsigned((+$signed(reg24)))));
      reg221 <= wire1[(2'h3):(2'h3)];
    end
  assign wire222 = {reg24};
  module122 #() modinst224 (wire223, clk, wire0, wire222, reg31, reg45, wire38);
  assign wire225 = (+{{(((8'hb6) ? reg41 : (8'hb9)) < wire0[(4'hf):(2'h3)])}});
  always
    @(posedge clk) begin
      reg226 <= reg25;
    end
  assign wire227 = reg23;
  module50 #() modinst229 (.wire53(reg220), .clk(clk), .y(wire228), .wire52(wire12), .wire54(reg40), .wire55(reg6), .wire51(reg11));
endmodule

module module50
#(parameter param216 = {{((((8'hba) ? (7'h42) : (8'haf)) << ((8'hb8) == (8'h9f))) ? (~^(^~(8'ha1))) : ({(8'h9d)} ? ((8'ha6) <<< (8'hba)) : ((8'ha1) ? (8'hbb) : (8'hac)))), {(~{(7'h44), (8'ha6)}), (((8'had) << (8'haf)) ? ((8'haa) & (7'h44)) : ((8'h9e) << (8'ha9)))}}, ((~((8'hbb) | ((8'hb1) ? (8'ha6) : (8'h9f)))) + (8'ha8))}, 
parameter param217 = param216)
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  input wire signed [(3'h6):(1'h0)] wire53;
  input wire [(4'hd):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire214;
  wire signed [(5'h15):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire192;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  wire signed [(3'h7):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(2'h3):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(4'hd):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire169;
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire214,
                 wire202,
                 wire192,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire172,
                 wire171,
                 wire120,
                 wire80,
                 wire79,
                 wire78,
                 wire169,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg175,
                 reg174,
                 reg173,
                 reg77,
                 reg76,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed($signed((8'h9f))) & (8'hb8)))
        begin
          reg56 <= wire55;
          if ((~|wire54[(3'h7):(3'h7)]))
            begin
              reg57 <= {$unsigned(wire54[(2'h2):(2'h2)])};
              reg58 <= $unsigned(reg57);
              reg59 <= wire52[(2'h2):(2'h2)];
              reg60 <= (reg56 < wire53);
              reg61 <= $signed($signed($signed({(8'hbc),
                  (wire54 == (7'h40))})));
            end
          else
            begin
              reg57 <= $unsigned(reg60[(5'h10):(4'he)]);
              reg58 <= reg59[(4'h8):(2'h3)];
            end
          if (wire51[(4'h8):(4'h8)])
            begin
              reg62 <= reg57[(1'h1):(1'h1)];
              reg63 <= $unsigned(((((8'h9f) ?
                      $unsigned(reg61) : (wire51 ?
                          reg57 : wire51)) & $unsigned($unsigned(reg60))) ?
                  ((reg61 ? (^~reg62) : (~reg56)) ?
                      $signed((wire55 ~^ reg57)) : (!(reg57 != reg60))) : (reg56 ?
                      {$signed(wire54)} : (|(~^(8'hb7))))));
              reg64 <= (reg62[(2'h3):(1'h0)] & $unsigned($unsigned($unsigned((+reg58)))));
              reg65 <= reg61[(1'h0):(1'h0)];
              reg66 <= $signed($signed($unsigned(wire53[(2'h2):(1'h1)])));
            end
          else
            begin
              reg62 <= (reg61[(3'h6):(2'h3)] ?
                  (|$unsigned($unsigned(reg59[(3'h6):(3'h5)]))) : $signed(wire54));
              reg63 <= reg65;
              reg64 <= (wire53 ?
                  $unsigned($signed((8'hbb))) : ((wire51 != {reg60[(3'h5):(2'h2)],
                          wire52}) ?
                      (wire53[(3'h6):(1'h1)] ?
                          (8'hbb) : reg66[(5'h13):(3'h6)]) : $signed({(reg66 == reg63),
                          $unsigned(reg65)})));
            end
          if ($unsigned((^$signed($signed({reg64, wire54})))))
            begin
              reg67 <= reg64[(4'ha):(1'h1)];
              reg68 <= {reg62,
                  $signed(($unsigned((~&reg62)) ?
                      ((wire54 ? reg62 : reg66) - (-reg62)) : reg63))};
              reg69 <= ($unsigned(reg56[(1'h1):(1'h1)]) ?
                  (reg56[(1'h0):(1'h0)] >> $unsigned(({(8'hbf), reg67} ?
                      (^wire51) : {reg66, (8'hbe)}))) : reg63);
            end
          else
            begin
              reg67 <= (wire53 == reg69);
            end
          if (wire52)
            begin
              reg70 <= wire55[(4'hd):(4'hc)];
              reg71 <= (~|$unsigned((~((wire51 && reg65) && (~&(8'haa))))));
              reg72 <= reg66;
              reg73 <= $unsigned((~|{{(reg57 ? reg64 : reg65),
                      wire51[(3'h6):(2'h2)]},
                  reg62[(3'h7):(2'h3)]}));
            end
          else
            begin
              reg70 <= (|{$signed((|(reg59 ? wire55 : reg62))),
                  $unsigned(reg56[(1'h1):(1'h0)])});
              reg71 <= wire55;
              reg72 <= ({(^$unsigned((|reg56))),
                  {(wire51 ? ((8'hac) ^~ (8'hb9)) : $unsigned(reg65)),
                      ($signed(reg64) ?
                          reg59[(4'h8):(1'h0)] : (reg57 ?
                              reg70 : reg61))}} == reg61);
              reg73 <= reg63[(3'h7):(3'h7)];
              reg74 <= $signed(wire52);
            end
        end
      else
        begin
          reg56 <= $signed(($signed(((reg71 < reg65) > (|reg60))) ^ $unsigned($unsigned($signed(reg58)))));
          reg57 <= wire53[(3'h4):(2'h2)];
          reg58 <= reg68;
          reg59 <= (((~(reg67[(3'h5):(3'h5)] > $signed(reg74))) ?
                  (~|reg56) : {($unsigned(wire54) ?
                          (reg66 << (8'hac)) : ((7'h43) ? reg64 : reg73)),
                      ($signed((8'ha4)) & reg72)}) ?
              reg59[(3'h7):(2'h2)] : ($signed((~reg71[(1'h0):(1'h0)])) ?
                  (reg66 * (reg63[(4'h9):(2'h2)] ?
                      (reg61 ?
                          (8'ha8) : reg65) : (wire52 != wire54))) : reg65[(1'h0):(1'h0)]));
        end
      reg75 <= $unsigned((-((wire51[(4'ha):(4'h8)] ?
          wire53 : (reg65 ? reg62 : reg56)) <= $unsigned($unsigned(reg61)))));
      reg76 <= wire55;
      reg77 <= $signed(wire55[(5'h15):(4'hc)]);
    end
  assign wire78 = $unsigned(((reg58[(1'h0):(1'h0)] ?
                          $signed((reg62 != reg70)) : $signed({reg71})) ?
                      $unsigned((!(reg59 >> (8'hb5)))) : reg59[(2'h2):(1'h0)]));
  assign wire79 = ((+((8'h9c) >= (-{wire52}))) || (~(|reg58)));
  assign wire80 = $signed(((+$signed((reg71 ?
                      (7'h44) : (8'had)))) ^ wire53[(3'h4):(1'h1)]));
  module81 #() modinst121 (wire120, clk, reg70, reg73, reg72, wire55, reg60);
  module122 #() modinst170 (wire169, clk, reg70, wire54, wire79, reg77, wire120);
  assign wire171 = reg62[(3'h5):(3'h4)];
  assign wire172 = reg58;
  always
    @(posedge clk) begin
      reg173 <= ($signed((~&wire171)) ?
          (wire80 == ((~|{reg63, reg71}) ?
              (-$unsigned(reg61)) : reg63)) : reg62);
      reg174 <= wire169[(3'h4):(1'h0)];
      reg175 <= wire51[(4'h8):(3'h6)];
    end
  assign wire176 = reg59;
  assign wire177 = ($signed((&reg67)) ?
                       $unsigned(reg65) : $signed(($signed($signed(reg61)) ?
                           (reg74 ^ $unsigned((8'ha0))) : reg72)));
  assign wire178 = (($unsigned(reg73) > (~(&((8'hab) ? wire172 : wire54)))) ?
                       ((~^reg62[(2'h3):(2'h3)]) ?
                           reg59[(3'h7):(2'h2)] : (~|($signed((7'h40)) << reg70))) : (((8'ha9) ?
                               reg77 : $unsigned(wire171)) ?
                           $signed(((wire79 & (7'h43)) ?
                               (reg63 & reg76) : ((8'hb1) ?
                                   (8'had) : wire53))) : $unsigned($signed((^(8'ha3))))));
  assign wire179 = ($unsigned(reg174) ? reg76[(1'h0):(1'h0)] : $signed(reg68));
  module180 #() modinst193 (.clk(clk), .wire184(wire80), .y(wire192), .wire182(reg71), .wire183(reg175), .wire181(wire53));
  always
    @(posedge clk) begin
      reg194 <= wire52[(3'h4):(3'h4)];
      if (wire179)
        begin
          reg195 <= wire177;
          reg196 <= (wire192 ?
              ((wire120 ?
                  ((+wire79) < $unsigned(reg68)) : (((8'hbd) ?
                      (8'hb1) : (8'hab)) | reg70[(4'hc):(2'h2)])) <<< (!(7'h42))) : $unsigned(wire80[(4'ha):(2'h3)]));
          reg197 <= $unsigned($unsigned((+($signed(reg66) ?
              (wire54 ? reg71 : wire120) : (reg69 > reg72)))));
          reg198 <= wire78[(2'h2):(1'h1)];
        end
      else
        begin
          reg195 <= $unsigned($unsigned(($signed($signed(wire172)) ?
              $unsigned({reg75, (7'h41)}) : $signed((~|wire171)))));
          if (reg75)
            begin
              reg196 <= $signed(((&{(^reg62), $unsigned((8'hb7))}) ?
                  reg58[(3'h5):(2'h2)] : (^~reg77[(2'h2):(1'h1)])));
              reg197 <= ($unsigned((!($unsigned((8'hb8)) >>> (wire171 ^~ reg61)))) - (!$signed(reg66)));
              reg198 <= wire53;
              reg199 <= reg174;
              reg200 <= {$unsigned($unsigned(wire79))};
            end
          else
            begin
              reg196 <= reg199;
              reg197 <= reg173[(4'hb):(1'h0)];
              reg198 <= (wire79[(3'h5):(2'h2)] << (~^$unsigned(reg174)));
            end
          reg201 <= reg59[(4'ha):(2'h3)];
        end
    end
  assign wire202 = $unsigned((reg195[(3'h4):(1'h0)] ?
                       reg201[(2'h3):(2'h3)] : $signed((wire179 ?
                           (wire171 || reg58) : (wire177 ? reg67 : wire79)))));
  module203 #() modinst215 (.y(wire214), .clk(clk), .wire205(wire202), .wire207(reg63), .wire206(wire176), .wire204(reg198));
endmodule

module module203  (y, clk, wire207, wire206, wire205, wire204);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire207;
  input wire [(3'h5):(1'h0)] wire206;
  input wire signed [(3'h4):(1'h0)] wire205;
  input wire [(3'h6):(1'h0)] wire204;
  wire signed [(4'h9):(1'h0)] wire213;
  wire signed [(4'hf):(1'h0)] wire212;
  wire signed [(5'h12):(1'h0)] wire211;
  wire [(4'ha):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire [(3'h7):(1'h0)] wire208;
  assign y = {wire213, wire212, wire211, wire210, wire209, wire208, (1'h0)};
  assign wire208 = $unsigned($signed(wire206));
  assign wire209 = wire208;
  assign wire210 = (~|$unsigned($unsigned(wire207)));
  assign wire211 = wire209[(3'h6):(1'h1)];
  assign wire212 = wire207[(2'h3):(2'h2)];
  assign wire213 = $signed($unsigned(($unsigned(wire206[(1'h1):(1'h0)]) ?
                       wire204 : {wire206[(2'h2):(1'h1)]})));
endmodule

module module180
#(parameter param191 = ({{({(8'hbb)} ? (!(8'hac)) : ((7'h42) ? (8'ha2) : (7'h44)))}, (((^(8'hac)) + (-(8'h9d))) > {(&(8'hb9))})} ? (({{(8'ha4), (7'h44)}, ((8'hbc) ? (8'hb1) : (8'hae))} & (((8'hab) * (8'hb5)) != ((8'hb3) ? (8'ha6) : (8'hb6)))) ? (^~(~&((8'ha8) ? (7'h41) : (8'haa)))) : ((((8'h9d) ? (8'haf) : (8'hbb)) ~^ (!(7'h43))) ? {(~(7'h43))} : (~&(|(8'h9d))))) : (&(({(8'h9e), (8'hbc)} > ((8'hba) == (8'haa))) != (((8'hb0) ^ (8'h9d)) ? (!(8'hb1)) : ((7'h43) ~^ (8'ha5)))))))
(y, clk, wire184, wire183, wire182, wire181);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire184;
  input wire signed [(4'ha):(1'h0)] wire183;
  input wire signed [(5'h15):(1'h0)] wire182;
  input wire [(3'h5):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire [(4'he):(1'h0)] wire188;
  wire signed [(4'h9):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  assign y = {wire190, wire189, wire188, wire187, wire186, wire185, (1'h0)};
  assign wire185 = (($signed(wire181) & wire183) ?
                       (wire181[(2'h2):(1'h1)] > (~^$signed((+(8'ha4))))) : (8'ha3));
  assign wire186 = wire182;
  assign wire187 = ((8'hb3) ?
                       wire182[(4'ha):(1'h1)] : $signed((|$signed((!wire181)))));
  assign wire188 = (wire184 ?
                       ((wire187 * ($unsigned(wire183) ?
                           $unsigned((8'ha1)) : wire181[(1'h1):(1'h1)])) || (~^((wire184 ?
                           (8'hb2) : wire183) > (~|wire181)))) : (wire183[(2'h2):(1'h1)] & $unsigned((^$signed(wire181)))));
  assign wire189 = {(~^(^~(wire185[(4'hf):(3'h4)] >>> wire186[(4'h9):(4'h8)]))),
                       (+({$signed(wire186)} & (~&$signed(wire188))))};
  assign wire190 = (wire184 ?
                       (+({wire188[(3'h5):(3'h4)],
                           $signed((8'hb2))} >> wire184)) : $signed($unsigned(($unsigned(wire188) <<< $unsigned(wire182)))));
endmodule

module module122
#(parameter param168 = ((((((8'hba) & (8'hb2)) ? (~(8'ha0)) : ((8'ha4) & (8'ha8))) ? (~{(8'had)}) : (((8'had) == (8'ha9)) ? (+(8'ha2)) : ((8'ha7) ? (8'h9d) : (8'ha8)))) ? (({(8'hbc)} <= {(7'h43)}) ? ((~|(8'hbc)) ? (^(8'ha1)) : ((8'ha1) && (8'hbb))) : ((~|(8'hbf)) ? (~&(8'h9c)) : ((8'ha1) >>> (8'ha5)))) : (~|{((8'ha2) >> (8'ha6))})) ? ((~{(8'h9e), (^~(8'ha5))}) == (|(((8'hbe) < (8'ha6)) ~^ ((8'hb4) ? (8'ha5) : (8'haa))))) : ((^({(8'hbf), (8'hae)} ? {(8'hab)} : ((8'ha2) ~^ (8'ha3)))) ? (((^~(8'hbd)) ? ((8'ha7) ? (8'hac) : (8'hac)) : (|(7'h44))) ? (((8'hbd) <= (8'ha1)) ? ((8'hbd) <<< (8'hb3)) : (^(8'haf))) : (~|(^~(8'h9d)))) : (^(^((7'h44) >>> (8'ha5)))))))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h1e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  input wire [(5'h12):(1'h0)] wire125;
  input wire [(5'h12):(1'h0)] wire124;
  input wire signed [(4'h8):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire [(4'he):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  assign y = {wire167,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire144,
                 wire143,
                 wire130,
                 wire129,
                 wire128,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg146,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire128 = {(+((~&(wire127 ? wire125 : wire124)) ?
                           $unsigned($unsigned((8'hb8))) : $unsigned((wire125 || (7'h44))))),
                       (+wire125)};
  assign wire129 = $unsigned(wire128);
  assign wire130 = ((wire128 ?
                       (~{$unsigned(wire128),
                           (~^wire126)}) : (!wire125)) <= $unsigned(wire124[(4'he):(4'h9)]));
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          if ($signed(wire126))
            begin
              reg131 <= (8'hb8);
              reg132 <= ((($unsigned(wire127[(3'h7):(3'h7)]) != (+((7'h42) ^~ (8'hb8)))) && (reg131 ?
                  wire126[(4'ha):(4'ha)] : $unsigned($unsigned((7'h40))))) >= ({($unsigned(wire126) ?
                      (+(8'h9d)) : $signed(wire123))} < $unsigned((wire125[(4'hb):(4'h9)] ^~ (wire127 <<< reg131)))));
            end
          else
            begin
              reg131 <= {wire126, wire127};
              reg132 <= ($signed(($signed($unsigned((8'ha1))) != $unsigned($unsigned((8'ha7))))) >= ($unsigned((~wire124)) ?
                  wire125 : (8'hb7)));
              reg133 <= wire128[(1'h1):(1'h1)];
              reg134 <= ($signed($signed(wire129[(4'h8):(1'h1)])) ?
                  wire126 : wire129[(1'h1):(1'h1)]);
              reg135 <= (reg131[(1'h1):(1'h1)] - wire124);
            end
          if (wire129)
            begin
              reg136 <= reg131;
              reg137 <= (~^reg132);
              reg138 <= ($unsigned((((~&reg133) + reg131[(5'h10):(1'h0)]) && ($signed(reg135) || $signed(reg137)))) << wire130);
            end
          else
            begin
              reg136 <= (wire129[(5'h14):(4'ha)] || $unsigned(wire123));
              reg137 <= $signed($signed($unsigned((wire125[(3'h7):(2'h2)] ?
                  $signed(reg136) : reg131[(3'h5):(2'h2)]))));
              reg138 <= ($signed($signed(((|(8'hac)) ?
                  $unsigned(reg138) : reg131[(4'h8):(1'h0)]))) * $signed(wire129[(5'h11):(4'h9)]));
              reg139 <= $unsigned(reg134[(3'h6):(3'h4)]);
            end
          reg140 <= (-wire127[(1'h1):(1'h1)]);
          reg141 <= reg140;
        end
      else
        begin
          reg131 <= (+(wire124[(3'h6):(3'h6)] ?
              (((+reg135) ? (7'h42) : reg136[(2'h2):(2'h2)]) ?
                  (reg131 ?
                      $signed(wire129) : reg137) : (+reg140)) : reg136[(1'h0):(1'h0)]));
          reg132 <= (|reg141);
          reg133 <= (reg135[(3'h5):(2'h2)] ?
              (reg132[(3'h6):(2'h2)] ?
                  wire125[(2'h3):(2'h2)] : (wire123[(2'h2):(1'h0)] ?
                      reg135 : {$signed(wire123),
                          reg131[(2'h2):(1'h0)]})) : reg137);
        end
      reg142 <= $signed(($signed($unsigned((8'ha9))) << ($unsigned(wire129[(3'h5):(3'h4)]) ?
          {wire129} : wire130[(4'h9):(3'h5)])));
    end
  assign wire143 = {($unsigned($unsigned({wire130,
                           reg141})) >>> reg137[(4'h8):(1'h1)])};
  assign wire144 = $unsigned((8'hae));
  assign wire145 = {(^~((reg139[(4'h8):(3'h6)] ?
                               (~|wire127) : $signed(wire125)) ?
                           ((reg135 * reg136) ?
                               {reg137,
                                   reg139} : (~|reg140)) : reg135[(3'h6):(3'h6)])),
                       $unsigned({{(reg142 ? wire130 : wire143),
                               reg135[(3'h6):(1'h0)]}})};
  always
    @(posedge clk) begin
      reg146 <= reg140;
    end
  assign wire147 = (!$signed({wire144}));
  assign wire148 = wire128[(5'h13):(4'h8)];
  assign wire149 = reg135[(1'h1):(1'h0)];
  assign wire150 = $unsigned({(8'ha3)});
  always
    @(posedge clk) begin
      if ({(({((8'had) != (8'hbe))} ?
                  (reg137[(2'h3):(2'h2)] ?
                      (~|wire129) : (^~wire125)) : reg142) ?
              (-reg146) : $signed((~|((8'ha1) ? reg140 : wire130))))})
        begin
          if (($signed($unsigned((wire125[(5'h12):(3'h4)] ?
              wire130 : wire147[(2'h2):(1'h1)]))) ^~ {{reg131[(4'ha):(2'h3)],
                  reg146}}))
            begin
              reg151 <= (~&(reg132[(4'hc):(1'h1)] ?
                  (!$signed((~|reg141))) : $signed((wire150[(3'h5):(3'h5)] >>> wire145[(3'h5):(3'h5)]))));
              reg152 <= $signed($unsigned((^$signed((wire128 ?
                  wire129 : wire143)))));
            end
          else
            begin
              reg151 <= ($unsigned($signed(reg139)) == $signed($signed($signed((~wire145)))));
            end
          reg153 <= $unsigned($signed((($signed((8'haf)) * $unsigned(reg137)) ?
              (-(wire127 > (8'haf))) : (^$signed(wire128)))));
          if (((($signed(((8'h9c) ? wire148 : wire147)) >= reg137) ?
              ({reg153[(3'h5):(3'h5)]} | {(wire149 ? reg136 : wire127),
                  reg133}) : ((!{reg138, (8'hbe)}) ?
                  {$unsigned(wire127)} : ($signed(wire148) ?
                      (wire143 ? wire144 : wire148) : (reg151 ?
                          wire147 : reg139)))) <<< (-(((reg141 || wire128) ?
              wire130 : (|reg142)) > (!wire144)))))
            begin
              reg154 <= (!(~&(^(reg153 ?
                  $signed((7'h40)) : (wire149 <= wire124)))));
            end
          else
            begin
              reg154 <= $unsigned({$unsigned((-reg141)), reg137});
              reg155 <= $signed({(!$signed($signed(reg133))),
                  (((reg137 == wire125) || reg139[(1'h0):(1'h0)]) << (8'ha3))});
              reg156 <= (~&wire144);
              reg157 <= $signed((|wire130));
            end
          reg158 <= $unsigned(({($signed((8'ha8)) | (wire144 ?
                      (8'h9d) : (7'h43)))} ?
              ((~^(~&wire148)) ?
                  ((reg132 ? wire127 : (8'ha9)) * wire123) : ({wire123} ?
                      wire150[(3'h6):(3'h6)] : ((8'ha2) & reg134))) : (~|reg153[(4'he):(2'h3)])));
          reg159 <= $signed((reg135 ?
              $signed($signed({reg155, reg156})) : (reg141[(4'h8):(3'h6)] ?
                  $signed({wire130, wire149}) : {wire125, (&reg155)})));
        end
      else
        begin
          reg151 <= wire125[(5'h11):(3'h7)];
        end
      if ({($unsigned($unsigned($unsigned(reg152))) ?
              $signed(wire150) : $signed(wire124)),
          (^{$signed((~&reg133)), (~|(reg142 ? reg138 : (8'hb6)))})})
        begin
          reg160 <= (reg141[(2'h2):(1'h1)] ?
              reg157[(3'h5):(3'h4)] : (~((-$signed(wire149)) & reg156[(1'h1):(1'h1)])));
        end
      else
        begin
          if ($signed(wire148[(3'h7):(3'h4)]))
            begin
              reg160 <= reg157;
              reg161 <= reg160[(2'h2):(1'h1)];
              reg162 <= $unsigned({(((reg136 ? reg160 : (8'hb5)) ?
                          $signed(wire129) : $unsigned(reg158)) ?
                      (reg141[(1'h0):(1'h0)] - $signed(wire145)) : (^~(7'h44)))});
            end
          else
            begin
              reg160 <= reg142;
              reg161 <= (reg131[(5'h13):(5'h12)] <<< reg156[(1'h1):(1'h0)]);
              reg162 <= $signed(reg137);
              reg163 <= (wire126[(3'h6):(3'h6)] ?
                  {($unsigned((reg131 << reg137)) ?
                          reg162[(1'h0):(1'h0)] : $unsigned(wire128)),
                      $signed((|(!wire149)))} : $unsigned((~^(wire143[(1'h0):(1'h0)] ?
                      reg156[(3'h5):(2'h2)] : (wire149 ? reg158 : wire145)))));
            end
        end
      reg164 <= {reg151,
          (&(($unsigned(reg158) ? (~&reg140) : wire126) ?
              (~|$signed(reg146)) : wire150))};
      reg165 <= wire148;
      reg166 <= (reg165 ? $unsigned($signed(wire144)) : reg132[(4'hd):(2'h2)]);
    end
  assign wire167 = (!(~(reg146[(3'h4):(2'h3)] ? wire123 : reg142)));
endmodule

module module81
#(parameter param118 = {(~&({((8'hae) <<< (8'hac))} > {{(8'haa)}}))}, 
parameter param119 = (~^(8'h9c)))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire86;
  input wire [(4'he):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(4'hb):(1'h0)] wire83;
  input wire [(2'h2):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire87 = wire86;
  assign wire88 = $signed(((wire85 >> (8'hb0)) ?
                      (~&$signed((wire82 ?
                          wire85 : wire85))) : ($signed(wire84) || (~^wire85))));
  assign wire89 = wire82;
  assign wire90 = wire86[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((|(^~{$signed((wire87 * wire82)), $signed((^(8'haa)))})))
        begin
          if ({{{wire88[(2'h2):(2'h2)], {(&wire82)}}, $unsigned({wire88})},
              $signed((|wire86))})
            begin
              reg91 <= $signed($unsigned(wire83));
              reg92 <= wire87;
              reg93 <= $unsigned(reg91[(3'h5):(1'h0)]);
            end
          else
            begin
              reg91 <= $signed($signed(wire82[(1'h1):(1'h0)]));
              reg92 <= $unsigned(((~($signed((8'ha9)) <<< wire88)) >= wire83));
              reg93 <= $signed((($signed((wire85 ? reg93 : reg92)) ?
                      wire88 : $unsigned($unsigned(wire85))) ?
                  {$unsigned($signed(reg93))} : wire82[(1'h0):(1'h0)]));
            end
          reg94 <= ((((reg91 & {wire88,
                  wire87}) == reg93[(3'h4):(3'h4)]) == $unsigned((~|$unsigned((8'ha4))))) ?
              wire84[(1'h1):(1'h1)] : wire84[(4'h8):(4'h8)]);
          if (($unsigned((~&wire84[(3'h4):(2'h2)])) ~^ (^((reg94 || wire85[(2'h3):(1'h0)]) * wire88))))
            begin
              reg95 <= (((reg91[(4'hb):(3'h6)] ?
                      ($unsigned(reg93) >= (wire88 ?
                          reg93 : wire89)) : wire82[(1'h1):(1'h0)]) - (wire84[(2'h2):(2'h2)] ^ $signed($signed(reg91)))) ?
                  wire83[(3'h4):(2'h2)] : (wire90[(4'hc):(3'h5)] ?
                      wire83[(4'ha):(2'h3)] : (wire82[(1'h0):(1'h0)] ?
                          ((~wire82) ~^ (+wire87)) : $signed((-reg91)))));
              reg96 <= ({(&wire90[(4'ha):(4'ha)])} ?
                  (|(^~(wire82[(1'h1):(1'h1)] * wire90[(3'h6):(2'h3)]))) : {reg95[(3'h4):(2'h3)]});
              reg97 <= $unsigned({$signed((~&wire87)),
                  $unsigned(($signed(wire87) || (~&reg94)))});
              reg98 <= ((-((~{wire87,
                  (8'hab)}) && $signed((~&reg92)))) >>> reg97[(4'ha):(3'h4)]);
            end
          else
            begin
              reg95 <= reg94[(4'hf):(4'h9)];
              reg96 <= $signed($unsigned({(^{reg96}),
                  $unsigned((wire86 - reg98))}));
              reg97 <= $signed(({($signed(reg96) >= $signed(wire88)),
                  $unsigned(wire90[(4'he):(3'h4)])} >= (reg92 ?
                  (^~(reg91 ?
                      reg94 : (8'ha3))) : $unsigned((reg92 <<< (8'h9c))))));
              reg98 <= $signed({$signed($unsigned((^wire86)))});
              reg99 <= {(&(8'h9d)),
                  $signed((({reg93, wire89} ?
                      reg98[(1'h0):(1'h0)] : (^~reg98)) && reg97))};
            end
          reg100 <= wire82[(2'h2):(1'h1)];
        end
      else
        begin
          reg91 <= wire87;
          reg92 <= $unsigned({(((wire89 ? wire83 : wire82) * (wire87 ?
                      wire85 : (8'had))) ?
                  $unsigned($signed((8'ha9))) : $signed((^~reg94)))});
          reg93 <= {wire89};
          if ((wire90 >= reg98[(3'h7):(3'h6)]))
            begin
              reg94 <= $signed(wire89);
            end
          else
            begin
              reg94 <= $unsigned((~&reg95[(3'h6):(1'h0)]));
              reg95 <= $signed((((wire90 ?
                      $signed((8'hba)) : wire90[(4'h8):(3'h5)]) <<< $unsigned({(8'hb8),
                      wire87})) ?
                  reg93[(3'h4):(3'h4)] : wire82));
              reg96 <= $unsigned($unsigned(((reg97 ?
                  $unsigned(wire85) : {(8'hb7)}) && wire90[(4'ha):(3'h6)])));
              reg97 <= {(8'hab)};
              reg98 <= wire85[(2'h2):(1'h0)];
            end
        end
      if (((^~($signed({(8'hbd), reg93}) | reg91)) ? (8'hbd) : reg93))
        begin
          reg101 <= ($signed((&($unsigned((8'had)) ?
              {wire88, wire87} : wire83))) | $signed(((reg95 ?
              wire88[(3'h4):(2'h3)] : (reg91 - reg100)) >> (((7'h41) * reg94) ?
              reg96 : (+(8'hab))))));
          if (reg97)
            begin
              reg102 <= (reg100 == (8'had));
              reg103 <= (((|$signed((wire87 ?
                  reg99 : wire90))) == {reg102[(4'h8):(1'h1)]}) ~^ reg96[(4'hc):(3'h7)]);
              reg104 <= reg91[(4'h8):(1'h0)];
              reg105 <= (~|(8'hbd));
            end
          else
            begin
              reg102 <= (~&(|wire87));
              reg103 <= $signed(($signed({((7'h40) || reg95)}) ?
                  reg101 : ($signed(reg105[(3'h4):(1'h1)]) ?
                      wire83 : wire84[(2'h3):(2'h3)])));
            end
          reg106 <= (~|(^(+wire89[(3'h6):(3'h5)])));
          reg107 <= wire84;
        end
      else
        begin
          reg101 <= reg96[(4'h8):(4'h8)];
          if ((reg96[(4'hf):(3'h6)] ?
              (reg99 > wire89) : $unsigned(($signed((-reg107)) ?
                  (&$unsigned((8'hac))) : reg98))))
            begin
              reg102 <= $unsigned(reg99);
              reg103 <= $signed(reg101[(3'h5):(2'h3)]);
              reg104 <= (8'h9d);
            end
          else
            begin
              reg102 <= (^(reg100 * $unsigned(wire83[(4'h9):(4'h9)])));
              reg103 <= $unsigned((^wire87[(1'h1):(1'h0)]));
              reg104 <= (~|((((~wire88) ?
                      (reg100 << (8'hab)) : $unsigned(reg98)) & reg103) ?
                  (!$signed(reg100[(3'h4):(2'h2)])) : $unsigned((wire84 ?
                      wire85 : reg106))));
              reg105 <= reg95;
              reg106 <= (((^~(-{(8'ha1)})) ?
                  $signed($unsigned($signed(wire88))) : $unsigned(((reg100 ^ reg105) * wire85))) == $unsigned((7'h44)));
            end
        end
      reg108 <= reg105[(4'hb):(4'ha)];
      reg109 <= $signed($signed((|(wire90[(4'h9):(3'h6)] ?
          (^~(8'hac)) : wire89))));
      reg110 <= $signed(reg91[(2'h3):(2'h3)]);
    end
  assign wire111 = $unsigned(reg103[(2'h3):(1'h0)]);
  assign wire112 = ((($signed(wire111[(1'h0):(1'h0)]) ?
                       $unsigned((~^(8'ha3))) : $unsigned((reg104 || reg98))) >>> {((reg102 ?
                               reg101 : reg95) ?
                           reg92[(4'hd):(3'h5)] : (reg110 && (8'hb4))),
                       reg101[(1'h0):(1'h0)]}) * reg102[(3'h7):(3'h5)]);
  assign wire113 = reg109[(2'h3):(1'h1)];
  assign wire114 = wire86[(4'ha):(3'h5)];
  assign wire115 = reg97[(5'h11):(4'he)];
  assign wire116 = ({$signed(((wire89 ? wire88 : reg100) ?
                               $signed(wire89) : wire88[(1'h0):(1'h0)])),
                           $signed($signed($signed(reg97)))} ?
                       $signed(reg101[(3'h7):(3'h7)]) : $signed(({$signed(reg102)} ~^ reg104[(3'h7):(2'h3)])));
  assign wire117 = ($unsigned({((~|reg106) ?
                           $unsigned((8'h9f)) : $unsigned(wire116))}) ~^ $signed(($unsigned((reg107 ?
                           reg108 : reg97)) ?
                       (^~(reg98 != wire113)) : (|(wire86 * (8'hb4))))));
endmodule
