module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire38, wire36, wire5, wire4, (1'h0)};
  assign wire4 = (wire2 - ($unsigned(wire3) | $unsigned(wire0[(1'h0):(1'h0)])));
  assign wire5 = (($signed(wire4) ?
                         ($unsigned(wire0[(1'h0):(1'h0)]) > $unsigned({(8'haa),
                             wire2})) : wire1[(3'h6):(2'h2)]) ?
                     $unsigned((8'h9d)) : wire2);
  module6 #() modinst37 (.wire10(wire4), .wire7(wire1), .clk(clk), .wire8(wire3), .wire9(wire2), .y(wire36));
  assign wire38 = ($signed(((((8'hb8) ?
                      wire1 : wire36) <<< wire4[(4'hb):(4'h9)]) > wire1)) <= $signed({(wire36[(2'h3):(1'h1)] ?
                          (wire36 ? wire4 : wire2) : {wire3}),
                      ((8'ha9) && wire0[(1'h0):(1'h0)])}));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire12,
                 wire11,
                 reg35,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = (|(wire10[(4'hd):(3'h6)] ^~ wire7[(4'hb):(2'h2)]));
  assign wire12 = wire9;
  always
    @(posedge clk) begin
      reg13 <= wire12[(2'h2):(1'h1)];
      reg14 <= wire7;
      reg15 <= wire7;
      reg16 <= $unsigned((^(~$unsigned(wire10[(3'h6):(3'h4)]))));
    end
  assign wire17 = $unsigned((((8'ha6) == ((wire8 && reg15) ^ (^~reg15))) < wire9));
  assign wire18 = wire12[(3'h7):(2'h2)];
  assign wire19 = (~({((wire12 || reg14) ?
                          reg16 : $unsigned(reg14))} == {(wire11[(3'h4):(2'h2)] || (wire12 >> wire7))}));
  assign wire20 = ($signed(wire11) || (8'hbb));
  always
    @(posedge clk) begin
      if ($unsigned(((|$signed((^~reg13))) ?
          wire8 : (wire9 + {$unsigned(wire8)}))))
        begin
          reg21 <= $signed((~^(reg14[(2'h2):(1'h0)] ? wire18 : {(~^wire17)})));
          if ((^~wire11))
            begin
              reg22 <= wire11[(3'h5):(1'h0)];
              reg23 <= ($unsigned($signed(wire8[(5'h10):(4'hb)])) ?
                  ($signed(wire7) ?
                      wire9 : (^~$signed(wire17[(1'h0):(1'h0)]))) : $signed(reg16));
            end
          else
            begin
              reg22 <= wire19;
            end
          if ($signed(reg13[(2'h2):(1'h0)]))
            begin
              reg24 <= $signed((($unsigned((~wire10)) ^~ {(8'hbb)}) ?
                  $unsigned((8'ha1)) : wire17));
              reg25 <= ((^$unsigned(({(8'hac)} ?
                  $unsigned(reg22) : (reg24 ? (7'h41) : reg23)))) << reg15);
            end
          else
            begin
              reg24 <= $unsigned($unsigned(reg24));
              reg25 <= reg22;
              reg26 <= $signed({wire17[(5'h12):(4'hb)],
                  ((~|$signed(wire20)) < ((reg21 ? wire10 : reg22) ?
                      reg15 : $signed(reg22)))});
            end
        end
      else
        begin
          if ((!$signed({reg26[(4'h8):(4'h8)],
              $signed((wire17 ? wire9 : (8'hb6)))})))
            begin
              reg21 <= {{$unsigned(({(8'hb5), wire9} ^ (~^(8'ha5)))),
                      $signed((-(~reg24)))}};
              reg22 <= (-$signed((($signed((8'ha5)) || (wire11 >> wire8)) ?
                  (&$unsigned((8'ha3))) : $signed(wire20))));
            end
          else
            begin
              reg21 <= reg24;
              reg22 <= ((wire11 < reg22[(4'hb):(4'h8)]) <<< (~^wire18));
              reg23 <= reg25;
              reg24 <= $signed(($unsigned(($unsigned(wire7) != reg24[(3'h7):(3'h5)])) ?
                  (8'hbc) : reg13[(2'h3):(2'h2)]));
            end
          reg25 <= (-($signed(reg16) ?
              $signed($unsigned((reg24 > wire17))) : reg13));
        end
      if (reg22)
        begin
          reg27 <= wire8[(4'h9):(2'h3)];
          reg28 <= (-{$signed((-wire20))});
          reg29 <= $signed({$signed($unsigned(reg14[(1'h0):(1'h0)]))});
          reg30 <= wire9;
        end
      else
        begin
          if (((-$signed(((reg24 <= reg16) | (wire18 ^ wire8)))) ?
              $unsigned({(~|$signed((8'hae))),
                  {reg23}}) : $unsigned($unsigned($signed($signed(reg23))))))
            begin
              reg27 <= (8'hba);
            end
          else
            begin
              reg27 <= ((~^$signed(((!(8'hb5)) == (wire10 ?
                      (8'ha2) : (8'haf))))) ?
                  $signed(wire8[(1'h1):(1'h1)]) : reg16[(3'h5):(1'h1)]);
              reg28 <= ($unsigned(reg14) ? wire8 : reg14);
              reg29 <= (reg28 >>> ($signed(reg13[(2'h2):(1'h0)]) ?
                  $signed((~^$unsigned(wire20))) : reg25[(4'h8):(1'h1)]));
              reg30 <= ((|(reg30 ^~ ((wire12 ?
                      reg22 : reg28) ^ $unsigned(reg25)))) ?
                  $signed(((reg24 ?
                      $unsigned(reg15) : (^~wire20)) && ($unsigned(reg13) << {wire7,
                      reg27}))) : (^~$signed($unsigned({wire9, reg14}))));
            end
        end
    end
  assign wire31 = $unsigned(reg29[(4'he):(3'h5)]);
  assign wire32 = $signed({wire19[(5'h14):(2'h3)]});
  assign wire33 = $signed((~^(~((wire18 || wire20) ^ {wire11, (8'h9c)}))));
  assign wire34 = {reg27[(2'h2):(1'h0)]};
  always
    @(posedge clk) begin
      reg35 <= reg25[(3'h6):(3'h4)];
    end
endmodule
