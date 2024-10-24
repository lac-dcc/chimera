module top
#(parameter param41 = {({(^((8'hb5) || (7'h43))), (~^((8'hb7) >> (8'hbf)))} ? ({((8'haf) ? (7'h40) : (8'ha5)), ((8'ha3) != (8'ha1))} >>> (|((7'h44) ^ (8'hb9)))) : {(8'haf)}), (8'hba)}, 
parameter param42 = {(^~param41), (param41 - {param41})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire15,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire3;
  module6 #() modinst16 (wire15, clk, wire4, wire0, wire2, wire5);
  always
    @(posedge clk) begin
      if (((7'h42) ?
          {(((&wire15) ? $signed(wire3) : wire15[(4'h9):(3'h7)]) >> ({wire1,
                      (8'h9e)} ?
                  (wire5 * wire0) : $unsigned(wire2))),
              ((wire0[(3'h6):(2'h2)] - (wire4 <= wire3)) ?
                  (wire1 ? wire0 : $unsigned((8'ha2))) : $signed((wire5 ?
                      (8'h9f) : wire3)))} : wire0[(1'h0):(1'h0)]))
        begin
          reg17 <= (^~(~^(|$unsigned((wire5 <= wire15)))));
          reg18 <= {reg17[(3'h4):(2'h3)]};
          if ((^((!$signed(wire2[(5'h10):(2'h3)])) - (wire4 | reg17))))
            begin
              reg19 <= $signed(({wire3} < wire2));
              reg20 <= (~wire2[(4'hd):(1'h0)]);
              reg21 <= wire1;
              reg22 <= (wire1[(4'ha):(2'h3)] >> reg18);
            end
          else
            begin
              reg19 <= {$unsigned($unsigned((^~(reg18 * reg20))))};
              reg20 <= ((reg19[(4'hc):(4'h9)] > $unsigned((~^wire3[(1'h1):(1'h1)]))) ?
                  (~|$signed(reg17)) : $unsigned($unsigned($unsigned((reg17 ?
                      reg18 : reg20)))));
              reg21 <= ((($signed(((8'ha5) & wire1)) ?
                      $signed($unsigned(wire3)) : {(8'hb0)}) ?
                  (({wire2} >> ((7'h44) ? (7'h41) : wire2)) ?
                      ($signed(wire0) >= (^(8'hb2))) : reg22[(3'h4):(1'h1)]) : (!$signed(wire3[(3'h5):(2'h3)]))) >= {$signed(((wire3 * wire15) ?
                      $signed(wire15) : (reg20 ? reg17 : reg17)))});
              reg22 <= wire1;
              reg23 <= ($signed((~&($unsigned((8'hb2)) >> (reg22 >>> wire2)))) ?
                  {(^reg18[(3'h5):(3'h4)]), wire5} : wire5[(1'h0):(1'h0)]);
            end
          reg24 <= ({((wire15[(4'hb):(4'hb)] ~^ wire1) & $unsigned((!reg23)))} ?
              $unsigned(($signed((+wire15)) ?
                  reg19[(4'ha):(3'h4)] : ((reg19 < reg17) == {wire3}))) : reg18[(3'h6):(1'h0)]);
          reg25 <= $unsigned(wire2[(5'h13):(4'hd)]);
        end
      else
        begin
          reg17 <= wire4[(4'hd):(1'h1)];
          if ((~&$signed((~^$unsigned($signed(reg23))))))
            begin
              reg18 <= reg24[(1'h1):(1'h0)];
              reg19 <= wire4;
              reg20 <= (wire0 ^ $unsigned(($signed((reg18 >> wire0)) ?
                  $signed({reg21}) : $unsigned((~^reg23)))));
              reg21 <= (+({reg17,
                  reg23[(1'h1):(1'h1)]} || $signed((reg19[(5'h12):(4'h9)] == (reg25 ?
                  reg24 : (7'h40))))));
            end
          else
            begin
              reg18 <= $signed((wire5 ?
                  $signed(($unsigned(reg24) < (wire5 < reg17))) : $unsigned($signed(reg17))));
              reg19 <= ({((+wire3) ? (~|reg23) : $signed(reg22[(1'h0):(1'h0)])),
                      {((reg23 ? wire3 : wire3) ?
                              $signed(wire5) : $unsigned(reg19)),
                          ($signed((8'hb6)) <<< (reg23 <<< reg20))}} ?
                  {$signed((reg23[(3'h4):(1'h0)] >>> $signed(reg21))),
                      wire15[(4'hb):(2'h2)]} : reg19[(5'h10):(4'hb)]);
              reg20 <= ((($unsigned(reg19) ? ({reg21} || (^wire4)) : reg21) ?
                  {(+$unsigned((8'h9f))),
                      $signed($unsigned(wire2))} : wire2) * (~wire2[(3'h6):(3'h6)]));
              reg21 <= ((reg23[(1'h1):(1'h0)] ?
                  {$signed((8'ha1))} : (^((+reg21) ?
                      (reg21 ?
                          wire2 : reg18) : reg18))) && ((^~$signed((wire0 ~^ (8'haf)))) ^ $unsigned((-wire5))));
            end
          if ($signed(wire1[(3'h4):(2'h3)]))
            begin
              reg22 <= $signed((~reg25));
              reg23 <= (~reg18);
              reg24 <= $unsigned($signed(({$signed((8'hbe))} ?
                  ((reg25 && wire2) == (reg22 ?
                      wire2 : (8'hb8))) : $signed((wire1 & reg22)))));
              reg25 <= (wire5[(2'h3):(2'h3)] ?
                  ($signed($unsigned(wire0[(3'h4):(3'h4)])) >= (($unsigned(reg21) ?
                      (reg18 ?
                          reg21 : wire5) : $signed(wire0)) || $unsigned(wire2[(3'h5):(2'h3)]))) : reg25[(1'h0):(1'h0)]);
              reg26 <= ({({$signed(reg23)} ?
                          $signed($unsigned(reg19)) : wire15[(4'hc):(1'h0)])} ?
                  ((~&((wire4 ? reg21 : reg25) > $unsigned((8'ha2)))) ?
                      $signed(($unsigned(reg25) ?
                          (&reg19) : $unsigned(reg22))) : $signed(reg19)) : ($unsigned(((reg23 ?
                          wire0 : wire3) ?
                      {reg23} : {wire4,
                          reg22})) | (reg23 ~^ (wire5 >= (~^wire0)))));
            end
          else
            begin
              reg22 <= reg25;
              reg23 <= $signed($signed($signed((~|$signed((8'hb7))))));
              reg24 <= (((!$signed(wire3[(2'h3):(2'h2)])) >> (-(wire5[(4'hc):(2'h2)] ~^ (8'hae)))) ?
                  wire0 : reg22[(2'h3):(2'h3)]);
              reg25 <= (-{$signed($signed((~wire4))),
                  (+{$signed(reg23), $signed(wire5)})});
              reg26 <= (^~reg17);
            end
          reg27 <= ((~&({$unsigned(wire1)} && reg26[(1'h1):(1'h0)])) ?
              (&reg21) : ($signed($signed({wire4})) ? (8'h9e) : (~|wire2)));
        end
      reg28 <= (~$signed({($signed(wire3) ^~ (~&reg23))}));
      reg29 <= ($signed(wire1[(3'h5):(2'h3)]) >> wire2[(5'h12):(5'h12)]);
      reg30 <= ((reg24[(3'h4):(2'h2)] ?
              (wire2 ?
                  $unsigned($signed(reg21)) : ((wire0 ? reg27 : reg27) ?
                      reg29 : wire5[(2'h2):(2'h2)])) : $signed(reg19[(4'ha):(3'h7)])) ?
          wire1 : (|(+$unsigned(wire15[(2'h3):(1'h0)]))));
      reg31 <= $unsigned(reg25[(2'h3):(1'h1)]);
    end
  assign wire32 = wire4;
  assign wire33 = wire4[(4'hc):(3'h6)];
  assign wire34 = (wire2[(4'hb):(4'h9)] ^ {$signed(((~|(8'hb7)) ^~ (8'ha6)))});
  assign wire35 = (~|reg27);
  assign wire36 = (|(8'ha1));
  assign wire37 = $signed(reg31);
  assign wire38 = $signed(reg31[(4'ha):(4'h8)]);
  assign wire39 = $signed(reg24);
  assign wire40 = (~^wire32);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = {($signed(wire10[(3'h4):(3'h4)]) ?
                          wire9 : ($unsigned((wire9 ?
                              (8'ha3) : wire7)) * (^~(wire10 | wire8)))),
                      wire8};
  assign wire12 = ((^~(wire9[(3'h4):(2'h3)] << ((wire7 ? wire9 : wire10) ?
                          (8'ha5) : $signed(wire10)))) ?
                      $signed((|wire8[(4'h8):(3'h5)])) : (~$unsigned((wire10[(4'hf):(1'h1)] ?
                          $unsigned(wire8) : (wire9 ? wire7 : wire10)))));
  assign wire13 = (|(~|wire7));
  assign wire14 = ((wire7 ?
                          {($signed((8'haa)) < wire9[(1'h1):(1'h0)])} : wire12[(4'he):(4'he)]) ?
                      wire8 : wire9);
endmodule
