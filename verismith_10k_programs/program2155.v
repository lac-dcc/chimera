module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire46,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire6,
                 wire5,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire5 = $unsigned((wire1 ?
                     (wire2[(3'h7):(1'h1)] ?
                         {{wire4}} : wire0[(3'h6):(3'h5)]) : ($unsigned(wire4[(4'hc):(4'hc)]) != $signed((~^wire2)))));
  assign wire6 = $unsigned((|wire0));
  module7 #() modinst24 (.wire8(wire0), .clk(clk), .wire9(wire2), .y(wire23), .wire10(wire3), .wire11(wire6));
  assign wire25 = {((^(wire23 ? (wire5 >> wire2) : (~&wire1))) ? wire6 : wire4),
                      {($signed((wire23 > (8'hb7))) ? wire3 : {wire5}),
                          (wire5[(1'h0):(1'h0)] == $signed($signed(wire2)))}};
  assign wire26 = (~&({{$unsigned(wire5)},
                      ((^wire6) ?
                          wire2 : $signed(wire4))} * wire0[(4'hb):(3'h5)]));
  assign wire27 = wire1[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned((wire3[(4'hf):(4'hf)] ?
          (~|(((8'ha4) ?
              (7'h41) : (7'h44)) >= wire26[(4'hc):(4'h9)])) : (|(wire1[(1'h0):(1'h0)] >= wire3)))))
        begin
          reg28 <= (wire4 << ($unsigned($unsigned((wire2 ?
              wire2 : wire6))) < (-wire4[(2'h2):(1'h1)])));
          reg29 <= ($unsigned((wire6[(4'hb):(2'h2)] ?
              (!(~&wire27)) : (7'h43))) * (^~(((-reg28) | (wire5 || wire2)) ?
              $unsigned(wire0) : wire26[(4'ha):(2'h3)])));
          reg30 <= ({($signed((~&wire25)) & (~(wire23 * wire6))),
              (~&$unsigned(wire27[(1'h1):(1'h1)]))} == {{$unsigned((wire0 < wire4)),
                  ((+wire6) ? ((8'hbe) | wire27) : $unsigned(wire25))}});
        end
      else
        begin
          reg28 <= $unsigned(wire6[(3'h4):(2'h3)]);
          if ($unsigned((wire6[(3'h5):(3'h4)] == $unsigned((wire3 ?
              {wire2} : (+wire5))))))
            begin
              reg29 <= $signed($signed(($unsigned(wire6[(4'hb):(3'h6)]) ?
                  $unsigned($signed(reg29)) : $signed((~wire5)))));
            end
          else
            begin
              reg29 <= wire25[(1'h1):(1'h1)];
            end
        end
      if ($signed($signed($signed((reg29 ^ (~&wire26))))))
        begin
          reg31 <= $unsigned(wire26[(4'hd):(3'h5)]);
          if (((-($unsigned((reg28 ? wire4 : wire27)) ?
                  $unsigned((wire2 << wire5)) : $signed($signed(wire5)))) ?
              reg31 : $signed(({(wire26 <= reg29)} ?
                  $signed(wire3[(5'h14):(1'h1)]) : $unsigned((wire23 & wire6))))))
            begin
              reg32 <= (wire2 ?
                  wire26[(4'he):(4'he)] : (^~$signed(((wire4 && wire3) ?
                      $unsigned((8'hb6)) : (^~wire4)))));
              reg33 <= (&{((~^$unsigned(reg30)) >> $signed((reg29 - wire1))),
                  $signed(((wire0 ? wire5 : (8'haf)) < (^~wire25)))});
              reg34 <= ((({(wire1 ? reg33 : wire6),
                  $unsigned((8'hae))} != (~$signed(reg31))) ~^ $signed(($signed((8'h9d)) < wire4[(4'h9):(1'h0)]))) <= ((reg29[(2'h2):(1'h1)] ^~ reg30) << (!(reg33[(3'h5):(3'h5)] ?
                  (8'had) : (reg29 & wire26)))));
            end
          else
            begin
              reg32 <= $signed({$unsigned($signed((reg30 >> (7'h44)))), reg30});
              reg33 <= $signed($signed((^~(wire5 ? $signed(wire6) : (8'h9e)))));
            end
        end
      else
        begin
          reg31 <= ($unsigned($signed(wire4[(2'h2):(1'h1)])) != reg34);
          reg32 <= $signed($signed({(reg30 || $signed((8'ha0)))}));
        end
      reg35 <= ((8'hb8) <<< (^wire26[(4'hd):(1'h1)]));
      reg36 <= {(+((&(~|wire3)) ? $signed((&wire2)) : $signed(wire1))),
          {($signed($signed(reg35)) ? wire6 : ({reg28, wire27} - wire23))}};
    end
  assign wire37 = (^~{wire3[(5'h13):(4'hc)], wire23});
  assign wire38 = $unsigned({($signed((wire37 ~^ wire6)) ?
                          $unsigned((8'ha8)) : wire2[(2'h2):(1'h1)]),
                      $unsigned((reg34 <= (wire0 ? wire5 : reg33)))});
  assign wire39 = wire27;
  assign wire40 = wire1;
  always
    @(posedge clk) begin
      reg41 <= ({{(8'hbf),
              ({wire37} ? wire37[(3'h5):(3'h5)] : ((7'h44) ? reg29 : wire26))},
          $signed(((reg30 - reg30) ^~ $signed(wire4)))} || (~|(($unsigned(reg36) == wire5) && wire23)));
      reg42 <= (8'hbb);
      reg43 <= reg32;
      reg44 <= $unsigned((wire39 && $unsigned($unsigned(wire3[(5'h12):(2'h2)]))));
      reg45 <= {$unsigned(wire0),
          ({reg43[(1'h1):(1'h0)], {$signed(wire23), wire3}} ?
              wire0[(3'h6):(3'h4)] : ({reg35,
                  $unsigned(reg43)} <<< ((wire37 <<< wire3) ?
                  $signed(wire2) : (wire0 ? reg35 : reg28))))};
    end
  assign wire46 = (~|(($signed((+wire23)) & ($signed(wire2) ?
                      (!wire25) : $signed(reg29))) > (($unsigned(wire40) ?
                      {reg33} : reg44) - wire26)));
  always
    @(posedge clk) begin
      reg47 <= ($unsigned($unsigned(wire3[(5'h11):(2'h2)])) ?
          ((((^wire46) ?
              (reg34 >= reg45) : (wire40 >>> reg33)) * reg34[(3'h5):(3'h4)]) <<< ({(|reg36),
                  $unsigned(wire25)} ?
              {(^~wire23)} : $signed({wire6}))) : $signed($unsigned(($signed(wire46) != (wire40 ?
              (8'hb5) : reg36)))));
      reg48 <= $unsigned((~&($signed(wire23[(2'h2):(1'h0)]) ?
          wire38[(4'h9):(3'h7)] : reg43[(4'h9):(2'h3)])));
      reg49 <= {wire0};
      if (wire37[(1'h0):(1'h0)])
        begin
          reg50 <= wire4[(3'h5):(2'h2)];
          reg51 <= $signed($signed($unsigned(wire27)));
          reg52 <= ($signed($signed(((reg29 || wire3) ?
                  reg28[(1'h0):(1'h0)] : wire3[(5'h11):(3'h6)]))) ?
              ($unsigned(reg50[(2'h2):(2'h2)]) ?
                  {((|reg43) ? (wire23 * reg51) : reg35),
                      ($signed(wire6) | $signed((8'hba)))} : ($signed(reg35[(4'h9):(1'h0)]) << wire40)) : reg35);
          reg53 <= $unsigned(reg35[(3'h7):(3'h7)]);
          if (wire23[(1'h1):(1'h1)])
            begin
              reg54 <= (~&$signed((reg52 == {$unsigned(reg47),
                  {reg47, wire23}})));
              reg55 <= (^~$unsigned(reg53[(3'h7):(3'h5)]));
              reg56 <= wire23;
            end
          else
            begin
              reg54 <= (-$signed(reg29));
              reg55 <= ($unsigned($signed(((&reg48) || $unsigned(reg45)))) ?
                  (reg43[(2'h3):(2'h2)] != $signed(((|wire38) ?
                      reg52[(3'h4):(1'h1)] : {reg56,
                          wire25}))) : reg51[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg50 <= wire4;
        end
    end
  always
    @(posedge clk) begin
      if (($signed((reg55[(2'h3):(2'h2)] * ((reg30 ~^ (8'hb0)) ~^ {wire38}))) >>> $unsigned({(^~$signed(wire2)),
          $signed(((7'h40) & reg47))})))
        begin
          if ($signed($signed($signed($signed(wire23[(2'h2):(1'h1)])))))
            begin
              reg57 <= ($unsigned(($signed((reg28 - reg48)) ?
                  $unsigned((wire5 ? wire0 : reg30)) : (~&(wire2 ?
                      reg55 : wire38)))) < $unsigned(((wire40 ?
                      (-wire27) : $unsigned((8'had))) ?
                  ((-reg41) && $unsigned(wire4)) : (reg47[(3'h4):(1'h1)] >> (wire38 & reg36)))));
              reg58 <= wire40[(4'h9):(2'h3)];
              reg59 <= ($unsigned($unsigned(((~&wire2) ?
                      $signed(reg51) : (wire6 >= reg47)))) ?
                  ($unsigned((((7'h41) ? (8'hb0) : wire39) ?
                      reg34 : wire2)) * reg32[(2'h3):(1'h1)]) : $signed(reg51[(3'h6):(1'h1)]));
              reg60 <= wire40[(3'h7):(3'h7)];
            end
          else
            begin
              reg57 <= ({(8'hbf),
                      {(^~(wire23 > reg28)),
                          $signed((reg48 ? reg58 : wire5))}} ?
                  (-(wire37 ?
                      (~reg57) : (wire39[(3'h7):(1'h1)] ^~ (wire40 ?
                          (7'h42) : wire23)))) : (&{(wire5 ?
                          $unsigned(wire1) : $unsigned(reg35)),
                      $unsigned($unsigned(wire38))}));
              reg58 <= reg48[(3'h7):(1'h0)];
              reg59 <= (-reg59);
              reg60 <= {(~^{reg53, ({reg29, wire2} >> $unsigned(wire25))}),
                  (-reg48[(3'h7):(3'h7)])};
              reg61 <= reg48[(4'h8):(3'h6)];
            end
          reg62 <= reg49;
          reg63 <= $unsigned(({reg41, (^reg62)} ^ ({$unsigned(wire38)} ?
              wire26 : wire4)));
          reg64 <= (8'hb5);
        end
      else
        begin
          reg57 <= $signed(reg45);
          if ({reg62,
              ($unsigned((wire37[(1'h0):(1'h0)] ? $signed(reg48) : (+wire37))) ?
                  $signed(reg43) : (~&reg51[(4'h9):(2'h3)]))})
            begin
              reg58 <= $unsigned(($unsigned((reg52 != ((8'hbd) <= (8'hbd)))) ?
                  (!$unsigned((reg51 ^~ wire4))) : reg44));
            end
          else
            begin
              reg58 <= $signed({reg36[(2'h3):(2'h2)],
                  (reg29[(1'h1):(1'h0)] <= $signed((wire23 ^ (8'ha9))))});
              reg59 <= {(~^$unsigned({(reg36 ? wire25 : (8'h9e))})),
                  {((-$unsigned((8'hbb))) ~^ $signed($signed(reg61))),
                      (wire5[(4'ha):(2'h2)] ?
                          $unsigned(wire0) : $unsigned((wire4 < wire23)))}};
              reg60 <= {(8'hbb),
                  $unsigned(({wire27[(1'h0):(1'h0)], reg43} ?
                      reg61 : (^~(reg43 < wire23))))};
              reg61 <= reg29[(1'h1):(1'h1)];
            end
        end
      if (reg43[(4'he):(3'h4)])
        begin
          reg65 <= reg29;
          if ({wire23[(2'h2):(1'h0)]})
            begin
              reg66 <= reg29[(1'h1):(1'h0)];
              reg67 <= (+(~|(wire3[(3'h6):(1'h1)] <<< ((wire26 ^~ reg33) ^ (wire46 ?
                  (8'hbe) : reg42)))));
              reg68 <= ((|((7'h40) + $signed((~&reg61)))) ?
                  $signed($unsigned(wire3)) : (~$unsigned(reg47)));
              reg69 <= (((^($signed(reg65) <= reg44)) ?
                  ($signed($signed(wire26)) ?
                      (reg34 ?
                          (~|reg41) : $signed(wire5)) : {$signed(reg63)}) : $unsigned($signed($unsigned(reg41)))) << (reg45[(2'h2):(1'h0)] != (~&{reg41,
                  {reg60}})));
              reg70 <= wire0[(4'h8):(2'h3)];
            end
          else
            begin
              reg66 <= reg63;
            end
        end
      else
        begin
          reg65 <= ({((((8'ha4) ? reg48 : wire38) ?
                          (wire40 ? reg65 : wire38) : (reg68 ?
                              (7'h44) : reg69)) ?
                      wire2 : (wire46 ? reg57 : ((8'ha5) ? reg67 : (8'hbb)))),
                  ((wire6[(4'h8):(2'h2)] < (~^wire27)) ?
                      reg60 : $signed((+reg28)))} ?
              {$unsigned((reg47[(2'h2):(1'h1)] ?
                      (|reg60) : (reg55 ? wire38 : reg68)))} : reg34);
        end
    end
  assign wire71 = (+reg41);
  assign wire72 = $signed(reg56);
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire13,
                 wire12,
                 reg17,
                 reg16,
                 reg14,
                 (1'h0)};
  assign wire12 = (($unsigned(wire8) == $signed((wire8 >> {wire10}))) | wire9);
  assign wire13 = $signed($signed($unsigned(((wire9 && wire8) ?
                      (^wire10) : $unsigned((8'hbb))))));
  always
    @(posedge clk) begin
      reg14 <= wire13[(1'h1):(1'h0)];
    end
  assign wire15 = (^~(~|$unsigned(wire9)));
  always
    @(posedge clk) begin
      reg16 <= ($unsigned(wire15) ?
          (+(wire9[(4'ha):(2'h2)] >> ($unsigned(wire9) ?
              reg14[(3'h4):(3'h4)] : (wire12 ?
                  wire9 : wire9)))) : ($signed((wire12 ?
              $unsigned(reg14) : (wire15 ? wire11 : wire10))) <= wire11));
      reg17 <= ($unsigned(wire10) ? reg16 : wire15);
    end
  assign wire18 = ((wire13[(1'h0):(1'h0)] ?
                      wire15[(3'h7):(1'h1)] : $signed($unsigned((8'had)))) >> wire8[(1'h0):(1'h0)]);
  assign wire19 = (8'h9f);
  assign wire20 = wire8;
  assign wire21 = (wire13[(1'h0):(1'h0)] ?
                      $signed($signed($unsigned(wire12))) : $unsigned((~(+$unsigned(wire11)))));
  assign wire22 = reg16[(3'h5):(3'h4)];
endmodule
