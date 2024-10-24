module top
#(parameter param33 = (~(8'hae)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg9,
                 (1'h0)};
  assign wire4 = wire1[(3'h6):(1'h0)];
  assign wire5 = (+(~|(((^~wire4) ?
                     $signed(wire3) : (wire0 ?
                         wire4 : wire1)) ^~ (~|(wire0 << wire4)))));
  assign wire6 = wire4;
  assign wire7 = (^~$unsigned($unsigned(wire6)));
  assign wire8 = (($signed(((|wire2) ?
                     $signed(wire6) : (wire2 ?
                         (7'h41) : wire0))) || ($unsigned(wire6[(2'h2):(1'h0)]) & $unsigned(wire7[(5'h10):(4'hd)]))) == (+wire7));
  always
    @(posedge clk) begin
      reg9 <= wire2;
      reg10 <= {((wire4 == {(wire4 ^ wire7), $signed(wire8)}) ?
              ($unsigned(((8'ha0) < wire7)) ?
                  (&(wire8 ? wire8 : wire1)) : ((wire0 ? wire5 : wire7) ?
                      (wire6 ^~ wire4) : wire0[(4'h9):(3'h7)])) : wire8),
          (~^((!$signed(wire0)) ? (8'hbc) : $signed($signed(reg9))))};
      if ((8'hbf))
        begin
          reg11 <= wire6;
        end
      else
        begin
          reg11 <= $signed((wire1 ?
              wire6[(1'h0):(1'h0)] : ($signed(wire5) <= $signed(wire2[(5'h12):(1'h1)]))));
          if ((wire8[(1'h0):(1'h0)] ?
              reg9[(2'h3):(2'h3)] : wire3[(5'h12):(5'h12)]))
            begin
              reg12 <= $unsigned(wire2);
              reg13 <= $signed($signed({$signed({wire4, reg12}),
                  {wire1[(3'h4):(1'h0)]}}));
              reg14 <= wire3;
              reg15 <= $unsigned((!$signed(reg14)));
              reg16 <= {wire8[(2'h2):(2'h2)]};
            end
          else
            begin
              reg12 <= wire8[(3'h4):(2'h2)];
              reg13 <= (~wire0);
              reg14 <= (-($signed(reg11[(3'h6):(3'h5)]) & $signed((&(reg11 ?
                  wire0 : reg9)))));
            end
          reg17 <= (($unsigned((-{wire7})) <= (wire3 && $signed(((8'ha2) ?
                  reg16 : (8'ha8))))) ?
              {((((8'hae) ? reg14 : reg16) ? (wire1 && (8'ha6)) : (|wire0)) ?
                      wire3[(4'ha):(4'h9)] : $signed((reg15 || wire5))),
                  (|$signed($unsigned(reg14)))} : reg12[(1'h0):(1'h0)]);
        end
      reg18 <= $signed({(((reg12 ~^ reg17) == $signed((8'ha9))) - wire4)});
      reg19 <= ($unsigned(((~|(wire8 + wire5)) && reg15[(2'h2):(2'h2)])) ?
          ($signed((8'hb9)) <<< $unsigned((!reg18))) : ((($signed(wire4) ^~ wire4[(1'h1):(1'h1)]) ?
                  ((~&wire4) ? wire2 : (|reg9)) : (~|reg14[(2'h3):(1'h0)])) ?
              wire8[(2'h3):(1'h0)] : ($signed((^~wire6)) ?
                  (8'ha4) : (|$unsigned(reg13)))));
    end
  assign wire20 = $unsigned((reg10 == {(~&(reg13 ? (8'hb8) : wire0))}));
  assign wire21 = (reg11 ?
                      $unsigned($signed((reg13 ?
                          {reg18} : $signed((8'hae))))) : wire2);
  always
    @(posedge clk) begin
      if ((wire5[(3'h6):(3'h5)] >> {(reg17[(2'h2):(2'h2)] ?
              wire5 : ((reg19 <= reg19) ? wire8 : (8'ha3)))}))
        begin
          if ($unsigned(($signed(({reg17} ?
                  $unsigned(wire4) : (wire6 ^~ wire21))) ?
              $unsigned($signed(reg16[(1'h1):(1'h0)])) : (wire8[(1'h0):(1'h0)] ?
                  {reg11[(1'h1):(1'h1)],
                      ((8'ha2) ^ (8'ha1))} : $unsigned(wire4[(3'h4):(1'h1)])))))
            begin
              reg22 <= ($signed((+(wire7 << $unsigned(reg9)))) ?
                  (reg19[(5'h13):(2'h3)] && wire21) : reg13);
              reg23 <= (7'h41);
              reg24 <= (reg11 <<< reg17);
              reg25 <= reg16;
            end
          else
            begin
              reg22 <= $signed({(reg13[(2'h2):(1'h1)] < (~{reg19})),
                  $signed(reg9[(2'h2):(2'h2)])});
              reg23 <= (8'ha2);
              reg24 <= $unsigned((^~{((reg13 || reg16) ^~ (+reg24)),
                  (+(8'hb6))}));
              reg25 <= reg12[(4'hc):(4'h8)];
            end
        end
      else
        begin
          reg22 <= wire4;
          reg23 <= wire7[(4'hb):(1'h0)];
          if ((^$unsigned(($signed((reg17 || reg13)) <= (~|$signed((8'ha3)))))))
            begin
              reg24 <= reg23[(1'h1):(1'h1)];
              reg25 <= {reg23};
              reg26 <= $unsigned({wire5[(1'h1):(1'h1)]});
            end
          else
            begin
              reg24 <= ((reg22 ?
                  $signed($signed($signed(reg17))) : ((~&(8'hb7)) ^ (8'haf))) > {$signed($unsigned($signed((8'hbe))))});
              reg25 <= ($unsigned((((reg11 ?
                      (8'ha9) : (8'haf)) - wire20[(3'h7):(3'h5)]) & (~|(reg10 > wire21)))) ?
                  (reg9 ?
                      ($unsigned($signed(wire2)) << $signed((^reg23))) : wire1[(2'h3):(1'h1)]) : $unsigned(wire0[(5'h14):(5'h14)]));
              reg26 <= reg14[(4'h8):(1'h0)];
            end
          reg27 <= reg24[(3'h5):(2'h3)];
          if (((8'ha6) - $unsigned({wire21, (-$signed((8'h9d)))})))
            begin
              reg28 <= (($unsigned(wire4[(5'h11):(1'h1)]) << $signed($signed($signed(wire4)))) <<< wire1);
              reg29 <= wire3[(4'he):(1'h1)];
              reg30 <= {($unsigned((^(wire2 - reg23))) << reg29[(2'h3):(2'h3)]),
                  reg15};
            end
          else
            begin
              reg28 <= $unsigned($signed((|$signed($signed(wire20)))));
              reg29 <= $signed((reg14 <= $signed(wire7[(4'hb):(1'h0)])));
            end
        end
      reg31 <= $unsigned(($unsigned($signed($signed((7'h40)))) ?
          ($unsigned(wire2[(5'h10):(4'h9)]) * {(&wire3)}) : (((reg30 ?
                      reg11 : wire5) ?
                  (+reg19) : (reg11 ? reg30 : reg12)) ?
              {$unsigned(reg16), wire5} : reg13[(4'hb):(4'h9)])));
      reg32 <= reg31[(3'h4):(1'h0)];
    end
endmodule
