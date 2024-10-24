module top
#(parameter param31 = (~&{(((|(8'hac)) == {(8'hb8)}) ? (~((8'ha6) <= (8'h9c))) : (((8'ha2) - (8'haf)) > (~|(8'hac)))), ((^(&(8'hb7))) ? (((8'h9e) ? (8'hae) : (8'hb6)) <= (8'h9f)) : ((~&(8'hb0)) >= (+(8'ha4))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (^~wire3[(4'h8):(3'h7)]);
  assign wire5 = wire2;
  assign wire6 = {$signed((+wire4))};
  assign wire7 = $unsigned($unsigned((wire0 ~^ {((8'hb6) ? wire0 : wire5),
                     (wire2 ? wire2 : wire4)})));
  assign wire8 = ({(^(wire4[(4'h8):(1'h1)] ? (wire0 << wire3) : (&wire7))),
                         {wire4}} ?
                     (~{wire1[(2'h2):(1'h1)]}) : {$signed((wire2 ^ wire5))});
  assign wire9 = $signed((!$signed($signed((wire6 ? wire0 : wire1)))));
  assign wire10 = wire6[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ((wire3 >> ((^$signed($unsigned(wire2))) ?
              (wire1 == $signed(((8'hb7) >> wire9))) : wire2)))
            begin
              reg11 <= $unsigned($unsigned({$unsigned($signed(wire7)),
                  $signed(wire10[(1'h1):(1'h0)])}));
              reg12 <= wire10[(1'h1):(1'h1)];
              reg13 <= (7'h41);
              reg14 <= $unsigned((&wire9));
            end
          else
            begin
              reg11 <= reg14;
              reg12 <= (((8'hbc) || ($unsigned($signed(wire5)) ?
                  {{wire8, wire4},
                      {reg14, reg13}} : wire5)) + $signed({($unsigned(wire3) ?
                      (8'hbd) : ((8'hb9) * reg12)),
                  (^(^~reg14))}));
              reg13 <= reg12;
            end
          reg15 <= (reg12[(3'h6):(3'h4)] ?
              $signed($unsigned($signed(wire8))) : reg13[(1'h0):(1'h0)]);
          if ((+((reg12 ?
              (8'ha1) : ($unsigned(wire2) ?
                  wire9[(3'h4):(1'h0)] : wire0[(1'h0):(1'h0)])) * ($unsigned(wire4) && wire0[(3'h4):(3'h4)]))))
            begin
              reg16 <= ((((~^reg12[(3'h6):(2'h2)]) > (~(!wire7))) ?
                  {(-$unsigned(wire6))} : (!((wire9 - wire5) & (wire5 ?
                      wire7 : wire2)))) ^~ $signed($signed(wire4)));
              reg17 <= $signed(((|{$unsigned(wire3)}) ?
                  (((+reg12) & $unsigned(reg15)) ?
                      (((8'hb3) ~^ wire3) ?
                          reg12[(4'hf):(3'h7)] : $unsigned(wire7)) : wire7[(2'h3):(1'h1)]) : {$signed(((8'hb8) + wire9))}));
              reg18 <= ((((~^((7'h40) < (8'ha2))) - ($signed((8'ha0)) ?
                          $unsigned((8'had)) : (wire4 ? (7'h42) : wire10))) ?
                      wire8[(4'h9):(3'h7)] : (|($signed(reg12) - $signed(wire7)))) ?
                  (({(~&reg12), (&reg12)} ?
                          wire6[(4'ha):(4'h9)] : $unsigned($unsigned(wire9))) ?
                      $unsigned($signed(wire1[(4'h8):(3'h6)])) : $signed((8'h9c))) : (&(~{reg14[(1'h0):(1'h0)]})));
            end
          else
            begin
              reg16 <= reg16;
            end
          reg19 <= (((reg16[(3'h6):(3'h4)] ^ $signed((reg16 ?
              wire5 : reg13))) != (8'had)) ^ ((~&({reg13} ?
                  $signed((8'hb9)) : {reg14})) ?
              ((^~(-wire2)) * wire4[(4'h9):(3'h6)]) : $unsigned(reg16[(5'h10):(1'h1)])));
        end
      else
        begin
          if (reg16)
            begin
              reg11 <= $signed({$unsigned({(reg16 ? reg14 : wire8)})});
              reg12 <= $unsigned(wire9[(4'ha):(1'h1)]);
              reg13 <= (~^reg11);
              reg14 <= reg17[(2'h3):(2'h2)];
            end
          else
            begin
              reg11 <= $unsigned(wire8);
              reg12 <= wire3;
            end
        end
      if (reg12)
        begin
          reg20 <= (reg19[(2'h2):(1'h1)] + wire7[(4'h9):(2'h2)]);
          reg21 <= reg14[(2'h2):(2'h2)];
          reg22 <= {reg12[(4'he):(4'hb)],
              $unsigned((reg19 ? wire3 : (wire1 != wire5[(1'h0):(1'h0)])))};
          reg23 <= reg17;
          reg24 <= reg11;
        end
      else
        begin
          reg20 <= wire7[(2'h2):(2'h2)];
        end
      reg25 <= ($unsigned(wire7) != $unsigned((($signed(wire4) ?
          {reg24,
              (8'hba)} : (-wire5)) & (((8'had) ~^ wire5) || (wire3 ^ wire0)))));
      reg26 <= {wire0};
    end
  assign wire27 = (8'h9c);
  assign wire28 = $signed((wire4 ?
                      ($unsigned(((8'hb2) ^ reg11)) ?
                          wire10 : $signed((reg12 ?
                              wire9 : wire5))) : $unsigned($unsigned(reg15[(2'h3):(2'h2)]))));
  assign wire29 = $unsigned((^reg15[(3'h4):(2'h2)]));
  assign wire30 = $signed($unsigned($unsigned((-wire1))));
endmodule
