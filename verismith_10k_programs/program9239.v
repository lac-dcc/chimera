module top
#(parameter param74 = ({(-(8'hab))} ? (~&((((8'hbd) < (8'hb4)) < ((8'hb7) ? (8'hb9) : (8'hba))) ? ((-(8'hab)) ? ((8'hb3) ? (7'h44) : (8'ha6)) : (~(8'hb0))) : ((+(8'hb8)) >> ((8'hac) ^~ (8'h9e))))) : (~^(((~&(7'h43)) ? (~(8'haa)) : (~^(8'hbf))) || (((8'hbc) < (8'hb9)) ? ((8'h9c) * (8'hb0)) : (!(8'ha9)))))), 
parameter param75 = (~|param74))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire55;
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire5,
                 wire6,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire13,
                 wire14,
                 wire55,
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
                 reg11,
                 reg7,
                 (1'h0)};
  assign wire5 = (-(8'ha6));
  assign wire6 = (-wire3[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg7 <= (wire5 ?
          wire0 : (wire3 ?
              (($signed(wire4) ? $unsigned(wire2) : (wire3 <= wire1)) ?
                  wire4 : (wire4 <<< {(8'ha7)})) : wire3[(2'h2):(1'h1)]));
    end
  assign wire8 = ((~(((wire6 ^ reg7) <<< wire4) + wire6)) && wire3);
  assign wire9 = $signed({wire1, wire1[(1'h0):(1'h0)]});
  assign wire10 = (+wire3);
  always
    @(posedge clk) begin
      reg11 <= $signed(((wire6 * (-wire6[(4'hb):(4'hb)])) ?
          (wire2[(4'hd):(4'ha)] ?
              ((|wire4) ?
                  wire2[(4'hc):(4'ha)] : wire1[(3'h5):(3'h5)]) : (!{(8'hba)})) : ((!$signed(wire1)) ?
              wire10 : (~&$signed(wire0)))));
    end
  assign wire12 = ((8'hb9) ?
                      ((8'hac) ?
                          $signed((~|reg7)) : $signed(($unsigned((8'ha9)) ?
                              wire6[(3'h4):(1'h0)] : wire9))) : wire1);
  assign wire13 = (~^wire5[(3'h4):(2'h2)]);
  assign wire14 = $signed($signed((wire4 >> wire12)));
  module15 #() modinst56 (.wire17(wire9), .y(wire55), .wire20(wire6), .wire16(wire12), .wire19(wire5), .wire18(wire8), .clk(clk));
  always
    @(posedge clk) begin
      reg57 <= {(~^wire4), (8'hbd)};
      reg58 <= $signed($signed(wire0));
      reg59 <= $unsigned({$unsigned($unsigned({wire5}))});
    end
  always
    @(posedge clk) begin
      if ((((8'hb6) ?
              $unsigned(wire4[(3'h6):(3'h5)]) : (&(^~((8'hbe) > wire0)))) ?
          $unsigned($signed(wire3)) : $unsigned(wire13)))
        begin
          reg60 <= (wire9 ?
              $signed((((&reg7) || wire4) != (~|(wire8 ?
                  wire0 : wire8)))) : $signed(wire0));
          if ($signed(wire0[(4'hb):(1'h1)]))
            begin
              reg61 <= wire2;
              reg62 <= ((8'haa) ^~ (~$unsigned(wire0[(2'h3):(1'h0)])));
            end
          else
            begin
              reg61 <= wire12[(4'hf):(3'h6)];
              reg62 <= (8'ha7);
              reg63 <= (8'hba);
            end
        end
      else
        begin
          if (($signed(($unsigned($signed(reg59)) - ((!reg60) <= reg11[(3'h4):(2'h3)]))) ?
              $unsigned({wire55,
                  (wire3 ?
                      (wire8 < wire0) : wire5[(4'hc):(3'h4)])}) : ({$signed(wire1[(1'h1):(1'h1)])} ?
                  $signed((reg57[(1'h0):(1'h0)] > (~^(8'h9c)))) : $signed($signed(wire6[(4'h9):(1'h0)])))))
            begin
              reg60 <= wire5;
              reg61 <= (8'haa);
              reg62 <= {((|wire13) ?
                      $signed($signed((wire3 ?
                          (7'h41) : wire2))) : $signed(wire1)),
                  ({(-reg57[(3'h5):(3'h5)])} ^~ $unsigned(($unsigned(wire3) ?
                      reg57[(2'h2):(1'h0)] : reg11[(2'h2):(1'h1)])))};
              reg63 <= wire13;
            end
          else
            begin
              reg60 <= $unsigned((((^~$signed(reg62)) ?
                      {reg11[(4'ha):(3'h4)]} : ($signed(reg62) <<< (wire9 ?
                          wire0 : (8'hb3)))) ?
                  $unsigned(({wire1} >>> {wire14,
                      wire0})) : {($unsigned((8'hbd)) ?
                          (~|reg11) : $unsigned(wire9))}));
              reg61 <= (-(reg58[(3'h4):(2'h2)] ?
                  (reg63 ?
                      (reg57[(3'h5):(2'h2)] * wire2) : ($unsigned((8'hba)) || $signed(wire6))) : (wire14 ?
                      ((wire3 || wire2) <<< (wire0 ?
                          wire9 : reg60)) : (+$signed(wire55)))));
              reg62 <= $unsigned({$unsigned($signed(reg57[(1'h1):(1'h1)]))});
              reg63 <= wire2[(3'h6):(3'h4)];
            end
          reg64 <= (~^wire12[(4'hd):(4'h9)]);
          reg65 <= ({(^~(-((8'hae) >>> reg11)))} == ({wire55} * (-wire10[(1'h0):(1'h0)])));
          reg66 <= $unsigned(($unsigned(reg60[(2'h3):(1'h0)]) >> ((^~(reg62 ?
              wire12 : reg11)) + (~(reg63 ? reg11 : (8'ha7))))));
          reg67 <= {((~|$unsigned(wire0)) ?
                  $signed(($signed(reg57) <<< reg62[(1'h1):(1'h1)])) : (8'ha8))};
        end
      reg68 <= reg60;
      if ((~^wire0))
        begin
          reg69 <= reg60;
        end
      else
        begin
          reg69 <= $unsigned($signed(reg58));
          reg70 <= $signed(reg63[(4'hc):(3'h4)]);
        end
    end
  assign wire71 = $signed((~$signed($unsigned(reg63[(4'ha):(4'h8)]))));
  assign wire72 = reg64[(1'h1):(1'h0)];
  assign wire73 = wire6;
endmodule

module module15
#(parameter param53 = (~(^(8'hbd))), 
parameter param54 = {param53, (({(param53 ~^ param53)} ? param53 : ((param53 ? param53 : param53) ? (param53 != param53) : param53)) ? ((&param53) ? {{param53}} : ((param53 - param53) ? (param53 ? param53 : param53) : param53)) : (param53 <= (8'h9c)))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire21;
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 reg46,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = ((^$unsigned(((~&wire18) ~^ {wire18,
                      wire17}))) ^ {$signed((^~wire20)), wire16});
  always
    @(posedge clk) begin
      reg22 <= ((wire16 >>> ($unsigned($unsigned((8'h9f))) & $unsigned((wire18 >> wire20)))) ?
          wire18 : (wire21 << ((wire20[(3'h4):(1'h1)] <= wire18[(2'h2):(1'h0)]) ?
              wire17 : $signed((wire19 & wire21)))));
      reg23 <= (({$unsigned((8'had)), $unsigned(wire16)} ?
              wire18 : {(~wire17[(2'h2):(1'h0)])}) ?
          ((wire19[(4'he):(1'h1)] & wire18) ?
              wire20 : ($signed((~&wire18)) ?
                  ((&reg22) << wire17[(5'h11):(4'he)]) : (wire17[(5'h14):(5'h11)] ?
                      wire19[(2'h2):(1'h1)] : (wire17 & (8'h9c))))) : wire19);
      reg24 <= ($signed({(wire18[(1'h1):(1'h1)] >>> (wire16 ?
              wire21 : wire21))}) != $signed((8'hae)));
      reg25 <= $signed($unsigned(wire19[(3'h5):(1'h1)]));
    end
  assign wire26 = $unsigned((-((-((8'hb2) ?
                      wire18 : reg24)) <= reg22[(1'h0):(1'h0)])));
  assign wire27 = reg25;
  assign wire28 = {wire18};
  assign wire29 = $signed((reg23 ?
                      $signed(($unsigned(wire21) ?
                          wire21[(4'he):(4'hc)] : reg25[(2'h2):(2'h2)])) : (|((wire20 ?
                          reg24 : wire28) <= $signed(wire19)))));
  assign wire30 = $signed($unsigned({$signed((wire26 ^ wire29)),
                      wire28[(2'h3):(1'h0)]}));
  always
    @(posedge clk) begin
      if (wire29)
        begin
          reg31 <= $unsigned($signed(((^reg22[(3'h5):(3'h5)]) <<< (wire21[(2'h2):(2'h2)] ?
              wire17 : (wire18 ^ (8'hb9))))));
          reg32 <= reg23;
          reg33 <= $signed(wire26);
          if ((-({(reg23 ^~ $signed(wire18)), wire28} ?
              (+$unsigned($unsigned(wire21))) : $unsigned(((&reg25) ?
                  (wire19 <<< wire20) : {wire16})))))
            begin
              reg34 <= $signed($unsigned(reg25[(4'hb):(4'h9)]));
              reg35 <= wire30[(1'h1):(1'h1)];
              reg36 <= $unsigned((wire17[(4'h9):(3'h7)] ?
                  (^~{(reg33 ? reg24 : wire19), (8'ha9)}) : (~({wire28,
                          wire21} ?
                      reg34[(1'h0):(1'h0)] : wire29[(3'h7):(3'h7)]))));
            end
          else
            begin
              reg34 <= $unsigned({wire28[(2'h2):(2'h2)],
                  $signed($unsigned($signed(reg33)))});
              reg35 <= ((~|$signed(reg35[(1'h0):(1'h0)])) >>> (reg23 + (7'h41)));
              reg36 <= (~|reg31);
              reg37 <= {(wire29 | (&(reg34[(4'h9):(3'h4)] & wire20)))};
              reg38 <= ($unsigned((wire30 ?
                      wire29[(2'h3):(1'h0)] : $unsigned(wire16[(2'h3):(1'h1)]))) ?
                  {(!{(!(8'hb7)), (wire26 + (8'hbb))}),
                      (-$unsigned(wire28[(1'h0):(1'h0)]))} : (((|reg24) > (((8'hb7) <<< wire29) || (|wire20))) <<< $signed(reg23[(5'h15):(4'hc)])));
            end
          if ((reg22 ?
              $signed(($signed(reg33[(3'h6):(1'h1)]) ?
                  reg37 : $signed((wire17 ?
                      reg23 : (8'had))))) : ($unsigned(reg24) ?
                  $signed(($signed((8'haa)) ^~ (8'haf))) : wire20)))
            begin
              reg39 <= (|wire29[(4'hc):(3'h5)]);
              reg40 <= (+wire19);
              reg41 <= wire29;
              reg42 <= (((($signed(reg31) ? (~|wire18) : $signed(wire19)) ?
                      reg24 : (^~(~|reg41))) ?
                  (&$unsigned($unsigned(reg25))) : reg36[(5'h11):(2'h3)]) << (~(+reg35[(3'h4):(1'h1)])));
            end
          else
            begin
              reg39 <= reg31;
              reg40 <= $signed($unsigned($unsigned(wire29[(3'h6):(2'h2)])));
              reg41 <= wire19[(4'he):(2'h3)];
            end
        end
      else
        begin
          reg31 <= $signed((reg34[(4'ha):(4'h8)] ?
              $signed(((wire16 ?
                  wire28 : reg24) * reg37)) : ($unsigned(wire27) * reg23[(4'hc):(4'ha)])));
          reg32 <= reg22[(3'h6):(1'h0)];
          if (reg25)
            begin
              reg33 <= {$signed((|wire27)),
                  $signed($unsigned((reg37 > (~|reg31))))};
              reg34 <= (8'had);
            end
          else
            begin
              reg33 <= ((8'ha8) ?
                  $signed((!reg41)) : {(((reg35 & (8'ha4)) ?
                          (wire18 ?
                              reg35 : reg25) : wire30[(1'h0):(1'h0)]) == reg40)});
              reg34 <= {reg41};
            end
          reg35 <= ($unsigned(wire16[(1'h1):(1'h1)]) ?
              wire28 : (~|(reg25[(3'h6):(2'h3)] == reg40[(3'h5):(2'h2)])));
        end
      reg43 <= reg40;
      reg44 <= ((8'ha4) ?
          wire26[(2'h3):(1'h1)] : ({reg42[(2'h2):(1'h0)]} ?
              (^~((reg38 <<< reg42) ?
                  reg40 : reg40)) : (wire17[(5'h12):(5'h11)] >>> {(wire17 * wire17),
                  (+reg41)})));
      reg45 <= reg43[(4'hb):(4'hb)];
      reg46 <= $signed((((~&(!reg38)) ? reg24 : (reg36 ? reg33 : reg31)) ?
          $unsigned($signed(((8'hb6) ?
              wire27 : reg25))) : (|wire16[(4'hc):(4'hc)])));
    end
  assign wire47 = (8'hb4);
  assign wire48 = $signed($unsigned((~&(reg45[(2'h2):(1'h1)] && (8'hb2)))));
  assign wire49 = reg41;
  assign wire50 = (~$signed(($signed((wire29 ?
                      reg43 : (8'hb2))) >= (~$unsigned((8'ha2))))));
  assign wire51 = $unsigned((wire26[(3'h4):(2'h2)] * reg32));
  assign wire52 = (((($signed(wire49) ? reg23 : (8'ha8)) ?
                          (!(reg23 < wire20)) : $signed($signed((8'hb4)))) & $signed({$signed(reg32)})) ?
                      (8'hbe) : wire18[(4'hd):(3'h7)]);
endmodule
