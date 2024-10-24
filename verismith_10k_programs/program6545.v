module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire41,
                 wire37,
                 wire36,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg40,
                 reg39,
                 reg38,
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
                 reg16,
                 reg15,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (&wire1[(1'h0):(1'h0)]);
      reg5 <= wire2[(5'h12):(4'he)];
    end
  assign wire6 = $unsigned($unsigned($signed(($unsigned(wire2) || ((8'ha5) ?
                     wire1 : wire0)))));
  assign wire7 = (!($signed((&$signed((8'haf)))) + ($unsigned((8'h9c)) >= wire1[(1'h0):(1'h0)])));
  assign wire8 = wire7[(3'h5):(3'h5)];
  assign wire9 = reg4[(4'h8):(3'h7)];
  assign wire10 = $signed($unsigned({wire3, $signed({wire6, wire1})}));
  assign wire11 = (!({$unsigned((!wire6)), wire1} <= wire9));
  assign wire12 = ($unsigned((wire6[(4'ha):(1'h0)] ?
                      $unsigned(wire6) : ({wire6, reg5} ?
                          (wire10 ?
                              wire3 : (8'ha1)) : reg4[(4'h8):(1'h0)]))) + reg4[(3'h5):(2'h2)]);
  assign wire13 = ({((+{reg5, (7'h42)}) ?
                              $signed($signed(reg4)) : ($unsigned(wire10) < wire11))} ?
                      $unsigned($unsigned(wire0)) : wire11);
  assign wire14 = $signed((wire2 ^ wire13));
  always
    @(posedge clk) begin
      if (($signed((wire2 >= (-wire0[(5'h11):(2'h2)]))) - wire3[(4'h9):(2'h2)]))
        begin
          reg15 <= (($signed(((!wire11) > {reg5})) - $signed($signed($unsigned(wire11)))) ^~ reg4[(2'h3):(2'h3)]);
          reg16 <= $signed((wire11 <= $signed($unsigned(wire3))));
          reg17 <= reg5;
        end
      else
        begin
          if ({reg15})
            begin
              reg15 <= $unsigned($unsigned({$signed($signed(wire9))}));
              reg16 <= wire1[(1'h0):(1'h0)];
              reg17 <= wire8;
              reg18 <= $signed($unsigned((!wire10)));
              reg19 <= (wire8 ?
                  {(((+wire13) == {wire11}) >> $signed(reg5)),
                      ((|$signed(reg17)) ?
                          reg15[(2'h3):(1'h0)] : wire3)} : $signed((8'hb5)));
            end
          else
            begin
              reg15 <= (&((|$unsigned($unsigned(wire10))) ?
                  reg17[(2'h3):(1'h0)] : wire13[(3'h5):(3'h5)]));
              reg16 <= reg15[(5'h15):(3'h7)];
              reg17 <= $unsigned(wire8);
            end
          if ({(wire10 ? (8'haa) : (|$unsigned(((8'h9f) ? (8'hbd) : reg5))))})
            begin
              reg20 <= $unsigned((~|$unsigned(((~&(8'hb8)) >>> wire9))));
              reg21 <= wire10[(5'h12):(3'h4)];
              reg22 <= (^~(((&(reg5 >> wire6)) ?
                  $unsigned(((7'h44) ? reg4 : reg19)) : {$signed(reg15),
                      reg5[(1'h1):(1'h0)]}) ^~ ((~(wire0 ?
                  wire12 : wire14)) && $signed(reg17[(1'h0):(1'h0)]))));
              reg23 <= (reg18[(4'h8):(3'h5)] ^ wire0);
              reg24 <= ($signed(wire8[(1'h1):(1'h0)]) <= (reg23[(3'h5):(3'h4)] ?
                  reg17[(2'h2):(2'h2)] : $signed($signed(((8'h9f) < reg20)))));
            end
          else
            begin
              reg20 <= $signed(reg20[(3'h4):(2'h3)]);
              reg21 <= (+$unsigned(reg20));
              reg22 <= (^$unsigned(reg21));
              reg23 <= ($unsigned(($signed(reg22[(4'ha):(3'h5)]) || $signed(wire12))) ?
                  (|reg22) : {(reg24 ^~ {$signed(wire11), reg16})});
              reg24 <= (^$signed(reg24));
            end
          reg25 <= $signed(($unsigned({$unsigned(reg22), reg5}) ?
              $signed(reg18) : $unsigned({$signed((8'hb7)), (-(8'had))})));
          if ((&(^~(($unsigned(wire12) ?
              $unsigned((8'haa)) : {wire11, reg16}) ^~ (~&(reg4 ^ reg20))))))
            begin
              reg26 <= reg4[(2'h3):(1'h0)];
              reg27 <= wire14;
              reg28 <= $unsigned({reg25[(4'hc):(4'hc)],
                  $signed((~&(wire6 ? reg18 : wire11)))});
              reg29 <= $signed(wire3[(4'h9):(2'h2)]);
              reg30 <= $unsigned($signed(wire14));
            end
          else
            begin
              reg26 <= ((^($signed((wire1 ? (8'hb4) : (8'haf))) ?
                  $signed((~&wire13)) : ((reg21 >= reg24) ?
                      (reg21 - reg17) : {wire0}))) <<< wire9);
            end
          if ({wire1, (8'hb3)})
            begin
              reg31 <= ($unsigned(reg4[(1'h1):(1'h1)]) ?
                  ((^$signed((reg20 >= (8'ha4)))) ?
                      (((wire11 <= wire0) >> (reg28 ? wire3 : wire3)) ?
                          ((reg4 ?
                              (8'hb5) : (8'hb8)) | (wire1 != (7'h41))) : reg29[(4'ha):(4'h8)]) : (8'ha6)) : $unsigned(wire11));
              reg32 <= (~^((reg29[(1'h0):(1'h0)] ?
                      reg19[(3'h5):(3'h4)] : wire8) ?
                  reg15[(5'h11):(2'h2)] : reg27));
              reg33 <= ($signed(wire12[(2'h2):(1'h0)]) <<< reg29[(3'h6):(1'h0)]);
              reg34 <= (&(({(reg5 | reg33), wire6} ?
                  reg19 : reg28) ^ (((!reg29) ? (&reg4) : $signed(wire8)) ?
                  ($signed(reg31) ?
                      $unsigned(reg17) : (~reg22)) : ($unsigned(reg30) ?
                      (wire1 ? reg30 : reg22) : (wire11 ? wire1 : reg28)))));
            end
          else
            begin
              reg31 <= $signed($unsigned(($unsigned({reg17,
                  wire3}) << {$signed(wire9)})));
              reg32 <= $signed({((8'ha6) ?
                      ((reg17 ?
                          reg23 : reg29) - wire12) : $signed(reg22[(3'h4):(2'h3)])),
                  ((-$unsigned(wire7)) ?
                      $unsigned($signed(reg4)) : {(8'h9e), $unsigned(wire2)})});
              reg33 <= ($signed((^~(wire1[(2'h2):(1'h1)] >>> $signed(wire6)))) == $unsigned($signed((-(~wire1)))));
              reg34 <= $unsigned((~|(8'ha6)));
              reg35 <= (-$signed((($signed((8'h9d)) ~^ (-(8'hb6))) ?
                  wire12 : $unsigned(reg25[(4'hc):(1'h0)]))));
            end
        end
    end
  assign wire36 = wire3[(3'h6):(1'h0)];
  assign wire37 = ({$signed(wire0[(2'h3):(1'h1)]), (|$signed(reg4))} ?
                      ((!(&$unsigned(reg29))) ?
                          reg35 : wire14[(3'h6):(2'h2)]) : $signed($signed($unsigned((reg27 <= (8'haf))))));
  always
    @(posedge clk) begin
      reg38 <= reg34;
      reg39 <= reg28[(1'h0):(1'h0)];
      reg40 <= (($signed((reg15 ?
              {(7'h44),
                  reg30} : wire11[(3'h6):(3'h6)])) >= wire1[(2'h2):(1'h0)]) ?
          $signed($unsigned(reg34[(3'h6):(2'h2)])) : (|{$unsigned((reg39 && reg30))}));
    end
  assign wire41 = ((^~wire8[(4'h9):(3'h4)]) ?
                      reg31 : ($unsigned(((reg5 == reg35) ?
                              (reg39 != reg31) : reg19)) ?
                          $unsigned(reg39) : (~|reg30)));
endmodule
