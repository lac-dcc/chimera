module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  assign y = {wire43,
                 wire29,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg5,
                 reg6,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire4 = $signed({wire0, wire2});
  always
    @(posedge clk) begin
      reg5 <= {$unsigned(((-(wire2 >= (8'h9c))) ?
              $unsigned((wire0 ? wire3 : wire1)) : ($signed((8'ha9)) ?
                  $unsigned((7'h44)) : (~&wire3)))),
          wire4};
      reg6 <= (&wire2);
    end
  assign wire7 = $signed($unsigned((reg6[(3'h4):(2'h3)] ?
                     ((~|wire0) + $signed(wire1)) : $unsigned($signed((8'hb9))))));
  assign wire8 = {{$unsigned(($signed(wire3) ?
                             (wire3 - reg6) : (reg5 ? wire2 : wire0))),
                         $signed((^~$signed(wire3)))}};
  assign wire9 = (~&wire0);
  assign wire10 = (wire8[(2'h3):(1'h1)] & wire8[(1'h0):(1'h0)]);
  assign wire11 = wire2;
  assign wire12 = wire2;
  assign wire13 = $unsigned(reg5);
  always
    @(posedge clk) begin
      reg14 <= wire8[(1'h0):(1'h0)];
      if ($signed((wire7 ?
          ((wire11 <<< ((8'h9d) + wire13)) ?
              ((wire7 ?
                  reg5 : (8'ha6)) ^ {reg14}) : wire3) : (&(^~(~&wire4))))))
        begin
          reg15 <= $unsigned(($signed((8'hbe)) ?
              ($signed(wire13) >= $signed({wire1})) : (~|wire4[(1'h0):(1'h0)])));
          reg16 <= (^~wire11);
          reg17 <= (~&(($signed((wire13 ? wire9 : reg14)) ?
              wire2[(2'h3):(2'h2)] : $signed($signed(wire7))) * (((-wire0) ?
              wire13 : $signed(wire1)) - wire13[(4'h8):(3'h6)])));
          reg18 <= wire13[(2'h3):(2'h3)];
          if (reg17[(4'h8):(3'h6)])
            begin
              reg19 <= reg16[(3'h6):(3'h6)];
              reg20 <= wire0[(3'h4):(2'h3)];
              reg21 <= $signed($signed((wire9 << {((8'hb2) || wire3)})));
              reg22 <= (^((((reg20 ?
                      wire13 : (8'h9f)) <<< (wire9 >= reg5)) > ((-wire3) ?
                      (~reg5) : (wire8 ^ wire3))) ?
                  (^$signed((wire11 ?
                      reg14 : reg21))) : (~|reg21[(5'h12):(5'h12)])));
            end
          else
            begin
              reg19 <= wire9;
              reg20 <= (reg18 ?
                  $signed($unsigned(wire4)) : reg15[(3'h5):(1'h0)]);
              reg21 <= {(wire1 ~^ wire10[(4'he):(1'h0)]),
                  $unsigned(wire9[(3'h4):(2'h3)])};
              reg22 <= (~wire2[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg15 <= wire7;
          if (((|$unsigned(reg19[(1'h1):(1'h1)])) - (8'ha8)))
            begin
              reg16 <= reg17[(3'h7):(2'h2)];
              reg17 <= (reg5[(3'h6):(1'h1)] ?
                  (|((wire13[(3'h4):(2'h2)] ?
                          (reg19 ~^ reg16) : (reg22 ? wire10 : wire7)) ?
                      ($unsigned(wire8) ^~ $signed(wire7)) : wire7[(3'h7):(3'h5)])) : ((!((wire1 | (8'hb3)) >= (wire4 ?
                      wire3 : (8'haa)))) == {$unsigned($signed(wire7))}));
              reg18 <= (wire1 ?
                  $unsigned((~|reg21[(2'h3):(1'h1)])) : $signed($unsigned($unsigned((reg6 ~^ wire9)))));
            end
          else
            begin
              reg16 <= (($unsigned((&reg18[(3'h5):(2'h3)])) ?
                      $signed(((+wire1) ?
                          (reg14 ?
                              (8'hbd) : wire9) : reg16[(4'hb):(2'h2)])) : $unsigned(wire13[(1'h0):(1'h0)])) ?
                  ((((|wire9) ? (wire7 + (8'hb6)) : wire4[(2'h3):(2'h3)]) ?
                      reg18[(1'h0):(1'h0)] : reg21[(4'h8):(3'h6)]) | ((^(~|reg20)) ?
                      {reg5[(4'hf):(2'h3)]} : ((wire9 || wire11) ?
                          reg5[(4'ha):(4'h9)] : $unsigned(wire10)))) : (reg15[(3'h4):(3'h4)] >= reg20));
              reg17 <= (~(reg18[(2'h2):(2'h2)] ?
                  (8'hba) : ((~wire2) && {(reg20 == reg18), $signed(reg18)})));
              reg18 <= reg17;
              reg19 <= ((^(^(reg16 ^ (~reg5)))) | {($unsigned($signed(wire7)) ?
                      {wire8[(3'h6):(1'h0)],
                          (wire3 ?
                              wire4 : reg15)} : $signed(reg21[(4'hc):(3'h4)])),
                  $signed($signed($signed(reg15)))});
            end
          reg20 <= wire7;
          reg21 <= (wire10[(2'h2):(1'h0)] << $unsigned(reg21));
        end
      reg23 <= reg21;
      reg24 <= reg6;
      if (($signed((8'hb1)) ?
          $signed($unsigned(reg5[(3'h7):(1'h1)])) : $unsigned($unsigned({$signed(wire7),
              reg22}))))
        begin
          if ($unsigned($signed(wire13)))
            begin
              reg25 <= wire10[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= (wire11[(4'he):(2'h2)] ?
                  {($signed((^wire4)) ?
                          (reg25 ? reg24[(4'hb):(4'h8)] : {reg6}) : wire10),
                      ($unsigned({wire12}) > wire11[(4'hb):(4'h9)])} : {$unsigned({wire13[(3'h4):(3'h4)]})});
            end
          reg26 <= ($unsigned($signed(((reg19 ? reg24 : wire4) ?
                  wire10 : (~&wire11)))) ?
              wire3 : reg6);
          reg27 <= wire12[(4'hd):(1'h0)];
          reg28 <= (^~((wire9[(3'h4):(2'h3)] << $unsigned((+wire13))) >> ((!((8'ha0) * wire8)) - $signed((wire11 ?
              reg18 : reg18)))));
        end
      else
        begin
          if (((({reg20[(1'h0):(1'h0)]} > wire8[(1'h1):(1'h0)]) ^ (~|((wire1 ?
                      reg25 : wire3) ?
                  $signed(wire2) : reg27[(4'h9):(3'h6)]))) ?
              (8'hb3) : $unsigned(($unsigned((~|reg17)) >> $signed((wire10 ?
                  wire11 : reg5))))))
            begin
              reg25 <= ($signed(reg28) ~^ {wire9[(2'h2):(1'h0)],
                  wire0[(4'hb):(1'h1)]});
              reg26 <= $unsigned(wire0[(3'h4):(2'h3)]);
            end
          else
            begin
              reg25 <= (($unsigned(($unsigned((8'ha1)) ?
                  reg24[(5'h12):(4'he)] : $signed(wire13))) != $signed($signed((^reg14)))) != reg15[(5'h10):(4'ha)]);
              reg26 <= (reg18[(1'h0):(1'h0)] ?
                  wire4[(3'h5):(1'h1)] : $signed({$signed((reg6 != wire11))}));
            end
        end
    end
  assign wire29 = ({wire10[(4'ha):(4'ha)]} > (|$signed({((7'h43) ?
                          reg26 : wire1),
                      $unsigned(reg28)})));
  module30 #() modinst44 (.wire35(reg25), .wire32(reg6), .wire34(reg28), .wire33(wire10), .y(wire43), .wire31(wire11), .clk(clk));
endmodule

module module30
#(parameter param42 = (^((-(|((8'hb9) ? (8'ha7) : (8'ha2)))) & ((((7'h41) < (8'hba)) ? (|(8'hbc)) : (&(8'ha6))) ? (8'hb4) : {{(8'ha1), (7'h42)}, ((8'hb7) ? (8'haa) : (8'hba))}))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire [(5'h14):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = wire35;
  assign wire37 = ($signed({wire34[(2'h3):(1'h0)]}) ?
                      wire31 : {$unsigned((8'ha7))});
  assign wire38 = (|{($signed(wire33[(4'hd):(4'ha)]) ?
                          $unsigned((wire32 ?
                              (8'h9d) : wire37)) : ($unsigned(wire36) <= wire35[(3'h5):(1'h1)]))});
  assign wire39 = $signed(($signed((|(wire34 ? wire32 : wire37))) <<< wire36));
  assign wire40 = (|$signed({(!(wire34 ? wire37 : wire31))}));
  assign wire41 = ((~|$signed(($signed(wire37) ?
                          wire40[(4'hb):(4'hb)] : $unsigned((8'haf))))) ?
                      wire40[(4'h8):(3'h4)] : $signed(($signed((wire39 < wire37)) ?
                          $signed(wire36[(2'h2):(1'h0)]) : wire37)));
endmodule
