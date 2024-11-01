module top
#(parameter param57 = (+(((~(~(8'hb6))) & (((8'had) ^~ (8'h9e)) <<< ((8'ha7) ? (8'h9c) : (8'hac)))) ? (~^(8'hb0)) : (8'ha4))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire14,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (wire3[(2'h2):(1'h1)] ?
                     $unsigned(((^~$signed(wire0)) | $signed({wire4,
                         wire0}))) : (+wire3[(2'h3):(1'h0)]));
  assign wire6 = $unsigned(wire2);
  assign wire7 = wire6[(4'hb):(4'h9)];
  assign wire8 = (({wire2[(3'h5):(1'h0)],
                             ((wire5 || (7'h43)) & (wire0 - wire7))} ?
                         ($signed($signed(wire6)) ?
                             (wire2[(3'h5):(2'h2)] >>> $signed((8'ha1))) : {wire6[(3'h7):(1'h1)],
                                 wire2[(1'h0):(1'h0)]}) : (~(wire0[(4'h9):(3'h4)] < wire5))) ?
                     (($signed((+(8'ha2))) ?
                         (&$signed(wire5)) : wire7[(3'h7):(3'h7)]) | ($signed((&wire4)) ?
                         (wire5[(3'h4):(3'h4)] ?
                             $signed(wire1) : (^~wire5)) : $signed($signed((8'hbf))))) : wire3[(1'h0):(1'h0)]);
  assign wire9 = (wire8[(2'h3):(1'h1)] | ($unsigned((wire6 == (-wire4))) & wire6[(4'hc):(4'h8)]));
  always
    @(posedge clk) begin
      reg10 <= $signed(({((wire8 ~^ wire0) == wire0[(4'hd):(4'ha)])} || wire3[(2'h3):(1'h1)]));
      reg11 <= wire7[(3'h4):(2'h3)];
      reg12 <= {{wire0}, ($unsigned($unsigned({(8'h9d)})) & wire8)};
    end
  assign wire13 = $unsigned(reg12[(5'h10):(4'hf)]);
  assign wire14 = reg12;
  always
    @(posedge clk) begin
      reg15 <= (-(~^wire0[(4'h8):(1'h0)]));
      if ((wire4 ^~ ($unsigned(wire8) * $unsigned((wire9 ?
          wire7 : (wire1 >> wire5))))))
        begin
          reg16 <= ($signed(reg12[(1'h1):(1'h1)]) | $signed(reg10[(3'h5):(1'h0)]));
          reg17 <= (wire6[(4'hb):(1'h1)] ?
              (($unsigned(reg16[(3'h4):(2'h2)]) ?
                      {wire4[(3'h4):(2'h2)],
                          $signed(reg11)} : $signed(reg16[(1'h0):(1'h0)])) ?
                  $signed(($signed(wire4) << (wire3 & reg15))) : ((reg15 ?
                      $signed((8'haa)) : {wire4,
                          wire4}) && $signed((wire9 + wire8)))) : (~&reg10[(4'h9):(3'h6)]));
          reg18 <= (8'ha0);
          if (($unsigned((8'h9d)) >> ($unsigned(reg10[(2'h2):(2'h2)]) <<< $signed($unsigned(wire1[(2'h2):(1'h0)])))))
            begin
              reg19 <= (!(!reg15[(2'h2):(2'h2)]));
              reg20 <= ($signed((&reg18[(3'h6):(1'h1)])) ?
                  $signed(($signed($signed(wire2)) || ($unsigned((8'hb1)) ?
                      wire9 : reg19[(3'h6):(1'h1)]))) : (^~(!((reg11 ?
                      reg17 : reg17) ^~ $unsigned((8'hba))))));
              reg21 <= reg16;
              reg22 <= (wire8 ?
                  (reg21 ?
                      ((wire6 <= (^~wire1)) > $unsigned({wire6})) : wire4[(2'h3):(1'h1)]) : reg20);
            end
          else
            begin
              reg19 <= (($unsigned(wire2[(1'h1):(1'h0)]) ?
                  wire7 : (-((wire2 ? reg18 : reg17) ?
                      wire9[(1'h0):(1'h0)] : {reg21,
                          reg10}))) != $unsigned(reg22[(4'h8):(3'h5)]));
            end
        end
      else
        begin
          reg16 <= $signed(({wire6} ? $unsigned((8'ha1)) : $signed(reg22)));
          if ((-wire5[(4'h9):(4'h8)]))
            begin
              reg17 <= {reg17[(1'h1):(1'h0)], (8'hb1)};
            end
          else
            begin
              reg17 <= ((|(wire8[(1'h1):(1'h0)] ^ ((8'hac) | (^reg16)))) ?
                  wire1 : $signed($unsigned(reg11)));
              reg18 <= $signed((({reg20[(2'h2):(2'h2)],
                  (wire0 + wire0)} >> (reg18[(3'h6):(3'h4)] & (~^(8'hac)))) || (8'hb1)));
              reg19 <= ((!$signed(wire5)) ?
                  {($signed((7'h43)) && {(reg20 == wire0),
                          wire4[(4'h8):(1'h0)]}),
                      $signed({(wire2 ? (8'hab) : reg20),
                          (|wire9)})} : reg22[(3'h6):(3'h6)]);
            end
          reg20 <= ($unsigned(reg10[(3'h5):(2'h2)]) ?
              $signed($unsigned(($unsigned(wire3) ?
                  (^~reg20) : $unsigned(reg12)))) : (((~(reg18 || (7'h43))) ^~ {$signed((8'ha4)),
                  reg22[(2'h3):(2'h3)]}) || reg11));
        end
      reg23 <= wire1;
      reg24 <= $signed({((((8'hbe) ? reg12 : reg21) * (wire0 == reg17)) ?
              (~&(wire3 ? wire7 : reg16)) : reg20[(1'h1):(1'h1)])});
    end
  always
    @(posedge clk) begin
      reg25 <= reg20;
      reg26 <= ($signed($signed(((wire1 ? reg21 : (8'hb2)) * $signed(reg20)))) ?
          reg24 : $unsigned((^~$signed($unsigned(wire2)))));
      reg27 <= $signed({(8'ha0), (reg18[(1'h1):(1'h1)] <= {$unsigned(wire2)})});
    end
  assign wire28 = $signed(reg27[(4'hc):(4'h9)]);
  assign wire29 = (~^(((!reg24) ?
                          (~^(wire6 ? wire3 : reg10)) : reg27[(1'h0):(1'h0)]) ?
                      $signed(wire2) : (8'ha8)));
  assign wire30 = wire4[(4'hd):(3'h6)];
  assign wire31 = ($unsigned($signed(reg10)) ?
                      wire7[(1'h1):(1'h1)] : $unsigned($unsigned($unsigned(wire6[(3'h5):(2'h3)]))));
  always
    @(posedge clk) begin
      reg32 <= {($signed((~^(reg23 ? reg25 : wire5))) & wire28),
          wire30[(2'h2):(1'h1)]};
      reg33 <= {$unsigned($unsigned((wire28 ~^ $unsigned(reg27)))),
          (|$signed(((!(8'hba)) ? (+reg11) : (^~reg27))))};
      if (wire1[(1'h0):(1'h0)])
        begin
          reg34 <= (8'ha8);
          if (({reg22[(4'ha):(4'h8)]} + wire3[(1'h0):(1'h0)]))
            begin
              reg35 <= $unsigned((reg11[(4'h9):(4'h8)] ?
                  reg32[(3'h5):(2'h3)] : (reg32[(4'h8):(3'h4)] ?
                      (reg22 ?
                          ((8'hb6) && reg34) : {reg32, (8'hb7)}) : (~&(wire7 ?
                          reg11 : reg24)))));
              reg36 <= {((reg23 ^ (^~wire2)) * wire4)};
              reg37 <= wire31[(4'hb):(1'h1)];
              reg38 <= {(wire29[(1'h0):(1'h0)] ?
                      wire1 : (reg34[(2'h3):(2'h2)] ?
                          {(~(8'ha6))} : $signed($signed(wire29)))),
                  $signed($unsigned(wire0[(4'hf):(4'ha)]))};
              reg39 <= (|wire31[(4'hb):(2'h3)]);
            end
          else
            begin
              reg35 <= (reg18[(3'h6):(3'h6)] ?
                  $signed((reg20 ?
                      (~&(reg23 > reg12)) : (&{wire7}))) : (+(|$signed({wire13,
                      reg33}))));
              reg36 <= reg27[(4'h9):(3'h6)];
              reg37 <= {wire9[(1'h1):(1'h0)]};
              reg38 <= (reg18 << wire2[(3'h4):(1'h0)]);
            end
          if ($signed((reg17[(4'h8):(4'h8)] <<< (((reg36 ^~ reg18) && (&reg39)) <= (8'hba)))))
            begin
              reg40 <= wire14[(3'h6):(2'h2)];
              reg41 <= $unsigned((+(+{wire31, $signed((8'hae))})));
              reg42 <= $signed(reg10[(4'ha):(3'h4)]);
              reg43 <= ((reg22 ?
                  reg26[(1'h0):(1'h0)] : (^~$unsigned(reg41[(4'ha):(3'h7)]))) >> wire0[(4'hd):(4'hb)]);
              reg44 <= reg36;
            end
          else
            begin
              reg40 <= ($unsigned({reg23[(3'h6):(1'h0)],
                  ($signed(wire13) ?
                      (-wire2) : wire3)}) <= $unsigned($signed(wire2[(3'h7):(2'h2)])));
              reg41 <= $unsigned({$unsigned(((wire13 ?
                      (8'hb4) : reg37) - (reg37 ? reg35 : reg37))),
                  reg16[(3'h7):(3'h6)]});
            end
          if (wire5[(4'hb):(4'ha)])
            begin
              reg45 <= (-$unsigned($signed((^~(wire5 <= reg20)))));
            end
          else
            begin
              reg45 <= (^~reg41[(4'h9):(1'h0)]);
            end
          reg46 <= wire6;
        end
      else
        begin
          if (wire9[(3'h5):(2'h3)])
            begin
              reg34 <= wire14;
              reg35 <= $signed(reg21[(2'h2):(2'h2)]);
              reg36 <= wire7[(1'h0):(1'h0)];
            end
          else
            begin
              reg34 <= reg25;
              reg35 <= $unsigned(((&$signed($unsigned(reg41))) & reg35[(4'hd):(4'hd)]));
              reg36 <= reg25;
            end
          reg37 <= (!reg18);
        end
      reg47 <= ((~|wire9[(2'h2):(1'h0)]) ?
          {(~reg15[(2'h2):(1'h1)]),
              ({reg37} ?
                  ((8'hb0) ?
                      (^~reg21) : $unsigned(reg16)) : ((wire13 << reg10) ?
                      reg24[(4'h8):(3'h5)] : reg32))} : ((~&$unsigned((+wire28))) ?
              wire31[(4'hc):(3'h7)] : reg15));
      reg48 <= (((8'haf) ^ ($unsigned($signed(wire1)) ?
              reg25[(4'h9):(1'h0)] : wire3)) ?
          $signed($signed(({wire0} ?
              (8'ha2) : reg17))) : ((($unsigned((8'h9f)) >>> reg25) ?
              {(~^wire8), {reg45}} : $unsigned($signed(reg12))) >>> wire1));
    end
  assign wire49 = {$signed((+$unsigned((|wire3)))),
                      ($unsigned($unsigned($unsigned(reg20))) ?
                          reg35[(4'hb):(2'h3)] : $unsigned(reg19))};
  assign wire50 = reg17[(2'h3):(1'h0)];
  assign wire51 = $signed(({((wire3 + reg35) ?
                          ((8'ha0) ~^ wire14) : reg41[(3'h6):(2'h3)]),
                      $signed((reg47 >= reg32))} << $unsigned(({reg41} ?
                      reg23[(1'h1):(1'h1)] : reg15))));
  assign wire52 = $unsigned($signed((8'h9f)));
  assign wire53 = $signed((~^$unsigned($unsigned((8'ha1)))));
  assign wire54 = reg25[(5'h10):(3'h7)];
  assign wire55 = wire30[(1'h1):(1'h0)];
  assign wire56 = wire4[(4'hc):(3'h5)];
endmodule
