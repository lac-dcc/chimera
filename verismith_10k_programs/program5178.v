module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire9,
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
                 (1'h0)};
  assign wire4 = {$signed((~|wire1)),
                     (wire2[(4'ha):(1'h1)] ?
                         ($unsigned(wire2[(4'hb):(2'h3)]) | (wire1[(3'h6):(3'h6)] ?
                             {wire3} : (^wire0))) : wire2)};
  assign wire5 = $unsigned($signed(({wire3, wire0} ?
                     (^$signed(wire3)) : (8'ha6))));
  assign wire6 = (8'hb1);
  assign wire7 = wire5;
  assign wire8 = ($signed(wire1) ?
                     (wire6[(4'hc):(2'h3)] || (wire7[(4'hc):(4'h9)] ?
                         wire7 : $signed((wire7 ?
                             wire2 : (8'ha6))))) : (^$signed(wire7[(3'h5):(3'h4)])));
  assign wire9 = wire4;
  always
    @(posedge clk) begin
      reg10 <= wire1;
      reg11 <= {(((wire5[(1'h1):(1'h0)] ? (wire7 ? wire3 : wire0) : (~&wire0)) ?
                  (^~wire4) : wire0) ?
              {wire2[(4'h9):(1'h0)],
                  (^~(^~wire9))} : ($unsigned((~&wire9)) | ((wire4 ?
                      wire4 : wire7) ?
                  (^~wire0) : wire3))),
          ($unsigned(({wire4} & $signed((8'ha5)))) ?
              wire8[(4'hb):(4'h9)] : wire1)};
      reg12 <= ((wire4 ?
          $signed(wire6[(4'ha):(2'h2)]) : {$unsigned({wire3,
                  wire8})}) && (|(wire0[(3'h4):(2'h2)] ?
          reg11 : ($signed(wire0) ^ wire6[(2'h2):(2'h2)]))));
      reg13 <= ($signed($unsigned(((8'h9c) ?
          (-(8'had)) : wire0[(1'h1):(1'h0)]))) <= {$unsigned((|(~wire8)))});
      reg14 <= wire9;
    end
  always
    @(posedge clk) begin
      reg15 <= ((|wire7[(5'h11):(3'h5)]) ?
          wire7 : $signed(wire7[(4'he):(4'he)]));
      reg16 <= $unsigned(((reg12 + reg11[(2'h2):(2'h2)]) ?
          {$signed(((8'hac) >= reg15)),
              $unsigned((wire6 > wire4))} : (wire3[(3'h5):(3'h5)] != wire3[(5'h10):(4'h8)])));
      reg17 <= reg13[(2'h2):(1'h1)];
      reg18 <= $signed(($signed((&{wire2})) ?
          $unsigned((~^(wire7 > wire4))) : $unsigned(reg13[(2'h2):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg19 <= (+((8'h9f) == $unsigned($unsigned(wire3[(1'h1):(1'h1)]))));
      if (wire2)
        begin
          reg20 <= (+wire0[(4'h8):(1'h0)]);
          reg21 <= (&((7'h42) ?
              ($unsigned((reg11 ? reg11 : wire8)) <<< {(reg15 ? reg20 : wire8),
                  (reg17 ? wire0 : reg20)}) : $signed((|(reg13 ?
                  (8'ha3) : wire2)))));
          reg22 <= (+$unsigned(wire9));
          if ((!$signed({(!((7'h42) <<< wire9)), ((+reg15) - (&(8'hac)))})))
            begin
              reg23 <= reg17[(3'h4):(2'h2)];
              reg24 <= $unsigned($signed({$signed((reg19 + wire1)), reg13}));
              reg25 <= reg23[(3'h5):(3'h5)];
              reg26 <= wire7[(4'h8):(1'h1)];
            end
          else
            begin
              reg23 <= $signed((~|{((wire2 ?
                      wire1 : (8'hb8)) ^~ $signed(wire0)),
                  {(reg11 ? wire5 : reg12)}}));
              reg24 <= $unsigned(((reg22 ?
                      $unsigned({wire8}) : ($unsigned(reg11) & (wire3 ?
                          reg15 : reg11))) ?
                  reg25[(3'h5):(2'h3)] : ($signed({reg13,
                      reg20}) <<< (~$signed(wire8)))));
            end
        end
      else
        begin
          reg20 <= reg11;
        end
      reg27 <= wire0;
      if (((^$signed(reg23[(3'h7):(3'h4)])) ~^ $signed(($unsigned(((7'h43) && wire6)) ?
          $signed((reg17 ? (8'hb3) : reg12)) : reg27[(5'h12):(4'hc)]))))
        begin
          reg28 <= $unsigned((($unsigned((^~reg14)) >> $signed({reg11,
                  reg17})) ?
              (((8'hb3) ?
                  $unsigned(wire8) : reg21[(1'h1):(1'h1)]) ^ ($unsigned(wire6) ?
                  (wire8 <= (8'ha7)) : $signed((8'h9e)))) : (^~reg11[(1'h1):(1'h1)])));
          reg29 <= wire5[(1'h1):(1'h1)];
          if ((!$unsigned((($signed(reg16) ?
                  wire9[(4'he):(4'ha)] : (reg21 < (8'haa))) ?
              (~^reg23) : (&$signed(reg16))))))
            begin
              reg30 <= ($unsigned($unsigned((((8'hb2) ? reg27 : reg24) ?
                  (8'ha4) : {reg27, wire7}))) > reg17);
            end
          else
            begin
              reg30 <= reg12;
              reg31 <= {$unsigned(wire2[(3'h7):(3'h6)])};
              reg32 <= wire6[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg28 <= (($signed($unsigned(reg30)) ?
              (($unsigned(wire2) ? (reg21 << (8'ha9)) : $signed(wire9)) ?
                  (reg31[(4'h9):(2'h2)] | (~|wire9)) : $unsigned((reg30 ?
                      (8'ha2) : reg18))) : reg12) <= (($unsigned((8'ha5)) >= {$unsigned(reg25)}) >>> (wire9[(5'h10):(4'h9)] ?
              $signed((-reg23)) : reg29)));
          if ($unsigned({(({reg20} ? (reg15 <<< wire5) : (~&reg24)) ?
                  (8'ha3) : (~^$unsigned(reg25)))}))
            begin
              reg29 <= (7'h41);
              reg30 <= $unsigned((8'hb2));
              reg31 <= (~$signed(({(!reg19)} > ((~|reg23) ?
                  $signed(reg24) : reg16[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg29 <= $signed(wire9[(4'h8):(4'h8)]);
              reg30 <= reg20;
            end
        end
    end
  assign wire33 = ($unsigned((~^((reg14 ? reg24 : reg12) ?
                          reg23[(3'h6):(3'h4)] : reg17))) ?
                      wire0 : reg10[(4'h9):(2'h2)]);
  assign wire34 = {(+{$signed((wire8 ? wire9 : (8'hae))), (8'hb4)})};
endmodule
