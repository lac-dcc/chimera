module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg18,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed(wire0[(4'ha):(3'h6)]);
  assign wire5 = ($signed($unsigned(wire1)) ?
                     (!$signed($unsigned((wire1 && wire2)))) : $unsigned(((wire2 ?
                             wire3 : wire4) ?
                         $unsigned(wire1) : ($unsigned(wire2) ^ $unsigned(wire2)))));
  assign wire6 = ((|$signed($signed((wire0 << wire5)))) ?
                     $signed({((wire5 >= wire0) > (wire1 + wire5)),
                         wire4}) : wire5);
  assign wire7 = $unsigned((wire0[(1'h0):(1'h0)] * (|$signed((wire4 <<< wire1)))));
  assign wire8 = $signed(($signed($signed((8'h9c))) << ((8'h9e) <<< $unsigned((~^(8'hb5))))));
  always
    @(posedge clk) begin
      reg9 <= {{wire2},
          $signed((($signed(wire5) * wire5[(2'h3):(2'h2)]) ~^ ($unsigned((8'ha9)) ?
              $signed(wire2) : $signed(wire5))))};
      if (wire7[(3'h6):(3'h4)])
        begin
          reg10 <= (~{wire0[(3'h6):(1'h1)], wire7[(3'h4):(3'h4)]});
          if ((8'hb7))
            begin
              reg11 <= ($signed(wire3[(3'h4):(3'h4)]) >= (^~($unsigned({(7'h42),
                      reg9}) ?
                  $unsigned($unsigned((8'hb8))) : (~(~&wire1)))));
              reg12 <= ($signed(wire3) - reg10);
              reg13 <= (((|(-$unsigned((8'hbf)))) ^ (($unsigned(wire5) ?
                          $unsigned(wire7) : (wire1 >>> (8'ha8))) ?
                      ((~^wire1) ? wire3 : (^~wire7)) : ({wire5} ?
                          $signed(reg10) : wire2))) ?
                  wire0[(2'h3):(2'h3)] : wire7);
            end
          else
            begin
              reg11 <= ($signed(($unsigned((reg12 ? reg10 : wire2)) < wire2)) ?
                  (+wire4) : wire0);
              reg12 <= (~^(~^wire3[(4'h9):(1'h1)]));
              reg13 <= wire4[(3'h4):(2'h2)];
              reg14 <= {((reg11 ?
                      ((wire4 >>> (7'h42)) || reg12[(3'h6):(3'h4)]) : ((-wire1) >> wire7[(1'h1):(1'h1)])) >= $unsigned(((wire0 ?
                      reg9 : wire6) <= wire4))),
                  (^~(~&{$signed(wire2), (reg10 ? (8'h9e) : wire4)}))};
              reg15 <= ((~{(7'h43), $signed(wire3)}) ?
                  $signed((($signed(wire3) != (wire3 == reg14)) > (~$unsigned(reg9)))) : (~&$unsigned($unsigned({wire7,
                      wire6}))));
            end
        end
      else
        begin
          if (reg9[(3'h4):(1'h0)])
            begin
              reg10 <= $unsigned($unsigned({wire0[(4'ha):(1'h1)]}));
              reg11 <= (8'h9c);
            end
          else
            begin
              reg10 <= {((({wire3} ? {reg13} : (8'haf)) ?
                      reg13 : reg10[(3'h4):(1'h0)]) <<< wire7),
                  $signed((wire5[(1'h0):(1'h0)] >> $unsigned(wire3)))};
              reg11 <= {(^($unsigned((^~wire1)) > (~^(reg10 ^ reg12))))};
            end
          reg12 <= {($signed($signed($unsigned(reg13))) ?
                  ((&$signed(reg15)) ?
                      reg15 : $signed(wire0[(3'h6):(3'h6)])) : (|$unsigned($signed(wire6)))),
              ((wire1 ?
                      (wire6[(2'h2):(2'h2)] ?
                          $unsigned(reg15) : (~reg13)) : (^~(~wire5))) ?
                  ({$unsigned(reg13)} > (&wire2)) : {(~^reg12[(1'h0):(1'h0)])})};
          reg13 <= wire7[(3'h4):(1'h1)];
          reg14 <= (reg14[(2'h2):(2'h2)] ?
              wire5[(1'h1):(1'h0)] : (($signed((reg11 ^ reg12)) ?
                      wire7 : (+$unsigned((8'h9e)))) ?
                  (wire4[(2'h3):(1'h0)] ^~ $signed((^~wire5))) : wire0));
          reg15 <= ($unsigned((~&wire6)) & $unsigned(($signed({wire7}) - ({reg10} << wire6))));
        end
    end
  assign wire16 = ({(~&(reg10 >> $unsigned(wire4))),
                      wire0[(4'ha):(3'h7)]} << $unsigned(wire1));
  assign wire17 = (wire3[(4'h8):(3'h4)] ?
                      $signed(((((8'had) ? wire0 : wire3) ^~ wire6) ?
                          (^~$signed(wire3)) : (+reg11))) : wire3[(3'h6):(3'h5)]);
  always
    @(posedge clk) begin
      reg18 <= $unsigned((reg11[(1'h0):(1'h0)] + $unsigned($signed(reg11))));
    end
endmodule
