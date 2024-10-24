module top
#(parameter param50 = (!({(8'hb1)} << {(((8'hb5) ? (8'hba) : (8'hb3)) - ((8'ha3) ? (7'h44) : (8'hae))), ((^(8'hb9)) ^ (+(8'hae)))})), 
parameter param51 = param50)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire2[(3'h4):(3'h4)] ? wire1[(2'h3):(2'h2)] : wire1);
      if (wire0)
        begin
          reg6 <= {$unsigned(wire0[(5'h10):(5'h10)]),
              ((({wire1,
                  wire3} | $unsigned(wire3)) ^~ (+(wire4 <<< wire4))) != $unsigned(($unsigned(wire3) ?
                  wire1[(2'h3):(1'h0)] : $unsigned(wire4))))};
          reg7 <= {$signed(wire1[(2'h3):(2'h3)])};
          reg8 <= ((wire0 * $signed(wire1)) || wire1[(2'h3):(1'h0)]);
          reg9 <= $unsigned(wire2[(1'h1):(1'h1)]);
        end
      else
        begin
          reg6 <= reg9;
          reg7 <= $unsigned((reg9 && ($signed(wire4) != reg5)));
          reg8 <= ((8'h9e) ?
              $unsigned($signed((|(~reg5)))) : ($unsigned(((wire2 ?
                  wire0 : (8'haa)) > {wire4})) >= {$unsigned($signed(wire1))}));
        end
      if (wire0)
        begin
          reg10 <= $unsigned((($unsigned((~wire4)) ?
                  $unsigned(reg7) : $signed((reg8 ? reg8 : reg8))) ?
              (^reg8) : $signed($signed($signed(wire0)))));
          reg11 <= (^($unsigned((^~(wire3 ?
              reg8 : wire2))) * {(wire1[(2'h3):(1'h1)] + $unsigned(wire3))}));
        end
      else
        begin
          if ((+$unsigned(((reg10 ?
              (wire0 <= reg7) : $signed(reg6)) >> (~^(~&reg10))))))
            begin
              reg10 <= $unsigned(reg11[(3'h5):(1'h1)]);
              reg11 <= ((reg10 <<< $unsigned((wire4 * $signed(reg11)))) ?
                  {{(8'ha3)}} : (reg10[(2'h2):(1'h0)] <= reg8[(1'h0):(1'h0)]));
            end
          else
            begin
              reg10 <= (wire0 ? $signed((~(~|wire0[(4'h9):(1'h0)]))) : wire3);
              reg11 <= reg6[(1'h1):(1'h1)];
              reg12 <= (reg6 ^ (|reg6[(2'h2):(1'h1)]));
              reg13 <= $unsigned(wire2);
            end
          if ($signed($signed($signed(((-wire1) != $unsigned(reg5))))))
            begin
              reg14 <= $signed(($unsigned(wire4[(4'he):(4'h9)]) - $unsigned((|(^~(8'hab))))));
              reg15 <= reg5[(4'he):(3'h4)];
            end
          else
            begin
              reg14 <= $signed(wire4);
              reg15 <= $unsigned({(8'had), reg6[(1'h0):(1'h0)]});
              reg16 <= reg8[(3'h5):(1'h1)];
            end
          if (reg10[(4'ha):(3'h4)])
            begin
              reg17 <= (8'ha8);
            end
          else
            begin
              reg17 <= ((+wire2) + ((~|{reg13,
                  (^(8'hac))}) + $signed(reg9[(1'h1):(1'h0)])));
              reg18 <= reg8;
              reg19 <= $signed(reg5);
              reg20 <= ((wire1 ?
                  reg7 : $signed(reg17)) != reg13[(1'h0):(1'h0)]);
              reg21 <= $signed(($signed(($unsigned(reg15) ^ wire3)) ?
                  ($signed((reg15 ? reg11 : (8'ha0))) ?
                      wire3[(3'h6):(1'h0)] : ((^~reg13) ?
                          (8'hb6) : wire0[(5'h10):(3'h4)])) : {{reg6[(2'h2):(1'h0)]}}));
            end
          if ((~(-reg19[(1'h1):(1'h0)])))
            begin
              reg22 <= ((^~reg11[(3'h4):(2'h3)]) ?
                  $unsigned(($signed((|reg15)) ?
                      $unsigned((wire1 ? wire0 : wire1)) : ((^~reg10) ?
                          (~|reg15) : {reg10}))) : reg15[(4'h8):(3'h6)]);
              reg23 <= reg19;
              reg24 <= ($unsigned(reg16[(3'h4):(2'h2)]) >>> (reg11 == {((reg14 ?
                      wire1 : (8'haf)) || (reg17 + reg5)),
                  reg13}));
            end
          else
            begin
              reg22 <= (reg19 ?
                  {({{reg12},
                          (8'hb9)} - $unsigned(wire0))} : reg17[(4'he):(3'h6)]);
              reg23 <= ((&$unsigned($signed((reg7 != reg11)))) > (^reg20));
            end
        end
    end
  assign wire25 = $signed({(7'h44)});
  assign wire26 = (reg22[(5'h13):(1'h0)] * ((!((reg11 ?
                          reg7 : reg11) >>> wire1[(1'h0):(1'h0)])) ?
                      (~$signed($unsigned(reg24))) : ($signed(((8'hbb) == wire3)) ?
                          (~(7'h41)) : ($unsigned(reg23) ?
                              $signed(reg19) : (wire2 ? reg5 : wire2)))));
  assign wire27 = ($signed($signed(reg7[(4'h8):(3'h6)])) | (^(reg17 >> ($unsigned(reg5) ?
                      $unsigned(reg13) : (wire3 == reg10)))));
  assign wire28 = {$unsigned({($unsigned(wire3) >>> {reg24, (8'hbb)})})};
  assign wire29 = reg13;
  assign wire30 = ($unsigned($unsigned(wire25)) && (^~(~^(8'ha8))));
  assign wire31 = (wire0[(3'h4):(3'h4)] ?
                      $unsigned({$unsigned((-reg23)),
                          (~(wire29 ?
                              reg14 : reg16))}) : (((~|$signed((8'hb3))) && reg9) ^ $unsigned(((wire26 ^~ reg5) ?
                          reg21[(3'h6):(1'h0)] : $signed(reg21)))));
  assign wire32 = reg22[(5'h14):(5'h12)];
  assign wire33 = (~|$unsigned(reg8));
  assign wire34 = reg5[(1'h1):(1'h1)];
  assign wire35 = (~|({$signed($signed(wire29)), {(-reg24)}} ? reg6 : reg11));
  assign wire36 = (+wire26);
  always
    @(posedge clk) begin
      if ((^~$signed(reg8)))
        begin
          reg37 <= {wire3, $unsigned(reg19[(3'h6):(2'h2)])};
          reg38 <= reg20;
          reg39 <= (~wire34);
          if (reg23[(5'h10):(4'he)])
            begin
              reg40 <= (&$signed(wire35));
              reg41 <= (~^$signed({$signed((reg17 <<< reg8))}));
              reg42 <= $unsigned($signed(reg14[(3'h5):(2'h2)]));
              reg43 <= $signed($unsigned($signed(reg19[(1'h0):(1'h0)])));
            end
          else
            begin
              reg40 <= $unsigned($signed(reg24));
              reg41 <= $unsigned($signed($unsigned(reg40)));
              reg42 <= ((~$signed(((8'ha8) ? (wire3 <<< reg39) : (|reg23)))) ?
                  {(!(~^$unsigned((8'hb4))))} : $unsigned((reg14[(2'h2):(1'h1)] ?
                      (wire25[(2'h2):(2'h2)] != reg41) : $unsigned({(8'hb7)}))));
            end
          reg44 <= ($unsigned(((wire25 ?
              (wire29 >> reg22) : $unsigned(wire29)) && reg15[(4'hd):(2'h2)])) <= wire28);
        end
      else
        begin
          reg37 <= $unsigned(wire26[(3'h4):(1'h0)]);
          reg38 <= wire4[(1'h0):(1'h0)];
        end
      reg45 <= (|reg39);
      reg46 <= (^~{wire25});
    end
  assign wire47 = (reg8[(2'h3):(2'h2)] << $unsigned((((~^reg9) ?
                      {reg45} : reg23) + $unsigned(reg8[(2'h2):(1'h0)]))));
  assign wire48 = $signed((({reg6[(1'h0):(1'h0)], wire32} ?
                      (reg43[(1'h1):(1'h1)] ~^ wire35[(3'h5):(2'h3)]) : $unsigned(reg13)) ^ reg39[(4'hf):(3'h7)]));
  assign wire49 = reg42;
endmodule
