module top
#(parameter param29 = {(7'h43), ((~^(((8'hbe) << (8'hba)) >>> ((8'hb2) ? (8'ha6) : (8'ha8)))) ? (8'hbc) : ((((8'h9c) ? (8'ha2) : (8'hbf)) >= (^~(8'h9f))) && (((8'ha2) - (8'hba)) ? {(8'ha2), (8'ha7)} : ((8'hb0) ? (8'hac) : (8'hb6)))))}, 
parameter param30 = (({((param29 ? param29 : param29) ? {param29} : (~|param29))} ? (({param29} ^~ (|param29)) ? {{param29}, {param29}} : (((8'haa) <<< param29) ^ (param29 ? param29 : param29))) : param29) ? ({param29} & ((^{param29}) ? (-(!param29)) : (7'h42))) : param29))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed((wire1[(4'he):(4'hd)] >>> $signed((&(wire4 > wire3)))));
  always
    @(posedge clk) begin
      reg6 <= (^$unsigned(wire5));
      reg7 <= $unsigned(((8'ha0) - $signed($signed({(8'hba), wire3}))));
      reg8 <= ((~|(((+(7'h44)) > (^~wire5)) ?
              $unsigned({wire4}) : (^(wire3 ? (8'hbb) : wire4)))) ?
          ($signed(wire0[(1'h1):(1'h0)]) ?
              $unsigned(wire3[(1'h0):(1'h0)]) : {wire0[(3'h4):(3'h4)],
                  wire5}) : $signed(wire1[(5'h10):(3'h5)]));
      reg9 <= $unsigned({((((8'ha9) ? wire1 : (8'h9d)) ?
              $signed(reg8) : wire3) ~^ $signed((&wire2)))});
      reg10 <= wire0[(1'h1):(1'h1)];
    end
  assign wire11 = ((|((reg10 ? (wire5 + wire0) : wire5) ?
                      (|(wire1 ?
                          reg8 : (8'ha8))) : (wire4[(3'h6):(3'h5)] && wire2))) - reg9[(2'h2):(1'h1)]);
  assign wire12 = $signed($unsigned((wire0 <<< {wire2})));
  assign wire13 = $unsigned({($signed((reg6 >> (8'hbe))) ?
                          $unsigned(wire11[(3'h6):(2'h2)]) : $signed($signed(wire11))),
                      wire4});
  always
    @(posedge clk) begin
      reg14 <= reg6;
      reg15 <= $signed((wire0 ?
          $signed((wire2 >>> reg14[(1'h1):(1'h0)])) : (+(wire12 ?
              wire12[(2'h3):(1'h1)] : $signed(reg8)))));
      reg16 <= $signed(($unsigned(($unsigned(reg8) ?
          reg10 : (8'hac))) ^~ $signed({$unsigned((8'hbf))})));
      reg17 <= {wire12};
      if ($signed((({$signed((8'hba)), {(8'ha7), wire13}} == (~&wire4)) ?
          wire0[(1'h0):(1'h0)] : {($signed(reg16) < (&wire5))})))
        begin
          if ($unsigned($signed($signed(reg6[(3'h5):(3'h5)]))))
            begin
              reg18 <= wire3[(2'h2):(1'h1)];
              reg19 <= wire0[(2'h2):(1'h0)];
            end
          else
            begin
              reg18 <= {((wire13[(2'h2):(1'h1)] ? (^$signed(wire4)) : {reg14}) ?
                      wire11[(3'h5):(3'h4)] : (((wire0 == reg17) + (wire13 <= wire13)) - (^~$unsigned(wire4)))),
                  $unsigned({$signed((|reg19)), $signed({reg19})})};
              reg19 <= $unsigned($signed(wire11));
              reg20 <= wire11;
              reg21 <= wire13[(3'h6):(3'h6)];
            end
          reg22 <= wire2;
        end
      else
        begin
          if ({wire11,
              $signed((($unsigned(wire11) ?
                  ((8'hb1) ?
                      (8'hb1) : wire4) : reg22[(1'h0):(1'h0)]) | $unsigned((reg10 ?
                  wire0 : reg21))))})
            begin
              reg18 <= {{$signed($signed((reg10 * (8'ha5)))),
                      (|(~&wire13[(3'h6):(3'h4)]))},
                  (+(wire12[(2'h3):(1'h0)] ?
                      $unsigned(((8'hbf) - wire5)) : $signed($signed(reg18))))};
            end
          else
            begin
              reg18 <= wire11;
            end
        end
    end
  assign wire23 = $signed(reg8[(1'h1):(1'h0)]);
  assign wire24 = {((^($signed(wire1) ?
                              reg14[(1'h0):(1'h0)] : (wire3 ?
                                  (8'ha2) : (8'hbf)))) ?
                          (8'h9e) : wire1[(5'h12):(3'h6)])};
  assign wire25 = $signed((8'ha7));
  assign wire26 = ($signed({$signed((reg20 > wire2)),
                      (wire0 - (^~wire2))}) * {wire2[(1'h0):(1'h0)],
                      $unsigned((wire25[(3'h5):(3'h5)] ? {reg7} : {reg21}))});
  assign wire27 = ($signed((reg17[(4'hd):(3'h5)] ?
                          $signed(wire1[(3'h6):(2'h3)]) : $unsigned(reg16[(3'h7):(1'h1)]))) ?
                      reg22 : $unsigned((~&$signed((|reg22)))));
  assign wire28 = reg22;
endmodule
