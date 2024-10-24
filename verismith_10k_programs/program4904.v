module top
#(parameter param41 = ((^(((-(8'h9c)) >> (~^(8'hbd))) ? ((7'h42) >= (!(8'hab))) : (&(8'haa)))) ? ({(|((8'hb6) + (8'hba)))} * ((((8'h9d) ~^ (8'hae)) ? ((8'hbd) ? (8'hba) : (8'hb3)) : ((8'hb8) && (8'hbc))) ? {((8'hb1) >= (8'hbd))} : ({(8'haf), (8'hb3)} ? ((8'hbe) ~^ (8'hbe)) : ((8'ha6) <<< (8'haa))))) : ((8'ha7) ? {{((8'ha5) ? (8'hb6) : (8'hbe))}, (((8'hb0) ? (8'hbc) : (8'hb9)) ? ((8'hb3) & (8'hb2)) : {(8'hab)})} : ({((8'ha2) >>> (8'ha5)), ((8'ha0) * (8'hb0))} ? (!(+(7'h42))) : ({(8'hac)} ? ((8'ha9) ? (8'hb1) : (8'ha8)) : (^~(8'h9d)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire9,
                 wire8,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hb):(1'h0)];
      reg6 <= reg5[(3'h7):(1'h0)];
      reg7 <= {(wire1 > wire0[(3'h4):(1'h1)])};
    end
  assign wire8 = (($signed(reg5) ? $signed((-$unsigned(wire1))) : wire3) ?
                     (8'hae) : reg7[(3'h4):(2'h2)]);
  assign wire9 = {wire2[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg10 <= (&$unsigned($unsigned((reg6[(3'h4):(2'h3)] ?
          (8'ha7) : wire4[(1'h1):(1'h1)]))));
      reg11 <= $signed((reg6[(4'hd):(1'h1)] ?
          {({reg10} ? reg6 : wire4)} : wire1));
      if ($signed($signed(wire1[(3'h4):(3'h4)])))
        begin
          if ({({reg11[(2'h2):(1'h0)], (+$signed(reg7))} ~^ {((!wire3) ?
                      $signed(reg6) : $unsigned(wire8))})})
            begin
              reg12 <= (8'hbf);
              reg13 <= (8'h9e);
            end
          else
            begin
              reg12 <= reg12[(1'h1):(1'h1)];
              reg13 <= wire4[(1'h0):(1'h0)];
              reg14 <= reg7[(3'h4):(1'h1)];
              reg15 <= ({$signed((&wire2)),
                  $unsigned((~&(reg6 || reg6)))} ^~ (&(~&$unsigned({reg6,
                  reg14}))));
              reg16 <= (~|(~|wire3[(4'h8):(1'h0)]));
            end
        end
      else
        begin
          reg12 <= (~&reg7);
          if ((wire2[(2'h2):(1'h0)] ?
              reg14[(3'h5):(1'h1)] : ($signed($unsigned($unsigned(reg6))) ?
                  (8'hb1) : wire4[(1'h1):(1'h1)])))
            begin
              reg13 <= ($signed($unsigned((|wire8))) ?
                  $signed($unsigned(reg7)) : (reg7[(3'h4):(1'h0)] ?
                      reg14 : (($unsigned(wire1) ?
                          (reg12 >= reg16) : (reg6 + wire3)) ~^ ((reg6 ?
                          reg12 : wire4) ^~ $signed(reg15)))));
              reg14 <= reg12;
              reg15 <= $signed((reg11[(3'h5):(3'h4)] ?
                  wire4 : (($signed(wire1) ? (reg12 && reg11) : {reg6}) ?
                      ({reg12, reg10} ?
                          (reg14 ?
                              reg5 : wire0) : (8'had)) : $signed($unsigned(reg12)))));
              reg16 <= reg6[(4'hd):(3'h7)];
              reg17 <= {(($signed(reg14) != ((~wire1) ~^ wire2)) < ($unsigned($signed(reg16)) < reg13)),
                  $unsigned($unsigned(wire4))};
            end
          else
            begin
              reg13 <= ((reg17 ?
                      $unsigned($unsigned((~&reg11))) : $signed((|(8'hbc)))) ?
                  $signed(wire4) : ($signed($unsigned((^reg14))) ?
                      (^~wire3[(4'h8):(1'h1)]) : reg6[(4'ha):(2'h2)]));
              reg14 <= (~|$unsigned(wire9[(4'hb):(2'h3)]));
              reg15 <= wire2[(1'h0):(1'h0)];
              reg16 <= ($unsigned(((!(wire2 + wire2)) - $signed((^wire3)))) ?
                  ((^~{(&(8'ha7))}) ?
                      $signed($signed({(8'hbe)})) : (reg5[(2'h2):(1'h0)] ?
                          {reg16,
                              (reg15 ?
                                  (8'ha0) : reg16)} : (^reg10))) : reg14[(1'h0):(1'h0)]);
            end
          reg18 <= {($unsigned(wire0) ? $signed($signed(reg11)) : (^~reg15)),
              {$signed(({wire8} > reg15)),
                  (reg13[(4'h8):(4'h8)] >> $signed({reg12, reg12}))}};
          reg19 <= $unsigned((-$unsigned((reg16[(4'hd):(3'h7)] >= wire9[(4'hb):(4'hb)]))));
          reg20 <= reg10[(2'h3):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg21 <= (8'ha1);
      reg22 <= $unsigned($unsigned((+reg16[(5'h14):(1'h0)])));
      if ((7'h42))
        begin
          reg23 <= (wire0 ?
              (wire9 >> {$unsigned(reg22[(3'h7):(3'h7)])}) : wire0[(3'h6):(3'h5)]);
          reg24 <= $signed($signed($signed((|$signed(reg22)))));
          if ((reg15 >> {$signed(wire1[(3'h6):(1'h1)])}))
            begin
              reg25 <= reg17[(4'hc):(4'h8)];
              reg26 <= (8'hbf);
            end
          else
            begin
              reg25 <= $signed($signed({wire1[(2'h3):(1'h0)]}));
            end
        end
      else
        begin
          reg23 <= $signed((^~(|reg22)));
          if ($signed(($signed((8'hb0)) ?
              $signed(reg14[(3'h5):(2'h2)]) : $signed((reg13[(4'h9):(3'h4)] ?
                  {reg13} : (+reg21))))))
            begin
              reg24 <= reg15;
              reg25 <= ((8'ha1) ?
                  $unsigned(((reg14 & (reg20 ?
                      wire1 : reg16)) < {reg26})) : reg11);
              reg26 <= $unsigned((-(reg7 ?
                  $unsigned($signed(reg20)) : (^wire3))));
            end
          else
            begin
              reg24 <= $unsigned($signed($signed(wire8[(4'h8):(3'h6)])));
              reg25 <= reg5[(3'h6):(2'h2)];
            end
        end
      if ((wire2[(3'h4):(3'h4)] ^ reg24[(1'h0):(1'h0)]))
        begin
          reg27 <= ((8'hb8) - (wire9 + $unsigned($signed(reg26))));
          reg28 <= reg16[(3'h5):(1'h0)];
          if (reg17)
            begin
              reg29 <= $signed(reg15[(3'h5):(3'h5)]);
              reg30 <= ((8'hac) && (wire0 ? reg13 : wire9));
              reg31 <= wire0[(2'h2):(2'h2)];
              reg32 <= (~&reg21[(1'h1):(1'h1)]);
              reg33 <= $signed(reg7);
            end
          else
            begin
              reg29 <= (~(8'ha7));
              reg30 <= {$signed({($signed((7'h40)) > ((8'ha5) > wire3)),
                      reg33}),
                  (({((8'h9f) && reg22)} ?
                          $signed(wire2[(4'hb):(2'h2)]) : {$signed(reg15),
                              (reg29 ? wire1 : reg6)}) ?
                      $signed((~^$unsigned(reg5))) : (~(~^$unsigned((8'ha3)))))};
              reg31 <= (~^$unsigned($signed({(|wire1), (|reg18)})));
              reg32 <= (8'hb0);
              reg33 <= (8'ha0);
            end
        end
      else
        begin
          reg27 <= (wire1[(2'h2):(2'h2)] ?
              $signed(wire9[(3'h4):(1'h0)]) : $unsigned(reg24));
          reg28 <= wire1[(3'h4):(1'h0)];
          if (reg16)
            begin
              reg29 <= reg33;
              reg30 <= reg28[(2'h2):(1'h1)];
              reg31 <= (|$unsigned({$signed((~&reg33)),
                  ($unsigned(wire8) ?
                      (wire2 ? reg12 : reg26) : {(8'hbd), reg24})}));
            end
          else
            begin
              reg29 <= {$unsigned((-reg18))};
              reg30 <= $signed(reg7[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire34 = (wire9 << $unsigned(reg19));
  always
    @(posedge clk) begin
      if ($signed(({reg11[(4'h9):(4'h9)],
          ({reg22} ?
              (reg24 ?
                  reg20 : reg28) : $signed((8'haa)))} <<< {reg5[(3'h7):(3'h5)],
          (&$unsigned(reg27))})))
        begin
          reg35 <= $unsigned(((reg33[(3'h6):(3'h5)] ~^ $signed((+reg30))) ?
              $unsigned(reg10[(1'h1):(1'h1)]) : $signed($signed(reg19[(1'h1):(1'h1)]))));
          if (($unsigned(wire9) ^~ ($unsigned(wire1) ?
              reg27 : ($unsigned($signed((8'had))) ?
                  reg30[(1'h1):(1'h0)] : ((^~reg10) + reg21[(1'h1):(1'h1)])))))
            begin
              reg36 <= $unsigned((8'hbd));
              reg37 <= $unsigned(reg26[(2'h2):(1'h1)]);
              reg38 <= $unsigned(((~($signed(wire9) != (reg13 >> reg37))) ?
                  reg31 : (reg30 == $signed($signed(reg13)))));
              reg39 <= (&(({reg24[(2'h2):(1'h1)]} ? wire3 : $unsigned(reg13)) ?
                  $signed($signed($signed(reg18))) : (-(8'hbf))));
              reg40 <= $unsigned($signed($signed({reg24,
                  reg24[(2'h2):(2'h2)]})));
            end
          else
            begin
              reg36 <= $unsigned((8'h9f));
              reg37 <= (reg33[(1'h0):(1'h0)] && reg19);
              reg38 <= wire1;
              reg39 <= (reg33[(2'h3):(2'h2)] ^ (|{reg38}));
            end
        end
      else
        begin
          reg35 <= {reg16};
        end
    end
endmodule
