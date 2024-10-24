module top
#(parameter param30 = (+(+(^~((~(8'hb6)) < ((8'hb4) >> (8'haf)))))), 
parameter param31 = {(8'hb7), ((((param30 | param30) ? {param30, param30} : {param30}) ? ((param30 != param30) ? (^~param30) : (param30 * (8'haa))) : param30) && {((param30 ? param30 : param30) ? param30 : (param30 || param30)), {(^param30), param30}})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = ((8'had) == $unsigned((wire3[(2'h2):(1'h1)] ?
                     (~|$signed(wire2)) : (+wire3))));
  assign wire6 = $signed($signed((&$signed({(8'hb8), wire3}))));
  assign wire7 = $signed((~^{$unsigned(wire4)}));
  assign wire8 = wire6;
  assign wire9 = wire4[(2'h2):(1'h0)];
  assign wire10 = wire7[(2'h2):(2'h2)];
  assign wire11 = {wire3};
  assign wire12 = $unsigned($signed((wire7 << ($signed(wire5) ?
                      (wire5 ? wire6 : wire3) : (wire1 ? wire10 : (8'h9e))))));
  assign wire13 = {$signed({{(wire8 ? wire9 : wire7), $unsigned(wire6)},
                          wire12})};
  assign wire14 = (^~wire3[(1'h1):(1'h0)]);
  assign wire15 = $unsigned(($signed({((8'hbf) != wire12), $signed(wire8)}) ?
                      $signed(((wire5 || wire6) >= (wire0 ^ wire14))) : {{(wire13 ?
                                  wire9 : (8'ha8))}}));
  always
    @(posedge clk) begin
      reg16 <= ((8'hbd) ?
          (|((^(wire0 <= wire7)) >> wire5[(4'hc):(4'h8)])) : wire1);
      if (wire2)
        begin
          reg17 <= wire6[(1'h1):(1'h0)];
          reg18 <= $unsigned($unsigned((8'ha9)));
        end
      else
        begin
          if ((wire11[(4'h9):(3'h7)] & $signed($signed((~|wire11[(4'h8):(3'h4)])))))
            begin
              reg17 <= ((!$unsigned(wire6)) ^ $signed(((wire4 ?
                      (wire0 ~^ wire5) : $unsigned((8'hbf))) ?
                  {(reg17 ? reg16 : wire11),
                      $unsigned(reg17)} : $signed(wire8))));
              reg18 <= (!(~&(-$signed(((8'ha9) ? (8'haf) : reg16)))));
              reg19 <= $unsigned($signed(($signed(wire12) ?
                  (8'hbe) : ($unsigned(wire4) ?
                      (wire15 * reg16) : $signed(wire10)))));
              reg20 <= (((({(8'hb8), wire13} ?
                          (wire5 ? wire9 : wire2) : (wire11 ? wire5 : reg19)) ?
                      (~^(wire2 ?
                          wire8 : (8'h9c))) : ($signed(wire4) == ((8'haa) >> reg16))) ^~ {$signed($unsigned(wire7)),
                      wire5}) ?
                  $signed(({{(8'hb9)}} << (+(wire15 <= (8'hbf))))) : wire8[(1'h0):(1'h0)]);
            end
          else
            begin
              reg17 <= ((wire14 ?
                  ((wire10 ?
                      wire14[(4'hb):(4'hb)] : $unsigned((8'had))) - reg20[(2'h2):(1'h0)]) : $unsigned(((-reg17) ?
                      ((8'hb1) <= wire9) : (wire0 ?
                          wire8 : (8'hb6))))) & wire2[(3'h4):(2'h2)]);
              reg18 <= {wire6[(3'h4):(2'h2)],
                  (wire5 >> $unsigned((~(^wire11))))};
              reg19 <= $signed((wire3[(1'h1):(1'h0)] ?
                  wire0 : (wire7 ?
                      $signed((reg17 ?
                          wire9 : wire2)) : wire13[(3'h7):(3'h5)])));
              reg20 <= $unsigned(wire2);
              reg21 <= ({{(+wire11[(5'h12):(4'he)]), {((8'hb6) <= wire6)}}} ?
                  $unsigned((reg19[(3'h4):(3'h4)] ^ (wire1 ?
                      wire7 : $unsigned(wire8)))) : $unsigned(((^$unsigned(wire13)) ?
                      ((7'h43) ^~ wire10) : $unsigned((8'had)))));
            end
          reg22 <= wire3;
          reg23 <= $signed(($signed((-(^~reg22))) ?
              (wire5 ?
                  {$unsigned(wire14)} : ($signed(wire5) ?
                      $signed(wire9) : (~&wire1))) : ({$signed((8'hb6)),
                      $unsigned((8'hb7))} ?
                  {{wire6},
                      (!wire4)} : (reg18[(3'h6):(1'h0)] == $unsigned(wire7)))));
          if ($unsigned(((8'hb3) ? wire7 : (8'hba))))
            begin
              reg24 <= $unsigned(((wire8 & $unsigned(reg22[(4'hc):(4'h8)])) ?
                  (&$signed((reg16 ?
                      wire0 : wire5))) : ($unsigned((reg22 & wire5)) ?
                      $unsigned($signed(wire13)) : wire1[(1'h1):(1'h0)])));
              reg25 <= wire3;
            end
          else
            begin
              reg24 <= (+(~(((wire10 ? wire9 : wire11) ^ (wire5 ?
                      reg25 : reg22)) ?
                  wire13 : ((wire12 <<< reg16) ?
                      wire3[(1'h0):(1'h0)] : reg18[(1'h1):(1'h1)]))));
              reg25 <= wire12[(4'he):(4'ha)];
              reg26 <= $signed(($signed($unsigned({wire9, reg17})) <<< ({wire9,
                      wire9[(1'h0):(1'h0)]} ?
                  reg24[(5'h13):(2'h2)] : $unsigned($unsigned(wire12)))));
              reg27 <= reg25[(3'h6):(1'h1)];
              reg28 <= ((wire12[(4'h8):(1'h0)] ?
                      (~&wire4[(3'h7):(3'h7)]) : ((((8'hb1) | wire4) >> $unsigned(wire15)) ~^ ($unsigned(wire10) ^ (wire12 - reg16)))) ?
                  $unsigned({($unsigned(wire5) ?
                          $signed(wire3) : $signed(reg22)),
                      (~(reg20 ? wire6 : reg20))}) : reg17);
            end
          reg29 <= ((^({(~reg20)} ?
              $signed($unsigned(wire0)) : ($unsigned(reg25) ?
                  {(8'hba)} : {reg24,
                      wire4}))) != $unsigned(wire1[(3'h6):(3'h4)]));
        end
    end
endmodule
