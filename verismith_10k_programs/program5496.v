module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire201;
  reg [(5'h12):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg208 = (1'h0);
  reg [(2'h3):(1'h0)] reg207 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(4'h9):(1'h0)] reg205 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg204 = (1'h0);
  reg [(4'h8):(1'h0)] reg203 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire51,
                 wire53,
                 wire201,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 (1'h0)};
  assign wire4 = $unsigned({$unsigned($signed((wire1 - wire0))), (+wire0)});
  assign wire5 = $signed(({((wire2 + wire1) >>> $signed((8'hb9))),
                     ($signed(wire0) ?
                         wire0[(2'h2):(1'h0)] : ((8'hbc) ?
                             (8'ha2) : wire4))} ~^ (8'ha3)));
  assign wire6 = $unsigned((-{$unsigned($signed(wire4))}));
  module7 #() modinst52 (wire51, clk, wire2, wire4, wire6, wire0);
  assign wire53 = (($unsigned($signed($signed(wire4))) + wire4) ?
                      (!(wire2[(4'h8):(2'h3)] ?
                          ({(8'ha7)} <= wire51[(3'h5):(2'h3)]) : (~^(~^wire3)))) : wire4[(4'hc):(3'h5)]);
  module54 #() modinst202 (.y(wire201), .clk(clk), .wire56(wire0), .wire58(wire6), .wire59(wire2), .wire55(wire53), .wire57(wire3));
  always
    @(posedge clk) begin
      if (wire201)
        begin
          reg203 <= (~wire201);
        end
      else
        begin
          if (((~|reg203[(3'h6):(3'h4)]) > $unsigned(reg203[(1'h1):(1'h0)])))
            begin
              reg203 <= {reg203[(4'h8):(1'h0)],
                  (&({wire5, (wire4 ? wire2 : wire51)} ?
                      $unsigned((wire201 ~^ (8'ha8))) : $unsigned((wire6 ?
                          wire201 : (8'hb2)))))};
            end
          else
            begin
              reg203 <= $signed(wire4);
              reg204 <= wire53;
            end
          reg205 <= reg204[(4'h9):(4'h8)];
        end
      reg206 <= $signed((-$signed({$unsigned(wire201)})));
      reg207 <= (~((&$signed($unsigned(wire4))) & (8'ha9)));
      reg208 <= reg203;
      reg209 <= {reg204};
    end
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire [(3'h7):(1'h0)] wire58;
  input wire [(4'h9):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire signed [(4'ha):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire186;
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg198 = (1'h0);
  reg [(4'hb):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg190 = (1'h0);
  reg [(4'he):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  assign y = {wire145,
                 wire87,
                 wire86,
                 wire84,
                 wire61,
                 wire60,
                 wire156,
                 wire157,
                 wire186,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire60 = wire58[(2'h3):(2'h3)];
  assign wire61 = (&$unsigned(wire55));
  always
    @(posedge clk) begin
      reg62 <= $signed(wire59[(4'h9):(3'h7)]);
      reg63 <= $unsigned((wire60 ? (8'ha7) : $unsigned($unsigned({wire60}))));
      reg64 <= $signed($unsigned(reg63[(4'hf):(1'h0)]));
      reg65 <= $signed(((wire58[(2'h2):(1'h1)] ?
              (+(reg62 >>> reg62)) : (^~wire58[(3'h6):(1'h0)])) ?
          $signed(wire55[(4'h8):(1'h0)]) : wire55[(3'h7):(1'h0)]));
      reg66 <= $unsigned($signed((~&(-wire56))));
    end
  module67 #() modinst85 (.wire69(wire55), .wire68(reg62), .wire71(reg66), .wire70(wire57), .y(wire84), .clk(clk));
  assign wire86 = reg62;
  assign wire87 = (wire56[(4'hc):(1'h1)] | {$signed($signed((&reg64)))});
  module88 #() modinst146 (.wire90(wire59), .wire89(wire60), .clk(clk), .wire93(reg66), .wire92(reg62), .y(wire145), .wire91(wire61));
  always
    @(posedge clk) begin
      if (($signed(($unsigned($unsigned(reg62)) ?
              (wire56 ?
                  (wire86 ? wire56 : wire87) : {wire84, reg65}) : reg65)) ?
          $signed({({wire61,
                  reg65} >> $signed((8'ha3)))}) : ((!(-$signed(wire87))) >= {reg62[(3'h7):(3'h7)]})))
        begin
          if ({reg66})
            begin
              reg147 <= $signed(wire55);
              reg148 <= $signed(wire55[(3'h5):(1'h0)]);
              reg149 <= (~{wire61});
              reg150 <= reg147[(4'hc):(1'h0)];
            end
          else
            begin
              reg147 <= ($signed($signed(wire58[(3'h4):(1'h0)])) & reg150[(3'h7):(3'h4)]);
            end
          reg151 <= reg66;
          reg152 <= (wire55[(3'h4):(2'h2)] ?
              (wire84[(2'h2):(1'h0)] <<< reg64) : (~|reg63));
        end
      else
        begin
          reg147 <= reg66[(4'hf):(2'h3)];
        end
      reg153 <= wire84[(4'h8):(3'h7)];
      reg154 <= $unsigned(($signed($unsigned($signed(reg151))) != (7'h40)));
      if ((+(-(wire60[(1'h0):(1'h0)] < $unsigned(wire58[(2'h2):(2'h2)])))))
        begin
          reg155 <= reg151;
        end
      else
        begin
          reg155 <= {$unsigned(wire87), wire56};
        end
    end
  assign wire156 = (($signed(reg153[(4'hf):(3'h6)]) ?
                       (({(8'had), wire55} ?
                               (wire55 >> reg147) : $unsigned(reg152)) ?
                           $unsigned((reg64 >> wire86)) : $unsigned({reg65})) : reg65[(1'h0):(1'h0)]) < (+reg152));
  assign wire157 = reg154[(2'h3):(1'h0)];
  module158 #() modinst187 (.wire159(wire84), .y(wire186), .wire163(reg65), .clk(clk), .wire160(wire56), .wire161(wire86), .wire162(reg153));
  always
    @(posedge clk) begin
      reg188 <= (reg151[(4'ha):(4'h8)] ?
          ({({(8'hbe), reg149} ? $signed(wire86) : {reg152, (8'hb9)}),
                  (^(~^(8'hbb)))} ?
              reg149 : (~$unsigned(reg150[(3'h5):(1'h0)]))) : (((((8'ha4) ?
                  wire60 : wire60) ?
              $unsigned(reg154) : (reg152 ?
                  reg150 : wire186)) >= {{reg154}}) & (|(8'h9c))));
    end
  always
    @(posedge clk) begin
      if ((($unsigned({(reg64 << reg147), (wire156 ? reg63 : wire145)}) ?
          reg153 : (&$signed($signed(reg65)))) * $signed((~&wire56[(3'h6):(1'h0)]))))
        begin
          if ($unsigned($signed({wire145})))
            begin
              reg189 <= (~^((~|reg153[(1'h1):(1'h0)]) >= (($signed(reg151) ?
                  ((8'h9e) ?
                      reg188 : wire145) : reg188[(2'h2):(1'h1)]) * reg62)));
              reg190 <= $signed($signed({$unsigned($signed(reg147))}));
              reg191 <= (|$signed((wire55[(4'h8):(2'h3)] ?
                  $signed((reg190 >= wire157)) : $unsigned(wire61[(2'h3):(1'h1)]))));
              reg192 <= {$signed(((|wire56[(1'h0):(1'h0)]) ?
                      ((wire145 >> reg155) ?
                          (wire84 ? wire59 : wire57) : (reg154 ?
                              reg66 : reg151)) : ($unsigned(wire186) ?
                          (wire86 & reg150) : (wire61 != reg63)))),
                  $signed($signed((~(8'ha9))))};
            end
          else
            begin
              reg189 <= wire61[(3'h5):(1'h1)];
              reg190 <= ((reg66[(3'h4):(1'h1)] & (&wire156)) >> reg64[(3'h4):(1'h0)]);
              reg191 <= (8'hb3);
              reg192 <= $unsigned($signed($signed(($signed(wire58) == {reg190}))));
              reg193 <= $signed((+(8'hb3)));
            end
          reg194 <= {wire86[(3'h6):(3'h5)], (8'hb3)};
          reg195 <= ((({((8'hb5) ? wire58 : reg66)} ?
              (8'hac) : reg62) >> ({(reg66 ? wire145 : wire60),
                  $signed(wire156)} ?
              (((7'h41) ? reg151 : wire186) * (reg149 ?
                  (8'hbb) : (8'hb8))) : $signed(reg152))) >>> (&{(reg189 ?
                  reg155 : {wire58, wire59}),
              wire157[(4'hc):(3'h7)]}));
          reg196 <= wire57[(4'h9):(2'h2)];
          reg197 <= $unsigned(((reg154[(2'h2):(1'h0)] ?
              ((reg193 * (8'hb7)) * $unsigned(reg154)) : $unsigned((reg148 & (7'h41)))) - {((^~wire56) ?
                  (-reg150) : reg150[(4'ha):(4'h9)])}));
        end
      else
        begin
          reg189 <= reg189;
          reg190 <= (reg149[(5'h10):(3'h5)] ?
              (reg155[(1'h1):(1'h0)] ~^ (wire186[(4'h8):(4'h8)] ?
                  (reg66[(3'h7):(3'h5)] << $signed(reg197)) : wire58[(1'h1):(1'h1)])) : wire61[(4'hb):(3'h6)]);
          reg191 <= reg194[(2'h3):(1'h1)];
        end
      reg198 <= (!(($unsigned(reg62[(5'h15):(4'hf)]) ?
          (~|reg196[(4'h9):(3'h6)]) : reg193[(2'h3):(1'h0)]) ~^ $signed(reg149[(2'h3):(1'h0)])));
      reg199 <= ($signed({wire57[(1'h0):(1'h0)]}) <<< reg149[(4'h9):(3'h4)]);
      reg200 <= reg195;
    end
endmodule

module module7
#(parameter param49 = (!(((+((8'ha2) ~^ (8'hab))) ? (((8'hbd) ? (8'ha1) : (8'hb6)) * ((7'h42) ? (8'ha1) : (8'hb7))) : (((7'h44) >> (8'hb9)) ? ((8'ha9) - (8'had)) : ((8'ha3) ? (8'hb8) : (8'hb1)))) * {{((8'hb1) >>> (8'hb3)), ((8'hbf) >= (8'hb2))}, ((!(8'hbf)) ? ((8'hb5) == (8'hbf)) : {(8'h9e)})})), 
parameter param50 = (param49 + ((~^param49) ? {param49, (^~{(8'hbd)})} : {((param49 == param49) ? param49 : param49)})))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire48,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg47,
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
                 (1'h0)};
  assign wire12 = wire11;
  assign wire13 = (~^((wire8 ?
                      (~^$unsigned(wire10)) : (wire8[(4'h8):(3'h5)] ?
                          wire11 : $signed(wire12))) >>> $unsigned((wire10 ?
                      (^wire9) : (8'hac)))));
  assign wire14 = (~&wire12);
  assign wire15 = ({($signed($unsigned(wire10)) ^~ wire14[(3'h4):(1'h1)]),
                          {$signed({wire10, wire14}), wire13}} ?
                      wire11 : (^$unsigned($unsigned({wire10}))));
  assign wire16 = ($signed((&(~&(~|wire15)))) ?
                      wire13 : (~$signed((!$unsigned(wire15)))));
  assign wire17 = ((wire14[(4'h8):(3'h5)] & ((wire10 ?
                      $signed(wire11) : $signed(wire16)) && ((~|wire11) ~^ (wire15 ?
                      wire11 : wire13)))) & {($signed((&wire16)) ?
                          wire16[(2'h2):(2'h2)] : $signed(wire16[(1'h1):(1'h1)])),
                      (-wire15)});
  assign wire18 = ((wire8[(4'h9):(2'h3)] <<< (|wire8)) ?
                      ((7'h42) ?
                          $signed(($signed(wire15) == (|wire10))) : {(~(wire11 ?
                                  wire12 : wire9))}) : {wire15,
                          $unsigned(wire12[(3'h5):(1'h0)])});
  assign wire19 = (wire17[(5'h10):(4'hc)] ?
                      wire11 : ($signed(wire14[(4'ha):(4'ha)]) | $signed((((8'hb8) ?
                              wire18 : wire15) ?
                          (wire13 ? wire8 : wire16) : (wire15 <= (8'hbf))))));
  assign wire20 = ((|(wire9[(3'h4):(2'h2)] ~^ (~|wire11))) <<< (~|(~^(wire14 ?
                      (wire12 << wire18) : (wire14 > (8'hbf))))));
  always
    @(posedge clk) begin
      if ((~|wire10[(4'h8):(3'h7)]))
        begin
          reg21 <= wire13[(3'h5):(1'h0)];
          if ($signed($unsigned($unsigned({wire11}))))
            begin
              reg22 <= $signed(wire10[(3'h5):(1'h1)]);
            end
          else
            begin
              reg22 <= {(~(wire11[(3'h6):(2'h3)] ?
                      ({wire17} ?
                          $signed(reg21) : wire8[(2'h3):(2'h3)]) : (~|{wire20})))};
              reg23 <= wire14;
              reg24 <= (|((8'hbe) << ((7'h43) ~^ (((8'ha3) ^~ wire11) ?
                  wire11[(3'h4):(3'h4)] : {wire15}))));
            end
          reg25 <= $unsigned(reg22);
        end
      else
        begin
          reg21 <= ((~&($unsigned($signed(wire17)) * $unsigned(wire18[(3'h6):(3'h4)]))) ?
              wire17[(3'h7):(3'h7)] : ((+$signed(wire18[(5'h10):(4'hf)])) ?
                  $signed((~^(reg23 <= wire14))) : ((+wire16[(2'h2):(1'h1)]) ^ wire14[(1'h0):(1'h0)])));
          reg22 <= ($signed((~|(8'haf))) ?
              $signed($signed(((wire13 ?
                  (8'hbc) : reg25) * $unsigned(wire19)))) : wire18);
          reg23 <= $unsigned(wire19);
          reg24 <= ($unsigned((+({wire8,
              wire15} ~^ $unsigned(reg21)))) < $signed(($unsigned(wire13) ?
              $signed(wire10[(1'h1):(1'h0)]) : wire16[(2'h3):(2'h3)])));
          reg25 <= wire13;
        end
      reg26 <= $unsigned(wire19);
      reg27 <= (wire11 ?
          {$unsigned($unsigned(wire11[(2'h2):(1'h1)]))} : (($signed(reg24) ?
              wire20 : {(wire19 ? (7'h43) : wire14),
                  $signed(wire10)}) >= wire18));
      reg28 <= ({$unsigned(reg26), $signed((^(wire19 ? (7'h42) : wire13)))} ?
          ($signed((((7'h44) | wire14) ? wire8 : (~&reg24))) ?
              (7'h42) : $signed(((^reg27) >= ((8'h9f) ?
                  reg24 : wire15)))) : reg24);
    end
  always
    @(posedge clk) begin
      reg29 <= wire20;
      reg30 <= wire19[(4'hb):(3'h5)];
      if ((({$signed((~wire19)),
          $signed((^reg28))} == $signed(reg23)) || ($signed(wire11[(2'h3):(2'h2)]) ?
          reg25 : $signed({(reg30 * wire17), (reg28 ? wire18 : (8'hb6))}))))
        begin
          if ($unsigned(({$signed((|wire20)),
              $signed((reg21 ? wire17 : reg28))} && wire12[(1'h1):(1'h0)])))
            begin
              reg31 <= wire9;
              reg32 <= reg24[(3'h6):(2'h3)];
              reg33 <= $signed(wire19);
              reg34 <= $signed((~&reg21));
            end
          else
            begin
              reg31 <= reg24[(3'h5):(3'h5)];
              reg32 <= ($unsigned((8'h9c)) && $signed(wire14[(1'h1):(1'h0)]));
              reg33 <= wire9[(2'h3):(2'h2)];
            end
          reg35 <= {reg22};
          if (wire13)
            begin
              reg36 <= reg30[(4'hf):(2'h3)];
              reg37 <= (~{(~|reg31)});
              reg38 <= ($signed(reg32[(3'h6):(1'h1)]) ?
                  (reg23[(4'h9):(3'h6)] ^ wire11[(2'h2):(1'h0)]) : ($unsigned(reg31) ?
                      $unsigned(reg24) : (reg31[(4'hd):(4'hd)] ?
                          {(~wire9),
                              (^~wire11)} : $unsigned((reg23 >= reg27)))));
              reg39 <= $signed(reg23);
              reg40 <= ((reg28[(4'ha):(3'h7)] ?
                      ($signed($signed(wire20)) == (^~wire15)) : (reg37 ?
                          {reg22} : reg33[(4'ha):(3'h4)])) ?
                  ((8'ha2) - {$unsigned({reg22}),
                      reg22[(3'h6):(3'h5)]}) : $unsigned(reg28));
            end
          else
            begin
              reg36 <= ($unsigned($unsigned($unsigned((reg33 ?
                      reg22 : wire19)))) ?
                  wire13[(1'h1):(1'h0)] : $signed($unsigned((~&$unsigned(reg27)))));
              reg37 <= {wire18, reg38};
              reg38 <= (~&(~^(8'hb0)));
            end
          if (({wire8} ? reg36[(2'h3):(1'h1)] : reg34[(4'h9):(3'h4)]))
            begin
              reg41 <= (+(~^(((reg32 << reg23) ? {reg29} : (~&reg26)) ?
                  $unsigned((!wire9)) : {$signed(wire16),
                      reg33[(5'h13):(1'h1)]})));
              reg42 <= $unsigned(reg23);
              reg43 <= wire17[(2'h2):(1'h0)];
              reg44 <= ((&{$signed({wire14,
                      reg41})}) >= ({$signed((reg37 ~^ (8'ha1))),
                  (!$unsigned(reg40))} >= reg31));
              reg45 <= $unsigned((&(~(^~wire9[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg41 <= (-((|(reg34 & {reg35, reg26})) ?
                  reg30[(5'h10):(4'h9)] : $signed(reg35)));
              reg42 <= (+$unsigned($signed((+reg39))));
              reg43 <= (reg28 | $unsigned((~|reg37)));
              reg44 <= {{(reg35[(3'h4):(2'h2)] == (-{reg35})), reg43},
                  reg26[(4'hc):(3'h5)]};
              reg45 <= $unsigned((-(^({reg40, reg41} ?
                  (reg26 | reg32) : reg36[(2'h2):(2'h2)]))));
            end
        end
      else
        begin
          reg31 <= (8'h9c);
          reg32 <= (~&$signed(reg35[(2'h3):(2'h2)]));
          reg33 <= $signed(wire20[(2'h2):(2'h2)]);
        end
      reg46 <= $signed(reg36[(2'h3):(1'h0)]);
      reg47 <= ((reg45[(4'hb):(4'h9)] <<< $signed(reg23[(4'hc):(4'ha)])) || $unsigned($unsigned($unsigned((&reg22)))));
    end
  assign wire48 = reg34[(5'h11):(1'h1)];
endmodule

module module158  (y, clk, wire163, wire162, wire161, wire160, wire159);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire163;
  input wire signed [(4'he):(1'h0)] wire162;
  input wire [(5'h12):(1'h0)] wire161;
  input wire signed [(2'h2):(1'h0)] wire160;
  input wire signed [(4'h8):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(4'hd):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(4'hb):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg172 = (1'h0);
  assign y = {wire173,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg172,
                 (1'h0)};
  assign wire164 = (8'h9f);
  assign wire165 = $signed((8'ha0));
  assign wire166 = wire162[(4'hd):(2'h2)];
  assign wire167 = ({(wire159 ?
                               {wire160[(1'h0):(1'h0)]} : (~|(wire163 ?
                                   wire164 : (8'ha2))))} ?
                       {wire163} : (~|wire165));
  assign wire168 = ((-wire164[(4'h8):(1'h1)]) <<< (!($unsigned($unsigned((8'ha4))) ?
                       (((8'h9d) >>> wire160) ^~ (7'h43)) : ((wire166 ?
                               wire159 : wire166) ?
                           $signed(wire167) : (wire164 ? wire165 : wire160)))));
  assign wire169 = (^~wire162[(2'h2):(2'h2)]);
  assign wire170 = ((wire168 * wire160[(1'h1):(1'h0)]) ^ (~|(($signed(wire159) ?
                           ((8'hb9) ?
                               (7'h41) : wire159) : wire159[(3'h5):(2'h3)]) ?
                       $signed((~wire160)) : ((~&wire162) ?
                           $unsigned(wire168) : $unsigned((8'hb8))))));
  assign wire171 = (~|(wire167 ?
                       wire163[(1'h0):(1'h0)] : $signed(($signed(wire164) == (^~wire167)))));
  always
    @(posedge clk) begin
      reg172 <= $signed(wire170);
    end
  assign wire173 = wire162;
  always
    @(posedge clk) begin
      reg174 <= (|$signed($unsigned(wire169)));
      reg175 <= {(($signed(reg174) ?
              (|$signed(reg172)) : $signed((wire167 ?
                  wire162 : wire168))) << ($unsigned(wire164[(3'h4):(1'h1)]) ?
              (wire173 ?
                  {wire171, wire173} : ((7'h43) <<< (8'hb5))) : (8'h9c))),
          (wire165 ?
              $signed(($signed(wire163) > wire166)) : wire160[(2'h2):(1'h1)])};
      if ((-(~&wire160)))
        begin
          if ((+wire159[(2'h3):(2'h2)]))
            begin
              reg176 <= wire159;
            end
          else
            begin
              reg176 <= $signed($signed(wire164));
              reg177 <= $unsigned((wire163 ?
                  (($unsigned(wire169) ? (~&wire161) : wire167) ?
                      ($unsigned(wire163) >> (|wire162)) : (~|((8'ha4) ?
                          reg172 : reg175))) : ((-reg176[(3'h6):(3'h5)]) ?
                      ((wire159 ? wire165 : (8'hbb)) ?
                          (wire166 ?
                              wire170 : wire160) : $unsigned(wire168)) : (^~{(8'hb8),
                          wire173}))));
              reg178 <= $unsigned((|wire165));
            end
          reg179 <= wire170;
          reg180 <= $unsigned($unsigned((+$signed(wire163[(2'h3):(1'h0)]))));
          reg181 <= (reg180 ?
              {(+$signed(wire161))} : (~(wire173[(4'ha):(1'h0)] >= ($signed(wire164) <<< $signed((8'hb4))))));
        end
      else
        begin
          reg176 <= wire171;
          if (({$signed((-{wire173})),
                  $unsigned(($signed(wire167) ^ reg172[(1'h1):(1'h1)]))} ?
              (wire160[(1'h0):(1'h0)] ?
                  $unsigned($unsigned((&reg175))) : $unsigned((8'hb8))) : $signed($signed({$unsigned(reg181),
                  {reg174, wire160}}))))
            begin
              reg177 <= {((&(!(reg174 ^ wire169))) ^~ wire166)};
              reg178 <= reg178;
              reg179 <= (reg177 ?
                  reg178[(2'h2):(2'h2)] : wire165[(1'h0):(1'h0)]);
              reg180 <= $signed((8'ha7));
              reg181 <= $unsigned(reg174[(2'h3):(2'h3)]);
            end
          else
            begin
              reg177 <= $signed(((~$unsigned((~&wire166))) ?
                  $unsigned(((reg175 > wire167) ?
                      (~wire168) : $unsigned((8'haa)))) : $unsigned(($unsigned(reg177) | (~^(8'hbc))))));
              reg178 <= $unsigned(wire161);
              reg179 <= ({reg177} ?
                  wire170[(1'h0):(1'h0)] : (+(((reg178 ^~ (8'haa)) ?
                          (wire162 ? wire170 : wire164) : (reg175 ?
                              reg180 : reg180)) ?
                      reg180 : wire164)));
            end
          reg182 <= ($unsigned($signed(((8'ha6) < {reg180}))) ?
              (wire162[(3'h4):(3'h4)] >>> (^(^~reg172))) : reg172);
          reg183 <= $unsigned(wire171[(4'he):(3'h7)]);
        end
      reg184 <= $signed((((((8'h9f) ?
          reg175 : reg179) || (~&wire164)) ~^ (reg183 != (~^wire165))) ^~ reg181));
      reg185 <= ((-({(+wire159), reg174} ?
          (~&wire167) : reg182)) & ($signed($unsigned(((8'ha7) == reg172))) ?
          ($unsigned({wire162,
              wire170}) >> $signed((+wire170))) : wire160[(2'h2):(1'h0)]));
    end
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire [(4'he):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  input wire [(2'h3):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire129,
                 wire113,
                 wire109,
                 wire108,
                 wire107,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg144,
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
                 reg130,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg112,
                 reg111,
                 reg110,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire94 = $signed((~^$unsigned((~$unsigned(wire93)))));
  assign wire95 = (wire92[(1'h0):(1'h0)] ?
                      ((~^{(wire94 <<< wire89)}) ?
                          $signed(wire89) : ($unsigned((wire92 ?
                              wire89 : wire91)) ~^ (wire93[(3'h5):(1'h0)] >= wire90[(3'h7):(3'h5)]))) : {wire90,
                          wire90});
  assign wire96 = $signed($unsigned((|(((8'hb6) >>> wire95) >> {wire94}))));
  assign wire97 = {wire89[(2'h3):(1'h1)]};
  assign wire98 = $unsigned((^~({wire93} ^ ((wire95 < (7'h40)) >> {(8'hbb),
                      wire92}))));
  assign wire99 = ($signed((((^~wire97) + $signed(wire97)) >>> wire94[(1'h0):(1'h0)])) ?
                      $signed(wire89) : wire94);
  assign wire100 = $unsigned((~{wire97[(4'hf):(1'h1)], (8'h9e)}));
  assign wire101 = ($unsigned(wire100[(3'h5):(3'h5)]) || {$unsigned($signed(((8'hbe) ?
                           wire100 : wire94)))});
  always
    @(posedge clk) begin
      reg102 <= wire95[(2'h3):(2'h3)];
      reg103 <= (~|({$signed(((8'haf) | wire92))} ?
          wire91[(1'h1):(1'h0)] : $signed($signed($unsigned(wire94)))));
      reg104 <= $signed(wire93);
    end
  always
    @(posedge clk) begin
      reg105 <= ({{reg102, wire95[(1'h1):(1'h1)]}} ?
          wire95[(3'h4):(1'h1)] : $unsigned((((wire91 << wire93) ?
                  $unsigned(wire95) : $signed(wire100)) ?
              $signed(reg103) : (^~(wire97 ? wire93 : wire99)))));
      reg106 <= $signed({wire92[(4'he):(2'h3)]});
    end
  assign wire107 = (8'h9d);
  assign wire108 = wire100;
  assign wire109 = ($unsigned(($signed(wire92[(5'h10):(5'h10)]) ?
                       (wire101 ?
                           ((8'hb9) ?
                               reg103 : (8'hb3)) : wire91[(4'hc):(4'h9)]) : {(~|reg105)})) * {$signed((+(wire97 ?
                           reg106 : wire90)))});
  always
    @(posedge clk) begin
      reg110 <= ((!$unsigned({$unsigned(wire90)})) >>> $unsigned($signed((((8'h9e) - (8'hb9)) ?
          ((8'hb2) << wire100) : (wire96 ? (8'ha9) : (8'hb8))))));
      reg111 <= $signed($signed(wire99));
      reg112 <= $signed($unsigned(wire94[(2'h2):(1'h1)]));
    end
  assign wire113 = ((8'ha0) ?
                       {wire95[(3'h5):(3'h4)]} : ({reg105} > ((~(+wire108)) ?
                           wire101 : $signed($signed(wire92)))));
  always
    @(posedge clk) begin
      reg114 <= (^(~&(+$unsigned(wire109))));
      if (($signed($unsigned({reg114})) + (&wire93[(5'h11):(1'h0)])))
        begin
          if (((wire100 >> ((wire99 >> $unsigned(wire89)) + ((reg106 << wire107) ?
              wire91 : $signed((8'hb5))))) >>> (wire108[(4'ha):(2'h2)] ?
              $unsigned($signed((wire96 == (7'h44)))) : wire113)))
            begin
              reg115 <= (^~$unsigned((wire92 >> $unsigned($signed(wire92)))));
              reg116 <= (|reg106[(4'hb):(4'h9)]);
              reg117 <= wire107[(2'h3):(1'h0)];
              reg118 <= (((wire99[(4'he):(3'h4)] ?
                      $unsigned(wire95[(2'h2):(2'h2)]) : wire108) - ($unsigned((wire100 ?
                      wire98 : wire108)) && (&$signed(reg116)))) ?
                  (~($signed($unsigned(wire99)) ?
                      $signed((+wire101)) : $unsigned(reg110[(2'h3):(2'h3)]))) : $unsigned((~|$unsigned(((8'ha8) < reg103)))));
            end
          else
            begin
              reg115 <= (8'hba);
              reg116 <= wire108[(2'h2):(2'h2)];
              reg117 <= $signed((+reg104[(4'h9):(4'h9)]));
              reg118 <= ({($unsigned($unsigned(reg116)) - $unsigned((~|wire107)))} ?
                  $unsigned(($unsigned((reg103 ? (8'ha8) : reg106)) ?
                      (((8'hb4) & (7'h43)) ~^ (wire98 <= wire91)) : wire98)) : $unsigned(($signed(reg115[(1'h0):(1'h0)]) << (wire100 ?
                      {(8'hae)} : $unsigned(wire95)))));
              reg119 <= {$signed((wire99[(4'hf):(1'h1)] ?
                      $unsigned((wire97 <<< wire100)) : $unsigned($signed(wire100)))),
                  $signed((wire89[(2'h2):(1'h1)] == (reg117[(3'h7):(2'h3)] < (^(8'hba)))))};
            end
          reg120 <= (wire107[(4'ha):(1'h1)] ? wire97 : (8'h9c));
          if ($signed(reg110[(4'ha):(1'h1)]))
            begin
              reg121 <= $unsigned($unsigned((~^wire108[(3'h5):(1'h0)])));
              reg122 <= $signed(({$unsigned({reg103,
                      reg119})} << $signed({(wire97 ? (8'hb7) : reg110),
                  {reg111}})));
              reg123 <= $signed(((+reg111) ?
                  ($signed((!wire95)) ?
                      $unsigned(wire108[(1'h0):(1'h0)]) : ($unsigned(reg119) ?
                          (reg118 > (8'hac)) : $signed(wire94))) : ((!$signed((8'hb8))) ?
                      ((7'h40) * (reg103 && (8'hb5))) : $signed(wire92[(3'h6):(3'h5)]))));
              reg124 <= reg114;
            end
          else
            begin
              reg121 <= $unsigned($unsigned({wire108[(4'ha):(2'h2)]}));
              reg122 <= (wire95[(3'h4):(2'h2)] ?
                  wire92[(3'h5):(1'h1)] : {reg117[(2'h3):(1'h1)],
                      $unsigned({$unsigned(wire95)})});
            end
          reg125 <= (reg121[(4'h8):(1'h0)] || (+((~(7'h44)) * wire95[(1'h0):(1'h0)])));
        end
      else
        begin
          reg115 <= reg119;
        end
      reg126 <= reg118[(3'h6):(1'h1)];
      reg127 <= $unsigned($signed((wire95[(1'h1):(1'h0)] ?
          wire107[(3'h5):(3'h5)] : ((^~wire92) ? (8'ha8) : $signed(wire95)))));
      reg128 <= reg115;
    end
  assign wire129 = (wire92[(4'hc):(1'h1)] ?
                       $unsigned({$unsigned(reg119[(2'h2):(1'h0)])}) : (wire109 ^ $signed(($signed(wire96) || {(8'ha4),
                           wire90}))));
  always
    @(posedge clk) begin
      reg130 <= $unsigned({(^~reg121[(1'h1):(1'h0)])});
      reg131 <= (~&(reg103[(2'h3):(1'h1)] - wire107));
    end
  always
    @(posedge clk) begin
      reg132 <= (({($signed((8'hb0)) >> $signed(wire98)),
              $signed(wire101[(3'h6):(3'h6)])} ?
          reg125 : $signed(($signed(reg125) ?
              reg111 : reg116))) - (&$signed($signed($unsigned(reg105)))));
      if (reg132[(4'h8):(3'h5)])
        begin
          if (wire101)
            begin
              reg133 <= $signed($unsigned(wire97[(1'h1):(1'h0)]));
            end
          else
            begin
              reg133 <= (!$unsigned($signed((^reg132[(1'h1):(1'h0)]))));
              reg134 <= $unsigned(reg115[(2'h3):(2'h2)]);
              reg135 <= (~^(reg102[(4'hd):(2'h2)] ?
                  reg133[(4'h8):(3'h5)] : wire95));
              reg136 <= $signed((($signed($signed(reg114)) < reg119[(1'h1):(1'h0)]) <<< wire96));
              reg137 <= reg103;
            end
        end
      else
        begin
          reg133 <= (~reg137);
          reg134 <= $signed(wire93[(3'h7):(3'h7)]);
          reg135 <= reg105[(2'h2):(1'h1)];
          reg136 <= ($signed($signed(($unsigned((8'h9d)) >= (|wire91)))) < {(~^((|reg116) ?
                  (reg137 ? reg126 : reg114) : (-reg123)))});
          if ($signed(wire94[(1'h0):(1'h0)]))
            begin
              reg137 <= reg125;
            end
          else
            begin
              reg137 <= (8'hb0);
              reg138 <= (~|((&wire94) ?
                  $signed(wire100[(4'hf):(3'h4)]) : ($unsigned($signed(reg121)) >> (~^(8'ha0)))));
            end
        end
      reg139 <= (&reg136[(2'h3):(1'h0)]);
      reg140 <= wire129[(1'h0):(1'h0)];
      reg141 <= {((~wire93[(2'h2):(2'h2)]) ?
              ($unsigned((7'h43)) | (^~(~&(8'hab)))) : (((~(8'hbb)) + (~|(8'ha6))) ?
                  reg103 : (~|(~^(8'hac))))),
          wire97};
    end
  assign wire142 = (reg110[(3'h5):(3'h5)] >> (~|reg138));
  assign wire143 = wire95;
  always
    @(posedge clk) begin
      reg144 <= (7'h43);
    end
endmodule

module module67
#(parameter param82 = ((((8'hb7) != (8'hb3)) >> ((((7'h41) ~^ (8'ha1)) || ((8'hab) ? (8'hb3) : (8'hb2))) != ((~(8'ha8)) ? (~^(7'h44)) : (~|(7'h42))))) ? ({{{(8'ha0)}, ((8'hba) ? (8'hb8) : (8'ha0))}} ? (+({(8'haa)} ^~ ((8'h9c) ? (8'hbc) : (8'ha8)))) : (((8'ha5) ? (+(8'ha0)) : (8'ha6)) >= (+((7'h40) ? (8'hbf) : (8'hb6))))) : (~^((!((8'ha8) ? (8'had) : (8'had))) ? (((8'hb4) - (8'ha5)) * ((8'haf) * (8'hba))) : ({(8'hbb), (8'hb2)} + ((8'h9d) ? (7'h41) : (8'hb9)))))), 
parameter param83 = param82)
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  input wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg72 <= wire71;
    end
  always
    @(posedge clk) begin
      reg73 <= ($signed({$signed((~^wire71)),
          wire71[(4'hb):(3'h5)]}) & wire69[(3'h5):(2'h2)]);
      reg74 <= wire69[(1'h1):(1'h0)];
      if ((~^reg74))
        begin
          reg75 <= $signed(wire70[(3'h5):(1'h1)]);
          reg76 <= wire69;
          reg77 <= $unsigned($unsigned((~{$unsigned(wire68)})));
        end
      else
        begin
          reg75 <= {((reg74 ? (!(-(8'h9f))) : wire68) << reg77)};
          reg76 <= $signed((wire69 >= reg76));
        end
    end
  always
    @(posedge clk) begin
      reg78 <= $signed(wire70);
    end
  assign wire79 = (((8'hbe) ?
                          $unsigned(((+reg77) <<< (~^reg73))) : $unsigned((~|reg76[(3'h7):(2'h2)]))) ?
                      $signed((~&reg75)) : reg73[(2'h2):(1'h0)]);
  assign wire80 = (+$signed((-reg76[(4'ha):(3'h5)])));
  assign wire81 = {(wire68 >= ((wire70[(1'h1):(1'h1)] >> $signed(wire70)) ?
                          $signed((wire69 & reg72)) : (^~wire79)))};
endmodule
